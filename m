Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3136EEE0D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Apr 2023 08:08:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q5pMT5YBVz3g1d
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Apr 2023 16:08:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=K+8MfLSE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=K+8MfLSE;
	dkim-atps=neutral
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q5p961QJVz3cd4
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Apr 2023 15:59:22 +1000 (AEST)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-63b5ce4f069so8243821b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Apr 2023 22:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682488760; x=1685080760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J2ko4ppJSMHqylz7vJmE3ziuMqcMcKfn3PkGhydIRaM=;
        b=K+8MfLSEJ+kZg9wGRn+L6zRM1TsU9YvM4Bu7eMt8E3aTVezdiLUWNqCO9Pg98pXCHc
         QE0oP8rtGHeBxhur5oPocqVfYaIoUrfTRwm+odcMKYRYtFyagM0sDOR/84BvY0Id3KNk
         I2y1EioCWrcMFLh0wx9kZDzBRJWZWFYQczbkQNCeqjEqAb4AYN/QkmQNiQUUWJORF8Te
         FV3J6MxPyaAhG4crirAgC7cHVFF5ABu1LuM5+h1cOedkKTMepCyqqDkqfXXK4rJqDzIO
         Am0hBDs1mRKinpDbt7MZuwv2VsVydqK0KYOuZFB0xs5siJet27+Zjb7Y4wuEzTc9Np0G
         Nt3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682488760; x=1685080760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J2ko4ppJSMHqylz7vJmE3ziuMqcMcKfn3PkGhydIRaM=;
        b=b9cIUKpBqUwFQ1/q8IFwRjM8EBoQbges99wD0OkymWJzI7Oh3gzGqZv5HO5Oa4rxMm
         auSSsp9Pp/V4gVw3o5JK5cLqvmDzaTqxrcBfVVoKlbjni3bqHovGp63oOQ+VemWfDhU4
         bVpUkL4IOBySJCjwO3SUmjzirxfCpYX/0x02G6T54J/384fJuAtB5D/ozpaAdHF8JdXv
         8FWWC2v+OLudj/OR/64pdUCA6ukQqNriYd72AtOMFhdN3+y5N/tu9oXxcs4DVYfc81/h
         c6ei3wMnKqeDkfPqhdwT/gGCVxSybhT+c4t5VllICiu/vPnQskoO0t2+NmP+m+og4syA
         nDXw==
X-Gm-Message-State: AAQBX9f44muRv0zg822ArLyLOi37HUCONAVqYul2wjkNsyvrmzt7wEo3
	8iGl25WvmgEF1xTC0x4W4vp0hP7ILfHEsg==
X-Google-Smtp-Source: AKy350Y8SNcRT506yr7QVcqB5/6eCak/HwahzOIUsTpuyNN8bo0fel0tpOu0zDSmifma3OKgSigEEQ==
X-Received: by 2002:a05:6a00:1141:b0:63d:2d8c:7fd5 with SMTP id b1-20020a056a00114100b0063d2d8c7fd5mr25723669pfm.12.1682488759972;
        Tue, 25 Apr 2023 22:59:19 -0700 (PDT)
Received: from wheely.local0.net ([203.221.203.54])
        by smtp.gmail.com with ESMTPSA id f25-20020aa782d9000000b0063a1e7d7439sm10300479pfn.69.2023.04.25.22.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Apr 2023 22:59:19 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 9/9] powerpc/64s: Work around llvm-as not recognising pla
Date: Wed, 26 Apr 2023 15:58:47 +1000
Message-Id: <20230426055848.402993-11-npiggin@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230426055848.402993-1-npiggin@gmail.com>
References: <20230426055848.402993-1-npiggin@gmail.com>
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

llvm-as does not recognise the pla mnemonic, which is used for pcrel
address generation. Use the equivalent paddi opcode instead. Clang
can not build working pcrel kernels yet, but this patch does allow it
to build a non-working pcrel kernel with llvm-as.

This could be unconditional or use a raw encoding, but this gives a
placeholder to track the issue.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/Kconfig               | 5 +++++
 arch/powerpc/include/asm/ppc_asm.h | 5 +++++
 arch/powerpc/kernel/vector.S       | 6 ++++++
 3 files changed, 16 insertions(+)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 39cd8d3ff846..2f7840577f7f 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -22,6 +22,11 @@ config CC_HAS_PCREL
 	# do pcrel yet.
 	def_bool PPC64 && CC_IS_GCC &&  $(cc-option, -mcpu=power10 -mpcrel)
 
+config AS_HAS_MISSING_PLA_INSN
+	# llvm-as is missing some extended mnemonics including pla
+	# (https://github.com/llvm/llvm-project/issues/62373).
+	def_bool AS_IS_LLVM
+
 config 32BIT
 	bool
 	default y if PPC32
diff --git a/arch/powerpc/include/asm/ppc_asm.h b/arch/powerpc/include/asm/ppc_asm.h
index 5f05a984b103..736202ebc1be 100644
--- a/arch/powerpc/include/asm/ppc_asm.h
+++ b/arch/powerpc/include/asm/ppc_asm.h
@@ -380,8 +380,13 @@ GLUE(.,name):
 	rldimi	reg, tmp, 32, 0
 
 #ifdef CONFIG_PPC_KERNEL_PCREL
+#ifdef CONFIG_AS_HAS_MISSING_PLA_INSN
+#define LOAD_REG_ADDR(reg,name)			\
+	paddi	reg,0,name@pcrel,1
+#else
 #define LOAD_REG_ADDR(reg,name)			\
 	pla	reg,name@pcrel
+#endif
 
 #else
 #define LOAD_REG_ADDR(reg,name)			\
diff --git a/arch/powerpc/kernel/vector.S b/arch/powerpc/kernel/vector.S
index fcc0ad6d9c7b..c2feaea5e673 100644
--- a/arch/powerpc/kernel/vector.S
+++ b/arch/powerpc/kernel/vector.S
@@ -178,9 +178,15 @@ fphalf:
 	.quad	0x3fe0000000000000	/* 0.5 */
 
 #ifdef CONFIG_PPC_KERNEL_PCREL
+#ifdef CONFIG_AS_HAS_MISSING_PLA_INSN
+#define LDCONST(fr, name)		\
+	paddi	r11,0,name@pcrel,1;	\
+	lfd	fr,0(r11)
+#else
 #define LDCONST(fr, name)		\
 	pla	r11,name@pcrel;		\
 	lfd	fr,0(r11)
+#endif
 #else
 #define LDCONST(fr, name)		\
 	addis	r11,r2,name@toc@ha;	\
-- 
2.40.0

