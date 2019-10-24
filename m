Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CC08AE3C3B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Oct 2019 21:43:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46zd294JJ7zDqJY
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2019 06:42:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.120;
 helo=us-smtp-1.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.b="MV95PON9"; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46zQzl3YTSzDqTq
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Oct 2019 23:10:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571919008;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=TooFwxaibKWioSMXkjdsd9KqTbD0P4TIgojllh09QfQ=;
 b=MV95PON9VMAJOC6c8dsscFeKqUiGlv6uvdFCLmGF2Wic3u0gcAskpmCqHLztGEIt3CJ+TM
 ch8U/EiehGGNZvheJW7dvWMgY5HaIfEsqQ6iM0+KoTZKAaWLPZRoS1RHFl8FoeW+F8as5t
 WYEue9EOkftDM7dwFbQQi7QqrFUOVgw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-70-Mt5vh3dPMhmZKGgS4b6ZRA-1; Thu, 24 Oct 2019 08:10:06 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 410A4801E5C;
 Thu, 24 Oct 2019 12:10:01 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-116-141.ams2.redhat.com [10.36.116.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 314413CCA;
 Thu, 24 Oct 2019 12:09:39 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 00/10] mm: Don't mark hotplugged pages PG_reserved
 (including ZONE_DEVICE)
Date: Thu, 24 Oct 2019 14:09:28 +0200
Message-Id: <20191024120938.11237-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: Mt5vh3dPMhmZKGgS4b6ZRA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 25 Oct 2019 06:41:16 +1100
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
Cc: linux-hyperv@vger.kernel.org, Michal Hocko <mhocko@suse.com>,
 =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@redhat.com>,
 kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>,
 KarimAllah Ahmed <karahmed@amazon.de>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Alexander Duyck <alexander.duyck@gmail.com>, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, Pavel Tatashin <pavel.tatashin@microsoft.com>,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Wanpeng Li <wanpengli@tencent.com>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Dan Williams <dan.j.williams@intel.com>, Kees Cook <keescook@chromium.org>,
 devel@driverdev.osuosl.org, Stefano Stabellini <sstabellini@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Joerg Roedel <joro@8bytes.org>, x86@kernel.org,
 YueHaibing <yuehaibing@huawei.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Vlastimil Babka <vbabka@suse.cz>,
 Anthony Yznaga <anthony.yznaga@oracle.com>, Oscar Salvador <osalvador@suse.de>,
 "Isaac J. Manjarres" <isaacm@codeaurora.org>,
 Matt Sickler <Matt.Sickler@daktronics.com>, Juergen Gross <jgross@suse.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Sasha Levin <sashal@kernel.org>,
 kvm-ppc@vger.kernel.org, Qian Cai <cai@lca.pw>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mike Rapoport <rppt@linux.vnet.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Nicholas Piggin <npiggin@gmail.com>, Andy Lutomirski <luto@kernel.org>,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Allison Randal <allison@lohutok.net>,
 Jim Mattson <jmattson@google.com>, Mel Gorman <mgorman@techsingularity.net>,
 Cornelia Huck <cohuck@redhat.com>, Pavel Tatashin <pasha.tatashin@soleen.com>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Johannes Weiner <hannes@cmpxchg.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is the result of a recent discussion with Michal ([1], [2]). Right
now we set all pages PG_reserved when initializing hotplugged memmaps. This
includes ZONE_DEVICE memory. In case of system memory, PG_reserved is
cleared again when onlining the memory, in case of ZONE_DEVICE memory
never.

In ancient times, we needed PG_reserved, because there was no way to tell
whether the memmap was already properly initialized. We now have
SECTION_IS_ONLINE for that in the case of !ZONE_DEVICE memory. ZONE_DEVICE
memory is already initialized deferred, and there shouldn't be a visible
change in that regard.

One of the biggest fears were side effects. I went ahead and audited all
users of PageReserved(). The details can be found in "mm/memory_hotplug:
Don't mark pages PG_reserved when initializing the memmap".

This patch set adapts all relevant users of PageReserved() to keep the
existing behavior in respect to ZONE_DEVICE pages. The biggest part part
that needs changes is KVM, to keep the existing behavior (that's all I
care about in this series).

Note that this series is able to rely completely on pfn_to_online_page().
No new is_zone_device_page() calles are introduced (as requested by Dan).
We are currently discussing a way to mark also ZONE_DEVICE memmaps as
active/initialized - pfn_active() - and lightweight locking to make sure
memmaps remain active (e.g., using RCU). We might later be able to convert
some suers of pfn_to_online_page() to pfn_active(). Details can be found
in [3], however, this represents yet another cleanup/fix we'll perform
on top of this cleanup.

I only gave it a quick test with DIMMs on x86-64, but didn't test the
ZONE_DEVICE part at all (any tips for a nice QEMU setup?). Also, I didn't
test the KVM parts (especially with ZONE_DEVICE pages or no memmap at all).
Compile-tested on x86-64 and PPC.

Based on next/master. The current version (kept updated) can be found at:
    https://github.com/davidhildenbrand/linux.git online_reserved_cleanup

RFC -> v1:
- Dropped "staging/gasket: Prepare gasket_release_page() for PG_reserved
  changes"
- Dropped "staging: kpc2000: Prepare transfer_complete_cb() for PG_reserved
  changes"
- Converted "mm/usercopy.c: Prepare check_page_span() for PG_reserved
  changes" to "mm/usercopy.c: Update comment in check_page_span()
  regarding ZONE_DEVICE"
- No new users of is_zone_device_page() are introduced.
- Rephrased comments and patch descriptions.

[1] https://lkml.org/lkml/2019/10/21/736
[2] https://lkml.org/lkml/2019/10/21/1034
[3] https://www.spinics.net/lists/linux-mm/msg194112.html

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

David Hildenbrand (10):
  mm/memory_hotplug: Don't allow to online/offline memory blocks with
    holes
  KVM: x86/mmu: Prepare kvm_is_mmio_pfn() for PG_reserved changes
  KVM: Prepare kvm_is_reserved_pfn() for PG_reserved changes
  vfio/type1: Prepare is_invalid_reserved_pfn() for PG_reserved changes
  powerpc/book3s: Prepare kvmppc_book3s_instantiate_page() for
    PG_reserved changes
  powerpc/64s: Prepare hash_page_do_lazy_icache() for PG_reserved
    changes
  powerpc/mm: Prepare maybe_pte_to_page() for PG_reserved changes
  x86/mm: Prepare __ioremap_check_ram() for PG_reserved changes
  mm/memory_hotplug: Don't mark pages PG_reserved when initializing the
    memmap
  mm/usercopy.c: Update comment in check_page_span() regarding
    ZONE_DEVICE

 arch/powerpc/kvm/book3s_64_mmu_radix.c | 14 +++++----
 arch/powerpc/mm/book3s64/hash_utils.c  | 10 +++---
 arch/powerpc/mm/pgtable.c              | 10 +++---
 arch/x86/kvm/mmu.c                     | 29 ++++++++++-------
 arch/x86/mm/ioremap.c                  | 13 ++++++--
 drivers/hv/hv_balloon.c                |  6 ++++
 drivers/vfio/vfio_iommu_type1.c        | 10 ++++--
 drivers/xen/balloon.c                  |  7 +++++
 include/linux/page-flags.h             |  8 +----
 mm/memory_hotplug.c                    | 43 +++++++++++++++++++-------
 mm/page_alloc.c                        | 11 -------
 mm/usercopy.c                          |  6 ++--
 virt/kvm/kvm_main.c                    | 10 ++++--
 13 files changed, 111 insertions(+), 66 deletions(-)

--=20
2.21.0

