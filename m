Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D589130D3A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jan 2020 06:41:04 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47rkrZ0W9KzDqD4
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jan 2020 16:41:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::241;
 helo=mail-lj1-x241.google.com; envelope-from=byj.tea@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="kQIU7dGX"; 
 dkim-atps=neutral
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47rkpM4K7lzDqC5
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jan 2020 16:39:04 +1100 (AEDT)
Received: by mail-lj1-x241.google.com with SMTP id u71so49678635lje.11
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 05 Jan 2020 21:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GlkkInIyCG//aHEm2YZjtVGYBTSoUzhq7aMbB6wqBY8=;
 b=kQIU7dGXyHK5nRWZlaZpGXDAV18PHQE00gTrtC+Up+k9CsDijsoEnEu8ZzFfTlpg+C
 Zw/UDMwrlG4zBb69D4oC36DpQqQdfSJaYKZlnL64l1vDWSm7lhLZQ9hpgnOmAgWap1Hj
 0OVX13ZBTDamKffWGm5dpa0+II6+J0KE/ehkkJ5+32OhPq71yfyg60VVGJBGR/VELdd4
 Wx6KzswF51p8E4M/pe77zZ7IfwF+MZmfbzeEZvGP2VutoShnFsOzEoKQg8uQfNBVyXMV
 fHR7eZZYwjhjFqKMgYQRwle0fSuuWc4pZwWlCqlfgLoXm9stF3UzL0NySBDQusIyfX7R
 UCvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GlkkInIyCG//aHEm2YZjtVGYBTSoUzhq7aMbB6wqBY8=;
 b=mN4GJVhuek5CIIE6IOtaMDe1kts4mMOxh5U1TEkumHX3P+KgIPA17CzQzkMOtyVtMt
 Q/+c+aJIAGZpV6EmOe8W6ngHDN0XBcumCONygXfqPVr2YCYiqDQeaRuQSXL91Soh6mPs
 9nyg7d6WLv+1v6Nc1fbiPzdvtuW31vDFGV28GeIi9AQGxJbymk2xWSe0Ir5ry1ucisG1
 Gfoz6NoWczjlFYbph829MPeQSMmX4VMJ0B4Wd8cBVnOqi2vdzbw8x1MDFsDbEBKaY5B1
 ZC7CnQuHeA4QIOshYsMFlHSR0X9wbM6BW7bSSwWPYQ5hhb0TarKPjMHwdTMTn2h8MVmr
 9AMg==
X-Gm-Message-State: APjAAAXFWURR4lVyPY/UzMoCRt7/TDdDAN2EKGn0vHbQeYdFzshUhatP
 f1JYSoXZzgHHMO+mGcCB7ZWXq87H5F7PVMyifkg=
X-Google-Smtp-Source: APXvYqw/Mn7CLRfO8Sa9X3Wkha6pSbBkSmBw4YM1xZXTY1WQvhH1uqWAYfR9xjfMGrxrhQVH7EvsKxg9fnaWjvj70BU=
X-Received: by 2002:a2e:3609:: with SMTP id d9mr58015801lja.188.1578289141455; 
 Sun, 05 Jan 2020 21:39:01 -0800 (PST)
MIME-Version: 1.0
References: <1574694943-7883-1-git-send-email-yingjie_bai@126.com>
 <87pngglmxg.fsf@mpe.ellerman.id.au>
 <CAFAt38F-YQUVNXEnLut0tMivYUy_OTK7G4wAHfddcmncsEpREQ@mail.gmail.com>
 <9e680f3798f1a771cba4b41f7a5d7fda7f534522.camel@buserror.net>
 <CAFAt38FnH376ioDuvyNJW=iOxbcooRRsEeVEfDudRoV4gG98SQ@mail.gmail.com>
 <a37338283db548c58e6c36e4996a9474b1fe2038.camel@buserror.net>
 <CAFAt38HEUZ1tc-OGw2YF3-YcouG63h1uG8Quot=G5xj+u9pTtA@mail.gmail.com>
 <CAFAt38EFEh25Xv_K2GiO2CACW4v17fbtE0YnL0k3x61dERS2fw@mail.gmail.com>
In-Reply-To: <CAFAt38EFEh25Xv_K2GiO2CACW4v17fbtE0YnL0k3x61dERS2fw@mail.gmail.com>
From: Yingjie Bai <byj.tea@gmail.com>
Date: Mon, 6 Jan 2020 13:38:50 +0800
Message-ID: <CAFAt38GhDX0OMEz-3AcQRJy6q-cpO-GW_eDFGHmHYw5tZw6EXw@mail.gmail.com>
Subject: Re: [PATCH] powerpc/mpc85xx: also write addr_h to spin table for
 64bit boot entry
To: Scott Wood <oss@buserror.net>
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
Cc: yingjie_bai@126.com, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Scott,

Sorry for the late reply, I have checked the compilation error from
kbuild system, and found when CONFIG_PHYS_64BIT is not set,
phys_addr_t is 32bit, there is still "right shift count >= width of
type" error.
So I update the patches accordingly.

https://lore.kernel.org/patchwork/patch/1175560/
https://lore.kernel.org/patchwork/patch/1175559/


On Mon, Dec 30, 2019 at 3:41 PM Yingjie Bai <byj.tea@gmail.com> wrote:
>
> Hi Scott,
>
> Thanks for your time to review this patch
>
> Based on your suggestion, I have verified below new patches that pass
> compilation with and without CONFIG_RELOCATABLE
>
> https://lore.kernel.org/patchwork/patch/1173548
> https://lore.kernel.org/patchwork/patch/1173547
>
> On Wed, Dec 25, 2019 at 3:19 PM Yingjie Bai <byj.tea@gmail.com> wrote:
> >
> > Thanks Scott, I will test to see if returning phys_addr_t in __pa()
> > works for my setup.
> >
> > And another thin I will test is to compile without CONFIG_RELOCATABLE
> > before resubmitting the patch.
> >
> > On Wed, Dec 25, 2019 at 2:53 PM Scott Wood <oss@buserror.net> wrote:
> > >
> > > On Wed, 2019-12-25 at 11:24 +0800, Yingjie Bai wrote:
> > > > Hi Scott,
> > > >
> > > > __pa() returns 64bit in my setup.
> > > >
> > > > in arch/powerpc/include/asm/page.h
> > > >
> > > > #if defined(CONFIG_PPC32) && defined(CONFIG_BOOKE)
> > > > #define __va(x) ((void *)(unsigned long)((phys_addr_t)(x) +
> > > > VIRT_PHYS_OFFSET))
> > > > #define __pa(x) ((unsigned long)(x) - VIRT_PHYS_OFFSET)
> > > > #else
> > > > #ifdef CONFIG_PPC64
> > > > ...
> > > >
> > > >
> > > >
> > > > /* See Description below for VIRT_PHYS_OFFSET */
> > > > #if defined(CONFIG_PPC32) && defined(CONFIG_BOOKE)
> > > > #ifdef CONFIG_RELOCATABLE
> > > > #define VIRT_PHYS_OFFSET virt_phys_offset
> > > > #else
> > > > #define VIRT_PHYS_OFFSET (KERNELBASE - PHYSICAL_START)
> > > > #endif
> > > > #endif
> > >
> > > OK, so it's the lack of CONFIG_RELOCATABLE causing the build to fail.  Ideally
> > > we'd make __pa() consistently return phys_addr_t, even if the upper bits are
> > > known to always be zero in a particular config.
> > >
> > > -Scott
> > >
> > >
