Return-Path: <linuxppc-dev+bounces-14842-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EFFCC8D12
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Dec 2025 17:38:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dWfd95CQxz304h;
	Thu, 18 Dec 2025 03:38:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765989533;
	cv=none; b=MohbLKzTnCkGP9BSDPtNYrdUxnyp3IHOMEvuFAvTjYp5qzJaa+BQyYnDf3DO3n83j1w8omT9NdjOlVkypk0UGB+OmSMWnuyDheIKsktjwjM1SrOSWzki4RnmJjAHSq/XrM1VwJXj8hhDVCzY/RQ4mt8z9RYRx4SoZESy1e+KmFKy3ZT+TWsxLsaazkw8Y0BsT1YBvr3p9QOrjXQbEER+Cu4Pn48Va4Zfrtxl4QwjEHuU4SvnYT63GkH+M5YOJpv7i0Q5ic8m+/bGibX+a26XVUnIUPZVGcIefdZWiH4W3OiS/YamVgERiO80V8oH4t4Z4mZQpKLZR87ZNt8Rllk1og==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765989533; c=relaxed/relaxed;
	bh=68xIy8TR2vZ7SGUApCF+7LoXIIR/VjU2Kv8yZ1lFSig=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iZUn5E78fka0LORbeJyEyqd9QcoW8qRKmLJgjDm1nEdldM07C7pMn1k8JDo283zRpZX5ZKRyDlqtwhKPZI+hEoF6zVcKeWe85KmH4G3m9XfALcDsveSA3Mm64DszviKlWfCkGmb+aX13CxUUkLEAupRA6BRGQB1ExR0fCvU89aM8Oi/mkAjMTcQUJAmxEWZcwHRPVls4gPFTOc4VfRqt0sXye6/Wid4N9Sc/2qcei6+75Vffv8CJzfYp8SuPMGC7uX9LH9CYPAh6Jp+8p3jHiy69F2m+g335Kgv5QZ1V9FNVQWiSy8z7pc1LW94Bwls3agKXD+RkiOGSoach1U32ew==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dWfd82mvZz2yxk
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Dec 2025 03:38:51 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7612A106F;
	Wed, 17 Dec 2025 08:38:13 -0800 (PST)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 100133F5CA;
	Wed, 17 Dec 2025 08:38:18 -0800 (PST)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org,
	Ryan Roberts <ryan.roberts@arm.com>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	Kevin Brodsky <kevin.brodsky@arm.com>
Subject: [PATCH] mm: Add basic tests for lazy_mmu - fix for powerpc
Date: Wed, 17 Dec 2025 16:38:12 +0000
Message-ID: <20251217163812.2633648-2-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251216201403.4647a4f9861d3122ee9e90d7@linux-foundation.org>
References: <20251216201403.4647a4f9861d3122ee9e90d7@linux-foundation.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Add MODULE_IMPORT_NS() for symbols referenced on powerpc.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---

Andrew, please squash this into the last patch in the series
("mm: Add basic tests for lazy_mmu"). Thanks!
---
 mm/tests/lazy_mmu_mode_kunit.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/mm/tests/lazy_mmu_mode_kunit.c b/mm/tests/lazy_mmu_mode_kunit.c
index 2720eb995714..1c23456b467e 100644
--- a/mm/tests/lazy_mmu_mode_kunit.c
+++ b/mm/tests/lazy_mmu_mode_kunit.c
@@ -2,6 +2,9 @@
 #include <kunit/test.h>
 #include <linux/pgtable.h>
 
+/* For some symbols referenced by arch_{enter,leave}_lazy_mmu_mode on powerpc */
+MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");
+
 static void expect_not_active(struct kunit *test)
 {
 	KUNIT_EXPECT_FALSE(test, is_lazy_mmu_mode_active());

base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
-- 
2.51.2


