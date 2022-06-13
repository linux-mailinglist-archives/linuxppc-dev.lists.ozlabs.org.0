Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 342E154BD41
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jun 2022 00:05:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LN2YG141xz3fGX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jun 2022 08:05:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=U/Z2Abzy;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=U/Z2Abzy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dzickus@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=U/Z2Abzy;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=U/Z2Abzy;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LMNbV684Vz3blC
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jun 2022 06:34:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655152480;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zJ3o9gagT1LwA2F/N5VMrWXdxfCfYoRUSB67GxAoAGI=;
	b=U/Z2AbzyjdC5cuXLXB8FZS1SsFq6XFptscGwlUSZzPzj5QKYyYacXbK4IfdpJcsMhC4+oZ
	u7zZnDGRpJloIFhbCFrjir4HJv174RLfzo8NOzpkht1PeN589QuBB3XUFcY1wgP0EA8OAn
	nu9afmlh5rIIVce9wCacKqeMu+zZtY8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655152480;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zJ3o9gagT1LwA2F/N5VMrWXdxfCfYoRUSB67GxAoAGI=;
	b=U/Z2AbzyjdC5cuXLXB8FZS1SsFq6XFptscGwlUSZzPzj5QKYyYacXbK4IfdpJcsMhC4+oZ
	u7zZnDGRpJloIFhbCFrjir4HJv174RLfzo8NOzpkht1PeN589QuBB3XUFcY1wgP0EA8OAn
	nu9afmlh5rIIVce9wCacKqeMu+zZtY8=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-484-uBZn_71kNzm_-1iIcL8zYg-1; Mon, 13 Jun 2022 16:34:36 -0400
X-MC-Unique: uBZn_71kNzm_-1iIcL8zYg-1
Received: by mail-io1-f72.google.com with SMTP id k4-20020a6b4004000000b006697f6074e6so3272675ioa.11
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jun 2022 13:34:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zJ3o9gagT1LwA2F/N5VMrWXdxfCfYoRUSB67GxAoAGI=;
        b=baboHJj9HKeJbI/gskxqlI+D4pkzPSX37lHUVZAEOdjK6hQAM9WtVcx0OCjGCvUm70
         6nVzLc6OJrLXlCBRgqemJkSZcPknurYXMaBgXaLTzxk+9s1AGyTv0iy3OpumuH4Gm5Vj
         4VNKGmKPA1oMNl4uHLksHSFwi3bJRYwICeZueqB3uPqR2/f8a+lit1oCheKwhQlyygL3
         ewbtdv5iUX8HPY/VgSuLgqYIe4Yub75xwlUTSKhYjrX6dAkfIAvwngzVDerlAJrK4Qjb
         Ob5zEULQxG5Od6ecBGhUi8c9VDdq+CdrAEqLU7NdNhKN1HOAH+Ripb3iirhlvIhNrh9w
         13bQ==
X-Gm-Message-State: AOAM531ATa0EI9v60LuWZCESlptdbaYF74FAjfcbAQYq+ev6YpEt1Ww3
	x7PTPceWOwh4+S8LSPFyJsa/UcFALvEZDkVRYaQCflKV/FN1DkHnv3Igo4J1h0uFfZy/9//Clw/
	uhItQRRsa+hhUNn+NMW46aKwO3x/CKmLfdVPGFVGKDA==
X-Received: by 2002:a02:6a1e:0:b0:331:f9b9:a920 with SMTP id l30-20020a026a1e000000b00331f9b9a920mr931072jac.44.1655152475664;
        Mon, 13 Jun 2022 13:34:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzboJiU0xW9IO+XtKqOga/jyO3pBg0f0X4mxhvo9NPyV/keDBddD2fe3nfiECYwsG0F7G27++sbQVnFHyLZKdo=
X-Received: by 2002:a02:6a1e:0:b0:331:f9b9:a920 with SMTP id
 l30-20020a026a1e000000b00331f9b9a920mr931061jac.44.1655152475430; Mon, 13 Jun
 2022 13:34:35 -0700 (PDT)
MIME-Version: 1.0
References: <CAK18DXZKs2PNmLndeGYqkPxmrrBR=6ca3bhyYCj=GhyA7dHfAQ@mail.gmail.com>
 <874k0vgyo6.fsf@mpe.ellerman.id.au>
In-Reply-To: <874k0vgyo6.fsf@mpe.ellerman.id.au>
From: Donald Zickus <dzickus@redhat.com>
Date: Mon, 13 Jun 2022 16:34:24 -0400
Message-ID: <CAK18DXbZ+Ma-cvJ2GdgGxzX59Y8Lgirv4FRst2YPdP+arOrg9A@mail.gmail.com>
Subject: Re: ppc64le bzImage and Build_id elf note
To: Michael Ellerman <mpe@ellerman.id.au>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dzickus@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000058fb8005e15a377a"
X-Mailman-Approved-At: Wed, 15 Jun 2022 08:01:46 +1000
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
Cc: Bruno Goncalves <bgoncalv@redhat.com>, Justin Forbes <jforbes@redhat.com>, linuxppc-dev@lists.ozlabs.org, Daniel Horak <dhorak@redhat.com>, Veronika Kabatova <vkabatov@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--00000000000058fb8005e15a377a
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 8, 2022 at 7:52 AM Michael Ellerman <mpe@ellerman.id.au> wrote:

> Donald Zickus <dzickus@redhat.com> writes:
> > Hi Michael,
> >
> > I am working on two packaging issues with Fedora and CKI that I am hoping
> > you can give me some guidance on.
> >
> > 1 - Fedora has always packaged an eu-strip'd vmlinux file for powerpc.
> The
> > other arches we support used native compressed images.  I was looking
> into
> > using powerpc's zImage (pseries) binary to remove the powerpc workarounds
> > in our rpm spec file.
>
> What's the motivation for using the zImage?
>
> My naive hope was that as more advanced boot loaders become the norm we
> could eventually get rid of the zImage.
>
> It's generally a pain to work with, and a bit crufty, it also doesn't
> get as much testing as booting the vmlinux, so I'd be a little wary of
> switching to it.
>

My motivation really is to remove some of manual stripping out of our
specfile and use something more community builtin and address my second
issue.

If zImage isn't the right path to pursue, that is fine by me.  Perhaps I
just want vmlinux.stripped.


> There's also multiple zImages (and others), although admittedly for the
> platforms that Fedora supports the zImage.pseries should work (I think).
>
> > However, the rpmbuild fails because it can't find a build-id with
> > eu-readelf -n zImage.  Sure enough the build-id is found in vmlinux and
> > vmlinux.stripped but disappears with vmlinux.stripped.gz.
>
> Looks like other arches use objcopy rather than strip, maybe that's it?
>
> > I had hoped
> > arch/powerpc/boot/addnote would stick it back in but it doesn't (I am
> > ignorant of how addnote works).
>
> addnote adds some notes that firmware needs to read, it doesn't do
> anything else, though maybe it could.
>
> > eu-readelf -n  data
> > vmlinux:
> >
> > Displaying notes found in: .notes
> >   Owner                Data size        Description
> >   GNU                  0x00000014       NT_GNU_BUILD_ID (unique build ID
> > bitstring)
> >     Build ID: b4c026d72ead7b4316a221cddb7f2b10d75fb313
> >   Linux                0x00000004       func
> >    description data: 00 00 00 00
> >   Linux                0x00000001       OPEN
> >    description data: 00
> >   PowerPC              0x00000004       NT_VERSION (version)
> >    description data: 01 00 00 00
> >
> > zImage:
> >
> > Displaying notes found at file offset 0x00000158 with length 0x0000002c:
> >   Owner                Data size        Description
> >   PowerPC              0x00000018       Unknown note type: (0x00001275)
> >    description data: ff ff ff ff 02 00 00 00 ff ff ff ff ff ff ff ff ff
> ff
> > ff ff 00 00 40 00
> >
> > Displaying notes found at file offset 0x00000184 with length 0x00000044:
> >   Owner                Data size        Description
> >   IBM,RPA-Client-[...] 0x00000020       Unknown note type: (0x12759999)
> >    description data: 00 00 00 00 00 00 00 40 00 00 00 00 00 00 00 28 00
> 00
> > 00 01 ff ff ff ff 00 00 00 00 00 00 00 01
> >
> > Is this something that can be addressed?  Or should I/we expect the
> > build-id to never make it into the zImage and just continue with our
> > current vmlinux process?
>
> Maybe :)
>
> Is it correct for the build-id to be copied into the zImage anyway? It's
> a different binary so shouldn't it have a different build-id?
>
> If you have a zImage and a vmlinux with the same build-id isn't that
> going to confuse debugging tools?
>

My understanding is the debug tools use vmlinux anyway (at least for
Fedora) which is stored in our -debuginfo package.  While the booted image
(compressed) is stored in the traditional kernel rpm.  My understanding is
the build is the same whether compressed or not so having a similar
build-id made sense.  But I am a little ignorant here.



> > 2 - CKI builds kernels using 'make targz-pkg'.  The arches we support
> > (x86_64, s390, aarch64) provide compressed binaries to package using
> > KBUILD_IMAGE or a specific entry in scripts/package/buildtar.  As a
> result,
> > because powerpc doesn't have a KBUILD_IMAGE variable defined, the script
> > builds vmlinx and cp's that to vmlinux-kbuild.  The problem with powerpc
> is
> > that vmlinux for us is huge ( >256MB) and cp'ing that to vmlinux-kbuild
> > occupies > 512MB of /boot and our distro runs out of disk space on that
> > partition.
>
> Is that just because it has debug info built in? I thought the distro
> solution for that was doing split debug info?
>

Yes, our rpm specfile stores vmlinux in -debuginfo and strips vmlinux to
store in the normal kernel rpm.

But our kernel CI service, CKI uses the upstream's 'make targz-pkg' for
easier consumption by the upstream community that may not use rpms.  That
Makefile target doesn't have any stripping.  I was hoping to add that.


>
> > I was hoping to add a patch to arch/powerpc/Makefile that defines
> > KBUILD_IMAGE:=$(boot)/zImage (mimicing arch/s390), which I believe would
> > solve our problem.  However, that circles back to our first problem
> above.
> >
> > Thoughts?  Help?
>

> Happy to try and help, though see my concerns at the top about using
> zImage.
>

If zImage isn't the right approach, would you be open to adding a variable
in arch/powerpc/Makefile

KBUILD_IMAGE:= $(obj)/vmlinux.strip

though I think that file is created and removed while building the zImage.


It is a small tweak, but one I was trying to avoid hacking into our source
code.

Cheers,
Don


> cheers
>
>

--00000000000058fb8005e15a377a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 8, 2022 at 7:52 AM Michae=
l Ellerman &lt;<a href=3D"mailto:mpe@ellerman.id.au">mpe@ellerman.id.au</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Dona=
ld Zickus &lt;<a href=3D"mailto:dzickus@redhat.com" target=3D"_blank">dzick=
us@redhat.com</a>&gt; writes:<br>
&gt; Hi Michael,<br>
&gt;<br>
&gt; I am working on two packaging issues with Fedora and CKI that I am hop=
ing<br>
&gt; you can give me some guidance on.<br>
&gt;<br>
&gt; 1 - Fedora has always packaged an eu-strip&#39;d vmlinux file for powe=
rpc.=C2=A0 The<br>
&gt; other arches we support used native compressed images.=C2=A0 I was loo=
king into<br>
&gt; using powerpc&#39;s zImage (pseries) binary to remove the powerpc work=
arounds<br>
&gt; in our rpm spec file.<br>
<br>
What&#39;s the motivation for using the zImage?<br>
<br>
My naive hope was that as more advanced boot loaders become the norm we<br>
could eventually get rid of the zImage.<br>
<br>
It&#39;s generally a pain to work with, and a bit crufty, it also doesn&#39=
;t<br>
get as much testing as booting the vmlinux, so I&#39;d be a little wary of<=
br>
switching to it.<br></blockquote><div><br></div><div>My motivation really i=
s to remove some of manual stripping out of our specfile and use something =
more community builtin and address my second issue. <br></div><div><br></di=
v><div>If zImage isn&#39;t the right path to pursue, that is fine by me.=C2=
=A0 Perhaps I just want vmlinux.stripped.</div><div><br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
<br>
There&#39;s also multiple zImages (and others), although admittedly for the=
<br>
platforms that Fedora supports the zImage.pseries should work (I think).<br=
>
<br>
&gt; However, the rpmbuild fails because it can&#39;t find a build-id with<=
br>
&gt; eu-readelf -n zImage.=C2=A0 Sure enough the build-id is found in vmlin=
ux and<br>
&gt; vmlinux.stripped but disappears with vmlinux.stripped.gz.<br>
<br>
Looks like other arches use objcopy rather than strip, maybe that&#39;s it?=
<br>
<br>
&gt; I had hoped<br>
&gt; arch/powerpc/boot/addnote would stick it back in but it doesn&#39;t (I=
 am<br>
&gt; ignorant of how addnote works).<br>
<br>
addnote adds some notes that firmware needs to read, it doesn&#39;t do<br>
anything else, though maybe it could.<br>
<br>
&gt; eu-readelf -n=C2=A0 data<br>
&gt; vmlinux:<br>
&gt;<br>
&gt; Displaying notes found in: .notes<br>
&gt;=C2=A0 =C2=A0Owner=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 Data size=C2=A0 =C2=A0 =C2=A0 =C2=A0 Description<br>
&gt;=C2=A0 =C2=A0GNU=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 0x00000014=C2=A0 =C2=A0 =C2=A0 =C2=A0NT_GNU_BUILD_ID (unique build =
ID<br>
&gt; bitstring)<br>
&gt;=C2=A0 =C2=A0 =C2=A0Build ID: b4c026d72ead7b4316a221cddb7f2b10d75fb313<=
br>
&gt;=C2=A0 =C2=A0Linux=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 0x00000004=C2=A0 =C2=A0 =C2=A0 =C2=A0func<br>
&gt;=C2=A0 =C2=A0 description data: 00 00 00 00<br>
&gt;=C2=A0 =C2=A0Linux=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 0x00000001=C2=A0 =C2=A0 =C2=A0 =C2=A0OPEN<br>
&gt;=C2=A0 =C2=A0 description data: 00<br>
&gt;=C2=A0 =C2=A0PowerPC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x=
00000004=C2=A0 =C2=A0 =C2=A0 =C2=A0NT_VERSION (version)<br>
&gt;=C2=A0 =C2=A0 description data: 01 00 00 00<br>
&gt;<br>
&gt; zImage:<br>
&gt;<br>
&gt; Displaying notes found at file offset 0x00000158 with length 0x0000002=
c:<br>
&gt;=C2=A0 =C2=A0Owner=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 Data size=C2=A0 =C2=A0 =C2=A0 =C2=A0 Description<br>
&gt;=C2=A0 =C2=A0PowerPC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x=
00000018=C2=A0 =C2=A0 =C2=A0 =C2=A0Unknown note type: (0x00001275)<br>
&gt;=C2=A0 =C2=A0 description data: ff ff ff ff 02 00 00 00 ff ff ff ff ff =
ff ff ff ff ff<br>
&gt; ff ff 00 00 40 00<br>
&gt;<br>
&gt; Displaying notes found at file offset 0x00000184 with length 0x0000004=
4:<br>
&gt;=C2=A0 =C2=A0Owner=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 Data size=C2=A0 =C2=A0 =C2=A0 =C2=A0 Description<br>
&gt;=C2=A0 =C2=A0IBM,RPA-Client-[...] 0x00000020=C2=A0 =C2=A0 =C2=A0 =C2=A0=
Unknown note type: (0x12759999)<br>
&gt;=C2=A0 =C2=A0 description data: 00 00 00 00 00 00 00 40 00 00 00 00 00 =
00 00 28 00 00<br>
&gt; 00 01 ff ff ff ff 00 00 00 00 00 00 00 01<br>
&gt;<br>
&gt; Is this something that can be addressed?=C2=A0 Or should I/we expect t=
he<br>
&gt; build-id to never make it into the zImage and just continue with our<b=
r>
&gt; current vmlinux process?<br>
<br>
Maybe :)<br>
<br>
Is it correct for the build-id to be copied into the zImage anyway? It&#39;=
s<br>
a different binary so shouldn&#39;t it have a different build-id?<br>
<br>
If you have a zImage and a vmlinux with the same build-id isn&#39;t that<br=
>
going to confuse debugging tools?<br></blockquote><div><br></div><div>My un=
derstanding is the debug tools use vmlinux anyway (at least for Fedora) whi=
ch is stored in our -debuginfo package.=C2=A0 While the booted image (compr=
essed) is stored in the traditional kernel rpm.=C2=A0 My understanding is t=
he build is the same whether compressed or not so having a similar build-id=
 made sense.=C2=A0 But I am a little ignorant here.</div><div><br></div><di=
v><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; 2 - CKI builds kernels using &#39;make targz-pkg&#39;.=C2=A0 The arche=
s we support<br>
&gt; (x86_64, s390, aarch64) provide compressed binaries to package using<b=
r>
&gt; KBUILD_IMAGE or a specific entry in scripts/package/buildtar.=C2=A0 As=
 a result,<br>
&gt; because powerpc doesn&#39;t have a KBUILD_IMAGE variable defined, the =
script<br>
&gt; builds vmlinx and cp&#39;s that to vmlinux-kbuild.=C2=A0 The problem w=
ith powerpc is<br>
&gt; that vmlinux for us is huge ( &gt;256MB) and cp&#39;ing that to vmlinu=
x-kbuild<br>
&gt; occupies &gt; 512MB of /boot and our distro runs out of disk space on =
that<br>
&gt; partition.<br>
<br>
Is that just because it has debug info built in? I thought the distro<br>
solution for that was doing split debug info?<br></blockquote><div><br></di=
v><div>Yes, our rpm specfile stores vmlinux in -debuginfo and strips vmlinu=
x to store in the normal kernel rpm.</div><div><br></div><div>But our kerne=
l CI service, CKI uses the upstream&#39;s &#39;make targz-pkg&#39; for easi=
er consumption by the upstream community that may not use rpms.=C2=A0 That =
Makefile target doesn&#39;t have any stripping.=C2=A0 I was hoping to add t=
hat.</div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
<br>
&gt; I was hoping to add a patch to arch/powerpc/Makefile that defines<br>
&gt; KBUILD_IMAGE:=3D$(boot)/zImage (mimicing arch/s390), which I believe w=
ould<br>
&gt; solve our problem.=C2=A0 However, that circles back to our first probl=
em above.<br>
&gt;<br>
&gt; Thoughts?=C2=A0 Help?<br></blockquote><div></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
<br>
Happy to try and help, though see my concerns at the top about using zImage=
.<br></blockquote><div><br></div><div>If zImage isn&#39;t the right approac=
h, would you be open to adding a variable in arch/powerpc/Makefile</div><di=
v><br></div><div>KBUILD_IMAGE:=3D $(obj)/vmlinux.strip</div><div><br></div>=
<div>though I think that file is created and removed while building the zIm=
age.</div><div><br></div><div><br></div><div>It is a small tweak, but one I=
 was trying to avoid hacking into our source code.</div><div><br></div><div=
>Cheers,</div><div>Don</div><div><br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
<br>
cheers<br>
<br>
</blockquote></div></div>

--00000000000058fb8005e15a377a--

