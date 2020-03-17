Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B8B187BC7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 10:13:10 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48hSBW3g8JzDqZR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 20:13:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=KNBXDL8o; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48hS7L44KLzDqW2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Mar 2020 20:10:21 +1100 (AEDT)
Received: by mail-pj1-x1043.google.com with SMTP id hg10so5906350pjb.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Mar 2020 02:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GedQgDj4C03DxWvmsFcdRYKRCaUmzydqAL1+dFKrReI=;
 b=KNBXDL8oKGjRRgFjMuek29p4ZK07dpZRrUCBYG20/jSeMnpQYdLAjL8V9hJSUwdZAh
 eFvAKaZ+YcTFRQy5x0C3tlAeb6AGIB59W7WLSwoXzfQxd/8cBgD4fmWrM0qPsRsv3fwE
 cFrHEZwY131hT//Y4Pl/Xhr+gGgxZA7qlpgTQJU4fCAqDsEFr3LeUhw7PV6rNt8lLhnB
 2INPado43IEn8Wujlm1VIJ4d0IuHY+COuVCkIijPjWi7tfuTyMYLwau/SAW/j3QTGP/I
 pI+CPONkHaXYFd2ALlW1PLrvQMaApBZtqTA4oN6Q92Dl3/CGFjQXaXjQYlPxdxTBtFM9
 bAoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GedQgDj4C03DxWvmsFcdRYKRCaUmzydqAL1+dFKrReI=;
 b=GQZV2HN2/78Oi/pwA5pYohka1pDm3KM5URa/Hy2M/fgs7gQve0M1fYi4hOgJqMljmF
 TuKt6Yog9SJbd+xFxCy/RRBNWhK577lF0swCXimR21GwIpYOCyynSmizifgJLXFBRkWg
 c4mj43YN7HJzm7loE3R8NlYaAjE0GzsuMkj+/rppov45gQZ91KbwOfDT5P4lW8IXf9vR
 j5+jOTB4ZhCl4neYCExIDiTxIsDkwgS3kiGhLsPWX/6TMlgk0IKiWeEqpR8ArqnxgPcA
 ZFPbSKRNyROKHrDG2k8JhlLsAZW9wr3XGKhZZkD2ZjRV1h/MC4Wd3KYdyuEuRNzaC79X
 jnOg==
X-Gm-Message-State: ANhLgQ2uDqwy9QFXdxZYF2mqrHLNuc9nUDF/Dgn0A0tIlHGNM5kxyzGf
 zgD81J/X8w3yiY3ivq3tAnQWLhqL
X-Google-Smtp-Source: ADFU+vuKx9X6jN9TVym866sVaqaXvc+YXK1iEUxd7o6NBg1djQMFPM2cVrtyfFV+SU/axgCHspa8eQ==
X-Received: by 2002:a17:90a:5801:: with SMTP id
 h1mr4256211pji.121.1584436218148; 
 Tue, 17 Mar 2020 02:10:18 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (14-202-190-183.tpgi.com.au.
 [14.202.190.183])
 by smtp.gmail.com with ESMTPSA id i13sm2463745pfd.180.2020.03.17.02.10.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Mar 2020 02:10:17 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/7] powerpc/64: mark emergency stacks valid to unwind
Date: Tue, 17 Mar 2020 19:09:07 +1000
Message-Id: <20200317090913.343097-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200317090913.343097-1-npiggin@gmail.com>
References: <20200317090913.343097-1-npiggin@gmail.com>
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

