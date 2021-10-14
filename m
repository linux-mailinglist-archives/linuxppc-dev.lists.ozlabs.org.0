Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E333D42E355
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Oct 2021 23:36:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HVjQc45Scz3c5f
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Oct 2021 08:36:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=VQQ5XftK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::102d;
 helo=mail-pj1-x102d.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=VQQ5XftK; dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HVjPw3dpjz2yNK
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Oct 2021 08:36:02 +1100 (AEDT)
Received: by mail-pj1-x102d.google.com with SMTP id
 q2-20020a17090a2e0200b001a0fd4efd49so1694589pjd.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Oct 2021 14:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=ucthCVLQbHs9EV1Uw1Bv+F6lYLHxvFpuoWX8HwMgpt8=;
 b=VQQ5XftKFdJxIqUHw8qRFJat71Dbqr2AD8qwnlFgMvFJilatzmha8I6vmL6yvrzpkP
 hvXQ2mD6ttiO3AiCefR9vWjBp4Q7T/wGfxf4JQjnzp3eY+AnFAfleMbYmsvVYJNrXhMf
 F+Jl/P5vsIdt4melRbvlQ+FV9+ngeKkjBbp7w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=ucthCVLQbHs9EV1Uw1Bv+F6lYLHxvFpuoWX8HwMgpt8=;
 b=LSOg7evK6u39irJPne8JHLDrEMO0B/VRWTG7qatC7kzVgMiuEUwDrgvy18sqdP6/2b
 Szeim8CQmLs+HrtWCoODt8QHseQOYAe+mGFbmXwd9juIQDE+f+IIYOhSSPzJgW8Do++M
 5CApgMWowLdT75YD9JdBoL4DqzKDhKc3kSkhA1dkfNcpNkW+ODlrynUE4Nk/MHPRqYly
 I//XZ06S6elAOVK0sQSY2RSJ81bfsLB7GWJ+UQITtSk4T+mj8ttwQP00b3kQV7vmqrsY
 WoOZMXJJpNLGrNwLRP2SXVombS707tcIAhq8Rmhr/mIM6wCZ6sMfcSEhS2SveXkqVCoL
 KC0g==
X-Gm-Message-State: AOAM531yXELa9TR//jCiNsQUk1fSfObfnFwMYY/Kzx6tIO9HfSYQ9T2C
 V/H6QCR+DCkAYgAaCBEDouut/R4DpYlTCg==
X-Google-Smtp-Source: ABdhPJw1rTBhUzGBU+OCQNwxLaPgrU3yVEgNpct3REqnkn5dEyRgg6pBD5Hi+HUutoGMqi2zC8/tfg==
X-Received: by 2002:a17:90b:4ac1:: with SMTP id
 mh1mr8767562pjb.144.1634247360274; 
 Thu, 14 Oct 2021 14:36:00 -0700 (PDT)
Received: from localhost ([2001:4479:e300:600:4901:2fb9:ed97:3a3e])
 by smtp.gmail.com with ESMTPSA id k7sm3292676pfk.59.2021.10.14.14.35.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 14:35:59 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael
 Ellerman <mpe@ellerman.id.au>, Andrew Morton <akpm@linux-foundation.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Helge
 Deller <deller@gmx.de>, Arnd Bergmann <arnd@arndb.de>, Kees Cook
 <keescook@chromium.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 00/13] Fix LKDTM for PPC64/IA64/PARISC
In-Reply-To: <cover.1634190022.git.christophe.leroy@csgroup.eu>
References: <cover.1634190022.git.christophe.leroy@csgroup.eu>
Date: Fri, 15 Oct 2021 08:35:56 +1100
Message-ID: <87a6jb47cz.fsf@dja-thinkpad.axtens.net>
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
Cc: linux-arch@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:

> PPC64/IA64/PARISC have function descriptors. LKDTM doesn't work
> on those three architectures because LKDTM messes up function
> descriptors with functions.

Just to nitpick, it's powerpc 64-bit using the ELFv1 ABI. [1]

The ELFv2 ABI [2] doesn't use function descriptors. (ELFv2 is used
primarily for ppc64le, but some people like musl support it for BE as
well.)

This doesn't affect the correctness or desirability of your changes, it
was just bugging me when I was reading the commit messages :-)

Kind regards,
Daniel

[1] See e.g. https://refspecs.linuxfoundation.org/ELF/ppc64/PPC-elf64abi.html
[2] https://openpowerfoundation.org/wp-content/uploads/2016/03/ABI64BitOpenPOWERv1.1_16July2015_pub4.pdf


> This series does some cleanup in the three architectures and
> refactors function descriptors so that it can then easily use it
> in a generic way in LKDTM.
>
> Patch 8 is not absolutely necessary but it is a good trivial cleanup.
>
> Changes in v2:
> - Addressed received comments
> - Moved dereference_[kernel]_function_descriptor() out of line
> - Added patches to remove func_descr_t and func_desc_t in powerpc
> - Using func_desc_t instead of funct_descr_t
> - Renamed HAVE_DEREFERENCE_FUNCTION_DESCRIPTOR to HAVE_FUNCTION_DESCRIPTORS
> - Added a new lkdtm test to check protection of function descriptors
>
> Christophe Leroy (13):
>   powerpc: Move 'struct ppc64_opd_entry' back into asm/elf.h
>   powerpc: Rename 'funcaddr' to 'addr' in 'struct ppc64_opd_entry'
>   powerpc: Remove func_descr_t
>   powerpc: Prepare func_desc_t for refactorisation
>   ia64: Rename 'ip' to 'addr' in 'struct fdesc'
>   asm-generic: Use HAVE_FUNCTION_DESCRIPTORS to define associated stubs
>   asm-generic: Define 'func_desc_t' to commonly describe function
>     descriptors
>   asm-generic: Refactor dereference_[kernel]_function_descriptor()
>   lkdtm: Force do_nothing() out of line
>   lkdtm: Really write into kernel text in WRITE_KERN
>   lkdtm: Fix lkdtm_EXEC_RODATA()
>   lkdtm: Fix execute_[user]_location()
>   lkdtm: Add a test for function descriptors protection
>
>  arch/ia64/include/asm/elf.h              |  2 +-
>  arch/ia64/include/asm/sections.h         | 25 ++-------
>  arch/ia64/kernel/module.c                |  6 +--
>  arch/parisc/include/asm/sections.h       | 17 +++---
>  arch/parisc/kernel/process.c             | 21 --------
>  arch/powerpc/include/asm/code-patching.h |  2 +-
>  arch/powerpc/include/asm/elf.h           |  6 +++
>  arch/powerpc/include/asm/sections.h      | 30 ++---------
>  arch/powerpc/include/asm/types.h         |  6 ---
>  arch/powerpc/include/uapi/asm/elf.h      |  8 ---
>  arch/powerpc/kernel/module_64.c          | 38 +++++--------
>  arch/powerpc/kernel/signal_64.c          |  8 +--
>  drivers/misc/lkdtm/core.c                |  1 +
>  drivers/misc/lkdtm/lkdtm.h               |  1 +
>  drivers/misc/lkdtm/perms.c               | 68 ++++++++++++++++++++----
>  include/asm-generic/sections.h           | 13 ++++-
>  include/linux/kallsyms.h                 |  2 +-
>  kernel/extable.c                         | 23 +++++++-
>  18 files changed, 138 insertions(+), 139 deletions(-)
>
> -- 
> 2.31.1
