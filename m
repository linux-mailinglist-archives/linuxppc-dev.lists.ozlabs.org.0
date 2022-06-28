Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 45AC055F072
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 23:38:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXdJV1DDBz3cgW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 07:38:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Hl4POJee;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::530; helo=mail-pg1-x530.google.com; envelope-from=schmitzmic@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Hl4POJee;
	dkim-atps=neutral
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXdHp1KQKz3bsl
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jun 2022 07:38:12 +1000 (AEST)
Received: by mail-pg1-x530.google.com with SMTP id 184so13386657pga.12
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jun 2022 14:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=WjW+6GW3ETFm2JU8jE79XhUoTv6z3/GSxYftllUP/xs=;
        b=Hl4POJee6IPPulGeCkhFVzmaewHFoLW/+/aEoDQjxUpbODhZ1oymIgaTqZ81qNcby5
         tayUWDYOl9MImX18J8dQD7IqMr+zmUU1bqZHU+pNimB587Iq3zDvd9733Lpd08PJ3ZqN
         hCcDuWiBdimpZlnAS7LXz+VIQLfHxUzeRmXR/DhhOL+83rGT7oCb0qCs+I3LD5qbJUOY
         Z7gwLbNztnnB2BuHaZLhgR2hoazBRvaRufJfP7NUdv99H5O/s5nLD+ERJ1SZjBEJ5o3/
         g1yNYiH51zSIYiit2licB5Pp4Mw6FaB2n5sZmRFysJGeMTkqmhnQmnjN1azWYVr/4Saz
         dDKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=WjW+6GW3ETFm2JU8jE79XhUoTv6z3/GSxYftllUP/xs=;
        b=VOFWVCJ2f32+5az+obiwg/NLDPq8XoGX+itHNDVIqtWkFDnQ+moe07oNUbtgEeI30k
         T8Yea6B80h9qkboskySfrNCCMkqzZ0Yda7V8MB2HvcKZb5tq8tkUXbp5LH8W+lNYTarY
         KzABsYStKv4PF032NPuQvwb551ZDfyESn4OPog/CT0bk/903l//yskXT7Uw+tGl8L7Yz
         krJuvCoBDINxyRSLuWW0PKof/LmUBCWmP9Cfc7xSvuo/CLTd4sG9WYf/8tbCRETj/1pM
         XweTu7dTtC0LsZQWeIzjhKYuHBh25998dNqkoSlZExcK9hG45hmvT83BlO5g3BqTXN/s
         1MFQ==
X-Gm-Message-State: AJIora9dUl0pnWuv0mxPPuLKRh6e5PunsMlPvBNURhuFSD55IPZkzJRi
	2AQEFuP3Ou6hEz+LtWuLOPw=
X-Google-Smtp-Source: AGRyM1sFO6YgYAr9GnaRe8/Ve8aBPD9B79jMLNzzxljl0q+mxUt4Mwk0qg0QIVqzTJY3FgSvSPWrFw==
X-Received: by 2002:a63:3545:0:b0:40c:95f7:d114 with SMTP id c66-20020a633545000000b0040c95f7d114mr5443pga.150.1656452290295;
        Tue, 28 Jun 2022 14:38:10 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:75aa:d6ca:4354:6033? ([2001:df0:0:200c:75aa:d6ca:4354:6033])
        by smtp.gmail.com with ESMTPSA id b8-20020a170902650800b00168a651316csm9770467plk.270.2022.06.28.14.38.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jun 2022 14:38:09 -0700 (PDT)
Message-ID: <b1edec96-ccb2-49d6-323b-1abc0dc37a50@gmail.com>
Date: Wed, 29 Jun 2022 09:38:00 +1200
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
From: Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <CAK8P3a1ivqYB38c_QTjG8e85ZBnCB6HEa-6LR1HDc8shG1Pwmw@mail.gmail.com>
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

On 28/06/22 19:08, Arnd Bergmann wrote:
> On Tue, Jun 28, 2022 at 5:25 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
>> Am 28.06.2022 um 09:12 schrieb Michael Schmitz:
>>
>> Leaving the bounce buffer handling in place, and taking a few other
>> liberties - this is what converting the easiest case (a3000 SCSI) might
>> look like. Any obvious mistakes? The mvme147 driver would be very
>> similar to handle (after conversion to a platform device).
>>
>> The driver allocates bounce buffers using kmalloc if it hits an
>> unaligned data buffer - can such buffers still even happen these days?
>> If I understand dma_map_single() correctly, the resulting dma handle
>> would be equally misaligned?
>>
>> To allocate a bounce buffer, would it be OK to use dma_alloc_coherent()
>> even though AFAIU memory used for DMA buffers generally isn't consistent
>> on m68k?
> I think it makes sense to skip the bounce buffering as you do here:
> the only standardized way we have for integrating that part is to
> use the swiotlb infrastructure, but as you mentioned earlier that
> part is probably too resource-heavy here for Amiga.
OK, leaving the old custom logic in place allows to convert the 24 bit 
DMA drivers more easily.
>
> I see two other problems with your patch though:
>
> a) you still duplicate the cache handling: the cache_clear()/cache_push()
> is supposed to already be done by dma_map_single() when the device
> is not cache-coherent.

That's one of the 'liberties' I alluded to. The reason I left these in 
is that I'm none too certain what device feature the DMA API uses to 
decide a device isn't cache-coherent. If it's dev->coherent_dma_mask, 
the way I set up the device in the a3000 driver should leave the 
coherent mask unchanged. For the Zorro drivers, devices are set up to 
use the same storage to store normal and coherent masks - something we 
most likely want to change. I need to think about the ramifications of 
that.

Note that zorro_esp.c uses dma_sync_single_for_device() and uses a 32 
bit coherent DMA mask which does work OK. I might  ask Adrian to test a 
change to only set dev->dma_mask, and drop the 
dma_sync_single_for_device() calls if there's any doubt on this aspect.

> b) The bounce buffer is never mapped here, instead you have the
> virt_to_phys() here, which is not the same. I think you need to map
> the pointer that actually gets passed down to the device after deciding
> to use a bouce buffer or not.

I hadn't realized that I can map the bounce buffer just as it's done for 
the SCp data buffer. Should have been obvious, but I'm still learning 
about the DMA API.

I've updated the patch now, will re-send as part of a complete series 
once done.

Cheers,

     Michael


>
>       Arnd
