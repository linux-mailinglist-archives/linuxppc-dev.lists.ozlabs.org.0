Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22744375078
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 09:58:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FbQt70Zktz3bT5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 17:57:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=JbJOH2RP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo4-p00-ob.smtp.rzone.de (client-ip=85.215.255.24;
 helo=mo4-p00-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=JbJOH2RP; 
 dkim-atps=neutral
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [85.215.255.24])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FbQsc1Jrbz2xb7
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 May 2021 17:57:22 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; t=1620287806; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=YxFCWgu3Etn+Er8aA4klvvgz62mydeubYGrWDtjKHYmGOM9es6JaXtC2JPkFJ3QcY7
 FPnC3iYYpLNFe9vDGgSylJF/qTN1IpOLl57l3e91jKhIFC78u15+j8FtnFdHvwGoHR5j
 a10A9i3Px0SmyvHO1LJ4f2Opnvbc8qMpQ06QD7UQmuvJJ4S/W0HO8EMwJHLHOVCFsz8J
 ctYZ9sjXsMYvFs890wouXzdzu1PEd3jvO/r0ZpgRgthQANC8bzf0D/GyCmHkVtNnooHM
 3Zjs/RufPjqcUIU2EDeQOhMl5FuVweOybeAvLHoQoAZapdfLlFr24mmytG+LcHbTFL/r
 vlMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1620287806;
 s=strato-dkim-0002; d=strato.com;
 h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
 From:Subject:Sender;
 bh=7i/r0XCm3mzZI5F975Xfr+ha75/fJg9e4/l6mK88RyE=;
 b=D0sq5SaZk7TIA2mVtESwTGB5/TC7sv0dNSrYEn3mFptU0vmCFX4XjEdTOj8dXo4Rqd
 0u8nYuqo+oo9ga0O3L6ei9Coux+gJ+HHDJeqj72n86Sd8YkjVugf6oD0mQ35mcwzfiTK
 b9ujb/jcyQTsylbqFJFLZLhiy9SWW1Rc0awWQKvrMy0gmt80PAK8E2VtLLSC0M2KdTwU
 ZtY7Z2xwzNHW5638HBh2qxNVzJ7rbDTJJFdh+eSN1n61Wxi7spP7fVmjsegMGoBYjDPp
 FjpgBptU2sPO+pzbKr5UbZ9/2dBJuJg/fhqN4tBTbsmB5v/B6GA1qTsYgxWAP4fekXFx
 FliA==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1620287806;
 s=strato-dkim-0002; d=xenosoft.de;
 h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
 From:Subject:Sender;
 bh=7i/r0XCm3mzZI5F975Xfr+ha75/fJg9e4/l6mK88RyE=;
 b=JbJOH2RPWgtMvmPAhvgclQ59Kdrb9C0JDQuqY+NYp6MwkQxqRtymDSTxlre4ryA9zD
 Bm33h9jx6rzDdbrPsgtgc14tXN7nVMJ1NK9hIyMEKmzbsN2YRu1aboAEiJZeMXgUo7Ol
 Pmql2/ndEpFgipq44JVXSRQzsLj/2pavgsTg/439P5y1wQ26pHL2OmELg5ENfuGSb+Gn
 jMh9zipUVqvmHKfFZtZz1B3QbgDb50JLJNFrM18PV0osHxYKKDaLAqNc1CewttMaQg3m
 amGPe/v7K/kxOgzEJWanm1k6+YoeJN2lQezR53heRQA4GoII1pMMZA/mazw/YaXCVAfO
 Nkzg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7R7b2ZxjbpixnA4Oaknk+D4jv96DpL1ULazfR79yq6r"
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2a01:598:b106:7261:e8a4:107d:afbb:ba79]
 by smtp.strato.de (RZmta 47.25.6 AUTH)
 with ESMTPSA id j00d01x467uj3qN
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 6 May 2021 09:56:45 +0200 (CEST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Mime-Version: 1.0 (1.0)
Subject: Re: [FSL P50x0] Xorg always restarts again and again after the the
 PowerPC updates 5.13-1
Date: Thu, 6 May 2021 09:56:44 +0200
Message-Id: <B67668EF-EDC8-45F9-A340-5B453065166C@xenosoft.de>
References: <b5a2b9b7-6f1e-8dcb-8466-053b8ff8241d@csgroup.eu>
In-Reply-To: <b5a2b9b7-6f1e-8dcb-8466-053b8ff8241d@csgroup.eu>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
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
 mad skateman <madskateman@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christophe,

Ok, so let's summarise from my side.

The issue is in the PowerPC updates 5.13-1. I reverted these and after that t=
he issue is gone.
We know that only BookE machines are affected. Book3S machines are working w=
ith the PowerPC updates.
I think it=E2=80=99s not directly an Xorg issue. It=E2=80=99s more a symptom=
 that Xorg restarts again and again. In my point of view the changes for Boo=
kE machines in the PowerPC updates are responsible for this issue.
Bisecting costs a lot of time and I don=E2=80=99t have time for my main work=
 anymore.
Bisecting is good but sometime you have to check your code yourself. We know=
 all facts and now it=E2=80=99s time to check the code because of BookE comp=
atibility.

@All
You can test it with QEMU as well. I provide some virtual machines and kerne=
ls for testing. Guys, it is really important that you test your changes befo=
re you release them.

Thanks,
Christian

> On 6. May 2021, at 08:13, Christophe Leroy <christophe.leroy@csgroup.eu> w=
rote:
>=20
> =EF=BB=BF
>=20
>> Le 05/05/2021 =C3=A0 14:43, Christian Zigotzky a =C3=A9crit :
>>> On 04 May 2021 at 05:17pm, Christophe Leroy wrote:
>>> Le 04/05/2021 =C3=A0 16:59, Christian Zigotzky a =C3=A9crit :
>>>> On 04 May 2021 at 04:41pm Christophe Leroy wrote:
>>>>> Le 04/05/2021 =C3=A0 13:02, Christian Zigotzky a =C3=A9crit :
>>>>>> On 04 May 2021 at 12:07pm, Christian Zigotzky wrote:
>>>>>>> On 04 May 2021 at 11:49am, Christophe Leroy wrote:
>>>>>>>=20
>>>>>>> I am bisecting currently.
>>>>>>>=20
>>>>>>> $ git bisect start -- arch/powerpc
>>>>>>> $ git bisect good 887f3ceb51cd3~
>>>>>>> $ git bisect bad c70a4be130de333ea079c59da41cc959712bb01c
>>>>>> OK, there is another issue after the second bisecting step. The boot s=
tops after loading the dtb and uImage file. I can't solve 2 issues with bise=
cting at the same time.
>>>>>=20
>>>>> In that case, you can use 'git bisect skip' to skip the one that is no=
t booting at all.
>>>> In my point of view 'git bisect skip' isn't a good idea because I will n=
ot find out if the skipped commit is good or bad and maybe the first bad com=
mit.
>>>=20
>>> The second problem may be completely unrelated to the first one so it co=
uld work.
>>>=20
>>> In any case, if 'git bisect' finds out that the bad commit is in the mid=
dle of a skipped area, it will tell you. So I think it is worth it.
>>>=20
>>> The second solution could be to first focus on that 'boot stops after lo=
ading problem' and try to find out which commit introduces the bug, then whi=
ch one fixes it. But it may not be necessary.
>>>=20
>>> Other solution, as you were thinking that the conversion of 'booke' to C=
 interrupt entry/exit, you can also try around that: See if d738ee8 has the p=
roblem and 2e2a441 doesn't have the problem.
>>>=20
>>> If so, you can bisect between those two commits (There are 8 commits inb=
etween).
>> Hi Christophe,
>> I am bisecting with skipping the boot issue currently. Unfortunately it s=
eems there is another bug. I had to skip two times because the kernel didn't=
 compile.
>=20
>> Should I continue bisecting?
>> You can find the other steps (21 and higher) here: https://forum.hyperion=
-entertainment.com/viewtopic.php?p=3D53103#p53103
>=20
> Ok, so let's summarise:
>=20
> 887f3ceb51cd =3D Xorg doesn't work
> 887f3ceb51cd is the "first bad commit" identified by your first "bisect"
> 887f3ceb51cd~ =3D 627b72bee84d works ok
> c70a4be130de =3D Xorg doesn't work
>=20
> Can you check that 887f3ceb51cd with cherry-picked 525642624783 has Xorg w=
orking ?
>=20
> Can you provide 'git bisect log' ?
>=20
> It seems there is some mismatch between the commit and the description. Fo=
r instance, you say fd6db2892eba and 14b3c9d24a7a don't build. I see no reas=
on for that, I agree there is that build failure but with dc6231821a14, 0c24=
72de23ae, 3db8aa10de9a and 097157e16cf8. That is fixed by ceff77efa4f8. Note=
 that that build failure should not occur if you have CONFIG_CONTEXT_TRACKIN=
G, but it is not our problem for the time being.
>=20
> Anyway, what I learn from your details is:
>=20
> 56bec2f9d4d0 is the first one you tested which stops after loading the dtb=
 and uImage.
>=20
> Can you bisect between 887f3ceb51cd[good] and 56bec2f9d4d0[bad] to identif=
y first bad commit that stops after loading the dtb and uImage ?
>=20
> Once that first bad commit is identified, can you check whether the precee=
ding commit with cherry-picked 525642624783 has Xorg working or not ?
>=20
>=20
> ceff77efa4f8 is the last one you tested which stops after loading the dtb a=
nd uImage.
> 49c1d07fd04f is bad (Xorg not working)
>=20
> Can you bisect between ceff77efa4f8[good] and 49c1d07fd04f[bad] to identif=
y first commit that doesn't stop after loading the dtb and uImage ? (Here yo=
u have to make a mental exercice:
> the ones that stop after loading dtb/uImage are the 'good' and the ones bo=
oting OK are the 'bad')
>=20
> Once you have found out what breaks booting and what makes it work again, t=
hen we should be able to progress on the investigation.
>=20
> Thanks
> Christophe

