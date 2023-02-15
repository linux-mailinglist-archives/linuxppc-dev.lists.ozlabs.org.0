Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 523B96983F3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 19:58:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PH6lz0zCNz3f3V
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 05:58:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=krIVl1gP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=krIVl1gP;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PH6l443Mdz3cK9
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Feb 2023 05:57:20 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9258C61D18;
	Wed, 15 Feb 2023 18:57:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7752C433EF;
	Wed, 15 Feb 2023 18:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676487438;
	bh=ig6irkIR05uZUaBNqcQhbqIy78vpt+mCwolaWyt3ygs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=krIVl1gP63ZhPrbxMxmqi/PSDtvdBeY/STPWj4NHapIrBPeKLvhh0+jfxTWxNP002
	 9IBhObbi9371c2lxB1h/hnvyaHtxH4HE0qJs2Yccu3pcCn4O8Dx0oegsmU6HCVY0jU
	 moBqAZFdKqsgJ0JvWUlIcjmnGwJbmJP/zDu9x7dn6ciGjjBb/dIHS0GQgBWUcumiUL
	 lJ6K0AFMKXlEDNGPuThcHtsjKkQc0nYjIYIUX5AsBK05Xg4rqoliqoSKsDgbAPIzw/
	 ZrPJxBETr7PsZOwS8tqLUpmtyreBv1/K0sw2zqU+HpYvmKWMCxZKrXRB8lo8lqUNko
	 GB8+p4aoSd+Dg==
Received: by pali.im (Postfix)
	id BB34A770; Wed, 15 Feb 2023 19:57:14 +0100 (CET)
Date: Wed, 15 Feb 2023 19:57:14 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2 0/8] powerpc/85xx: p2020: Create one unified machine
 description
Message-ID: <20230215185714.nndfj73ldxkgn67k@pali>
References: <20221224211425.14983-1-pali@kernel.org>
 <20230122111631.dgw5uwtfjsqack57@pali>
 <22db0b5a-1b7f-a94b-1092-a314d57dedf5@csgroup.eu>
 <20230123200922.scnwgne3dsip24lg@pali>
 <20230209001507.nc2njllc32pjp2az@pali>
 <ceb80ec7-57cc-ba39-88f9-72fc8fa67930@csgroup.eu>
 <20230213201145.72uzxbghabuyugbu@pali>
 <67c1b908-877b-13d9-7e73-5a6ef396bed5@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <67c1b908-877b-13d9-7e73-5a6ef396bed5@csgroup.eu>
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

On Tuesday 14 February 2023 05:47:08 Christophe Leroy wrote:
> Le 13/02/2023 à 21:11, Pali Rohár a écrit :
> > On Monday 13 February 2023 19:58:15 Christophe Leroy wrote:
> >> Le 09/02/2023 à 01:15, Pali Rohár a écrit :
> >>>>
> >>>> This patch moves all p2020 boards from mpc85xx_rdb.c and mpc85xx_ds.c
> >>>> files into new p2020.c file, and plus it copies all helper functions
> >>>> which p2020 boards requires. This patch does not introduce any new code
> >>>> or functional change. It should be really plain copy/move.
> >>
> >> Yes after looking into it in more details, it is exactly that. You
> >> copied all helper functions but this is not said in the commit message.
> >> I think it should be said, and more important it should be explained why.
> >> Because this is exactly what I was not understanding, why I couldn't see
> >> all moved functions: just because many of them were not moved but copied.
> >>
> >> In the two first pages you made some function static, and then you
> >> duplicated it. Why ? Why not keep it global and just use it from one
> >> place to the other ?
> >>
> >> Because after patch 3 we have:
> >>
> >> arch/powerpc/platforms/85xx/mpc85xx_rdb.c:static void __init
> >> mpc85xx_rdb_pic_init(void)
> >> arch/powerpc/platforms/85xx/p2020.c:static void __init
> >> mpc85xx_rdb_pic_init(void)
> >>
> >> arch/powerpc/platforms/85xx/mpc85xx_ds.c:static void __init
> >> mpc85xx_ds_pic_init(void)
> >> arch/powerpc/platforms/85xx/p2020.c:static void __init
> >> mpc85xx_ds_pic_init(void)
> >>
> >> Why not just drop patches 1 and 2 and keep those two functions and all
> >> the other common functions like mpc85xx_8259_cascade()
> >> mpc85xx_ds_uli_init() and a lot more  in a separate common file ?
> >>
> >> Christophe
> > 
> > After applying all patches there is no mpc85xx_rdb_pic_init() /
> > mpc85xx_ds_pic_init() function in p2020.c file. There is
> > p2020_pic_init() in p2020.c but it is slightly different than previous
> > two functions.
> 
> Ok, fair enough, but then please explain in the commit message that you 
> copy the functions and then they will be re-written in following 
> patches. That way we know exactly what we are reviewing.

But it is already explained in the commit message. Is not it enough? Or
should I rephrase some parts of the commit message?

> > 
> > Maybe it could be possible to create one function mpc85xx_pic_init() as
> > unification of previous 3 functions, but such change would be needed to
> > test on lot of mpc85xx boards, which would be affected by such change.
> > And I do not have them for testing. I have only P2020.
> 
> No, if the function are different it's better each platform has its own. 
> My comment was for functions that are exactly the same.
> 
> > 
> > So I wrote *_pic_init() function which is p2020 specific, like already
> > existing ds and rdb specific functions in their own source files.
