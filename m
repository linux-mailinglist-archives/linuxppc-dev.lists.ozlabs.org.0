Return-Path: <linuxppc-dev+bounces-15356-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F33F3CFC6E1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 07 Jan 2026 08:44:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dmKmf4K4Sz2yFq;
	Wed, 07 Jan 2026 18:44:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767771858;
	cv=none; b=Q1G8yc4JX3lOAi7zNGZBY7CqVHpjCgRxtaDy9OEiWr+sVWpy/9KWNpnV5NO6URjzUts9OwaaF9j7Ye8fEtRWNMvQZ8QqF0iPrfkIM5aoDLtnQ1N+HA+nsQxGeO/0pSXmgXowqPznhOxME2LBOhMi0hEwjv5cjfWTiCBBWeBRBRe14vUxaFlBGjWV9Nu7crOQDo4Iwx6c1yG4d2s2SrhLe8fGyCerqIvjHGCdE5b190Vcz2e9U9c5YzWCxR1SSXnLFb+Hd8kndCND41a5vpRWm624qgeAe5zyZo211pPocpa31N6cFzjbsitdHcrPlvhCyQibN63EpqqOcmwk7qstYw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767771858; c=relaxed/relaxed;
	bh=Kkt4BN1qE8URamoqgKiZSyZuDf5XmvueUtedgUf6C4E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mxg7BiJLOvoH/SFzekC4UefPN+SaZ9688BB1DbJ/YweUpXbHpIBiOPo89gANC2Q5ptR9LiFsTp45SBU53mSkFnNL9RIS9APGnsZDUmc2fAOCYg4FRUJt67cSOxyFaL+je6i6MgQT8kWmUVTglp9k3ztKiCKObWTkijODQcc7BQqcsmRr74z7/c/hdVHt9y/rsRZO0EaIsVC/XtF2SBOn9OW7V5Z8U9vhRKWMm2/JkK2ikuDwwft56IJ4vsACxPBLifolM3HN53ijj3y8GwYt8JnvEIPPn2h03vpa+/Jz1TmhzwgesJ3Uh81/TkHJeBdhhBDOLWa7fTgmzC6V9WYvew==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=qkiAXa7S; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=qkiAXa7S;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dmKmd16nLz2xHP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Jan 2026 18:44:16 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C9EBE4195F;
	Wed,  7 Jan 2026 07:44:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 201D6C4CEF7;
	Wed,  7 Jan 2026 07:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1767771854;
	bh=wtepG4ALMqKiyvEt0jTluSuqHX787/roVKJbXsbF/j0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qkiAXa7S+dmxh6XiyOJ+dURPUcCWvD6eKm660lGoJceLJX0suxTera4dNqRcaUlgh
	 w9+nwLM9cKZEZ5CTRWMDiezR/GE+amG8FjIGCKiGt7ayLbrignoWbYr41YE+01mW7J
	 hxisgmoRvkbvxh7x2Li1OKcsBiQ986t3XZURBOtc=
Date: Wed, 7 Jan 2026 08:44:11 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Ioana Ciornei <ioana.ciornei@nxp.com>,
	Laurentiu Tudor <laurentiu.tudor@nxp.com>,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: fsl-mc: add missing fsl_mc_bus_dpdbg_type
 declaration
Message-ID: <2026010738-collie-quarters-5ceb@gregkh>
References: <fd30e197df618be4444f9d2172ba794e5f49ae87.1767725589.git.chleroy@kernel.org>
 <2026010755-registrar-agreeably-a626@gregkh>
 <a65f4add-f052-4c51-85e9-317b42802df1@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a65f4add-f052-4c51-85e9-317b42802df1@kernel.org>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Jan 07, 2026 at 08:39:41AM +0100, Christophe Leroy (CS GROUP) wrote:
> Hi Ioana,
> 
> Le 07/01/2026 à 06:30, Greg Kroah-Hartman a écrit :
> > On Tue, Jan 06, 2026 at 07:54:21PM +0100, Christophe Leroy (CS GROUP) wrote:
> > > Fix following sparse warning:
> > > 
> > >    CHECK   drivers/bus/fsl-mc/fsl-mc-bus.c
> > > drivers/bus/fsl-mc/fsl-mc-bus.c:435:26: warning: symbol 'fsl_mc_bus_dpdbg_type' was not declared. Should it be static?
> > > 
> > > As it is exported it can't be static. So declare it in mc.h like
> > > all other similar objects.
> > > 
> > > Fixes: e70ba1b06c26 ("bus: fsl-mc: add the dpdbg device type")
> > > Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
> > > ---
> > >   include/linux/fsl/mc.h | 1 +
> > >   1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/include/linux/fsl/mc.h b/include/linux/fsl/mc.h
> > > index 897d6211c1635..28441a456bb48 100644
> > > --- a/include/linux/fsl/mc.h
> > > +++ b/include/linux/fsl/mc.h
> > > @@ -451,6 +451,7 @@ extern const struct device_type fsl_mc_bus_dpdcei_type;
> > >   extern const struct device_type fsl_mc_bus_dpaiop_type;
> > >   extern const struct device_type fsl_mc_bus_dpci_type;
> > >   extern const struct device_type fsl_mc_bus_dpdmai_type;
> > > +extern const struct device_type fsl_mc_bus_dpdbg_type;
> > 
> > As it's obviously not used anywhere, this should not be the fix, please
> > just mark it static and remove the EXPORT_SYMBOL_GPL() as well.
> 
> What's your opinion here as Maintainer of this driver, what should we do ?
> 
> Greg is right that it is nowhere used, and it is the same for several other
> types, the only difference being that they have a matching
> is_fsl_mc_bus_dp..() helper that hides the type, but not all helpers are
> used, and many of them are not used outside drivers/bus/fsl-mc/ which cannot
> be built as a module:

Anything that does not need to be exported (i.e. not used by anything
else in the kernel tree), should be made static.

thanks,

greg k-h

