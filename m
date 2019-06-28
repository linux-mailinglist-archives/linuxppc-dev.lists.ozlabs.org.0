Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 61EE059706
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 11:13:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Zrdk1w3xzDqjp
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 19:12:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::c41; helo=mail-yw1-xc41.google.com;
 envelope-from=huangfq.daxian@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="StQri7Ff"; 
 dkim-atps=neutral
Received: from mail-yw1-xc41.google.com (mail-yw1-xc41.google.com
 [IPv6:2607:f8b0:4864:20::c41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Zrbv5Mj3zDqW1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2019 19:11:23 +1000 (AEST)
Received: by mail-yw1-xc41.google.com with SMTP id u141so615350ywe.4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2019 02:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NYW6PlEeaH367Jvr1ZMSoo3Aj5m51ktezngndfggtvY=;
 b=StQri7FfBnbBGEumveJwe5nkZAxrnsl671ui5e4oGfnTsl6m3afqK8KoJktb7l92/5
 npAV5CxaY7ELNtmAqoi55qQvXqnPFo4n9uX1BUNUb4t/dwYtyeQ/M7EXSrB/v0zRegJE
 P8e0j9feRAtEl3LJ8zHZ7pplU8UWCoy5zEZKLE3lZFonv0QcEwAQCmBlTUpcPzCpORaU
 KWr3K/480ZFGenmaWVLmNgEVOZh9JAXlLCQJS/VVNfNlmf9I31Ygk4UJv7rV/7N3txa1
 fb3GUv4xRMJn7E6lc58vZ0lrTIQBrPETcl9F7RauB7UNsjwvdYHz6nVtH4zpR7o3zpzr
 JYQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NYW6PlEeaH367Jvr1ZMSoo3Aj5m51ktezngndfggtvY=;
 b=Aop5BlQAcL1WlIonaHKmW190Eokjh8CkDN6E/FNQI11elKSX8LXjkWhsVdmHYjVq5y
 LaaDGBkZdzt4TLaZJeavueK0Nj1Dti/uxPu3LOXLGObPjT6lQ7gXuWUPOhw7Z9KPWNkm
 wF4oiENPVlnnQ9fv+omCoH5hu6VyC4H2Wv6K1VCn9lBRPL9DR1ZfbT5vJgdT3+G7PGtn
 9e1tnFpzokOnKld04st/SE1gOjXHARL8FjIZPkvleKS6QnBhwJ7REu1cZgD9ShoVUutY
 2BJecMNus2rIzym63pFibr80t8RNj1K+HwUDzgaKoaG5KYPnaE6wEHcZ+DazSVGHm4jZ
 amRA==
X-Gm-Message-State: APjAAAVONcR2q2qe2NIDnPYXmBfoTkfvjolIqx45V+h5AauBHPZl4l20
 uWWPQTfw5g5V4iRKw8KJ5yYllPOLy4YqBfjH8yY=
X-Google-Smtp-Source: APXvYqwdZqvPFf/v+xf0c8m2QQzjwkm9pBnQirbxjOXTyW1AetvGjdJMH0+2ZUJRnpOn1unVXGCt7KHq84C5BQbqQa4=
X-Received: by 2002:a0d:e1d7:: with SMTP id k206mr5230972ywe.229.1561713079518; 
 Fri, 28 Jun 2019 02:11:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190628025055.16242-1-huangfq.daxian@gmail.com>
 <83108dee-72f7-e56f-95f6-26162c9a0ccc@c-s.fr>
In-Reply-To: <83108dee-72f7-e56f-95f6-26162c9a0ccc@c-s.fr>
From: Fuqian Huang <huangfq.daxian@gmail.com>
Date: Fri, 28 Jun 2019 17:11:08 +0800
Message-ID: <CABXRUiT6jSP2xL9JyqngS9KBx_=fZ13x0UGGFPnQPrfh-_N5xQ@mail.gmail.com>
Subject: Re: [PATCH v2 27/27] sound: ppc: remove unneeded memset after
 dma_alloc_coherent
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
Cc: Rob Herring <robh@kernel.org>, alsa-devel@alsa-project.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Jaroslav Kysela <perex@perex.cz>, Richard Fontana <rfontana@redhat.com>,
 Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev@lists.ozlabs.org, Allison Randal <allison@lohutok.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The merge commit log tells (dma-mapping: zero memory returned from
dma_alloc_* and deprecating the dma_zalloc_coherent).
I used this commit just want to say that dma_alloc_coherent  has
zeroed the allocated memory.
Sorry for this mistake.

Maybe this commit 518a2f1925c3("dma-mapping: zero memory returned from
dma_alloc_*") is correct.

Christophe Leroy <christophe.leroy@c-s.fr> =E6=96=BC 2019=E5=B9=B46=E6=9C=
=8828=E6=97=A5=E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=884:59=E5=AF=AB=E9=81=93=
=EF=BC=9A

>
>
>
> Le 28/06/2019 =C3=A0 04:50, Fuqian Huang a =C3=A9crit :
> > In commit af7ddd8a627c
> > ("Merge tag 'dma-mapping-4.21' of git://git.infradead.org/users/hch/dma=
-mapping"),
> > dma_alloc_coherent has already zeroed the memory.
> > So memset is not needed.
>
> You are refering to a merge commit, is that correct ?
>
> I can't see anything related in that commit, can you please pinpoint it ?
>
> As far as I can see, on powerpc the memory has always been zeroized
> (since 2005 at least).
>
> Christophe
>
> >
> > Signed-off-by: Fuqian Huang <huangfq.daxian@gmail.com>
> > ---
> >   sound/ppc/pmac.c | 1 -
> >   1 file changed, 1 deletion(-)
> >
> > diff --git a/sound/ppc/pmac.c b/sound/ppc/pmac.c
> > index 1b11e53f6a62..1ab12f4f8631 100644
> > --- a/sound/ppc/pmac.c
> > +++ b/sound/ppc/pmac.c
> > @@ -56,7 +56,6 @@ static int snd_pmac_dbdma_alloc(struct snd_pmac *chip=
, struct pmac_dbdma *rec, i
> >       if (rec->space =3D=3D NULL)
> >               return -ENOMEM;
> >       rec->size =3D size;
> > -     memset(rec->space, 0, rsize);
> >       rec->cmds =3D (void __iomem *)DBDMA_ALIGN(rec->space);
> >       rec->addr =3D rec->dma_base + (unsigned long)((char *)rec->cmds -=
 (char *)rec->space);
> >
> >
