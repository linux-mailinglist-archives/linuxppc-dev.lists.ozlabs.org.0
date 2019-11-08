Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C8EF4001
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Nov 2019 06:32:12 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 478TRX10JkzF6kD
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Nov 2019 16:32:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::241;
 helo=mail-oi1-x241.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="RkTDhtjy"; 
 dkim-atps=neutral
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 478SyB0fHNzF3pV
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Nov 2019 16:10:01 +1100 (AEDT)
Received: by mail-oi1-x241.google.com with SMTP id v138so4187507oif.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 Nov 2019 21:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5hxLqM7wbQepnmpAkx3kQrqUx9W7V5kbuct3VgNLCfE=;
 b=RkTDhtjykB7j2cuaWtNSU3sVjWoWCIze54YYFBujyaWCIQJkapqLD4MeV2dhxoJWMC
 7xv0dkRHVnZYw3zW1L+ru2fry1bNNwjg7RgLcYQ3R76p8RcKcd+8i/rDWNxpbJmoe0cP
 mnziZ7Pb+0gfzkkbAysW5E2nHGmXIzy3yuQyUw867guN3bcJNvAgOPmHzqtFqwetCnH/
 e8probWK/BURthbe/OQp8zpLcy69QDF3nmw/997epMxX6jS1VTwSL6XvfsYPUS4fTA1T
 BXUEKElSBd6VBrdE1u2lF9amw29zsQk0lrhqLqMzdjSSMdojeG9wjbJQfzg4/TSptXIp
 GJXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5hxLqM7wbQepnmpAkx3kQrqUx9W7V5kbuct3VgNLCfE=;
 b=AK0Qd4VsIx0fGZcN6PVSg6j2pJDrUZOt8XeWD0IHcpPAeGv8EHgR7xlmXJLQuULZNs
 CQqgjDCoy/ZMm9oH+8mptsbG+sZOO5zEi6ilG8tTTrXRcN6x6w9thVIWDXtu0cL0uItk
 57jX2LoKr0sAFzAC8YF6XBCynUTye4SUR3f9/FM1cNl/V8pQnYIJhdkoPlgXBpMpLSOh
 b/8augCEQ1ocPj4btdSU4OkQPNpQyMgi6iSbaK69lfPEvnf/JT2M7qDJuqgk0fSK6MBr
 4FV0G1JPGX8yhH8GTrim/9EmcSCcO3TuAkeAYycbu9f7JrCBJ/9IizK+SWUloUL2MRfT
 xwGg==
X-Gm-Message-State: APjAAAUj6TaV43Tgq1/RRXjK6G5c9dxUY8NGYtV2MFfo1LPpWDaibCy0
 Xmw/zMw2cpcHen6vVTojdw9lib5LU7WMDJ8+PRhdHA==
X-Google-Smtp-Source: APXvYqykH4Y+YpdJn/i8XOAkjaabFQF8UbaSg/jnSgqkUxCA1/ca81jEPmL8H19fMIeKE0KMVQC/PCci0jvS512PO8A=
X-Received: by 2002:aca:55c1:: with SMTP id j184mr7906855oib.105.1573189797950; 
 Thu, 07 Nov 2019 21:09:57 -0800 (PST)
MIME-Version: 1.0
References: <CAPcyv4hxs+KqY5gU8Ds1a73eub1imvm9Qo8KdKGiDD1e-p0cww@mail.gmail.com>
 <DF536BED-6F4F-4351-AC7E-3C9FC8545332@redhat.com>
 <0eb001e0-bb26-59bb-c514-d2f8a86a7eab@redhat.com>
In-Reply-To: <0eb001e0-bb26-59bb-c514-d2f8a86a7eab@redhat.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Thu, 7 Nov 2019 21:09:46 -0800
Message-ID: <CAPcyv4h0yX4g6ETymQEpp52FFLaOmps_hO7w_yuYGk7BqQQcMQ@mail.gmail.com>
Subject: Re: [PATCH v1 04/10] vfio/type1: Prepare is_invalid_reserved_pfn()
 for PG_reserved changes
To: David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 08 Nov 2019 16:30:19 +1100
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
 =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>,
 KVM list <kvm@vger.kernel.org>, Pavel Tatashin <pavel.tatashin@microsoft.com>,
 KarimAllah Ahmed <karahmed@amazon.de>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Alexander Duyck <alexander.duyck@gmail.com>, Michal Hocko <mhocko@kernel.org>,
 Linux MM <linux-mm@kvack.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Wanpeng Li <wanpengli@tencent.com>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Thomas Gleixner <tglx@linutronix.de>,
 Kees Cook <keescook@chromium.org>, devel@driverdev.osuosl.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Joerg Roedel <joro@8bytes.org>, X86 ML <x86@kernel.org>,
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
 Mike Rapoport <rppt@linux.vnet.ibm.com>,
 David Hildenbrand <dhildenb@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Andy Lutomirski <luto@kernel.org>, xen-devel <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Allison Randal <allison@lohutok.net>,
 Jim Mattson <jmattson@google.com>, Mel Gorman <mgorman@techsingularity.net>,
 Cornelia Huck <cohuck@redhat.com>, Pavel Tatashin <pasha.tatashin@soleen.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Borislav Petkov <bp@alien8.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Nov 7, 2019 at 2:07 PM David Hildenbrand <david@redhat.com> wrote:
>
> On 07.11.19 19:22, David Hildenbrand wrote:
> >
> >
> >> Am 07.11.2019 um 16:40 schrieb Dan Williams <dan.j.williams@intel.com>=
:
> >>
> >> =EF=BB=BFOn Thu, Oct 24, 2019 at 5:12 AM David Hildenbrand <david@redh=
at.com> wrote:
> >>>
> >>> Right now, ZONE_DEVICE memory is always set PG_reserved. We want to
> >>> change that.
> >>>
> >>> KVM has this weird use case that you can map anything from /dev/mem
> >>> into the guest. pfn_valid() is not a reliable check whether the memma=
p
> >>> was initialized and can be touched. pfn_to_online_page() makes sure
> >>> that we have an initialized memmap (and don't have ZONE_DEVICE memory=
).
> >>>
> >>> Rewrite is_invalid_reserved_pfn() similar to kvm_is_reserved_pfn() to=
 make
> >>> sure the function produces the same result once we stop setting ZONE_=
DEVICE
> >>> pages PG_reserved.
> >>>
> >>> Cc: Alex Williamson <alex.williamson@redhat.com>
> >>> Cc: Cornelia Huck <cohuck@redhat.com>
> >>> Signed-off-by: David Hildenbrand <david@redhat.com>
> >>> ---
> >>> drivers/vfio/vfio_iommu_type1.c | 10 ++++++++--
> >>> 1 file changed, 8 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iomm=
u_type1.c
> >>> index 2ada8e6cdb88..f8ce8c408ba8 100644
> >>> --- a/drivers/vfio/vfio_iommu_type1.c
> >>> +++ b/drivers/vfio/vfio_iommu_type1.c
> >>> @@ -299,9 +299,15 @@ static int vfio_lock_acct(struct vfio_dma *dma, =
long npage, bool async)
> >>>   */
> >>> static bool is_invalid_reserved_pfn(unsigned long pfn)
> >>> {
> >>> -       if (pfn_valid(pfn))
> >>> -               return PageReserved(pfn_to_page(pfn));
> >>> +       struct page *page =3D pfn_to_online_page(pfn);
> >>
> >> Ugh, I just realized this is not a safe conversion until
> >> pfn_to_online_page() is moved over to subsection granularity. As it
> >> stands it will return true for any ZONE_DEVICE pages that share a
> >> section with boot memory.
> >
> > That should not happen right now and I commented back when you introduc=
ed subsection support that I don=E2=80=99t want to have ZONE_DEVICE mixed w=
ith online pages in a section. Having memory block devices that partially s=
pan ZONE_DEVICE would be ... really weird. With something like pfn_active()=
 - as discussed - we could at least make this check work - but I am not sur=
e if we really want to go down that path. In the worst case, some MB of RAM=
 are lost ... I guess this needs more thought.
> >
>
> I just realized the "boot memory" part. Is that a real thing? IOW, can
> we have ZONE_DEVICE falling into a memory block (with holes)? I somewhat
> have doubts that this would work ...

One of the real world failure cases that started the subsection effect
is that Persistent Memory collides with System RAM on a 64MB boundary
on shipping platforms. System RAM ends on a 64MB boundary and due to a
lack of memory controller resources PMEM is mapped contiguously at the
end of that boundary. Some more details in the subsection cover letter
/ changelogs [1] [2]. It's not sufficient to just lose some memory,
that's the broken implementation that lead to the subsection work
because the lost memory may change from one boot to the next and
software can't reliably inject a padding that conforms to the x86
128MB section constraint.

Suffice to say I think we need your pfn_active() to get subsection
granularity pfn_to_online_page() before PageReserved() can be removed.

[1]: https://lore.kernel.org/linux-mm/156092349300.979959.17603710711957735=
135.stgit@dwillia2-desk3.amr.corp.intel.com/
[2]: https://lore.kernel.org/linux-mm/156092354368.979959.62324439234409523=
59.stgit@dwillia2-desk3.amr.corp.intel.com/
