Return-Path: <linuxppc-dev+bounces-389-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6069895B9D3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 17:15:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqRYc3hPsz305D;
	Fri, 23 Aug 2024 01:13:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724339636;
	cv=none; b=h5iJZmi1slqBHplIO7wQ1MNjXT0+9W+xRut5q6vcCjL9FHwLjaiP/5IsZO+nE2Dh625UKfrBcan7nmGxr9LURflYO6VxWTIJVrm++fHp+w8e3CsEc/pVHp8Ujptnp9ewvoM8XyTZHEVyL/v8+HCS7uTzAq4b42zfhl7JnGpG5A6qGRbrNqlC6ODSlFawRUxMWW30qNnjZstkiPX5vmuK3Grtprn0lFHkjXKroMLpAPeFXzoKtGzu8ZwKFVlRIb3Sh5+I0at3MiSDaC6ryocw/gXX+83MdBzYsl7eL8P4eT2NybYDJkC7NEfgylaA3ScJ6i/FJZS7V8y5FQ/fZNBz9g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724339636; c=relaxed/relaxed;
	bh=pU8VCuCTIjK7lA3OtU4H5wHq2JK3PvbDWYK/md3Tuyc=;
	h=Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding; b=Gi5iQZfHjwnDjmLTPypJdq1ZSxlX1PE8jfH4tLK6xeV+W7FVzp1hHg8Vx8ETneFzQPL1TpKiD9U4+SMiU5BB0FppGFSs/+8cLbUIoGBYx99L8L/8qJAHjXV6WSwK0KdnaSLDN7AwnNPSUHSh31CgqWHMoImZz09Iro0tIGk9mj9W1wy5cTuUW0LYQKSEECgwtBuis+CllOiKESJyok4FmIMO+OlgyYWSz++FDKwrC2HkhI4+7W97r9IBP6FOuWHdh6hj3m6968N938xSBOBpceNoY1ZsZWMg/2jL8AKJJthOOrpoc1FwjA0YKWzxHEev2MWP3ZYOH0MnQZSNB3ewpg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=joey.gouly@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=joey.gouly@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqRYc29f6z2yhg
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 01:13:56 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7664D168F;
	Thu, 22 Aug 2024 08:13:51 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 580D03F58B;
	Thu, 22 Aug 2024 08:13:21 -0700 (PDT)
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
Subject: [PATCH v5 28/30] kselftest/arm64: parse POE_MAGIC in a signal frame
Date: Thu, 22 Aug 2024 16:11:11 +0100
Message-Id: <20240822151113.1479789-29-joey.gouly@arm.com>
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

Teach the signal frame parsing about the new POE frame, avoids warning when it
is generated.

Signed-off-by: Joey Gouly <joey.gouly@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>
Reviewed-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/signal/testcases/testcases.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git tools/testing/selftests/arm64/signal/testcases/testcases.c tools/testing/selftests/arm64/signal/testcases/testcases.c
index e4331440fed0..e6daa94fcd2e 100644
--- tools/testing/selftests/arm64/signal/testcases/testcases.c
+++ tools/testing/selftests/arm64/signal/testcases/testcases.c
@@ -161,6 +161,10 @@ bool validate_reserved(ucontext_t *uc, size_t resv_sz, char **err)
 			if (head->size != sizeof(struct esr_context))
 				*err = "Bad size for esr_context";
 			break;
+		case POE_MAGIC:
+			if (head->size != sizeof(struct poe_context))
+				*err = "Bad size for poe_context";
+			break;
 		case TPIDR2_MAGIC:
 			if (head->size != sizeof(struct tpidr2_context))
 				*err = "Bad size for tpidr2_context";
-- 
2.25.1


