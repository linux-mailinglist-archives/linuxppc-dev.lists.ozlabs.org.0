Return-Path: <linuxppc-dev+bounces-12713-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A618BC48BD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 08 Oct 2025 13:25:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4chW065g4xz3bwk;
	Wed,  8 Oct 2025 22:25:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759922742;
	cv=none; b=K7n6Jv+oGQC4TEvxe24n3+UiF37fsN4g5ZpnbFZcxJrfdPR9xWPYkdQhB/lYTd+RxqmVAR4zlRn4W5vWf57x6yJDyIPCtrTF4ympgh4bur+vtpv4tfIieP91WeDRpSfwk6ImbqLlgWuYWiHamC2rUM3zVqOo9O38/gngiJezOIIh48oC9fqFtI8ENQggyHrqls0kkRU0kJz/GMLiQJegNTGJyFcTwZo2VRl81d3Qa2cz2WMhDlG9lKUpjQG2czeNYBRSwTSOEokup4g1bFKwzs2bqehrxSq1JHi5+1rIBucMAVIckNrA+P0TtlXoINiP2jDIlMBJBalqyRyQwRkhhA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759922742; c=relaxed/relaxed;
	bh=y7J7+xvmp4L2bVtL5j3Le5VszvydlDD4VO8qHR1eVwY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ANHGZeJP16sdjsi5fu5oqq8yt3mwYRvP8XbHgOMQfpZTxz28bwLZAcI84GWyCfAscqW47o6SALW8bLFcphEO1du7RrnkI1W/CJTY9y7yHKAX7OUz/PNyNsgiuLFd37EtX/TZwb9wA8i0XXpIlBjMTidGZvoF+HjDbsvb9KFJO+VWgDT8hlg+365fxMxq3ZoQAuvJkKiRd512AYpzjRlxE3Ci5oAJKjJKP6dQyFnUOZjLuAH8WL0yy/fn76rpRXeQKcvvpIFYza9qzz069wCSsLxnChQXML0itk2cxTqkH4Subwd14LPfrbhkap7AKDTwyZ0bESfIiZUCIrEJQ63vSA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IErWHqCA; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IErWHqCA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4chW056tlJz30D3
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Oct 2025 22:25:41 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E294B61F6D;
	Wed,  8 Oct 2025 11:25:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9AE7C4CEF4;
	Wed,  8 Oct 2025 11:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759922738;
	bh=88c3sFsoUsAiJupZku1KMo3Q2xahgwOIy0yqsCJN198=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IErWHqCA6ccIxcCPwE8YbXw6DkiJYJbafos4nPLuNA+TS6FWePh2R4YkjF+ybV27D
	 sTxAA4IxJQRbATvGd7wBycDlqgFnYXYxH3Y+bB8M7E7htDh0O1dkt1wl633ky7EQBh
	 UBfuHWrgNkdFImsYk7pqZLnGRZsem9S6LKaFaoRlp4X+fh3QvrSevIxunNOdgQGDd6
	 i/8BcSl6uhGVA8LtueRygAPAla+4klwvi1ionQ/qvM/HG9nl+FKfjyb2kiQMiZpY3w
	 i74lJDrKXDrCyt5jl6h1bSCJLjF5kxL1CKBZJFOjf74oH0gDoDdj+V4z23+YTA7M9K
	 iz+O2Hiyh3gAA==
Date: Wed, 8 Oct 2025 13:43:25 +0530
From: Naveen N Rao <naveen@kernel.org>
To: Hari Bathini <hbathini@linux.ibm.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, bpf@vger.kernel.org, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Song Liu <songliubraving@fb.com>, Jiri Olsa <jolsa@kernel.org>, 
	Viktor Malik <vmalik@redhat.com>, live-patching@vger.kernel.org, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Joe Lawrence <joe.lawrence@redhat.com>, 
	Jiri Kosina <jikos@kernel.org>, linux-trace-kernel@vger.kernel.org, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Shung-Hsi Yu <shung-hsi.yu@suse.com>
Subject: Re: [PATCH] powerpc64/bpf: support direct_call on livepatch function
Message-ID: <unegysw3bihg32od7aham3npsdpm5govboo3uglorwsrjqfqfk@pbyzwwztmqtc>
References: <20251002192755.86441-1-hbathini@linux.ibm.com>
 <amwerofvasp7ssmq3zlrjakqj5aygyrgplcqzweno4ef42tiav@uex2ildqjvx2>
 <17f49a63-eccb-4075-91dd-b1f37aa762c7@linux.ibm.com>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17f49a63-eccb-4075-91dd-b1f37aa762c7@linux.ibm.com>
X-Spam-Status: No, score=0.9 required=3.0 tests=DATE_IN_PAST_03_06,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Oct 06, 2025 at 06:50:20PM +0530, Hari Bathini wrote:
> 
> 
> On 06/10/25 1:22 pm, Naveen N Rao wrote:
> > On Fri, Oct 03, 2025 at 12:57:54AM +0530, Hari Bathini wrote:
> > > Today, livepatch takes precedence over direct_call. Instead, save the
> > > state and make direct_call before handling livepatch.
> > 
> > If we call into the BPF trampoline first and if we have
> > BPF_TRAMP_F_CALL_ORIG set, does this result in the BPF trampoline
> > calling the new copy of the live-patched function or the old one?
> 
> Naveen, calls the new copy of the live-patched function..

Hmm... I'm probably missing something.

With ftrace OOL stubs, what I recall is that BPF trampoline derives the 
original function address from the OOL stub (which would be associated 
with the original function, not the livepatch one). This should mean 
that the trampoline continues to invoke the original function.


- Naveen


