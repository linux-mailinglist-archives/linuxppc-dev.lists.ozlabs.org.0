Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA81C3EE465
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Aug 2021 04:32:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GpZnG4BXJz3bj5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Aug 2021 12:32:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=QafEecHq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=QafEecHq; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GpZmZ3kKBz2yN6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Aug 2021 12:31:57 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4GpZmT47K3z9sSn;
 Tue, 17 Aug 2021 12:31:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1629167514;
 bh=Sbl7iwvidphWnlv72t22to+YRD61jI5SCh+FcuNJUFM=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=QafEecHqTiJwnBHFAhE4KNbK4unc7vdxNF3JYrk7TU2aWcr5wMtoj9RVescaB1JjO
 A5EcWq54ayhgKKpWHmhb/4lhHOMrbsgpG1JKMvkFN9gSG2OhXfEd2jA1QsyShzvObO
 obhMO4uE216rUaQ74r0ch32pC2LoJoIAsyxlW2yNSOEbAcRLN8KzXgpT8yv2IjEoOH
 LKEO9QLnYx7hh9tegE8e3tS5D118mxoJIqRKiVu7tKrpNM1lTiU6XDAUN++jPP9xNz
 A9wXHJTdKfbvohdi+QBoxPzNQ9vpzlCxAct8ValJrwdByQIicIhNPpjBUC+XaWx//6
 s6wyz9WCuc7Ig==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nick Desaulniers <ndesaulniers@google.com>, Masahiro Yamada
 <masahiroy@kernel.org>
Subject: Re: [PATCH 3/7] powerpc: replace cc-option-yn uses with cc-option
In-Reply-To: <20210817002109.2736222-4-ndesaulniers@google.com>
References: <20210817002109.2736222-1-ndesaulniers@google.com>
 <20210817002109.2736222-4-ndesaulniers@google.com>
Date: Tue, 17 Aug 2021 12:31:52 +1000
Message-ID: <87a6lghkdj.fsf@mpe.ellerman.id.au>
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
Cc: linux-kbuild@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>,
 clang-built-linux@googlegroups.com, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nick Desaulniers <ndesaulniers@google.com> writes:
> cc-option-yn can be replaced with cc-option. ie.
> Checking for support:
> ifeq ($(call cc-option-yn,$(FLAG)),y)
> becomes:
> ifneq ($(call cc-option,$(FLAG)),)
>
> Checking for lack of support:
> ifeq ($(call cc-option-yn,$(FLAG)),n)
> becomes:
> ifeq ($(call cc-option,$(FLAG)),)
>
> This allows us to pursue removing cc-option-yn.
>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
>  arch/powerpc/Makefile      | 12 ++++++------
>  arch/powerpc/boot/Makefile |  5 +----
>  2 files changed, 7 insertions(+), 10 deletions(-)
>
> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> index 9aaf1abbc641..85e224536cf7 100644
> --- a/arch/powerpc/Makefile
> +++ b/arch/powerpc/Makefile
> @@ -12,12 +12,12 @@
>  # Rewritten by Cort Dougan and Paul Mackerras
>  #
>  
> -HAS_BIARCH	:= $(call cc-option-yn, -m32)
> +HAS_BIARCH	:= $(call cc-option,-m32)
>  
>  # Set default 32 bits cross compilers for vdso and boot wrapper
>  CROSS32_COMPILE ?=
>  
> -ifeq ($(HAS_BIARCH),y)
> +ifeq ($(HAS_BIARCH),-m32)

I don't love that we have to repeat "-m32" in each check.

I'm pretty sure you can use ifdef here, because HAS_BIARCH is a simple
variable (assigned with ":=").

ie, this can be:

  ifdef HAS_BIARCH


And that avoids having to spell out "-m32" everywhere.

cheers
