Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 335131D2340
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 May 2020 01:53:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Ms1N6W3xzDqmT
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 May 2020 09:52:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::242;
 helo=mail-oi1-x242.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=jdHSsk4T; dkim-atps=neutral
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Mrzh1LG7zDqgr
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 May 2020 09:51:27 +1000 (AEST)
Received: by mail-oi1-x242.google.com with SMTP id i22so6465006oik.10
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 May 2020 16:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MN1OAlt5UCcDjSrt5USGQKRP0jLKRadj1a0znpO0PR0=;
 b=jdHSsk4T62oemFbnRFK0c1IDfAaJvbGFcMfnlBaWPX5HaYJnv1wc1nRU4gUotSStOs
 Su/ctGDgYNp4RBYKY75bCmyLEh+igHksJXq99V6alAL+PizSWuJleEaz1SqfD6eSND9B
 0N29JimBXKnJrqKc6bQLutAq5f2JQuukWzG5brFrVclOVu8RLDRIhxymSSAmSFBbulRC
 i6Y5AhF6ZPK1SiE/BIPj55ITyDbvUMOSw8VxTJcBJK98T3sWHPjkPRrx09GGInPM+TRu
 96au52ZOcHYUJF0ziLy1RKyZK326q1LqcSwkM6KmYBx2o80fB84ufGFoYxQMQI2JfRmd
 IXvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MN1OAlt5UCcDjSrt5USGQKRP0jLKRadj1a0znpO0PR0=;
 b=VjQTCSZpncglLy8bwUupARRpMY40GAREC8hcXPobFOo8TcSdctHSygdPe0DBBuTnAS
 /waTzY8k+Q1+o+sP4BJg+XkiCFN2iOpT0Uf805f8pD/4t9YHVOXzQcy9dvaoJ5m4jnBP
 h9CtVr2jOrI2jOJSDZ34zFVFx9xLy2Qd95LQGUpooBAjKk4Czv8Exg1WNyfwcOoH6Ojs
 Ex3hmAColBsr/GLhBdoHH9Umuxhcc0cK67WuRnEOfW+9HnbkG8TmqqXBqrH9vaU4BcPN
 o5dITqEHPpJjGPptS5q6nQib+lIb+Yj//JGo/zrdvpv4dSpT2zr6d/m6fs6olInFMl2z
 W/MQ==
X-Gm-Message-State: AOAM532G1uWf4nnT4aclBMzP4BZNAw2QRJ4jayNccd20x9BY8KTj9sS4
 rPq2g6h+WCuFOm14pfoQzA7oikpZgeZmSJLqNPU=
X-Google-Smtp-Source: ABdhPJzfS4g1ZB6RN4CSLXfPjDt02ccZJrIDvnZBbxYyl73RgCK+HSF228/xUrermAc0NuDQ93OuJubfoJkPL8DtVm4=
X-Received: by 2002:aca:40c2:: with SMTP id n185mr345933oia.12.1589413884643; 
 Wed, 13 May 2020 16:51:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200506034050.24806-1-jniethe5@gmail.com>
 <20200506034050.24806-14-jniethe5@gmail.com>
 <87blmsatet.fsf@mpe.ellerman.id.au>
In-Reply-To: <87blmsatet.fsf@mpe.ellerman.id.au>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Thu, 14 May 2020 09:51:13 +1000
Message-ID: <CACzsE9qbKNTzozfbFymaBhPP4mokwzuDYFJg3etWB3Y9=RfDPw@mail.gmail.com>
Subject: Re: [PATCH v8 13/30] powerpc: Add a probe_user_read_inst() function
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 Alistair Popple <alistair@popple.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Balamuruhan S <bala24@linux.ibm.com>, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 13, 2020 at 10:52 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Jordan Niethe <jniethe5@gmail.com> writes:
> > diff --git a/arch/powerpc/lib/inst.c b/arch/powerpc/lib/inst.c
> > new file mode 100644
> > index 000000000000..eaf786afad2b
> > --- /dev/null
> > +++ b/arch/powerpc/lib/inst.c
> > @@ -0,0 +1,18 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + *  Copyright 2020, IBM Corporation.
> > + */
> > +
> > +#include <linux/uaccess.h>
> > +#include <asm/inst.h>
> > +
> > +int probe_user_read_inst(struct ppc_inst *inst,
> > +                      struct ppc_inst *nip)
> > +{
> > +     unsigned int val;
> > +     int err;
> > +
> > +     err = probe_user_read(&val, nip, sizeof(val));
> > +     *inst = ppc_inst(val);
>
> We shouldn't be storing to *inst if the read failed?
Good point.
>
> I changed it to:
>
> +       if (!err)
> +               *inst = ppc_inst(val);
> +
>
> Similarly for probe_kernel_read_inst().
Thanks.
>
> cheers
