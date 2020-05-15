Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB881D4424
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 May 2020 05:47:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49NZ9n3zt0zDqpB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 May 2020 13:47:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c44;
 helo=mail-oo1-xc44.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=j/RBHZ5e; dkim-atps=neutral
Received: from mail-oo1-xc44.google.com (mail-oo1-xc44.google.com
 [IPv6:2607:f8b0:4864:20::c44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49NZ882NRXzDqGF
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 May 2020 13:46:16 +1000 (AEST)
Received: by mail-oo1-xc44.google.com with SMTP id g22so147256oop.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 May 2020 20:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZZ9UGT/HMRQepwABzre8RwANBmBfQO8Q9WMnrE8C8oQ=;
 b=j/RBHZ5e1iO/8yLZiGYNKni1EaVbJyCpdORKR5GEBOhLAmpnVY/e9TGZRZR0KRqrYU
 uJnzrKUleEE2+EXZIM7tEIx9GuLX1V+zskdFJkuGw8XQCn8I6mZwLtNDxN1XR0Fb9kq1
 5qM4IQ8Q++V8sTEy5A/+vJchvHhJSmIWSG99/byvBaecVSRNGbLWPuLiX3XUsIteSgab
 hflYaGluCqUgsCG3lOEH2dXXZNpxwQsJztKABvhyJdrX3HWFBJ+SXtmdRDg4Yu9C+mPg
 jQF4b+VQODWA6G7Lml880j/ASZB71SwOvx0eiTC3EQ52Ov5gRHXeb2JyOkphWXqg3etL
 nkLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZZ9UGT/HMRQepwABzre8RwANBmBfQO8Q9WMnrE8C8oQ=;
 b=CPe0aU1g/yNIWa8aRPNX6scG5HB3gPZ2bU4eS8i0LD3ML3AUUuCtr2pWsgWmSQbslT
 ccONXj3pUdXyPa8H7rwViww1Y/Hdndttn4nxYCvRW0cQgEsFgkjbWjn3+/LncYdM0jw8
 x7DdnVtx3dbEQLF+eWrLXaRsPatgonNRGUBqsCGehK9Z5hl/PNWVwG8hkxu1SLpFoFer
 51ur/Mm1hOfe4Y/BZ89lQoetG6ght4ZVWESDG2tfpWNAnZppxrgqjfFLvFJRBV9zowzC
 dYm/CufpDmj/bTbXbX/dS4Gx5MlsrHK3cRHog9FNqxYkh49HXQSUIsjeM1Modey/XHoK
 tGUQ==
X-Gm-Message-State: AOAM532N0DC+aWfzVBKcA/CBWtvQisXVhXti6RH9LMMJVSufz4fzqeiy
 4d+rh4bapq57bJPrqj8T+Hna4kjUTpbYIIccxx1dkBc4NyY=
X-Google-Smtp-Source: ABdhPJzgiwmxHNLBsYWUsc/JRmPgV/0s83WcnNXLjdfVRwGOYPoLDEvlgxBwj8BpInoC0xdlmtpvnxUHuvtFcB+t4kE=
X-Received: by 2002:a4a:a286:: with SMTP id h6mr968725ool.38.1589514373491;
 Thu, 14 May 2020 20:46:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200506034050.24806-1-jniethe5@gmail.com>
 <20200506034050.24806-14-jniethe5@gmail.com>
 <e4bd592e-2e35-9c73-854e-1380222f34ef@csgroup.eu>
In-Reply-To: <e4bd592e-2e35-9c73-854e-1380222f34ef@csgroup.eu>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Fri, 15 May 2020 13:46:02 +1000
Message-ID: <CACzsE9ojewbMn31zqm_XK3zfNtE7Ai2XTiFTgUNY+jWhfhpF_w@mail.gmail.com>
Subject: Re: [PATCH v8 13/30] powerpc: Add a probe_user_read_inst() function
To: Christophe Leroy <christophe.leroy@csgroup.eu>
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 Alistair Popple <alistair@popple.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Balamuruhan S <bala24@linux.ibm.com>, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 14, 2020 at 3:46 PM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 06/05/2020 =C3=A0 05:40, Jordan Niethe a =C3=A9crit :
> > Introduce a probe_user_read_inst() function to use in cases where
> > probe_user_read() is used for getting an instruction. This will be more
> > useful for prefixed instructions.
> >
> > Reviewed-by: Alistair Popple <alistair@popple.id.au>
> > Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> > ---
> > v6: - New to series
> > ---
> >   arch/powerpc/include/asm/inst.h |  3 +++
> >   arch/powerpc/lib/Makefile       |  2 +-
> >   arch/powerpc/lib/inst.c         | 18 ++++++++++++++++++
> >   arch/powerpc/mm/fault.c         |  2 +-
> >   4 files changed, 23 insertions(+), 2 deletions(-)
> >   create mode 100644 arch/powerpc/lib/inst.c
> >
> > diff --git a/arch/powerpc/include/asm/inst.h b/arch/powerpc/include/asm=
/inst.h
> > index 552e953bf04f..3e9a58420151 100644
> > --- a/arch/powerpc/include/asm/inst.h
> > +++ b/arch/powerpc/include/asm/inst.h
> > @@ -37,4 +37,7 @@ static inline bool ppc_inst_equal(struct ppc_inst x, =
struct ppc_inst y)
> >       return ppc_inst_val(x) =3D=3D ppc_inst_val(y);
> >   }
> >
> > +int probe_user_read_inst(struct ppc_inst *inst,
> > +                      struct ppc_inst *nip);
> > +
> >   #endif /* _ASM_INST_H */
> > diff --git a/arch/powerpc/lib/Makefile b/arch/powerpc/lib/Makefile
> > index b8de3be10eb4..546591848219 100644
> > --- a/arch/powerpc/lib/Makefile
> > +++ b/arch/powerpc/lib/Makefile
> > @@ -16,7 +16,7 @@ CFLAGS_code-patching.o +=3D -DDISABLE_BRANCH_PROFILIN=
G
> >   CFLAGS_feature-fixups.o +=3D -DDISABLE_BRANCH_PROFILING
> >   endif
> >
> > -obj-y +=3D alloc.o code-patching.o feature-fixups.o pmem.o
> > +obj-y +=3D alloc.o code-patching.o feature-fixups.o pmem.o inst.o
> >
> >   ifndef CONFIG_KASAN
> >   obj-y       +=3D      string.o memcmp_$(BITS).o
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
> > +     err =3D probe_user_read(&val, nip, sizeof(val));
> > +     *inst =3D ppc_inst(val);
> > +     return err;
> > +}
> > diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
> > index 4a50f125ec18..f3a943eae305 100644
> > --- a/arch/powerpc/mm/fault.c
> > +++ b/arch/powerpc/mm/fault.c
> > @@ -281,7 +281,7 @@ static bool bad_stack_expansion(struct pt_regs *reg=
s, unsigned long address,
> >                   access_ok(nip, sizeof(*nip))) {
> >                       struct ppc_inst inst;
> >
> > -                     if (!probe_user_read(&inst, nip, sizeof(inst)))
> > +                     if (!probe_user_read_inst(&inst, (struct ppc_inst=
 __user *)nip))
>
> Shouldn't 'nip' become de 'struct ppc_inst __user *' instead of casting ?
>
> >                               return !store_updates_sp(inst);
> >                       *must_retry =3D true;
> >               }
> >
Yeah it would make more sense to do it like this.
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -256,7 +256,7 @@ static bool bad_stack_expansion(struct pt_regs
*regs, unsigned long address,
      * expand to 1MB without further checks.
      */
     if (address + 0x100000 < vma->vm_end) {
-        unsigned int __user *nip =3D (unsigned int __user *)regs->nip;
+        struct ppc_inst __user *nip =3D (struct ppc_inst __user *)regs->ni=
p;
         /* get user regs even if this fault is in kernel mode */
         struct pt_regs *uregs =3D current->thread.regs;
         if (uregs =3D=3D NULL)
@@ -281,7 +281,7 @@ static bool bad_stack_expansion(struct pt_regs
*regs, unsigned long address,
             access_ok(nip, sizeof(*nip))) {
             struct ppc_inst inst;

-            if (!probe_user_read_inst(&inst, (struct ppc_inst __user *)nip=
))
+            if (!probe_user_read_inst(&inst, nip))
                 return !store_updates_sp(inst);
             *must_retry =3D true;
         }
--=20
2.17.1
>
> Christophe
