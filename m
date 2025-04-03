Return-Path: <linuxppc-dev+bounces-7433-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48709A7A6BC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Apr 2025 17:30:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZT5K44wz3z2yrX;
	Fri,  4 Apr 2025 02:30:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743694216;
	cv=none; b=EBpHtfhGzIQdaFSqnr2KSrRBUcasN5JKa4s0ZRgccOYqhFbijW0yu9yseSqI522je2hrAGpCwBnLG+LH9nPBjmIdKUFPnU3A39/fd48In9CsgGjYDP9QdRnPgjhN7g3/MWePai6MOzQqCyLfNvaKxeiYARgsox1gHUt3XTZ7rdsFH7ZHNemmYWXOkn5AJhNXId9/Rb1cm4y4Vgbq+HNJoXk5iKG5RXKIme8YQh5NDj2vsYxVeIUrr123wbEhTsTif3sbtqHLeSKYpoBmPJq0V+G1lI8rSo99sTcqRa5bQrMUbdiGG1+4xhE6fD4EMf3Dl07tpIs9Vhk6YTPLnZZUyg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743694216; c=relaxed/relaxed;
	bh=neHQcGTf2aeI4Bs3sL09pBkDjIzglZQShOfJSayWvoc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VYasBfJW0J8b4Ku++FbHsSKIWXbioKf13bnIrmZ9Brv/1XcLWt6jCfqPLQOLQXGgZDMmQW1XrjpPuNHZHIIR7uX8+OdjbUzQsT+QZe8IOR+QCyIx/UMOB2u6+OcgtBKH/qz26JJQXjiE/mHr/r/1O/R1HrfLU5sNdz6eGY9Xyd4pZ1PCTU7l+whKL8k+crprc2wdDq8bZgwKNai06x/DwvaZbocQcyIfSJrtIOl3Ua7B4w8EzePS5J3bD6lCcSsDKk8rDpBKX8FesnBtwUq13D05AZSvybglR35odoaXk673QOeCbXpIUFZDSz41vkUSrzessBKFDZvkfxbuiLkWtQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jMzK8cwz; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jMzK8cwz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZT5K33L7tz2yrF
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Apr 2025 02:30:15 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C0BFDA42D7D;
	Thu,  3 Apr 2025 15:24:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 569F4C4CEEB;
	Thu,  3 Apr 2025 15:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743694211;
	bh=q4ROEx0k0EcOszxzPv3EkCrjgDjbH5aqcKwGDoSp5+c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jMzK8cwzjq9uC/pC8ANF+KmdYBqLQvnFUUxyINaU6JRruJdCSamzVMRYZb6BgrQ7F
	 IHDVXZ+J6YlKCt3FetCFAXdkukDoPcYIzQ2xPJJLh2xfnX9m/ZlSxf4X6/QLuirjaN
	 U5rqIG8nevtMexftmBXD6igwydxqy3wSJNUEPZGbwcyrRwQV+vh5/MvN1IRtUW4FD2
	 oWCIWbB1j49kpVlk03Vh/e4KFemlGPSRvPm8+ouN/GlPYDFkPKgssFIlTrrMR50Dr2
	 SJCnEHW6nh8DrCxXCBRuvHku/Onj9sQhkpTagraOEjDI6WaVbXSwGLZ8PLqmuza3F/
	 Y6tsDUe4oz/Dg==
Date: Thu, 3 Apr 2025 20:56:26 +0530
From: Naveen N Rao <naveen@kernel.org>
To: Jiri Olsa <olsajiri@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, 
	Shung-Hsi Yu <shung-hsi.yu@suse.com>, Hari Bathini <hbathini@linux.ibm.com>, bpf@vger.kernel.org, 
	Michael Ellerman <mpe@ellerman.id.au>, Mark Rutland <mark.rutland@arm.com>, 
	Daniel Borkmann <daniel@iogearbox.net>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nicholas Piggin <npiggin@gmail.com>, Alexei Starovoitov <ast@kernel.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Vishal Chourasia <vishalc@linux.ibm.com>, 
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Miroslav Benes <mbenes@suse.cz>, 
	Michal =?utf-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-trace-kernel@vger.kernel.org, live-patching@vger.kernel.org, Song Liu <song@kernel.org>
Subject: Re: [BUG?] ppc64le: fentry BPF not triggered after live patch (v6.14)
Message-ID: <xcym3f3rnakaokcf55266czlm5iuh6gv32yl2hplr2hh4uknz3@jusk2mxbrcvw>
References: <rwmwrvvtg3pd7qrnt3of6dideioohwhsplancoc2gdrjran7bg@j5tqng6loymr>
 <20250331100940.3dc5e23a@gandalf.local.home>
 <Z-vgigjuor5awkh-@krava>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-vgigjuor5awkh-@krava>
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Apr 01, 2025 at 02:48:10PM +0200, Jiri Olsa wrote:
> On Mon, Mar 31, 2025 at 10:09:40AM -0400, Steven Rostedt wrote:
> > On Mon, 31 Mar 2025 21:19:36 +0800
> > Shung-Hsi Yu <shung-hsi.yu@suse.com> wrote:
> > 
> > > Hi all,
> > > 
> > > On ppc64le (v6.14, kernel config attached), I've observed that fentry
> > > BPF programs stop being invoked after the target kernel function is live
> > > patched. This occurs regardless of whether the BPF program was attached
> > > before or after the live patch. I believe fentry/fprobe on ppc64le is
> > > added with [1].
> > > 
> > > Steps to reproduce on ppc64le:
> > > - Use bpftrace (v0.10.0+) to attach a BPF program to cmdline_proc_show
> > >   with fentry (kfunc is the older name bpftrace used for fentry, used
> > >   here for max compatability)
> > > 
> > >     bpftrace -e 'kfunc:cmdline_proc_show { printf("%lld: cmdline_proc_show() called by %s\n", nsecs(), comm) }'
> > > 
> > > - Run `cat /proc/cmdline` and observe bpftrace output
> > > 
> > > - Load samples/livepatch/livepatch-sample.ko
> > > 
> > > - Run `cat /proc/cmdline` again. Observe "this has been live patched" in
> > >   output, but no new bpftrace output.
> > > 
> > > Note: once the live patching module is disabled through the sysfs interface
> > > the BPF program invocation is restored.
> > > 
> > > Is this the expected interaction between fentry BPF and live patching?
> > > On x86_64 it does _not_ happen, so I'd guess the behavior on ppc64le is
> > > unintended. Any insights appreciated.

We haven't addressed this particular interaction in the powerpc support 
for ftrace direct and BPF trampolines. Right now, live patching takes 
priority so we call the livepatch'ed function and skip further ftrace 
direct calls.

I'm curious if this works on arm64 with which we share support for 
DYNAMIC_FTRACE_WITH_CALL_OPS.

> > 
> > Hmm, I'm not sure how well BPF function attachment and live patching
> > interact. Can you see if on x86 the live patch is actually updated when a
> > BPF program is attached?
> 
> above works for me on x86, there's both 'this has been live patched'
> and bpftrace output
> 
> > 
> > Would be even more interesting to see how BPF reading the return code works
> > with live patching, as it calls the function directly from the BPF
> > trampoline. I wonder, does it call the live patched function, or does it
> > call the original one?
> 
> yes, that should work, Song fixed some time ago with:
>   00963a2e75a8 bpf: Support bpf_trampoline on functions with IPMODIFY (e.g. livepatch)

We don't support BPF_TRAMP_F_ORIG_STACK today, and I am not sure that 
will be easy to support with the out-of-line stubs we are using for 
ftrace.

Today, we support one of livepatch or a direct caller from 
ftrace_caller. Livepatch takes priority. We could call the direct caller 
first, but that will only work if it is guaranteed to call the 
livepatched function (i.e., if the direct call is to a bpf trampoline 
with BPF_TRAMP_F_CALL_ORIG). Otherwise, we will need to call the 
livepatched function after that, but we don't return to ftrace_caller 
from the livepatch handler.

Not sure which of those interactions are valid between a livepatch and a 
direct caller (with and without BPF_TRAMP_F_CALL_ORIG), and if all 
combinations of those need to be supported.


- Naveen


