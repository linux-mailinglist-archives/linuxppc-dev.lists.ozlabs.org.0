Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 906206029D5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Oct 2022 13:05:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ms9y52VRTz3drk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Oct 2022 22:05:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=QoPNgARv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=QoPNgARv;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ms9xB6Hjkz2xbK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Oct 2022 22:04:46 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F38C46150F;
	Tue, 18 Oct 2022 11:04:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3EBBC433D6;
	Tue, 18 Oct 2022 11:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1666091083;
	bh=HvjzO44pKryf0ZLXnp4RbwbKoggx9p/6gNppYwITc2k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QoPNgARvjMnTsXvVWk13br5dcOJjYsCO+YzkU9faNuCLR5+/ZwCVzvN2vM2BhLAvA
	 +79HVk5XfPpyctFeVNphwShlEpPieWPoX82qa0a9F8g/NZXnjOkmBmHdbv8oyBryoo
	 xZnx4JrbFWLq2tIWCjLDjf8yqTv/orWdH+thtoAI=
Date: Tue, 18 Oct 2022 13:04:40 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Vishal Chourasia <vishalc@linux.vnet.ibm.com>
Subject: Re: sched/debug: CPU hotplug operation suffers in a large cpu systems
Message-ID: <Y06ISBWhJflnV+NI@kroah.com>
References: <Y01UWQL2y2r69sBX@li-05afa54c-330e-11b2-a85c-e3f3aa0db1e9.ibm.com>
 <Y01kc4g9CVmoyOxj@hirez.programming.kicks-ass.net>
 <Y01sk3l8yCMvhvYm@kroah.com>
 <Y06B0pr8hpwzxEzI@li-05afa54c-330e-11b2-a85c-e3f3aa0db1e9.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y06B0pr8hpwzxEzI@li-05afa54c-330e-11b2-a85c-e3f3aa0db1e9.ibm.com>
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
Cc: ritesh.list@gmail.com, vschneid@redhat.com, vincent.guittot@linaro.org, srikar@linux.vnet.ibm.com, Peter Zijlstra <peterz@infradead.org>, aneesh.kumar@linux.ibm.com, linux-kernel@vger.kernel.org, sshegde@linux.ibm.com, mingo@redhat.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Oct 18, 2022 at 04:07:06PM +0530, Vishal Chourasia wrote:
> On Mon, Oct 17, 2022 at 04:54:11PM +0200, Greg Kroah-Hartman wrote:
> > On Mon, Oct 17, 2022 at 04:19:31PM +0200, Peter Zijlstra wrote:
> > > 
> > > +GregKH who actually knows about debugfs.
> > > 
> > > On Mon, Oct 17, 2022 at 06:40:49PM +0530, Vishal Chourasia wrote:
> > > > smt=off operation on system with 1920 CPUs is taking approx 59 mins on v5.14
> > > > versus 29 mins on v5.11 measured using:
> > > > # time ppc64_cpu --smt=off
> > > > 
> > > > 
> > > > |--------------------------------+----------------+--------------|
> > > > | method                         | sysctl         | debugfs      |
> > > > |--------------------------------+----------------+--------------|
> > > > | unregister_sysctl_table        |   0.020050 s   | NA           |
> > > > | build_sched_domains            |   3.090563 s   | 3.119130 s   |
> > > > | register_sched_domain_sysctl   |   0.065487 s   | NA           |
> > > > | update_sched_domain_debugfs    |   NA           | 2.791232 s   |
> > > > | partition_sched_domains_locked |   3.195958 s   | 5.933254 s   |
> > > > |--------------------------------+----------------+--------------|
> > > > 
> > > > Note: partition_sched_domains_locked internally calls build_sched_domains
> > > >       and calls other functions respective to what's being currently used to
> > > >       export information i.e. sysctl or debugfs
> > > > 
> > > > Above numbers are quoted from the case where we tried offlining 1 cpu in system
> > > > with 1920 online cpus.
> > > > 
> > > > From the above table, register_sched_domain_sysctl and
> > > > unregister_sysctl_table collectively took ~0.085 secs, whereas
> > > > update_sched_domain_debugfs took ~2.79 secs. 
> > > > 
> > > > Root cause:
> > > > 
> > > > The observed regression stems from the way these two pseudo-filesystems handle
> > > > creation and deletion of files and directories internally.  
> > 
> > Yes, debugfs is not optimized for speed or memory usage at all.  This
> > happens to be the first code path I have seen that cares about this for
> > debugfs files.
> > 
> > You can either work on not creating so many debugfs files (do you really
> > really need all of them all the time?)  Or you can work on moving
> > debugfs to use kernfs as the backend logic, which will save you both
> > speed and memory usage overall as kernfs is used to being used on
> > semi-fast paths.
> > 
> > Maybe do both?
> > 
> > hope this helps,
> > 
> > greg k-h
> 
> Yes, we need to create 7-8 files per domain per CPU, eventually ending up
> creating a lot of files. 

Why do you need to?  What tools require these debugfs files to be
present?

And if you only have 7-8 files per CPU, that does not seem like a lot of
files overall (14000-16000)?  If you only offline 1 cpu, how is removing
7 or 8 files a bottleneck?  Do you really offline 1999 cpus for a 2k
system?

> Is there a possibility of reverting back to /proc/sys/kernel/sched_domain/?

No, these are debugging-only things, they do not belong in /proc/

If you rely on them for real functionality, that's a different story,
but I want to know what tool uses them and for what functionality as
debugfs should never be relied on for normal operation of a system.

thanks,

greg k-h
