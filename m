Return-Path: <linuxppc-dev+bounces-4666-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CF3A0177E
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Jan 2025 01:27:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YQdRv37J5z2yWr;
	Sun,  5 Jan 2025 11:27:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::632"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736001532;
	cv=none; b=kij/MuUySLLBHglaEd3JQP1w9CGLbWHTKxCkn0XeAXE6rizkDc+cXOvWBTWtgZF9uknMoFpgDsg0Wv76F/tCxhpQ1wJB2sgfMcJiJeucMCXDy5Gvn6LnOtSsKijvx5SFdvPXP8L4VNHWRgCkNWO4p3MKkZNgJe+7ZUH/x64ZYoH9rRBemgFZumlMChvTu/2yZwBTjo3rCwOyG5JpiHwy5ZP+IDF7fFQucoQoHcdnswzF5wJ6TXGZqWPwwXH0xKKpRK7w+8IGHnhf5ZLHzxjRr+J/QJ9dnh/2acynGInhIbJu6eNUQP/6fJ4iZqYCy7VqDtfbC2ceZhSYv4mMAdvU8g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736001532; c=relaxed/relaxed;
	bh=3DDRJB8oNZeq6N6MlMy+rUGIqaIntb5QA28c12Ptyck=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A++Mtw0wILhvCwdhPc4yZbetcxu7wllel142aeJX3JcZK2kl3JcM8zikZguP/if5Kc/2LZP4a1btZnlPYbOEwZALfjOISbdCMvhuTTrzXpu5npevGiS4C7oqSm38Xe3YxmqC2a9qOEZUyKWfIc9SO7O6uFUAWFQkn87rGXUIq9qyddUS+iiJxZkz42A8toMVffj8udgZJy884mLXeLr/KqvfEZJhdcMy1IFkkwcljcgdxC8dD/BIbXIpux8xPWgTOlbWAr2mA5A/giBwxiv7S68SVX2IPzhAsRbyDNozmrPOG+T7czXA7Kes2Viik41oQedEhJIfYBukr/zc7E5Wrw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=daynix.com; dkim=pass (2048-bit key; unprotected) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=Ac0uqV1z; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=akihiko.odaki@daynix.com; receiver=lists.ozlabs.org) smtp.mailfrom=daynix.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=Ac0uqV1z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=daynix.com (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=akihiko.odaki@daynix.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YQNNq47sSz2yG9
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 Jan 2025 01:38:51 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-21670dce0a7so110970225ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 04 Jan 2025 06:38:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1736001529; x=1736606329; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3DDRJB8oNZeq6N6MlMy+rUGIqaIntb5QA28c12Ptyck=;
        b=Ac0uqV1zsQL/8FhMTrV+uVkjPtSS9WC16VI5hAQkJxb5svswWCy/ytnEbUyx4lpIIj
         b31g0aa5Ti9uugIXNge72svaQam+yMvJvOroxcqQHzQnU3e4s41gDiyKql7p0Ya4PVpW
         TfmG6sp/ChEku21CEybBXS3tHOOW6vRT+giDZV0JMCD5WfqDZY57g3nT1oQmYdJWt5+S
         itl5eXizAVTKHNd3rcX/WCSxJKPuGy3nr64n5wsZ3znBQF0Pjx+4PB7bC/w82osWrMfO
         VDZr7zNnHTYhmqXJcwnWyoduC48JiuZa04+2biQ94OBRZ0ZNea0Oow11DQT5biKbawk7
         avcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736001529; x=1736606329;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3DDRJB8oNZeq6N6MlMy+rUGIqaIntb5QA28c12Ptyck=;
        b=szVCXy5S+u7odR4nxv3+qDEbetFi2B9QG0QcXT0i26EQozNK3d4fFVpAYh8kHzCXD0
         H3IVIwYEJYFYU0qSoTL2kcerZKtuEW/Z9MImE0VO8MRH+76bGDqEOKxAdabKXiM52Nul
         E1YARKnfojgbL++kaSZjpskTL7Q1lCrQlPp7zWKa0trmf6uMMj8fFt396IY7BINXmowp
         FZPgTcmkqMmE1sBzo2/0nFo3C1A+I6fjwWmcbJxskBOpqjf2iei8Pxc/fyF11fwgN+V2
         4GpY205igYMlG6gaJg/56DoIfHhsvr+D2T2h/YFY/4mNuRv3LiZrWDvec9CL4wKHo6Gi
         b0Vw==
X-Forwarded-Encrypted: i=1; AJvYcCUBWEAKAztmvQwYfF7Tdp/rJX1JlhJ9rptfIt5rX7BDNHltozjEaWgFWbfomRIuGkmQaVK0wL0M+2k5QNI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxKqt4nLvq4WQbzq0p+DZMRXHumXC3694PPLRAhRWsdLMGvhJ3a
	3wlG72KlVCjIAB52l2Pz/VF6aQ76dmGnn+GPHG3wGu7l/ecm1VVPqcRCty7SbnE=
X-Gm-Gg: ASbGnctuB6IKQtxGQLHb9d5a2kLDWkqdwbcWOUL9Nq+O5SgPGHz+HAa286uBHEF0p71
	WAG7rJzJ3H/KS3Ppn8j6TQz94K2hcRwcspGT4KHYR0iUX6FOViv9hjFUsqlaXoNuTxL+VF/nvcx
	HRAtfR3fwBDcVmpbMYS5lFFpBC58z1toT33R2hLhh9+wEdHRDgLhy3Saf6AbyNg96qTkXsxR8dn
	BGM8na1cwXeEh5yx/vLYpDSMYwGE7fnDVEin7m5hZ2G7OOCvOvGur6/UjDhMw0=
X-Google-Smtp-Source: AGHT+IHXNTPwYGpyoF2oIO9YtYeoBNZ9bkHyASDQWStwZpuI0NOPrSg1SLgfLCaPbrvbr04vYZJzgg==
X-Received: by 2002:a17:902:e5c7:b0:215:bf1b:a894 with SMTP id d9443c01a7336-219e6eb5bffmr760628135ad.24.1736001528912;
        Sat, 04 Jan 2025 06:38:48 -0800 (PST)
Received: from localhost ([2400:4050:b783:b00:4952:3c52:120a:27e9])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-219dc962c5esm260927675ad.12.2025.01.04.06.38.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Jan 2025 06:38:48 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Sat, 04 Jan 2025 23:38:34 +0900
Subject: [PATCH v2 1/5] elf: Define note name macros
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
Message-Id: <20250104-elf-v2-1-77dc2e06db4e@daynix.com>
References: <20250104-elf-v2-0-77dc2e06db4e@daynix.com>
In-Reply-To: <20250104-elf-v2-0-77dc2e06db4e@daynix.com>
To: Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>, 
 Dave Martin <Dave.Martin@arm.com>, Baoquan He <bhe@redhat.com>, 
 Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
 kexec@lists.infradead.org, devel@daynix.com, 
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
---
 include/uapi/linux/elf.h | 86 ++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 83 insertions(+), 3 deletions(-)

diff --git a/include/uapi/linux/elf.h b/include/uapi/linux/elf.h
index b44069d29cec..014b705b97d7 100644
--- a/include/uapi/linux/elf.h
+++ b/include/uapi/linux/elf.h
@@ -372,8 +372,6 @@ typedef struct elf64_shdr {
  * Notes used in ET_CORE. Architectures export some of the arch register sets
  * using the corresponding note types via the PTRACE_GETREGSET and
  * PTRACE_SETREGSET requests.
- * The note name for these types is "LINUX", except NT_PRFPREG that is named
- * "CORE".
  */
 #define NT_PRSTATUS	1
 #define NT_PRFPREG	2
@@ -460,9 +458,91 @@ typedef struct elf64_shdr {
 #define NT_LOONGARCH_HW_BREAK	0xa05   /* LoongArch hardware breakpoint registers */
 #define NT_LOONGARCH_HW_WATCH	0xa06   /* LoongArch hardware watchpoint registers */
 
-/* Note types with note name "GNU" */
+/* Note used in ET_EXEC and ET_DYN. */
 #define NT_GNU_PROPERTY_TYPE_0	5
 
+/* Note names */
+#define NN_PRSTATUS	"CORE"
+#define NN_PRFPREG	"CORE"
+#define NN_PRPSINFO	"CORE"
+#define NN_TASKSTRUCT	"CORE"
+#define NN_AUXV	"CORE"
+#define NN_SIGINFO	"CORE"
+#define NN_FILE	"CORE"
+#define NN_PRXFPREG	"LINUX"
+#define NN_PPC_VMX	"LINUX"
+#define NN_PPC_SPE	"LINUX"
+#define NN_PPC_VSX	"LINUX"
+#define NN_PPC_TAR	"LINUX"
+#define NN_PPC_PPR	"LINUX"
+#define NN_PPC_DSCR	"LINUX"
+#define NN_PPC_EBB	"LINUX"
+#define NN_PPC_PMU	"LINUX"
+#define NN_PPC_TM_CGPR	"LINUX"
+#define NN_PPC_TM_CFPR	"LINUX"
+#define NN_PPC_TM_CVMX	"LINUX"
+#define NN_PPC_TM_CVSX	"LINUX"
+#define NN_PPC_TM_SPR	"LINUX"
+#define NN_PPC_TM_CTAR	"LINUX"
+#define NN_PPC_TM_CPPR	"LINUX"
+#define NN_PPC_TM_CDSCR	"LINUX"
+#define NN_PPC_PKEY	"LINUX"
+#define NN_PPC_DEXCR	"LINUX"
+#define NN_PPC_HASHKEYR	"LINUX"
+#define NN_386_TLS	"LINUX"
+#define NN_386_IOPERM	"LINUX"
+#define NN_X86_XSTATE	"LINUX"
+#define NN_X86_SHSTK	"LINUX"
+#define NN_X86_XSAVE_LAYOUT	"LINUX"
+#define NN_S390_HIGH_GPRS	"LINUX"
+#define NN_S390_TIMER	"LINUX"
+#define NN_S390_TODCMP	"LINUX"
+#define NN_S390_TODPREG	"LINUX"
+#define NN_S390_CTRS	"LINUX"
+#define NN_S390_PREFIX	"LINUX"
+#define NN_S390_LAST_BREAK	"LINUX"
+#define NN_S390_SYSTEM_CALL	"LINUX"
+#define NN_S390_TDB	"LINUX"
+#define NN_S390_VXRS_LOW	"LINUX"
+#define NN_S390_VXRS_HIGH	"LINUX"
+#define NN_S390_GS_CB	"LINUX"
+#define NN_S390_GS_BC	"LINUX"
+#define NN_S390_RI_CB	"LINUX"
+#define NN_S390_PV_CPU_DATA	"LINUX"
+#define NN_ARM_VFP	"LINUX"
+#define NN_ARM_TLS	"LINUX"
+#define NN_ARM_HW_BREAK	"LINUX"
+#define NN_ARM_HW_WATCH	"LINUX"
+#define NN_ARM_SYSTEM_CALL	"LINUX"
+#define NN_ARM_SVE	"LINUX"
+#define NN_ARM_PAC_MASK	"LINUX"
+#define NN_ARM_PACA_KEYS	"LINUX"
+#define NN_ARM_PACG_KEYS	"LINUX"
+#define NN_ARM_TAGGED_ADDR_CTRL	"LINUX"
+#define NN_ARM_PAC_ENABLED_KEYS	"LINUX"
+#define NN_ARM_SSVE	"LINUX"
+#define NN_ARM_ZA	"LINUX"
+#define NN_ARM_ZT	"LINUX"
+#define NN_ARM_FPMR	"LINUX"
+#define NN_ARM_POE	"LINUX"
+#define NN_ARM_GCS	"LINUX"
+#define NN_ARC_V2	"LINUX"
+#define NN_VMCOREDD	"LINUX"
+#define NN_MIPS_DSP	"LINUX"
+#define NN_MIPS_FP_MODE	"LINUX"
+#define NN_MIPS_MSA	"LINUX"
+#define NN_RISCV_CSR	"LINUX"
+#define NN_RISCV_VECTOR	"LINUX"
+#define NN_RISCV_TAGGED_ADDR_CTRL	"LINUX"
+#define NN_LOONGARCH_CPUCFG	"LINUX"
+#define NN_LOONGARCH_CSR	"LINUX"
+#define NN_LOONGARCH_LSX	"LINUX"
+#define NN_LOONGARCH_LASX	"LINUX"
+#define NN_LOONGARCH_LBT	"LINUX"
+#define NN_LOONGARCH_HW_BREAK	"LINUX"
+#define NN_LOONGARCH_HW_WATCH	"LINUX"
+#define NN_GNU_PROPERTY_TYPE_0	"GNU"
+
 /* Note header in a PT_NOTE section */
 typedef struct elf32_note {
   Elf32_Word	n_namesz;	/* Name size */

-- 
2.47.1


