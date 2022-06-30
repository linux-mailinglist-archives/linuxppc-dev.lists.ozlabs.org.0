Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D34456230A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jun 2022 21:22:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LYpBZ01Ykz3dqF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Jul 2022 05:22:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Ryekk371;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52d; helo=mail-pg1-x52d.google.com; envelope-from=schmitzmic@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Ryekk371;
	dkim-atps=neutral
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LYp9s1Cr7z3bkV
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Jul 2022 05:22:08 +1000 (AEST)
Received: by mail-pg1-x52d.google.com with SMTP id g4so276529pgc.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jun 2022 12:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=l005vzshb3NCX9X2VM+PRHsKSH+cwoE8+hpxYOqA4As=;
        b=Ryekk371jQ1QiVX/pYGZ1Fxnqlqp0Twrw4fdw7rwXdWNZd8linJuCpYUZVY+Q0iPyf
         MQtHmLDECOfQliv0UkVXxBpP1oEkjtqBA+m+vXUw7eTKeZQm+pLSA86FeQvRbD+P0G11
         vgeXEKD6isj/F1Ee/eKIdEVU/vkXQM/wI5kbLINfslHCrrzOI44xnSHDUGCbhqvwVddM
         j34tTrE1+UG2QZsXwyPCsEBPg2rxRpPI3L1pBalHzCrfK7rgExkmBMwK3cN5a26ttPxc
         nujxQaN3aRGOZJRNQAC0dUIV+4oE8cjHO5gI3kzVIoJ4RZMsmRwklddwhggK/OvBOGty
         iS1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=l005vzshb3NCX9X2VM+PRHsKSH+cwoE8+hpxYOqA4As=;
        b=5JMkbT+tbVIx8xvtxLIy8wMoNcsvFklK2uAYceo00BDjLat4o2v0w1bFfND0GLKwdF
         2NcnTYoUANhj7Gnc6O6JsXuSTHXFixyAqWEIck1U66Ctz2lMvS9J0UwiP7JH6gvXxKug
         Tq3b9PkeanBFokbQgAsRPiLpJx37R9VT4hg5vTRUM8DDtepMZv4xCC5WSRfGDqPhnxqH
         ovQ9tk5c4MWYew4r2+3kHDxAW0SMsD9dIBB64bIln5NeyBVlL8nhC3wVeXRiXohIng/z
         exFwqZ0dtj0hHv0RVcraZAAF7pKfnRqJsqdo1YevVlgXVMzhgNJDJU33v4hVlhDBGc8W
         woYQ==
X-Gm-Message-State: AJIora/hiGwrHe07vgCuZc1dhJmkMZBAxTaQYLkdMRFH1/sxdkWhFHEV
	21glCO1T/sYs7qsDOcIxZrc=
X-Google-Smtp-Source: AGRyM1slOrPQAMr1SPYrSza35gnZ53yO5OmKuyILVUgGuCU6HEAC2pr8Byjfbqxc2GodF/4gt0QEFw==
X-Received: by 2002:a05:6a00:21c8:b0:4fd:f89f:ec0e with SMTP id t8-20020a056a0021c800b004fdf89fec0emr17286632pfj.83.1656616925098;
        Thu, 30 Jun 2022 12:22:05 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:b411:35d2:9458:bbe5? ([2001:df0:0:200c:b411:35d2:9458:bbe5])
        by smtp.gmail.com with ESMTPSA id q13-20020a170902a3cd00b0016403cae7desm13907355plb.276.2022.06.30.12.21.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jun 2022 12:22:03 -0700 (PDT)
Message-ID: <c1d245ae-54c3-ec2b-e975-d50f9a863d2b@gmail.com>
Date: Fri, 1 Jul 2022 07:21:53 +1200
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
 <CAMuHMdXUihTPD9A9hs__Xr2ErfOqkZ5KgCHqm+9HvRf39uS5kA@mail.gmail.com>
 <c30bc9b6-6ccd-8856-dc6b-4e16450dad6f@gmail.com>
 <CAK8P3a1rxEVwVF5U-PO6pQkfURU5Tro1Qp8SPUfHEV9jjWOmCQ@mail.gmail.com>
 <9f812d3d-0fcd-46e6-6d7e-6d4bf66f24ab@gmail.com>
 <YrvvfpW4MmQiM47H@infradead.org>
From: Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <YrvvfpW4MmQiM47H@infradead.org>
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

On 29/06/22 18:21, Christoph Hellwig wrote:
> On Wed, Jun 29, 2022 at 11:09:00AM +1200, Michael Schmitz wrote:
>> And all SCSI buffers are allocated using kmalloc? No way at all for user
>> space to pass unaligned data?
> Most that you will see actually comes from the page allocator.  But
> the block layer has a dma_alignment limit, and when userspace sends
> I/O that is not properly aligned it will be bounce buffered before
> it it sent to the driver.

That limit is set to L1_CACHE_BYTES on m68k so we're good here.

Thanks,

     Michael


