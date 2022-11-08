Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE16C62187D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Nov 2022 16:39:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N6C2X3mrWz3f37
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Nov 2022 02:39:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=2YOSsKC0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=2YOSsKC0;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N6C1Z1dbvz3c38
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Nov 2022 02:38:40 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 37DA1B81B43;
	Tue,  8 Nov 2022 15:38:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7673C4314D;
	Tue,  8 Nov 2022 15:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1667921914;
	bh=TV1sWn1Sv+7u6xiLUPX2HqlHGm1NQnC++jAOJ2OGZP8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=2YOSsKC0IzgV3p2rkoaUMxjKkOENcukiz6dCckEUM9meMskbZI5XcFLEF/img5Jb8
	 Tc1XARaLIgZ8nOCd9MoMLNFAAvBXcBBDxDm3FYAh9Sj5Sfshxi0/SUK/Q2rHsTHNPU
	 QkWO8UeHPQY4Q/TwImD+Bt6xai6iURDOAVehIzCw=
Date: Tue, 8 Nov 2022 16:38:31 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: sched/debug: CPU hotplug operation suffers in a large cpu systems
Message-ID: <Y2p39yP4gfsXWXAj@kroah.com>
References: <Y01kc4g9CVmoyOxj@hirez.programming.kicks-ass.net>
 <Y01sk3l8yCMvhvYm@kroah.com>
 <Y06B0pr8hpwzxEzI@li-05afa54c-330e-11b2-a85c-e3f3aa0db1e9.ibm.com>
 <Y06ISBWhJflnV+NI@kroah.com>
 <Y1jVjX9FUuUilcjA@li-05afa54c-330e-11b2-a85c-e3f3aa0db1e9.ibm.com>
 <Y1jbhCYfktL51zNB@kroah.com>
 <Y1j5cqbyZCDlyaTn@hirez.programming.kicks-ass.net>
 <Y2oozs/YgqqRV5hq@li-05afa54c-330e-11b2-a85c-e3f3aa0db1e9.ibm.com>
 <Y2pKh3H0Ukvmfuco@kroah.com>
 <20221108145100.GG145013@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221108145100.GG145013@linux.vnet.ibm.com>
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
Cc: ritesh.list@gmail.com, vschneid@redhat.com, vincent.guittot@linaro.org, Peter Zijlstra <peterz@infradead.org>, aneesh.kumar@linux.ibm.com, Vishal Chourasia <vishalc@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org, sshegde@linux.ibm.com, mingo@redhat.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Nov 08, 2022 at 08:21:00PM +0530, Srikar Dronamraju wrote:
> * Greg Kroah-Hartman <gregkh@linuxfoundation.org> [2022-11-08 13:24:39]:
> 
> > On Tue, Nov 08, 2022 at 03:30:46PM +0530, Vishal Chourasia wrote:
> 
> Hi Greg, 
> 
> > > 
> > > Thanks Greg & Peter for your direction. 
> > > 
> > > While we pursue the idea of having debugfs based on kernfs, we thought about
> > > having a boot time parameter which would disable creating and updating of the
> > > sched_domain debugfs files and this would also be useful even when the kernfs
> > > solution kicks in, as users who may not care about these debugfs files would
> > > benefit from a faster CPU hotplug operation.
> > 
> > Ick, no, you would be adding a new user/kernel api that you will be
> > required to support for the next 20+ years.  Just to get over a
> > short-term issue before you solve the problem properly.
> > 
> > If you really do not want these debugfs files, just disable debugfs from
> > your system.  That should be a better short-term solution, right?
> > 
> > Or better yet, disable SCHED_DEBUG, why can't you do that?
> 
> Thanks a lot for your quick inputs.
> 
> CONFIG_SCHED_DEBUG disables a lot more stuff than just updation of debugfs
> files. Information like /sys/kernel/debug/sched/debug and system-wide and
> per process wide information would be lost when that config is disabled.
> 
> Most users would still be using distribution kernels and most distribution
> kernels that I know of seem to have CONFIG_SCHED_DEBUG enabled.

Then work with the distros to remove that option if it doesn't do well
on very large systems.

Odds are they really do not want that enabled either, but that's not our
issue, that's theirs :)

> In a large system, lets say close to 2000 CPUs and we are offlining around
> 1750 CPUs. For example ppc64_cpu --smt=1  on a powerpc. Even if we move to a
> lesser overhead kernfs based implementation, we would still be creating
> files and deleting files for every CPU offline. Most users may not even be
> aware of these files. However for a few users who may be using these files
> once a while, we end up creating and deleting these files for all users. The
> overhead increases exponentially with the number of CPUs. I would assume the
> max number of CPUs are going to increase in future further.

I understand the issue, you don't have to explain it again.  The
scheduler developers like to see these files, and for them it's useful.
Perhaps for distros that is not a useful thing to have around, that's
up to them.

> Hence our approach was to reduce the overhead for those users who are sure
> they don't depend on these files. We still keep the creating of the files as
> the default approach so that others who depend on it are not going to be
> impacted.

No, you are adding a new user/kernel api to the kernel that you then
have to support for the next 20+ years because you haven't fixed the
real issue here.

I think you could have done the kernfs conversion already, it shouldn't
be that complex, right?

Note, when you do it, you might want to move away from returning a raw
dentry from debugfs calls, and instead use an opaque type "debugfs_file"
or something like that, instead, which might make this easier over time.

thanks,

greg k-h
