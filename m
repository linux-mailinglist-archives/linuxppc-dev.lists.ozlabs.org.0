Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7696A87C1B7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 17:59:56 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JsGMjVwv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TwYXB1Mp5z3dwr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Mar 2024 03:59:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JsGMjVwv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=alison.schofield@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Fri, 15 Mar 2024 03:59:15 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TwYWR4fQQz2ysD;
	Fri, 15 Mar 2024 03:59:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710435556; x=1741971556;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fcf8GvnNI2NlxwWa/BLBUBs674hhRLyrkoAa66D2RKo=;
  b=JsGMjVwvPci05JKMbeC9Zlu6poqISGQiABDqxA4jRp/87Gl4d4ePDxR9
   gmKfVhEe3YmKYDS8lwsVlexTLGDL6OdkCDnUZLW3T6MWujs3T+NBddzvA
   cTADnzdkeraSg8hHVDS89xNOqYXs0JJQ7hQ2vNLWeQgyo4Z0Uaz6v1dPu
   st/Z+8/f8pwRNf6QKpdmGh1c2ZsBuuWdr93n7tgKOg9RYc0bNaH569mR+
   oyL65kPHdDA8o76aNTY9YzTRlJQAb9zzBCMxMMKJOn0XBsuUWPIXNMbuE
   YJXX+tLpgKhs28D2LPWw3VPeStFqEtxX8nP4cLQFnp0MApDyLKHajA0xk
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="22731670"
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; 
   d="scan'208";a="22731670"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2024 09:58:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; 
   d="scan'208";a="16952403"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO aschofie-mobl2) ([10.209.72.214])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2024 09:57:59 -0700
Date: Thu, 14 Mar 2024 09:57:57 -0700
From: Alison Schofield <alison.schofield@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [FYI][PATCH] tracing/treewide: Remove second parameter of
 __assign_str()
Message-ID: <ZfMslbCmCtyEaEWN@aschofie-mobl2>
References: <20240223125634.2888c973@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240223125634.2888c973@gandalf.local.home>
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

On Fri, Feb 23, 2024 at 12:56:34PM -0500, Steven Rostedt wrote:
> From: "Steven Rostedt (Google)" <rostedt@goodmis.org>
> 
> [
>    This is a treewide change. I will likely re-create this patch again in
>    the second week of the merge window of v6.9 and submit it then. Hoping
>    to keep the conflicts that it will cause to a minimum.
> ]
> 
> With the rework of how the __string() handles dynamic strings where it
> saves off the source string in field in the helper structure[1], the
> assignment of that value to the trace event field is stored in the helper
> value and does not need to be passed in again.
> 
> This means that with:
> 
>   __string(field, mystring)
> 
> Which use to be assigned with __assign_str(field, mystring), no longer
> needs the second parameter and it is unused. With this, __assign_str()
> will now only get a single parameter.
> 
> There's over 700 users of __assign_str() and because coccinelle does not
> handle the TRACE_EVENT() macro I ended up using the following sed script:
> 
>   git grep -l __assign_str | while read a ; do
>       sed -e 's/\(__assign_str([^,]*[^ ,]\) *,[^;]*/\1)/' $a > /tmp/test-file;
>       mv /tmp/test-file $a;
>   done
> 
> I then searched for __assign_str() that did not end with ';' as those
> were multi line assignments that the sed script above would fail to catch.
> 
> Note, the same updates will need to be done for:
> 
>   __assign_str_len()
>   __assign_rel_str()
>   __assign_rel_str_len()
>   __assign_bitmask()
>   __assign_rel_bitmask()
>   __assign_cpumask()
>   __assign_rel_cpumask()
> 
> [1] https://lore.kernel.org/linux-trace-kernel/20240222211442.634192653@goodmis.org/
> 
> Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
> ---
>  arch/arm64/kernel/trace-events-emulation.h    |   2 +-
>  arch/powerpc/include/asm/trace.h              |   4 +-
>  arch/x86/kvm/trace.h                          |   2 +-
>  drivers/base/regmap/trace.h                   |  18 +--
>  drivers/base/trace.h                          |   2 +-
>  drivers/block/rnbd/rnbd-srv-trace.h           |  12 +-
>  drivers/cxl/core/trace.h                      |  24 ++--

snip to CXL


> diff --git a/drivers/cxl/core/trace.h b/drivers/cxl/core/trace.h
> index bdf117a33744..07ba4e033347 100644
> --- a/drivers/cxl/core/trace.h
> +++ b/drivers/cxl/core/trace.h

snip to poison

> @@ -668,8 +668,8 @@ TRACE_EVENT(cxl_poison,
>  	    ),
>  
>  	TP_fast_assign(
> -		__assign_str(memdev, dev_name(&cxlmd->dev));
> -		__assign_str(host, dev_name(cxlmd->dev.parent));
> +		__assign_str(memdev);
> +		__assign_str(host);

I think I get that the above changes work because the TP_STRUCT__entry for
these did:
	__string(memdev, dev_name(&cxlmd->dev))
	__string(host, dev_name(cxlmd->dev.parent))

>  		__entry->serial = cxlmd->cxlds->serial;
>  		__entry->overflow_ts = cxl_poison_overflow(flags, overflow_ts);
>  		__entry->dpa = cxl_poison_record_dpa(record);
> @@ -678,12 +678,12 @@ TRACE_EVENT(cxl_poison,
>  		__entry->trace_type = trace_type;
>  		__entry->flags = flags;
>  		if (region) {
> -			__assign_str(region, dev_name(&region->dev));
> +			__assign_str(region);
>  			memcpy(__entry->uuid, &region->params.uuid, 16);
>  			__entry->hpa = cxl_trace_hpa(region, cxlmd,
>  						     __entry->dpa);
>  		} else {
> -			__assign_str(region, "");
> +			__assign_str(region);
>  			memset(__entry->uuid, 0, 16);
>  			__entry->hpa = ULLONG_MAX;

For the above 2, there was no helper in TP_STRUCT__entry. A recently
posted patch is fixing that up to be __string(region, NULL) See [1],
with the actual assignment still happening in TP_fast_assign.

Does that assign logic need to move to the TP_STRUCT__entry definition
when you merge these changes? I'm not clear how much logic is able to be
included, ie like 'C' style code in the TP_STRUCT__entry.

[1]
https://lore.kernel.org/linux-cxl/20240314044301.2108650-1-alison.schofield@intel.com/

Thanks for helping,
Alison


>  		}



