Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F09247A5A1E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Sep 2023 08:44:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RqXG054vMz3cQ4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Sep 2023 16:44:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.128.182; helo=mail-yw1-f182.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RqXFV6mr5z2yW6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Sep 2023 16:44:14 +1000 (AEST)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-59c0442a359so43199637b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Sep 2023 23:44:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695105851; x=1695710651;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kAmWc6PGNbz/v7P4Pzb+X6jxKjTax8yaPXnsgZKZYbo=;
        b=nlqhLdvxKbcnitghaKgThcZtGBlOnLfR9vsmd63ohR7rsIr805VPM7OsbPchvnqhw3
         CksQybsijOdoO7NAaHLIzFDN5nMDezyfVnAYOHx21V67MThpQh4aeoanRgVDGAZjtneM
         0RNH41z1lnciYFH70klGW57sN/Po5SVMRZd3FrbYBWTg9MI7xPqT4iIwKvEnHEIwaZmI
         P5fazuiBl3FAukyXGKHT+R+jzOS0/sHjWPtY3MIy3PmyTo0S+k0TouCe3lNR5bSqjgeB
         /ZbR7czLQi7NLd0H8LkftG3kYx8O4n1GRzsSbaDC/5SKpeY9GXOmCV5l8Ght25S+A+g1
         KTeQ==
X-Gm-Message-State: AOJu0YysxlDS+qoYnKxwOcB4y2qETcTWMY+XrLXI9bHPL+KpEHEgKdd0
	D4D/KyJcq0vfP//BOPl1Qm/76IW8999cIw==
X-Google-Smtp-Source: AGHT+IGCigN5e4NQ3ZIo2yonkqxIq4Ugu5qSnhhfpwmHbFY1nFQoxsfnu3UBl93ZzST7KxkDj0JQqw==
X-Received: by 2002:a81:7b88:0:b0:59b:54b5:7d66 with SMTP id w130-20020a817b88000000b0059b54b57d66mr12701831ywc.34.1695105851261;
        Mon, 18 Sep 2023 23:44:11 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id f128-20020a0ddc86000000b005929fd6a6c7sm3046607ywe.41.2023.09.18.23.44.10
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Sep 2023 23:44:10 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-59bbdb435bfso52614897b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Sep 2023 23:44:10 -0700 (PDT)
X-Received: by 2002:a81:d352:0:b0:59b:cfe1:bcf1 with SMTP id
 d18-20020a81d352000000b0059bcfe1bcf1mr10748173ywl.44.1695105850445; Mon, 18
 Sep 2023 23:44:10 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1695031668.git.geert@linux-m68k.org> <d91725ff1ed5d4b6ba42474e2ebfeebe711cba23.1695031668.git.geert@linux-m68k.org>
 <87h6nqlxli.fsf@mail.lhotse>
In-Reply-To: <87h6nqlxli.fsf@mail.lhotse>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 19 Sep 2023 08:43:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW6=wnOjT7qG4tHvc5X4JAJkkHMnVDsQ-dKM6i3FKyWWw@mail.gmail.com>
Message-ID: <CAMuHMdW6=wnOjT7qG4tHvc5X4JAJkkHMnVDsQ-dKM6i3FKyWWw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] powerpc: Replace GPL 2.0+ README.legal boilerplate
 with SPDX
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, Nicholas Piggin <npiggin@gmail.com>, linux-spdx@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org, Greg Ungerer <gerg@linux-m68k.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael,

On Tue, Sep 19, 2023 at 4:13=E2=80=AFAM Michael Ellerman <mpe@ellerman.id.a=
u> wrote:
> Geert Uytterhoeven <geert@linux-m68k.org> writes:
> > Upstream Linux never had a "README.legal" file, but it was present
> > in early source releases of Linux/m68k.  It contained a simple copyrigh=
t
> > notice and a link to a version of the "COPYING" file that predated the
> > addition of the "only valid GPL version is v2" clause.
> >
> > Get rid of the references to non-existent files by replacing the
> > boilerplate with SPDX license identifiers.
> >
> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
>
> LGTM.
>
> Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

Can you please take it through the PPC tree?
Thanks!

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
