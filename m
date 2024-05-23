Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4C08D5553
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 00:24:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=permerror header.d=gmail.com header.i=@gmail.com header.a=rsa-sha1 header.s=20230601 header.b=FJULkE0Y;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vr14w3nGjz3dTx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 08:24:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FJULkE0Y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com; envelope-from=pvkumar5749404@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vlbbf4cWXz3vgg
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 May 2024 04:02:04 +1000 (AEST)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-57851af3d10so357a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 May 2024 11:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716487313; x=1717092113; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hAmXocRkIx1PH2lT0cYBRu4GpiG/zqum3FJI9WN36SY=;
        b=FJULkE0YsjMoOTsIRB6QoxB4C5TxNy86tJ8Q0ovrYTqOljm8qmGkrVrcMVFqbWxg9k
         z6fEczLBHStpnV8PTwRl/ixODiyRkTBjlomhWGFucy4HTMb6bgaZ2ms/6UuZ2uq8pWCE
         4iq1N3/7kNyi4IX8NDuVBgmgOyP21BgW7sLb2RuR5ST88ue5pjgNovgsIfYVuT71Rq/w
         Wu6SaMZSEI1/cn4aXD2YWFKU+u8dMspa+8WkYiNljLwwf8k7dnMktpRwxtqpYf5+47JZ
         aCtHpKqavSAY0GCMYNPal5X/eETKVPZFBGT2p+PPfORz2+IPEs8pQjiNgkx2uvaDA7Vc
         mf2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716487313; x=1717092113;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hAmXocRkIx1PH2lT0cYBRu4GpiG/zqum3FJI9WN36SY=;
        b=rIWLFKpxEDlXQ4BeTioAfkdqmqOe0dF+PyeTxeJSIiemZK6wnOEP2bRzTOdVWddvp7
         InrH7Ns6oR81qiIdeUbec57e/zT6EhEN4RpCZ3yrHKhr6INF6Fo4LQOedt3MNPZ3qYmi
         wHtfkc3dcwWZGMqnmIGmL4igCQ5Hv/xOSJU9ly4Nk6zNZDBlecS8kNHRQRbfzfQjDYy3
         MCAVu6LGsTySf1NhGRoMsjpOAUFIwExDf23PF2zC3PikedWEWv2olbtMgFO8vANjBSkC
         PDPzTeLdDbI105L2xld/drF7AqXrNmITTYzm4P5Rc6PkX68PWEuPnIJ/x4ktuAmNGHG6
         VtkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbpfiIl3tkdNM3gMC90V5UPSUXBrAfjgV2wgCwC7aOEyhE2oZBLptAC2bU9IL1b3w1ZWgRLFMy/vxd/bcU9SZQON/9bfvQMbolpaPWBg==
X-Gm-Message-State: AOJu0YxGN6L72F38BBLw2KUAfwO3Selj+f9z53gYYGMBZNXXsrbXg8nV
	QbKnlUFTMxmAyzeGKmzLlaZpwENCniHxpVcV7s6Io/pFRNiwrz146HPOzT/TpnkfKKxb6sf0Chp
	mfX0Xy3fTMNAsgP/0vErT+P3n364=
X-Google-Smtp-Source: AGHT+IHGF0RBU6YdvZb1CDrHGJK3LLHbM9I07lFJkH8DJd1cswIT/hez7w8J0rcgYRoEJhJSjZhFDgFOn+Di3tiQZ4c=
X-Received: by 2002:a50:ccc2:0:b0:573:1ebd:d670 with SMTP id
 4fb4d7f45d1cf-5785190fc49mr28765a12.3.1716487313413; Thu, 23 May 2024
 11:01:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240522194250.1165568-1-pvkumar5749404@gmail.com> <87h6eo3h4i.fsf@mail.lhotse>
In-Reply-To: <87h6eo3h4i.fsf@mail.lhotse>
From: prabhav kumar <pvkumar5749404@gmail.com>
Date: Thu, 23 May 2024 23:31:40 +0530
Message-ID: <CAH8oh8UP=U11XJWoDWf2wRb08PZk0LuCiYMygWSmcYtZ3Yh3mA@mail.gmail.com>
Subject: Re: [PATCH next] arch: powerpc: platforms: Remove unnecessary call to of_node_get
To: Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 31 May 2024 08:19:55 +1000
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
Cc: javier.carrasco.cruz@gmail.com, linux-kernel@vger.kernel.org, julia.lawall@inria.fr, npiggin@gmail.com, skhan@linuxfoundation.org, naveen.n.rao@linux.ibm.com, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 23, 2024 at 4:55=E2=80=AFPM Michael Ellerman <mpe@ellerman.id.a=
u> wrote:
>
> Prabhav Kumar Vaish <pvkumar5749404@gmail.com> writes:
> > `dev->of_node` has a pointer to device node, of_node_get call seems
> > unnecessary.
>
> Sorry but it is necessary.
>
> > Signed-off-by: Prabhav Kumar Vaish <pvkumar5749404@gmail.com>
> > ---
> >  arch/powerpc/platforms/cell/iommu.c | 9 +++------
> >  1 file changed, 3 insertions(+), 6 deletions(-)
> >
> > diff --git a/arch/powerpc/platforms/cell/iommu.c b/arch/powerpc/platfor=
ms/cell/iommu.c
> > index 4cd9c0de22c2..5b794ce08689 100644
> > --- a/arch/powerpc/platforms/cell/iommu.c
> > +++ b/arch/powerpc/platforms/cell/iommu.c
> > @@ -780,14 +780,13 @@ static int __init cell_iommu_init_disabled(void)
> >  static u64 cell_iommu_get_fixed_address(struct device *dev)
> >  {
> >       u64 cpu_addr, size, best_size, dev_addr =3D OF_BAD_ADDR;
> > -     struct device_node *np;
> > +     struct device_node *np =3D dev->of_node;
> >       const u32 *ranges =3D NULL;
> >       int i, len, best, naddr, nsize, pna, range_size;
> >
> >       /* We can be called for platform devices that have no of_node */
> > -     np =3D of_node_get(dev->of_node);
> >       if (!np)
> > -             goto out;
> > +             return dev_addr;
> >
> >       while (1) {
> >               naddr =3D of_n_addr_cells(np);
>
>                 nsize =3D of_n_size_cells(np);
>                 np =3D of_get_next_parent(np);
>                 if (!np)
>                         break;
>
> of_get_next_parent() drops the reference of the node passed to it (np).
>
> So if you actually tested your patch you should see a recount underflow.
>
Thanks, I will check this out once again
Prabhav
> cheers
