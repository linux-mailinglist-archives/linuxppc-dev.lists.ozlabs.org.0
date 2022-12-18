Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E978A650460
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 Dec 2022 19:32:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NZrzz5d31z3bgN
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Dec 2022 05:32:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=AXETmQ2+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::82c; helo=mail-qt1-x82c.google.com; envelope-from=maskray@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=AXETmQ2+;
	dkim-atps=neutral
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NZrz056dQz2xjR
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Dec 2022 05:31:55 +1100 (AEDT)
Received: by mail-qt1-x82c.google.com with SMTP id x11so6714034qtv.13
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 Dec 2022 10:31:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G6KoHvcGTx1RcWeXNiJbyqXJGMqsYoj3r/slahxN0do=;
        b=AXETmQ2+NJJH9dhNzAPwQ0s/HvEQF7jcqqUCJVlG45c91ucHbLsnCqKo61bi/1AxsV
         WbR8WRagXpTp0rVjwLIGQM30a1S47wrJW+Z1j9N+MPtFq9WWws7hma6/BRHw66QW8T4q
         G67j+3VBYBNneXjsrJNhe2zVwMTBr7TMKLIr0VHkXMfEE3awqCSAUF2M6Sc52bhm+mFh
         YKlC38KVcYTaDIXKmZQdv5bEnmiiBi+jROD5I/dc3yzAGrlFvxG4ikTdVFfY177W3DhC
         xki87bEvgwQydNUbKwT9qKQ+0846myxixMIMjFqKO6k3hZUiG0ixF+V8OxXRwD2vw8pf
         FXXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G6KoHvcGTx1RcWeXNiJbyqXJGMqsYoj3r/slahxN0do=;
        b=h+pcuOFccp9y+5fXhH6Fbm0yEW/gond4Jwgq2iZ/3mTTdfsyCwrsqJBw7M4sl3kBvY
         Q3BcOCdLno1vr37d6HuLSJqaz++UcmVEwThIb/knmk3ETlNOsrmNZcj62+e9KdVeU7vb
         ebeK2RSuFMwRM7c9W0XxqIjDqw0m7qO6o4wZSQfJ2/fj9W3r5d7uwAlZaGZbCz3cIbr4
         CfqsVtBH7K/cYeFxuDGoOsnS0YCpsxRaNAbV6cPv+gYsZdYD5OYVucdroScwOl8eISH+
         rRwFFm24xfibe8aRhhZN2pnAakOY6F8NbD17hPvCcx4NdCPEpwcA9X1eMKCvhl3nHO5C
         nUzw==
X-Gm-Message-State: ANoB5pnwt7D3lZjAPbJmbQNDgqLkedgAnbabrdT86MM42Cdg+X1pUacK
	DUKt9edCcw2R3yAqTaPhq6pZCscqoKKlXqPvUGCiLw==
X-Google-Smtp-Source: AA0mqf5ABkKhlDT/MO5rrqjzXb8ZbVq5G52EEI25mfQE+l9Q5TztddrpvmEjk73i7QcTQ8HFrykkl5VMG32NOyDWolA=
X-Received: by 2002:ac8:754e:0:b0:3a7:e16a:6a7 with SMTP id
 b14-20020ac8754e000000b003a7e16a06a7mr17572456qtr.288.1671388310693; Sun, 18
 Dec 2022 10:31:50 -0800 (PST)
MIME-Version: 1.0
References: <20220830193701.1702962-1-maskray@google.com> <20220910075316.no72fdyqjvunomwm@google.com>
 <CAFP8O3+OwanSJdzd5V3oGJ_MOJOSVdbn+4iBJJKm2LCR8mCA0Q@mail.gmail.com>
 <9ce45cd2-dcd8-11f8-e496-7efe3649e241@csgroup.eu> <20221115004625.x4wl6zbg4iiuxl5t@google.com>
 <CAFP8O3LdSJCChGEwT57e=iZopceYkBFuW9XD=yhO1ZszVZGm4g@mail.gmail.com> <3ec9737e-3d1a-c014-b91a-0e2d406a3b3d@csgroup.eu>
In-Reply-To: <3ec9737e-3d1a-c014-b91a-0e2d406a3b3d@csgroup.eu>
From: Fangrui Song <maskray@google.com>
Date: Sun, 18 Dec 2022 10:31:39 -0800
Message-ID: <CAFP8O3KZTkSbxXJ2yWt4w-F3xWHY_owCs03wN3Bhss57O-E_JQ@mail.gmail.com>
Subject: Re: [PATCH] vdso: Improve cmd_vdso_check to check all dynamic relocations
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Andy Lutomirski <luto@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Vincenzo Frascino <vincenzo.frascino@arm.com>
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
Cc: "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Dec 4, 2022 at 8:58 AM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 04/12/2022 =C3=A0 05:50, Fangrui Song a =C3=A9crit :
> > On Mon, Nov 14, 2022 at 4:46 PM Fangrui Song <maskray@google.com> wrote=
:
> >>
> >> On 2022-11-14, Christophe Leroy wrote:
> >>>
> >>>
> >>> Le 28/09/2022 =C3=A0 07:25, Fangrui Song a =C3=A9crit :
> >>>> On Sat, Sep 10, 2022 at 12:53 AM Fangrui Song <maskray@google.com> w=
rote:
> >>>>>
> >>>>> On 2022-08-30, Fangrui Song wrote:
> >>>>>> The actual intention is that no dynamic relocation exists. However=
, some
> >>>>>> GNU ld ports produce unneeded R_*_NONE. (If a port is not care eno=
ugh to
> >>>>>> determine the exact .rel[a].dyn size, the trailing zeros become R_=
*_NONE
> >>>>>> relocations. E.g. powerpc64le ld as of 2.38 has the issue with
> >>>>>> defconfig.) R_*_NONE are generally no-op in the dynamic loaders. S=
o just
> >>>>>> ignore them.
> >>>>>>
> >>>>>> With the change, we can remove ARCH_REL_TYPE_ABS. ARCH_REL_TYPE_AB=
S is a
> >>>>>> bit misnomer as ports may check RELAVETIVE/GLOB_DAT/JUMP_SLOT whic=
h are
> >>>>>> not called "absolute relocations". (The patch is motivated by the =
arm64
> >>>>>> port missing R_AARCH64_RELATIVE.)
> >>>>>>
> >>>>>> While here, replace "egrep" with "grep" as "egrep" is deprecated i=
n GNU
> >>>>>> grep 3.7.
> >>>>>>
> >>>>>> Signed-off-by: Fangrui Song <maskray@google.com>
> >>>>>> ---
> >>>>>> [...]
> >>>>>>
> >>>>>
> >>>>> Ping.
> >>>>
> >>>> Ping^2 :)
> >>>
> >>> Can you explain which ARCH_REL_TYPE_ABS can be removed with this chan=
ge ?
> >>> How is the verification done if ARCH_REL_TYPE_ABS is removed ?
> >>
> >> All ARCH_REL_TYPE_ABS relocation types can be removed. As explained, t=
he
> >> real intention is to check no dynamic relocation, and this is done by
> >> the new
>
> Well, there was a typo in my question, I wanted to ask 'why', not 'which'=
.
>
> >>
> >>     cmd_vdso_check =3D if $(READELF) -rW $@ | grep -v _NONE | grep -q =
"R_\w*_"; \
> >>
> >> in this patch.
> >>
> >> grep -v _NONE is to work around some GNU ld ports (and likely older re=
leases
> >> of some ports even if their latest versions are fixed) which produce
> >> unneeded R_*_NONE dynamic relocations.
> >
> > Ping :)
>
> Ok, that seems to work on powerpc.
>
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Thanks. Can a maintainer pick up this commit?
