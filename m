Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 547DF2DEB45
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Dec 2020 22:47:26 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CyMsR42KYzDqXD
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Dec 2020 08:47:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux-powerpc.org (client-ip=2a00:1450:4864:20::634;
 helo=mail-ej1-x634.google.com; envelope-from=kda@linux-powerpc.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-powerpc.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linux-powerpc-org.20150623.gappssmtp.com
 header.i=@linux-powerpc-org.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=iASBSEhj; dkim-atps=neutral
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CyMMq183kzDqWL
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Dec 2020 08:25:07 +1100 (AEDT)
Received: by mail-ej1-x634.google.com with SMTP id j22so5189435eja.13
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Dec 2020 13:25:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-powerpc-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=qdU33s6awzfJTAEq5NkXSmgg5OUu2HQOgM878KutAs8=;
 b=iASBSEhjmdVcfcb0MBwMf3JZzoqprIKBN310SLgMN8LSbT+/r0oNkSkx4c9bWIjlcb
 S57f+lYDq0g0c6DmX76T2Hxu/Ubf8QGK0rp4cJvYun6BSxc0myMm1y/VE1fJRegbDtMt
 A4dUYgB5fIJBZdxjBV288udkd8/PcTM2WTX1mvTjg2DnZOl/pavBMVXh1A4P+VnIsz7c
 6FDAiB8G9RDr23zZZwuAQaZGVK0G3JKuJ0TdsWcBVWU0N142zXVG7F8J8GicIjdBf3HF
 +tbr8F2rK394gYlDOy6XvvKQnN8XyBecJd8Z7P0EDsfzLmG2tH/avsmR8lsiA3ETLI+Q
 v7tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=qdU33s6awzfJTAEq5NkXSmgg5OUu2HQOgM878KutAs8=;
 b=swiy4KMwGfHMJp4N6Dm+HU/mC+RNY1B1Jgp0KlV8jxYAB8sHRdSTgM01I1KNatVuHP
 2K/D2wvgTSXpOhEoBZXvsp8TMJSxeBuLnWEtzvfaLN7/Msok2+EKeIMDiRiRovgUjT5O
 F0CyFffxr/QgyIbkLlEgsHx8G6AN3gux0S5O+vx327z2rzaLcThEJSsArToHcoEvcczC
 GKrOfiBwPu0j2r+nyxQtxp/kg4AdMtNc/SSSoRWb0sAQLPmRvSz3vIGwxbVBBFobDsOS
 RPuhcwVIxaeT9cNVgKqFgZ/m8dDWwtqOXj5jIBhD7lStuRi5aTvQDcyHMktmC3KTma2l
 wK3Q==
X-Gm-Message-State: AOAM5308BJAYkg8+Xs6ooiYl6g9Q5cdFq3M9QQQnbxYGrnNObx8GOp/W
 fjfLWHzEhE6/ow4M04QrdHQvyNH5xIk3Axa1caEZHg==
X-Google-Smtp-Source: ABdhPJyvv4D78oMlwuI6+h8Mle1MxvLghiI4dinH5NMNG+0jh5Kt6wtHkryYG8DxSxQvpydcV08RsPr3fWop7oXqf1I=
X-Received: by 2002:a17:906:cd06:: with SMTP id
 oz6mr5951259ejb.25.1608326703325; 
 Fri, 18 Dec 2020 13:25:03 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a54:3c91:0:0:0:0:0 with HTTP; Fri, 18 Dec 2020 13:25:02
 -0800 (PST)
X-Originating-IP: [2a00:1fa0:406:e1a6:1ed:df38:8f1b:4315]
In-Reply-To: <a546bc22-1e18-8e71-e973-65cf7095594a@xenosoft.de>
References: <a546bc22-1e18-8e71-e973-65cf7095594a@xenosoft.de>
From: Denis Kirjanov <kda@linux-powerpc.org>
Date: Sat, 19 Dec 2020 00:25:02 +0300
Message-ID: <CAOJe8K3+j3kGHYhSfjyywXcSQFca0Y370LiAa2uVsW5znUPsAA@mail.gmail.com>
Subject: Re: GIT kernel with the PowerPC updates 5.11-1 doesn't boot on a FSL
 P5040 board and in a virtual e5500 QEMU machine
To: Christian Zigotzky <chzigotzky@xenosoft.de>
Content-Type: multipart/alternative; boundary="000000000000d5b6d205b6c3bd4d"
X-Mailman-Approved-At: Sat, 19 Dec 2020 08:42:47 +1100
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
Cc: Darren Stevens <darren@stevens-zone.net>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "R.T.Dickinson" <rtd2@xtra.co.nz>, mad skateman <madskateman@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--000000000000d5b6d205b6c3bd4d
Content-Type: text/plain; charset="UTF-8"

On Friday, December 18, 2020, Christian Zigotzky <chzigotzky@xenosoft.de>
wrote:

> Hello,
>
> I compiled the latest Git kernel with the new PowerPC updates 5.11-1 [1]
> today. Unfortunately this kernel doesn't boot on my FSL P5040 board [2] and
> in a virtual e5500 QEMU machine [3].
>
> I was able to revert the new PowerPC updates 5.11-1 [4] and after a new
> compiling, the kernel boots without any problems on my FSL P5040 board.
>
> Please check the new PowerPC updates 5.11-1.


Can you bisect the bad commit?



>
> Thanks,
> Christian
>
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/lin
> ux.git/commit/?id=8a5be36b9303ae167468d4f5e1b3c090b9981396
> [2] http://wiki.amiga.org/index.php?title=X5000
> [3] qemu-system-ppc64 -M ppce500 -cpu e5500 -m 1024 -kernel uImage -drive
> format=raw,file=MintPPC32-X5000.img,index=0,if=virtio -netdev
> user,id=mynet0 -device virtio-net-pci,netdev=mynet0 -append "rw
> root=/dev/vda" -device virtio-vga -usb -device usb-ehci,id=ehci -device
> usb-tablet -device virtio-keyboard-pci -smp 4 -vnc :1
> [4] git revert 8a5be36b9303ae167468d4f5e1b3c090b9981396 -m 1
>

--000000000000d5b6d205b6c3bd4d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>On Friday, December 18, 2020, Christian Zigotzky &lt;<a href=3D"mai=
lto:chzigotzky@xenosoft.de">chzigotzky@xenosoft.de</a>&gt; wrote:<br><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">Hello,<br>
<br>
I compiled the latest Git kernel with the new PowerPC updates 5.11-1 [1] to=
day. Unfortunately this kernel doesn&#39;t boot on my FSL P5040 board [2] a=
nd in a virtual e5500 QEMU machine [3].<br>
<br>
I was able to revert the new PowerPC updates 5.11-1 [4] and after a new com=
piling, the kernel boots without any problems on my FSL P5040 board.<br>
<br>
Please check the new PowerPC updates 5.11-1.</blockquote><div><br></div><di=
v>Can you bisect the bad commit?</div><div><br></div><div>=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">
<br>
Thanks,<br>
Christian<br>
<br>
<br>
[1] <a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/lin=
ux.git/commit/?id=3D8a5be36b9303ae167468d4f5e1b3c090b9981396" target=3D"_bl=
ank">https://git.kernel.org/pub/scm<wbr>/linux/kernel/git/torvalds/lin<wbr>=
ux.git/commit/?id=3D8a5be36b9303<wbr>ae167468d4f5e1b3c090b9981396</a><br>
[2] <a href=3D"http://wiki.amiga.org/index.php?title=3DX5000" target=3D"_bl=
ank">http://wiki.amiga.org/index.ph<wbr>p?title=3DX5000</a><br>
[3] qemu-system-ppc64 -M ppce500 -cpu e5500 -m 1024 -kernel uImage -drive f=
ormat=3Draw,file=3DMintPPC32-X500<wbr>0.img,index=3D0,if=3Dvirtio -netdev u=
ser,id=3Dmynet0 -device virtio-net-pci,netdev=3Dmynet0 -append &quot;rw roo=
t=3D/dev/vda&quot; -device virtio-vga -usb -device usb-ehci,id=3Dehci -devi=
ce usb-tablet -device virtio-keyboard-pci -smp 4 -vnc :1<br>
[4] git revert 8a5be36b9303ae167468d4f5e1b3c0<wbr>90b9981396 -m 1<br>
</blockquote>

--000000000000d5b6d205b6c3bd4d--
