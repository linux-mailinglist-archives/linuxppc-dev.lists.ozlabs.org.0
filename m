Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2B968FBE2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Feb 2023 01:16:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PBy852N14z3f2w
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Feb 2023 11:16:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=skfc9Pzu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=skfc9Pzu;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PBy762CWVz2xvL
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Feb 2023 11:15:14 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9A55E617F5;
	Thu,  9 Feb 2023 00:15:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A18F8C433D2;
	Thu,  9 Feb 2023 00:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675901711;
	bh=5kdT87uulolNP7rN/Pb4kO4VZl5GD6q4rVjg05+K0Ys=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=skfc9PzuH4b2LtU9sjh53xT7JrbcRcYm9w2UxraPYzYwhb3ogCMAt2MfWPdUwOtaL
	 OF4cDP8yWiD3ZTOI1nUJOyywm+19ExbgyyC1TnvXaFQrDipCqziIUW+fyg3L6nGAHZ
	 i9l6TnjLJ+0cqo0R7xj5PtArn6jtZkI6pWv9Y0insfOfGiS+rxDYyXJoW+X/kF4nuT
	 j7kQsIR8PDqaS/XRJGeoA0Ujoa2aaMHw1ZR2xLIuhZdalCyE1rCL9MTnk7oChWkvpS
	 YNqoo8bvo3erL1Nv7JGx+PK6dw7IpIO7JaVumHWxaxeQvrzwQpXpKbK2mLgKJaEXw+
	 rxED9JnChBSSA==
Received: by pali.im (Postfix)
	id 0749D798; Thu,  9 Feb 2023 01:15:07 +0100 (CET)
Date: Thu, 9 Feb 2023 01:15:07 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2 0/8] powerpc/85xx: p2020: Create one unified machine
 description
Message-ID: <20230209001507.nc2njllc32pjp2az@pali>
References: <20221224211425.14983-1-pali@kernel.org>
 <20230122111631.dgw5uwtfjsqack57@pali>
 <22db0b5a-1b7f-a94b-1092-a314d57dedf5@csgroup.eu>
 <20230123200922.scnwgne3dsip24lg@pali>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230123200922.scnwgne3dsip24lg@pali>
User-Agent: NeoMutt/20180716
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
Cc: Sinan Akman <sinan@writeme.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Scott Wood <oss@buserror.net>, Martin Kennedy <hurricos@gmail.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Monday 23 January 2023 21:09:22 Pali Rohár wrote:
> On Monday 23 January 2023 14:32:36 Christophe Leroy wrote:
> > Le 22/01/2023 à 12:16, Pali Rohár a écrit :
> > > Hello! Do you have any comments for this patch series?
> > 
> > 
> > I think patches 1 and 2 could be a single patch.
> 
> Well, if you want to have them in single patch, it could be easily
> squashed during applying. I thought that it is better to have them
> separated because of different boards, files, etc...:
> https://lore.kernel.org/linuxppc-dev/5bf1f2fc-a1de-d873-7d1b-0058ff8b9aa2@csgroup.eu/
> 
> > I'm having hard time understanding how things are built. Patch 3 
> > introduces 273 lines of new code in a file named p2020.c while only 
> > removing 23 lines and 44 lines from mpc85xx_{ds/rdb}.c.
> 
> In v1 I generated that patch with git -M, -C and other options which
> detects copy and renames. But I had an impression that it is less readable:
> https://lore.kernel.org/linuxppc-dev/20220819191557.28116-4-pali@kernel.org/
> 
> So I tried to describe all changes in commit message and generated that
> patch without copy options (so it is plain patch with add lines).
> 
> This patch moves all p2020 boards from mpc85xx_rdb.c and mpc85xx_ds.c
> files into new p2020.c file, and plus it copies all helper functions
> which p2020 boards requires. This patch does not introduce any new code
> or functional change. It should be really plain copy/move.

I sent same patch but generated by git -M and -C options. See if it is
better.

> > Then patches 4, 
> > 5 and 6 exclusively modify p2020.c which was a completely new file added 
> > by patch 3.
> 
> In later patches is then that moved/copied code improved and cleaned.
> 
> > Why not making it correct from the beginning, that is merge 
> > patches 4, 5 and 6 in patch 3 ?
> 
> I wanted to separate logical changes into separate commits. So first
> just moves/copy code (which should be noop) and then do functional
> changes in followup patches. I like this progress because for me it is
> easier for reviewing. Important parts are functional changes, which are
> in separated commits and it is visually separated from boring move/copy
> code changes.
> 
> > Or maybe p2020.c is not really new but is a copy of some previously 
> > existing code ? In that case it would be better to make it explicit, for 
> > history.
> 
> Yes. Do you have any suggestion how to make it _more_ explicit? I tried
> to explain it in commit message (but I'm not sure if it is enough). And
> when viewing via git show, it is needed to call it with additional -M
> and -C options to see this. git does not do it automatically.

Do you have any other suggestions what should I do?

> > 
> > Christophe
> > 
> > 
> > > 
> > > On Saturday 24 December 2022 22:14:17 Pali Rohár wrote:
> > >> This patch series unifies all P2020 boards and machine descriptions into
> > >> one generic unified P2020 machine description. With this generic machine
> > >> description, kernel can boot on any P2020-based board with correct DTS
> > >> file.
> > >>
> > >> Tested on CZ.NIC Turris 1.1 board with has Freescale P2020 processor.
> > >> Kernel during booting correctly detects P2020 and prints:
> > >> [    0.000000] Using Freescale P2020 machine description
> > >>
> > >> Changes in v2:
> > >> * Added patch "p2020: Move i8259 code into own function" (separated from the next one)
> > >> * Renamed CONFIG_P2020 to CONFIG_PPC_P2020
> > >> * Fixed descriptions
> > >>
> > >> Link to v1: https://lore.kernel.org/linuxppc-dev/20220819191557.28116-1-pali@kernel.org/
> > >>
> > >> Pali Rohár (8):
> > >>    powerpc/85xx: Mark mpc85xx_rdb_pic_init() as static
> > >>    powerpc/85xx: Mark mpc85xx_ds_pic_init() as static
> > >>    powerpc/85xx: p2020: Move all P2020 machine descriptions to p2020.c
> > >>    powerpc/85xx: p2020: Move i8259 code into own function
> > >>    powerpc/85xx: p2020: Unify .setup_arch and .init_IRQ callbacks
> > >>    powerpc/85xx: p2020: Define just one machine description
> > >>    powerpc/85xx: p2020: Enable boards by new config option
> > >>      CONFIG_PPC_P2020
> > >>    powerpc: dts: turris1x.dts: Remove "fsl,P2020RDB-PC" compatible string
> > >>
> > >>   arch/powerpc/boot/dts/turris1x.dts        |   2 +-
> > >>   arch/powerpc/platforms/85xx/Kconfig       |  22 ++-
> > >>   arch/powerpc/platforms/85xx/Makefile      |   1 +
> > >>   arch/powerpc/platforms/85xx/mpc85xx_ds.c  |  25 +--
> > >>   arch/powerpc/platforms/85xx/mpc85xx_rdb.c |  46 +-----
> > >>   arch/powerpc/platforms/85xx/p2020.c       | 193 ++++++++++++++++++++++
> > >>   6 files changed, 215 insertions(+), 74 deletions(-)
> > >>   create mode 100644 arch/powerpc/platforms/85xx/p2020.c
> > >>
> > >> -- 
> > >> 2.20.1
> > >>
