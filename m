Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7BC7B0D7A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Sep 2023 22:31:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=MAC4HcxD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RwpDp4ctBz3cPS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Sep 2023 06:31:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=MAC4HcxD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com; envelope-from=ndesaulniers@google.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RwpCx3YWCz2yVh
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Sep 2023 06:31:08 +1000 (AEST)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-40528376459so122395065e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Sep 2023 13:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695846662; x=1696451462; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1bPQ4W+m4k6grk2QsqsO+u/OMm6oUavQe8VAaeMpNSM=;
        b=MAC4HcxDvImEG1MFfkt+nrwZ04lmK46oTOYESrvBnxE101y5GvwbnTA0xd7cp1i3fx
         VdwEMgvgcL/CNnV2H1j7WE0gzDw1UtIbX/rfFUhLCXMWflc4BOBDiuSBjJcVUDVT+FB2
         XXyBVzVGo8MHrt26kj3BuLXx/Y/6cAgyvkdclQKHoG0qiAET43e231AHjISojQ7toKEd
         u7rTP6cX0EtEgE2cyCBVneXlWiYBMzCeZunfYm+k/HR/egb7W73VCEb2Z0dkMknEzUSQ
         LHDXT+sZSoSlnEh9s48wKLJupyL1wBU3tDP+ztN5jLkMJkEDdEVqnAxfxYayRdpyUdVk
         dcEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695846662; x=1696451462;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1bPQ4W+m4k6grk2QsqsO+u/OMm6oUavQe8VAaeMpNSM=;
        b=qj/0HOk8lT14dOtn7C7mHmnyDd3qPwtnurfi01/d43QUdW58Vo/7qAb6S4SpRCMIVc
         VYQWKdJVomRQlYU7tdNIn//Tw/jjbm1M/xtVskPTbqEok3BdipMNrg1/CxykjbV5u1tW
         gIW1firHBlMaYkdXdeovZqoi2xSVuUU5AgjB7meIeY7QZ7EY4HH8kkoP8FgtkG/Tu5vi
         dxojyENcYYePRFd+J0CCyBpsLIsrEwk42BVDfUnrLkUM9mSba0Wln68g489uO73CvLf5
         lLBFUdLsvyWNTXdtit5b4q33QYh5mRdMB6EsXAkP5G9LcF9On4Iu9I4yQxIVemoDVk6v
         gB/Q==
X-Gm-Message-State: AOJu0Ywr0lsBvoE7wDQ1/KgWh1kkAhGJX6JKP2iLYDz3fFs6YKSSyp4+
	m9XLciJCpF2bPkAkTZOP+Pfq9Ft9CM3OJKUOn4ZFjA==
X-Google-Smtp-Source: AGHT+IGHhim/72mDyUSht5r5coAg+DnoIeszZ0PMJICln5voUh7kOaTJ+BemafS1Ina7CW/UDOHZ0LdSqDwwnM/oVG8=
X-Received: by 2002:adf:ee4b:0:b0:31a:e972:3601 with SMTP id
 w11-20020adfee4b000000b0031ae9723601mr2637429wro.54.1695846662401; Wed, 27
 Sep 2023 13:31:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230908153056.3503975-1-gjoyce@linux.vnet.ibm.com>
 <20230908153056.3503975-2-gjoyce@linux.vnet.ibm.com> <20230913165612.GA2213586@dev-arch.thelio-3990X>
 <CAKwvOdnbKA-DiWRorWMR93JPFX-OjUjO=SQXSRf4=DpwzvZ=pQ@mail.gmail.com> <d07b66c55e957c78aff8ab9a6170747832cbc8c5.camel@linux.vnet.ibm.com>
In-Reply-To: <d07b66c55e957c78aff8ab9a6170747832cbc8c5.camel@linux.vnet.ibm.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 27 Sep 2023 13:30:47 -0700
Message-ID: <CAKwvOd=K_xNK71DpivVsyKOKWPo1XG78zGsAdZTWvj=tHmh2ZQ@mail.gmail.com>
Subject: Re: [PATCH v7 1/3 RESEND] block:sed-opal: SED Opal keystore
To: gjoyce@linux.vnet.ibm.com
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
Cc: axboe@kernel.dk, linux-block@vger.kernel.org, llvm@lists.linux.dev, nayna@linux.ibm.com, Nathan Chancellor <nathan@kernel.org>, jarkko@kernel.org, keyrings@vger.kernel.org, jonathan.derrick@linux.dev, brking@linux.vnet.ibm.com, akpm@linux-foundation.org, msuchanek@suse.de, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 27, 2023 at 1:26=E2=80=AFPM Greg Joyce <gjoyce@linux.vnet.ibm.c=
om> wrote:
>
> On Wed, 2023-09-13 at 13:49 -0700, Nick Desaulniers wrote:
> > On Wed, Sep 13, 2023 at 9:56=E2=80=AFAM Nathan Chancellor <nathan@kerne=
l.org>
> > wrote:
> > > Hi Greg,
> > >
> > > On Fri, Sep 08, 2023 at 10:30:54AM -0500, gjoyce@linux.vnet.ibm.com
> > >  wrote:
> > > > From: Greg Joyce <gjoyce@linux.vnet.ibm.com>
> > > >
> > > > Add read and write functions that allow SED Opal keys to stored
> > > > in a permanent keystore.
> > > >
> > > > Signed-off-by: Greg Joyce <gjoyce@linux.vnet.ibm.com>
> > > > Reviewed-by: Jonathan Derrick <jonathan.derrick@linux.dev>
> > > > ---
> > > >  block/Makefile               |  2 +-
> > > >  block/sed-opal-key.c         | 24 ++++++++++++++++++++++++
> > > >  include/linux/sed-opal-key.h | 15 +++++++++++++++
> > > >  3 files changed, 40 insertions(+), 1 deletion(-)
> > > >  create mode 100644 block/sed-opal-key.c
> > > >  create mode 100644 include/linux/sed-opal-key.h
> > > >
> > > > diff --git a/block/Makefile b/block/Makefile
> > > > index 46ada9dc8bbf..ea07d80402a6 100644
> > > > --- a/block/Makefile
> > > > +++ b/block/Makefile
> > > > @@ -34,7 +34,7 @@ obj-$(CONFIG_BLK_DEV_ZONED) +=3D blk-zoned.o
> > > >  obj-$(CONFIG_BLK_WBT)                +=3D blk-wbt.o
> > > >  obj-$(CONFIG_BLK_DEBUG_FS)   +=3D blk-mq-debugfs.o
> > > >  obj-$(CONFIG_BLK_DEBUG_FS_ZONED)+=3D blk-mq-debugfs-zoned.o
> > > > -obj-$(CONFIG_BLK_SED_OPAL)   +=3D sed-opal.o
> > > > +obj-$(CONFIG_BLK_SED_OPAL)   +=3D sed-opal.o sed-opal-key.o
> > > >  obj-$(CONFIG_BLK_PM)         +=3D blk-pm.o
> > > >  obj-$(CONFIG_BLK_INLINE_ENCRYPTION)  +=3D blk-crypto.o blk-crypto-
> > > > profile.o \
> > > >                                          blk-crypto-sysfs.o
> > > > diff --git a/block/sed-opal-key.c b/block/sed-opal-key.c
> > > > new file mode 100644
> > > > index 000000000000..16f380164c44
> > > > --- /dev/null
> > > > +++ b/block/sed-opal-key.c
> > > > @@ -0,0 +1,24 @@
> > > > +// SPDX-License-Identifier: GPL-2.0-only
> > > > +/*
> > > > + * SED key operations.
> > > > + *
> > > > + * Copyright (C) 2022 IBM Corporation
> > > > + *
> > > > + * These are the accessor functions (read/write) for SED Opal
> > > > + * keys. Specific keystores can provide overrides.
> > > > + *
> > > > + */
> > > > +
> > > > +#include <linux/kernel.h>
> > > > +#include <linux/errno.h>
> > > > +#include <linux/sed-opal-key.h>
> > > > +
> > > > +int __weak sed_read_key(char *keyname, char *key, u_int *keylen)
> > > > +{
> > > > +     return -EOPNOTSUPP;
> > > > +}
> > > > +
> > > > +int __weak sed_write_key(char *keyname, char *key, u_int keylen)
> > > > +{
> > > > +     return -EOPNOTSUPP;
> > > > +}
> > >
> > > This change causes a build failure for certain clang configurations
> > > due
> > > to an unfortunate issue [1] with recordmcount, clang's integrated
> > > assembler, and object files that contain a section with only weak
> > > functions/symbols (in this case, the .text section in sed-opal-
> > > key.c),
> > > resulting in
> > >
> > >   Cannot find symbol for section 2: .text.
> > >   block/sed-opal-key.o: failed
> > >
> > > when building this file.
> >
> > The definitions in
> > block/sed-opal-key.c
> > should be deleted. Instead, in
> > include/linux/sed-opal-key.h
> > CONFIG_PSERIES_PLPKS_SED should be used to define static inline
> > versions when CONFIG_PSERIES_PLPKS_SED is not defined.
> >
> > #ifdef CONFIG_PSERIES_PLPKS_SED
> > int sed_read_key(char *keyname, char *key, u_int *keylen);
> > int sed_write_key(char *keyname, char *key, u_int keylen);
> > #else
> > static inline
> > int sed_read_key(char *keyname, char *key, u_int *keylen) {
> >   return -EOPNOTSUPP;
> > }
> > static inline
> > int sed_write_key(char *keyname, char *key, u_int keylen);
> >   return -EOPNOTSUPP;
> > }
> > #endif
>
> This change will certainly work for pseries. The intent of the weak
> functions was to allow a different unknown permanent keystore to be the
> source for seeding SED Opal keys. It also kept platform specific code
> out of the block directory.
>
> I'm happy to switch to the approach above, if losing those two goals
> isn't a concern.

Assuming those would have mutually exclusive KConfigs, then the
pattern I describe would be preferred.

>
> >
> > > Is there any real reason to have a separate translation unit for
> > > these
> > > two functions versus just having them living in sed-opal.c? Those
> > > two
> > > object files share the same Kconfig dependency. I am happy to send
> > > a
> > > patch if that is an acceptable approach.
> > >
> > > [1]: https://github.com/ClangBuiltLinux/linux/issues/981
> > >
> > > Cheers,
> > > Nathan
> > >
> >
> >
>


--=20
Thanks,
~Nick Desaulniers
