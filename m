Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C06887C2BD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 19:32:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TwbZx6v8Yz3dVw
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Mar 2024 05:32:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=srs0=s9ux=ku=goodmis.org=rostedt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TwbZX6Bhbz3cWB;
	Fri, 15 Mar 2024 05:32:04 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E3C8C6150D;
	Thu, 14 Mar 2024 18:32:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A243FC43390;
	Thu, 14 Mar 2024 18:31:55 +0000 (UTC)
Date: Thu, 14 Mar 2024 14:34:06 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Alison Schofield <alison.schofield@intel.com>
Subject: Re: [FYI][PATCH] tracing/treewide: Remove second parameter of
 __assign_str()
Message-ID: <20240314143406.6289a060@gandalf.local.home>
In-Reply-To: <ZfMslbCmCtyEaEWN@aschofie-mobl2>
References: <20240223125634.2888c973@gandalf.local.home>
	<ZfMslbCmCtyEaEWN@aschofie-mobl2>
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

On Thu, 14 Mar 2024 09:57:57 -0700
Alison Schofield <alison.schofield@intel.com> wrote:

> On Fri, Feb 23, 2024 at 12:56:34PM -0500, Steven Rostedt wrote:
> > From: "Steven Rostedt (Google)" <rostedt@goodmis.org>
> > 
> > [
> >    This is a treewide change. I will likely re-create this patch again in
> >    the second week of the merge window of v6.9 and submit it then. Hoping
> >    to keep the conflicts that it will cause to a minimum.
> > ]

Note, change of plans. I plan on sending this in the next merge window, as
this merge window I have this patch:

  https://lore.kernel.org/linux-trace-kernel/20240312113002.00031668@gandalf.local.home/

That will warn if the source string of __string() is different than the
source string of __assign_str(). I want to make sure they are identical
before just dropping one of them.


> 
> > diff --git a/drivers/cxl/core/trace.h b/drivers/cxl/core/trace.h
> > index bdf117a33744..07ba4e033347 100644
> > --- a/drivers/cxl/core/trace.h
> > +++ b/drivers/cxl/core/trace.h  
> 
> snip to poison
> 
> > @@ -668,8 +668,8 @@ TRACE_EVENT(cxl_poison,
> >  	    ),
> >  
> >  	TP_fast_assign(
> > -		__assign_str(memdev, dev_name(&cxlmd->dev));
> > -		__assign_str(host, dev_name(cxlmd->dev.parent));
> > +		__assign_str(memdev);
> > +		__assign_str(host);  
> 
> I think I get that the above changes work because the TP_STRUCT__entry for
> these did:
> 	__string(memdev, dev_name(&cxlmd->dev))
> 	__string(host, dev_name(cxlmd->dev.parent))

That's the point. They have to be identical or you will likely bug.

The __string(name, src) is used to find the string length of src which
allocates the necessary length on the ring buffer. The __assign_str(name, src)
will copy src into the ring buffer.

Similar to:

	len = strlen(src);
	buf = malloc(len);
	strcpy(buf, str);

Where __string() is strlen() and __assign_str() is strcpy(). It doesn't
make sense to use two different strings, and if you did, it would likely be
a bug.

But the magic behind __string() does much more than just get the length of
the string, and it could easily save the pointer to the string (along with
its length) and have it copy that in the __assign_str() call, making the
src parameter of __assign_str() useless.

> 
> >  		__entry->serial = cxlmd->cxlds->serial;
> >  		__entry->overflow_ts = cxl_poison_overflow(flags, overflow_ts);
> >  		__entry->dpa = cxl_poison_record_dpa(record);
> > @@ -678,12 +678,12 @@ TRACE_EVENT(cxl_poison,
> >  		__entry->trace_type = trace_type;
> >  		__entry->flags = flags;
> >  		if (region) {
> > -			__assign_str(region, dev_name(&region->dev));
> > +			__assign_str(region);
> >  			memcpy(__entry->uuid, &region->params.uuid, 16);
> >  			__entry->hpa = cxl_trace_hpa(region, cxlmd,
> >  						     __entry->dpa);
> >  		} else {
> > -			__assign_str(region, "");
> > +			__assign_str(region);
> >  			memset(__entry->uuid, 0, 16);
> >  			__entry->hpa = ULLONG_MAX;  
> 
> For the above 2, there was no helper in TP_STRUCT__entry. A recently
> posted patch is fixing that up to be __string(region, NULL) See [1],
> with the actual assignment still happening in TP_fast_assign.

__string(region, NULL) doesn't make sense. It's like:

	len = strlen(NULL);
	buf = malloc(len);
	strcpy(buf, NULL);

??

I'll reply to that email.

-- Steve

> 
> Does that assign logic need to move to the TP_STRUCT__entry definition
> when you merge these changes? I'm not clear how much logic is able to be
> included, ie like 'C' style code in the TP_STRUCT__entry.
> 
> [1]
> https://lore.kernel.org/linux-cxl/20240314044301.2108650-1-alison.schofield@intel.com/
