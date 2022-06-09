Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C4741544C04
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jun 2022 14:31:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LJk3F4qDCz3c85
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jun 2022 22:31:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=EoGAG3Le;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=VeE8mygK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=bigeasy@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=EoGAG3Le;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=VeE8mygK;
	dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJk2Z72vbz3bmH
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jun 2022 22:30:30 +1000 (AEST)
Date: Thu, 9 Jun 2022 14:30:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1654777819;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rx20vBwQrFJxboggEamckdADOxqPZbwTBqK3xGl2Ggw=;
	b=EoGAG3LeCifcc2wJNJfa2mGGcUsVm1+REYwAzKBDYfLoQT+uhikwHPu0fKWD7+kE4+IVRx
	debRveVAReWChn28q93/jAS/SKhYjXW1wzH2zB6AQ3/qpgFzpF2vECmRt5HydwUrBmSqXM
	zKnJxKlpAzjjNl/UV31YKatU9TpSKHcTKGgvC9pabVYcCNNw2FX9IaiJPVsQCD9XQOI6UN
	S6V+YqBfyIGkehTmsqGk42bpMew3Tnkxe+/H3rWf5PmfM1/OshSI3dBeYWQvrr7EfbqgKg
	rUspljf2odJCelvyz9S2Kv6grCLvfrLX567s5IjRILvCnM9BEOIdJtbZyPjQOw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1654777819;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rx20vBwQrFJxboggEamckdADOxqPZbwTBqK3xGl2Ggw=;
	b=VeE8mygK3kPVkG5+l69zYa30HBaVnhwn5vTRFwiqjcLaffU0jLclXF5nEyWpX/CwCzisRd
	wFjBimEIePkkVgBQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Davidlohr Bueso <dave@stgolabs.net>
Subject: Re: [PATCH 08/10] scsi/ibmvfc: Replace tasklet with work
Message-ID: <YqHn2Rn5nePSJ0PG@linutronix.de>
References: <20220530231512.9729-1-dave@stgolabs.net>
 <20220530231512.9729-9-dave@stgolabs.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220530231512.9729-9-dave@stgolabs.net>
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, ejb@linux.ibm.com, linux-scsi@vger.kernel.org, martin.petersen@oracle.com, tglx@linutronix.de, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2022-05-30 16:15:10 [-0700], Davidlohr Bueso wrote:
> diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvf=
c.c
> index d0eab5700dc5..31b1900489e7 100644
> --- a/drivers/scsi/ibmvscsi/ibmvfc.c
> +++ b/drivers/scsi/ibmvscsi/ibmvfc.c
> @@ -891,7 +891,7 @@ static void ibmvfc_release_crq_queue(struct ibmvfc_ho=
st *vhost)
> =20
>  	ibmvfc_dbg(vhost, "Releasing CRQ\n");
>  	free_irq(vdev->irq, vhost);
> -	tasklet_kill(&vhost->tasklet);
> +        cancel_work_sync(&vhost->work);
s/ {8}/\t/

is there a reason not to use threaded interrupts? The workqueue _might_
migrate to another CPU. The locking ensures that nothing bad happens but
ibmvfc_tasklet() has this piece:

|         spin_lock_irqsave(vhost->host->host_lock, flags);
=E2=80=A6
|                 while ((async =3D ibmvfc_next_async_crq(vhost)) !=3D NULL=
) {
|                         ibmvfc_handle_async(async, vhost);
|                         async->valid =3D 0;
|                         wmb();
|                 }
=E2=80=A6
|                 vio_enable_interrupts(vdev);
potentially enables interrupts which fires right away.

|                 if ((async =3D ibmvfc_next_async_crq(vhost)) !=3D NULL) {
|                         vio_disable_interrupts(vdev);

disables it again.

|         }
|=20
|         spin_unlock(vhost->crq.q_lock);
|         spin_unlock_irqrestore(vhost->host->host_lock, flags);

If the worker runs on another CPU then the CPU servicing the interrupt
will be blocked on the lock which is not nice.

My guess is that you could enable interrupts right before unlocking but
is a different story.

>  	do {
>  		if (rc)
>  			msleep(100);

Sebastian
