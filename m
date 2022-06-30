Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D57562316
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jun 2022 21:26:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LYpHH0h0gz3ds2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Jul 2022 05:26:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=iWoDQJ/d;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=schmitzmic@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=iWoDQJ/d;
	dkim-atps=neutral
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LYpGf40mKz2xKx
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Jul 2022 05:26:18 +1000 (AEST)
Received: by mail-pf1-x42a.google.com with SMTP id 136so330509pfy.10
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jun 2022 12:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=BGB9eQ8ZjliFMgcRVKHE6urD7afsm+Bb1aKDYwW5Jfo=;
        b=iWoDQJ/dSdAde8AnIfDLxTdgiCOtOm+79LF23IYKQzTSvSChn0RKCEgkrj6yW/aq/L
         Ng7bKjXng0gluiBq2N+qXVNpXYJtqS/oCtHvj7VFuOyHwQQMfGgLnLNQOCJAEJPkpiFz
         k9OtgFn1UYqtdFU3SJ6Burv7HN7xACp19dipB8UXOnRrfrcJd6leCbIArojfXdQMEk7Y
         dmdguQ+pTW3/V2p6m9x2fWOO9yUsbTxLRRBRVk14fYaRWck/UzINDGudetShPegD8vs/
         9UYWZVqajm4CeiChNVdfJ+MpdaPqsySivwBLzVcXqDzRte+YXhoifrJyNvp0EqNB047u
         BQTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=BGB9eQ8ZjliFMgcRVKHE6urD7afsm+Bb1aKDYwW5Jfo=;
        b=gnOnd6M/LHjFLEurN0XUHrbpJoP2yUUDHsgw1ysID7ICQcOrzY99X/kbgf/BTQFAW5
         scOaVsggKj/GGtBbx81v5d1kKz/KQIf+O4HynvVtrFCtbHktWaJZTHsWHCEhz5NmdMEs
         ZuCkeEwtQBhqS0fBxBNQO+iiEa1+tX5Zf8opm0Pc1aZ60IlCFAGLwmeJe09sJnO4e5VR
         xBJn+YN9oIGQPTHJRgxD1JPBhGlD1GHZ1gKpVFWFjejFsOhKHcGNxjALMCmEpuSQg3To
         gpf18utGo+PTfUHHq1+AMx69LodRh0EL4E0fOL462pWpWBeokF8J1wx4tS+6sTarE83B
         CZLw==
X-Gm-Message-State: AJIora9myEIIg9ROboCsvsjlJFWvyjD/VevEBEfQhrs7fs/QqJp4F0dV
	HcMyyJIqXoExKOeL3H5Du+Y=
X-Google-Smtp-Source: AGRyM1tk83J3rH/OFTSOHRQYyzuFUGQ/lxtqXLEqqvb1V70fRLzAxXraPK8BYuQ19iCr74oVBVR7bQ==
X-Received: by 2002:a63:4a0b:0:b0:40d:d4c1:131f with SMTP id x11-20020a634a0b000000b0040dd4c1131fmr8603747pga.242.1656617175475;
        Thu, 30 Jun 2022 12:26:15 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:b411:35d2:9458:bbe5? ([2001:df0:0:200c:b411:35d2:9458:bbe5])
        by smtp.gmail.com with ESMTPSA id c18-20020a621c12000000b0051bbd79fc9csm13969994pfc.57.2022.06.30.12.26.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jun 2022 12:26:14 -0700 (PDT)
Message-ID: <13e45965-4e55-11b1-bfdc-59efaad27464@gmail.com>
Date: Fri, 1 Jul 2022 07:26:05 +1200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 3/3] arch/*/: remove CONFIG_VIRT_TO_BUS
Content-Language: en-US
To: Christoph Hellwig <hch@infradead.org>
References: <20220617125750.728590-1-arnd@kernel.org>
 <20220617125750.728590-4-arnd@kernel.org>
 <6ba86afe-bf9f-1aca-7af1-d0d348d75ffc@gmail.com>
 <CAMuHMdVewn0OYA9oJfStk0-+vCKAUou+4Mvd5H2kmrSks1p5jg@mail.gmail.com>
 <b4e5a1c9-e375-63fb-ec7c-abb7384a6d59@gmail.com>
 <9289fd82-285c-035f-5355-4d70ce4f87b0@gmail.com>
 <CAK8P3a1ivqYB38c_QTjG8e85ZBnCB6HEa-6LR1HDc8shG1Pwmw@mail.gmail.com>
 <b1edec96-ccb2-49d6-323b-1abc0dc37a50@gmail.com>
 <YrvwZi9NQSpFjStX@infradead.org>
From: Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <YrvwZi9NQSpFjStX@infradead.org>
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
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Linux-Arch <linux-arch@vger.kernel.org>, scsi <linux-scsi@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Jakub Kicinski <kuba@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Miquel van Smoorenburg <mikevs@xs4all.net>, Denis Efremov <efremov@linux.com>, linux-m68k <linux-m68k@lists.linux-m68k.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Khalid Aziz <khalid@gonehiking.org>, Arnd Bergmann <arnd@kernel.org>, Parisc List <linux-parisc@vger.kernel.org>, Robin Murphy <robin.murphy@arm.com>, Matt Wang <wwentao@vmware.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mark Salyzyn <salyzyn@android.com>, Linux IOMMU <iommu@lists.linux-foundation.org>, alpha <linux-alpha@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "Maciej W . Rozycki" <macro@orcam.me.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christoph,

On 29/06/22 18:25, Christoph Hellwig wrote:
> On Wed, Jun 29, 2022 at 09:38:00AM +1200, Michael Schmitz wrote:
>> That's one of the 'liberties' I alluded to. The reason I left these in is
>> that I'm none too certain what device feature the DMA API uses to decide a
>> device isn't cache-coherent.
> The DMA API does not look at device features at all.  It needs to be
> told so by the platform code.  Once an architecture implements the
> hooks to support non-coherent DMA all devices are treated as
> non-coherent by default unless overriden by the architecture either
> globally (using the global dma_default_coherent variable) or per-device
> (using the dev->dma_coherent field, usually set by arch_setup_dma_ops).
Haven't got any of that, so non-coherent DMA is all we can use (even 
though some of the RAM used for bounce buffers may actually be coherent 
due to the page table cache bits).
>
>> If it's dev->coherent_dma_mask, the way I set
>> up the device in the a3000 driver should leave the coherent mask unchanged.
>> For the Zorro drivers, devices are set up to use the same storage to store
>> normal and coherent masks - something we most likely want to change. I need
>> to think about the ramifications of that.
> No, the coherent mask is slightly misnamed amd not actually related.

Thanks, that had me confused.

Cheers,

     Michael


