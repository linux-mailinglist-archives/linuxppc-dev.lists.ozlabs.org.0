Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE82C54B23D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jun 2022 15:26:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LMq2p6lRrz3brM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jun 2022 23:26:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Aqgy5qT7;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=EBE7d9+U;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=bigeasy@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Aqgy5qT7;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=EBE7d9+U;
	dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LMq2C3QDCz3bl4
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jun 2022 23:25:55 +1000 (AEST)
Date: Tue, 14 Jun 2022 15:25:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1655213138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HgXa9L+iV+7zBfhKa3Rr0XV93bVTAQjox2YJMz4AHCM=;
	b=Aqgy5qT7mH48G22oPeVFUFgifa/KQqsaUyJQtY9dpXLWEPFTOvW4WqCjf3DvJcs8Gy27q2
	MEw27SJcu7teRJpWbVvSKDJU7s6Ft94EnzU1BPdJ5b0CvVE7WF9L+LJcaurg3TZOm+hRvC
	GNKUYFHgApG36uqPj/xkJANXu0b4bQWYMZfgMaMRZXz9l/rC9nFzTKv8Vw2c638s65E2WB
	8IlQBIil0o5Kl13wODCSU209ePbs7jrmGUqtt9BYn5vHMHIqDKJB7udj4S7RKvLs7/r1Od
	kL+T17cI6y1H9IOUkuuzDKMo0kbIIvL5BEHNhJkm9uF0Odf3D1guIOhyH60nBA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1655213138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HgXa9L+iV+7zBfhKa3Rr0XV93bVTAQjox2YJMz4AHCM=;
	b=EBE7d9+UYA5E++I4PSONdHMe8+Fit1/L+J9Q/EsQAzlhNCZCT47ZWw1HksPr1cDxxU/Qua
	YSVyfNd8EOeK/ACw==
From: 'Sebastian Andrzej Siewior' <bigeasy@linutronix.de>
To: David Laight <David.Laight@aculab.com>
Subject: Re: [PATCH 09/10] scsi/ibmvscsi: Replace srp tasklet with work
Message-ID: <YqiMUS0IGtMgyQ6q@linutronix.de>
References: <20220530231512.9729-1-dave@stgolabs.net>
 <20220530231512.9729-10-dave@stgolabs.net>
 <YqILmd/WnNT/zYrf@linutronix.de>
 <7faa88aaf7554545a60561d73597dc4f@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7faa88aaf7554545a60561d73597dc4f@AcuMS.aculab.com>
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, Davidlohr Bueso <dave@stgolabs.net>, "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, "martin.petersen@oracle.com" <martin.petersen@oracle.com>, "ejb@linux.ibm.com" <ejb@linux.ibm.com>, "tglx@linutronix.de" <tglx@linutronix.de>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2022-06-09 15:46:04 [+0000], David Laight wrote:
> From: Sebastian Andrzej Siewior
> > Sent: 09 June 2022 16:03
> > 
> > On 2022-05-30 16:15:11 [-0700], Davidlohr Bueso wrote:
> > > Tasklets have long been deprecated as being too heavy on the system
> > > by running in irq context - and this is not a performance critical
> > > path. If a higher priority process wants to run, it must wait for
> > > the tasklet to finish before doing so.
> > >
> > > Process srps asynchronously in process context in a dedicated
> > > single threaded workqueue.
> > 
> > I would suggest threaded interrupts instead. The pattern here is the
> > same as in the previous driver except here is less locking.
> 
> How long do these actions runs for, and what is waiting for
> them to finish?

That is something that one with hardware and workload can answer.

> These changes seem to drop the priority from above that of the
> highest priority RT process down to that of a default priority
> user process.
> There is no real guarantee that the latter will run 'any time soon'.

Not sure I can follow. Using threaded interrupts will run at FIFO-50 by
default. Workqueue however is SCHED_OTHER. But then it is not bound to
any CPU so it will run on an available CPU.

> Consider some workloads I'm setting up where most of the cpu are
> likely to spend 90%+ of the time running processes under the RT
> scheduler that are processing audio.
> 
> It is quite likely that a non-RT thread (especially one bound
> to a specific cpu) won't run for several milliseconds.
> (We have to go through 'hoops' to avoid dropping ethernet frames.)
> 
> I'd have thought that some of these kernel threads really
> need to run at a 'middling' RT priority.

The threaded interrupts do this by default. If you run your own RT
threads you need to decide if they are more or less important than the
interrupts.

> 	David

Sebastian
