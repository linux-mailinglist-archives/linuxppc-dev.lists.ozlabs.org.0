Return-Path: <linuxppc-dev+bounces-1628-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8FFC987926
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Sep 2024 20:37:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XF2QT2wtxz2xyG;
	Fri, 27 Sep 2024 04:37:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::834"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727375857;
	cv=none; b=ZB9Blt/dxaX0eqaw7cSLT3lGvxsbPaV4xILN3ul37d0rgb8r7edBZlTpIOeWIdboZFQj+Psfh9YTElIoqqRVkrtyMLcsS+CHQy9BVAwzEKchGXPrDNP2WM/mUZLGsYR4+/sewI+0JCvWazWr1+et0Kr3/EtMQQFPVKjfx+dqEliM9eyrCItIctx34q5VoeBInMJPNHmKXXUduGiLi9g19HHFcFJmakXv7omj1QS2HRh0JQNF7501p04TwsTwrjDCKxsol3qOD+8UXcX8LndaMW2E6AwCfHR4lFYUf/qPhTtLJnts5cwT167dmvV7Q4WzOGcJstkMBo7cSWgenDLE6g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727375857; c=relaxed/relaxed;
	bh=ajD7HYLuvBx8/17wWfxPAMem46iIj42I6Vl0LQ86WrE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YmnU88Da2/q9foG+l5zWXKhoTjy7ehfwX0oYE4b22y75wDiYm+9V/DWDlQ4OsBmH+8+HOOY0KMv1+ohulLjiNHnrHIQZuj3kJLpFp++rAIbETfbwiE1YtQw4A7fP6CuOnu6T8gekayx0EtoPBc0tkiMY5R5DWt22mW30EzzPA+Gtpu2AvGfB0nLc+Y46EEE8t3MutzFZUObcvtRBUmyJm98yfP/eMNdF2dRit8K6aR0n6LqGDyzJ5nKXSilHhpDJ2z8rNvZzZT/eRP8gr/TatP7wMd06ocYlAfSk83eObAFwvSi0LfV4PZP8VWPZrfUtCR7xJiwvNuiNaRMK1nn7Ug==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=pibQDCcb; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::834; helo=mail-qt1-x834.google.com; envelope-from=samitolvanen@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=pibQDCcb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::834; helo=mail-qt1-x834.google.com; envelope-from=samitolvanen@google.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XF2QS3bm4z2xFn
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Sep 2024 04:37:35 +1000 (AEST)
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-4582a5b495cso46251cf.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Sep 2024 11:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727375851; x=1727980651; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ajD7HYLuvBx8/17wWfxPAMem46iIj42I6Vl0LQ86WrE=;
        b=pibQDCcb9H8WALvsm5qBaJYz1F30K425Mq3GFujy++FiqKzOnnidZUEaz5RjKGnO4X
         wLnCWDKap39Fz9ZzGuYM9/ey1QoqqTjVGjjQgdXr6cS53BKFFgmRUsRg+2T9ZgxVKoCE
         lufrOhkiRggM82HydL5pDeFx/Cooio3sZ1v2ZYZbRew4B8/G1HWZVsLzTrICi5t7KOi+
         g8Qka9z8T2T2H5NA08eKTI1OfM2ZKV/GHiuT5aijMznkbuvzc0lrypX16qwpR6ovXyhg
         q63h/41OTX1aHpIgYulcDi4KTN1znDlvRlc6wZClt/koH4V9hDHBARFYXxu/oosiF4qp
         0vlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727375851; x=1727980651;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ajD7HYLuvBx8/17wWfxPAMem46iIj42I6Vl0LQ86WrE=;
        b=ftkt2YM3yiTOEySj3rM+EHCDzp9wlb301vHV/mZq+chQbGGYTkwxJQE7R6WPeQYMVj
         smCU3QzX05ae7KaWVG9pPVLvcOaki4Zh6Sgru6V/5Ql0XHcpbCZSQ4akF6yRl4gZ+O75
         pVT+oVkcMzG4d7c4MvdReLyLH1FlNaAjSjs1yN4biXG3vCNkzuS0frS+nBljRSNCkZnj
         Zz8OEtYB4p5XoB+okxB8FAm5OKpLu3fxzhSbi0ry8kytfRiRPc5m4nCrrMboE/plRafi
         v3cNZbPf+eChzLkmdPHD3t8J2JYWuWNWqjui4fnW4EzHyEYaymgekhGLby2yvlNjAO/Y
         Hpag==
X-Forwarded-Encrypted: i=1; AJvYcCXsMZYtW++4mTfX1i+5xhc18l+SFpsNZHzhFzNW2uZyffe9QgP6HN08zOSFty6fYXTzaipY875JG9Z3waQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwEASDqZJDbd2wK8q/A6ayk92b+7IdNPIXvF7tbxMdRWiy+VyVq
	T2BFnpJsrX40nX2kkDtF5OrP570dtbXW0RSBTV121YOb2sKH9dQc/RVZaSAZuyW5nPhiLfPwIHg
	QP8RP4sksWC+gG5WHClVyVnzWGMJ9VZq+285s
X-Google-Smtp-Source: AGHT+IE5luy5UBQ185BJWoPqDDM1TnLd4PCqV2DLnc+LIC9QgkGZbzUPxUEZLm0+v/dLWn/IHMzUNmnXBY+ab/kjVpA=
X-Received: by 2002:ac8:4904:0:b0:456:7d9f:2af8 with SMTP id
 d75a77b69052e-45ca03bd89bmr245591cf.7.1727375850392; Thu, 26 Sep 2024
 11:37:30 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20240925233854.90072-1-mmaurer@google.com> <20240925233854.90072-15-mmaurer@google.com>
 <b31c74c1-0c19-4bc4-b1af-db817977748d@csgroup.eu>
In-Reply-To: <b31c74c1-0c19-4bc4-b1af-db817977748d@csgroup.eu>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 26 Sep 2024 11:36:51 -0700
Message-ID: <CABCJKudyC_EzRTtkJSSQqQhLdUk_9tYBtoq62tjmghFyi8omWg@mail.gmail.com>
Subject: Re: [PATCH v5 14/16] modules: Support extended MODVERSIONS info
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Matthew Maurer <mmaurer@google.com>, masahiroy@kernel.org, ndesaulniers@google.com, 
	ojeda@kernel.org, gary@garyguo.net, mcgrof@kernel.org, 
	Michael Ellerman <mpe@ellerman.id.au>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Benjamin Gray <bgray@linux.ibm.com>, Naveen N Rao <naveen@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, neal@gompa.dev, 
	marcan@marcan.st, j@jannau.net, asahi@lists.linux.dev, 
	linux-modules@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 26, 2024 at 5:22=E2=80=AFAM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 26/09/2024 =C3=A0 01:38, Matthew Maurer a =C3=A9crit :
> > Adds a new format for MODVERSIONS which stores each field in a separate
> > ELF section. This initially adds support for variable length names, but
> > could later be used to add additional fields to MODVERSIONS in a
> > backwards compatible way if needed. Any new fields will be ignored by
> > old user tooling, unlike the current format where user tooling cannot
> > tolerate adjustments to the format (for example making the name field
> > longer).
> >
> > Since PPC munges its version records to strip leading dots, we reproduc=
e
> > the munging for the new format. Other architectures do not appear to
> > have architecture-specific usage of this information.
> >
> > Signed-off-by: Matthew Maurer <mmaurer@google.com>
> > ---
> >   arch/powerpc/kernel/module_64.c | 23 ++++++++-
> >   kernel/module/internal.h        | 11 ++++
> >   kernel/module/main.c            | 92 ++++++++++++++++++++++++++++++--=
-
> >   kernel/module/version.c         | 45 ++++++++++++++++
> >   4 files changed, 161 insertions(+), 10 deletions(-)
> >
> > diff --git a/arch/powerpc/kernel/module_64.c b/arch/powerpc/kernel/modu=
le_64.c
> > index e9bab599d0c2..4e7b156dd8b2 100644
> > --- a/arch/powerpc/kernel/module_64.c
> > +++ b/arch/powerpc/kernel/module_64.c
> > @@ -355,6 +355,23 @@ static void dedotify_versions(struct modversion_in=
fo *vers,
> >               }
> >   }
> >
> > +static void dedotify_ext_version_names(char *str_seq, unsigned long si=
ze)
> > +{
> > +     unsigned long out =3D 0;
> > +     unsigned long in;
> > +     char last =3D '\0';
> > +
> > +     for (in =3D 0; in < size; in++) {
> > +             /* Skip one leading dot */
> > +             if (last =3D=3D '\0' && str_seq[in] =3D=3D '.')
> > +                     in++;
> > +             last =3D str_seq[in];
> > +             str_seq[out++] =3D last;
> > +     }
>
> Why do you need a loop here ?
>
> Can't you just do something like:
>
>         if (str_seq[0] =3D=3D '.')
>                 memmove(str_seq, str_seq + 1, size);

I initially had the same thought, but it's because this is is a
sequence of multiple null-terminated strings, and we need to dedotify
all of them, not just the first one. Here's an example:

https://godbolt.org/z/avMGnd48M

> > +     /* Zero the trailing portion of the names table for robustness */
> > +     memset(&str_seq[out], 0, size - out);
>
> This seems unneeded.

Strictly speaking it shouldn't be needed, but I think it's still good
hygiene to not leave another null-terminated fragment at the end.

Sami

