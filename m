Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DDE69F9A6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 18:09:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PMN1P5CPKz3cMn
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 04:09:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mrFnHuFT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=nathan@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mrFnHuFT;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PMN0S1g0yz308w
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Feb 2023 04:08:40 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 055FAB815CF;
	Wed, 22 Feb 2023 17:08:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F3ADC433AA;
	Wed, 22 Feb 2023 17:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677085716;
	bh=sV8kAgrDWdRWUzDuRUayPNzruZ+Eoh/tZsg8M53c6XU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mrFnHuFT2LhfD21mbpisa4abELCS2w1IeN57yr30bYOG8T+OwHTAC4d3n1AySBr7W
	 8lSZnzKR3qZAbRWAwS9Td5GeLdFmxQPu8dqKfP5XHZ1tyKHfvwDrVOuJJwI7OlHYgv
	 Qn5tqCwRcaxN5IrAvWKEjMayOZ3i9Jd92LDfp7CKOR6hEYEUtJ/fQq0JUeOzBet7UB
	 RT3GTRkGFAL3YP3y5IDe8JPkrZXEjL04SiE7EDXNk4r5rfYWpsjbapzk7Nbz8O27SO
	 04oSHHZwsAvbzViEL6GnMuuikz2SE1YugAYbi7IZb6fPvPEYCDlD0kZtthYTG68/xP
	 0yT39pfMzG0zA==
Date: Wed, 22 Feb 2023 10:08:34 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/vmlinux.lds: Add .text.asan/tsan sections
Message-ID: <Y/ZMEqjpT6plg0nR@dev-arch.thelio-3990X>
References: <20230222060037.2897169-1-mpe@ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230222060037.2897169-1-mpe@ellerman.id.au>
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
Cc: ndesaulniers@google.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Feb 22, 2023 at 05:00:37PM +1100, Michael Ellerman wrote:
> When KASAN/KCSAN are enabled clang generates .text.asan/tsan sections.
> Because they are not mentioned in the linker script warnings are
> generated, and when orphan handling is set to error that becomes a build
> error, eg:
> 
>   ld.lld: error: vmlinux.a(init/main.o):(.text.tsan.module_ctor) is
>   being placed in '.text.tsan.module_ctor' ld.lld: error:
>   vmlinux.a(init/version.o):(.text.tsan.module_ctor) is being placed in
>   '.text.tsan.module_ctor'
> 
> Fix it by adding the sections to our linker script, similar to the
> generic change made in 848378812e40 ("vmlinux.lds.h: Handle clang's
> module.{c,d}tor sections").
> 
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Indeed, I had not thought about architectures not using the TEXT_TEXT
macro.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  arch/powerpc/kernel/vmlinux.lds.S | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
> index 958e77a24f85..7a2209767adf 100644
> --- a/arch/powerpc/kernel/vmlinux.lds.S
> +++ b/arch/powerpc/kernel/vmlinux.lds.S
> @@ -125,6 +125,7 @@ SECTIONS
>  		 * included with the main text sections, so put it by itself.
>  		 */
>  		*(.sfpr);
> +		*(.text.asan.* .text.tsan.*)
>  		MEM_KEEP(init.text)
>  		MEM_KEEP(exit.text)
>  	} :text
> -- 
> 2.39.1
> 
