Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFCA55F023
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 23:04:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXcXl2X60z3cds
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 07:04:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Plf/V32R;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=schmitzmic@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Plf/V32R;
	dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXcX76BB4z306m
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jun 2022 07:03:51 +1000 (AEST)
Received: by mail-pj1-x1034.google.com with SMTP id i8-20020a17090aee8800b001ecc929d14dso209841pjz.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jun 2022 14:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=LLK2uhNNvPadjp2Oh/1lKQPTCLeKdmpKaTeJ3RDCHv0=;
        b=Plf/V32RTHjAIcY0bkPGhJbIRr6v2P2QgRVB8+7eP0P4RsyHw26WFtNVMjh4450VSL
         X8EowJeUAPv65bojUQi/l4q/mcLgIz1TUZop7B8mMf4UYeSMN97O5PhtCWd4P5KjohDY
         ALLie3yLHIm0bsPU/TnBkkd6JuMbBayFBbZiLBvLd2yar7+HLEz7eMmp19DAOWF3IuTH
         PHvtCurN4N9bl0vEQmQzWlMPAd2VaDMz3hbsjPHd4Xm7SbhJbAT/RBX6xYjOUAqBtWrm
         FLKt/ZIKzNjI8UX/5SZnYKO15W+v0GW/s3+FFXv5IZLkJGau9LvwFj0fBmt76ie2MA/E
         v/wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=LLK2uhNNvPadjp2Oh/1lKQPTCLeKdmpKaTeJ3RDCHv0=;
        b=EsxbhhCHrG7o6AAoolPYDhDsAPaijcReTng/LD94OzlznfeBkXmKkdNw9U0zhZEqTY
         YwT3EeYmhE6M6648yQcToFTdNk3s4kqQJEAoaHT1u2YvDO11Wjl8YGTme3s6hABsGZKC
         yf8Q0eBsjzqic3V+WR0vLR1JfImGsYxta7SGUiFlBGCgsXqlI7BTumFwALNYa9upgEaB
         VAHcRNCQ2p9TRfoWf9ZEWSiNKBA7zHe6HRD10xDwtl8g8MUhoFus9oxQjiSTKUJS9XQi
         iKEWZ0m2f+o9CGlbp6FD8n+94lxl5GD8oDdXgN+obcVKO8bHu52UhDo1wlOteLreI+Ie
         ZREA==
X-Gm-Message-State: AJIora9TmPVYtkQ67+sP6Q/NkfVOa6XFTss6XtXI2cjTMo68eNE/P8vE
	QnZWenp1E7BYfCJbMnOy78Q=
X-Google-Smtp-Source: AGRyM1s3Nd/my/4+QoWL+yZMzu+YZKCug56iAjfd8RAtHTbgADBf9oHlpjvJ/8KE0n/2rDkR0+nsiw==
X-Received: by 2002:a17:90a:1485:b0:1ec:788e:a053 with SMTP id k5-20020a17090a148500b001ec788ea053mr1707919pja.16.1656450227992;
        Tue, 28 Jun 2022 14:03:47 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:75aa:d6ca:4354:6033? ([2001:df0:0:200c:75aa:d6ca:4354:6033])
        by smtp.gmail.com with ESMTPSA id a14-20020aa795ae000000b005259d99ccffsm6254097pfk.8.2022.06.28.14.03.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jun 2022 14:03:47 -0700 (PDT)
Message-ID: <c30bc9b6-6ccd-8856-dc6b-4e16450dad6f@gmail.com>
Date: Wed, 29 Jun 2022 09:03:37 +1200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 3/3] arch/*/: remove CONFIG_VIRT_TO_BUS
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20220617125750.728590-1-arnd@kernel.org>
 <20220617125750.728590-4-arnd@kernel.org>
 <6ba86afe-bf9f-1aca-7af1-d0d348d75ffc@gmail.com>
 <CAMuHMdVewn0OYA9oJfStk0-+vCKAUou+4Mvd5H2kmrSks1p5jg@mail.gmail.com>
 <b4e5a1c9-e375-63fb-ec7c-abb7384a6d59@gmail.com>
 <9289fd82-285c-035f-5355-4d70ce4f87b0@gmail.com>
 <CAMuHMdXUihTPD9A9hs__Xr2ErfOqkZ5KgCHqm+9HvRf39uS5kA@mail.gmail.com>
From: Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <CAMuHMdXUihTPD9A9hs__Xr2ErfOqkZ5KgCHqm+9HvRf39uS5kA@mail.gmail.com>
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
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Linux-Arch <linux-arch@vger.kernel.org>, scsi <linux-scsi@vger.kernel.org>, Christoph Hellwig <hch@infradead.org>, Matt Wang <wwentao@vmware.com>, Jakub Kicinski <kuba@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Miquel van Smoorenburg <mikevs@xs4all.net>, Denis Efremov <efremov@linux.com>, linux-m68k <linux-m68k@lists.linux-m68k.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Khalid Aziz <khalid@gonehiking.org>, Arnd Bergmann <arnd@kernel.org>, Parisc List <linux-parisc@vger.kernel.org>, Robin Murphy <robin.murphy@arm.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mark Salyzyn <salyzyn@android.com>, Linux IOMMU <iommu@lists.linux-foundation.org>, alpha <linux-alpha@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "Maciej W . Rozycki" <macro@orcam.me.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Geert,

On 28/06/22 19:03, Geert Uytterhoeven wrote:
>
>> Leaving the bounce buffer handling in place, and taking a few other
>> liberties - this is what converting the easiest case (a3000 SCSI) might
>> look like. Any obvious mistakes? The mvme147 driver would be very
>> similar to handle (after conversion to a platform device).
> Thanks, looks reasonable.
Thanks, I'll take care of Arnd's comments and post a corrected version 
later.
>> The driver allocates bounce buffers using kmalloc if it hits an
>> unaligned data buffer - can such buffers still even happen these days?
> No idea.
Hmmm - I think I'll stick a WARN_ONCE() in there so we know whether this 
code path is still being used.
>
>> If I understand dma_map_single() correctly, the resulting dma handle
>> would be equally misaligned?
>>
>> To allocate a bounce buffer, would it be OK to use dma_alloc_coherent()
>> even though AFAIU memory used for DMA buffers generally isn't consistent
>> on m68k?
>>
>> Thinking ahead to the other two Amiga drivers - I wonder whether
>> allocating a static bounce buffer or a DMA pool at driver init is likely
>> to succeed if the kernel runs from the low 16 MB RAM chunk? It certainly
>> won't succeed if the kernel runs from a higher memory address, so the
>> present bounce buffer logic around amiga_chip_alloc() might still need
>> to be used here.
>>
>> Leaves the question whether converting the gvp11 and a2091 drivers is
>> actually worth it, if bounce buffers still have to be handled explicitly.
> A2091 should be straight-forward, as A3000 is basically A2091 on the
> motherboard (comparing the two drivers, looks like someone's been
> sprinkling mb()s over the A3000 driver).

Yep, and at least the ones in the dma_setup() function are there for no 
reason (the compiler won't reorder stores around the cache flush calls, 
I hope?).

Just leaves the 24 bit DMA mask there (and likely need for bounce buffers).

> I don't have any of these SCSI host adapters (not counting the A590
> (~A2091) expansion of the old A500, which is not Linux-capable, and
>   hasn't been powered on for 20 years).

I wonder whether kullervo has survived - that one was an A3000. Should 
have gone to Adrian a few years ago...

Cheers,

     Michael


>
> Gr{oetje,eeting}s,
>
>                          Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                  -- Linus Torvalds
