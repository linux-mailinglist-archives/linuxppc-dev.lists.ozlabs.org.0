Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F68655F08C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 23:51:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXdb53tZVz3dpw
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 07:51:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=elEeeKUD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=elEeeKUD;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXdZW00tsz3by6
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jun 2022 07:50:58 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 618D2618EE
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jun 2022 21:50:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52835C341D8
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jun 2022 21:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656453055;
	bh=Eulr4Y0cWb7qjc6CpxCm3Vct1+OoFSfv0gPahuMP8H0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=elEeeKUDea9hk5aQmAteuIyRdHZZsKhLl3Vgkrf0ebuHMVDyxzs1owwkAc5icxtXR
	 Tv3y3Ypg5BZfSAA4fm/1du/h9YT9oUMVvzdwBxhJY45v0cynFE7MH/FGecsgnZV2dk
	 iPm6ogOEDIT42r9PUlRQz9dQNjh6tOzSwvfw+orYrQP8DJdAcBTb8Txl9TLsSqkRI5
	 7J7GSf1511sS2KBwajo4lNLtrnzx6YNYJIcRb3aJarxomVr3XyXRVQbc5LQe6sATzH
	 Szilv/6OGgYptkfbHHlymMEVoWlRUtOrH4DB1kh3spBftyplxnSoqxW2EfM72iufIW
	 dnOIf5/XmvBRg==
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-318889e6a2cso130848367b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jun 2022 14:50:55 -0700 (PDT)
X-Gm-Message-State: AJIora/0OZiFdtATaWK/FJo/5r3VEHMXOcvM9/Om9+/mIWlmFGnh2dIW
	3nEAlqgAHmvTEPFeTEpddxwWmGhmq+avribzEUE=
X-Google-Smtp-Source: AGRyM1uiK3Jm9EI3ugNHld4Mw8359HNpN0AV60gdNeVzfnYPf20oZVN1walPYmvUh7o4VEBL7hhWBeeKgOlyyZ+Nc1k=
X-Received: by 2002:a0d:df0f:0:b0:31b:e000:7942 with SMTP id
 i15-20020a0ddf0f000000b0031be0007942mr283034ywe.320.1656453054172; Tue, 28
 Jun 2022 14:50:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220617125750.728590-1-arnd@kernel.org> <20220617125750.728590-4-arnd@kernel.org>
 <6ba86afe-bf9f-1aca-7af1-d0d348d75ffc@gmail.com> <CAMuHMdVewn0OYA9oJfStk0-+vCKAUou+4Mvd5H2kmrSks1p5jg@mail.gmail.com>
 <b4e5a1c9-e375-63fb-ec7c-abb7384a6d59@gmail.com> <9289fd82-285c-035f-5355-4d70ce4f87b0@gmail.com>
 <CAMuHMdXUihTPD9A9hs__Xr2ErfOqkZ5KgCHqm+9HvRf39uS5kA@mail.gmail.com> <c30bc9b6-6ccd-8856-dc6b-4e16450dad6f@gmail.com>
In-Reply-To: <c30bc9b6-6ccd-8856-dc6b-4e16450dad6f@gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 28 Jun 2022 23:50:37 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1rxEVwVF5U-PO6pQkfURU5Tro1Qp8SPUfHEV9jjWOmCQ@mail.gmail.com>
Message-ID: <CAK8P3a1rxEVwVF5U-PO6pQkfURU5Tro1Qp8SPUfHEV9jjWOmCQ@mail.gmail.com>
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
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Linux-Arch <linux-arch@vger.kernel.org>, scsi <linux-scsi@vger.kernel.org>, Christoph Hellwig <hch@infradead.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Jakub Kicinski <kuba@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Denis Efremov <efremov@linux.com>, linux-m68k <linux-m68k@lists.linux-m68k.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Khalid Aziz <khalid@gonehiking.org>, Miquel van Smoorenburg <mikevs@xs4all.net>, Parisc List <linux-parisc@vger.kernel.org>, Robin Murphy <robin.murphy@arm.com>, Matt Wang <wwentao@vmware.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mark Salyzyn <salyzyn@android.com>, Linux IOMMU <iommu@lists.linux-foundation.org>, alpha <linux-alpha@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "Maciej W . Rozycki" <macro@orcam.me.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 28, 2022 at 11:03 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
> On 28/06/22 19:03, Geert Uytterhoeven wrote:
> >> The driver allocates bounce buffers using kmalloc if it hits an
> >> unaligned data buffer - can such buffers still even happen these days?
> > No idea.
> Hmmm - I think I'll stick a WARN_ONCE() in there so we know whether this
> code path is still being used.

kmalloc() guarantees alignment to the next power-of-two size or
KMALLOC_MIN_ALIGN, whichever is bigger. On m68k this means it
is cacheline aligned.

      Arnd
