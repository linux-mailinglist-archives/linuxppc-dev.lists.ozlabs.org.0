Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C3A55AF4E
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Jun 2022 07:21:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LVzk96c08z3cdc
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Jun 2022 15:21:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hBenD693;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com; envelope-from=schmitzmic@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hBenD693;
	dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LVzjW57hTz3bkM
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Jun 2022 15:21:18 +1000 (AEST)
Received: by mail-pj1-x1036.google.com with SMTP id g10-20020a17090a708a00b001ea8aadd42bso6479106pjk.0
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Jun 2022 22:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=FyhqfSxVNsjhzX9WxR80RFXqe2zcrAY7cm8JcsXFPog=;
        b=hBenD693M5G/Q6eFcNTFzS4SnqsJJrltg/unkzqdkXjt1KZuJOowmubr8N6pLoDaKD
         fVFiOpC8iAD7EGIlliBp9rs3u8PN97EiT1+qNvS41+MZgPOCJTjoQyeiIIs3aN/S65Mk
         ROLoo90QARopRA/G16LXEfV3XzWV2cbm6BSPsXLWjrONfwr4KFBEPylDD+dVHgwCbYpH
         Nln7DI28nZLcldKdK/hMm8jAMkLlh8JImCgANRilyPgE9ECSv7Kfb/sBQgpFGEXAGxKo
         nt7BB5Uz/MHiajgMyFwmvhtRiUdUohrDkZhxMV7UvAUfaWc1n/g20OMg10VWWb/yD+Eh
         bEKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=FyhqfSxVNsjhzX9WxR80RFXqe2zcrAY7cm8JcsXFPog=;
        b=LdLuQO4vcMSqUD/L65d8DYHRqKYkHyQI/AP+gmueOcmJfkBvCp4iexyLA/Dv8mVGUy
         HN1huiBK9gNyjw7/ry8/yx8PayP1IBhA4lxXb5sSF5GbvHHQp6O2X1ErvYxA94taZ1uV
         Lwq5Qj+FPB6o7/lZTSkUPZg7EfTUG+GJYDHzckouKaexQTX1U64sqvQqrbgwPWWrtCLG
         Wgp4FY9s4Dnad0XM5XwY9N5+vssOMm2lB8b6IvRNB8f48jd5bR/TiJqochKYDrkeZeVG
         0F3y5ABANpbSaXiKLYwryaPCg+jltJ49Kl1oNGnUFfQAQxg+g+XNdcJ/m9I+JjUVfVla
         v7BA==
X-Gm-Message-State: AJIora+I1ZPchj9QcMUH/lC3BKkbSkKrmnE987fKqAld2GvIiKReaH/5
	zumsFOzdF/3P06spjGipE/kDuYoT6oJZRg==
X-Google-Smtp-Source: AGRyM1vu+xqOXfmR3FCthMvvOLmEwQYO6Fqr3qEmZORzf9ji8yNUeLLR6T09iITPOsTmJm0q6+GBiw==
X-Received: by 2002:a17:902:8a91:b0:168:e74b:1056 with SMTP id p17-20020a1709028a9100b00168e74b1056mr7540306plo.16.1656220874223;
        Sat, 25 Jun 2022 22:21:14 -0700 (PDT)
Received: from [10.1.1.24] (222-155-0-244-adsl.sparkbb.co.nz. [222.155.0.244])
        by smtp.gmail.com with ESMTPSA id p9-20020a1709026b8900b0016372486febsm4482864plk.297.2022.06.25.22.21.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 25 Jun 2022 22:21:13 -0700 (PDT)
Subject: Re: [PATCH v2 3/3] arch/*/: remove CONFIG_VIRT_TO_BUS
To: Arnd Bergmann <arnd@kernel.org>
References: <20220617125750.728590-1-arnd@kernel.org>
 <20220617125750.728590-4-arnd@kernel.org>
 <6ba86afe-bf9f-1aca-7af1-d0d348d75ffc@gmail.com>
 <CAK8P3a1XfwkTOV7qOs1fTxf4vthNBRXKNu8A5V7TWnHT081NGA@mail.gmail.com>
From: Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <6d1d88ee-1cf6-c735-1e6d-bafd2096e322@gmail.com>
Date: Sun, 26 Jun 2022 17:21:01 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a1XfwkTOV7qOs1fTxf4vthNBRXKNu8A5V7TWnHT081NGA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Miquel van Smoorenburg <mikevs@xs4all.net>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-scsi <linux-scsi@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-m68k <linux-m68k@lists.linux-m68k.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "Maciej W . Rozycki" <macro@orcam.me.uk>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Denis Efremov <efremov@linux.com>, Mark Salyzyn <salyzyn@android.com>, Christoph Hellwig <hch@infradead.org>, "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>, Matt Wang <wwentao@vmware.com>, Parisc List <linux-parisc@vger.kernel.org>, alpha <linux-alpha@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>, Khalid Aziz <khalid@gonehiking.org>, Robin Murphy <robin.murphy@arm.com>, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Arnd,

Am 24.06.2022 um 21:10 schrieb Arnd Bergmann:
> On Sat, Jun 18, 2022 at 3:06 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
>> Am 18.06.2022 um 00:57 schrieb Arnd Bergmann:
>>>
>>> All architecture-independent users of virt_to_bus() and bus_to_virt()
>>> have been fixed to use the dma mapping interfaces or have been
>>> removed now.  This means the definitions on most architectures, and the
>>> CONFIG_VIRT_TO_BUS symbol are now obsolete and can be removed.
>>>
>>> The only exceptions to this are a few network and scsi drivers for m68k
>>> Amiga and VME machines and ppc32 Macintosh. These drivers work correctly
>>> with the old interfaces and are probably not worth changing.
>>
>> The Amiga SCSI drivers are all old WD33C93 ones, and replacing
>> virt_to_bus by virt_to_phys in the dma_setup() function there would
>> cause no functional change at all.
>
> Ok, thanks for taking a look here.
>
>> drivers/vme/bridges/vme_ca91cx42.c hasn't been used at all on m68k (it
>> is a PCI-to-VME bridge chipset driver that would be needed on
>> architectures that natively use a PCI bus). I haven't found anything
>> that selects that driver, so not sure it is even still in use??
>
> It's gone now, Greg has already taken my patches for this through
> the staging tree.

One less to worry about, thanks.

>> That would allow you to drop the remaining virt_to_bus define from
>> arch/m68k/include/asm/virtconvert.h.
>>
>> I could submit a patch to convert the Amiga SCSI drivers to use
>> virt_to_phys if Geert and the SCSI maintainers think it's worth the churn.
>
> I don't think using virt_to_phys() is an improvement here, as
> virt_to_bus() was originally meant as a better abstraction to
> replace the use of virt_to_phys() to make drivers portable, before
> it got replaced by the dma-mapping interface in turn.
>
> It looks like the Amiga SCSI drivers have an open-coded version of
> what dma_map_single() does, to do bounce buffering and cache
> management. The ideal solution would be to convert the drivers
> actually use the appropriate dma-mapping interfaces and remove
> this custom code.

I've taken another look at these drivers' dma_setup() functions and they 
all look much more complex than the Amiga ESP drivers (which do use the 
dma-mapping interface for parts of the DMA setup). From my limited 
understanding, the difference between the ESP and WD33C93 drivers is 
that the former are used on 040/060 accelerator boards only (where the 
processor does do bus snooping and DMA can access all of RAM). The 
latter ones would need cache management, could only use non-coherent 
mappings and would require special case handling for DMA-inaccessible 
RAM inside a device-specific dma ops' map_page() function.

That's several bridges too far for me ... I have no Amiga hardware 
whatsoever, and know no one who could test changes to WD33C93 drivers 
for me.

What I have is a NCR5380 with the proverbial 'pathological DMA' 
integration example (and its driver was never changed to even use 
virt_to_bus()!). I might learn enough about using the dma-mapping API on 
that one eventually (though the requirement for at least 1 MB swiotlb 
bounce buffers looks hard to meet), and use that to convert the WD33C93 
drivers, but it would still remain untested.

 > The same could be done for the two vme drivers (scsi/mvme147.c
> and ethernet/82596.c), which do the cache management but
> apparently don't need swiotlb bounce buffering.
>
> Rewriting the drivers to modern APIs is of course non-trivial,
> and if you want a shortcut here, I would suggest introducing
> platform specific helpers similar to isa_virt_to_bus() and call
> them amiga_virt_to_bus() and vme_virt_to_bus, respectively.

I don't think Amiga and m68k VME differ at all in that respect, so might 
just call it m68k_virt_to_bus() for now.

> Putting these into a platform specific header file at least helps
> clarify that both the helper functions and the drivers using them
> are non-portable.

There are no platform specific header files other than asm/amigahw.h and 
asm/mvme147hw.h, currently only holding register address definitions. 
Would it be OK to add m68k_virt_to_bus() in there if it can't remain in 
asm/virtconvert.h, Geert?

>
>> 32bit powerpc is a different matter though.
>
> It's similar, but unrelated. The two apple ethernet drivers
> (bmac and mace) can again either get changed to use the
> dma-mapping interfaces, or get a custom pmac_virt_to_bus()/
> pmac_bus_to_virt() helper.

Hmmm - I see Finn had done the DMA API conversion on macmace.c which 
might give some hints on what to do about mace.c ... no idea about 
bmac.c though. And again, haven't got hardware to test, so custom 
helpers is it, then.

Cheers,

	Michael

> There is also drivers/tty/serial/cpm_uart/cpm_uart_cpm2.c,
> which I think just needs a trivial change, but I'm not sure
> how to do it correctly.
>
>       Arnd
>
