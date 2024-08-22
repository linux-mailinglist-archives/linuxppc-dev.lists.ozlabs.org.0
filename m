Return-Path: <linuxppc-dev+bounces-363-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C90E095B97E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 17:12:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqRWS1qLSz2yhv;
	Fri, 23 Aug 2024 01:12:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724339524;
	cv=none; b=Ts36rp9+r+Q8N8gw3rwlB8+a/3mst5wHafeTmDYCLSoNMI1iak2ig2RqgB8XG9h0TunBLn9Xb3bb2Z9mu65CNl07Zs6OZEhWWgregaZn2r2b9yKsOe1In7UzZ/TpkK0SAJuOZA39ZASS9AKjnvqMyMqZNFHylyH9f7yCcDu8/sVpS5DiUqh3W2kllfMbbWpz9xCw21CekBJ8cKytvbCPuk2eq3cl/F3OqLwYrl3KPa+SvCa0mCg3c1UH9RFSEMmLORB20A7gM+ggxFMGHDrAA4JKcp8hr1Dtpu9Rutp0tKUfPTwiXgd1e6E6hrRYcrgO8i8CeWswocLkdHycjQbRzw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724339524; c=relaxed/relaxed;
	bh=g7IaXVZdBs5xv39RK9QztWdWeQqbVpdYum+vkYswvwk=;
	h=Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding; b=E5wKXJnEMPc+ZwCd+12n4bzyBXRNUCV07uXvdCQ6Qer5zzhIuN1ShsgA9Z3DtSYoOzz7eKiOfHC1BSdeq6oQssNodCa7XorYJvJbqy9XfhIKMbRJJMHhVFi6T19iJFcgkFmjSwjklXltexsQIUaO6rVXwAZ35pg00YRX6h3rIs4Ir7fPbKZEs3zuIIks54suWeOv/9ScrFy/c5IoWlRR2zgfC7C3si5zv5oGftUY8qOMK89HWT4Iu4oBw70xLpj3QcHjqAxo7dhAwDjj+pb/H9Q7Yrs4S/OhASNIAF22j9JemcpbSARqbL/Yc59oEFDckuic/NfdAN2/Dknxe5onyw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=joey.gouly@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=joey.gouly@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqRWS0HTPz2yhG
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 01:12:03 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 037931576;
	Thu, 22 Aug 2024 08:11:59 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D92D73F58B;
	Thu, 22 Aug 2024 08:11:28 -0700 (PDT)
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
Subject: [PATCH v5 02/30] x86/mm: add ARCH_PKEY_BITS to Kconfig
Date: Thu, 22 Aug 2024 16:10:45 +0100
Message-Id: <20240822151113.1479789-3-joey.gouly@arm.com>
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
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: x86@kernel.org
Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
---
 arch/x86/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git arch/x86/Kconfig arch/x86/Kconfig
index 007bab9f2a0e..683c0a64efe2 100644
--- arch/x86/Kconfig
+++ arch/x86/Kconfig
@@ -1889,6 +1889,10 @@ config X86_INTEL_MEMORY_PROTECTION_KEYS
 
 	  If unsure, say y.
 
+config ARCH_PKEY_BITS
+	int
+	default 4
+
 choice
 	prompt "TSX enable mode"
 	depends on CPU_SUP_INTEL
-- 
2.25.1


