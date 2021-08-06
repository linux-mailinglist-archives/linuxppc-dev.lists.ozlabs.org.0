Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7863E2B47
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Aug 2021 15:23:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gh5ln4QMfz3d9Y
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Aug 2021 23:23:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=seMEqqju;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::229;
 helo=mail-lj1-x229.google.com; envelope-from=sxwjean@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=seMEqqju; dkim-atps=neutral
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gh5lH4QKmz30GG
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Aug 2021 23:23:22 +1000 (AEST)
Received: by mail-lj1-x229.google.com with SMTP id m18so620202ljo.1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Aug 2021 06:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=MmjOBkvHIeBd9bWc/MfmhkUI2rLK9E02S7b9Xp9vELk=;
 b=seMEqqju9ELt8C3WomJfex6C+ZrixSzyKjl/CLP7LjcVT/hY4kbhbgLAozwy3WlAFz
 KHNhtwmtMh4HrrlC8KM8z3InUPwmuooFw/il2YvYxoCaIONvI6QVDIuJHk88Z5Rr67Gc
 oz/Y9qBcuSjIuRL1toOgCReryGDLPxMZtNp55wtUy7R4m0cM+en2paQIyb5NiK1MxyoT
 OdeQsuEzFIpW6ajCdlUWB2SFpW9qRWW/prONePl8yverNyXqephSCzdTUd6fC8C6ALNa
 23DsBya8Uhr5pG8Odsxs4OA6I3I1jg7vmcIUWgRaiNt5Xo0D7wwBzuVimIBzuOPeOhX4
 qfUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MmjOBkvHIeBd9bWc/MfmhkUI2rLK9E02S7b9Xp9vELk=;
 b=XrKeMwR3E1VGrw3BaRRL4A3t2v9A4O6p2qDKOtiFsZFnGtxe6f4V7C93haU1XIx3GX
 D5jLTVAuTeusEwJOxIW4UFz3x1VLCId+lKDD/WHFXvae7lLJ0XOtAiwk/C0hki4Iaesu
 peqj3PNMeY/nGOsX9o9z7VgPOcjXZl4NP7PwG4u/7Yz+wLelt+fRxx5mGPIAwMT6Ldie
 nDRF16TKCSK1F4YK9AoD++7lyS2MvGhFjUUJsg52ZTGNMxKLZnPFQxb2VICy3BZvyu1S
 4nnbkBv57pOimgXpG6gXoivyFBBICeGscWmJ1oRDz55sOZIEtMQbsB2Nc3vGk0hUCYcx
 mz0A==
X-Gm-Message-State: AOAM533GvwR4eHNamqbxXNueCss9UZnrGzzuQLFiPIrfSmoG3ijjWweu
 jPu4bkPX1XUkc9GGNCuWO1oo5DQqBWZFapCtlXk=
X-Google-Smtp-Source: ABdhPJza1iLxbvbx1iQeCXHWd/NwaNS5mAAI0qpL5CCtMKnhsx7SiYz6f9ccvbMatJGDImPjnkvSMIENLa0OmJ5Rn2A=
X-Received: by 2002:a2e:4e09:: with SMTP id c9mr6441037ljb.11.1628256199556;
 Fri, 06 Aug 2021 06:23:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210726143053.532839-1-sxwjean@me.com>
 <5e2336aa-90bf-b820-b5e4-e9a63088930f@csgroup.eu>
 <CAEVVKH-rht+xpwTUL=ny6qENe2Fb0n=3e7DEmc5qzpSq2_1gTA@mail.gmail.com>
 <26814448-c30a-1de1-bad4-79e2bffc3054@csgroup.eu>
In-Reply-To: <26814448-c30a-1de1-bad4-79e2bffc3054@csgroup.eu>
From: Xiongwei Song <sxwjean@gmail.com>
Date: Fri, 6 Aug 2021 21:22:52 +0800
Message-ID: <CAEVVKH8wjaR3JqgkWX=X6n00nmPEjcUCHU=_5w_xxjsAWHFcUg@mail.gmail.com>
Subject: Re: [RFC PATCH 1/4] powerpc: Optimize register usage for esr register
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
Cc: ravi.bangoria@linux.ibm.com, Xiongwei Song <sxwjean@me.com>,
 oleg@redhat.com, npiggin@gmail.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, efremov@linux.com,
 Paul Mackerras <paulus@samba.org>, aneesh.kumar@linux.ibm.com,
 peterx@redhat.com, PowerPC <linuxppc-dev@lists.ozlabs.org>,
 akpm@linux-foundation.org, sandipan@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Aug 6, 2021 at 3:32 PM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 06/08/2021 =C3=A0 05:16, Xiongwei Song a =C3=A9crit :
> > On Thu, Aug 5, 2021 at 6:06 PM Christophe Leroy
> > <christophe.leroy@csgroup.eu> wrote:
> >>
> >>
> >>
> >> Le 26/07/2021 =C3=A0 16:30, sxwjean@me.com a =C3=A9crit :
> >>> From: Xiongwei Song <sxwjean@gmail.com>
> >>>
> >>> Create an anonymous union for dsisr and esr regsiters, we can referen=
ce
> >>> esr to get the exception detail when CONFIG_4xx=3Dy or CONFIG_BOOKE=
=3Dy.
> >>> Otherwise, reference dsisr. This makes code more clear.
> >>
> >> I'm not sure it is worth doing that.
> > Why don't we use "esr" as reference manauls mentioned?
> >
> >>
> >> What is the point in doing the following when you know that regs->esr =
and regs->dsisr are exactly
> >> the same:
> >>
> >>   > -    err =3D ___do_page_fault(regs, regs->dar, regs->dsisr);
> >>   > +    if (IS_ENABLED(CONFIG_4xx) || IS_ENABLED(CONFIG_BOOKE))
> >>   > +            err =3D ___do_page_fault(regs, regs->dar, regs->esr);
> >>   > +    else
> >>   > +            err =3D ___do_page_fault(regs, regs->dar, regs->dsisr=
);
> >>   > +
> > Yes, we can drop this. But it's a bit vague.
> >
> >> Or even
> >>
> >>   > -    int is_write =3D page_fault_is_write(regs->dsisr);
> >>   > +    unsigned long err_reg;
> >>   > +    int is_write;
> >>   > +
> >>   > +    if (IS_ENABLED(CONFIG_4xx) || IS_ENABLED(CONFIG_BOOKE))
> >>   > +            err_reg =3D regs->esr;
> >>   > +    else
> >>   > +            err_reg =3D regs->dsisr;
> >>   > +
> >>   > +    is_write =3D page_fault_is_write(err_reg);
> >>
> >>
> >> Artificially growing the code for that makes no sense to me.
> >
> > We can drop this too.
> >>
> >>
> >> To avoid anbiguity, maybe the best would be to rename regs->dsisr to s=
omething like regs->sr , so
> >> that we know it represents the status register, which is DSISR or ESR =
depending on the platform.
> >
> > If so, this would make other people more confused. My consideration is
> > to follow what the reference
> > manuals represent.
>
> Maybe then we could rename the fields as regs->dsisr_esr and regs->dar_de=
ar

I still prefer my method.

>
> That would be more explicit for everyone.
>
> The UAPI header however should remain as is because anonymous unions are =
not supported by old
> compilers as mentioned by Michael.

Sure. Will update in v2.

>
> But nevertheless, there are also situations where was is stored in regs->=
dsisr is not what we have
> in DSISR register. For instance on an ISI exception, we store a subset of=
 the content of SRR1
> register into regs->dsisr.

Can I think my method has better expansibility here;-)?
Let me finish esr and dear first. Thank you for the reminder.

Regards,
Xiongwei
>
> Christophe
