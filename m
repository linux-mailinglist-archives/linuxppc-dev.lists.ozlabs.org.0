Return-Path: <linuxppc-dev+bounces-1604-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C036986CBE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Sep 2024 08:46:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XDkfQ6258z2yR5;
	Thu, 26 Sep 2024 16:46:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::831"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727333214;
	cv=none; b=hNu38/Nlwwu2WESHOK0g1ztcrGS42m6J/0XxAIpyUmbeujD626CeYWMdfJmgXWx4tEMpRomBAgjN9xQdpeX9uxijZ7X4TBVzQbK81cyRdmO8YUIxML//M8XMI7ajn4Oc7XIm69ivvPjVNNvbt8qSl9kyxZ8fkpnhqgQ/G94Wk76t88Zflpl7IS4w0ZiMyUge0zC17eaousuNfAaroI98HsiCn3KVMAMtzdnh30Wt/X/rnx7RAT9XMuKnpQ0mXzrn1Nwp6rUD5BK0IDM356Ah5XJ8llVeDYOV1OuvN8PjGuY4aqGjC0wDO30D2JVnNLBqZp1j5z29O+DRqKGnOaUwyw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727333214; c=relaxed/relaxed;
	bh=psD5QBE2/gRnBoEm6qk1NsXq2zG3EMB2GGe+WDIIiWM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HQMlz2B7g3DksdfVvBI2NJCdTkKrRU+sq27lzkPwhOGaUCW5EHBlpmRrmegNG8kJUTasb/fAlVV7ze1B5GeGU0JzNG7e0JxOxIjKbo6RVmGiq9wEfH+BsTMtYe/53CEugNmCW5Fpr41y5NAY9EmWWv8rQODVt9CNBTVCN4HfH1NtbY4wxBSSj5buIo+HRLHFxpBxE0rGISTfjvZ7cmyr60mTurQ3EAvIEdmbdQN8mJfAOeWGeX6mSZP59hPGyln01wzhm7Ynev2kQay6ffwz1PTnFgwGjTCPt1UScaDa1lWf+Ez0jp/Pl1sLSVx5y/pAwr0XwJu8Jp56jSTnsODUyg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=K088WYR1; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::831; helo=mail-qt1-x831.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=K088WYR1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::831; helo=mail-qt1-x831.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XDkfP4S1mz2yGL
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Sep 2024 16:46:51 +1000 (AEST)
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-45aeed46f5eso2741911cf.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Sep 2024 23:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1727333208; x=1727938008; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=psD5QBE2/gRnBoEm6qk1NsXq2zG3EMB2GGe+WDIIiWM=;
        b=K088WYR1t900Zgto+cfPoKBE5RMvWi5uWGMQwQcCedXYHCYgh2TGZgZ67amAsY8sK/
         PoML1qgzgSQpsOey0x/Q2a7cOEhEmvJPYFe9RNTaXyxvbWOoxy3xJSvTpd800sal0Tyu
         XPAfHB0Ro7FqOs9al+9/igUsDZSHbtyQG66THzQdjpJ4BuZqWTYjYCs9xaK+C+258f4o
         UDGQWv9fC57Q3uulvmSnEElwWMPlhuwLplkgFl2gkoDnvT5aLDL/sPlHA3qszv/CfyF0
         ale3Pbd153W4+nnFGmG+LnYy+5MDWCs4r5TQzjDgh/zg72V5D8aBjeATLRWTis7av/al
         xGbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727333208; x=1727938008;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=psD5QBE2/gRnBoEm6qk1NsXq2zG3EMB2GGe+WDIIiWM=;
        b=aYJ7oUOIN3VyRomNru/2FISZlAxR5tFKGT9jE7Cp1c7Ad8zmoHgwQvMgiShSNLhed+
         JyxHjMldkgLugDr8yr6ahkC6jkBodPqP24KB6VpkvB64mvomnlf5/v51BIjjf3SIJYUT
         wJgBSuDZABK5QcdOCsm1PUZZrH2j8kSzTETDzk7QxPfQIwQGZtoefTr8WWGdH2zNjXlI
         emZDKeJepgrzw4fuj/rTLLxIH6lYpZoNtbmqiJ4HHWVXtiO5pkUUZ5ZoS95mCgOWGJpX
         gTUs7vP59seZdujM2sZeJEs7wuDkYap8YzLYr4npEcI2ndYeOO7MkfaUpcTivPQxXUK6
         FIfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrbXRTPnDeFyTXfOaEbkqCW3qAwL3HyRVS67Pcpfj/t57d9atkup5DMmYB+gbXyS7DhtGxn+q7UdPAMGw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzFZSn/m9MDjuU7Z/GCUPTgGY+9SXPFThkYoxn9D0X5sFw/Ue5R
	tLRcsJ393kDy6ZG65A0E4gMwkTvmta6fJVfFo8a11b2xP9HgqHhLJr5bnLVEITA=
X-Google-Smtp-Source: AGHT+IESrskC0O60xJo9CKcSFqAz070fd6XCEqJPS1rPBwM9ByQ3Zw6qYsXl3/Ca/QhHASyX7ikg5w==
X-Received: by 2002:a05:622a:1311:b0:458:34ee:3a4b with SMTP id d75a77b69052e-45b5dec78afmr74252701cf.6.1727333208088;
        Wed, 25 Sep 2024 23:46:48 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45b5257ff1esm23024611cf.38.2024.09.25.23.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 23:46:47 -0700 (PDT)
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
Subject: [PATCH v5 00/13] introduce pte_offset_map_{ro|rw}_nolock()
Date: Thu, 26 Sep 2024 14:46:13 +0800
Message-Id: <cover.1727332572.git.zhengqi.arch@bytedance.com>
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

Changes in v5:
 - directly pass pmdvalp to __pte_offset_map() in pte_offset_map_rw_nolock()
   (Muchun Song)
 - fix the problem of the reference of folio and the mm counter in
   [PATCH v4 07/13] (Muchun Song)
 - directly pass pmdvalp to pte_offset_map_rw_nolock() in map_pte()
   (Muchun Song)
 - collect the Acked-bys and Reviewed-bys
 - rebase onto the next-20240926

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

This series is based on the next-20240926.

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
 mm/khugepaged.c                            | 24 +++++++---
 mm/memory.c                                | 25 ++++++++--
 mm/mremap.c                                | 11 ++++-
 mm/page_vma_mapped.c                       | 24 +++++++---
 mm/pgtable-generic.c                       | 41 ++++++++++++++---
 mm/userfaultfd.c                           | 15 ++++--
 mm/vmscan.c                                |  9 +++-
 12 files changed, 157 insertions(+), 64 deletions(-)

-- 
2.20.1


