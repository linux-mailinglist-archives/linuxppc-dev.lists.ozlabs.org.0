Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FAB5B3619
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 13:14:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MPD0D6fjFz3bxL
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 21:14:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=dg5mwnKF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b32; helo=mail-yb1-xb32.google.com; envelope-from=lukas.bulwahn@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=dg5mwnKF;
	dkim-atps=neutral
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MPCzf4w6bz2yp5
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Sep 2022 21:13:48 +1000 (AEST)
Received: by mail-yb1-xb32.google.com with SMTP id g5so2121142ybg.11
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Sep 2022 04:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=gmp0HKBH5+KYCw+NJuLL3WyMUpUJK+zAtsC9QZ5RPFQ=;
        b=dg5mwnKF3yovtERNp4+A0F+Tm2R2x8L79smsmD5SvCY1hPLO/quY8DBPLTA9k4BAbi
         4zv+P+MClaRnezy0Y0HWE402hf3SjjjQ2NXNLzdU8JUYeJqhi8P3lXNuJmARoN6mMgbG
         Qzz5OPdOF0Kkm0RnmHivlIaOwso3tLF0FsIGRiASpHQPuGFyMczmaRX+JcRPiNpX+b3Z
         IkXDtHR+Tkfu1SLOgFSFCPgKfVYdxrDdSbZCDPWDSybS3s5/dhfLvXar1pWid6nIKmzc
         xy1v6qcv3BvH0eW3LbYh1lJTF0wOgLD66+wJ/u+BWTAKGfJsc/hfrofzXVr4rub/tVXi
         hV6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=gmp0HKBH5+KYCw+NJuLL3WyMUpUJK+zAtsC9QZ5RPFQ=;
        b=0oudTVEo97WXJ1o+suQ8UwiAY2iLXWUsM4zIudPcwk3ZWSLuFVXOGx4qBMvQfvYi1S
         2GAaBO0MD61XK+0LNpt3zCnALXB6IkRIIvMO+JIiAEFObRUHKELnUbrUoaZQmVpCsVse
         KwwpNtHmj/V29ZjRiQpCprMB98B0UgV3CXsO+NQKLfo/AbWGgQyK6FDJ9W7NqzRi4d3i
         /yndP5+x855I44i/OkulOjkdfKpIB0iXVTpLAmoYxmopO3kLeDBOACm1v9ihX23cR/zk
         7qNxcKWVxaivTdxmk0QF4aAAMbzY3G5991FwYY2ZNTutYJD5NkBrqe432ZpIFkAqCFAI
         ytgA==
X-Gm-Message-State: ACgBeo2nYpqebxhrI9R3UekLohh8VvlfH7RI76SOYAUFf0ymeXaW+L7X
	pv9L2Vb5U+OLujUDa2MslnJAkRKugAq+FDBs034=
X-Google-Smtp-Source: AA6agR7DEm+hf2rkuJd8OwC/lCqHve1KyOzzsWxcuFa4eCXvbO+BjFrn9/cdm4E2wIFA/MSJD8ad39r3UhaoFC4ax8s=
X-Received: by 2002:a05:6902:89:b0:695:7ed0:d8cb with SMTP id
 h9-20020a056902008900b006957ed0d8cbmr11198174ybs.77.1662722025136; Fri, 09
 Sep 2022 04:13:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220909090343.21886-1-lukas.bulwahn@gmail.com> <21359abe-c3c9-4aa8-8ebf-75ff64cb1935@www.fastmail.com>
In-Reply-To: <21359abe-c3c9-4aa8-8ebf-75ff64cb1935@www.fastmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Fri, 9 Sep 2022 13:13:34 +0200
Message-ID: <CAKXUXMyCvnye2f-HWsi8vYEyxe9_SC_BaR_SeLR+2wZJ__maNw@mail.gmail.com>
Subject: Re: [PATCH v2] powerpc: select HAVE_PATA_PLATFORM in PPC instead of
 creating a PPC dependency
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
Cc: Damien Le Moal <damien.lemoal@opensource.wdc.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 9, 2022 at 1:09 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Fri, Sep 9, 2022, at 11:03 AM, Lukas Bulwahn wrote:
> > Commit cc18e0fea790 ("LIBATA: Add HAVE_PATA_PLATFORM to select
> > PATA_PLATFORM driver") introduces config HAVE_PATA_PLATFORM, and expects
> > that all architectures simply select this config when the architecture
> > supports using the PATA_PLATFORM driver.
> >
> > This is properly implemented already for all architectures except for the
> > powerpc architecture. Implement this for powerpc now.
> >
> > Adjust the config of the powerpc architecture to use the config
> > HAVE_PATA_PLATFORM and simplify the config PATA_PLATFORM to not mention
> > any specific architecture anymore.
> >
> > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> > ---
> >  arch/powerpc/Kconfig | 1 +
> >  drivers/ata/Kconfig  | 2 +-
> >  2 files changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> > index 39d71d7701bd..2575e21b6e6b 100644
> > --- a/arch/powerpc/Kconfig
> > +++ b/arch/powerpc/Kconfig
> > @@ -237,6 +237,7 @@ config PPC
> >       select HAVE_MOD_ARCH_SPECIFIC
> >       select HAVE_NMI                         if PERF_EVENTS || (PPC64 && PPC_BOOK3S)
> >       select HAVE_OPTPROBES
> > +     select HAVE_PATA_PLATFORM
> >       select HAVE_PERF_EVENTS
> >       select HAVE_PERF_EVENTS_NMI             if PPC64
> >       select HAVE_PERF_REGS
>
> I don't see a single powerpc machine that creates a
>  name="pata_platform" platform_device. I suspect this was
> only needed bwfore 2007 commit 9cd55be4d223 ("[POWERPC] pasemi:
> Move electra-ide to pata_of_platform"), so the "|| PPC"
> bit should just get removed without adding the HAVE_PATA_PLATFORM
> bit.
>

Thanks for your investigation. I will send a corresponding patch v3.

Lukas
