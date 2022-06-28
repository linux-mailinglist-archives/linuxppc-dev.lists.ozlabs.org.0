Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CD655F1C5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 01:09:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXgKS2hrNz3dpV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 09:09:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=EqbuEMnr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b; helo=mail-pj1-x102b.google.com; envelope-from=schmitzmic@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=EqbuEMnr;
	dkim-atps=neutral
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXgJn1Jqrz3bpg
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jun 2022 09:09:12 +1000 (AEST)
Received: by mail-pj1-x102b.google.com with SMTP id i8-20020a17090aee8800b001ecc929d14dso31317pjz.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jun 2022 16:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=dNlrbJyo72p6W86+4oHtq0SFKKEweCfCqBRbkZwsc7M=;
        b=EqbuEMnrslAV+CNK7icH3sIdyHFdJJt4o0XreMd9PWJnnZD3urkUIczP47SLJfHLt2
         a9Hb2RY2iAMPDYrZzzSebZiLkEkZAZ2GjO1a/YmSZkK2Xp17oEjfDGogNixZdLL3HOfT
         MzvWAi3e8vTQIn19ErTtVtK9046FovgWZzO54p+FjfQ0vKr2M4MHFIDFYcsnV6vwqKlZ
         OpVSBU4xgvKUep3BWnCx5mqYbaYMbM8l8r4kRGa0fyiirmqh9Q5Jv5kmLBa0iY42WhAG
         mXPGja9Jz5H3RSM3uxCyFKm/5U62U9tV2w1DJBxZ5P0LBgo5T9Yd1NziQJflQEY9hQZf
         YhCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=dNlrbJyo72p6W86+4oHtq0SFKKEweCfCqBRbkZwsc7M=;
        b=1s3K+keguWlUDjIFU1eCQOJWZkJX0mP/d4WPjPTXUFbdSE6/+89P2hDVQ8zMp1oquK
         WHIHcymczCHwxeYS4PDvH+sd52v2laWDJOxggDyBy5LMlqlojXALM3fTMEMl+ebpIXV7
         Hcup9ZxLhyZw8Hn7xzweJCAzSuw4DaPIkO7DfGDgksNoFSu3Li9j5sE3GcZz+KhpFosV
         Fg1onCRVFxFruNJqDenFpsp21O+xIrbWyvjpkThpN57whZQGTQmc5PFke16gapoko1nQ
         A8F4ZzX+fPewpbFk6v6ARQ942xjjBVVYx3oRF2X8HVZ1YNezJtDMK2xG43skFsxOqFlf
         D9Tg==
X-Gm-Message-State: AJIora8hBmc6eDFEFOiOzhyknp9rUKeBWlD57prrzbQCzbIHAXzcGl1Q
	zMxsv/Q/h9ErM+fl5NEvFmU=
X-Google-Smtp-Source: AGRyM1sKFPd7rmb+HZNy3hqqLYOU4RMipHtRZ0GXpNrqgiP6rjxKGk/MTbwV1Q3gFv+zgJ5mODs7jg==
X-Received: by 2002:a17:902:d50e:b0:16a:13d:30ab with SMTP id b14-20020a170902d50e00b0016a013d30abmr7366924plg.31.1656457750171;
        Tue, 28 Jun 2022 16:09:10 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:75aa:d6ca:4354:6033? ([2001:df0:0:200c:75aa:d6ca:4354:6033])
        by smtp.gmail.com with ESMTPSA id jy18-20020a17090b325200b001e31803540fsm450854pjb.6.2022.06.28.16.09.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jun 2022 16:09:09 -0700 (PDT)
Message-ID: <9f812d3d-0fcd-46e6-6d7e-6d4bf66f24ab@gmail.com>
Date: Wed, 29 Jun 2022 11:09:00 +1200
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
 <CAMuHMdXUihTPD9A9hs__Xr2ErfOqkZ5KgCHqm+9HvRf39uS5kA@mail.gmail.com>
 <c30bc9b6-6ccd-8856-dc6b-4e16450dad6f@gmail.com>
 <CAK8P3a1rxEVwVF5U-PO6pQkfURU5Tro1Qp8SPUfHEV9jjWOmCQ@mail.gmail.com>
From: Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <CAK8P3a1rxEVwVF5U-PO6pQkfURU5Tro1Qp8SPUfHEV9jjWOmCQ@mail.gmail.com>
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

On 29/06/22 09:50, Arnd Bergmann wrote:
> On Tue, Jun 28, 2022 at 11:03 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
>> On 28/06/22 19:03, Geert Uytterhoeven wrote:
>>>> The driver allocates bounce buffers using kmalloc if it hits an
>>>> unaligned data buffer - can such buffers still even happen these days?
>>> No idea.
>> Hmmm - I think I'll stick a WARN_ONCE() in there so we know whether this
>> code path is still being used.
> kmalloc() guarantees alignment to the next power-of-two size or
> KMALLOC_MIN_ALIGN, whichever is bigger. On m68k this means it
> is cacheline aligned.

And all SCSI buffers are allocated using kmalloc? No way at all for user 
space to pass unaligned data?

(SCSI is a weird beast - I have used a SCSI DAT tape driver many many 
years ago, which broke all sorts of assumptions about transfer block 
sizes ... but that might actually have been in the v0.99 days, many 
rewrites of SCSI midlevel ago).

Just being cautious, as getting any of this tested will be a stretch.

Cheers,

     Michael

>
>        Arnd
