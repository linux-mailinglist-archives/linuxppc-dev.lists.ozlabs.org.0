Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F651189C4B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 13:50:48 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48j8z86SqvzDqD8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 23:50:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48j8ns0rQQzDqw6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Mar 2020 23:42:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=FvZrkmT9; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 48j8nq63bYz8tJ4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Mar 2020 23:42:39 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 48j8nq4cTsz9sRf; Wed, 18 Mar 2020 23:42:39 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=FvZrkmT9; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 48j8nq2Tzpz9sRN
 for <linuxppc-dev@ozlabs.org>; Wed, 18 Mar 2020 23:42:37 +1100 (AEDT)
Received: by mail-pl1-x644.google.com with SMTP id f16so11146429plj.4
 for <linuxppc-dev@ozlabs.org>; Wed, 18 Mar 2020 05:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=7D9zf6Jw+jxFm/iVURDegz6bbWnw4F9S60sxCcEdPPM=;
 b=FvZrkmT9JtzSX5L1HAulFDaQrLOwTVdXhr1sbfuINqtXc0pto93XYCSqATiSRgPqPC
 7eF49udMYvbhffCp8DWv/2XuCEueYYiZ3xUkRQHL8KGzhy2OirsSClC57MqlWC8C13zv
 KXzOI0V3Crw5XHtma4T4W54M8TobrLrxi4ack=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=7D9zf6Jw+jxFm/iVURDegz6bbWnw4F9S60sxCcEdPPM=;
 b=DtRT4IPz88FzNRBMYAxpO3TqzctGt4sg2LJr60aTGKjgq/gBvetePSppsWNlrE9MUF
 VumFyUXn4LiidsystfbVkAgjytox+ZendHVXTG6XGCB6uC8wrvYr2apydv0m68VFlbma
 xyFe/N5yKbVhKJYzk4lWfQCyo4/DhF42gyxzkedfHYFYbvmIOfSuNwDk/GhAD3Bo4YyM
 1pgEDFLM9SfT99wXLh4ZNyObu1xwo1k4k4lYFXw7sT+gbPhPmZzLmUyv83iSVubhRTIV
 qPKFvIoEL1qgzFDxWY08Bucf228XpSjw2xjEEKXxwN/QRYyukYDYRp9HX3pouT2E4UPU
 yejA==
X-Gm-Message-State: ANhLgQ2+4nc6tcd6ieMzr/4ApGGTc5xe2xZLpmMApI+LYIQXcdP/IbuN
 wx4YfjYEEuJiVC4Pyy1n5LGWDg==
X-Google-Smtp-Source: ADFU+vsg7IIqX37UorF/eltCUNlS39GhUP9+BvWgF9doRJeijjoEl3DC9hD7zhlhSaehX06RbPEcaw==
X-Received: by 2002:a17:90a:a483:: with SMTP id
 z3mr4594416pjp.43.1584535353926; 
 Wed, 18 Mar 2020 05:42:33 -0700 (PDT)
Received: from localhost
 (2001-44b8-1113-6700-11e1-e7cb-3c10-05d6.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:11e1:e7cb:3c10:5d6])
 by smtp.gmail.com with ESMTPSA id u129sm6769214pfb.101.2020.03.18.05.42.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2020 05:42:33 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
Subject: Re: [PATCH v5 2/2] powerpc/64: Prevent stack protection in early boot
In-Reply-To: <20200316124421.99211-2-mpe@ellerman.id.au>
References: <20200316124421.99211-1-mpe@ellerman.id.au>
 <20200316124421.99211-2-mpe@ellerman.id.au>
Date: Wed, 18 Mar 2020 23:42:28 +1100
Message-ID: <87wo7hn8az.fsf@dja-thinkpad.axtens.net>
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
Cc: npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:

> The previous commit reduced the amount of code that is run before we
> setup a paca. However there are still a few remaining functions that
> run with no paca, or worse, with an arbitrary value in r13 that will
> be used as a paca pointer.
>
> In particular the stack protector canary is stored in the paca, so if
> stack protector is activated for any of these functions we will read
> the stack canary from wherever r13 points. If r13 happens to point
> outside of memory we will get a machine check / checkstop.
>
> For example if we modify initialise_paca() to trigger stack
> protection, and then boot in the mambo simulator with r13 poisoned in
> skiboot before calling the kernel:
>
>   DEBUG: 19952232: (19952232): INSTRUCTION: PC=0xC0000000191FC1E8: [0x3C4C006D]: addis   r2,r12,0x6D [fetch]
>   DEBUG: 19952236: (19952236): INSTRUCTION: PC=0xC00000001807EAD8: [0x7D8802A6]: mflr    r12 [fetch]
>   FATAL ERROR: 19952276: (19952276): Check Stop for 0:0: Machine Check with ME bit of MSR off
>   DEBUG: 19952276: (19952276): INSTRUCTION: PC=0xC0000000191FCA7C: [0xE90D0CF8]: ld      r8,0xCF8(r13) [Instruction Failed]
>   INFO: 19952276: (19952277): ** Execution stopped: Mambo Error, Machine Check Stop,  **
>   systemsim % bt
>   pc:                             0xC0000000191FCA7C      initialise_paca+0x54
>   lr:                             0xC0000000191FC22C      early_setup+0x44
>   stack:0x00000000198CBED0        0x0     +0x0
>   stack:0x00000000198CBF00        0xC0000000191FC22C      early_setup+0x44
>   stack:0x00000000198CBF90        0x1801C968      +0x1801C968
>
> So annotate the relevant functions to ensure stack protection is never
> enabled for them.

This all makes sense to me, although I don't really understand the stack
protector especially well.

I have checked and I can find no other C functions that are called
before early_setup.

Do we need to do add setup_64.c to the part of the Makefile that
disables tracing of early boot?

ifdef CONFIG_FUNCTION_TRACER
# Do not trace early boot code
CFLAGS_REMOVE_cputable.o = $(CC_FLAGS_FTRACE)
CFLAGS_REMOVE_prom_init.o = $(CC_FLAGS_FTRACE)
CFLAGS_REMOVE_btext.o = $(CC_FLAGS_FTRACE)
CFLAGS_REMOVE_prom.o = $(CC_FLAGS_FTRACE)
-> should we add setup_64.c here?
endif

Regards,
Daniel


>
> Fixes: 06ec27aea9fc ("powerpc/64: add stack protector support")
> Cc: stable@vger.kernel.org # v4.20+
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>  arch/powerpc/kernel/paca.c     | 4 ++--
>  arch/powerpc/kernel/setup.h    | 2 ++
>  arch/powerpc/kernel/setup_64.c | 2 +-
>  3 files changed, 5 insertions(+), 3 deletions(-)
>
> v5: New.
>
> diff --git a/arch/powerpc/kernel/paca.c b/arch/powerpc/kernel/paca.c
> index 0ee6308541b1..3f91ccaa9c74 100644
> --- a/arch/powerpc/kernel/paca.c
> +++ b/arch/powerpc/kernel/paca.c
> @@ -176,7 +176,7 @@ static struct slb_shadow * __init new_slb_shadow(int cpu, unsigned long limit)
>  struct paca_struct **paca_ptrs __read_mostly;
>  EXPORT_SYMBOL(paca_ptrs);
>  
> -void __init initialise_paca(struct paca_struct *new_paca, int cpu)
> +void __init __nostackprotector initialise_paca(struct paca_struct *new_paca, int cpu)
>  {
>  #ifdef CONFIG_PPC_PSERIES
>  	new_paca->lppaca_ptr = NULL;
> @@ -205,7 +205,7 @@ void __init initialise_paca(struct paca_struct *new_paca, int cpu)
>  }
>  
>  /* Put the paca pointer into r13 and SPRG_PACA */
> -void setup_paca(struct paca_struct *new_paca)
> +void __nostackprotector setup_paca(struct paca_struct *new_paca)
>  {
>  	/* Setup r13 */
>  	local_paca = new_paca;
> diff --git a/arch/powerpc/kernel/setup.h b/arch/powerpc/kernel/setup.h
> index 2dd0d9cb5a20..d210671026e9 100644
> --- a/arch/powerpc/kernel/setup.h
> +++ b/arch/powerpc/kernel/setup.h
> @@ -8,6 +8,8 @@
>  #ifndef __ARCH_POWERPC_KERNEL_SETUP_H
>  #define __ARCH_POWERPC_KERNEL_SETUP_H
>  
> +#define __nostackprotector __attribute__((__optimize__("no-stack-protector")))
> +
>  void initialize_cache_info(void);
>  void irqstack_early_init(void);
>  
> diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
> index 17886d147dd0..438a9befce41 100644
> --- a/arch/powerpc/kernel/setup_64.c
> +++ b/arch/powerpc/kernel/setup_64.c
> @@ -279,7 +279,7 @@ void __init record_spr_defaults(void)
>   * device-tree is not accessible via normal means at this point.
>   */
>  
> -void __init early_setup(unsigned long dt_ptr)
> +void __init __nostackprotector early_setup(unsigned long dt_ptr)
>  {
>  	static __initdata struct paca_struct boot_paca;
>  
> -- 
> 2.24.1
