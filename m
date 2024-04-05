Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD9189A437
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 20:31:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PjsNhh0f;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VB6XB21nWz3vgq
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Apr 2024 05:31:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PjsNhh0f;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=horms@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VB6WS1Zyjz3vdn
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Apr 2024 05:31:16 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 034EFCE2447;
	Fri,  5 Apr 2024 18:31:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C78FFC433F1;
	Fri,  5 Apr 2024 18:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712341871;
	bh=SpJ5IQ9UhqrJWD/qugetHjxi8hPNKx//RaZUEP7dXMk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PjsNhh0fjSHbdf2868fr6XGX0ymVpLd72hs4QqY449d2ixqqIbiOZ9KGWsTScBEdM
	 MmD6oO1ZFR5n/8XBcvJfrg+1fJuE6RWAslDhUeScY/894NlfAHOyDlBtG+Jpj6Xgim
	 AEpzgBbfrsVfqV97+U4MIZvB6mlskGvejsxy0uQkrvJ6HQBnEonvJPKwG4UwRXSFPC
	 sokGvl/2IbsBR2HRjgP5VVh/y6bBeOez+JNtA6wzhbGF/BxyaWGie9mhpM3y8Fsgqy
	 nccatqMs+mRkE11DcKuPOVmzq2/2RT6tsP9WZvm4sK8QAsHlkDj+GzXZn741rHxhYU
	 UZgSQsgWkKskQ==
Date: Fri, 5 Apr 2024 19:31:02 +0100
From: Simon Horman <horms@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v3 13/15] sh: Move defines needed for suppressing warning
 backtraces
Message-ID: <20240405183102.GU26556@kernel.org>
References: <20240403131936.787234-1-linux@roeck-us.net>
 <20240403131936.787234-14-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240403131936.787234-14-linux@roeck-us.net>
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
Cc: x86@kernel.org, loongarch@lists.linux.dev, linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org, Brendan Higgins <brendan.higgins@linux.dev>, Rich Felker <dalias@libc.org>, linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, David Airlie <airlied@gmail.com>, Arthur Grillo <arthurgrillo@riseup.net>, Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Daniel Diaz <daniel.diaz@linaro.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, linux-sh@vger.kernel.org, Naresh Kamboju <naresh.kamboju@linaro.org>, =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, Dan Carpenter <dan.carpenter@linaro.org>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, David Gow <davidgow@google.com>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Daniel Vetter <daniel@ffwll.ch>, linux-arm-kernel@lists.infrade
 ad.org, kunit-dev@googlegroups.com, linux-parisc@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 03, 2024 at 06:19:34AM -0700, Guenter Roeck wrote:
> Declaring the defines needed for suppressing warning inside
> '#ifdef CONFIG_DEBUG_BUGVERBOSE' results in a kerneldoc warning.
> 
> .../bug.h:29: warning: expecting prototype for _EMIT_BUG_ENTRY().
> 	Prototype was for HAVE_BUG_FUNCTION() instead
> 
> Move the defines above the kerneldoc entry for _EMIT_BUG_ENTRY
> to make kerneldoc happy.
> 
> Reported-by: Simon Horman <horms@kernel.org>
> Cc: Simon Horman <horms@kernel.org>
> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> Cc: Rich Felker <dalias@libc.org>
> Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> v3: Added patch. Possibly squash into previous patch.

FWIIW, this looks good to me.

>  arch/sh/include/asm/bug.h | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/sh/include/asm/bug.h b/arch/sh/include/asm/bug.h
> index 470ce6567d20..bf4947d51d69 100644
> --- a/arch/sh/include/asm/bug.h
> +++ b/arch/sh/include/asm/bug.h
> @@ -11,6 +11,15 @@
>  #define HAVE_ARCH_BUG
>  #define HAVE_ARCH_WARN_ON
>  
> +#ifdef CONFIG_DEBUG_BUGVERBOSE
> +#ifdef CONFIG_KUNIT_SUPPRESS_BACKTRACE
> +# define HAVE_BUG_FUNCTION
> +# define __BUG_FUNC_PTR	"\t.long %O2\n"
> +#else
> +# define __BUG_FUNC_PTR
> +#endif /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
> +#endif /* CONFIG_DEBUG_BUGVERBOSE */
> +
>  /**
>   * _EMIT_BUG_ENTRY
>   * %1 - __FILE__
> @@ -25,13 +34,6 @@
>   */
>  #ifdef CONFIG_DEBUG_BUGVERBOSE
>  
> -#ifdef CONFIG_KUNIT_SUPPRESS_BACKTRACE
> -# define HAVE_BUG_FUNCTION
> -# define __BUG_FUNC_PTR	"\t.long %O2\n"
> -#else
> -# define __BUG_FUNC_PTR
> -#endif /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
> -
>  #define _EMIT_BUG_ENTRY				\
>  	"\t.pushsection __bug_table,\"aw\"\n"	\
>  	"2:\t.long 1b, %O1\n"			\
> -- 
> 2.39.2
> 
