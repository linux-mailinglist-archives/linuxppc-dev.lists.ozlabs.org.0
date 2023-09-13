Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A1E79F3E0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 23:34:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DmA6cZAt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RmDGz1kZJz3cQ7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 07:34:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DmA6cZAt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RmDG61lCgz3c2b
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Sep 2023 07:33:18 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id ACF93CE253A;
	Wed, 13 Sep 2023 21:33:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3923FC433C7;
	Wed, 13 Sep 2023 21:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694640794;
	bh=GECw0+37SQCQQnWytIJsIFg22BcKEch0lpmHe9Lude0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DmA6cZAtQ4BkUKquEbLhSWfE6bQ5r/Q1V2YQjbnHUfNgvpu8bm1QPgusB41tfGi24
	 HXb7vzh3/UPHZbl8i8Gs+3NO1Oh7I1rhFzm5rZbkdCoHYFGjx44vfaFBHDcvbH44T9
	 BPXcf215d7+e7afUmHeQUstDJY8lltG70ABoJZCMOKsnDWnojsTuf0OoBIcsSbfxq4
	 bmMXIxxXX1EnetyTsQQy7ng28HBj70HJqdlQwaf9xgxk6GxmzQhz0fN4hkqSjLiUyM
	 WFXaxTcUnnjn86+h5mnD4SzQA7Jrmqp5r4DFgggOtNgOdIvd7ARVnFzZZc2YS2zq0L
	 rRjX92U77+jtg==
Date: Wed, 13 Sep 2023 14:33:11 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH v7 1/3 RESEND] block:sed-opal: SED Opal keystore
Message-ID: <20230913213311.GA3279202@dev-arch.thelio-3990X>
References: <20230908153056.3503975-1-gjoyce@linux.vnet.ibm.com>
 <20230908153056.3503975-2-gjoyce@linux.vnet.ibm.com>
 <20230913165612.GA2213586@dev-arch.thelio-3990X>
 <CAKwvOdnbKA-DiWRorWMR93JPFX-OjUjO=SQXSRf4=DpwzvZ=pQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKwvOdnbKA-DiWRorWMR93JPFX-OjUjO=SQXSRf4=DpwzvZ=pQ@mail.gmail.com>
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
Cc: axboe@kernel.dk, llvm@lists.linux.dev, gjoyce@linux.vnet.ibm.com, nayna@linux.ibm.com, linux-block@vger.kernel.org, jarkko@kernel.org, keyrings@vger.kernel.org, jonathan.derrick@linux.dev, brking@linux.vnet.ibm.com, akpm@linux-foundation.org, msuchanek@suse.de, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 13, 2023 at 01:49:39PM -0700, Nick Desaulniers wrote:
> On Wed, Sep 13, 2023 at 9:56 AM Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > Hi Greg,
> >
> > On Fri, Sep 08, 2023 at 10:30:54AM -0500, gjoyce@linux.vnet.ibm.com wrote:
> > > From: Greg Joyce <gjoyce@linux.vnet.ibm.com>
> > >
> > > Add read and write functions that allow SED Opal keys to stored
> > > in a permanent keystore.
> > >
> > > Signed-off-by: Greg Joyce <gjoyce@linux.vnet.ibm.com>
> > > Reviewed-by: Jonathan Derrick <jonathan.derrick@linux.dev>
> > > ---
> > >  block/Makefile               |  2 +-
> > >  block/sed-opal-key.c         | 24 ++++++++++++++++++++++++
> > >  include/linux/sed-opal-key.h | 15 +++++++++++++++
> > >  3 files changed, 40 insertions(+), 1 deletion(-)
> > >  create mode 100644 block/sed-opal-key.c
> > >  create mode 100644 include/linux/sed-opal-key.h
> > >
> > > diff --git a/block/Makefile b/block/Makefile
> > > index 46ada9dc8bbf..ea07d80402a6 100644
> > > --- a/block/Makefile
> > > +++ b/block/Makefile
> > > @@ -34,7 +34,7 @@ obj-$(CONFIG_BLK_DEV_ZONED) += blk-zoned.o
> > >  obj-$(CONFIG_BLK_WBT)                += blk-wbt.o
> > >  obj-$(CONFIG_BLK_DEBUG_FS)   += blk-mq-debugfs.o
> > >  obj-$(CONFIG_BLK_DEBUG_FS_ZONED)+= blk-mq-debugfs-zoned.o
> > > -obj-$(CONFIG_BLK_SED_OPAL)   += sed-opal.o
> > > +obj-$(CONFIG_BLK_SED_OPAL)   += sed-opal.o sed-opal-key.o
> > >  obj-$(CONFIG_BLK_PM)         += blk-pm.o
> > >  obj-$(CONFIG_BLK_INLINE_ENCRYPTION)  += blk-crypto.o blk-crypto-profile.o \
> > >                                          blk-crypto-sysfs.o
> > > diff --git a/block/sed-opal-key.c b/block/sed-opal-key.c
> > > new file mode 100644
> > > index 000000000000..16f380164c44
> > > --- /dev/null
> > > +++ b/block/sed-opal-key.c
> > > @@ -0,0 +1,24 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +/*
> > > + * SED key operations.
> > > + *
> > > + * Copyright (C) 2022 IBM Corporation
> > > + *
> > > + * These are the accessor functions (read/write) for SED Opal
> > > + * keys. Specific keystores can provide overrides.
> > > + *
> > > + */
> > > +
> > > +#include <linux/kernel.h>
> > > +#include <linux/errno.h>
> > > +#include <linux/sed-opal-key.h>
> > > +
> > > +int __weak sed_read_key(char *keyname, char *key, u_int *keylen)
> > > +{
> > > +     return -EOPNOTSUPP;
> > > +}
> > > +
> > > +int __weak sed_write_key(char *keyname, char *key, u_int keylen)
> > > +{
> > > +     return -EOPNOTSUPP;
> > > +}
> >
> > This change causes a build failure for certain clang configurations due
> > to an unfortunate issue [1] with recordmcount, clang's integrated
> > assembler, and object files that contain a section with only weak
> > functions/symbols (in this case, the .text section in sed-opal-key.c),
> > resulting in
> >
> >   Cannot find symbol for section 2: .text.
> >   block/sed-opal-key.o: failed
> >
> > when building this file.
> 
> The definitions in
> block/sed-opal-key.c
> should be deleted. Instead, in
> include/linux/sed-opal-key.h
> CONFIG_PSERIES_PLPKS_SED should be used to define static inline
> versions when CONFIG_PSERIES_PLPKS_SED is not defined.
> 
> #ifdef CONFIG_PSERIES_PLPKS_SED
> int sed_read_key(char *keyname, char *key, u_int *keylen);
> int sed_write_key(char *keyname, char *key, u_int keylen);
> #else
> static inline
> int sed_read_key(char *keyname, char *key, u_int *keylen) {
>   return -EOPNOTSUPP;
> }
> static inline
> int sed_write_key(char *keyname, char *key, u_int keylen);
>   return -EOPNOTSUPP;
> }
> #endif

Ah yes, this is the other solution. I figured the way that it was
written, sed_read_key() and sed_write_key() may be overridden by a
different architecture or translation unit in the future but I think
until it is needed, your solution would be perfectly fine. Thanks for
taking a look!

Cheers,
Nathan

> > Is there any real reason to have a separate translation unit for these
> > two functions versus just having them living in sed-opal.c? Those two
> > object files share the same Kconfig dependency. I am happy to send a
> > patch if that is an acceptable approach.
> >
> > [1]: https://github.com/ClangBuiltLinux/linux/issues/981
> >
> > Cheers,
> > Nathan
> >
> 
> 
> -- 
> Thanks,
> ~Nick Desaulniers
