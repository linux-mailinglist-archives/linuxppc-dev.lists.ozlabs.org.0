Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8551514A4A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Apr 2022 15:10:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KqXsb4kQDz3dR7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Apr 2022 23:10:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sx6yXO6O;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=sx6yXO6O; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KqXrN4Sz4z3bpJ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Apr 2022 23:09:24 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4921062263;
 Fri, 29 Apr 2022 13:09:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D55CC385A4;
 Fri, 29 Apr 2022 13:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651237759;
 bh=gsw2NQ8meQdho5gPWmi2xFJh8Od4dcV8ZukPxem7bpE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sx6yXO6OaHYinKKaqKTy0u2DKKoVc29i7nX2J4Ro1D4682Fza3Scw/MsnrGB1qsbg
 koLVIN/RIlUIOlSfKrwNB5KzQw+JyQCFRHLcFFSsbYkw62Rr+2Xty0XIKGVDeVrrPT
 gITsvpLAOiXkTJ80isgmu9SsxDxgeDydX7MDtKcVPanrpiS+awzU6gOLAJGXZOJrHE
 luMk8/+lzkjf/NplhTkqrNdtIreItqVVwBHmBKdQ5Ztexlo5lIO08dNfRbv9r3xXcn
 TWb6tuHchAzOWvvQBJ/VD0Qbn8ajvK8waQylBDk4Tr/Si3/MAyvp0LyOFfnRfPSur5
 5WGycrUiBCoNw==
Received: by pali.im (Postfix)
 id BC996CAF; Fri, 29 Apr 2022 15:09:16 +0200 (CEST)
Date: Fri, 29 Apr 2022 15:09:16 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: L2 SRAM on PowerPC e500 and Caching-inhibited bit
Message-ID: <20220429130916.d7wpf3ofwu4oprv6@pali>
References: <20220425182515.4dm37qbzjzpggce3@pali>
 <874k2c9heo.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <874k2c9heo.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Friday 29 April 2022 22:57:03 Michael Ellerman wrote:
> Pali Rohár <pali@kernel.org> writes:
> > Hello!
> >
> > I started playing with PowerPC e500 architecture, it is something really
> > new for me and I suspect that I found a bug in U-Boot code which
> > configures L2 cache as initial SRAM (L2 with locked lines).
> >
> > U-Boot code for the first half of L2 cache sets Caching-inhibited
> > (MAS2_I) in TLB and for second half of L2 cache it unsets this bit.
> > And I think that this is a bug as it seems strange if one half of L2
> > should be mapped differently than second half.
> >
> > I wrote about it email to U-Boot mailing list:
> > https://lore.kernel.org/u-boot/20220413092633.gmz4rqpiha4rwecb@pali/
> >
> > I discussed about it on U-Boot IRC channel and developers suggested me
> > to write on Linux PowerPC mailing list as there could be more skilled
> > people.
> >
> > Michael, or anybody else, could you help me with this? Do you know if L2
> > SRAM entry in TLB for e500v2 / BookE architecture should have MAS2_I bit
> > set or not?
> 
> Sorry I don't know those sort of low-level details for Freescale
> machines.
> 
> Hopefully some former Freescale person will remember and reply here.

Ok, so I hope that somebody with knowledge about these CPUs is still on
the list here.

> It's also possible that Linux ignores what U-Boot did and sets it up
> itself, have you looked at the Linux code?
> 
> cheers

Usage of L2 cache as SRAM makes sense only during early boot when DDR is
not configured yet. So Linux for sure does not use this L2 cache as SRAM
setup as it has full access to DDR, and use L2 cache as L2 cache.
