Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB95187BD2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 10:17:47 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48hSHr0kxQzDqXJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 20:17:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=N1fXyD86; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48hS7T5dBDzDqWG
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Mar 2020 20:10:29 +1100 (AEDT)
Received: by mail-pg1-x541.google.com with SMTP id m5so11385757pgg.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Mar 2020 02:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S0YceGlAHH0JjrIweHtHNWRbtBPsW2tHhMw64wNqTeo=;
 b=N1fXyD86fEQgswdn0PZRnB0iDQfmSSvBSnn7fRrgrE/q4QqCL7BWCHOFZNSpJ7VW5m
 GYNbFSsf1JbcFS3QS278SoJDlRtRGx6hsnZjbepE6U5Su3rGdGN9NiyqoShlZB+PUlnA
 UYd/NijZXk2AAguNorfCZoNMq9B66jyv+m5iJqnCHRmvcnSakc7UfKyyr442ZnsiherF
 N+dQyAL7J5KwvzGJwvJxGTObvPAVS/BaxwGHdA2iu8c8SG2x32ppG6kPBKYLsvtKuPHy
 XCGZY0mVhXNWJ2uktPnCqLcymmoIzu+hVn5iB5Q8FySdV6L87erIFJGx3EE0sXIZbKBJ
 x7nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S0YceGlAHH0JjrIweHtHNWRbtBPsW2tHhMw64wNqTeo=;
 b=pFGlTxMcDTdiU/3s52oHWM4UOwTNrkDLlPtI/SncKmUsENrQ1WnXmQcVkErfPCYnEu
 EwzTUGAm5jrDWeA8GmKOXGryhXE52CjrXLS8rumGo3N1RtxOFtjjI+E9p1Le6VHzmZhe
 E/M4xuO5OKzTflJMPRdrmxFdLgAdT/e1KE8sJjrLw/ZDPj/9bASrXhz8mT7r18x6/Iac
 j9D1gMDwl8j/OS03kJr1cR/Ye5HC0+gZ6FjehskAN88BPyKWOE99X9wu8bmHsz+KHkPE
 9p9Iwp//opEqZ4qlq/QMvXc2j4oNP2VKj2aFH1SBwLHY90jekrnU6gjW83Ht2cmQDkVS
 KA7w==
X-Gm-Message-State: ANhLgQ24QksydFCcHzlau6YXn7gjPHCyO8NMcu35Cnh+OobP48LW8lCy
 0zsDExCdTpWSNPNfG6gjsTDctBTc
X-Google-Smtp-Source: ADFU+vtMSK/RpWp9qpgsWl2AHYC0OUH4+pS8VbUEHn5Q45K1I2GtFK+q0Nc+cewVBHBvztNN177F4g==
X-Received: by 2002:a63:1517:: with SMTP id v23mr3947083pgl.89.1584436227511; 
 Tue, 17 Mar 2020 02:10:27 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (14-202-190-183.tpgi.com.au.
 [14.202.190.183])
 by smtp.gmail.com with ESMTPSA id i13sm2463745pfd.180.2020.03.17.02.10.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Mar 2020 02:10:27 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 4/7] powerpc/64s: machine check reconcile irq state
Date: Tue, 17 Mar 2020 19:09:10 +1000
Message-Id: <20200317090913.343097-5-npiggin@gmail.com>
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
index d95c4560c038..31bdbb94e477 100644
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

