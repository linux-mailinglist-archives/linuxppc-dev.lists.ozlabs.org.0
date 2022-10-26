Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A1760DBB2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Oct 2022 09:02:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4My09y1tmgz3bm9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Oct 2022 18:02:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=vAaNfkKp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=vAaNfkKp;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4My0901kpmz2xYy
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Oct 2022 18:01:39 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 13DA961D52;
	Wed, 26 Oct 2022 07:01:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBF68C433D7;
	Wed, 26 Oct 2022 07:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1666767695;
	bh=4EA7mnqZIfsfgQs35vZ0Oeva6CAWg2MlREbIG63FG2w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vAaNfkKpnq6T2ATH2P1eptSG2vWxLS48UV729kmn80ggth23fKRVR16O31dRmB5xC
	 3/3oubYXCu6pzFNa3rX/Y2AIowlybdzHmSoYv7fzNEBWy7uHZublQgNzKKA3E8Iv1B
	 u/CI7+/Ptf433yt9tcoBj59n/2lidNrMgwAz9fBE=
Date: Wed, 26 Oct 2022 09:02:28 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Vishal Chourasia <vishalc@linux.vnet.ibm.com>
Subject: Re: sched/debug: CPU hotplug operation suffers in a large cpu systems
Message-ID: <Y1jbhCYfktL51zNB@kroah.com>
References: <Y01UWQL2y2r69sBX@li-05afa54c-330e-11b2-a85c-e3f3aa0db1e9.ibm.com>
 <Y01kc4g9CVmoyOxj@hirez.programming.kicks-ass.net>
 <Y01sk3l8yCMvhvYm@kroah.com>
 <Y06B0pr8hpwzxEzI@li-05afa54c-330e-11b2-a85c-e3f3aa0db1e9.ibm.com>
 <Y06ISBWhJflnV+NI@kroah.com>
 <Y1jVjX9FUuUilcjA@li-05afa54c-330e-11b2-a85c-e3f3aa0db1e9.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y1jVjX9FUuUilcjA@li-05afa54c-330e-11b2-a85c-e3f3aa0db1e9.ibm.com>
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

On Wed, Oct 26, 2022 at 12:07:01PM +0530, Vishal Chourasia wrote:
> On Tue, Oct 18, 2022 at 01:04:40PM +0200, Greg Kroah-Hartman wrote:
> 
> > Why do you need to?  What tools require these debugfs files to be
> > present?
> 
> We are not entirely sure what applications (if any) might be using this interface.

Then just disable it and see what happens :)

> > And if you only have 7-8 files per CPU, that does not seem like a lot of
> > files overall (14000-16000)?  If you only offline 1 cpu, how is removing
> > 7 or 8 files a bottleneck?  Do you really offline 1999 cpus for a 2k
> > system?
> 
> It's 7-8 files per domain per cpu, so, in a system with approx 2k cpus and five
> domains, the total file count goes above 70k-80k files. And, when we offline 1
> CPU, the entire directory is rebuilt, resulting in creation of all the files
> again.

Perhaps change the logic to not rebuild the whole thing and instead just
remove the required files?

Or as I mentioned before, you can move debugfs to use kernfs, which
should resolve most of these issues automatically.  Why not take the
time to do that which will solve the problem no matter what gets added
in the future in other subsystems?

thanks,

greg k-h
