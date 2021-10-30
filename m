Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 62FF3440893
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Oct 2021 13:25:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HhH5f2FdXz3cCj
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Oct 2021 22:25:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ImLVxmJE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52b;
 helo=mail-ed1-x52b.google.com; envelope-from=andy.shevchenko@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=ImLVxmJE; dkim-atps=neutral
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hh9r66KW4z2xDY
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Oct 2021 18:28:04 +1100 (AEDT)
Received: by mail-ed1-x52b.google.com with SMTP id 5so45274602edw.7
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Oct 2021 00:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=qqWjGw3vG0ScPMfa5hmyBJXEG1ro2+8+0taw79r7l9M=;
 b=ImLVxmJE9IoD5luu14zVqVty24Tf4/3ve2h4oOZemadxaCUArbS+bTNZdp6qSqn+eh
 EfnwtNKl4Nhk9TiRjLRBxxgdyEocKsuzey2xAowUIatt5gNvxrBEK2CwyxaMaKHE4HS7
 TNc4tGakdARKvMDIbseyiXUTsZU6d3t0LxQ8sppTnVD9Hn9solvGxCwR+fobPGyujk/k
 ekr4u9hMXBqYW7ouX3+nDAlZs6ALPePk1Ve+b1M/UwqpkdV4CSnIFZ9Q+2syD3/Kya/V
 6JEJUcggalFLnFymvT9She+/IbR2VbIvE3iGZqvKKIPGNfpbLnV4Eo6R3G5t5O82cXzJ
 /QwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=qqWjGw3vG0ScPMfa5hmyBJXEG1ro2+8+0taw79r7l9M=;
 b=M/kuRcu21aK/4UvXAZ/+F8cY2CECKCNgog3SEv5VrpAtq3Vo+DVMyVyd6T4pM/Ub8D
 HjljQYpwBxcY9BLR1trcXauVaVOr5DbeV74MfVV7S5Vc6jr7eUFCSducsgDPqTr+0hYN
 RwImxQ+8IPvPMWxQZpRnDA1cNu00DIanbgQfq1BPVtCuxUWDaJQjBDKdM8Jou+N3WBM2
 ttxP+qYIAL3U3dodF15SFyANErQ5AK7ovmmzWiXtwK/t4SH+EwMgmrVVj74Fv4nWsiCH
 zBijPbMHL7vbhRuipUpaOEP7d0eL6r439fAdXxf/uUThTR2KEtaaaKZBL3p7WVFnoRd4
 VdDw==
X-Gm-Message-State: AOAM531fL/xeC9lW2G/7MAhxTfHheOjwuXPNdMLcP+A0pwlFvKYi0d8K
 XeSoM2Z4Rq01KP/L7xoK9UyMaVnNci2W4xVYJrA=
X-Google-Smtp-Source: ABdhPJxYmngo66qaT+/BG8lJs6CxeCOFA8CP7NmGwe+fHZhC05v/Ju7AtMHZbUBvTmTgiKIUpq/ZBcdlugJXKufKmYE=
X-Received: by 2002:a17:906:2887:: with SMTP id
 o7mr19190670ejd.425.1635578881619; 
 Sat, 30 Oct 2021 00:28:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:907:7e8f:0:0:0:0 with HTTP; Sat, 30 Oct 2021 00:28:01
 -0700 (PDT)
In-Reply-To: <064efc28-eb86-b729-0bb0-b1f5ed5bbf60@csgroup.eu>
References: <20211027153354.81129-1-andriy.shevchenko@linux.intel.com>
 <YXwZihLk1njsBNT4@smile.fi.intel.com>
 <c0524c86-fc7e-632a-8b2a-862695529115@csgroup.eu>
 <CAHp75VeB8Dmr6Hrupb1Hj=D=oG1zPyJrhCXu37QtXHNNKdNvZg@mail.gmail.com>
 <064efc28-eb86-b729-0bb0-b1f5ed5bbf60@csgroup.eu>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 30 Oct 2021 10:28:01 +0300
Message-ID: <CAHp75VfRv6gL5qhgOQ0xN=kUdGeoQOGK+8-YDzm26SZAoWa06w@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] soc: fsl: Replace kernel.h with the necessary
 inclusions
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Type: multipart/alternative; boundary="0000000000003dbb2605cf8ce2b4"
X-Mailman-Approved-At: Sat, 30 Oct 2021 22:24:38 +1100
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
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--0000000000003dbb2605cf8ce2b4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Saturday, October 30, 2021, Christophe Leroy <christophe.leroy@csgroup.e=
u>
wrote:

>
> Le 29/10/2021 =C3=A0 22:31, Andy Shevchenko a =C3=A9crit :
>
>> On Fri, Oct 29, 2021 at 10:04 PM LEROY Christophe
>> <christophe.leroy@csgroup.eu> wrote:
>>
>>>
>>>
>>>
>>> Le 29/10/2021 =C3=A0 17:55, Andy Shevchenko a =C3=A9crit :
>>>
>>>> On Wed, Oct 27, 2021 at 06:33:54PM +0300, Andy Shevchenko wrote:
>>>>
>>>>> When kernel.h is used in the headers it adds a lot into dependency
>>>>> hell,
>>>>> especially when there are circular dependencies are involved.
>>>>>
>>>>> Replace kernel.h inclusion with the list of what is really being used=
.
>>>>>
>>>>
>>>> Seems nobody from PPC took this patch.
>>>> Any idea who can take it?
>>>>
>>>>
>>> You have to check in MAINTAINERS file in the root directory of kernel
>>> sources: https://github.com/linuxppc/linux/blob/master/MAINTAINERS
>>>
>>
>> Actually for these files get_maintainer.pl showed nothing.
>> I have chosen PPC maintainers manually.
>>
>> That's Michael who takes them. But you have to allow him enough time for
>>> it.
>>>
>>
>> Thanks!
>>
>> I wrote that message because I have got a notification from checkpatch
>> that it should go somewhere else.
>>
>>
> That means that Michael considered it is not for him.
>
> And I think the reason is that in MAINTAINERS you have:
>
> FREESCALE QUICC ENGINE LIBRARY
> M:      Qiang Zhao <qiang.zhao@nxp.com>
> L:      linuxppc-dev@lists.ozlabs.org
> S:      Maintained
> F:      drivers/soc/fsl/qe/
> F:      include/soc/fsl/*qe*.h
> F:      include/soc/fsl/*ucc*.h
>
>
> FREESCALE SOC DRIVERS
> M:      Li Yang <leoyang.li@nxp.com>
> L:      linuxppc-dev@lists.ozlabs.org
> L:      linux-arm-kernel@lists.infradead.org (moderated for
> non-subscribers)
> S:      Maintained
> F:      Documentation/devicetree/bindings/misc/fsl,dpaa2-console.yaml
> F:      Documentation/devicetree/bindings/soc/fsl/
> F:      drivers/soc/fsl/
> F:      include/linux/fsl/
>
>
Thanks! Now I should understand why get_maintainer hadn=E2=80=99t showed ab=
ove for
me.



> Sorry I overlooked your patch.


NP


>
> Christophe
>


--=20
With Best Regards,
Andy Shevchenko

--0000000000003dbb2605cf8ce2b4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>On Saturday, October 30, 2021, Christophe Leroy &lt;<a href=3D"mail=
to:christophe.leroy@csgroup.eu">christophe.leroy@csgroup.eu</a>&gt; wrote:<=
br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex"><br>
Le 29/10/2021 =C3=A0 22:31, Andy Shevchenko a =C3=A9crit=C2=A0:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On Fri, Oct 29, 2021 at 10:04 PM LEROY Christophe<br>
&lt;<a href=3D"mailto:christophe.leroy@csgroup.eu" target=3D"_blank">christ=
ophe.leroy@csgroup.eu</a>&gt; wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
<br>
<br>
Le 29/10/2021 =C3=A0 17:55, Andy Shevchenko a =C3=A9crit :<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On Wed, Oct 27, 2021 at 06:33:54PM +0300, Andy Shevchenko wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
When kernel.h is used in the headers it adds a lot into dependency hell,<br=
>
especially when there are circular dependencies are involved.<br>
<br>
Replace kernel.h inclusion with the list of what is really being used.<br>
</blockquote>
<br>
Seems nobody from PPC took this patch.<br>
Any idea who can take it?<br>
<br>
</blockquote>
<br>
You have to check in MAINTAINERS file in the root directory of kernel<br>
sources: <a href=3D"https://github.com/linuxppc/linux/blob/master/MAINTAINE=
RS" target=3D"_blank">https://github.com/linuxppc/li<wbr>nux/blob/master/MA=
INTAINERS</a><br>
</blockquote>
<br>
Actually for these files <a href=3D"http://get_maintainer.pl" target=3D"_bl=
ank">get_maintainer.pl</a> showed nothing.<br>
I have chosen PPC maintainers manually.<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
That&#39;s Michael who takes them. But you have to allow him enough time fo=
r it.<br>
</blockquote>
<br>
Thanks!<br>
<br>
I wrote that message because I have got a notification from checkpatch<br>
that it should go somewhere else.<br>
<br>
</blockquote>
<br>
That means that Michael considered it is not for him.<br>
<br>
And I think the reason is that in MAINTAINERS you have:<br>
<br>
FREESCALE QUICC ENGINE LIBRARY<br>
M:=C2=A0 =C2=A0 =C2=A0 Qiang Zhao &lt;<a href=3D"mailto:qiang.zhao@nxp.com"=
 target=3D"_blank">qiang.zhao@nxp.com</a>&gt;<br>
L:=C2=A0 =C2=A0 =C2=A0 <a href=3D"mailto:linuxppc-dev@lists.ozlabs.org" tar=
get=3D"_blank">linuxppc-dev@lists.ozlabs.org</a><br>
S:=C2=A0 =C2=A0 =C2=A0 Maintained<br>
F:=C2=A0 =C2=A0 =C2=A0 drivers/soc/fsl/qe/<br>
F:=C2=A0 =C2=A0 =C2=A0 include/soc/fsl/*qe*.h<br>
F:=C2=A0 =C2=A0 =C2=A0 include/soc/fsl/*ucc*.h<br>
<br>
<br>
FREESCALE SOC DRIVERS<br>
M:=C2=A0 =C2=A0 =C2=A0 Li Yang &lt;<a href=3D"mailto:leoyang.li@nxp.com" ta=
rget=3D"_blank">leoyang.li@nxp.com</a>&gt;<br>
L:=C2=A0 =C2=A0 =C2=A0 <a href=3D"mailto:linuxppc-dev@lists.ozlabs.org" tar=
get=3D"_blank">linuxppc-dev@lists.ozlabs.org</a><br>
L:=C2=A0 =C2=A0 =C2=A0 <a href=3D"mailto:linux-arm-kernel@lists.infradead.o=
rg" target=3D"_blank">linux-arm-kernel@lists.infrade<wbr>ad.org</a> (modera=
ted for non-subscribers)<br>
S:=C2=A0 =C2=A0 =C2=A0 Maintained<br>
F:=C2=A0 =C2=A0 =C2=A0 Documentation/devicetree/bindi<wbr>ngs/misc/fsl,dpaa=
2-console.<wbr>yaml<br>
F:=C2=A0 =C2=A0 =C2=A0 Documentation/devicetree/bindi<wbr>ngs/soc/fsl/<br>
F:=C2=A0 =C2=A0 =C2=A0 drivers/soc/fsl/<br>
F:=C2=A0 =C2=A0 =C2=A0 include/linux/fsl/<br>
<br></blockquote><div><br></div><div>Thanks! Now I should understand why ge=
t_maintainer hadn=E2=80=99t showed above for me.</div><div><br></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">
Sorry I overlooked your patch.</blockquote><div><br></div><div>NP=C2=A0</di=
v><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Christophe<br>
</blockquote><br><br>-- <br>With Best Regards,<br>Andy Shevchenko<br><br><b=
r>

--0000000000003dbb2605cf8ce2b4--
