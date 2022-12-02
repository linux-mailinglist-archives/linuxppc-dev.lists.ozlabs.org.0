Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32CC3640E97
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Dec 2022 20:36:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NP39M0D4Cz3bhH
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Dec 2022 06:36:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IzHfAHRF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IzHfAHRF;
	dkim-atps=neutral
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NP38M6q7Yz3bTq
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Dec 2022 06:36:03 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 03581CE1FA8;
	Fri,  2 Dec 2022 19:35:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB759C433D6;
	Fri,  2 Dec 2022 19:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670009756;
	bh=UzDWbYXlCGyLM2eIK2tt5Fzt85naQob+4laVVNHKsTs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IzHfAHRFLGd9i1ue3fBcAuKoV2DWdzUnPqcNy2txJ2VgI1YcTpyKFADMU/Cb7fENu
	 gDu/23dkXvEnI0IZAcNnIpVNX7IxZOwwPHF3JwDmqqBAyFx7XPmiWLefroY+Hnmdps
	 HcHh+mHr3LJKRPwwWzChEMg/ujLayEEFHkxv3HIz1PDTV2NKNgJhX4nuzrJWRfzjao
	 14ZoVPjGVDU9zWI91EZxMVHHgrkCFk7FlnjNkSAEm6rbGPtRXhvc9i96WC33yKAE7R
	 Cha65nEPaNuvXVTjkii8vwWkY82HNNfTK+Xo1YdUKKhvdAOQwIXZ9hfFwgu2hz8zXy
	 Jgsoomp79kveQ==
Received: by pali.im (Postfix)
	id DE23587A; Fri,  2 Dec 2022 20:35:52 +0100 (CET)
Date: Fri, 2 Dec 2022 20:35:52 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 5/5] powerpc: dts: remove label = "cpu" from DSA
 dt-binding
Message-ID: <20221202193552.vehqk6u53n36zxwl@pali>
References: <20221130141040.32447-1-arinc.unal@arinc9.com>
 <20221130141040.32447-6-arinc.unal@arinc9.com>
 <87a647s8zg.fsf@mpe.ellerman.id.au>
 <20221201173902.zrtpeq4mkk3i3vpk@pali>
 <20221201234400.GA1692656-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221201234400.GA1692656-robh@kernel.org>
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
Cc: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>, devicetree@vger.kernel.org, =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thursday 01 December 2022 17:44:00 Rob Herring wrote:
> On Thu, Dec 01, 2022 at 06:39:02PM +0100, Pali Rohár wrote:
> > On Thursday 01 December 2022 21:40:03 Michael Ellerman wrote:
> > > Arınç ÜNAL <arinc.unal@arinc9.com> writes:
> > > > This is not used by the DSA dt-binding, so remove it from all devicetrees.
> > > >
> > > > Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> > > > ---
> > > >  arch/powerpc/boot/dts/turris1x.dts | 2 --
> > > >  1 file changed, 2 deletions(-)
> > > 
> > > Adding Pali to Cc.
> > > 
> > > These were only recently updated in commit:
> > > 
> > >   8bf056f57f1d ("powerpc: dts: turris1x.dts: Fix labels in DSA cpu port nodes")
> > > 
> > > Which said:
> > > 
> > >   DSA cpu port node has to be marked with "cpu" label.
> > > 
> > > But if the binding doesn't use them then I'm confused why they needed to
> > > be updated.
> > > 
> > > cheers
> > 
> > I was told by Marek (CCed) that DSA port connected to CPU should have
> > label "cpu" and not "cpu<number>". Modern way for specifying CPU port is
> > by defining reference to network device, which there is already (&enet1
> > and &enet0). So that change just "fixed" incorrect naming cpu0 and cpu1.
> > 
> > So probably linux kernel does not need label = "cpu" in DTS anymore. But
> > this is not the reason to remove this property. Linux kernel does not
> > use lot of other nodes and properties too... Device tree should describe
> > hardware and not its usage in Linux. "label" property is valid in device
> > tree and it exactly describes what or where is this node connected. And
> > it may be used for other systems.
> > 
> > So I do not see a point in removing "label" properties from turris1x.dts
> > file, nor from any other dts file.
> 
> Well, it seems like a bit of an abuse of 'label' to me. 'label' should 
> be aligned with a sticker or other identifier identifying something to a 
> human. Software should never care what the value of 'label' is.
> 
> Rob

But it already does. "label" property is used for setting (initial)
network interface name for DSA drivers. And you can try to call e.g.
git grep '"cpu"' net/dsa drivers/net/dsa to see that cpu is still
present on some dsa places (probably relict or backward compatibility
before eth reference).

I agree with you that in this case it is abuse. But I would not say that
software should not care about "label". I think that software should
care about "label" but only in situation in which it presents
information to user. So if user wants to see device with labels *ABC*
(meaning show me anything which stickers contains substring ABC) then
software should filter devices and turns that with asked label.

The main problem here is _existing_ software. New software should really
do not use cpu label for deciding if network port is connected to cpu or
not and it should be designed correctly. But you cannot change nor fix
old / existing software...

The worst thing which can be done is breaking updated version of (old)
software. Prevention is always testing software and in this case testing
on the real hardware. I know, it is hard as developers do not have
such lot of hardware devices and configurations.
