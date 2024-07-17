Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5392934477
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2024 00:03:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EgSkOyaB;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EgSkOyaB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WPVLK1cf3z30WB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2024 08:03:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EgSkOyaB;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EgSkOyaB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WPVKd73kLz30TZ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jul 2024 08:02:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721253745;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=22URfq8NjvGndByOojJP9eQog6fnp2xGbHVHJb+hEIw=;
	b=EgSkOyaB0HYk8milPyHE91AR+2v1WPhVC21Di1iDaycfSeO31hL1v9sZL81dw304imF2rn
	dST2F6jZvKWE3/3bF4Ywc4m5iBQTYfPXPUyFQykAzeqom6tBJRCgTdbN/yOuuXTwqRdo6a
	fxTMhqPQ+NwcvYekcRwYYEfLxZJNkq4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721253745;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=22URfq8NjvGndByOojJP9eQog6fnp2xGbHVHJb+hEIw=;
	b=EgSkOyaB0HYk8milPyHE91AR+2v1WPhVC21Di1iDaycfSeO31hL1v9sZL81dw304imF2rn
	dST2F6jZvKWE3/3bF4Ywc4m5iBQTYfPXPUyFQykAzeqom6tBJRCgTdbN/yOuuXTwqRdo6a
	fxTMhqPQ+NwcvYekcRwYYEfLxZJNkq4=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-314-GCJ8jOurP-WcG47A0DO5Nw-1; Wed, 17 Jul 2024 18:02:23 -0400
X-MC-Unique: GCJ8jOurP-WcG47A0DO5Nw-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6b79fbc7ed2so45716d6.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Jul 2024 15:02:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721253743; x=1721858543;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=22URfq8NjvGndByOojJP9eQog6fnp2xGbHVHJb+hEIw=;
        b=ED/q03blZhv9tOFu4ivg1PwJjp0VmMBzrs4urtqP9tocHS3ZihqyuYQaikQRoTsV8Z
         sxJaTXvmaK6vd0KAZ3rW0cPqOpj8eGyeTvPIetPeBrarZ71pVgXj5N4yAumJ6xDxN5fs
         yBOklqmbwm7FGssbTLSBkStAuEo15gFxDxYWaBLRUOR5DpYq7pTfHE1qZzrxxzYVyQyM
         KBC7CzVnIgV8aQf8zTZxnY9YufW250QNT7psLNZVB7x5Z6us3FWwI5SiJoTWQLhU6yWS
         LbqFg4OV1jXwh/PiU8OwGnOG2z23hG5oih/XNEIs2OJUy7a65mEndHioBOm6QyY0Pe3y
         IlNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpNBMZX2qScZtsZ3ncUx3ALT4rUjWzKVV6v8SpRmdDDKsScY3HGdVt/kNC3jwYyKc7yGSSn0aQEzqQJK0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxohiOSttL0CdYLaOoDyskxzMtjB2wz5GP7uaMtLuQoiynjjqyd
	ANVwsLB2TcxQ36u2z9e0TLffoIXlsqr06YN2o5i8iQOOqJ9b4vObtqBo8Q76YAUCzAGS0Nunaxp
	157vxzH0eDujSafEkg5SPYjxaJciJIrD+ystArg7NBOagOD1A5cF0WHQPfXjoJQs=
X-Received: by 2002:ac8:5e4e:0:b0:44f:89e3:e8d2 with SMTP id d75a77b69052e-44f89e3ec09mr15923601cf.12.1721253742711;
        Wed, 17 Jul 2024 15:02:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH030U/0PuH20CJyPZJMzLVzXnymjVCbugSgXnKR5JUMtRiVtVl+1d1cBUhmI+Iq8e7T2bLTA==
X-Received: by 2002:ac8:5e4e:0:b0:44f:89e3:e8d2 with SMTP id d75a77b69052e-44f89e3ec09mr15923181cf.12.1721253742192;
        Wed, 17 Jul 2024 15:02:22 -0700 (PDT)
Received: from x1n.redhat.com (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-44f5b83f632sm53071651cf.85.2024.07.17.15.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 15:02:21 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH RFC 0/6] mm: THP-agnostic refactor on huge mappings
Date: Wed, 17 Jul 2024 18:02:13 -0400
Message-ID: <20240717220219.3743374-1-peterx@redhat.com>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
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
Cc: linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org, Alistair Popple <apopple@nvidia.com>, Ryan Roberts <ryan.roberts@arm.com>, David Hildenbrand <david@redhat.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, peterx@redhat.com, Michal Hocko <mhocko@kernel.org>, Alex Williamson <alex.williamson@redhat.com>, linux-riscv@lists.infradead.org, Matthew Wilcox <willy@infradead.org>, Jason Gunthorpe <jgg@nvidia.com>, sparclinux@vger.kernel.org, Axel Rasmussen <axelrasmussen@google.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Dan Williams <dan.j.williams@intel.com>, Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is an RFC series, so not yet for merging.  Please don't be scared by
the code changes: most of them are code movements only.

This series is based on the dax mprotect fix series here (while that one is
based on mm-unstable):

  [PATCH v3 0/8] mm/mprotect: Fix dax puds
  https://lore.kernel.org/r/20240715192142.3241557-1-peterx@redhat.com

Overview
========

This series doesn't provide any feature change.  The only goal of this
series is to start decoupling two ideas: "THP" and "huge mapping".  We
already started with having PGTABLE_HAS_HUGE_LEAVES config option, and this
one extends that idea into the code.

The issue is that we have so many functions that only compile with
CONFIG_THP=on, even though they're about huge mappings, and huge mapping is
a pretty common concept, which can apply to many things besides THPs
nowadays.  The major THP file is mm/huge_memory.c as of now.

The first example of such huge mapping users will be hugetlb.  We lived
until now with no problem simply because Linux almost duplicated all the
logics there in the "THP" files into hugetlb APIs.  If we want to get rid
of hugetlb specific APIs and paths, this _might_ be the first thing we want
to do, because we want to be able to e.g., zapping a hugetlb pmd entry even
if !CONFIG_THP.

Then consider other things like dax / pfnmaps.  Dax can depend on THP, then
it'll naturally be able to use pmd/pud helpers, that's okay.  However is it
a must?  Do we also want to have every new pmd/pud mappings in the future
to depend on THP (like PFNMAP)?  My answer is no, but I'm open to opinions.

If anyone agrees with me that "huge mapping" (aka, PMD/PUD mappings that
are larger than PAGE_SIZE) is a more generic concept than THP, then I think
at some point we need to move the generic code out of THP code into a
common code base.

This is what this series does as a start.

In general, this series tries to move many THP things (mostly resides in
huge_memory.c right now) into two new files: huge_mapping_{pmd|pud}.c.
When I move them out, I also put them separately into different files for
different layers.  Then if an arch supports e.g. only PMD, it can avoid
compile the PUD helpers, with things like:

        CONFIG_PGTABLE_HAS_PUD_LEAVES=n
        obj-$(CONFIG_PGTABLE_HAS_PUD_LEAVES) += huge_mapping_pud.o

Note that there're a few tree-wide changes into arch/, but that's not a
lot, to make this not disturbing too much people, I only copied the open
lists of each arch not yet the arch maintainers.

Tests
=====

My normal 19-archs cross-compilation tests pass with it, and smoke tested
on x86_64 with a local config of mine.

Comments welcomed, thanks.

Peter Xu (6):
  mm/treewide: Remove pgd_devmap()
  mm: PGTABLE_HAS_P[MU]D_LEAVES config options
  mm/treewide: Make pgtable-generic.c THP agnostic
  mm: Move huge mapping declarations from internal.h to huge_mm.h
  mm/huge_mapping: Create huge_mapping_pxx.c
  mm: Convert "*_trans_huge() || *_devmap()" to use *_leaf()

 arch/arm64/include/asm/pgtable.h             |   11 +-
 arch/powerpc/include/asm/book3s/64/pgtable.h |    7 +-
 arch/powerpc/mm/book3s64/pgtable.c           |    2 +-
 arch/riscv/include/asm/pgtable.h             |    4 +-
 arch/s390/include/asm/pgtable.h              |    2 +-
 arch/s390/mm/pgtable.c                       |    4 +-
 arch/sparc/mm/tlb.c                          |    2 +-
 arch/x86/include/asm/pgtable.h               |    5 -
 arch/x86/mm/pgtable.c                        |   15 +-
 include/linux/huge_mm.h                      |  332 ++++--
 include/linux/mm.h                           |   18 +
 include/linux/mm_types.h                     |    2 +-
 include/linux/pgtable.h                      |   61 +-
 include/trace/events/huge_mapping.h          |   41 +
 include/trace/events/thp.h                   |   28 -
 mm/Kconfig                                   |    6 +
 mm/Makefile                                  |    2 +
 mm/gup.c                                     |    2 -
 mm/hmm.c                                     |    4 +-
 mm/huge_mapping_pmd.c                        |  976 +++++++++++++++
 mm/huge_mapping_pud.c                        |  235 ++++
 mm/huge_memory.c                             | 1125 +-----------------
 mm/internal.h                                |   33 -
 mm/mapping_dirty_helpers.c                   |    4 +-
 mm/memory.c                                  |   16 +-
 mm/migrate_device.c                          |    2 +-
 mm/mprotect.c                                |    4 +-
 mm/mremap.c                                  |    5 +-
 mm/page_vma_mapped.c                         |    5 +-
 mm/pgtable-generic.c                         |   37 +-
 30 files changed, 1595 insertions(+), 1395 deletions(-)
 create mode 100644 include/trace/events/huge_mapping.h
 create mode 100644 mm/huge_mapping_pmd.c
 create mode 100644 mm/huge_mapping_pud.c

-- 
2.45.0

