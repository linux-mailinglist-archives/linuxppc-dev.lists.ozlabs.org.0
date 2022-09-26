Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 965AA5E990A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 07:58:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MbX9Z2Kvbz3c7t
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 15:58:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=SpG69Onb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::534; helo=mail-pg1-x534.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=SpG69Onb;
	dkim-atps=neutral
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MbX7g5d50z3bjX
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 15:56:31 +1000 (AEST)
Received: by mail-pg1-x534.google.com with SMTP id u69so5642659pgd.2
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Sep 2022 22:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=RLCrKlVFozGALeT02ZLXoM7pllAGdwe4OOoiJXzTpBU=;
        b=SpG69Onb/78zNmd+ZQKjkVcrv4IGH9xVWbSjiKuRRDhnc25aw7o5zBbj9rxw00JJQS
         KzHjtimyh4DGu0pRQ6NVVdKGJk/wmraiuwzvgiyIzkZkYc9NWccSrJVC/zgD1r3fgupe
         vgYwhInDDy6Jvr7m0ewMJWuqzS9VTclBtPVzZ1vvu+EvSBVq1bSUwTZS5h+EJYeXvdVS
         uOfwzjl4x1T3Z3tIOWL1zJPBR8oxkwmKSQpi2bwMT7s1Vqb3dSNwLb7CPqa+gtgrJa4M
         uyVRusBDOn1wJ2U/f5hR0/7DEnscZ8DiPyhxgALS916yPKYc6WAsfNIgOnIcnc5heoVN
         nnsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=RLCrKlVFozGALeT02ZLXoM7pllAGdwe4OOoiJXzTpBU=;
        b=kTkV2qT12mbI/Z/sTN4Lmblf+IQZH0NvlouyKj0ClGfUR4aZDtdRRdH+WJGMxQu8cz
         AZWxGZW67jL9I5MD3lvCMIixeb60rDSVLutCl2wRAq7Op8foz241CcYMmKYDA1/M841I
         9RWgrYDsX9R4zmrTpughmFUgl6V2gJIj2hI3wy0oYDAwlYIdrovGkJiaGEvWFLMD+neM
         baS0YVHawUFUJ18l7ERemhaT3A6VaRlcjcShvAaMule44cak7F/3YuL6DIuDoLTB71vm
         SGeP4laU+804ZqnKVVtvPpZFoCbC5nXNgMPRIKlE0vNAsLoMUFpzw9gdgMjUsMNd91Qb
         E+Mg==
X-Gm-Message-State: ACrzQf06TWxsqyVHoGU3UGj6BX0Z5/clSP6VFPcKmcnB39x/lVtYX1mf
	CF+sVAeiyxtFoaFnH7WysP9Kx71G0izNaQ==
X-Google-Smtp-Source: AMsMyM7NesVH+NzzcTvNRPfRTWZOtVVnp5I1niTT4UC/Br97LXSBI8y8/Ps6ikXlYIADi8ruVinBYA==
X-Received: by 2002:a05:6a00:cd6:b0:546:d03:3dd7 with SMTP id b22-20020a056a000cd600b005460d033dd7mr21949126pfv.19.1664171788872;
        Sun, 25 Sep 2022 22:56:28 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (203-219-181-119.static.tpgi.com.au. [203.219.181.119])
        by smtp.gmail.com with ESMTPSA id pv7-20020a17090b3c8700b00203a4f70b90sm5628075pjb.45.2022.09.25.22.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Sep 2022 22:56:28 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 1/5] powerpc/64s/interrupt: move early boot ILE fixup into a macro
Date: Mon, 26 Sep 2022 15:56:16 +1000
Message-Id: <20220926055620.2676869-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220926055620.2676869-1-npiggin@gmail.com>
References: <20220926055620.2676869-1-npiggin@gmail.com>
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
 arch/powerpc/kernel/exceptions-64s.S | 100 +++++++++++++++------------
 1 file changed, 55 insertions(+), 45 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index dafa275f18bc..66e2adf50745 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -702,6 +702,60 @@ END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
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
@@ -1619,51 +1673,7 @@ INT_DEFINE_BEGIN(program_check)
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

