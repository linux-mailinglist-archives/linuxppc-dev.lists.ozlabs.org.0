Return-Path: <linuxppc-dev+bounces-263-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CECE9597C3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2024 12:40:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WpjXK4VXJz2yFJ;
	Wed, 21 Aug 2024 20:40:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62c"
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=BCApotG8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WpfPy2rH2z2y1l
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2024 18:19:32 +1000 (AEST)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2020b730049so38800725ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2024 01:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1724228366; x=1724833166; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PN5+in6xnBXgxe2LIsQDc93ppSQBPQmBv4bxyw8DmlQ=;
        b=BCApotG8psRkXwTBJHrwf0jkh5aZRoAlqW/bnP+bnlvE8VpAK6ibCseqf2Pw17YJuy
         o4HaJJlrdlDmY5JG705fVxRbIaQFaydEyovW0k8uqSOgyFX4nRKzw19o6aAL1Ze9hdgz
         LGkNQvTG6GOw/nw9W3CQT4iX3K8AyRYpPFIT+fQeQFEHQ375KT1cY24liOi2nZadQg4u
         Bf2JjVQPwu93BkRquRCXc85LpihbQLTDdg/36eWppWbhvXeyymNyTgDhUoRvdOeFBzay
         iUAOw16lD970Y+T+o9KmIzzRX4tOlxk8UQ5V7KTzPGJjR6OwelkLj/b/U5w0QW1ue0+M
         Sulg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724228366; x=1724833166;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PN5+in6xnBXgxe2LIsQDc93ppSQBPQmBv4bxyw8DmlQ=;
        b=lEKwJaKDl+1OVPavezbq73sVNADmNxVgwAmblEzz8C2qOWZvgWjVTM2upXVaxOnUWb
         0KuGRI+n/n6/g1JO0n9bX9yUUiQsNFm7uRLb/r1uSu3eab1XwUoafb00Xq3BUPrEQy0G
         GIgqpJg9gOdxvJfRLkXnGz0DjjOV5N5b7a9tuEIgddHEzpUaDyJHrJQS4JvrPiLtECog
         cuS/QwNTGYFPwoxFXq4YWerhaxcOIk46bOMXhMDgOOIyFmqJRWUIpNSDtSYvR3zWwAht
         fhIOr98xjE1T3sji9DQc66rUGfjXCm0QhHrdol6EophC4hof55LcHx16zM/sJd3LkI4F
         1HzA==
X-Forwarded-Encrypted: i=1; AJvYcCWTkLLzRzNU1cBi7CQei1Cri3D96rc/CwQi/eoiFu/GeO21ogx+pxP5LREI8yF69b8FX6btFdxDeOZ5qZc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwTcHAew8R/3DubAv9DH6butD33I3DvQh1Kt9IC58zW9cG3ks4E
	ZrdPjywVjpZVL57kWCBVXQ+zCP6ViFvEFRLVsWgr42tVjnxZVeihJ1mLaGbQg7A=
X-Google-Smtp-Source: AGHT+IHHUoYOI/2K4+IHeJgFEXGAQNHZYM2BB7ldoGeWEQ/b7YbP3WstRyHOcikTGkk/QMWJJeDGRQ==
X-Received: by 2002:a17:90a:c381:b0:2c9:69cc:3a6f with SMTP id 98e67ed59e1d1-2d5e9dcab76mr1637566a91.31.1724228366127;
        Wed, 21 Aug 2024 01:19:26 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d5eb9049b0sm1091453a91.17.2024.08.21.01.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 01:19:25 -0700 (PDT)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: david@redhat.com,
	hughd@google.com,
	willy@infradead.org,
	muchun.song@linux.dev,
	vbabka@kernel.org,
	akpm@linux-foundation.org,
	rppt@kernel.org,
	vishal.moola@gmail.com,
	peterx@redhat.com,
	ryan.roberts@arm.com
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH 00/14] introduce pte_offset_map_{readonly|maywrite}_nolock()
Date: Wed, 21 Aug 2024 16:18:43 +0800
Message-Id: <cover.1724226076.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
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

Hi all,

As proposed by David Hildenbrand [1], this series introduces the following two
new helper functions to replace pte_offset_map_nolock().

1. pte_offset_map_readonly_nolock()
2. pte_offset_map_maywrite_nolock()

As the name suggests, pte_offset_map_readonly_nolock() is used for read-only
case. In this case, only read-only operations will be performed on PTE page
after the PTL is held. The RCU lock in pte_offset_map_nolock() will ensure that
the PTE page will not be freed, and there is no need to worry about whether the
pmd entry is modified. Therefore pte_offset_map_readonly_nolock() is just a
renamed version of pte_offset_map_nolock().

pte_offset_map_maywrite_nolock() is used for may-write case. In this case, the
pte or pmd entry may be modified after the PTL is held, so we need to ensure
that the pmd entry has not been modified concurrently. So in addition to the
name change, it also outputs the pmdval when successful. This can help the
caller recheck *pmd once the PTL is taken. In some cases we can pass NULL to
pmdvalp: either the mmap_lock for write, or pte_same() check on contents, is
also enough to ensure that the pmd entry is stable.

This series will convert all pte_offset_map_nolock() into the above two helper
functions one by one, and finally completely delete it.

This also a preparation for reclaiming the empty user PTE page table pages.

This series is based on the next-20240820.

Comments and suggestions are welcome!

Thanks,
Qi

[1]. https://lore.kernel.org/lkml/f79bbfc9-bb4c-4da4-9902-2e73817dd135@redhat.com/

Qi Zheng (14):
  mm: pgtable: introduce pte_offset_map_{readonly|maywrite}_nolock()
  arm: adjust_pte() use pte_offset_map_maywrite_nolock()
  powerpc: assert_pte_locked() use pte_offset_map_readonly_nolock()
  mm: filemap: filemap_fault_recheck_pte_none() use
    pte_offset_map_readonly_nolock()
  mm: khugepaged: __collapse_huge_page_swapin() use
    pte_offset_map_readonly_nolock()
  mm: handle_pte_fault() use pte_offset_map_maywrite_nolock()
  mm: khugepaged: collapse_pte_mapped_thp() use
    pte_offset_map_maywrite_nolock()
  mm: copy_pte_range() use pte_offset_map_maywrite_nolock()
  mm: mremap: move_ptes() use pte_offset_map_maywrite_nolock()
  mm: page_vma_mapped_walk: map_pte() use
    pte_offset_map_maywrite_nolock()
  mm: userfaultfd: move_pages_pte() use pte_offset_map_maywrite_nolock()
  mm: multi-gen LRU: walk_pte_range() use
    pte_offset_map_maywrite_nolock()
  mm: pgtable: remove pte_offset_map_nolock()
  mm: khugepaged: retract_page_tables() use
    pte_offset_map_maywrite_nolock()

 Documentation/mm/split_page_table_lock.rst |  6 +++-
 arch/arm/mm/fault-armv.c                   |  9 ++++-
 arch/powerpc/mm/pgtable.c                  |  2 +-
 include/linux/mm.h                         |  7 ++--
 mm/filemap.c                               |  4 +--
 mm/khugepaged.c                            | 39 ++++++++++++++++++--
 mm/memory.c                                | 13 +++++--
 mm/mremap.c                                |  7 +++-
 mm/page_vma_mapped.c                       | 24 ++++++++++---
 mm/pgtable-generic.c                       | 42 ++++++++++++++++------
 mm/userfaultfd.c                           | 12 +++++--
 mm/vmscan.c                                |  9 ++++-
 12 files changed, 143 insertions(+), 31 deletions(-)

-- 
2.20.1


