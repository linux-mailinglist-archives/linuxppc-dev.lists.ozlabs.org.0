Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EE77B55BEF8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 09:09:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXG1563vWz3bs5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 17:09:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qC+UQmph;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qC+UQmph;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXG0Q4ftbz3bZc
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jun 2022 17:08:38 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1E5E0619E4
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jun 2022 07:08:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F656C341DA
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jun 2022 07:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656400112;
	bh=Dm+i1ahm5JO1Y0z9h4uqTDK4kJt3Abm9W7KKXWn4iRE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qC+UQmphl8Hd+1T1U0QD9tDpqj4RMtyFkgyHY4s5qIB7gRI+xS50dQLQF60N4d53a
	 pt8nrB+n/0dsGBpX9rzm604Cauhg2V1pGMdOs9Z8ftj1edDPVWFevjoguG98IqrTXI
	 ivqLmEwSVJigzb4BvjUY8SyP2jqcLYvPGrfQt0+Lb4o5OGtjK05l74oqdAtZe6v+RV
	 EiZUgKYNvTN+ggir5o2MPXO4/eJKq2WsfCAQvCsHp1NxR2fH/lMZBuGL6JAF9vspsB
	 biRI4WdoUfZ8vhFQRuwocB5PEe84qldt+0c/fmHu+92iK9/LCneqYIva5kjHPnQFrz
	 CH1QITDOJFbvA==
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-3137316bb69so106896737b3.10
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jun 2022 00:08:32 -0700 (PDT)
X-Gm-Message-State: AJIora/xaZb4Hba54J0fER9va3bOBu9S9Y3h19+77pGTcbvMM/4fqqiV
	0vKgiovVdw/BHq47dcs0+hjLTYXTKaLZisewk1s=
X-Google-Smtp-Source: AGRyM1vKbt5VKtzdC4XgmSFOrmSiRmjlG5/FEc3iJTDP+CtgJE9woQ9uDs2lLsQ8604dHCHHG6u5L7MmI7NPb3gwZE4=
X-Received: by 2002:a81:1d43:0:b0:318:638d:2ca with SMTP id
 d64-20020a811d43000000b00318638d02camr20536106ywd.135.1656400111255; Tue, 28
 Jun 2022 00:08:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220617125750.728590-1-arnd@kernel.org> <20220617125750.728590-4-arnd@kernel.org>
 <6ba86afe-bf9f-1aca-7af1-d0d348d75ffc@gmail.com> <CAMuHMdVewn0OYA9oJfStk0-+vCKAUou+4Mvd5H2kmrSks1p5jg@mail.gmail.com>
 <b4e5a1c9-e375-63fb-ec7c-abb7384a6d59@gmail.com> <9289fd82-285c-035f-5355-4d70ce4f87b0@gmail.com>
In-Reply-To: <9289fd82-285c-035f-5355-4d70ce4f87b0@gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 28 Jun 2022 09:08:14 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1ivqYB38c_QTjG8e85ZBnCB6HEa-6LR1HDc8shG1Pwmw@mail.gmail.com>
Message-ID: <CAK8P3a1ivqYB38c_QTjG8e85ZBnCB6HEa-6LR1HDc8shG1Pwmw@mail.gmail.com>
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
Cc: Linux-Arch <linux-arch@vger.kernel.org>, Miquel van Smoorenburg <mikevs@xs4all.net>, scsi <linux-scsi@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-m68k <linux-m68k@lists.linux-m68k.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "Maciej W . Rozycki" <macro@orcam.me.uk>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Denis Efremov <efremov@linux.com>, Mark Salyzyn <salyzyn@android.com>, Christoph Hellwig <hch@infradead.org>, Linux IOMMU <iommu@lists.linux-foundation.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Parisc List <linux-parisc@vger.kernel.org>, alpha <linux-alpha@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>, Khalid Aziz <khalid@gonehiking.org>, Robin Murphy <robin.murphy@arm.com>, Matt Wang <wwentao@vmware.com>, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 28, 2022 at 5:25 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
> Am 28.06.2022 um 09:12 schrieb Michael Schmitz:
>
> Leaving the bounce buffer handling in place, and taking a few other
> liberties - this is what converting the easiest case (a3000 SCSI) might
> look like. Any obvious mistakes? The mvme147 driver would be very
> similar to handle (after conversion to a platform device).
>
> The driver allocates bounce buffers using kmalloc if it hits an
> unaligned data buffer - can such buffers still even happen these days?
> If I understand dma_map_single() correctly, the resulting dma handle
> would be equally misaligned?
>
> To allocate a bounce buffer, would it be OK to use dma_alloc_coherent()
> even though AFAIU memory used for DMA buffers generally isn't consistent
> on m68k?

I think it makes sense to skip the bounce buffering as you do here:
the only standardized way we have for integrating that part is to
use the swiotlb infrastructure, but as you mentioned earlier that
part is probably too resource-heavy here for Amiga.

I see two other problems with your patch though:

a) you still duplicate the cache handling: the cache_clear()/cache_push()
is supposed to already be done by dma_map_single() when the device
is not cache-coherent.

b) The bounce buffer is never mapped here, instead you have the
virt_to_phys() here, which is not the same. I think you need to map
the pointer that actually gets passed down to the device after deciding
to use a bouce buffer or not.

     Arnd
