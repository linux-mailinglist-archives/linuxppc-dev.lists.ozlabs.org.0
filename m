Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E79849C15
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Feb 2024 14:41:06 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=guJrPFz4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TT6wJ6R4mz3cYj
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Feb 2024 00:41:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=guJrPFz4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TT6vZ6k4qz3bpp
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Feb 2024 00:40:26 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1DC9A6104F;
	Mon,  5 Feb 2024 13:40:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 510C5C433C7;
	Mon,  5 Feb 2024 13:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707140424;
	bh=0rGna9C7OAVXRb92HyCmmLokREiLTrxudCSQUy562Uo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=guJrPFz4hKoNWPP8EoqBXwtx+C7BEJKDNV7FQdlUGLEQYnHaySHjjSGuBv8nSRpk6
	 92bgcZDEGz+U0cXZf+QKgy9G1VkCWo/IILudrhh0gGWTWHWpTSRZYI9U/ZvdPmYbpN
	 XhrQzn9LzxoN3rgQ3xKMyYfj/LK6GnL9CfzWfiw0GgXtDjy+eloCEJ8NeJpG/Kh2o+
	 kqn4d4U91YokmahvbQBaHDGCTCfVdlW13+2F7RfhsPhW5Rco322HzZoFfQcA87EEI/
	 M/2QKH+P3xA3CEClXuwbTJHKWRU/9YT23uhuaQyUwPfZxB9Lgo8lm4XeIqJONZtfwL
	 qaUZEBtKHUUFw==
Date: Mon, 5 Feb 2024 19:06:39 +0530
From: Naveen N Rao <naveen@kernel.org>
To: Benjamin Gray <bgray@linux.ibm.com>
Subject: Re: Re: [PATCH v2 1/3] powerpc/code-patching: Add generic memory
 patching
Message-ID: <wjntrevxrllo5v4q5ab52fukwoppjk37ohvbdtvv4drroa6tve@mv2v7aithhlk>
References: <20231016050147.115686-1-bgray@linux.ibm.com>
 <20231016050147.115686-2-bgray@linux.ibm.com>
 <fwqfsxpnjoa5fjsvizu6nud4joa3btnzthrb6e5h4w6eplcfxu@oezlh56opyah>
 <74e39f168c5afafd56d6ea4b2f1274bfef6a3959.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <74e39f168c5afafd56d6ea4b2f1274bfef6a3959.camel@linux.ibm.com>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Feb 05, 2024 at 01:30:46PM +1100, Benjamin Gray wrote:
> On Thu, 2023-11-30 at 15:55 +0530, Naveen N Rao wrote:
> > On Mon, Oct 16, 2023 at 04:01:45PM +1100, Benjamin Gray wrote:
> > > 
> > > diff --git a/arch/powerpc/include/asm/code-patching.h
> > > b/arch/powerpc/include/asm/code-patching.h
> > > index 3f881548fb61..7c6056bb1706 100644
> > > --- a/arch/powerpc/include/asm/code-patching.h
> > > +++ b/arch/powerpc/include/asm/code-patching.h
> > > @@ -75,6 +75,39 @@ int patch_branch(u32 *addr, unsigned long
> > > target, int flags);
> > >  int patch_instruction(u32 *addr, ppc_inst_t instr);
> > >  int raw_patch_instruction(u32 *addr, ppc_inst_t instr);
> > >  
> > > +/*
> > > + * patch_uint() and patch_ulong() should only be called on
> > > addresses where the
> > > + * patch does not cross a cacheline, otherwise it may not be
> > > flushed properly
> > > + * and mixes of new and stale data may be observed. It cannot
> > > cross a page
> > > + * boundary, as only the target page is mapped as writable.
> > 
> > Should we enforce alignment requirements, especially for
> > patch_ulong() 
> > on 64-bit powerpc? I am not sure if there are use cases for unaligned
> > 64-bit writes. That should also ensure that the write doesn't cross a
> > cacheline.
> 
> Yeah, the current description is more just the technical restrictions,
> not an endorsement of usage. If the caller isn't working with aligned
> data, it seems unlikely it would still be cacheline aligned. The caller
> should break it into 32bit patches if this is the case.
> 
> By enforce, are you suggesting a WARN_ON in the code too?

No, just detecting and returning an error code should help detect 
incorrect usage.


- Naveen

