Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A260A55F1FE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 01:44:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXh5q46ZHz3cjD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 09:44:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ZFKa0zjQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=schmitzmic@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ZFKa0zjQ;
	dkim-atps=neutral
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXh594Yzbz3bpw
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jun 2022 09:44:12 +1000 (AEST)
Received: by mail-pl1-x631.google.com with SMTP id o18so12492527plg.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jun 2022 16:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=XXACMyBth2YuRsa3JBFFU2eR9hpIP7dUr/uMuQH5Oj8=;
        b=ZFKa0zjQT6sOAjCHXXkRsROHleG5wCDjvaAfz3h3OP6cgT9grR5oBZm0ZBvAWAay0r
         DR4PyHuT1QNC9LfX+RGxE2XCIQFVlFTEhqlmuIbt4B77yTiI6mL+mqc2kzFUWGgJL3DE
         xqXaW3fwHeQ1Tq9+eDu9x8IB61VGIWMo0s3NI888MArONazUjDsSuXP19BeJL7dtYHwQ
         Zwl3asU6pETG2ISfXFTMTcM6zTMGwEr28kXEV9D1VpMLrcpN6K4XgUsrTwn8x7Uqv2vl
         6hSbXMXNOxewCZj52M37+xep3zYfiDtYF+BjqZMNmFdSwg4GmcfShZeR26gbmY2em+2z
         ik6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=XXACMyBth2YuRsa3JBFFU2eR9hpIP7dUr/uMuQH5Oj8=;
        b=lHCKagMYdMGsdtkLFX8vOADbR0SwilChud5YISxTEYDkdNkNpqalIFcxFIC7ikx2W2
         RABynAHroPks1AJhmyrtoH3ZU4M6AZqzM1UICA2TPsD0e3Z4gKd7I5FxNZds2hx1hIwx
         2rdPqSaiAzr4o7ufC4RDWfbQ1TOGP01Fgj4broYc3WLq4rwhooJK2qQASamRd0LLqi8v
         0nsT3a0i9p6GznJtZM9Rw5a/cRN4vv7+2IdP0gcGP3RTCmv6xh+/K6VgBZ1Ol9ekU5Bq
         XSKQLnhA9ozJmQw4X1sdTN7ZvDVQzNS2d9j6v5Fan3V901aBYmAbzj5hWM0OWYEwGdOK
         WjpA==
X-Gm-Message-State: AJIora+0uilUZr5NXPLP7VI8W4EaGqORAG7dZkCUspq4I+dSsOHx1JPO
	DUPs/X+RYcKqlq7CizwtVQ4=
X-Google-Smtp-Source: AGRyM1sRtrsuQuzCfjcf7lUp2PQTiLP05lqRjX8Jhrrxh7WI2thOAB1H+VjvYu/axVXSqK04FGuj3Q==
X-Received: by 2002:a17:902:f606:b0:168:ecca:44e with SMTP id n6-20020a170902f60600b00168ecca044emr6130806plg.144.1656459849291;
        Tue, 28 Jun 2022 16:44:09 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:75aa:d6ca:4354:6033? ([2001:df0:0:200c:75aa:d6ca:4354:6033])
        by smtp.gmail.com with ESMTPSA id t11-20020a17090a510b00b001e2fade86c1sm489400pjh.2.2022.06.28.16.43.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jun 2022 16:44:08 -0700 (PDT)
Message-ID: <9334bac7-c9d3-b17b-f6d6-12c4bec3d138@gmail.com>
Date: Wed, 29 Jun 2022 11:43:55 +1200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 3/3] arch/*/: remove CONFIG_VIRT_TO_BUS
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>
References: <20220617125750.728590-1-arnd@kernel.org>
 <20220617125750.728590-4-arnd@kernel.org>
 <6ba86afe-bf9f-1aca-7af1-d0d348d75ffc@gmail.com>
 <CAMuHMdVewn0OYA9oJfStk0-+vCKAUou+4Mvd5H2kmrSks1p5jg@mail.gmail.com>
 <b4e5a1c9-e375-63fb-ec7c-abb7384a6d59@gmail.com>
 <9289fd82-285c-035f-5355-4d70ce4f87b0@gmail.com>
 <CAK8P3a1ivqYB38c_QTjG8e85ZBnCB6HEa-6LR1HDc8shG1Pwmw@mail.gmail.com>
 <b1edec96-ccb2-49d6-323b-1abc0dc37a50@gmail.com>
 <CAK8P3a2jvFQBvKfdR5ivDBECN5tEej6Ja4=7Loze646hrQ5wzg@mail.gmail.com>
From: Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <CAK8P3a2jvFQBvKfdR5ivDBECN5tEej6Ja4=7Loze646hrQ5wzg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Linux-Arch <linux-arch@vger.kernel.org>, scsi <linux-scsi@vger.kernel.org>, Christoph Hellwig <hch@infradead.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Jakub Kicinski <kuba@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Denis Efremov <efremov@linux.com>, linux-m68k <linux-m68k@lists.linux-m68k.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Khalid Aziz <khalid@gonehiking.org>, Miquel van Smoorenburg <mikevs@xs4all.net>, Parisc List <linux-parisc@vger.kernel.org>, Robin Murphy <robin.murphy@arm.com>, Matt Wang <wwentao@vmware.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mark Salyzyn <salyzyn@android.com>, Linux IOMMU <iommu@lists.linux-foundation.org>, alpha <linux-alpha@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "Maciej W . Rozycki" <macro@orcam.me.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Arnd,

On 29/06/22 09:55, Arnd Bergmann wrote:
> On Tue, Jun 28, 2022 at 11:38 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
>> On 28/06/22 19:08, Arnd Bergmann wrote:
>>> I see two other problems with your patch though:
>>>
>>> a) you still duplicate the cache handling: the cache_clear()/cache_push()
>>> is supposed to already be done by dma_map_single() when the device
>>> is not cache-coherent.
>> That's one of the 'liberties' I alluded to. The reason I left these in
>> is that I'm none too certain what device feature the DMA API uses to
>> decide a device isn't cache-coherent. If it's dev->coherent_dma_mask,
>> the way I set up the device in the a3000 driver should leave the
>> coherent mask unchanged. For the Zorro drivers, devices are set up to
>> use the same storage to store normal and coherent masks - something we
>> most likely want to change. I need to think about the ramifications of
>> that.
>>
>> Note that zorro_esp.c uses dma_sync_single_for_device() and uses a 32
>> bit coherent DMA mask which does work OK. I might  ask Adrian to test a
>> change to only set dev->dma_mask, and drop the
>> dma_sync_single_for_device() calls if there's any doubt on this aspect.
> The "coherent_mask" is independent of the cache flushing. On some
> architectures, a device can indicate whether it needs cache management
> or not to guarantee coherency, but on m68k it appears that we always
> assume it does, see arch/m68k/kernel/dma.c

Thanks - what I see there indicates that on the relevant platforms, 
pages mapped for DMA have their page table cache bits modified to make 
them non-cacheable (and I suppose unmapping restores the default cache 
bits). That means I should use dma_set_mask_and_coherent() here to take 
advantage of this, and no need to mess around with 
dma_sync_single_for_device() in the drivers' dma_setup() functions.

>>> b) The bounce buffer is never mapped here, instead you have the
>>> virt_to_phys() here, which is not the same. I think you need to map
>>> the pointer that actually gets passed down to the device after deciding
>>> to use a bouce buffer or not.
>> I hadn't realized that I can map the bounce buffer just as it's done for
>> the SCp data buffer. Should have been obvious, but I'm still learning
>> about the DMA API.
>>
>> I've updated the patch now, will re-send as part of a complete series
>> once done.
> I suppose you can just drop the bounce buffer if this just comes
> from kmalloc().

That's only true for a3000 and mvme147 though.

Cheers,

     Michael

>
>         Arnd
