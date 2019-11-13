Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F4BFA720
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 04:19:20 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47CVFw6v5TzF4M4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 14:19:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="mUx/Twj8"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47CSVZ5TmMzF5K2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2019 13:00:06 +1100 (AEDT)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DB5412053B;
 Wed, 13 Nov 2019 02:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573610404;
 bh=ZxkIgG+Oa+kY1HAulN5VVJ7/HOzwWg4gtRjfk+JdGC0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mUx/Twj8ujOA6mNG/pcQLbUGk5gN2SJsuym/ZqF6pTeCZHSGIgFFrs+kingUFarnY
 WG0wN7X5WL1+EeEUjcilB/SPq4pT9m8C7uLze+ble7xF5uu32b0D7oaJXv3rxwgVZc
 awo7EQUN4WaItWj8tgdO0vGNTMASi8vu6sN8kZts=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 20/68] powerpc/pseries: Fix how we iterate over
 the DTL entries
Date: Tue, 12 Nov 2019 20:58:44 -0500
Message-Id: <20191113015932.12655-20-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191113015932.12655-1-sashal@kernel.org>
References: <20191113015932.12655-1-sashal@kernel.org>
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
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>

[ Upstream commit 9258227e9dd1da8feddb07ad9702845546a581c9 ]

When CONFIG_VIRT_CPU_ACCOUNTING_NATIVE is not set, we look up dtl_idx in
the lppaca to determine the number of entries in the buffer. Since
lppaca is in big endian, we need to do an endian conversion before using
this in our calculation to determine the number of entries in the
buffer. Without this, we do not iterate over the existing entries in the
DTL buffer properly.

Fixes: 7c105b63bd98 ("powerpc: Add CONFIG_CPU_LITTLE_ENDIAN kernel config option.")
Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/platforms/pseries/dtl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/dtl.c b/arch/powerpc/platforms/pseries/dtl.c
index 37de83c5ef172..7a4d172c93765 100644
--- a/arch/powerpc/platforms/pseries/dtl.c
+++ b/arch/powerpc/platforms/pseries/dtl.c
@@ -185,7 +185,7 @@ static void dtl_stop(struct dtl *dtl)
 
 static u64 dtl_current_index(struct dtl *dtl)
 {
-	return lppaca_of(dtl->cpu).dtl_idx;
+	return be64_to_cpu(lppaca_of(dtl->cpu).dtl_idx);
 }
 #endif /* CONFIG_VIRT_CPU_ACCOUNTING_NATIVE */
 
-- 
2.20.1

