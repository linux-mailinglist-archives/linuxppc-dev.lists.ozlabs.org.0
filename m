Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED786AA8FD
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Mar 2023 10:38:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PTKX02d33z3cjP
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Mar 2023 20:38:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Frw7ajtE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Frw7ajtE;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PTKW427xQz3cBP
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Mar 2023 20:37:20 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 75A9DB816A0;
	Sat,  4 Mar 2023 09:37:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB9FCC433EF;
	Sat,  4 Mar 2023 09:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677922634;
	bh=Urp8GvvlmE0nzcwtjMVrYoC1e0L9DGes8qGkCHzhKj8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Frw7ajtEOFn6+b5SaLyIdtFer1CjTQOf22W0pmg+Ka4f+sDNusFiePi0WranHGSZX
	 LQNd7g8VG5/F4qxQ7cn0h1uZQAKBDGp5WoWf904wsdy+Nn/Fk0ar6DWuaJKIqCpIok
	 QrvwZPrArTUeuYm/RRggb+n6r7U7xNUDXhboz6ctxSpf3R2GGc8lGQhph7jG37yhB0
	 +ebHBki/L3NaF1YaUb28oHkP7yZ9DeMIoTqPwbLbfoaTSQ7tYVi9xvH/vbu2uK1hFZ
	 QORmCorxlA/maof6aqkcKtsuIl+QE+SGrYwp3n1FTxqa9UfOxdW1b1edeJqfV8Q4Wn
	 WJVrujy+8K84w==
Received: by pali.im (Postfix)
	id ADC197B3; Sat,  4 Mar 2023 10:37:10 +0100 (CET)
Date: Sat, 4 Mar 2023 10:37:10 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [RFC PATCH 0/4] Remove some e300/MPC83xx evaluation platforms
Message-ID: <20230304093710.tjdqbvdfqg7bgnyv@pali>
References: <AM0PR04MB6289FA528F76DDADB2BB0F958FA89@AM0PR04MB6289.eurprd04.prod.outlook.com>
 <Y/o8bQz5CuRhdD8B@windriver.com>
 <CADRPPNRTZmhEbS0Ts6iA7bmviT_C+caUkyFwJ5WGcN6q1rTORg@mail.gmail.com>
 <1b9d4d586ae7bb5cddbb97fbc9ec7de1c475afee.camel@infinera.com>
 <83565b97-8149-492e-8f22-e3722e659b98@app.fastmail.com>
 <a1e955cb-f48d-4630-6c9d-2fb3e2212aff@csgroup.eu>
 <ZAFHnaSN6F5ZYTO5@windriver.com>
 <3efa1e29-3be9-4047-beef-eb02762ae8db@app.fastmail.com>
 <2a48667f70276ad7097e898d439dea6a9c0b414b.camel@buserror.net>
 <7b1bf4dc-d09d-35b8-f4df-16bf00429b6d@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7b1bf4dc-d09d-35b8-f4df-16bf00429b6d@csgroup.eu>
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
Cc: Arnd Bergmann <arnd@arndb.de>, Leo Li <leoyang.li@nxp.com>, Crystal Wood <oss@buserror.net>, Paul Gortmaker <paul.gortmaker@windriver.com>, Claudiu Manoil <claudiu.manoil@nxp.com>, Paul Mackerras <paulus@samba.org>, Martin Kennedy <hurricos@gmail.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Saturday 04 March 2023 07:31:49 Christophe Leroy wrote:
> Le 03/03/2023 à 20:41, Crystal Wood a écrit :
> > On Fri, 2023-03-03 at 10:14 +0100, Arnd Bergmann wrote:
> >> On Fri, Mar 3, 2023, at 02:04, Paul Gortmaker wrote:
> >>> 01/03/2023 (Wed 14:23) Christophe Leroy wrote:
> >>>> Le 28/02/2023 ?? 18:51, Arnd Bergmann a ??crit??:
> >>>> Hope it clarifies how those reference boards are used.
> >>>
> >>> It was really useful input and gave an insight into how things get used.
> >>>
> >>> But let me put a slightly different slant on things.  If there is no
> >>> maintainer for the platform/architecture/CPU, then where is the
> >>> obligation for mainline to keep it up to date just for your company to
> >>> use the code/BSP as a reference?
> >>>
> >>> Do they continue to do this for one more year, or three or ...  ???
> >>> Does someone list themselves in MAINTAINERS for arch/powerpc/83xx ?
> >> ...
> >>>
> >>> If you see change 0123abcdef breaks boot on your platform, you have a
> >>> legit voice to gripe about it right then and there.  Don't wait!!!
> >>
> >> I think the answer here is that Christophe is already the only person
> >> that does this, so he is the de-facto maintainer for ppc32 regardless
> >> of whether he wants himself listed in the file or not:
> >>
> >> $ git log --no-merges --format="%an" v5.0.. arch/powerpc/platforms/[458e]* |
> >> sort | uniq -c | sort -rn | grep -vw 1
> >>       61 Christophe Leroy
> >>       12 Michael Ellerman
> >>       11 Thomas Gleixner
> >>       11 Oliver O'Halloran
> >>       11 Liang He
> >>        7 Uwe Kleine-König
> >>        6 Nick Child
> >>        4 Rasmus Villemoes
> >>        4 Randy Dunlap
> >>        4 Mike Rapoport
> >>        4 Julia Lawall
> >>        4 Andy Shevchenko
> >>        3 Xiaoming Ni
> >>        3 Nicholas Piggin
> >>        3 Marc Zyngier
> >>        3 Christophe JAILLET
> >>        3 Christoph Hellwig
> >>        2 Paul Gortmaker
> >>        2 Mathieu Malaterre
> >>        2 Markus Elfring
> >>        2 Jordan Niethe
> >>        2 Dmitry Torokhov
> >>        2 Arnd Bergmann
> >>
> >> Pretty much everyone else on the list above only did treewide
> >> cleanups, dead code removal or compile-time fixes, while Christophe
> >> is the one that fixed machine specific bugs and added new features.
> > 
> > Speaking of that, I'd be fine with Christophe replacing me in the "LINUX FOR
> > POWERPC EMBEDDED PPC83XX AND PPC85XX" entry, given that he's been way more
> > involved than me lately.
> 
> MPC83XX yes I can, I have MPC8321E Hardware, but PPC85XX I'm not sure. I 
> don't know much more than what I can experiment with QEMU.
> 
> Maybe Pali for MPC85XX ?
> 
> Christophe

I have P2020 SMP HW (mpc85xx platform) which I use on daily usage. So yes, I can help.

Martin Kennedy has other P1/P2 mpc85xx hardware and is working on Linux
support for it. So maybe can be interested in this discussion. I'm CCing.

I do not have mpc83xx HW.
