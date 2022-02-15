Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF3A4B7002
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 17:08:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JymGX5Gmfz3cbB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Feb 2022 03:08:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=QerMelEY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::102f;
 helo=mail-pj1-x102f.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=QerMelEY; dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JymFh5Nvvz3cSg
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Feb 2022 03:07:36 +1100 (AEDT)
Received: by mail-pj1-x102f.google.com with SMTP id
 t14-20020a17090a3e4e00b001b8f6032d96so2523535pjm.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Feb 2022 08:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=9F1cZHityGGoWBhfQ6coBOoN6sLDbcrG5DsSqFvaDqU=;
 b=QerMelEYY6ZDyyl1cI/YVp6a+3AiRTY9PXCnsmnFgeUeqOfD0RdHc1oShO5TFk3a1e
 reRp5IdzoSDGiTUW0TUs9obthAaR6Fd7ALoGIVLN+mzEsNiFaBatztWhabOU5Mdkco4q
 B/zJoBvoW6A94AVKVgT4SIX+4LVEqROqThJII=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9F1cZHityGGoWBhfQ6coBOoN6sLDbcrG5DsSqFvaDqU=;
 b=AxPZjjOg4+oD3YZnzCxGgkOjRUc2VdntOLF+BJJwgxeuTQM1KS/0jrhJ8yZvgKSdWF
 4GbWV97n0nguyifnSEbUr3XS39x33/lY3e4CQGJSUslqBevVe4GgcxTVmYrh4NxQJCvn
 JpfWHPsHBMAJrecZ43mHcgm58Sgu6u+A+NfnLoG1O7H/hi7A4rMyAHbue7vszgtJtIc4
 kilvsaHLlr1m3CT9ZlbYsBTfUtdAnOKnSpyUu7OiMqkmSIm5T/Yl/QsMRHR4hOwwfLAK
 JHPCw0vvPSNS6S+TYfTYqSgRjGitECN6QMigeHwdaGwiII8ELNiSa+QEOmXceu/Epv8a
 r4HA==
X-Gm-Message-State: AOAM533AdWu1l9+x3b/yfc//qYHOa8Qx3kKw6+0H3iZWJYAVmjSwDx8i
 r/DurTWGocT+jiE2YI37LYz15A==
X-Google-Smtp-Source: ABdhPJy9XUFQBS9qoJ92jrgPj0aOGN3xbqhE/n4oek8xKKJdVkIpgUPawPDOLHN99L+h2PeDtK1eNw==
X-Received: by 2002:a17:902:b413:: with SMTP id
 x19mr5046708plr.103.1644941254817; 
 Tue, 15 Feb 2022 08:07:34 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id n29sm2964422pgc.10.2022.02.15.08.07.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 08:07:34 -0800 (PST)
Date: Tue, 15 Feb 2022 08:07:33 -0800
From: Kees Cook <keescook@chromium.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v4 00/13] Fix LKDTM for PPC64/IA64/PARISC v4
Message-ID: <202202150807.D584917D34@keescook>
References: <cover.1644928018.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1644928018.git.christophe.leroy@csgroup.eu>
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
 linux-parisc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 15, 2022 at 01:40:55PM +0100, Christophe Leroy wrote:
> PPC64/IA64/PARISC have function descriptors. LKDTM doesn't work
> on those three architectures because LKDTM messes up function
> descriptors with functions.
> 
> This series does some cleanup in the three architectures and
> refactors function descriptors so that it can then easily use it
> in a generic way in LKDTM.

Thanks for doing this! It looks good to me. :)

-Kees

> 
> Changes in v4:
> - Added patch 1 which Fixes 'sparse' for powerpc64le after wrong report on previous series, refer https://github.com/ruscur/linux-ci/actions/runs/1351427671
> - Exported dereference_function_descriptor() to modules
> - Addressed other received comments
> - Rebased on latest powerpc/next (5a72345e6a78120368fcc841b570331b6c5a50da)
> 
> Changes in v3:
> - Addressed received comments
> - Swapped some of the powerpc patches to keep func_descr_t renamed as struct func_desc and remove 'struct ppc64_opd_entry'
> - Changed HAVE_FUNCTION_DESCRIPTORS macro to a config item CONFIG_HAVE_FUNCTION_DESCRIPTORS
> - Dropped patch 11 ("Fix lkdtm_EXEC_RODATA()")
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
>   powerpc: Fix 'sparse' checking on PPC64le
>   powerpc: Move and rename func_descr_t
>   powerpc: Use 'struct func_desc' instead of 'struct ppc64_opd_entry'
>   powerpc: Remove 'struct ppc64_opd_entry'
>   powerpc: Prepare func_desc_t for refactorisation
>   ia64: Rename 'ip' to 'addr' in 'struct fdesc'
>   asm-generic: Define CONFIG_HAVE_FUNCTION_DESCRIPTORS
>   asm-generic: Define 'func_desc_t' to commonly describe function
>     descriptors
>   asm-generic: Refactor dereference_[kernel]_function_descriptor()
>   lkdtm: Force do_nothing() out of line
>   lkdtm: Really write into kernel text in WRITE_KERN
>   lkdtm: Fix execute_[user]_location()
>   lkdtm: Add a test for function descriptors protection
> 
>  arch/Kconfig                             |  3 +
>  arch/ia64/Kconfig                        |  1 +
>  arch/ia64/include/asm/elf.h              |  2 +-
>  arch/ia64/include/asm/sections.h         | 24 +-------
>  arch/ia64/kernel/module.c                |  6 +-
>  arch/parisc/Kconfig                      |  1 +
>  arch/parisc/include/asm/sections.h       | 16 ++----
>  arch/parisc/kernel/process.c             | 21 -------
>  arch/powerpc/Kconfig                     |  1 +
>  arch/powerpc/Makefile                    |  2 +-
>  arch/powerpc/include/asm/code-patching.h |  2 +-
>  arch/powerpc/include/asm/elf.h           |  6 ++
>  arch/powerpc/include/asm/sections.h      | 29 ++--------
>  arch/powerpc/include/asm/types.h         |  6 --
>  arch/powerpc/include/uapi/asm/elf.h      |  8 ---
>  arch/powerpc/kernel/module_64.c          | 42 ++++++--------
>  arch/powerpc/kernel/ptrace/ptrace.c      |  6 ++
>  arch/powerpc/kernel/signal_64.c          |  8 +--
>  drivers/misc/lkdtm/core.c                |  1 +
>  drivers/misc/lkdtm/lkdtm.h               |  1 +
>  drivers/misc/lkdtm/perms.c               | 71 +++++++++++++++++++-----
>  include/asm-generic/sections.h           | 15 ++++-
>  include/linux/kallsyms.h                 |  2 +-
>  kernel/extable.c                         | 24 +++++++-
>  tools/testing/selftests/lkdtm/tests.txt  |  1 +
>  25 files changed, 155 insertions(+), 144 deletions(-)
> 
> -- 
> 2.34.1
> 

-- 
Kees Cook
