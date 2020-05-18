Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 512361D76FC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 May 2020 13:26:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49QcCD5C25zDqSs
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 May 2020 21:26:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e43;
 helo=mail-vs1-xe43.google.com; envelope-from=emil.l.velikov@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=VW6T08EV; dkim-atps=neutral
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Qc7674D9zDqbG
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 May 2020 21:22:26 +1000 (AEST)
Received: by mail-vs1-xe43.google.com with SMTP id 1so5299260vsl.9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 May 2020 04:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tHuAEzfw9tuYOSZHCyAU4yXSLfdz7ow6WkHkmLGW/Hc=;
 b=VW6T08EVdGp2wmc8Bw6D4Kq5WtPvvCn5aG8vjo/80e6pzxbH/1PAQiWiBzmAEd+fU6
 gnjoBy2IgqAxPTy0d4Y9+QhUTR4c3+XWIdgsDAKsrC69jLmWZUmssXWvFXZh8bh2o6T7
 DIeiCMcN0aQ5SD0V6haW96B5yJaFEZNEZ4NUs+t6WhA2WVWFn0L+5vjsvK0oOCNBCkc7
 mGEJbbNKXH3hfFf0+0tmvoUV4AXD09678KhXTZJXKug8DR5eO8wWHmZ2EW4jV2kHT3DQ
 KpxUwIYArjCb25SjIFcbOe9+XLk/Kbem7hg3MZm+Y0euul5/ZaUePHUl4ycTUEFG3DvZ
 oQug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tHuAEzfw9tuYOSZHCyAU4yXSLfdz7ow6WkHkmLGW/Hc=;
 b=J/P5SZd8kdLENVHtxSh1o2LD+dbgPu8Hyqe32gCUL5KgbMzLMy6DXKWUDnHpad9Ya1
 ZkfS1XsRxRm6wFj6v5QNuLw1rn1dLeb41im4WKL8GNUs+xVtRlajOrFLvSITxI+WjASX
 D2RQx2FI7+Ac/OmlZOBe6T9RZ5b4Clmfed9TiJnlmbcSBQn5ZLMGdxbqFUbsKWkL9KTW
 mHHGkVPbJqpEPyXg9Dvb8ymkvJVQmUqfTQd+A1wZ2NhuUSmAnyuqpEoVVlVlnL+xGm5I
 hTQ2t+MPGYF6AMnw9vZLtsddq+CAX3xoe/5bgKVbSU7q0gZ1kdcYAdgoz9KWZJvjz7vG
 7IJQ==
X-Gm-Message-State: AOAM530ROGYWS6N+tz8oVQq6kRem6eHTBup+ATWAzHVeCuRE36UATdU1
 rQfCTELuQrFHm18mHZrYwyHjpE5WIZxx1Qw1+Uk=
X-Google-Smtp-Source: ABdhPJy/95uwpzVKDDKLorM+Bwxwmm1+wCZJM69Wfw0Un1EZjqct2LY7TJtYdyJhNEaEoDULsUYGR7hGLpw3Pi5+nro=
X-Received: by 2002:a67:de0a:: with SMTP id q10mr10729227vsk.138.1589800942959; 
 Mon, 18 May 2020 04:22:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200517220524.4036334-1-emil.l.velikov@gmail.com>
 <20200517220524.4036334-2-emil.l.velikov@gmail.com>
 <87d071aedu.fsf@mpe.ellerman.id.au>
In-Reply-To: <87d071aedu.fsf@mpe.ellerman.id.au>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Mon, 18 May 2020 12:19:32 +0100
Message-ID: <CACvgo53uWVmhwon4+Fn5=_4HPXSciqNrf1MSJjt1kA3G2wyECw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] powerpc/configs: replace deprecated riva/nvidia
 with nouveau
To: Michael Ellerman <mpe@ellerman.id.au>
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
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael,

On Mon, 18 May 2020 at 08:30, Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Emil Velikov <emil.l.velikov@gmail.com> writes:
> > As mentioned in earlier commit, the riva and nvidia fbdev drivers have
> > seen no love over the years, are short on features and overall below par
> >
> > Users are encouraged to switch to the nouveau drm driver instead.
> >
> > v2: Split configs to separate patch, enable nouveau (Bartlomiej)
> >
> > Cc: Antonino Daplas <adaplas@gmail.com>
> > Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> > Cc: linux-fbdev@vger.kernel.org
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> > Cc: Paul Mackerras <paulus@samba.org>
> > Cc: linuxppc-dev@lists.ozlabs.org
> > Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
> > Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch> (v1)
> > ---
> > Hi all unless, there are objections I would prefer to merge this via
> > the drm tree.
>
> Have you tested that the resulting kernels work on the relevant
> hardware?
>
Sadly, no I haven't. I'm updating the defconfigs as requested by the
fbdev maintainer.

> The old drivers may be crufty but they presumably have been tested by
> people and at least somewhat work.
>
> So I'd be inclined to leave the defconfigs alone until someone can test
> that the new driver works at all.
>
Works for me.

> I gave it a quick spin on a G5 I have access to and dmesg has a bunch of
> errors in it (see below). I can't actually tell if the display is
> working because the machine is remote, and I can't go and check it at
> the moment because the office is closed.
>

From what I can see, there seems to be three bits:
 - attempted out-of-bound attempts to read the vbios
Genuine concern or noise? Likely using the bios from open firmware,
check any of the other options - see NvBios in [1]
 - cannot figure out the timer input frequency
No idea
 - the TV1 EDID is empty
Is there an actual TV connected to the device, check with another cable

Regardless of the patches, reporting [2] the above would be a nice move.

Thanks
Emil
[1] https://nouveau.freedesktop.org/wiki/KernelModuleParameters/
[2] https://gitlab.freedesktop.org/xorg/driver/xf86-video-nouveau/-/issues
