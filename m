Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A271DE69F0
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Oct 2019 23:47:53 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 471Y063Ng8zDqjV
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Oct 2019 09:47:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.120;
 helo=us-smtp-1.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.b="YxYOUXzU"; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 471XyJ38NWzDqLs
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Oct 2019 09:46:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572216373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xbONmXfMgjTTjP5lUtc+Vbz1sXx0PyY8Msu3dt75em4=;
 b=YxYOUXzUm4J/K9Z7GB0tG5RmxrLR420ZaLAP+nhS1GCtre+dnDOOQOPSTB0XDAWqgBNnrF
 s7CAmpwM+/VSMLEkzgt3WR1qDC6vAVJLVsn+lbZPEzTZFV7Gp7rU1eucoFCENLo2TUg6x0
 7BjfKGO3KyjreHUitqrIKYX2THbtVww=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-186-OJtPJs8jNV6WP_OP78Edqw-1; Sun, 27 Oct 2019 18:46:11 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9A6381005509;
 Sun, 27 Oct 2019 22:46:05 +0000 (UTC)
Received: from [10.36.116.60] (ovpn-116-60.ams2.redhat.com [10.36.116.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C84C619C68;
 Sun, 27 Oct 2019 22:45:53 +0000 (UTC)
Subject: Re: [PATCH v6 05/10] mm/memory_hotplug: Shrink zones when offlining
 memory
To: linux-kernel@vger.kernel.org
References: <20191006085646.5768-1-david@redhat.com>
 <20191006085646.5768-6-david@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <f75caf18-ff5f-8a29-7069-8ce783389644@redhat.com>
Date: Sun, 27 Oct 2019 23:45:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191006085646.5768-6-david@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: OJtPJs8jNV6WP_OP78Edqw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
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
 Logan Gunthorpe <logang@deltatee.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Qian Cai <cai@lca.pw>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 06.10.19 10:56, David Hildenbrand wrote:
> We currently try to shrink a single zone when removing memory. We use the
> zone of the first page of the memory we are removing. If that memmap was
> never initialized (e.g., memory was never onlined), we will read garbage
> and can trigger kernel BUGs (due to a stale pointer):
>=20
> :/# [   23.912993] BUG: unable to handle page fault for address: 00000000=
0000353d
> [   23.914219] #PF: supervisor write access in kernel mode
> [   23.915199] #PF: error_code(0x0002) - not-present page
> [   23.916160] PGD 0 P4D 0
> [   23.916627] Oops: 0002 [#1] SMP PTI
> [   23.917256] CPU: 1 PID: 7 Comm: kworker/u8:0 Not tainted 5.3.0-rc5-nex=
t-20190820+ #317
> [   23.918900] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S rel-1.12.1-0-ga5cab58e9a3f-prebuilt.qemu.4
> [   23.921194] Workqueue: kacpi_hotplug acpi_hotplug_work_fn
> [   23.922249] RIP: 0010:clear_zone_contiguous+0x5/0x10
> [   23.923173] Code: 48 89 c6 48 89 c3 e8 2a fe ff ff 48 85 c0 75 cf 5b 5=
d c3 c6 85 fd 05 00 00 01 5b 5d c3 0f 1f 840
> [   23.926876] RSP: 0018:ffffad2400043c98 EFLAGS: 00010246
> [   23.927928] RAX: 0000000000000000 RBX: 0000000200000000 RCX: 000000000=
0000000
> [   23.929458] RDX: 0000000000200000 RSI: 0000000000140000 RDI: 000000000=
0002f40
> [   23.930899] RBP: 0000000140000000 R08: 0000000000000000 R09: 000000000=
0000001
> [   23.932362] R10: 0000000000000000 R11: 0000000000000000 R12: 000000000=
0140000
> [   23.933603] R13: 0000000000140000 R14: 0000000000002f40 R15: ffff9e3e7=
aff3680
> [   23.934913] FS:  0000000000000000(0000) GS:ffff9e3e7bb00000(0000) knlG=
S:0000000000000000
> [   23.936294] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   23.937481] CR2: 000000000000353d CR3: 0000000058610000 CR4: 000000000=
00006e0
> [   23.938687] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 000000000=
0000000
> [   23.939889] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 000000000=
0000400
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
>=20
> Instead, shrink the zones when offlining memory or when onlining failed.
> Introduce and use remove_pfn_range_from_zone(() for that. We now properly
> shrink the zones, even if we have DIMMs whereby
> - Some memory blocks fall into no zone (never onlined)
> - Some memory blocks fall into multiple zones (offlined+re-onlined)
> - Multiple memory blocks that fall into different zones
>=20
> Drop the zone parameter (with a potential dubious value) from
> __remove_pages() and __remove_section().
>=20
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
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>   arch/arm64/mm/mmu.c            |  4 +---
>   arch/ia64/mm/init.c            |  4 +---
>   arch/powerpc/mm/mem.c          |  3 +--
>   arch/s390/mm/init.c            |  4 +---
>   arch/sh/mm/init.c              |  4 +---
>   arch/x86/mm/init_32.c          |  4 +---
>   arch/x86/mm/init_64.c          |  4 +---
>   include/linux/memory_hotplug.h |  7 +++++--
>   mm/memory_hotplug.c            | 31 ++++++++++++++++---------------
>   mm/memremap.c                  |  2 +-
>   10 files changed, 29 insertions(+), 38 deletions(-)
>=20
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index 60c929f3683b..d10247fab0fd 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -1069,7 +1069,6 @@ void arch_remove_memory(int nid, u64 start, u64 siz=
e,
>   {
>   =09unsigned long start_pfn =3D start >> PAGE_SHIFT;
>   =09unsigned long nr_pages =3D size >> PAGE_SHIFT;
> -=09struct zone *zone;
>  =20
>   =09/*
>   =09 * FIXME: Cleanup page tables (also in arch_add_memory() in case
> @@ -1078,7 +1077,6 @@ void arch_remove_memory(int nid, u64 start, u64 siz=
e,
>   =09 * unplug. ARCH_ENABLE_MEMORY_HOTREMOVE must not be
>   =09 * unlocked yet.
>   =09 */
> -=09zone =3D page_zone(pfn_to_page(start_pfn));
> -=09__remove_pages(zone, start_pfn, nr_pages, altmap);
> +=09__remove_pages(start_pfn, nr_pages, altmap);
>   }
>   #endif
> diff --git a/arch/ia64/mm/init.c b/arch/ia64/mm/init.c
> index bf9df2625bc8..a6dd80a2c939 100644
> --- a/arch/ia64/mm/init.c
> +++ b/arch/ia64/mm/init.c
> @@ -689,9 +689,7 @@ void arch_remove_memory(int nid, u64 start, u64 size,
>   {
>   =09unsigned long start_pfn =3D start >> PAGE_SHIFT;
>   =09unsigned long nr_pages =3D size >> PAGE_SHIFT;
> -=09struct zone *zone;
>  =20
> -=09zone =3D page_zone(pfn_to_page(start_pfn));
> -=09__remove_pages(zone, start_pfn, nr_pages, altmap);
> +=09__remove_pages(start_pfn, nr_pages, altmap);
>   }
>   #endif
> diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
> index be941d382c8d..97e5922cb52e 100644
> --- a/arch/powerpc/mm/mem.c
> +++ b/arch/powerpc/mm/mem.c
> @@ -130,10 +130,9 @@ void __ref arch_remove_memory(int nid, u64 start, u6=
4 size,
>   {
>   =09unsigned long start_pfn =3D start >> PAGE_SHIFT;
>   =09unsigned long nr_pages =3D size >> PAGE_SHIFT;
> -=09struct page *page =3D pfn_to_page(start_pfn) + vmem_altmap_offset(alt=
map);
>   =09int ret;
>  =20
> -=09__remove_pages(page_zone(page), start_pfn, nr_pages, altmap);
> +=09__remove_pages(start_pfn, nr_pages, altmap);
>  =20
>   =09/* Remove htab bolted mappings for this section of memory */
>   =09start =3D (unsigned long)__va(start);
> diff --git a/arch/s390/mm/init.c b/arch/s390/mm/init.c
> index a124f19f7b3c..c1d96e588152 100644
> --- a/arch/s390/mm/init.c
> +++ b/arch/s390/mm/init.c
> @@ -291,10 +291,8 @@ void arch_remove_memory(int nid, u64 start, u64 size=
,
>   {
>   =09unsigned long start_pfn =3D start >> PAGE_SHIFT;
>   =09unsigned long nr_pages =3D size >> PAGE_SHIFT;
> -=09struct zone *zone;
>  =20
> -=09zone =3D page_zone(pfn_to_page(start_pfn));
> -=09__remove_pages(zone, start_pfn, nr_pages, altmap);
> +=09__remove_pages(start_pfn, nr_pages, altmap);
>   =09vmem_remove_mapping(start, size);
>   }
>   #endif /* CONFIG_MEMORY_HOTPLUG */
> diff --git a/arch/sh/mm/init.c b/arch/sh/mm/init.c
> index dfdbaa50946e..d1b1ff2be17a 100644
> --- a/arch/sh/mm/init.c
> +++ b/arch/sh/mm/init.c
> @@ -434,9 +434,7 @@ void arch_remove_memory(int nid, u64 start, u64 size,
>   {
>   =09unsigned long start_pfn =3D PFN_DOWN(start);
>   =09unsigned long nr_pages =3D size >> PAGE_SHIFT;
> -=09struct zone *zone;
>  =20
> -=09zone =3D page_zone(pfn_to_page(start_pfn));
> -=09__remove_pages(zone, start_pfn, nr_pages, altmap);
> +=09__remove_pages(start_pfn, nr_pages, altmap);
>   }
>   #endif /* CONFIG_MEMORY_HOTPLUG */
> diff --git a/arch/x86/mm/init_32.c b/arch/x86/mm/init_32.c
> index 930edeb41ec3..0a74407ef92e 100644
> --- a/arch/x86/mm/init_32.c
> +++ b/arch/x86/mm/init_32.c
> @@ -865,10 +865,8 @@ void arch_remove_memory(int nid, u64 start, u64 size=
,
>   {
>   =09unsigned long start_pfn =3D start >> PAGE_SHIFT;
>   =09unsigned long nr_pages =3D size >> PAGE_SHIFT;
> -=09struct zone *zone;
>  =20
> -=09zone =3D page_zone(pfn_to_page(start_pfn));
> -=09__remove_pages(zone, start_pfn, nr_pages, altmap);
> +=09__remove_pages(start_pfn, nr_pages, altmap);
>   }
>   #endif
>  =20
> diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
> index a6b5c653727b..b8541d77452c 100644
> --- a/arch/x86/mm/init_64.c
> +++ b/arch/x86/mm/init_64.c
> @@ -1212,10 +1212,8 @@ void __ref arch_remove_memory(int nid, u64 start, =
u64 size,
>   {
>   =09unsigned long start_pfn =3D start >> PAGE_SHIFT;
>   =09unsigned long nr_pages =3D size >> PAGE_SHIFT;
> -=09struct page *page =3D pfn_to_page(start_pfn) + vmem_altmap_offset(alt=
map);
> -=09struct zone *zone =3D page_zone(page);
>  =20
> -=09__remove_pages(zone, start_pfn, nr_pages, altmap);
> +=09__remove_pages(start_pfn, nr_pages, altmap);
>   =09kernel_physical_mapping_remove(start, start + size);
>   }
>   #endif /* CONFIG_MEMORY_HOTPLUG */
> diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplu=
g.h
> index bc477e98a310..517b70943732 100644
> --- a/include/linux/memory_hotplug.h
> +++ b/include/linux/memory_hotplug.h
> @@ -126,8 +126,8 @@ static inline bool movable_node_is_enabled(void)
>  =20
>   extern void arch_remove_memory(int nid, u64 start, u64 size,
>   =09=09=09       struct vmem_altmap *altmap);
> -extern void __remove_pages(struct zone *zone, unsigned long start_pfn,
> -=09=09=09   unsigned long nr_pages, struct vmem_altmap *altmap);
> +extern void __remove_pages(unsigned long start_pfn, unsigned long nr_pag=
es,
> +=09=09=09   struct vmem_altmap *altmap);
>  =20
>   /* reasonably generic interface to expand the physical pages */
>   extern int __add_pages(int nid, unsigned long start_pfn, unsigned long =
nr_pages,
> @@ -346,6 +346,9 @@ extern int add_memory(int nid, u64 start, u64 size);
>   extern int add_memory_resource(int nid, struct resource *resource);
>   extern void move_pfn_range_to_zone(struct zone *zone, unsigned long sta=
rt_pfn,
>   =09=09unsigned long nr_pages, struct vmem_altmap *altmap);
> +extern void remove_pfn_range_from_zone(struct zone *zone,
> +=09=09=09=09       unsigned long start_pfn,
> +=09=09=09=09       unsigned long nr_pages);
>   extern bool is_memblock_offlined(struct memory_block *mem);
>   extern int sparse_add_section(int nid, unsigned long pfn,
>   =09=09unsigned long nr_pages, struct vmem_altmap *altmap);
> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
> index f96608d24f6a..5b003ffa5dc9 100644
> --- a/mm/memory_hotplug.c
> +++ b/mm/memory_hotplug.c
> @@ -457,8 +457,9 @@ static void update_pgdat_span(struct pglist_data *pgd=
at)
>   =09pgdat->node_spanned_pages =3D node_end_pfn - node_start_pfn;
>   }
>  =20
> -static void __remove_zone(struct zone *zone, unsigned long start_pfn,
> -=09=09unsigned long nr_pages)
> +void __ref remove_pfn_range_from_zone(struct zone *zone,
> +=09=09=09=09      unsigned long start_pfn,
> +=09=09=09=09      unsigned long nr_pages)
>   {
>   =09struct pglist_data *pgdat =3D zone->zone_pgdat;
>   =09unsigned long flags;
> @@ -473,28 +474,30 @@ static void __remove_zone(struct zone *zone, unsign=
ed long start_pfn,
>   =09=09return;
>   #endif
>  =20
> +=09clear_zone_contiguous(zone);
> +
>   =09pgdat_resize_lock(zone->zone_pgdat, &flags);
>   =09shrink_zone_span(zone, start_pfn, start_pfn + nr_pages);
>   =09update_pgdat_span(pgdat);
>   =09pgdat_resize_unlock(zone->zone_pgdat, &flags);
> +
> +=09set_zone_contiguous(zone);
>   }
>  =20
> -static void __remove_section(struct zone *zone, unsigned long pfn,
> -=09=09unsigned long nr_pages, unsigned long map_offset,
> -=09=09struct vmem_altmap *altmap)
> +static void __remove_section(unsigned long pfn, unsigned long nr_pages,
> +=09=09=09     unsigned long map_offset,
> +=09=09=09     struct vmem_altmap *altmap)
>   {
>   =09struct mem_section *ms =3D __nr_to_section(pfn_to_section_nr(pfn));
>  =20
>   =09if (WARN_ON_ONCE(!valid_section(ms)))
>   =09=09return;
>  =20
> -=09__remove_zone(zone, pfn, nr_pages);
>   =09sparse_remove_section(ms, pfn, nr_pages, map_offset, altmap);
>   }
>  =20
>   /**
> - * __remove_pages() - remove sections of pages from a zone
> - * @zone: zone from which pages need to be removed
> + * __remove_pages() - remove sections of pages
>    * @pfn: starting pageframe (must be aligned to start of a section)
>    * @nr_pages: number of pages to remove (must be multiple of section si=
ze)
>    * @altmap: alternative device page map or %NULL if default memmap is u=
sed
> @@ -504,16 +507,14 @@ static void __remove_section(struct zone *zone, uns=
igned long pfn,
>    * sure that pages are marked reserved and zones are adjust properly by
>    * calling offline_pages().
>    */
> -void __remove_pages(struct zone *zone, unsigned long pfn,
> -=09=09    unsigned long nr_pages, struct vmem_altmap *altmap)
> +void __remove_pages(unsigned long pfn, unsigned long nr_pages,
> +=09=09    struct vmem_altmap *altmap)
>   {
>   =09unsigned long map_offset =3D 0;
>   =09unsigned long nr, start_sec, end_sec;
>  =20
>   =09map_offset =3D vmem_altmap_offset(altmap);
>  =20
> -=09clear_zone_contiguous(zone);
> -
>   =09if (check_pfn_span(pfn, nr_pages, "remove"))
>   =09=09return;
>  =20
> @@ -525,13 +526,11 @@ void __remove_pages(struct zone *zone, unsigned lon=
g pfn,
>   =09=09cond_resched();
>   =09=09pfns =3D min(nr_pages, PAGES_PER_SECTION
>   =09=09=09=09- (pfn & ~PAGE_SECTION_MASK));
> -=09=09__remove_section(zone, pfn, pfns, map_offset, altmap);
> +=09=09__remove_section(pfn, pfns, map_offset, altmap);
>   =09=09pfn +=3D pfns;
>   =09=09nr_pages -=3D pfns;
>   =09=09map_offset =3D 0;
>   =09}
> -
> -=09set_zone_contiguous(zone);
>   }
>  =20
>   int set_online_page_callback(online_page_callback_t callback)
> @@ -859,6 +858,7 @@ int __ref online_pages(unsigned long pfn, unsigned lo=
ng nr_pages, int online_typ
>   =09=09 (unsigned long long) pfn << PAGE_SHIFT,
>   =09=09 (((unsigned long long) pfn + nr_pages) << PAGE_SHIFT) - 1);
>   =09memory_notify(MEM_CANCEL_ONLINE, &arg);
> +=09remove_pfn_range_from_zone(zone, pfn, nr_pages);
>   =09mem_hotplug_done();
>   =09return ret;
>   }
> @@ -1605,6 +1605,7 @@ static int __ref __offline_pages(unsigned long star=
t_pfn,
>   =09writeback_set_ratelimit();
>  =20
>   =09memory_notify(MEM_OFFLINE, &arg);
> +=09remove_pfn_range_from_zone(zone, start_pfn, nr_pages);
>   =09mem_hotplug_done();
>   =09return 0;
>  =20
> diff --git a/mm/memremap.c b/mm/memremap.c
> index 8c2fb44c3b4d..70263e6f093e 100644
> --- a/mm/memremap.c
> +++ b/mm/memremap.c
> @@ -140,7 +140,7 @@ void memunmap_pages(struct dev_pagemap *pgmap)
>  =20
>   =09mem_hotplug_begin();
>   =09if (pgmap->type =3D=3D MEMORY_DEVICE_PRIVATE) {
> -=09=09__remove_pages(page_zone(first_page), PHYS_PFN(res->start),
> +=09=09__remove_pages(PHYS_PFN(res->start),
>   =09=09=09       PHYS_PFN(resource_size(res)), NULL);
>   =09} else {
>   =09=09arch_remove_memory(nid, res->start, resource_size(res),
>=20

I think I just found an issue with try_offline_node().=20
try_offline_node() is pretty much broken already (touches garbage=20
memmaps and will not considers mixed NIDs within sections), however,=20
relies on the node span to look for memory sections to probe. So it=20
seems to rely on the nodes getting shrunk when removing memory, not when=20
offlining.

As we shrink the node span when offlining now and not when removing,=20
this can go wrong once we offline the last memory block of the node and=20
offline the last CPU. We could still have memory around that we could=20
re-online, however, the node would already be offline. Unlikely, but=20
possible.

Note that the same is also broken without this patch in case memory is=20
never onlined. The "pfn_to_nid(pfn) !=3D nid" can easily succeed on the=20
garbage memmap, resulting in  no memory being detected as belonging to=20
the node. Also, resize_pgdat_range() is called when onlining memory, not=20
when adding it. :/ Oh this is so broken :)

The right fix is probably to walk over all memory blocks that could=20
exist and test if they belong to the nid (if offline, check the=20
block->nid, if online check all pageblocks). A fix we can then move in=20
front of this patch.

Will look into this this week.

--=20

Thanks,

David / dhildenb

