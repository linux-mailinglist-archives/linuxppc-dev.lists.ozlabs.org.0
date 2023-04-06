Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3A56D97D4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Apr 2023 15:18:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PshsG1kq0z3fTf
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Apr 2023 23:18:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZfVeh5HW;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Efid/otI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=mtosatti@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZfVeh5HW;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Efid/otI;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PshqR2XNfz3f4R
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Apr 2023 23:17:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680787023;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rEZb6SaUsngmnCMPg4YGowc9TbgaZEBXr+mRqfM4dbw=;
	b=ZfVeh5HWD5OO0bu/XR72lsVK2ymu9iISJZWfMZOfkZgPJFtI7b5DuemAYbFWsYBQFO0Ob8
	WmyhBZ73ld7S/BC3ekVnQrH6N1kzuYoBcqfTufn6nTT6lygQkqMz3fiPKsSZfi67acjUOw
	gw/AQYHLgDvrQaYoLAZJV8gdq6tVruQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680787024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rEZb6SaUsngmnCMPg4YGowc9TbgaZEBXr+mRqfM4dbw=;
	b=Efid/otIlv1zWb4EKkOrk23R3yICnRokZgDheIj2N18W1uvCJrsR8cfRdvidWhZw8+3Lby
	AcZPhRwpnKbeR9nKhoCn7J97gdFChZlCygnLHn/gryCkTeUGbVZA5wyReFMzKJDOjJeyKS
	wB40iL5WW6tsucO/3DLOG3rTYl1/qoI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-643-10l_5oWZPX2YbGgfWqkGXw-1; Thu, 06 Apr 2023 09:16:57 -0400
X-MC-Unique: 10l_5oWZPX2YbGgfWqkGXw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2B0A9884EC0;
	Thu,  6 Apr 2023 13:16:55 +0000 (UTC)
Received: from tpad.localdomain (ovpn-112-2.gru2.redhat.com [10.97.112.2])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 82F2D2166B26;
	Thu,  6 Apr 2023 13:16:54 +0000 (UTC)
Received: by tpad.localdomain (Postfix, from userid 1000)
	id A64FC40EB07D7; Thu,  6 Apr 2023 09:49:22 -0300 (-03)
Date: Thu, 6 Apr 2023 09:49:22 -0300
From: Marcelo Tosatti <mtosatti@redhat.com>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH 3/3] mm/mmu_gather: send tlb_remove_table_smp_sync IPI
 only to CPUs in kernel mode
Message-ID: <ZC6/0hRXztNwqXg0@tpad>
References: <20230404134224.137038-1-ypodemsk@redhat.com>
 <20230404134224.137038-4-ypodemsk@redhat.com>
 <ZC1Q7uX4rNLg3vEg@lothringen>
 <ZC3PUkI7N2uEKy6v@tpad>
 <20230405195457.GC365912@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230405195457.GC365912@hirez.programming.kicks-ass.net>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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

On Wed, Apr 05, 2023 at 09:54:57PM +0200, Peter Zijlstra wrote:
> On Wed, Apr 05, 2023 at 04:43:14PM -0300, Marcelo Tosatti wrote:
> 
> > Two points:
> > 
> > 1) For a virtualized system, the overhead is not only of executing the
> > IPI but:
> > 
> > 	VM-exit
> > 	run VM-exit code in host
> > 	handle IPI
> > 	run VM-entry code in host
> > 	VM-entry
> 
> I thought we could do IPIs without VMexit these days? 

Yes, IPIs to vCPU (guest context). In this case we can consider
an IPI to the host pCPU (which requires VM-exit from guest context).

> Also virt... /me walks away.
> 
> > 2) Depends on the application and the definition of "occasional".
> > 
> > For certain types of applications (for example PLC software or
> > RAN processing), upon occurrence of an event, it is necessary to
> > complete a certain task in a maximum amount of time (deadline).
> 
> If the application is properly NOHZ_FULL and never does a kernel entry,
> it will never get that IPI. If it is a pile of shit and does kernel
> entries while it pretends to be NOHZ_FULL it gets to keep the pieces and
> no amount of crying will get me to care.

I suppose its common practice to use certain system calls in latency
sensitive applications, for example nanosleep. Some examples:

1) cyclictest		(nanosleep)
2) PLC programs		(nanosleep)

A system call does not necessarily have to take locks, does it ?

Or even if application does system calls, but runs under a VM,
then you are requiring it to never VM-exit.

This reduces the flexibility of developing such applications.



