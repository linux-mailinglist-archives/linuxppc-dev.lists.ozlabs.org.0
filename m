Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C0FF94F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 14:54:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44thLC6crmzDqDP
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 22:54:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="a94U8JQh"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44th0j0BdmzDqNH
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 22:39:01 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 44th0Y37T2z9vD37;
 Tue, 30 Apr 2019 14:38:53 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=a94U8JQh; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Zldjo-wUhghH; Tue, 30 Apr 2019 14:38:53 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 44th0Y25glz9vD30;
 Tue, 30 Apr 2019 14:38:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1556627933; bh=fJwNdDqiAlgoT/1EYCI/ynpZSPt+QfYdJMVJTkDRues=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=a94U8JQhsfGHOwgZCFEyFb095ZF0o+BAYoYYbOQ51rNstYTIYRpGelTbZOqAuX3HT
 p6MNrhx3THhNUjOdVo1iqHDeEO/WZqk9O2xIzXcF8mZ7TAYYmL6+v7aLLwnZ9J69p8
 teBVMz3Kpcfm11cswGg4iqim66795081WBq4OpH8=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A852C8B8DF;
 Tue, 30 Apr 2019 14:38:54 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id sSmxUIjT8ufW; Tue, 30 Apr 2019 14:38:54 +0200 (CEST)
Received: from po16846vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7BA988B8C2;
 Tue, 30 Apr 2019 14:38:54 +0200 (CEST)
Received: by po16846vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 49E78666F8; Tue, 30 Apr 2019 12:38:54 +0000 (UTC)
Message-Id: <1a636829bc94403fbf939ad80f5b302f5e08f7e7.1556627571.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1556627571.git.christophe.leroy@c-s.fr>
References: <cover.1556627571.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v3 05/16] powerpc/40x: add exception frame marker
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>
Date: Tue, 30 Apr 2019 12:38:54 +0000 (UTC)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch adds STACK_FRAME_REGS_MARKER in the stack at exception entry
in order to see interrupts in call traces as below:

[    0.013964] Call Trace:
[    0.014014] [c0745db0] [c007a9d4] tick_periodic.constprop.5+0xd8/0x104 (unreliable)
[    0.014086] [c0745dc0] [c007aa20] tick_handle_periodic+0x20/0x9c
[    0.014181] [c0745de0] [c0009cd0] timer_interrupt+0xa0/0x264
[    0.014258] [c0745e10] [c000e484] ret_from_except+0x0/0x14
[    0.014390] --- interrupt: 901 at console_unlock.part.7+0x3f4/0x528
[    0.014390]     LR = console_unlock.part.7+0x3f0/0x528
[    0.014455] [c0745ee0] [c0050334] console_unlock.part.7+0x114/0x528 (unreliable)
[    0.014542] [c0745f30] [c00524e0] register_console+0x3d8/0x44c
[    0.014625] [c0745f60] [c0675aac] cpm_uart_console_init+0x18/0x2c
[    0.014709] [c0745f70] [c06614f4] console_init+0x114/0x1cc
[    0.014795] [c0745fb0] [c0658b68] start_kernel+0x300/0x3d8
[    0.014864] [c0745ff0] [c00022cc] start_here+0x44/0x98

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/kernel/head_40x.S | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/powerpc/kernel/head_40x.S b/arch/powerpc/kernel/head_40x.S
index f49b0278e995..cb95a5c17cea 100644
--- a/arch/powerpc/kernel/head_40x.S
+++ b/arch/powerpc/kernel/head_40x.S
@@ -132,6 +132,9 @@ _ENTRY(saved_ksp_limit)
 	tovirt(r1,r11);			/* set new kernel sp */	\
 	rlwinm	r9,r9,0,14,12;		/* clear MSR_WE (necessary?)	   */\
 	stw	r0,GPR0(r11);						     \
+	lis	r10, STACK_FRAME_REGS_MARKER@ha; /* exception frame marker */\
+	addi	r10, r10, STACK_FRAME_REGS_MARKER@l;			     \
+	stw	r10, 8(r11);						     \
 	SAVE_4GPRS(3, r11);						     \
 	SAVE_2GPRS(7, r11)
 
@@ -174,6 +177,9 @@ _ENTRY(saved_ksp_limit)
 	tovirt(r1,r11);							     \
 	rlwinm	r9,r9,0,14,12;		/* clear MSR_WE (necessary?)	   */\
 	stw	r0,GPR0(r11);						     \
+	lis	r10, STACK_FRAME_REGS_MARKER@ha; /* exception frame marker */\
+	addi	r10, r10, STACK_FRAME_REGS_MARKER@l;			     \
+	stw	r10, 8(r11);						     \
 	SAVE_4GPRS(3, r11);						     \
 	SAVE_2GPRS(7, r11)
 
-- 
2.13.3

