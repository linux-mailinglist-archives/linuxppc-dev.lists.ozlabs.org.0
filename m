Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 711736E01AD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Apr 2023 00:05:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PxcGD1nYgz3fTy
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Apr 2023 08:05:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Tus0xjha;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=nathan@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Tus0xjha;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PxcDt1wJYz3fS0
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Apr 2023 08:04:14 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0A3DA639BF;
	Wed, 12 Apr 2023 22:04:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB858C433EF;
	Wed, 12 Apr 2023 22:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681337050;
	bh=Cs/RuiAtC+xFvrRq6kd7R2610WkOAe2Z5xGdxRo0amU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tus0xjhaLSMviaeNmpHYGDKK7PkRXSG0vHz7VRFdjrWVsrhlEMcbKx0GJn3xYbSM6
	 4yc+DfrcpaLtZrqCf1iBTsRQapO26DLSFhIMrw2ZwLj0qbUssI3m2bvVyNrLnVRzf7
	 kaMQsmUhyiI+rWemFnhCdHsYwQvZ7V+cKFXqWllMBEDNvvASD7mN2aMtNVinXClYv/
	 zPxKkmVCnr0Ah0YVuhcs0U5HGgsI3EhpFadofHyKGgmZBeCVWRY5c59Sk4vNBY9ArZ
	 368y6dvXiL+ub+7fe5stf+IlPVDumwBxF9X5ngSlP0NUebMsZkgUddRpz8/wF4pGww
	 q8zy96u4IVlWA==
Date: Wed, 12 Apr 2023 15:04:08 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: ndesaulniers@google.com
Subject: Re: [PATCH 2/2] start_kernel: omit prevent_tail_call_optimization
 for newer toolchains
Message-ID: <20230412220408.GB1120303@dev-arch.thelio-3990X>
References: <20230412-no_stackp-v1-0-46a69b507a4b@google.com>
 <20230412-no_stackp-v1-2-46a69b507a4b@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230412-no_stackp-v1-2-46a69b507a4b@google.com>
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
Cc: llvm@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>, x86@kernel.org, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, "Borislav Petkov \(AMD\)" <bp@alien8.de>, Tom Rix <trix@redhat.com>, Miguel Ojeda <ojeda@kernel.org>, linuxppc-dev@lists.ozlabs.org, Josh Poimboeuf <jpoimboe@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 12, 2023 at 11:32:13AM -0700, ndesaulniers@google.com wrote:
> prevent_tail_call_optimization was added in
> commit a9a3ed1eff36 ("x86: Fix early boot crash on gcc-10, third try")
> to work around stack canaries getting inserted into functions that would
> initialize the stack canary in the first place.
> 
> Now that we have no_stack_protector function attribute (gcc-11+,
> clang-7+) and use it on start_kernel, remove the call to
> prevent_tail_call_optimization such that we may one day remove it
> outright.
> 
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  init/main.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/init/main.c b/init/main.c
> index 213baf7b8cb1..c8503d02dfa6 100644
> --- a/init/main.c
> +++ b/init/main.c
> @@ -1152,7 +1152,12 @@ void start_kernel(void)
>  	/* Do the rest non-__init'ed, we're now alive */
>  	arch_call_rest_init();
>  
> +	/* Avoid stack canaries in callers of boot_init_stack_canary for gcc-10
> +	 * and older.
> +	 */
> +#if !__has_attribute(__no_stack_protector__)
>  	prevent_tail_call_optimization();
> +#endif
>  }
>  
>  /* Call all constructor functions linked into the kernel. */
> 
> -- 
> 2.40.0.577.gac1e443424-goog
> 
