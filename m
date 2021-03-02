Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E70329D85
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Mar 2021 13:01:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DqbML4zfGz3fCg
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Mar 2021 23:01:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AkwBFiJk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=AkwBFiJk; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DqbJ66qQqz3dYB
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Mar 2021 22:58:46 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A5B7764FA5;
 Tue,  2 Mar 2021 11:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614686325;
 bh=/Fw9ccn6NgJqj2TQu4mdRDduD3G3tdF7qP5XJR3ZUww=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AkwBFiJkKOGY3CwPS8upqpJd5AIgign1mSdmmIvL1nLCPj0ZKE/2ADv9ACuPX77Mx
 oDZ46LLVrc7gvMcf2+MpE93GB63RXN1ISVpxJZEhgh8coY1Ht1wYy1zLx7NTDCarcL
 co2W3a09rHDBD7lVUOuokfY/vvs/dYPO6C/Hh0hkPtdYydyV03qvSFi2P6J7pMsOar
 RsGwa3c9fVWC00zWU+IRB5H2o8kJjXHbAfmhvi7OTZ5ApAGACq9yoia9kUYkpGzEh5
 heXQk2vl43Zl+AxSxvXjy7aPj2PoPMyIO9AfOePgUMMHZY19S78MYN3vRZpOIcnihE
 TY5jDX8pNAoEA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 07/21] powerpc: improve handling of unrecoverable
 system reset
Date: Tue,  2 Mar 2021 06:58:21 -0500
Message-Id: <20210302115835.63269-7-sashal@kernel.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210302115835.63269-1-sashal@kernel.org>
References: <20210302115835.63269-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nicholas Piggin <npiggin@gmail.com>

[ Upstream commit 11cb0a25f71818ca7ab4856548ecfd83c169aa4d ]

If an unrecoverable system reset hits in process context, the system
does not have to panic. Similar to machine check, call nmi_exit()
before die().

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20210130130852.2952424-26-npiggin@gmail.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/kernel/traps.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index 1b2d84cb373b..2379c4bf3979 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -433,8 +433,11 @@ out:
 		die("Unrecoverable nested System Reset", regs, SIGABRT);
 #endif
 	/* Must die if the interrupt is not recoverable */
-	if (!(regs->msr & MSR_RI))
+	if (!(regs->msr & MSR_RI)) {
+		/* For the reason explained in die_mce, nmi_exit before die */
+		nmi_exit();
 		die("Unrecoverable System Reset", regs, SIGABRT);
+	}
 
 	if (!nested)
 		nmi_exit();
-- 
2.30.1

