Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FEEB73468D
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 Jun 2023 16:21:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=VaAic+1r;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QkZnm6tgcz30NP
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jun 2023 00:21:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=VaAic+1r;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::112a; helo=mail-yw1-x112a.google.com; envelope-from=miguel.ojeda.sandonis@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QkZmv3l7Hz309V
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jun 2023 00:20:30 +1000 (AEST)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-56ce61769b7so30157167b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 Jun 2023 07:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687098025; x=1689690025;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UKngzCbi/z0YczLfmgJ8G+89JRu+Tx99q0y6rf+xc3g=;
        b=VaAic+1rlhUTFVg7WGWjD/PM++B/69nK3R1DcgWj7rqNxpw4yV9fuUWKfpqgtW/K7I
         Jku2fodUUoezlMprvokwNK49VRwuEDr/JdcXT2eyuPymQU/KU44RR6E4F/VCjvAoxDk1
         KrGyx51eGhHP3KY8eiarxseURUuPzQcRrZnqyy8Wh1wskYRfipZKy11JzbyD16UzaKvC
         nsVkqLniY3F1bfuJP/l8ILPUL5tUoOJ/pHmFBOxEGlZGVPMIk7aUfKcOWy+M2DZ9RWfc
         Y3uvvy4nQTH4yi9lyWQ0OCifbD4zzFYRwWNQVmJHCU+m8tyCaeCz/eCA8ppT0z0pCwT+
         +7NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687098025; x=1689690025;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UKngzCbi/z0YczLfmgJ8G+89JRu+Tx99q0y6rf+xc3g=;
        b=hjP96UvsC12BE2I9fATLKHkAF3pSK0yQlKxadL8VvaKTi7cO4r+IIcYiIDCOPZNxZx
         RhL0WOF5AwSl5nLb9g+/97pbp2/62P0b1JDnazYrUswiCuuq7I6jJSHW55mItb0yMRJV
         q+gc6pos5vnPEBnJQgLI69jj/Eb+Smv5RVttUIZZNC4PnnKTnlAY6uhFO/VqNCGYhVVm
         VtwBDlc6gMYekhRCCWTKjqqbcR1rXgjjbHyexntQqAtSpVuXK1UTtXkSwuTezxvyDA8O
         HgNJdi4to9xNr6wBq/4A85mkWFKjstHdILWOFV8wk+KGBIa4X4r/u1g48tJBMMwI08+K
         CSkw==
X-Gm-Message-State: AC+VfDwMy0AobfZ+WuVZLnMGICFBqLlF9PAFDNaqJXxKZN3f3UKrUVVm
	C0AEfSkV29Fb9fLuYiZu+j/wGtw3Jn8WpNUn7aI=
X-Google-Smtp-Source: ACHHUZ6OWkndylY7XcNfai46ffCnTYYuh35ry6WdKDFVRKwvPPPvXYLW796YQAzIMxPv4BZVitbcDftNF6Bg3+Aa+r4=
X-Received: by 2002:a0d:eb93:0:b0:56d:805:1507 with SMTP id
 u141-20020a0deb93000000b0056d08051507mr7753300ywe.16.1687098025485; Sun, 18
 Jun 2023 07:20:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230529052821.58175-1-maninder1.s@samsung.com>
 <CGME20230529052832epcas5p4fa1b8cf25d9810d32bd2ccf012086fb3@epcms5p1>
 <CANiq72ncDr68qeahrHuQ63dj1Va3=Us6ZSjGRkr6Zp8j+=yH_Q@mail.gmail.com>
 <20230529105707epcms5p1418eac680ebe1736196706b0db80dd39@epcms5p1>
 <CANiq72n_eso7_pgna8ukmEnuCQPsKYPr0NU-Ss9Nwv0VzX=etg@mail.gmail.com> <202305301611.34F0A680A2@keescook>
In-Reply-To: <202305301611.34F0A680A2@keescook>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 18 Jun 2023 16:20:14 +0200
Message-ID: <CANiq72=K1sXz=TjBSjx+7JuTueH6vjbz9--Q2dGDYj3naKvroQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] arch:hexagon/powerpc: use KSYM_NAME_LEN in array size
To: Kees Cook <keescook@chromium.org>
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
Cc: "nathanl@linux.ibm.com" <nathanl@linux.ibm.com>, "bcain@quicinc.com" <bcain@quicinc.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, "gary@garyguo.net" <gary@garyguo.net>, "pmladek@suse.com" <pmladek@suse.com>, "ustavoars@kernel.org" <ustavoars@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "npiggin@gmail.com" <npiggin@gmail.com>, "ojeda@kernel.org" <ojeda@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>, "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>, maninder1.s@samsung.com, Onkarnath <onkarnath.1@samsung.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 31, 2023 at 1:14=E2=80=AFAM Kees Cook <keescook@chromium.org> w=
rote:
>
> On Mon, May 29, 2023 at 04:50:45PM +0200, Miguel Ojeda wrote:
> > Kees: what is the current stance on `[static N]` parameters? Something =
like:
> >
> >     const char *kallsyms_lookup(unsigned long addr,
> >                                 unsigned long *symbolsize,
> >                                 unsigned long *offset,
> >     -                           char **modname, char *namebuf);
> >     +                           char **modname, char namebuf[static KSY=
M_NAME_LEN]);
> >
> > makes the compiler complain about cases like these (even if trivial):
> >
> >     arch/powerpc/xmon/xmon.c:1711:10: error: array argument is too smal=
l;
> >         contains 128 elements, callee requires at least 512
> > [-Werror,-Warray-bounds]
> >             name =3D kallsyms_lookup(pc, &size, &offset, NULL, tmpstr);
> >                  ^                                           ~~~~~~
> >     ./include/linux/kallsyms.h:86:29: note: callee declares array
> > parameter as static here
> >             char **modname, char namebuf[static KSYM_NAME_LEN]);
> >                                  ^      ~~~~~~~~~~~~~~~~~~~~~~
>
> Wouldn't that be a good thing? (I.e. complain about the size mismatch?)

Yeah, I would say so (i.e. I meant it as a good thing).

> > But I only see 2 files in the kernel using `[static N]` (from 2020 and
> > 2021). Should something else be used instead (e.g. `__counted_by`),
> > even if constexpr-sized?.
>
> Yeah, it seems pretty uncommon. I'd say traditionally arrays aren't
> based too often, rather structs containing them.
>
> But ultimately, yeah, everything could gain __counted_by and friends in
> the future.

That would be nice!

Cheers,
Miguel
