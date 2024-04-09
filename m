Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C28A89CFBB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Apr 2024 03:20:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Qwyry903;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VD7Rh25sMz3vYR
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Apr 2024 11:20:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Qwyry903;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Too many DNS lookups) smtp.mailfrom=suse.com (client-ip=2a00:1450:4864:20::133; helo=mail-lf1-x133.google.com; envelope-from=lidong.zhong@suse.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VD73q475zz3bWH
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Apr 2024 11:02:45 +1000 (AEST)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-516d536f6f2so3713015e87.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Apr 2024 18:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712624561; x=1713229361; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AsCQPz9aEpHUkDniIyp4nVzLwxtewxNjODtC7JcQ8rw=;
        b=Qwyry903apcJ4KHlOT91x+J8siBfP+1XzO1iz1S5a5F9Fj2zWgfAubRBL3TTdYjKDh
         x8bsK8EG/Za5OU78BdS+bB/WzxO6d+yHPWAJckZV8wrC6xNfQiDRzYoIbx/r8ESr2iYl
         j38eVKSCdPSZzqIIJIeCOuDCORQJw+Dyy4pW21cnxf2Bx3wgsgDbct1I+n08I6YEL+X7
         YM3aeM3a7Ssbe38mrx4DOpx3ivK1lCPvdX+WMwqVnFLENCFVTnkMcPtUnJqw89usjxN1
         KzgAvocRW6jBVoYPfp5vk1maNwvbP8f6zWJ+fBxlvhhCMo3eS9qW7OmPsm8QNdH2fVFy
         zYyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712624562; x=1713229362;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AsCQPz9aEpHUkDniIyp4nVzLwxtewxNjODtC7JcQ8rw=;
        b=gzfSKYtTlJOAZsMxHe8vwbTse9M88ZCORCAsUnYWoAZdIsLrAQH2h+NZEAecDj75xv
         u+kk8diwNraDmeyJaWeoSK6BYxODPA3g/jGScnMBwJHWYwm4dwyybVNAYxqayxZf7bRZ
         nSAZet7aGa4iY3FqPMtqArlCMdT5hyVA1FuKPiqNeM2kKJIZUa9eCL/w4fv35t2jxopv
         df2NfIswX9PQJC2thgilxvzY2E3S4rm7AtdDpPLvgE6emTGvnq70QUBapWjnSsfkI+KV
         k6NXkkh6+he432dFTvUTv0iXtCvsJBdTvU/rQzCO66iQ5MpnPDY4mv3Ct56CGvIPt4VS
         2jYQ==
X-Gm-Message-State: AOJu0YwB8TUAmtK1SdsdzsDX3/Gi3i1O37vNEczEXEaMPWT+nJTvap4W
	CMGGscLCz3fj+Z2Ml/0+4JqDE64gQd4uFFdSYk2mZVIeaxT/YeZ9f0d4uNwmaY3vnN2C51ovLso
	dI7I0+1krP7oE434+XDALIKuvdxJYzvSplD313rNbQZ5ygpRDV24=
X-Google-Smtp-Source: AGHT+IGkDhlCidg8CF9FZ0s2EV0VGofD8C/OEx8LfnAfKtHe9KtutoajkSY6VyAXqjQWHQ12LnM6w2OyKqreHD7JBhk=
X-Received: by 2002:ac2:4114:0:b0:516:cf09:5adb with SMTP id
 b20-20020ac24114000000b00516cf095adbmr6791364lfi.67.1712624561593; Mon, 08
 Apr 2024 18:02:41 -0700 (PDT)
MIME-Version: 1.0
References: <20240323084737.12986-1-lidong.zhong@suse.com>
In-Reply-To: <20240323084737.12986-1-lidong.zhong@suse.com>
From: Lidong Zhong <lidong.zhong@suse.com>
Date: Tue, 9 Apr 2024 09:02:30 +0800
Message-ID: <CANzB8FRWDGAB-zHKdQF2OP4EjrGxD4=VWvaJnO-y1kfZ4JPO9w@mail.gmail.com>
Subject: Re: [PATCH] powerpc/pseries: remove returning ENODEV when uevent is triggered
To: mpe@ellerman.id.au
Content-Type: multipart/alternative; boundary="000000000000a0c0b006159f7ae6"
X-Mailman-Approved-At: Tue, 09 Apr 2024 11:19:24 +1000
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

--000000000000a0c0b006159f7ae6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Michael,

Could you share your opinion about this patch please?

Thanks,
Lidong

On Sat, Mar 23, 2024 at 4:47=E2=80=AFPM Lidong Zhong <lidong.zhong@suse.com=
> wrote:

> We have noticed the following nuisance messages during boot
>
> [    7.120610][ T1060] vio vio: uevent: failed to send synthetic uevent
> [    7.122281][ T1060] vio 4000: uevent: failed to send synthetic uevent
> [    7.122304][ T1060] vio 4001: uevent: failed to send synthetic uevent
> [    7.122324][ T1060] vio 4002: uevent: failed to send synthetic uevent
> [    7.122345][ T1060] vio 4004: uevent: failed to send synthetic uevent
>
> It's caused by either vio_register_device_node() failed to set
> dev->of_node or
> the missing "compatible" property. Try return as much information as
> possible
> instead of a failure. The above annoying errors can also be removed
> after the patch applied.
>
> Signed-off-by: Lidong Zhong <lidong.zhong@suse.com>
> ---
>  arch/powerpc/platforms/pseries/vio.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/arch/powerpc/platforms/pseries/vio.c
> b/arch/powerpc/platforms/pseries/vio.c
> index 90ff85c879bf..62961715ca24 100644
> --- a/arch/powerpc/platforms/pseries/vio.c
> +++ b/arch/powerpc/platforms/pseries/vio.c
> @@ -1593,12 +1593,13 @@ static int vio_hotplug(const struct device *dev,
> struct kobj_uevent_env *env)
>
>         dn =3D dev->of_node;
>         if (!dn)
> -               return -ENODEV;
> +               goto out;
>         cp =3D of_get_property(dn, "compatible", NULL);
>         if (!cp)
> -               return -ENODEV;
> -
> -       add_uevent_var(env, "MODALIAS=3Dvio:T%sS%s", vio_dev->type, cp);
> +               add_uevent_var(env, "MODALIAS=3Dvio:T%s", vio_dev->type);
> +    else
> +               add_uevent_var(env, "MODALIAS=3Dvio:T%sS%s", vio_dev->typ=
e,
> cp);
> +out:
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

--000000000000a0c0b006159f7ae6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Michael,=C2=A0</div><div><br></div><div>Could you =
share your opinion about this patch please?</div><div><br></div><div>Thanks=
,</div><div>Lidong</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Sat, Mar 23, 2024 at 4:47=E2=80=AFPM Lidong Zhong &lt;=
<a href=3D"mailto:lidong.zhong@suse.com">lidong.zhong@suse.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">We have notic=
ed the following nuisance messages during boot<br>
<br>
[=C2=A0 =C2=A0 7.120610][ T1060] vio vio: uevent: failed to send synthetic =
uevent<br>
[=C2=A0 =C2=A0 7.122281][ T1060] vio 4000: uevent: failed to send synthetic=
 uevent<br>
[=C2=A0 =C2=A0 7.122304][ T1060] vio 4001: uevent: failed to send synthetic=
 uevent<br>
[=C2=A0 =C2=A0 7.122324][ T1060] vio 4002: uevent: failed to send synthetic=
 uevent<br>
[=C2=A0 =C2=A0 7.122345][ T1060] vio 4004: uevent: failed to send synthetic=
 uevent<br>
<br>
It&#39;s caused by either vio_register_device_node() failed to set dev-&gt;=
of_node or<br>
the missing &quot;compatible&quot; property. Try return as much information=
 as possible<br>
instead of a failure. The above annoying errors can also be removed<br>
after the patch applied.<br>
<br>
Signed-off-by: Lidong Zhong &lt;<a href=3D"mailto:lidong.zhong@suse.com" ta=
rget=3D"_blank">lidong.zhong@suse.com</a>&gt;<br>
---<br>
=C2=A0arch/powerpc/platforms/pseries/vio.c | 9 +++++----<br>
=C2=A01 file changed, 5 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/arch/powerpc/platforms/pseries/vio.c b/arch/powerpc/platforms/=
pseries/vio.c<br>
index 90ff85c879bf..62961715ca24 100644<br>
--- a/arch/powerpc/platforms/pseries/vio.c<br>
+++ b/arch/powerpc/platforms/pseries/vio.c<br>
@@ -1593,12 +1593,13 @@ static int vio_hotplug(const struct device *dev, st=
ruct kobj_uevent_env *env)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 dn =3D dev-&gt;of_node;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!dn)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENODEV;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp =3D of_get_property(dn, &quot;compatible&quo=
t;, NULL);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!cp)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENODEV;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0add_uevent_var(env, &quot;MODALIAS=3Dvio:T%sS%s=
&quot;, vio_dev-&gt;type, cp);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0add_uevent_var(env,=
 &quot;MODALIAS=3Dvio:T%s&quot;, vio_dev-&gt;type);<br>
+=C2=A0 =C2=A0 else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0add_uevent_var(env,=
 &quot;MODALIAS=3Dvio:T%sS%s&quot;, vio_dev-&gt;type, cp);<br>
+out:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
=C2=A0}<br>
<br>
-- <br>
2.35.3<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Regards,<div>Lidong Zhong</div></div></div></div>

--000000000000a0c0b006159f7ae6--
