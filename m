Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FEF44D3AA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Nov 2021 09:59:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HqbJD64Syz2yp5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Nov 2021 19:59:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=ow2WLWo0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::42c;
 helo=mail-wr1-x42c.google.com; envelope-from=elver@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=ow2WLWo0; dkim-atps=neutral
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HqbHY5f0bz2xD3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Nov 2021 19:59:05 +1100 (AEDT)
Received: by mail-wr1-x42c.google.com with SMTP id w29so8525601wra.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Nov 2021 00:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=KE0Q6DOV6GHSl4Ouk9hbWg9wbGXQ6gt7NPW0dQOJ5po=;
 b=ow2WLWo0fzNtQWXrzho8EFOOTI8eLxBjTf+jcG8AZvhqn2/UGbPs3TaTtYsjmFXJBR
 hI/+h9qhlGTzfoLunaNy58FCyHoJf7KVDzzPgqyAtvt9kiNgd/RXCr7FRjr4Yr13aB2I
 bI5E1GvDElQVyaC6Y9wus0M+mmclx8lzN5m6AguJ7c/Qoh2TktBdWPX35Vav4oqRpQCx
 Odk/AB7HzDKNQAa7KACCJMwq7qPdbVAmLInbXOSwV1C4Z/kD3BET9Ach7qr1y9keFJbb
 wFQVxFmojCjeXFJxBYZ7QUZuc9tndupdqNzS4BQS/+Wxan6SIKoSuqPrcrCzjZKcSaHd
 FNcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=KE0Q6DOV6GHSl4Ouk9hbWg9wbGXQ6gt7NPW0dQOJ5po=;
 b=l1tmkD9op/72SLEwA+Jp9yqe4uHJ+0N2soZH6nTMVwxelnspZP5s1uB6dmyT2k9Zv0
 6ub8QaHby/2PYRyeLnXtFyqih6MawlwBKkSdIehKpTTZWP5k+5R1gE2htod/YZK1DDK7
 yIvtddFTNUc3uus8aqj/SiWmBvpmlAq0QwncKMFICyO99iU2BkNuZUiRNSNU4/esZ7N5
 jar1ttYMdfTIVD23I3joqat4rEePEfrfX2Z47iM8N8Nn32zywOw3XS9o10JMkSlNhHZZ
 OF5r6tsulkQwemobP9kivXTPcBAbfKkaC7ucBC55NPNz9I7kzaqKHD5d28Ogz/SvC9mM
 PshA==
X-Gm-Message-State: AOAM531rg+utRqFj2mFe/kk0xibtHwKfbAra9tIAVGpiiFwJ7qWTZV1J
 a4btKYWQaCvn+nBjyaX+uqZ0Uw==
X-Google-Smtp-Source: ABdhPJwecduRraw4fkfz7VAJRwJdCdMAJ+Qlmhhl1A91WrxY0eaZ0X3L6iML1OqupkhhfhfV2FrMZQ==
X-Received: by 2002:a05:6000:1010:: with SMTP id
 a16mr6841303wrx.155.1636621141247; 
 Thu, 11 Nov 2021 00:59:01 -0800 (PST)
Received: from elver.google.com ([2a00:79e0:15:13:fd21:69cc:1f2b:9812])
 by smtp.gmail.com with ESMTPSA id m36sm2258925wms.25.2021.11.11.00.59.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 00:59:00 -0800 (PST)
Date: Thu, 11 Nov 2021 09:58:54 +0100
From: Marco Elver <elver@google.com>
To: Valentin Schneider <valentin.schneider@arm.com>
Subject: Re: [PATCH v2 1/5] preempt: Restore preemption model selection configs
Message-ID: <YYzbTvrNQTUhgrWW@elver.google.com>
References: <20211110202448.4054153-1-valentin.schneider@arm.com>
 <20211110202448.4054153-2-valentin.schneider@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211110202448.4054153-2-valentin.schneider@arm.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
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
Cc: Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Frederic Weisbecker <frederic@kernel.org>, Mike Galbraith <efault@gmx.de>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, Paul Mackerras <paulus@samba.org>,
 Steven Rostedt <rostedt@goodmis.org>, Masahiro Yamada <masahiroy@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, Ingo Molnar <mingo@kernel.org>,
 Dmitry Vyukov <dvyukov@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 10, 2021 at 08:24PM +0000, Valentin Schneider wrote:
> Commit c597bfddc9e9 ("sched: Provide Kconfig support for default dynamic
> preempt mode") changed the selectable config names for the preemption
> model. This means a config file must now select
> 
>   CONFIG_PREEMPT_BEHAVIOUR=y
> 
> rather than
> 
>   CONFIG_PREEMPT=y
> 
> to get a preemptible kernel. This means all arch config files would need to
> be updated - right now they'll all end up with the default
> CONFIG_PREEMPT_NONE_BEHAVIOUR.
> 
> Rather than touch a good hundred of config files, restore usage of
> CONFIG_PREEMPT{_NONE, _VOLUNTARY}. Make them configure:
> o The build-time preemption model when !PREEMPT_DYNAMIC
> o The default boot-time preemption model when PREEMPT_DYNAMIC
> 
> Add siblings of those configs with the _BUILD suffix to unconditionally
> designate the build-time preemption model (PREEMPT_DYNAMIC is built with
> the "highest" preemption model it supports, aka PREEMPT). Downstream
> configs should by now all be depending / selected by CONFIG_PREEMPTION
> rather than CONFIG_PREEMPT, so only a few sites need patching up.
> 
> Signed-off-by: Valentin Schneider <valentin.schneider@arm.com>

Acked-by: Marco Elver <elver@google.com>

Much better, thank you!

> ---
>  include/linux/kernel.h   |  2 +-
>  include/linux/vermagic.h |  2 +-
>  init/Makefile            |  2 +-
>  kernel/Kconfig.preempt   | 42 ++++++++++++++++++++--------------------
>  kernel/sched/core.c      |  6 +++---
>  5 files changed, 27 insertions(+), 27 deletions(-)
> 
> diff --git a/include/linux/kernel.h b/include/linux/kernel.h
> index 2776423a587e..9c7d774ef809 100644
> --- a/include/linux/kernel.h
> +++ b/include/linux/kernel.h
> @@ -88,7 +88,7 @@
>  struct completion;
>  struct user;
>  
> -#ifdef CONFIG_PREEMPT_VOLUNTARY
> +#ifdef CONFIG_PREEMPT_VOLUNTARY_BUILD
>  
>  extern int __cond_resched(void);
>  # define might_resched() __cond_resched()
> diff --git a/include/linux/vermagic.h b/include/linux/vermagic.h
> index 1eaaa93c37bf..329d63babaeb 100644
> --- a/include/linux/vermagic.h
> +++ b/include/linux/vermagic.h
> @@ -15,7 +15,7 @@
>  #else
>  #define MODULE_VERMAGIC_SMP ""
>  #endif
> -#ifdef CONFIG_PREEMPT
> +#ifdef CONFIG_PREEMPT_BUILD
>  #define MODULE_VERMAGIC_PREEMPT "preempt "
>  #elif defined(CONFIG_PREEMPT_RT)
>  #define MODULE_VERMAGIC_PREEMPT "preempt_rt "
> diff --git a/init/Makefile b/init/Makefile
> index 2846113677ee..04eeee12c076 100644
> --- a/init/Makefile
> +++ b/init/Makefile
> @@ -30,7 +30,7 @@ $(obj)/version.o: include/generated/compile.h
>  quiet_cmd_compile.h = CHK     $@
>        cmd_compile.h = \
>  	$(CONFIG_SHELL) $(srctree)/scripts/mkcompile_h $@	\
> -	"$(UTS_MACHINE)" "$(CONFIG_SMP)" "$(CONFIG_PREEMPT)"	\
> +	"$(UTS_MACHINE)" "$(CONFIG_SMP)" "$(CONFIG_PREEMPT_BUILD)"	\
>  	"$(CONFIG_PREEMPT_RT)" $(CONFIG_CC_VERSION_TEXT) "$(LD)"
>  
>  include/generated/compile.h: FORCE
> diff --git a/kernel/Kconfig.preempt b/kernel/Kconfig.preempt
> index 60f1bfc3c7b2..ce77f0265660 100644
> --- a/kernel/Kconfig.preempt
> +++ b/kernel/Kconfig.preempt
> @@ -1,12 +1,23 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  
> +config PREEMPT_NONE_BUILD
> +	bool
> +
> +config PREEMPT_VOLUNTARY_BUILD
> +	bool
> +
> +config PREEMPT_BUILD
> +	bool
> +	select PREEMPTION
> +	select UNINLINE_SPIN_UNLOCK if !ARCH_INLINE_SPIN_UNLOCK
> +
>  choice
>  	prompt "Preemption Model"
> -	default PREEMPT_NONE_BEHAVIOUR
> +	default PREEMPT_NONE
>  
> -config PREEMPT_NONE_BEHAVIOUR
> +config PREEMPT_NONE
>  	bool "No Forced Preemption (Server)"
> -	select PREEMPT_NONE if !PREEMPT_DYNAMIC
> +	select PREEMPT_NONE_BUILD if !PREEMPT_DYNAMIC
>  	help
>  	  This is the traditional Linux preemption model, geared towards
>  	  throughput. It will still provide good latencies most of the
> @@ -18,10 +29,10 @@ config PREEMPT_NONE_BEHAVIOUR
>  	  raw processing power of the kernel, irrespective of scheduling
>  	  latencies.
>  
> -config PREEMPT_VOLUNTARY_BEHAVIOUR
> +config PREEMPT_VOLUNTARY
>  	bool "Voluntary Kernel Preemption (Desktop)"
>  	depends on !ARCH_NO_PREEMPT
> -	select PREEMPT_VOLUNTARY if !PREEMPT_DYNAMIC
> +	select PREEMPT_VOLUNTARY_BUILD if !PREEMPT_DYNAMIC
>  	help
>  	  This option reduces the latency of the kernel by adding more
>  	  "explicit preemption points" to the kernel code. These new
> @@ -37,10 +48,10 @@ config PREEMPT_VOLUNTARY_BEHAVIOUR
>  
>  	  Select this if you are building a kernel for a desktop system.
>  
> -config PREEMPT_BEHAVIOUR
> +config PREEMPT
>  	bool "Preemptible Kernel (Low-Latency Desktop)"
>  	depends on !ARCH_NO_PREEMPT
> -	select PREEMPT
> +	select PREEMPT_BUILD
>  	help
>  	  This option reduces the latency of the kernel by making
>  	  all kernel code (that is not executing in a critical section)
> @@ -58,7 +69,7 @@ config PREEMPT_BEHAVIOUR
>  
>  config PREEMPT_RT
>  	bool "Fully Preemptible Kernel (Real-Time)"
> -	depends on EXPERT && ARCH_SUPPORTS_RT && !PREEMPT_DYNAMIC
> +	depends on EXPERT && ARCH_SUPPORTS_RT
>  	select PREEMPTION
>  	help
>  	  This option turns the kernel into a real-time kernel by replacing
> @@ -75,17 +86,6 @@ config PREEMPT_RT
>  
>  endchoice
>  
> -config PREEMPT_NONE
> -	bool
> -
> -config PREEMPT_VOLUNTARY
> -	bool
> -
> -config PREEMPT
> -	bool
> -	select PREEMPTION
> -	select UNINLINE_SPIN_UNLOCK if !ARCH_INLINE_SPIN_UNLOCK
> -
>  config PREEMPT_COUNT
>         bool
>  
> @@ -95,8 +95,8 @@ config PREEMPTION
>  
>  config PREEMPT_DYNAMIC
>  	bool "Preemption behaviour defined on boot"
> -	depends on HAVE_PREEMPT_DYNAMIC
> -	select PREEMPT
> +	depends on HAVE_PREEMPT_DYNAMIC && !PREEMPT_RT
> +	select PREEMPT_BUILD
>  	default y
>  	help
>  	  This option allows to define the preemption model on the kernel
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index f2611b9cf503..97047aa7b6c2 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -6625,13 +6625,13 @@ __setup("preempt=", setup_preempt_mode);
>  static void __init preempt_dynamic_init(void)
>  {
>  	if (preempt_dynamic_mode == preempt_dynamic_undefined) {
> -		if (IS_ENABLED(CONFIG_PREEMPT_NONE_BEHAVIOUR)) {
> +		if (IS_ENABLED(CONFIG_PREEMPT_NONE)) {
>  			sched_dynamic_update(preempt_dynamic_none);
> -		} else if (IS_ENABLED(CONFIG_PREEMPT_VOLUNTARY_BEHAVIOUR)) {
> +		} else if (IS_ENABLED(CONFIG_PREEMPT_VOLUNTARY)) {
>  			sched_dynamic_update(preempt_dynamic_voluntary);
>  		} else {
>  			/* Default static call setting, nothing to do */
> -			WARN_ON_ONCE(!IS_ENABLED(CONFIG_PREEMPT_BEHAVIOUR));
> +			WARN_ON_ONCE(!IS_ENABLED(CONFIG_PREEMPT));
>  			preempt_dynamic_mode = preempt_dynamic_full;
>  			pr_info("Dynamic Preempt: full\n");
>  		}
> -- 
> 2.25.1
> 
