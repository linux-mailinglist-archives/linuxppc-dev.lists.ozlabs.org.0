Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B95DEF4A0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2019 05:58:16 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 476cqn1wDtzF1Jy
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2019 15:58:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::343;
 helo=mail-ot1-x343.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="yhHHwHps"; 
 dkim-atps=neutral
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 476cPt3Zm4zF3Bx
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Nov 2019 15:39:10 +1100 (AEDT)
Received: by mail-ot1-x343.google.com with SMTP id z6so16538298otb.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Nov 2019 20:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=LQ/3CY3Z/pwD7vktjhd0l5Hf+cHLJkYRKb4mMFAX40w=;
 b=yhHHwHpstkv84TevZIhs/Wm18KmjQCTMD7QlgnCZ3d31OxhoY6s6I3rfk8ud7Ml9XW
 NzkBxxxgjNUnDFVFhwgBwUgJux1TVnbKP5vdJwRFwQ+/giMyREG6ohSNQy9TeoSZJP8T
 SPIO/dUqQUV+56+4q+tqGSp5zgkTlc1mY6zJa37wVenBzWpatnn2O1AzlEI006uGn0Ia
 +fAj7hOgp2UmAGxqae4eaNY8IDMTTdkrkZFK6SjUqy87+8sumJ4XhFeiC35vbDkoayxx
 uGfCGRfgl5zfXbcSzaVw9hv/WN8gLBd6EeLAtnBu48QoPLD4qlg6djtdWgKDg7cH2aI4
 CIaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LQ/3CY3Z/pwD7vktjhd0l5Hf+cHLJkYRKb4mMFAX40w=;
 b=gJrbBpgDXzVUcChlplAtPrYcR9FayPcnx0KKD6jZFBkrqjPgIXKp0ciYa3J1PXw2Ph
 zJOp4iSKaTukBJaClashwkO+hSsUKUjfbTD6tuIFXhIDL/6MNNNHRvmuHaDwGd7EgnPv
 H44NPlQUZNfwEugiuGb29l3DOHhzHbV6CYS5/mgy2CnvCs0Y5O3/b/2Vx5aejTt0eQE/
 Rih8jgDY6Ux4dc/xU6Uq89cmtQg107mZu4Pgx3vTXy+Vzib3TzxPjyaC8zOGGfgDNoZ7
 vZ8RqdG7osPSTeccG/lj9KLt5isJe0Yofh6aKi/z38z/x4HJvgMLPI0IZeVDgKW+6SP1
 2XcQ==
X-Gm-Message-State: APjAAAWgLQcJjK38DiT57VvhuDnHfhO8mRZMA+MNxcQHVPCA2XEHDKHQ
 PCAn9ceHdTPOojmSRv7ubKkWV5Qwa4v2TT8y/WDokQ==
X-Google-Smtp-Source: APXvYqw5MaEjuPSBWubL0ieUUp4Y5rryBa4JzAq8q4R6lrgIw09Afe+NdZFy6gkARWQQx7v95Lg8Rh1zBTQaSC9BU+U=
X-Received: by 2002:a9d:30c8:: with SMTP id r8mr3863066otg.363.1572928747302; 
 Mon, 04 Nov 2019 20:39:07 -0800 (PST)
MIME-Version: 1.0
References: <20191024120938.11237-1-david@redhat.com>
 <20191024120938.11237-4-david@redhat.com>
In-Reply-To: <20191024120938.11237-4-david@redhat.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Mon, 4 Nov 2019 20:38:56 -0800
Message-ID: <CAPcyv4jyTxEpw5ep5Noy0YRV7Dybzj+8OTVMwRK_zeFigF-LsQ@mail.gmail.com>
Subject: Re: [PATCH v1 03/10] KVM: Prepare kvm_is_reserved_pfn() for
 PG_reserved changes
To: David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 05 Nov 2019 15:56:32 +1100
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
 Adam Borowski <kilobyte@angband.pl>, Cornelia Huck <cohuck@redhat.com>,
 Pavel Tatashin <pasha.tatashin@soleen.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Oct 24, 2019 at 5:11 AM David Hildenbrand <david@redhat.com> wrote:
>
> Right now, ZONE_DEVICE memory is always set PG_reserved. We want to
> change that.
>
> KVM has this weird use case that you can map anything from /dev/mem
> into the guest. pfn_valid() is not a reliable check whether the memmap
> was initialized and can be touched. pfn_to_online_page() makes sure
> that we have an initialized memmap (and don't have ZONE_DEVICE memory).
>
> Rewrite kvm_is_reserved_pfn() to make sure the function produces the
> same result once we stop setting ZONE_DEVICE pages PG_reserved.
>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: "Radim Kr=C4=8Dm=C3=A1=C5=99" <rkrcmar@redhat.com>
> Cc: Michal Hocko <mhocko@kernel.org>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: KarimAllah Ahmed <karahmed@amazon.de>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  virt/kvm/kvm_main.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index e9eb666eb6e8..9d18cc67d124 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -151,9 +151,15 @@ __weak int kvm_arch_mmu_notifier_invalidate_range(st=
ruct kvm *kvm,
>
>  bool kvm_is_reserved_pfn(kvm_pfn_t pfn)
>  {
> -       if (pfn_valid(pfn))
> -               return PageReserved(pfn_to_page(pfn));
> +       struct page *page =3D pfn_to_online_page(pfn);
>
> +       /*
> +        * We treat any pages that are not online (not managed by the bud=
dy)
> +        * as reserved - this includes ZONE_DEVICE pages and pages withou=
t
> +        * a memmap (e.g., mapped via /dev/mem).
> +        */
> +       if (page)
> +               return PageReserved(page);
>         return true;
>  }

So after this all the pfn_valid() usage in kvm_main.c is replaced with
pfn_to_online_page()? Looks correct to me.

However, I'm worried that kvm is taking reference on ZONE_DEVICE pages
through some other path resulting in this:

    https://lore.kernel.org/linux-nvdimm/20190919154708.GA24650@angband.pl/

I'll see if this patch set modulates or maintains that failure mode.
