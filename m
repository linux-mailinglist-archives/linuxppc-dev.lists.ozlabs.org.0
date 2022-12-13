Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E7F64B768
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Dec 2022 15:32:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NWgtX5wHJz3cBP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Dec 2022 01:32:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=Pbvo7a7K;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=Pbvo7a7K;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NWgsZ1pGgz3bXC
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Dec 2022 01:31:12 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0CA186155B;
	Tue, 13 Dec 2022 14:31:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCFAAC433EF;
	Tue, 13 Dec 2022 14:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1670941869;
	bh=ZJunwccLyP7VfyFolEsIq9RAMaZzY1QZT7UToBTpj8Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pbvo7a7K6YUmDxML3SyCX8Ld7C0Cq5pxVmHq7XJ4crSB3niF2OVpUifdz2U4pok1g
	 Ji4xJVTLktet6hT2LsWAo9IHn4hTENPIKjWDmQKkX9QypqT6cGwhM2NKEQRxVYQFT0
	 cpZMBy+F0jPXT3QB91hTkbiYzxBM0eWHyFaFd9wY=
Date: Tue, 13 Dec 2022 15:31:06 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Phil Auld <pauld@redhat.com>
Subject: Re: sched/debug: CPU hotplug operation suffers in a large cpu systems
Message-ID: <Y5iMql1nKBkukjJK@kroah.com>
References: <Y06B0pr8hpwzxEzI@li-05afa54c-330e-11b2-a85c-e3f3aa0db1e9.ibm.com>
 <Y06ISBWhJflnV+NI@kroah.com>
 <Y1jVjX9FUuUilcjA@li-05afa54c-330e-11b2-a85c-e3f3aa0db1e9.ibm.com>
 <Y1jbhCYfktL51zNB@kroah.com>
 <Y1j5cqbyZCDlyaTn@hirez.programming.kicks-ass.net>
 <Y2oozs/YgqqRV5hq@li-05afa54c-330e-11b2-a85c-e3f3aa0db1e9.ibm.com>
 <Y2pKh3H0Ukvmfuco@kroah.com>
 <Y5d+ZqdxeJD2eIHL@lorien.usersys.redhat.com>
 <Y5gaerSL8pXZcIjR@kroah.com>
 <Y5h8sqHD9/RWNeYS@lorien.usersys.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y5h8sqHD9/RWNeYS@lorien.usersys.redhat.com>
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
Cc: ritesh.list@gmail.com, vschneid@redhat.com, vincent.guittot@linaro.org, srikar@linux.vnet.ibm.com, Peter Zijlstra <peterz@infradead.org>, aneesh.kumar@linux.ibm.com, Vishal Chourasia <vishalc@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org, sshegde@linux.ibm.com, mingo@redhat.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Dec 13, 2022 at 08:22:58AM -0500, Phil Auld wrote:
> On Tue, Dec 13, 2022 at 07:23:54AM +0100 Greg Kroah-Hartman wrote:
> > On Mon, Dec 12, 2022 at 02:17:58PM -0500, Phil Auld wrote:
> > > Hi,
> > > 
> > > On Tue, Nov 08, 2022 at 01:24:39PM +0100 Greg Kroah-Hartman wrote:
> > > > On Tue, Nov 08, 2022 at 03:30:46PM +0530, Vishal Chourasia wrote:
> > > > > 
> > > > > Thanks Greg & Peter for your direction. 
> > > > > 
> > > > > While we pursue the idea of having debugfs based on kernfs, we thought about
> > > > > having a boot time parameter which would disable creating and updating of the
> > > > > sched_domain debugfs files and this would also be useful even when the kernfs
> > > > > solution kicks in, as users who may not care about these debugfs files would
> > > > > benefit from a faster CPU hotplug operation.
> > > > 
> > > > Ick, no, you would be adding a new user/kernel api that you will be
> > > > required to support for the next 20+ years.  Just to get over a
> > > > short-term issue before you solve the problem properly.
> > > 
> > > I'm not convinced moving these files from debugfs to kernfs is the right
> > > fix.  That will take it from ~50 back to ~20 _minutes_ on these systems.
> > > I don't think either of those numbers is reasonable.
> > > 
> > > The issue as I see it is the full rebuild for every change with no way to
> > > batch the changes. How about something like the below?
> > > 
> > > This puts the domains/* files under the sched_verbose flag. About the only
> > > thing under that flag now are the detailed topology discovery printks anyway
> > > so this fits together nicely.
> > > 
> > > This way the files would be off by default (assuming you don't boot with
> > > sched_verbose) and can be created at runtime by enabling verbose. Multiple
> > > changes could also be batched by disabling/makeing changes/re-enabling.
> > > 
> > > It does not create a new API, uses one that is already there.
> > 
> > The idea seems good, the implementation might need a bit of work :)
> 
> More than the one comment below? Let me know.

No idea, resubmit a working patch and I'll review it properly :)

> > > +	r = kstrtobool_from_user(ubuf, cnt, &bv);
> > > +	if (!r) {
> > > +		mutex_lock(&sched_domains_mutex);
> > > +		r = debugfs_file_get(dentry);
> > > +		if (unlikely(r))
> > > +			return r;
> > > +		sched_debug_verbose = bv;
> > > +		debugfs_file_put(dentry);
> > 
> > Why the get/put of the debugfs dentry? for just this single value?
> 
> That's what debugfs_file_write_bool() does, which is where I got that since
> that's really what this is doing. I couldn't see a good way to make this
> just call that.
> 
> I suppose the get/put may not be needed since the only way this should
> go away is under that mutex too.

Yes, it should not be needed.

> ... erm, yeah, that return is a problem ... I'll fix that.
> 
> Also, this was originally on v6.1-rc7. I can rebase when I repost but I
> didn't want to do it on a random commit so I picked (at the time) the latest
> tag.  Should I just use the head of Linux? 

Yes, or linux-next.

thanks,

greg k-h
