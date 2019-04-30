Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D10FA54
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 15:29:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44tj6X20xFzDqHn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 23:29:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44tj2L1Bv4zDq9Z
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 23:25:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="00XvEI9H"; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 44tj2K5cgjz8xXr
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 23:25:29 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 44tj2K3rBcz9sCF; Tue, 30 Apr 2019 23:25:29 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linuxfoundation.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="00XvEI9H"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 44tj2J0r7Cz9sBr
 for <linuxppc-dev@ozlabs.org>; Tue, 30 Apr 2019 23:25:28 +1000 (AEST)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6086921707;
 Tue, 30 Apr 2019 13:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556630725;
 bh=HVMmC5sVHgkcsl22a0sJavWbalQlXmGpxIF+hfE4eLk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=00XvEI9HOx/1hfpaSHD4CY9l1ivd757ZHhFjqGDEKFUM/9IScpI49ZHrpJxSXSPXP
 XVnyDMUcmcaEPrRNZQ/t2zxHla2//rB1fv/y2JpB5sa+WvWw5XVPO6njS39kRE64sd
 GDp/3ykYDA7SS70O0huqpMYZ9bMExir6lnbjYtCU=
Date: Tue, 30 Apr 2019 15:25:23 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Diana Craciun <diana.craciun@nxp.com>
Subject: Re: [PATCH v2 stable v4.4 2/2] Documentation: Add nospectre_v1
 parameter
Message-ID: <20190430132523.GB5327@kroah.com>
References: <1556628147-15687-1-git-send-email-diana.craciun@nxp.com>
 <1556628147-15687-2-git-send-email-diana.craciun@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1556628147-15687-2-git-send-email-diana.craciun@nxp.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
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
Cc: linuxppc-dev@ozlabs.org, stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 30, 2019 at 03:42:27PM +0300, Diana Craciun wrote:
> commit 26cb1f36c43ee6e89d2a9f48a5a7500d5248f836 upstream.
> 
> Currently only supported on powerpc.
> 
> Signed-off-by: Diana Craciun <diana.craciun@nxp.com>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>  Documentation/kernel-parameters.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/kernel-parameters.txt b/Documentation/kernel-parameters.txt
> index f0bdf78420a0..3ff87d5d6fea 100644
> --- a/Documentation/kernel-parameters.txt
> +++ b/Documentation/kernel-parameters.txt
> @@ -2449,6 +2449,10 @@ bytes respectively. Such letter suffixes can also be entirely omitted.
>  			legacy floating-point registers on task switch.
>  
>  	nohugeiomap	[KNL,x86] Disable kernel huge I/O mappings.
> +	
> +	nospectre_v1	[PPC] Disable mitigations for Spectre Variant 1 (bounds
> +			check bypass). With this option data leaks are possible
> +			in the system.
>  
>  	nospectre_v2	[X86,PPC_FSL_BOOK3E] Disable all mitigations for the Spectre variant 2
>  			(indirect branch prediction) vulnerability. System may
> -- 
> 2.17.1
>

Both of these patches needed to be added to a bunch of the stable trees,
so I've now done that.

thanks,

greg k-h
