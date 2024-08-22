Return-Path: <linuxppc-dev+bounces-382-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0346795B9C1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 17:14:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqRY21bGxz2yhT;
	Fri, 23 Aug 2024 01:13:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724339606;
	cv=none; b=fLdzPFGz++Bix9fZIB3CCjP1dWvgun6K2eRa1S4tKynIfyLVj5net6UWahJ10ehtF1JC4IuxW41JqOZIos2tCs33UcCDoTDH8O9sa1yFDQ4IcsV06azGWsXfa1YbruJHlx6fQlmPstfhHNB2BySJHEBq2ZY+1ybcjiDBxiTdNadNMfYY60hW2gnIdOmMrE9/m2m8xRONMq7JMLDvovF1NRhfj0qOAm0R2/3hibvj9ClbSBIZZy5tpNl1TbekXAs4b9RUsG/6EIYjpIFEBI4C4NmEM6silQdbT7ABs7nSzXG5BeoDr1chKAP2P7XzkVTVvqj5r872AIejvKBt1Ca++w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724339606; c=relaxed/relaxed;
	bh=YpUVqN2yD82ZzjqMsW13TV0m9gqSc3sr7jdaCm+yJjE=;
	h=Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding; b=kz03nvsIO6aC2c1fB3bv3iRuSI3QkiyXs75yFpD63jbJuOjST8PE6cHwNI3EoPaWzrx9B30evFQFmqTpadhR3qXNv1ctSnQ+UgaVf7vIA6XDhDOrXg70BNXauJaChwqYrTtXVaJ0cPsIk9HcNMB7Ib0FD435ky3IFIuK7Z8E4NKD8X3BmAZZxsDWZJVU8ZmIjz7adjFjDMpcrwCJxxAskozfgO4n3ZWttJxgqP2x6v4OP6q0g+W8xB/HH0BoBlWe9mQSsYOTm26BmmB9dPQn8GQTdhKeqNaaLcRatpCWWDxYwFx8De6v3h+pp1a2n8eJ7uIow6RGoek7qnST83X/Ww==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=joey.gouly@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=joey.gouly@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqRY204Bsz2ygX
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 01:13:26 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3AF6E1596;
	Thu, 22 Aug 2024 08:13:21 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1CD163F58B;
	Thu, 22 Aug 2024 08:12:50 -0700 (PDT)
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
Subject: [PATCH v5 21/30] arm64: enable POE and PIE to coexist
Date: Thu, 22 Aug 2024 16:11:04 +0100
Message-Id: <20240822151113.1479789-22-joey.gouly@arm.com>
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

Permission Indirection Extension and Permission Overlay Extension can be
enabled independently.

When PIE is disabled and POE is enabled, the permissions set by POR_EL0 will be
applied on top of the permissions set in the PTE.

When both PIE and POE are enabled, the permissions set by POR_EL0 will be
applied on top of the permissions set by the PIRE0_EL1 register.
However PIRE0_EL1 has encodings that specifically enable and disable the
overlay from applying.

For example:
	0001	Read, Overlay applied.
	1000	Read, Overlay not applied.

Switch to using the 'Overlay applied' encodings in PIRE0_EL1, so that PIE and
POE can coexist.

Signed-off-by: Joey Gouly <joey.gouly@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
---
 arch/arm64/include/asm/pgtable-prot.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git arch/arm64/include/asm/pgtable-prot.h arch/arm64/include/asm/pgtable-prot.h
index b11cfb9fdd37..2a11d0c10760 100644
--- arch/arm64/include/asm/pgtable-prot.h
+++ arch/arm64/include/asm/pgtable-prot.h
@@ -154,10 +154,10 @@ static inline bool __pure lpa2_is_enabled(void)
 
 #define PIE_E0	( \
 	PIRx_ELx_PERM(pte_pi_index(_PAGE_EXECONLY),      PIE_X_O) | \
-	PIRx_ELx_PERM(pte_pi_index(_PAGE_READONLY_EXEC), PIE_RX)  | \
-	PIRx_ELx_PERM(pte_pi_index(_PAGE_SHARED_EXEC),   PIE_RWX) | \
-	PIRx_ELx_PERM(pte_pi_index(_PAGE_READONLY),      PIE_R)   | \
-	PIRx_ELx_PERM(pte_pi_index(_PAGE_SHARED),        PIE_RW))
+	PIRx_ELx_PERM(pte_pi_index(_PAGE_READONLY_EXEC), PIE_RX_O)  | \
+	PIRx_ELx_PERM(pte_pi_index(_PAGE_SHARED_EXEC),   PIE_RWX_O) | \
+	PIRx_ELx_PERM(pte_pi_index(_PAGE_READONLY),      PIE_R_O)   | \
+	PIRx_ELx_PERM(pte_pi_index(_PAGE_SHARED),        PIE_RW_O))
 
 #define PIE_E1	( \
 	PIRx_ELx_PERM(pte_pi_index(_PAGE_EXECONLY),      PIE_NONE_O) | \
-- 
2.25.1


