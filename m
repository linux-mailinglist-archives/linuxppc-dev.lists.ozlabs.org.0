Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CC755BC16
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jun 2022 23:13:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LX0nc5XHnz3cgt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 07:13:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=UuI0dBFg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=schmitzmic@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=UuI0dBFg;
	dkim-atps=neutral
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LX0mx3hjvz3blH
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jun 2022 07:12:48 +1000 (AEST)
Received: by mail-pf1-x42f.google.com with SMTP id x138so7460207pfc.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jun 2022 14:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Oa0Pw8WRwWFDk13UOTNU8r4Zj28fKsbMsHZJFWhjWbI=;
        b=UuI0dBFgPO4diTfHy/9LPAgfpBMcc774BorzXErxQR5b8AL+fMoTv1/RUwCaUUs5Wz
         wZ41GicoS5ofRiqUMfzJSjLcsa3Lrxfcq7QsnrIjny3YpmiuCR7VENM6FYB8xkBQFZxV
         /SvrqOuGEaAsBy3VjIJv2hWBCfpevI/Qjf6b6TAcBGWsZyeAXg1pQFprfgEMNNGBMg2o
         tYBcjNK8DJCwca5jr2WTeEiIenBQUcRBZixJW3S/qcpsfVeN23O6kRkqiR3GcuTz6FFB
         bxC1nlLwsXhKrEY7yB3vYz/3Q3omwcdSNomhexVJsFmeYGEIJmGjE/zTpXa346zjItic
         z0yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Oa0Pw8WRwWFDk13UOTNU8r4Zj28fKsbMsHZJFWhjWbI=;
        b=zhCK2e1eSiGSFSgO/Ulg0VQFxKKqcQrFj+zb+g2gN8KPmrVRkpRws+aimOb+OlKpb2
         90TsENyRDytzclLFNrq0qd5Wlz/Y6kgLJ/aBlHiybA15RHfjw7RjfmZwK2xrtjE8TRzA
         1gba8/q17aOh+Bpqp43p88AVHNDmGGtlpmxQWjWsiU0uQnIQuvXxdmdJbnNEf4yk6i32
         8L2cbWyJbBbTmqOhqXrVBI84CwGw2YUeEL9SO5LqZo9KTerp1AWgQ82PTzBlkRVNGtqs
         bqlKukcQaUXfow7YEMR9A3fwy5fyDCPrw8u72aygYE9Hdqbc7zPxYxK2E25FHtq4yvJ8
         P4/g==
X-Gm-Message-State: AJIora9MkdgMTQ8lV+N0UziR3kezK6LLVQJ9ZIUciXHkWnbdZqzaWVu3
	tI9+1cb++3x2HyxuqWlek8Y=
X-Google-Smtp-Source: AGRyM1uTPLx0FmbccmLLTUeOwpDtfjfY9meoJGws1yrh1VdVD8/6CKl+WA5aLqzWBJfSXBuzMThY8A==
X-Received: by 2002:a05:6a00:2311:b0:4e1:52bf:e466 with SMTP id h17-20020a056a00231100b004e152bfe466mr16676782pfh.77.1656364364243;
        Mon, 27 Jun 2022 14:12:44 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:310d:de36:ea8e:ce87? ([2001:df0:0:200c:310d:de36:ea8e:ce87])
        by smtp.gmail.com with ESMTPSA id v11-20020a17090a6b0b00b001ece55b938asm9847689pjj.32.2022.06.27.14.12.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jun 2022 14:12:43 -0700 (PDT)
Message-ID: <b4e5a1c9-e375-63fb-ec7c-abb7384a6d59@gmail.com>
Date: Tue, 28 Jun 2022 09:12:33 +1200
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
From: Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <CAMuHMdVewn0OYA9oJfStk0-+vCKAUou+4Mvd5H2kmrSks1p5jg@mail.gmail.com>
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
Cc: Linux-Arch <linux-arch@vger.kernel.org>, Arnd Bergmann <arnd@kernel.org>, scsi <linux-scsi@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Miquel van Smoorenburg <mikevs@xs4all.net>, linux-m68k <linux-m68k@lists.linux-m68k.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "Maciej W . Rozycki" <macro@orcam.me.uk>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Denis Efremov <efremov@linux.com>, Mark Salyzyn <salyzyn@android.com>, Christoph Hellwig <hch@infradead.org>, Linux IOMMU <iommu@lists.linux-foundation.org>, Matt Wang <wwentao@vmware.com>, Parisc List <linux-parisc@vger.kernel.org>, alpha <linux-alpha@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>, Khalid Aziz <khalid@gonehiking.org>, Robin Murphy <robin.murphy@arm.com>, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Geert,

On 27/06/22 20:26, Geert Uytterhoeven wrote:
> Hi Michael,
>
> On Sat, Jun 18, 2022 at 3:06 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
>> Am 18.06.2022 um 00:57 schrieb Arnd Bergmann:
>>> From: Arnd Bergmann <arnd@arndb.de>
>>>
>>> All architecture-independent users of virt_to_bus() and bus_to_virt()
>>> have been fixed to use the dma mapping interfaces or have been
>>> removed now.  This means the definitions on most architectures, and the
>>> CONFIG_VIRT_TO_BUS symbol are now obsolete and can be removed.
>>>
>>> The only exceptions to this are a few network and scsi drivers for m68k
>>> Amiga and VME machines and ppc32 Macintosh. These drivers work correctly
>>> with the old interfaces and are probably not worth changing.
>> The Amiga SCSI drivers are all old WD33C93 ones, and replacing
>> virt_to_bus by virt_to_phys in the dma_setup() function there would
>> cause no functional change at all.
> FTR, the sgiwd93 driver use dma_map_single().

Thanks! From what I see, it doesn't have to deal with bounce buffers 
though?

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
