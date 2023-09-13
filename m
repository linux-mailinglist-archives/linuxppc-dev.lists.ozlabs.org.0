Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C06B79F339
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 22:50:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=vgOarfiI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RmCJy3PQHz3cQ7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 06:50:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=vgOarfiI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::f35; helo=mail-qv1-xf35.google.com; envelope-from=ndesaulniers@google.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RmCJ61DdDz3c3g
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Sep 2023 06:49:57 +1000 (AEST)
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-655d25f3678so1649956d6.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 13:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694638193; x=1695242993; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EFwFw82a57aBtQryliubY+OdXAAQrHVkDDwYmB6bvo8=;
        b=vgOarfiIJVRRrivvTfdd4xPa5PGz91w7z9AZzLGqV779uBFweeXXTYjKFMb8boN1Qn
         bdqNrYtBNT1PBMIzQwm3kvNTgBslfAkjg2aPY2Rmeyf8zrV7sqqMzF97tOeESV3cfUT8
         cRLPoL9Yiu2I1I/NvgI9yHpaQ7u4m8xgRFFNxuqu9YGHAdkD7AGPj+12pb9dT12bJegN
         pbO9XlUdu3rIPq8gHtKwEuds7+OJGz/7AHWckwcj82ZpXonDvO0pTx8TNydUfMakWOkA
         cj6l//lw4Plv2k6X77gemo0G29HhGd8w169mjTQ/EJMi4BucjImqMpWvB9lQTjjiTKzL
         u10A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694638193; x=1695242993;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EFwFw82a57aBtQryliubY+OdXAAQrHVkDDwYmB6bvo8=;
        b=nDIUEa5PhY4R0kSIU0u/Mn1cF0/1pf2pId9/4E/6LZPwDh1DHGYo+/dNKwliPiEkNR
         2iHxDRkjAR92AlyGb/LJ2KMNoYRX9EOM/C7SqxoHP+5/E9Gg2HZ+4N+sjP/EvE3cAobH
         DQOHfjbznlhFiBrVmyAlBitXNUPbLT9BVg5sGHmCzEEfOQrpQ9iwOw9it2tmrnVZ2lKw
         Je1Vr5EKeagG6tLVCqVujyLibr6wr+FK0fWUajGgHvVozfiDomHAbnlg2STq6jwDwIRM
         wgC3c4i7EqhCYeL65Pv3ukc6YfJy8MA8EP1vwxtLrllYHa44tRHmDQGzbWkSG8m+W8XA
         N0gw==
X-Gm-Message-State: AOJu0Yz56xNc+uMmDbSTIKOZSo8ErGunNSvoBafXHoq9rBgB55X5547G
	0jaQIhrTu7GMQ1++KSIem7XyaJRV+8KgU+WqTwk9Aw==
X-Google-Smtp-Source: AGHT+IHyO+7qjdiOWvRrn0TL1tvmNTBKXt4WU5GdAv9X4AWVEJU+Ajo7u738qSi8gvalqluc4GkG9Xfyc7iZk8lZYKw=
X-Received: by 2002:a05:6214:140e:b0:651:75a4:75b0 with SMTP id
 pr14-20020a056214140e00b0065175a475b0mr3474295qvb.1.1694638193146; Wed, 13
 Sep 2023 13:49:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230908153056.3503975-1-gjoyce@linux.vnet.ibm.com>
 <20230908153056.3503975-2-gjoyce@linux.vnet.ibm.com> <20230913165612.GA2213586@dev-arch.thelio-3990X>
In-Reply-To: <20230913165612.GA2213586@dev-arch.thelio-3990X>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 13 Sep 2023 13:49:39 -0700
Message-ID: <CAKwvOdnbKA-DiWRorWMR93JPFX-OjUjO=SQXSRf4=DpwzvZ=pQ@mail.gmail.com>
Subject: Re: [PATCH v7 1/3 RESEND] block:sed-opal: SED Opal keystore
To: Nathan Chancellor <nathan@kernel.org>, gjoyce@linux.vnet.ibm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: axboe@kernel.dk, llvm@lists.linux.dev, nayna@linux.ibm.com, linux-block@vger.kernel.org, jarkko@kernel.org, keyrings@vger.kernel.org, jonathan.derrick@linux.dev, brking@linux.vnet.ibm.com, akpm@linux-foundation.org, msuchanek@suse.de, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 13, 2023 at 9:56=E2=80=AFAM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> Hi Greg,
>
> On Fri, Sep 08, 2023 at 10:30:54AM -0500, gjoyce@linux.vnet.ibm.com wrote=
:
> > From: Greg Joyce <gjoyce@linux.vnet.ibm.com>
> >
> > Add read and write functions that allow SED Opal keys to stored
> > in a permanent keystore.
> >
> > Signed-off-by: Greg Joyce <gjoyce@linux.vnet.ibm.com>
> > Reviewed-by: Jonathan Derrick <jonathan.derrick@linux.dev>
> > ---
> >  block/Makefile               |  2 +-
> >  block/sed-opal-key.c         | 24 ++++++++++++++++++++++++
> >  include/linux/sed-opal-key.h | 15 +++++++++++++++
> >  3 files changed, 40 insertions(+), 1 deletion(-)
> >  create mode 100644 block/sed-opal-key.c
> >  create mode 100644 include/linux/sed-opal-key.h
> >
> > diff --git a/block/Makefile b/block/Makefile
> > index 46ada9dc8bbf..ea07d80402a6 100644
> > --- a/block/Makefile
> > +++ b/block/Makefile
> > @@ -34,7 +34,7 @@ obj-$(CONFIG_BLK_DEV_ZONED) +=3D blk-zoned.o
> >  obj-$(CONFIG_BLK_WBT)                +=3D blk-wbt.o
> >  obj-$(CONFIG_BLK_DEBUG_FS)   +=3D blk-mq-debugfs.o
> >  obj-$(CONFIG_BLK_DEBUG_FS_ZONED)+=3D blk-mq-debugfs-zoned.o
> > -obj-$(CONFIG_BLK_SED_OPAL)   +=3D sed-opal.o
> > +obj-$(CONFIG_BLK_SED_OPAL)   +=3D sed-opal.o sed-opal-key.o
> >  obj-$(CONFIG_BLK_PM)         +=3D blk-pm.o
> >  obj-$(CONFIG_BLK_INLINE_ENCRYPTION)  +=3D blk-crypto.o blk-crypto-prof=
ile.o \
> >                                          blk-crypto-sysfs.o
> > diff --git a/block/sed-opal-key.c b/block/sed-opal-key.c
> > new file mode 100644
> > index 000000000000..16f380164c44
> > --- /dev/null
> > +++ b/block/sed-opal-key.c
> > @@ -0,0 +1,24 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * SED key operations.
> > + *
> > + * Copyright (C) 2022 IBM Corporation
> > + *
> > + * These are the accessor functions (read/write) for SED Opal
> > + * keys. Specific keystores can provide overrides.
> > + *
> > + */
> > +
> > +#include <linux/kernel.h>
> > +#include <linux/errno.h>
> > +#include <linux/sed-opal-key.h>
> > +
> > +int __weak sed_read_key(char *keyname, char *key, u_int *keylen)
> > +{
> > +     return -EOPNOTSUPP;
> > +}
> > +
> > +int __weak sed_write_key(char *keyname, char *key, u_int keylen)
> > +{
> > +     return -EOPNOTSUPP;
> > +}
>
> This change causes a build failure for certain clang configurations due
> to an unfortunate issue [1] with recordmcount, clang's integrated
> assembler, and object files that contain a section with only weak
> functions/symbols (in this case, the .text section in sed-opal-key.c),
> resulting in
>
>   Cannot find symbol for section 2: .text.
>   block/sed-opal-key.o: failed
>
> when building this file.

The definitions in
block/sed-opal-key.c
should be deleted. Instead, in
include/linux/sed-opal-key.h
CONFIG_PSERIES_PLPKS_SED should be used to define static inline
versions when CONFIG_PSERIES_PLPKS_SED is not defined.

#ifdef CONFIG_PSERIES_PLPKS_SED
int sed_read_key(char *keyname, char *key, u_int *keylen);
int sed_write_key(char *keyname, char *key, u_int keylen);
#else
static inline
int sed_read_key(char *keyname, char *key, u_int *keylen) {
  return -EOPNOTSUPP;
}
static inline
int sed_write_key(char *keyname, char *key, u_int keylen);
  return -EOPNOTSUPP;
}
#endif

>
> Is there any real reason to have a separate translation unit for these
> two functions versus just having them living in sed-opal.c? Those two
> object files share the same Kconfig dependency. I am happy to send a
> patch if that is an acceptable approach.
>
> [1]: https://github.com/ClangBuiltLinux/linux/issues/981
>
> Cheers,
> Nathan
>


--=20
Thanks,
~Nick Desaulniers
