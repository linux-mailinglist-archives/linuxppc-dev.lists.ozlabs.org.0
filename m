Return-Path: <linuxppc-dev+bounces-1433-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D03297C2E1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Sep 2024 04:56:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X8Ksn5rLrz2xHt;
	Thu, 19 Sep 2024 12:56:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726714589;
	cv=none; b=Vk2tHb7bOa982Y+6m3QCZhSaWT6RB0muTxMs/6Is+gi+3RkkY4HWJA/3aKHjj/4TZJi83pt+jG3bxgxYh1GBJvp5bABaCDiu9iRyves51aXTuge2bykIBoN7ZQTZ6PYuiR1jBahKjB6CGq9LMrlBMoK0uNPC3mkalMaT/61r5tM91haztFW0Yz09IjygVW7YloG2lnTIR8gtp8DQsKk2mWLbZrBciqP+haLksvuO6O67xYIcniU0jJSwBVwFgFfI1ZT2+v3b7xpyUv3Z2U28dH52r61W5/hwjy+kkARQfaISUXqOnfDc6AmN4M41IEqp5xar1vgfGPmdCoMg98XvMw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726714589; c=relaxed/relaxed;
	bh=5GJhA0mjEPdtfqnf/P6njWML6hfKb60sWwrvJGKoU+s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Gl0bu5UtT/QlNg8g99EXGyG0qXpkb0d5dbMwRTvIQGNc0W8g8fG5XczRE+ay5EF1Ec7hR5TzKdW34tGRP/mKYh3HUQxijA7xQCB3WAZRRZeGMkoY5eo1jcIbviXyAz4nGLKywZSYCOW5PprT3Z6lblX1FL0RhdXQ+x8NS68y2J+mJ1Dl18DhBgnYQZI9MdJQvMCxWP4crOCIofe6sXGVBeyTr9GUkE0CKAoNfMUcsTRdUfX4aDYIHEi7MUq34insjO3iWfzTD2v0C7eDAWtRr5SlsKawDxBJnG/FvoVV54PwZvKJIZPL8iE5ApoYKxXEIrI9p+9AogaLYvjFqAHt3g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jBgm84It; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jBgm84It;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X8Ksn0FXVz2xHl
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Sep 2024 12:56:28 +1000 (AEST)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-205659dc63aso3656305ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Sep 2024 19:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726714585; x=1727319385; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5GJhA0mjEPdtfqnf/P6njWML6hfKb60sWwrvJGKoU+s=;
        b=jBgm84ItHWXgNflisrCAdl0Vwp6oWahCQ7gjpdaTkdYlflAz0Of+sJlZfPKcIgKd87
         9cTzF9i3RYaQyNA31vtSTiPn04SliWIJJMtAK/iXtKh+XE2a0dmEdspqPODcS/ZiJuac
         7h2FJkuvg7uZdt4PT55Dg+3PrmC30nqkaFaJL1Z95NLsjolnSH0Iv2j1wwqVl9eqeII3
         YuMdRH5N1grgwX4x7Gofsodic6uIicMn7rnoWumkQrGLY4HXSHpx0A0xyOR4x0CT3GK7
         qORPBP6XD+DMdlWDNdRv3/6CwzzKDV/HOU6bb5zPtoAv5CoBApC4oP7xXVBZPg5JEgmb
         znpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726714585; x=1727319385;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5GJhA0mjEPdtfqnf/P6njWML6hfKb60sWwrvJGKoU+s=;
        b=apNMNBZDR6H8X2I87uKvu8K/Yx8IwcqNKa22ZI+4MAWBTPE6ZVOhmjq+Hb/yu19VEq
         ZvKDArmELoguuwgvK8fhBOnVJ4If3tbA1KOc1QMytQ8z8JsiqviDF1JdBf0lnemzOcij
         zvEVIzn4kBWOl83w856fudST/UxjXHcNI6TOpWNzvzugv1HVnzwxnldvsbEiGzAxhpwP
         iZYLvS8gCuHY00nIIzJG5hUcEv5h+hxTl0OInAYQE9dDE+Q+VUCugNAZly4QQW0jyJNY
         J7PxqUd9nPC8VA0ZJhKSmZV5SUbeJ+TWW99zdv3qqqfKAqcLF2JqUDheZ0EYr4QJP6zW
         A29A==
X-Gm-Message-State: AOJu0YzcWTqBveJ+IktUtVqBLlznzt0dxvPPD6cPiQpIsmwHFFxxDQ14
	zdJQ7Cq/g3c7jhYKNqLYRriUmGS8TG/3TN1k0zclqizhEd6wvtauOAdcfg==
X-Google-Smtp-Source: AGHT+IHIzIrN7dSCPrbE7fe3ybp0UNqueC5VHEPzo/kjfCC7reDC/kUQyqMyZ+se7vzPcIhbgfXgSg==
X-Received: by 2002:a17:903:1252:b0:204:e310:8c7b with SMTP id d9443c01a7336-2076e3f7347mr313393475ad.34.1726714584737;
        Wed, 18 Sep 2024 19:56:24 -0700 (PDT)
Received: from dw-tp.. ([171.76.85.129])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-207946d2823sm71389105ad.148.2024.09.18.19.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 19:56:24 -0700 (PDT)
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
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [RFC v2 00/13] powerpc/kfence: Improve kfence support
Date: Thu, 19 Sep 2024 08:25:58 +0530
Message-ID: <cover.1726571179.git.ritesh.list@gmail.com>
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

This patch series addresses following to improve kfence support on Powerpc.

1. Usage of copy_from_kernel_nofault() within kernel, such as read from
   /proc/kcore can cause kfence to report false negatives.

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
rather than 16MB mapping.


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


