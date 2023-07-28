Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED21766DD3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jul 2023 15:04:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=k/usju2P;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RC7B874z3z3dJc
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jul 2023 23:04:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=k/usju2P;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::535; helo=mail-pg1-x535.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RBy085VTBz2yVb
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jul 2023 16:09:44 +1000 (AEST)
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-53fa455cd94so1042430a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jul 2023 23:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690524581; x=1691129381;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uSPzUFn7T9Qz9TrVlHhzbkYGwIMpJxTQp56qvApeEX4=;
        b=k/usju2PRtT1P+4dpMnusZIB/xQkf0dxnP+t6TOlRc4NXz80vbzDMqxeZ0rOKuxDS9
         oI9jCMDGZvZIvAnqPs9klVLXnCdrYl2rX55l6xbNHIdVX9D3N89Afv92hyyWqvOymWMq
         8taVsRj+Sd1HBXISml+Ui/Jz9QpLEV3wToQiZYWFpcZFgDmeGUcJUbd5wP6x3lZMu7M4
         bp6UpIHATBTiwYU3W9X34ZC5TfyhEdB0/td/L5NTccjJnA93CQ8uz56AFDyMBtuY4fXk
         +z0LMoZSeiPQWnfZNP8pmVmWyWxtBFyaUw7GTht1s+5QhoWH9O1zpB4Q46L6CSVFRDSp
         KUKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690524581; x=1691129381;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uSPzUFn7T9Qz9TrVlHhzbkYGwIMpJxTQp56qvApeEX4=;
        b=DIoDTYg/gsGYvJBOUnfjjsbZJIYFdvZSmqVb1JDgEnvjGS+OyNRHE1yZt2kYSwjvkp
         YKlOmU707LMejG1TmWbADiPdNpztwt9/phVuJTbn71T9y4O9qZfz5+UANYRKnUM71D9Y
         uGCjPZwU0MMkRUotT2tSE5HuOcO8ofNPuVtsPeASyrMUJW5vY+lz04/BvBz/s3ih77sQ
         lW9yW1DYvhUQgThgnjyRDchGj0y8gqswf/K7TbXQBfMQaOa4R0hcAi22oy62IBIO9xEU
         BaXPRnTmKSG8+xWXUV4cuYdNbj1BWNUHvRIq92vk9z3H6HBa0FlgSI0Cul1HUO6dFeKr
         ZvkA==
X-Gm-Message-State: ABy/qLaOwmCFDPzePt6iFr7gTfE3AYf+x5UPaPEx+w7oqOgEmdCFVuOk
	2X1SOjbw3oV5x6aS/9WN/XpriVGYsWybnYt8kpY=
X-Google-Smtp-Source: APBJJlG/5xFeiRqFQxQDPi57L91+bFxPqPd08vVd/Py5OE3Ms0hSsb3q5fBFgDwBacXJGeoF39ZnTCJ+vhIZTuEFqYk=
X-Received: by 2002:a17:90a:6c04:b0:268:7dde:d90d with SMTP id
 x4-20020a17090a6c0400b002687dded90dmr560153pjj.11.1690524581403; Thu, 27 Jul
 2023 23:09:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230727-sound-soc-fsl-v1-1-4fc0ed7e0366@google.com>
In-Reply-To: <20230727-sound-soc-fsl-v1-1-4fc0ed7e0366@google.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 28 Jul 2023 14:09:30 +0800
Message-ID: <CAA+D8AOCgX042Ji=jqdtPRvm=zWXOCpg-hLR4pLbJn8o1yb0_Q@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_micfil: refactor deprecated strncpy
To: Justin Stitt <justinstitt@google.com>
Content-Type: multipart/alternative; boundary="00000000000028a22e060185ed6f"
X-Mailman-Approved-At: Fri, 28 Jul 2023 23:01:37 +1000
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
Cc: alsa-devel@alsa-project.org, Kees Cook <keescook@chromium.org>, Xiubo Li <Xiubo.Lee@gmail.com>, linuxppc-dev@lists.ozlabs.org, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>, Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--00000000000028a22e060185ed6f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 28, 2023 at 6:26=E2=80=AFAM Justin Stitt <justinstitt@google.co=
m> wrote:

> `strncpy` is deprecated for use on NUL-terminated destination strings [1]=
.
>
> A suitable replacement is `strscpy` [2] due to the fact that it
> guarantees NUL-termination on its destination buffer argument which is
> _not_ always the case for `strncpy`!
>
> In this case, though, there was great care taken to ensure that the
> destination buffer would be NUL-terminated through the use of `len - 1`
> ensuring that the previously zero-initialized buffer would not overwrite
> the last NUL byte. This means that there's no bug here.
>
> However, `strscpy` will add a mandatory NUL byte to the destination
> buffer as promised by the following `strscpy` implementation [3]:
> |       /* Hit buffer length without finding a NUL; force NUL-termination=
.
> */
> |       if (res)
> |               dest[res-1] =3D '\0';
>
> This means we can lose the `- 1` which clears up whats happening here.
> All the while, we get one step closer to eliminating the ambiguous
> `strncpy` api in favor of its less ambiguous replacement like `strscpy`,
> `strscpy_pad`, `strtomem` and `strtomem_pad` amongst others.
>
> [1]:
> www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-ter=
minated-strings
> [2]: manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html
> [3]: https://elixir.bootlin.com/linux/v6.3/source/lib/string.c#L183
>
> Link: https://github.com/KSPP/linux/issues/90
> Signed-off-by: Justin Stitt <justinstitt@google.com>
>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
wang shengjiu

> ---
>  sound/soc/fsl/fsl_micfil.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
> index 3f08082a55be..fe28b27e50d0 100644
> --- a/sound/soc/fsl/fsl_micfil.c
> +++ b/sound/soc/fsl/fsl_micfil.c
> @@ -1044,7 +1044,7 @@ static int fsl_micfil_probe(struct platform_device
> *pdev)
>                 return -ENOMEM;
>
>         micfil->pdev =3D pdev;
> -       strncpy(micfil->name, np->name, sizeof(micfil->name) - 1);
> +       strscpy(micfil->name, np->name, sizeof(micfil->name));
>
>         micfil->soc =3D of_device_get_match_data(&pdev->dev);
>
>
> ---
> base-commit: 57012c57536f8814dec92e74197ee96c3498d24e
> change-id: 20230727-sound-soc-fsl-4fc5569d771e
>
> Best regards,
> --
> Justin Stitt <justinstitt@google.com>
>
>

--00000000000028a22e060185ed6f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jul 28, 2023 at 6:26=E2=80=AF=
AM Justin Stitt &lt;<a href=3D"mailto:justinstitt@google.com">justinstitt@g=
oogle.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">`strncpy` is deprecated for use on NUL-terminated destination st=
rings [1].<br>
<br>
A suitable replacement is `strscpy` [2] due to the fact that it<br>
guarantees NUL-termination on its destination buffer argument which is<br>
_not_ always the case for `strncpy`!<br>
<br>
In this case, though, there was great care taken to ensure that the<br>
destination buffer would be NUL-terminated through the use of `len - 1`<br>
ensuring that the previously zero-initialized buffer would not overwrite<br=
>
the last NUL byte. This means that there&#39;s no bug here.<br>
<br>
However, `strscpy` will add a mandatory NUL byte to the destination<br>
buffer as promised by the following `strscpy` implementation [3]:<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Hit buffer length without finding a NUL; for=
ce NUL-termination. */<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0if (res)<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dest[res-1] =3D &#3=
9;\0&#39;;<br>
<br>
This means we can lose the `- 1` which clears up whats happening here.<br>
All the while, we get one step closer to eliminating the ambiguous<br>
`strncpy` api in favor of its less ambiguous replacement like `strscpy`,<br=
>
`strscpy_pad`, `strtomem` and `strtomem_pad` amongst others.<br>
<br>
[1]: <a href=3D"http://www.kernel.org/doc/html/latest/process/deprecated.ht=
ml#strncpy-on-nul-terminated-strings" rel=3D"noreferrer" target=3D"_blank">=
www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-termi=
nated-strings</a><br>
[2]: <a href=3D"http://manpages.debian.org/testing/linux-manual-4.8/strscpy=
.9.en.html" rel=3D"noreferrer" target=3D"_blank">manpages.debian.org/testin=
g/linux-manual-4.8/strscpy.9.en.html</a><br>
[3]: <a href=3D"https://elixir.bootlin.com/linux/v6.3/source/lib/string.c#L=
183" rel=3D"noreferrer" target=3D"_blank">https://elixir.bootlin.com/linux/=
v6.3/source/lib/string.c#L183</a><br>
<br>
Link: <a href=3D"https://github.com/KSPP/linux/issues/90" rel=3D"noreferrer=
" target=3D"_blank">https://github.com/KSPP/linux/issues/90</a><br>
Signed-off-by: Justin Stitt &lt;<a href=3D"mailto:justinstitt@google.com" t=
arget=3D"_blank">justinstitt@google.com</a>&gt;<br></blockquote><div><br></=
div><div>Acked-by: Shengjiu Wang &lt;<a href=3D"mailto:shengjiu.wang@gmail.=
com">shengjiu.wang@gmail.com</a>&gt;</div><div><br></div><div>Best regards<=
/div><div>wang shengjiu=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
---<br>
=C2=A0sound/soc/fsl/fsl_micfil.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c<br>
index 3f08082a55be..fe28b27e50d0 100644<br>
--- a/sound/soc/fsl/fsl_micfil.c<br>
+++ b/sound/soc/fsl/fsl_micfil.c<br>
@@ -1044,7 +1044,7 @@ static int fsl_micfil_probe(struct platform_device *p=
dev)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENOMEM;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 micfil-&gt;pdev =3D pdev;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0strncpy(micfil-&gt;name, np-&gt;name, sizeof(mi=
cfil-&gt;name) - 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0strscpy(micfil-&gt;name, np-&gt;name, sizeof(mi=
cfil-&gt;name));<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 micfil-&gt;soc =3D of_device_get_match_data(&am=
p;pdev-&gt;dev);<br>
<br>
<br>
---<br>
base-commit: 57012c57536f8814dec92e74197ee96c3498d24e<br>
change-id: 20230727-sound-soc-fsl-4fc5569d771e<br>
<br>
Best regards,<br>
--<br>
Justin Stitt &lt;<a href=3D"mailto:justinstitt@google.com" target=3D"_blank=
">justinstitt@google.com</a>&gt;<br>
<br>
</blockquote></div></div>

--00000000000028a22e060185ed6f--
