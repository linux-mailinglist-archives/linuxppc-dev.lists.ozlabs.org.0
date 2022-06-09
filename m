Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C5192545013
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jun 2022 17:03:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LJnR54LlHz3c8x
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 01:03:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=BKUSuWB/;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=vvuxQZEA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=bigeasy@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=BKUSuWB/;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=vvuxQZEA;
	dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJnQR0sRkz3bk9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jun 2022 01:02:54 +1000 (AEST)
Date: Thu, 9 Jun 2022 17:02:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1654786970;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rsv9agcb7AdhLP1srXUy5ncNQtch/vDr6u6vmLWao2w=;
	b=BKUSuWB/KmoHcHKcJnNQtVcpblcVCQ8GBsGICPRbx5UNwamrAA2o8DCHyE7WwNSpa/LvN6
	bsTZqUp1C8bF7xeNzMpiHbyMeJ6AVEsFBn/uhF4y47zyEYPrBwNr9Rvn+mYFkp381bgWDh
	ltzyfMG4/X+sQOrJzQ9v6EuxLRD6mkMcuglvNHrQanhxtmWOcVVl88UOciUonrOoc4zQDf
	4Uav6tqyWPWC+u65VsvdTJ7o1ZAHkUF1SWtp8b8y9n0YYJaw569HawQwMzfe/eSH0yJdgn
	kk10mA7QBRaZOObPL770b32AE9Omh/lB1VJNm9CeA2Hm0hq1XTM1pbWfA9ot4w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1654786970;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rsv9agcb7AdhLP1srXUy5ncNQtch/vDr6u6vmLWao2w=;
	b=vvuxQZEA1uPGaBJ79e2W7phxX23trtU+OPmEU+bcwiSrqBkZXi0XOGMsqYNzvwEBL0t3xd
	X0vzmUkgd7AM6yAg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Davidlohr Bueso <dave@stgolabs.net>
Subject: Re: [PATCH 09/10] scsi/ibmvscsi: Replace srp tasklet with work
Message-ID: <YqILmd/WnNT/zYrf@linutronix.de>
References: <20220530231512.9729-1-dave@stgolabs.net>
 <20220530231512.9729-10-dave@stgolabs.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220530231512.9729-10-dave@stgolabs.net>
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

On 2022-05-30 16:15:11 [-0700], Davidlohr Bueso wrote:
> Tasklets have long been deprecated as being too heavy on the system
> by running in irq context - and this is not a performance critical
> path. If a higher priority process wants to run, it must wait for
> the tasklet to finish before doing so.
> 
> Process srps asynchronously in process context in a dedicated
> single threaded workqueue.

I would suggest threaded interrupts instead. The pattern here is the
same as in the previous driver except here is less locking.

Sebastian
