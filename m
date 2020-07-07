Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4014821787A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 22:00:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1YFQ2p6pzDr31
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 06:00:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=brendanhiggins@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=POB0tDdC; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B1YCG4qKyzDqkP
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jul 2020 05:58:17 +1000 (AEST)
Received: by mail-pj1-x1042.google.com with SMTP id b92so130866pjc.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Jul 2020 12:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VzRu+6RTYvmFttwhsiQLXCF6YnU1lg38nqV7v8N7whw=;
 b=POB0tDdCbNVqmVQZ6yua+ndmhJsgXFLarIJRrzZHpuDGP0B1FODyoxi9lUTM/pG0IL
 mE1dMIr/gsK64CjizChpcXywJYXY4Vfi25COfLptk3V+mFNHqoasjVtfubvV2ebCtl7a
 czRuA5AP473VLGgnEz34EgdAlV0QOt3H67RniAnOVC2+In0mdoC9rSRvmlMzUXfZVzt4
 xGEFUHBxADeMLVRzRAoW7/H0iSwTAcsqnlAtpK24wb/U0fEHrp7KMPF2hLocEXQ4+asp
 047TKx7zculMEGUVbpwgiExvH3ficDy6d/Wj01wsX8chenP63N6BpBBILOJ6KcW2NDnx
 OPSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VzRu+6RTYvmFttwhsiQLXCF6YnU1lg38nqV7v8N7whw=;
 b=X7s58tQQ3Hf6gn+ftV4fJ1NyFqgu/bC60Z7KW5Ls9j9fQfYM8yrk26jNERPPrfQJ2r
 a0hbZ3yknlUITSiKOc8MD6sEcKicgXQg9v7FMhOOwWPjVnKQSTyTnM25aP0ifX0TlQJ9
 BjrgEROZ6xYC/74lO097l8j7cHn6IS/Zfy8HYBqEc+MI1t1wzS5YdJHy6WxhMmhJ7VcB
 ieQFE8ZOZhR6XvM0rDMi1h7QNeaGjNVDll27K2HHb2ARVhqVjC0pcMTt86QwTNJiGXmO
 lB27F+2yadB8qkkKPe9Iwkqha6HgNbnPWK2Qb/kseh9cVdv3Qr7oGp+wSgUV7Fv1UfHb
 PzgQ==
X-Gm-Message-State: AOAM533EziVoU7qLew5vP+kvwCK+fykVSqezDm01i9+zYe6aiXw44b2s
 c5WFD4GujoBsISMgNipuk+vlRFxh2JM5jApvlXY/tA==
X-Google-Smtp-Source: ABdhPJwAgKOW6WJkomMyOukfnt4wP2/V35sf6mYJAhQLNyaosM4LY2uIUq7rKvvPZg70NVApdINfIkTmb6+bTRJLXD0=
X-Received: by 2002:a17:90b:1296:: with SMTP id
 fw22mr6086502pjb.20.1594151892296; 
 Tue, 07 Jul 2020 12:58:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200707092117.963394-1-masahiroy@kernel.org>
In-Reply-To: <20200707092117.963394-1-masahiroy@kernel.org>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Tue, 7 Jul 2020 12:58:01 -0700
Message-ID: <CAFd5g46eCjZA-e4akYc1K8u29tp94gpmrAOxZ_joZ=9kJtZeuA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] kbuild: introduce ccflags-remove-y and
 asflags-remove-y
To: Masahiro Yamada <masahiroy@kernel.org>
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
Cc: Rich Felker <dalias@libc.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 live-patching@vger.kernel.org, Miroslav Benes <mbenes@suse.cz>,
 Ingo Molnar <mingo@kernel.org>, Joe Lawrence <joe.lawrence@redhat.com>,
 Anders Roxell <anders.roxell@linaro.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Jonathan Corbet <corbet@lwn.net>,
 linux-sh@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 Ingo Molnar <mingo@redhat.com>, Sami Tolvanen <samitolvanen@google.com>,
 Petr Mladek <pmladek@suse.com>, linux-kbuild <linux-kbuild@vger.kernel.org>,
 Jiri Kosina <jikos@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Josh Poimboeuf <jpoimboe@redhat.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 KUnit Development <kunit-dev@googlegroups.com>,
 Michal Marek <michal.lkml@markovi.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tal Gilboa <talgi@mellanox.com>, linux-crypto@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 7, 2020 at 2:22 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> CFLAGS_REMOVE_<file>.o filters out flags when compiling a particular
> object, but there is no convenient way to do that for every object in
> a directory.
>
> Add ccflags-remove-y and asflags-remove-y to make it easily.
>
> Use ccflags-remove-y to clean up some Makefiles.
>
> The add/remove order works as follows:
>
>  [1] KBUILD_CFLAGS specifies compiler flags used globally
>
>  [2] ccflags-y adds compiler flags for all objects in the
>      current Makefile
>
>  [3] ccflags-remove-y removes compiler flags for all objects in the
>      current Makefile (New feature)
>
>  [4] CFLAGS_<file> adds compiler flags per file.
>
>  [5] CFLAGS_REMOVE_<file> removes compiler flags per file.
>
> Having [3] before [4] allows us to remove flags from most (but not all)
> objects in the current Makefile.
>
> For example, kernel/trace/Makefile removes $(CC_FLAGS_FTRACE)
> from all objects in the directory, then adds it back to
> trace_selftest_dynamic.o and CFLAGS_trace_kprobe_selftest.o
>
> Please note ccflags-remove-y has no effect to the sub-directories.
> In contrast, the previous notation got rid of compiler flags also from
> all the sub-directories.
>
>   arch/arm/boot/compressed/
>   arch/powerpc/xmon/
>   arch/sh/
>   kernel/trace/
>
> ... have no sub-directories.
>
>   lib/
>
> ... has several sub-directories.
>
> To keep the behavior, I added ccflags-remove-y to all Makefiles
> in subdirectories of lib/, except:
>
>   lib/vdso/Makefile        - Kbuild does not descend into this Makefile
>   lib/raid/test/Makefile   - This is not used for the kernel build
>
> I think commit 2464a609ded0 ("ftrace: do not trace library functions")
> excluded too much. In later commit, I will try to remove ccflags-remove-y
> from sub-directory Makefiles.
>
> Suggested-by: Sami Tolvanen <samitolvanen@google.com>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> Acked-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
> Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

Acked-by: Brendan Higgins <brendanhiggins@google.com> (KUnit)
