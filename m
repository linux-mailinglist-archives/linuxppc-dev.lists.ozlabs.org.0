Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0040B192603
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 11:43:32 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48nPq56zMXzDqng
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 21:43:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Dk17X4NB; dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48nPdJ0mS8zDqlc
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Mar 2020 21:34:59 +1100 (AEDT)
Received: by mail-pg1-x543.google.com with SMTP id d37so453684pgl.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Mar 2020 03:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F/cuwYpsusEETF4kLaoc30TndH/kXq985eZCaeQKDYo=;
 b=Dk17X4NBJSXvtQEPwdiO0ysJgwJ7KNofGkqhZ/vC9M4KnkoNj9y+B3u5R+dq6nPbsm
 ka9mauINZmz/bCr8Y9adT1351wlMNi8zSo2GuryuwQdiIaeKB7zyues5ghgmso09qIAw
 zUsKuDlDYvNDshljU7eoYXit+DHFtDrGjoBvFXpF9CwndWGo/TB1SytQYpL3hIeOgqeN
 GiyJk9UI8gZ4epeGv/rOFl7FKRWLe5tanoOA6Jry3Qu5nS+hF9mleQrEONEM1gvFS0V7
 TFO15JbDFjQm4dpVVi73gnWCreIW7/lVmRi4twL+RYsbakOHJx9tKc1ACLopNgegvGzs
 +JQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F/cuwYpsusEETF4kLaoc30TndH/kXq985eZCaeQKDYo=;
 b=jXBQ2dHRa+fqG4mlWc0I7W3bSXjFSE8PSL8mYz5ybGawcklFDiFzzjs5RHRlZ+IlCb
 blN7pik20oX67DhbyCxIy/P7hH+vKb5T+sxm7DaUGCXm741CFEwPNBDcCqceeM2phaAj
 DFZmVp6fjdjpt2lSc7jVZxWt9aKCLBwPRdntSygtB+6dvJp+bQy/KQ85UBAvv3XwU5GO
 j23Ny/iOu/DlSirl2O4nyXhWCQeRcM3pYEJIAPJi+yOb5IOmZM9V30t/aRneyUTa+W3f
 1/RQ6mDq1vuEKDW89z5M2DWzkt7yQ1xLfGWQuQkXdW2IvLr8Nl9NWC++NLJt0SyuAoc7
 p9bw==
X-Gm-Message-State: ANhLgQ0+OLdAwMvPBkXUeTj/dBVRfZ9GpZ5tf8TDr6NXfWoXS+w9+VfD
 IV34psUquPNVZ+2qLJ0jysBMPiA4
X-Google-Smtp-Source: ADFU+vsbMZk1NLpDmCC2ZMagu6Stw0ht3B1rQ0vkuNn6m/5/vBTwwdAGIcKjLvt+EIOETm0hXbYhpw==
X-Received: by 2002:a63:7c54:: with SMTP id l20mr2488823pgn.158.1585132497228; 
 Wed, 25 Mar 2020 03:34:57 -0700 (PDT)
Received: from bobo.ibm.com (14-202-190-183.tpgi.com.au. [14.202.190.183])
 by smtp.gmail.com with ESMTPSA id b9sm16549701pgi.75.2020.03.25.03.34.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Mar 2020 03:34:56 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 03/12] powerpc/64s/exceptions: machine check reconcile irq
 state
Date: Wed, 25 Mar 2020 20:34:01 +1000
Message-Id: <20200325103410.157573-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200325103410.157573-1-npiggin@gmail.com>
References: <20200325103410.157573-1-npiggin@gmail.com>
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
Cc: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

pseries fwnmi machine check code pops the soft-irq checks in rtas_call
(after the previous patch to remove rtas_token from this call path).
Rather than play whack a mole with these and forever having fragile
code, it seems better to have the early machine check handler perform
the same kind of reconcile as the other NMI interrupts.

  WARNING: CPU: 0 PID: 493 at arch/powerpc/kernel/irq.c:343
  CPU: 0 PID: 493 Comm: a Tainted: G        W
  NIP:  c00000000001ed2c LR: c000000000042c40 CTR: 0000000000000000
  REGS: c0000001fffd38b0 TRAP: 0700   Tainted: G        W
  MSR:  8000000000021003 <SF,ME,RI,LE>  CR: 28000488  XER: 00000000
  CFAR: c00000000001ec90 IRQMASK: 0
  GPR00: c000000000043820 c0000001fffd3b40 c0000000012ba300 0000000000000000
  GPR04: 0000000048000488 0000000000000000 0000000000000000 00000000deadbeef
  GPR08: 0000000000000080 0000000000000000 0000000000000000 0000000000001001
  GPR12: 0000000000000000 c0000000014a0000 0000000000000000 0000000000000000
  GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
  GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
  GPR24: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
  GPR28: 0000000000000000 0000000000000001 c000000001360810 0000000000000000
  NIP [c00000000001ed2c] arch_local_irq_restore.part.0+0xac/0x100
  LR [c000000000042c40] unlock_rtas+0x30/0x90
  Call Trace:
  [c0000001fffd3b40] [c000000001360810] 0xc000000001360810 (unreliable)
  [c0000001fffd3b60] [c000000000043820] rtas_call+0x1c0/0x280
  [c0000001fffd3bb0] [c0000000000dc328] fwnmi_release_errinfo+0x38/0x70
  [c0000001fffd3c10] [c0000000000dcd8c] pseries_machine_check_realmode+0x1dc/0x540
  [c0000001fffd3cd0] [c00000000003fe04] machine_check_early+0x54/0x70
  [c0000001fffd3d00] [c000000000008384] machine_check_early_common+0x134/0x1f0
  --- interrupt: 200 at 0x13f1307c8
      LR = 0x7fff888b8528
  Instruction dump:
  60000000 7d2000a6 71298000 41820068 39200002 7d210164 4bffff9c 60000000
  60000000 7d2000a6 71298000 4c820020 <0fe00000> 4e800020 60000000 60000000

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 257d24437130..687f1389a5e5 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1186,11 +1186,30 @@ END_FTR_SECTION_IFSET(CPU_FTR_HVMODE)
 	li	r10,MSR_RI
 	mtmsrd	r10,1
 
+	/*
+	 * Set IRQS_ALL_DISABLED and save PACAIRQHAPPENED (see
+	 * system_reset_common)
+	 */
+	li	r10,IRQS_ALL_DISABLED
+	stb	r10,PACAIRQSOFTMASK(r13)
+	lbz	r10,PACAIRQHAPPENED(r13)
+	std	r10,RESULT(r1)
+	ori	r10,r10,PACA_IRQ_HARD_DIS
+	stb	r10,PACAIRQHAPPENED(r13)
+
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	machine_check_early
 	std	r3,RESULT(r1)	/* Save result */
 	ld	r12,_MSR(r1)
 
+	/*
+	 * Restore soft mask settings.
+	 */
+	ld	r10,RESULT(r1)
+	stb	r10,PACAIRQHAPPENED(r13)
+	ld	r10,SOFTE(r1)
+	stb	r10,PACAIRQSOFTMASK(r13)
+
 #ifdef CONFIG_PPC_P7_NAP
 	/*
 	 * Check if thread was in power saving mode. We come here when any
-- 
2.23.0

