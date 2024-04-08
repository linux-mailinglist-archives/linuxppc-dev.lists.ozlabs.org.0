Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C5389BA60
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Apr 2024 10:33:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VCj6N5WX5z3vbc
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Apr 2024 18:33:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.219.176; helo=mail-yb1-f176.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VCj5w0Rxsz3dJ0
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Apr 2024 18:33:06 +1000 (AEST)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dbed179f0faso3725914276.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Apr 2024 01:33:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712565183; x=1713169983;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3bnKadFFQKfZtqlQN85uKX1QN2funm0jGKmok0O/bf4=;
        b=kSfo1934hQ5WMvRaxMNM3bvvotuo/3aSz3GHxCaG04K5FJknlxy5B30TTVYk/A+73T
         +8QdhbcK8t3ntSqIFmrjP7DBazgbOJQmnhT2Vt45qO/N+KuyBdo3SszzTc6go4ZOIM/B
         tD+oOeZJKX+WqDt+rflVA6tBJTvL/GvaeWCYYjHonRDf6cUhYHoXjuhiMsbhpgugWyK2
         X6t5EFU9bFywfutztbCgxpKCNh8CiyANmMyoyKmjJLps+VRm+XvV2TX06zTvluRmG31S
         NgBEZZexQCE1/ujBna5EaBRNx3rUJNS+DTiWPBixwLaUkHdIU8zr/70hhVCRBbrkXEmi
         CpLw==
X-Forwarded-Encrypted: i=1; AJvYcCXlvoLWcxaNaK+kVHZSdX5ecMdNhvrjAB8tTICfIZxwa+tXj3WInCxRU0VCVkGUmcADn4aWfdI4PHRJIsEHJiHaTkVsVzQ+cf0zek/jhw==
X-Gm-Message-State: AOJu0YyevEWPjZaEp81oCKI2MPjmB+D7B6sTT5hvICsOr050meoepvsE
	fYgXeHO7YClxLMoo/2TLgrsWTQ4yyMKSjwgY9MAi3JEnRKGI7g+vcxqao6rATB0=
X-Google-Smtp-Source: AGHT+IGz7dI3psovG3IGbJNTjnsMeP0GxyeiTUEa92Xi/HzwxRfTsCk3gB1NjDOVNPokPdVM/NK4EA==
X-Received: by 2002:a25:b322:0:b0:dd6:7c00:5cdb with SMTP id l34-20020a25b322000000b00dd67c005cdbmr5991920ybj.14.1712565182929;
        Mon, 08 Apr 2024 01:33:02 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id f123-20020a255181000000b00dcdba3056e9sm1334659ybb.25.2024.04.08.01.33.02
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Apr 2024 01:33:02 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6154a3df493so35617157b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Apr 2024 01:33:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXb9A6fvsZTCF7MRjqaizuj5On+OcDZrxFYLhNXZIYXhEAdZfbMdkE1fhaLBhFLLDYBfczdl/cAjo4JpQJa1Rc33VEmTO3ztgiMWDbnjw==
X-Received: by 2002:a25:ab2f:0:b0:ddd:7a62:59b0 with SMTP id
 u44-20020a25ab2f000000b00ddd7a6259b0mr5993867ybi.15.1712565182435; Mon, 08
 Apr 2024 01:33:02 -0700 (PDT)
MIME-Version: 1.0
References: <dda2187e128bfaaf092351812e4538e2e41c17f6.1711599093.git.fthain@linux-m68k.org>
 <Zg3YZN-QupyVaTPm@surfacebook.localdomain> <8f234f26-d5e3-66ed-ab0c-86d3c9852b4a@linux-m68k.org>
 <CAHp75VcxLez_Nm0N8=gpWd7SKGd9JF2QXEOOB_gvX3ZtTzj6HQ@mail.gmail.com>
 <87y19s7bk6.fsf@mail.lhotse> <4bddf8ec-97f1-07f6-9c0a-523c102c0a1b@linux-m68k.org>
 <87v84sbexv.fsf@mail.lhotse> <b1553164-18db-4f5c-b1a5-28a393d64941@kernel.org>
 <3adf561b-2d6b-47be-8fca-2a26ee738670@kernel.org>
In-Reply-To: <3adf561b-2d6b-47be-8fca-2a26ee738670@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 8 Apr 2024 10:32:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX+sZCUs7a-z07y-27t7RFqRg6y8M98XqExLy0qU=aVOA@mail.gmail.com>
Message-ID: <CAMuHMdX+sZCUs7a-z07y-27t7RFqRg6y8M98XqExLy0qU=aVOA@mail.gmail.com>
Subject: Re: [PATCH] serial/pmac_zilog: Remove flawed mitigation for rx irq flood
To: Jiri Slaby <jirislaby@kernel.org>
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
Cc: Finn Thain <fthain@linux-m68k.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-m68k@lists.linux-m68k.org, Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, linux-serial@vger.kernel.org, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Jiri,

On Mon, Apr 8, 2024 at 7:37=E2=80=AFAM Jiri Slaby <jirislaby@kernel.org> wr=
ote:
> On 08. 04. 24, 7:32, Jiri Slaby wrote:
> > On 08. 04. 24, 7:29, Michael Ellerman wrote:
> >> Many maintainers won't drop Cc: tags if they are there in the submitte=
d
> >> patch. So I agree with Andy that we should encourage folks not to add
> >> them in the first place.
> >
> > But fix the docs first.
> >
> > I am personally not biased to any variant (as in: I don't care where CC=
s
> > live in a patch).
>
> OTOH, as a submitter, it's a major PITA to carry CCs in notes (to have
> those under the --- line). Esp. when I have patches in a queue for years.

(Good to discover I'm not the only one carrying Very Old Patches ;-)

> How do people handle that? (Like rebases on current kernel.)

Keep them under the --- line in the actual commits, just like your
changelog? All of that is retained when rebasing.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
