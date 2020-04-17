Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3C51AD572
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 07:04:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 493PC84GwTzDrPX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 15:04:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=buserror.net
 (client-ip=165.227.176.147; helo=baldur.buserror.net;
 envelope-from=oss@buserror.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=buserror.net
Received: from baldur.buserror.net (baldur.buserror.net [165.227.176.147])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 493P9X40VSzDqF1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Apr 2020 15:02:56 +1000 (AEST)
Received: from [2601:449:8480:af0:12bf:48ff:fe84:c9a0]
 by baldur.buserror.net with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <oss@buserror.net>)
 id 1jPJ5C-0001kX-AJ; Thu, 16 Apr 2020 23:58:30 -0500
Message-ID: <64bb1f056abd8bfab2befef5d1e6baec2056077f.camel@buserror.net>
From: Scott Wood <oss@buserror.net>
To: =?UTF-8?Q?=E7=8E=8B=E6=96=87=E8=99=8E?= <wenhu.wang@vivo.com>, Rob
 Herring <robh@kernel.org>
Date: Thu, 16 Apr 2020 23:58:29 -0500
In-Reply-To: <ANcAoADRCKKtO5p9r33Ll4og.3.1587090694317.Hmail.wenhu.wang@vivo.com>
References: <ANcAoADRCKKtO5p9r33Ll4og.3.1587090694317.Hmail.wenhu.wang@vivo.com>
Organization: Red Hat
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2601:449:8480:af0:12bf:48ff:fe84:c9a0
X-SA-Exim-Rcpt-To: wenhu.wang@vivo.com, robh@kernel.org,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 christophe.leroy@c-s.fr, linuxppc-dev@lists.ozlabs.org, kernel@vivo.com
X-SA-Exim-Mail-From: oss@buserror.net
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on baldur.localdomain
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=5.0 tests=ALL_TRUSTED,BAYES_00,
 GREYLIST_ISWHITE autolearn=ham autolearn_force=no version=3.4.2
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
 *  -15 BAYES_00 BODY: Bayes spam probability is 0 to 1%
 *      [score: 0.0000]
 * -1.5 GREYLIST_ISWHITE The incoming server has been whitelisted for
 *      this recipient and sender
Subject: Re: [PATCH v4,4/4] drivers: uio: new driver for fsl_85xx_cache_sram
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on baldur.buserror.net)
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
Cc: gregkh@linuxfoundation.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, kernel@vivo.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2020-04-17 at 10:31 +0800, 王文虎 wrote:
> > > On Thu, 2020-04-16 at 08:35 -0700, Wang Wenhu wrote:
> > > > +#define UIO_INFO_VER	"devicetree,pseudo"
> > > 
> > > What does this mean?  Changing a number into a non-obvious string (Why
> > > "pseudo"?  Why does the UIO user care that the config came from the
> > > device
> > > tree?) just to avoid setting off Greg's version number autoresponse
> > > isn't
> > > really helping anything.
> > > 
> > > > +static const struct of_device_id uio_mpc85xx_l2ctlr_of_match[] = {
> > > > +	{	.compatible = "uio,mpc85xx-cache-sram",	},
> > 
> > Form is <vendor>,<device> and "uio" is not a vendor (and never will be).
> > 
> 
> Should have been something like "fsl,mpc85xx-cache-sram-uio", and if it is
> to be defined with module parameters, this would be user defined.
> Anyway, <vendor>,<device> should always be used.
> 
> > > > +	{},
> > > > +};
> > > > +
> > > > +static struct platform_driver uio_fsl_85xx_cache_sram = {
> > > > +	.probe = uio_fsl_85xx_cache_sram_probe,
> > > > +	.remove = uio_fsl_85xx_cache_sram_remove,
> > > > +	.driver = {
> > > > +		.name = DRIVER_NAME,
> > > > +		.owner = THIS_MODULE,
> > > > +		.of_match_table	= uio_mpc85xx_l2ctlr_of_match,
> > > > +	},
> > > > +};
> > > 
> > > Greg's comment notwithstanding, I really don't think this belongs in the
> > > device tree (and if I do get overruled on that point, it at least needs
> > > a
> > > binding document).  Let me try to come up with a patch for dynamic
> > > allocation.
> > 
> > Agreed. "UIO" bindings have long been rejected.
> > 
> 
> Sounds it is. And does the modification below fit well?
> ---
> -static const struct of_device_id uio_mpc85xx_l2ctlr_of_match[] = {
> -       {       .compatible = "uio,mpc85xx-cache-sram", },
> -       {},
> +#ifdef CONFIG_OF
> +static struct of_device_id uio_fsl_85xx_cache_sram_of_match[] = {
> +       { /* This is filled with module_parm */ },
> +       { /* Sentinel */ },
>  };
> +MODULE_DEVICE_TABLE(of, uio_fsl_85xx_cache_sram_of_match);
> +module_param_string(of_id, uio_fsl_85xx_cache_sram_of_match[0].compatible,
> +                           sizeof(uio_fsl_85xx_cache_sram_of_match[0].compa
> tible), 0);
> +MODULE_PARM_DESC(of_id, "platform device id to be handled by cache-sram-
> uio");
> +#endif

No.  The point is that you wouldn't be configuring this with the device tree
at all.

-Scott


