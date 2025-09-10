Return-Path: <linuxppc-dev+bounces-12015-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA47B52412
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Sep 2025 00:07:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cMZZ21N3Bz3dBY;
	Thu, 11 Sep 2025 08:07:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757506640;
	cv=none; b=bwW6S3Tjojb8mFxhWB/Fb1AxOFWRGl2gmgg6OIoCN81phcexzXX0g+2VkJ++IXvppeZPcn3JX3yJLTTosOBrKHl+/inNwTfDPF7Niu37IXJmGoZ9MGCiaV3LlgT//1CfkO+Tk4907PTUjEYDIionESZcn9R80XB9IF03Km02ne6E1mJEoEad7oY5jyWLIPZAwVBARc01451r8wy990ZR56WFcCvQa4Ds6MkQKVjO1suZMO3GQ1zr+eQxO3IwLi69hLWJF73pDItpb8QMKMpPfRR5UmqdZA7YxBwxYRAJBF4PTvItQlnQzyTKukHWcrj/H2lfE6Gh81WPnBUJBVazJg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757506640; c=relaxed/relaxed;
	bh=3TH7g+Z03G9e/sLdJGfHaKO6b6yhWnb/Csu/pw2QByA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EhaG5zV5ov/xnDhowwQ5yHi7FgfshmPRN54h2iEsWz+oDUH0/JMucxOS9HzIgCn6stUi4iVpnztCwlMff+e8BJjeObCbyq8TztgrMgTXr9Fh4+MqByucjFyJ2AB06VSHfhQjBvCcqxr8xL39HlFzn1DLrbky1WBgBiMlZAME2ebbTpxxgNJgZwqWGMWe7nn8wkkwP/8ZC9WpaQYAjZtfHcq1iOL4nsfwU+dZTSbsXK8md4DDuNQBSKKteu+LbBQfUahO751p4KUefNNR5dLDRsMOFcGV1KO8+Vdzij4e+reBXmATdtqxoLltxRA3hIB9ACniKFtP3uZT20RnuBwqqw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=mind.be; dkim=pass (2048-bit key; unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256 header.s=google header.b=elg6u9FD; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com; envelope-from=ben.hutchings@essensium.com; receiver=lists.ozlabs.org) smtp.mailfrom=essensium.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=mind.be
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256 header.s=google header.b=elg6u9FD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=essensium.com (client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com; envelope-from=ben.hutchings@essensium.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cMKSX44mTz3dBX
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Sep 2025 22:17:14 +1000 (AEST)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-45df09c7128so5506985e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Sep 2025 05:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mind.be; s=google; t=1757506630; x=1758111430; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3TH7g+Z03G9e/sLdJGfHaKO6b6yhWnb/Csu/pw2QByA=;
        b=elg6u9FDYjKmxiEby0euyA8OU0XoJcNkBPnph2EAZkX/HamFhhraDtrk5DoAX6Kmsy
         BHf576vs+nyT5ajvT8Zwrr1v/9VBqWBac59oJeX/nvuSyV7rgTktoT+nW6Wq0whdVNgd
         8eXPleqUcwyFXfARpVnawxC03JpU5pEV8GIM1migUKxMb9dca7EalHvxk79wecP6Fs04
         pBqQGguJMLqNBPLr7fmAcE1eSKCL4NPOdQOjytA4LEFYGu7lfkJhSGGw1eagLAbXnwXh
         7kGLxpqLd6G0YgI90XC8M5fYTxp7gaK2k3qTWp9BQ3KIEm2RdhARVevgDUM/5JXSUBQj
         8B7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757506630; x=1758111430;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3TH7g+Z03G9e/sLdJGfHaKO6b6yhWnb/Csu/pw2QByA=;
        b=h9tzh3ObSzMTXk7bmBXq8YZzaYGSGHqaNEXlXS7dS0CMzQ0+h5TP7eoAD4TIked4Yf
         LRP/Q/4IuuyCCPKqZRK1R1uTDtiNUfHEQZM+XqQWyCKzVctHS6tNBC6VdNkor5YbAMYf
         TWSx5AOt6N9xgxG9AMGf1YkwACt0YGegEN5xetzEVVzNTLpqJvvhCxeaFGUk1AkY2wPh
         eF7Ik9WgbDfjWvt9DU2Jle5REK6KnSdn26iHvNNmQWeV6sVfjvdCgwi/cUONIJQDJ4L7
         12X7gquhtm1NiySaChY/RvmnZygH1ORMLkunUxulCML1IKjr2kcArNgeqpp6dEnlnqFE
         0i6w==
X-Gm-Message-State: AOJu0YxIuA8EFDieMZ47b/h9XA9I5jL/mco8Q7SIOdZwKucd2aalQNXr
	5T/jLlN8TMjOw69nNvsGcBNV8SrNejj56Hg6SGzUuw3FZr+MJo3jAQFqVLhWLKIRf1eh5zhA4at
	JZNpU
X-Gm-Gg: ASbGnctVeOcXf34C9dBlOarm4LkfzG0hXp1sCXpI9/PRwaViUhwLwCdU74410T9xxFA
	Aawwey9bfgt0cx8dMW3X7G/Vt2v0vFXmp41Ct+2iV8zdqkDOyWMRfrMbmDDKvr/h75XVjV58A/5
	IcJUAx61l0aCalxcR/v9VwtJOlj/HZFjToTIx5gnr7QfUUnBSUUJTOVcpM0k//CH4hdJtGWT8nC
	HMTNqt3YuRwVJC/7Tt2uvS/SiK5H8aVnmWe3l+xO/PkZB/HbdBD5DSvhGZyrlJc/mHJD9mqhekq
	CegeGJSsF7IGoAEXhi1YPhLSSjZYTOUwUZVbgFDLIiEhR6viSA/2YIJS0bLB/gpzYH8QUoPSg4B
	NAxoAPBO+cqHelnIHKgkihhQWK1oKxhp2FnnSha/32mLUfdM=
X-Google-Smtp-Source: AGHT+IHTwOCgRsTGLUgddeEGDwjiMl/VEbOIu4HoX+DIOP5w1FH12dxx6RRTto4MSWd9H4cCPB4MvQ==
X-Received: by 2002:a05:600c:4ed2:b0:45d:d99a:e5fc with SMTP id 5b1f17b1804b1-45dde1b2fe6mr142088045e9.7.1757506630485;
        Wed, 10 Sep 2025 05:17:10 -0700 (PDT)
Received: from cephalopod.i.decadent.org.uk ([2a02:578:851f:1502:3474:c4d4:aa9e:144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e752238967sm6630371f8f.33.2025.09.10.05.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 05:17:10 -0700 (PDT)
From: Ben Hutchings <ben.hutchings@mind.be>
To: linuxppc-dev@lists.ozlabs.org
Cc: Ben Hutchings <ben.hutchings@mind.be>
Subject: [PATCH] powerpc: Fix OPAL support in 32-bit boot wrapper
Date: Wed, 10 Sep 2025 14:16:33 +0200
Message-Id: <20250910121633.3671060-1-ben.hutchings@mind.be>
X-Mailer: git-send-email 2.39.5
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The OPAL support code in the boot wrapper can be built for a big-
endian kernel, in which case it runs in 32-bit mode while OPAL must
always run in 64-bit mode.  In this case it is currently completely
broken:

- It is missing the necessary mode switch when calling and returning
  from OPAL.

- The definition of LOAD_REG_ADDR introduces R_PPC_ADDR16_{HA,LO}
  relocations, but _zimage_start only handles R_PPC_RELATIVE
  relocations.

- opal_call assumes the ELF v2 ABI's stack frame format.

- opal_call assumes that its arguments and return value will be in the
  same registers as for the OPAL service, but this is not true when
  the caller is 32-bit code.

Since so many changes are needed in opal_call and its wrappers, write
completely separate definitions for the 32-bit case.

Delete the definition of LOAD_REG_ADDR for 32-bit code, as no generic
definition is possible.  We could use the same definition as
LOAD_REG_ADDR_PIC in the main kernel, but that clobbers lr which would
break opal_call.

Signed-off-by: Ben Hutchings <ben.hutchings@mind.be>
---
 arch/powerpc/boot/opal-calls.S | 110 +++++++++++++++++++++++++++++++++
 arch/powerpc/boot/ppc_asm.h    |   6 +-
 2 files changed, 112 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/boot/opal-calls.S b/arch/powerpc/boot/opal-calls.S
index 1f2f330a459e..034811619c0d 100644
--- a/arch/powerpc/boot/opal-calls.S
+++ b/arch/powerpc/boot/opal-calls.S
@@ -16,11 +16,22 @@ opal_kentry:
 	li	r5, 0
 	li	r6, 0
 	li	r7, 0
+#ifdef CONFIG_PPC64_BOOT_WRAPPER
 	LOAD_REG_ADDR(r11, opal)
+#else
+	/* R_PPC_ADDR16_{HA,LO} are not supported, so copy pc into r11 */
+	bcl	20,31,0f
+0:	mflr	r11
+
+	addis	r11,r11,(opal - 0b)@ha
+	addi	r11,r11,(opal - 0b)@l;
+#endif
 	ld	r8,0(r11)
 	ld	r9,8(r11)
 	bctr
 
+#ifdef CONFIG_PPC64_BOOT_WRAPPER
+
 #define OPAL_CALL(name, token)				\
 	.globl name;					\
 name:							\
@@ -65,3 +76,102 @@ OPAL_CALL(opal_console_read,			OPAL_CONSOLE_READ);
 OPAL_CALL(opal_console_write_buffer_space,	OPAL_CONSOLE_WRITE_BUFFER_SPACE);
 OPAL_CALL(opal_poll_events,			OPAL_POLL_EVENTS);
 OPAL_CALL(opal_console_flush,			OPAL_CONSOLE_FLUSH);
+
+#else /* !CONFIG_PPC64_BOOT_WRAPPER */
+
+opal_call:
+	mflr	r11
+	stw	r11,4(r1)
+	mfcr	r12
+	stw	r12,16(r1)
+	mr	r13,r2
+
+	/* R_PPC_ADDR16_{HA,LO} are not supported, so copy pc into r2 */
+	bcl	20,31,0f
+0:	mflr	r2
+
+	/* Set opal return address */
+	addis	r11,r2,(opal_return - 0b)@ha
+	addi	r11,r11,(opal_return - 0b)@l;
+	mtlr	r11
+
+	/* switch to 64-bit when we enter OPAL */
+	mfmsr	r12
+	li	r11,1
+	rldicl	r11,r11,MSR_SF_LG,0
+	or	r12,r12,r11
+	mtspr	SPRN_HSRR1,r12
+
+	/* load the opal call entry point and base */
+	addis	r11,r2,(opal - 0b)@ha
+	addi	r11,r11,(opal - 0b)@l;
+	ld	r12,8(r11)
+	ld	r2,0(r11)
+	mtspr	SPRN_HSRR0,r12
+
+	hrfid
+
+opal_return:
+	/* switch back to 32-bit */
+	mfmsr	r12
+	li	r11,1
+	rldicl	r11,r11,MSR_SF_LG,0
+	andc	r12,r12,r11
+	mtmsrd	r12
+	isync
+
+	/* split 64-bit return value into 2 registers */
+	rldicl	r4,r3,0,32
+	rldicl	r3,r3,32,32
+
+	mr	r2,r13
+	lwz	r11,16(r1)
+	lwz	r12,4(r1)
+	mtcr	r11;
+	mtlr	r12
+	blr
+
+	/*
+	 * Wrapper functions need to combine and shift arguments into the
+	 * 64-bit calling convention.
+	 */
+
+	.globl opal_console_write
+opal_console_write:
+	li	r0, OPAL_CONSOLE_WRITE
+	sldi	r3,r3,32
+	or	r3,r3,r4
+	mr	r4,r5
+	mr	r5,r6
+	b	opal_call
+
+	.globl opal_console_read
+opal_console_read:
+	li	r0, OPAL_CONSOLE_READ
+	sldi	r3,r3,32
+	or	r3,r3,r4
+	mr	r4,r5
+	mr	r5,r6
+	b	opal_call
+
+	.globl opal_console_write_buffer_space
+opal_console_write_buffer_space:
+	li	r0, OPAL_CONSOLE_WRITE_BUFFER_SPACE
+	sldi	r3,r3,32
+	or	r3,r3,r4
+	mr	r4,r5
+	b	opal_call
+
+	.globl opal_poll_events
+opal_poll_events:
+	li	r0, OPAL_POLL_EVENTS
+	b	opal_call
+
+	.globl opal_console_flush
+opal_console_flush:
+	li	r0, OPAL_CONSOLE_FLUSH
+	sldi	r3,r3,32
+	or	r3,r3,r4
+	b	opal_call
+
+#endif /* CONFIG_PPC64_BOOT_WRAPPER */
diff --git a/arch/powerpc/boot/ppc_asm.h b/arch/powerpc/boot/ppc_asm.h
index a66cfd76fa4d..754956ea4bec 100644
--- a/arch/powerpc/boot/ppc_asm.h
+++ b/arch/powerpc/boot/ppc_asm.h
@@ -60,6 +60,8 @@
 #define SPRN_HSRR0	0x13A	/* Hypervisor Save/Restore 0 */
 #define SPRN_HSRR1	0x13B	/* Hypervisor Save/Restore 1 */
 
+#define MSR_SF_LG	63              /* Enable 64 bit mode */
+
 #define MSR_LE		0x0000000000000001
 
 #define FIXUP_ENDIAN						   \
@@ -88,10 +90,6 @@
 #define LOAD_REG_ADDR(reg,name)			\
 	addis	reg,r2,name@toc@ha;		\
 	addi	reg,reg,name@toc@l
-#else
-#define LOAD_REG_ADDR(reg,name)			\
-	lis	reg,name@ha;			\
-	addi	reg,reg,name@l
 #endif
 
 #endif /* _PPC64_PPC_ASM_H */
-- 
2.39.5


