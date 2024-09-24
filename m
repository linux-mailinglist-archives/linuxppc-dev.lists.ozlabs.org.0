Return-Path: <linuxppc-dev+bounces-1538-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49190983CAF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2024 08:10:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XCTxQ1s1Bz2xKg;
	Tue, 24 Sep 2024 16:10:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::634"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727158234;
	cv=none; b=V2Hg7FXdf+COLbeE9Q18mgRgopuetql3uw+Y0pqQwqlSESMSt+pCeddEGsOmyeRGYczIjV1AduyFGEuPfKgPxPV8rYu2NdqIVzzwVGwTi3fcb/txDN0mFiEBhEQ1FcZtAcm9sp0QkSxEBDAOD/8+Wazz2z1nu1Ik2eb74LVD9k3BjmcuVQRyF7jP3ahHVwwCcqjI/mWLuMBpHafA1vW/BbptRrFuf2JfJxDLS21ComahVK5ucn9N9j4/erYyY4i5BDSgrUV1Tui15s+SeTkXng6zm1tXLLEBRJVtSuXL/ily8G4BMOSNpyK5ChkMy52ni9L0P4KM+sfUcmd8WvnhTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727158234; c=relaxed/relaxed;
	bh=FZ+6J9fpvc8LtEIEryLlJSsbAdd45v7edjcT5rDHpkU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=glswnXKMlEMJzHhLSDQsV+4yheIHaB4ly7VjSo2ECDSZuwVNRVLxHYFxb6ZtQnRwSLMkqKITzsWRPa8y0JFVW1OBBO0vzek3/X/z7X8Mm5mtWVwVqp8l8OKKtmzu5wloVwS7PybUeXAhbA9ZbBKshe9fWMH4OaQCEdDi7khKtksjhKIQk0ByOgSv/N29eODjTycGZSL5Ny6zAXSXBBRjINHOa01AwuDIDtLvyKAZ2/NK/okD1bjcX9kf89RyjONaNdxyEmoxJx2JXBsvrWwn5knXvelu9ho2Yt7nib7tTtkipX1yqtn9FxnTV+kn0VYMC8p3O2066q7705MNfpFglw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=cEsGMldv; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=cEsGMldv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XCTxP0GdBz2xHr
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2024 16:10:30 +1000 (AEST)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2068acc8a4fso47157825ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Sep 2024 23:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1727158228; x=1727763028; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FZ+6J9fpvc8LtEIEryLlJSsbAdd45v7edjcT5rDHpkU=;
        b=cEsGMldvGyndHDtCpjIsYxcABwmm3IVh2OqlSdqIKWj91///H1PeAFWEi+PyBXO1Xw
         XsYlqctgz/DjtAt4IKrg00rqEqUGgsqXLO98uHdkbr1xtcZgavQzMmrGMF6gZnxbYkj/
         nbctCkKmpjzkGtr+4/jDjbRgv0yE2WAFYV3deM+L3Cket/dECfXAU9R1KMDYvMxZxZIW
         w00RNfOSA5TSCxGiae4/+lb8ZQWt4Ia1MwwfI/0rNORsfUO4SyrTpn28xNLgIGaGTjZb
         sE7a1aQVJGvO7VoC8c4xrNN2cNiqJRayQgykZxKAzwHV1dQR/SWcyvKLCAfAfH+J4Z9m
         EakA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727158228; x=1727763028;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FZ+6J9fpvc8LtEIEryLlJSsbAdd45v7edjcT5rDHpkU=;
        b=TqoRnd3Ja8pz55KDDrvrpqSJ6zK5ezZgHRXOVH99DvbeTmqsHwsOITMaWs+kPvricU
         JUmvb8q7/T/Ii87wjNOxlE/56AmzkqEuofJEjUpO07n4ZgD4JtPgnh7DGV9N1UkkGglI
         mO87Dx8Aw0ldRVskST1dq7iuVJ+/RvsnWXH1PuwlMtQqCXj4CTSweitqkhp3TzdD+cni
         Sqklja6iQCPUoUvJVvcmgeFUHmd8yZAdA0BLOzjHoYZ8iRCv+5arGImX0KsnD1ojpYa4
         o7ujQJKzhiFWzbDbFwM/ivUc/Z2sTWK64zbrOCAGPyHdS/TXNfJhBDbFUHChDG7SmjrB
         lpVA==
X-Forwarded-Encrypted: i=1; AJvYcCUr3P3Cf9yODRG7gfiWWDEqE6Mu/i+q7yzCAu6efD3QXQ/fxZyku7ZeovwLof3PjEPDAbGYEuR3kKr9Syo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxSZbU9c4fgacP0HxBp4qzYyn+7gaALaPAKYn+Oc91C89SZ1glU
	DiVYEue6ItB7DfVnvLjw+Pnq8XhI5N4aX7Aw2Guobme2yUWvEg+gW+FOe6L/bxo=
X-Google-Smtp-Source: AGHT+IE3JgWdRJx6WCYXen89wPhryGlCmdGWyOg8hF+XH/7tbK6pMmGNNEBSXyybrad6ihXB6X7r6g==
X-Received: by 2002:a17:903:22c7:b0:206:a1ea:f4fe with SMTP id d9443c01a7336-208d832a9c8mr174328585ad.10.1727158228146;
        Mon, 23 Sep 2024 23:10:28 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([63.216.146.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20af17229c9sm4344885ad.85.2024.09.23.23.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2024 23:10:27 -0700 (PDT)
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
Subject: [PATCH v4 00/13] introduce pte_offset_map_{ro|rw}_nolock()
Date: Tue, 24 Sep 2024 14:09:52 +0800
Message-Id: <cover.1727148662.git.zhengqi.arch@bytedance.com>
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

Changes in v4:
 - arm: adjust_pte() use pte_offset_map_rw_nolock()
   (use ptl != vmf->ptl to check if we are using split PTE locks)
   mm: khugepaged: collapse_pte_mapped_thp() use pte_offset_map_rw_nolock()
   (move the pte_unmap() backward)
   mm: copy_pte_range() use pte_offset_map_rw_nolock()
   (remove pmd_same() check)
   mm: mremap: move_ptes() use pte_offset_map_rw_nolock()
   (remove pmd_same() check)
   mm: page_vma_mapped_walk: map_pte() use pte_offset_map_rw_nolock()
   (move the assignment to pvmw->ptl backward)
 - remove [PATCH v3 14/14] (will be sent as a separate patch)
 - reorder patches
 - collect the Reviewed-bys
 - rebase onto the next-20240923

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

This series is based on the next-20240923.

Comments and suggestions are welcome!

Thanks,
Qi

Qi Zheng (13):
  mm: pgtable: introduce pte_offset_map_{ro|rw}_nolock()
  powerpc: assert_pte_locked() use pte_offset_map_ro_nolock()
  mm: filemap: filemap_fault_recheck_pte_none() use
    pte_offset_map_ro_nolock()
  mm: khugepaged: __collapse_huge_page_swapin() use
    pte_offset_map_ro_nolock()
  arm: adjust_pte() use pte_offset_map_rw_nolock()
  mm: handle_pte_fault() use pte_offset_map_rw_nolock()
  mm: khugepaged: collapse_pte_mapped_thp() use
    pte_offset_map_rw_nolock()
  mm: copy_pte_range() use pte_offset_map_rw_nolock()
  mm: mremap: move_ptes() use pte_offset_map_rw_nolock()
  mm: page_vma_mapped_walk: map_pte() use pte_offset_map_rw_nolock()
  mm: userfaultfd: move_pages_pte() use pte_offset_map_rw_nolock()
  mm: multi-gen LRU: walk_pte_range() use pte_offset_map_rw_nolock()
  mm: pgtable: remove pte_offset_map_nolock()

 Documentation/mm/split_page_table_lock.rst |  6 ++-
 arch/arm/mm/fault-armv.c                   | 53 +++++++++-------------
 arch/powerpc/mm/pgtable.c                  |  2 +-
 include/linux/mm.h                         |  7 ++-
 mm/filemap.c                               |  4 +-
 mm/khugepaged.c                            | 20 ++++++--
 mm/memory.c                                | 25 ++++++++--
 mm/mremap.c                                | 11 ++++-
 mm/page_vma_mapped.c                       | 25 ++++++++--
 mm/pgtable-generic.c                       | 43 +++++++++++++++---
 mm/userfaultfd.c                           | 15 ++++--
 mm/vmscan.c                                |  9 +++-
 12 files changed, 159 insertions(+), 61 deletions(-)

-- 
2.20.1


