Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C48C0197C11
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Mar 2020 14:38:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48rX6t1bB5zDqfF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Mar 2020 23:37:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=VsON8xXn; dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48rX302SKDzDqdM
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Mar 2020 23:34:35 +1100 (AEDT)
Received: by mail-pl1-x643.google.com with SMTP id g2so6670793plo.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Mar 2020 05:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uqbfQdcjCT6qlzkQ5rpVGaVn5wyrTGhYjpldt3OqtMY=;
 b=VsON8xXnp7IdfE8iTiK6+Jk7afjgoKqAjYQ7sMg/MBMx0o/+mHYcBdjeY8th/arXu5
 wGsFcijhduaw1aQ12lqRf/sFrQf+eg+P+sSUaZ0Uwel605nhyKcNJF0vwRhSna/klAXO
 eNlGhsgns/p3t1ABcirAgLC9HrlYYYQWvKh5TmgBxnDgUNtxErUNcXldAr+9ydScdCOx
 rIHMOPXeAIeJGRSlNaciMPemKVRnCqCu++XNOIHJkRTu/geZsJfgrL7f37kR8m79eWAN
 7RxWFfD6UIkQj5E2aYdIkRfleGqNXGnK6koJ7Fq1Z0S06PlSOfnlRA5HF9eue8ocwbPs
 010w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uqbfQdcjCT6qlzkQ5rpVGaVn5wyrTGhYjpldt3OqtMY=;
 b=YBze7GvR9D6Dc3Ew/iaGy1ojmbs+oU4Yy50ZohmheuuWjNasD/Yp1rZ/3onQcFHGaA
 J/6Sdx062MD6lrRH9KloFjVytNDOiT6lvlgo63fTEa7Z2r7R4wm6U4+ATII1wxCcVzaT
 2lQxFBTGV0os2I0y/5Y4rwnC5t+x93cALpbOfNsTBQZFQ9Ng27kxUWqLiDbo6v4R88dC
 ZWOQk/YRBYPaqdmHgICMLA/0HE1kTbmUMPtSmoXgTt+4YZarLtuegNA2p9qfr8nmusbz
 +/hkLTi+n+1WOyQIPailUiFOONdYmfDGk4Pf3DpPeUqoz5UoaZia/BOIN6xxsKc0+Kc7
 UpVA==
X-Gm-Message-State: ANhLgQ31yAWNGP8cjjkVov+XQwmM6wF+LY014Rc+ek3zsiDwTO+LWGkm
 Ro8zs7EK9lUwovYXCvwD7cD9OEmh
X-Google-Smtp-Source: ADFU+vvJibeR/ajCab6+lZLmLdpXxjVldhDYsRQXcn/QgZYloIkrwmTYizf0rpuZapEG6A84H+HVTw==
X-Received: by 2002:a17:902:b198:: with SMTP id
 s24mr12161848plr.89.1585571673844; 
 Mon, 30 Mar 2020 05:34:33 -0700 (PDT)
Received: from bobo.ibm.com (14-203-139-135.static.tpgi.com.au.
 [14.203.139.135])
 by smtp.gmail.com with ESMTPSA id c11sm10367206pfc.216.2020.03.30.05.34.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Mar 2020 05:34:33 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] Fix "[v3,
 10/32] powerpc/64s/exception: move real->virt switch into the common
 handler"
Date: Mon, 30 Mar 2020 22:31:48 +1000
Message-Id: <20200330123148.740996-1-npiggin@gmail.com>
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

It's possible for interrupts to be replayed when TM is enabled and
suspended, for example rt_sigreturn, where the mtmsrd MSR_KERNEL in
the real-mode entry point to the common handler causes a TM Bad Thing
exception (due to attempting to clear suspended).

The fix for this is to have replay interrupts go to the _virt entry
point and skip the mtmsrd, which matches what happens before this
patch.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 112cdb446e03..42fced32c8af 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -2757,12 +2757,12 @@ handle_dabr_fault:
 h_doorbell_common_msgclr:
 	LOAD_REG_IMMEDIATE(r3, PPC_DBELL_MSGTYPE << (63-36))
 	PPC_MSGCLR(3)
-	b 	h_doorbell_common
+	b 	h_doorbell_common_virt
 
 doorbell_super_common_msgclr:
 	LOAD_REG_IMMEDIATE(r3, PPC_DBELL_MSGTYPE << (63-36))
 	PPC_MSGCLRP(3)
-	b 	doorbell_super_common
+	b 	doorbell_super_common_virt
 
 /*
  * Called from arch_local_irq_enable when an interrupt needs
@@ -2788,20 +2788,20 @@ _GLOBAL(__replay_interrupt)
 	mfcr	r9
 	ori	r12,r12,MSR_EE
 	cmpwi	r3,0x900
-	beq	decrementer_common
+	beq	decrementer_common_virt
 	cmpwi	r3,0x500
 BEGIN_FTR_SECTION
-	beq	h_virt_irq_common
+	beq	h_virt_irq_common_virt
 FTR_SECTION_ELSE
-	beq	hardware_interrupt_common
+	beq	hardware_interrupt_common_virt
 ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_300)
 	cmpwi	r3,0xf00
-	beq	performance_monitor_common
+	beq	performance_monitor_common_virt
 BEGIN_FTR_SECTION
 	cmpwi	r3,0xa00
 	beq	h_doorbell_common_msgclr
 	cmpwi	r3,0xe60
-	beq	hmi_exception_common
+	beq	hmi_exception_common_virt
 FTR_SECTION_ELSE
 	cmpwi	r3,0xa00
 	beq	doorbell_super_common_msgclr
-- 
2.23.0

