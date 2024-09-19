Return-Path: <linuxppc-dev+bounces-1449-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BEBC97C339
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Sep 2024 05:56:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X8MBV5M26z2yDH;
	Thu, 19 Sep 2024 13:56:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=114.132.124.171
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726718162;
	cv=none; b=oWkwJKBPk6CMEbHqItyYidD5GvZc1SRlLh8WfcRMzcj5h27hqebfQvUUR+28g5cLocOBOoisHk52eG9NPI3rDkCQi0NkMxXXwQfrxO5NiKSTo6IJykRqSRnjvqrGs34D4Vz8OB7pjx00XQ3jRI6nvVRuCMrqW6eza9j7WfaZGm6+kbTBCkohNaNolIiZeURNe9UMaadWchvR5CPjCB8ZuhZdBkQMlfXtvuGj8csxWVWqsFn44CNaNOibfo55oPJ4Dd82Hn3P8pBsaMIdnOwrxu8dQ66gNn7tRsYwQ01FZr+CTsnY//uaUBZxihvZAjAEMcO510DeM1FKJHLhJEYpXA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726718162; c=relaxed/relaxed;
	bh=oywtgu0lp2wX5/DmWyzjhOdSfP3v1EHicaX4JOOY80M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XpYO72EngxD5CgO6KutuDwtqzIGeye8oFvQt87gA6tA2Itov9RCHi3001p6lY+DMbTSf1kN+d/Uuvjpt3nhHCOEsj90ozAR76MdABy3I/1INDrRL0vVARwR3Vtc8qXxDEMnsW5RYXtlroMzWFQ4pRI693wr4d0gH6iUSbwtA6dQmvEo4UOphIlSVmt+JQpknoJDDCo+GO0khQ84HVOWBv6siaTBnJVB8wxAZtRaDBnx/CSRBZXELWPW2aYcWSQO2EgotRrbF9Z24mwl8wMapdnAhLPEmKSxTfTvXxUkSq0bNbuilhF/4yJvHo/Bo5EgcOgUj+8t2tb3QcyKSlWkhsQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=shingroup.cn; spf=pass (client-ip=114.132.124.171; helo=bg1.exmail.qq.com; envelope-from=luming.yu@shingroup.cn; receiver=lists.ozlabs.org) smtp.mailfrom=shingroup.cn
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=shingroup.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=shingroup.cn (client-ip=114.132.124.171; helo=bg1.exmail.qq.com; envelope-from=luming.yu@shingroup.cn; receiver=lists.ozlabs.org)
Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.124.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X8MBT0ycqz2xs8
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Sep 2024 13:56:00 +1000 (AEST)
X-QQ-mid: bizesmtpsz7t1726718080telposq
X-QQ-Originating-IP: V5NafoQtd2r3EER7QhH+pxJhBzkw4FTZ0iHW6xRwIMY=
Received: from HX09040029.powercore.com.cn ( [180.171.104.254])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 19 Sep 2024 11:54:38 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10480147457873423502
Date: Thu, 19 Sep 2024 11:54:08 +0800
From: Luming Yu <luming.yu@shingroup.cn>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	npiggin@gmail.com, christophe.leroy@csgroup.eu,
	jialong.yang@shingroup.cn, luming.yu@gmail.com
Subject: Re: [RFC PATCH] powerpc/tlb: enable arch want batched unmap tlb flush
Message-ID: <040533E1233A67C4+ZuugYFMsPMaDAjI9@HX09040029.powercore.com.cn>
References: <9BC3D1299ECE8428+20240918092515.2121-2-luming.yu@shingroup.cn>
 <87wmj8pbte.fsf@mail.lhotse>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wmj8pbte.fsf@mail.lhotse>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpsz:shingroup.cn:qybglogicsvrgz:qybglogicsvrgz8a-1

On Thu, Sep 19, 2024 at 01:22:21PM +1000, Michael Ellerman wrote:
> Luming Yu <luming.yu@shingroup.cn> writes:
> > From: Yu Luming <luming.yu@gmail.com>
> >
> > ppc always do its own tracking for batch tlb.
> 
> I don't think it does? :)
> 
> I think you're referring to the batch handling in 
> arch/powerpc/include/asm/book3s/64/tlbflush-hash.h ?
> 
> But that's only used for 64-bit Book3S with the HPT MMU.
> 
> > By trivially enabling
> > the ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH in ppc, ppc arch can re-use
> > common code in rmap and reduce overhead and do optimization it could not
> > have without a tlb flushing context at low architecture level.
> >
> > Signed-off-by: Luming Yu <luming.yu@shingroup.cn>
> > ---
> >  arch/powerpc/Kconfig                |  1 +
> >  arch/powerpc/include/asm/tlbbatch.h | 30 +++++++++++++++++++++++++++++
> >  2 files changed, 31 insertions(+)
> >  create mode 100644 arch/powerpc/include/asm/tlbbatch.h
> 
> This doesn't build:
> 
>   https://github.com/linuxppc/linux-snowpatch/actions/runs/10919442655
> 
> Can you please follow the instructions here:
> 
>   https://github.com/linuxppc/wiki/wiki/Testing-with-GitHub-Actions
> 
> Which describe how to fork our CI tree that has Github Actions
> preconfigured, then you can apply your patches on top and push to github
> and it will do some test builds for you. Notably it will do 32-bit
> builds which is what broke here.
thanks, I will take a look and do this for next patch before posting on mailing list. :-)
Ideally it should also include qemu boot tests for targets that must work.
I think we could also need a powerpc yocto recipe as well to make patch test more customizable
and reproducible than fedora/Debian distro. I've been searching for it for a while, but I couldn't find a useful one. Maybe I need to come up one of my own to facilitate the ci test bot ideas.
> 
> cheers
> 


