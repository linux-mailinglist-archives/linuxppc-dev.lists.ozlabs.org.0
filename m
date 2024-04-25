Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 225678B190F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Apr 2024 04:55:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ctKSohAM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VQ0pP5fhVz3dTL
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Apr 2024 12:55:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ctKSohAM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Too many DNS lookups) smtp.mailfrom=suse.com (client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com; envelope-from=lidong.zhong@suse.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VPxys0whNz3cQL
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Apr 2024 10:47:30 +1000 (AEST)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a4715991c32so41703566b.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Apr 2024 17:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714006042; x=1714610842; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SA9F7VNbl5nuvd0wmDS2rSmD+h6zlWWdxE/ITpVKvkI=;
        b=ctKSohAMV3TV7rpPSWRpFrKjErRQoqI7cHHcuOheuB3Gblp7+yy+8/uzbDIUor0Xm+
         ljGaPljeLHJ9A/i+RPVo0PzxQP51Lng1+qIisHJGCFmt53Ll4C44YSK/gZ3KGkgDP/7b
         0Ygpl7JFLOj5V/LZH9xkzo9dL869gD8xqUGJg47xCSUqACztYIE5q4LULF/zwT/xZPRw
         Hr6ioUiW21e3eRtaSiprJsiMjk2Hl/OR+G109uKEFouIDVRcmCVsowEwfkxtd+4iALvt
         b6Lyo0QXOIrziZlTnMgMd/9wQFrWZY1dczgeKenm9hBdUkdhi7S6iXxN/orVXiYMpMS1
         gTfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714006042; x=1714610842;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SA9F7VNbl5nuvd0wmDS2rSmD+h6zlWWdxE/ITpVKvkI=;
        b=b/tcDXNq0PPhFvAIpmgqi5DYIewG6X8fWswrTb444ZLq1g4WQFBVTI01X9Gwl+2cMi
         muZMMnp8akua5KGHYyJ042yslPR9gfQuLsWI3LRMB4M8KPTB12gxUMjPa8hKwcXmo0NN
         ioU7liywL0YzlYRpCDQ8mdwts9ebZkM8iaahYA3SjFg/uQ6l6lcjvcIQjIGCAciI+4ZW
         pm+7PQXZzzVTwLsuOvL4bVrEh6XNZufrEm5Ct1xpAD7l9CUY7ADaioT3PYlcidp8KmGG
         K+waNWVx8cLgnDmGO/QwP+EU3tgoIP0W6rA1JF0L5aRb7lxRS0qHJdqkveDVtWVPUcqh
         hJlw==
X-Gm-Message-State: AOJu0YyJV2gHYmFKoF7s9P5ZXDz8761GaZpxj+mfyGV1NnLRxydjWebN
	fJ9JfWgLldt113hgzGQLQQx2fMTvBYBBoZowjifTMV4rZeQfAGz6KfXZlsZrGqUCGr3TtorxGMl
	yI6CIr3P3w9lWKQ5+LQmmG3NiNbyFPiRgpN64ZNsOHYJabfyrHbg=
X-Google-Smtp-Source: AGHT+IH25BzjMgasPI9SRw6rMh/KpMoxFNQz3gdN4aVAnNBUPH+uL71EhH/Bz/SFEym6IHLkKz7nR5j/bkCwkfipM0s=
X-Received: by 2002:a17:906:12c7:b0:a58:7982:6282 with SMTP id
 l7-20020a17090612c700b00a5879826282mr2209913ejb.62.1714006042249; Wed, 24 Apr
 2024 17:47:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240411020450.12725-1-lidong.zhong@suse.com>
In-Reply-To: <20240411020450.12725-1-lidong.zhong@suse.com>
From: Lidong Zhong <lidong.zhong@suse.com>
Date: Thu, 25 Apr 2024 08:47:11 +0800
Message-ID: <CANzB8FRCeNk-FEyOg=4tZN-OAs5pdF93q_GcybzK1LJbpWhDEg@mail.gmail.com>
Subject: Re: [PATCH v2] powerpc/pseries: remove returning ENODEV when uevent
 is triggered
To: mpe@ellerman.id.au
Content-Type: multipart/alternative; boundary="0000000000004aa4c70616e12192"
X-Mailman-Approved-At: Thu, 25 Apr 2024 12:54:50 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--0000000000004aa4c70616e12192
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Michael,

Could you share your opinion about this new patch please?

On Thu, Apr 11, 2024 at 10:04=E2=80=AFAM Lidong Zhong <lidong.zhong@suse.co=
m> wrote:

> We noticed the following nuisance messages during boot process
>
> [    7.120610][ T1060] vio vio: uevent: failed to send synthetic uevent
> [    7.122281][ T1060] vio 4000: uevent: failed to send synthetic uevent
> [    7.122304][ T1060] vio 4001: uevent: failed to send synthetic uevent
> [    7.122324][ T1060] vio 4002: uevent: failedto send synthetic uevent
> [    7.122345][ T1060] vio 4004: uevent: failed to send synthetic uevent
>
> It's caused by either vio_register_device_node() fails to set dev->of_nod=
e
> or the missing "compatible" property. To keep align with the definition o=
f
> modalias in modalias_show(), we remove the return of ENODEV in such cases=
.
> The failure messages can also be suppressed with this change.
>
> v2: keep align the definition of modalias with modalias_show()
> Signed-off-by: Lidong Zhong <lidong.zhong@suse.com>
> ---
>  arch/powerpc/platforms/pseries/vio.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/arch/powerpc/platforms/pseries/vio.c
> b/arch/powerpc/platforms/pseries/vio.c
> index 90ff85c879bf..b2babfdbc40b 100644
> --- a/arch/powerpc/platforms/pseries/vio.c
> +++ b/arch/powerpc/platforms/pseries/vio.c
> @@ -1592,13 +1592,9 @@ static int vio_hotplug(const struct device *dev,
> struct kobj_uevent_env *env)
>         const char *cp;
>
>         dn =3D dev->of_node;
> -       if (!dn)
> -               return -ENODEV;
> -       cp =3D of_get_property(dn, "compatible", NULL);
> -       if (!cp)
> -               return -ENODEV;
> +       if (dn && (cp =3D of_get_property(dn, "compatible", NULL)))
> +               add_uevent_var(env, "MODALIAS=3Dvio:T%sS%s", vio_dev->typ=
e,
> cp);
>
> -       add_uevent_var(env, "MODALIAS=3Dvio:T%sS%s", vio_dev->type, cp);
>         return 0;
>  }
>
> --
> 2.35.3
>
>

--=20
Regards,
Lidong Zhong

--0000000000004aa4c70616e12192
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Michael,<br><div><br></div><div>Could =
you share your opinion=C2=A0about this new patch please?=C2=A0</div></div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu,=
 Apr 11, 2024 at 10:04=E2=80=AFAM Lidong Zhong &lt;<a href=3D"mailto:lidong=
.zhong@suse.com">lidong.zhong@suse.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">We noticed the following nuisance mes=
sages during boot process<br>
<br>
[=C2=A0 =C2=A0 7.120610][ T1060] vio vio: uevent: failed to send synthetic =
uevent<br>
[=C2=A0 =C2=A0 7.122281][ T1060] vio 4000: uevent: failed to send synthetic=
 uevent<br>
[=C2=A0 =C2=A0 7.122304][ T1060] vio 4001: uevent: failed to send synthetic=
 uevent<br>
[=C2=A0 =C2=A0 7.122324][ T1060] vio 4002: uevent: failedto send synthetic =
uevent<br>
[=C2=A0 =C2=A0 7.122345][ T1060] vio 4004: uevent: failed to send synthetic=
 uevent<br>
<br>
It&#39;s caused by either vio_register_device_node() fails to set dev-&gt;o=
f_node<br>
or the missing &quot;compatible&quot; property. To keep align with the defi=
nition of<br>
modalias in modalias_show(), we remove the return of ENODEV in such cases.<=
br>
The failure messages can also be suppressed with this change.<br>
<br>
v2: keep align the definition of modalias with modalias_show()<br>
Signed-off-by: Lidong Zhong &lt;<a href=3D"mailto:lidong.zhong@suse.com" ta=
rget=3D"_blank">lidong.zhong@suse.com</a>&gt;<br>
---<br>
=C2=A0arch/powerpc/platforms/pseries/vio.c | 8 ++------<br>
=C2=A01 file changed, 2 insertions(+), 6 deletions(-)<br>
<br>
diff --git a/arch/powerpc/platforms/pseries/vio.c b/arch/powerpc/platforms/=
pseries/vio.c<br>
index 90ff85c879bf..b2babfdbc40b 100644<br>
--- a/arch/powerpc/platforms/pseries/vio.c<br>
+++ b/arch/powerpc/platforms/pseries/vio.c<br>
@@ -1592,13 +1592,9 @@ static int vio_hotplug(const struct device *dev, str=
uct kobj_uevent_env *env)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *cp;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 dn =3D dev-&gt;of_node;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!dn)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENODEV;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cp =3D of_get_property(dn, &quot;compatible&quo=
t;, NULL);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!cp)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENODEV;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (dn &amp;&amp; (cp =3D of_get_property(dn, &=
quot;compatible&quot;, NULL)))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0add_uevent_var(env,=
 &quot;MODALIAS=3Dvio:T%sS%s&quot;, vio_dev-&gt;type, cp);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0add_uevent_var(env, &quot;MODALIAS=3Dvio:T%sS%s=
&quot;, vio_dev-&gt;type, cp);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
=C2=A0}<br>
<br>
-- <br>
2.35.3<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Regards,<div>Lidong Zhong</div></div></div></div>

--0000000000004aa4c70616e12192--
