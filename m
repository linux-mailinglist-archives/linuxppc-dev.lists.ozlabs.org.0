Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E2B7902A3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Sep 2023 21:51:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=SsBBGJkl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RcpZ21hM8z3c62
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Sep 2023 05:51:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=SsBBGJkl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=keescook@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RcpY65dwPz3by8
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Sep 2023 05:50:32 +1000 (AEST)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1bdbf10333bso19561045ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 01 Sep 2023 12:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1693597831; x=1694202631; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TnGlOgpcJfhSyX3oWtweduRxRFI+vcvjVBEfz8W6REE=;
        b=SsBBGJklF95171iS/33j9ZayfIiguxz3k+SoucFHOYz5JQimXh2+jWRAwybixaP5e+
         ARt2fAnOWAt4iiftlHH6lF6BGDXglImZVxRV8V6fo39VuT7qCQf7ZnVMNXYdo4FGrtGx
         IlL0juBCqpOp7jEtWT10UfHUHP8oQZM3YHVxw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693597831; x=1694202631;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TnGlOgpcJfhSyX3oWtweduRxRFI+vcvjVBEfz8W6REE=;
        b=ccwC4bqX5DY16qEeBg5mMfrBGkJBb63IhUg3bpTN7AobeAFYzmc7rfbM17t6WP7EPY
         qJNxaNYxW1B7f/Ie2tdy0iJdSBJAC5GNkLG6IWoSFGOOPwgJam3vqIo9J4ekvWvAzlMa
         a3uwVVrQ/Vjyv1665Qr0pX1/hM08QDEFO49mrxy399U4jjAfOeRtejdD6hf1g+vUwfKg
         zYzBVeMTow13StUFmKyd4yZiy1v4IvJfYWNRDgLwk0sCr+7Z3Ocfs4mwEyhu3Yrf3Gb5
         qL3xk0q3y0IjIe6BGwpdw7/+zpZ+sXURWuBZlvU9LqBvaxaEU4jW2y5HIXVcURQU9c2G
         ix0A==
X-Gm-Message-State: AOJu0YxptaMHK8PmoECADVumCwXRINGtmjfRThsuZnitKJDxm12DjDbo
	l8Wvy7yhLF4JQEGWEo72tGOAUA==
X-Google-Smtp-Source: AGHT+IFLMLtB06xgjItzzUv50zhsXFZ37ehwBfgJSIF2V6heU41cis1M/xhTkDTyzQL7J2okpu7MHw==
X-Received: by 2002:a17:902:f682:b0:1c0:b7f4:5b86 with SMTP id l2-20020a170902f68200b001c0b7f45b86mr3871500plg.65.1693597830846;
        Fri, 01 Sep 2023 12:50:30 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id d10-20020a170902654a00b001b8b2b95068sm3397478pln.204.2023.09.01.12.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Sep 2023 12:50:30 -0700 (PDT)
Date: Fri, 1 Sep 2023 12:50:29 -0700
From: Kees Cook <keescook@chromium.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH v3] kbuild: Show marked Kconfig fragments in "help"
Message-ID: <202309011250.AB0DAA03@keescook>
References: <20230831191335.give.534-kees@kernel.org>
 <CAK7LNATENQQy6LrWS10S-EXsyAvTraSj2WA=O7rFsS9Ht6a+3g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNATENQQy6LrWS10S-EXsyAvTraSj2WA=O7rFsS9Ht6a+3g@mail.gmail.com>
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
Cc: linux-s390@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 01, 2023 at 04:58:37PM +0900, Masahiro Yamada wrote:
> On Fri, Sep 1, 2023 at 4:13 AM Kees Cook <keescook@chromium.org> wrote:
> >
> > Currently the Kconfig fragments in kernel/configs and arch/*/configs
> > that aren't used internally aren't discoverable through "make help",
> > which consists of hard-coded lists of config fragments. Instead, list
> > all the fragment targets that have a "# Help: " comment prefix so the
> > targets can be generated dynamically.
> >
> > Add logic to the Makefile to search for and display the fragment and
> > comment. Add comments to fragments that are intended to be direct targets.
> >
> > Cc: Nicolas Schier <nicolas@fjasle.eu>
> > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> > Cc: Randy Dunlap <rdunlap@infradead.org>
> > Cc: linux-kernel@vger.kernel.org
> > Cc: x86@kernel.org
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linuxppc-dev@lists.ozlabs.org
> > Cc: linux-riscv@lists.infradead.org
> > Cc: linux-s390@vger.kernel.org
> > Cc: linux-kbuild@vger.kernel.org
> > Cc: linux-hardening@vger.kernel.org
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> > Co-developed-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> > v3:
> > - Use Makefile logic from Masahiro Yamada
> > - Use "# Help: " prefix, but only on desired fragment targets
> > v2: https://lore.kernel.org/all/20230825194329.gonna.911-kees@kernel.org
> > v1: https://lore.kernel.org/all/20230824223606.never.762-kees@kernel.org
> > ---
> >  Makefile                                   |  1 -
> >  arch/arm/configs/dram_0x00000000.config    |  1 +
> >  arch/arm/configs/dram_0xc0000000.config    |  1 +
> >  arch/arm/configs/dram_0xd0000000.config    |  1 +
> >  arch/arm/configs/lpae.config               |  1 +
> >  arch/arm64/configs/virt.config             |  1 +
> >  arch/powerpc/configs/disable-werror.config |  1 +
> >  arch/powerpc/configs/security.config       |  4 +++-
> >  arch/riscv/configs/32-bit.config           |  1 +
> >  arch/riscv/configs/64-bit.config           |  1 +
> >  arch/s390/configs/btf.config               |  1 +
> >  arch/s390/configs/kasan.config             |  1 +
> >  arch/x86/Makefile                          |  4 ----
> >  kernel/configs/debug.config                |  2 ++
> >  kernel/configs/kvm_guest.config            |  1 +
> >  kernel/configs/nopm.config                 |  2 ++
> >  kernel/configs/rust.config                 |  1 +
> >  kernel/configs/tiny.config                 |  2 ++
> >  kernel/configs/x86_debug.config            |  1 +
> >  kernel/configs/xen.config                  |  2 ++
> >  scripts/kconfig/Makefile                   | 15 ++++++++++++---
> >  21 files changed, 36 insertions(+), 9 deletions(-)
> >
> 
> 
> Just one thing.
> 
> 
> 
> 
> 
> > diff --git a/kernel/configs/tiny.config b/kernel/configs/tiny.config
> > index 00009f7d0835..60a4b6d80b36 100644
> > --- a/kernel/configs/tiny.config
> > +++ b/kernel/configs/tiny.config
> > @@ -1,3 +1,5 @@
> > +# Help: Size-optimized kernel image
> 
> 
> I will drop this.
> 
> 
> We already have a hard-coded help message.
> 
>   tinyconfig   - Configure the tiniest possible kernel
> 
> 
> 
> 
> Then, some lines below, again.
> 
>   tiny.config               - Size-optimized kernel image
> 
> 
> 
> tiny.config is for internal use for tinyconfig.

Shall I send a v4, or did you fix this up already?

-- 
Kees Cook
