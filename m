Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C08E0B6E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Oct 2019 20:30:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46yMWN3HQtzDqMN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Oct 2019 05:30:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.61;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.b="Mu/wPKo5"; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46yKqg469gzDqLx
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Oct 2019 04:14:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571764461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RJLxUYZkphEfv5+PiNRBYPJsBqxuoPsQs816P7mVHAI=;
 b=Mu/wPKo5RtvUuNRJZ9sinwv0ot8/qTb0saRb828KW5NhpgkWYlVrGdKkCjRu46KLJAJwE7
 TlQ4wiGv+Boi+M39U+2qbQ8waQb61iQAVrR3MX5/vllnDukrj34FircnVlhjkJ4ryU2Y1b
 FFXd+Ity1kizJHN/ai33TGeEhqJuiFs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-196-LQ7sslTiPc68PqWCypqf4g-1; Tue, 22 Oct 2019 13:14:18 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C3CE880183D;
 Tue, 22 Oct 2019 17:14:13 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-116-248.ams2.redhat.com [10.36.116.248])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 83D8F5ED21;
 Tue, 22 Oct 2019 17:13:53 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH RFC v1 03/12] KVM: x86/mmu: Prepare kvm_is_mmio_pfn() for
 PG_reserved changes
Date: Tue, 22 Oct 2019 19:12:30 +0200
Message-Id: <20191022171239.21487-4-david@redhat.com>
In-Reply-To: <20191022171239.21487-1-david@redhat.com>
References: <20191022171239.21487-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: LQ7sslTiPc68PqWCypqf4g-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 23 Oct 2019 05:28:43 +1100
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

Right now, ZONE_DEVICE memory is always set PG_reserved. We want to
change that.

KVM has this weird use case that you can map anything from /dev/mem
into the guest. pfn_valid() is not a reliable check whether the memmap
was initialized and can be touched. pfn_to_online_page() makes sure
that we have an initialized memmap - however, there is no reliable and
fast check to detect memmaps that were initialized and are ZONE_DEVICE.

Let's rewrite kvm_is_mmio_pfn() so we really only touch initialized
memmaps that are guaranteed to not contain garbage. Make sure that
RAM without a memmap is still not detected as MMIO and that ZONE_DEVICE
that is not UC/UC-/WC is not detected as MMIO.

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
 arch/x86/kvm/mmu.c | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/arch/x86/kvm/mmu.c b/arch/x86/kvm/mmu.c
index 24c23c66b226..795869ffd4bb 100644
--- a/arch/x86/kvm/mmu.c
+++ b/arch/x86/kvm/mmu.c
@@ -2962,20 +2962,26 @@ static bool mmu_need_write_protect(struct kvm_vcpu =
*vcpu, gfn_t gfn,
=20
 static bool kvm_is_mmio_pfn(kvm_pfn_t pfn)
 {
+=09struct page *page =3D pfn_to_online_page(pfn);
+
+=09/*
+=09 * Online pages consist of pages managed by the buddy. Especially,
+=09 * ZONE_DEVICE pages are never online. Online pages that are reserved
+=09 * indicate the zero page and MMIO pages.
+=09 */
+=09if (page)
+=09=09return !is_zero_pfn(pfn) && PageReserved(pfn_to_page(pfn));
+
+=09/*
+=09 * Anything with a valid memmap could be ZONE_DEVICE - or the
+=09 * memmap could be uninitialized. Treat only UC/UC-/WC pages as MMIO.
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

