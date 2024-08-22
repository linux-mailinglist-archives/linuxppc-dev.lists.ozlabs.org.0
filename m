Return-Path: <linuxppc-dev+bounces-372-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B36D995B99A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 17:13:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqRX64f2yz2ytl;
	Fri, 23 Aug 2024 01:12:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724339558;
	cv=none; b=DU+HTPOpvQEUKhI2IANPIR2CihdGJXmm5N3OFqrKCowiRxlfDN1SaELPMHDYcyAiOReX9+4Zsp8gaYgZVGXJl74VMxlTReYWwUNypdks/9aOxJTkT3J4lp6pzSRaZpf3/J6Wb9XdSpDa2dm5aDssSxrvNFP7hrgvbcfCdO8RxRdKe4Hl8g7Oi6JrzJ0dxgISd2I4vOSTqIuQfDPEvQrKvklgqlecCk8nu3MNwe0PuoOwVVFcuAzhE75P8cCkfCYyt7vCNRyOl3igc/F72SFXDiQ2Sxb+XIVkBdjyAhYhMzbcBe1c6SPpc5EVYx8257h9YGwpQJ8VcYe8BKticr8hIw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724339558; c=relaxed/relaxed;
	bh=lhYPnmIy9QUOshqY63sjGUWSg8MXgpvHQMLfdS0GHX8=;
	h=Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding; b=AZF0Xw6ASB0aiKehFxfmonz2DyU8IvFlVR1N361wHwg8Z90mgkF22eOXZ19rRnxoFMDgtQrobLbN0OKsDi2ijwLdIHFe5cZpquuorNon230ttRWDVx0MJtpZDU/z5lurgiY8CO5PmQJ/SYEhdwSt13KaYGs9k66S9wPghbtIQ51hmniFsSA+IYrQL98GR5EIShx5qxXw1+XmS9n6GK7puGrZ56QiMghH3f/9qa9FH0hfpl82QsTC6XZTo9qJfnyFslY7wtbPbCfUwHxRxZl+zXpOaFIoPxTqhwWZfwxLFzl+TYqU5HKJJXx4vFITepnsTVfgiUs+5qXwMb664FX/RQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=joey.gouly@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=joey.gouly@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqRX638nyz2ytT
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 01:12:38 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8BA89FEC;
	Thu, 22 Aug 2024 08:12:33 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6CF9D3F58B;
	Thu, 22 Aug 2024 08:12:03 -0700 (PDT)
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
Subject: [PATCH v5 10/30] KVM: arm64: Sanitise ID_AA64MMFR3_EL1
Date: Thu, 22 Aug 2024 16:10:53 +0100
Message-Id: <20240822151113.1479789-11-joey.gouly@arm.com>
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

Add the missing sanitisation of ID_AA64MMFR3_EL1, making sure we
solely expose S1POE and TCRX (we currently don't support anything
else).

[joey: Took Marc's patch for S1PIE, and changed it for S1POE]

Signed-off-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Joey Gouly <joey.gouly@arm.com>
---
 arch/arm64/kvm/sys_regs.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git arch/arm64/kvm/sys_regs.c arch/arm64/kvm/sys_regs.c
index e7208b59ea12..0f13378e761c 100644
--- arch/arm64/kvm/sys_regs.c
+++ arch/arm64/kvm/sys_regs.c
@@ -1556,6 +1556,9 @@ static u64 __kvm_read_sanitised_id_reg(const struct kvm_vcpu *vcpu,
 	case SYS_ID_AA64MMFR2_EL1:
 		val &= ~ID_AA64MMFR2_EL1_CCIDX_MASK;
 		break;
+	case SYS_ID_AA64MMFR3_EL1:
+		val &= ID_AA64MMFR3_EL1_TCRX | ID_AA64MMFR3_EL1_S1POE;
+		break;
 	case SYS_ID_MMFR4_EL1:
 		val &= ~ARM64_FEATURE_MASK(ID_MMFR4_EL1_CCIDX);
 		break;
@@ -2427,7 +2430,8 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 					ID_AA64MMFR2_EL1_IDS |
 					ID_AA64MMFR2_EL1_NV |
 					ID_AA64MMFR2_EL1_CCIDX)),
-	ID_SANITISED(ID_AA64MMFR3_EL1),
+	ID_WRITABLE(ID_AA64MMFR3_EL1, (ID_AA64MMFR3_EL1_TCRX	|
+				       ID_AA64MMFR3_EL1_S1POE)),
 	ID_SANITISED(ID_AA64MMFR4_EL1),
 	ID_UNALLOCATED(7,5),
 	ID_UNALLOCATED(7,6),
-- 
2.25.1


