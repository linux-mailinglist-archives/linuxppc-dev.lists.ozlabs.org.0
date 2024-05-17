Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F588C8B84
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2024 19:48:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VgvZv3TlHz3cTd
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 May 2024 03:48:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=srs0=hfec=mu=goodmis.org=rostedt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VgvZT0b83z30TL;
	Sat, 18 May 2024 03:48:17 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 284C061DD8;
	Fri, 17 May 2024 17:48:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 424EAC2BD10;
	Fri, 17 May 2024 17:48:06 +0000 (UTC)
Date: Fri, 17 May 2024 13:48:34 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] tracing/treewide: Remove second parameter of
 __assign_str()
Message-ID: <20240517134834.43e726dd@gandalf.local.home>
In-Reply-To: <5080f4c5-e0b3-4c2e-9732-f673d7e6ca66@roeck-us.net>
References: <20240516133454.681ba6a0@rorschach.local.home>
	<5080f4c5-e0b3-4c2e-9732-f673d7e6ca66@roeck-us.net>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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
 dcom.com, Linus Torvalds <torvalds@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-wireless@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org, ath12k@lists.infradead.org, tipc-discussion@lists.sourceforge.net, Masami Hiramatsu <mhiramat@kernel.org>, netdev@vger.kernel.org, bpf@vger.kernel.org, Linux trace kernel <linux-trace-kernel@vger.kernel.org>, freedreno@lists.freedesktop.org, linux-nfs@vger.kernel.org, linux-btrfs@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 17 May 2024 10:36:37 -0700
Guenter Roeck <linux@roeck-us.net> wrote:

> Building csky:allmodconfig (and others) ... failed
> --------------
> Error log:
> In file included from include/trace/trace_events.h:419,
>                  from include/trace/define_trace.h:102,
>                  from drivers/cxl/core/trace.h:737,
>                  from drivers/cxl/core/trace.c:8:
> drivers/cxl/core/./trace.h:383:1: error: macro "__assign_str" passed 2 arguments, but takes just 1
> 
> This is with the patch applied on top of v6.9-8410-gff2632d7d08e.
> So far that seems to be the only build failure.
> Introduced with commit 6aec00139d3a8 ("cxl/core: Add region info to
> cxl_general_media and cxl_dram events"). Guess we'll see more of those
> towards the end of the commit window.

Looks like I made this patch just before this commit was pulled into
Linus's tree.

Which is why I'll apply and rerun the above again probably on Tuesday of
next week against Linus's latest.

This patch made it through both an allyesconfig and an allmodconfig, but on
the commit I had applied it to, which was:

  1b294a1f3561 ("Merge tag 'net-next-6.10' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next")

I'll be compiling those two builds after I update it then.

-- Steve
