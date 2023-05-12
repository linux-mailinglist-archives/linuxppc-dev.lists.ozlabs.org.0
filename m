Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B82A2701236
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 May 2023 00:35:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QJ3W74qBMz3fZK
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 May 2023 08:35:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=oorJa7oU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=oorJa7oU;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QJ3VD4L0sz3bqv
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 May 2023 08:34:43 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0481E63C85;
	Fri, 12 May 2023 22:34:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10813C433D2;
	Fri, 12 May 2023 22:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1683930879;
	bh=C4/3tftPmfjnwOxJgXC4WqCyGzMl5SxDSvLNREcRE9M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oorJa7oUTKyw2EhCfdYhAIFDMoM4ghO+MDH8Gsb+nOziXzc0Oxf7uYS5n6T/nDThX
	 JQedPLG3e+9PfjlaEW6IvPMP9XrOpylCEn1PCXGSu/DM57iFFLX7U7HxFEDb0jlz84
	 lIyFCWq5nRQ7C68CMnuK+MideTCwqc0KQpUuExUE=
Date: Sat, 13 May 2023 07:34:33 +0900
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: Fwd: Linux 6.3.1 + AMD RX 570 on ppc64le 4K: Kernel attempted to
 read user page (1128) - exploit attempt? (uid: 0)
Message-ID: <2023051353-epiphany-retorted-4ad1@gregkh>
References: <588c1a66-9976-c96f-dcdd-beec8b7410f0@gmail.com>
 <3e5548e4-5a3e-9346-ec58-3617e1947186@gmail.com>
 <a50537d1f1af34104793218acb954a61@linuxsystems.it>
 <3383ba6e-e62b-cd9b-8a61-39b0de8af579@csgroup.eu>
 <57100be6-d379-0bc7-6d45-228cd46f9c81@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <57100be6-d379-0bc7-6d45-228cd46f9c81@csgroup.eu>
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
Cc: Sasha Levin <sashal@kernel.org>, Linux Regressions <regressions@lists.linux.dev>, Qingqing Zhuo <qingqing.zhuo@amd.com>, Fangzhi Zuo <Jerry.Zuo@amd.com>, Linux AMDGPU <amd-gfx@lists.freedesktop.org>, Daniel Wheeler <daniel.wheeler@amd.com>, =?iso-8859-1?Q?Niccol=F2?= Belli <darkbasic@linuxsystems.it>, Hersen Wu <hersenxs.wu@amd.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Alex Deucher <alexander.deucher@amd.com>, Linux for PowerPC <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 12, 2023 at 03:25:47PM +0000, Christophe Leroy wrote:
> 
> 
> Le 12/05/2023 à 17:16, Christophe Leroy a écrit :
> > 
> > 
> > Le 11/05/2023 à 19:25, Niccolò Belli a écrit :
> >> [Vous ne recevez pas souvent de courriers de 
> >> darkbasic@linuxsystems.it. D?couvrez pourquoi ceci est important ? 
> >> https://aka.ms/LearnAboutSenderIdentification ]
> >>
> >> Il 2023-05-12 10:32 Bagas Sanjaya ha scritto:
> >>> #regzbot introduced: f4f3b7dedbe849
> >>> #regzbot link: https://gitlab.freedesktop.org/drm/amd/-/issues/2553
> >>
> >> It doesn't look like the aforementioned patch made its way into 6.3 yet:
> >>
> >> niko@talos2 ~/devel/linux-stable $ git branch
> >> * linux-6.3.y
> >>    master
> >> niko@talos2 ~/devel/linux-stable $ git show f4f3b7dedbe8 | patch -p1
> >> patching file
> >> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> >> Hunk #1 succeeded at 227 (offset 15 lines).
> >> Hunk #2 succeeded at 269 with fuzz 2 (offset 19 lines).
> >> patching file
> >> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.h
> >> Hunk #1 succeeded at 49 with fuzz 2 (offset 15 lines).
> > 
> > As far as I can see that patch has no Fixes: tag, so it will unlikely be 
> > automatically merged into stable.
> > 
> > Has anybody requested greg/sasha to get it into 6.3 ?
> > 
> 
> In fact, it seems that patch is already part of 6.3:
> 
> $ git tag --contains f4f3b7dedbe8
> v6.3
> v6.3-rc5
> v6.3-rc6
> v6.3-rc7
> v6.3.1
> v6.3.2
> v6.4-rc1

And that commit is already in the following releases:
	5.10.177 5.15.106 6.1.23 6.2.10 6.3

So what needs to be done here?

confused,

greg k-h
