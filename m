Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9045C8A05BF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Apr 2024 04:12:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=XYzTo/WZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VFNW32LcGz3dlT
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Apr 2024 12:12:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=XYzTo/WZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Too many DNS lookups) smtp.mailfrom=suse.com (client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com; envelope-from=lidong.zhong@suse.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VFMtb2tWKz3bmN
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Apr 2024 11:44:04 +1000 (AEST)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a46a7208eedso1045001766b.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Apr 2024 18:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712799838; x=1713404638; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LcQPEznwninH7+3ZQMMoTa7Ih+wR+b9OF1yYF6+esLE=;
        b=XYzTo/WZyFq2twb6UvhBpzPHcE1tiwHb3TpLzd1vXc+wpJo7x8vt6M8dYOcYxm9Lr/
         o7VZW4JEkfFpI3xvcjdr4DeF+COJT2uXgGYtlP6EwTlrdhxoM45uOR6IWvOdPHnWhKGx
         PFHrF4bZhT75O83dZq0RLLx56RXzgOAFMi2KbOii0K6kc0zHEGjgbVWuFhn4+DGlHOwH
         T1XwDwXJ+24GzTb/sieFTjA9wkjQtKFprxcCsnmxMfZxKSbMkTGsysYMgOl9zrP1sazz
         vf45TyMd4ugX7C98grUpa7DmaZrtYwypMn1mZ+jaPnjL51abQtstsubmeC2CVvFpEeW4
         iJRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712799838; x=1713404638;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LcQPEznwninH7+3ZQMMoTa7Ih+wR+b9OF1yYF6+esLE=;
        b=H8uwyWcrwDcf6DZ+27R67nBsjOT6VhiFOK4Gtyqjm3GUBJqps8WJnmAJOdtWvVtAIM
         2FMIOeKxD+dgYlIURGx0+W92pg977/fB2auF0Mqc+PRInoqqosGZy/wYpHfLFF2U0JA3
         kscZR+CLULV7siH+5KwHULvXTOjCcZZ3Xo60420Wifizzbgi6JKgEcU6l3LzZAjhbVpd
         q7Qyl9gq2N3c5bbvHL7+u7IOwd95DwtUQt1NVNjVuX2OlCUTCiBJa4VvQpQV3TryqMgc
         De48KqLqGWhyuZKNWc6JAm8cjQ3J1zDI15zSl4/fczGFy3bzimNsOuXf+BD6cyu9BGpT
         PqNw==
X-Gm-Message-State: AOJu0Yz6CKkNyipjJFCr0mZvWGumWGFWGkndna30H6tp8qu9ypp7tXq2
	ftVZXEv2mLuZiVqP/QC0xBNR9n8DnTKKUi8p+jlD52GHTvG865sodcXGrWHQK0U6TQOtN5Rdy3m
	Kc6MMO6aN/Z3383nV8YENORr8f3LQs9AjlhFEHimBWL2OKFDtxaY=
X-Google-Smtp-Source: AGHT+IFXFMN48WgpqMLAVQjM1LiZu3c+fRMxDgHxIk4LyaeuEjvCxo97IXeekCXB5Gz0nd4YIyL0bvwfrXMj8WESjC0=
X-Received: by 2002:a17:906:f2d2:b0:a4e:802c:a7a2 with SMTP id
 gz18-20020a170906f2d200b00a4e802ca7a2mr2124773ejb.38.1712799838461; Wed, 10
 Apr 2024 18:43:58 -0700 (PDT)
MIME-Version: 1.0
References: <20240323084737.12986-1-lidong.zhong@suse.com> <877ch6c4af.fsf@mail.lhotse>
 <CANzB8FRRKh=r8ByUxhyXu3jiLf_CcKm+wN4_GfZDiVQ6g3b4KA@mail.gmail.com>
In-Reply-To: <CANzB8FRRKh=r8ByUxhyXu3jiLf_CcKm+wN4_GfZDiVQ6g3b4KA@mail.gmail.com>
From: Lidong Zhong <lidong.zhong@suse.com>
Date: Thu, 11 Apr 2024 09:43:47 +0800
Message-ID: <CANzB8FS6ov=XS_p9vjaakcMqoDyLNdLT4QdpBqaDrd-PgqwWxA@mail.gmail.com>
Subject: Re: [PATCH] powerpc/pseries: remove returning ENODEV when uevent is triggered
To: Michael Ellerman <mpe@ellerman.id.au>
Content-Type: multipart/alternative; boundary="000000000000f16ec80615c849f5"
X-Mailman-Approved-At: Thu, 11 Apr 2024 12:11:39 +1000
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

--000000000000f16ec80615c849f5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Michael,

After checking the definition of modalias in modalias_show(), I think it's
better to keep the
same logic in vio_hotplug(), that's removing the else part in my original
patch shown below.
+       if (dn && (cp =3D of_get_property(dn, "compatible", NULL))
+               add_uevent_var(env, "MODALIAS=3Dvio:T%sS%s", vio_dev->type,
cp);
+       else
+               add_uevent_var(env, "MODALIAS=3Dvio:T%s", vio_dev->type);
I think we can avoid some possible regression then. I'll make the change in
my v2 patch.

--
Regards,
Lidong Zhong

On Wed, Apr 10, 2024 at 9:25=E2=80=AFAM Lidong Zhong <lidong.zhong@suse.com=
> wrote:

> Hi Michael,
>
> Thanks for your reply.
>
> On Tue, Apr 9, 2024 at 4:46=E2=80=AFPM Michael Ellerman <mpe@ellerman.id.=
au>
> wrote:
>
>> Hi Lidong,
>>
>> Thanks for the patch.
>>
>> I'm not an expert on udev etc. so apologies if any of these questions
>> are stupid.
>>
>> Lidong Zhong <lidong.zhong@suse.com> writes:
>> > We have noticed the following nuisance messages during boot
>> >
>> > [    7.120610][ T1060] vio vio: uevent: failed to send synthetic ueven=
t
>> > [    7.122281][ T1060] vio 4000: uevent: failed to send synthetic ueve=
nt
>> > [    7.122304][ T1060] vio 4001: uevent: failed to send synthetic ueve=
nt
>> > [    7.122324][ T1060] vio 4002: uevent: failed to send synthetic ueve=
nt
>> > [    7.122345][ T1060] vio 4004: uevent: failed to send synthetic ueve=
nt
>> >
>> > It's caused by either vio_register_device_node() failed to set
>> dev->of_node or
>> > the missing "compatible" property. Try return as much information as
>> possible
>> > instead of a failure.
>>
>> Does udev etc. cope with that? Can we just change the content of the
>> MODALIAS value like that?
>>
>> With this patch we'll start emitting uevents for devices we previously
>> didn't. I guess that's OK because nothing is expecting them?
>>
>> Can you include a log of udev showing the event firing and that nothing
>> breaks.
>>
>> On my system here I see nothing matches the devices except for libvpd,
>> which seems to match lots of things.
>>
>
> It's an issue reported by our customer. I am sorry I can't provide more
> information because I  don't have the environment
> to reproduce this issue. The only related log I got is shown below:
>
> Feb 07 14:08:03 rb3i0060 udevadm[623]: vio: Failed to write 'add' to
> '/sys/devices/vio/uevent', ignoring: No such device
>
> Feb 07 14:08:03 rb3i0060 kernel: synth uevent: /devices/vio: failed to
> send uevent
>
> Feb 07 14:08:03 rb3i0060 kernel: vio vio: uevent: failed to send syntheti=
c
> uevent
>
> Feb 07 14:08:03 rb3i0060 kernel: synth uevent: /devices/vio/4000: failed
> to send uevent
>
> Feb 07 14:08:03 rb3i0060 kernel: vio 4000: uevent: failed to send
> synthetic uevent
>
> Feb 07 14:08:03 rb3i0060 kernel: synth uevent: /devices/vio/4001: failed
> to send uevent
>
> Feb 07 14:08:03 rb3i0060 kernel: vio 4001: uevent: failed to send
> synthetic uevent
>
> Feb 07 14:08:03 rb3i0060 kernel: synth uevent: /devices/vio/4002: failed
> to send uevent
>
> Feb 07 14:08:03 rb3i0060 kernel: vio 4002: uevent: failed to send
> synthetic uevent
>
> Feb 07 14:08:03 rb3i0060 kernel: synth uevent: /devices/vio/4004: failed
> to send uevent
>
> Feb 07 14:08:03 rb3i0060 kernel: vio 4004: uevent: failed to send
> synthetic uevent
>
> Feb 07 14:08:03 rb3i0060 udevadm[623]: 4000: Failed to write 'add' to
> '/sys/devices/vio/4000/uevent', ignoring: No such device
>
> Feb 07 14:08:03 rb3i0060 udevadm[623]: 4001: Failed to write 'add' to
> '/sys/devices/vio/4001/uevent', ignoring: No such device
>
> Feb 07 14:08:03 rb3i0060 udevadm[623]: 4002: Failed to write 'add' to
> '/sys/devices/vio/4002/uevent', ignoring: No such device
>
> Feb 07 14:08:03 rb3i0060 udevadm[623]: 4004: Failed to write 'add' to
> '/sys/devices/vio/4004/uevent', ignoring: No such device
>
> systemd-udev-trigger service calls 'udevadm trigger --type=3Ddevices
> --action=3Dadd' and kernel returns -ENODEV because either
> dev->of_node is NULL or 'compatible' property is not present.  Similar
> cases were already reported after some search, for example
> https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1827162
> https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1845319
> I don't think it causes real problems but confusion to users.
>
>
>> > diff --git a/arch/powerpc/platforms/pseries/vio.c
>> b/arch/powerpc/platforms/pseries/vio.c
>> > index 90ff85c879bf..62961715ca24 100644
>> > --- a/arch/powerpc/platforms/pseries/vio.c
>> > +++ b/arch/powerpc/platforms/pseries/vio.c
>> > @@ -1593,12 +1593,13 @@ static int vio_hotplug(const struct device
>> *dev, struct kobj_uevent_env *env)
>> >
>> >       dn =3D dev->of_node;
>> >       if (!dn)
>> > -             return -ENODEV;
>> > +             goto out;
>> >       cp =3D of_get_property(dn, "compatible", NULL);
>> >       if (!cp)
>> > -             return -ENODEV;
>> > -
>> > -     add_uevent_var(env, "MODALIAS=3Dvio:T%sS%s", vio_dev->type, cp);
>> > +             add_uevent_var(env, "MODALIAS=3Dvio:T%s", vio_dev->type)=
;
>>
>> If it's OK to skip the compatible property then we don't need the
>> of_node at all, and we could always emit this, even when of_node is not
>> available.
>>
>
> You mean something like this?
> @@ -1592,13 +1592,10 @@ static int vio_hotplug(const struct device *dev,
> struct kobj_uevent_env *env)
>         const char *cp;
>
>         dn =3D dev->of_node;
> -       if (!dn)
> -               return -ENODEV;
> -       cp =3D of_get_property(dn, "compatible", NULL);
> -       if (!cp)
> -               return -ENODEV;
> -
> -       add_uevent_var(env, "MODALIAS=3Dvio:T%sS%s", vio_dev->type, cp);
> +       if (dn && (cp =3D of_get_property(dn, "compatible", NULL))
> +               add_uevent_var(env, "MODALIAS=3Dvio:T%sS%s", vio_dev->typ=
e,
> cp);
> +       else
> +               add_uevent_var(env, "MODALIAS=3Dvio:T%s", vio_dev->type);
>         return 0;
>
>
>>
>> > +    else
>> > +             add_uevent_var(env, "MODALIAS=3Dvio:T%sS%s", vio_dev->ty=
pe,
>> cp);
>> > +out:
>> >       return 0;
>> >  }
>>
>> I think we also should update the vio modalias_show() to follow the same
>> logic, otherwise the uevent MODALIAS value and the modalias file won't
>> match which is confusing.
>>
>> Preferably vio_hotplug() and modalias_show() would just call a common
>> helper.
>>
>> cheers
>>
>
> Thanks for the suggestion. I'll send a v2 patch.
>
>
> --
> Regards,
> Lidong Zhong
>

--000000000000f16ec80615c849f5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Michael,</div><div><br></div><div>After checking t=
he definition of modalias in modalias_show(), I think it&#39;s better to ke=
ep the</div><div>same logic in vio_hotplug(), that&#39;s removing the else =
part in my original patch shown below.</div><div>+ =C2=A0 =C2=A0 =C2=A0 if =
(dn &amp;&amp; (cp =3D of_get_property(dn, &quot;compatible&quot;, NULL))<b=
r>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 add_uevent_var(env, &q=
uot;MODALIAS=3Dvio:T%sS%s&quot;, vio_dev-&gt;type, cp);<br>+ =C2=A0 =C2=A0 =
=C2=A0 else<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 add_ueven=
t_var(env, &quot;MODALIAS=3Dvio:T%s&quot;, vio_dev-&gt;type);<br></div><div=
>I think we can avoid some possible regression then. I&#39;ll make the chan=
ge in my v2 patch.</div><div><br></div><div><span class=3D"gmail_signature_=
prefix">--</span><br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D=
"ltr">Regards,<div>Lidong Zhong</div></div></div></div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 10, 2024 at 9:=
25=E2=80=AFAM Lidong Zhong &lt;<a href=3D"mailto:lidong.zhong@suse.com">lid=
ong.zhong@suse.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex"><div dir=3D"ltr"><div>Hi Michael,</div><div><br></div><di=
v>Thanks for your reply.=C2=A0</div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Tue, Apr 9, 2024 at 4:46=E2=80=AFPM Michae=
l Ellerman &lt;<a href=3D"mailto:mpe@ellerman.id.au" target=3D"_blank">mpe@=
ellerman.id.au</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">Hi Lidong,<br>
<br>
Thanks for the patch.<br>
<br>
I&#39;m not an expert on udev etc. so apologies if any of these questions<b=
r>
are stupid.<br>
<br>
Lidong Zhong &lt;<a href=3D"mailto:lidong.zhong@suse.com" target=3D"_blank"=
>lidong.zhong@suse.com</a>&gt; writes:<br>
&gt; We have noticed the following nuisance messages during boot<br>
&gt;<br>
&gt; [=C2=A0 =C2=A0 7.120610][ T1060] vio vio: uevent: failed to send synth=
etic uevent<br>
&gt; [=C2=A0 =C2=A0 7.122281][ T1060] vio 4000: uevent: failed to send synt=
hetic uevent<br>
&gt; [=C2=A0 =C2=A0 7.122304][ T1060] vio 4001: uevent: failed to send synt=
hetic uevent<br>
&gt; [=C2=A0 =C2=A0 7.122324][ T1060] vio 4002: uevent: failed to send synt=
hetic uevent<br>
&gt; [=C2=A0 =C2=A0 7.122345][ T1060] vio 4004: uevent: failed to send synt=
hetic uevent<br>
&gt;<br>
&gt; It&#39;s caused by either vio_register_device_node() failed to set dev=
-&gt;of_node or<br>
&gt; the missing &quot;compatible&quot; property. Try return as much inform=
ation as possible<br>
&gt; instead of a failure.<br>
<br>
Does udev etc. cope with that? Can we just change the content of the<br>
MODALIAS value like that?<br>
<br>
With this patch we&#39;ll start emitting uevents for devices we previously<=
br>
didn&#39;t. I guess that&#39;s OK because nothing is expecting them?<br>
<br>
Can you include a log of udev showing the event firing and that nothing<br>
breaks.<br>
<br>
On my system here I see nothing matches the devices except for libvpd,<br>
which seems to match lots of things.<br></blockquote><div><br></div><div>It=
&#39;s an issue reported by our customer. I am sorry I can&#39;t provide mo=
re information because I=C2=A0 don&#39;t have the environment</div><div>to =
reproduce this issue. The only related log I got is shown below:</div><div>=
<br></div><div>Feb 07 14:08:03 rb3i0060 udevadm[623]: vio: Failed to write =
&#39;add&#39; to &#39;/sys/devices/vio/uevent&#39;, ignoring: No such devic=
e =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>Feb 07 14:08:03 rb3i0060 kernel: syn=
th uevent: /devices/vio: failed to send uevent =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0</d=
iv><div>Feb 07 14:08:03 rb3i0060 kernel: vio vio: uevent: failed to send sy=
nthetic uevent =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>Feb 07 14:08:03 rb3i0060 kerne=
l: synth uevent: /devices/vio/4000: failed to send uevent =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>Feb 07 14=
:08:03 rb3i0060 kernel: vio 4000: uevent: failed to send synthetic uevent =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 <br>Feb 07 14:08:03 rb3i0060 kernel: synth uevent: /de=
vices/vio/4001: failed to send uevent =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>Feb 07 14:08:03 rb3i0060 k=
ernel: vio 4001: uevent: failed to send synthetic uevent =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 <br>Feb 07 14:08:03 rb3i0060 kernel: synth uevent: /devices/vio/4002: f=
ailed to send uevent =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0<br>Feb 07 14:08:03 rb3i0060 kernel: vio 4002: u=
event: failed to send synthetic uevent =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>Feb 07 14:0=
8:03 rb3i0060 kernel: synth uevent: /devices/vio/4004: failed to send ueven=
t =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0<br>Feb 07 14:08:03 rb3i0060 kernel: vio 4004: uevent: failed to send=
 synthetic uevent =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>Feb 07 14:08:03 rb3i0060 udevadm=
[623]: 4000: Failed to write &#39;add&#39; to &#39;/sys/devices/vio/4000/ue=
vent&#39;, ignoring: No such device =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>Feb 07 14:08:03 rb3i00=
60 udevadm[623]: 4001: Failed to write &#39;add&#39; to &#39;/sys/devices/v=
io/4001/uevent&#39;, ignoring: No such device =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>Feb 07 14:0=
8:03 rb3i0060 udevadm[623]: 4002: Failed to write &#39;add&#39; to &#39;/sy=
s/devices/vio/4002/uevent&#39;, ignoring: No such device =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>F=
eb 07 14:08:03 rb3i0060 udevadm[623]: 4004: Failed to write &#39;add&#39; t=
o &#39;/sys/devices/vio/4004/uevent&#39;, ignoring: No such device=C2=A0<br=
></div><div><br></div><div>systemd-udev-trigger service calls &#39;udevadm =
trigger --type=3Ddevices --action=3Dadd&#39; and kernel returns -ENODEV bec=
ause either=C2=A0<br></div><div>dev-&gt;of_node is NULL or &#39;compatible&=
#39; property is not present.=C2=A0 Similar cases were already reported aft=
er some search, for example</div><div><a href=3D"https://bugs.launchpad.net=
/ubuntu/+source/linux/+bug/1827162" target=3D"_blank">https://bugs.launchpa=
d.net/ubuntu/+source/linux/+bug/1827162</a><br></div><div><a href=3D"https:=
//bugs.launchpad.net/ubuntu/+source/linux/+bug/1845319" target=3D"_blank">h=
ttps://bugs.launchpad.net/ubuntu/+source/linux/+bug/1845319</a><br></div><d=
iv>I don&#39;t think it causes real problems but confusion to users.<br></d=
iv><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; diff --git a/arch/powerpc/platforms/pseries/vio.c b/arch/powerpc/platf=
orms/pseries/vio.c<br>
&gt; index 90ff85c879bf..62961715ca24 100644<br>
&gt; --- a/arch/powerpc/platforms/pseries/vio.c<br>
&gt; +++ b/arch/powerpc/platforms/pseries/vio.c<br>
&gt; @@ -1593,12 +1593,13 @@ static int vio_hotplug(const struct device *de=
v, struct kobj_uevent_env *env)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0dn =3D dev-&gt;of_node;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!dn)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENODEV;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0cp =3D of_get_property(dn, &quot;compatible&=
quot;, NULL);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!cp)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENODEV;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0add_uevent_var(env, &quot;MODALIAS=3Dvio:T%sS%s&q=
uot;, vio_dev-&gt;type, cp);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0add_uevent_var(env, &=
quot;MODALIAS=3Dvio:T%s&quot;, vio_dev-&gt;type);<br>
<br>
If it&#39;s OK to skip the compatible property then we don&#39;t need the<b=
r>
of_node at all, and we could always emit this, even when of_node is not<br>
available.<br></blockquote><div><br></div><div>You mean something like this=
?</div>@@ -1592,13 +1592,10 @@ static int vio_hotplug(const struct device *=
dev, struct kobj_uevent_env *env)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 const char=
 *cp;<br>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 dn =3D dev-&gt;of_node;<br>-=
 =C2=A0 =C2=A0 =C2=A0 if (!dn)<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return -ENODEV;<br>- =C2=A0 =C2=A0 =C2=A0 cp =3D of_get_property=
(dn, &quot;compatible&quot;, NULL);<br>- =C2=A0 =C2=A0 =C2=A0 if (!cp)<br>-=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENODEV;<br>-<br>-=
 =C2=A0 =C2=A0 =C2=A0 add_uevent_var(env, &quot;MODALIAS=3Dvio:T%sS%s&quot;=
, vio_dev-&gt;type, cp);<br>+ =C2=A0 =C2=A0 =C2=A0 if (dn &amp;&amp; (cp =
=3D of_get_property(dn, &quot;compatible&quot;, NULL))<br>+ =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 add_uevent_var(env, &quot;MODALIAS=3Dvio=
:T%sS%s&quot;, vio_dev-&gt;type, cp);<br>+ =C2=A0 =C2=A0 =C2=A0 else<br>+ =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 add_uevent_var(env, &quot;=
MODALIAS=3Dvio:T%s&quot;, vio_dev-&gt;type);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 return 0;<br><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
<br>
&gt; +=C2=A0 =C2=A0 else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0add_uevent_var(env, &=
quot;MODALIAS=3Dvio:T%sS%s&quot;, vio_dev-&gt;type, cp);<br>
&gt; +out:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt;=C2=A0 }<br>
<br>
I think we also should update the vio modalias_show() to follow the same<br=
>
logic, otherwise the uevent MODALIAS value and the modalias file won&#39;t<=
br>
match which is confusing.<br>
<br>
Preferably vio_hotplug() and modalias_show() would just call a common<br>
helper.<br>
<br>
cheers<br>
</blockquote></div><br clear=3D"all"><div>Thanks for the suggestion. I&#39;=
ll send a v2 patch.</div><div><br></div><div><br></div><span class=3D"gmail=
_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"=
><div dir=3D"ltr">Regards,<div>Lidong Zhong</div></div></div></div>
</blockquote></div><br clear=3D"all"><div><br></div><br></div>

--000000000000f16ec80615c849f5--
