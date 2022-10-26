Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F7660DDCD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Oct 2022 11:11:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4My32f3V4cz3cFC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Oct 2022 20:11:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=T3HhDtIp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=T3HhDtIp;
	dkim-atps=neutral
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4My31d27MVz30NN
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Oct 2022 20:10:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=uh3BCm/3F38LepawwgOLWixsQrToIu+qFMWiZqKufG8=; b=T3HhDtIpYO7ka3qVlLncPuMToO
	/qhSEkFlmYHwwIZ7mkIVnwdfEQh6ClMXDkLYxfKzo8Qi+//6/pFf+atm2z9WXpe0FvZoJvuaOYUPf
	U/jRq1hz7wjEo24C8IcEk5XiIlVopfUoj+8de8maXOIwiQGaXC6vkMSGdwRW/Maj/lTcQcJY1/lzG
	1jqSLnBW/EHGDPGO1/IhzMzHSvAM4yZo63D4inLo6iluOUsR3l4ScRH5cOX8xbvbJd3sSwejjE3yB
	3BYL9wwJcYWi2zVgnd5b2C5sy9lqWO6owE6OL4fFRHtI96A2JSzz7kdpW/cmVBigu5TVPds6se56z
	l9ZBTe3g==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oncQN-006XzU-O9; Wed, 26 Oct 2022 09:10:12 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 1923730010B;
	Wed, 26 Oct 2022 11:10:11 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 013D32C268BC3; Wed, 26 Oct 2022 11:10:10 +0200 (CEST)
Date: Wed, 26 Oct 2022 11:10:10 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: sched/debug: CPU hotplug operation suffers in a large cpu systems
Message-ID: <Y1j5cqbyZCDlyaTn@hirez.programming.kicks-ass.net>
References: <Y01UWQL2y2r69sBX@li-05afa54c-330e-11b2-a85c-e3f3aa0db1e9.ibm.com>
 <Y01kc4g9CVmoyOxj@hirez.programming.kicks-ass.net>
 <Y01sk3l8yCMvhvYm@kroah.com>
 <Y06B0pr8hpwzxEzI@li-05afa54c-330e-11b2-a85c-e3f3aa0db1e9.ibm.com>
 <Y06ISBWhJflnV+NI@kroah.com>
 <Y1jVjX9FUuUilcjA@li-05afa54c-330e-11b2-a85c-e3f3aa0db1e9.ibm.com>
 <Y1jbhCYfktL51zNB@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y1jbhCYfktL51zNB@kroah.com>
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
Cc: ritesh.list@gmail.com, vschneid@redhat.com, vincent.guittot@linaro.org, srikar@linux.vnet.ibm.com, aneesh.kumar@linux.ibm.com, Vishal Chourasia <vishalc@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org, sshegde@linux.ibm.com, mingo@redhat.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 26, 2022 at 09:02:28AM +0200, Greg Kroah-Hartman wrote:
> On Wed, Oct 26, 2022 at 12:07:01PM +0530, Vishal Chourasia wrote:
> > On Tue, Oct 18, 2022 at 01:04:40PM +0200, Greg Kroah-Hartman wrote:
> > 
> > > Why do you need to?  What tools require these debugfs files to be
> > > present?
> > 
> > We are not entirely sure what applications (if any) might be using this interface.
> 
> Then just disable it and see what happens :)

It's mostly a debug interface for developers. A lot of people complained
when I moved things to debugfs, and I told them their program was broken
for a SCHED_DEBUG=n build anyway, but nobody complained about
this particular thing IIRC.

It's mostly affected by things like hotplug and cpusets, you can
discover the resulting topology by looking at these files.

Also; while we generally try and keep SCHED_DEBUG impact low, it is
still measurable; there are a number of people that run SCHED_DEBUG=n
kernels for the extra little gain.

> > > And if you only have 7-8 files per CPU, that does not seem like a lot of
> > > files overall (14000-16000)?  If you only offline 1 cpu, how is removing
> > > 7 or 8 files a bottleneck?  Do you really offline 1999 cpus for a 2k
> > > system?
> > 
> > It's 7-8 files per domain per cpu, so, in a system with approx 2k cpus and five
> > domains, the total file count goes above 70k-80k files. And, when we offline 1
> > CPU, the entire directory is rebuilt, resulting in creation of all the files
> > again.
> 
> Perhaps change the logic to not rebuild the whole thing and instead just
> remove the required files?

Unplugging a single cpu can change the topology and the other cpus might
need to be updated too.

Simplest example would be the SMT case, if you reduce from SMT>1 to SMT1
the SMT domain goes away (because a single CPU domain is as pointless as
it sounds) and that affects the CPU that remains.

Tracking all that is a pain. Simply rebuilding the whole thing is by
*far* the simplest option. And given this all is debug code, simple is
good.

> Or as I mentioned before, you can move debugfs to use kernfs, which
> should resolve most of these issues automatically.  Why not take the
> time to do that which will solve the problem no matter what gets added
> in the future in other subsystems?

This sounds like a good approach.
