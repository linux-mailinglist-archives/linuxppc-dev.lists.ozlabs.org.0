Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 733EE861C00
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Feb 2024 19:45:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ThJqJ2yPCz3vXw
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Feb 2024 05:45:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=srs0=wkxo=ka=goodmis.org=rostedt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ThJps5jyvz3dwr;
	Sat, 24 Feb 2024 05:45:09 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EF93861654;
	Fri, 23 Feb 2024 18:45:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C3ACC433C7;
	Fri, 23 Feb 2024 18:45:01 +0000 (UTC)
Date: Fri, 23 Feb 2024 13:46:53 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Subject: Re: [FYI][PATCH] tracing/treewide: Remove second parameter of
 __assign_str()
Message-ID: <20240223134653.524a5c9e@gandalf.local.home>
In-Reply-To: <0aed6cf2-17ae-45aa-b7ff-03da932ea4e0@quicinc.com>
References: <20240223125634.2888c973@gandalf.local.home>
	<0aed6cf2-17ae-45aa-b7ff-03da932ea4e0@quicinc.com>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: linux-hyperv@vger.kernel.org, linux-usb@vger.kernel.org, kvm@vger.kernel.org, dri-devel@lists.freedesktop.org, brcm80211@lists.linux.dev, ath10k@lists.infradead.org, Julia Lawall <Julia.Lawall@inria.fr>, linux-s390@vger.kernel.org, dev@openvswitch.org, linux-cifs@vger.kernel.org, linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org, io-uring@vger.kernel.org, linux-bcachefs@vger.kernel.org, iommu@lists.linux.dev, ath11k@lists.infradead.org, linux-media@vger.kernel.org, linux-wpan@vger.kernel.org, linux-pm@vger.kernel.org, selinux@vger.kernel.org, linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org, linux-erofs@lists.ozlabs.org, virtualization@lists.linux.dev, linux-sound@vger.kernel.org, linux-block@vger.kernel.org, ocfs2-devel@lists.linux.dev, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, linux-cxl@vger.kernel.org, linux-tegra@vger.kernel.org, intel-xe@lists.freedesktop.org, linux-edac@vger.kernel.org, linux-hwmon@vger.kernel.org, brcm80211-dev-list.pdl@broa
 dcom.com, Linus Torvalds <torvalds@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-wireless@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org, ath12k@lists.infradead.org, tipc-discussion@lists.sourceforge.net, Masami Hiramatsu <mhiramat@kernel.org>, netdev@vger.kernel.org, bpf@vger.kernel.org, Linux Trace Kernel <linux-trace-kernel@vger.kernel.org>, freedreno@lists.freedesktop.org, linux-nfs@vger.kernel.org, linux-btrfs@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 23 Feb 2024 10:30:45 -0800
Jeff Johnson <quic_jjohnson@quicinc.com> wrote:

> On 2/23/2024 9:56 AM, Steven Rostedt wrote:
> > From: "Steven Rostedt (Google)" <rostedt@goodmis.org>
> > 
> > [
> >    This is a treewide change. I will likely re-create this patch again in
> >    the second week of the merge window of v6.9 and submit it then. Hoping
> >    to keep the conflicts that it will cause to a minimum.
> > ]
> > 
> > With the rework of how the __string() handles dynamic strings where it
> > saves off the source string in field in the helper structure[1], the
> > assignment of that value to the trace event field is stored in the helper
> > value and does not need to be passed in again.  
> 
> Just curious if this could be done piecemeal by first changing the
> macros to be variadic macros which allows you to ignore the extra
> argument. The callers could then be modified in their separate trees.
> And then once all the callers have be merged, the macros could be
> changed to no longer be variadic.

I weighed doing that, but I think ripping off the band-aid is a better
approach. One thing I found is that leaving unused parameters in the macros
can cause bugs itself. I found one case doing my clean up, where an unused
parameter in one of the macros was bogus, and when I made it a used
parameter, it broke the build.

I think for tree-wide changes, the preferred approach is to do one big
patch at once. And since this only affects TRACE_EVENT() macros, it
hopefully would not be too much of a burden (although out of tree users may
suffer from this, but do we care?)

Now one thing I could do is to not remove the parameter, but just add:

	WARN_ON_ONCE((src) != __data_offsets->item##_ptr_);

in the __assign_str() macro to make sure that it's still the same that is
assigned. But I'm not sure how useful that is, and still causes burden to
have it. I never really liked the passing of the string in two places to
begin with.

-- Steve
