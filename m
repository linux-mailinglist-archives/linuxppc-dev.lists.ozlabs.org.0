Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C875F5F8E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 05:22:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MjcDq2wJVz3cdy
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 14:22:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=HATWwbjf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MjcC063ygz3bqn
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Oct 2022 14:20:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=HATWwbjf;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MjcBt6xlwz4xGR;
	Thu,  6 Oct 2022 14:20:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1665026423;
	bh=LMSJpHYkOPSbg1prWCq1Up/E9XLsSbTvhtxLd2FdtnI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=HATWwbjfr2+OTf5zM/43aCvBHYb3KIiwPuxMjpfrzWkjhV6jIz+l8ysKFIaBt84sT
	 aqAtrpbR0yZ7B4D2vicTTqrghe1OpJS3xauNhY5ByjK4zeeplqDMhHiGvfF0DnQHQi
	 dEUECjsFP2ht8a87H+gBkBwRjKZLha/PTeeDcCmjjvHrk62F8G4FAg7sKAMBuAn2K0
	 v8XmRIyV579nrsFlFO+LiQQUMrejRxgXH1xyNaDW6fCk+z84S433TIAqJ6yPCyyQqs
	 3wNidPVh+3Fz3hnZsgBYynqlGYFGCKUPDwEJqvfiUparg2024l4v6zvHnkL9MY72l9
	 uefdXklkdcHrQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 2/2] powerpc: Print instruction dump on a single line
Date: Thu,  6 Oct 2022 14:20:19 +1100
Message-Id: <20221006032019.1128624-2-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221006032019.1128624-1-mpe@ellerman.id.au>
References: <20221006032019.1128624-1-mpe@ellerman.id.au>
MIME-Version: 1.0
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Although the previous commit made the powerpc instruction dump usable
with scripts/decodecode, there are still some problems.

Because the dump is split across multiple lines, the script doesn't cope
with printk timestamps or caller info.

That can be fixed by printing the entire dump on one line, eg:

  [   12.016307][  T112] --- interrupt: c00
  [   12.016605][  T112] Code: 4b7aae15 60000000 3d22016e 3c62ffec 39291160 38639bc0 e8890000 4b7aadf9 60000000 4bfffee8 7c0802a6 60000000 <0fe00000> 60420000 3c4c008f 384268a0
  [   12.017655][  T112] ---[ end trace 0000000000000000 ]---

That output can then be piped directly into scripts/decodecode and
interpreted correctly.

Printing the dump on a single line does produce a very long line, about
173 characters. That is still shorter than x86, which prints nearly 200
characters even without timestamps etc.

All consoles I'm aware of will wrap the line if it's too long, so the
length should not be a functional problem. If anything it should help on
consoles like VGA by using less vertical space.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/process.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 1d22a539d45c..49f82108bf41 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1359,7 +1359,7 @@ static void show_instructions(struct pt_regs *regs)
 	unsigned long nip = regs->nip;
 	unsigned long pc = regs->nip - (NR_INSN_TO_PRINT * 3 / 4 * sizeof(int));
 
-	printk("Code:");
+	printk("Code: ");
 
 	/*
 	 * If we were executing with the MMU off for instructions, adjust pc
@@ -1373,9 +1373,6 @@ static void show_instructions(struct pt_regs *regs)
 	for (i = 0; i < NR_INSN_TO_PRINT; i++) {
 		int instr;
 
-		if (!(i % 8))
-			pr_cont("\n");
-
 		if (!__kernel_text_address(pc) ||
 		    get_kernel_nofault(instr, (const void *)pc)) {
 			pr_cont("XXXXXXXX ");
-- 
2.37.3

