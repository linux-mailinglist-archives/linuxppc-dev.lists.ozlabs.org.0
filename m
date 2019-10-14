Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D152D5F29
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2019 11:41:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46sD8k3gyYzDqNX
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2019 20:41:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=redhat.com
 (client-ip=209.132.183.28; helo=mx1.redhat.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46sD6S2BBlzDqF0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2019 20:39:28 +1100 (AEDT)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 491D020F6;
 Mon, 14 Oct 2019 09:39:25 +0000 (UTC)
Received: from [10.36.116.28] (ovpn-116-28.ams2.redhat.com [10.36.116.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A9BBA60BE2;
 Mon, 14 Oct 2019 09:39:14 +0000 (UTC)
Subject: Re: [PATCH v6 05/10] mm/memory_hotplug: Shrink zones when offlining
 memory
To: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
References: <20191006085646.5768-1-david@redhat.com>
 <20191006085646.5768-6-david@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <f9d67085-a02a-a693-6a72-6aaf8a243add@redhat.com>
Date: Mon, 14 Oct 2019 11:39:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20191006085646.5768-6-david@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.71]); Mon, 14 Oct 2019 09:39:26 +0000 (UTC)
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
Cc: Mark Rutland <mark.rutland@arm.com>, Rich Felker <dalias@libc.org>,
 linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 Wei Yang <richard.weiyang@gmail.com>, linux-mm@kvack.org,
 Michal Hocko <mhocko@suse.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Will Deacon <will@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>, linux-s390@vger.kernel.org,
 Yu Zhao <yuzhao@google.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Halil Pasic <pasic@linux.ibm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 x86@kernel.org, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Jun Yao <yaojun8558363@gmail.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>, Ira Weiny <ira.weiny@intel.com>,
 Fenghua Yu <fenghua.yu@intel.com>, Pavel Tatashin <pasha.tatashin@soleen.com>,
 Vasily Gorbik <gor@linux.ibm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Oscar Salvador <osalvador@suse.de>, Tony Luck <tony.luck@intel.com>,
 Steve Capper <steve.capper@arm.com>, Robin Murphy <robin.murphy@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Logan Gunthorpe <logang@deltatee.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Qian Cai <cai@lca.pw>,
 Tom Lendacky <thomas.lendacky@amd.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 06.10.19 10:56, David Hildenbrand wrote:
> We currently try to shrink a single zone when removing memory. We use the
> zone of the first page of the memory we are removing. If that memmap was
> never initialized (e.g., memory was never onlined), we will read garbage
> and can trigger kernel BUGs (due to a stale pointer):
> 
> :/# [   23.912993] BUG: unable to handle page fault for address: 000000000000353d
> [   23.914219] #PF: supervisor write access in kernel mode
> [   23.915199] #PF: error_code(0x0002) - not-present page
> [   23.916160] PGD 0 P4D 0
> [   23.916627] Oops: 0002 [#1] SMP PTI
> [   23.917256] CPU: 1 PID: 7 Comm: kworker/u8:0 Not tainted 5.3.0-rc5-next-20190820+ #317
> [   23.918900] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.12.1-0-ga5cab58e9a3f-prebuilt.qemu.4
> [   23.921194] Workqueue: kacpi_hotplug acpi_hotplug_work_fn
> [   23.922249] RIP: 0010:clear_zone_contiguous+0x5/0x10
> [   23.923173] Code: 48 89 c6 48 89 c3 e8 2a fe ff ff 48 85 c0 75 cf 5b 5d c3 c6 85 fd 05 00 00 01 5b 5d c3 0f 1f 840
> [   23.926876] RSP: 0018:ffffad2400043c98 EFLAGS: 00010246
> [   23.927928] RAX: 0000000000000000 RBX: 0000000200000000 RCX: 0000000000000000
> [   23.929458] RDX: 0000000000200000 RSI: 0000000000140000 RDI: 0000000000002f40
> [   23.930899] RBP: 0000000140000000 R08: 0000000000000000 R09: 0000000000000001
> [   23.932362] R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000140000
> [   23.933603] R13: 0000000000140000 R14: 0000000000002f40 R15: ffff9e3e7aff3680
> [   23.934913] FS:  0000000000000000(0000) GS:ffff9e3e7bb00000(0000) knlGS:0000000000000000
> [   23.936294] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   23.937481] CR2: 000000000000353d CR3: 0000000058610000 CR4: 00000000000006e0
> [   23.938687] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> [   23.939889] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> [   23.941168] Call Trace:
> [   23.941580]  __remove_pages+0x4b/0x640
> [   23.942303]  ? mark_held_locks+0x49/0x70
> [   23.943149]  arch_remove_memory+0x63/0x8d
> [   23.943921]  try_remove_memory+0xdb/0x130
> [   23.944766]  ? walk_memory_blocks+0x7f/0x9e
> [   23.945616]  __remove_memory+0xa/0x11
> [   23.946274]  acpi_memory_device_remove+0x70/0x100
> [   23.947308]  acpi_bus_trim+0x55/0x90
> [   23.947914]  acpi_device_hotplug+0x227/0x3a0
> [   23.948714]  acpi_hotplug_work_fn+0x1a/0x30
> [   23.949433]  process_one_work+0x221/0x550
> [   23.950190]  worker_thread+0x50/0x3b0
> [   23.950993]  kthread+0x105/0x140
> [   23.951644]  ? process_one_work+0x550/0x550
> [   23.952508]  ? kthread_park+0x80/0x80
> [   23.953367]  ret_from_fork+0x3a/0x50
> [   23.954025] Modules linked in:
> [   23.954613] CR2: 000000000000353d
> [   23.955248] ---[ end trace 93d982b1fb3e1a69 ]---
> 
> Instead, shrink the zones when offlining memory or when onlining failed.
> Introduce and use remove_pfn_range_from_zone(() for that. We now properly
> shrink the zones, even if we have DIMMs whereby
> - Some memory blocks fall into no zone (never onlined)
> - Some memory blocks fall into multiple zones (offlined+re-onlined)
> - Multiple memory blocks that fall into different zones
> 
> Drop the zone parameter (with a potential dubious value) from
> __remove_pages() and __remove_section().
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Tony Luck <tony.luck@intel.com>
> Cc: Fenghua Yu <fenghua.yu@intel.com>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Heiko Carstens <heiko.carstens@de.ibm.com>
> Cc: Vasily Gorbik <gor@linux.ibm.com>
> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> Cc: Rich Felker <dalias@libc.org>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: Andy Lutomirski <luto@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: "H. Peter Anvin" <hpa@zytor.com>
> Cc: x86@kernel.org
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Steve Capper <steve.capper@arm.com>
> Cc: Mike Rapoport <rppt@linux.ibm.com>
> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
> Cc: Yu Zhao <yuzhao@google.com>
> Cc: Jun Yao <yaojun8558363@gmail.com>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: Oscar Salvador <osalvador@suse.de>
> Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> Cc: Christophe Leroy <christophe.leroy@c-s.fr>
> Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
> Cc: Pavel Tatashin <pasha.tatashin@soleen.com>
> Cc: Gerald Schaefer <gerald.schaefer@de.ibm.com>
> Cc: Halil Pasic <pasic@linux.ibm.com>
> Cc: Tom Lendacky <thomas.lendacky@amd.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: Wei Yang <richard.weiyang@gmail.com>
> Cc: Qian Cai <cai@lca.pw>
> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: Logan Gunthorpe <logang@deltatee.com>
> Cc: Ira Weiny <ira.weiny@intel.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-ia64@vger.kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-s390@vger.kernel.org
> Cc: linux-sh@vger.kernel.org
> Fixes: d0dc12e86b31 ("mm/memory_hotplug: optimize memory hotplug")

@Andrew, can you convert that to

Fixes: f1dd2cd13c4b ("mm, memory_hotplug: do not associate hotadded memory to zones until online") # visible after d0dc12e86b319

While adding cc'ing stable@vger.kernel.org # v4.13+ would be nice,
I doubt it will be easily possible to backport, as we are missing
some prereq patches (e.g., from Oscar like 2c2a5af6fed2 ("mm,
memory_hotplug: add nid parameter to arch_remove_memory")). But, it could
be done with some work.

I think "Cc: stable@vger.kernel.org # v5.0+" could be done more
easily. Maybe it's okay to not cc:stable this one. We usually
online all memory (except s390x), however, s390x does not remove that
memory ever. Devmem with driver reserved memory would be, however,
worth backporting this.

Thoughts?


-- 

Thanks,

David / dhildenb
