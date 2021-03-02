Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1479F32AAD8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Mar 2021 21:01:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dqp1P0GbQz3cZS
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Mar 2021 07:01:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.217.49; helo=mail-vs1-f49.google.com;
 envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com
 [209.85.217.49])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dqp136C2yz30N0
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Mar 2021 07:01:26 +1100 (AEDT)
Received: by mail-vs1-f49.google.com with SMTP id l192so11282501vsd.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 02 Mar 2021 12:01:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lzf9U5TyFr8YSgCYbQV0aCCbWT0MRYgraMrf2J/E5OM=;
 b=sydWiZRDE0/0eWMqx/No+yE8eGl8CR+K1kdeCbTFx96X1HC3vP9uOT1HlOpz/PHPfg
 XmqVAWbEBschFUZd2JtPmVU6WRzSSTVj2E4o/mj0IELUI+BOpHp1CSImPdkD5FMxh6LP
 hljjfBlkKE8BGOCm4X0biEecqjp9R0IJwNTAL0aULdked7iyCGrPZcp7x1SLc4nc0wOi
 s1SBc+tRymQiQtCsE/a+8wiuXWe8JaONLhKmjbYQxhhIZIfldmoeTFZZoDL0oSk3T/dm
 MA1BmO8XFBk4gElAQaHrWIzu6FN9G21jJuKJ+hCctJlyfG9BpIlbs8Db8labAHMoBlfi
 6HMQ==
X-Gm-Message-State: AOAM531O+m43bjC9VAcaT9WWfUIXLFn0OBn0rYgbavbL9Ompzq/3AWM+
 M2GJiavp8cUery0NJyhuNFoo/CQV/qI0D24NkRA=
X-Google-Smtp-Source: ABdhPJzRCGpW4RCsZEhpYEAn3MR1Q73gbJHqe3CH+KRCFvVBwE5R/NVI0GIx7VbV9hgc+A3Gg/HXK7gUOE34HM0PfoU=
X-Received: by 2002:a67:fb86:: with SMTP id n6mr3865292vsr.3.1614715282171;
 Tue, 02 Mar 2021 12:01:22 -0800 (PST)
MIME-Version: 1.0
References: <20210301104316.2766484-1-geert@linux-m68k.org>
 <alpine.DEB.2.22.394.2103011342520.710098@ramsan.of.borg>
 <CADnq5_O-j8EWL+Eb8zK-7WqUuWKWETVWYRQNFdS_ymUSgo1jrg@mail.gmail.com>
In-Reply-To: <CADnq5_O-j8EWL+Eb8zK-7WqUuWKWETVWYRQNFdS_ymUSgo1jrg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 2 Mar 2021 21:01:10 +0100
Message-ID: <CAMuHMdVFstnce-WKmj=4h3ZdtSThJNOLz_f1ervcZxE6hg=KsA@mail.gmail.com>
Subject: Re: Build regressions/improvements in v5.12-rc1
To: Alex Deucher <alexdeucher@gmail.com>
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

Hi Alex,

On Tue, Mar 2, 2021 at 8:30 PM Alex Deucher <alexdeucher@gmail.com> wrote:
> On Mon, Mar 1, 2021 at 9:21 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Mon, 1 Mar 2021, Geert Uytterhoeven wrote:
> > > Below is the list of build error/warning regressions/improvements in
> > > v5.12-rc1[1] compared to v5.11[2].
> > >
> > > Summarized:
> > >  - build errors: +2/-0
> >
> > > [1] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/fe07bfda2fb9cdef8a4d4008a409bb02f35f1bd8/ (all 192 configs)
> > > [2] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/f40ddce88593482919761f74910f42f4b84c004b/ (all 192 configs)
> > >
> > >
> > > *** ERRORS ***
> > >
> > > 2 error regressions:
> > >  + /kisskb/src/drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c: error: implicit declaration of function 'disable_kernel_vsx' [-Werror=implicit-function-declaration]:  => 674:2
> > >  + /kisskb/src/drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c: error: implicit declaration of function 'enable_kernel_vsx' [-Werror=implicit-function-declaration]:  => 638:2
> >
> > powerpc-gcc4.9/ppc64_book3e_allmodconfig
> >
> > This was fixed in v5.11-rc1, but reappeared in v5.12-rc1?
>
> Do you know what fixed in for 5.11?  I guess for PPC64 we depend on CONFIG_VSX?

Looking at the kisskb build logs for v5.11*, it seems compilation never
got to drivers/gpu/drm/ due to internal compiler errors that weren't caught
by my scripts.  So the errors listed above were not really fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
