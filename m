Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E710357557
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Apr 2021 21:59:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FFwG729sdz3c2P
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Apr 2021 05:59:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YR5Q8XvU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh+dt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=YR5Q8XvU; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FFwFk6fDsz3bxF
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Apr 2021 05:59:06 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4FFFC6120E
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Apr 2021 19:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617825544;
 bh=k6+WEJUU1OZWMiE9a2UexjzaTvG2oDVuhVsZiW3o6Io=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=YR5Q8XvUn6JVjPjj1BNXaM7FVf4Br7ASmk3pta0uakqmw/dDkxpszknJ8UmJ+wudk
 jtnQron+y3IvEv16sN69Mw5kfPI4AXsQxbLEhpVIJ6VbHzqWg73POVIX0llWl/7km5
 C5FlmXQ8rbN0i9Vxa05RsKNzt1lJWE8dA81jJSsw16lZHdla3+ss/EqA9w0Ov7mUiT
 SZ0MwgFHNkbJDQu8pDeuh77/V9ufcutwVYnuuQr0bHtLNkPC2i6qmFBiokoLyQfl0K
 k42/vc95fEetqcc8H3yFXpNT13wDn+r1F/QiBRtpvqLPYIPxc013iptHec/3Sea2F4
 6YswdagWPNA+Q==
Received: by mail-ed1-f52.google.com with SMTP id 18so4820399edx.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Apr 2021 12:59:04 -0700 (PDT)
X-Gm-Message-State: AOAM530zuqDYCoZNey3CDDRy+kIUa5UWnL+T5JE5CJmwFCB1Qe9Amp3A
 tmn0aA5P5JPtI6ogeFgstzkCIWiH+1G7u38Hug==
X-Google-Smtp-Source: ABdhPJwY9GthufRHILDLTfwGTZSKr9CrrPh9cGzDOgcphaTRdGgVabGLGr25oYBpzfJepxjo3FsXe2sqmNbljCw070k=
X-Received: by 2002:a05:6402:1b1c:: with SMTP id
 by28mr6528263edb.62.1617825542888; 
 Wed, 07 Apr 2021 12:59:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210403020423.85278-1-syl.loop@gmail.com>
 <87y2due3mt.fsf@mpe.ellerman.id.au>
In-Reply-To: <87y2due3mt.fsf@mpe.ellerman.id.au>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 7 Apr 2021 14:58:50 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+CKi6+FKO=-VHC538mFMsvpa785sp2Qv86iCTv=1PC1w@mail.gmail.com>
Message-ID: <CAL_Jsq+CKi6+FKO=-VHC538mFMsvpa785sp2Qv86iCTv=1PC1w@mail.gmail.com>
Subject: Re: [PATCH] powerpc/dts: fix not include DTC_FLAGS
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
Cc: devicetree@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, Youlin Song <syl.loop@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 7, 2021 at 6:27 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Youlin Song <syl.loop@gmail.com> writes:
> > I wanted to build the fsl dts in my machine and found that
> > the dtb have not extra space,so uboot will cause about
> > FDT_ERR_NOSPACE issue.

How do we not have issues with arm and arm64 boards which don't have
padding? Or what took so long to notice on powerpc?

> >
> > Signed-off-by: Youlin Song <syl.loop@gmail.com>
> > ---
> >  arch/powerpc/boot/dts/Makefile | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/powerpc/boot/dts/Makefile b/arch/powerpc/boot/dts/Makefile
> > index fb335d05aae8..c21165c0cd76 100644
> > --- a/arch/powerpc/boot/dts/Makefile
> > +++ b/arch/powerpc/boot/dts/Makefile
> > @@ -2,5 +2,6 @@
> >
> >  subdir-y += fsl
> >
> > +DTC_FLAGS   ?= -p 1024
> >  dtstree              := $(srctree)/$(src)
> >  dtb-$(CONFIG_OF_ALL_DTBS) := $(patsubst $(dtstree)/%.dts,%.dtb, $(wildcard $(dtstree)/*.dts))
>
> I guess that was missed in 1acf1cf8638a ("powerpc: build .dtb files in dts directory").
>
> Which I think means the assignment to DTC_FLAGS in
> arch/powerpc/boot/Makefile is not needed anymore.
>
> Can you send a v2 removing that assignment and explaining that's what
> happened?

I've wanted to make this common, but I guess that's a separate change.

Rob
