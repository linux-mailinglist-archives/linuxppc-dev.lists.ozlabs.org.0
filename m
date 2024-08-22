Return-Path: <linuxppc-dev+bounces-388-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE3A95B9CF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 17:15:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqRYX0lLyz2ysh;
	Fri, 23 Aug 2024 01:13:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724339632;
	cv=none; b=Gb27NWvj7ILQ8T2KEJNQVWV6iOJug+iAVPeeGG4YJF+mYBXiwnFAiCi9pULgLC6WkH0tcYGjj4SjzPTOFdSYdTbkmVnWUrHoYVDT8JVPQgLTX2kkUMToR//yKjpgj9QqxTnnEmeFCyucnp7h59NxKZ1NkMWQUgs3LMKgYuZzKj4v+Rxfim7g9+nm4aUOLQuN1nVRkEJD9fa8C/kDj6Rm6ymSK7+q3Y3TO1jtW9/rSOC5wHPpd2+VZWmfB1HVaUZDCSkcahsd+6gBS+efC3YZ8ySNiqEn5IJ/sQS+MMc4PZ/EQNn1zUL6M20iJFMGQg3nfOJqvN7K8Z9XTeZL4MzzZw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724339632; c=relaxed/relaxed;
	bh=MXCzl33CgYPuUp71NFeHGj+bfZwTzvm57ZuQHOtN0OI=;
	h=Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding; b=UvA9WCOo8q3m9fKXJCtuR/7wQlCmvYTXVWwpUsGynPFkNBzJeXfwWU8rGBRQNuh41D3g+PZd5hx9xvX0zlKl8GrjOyYzs9QGVBH9N19xwy3vGZjlaq0Q3Id70OrN4yzaL9Opyk3qmWplmN0gjHdCk9xmUXRKuu72ryZPnADsfnBoIM4TiJBLkvfqBnqf273KNKJH5Ork5EX3q6JI6bIyMfgdq0zdtf0la6da2ynzJdQU9dvilT9np9fBsZMr9GfFALKuzMgIXaHvpFhVPwsF7Ro/MY3x8qKCtWisGC2uTW1FxJSQDiQjgrGwufkJ3zOA5sNIbqmsF9LRuBS4dhN6xQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=joey.gouly@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=joey.gouly@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqRYW6KSQz2yhg
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 01:13:51 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2889E1688;
	Thu, 22 Aug 2024 08:13:47 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0A2683F58B;
	Thu, 22 Aug 2024 08:13:16 -0700 (PDT)
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
Subject: [PATCH v5 27/30] kselftest/arm64: add HWCAP test for FEAT_S1POE
Date: Thu, 22 Aug 2024 16:11:10 +0100
Message-Id: <20240822151113.1479789-28-joey.gouly@arm.com>
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

Check that when POE is enabled, the POR_EL0 register is accessible.

Signed-off-by: Joey Gouly <joey.gouly@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>
Reviewed-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/abi/hwcap.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git tools/testing/selftests/arm64/abi/hwcap.c tools/testing/selftests/arm64/abi/hwcap.c
index d8909b2b535a..f2d6007a2b98 100644
--- tools/testing/selftests/arm64/abi/hwcap.c
+++ tools/testing/selftests/arm64/abi/hwcap.c
@@ -156,6 +156,12 @@ static void pmull_sigill(void)
 	asm volatile(".inst 0x0ee0e000" : : : );
 }
 
+static void poe_sigill(void)
+{
+	/* mrs x0, POR_EL0 */
+	asm volatile("mrs x0, S3_3_C10_C2_4" : : : "x0");
+}
+
 static void rng_sigill(void)
 {
 	asm volatile("mrs x0, S3_3_C2_C4_0" : : : "x0");
@@ -601,6 +607,14 @@ static const struct hwcap_data {
 		.cpuinfo = "pmull",
 		.sigill_fn = pmull_sigill,
 	},
+	{
+		.name = "POE",
+		.at_hwcap = AT_HWCAP2,
+		.hwcap_bit = HWCAP2_POE,
+		.cpuinfo = "poe",
+		.sigill_fn = poe_sigill,
+		.sigill_reliable = true,
+	},
 	{
 		.name = "RNG",
 		.at_hwcap = AT_HWCAP2,
-- 
2.25.1


