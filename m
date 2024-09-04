Return-Path: <linuxppc-dev+bounces-954-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3FEA96B50A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2024 10:40:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WzGD23QH4z2yFJ;
	Wed,  4 Sep 2024 18:40:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::434"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725439250;
	cv=none; b=XedcLp7y7+797o1Lg7AhFmYpwzMjGco8XhhUaD004BKpK8WrwzOQsImJFy2GJa5E9seR1LZjYtYca4jKgMli+kio+CplQM/RKPncNHi9Dnlf5rdpy6PMCdJLgBgMiFcF8LvIHR9deAyJzxyD0l/WGvhymHdN9AwTFmgK9hW9/NXx7NE/E/8s/TTxuAKeZhlR1DuBBZBWxd89J+UcFvBH4POApTJbJfyrXNrXL3pQdWdG+FwB4x9OoZDdOVS2lRtah+h/9MX+nmEKKMuwl4dDbb3mZ5JK5TQ6EZHdejWs/wpGOX3NiAgkfNuXCU6HskAhyN0QtKzqVn0esPOcpc6j3w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725439250; c=relaxed/relaxed;
	bh=PnxZ3keyEwgQ9RkNvwyvGwt3DYekuRW0HVUJKFS+J3s=;
	h=DKIM-Signature:From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=jWVt6KaSZar6NZ1OblnGE7ymhKht2gU9Zr2TA8ROEMWtr/Vmirplj94WmNxXhYh3m06cxbjGcwORZ6OjGTfbFbs6Kk1vZw1hYvXHF8wfF4Cjp9l28gwl5jFyIzmbZH/j7U6YtUkb0xA78JR/z8eHqgwUt0ZGLv05MT5Gy+sFNxeEJBQqlYpPY1twN6V8I3lbQymS2CaKm8F9PD8HYD0MCewwHgp62ijcKwsXh7HhRipEIOoVyo9hMiAPx8AUvb+01U4GmMN31sMp2gMmbVtCZDWGIfKUf2wYlvGUELRSbwmyMqx9Qrc2lzyQQm/qgjBB/bSkF+7NcxDAHVGqR4VAZw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=WWYW9sfq; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=WWYW9sfq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WzGD12bppz2yDx
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2024 18:40:47 +1000 (AEST)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-7141feed424so4954602b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Sep 2024 01:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1725439243; x=1726044043; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PnxZ3keyEwgQ9RkNvwyvGwt3DYekuRW0HVUJKFS+J3s=;
        b=WWYW9sfq1hdz4OVZZFQ3hm1qlr0kFsJupcMpq27iS7yFjjHiOkYMXZanqqPfbOX41N
         KElCttkJ5NEEgMXUTNX9dECxza++hKUjA83gGytda/+9Ku/Ew04LCappKW84OoIYTQMC
         ZU1esYoVdUQOaRLOnBOb7alpCM0EC4v9FgQFJ0kONLTPqVESleQemS2jQC1zGzM5q4Mz
         Mdhy7bb1eeI5973bmiBWW2rjZhATo2pRtaKoR+EcWFCfLxp1tJnz6DdvTCyD3cGQVCyZ
         vVp1e2QIxja1UA2CnE6fgcEDDMjzl3muu6G6VgpsgZzs3YKVjCVmSBOVFECaf65ti0Zs
         v2mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725439243; x=1726044043;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PnxZ3keyEwgQ9RkNvwyvGwt3DYekuRW0HVUJKFS+J3s=;
        b=oMdfhbru9RlHNUDnB/4R31XjL4NkmtwVHHpZAl6LtQEioFyS4BpeyFX51w7YyLDJRI
         6qkEAZsMAdZewIXFzFE9mJn1FsqbkNkL8zTbdRXHDpXyV0zc3l7/XgYKbDQpJSdyht5J
         o//iFDYW7sN1mAPOeZrRSZENtGlhBhzwLxlRBgqscCclQGyXaaHyqhVtaOrvdJJ/9AAM
         9j4Fxtj3fzJF5LP/gcZM2SXnjE++9/jjYNQcmKh17tvlWqbyLC7qtHI98+pquRYP/qI/
         U9ssZ2k3O/+Mz23Kk1qt6sS056L2c63z5r1EKB3ZR8IweXGB2E4oa2FyoboaFtcTkTyH
         JNjg==
X-Forwarded-Encrypted: i=1; AJvYcCW5FD017KmaAjHYWVD9lW2ykc1Ro3lXotWkpqQq1RMvK+iSSXL1vMQ+femXpAiu3L78mNJcnsaWCC36jOQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzlcwEAXO5eU8XR9O7FQsIR2Zw6geVRem3BWW0+dBA1PKS6XM3J
	OIDrdPbDzvNGGyfDxgbLMcg1xCltsiNbwcPCL8K+2q/CAaOwm95+3LSxAQIgIT4=
X-Google-Smtp-Source: AGHT+IG+iEKF7FtSjHKinQSwDvpK7gnjP4wMOie8wNTxXeNBeSlHHCqUvqbL69VXmYEDlh1n7ZOmCw==
X-Received: by 2002:a05:6a20:d503:b0:1c0:f2d9:a452 with SMTP id adf61e73a8af0-1cece4fdcacmr13163272637.13.1725439243372;
        Wed, 04 Sep 2024 01:40:43 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([139.177.225.242])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206ae95a51csm9414045ad.117.2024.09.04.01.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 01:40:42 -0700 (PDT)
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
Subject: [PATCH v3 00/14] introduce pte_offset_map_{ro|rw}_nolock()
Date: Wed,  4 Sep 2024 16:40:08 +0800
Message-Id: <20240904084022.32728-1-zhengqi.arch@bytedance.com>
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

Changes in v3:
 - change to use VM_WARN_ON_ONCE() instead of BUG_ON() in pte_offset_map_rw_nolock()
   (David Hildenbrand)
 - modify the comment above the pte_offset_map_lock() in [PATCH v2 01/14]
   (David Hildenbrand and Muchun Song)
 - modify the comment above the pte_offset_map_rw_nolock() in [PATCH v2 06/14]
   (David Hildenbrand and Muchun Song)
 - also perform a pmd_same() check in [PATCH v2 08/14] and [PATCH v2 09/14]
   (since we may free the PTE page in retract_page_tables() without holding the
    read lock of mmap_lock)
 - collect the Acked-bys and Reviewed-bys
 - rebase onto the next-20240904

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
it also outputs the pmdval when successful. The users should make sure the page
table is stable like checking pte_same() or checking pmd_same() by using the
output pmdval before performing the write operations.

This series will convert all pte_offset_map_nolock() into the above two helper
functions one by one, and finally completely delete it.

This also a preparation for reclaiming the empty user PTE page table pages.

This series is based on the next-20240904.

Comments and suggestions are welcome!

Thanks,
Qi

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

 Documentation/mm/split_page_table_lock.rst |  6 ++-
 arch/arm/mm/fault-armv.c                   |  9 ++++-
 arch/powerpc/mm/pgtable.c                  |  2 +-
 include/linux/mm.h                         |  7 +++-
 mm/filemap.c                               |  4 +-
 mm/khugepaged.c                            | 39 ++++++++++++++++++--
 mm/memory.c                                | 32 ++++++++++++++--
 mm/mremap.c                                | 20 +++++++++-
 mm/page_vma_mapped.c                       | 24 ++++++++++--
 mm/pgtable-generic.c                       | 43 ++++++++++++++++++----
 mm/userfaultfd.c                           | 15 ++++++--
 mm/vmscan.c                                |  9 ++++-
 12 files changed, 180 insertions(+), 30 deletions(-)

-- 
2.20.1


