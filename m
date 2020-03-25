Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D69B91926C4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 12:09:03 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48nQNX5SfHzDq62
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 22:09:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=BqIwLB8B; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48nPnp4yPbzDq5n
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Mar 2020 21:42:22 +1100 (AEDT)
Received: by mail-pj1-x1042.google.com with SMTP id jz1so2205416pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Mar 2020 03:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5xxBBPGRnum4eehM31wsf7GzTCSV/jP3jsb13JZWNPY=;
 b=BqIwLB8BGG3It2vZ5NtK2+oLzScqu1ovlVUpQvvj9ZVks+Evb6zM2LoAEqjUBFbzaJ
 wcSTh14mgWgw1A3xKQ12WXGTBYWNMfnLg7grAju4kPCWQUqVc5vYNtaugQ3ltr5aX1tK
 sjmbiCuRXkAPOsyn/kwCxsdHeynDL1CsHiHjiCfTeE1V+Mit/fMpaofb7CSSK6n6OxyK
 aDgL5ZrInr59NoJFfDroNkirEP6phXPQ5ew32HU0Qr/3YrpwX9yxNHu3uMYRZGOQOyIR
 F3n+g99C81xAX4oV6y38oBFNjmecxCCT3PEUP9UpY4b8jPe65t6zFzpvChss5g4/pYiZ
 aS7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5xxBBPGRnum4eehM31wsf7GzTCSV/jP3jsb13JZWNPY=;
 b=PQgxawIbapYy8cv7fPvIcYLzRd5+v/FSEctPXb2G0BrOJ3G4A368KUzegZMkzjUEQu
 SFf3mGg1ZZvffu73qOge5BQ1BA2CSHq+fqERmfbHCQgiubvWWrf0HgFoAMtBtAPH+y9T
 MoxaujfrQ0SKcbk49/f4TbLsFQnnWZPYvSHKuDs892J9RpjzPo0IGGZTrS2vhfA0j8Ri
 rUF3Z84+iZQdSpupbRcvAcgcAGxscMb7IVRcoz8k5fNVEHsMsxE6T1y3BaO4SaEGza5r
 FUCVyG7IHywM+BxbQr7FwwNtTFs3El9XpBUxisWqaXj/VefnY35tJE1eyAsW41zXMGQD
 C/kQ==
X-Gm-Message-State: ANhLgQ1hsDBd5qdxCkyMyTaCbMg6YG+9ZWgCSjcLvVuLKW/9JvpMF+OV
 g2TQFlMHd5yUCEPVvkRYDw0HLMYh
X-Google-Smtp-Source: ADFU+vu3LOKyES+m58clVJnyKa1nA/t+HLKqvXE7tHiWw0pCT02dZmkeSVj0IWzuIuB14dO38m/tDQ==
X-Received: by 2002:a17:90a:198e:: with SMTP id
 14mr2920544pji.164.1585132937668; 
 Wed, 25 Mar 2020 03:42:17 -0700 (PDT)
Received: from bobo.ibm.com (14-202-190-183.tpgi.com.au. [14.202.190.183])
 by smtp.gmail.com with ESMTPSA id z7sm18460828pfz.24.2020.03.25.03.42.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Mar 2020 03:42:17 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2] powerpc/64: mark emergency stacks valid to unwind
Date: Wed, 25 Mar 2020 20:41:44 +1000
Message-Id: <20200325104144.158362-1-npiggin@gmail.com>
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

Before:

  WARNING: CPU: 0 PID: 494 at arch/powerpc/kernel/irq.c:343
  CPU: 0 PID: 494 Comm: a Tainted: G        W
  NIP:  c00000000001ed2c LR: c000000000d13190 CTR: c00000000003f910
  REGS: c0000001fffd3870 TRAP: 0700   Tainted: G        W
  MSR:  8000000000021003 <SF,ME,RI,LE>  CR: 28000488  XER: 00000000
  CFAR: c00000000001ec90 IRQMASK: 0
  GPR00: c000000000aeb12c c0000001fffd3b00 c0000000012ba300 0000000000000000
  GPR04: 0000000000000000 0000000000000000 000000010bd207c8 6b00696e74657272
  GPR08: 0000000000000000 0000000000000000 0000000000000000 efbeadde00000000
  GPR12: 0000000000000000 c0000000014a0000 0000000000000000 0000000000000000
  GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
  GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
  GPR24: 0000000000000000 0000000000000000 0000000000000000 000000010bd207bc
  GPR28: 0000000000000000 c00000000148a898 0000000000000000 c0000001ffff3f50
  NIP [c00000000001ed2c] arch_local_irq_restore.part.0+0xac/0x100
  LR [c000000000d13190] _raw_spin_unlock_irqrestore+0x50/0xc0
  Call Trace:
  Instruction dump:
  60000000 7d2000a6 71298000 41820068 39200002 7d210164 4bffff9c 60000000
  60000000 7d2000a6 71298000 4c820020 <0fe00000> 4e800020 60000000 60000000

After:

  WARNING: CPU: 0 PID: 499 at arch/powerpc/kernel/irq.c:343
  CPU: 0 PID: 499 Comm: a Not tainted
  NIP:  c00000000001ed2c LR: c000000000d13210 CTR: c00000000003f980
  REGS: c0000001fffd3870 TRAP: 0700   Not tainted
  MSR:  8000000000021003 <SF,ME,RI,LE>  CR: 28000488  XER: 00000000
  CFAR: c00000000001ec90 IRQMASK: 0
  GPR00: c000000000aeb1ac c0000001fffd3b00 c0000000012ba300 0000000000000000
  GPR04: 0000000000000000 0000000000000000 00000001347607c8 6b00696e74657272
  GPR08: 0000000000000000 0000000000000000 0000000000000000 efbeadde00000000
  GPR12: 0000000000000000 c0000000014a0000 0000000000000000 0000000000000000
  GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
  GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
  GPR24: 0000000000000000 0000000000000000 0000000000000000 00000001347607bc
  GPR28: 0000000000000000 c00000000148a898 0000000000000000 c0000001ffff3f50
  NIP [c00000000001ed2c] arch_local_irq_restore.part.0+0xac/0x100
  LR [c000000000d13210] _raw_spin_unlock_irqrestore+0x50/0xc0
  Call Trace:
  [c0000001fffd3b20] [c000000000aeb1ac] of_find_property+0x6c/0x90
  [c0000001fffd3b70] [c000000000aeb1f0] of_get_property+0x20/0x40
  [c0000001fffd3b90] [c000000000042cdc] rtas_token+0x3c/0x70
  [c0000001fffd3bb0] [c0000000000dc318] fwnmi_release_errinfo+0x28/0x70
  [c0000001fffd3c10] [c0000000000dcd8c] pseries_machine_check_realmode+0x1dc/0x540
  [c0000001fffd3cd0] [c00000000003fe04] machine_check_early+0x54/0x70
  [c0000001fffd3d00] [c000000000008384] machine_check_early_common+0x134/0x1f0
  --- interrupt: 200 at 0x1347607c8
      LR = 0x7fffafbd8328
  Instruction dump:
  60000000 7d2000a6 71298000 41820068 39200002 7d210164 4bffff9c 60000000
  60000000 7d2000a6 71298000 4c820020 <0fe00000> 4e800020 60000000 60000000

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
No change but I removed this from the RAS series because it's
orthogonal and hopefully a good simple change on its own.

 arch/powerpc/kernel/process.c | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 1dea4d280f6f..d27bf367e929 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1983,6 +1983,32 @@ static inline int valid_irq_stack(unsigned long sp, struct task_struct *p,
 	return 0;
 }
 
+static inline int valid_emergency_stack(unsigned long sp, struct task_struct *p,
+					unsigned long nbytes)
+{
+#ifdef CONFIG_PPC64
+	unsigned long stack_page;
+	unsigned long cpu = task_cpu(p);
+
+	stack_page = (unsigned long)paca_ptrs[cpu]->emergency_sp - THREAD_SIZE;
+	if (sp >= stack_page && sp <= stack_page + THREAD_SIZE - nbytes)
+		return 1;
+
+# ifdef CONFIG_PPC_BOOK3S_64
+	stack_page = (unsigned long)paca_ptrs[cpu]->nmi_emergency_sp - THREAD_SIZE;
+	if (sp >= stack_page && sp <= stack_page + THREAD_SIZE - nbytes)
+		return 1;
+
+	stack_page = (unsigned long)paca_ptrs[cpu]->mc_emergency_sp - THREAD_SIZE;
+	if (sp >= stack_page && sp <= stack_page + THREAD_SIZE - nbytes)
+		return 1;
+# endif
+#endif
+
+	return 0;
+}
+
+
 int validate_sp(unsigned long sp, struct task_struct *p,
 		       unsigned long nbytes)
 {
@@ -1994,7 +2020,10 @@ int validate_sp(unsigned long sp, struct task_struct *p,
 	if (sp >= stack_page && sp <= stack_page + THREAD_SIZE - nbytes)
 		return 1;
 
-	return valid_irq_stack(sp, p, nbytes);
+	if (valid_irq_stack(sp, p, nbytes))
+		return 1;
+
+	return valid_emergency_stack(sp, p, nbytes);
 }
 
 EXPORT_SYMBOL(validate_sp);
-- 
2.23.0

