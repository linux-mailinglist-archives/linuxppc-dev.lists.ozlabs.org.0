Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E505788F0C4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 22:20:34 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TrzdWF1f;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4fhw4mdHz3wF0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 08:20:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TrzdWF1f;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::232; helo=mail-oi1-x232.google.com; envelope-from=tcminyard@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4ZCq0yTrz3dX6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Mar 2024 04:58:29 +1100 (AEDT)
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-3bbc649c275so86064b6e.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Mar 2024 10:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711562306; x=1712167106; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yWR/88ZuStiYrDMS5UWD0VLDt0J6Sqyii5LmdWwCGKc=;
        b=TrzdWF1ftFc1E+gedQp8T0oMfs5Nmuxa82+dH6/RGambfQ1pD0V4NVA2LGQfbKN2eB
         bhSPMnQ/g9XVrLkTg5eJ04Z62c6SlsWavoMvGEp27cVlLvozLeIoZn/sFSyInKbhUqjr
         9KTcBpTXkI2BTU9bY4Xhr0BAYJr5sOvSGr3mPAN1tQPlJIO/ZsLqU6RAOCBr8VSTWiDk
         LGXoCGRTdezqjU2juJXP6W/4pgXvKz27Gb1rgncI09Dy7n1T3bTetkzi4VXfn5MD79yJ
         7tvEA2FZXQZVHAPkGrZeNBTj/3+ABt4PwafpuSmDqzOVJIJsdM1691bQjIgz9422Jt0u
         ZBhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711562306; x=1712167106;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yWR/88ZuStiYrDMS5UWD0VLDt0J6Sqyii5LmdWwCGKc=;
        b=jMZ1obPQ2xtusXv9RrVXOWITcL2S0BCHJpS3KxsoFYoDYNgQ40qxIAzUKWBQttcl88
         DNR2qenS6Qq0S90mmjeEygF9LMS7NGpiHbbfFBzzFT2w/niyhhyJPnHtk4o2RzDzhEp2
         NriRevrFY+Z7SwJB4lp0O+sEYZV1DRayUJ7usmxvGdKkj4LzfZ626mzQNRmI+h6JwNGp
         jDNV7K0sb9QT+1onZhGWKFYmdMw9BAjeCOt9lpVyOeutaVIKlZzAmA7oP9WS7erGpARb
         y2FEnLPBSwWWpuiMX9XWpl+1NiR55yq0Q1QxmlIY76d61IxFNyz02gwlbUXn1UlkGcZD
         lUKg==
X-Forwarded-Encrypted: i=1; AJvYcCWb0QgSWOdg0Sj55ujIwwKDhSPn6gKvPKDBE5qKPvjTP0RYgPosbv27BSABtWgEzE+vxkFVT/54V6Z03Bn/0TmG3JdIT23UY3ycnupe0Q==
X-Gm-Message-State: AOJu0YxNPbXirgCvFWRc24suvJ9TZrRTW3UxrBnp5olBz/ywXbnocUuB
	8sxcx0GCELjnzt++acONrMV5Drx71do7TrLLCCphxkcU+mMMfNA=
X-Google-Smtp-Source: AGHT+IGIuqcpUfq3tRIl3Tp+ivSdarRw1h1Pz+NBzSyS6B+Wv1klEWD1UlLYSK6t5b6FwD/aGF7AqA==
X-Received: by 2002:a05:6808:16a8:b0:3c3:7e7a:8236 with SMTP id bb40-20020a05680816a800b003c37e7a8236mr846136oib.18.1711562306195;
        Wed, 27 Mar 2024 10:58:26 -0700 (PDT)
Received: from serve.minyard.net ([47.184.181.2])
        by smtp.gmail.com with ESMTPSA id bl16-20020a056808309000b003c3ca856452sm1579224oib.55.2024.03.27.10.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 10:58:25 -0700 (PDT)
Received: from mail.minyard.net (unknown [IPv6:2001:470:b8f6:1b:ac74:4d5d:21e4:a88a])
	by serve.minyard.net (Postfix) with ESMTPSA id 6CA7D1800B9;
	Wed, 27 Mar 2024 17:58:24 +0000 (UTC)
Date: Wed, 27 Mar 2024 12:58:23 -0500
From: Corey Minyard <minyard@acm.org>
To: Allen Pais <apais@linux.microsoft.com>
Subject: Re: [PATCH 6/9] ipmi: Convert from tasklet to BH workqueue
Message-ID: <ZgRePyo2zC4A1Fp4@mail.minyard.net>
References: <20240327160314.9982-1-apais@linux.microsoft.com>
 <20240327160314.9982-7-apais@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240327160314.9982-7-apais@linux.microsoft.com>
X-Mailman-Approved-At: Thu, 28 Mar 2024 08:10:21 +1100
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
Reply-To: minyard@acm.org
Cc: imx@lists.linux.dev, ulf.hansson@linaro.org, oneukum@suse.com, duncan.sands@free.fr, hayashi.kunihiko@socionext.com, linux-mmc@vger.kernel.org, aubin.constans@microchip.com, linus.walleij@linaro.org, Frank.Li@nxp.com, linux-hyperv@vger.kernel.org, linux-usb@vger.kernel.org, HaraldWelte@viatech.com, paul@crapouillou.net, linux-tegra@vger.kernel.org, netdev@vger.kernel.org, maintainers@bluecherrydvr.com, peter.ujfalusi@gmail.com, manivannan.sadhasivam@linaro.org, linux-riscv@lists.infradead.org, kys@microsoft.com, robert.jarzmik@free.fr, haijie1@huawei.com, linux-renesas-soc@vger.kernel.org, wei.liu@kernel.org, linux-omap@vger.kernel.org, florian.fainelli@broadcom.com, linux-rdma@vger.kernel.org, vireshk@kernel.org, jassisinghbrar@gmail.com, decui@microsoft.com, wangzhou1@hisilicon.com, jernej.skrabec@gmail.com, jh80.chung@samsung.com, zw@zh-kernel.org, wens@csie.org, stern@rowland.harvard.edu, linux-arm-msm@vger.kernel.org, orsonzhai@gmail.com, pierre@ossman.eu, linux-mips@vger.ke
 rnel.org, Eugeniy.Paltsev@synopsys.com, patrice.chotard@foss.st.com, asahi@lists.linux.dev, brucechang@via.com.tw, keescook@chromium.org, oakad@yahoo.com, sven@svenpeter.dev, rjui@broadcom.com, s.hauer@pengutronix.de, sean.wang@mediatek.com, linux-actions@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, haojian.zhuang@gmail.com, mirq-linux@rere.qmqm.pl, dmaengine@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, baolin.wang@linux.alibaba.com, matthias.bgg@gmail.com, openipmi-developer@lists.sourceforge.net, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com, sbranden@broadcom.com, logang@deltatee.com, andersson@kernel.org, marcan@marcan.st, haiyangz@microsoft.com, linux-kernel@vger.kernel.org, leoyang.li@nxp.com, konrad.dybcio@linaro.org, linux-sunxi@lists.linux.dev, vkoul@kernel.org, linux-s390@vger.kernel.org, mhiramat@kernel.org, zhang.lyra@gmail.com, tj@kernel.org, manuel.lauss@gmail.com, 
 linux-media@vger.kernel.org, shawnguo@kernel.org, afaerber@suse.de, daniel@zonque.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 27, 2024 at 04:03:11PM +0000, Allen Pais wrote:
> The only generic interface to execute asynchronously in the BH context is
> tasklet; however, it's marked deprecated and has some design flaws. To
> replace tasklets, BH workqueue support was recently added. A BH workqueue
> behaves similarly to regular workqueues except that the queued work items
> are executed in the BH context.
> 
> This patch converts drivers/infiniband/* from tasklet to BH workqueue.

I think you mean drivers/char/ipmi/* here.

I believe that work queues items are execute single-threaded for a work
queue, so this should be good.  I need to test this, though.  It may be
that an IPMI device can have its own work queue; it may not be important
to run it in bh context.

-corey

> 
> Based on the work done by Tejun Heo <tj@kernel.org>
> Branch: https://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git for-6.10
> 
> Signed-off-by: Allen Pais <allen.lkml@gmail.com>
> ---
>  drivers/char/ipmi/ipmi_msghandler.c | 30 ++++++++++++++---------------
>  1 file changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/char/ipmi/ipmi_msghandler.c b/drivers/char/ipmi/ipmi_msghandler.c
> index b0eedc4595b3..fce2a2dbdc82 100644
> --- a/drivers/char/ipmi/ipmi_msghandler.c
> +++ b/drivers/char/ipmi/ipmi_msghandler.c
> @@ -36,12 +36,13 @@
>  #include <linux/nospec.h>
>  #include <linux/vmalloc.h>
>  #include <linux/delay.h>
> +#include <linux/workqueue.h>
>  
>  #define IPMI_DRIVER_VERSION "39.2"
>  
>  static struct ipmi_recv_msg *ipmi_alloc_recv_msg(void);
>  static int ipmi_init_msghandler(void);
> -static void smi_recv_tasklet(struct tasklet_struct *t);
> +static void smi_recv_work(struct work_struct *t);
>  static void handle_new_recv_msgs(struct ipmi_smi *intf);
>  static void need_waiter(struct ipmi_smi *intf);
>  static int handle_one_recv_msg(struct ipmi_smi *intf,
> @@ -498,13 +499,13 @@ struct ipmi_smi {
>  	/*
>  	 * Messages queued for delivery.  If delivery fails (out of memory
>  	 * for instance), They will stay in here to be processed later in a
> -	 * periodic timer interrupt.  The tasklet is for handling received
> +	 * periodic timer interrupt.  The work is for handling received
>  	 * messages directly from the handler.
>  	 */
>  	spinlock_t       waiting_rcv_msgs_lock;
>  	struct list_head waiting_rcv_msgs;
>  	atomic_t	 watchdog_pretimeouts_to_deliver;
> -	struct tasklet_struct recv_tasklet;
> +	struct work_struct recv_work;
>  
>  	spinlock_t             xmit_msgs_lock;
>  	struct list_head       xmit_msgs;
> @@ -704,7 +705,7 @@ static void clean_up_interface_data(struct ipmi_smi *intf)
>  	struct cmd_rcvr  *rcvr, *rcvr2;
>  	struct list_head list;
>  
> -	tasklet_kill(&intf->recv_tasklet);
> +	cancel_work_sync(&intf->recv_work);
>  
>  	free_smi_msg_list(&intf->waiting_rcv_msgs);
>  	free_recv_msg_list(&intf->waiting_events);
> @@ -1319,7 +1320,7 @@ static void free_user(struct kref *ref)
>  {
>  	struct ipmi_user *user = container_of(ref, struct ipmi_user, refcount);
>  
> -	/* SRCU cleanup must happen in task context. */
> +	/* SRCU cleanup must happen in work context. */
>  	queue_work(remove_work_wq, &user->remove_work);
>  }
>  
> @@ -3605,8 +3606,7 @@ int ipmi_add_smi(struct module         *owner,
>  	intf->curr_seq = 0;
>  	spin_lock_init(&intf->waiting_rcv_msgs_lock);
>  	INIT_LIST_HEAD(&intf->waiting_rcv_msgs);
> -	tasklet_setup(&intf->recv_tasklet,
> -		     smi_recv_tasklet);
> +	INIT_WORK(&intf->recv_work, smi_recv_work);
>  	atomic_set(&intf->watchdog_pretimeouts_to_deliver, 0);
>  	spin_lock_init(&intf->xmit_msgs_lock);
>  	INIT_LIST_HEAD(&intf->xmit_msgs);
> @@ -4779,7 +4779,7 @@ static void handle_new_recv_msgs(struct ipmi_smi *intf)
>  			 * To preserve message order, quit if we
>  			 * can't handle a message.  Add the message
>  			 * back at the head, this is safe because this
> -			 * tasklet is the only thing that pulls the
> +			 * work is the only thing that pulls the
>  			 * messages.
>  			 */
>  			list_add(&smi_msg->link, &intf->waiting_rcv_msgs);
> @@ -4812,10 +4812,10 @@ static void handle_new_recv_msgs(struct ipmi_smi *intf)
>  	}
>  }
>  
> -static void smi_recv_tasklet(struct tasklet_struct *t)
> +static void smi_recv_work(struct work_struct *t)
>  {
>  	unsigned long flags = 0; /* keep us warning-free. */
> -	struct ipmi_smi *intf = from_tasklet(intf, t, recv_tasklet);
> +	struct ipmi_smi *intf = from_work(intf, t, recv_work);
>  	int run_to_completion = intf->run_to_completion;
>  	struct ipmi_smi_msg *newmsg = NULL;
>  
> @@ -4866,7 +4866,7 @@ void ipmi_smi_msg_received(struct ipmi_smi *intf,
>  
>  	/*
>  	 * To preserve message order, we keep a queue and deliver from
> -	 * a tasklet.
> +	 * a work.
>  	 */
>  	if (!run_to_completion)
>  		spin_lock_irqsave(&intf->waiting_rcv_msgs_lock, flags);
> @@ -4887,9 +4887,9 @@ void ipmi_smi_msg_received(struct ipmi_smi *intf,
>  		spin_unlock_irqrestore(&intf->xmit_msgs_lock, flags);
>  
>  	if (run_to_completion)
> -		smi_recv_tasklet(&intf->recv_tasklet);
> +		smi_recv_work(&intf->recv_work);
>  	else
> -		tasklet_schedule(&intf->recv_tasklet);
> +		queue_work(system_bh_wq, &intf->recv_work);
>  }
>  EXPORT_SYMBOL(ipmi_smi_msg_received);
>  
> @@ -4899,7 +4899,7 @@ void ipmi_smi_watchdog_pretimeout(struct ipmi_smi *intf)
>  		return;
>  
>  	atomic_set(&intf->watchdog_pretimeouts_to_deliver, 1);
> -	tasklet_schedule(&intf->recv_tasklet);
> +	queue_work(system_bh_wq, &intf->recv_work);
>  }
>  EXPORT_SYMBOL(ipmi_smi_watchdog_pretimeout);
>  
> @@ -5068,7 +5068,7 @@ static bool ipmi_timeout_handler(struct ipmi_smi *intf,
>  				       flags);
>  	}
>  
> -	tasklet_schedule(&intf->recv_tasklet);
> +	queue_work(system_bh_wq, &intf->recv_work);
>  
>  	return need_timer;
>  }
> -- 
> 2.17.1
> 
> 
