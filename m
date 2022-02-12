Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD7B4B31A6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Feb 2022 01:06:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JwW3Y2LLGz3cNB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Feb 2022 11:06:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=JZ4+ncYz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::229;
 helo=mail-lj1-x229.google.com; envelope-from=ndesaulniers@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=JZ4+ncYz; dkim-atps=neutral
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JwW2s65Cvz30Lp
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Feb 2022 11:05:23 +1100 (AEDT)
Received: by mail-lj1-x229.google.com with SMTP id c15so14496342ljf.11
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Feb 2022 16:05:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3wE/nOdJLWv1mzpBtdK/cJVk9Tp2iFdl54BX0oVeteY=;
 b=JZ4+ncYzNYerj+moSCDWO1WJoiIH1M96FVDcYdw6NEPzkI0vfciZXqQRAJ/ExwSKWm
 4su7BW04KWOmgtSLfMWfmFwwPLUoxQMXYWPRUVsT0VuYtJ20G92SikYuCtyrx5evufpO
 N26KJe6Z+HgUlAL/2VpEhB+DoS4ngCWobKH+HY7DUT67+fxZm239uiFhBRDD9YYE1yMS
 e5fCMS0jPdtR9S7RB6LBOirrAFXoAK/6zoreaVyBSpBP1PpepUVqlOCB1ZYioEKq6Hkr
 o0LQgL6mBPPLbsxzPWnWfoZAKZ8O48BoDo1avbbjjBi0eQWRjzpXbSLNlmahWCrqKf3U
 JMiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3wE/nOdJLWv1mzpBtdK/cJVk9Tp2iFdl54BX0oVeteY=;
 b=sCuBcU/bihgKlXrysvUb12LCPPNxZejR4JwWwcc6EpgcYAUKttgyBbHs6wexALA8Az
 oO2qq2MnZyDEMa95/yk44veFgKAL79f9QKJEML8ljhwp/VorwxuYqaxRUE6sW4JwuxLC
 jMmZ1eD8GNqcw1gnz2joUEPS6oyE8P7pDoaFTsT+nL9ruZ+ha9xKQSRZpI5bXF+WtMOv
 Vri+fqgFyaF4HPHJ8Jc7nD8tywdb8Q6PkbaWL4UUrshsxlfSpZEe84mpEtDkZ11oEa8D
 XbM13uKmc//FoGuMgqt03AgT+MLDfET1ZBrwHqY/BfdkIQAYRMGdezRZrViveK6C8yKM
 3lOw==
X-Gm-Message-State: AOAM533+moZpTGknJBVDOd3BV+5fk7n2Q9dHyXIMNE7dMqNFciPFMRle
 xVtid0mNBrvSswl/nuAgewrGKi3qBfzHmwx2PkTkog==
X-Google-Smtp-Source: ABdhPJwmPtH/n7FoQO5chtGDWHS6OG9MEkuqrVz6CbXbgX3B755ZqK+C3HYjz81i7WU+P0JnqoED8Mf0MZ6V58/814Q=
X-Received: by 2002:a05:651c:1253:: with SMTP id
 h19mr2394779ljh.338.1644624316161; 
 Fri, 11 Feb 2022 16:05:16 -0800 (PST)
MIME-Version: 1.0
References: <20220211023125.1790960-1-aik@ozlabs.ru>
 <20220211023125.1790960-3-aik@ozlabs.ru>
In-Reply-To: <20220211023125.1790960-3-aik@ozlabs.ru>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 11 Feb 2022 16:05:04 -0800
Message-ID: <CAKwvOdmJspxuNh-K-CeLJh4X4GGVYJWH29HnjJwuRL+jcN9G5w@mail.gmail.com>
Subject: Re: [PATCH kernel 2/3] powerpc/llvm: Sample config for LLVM LTO
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, Fabiano Rosas <farosas@linux.ibm.com>,
 llvm@lists.linux.dev, Nicholas Piggin <npiggin@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, Joel Stanley <joel@jms.id.au>,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 10, 2022 at 6:31 PM Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
>
> The config is a copy of ppc64_defconfig with a few tweaks. This could be
> a smaller config to merge into ppc64_defconfig but unfortunately
> merger does not allow disabling already enabled options.

Cool series!

>
> This is a command line to compile the kernel using the upstream llvm:
>
> make -j64 O=/home/aik/pbuild/kernels-llvm/ \
>  "KCFLAGS=-Wmissing-braces -Wno-array-bounds" \
>  ARCH=powerpc LLVM_IAS=1 ppc64le_lto_defconfig CC=clang LLVM=1

That command line invocation is kind of a mess, and many things
shouldn't be necessary.

O= is just noise; if folks are doing in tree builds then that doesn't
add anything meaningful.
KCFLAGS= why? I know -Warray-bounds is being worked on actively, but
do we have instances of -Wmissing-braces at the moment? Let's get
those fixed up.
LLVM_IAS=1 is implied by LLVM=1.
CC=clang is implied by LLVM=1

why add a new config? I think it would be simpler to just show command
line invocations of `./scripts/config -e` and `make`. No new config
required.

>
> Forces CONFIG_BTRFS_FS=y to make CONFIG_ZSTD_COMPRESS=y to fix:
> ld.lld: error: linking module flags 'Code Model': IDs have conflicting values in 'lib/built-in.a(entropy_common.o at 5332)' and 'ld-temp.o'
>
> because modules are linked with -mcmodel=large but the kernel uses -mcmodel=medium

Please file a bug about this.
https://github.com/ClangBuiltLinux/linux/issues

>
> Enables CONFIG_USERFAULTFD=y as otherwise vm_userfaultfd_ctx becomes
> 0 bytes long and clang sanitizer crashes as
> https://bugs.llvm.org/show_bug.cgi?id=500375

The above hyperlink doesn't work for me. Upstream llvm just moved from
bugzilla to github issue tracker.

https://github.com/llvm/llvm-project/issues

>
> Disables CONFIG_FTR_FIXUP_SELFTEST as it uses FTR_SECTION_ELSE with
> conditional branches. There are other places like this and the following
> patches address that.
>
> Disables CONFIG_FTRACE_MCOUNT_USE_RECORDMCOUNT as CONFIG_HAS_LTO_CLANG
> depends on it being disabled. In order to avoid disabling way too many
> options (like DYNAMIC_FTRACE/FUNCTION_TRACER), this converts
> FTRACE_MCOUNT_USE_RECORDMCOUNT from def_bool to bool.
>
> Note that even with this config there is a good chance that LTO
> is going to fail linking vmlinux because of the "bc" problem.

I think rather than adding a new config with LTO enabled and a few
things turned off, it would be better to not allow LTO to be
selectable if those things are turned on, until the combination of the
two are fixed.

-- 
Thanks,
~Nick Desaulniers
