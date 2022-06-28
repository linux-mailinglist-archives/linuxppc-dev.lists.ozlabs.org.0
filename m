Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6505255F20F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 01:50:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXhDg05sMz3drY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 09:50:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.214.178; helo=mail-pl1-f178.google.com; envelope-from=bart.vanassche@gmail.com; receiver=<UNKNOWN>)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXhDC0P4Hz3bpw
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jun 2022 09:50:17 +1000 (AEST)
Received: by mail-pl1-f178.google.com with SMTP id jh14so12492763plb.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jun 2022 16:50:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=SkmGWod1utKevQCGJfPo61gCs9z/vOcHKNlbLZdqJ/g=;
        b=EJUk8fUl7fB9sk9OYmY3/MxWha/Hg2wckckVkC2k8QVU5jYiUr3VL9XYsTi33OyVZG
         chf7bBVamW7Mjm8r6zUF4WLDUdpFVGgyk9h4nJAL4XwudmCrlQ9u7PRFK7zNWsitK3lX
         oNUmbgN/AUdYjoqrt5OZGImYciO3tO4uzqbd0204kklxdK0uDXV+s39gqhRb7TNjeghK
         QT5vEwY2+jVqNriVSEDfZHCDUsrwAUtQiMed0GROZWgch3Y1iWrABjCOx9do1Etjlz3c
         YYM1gm0Johe8WbCiIv14gcdfgpMsffmJ6a6oKxQAW5ThDqCJY/Vvww7rJKE43+jkZQEV
         xn8Q==
X-Gm-Message-State: AJIora9gV0g6lCeDUtwmeF6macAN1YKntlObbg1FrOnULvKkEgUhuSb3
	OOnIpyyKTvioBHIFCgyauT8=
X-Google-Smtp-Source: AGRyM1tnnxYUcJUuaxfKTDWykUv9yEoY4oVypBD4NkfNBc/cSEjrtWY1RB48/mXAX8MoxReO3fVA2g==
X-Received: by 2002:a17:90b:4c0d:b0:1ed:2466:c0d3 with SMTP id na13-20020a17090b4c0d00b001ed2466c0d3mr2517451pjb.6.1656460214627;
        Tue, 28 Jun 2022 16:50:14 -0700 (PDT)
Received: from ?IPV6:2601:647:4000:d7:feaa:14ff:fe9d:6dbd? ([2601:647:4000:d7:feaa:14ff:fe9d:6dbd])
        by smtp.gmail.com with ESMTPSA id cr9-20020a056a000f0900b0052594a3ba89sm6923182pfb.65.2022.06.28.16.50.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jun 2022 16:50:13 -0700 (PDT)
Message-ID: <fc47e8da-81d3-e563-0a17-4eb23db015cc@acm.org>
Date: Tue, 28 Jun 2022 16:50:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 3/3] arch/*/: remove CONFIG_VIRT_TO_BUS
Content-Language: en-US
To: Michael Schmitz <schmitzmic@gmail.com>, Arnd Bergmann <arnd@kernel.org>
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
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <9f812d3d-0fcd-46e6-6d7e-6d4bf66f24ab@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Linux-Arch <linux-arch@vger.kernel.org>, scsi <linux-scsi@vger.kernel.org>, Christoph Hellwig <hch@infradead.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Jakub Kicinski <kuba@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Denis Efremov <efremov@linux.com>, linux-m68k <linux-m68k@lists.linux-m68k.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Khalid Aziz <khalid@gonehiking.org>, Miquel van Smoorenburg <mikevs@xs4all.net>, Parisc List <linux-parisc@vger.kernel.org>, Robin Murphy <robin.murphy@arm.com>, Matt Wang <wwentao@vmware.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mark Salyzyn <salyzyn@android.com>, Linux IOMMU <iommu@lists.linux-foundation.org>, alpha <linux-alpha@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "Maciej W . Rozycki" <macro@orcam.me.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/28/22 16:09, Michael Schmitz wrote:
> On 29/06/22 09:50, Arnd Bergmann wrote:
>> On Tue, Jun 28, 2022 at 11:03 PM Michael Schmitz 
>> <schmitzmic@gmail.com> wrote:
>>> On 28/06/22 19:03, Geert Uytterhoeven wrote:
>>>>> The driver allocates bounce buffers using kmalloc if it hits an
>>>>> unaligned data buffer - can such buffers still even happen these days?
>>>> No idea.
>>> Hmmm - I think I'll stick a WARN_ONCE() in there so we know whether this
>>> code path is still being used.
>> kmalloc() guarantees alignment to the next power-of-two size or
>> KMALLOC_MIN_ALIGN, whichever is bigger. On m68k this means it
>> is cacheline aligned.
> 
> And all SCSI buffers are allocated using kmalloc? No way at all for user 
> space to pass unaligned data?
> 
> (SCSI is a weird beast - I have used a SCSI DAT tape driver many many 
> years ago, which broke all sorts of assumptions about transfer block 
> sizes ... but that might actually have been in the v0.99 days, many 
> rewrites of SCSI midlevel ago).
> 
> Just being cautious, as getting any of this tested will be a stretch.

An example of a user space application that passes an SG I/O data buffer 
to the kernel that is aligned to a four byte boundary but not to an 
eight byte boundary if the -s (scattered) command line option is used: 
https://github.com/osandov/blktests/blob/master/src/discontiguous-io.cpp

Bart.
