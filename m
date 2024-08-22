Return-Path: <linuxppc-dev+bounces-365-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5865895B984
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 17:12:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqRWc5XTTz2ykt;
	Fri, 23 Aug 2024 01:12:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724339532;
	cv=none; b=kLj/wxTmTQ/ghdWvgMK00gDwuyzkYVbm+o47RASDKFvbwO1kDCMXGIEvDLtDRtUFLqWXeRhCg9IkMOqteoSbl/fl5u4MX7GbktZfxzrelWkeDxmPg/h/GOibglJx7/ebvvcwrQZzrouq8jf/0dfIRYsXjbRVx9qKHC1ZGaDWFyzFPPjX8Ioju8QNQ+aVss7wiU8POo6tg6K2eSWAFraRhRMMo5+QYs22g6XvrebzeEaVfViv3MljuBuYkzA+NduUP2Wpd8b1Zsydm6a8U93WIcJZ/gIIAPWcD4p1Nor1Cd9MgSaq+bTAgCUoLjeopJmRaVBJRDcXMbo5bLx9nZ8sxA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724339532; c=relaxed/relaxed;
	bh=BEcWZioiXtHX8rackaBoYWZiwxpHMb6CvKiSOd8uBKQ=;
	h=Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding; b=EOYn2c/kUKGrEJkfKP3kVRfaPP5LxWj5288q02YkwHcFMJ888ABCJKmU/j87zoC9Z76OjVnc3cDgMCVXKuqrqfPaoTmSx4zkyJFXCGZYS2hlYc+756A+8KDo3/pDL0DwlpogvIwaFAvpEMSh8kxDOsEx/Qv1CNH0dyyj76qAMFD5LbbTmHxapQ4VgwsKa/+d6YA/1CEdVCVD7IbdH4wVGhHu15h1TPHzB1bweK9wZ9/F8agOrqBaHeH8vRAa5l8gyDaxiAcM+LI9TgSAgkWyqSh99ee+yNI7Og6rKaWhqimQ8/9ClcjE2qnTXH/hjpCitoQyCqK7IOhipK/x3IdClw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=joey.gouly@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=joey.gouly@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqRWc43s5z2yhG
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 01:12:12 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9FA9F1596;
	Thu, 22 Aug 2024 08:12:07 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 819CA3F58B;
	Thu, 22 Aug 2024 08:11:37 -0700 (PDT)
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
Subject: [PATCH v5 04/30] arm64: disable trapping of POR_EL0 to EL2
Date: Thu, 22 Aug 2024 16:10:47 +0100
Message-Id: <20240822151113.1479789-5-joey.gouly@arm.com>
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

Allow EL0 or EL1 to access POR_EL0 without being trapped to EL2.

Signed-off-by: Joey Gouly <joey.gouly@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm64/include/asm/el2_setup.h | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git arch/arm64/include/asm/el2_setup.h arch/arm64/include/asm/el2_setup.h
index fd87c4b8f984..212191ecad40 100644
--- arch/arm64/include/asm/el2_setup.h
+++ arch/arm64/include/asm/el2_setup.h
@@ -185,12 +185,20 @@
 .Lset_pie_fgt_\@:
 	mrs_s	x1, SYS_ID_AA64MMFR3_EL1
 	ubfx	x1, x1, #ID_AA64MMFR3_EL1_S1PIE_SHIFT, #4
-	cbz	x1, .Lset_fgt_\@
+	cbz	x1, .Lset_poe_fgt_\@
 
 	/* Disable trapping of PIR_EL1 / PIRE0_EL1 */
 	orr	x0, x0, #HFGxTR_EL2_nPIR_EL1
 	orr	x0, x0, #HFGxTR_EL2_nPIRE0_EL1
 
+.Lset_poe_fgt_\@:
+	mrs_s	x1, SYS_ID_AA64MMFR3_EL1
+	ubfx	x1, x1, #ID_AA64MMFR3_EL1_S1POE_SHIFT, #4
+	cbz	x1, .Lset_fgt_\@
+
+	/* Disable trapping of POR_EL0 */
+	orr	x0, x0, #HFGxTR_EL2_nPOR_EL0
+
 .Lset_fgt_\@:
 	msr_s	SYS_HFGRTR_EL2, x0
 	msr_s	SYS_HFGWTR_EL2, x0
-- 
2.25.1


