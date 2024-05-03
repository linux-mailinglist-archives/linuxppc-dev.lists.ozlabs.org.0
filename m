Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 493C78BAE4B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2024 15:59:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=eriCLFAj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VWC8Y6d9Yz3dLM
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2024 23:59:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=eriCLFAj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VWC7q5kNnz3clT
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 May 2024 23:58:30 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 92C1161D96;
	Fri,  3 May 2024 13:58:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46BC3C4AF1B;
	Fri,  3 May 2024 13:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1714744707;
	bh=WzFfg1kS46JwrrD3AsGCRdBrv1G5fLFP0RllVqgXFlM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eriCLFAjR4CU2Svcvv4rN6thMNhl7a2QivV4+KPGR50VeBL8O5vN9DJaExXnA4Sd+
	 PZD4Agdo8PPydio2BbPnFXaVCjVEd6Yjb3FkDObKRoUUpiswSFaQJTTh5u0FyabXiN
	 vLHwmdBwaS0nXuTC9rkaJGaFv6Esmh8Ajfqfu0r4=
Date: Fri, 3 May 2024 15:58:13 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Lu Dai <dai.lu@exordes.com>
Subject: Re: [PATCH V2] tty: hvc: hvc_opal: eliminate uses of of_node_put()
Message-ID: <2024050323-rhyme-upchuck-4c4c@gregkh>
References: <20240503135215.252635-1-dai.lu@exordes.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240503135215.252635-1-dai.lu@exordes.com>
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
Cc: shuah@kernel.org, jirislaby@kernel.org, javier.carrasco.cruz@gmail.com, linux-kernel@vger.kernel.org, julia.lawall@inria.fr, npiggin@gmail.com, linux-serial@vger.kernel.org, naveen.n.rao@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 03, 2024 at 04:52:15PM +0300, Lu Dai wrote:
> Make use of the __free() cleanup handler to automatically free nodes
> when they get out of scope.
> 
> Remove the need for a 'goto' as an effect.
> 
> Signed-off-by: Lu Dai <dai.lu@exordes.com>
> ---
> Changes since v1:
> Move the assignment of 'opal' to its declaration
> Seperate the declaration of 'np'
> 
>  drivers/tty/hvc/hvc_opal.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/tty/hvc/hvc_opal.c b/drivers/tty/hvc/hvc_opal.c
> index 095c33ad10f8..c17e8343ea60 100644
> --- a/drivers/tty/hvc/hvc_opal.c
> +++ b/drivers/tty/hvc/hvc_opal.c
> @@ -327,19 +327,18 @@ static void udbg_init_opal_common(void)
>  
>  void __init hvc_opal_init_early(void)
>  {
> -	struct device_node *stdout_node = of_node_get(of_stdout);
> +	struct device_node *stdout_node __free(device_node) = of_node_get(of_stdout);
>  	const __be32 *termno;
>  	const struct hv_ops *ops;
>  	u32 index;
>  
>  	/* If the console wasn't in /chosen, try /ibm,opal */
>  	if (!stdout_node) {
> -		struct device_node *opal, *np;
> -
>  		/* Current OPAL takeover doesn't provide the stdout
>  		 * path, so we hard wire it
>  		 */
> -		opal = of_find_node_by_path("/ibm,opal/consoles");
> +		struct device_node *opal __free(device_node) =
> +			of_find_node_by_path("/ibm,opal/consoles");
>  		if (opal) {

No blank line?

>  			pr_devel("hvc_opal: Found consoles in new location\n");
>  		} else {
> @@ -350,13 +349,13 @@ void __init hvc_opal_init_early(void)
>  		}
>  		if (!opal)
>  			return;
> +		struct device_node *np;
>  		for_each_child_of_node(opal, np) {

Ick, no, don't do that please.  Take some time and become more familiar
with kernel coding style and issues, perhaps work in drivers/staging/
first, before attempting to do stuff like this that is not correct.

thanks,

greg k-h
