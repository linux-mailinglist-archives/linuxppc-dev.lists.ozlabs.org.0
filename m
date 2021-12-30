Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBD548207C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Dec 2021 23:06:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JQ2Rc3P7Cz3cH2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Dec 2021 09:06:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=kD2lQpGh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a;
 helo=mail-pj1-x102a.google.com; envelope-from=bigunclemax@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=kD2lQpGh; dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JPpsh0ZZsz2xsM
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Dec 2021 00:24:54 +1100 (AEDT)
Received: by mail-pj1-x102a.google.com with SMTP id
 lr15-20020a17090b4b8f00b001b19671cbebso23144623pjb.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Dec 2021 05:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DrdyCEITuBfrPPlsff1ZbU6OYvy1z21+/7ISziWGrAU=;
 b=kD2lQpGhXH0KbRhiYpCVQcXlCAvhq+JmvxyHvaA6Ot1QECxQY0JtlPjLI4fy22AWRT
 h8NFgpImFTdjE81AtOf3T55XcldBvNAUNtdeDPLfaoxHeuYsN/N4DJxz3tj8ESaCmTHb
 FdZI+MYObRL70dBGGp0MMREyQwBI0wSMhoxfvuDbwYzFfBx5GIvLs2J53Lan7S1Dztq9
 pxCdX8lKtSIkHTVUW/hqxcnSmEOP3aH+5wtgTzMe9E3WRPdnGIqhbrxDoSyRI+26iupK
 y+dGBXYq4zcGtDcBiaDNuDswdSjUOJZp50IMkJp5ibg7P+GZr+Fv5wtC45OFcxBmEzyo
 4d2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DrdyCEITuBfrPPlsff1ZbU6OYvy1z21+/7ISziWGrAU=;
 b=EfovNYfjIRC45RvRhtfZ0x6nYJ7/RNSMyZCgQQQKR0eucl2C8PgsOEYSQaEYk6tqSy
 B5hjUP6dbbR+q6thlA6uVaNkYfPQ73+wrnE2O96HYhEh75Pp4GDgSSr8ltdUIkWzRxhT
 ybvi1P+qBdUilCXdnmoBf/HJmlUqPe7clG/4aMzPqsGniGy9lDCJDw3eTDKIJy2iF18K
 6Ntt8oloFk8asxZkD1AkEeQFi/TCyaXEdCQ3JdHAIgSFw2L2BAnqBQbBScXl6pDkrWWK
 Oegz7H7T7VnmanbakC3utzspC6/0Ht2bQY+tco+gR2tc4zmdwIBd37oXjr1SInvm6tD3
 fgZg==
X-Gm-Message-State: AOAM533/Yi0cSyqT84GdzHoL+/Ovzx2Axa5eAGmyGejTb2XdlrhzkLgk
 dKhrnJBmf7dSpd56IkPl/33+drnlUj3oEqe1n0M=
X-Google-Smtp-Source: ABdhPJx8rWayEj43v1O5ToE9CsJ4lCUF8p7Uc44GQprKFqwpf9DhRKcbnXBAZ1lT0A0J9ik43AAXmVodc1p7KRtfS68=
X-Received: by 2002:a17:902:dac9:b0:148:a2e7:fb1a with SMTP id
 q9-20020a170902dac900b00148a2e7fb1amr31482350plx.91.1640870689547; Thu, 30
 Dec 2021 05:24:49 -0800 (PST)
MIME-Version: 1.0
References: <20211230104329.677138-1-bigunclemax@gmail.com>
 <20211230130003.pzwzac5xttnnksz6@skbuf>
In-Reply-To: <20211230130003.pzwzac5xttnnksz6@skbuf>
From: Maxim Kiselev <bigunclemax@gmail.com>
Date: Thu, 30 Dec 2021 16:24:38 +0300
Message-ID: <CALHCpMg8ZeQUcbA1EeUpXMcay0u=QZfnZZGpPb_HAXJeHoUQvQ@mail.gmail.com>
Subject: Re: [PATCH] powerpc: dts: t1040rdb: fix ports names for Seville
 Ethernet switch
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Content-Type: multipart/alternative; boundary="00000000000092a97505d45cfae4"
X-Mailman-Approved-At: Fri, 31 Dec 2021 09:05:26 +1100
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
Cc: Andrew Lunn <andrew@lunn.ch>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "fido_max@inbox.ru" <fido_max@inbox.ru>, Rob Herring <robh+dt@kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--00000000000092a97505d45cfae4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes, I have T1040RDB ver.b (without SFP) and my front panel looks like this=
.


 +---------------------------------------------------------------------+
 |                    NO SFP                                           |
 |  +-------+-------+   |           +-------+-------+-------+-------+  |
 |  | UART0 |  ETH1 |   |           |  ETH4 |  ETH6 |  ETH8 | ETH10 |  |
 |  +-------+-------+  \|/  +-------+-------+-------+-------+-------+  |
 |  | UART1 |  ETH0 |       |  ETH2 |  ETH3 |  ETH5 |  ETH7 | ETH9  |  |
 +--+-------+-------+-------+-------+-------+-------+-------+-------+--+

Same as this pic
https://habrastorage.org/files/433/d0f/057/433d0f05784f42b6acf9bb777970b1e9=
.jpg


=D1=87=D1=82, 30 =D0=B4=D0=B5=D0=BA. 2021 =D0=B3. =D0=B2 16:00, Vladimir Ol=
tean <vladimir.oltean@nxp.com>:

> On Thu, Dec 30, 2021 at 01:43:28PM +0300, Maxim Kiselev wrote:
> > Fix network interface names for the switch ports according to labels
> > that are written on the front panel of the board. They start from ETH3
> > and end at ETH10.
> >
> > Fixes: e69eb0824d8c ("powerpc: dts: t1040rdb: add ports for Seville
> > Ethernet switch")
>
> A Fixes: tag should not wrap on multiple lines.
>
> > Signed-off-by: Maxim Kiselev <bigunclemax@gmail.com>
> > Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
> > ---
>
> Sadly I'm not able to confirm or disprove this change right now, because
> my T1040RDB has a bad DDR memory stick, it seems, so it just randomly
> hangs.
> But I'm pretty sure the Ethernet ports were properly mapped out when I
> tested them.
>
> Do you have the T1040RDB or the T1040D4RDB? Because the front panel of
> my T1040RDB looks like this:
>
>  +---------------------------------------------------------------------+
>  |                                                                     |
>  |  +-------+-------+               +-------+-------+-------+-------+  |
>  |  | UART0 |  ETH1 |               |  ETH4 |  ETH6 |  ETH8 | ETH10 |  |
>  |  +-------+-------+-------+-------+-------+-------+-------+-------+  |
>  |  | UART1 |  ETH0 |  ETH2 |  ETH3 |  ETH5 |  ETH7 |  ETH9 | ETH11 |  |
>  +--+-------+-------+-------+-------+-------+-------+-------+-------+--+
>
> >  arch/powerpc/boot/dts/fsl/t1040rdb.dts | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/powerpc/boot/dts/fsl/t1040rdb.dts
> b/arch/powerpc/boot/dts/fsl/t1040rdb.dts
> > index af0c8a6f56138..b6733e7e65805 100644
> > --- a/arch/powerpc/boot/dts/fsl/t1040rdb.dts
> > +++ b/arch/powerpc/boot/dts/fsl/t1040rdb.dts
> > @@ -119,7 +119,7 @@ &seville_port0 {
> >       managed =3D "in-band-status";
> >       phy-handle =3D <&phy_qsgmii_0>;
> >       phy-mode =3D "qsgmii";
> > -     label =3D "ETH5";
> > +     label =3D "ETH3";
> >       status =3D "okay";
> >  };
> >
> > @@ -135,7 +135,7 @@ &seville_port2 {
> >       managed =3D "in-band-status";
> >       phy-handle =3D <&phy_qsgmii_2>;
> >       phy-mode =3D "qsgmii";
> > -     label =3D "ETH7";
> > +     label =3D "ETH5";
> >       status =3D "okay";
> >  };
> >
> > @@ -151,7 +151,7 @@ &seville_port4 {
> >       managed =3D "in-band-status";
> >       phy-handle =3D <&phy_qsgmii_4>;
> >       phy-mode =3D "qsgmii";
> > -     label =3D "ETH9";
> > +     label =3D "ETH7";
> >       status =3D "okay";
> >  };
> >
> > @@ -167,7 +167,7 @@ &seville_port6 {
> >       managed =3D "in-band-status";
> >       phy-handle =3D <&phy_qsgmii_6>;
> >       phy-mode =3D "qsgmii";
> > -     label =3D "ETH11";
> > +     label =3D "ETH9";
> >       status =3D "okay";
> >  };
> >
> > --
> > 2.32.0
> >

--00000000000092a97505d45cfae4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><pre><code class=3D"gmail-code-colors gmail-hljs gmail-yam=
l">Yes, I have T1040RDB ver.b (without SFP) and my front panel looks like t=
his.</code></pre><pre><code class=3D"gmail-code-colors gmail-hljs gmail-yam=
l"><br> <span class=3D"gmail-hljs-string">+--------------------------------=
-------------------------------------+</span>
 <span class=3D"gmail-hljs-string">|</span>                    <span class=
=3D"gmail-hljs-literal">NO</span> <span class=3D"gmail-hljs-string">SFP</sp=
an>                                           <span class=3D"gmail-hljs-str=
ing">|
 |  +-------+-------+   |           +-------+-------+-------+-------+  |
 |  | UART0 |  ETH1 |   |           |  ETH4 |  ETH6 |  ETH8 | ETH10 |  |
 |  +-------+-------+  \|/  +-------+-------+-------+-------+-------+  |
 |  | UART1 |  ETH0 |       |  ETH2 |  ETH3 |  ETH5 |  ETH7 | ETH9  |  |
 +--+-------+-------+-------+-------+-------+-------+-------+-------+--+<br=
><br></span></code></pre><pre><code class=3D"gmail-code-colors gmail-hljs g=
mail-yaml"><span class=3D"gmail-hljs-string">Same as this pic <a href=3D"ht=
tps://habrastorage.org/files/433/d0f/057/433d0f05784f42b6acf9bb777970b1e9.j=
pg">https://habrastorage.org/files/433/d0f/057/433d0f05784f42b6acf9bb777970=
b1e9.jpg</a></span></code></pre></div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">=D1=87=D1=82, 30 =D0=B4=D0=B5=D0=BA. 2021 =
=D0=B3. =D0=B2 16:00, Vladimir Oltean &lt;<a href=3D"mailto:vladimir.oltean=
@nxp.com">vladimir.oltean@nxp.com</a>&gt;:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">On Thu, Dec 30, 2021 at 01:43:28PM +0300, Maxim =
Kiselev wrote:<br>
&gt; Fix network interface names for the switch ports according to labels<b=
r>
&gt; that are written on the front panel of the board. They start from ETH3=
<br>
&gt; and end at ETH10.<br>
&gt; <br>
&gt; Fixes: e69eb0824d8c (&quot;powerpc: dts: t1040rdb: add ports for Sevil=
le<br>
&gt; Ethernet switch&quot;)<br>
<br>
A Fixes: tag should not wrap on multiple lines.<br>
<br>
&gt; Signed-off-by: Maxim Kiselev &lt;<a href=3D"mailto:bigunclemax@gmail.c=
om" target=3D"_blank">bigunclemax@gmail.com</a>&gt;<br>
&gt; Reviewed-by: Maxim Kochetkov &lt;<a href=3D"mailto:fido_max@inbox.ru" =
target=3D"_blank">fido_max@inbox.ru</a>&gt;<br>
&gt; ---<br>
<br>
Sadly I&#39;m not able to confirm or disprove this change right now, becaus=
e<br>
my T1040RDB has a bad DDR memory stick, it seems, so it just randomly hangs=
.<br>
But I&#39;m pretty sure the Ethernet ports were properly mapped out when I<=
br>
tested them.<br>
<br>
Do you have the T1040RDB or the T1040D4RDB? Because the front panel of<br>
my T1040RDB looks like this:<br>
<br>
=C2=A0+--------------------------------------------------------------------=
-+<br>
=C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
=C2=A0|=C2=A0 +-------+-------+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0+-------+-------+-------+-------+=C2=A0 |<br>
=C2=A0|=C2=A0 | UART0 |=C2=A0 ETH1 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 ETH4 |=C2=A0 ETH6 |=C2=A0 ETH8 | ETH10 |=C2=A0 |<b=
r>
=C2=A0|=C2=A0 +-------+-------+-------+-------+-------+-------+-------+----=
---+=C2=A0 |<br>
=C2=A0|=C2=A0 | UART1 |=C2=A0 ETH0 |=C2=A0 ETH2 |=C2=A0 ETH3 |=C2=A0 ETH5 |=
=C2=A0 ETH7 |=C2=A0 ETH9 | ETH11 |=C2=A0 |<br>
=C2=A0+--+-------+-------+-------+-------+-------+-------+-------+-------+-=
-+<br>
<br>
&gt;=C2=A0 arch/powerpc/boot/dts/fsl/t1040rdb.dts | 8 ++++----<br>
&gt;=C2=A0 1 file changed, 4 insertions(+), 4 deletions(-)<br>
&gt; <br>
&gt; diff --git a/arch/powerpc/boot/dts/fsl/t1040rdb.dts b/arch/powerpc/boo=
t/dts/fsl/t1040rdb.dts<br>
&gt; index af0c8a6f56138..b6733e7e65805 100644<br>
&gt; --- a/arch/powerpc/boot/dts/fsl/t1040rdb.dts<br>
&gt; +++ b/arch/powerpc/boot/dts/fsl/t1040rdb.dts<br>
&gt; @@ -119,7 +119,7 @@ &amp;seville_port0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0managed =3D &quot;in-band-status&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0phy-handle =3D &lt;&amp;phy_qsgmii_0&gt;;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0phy-mode =3D &quot;qsgmii&quot;;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0label =3D &quot;ETH5&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0label =3D &quot;ETH3&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt; @@ -135,7 +135,7 @@ &amp;seville_port2 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0managed =3D &quot;in-band-status&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0phy-handle =3D &lt;&amp;phy_qsgmii_2&gt;;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0phy-mode =3D &quot;qsgmii&quot;;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0label =3D &quot;ETH7&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0label =3D &quot;ETH5&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt; @@ -151,7 +151,7 @@ &amp;seville_port4 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0managed =3D &quot;in-band-status&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0phy-handle =3D &lt;&amp;phy_qsgmii_4&gt;;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0phy-mode =3D &quot;qsgmii&quot;;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0label =3D &quot;ETH9&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0label =3D &quot;ETH7&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt; @@ -167,7 +167,7 @@ &amp;seville_port6 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0managed =3D &quot;in-band-status&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0phy-handle =3D &lt;&amp;phy_qsgmii_6&gt;;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0phy-mode =3D &quot;qsgmii&quot;;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0label =3D &quot;ETH11&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0label =3D &quot;ETH9&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt; -- <br>
&gt; 2.32.0<br>
&gt;</blockquote></div>

--00000000000092a97505d45cfae4--
