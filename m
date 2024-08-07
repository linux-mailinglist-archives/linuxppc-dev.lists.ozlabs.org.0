Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D8D94B09E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2024 21:49:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WxMo9jRx;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WxMo9jRx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WfLMv7075z3d8K
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 05:48:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WxMo9jRx;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WxMo9jRx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WfLMD2zj6z3d88
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2024 05:48:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723060099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=o3OFHAXa4GjeJOqHDNlzpJASvE7zIeu8ivvI2pMYR/w=;
	b=WxMo9jRxZ/VM2rpvSmnaejK76UAnCINi9U87ga8bLPhEcgVWgeXxg8jaHO8CKvMBJme4DN
	04+Uy9NVKDZ6yOlFf3WcFjK8Pe7Bazn360SyzVFV6GTsAx8Ye/OAWPuf0Cf1h/cXmv2Dyx
	q2LeOB5ihQk/CIDs47pfTx0sXCU2zJU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723060099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=o3OFHAXa4GjeJOqHDNlzpJASvE7zIeu8ivvI2pMYR/w=;
	b=WxMo9jRxZ/VM2rpvSmnaejK76UAnCINi9U87ga8bLPhEcgVWgeXxg8jaHO8CKvMBJme4DN
	04+Uy9NVKDZ6yOlFf3WcFjK8Pe7Bazn360SyzVFV6GTsAx8Ye/OAWPuf0Cf1h/cXmv2Dyx
	q2LeOB5ihQk/CIDs47pfTx0sXCU2zJU=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-494-itksBBHQNmqahMRREz8JTA-1; Wed, 07 Aug 2024 15:48:15 -0400
X-MC-Unique: itksBBHQNmqahMRREz8JTA-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6b7ad98c1f8so389286d6.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Aug 2024 12:48:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723060095; x=1723664895;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o3OFHAXa4GjeJOqHDNlzpJASvE7zIeu8ivvI2pMYR/w=;
        b=HgdMXVSdsywE9eZu4bPAGBRSX6TgXPj6QPofWTAbKL4cZzFHZsfUETJAqyWDoSIDr6
         jnrIxiyNjTXpqc5rB2NQWvXGPjxNlIe7939XP8FzdNHjxWHHHOQxm5iyRRLqd4TYc3/6
         Mbdto83YSiVd/79/9O32FagwbyEBgOr8yxwIGjVHWxtLpv5nVPFBDXdQHgaGe1f/lQa0
         Y58dOTeMNZ74KKbqjRc3ZLB5F07RAMdcMhaMNTwU11gk63Zxhtp7+l2xuwiicjGOrG/Z
         FwzaCkz8vs7UVGEPLyiALxktepiQ9PJinTEWwIJIVTAq8btKJYgdt46vWHs8W0aJwRYm
         ZXYg==
X-Forwarded-Encrypted: i=1; AJvYcCUXPvsDKozPxtJbkEvA4d2CQHBhx/6AspqltvaZrVVAq1u8OotSL+IX9SrN8qCn6d+JZrrlI4i07zOb9yc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywv143UNOt1TcOufwo0yWxekqMZVAire94fMYkI++gHhoFUbu5J
	u9hAVh9DMraF8n3o8G6OuqicCgLQ7frYCei9mBR9yUQnytPunSzdG6ivzkvOCCniM4WAf76HjPd
	MYgNarM2gLxHKn7lEamZ8kBgsdDBzEtbP6eG/dxg2Snspjk2Hb0SREUeetP1lTus=
X-Received: by 2002:ad4:5ba4:0:b0:6b7:9295:3cce with SMTP id 6a1803df08f44-6bb984ae596mr143755126d6.8.1723060095069;
        Wed, 07 Aug 2024 12:48:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCjDJrPHIrMzNYMf7G/SdTGJGIyVor+2t/BXveAxufE9NNL2pow6YcQrqmHncd+BDg/Ri9nA==
X-Received: by 2002:ad4:5ba4:0:b0:6b7:9295:3cce with SMTP id 6a1803df08f44-6bb984ae596mr143754916d6.8.1723060094671;
        Wed, 07 Aug 2024 12:48:14 -0700 (PDT)
Received: from x1n.redhat.com (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bb9c78ae4asm59853256d6.33.2024.08.07.12.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 12:48:14 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH v4 0/7] mm/mprotect: Fix dax puds
Date: Wed,  7 Aug 2024 15:48:04 -0400
Message-ID: <20240807194812.819412-1-peterx@redhat.com>
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
Cc: James Houghton <jthoughton@google.com>, David Hildenbrand <david@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, peterx@redhat.com, Christophe Leroy <christophe.leroy@csgroup.eu>, Dan Williams <dan.j.williams@intel.com>, Dave Jiang <dave.jiang@intel.com>, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, Ingo Molnar <mingo@redhat.com>, Huang Ying <ying.huang@intel.com>, Rik van Riel <riel@surriel.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, "Kirill A . Shutemov" <kirill@shutemov.name>, Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>, linuxppc-dev@lists.ozlabs.org, Andrew Morton <akpm@linux-foundation.org>, Rick P Edgecombe <rick.p.edgecombe@intel.com>, Mel Gorman <mgorman@techsingularity.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[Based on mm-unstable, commit 98808d08fc0f, Aug 7th]

v4:
- Added tags
- Dropped patch "mm/mprotect: Remove NUMA_HUGE_PTE_UPDATES" [DavidH]
- Touched up comment in pgtable_split_needed() [James]

v1: https://lore.kernel.org/r/20240621142504.1940209-1-peterx@redhat.com
v2: https://lore.kernel.org/r/20240703212918.2417843-1-peterx@redhat.com
v3: https://lore.kernel.org/r/20240715192142.3241557-1-peterx@redhat.com

Dax supports pud pages for a while, but mprotect on puds was missing since
the start.  This series tries to fix that by providing pud handling in
mprotect().  The goal is to add more types of pud mappings like hugetlb or
pfnmaps.  This series paves way for it by fixing known pud entries.

Considering nobody reported this until when I looked at those other types
of pud mappings, I am thinking maybe it doesn't need to be a fix for stable
and this may not need to be backported.  I would guess whoever cares about
mprotect() won't care 1G dax puds yet, vice versa.  I hope fixing that in
new kernels would be fine, but I'm open to suggestions.

There're a few small things changed to teach mprotect work on PUDs. E.g. it
will need to start with dropping NUMA_HUGE_PTE_UPDATES which may stop
making sense when there can be more than one type of huge pte.  OTOH, we'll
also need to push the mmu notifiers from pmd to pud layers, which might
need some attention but so far I think it's safe.  For such details, please
refer to each patch's commit message.

The mprotect() pud process should be straightforward, as I kept it as
simple as possible.  There's no NUMA handled as dax simply doesn't support
that.  There's also no userfault involvements as file memory (even if work
with userfault-wp async mode) will need to split a pud, so pud entry
doesn't need to yet know userfault's existance (but hugetlb entries will;
that's also for later).

Tests
=====

What I did test:

- cross-build tests that I normally cover [1]

- smoke tested on x86_64 the simplest program [2] on dev_dax 1G PUD
  mprotect() using QEMU's nvdimm emulations [3] and ndctl to create
  namespaces with proper alignments, which used to throw "bad pud" but now
  it'll run through all fine.  I checked sigbus happens if with illegal
  access on protected puds.

- vmtests.

What I didn't test:

- fsdax: I wanted to also give it a shot, but only until then I noticed it
  doesn't seem to be supported (according to dax_iomap_fault(), which will
  always fallback on PUD_ORDER).  I did remember it was supported before, I
  could miss something important there.. please shoot if so.

- userfault wp-async: I also wanted to test userfault-wp async be able to
  split huge puds (here it's simply a clear_pud.. though), but it won't
  work for devdax anyway due to not allowed to do smaller than 1G faults in
  this case. So skip too.

- Power, as no hardware on hand.

Thanks,

[1] https://gitlab.com/peterx/lkb-harness/-/blob/main/config.json
[2] https://github.com/xzpeter/clibs/blob/master/misc/dax.c
[3] https://github.com/qemu/qemu/blob/master/docs/nvdimm.txt

Peter Xu (7):
  mm/dax: Dump start address in fault handler
  mm/mprotect: Push mmu notifier to PUDs
  mm/powerpc: Add missing pud helpers
  mm/x86: Make pud_leaf() only care about PSE bit
  mm/x86: arch_check_zapped_pud()
  mm/x86: Add missing pud helpers
  mm/mprotect: fix dax pud handlings

 arch/powerpc/include/asm/book3s/64/pgtable.h |  3 +
 arch/powerpc/mm/book3s64/pgtable.c           | 20 ++++++
 arch/x86/include/asm/pgtable.h               | 68 ++++++++++++++++---
 arch/x86/mm/pgtable.c                        | 19 ++++++
 drivers/dax/device.c                         |  6 +-
 include/linux/huge_mm.h                      | 24 +++++++
 include/linux/pgtable.h                      |  7 ++
 mm/huge_memory.c                             | 56 ++++++++++++++-
 mm/mprotect.c                                | 71 +++++++++++++-------
 9 files changed, 236 insertions(+), 38 deletions(-)

-- 
2.45.0

