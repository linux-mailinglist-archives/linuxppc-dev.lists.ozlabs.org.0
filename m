Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E37861D04
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Feb 2024 20:53:36 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=uWxPu15j;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ThLKp2j2Fz3vb8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Feb 2024 06:53:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=uWxPu15j;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=95.215.58.181; helo=out-181.mta1.migadu.com; envelope-from=kent.overstreet@linux.dev; receiver=lists.ozlabs.org)
X-Greylist: delayed 69 seconds by postgrey-1.37 at boromir; Sat, 24 Feb 2024 06:52:51 AEDT
Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ThLJz0G24z3f0P
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Feb 2024 06:52:50 +1100 (AEDT)
Date: Fri, 23 Feb 2024 14:50:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1708717865;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=G9nEEkfFGj8WFYt7yvHDxsoouHxXt+6aC7E5xhimc9A=;
	b=uWxPu15jxbBy5Qv8sUU4/FKz9vhwMVdq24ex7AxwdBDTkpdTty7N4oFt5H+WpItVhn5h2q
	QhDNbk6QMiXNrrlkBl7kMfsoV81d2NhOFvXWC0sVWqoHMtRJN5Tm42Zzvb2Qci9w4QIV6Q
	wpkGE4FwRbb7rZDimmKQkBl02FYhYXk=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [FYI][PATCH] tracing/treewide: Remove second parameter of
 __assign_str()
Message-ID: <qsksxrdinia3cxr52tfe4p3pafsy4biktnodlfn4vyzud73p2j@6ycnhrhzwsv6>
References: <20240223125634.2888c973@gandalf.local.home>
 <0aed6cf2-17ae-45aa-b7ff-03da932ea4e0@quicinc.com>
 <20240223134653.524a5c9e@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240223134653.524a5c9e@gandalf.local.home>
X-Migadu-Flow: FLOW_OUT
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
Cc: linux-hyperv@vger.kernel.org, kvm@vger.kernel.org, dri-devel@lists.freedesktop.org, brcm80211@lists.linux.dev, ath10k@lists.infradead.org, Julia Lawall <Julia.Lawall@inria.fr>, linux-s390@vger.kernel.org, dev@openvswitch.org, linux-cifs@vger.kernel.org, linux-bcachefs@vger.kernel.org, linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org, io-uring@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, iommu@lists.linux.dev, ath11k@lists.infradead.org, linux-media@vger.kernel.org, linux-wpan@vger.kernel.org, linux-pm@vger.kernel.org, selinux@vger.kernel.org, linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org, linux-erofs@lists.ozlabs.org, linuxppc-dev@lists.ozlabs.org, linux-sound@vger.kernel.org, virtualization@lists.linux.dev, linux-block@vger.kernel.org, ocfs2-devel@lists.linux.dev, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, linux-cxl@vger.kernel.org, linux-tegra@vger.kernel.org, intel-xe@lists.freedesktop.org, linux-edac@vger.kernel.org, linu
 x-hwmon@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.com, Jeff Johnson <quic_jjohnson@quicinc.com>, linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org, ath12k@lists.infradead.org, tipc-discussion@lists.sourceforge.net, Masami Hiramatsu <mhiramat@kernel.org>, netdev@vger.kernel.org, bpf@vger.kernel.org, Linux Trace Kernel <linux-trace-kernel@vger.kernel.org>, freedreno@lists.freedesktop.org, linux-nfs@vger.kernel.org, linux-btrfs@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Feb 23, 2024 at 01:46:53PM -0500, Steven Rostedt wrote:
> On Fri, 23 Feb 2024 10:30:45 -0800
> Jeff Johnson <quic_jjohnson@quicinc.com> wrote:
> 
> > On 2/23/2024 9:56 AM, Steven Rostedt wrote:
> > > From: "Steven Rostedt (Google)" <rostedt@goodmis.org>
> > > 
> > > [
> > >    This is a treewide change. I will likely re-create this patch again in
> > >    the second week of the merge window of v6.9 and submit it then. Hoping
> > >    to keep the conflicts that it will cause to a minimum.
> > > ]
> > > 
> > > With the rework of how the __string() handles dynamic strings where it
> > > saves off the source string in field in the helper structure[1], the
> > > assignment of that value to the trace event field is stored in the helper
> > > value and does not need to be passed in again.  
> > 
> > Just curious if this could be done piecemeal by first changing the
> > macros to be variadic macros which allows you to ignore the extra
> > argument. The callers could then be modified in their separate trees.
> > And then once all the callers have be merged, the macros could be
> > changed to no longer be variadic.
> 
> I weighed doing that, but I think ripping off the band-aid is a better
> approach. One thing I found is that leaving unused parameters in the macros
> can cause bugs itself. I found one case doing my clean up, where an unused
> parameter in one of the macros was bogus, and when I made it a used
> parameter, it broke the build.
> 
> I think for tree-wide changes, the preferred approach is to do one big
> patch at once. And since this only affects TRACE_EVENT() macros, it
> hopefully would not be too much of a burden (although out of tree users may
> suffer from this, but do we care?)

Agreed on doing it all at once, it'll be way less spam for people to
deal with.

Tangentially related though, what would make me really happy is if we
could create the string with in the TP__fast_assign() section. I have to
have a bunch of annoying wrappers right now because the string length
has to be known when we invoke the tracepoint.
