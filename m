Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9BE53C92E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jun 2022 13:15:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LF0g83twTz3c87
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jun 2022 21:15:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=1FVVDcj0;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Oc5YLYfd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=bigeasy@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=1FVVDcj0;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Oc5YLYfd;
	dkim-atps=neutral
X-Greylist: delayed 553 seconds by postgrey-1.36 at boromir; Fri, 03 Jun 2022 21:15:15 AEST
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LF0fW4rgNz3blB
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jun 2022 21:15:15 +1000 (AEST)
Date: Fri, 3 Jun 2022 13:05:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1654254356;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7utYxrYCw2OweZyE2twgWDzo4lfhsXkbxwhY74joFzQ=;
	b=1FVVDcj0tmhMHzjb0Hi2FQqDjyb0c6wE+I9480kJXyxfA72113pyyMe6aXcjZ+mKmlLSBN
	Cf7gNlwYdayD8Nby3Is4fxCfZNoS8ZeeVFy2E9ALb6HGY5FQVdP3e9srxCoYXaR1JMvg7+
	uskDIPlRVLCsgvhCSs06y6LjQJ64fJXArHAc2TQib5ob79/JWpGe42vmFIZEdbGa6c9fBk
	SBW+UJOn3Bc5ANrhcY4GwRohMDZAhMbwLr1F/Zi28xOgqbSye7eIo3th6vH0pcAeWL9Bej
	Nvl0wgVu63d2UtIs7u+p8fom8v/UjJIJnA7ldrOYfJc3mfM+l/IqeFluxxENKg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1654254356;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7utYxrYCw2OweZyE2twgWDzo4lfhsXkbxwhY74joFzQ=;
	b=Oc5YLYfdkgllR9u7O9z7uUaXOXdTkz73KUv006nb5Hsky/CCptIhi0a6NGVWCLq3o/FCtB
	dI6O2rmVvA+mWrCg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Davidlohr Bueso <dave@stgolabs.net>
Subject: Re: [PATCH 06/10] scsi/ibmvscsi_tgt: Replace work tasklet with
 threaded irq
Message-ID: <Ypm8H1yicMAQjpt4@linutronix.de>
References: <20220530231512.9729-1-dave@stgolabs.net>
 <20220530231512.9729-7-dave@stgolabs.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220530231512.9729-7-dave@stgolabs.net>
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
Cc: ejb@linux.ibm.com, linux-scsi@vger.kernel.org, martin.petersen@oracle.com, Michael Cyr <mikecyr@linux.ibm.com>, tglx@linutronix.de, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2022-05-30 16:15:08 [-0700], Davidlohr Bueso wrote:
> diff --git a/drivers/scsi/ibmvscsi_tgt/ibmvscsi_tgt.c b/drivers/scsi/ibmvscsi_tgt/ibmvscsi_tgt.c
> index eee1a24f7e15..fafadb7158a3 100644
> --- a/drivers/scsi/ibmvscsi_tgt/ibmvscsi_tgt.c
> +++ b/drivers/scsi/ibmvscsi_tgt/ibmvscsi_tgt.c
> @@ -2948,9 +2948,8 @@ static irqreturn_t ibmvscsis_interrupt(int dummy, void *data)
>  	struct scsi_info *vscsi = data;
>  
>  	vio_disable_interrupts(vscsi->dma_dev);
> -	tasklet_schedule(&vscsi->work_task);
looks good.

> -	return IRQ_HANDLED;
> +	return IRQ_WAKE_THREAD;
>  }
>  
>  /**
> @@ -3340,7 +3339,7 @@ static void ibmvscsis_handle_crq(unsigned long data)
>  		dev_dbg(&vscsi->dev, "handle_crq, don't process: flags 0x%x, state 0x%hx\n",
>  			vscsi->flags, vscsi->state);
>  		spin_unlock_bh(&vscsi->intr_lock);

So if you move it away from from tasklet you can replace the spin_lock_bh()
with spin_lock() since BH does not matter anymore. Except if there is a
timer because it matters for a timer_list timer which is invoked in
softirq context. This isn't the case except that there is a hrtimer
invoking ibmvscsis_service_wait_q(). This is bad because a hrtimer is
which is invoked in hard-irq context so a BH lock must not be acquired.
lockdep would scream here. You could use HRTIMER_MODE_REL_SOFT which
would make it a BH timer. Then you could keep the BH locking but
actually you want to get rid of it ;)

> -		return;
> +	        goto done;
>  	}
>  
>  	rc = vscsi->flags & SCHEDULE_DISCONNECT;

Sebastian
