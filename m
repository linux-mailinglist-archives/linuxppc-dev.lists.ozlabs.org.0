Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5FF4AFF00
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Feb 2022 22:10:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JvCGL5gCqz3cQZ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Feb 2022 08:10:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=srs0=atzj=sy=goodmis.org=rostedt@kernel.org; receiver=<UNKNOWN>)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JvCFs2LnPz2xY6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Feb 2022 08:10:25 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5C68FB81D90;
 Wed,  9 Feb 2022 21:10:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1DADC340EB;
 Wed,  9 Feb 2022 21:10:18 +0000 (UTC)
Date: Wed, 9 Feb 2022 16:10:17 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [RFC PATCH 2/3] powerpc/ftrace: Override
 ftrace_location_lookup() for MPROFILE_KERNEL
Message-ID: <20220209161017.2bbdb01a@gandalf.local.home>
In-Reply-To: <1644426751.786cjrgqey.naveen@linux.ibm.com>
References: <cover.1644216043.git.naveen.n.rao@linux.vnet.ibm.com>
 <fadc5f2a295d6cb9f590bbbdd71fc2f78bf3a085.1644216043.git.naveen.n.rao@linux.vnet.ibm.com>
 <20220207102454.41b1d6b5@gandalf.local.home>
 <1644426751.786cjrgqey.naveen@linux.ibm.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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
Cc: Daniel Borkmann <daniel@iogearbox.net>,
 Yauheni Kaliuta <yauheni.kaliuta@redhat.com>,
 Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 bpf@vger.kernel.org, Jiri Olsa <jolsa@redhat.com>,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 09 Feb 2022 17:50:09 +0000
"Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> wrote:

> However, I think we will not be able to use a fixed range.  I would like 
> to reserve instructions from function entry till the branch to 
> _mcount(), and it can be two or four instructions depending on whether a 
> function has a global entry point. For this, I am considering adding a 
> field in 'struct dyn_arch_ftrace', and a hook in ftrace_process_locs() 
> to initialize the same. I may need to override ftrace_cmp_recs().

Be careful about adding anything to dyn_arch_ftrace. powerpc already adds
the pointer to the module. Anything you add to that gets multiplied by
thousands of times (which takes up memory).

At boot up you may see something like:

  ftrace: allocating 45363 entries in 178 pages

That's 45,363 dyn_arch_ftrace structures. And each module loads their own
as well. To see how many total you have after boot up:


  # cat /sys/kernel/tracing/dyn_ftrace_total_info 
55974 pages:295 groups: 89

That's from the same kernel. Another 10,000 entries were created by modules.
(This was for x86_64)

What you may be able to do, is to add a way to look at the already saved
kallsyms, which keeps track of the function entry and exit to know how to
map an address back to the function.

   kallsyms_lookup(addr, NULL, &offset, NULL, NULL);

Should give you the offset of addr from the start of the function.

-- Steve
