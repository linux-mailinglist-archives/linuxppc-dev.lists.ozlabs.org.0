Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A7264B7B1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Dec 2022 15:47:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NWhCm6L1rz3bqt
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Dec 2022 01:47:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MydEgHcd;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MydEgHcd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pauld@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MydEgHcd;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MydEgHcd;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NWhBq6mxMz30RG
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Dec 2022 01:46:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670942767;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TDTummWpVHLBTOI1ESXdr5O5IWYx/wuq8cEUFeith0Q=;
	b=MydEgHcdntwIlEQ1WyGs25yUPqxPTSePtowWCzl7pglpNPj+sKLzxAnWcw54po9HpD1wh6
	9wcrgBHh7ElficBW2WUXiEjT4IR7wJoBgkaCQR6Q5F89oS9MGrconCS7xT8KcLuW6GH5hH
	OQ5kquaGPKY5q2VRPu4TXY9QMeIBhGo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670942767;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TDTummWpVHLBTOI1ESXdr5O5IWYx/wuq8cEUFeith0Q=;
	b=MydEgHcdntwIlEQ1WyGs25yUPqxPTSePtowWCzl7pglpNPj+sKLzxAnWcw54po9HpD1wh6
	9wcrgBHh7ElficBW2WUXiEjT4IR7wJoBgkaCQR6Q5F89oS9MGrconCS7xT8KcLuW6GH5hH
	OQ5kquaGPKY5q2VRPu4TXY9QMeIBhGo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-532-ERimchgWPFC2iEtMqYqjZg-1; Tue, 13 Dec 2022 09:46:05 -0500
X-MC-Unique: ERimchgWPFC2iEtMqYqjZg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 786E13815D28;
	Tue, 13 Dec 2022 14:46:03 +0000 (UTC)
Received: from lorien.usersys.redhat.com (unknown [10.22.17.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BCAE9C15BA0;
	Tue, 13 Dec 2022 14:46:02 +0000 (UTC)
Date: Tue, 13 Dec 2022 09:45:58 -0500
From: Phil Auld <pauld@redhat.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: sched/debug: CPU hotplug operation suffers in a large cpu systems
Message-ID: <Y5iQJqCoxJH+GcqH@lorien.usersys.redhat.com>
References: <Y06ISBWhJflnV+NI@kroah.com>
 <Y1jVjX9FUuUilcjA@li-05afa54c-330e-11b2-a85c-e3f3aa0db1e9.ibm.com>
 <Y1jbhCYfktL51zNB@kroah.com>
 <Y1j5cqbyZCDlyaTn@hirez.programming.kicks-ass.net>
 <Y2oozs/YgqqRV5hq@li-05afa54c-330e-11b2-a85c-e3f3aa0db1e9.ibm.com>
 <Y2pKh3H0Ukvmfuco@kroah.com>
 <Y5d+ZqdxeJD2eIHL@lorien.usersys.redhat.com>
 <Y5gaerSL8pXZcIjR@kroah.com>
 <Y5h8sqHD9/RWNeYS@lorien.usersys.redhat.com>
 <Y5iMql1nKBkukjJK@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y5iMql1nKBkukjJK@kroah.com>
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
Cc: ritesh.list@gmail.com, vschneid@redhat.com, vincent.guittot@linaro.org, srikar@linux.vnet.ibm.com, Peter Zijlstra <peterz@infradead.org>, aneesh.kumar@linux.ibm.com, Vishal Chourasia <vishalc@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org, sshegde@linux.ibm.com, mingo@redhat.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Dec 13, 2022 at 03:31:06PM +0100 Greg Kroah-Hartman wrote:
> On Tue, Dec 13, 2022 at 08:22:58AM -0500, Phil Auld wrote:
> > On Tue, Dec 13, 2022 at 07:23:54AM +0100 Greg Kroah-Hartman wrote:
> > > On Mon, Dec 12, 2022 at 02:17:58PM -0500, Phil Auld wrote:
> > > > Hi,
> > > > 
> > > > On Tue, Nov 08, 2022 at 01:24:39PM +0100 Greg Kroah-Hartman wrote:
> > > > > On Tue, Nov 08, 2022 at 03:30:46PM +0530, Vishal Chourasia wrote:
> > > > > > 
> > > > > > Thanks Greg & Peter for your direction. 
> > > > > > 
> > > > > > While we pursue the idea of having debugfs based on kernfs, we thought about
> > > > > > having a boot time parameter which would disable creating and updating of the
> > > > > > sched_domain debugfs files and this would also be useful even when the kernfs
> > > > > > solution kicks in, as users who may not care about these debugfs files would
> > > > > > benefit from a faster CPU hotplug operation.
> > > > > 
> > > > > Ick, no, you would be adding a new user/kernel api that you will be
> > > > > required to support for the next 20+ years.  Just to get over a
> > > > > short-term issue before you solve the problem properly.
> > > > 
> > > > I'm not convinced moving these files from debugfs to kernfs is the right
> > > > fix.  That will take it from ~50 back to ~20 _minutes_ on these systems.
> > > > I don't think either of those numbers is reasonable.
> > > > 
> > > > The issue as I see it is the full rebuild for every change with no way to
> > > > batch the changes. How about something like the below?
> > > > 
> > > > This puts the domains/* files under the sched_verbose flag. About the only
> > > > thing under that flag now are the detailed topology discovery printks anyway
> > > > so this fits together nicely.
> > > > 
> > > > This way the files would be off by default (assuming you don't boot with
> > > > sched_verbose) and can be created at runtime by enabling verbose. Multiple
> > > > changes could also be batched by disabling/makeing changes/re-enabling.
> > > > 
> > > > It does not create a new API, uses one that is already there.
> > > 
> > > The idea seems good, the implementation might need a bit of work :)
> > 
> > More than the one comment below? Let me know.
> 
> No idea, resubmit a working patch and I'll review it properly :)
>

Will do. 


Thanks,
Phil


-- 

