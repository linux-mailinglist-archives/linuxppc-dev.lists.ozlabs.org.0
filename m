Return-Path: <linuxppc-dev+bounces-2412-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0825C9A4546
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Oct 2024 19:46:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XVXF46v7hz3byj;
	Sat, 19 Oct 2024 04:46:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::434"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729273576;
	cv=none; b=hZlx8MOAswDUhOkZScTJTQKVSFqM5+EFveAn0544fEn0iAZXoDJE/jBJW40srhUW5QIQaGWOinupUIHIQG7j//gFWJdarWmW7gZyL+Fx5HmTDqLvxAksNWsuHeR/75rxDchQHaYNU6lAD9xvrra8Ey8Qu1L2m0PAoQYZx1bmM0rupkTx3lsm3M6FPQB6I3pWh78rDCKyrVnvJ7sOHtrjWKJdFFp3xwniMYOsljS5SNQWUL0mFYBR07spc/KMZV7YDzVxzBgeATIs8taOttndqMbsWrFn4h8PlE0C8U5gEYOnIpOjOsnejH3uuVxgfBHGPYLOhq3keoz1KZOjc+76Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729273576; c=relaxed/relaxed;
	bh=qaM5T4CJ19PBW8+xMVASp9taX+sewdJcY3azhiQ9zoE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ru3sQr4Jki/wZzS66NeGmeMuTPOmbraiYH/5FezAtupUtndB/FoBlC4r8FOv7wbCVFPEA9j9hQDC303KUNhA6FAsNTomJ/nfCA/g5LhyxkYoUZ8vbq+lN6veVCj2C5/yeUzKHAtskoKyUodcsVzYTiecSZ/8PSov/cg8WqoFxnFlcSD3HKvH1om1l++wql/nst2O8OzqV4cayvyxfIGp61yzIvnAUkuoh51wvSy2SCdtubBD57hthmiRK3IfILlB+Mm6zm/enjY7njYctKvLPX/HWzipeZwm2NPW17ro2P15WhD5+ma8JU6dAEHZ7qjG76pFj1iAyjQhrpCbmDnFhQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dLWmjvdX; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dLWmjvdX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XVXF34Zkpz3byP
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Oct 2024 04:46:15 +1100 (AEDT)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-71e70c32cd7so2009055b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Oct 2024 10:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729273573; x=1729878373; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qaM5T4CJ19PBW8+xMVASp9taX+sewdJcY3azhiQ9zoE=;
        b=dLWmjvdXAVQ+ivWy1qMluoAcrqvrTY/5rhTGuvDMuLKyJZOsBB8UlH9sWRs2lQ3e3I
         Cy+XuNGwiKgICpOhgzZxseYIFVLszmFkLdsrqiSM4hmWQ6SCqzFNqagZfLtFlFDjU49T
         ARE9eMRv6xvw6p13YRUZD0RvWyfU8t4oVW8ckjsJqaL0OXJM2wEDQsDI3KF1P+wLXILY
         60ocwcQy8UTpXuTMX5ltFll+2gNsAIGPIvPzrydkcLUAcJ/6C63dYIQQujb2edy7EtW+
         udBHoqYstGk6mOv10FGx7tsTL3clTr/XajaJenUJ2c94bGm6QCHmuyNBgwQWTy9jJO5G
         mk+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729273573; x=1729878373;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qaM5T4CJ19PBW8+xMVASp9taX+sewdJcY3azhiQ9zoE=;
        b=tO2RjynfSY2cMlMnTax68LSJA7uZe7CgipvU2DMwcPvPsB1khiMl1wMShestSvqHdD
         5OSxGKC0JXwO8vJnr8ksiFFsFPkSBWlPvASQ6N0oXbyy0Sp+LcA8usAupElyxA72HJjU
         XDdE0SWdf0TQsMkt5risr84i4jorydZmOne/9+UkMkRwlhDrY+0E0nfaVgKn5Sj5xcSS
         8zloNssXqlvEdMAAuAUsg3t2gk3Vx7b7sxVr2I6OriJn3mFCyOEr5noIYqb7ifzGSzQC
         yjnDG/XUE0GpTVAPFCNMlzAbRTYKUNGmQW+kBLS011DgDJqsya/vAyn/bE+gy4FstX4B
         FJVw==
X-Gm-Message-State: AOJu0YxKWGOwxR4xaSc01MvpTVzE37E0tUxX++/oMN6tgjkV2nOspQaJ
	k5JMq31/CkLEoXacPozW3EpwrRoJUAf3dzB5JlHmwNkXFOblFYV+
X-Google-Smtp-Source: AGHT+IGSSI7jEYC7xY7ckeIela+JOOPhw5yI7WHvEbCADCnIxcJvFhDyLOcRwdwjOsLHqTB2hn2gxw==
X-Received: by 2002:a05:6a00:18a2:b0:71e:1722:d02c with SMTP id d2e1a72fcca58-71ea3117050mr4572391b3a.3.1729273573297;
        Fri, 18 Oct 2024 10:46:13 -0700 (PDT)
Received: from dw-tp.ibmuc.com ([171.76.80.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ea333e939sm1731148b3a.82.2024.10.18.10.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 10:46:12 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: kasan-dev@googlegroups.com
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-mm@kvack.org,
	Dmitry Vyukov <dvyukov@google.com>,
	Marco Elver <elver@google.com>,
	Alexander Potapenko <glider@google.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Nirjhar Roy <nirjhar@linux.ibm.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCH v3] mm/kfence: Add a new kunit test test_use_after_free_read_nofault()
Date: Fri, 18 Oct 2024 23:16:01 +0530
Message-ID: <210e561f7845697a32de44b643393890f180069f.1729272697.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.46.0
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
Signed-off-by: Nirjhar Roy <nirjhar@linux.ibm.com>
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---

Will be nice if we can get some feedback on this.

v2 -> v3:
=========
1. Separated out this kfence kunit test from the larger powerpc+kfence+v3 series.
2. Dropped RFC tag

[v2]: https://lore.kernel.org/linuxppc-dev/cover.1728954719.git.ritesh.list@gmail.com
[powerpc+kfence+v3]: https://lore.kernel.org/linuxppc-dev/cover.1729271995.git.ritesh.list@gmail.com

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


