Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 444C412CD6B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Dec 2019 08:43:56 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47mTvY2xMvzDq9B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Dec 2019 18:43:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d43;
 helo=mail-io1-xd43.google.com; envelope-from=byj.tea@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="tq72Hmt7"; 
 dkim-atps=neutral
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47mTsd6mtwzDq69
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Dec 2019 18:42:11 +1100 (AEDT)
Received: by mail-io1-xd43.google.com with SMTP id v3so30761471ioj.5
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Dec 2019 23:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ANVFGaLAaJoO/Rj+UxPUWyrZLAhcTC/tDRV7tpl7ss8=;
 b=tq72Hmt75sZ3kDa4nG5VGoFZ7vA03qPcuVzy5+JyGG8WMUshaN1dw7JDLkx3Nn1f0T
 nVBTGLt/vz7FaHqEfMkh+p4pb3VtqoGt8AoVrqYZ5ypPxMLGFBU2P223+UMTOPuKFnyy
 MCJWuYZsFIeX+sOo7zC093tchzXoJrEVfsUzBa1a5rfoRaX3XU/l59aud9UJtUDHa23F
 JFXfAOv7GHIJY/P71mI/PcMQfzLl0U1Ym3ebE6dLsXRAQXGR6jPaxWTwuqwgnJgQgKUe
 k97SYPqHGLcA+fYN8gjaDt/ea6MwRjmPw9KocduTukocsFY6qSBzSzWgZVBQGXvLCLKZ
 Ti3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ANVFGaLAaJoO/Rj+UxPUWyrZLAhcTC/tDRV7tpl7ss8=;
 b=IM0PBoeUIkNNBlVZRbklxMg+Kmi4nOTk/E/tbIo9nNtk3jI4m0Jmw/Jmci6lC1H+i4
 9eFj4+W3qKA/qjsDusjsM0KXFNXRek9txq/To/3gIfGsu6x09zzV1havF2qz/afWvTFe
 0TtD/Cp6zDTm2/PEwz3+qTU37FgE8eRZvDzM3ate5mEpGYql4Es4dZ/Z31ENou7e1mRU
 QcdYrY9RRa5wvsjzjCVN0JpztNb4FAFjiIezCCPmJmju6LsQdKGUQlHwrLSvy7OSgXVa
 hB6Ei3Y7zY7Z2kyHp4l6F5b2NyW/yPBu+xQQzzYFBlqiqxYOYx0NTj/TD/diObFHBJ0u
 eSQg==
X-Gm-Message-State: APjAAAUCDNxmgOb63hU8VMhcBckm1t21WGSRJ+D9VDFEJWK4KHYPqQp/
 2cpdv+AY9HoKeD469I82nCUDb9qwN1YsI47VCvk=
X-Google-Smtp-Source: APXvYqw2BxFkZM5706prgEKWvAiw+qAPwbnpe87gJbOVEGckdmIkgthjmJviD8Fjv8rie3U4gVtz2AADmm/wMrEdB/k=
X-Received: by 2002:a05:6638:723:: with SMTP id
 j3mr53276068jad.131.1577691728600; 
 Sun, 29 Dec 2019 23:42:08 -0800 (PST)
MIME-Version: 1.0
References: <1574694943-7883-1-git-send-email-yingjie_bai@126.com>
 <87pngglmxg.fsf@mpe.ellerman.id.au>
 <CAFAt38F-YQUVNXEnLut0tMivYUy_OTK7G4wAHfddcmncsEpREQ@mail.gmail.com>
 <9e680f3798f1a771cba4b41f7a5d7fda7f534522.camel@buserror.net>
 <CAFAt38FnH376ioDuvyNJW=iOxbcooRRsEeVEfDudRoV4gG98SQ@mail.gmail.com>
 <a37338283db548c58e6c36e4996a9474b1fe2038.camel@buserror.net>
 <CAFAt38HEUZ1tc-OGw2YF3-YcouG63h1uG8Quot=G5xj+u9pTtA@mail.gmail.com>
In-Reply-To: <CAFAt38HEUZ1tc-OGw2YF3-YcouG63h1uG8Quot=G5xj+u9pTtA@mail.gmail.com>
From: Yingjie Bai <byj.tea@gmail.com>
Date: Mon, 30 Dec 2019 15:41:56 +0800
Message-ID: <CAFAt38EFEh25Xv_K2GiO2CACW4v17fbtE0YnL0k3x61dERS2fw@mail.gmail.com>
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

Thanks for your time to review this patch

Based on your suggestion, I have verified below new patches that pass
compilation with and without CONFIG_RELOCATABLE

https://lore.kernel.org/patchwork/patch/1173548
https://lore.kernel.org/patchwork/patch/1173547

On Wed, Dec 25, 2019 at 3:19 PM Yingjie Bai <byj.tea@gmail.com> wrote:
>
> Thanks Scott, I will test to see if returning phys_addr_t in __pa()
> works for my setup.
>
> And another thin I will test is to compile without CONFIG_RELOCATABLE
> before resubmitting the patch.
>
> On Wed, Dec 25, 2019 at 2:53 PM Scott Wood <oss@buserror.net> wrote:
> >
> > On Wed, 2019-12-25 at 11:24 +0800, Yingjie Bai wrote:
> > > Hi Scott,
> > >
> > > __pa() returns 64bit in my setup.
> > >
> > > in arch/powerpc/include/asm/page.h
> > >
> > > #if defined(CONFIG_PPC32) && defined(CONFIG_BOOKE)
> > > #define __va(x) ((void *)(unsigned long)((phys_addr_t)(x) +
> > > VIRT_PHYS_OFFSET))
> > > #define __pa(x) ((unsigned long)(x) - VIRT_PHYS_OFFSET)
> > > #else
> > > #ifdef CONFIG_PPC64
> > > ...
> > >
> > >
> > >
> > > /* See Description below for VIRT_PHYS_OFFSET */
> > > #if defined(CONFIG_PPC32) && defined(CONFIG_BOOKE)
> > > #ifdef CONFIG_RELOCATABLE
> > > #define VIRT_PHYS_OFFSET virt_phys_offset
> > > #else
> > > #define VIRT_PHYS_OFFSET (KERNELBASE - PHYSICAL_START)
> > > #endif
> > > #endif
> >
> > OK, so it's the lack of CONFIG_RELOCATABLE causing the build to fail.  Ideally
> > we'd make __pa() consistently return phys_addr_t, even if the upper bits are
> > known to always be zero in a particular config.
> >
> > -Scott
> >
> >
