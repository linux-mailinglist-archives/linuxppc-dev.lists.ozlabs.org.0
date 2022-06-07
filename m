Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4743253F736
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jun 2022 09:30:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LHMT60ynnz3bl5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jun 2022 17:30:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.160.176; helo=mail-qt1-f176.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LHMSg48KXz3bnP
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jun 2022 17:29:54 +1000 (AEST)
Received: by mail-qt1-f176.google.com with SMTP id ew15so12041484qtb.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Jun 2022 00:29:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/vvSp91df5DXi30Fd3pExmyOkjiZTMAg5zYSvB9bVbM=;
        b=AKkoesU8QJ/pv96FrPEkVb+uqhIXlWkwzSl4lv4gAJqsxAtzXWO6sXVVN6BdlMKUrr
         6TaPwOG4Hjf11eiKynQkMYRHMzeGdAVjzB7+Mkw+MjbUjc6dqxuAe67NHWT9n8C4XyTk
         pVbEHpwuque1gqNjAOG1r5Qw4rayeLAke8N5aHKot6jf+74a/luytHVyjG1TqPpzZ6MB
         uTWXPxRBbGCenWew8LcJxv7YWjaEYGysxBlYdXS7mSLyR+z03j7qeEM05ae0Fb+AtNDA
         96xNhX3ISJmqowpbItW0dPuPjQqBb3yFELDhfCHGMpFpEZmNc/hQCDVk5f4UdZA0g/c6
         mrfA==
X-Gm-Message-State: AOAM532iWJJZqbMJoLapvRo7omZhA7/ht0Jj7gt9czaU7y1uLsGClaVC
	TyfdQq2FQkAOdWa8MX4FaT3lVG8yHKN7Mw==
X-Google-Smtp-Source: ABdhPJx6KEVi6fbYn2G0eSeieL67Zfe2m5gmpq6akCv9DDYfbSaL5R0tSJsoTkfdL1fUBrg5A6mkKw==
X-Received: by 2002:a05:622a:142:b0:304:9915:3789 with SMTP id v2-20020a05622a014200b0030499153789mr21779401qtw.59.1654586990834;
        Tue, 07 Jun 2022 00:29:50 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id j20-20020a05620a411400b006a377a015d4sm14581103qko.39.2022.06.07.00.29.49
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jun 2022 00:29:50 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id f34so29700920ybj.6
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Jun 2022 00:29:49 -0700 (PDT)
X-Received: by 2002:a25:7307:0:b0:65c:b98a:f592 with SMTP id
 o7-20020a257307000000b0065cb98af592mr28407064ybc.380.1654586989616; Tue, 07
 Jun 2022 00:29:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220606084109.4108188-1-arnd@kernel.org> <20220606084109.4108188-7-arnd@kernel.org>
In-Reply-To: <20220606084109.4108188-7-arnd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 Jun 2022 09:29:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXi2LkrWSs9=D9tSfhz+YDHB+638F6JdmgQ7V8Gj1ehqQ@mail.gmail.com>
Message-ID: <CAMuHMdXi2LkrWSs9=D9tSfhz+YDHB+638F6JdmgQ7V8Gj1ehqQ@mail.gmail.com>
Subject: Re: [PATCH 6/6] arch/*/: remove CONFIG_VIRT_TO_BUS
To: Arnd Bergmann <arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Linux-Arch <linux-arch@vger.kernel.org>, scsi <linux-scsi@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Martyn Welch <martyn@welchs.me.uk>, Manohar Vanga <manohar.vanga@gmail.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Denis Efremov <efremov@linux.com>, Christoph Hellwig <hch@infradead.org>, Linux IOMMU <iommu@lists.linux-foundation.org>, Parisc List <linux-parisc@vger.kernel.org>, alpha <linux-alpha@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>, Khalid Aziz <khalid@gonehiking.org>, Robin Murphy <robin.murphy@arm.com>, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 6, 2022 at 11:10 AM Arnd Bergmann <arnd@kernel.org> wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> All architecture-independent users of virt_to_bus() and bus_to_virt()
> have been fixed to use the dma mapping interfaces or have been
> removed now.  This means the definitions on most architectures, and the
> CONFIG_VIRT_TO_BUS symbol are now obsolete and can be removed.
>
> The only exceptions to this are a few network and scsi drivers for m68k
> Amiga and VME machines and ppc32 Macintosh. These drivers work correctly
> with the old interfaces and are probably not worth changing.
>
> On alpha and parisc, virt_to_bus() were still used in asm/floppy.h.
> alpha can use isa_virt_to_bus() like x86 does, and parisc can just
> open-code the virt_to_phys() here, as this is architecture specific
> code.
>
> I tried updating the bus-virt-phys-mapping.rst documentation, which
> started as an email from Linus to explain some details of the Linux-2.0
> driver interfaces. The bits about virt_to_bus() were declared obsolete
> backin 2000, and the rest is not all that relevant any more, so in the
> end I just decided to remove the file completely.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

>  arch/m68k/Kconfig                             |   1 -
>  arch/m68k/include/asm/virtconvert.h           |   4 +-

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
