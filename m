Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B925F207C6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2019 15:14:26 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 454X281kNDzDqdh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2019 23:14:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::a44; helo=mail-vk1-xa44.google.com;
 envelope-from=slandden@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="e8VWDUkI"; 
 dkim-atps=neutral
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com
 [IPv6:2607:f8b0:4864:20::a44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 454TBy1bm1zDqZG
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 May 2019 21:06:50 +1000 (AEST)
Received: by mail-vk1-xa44.google.com with SMTP id u131so897809vke.9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 May 2019 04:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wxUIMIPXF7//ia3ngSwnb56b2D+TWwTqhbugwySOISc=;
 b=e8VWDUkIzlERuOe1qLIZyvVHXCa1nTabnsbZXjuO/LgqU5WVW70+N6zoNX7kGFLUgB
 wfKTZ0xRft1/3pxfIecYvQLj0+0vMXQj5LzhIInymXoVKu1Xu3b4Y8yxO04y1vSs7HUa
 23NiTneWHnX9XfdrQegnEuDoQIWzwgzW+xmqOgkBn27Mvrst9zoCqA6rBslFM+ciphR3
 VAJqhC9oUAoeHikeHqvez+i7o2pND6aIGRElyPSOcvABTl+mbX1Jg+LlffihK0PWDbUG
 yyVoKOyw3uRoqUn06y0VwK1AkMiJ6zRRB+W2HS9x3l6rXlBvxJuP3RhmJefHpltV3Kt5
 dETQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wxUIMIPXF7//ia3ngSwnb56b2D+TWwTqhbugwySOISc=;
 b=sFABO8WJpGDFFMitHX0wr4VIdIqP51SH3PvB6zDFk3hzIw+VLFjZh03icxlrwog6dW
 lr70h4lPOV4F9F3zaRHwQYRmh9DDksn2tiSrLJ8k/wtdYEMO6Pxwf31y4hvaZ0w+skdR
 8AMZWWsMKgiNKoCXze0FcKFoPfK974P7HBd0TAYYv7L4iaF3S+/cZmjz4HZzYJBIrS6r
 axxSdN3PHqDxM8DWTWrNrZbmLsCeLpjzY7G30YyJWzEx69yDvhYGnEJvLzww2+rUPIjn
 zYhBHW1T/6+zBlBoERFN4myveGWVQetVOqWBZpdBdWFd9hmbSC48flWlLDAHqlDF3/oH
 RL/A==
X-Gm-Message-State: APjAAAWfYRUf+JW6tQyKC7U9hviKxmGOSvPV4V/vm0XhR2i6l/6eMI2S
 yryB2LU5jy3L9rBrW2GLCfM1jjMsz2vUapy0A+Q=
X-Google-Smtp-Source: APXvYqww04mm39VSuOOg+y5lrt6tFqNKj1EzdXcpDVS5elPBBi2kwgNENTKOSbQFrZAUTD6euQXwqfjnW8/xXjx09dc=
X-Received: by 2002:a1f:62c7:: with SMTP id w190mr21786531vkb.72.1558004806462; 
 Thu, 16 May 2019 04:06:46 -0700 (PDT)
MIME-Version: 1.0
References: <d8d0bf05-2c22-0ade-6361-4841e521597c@xenosoft.de>
 <dbfbd2e0-eca8-8ecc-793b-a6f1471ce2ee@c-s.fr>
In-Reply-To: <dbfbd2e0-eca8-8ecc-793b-a6f1471ce2ee@c-s.fr>
From: Shawn Landden <slandden@gmail.com>
Date: Thu, 16 May 2019 06:06:34 -0500
Message-ID: <CA+49okoBAVxNDfL46fXQJ8GOTq7O3kLkru9jdbScEJr4+mbkrQ@mail.gmail.com>
Subject: Re: Latest Git kernel: Section mismatch in reference from the
 variable start_here_multiplatform to the function .init.text:.early_setup()
To: Christophe Leroy <christophe.leroy@c-s.fr>
Content-Type: multipart/alternative; boundary="0000000000000c33270588ff430b"
X-Mailman-Approved-At: Thu, 16 May 2019 23:11:42 +1000
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
Cc: Christian Zigotzky <info@xenosoft.de>, linuxppc-dev@lists.ozlabs.org,
 Christian Zigotzky <chzigotzky@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--0000000000000c33270588ff430b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

El mi=C3=A9., 15 may. 2019 5:17, Christophe Leroy <christophe.leroy@c-s.fr>
escribi=C3=B3:

> Hi,
>
> Le 15/05/2019 =C3=A0 12:09, Christian Zigotzky a =C3=A9crit :
> > Hi All,
> >
> > I got the following error messages with the latest Git kernel today:
> >
> > GEN     .version
> >    CHK     include/generated/compile.h
> >    LD      vmlinux.o
> >    MODPOST vmlinux.o
> > WARNING: vmlinux.o(.text+0x302a): Section mismatch in reference from th=
e
> > variable start_here_multiplatform to the function
> .init.text:.early_setup()
> > The function start_here_multiplatform() references
> > the function __init .early_setup().
> > This is often because start_here_multiplatform lacks a __init
> > annotation or the annotation of .early_setup is wrong.
> >
> >    MODINFO modules.builtin.modinfo
> >    KSYM    .tmp_kallsyms1.o
> >    KSYM    .tmp_kallsyms2.o
> >    LD      vmlinux
> >    SORTEX  vmlinux
> >    SYSMAP  System.map
> >    CHKHEAD vmlinux
> >
> > What does it mean?
>
The best first thing to do with these type of errors is to Google them. If
you see there are patches just assume somebody else is working on it. That
saves everybody time, because these things tend to get duplicate reports.

>
> I proposed a patch for it at https://patchwork.ozlabs.org/patch/1097845/
>
> Christophe
>
> >
> > Please find attached the kernel config.
> >
> > Thanks,
> > Christian
> >
>

--0000000000000c33270588ff430b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi<br><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">El mi=C3=A9., 15 may. 2019 5:17, Christophe Leroy &l=
t;<a href=3D"mailto:christophe.leroy@c-s.fr">christophe.leroy@c-s.fr</a>&gt=
; escribi=C3=B3:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi,<br>
<br>
Le 15/05/2019 =C3=A0 12:09, Christian Zigotzky a =C3=A9crit=C2=A0:<br>
&gt; Hi All,<br>
&gt; <br>
&gt; I got the following error messages with the latest Git kernel today:<b=
r>
&gt; <br>
&gt; GEN=C2=A0=C2=A0=C2=A0=C2=A0 .version<br>
&gt;=C2=A0 =C2=A0 CHK=C2=A0=C2=A0=C2=A0=C2=A0 include/generated/compile.h<b=
r>
&gt;=C2=A0 =C2=A0 LD=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vmlinux.o<br>
&gt;=C2=A0 =C2=A0 MODPOST vmlinux.o<br>
&gt; WARNING: vmlinux.o(.text+0x302a): Section mismatch in reference from t=
he <br>
&gt; variable start_here_multiplatform to the function .init.text:.early_se=
tup()<br>
&gt; The function start_here_multiplatform() references<br>
&gt; the function __init .early_setup().<br>
&gt; This is often because start_here_multiplatform lacks a __init<br>
&gt; annotation or the annotation of .early_setup is wrong.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 MODINFO modules.builtin.modinfo<br>
&gt;=C2=A0 =C2=A0 KSYM=C2=A0=C2=A0=C2=A0 .tmp_kallsyms1.o<br>
&gt;=C2=A0 =C2=A0 KSYM=C2=A0=C2=A0=C2=A0 .tmp_kallsyms2.o<br>
&gt;=C2=A0 =C2=A0 LD=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vmlinux<br>
&gt;=C2=A0 =C2=A0 SORTEX=C2=A0 vmlinux<br>
&gt;=C2=A0 =C2=A0 SYSMAP=C2=A0 System.map<br>
&gt;=C2=A0 =C2=A0 CHKHEAD vmlinux<br>
&gt; <br>
&gt; What does it mean?<br></blockquote></div></div><div dir=3D"auto">The b=
est first thing to do with these type of errors is to Google them. If you s=
ee there are patches just assume somebody else is working on it. That saves=
 everybody time, because these things tend to get duplicate reports.</div><=
div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
I proposed a patch for it at <a href=3D"https://patchwork.ozlabs.org/patch/=
1097845/" rel=3D"noreferrer noreferrer" target=3D"_blank">https://patchwork=
.ozlabs.org/patch/1097845/</a><br>
<br>
Christophe<br>
<br>
&gt; <br>
&gt; Please find attached the kernel config.<br>
&gt; <br>
&gt; Thanks,<br>
&gt; Christian<br>
&gt; <br>
</blockquote></div></div></div>

--0000000000000c33270588ff430b--
