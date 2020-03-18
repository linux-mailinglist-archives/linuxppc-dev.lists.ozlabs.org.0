Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1FE18A711
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 22:31:20 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48jNWp1cq7zDr4D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 08:31:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=J4R5BuBT; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48jNNv1chFzDqxj
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Mar 2020 08:25:18 +1100 (AEDT)
Received: from localhost (mobile-166-175-186-165.mycingular.net
 [166.175.186.165])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A267920772;
 Wed, 18 Mar 2020 21:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584566716;
 bh=PPihHaGg1zzpn1nHu5VlZHYT+H8Lm/yb44OJhzptGDI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=J4R5BuBT7s0ufQ6OkQFm2DJaGU3GVO9cGs2MX4LtzTi7i9JWE5dM20xu5JQTXlZ83
 PEvcq3DTg4VilmyOANCyGwCHYadT4otbhpLYSpa8TZJkQXYvR3a8J+LlUM3ulELzZx
 jLKhC0M9bULug4AxIw26CRfmCEZy/H4Ad8J0WRnI=
Date: Wed, 18 Mar 2020 16:25:13 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch V2 01/15] PCI/switchtec: Fix init_completion race
 condition with poll_wait()
Message-ID: <20200318212513.GA240916@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200318204407.497942274@linutronix.de>
User-Agent: Mutt/1.12.2 (2019-09-21)
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
Cc: Randy Dunlap <rdunlap@infradead.org>, Peter Zijlstra <peterz@infradead.org>,
 linux-pci@vger.kernel.org, Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Oleg Nesterov <oleg@redhat.com>, Joel Fernandes <joel@joelfernandes.org>,
 Will Deacon <will@kernel.org>, Ingo Molnar <mingo@kernel.org>,
 Davidlohr Bueso <dave@stgolabs.net>, Arnd Bergmann <arnd@arndb.de>,
 Logan Gunthorpe <logang@deltatee.com>,
 "Paul E . McKenney" <paulmck@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 Steven Rostedt <rostedt@goodmis.org>,
 Kurt Schwemmer <kurt.schwemmer@microsemi.com>,
 Kalle Valo <kvalo@codeaurora.org>, Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 netdev@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 18, 2020 at 09:43:03PM +0100, Thomas Gleixner wrote:
> From: Logan Gunthorpe <logang@deltatee.com>
> 
> The call to init_completion() in mrpc_queue_cmd() can theoretically
> race with the call to poll_wait() in switchtec_dev_poll().
> 
>   poll()			write()
>     switchtec_dev_poll()   	  switchtec_dev_write()
>       poll_wait(&s->comp.wait);      mrpc_queue_cmd()
> 			               init_completion(&s->comp)
> 				         init_waitqueue_head(&s->comp.wait)
> 
> To my knowledge, no one has hit this bug.
> 
> Fix this by using reinit_completion() instead of init_completion() in
> mrpc_queue_cmd().
> 
> Fixes: 080b47def5e5 ("MicroSemi Switchtec management interface driver")
> Reported-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Link: https://lkml.kernel.org/r/20200313183608.2646-1-logang@deltatee.com

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

Not because I understand and have reviewed this, but because I trust
you to do the right thing and it belongs with the rest of the series.

> ---
>  drivers/pci/switch/switchtec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/switch/switchtec.c b/drivers/pci/switch/switchtec.c
> index a823b4b8ef8a..81dc7ac01381 100644
> --- a/drivers/pci/switch/switchtec.c
> +++ b/drivers/pci/switch/switchtec.c
> @@ -175,7 +175,7 @@ static int mrpc_queue_cmd(struct switchtec_user *stuser)
>  	kref_get(&stuser->kref);
>  	stuser->read_len = sizeof(stuser->data);
>  	stuser_set_state(stuser, MRPC_QUEUED);
> -	init_completion(&stuser->comp);
> +	reinit_completion(&stuser->comp);
>  	list_add_tail(&stuser->list, &stdev->mrpc_queue);
>  
>  	mrpc_cmd_submit(stdev);
> -- 
> 2.20.1
> 
> 
