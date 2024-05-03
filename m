Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5303E8BADBD
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2024 15:31:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=QvhTzU7m;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VWBXX6FJTz3clL
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2024 23:31:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=QvhTzU7m;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VWBWr4Qnkz3ck2
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 May 2024 23:30:48 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8E51BCE1844;
	Fri,  3 May 2024 13:30:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 240C3C2BBFC;
	Fri,  3 May 2024 13:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1714743042;
	bh=A7dzyePxuFRV9t0HZbbsE57jhBBAmttYWYl3rdnPMI0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QvhTzU7m/riWYaloVcIJAcV7kqeW6FBOCokBVjYbFqDfHlSfpX8XWqq/Qv8ywnD/n
	 0wyeYej37U/WtHfT0tXtrJ7rv2+6PJ73GqYWp4dJ/TNOa5jTmrxDMvWu2VdHAW7T1+
	 cSy6KJS8K+7W9i288JHBMXHbJDBMdZyC2qz1GiMY=
Date: Fri, 3 May 2024 15:30:36 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Lu Dai <dai.lu@exordes.com>
Subject: Re: [PATCH] tty: hvc: hvc_opal: eliminate uses of of_node_put()
Message-ID: <2024050313-lustrous-handcraft-0b84@gregkh>
References: <20240503114330.221764-1-dai.lu@exordes.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240503114330.221764-1-dai.lu@exordes.com>
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
Cc: shuah@kernel.org, jirislaby@kernel.org, javier.carrasco.cruz@gmail.com, linux-kernel@vger.kernel.org, npiggin@gmail.com, linux-serial@vger.kernel.org, naveen.n.rao@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 03, 2024 at 02:43:30PM +0300, Lu Dai wrote:
> Make use of the __free() cleanup handler to automatically free nodes
> when they get out of scope.
> 
> Removes the need for a 'goto' as an effect.
> 
> Signed-off-by: Lu Dai <dai.lu@exordes.com>
> ---
>  drivers/tty/hvc/hvc_opal.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/tty/hvc/hvc_opal.c b/drivers/tty/hvc/hvc_opal.c
> index 095c33ad10f8..67e90fa993a3 100644
> --- a/drivers/tty/hvc/hvc_opal.c
> +++ b/drivers/tty/hvc/hvc_opal.c
> @@ -327,14 +327,14 @@ static void udbg_init_opal_common(void)
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
> +		struct device_node *opal __free(device_node), *np;

*np needs to be on a separate line, right?

thanks,

greg k-h
