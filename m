Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DAD96D8732
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Apr 2023 21:46:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PsFWf5F62z3f8T
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Apr 2023 05:46:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IHr326Oj;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IHr326Oj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=mtosatti@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IHr326Oj;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IHr326Oj;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PsFVk6Jndz3cj2
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Apr 2023 05:46:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680723962;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+2zEtqXoZ8EUol2cclpRVKkKNXmBP9BtyvyLsaVT0jc=;
	b=IHr326Oj0N26xa5gQkJW3os8cdcmQWMlINIkTgYno6gdUDUnNTTv/csK3/fUP3av3Sd8hU
	2Z2vebdoiAkOo6CAgUKASMsGdssEeOBM6GTltzvz1XFtcQNofFD0ONTpeSJ9BjAk6sfUJF
	rLEGgkP1qL8KZk+d2C9112Mt/JpPC9U=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680723962;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+2zEtqXoZ8EUol2cclpRVKkKNXmBP9BtyvyLsaVT0jc=;
	b=IHr326Oj0N26xa5gQkJW3os8cdcmQWMlINIkTgYno6gdUDUnNTTv/csK3/fUP3av3Sd8hU
	2Z2vebdoiAkOo6CAgUKASMsGdssEeOBM6GTltzvz1XFtcQNofFD0ONTpeSJ9BjAk6sfUJF
	rLEGgkP1qL8KZk+d2C9112Mt/JpPC9U=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-428-6AAFnWjlOs2G1gaCxtVpqg-1; Wed, 05 Apr 2023 15:46:00 -0400
X-MC-Unique: 6AAFnWjlOs2G1gaCxtVpqg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2C7243C0D86F;
	Wed,  5 Apr 2023 19:45:57 +0000 (UTC)
Received: from tpad.localdomain (ovpn-112-2.gru2.redhat.com [10.97.112.2])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B9FF21121314;
	Wed,  5 Apr 2023 19:45:55 +0000 (UTC)
Received: by tpad.localdomain (Postfix, from userid 1000)
	id E6884400E055B; Wed,  5 Apr 2023 16:43:14 -0300 (-03)
Date: Wed, 5 Apr 2023 16:43:14 -0300
From: Marcelo Tosatti <mtosatti@redhat.com>
To: Frederic Weisbecker <frederic@kernel.org>
Subject: Re: [PATCH 3/3] mm/mmu_gather: send tlb_remove_table_smp_sync IPI
 only to CPUs in kernel mode
Message-ID: <ZC3PUkI7N2uEKy6v@tpad>
References: <20230404134224.137038-1-ypodemsk@redhat.com>
 <20230404134224.137038-4-ypodemsk@redhat.com>
 <ZC1Q7uX4rNLg3vEg@lothringen>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZC1Q7uX4rNLg3vEg@lothringen>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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
Cc: geert+renesas@glider.be, peterz@infradead.org, linus.walleij@linaro.org, dave.hansen@linux.intel.com, Yair Podemsky <ypodemsk@redhat.com>, sebastian.reichel@collabora.com, linux-mm@kvack.org, hpa@zytor.com, sparclinux@vger.kernel.org, agordeev@linux.ibm.com, will@kernel.org, ardb@kernel.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, vschneid@redhat.com, arnd@arndb.de, paulmck@kernel.org, aneesh.kumar@linux.ibm.com, x86@kernel.org, linux@armlinux.org.uk, tony@atomide.com, mingo@redhat.com, samitolvanen@google.com, borntraeger@linux.ibm.com, keescook@chromium.org, gor@linux.ibm.com, hca@linux.ibm.com, npiggin@gmail.com, rmk+kernel@armlinux.org.uk, bp@alien8.de, nick.hawkins@hpe.com, tglx@linutronix.de, jpoimboe@kernel.org, linux-arm-kernel@lists.infradead.org, alougovs@redhat.com, linux-kernel@vger.kernel.org, juerg.haefliger@canonical.com, svens@linux.ibm.com, dhildenb@redhat.com, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 05, 2023 at 12:43:58PM +0200, Frederic Weisbecker wrote:
> On Tue, Apr 04, 2023 at 04:42:24PM +0300, Yair Podemsky wrote:
> > @@ -191,6 +192,20 @@ static void tlb_remove_table_smp_sync(void *arg)
> >  	/* Simply deliver the interrupt */
> >  }
> >  
> > +
> > +#ifdef CONFIG_CONTEXT_TRACKING
> > +static bool cpu_in_kernel(int cpu, void *info)
> > +{
> > +	struct context_tracking *ct = per_cpu_ptr(&context_tracking, cpu);
> 
> Like Peter said, an smp_mb() is required here before the read (unless there is
> already one between the page table modification and that ct->state read?).
> 
> So that you have this pairing:
> 
> 
>            WRITE page_table                  WRITE ct->state
> 	   smp_mb()                          smp_mb() // implied by atomic_fetch_or
>            READ ct->state                    READ page_table
> 
> > +	int state = atomic_read(&ct->state);
> > +	/* will return true only for cpus in kernel space */
> > +	return state & CT_STATE_MASK == CONTEXT_KERNEL;
> > +}
> 
> Also note that this doesn't stricly prevent userspace from being interrupted.
> You may well observe the CPU in kernel but it may receive the IPI later after
> switching to userspace.
> 
> We could arrange for avoiding that with marking ct->state with a pending work bit
> to flush upon user entry/exit but that's a bit more overhead so I first need to
> know about your expectations here, ie: can you tolerate such an occasional
> interruption or not?

Two points:

1) For a virtualized system, the overhead is not only of executing the
IPI but:

	VM-exit
	run VM-exit code in host
	handle IPI
	run VM-entry code in host
	VM-entry

2) Depends on the application and the definition of "occasional".

For certain types of applications (for example PLC software or
RAN processing), upon occurrence of an event, it is necessary to
complete a certain task in a maximum amount of time (deadline).

One way to express this requirement is with a pair of numbers,
deadline time and execution time, where:

       	* deadline time: length of time between event and deadline.
       	* execution time: length of time it takes for processing of event
                          to occur on a particular hardware platform
                          (uninterrupted).



