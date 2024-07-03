Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 031C1926A40
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2024 23:30:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KGfamF6d;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KGfamF6d;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WDtGg5JJlz3fQX
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2024 07:30:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KGfamF6d;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KGfamF6d;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WDtFz6mxTz3ccL
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jul 2024 07:29:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720042164;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=O2GbkT3IfNneZLzmTfXKMGxGoFvHWp+ovSbzv55/oNo=;
	b=KGfamF6dFkUrkj1hvsK6jKvMlVzTszRSGWYoFltwquF6hkfW8i6qCIKPN8BzTnmdXou6TI
	on1Ijvb1GUD6n4QIwQ3GE/xv/ZhuVNGE0U0WWfCMcJOknL0o1/PuN7gS0GZ0FU1c5Kp6Ko
	DF4uwGkDXwrRxPPAxt6NERhTsZlU2QQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720042164;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=O2GbkT3IfNneZLzmTfXKMGxGoFvHWp+ovSbzv55/oNo=;
	b=KGfamF6dFkUrkj1hvsK6jKvMlVzTszRSGWYoFltwquF6hkfW8i6qCIKPN8BzTnmdXou6TI
	on1Ijvb1GUD6n4QIwQ3GE/xv/ZhuVNGE0U0WWfCMcJOknL0o1/PuN7gS0GZ0FU1c5Kp6Ko
	DF4uwGkDXwrRxPPAxt6NERhTsZlU2QQ=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-635-5VoFxSaTPFyZw2Sn5EVttQ-1; Wed, 03 Jul 2024 17:29:22 -0400
X-MC-Unique: 5VoFxSaTPFyZw2Sn5EVttQ-1
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-48f62acbc13so353827137.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Jul 2024 14:29:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720042162; x=1720646962;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O2GbkT3IfNneZLzmTfXKMGxGoFvHWp+ovSbzv55/oNo=;
        b=GC8wcn01d4aSzs7rq49xC1dOZWR6SMHpqV6DDtc0aGsE4iVTuBpgqgtu0EFg+2UAQ9
         e1Y60W1mLK1evzFeSFQt9EDXHuDOcQaq8P1wm9+NS9/49JEhCPaK+69BmWEtxrmIboTq
         peD4uYzQI5vQGx5Ca1DDNxzKiEwEA0EpWrqewAgiXBhNyJn8/CNuwBMYkbQ1wxalv5EE
         DSYHuCI+XNreoQCoTFzm9wZ0DSgh7UsU7Yg1ak6QVeXBusdytmeJdzu2lzTNoww2XYFW
         XnyIaWmyc97BcW5oqalRDrduciZDJ5quiLWrBfhlxYeH9VhSnW1DEf7p1WgzbJRreGsl
         9z3w==
X-Forwarded-Encrypted: i=1; AJvYcCUVrrWHqH0vvx1LTstRHAGykOQ006pv+x8XMlohrlMAuvIjWE8KEiUEO/ODcfcwreU+CAacs6h7dAFPC+5K+Ih5n4stCGIVrnby6aXiSw==
X-Gm-Message-State: AOJu0YwxGfHEw4s/wetwqSQUpQRfczisiv/ld6laBhX3n9iNEFlnvYNR
	CbbrntTnTsy4h/5J1kagBJ3NEHQC+ff5fcXJdECgtbko9FsazV8uYKwtIN5ti6N61uqP04Q8pqY
	8gxqpUowjz8I6ouonzmQdNGAMfkfEmDIATE/wzET+RaWVF6fDpOCpREorQs5DfrY=
X-Received: by 2002:a05:6122:221d:b0:4ec:ef42:a7a2 with SMTP id 71dfb90a1353d-4f2a56b62b8mr11877035e0c.1.1720042161761;
        Wed, 03 Jul 2024 14:29:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVxFROGUHiFRpsdTx4NqsAs9vB+SYw6qbXBu8UHMAgFYonw5PPnwd/CcFF1S+TO8MfCwLRIA==
X-Received: by 2002:a05:6122:221d:b0:4ec:ef42:a7a2 with SMTP id 71dfb90a1353d-4f2a56b62b8mr11876994e0c.1.1720042161205;
        Wed, 03 Jul 2024 14:29:21 -0700 (PDT)
Received: from x1n.redhat.com (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4465143eb1csm54337481cf.57.2024.07.03.14.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 14:29:20 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH v2 0/8] mm/mprotect: Fix dax puds
Date: Wed,  3 Jul 2024 17:29:10 -0400
Message-ID: <20240703212918.2417843-1-peterx@redhat.com>
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
Cc: Dave Hansen <dave.hansen@linux.intel.com>, peterx@redhat.com, Christophe Leroy <christophe.leroy@csgroup.eu>, Thomas Gleixner <tglx@linutronix.de>, Dave Jiang <dave.jiang@intel.com>, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, Ingo Molnar <mingo@redhat.com>, Huang Ying <ying.huang@intel.com>, Rik van Riel <riel@surriel.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, "Kirill A . Shutemov" <kirill@shutemov.name>, Dan Williams <dan.j.williams@intel.com>, Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>, Mel Gorman <mgorman@techsingularity.net>, Andrew Morton <akpm@linux-foundation.org>, Rick P Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[Based on mm-unstable, commit 31334cf98dbd, July 2nd]

v2:
- Added tags
- Fix wrong pmd helper used in powerpc
- Added patch "mm/x86: arch_check_zapped_pud()" [Rick]
- Do proper dirty bit shifts for shadow stack on puds [Dave]
- Add missing page_table_check hooks in pudp_establish() [Dave]

v1: https://lore.kernel.org/r/20240621142504.1940209-1-peterx@redhat.com

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
 arch/x86/mm/pgtable.c                        | 18 +++++
 drivers/dax/device.c                         |  6 +-
 include/linux/huge_mm.h                      | 24 +++++++
 include/linux/pgtable.h                      |  7 ++
 include/linux/vm_event_item.h                |  1 -
 mm/huge_memory.c                             | 56 ++++++++++++++-
 mm/mprotect.c                                | 74 ++++++++++++--------
 mm/vmstat.c                                  |  1 -
 11 files changed, 233 insertions(+), 45 deletions(-)

-- 
2.45.0

