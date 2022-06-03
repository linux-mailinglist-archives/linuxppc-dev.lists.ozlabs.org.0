Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFA953D4A3
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Jun 2022 03:31:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LFMfd06xVz3bwZ
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Jun 2022 11:31:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OYpJ061s;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OYpJ061s;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dzickus@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OYpJ061s;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OYpJ061s;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LF45F2D1Tz3bm1
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jun 2022 23:50:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654264201;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=Y63HJJk1SRjd4dxoHB/iiruB75T3wY6xP3XJflL5uao=;
	b=OYpJ061smxO1V7FetDSYhwlLBERJtLEvNgynoqTROuD9U+OgkHah60udQN/sq3Ip8XqKcR
	V/K0jsHKhRbc0PQ+Lae4zIyMp8Kl3W2iJ5Luk30Yf8GHKt+nEVKjyMdU2qdEuvcOpRuB/Y
	yl6T31sDrA107xgXPP+frgA4YDMIWFE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654264201;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=Y63HJJk1SRjd4dxoHB/iiruB75T3wY6xP3XJflL5uao=;
	b=OYpJ061smxO1V7FetDSYhwlLBERJtLEvNgynoqTROuD9U+OgkHah60udQN/sq3Ip8XqKcR
	V/K0jsHKhRbc0PQ+Lae4zIyMp8Kl3W2iJ5Luk30Yf8GHKt+nEVKjyMdU2qdEuvcOpRuB/Y
	yl6T31sDrA107xgXPP+frgA4YDMIWFE=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-91-QQrSCRdXPzy75i9Q6fgL2g-1; Fri, 03 Jun 2022 09:49:57 -0400
X-MC-Unique: QQrSCRdXPzy75i9Q6fgL2g-1
Received: by mail-il1-f200.google.com with SMTP id v1-20020a922e01000000b002d40b2f60e5so943357ile.13
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Jun 2022 06:49:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=Y63HJJk1SRjd4dxoHB/iiruB75T3wY6xP3XJflL5uao=;
        b=YBZ3zj/rZV1xJ5MOvVr6aNiMzgtflR3nLDDWnVyWwtcZS3J+Hvfm+AbSzPbI7AKqaR
         5PNiQvDo7epPCbTRAQQrYLVDVcezgYDeYM/JZInZs9Fb84kSjA7Rif/v3+MbX3MmDOGp
         zNcsXFIG3QoqbQUlir5URYrVzquvY7A7oZrGFiibZSnvKDrpWuJ708CNyy3ppF8s1pIz
         +spxRaLH3LkV7sP2kC7HGQuCWaEgeEF2pogSwodXDsPPa6o8YVC/uJ+QsMNM3QcqXTCt
         6BZtFulaGXt+RrMV4eFnAhWmOaUPGMlAKKpaUAu/ATYVACIHxto3rZEM6H3rF/3Z9t9O
         AB0g==
X-Gm-Message-State: AOAM531Ur3IKIUOE4P/7zhEUIsFVsYBtgvaMPUtbVO0rCH4VmbdifwVi
	kHkKCcCJGbTN8mIoZQvjtFmTK73b08HAJWZCLdLipex8CXCrq9z8sm92GkD1EWf80uzlkb7yda3
	YoIP6BADPv5dbOKXcxY3Y9TzOvpai5AAb9Y/99ubCUw==
X-Received: by 2002:a05:6638:1649:b0:331:1183:7fce with SMTP id a9-20020a056638164900b0033111837fcemr5853780jat.44.1654264196542;
        Fri, 03 Jun 2022 06:49:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwtvcjEr6Gk0cBoPTzvfB1+Xu6aq3iA0+zc/Rz+aQJ2dR2hgSxJDOkXjIeHLyZCwW0SiIEYojSKrtdRl/wduFQ=
X-Received: by 2002:a05:6638:1649:b0:331:1183:7fce with SMTP id
 a9-20020a056638164900b0033111837fcemr5853763jat.44.1654264196257; Fri, 03 Jun
 2022 06:49:56 -0700 (PDT)
MIME-Version: 1.0
From: Donald Zickus <dzickus@redhat.com>
Date: Fri, 3 Jun 2022 09:49:45 -0400
Message-ID: <CAK18DXZKs2PNmLndeGYqkPxmrrBR=6ca3bhyYCj=GhyA7dHfAQ@mail.gmail.com>
Subject: ppc64le bzImage and Build_id elf note
To: mpe@ellerman.id.au
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dzickus@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000c8715505e08b6558"
X-Mailman-Approved-At: Sat, 04 Jun 2022 11:31:02 +1000
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

--000000000000c8715505e08b6558
Content-Type: text/plain; charset="UTF-8"

Hi Michael,

I am working on two packaging issues with Fedora and CKI that I am hoping
you can give me some guidance on.

1 - Fedora has always packaged an eu-strip'd vmlinux file for powerpc.  The
other arches we support used native compressed images.  I was looking into
using powerpc's zImage (pseries) binary to remove the powerpc workarounds
in our rpm spec file.

However, the rpmbuild fails because it can't find a build-id with
eu-readelf -n zImage.  Sure enough the build-id is found in vmlinux and
vmlinux.stripped but disappears with vmlinux.stripped.gz.  I had hoped
arch/powerpc/boot/addnote would stick it back in but it doesn't (I am
ignorant of how addnote works).

eu-readelf -n  data
vmlinux:

Displaying notes found in: .notes
  Owner                Data size        Description
  GNU                  0x00000014       NT_GNU_BUILD_ID (unique build ID
bitstring)
    Build ID: b4c026d72ead7b4316a221cddb7f2b10d75fb313
  Linux                0x00000004       func
   description data: 00 00 00 00
  Linux                0x00000001       OPEN
   description data: 00
  PowerPC              0x00000004       NT_VERSION (version)
   description data: 01 00 00 00

zImage:

Displaying notes found at file offset 0x00000158 with length 0x0000002c:
  Owner                Data size        Description
  PowerPC              0x00000018       Unknown note type: (0x00001275)
   description data: ff ff ff ff 02 00 00 00 ff ff ff ff ff ff ff ff ff ff
ff ff 00 00 40 00

Displaying notes found at file offset 0x00000184 with length 0x00000044:
  Owner                Data size        Description
  IBM,RPA-Client-[...] 0x00000020       Unknown note type: (0x12759999)
   description data: 00 00 00 00 00 00 00 40 00 00 00 00 00 00 00 28 00 00
00 01 ff ff ff ff 00 00 00 00 00 00 00 01

Is this something that can be addressed?  Or should I/we expect the
build-id to never make it into the zImage and just continue with our
current vmlinux process?


2 - CKI builds kernels using 'make targz-pkg'.  The arches we support
(x86_64, s390, aarch64) provide compressed binaries to package using
KBUILD_IMAGE or a specific entry in scripts/package/buildtar.  As a result,
because powerpc doesn't have a KBUILD_IMAGE variable defined, the script
builds vmlinx and cp's that to vmlinux-kbuild.  The problem with powerpc is
that vmlinux for us is huge ( >256MB) and cp'ing that to vmlinux-kbuild
occupies > 512MB of /boot and our distro runs out of disk space on that
partition.

I was hoping to add a patch to arch/powerpc/Makefile that defines
KBUILD_IMAGE:=$(boot)/zImage (mimicing arch/s390), which I believe would
solve our problem.  However, that circles back to our first problem above.

Thoughts?  Help?

Cheers,
Don

--000000000000c8715505e08b6558
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Michael,</div><div><br></div><div>I am working on =
two packaging issues with Fedora and CKI that I am hoping you can give me s=
ome guidance on.</div><div><br></div><div>1 - Fedora has always packaged an=
 eu-strip&#39;d vmlinux file for powerpc.=C2=A0 The other arches we support=
 used native compressed images.=C2=A0 I was looking into using powerpc&#39;=
s zImage (pseries) binary to remove the powerpc workarounds in our rpm spec=
 file.=C2=A0 <br></div><div><br></div><div>However, the rpmbuild fails beca=
use it can&#39;t find a build-id with eu-readelf -n zImage.=C2=A0 Sure enou=
gh the build-id is found in vmlinux and vmlinux.stripped but disappears wit=
h vmlinux.stripped.gz.=C2=A0 I had hoped arch/powerpc/boot/addnote would st=
ick it back in but it doesn&#39;t (I am ignorant of how addnote works).</di=
v><div><br></div><div>eu-readelf -n=C2=A0 data</div><div>vmlinux:<br><br>Di=
splaying notes found in: .notes<br>=C2=A0 Owner =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0Data size =C2=A0 =C2=A0 =C2=A0 =C2=A0Descriptio=
n<br>=C2=A0 GNU =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A00x00000014 =C2=A0 =C2=A0 =C2=A0 NT_GNU_BUILD_ID (unique build ID bitstri=
ng)<br>=C2=A0 =C2=A0 Build ID: b4c026d72ead7b4316a221cddb7f2b10d75fb313<br>=
=C2=A0 Linux =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x00000=
004 =C2=A0 =C2=A0 =C2=A0 func<br>=C2=A0 =C2=A0description data: 00 00 00 00=
<br>=C2=A0 Linux =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x0=
0000001 =C2=A0 =C2=A0 =C2=A0 OPEN<br>=C2=A0 =C2=A0description data: 00<br>=
=C2=A0 PowerPC =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x00000004 =
=C2=A0 =C2=A0 =C2=A0 NT_VERSION (version)<br>=C2=A0 =C2=A0description data:=
 01 00 00 00<br><br>zImage:<br><br>Displaying notes found at file offset 0x=
00000158 with length 0x0000002c:<br>=C2=A0 Owner =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Data size =C2=A0 =C2=A0 =C2=A0 =C2=A0Descrip=
tion<br>=C2=A0 PowerPC =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x00=
000018 =C2=A0 =C2=A0 =C2=A0 Unknown note type: (0x00001275)<br>=C2=A0 =C2=
=A0description data: ff ff ff ff 02 00 00 00 ff ff ff ff ff ff ff ff ff ff =
ff ff 00 00 40 00<br><br>Displaying notes found at file offset 0x00000184 w=
ith length 0x00000044:<br>=C2=A0 Owner =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0Data size =C2=A0 =C2=A0 =C2=A0 =C2=A0Description<br>=C2=
=A0 IBM,RPA-Client-[...] 0x00000020 =C2=A0 =C2=A0 =C2=A0 Unknown note type:=
 (0x12759999)<br>=C2=A0 =C2=A0description data: 00 00 00 00 00 00 00 40 00 =
00 00 00 00 00 00 28 00 00 00 01 ff ff ff ff 00 00 00 00 00 00 00 01</div><=
div><br></div><div>Is this something that can be addressed?=C2=A0 Or should=
 I/we expect the build-id to never make it into the zImage and just continu=
e with our current vmlinux process?</div><div><br></div><div><br></div><div=
>2 - CKI builds kernels using &#39;make targz-pkg&#39;.=C2=A0 The arches we=
 support (x86_64, s390, aarch64) provide compressed binaries to package usi=
ng KBUILD_IMAGE or a specific entry in scripts/package/buildtar.=C2=A0 As a=
 result, because powerpc doesn&#39;t have a KBUILD_IMAGE variable defined, =
the script builds vmlinx and cp&#39;s that to vmlinux-kbuild.=C2=A0 The pro=
blem with powerpc is that vmlinux for us is huge ( &gt;256MB) and cp&#39;in=
g that to vmlinux-kbuild occupies &gt; 512MB of /boot and our distro runs o=
ut of disk space on that partition.</div><div><br></div><div>I was hoping t=
o add a patch to arch/powerpc/Makefile that defines KBUILD_IMAGE:=3D$(boot)=
/zImage (mimicing arch/s390), which I believe would solve our problem.=C2=
=A0 However, that circles back to our first problem above.</div><div><br></=
div><div>Thoughts?=C2=A0 Help?</div><div><br></div><div>Cheers,</div><div>D=
on</div><div><br></div><div><br></div><div><br></div><div><br></div></div>

--000000000000c8715505e08b6558--

