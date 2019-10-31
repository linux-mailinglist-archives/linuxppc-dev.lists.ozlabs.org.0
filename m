Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DEBCEACAF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2019 10:42:14 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 473gMl54W2zF4KK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2019 20:42:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="Z8ihK2yz"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 473gJR64JpzF5dg
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Oct 2019 20:39:19 +1100 (AEDT)
Received: by mail-pf1-x443.google.com with SMTP id q26so3965303pfn.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Oct 2019 02:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tw/W6NbXnb4qm98VeXSbJQHRtU1hT68y9JEMgvYPvkw=;
 b=Z8ihK2yzb4t0N40oPVBY2YeLprWCSZ+dp9BgkobXgdCSwQHyktcKzY5AC10wQT0wJs
 CM5zdQpl7ryOLOmeUjQOc6eb4PDXsEeNG+eVFluhkE3xXVcWxNQgN+QADU1N5AJBSbqP
 fjQM2U7OJA/+JCEZ6vFK9dfz29wPwKLs59WfA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tw/W6NbXnb4qm98VeXSbJQHRtU1hT68y9JEMgvYPvkw=;
 b=rx05t7UJt/ktcY+O+sdXv/ZbkV4sWmVGlOxQ4+2uxxnFqGAEUkvH2wqAYY1kYzsFMJ
 U66DoUYt/SJ76M/N3ZKw3wlsVEWpGJ+Sgxrs8xRsDtc+vlVova1sG7ISjpoSd5mB/q9p
 K6rqBhr29H4mSv0LqirRi2zZoh/zrIkcO8kydnwhSVhqDFTpszlKbgwxlro7TO3SoznJ
 hf9qtwJF0tU5Mpe8TxWPw1uBrhOhIwwD8coojL0f3BopctEC1hfWeLhLHg4Wl+aQaDSo
 fl1ozXm9lzm7peSfG4pGwt6rlvImw64ZWACe1d+m6B73VlHGtZe1Wpjsjvju0vFrJapH
 vcwA==
X-Gm-Message-State: APjAAAWE5CywTmSugYxSwDrYycLMvs7R6q2cGURAqYIODyya7Adz/tiM
 2HURh3YFYynIzNpfcusuA+L0xw==
X-Google-Smtp-Source: APXvYqyDn4TdsCZV2aZgVm6KyZHNNNAePgy+2Pk7lNaxWkqtto+SU2QfMIWroH4GAfNVD0kAkwkLNQ==
X-Received: by 2002:a63:4b06:: with SMTP id y6mr5232911pga.409.1572514756048; 
 Thu, 31 Oct 2019 02:39:16 -0700 (PDT)
Received: from localhost
 (2001-44b8-1113-6700-783a-2bb9-f7cb-7c3c.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:783a:2bb9:f7cb:7c3c])
 by smtp.gmail.com with ESMTPSA id a18sm742715pff.95.2019.10.31.02.39.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2019 02:39:15 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: kasan-dev@googlegroups.com, linux-mm@kvack.org, x86@kernel.org,
 aryabinin@virtuozzo.com, glider@google.com, luto@kernel.org,
 linux-kernel@vger.kernel.org, mark.rutland@arm.com, dvyukov@google.com,
 christophe.leroy@c-s.fr
Subject: [PATCH v11 0/4] kasan: support backing vmalloc space with real shadow
 memory
Date: Thu, 31 Oct 2019 20:39:05 +1100
Message-Id: <20191031093909.9228-1-dja@axtens.net>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linuxppc-dev@lists.ozlabs.org, gor@linux.ibm.com,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently, vmalloc space is backed by the early shadow page. This
means that kasan is incompatible with VMAP_STACK.

This series provides a mechanism to back vmalloc space with real,
dynamically allocated memory. I have only wired up x86, because that's
the only currently supported arch I can work with easily, but it's
very easy to wire up other architectures, and it appears that there is
some work-in-progress code to do this on arm64 and s390.

This has been discussed before in the context of VMAP_STACK:
 - https://bugzilla.kernel.org/show_bug.cgi?id=202009
 - https://lkml.org/lkml/2018/7/22/198
 - https://lkml.org/lkml/2019/7/19/822

In terms of implementation details:

Most mappings in vmalloc space are small, requiring less than a full
page of shadow space. Allocating a full shadow page per mapping would
therefore be wasteful. Furthermore, to ensure that different mappings
use different shadow pages, mappings would have to be aligned to
KASAN_SHADOW_SCALE_SIZE * PAGE_SIZE.

Instead, share backing space across multiple mappings. Allocate a
backing page when a mapping in vmalloc space uses a particular page of
the shadow region. This page can be shared by other vmalloc mappings
later on.

We hook in to the vmap infrastructure to lazily clean up unused shadow
memory.

Testing with test_vmalloc.sh on an x86 VM with 2 vCPUs shows that:

 - Turning on KASAN, inline instrumentation, without vmalloc, introuduces
   a 4.1x-4.2x slowdown in vmalloc operations.

 - Turning this on introduces the following slowdowns over KASAN:
     * ~1.76x slower single-threaded (test_vmalloc.sh performance)
     * ~2.18x slower when both cpus are performing operations
       simultaneously (test_vmalloc.sh sequential_test_order=1)

This is unfortunate but given that this is a debug feature only, not
the end of the world. The benchmarks are also a stress-test for the
vmalloc subsystem: they're not indicative of an overall 2x slowdown!


v1: https://lore.kernel.org/linux-mm/20190725055503.19507-1-dja@axtens.net/
v2: https://lore.kernel.org/linux-mm/20190729142108.23343-1-dja@axtens.net/
 Address review comments:
 - Patch 1: use kasan_unpoison_shadow's built-in handling of
            ranges that do not align to a full shadow byte
 - Patch 3: prepopulate pgds rather than faulting things in
v3: https://lore.kernel.org/linux-mm/20190731071550.31814-1-dja@axtens.net/
 Address comments from Mark Rutland:
 - kasan_populate_vmalloc is a better name
 - handle concurrency correctly
 - various nits and cleanups
 - relax module alignment in KASAN_VMALLOC case
v4: https://lore.kernel.org/linux-mm/20190815001636.12235-1-dja@axtens.net/
 Changes to patch 1 only:
 - Integrate Mark's rework, thanks Mark!
 - handle the case where kasan_populate_shadow might fail
 - poision shadow on free, allowing the alloc path to just
     unpoision memory that it uses
v5: https://lore.kernel.org/linux-mm/20190830003821.10737-1-dja@axtens.net/
 Address comments from Christophe Leroy:
 - Fix some issues with my descriptions in commit messages and docs
 - Dynamically free unused shadow pages by hooking into the vmap book-keeping
 - Split out the test into a separate patch
 - Optional patch to track the number of pages allocated
 - minor checkpatch cleanups
v6: https://lore.kernel.org/linux-mm/20190902112028.23773-1-dja@axtens.net/
 Properly guard freeing pages in patch 1, drop debugging code.
v7: https://lore.kernel.org/linux-mm/20190903145536.3390-1-dja@axtens.net/
    Add a TLB flush on freeing, thanks Mark Rutland.
    Explain more clearly how I think freeing is concurrency-safe.
v8: https://lore.kernel.org/linux-mm/20191001065834.8880-1-dja@axtens.net/
    rename kasan_vmalloc/shadow_pages to kasan/vmalloc_shadow_pages
v9: https://lore.kernel.org/linux-mm/20191017012506.28503-1-dja@axtens.net/
    (attempt to) address a number of review comments for patch 1.
v10: https://lore.kernel.org/linux-mm/20191029042059.28541-1-dja@axtens.net/
     - rebase on linux-next, pulling in Vlad's new work on splitting the
       vmalloc locks.
     - after much discussion of barriers, document where I think they
       are needed and why. Thanks Mark and Andrey.
     - clean up some TLB flushing and checkpatch bits
v11: Address review comments from Andrey and Vlad, drop patch 5, add benchmarking
     results.

Daniel Axtens (4):
  kasan: support backing vmalloc space with real shadow memory
  kasan: add test for vmalloc
  fork: support VMAP_STACK with KASAN_VMALLOC
  x86/kasan: support KASAN_VMALLOC

 Documentation/dev-tools/kasan.rst |  63 ++++++++
 arch/Kconfig                      |   9 +-
 arch/x86/Kconfig                  |   1 +
 arch/x86/mm/kasan_init_64.c       |  61 ++++++++
 include/linux/kasan.h             |  31 ++++
 include/linux/moduleloader.h      |   2 +-
 include/linux/vmalloc.h           |  12 ++
 kernel/fork.c                     |   4 +
 lib/Kconfig.kasan                 |  16 +++
 lib/test_kasan.c                  |  26 ++++
 mm/kasan/common.c                 | 231 ++++++++++++++++++++++++++++++
 mm/kasan/generic_report.c         |   3 +
 mm/kasan/kasan.h                  |   1 +
 mm/vmalloc.c                      |  53 +++++--
 14 files changed, 500 insertions(+), 13 deletions(-)

-- 
2.20.1

