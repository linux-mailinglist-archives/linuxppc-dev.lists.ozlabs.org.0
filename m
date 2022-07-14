Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 99FD8574C6C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jul 2022 13:47:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LkCQX47nsz3c5D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jul 2022 21:47:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=sMwnU3qb;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=EAOmilPM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=john.ogness@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=sMwnU3qb;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=EAOmilPM;
	dkim-atps=neutral
X-Greylist: delayed 8496 seconds by postgrey-1.36 at boromir; Thu, 14 Jul 2022 21:46:43 AEST
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LkCPv3TCPz30D0
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Jul 2022 21:46:43 +1000 (AEST)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1657799198;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XN6FukeOkgwZ5eOLCbkFNEc5JFvPVvJVxrDFWQ+otX8=;
	b=sMwnU3qbV+b8Wv2npTUlOowTXHkY1kWpGzJfAqV4YVCJxANkFKt2Si4xHbZdVHZmuQ8oNd
	0x/jdFnyZincBOLrzM1oqLSJBHgn1DYRWvk7MCje7WFxNFhMjYBOPe2JkfTfO4bFmPBP93
	H92QNpoVphfL8nB7nJSC06WTQrcnw51Xto2dctxivEN+iqpNKo9LyeD+O4Fwr/6fa9FGSP
	KOEMf+e1sWH0jpaQ1xDrvs7pvx/gL/1BTqEPlb7aXuoeQkxN9slCWb9gH+VAmqWfjpji0K
	ENKsk3azHFWeIvxULM6tLdAjLSDP0Rr8cMblLbJk5Hkn+h+qmYSb5EvKusB8aA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1657799198;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XN6FukeOkgwZ5eOLCbkFNEc5JFvPVvJVxrDFWQ+otX8=;
	b=EAOmilPMjV1ZoGyEoz8L/+yBYppgRVe56A9R2WG/mK2JtxNdpcOdFw9/KgUqfs0QaPEN2A
	ZlsaAKbdwL/2b0Bw==
To: Zhouyi Zhou <zhouzhouyi@gmail.com>
Subject: Re: [PATCH linux-next] powerpc: use raw_smp_processor_id in
 arch_touch_nmi_watchdog
In-Reply-To: <CAABZP2x-OiwX7-nRvdPz0NU1D5kgUoL4MQOgTqLK1KgLcrZ5DA@mail.gmail.com>
References: <20220714013131.12648-1-zhouzhouyi@gmail.com>
 <87tu7k6o7n.fsf@jogness.linutronix.de>
 <CAABZP2x-OiwX7-nRvdPz0NU1D5kgUoL4MQOgTqLK1KgLcrZ5DA@mail.gmail.com>
Date: Thu, 14 Jul 2022 13:52:37 +0206
Message-ID: <87pmi77w82.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: pmladek@suse.com, "Paul E.
 McKenney" <paulmck@kernel.org>, rcu <rcu@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Julia.Lawall@inria.fr, paulus@samba.org, lance@osuosl.org, ldufour@linux.ibm.com, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2022-07-14, Zhouyi Zhou <zhouzhouyi@gmail.com> wrote:
> Thank John for correcting me ;-)

After looking more closely, I do not think disabling migration is the
correct fix either.

The per-cpu variable @wd_timer_tb is written from 2 functions:

- watchdog_timer_interrupt() <-- irq handler
- arch_touch_nmi_watchdog()  <-- called from preemptible

Since watchdog_timer_interrupt() is called from irq context, I expect
that interrupts need to be disabled for the update in
arch_touch_nmi_watchdog(). Perhaps a using a per-cpu local_lock_t with
local_lock_irqsave() to protect write access to @wd_timer_tb?

John Ogness
