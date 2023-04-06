Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D99186D97CA
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Apr 2023 15:17:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PshrK530gz3fRK
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Apr 2023 23:17:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BvExL/09;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BvExL/09;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=mtosatti@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BvExL/09;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BvExL/09;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PshqP0FBXz3f4R
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Apr 2023 23:17:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680787019;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LyLWq4qOx1xU0bxV6bHK7gb5g8imneWyvQWEYXMsdJw=;
	b=BvExL/09dC19au5pDuTOlvIuY7UDK9lDvMEuG+9TbRP4A0cPzMdGIlnPHx0yJqDGZMZdka
	a/+8hizUMP3rm4i6VwkJVFKwpMAmE4dnPtVjSRjNPR4j1tkgoTltmplTCX9n+/o7dYO9am
	ZqyZcZF3X1T7QAgF9eXJcLdFvTeCPok=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680787019;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LyLWq4qOx1xU0bxV6bHK7gb5g8imneWyvQWEYXMsdJw=;
	b=BvExL/09dC19au5pDuTOlvIuY7UDK9lDvMEuG+9TbRP4A0cPzMdGIlnPHx0yJqDGZMZdka
	a/+8hizUMP3rm4i6VwkJVFKwpMAmE4dnPtVjSRjNPR4j1tkgoTltmplTCX9n+/o7dYO9am
	ZqyZcZF3X1T7QAgF9eXJcLdFvTeCPok=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-LTw34yIZO-qtviR3tWXTcA-1; Thu, 06 Apr 2023 09:16:57 -0400
X-MC-Unique: LTw34yIZO-qtviR3tWXTcA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2EF4B857F81;
	Thu,  6 Apr 2023 13:16:55 +0000 (UTC)
Received: from tpad.localdomain (ovpn-112-2.gru2.redhat.com [10.97.112.2])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 86155C1602C;
	Thu,  6 Apr 2023 13:16:54 +0000 (UTC)
Received: by tpad.localdomain (Postfix, from userid 1000)
	id 8BB9E41306EC9; Thu,  6 Apr 2023 09:38:50 -0300 (-03)
Date: Thu, 6 Apr 2023 09:38:50 -0300
From: Marcelo Tosatti <mtosatti@redhat.com>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH 3/3] mm/mmu_gather: send tlb_remove_table_smp_sync IPI
 only to CPUs in kernel mode
Message-ID: <ZC69Wmqjdwk+I8kn@tpad>
References: <20230404134224.137038-1-ypodemsk@redhat.com>
 <20230404134224.137038-4-ypodemsk@redhat.com>
 <ZC1Q7uX4rNLg3vEg@lothringen>
 <ZC1XD/sEJY+zRujE@lothringen>
 <ZC3P3Ds/BIcpRNGr@tpad>
 <20230405195226.GB365912@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230405195226.GB365912@hirez.programming.kicks-ass.net>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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

On Wed, Apr 05, 2023 at 09:52:26PM +0200, Peter Zijlstra wrote:
> On Wed, Apr 05, 2023 at 04:45:32PM -0300, Marcelo Tosatti wrote:
> > On Wed, Apr 05, 2023 at 01:10:07PM +0200, Frederic Weisbecker wrote:
> > > On Wed, Apr 05, 2023 at 12:44:04PM +0200, Frederic Weisbecker wrote:
> > > > On Tue, Apr 04, 2023 at 04:42:24PM +0300, Yair Podemsky wrote:
> > > > > +	int state = atomic_read(&ct->state);
> > > > > +	/* will return true only for cpus in kernel space */
> > > > > +	return state & CT_STATE_MASK == CONTEXT_KERNEL;
> > > > > +}
> > > > 
> > > > Also note that this doesn't stricly prevent userspace from being interrupted.
> > > > You may well observe the CPU in kernel but it may receive the IPI later after
> > > > switching to userspace.
> > > > 
> > > > We could arrange for avoiding that with marking ct->state with a pending work bit
> > > > to flush upon user entry/exit but that's a bit more overhead so I first need to
> > > > know about your expectations here, ie: can you tolerate such an occasional
> > > > interruption or not?
> > > 
> > > Bah, actually what can we do to prevent from that racy IPI? Not much I fear...
> > 
> > Use a different mechanism other than an IPI to ensure in progress
> > __get_free_pages_fast() has finished execution.
> > 
> > Isnt this codepath slow path enough that it can use
> > synchronize_rcu_expedited?
> 
> To actually hit this path you're doing something really dodgy.

Apparently khugepaged is using the same infrastructure:

$ grep tlb_remove_table khugepaged.c 
	tlb_remove_table_sync_one();
	tlb_remove_table_sync_one();

So just enabling khugepaged will hit that path.

