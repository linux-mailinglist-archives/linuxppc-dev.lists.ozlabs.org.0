Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA8D37F595
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 May 2021 12:26:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fgnr81t0Cz3082
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 May 2021 20:26:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=1I/jANeD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=1I/jANeD; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fgnqg6Yfcz2xtp
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 May 2021 20:25:50 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CA2A661104;
 Thu, 13 May 2021 10:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1620901547;
 bh=tGSbnJbV9mpjOtoS4fZRDhnpTdRQz/IXHDW4kTYpYAs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=1I/jANeD3wLrWb04k8nKmsR8WskdmDEfQnDlB/qG+eYesSbsCu01am3HAH+SUqveR
 7+y3F7VupADfNGsh3gkbc+FnaFq7W5XgtRmTEB2t2fychkG4zIpPchE/u1K4NCOF8I
 5m1vFoYGXFebcrvbSvQbM6suE/okEvakNcJNX74Q=
Date: Thu, 13 May 2021 12:25:44 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 8/8] xen/hvc: replace BUG_ON() with negative return value
Message-ID: <YJz+qK8snI64/TKh@kroah.com>
References: <20210513100302.22027-1-jgross@suse.com>
 <20210513100302.22027-9-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210513100302.22027-9-jgross@suse.com>
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
Cc: xen-devel@lists.xenproject.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 13, 2021 at 12:03:02PM +0200, Juergen Gross wrote:
> Xen frontends shouldn't BUG() in case of illegal data received from
> their backends. So replace the BUG_ON()s when reading illegal data from
> the ring page with negative return values.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  drivers/tty/hvc/hvc_xen.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/tty/hvc/hvc_xen.c b/drivers/tty/hvc/hvc_xen.c
> index 92c9a476defc..30d7ffb1e04c 100644
> --- a/drivers/tty/hvc/hvc_xen.c
> +++ b/drivers/tty/hvc/hvc_xen.c
> @@ -86,6 +86,11 @@ static int __write_console(struct xencons_info *xencons,
>  	cons = intf->out_cons;
>  	prod = intf->out_prod;
>  	mb();			/* update queue values before going on */
> +
> +	if (WARN_ONCE((prod - cons) > sizeof(intf->out),
> +		      "Illegal ring page indices"))
> +		return -EINVAL;

How nice, you just rebooted on panic-on-warn systems :(

> +
>  	BUG_ON((prod - cons) > sizeof(intf->out));

Why keep this line?

Please just fix this up properly, if userspace can trigger this, then
both the WARN_ON() and BUG_ON() are not correct and need to be correctly
handled.


>  
>  	while ((sent < len) && ((prod - cons) < sizeof(intf->out)))
> @@ -114,7 +119,10 @@ static int domU_write_console(uint32_t vtermno, const char *data, int len)
>  	 */
>  	while (len) {
>  		int sent = __write_console(cons, data, len);
> -		
> +
> +		if (sent < 0)
> +			return sent;
> +
>  		data += sent;
>  		len -= sent;
>  
> @@ -138,7 +146,10 @@ static int domU_read_console(uint32_t vtermno, char *buf, int len)
>  	cons = intf->in_cons;
>  	prod = intf->in_prod;
>  	mb();			/* get pointers before reading ring */
> -	BUG_ON((prod - cons) > sizeof(intf->in));
> +
> +	if (WARN_ONCE((prod - cons) > sizeof(intf->in),
> +		      "Illegal ring page indices"))
> +		return -EINVAL;

Same here, you still just paniced a machine :(

thanks,

greg k-h
