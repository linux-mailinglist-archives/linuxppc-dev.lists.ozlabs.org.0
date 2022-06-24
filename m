Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF71559D8E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jun 2022 17:44:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LV1dF6Pd2z3cCF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jun 2022 01:44:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=i9DTlTGA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=i9DTlTGA;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LV1cf3C2Wz3by8
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Jun 2022 01:43:46 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id BC183B82939
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jun 2022 15:43:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EF0EC341D0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jun 2022 15:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656085420;
	bh=ZrmSkwlqS2brnFN5Iry4JvejPq5gajOP5sg4Z4I3Hws=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=i9DTlTGAF2BSmIOGQb/gQyl7aMHalsUj8NoMTbK5Fd4cCyIuwAgENb43b1h9IH48h
	 qp06qkk0zTx1HwRItvR0GItuPv+lz/7ChUX2E9qCxtTjXMu4b192guwea5c4SjI521
	 4+UtTh2cv+kB26alAMsm83DdMDj5HP1Dh3uN2MA4aDR81torLsE+iHB1xV9EKT5lIO
	 YEBYFhN226Zo4lYaEZEdr9mkWZhgmYyh//FjHYkPt20RneGhxwqQqJoNaBsRywsipP
	 0iHfl24ek2rhJLBp6JuP3w86bddR2dx3a1MCX9Er4aQzEcWmIImB57bGTJCYzWnVbz
	 3KOVO6Rr8xY7w==
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-3176d94c236so28820647b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jun 2022 08:43:40 -0700 (PDT)
X-Gm-Message-State: AJIora+Nk3qL9E6WToqsP1PVp4XqA1wcx+Xldk2rVK4v4quKys6t52Mc
	kFJhp/08T1nosJwiUzfOqr21BHM5tUjJdW1uYkg=
X-Google-Smtp-Source: AGRyM1tAwe56Z5fVE7/SpL81F9wGW1RUV71QXwxRBZMigOoQ0lhjNRQtgXoHzM5M7/mN527O+TQVqWtjCC96MjmmS9c=
X-Received: by 2002:a81:2f84:0:b0:314:2bfd:bf1f with SMTP id
 v126-20020a812f84000000b003142bfdbf1fmr17066465ywv.320.1656085419237; Fri, 24
 Jun 2022 08:43:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220617125750.728590-1-arnd@kernel.org> <20220617125750.728590-3-arnd@kernel.org>
 <7a6df2da-95e8-b2fd-7565-e4b7a51c5b63@gonehiking.org> <CAK8P3a0t_0scofn_2N1Q8wgJ4panKCN58AgnsJSVEj28K614oQ@mail.gmail.com>
 <c955bf95-838f-cc0a-8496-322b831e5648@gonehiking.org>
In-Reply-To: <c955bf95-838f-cc0a-8496-322b831e5648@gonehiking.org>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 24 Jun 2022 17:43:22 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0onDqNtteOjGu7R8vUvy_ycYSYnxJURCcoyxtZDcji=g@mail.gmail.com>
Message-ID: <CAK8P3a0onDqNtteOjGu7R8vUvy_ycYSYnxJURCcoyxtZDcji=g@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] scsi: BusLogic remove bus_to_virt
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Miquel van Smoorenburg <mikevs@xs4all.net>, linux-scsi <linux-scsi@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-m68k <linux-m68k@lists.linux-m68k.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Denis Efremov <efremov@linux.com>, Mark Salyzyn <salyzyn@android.com>, Christoph Hellwig <hch@infradead.org>, "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>, Matt Wang <wwentao@vmware.com>, Parisc List <linux-parisc@vger.kernel.org>, alpha <linux-alpha@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>, "Maciej W . Rozycki" <macro@orcam.me.uk>, Robin Murphy <robin.murphy@arm.com>, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 24, 2022 at 5:38 PM Khalid Aziz <khalid@gonehiking.org> wrote:
> On 6/23/22 08:47, Arnd Bergmann wrote:
>
> Driver works with this change. next_inbox is the correct pointer to pass.

Ok, great! I'll add a 'Tested-by' line then. I was already in the process of
preparing a v3 patch set, will send out the fixed patch in a bit.

         Arnd
