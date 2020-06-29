Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C4B20CC9F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jun 2020 07:56:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49wGvg2bF5zDqZm
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jun 2020 15:56:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49wGsx5s6szDqY1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jun 2020 15:55:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=BybM+kRz; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49wGsq67rhz9sQt;
 Mon, 29 Jun 2020 15:54:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1593410101;
 bh=Jh0SmCOzWGYUXyeIgZMSmN1pyztkyV9tCktpTHdG1i8=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=BybM+kRzXXhESpdzgGc8v3JB79Vlzk3vA79SnZQQwaV1CyaostawEhvEsPizyn5ni
 mjvAYZpXe9D14yRzLQkEWsiwft6LzwUmSLO89yP3t9zLEsD+h7in5CqCItOw3sUnXR
 XR+PrHFFIh1Ruw6CrJF20kEkaITEUNaIHZC08UfgEZ8Putxpw5kSYKPHNxeYkigt4c
 wbS4tjp+GQZq9Z2ufwA0RhBt6wAqdoTijQHNpLODJsGwpEFKRWcu7n9lm2IGDlK13B
 k9wjzdSQGsDp4Wip6l38PVkFqw/f9pFWx+EErzZH+ebnzKJZrzt962Cws7xNX2yiy3
 NIHL1cwW1rRiA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] kbuild: introduce ccflags-remove-y and asflags-remove-y
In-Reply-To: <20200628015041.1000002-1-masahiroy@kernel.org>
References: <20200628015041.1000002-1-masahiroy@kernel.org>
Date: Mon, 29 Jun 2020 15:57:11 +1000
Message-ID: <87imfa8le0.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Michal Marek <michal.lkml@markovi.net>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-sh@vger.kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>,
 Paul Mackerras <paulus@samba.org>, Sami Tolvanen <samitolvanen@google.com>,
 Rich Felker <dalias@libc.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Masahiro Yamada <masahiroy@kernel.org> writes:
> CFLAGS_REMOVE_<file>.o works per object, that is, there is no
> convenient way to filter out flags for every object in a directory.
>
> Add ccflags-remove-y and asflags-remove-y to make it easily.
>
> Use ccflags-remove-y to clean up some Makefiles.
>
> Suggested-by: Sami Tolvanen <samitolvanen@google.com>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  arch/arm/boot/compressed/Makefile | 6 +-----
>  arch/powerpc/xmon/Makefile        | 3 +--
>  arch/sh/boot/compressed/Makefile  | 5 +----
>  kernel/trace/Makefile             | 4 ++--
>  lib/Makefile                      | 5 +----
>  scripts/Makefile.lib              | 4 ++--
>  6 files changed, 8 insertions(+), 19 deletions(-)
>
> diff --git a/arch/powerpc/xmon/Makefile b/arch/powerpc/xmon/Makefile
> index 89c76ca35640..55cbcdd88ac0 100644
> --- a/arch/powerpc/xmon/Makefile
> +++ b/arch/powerpc/xmon/Makefile
> @@ -7,8 +7,7 @@ UBSAN_SANITIZE := n
>  KASAN_SANITIZE := n
>  
>  # Disable ftrace for the entire directory
> -ORIG_CFLAGS := $(KBUILD_CFLAGS)
> -KBUILD_CFLAGS = $(subst $(CC_FLAGS_FTRACE),,$(ORIG_CFLAGS))
> +ccflags-remove-y += $(CC_FLAGS_FTRACE)

This could be:

ccflags-remove-$(CONFIG_FUNCTION_TRACER) += $(CC_FLAGS_FTRACE)

Similar to kernel/trace/Makefile below.

I don't mind though.

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers

> diff --git a/kernel/trace/Makefile b/kernel/trace/Makefile
> index 6575bb0a0434..7492844a8b1b 100644
> --- a/kernel/trace/Makefile
> +++ b/kernel/trace/Makefile
> @@ -2,9 +2,9 @@
>  
>  # Do not instrument the tracer itself:
>  
> +ccflags-remove-$(CONFIG_FUNCTION_TRACER) += $(CC_FLAGS_FTRACE)
> +
>  ifdef CONFIG_FUNCTION_TRACER
> -ORIG_CFLAGS := $(KBUILD_CFLAGS)
> -KBUILD_CFLAGS = $(subst $(CC_FLAGS_FTRACE),,$(ORIG_CFLAGS))
>  
>  # Avoid recursion due to instrumentation.
>  KCSAN_SANITIZE := n
