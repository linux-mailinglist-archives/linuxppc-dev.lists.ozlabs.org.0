Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6751D19F438
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 13:15:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wny64H1rzDqtZ
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 21:15:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::241;
 helo=mail-oi1-x241.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=IikJnpbW; dkim-atps=neutral
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wnwV1zYlzDqs2
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Apr 2020 21:13:45 +1000 (AEST)
Received: by mail-oi1-x241.google.com with SMTP id k9so12691904oia.8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Apr 2020 04:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BYXpnEzWC8iPadOpslFP/M9Jw7bUzZldaTniUCf4cNU=;
 b=IikJnpbWlaZle3nCU8yw5zbmme69OGK58XtEGsWpQuSO431c2lM5COfTJjfExYHrpO
 50y2ZuGy06XQ8yPDTroa9DMZyR7YwFnxELvmvs5oapfHa/7Gw41J+7QYn7bCzXN8Pr6w
 IhuU/JmN80xyip2/yWVGRHWc6/OkUPv8rQMXq86tah71gkrDBVutqnweVGh/GRL0P2ss
 bDT5d2i1On0ovbGEwKIyjTXiqyIIczkIpWTMlWYpxv5YFeOXa9MuQPrMbbZqzqb8U5Ji
 lRQ8sJI9WrxNmf3QZh6+BKD2ZOE1Ds+JMTm3zBi3L3K8fHj/mBNeglvPg1pV0dF6V+et
 1BVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BYXpnEzWC8iPadOpslFP/M9Jw7bUzZldaTniUCf4cNU=;
 b=Fh9Q+3jgVQ74wpGRVAwxnLnF87j5PLeUx4n6dPqDLXeSNCtWDjI9veZ6LVKTRz96Wd
 K0xLZMxrOATx8fFNYTCckUGrlr8ICHRBD6r1gQCk8fCs3MZZA6CXrA4DwDgJ4UdZlXai
 MYFjdeEwdoe2Z7v6xFAt54VPok784tEyX6tjeNUJJbZI2IB8tWLpHxI5BNvfplH8kIgu
 N8jvTVtArTQpBu2ws7G7yB+xRJ6CLJtGbAhe2cz2KqFoMBmZGTUZdclvKuKRTopnCwvn
 zO+ssM2m7jYC9Y4LzmZ0u678LtLygK8sYpYDseT2fY5N1zJoboAkZGQdcgoFWYPsjzig
 C3OQ==
X-Gm-Message-State: AGi0Pubb9Nz2f1dX8PgEUrxbzO+paR4SYzlk0ytKhDZB/8ErqlemNSue
 G7Rr5xf5TnX6xUOGDTNWs4lLqts5ejjGtyoDMo0=
X-Google-Smtp-Source: APiQypJTzSnMBJgtpJ4UADGLCmKLnxDcEefHfgo4wWulDuVbe7CT/cSqRNS14pDuGLKy3zdLrKvKw7i4/2Zo7C9DNDk=
X-Received: by 2002:aca:fd48:: with SMTP id b69mr12081140oii.126.1586171622583; 
 Mon, 06 Apr 2020 04:13:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200406080936.7180-1-jniethe5@gmail.com>
 <20200406080936.7180-19-jniethe5@gmail.com>
 <7182352.hY56U9iWWN@townsend> <4a8cf8b1-63e7-0b68-dede-48454bf5a4a7@c-s.fr>
In-Reply-To: <4a8cf8b1-63e7-0b68-dede-48454bf5a4a7@c-s.fr>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Mon, 6 Apr 2020 21:13:31 +1000
Message-ID: <CACzsE9pcuvZWgyXjncnrehanMY2Eh85F_pnYmOxBq4jPT8Sv-w@mail.gmail.com>
Subject: Re: [PATCH v5 18/21] powerpc64: Add prefixed instructions to
 instruction data type
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
Cc: Alistair Popple <alistair@popple.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, Balamuruhan S <bala24@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Apr 6, 2020 at 8:25 PM Christophe Leroy <christophe.leroy@c-s.fr> w=
rote:
>
>
>
> Le 06/04/2020 =C3=A0 11:52, Alistair Popple a =C3=A9crit :
>
> [...]
>
> >> @@ -32,14 +76,31 @@ static inline struct ppc_inst ppc_inst_swab(struct
> >> ppc_inst x) return ppc_inst(swab32(ppc_inst_val(x)));
> >>   }
> >>
> >> +static inline u32 ppc_inst_val(struct ppc_inst x)
> >> +{
> >> +    return x.val;
> >> +}
> >> +
> >>   static inline struct ppc_inst ppc_inst_read(const struct ppc_inst *p=
tr)
> >>   {
> >>      return *ptr;
> >>   }
> >>
> >> +static inline void ppc_inst_write(struct ppc_inst *ptr, struct ppc_in=
st x)
> >> +{
> >> +    *ptr =3D x;
> >> +}
> >> +
> >> +#endif /* __powerpc64__ */
> >> +
> >>   static inline bool ppc_inst_equal(struct ppc_inst x, struct ppc_inst=
 y)
> >>   {
> >>      return !memcmp(&x, &y, sizeof(struct ppc_inst));
> >>   }
> >
> > Apologies for not picking this up earlier, I was hoping to get to the b=
ottom
> > of the issue I was seeing before you sent out v5. However the above def=
inition
> > of instruction equality does not seem correct because it does not consi=
der the
> > case when an instruction is not prefixed - a non-prefixed instruction s=
hould be
> > considered equal if the first 32-bit opcode/value is the same. Somethin=
g like:
> >
> >       if (ppc_inst_prefixed(x) !=3D ppc_inst_prefixed(y))
> >               return false;
> >       else if (ppc_inst_prefixed(x))
> >               return !memcmp(&x, &y, sizeof(struct ppc_inst));
>
> Are we sure memcmp() is a good candidate for the comparison ? Can we do
> simpler ? Especially, I understood a prefixed instruction is a 64 bits
> properly aligned instruction, can we do a simple u64 compare ? Or is GCC
> intelligent enough to do that without calling memcmp() function which is
> heavy ?
As it is GCC does call memcmp(). I'll try to make it simpler.
>
> >       else
> >               return x.val =3D=3D y.val;
> >
> > This was causing failures in ftrace_modify_code() as it would falsely d=
etect
> > two non-prefixed instructions as being not equal due to differences in =
the suffix.
> >
>
> Christophe
