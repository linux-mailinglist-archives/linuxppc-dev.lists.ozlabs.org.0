Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B866E78B0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Apr 2023 13:33:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q1dvc22myz3fcy
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Apr 2023 21:33:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JesiWwm8;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JesiWwm8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=mtosatti@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JesiWwm8;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JesiWwm8;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q1db42Dpbz3g6B
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Apr 2023 21:18:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681903132;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yk2MXIcMGsqVm4bpeyyiPIAlxJgEs4vB5F4slfGpqbs=;
	b=JesiWwm86MoxvlN91FhLby7U2FlJ3qCn6md9macjXzJyRrzLtepA+3zDhQ6lNGiYuYNCRV
	7o3tZ2X4x/oXPGtRVGnuKNtlqEyUxmY5KCMwh1VMQ27tUGYbEUjC++ydsXLjDEnyt0RSIO
	fGsZUt/RWTt7LMxf/xFga+/IhsHXXWU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681903132;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yk2MXIcMGsqVm4bpeyyiPIAlxJgEs4vB5F4slfGpqbs=;
	b=JesiWwm86MoxvlN91FhLby7U2FlJ3qCn6md9macjXzJyRrzLtepA+3zDhQ6lNGiYuYNCRV
	7o3tZ2X4x/oXPGtRVGnuKNtlqEyUxmY5KCMwh1VMQ27tUGYbEUjC++ydsXLjDEnyt0RSIO
	fGsZUt/RWTt7LMxf/xFga+/IhsHXXWU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-169-jmHSCGkANleXDaHYHeFrNA-1; Wed, 19 Apr 2023 07:18:51 -0400
X-MC-Unique: jmHSCGkANleXDaHYHeFrNA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 59BDC101A54F;
	Wed, 19 Apr 2023 11:18:49 +0000 (UTC)
Received: from tpad.localdomain (ovpn-112-2.gru2.redhat.com [10.97.112.2])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 75C83492B05;
	Wed, 19 Apr 2023 11:18:48 +0000 (UTC)
Received: by tpad.localdomain (Postfix, from userid 1000)
	id C0514401344A1; Wed, 19 Apr 2023 08:01:41 -0300 (-03)
Date: Wed, 19 Apr 2023 08:01:41 -0300
From: Marcelo Tosatti <mtosatti@redhat.com>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH 3/3] mm/mmu_gather: send tlb_remove_table_smp_sync IPI
 only to CPUs in kernel mode
Message-ID: <ZD/KFW0BaG1qJr0l@tpad>
References: <20230404134224.137038-1-ypodemsk@redhat.com>
 <20230404134224.137038-4-ypodemsk@redhat.com>
 <ZC1Q7uX4rNLg3vEg@lothringen>
 <ZC3PUkI7N2uEKy6v@tpad>
 <20230405195457.GC365912@hirez.programming.kicks-ass.net>
 <ZC6/0hRXztNwqXg0@tpad>
 <20230406133206.GN386572@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230406133206.GN386572@hirez.programming.kicks-ass.net>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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
Cc: geert+renesas@glider.be, tony@atomide.com, linus.walleij@linaro.org, dave.hansen@linux.intel.com, Yair Podemsky <ypodemsk@redhat.com>, sebastian.reichel@collabora.com, linux-mm@kvack.org, hpa@zytor.com, sparclinux@vger.kernel.org, agordeev@linux.ibm.com, will@kernel.org, ardb@kernel.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, vschneid@redhat.com, arnd@arndb.de, paulmck@kernel.org, aneesh.kumar@linux.ibm.com, x86@kernel.org, linux@armlinux.org.uk, mingo@redhat.com, samitolvanen@google.com, borntraeger@linux.ibm.com, hca@linux.ibm.com, keescook@chromium.org, gor@linux.ibm.com, Frederic Weisbecker <frederic@kernel.org>, npiggin@gmail.com, rmk+kernel@armlinux.org.uk, bp@alien8.de, nick.hawkins@hpe.com, tglx@linutronix.de, jpoimboe@kernel.org, linux-arm-kernel@lists.infradead.org, alougovs@redhat.com, linux-kernel@vger.kernel.org, juerg.haefliger@canonical.com, svens@linux.ibm.com, dhildenb@redhat.com, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, davem@da
 vemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 06, 2023 at 03:32:06PM +0200, Peter Zijlstra wrote:
> On Thu, Apr 06, 2023 at 09:49:22AM -0300, Marcelo Tosatti wrote:
> 
> > > > 2) Depends on the application and the definition of "occasional".
> > > > 
> > > > For certain types of applications (for example PLC software or
> > > > RAN processing), upon occurrence of an event, it is necessary to
> > > > complete a certain task in a maximum amount of time (deadline).
> > > 
> > > If the application is properly NOHZ_FULL and never does a kernel entry,
> > > it will never get that IPI. If it is a pile of shit and does kernel
> > > entries while it pretends to be NOHZ_FULL it gets to keep the pieces and
> > > no amount of crying will get me to care.
> > 
> > I suppose its common practice to use certain system calls in latency
> > sensitive applications, for example nanosleep. Some examples:
> > 
> > 1) cyclictest		(nanosleep)
> 
> cyclictest is not a NOHZ_FULL application, if you tihnk it is, you're
> deluded.

On the field (what end-users do on production):

cyclictest runs on NOHZ_FULL cores.
PLC type programs run on NOHZ_FULL cores.

So accordingly to physical reality i observe, i am not deluded.

> > 2) PLC programs		(nanosleep)
> 
> What's a PLC? Programmable Logic Circuit?

Programmable logic controller.

> > A system call does not necessarily have to take locks, does it ?
> 
> This all is unrelated to locks

OK.

> > Or even if application does system calls, but runs under a VM,
> > then you are requiring it to never VM-exit.
> 
> That seems to be a goal for performance anyway.

Not sure what you mean.

> > This reduces the flexibility of developing such applications.
> 
> Yeah, that's the cards you're dealt, deal with it.

This is not what happens on the field. 

