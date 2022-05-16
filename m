Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EF777529310
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 May 2022 23:42:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L2CR06H9mz3dQK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 May 2022 07:42:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=g7zXCdiW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=suse.com (client-ip=195.135.220.29; helo=smtp-out2.suse.de;
 envelope-from=pmladek@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256
 header.s=susede1 header.b=g7zXCdiW; dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L21vs6v1Jz3bw6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 May 2022 00:33:44 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id C33171F9F3;
 Mon, 16 May 2022 14:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1652711621; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fVjlG4/dfH2RJ8QOIc+qrGCmgCcjOpZB+KPjtLQbhUo=;
 b=g7zXCdiW66+ZORh6/+b42qlwXs71YIm78eBo2DkB+6yci0VblhfjN32vYqq5tvyFP+a35V
 4IQbZk+eZ8m4N7dIzfRZvRcjGflhdk2pzgpwxTPHHTNBIE+W9GZV3Zj3ggNIRkQibkb0ZX
 yDFspItfCnZ03JfIlqNkkDR8LZU/GbA=
Received: from suse.cz (unknown [10.100.201.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 5E6F32C141;
 Mon, 16 May 2022 14:33:41 +0000 (UTC)
Date: Mon, 16 May 2022 16:33:41 +0200
From: Petr Mladek <pmladek@suse.com>
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: Re: [PATCH 21/30] panic: Introduce the panic pre-reboot notifier list
Message-ID: <YoJgcC8c6LaKADZV@alley>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-22-gpiccoli@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220427224924.592546-22-gpiccoli@igalia.com>
X-Mailman-Approved-At: Tue, 17 May 2022 07:40:39 +1000
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
Cc: Paul Mackerras <paulus@samba.org>, Pavel Machek <pavel@ucw.cz>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 stern@rowland.harvard.edu, xen-devel@lists.xenproject.org,
 Matt Turner <mattst88@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, linux-pm@vger.kernel.org,
 linux-um@lists.infradead.org, luto@kernel.org, tglx@linutronix.de,
 Alex Elder <elder@kernel.org>, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, senozhatsky@chromium.org,
 d.hatayama@jp.fujitsu.com, Bjorn Andersson <bjorn.andersson@linaro.org>,
 mhiramat@kernel.org, akpm@linux-foundation.org, linux-hyperv@vger.kernel.org,
 dave.hansen@linux.intel.com,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, linux-s390@vger.kernel.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, Corey Minyard <minyard@acm.org>,
 Helge Deller <deller@gmx.de>, vgoyal@redhat.com,
 Sven Schnelle <svens@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-xtensa@linux-xtensa.org, john.ogness@linutronix.de,
 coresight@lists.linaro.org, hidehiro.kawai.ez@hitachi.com,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>,
 Tony Luck <tony.luck@intel.com>, Mathieu Poirier <mathieu.poirier@linaro.org>,
 James Morse <james.morse@arm.com>, kernel-dev@igalia.com,
 fabiomirmar@gmail.com, halves@canonical.com, alejandro.j.jimenez@oracle.com,
 feng.tang@intel.com, will@kernel.org, bhe@redhat.com, corbet@lwn.net,
 Dexuan Cui <decui@microsoft.com>, bcm-kernel-feedback-list@broadcom.com,
 Robert Richter <rric@kernel.org>, keescook@chromium.org, arnd@arndb.de,
 Haiyang Zhang <haiyangz@microsoft.com>, rostedt@goodmis.org,
 rcu@vger.kernel.org, bp@alien8.de, openipmi-developer@lists.sourceforge.net,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-parisc@vger.kernel.org,
 linux-alpha@vger.kernel.org, peterz@infradead.org,
 linux-remoteproc@vger.kernel.org, mikelley@microsoft.com,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 linux-leds@vger.kernel.org, Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Richard Weinberger <richard@nod.at>, x86@kernel.org, mingo@redhat.com,
 dyoung@redhat.com, paulmck@kernel.org, Heiko Carstens <hca@linux.ibm.com>,
 linux-tegra@vger.kernel.org, andriy.shevchenko@linux.intel.com,
 Johannes Berg <johannes@sipsolutions.net>, linux-edac@vger.kernel.org,
 jgross@suse.com, netdev@vger.kernel.org, kernel@gpiccoli.net,
 kexec@lists.infradead.org, linux-mips@vger.kernel.org,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, vkuznets@redhat.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed 2022-04-27 19:49:15, Guilherme G. Piccoli wrote:
> This patch renames the panic_notifier_list to panic_pre_reboot_list;
> the idea is that a subsequent patch will refactor the panic path
> in order to better split the notifiers, running some of them very
> early, some of them not so early [but still before kmsg_dump()] and
> finally, the rest should execute late, after kdump. The latter ones
> are now in the panic pre-reboot list - the name comes from the idea
> that these notifiers execute before panic() attempts rebooting the
> machine (if that option is set).
> 
> We also took the opportunity to clean-up useless header inclusions,
> improve some notifier block declarations (e.g. in ibmasm/heartbeat.c)
> and more important, change some priorities - we hereby set 2 notifiers
> to run late in the list [iss_panic_event() and the IPMI panic_event()]
> due to the risks they offer (may not return, for example).
> Proper documentation is going to be provided in a subsequent patch,
> that effectively refactors the panic path.
> 
> --- a/drivers/edac/altera_edac.c
> +++ b/drivers/edac/altera_edac.c
> @@ -2163,7 +2162,7 @@ static int altr_edac_a10_probe(struct platform_device *pdev)
>  		int dberror, err_addr;
>  
>  		edac->panic_notifier.notifier_call = s10_edac_dberr_handler;
> -		atomic_notifier_chain_register(&panic_notifier_list,
> +		atomic_notifier_chain_register(&panic_pre_reboot_list,

My understanding is that this notifier first prints info about ECC
errors and then triggers reboot. It might make sense to split it
into two notifiers.


>  					       &edac->panic_notifier);
>  
>  		/* Printout a message if uncorrectable error previously. */
> --- a/drivers/leds/trigger/ledtrig-panic.c
> +++ b/drivers/leds/trigger/ledtrig-panic.c
> @@ -64,7 +63,7 @@ static long led_panic_blink(int state)
>  
>  static int __init ledtrig_panic_init(void)
>  {
> -	atomic_notifier_chain_register(&panic_notifier_list,
> +	atomic_notifier_chain_register(&panic_pre_reboot_list,
>  				       &led_trigger_panic_nb);

Blinking => should go to the last "post_reboot/loop" list.


>  
>  	led_trigger_register_simple("panic", &trigger);
> --- a/drivers/misc/ibmasm/heartbeat.c
> +++ b/drivers/misc/ibmasm/heartbeat.c
> @@ -32,20 +31,23 @@ static int suspend_heartbeats = 0;
>  static int panic_happened(struct notifier_block *n, unsigned long val, void *v)
>  {
>  	suspend_heartbeats = 1;
> -	return 0;
> +	return NOTIFY_DONE;
>  }
>  
> -static struct notifier_block panic_notifier = { panic_happened, NULL, 1 };
> +static struct notifier_block panic_notifier = {
> +	.notifier_call = panic_happened,
> +};
>  
>  void ibmasm_register_panic_notifier(void)
>  {
> -	atomic_notifier_chain_register(&panic_notifier_list, &panic_notifier);
> +	atomic_notifier_chain_register(&panic_pre_reboot_list,
> +					&panic_notifier);

Same here. Blinking => should go to the last "post_reboot/loop" list.


>  }
>  
>  void ibmasm_unregister_panic_notifier(void)
>  {
> -	atomic_notifier_chain_unregister(&panic_notifier_list,
> -			&panic_notifier);
> +	atomic_notifier_chain_unregister(&panic_pre_reboot_list,
> +					&panic_notifier);
>  }


The rest of the moved notifiers seem to fit well this "pre_reboot"
list.

Best Regards,
Petr
