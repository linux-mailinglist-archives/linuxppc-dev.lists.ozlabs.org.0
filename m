Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BC72D10E5AB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Dec 2019 07:00:01 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47RDwZ4WFlzDqSN
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Dec 2019 16:59:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.b="upqeb1sm"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47RDtm6pSjzDqRR
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Dec 2019 16:58:22 +1100 (AEDT)
Received: by mail-pg1-x543.google.com with SMTP id 6so13263294pgk.0
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 01 Dec 2019 21:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fx/2mnxv+WQoOh5lHNQ3VpoM/Nq2ZBylXLGBj5SpSws=;
 b=upqeb1sm/EI7yNzJW9dEHhtDx5y+GK2tdgI50NElCUr06WWWrQJqBVg69mtoB5BXDD
 RtvAy8/dPDcyOTzRM6IdJTAoDClC03eXu8Hy5PsrVbYt9nO8uLwA/q4n1M9pnuUq/5KC
 14dkaHPhTcFx/V+0KnKAV1Xi+bdZQUfvFzHtsrCl4BJVBiV06s7L7Wchlf+rTtO2rYx2
 Lnd89PT3hkCA4euq/eLRd3m9Dyo1oUqAaGtEgxeZTfrRZkPrsU+R3C1qJHXXf9TqmfZL
 yzKc4nwJy9ZVgyu+ELrtYgv6OvR5gmSG/6s+E5HIo6nAwTkedeYGnoIotcqQIq6P4jgI
 qWTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=fx/2mnxv+WQoOh5lHNQ3VpoM/Nq2ZBylXLGBj5SpSws=;
 b=Jp0AZgLAhiib/4HFWCbGH7YtNuPKeTWuIgLL6M7g0q7zkUGGyDIT9xKLxhne9TU5Qm
 xucrnEA4+2qt1wb9XrukqU5LnuY2Dm1pnJkmvCNT8h5NI00XQLezHCrgxMYnma0xnzhC
 1bST7VV9587Zt7KPRVo6QrfUQGnB4CDwuTunUh/VWW0YDp0lgsF3vyehwiU2SN2OjZd8
 KdXQ5XTV49T/4xJmpxUyjuEKlrdYIxZJlo/DRsqQlBpzsWO/A61MQ0S0OvuEU8Qkx3ng
 H90oKqTYIY5lRKaYuvDb+ciUaPnCcJMoJAaqxgIlewCsplTMY/HZnirjgv3ki2bi58/2
 e9qQ==
X-Gm-Message-State: APjAAAVPTbUvKmpLEoN1LHdCsZpqUHhtuBt157PhGs6BJoq7biPnuQb2
 QWLOFlwCCY78tMOnZgpmulsN1w==
X-Google-Smtp-Source: APXvYqwd/XOPqoss5AhcrkP3d9evym3NIdIpJnLejmwTkPcKHG7hEwCsmHdJe8A/pE3H8hpV6X1KkQ==
X-Received: by 2002:a63:b20f:: with SMTP id x15mr29333478pge.65.1575266299549; 
 Sun, 01 Dec 2019 21:58:19 -0800 (PST)
Received: from [10.61.2.175] ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id 199sm10753755pfv.81.2019.12.01.21.58.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 Dec 2019 21:58:19 -0800 (PST)
Subject: Re: [PATCH kernel RFC 0/4] powerpc/powenv/ioda: Allow huge DMA window
 at 4GB
To: Alistair Popple <alistair@popple.id.au>
References: <20191202015953.127902-1-aik@ozlabs.ru>
 <22858805.RAHADn2P79@townsend>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Autocrypt: addr=aik@ozlabs.ru; keydata=
 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
Message-ID: <45175dc2-8ed4-6e96-ff69-44980f3d1951@ozlabs.ru>
Date: Mon, 2 Dec 2019 16:58:15 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <22858805.RAHADn2P79@townsend>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Oliver O'Halloran <oohall@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>, linuxppc-dev@lists.ozlabs.org,
 kvm@vger.kernel.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 02/12/2019 16:36, Alistair Popple wrote:
> On Monday, 2 December 2019 12:59:49 PM AEDT Alexey Kardashevskiy wrote:
>> Here is an attempt to support bigger DMA space for devices
>> supporting DMA masks less than 59 bits (GPUs come into mind
>> first). POWER9 PHBs have an option to map 2 windows at 0
>> and select a windows based on DMA address being below or above
>> 4GB.
>>
>> This adds the "iommu=iommu_bypass" kernel parameter and
> 
> Would it be possible to just enable this by default if the platform supports 
> it? Are there any downsides?

It changes the second DMA window location which is now assumed by QEMU
to be at 0x800.0000.0000.0000 and I do not see an easy way to work
around this.

For example, we start QEMU without VFIO but with emulated XHCI which
will ask for DDW, we (QEMU) have to pick a window location but then we
have to stick to it and if a user later hotplugs an VFIO-PCI, that
physical IOMMU has to support the previously selected DMA window
address; otherwise hotplug is going to fail.

The question is how to tell QEMU about this new offset and what we do
about migration from P8 (which let's say did have a VFIO device which we
unplug before the migration) to P9 with a prospect of hotplugging an
VFIO device but this time with this GTE4GB bit set.


> Adding it as an option seems like it would make 
> things harder to support and reduces the amount of testing/use it would get.

Yeah, this why this is an RFC...


>> supports VFIO+pseries machine - current this requires telling
>> upstream+unmodified QEMU about this via
>> -global spapr-pci-host-bridge.dma64_win_addr=0x100000000
>> or per-phb property. 4/4 advertises the new option but
>> there is no automation around it in QEMU (should it be?).
>>
>> For now it is either 1<<59 or 4GB mode; dynamic switching is
>> not supported (could be via sysfs).
>>
>> This is based on sha1
>> a6ed68d6468b Linus Torvalds "Merge tag 'drm-next-2019-11-27' of git://
> anongit.freedesktop.org/drm/drm".
> 
> Are you sure?

Almost. It should have been HEAD^^^^^..HEAD instead of HEAD^^^^..HEAD :)

I've posted 00/4 to the thread now, sorry about that. Thanks,


> I am getting the following rejected hunk trying to apply the 
> first patch in the series:
> 
> --- arch/powerpc/platforms/powernv/pci-ioda.c
> +++ arch/powerpc/platforms/powernv/pci-ioda.c
> @@ -2349,15 +2349,10 @@ static void pnv_pci_ioda2_set_bypass(struct 
> pnv_ioda_pe *pe, bool enable)
>                 pe->tce_bypass_enabled = enable;
>  }
>  
> -static long pnv_pci_ioda2_create_table(struct iommu_table_group *table_group,
> -               int num, __u32 page_shift, __u64 window_size, __u32 levels,
> +static long pnv_pci_ioda2_create_table(int nid, int num, __u64 bus_offset,
> +               __u32 page_shift, __u64 window_size, __u32 levels,
>                 bool alloc_userspace_copy, struct iommu_table **ptbl)
>  {
> -       struct pnv_ioda_pe *pe = container_of(table_group, struct pnv_ioda_pe,
> -                       table_group);
> -       int nid = pe->phb->hose->node;
> -       __u64 bus_offset = num ?
> -               pe->table_group.tce64_start : table_group->tce32_start;
>         long ret;
>         struct iommu_table *tbl;
> 
> - Alistair
>  
>> Please comment. Thanks.
>>
>>
>>
>> Alexey Kardashevskiy (4):
>>   powerpc/powernv/ioda: Rework for huge DMA window at 4GB
>>   powerpc/powernv/ioda: Allow smaller TCE table levels
>>   powerpc/powernv/phb4: Add 4GB IOMMU bypass mode
>>   vfio/spapr_tce: Advertise and allow a huge DMA windows at 4GB
>>
>>  arch/powerpc/include/asm/iommu.h              |   1 +
>>  arch/powerpc/include/asm/opal-api.h           |  11 +-
>>  arch/powerpc/include/asm/opal.h               |   2 +
>>  arch/powerpc/platforms/powernv/pci.h          |   1 +
>>  include/uapi/linux/vfio.h                     |   2 +
>>  arch/powerpc/platforms/powernv/opal-call.c    |   2 +
>>  arch/powerpc/platforms/powernv/pci-ioda-tce.c |   4 +-
>>  arch/powerpc/platforms/powernv/pci-ioda.c     | 219 ++++++++++++++----
>>  drivers/vfio/vfio_iommu_spapr_tce.c           |  10 +-
>>  9 files changed, 202 insertions(+), 50 deletions(-)
>>
>>
> 
> 
> 
> 

-- 
Alexey
