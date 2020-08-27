Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7160B253D05
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 07:01:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BcVvM1prwzDqd0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 15:01:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::244;
 helo=mail-oi1-x244.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=D8T4bFnw; dkim-atps=neutral
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BcVsf2ndczDqKb
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Aug 2020 15:00:22 +1000 (AEST)
Received: by mail-oi1-x244.google.com with SMTP id v13so3580147oiv.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Aug 2020 22:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=XuQkN4EHtLe05q9W03mgSJgZys0f/ur9WGQ4+ZhwYu8=;
 b=D8T4bFnwCA8jGHToDBwLBI2dWEYm6nZ33+sx7iYMx/BKlvm0YKlFDbFzU74kYgXPHk
 533XaXoDXcxN7mGbYGiCaRxZpUkzXDR9OxOGNH5Y+mrmbL5LciOmO4RG0+YFbAv9tA4r
 TQu4fdDsFaHwUWAHS/fXmdg94SqF45eRrsNvIqWNrTI7gSySR4Lixhd/oU2INOVLIPt6
 FqlrycvseZvThRs6tNbwbOpXvdsfWKD+EB1CI0ytAEn4FZR+v1sVK4ddwnmO8Mv9kIas
 QPs39mfjyXGbuNREYCS7VHOODBDHgjQfrfA6pPo5KBaJa1ihfNuZ8pXX7AINBPy3OZ/F
 bwrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XuQkN4EHtLe05q9W03mgSJgZys0f/ur9WGQ4+ZhwYu8=;
 b=JNf9Iyk2TTgdIe85I6krWbI+YG3O2gVnPaSXo02m198OQHxdWQvmfa0Et2u1h1R4Vx
 ZSpdXC5dzYFJzre7KzdqoLEDi84YvmsVfuid7dpcmIEuqlTABU8B0lEUuYPZe3YnA0VX
 1O3NsCfe+IWCels/j/Ox5VeqTMrWseNGbrYPWTpHiY617K35EcCnGJsELfvbk6sOYL//
 0pt1vcCpdifXbz5h+/E6fjaZBq5kkKsWyI+/iBB02iHb6D19NqgCrUFS/0T+K0geMiSc
 xnYfes4gztuUdNSXNp0qy/h8bqGLPPaMhNhd9UuC71HEzPYtXExfC7aEz6oVCcjVutBx
 VqYg==
X-Gm-Message-State: AOAM531caXARqvIWyBaQNciIhGNVcszWzYLmN2IKhgy+vwS+er0B9cyd
 EmbVgPBPSRXZg80YtvpoRw9N3tX6JX5Wj0+ZkJKj1akQ
X-Google-Smtp-Source: ABdhPJypE1mOeP0XmgSdMK/hpuh/Nmm5qSym2NpVbFdgYREAT8ea7Tf6cWEF35hYXhh2kMBDrfTbbh7wGMuNV7f+JL0=
X-Received: by 2002:aca:4907:: with SMTP id w7mr1861378oia.12.1598504418218;
 Wed, 26 Aug 2020 22:00:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200827040556.1783-1-jniethe5@gmail.com>
 <d71a27b8-f12d-7485-23ec-99d36ff1b0ea@csgroup.eu>
In-Reply-To: <d71a27b8-f12d-7485-23ec-99d36ff1b0ea@csgroup.eu>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Thu, 27 Aug 2020 15:00:06 +1000
Message-ID: <CACzsE9o4vH39BhSqr_NTCFYbAdniLGh2LWkZ-nUQnTQ-jvT_pw@mail.gmail.com>
Subject: Re: [PATCH v2] powerpc: Update documentation of ISA versions for
 Power10
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 27, 2020 at 2:49 PM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 27/08/2020 =C3=A0 06:05, Jordan Niethe a =C3=A9crit :
> > Update the CPU to ISA Version Mapping document to include Power10 and
> > ISA v3.1.
>
> Maybe Documentation/powerpc/cpu_families.rst should be updated as well.
Good idea it still needs Power9 too.
>
> Christophe
>
>
>
> >
> > Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> > ---
> > v2: Transactional Memory =3D No
> > ---
> >   Documentation/powerpc/isa-versions.rst | 4 ++++
> >   1 file changed, 4 insertions(+)
> >
> > diff --git a/Documentation/powerpc/isa-versions.rst b/Documentation/pow=
erpc/isa-versions.rst
> > index a363d8c1603c..3873bbba183a 100644
> > --- a/Documentation/powerpc/isa-versions.rst
> > +++ b/Documentation/powerpc/isa-versions.rst
> > @@ -7,6 +7,7 @@ Mapping of some CPU versions to relevant ISA versions.
> >   =3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> >   CPU       Architecture version
> >   =3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> > +Power10   Power ISA v3.1
> >   Power9    Power ISA v3.0B
> >   Power8    Power ISA v2.07
> >   Power7    Power ISA v2.06
> > @@ -32,6 +33,7 @@ Key Features
> >   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> >   CPU        VMX (aka. Altivec)
> >   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> > +Power10    Yes
> >   Power9     Yes
> >   Power8     Yes
> >   Power7     Yes
> > @@ -47,6 +49,7 @@ PPC970     Yes
> >   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D
> >   CPU        VSX
> >   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D
> > +Power10    Yes
> >   Power9     Yes
> >   Power8     Yes
> >   Power7     Yes
> > @@ -62,6 +65,7 @@ PPC970     No
> >   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >   CPU        Transactional Memory
> >   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +Power10    No  (* see Power ISA v3.1 Appendix A.)
> >   Power9     Yes (* see transactional_memory.txt)
> >   Power8     Yes
> >   Power7     No
> >
