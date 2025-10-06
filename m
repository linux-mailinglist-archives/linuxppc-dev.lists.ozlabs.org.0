Return-Path: <linuxppc-dev+bounces-12676-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA75BBD4A7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 06 Oct 2025 09:59:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cgBVx2qVJz3cYG;
	Mon,  6 Oct 2025 18:59:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759737561;
	cv=none; b=gHvkEv1wfN/vbzxUtANlCDE5MStpF5ChxqE5iWvip1WPgnYZlK7iTjrhC2wrQt2ROWzaj5i1E4UIq09EbfUXZoncbgAXTthT+rmFr+/84oLcgYbYgxAOw34HgWhhzn3Q6njfjWevPGeSy26yk0TPuXDv0FD59x0sRrMmHQq6fRDSbmiuNPAWTHxX3OS8lpcMpgSFgRyxvGnwU1xv7eqMyGr22aLsOCtyMuULSazFNUT3t0VFr+uJIj5Tp4oNA6Z12Mj7ELP+keTBL/lghKwQDc+r7iYvdJAtzsT6uQsq5K2JZBpfW4oMrjl9iA0sLLUEBjprdp4wTN+XuxmcJy7WJg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759737561; c=relaxed/relaxed;
	bh=AEC4ukHdQQZJI9yZQUL20v5WTTbrFil3GTD0CLXtU48=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jqTDiLUpkh9nMSFD2ut13usTJHB1YkPPkmaSUASPx9mDBonFOhrSSrhYIvckt3kAi/jVSvJvEEgFsq3hp202t5unxYuWzG7l0I4BE6HTln6T/2g6hS28h/doc37BOKv8YsMeRqdjUP7voJfllFxbbWNTEqcuqWlFLBqM7tX8bCcdTdGbTqKqem41ONOFEgBv3a+HeyIxCbZ1sSjl1rfbGdbZX+/EVE8bnmlhATrFuEtclNWBfZseCsZJcEJfkiYcp213BSc53Txxv8eJk/s4kd5vSDradS35TyE5iTvYCuu041HjVsfzK6WhtTWBCkCZDV2SS0HFTw7TdkRupn/wNA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Uh7FPxH4; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Uh7FPxH4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cgBVw4wq1z3cDN
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Oct 2025 18:59:20 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A62C8603B6;
	Mon,  6 Oct 2025 07:59:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4493C4CEF5;
	Mon,  6 Oct 2025 07:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759737557;
	bh=xR9H+rVXuSmCG/aFcq1+uRILqW8RGM2Gf7+XvYtCszI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Uh7FPxH4RneVNbXICvn+i3fnzPJBXfNXPclLpaWSWSUYFgAM0jRULI27hyu1GhE8B
	 7X6zKOe9S3wRUfQbjXZu4r8ihMaBthA9uu0Xmf+Sq27gzI3e/SQv5/u7jqcH9DWByR
	 u1Sw7v4DFIOayWEr8mZvRlsy1ddEW5DubHbi3TCz4jkFiNJkPZ7hG2/0i0WmMxP48A
	 vfva/6tK/IqPlfsGBInRmWXjY3FgA3UXuwdp5m5Bv4MwMg+dCx3gUYTUjqGpPtgrJq
	 WgM4xJFHyEx6Y7EoXPZYxKUt3JT5T+QyBc+abbGgStqdYd1s9o66TTBpxCFlQizTa0
	 NN9Ocjn78QDHg==
Date: Mon, 6 Oct 2025 13:22:38 +0530
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
Message-ID: <amwerofvasp7ssmq3zlrjakqj5aygyrgplcqzweno4ef42tiav@uex2ildqjvx2>
References: <20251002192755.86441-1-hbathini@linux.ibm.com>
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
In-Reply-To: <20251002192755.86441-1-hbathini@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Oct 03, 2025 at 12:57:54AM +0530, Hari Bathini wrote:
> Today, livepatch takes precedence over direct_call. Instead, save the
> state and make direct_call before handling livepatch.

If we call into the BPF trampoline first and if we have 
BPF_TRAMP_F_CALL_ORIG set, does this result in the BPF trampoline 
calling the new copy of the live-patched function or the old one?

- Naveen


