Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4148F63F646
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 18:40:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NNNcx1GpMz3bZj
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Dec 2022 04:40:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QS9dXU4Q;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QS9dXU4Q;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NNNbz3D5Nz2xrL
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Dec 2022 04:39:11 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 66A21B81FBF;
	Thu,  1 Dec 2022 17:39:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9063C433C1;
	Thu,  1 Dec 2022 17:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669916346;
	bh=EQiwzs8F1/qVmkVpXCClLWzdE+Wc1pX7zMIG7mNXbv8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QS9dXU4QLiEZW5ErRsJA5lWiHpLrRUa1h5LOICfJ36ph0K51kSOFwnbiFC/3pn1u+
	 R5++oOy+mQtkZr3a5f14FktlINBt20oLbSN/rIhR2iM7JN2qRw974J2bWG5q6ZqNQi
	 EfYyjAJQaADJSs9JW2nutw7ZaGoA6qj0kRm9wVBWAPN91zlEkv8JvQU0U6yJK87mmh
	 dd2628oqaGM2OwpilLKvys6RYmdC5rRyG8gBoG9MA5Ue7Y3+bceY+QCC1KN5p6uk2d
	 W96pSkpEYanCf3kn6sw1218+juUkxA91q7GIHAuhCnkY3WscYQxFt4vkp4Uk62hssS
	 QXYdhW/LHL3pA==
Received: by pali.im (Postfix)
	id C653C5CD; Thu,  1 Dec 2022 18:39:02 +0100 (CET)
Date: Thu, 1 Dec 2022 18:39:02 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 5/5] powerpc: dts: remove label = "cpu" from DSA
 dt-binding
Message-ID: <20221201173902.zrtpeq4mkk3i3vpk@pali>
References: <20221130141040.32447-1-arinc.unal@arinc9.com>
 <20221130141040.32447-6-arinc.unal@arinc9.com>
 <87a647s8zg.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87a647s8zg.fsf@mpe.ellerman.id.au>
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
Cc: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>, devicetree@vger.kernel.org, =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thursday 01 December 2022 21:40:03 Michael Ellerman wrote:
> Arınç ÜNAL <arinc.unal@arinc9.com> writes:
> > This is not used by the DSA dt-binding, so remove it from all devicetrees.
> >
> > Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> > ---
> >  arch/powerpc/boot/dts/turris1x.dts | 2 --
> >  1 file changed, 2 deletions(-)
> 
> Adding Pali to Cc.
> 
> These were only recently updated in commit:
> 
>   8bf056f57f1d ("powerpc: dts: turris1x.dts: Fix labels in DSA cpu port nodes")
> 
> Which said:
> 
>   DSA cpu port node has to be marked with "cpu" label.
> 
> But if the binding doesn't use them then I'm confused why they needed to
> be updated.
> 
> cheers

I was told by Marek (CCed) that DSA port connected to CPU should have
label "cpu" and not "cpu<number>". Modern way for specifying CPU port is
by defining reference to network device, which there is already (&enet1
and &enet0). So that change just "fixed" incorrect naming cpu0 and cpu1.

So probably linux kernel does not need label = "cpu" in DTS anymore. But
this is not the reason to remove this property. Linux kernel does not
use lot of other nodes and properties too... Device tree should describe
hardware and not its usage in Linux. "label" property is valid in device
tree and it exactly describes what or where is this node connected. And
it may be used for other systems.

So I do not see a point in removing "label" properties from turris1x.dts
file, nor from any other dts file.

> 
> > diff --git a/arch/powerpc/boot/dts/turris1x.dts b/arch/powerpc/boot/dts/turris1x.dts
> > index 045af668e928..3841c8d96d00 100644
> > --- a/arch/powerpc/boot/dts/turris1x.dts
> > +++ b/arch/powerpc/boot/dts/turris1x.dts
> > @@ -147,7 +147,6 @@ ports {
> >  
> >  					port@0 {
> >  						reg = <0>;
> > -						label = "cpu";
> >  						ethernet = <&enet1>;
> >  						phy-mode = "rgmii-id";
> >  
> > @@ -184,7 +183,6 @@ port@5 {
> >  
> >  					port@6 {
> >  						reg = <6>;
> > -						label = "cpu";
> >  						ethernet = <&enet0>;
> >  						phy-mode = "rgmii-id";
> >  
> > -- 
> > 2.34.1
