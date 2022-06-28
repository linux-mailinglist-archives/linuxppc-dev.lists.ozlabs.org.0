Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 87AE455BEFB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 09:12:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXG533CY1z3chW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 17:12:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.219.48; helo=mail-qv1-f48.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXG4d66sYz3bbs
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jun 2022 17:12:17 +1000 (AEST)
Received: by mail-qv1-f48.google.com with SMTP id t16so18828603qvh.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jun 2022 00:12:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oUnjhZMiGNi6v7nsbqYIrss5xtOvLOvLOLR2zcKJEss=;
        b=bNalAgh/X38EvSBPYKFYThOyr/HEUJYIxP8kJTSB8pQ2hyiJ2+dTEmrUIJv5H84Jbb
         IVrYMKunBF8Vb5NAroMawrEVxFOD+S+/ovWfOGgHHp4umr7tgQ8eW8KsowaZAzOZ4TWs
         ZDR2gS6VCT74jOYobfuAgdTkAxT7ZIJVs1wR11qA3uilzEga40iEX7UOhyDWz+XoxMNm
         xxOjw8qPKTc+ELFYwPwqHXoax/fQrulU44ZX2sqqhQW0e8uJGMVpc8qpVGXts9ztblY9
         eHTE4sgUFq9rANgm2bo/vy1aTFGx4ofO+PxM+6/IwVttMTI707sfvzF0x0ERpKpCmcXs
         kOQw==
X-Gm-Message-State: AJIora8Q3jxvR5R0N/2N8NYNkU5nEXG0pyODQsAuQAzjdLhzSZyzMTn1
	E7YiNGoaO/ryfRZyWQbwagS8MoALMS2tnA==
X-Google-Smtp-Source: AGRyM1vpNLsCESw/tMFK1E+5RtW3EwIfRhpHYlD6K7eWgOAvCnht2gS+FkQSp7JHvlGnbeT6WQJbxg==
X-Received: by 2002:a05:622a:647:b0:306:6b30:bd0a with SMTP id a7-20020a05622a064700b003066b30bd0amr11979494qtb.327.1656400332873;
        Tue, 28 Jun 2022 00:12:12 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id bj35-20020a05620a192300b006af50b6f10csm1347178qkb.61.2022.06.28.00.12.12
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jun 2022 00:12:12 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id d5so20706904yba.5
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jun 2022 00:12:12 -0700 (PDT)
X-Received: by 2002:a05:6902:905:b0:64a:2089:f487 with SMTP id
 bu5-20020a056902090500b0064a2089f487mr18678075ybb.202.1656399845934; Tue, 28
 Jun 2022 00:04:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220617125750.728590-1-arnd@kernel.org> <20220617125750.728590-4-arnd@kernel.org>
 <6ba86afe-bf9f-1aca-7af1-d0d348d75ffc@gmail.com> <CAMuHMdVewn0OYA9oJfStk0-+vCKAUou+4Mvd5H2kmrSks1p5jg@mail.gmail.com>
 <b4e5a1c9-e375-63fb-ec7c-abb7384a6d59@gmail.com> <9289fd82-285c-035f-5355-4d70ce4f87b0@gmail.com>
In-Reply-To: <9289fd82-285c-035f-5355-4d70ce4f87b0@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Jun 2022 09:03:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXUihTPD9A9hs__Xr2ErfOqkZ5KgCHqm+9HvRf39uS5kA@mail.gmail.com>
Message-ID: <CAMuHMdXUihTPD9A9hs__Xr2ErfOqkZ5KgCHqm+9HvRf39uS5kA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arch/*/: remove CONFIG_VIRT_TO_BUS
To: Michael Schmitz <schmitzmic@gmail.com>
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
Cc: Linux-Arch <linux-arch@vger.kernel.org>, Arnd Bergmann <arnd@kernel.org>, scsi <linux-scsi@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Miquel van Smoorenburg <mikevs@xs4all.net>, linux-m68k <linux-m68k@lists.linux-m68k.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "Maciej W . Rozycki" <macro@orcam.me.uk>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Denis Efremov <efremov@linux.com>, Mark Salyzyn <salyzyn@android.com>, Christoph Hellwig <hch@infradead.org>, Linux IOMMU <iommu@lists.linux-foundation.org>, Matt Wang <wwentao@vmware.com>, Parisc List <linux-parisc@vger.kernel.org>, alpha <linux-alpha@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>, Khalid Aziz <khalid@gonehiking.org>, Robin Murphy <robin.murphy@arm.com>, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael,

On Tue, Jun 28, 2022 at 5:26 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
> Am 28.06.2022 um 09:12 schrieb Michael Schmitz:
> > On 27/06/22 20:26, Geert Uytterhoeven wrote:
> >> On Sat, Jun 18, 2022 at 3:06 AM Michael Schmitz <schmitzmic@gmail.com>
> >> wrote:
> >>> Am 18.06.2022 um 00:57 schrieb Arnd Bergmann:
> >>>> From: Arnd Bergmann <arnd@arndb.de>
> >>>>
> >>>> All architecture-independent users of virt_to_bus() and bus_to_virt()
> >>>> have been fixed to use the dma mapping interfaces or have been
> >>>> removed now.  This means the definitions on most architectures, and the
> >>>> CONFIG_VIRT_TO_BUS symbol are now obsolete and can be removed.
> >>>>
> >>>> The only exceptions to this are a few network and scsi drivers for m68k
> >>>> Amiga and VME machines and ppc32 Macintosh. These drivers work
> >>>> correctly
> >>>> with the old interfaces and are probably not worth changing.
> >>> The Amiga SCSI drivers are all old WD33C93 ones, and replacing
> >>> virt_to_bus by virt_to_phys in the dma_setup() function there would
> >>> cause no functional change at all.
> >> FTR, the sgiwd93 driver use dma_map_single().
> >
> > Thanks! From what I see, it doesn't have to deal with bounce buffers
> > though?
>
> Leaving the bounce buffer handling in place, and taking a few other
> liberties - this is what converting the easiest case (a3000 SCSI) might
> look like. Any obvious mistakes? The mvme147 driver would be very
> similar to handle (after conversion to a platform device).

Thanks, looks reasonable.

> The driver allocates bounce buffers using kmalloc if it hits an
> unaligned data buffer - can such buffers still even happen these days?

No idea.

> If I understand dma_map_single() correctly, the resulting dma handle
> would be equally misaligned?
>
> To allocate a bounce buffer, would it be OK to use dma_alloc_coherent()
> even though AFAIU memory used for DMA buffers generally isn't consistent
> on m68k?
>
> Thinking ahead to the other two Amiga drivers - I wonder whether
> allocating a static bounce buffer or a DMA pool at driver init is likely
> to succeed if the kernel runs from the low 16 MB RAM chunk? It certainly
> won't succeed if the kernel runs from a higher memory address, so the
> present bounce buffer logic around amiga_chip_alloc() might still need
> to be used here.
>
> Leaves the question whether converting the gvp11 and a2091 drivers is
> actually worth it, if bounce buffers still have to be handled explicitly.

A2091 should be straight-forward, as A3000 is basically A2091 on the
motherboard (comparing the two drivers, looks like someone's been
sprinkling mb()s over the A3000 driver).

I don't have any of these SCSI host adapters (not counting the A590
(~A2091) expansion of the old A500, which is not Linux-capable, and
 hasn't been powered on for 20 years).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
