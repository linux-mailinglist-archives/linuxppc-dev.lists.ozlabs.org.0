Return-Path: <linuxppc-dev+bounces-375-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C806895B9A9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 17:13:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqRXM3MZZz2yxM;
	Fri, 23 Aug 2024 01:12:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724339571;
	cv=none; b=ojoBFSTOauOai9fjDYM0XukzWAH8PiMmu/JFifnq6ri1TcREnDLsbU023sHje365wHaqwkuHptXDIxaT2mqkFTmBhyGxITjCQV1xZwWb9ScYJ7h3l3Vftf5n2dY0/bJ4oltnZOcTbQY9mPPZpqcLuCOVLFOpMUGqIL83td93qvQxHDGvDQ+tZtiBFl3BtFjk++bfxHl0HspONv13kzZxmWxfD6gp+h3hpw0ecwiTRPrDQgBrKVN2h2Wo6Tux+w/u9+sWE3Imq/g4HJp5o0T1hGEVYvITV4bU1uj/XbYf8S9iMk4wDJQlE4ReKZeN4JsUil+mwTYd+go67YWPXpZAPw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724339571; c=relaxed/relaxed;
	bh=R8bZ0HCDMB4Ng+fG0OFOyHWUGs8nbmuYuMVfMre2cG4=;
	h=Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding; b=O3OJtF5AGSc7V1TfabNxfZEs2Ruf2Jet/kV6D8NNnJFXWXKO/LuklF6a76GcLuLkyTUpTy6fts+QHVoWfPa++prkvRaonPaCLg1jdx+NcWzV768UDq1/jiSSpWyCQZSeOw5j8fV0w3I18dr92XUex+ytucYKubpvNjNR4KIWaYdnQmuYAm7PdHBBOpfqbunGOOKjMuLAcacAD+nlnVNkx/XkrVnr0Ho8LWLuimemnMhzwKRjZXuN+znzPWM6EADLs0rWmhSF82XShM8j0Zcm3Buk/sGQnblydaxxUamxqXv47zGaf5ohmFJfNXiS1RUz/P55SbAdjGCfHnbEa8GPKQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=joey.gouly@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=joey.gouly@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqRXM1qMDz2ygZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 01:12:51 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 830E21596;
	Thu, 22 Aug 2024 08:12:46 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 64D793F58B;
	Thu, 22 Aug 2024 08:12:16 -0700 (PDT)
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
Subject: [PATCH v5 13/30] arm64: add POIndex defines
Date: Thu, 22 Aug 2024 16:10:56 +0100
Message-Id: <20240822151113.1479789-14-joey.gouly@arm.com>
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

The 3-bit POIndex is stored in the PTE at bits 60..62.

Signed-off-by: Joey Gouly <joey.gouly@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Acked-by: Catalin Marinas <catalin.marinas@arm.com>
---
 arch/arm64/include/asm/pgtable-hwdef.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git arch/arm64/include/asm/pgtable-hwdef.h arch/arm64/include/asm/pgtable-hwdef.h
index 1f60aa1bc750..3f0c3f5c5cef 100644
--- arch/arm64/include/asm/pgtable-hwdef.h
+++ arch/arm64/include/asm/pgtable-hwdef.h
@@ -199,6 +199,16 @@
 #define PTE_PI_IDX_2	53	/* PXN */
 #define PTE_PI_IDX_3	54	/* UXN */
 
+/*
+ * POIndex[2:0] encoding (Permission Overlay Extension)
+ */
+#define PTE_PO_IDX_0	(_AT(pteval_t, 1) << 60)
+#define PTE_PO_IDX_1	(_AT(pteval_t, 1) << 61)
+#define PTE_PO_IDX_2	(_AT(pteval_t, 1) << 62)
+
+#define PTE_PO_IDX_MASK		GENMASK_ULL(62, 60)
+
+
 /*
  * Memory Attribute override for Stage-2 (MemAttr[3:0])
  */
-- 
2.25.1


