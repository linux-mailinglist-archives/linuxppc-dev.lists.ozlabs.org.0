Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DE42E9EAEF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 16:27:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Hrmj3RcyzDqt3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2019 00:27:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=axtens.net
 (client-ip=2607:f8b0:4864:20::643; helo=mail-pl1-x643.google.com;
 envelope-from=dja@axtens.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="f+5hfHZV"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46HrH14kTkzDqt3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2019 00:05:01 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id c2so11853027plz.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2019 07:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=t9xctO/WP/vM2N5V7/AvRgZTobzXsqkZj3kzkKzY+c8=;
 b=f+5hfHZV3TLUfwm18/n69YUcml42uyWVJgGc8yRGKvJ6GLp8HQG9luHFUXoEWzxjW0
 O+XZZG7YHbCih0Dy6sejyDN6Z6kupVnFkKcRAermqU4rEN0pwLnKx+WS9sM/p6T7fmmU
 L6JE3W2OMSlkM5Q39iwan4bJ/4NGnt+ah1qkE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=t9xctO/WP/vM2N5V7/AvRgZTobzXsqkZj3kzkKzY+c8=;
 b=jelDFMfr0Zb3XHZituHFKOW7yVg4w2TnYHnIODWnikgspAcXMaD6vYE0HGy2rIzTWS
 73nnDMPCYvjOCJaKDw0ZCSGHIuP9oPtjJ09Mjfv/g1vUS++c0MCyLYw3Rp6vI4oArgYz
 IAP1rQM+g2bE1iCYUh7ST1SDqtRmRCK19tjwLRiwhdmAKbuhBV+Wl/Jce31IcOaM4S16
 xQ8Swk6DKcka4g9Y/SfEa4B3JCNCTcqsxpHFA4k7xQrPTKBcabkyyzB9iWTSUtNbBp+e
 Mx7j1/HrfJWJqzwB8J6AbD+3CoV/1GMaNQpPI0MeN+ZeEDqYNmTXC5/cwuLMUstp9995
 T0Tg==
X-Gm-Message-State: APjAAAVqCzUjQ65jo8kCyCMKoKoRy1gAMEWGGrFtPQw8sFBoeIpdYp12
 3ty0KVrmdF5EnzNPKVnYfv+pKQ==
X-Google-Smtp-Source: APXvYqyj0rYfewcCj6c1ycF9gMEuwWvzV9FIgo+OumVuJdxKjZsukAJMiIcCF0D+WMeg/csHRIWD2A==
X-Received: by 2002:a17:902:7d8b:: with SMTP id
 a11mr24484244plm.306.1566914697754; 
 Tue, 27 Aug 2019 07:04:57 -0700 (PDT)
Received: from localhost (ppp167-251-205.static.internode.on.net.
 [59.167.251.205])
 by smtp.gmail.com with ESMTPSA id r61sm2282367pjb.7.2019.08.27.07.04.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2019 07:04:56 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Masahiro Yamada <yamada.masahiro@socionext.com>,
 Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: Re: powerpc asm-prototypes.h seems odd
In-Reply-To: <CAK7LNATg7O0ZQQ4fe2maNqf0ascHU8b2Mfnqkrxzpzj8D_X7pQ@mail.gmail.com>
References: <CAK7LNATg7O0ZQQ4fe2maNqf0ascHU8b2Mfnqkrxzpzj8D_X7pQ@mail.gmail.com>
Date: Wed, 28 Aug 2019 00:04:38 +1000
Message-ID: <871rx64scp.fsf@dja-thinkpad.axtens.net>
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Masahiro Yamada <yamada.masahiro@socionext.com> writes:

> Hi.
>
> Lots of powerpc files include <asm/asm-prototypes.h>,
> and powerpc is the only architecture that does this.
>
> <asm/asm-prototypes.h> exists to support modversion for asm.
> So, it is supposed to be parsed by genksysms, not to be
> included from other files.  Right?

It exists to support sparse, squashing a bunch of sparse warnings.

From the commit where I introduced it:

commit 42f5b4cacd783faf05e3ff8bf85e8be31f3dfa9d
Author: Daniel Axtens <dja@axtens.net>
Date:   Wed May 18 11:16:50 2016 +1000

    powerpc: Introduce asm-prototypes.h
    
    Sparse picked up a number of functions that are implemented in C and
    then only referred to in asm code.
    
    This introduces asm-prototypes.h, which provides a place for
    prototypes of these functions.
    
    This silences some sparse warnings.
    
    Signed-off-by: Daniel Axtens <dja@axtens.net>
    [mpe: Add include guards, clean up copyright & GPL text]
    Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Regards,
Daniel

>
>
> $  git grep  asm/asm-prototypes.h
> arch/arm64/include/asm/asm-prototypes.h: * ... kbuild will
> automatically pick these up from <asm/asm-prototypes.h> and
> arch/powerpc/kernel/early_32.c:#include <asm/asm-prototypes.h>
> arch/powerpc/kernel/irq.c:#include <asm/asm-prototypes.h>
> arch/powerpc/kernel/machine_kexec_64.c:#include <asm/asm-prototypes.h>
> arch/powerpc/kernel/process.c:#include <asm/asm-prototypes.h>
> arch/powerpc/kernel/prom_init.c:#include <asm/asm-prototypes.h>
> arch/powerpc/kernel/ptrace.c:#include <asm/asm-prototypes.h>
> arch/powerpc/kernel/security.c:#include <asm/asm-prototypes.h>
> arch/powerpc/kernel/setup_32.c:#include <asm/asm-prototypes.h>
> arch/powerpc/kernel/signal_32.c:#include <asm/asm-prototypes.h>
> arch/powerpc/kernel/signal_64.c:#include <asm/asm-prototypes.h>
> arch/powerpc/kernel/smp.c:#include <asm/asm-prototypes.h>
> arch/powerpc/kernel/syscalls.c:#include <asm/asm-prototypes.h>
> arch/powerpc/kernel/tau_6xx.c:#include <asm/asm-prototypes.h>
> arch/powerpc/kernel/time.c:#include <asm/asm-prototypes.h>
> arch/powerpc/kernel/trace/ftrace.c:#include <asm/asm-prototypes.h>
> arch/powerpc/kernel/traps.c:#include <asm/asm-prototypes.h>
> arch/powerpc/kvm/book3s_emulate.c:#include <asm/asm-prototypes.h>
> arch/powerpc/kvm/book3s_hv.c:#include <asm/asm-prototypes.h>
> arch/powerpc/kvm/book3s_hv_builtin.c:#include <asm/asm-prototypes.h>
> arch/powerpc/kvm/book3s_hv_rm_xive.c:#include <asm/asm-prototypes.h>
> arch/powerpc/kvm/book3s_pr.c:#include <asm/asm-prototypes.h>
> arch/powerpc/lib/vmx-helper.c:#include <asm/asm-prototypes.h>
> arch/powerpc/mm/book3s64/hash_utils.c:#include <asm/asm-prototypes.h>
> arch/powerpc/mm/book3s64/slb.c:#include <asm/asm-prototypes.h>
> arch/powerpc/platforms/powernv/idle.c:#include <asm/asm-prototypes.h>
> arch/powerpc/platforms/powernv/opal-call.c:#include <asm/asm-prototypes.h>
> arch/powerpc/platforms/powernv/opal-tracepoints.c:#include
> <asm/asm-prototypes.h>
> arch/powerpc/platforms/pseries/lpar.c:#include <asm/asm-prototypes.h>
> scripts/Makefile.build:# .S file exports must have their C prototypes
> defined in asm/asm-prototypes.h
> scripts/Makefile.build:     echo "\#include <asm/asm-prototypes.h>" ;
>                             \
> scripts/Makefile.build:ASM_PROTOTYPES := $(wildcard
> $(srctree)/arch/$(SRCARCH)/include/asm/asm-prototypes.h)
>
>
>
> -- 
> Best Regards
> Masahiro Yamada
