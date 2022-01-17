Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4265490F5B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jan 2022 18:24:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JczKl58Gzz3gZJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jan 2022 04:24:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dVsv76Pd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=dVsv76Pd; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JcytT1CNsz3drL
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jan 2022 04:04:17 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 857C361248;
 Mon, 17 Jan 2022 17:04:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C335C36AE3;
 Mon, 17 Jan 2022 17:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642439055;
 bh=/+mI8nrRREij5JDaj6gEO/h76K+KA7kZdaVgSdBD+Fk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dVsv76PdfL85BNfIIMuuvjsXV4RASKkUDiCXtjHT0ZjP33ysKuNA8qTOv2qrWDg4B
 d1p5p6MI+fKSOEHM8pJwF2LZ31jy7lgpUy1okFDbjXP/YBR98DWePoj7776a68Ouba
 k9mzt3wt1EjhYI9eigg99/n6LWLvq/n2zlORcff3w9j4buR5ChOSclr8V+cXW+ZxAO
 4b/tWNZs1T74jBTnf6qvD03i1GXPD8SNBhRkI9c3NYny74R3SkEt7pTnVRHZstc6yl
 P9B+7xpw6vEBFIMHKQromLtazaruGrWNXvK1KtrVLwBHObi26BJ+ABrTEVn6T9TooB
 uGKupCLwr+nhg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 22/34] selftests/powerpc/spectre_v2: Return skip
 code when miss_percent is high
Date: Mon, 17 Jan 2022 12:03:12 -0500
Message-Id: <20220117170326.1471712-22-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220117170326.1471712-1-sashal@kernel.org>
References: <20220117170326.1471712-1-sashal@kernel.org>
MIME-Version: 1.0
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
Cc: Sasha Levin <sashal@kernel.org>,
 Thadeu Lima de Souza Cascardo <cascardo@canonical.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org,
 shuah@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>

[ Upstream commit 3c42e9542050d49610077e083c7c3f5fd5e26820 ]

A mis-match between reported and actual mitigation is not restricted to the
Vulnerable case. The guest might also report the mitigation as "Software
count cache flush" and the host will still mitigate with branch cache
disabled.

So, instead of skipping depending on the detected mitigation, simply skip
whenever the detected miss_percent is the expected one for a fully
mitigated system, that is, above 95%.

Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20211207130557.40566-1-cascardo@canonical.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/testing/selftests/powerpc/security/spectre_v2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/powerpc/security/spectre_v2.c b/tools/testing/selftests/powerpc/security/spectre_v2.c
index adc2b7294e5fd..83647b8277e7d 100644
--- a/tools/testing/selftests/powerpc/security/spectre_v2.c
+++ b/tools/testing/selftests/powerpc/security/spectre_v2.c
@@ -193,7 +193,7 @@ int spectre_v2_test(void)
 			 * We are not vulnerable and reporting otherwise, so
 			 * missing such a mismatch is safe.
 			 */
-			if (state == VULNERABLE)
+			if (miss_percent > 95)
 				return 4;
 
 			return 1;
-- 
2.34.1

