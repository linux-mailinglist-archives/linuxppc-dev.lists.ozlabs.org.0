Return-Path: <linuxppc-dev+bounces-12745-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B06BBBC8CD1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 09 Oct 2025 13:28:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cj70d4w5vz2yr2;
	Thu,  9 Oct 2025 22:28:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760009297;
	cv=none; b=AiTtJWdMZ9rgcRVQPyPNLSm2vXv1jtkNPKibB56f3np/W/Se/CEqNgLyt4QmB9dXHRsoUtI4NuEfZfVbJ/4vHiK/BSLlTSmjIktywmijYHhB4ZFODjv8SKNytU2VcMPukZ1N6wVWslOuunHTCYIqxFspnfG70bLi0okasjjlIv3qkwIbkfub4IozhSPIM+/iiUL/IIGrZUTtcaoHYCwg6etc3DPzkQHPhciCT2CejRfbp9xPDFDkyxHp+BCjtUWXzaEyoysaGyOd00QA1/sk5Uh80ZXGrcxp2aTd4HOupXmTFz667gc4DznEDC5gZVKEs4sK/9bxoB9bnVVI98MkjA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760009297; c=relaxed/relaxed;
	bh=o2YsFXZPccVteIDIgmJY66xzojEk2plRpDpi6gd9FyI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TRbL2K48JRIIOxS6KnSef9SeUPkw/sbxQCQRIzqgU175PaICAuWiI08qfgr/CbifAC6x7vB0wGqJclGkkUKRcFr4IWjBJEpaDXBHUKXq46mRTNB5DUa1ebcVug0ouX5gYUdXW7Totdb6KxsymzFZBlPnaScMXvOMFMYZPwye2cPt42jJnoAEtrkEiwJ1zKRAEHkK6XxL5sgip3HoLZ5ygiuzKDkqMZ/JfNPtjE7Wi5NzKIy45XW1lhulMGWgN5e+xZLB1ISR/7owl1vZaJlPGYb3eLNdccPVpFjgQ/rE48vdEy2w86OQPzdrv4V6Da2L0ErXExK/qegVlxVsmSAnRA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uAIHBeP7; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uAIHBeP7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cj70c5NDDz2yPS
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Oct 2025 22:28:16 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C837644DDF;
	Thu,  9 Oct 2025 11:28:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B017EC4CEE7;
	Thu,  9 Oct 2025 11:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760009293;
	bh=vus6lroH0Ik++53bkVvlr40gcH/48xLsVh0shYo/QCQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uAIHBeP7h41eTgv80PY/K5DQ/2vTQZRBDMJg7zsHUdg3MtD+6LlFzY8psyqvni3Y2
	 M7vhW5I45ox0YH7BZEvdx7s4RexbCWVLN0dTDu1pQ5cZaVWhYUqGKQFkI6f0QfVwKf
	 IhMmpz/VNJpRImN0Q02baaXeiJE/c2SVmYuc5/m+0P/W6f+TvubRdadUyjkgd8Dkjo
	 M25h4fbel54wxC6ZKHAXhE38u0JJKDMgIj1UdmBXwuIbAzCQs9D4H5yjU1e3+plWmy
	 BqFwn0Fk6QwQuvCTnebsM+slRTC/szw7yypnHSI/8htSwreoJddTNYbgv1cSefhrpb
	 xtA44kz+fuQrQ==
Date: Thu, 9 Oct 2025 16:57:53 +0530
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
Message-ID: <dvvv5cytyak2iquer7d6g57ttum3qcckupyahsqsmvpzfjbyni@wbsr77swnrcl>
References: <20251002192755.86441-1-hbathini@linux.ibm.com>
 <amwerofvasp7ssmq3zlrjakqj5aygyrgplcqzweno4ef42tiav@uex2ildqjvx2>
 <17f49a63-eccb-4075-91dd-b1f37aa762c7@linux.ibm.com>
 <unegysw3bihg32od7aham3npsdpm5govboo3uglorwsrjqfqfk@pbyzwwztmqtc>
 <42d72061-3d23-43db-bb02-d5f75333c924@linux.ibm.com>
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
In-Reply-To: <42d72061-3d23-43db-bb02-d5f75333c924@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Oct 09, 2025 at 11:19:45AM +0530, Hari Bathini wrote:
> 
> 
> On 08/10/25 1:43 pm, Naveen N Rao wrote:
> > On Mon, Oct 06, 2025 at 06:50:20PM +0530, Hari Bathini wrote:
> > > 
> > > 
> > > On 06/10/25 1:22 pm, Naveen N Rao wrote:
> > > > On Fri, Oct 03, 2025 at 12:57:54AM +0530, Hari Bathini wrote:
> > > > > Today, livepatch takes precedence over direct_call. Instead, save the
> > > > > state and make direct_call before handling livepatch.
> > > > 
> > > > If we call into the BPF trampoline first and if we have
> > > > BPF_TRAMP_F_CALL_ORIG set, does this result in the BPF trampoline
> > > > calling the new copy of the live-patched function or the old one?
> > > 
> > > Naveen, calls the new copy of the live-patched function..
> > 
> > Hmm... I'm probably missing something.
> > 
> > With ftrace OOL stubs, what I recall is that BPF trampoline derives the
> > original function address from the OOL stub (which would be associated
> > with the original function, not the livepatch one).
> 
> Trampoline derives the address from LR.

Does it? I'm referring to BPF_TRAMP_F_CALL_ORIG handling in 
__arch_prepare_bpf_trampoline(). LR at BPF trampoline entry points at 
the ftrace OOL stub. We recover the "real LR" pointing to the function 
being traced from there so that we can call into it from within the BPF 
trampoline.

- Naveen


