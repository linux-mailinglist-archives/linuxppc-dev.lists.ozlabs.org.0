Return-Path: <linuxppc-dev+bounces-385-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3AD95B9C9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 17:15:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqRYH3DDYz2yqB;
	Fri, 23 Aug 2024 01:13:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724339619;
	cv=none; b=c+srK4fchr2GG1zwZpAEi0fbYEc+S/GAx2P6YWDPDQFXjMhIsoZCRoSCNytRq9z+RwxCwk8WJnCwfkUVMxvV5Atii3Kj9wJkFF1A3TvjfUT9/UvxKnCiXcGeUBcez23VrOngyNemHc9jrxFOI/MCOSXWL9h+EhWXqb6JkojiGAuuUDQ/l9IdEOMysM9ujJoyGlWpyxJwJYQSxMMoRz/4THprxWpjVZeWuO+pIJR4YsWi+9zDXkT8QQrl3DTtySe+mTcd9DbnfdncCUTT5+p2IOQ71Z8G2NBbU60ml295QVKnpmTp0gEbcSjQd91vWyWJFhHQZ2wbmvKE+cMqdkpZww==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724339619; c=relaxed/relaxed;
	bh=dop1jxi1q30aR2qs1XTEluVvJyGHRlKot6WbNZEb224=;
	h=Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding; b=oLvjDcwgZ0CcavELoYwXnxiY9+IIN7qjHSL46xm4VRpYHyPtYA3XERpOg6pI/UZNUZvv/RP7VYX5pOYpLK+Pg43BdnRGsuklZI6YZub+HC0OaPDA/Jw/wpNLgSQUpmvL1jOMxCouM6CDXc5GPO0l7yoXgCTagxhZ0KvotersyTdVgIK9vdO3/x6Np7tyQY9/ENkAreiLpDZ1eHNhPkb9NATFpcufYdLTqMXP9BSG+zKyXUQSrbQrZyM+9J5qyJ43Z5fyykDiUgcky0ofXp6XFCaerldFebdX75LXAac/7mS2mMc5MHTwkRsKVASJhUkRnPKC8YasKmB2YftRTqUcyw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=joey.gouly@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=joey.gouly@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqRYH0NXcz2ygX
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 01:13:38 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 35721165C;
	Thu, 22 Aug 2024 08:13:34 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1275A3F58B;
	Thu, 22 Aug 2024 08:13:03 -0700 (PDT)
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
Subject: [PATCH v5 24/30] kselftest/arm64: move get_header()
Date: Thu, 22 Aug 2024 16:11:07 +0100
Message-Id: <20240822151113.1479789-25-joey.gouly@arm.com>
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

Put this function in the header so that it can be used by other tests, without
needing to link to testcases.c.

This will be used by selftest/mm/protection_keys.c

Signed-off-by: Joey Gouly <joey.gouly@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Shuah Khan <shuah@kernel.org>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
---
 .../arm64/signal/testcases/testcases.c        | 23 -----------------
 .../arm64/signal/testcases/testcases.h        | 25 +++++++++++++++++--
 2 files changed, 23 insertions(+), 25 deletions(-)

diff --git tools/testing/selftests/arm64/signal/testcases/testcases.c tools/testing/selftests/arm64/signal/testcases/testcases.c
index 674b88cc8c39..e4331440fed0 100644
--- tools/testing/selftests/arm64/signal/testcases/testcases.c
+++ tools/testing/selftests/arm64/signal/testcases/testcases.c
@@ -6,29 +6,6 @@
 
 #include "testcases.h"
 
-struct _aarch64_ctx *get_header(struct _aarch64_ctx *head, uint32_t magic,
-				size_t resv_sz, size_t *offset)
-{
-	size_t offs = 0;
-	struct _aarch64_ctx *found = NULL;
-
-	if (!head || resv_sz < HDR_SZ)
-		return found;
-
-	while (offs <= resv_sz - HDR_SZ &&
-	       head->magic != magic && head->magic) {
-		offs += head->size;
-		head = GET_RESV_NEXT_HEAD(head);
-	}
-	if (head->magic == magic) {
-		found = head;
-		if (offset)
-			*offset = offs;
-	}
-
-	return found;
-}
-
 bool validate_extra_context(struct extra_context *extra, char **err,
 			    void **extra_data, size_t *extra_size)
 {
diff --git tools/testing/selftests/arm64/signal/testcases/testcases.h tools/testing/selftests/arm64/signal/testcases/testcases.h
index 7727126347e0..3185e6875694 100644
--- tools/testing/selftests/arm64/signal/testcases/testcases.h
+++ tools/testing/selftests/arm64/signal/testcases/testcases.h
@@ -88,8 +88,29 @@ struct fake_sigframe {
 
 bool validate_reserved(ucontext_t *uc, size_t resv_sz, char **err);
 
-struct _aarch64_ctx *get_header(struct _aarch64_ctx *head, uint32_t magic,
-				size_t resv_sz, size_t *offset);
+static inline struct _aarch64_ctx *get_header(struct _aarch64_ctx *head, uint32_t magic,
+				size_t resv_sz, size_t *offset)
+{
+	size_t offs = 0;
+	struct _aarch64_ctx *found = NULL;
+
+	if (!head || resv_sz < HDR_SZ)
+		return found;
+
+	while (offs <= resv_sz - HDR_SZ &&
+	       head->magic != magic && head->magic) {
+		offs += head->size;
+		head = GET_RESV_NEXT_HEAD(head);
+	}
+	if (head->magic == magic) {
+		found = head;
+		if (offset)
+			*offset = offs;
+	}
+
+	return found;
+}
+
 
 static inline struct _aarch64_ctx *get_terminator(struct _aarch64_ctx *head,
 						  size_t resv_sz,
-- 
2.25.1


