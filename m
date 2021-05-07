Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 058993760A2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 May 2021 08:44:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fc1BS6TcCz308N
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 May 2021 16:44:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=O1D/Yj31;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.52;
 helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=O1D/Yj31; 
 dkim-atps=neutral
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.52])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fc19x5lBCz2yXH
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 May 2021 16:43:32 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; t=1620369801; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=IFw8N0rUAKzI1j7TsJw4X0OlxX9wCflppoc1GTFA/+oxUviaalvVUZFYceQli0SnyQ
 s4mHYnGpEXZlIG0dg2QRmCpv2bVWeXjprgHovImO4oMZ7Lmt+jc2VzkeF8P5EDAq4O39
 VQIX8MTT1bNwdvnHGitM7CfQNfmwetLcX+JEHP71d2H7kRMM7R6HW5iUJ7vMKFKMH5Zq
 jHeKiJuRqWiwITI+BKmha0w93Krdg5xALFNkbPb2JhfU7QhOWjEuxnpFWXFfz0/8JDsT
 FDYYs3oNTUcF2tbO43RGm0sZuYy1exQ41buBQRO6wfW+ThI+zhAREoZ+1IkDoKGHjDkX
 UIUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1620369801;
 s=strato-dkim-0002; d=strato.com;
 h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
 From:Subject:Sender;
 bh=Z4g5xLdo2AUU3hfIJq+UpEKrJf3kQecUTcH9Yk9QqjI=;
 b=EkCaa4BRhDZhnU4cws3cDWBpBh128k6sTRUqNEQUb4XZGIXb36LtGx5seJWvbXRPqW
 FBEP5SZmz3dnoA+pXwmFwYpt1o8aEGtMdRW0HBNHXL29Ys7AiKkChcWCuPWMMEvuj/LN
 igcquwNC6JtqWGVNtHBMRy3qDQSCqmtwIvN0OuIH8O/snIKApcgxtHUuO3rcPLuK5BLt
 shByIGTw1NOHLSJTv2m8rz7/E0c30O0Mbi+/G/GO/xTckC7uH5O50JgGzfJzIfSJY2aE
 KUj7yUjn6GmkpIMloFXsLKKZ6iuEbQcYnTnXssxe8R+zL0AJK01tiCPXaNet8u3+UwLO
 oReQ==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1620369801;
 s=strato-dkim-0002; d=xenosoft.de;
 h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
 From:Subject:Sender;
 bh=Z4g5xLdo2AUU3hfIJq+UpEKrJf3kQecUTcH9Yk9QqjI=;
 b=O1D/Yj31aez6HE2xk7xPdYWN4nto1gTebNz/vbqA0us4uc0myqp4pSD+MKyMWATeY3
 DyYqxPz2m9OqeJQAtUPfrlpxlYL7mVIZsHZAjP59oU3eJ89yoDcUup7DOJfYPjkHkjNe
 DQnah17k7CWDA2gam2AE+LVDZ2JADOk/NapdYutCZLsH6+ze1ZJbgQegP11QuFccZAKY
 mR4A0jYFOljMM0U3/4qvgm+l57Y8CxIeY1caYc0ionnuFZ9yqybQ5y7XqOcyBRoC6xnG
 Hv34BY+QEF3km+LD7HLc3pFNm14lbYBYE5r5CRG+hxvnqMGmC9ry0bGo8s0LJY5Q9eYZ
 5DgQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7R7aWdx2ro2lX6VRVv1hIt0Bw6yRXRdf973HsSmXlXo"
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2a01:598:d00a:ca80:8591:65ad:8e80:a8a0]
 by smtp.strato.de (RZmta 47.25.6 AUTH)
 with ESMTPSA id L0ba16x476hK15A
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 7 May 2021 08:43:20 +0200 (CEST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Mime-Version: 1.0 (1.0)
Subject: Re: Radeon NI: GIT kernel with the nislands_smc commit doesn't boot
 on a Freescale P5040 board and P.A.Semi Nemo board
Date: Fri, 7 May 2021 08:43:19 +0200
Message-Id: <10D1983F-33EF-46C3-976E-463D1CB5A6E9@xenosoft.de>
References: <a1d9e09b-f533-5e2c-7a13-af96647e1a71@embeddedor.com>
In-Reply-To: <a1d9e09b-f533-5e2c-7a13-af96647e1a71@embeddedor.com>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
X-Mailer: iPhone Mail (18D70)
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
Cc: Darren Stevens <darren@stevens-zone.net>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 =?utf-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>, gustavoars@kernel.org,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Olof Johansson <olof@lixom.net>, mad skateman <madskateman@gmail.com>,
 alexander.deucher@amd.com, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Gustavo,

Great! I will test it. Many thanks for your help.

Cheers,
Christian


> On 7. May 2021, at 01:55, Gustavo A. R. Silva <gustavo@embeddedor.com> wro=
te:
>=20
> =EF=BB=BFHi Christian,
>=20
>> On 4/30/21 06:59, Christian Zigotzky wrote:
>> Hello,
>>=20
>> The Nemo board (A-EON AmigaOne X1000) [1] and the FSL P5040 Cyrus+ board (=
A-EON AmigaOne X5000) [2] with installed AMD Radeon HD6970 NI graphics cards=
 (Cayman
>> XT) [3] don't boot with the latest git kernel anymore after the commit "d=
rm/radeon/nislands_smc.h: Replace one-element array with flexible-array memb=
er in
>> struct NISLANDS_SMC_SWSTATE branch" [4].  This git kernel boots in a virt=
ual e5500 QEMU machine with a VirtIO-GPU [5].
>>=20
>> I bisected today [6].
>>=20
>> Result: drm/radeon/nislands_smc.h: Replace one-element array with flexibl=
e-array member in struct NISLANDS_SMC_SWSTATE branch
>> (434fb1e7444a2efc3a4ebd950c7f771ebfcffa31) [4] is the first bad commit.
>=20
> I have a fix ready for this bug:
> https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git/commi=
t/?h=3Dtesting/drm-nislands
>=20
> I wonder if you could help me to test it with your environment, please.
> It should be applied on top of mainline.
>=20
> Thank you!
> --
> Gustavo
>=20
>>=20
>> I was able to revert this commit [7] and after a new compiling, the kerne=
l boots without any problems on my AmigaOnes.
>>=20
>> After that I created a patch for reverting this commit for new git test k=
ernels. [3]
>>=20
>> The kernel compiles and boots with this patch on my AmigaOnes. Please fin=
d attached the kernel config files.
>>=20
>> Please check the first bad commit.
>>=20
>> Thanks,
>> Christian
>>=20
>> [1] https://en.wikipedia.org/wiki/AmigaOne_X1000
>> [2] http://wiki.amiga.org/index.php?title=3DX5000
>> [3] https://forum.hyperion-entertainment.com/viewtopic.php?f=3D35&t=3D437=
7
>> [4] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/co=
mmit/?id=3D434fb1e7444a2efc3a4ebd950c7f771ebfcffa31
>> [5] qemu-system-ppc64 -M ppce500 -cpu e5500 -m 1024 -kernel uImage -drive=
 format=3Draw,file=3DMintPPC32-X5000.img,index=3D0,if=3Dvirtio -netdev user,=
id=3Dmynet0 -device
>> virtio-net-pci,netdev=3Dmynet0 -append "rw root=3D/dev/vda" -device virti=
o-vga -usb -device usb-ehci,id=3Dehci -device usb-tablet -device virtio-keyb=
oard-pci -smp 4
>> -vnc :1
>> [6] https://forum.hyperion-entertainment.com/viewtopic.php?p=3D53074#p530=
74
>> [7] git revert 434fb1e7444a2efc3a4ebd950c7f771ebfcffa3

