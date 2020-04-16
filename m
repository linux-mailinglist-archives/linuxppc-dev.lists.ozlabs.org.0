Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBA51AD0B3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 22:01:47 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4939945hZtzDsMs
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 06:01:44 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49396p3ZZCzDrj8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Apr 2020 05:59:46 +1000 (AEST)
Received: from [2601:449:8480:af0:12bf:48ff:fe84:c9a0]
 by baldur.buserror.net with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <oss@buserror.net>)
 id 1jPAfj-0007F3-PU; Thu, 16 Apr 2020 14:59:40 -0500
Message-ID: <16f8fa2d26d88f22ed05e9870709c2fd5c3960cf.camel@buserror.net>
From: Scott Wood <oss@buserror.net>
To: Wang Wenhu <wenhu.wang@vivo.com>, gregkh@linuxfoundation.org, 
 linux-kernel@vger.kernel.org, christophe.leroy@c-s.fr, 
 linuxppc-dev@lists.ozlabs.org
Date: Thu, 16 Apr 2020 14:59:36 -0500
In-Reply-To: <20200416153537.23736-5-wenhu.wang@vivo.com>
References: <20200416153537.23736-1-wenhu.wang@vivo.com>
 <20200416153537.23736-5-wenhu.wang@vivo.com>
Organization: Red Hat
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2601:449:8480:af0:12bf:48ff:fe84:c9a0
X-SA-Exim-Rcpt-To: wenhu.wang@vivo.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, christophe.leroy@c-s.fr,
 linuxppc-dev@lists.ozlabs.org, kernel@vivo.com, mpe@ellerman.id.au
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
Cc: kernel@vivo.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2020-04-16 at 08:35 -0700, Wang Wenhu wrote:
> +#define UIO_INFO_VER	"devicetree,pseudo"

What does this mean?  Changing a number into a non-obvious string (Why
"pseudo"?  Why does the UIO user care that the config came from the device
tree?) just to avoid setting off Greg's version number autoresponse isn't
really helping anything.

> +static const struct of_device_id uio_mpc85xx_l2ctlr_of_match[] = {
> +	{	.compatible = "uio,mpc85xx-cache-sram",	},
> +	{},
> +};
> +
> +static struct platform_driver uio_fsl_85xx_cache_sram = {
> +	.probe = uio_fsl_85xx_cache_sram_probe,
> +	.remove = uio_fsl_85xx_cache_sram_remove,
> +	.driver = {
> +		.name = DRIVER_NAME,
> +		.owner = THIS_MODULE,
> +		.of_match_table	= uio_mpc85xx_l2ctlr_of_match,
> +	},
> +};

Greg's comment notwithstanding, I really don't think this belongs in the
device tree (and if I do get overruled on that point, it at least needs a
binding document).  Let me try to come up with a patch for dynamic allocation.

-Scott


