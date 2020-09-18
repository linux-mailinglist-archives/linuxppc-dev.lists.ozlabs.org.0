Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0419026EEBE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Sep 2020 04:30:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BsyVp4mrYzDqDd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Sep 2020 12:30:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=wT9TdVtj; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bsxz81S7pzDqjW
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Sep 2020 12:06:44 +1000 (AEST)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B7F3323888;
 Fri, 18 Sep 2020 02:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600394801;
 bh=Yrp0izKS9oOY/IRZAj6y24s8B44W/wunpiMFYqCWDHg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=wT9TdVtjzzkIGiIvsbc2Cyij4kRTP85MiJf0gue2hz63nrQAEyqvKYVmvqFklpnJI
 rNrKGm2hDrzhIpOp0UvZdvkOwBqSkRIC64q4L+lGeMesjvZUaJQYxRby3UGEuBacm6
 +tgzqclpulzUR1fQYlvw2yKyE9vH1ncvLAM7wbpY=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 270/330] powerpc/traps: Make unrecoverable NMIs
 die instead of panic
Date: Thu, 17 Sep 2020 22:00:10 -0400
Message-Id: <20200918020110.2063155-270-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200918020110.2063155-1-sashal@kernel.org>
References: <20200918020110.2063155-1-sashal@kernel.org>
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>, Sasha Levin <sashal@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nicholas Piggin <npiggin@gmail.com>

[ Upstream commit 265d6e588d87194c2fe2d6c240247f0264e0c19b ]

System Reset and Machine Check interrupts that are not recoverable due
to being nested or interrupting when RI=0 currently panic. This is not
necessary, and can often just kill the current context and recover.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Reviewed-by: Christophe Leroy <christophe.leroy@c-s.fr>
Link: https://lore.kernel.org/r/20200508043408.886394-16-npiggin@gmail.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/kernel/traps.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index 014ff0701f245..9432fc6af28a5 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -510,11 +510,11 @@ out:
 #ifdef CONFIG_PPC_BOOK3S_64
 	BUG_ON(get_paca()->in_nmi == 0);
 	if (get_paca()->in_nmi > 1)
-		nmi_panic(regs, "Unrecoverable nested System Reset");
+		die("Unrecoverable nested System Reset", regs, SIGABRT);
 #endif
 	/* Must die if the interrupt is not recoverable */
 	if (!(regs->msr & MSR_RI))
-		nmi_panic(regs, "Unrecoverable System Reset");
+		die("Unrecoverable System Reset", regs, SIGABRT);
 
 	if (saved_hsrrs) {
 		mtspr(SPRN_HSRR0, hsrr0);
@@ -858,7 +858,7 @@ void machine_check_exception(struct pt_regs *regs)
 
 	/* Must die if the interrupt is not recoverable */
 	if (!(regs->msr & MSR_RI))
-		nmi_panic(regs, "Unrecoverable Machine check");
+		die("Unrecoverable Machine check", regs, SIGBUS);
 
 	return;
 
-- 
2.25.1

