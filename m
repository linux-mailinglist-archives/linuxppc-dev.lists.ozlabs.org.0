Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F019C6A4F90
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Feb 2023 00:10:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PQbp34tT3z3c63
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Feb 2023 10:10:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=dE9jVGLG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::112b; helo=mail-yw1-x112b.google.com; envelope-from=elver@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=dE9jVGLG;
	dkim-atps=neutral
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PQbn86pkGz3bTc
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Feb 2023 10:10:03 +1100 (AEDT)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-536c2a1cc07so221793667b3.5
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Feb 2023 15:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QFjaeE4eSo23upfyzVu9yFw6RjIFdreut8TNcWwSiF4=;
        b=dE9jVGLG/4tiI3x6Dm2ln1b5O0ij+v6xIJv9LjSu2Sq8avzQ5a10IA9zBy09wz78lm
         fh1mu648v/L5g/J0LjSzxqiWhzxAlc6SyMsYfjUvDPvy15L0IQYO9zspThNSRe89Qf7m
         YIHoFbp1lSLh6EBlYbN1DuXyTIiiJ3MFMmJREAp8uTb0y6nn6YY/dkurgx7MnVbEnoCN
         yXQxw0l9EzOEWsOCDUsiccJo8JXhF6c05O9dZZC2PKw8OnS4ABpoLCLTz4U1XQcOhC0e
         hCsWVNFwhpNd6lfI1BbipBoVJzqRvGWVfYt/tatONd87JuzoYtE1ygzZyNONGoFE3YBX
         eNeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QFjaeE4eSo23upfyzVu9yFw6RjIFdreut8TNcWwSiF4=;
        b=uYEdtF5XHYuFN3gNiM08hbdoRBCxqz71N0yAuoKQ1oXlm7XWVhkrzhFrLmiJDcizM4
         xkyEFcehFoW3CX2qMINWQDeY46xMsMk6ljKBj9Ls4Io1r+F4YsXGO4u2miVfpH9kPWkR
         m+4fVZwq27d/EiAFWmlEFRNpoKu2ZHnj3XIVYpSU/H3nui/YHT6oQioDquJM7BxPwUiA
         5b4nZi4wuM7xsxtOIPG1NU5sVN/3DDr78ETIn4Q3J5wrxnDrkwUArE7jUdVOp4yYsix+
         BKSnjbbMijdL7n0KyxX99LxV2ridh/FB5r6BrtuSKhZnTPa7pUc2GGtOlU1CfZvX6tyz
         5gcA==
X-Gm-Message-State: AO0yUKUXd6m4Cp1k30f6AMVyIBgdu4mxFKEOz71DQuSrGT2lH9M7AIMo
	5g+WbGSxoSZkvlcToS5McV0LC98aLfdf5ZNHrmPxoQ==
X-Google-Smtp-Source: AK7set9qHVWcnczC7w/zdZpnGo7qQwK8i/JAfp2TvzaYrL306mHwychbjLxDpLl/X96ArazXBXjqTO1MX9W/D4/zI7k=
X-Received: by 2002:a25:e210:0:b0:a99:de9d:d504 with SMTP id
 h16-20020a25e210000000b00a99de9dd504mr213188ybe.12.1677539399179; Mon, 27 Feb
 2023 15:09:59 -0800 (PST)
MIME-Version: 1.0
References: <20230227094726.3833247-1-elver@google.com> <20230227141646.084c9a49fcae018852ca60f5@linux-foundation.org>
In-Reply-To: <20230227141646.084c9a49fcae018852ca60f5@linux-foundation.org>
From: Marco Elver <elver@google.com>
Date: Tue, 28 Feb 2023 00:09:13 +0100
Message-ID: <CANpmjNNtxW41H8ju6iog=ynMdEE0awa7GYabsuL6ZRihmVYQHw@mail.gmail.com>
Subject: Re: [PATCH mm] kasan, powerpc: Don't rename memintrinsics if compiler
 adds prefixes
To: Andrew Morton <akpm@linux-foundation.org>
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
Cc: kernel test robot <lkp@intel.com>, Daniel Axtens <dja@axtens.net>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linux-mm@kvack.org, Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, Liam Howlett <liam.howlett@oracle.com>, kasan-dev@googlegroups.com, Vincenzo Frascino <vincenzo.frascino@arm.com>, linuxppc-dev@lists.ozlabs.org, Dmitry Vyukov <dvyukov@google.com>, Andrey Konovalov <andreyknvl@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 27 Feb 2023 at 23:16, Andrew Morton <akpm@linux-foundation.org> wrote:
>
> On Mon, 27 Feb 2023 10:47:27 +0100 Marco Elver <elver@google.com> wrote:
>
> > With appropriate compiler support [1], KASAN builds use __asan prefixed
> > meminstrinsics, and KASAN no longer overrides memcpy/memset/memmove.
> >
> > If compiler support is detected (CC_HAS_KASAN_MEMINTRINSIC_PREFIX),
> > define memintrinsics normally (do not prefix '__').
> >
> > On powerpc, KASAN is the only user of __mem functions, which are used to
> > define instrumented memintrinsics. Alias the normal versions for KASAN
> > to use in its implementation.
> >
> > Link: https://lore.kernel.org/all/20230224085942.1791837-1-elver@google.com/ [1]
> > Link: https://lore.kernel.org/oe-kbuild-all/202302271348.U5lvmo0S-lkp@intel.com/
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Marco Elver <elver@google.com>
>
> Seems this is a fix against "kasan: treat meminstrinsic as builtins in
> uninstrumented files", so I'll plan to fold this patch into that patch.

Yes, that looks right.

If a powerpc maintainer could take a quick look as well would be good.
The maze of memcpy/memmove/memset definitions and redefinitions isn't
the simplest - I hope in a few years we can delete all the old code
(before CC_HAS_KASAN_MEMINTRINSIC_PREFIX), and let the compilers just
"do the right thing".

Thanks,
-- Marco
