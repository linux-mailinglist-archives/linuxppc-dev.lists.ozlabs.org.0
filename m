Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 32AEB159E03
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Feb 2020 01:33:25 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48HLGS4zYPzDqM4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Feb 2020 11:33:20 +1100 (AEDT)
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
 header.s=20161025 header.b=d/PrxWdm; dkim-atps=neutral
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48HLD56nZDzDqH2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Feb 2020 11:31:17 +1100 (AEDT)
Received: by mail-oi1-x242.google.com with SMTP id a142so333104oii.7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Feb 2020 16:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=SsFeTGQiCwnDdp2AwNJ5yoz90PO1yIPUzXujkTGXE3U=;
 b=d/PrxWdm+4/x3kbZ6ZjLNZQkxq+9QwJxXP2tvuiJmalB/cYwWRgBGc2L4T1NXCJUnS
 R0EAMJyb3xtzIFNVNWMZxzLyjPzA+2k7A5AydlYXfURNSnbN6HgEIs+2E/OZ6fLYPWAP
 pVW2zNjOGeZ0Csy0S1FHHKgedfq/NqQ5RajkJOihhBjgIiBYF0qAL2yaCHQPNorR7XxM
 yzZPCwIMrbehFIMgHRDEpha1Il3/kLeBrjJehGedDiCu6I/VYHGwkxFFf+y9ndtegW8K
 4zFwii4W1aRkWssyQnHQ/3NXCEDfLT+BoiGamn5A1LG3BguvFwHRm3qU2hi0oOwmh/ww
 DX6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SsFeTGQiCwnDdp2AwNJ5yoz90PO1yIPUzXujkTGXE3U=;
 b=Di0ka2NAswpn4yH05MibsXRe5TRtxJP9kKx5RK7LZjBWkIMassR0ERP63H0V3KQQSl
 gsKX50CbkUgY5T/goV+uV086duz6WLTKZErCNFw5mzh+wKjAcHgM9xpWs6ndM2scSxJb
 aetTfBuOO6JP2Wq9xL2fiMiajiV0s/uLw2MsYwdPMfjyxHN5tkMkuzqxTfX0uFM1gpll
 mG6g9G9++5j/U/leXtJJazvkZE6dJa1bCkB41VE2qodFEWxDjZvabtEtUClHJQ61eGM8
 0CVWkXOwjNoqaFFtmVtK9E2IZcx3yCgAgHoKRaCyXp4FIniNnNOIJXWAkQ7dLpuJWSPN
 DfwA==
X-Gm-Message-State: APjAAAW0xvsDnUIbeM7jhb8Cojq5Nc2FKuWinfLfP01XrqtagYmy0/BI
 BKsNk4YDTyXYTdfnTLWr+vRUFjiAhf4wWxKk9dw=
X-Google-Smtp-Source: APXvYqxiVMa73LQHY9IdBEWSFYYxXbeCTbbUWhAdssCh4zhIAr3P+jHCDBwLvFpgjXvlNACWbHSo6x/lps1QzO1IUZQ=
X-Received: by 2002:aca:54cc:: with SMTP id i195mr4514158oib.126.1581467474318; 
 Tue, 11 Feb 2020 16:31:14 -0800 (PST)
MIME-Version: 1.0
References: <20200211053355.21574-1-jniethe5@gmail.com>
 <20200211053355.21574-10-jniethe5@gmail.com>
 <52a33d2b-0dd7-1e29-564d-3ec982b36ef9@c-s.fr>
In-Reply-To: <52a33d2b-0dd7-1e29-564d-3ec982b36ef9@c-s.fr>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Wed, 12 Feb 2020 11:31:03 +1100
Message-ID: <CACzsE9qY+jNJ7oTsLJxoFKJDYutUvGc-x2985LaT_EqV7Qs0dA@mail.gmail.com>
Subject: Re: [PATCH v2 09/13] powerpc/xmon: Dump prefixed instructions
To: Christophe Leroy <christophe.leroy@c-s.fr>
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
Cc: Balamuruhan S <bala24@linux.ibm.com>,
 Alistair Popple <alistair@popple.id.au>, Daniel Axtens <dja@axtens.net>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 11, 2020 at 5:39 PM Christophe Leroy
<christophe.leroy@c-s.fr> wrote:
>
>
>
> Le 11/02/2020 =C3=A0 06:33, Jordan Niethe a =C3=A9crit :
> > Currently when xmon is dumping instructions it reads a word at a time
> > and then prints that instruction (either as a hex number or by
> > disassembling it). For prefixed instructions it would be nice to show
> > its prefix and suffix as together. Use read_instr() so that if a prefix
> > is encountered its suffix is loaded too. Then print these in the form:
> >      prefix:suffix
> > Xmon uses the disassembly routines from GNU binutils. These currently d=
o
> > not support prefixed instructions so we will not disassemble the
> > prefixed instructions yet.
> >
> > Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> > ---
> > v2: Rename sufx to suffix
> > ---
> >   arch/powerpc/xmon/xmon.c | 50 +++++++++++++++++++++++++++++++--------=
-
> >   1 file changed, 39 insertions(+), 11 deletions(-)
> >
> > diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
> > index 0b085642bbe7..513901ee18b0 100644
> > --- a/arch/powerpc/xmon/xmon.c
> > +++ b/arch/powerpc/xmon/xmon.c
> > @@ -2903,6 +2903,21 @@ prdump(unsigned long adrs, long ndump)
> >       }
> >   }
> >
> > +static bool instrs_are_equal(unsigned long insta, unsigned long suffix=
a,
> > +                          unsigned long instb, unsigned long suffixb)
> > +{
> > +     if (insta !=3D instb)
> > +             return false;
> > +
> > +     if (!IS_PREFIX(insta) && !IS_PREFIX(instb))
> > +             return true;
> > +
> > +     if (IS_PREFIX(insta) && IS_PREFIX(instb))
> > +             return suffixa =3D=3D suffixb;
> > +
> > +     return false;
> > +}
> > +
> >   typedef int (*instruction_dump_func)(unsigned long inst, unsigned lon=
g addr);
> >
> >   static int
> > @@ -2911,12 +2926,11 @@ generic_inst_dump(unsigned long adr, long count=
, int praddr,
> >   {
> >       int nr, dotted;
> >       unsigned long first_adr;
> > -     unsigned int inst, last_inst =3D 0;
> > -     unsigned char val[4];
> > +     unsigned int inst, suffix, last_inst =3D 0, last_suffix =3D 0;
> >
> >       dotted =3D 0;
> > -     for (first_adr =3D adr; count > 0; --count, adr +=3D 4) {
> > -             nr =3D mread(adr, val, 4);
> > +     for (first_adr =3D adr; count > 0; --count, adr +=3D nr) {
> > +             nr =3D read_instr(adr, &inst, &suffix);
> >               if (nr =3D=3D 0) {
> >                       if (praddr) {
> >                               const char *x =3D fault_chars[fault_type]=
;
> > @@ -2924,8 +2938,9 @@ generic_inst_dump(unsigned long adr, long count, =
int praddr,
> >                       }
> >                       break;
> >               }
> > -             inst =3D GETWORD(val);
> > -             if (adr > first_adr && inst =3D=3D last_inst) {
> > +             if (adr > first_adr && instrs_are_equal(inst, suffix,
> > +                                                     last_inst,
> > +                                                     last_suffix)) {
> >                       if (!dotted) {
> >                               printf(" ...\n");
> >                               dotted =3D 1;
> > @@ -2934,11 +2949,24 @@ generic_inst_dump(unsigned long adr, long count=
, int praddr,
> >               }
> >               dotted =3D 0;
> >               last_inst =3D inst;
> > -             if (praddr)
> > -                     printf(REG"  %.8x", adr, inst);
> > -             printf("\t");
> > -             dump_func(inst, adr);
> > -             printf("\n");
> > +             last_suffix =3D suffix;
> > +             if (IS_PREFIX(inst)) {
> > +                     if (praddr)
> > +                             printf(REG"  %.8x:%.8x", adr, inst, suffi=
x);
> > +                     printf("\t");
> > +                     /*
> > +                      * Just use this until binutils ppc disassembly
> > +                      * prints prefixed instructions.
> > +                      */
> > +                     printf("%.8x:%.8x", inst, suffix);
> > +                     printf("\n");
> > +             } else {
> > +                     if (praddr)
> > +                             printf(REG"  %.8x", adr, inst);
> > +                     printf("\t");
> > +                     dump_func(inst, adr);
> > +                     printf("\n");
> > +             }
>
> What about:
>
>
>                 if (pr_addr) {
>                         printf(REG"  %.8x", adr, inst);
>                         if (IS_PREFIX(inst))
>                                 printf(":%.8x", suffix);
>                 }
>                 printf("\t");
>                 if (IS_PREFIX(inst))
>                         printf("%.8x:%.8x", inst, suffix);
>                 else
>                         dump_func(inst, adr);
>                 printf("\n");
>
Yeah that looks better.
> >       }
> >       return adr - first_adr;
> >   }
> >
>
> Christophe
