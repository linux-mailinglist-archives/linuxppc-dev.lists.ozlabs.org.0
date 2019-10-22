Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A07A2E0C02
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Oct 2019 20:53:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46yN1p6tnkzDqHn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Oct 2019 05:53:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.61;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.b="WlfE/fAg"; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46yKxf406nzDqBj
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Oct 2019 04:19:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571764771;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=lOu6AQP2dyv/4LtgwGlaMv6HFBAdtkUQmm1EyLtCFNM=;
 b=WlfE/fAgpu6xvGEhlRS7s6dfRMZLePA5IYyYYYajMqg5uT8bnRHGyYLtuVKxCaUqBXygjj
 aRFqfncJ3TmllzIiwauYOIL8C9FAnJOZkjHN9Yl5FGUbN61Fu6bFF6mvRVKUeDpurVwveZ
 FL4NsvbsjkePidnW17S9eZyDvVOqCt0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-9EHfARfbNLK-zZYBJq1aBA-1; Tue, 22 Oct 2019 13:13:15 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7918A47B;
 Tue, 22 Oct 2019 17:13:07 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-116-248.ams2.redhat.com [10.36.116.248])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5B8BC5DD79;
 Tue, 22 Oct 2019 17:12:40 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH RFC v1 00/12] mm: Don't mark hotplugged pages PG_reserved
 (including ZONE_DEVICE)
Date: Tue, 22 Oct 2019 19:12:27 +0200
Message-Id: <20191022171239.21487-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: 9EHfARfbNLK-zZYBJq1aBA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 23 Oct 2019 05:28:44 +1100
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Sasha Levin <sashal@kernel.org>, linux-hyperv@vger.kernel.org,
 Michal Hocko <mhocko@suse.com>,
 =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@redhat.com>,
 kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>,
 KarimAllah Ahmed <karahmed@amazon.de>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Alexander Duyck <alexander.duyck@gmail.com>, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, Pavel Tatashin <pavel.tatashin@microsoft.com>,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Wanpeng Li <wanpengli@tencent.com>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Fabio Estevam <festevam@gmail.com>,
 Ben Chan <benchan@chromium.org>, Kees Cook <keescook@chromium.org>,
 devel@driverdev.osuosl.org, Stefano Stabellini <sstabellini@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Joerg Roedel <joro@8bytes.org>, x86@kernel.org,
 YueHaibing <yuehaibing@huawei.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Madhumitha Prabakaran <madhumithabiw@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Vlastimil Babka <vbabka@suse.cz>, Nishka Dasgupta <nishkadg.linux@gmail.com>,
 Anthony Yznaga <anthony.yznaga@oracle.com>, Oscar Salvador <osalvador@suse.de>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 "Isaac J. Manjarres" <isaacm@codeaurora.org>,
 Matt Sickler <Matt.Sickler@daktronics.com>, Juergen Gross <jgross@suse.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 =?UTF-8?q?Simon=20Sandstr=C3=B6m?= <simon@nikanor.nu>,
 Dan Williams <dan.j.williams@intel.com>, kvm-ppc@vger.kernel.org,
 Qian Cai <cai@lca.pw>, Alex Williamson <alex.williamson@redhat.com>,
 Mike Rapoport <rppt@linux.vnet.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Nicholas Piggin <npiggin@gmail.com>, Andy Lutomirski <luto@kernel.org>,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Todd Poynor <toddpoynor@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Allison Randal <allison@lohutok.net>, Jim Mattson <jmattson@google.com>,
 Vandana BN <bnvandana@gmail.com>, Jeremy Sowden <jeremy@azazel.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Cornelia Huck <cohuck@redhat.com>, Pavel Tatashin <pasha.tatashin@soleen.com>,
 Mel Gorman <mgorman@techsingularity.net>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Rob Springer <rspringer@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Johannes Weiner <hannes@cmpxchg.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series is based on [2], which should pop up in linux/next soon:
=09https://lkml.org/lkml/2019/10/21/1034

This is the result of a recent discussion with Michal ([1], [2]). Right
now we set all pages PG_reserved when initializing hotplugged memmaps. This
includes ZONE_DEVICE memory. In case of system memory, PG_reserved is
cleared again when onlining the memory, in case of ZONE_DEVICE memory
never. In ancient times, we needed PG_reserved, because there was no way
to tell whether the memmap was already properly initialized. We now have
SECTION_IS_ONLINE for that in the case of !ZONE_DEVICE memory. ZONE_DEVICE
memory is already initialized deferred, and there shouldn't be a visible
change in that regard.

I remember that some time ago, we already talked about stopping to set
ZONE_DEVICE pages PG_reserved on the list, but I never saw any patches.
Also, I forgot who was part of the discussion :)

One of the biggest fear were side effects. I went ahead and audited all
users of PageReserved(). The ones that don't need any care (patches)
can be found below. I will double check and hope I am not missing something
important.

I am probably a little bit too careful (but I don't want to break things).
In most places (besides KVM and vfio that are nuts), the
pfn_to_online_page() check could most probably be avoided by a
is_zone_device_page() check. However, I usually get suspicious when I see
a pfn_valid() check (especially after I learned that people mmap parts of
/dev/mem into user space, including memory without memmaps. Also, people
could memmap offline memory blocks this way :/). As long as this does not
hurt performance, I think we should rather do it the clean way.

I only gave it a quick test with DIMMs on x86-64, but didn't test the
ZONE_DEVICE part at all (any tips for a nice QEMU setup?). Compile-tested
on x86-64 and PPC.

Other users of PageReserved() that should be fine:
- mm/page_owner.c:pagetypeinfo_showmixedcount_print()
  -> Never called for ZONE_DEVICE, (+ pfn_to_online_page(pfn))
- mm/page_owner.c:init_pages_in_zone()
  -> Never called for ZONE_DEVICE (!populated_zone(zone))
- mm/page_ext.c:free_page_ext()
  -> Only a BUG_ON(PageReserved(page)), not relevant
- mm/page_ext.c:has_unmovable_pages()
  -> Not releveant for ZONE_DEVICE
- mm/page_ext.c:pfn_range_valid_contig()
  -> pfn_to_online_page() already guards us
- mm/mempolicy.c:queue_pages_pte_range()
  -> vm_normal_page() checks against pte_devmap()
- mm/memory-failure.c:hwpoison_user_mappings()
  -> Not reached via memory_failure() due to pfn_to_online_page()
  -> Also not reached indirectly via memory_failure_hugetlb()
- mm/hugetlb.c:gather_bootmem_prealloc()
  -> Only a WARN_ON(PageReserved(page)), not relevant
- kernel/power/snapshot.c:saveable_highmem_page()
  -> pfn_to_online_page() already guards us
- kernel/power/snapshot.c:saveable_page()
  -> pfn_to_online_page() already guards us
- fs/proc/task_mmu.c:can_gather_numa_stats()
  -> vm_normal_page() checks against pte_devmap()
- fs/proc/task_mmu.c:can_gather_numa_stats_pmd
  -> vm_normal_page_pmd() checks against pte_devmap()
- fs/proc/page.c:stable_page_flags()
  -> The reserved bit is simply copied, irrelevant
- drivers/firmware/memmap.c:release_firmware_map_entry()
  -> really only a check to detect bootmem. Not relevant for ZONE_DEVICE
- arch/ia64/kernel/mca_drv.c
- arch/mips/mm/init.c
- arch/mips/mm/ioremap.c
- arch/nios2/mm/ioremap.c
- arch/parisc/mm/ioremap.c
- arch/sparc/mm/tlb.c
- arch/xtensa/mm/cache.c
  -> No ZONE_DEVICE support
- arch/powerpc/mm/init_64.c:vmemmap_free()
  -> Special-cases memmap on altmap
  -> Only a check for bootmem
- arch/x86/kernel/alternative.c:__text_poke()
  -> Only a WARN_ON(!PageReserved(pages[0])) to verify it is bootmem
- arch/x86/mm/init_64.c
  -> Only a check for bootmem

[1] https://lkml.org/lkml/2019/10/21/736
[2] https://lkml.org/lkml/2019/10/21/1034

Cc: Michal Hocko <mhocko@kernel.org>
Cc: Dan Williams <dan.j.williams@intel.com
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: kvm-ppc@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: kvm@vger.kernel.org
Cc: linux-hyperv@vger.kernel.org
Cc: devel@driverdev.osuosl.org
Cc: xen-devel@lists.xenproject.org
Cc: x86@kernel.org
Cc: Alexander Duyck <alexander.duyck@gmail.com>

David Hildenbrand (12):
  mm/memory_hotplug: Don't allow to online/offline memory blocks with
    holes
  mm/usercopy.c: Prepare check_page_span() for PG_reserved changes
  KVM: x86/mmu: Prepare kvm_is_mmio_pfn() for PG_reserved changes
  KVM: Prepare kvm_is_reserved_pfn() for PG_reserved changes
  vfio/type1: Prepare is_invalid_reserved_pfn() for PG_reserved changes
  staging/gasket: Prepare gasket_release_page() for PG_reserved changes
  staging: kpc2000: Prepare transfer_complete_cb() for PG_reserved
    changes
  powerpc/book3s: Prepare kvmppc_book3s_instantiate_page() for
    PG_reserved changes
  powerpc/64s: Prepare hash_page_do_lazy_icache() for PG_reserved
    changes
  powerpc/mm: Prepare maybe_pte_to_page() for PG_reserved changes
  x86/mm: Prepare __ioremap_check_ram() for PG_reserved changes
  mm/memory_hotplug: Don't mark pages PG_reserved when initializing the
    memmap

 arch/powerpc/kvm/book3s_64_mmu_radix.c     | 14 ++++---
 arch/powerpc/mm/book3s64/hash_utils.c      | 10 +++--
 arch/powerpc/mm/pgtable.c                  | 10 +++--
 arch/x86/kvm/mmu.c                         | 30 +++++++++------
 arch/x86/mm/ioremap.c                      | 13 +++++--
 drivers/hv/hv_balloon.c                    |  6 +++
 drivers/staging/gasket/gasket_page_table.c |  2 +-
 drivers/staging/kpc2000/kpc_dma/fileops.c  |  3 +-
 drivers/vfio/vfio_iommu_type1.c            | 10 ++++-
 drivers/xen/balloon.c                      |  7 ++++
 include/linux/page-flags.h                 |  8 +---
 mm/memory_hotplug.c                        | 43 ++++++++++++++++------
 mm/page_alloc.c                            | 11 ------
 mm/usercopy.c                              |  5 ++-
 virt/kvm/kvm_main.c                        | 10 ++++-
 15 files changed, 115 insertions(+), 67 deletions(-)

--=20
2.21.0

