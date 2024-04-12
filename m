Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 133BF8A2573
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Apr 2024 07:11:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=ILoP8DVH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VG4Rc60ZJz3dlY
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Apr 2024 15:11:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=ILoP8DVH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VG4Qr5Yqzz3dVq
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Apr 2024 15:10:59 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id AF0EACE2396;
	Fri, 12 Apr 2024 05:10:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BE21C2BBFC;
	Fri, 12 Apr 2024 05:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1712898654;
	bh=n1nTu7+xRC3qxpPaBRrMAeZo5K6PsyIpi+vTtIf4SBo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ILoP8DVHM+rOWyAyCSwYjPNpJ2HCEgAYwuctUOVN0QqrGrfMCQuqgxgmb1tLe02Pr
	 +Y/QcLsY2TXSsIu2rVfZl7evevaPh4DSpFXzcikhfjw2eJ/wNFc7W7w8VGwU5jItfk
	 paI4rGE3T87LBEJtbbsMMvviLgHp1bMal/Ec5NI0=
Date: Fri, 12 Apr 2024 07:10:51 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: li.hao40@zte.com.cn
Subject: Re: [PATCH] tty: hvc: wakeup hvc console immediately when needed
Message-ID: <2024041237-shifty-unethical-4a5d@gregkh>
References: <20240412113848167egmP7kBg1Qm5sxfwGALG-@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240412113848167egmP7kBg1Qm5sxfwGALG-@zte.com.cn>
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
Cc: linuxppc-dev@lists.ozlabs.org, jirislaby@kernel.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 12, 2024 at 11:38:48AM +0800, li.hao40@zte.com.cn wrote:
> From: Li Hao <li.hao40@zte.com.cn>
> 
> Cancel the do_wakeup flag in hvc_struct, and change it to immediately
> wake up tty when hp->n_outbuf is 0 in hvc_push().
> 
> When we receive a key input character, the interrupt handling function
> hvc_handle_interrupt() will be executed, and the echo thread
> flush_to_ldisc() will be added to the queue.
> 
> If the user is currently using tcsetattr(), a hang may occur. tcsetattr()
> enters kernel and waits for hp->n_outbuf to become 0 via
> tty_wait_until_sent(). If the echo thread finishes executing before
> reaching tty_wait_until_sent (for example, put_chars() takes too long),
> it will cause while meeting the wakeup condition (hp->do_wakeup = 1),
> tty_wait_until_sent() cannot be woken up (missed the tty_wakeup() of
> this round's tty_poll). Unless the next key input character comes,
> hvc_poll will be executed, and tty_wakeup() will be performed through
> the do_wakeup flag.
> 
> Signed-off-by: Li Hao <li.hao40@zte.com.cn>
> ---
>  drivers/tty/hvc/hvc_console.c | 12 +++++-------
>  drivers/tty/hvc/hvc_console.h |  1 -
>  2 files changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/tty/hvc/hvc_console.c b/drivers/tty/hvc/hvc_console.c
> index cd1f657f7..2fa90d938 100644
> --- a/drivers/tty/hvc/hvc_console.c
> +++ b/drivers/tty/hvc/hvc_console.c
> @@ -476,11 +476,13 @@ static void hvc_hangup(struct tty_struct *tty)
>  static int hvc_push(struct hvc_struct *hp)
>  {
>  	int n;
> +	struct tty_struct *tty;
> 
>  	n = hp->ops->put_chars(hp->vtermno, hp->outbuf, hp->n_outbuf);
> +	tty = tty_port_tty_get(&hp->port);
>  	if (n <= 0) {
>  		if (n == 0 || n == -EAGAIN) {
> -			hp->do_wakeup = 1;
> +			tty_wakeup(tty);
>  			return 0;
>  		}
>  		/* throw away output on error; this happens when
> @@ -491,7 +493,7 @@ static int hvc_push(struct hvc_struct *hp)
>  	if (hp->n_outbuf > 0)
>  		memmove(hp->outbuf, hp->outbuf + n, hp->n_outbuf);
>  	else
> -		hp->do_wakeup = 1;
> +		tty_wakeup(tty);
> 
>  	return n;
>  }
> @@ -739,11 +741,7 @@ static int __hvc_poll(struct hvc_struct *hp, bool may_sleep)
>  	poll_mask |= HVC_POLL_READ;
> 
>   out:
> -	/* Wakeup write queue if necessary */
> -	if (hp->do_wakeup) {
> -		hp->do_wakeup = 0;
> -		tty_wakeup(tty);
> -	}
> +	/* Wakeup in hvc_push */
>   bail:
>  	spin_unlock_irqrestore(&hp->lock, flags);
> 
> diff --git a/drivers/tty/hvc/hvc_console.h b/drivers/tty/hvc/hvc_console.h
> index cf4c1af08..6622f71ba 100644
> --- a/drivers/tty/hvc/hvc_console.h
> +++ b/drivers/tty/hvc/hvc_console.h
> @@ -36,7 +36,6 @@ struct hvc_struct {
>  	struct tty_port port;
>  	spinlock_t lock;
>  	int index;
> -	int do_wakeup;
>  	int outbuf_size;
>  	int n_outbuf;
>  	uint32_t vtermno;
> -- 
> 2.25.1

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

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
