Return-Path: <linuxppc-dev+bounces-2245-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C1899DB88
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2024 03:34:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XSGpW0nhDz3bfK;
	Tue, 15 Oct 2024 12:33:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::531"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728956035;
	cv=none; b=orDV0JJz0Y0355RERiPaAGTMXbgckBUwknMHef5A6UkuMfhF1ke/Mte+leK9zyVjE33d2nF3mSy8etaRlPpkI4hwL/blCV1iZkOERxE5qyN9i+uEh8dRT4U0/QuoPFDRSYGQewmRVQRX7p/8vA0uvZrzHeOHKiUebc6uIOm/iBUxwSEbY458YVyHczaAiJpGSKJEKz6gjF1sDLOHZcj8dYVU5Tqu1VYtqsPPZNuViTyrIcPEWrExdpZv5IClfFBTkmABFapfiDQdv33fXmdmSRZLQ5R3Hvwi24juOwoX8iOacxcO5vkKlErVg0VHDI658FgC2xPR01hJ1X5BbkFCyA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728956035; c=relaxed/relaxed;
	bh=/FgRTRf0le7Jh2w75CMwMOtbUSojhg+y46VXsqNVeW4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dtKQCBJHxAhJefgplwI41UGjfu+95ozCmK8mBphcmx0wUwRjnT6MMwvD7rCMdDH1gWaUT4bSOFeUABRm+3Mk4UK9aHfjAxTgb/ZvUQkyiso9QEUu6NUYtuqq7HYv5OnjJeNzwiBmcyvY4yd2L4hihPRUcmWxhOuCkulMV35Yzp0j54yQl+Ga6+ZExg6Yyiki8geSJMdTwJa53DRCeKB6BT944LF2Mvjkwf/ysbSozI3AlgCtMLDStzqlEM4MtgSl/Ine9tvQGkybBVZhKJQKMimvXaET4tiUEDQLvPvmxvay127g2rNfWTwly2qbupvnFo2M4IpH3ucMgY5JYJlGMQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lb0IWAK2; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::531; helo=mail-pg1-x531.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lb0IWAK2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::531; helo=mail-pg1-x531.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XSGpT3qXzz305n
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2024 12:33:51 +1100 (AEDT)
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-7ea12e0dc7aso3044482a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2024 18:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728956027; x=1729560827; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/FgRTRf0le7Jh2w75CMwMOtbUSojhg+y46VXsqNVeW4=;
        b=lb0IWAK2x0mOi4a9KTSfXAKX9vrA46ZIRMQM5k+uTb1r9OhTMylUfJ7iveXkvzWYWQ
         CvVwqYhrtJ7h+PLiERA30NU/Mrv6lQxGy3sMSC4vV3ncfUse1pp4/oUj9Vck18jfyb2e
         RnK2I7ZozRUwkoRJ1xMkTkZoL/HBlUKsxZwmKpj3VO4ECgLyugYOrDiI+qprYZgEBCdZ
         SViiCBMEIFHpSdvDePwHOgJOmyweMht9Pf5ystNFoNnm4O3wj0t4YSp7BkbS8q9Pc5M8
         aijrw7qjJB8/hurZzF6eXkUDvO3dPjDDiuaXpYv7f9Ev12U7vg5jnFrnyVgj4YSG+rOf
         loTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728956027; x=1729560827;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/FgRTRf0le7Jh2w75CMwMOtbUSojhg+y46VXsqNVeW4=;
        b=KAhl8VV1f/FSlXZPZYPoT9a4j2saHzvsbjy8/Zoh3Ipe1XPAwrriaC5JmGBL9P6ZNV
         1jxG8bhHpj7YBj8PCmylLUrzOpVwaOOW+/ne5bzHjAdQwGx0IRvL3b+fDAExT8ngaRzC
         O35K6i1FYMlVn0dq2hohqPfKqWcwj1lTTu2HM1blKjYYOOKBjCsRU+CG7Nu44p5bW7Wa
         mM8SkhDCTVNUbNd28URJP9HCIbmVb8Uk9J11l06qho4HhSGI4UkoDym+5bjzycY1cSb3
         UAdqPPCtfdMvOs+BMQ3WjN/wYCPEEaav1k6ad5ZT/LDEYxwrWqtMBNkyMuvw7He0cxtn
         pDZw==
X-Gm-Message-State: AOJu0YxuQ96SNV70S8IHNfMgmXDVVGpYi9E/1U5jdQt6jT8xQIsLew1G
	fkBnjkGBsjlYW8jUDS3baypBLSesDzKlHCz9nD15WpORn/3OxeBjVX5D5w==
X-Google-Smtp-Source: AGHT+IE2VbhYvinnTtnp8gdiPFs7AssOulNu8P5FQjpDVoCidl6hRwDILWFOZsBNBRYKYFDJk0Ss8Q==
X-Received: by 2002:a05:6a20:9f4a:b0:1d5:1729:35ec with SMTP id adf61e73a8af0-1d8c955c8ebmr16914023637.7.1728956026633;
        Mon, 14 Oct 2024 18:33:46 -0700 (PDT)
Received: from dw-tp.. ([171.76.80.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e77508562sm189349b3a.186.2024.10.14.18.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 18:33:45 -0700 (PDT)
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
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [RFC RESEND v2 00/13] powerpc/kfence: Improve kfence support
Date: Tue, 15 Oct 2024 07:03:23 +0530
Message-ID: <cover.1728954719.git.ritesh.list@gmail.com>
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

Resending v2 for review comments.

This patch series addresses following to improve kfence support on Powerpc.

1. Usage of copy_from_kernel_nofault() within kernel, such as read from
   /proc/kcore can cause kfence to report false negatives.

   This is similar to what was reported on s390. [1]
   [1]: https://lore.kernel.org/all/20230213183858.1473681-1-hca@linux.ibm.com/

   Hence this series adds patch-1 as a kfence kunit test to detect
   copy_from_kernel_nofault() case. I assume the same might be needed for all
   other archs as well (Please correct if this understanding is wrong).

   Patch-2, thus adds a fix to handle this case in ___do_page_fault() for
   powerpc.

2. (book3s64) Kfence depends upon debug_pagealloc infrastructure on Hash.
   debug_pagealloc allocates a linear map based on the size of the DRAM i.e.
   1 byte for every 64k page. That means for a 16TB DRAM, it will need 256MB
   memory for linear map. Memory for linear map on pseries comes from
   RMA region which has size limitation. On P8 RMA is 512MB, in which we also
   fit crash kernel at 256MB, paca allocations and emergency stacks.
   That means there is not enough memory in the RMA region for the linear map
   based on DRAM size (required by debug_pagealloc).

   Now kfence only requires memory for it's kfence objects. kfence by default
   requires only (255 + 1) * 2 i.e. 32 MB for 64k pagesize.

Summary of patches
==================
This series in Patch-1 adds a kfence kunit testcase to detect
copy_from_kernel_nofault() case. I assume the same should be needed for all
other archs as well.

Patch-2 adds a fix to handle this false negatives from copy_from_kernel_nofault().

Patch[3-9] removes the direct dependency of kfence on debug_pagealloc
infrastructure. We make Hash kernel linear map functions to take linear map array
as a parameter so that it can support debug_pagealloc and kfence individually.
That means we don't need to keep the size of the linear map to be
DRAM_SIZE >> PAGE_SHIFT anymore for kfence.

Patch-10: Adds kfence support with above (abstracted out) kernel linear map
infrastructure. With it, this also fixes, the boot failure problem when kfence
gets enabled on Hash with >=16TB of RAM.

Patch-11 & Patch-12: Ensure late initialization of kfence is disabled for both
Hash and Radix due to linear mapping size limiations. Commit gives more
description.

Patch-13: Early detects if debug_pagealloc cannot be enabled (due to RMA size
limitation) so that the linear mapping size can be set correctly during init.

Testing:
========
It passes kfence kunit tests with Hash and Radix.
[   44.355173][    T1] # kfence: pass:27 fail:0 skip:0 total:27
[   44.358631][    T1] # Totals: pass:27 fail:0 skip:0 total:27
[   44.365570][    T1] ok 1 kfence


Future TODO:
============
When kfence on Hash gets enabled, the kernel linear map uses PAGE_SIZE mapping
rather than 16MB mapping. This should be improved in future.

v1 -> v2:
=========
1. Added a kunit testcase patch-1.
2. Fixed a false negative with copy_from_kernel_nofault() in patch-2.
3. Addressed review comments from Christophe Leroy.
4. Added patch-13.


Nirjhar Roy (1):
  mm/kfence: Add a new kunit test test_use_after_free_read_nofault()

Ritesh Harjani (IBM) (12):
  powerpc: mm: Fix kfence page fault reporting
  book3s64/hash: Remove kfence support temporarily
  book3s64/hash: Refactor kernel linear map related calls
  book3s64/hash: Add hash_debug_pagealloc_add_slot() function
  book3s64/hash: Add hash_debug_pagealloc_alloc_slots() function
  book3s64/hash: Refactor hash__kernel_map_pages() function
  book3s64/hash: Make kernel_map_linear_page() generic
  book3s64/hash: Disable debug_pagealloc if it requires more memory
  book3s64/hash: Add kfence functionality
  book3s64/radix: Refactoring common kfence related functions
  book3s64/hash: Disable kfence if not early init
  book3s64/hash: Early detect debug_pagealloc size requirement

 arch/powerpc/include/asm/kfence.h        |   8 +-
 arch/powerpc/mm/book3s64/hash_utils.c    | 364 +++++++++++++++++------
 arch/powerpc/mm/book3s64/pgtable.c       |  13 +
 arch/powerpc/mm/book3s64/radix_pgtable.c |  12 -
 arch/powerpc/mm/fault.c                  |  10 +-
 arch/powerpc/mm/init-common.c            |   1 +
 mm/kfence/kfence_test.c                  |  17 ++
 7 files changed, 318 insertions(+), 107 deletions(-)

--
2.46.0


