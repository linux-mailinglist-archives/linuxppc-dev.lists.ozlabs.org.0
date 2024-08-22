Return-Path: <linuxppc-dev+bounces-367-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 72FA195B98B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 17:12:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqRWz0djvz2ync;
	Fri, 23 Aug 2024 01:12:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724339551;
	cv=none; b=dk4wRO/bvKYxRPWlWkR3kdloS+w37IThm/KyrINVt2JbKymMiOB8kRoTwlXuYQW177jtiNFCm88wGCtVNmRRdHLRpPl2L+zyNXnpAcDMR0WIW6uDunNuk98JV9Xwpl6zRqG0AkEbHZWAQCgSnMlfqepwIhipRSF5NlRafDEv128/E+ErU1iBqmv9x361V8hH54FVRcDpBrxl++Dj9wb+794ul7rSAdoa8YpCIJkVc7EdTP76jFPSCDrD/0T7+9HRuXAdln+/dhNBljY116FY+1kJ8LDY7zXAAgW0I57Kr+8HP5HgXIaWrFqWet3akPF5/FFPV5HoGUWmaBlZyu05MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724339551; c=relaxed/relaxed;
	bh=MNrTMGsD5+rmAx8lQBjnHgQzdbxN8x//itlGnFpXYu0=;
	h=Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding; b=X+DMkA8WVxrrCq5oGfrHknMWUSn0Fz8LydzuJz1hmaJZLGnPSYMyH+0cLAglwMT420cJd6wJDy/shSpc8hg+oNiQwdYSU3tRj6qSdS03Hfz4IhZjhjFfhULdkf/0cwPq4fYEqN63LJpgH3XGvSggGVGc2dv8RmzW4ts5SfYqeErScWLshur/1kvH3lbJZJyssxgo2N+G7lkijVxmDBXuJywM9nbdoRIkoUEwrFFvA7WbWtVFlHZl/o5R/z4KvP9bXXgh8JcWhyhnqibogx7oHR24y+8NDWPVo17no5zOOBf2vF/bscfdCtPByWL3jxGAx8huODV/pU1MaE6VXAFyHA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=joey.gouly@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=joey.gouly@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqRWy5qZQz2yhn
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 01:12:30 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EE16915A1;
	Thu, 22 Aug 2024 08:12:11 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CF9E83F58B;
	Thu, 22 Aug 2024 08:11:41 -0700 (PDT)
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
Subject: [PATCH v5 05/30] arm64: cpufeature: add Permission Overlay Extension cpucap
Date: Thu, 22 Aug 2024 16:10:48 +0100
Message-Id: <20240822151113.1479789-6-joey.gouly@arm.com>
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

This indicates if the system supports POE. This is a CPUCAP_BOOT_CPU_FEATURE
as the boot CPU will enable POE if it has it, so secondary CPUs must also
have this feature.

Signed-off-by: Joey Gouly <joey.gouly@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm64/kernel/cpufeature.c | 9 +++++++++
 arch/arm64/tools/cpucaps       | 1 +
 2 files changed, 10 insertions(+)

diff --git arch/arm64/kernel/cpufeature.c arch/arm64/kernel/cpufeature.c
index 646ecd3069fd..2daf5597cd65 100644
--- arch/arm64/kernel/cpufeature.c
+++ arch/arm64/kernel/cpufeature.c
@@ -2870,6 +2870,15 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
 		.matches = has_nv1,
 		ARM64_CPUID_FIELDS_NEG(ID_AA64MMFR4_EL1, E2H0, NI_NV1)
 	},
+#ifdef CONFIG_ARM64_POE
+	{
+		.desc = "Stage-1 Permission Overlay Extension (S1POE)",
+		.capability = ARM64_HAS_S1POE,
+		.type = ARM64_CPUCAP_BOOT_CPU_FEATURE,
+		.matches = has_cpuid_feature,
+		ARM64_CPUID_FIELDS(ID_AA64MMFR3_EL1, S1POE, IMP)
+	},
+#endif
 	{},
 };
 
diff --git arch/arm64/tools/cpucaps arch/arm64/tools/cpucaps
index ac3429d892b9..eedb5acc21ed 100644
--- arch/arm64/tools/cpucaps
+++ arch/arm64/tools/cpucaps
@@ -45,6 +45,7 @@ HAS_MOPS
 HAS_NESTED_VIRT
 HAS_PAN
 HAS_S1PIE
+HAS_S1POE
 HAS_RAS_EXTN
 HAS_RNG
 HAS_SB
-- 
2.25.1


