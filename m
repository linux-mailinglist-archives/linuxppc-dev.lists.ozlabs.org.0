Return-Path: <linuxppc-dev+bounces-1434-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F7E97C2E5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Sep 2024 04:56:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X8Ksv09Zlz2xrv;
	Thu, 19 Sep 2024 12:56:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726714594;
	cv=none; b=CZGbnpi3+xv2UopT+qZn4sPrRIOZLSWSdOaTKpmXK3xfSFVCsi3TjiRUCfnv3Xx/qhS6IFovT1tJgbsgIJ3IWEH/vRNpce5BTDIVOCsBUOjA1UancDCJDVTMwx5lgxLCYRh1tiFP0DmhjcqG77vnHicoMB2v4IvOEwPPlQAtSxmYgjerquRkjRSvpVhhribYjsZR3/6P9CrIogTxxBYVVfPCGLtaCit6NE2ZYkT04RDeDwwgs3G7PbyZ3THnr9ELb2TTIzwttck4eVhuXuuPx62H7I8rWx2i5tAE1XJcBj/YbihFkJeDF0RbyLiQLnUHftz8wQKcn9hQYrlmV/xvvw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726714594; c=relaxed/relaxed;
	bh=L3z8aqN2PapGEchw6ngaiDWNeD417V3WkhQBwYXWFqM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hMytnaOe+n//4ZRX7vLN81kktU+IdLPnHrtPfiJgLsv9b15VnmRR9TheU1szVHa2rDjERx1CJdDTO8oGcvPr6Xf+ObR+Ce6jMuAHtOYGDQEreX2x1ty7LM44FsrnOXOXWfwwUSf5HEa7cwj9nvACPBRt6+/Ye+6sl+buAxQJFIg8mX2TH/5vFL5yVA4OYgApDn9KkP/+8Q9uDfnBBNNCHsQ2hHsMSzZD875gjjXNxHJWHjDhUd00CUwMYuwXRJhiohxziQkf6BPe1BA1p/+fVnIUDUv+8hhzjTyxI5Ah4XDvEmT8DGjlSJ8fmEQGIkeeUImendPSy2gHZmC+niECjg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kfs0NYWK; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kfs0NYWK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X8Kst2lCrz2xHl
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Sep 2024 12:56:34 +1000 (AEST)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-206f9b872b2so3366105ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Sep 2024 19:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726714590; x=1727319390; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L3z8aqN2PapGEchw6ngaiDWNeD417V3WkhQBwYXWFqM=;
        b=kfs0NYWKnryHyXo5srwF6d8TjOK+eLbo427uodgSylTayJzvPCRM/7uUta6af8RGjR
         PsOGxt1N9RfbqkuXbaXTQnUZ9BzKdC+3jK3x3gQTBY2d7kwgVC9+Pv9vsh7KbtC456H7
         /SGyXGnPXOk5368kCYQfF4ad71N3iEAOb1PzRZPu1t1nx+QqWjH0mVzY4yeyAuYdHNyw
         vBVw5vncTbgRyW9BsFwOXFx7GL4g/SN5D+Pv32Yqao7CSApzDtgEKgaUQRfY+KVIaPfB
         nyp6GVuM4Tx/Q/eEluEFgaILjWrKX9/yTPe8JHIJO9dP0+MAvmaB7jobj/Mc1Bw+Zzbn
         +ztg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726714590; x=1727319390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L3z8aqN2PapGEchw6ngaiDWNeD417V3WkhQBwYXWFqM=;
        b=QPaIH31zewjALoSbaGbaW4SxDD5pNsGUNcDNJq859CIS7w1sSpJ6dv3Sr1pC4iMoWV
         lgtdCKDypO61M9ViLkgErqyGhs4bw2XITuP/HepcLkSLFaAsUStSLPiE8TYL88yISfXw
         4bcSHzDHQv0aJ9gmyyB14aHwMaYpLjDG4ADl1C0Gj1ikhv6+hOmkcgsgpsBiNqaAqE1n
         L+IUW+oqrBsH9ExXXHpBX7uj45/crhL54k/hLfYCQP9m9pyYn+Wt7Le9bIsBBaaRZyQw
         dtd9OUUzwdvlskfAcndRxAuNLqgnc0LmfaX0dzdvd+sl2C8lXVz/Ho0nTlhbEK+OjdMW
         1NVw==
X-Gm-Message-State: AOJu0Yz/jWEb1ju0sXO0dSBl42AVRsq3QMKuw3JS4H64+jPyYGQz2BLZ
	UqC+IJXcOOx+oHQoPBUlyr2dsgraw3tnfL01Ks1xI1N0rTCURGAAebpHEw==
X-Google-Smtp-Source: AGHT+IG3E3x5sXQMsxEWayCG7th6zZkwGaojJWrlU5aw9OEqWkqNzOuRCe7304FOOtHaaUGVabeHyA==
X-Received: by 2002:a17:902:da84:b0:206:c911:9d75 with SMTP id d9443c01a7336-2076e3b2654mr336649595ad.20.1726714590396;
        Wed, 18 Sep 2024 19:56:30 -0700 (PDT)
Received: from dw-tp.. ([171.76.85.129])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-207946d2823sm71389105ad.148.2024.09.18.19.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 19:56:29 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Hari Bathini <hbathini@linux.ibm.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Donet Tom <donettom@linux.vnet.ibm.com>,
	Pavithra Prakash <pavrampu@linux.vnet.ibm.com>,
	Nirjhar Roy <nirjhar@linux.ibm.com>,
	LKML <linux-kernel@vger.kernel.org>,
	kasan-dev@googlegroups.com,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	linux-mm@kvack.org
Subject: [RFC v2 01/13] mm/kfence: Add a new kunit test test_use_after_free_read_nofault()
Date: Thu, 19 Sep 2024 08:25:59 +0530
Message-ID: <a8ca8bd5eb4114304b34dd8bac7a6280d358c728.1726571179.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1726571179.git.ritesh.list@gmail.com>
References: <cover.1726571179.git.ritesh.list@gmail.com>
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

From: Nirjhar Roy <nirjhar@linux.ibm.com>

Faults from copy_from_kernel_nofault() needs to be handled by fixup
table and should not be handled by kfence. Otherwise while reading
/proc/kcore which uses copy_from_kernel_nofault(), kfence can generate
false negatives. This can happen when /proc/kcore ends up reading an
unmapped address from kfence pool.

Let's add a testcase to cover this case.

Co-developed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
Signed-off-by: Nirjhar Roy <nirjhar@linux.ibm.com>
Cc: kasan-dev@googlegroups.com
Cc: Alexander Potapenko <glider@google.com>
Cc: linux-mm@kvack.org
---
 mm/kfence/kfence_test.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/mm/kfence/kfence_test.c b/mm/kfence/kfence_test.c
index 00fd17285285..f65fb182466d 100644
--- a/mm/kfence/kfence_test.c
+++ b/mm/kfence/kfence_test.c
@@ -383,6 +383,22 @@ static void test_use_after_free_read(struct kunit *test)
 	KUNIT_EXPECT_TRUE(test, report_matches(&expect));
 }

+static void test_use_after_free_read_nofault(struct kunit *test)
+{
+	const size_t size = 32;
+	char *addr;
+	char dst;
+	int ret;
+
+	setup_test_cache(test, size, 0, NULL);
+	addr = test_alloc(test, size, GFP_KERNEL, ALLOCATE_ANY);
+	test_free(addr);
+	/* Use after free with *_nofault() */
+	ret = copy_from_kernel_nofault(&dst, addr, 1);
+	KUNIT_EXPECT_EQ(test, ret, -EFAULT);
+	KUNIT_EXPECT_FALSE(test, report_available());
+}
+
 static void test_double_free(struct kunit *test)
 {
 	const size_t size = 32;
@@ -780,6 +796,7 @@ static struct kunit_case kfence_test_cases[] = {
 	KFENCE_KUNIT_CASE(test_out_of_bounds_read),
 	KFENCE_KUNIT_CASE(test_out_of_bounds_write),
 	KFENCE_KUNIT_CASE(test_use_after_free_read),
+	KFENCE_KUNIT_CASE(test_use_after_free_read_nofault),
 	KFENCE_KUNIT_CASE(test_double_free),
 	KFENCE_KUNIT_CASE(test_invalid_addr_free),
 	KFENCE_KUNIT_CASE(test_corruption),
--
2.46.0


