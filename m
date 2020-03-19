Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3764418AE7F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 09:42:33 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48jgQG5tY4zDrCD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 19:42:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=XAF/A62c; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48jgNX2bzQzDr3T
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Mar 2020 19:40:58 +1100 (AEDT)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3A53D20724;
 Thu, 19 Mar 2020 08:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584607255;
 bh=dHtJENXjO0z7ELO16+oHxTUd6KSiGYOo+FAU1g3r1L8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XAF/A62c4v2KZMa+b7MNCvt5Okc6ArSh27nZ6WmkbKaRhYOcWXD+8cWrAPcz+Oxd5
 GcEJnnmipmcEEfVQKgD3elLE172vOeV5zt61gPiItbhWXmp1y4AT19XvauDwP8kAkL
 YnG/UNS29vEd98MwDnk+VTNPMtTHoyQsUCF7HqAk=
Date: Thu, 19 Mar 2020 09:40:53 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch V2 04/15] orinoco_usb: Use the regular completion
 interfaces
Message-ID: <20200319084053.GA3492783@kroah.com>
References: <20200318204302.693307984@linutronix.de>
 <20200318204407.793899611@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200318204407.793899611@linutronix.de>
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
 "Paul E . McKenney" <paulmck@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 Steven Rostedt <rostedt@goodmis.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Kurt Schwemmer <kurt.schwemmer@microsemi.com>,
 Kalle Valo <kvalo@codeaurora.org>, Felipe Balbi <balbi@kernel.org>,
 Logan Gunthorpe <logang@deltatee.com>, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 netdev@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 18, 2020 at 09:43:06PM +0100, Thomas Gleixner wrote:
> From: Thomas Gleixner <tglx@linutronix.de>
> 
> The completion usage in this driver is interesting:
> 
>   - it uses a magic complete function which according to the comment was
>     implemented by invoking complete() four times in a row because
>     complete_all() was not exported at that time.
> 
>   - it uses an open coded wait/poll which checks completion:done. Only one wait
>     side (device removal) uses the regular wait_for_completion() interface.
> 
> The rationale behind this is to prevent that wait_for_completion() consumes
> completion::done which would prevent that all waiters are woken. This is not
> necessary with complete_all() as that sets completion::done to UINT_MAX which
> is left unmodified by the woken waiters.
> 
> Replace the magic complete function with complete_all() and convert the
> open coded wait/poll to regular completion interfaces.
> 
> This changes the wait to exclusive wait mode. But that does not make any
> difference because the wakers use complete_all() which ignores the
> exclusive mode.
> 
> Reported-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Kalle Valo <kvalo@codeaurora.org>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: linux-wireless@vger.kernel.org
> Cc: netdev@vger.kernel.org
> ---
> V2: New patch to avoid conversion to swait functions later.
> ---
>  drivers/net/wireless/intersil/orinoco/orinoco_usb.c |   21 ++++----------------
>  1 file changed, 5 insertions(+), 16 deletions(-)
> 
> --- a/drivers/net/wireless/intersil/orinoco/orinoco_usb.c
> +++ b/drivers/net/wireless/intersil/orinoco/orinoco_usb.c
> @@ -365,17 +365,6 @@ static struct request_context *ezusb_all
>  	return ctx;
>  }
>  
> -
> -/* Hopefully the real complete_all will soon be exported, in the mean
> - * while this should work. */
> -static inline void ezusb_complete_all(struct completion *comp)
> -{
> -	complete(comp);
> -	complete(comp);
> -	complete(comp);
> -	complete(comp);
> -}

That's so funny... :(

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
