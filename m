Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6E3EF373
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2019 03:30:00 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 476YXj44j0zF4DM
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2019 13:29:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::843;
 helo=mail-qt1-x843.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="qw3wPwnJ"; 
 dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 476XNP6drpzF3N8
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Nov 2019 12:37:41 +1100 (AEDT)
Received: by mail-qt1-x843.google.com with SMTP id l24so8764405qtp.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Nov 2019 17:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=W2L5Wt9vAPwi2DADGCrJo4/gpgrXJ/vHj0hp5uT1/6w=;
 b=qw3wPwnJQEPIsA7f/w0mDIf51WQSqHZtNBtHkQ+a6qdpUzMOEXt/OAxm9io3JhbfP6
 vTne7iEDoazWXW5xBbihS1O0cnamLcICRUtMB42yA1LqBFurawpARa+pI/loQ7TZozCS
 muNK+/gOteA/6DrrAtwCv6qzAGFDNLrT4lxpVufIgKeSiYXHaqk5RVXbSWJ1ueKtHuiv
 oOY+F9gg4Xa4vW+/ls61g41NWotER0Buor3x0J0NDaC4S7Hry/ZYzIQIeOoT7pjyK/9n
 KejzKKo5jxtmx28oPc0/OrVyt4Yy1MBj0AZXomNXumyf6TV3OJA/dy91Qa7O4iQ+cyCX
 +Lwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=W2L5Wt9vAPwi2DADGCrJo4/gpgrXJ/vHj0hp5uT1/6w=;
 b=eBjHxNNX7KpZE9wduRtUvztu+oAktL4gr8JdzX6JXhnFXrwzjHbTl/GS8FEMFF1EjO
 oM38a4ib5e90By+x1tLvhPyCBFI8YAk56ulvFC5dQ4w9cPzlD3tIWgujzgrD0nxZHkPb
 StDjNl83XBXMoAa6s1OPOA7mzknUKp8d6IRYpvAaXymnL80mV7uP6RkLVJICAzbEVvve
 7dHENMo+EUjg2vEx0ughuFkCalkFdfdvhiA6IKSPTs3C0VF8hbTZp9zehXF07yy1he4g
 m3WFWmYvZqSVfJxtcvdmhm509ezebt/1AWUOz3fTc7d8hYzMwQKISa637bMb1VF1HZPT
 4SLA==
X-Gm-Message-State: APjAAAVYKWGFsxcGpoesPiYjzU5oK6JEAa4cV1U6qwN6uId+VOR4Fvfy
 yXZUBgdvr9PzqNiv6Z/YlgIZABDBSh2/KBkEW2Fy5Q==
X-Google-Smtp-Source: APXvYqxf5b5k2/XEh51ut95Lrfer14ii/6Y4WgnKt5ObxWvYMWg+IxU5wRUlwhcOOGIDRGfOdEah46THNJk1jv52R/0=
X-Received: by 2002:a0c:a910:: with SMTP id y16mr12413788qva.89.1572917858090; 
 Mon, 04 Nov 2019 17:37:38 -0800 (PST)
MIME-Version: 1.0
References: <20191024120938.11237-1-david@redhat.com>
 <20191024120938.11237-3-david@redhat.com>
In-Reply-To: <20191024120938.11237-3-david@redhat.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Mon, 4 Nov 2019 17:37:27 -0800
Message-ID: <CAPcyv4iFJgtcx56g+Le2DccgvoncvVZuaEBRSOyv-=52YNqJug@mail.gmail.com>
Subject: Re: [PATCH v1 02/10] KVM: x86/mmu: Prepare kvm_is_mmio_pfn() for
 PG_reserved changes
To: David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 05 Nov 2019 13:26:42 +1100
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

On Thu, Oct 24, 2019 at 5:10 AM David Hildenbrand <david@redhat.com> wrote:
>
> Right now, ZONE_DEVICE memory is always set PG_reserved. We want to
> change that.
>
> KVM has this weird use case that you can map anything from /dev/mem
> into the guest. pfn_valid() is not a reliable check whether the memmap
> was initialized and can be touched. pfn_to_online_page() makes sure
> that we have an initialized memmap (and don't have ZONE_DEVICE memory).
>
> Rewrite kvm_is_mmio_pfn() to make sure the function produces the
> same result once we stop setting ZONE_DEVICE pages PG_reserved.
>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: "Radim Kr=C4=8Dm=C3=A1=C5=99" <rkrcmar@redhat.com>
> Cc: Sean Christopherson <sean.j.christopherson@intel.com>
> Cc: Vitaly Kuznetsov <vkuznets@redhat.com>
> Cc: Wanpeng Li <wanpengli@tencent.com>
> Cc: Jim Mattson <jmattson@google.com>
> Cc: Joerg Roedel <joro@8bytes.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: "H. Peter Anvin" <hpa@zytor.com>
> Cc: KarimAllah Ahmed <karahmed@amazon.de>
> Cc: Michal Hocko <mhocko@kernel.org>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  arch/x86/kvm/mmu.c | 29 +++++++++++++++++------------
>  1 file changed, 17 insertions(+), 12 deletions(-)
>
> diff --git a/arch/x86/kvm/mmu.c b/arch/x86/kvm/mmu.c
> index 24c23c66b226..f03089a336de 100644
> --- a/arch/x86/kvm/mmu.c
> +++ b/arch/x86/kvm/mmu.c
> @@ -2962,20 +2962,25 @@ static bool mmu_need_write_protect(struct kvm_vcp=
u *vcpu, gfn_t gfn,
>
>  static bool kvm_is_mmio_pfn(kvm_pfn_t pfn)
>  {
> +       struct page *page =3D pfn_to_online_page(pfn);
> +
> +       /*
> +        * ZONE_DEVICE pages are never online. Online pages that are rese=
rved
> +        * either indicate the zero page or MMIO pages.
> +        */
> +       if (page)
> +               return !is_zero_pfn(pfn) && PageReserved(pfn_to_page(pfn)=
);
> +
> +       /*
> +        * Anything with a valid (but not online) memmap could be ZONE_DE=
VICE.
> +        * Treat only UC/UC-/WC pages as MMIO.

You might clarify that ZONE_DEVICE pages that belong to WB cacheable
pmem have the correct memtype established by devm_memremap_pages().

Other than that, feel free to add:

Reviewed-by: Dan Williams <dan.j.williams@intel.com>
