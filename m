Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A8A53E548
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jun 2022 17:02:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LGxYX45hSz3brd
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jun 2022 01:02:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Apz8+ZKO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Apz8+ZKO;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LGxXv2ZNpz2xsm
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jun 2022 01:02:07 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 692C0B81A82
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jun 2022 15:02:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14C4AC36AFF
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jun 2022 15:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654527722;
	bh=q53e8R7rif+9VorkencnO96O5zseGyAcQ5tiTh4wb5o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Apz8+ZKOfRfLg28N7czbQCp5u1APChOU6nUGQX9FaMmYF1sAaX/E+Ib6PkoNMTzP7
	 8jDO0yt1/l7zDqKQc6tX4/clq/6HkX/3W3KZ8nM3wihQ+jMlDOK9ZA4eyqtiXknfW8
	 nDehGJBGcME9NWhLnKjuKwi1RHsvWVfiUTSGjzwMBXLmNypEOY8dRiUMaB2ZPKhMqN
	 +sCEMynb2DFl+FqYA+WAgVaik3iEnEQyHuNJCcowrCU57ufs9pWJIioY3E4DJJPNzW
	 kpZWUqqFJEO2bKuHGgUG6lR6HDAoCyo7pL/NzPacNwyF3UCEA3Cxsbw6IvBn5Rr2+E
	 lkYasSc/0weOA==
Received: by mail-yb1-f170.google.com with SMTP id v22so26177257ybd.5
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Jun 2022 08:02:02 -0700 (PDT)
X-Gm-Message-State: AOAM530rIzTYqd/JC9n4o80jf3073o6buYyxNDgMLAhu1UGoDEBAToD4
	/3Lc9MQgGSu6ZRWj3tJEJummm4SLK2QIZS+yeqk=
X-Google-Smtp-Source: ABdhPJzbUSlIedBRNZiWpM9ElJ4TvjZNZhTiqJfwPbhlO6M7rgoOI9pHprJDL1o+SM/GSywwOf+ElbD7ZGPkUhXAozo=
X-Received: by 2002:a25:db8a:0:b0:65c:b04a:f612 with SMTP id
 g132-20020a25db8a000000b0065cb04af612mr24920915ybf.106.1654527721136; Mon, 06
 Jun 2022 08:02:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220606084109.4108188-1-arnd@kernel.org> <Yp3ID86TBFxl7qyL@kroah.com>
In-Reply-To: <Yp3ID86TBFxl7qyL@kroah.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 6 Jun 2022 17:01:44 +0200
X-Gmail-Original-Message-ID: <CAK8P3a15RuR3VOPLPV3SfdBAGuoyor6o7JMs3kC5dNB5nfDuKA@mail.gmail.com>
Message-ID: <CAK8P3a15RuR3VOPLPV3SfdBAGuoyor6o7JMs3kC5dNB5nfDuKA@mail.gmail.com>
Subject: Re: [PATCH 0/6] phase out CONFIG_VIRT_TO_BUS
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
Cc: linux-arch <linux-arch@vger.kernel.org>, linux-scsi <linux-scsi@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Martyn Welch <martyn@welchs.me.uk>, Manohar Vanga <manohar.vanga@gmail.com>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Denis Efremov <efremov@linux.com>, Christoph Hellwig <hch@infradead.org>, "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>, Parisc List <linux-parisc@vger.kernel.org>, alpha <linux-alpha@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>, Khalid Aziz <khalid@gonehiking.org>, Robin Murphy <robin.murphy@arm.com>, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 6, 2022 at 11:25 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> I'll take patches 1 and 2 right now through my staging tree if that's
> ok.

Yes, that's perfect, as there are no actual interdependencies with the
other drivers -- applying the last patch first would just hide the driver
I'm removing here.

Thanks,

      Arnd
