Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 654006B16C2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Mar 2023 00:45:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PX87p1b4Hz3cGr
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Mar 2023 10:45:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=lX1A4/ZM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com; envelope-from=maskray@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=lX1A4/ZM;
	dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PX6fM4p1jz3bWq
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Mar 2023 09:38:18 +1100 (AEDT)
Received: by mail-pj1-x102a.google.com with SMTP id h17-20020a17090aea9100b0023739b10792so354276pjz.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 Mar 2023 14:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1678315095;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FAcwnbK13i71pathy++AZi84F/RpABdU81RViXCXju0=;
        b=lX1A4/ZMbFYTJckZNlZKP4+iYQYa/WKr9Er1qGz6wqzmhIs7eVmgPDJ7X0XHx8WzKC
         U5r59/GAVGTnah9WB/78zy4QJbxpyIjr3nQ++bh/ZhgdGxQBK9CDf1flBHqrDjxyJyYX
         PI7ebuIlQ+Wx7ijTcb7h+AhEASCB8DTFQVD9xSPW1T/ZU3EAMCdfoHkOr5S9+nCzK4Qb
         VeoG48jwOtxJFwxfxabZEz9mpID7Ce9NAvHpz3hoDk3cp7mTutDmtYSKfJCdMEMKm76/
         d9jJTkwEYpN0gtr3E2HFhQO4YgBAGwj0ahoKmEl5L5s7CIxF4fk2VyYKlmCHuHJ7WTw0
         Udcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678315095;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FAcwnbK13i71pathy++AZi84F/RpABdU81RViXCXju0=;
        b=4RmtBp7nxLVfRdQZPPYZT8s8yV9clu0UsBwTGXOS37c5mb+4/q8HQT9nWl7MVbK8q9
         Jkz9uLnQTHYUFR9481eoc3Y3XLahnLb3QY7JmMZ407lL9pkHKlcrp9aecTli22S8e/iQ
         oa0cpErUDGeXANYskeVPJ7+Qc1YqaAc5RKhva75kuNNZPiD6QhttNKB3fT77QSViXZPb
         i46iBawj4CTnaJOqkq5f+aRjwqj2288WcJeM0qKiCx0mK2r/uh/tBu4j23U3WQO19Qq+
         s7nj9MtWt0G3K+NpDCNiWj61zqXLicEuWTbuUa+UVeVRrJDiGM5tgY2qUGVwzz5v9q8t
         ZUqQ==
X-Gm-Message-State: AO0yUKWfPHxzs+xk9eSzKSEd//ZDRzatv3wJp4o5AFu5bUjOk/dW3UzY
	jZplYqcAQL6SDiXtSPHXfIRPgQRQYzQH0tlHHHJRMw==
X-Google-Smtp-Source: AK7set9oey5j91nnoukjyb6gWQhNSHcKmBdVBDoNIyvJxgia8/lkIzlxGC+qCvZlvtCeueomGcgSDz8v9HjesOOWOh0=
X-Received: by 2002:a17:903:2c1:b0:199:1aba:b1d7 with SMTP id
 s1-20020a17090302c100b001991abab1d7mr7959879plk.5.1678315095153; Wed, 08 Mar
 2023 14:38:15 -0800 (PST)
MIME-Version: 1.0
References: <20221221235147.45lkqmosndritfpe@google.com> <mhng-17d41c33-7f33-4a1c-8af2-ae7d07134e8c@palmer-ri-x1c9>
 <CAFP8O3J1Pn+_BMKXtxB+avtYyZ+bBKffHfNOXoJPMD5QHv5obQ@mail.gmail.com>
In-Reply-To: <CAFP8O3J1Pn+_BMKXtxB+avtYyZ+bBKffHfNOXoJPMD5QHv5obQ@mail.gmail.com>
From: Fangrui Song <maskray@google.com>
Date: Wed, 8 Mar 2023 14:38:03 -0800
Message-ID: <CAFP8O3+KXk3NRev6c25kVWCFv8Hg3bdAa6VZVd2wFKc3baHg5w@mail.gmail.com>
Subject: Re: [PATCH v2] vdso: Improve cmd_vdso_check to check all dynamic relocations
To: Arnd Bergmann <arnd@arndb.de>
Content-Type: multipart/alternative; boundary="00000000000011c46d05f66b2f9c"
X-Mailman-Approved-At: Thu, 09 Mar 2023 10:43:49 +1100
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
Cc: linux-s390@vger.kernel.org, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, linux-csky@vger.kernel.org, luto@kernel.org, tglx@linutronix.de, vincenzo.frascino@arm.com, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--00000000000011c46d05f66b2f9c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 27, 2023 at 3:19=E2=80=AFPM Fangrui Song <maskray@google.com> w=
rote:

> On Thu, Dec 29, 2022 at 11:22 AM Palmer Dabbelt <palmer@dabbelt.com>
> wrote:
> >
> > On Wed, 21 Dec 2022 15:51:47 PST (-0800), maskray@google.com wrote:
> > > The actual intention is that no dynamic relocation exists. However,
> some
> > > GNU ld ports produce unneeded R_*_NONE. (If a port fails to determine
> > > the exact .rel[a].dyn size, the trailing zeros become R_*_NONE
> > > relocations. E.g. ld's powerpc port recently fixed
> > > https://sourceware.org/bugzilla/show_bug.cgi?id=3D29540) R_*_NONE are
> > > generally no-op in the dynamic loaders. So just ignore them.
> > >
> > > With the change, we can remove ARCH_REL_TYPE_ABS. ARCH_REL_TYPE_ABS i=
s
> a
> > > bit misnomer as ports may check RELAVETIVE/GLOB_DAT/JUMP_SLOT which a=
re
> > > not called "absolute relocations". (The patch is motivated by the arm=
64
> > > port missing R_AARCH64_RELATIVE.)
> > >
> > > Signed-off-by: Fangrui Song <maskray@google.com>
> > > Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> > > ---
> > > Change from v1:
> > > * rebase after 8ac3b5cd3e0521d92f9755e90d140382fc292510 (lib/vdso: us=
e
> "grep -E" instead of "egrep")
> > > * change the commit message to mention an example GNU ld bug; no
> longer say the patch fixes a deprecated egrep use
> > > ---
> > >   arch/arm/vdso/Makefile            |  3 ---
> > >   arch/arm64/kernel/vdso/Makefile   |  3 ---
> > >   arch/arm64/kernel/vdso32/Makefile |  3 ---
> > >   arch/csky/kernel/vdso/Makefile    |  3 ---
> > >   arch/loongarch/vdso/Makefile      |  3 ---
> > >   arch/mips/vdso/Makefile           |  3 ---
> > >   arch/powerpc/kernel/vdso/Makefile |  1 -
> > >   arch/riscv/kernel/vdso/Makefile   |  3 ---
> > >   arch/s390/kernel/vdso32/Makefile  |  2 --
> > >   arch/s390/kernel/vdso64/Makefile  |  2 --
> > >   arch/x86/entry/vdso/Makefile      |  4 ----
> > >   lib/vdso/Makefile                 | 13 ++++---------
> > >   12 files changed, 4 insertions(+), 39 deletions(-)
> >
> > [snip]
> >
> > > diff --git a/arch/riscv/kernel/vdso/Makefile
> b/arch/riscv/kernel/vdso/Makefile
> > > index 06e6b27f3bcc..d85c37e11b21 100644
> > > --- a/arch/riscv/kernel/vdso/Makefile
> > > +++ b/arch/riscv/kernel/vdso/Makefile
> > > @@ -1,9 +1,6 @@
> > >   # SPDX-License-Identifier: GPL-2.0-only
> > >   # Copied from arch/tile/kernel/vdso/Makefile
> > >
> > > -# Absolute relocation type $(ARCH_REL_TYPE_ABS) needs to be defined
> before
> > > -# the inclusion of generic Makefile.
> > > -ARCH_REL_TYPE_ABS :=3D R_RISCV_32|R_RISCV_64|R_RISCV_JUMP_SLOT
> > >   include $(srctree)/lib/vdso/Makefile
> > >   # Symbols present in the vdso
> > >   vdso-syms  =3D rt_sigreturn
> >
> > Acked-by: Palmer Dabbelt <palmer@rivosinc.com> # RISC-V
> >
> > Thanks!
>
> Looks like this patch hasn't been picked yet...
>

Ping:)


--=20
=E5=AE=8B=E6=96=B9=E7=9D=BF

--00000000000011c46d05f66b2f9c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, Jan 27, 2023 at 3:19=E2=80=AFPM F=
angrui Song &lt;<a href=3D"mailto:maskray@google.com">maskray@google.com</a=
>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">On Thu, Dec 29, 2022 at 11:22 AM Palmer Dabbelt &lt=
;<a href=3D"mailto:palmer@dabbelt.com" target=3D"_blank">palmer@dabbelt.com=
</a>&gt; wrote:<br>
&gt;<br>
&gt; On Wed, 21 Dec 2022 15:51:47 PST (-0800), <a href=3D"mailto:maskray@go=
ogle.com" target=3D"_blank">maskray@google.com</a> wrote:<br>
&gt; &gt; The actual intention is that no dynamic relocation exists. Howeve=
r, some<br>
&gt; &gt; GNU ld ports produce unneeded R_*_NONE. (If a port fails to deter=
mine<br>
&gt; &gt; the exact .rel[a].dyn size, the trailing zeros become R_*_NONE<br=
>
&gt; &gt; relocations. E.g. ld&#39;s powerpc port recently fixed<br>
&gt; &gt; <a href=3D"https://sourceware.org/bugzilla/show_bug.cgi?id=3D2954=
0" rel=3D"noreferrer" target=3D"_blank">https://sourceware.org/bugzilla/sho=
w_bug.cgi?id=3D29540</a>) R_*_NONE are<br>
&gt; &gt; generally no-op in the dynamic loaders. So just ignore them.<br>
&gt; &gt;<br>
&gt; &gt; With the change, we can remove ARCH_REL_TYPE_ABS. ARCH_REL_TYPE_A=
BS is a<br>
&gt; &gt; bit misnomer as ports may check RELAVETIVE/GLOB_DAT/JUMP_SLOT whi=
ch are<br>
&gt; &gt; not called &quot;absolute relocations&quot;. (The patch is motiva=
ted by the arm64<br>
&gt; &gt; port missing R_AARCH64_RELATIVE.)<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Fangrui Song &lt;<a href=3D"mailto:maskray@google.=
com" target=3D"_blank">maskray@google.com</a>&gt;<br>
&gt; &gt; Reviewed-by: Christophe Leroy &lt;<a href=3D"mailto:christophe.le=
roy@csgroup.eu" target=3D"_blank">christophe.leroy@csgroup.eu</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt; Change from v1:<br>
&gt; &gt; * rebase after 8ac3b5cd3e0521d92f9755e90d140382fc292510 (lib/vdso=
: use &quot;grep -E&quot; instead of &quot;egrep&quot;)<br>
&gt; &gt; * change the commit message to mention an example GNU ld bug; no =
longer say the patch fixes a deprecated egrep use<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 =C2=A0arch/arm/vdso/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 3 ---<br>
&gt; &gt;=C2=A0 =C2=A0arch/arm64/kernel/vdso/Makefile=C2=A0 =C2=A0|=C2=A0 3=
 ---<br>
&gt; &gt;=C2=A0 =C2=A0arch/arm64/kernel/vdso32/Makefile |=C2=A0 3 ---<br>
&gt; &gt;=C2=A0 =C2=A0arch/csky/kernel/vdso/Makefile=C2=A0 =C2=A0 |=C2=A0 3=
 ---<br>
&gt; &gt;=C2=A0 =C2=A0arch/loongarch/vdso/Makefile=C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 3 ---<br>
&gt; &gt;=C2=A0 =C2=A0arch/mips/vdso/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 3 ---<br>
&gt; &gt;=C2=A0 =C2=A0arch/powerpc/kernel/vdso/Makefile |=C2=A0 1 -<br>
&gt; &gt;=C2=A0 =C2=A0arch/riscv/kernel/vdso/Makefile=C2=A0 =C2=A0|=C2=A0 3=
 ---<br>
&gt; &gt;=C2=A0 =C2=A0arch/s390/kernel/vdso32/Makefile=C2=A0 |=C2=A0 2 --<b=
r>
&gt; &gt;=C2=A0 =C2=A0arch/s390/kernel/vdso64/Makefile=C2=A0 |=C2=A0 2 --<b=
r>
&gt; &gt;=C2=A0 =C2=A0arch/x86/entry/vdso/Makefile=C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 4 ----<br>
&gt; &gt;=C2=A0 =C2=A0lib/vdso/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 13 ++++---------<br>
&gt; &gt;=C2=A0 =C2=A012 files changed, 4 insertions(+), 39 deletions(-)<br=
>
&gt;<br>
&gt; [snip]<br>
&gt;<br>
&gt; &gt; diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/=
vdso/Makefile<br>
&gt; &gt; index 06e6b27f3bcc..d85c37e11b21 100644<br>
&gt; &gt; --- a/arch/riscv/kernel/vdso/Makefile<br>
&gt; &gt; +++ b/arch/riscv/kernel/vdso/Makefile<br>
&gt; &gt; @@ -1,9 +1,6 @@<br>
&gt; &gt;=C2=A0 =C2=A0# SPDX-License-Identifier: GPL-2.0-only<br>
&gt; &gt;=C2=A0 =C2=A0# Copied from arch/tile/kernel/vdso/Makefile<br>
&gt; &gt;<br>
&gt; &gt; -# Absolute relocation type $(ARCH_REL_TYPE_ABS) needs to be defi=
ned before<br>
&gt; &gt; -# the inclusion of generic Makefile.<br>
&gt; &gt; -ARCH_REL_TYPE_ABS :=3D R_RISCV_32|R_RISCV_64|R_RISCV_JUMP_SLOT<b=
r>
&gt; &gt;=C2=A0 =C2=A0include $(srctree)/lib/vdso/Makefile<br>
&gt; &gt;=C2=A0 =C2=A0# Symbols present in the vdso<br>
&gt; &gt;=C2=A0 =C2=A0vdso-syms=C2=A0 =3D rt_sigreturn<br>
&gt;<br>
&gt; Acked-by: Palmer Dabbelt &lt;<a href=3D"mailto:palmer@rivosinc.com" ta=
rget=3D"_blank">palmer@rivosinc.com</a>&gt; # RISC-V<br>
&gt;<br>
&gt; Thanks!<br>
<br>
Looks like this patch hasn&#39;t been picked yet...<br>
</blockquote></div><br clear=3D"all"><div>Ping:)</div><div><br></div><div><=
br></div><span class=3D"gmail_signature_prefix">-- </span><br><div dir=3D"l=
tr" class=3D"gmail_signature"><div dir=3D"ltr">=E5=AE=8B=E6=96=B9=E7=9D=BF<=
/div></div></div>

--00000000000011c46d05f66b2f9c--
