Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74653541F29
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jun 2022 00:43:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LHlkY26g6z303k
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jun 2022 08:43:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=welchs.me.uk (client-ip=2a00:1098:0:86:1000:0:2:1; helo=mx1.mythic-beasts.com; envelope-from=martyn@welchs.me.uk; receiver=<UNKNOWN>)
X-Greylist: delayed 2261 seconds by postgrey-1.36 at boromir; Tue, 07 Jun 2022 19:47:50 AEST
Received: from mx1.mythic-beasts.com (mx1.mythic-beasts.com [IPv6:2a00:1098:0:86:1000:0:2:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LHQWp1YL8z303k
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jun 2022 19:47:49 +1000 (AEST)
Received: from [209.85.167.52] (port=42524 helo=mail-lf1-f52.google.com)
	by mailhub-cam-d.mythic-beasts.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <martyn@welchs.me.uk>)
	id 1nyVE4-003zlm-DG
	for linuxppc-dev@lists.ozlabs.org; Tue, 07 Jun 2022 10:10:12 +0100
Received: by mail-lf1-f52.google.com with SMTP id a15so27278351lfb.9
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Jun 2022 02:10:00 -0700 (PDT)
X-Gm-Message-State: AOAM533aqQgXA48yCGwu1yR/p18e2NxM3f8NmSIxWxFtgUCNBlb3aK5D
	LzjhUJQEFmtWSK/RqkMHRBqMJydtJLupcYB5f/M=
X-Google-Smtp-Source: ABdhPJyULPIdIsKuXm4CBLs/lpx9OuZtHR1zOwsK0gfemBq6DPfmp1b12GD3NCSmZN55f3UVzaaZOjEGtnFIMz9tvoo=
X-Received: by 2002:a05:6512:13a1:b0:448:887e:da38 with SMTP id
 p33-20020a05651213a100b00448887eda38mr18154426lfa.298.1654593000256; Tue, 07
 Jun 2022 02:10:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220606084109.4108188-1-arnd@kernel.org> <Yp3ID86TBFxl7qyL@kroah.com>
In-Reply-To: <Yp3ID86TBFxl7qyL@kroah.com>
From: Martyn Welch <martyn@welchs.me.uk>
Date: Tue, 7 Jun 2022 10:09:49 +0100
X-Gmail-Original-Message-ID: <CAEccXecB=rkZ1Kejmzcfay6qMMVo7Kb7SovSq+Xs1zWMnJOxnQ@mail.gmail.com>
Message-ID: <CAEccXecB=rkZ1Kejmzcfay6qMMVo7Kb7SovSq+Xs1zWMnJOxnQ@mail.gmail.com>
Subject: Re: [PATCH 0/6] phase out CONFIG_VIRT_TO_BUS
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
X-BlackCat-Spam-Score: 14
X-Spam-Status: No, score=1.4
X-Mailman-Approved-At: Wed, 08 Jun 2022 08:42:57 +1000
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
Cc: linux-arch@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>, linux-scsi@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linuxppc-dev@lists.ozlabs.org, Manohar Vanga <manohar.vanga@gmail.com>, linux-m68k@lists.linux-m68k.org, Denis Efremov <efremov@linux.com>, Christoph Hellwig <hch@infradead.org>, iommu@lists.linux-foundation.org, linux-parisc@vger.kernel.org, linux-alpha@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, Khalid Aziz <khalid@gonehiking.org>, Robin Murphy <robin.murphy@arm.com>, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 6 Jun 2022 at 10:25, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, Jun 06, 2022 at 10:41:03AM +0200, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > The virt_to_bus/bus_to_virt interface has been deprecated for
> > decades. After Jakub Kicinski put a lot of work into cleaning out the
> > network drivers using them, there are only a couple of other drivers
> > left, which can all be removed or otherwise cleaned up, to remove the
> > old interface for good.
> >
> > Any out of tree drivers using virt_to_bus() should be converted to
> > using the dma-mapping interfaces, typically dma_alloc_coherent()
> > or dma_map_single()).
> >
> > There are a few m68k and ppc32 specific drivers that keep using the
> > interfaces, but these are all guarded with architecture-specific
> > Kconfig dependencies, and are not actually broken.
> >
> > There are still a number of drivers that are using virt_to_phys()
> > and phys_to_virt() in place of dma-mapping operations, and these
> > are often broken, but they are out of scope for this series.
>
> I'll take patches 1 and 2 right now through my staging tree if that's
> ok.
>

Hi,

I'd love to say that I could fix this stuff up, however I've lacked access to
suitable hardware for a long time now and don't foresee that changing any
time soon...

Martyn

> thanks,
>
> greg k-h
>
