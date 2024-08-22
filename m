Return-Path: <linuxppc-dev+bounces-369-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 96AEA95B991
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 17:13:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqRWz3T5Cz2ypj;
	Fri, 23 Aug 2024 01:12:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724339551;
	cv=none; b=gPvhCCk8al3nr4Kfm6pKEsqQTW86bvQraaqLjr9VJiSoHMqW10lnOEUibwbT/LYikFminw5GpnO9c8TqEx2VQOduX5Kg3XdShy5Xn+UMqq/qUScnEEFuttj4L22akvyMYQk8yBRVpnfD7JOrGtF1+Wl6aW1r3A45XjOAx4JHnCZWzrXvMctmE39pp0RQRuCnoBNPZAroLUZULH0MHSVgVA7ys5w/13BdZaW3J17mcbgJoAtLpYG7TpDRdYadla55D7AU/x1Th5cGElZnxXLKeenshbQAZTSF1PJjRy2RU6fHYU0y6vnZSb0agqIKLe2dMy/U0JDbaHufFcgmg7SokQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724339551; c=relaxed/relaxed;
	bh=LhhrQ4+z6yOEiKUoxQMrbV+q630Q9+dPEjR6MmHWyIE=;
	h=Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding; b=KzcaxS62oV9OW4nKEVOlwUD8YYtbf9ypSK7+EXoj4g6IltNhQWasPKxI5dSiGyVTFuzusHpLUw8b3k7A7H/uStFEgNA5hwkYlYmQ7I1VabeF74JavuLO1ZzLwUdIzm+f0RL8CItyTkaGQZIGokC35vnIOday9GLMlW3rscjt1utU1q6B2edxGkgYBOxO80buvi0mseZH2hyzQLaM6ygjG5ZrIOyoW/dZ3PRQhxL6VflVe3/9F34eqOggpMdXxQym2qd1IeGmKbyTKdC5h3gXzRx61eUsCRlJQk4qoD/lx7Epe8uujlAuIsY72aR47SY1RZ1aYps72tz28pv4lW33qQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=joey.gouly@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=joey.gouly@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqRWz0kSsz2ynf
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 01:12:31 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E3E751650;
	Thu, 22 Aug 2024 08:12:24 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C53D43F58B;
	Thu, 22 Aug 2024 08:11:54 -0700 (PDT)
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
Subject: [PATCH v5 08/30] KVM: arm64: make kvm_at() take an OP_AT_*
Date: Thu, 22 Aug 2024 16:10:51 +0100
Message-Id: <20240822151113.1479789-9-joey.gouly@arm.com>
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

To allow using newer instructions that current assemblers don't know about,
replace the `at` instruction with the underlying SYS instruction.

Signed-off-by: Joey Gouly <joey.gouly@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Reviewed-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/kvm_asm.h       | 3 ++-
 arch/arm64/kvm/hyp/include/hyp/fault.h | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git arch/arm64/include/asm/kvm_asm.h arch/arm64/include/asm/kvm_asm.h
index 2181a11b9d92..38d7bfa3966a 100644
--- arch/arm64/include/asm/kvm_asm.h
+++ arch/arm64/include/asm/kvm_asm.h
@@ -9,6 +9,7 @@
 
 #include <asm/hyp_image.h>
 #include <asm/insn.h>
+#include <asm/sysreg.h>
 #include <asm/virt.h>
 
 #define ARM_EXIT_WITH_SERROR_BIT  31
@@ -259,7 +260,7 @@ extern u64 __kvm_get_mdcr_el2(void);
 	asm volatile(							\
 	"	mrs	%1, spsr_el2\n"					\
 	"	mrs	%2, elr_el2\n"					\
-	"1:	at	"at_op", %3\n"					\
+	"1:	" __msr_s(at_op, "%3") "\n"				\
 	"	isb\n"							\
 	"	b	9f\n"						\
 	"2:	msr	spsr_el2, %1\n"					\
diff --git arch/arm64/kvm/hyp/include/hyp/fault.h arch/arm64/kvm/hyp/include/hyp/fault.h
index 9e13c1bc2ad5..487c06099d6f 100644
--- arch/arm64/kvm/hyp/include/hyp/fault.h
+++ arch/arm64/kvm/hyp/include/hyp/fault.h
@@ -27,7 +27,7 @@ static inline bool __translate_far_to_hpfar(u64 far, u64 *hpfar)
 	 * saved the guest context yet, and we may return early...
 	 */
 	par = read_sysreg_par();
-	if (!__kvm_at("s1e1r", far))
+	if (!__kvm_at(OP_AT_S1E1R, far))
 		tmp = read_sysreg_par();
 	else
 		tmp = SYS_PAR_EL1_F; /* back to the guest */
-- 
2.25.1


