Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F746F5CB7
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Nov 2019 02:29:01 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47900W0L7kzF6Qb
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Nov 2019 12:28:59 +1100 (AEDT)
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
 header.i=@intel-com.20150623.gappssmtp.com header.b="1d0D3cRq"; 
 dkim-atps=neutral
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 478phR1BM3zF6S4
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Nov 2019 05:29:20 +1100 (AEDT)
Received: by mail-oi1-x241.google.com with SMTP id y194so6109664oie.4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 08 Nov 2019 10:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=yngiQYr/7F6QKuY7vN6LC1DaelX21SW6WtIezPVX1cs=;
 b=1d0D3cRq9YmW+1yK/RE0DJ/UkPslFK9ZAtUlZvAmKEittn+5P29MLqMMstbFi6jxrj
 Ns+iC+3lEfqovG/2PeSjS3wVktY00J2VZo7ibdEFMbFztKpI1VGkrK4Z6kX7z5EzrUom
 bSTVU2MgPfHTpWNd+xSEyU8xK4V1kffBbeLvkwqwFJj8qpE4mYF7AJRg+qxJndVPhMij
 YrZFUYzgb9mQnIKiWG8Byr1keTk4OMIwDas2SXSrk7iFZyyCWOQnqkn+P1k9XRe9xeBr
 mL6RRd4GY0O+nfHuYs60Bo8b9/FTK1kKLaz6x7EetX7XNninU7M5eC1ph48V7wcf59eX
 ybUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yngiQYr/7F6QKuY7vN6LC1DaelX21SW6WtIezPVX1cs=;
 b=oo1d64fBV/+GHECEBt0OUm6qNYPbw9EQcmEh25k+HxX2OXIpV2v/3QNDsOLs/aMx6u
 qS94Bz6SYPchv8TaQdCy9GWSjvKwcmyJ0knXkdZ3uMpMYVwgIMsHLL0uevAW5WJo/bP7
 4ij8QVX//3sbs5v20bpBmGBDf8S3Oj7A1jaL5me47ucD4dfwVeIbErfke22zduNdZ15p
 X8EDjtuIMAW+8V7QDW0H33w5pLQlG1+aIJFHhJQhGSju+JNsUabAkSRqJdNPsBQgCkwd
 /WXqoxk+/uU3bVSm1UD94QNWENV9JMv3iarP4ErWIggdMVynHdyopB2xLxB3cnpP6Y1x
 2iKQ==
X-Gm-Message-State: APjAAAWnoVvE4N0Q7EKADMg3+XuB5dgIfLyjIq1GQC3J9aV8KXL5Vm3t
 AX0sOPVjsdB5AfRZW7WdLVuddZl11giHwat3UcbsEQ==
X-Google-Smtp-Source: APXvYqyW1emHhRBKHxxXAScz16mwYUdha6EWMf/eNJ6eW2bb1Fqoly3wylgSEbuygHP3+YkWg3AvDZQxJt18zmA6EEU=
X-Received: by 2002:aca:1910:: with SMTP id l16mr10558260oii.73.1573237757087; 
 Fri, 08 Nov 2019 10:29:17 -0800 (PST)
MIME-Version: 1.0
References: <CAPcyv4hxs+KqY5gU8Ds1a73eub1imvm9Qo8KdKGiDD1e-p0cww@mail.gmail.com>
 <DF536BED-6F4F-4351-AC7E-3C9FC8545332@redhat.com>
 <0eb001e0-bb26-59bb-c514-d2f8a86a7eab@redhat.com>
 <CAPcyv4h0yX4g6ETymQEpp52FFLaOmps_hO7w_yuYGk7BqQQcMQ@mail.gmail.com>
 <a514e23c-616a-b093-ede5-b2c2c558a1a0@redhat.com>
 <931cb766-c3fb-8093-d8d0-144d328e69fc@redhat.com>
In-Reply-To: <931cb766-c3fb-8093-d8d0-144d328e69fc@redhat.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Fri, 8 Nov 2019 10:29:06 -0800
Message-ID: <CAPcyv4ivq=EPUePXiX2ErcVyF7+dV9Yv215Oue7X_Y2X_Jfw8Q@mail.gmail.com>
Subject: Re: [PATCH v1 04/10] vfio/type1: Prepare is_invalid_reserved_pfn()
 for PG_reserved changes
To: David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 09 Nov 2019 12:19:43 +1100
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
 Linux MM <linux-mm@kvack.org>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Wanpeng Li <wanpengli@tencent.com>,
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
 Mike Rapoport <rppt@linux.vnet.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Nicholas Piggin <npiggin@gmail.com>, Andy Lutomirski <luto@kernel.org>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Allison Randal <allison@lohutok.net>,
 Jim Mattson <jmattson@google.com>, Mel Gorman <mgorman@techsingularity.net>,
 Cornelia Huck <cohuck@redhat.com>, Pavel Tatashin <pasha.tatashin@soleen.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Nov 8, 2019 at 2:22 AM David Hildenbrand <david@redhat.com> wrote:
>
> On 08.11.19 08:14, David Hildenbrand wrote:
> > On 08.11.19 06:09, Dan Williams wrote:
> >> On Thu, Nov 7, 2019 at 2:07 PM David Hildenbrand <david@redhat.com> wr=
ote:
> >>>
> >>> On 07.11.19 19:22, David Hildenbrand wrote:
> >>>>
> >>>>
> >>>>> Am 07.11.2019 um 16:40 schrieb Dan Williams <dan.j.williams@intel.c=
om>:
> >>>>>
> >>>>> =EF=BB=BFOn Thu, Oct 24, 2019 at 5:12 AM David Hildenbrand <david@r=
edhat.com> wrote:
> >>>>>>
> >>>>>> Right now, ZONE_DEVICE memory is always set PG_reserved. We want t=
o
> >>>>>> change that.
> >>>>>>
> >>>>>> KVM has this weird use case that you can map anything from /dev/me=
m
> >>>>>> into the guest. pfn_valid() is not a reliable check whether the me=
mmap
> >>>>>> was initialized and can be touched. pfn_to_online_page() makes sur=
e
> >>>>>> that we have an initialized memmap (and don't have ZONE_DEVICE mem=
ory).
> >>>>>>
> >>>>>> Rewrite is_invalid_reserved_pfn() similar to kvm_is_reserved_pfn()=
 to make
> >>>>>> sure the function produces the same result once we stop setting ZO=
NE_DEVICE
> >>>>>> pages PG_reserved.
> >>>>>>
> >>>>>> Cc: Alex Williamson <alex.williamson@redhat.com>
> >>>>>> Cc: Cornelia Huck <cohuck@redhat.com>
> >>>>>> Signed-off-by: David Hildenbrand <david@redhat.com>
> >>>>>> ---
> >>>>>> drivers/vfio/vfio_iommu_type1.c | 10 ++++++++--
> >>>>>> 1 file changed, 8 insertions(+), 2 deletions(-)
> >>>>>>
> >>>>>> diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_i=
ommu_type1.c
> >>>>>> index 2ada8e6cdb88..f8ce8c408ba8 100644
> >>>>>> --- a/drivers/vfio/vfio_iommu_type1.c
> >>>>>> +++ b/drivers/vfio/vfio_iommu_type1.c
> >>>>>> @@ -299,9 +299,15 @@ static int vfio_lock_acct(struct vfio_dma *dm=
a, long npage, bool async)
> >>>>>>     */
> >>>>>> static bool is_invalid_reserved_pfn(unsigned long pfn)
> >>>>>> {
> >>>>>> -       if (pfn_valid(pfn))
> >>>>>> -               return PageReserved(pfn_to_page(pfn));
> >>>>>> +       struct page *page =3D pfn_to_online_page(pfn);
> >>>>>
> >>>>> Ugh, I just realized this is not a safe conversion until
> >>>>> pfn_to_online_page() is moved over to subsection granularity. As it
> >>>>> stands it will return true for any ZONE_DEVICE pages that share a
> >>>>> section with boot memory.
> >>>>
> >>>> That should not happen right now and I commented back when you intro=
duced subsection support that I don=E2=80=99t want to have ZONE_DEVICE mixe=
d with online pages in a section. Having memory block devices that partiall=
y span ZONE_DEVICE would be ... really weird. With something like pfn_activ=
e() - as discussed - we could at least make this check work - but I am not =
sure if we really want to go down that path. In the worst case, some MB of =
RAM are lost ... I guess this needs more thought.
> >>>>
> >>>
> >>> I just realized the "boot memory" part. Is that a real thing? IOW, ca=
n
> >>> we have ZONE_DEVICE falling into a memory block (with holes)? I somew=
hat
> >>> have doubts that this would work ...
> >>
> >> One of the real world failure cases that started the subsection effect
> >> is that Persistent Memory collides with System RAM on a 64MB boundary
> >> on shipping platforms. System RAM ends on a 64MB boundary and due to a
> >> lack of memory controller resources PMEM is mapped contiguously at the
> >> end of that boundary. Some more details in the subsection cover letter
> >> / changelogs [1] [2]. It's not sufficient to just lose some memory,
> >> that's the broken implementation that lead to the subsection work
> >> because the lost memory may change from one boot to the next and
> >> software can't reliably inject a padding that conforms to the x86
> >> 128MB section constraint.
> >
> > Thanks, I thought it was mostly for weird alignment where other parts o=
f
> > the section are basically "holes" and not memory.
> >
> > Yes, it is a real bug that ZONE_DEVICE pages fall into sections that ar=
e
> > marked SECTION_IS_ONLINE.
> >
> >>
> >> Suffice to say I think we need your pfn_active() to get subsection
> >> granularity pfn_to_online_page() before PageReserved() can be removed.
> >
> > I agree that we have to fix this. I don't like ZONE_DEVICE pages fallin=
g
> > into memory device blocks (e.g., cannot get offlined), but I guess that
> > train is gone :) As long as it's not for memory hotplug, I can most
> > probably live with this.
> >
> > Also, I'd like to get Michals opinion on this and the pfn_active()
> > approach, but I can understand he's busy.
> >
> > This patch set can wait, I won't be working next week besides
> > reading/writing mails either way.
> >
> > Is anybody looking into the pfn_active() thingy?
> >
>
> I wonder if we should do something like this right now to fix this
> (exclude the false positive ZONE_DEVICE pages we could have within an
> online section, which was not possible before subsection hotplug):
>
> diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplu=
g.h
> index 384ffb3d69ab..490a9e9358b3 100644
> --- a/include/linux/memory_hotplug.h
> +++ b/include/linux/memory_hotplug.h
> @@ -30,6 +30,8 @@ struct vmem_altmap;
>          if (___nr < NR_MEM_SECTIONS && online_section_nr(___nr) && \
>              pfn_valid_within(___pfn))                              \
>                  ___page =3D pfn_to_page(___pfn);                     \
> +       if (unlikely(___page && is_zone_device_page(___page)))     \
> +               ___page =3D NULL;                                    \
>          ___page;                                                   \
>   })
>
>
> Yeah, it's another is_zone_device_page(), but it should not be racy
> here, as we want to exclude, not include ZONE_DEVICE.
>
> I don't have time to look into this right now, unfortunately.

I don't want to band-aid without an actual bug report. I'll take a
look at a subsection-map for the online state.
