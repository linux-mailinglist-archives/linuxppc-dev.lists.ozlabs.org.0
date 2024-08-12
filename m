Return-Path: <linuxppc-dev+bounces-27-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA6194F967
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Aug 2024 00:12:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=K+QiUS2s;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=K+QiUS2s;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WjTKN5n2lz2xSZ;
	Tue, 13 Aug 2024 08:12:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=K+QiUS2s;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=K+QiUS2s;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WjN0S0hnnz2xjM
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Aug 2024 04:12:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723486353;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=eIfqRhqTBdQt7ItDuA3SYVNl6iQYa6JLleOS9G2I7/o=;
	b=K+QiUS2s6cHQxKUwGbqyAGSlC3iHlY1hhwoOKWH2cj8KjxRpQGutDspnO7N5dHt5g88ZyT
	SGpNAztnrCGtp9QdH1YwQeEffVJ3/O607hFm0ci92gvHPtwmteBXgPLq29AbCfMuPUUUaL
	DZIblmqa/XJv2A/V+X14+FhINTn99L0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723486353;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=eIfqRhqTBdQt7ItDuA3SYVNl6iQYa6JLleOS9G2I7/o=;
	b=K+QiUS2s6cHQxKUwGbqyAGSlC3iHlY1hhwoOKWH2cj8KjxRpQGutDspnO7N5dHt5g88ZyT
	SGpNAztnrCGtp9QdH1YwQeEffVJ3/O607hFm0ci92gvHPtwmteBXgPLq29AbCfMuPUUUaL
	DZIblmqa/XJv2A/V+X14+FhINTn99L0=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-41-k-lIhOCXPwuCdhyckX4Y9A-1; Mon, 12 Aug 2024 14:12:29 -0400
X-MC-Unique: k-lIhOCXPwuCdhyckX4Y9A-1
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-26490f7a42fso927383fac.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Aug 2024 11:12:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723486349; x=1724091149;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eIfqRhqTBdQt7ItDuA3SYVNl6iQYa6JLleOS9G2I7/o=;
        b=Jnmrweycs5stLOZpNL+i8MrNovPwxNu9JyBVap+rqsLetTaMa/3hxmL/P3MM1iGZ5U
         4FCRXYhXttT2Wma2BvK4MAdm6ZpIH3fV4aaI84ZL+6D4XMX+t8glpZ7KEiJupLYxuYb/
         gv1R4a8u57lFKYlE6mWoeWuCUgnoM7yLMruO9zBY61++1Vnc6H+bRH4FUgnWM2Aq0+u3
         FnISBkKZOtZ0N/zmtiuNrPhur6h7wlrjirTBvl0dz2Ykahzp0aMqCf1XJrMj8ClD8gEs
         jrht9XaqlVKt0EvPrc4NnnQ+oOVRtb8Vd2YX7wsJJe48jbFVO8HiikjSCQCSGH2NsvKn
         iUDA==
X-Forwarded-Encrypted: i=1; AJvYcCXCEEEd9AovVtR6lApGPFOM6jWNSrRFz53BFw9u3TOtt7sbJYzPbRo0h9BwTpkWWSJ0nBatVngkDZsx0J0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxKAWoMvL8IYK0IluJ52gYFbzK6wn0aubzZ4Ijeet03ivHBnV2u
	aAAxoU+GYCUeVfGnGdCskvu9akbOrSp3NtL6GPFMoUrXCt1cpNwVN5Ilz7LbV5+2mToLQWGe28v
	tlj8AiyMffVfvSZZVApARvi7UzP6s8Bdke8X+vjAVSFWUGphQeHuocdlNeO/lvC4=
X-Received: by 2002:a05:6870:ac0c:b0:261:b94:b0b with SMTP id 586e51a60fabf-26fcb61d7fcmr692515fac.1.1723486348979;
        Mon, 12 Aug 2024 11:12:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6jLTxsSCZJ07oO3D4SmefhCdcQBPUO4jFHyKiLUZDd1WYyR5M288o5ohbA4O9kA1TSpyMOQ==
X-Received: by 2002:a05:6870:ac0c:b0:261:b94:b0b with SMTP id 586e51a60fabf-26fcb61d7fcmr692493fac.1.1723486348633;
        Mon, 12 Aug 2024 11:12:28 -0700 (PDT)
Received: from x1n.redhat.com (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a4c7dee013sm268663985a.84.2024.08.12.11.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 11:12:28 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: "Kirill A . Shutemov" <kirill@shutemov.name>,
	Nicholas Piggin <npiggin@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Matthew Wilcox <willy@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	James Houghton <jthoughton@google.com>,
	Huang Ying <ying.huang@intel.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
	peterx@redhat.com,
	Vlastimil Babka <vbabka@suse.cz>,
	Rick P Edgecombe <rick.p.edgecombe@intel.com>,
	Hugh Dickins <hughd@google.com>,
	Borislav Petkov <bp@alien8.de>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Rik van Riel <riel@surriel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Mel Gorman <mgorman@techsingularity.net>,
	x86@kernel.org,
	Ingo Molnar <mingo@redhat.com>,
	linuxppc-dev@lists.ozlabs.org,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Oscar Salvador <osalvador@suse.de>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH v5 0/7] mm/mprotect: Fix dax puds
Date: Mon, 12 Aug 2024 14:12:18 -0400
Message-ID: <20240812181225.1360970-1-peterx@redhat.com>
X-Mailer: git-send-email 2.45.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

[Based on mm-unstable, commit 98808d08fc0f, Aug 7th. NOTE: it is
 intentional to not have rebased to latest mm-unstable, as this is to
 replace the queued v4]

v5 Changelog:
- Rename patch subject "mm/x86: arch_check_zapped_pud()", add "Implement" [tglx]
- Mostly rewrote commit messages for the x86 patches, follow -tip rules [tglx]
- Line wrap fixes (to mostly avoid newlines when unnecessary) [tglx]
- English fixes [tglx]
- Fix a build issue only happens with i386 pae + clang
  https://lore.kernel.org/r/202408111850.Y7rbVXOo-lkp@intel.com

v1: https://lore.kernel.org/r/20240621142504.1940209-1-peterx@redhat.com
v2: https://lore.kernel.org/r/20240703212918.2417843-1-peterx@redhat.com
v3: https://lore.kernel.org/r/20240715192142.3241557-1-peterx@redhat.com
v4: https://lore.kernel.org/r/20240807194812.819412-1-peterx@redhat.com

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
  mm/x86: Implement arch_check_zapped_pud()
  mm/x86: Add missing pud helpers
  mm/mprotect: fix dax pud handlings

 arch/powerpc/include/asm/book3s/64/pgtable.h |  3 +
 arch/powerpc/mm/book3s64/pgtable.c           | 20 ++++++
 arch/x86/include/asm/pgtable.h               | 70 ++++++++++++++++---
 arch/x86/mm/pgtable.c                        | 18 +++++
 drivers/dax/device.c                         |  6 +-
 include/linux/huge_mm.h                      | 24 +++++++
 include/linux/pgtable.h                      |  6 ++
 mm/huge_memory.c                             | 56 ++++++++++++++-
 mm/mprotect.c                                | 71 +++++++++++++-------
 9 files changed, 236 insertions(+), 38 deletions(-)

-- 
2.45.0


