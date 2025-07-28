Return-Path: <linuxppc-dev+bounces-10423-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6B4B13616
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Jul 2025 10:11:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4brB5N2hV4z2xd6;
	Mon, 28 Jul 2025 18:11:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.21.126.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753680710;
	cv=none; b=Upcwrx5lZzg5KNDYyZUggiA8lx8z0AyWO1AE09+wBtm87dqZ/msH7W3vzufWBYzavm8mZledKdFbGW39jy+zZjx9coinvmZUTP4kC5TLlZ1JBMrUtllH4dBuztTzM2MP5Ug9eJfGzY0dlaIT2zM/QmWsp8O7B6bc6+OXHU47Wqnr2IDJMed9tOrjIL1HcFNH9JUBp+1MkZKllI2aUEiFNFhiqHz+tjlPsrAINa3oBL/C0nBSoCcXGtPMa/GitYtNK1mu9ZCkpLrxl1yaSOstnyHeBJQblDGjeTtxpXRMGgiYRpdu8wCdjVnPOqjCLWseis0S4gvybopQL11ZxT9gyA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753680710; c=relaxed/relaxed;
	bh=76+XsNkI1Vvm/cj68EELqdniznvp+JYoM6cazIfRklM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bHf6LygAONPTKCUFIbW+T3q0jNGj3YlvIbda+nTOe5ekitzNru3He8Mk5Xa3POAQqDMHSljiDjAiUzejIPvJk9DEGgtK+WT8dpoSpULHn/rn77YmGXhF3FDnB2HDHhUa/ty2E9acyw3GRHdSBadHluAsKEjYSOOHNdMl4f9/KYGf7LE1FcnVGSRylyH6jKyv7XNZvH0CHE+Ml3sH2ifRYYhE1iGg/KRs33aq09FqNnFcWA1bvxoFzHyKfOJ4WnaYiyMNaroVhfcSE2ZlZDOowoCwERkF/kGKJseKfXGKABOkVm501OCmnUDdurcS5KbBLq4pKViyOnj8kvK4PKUZdQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=ee.iitb.ac.in; dkim=pass (1024-bit key; unprotected) header.d=iitb.ac.in header.i=@iitb.ac.in header.a=rsa-sha256 header.s=mail header.b=OVjajOh5; dkim-atps=neutral; spf=pass (client-ip=103.21.126.57; helo=smtp1.iitb.ac.in; envelope-from=akhilesh@ee.iitb.ac.in; receiver=lists.ozlabs.org) smtp.mailfrom=ee.iitb.ac.in
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=ee.iitb.ac.in
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=iitb.ac.in header.i=@iitb.ac.in header.a=rsa-sha256 header.s=mail header.b=OVjajOh5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ee.iitb.ac.in (client-ip=103.21.126.57; helo=smtp1.iitb.ac.in; envelope-from=akhilesh@ee.iitb.ac.in; receiver=lists.ozlabs.org)
Received: from smtp1.iitb.ac.in (smtpd2.iitb.ac.in [103.21.126.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4br6Y03hRxz2xRq
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Jul 2025 15:31:47 +1000 (AEST)
Received: from ldns2.iitb.ac.in (ldns2.iitb.ac.in [10.200.12.2])
	by smtp1.iitb.ac.in (Postfix) with SMTP id B2194104CBAD
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Jul 2025 11:01:44 +0530 (IST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.iitb.ac.in B2194104CBAD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=iitb.ac.in; s=mail;
	t=1753680704; bh=xsovHFmFZz4ZVIsR/kFcDv+maxVHaOLgUGsuwMwZh8M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OVjajOh5q4lbdIPsNIo2Y0PKT4z8D1TFvijaXayeuSr8ufMJXM4AsBsh8y5mMaYhY
	 X+OfK0kNl5m5+tQogUFb3H0fpX3JcU3eZNCGNtq/ccd3sksUZWN1tsZbv94NjWl8SG
	 xqXN+rCtgjgg49vMFEtOhAvB8czTfXnzcr3i2Agk=
Received: (qmail 7314 invoked by uid 510); 28 Jul 2025 11:01:44 +0530
X-Qmail-Scanner-Diagnostics: from 10.200.1.25 by ldns2 (envelope-from <akhilesh@ee.iitb.ac.in>, uid 501) with qmail-scanner-2.11
 spamassassin: 3.4.1. mhr: 1.0. {clamdscan: 0.100.0/26337} 
 Clear:RC:1(10.200.1.25):SA:0(0.0/7.0):. Processed in 5.178536 secs; 28 Jul 2025 11:01:44 +0530
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Pyzor: Reported 0 times.
X-Envelope-From: akhilesh@ee.iitb.ac.in
X-Qmail-Scanner-Mime-Attachments: |
X-Qmail-Scanner-Zip-Files: |
Received: from unknown (HELO ldns2.iitb.ac.in) (10.200.1.25)
  by ldns2.iitb.ac.in with SMTP; 28 Jul 2025 11:01:39 +0530
Received: from bhairav.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
	by ldns2.iitb.ac.in (Postfix) with ESMTP id CBC4E3414E2;
	Mon, 28 Jul 2025 11:01:38 +0530 (IST)
Received: from bhairav-test.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
	(Authenticated sender: akhilesh)
	by bhairav.ee.iitb.ac.in (Postfix) with ESMTPSA id 91D1B1E8127E;
	Mon, 28 Jul 2025 11:01:38 +0530 (IST)
Date: Mon, 28 Jul 2025 11:01:33 +0530
From: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: jirislaby@kernel.org, andriy.shevchenko@linux.intel.com,
	john.ogness@linutronix.de, pmladek@suse.com, johan@kernel.org,
	namcao@linutronix.de, timur@kernel.org,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, akhileshpatilvnit@gmail.com,
	skhan@linuxfoundation.org
Subject: Re: [PATCH] tty: serial: ucc_uart: use WARN_ON() instead of BUG()
Message-ID: <aIcLNXkXG3UFbSrv@bhairav-test.ee.iitb.ac.in>
References: <aIbV+WbhFMDamaiW@bhairav-test.ee.iitb.ac.in>
 <2025072814-splicing-sassy-f33a@gregkh>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025072814-splicing-sassy-f33a@gregkh>

On Mon, Jul 28, 2025 at 06:07:22AM +0200, Greg KH wrote:
> On Mon, Jul 28, 2025 at 07:14:25AM +0530, Akhilesh Patil wrote:
> > Replace BUG() with WARN_ON() as recommended in
> > Documentation/process/deprecated.rst
> > Fix system entering into unstable/break/undebuggable state due to use
> > of BUG(). Follow strict suggestions as per [1] [2].
> > 
> > Link: https://lore.kernel.org/lkml/CA+55aFy6jNLsywVYdGp83AMrXBo_P-pkjkphPGrO=82SPKCpLQ@mail.gmail.com/ [1]
> > Link: https://lore.kernel.org/lkml/CAHk-=whDHsbK3HTOpTF=ue_o04onRwTEaK_ZoJp_fjbqq4+=Jw@mail.gmail.com/ [2]
> > Signed-off-by: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
> > ---
> >  drivers/tty/serial/ucc_uart.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/tty/serial/ucc_uart.c b/drivers/tty/serial/ucc_uart.c
> > index 0613f8c11ab1..6214ab1b67cb 100644
> > --- a/drivers/tty/serial/ucc_uart.c
> > +++ b/drivers/tty/serial/ucc_uart.c
> > @@ -223,7 +223,7 @@ static inline dma_addr_t cpu2qe_addr(void *addr, struct uart_qe_port *qe_port)
> >  
> >  	/* something nasty happened */
> >  	printk(KERN_ERR "%s: addr=%p\n", __func__, addr);
> > -	BUG();
> > +	WARN_ON(1);
> >  	return 0;
> >  }
> >  
> > @@ -242,7 +242,7 @@ static inline void *qe2cpu_addr(dma_addr_t addr, struct uart_qe_port *qe_port)
> >  
> >  	/* something nasty happened */
> >  	printk(KERN_ERR "%s: addr=%llx\n", __func__, (u64)addr);
> > -	BUG();
> > +	WARN_ON(1);
> >  	return NULL;
> >  }
> 
> You can't just do a search/replace for these types of things, otherwise
> we would have done so a long time ago.
> 

Hi greg, Agree. Let me dive deep to understand this BUG() -> WARN()
recommendation and come back after detailed analysis for this change.
> How did you test this patch?  The BUG() here assumes that if this ever

I have done only build check with NXP p1025rdb configuration as I do not
have this particular hardware handy.
> fires, the system is really broken, how have you recovered from that
> broken state?
> 
> thanks,
> 
> greg k-h

Thanks for the review :) 

Regards,
Akhilesh


