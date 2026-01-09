Return-Path: <linuxppc-dev+bounces-15457-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4427D0A80A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 09 Jan 2026 14:52:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dnjrW4p1rz2y6G;
	Sat, 10 Jan 2026 00:52:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767966747;
	cv=none; b=SNh++w0dp+FbXBFJkgjM2yaFzskwmYYt0Wzq1JknfIeb/2LTbmS/pEwrsniMWHdoQngC6MsYXBg1IkDG5GKpjjNLIqQ3n0JvkNU1JQXL/t2mW1MngnMlJB5AxA1kEDkjpQHJ2aW68Bame8Jm981lB+kPE+swqMg7+68Ot5xEnazdIhrbNtkucpwCTCSEpajjuPoBLQ+iNx93f4RbPuo8rrsgPBbtmfJNHkJDc6in2O0oHKvT0HztroaQpz/06YeWah/LULxSlTUd9DTtKxBAQulg2Qtr749d9tNmPYztVDbi+deF1GvfcqsgVGSwvn6QMYPufEBxA0uRHgJ0Yh4hXg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767966747; c=relaxed/relaxed;
	bh=iTkKhYEHEGaXgsf29B2Gss+gPQYIS/iTxBRCSR32fXI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H8wAuKdXQIO8xSY4otJXzcw5LjWCG20Y4zVM2zWq+qB8Qediove/qqb2K4gW9OPnD+NhAnfA8Q2s9VHij4eM9KgIKuQWSsz+/y5GEW+UI/3dsQ4sMWQRTNg87nraQkTZ4+WSix0SpcBEZQPerweOUdfXZtvKrcIpfsHkbSzOa+tADd5topWhmPeZnVGk8fbZabx7liiSzgmfJT5bH2qkHTKHIKjm70MhjV7qR9PEfz+mG/N1Sl/wiNUsXc3Qkd8DRzQifECO4e56XL2IUVUeivYYry6yWpJqfhcewSSm2el3lJoriZ9wJl5f6pDNIM9UHLlrNBLcF5lhakKKDeW3LQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fBroDu6I; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fBroDu6I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dnjrV4BbCz2xP8
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Jan 2026 00:52:26 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C403243B84;
	Fri,  9 Jan 2026 13:51:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9487C4CEF1;
	Fri,  9 Jan 2026 13:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767966714;
	bh=CLZvYIsZyfLJIsGhoiYPM3t/q9SwiCeDSBIF6jrDkOE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fBroDu6IN+2tkXyeN5U5QMYb0DBexlKu0/2Zg/2VFDJQ43930saje+YN+kzqeQeX+
	 u209JM5Zc1YixNnK1OfMUFPqPon20e82wpwxDGFsYfSt5O8uoFHH24jhcLQ4tPGRGO
	 DMXvkwfXGDK6i7eSqaHWbaY9ask2AohBoxnUfqNLh/o4ZIaVnNrDMF9NicfCgpDpaK
	 6D5mmeg+QLuPthnOJh0H19g9/AihyIF5/N6+jdsICFCPKGjNOWAB5sudlV+OqWck0l
	 mhyICObKpOj1w9pYFrvQFSSpnSlyqsyFy/cH8OgmW/gwFh2Zw/27nVEbt1EPx0KMtf
	 JuCJk3+AY+Dxg==
Date: Fri, 9 Jan 2026 19:18:22 +0530
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
Message-ID: <aWEFaNhwUaRSqISq@blrnaveerao1>
References: <20251002192755.86441-1-hbathini@linux.ibm.com>
 <amwerofvasp7ssmq3zlrjakqj5aygyrgplcqzweno4ef42tiav@uex2ildqjvx2>
 <17f49a63-eccb-4075-91dd-b1f37aa762c7@linux.ibm.com>
 <unegysw3bihg32od7aham3npsdpm5govboo3uglorwsrjqfqfk@pbyzwwztmqtc>
 <42d72061-3d23-43db-bb02-d5f75333c924@linux.ibm.com>
 <dvvv5cytyak2iquer7d6g57ttum3qcckupyahsqsmvpzfjbyni@wbsr77swnrcl>
 <79946463-4742-4919-9d56-927a0a6f1c7c@linux.ibm.com>
 <nuinyo7o7uniemqqmoboctwrkkwkuv77nt7yk6td6eb3x43hv2@2lukfuvcmcko>
 <e34ddd05-d926-4eb4-b861-4bf8fd5635bb@linux.ibm.com>
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
In-Reply-To: <e34ddd05-d926-4eb4-b861-4bf8fd5635bb@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Dec 08, 2025 at 10:05:44PM +0530, Hari Bathini wrote:
> > 
> > One of the other thoughts I had was if we could stuff the function
> > address into the ftrace OOL stub. I had considered this back when I
> > implemented the OOL stubs, but didn't do it due to the extra memory
> > requirement. However, given the dance we're having to do, I'm now
> > thinking that may make sense and can simplify the code. If we can also
> > hook into livepatch, then we should be able to update the function
> > address in the stub to point to the new address and the trampoline
> > should then "just work" since it already saves/restores the TOC [We may
> > additionally have to update the function IP in _R12, but that would be a
> > minor change overall]
> > 
> > We will still need a way to restore livepatch TOC if the BPF trampoline
> > doesn't itself call into the function, but we may be able to handle that
> > if we change the return address to jump to a stub that restores the TOC
> > from the livepatch stack.
> 
> Sounds doable. Looking into a couple of other things at the moment
> though. Will try out this suggestion and get back post that.
> Having said that, your thoughts on whether the current approach
> is a viable option if bpf_get_func_ip() can be fixed somehow?

Oh, that's fine -- feel free to go with whatever approach you think 
works best.


- Naveen


