Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 242581AD1FD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 23:37:35 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 493CHb56TjzDvHQ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 07:37:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.194;
 helo=mail-oi1-f194.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 493CFT0HNqzDscV
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Apr 2020 07:35:40 +1000 (AEST)
Received: by mail-oi1-f194.google.com with SMTP id m14so318702oic.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Apr 2020 14:35:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=tWpSGNBaMFU18t4G42eRf7uq/0lzKZgYkGx4emWEElE=;
 b=qVwPsI+HzrbfWwhtIgo//j5/pBqtLzAHRh8aojT+oxkOY+jhx9WOwzT13mGJLgwgA8
 GfB4Qtua0+i5kaMc79grD85xji3cZ1I6HL8UD19bugT6lSVs8RtFNHP9kMuXYNWx623t
 gTIb1oipTovuWHHcXEH6DiRhDbxvEJmqmhmNi/0C3/hKKDUU2eSbFKHBUuaZBjQk7cF2
 wvyrva11r005uVWL7Pnu4OXPg9V5rle0rgwYecEZYb9ryCdUQLju6sniIAFSOTv0xr8w
 6hPNFxp0NT89xE3dL+HqaxL6AxmTlYx6I1StNPa5Alj3G0pzd9eiZMsJ484cVh/F9vDg
 G9iQ==
X-Gm-Message-State: AGi0Puat/PF3uNdsDYMntBvNwA8ClV39kl4PDaqq1OsgHjGZ3cH4H4JE
 j/Sj0hbHBlJF4NWg+Wuf2A==
X-Google-Smtp-Source: APiQypKwYD7vKsXxEYld0OsFN+djRcK121t4H9hMJPGsYoVvteuXNznqBneMLgwV2X7+/OOLNhe9gQ==
X-Received: by 2002:aca:c385:: with SMTP id t127mr112809oif.49.1587072937377; 
 Thu, 16 Apr 2020 14:35:37 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id a131sm7440469oii.30.2020.04.16.14.35.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2020 14:35:36 -0700 (PDT)
Received: (nullmailer pid 7336 invoked by uid 1000);
 Thu, 16 Apr 2020 21:35:35 -0000
Date: Thu, 16 Apr 2020 16:35:35 -0500
From: Rob Herring <robh@kernel.org>
To: Scott Wood <oss@buserror.net>
Subject: Re: [PATCH v4,4/4] drivers: uio: new driver for fsl_85xx_cache_sram
Message-ID: <20200416213535.GA2511@bogus>
References: <20200416153537.23736-1-wenhu.wang@vivo.com>
 <20200416153537.23736-5-wenhu.wang@vivo.com>
 <16f8fa2d26d88f22ed05e9870709c2fd5c3960cf.camel@buserror.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <16f8fa2d26d88f22ed05e9870709c2fd5c3960cf.camel@buserror.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, kernel@vivo.com,
 Wang Wenhu <wenhu.wang@vivo.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 16, 2020 at 02:59:36PM -0500, Scott Wood wrote:
> On Thu, 2020-04-16 at 08:35 -0700, Wang Wenhu wrote:
> > +#define UIO_INFO_VER	"devicetree,pseudo"
> 
> What does this mean?  Changing a number into a non-obvious string (Why
> "pseudo"?  Why does the UIO user care that the config came from the device
> tree?) just to avoid setting off Greg's version number autoresponse isn't
> really helping anything.
> 
> > +static const struct of_device_id uio_mpc85xx_l2ctlr_of_match[] = {
> > +	{	.compatible = "uio,mpc85xx-cache-sram",	},

Form is <vendor>,<device> and "uio" is not a vendor (and never will be).

> > +	{},
> > +};
> > +
> > +static struct platform_driver uio_fsl_85xx_cache_sram = {
> > +	.probe = uio_fsl_85xx_cache_sram_probe,
> > +	.remove = uio_fsl_85xx_cache_sram_remove,
> > +	.driver = {
> > +		.name = DRIVER_NAME,
> > +		.owner = THIS_MODULE,
> > +		.of_match_table	= uio_mpc85xx_l2ctlr_of_match,
> > +	},
> > +};
> 
> Greg's comment notwithstanding, I really don't think this belongs in the
> device tree (and if I do get overruled on that point, it at least needs a
> binding document).  Let me try to come up with a patch for dynamic allocation.

Agreed. "UIO" bindings have long been rejected.

Rob
