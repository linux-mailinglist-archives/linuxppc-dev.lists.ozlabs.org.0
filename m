Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D9269788F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 09:59:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGsSk50fzz3ch6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 19:59:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=vncmQqU5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=vncmQqU5;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGsRm3Fp6z3bgl
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Feb 2023 19:58:11 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0949261A2D;
	Wed, 15 Feb 2023 08:58:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EB9AC433EF;
	Wed, 15 Feb 2023 08:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1676451487;
	bh=jrGJzrG2skBYV2raSxtxHsTglP/uwpkm81LKlzw08iE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vncmQqU5+gf6a7yLciWkWD9jId4mQ0WeOqn2o9FVzMyGrEaigXYpoUNk1bo2fq2ue
	 m1Dzg31J9YFSWAKTzaYrmzOtGca6QieNy0EgvRgPVKQhWYgI6S9xjGfa9dV18oVg/b
	 HWBaom0tVl/c40f2SCHcOm2OYUcAE39bkuBBxlyQ=
Date: Wed, 15 Feb 2023 09:58:04 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Zhou nan <zhounan@nfschina.com>
Subject: Re: [PATCH] usb: fix some spelling mistakes in comment
Message-ID: <Y+yenCvi7vTCkb84@kroah.com>
References: <20230215084324.7065-1-zhounan@nfschina.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230215084324.7065-1-zhounan@nfschina.com>
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
Cc: linux-usb@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, leoyang.li@nxp.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Feb 15, 2023 at 12:43:24AM -0800, Zhou nan wrote:
> Fix typos in comment.
> 
> Signed-off-by: Zhou nan <zhounan@nfschina.com>
> ---
>  drivers/usb/gadget/udc/fsl_udc_core.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/gadget/udc/fsl_udc_core.c b/drivers/usb/gadget/udc/fsl_udc_core.c
> index a67873a074b7..da876d09fc01 100644
> --- a/drivers/usb/gadget/udc/fsl_udc_core.c
> +++ b/drivers/usb/gadget/udc/fsl_udc_core.c
> @@ -471,7 +471,7 @@ static int dr_ep_get_stall(unsigned char ep_num, unsigned char dir)
>  ********************************************************************/
>  
>  /*------------------------------------------------------------------
> -* struct_ep_qh_setup(): set the Endpoint Capabilites field of QH
> +* struct_ep_qh_setup(): set the Endpoint Capabilities field of QH
>   * @zlt: Zero Length Termination Select (1: disable; 0: enable)
>   * @mult: Mult field
>   ------------------------------------------------------------------*/
> @@ -483,7 +483,7 @@ static void struct_ep_qh_setup(struct fsl_udc *udc, unsigned char ep_num,
>  	struct ep_queue_head *p_QH = &udc->ep_qh[2 * ep_num + dir];
>  	unsigned int tmp = 0;
>  
> -	/* set the Endpoint Capabilites in QH */
> +	/* set the Endpoint Capabilities in QH */
>  	switch (ep_type) {
>  	case USB_ENDPOINT_XFER_CONTROL:
>  		/* Interrupt On Setup (IOS). for control ep  */
> @@ -593,7 +593,7 @@ static int fsl_ep_enable(struct usb_ep *_ep,
>  	ep->stopped = 0;
>  
>  	/* Controller related setup */
> -	/* Init EPx Queue Head (Ep Capabilites field in QH
> +	/* Init EPx Queue Head (Ep Capabilities field in QH
>  	 * according to max, zlt, mult) */
>  	struct_ep_qh_setup(udc, (unsigned char) ep_index(ep),
>  			(unsigned char) ((desc->bEndpointAddress & USB_DIR_IN)
> @@ -1361,7 +1361,7 @@ static void ch9getstatus(struct fsl_udc *udc, u8 request_type, u16 value,
>  	udc->ep0_dir = USB_DIR_IN;
>  	/* Borrow the per device status_req */
>  	req = udc->status_req;
> -	/* Fill in the reqest structure */
> +	/* Fill in the request structure */
>  	*((u16 *) req->req.buf) = cpu_to_le16(tmp);
>  
>  	req->ep = ep;
> -- 
> 2.27.0
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- Your patch did many different things all at once, making it difficult
  to review.  All Linux kernel patches need to only do one thing at a
  time.  If you need to do multiple things (such as clean up all coding
  style issues in a file/driver), do it in a sequence of patches, each
  one doing only one thing.  This will make it easier to review the
  patches to ensure that they are correct, and to help alleviate any
  merge issues that larger patches can cause.

- You did not specify a description of why the patch is needed, or
  possibly, any description at all, in the email body.  Please read the
  section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what is needed in
  order to properly describe the change.

- You did not write a descriptive Subject: for the patch, allowing Greg,
  and everyone else, to know what this patch is all about.  Please read
  the section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what a proper
  Subject: line should look like.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
