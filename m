Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A30F35B9A8A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Sep 2022 14:13:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MSx1C07Kmz3dpK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Sep 2022 22:13:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=e1wb1UpZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=e1wb1UpZ;
	dkim-atps=neutral
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MSwzJ2HMRz3bYM
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Sep 2022 22:11:24 +1000 (AEST)
Received: by mail-pf1-x429.google.com with SMTP id 9so6753306pfz.12
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Sep 2022 05:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=YteFL4oJUuvI+wsGC7pTGdQWykUALjUg2ga9NHdLMy4=;
        b=e1wb1UpZMFMRi33js/MulDrjzh3PauQwJ13PFFhvPqZSAMyDOsLOqsR+JIHZWB2Vwr
         vk3umJftmCfL49DkpQ12TTsUC412xNen+CEkHWc/zlAIVBezNnUEtjXWC1Rad9oD8+gj
         4x6me5o58d7p1f+O0Iv39IP9jzNVJhAXvqXIcZGznPum8mp8/qBuViK+LxA5bWY/sT1T
         z4IqsnhPXi/YN/0p6/Ut0MyimOZs50V72tR5zXidrFCrm5yNJtq1RupAbubS4qRUqvcD
         N/gG5UWWBBmi4Hvg3H9R0cwfvjEnDzWTW0gcXBPNlvfTV957ZtFmj2M7o8k6cxO+WKdz
         J3EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=YteFL4oJUuvI+wsGC7pTGdQWykUALjUg2ga9NHdLMy4=;
        b=zmDmF9eSlYhAgcYkv+LWzrVcKCZteUQLuQh8mpuemk/fgPS3p8iv79+1dHP6COfQpn
         ZMeWNI06Al5RtILVy1TqKs5W8oDGbzgrR0UCozF+JMj8OpcQu6JtDldBAgI4qQD9QWDw
         fo/2LgHomBRX6oYKhz5TwBO6aDUZg3SLqvOhO0W1xBcD2pKJnEJi7p/DcEkt1Vo0Xneu
         CGwPFcPsfj+AuQvARaTt+PehIj+3y935CKbDrP2QMkV3A3DpA9f7/Uz0+cyq5XdyxOib
         sYffPKnPdAj8VjVcf9waB7updnW243oFWbsgbi3ch+q/He6BPivvVYXbYiioKR2SoabS
         aQjA==
X-Gm-Message-State: ACrzQf3JzxwxTr+UAoLYLAdyZNA4o1uy8I/+3t8IqR6xGRZxMgEThBSm
	FtFUpM5Bd33h0PjoG0nUAlyxIsxZAww=
X-Google-Smtp-Source: AMsMyM6YrCovE9c9H1iE613cHx/MsUznUYZqi82CiqooVZrFMlIcJVOJlrrLLieLaSxU6fVBu6c+Dw==
X-Received: by 2002:a63:6d44:0:b0:439:a999:e8ac with SMTP id i65-20020a636d44000000b00439a999e8acmr817655pgc.548.1663243881649;
        Thu, 15 Sep 2022 05:11:21 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([118.210.107.131])
        by smtp.gmail.com with ESMTPSA id b6-20020a170902650600b00172a567d910sm12569420plk.289.2022.09.15.05.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 05:11:21 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/6] powerpc/64s/interrupt: move early boot ILE fixup into a macro
Date: Thu, 15 Sep 2022 22:10:54 +1000
Message-Id: <20220915121058.2288916-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220915121058.2288916-1-npiggin@gmail.com>
References: <20220915121058.2288916-1-npiggin@gmail.com>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In preparation for using this sequence in machine check interrupt, move
it into a macro, with a small change to make it position independent.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 101 +++++++++++++++------------
 1 file changed, 56 insertions(+), 45 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index d98732a33afe..d629bcd7213b 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -702,6 +702,61 @@ END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
 	ld	r1,GPR1(r1)
 .endm
 
+/*
+ * EARLY_BOOT_FIXUP - Fix real-mode interrupt with wrong endian in early boot.
+ *
+ * There's a short window during boot where although the kernel is running
+ * little endian, any exceptions will cause the CPU to switch back to big
+ * endian. For example a WARN() boils down to a trap instruction, which will
+ * cause a program check, and we end up here but with the CPU in big endian
+ * mode. The first instruction of the program check handler (in GEN_INT_ENTRY
+ * below) is an mtsprg, which when executed in the wrong endian is an lhzu with
+ * a ~3GB displacement from r3. The content of r3 is random, so that is a load
+ * from some random location, and depending on the system can easily lead to a
+ * checkstop, or an infinitely recursive page fault.
+ *
+ * So to handle that case we have a trampoline here that can detect we are in
+ * the wrong endian and flip us back to the correct endian. We can't flip
+ * MSR[LE] using mtmsr, so we have to use rfid. That requires backing up SRR0/1
+ * as well as a GPR. To do that we use SPRG0/2/3, as SPRG1 is already used for
+ * the paca. SPRG3 is user readable, but this trampoline is only active very
+ * early in boot, and SPRG3 will be reinitialised in vdso_getcpu_init() before
+ * userspace starts.
+ */
+.macro EARLY_BOOT_FIXUP
+#ifdef CONFIG_CPU_LITTLE_ENDIAN
+BEGIN_FTR_SECTION
+	tdi   0,0,0x48    // Trap never, or in reverse endian: b . + 8
+	b     2f          // Skip trampoline if endian is correct
+	.long 0xa643707d  // mtsprg  0, r11      Backup r11
+	.long 0xa6027a7d  // mfsrr0  r11
+	.long 0xa643727d  // mtsprg  2, r11      Backup SRR0 in SPRG2
+	.long 0xa6027b7d  // mfsrr1  r11
+	.long 0xa643737d  // mtsprg  3, r11      Backup SRR1 in SPRG3
+	.long 0xa600607d  // mfmsr   r11
+	.long 0x01006b69  // xori    r11, r11, 1 Invert MSR[LE]
+	.long 0xa6037b7d  // mtsrr1  r11
+	.long 0x34026039  // li      r11, 0x234
+	/*
+	 * This is 'li  r11,1f' where 1f is the absolute address of that
+	 * label, byteswapped into the SI field of the instruction.
+	 */
+	.long 0x00006039 | \
+		((ABS_ADDR(1f, real_vectors) & 0x00ff) << 24) | \
+		((ABS_ADDR(1f, real_vectors) & 0xff00) << 8)
+	.long 0xa6037a7d  // mtsrr0  r11
+	.long 0x2400004c  // rfid
+1:
+	mfsprg r11, 3
+	mtsrr1 r11        // Restore SRR1
+	mfsprg r11, 2
+	mtsrr0 r11        // Restore SRR0
+	mfsprg r11, 0     // Restore r11
+2:
+END_FTR_SECTION(0, 1)     // nop out after boot
+#endif
+.endm
+
 /*
  * There are a few constraints to be concerned with.
  * - Real mode exceptions code/data must be located at their physical location.
@@ -1619,51 +1674,7 @@ INT_DEFINE_BEGIN(program_check)
 INT_DEFINE_END(program_check)
 
 EXC_REAL_BEGIN(program_check, 0x700, 0x100)
-
-#ifdef CONFIG_CPU_LITTLE_ENDIAN
-	/*
-	 * There's a short window during boot where although the kernel is
-	 * running little endian, any exceptions will cause the CPU to switch
-	 * back to big endian. For example a WARN() boils down to a trap
-	 * instruction, which will cause a program check, and we end up here but
-	 * with the CPU in big endian mode. The first instruction of the program
-	 * check handler (in GEN_INT_ENTRY below) is an mtsprg, which when
-	 * executed in the wrong endian is an lhzu with a ~3GB displacement from
-	 * r3. The content of r3 is random, so that is a load from some random
-	 * location, and depending on the system can easily lead to a checkstop,
-	 * or an infinitely recursive page fault.
-	 *
-	 * So to handle that case we have a trampoline here that can detect we
-	 * are in the wrong endian and flip us back to the correct endian. We
-	 * can't flip MSR[LE] using mtmsr, so we have to use rfid. That requires
-	 * backing up SRR0/1 as well as a GPR. To do that we use SPRG0/2/3, as
-	 * SPRG1 is already used for the paca. SPRG3 is user readable, but this
-	 * trampoline is only active very early in boot, and SPRG3 will be
-	 * reinitialised in vdso_getcpu_init() before userspace starts.
-	 */
-BEGIN_FTR_SECTION
-	tdi   0,0,0x48    // Trap never, or in reverse endian: b . + 8
-	b     1f          // Skip trampoline if endian is correct
-	.long 0xa643707d  // mtsprg  0, r11      Backup r11
-	.long 0xa6027a7d  // mfsrr0  r11
-	.long 0xa643727d  // mtsprg  2, r11      Backup SRR0 in SPRG2
-	.long 0xa6027b7d  // mfsrr1  r11
-	.long 0xa643737d  // mtsprg  3, r11      Backup SRR1 in SPRG3
-	.long 0xa600607d  // mfmsr   r11
-	.long 0x01006b69  // xori    r11, r11, 1 Invert MSR[LE]
-	.long 0xa6037b7d  // mtsrr1  r11
-	.long 0x34076039  // li      r11, 0x734
-	.long 0xa6037a7d  // mtsrr0  r11
-	.long 0x2400004c  // rfid
-	mfsprg r11, 3
-	mtsrr1 r11        // Restore SRR1
-	mfsprg r11, 2
-	mtsrr0 r11        // Restore SRR0
-	mfsprg r11, 0     // Restore r11
-1:
-END_FTR_SECTION(0, 1)     // nop out after boot
-#endif /* CONFIG_CPU_LITTLE_ENDIAN */
-
+	EARLY_BOOT_FIXUP
 	GEN_INT_ENTRY program_check, virt=0
 EXC_REAL_END(program_check, 0x700, 0x100)
 EXC_VIRT_BEGIN(program_check, 0x4700, 0x100)
-- 
2.37.2

