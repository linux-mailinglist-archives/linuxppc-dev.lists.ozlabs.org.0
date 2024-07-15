Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4FB931AC5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2024 21:22:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iNcOZ5qY;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iNcOZ5qY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WNBsy3NG2z3dBq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2024 05:22:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iNcOZ5qY;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iNcOZ5qY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WNBsG36PWz3bX3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2024 05:21:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721071308;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fcwbFvUlydJ89LCIJbZYnbeNwq+Aa7yYvNbAx9RPsSI=;
	b=iNcOZ5qYLa00O/g57/nKXFin6bQb6re4gpo/wqgz/mCRfuHqtesjutGO21l0n5dKehtZJT
	rfq4/LvFnVSWaN3Q9GDxkgEBGCqFRg81bBbqFQ7ZyJIpndDrnDhQRV87ecMg3BophBGY0Q
	yQnX5mhzKvBRVqeYXuzWAYVVCf2pdXM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721071308;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fcwbFvUlydJ89LCIJbZYnbeNwq+Aa7yYvNbAx9RPsSI=;
	b=iNcOZ5qYLa00O/g57/nKXFin6bQb6re4gpo/wqgz/mCRfuHqtesjutGO21l0n5dKehtZJT
	rfq4/LvFnVSWaN3Q9GDxkgEBGCqFRg81bBbqFQ7ZyJIpndDrnDhQRV87ecMg3BophBGY0Q
	yQnX5mhzKvBRVqeYXuzWAYVVCf2pdXM=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-646-yaD2m_OGPkqYYy8JrBjgcA-1; Mon, 15 Jul 2024 15:21:46 -0400
X-MC-Unique: yaD2m_OGPkqYYy8JrBjgcA-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6b7740643fbso2326536d6.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jul 2024 12:21:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721071306; x=1721676106;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fcwbFvUlydJ89LCIJbZYnbeNwq+Aa7yYvNbAx9RPsSI=;
        b=f1iYVw3tcNld4n5UKwZZEow/M5Wr2EIIAwJ9dkK37Tu263F6EQtJJ3D/B/0xnURK//
         vejIz8Gs0f7jN3xX5gTcPWrLlJB4UudFJy/vyqbCv+5dtt8/0/PihpLbXjE2rrg/OXnD
         1N88RnuQZNdXHpVboAGuwIBGnAYApUxGmxikGnMIpRsrzgMh+VhKM8mR5kGtc4xs80+3
         e0dUlU+PeHPzToXzrRZJhy1ETI0IzYVszHkJ5K5R3z3DEkwOPJyqPRS//LHppUDAUkyr
         at3X0NtLn4tcrQ18rETsJTEglsR1hr/0NJ7y5QQYcUqXSpWabbvJPZzR82O9AvaYLtHT
         ZCXA==
X-Forwarded-Encrypted: i=1; AJvYcCUoVt8qCcQHfPx8AzWnWFYgkcsgXAiCIgAGC/T9PFuON/MPuhfc4n6BLu+bYDs1rz+0LnDio1Nh27nfWew=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwNs5yd4iLiQJjpwvcqlLSuRoli+49kS3YcQpors8FIAWjCzHLs
	HAwhD5WL6TCN5WgGnNQOF++hhN4afQUQdlumuC8WaZB7KQCZh+scqUzcZQao9PX8XlWEoTwCrRt
	CQepSvl0M4ilzVEXR3QOT9ZbItnuEz0JlkpwJaOvdtvSgnIBFS7YappuvKgIlO0w=
X-Received: by 2002:a05:6214:3d87:b0:6b2:b5b5:124e with SMTP id 6a1803df08f44-6b77dd634e7mr5106646d6.0.1721071306253;
        Mon, 15 Jul 2024 12:21:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFu7hXxUrNpLJfANABTNicknn5i9R99x8eQnIUTwDJYLFg/NIIa0kT9/i+hFib8ttrRFUJmhA==
X-Received: by 2002:a05:6214:3d87:b0:6b2:b5b5:124e with SMTP id 6a1803df08f44-6b77dd634e7mr5106546d6.0.1721071305812;
        Mon, 15 Jul 2024 12:21:45 -0700 (PDT)
Received: from x1n.redhat.com (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b761978d30sm24039356d6.31.2024.07.15.12.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 12:21:45 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/8] mm/mprotect: Fix dax puds
Date: Mon, 15 Jul 2024 15:21:34 -0400
Message-ID: <20240715192142.3241557-1-peterx@redhat.com>
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
Cc: Dave Hansen <dave.hansen@linux.intel.com>, peterx@redhat.com, Christophe Leroy <christophe.leroy@csgroup.eu>, Dan Williams <dan.j.williams@intel.com>, Dave Jiang <dave.jiang@intel.com>, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, Ingo Molnar <mingo@redhat.com>, Huang Ying <ying.huang@intel.com>, Rik van Riel <riel@surriel.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, "Kirill A . Shutemov" <kirill@shutemov.name>, Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>, linuxppc-dev@lists.ozlabs.org, Andrew Morton <akpm@linux-foundation.org>, Rick P Edgecombe <rick.p.edgecombe@intel.com>, Mel Gorman <mgorman@techsingularity.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[Based on mm-unstable, commit 31334cf98dbd, July 2nd]

v3:
- Fix a build issue on i386 PAE config
- Moved one line from patch 8 to patch 3

v1: https://lore.kernel.org/r/20240621142504.1940209-1-peterx@redhat.com
v2: https://lore.kernel.org/r/20240703212918.2417843-1-peterx@redhat.com

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

Peter Xu (8):
  mm/dax: Dump start address in fault handler
  mm/mprotect: Remove NUMA_HUGE_PTE_UPDATES
  mm/mprotect: Push mmu notifier to PUDs
  mm/powerpc: Add missing pud helpers
  mm/x86: Make pud_leaf() only cares about PSE bit
  mm/x86: arch_check_zapped_pud()
  mm/x86: Add missing pud helpers
  mm/mprotect: fix dax pud handlings

 arch/powerpc/include/asm/book3s/64/pgtable.h |  3 +
 arch/powerpc/mm/book3s64/pgtable.c           | 20 ++++++
 arch/x86/include/asm/pgtable.h               | 68 +++++++++++++++---
 arch/x86/mm/pgtable.c                        | 19 +++++
 drivers/dax/device.c                         |  6 +-
 include/linux/huge_mm.h                      | 24 +++++++
 include/linux/pgtable.h                      |  7 ++
 include/linux/vm_event_item.h                |  1 -
 mm/huge_memory.c                             | 56 ++++++++++++++-
 mm/mprotect.c                                | 74 ++++++++++++--------
 mm/vmstat.c                                  |  1 -
 11 files changed, 234 insertions(+), 45 deletions(-)

-- 
2.45.0

