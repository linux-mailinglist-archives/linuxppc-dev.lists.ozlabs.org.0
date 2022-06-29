Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9825755F227
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 02:02:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXhTz3KJsz3drt
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 10:02:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=D7i2Nged;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52d; helo=mail-pg1-x52d.google.com; envelope-from=schmitzmic@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=D7i2Nged;
	dkim-atps=neutral
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXhTP3zSyz3bq3
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jun 2022 10:01:44 +1000 (AEST)
Received: by mail-pg1-x52d.google.com with SMTP id q140so13671970pgq.6
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jun 2022 17:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=0kpjfuIly1nOW0q2ELB2CmN7oIQ7HX+3B2PaKKHsB78=;
        b=D7i2NgedY/bHyI8emNN+y0jr/G9IOYRWkIjlIhVn6DbWgwRG2UARyfZk3UwO7T2V+D
         ESqmy18MQo7RMsisYmEMOTQj203NqQOZVs7qiFGDUYY81Hru7Iv0ADFCQgagZlaKMdVq
         xung15+Nlj1soULvCk9mS+bfRYyJ9ltpn9UcH1mz1cQDWfJ2ax2IcuBr2SQ3tsjHpoK1
         NeL3oeSuqVVYbcSBohKZ73kauU8T3VpyxipPF6h/oJ8e2qxtdKJwYj9HlUbwfye7QPMt
         PuFn7aX0KOb+qDfsVshvX0sC/38kqLR1JFdKMTuOuvGx8cb2fuTFMwQneoiKRpnAUU2m
         4Xkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=0kpjfuIly1nOW0q2ELB2CmN7oIQ7HX+3B2PaKKHsB78=;
        b=BW3fpgnUF1Gn5mAc8FN4NvIrhKxgbu00y/nzjDONywC/IqkdE/LlBmEwUTg3MExRMb
         IUEY4k78aoYQ2sBZXdQSbzLZeBSC2QR27UwAznm7vplfoUhimZjxcADxKAj6ULohVUER
         1JK7svvTtchfnm1GR431nq2aSRt6fGGO5IWrlo7ObaHPlVAWwdk5EcrYGwwthUDswkBz
         FLxBAuxsWmr35iaDsOegqA6ogtbb/ypfq7DwZ6oMSNMB09hPxZp6kwG/AOuzHt9/+ZFk
         km/C0kymHhHQmLKSa+4Aq3W9QtJsq6UykY2mD0x2r0MZpgNdsmyJ+sAHZTYwjsRxID3Y
         D5aA==
X-Gm-Message-State: AJIora+VpZO3YtOATtGmXRL0zocXy3b2M3PHVORIgAYRq+E/RHHhnWx2
	rp31dI9hlQi5cIkNijzGBak=
X-Google-Smtp-Source: AGRyM1uB9qD4Z15I0Lke4zy2AkjVbLhbeqqf5QXYDPBQAVzl/v0z9XhcHbOncWmuxVZyAGIQBi5g6Q==
X-Received: by 2002:a63:2b16:0:b0:3fa:faf9:e6d7 with SMTP id r22-20020a632b16000000b003fafaf9e6d7mr446010pgr.325.1656460900460;
        Tue, 28 Jun 2022 17:01:40 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:75aa:d6ca:4354:6033? ([2001:df0:0:200c:75aa:d6ca:4354:6033])
        by smtp.gmail.com with ESMTPSA id cd21-20020a056a00421500b0051b32c2a5a7sm9863096pfb.138.2022.06.28.17.01.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jun 2022 17:01:39 -0700 (PDT)
Message-ID: <859c2adc-d3cb-64e8-faba-06e1ac5eddaf@gmail.com>
Date: Wed, 29 Jun 2022 12:01:24 +1200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 3/3] arch/*/: remove CONFIG_VIRT_TO_BUS
Content-Language: en-US
To: Bart Van Assche <bvanassche@acm.org>, Arnd Bergmann <arnd@kernel.org>
References: <20220617125750.728590-1-arnd@kernel.org>
 <20220617125750.728590-4-arnd@kernel.org>
 <6ba86afe-bf9f-1aca-7af1-d0d348d75ffc@gmail.com>
 <CAMuHMdVewn0OYA9oJfStk0-+vCKAUou+4Mvd5H2kmrSks1p5jg@mail.gmail.com>
 <b4e5a1c9-e375-63fb-ec7c-abb7384a6d59@gmail.com>
 <9289fd82-285c-035f-5355-4d70ce4f87b0@gmail.com>
 <CAMuHMdXUihTPD9A9hs__Xr2ErfOqkZ5KgCHqm+9HvRf39uS5kA@mail.gmail.com>
 <c30bc9b6-6ccd-8856-dc6b-4e16450dad6f@gmail.com>
 <CAK8P3a1rxEVwVF5U-PO6pQkfURU5Tro1Qp8SPUfHEV9jjWOmCQ@mail.gmail.com>
 <9f812d3d-0fcd-46e6-6d7e-6d4bf66f24ab@gmail.com>
 <fc47e8da-81d3-e563-0a17-4eb23db015cc@acm.org>
From: Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <fc47e8da-81d3-e563-0a17-4eb23db015cc@acm.org>
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

Hi Bart,

On 29/06/22 11:50, Bart Van Assche wrote:
> On 6/28/22 16:09, Michael Schmitz wrote:
>> On 29/06/22 09:50, Arnd Bergmann wrote:
>>> On Tue, Jun 28, 2022 at 11:03 PM Michael Schmitz 
>>> <schmitzmic@gmail.com> wrote:
>>>> On 28/06/22 19:03, Geert Uytterhoeven wrote:
>>>>>> The driver allocates bounce buffers using kmalloc if it hits an
>>>>>> unaligned data buffer - can such buffers still even happen these 
>>>>>> days?
>>>>> No idea.
>>>> Hmmm - I think I'll stick a WARN_ONCE() in there so we know whether 
>>>> this
>>>> code path is still being used.
>>> kmalloc() guarantees alignment to the next power-of-two size or
>>> KMALLOC_MIN_ALIGN, whichever is bigger. On m68k this means it
>>> is cacheline aligned.
>>
>> And all SCSI buffers are allocated using kmalloc? No way at all for 
>> user space to pass unaligned data?
>>
>> (SCSI is a weird beast - I have used a SCSI DAT tape driver many many 
>> years ago, which broke all sorts of assumptions about transfer block 
>> sizes ... but that might actually have been in the v0.99 days, many 
>> rewrites of SCSI midlevel ago).
>>
>> Just being cautious, as getting any of this tested will be a stretch.
>
> An example of a user space application that passes an SG I/O data 
> buffer to the kernel that is aligned to a four byte boundary but not 
> to an eight byte boundary if the -s (scattered) command line option is 
> used: 
> https://github.com/osandov/blktests/blob/master/src/discontiguous-io.cpp

Thanks - four byte alignment actually wouldn't be an issue for me. It's 
two byte or smaller that would trip up the SCSI DMA.

While I'm sure such an even more pathological test case could be 
written, I was rather worried about st.c and sr.c input ...

Cheers,

     Michael

>
> Bart.
