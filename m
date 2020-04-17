Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E96621AD7F6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 09:49:48 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 493St21nj8zDrfg
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 17:49:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=hiGeoQhV; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 493Sjh61yFzDrdl
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Apr 2020 17:42:32 +1000 (AEST)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D3AB820857;
 Fri, 17 Apr 2020 07:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587109350;
 bh=RytlNnohLlxheLZs5JJcHJ+1KnMXZLuPP/8eBpkQuUs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hiGeoQhVN4HMT4L+CV3ztP5pYHp8T4N4tbLB/vti7FyUdbJFOtZbnitIBD4kZ7FMz
 i9Z/qZgaZ5Z3aTEZcCjHVVshVUKijJc0+SE8xXX5M0sL9Rlnfh7GPNLq0+A7WlIBSp
 WoavnouHAulpBOyWRrbSR2tdOAS0J17BIpIV94hU=
Date: Fri, 17 Apr 2020 09:42:28 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Scott Wood <oss@buserror.net>
Subject: Re: [PATCH v4,4/4] drivers: uio: new driver for fsl_85xx_cache_sram
Message-ID: <20200417074228.GA22586@kroah.com>
References: <ANcAoADRCKKtO5p9r33Ll4og.3.1587090694317.Hmail.wenhu.wang@vivo.com>
 <64bb1f056abd8bfab2befef5d1e6baec2056077f.camel@buserror.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <64bb1f056abd8bfab2befef5d1e6baec2056077f.camel@buserror.net>
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
Cc: Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org,
 kernel@vivo.com, =?utf-8?B?546L5paH6JmO?= <wenhu.wang@vivo.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 16, 2020 at 11:58:29PM -0500, Scott Wood wrote:
> On Fri, 2020-04-17 at 10:31 +0800, 王文虎 wrote:
> > > > On Thu, 2020-04-16 at 08:35 -0700, Wang Wenhu wrote:
> > > > > +#define UIO_INFO_VER	"devicetree,pseudo"
> > > > 
> > > > What does this mean?  Changing a number into a non-obvious string (Why
> > > > "pseudo"?  Why does the UIO user care that the config came from the
> > > > device
> > > > tree?) just to avoid setting off Greg's version number autoresponse
> > > > isn't
> > > > really helping anything.
> > > > 
> > > > > +static const struct of_device_id uio_mpc85xx_l2ctlr_of_match[] = {
> > > > > +	{	.compatible = "uio,mpc85xx-cache-sram",	},
> > > 
> > > Form is <vendor>,<device> and "uio" is not a vendor (and never will be).
> > > 
> > 
> > Should have been something like "fsl,mpc85xx-cache-sram-uio", and if it is
> > to be defined with module parameters, this would be user defined.
> > Anyway, <vendor>,<device> should always be used.
> > 
> > > > > +	{},
> > > > > +};
> > > > > +
> > > > > +static struct platform_driver uio_fsl_85xx_cache_sram = {
> > > > > +	.probe = uio_fsl_85xx_cache_sram_probe,
> > > > > +	.remove = uio_fsl_85xx_cache_sram_remove,
> > > > > +	.driver = {
> > > > > +		.name = DRIVER_NAME,
> > > > > +		.owner = THIS_MODULE,
> > > > > +		.of_match_table	= uio_mpc85xx_l2ctlr_of_match,
> > > > > +	},
> > > > > +};
> > > > 
> > > > Greg's comment notwithstanding, I really don't think this belongs in the
> > > > device tree (and if I do get overruled on that point, it at least needs
> > > > a
> > > > binding document).  Let me try to come up with a patch for dynamic
> > > > allocation.
> > > 
> > > Agreed. "UIO" bindings have long been rejected.
> > > 
> > 
> > Sounds it is. And does the modification below fit well?
> > ---
> > -static const struct of_device_id uio_mpc85xx_l2ctlr_of_match[] = {
> > -       {       .compatible = "uio,mpc85xx-cache-sram", },
> > -       {},
> > +#ifdef CONFIG_OF
> > +static struct of_device_id uio_fsl_85xx_cache_sram_of_match[] = {
> > +       { /* This is filled with module_parm */ },
> > +       { /* Sentinel */ },
> >  };
> > +MODULE_DEVICE_TABLE(of, uio_fsl_85xx_cache_sram_of_match);
> > +module_param_string(of_id, uio_fsl_85xx_cache_sram_of_match[0].compatible,
> > +                           sizeof(uio_fsl_85xx_cache_sram_of_match[0].compa
> > tible), 0);
> > +MODULE_PARM_DESC(of_id, "platform device id to be handled by cache-sram-
> > uio");
> > +#endif
> 
> No.  The point is that you wouldn't be configuring this with the device tree
> at all.

Wait, why not?  Don't force people to use module parameters, that is
crazy.  DT describes the hardware involved, if someone wants to bind to
a specific range of memory, as described by DT, why can't they do so?

I can understand not liking the name "uio" in a dt tree, but there's no
reason that DT can not describe what a driver binds to here.

Remember, module parameters are NEVER the answer, this isn't the 1990's
anymore.

thanks,

greg k-h
