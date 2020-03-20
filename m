Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 709AF18CBFB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 11:52:06 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48kLFH5Bg4zF0tD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 21:52:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2607:7c80:54:e::133; helo=bombadil.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48kL4s5qv5zDsTQ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 21:44:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=gpF47OFbSCOaH9j5hP1QeTQDztS/I2yzYL1A8Yg/DCI=; b=m8gRkUViv+3RtA+3AN1Hq8RB2p
 /nd8koJA7/ftGKlqVgXGyTS1/R5zs5CBqOx+xx+6K9nCiYjvgKGyw0YC0ClboDv10bRHr9uFVti5l
 EKvrd8vTTtGuSCXjYHyBDIj5z1uJ87Gimm+Jq3l7cxSmAzKhoX5U0dufJsqNv3jrKQNIBSslh2ZBx
 d6J4/8w72QCJsw2WMsEdzs02t4aMmq5QQ4FsVoSmBkcn0g/+PBYsMy74VM0WnvU6eDHMxJ7NO6YW7
 oGhprUfFSJmuJzo+np93Zq4slkqAXWnt+jp4L4s7owS9q9n3ZLlPNQHf+KIrDpK7Ir2rNYPzd9bem
 57qKm1WQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jFF8f-0006yB-F2; Fri, 20 Mar 2020 10:44:29 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 627F2300606;
 Fri, 20 Mar 2020 11:44:26 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 48697285E2762; Fri, 20 Mar 2020 11:44:26 +0100 (CET)
Date: Fri, 20 Mar 2020 11:44:26 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Davidlohr Bueso <dave@stgolabs.net>
Subject: Re: [PATCH 17/15] rcuwait: Inform rcuwait_wake_up() users if a
 wakeup was attempted
Message-ID: <20200320104426.GD20696@hirez.programming.kicks-ass.net>
References: <20200318204302.693307984@linutronix.de>
 <20200320085527.23861-1-dave@stgolabs.net>
 <20200320085527.23861-2-dave@stgolabs.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200320085527.23861-2-dave@stgolabs.net>
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
Cc: rdunlap@infradead.org, linux-pci@vger.kernel.org, bigeasy@linutronix.de,
 linux-kernel@vger.kernel.org, joel@joelfernandes.org, will@kernel.org,
 mingo@kernel.org, arnd@arndb.de, Davidlohr Bueso <dbueso@suse.de>,
 torvalds@linux-foundation.org, paulmck@kernel.org,
 linuxppc-dev@lists.ozlabs.org, rostedt@goodmis.org, bhelgaas@google.com,
 kurt.schwemmer@microsemi.com, kvalo@codeaurora.org, balbi@kernel.org,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, oleg@redhat.com, tglx@linutronix.de,
 netdev@vger.kernel.org, logang@deltatee.com, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 20, 2020 at 01:55:25AM -0700, Davidlohr Bueso wrote:

> diff --git a/kernel/exit.c b/kernel/exit.c
> index 6cc6cc485d07..b0bb0a8ec4b1 100644
> --- a/kernel/exit.c
> +++ b/kernel/exit.c
> @@ -234,9 +234,10 @@ void release_task(struct task_struct *p)
>  		goto repeat;
>  }
>  
> -void rcuwait_wake_up(struct rcuwait *w)
> +bool rcuwait_wake_up(struct rcuwait *w)
>  {
>  	struct task_struct *task;
> +	bool ret = false;
>  
>  	rcu_read_lock();
>  
> @@ -254,10 +255,15 @@ void rcuwait_wake_up(struct rcuwait *w)
>  	smp_mb(); /* (B) */
>  
>  	task = rcu_dereference(w->task);
> -	if (task)
> +	if (task) {
>  		wake_up_process(task);
> +	        ret = true;

		ret = wake_up_process(task); ?

> +	}
>  	rcu_read_unlock();
> +
> +	return ret;
>  }
> +EXPORT_SYMBOL_GPL(rcuwait_wake_up);
