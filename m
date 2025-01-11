Return-Path: <linuxppc-dev+bounces-5069-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E098A0A116
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jan 2025 06:49:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YVSJL0CsNz3cGb;
	Sat, 11 Jan 2025 16:49:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::631"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736574546;
	cv=none; b=PqLkxp8V284C/KyoP+2FkxjlPhGc0h9PQ9JSQvQV8JyrsC8eIPIl0H+IYe0ZfAQrDU5/ua00+XU/s3WsH7l0XEkqruDrunteAZI11hvFs+hI7sP/KIqjjp8sSGWi+L14NPT5dcDfwEq9mpzdfQj4BmKP3+Gw3ca88DnqW0DSSjPN2jFV1XhLT2aRZ+2Yfb32mD+nNESO5B2hgCKCXldp/xnuIaZ5EmWsCwOIVbUaW9Yf98LZKONn8sEI8LK3ABtoO5OYXlaI4UIxhMcKNnCu7/M5MEnYmzu8u3vIuEC1+vaOYBVzRo5BcuUDX/IuzfLtqmOaddn0y1SjbdD0sQo+7g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736574546; c=relaxed/relaxed;
	bh=He/FF4mW6z63rm6Ez1fm+hLtPmYbF/A35f1xOajKz/c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QUYf42QPLgYKlzUErsxhqNm1/e1KjKjmFHCa/AoU+YZ8GjXLUnc80oHGdMSbxwf4gvJT/YjsTymQkcHyMaG9q64/JM4/l99giE6zMjQ17bdG+uXUAp1IKEqjQzHS7C78WSb+juA6S37sjarOxCRqDWXIQTltv24xgAbMWQb2YlPErgLDT+nAMEXKtMaaBGTh4DWGeASC2UkQoTly9lDTxdwM3XSO8nqkvJ84JBo8NM+rxjf9F7sh33rLNQYmSDxNpErHDz9YG61w9iijPKlXacQ0xCUSIvD65ROVR11iJsNzQHquWRXiBvjr+CXfN5iKoyY9kBmqd9cqQPk79XK8MQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=daynix.com; dkim=pass (2048-bit key; unprotected) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=ATMZMf1/; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=akihiko.odaki@daynix.com; receiver=lists.ozlabs.org) smtp.mailfrom=daynix.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=ATMZMf1/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=daynix.com (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=akihiko.odaki@daynix.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YVSJJ2JvXz3cTg
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jan 2025 16:49:04 +1100 (AEDT)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-21619108a6bso46614615ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2025 21:49:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1736574541; x=1737179341; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=He/FF4mW6z63rm6Ez1fm+hLtPmYbF/A35f1xOajKz/c=;
        b=ATMZMf1/dRFn344Ag6QrPD9TEKoF3rjTlfQkD3k5uewwzMDDhojlPZOlfUG5KR9DDL
         yRHaBjKT+knW9tVL1bxwOS8SY/+9eMbUZwvgsnEQGgxRBksaftMCSv4wxmNbgaq54cfD
         DP1vuGrNd1r1/+DxVTuVrGENNzRzqJ8FOsvIxMvZdxEE1k88x74rTWTPnBtv1xI1XneB
         bn68nkEEGvIRaHuzb6tp64q4hbU3imGd5lNSuouXdZ8bS/foik4Cji1TvscoyUglef4Z
         52sZEZoU9Q44xNKpVncRiwAnKdtQnZSeQ76JGljcdT8ARa7dtTbAL1wyQO2b2O2OHXHH
         7gCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736574541; x=1737179341;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=He/FF4mW6z63rm6Ez1fm+hLtPmYbF/A35f1xOajKz/c=;
        b=f4T4rouDh8g/sFuZz60jIolLSDzhrxG6uxH0YARJI0mYkMjiVj3Dyn5/C3fJ/PARpM
         k/FoV0KN8n7FX8pjp0oMTxfdmrwylEBSPi8MykUQvwPSFuPv3GMBp4MpamkADbQptcdh
         7aLZPGYzB+Sf3bv20BxN2JfcGtV6m6LuTuJjoHhCAqfGbg2xkiQO5hu7GiuIJWPgeDT2
         JT4IO1C1W87Ljj1RCIK3LgvJ5cDO1AmUotuo2De63HV6I91deVxxhPvBtnx9CzTL6//S
         gMr8Mg0ROQ6/uOE4PcaYDgmm4hWq7EOL72pPcvh4wq10dw6fPOphJpqTmDEG4uUXAU0p
         Eu4A==
X-Forwarded-Encrypted: i=1; AJvYcCXmqL7ptUZKDcqZy5fZfdN8bnZcfqygHZ78/7b0hApEHRjJ2Bm8AJsgWaMpvR26UwzxMPSqFlrNvUf8fu8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz+zgycTbU5s1p7y22oZjtXJiz6R5ORcLHgmPqwpbS+/Q48iYVh
	1cJjE3OzxliEWzJ16o82JltqBli/enXDaa9EtVm4C1OJ++3ph3qFh1tN5ifw5ww=
X-Gm-Gg: ASbGncsINiEj2MJ4Qq4YGl/zvZL57+268wz3OactB1xjIufQV1KEbJKdBCw4kZlcUbm
	yd0feUTHASvMYRVdKjg+UR02BCdbmPQD6C6W8+a12D6cat1DTnBGvMKLF02/WB9jZJjyfpYtTtt
	+pBNSkDUuMEel7+/uFt77tF/S8/m5GqJtQ55H6nodMlw/AlPMKCesMa1cJ2pjxmYkjyglrVtT7w
	RdhyHX6c8IoQhvMUYDIqvblk5Le/KSjJT3HXho65A+Wcu4jwzH60DJaFlM=
X-Google-Smtp-Source: AGHT+IHcpmdtla8m811pOhOWUKKg3mt5D2YgMgKQAi/FtxQToiO3ZEw9yK9yhc6mlxAM0lTabpo8Kw==
X-Received: by 2002:a05:6a00:cd6:b0:729:9f1:69bc with SMTP id d2e1a72fcca58-72d21f45b2fmr19552247b3a.12.1736574541182;
        Fri, 10 Jan 2025 21:49:01 -0800 (PST)
Received: from localhost ([157.82.203.37])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-72d405489e2sm2380384b3a.32.2025.01.10.21.48.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2025 21:49:00 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Sat, 11 Jan 2025 14:48:44 +0900
Subject: [PATCH v4 1/6] elf: Define note name macros
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250111-elf-v4-1-b3841fa0dcd9@daynix.com>
References: <20250111-elf-v4-0-b3841fa0dcd9@daynix.com>
In-Reply-To: <20250111-elf-v4-0-b3841fa0dcd9@daynix.com>
To: Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>, 
 Dave Martin <Dave.Martin@arm.com>, Baoquan He <bhe@redhat.com>, 
 Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>, 
 LEROY Christophe <christophe.leroy2@cs-soprasteria.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
 kexec@lists.infradead.org, binutils@sourceware.org, devel@daynix.com, 
 Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.14-dev-fd6e3
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

elf.h had a comment saying:
> Notes used in ET_CORE. Architectures export some of the arch register
> sets using the corresponding note types via the PTRACE_GETREGSET and
> PTRACE_SETREGSET requests.
> The note name for these types is "LINUX", except NT_PRFPREG that is
> named "CORE".

However, NT_PRSTATUS is also named "CORE". It is also unclear what
"these types" refers to.

To fix these problems, define a name for each note type. The added
definitions are macros so the kernel and userspace can directly refer to
them.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Acked-by: Baoquan He <bhe@redhat.com>
---
 include/uapi/linux/elf.h | 86 ++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 83 insertions(+), 3 deletions(-)

diff --git a/include/uapi/linux/elf.h b/include/uapi/linux/elf.h
index b44069d29cec..343f5c40d03a 100644
--- a/include/uapi/linux/elf.h
+++ b/include/uapi/linux/elf.h
@@ -368,99 +368,179 @@ typedef struct elf64_shdr {
 #define ELF_OSABI ELFOSABI_NONE
 #endif
 
+/* Note definitions: NN_ defines names. NT_ defines types. */
+
 /*
  * Notes used in ET_CORE. Architectures export some of the arch register sets
  * using the corresponding note types via the PTRACE_GETREGSET and
  * PTRACE_SETREGSET requests.
- * The note name for these types is "LINUX", except NT_PRFPREG that is named
- * "CORE".
  */
+#define NN_PRSTATUS	"CORE"
 #define NT_PRSTATUS	1
+#define NN_PRFPREG	"CORE"
 #define NT_PRFPREG	2
+#define NN_PRPSINFO	"CORE"
 #define NT_PRPSINFO	3
+#define NN_TASKSTRUCT	"CORE"
 #define NT_TASKSTRUCT	4
+#define NN_AUXV		"CORE"
 #define NT_AUXV		6
 /*
  * Note to userspace developers: size of NT_SIGINFO note may increase
  * in the future to accomodate more fields, don't assume it is fixed!
  */
+#define NN_SIGINFO      "CORE"
 #define NT_SIGINFO      0x53494749
+#define NN_FILE         "CORE"
 #define NT_FILE         0x46494c45
+#define NN_PRXFPREG     "LINUX"
 #define NT_PRXFPREG     0x46e62b7f      /* copied from gdb5.1/include/elf/common.h */
+#define NN_PPC_VMX	"LINUX"
 #define NT_PPC_VMX	0x100		/* PowerPC Altivec/VMX registers */
+#define NN_PPC_SPE	"LINUX"
 #define NT_PPC_SPE	0x101		/* PowerPC SPE/EVR registers */
+#define NN_PPC_VSX	"LINUX"
 #define NT_PPC_VSX	0x102		/* PowerPC VSX registers */
+#define NN_PPC_TAR	"LINUX"
 #define NT_PPC_TAR	0x103		/* Target Address Register */
+#define NN_PPC_PPR	"LINUX"
 #define NT_PPC_PPR	0x104		/* Program Priority Register */
+#define NN_PPC_DSCR	"LINUX"
 #define NT_PPC_DSCR	0x105		/* Data Stream Control Register */
+#define NN_PPC_EBB	"LINUX"
 #define NT_PPC_EBB	0x106		/* Event Based Branch Registers */
+#define NN_PPC_PMU	"LINUX"
 #define NT_PPC_PMU	0x107		/* Performance Monitor Registers */
+#define NN_PPC_TM_CGPR	"LINUX"
 #define NT_PPC_TM_CGPR	0x108		/* TM checkpointed GPR Registers */
+#define NN_PPC_TM_CFPR	"LINUX"
 #define NT_PPC_TM_CFPR	0x109		/* TM checkpointed FPR Registers */
+#define NN_PPC_TM_CVMX	"LINUX"
 #define NT_PPC_TM_CVMX	0x10a		/* TM checkpointed VMX Registers */
+#define NN_PPC_TM_CVSX	"LINUX"
 #define NT_PPC_TM_CVSX	0x10b		/* TM checkpointed VSX Registers */
+#define NN_PPC_TM_SPR	"LINUX"
 #define NT_PPC_TM_SPR	0x10c		/* TM Special Purpose Registers */
+#define NN_PPC_TM_CTAR	"LINUX"
 #define NT_PPC_TM_CTAR	0x10d		/* TM checkpointed Target Address Register */
+#define NN_PPC_TM_CPPR	"LINUX"
 #define NT_PPC_TM_CPPR	0x10e		/* TM checkpointed Program Priority Register */
+#define NN_PPC_TM_CDSCR	"LINUX"
 #define NT_PPC_TM_CDSCR	0x10f		/* TM checkpointed Data Stream Control Register */
+#define NN_PPC_PKEY	"LINUX"
 #define NT_PPC_PKEY	0x110		/* Memory Protection Keys registers */
+#define NN_PPC_DEXCR	"LINUX"
 #define NT_PPC_DEXCR	0x111		/* PowerPC DEXCR registers */
+#define NN_PPC_HASHKEYR	"LINUX"
 #define NT_PPC_HASHKEYR	0x112		/* PowerPC HASHKEYR register */
+#define NN_386_TLS	"LINUX"
 #define NT_386_TLS	0x200		/* i386 TLS slots (struct user_desc) */
+#define NN_386_IOPERM	"LINUX"
 #define NT_386_IOPERM	0x201		/* x86 io permission bitmap (1=deny) */
+#define NN_X86_XSTATE	"LINUX"
 #define NT_X86_XSTATE	0x202		/* x86 extended state using xsave */
 /* Old binutils treats 0x203 as a CET state */
+#define NN_X86_SHSTK	"LINUX"
 #define NT_X86_SHSTK	0x204		/* x86 SHSTK state */
+#define NN_X86_XSAVE_LAYOUT	"LINUX"
 #define NT_X86_XSAVE_LAYOUT	0x205	/* XSAVE layout description */
+#define NN_S390_HIGH_GPRS	"LINUX"
 #define NT_S390_HIGH_GPRS	0x300	/* s390 upper register halves */
+#define NN_S390_TIMER	"LINUX"
 #define NT_S390_TIMER	0x301		/* s390 timer register */
+#define NN_S390_TODCMP	"LINUX"
 #define NT_S390_TODCMP	0x302		/* s390 TOD clock comparator register */
+#define NN_S390_TODPREG	"LINUX"
 #define NT_S390_TODPREG	0x303		/* s390 TOD programmable register */
+#define NN_S390_CTRS	"LINUX"
 #define NT_S390_CTRS	0x304		/* s390 control registers */
+#define NN_S390_PREFIX	"LINUX"
 #define NT_S390_PREFIX	0x305		/* s390 prefix register */
+#define NN_S390_LAST_BREAK	"LINUX"
 #define NT_S390_LAST_BREAK	0x306	/* s390 breaking event address */
+#define NN_S390_SYSTEM_CALL	"LINUX"
 #define NT_S390_SYSTEM_CALL	0x307	/* s390 system call restart data */
+#define NN_S390_TDB	"LINUX"
 #define NT_S390_TDB	0x308		/* s390 transaction diagnostic block */
+#define NN_S390_VXRS_LOW	"LINUX"
 #define NT_S390_VXRS_LOW	0x309	/* s390 vector registers 0-15 upper half */
+#define NN_S390_VXRS_HIGH	"LINUX"
 #define NT_S390_VXRS_HIGH	0x30a	/* s390 vector registers 16-31 */
+#define NN_S390_GS_CB	"LINUX"
 #define NT_S390_GS_CB	0x30b		/* s390 guarded storage registers */
+#define NN_S390_GS_BC	"LINUX"
 #define NT_S390_GS_BC	0x30c		/* s390 guarded storage broadcast control block */
+#define NN_S390_RI_CB	"LINUX"
 #define NT_S390_RI_CB	0x30d		/* s390 runtime instrumentation */
+#define NN_S390_PV_CPU_DATA	"LINUX"
 #define NT_S390_PV_CPU_DATA	0x30e	/* s390 protvirt cpu dump data */
+#define NN_ARM_VFP	"LINUX"
 #define NT_ARM_VFP	0x400		/* ARM VFP/NEON registers */
+#define NN_ARM_TLS	"LINUX"
 #define NT_ARM_TLS	0x401		/* ARM TLS register */
+#define NN_ARM_HW_BREAK	"LINUX"
 #define NT_ARM_HW_BREAK	0x402		/* ARM hardware breakpoint registers */
+#define NN_ARM_HW_WATCH	"LINUX"
 #define NT_ARM_HW_WATCH	0x403		/* ARM hardware watchpoint registers */
+#define NN_ARM_SYSTEM_CALL	"LINUX"
 #define NT_ARM_SYSTEM_CALL	0x404	/* ARM system call number */
+#define NN_ARM_SVE	"LINUX"
 #define NT_ARM_SVE	0x405		/* ARM Scalable Vector Extension registers */
+#define NN_ARM_PAC_MASK		"LINUX"
 #define NT_ARM_PAC_MASK		0x406	/* ARM pointer authentication code masks */
+#define NN_ARM_PACA_KEYS	"LINUX"
 #define NT_ARM_PACA_KEYS	0x407	/* ARM pointer authentication address keys */
+#define NN_ARM_PACG_KEYS	"LINUX"
 #define NT_ARM_PACG_KEYS	0x408	/* ARM pointer authentication generic key */
+#define NN_ARM_TAGGED_ADDR_CTRL	"LINUX"
 #define NT_ARM_TAGGED_ADDR_CTRL	0x409	/* arm64 tagged address control (prctl()) */
+#define NN_ARM_PAC_ENABLED_KEYS	"LINUX"
 #define NT_ARM_PAC_ENABLED_KEYS	0x40a	/* arm64 ptr auth enabled keys (prctl()) */
+#define NN_ARM_SSVE	"LINUX"
 #define NT_ARM_SSVE	0x40b		/* ARM Streaming SVE registers */
+#define NN_ARM_ZA	"LINUX"
 #define NT_ARM_ZA	0x40c		/* ARM SME ZA registers */
+#define NN_ARM_ZT	"LINUX"
 #define NT_ARM_ZT	0x40d		/* ARM SME ZT registers */
+#define NN_ARM_FPMR	"LINUX"
 #define NT_ARM_FPMR	0x40e		/* ARM floating point mode register */
+#define NN_ARM_POE	"LINUX"
 #define NT_ARM_POE	0x40f		/* ARM POE registers */
+#define NN_ARM_GCS	"LINUX"
 #define NT_ARM_GCS	0x410		/* ARM GCS state */
+#define NN_ARC_V2	"LINUX"
 #define NT_ARC_V2	0x600		/* ARCv2 accumulator/extra registers */
+#define NN_VMCOREDD	"LINUX"
 #define NT_VMCOREDD	0x700		/* Vmcore Device Dump Note */
+#define NN_MIPS_DSP	"LINUX"
 #define NT_MIPS_DSP	0x800		/* MIPS DSP ASE registers */
+#define NN_MIPS_FP_MODE	"LINUX"
 #define NT_MIPS_FP_MODE	0x801		/* MIPS floating-point mode */
+#define NN_MIPS_MSA	"LINUX"
 #define NT_MIPS_MSA	0x802		/* MIPS SIMD registers */
+#define NN_RISCV_CSR	"LINUX"
 #define NT_RISCV_CSR	0x900		/* RISC-V Control and Status Registers */
+#define NN_RISCV_VECTOR	"LINUX"
 #define NT_RISCV_VECTOR	0x901		/* RISC-V vector registers */
+#define NN_RISCV_TAGGED_ADDR_CTRL "LINUX"
 #define NT_RISCV_TAGGED_ADDR_CTRL 0x902	/* RISC-V tagged address control (prctl()) */
+#define NN_LOONGARCH_CPUCFG	"LINUX"
 #define NT_LOONGARCH_CPUCFG	0xa00	/* LoongArch CPU config registers */
+#define NN_LOONGARCH_CSR	"LINUX"
 #define NT_LOONGARCH_CSR	0xa01	/* LoongArch control and status registers */
+#define NN_LOONGARCH_LSX	"LINUX"
 #define NT_LOONGARCH_LSX	0xa02	/* LoongArch Loongson SIMD Extension registers */
+#define NN_LOONGARCH_LASX	"LINUX"
 #define NT_LOONGARCH_LASX	0xa03	/* LoongArch Loongson Advanced SIMD Extension registers */
+#define NN_LOONGARCH_LBT	"LINUX"
 #define NT_LOONGARCH_LBT	0xa04	/* LoongArch Loongson Binary Translation registers */
+#define NN_LOONGARCH_HW_BREAK	"LINUX"
 #define NT_LOONGARCH_HW_BREAK	0xa05   /* LoongArch hardware breakpoint registers */
+#define NN_LOONGARCH_HW_WATCH	"LINUX"
 #define NT_LOONGARCH_HW_WATCH	0xa06   /* LoongArch hardware watchpoint registers */
 
-/* Note types with note name "GNU" */
+/* Note used in other file types. */
+#define NN_GNU_PROPERTY_TYPE_0	"GNU"
 #define NT_GNU_PROPERTY_TYPE_0	5
 
 /* Note header in a PT_NOTE section */

-- 
2.47.1


