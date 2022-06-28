Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 739EA55E5B3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 17:33:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXTCH2ryCz3dQM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 01:33:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stgolabs.net header.i=@stgolabs.net header.a=rsa-sha256 header.s=dreamhost header.b=kK5YSzrs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stgolabs.net (client-ip=23.83.209.151; helo=quail.birch.relay.mailchannels.net; envelope-from=dave@stgolabs.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stgolabs.net header.i=@stgolabs.net header.a=rsa-sha256 header.s=dreamhost header.b=kK5YSzrs;
	dkim-atps=neutral
Received: from quail.birch.relay.mailchannels.net (quail.birch.relay.mailchannels.net [23.83.209.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXTBX5kQVz3bnR
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jun 2022 01:33:06 +1000 (AEST)
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 50FBA1224C9;
	Tue, 28 Jun 2022 15:33:01 +0000 (UTC)
Received: from pdx1-sub0-mail-a228.dreamhost.com (unknown [127.0.0.6])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 8E89212159D;
	Tue, 28 Jun 2022 15:33:00 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1656430380; a=rsa-sha256;
	cv=none;
	b=yKBrzsWJ5dPoyqUvCFyC4mfxLsZdHCe6PzQfeJMTmbYRxL04gVJO2jRgACRXDCIOhsk1hT
	quq3hAZEM8KV9cL4fRdMVgwPeJVJrEMeRUqi9pNvcaB52PJI+m7GZfIB+sD7kO61zUFCH1
	DBHXMaxa6oXbFyRLpb+10WjUlDe4eSEcAQa15hL9cPSbvLmH4Lt085G77O3d2Ev2RUremv
	sMaM6S+vdj1uHrEepmtblz4ZWFRU7pL3sVf73KPpBUgy9V1MQOuObNpBFajQRPj+CgO1Gi
	KGcDLJpwczwZxjDh7eSY0IrRCE2vWqR5WHIH6iQEzMIPilBycGTJHW4WHkQCjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1656430380;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=6PaLg0zce8LMNs1lHt4RTUDAxY3qsfhOcGADLKrynS8=;
	b=NSSOgRu8sh0Wyzm784OxYgEUjtabMPRwkzOam8zhEpghfUZ/kGLvuct4FRCk2B1XmH8Sdo
	Xk2YlLMCyXgNV+un6S3z3ISGc1O1fnD4pLcuw7ggZBCIprpzA4eg7D3MOXTv01fJc/D9bY
	Ss8uYiKw0uK2jLb4SwXpK2VvjOfr0cDh+aHlHUMaKBPeqiIgeO9QxS1lUwfdVS3MS4L1wl
	A9mroy7Iy/tQxGa93Q73+nWWrXXDDVNkKTAOKmFiRLbIttIjVuwYjFcSkJj9WuAFip9JVk
	gL6vpsAn8T+76TvkMnfuvkXQFlgzY2CSzJsChFUBd6umfrLRk6DkBwO9dQkegQ==
ARC-Authentication-Results: i=1;
	rspamd-674ffb986c-zqpf8;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=dave@stgolabs.net
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|dave@stgolabs.net
X-MailChannels-Auth-Id: dreamhost
X-Wide-Eyed-Decisive: 3880163f225d940e_1656430380886_3243346417
X-MC-Loop-Signature: 1656430380886:3079928529
X-MC-Ingress-Time: 1656430380885
Received: from pdx1-sub0-mail-a228.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.124.238.92 (trex/6.7.1);
	Tue, 28 Jun 2022 15:33:00 +0000
Received: from offworld (unknown [104.36.31.105])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dave@stgolabs.net)
	by pdx1-sub0-mail-a228.dreamhost.com (Postfix) with ESMTPSA id 4LXTBM5vx0zLL;
	Tue, 28 Jun 2022 08:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stgolabs.net;
	s=dreamhost; t=1656430380;
	bh=6PaLg0zce8LMNs1lHt4RTUDAxY3qsfhOcGADLKrynS8=;
	h=Date:From:To:Cc:Subject:Content-Type;
	b=kK5YSzrsWQ9cQbjKuxowUWgzzeGmgepLWF5PgQj7/M2xckOLlma1s4hsLATiRxyrA
	 3uXY1P/avJhWWsSgnuxM6ElADUMdhadVAOqEFRVi6bKzgHmtsUdWjm0LGEUHra//FM
	 5LIDXTHkgb1GsxBvVj0giWrkqOa6I5QwP1tOf1cCEdY6DfYfZjtXK6yfoflKF3miVz
	 IBzgq3yZjY+lqULPPh1WNR1kdv21xlV98o7Pd4NLmyO6qjvvNb05q5xu6GeLKJmFt9
	 NeI0pG/PyV3lEKB2we3YcXjK08kYyjoohxicdQohG/t4Z0yrcYTaGh4pxcfkrZKgvw
	 iPwZ1QKp5LLQg==
Date: Tue, 28 Jun 2022 08:18:07 -0700
From: Davidlohr Bueso <dave@stgolabs.net>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH 08/10] scsi/ibmvfc: Replace tasklet with work
Message-ID: <20220628151807.trtkagucvdmywisx@offworld>
References: <20220530231512.9729-1-dave@stgolabs.net>
 <20220530231512.9729-9-dave@stgolabs.net>
 <YqHn2Rn5nePSJ0PG@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <YqHn2Rn5nePSJ0PG@linutronix.de>
User-Agent: NeoMutt/20220429
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

On Thu, 09 Jun 2022, Sebastian Andrzej Siewior wrote:

>On 2022-05-30 16:15:10 [-0700], Davidlohr Bueso wrote:
>> diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
>> index d0eab5700dc5..31b1900489e7 100644
>> --- a/drivers/scsi/ibmvscsi/ibmvfc.c
>> +++ b/drivers/scsi/ibmvscsi/ibmvfc.c
>> @@ -891,7 +891,7 @@ static void ibmvfc_release_crq_queue(struct ibmvfc_host *vhost)
>>
>>	ibmvfc_dbg(vhost, "Releasing CRQ\n");
>>	free_irq(vdev->irq, vhost);
>> -	tasklet_kill(&vhost->tasklet);
>> +        cancel_work_sync(&vhost->work);
>s/ {8}/\t/
>
>is there a reason not to use threaded interrupts?

I went with a workqueue here because the resume from suspend also schedules
async processing, so threaded irqs didn't seem like a good fit. This is also
similar to patch 2 (but in that case I overlooked the resume caller which you
pointed out).

Thanks,
Davidlohr
