Return-Path: <linuxppc-dev+bounces-304-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E21CB95AE82
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 09:14:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqDvn1NKtz2yVD;
	Thu, 22 Aug 2024 17:13:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::334"
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=AgPVJ4dr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::334; helo=mail-ot1-x334.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqDvl5yTvz2xDM
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2024 17:13:53 +1000 (AEST)
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-70941cb73e9so244050a34.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2024 00:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1724310829; x=1724915629; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CFMLU37SF14i0z7/xzd4z7SOLQqMigYLuSMvL0jdhU0=;
        b=AgPVJ4dr+DIoXsS9MweVu9c7PkL1m7xStp/BS3MyaGehuf40ogTinGsbtoxKfDZsEM
         TWDthG+NIdIfU3CQxTEJF+GhOL81Hc+PqHmQ8Md/o9v1av/1Nc1llaLU/ySOrJ9RtY85
         /fcqL6Xut9KMY9+fyqQrEX0gc0Z9cyOeZe9tcluNExjqGa49weMQAaidaK6vreV9qwKA
         lNqIs7MS4GdidSddUVJnBL8oml/Uw5k/2VWxpeCc4NT8Ko+tC7XlamDrG7jVgXRQ5fo5
         UrHzITVI+7erJyXCNLGoGZS5n+2iII1+bS8wFilQW7NMjS+Ooyy6W3M2lvBalcIbymI9
         vzSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724310829; x=1724915629;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CFMLU37SF14i0z7/xzd4z7SOLQqMigYLuSMvL0jdhU0=;
        b=kROMR/PIiwonDQKazje4nB+RrDvRuLF6zJIMp7p5j8nS46Yz8fr+whEz1FWLM095gM
         K8gW24tYsY43xbqs1+A64QpVLKr/Uwlk7gnOHrp++1HyMkJK1NKYUSbul9RyvLhOnDXE
         TO0dAUumaMCFKUaqoMuMsoOjcFVzr4U9vVxNPJtc0WSjhJP8IFSJ5d50hslivAqaHjNb
         L7bx7X7VBFEuEi/+DjIFV8wHUkfqtRkP6mXWKldgvxC+k/YEi9cc034BBnWBl4joeF4n
         okfsHiIqaZdcjCbpfln784sW59zmXFeNxlMNiQ4q+aokbgM0d30B9ajP+fB2oa1ruBKi
         RFYg==
X-Forwarded-Encrypted: i=1; AJvYcCVXtG/l25z21SOF34Bdg/o2gMaKdqx/TXVX6EPm/6VmsAMtNCKZ/pqmBB5yvxh7XVhS8GxpN3zuD+rCwQc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxt6PrzL7Tda/UPe1asAcVdfCe9uijsKqFSIKkoq6EKCPxAAFwQ
	k1OXUMbjMVI0dnK/h/+N/tniKm64/jxEZWlJQYLLhvjv941y6QXODRKRJXebJfs=
X-Google-Smtp-Source: AGHT+IHFVt0p20Eao8jGQp/M4A8gGxgTtYUk7Hnj/FFBLeb56GgWurcM0rgpuj3RCCjsswwc/siqyg==
X-Received: by 2002:a05:6830:4386:b0:702:5a0:2f82 with SMTP id 46e09a7af769-70e043561e4mr1361943a34.0.1724310828958;
        Thu, 22 Aug 2024 00:13:48 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([240e:473:c90:f96:d029:ea8a:4e6d:d272])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7cd9ac994a3sm695095a12.16.2024.08.22.00.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 00:13:48 -0700 (PDT)
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
	ryan.roberts@arm.com,
	christophe.leroy2@cs-soprasteria.com
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v2 00/14] introduce pte_offset_map_{ro|rw}_nolock()
Date: Thu, 22 Aug 2024 15:13:15 +0800
Message-Id: <cover.1724310149.git.zhengqi.arch@bytedance.com>
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

Changes in v2:
 - rename pte_offset_map_{readonly|maywrite}_nolock() to
   pte_offset_map_{ro|rw}_nolock() (LEROY Christophe)
 - make pte_offset_map_rw_nolock() not accept NULL parameters
   (David Hildenbrand)
 - rebase onto the next-20240822

Hi all,

As proposed by David Hildenbrand [1], this series introduces the following two
new helper functions to replace pte_offset_map_nolock().

1. pte_offset_map_ro_nolock()
2. pte_offset_map_rw_nolock()

As the name suggests, pte_offset_map_ro_nolock() is used for read-only
case. In this case, only read-only operations will be performed on PTE page
after the PTL is held. The RCU lock in pte_offset_map_nolock() will ensure that
the PTE page will not be freed, and there is no need to worry about whether the
pmd entry is modified. Therefore pte_offset_map_ro_nolock() is just a renamed
version of pte_offset_map_nolock().

pte_offset_map_rw_nolock() is used for may-write case. In this case, the pte or
pmd entry may be modified after the PTL is held, so we need to ensure that the
pmd entry has not been modified concurrently. So in addition to the name change,
it also outputs the pmdval when successful. This can help the caller recheck
*pmd once the PTL is taken. In some cases, that is, either the mmap_lock for
write, or pte_same() check on contents, is also enough to ensure that the pmd
entry is stable. But in order to prevent the interface from being abused, we
choose to pass in a dummy local variable instead of NULL.

This series will convert all pte_offset_map_nolock() into the above two helper
functions one by one, and finally completely delete it.

This also a preparation for reclaiming the empty user PTE page table pages.

This series is based on the next-20240822.

Comments and suggestions are welcome!

Thanks,
Qi

[1]. https://lore.kernel.org/lkml/f79bbfc9-bb4c-4da4-9902-2e73817dd135@redhat.com/

Qi Zheng (14):
  mm: pgtable: introduce pte_offset_map_{ro|rw}_nolock()
  arm: adjust_pte() use pte_offset_map_rw_nolock()
  powerpc: assert_pte_locked() use pte_offset_map_ro_nolock()
  mm: filemap: filemap_fault_recheck_pte_none() use
    pte_offset_map_ro_nolock()
  mm: khugepaged: __collapse_huge_page_swapin() use
    pte_offset_map_ro_nolock()
  mm: handle_pte_fault() use pte_offset_map_rw_nolock()
  mm: khugepaged: collapse_pte_mapped_thp() use
    pte_offset_map_rw_nolock()
  mm: copy_pte_range() use pte_offset_map_rw_nolock()
  mm: mremap: move_ptes() use pte_offset_map_rw_nolock()
  mm: page_vma_mapped_walk: map_pte() use pte_offset_map_rw_nolock()
  mm: userfaultfd: move_pages_pte() use pte_offset_map_rw_nolock()
  mm: multi-gen LRU: walk_pte_range() use pte_offset_map_rw_nolock()
  mm: pgtable: remove pte_offset_map_nolock()
  mm: khugepaged: retract_page_tables() use pte_offset_map_rw_nolock()

 Documentation/mm/split_page_table_lock.rst |  6 +++-
 arch/arm/mm/fault-armv.c                   |  9 ++++-
 arch/powerpc/mm/pgtable.c                  |  2 +-
 include/linux/mm.h                         |  7 ++--
 mm/filemap.c                               |  4 +--
 mm/khugepaged.c                            | 39 ++++++++++++++++++--
 mm/memory.c                                | 23 ++++++++++--
 mm/mremap.c                                |  9 ++++-
 mm/page_vma_mapped.c                       | 24 ++++++++++---
 mm/pgtable-generic.c                       | 42 ++++++++++++++++------
 mm/userfaultfd.c                           | 15 ++++++--
 mm/vmscan.c                                |  9 ++++-
 12 files changed, 157 insertions(+), 32 deletions(-)

-- 
2.20.1


