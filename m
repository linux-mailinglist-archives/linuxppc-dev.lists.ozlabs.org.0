Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D96494F1A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jan 2022 14:36:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jfk7g4Cmlz3bbj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 00:36:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=f6do9cXf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=guoren@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=f6do9cXf; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jfk6y74y6z2xrc
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jan 2022 00:36:10 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F3F996176C
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jan 2022 13:36:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB9D7C340EC
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jan 2022 13:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642685767;
 bh=6jJqCWRTzzUUFc2Awke9IkkPGC7X5zNsQTSVKll9PUQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=f6do9cXfKBIhavH9kot/9wsjq2yObe2lT7dMc1dGUr3hFaIHULRpc6Im9hBAIcisC
 eDekM99GYajIpqxj6pk3pf8POql1UVa55NAT7X5tjRFB9UsnxZslxCWB5WZWqBDVJr
 8gDeXdyIroIlE//1234wZAOr1J5PAF//PpO/tp0C8PN9cs8JcSeKYxBJeAO+fJX5f8
 Zzw9mWQdJHl7vQGGXNGqTETTdXAZvSS2AkRWCFWvBQVfO4iJLfOUyeTYEfGr+VvXtZ
 KkebSvrN6+FTyVOToFkMm3YZrKZfFcQi9tF8PdPBl3l8R5P30PQMDQ75SGyfnZ8nsJ
 hG4QcSP3+PQvg==
Received: by mail-ua1-f41.google.com with SMTP id m90so10901453uam.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jan 2022 05:36:07 -0800 (PST)
X-Gm-Message-State: AOAM533bYnZz7/tQaWUkQsaKc2xeGWEXLyR9da4th67NMl/IK/DUZThV
 iQyCXyy1+0SfmXvEWgVKD9/uqBnSvZbidZVK6KU=
X-Google-Smtp-Source: ABdhPJwONmW1aazI1eCt0g+A2J9M0/Dq8pC6p8K0QjKcU/9jXkiBA8g9Bq8N9trIX7DU0e3r8/DVXgSoIzqqFr0N4e8=
X-Received: by 2002:a05:6102:34ec:: with SMTP id
 bi12mr12309550vsb.51.1642685766798; 
 Thu, 20 Jan 2022 05:36:06 -0800 (PST)
MIME-Version: 1.0
References: <20220120073911.99857-11-guoren@kernel.org>
 <CAK8P3a2HaeFGdOr4Rm_ZcEP0rjh2Mo53=-ZRnEPtFfnmzfeE6g@mail.gmail.com>
In-Reply-To: <CAK8P3a2HaeFGdOr4Rm_ZcEP0rjh2Mo53=-ZRnEPtFfnmzfeE6g@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 20 Jan 2022 21:35:56 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQnrCS1X6KQt0pbNFc01sYgBDgfb9RGT1G=rTEGK1mbRQ@mail.gmail.com>
Message-ID: <CAJF2gTQnrCS1X6KQt0pbNFc01sYgBDgfb9RGT1G=rTEGK1mbRQ@mail.gmail.com>
Subject: Re: [PATCH V3 10/17] riscv: compat: Add elf.h implementation
To: Arnd Bergmann <arnd@arndb.de>
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
Cc: linux-s390 <linux-s390@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>,
 gregkh <gregkh@linuxfoundation.org>, Drew Fustini <drew@beagleboard.org>,
 Anup Patel <anup@brainfault.org>, Wang Junqiang <wangjunqiang@iscas.ac.cn>,
 the arch/x86 maintainers <x86@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, inux-parisc@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 liush <liush@allwinnertech.com>, sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christoph Hellwig <hch@lst.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, Wei Fu <wefu@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 20, 2022 at 9:33 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Thu, Jan 20, 2022 at 8:39 AM <guoren@kernel.org> wrote:
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > Implement necessary type and macro for compat elf. See the code
> > comment for detail.
> >
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
>
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>
>
> > +
> > +/*
> > + * FIXME: not sure SET_PERSONALITY for compat process is right!
> > + */
> > +#define SET_PERSONALITY(ex)                                    \
> > +do {    if ((ex).e_ident[EI_CLASS] == ELFCLASS32)              \
> > +               set_thread_flag(TIF_32BIT);                     \
> > +       else                                                    \
> > +               clear_thread_flag(TIF_32BIT);                   \
> > +       if (personality(current->personality) != PER_LINUX32)   \
> > +               set_personality(PER_LINUX |                     \
> > +                       (current->personality & (~PER_MASK)));  \
> > +} while (0)
> > +
>
> The implementation looks good to me now,  you can remove that comment above it.
Thx for pointing it out. I forgot.

>
>         Arnd



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/
