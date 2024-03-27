Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C09F88E6E3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 15:45:23 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HaYZUqiJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4Tww6xDwz3dSJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 01:45:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HaYZUqiJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=horms@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4TwB5N0Nz3dSJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Mar 2024 01:44:42 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CF582CE250F;
	Wed, 27 Mar 2024 14:44:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 463CDC433C7;
	Wed, 27 Mar 2024 14:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711550679;
	bh=YSLGb1GXTxnIIfhyIvC9GwAUZFGWgRDDFdTmlm4yRqw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HaYZUqiJa07VEuOX2hUbqIVTlZ8o22sLnSNBmDvYGZReqgO3lSbCQK9Or5zp1KJbR
	 JvGvc2ZghpWxbzW5dcHWLkdtr9WPLtyBcYNZCtzYkZ0aehioYwzIa2QQF4Onnok8FB
	 Wc4M/AdTqe1cmI5ouLQdACNeTQWP2vIBDKBtvzYFRBk3qaqst4TyhFgm3+FAsIAsGT
	 mP0xgnOjCX2lX877lT3Jl7cBjQZe+yHaVUg+5xWuYNjiWEBCoNJyKr1tugz+G9vCSC
	 fo6IjfObk8UjT+1n6kvF1dQ0obJmvxfW9gBCQkbrMpth/5YtLWt0cnhdydB5wLkqq1
	 8N6oSbYrk2HYQ==
Date: Wed, 27 Mar 2024 14:44:31 +0000
From: Simon Horman <horms@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2 12/14] sh: Add support for suppressing warning
 backtraces
Message-ID: <20240327144431.GL403975@kernel.org>
References: <20240325175248.1499046-1-linux@roeck-us.net>
 <20240325175248.1499046-13-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240325175248.1499046-13-linux@roeck-us.net>
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
Cc: loongarch@lists.linux.dev, linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org, Brendan Higgins <brendan.higgins@linux.dev>, linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, David Airlie <airlied@gmail.com>, Arthur Grillo <arthurgrillo@riseup.net>, Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Daniel Diaz <daniel.diaz@linaro.org>, linux-sh@vger.kernel.org, Naresh Kamboju <naresh.kamboju@linaro.org>, =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, Dan Carpenter <dan.carpenter@linaro.org>, Linux Kernel Functional Testing <lkft@linaro.org>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, David Gow <davidgow@google.com>, Daniel Vetter <daniel@ffwll.ch>, linux-arm-kernel@lists.infradead.org, kunit-dev@googlegroups.com, linux-parisc@vger.kernel.org, netdev@vger.kernel.org, linux-ker
 nel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 25, 2024 at 10:52:46AM -0700, Guenter Roeck wrote:
> Add name of functions triggering warning backtraces to the __bug_table
> object section to enable support for suppressing WARNING backtraces.
> 
> To limit image size impact, the pointer to the function name is only added
> to the __bug_table section if both CONFIG_KUNIT_SUPPRESS_BACKTRACE and
> CONFIG_DEBUG_BUGVERBOSE are enabled. Otherwise, the __func__ assembly
> parameter is replaced with a (dummy) NULL parameter to avoid an image size
> increase due to unused __func__ entries (this is necessary because __func__
> is not a define but a virtual variable).
> 
> Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
> Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> - Rebased to v6.9-rc1
> - Added Tested-by:, Acked-by:, and Reviewed-by: tags
> - Introduced KUNIT_SUPPRESS_BACKTRACE configuration option
> 
>  arch/sh/include/asm/bug.h | 26 ++++++++++++++++++++++----
>  1 file changed, 22 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/sh/include/asm/bug.h b/arch/sh/include/asm/bug.h
> index 05a485c4fabc..470ce6567d20 100644
> --- a/arch/sh/include/asm/bug.h
> +++ b/arch/sh/include/asm/bug.h
> @@ -24,21 +24,36 @@
>   * The offending file and line are encoded in the __bug_table section.
>   */
>  #ifdef CONFIG_DEBUG_BUGVERBOSE
> +
> +#ifdef CONFIG_KUNIT_SUPPRESS_BACKTRACE
> +# define HAVE_BUG_FUNCTION
> +# define __BUG_FUNC_PTR	"\t.long %O2\n"
> +#else
> +# define __BUG_FUNC_PTR
> +#endif /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
> +

Hi Guenter,

a minor nit from my side: this change results in a Kernel doc warning.

     .../bug.h:29: warning: expecting prototype for _EMIT_BUG_ENTRY(). Prototype was for HAVE_BUG_FUNCTION() instead

Perhaps either the new code should be placed above the Kernel doc,
or scripts/kernel-doc should be enhanced?

>  #define _EMIT_BUG_ENTRY				\
>  	"\t.pushsection __bug_table,\"aw\"\n"	\
>  	"2:\t.long 1b, %O1\n"			\
> -	"\t.short %O2, %O3\n"			\
> -	"\t.org 2b+%O4\n"			\
> +	__BUG_FUNC_PTR				\
> +	"\t.short %O3, %O4\n"			\
> +	"\t.org 2b+%O5\n"			\
>  	"\t.popsection\n"
>  #else
>  #define _EMIT_BUG_ENTRY				\
>  	"\t.pushsection __bug_table,\"aw\"\n"	\
>  	"2:\t.long 1b\n"			\
> -	"\t.short %O3\n"			\
> -	"\t.org 2b+%O4\n"			\
> +	"\t.short %O4\n"			\
> +	"\t.org 2b+%O5\n"			\
>  	"\t.popsection\n"
>  #endif
>  
> +#ifdef HAVE_BUG_FUNCTION
> +# define __BUG_FUNC	__func__
> +#else
> +# define __BUG_FUNC	NULL
> +#endif
> +
>  #define BUG()						\
>  do {							\
>  	__asm__ __volatile__ (				\

...
