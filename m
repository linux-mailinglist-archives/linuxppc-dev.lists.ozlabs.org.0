Return-Path: <linuxppc-dev+bounces-2246-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E56E799DB8E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2024 03:34:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XSGpX5fKKz3bqP;
	Tue, 15 Oct 2024 12:33:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::431"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728956036;
	cv=none; b=YCP8iZdJthK8FQsjyPawSgUQz4E14hpXnvOJAJjJsqXauiRXQudiSXwHAxhCvTAIMs8C80Xzf50ZKvjYcc3+klNV2yuWW7k8Ky3NfG8LEj4YktnwG71AHaPSLGVjtQGu6w5nuSmUKTCpF7LR7iO8xK8q99jPToyhQWMIonAyopNUPiyJUy4bpd1bhFLZJ691MgihL+MG65dRR2I0JMxBiWLu6oozDU/oa9XkVl7GHiTxWt4DmVtBtUI1qjM2XwS1u8gGH+SHQFvffYQj/yV3z3ApG4hbFSnoHEBehIjYjclKjTd4ZjhHi44MOr4TGciBBKb+m+RBq+qPurtCWpg6wA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728956036; c=relaxed/relaxed;
	bh=L3z8aqN2PapGEchw6ngaiDWNeD417V3WkhQBwYXWFqM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hYtskwTLmgIwTKxfykFMicN9LctcbXyVVGqc00PDEpPM+7Ov5dEVBfDtu1p4tNEINHWBI3WWlOjOgdkc9zW+3w4x4kASEXtJSbg6j1rBOOo+BF/WwsxQRWkOvxcXAH3NWvvwg2syUZtOcpeCkPBhygPJgeGxho0QIpPKBO4fq7IzkSqH/Wt/rXCoXSfhlCVq6T7YDIcoASjhSO07s6LQ/X4pKXulTex8uV57k03VFPFXt91umIQjYgZ+EiQtBKIWnbTpxQMMv/VqNBZ+LDJjQLPS9Y5GcJPecZ4i0sZus1Zz+pewInhd7uz4USOvoGLKD9VDgVtgc0mPLpZuv9zNmA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QFpuD5ww; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QFpuD5ww;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XSGpW5tY1z305n
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2024 12:33:55 +1100 (AEDT)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-71e6cec7227so934594b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2024 18:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728956032; x=1729560832; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L3z8aqN2PapGEchw6ngaiDWNeD417V3WkhQBwYXWFqM=;
        b=QFpuD5wwzEFmxHOnkrpgPn7+D6FrP8xc5B34rC/vzK+hjCDF0SSjrZjt7lm8rbEznH
         xmapsHVAvx62WnjorA/AW5lND+KN93M3Y91TVqgDpRTqNCQcrVoUP3T7lc4CeoMPcBNe
         Ruu2bV41c4KIc09dE5KEKO4u8xaC+pRtGRdrqGIC/0+vCGkFhfMW/fho1Kz1kwjLUJL9
         VgY48oNITAbcRahXPNi5XLK4Y0Q3NMTM/1bEebYq0hHnIpjHJOj4jyjrGvA4l6tFomJB
         0aGl3VlC1xVqd4H7zD3Rbh+qWLYN1aRLkIRl18oWdJRRz3d5U7CfBvnRUzWlKZuIqfuK
         Gj+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728956032; x=1729560832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L3z8aqN2PapGEchw6ngaiDWNeD417V3WkhQBwYXWFqM=;
        b=EPvcZ+d1yFmFpkwlGrR0VDu8fEaH1t60swssjL0SzkWhDlLhlo3Cdj0nDXn4cFXIhS
         tEjDpYjQV/SJwUwu40blRXXOgoekQvIkgttdQ0mfsTGimOZEs4JKxSGpbnLrNR5gd16F
         c8MEcf9233R581RASR9dZG7VlfJEdXAWb8dcrOb/d7P29jWrivYGdZQ9teEADVpELiaV
         639zzbwLUFQpU01Pwcr5tBL1uxAum5g2xUmRAQtgI+wLEbYyAZbYTERFsDp38MAdfWO/
         KXup9Gs4Yg7hLO8bykKlSRyW3Dk2eHbCfHY9hK7PxjCDLwStDU6CbeBPoNflyabGl9mT
         lgVw==
X-Gm-Message-State: AOJu0YzlyfjY77SGZojfD/FCgr7fFFEHrugqPhLnSK22Ee+xq2X1CoBW
	UtUTb2IwPDeM+JX/J8HA1PNc1yjMAxeL/DQWYPV+k2G4SgU5yD7jkyeMKw==
X-Google-Smtp-Source: AGHT+IGqbk3XkcP38tM4YL865mfr8G0wKwLOrKwm5cB+ZAuXCK3oFNnJ20ByJ9R3zI+2HFTRH1ioYA==
X-Received: by 2002:a05:6a00:9a1:b0:71d:f215:1d96 with SMTP id d2e1a72fcca58-71e37e287e7mr22675408b3a.6.1728956031701;
        Mon, 14 Oct 2024 18:33:51 -0700 (PDT)
Received: from dw-tp.. ([171.76.80.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e77508562sm189349b3a.186.2024.10.14.18.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 18:33:51 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: kasan-dev@googlegroups.com,
	linux-mm@kvack.org,
	Marco Elver <elver@google.com>,
	Alexander Potapenko <glider@google.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Hari Bathini <hbathini@linux.ibm.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Donet Tom <donettom@linux.vnet.ibm.com>,
	Pavithra Prakash <pavrampu@linux.vnet.ibm.com>,
	LKML <linux-kernel@vger.kernel.org>,
	Nirjhar Roy <nirjhar@linux.ibm.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [RFC RESEND v2 01/13] mm/kfence: Add a new kunit test test_use_after_free_read_nofault()
Date: Tue, 15 Oct 2024 07:03:24 +0530
Message-ID: <c987f2cb5d19e400ba3f1167e730a00bc16b7ca8.1728954719.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1728954719.git.ritesh.list@gmail.com>
References: <cover.1728954719.git.ritesh.list@gmail.com>
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
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

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


