Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2D6184FD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2019 07:55:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4502cF05JPzDqHP
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2019 15:54:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::143; helo=mail-it1-x143.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="YP5U7h01"; 
 dkim-atps=neutral
Received: from mail-it1-x143.google.com (mail-it1-x143.google.com
 [IPv6:2607:f8b0:4864:20::143])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4502Zz6SSYzDqGt
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 May 2019 15:53:47 +1000 (AEST)
Received: by mail-it1-x143.google.com with SMTP id s3so1640703itk.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 May 2019 22:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T0bx8ZTzSPMBCwQmXwRSdAdFYUKxTvZOCyk0iiCcikU=;
 b=YP5U7h0194P11MPv1AyJZSYNtBG2I6cC7qMgvRY9qxCou0oB1Rs2Sobxpw1RZXAJAX
 c8qmEYOoqnNNUtnV5xOsYxgsK3uZlTfKQby81vt9yffFmk5FOxj6CyK51iOBEpxqu4j1
 Uizp/c/51dTNgZj9twnYpJAFu6VmSuHHF14ZMeqGHaiz6bzFgC/ohwFAVfQjNqg7VvAN
 mlKKEXUV9ZjIiWfakDCGulon9tkxcQ7x3mO50V3Dx4Pe71fBrZ4OI8Z0vKA20vr9vSAP
 3vLUtrSDWo6IPqf6Scxn5G8hye+xLSEibgwuf2e1oWW5SDsTwWuAvE/pzTUMTCtGfdOr
 BNXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T0bx8ZTzSPMBCwQmXwRSdAdFYUKxTvZOCyk0iiCcikU=;
 b=UCviF8iVgCk7I8og9QxSUVqgVj2o0mAH3thvE3EvMZHwEzBI6hLOFnuYRfHClp5F08
 y9BhNDoibZep+TPWywrrc9BdHO1NI/ExuJyvViStAGge/HO2k5fVqiaFqbIB2jAaeXhn
 OS5rfYzHZhnZ/ZxxcxNEgAl68SOB046ltDKZ1NqVrFeghb8oKVwZOZQQPcSpiekMBbJN
 JxYpzj6x3VVHiptILqIN7SqFUUEhbfa8/SleAbDC+nfzmEraxMn/TgMMKoO+rJ3jhzuv
 a6ziO/52RCY0wmEc5F0UWBPJ/LX4CiQFs3BK66z7GzyLn1OnM+otN4KvqCIjGFPCa8vZ
 FakQ==
X-Gm-Message-State: APjAAAVYoYm4CfoDKjkjSPsTAfKotwg8X/WTYdCc5/C9bpMxZSea2C35
 d0R8b5+EiZgMvUFMZou1aEyf3T4yNZRyQdDdKxM=
X-Google-Smtp-Source: APXvYqyB4IUnkVhvoLZ4PspEDDfIGaeRzI88xtykh3vVayY1vGW+hKt/368bW8P3K1YcOmCL5xljUzebmmnAvpGe4SI=
X-Received: by 2002:a24:d45:: with SMTP id 66mr1567589itx.9.1557381224021;
 Wed, 08 May 2019 22:53:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190509051119.7694-1-ajd@linux.ibm.com>
 <20190509051119.7694-5-ajd@linux.ibm.com>
 <1557380130.bkras9z1l5.astroid@bobo.none>
In-Reply-To: <1557380130.bkras9z1l5.astroid@bobo.none>
From: Oliver <oohall@gmail.com>
Date: Thu, 9 May 2019 15:53:32 +1000
Message-ID: <CAOSf1CFjf-ZBswf4uCbD9C0tVnUdapSm67=pPo34uxi_VQhZuA@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] powerpc/configs: Disable SCOM_DEBUGFS in
 powernv_defconfig
To: Nicholas Piggin <npiggin@gmail.com>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Andrew Donnellan <ajd@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 9, 2019 at 3:38 PM Nicholas Piggin <npiggin@gmail.com> wrote:
>
> Andrew Donnellan's on May 9, 2019 3:11 pm:
> > SCOM_DEBUGFS is really not needed for anything other than low-level
> > hardware debugging.
> >
> > opal-prd uses its own interface (/dev/prd) for SCOM access, so it doesn't
> > need SCOM_DEBUGFS.
> >
> > At some point in the future we'll introduce a debug config fragment where
> > this can go instead.
>
> That doesn't really explain why you want to disable it. It is useful
> for low level hardware debugging, I added it.
>
> obscurity^Wsecurity?

Yeah... If you're building powernv_defconfig then the odds are pretty
high that you'll want scom access.

>
> >
> > Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
> > ---
> > v1->v2:
> > - new patch
> > ---
> >  arch/powerpc/configs/powernv_defconfig | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/powerpc/configs/powernv_defconfig b/arch/powerpc/configs/powernv_defconfig
> > index ef2ef98d3f28..d5a6608cb2e0 100644
> > --- a/arch/powerpc/configs/powernv_defconfig
> > +++ b/arch/powerpc/configs/powernv_defconfig
> > @@ -38,7 +38,7 @@ CONFIG_MODULE_UNLOAD=y
> >  CONFIG_MODVERSIONS=y
> >  CONFIG_MODULE_SRCVERSION_ALL=y
> >  CONFIG_PARTITION_ADVANCED=y
> > -CONFIG_SCOM_DEBUGFS=y
> > +# CONFIG_SCOM_DEBUGFS is not set
> >  CONFIG_OPAL_PRD=y
> >  CONFIG_PPC_MEMTRACE=y
> >  # CONFIG_PPC_PSERIES is not set
> > --
> > 2.20.1
> >
> >
