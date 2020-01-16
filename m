Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CF413E95E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 18:37:39 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47zBGm1mBvzDqWl
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jan 2020 04:37:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=okHWbA6w; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47z9Tc6LbrzDqbB
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jan 2020 04:01:56 +1100 (AEDT)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 02CEE21582;
 Thu, 16 Jan 2020 17:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579194114;
 bh=YQ/Hcyv+U1F9awMquJDtHPpWKxuAbPdy3YF5Mp56J9o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=okHWbA6wXlGlsJ4rqusMjuzWgrtmD2JPeVrc6MGyVmdRYcbtPmJ+GY7DrkzIlgxuF
 EI7B+PMmDs3wkQ1kGJSNCt/rMMJsHhoao5qzitdMofd+QXXXVoL4z0I8EobcrcnL6w
 TdqjHTloCOr9O9n8MnMsKO2+QCW7MMrICWYch4vE=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 210/671] powerpc/64s: Fix logic when handling
 unknown CPU features
Date: Thu, 16 Jan 2020 11:51:59 -0500
Message-Id: <20200116165940.10720-93-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116165940.10720-1-sashal@kernel.org>
References: <20200116165940.10720-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Sasha Levin <sashal@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 Andrew Donnellan <andrew.donnellan@au1.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Michael Ellerman <mpe@ellerman.id.au>

[ Upstream commit 8cfaf106918a8c13abb24c641556172afbb9545c ]

In cpufeatures_process_feature(), if a provided CPU feature is unknown and
enable_unknown is false, we erroneously print that the feature is being
enabled and return true, even though no feature has been enabled, and
may also set feature bits based on the last entry in the match table.

Fix this so that we only set feature bits from the match table if we have
actually enabled a feature from that table, and when failing to enable an
unknown feature, always print the "not enabling" message and return false.

Coincidentally, some older gccs (<GCC 7), when invoked with
-fsanitize-coverage=trace-pc, cause a spurious uninitialised variable
warning in this function:

  arch/powerpc/kernel/dt_cpu_ftrs.c: In function ‘cpufeatures_process_feature’:
  arch/powerpc/kernel/dt_cpu_ftrs.c:686:7: warning: ‘m’ may be used uninitialized in this function [-Wmaybe-uninitialized]
    if (m->cpu_ftr_bit_mask)

An upcoming patch will enable support for kcov, which requires this option.
This patch avoids the warning.

Fixes: 5a61ef74f269 ("powerpc/64s: Support new device tree binding for discovering CPU features")
Reported-by: Segher Boessenkool <segher@kernel.crashing.org>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
[ajd: add commit message]
Signed-off-by: Andrew Donnellan <andrew.donnellan@au1.ibm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/kernel/dt_cpu_ftrs.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/kernel/dt_cpu_ftrs.c b/arch/powerpc/kernel/dt_cpu_ftrs.c
index c6f41907f0d7..a4b31e17492d 100644
--- a/arch/powerpc/kernel/dt_cpu_ftrs.c
+++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
@@ -666,8 +666,10 @@ static bool __init cpufeatures_process_feature(struct dt_cpu_feature *f)
 		m = &dt_cpu_feature_match_table[i];
 		if (!strcmp(f->name, m->name)) {
 			known = true;
-			if (m->enable(f))
+			if (m->enable(f)) {
+				cur_cpu_spec->cpu_features |= m->cpu_ftr_bit_mask;
 				break;
+			}
 
 			pr_info("not enabling: %s (disabled or unsupported by kernel)\n",
 				f->name);
@@ -675,17 +677,12 @@ static bool __init cpufeatures_process_feature(struct dt_cpu_feature *f)
 		}
 	}
 
-	if (!known && enable_unknown) {
-		if (!feat_try_enable_unknown(f)) {
-			pr_info("not enabling: %s (unknown and unsupported by kernel)\n",
-				f->name);
-			return false;
-		}
+	if (!known && (!enable_unknown || !feat_try_enable_unknown(f))) {
+		pr_info("not enabling: %s (unknown and unsupported by kernel)\n",
+			f->name);
+		return false;
 	}
 
-	if (m->cpu_ftr_bit_mask)
-		cur_cpu_spec->cpu_features |= m->cpu_ftr_bit_mask;
-
 	if (known)
 		pr_debug("enabling: %s\n", f->name);
 	else
-- 
2.20.1

