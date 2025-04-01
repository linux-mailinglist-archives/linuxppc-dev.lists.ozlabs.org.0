Return-Path: <linuxppc-dev+bounces-7417-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC63A78122
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Apr 2025 19:09:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZRvc55gkxz2yVv;
	Wed,  2 Apr 2025 04:09:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1:d65d:64ff:fe57:4e05"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743527349;
	cv=none; b=aGD6MPotT9T9lu3wsnDubdP9zcHZQOvlUW9BL7Z7llyAcBE3iNOiK0KWYCeTHEJRF/XsgCpdk7XmuDM2b6M41uKwExr9cgTP9+111FGIEc9l64PBtu61hXBMAWlnaZ5w94/ROXD1zmNvgAQvonnTFeDYcUWmO4apwWeTLg+A1zmAigK9dnL/2qfmgRXLjRcOfQ0Z8+LKu8HTxKdK19cN6Bi2fFbGSFllsA8xTy7vWYhJ+G87dPva4xZDcpTjyNnchmToHZfEEDp1w0d3CbcrL+JedEfhdEGOchQAIdMmsGC5gwDrfTTFvcXnBzit2+Tw0wptIow+CmosoWwqzjZhDg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743527349; c=relaxed/relaxed;
	bh=QwFzB9rgmSr+DDy/b0Hd/aaJjyUrXEHFSgwJ+5QTAZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V1qPnJAa9iUNr0SVsOHcnTwRnJDiHZ4puCnaYSyK+WLgBAPvvMjUcyZ3hAIHHsAzH4jYVP5xN0YbCYr7Fcz2AhVSAHoNcS3pMqSsxsg1OhdlqxmWGKOIdyetrmRjglypVSDRxkjGqfWULHhjeljTH7fSZv54e1XvHf8VeB1EZbO+yhKIj2ORjJEcqnB8LN+Tq/K1WGS4ynmoNliQB/W9v1olbEe6ze7B1Ofq/h5bx/0fKhVE3juTKjbjlQQ2rKli5Kki8I5hBgqpBKj59V9298FvX3zmR+6kE+d6Xbk4cqt8JOuXRmMwZUhwpT2E/jGkudkxQOfHDrLPJAiTROH6Jg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=SkQff7ui; dkim-atps=neutral; spf=none (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=SkQff7ui;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org)
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZRvc12ZVlz2yTQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Apr 2025 04:09:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=QwFzB9rgmSr+DDy/b0Hd/aaJjyUrXEHFSgwJ+5QTAZE=; b=SkQff7ui2dNykAT/PDqf0vlSCq
	JvsCdACSYe6T3hSLfM3FS6XnoTUAWaC8QlDsGfSHAfpe3/1xMVYJjq+Ehpkz9GRAJZCdFb8EvtwBF
	iljWyv4a77vp98tDoDmbknBxwJr/Ku7C441orgCjgmX5MTGO1jD0vg5GjeLbUkjz7kfmLhYFNDD1Q
	XlvxjXhT4fRnPenmqAN0T7HKdRn6O7ymBiNQB6qVgVVnoc6IYGnALtk9chuv+O9zRJ3YCbXis/703
	u/jnLw1FwOHLiS4NfA9/hp64nCVZZHYbIfpxDLawE14K4BvpIe4Kdf2BHTdR3CHh1eLXfeo3Dtz1N
	pbzxgLSw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzf6D-00000006qiQ-3phb;
	Tue, 01 Apr 2025 17:08:30 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 1849630049D; Tue,  1 Apr 2025 19:08:29 +0200 (CEST)
Date: Tue, 1 Apr 2025 19:08:29 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Alessandro Carminati <acarmina@redhat.com>
Cc: linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Kees Cook <keescook@chromium.org>,
	Daniel Diaz <daniel.diaz@linaro.org>,
	David Gow <davidgow@google.com>,
	Arthur Grillo <arthurgrillo@riseup.net>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Maxime Ripard <mripard@kernel.org>,
	Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Guenter Roeck <linux@roeck-us.net>,
	Alessandro Carminati <alessandro.carminati@gmail.com>,
	Jani Nikula <jani.nikula@intel.com>,
	dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, loongarch@lists.linux.dev, x86@kernel.org,
	Linux Kernel Functional Testing <lkft@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>
Subject: Re: [PATCH v4 06/14] x86: Add support for suppressing warning
 backtraces
Message-ID: <20250401170829.GO5880@noisy.programming.kicks-ass.net>
References: <20250313114329.284104-1-acarmina@redhat.com>
 <20250313114329.284104-7-acarmina@redhat.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250313114329.284104-7-acarmina@redhat.com>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Mar 13, 2025 at 11:43:21AM +0000, Alessandro Carminati wrote:
> From: Guenter Roeck <linux@roeck-us.net>
> 
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
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
> ---
>  arch/x86/include/asm/bug.h | 21 ++++++++++++++++-----
>  1 file changed, 16 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/x86/include/asm/bug.h b/arch/x86/include/asm/bug.h
> index e85ac0c7c039..f6e13fc675ab 100644
> --- a/arch/x86/include/asm/bug.h
> +++ b/arch/x86/include/asm/bug.h
> @@ -35,18 +35,28 @@
>  
>  #ifdef CONFIG_DEBUG_BUGVERBOSE
>  
> +#ifdef CONFIG_KUNIT_SUPPRESS_BACKTRACE
> +# define HAVE_BUG_FUNCTION
> +# define __BUG_FUNC_PTR	__BUG_REL(%c1)
> +# define __BUG_FUNC	__func__
> +#else
> +# define __BUG_FUNC_PTR
> +# define __BUG_FUNC	NULL
> +#endif /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
> +
>  #define _BUG_FLAGS(ins, flags, extra)					\
>  do {									\
>  	asm_inline volatile("1:\t" ins "\n"				\
>  		     ".pushsection __bug_table,\"aw\"\n"		\
>  		     "2:\t" __BUG_REL(1b) "\t# bug_entry::bug_addr\n"	\
>  		     "\t"  __BUG_REL(%c0) "\t# bug_entry::file\n"	\
> -		     "\t.word %c1"        "\t# bug_entry::line\n"	\
> -		     "\t.word %c2"        "\t# bug_entry::flags\n"	\
> -		     "\t.org 2b+%c3\n"					\
> +		     "\t"  __BUG_FUNC_PTR "\t# bug_entry::function\n"	\
> +		     "\t.word %c2"        "\t# bug_entry::line\n"	\
> +		     "\t.word %c3"        "\t# bug_entry::flags\n"	\
> +		     "\t.org 2b+%c4\n"					\
>  		     ".popsection\n"					\
>  		     extra						\
> -		     : : "i" (__FILE__), "i" (__LINE__),		\
> +		     : : "i" (__FILE__), "i" (__BUG_FUNC), "i" (__LINE__),\
>  			 "i" (flags),					\
>  			 "i" (sizeof(struct bug_entry)));		\
>  } while (0)
> @@ -92,7 +102,8 @@ do {								\
>  do {								\
>  	__auto_type __flags = BUGFLAG_WARNING|(flags);		\
>  	instrumentation_begin();				\
> -	_BUG_FLAGS(ASM_UD2, __flags, ANNOTATE_REACHABLE(1b));	\
> +	if (!KUNIT_IS_SUPPRESSED_WARNING(__func__))			\
> +		_BUG_FLAGS(ASM_UD2, __flags, ANNOTATE_REACHABLE(1b));	\
>  	instrumentation_end();					\
>  } while (0)

NAK, this grows the BUG site for now appreciable reason.

