Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E18781A3004
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Apr 2020 09:28:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48yXmb6bjTzDr7x
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Apr 2020 17:27:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48yXk74Gc4zDqSc
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Apr 2020 17:25:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=hqxRIFF5; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48yXk621H0z9sSk;
 Thu,  9 Apr 2020 17:25:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1586417150;
 bh=zPDShTXJDKoPg3VR8XNTj4aC8E1pnU+EPifQr8Jjg3E=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=hqxRIFF5EMT8X3bFGyFUifce2K+5FyKpkyrL/oDb8tonwNHztfyaF80J6UqHvkRDO
 tXFiVPtPzkSoyj0zhkWJa8tMx4uuy3QfUFXMaGCNv4cm2HoI7UufwJJ6oQ/0XhPIl+
 wn0vOb+qbITDKxR6h/mWIr+7fuY4uTFb6YkB5cpiT7fzlJKsQcmxLNfqAWlV4bASOT
 pMTYTJeVq1pObRIx8Q+ZO97SOsPTxobr09T9/Ea0vPJDlmYrep6CrCQHlzcZtmDC7q
 huwzhhoqhCIhhAoIACyXXXXQgJ/pvCeguIRUd7I2Go6GIwUoV6LNem8sja0dbz6Ekp
 S6jsviFNV8Ckw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] powerpc/pseries/hotplug-memory: stop checking
 is_mem_section_removable()
In-Reply-To: <20200407135416.24093-2-david@redhat.com>
References: <20200407135416.24093-1-david@redhat.com>
 <20200407135416.24093-2-david@redhat.com>
Date: Thu, 09 Apr 2020 17:26:01 +1000
Message-ID: <87sghdjf1y.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Michal Hocko <mhocko@suse.com>, Baoquan He <bhe@redhat.com>,
 David Hildenbrand <david@redhat.com>, Wei Yang <richard.weiyang@gmail.com>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 Nathan Fontenot <nfont@linux.vnet.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

David Hildenbrand <david@redhat.com> writes:

> In commit 53cdc1cb29e8 ("drivers/base/memory.c: indicate all memory
> blocks as removable"), the user space interface to compute whether a memory
> block can be offlined (exposed via
> /sys/devices/system/memory/memoryX/removable) has effectively been
> deprecated. We want to remove the leftovers of the kernel implementation.
>
> When offlining a memory block (mm/memory_hotplug.c:__offline_pages()),
> we'll start by:
> 1. Testing if it contains any holes, and reject if so
> 2. Testing if pages belong to different zones, and reject if so
> 3. Isolating the page range, checking if it contains any unmovable pages
>
> Using is_mem_section_removable() before trying to offline is not only racy,
> it can easily result in false positives/negatives. Let's stop manually
> checking is_mem_section_removable(), and let device_offline() handle it
> completely instead. We can remove the racy is_mem_section_removable()
> implementation next.
>
> We now take more locks (e.g., memory hotplug lock when offlining and the
> zone lock when isolating), but maybe we should optimize that
> implementation instead if this ever becomes a real problem (after all,
> memory unplug is already an expensive operation). We started using
> is_mem_section_removable() in commit 51925fb3c5c9 ("powerpc/pseries:
> Implement memory hotplug remove in the kernel"), with the initial
> hotremove support of lmbs.

It's also not very pretty in dmesg.

Before:

  pseries-hotplug-mem: Attempting to hot-add 10 LMB(s)
  pseries-hotplug-mem: Memory hot-add failed, removing any added LMBs
  dlpar: Could not handle DLPAR request "memory add count 10"

After:

  pseries-hotplug-mem: Attempting to hot-remove 10 LMB(s)
  page:c00c000001ca8200 refcount:1 mapcount:0 mapping:0000000018c4a547 index:0xc00000072a080180
  flags: 0x7ffff000000200(slab)
  raw: 007ffff000000200 c00c000001cffd48 c000000781c51410 c000000793327580
  raw: c00000072a080180 0000000001550001 00000001ffffffff 0000000000000000
  page dumped because: unmovable page
  page:c00c000001cc4a80 refcount:1 mapcount:0 mapping:0000000018c4a547 index:0xc00000079b110080
  flags: 0x7ffff000000000()
  raw: 007ffff000000000 5deadbeef0000100 5deadbeef0000122 0000000000000000
  raw: c00000079b110080 0000000000000000 00000001ffffffff 0000000000000000
  page dumped because: unmovable page
  page:c00c000001d08200 refcount:1 mapcount:0 mapping:0000000018c4a547 index:0xc00000074208ff00
  flags: 0x7ffff000000200(slab)
  raw: 007ffff000000200 c000000781c5f150 c00c000001d37f88 c000000798a24880
  raw: c00000074208ff00 0000000001550002 00000001ffffffff 0000000000000000
  page dumped because: unmovable page
  page:c00c000001d40140 refcount:1 mapcount:0 mapping:0000000018c4a547 index:0xc000000750059c00
  flags: 0x7ffff000000200(slab)
  raw: 007ffff000000200 c00c000001dfcfc8 c00c000001d3c288 c0000007851c2d00
  raw: c000000750059c00 0000000001000003 00000001ffffffff 0000000000000000
  page dumped because: unmovable page
  page:c00c000001d9c000 refcount:1 mapcount:0 mapping:0000000018c4a547 index:0xc000000002370080
  flags: 0x7ffff000000000()
  raw: 007ffff000000000 5deadbeef0000100 5deadbeef0000122 0000000000000000
  raw: c000000002370080 0000000000000000 00000001ffffffff 0000000000000000
  page dumped because: unmovable page
  page:c00c000001dc0200 refcount:1 mapcount:0 mapping:0000000018c4a547 index:0xc000000002370080
  flags: 0x7ffff000000000()
  raw: 007ffff000000000 5deadbeef0000100 5deadbeef0000122 0000000000000000
  raw: c000000002370080 0000000000000000 00000001ffffffff 0000000000000000
  page dumped because: unmovable page
  page:c00c000001e00000 refcount:1 mapcount:0 mapping:0000000018c4a547 index:0x0
  flags: 0x7ffff000000200(slab)
  raw: 007ffff000000200 5deadbeef0000100 5deadbeef0000122 c0000007a801f500
  raw: 0000000000000000 0000000008000800 00000001ffffffff 0000000000000000
  page dumped because: unmovable page
  page:c00c000001e40440 refcount:1 mapcount:0 mapping:0000000018c4a547 index:0x0
  flags: 0x7ffff000000200(slab)
  raw: 007ffff000000200 5deadbeef0000100 5deadbeef0000122 c0000007a801e380
  raw: 0000000000000000 0000000000400040 00000001ffffffff 0000000000000000
  page dumped because: unmovable page
  page:c00c000001e80000 refcount:1 mapcount:0 mapping:0000000018c4a547 index:0xc0000007a0000640
  flags: 0x7ffff000000200(slab)
  raw: 007ffff000000200 c00c000001e5af48 c00c000001e80408 c000000f42d00a00
  raw: c0000007a0000640 00000000066600a2 00000001ffffffff 0000000000000000
  page dumped because: unmovable page
  page:c00c000003c89d40 refcount:2 mapcount:1 mapping:0000000018c4a547 index:0x10a41
  anon flags: 0x17ffff000080024(uptodate|active|swapbacked)
  raw: 017ffff000080024 5deadbeef0000100 5deadbeef0000122 c0000007986b03c9
  raw: 0000000000010a41 0000000000000000 0000000200000000 c00000000340b000
  page dumped because: unmovable page
  page->mem_cgroup:c00000000340b000
  page:c00c000003cc0000 refcount:1 mapcount:0 mapping:0000000018c4a547 index:0xc000000f3000fd38
  flags: 0x17ffff000000200(slab)
  raw: 017ffff000000200 c000000f3c911890 c000000f3c911890 c00000079fffd980
  raw: c000000f3000fd38 0000000000700003 00000001ffffffff 0000000000000000
  page dumped because: unmovable page
  page:c00c000003d00000 refcount:1 mapcount:0 mapping:0000000018c4a547 index:0xc0000007a2ec0000
  flags: 0x17ffff000000000()
  raw: 017ffff000000000 5deadbeef0000100 5deadbeef0000122 0000000000000000
  raw: c0000007a2ec0000 0000000000000000 00000001ffffffff 0000000000000000
  page dumped because: unmovable page
  page:c00c000003e2c000 refcount:1 mapcount:0 mapping:0000000018c4a547 index:0xc000000f8b008400
  flags: 0x27ffff000000200(slab)
  raw: 027ffff000000200 c000000f8e000190 c000000f8e000190 c0000007a801e380
  raw: c000000f8b008400 0000000000400038 00000001ffffffff 0000000000000000
  page dumped because: unmovable page
  page:c00c000003fec000 refcount:1 mapcount:0 mapping:0000000018c4a547 index:0x0
  flags: 0x37ffff000000000()
  raw: 037ffff000000000 5deadbeef0000100 5deadbeef0000122 0000000000000000
  raw: 0000000000000000 0000000000000000 00000001ffffffff 0000000000000000
  page dumped because: unmovable page
  pseries-hotplug-mem: Memory hot-remove failed, adding LMB's back
  dlpar: Could not handle DLPAR request "memory remove count 10"



It looks like set_migratetype_isolate() and start_isolate_page_range()
can be told not to report those warnings, but we're just calling
device_offline() which doesn't let us specify that.

cheers
