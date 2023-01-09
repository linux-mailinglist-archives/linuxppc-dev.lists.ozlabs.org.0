Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E01663512
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 00:17:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NrVGT5DgQz3cd9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 10:17:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=UxAF7v3T;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::102b; helo=mail-pj1-x102b.google.com; envelope-from=ndesaulniers@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=UxAF7v3T;
	dkim-atps=neutral
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NrVFb036Zz3c4Y
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jan 2023 10:16:50 +1100 (AEDT)
Received: by mail-pj1-x102b.google.com with SMTP id o8-20020a17090a9f8800b00223de0364beso14472848pjp.4
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Jan 2023 15:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sdxb8zOWzmCtZYGAnOxoisnrJmGWQMSvlh0UjB+YR7k=;
        b=UxAF7v3TwIoeGe5lQ6e+O3vtZeX5QbNQAGD5TBMn+S38e90Q1b0GycbUkS0bysawO1
         j70JyJFwOR0rIR/oqb1klqdObw5jR+JiUHccm/jMuRMZNMXFVkIhH2KId5yVjOnW9i54
         I9aMGRLe1s95Qf43s9P8xQdcdpNjzcd1YSw6aN7BHmfG7pwXHab5daDUsCHTLHmw2k8A
         rqVKKyyL/GfVB004FzuAjHJheV3X9+vuerYl1qqld80K+i1xSAdh0GDWZhMS/Ami48Ev
         yhM5TKZkw8n/ppMdjMn+Tsu7H8sVATtk3erU11epZGM8n1psz6e4etZQh8sfMzxUQiTp
         RLgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sdxb8zOWzmCtZYGAnOxoisnrJmGWQMSvlh0UjB+YR7k=;
        b=3aNTy3sFljBghvddPNeqM45Lcz6apj9owRVuFsL1Vkp5EW7di9fQ4OofS27XgdcGIk
         nbfYBEZrl0vmDxYDwKI/2MptyQnDq8e7eOMmQbQq9hHxODfZ9jYnkwB982Rdj7PfQrOB
         qD7FMuPC+7zq8K346zqgKovpxp1lSRta72278gjyC2d/tsDc1xLABBIYa2F+CMqg1VrF
         gxJklHaZhLm/pKrITS5RUMHubWo1x32sCQOvMDMkc+0s7/aNGyDA9tPXns0oWPhIYLSf
         UIJASkaM0ihfwJtInyoSVaQtTL7ND8ybH90uFToXD7dsdRv1EFs6+dXgRko0ilW8lSjN
         rV5Q==
X-Gm-Message-State: AFqh2krbo3fIMPVjUXRJQF5VN0YrBZ7tcxEr1q0CJtjnlIaZJQeFdyB1
	ZOwPYOz2SOr5mnMJNP4R9DP0o71GUYdHFs96BWfqxA==
X-Google-Smtp-Source: AMrXdXsMjJnCJ928/8DVkJxwsFwFKDvwGlcuRFMQ6S7gEnPCv4j6W4/x9swqsAsBcDJgaZJDiwcXJafslWxfIW7YrMw=
X-Received: by 2002:a17:902:c950:b0:189:9b43:a082 with SMTP id
 i16-20020a170902c95000b001899b43a082mr4261789pla.95.1673306207372; Mon, 09
 Jan 2023 15:16:47 -0800 (PST)
MIME-Version: 1.0
References: <20221228-drop-qunused-arguments-v1-0-658cbc8fc592@kernel.org>
 <20221228-drop-qunused-arguments-v1-8-658cbc8fc592@kernel.org>
 <CAKwvOd=oKBcFrsw5W1kJuVb5WXx+54BTJCtRkS1YwbeJZ6vX-w@mail.gmail.com> <Y7yXV3WOtWXF4PgT@dev-arch.thelio-3990X>
In-Reply-To: <Y7yXV3WOtWXF4PgT@dev-arch.thelio-3990X>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 9 Jan 2023 15:16:36 -0800
Message-ID: <CAKwvOd=N9kmg2bZ5iD_-qmkYz9DsNw+pE5BP1kS3oLksEpcSkQ@mail.gmail.com>
Subject: Re: [PATCH 08/14] powerpc/vdso: Remove an unsupported flag from
 vgettimeofday-32.o with clang
To: Nathan Chancellor <nathan@kernel.org>
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
Cc: kernel test robot <lkp@intel.com>, linux-kbuild@vger.kernel.org, trix@redhat.com, masahiroy@kernel.org, llvm@lists.linux.dev, npiggin@gmail.com, linuxppc-dev@lists.ozlabs.org, nicolas@fjasle.eu
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jan 9, 2023 at 2:38 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Mon, Jan 09, 2023 at 02:12:55PM -0800, Nick Desaulniers wrote:
> > On Wed, Jan 4, 2023 at 11:55 AM Nathan Chancellor <nathan@kernel.org> wrote:
> > >
> > > When clang's -Qunused-arguments is dropped from KBUILD_CPPFLAGS, it
> > > warns:
> > >
> > >   clang-16: error: argument unused during compilation: '-fno-stack-clash-protection' [-Werror,-Wunused-command-line-argument]
> > >
> > > This flag is supported for 64-bit powerpc but not 32-bit, hence the warning.
> > > Just remove the flag from vgettimeofday-32.o's CFLAGS when using clang, as has
> > > been done for other flags previously.
> > >
> > > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> >
> > Hmm...so this was added by the top level Makefile doing a cc-option
> > test.  How did the test pass if this was unsupported? That worries me
> > that perhaps other cc-option tests are passing erroneously for certain
> > ppc -m32/-m64 configs?
>
> Sure, that is a reasonable concern. I should have expanded upon this a
> little bit more in the commit message. Is this any better?
>
>   When clang's -Qunused-arguments is dropped from KBUILD_CPPFLAGS, it
>   warns:
>
>     clang-16: error: argument unused during compilation: '-fno-stack-clash-protection' [-Werror,-Wunused-command-line-argument]
>
>   This warning happens because vgettimeofday-32.c gets its base CFLAGS
>   from the main kernel, which may contain flags that are only supported
>   on a 64-bit target but not a 32-bit one, which is the case here.
>   -fstack-clash-protection and its negation are only suppported by the
>   64-bit powerpc target but that flag is included in an invocation for a
>   32-bit powerpc target, so clang points out that while the flag is one
>   that it recognizes, it is not actually used by this compiler job.
>
>   To eliminate the warning, remove -fno-stack-clash-protection from
>   vgettimeofday-32.c's CFLAGS when using clang, as has been done for
>   other flags previously.

Ah, ok that makes more sense. Sorry for my confusion, but if you
wouldn't mind adding the additional info in v3 it might help others
(or just me!)

You may add my RB to such a v3 w/ updated commit message.
-- 
Thanks,
~Nick Desaulniers
