Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EE066174A08
	for <lists+linuxppc-dev@lfdr.de>; Sun,  1 Mar 2020 00:19:10 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48VMmW01wSzDrHy
	for <lists+linuxppc-dev@lfdr.de>; Sun,  1 Mar 2020 10:19:07 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48VMl21vySzDqB2
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  1 Mar 2020 10:17:49 +1100 (AEDT)
Received: from [2601:449:8480:af0:12bf:48ff:fe84:c9a0]
 by baldur.buserror.net with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <oss@buserror.net>)
 id 1j8BMa-0002MK-90; Sat, 29 Feb 2020 17:17:40 -0600
Message-ID: <4b8581f5fd497b3fb1e5232510cd57c1e7ccb92d.camel@buserror.net>
From: Scott Wood <oss@buserror.net>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
 galak@kernel.crashing.org, benh@kernel.crashing.org, paulus@samba.org, 
 mpe@ellerman.id.au
Date: Sat, 29 Feb 2020 17:17:39 -0600
In-Reply-To: <20200208140920.7652-1-christophe.jaillet@wanadoo.fr>
References: <20200208140920.7652-1-christophe.jaillet@wanadoo.fr>
Organization: Red Hat
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2601:449:8480:af0:12bf:48ff:fe84:c9a0
X-SA-Exim-Rcpt-To: christophe.jaillet@wanadoo.fr, galak@kernel.crashing.org,
 benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
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
Subject: Re: [PATCH 2/2] powerpc/83xx: Add some error handling in
 'quirk_mpc8360e_qe_enet10()'
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
Cc: kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 2020-02-08 at 15:09 +0100, Christophe JAILLET wrote:
> In some error handling path, we should call "of_node_put(np_par)" or
> some resource may be leaking in case of error.
> 
> Fixes: 8159df72d43e ("83xx: add support for the kmeter1 board.")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  arch/powerpc/platforms/83xx/km83xx.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

Both patches:
Acked-by: Scott Wood <oss@buserror.net>


> diff --git a/arch/powerpc/platforms/83xx/km83xx.c
> b/arch/powerpc/platforms/83xx/km83xx.c
> index 306be75faec7..bcdc2c203ec9 100644
> --- a/arch/powerpc/platforms/83xx/km83xx.c
> +++ b/arch/powerpc/platforms/83xx/km83xx.c
> @@ -60,10 +60,12 @@ static void quirk_mpc8360e_qe_enet10(void)
>  	ret = of_address_to_resource(np_par, 0, &res);
>  	if (ret) {
>  		pr_warn("%s couldn't map par_io registers\n", __func__);
> -		return;
> +		goto out;
>  	}
>  
>  	base = ioremap(res.start, resource_size(&res));
> +	if (!base)
> +		goto out;
>  
>  	/*
>  	 * set output delay adjustments to default values according
> @@ -111,6 +113,7 @@ static void quirk_mpc8360e_qe_enet10(void)
>  		setbits32((base + 0xac), 0x0000c000);
>  	}
>  	iounmap(base);
> +out:
>  	of_node_put(np_par);
>  }
>  

