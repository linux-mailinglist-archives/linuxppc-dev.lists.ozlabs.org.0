Return-Path: <linuxppc-dev+bounces-362-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF3995B977
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 17:12:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqRWN0Dktz2yb9;
	Fri, 23 Aug 2024 01:12:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724339519;
	cv=none; b=QBWmn4CTWWU+Cg7sz4oJn4nkJJ5vSR9O6+nAuBqPBBGceLOXW/dg/UVAjPvo/ygWNDE3O9yvodzanoPmU5KXjcPhGx1T8k0mrRlJCuvtczUzPm+lXs5Q8R00suy1Ium8LrrZJRr5e171qD9VL2tfObWNF/8TGBPq4XtFL5YjBujxHwre7D9aV58u5B2WZVIvqkd4eLHoDLK7fVYp4Fg8/DINy3V/G1UwSVNDNY7E5/bDFCqt8EhHaHw6txb2ivx7CFePp9rP/t4Gzj0f0SAkyBJ5q0Wg22Cr57r6ibpuTJnUUcFtMbTWGCuVda5VK/uUclzhQnqaFycr8lF8Cim7pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724339519; c=relaxed/relaxed;
	bh=EkzhGaH1vpd9S+OVn0bTPh0Beh0aCRj5TChd371GEgM=;
	h=Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding; b=ArYOlwxxMbUjf4E1FQK9fOkuS49LIh1E5BzQOH5qya4fXkC0SeS6CRn4JHEyC0X1NuTJlqjiVy2rX1/12g026bOZR2l4ZEisB94PZ/T+IXUleMtc9iW2pNtdCyBr5cQX+bcBYF4CtRIaw4wck61IamucdhBDYaBCB7hstW6l/ITVl7mVHaHYW6ZhHijNjtpQBaXVrlUHABEtuFdk/uF1IZssydmRCK0UXoBQuLZSpZPjhcGme9+TbG3v8BxFslHMSDn8uLWoL9Tvpi/hA5Tw3s8Wxc4GHKgLEAeMJxv1I/cS/nThPscX62MXl6WxwMYClYKMGSIudOuukFOGMZZCbg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=joey.gouly@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=joey.gouly@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqRWM5j33z2yhG
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 01:11:59 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A8DFFFEC;
	Thu, 22 Aug 2024 08:11:54 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8A4E13F58B;
	Thu, 22 Aug 2024 08:11:24 -0700 (PDT)
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
Subject: [PATCH v5 01/30] powerpc/mm: add ARCH_PKEY_BITS to Kconfig
Date: Thu, 22 Aug 2024 16:10:44 +0100
Message-Id: <20240822151113.1479789-2-joey.gouly@arm.com>
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

The new config option specifies how many bits are in each PKEY.

Signed-off-by: Joey Gouly <joey.gouly@arm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Acked-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git arch/powerpc/Kconfig arch/powerpc/Kconfig
index d7b09b064a8a..8a4ee57cd4ef 100644
--- arch/powerpc/Kconfig
+++ arch/powerpc/Kconfig
@@ -1026,6 +1026,10 @@ config PPC_MEM_KEYS
 
 	  If unsure, say y.
 
+config ARCH_PKEY_BITS
+	int
+	default 5
+
 config PPC_SECURE_BOOT
 	prompt "Enable secure boot support"
 	bool
-- 
2.25.1


