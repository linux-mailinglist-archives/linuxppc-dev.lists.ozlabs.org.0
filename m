Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 17968B0868
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2019 07:44:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46TSQP4ND9zDr9y
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2019 15:44:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::442; helo=mail-wr1-x442.google.com;
 envelope-from=natechancellor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="eoTwfksJ"; 
 dkim-atps=neutral
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46TSNf3zy5zF3tf
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 15:43:12 +1000 (AEST)
Received: by mail-wr1-x442.google.com with SMTP id l11so26938603wrx.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2019 22:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=WMphAgSBPHIKk4SYSy5DiphCnKasXaVbpOhSBFsQlZM=;
 b=eoTwfksJpQP/aJRoNnP2I9L/oxf3rt3+WUiVHu018iFRgwNVhSNaUJpczvueG0VVpT
 5UEajxPI1yyue6jILtHZ4Kq5JOv9RXWRwYs15GdqZnOPsvDSa0f5yVHZ7Oo+O5aXi26m
 oQq7bwa9VoCOJF8JJKk4SjzgOBDJo8oP18VvIm2DTTr8LiwkPxPmVDTgtfSQ7FJQtLBK
 SGMEj3OK2F0Om8P6F4VnepcY1ikk45GKvDALgQjx1815zBpUrFtUa/TvWVNAy0lgINtc
 ax8vt0u8nqR2rWCzu8I6d+CP/bhYa86aqRoue8PpNtZDlCpYbWeyeIWu+YeL+ZLTLFdR
 ZU1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=WMphAgSBPHIKk4SYSy5DiphCnKasXaVbpOhSBFsQlZM=;
 b=D5JXH2qTqG1FmjkoQQucyRyocvxqu7xLNynLeWhTesjBXo3rUna3OQBax8Iq+kOywY
 D8PaDspa5csmLpOJ8kBiXq07L67JH9TzqRkg3hjwtPbbZclahdrzVbfLvNN9AO77FVmt
 cKWsF86BBJM04JOv00Psg4WpLVDex1ZwEn43JXhjwxvJSEcng8YQEAOvKBq5Vd3ihgKX
 kAdniQrsHmxlYp3zshKlxJWq+AkUwh0qP1tdOF3B33PhvHKxSIxVbvFh6q7Xx/mOQArX
 7REx9Wab2wNsK+1u0+LFXNmf81nqmkSSgzfdKleIxB/ApK2IQQ+hK1SVg0xsjEe43pta
 RsSQ==
X-Gm-Message-State: APjAAAUyiMaVlCmStF3TmIgfkKATSEOCgIqy8wJo8Ol+JZbe+Q4H7s7k
 ImiiaOj97kZKwylwFnmxrRQ=
X-Google-Smtp-Source: APXvYqx8qHpVyMNgn+KXK4Ga99H83IyvN+gu/U0zu34xNKGN69+bZpzqlo+n/fuamwALPdtHuD1b7w==
X-Received: by 2002:a5d:54cd:: with SMTP id x13mr9856547wrv.12.1568266986685; 
 Wed, 11 Sep 2019 22:43:06 -0700 (PDT)
Received: from archlinux-threadripper ([2a01:4f8:222:2f1b::2])
 by smtp.gmail.com with ESMTPSA id b194sm11035883wmg.46.2019.09.11.22.43.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2019 22:43:05 -0700 (PDT)
Date: Wed, 11 Sep 2019 22:43:04 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH v3 3/3] powerpc/prom_init: Use -ffreestanding to avoid a
 reference to bcmp
Message-ID: <20190912054304.GA103826@archlinux-threadripper>
References: <20190911182049.77853-1-natechancellor@gmail.com>
 <20190911182049.77853-4-natechancellor@gmail.com>
 <CAKwvOdnh+YoACaX4Oxk7ZiEQAQ2VgA6W=Dtbk7gzK5yJduFvGQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdnh+YoACaX4Oxk7ZiEQAQ2VgA6W=Dtbk7gzK5yJduFvGQ@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 11, 2019 at 02:01:59PM -0700, Nick Desaulniers wrote:
> On Wed, Sep 11, 2019 at 11:21 AM Nathan Chancellor
> <natechancellor@gmail.com> wrote:
> >
> > r370454 gives LLVM the ability to convert certain loops into a reference
> > to bcmp as an optimization; this breaks prom_init_check.sh:
> >
> >   CALL    arch/powerpc/kernel/prom_init_check.sh
> > Error: External symbol 'bcmp' referenced from prom_init.c
> > make[2]: *** [arch/powerpc/kernel/Makefile:196: prom_init_check] Error 1
> >
> > bcmp is defined in lib/string.c as a wrapper for memcmp so this could be
> > added to the whitelist. However, commit 450e7dd4001f ("powerpc/prom_init:
> > don't use string functions from lib/") copied memcmp as prom_memcmp to
> > avoid KASAN instrumentation so having bcmp be resolved to regular memcmp
> > would break that assumption. Furthermore, because the compiler is the
> > one that inserted bcmp, we cannot provide something like prom_bcmp.
> >
> > To prevent LLVM from being clever with optimizations like this, use
> > -ffreestanding to tell LLVM we are not hosted so it is not free to make
> > transformations like this.
> >
> > Link: https://github.com/ClangBuiltLinux/linux/issues/647
> > Link: https://github.com/llvm/llvm-project/commit/5c9f3cfec78f9e9ae013de9a0d092a68e3e79e002
> 
> The above link doesn't work for me (HTTP 404).  PEBKAC?
> https://github.com/llvm/llvm-project/commit/5c9f3cfec78f9e9ae013de9a0d092a68e3e79e002

Not really sure how an extra 2 got added on the end of that... Must have
screwed up in vim somehow.

Link: https://github.com/llvm/llvm-project/commit/5c9f3cfec78f9e9ae013de9a0d092a68e3e79e00

I can resend unless the maintainer is able to fix that up when it gets
applied.

Cheers,
Nathan
