Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A47D3EE48F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Aug 2021 04:44:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gpb3S2f7xz3bn0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Aug 2021 12:44:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=PC3P5sG4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82c;
 helo=mail-qt1-x82c.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=PC3P5sG4; dkim-atps=neutral
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gpb2n1ZRqz2yRK
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Aug 2021 12:44:16 +1000 (AEST)
Received: by mail-qt1-x82c.google.com with SMTP id d5so6594656qtd.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Aug 2021 19:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=aYJvdBUMzQS09NSeVI7XjGx1zu5i8S5SHftEiJ7Jk6Q=;
 b=PC3P5sG4Wvs+GktrstQ6m1kH0spgizo9LaFboou/xWPFKO601wJryY8QtuICmA56Jo
 MAApte1Myoaef+2UD8SfYNAUSa8LMK2I+otrPaKrK+hQVMBdWxjhrh43aNhD7RQRIEqC
 u5WR9gzIFOW1Py8Q5kwMYHzQ/HcLtFvx1ruTk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=aYJvdBUMzQS09NSeVI7XjGx1zu5i8S5SHftEiJ7Jk6Q=;
 b=o0022Ytm6fyFWWo5SR6/EFNj9hrhuDTRpblEzjkYSdHQ2N6UF+ntbF2qoA8dQOqS25
 omgR7VTjTDCRtF+YBd4VD+HRTeZ9Dq/F2T+5QfUE2lcyBUNqKmiTeoKERIDKIj8JHnVA
 C7tVKVDcysxZFZRx2XbvUkEBzfLqqxXx8j3fdNvB5NjR2QKu9ZHzn6tIXx4FRovT29Vi
 XGBiuydorBzfdz+7Hyomf/2ExJyaPQcNaif5wQ0JDNAYQXattaKKNnpCjwTsI6s/ne4e
 SCUuA97lQcGBEY+IZtXApls2J29ESCqsum3Lug2cpDAMwNNv54g6MIYTzD3SqA9SBYZh
 ud/A==
X-Gm-Message-State: AOAM531GU3g0E//Kld7pmcMkQMMaox+WC8SaRaVgyCToL5ofbffZGbE9
 SFyNXkKQhRWgW5jRjvrvY+t+v7IOuGMWNhNkBck=
X-Google-Smtp-Source: ABdhPJzsTJUBfecX2ZLINehoaTEeg2MbL8mccxzwpHdCVU7BjgbPFcCXixjYfK3/9LplepXV5d1I8HXSFRk6iMF4lu0=
X-Received: by 2002:ac8:5809:: with SMTP id g9mr1052298qtg.135.1629168252358; 
 Mon, 16 Aug 2021 19:44:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210816082403.2293846-1-joel@jms.id.au>
 <20210816082403.2293846-3-joel@jms.id.au>
 <492edb10-ccef-c6f2-2fd3-71cf8ae54cfc@csgroup.eu>
In-Reply-To: <492edb10-ccef-c6f2-2fd3-71cf8ae54cfc@csgroup.eu>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 17 Aug 2021 02:44:00 +0000
Message-ID: <CACPK8XcVEUMS0G+NBJY4B0xE6sFFtYH5-RJtQ8J+KiuyOQx=1A@mail.gmail.com>
Subject: Re: [PATCH 2/3] powerpc: Fix undefined static key
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
Cc: Michael Neuling <mikey@neuling.org>, Nicholas Piggin <npiggin@gmail.com>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 16 Aug 2021 at 08:39, Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 16/08/2021 =C3=A0 10:24, Joel Stanley a =C3=A9crit :
> > When CONFIG_PPC_BARRIER_NOSPEC=3Dn, security.c is not built leading to =
a
> > missing definition of uaccess_flush_key.
> >
> >    LD      vmlinux.o
> >    MODPOST vmlinux.symvers
> >    MODINFO modules.builtin.modinfo
> >    GEN     modules.builtin
> >    LD      .tmp_vmlinux.kallsyms1
> > powerpc64le-linux-gnu-ld: arch/powerpc/kernel/align.o:(.toc+0x0): undef=
ined reference to `uaccess_flush_key'
> > powerpc64le-linux-gnu-ld: arch/powerpc/kernel/signal_64.o:(.toc+0x0): u=
ndefined reference to `uaccess_flush_key'
> > powerpc64le-linux-gnu-ld: arch/powerpc/kernel/process.o:(.toc+0x0): und=
efined reference to `uaccess_flush_key'
> > powerpc64le-linux-gnu-ld: arch/powerpc/kernel/traps.o:(.toc+0x0): undef=
ined reference to `uaccess_flush_key'
> > powerpc64le-linux-gnu-ld: arch/powerpc/kernel/hw_breakpoint_constraints=
.o:(.toc+0x0): undefined reference to `uaccess_flush_key'
> > powerpc64le-linux-gnu-ld: arch/powerpc/kernel/ptrace/ptrace.o:(.toc+0x0=
): more undefined references to `uaccess_flush_key' follow
> > make[1]: *** [Makefile:1176: vmlinux] Error 1
> >
> > Hack one in to fix the build.
> >
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
> > ---
> >   arch/powerpc/include/asm/security_features.h | 3 +++
> >   1 file changed, 3 insertions(+)
> >
> > diff --git a/arch/powerpc/include/asm/security_features.h b/arch/powerp=
c/include/asm/security_features.h
> > index 792eefaf230b..46ade7927a4c 100644
> > --- a/arch/powerpc/include/asm/security_features.h
> > +++ b/arch/powerpc/include/asm/security_features.h
> > @@ -39,6 +39,9 @@ static inline bool security_ftr_enabled(u64 feature)
> >       return !!(powerpc_security_features & feature);
> >   }
> >
> > +#ifndef CONFIG_PPC_BARRIER_NOSPEC
> > +DEFINE_STATIC_KEY_FALSE(uaccess_flush_key);
> > +#endif
>
> It will then be re-defined by each file that includes asm/security_featur=
es.h ....
>
> You can't use a DEFINE_ in a .h
>
> You have to fix the problem at its source.
>
> Cleanest way I see it to modify asm/book3s/64/kup.h and something like
>
> if (IS_ENABLED(CONFIG_PPC_BARRIER_NOSPEC) && static_branch_unlikely(&uacc=
ess_flush_key)

This won't work either as there's no declaration for uaccess_flush_key:

arch/powerpc/include/asm/book3s/64/kup.h:411:78: error:
=E2=80=98uaccess_flush_key=E2=80=99 undeclared (first use in this function)

We could add an extern for it, but that is distasteful as the static
key API suggests using the structs directly is deprecated, and the
macros we're supposed to use perform initialisation.

Could we assume microwatt-like platforms will not gain pkeys support,
and have a stubbed out set of prevent/restore_user_access for systems
that turn off either pkeys or BARRIER_NOSPEC?

Or do we get rid of PPC_BARRIER_NOSPEC as an option, and have machines
rely on disabling it at runtime?
