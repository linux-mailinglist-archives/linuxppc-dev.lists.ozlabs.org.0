Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DA269EF9B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 08:53:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PM7gQ0S9Xz3cF7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 18:53:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZL/mY3v0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZL/mY3v0;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PM7fS0bcxz3bgr
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Feb 2023 18:52:15 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8DE10610D5;
	Wed, 22 Feb 2023 07:52:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B07B6C433EF;
	Wed, 22 Feb 2023 07:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677052332;
	bh=Q6MpegLZ7hvRsEJn9E5XiR3pk6kDq97l8mmk1IxS4jw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZL/mY3v0VrgfRh/fc8Gd4q6ik5wCwKGEMMRTE6NsX/lanXF93MtDLcOfe3VgyMKyt
	 sFcMQQz1Aw90mRQq6hOFmeVgg/kAXGhILS39FOMmy2PoxyyAmBO8prKpKQOH2X6+Hj
	 PDd4tCZx619r45mlac19eRpd9AsCU8sg+l8yqRFfLY3UO+C6ZBxrc17atssSDH/r2C
	 ZbY2NtN1TZmSUvLjrgbp8ncirFL046t403RuhxvaN8WWk5w9RyX5fNcQv3q0bkEthP
	 RZpAkuuRIaSc7aIppUhsiM5ZjZ8Gj3FzKdN1KFdnFrB5aeKguzS6kioCK1r5eNDq/U
	 J7S8+9DWq7IvA==
Received: by pali.im (Postfix)
	id 6C79172C; Wed, 22 Feb 2023 08:52:08 +0100 (CET)
Date: Wed, 22 Feb 2023 08:52:08 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v3 0/8] powerpc/85xx: p2020: Create one unified machine
 description
Message-ID: <20230222075208.y2nxqttaxfwsd4ye@pali>
References: <20230218111405.27688-1-pali@kernel.org>
 <20230221220714.pm64kwsnf3erdjcm@pali>
 <a692823b-eada-3072-c9e9-83877480454f@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a692823b-eada-3072-c9e9-83877480454f@csgroup.eu>
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

On Wednesday 22 February 2023 06:39:07 Christophe Leroy wrote:
> Hi,
> 
> Le 21/02/2023 à 23:07, Pali Rohár a écrit :
> > Hello Christophe! Could you look at this v3 series?
> > I addressed those small issues and hopefully it should be ready.
> > It would be great to have this finally in v6.3 release.
> 
> I started looking at your series and I will try to provide a feedback 
> within a few days.
> 
> By the way I see that Paul Gortmaker has started removal of several 85xx 
> boards. Should we first take Paul's removal series then see what remains 
> before applying yours ? That would make your series even more efficient.

I have already replied to Paul patch series. The important thing is that
we are touching different files, so patch series should be independent.

> Christoph
> 
> > 
> > On Saturday 18 February 2023 12:13:57 Pali Rohár wrote:
> >> This patch series unifies all P2020 boards and machine descriptions into
> >> one generic unified P2020 machine description. With this generic machine
> >> description, kernel can boot on any P2020-based board with correct DTS
> >> file.
> >>
> >> Tested on CZ.NIC Turris 1.1 board with has Freescale P2020 processor.
> >> Kernel during booting correctly detects P2020 and prints:
> >> [    0.000000] Using Freescale P2020 machine description
> >>
> >> Changes in v3:
> >> * Use 'if (IS_ENABLED(CONFIG_PPC_I8259))' instead of '#ifdef CONFIG_PPC_I8259'
> >> * Simplify p2020_probe()
> >> * Patches generated by -M and -C git options
> >>
> >> Link to v2: https://lore.kernel.org/linuxppc-dev/20221224211425.14983-1-pali@kernel.org/
> >>
> >> Changes in v2:
> >> * Added patch "p2020: Move i8259 code into own function" (separated from the next one)
> >> * Renamed CONFIG_P2020 to CONFIG_PPC_P2020
> >> * Fixed descriptions
> >>
> >> Link to v1: https://lore.kernel.org/linuxppc-dev/20220819191557.28116-1-pali@kernel.org/
> >>
> >> Pali Rohár (8):
> >>    powerpc/85xx: Mark mpc85xx_rdb_pic_init() as static
> >>    powerpc/85xx: Mark mpc85xx_ds_pic_init() as static
> >>    powerpc/85xx: p2020: Move all P2020 machine descriptions to p2020.c
> >>    powerpc/85xx: p2020: Move i8259 code into own function
> >>    powerpc/85xx: p2020: Unify .setup_arch and .init_IRQ callbacks
> >>    powerpc/85xx: p2020: Define just one machine description
> >>    powerpc/85xx: p2020: Enable boards by new config option
> >>      CONFIG_PPC_P2020
> >>    powerpc: dts: turris1x.dts: Remove "fsl,P2020RDB-PC" compatible string
> >>
> >>   arch/powerpc/boot/dts/turris1x.dts            |   2 +-
> >>   arch/powerpc/platforms/85xx/Kconfig           |  22 ++-
> >>   arch/powerpc/platforms/85xx/Makefile          |   1 +
> >>   arch/powerpc/platforms/85xx/mpc85xx_ds.c      |  25 +---
> >>   arch/powerpc/platforms/85xx/mpc85xx_rdb.c     |  46 +-----
> >>   .../platforms/85xx/{mpc85xx_ds.c => p2020.c}  | 135 ++++++------------
> >>   6 files changed, 68 insertions(+), 163 deletions(-)
> >>   copy arch/powerpc/platforms/85xx/{mpc85xx_ds.c => p2020.c} (52%)
> >>
> >> -- 
> >> 2.20.1
> >>
