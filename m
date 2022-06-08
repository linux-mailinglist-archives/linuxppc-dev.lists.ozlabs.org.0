Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1074254293F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jun 2022 10:20:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LJ0Xn5TWsz3bll
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jun 2022 18:20:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=W/h6Wxvl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=W/h6Wxvl;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJ0X76tQgz2yMj
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jun 2022 18:20:07 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 62CC161673
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jun 2022 08:20:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9765C341C5
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jun 2022 08:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654676402;
	bh=rDMX5BalcedoM4G0RTFNbUxPOQoghsgu/8OBAke+GR0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=W/h6WxvlBEsPXQ7LLxZr5QO/u8vafOvVrOKwRNodyKrcwdtYx8uewJ8cCA65YcEMg
	 alacQ3aEaCFnYucv14vBpxrln7eE0w+IUl9Ml0Q/7LYCRVNvGSHDuVNBRGtIoi0BHD
	 Qr5ufM1dsDnPItR2irIQVGVoxerv51UkVHYmpLW+0WsyY7wVvJ+J6YNWoxtfegtWYz
	 FamoyOjC7VQXl4xIUHow5CF1p1P7Wxh0bzVc5DDARXrzB/D9DtH7DJLq2uy7QMFIxO
	 8gV+qq78/NW5yn20jf56zStPrE0wosJLKD6MRBsnwDN5kNQhLX1HrDNepJvQufi2cH
	 3p2+fMos1M1jw==
Received: by mail-yb1-f180.google.com with SMTP id r1so6655581ybd.4
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 Jun 2022 01:20:02 -0700 (PDT)
X-Gm-Message-State: AOAM531eNKRYZ+GG+EjnQPxuA+d9jOr8rzi4bkmfoj2d05JIw+eGSVtR
	0vr9Lup+dPGivWN23Nr50eVHHYkeakH5YjXNSMc=
X-Google-Smtp-Source: ABdhPJw5adnNWBE7ztmmPDIsnyIjJmMrgIr8fa8e/0DIxEnxDLg4p0rx65KL8vLCz2hbQ8e4xmPnl5Ru880ilknwmmg=
X-Received: by 2002:a25:d6d7:0:b0:663:efa3:3fd2 with SMTP id
 n206-20020a25d6d7000000b00663efa33fd2mr4459955ybg.480.1654676401784; Wed, 08
 Jun 2022 01:20:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220606084109.4108188-1-arnd@kernel.org> <20220606084109.4108188-6-arnd@kernel.org>
 <d39fc9bb-07c1-ad74-1e89-d2aa80578cd4@gonehiking.org>
In-Reply-To: <d39fc9bb-07c1-ad74-1e89-d2aa80578cd4@gonehiking.org>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 8 Jun 2022 10:19:44 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3dfTNS4m-SVa1UH+ncT7ZOcMBRaEc7TiO9R19J3KNSxg@mail.gmail.com>
Message-ID: <CAK8P3a3dfTNS4m-SVa1UH+ncT7ZOcMBRaEc7TiO9R19J3KNSxg@mail.gmail.com>
Subject: Re: [PATCH 5/6] scsi: remove stale BusLogic driver
To: Khalid Aziz <khalid@gonehiking.org>
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
Cc: linux-arch <linux-arch@vger.kernel.org>, linux-scsi <linux-scsi@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Martyn Welch <martyn@welchs.me.uk>, Manohar Vanga <manohar.vanga@gmail.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Denis Efremov <efremov@linux.com>, Christoph Hellwig <hch@infradead.org>, "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>, Matt Wang <wwentao@vmware.com>, Parisc List <linux-parisc@vger.kernel.org>, alpha <linux-alpha@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>, "Maciej W . Rozycki" <macro@orcam.me.uk>, Robin Murphy <robin.murphy@arm.com>, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 6, 2022 at 6:35 PM Khalid Aziz <khalid@gonehiking.org> wrote:
> On 6/6/22 02:41, Arnd Bergmann wrote: From: Arnd Bergmann<arnd@arndb.de>
>
> I would say no to removing BusLogic driver. Virtualbox is another
> consumer of this driver. This driver is very old but I would rather fix
> the issues than remove it until we do not have any users.

Maciej already offered to help fix the driver, so I think it will be ok.

On the other hand, it sounds like VirtualBox users should not actually try to
use the BusLogic driver with modern Linux guests. From what I can tell
from the documentation [1], VirtualBox only provides this emulation because it
was shipped with early versions of VMware and is supported by Windows 2000
and earlier, but not actually on any modern Windows guest. The VMware
documentation in turn explicitly says that BusLogic does not work with 64-bit
guests [2], presumably this applies to both Windows and Linux guests.

        Arnd

[1] https://www.virtualbox.org/manual/ch05.html#harddiskcontrollers
[2] https://kb.vmware.com/s/article/2010470
