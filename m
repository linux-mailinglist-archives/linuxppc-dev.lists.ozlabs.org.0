Return-Path: <linuxppc-dev+bounces-381-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F27F95B9BF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 17:14:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqRXy2GmSz2ypV;
	Fri, 23 Aug 2024 01:13:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724339602;
	cv=none; b=l8tXRO3ayjkc322sSOZV2cGkwHYMqhW3blDz422y0kuKttgI2zgpgiGvGeQ82FGpDggFzk3F9d5PjYUmuzGgxN9XLGVWmouS4uZ8NIeJyBlADpuwH4GSiDbmR7LpzX/57UkgZSI1E9OIpK3zxz02ft0LbXvpgz++XtjZs92i6/LtvXQygGuz6JbrLTzjqklJbOf0/Ut3EQMuUlVxje5iw69iaH25r0MmWy4lddwiXMPkvE/O6OGPFgulrO8t1LszReSZJOVb7m39pQ0EW8+dXBPh27YM/dgKm08h1vWD1jM5h5xZSRl/AbTYO7PeCfoiZLAd9FUgQ5Zj+Zzr/kIwLw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724339602; c=relaxed/relaxed;
	bh=Q2RRx8rLkC5P4E8tx9Rk6lKwVPDwmtzasYWwFlURekc=;
	h=Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding; b=AzblovaR6v2dtaOz/pRpmYgczsW+HkwBPv+E0e4sG+EWAcYAdQ9NlI9WXH2g8wX2MCfXJIn79nzsQVz965T1ajdetbO1OXJ9ifZOJhCryt/2G4LW+GtS/FaredoYiuq+1a4QP2og/nkxJA5eyKuYMIz8ZQZ/S31wzlDqvH8b+FtXA7y1R2ogrh5IgqB03tZXiBvEuQKvATQTxGICnxhM/e/SXTq/6PqTG5VrUYdcHHK0FjqhM9vsNOOxYoJ2NYv6K3h8kZZnHiy3+whAFDLCsWh9JY5p6UxtmHjyd+Iily0yhFWnil9wIufGJ70+XfU9Vt+KsLmrPjWqTj3d6cEtrA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=joey.gouly@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=joey.gouly@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqRXx6My8z2yhT
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 01:13:21 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E136A1595;
	Thu, 22 Aug 2024 08:13:16 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C28523F58B;
	Thu, 22 Aug 2024 08:12:46 -0700 (PDT)
From: Joey Gouly <joey.gouly@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: nd@arm.com,
	akpm@linux-foundation.org,
	aneesh.kumar@kernel.org,
	aneesh.kumar@linux.ibm.com,
	anshuman.khandual@arm.com,
	bp@alien8.de,
	broonie@kernel.org,
	catalin.marinas@arm.com,
	christophe.leroy@csgroup.eu,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	joey.gouly@arm.com,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	maz@kernel.org,
	mingo@redhat.com,
	mpe@ellerman.id.au,
	naveen.n.rao@linux.ibm.com,
	npiggin@gmail.com,
	oliver.upton@linux.dev,
	shuah@kernel.org,
	skhan@linuxfoundation.org,
	szabolcs.nagy@arm.com,
	tglx@linutronix.de,
	will@kernel.org,
	x86@kernel.org,
	kvmarm@lists.linux.dev,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v5 20/30] arm64/ptrace: add support for FEAT_POE
Date: Thu, 22 Aug 2024 16:11:03 +0100
Message-Id: <20240822151113.1479789-21-joey.gouly@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240822151113.1479789-1-joey.gouly@arm.com>
References: <20240822151113.1479789-1-joey.gouly@arm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a regset for POE containing POR_EL0.

Signed-off-by: Joey Gouly <joey.gouly@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Reviewed-by: Mark Brown <broonie@kernel.org>
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm64/kernel/ptrace.c | 46 ++++++++++++++++++++++++++++++++++++++
 include/uapi/linux/elf.h   |  1 +
 2 files changed, 47 insertions(+)

diff --git arch/arm64/kernel/ptrace.c arch/arm64/kernel/ptrace.c
index 0d022599eb61..b756578aeaee 100644
--- arch/arm64/kernel/ptrace.c
+++ arch/arm64/kernel/ptrace.c
@@ -1440,6 +1440,39 @@ static int tagged_addr_ctrl_set(struct task_struct *target, const struct
 }
 #endif
 
+#ifdef CONFIG_ARM64_POE
+static int poe_get(struct task_struct *target,
+		   const struct user_regset *regset,
+		   struct membuf to)
+{
+	if (!system_supports_poe())
+		return -EINVAL;
+
+	return membuf_write(&to, &target->thread.por_el0,
+			    sizeof(target->thread.por_el0));
+}
+
+static int poe_set(struct task_struct *target, const struct
+		   user_regset *regset, unsigned int pos,
+		   unsigned int count, const void *kbuf, const
+		   void __user *ubuf)
+{
+	int ret;
+	long ctrl;
+
+	if (!system_supports_poe())
+		return -EINVAL;
+
+	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, &ctrl, 0, -1);
+	if (ret)
+		return ret;
+
+	target->thread.por_el0 = ctrl;
+
+	return 0;
+}
+#endif
+
 enum aarch64_regset {
 	REGSET_GPR,
 	REGSET_FPR,
@@ -1469,6 +1502,9 @@ enum aarch64_regset {
 #ifdef CONFIG_ARM64_TAGGED_ADDR_ABI
 	REGSET_TAGGED_ADDR_CTRL,
 #endif
+#ifdef CONFIG_ARM64_POE
+	REGSET_POE
+#endif
 };
 
 static const struct user_regset aarch64_regsets[] = {
@@ -1628,6 +1664,16 @@ static const struct user_regset aarch64_regsets[] = {
 		.set = tagged_addr_ctrl_set,
 	},
 #endif
+#ifdef CONFIG_ARM64_POE
+	[REGSET_POE] = {
+		.core_note_type = NT_ARM_POE,
+		.n = 1,
+		.size = sizeof(long),
+		.align = sizeof(long),
+		.regset_get = poe_get,
+		.set = poe_set,
+	},
+#endif
 };
 
 static const struct user_regset_view user_aarch64_view = {
diff --git include/uapi/linux/elf.h include/uapi/linux/elf.h
index b54b313bcf07..81762ff3c99e 100644
--- include/uapi/linux/elf.h
+++ include/uapi/linux/elf.h
@@ -441,6 +441,7 @@ typedef struct elf64_shdr {
 #define NT_ARM_ZA	0x40c		/* ARM SME ZA registers */
 #define NT_ARM_ZT	0x40d		/* ARM SME ZT registers */
 #define NT_ARM_FPMR	0x40e		/* ARM floating point mode register */
+#define NT_ARM_POE	0x40f		/* ARM POE registers */
 #define NT_ARC_V2	0x600		/* ARCv2 accumulator/extra registers */
 #define NT_VMCOREDD	0x700		/* Vmcore Device Dump Note */
 #define NT_MIPS_DSP	0x800		/* MIPS DSP ASE registers */
-- 
2.25.1


