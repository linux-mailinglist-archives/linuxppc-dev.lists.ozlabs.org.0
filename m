Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 202CD1D79B0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 May 2020 15:23:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Qfq40Yz0zDqZb
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 May 2020 23:23:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e42;
 helo=mail-vs1-xe42.google.com; envelope-from=emil.l.velikov@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=P/j+l4rl; dkim-atps=neutral
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Qfl33hslzDqWc
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 May 2020 23:20:12 +1000 (AEST)
Received: by mail-vs1-xe42.google.com with SMTP id l15so3637851vsr.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 May 2020 06:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=smFwrGW+2ZYyRm3yJx9TvCDHllY75XTU0ZDXk/besJY=;
 b=P/j+l4rloAGJ5+zOh7ldG3MH1MdKGjKsbOchWEgDz0r3TcptKxJ1Bp8HWPcC1S3fmm
 rX/Ml0ruOt+Zix5rJNR8BVurvVsN/K4gCUQfEm62amnKjAll6C/pestSxWW+iWgQY9jy
 tTWNTrDxkQrfrVc+lNfLeVJrBgZ7/vicsqJWKimsblBlPKhR/CVoKdlJ3NNCPiHj0qtI
 bJ6v+HqXqrmGR0xZPvzDg/uhV1AwqgA3sHXFT5MkuzYewlbMnfUAmm2kngveuxpuS8e+
 8bF+VeDJ1VAOdMMzqlMvEgvuvxO+HvNfpuR4H+ZPstuBIbaUn4xjW0RSWNyPxwHa3724
 uDUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=smFwrGW+2ZYyRm3yJx9TvCDHllY75XTU0ZDXk/besJY=;
 b=Evavm/3uZzxND4RGPEsrJt3yC5KuNOT1wriLl0npYHVo3yMVDbY7onn31tQK/T4XHj
 MwFJfrIi1s5NBuMYRd1ILUp25uHNiduf5R8XoUppeS2yUpvIQW1lqbFYiD806CB1XY7e
 74hsi2ngttMUJl+GWGAWx8IFT3wvUBApMj09eqfzHVc3Hrka+A1nHR2PDFOssb9VfY4E
 ht7W06YPFpJiukpVzoez6BLRia2bo7bHxmT8BahrHiQ42qCaQ+lM6KCFNCFMlzlZKDmi
 Z8txJkIeltgYtNTNdPc5ukT8nkeRJvf7fwNYeJA7yIdkwzC07TKEK3keYvmETU3nNojD
 aJJg==
X-Gm-Message-State: AOAM531id2R4Vd+8yhM4vFL0VPkGQ2DkpRnmcWF12wP0TP2kEpOl12OQ
 qWXM/Opq4TYG5c8Jm5TEiLhhNUkUi2C60rJMQ2A=
X-Google-Smtp-Source: ABdhPJyB9j3yxm/3uct+3is6hkBldRsVNEHECFEnQ4z23rMWJaJ9Tdo/jYPHQ+KXggCqQyHhC6tZDoDIkFVYF/4KxZU=
X-Received: by 2002:a67:be19:: with SMTP id x25mr1506536vsq.37.1589808009106; 
 Mon, 18 May 2020 06:20:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200517220524.4036334-1-emil.l.velikov@gmail.com>
 <20200517220524.4036334-2-emil.l.velikov@gmail.com>
 <87d071aedu.fsf@mpe.ellerman.id.au>
 <CGME20200518112226eucas1p1aa59db1e75cf0f91454b8714c828444c@eucas1p1.samsung.com>
 <CACvgo53uWVmhwon4+Fn5=_4HPXSciqNrf1MSJjt1kA3G2wyECw@mail.gmail.com>
 <3bd8fb59-2a91-64d7-bef9-d5f717c49bfb@samsung.com>
In-Reply-To: <3bd8fb59-2a91-64d7-bef9-d5f717c49bfb@samsung.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Mon, 18 May 2020 14:19:57 +0100
Message-ID: <CACvgo53=Vv7R-8BP32iQXwgvfxjJ8W5XCBmMq-tdUG-wUN6_4A@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] powerpc/configs: replace deprecated riva/nvidia
 with nouveau
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
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
Cc: linux-fbdev <linux-fbdev@vger.kernel.org>,
 Antonino Daplas <adaplas@gmail.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 18 May 2020 at 13:48, Bartlomiej Zolnierkiewicz
<b.zolnierkie@samsung.com> wrote:
>
>
> On 5/18/20 1:19 PM, Emil Velikov wrote:
> > Hi Michael,
> >
> > On Mon, 18 May 2020 at 08:30, Michael Ellerman <mpe@ellerman.id.au> wrote:
> >>
> >> Emil Velikov <emil.l.velikov@gmail.com> writes:
> >>> As mentioned in earlier commit, the riva and nvidia fbdev drivers have
> >>> seen no love over the years, are short on features and overall below par
> >>>
> >>> Users are encouraged to switch to the nouveau drm driver instead.
> >>>
> >>> v2: Split configs to separate patch, enable nouveau (Bartlomiej)
> >>>
> >>> Cc: Antonino Daplas <adaplas@gmail.com>
> >>> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> >>> Cc: linux-fbdev@vger.kernel.org
> >>> Cc: dri-devel@lists.freedesktop.org
> >>> Cc: Michael Ellerman <mpe@ellerman.id.au>
> >>> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> >>> Cc: Paul Mackerras <paulus@samba.org>
> >>> Cc: linuxppc-dev@lists.ozlabs.org
> >>> Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
> >>> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch> (v1)
> >>> ---
> >>> Hi all unless, there are objections I would prefer to merge this via
> >>> the drm tree.
> >>
> >> Have you tested that the resulting kernels work on the relevant
> >> hardware?
> >>
> > Sadly, no I haven't. I'm updating the defconfigs as requested by the
> > fbdev maintainer.
>
> I've just noticed that v1 (patch #1/1) & v2 (patch #1/2) lack
> Cc: to powerpc Maintainers so they cannot see the context of
> changes in this patch.
>
Haven't see any instances of fbdev/drm patches being Cc to arch/ developers.
As such I made sure the commit message illustrates 1/2 as clearly as possible.

> Also you've proposed v1 yourself and it has already contained
> modifications to defconfigs (removal of setting the config
> options for the old drivers) in addition to marking the old
> drivers as BROKEN.
>
> It now turns out that v1 has also never been tested. :(
>
> Please don't submit untested patches without marking them
> as such.
>
Does x86 box with nv34 GPU count as testing? I suspect not :-(
It was been using nouveau ever since I bought it 15+ years ago.

Will be more careful in the future.

-Emil
