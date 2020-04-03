Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF5219D75B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 15:14:28 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48v0l36QrjzDqfq
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Apr 2020 00:14:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=VOPbLLUH; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48v0fc3mqDzDsND
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Apr 2020 00:10:32 +1100 (AEDT)
Received: by mail-pg1-x544.google.com with SMTP id k5so3503404pga.2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Apr 2020 06:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NhrHt3+FHP7W0PGZF1oE4XQ7JLwioep3ZSATBDmZUCk=;
 b=VOPbLLUHg0dEviS1muEfjvUwYV9lVBnHjw8z4vfQatdddnEuVbkqMhBO6Wwb5W/mZH
 WhL90+B1mjMZ3FomxXrgAUXwAGs73Lip71T0xLoxdp/VWLt02tmNc+BIubzwpB8dedHb
 PZUbJWe2gIeUO9en+mNaArFxuVidkcCnMXZYQrExEdzs7mISxaOsEerO+a/I6IGYE8J5
 mBfiwK/KJhd6wCS9Gzr6mNjFuk1Vc376ZLlmcoGFuq3amKdkb1mT4cMX3gukKP+4Ut4k
 yDY9SnE4UM8acSc1YSWkxWQf0bo40KDLuMF0H6hPE+W9FNq6Mg8ARARfEEdwDC+/6sGt
 DXBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NhrHt3+FHP7W0PGZF1oE4XQ7JLwioep3ZSATBDmZUCk=;
 b=Nc37hF+RltGPxGZqoW/JbkSD/iYcl5CPG0fL9eGYyU3CmMW6+xTFYF5JVsOBlw0ysX
 kWgkzpqErzd+YBWbsJc6cYFHTSsimTpl+q0mSUpltsnEb+Q0JV/ePOg9+vnIo82p6hff
 KbQtxQlukuOknoMY/bAxYlP2IcABqpaUfxHjW80PgwkmoskkdnjSrlq43Aw+3ySzbwhO
 yp+0ErcAO59eQami2DnklA/jZUumOkd9nhTD8UKo8A55zJr38w04o4CYIZ52qZwHPP/v
 i3gJlpiAA2X8/LrY5iVfnK1rE2+EYxnGTNjPiZQGe8j51DuSmyvuIFDcPd3+p8Muv/wP
 EAmw==
X-Gm-Message-State: AGi0PuYmm5eDPyyz+lTJztbfM9DSm54hAHv8x5GMUDo2DktJg+stwqXg
 btKL3Pd9kCxo0bWxrxn8fIC29Klt
X-Google-Smtp-Source: APiQypLGqCvLrCM+ZnrB9uOuA3YISyw6ezMWllyKHJt3ndcFS3+WasNwdgy45wzAJSHYqUIiiqDFlQ==
X-Received: by 2002:aa7:9f11:: with SMTP id g17mr8456733pfr.224.1585919428390; 
 Fri, 03 Apr 2020 06:10:28 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (60-241-117-97.tpgi.com.au. [60.241.117.97])
 by smtp.gmail.com with ESMTPSA id q6sm5743499pja.34.2020.04.03.06.10.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2020 06:10:25 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc: improve ppc_save_regs
Date: Fri,  3 Apr 2020 23:10:05 +1000
Message-Id: <20200403131006.123243-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Make ppc_save_regs a bit more useful:
- Set NIP to our caller rather rather than the caller's caller (which is
  what we save to LR in the stack frame).
- Set SOFTE to the current irq soft-mask state rather than
  uninitialised.
- Zero CFAR rather than leave it uninitialised.

In qemu, injecting a nmi to an idle CPU gives a nicer stack trace (note
NIP, IRQMASK, CFAR).

  Oops: System Reset, sig: 6 [#1]
  LE PAGE_SIZE=64K MMU=Hash PREEMPT SMP NR_CPUS=2048 NUMA PowerNV
  Modules linked in:
  CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.6.0-rc2-00429-ga76e38fd80bf #1277
  NIP:  c0000000000b6e5c LR: c0000000000b6e5c CTR: c000000000b06270
  REGS: c00000000173fb08 TRAP: 0100   Not tainted
  MSR:  9000000000001033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28000224  XER: 00000000
  CFAR: c0000000016a2128 IRQMASK: c00000000173fc80
  GPR00: c0000000000b6e5c c00000000173fc80 c000000001743400 c00000000173fb08
  GPR04: 0000000000000000 0000000000000000 0000000000000008 0000000000000001
  GPR08: 00000001fea80000 0000000000000000 0000000000000000 ffffffffffffffff
  GPR12: c000000000b06270 c000000001930000 00000000300026c0 0000000000000000
  GPR16: 0000000000000000 0000000000000000 0000000000000003 c0000000016a2128
  GPR20: c0000001ffc97148 0000000000000001 c000000000f289a8 0000000000080000
  GPR24: c0000000016e1480 000000011dc870ba 0000000000000000 0000000000000003
  GPR28: c0000000016a2128 c0000001ffc97148 c0000000016a2260 0000000000000003
  NIP [c0000000000b6e5c] power9_idle_type+0x5c/0x70
  LR [c0000000000b6e5c] power9_idle_type+0x5c/0x70
  Call Trace:
  [c00000000173fc80] [c0000000000b6e5c] power9_idle_type+0x5c/0x70 (unreliable)
  [c00000000173fcb0] [c000000000b062b0] stop_loop+0x40/0x60
  [c00000000173fce0] [c000000000b022d8] cpuidle_enter_state+0xa8/0x660
  [c00000000173fd60] [c000000000b0292c] cpuidle_enter+0x4c/0x70
  [c00000000173fda0] [c00000000017624c] call_cpuidle+0x4c/0x90
  [c00000000173fdc0] [c000000000176768] do_idle+0x338/0x460
  [c00000000173fe60] [c000000000176b3c] cpu_startup_entry+0x3c/0x40
  [c00000000173fe90] [c0000000000126b4] rest_init+0x124/0x140
  [c00000000173fed0] [c0000000010948d4] start_kernel+0x938/0x988
  [c00000000173ff90] [c00000000000cdcc] start_here_common+0x1c/0x20

  Oops: System Reset, sig: 6 [#1]
  LE PAGE_SIZE=64K MMU=Hash PREEMPT SMP NR_CPUS=2048 NUMA PowerNV
  Modules linked in:
  CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.6.0-rc2-00430-gddce91b8712f #1278
  NIP:  c00000000001d150 LR: c0000000000b6e5c CTR: c000000000b06270
  REGS: c00000000173fb08 TRAP: 0100   Not tainted
  MSR:  9000000000001033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28000224  XER: 00000000
  CFAR: 0000000000000000 IRQMASK: 1
  GPR00: c0000000000b6e5c c00000000173fc80 c000000001743400 c00000000173fb08
  GPR04: 0000000000000000 0000000000000000 0000000000000008 0000000000000001
  GPR08: 00000001fea80000 0000000000000000 0000000000000000 ffffffffffffffff
  GPR12: c000000000b06270 c000000001930000 00000000300026c0 0000000000000000
  GPR16: 0000000000000000 0000000000000000 0000000000000003 c0000000016a2128
  GPR20: c0000001ffc97148 0000000000000001 c000000000f289a8 0000000000080000
  GPR24: c0000000016e1480 00000000b68db8ce 0000000000000000 0000000000000003
  GPR28: c0000000016a2128 c0000001ffc97148 c0000000016a2260 0000000000000003
  NIP [c00000000001d150] replay_system_reset+0x30/0xa0
  LR [c0000000000b6e5c] power9_idle_type+0x5c/0x70
  Call Trace:
  [c00000000173fc80] [c0000000000b6e5c] power9_idle_type+0x5c/0x70 (unreliable)
  [c00000000173fcb0] [c000000000b062b0] stop_loop+0x40/0x60
  [c00000000173fce0] [c000000000b022d8] cpuidle_enter_state+0xa8/0x660
  [c00000000173fd60] [c000000000b0292c] cpuidle_enter+0x4c/0x70
  [c00000000173fda0] [c00000000017624c] call_cpuidle+0x4c/0x90
  [c00000000173fdc0] [c000000000176768] do_idle+0x338/0x460
  [c00000000173fe60] [c000000000176b38] cpu_startup_entry+0x38/0x40
  [c00000000173fe90] [c0000000000126b4] rest_init+0x124/0x140
  [c00000000173fed0] [c0000000010948d4] start_kernel+0x938/0x988
  [c00000000173ff90] [c00000000000cdcc] start_here_common+0x1c/0x20

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
This becomes more important after implementing irq replay in C.

 arch/powerpc/kernel/ppc_save_regs.S | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/ppc_save_regs.S b/arch/powerpc/kernel/ppc_save_regs.S
index f3bd0bbf2ae8..2d4d21bb46a9 100644
--- a/arch/powerpc/kernel/ppc_save_regs.S
+++ b/arch/powerpc/kernel/ppc_save_regs.S
@@ -55,14 +55,17 @@ _GLOBAL(ppc_save_regs)
 	PPC_STL	r29,29*SZL(r3)
 	PPC_STL	r30,30*SZL(r3)
 	PPC_STL	r31,31*SZL(r3)
+	lbz	r0,PACAIRQSOFTMASK(r13)
+	PPC_STL	r0,SOFTE-STACK_FRAME_OVERHEAD(r3)
 #endif
 	/* go up one stack frame for SP */
 	PPC_LL	r4,0(r1)
 	PPC_STL	r4,1*SZL(r3)
 	/* get caller's LR */
 	PPC_LL	r0,LRSAVE(r4)
-	PPC_STL	r0,_NIP-STACK_FRAME_OVERHEAD(r3)
 	PPC_STL	r0,_LINK-STACK_FRAME_OVERHEAD(r3)
+	mflr	r0
+	PPC_STL	r0,_NIP-STACK_FRAME_OVERHEAD(r3)
 	mfmsr	r0
 	PPC_STL	r0,_MSR-STACK_FRAME_OVERHEAD(r3)
 	mfctr	r0
@@ -73,4 +76,5 @@ _GLOBAL(ppc_save_regs)
 	PPC_STL	r0,_CCR-STACK_FRAME_OVERHEAD(r3)
 	li	r0,0
 	PPC_STL	r0,_TRAP-STACK_FRAME_OVERHEAD(r3)
+	PPC_STL	r0,ORIG_GPR3-STACK_FRAME_OVERHEAD(r3)
 	blr
-- 
2.23.0

