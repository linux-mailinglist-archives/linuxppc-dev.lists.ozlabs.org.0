Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4BB5875884
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Mar 2024 21:35:30 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TztGJW9C;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TrLf856fnz3vsP
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Mar 2024 07:35:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TztGJW9C;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::133; helo=mail-lf1-x133.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tr6Bg0mTbz307y
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Mar 2024 22:14:17 +1100 (AEDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-51336ab1fb7so951552e87.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 Mar 2024 03:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709810053; x=1710414853; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2AMWp8CTIDIp4IzjSjlpXPuXredbkA06mu/mQm+MSh8=;
        b=TztGJW9CSpViv+xSL9SQgmM2wUsm57NFbCX3RxrVWpTQPz0nPu2/p9mRV4i74XXjIS
         aCW7biJ5z+voT7FKqFWCP6g1MiS5RntWsCwwBpAyhl5xmCIizyrQ1t8HdWFAFgVcu/ZY
         L14P6pbIAmOt97n+z9An9F1T8a5k85yFTlVr16/OPgZtdLNRUTD6hB7553MSwl827QI1
         /CRzGSzZN0RkI/MU1vFfUsA0Y0Fsi/v/hcBQRiQFTLi5/5nzMyyxMmNC3qerxE2Azn8a
         Ea3hsZOKFSlJ/gmPWm+39U6pyfRWFJQTR4wnw7CYZTN+JwWOzUwFXPoHLMzG7YlYCV1l
         xuhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709810053; x=1710414853;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2AMWp8CTIDIp4IzjSjlpXPuXredbkA06mu/mQm+MSh8=;
        b=ec6pX3y1ApldMRAMTaOD+S2A0Gf6eQ8VcdYSyhcgmPBom7kC8egeLh0fMfI6P3o3+Q
         O6JDABHRiTS4VTUVhLi5i5dvn8sf/TacV0ghy+YJgjy3G3Ib6EcCowi0hvn1dSK+syR/
         fvw3tKu7gQGrAqOPn7ufvvIIHFb8SvLbaJuhYJjahJoHEhbP9xpcho03PkGu00p4Vtrs
         zx7ZZrHkDCIrFJwwmejLEFSPWL+IfVB7xQh5NlhNnc8nSt6XntAU+abpbMSrBinEPJYC
         LRcnYASbqjtn88sMJJbmyQ/ahXXtUS/oPFMCmfkvMiAEe+rvaTgKtOk78ReISp1UILjR
         Qp6w==
X-Forwarded-Encrypted: i=1; AJvYcCWg0NlCE9TBtcbL4nDhtBw7LV4xODuqThAnndQXHHIli+UZ4PdupHbdYwYU0XYErQ1AQ+k94xXukbXVCFfPyFsuwELF58EFX7yx+fUOSg==
X-Gm-Message-State: AOJu0YxEU6SD8i4qoGWoGjB9odiTbJuV4t/Ft/t0LR8whD6VwnDNwwg+
	Oaa0H7rq4sq3rC9Sf/rZwbkJ+riSAKv27tKQs/ZT0j2Oegn29Zq3BwZDcfyyennc0AkoeMkEz13
	ImOYbY1W8FocphyTYqI52pYowSRk=
X-Google-Smtp-Source: AGHT+IFB//rVz7J8LQSz57QlmZWNxoI8xZk+YFkdITRdm5qY78WPwwIduSAyCkJ5szOvXqlJJTHOx3Ewfo8up7+BCpk=
X-Received: by 2002:a05:6512:3d1f:b0:513:2f96:72b5 with SMTP id
 d31-20020a0565123d1f00b005132f9672b5mr1703519lfv.33.1709810052589; Thu, 07
 Mar 2024 03:14:12 -0800 (PST)
MIME-Version: 1.0
References: <20240306080726.167338-1-herve.codina@bootlin.com>
 <20240306080726.167338-4-herve.codina@bootlin.com> <Zehrd/VgW5AnfJEu@yury-ThinkPad>
 <Zehx-v7h38TPJWwe@smile.fi.intel.com> <20240307083107.0fcd940f@bootlin.com>
In-Reply-To: <20240307083107.0fcd940f@bootlin.com>
From: Yury Norov <yury.norov@gmail.com>
Date: Thu, 7 Mar 2024 06:14:01 -0500
Message-ID: <CAAH8bW9+MiNnToZjKBz9kU0sy6ETSpGgX0CmaCdhm_6FxUya1w@mail.gmail.com>
Subject: Re: [PATCH v6 3/5] lib/bitmap: Introduce bitmap_scatter() and
 bitmap_gather() helpers
To: Herve Codina <herve.codina@bootlin.com>
Content-Type: multipart/alternative; boundary="000000000000d1723b0613102c71"
X-Mailman-Approved-At: Fri, 08 Mar 2024 07:34:53 +1100
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
Cc: Andrew Lunn <andrew@lunn.ch>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, Netdev <netdev@vger.kernel.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Eric Dumazet <edumazet@google.com>, Mark Brown <broonie@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "open list:LINUX FOR POWERPC PA SEMI PWRFICIENT" <linuxppc-dev@lists.ozlabs.org>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--000000000000d1723b0613102c71
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 7, 2024, 2:31 AM Herve Codina <herve.codina@bootlin.com> wrote:

> Hi Yury,
>
> On Wed, 6 Mar 2024 15:39:06 +0200
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
>
> > On Wed, Mar 06, 2024 at 05:11:19AM -0800, Yury Norov wrote:
> > > On Wed, Mar 06, 2024 at 09:07:19AM +0100, Herve Codina wrote:
> >
> > ...
> >
> > > Signed-off-by: Yury Norov <yury.norov@gmail.com>
> >
> > Why? Shouldn't be Acked-by?
> >
> > > Would you like to move this with the rest of the series? If so please
> > > pull my Sof-by, otherwise I can move it with bitmap-for-next.
> >
>
> A new iteration of the series is planned.
> Yury, may I add your Acked-by in the next iteration ?
>
> Best regards,
> Herv=C3=A9
>

Please scratch my sign-off and add ack.

>

--000000000000d1723b0613102c71
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, Mar 7, 2024, 2:31 AM Herve Codina &lt;<a href=
=3D"mailto:herve.codina@bootlin.com">herve.codina@bootlin.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">Hi Yury,<br>
<br>
On Wed, 6 Mar 2024 15:39:06 +0200<br>
Andy Shevchenko &lt;<a href=3D"mailto:andriy.shevchenko@linux.intel.com" ta=
rget=3D"_blank" rel=3D"noreferrer">andriy.shevchenko@linux.intel.com</a>&gt=
; wrote:<br>
<br>
&gt; On Wed, Mar 06, 2024 at 05:11:19AM -0800, Yury Norov wrote:<br>
&gt; &gt; On Wed, Mar 06, 2024 at 09:07:19AM +0100, Herve Codina wrote:=C2=
=A0 <br>
&gt; <br>
&gt; ...<br>
&gt; <br>
&gt; &gt; Signed-off-by: Yury Norov &lt;<a href=3D"mailto:yury.norov@gmail.=
com" target=3D"_blank" rel=3D"noreferrer">yury.norov@gmail.com</a>&gt;=C2=
=A0 <br>
&gt; <br>
&gt; Why? Shouldn&#39;t be Acked-by?<br>
&gt; <br>
&gt; &gt; Would you like to move this with the rest of the series? If so pl=
ease<br>
&gt; &gt; pull my Sof-by, otherwise I can move it with bitmap-for-next.=C2=
=A0 <br>
&gt; <br>
<br>
A new iteration of the series is planned.<br>
Yury, may I add your Acked-by in the next iteration ?<br>
<br>
Best regards,<br>
Herv=C3=A9<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Please scratch my sign-off and add ack.=C2=A0</div><div dir=3D"au=
to"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--000000000000d1723b0613102c71--
