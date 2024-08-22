Return-Path: <linuxppc-dev+bounces-391-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DDF95B9DD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 17:15:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqRYn1GP5z305n;
	Fri, 23 Aug 2024 01:14:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724339645;
	cv=none; b=CHNCjaJzIR4Pr8ziYB7xGQ4tmjlpr4w06SUulvkNGyllNcI04/ZKoX070xeAy+BjKoXVsZTg13Kc2FmTuopOHl/37PRofAJmYqIAiXTnWu7RiodUSdYndP0wU26rCIRXiW946OpMBSsHnNpPC8VzLYQjvpYw35qwBQ1lVpFeNg4MLdqCyYW6vZt5VFRYV1021bG15iySI40sxjAf2EdfH9SPYI6CS8F+bV7Yg1IBXM/opzPgzwRD+nJ3S7WHgwQpfxzcDky0Y2sJNx7NcH/X7xL+v614EXyRFdDQ5DEQ4BZy5TZes2e6RHtG1uzpniXSJYKn4HpgUPCzlepo8D91RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724339645; c=relaxed/relaxed;
	bh=PtgYcAquF/+pUMmaCA/YK/T3qoyr8VMF+0I75YD9aNo=;
	h=Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding; b=LdIsyECwWRLZZmIkj7aXsA3Q9dVLzdnYcPDyCywaXz0ZLfcA0g3at09gzP3YBY9fa+/xd1sSKRrWVSvsJ8tL72VP82yTTz3RXrDN76r8MNbz4yssV5p/6QYuJe73F4V8+/tBr6TgEn7l2KhNkrhXv9/5sxGwCd5ZI396n+87dgjRkW2MNPAY5LFCl5OmZ+I8FfujspkeaSxOelK9fqcNhXgj8FpsP+8RwbH65GwoYzLgvPwRkIjH/8RrbvTTdCLG0wS+j0YQeVWXAWVXWEFEgYSXAHdPjZF+tpDip56IUyJNbTu2erSQzDF0laEJNjzTpWYeNq3g1gk9BicHm00OSw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=joey.gouly@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=joey.gouly@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqRYm6trnz2yhg
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 01:14:04 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1EC09169C;
	Thu, 22 Aug 2024 08:14:00 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 00D0F3F58B;
	Thu, 22 Aug 2024 08:13:29 -0700 (PDT)
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
Subject: [PATCH v5 30/30] KVM: selftests: get-reg-list: add Permission Overlay registers
Date: Thu, 22 Aug 2024 16:11:13 +0100
Message-Id: <20240822151113.1479789-31-joey.gouly@arm.com>
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

Add new system registers:
  - POR_EL1
  - POR_EL0

Signed-off-by: Joey Gouly <joey.gouly@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>
Cc: Shuah Khan <shuah@kernel.org>
Reviewed-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/kvm/aarch64/get-reg-list.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git tools/testing/selftests/kvm/aarch64/get-reg-list.c tools/testing/selftests/kvm/aarch64/get-reg-list.c
index 4abebde78187..d43fb3f49050 100644
--- tools/testing/selftests/kvm/aarch64/get-reg-list.c
+++ tools/testing/selftests/kvm/aarch64/get-reg-list.c
@@ -40,6 +40,18 @@ static struct feature_id_reg feat_id_regs[] = {
 		ARM64_SYS_REG(3, 0, 0, 7, 3),	/* ID_AA64MMFR3_EL1 */
 		8,
 		1
+	},
+	{
+		ARM64_SYS_REG(3, 0, 10, 2, 4),	/* POR_EL1 */
+		ARM64_SYS_REG(3, 0, 0, 7, 3),	/* ID_AA64MMFR3_EL1 */
+		16,
+		1
+	},
+	{
+		ARM64_SYS_REG(3, 3, 10, 2, 4),	/* POR_EL0 */
+		ARM64_SYS_REG(3, 0, 0, 7, 3),	/* ID_AA64MMFR3_EL1 */
+		16,
+		1
 	}
 };
 
@@ -468,6 +480,7 @@ static __u64 base_regs[] = {
 	ARM64_SYS_REG(3, 0, 10, 2, 0),	/* MAIR_EL1 */
 	ARM64_SYS_REG(3, 0, 10, 2, 2),	/* PIRE0_EL1 */
 	ARM64_SYS_REG(3, 0, 10, 2, 3),	/* PIR_EL1 */
+	ARM64_SYS_REG(3, 0, 10, 2, 4),	/* POR_EL1 */
 	ARM64_SYS_REG(3, 0, 10, 3, 0),	/* AMAIR_EL1 */
 	ARM64_SYS_REG(3, 0, 12, 0, 0),	/* VBAR_EL1 */
 	ARM64_SYS_REG(3, 0, 12, 1, 1),	/* DISR_EL1 */
@@ -475,6 +488,7 @@ static __u64 base_regs[] = {
 	ARM64_SYS_REG(3, 0, 13, 0, 4),	/* TPIDR_EL1 */
 	ARM64_SYS_REG(3, 0, 14, 1, 0),	/* CNTKCTL_EL1 */
 	ARM64_SYS_REG(3, 2, 0, 0, 0),	/* CSSELR_EL1 */
+	ARM64_SYS_REG(3, 3, 10, 2, 4),	/* POR_EL0 */
 	ARM64_SYS_REG(3, 3, 13, 0, 2),	/* TPIDR_EL0 */
 	ARM64_SYS_REG(3, 3, 13, 0, 3),	/* TPIDRRO_EL0 */
 	ARM64_SYS_REG(3, 3, 14, 0, 1),	/* CNTPCT_EL0 */
-- 
2.25.1


