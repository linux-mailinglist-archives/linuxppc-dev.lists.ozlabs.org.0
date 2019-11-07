Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BD613F392C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2019 21:07:29 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 478Dvy39kBzF6Pq
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Nov 2019 07:07:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::242;
 helo=mail-oi1-x242.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="oKCc36Mb"; 
 dkim-atps=neutral
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4787080LLlzF6Mm
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Nov 2019 02:40:32 +1100 (AEDT)
Received: by mail-oi1-x242.google.com with SMTP id l20so2310396oie.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 Nov 2019 07:40:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q58dgR5BjEdLFCMc/OF3RFMdn955E8grbP7luNA8CNY=;
 b=oKCc36Mb9fip+zU5tGKr6J+l4XlDcFUtvr2mmmCNv6TF0HlwkicRCrTT1sQlx12vxa
 UY8S81D7tBut+V/4ZkpyJtSVYco9A0bQaPWztNxHQubXXDgTxmJGos9WA1uUQELcy96J
 T6Bh3rJMvXgSo4xERJ53HxifVFLgwy/o3viVP+9B0CbTTzJLC88VhXkF2cZ+0Tuobk14
 zVNN5QACqwe5KWkIPC4t1TSKEn6spSMULzAANECJfJo6fn8JsC5HEU9YsPR/FcLvIWCT
 HseWP/zMGzW78EfAwZAkw31fNd4FCq5eyjs4aTOmObHRdvGMJcGjHaaY5l49bbOdcFbv
 BxLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q58dgR5BjEdLFCMc/OF3RFMdn955E8grbP7luNA8CNY=;
 b=j6qHe8o+2w0Avbs6Jthn3mMyy49Xs6RmeqmoXqsfE7opjz5rwBVoejLrG39u5UEk61
 lM+VT4LnCbZaV5Myvk2+mvdVfo+zaCYZgOlE5Qtwm5TZJFhLBgwpBQfr4uXLXi7V7J8l
 5OoDyFLv7ZURs3xMJxOywxxtTELTtVJpeesdycOf1Ktzp4AQ0sTJh7StsJ1EI+TsxGdt
 T0vYuWAq13YtDMj7ofPsC+wMpO7yLy+eq15uo2ynLmkk+S9Um4EROOPXJcShuswGgSwy
 gStFeUXnntQktXVDt4AviShc1zen+bhpbe/0HuBUwGZsZ8LYKCABCWtzQuQYgijoK0OY
 FUFw==
X-Gm-Message-State: APjAAAUUpXfjsC5RSCdfFemOwTBMDVtYrVr4lgvaunC4ysPyUXEq4d5r
 BeVWYQ1gFzEt9CdgbiAAsvttSoQYfGD6a3d29pPixw==
X-Google-Smtp-Source: APXvYqzlAbNtEQcnOULhGp1Ld3ejpyCy6BqfHWE8h+548I8goxJKdozDEoUnp7xCpHOKMURL2hHkCxlnCDsp6qKvW2g=
X-Received: by 2002:aca:ad52:: with SMTP id w79mr3140190oie.149.1573141228551; 
 Thu, 07 Nov 2019 07:40:28 -0800 (PST)
MIME-Version: 1.0
References: <20191024120938.11237-1-david@redhat.com>
 <20191024120938.11237-5-david@redhat.com>
In-Reply-To: <20191024120938.11237-5-david@redhat.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Thu, 7 Nov 2019 07:40:17 -0800
Message-ID: <CAPcyv4hxs+KqY5gU8Ds1a73eub1imvm9Qo8KdKGiDD1e-p0cww@mail.gmail.com>
Subject: Re: [PATCH v1 04/10] vfio/type1: Prepare is_invalid_reserved_pfn()
 for PG_reserved changes
To: David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 08 Nov 2019 07:05:47 +1100
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

On Thu, Oct 24, 2019 at 5:12 AM David Hildenbrand <david@redhat.com> wrote:
>
> Right now, ZONE_DEVICE memory is always set PG_reserved. We want to
> change that.
>
> KVM has this weird use case that you can map anything from /dev/mem
> into the guest. pfn_valid() is not a reliable check whether the memmap
> was initialized and can be touched. pfn_to_online_page() makes sure
> that we have an initialized memmap (and don't have ZONE_DEVICE memory).
>
> Rewrite is_invalid_reserved_pfn() similar to kvm_is_reserved_pfn() to make
> sure the function produces the same result once we stop setting ZONE_DEVICE
> pages PG_reserved.
>
> Cc: Alex Williamson <alex.williamson@redhat.com>
> Cc: Cornelia Huck <cohuck@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  drivers/vfio/vfio_iommu_type1.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
> index 2ada8e6cdb88..f8ce8c408ba8 100644
> --- a/drivers/vfio/vfio_iommu_type1.c
> +++ b/drivers/vfio/vfio_iommu_type1.c
> @@ -299,9 +299,15 @@ static int vfio_lock_acct(struct vfio_dma *dma, long npage, bool async)
>   */
>  static bool is_invalid_reserved_pfn(unsigned long pfn)
>  {
> -       if (pfn_valid(pfn))
> -               return PageReserved(pfn_to_page(pfn));
> +       struct page *page = pfn_to_online_page(pfn);

Ugh, I just realized this is not a safe conversion until
pfn_to_online_page() is moved over to subsection granularity. As it
stands it will return true for any ZONE_DEVICE pages that share a
section with boot memory.
