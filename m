Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F87E3C49
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Oct 2019 21:46:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46zd6f1PFCzDqbG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2019 06:46:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.61;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.b="Mphi4odU"; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46zR0b0LdKzDqHv
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Oct 2019 23:10:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571919052;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qUw+4OUStTuaq5ok3fmgq6nv+XIwZUDTl4O246f/KSo=;
 b=Mphi4odUz6rpOo7NfySpzAq1zpgNhKwMBhQoLlCqnbY2G01htLXPEwLdGshy6syP9B2P5U
 jsYZp33qMxwNjyrCNQ9Xhz+t3t4YgMDOGwpirF/Ha+jU+fryTpfjPbfhlC2IlpyhMAt0gM
 iHO6pBUIpg3bFN/yOVzeO/Ow/rmq04w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-KwvfWgdbN8Olk7KAgSZhkg-1; Thu, 24 Oct 2019 08:10:50 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 274885E4;
 Thu, 24 Oct 2019 12:10:43 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-116-141.ams2.redhat.com [10.36.116.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 70C261C93D;
 Thu, 24 Oct 2019 12:10:23 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 02/10] KVM: x86/mmu: Prepare kvm_is_mmio_pfn() for
 PG_reserved changes
Date: Thu, 24 Oct 2019 14:09:30 +0200
Message-Id: <20191024120938.11237-3-david@redhat.com>
In-Reply-To: <20191024120938.11237-1-david@redhat.com>
References: <20191024120938.11237-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: KwvfWgdbN8Olk7KAgSZhkg-1
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

Right now, ZONE_DEVICE memory is always set PG_reserved. We want to
change that.

KVM has this weird use case that you can map anything from /dev/mem
into the guest. pfn_valid() is not a reliable check whether the memmap
was initialized and can be touched. pfn_to_online_page() makes sure
that we have an initialized memmap (and don't have ZONE_DEVICE memory).

Rewrite kvm_is_mmio_pfn() to make sure the function produces the
same result once we stop setting ZONE_DEVICE pages PG_reserved.

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Radim Kr=C4=8Dm=C3=A1=C5=99" <rkrcmar@redhat.com>
Cc: Sean Christopherson <sean.j.christopherson@intel.com>
Cc: Vitaly Kuznetsov <vkuznets@redhat.com>
Cc: Wanpeng Li <wanpengli@tencent.com>
Cc: Jim Mattson <jmattson@google.com>
Cc: Joerg Roedel <joro@8bytes.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: KarimAllah Ahmed <karahmed@amazon.de>
Cc: Michal Hocko <mhocko@kernel.org>
Cc: Dan Williams <dan.j.williams@intel.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/x86/kvm/mmu.c | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/arch/x86/kvm/mmu.c b/arch/x86/kvm/mmu.c
index 24c23c66b226..f03089a336de 100644
--- a/arch/x86/kvm/mmu.c
+++ b/arch/x86/kvm/mmu.c
@@ -2962,20 +2962,25 @@ static bool mmu_need_write_protect(struct kvm_vcpu =
*vcpu, gfn_t gfn,
=20
 static bool kvm_is_mmio_pfn(kvm_pfn_t pfn)
 {
+=09struct page *page =3D pfn_to_online_page(pfn);
+
+=09/*
+=09 * ZONE_DEVICE pages are never online. Online pages that are reserved
+=09 * either indicate the zero page or MMIO pages.
+=09 */
+=09if (page)
+=09=09return !is_zero_pfn(pfn) && PageReserved(pfn_to_page(pfn));
+
+=09/*
+=09 * Anything with a valid (but not online) memmap could be ZONE_DEVICE.
+=09 * Treat only UC/UC-/WC pages as MMIO.
+=09 */
 =09if (pfn_valid(pfn))
-=09=09return !is_zero_pfn(pfn) && PageReserved(pfn_to_page(pfn)) &&
-=09=09=09/*
-=09=09=09 * Some reserved pages, such as those from NVDIMM
-=09=09=09 * DAX devices, are not for MMIO, and can be mapped
-=09=09=09 * with cached memory type for better performance.
-=09=09=09 * However, the above check misconceives those pages
-=09=09=09 * as MMIO, and results in KVM mapping them with UC
-=09=09=09 * memory type, which would hurt the performance.
-=09=09=09 * Therefore, we check the host memory type in addition
-=09=09=09 * and only treat UC/UC-/WC pages as MMIO.
-=09=09=09 */
-=09=09=09(!pat_enabled() || pat_pfn_immune_to_uc_mtrr(pfn));
+=09=09return !pat_enabled() || pat_pfn_immune_to_uc_mtrr(pfn);
=20
+=09/*
+=09 * Any RAM that has no memmap (e.g., mapped via /dev/mem) is not MMIO.
+=09 */
 =09return !e820__mapped_raw_any(pfn_to_hpa(pfn),
 =09=09=09=09     pfn_to_hpa(pfn + 1) - 1,
 =09=09=09=09     E820_TYPE_RAM);
--=20
2.21.0

