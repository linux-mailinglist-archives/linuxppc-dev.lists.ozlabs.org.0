Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F68032AA60
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Mar 2021 20:31:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DqnL61wCGz3d3L
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Mar 2021 06:31:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Lp7mh2C4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22e;
 helo=mail-oi1-x22e.google.com; envelope-from=alexdeucher@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Lp7mh2C4; dkim-atps=neutral
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DqnKj2XJcz30Q7
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Mar 2021 06:30:48 +1100 (AEDT)
Received: by mail-oi1-x22e.google.com with SMTP id x20so23153172oie.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 02 Mar 2021 11:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w+SvXqEUjfhHwthcmMkrQk6d+ywLo9CmIC2aql3ZVM0=;
 b=Lp7mh2C4IHdf0flEGeKe/5N8ZYv6KEEUscBWkwK1euVPGZ/fOHaRUUpBQnOpSgw/si
 xY+qfrjzZF1/am/b6SwS9j6EZgOol6H/gb4/AGyAlk3BbhEoT2ZAbIIpvQuondXQlcU0
 wLG3M1raZqNKtcfCbJmLXbjsYHFA01JqedLealCorhgejMvwwmzFsVgx+Ad4KGxFznvG
 EyU7C/gs4iWpZ7lPgLBGUauUIi6ATTILlwLP19Wx31EpdPTyC5h1/UWGXxiC4OK7T0jB
 3ZkUdZ/EAxW/34sWDTcRSdtvk7HhGBBSCY3IfWdMA/li4ff9B9giPEkYjw62qhWGK2Cw
 yA0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w+SvXqEUjfhHwthcmMkrQk6d+ywLo9CmIC2aql3ZVM0=;
 b=af7WA/VablWhcowS9AkzdFHhhQqGiQ+8oSSzNSZBiKp7oVvWCMmc49NzPvIIjZfFz3
 IZZ74GRnkdK5PPNFpknl1i/pROsRIRq8UP2cvYln6qilSBdwW7v2BCIR9C0hW71qh0PU
 mzjL4kKZrLUqx8uJzAQuWHHDuEWBjenuKtTM91LkRASG1sIm03FYEqh/0I/YXwW3XxpS
 tAUiifl96OOLoypsQ7nm74ji/huwwnEwtgiuaNN1pIWe2+V5YXsg2iHm76j9qJ/fYQtY
 PN1JnDvlwjPgKryK8SYLtKS3Q4jO5tjzqlH8Xl3doEEFJAGUzAThzkPYVe92tkg+9UVE
 BZbw==
X-Gm-Message-State: AOAM532u8/AzD0F3zXMRphXh7GKnEWGFu6si+wzF/i/D1GdO4nrFh2pP
 f20LcABEEUabjC61F8iHYgGdrigHewlUG7um5cI=
X-Google-Smtp-Source: ABdhPJzlv/EMCY/06qzQWW42RcptrNGrRcveS7uV6iQI72w++yR/IzUbjOzwaHiRbj/bu1zhokO2qeQJsPzzePUxsU4=
X-Received: by 2002:a05:6808:f15:: with SMTP id
 m21mr4350086oiw.123.1614713444602; 
 Tue, 02 Mar 2021 11:30:44 -0800 (PST)
MIME-Version: 1.0
References: <20210301104316.2766484-1-geert@linux-m68k.org>
 <alpine.DEB.2.22.394.2103011342520.710098@ramsan.of.borg>
In-Reply-To: <alpine.DEB.2.22.394.2103011342520.710098@ramsan.of.borg>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 2 Mar 2021 14:30:33 -0500
Message-ID: <CADnq5_O-j8EWL+Eb8zK-7WqUuWKWETVWYRQNFdS_ymUSgo1jrg@mail.gmail.com>
Subject: Re: Build regressions/improvements in v5.12-rc1
To: Geert Uytterhoeven <geert@linux-m68k.org>
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 1, 2021 at 9:21 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> On Mon, 1 Mar 2021, Geert Uytterhoeven wrote:
> > Below is the list of build error/warning regressions/improvements in
> > v5.12-rc1[1] compared to v5.11[2].
> >
> > Summarized:
> >  - build errors: +2/-0
>
> > [1] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/fe07bfda2fb9cdef8a4d4008a409bb02f35f1bd8/ (all 192 configs)
> > [2] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/f40ddce88593482919761f74910f42f4b84c004b/ (all 192 configs)
> >
> >
> > *** ERRORS ***
> >
> > 2 error regressions:
> >  + /kisskb/src/drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c: error: implicit declaration of function 'disable_kernel_vsx' [-Werror=implicit-function-declaration]:  => 674:2
> >  + /kisskb/src/drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c: error: implicit declaration of function 'enable_kernel_vsx' [-Werror=implicit-function-declaration]:  => 638:2
>
> powerpc-gcc4.9/ppc64_book3e_allmodconfig
>
> This was fixed in v5.11-rc1, but reappeared in v5.12-rc1?

Do you know what fixed in for 5.11?  I guess for PPC64 we depend on CONFIG_VSX?

Alex

>
> Gr{oetje,eeting}s,
>
>                                                 Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                                             -- Linus Torvalds
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
