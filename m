Return-Path: <linuxppc-dev+bounces-384-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F89595B9C7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 17:15:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqRYB6xP4z302N;
	Fri, 23 Aug 2024 01:13:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724339614;
	cv=none; b=eyLqp5qZELvMejp9zuCBP/zeLyXcpKfjnIdsiEmv2C09GPA5jN+rNx136CmCW87P110E2k5PMEBHgu/Yu3P77bKiNDSJ0vMSU/v2vhv/lSqrV8DXjlrlcMdtvzutt0lKQwIDcryn3yS3D+jqsmX7OusDGcfmOBUreLPJfvlQNXZH62lypT82koUzjSj3OW1eV8f3RJmfDkcvqE+pJbCj5dUthj6IDzuVl6RO/2Lva4ovaCF18oYgk8NsWKphgKjeK1oipBlTtKGGbnAbpoBJ3hNK6YT79iZOpa/5wkWDOPI98l+zulZZGdQgOlCJ26wuB/4ZiPgyIRm9pfI5/cg4Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724339614; c=relaxed/relaxed;
	bh=UpfNylgfxY4txd7ztue1Ar+iWBvQcIDs522zyFJSfc4=;
	h=Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding; b=ZStT0UjLe20un1WbKGlKy7rAp62iIhRJvkcKh9u2UpiYgaVU4NDptSOEI5t+fsEFg508digMPyTyfzmOxDUn/WKBpPUZRc5bjsQD/gIax6OuepfZkL+HqF/jwJLPXbwvWwcxHs9mDmbyoUhCZjoTDMWqgIuEmPxjOWJ2+MQv5m60D9P90JPNHftjvc+ebw/LL9X5zt8dpLD2RMPzwFweF//cOdiXvRVcmyTJVdP2vEhE36BkK0e1M/urWpvBc4mbavtrSRops0MltnDi/MIzu0GX0ag1DDJAsgp7FQphnBLwJRmMR7GQjb5xwCBPLYBrJQIKS7TfGn3gPjWiCsCPKQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=joey.gouly@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=joey.gouly@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqRYB5SkSz2ygX
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 01:13:34 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D6BB01650;
	Thu, 22 Aug 2024 08:13:29 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B8D833F58B;
	Thu, 22 Aug 2024 08:12:59 -0700 (PDT)
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
Subject: [PATCH v5 23/30] arm64: add Permission Overlay Extension Kconfig
Date: Thu, 22 Aug 2024 16:11:06 +0100
Message-Id: <20240822151113.1479789-24-joey.gouly@arm.com>
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

Now that support for POE and Protection Keys has been implemented, add a
config to allow users to actually enable it.

Signed-off-by: Joey Gouly <joey.gouly@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
Acked-by: Catalin Marinas <catalin.marinas@arm.com>
---
 arch/arm64/Kconfig | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git arch/arm64/Kconfig arch/arm64/Kconfig
index a2f8ff354ca6..35dfc6275328 100644
--- arch/arm64/Kconfig
+++ arch/arm64/Kconfig
@@ -2137,6 +2137,29 @@ config ARM64_EPAN
 	  if the cpu does not implement the feature.
 endmenu # "ARMv8.7 architectural features"
 
+menu "ARMv8.9 architectural features"
+
+config ARM64_POE
+	prompt "Permission Overlay Extension"
+	def_bool y
+	select ARCH_USES_HIGH_VMA_FLAGS
+	select ARCH_HAS_PKEYS
+	help
+	  The Permission Overlay Extension is used to implement Memory
+	  Protection Keys. Memory Protection Keys provides a mechanism for
+	  enforcing page-based protections, but without requiring modification
+	  of the page tables when an application changes protection domains.
+
+	  For details, see Documentation/core-api/protection-keys.rst
+
+	  If unsure, say y.
+
+config ARCH_PKEY_BITS
+	int
+	default 3
+
+endmenu # "ARMv8.9 architectural features"
+
 config ARM64_SVE
 	bool "ARM Scalable Vector Extension support"
 	default y
-- 
2.25.1


