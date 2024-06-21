Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA5091279B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2024 16:25:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=c5ll0BPx;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FSQck5OL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W5KQm1yzdz3cbg
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jun 2024 00:25:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=c5ll0BPx;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FSQck5OL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W5KQ21Fwyz30Vd
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jun 2024 00:25:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718979910;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rJ2F2lReou/79KtGbEHPf7ReN+ePAiVmvXImVODPK+8=;
	b=c5ll0BPxgVLjR9GHH6sZ9+n0ao89KjVvVLDDX5RfQKk0AmuqfM0cIjCzQJrKBcGivqsXWv
	Lj/qWLsMKRa7mcus/0L6Yp2WF2gdAyXTn1F1fyJFO89Gy7NVrBnrpULA8359xscFZpLZDD
	GJiY0OlDWedLossLfy2OFuXSvecKb7U=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718979911;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rJ2F2lReou/79KtGbEHPf7ReN+ePAiVmvXImVODPK+8=;
	b=FSQck5OLenpr1zjSVfsfQM6QzatpPR90w0X8hPZJhcrmjC36MBCNmIOxGaRTYkLM3FLa3A
	M4ISpVLzS5rXhn1DR2joEWnZIZ8m62udRsxYR51eGf7PK1aTGPTvjH3s1AKCDvLf9gHc9d
	cRsz8k7HjIt7cT29Kt4I9taiz9kPiAg=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-561-MaRFL-rmOnyHSVm5tXoqrg-1; Fri, 21 Jun 2024 10:25:08 -0400
X-MC-Unique: MaRFL-rmOnyHSVm5tXoqrg-1
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-3d52868214aso119476b6e.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2024 07:25:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718979908; x=1719584708;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rJ2F2lReou/79KtGbEHPf7ReN+ePAiVmvXImVODPK+8=;
        b=psDhz/ySkJQGno78SolEoF/7hfY781wNG5XiJusRYybY19dMNMNd3Nyb2g9Nbhp6RO
         qAUm+3PZBMennLaMzrhzvoP+itYRPqF4ftQWXbzLIHAIO4uK7FhPAgbWjuXAaGE8tN4U
         fTZT1A44x0oJmjIw51+qkyV1q+S1o9eSRHGbz3YRMO4burE6pDgJu35rCbgfgSYSUmYU
         ksEkr71rFtKJP+JV2z10wMdLKE6o0eGRMuu+KWgugrRN8WWGrjFVy1sevW5O51sgUYz/
         e5pHhHzhLmEJq5wCSWzSEhlBkmE/xsaMISYOOu/DEE3ErCWoLzzyHmyGjF2L8fDVoxtL
         51YQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRiO512FfvDSqEzMGawrk6xjyfa3V9KWXABAbsQSUxt0lOcmSX4/jRbS3HdJT/8M1Yu7qd8tJeeDfF3DuQ2CNpm482ng8cKEul4dM2vQ==
X-Gm-Message-State: AOJu0YyhDDVmj4mVP6pwpiHr+GhkFIOMxPw0s3GGqly4awB59KDCRFdU
	Cx003yMNnzFUKGRNBBcQXRB/b/rGh8P5xU4kn6/sqrgyYHrutvZybmDx2Ww01Y7FPPl9X/cbF46
	gbqQ3i5iHuqNt5AMaghoSgrdbED9RWopIwpXU5DT00J5fM3kQLph8Hr2G2iSh4II=
X-Received: by 2002:a05:6359:4c82:b0:1a1:cc04:1dfe with SMTP id e5c5f4694b2df-1a1fd54fea5mr982810355d.2.1718979907425;
        Fri, 21 Jun 2024 07:25:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1Xxdp9urwT8bix6NuH4K7DRA81f/XgNHW39wGHKyZSk8ch5WqsO3pnf6YuhyEDxai+96HrA==
X-Received: by 2002:a05:6359:4c82:b0:1a1:cc04:1dfe with SMTP id e5c5f4694b2df-1a1fd54fea5mr982805755d.2.1718979906763;
        Fri, 21 Jun 2024 07:25:06 -0700 (PDT)
Received: from x1n.redhat.com (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-79bce944cb2sm90564785a.125.2024.06.21.07.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 07:25:06 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 0/7] mm/mprotect: Fix dax puds
Date: Fri, 21 Jun 2024 10:24:57 -0400
Message-ID: <20240621142504.1940209-1-peterx@redhat.com>
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
Cc: Dave Hansen <dave.hansen@linux.intel.com>, peterx@redhat.com, Christophe Leroy <christophe.leroy@csgroup.eu>, Dan Williams <dan.j.williams@intel.com>, Dave Jiang <dave.jiang@intel.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, Ingo Molnar <mingo@redhat.com>, Huang Ying <ying.huang@intel.com>, Rik van Riel <riel@surriel.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, "Kirill A . Shutemov" <kirill@shutemov.name>, Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>, linuxppc-dev@lists.ozlabs.org, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, Mel Gorman <mgorman@techsingularity.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[Based on mm-unstable, commit a53138cdbe3e]

Dax supports pud pages for a while, but mprotect on puds was missing since
the start.  This series tries to fix that by providing pud handling in
mprotect(), while my real goal is adding more types of pud mappings like
hugetlb or pfnmaps, it's just that we probably want pud to work already and
build the rest on top.

Considering nobody reported this until when I looked at those other types
of pud mappings, I am thinking maybe it doesn't need to be a fix for stable
and this may not need to be backported.  I would guess whoever cares about
mprotect() won't care 1G dax puds yet, vice versa.  I hope fixing that in
new kernels would be fine, but I'm open to suggestions.

There're quite a few small things changed here and there to teach mprotect
work on PUDs. E.g. it will start with dropping NUMA_HUGE_PTE_UPDATES which
may stop making much sense when there can be more than one type of huge pte
(meanwhile it doesn't sound right at all to account non-numa operations
too.. more in the commit message of the relevant patch).  OTOH, we'll also
need to push the mmu notifiers from pmd to pud layers, which might need
some attention but so far I think it's safe.  For these small details,
please refer to each patch's commit message.

The mprotect() pud process is hopefully straightforward enough, as I kept
it as simple as possible.  There's no NUMA handled as dax simply doesn't
support that. There's also no userfault involvements as file memory (even
if work with userfault-wp async mode) will need to split a pud, so pud
entry doesn't need to yet know userfault's existance (but hugetlb entries
will; that's also for later).

Tests
=====

What I did test:

- cross-build tests that I normally cover [1], except an known issue
  elsewhere on hugetlb [2]

- smoke tested on x86_64 the simplest program [3] on dev_dax 1G PUD
  mprotect() using QEMU's nvdimm emulations [4] and ndctl to create
  namespaces with proper alignments, which used to throw "bad pud" but now
  it'll run through all fine.  Also I checked sigbus happens if with
  illegal access on protected puds.

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
[2] https://lore.kernel.org/all/202406190956.9j1UCIe5-lkp@intel.com
[2] https://github.com/xzpeter/clibs/blob/master/misc/dax.c
[3] https://github.com/qemu/qemu/blob/master/docs/nvdimm.txt

Peter Xu (7):
  mm/dax: Dump start address in fault handler
  mm/mprotect: Remove NUMA_HUGE_PTE_UPDATES
  mm/mprotect: Push mmu notifier to PUDs
  mm/powerpc: Add missing pud helpers
  mm/x86: Make pud_leaf() only cares about PSE bit
  mm/x86: Add missing pud helpers
  mm/mprotect: fix dax pud handlings

 arch/powerpc/include/asm/book3s/64/pgtable.h |  3 +
 arch/powerpc/mm/book3s64/pgtable.c           | 20 ++++++
 arch/x86/include/asm/pgtable.h               | 39 ++++++++++-
 arch/x86/mm/pgtable.c                        | 11 +++
 drivers/dax/device.c                         |  6 +-
 include/linux/huge_mm.h                      | 24 +++++++
 include/linux/vm_event_item.h                |  1 -
 mm/huge_memory.c                             | 52 ++++++++++++++
 mm/mprotect.c                                | 74 ++++++++++++--------
 mm/vmstat.c                                  |  1 -
 10 files changed, 195 insertions(+), 36 deletions(-)

-- 
2.45.0

