Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D303F83D065
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jan 2024 00:11:20 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=QdXWgNXA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TLc5L5Tvmz3d9t
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jan 2024 10:11:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=QdXWgNXA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=keescook@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TLc4Q3b0Mz3cXr
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jan 2024 10:10:28 +1100 (AEDT)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-6dd85328325so3107586b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jan 2024 15:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706224225; x=1706829025; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YSh2SMxpzeSY8suanJAp4xUOQNbTcnMt4h+uTiF67+U=;
        b=QdXWgNXAGUhKxdheXQLnSvJnMzZ4cq8ODpZveH0/OyXrW1GxK2cE6EJ4QSBD/yq2LO
         YEokQQ4MUyAZnmMbW4yDIkO3Bf83lf3wpM4kldrZhGMHAlpy77noeOcVX5L7e0jH/HKO
         8sw8IV+Xl4cp2NEFZFKaTaguOipsrRg8O+rKs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706224225; x=1706829025;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YSh2SMxpzeSY8suanJAp4xUOQNbTcnMt4h+uTiF67+U=;
        b=K8iltDifO48DbiPhtAZEC2yI2nxP15UVsDXgMOwGuxu6Tzz74u+6LIuD7SAhyzr5Sx
         WmyQCAN4OXCn7HEwdK1Qnxfbd6Ihpy7dmGOztkcQQs/L+B4hgXNskJBReGxbFrFBSd0K
         p/5h6aFfikMKmRLKd4BCbz+oAlLzjFomACr5spDhzCwxDPBz5MJbsTK7cftHWIl4ObN0
         tUYygfgC0SyFLJ9WlaIspEE167RZf/3JhInCSO0ocnRWpfE0SRxU0c3GjfQa9ynRvDtq
         lirdIUjXBqBnQumz7eEGGoIiWs42gWYtjdxvTaEJhHB+XMXUcF/rY9DAUmUyteJTy8p+
         M3aA==
X-Gm-Message-State: AOJu0YxWqntzWEKL5NjQzmNmP1GOEr3HK54XuJ68yKq03B6m2MYKwznl
	4qFOSd90jo3kM4xGMA1nwER0qyh/rOJFEQc6v64hOdzB6AEhzQylXuB2etUXQQ==
X-Google-Smtp-Source: AGHT+IH31m5NlnF2FWv8Czpe2vRmKzes75Mmfn8IuhBbVPoTR04pbzWQk7GFedHzNU9HrXMbCT/lvQ==
X-Received: by 2002:a05:6a21:338d:b0:19a:e2aa:ff23 with SMTP id yy13-20020a056a21338d00b0019ae2aaff23mr509971pzb.9.1706224225137;
        Thu, 25 Jan 2024 15:10:25 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id s22-20020a635256000000b005ca0ae17983sm33642pgl.8.2024.01.25.15.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 15:10:24 -0800 (PST)
Date: Thu, 25 Jan 2024 15:10:24 -0800
From: Kees Cook <keescook@chromium.org>
To: Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH 00/11] Bump the minimum supported version of LLVM to
 13.0.1
Message-ID: <202401251509.17795F434@keescook>
References: <20240125-bump-min-llvm-ver-to-13-0-1-v1-0-f5ff9bda41c5@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240125-bump-min-llvm-ver-to-13-0-1-v1-0-f5ff9bda41c5@kernel.org>
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
Cc: mark.rutland@arm.com, catalin.marinas@arm.com, dave.hansen@linux.intel.com, linux-kernel@vger.kernel.org, aou@eecs.berkeley.edu, linux-hardening@vger.kernel.org, linux-riscv@lists.infradead.org, will@kernel.org, ardb@kernel.org, masahiroy@kernel.org, x86@kernel.org, linux@armlinux.org.uk, aneesh.kumar@kernel.org, mingo@redhat.com, naveen.n.rao@linux.ibm.com, llvm@lists.linux.dev, nicolas@fjasle.eu, linux-kbuild@vger.kernel.org, npiggin@gmail.com, bp@alien8.de, paul.walmsley@sifive.com, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, patches@lists.linux.dev, conor@kernel.org, palmer@dabbelt.com, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 25, 2024 at 03:55:06PM -0700, Nathan Chancellor wrote:
> Hi all,
> 
> This series bumps the minimum supported version of LLVM for building the
> kernel to 13.0.1. The first patch does the bump and all subsequent
> patches clean up all the various workarounds and checks for earlier
> versions.
> 
> Quoting the first patch's commit message for those that were only on CC
> for the clean ups:
> 
>   When __builtin_mul_overflow() has arguments that differ in terms of
>   signedness and width, LLVM may generate a libcall to __muloti4 because
>   it performs the checks in terms of 65-bit multiplication. This issue
>   becomes harder to hit (but still possible) after LLVM 12.0.0, which
>   includes a special case for matching widths but different signs.
> 
>   To gain access to this special case, which the kernel can take advantage
>   of when calls to __muloti4 appear, bump the minimum supported version of
>   LLVM for building the kernel to 13.0.1. 13.0.1 was chosen because there
>   is minimal impact to distribution support while allowing a few more
>   workarounds to be dropped in the kernel source than if 12.0.0 were
>   chosen. Looking at container images of up to date distribution versions:
> 
>     archlinux:latest              clang version 16.0.6
>     debian:oldoldstable-slim      clang version 7.0.1-8+deb10u2 (tags/RELEASE_701/final)
>     debian:oldstable-slim         Debian clang version 11.0.1-2
>     debian:stable-slim            Debian clang version 14.0.6
>     debian:testing-slim           Debian clang version 16.0.6 (19)
>     debian:unstable-slim          Debian clang version 16.0.6 (19)
>     fedora:38                     clang version 16.0.6 (Fedora 16.0.6-3.fc38)
>     fedora:latest                 clang version 17.0.6 (Fedora 17.0.6-1.fc39)
>     fedora:rawhide                clang version 17.0.6 (Fedora 17.0.6-1.fc40)
>     opensuse/leap:latest          clang version 15.0.7
>     opensuse/tumbleweed:latest    clang version 17.0.6
>     ubuntu:focal                  clang version 10.0.0-4ubuntu1
>     ubuntu:latest                 Ubuntu clang version 14.0.0-1ubuntu1.1
>     ubuntu:rolling                Ubuntu clang version 16.0.6 (15)
>     ubuntu:devel                  Ubuntu clang version 17.0.6 (3)
> 
>   The only distribution that gets left behind is Debian Bullseye, as the
>   default version is 11.0.1; other distributions either have a newer
>   version than 13.0.1 or one older than the current minimum of 11.0.0.
>   Debian has easy access to more recent LLVM versions through
>   apt.llvm.org, so this is not as much of a concern. There are also the
>   kernel.org LLVM toolchains, which should work with distributions with
>   glibc 2.28 and newer.
> 
>   Another benefit of slimming up the number of supported versions of LLVM
>   for building the kernel is reducing the build capacity needed to support
>   a matrix that builds with each supported version, which allows a matrix
>   to reallocate the freed up build capacity towards something else, such
>   as more configuration combinations.
> 
> This passes my build matrix with all supported versions.
> 
> This is based on Andrew's mm-nonmm-unstable to avoid trivial conflicts
> with my series to update the LLVM links across the repository [1] but I
> can easily rebase it to linux-kbuild if Masahiro would rather these
> patches go through there (and defer the conflict resolution to the merge
> window).
> 
> [1]: https://lore.kernel.org/20240109-update-llvm-links-v1-0-eb09b59db071@kernel.org/
> 
> ---
> Nathan Chancellor (11):
>       kbuild: Raise the minimum supported version of LLVM to 13.0.1
>       Makefile: Drop warn-stack-size plugin opt
>       x86: Drop stack-alignment plugin opt
>       ARM: Remove Thumb2 __builtin_thread_pointer workaround for Clang
>       arm64: Kconfig: Clean up tautological LLVM version checks
>       powerpc: Kconfig: Remove tautology in CONFIG_COMPAT
>       riscv: Remove MCOUNT_NAME workaround
>       riscv: Kconfig: Remove version dependency from CONFIG_CLANG_SUPPORTS_DYNAMIC_FTRACE
>       fortify: Drop Clang version check for 12.0.1 or newer
>       lib/Kconfig.debug: Update Clang version check in CONFIG_KCOV
>       compiler-clang.h: Update __diag_clang() macros for minimum version bump
> 
>  Documentation/process/changes.rst |  2 +-
>  Makefile                          |  8 --------
>  arch/arm/include/asm/current.h    |  8 +-------
>  arch/arm64/Kconfig                |  5 +----
>  arch/powerpc/Kconfig              |  1 -
>  arch/riscv/Kconfig                |  2 --
>  arch/riscv/include/asm/ftrace.h   | 14 ++------------
>  arch/riscv/kernel/mcount.S        | 10 +++++-----
>  arch/x86/Makefile                 |  6 ------
>  include/linux/compiler-clang.h    |  8 ++------
>  lib/Kconfig.debug                 |  2 +-
>  scripts/min-tool-version.sh       |  2 +-
>  scripts/recordmcount.pl           |  2 +-
>  security/Kconfig                  |  2 --
>  14 files changed, 15 insertions(+), 57 deletions(-)
> ---
> base-commit: 979741ebd48f75ed6d101c7290e3325340d361ff
> change-id: 20240124-bump-min-llvm-ver-to-13-0-1-39f84dd36b19
> 
> Best regards,
> -- 
> Nathan Chancellor <nathan@kernel.org>
> 

Yes, please. :) This looks reasonable -- I appreciate the review of
default Clang versions across distros!

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
