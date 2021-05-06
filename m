Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D72375D03
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 23:54:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FbnRF0Ygcz309c
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 May 2021 07:54:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=AtvbOwdd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo4-p00-ob.smtp.rzone.de (client-ip=85.215.255.23;
 helo=mo4-p00-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=AtvbOwdd; 
 dkim-atps=neutral
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [85.215.255.23])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FbZvV029Fz300P
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 May 2021 23:59:31 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; t=1620309540; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=JjCFP4VtV0Z1FCj7cnlvCxM/iQdS+h4RX2wiMdzocjdTywBrAg8J4E5o8/nw3skIRJ
 0QIe8Knf/DUs5cPmUdzvgCCmls1R1K5bTkS/PPJ8BtJo0Fx+Mj4vGqP+9xa6bb6HbwFw
 VkTklxbUkI3bIBm3wy6TT9rWbdPJB8AxlmZHGgi+Ba4RCG2+uIpxZXd+foZ9c6s5dJ9j
 YrmBuXC+Xy47eIaLqmkr9t1aMpesbr39SnkTG97e0VFv24wTjos4D6Oognn3A/yiSAV5
 MIzsW8HUsAVKSYLY3KQXMclr+K6bTgOjxS77A1hFdwVHj6Cf98p+iagY7RZozHAoU8Dk
 V42g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1620309540;
 s=strato-dkim-0002; d=strato.com;
 h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
 From:Subject:Sender;
 bh=MfTthyJEvvQsiSH3O5jxq+kKsnipGdddvIlWvIZ/sTo=;
 b=lEkLHoGqSB+WeaWgzNQzB06mlo1fcu929F/Fzcvzx2wMrpd23gG1Z/hz8qHUB/8M0v
 owY/taLPYmo58uEi+zzO0s45suYHR8N810juIkKzRWlKzAAm0N3znMNcCVn5kDS3nLOZ
 0AOg01f/hIsbW/9C0U8gVN9ShMNgytOFzpDNFFU5m5Fy8RmQcNqhYdQnmJkTGCTg1Yt+
 LJq3Vy+/fSEOO9/3ZzGiKBmpbcIgU06AcUzf5PW60k2dnZLFS8Z9sFG6SMCtRY4oIJEV
 j1Vy+QOOdtZ0Ve9iFYBuWIXaJeO+AqRSQrldNXOtlzfjxs60sZRKsfNp+AnTslyiAcrS
 lhZg==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1620309540;
 s=strato-dkim-0002; d=xenosoft.de;
 h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
 From:Subject:Sender;
 bh=MfTthyJEvvQsiSH3O5jxq+kKsnipGdddvIlWvIZ/sTo=;
 b=AtvbOwddHvdNX/scRd6z/QgWJzkoi+c5bKJx7ft5VKOKD09DQGGYroe9cPs/PNNZIF
 1gQkQ3Mx13AQx7CGMN+Y/hjFf/Plkm3eO7+FLxDMDYtiK9vVsxmlrYKuoxVhvscLLlUd
 5Y6g5Ax3GuMo5H9Ea4umbmqfO2asPcHe3LAGNv/byn3sZzPl1F0ey/IX0KdlqS+qwQyM
 gb2A2i8Z/bybzhtobmVnzVXRRdEnyDbQ3AbBPU7BsWZpi0iS3VEZLZnLbD4Za8MZCsw/
 TGSKe31Yk0ARpBDEgKUQYwMNYgy4CSfNfqH39TGJUyVyGDLayF+PD64v+ZdGFwLxx2JW
 VjAA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7R7aWdxjLpjxHFPxZKbaToUWhlh2ylomqGkEIuZkAk="
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2a01:598:d007:6076:ac57:57c:c0c7:3c0a]
 by smtp.strato.de (RZmta 47.25.6 AUTH)
 with ESMTPSA id j00d01x46Dwx624
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 6 May 2021 15:58:59 +0200 (CEST)
Content-Type: multipart/alternative;
 boundary=Apple-Mail-7A341AC6-A75B-4D44-BE0E-91BAD62D6702
Content-Transfer-Encoding: 7bit
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Mime-Version: 1.0 (1.0)
Subject: Re: [FSL P50x0] Xorg always restarts again and again after the the
 PowerPC updates 5.13-1
Date: Thu, 6 May 2021 15:58:58 +0200
Message-Id: <0A8D70F6-CBD4-44FD-9DB1-69097AEB5FA3@xenosoft.de>
References: <1b0134d4-4235-b294-8112-dcd5468564bf@csgroup.eu>
In-Reply-To: <1b0134d4-4235-b294-8112-dcd5468564bf@csgroup.eu>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
X-Mailer: iPhone Mail (18D70)
X-Mailman-Approved-At: Fri, 07 May 2021 07:53:51 +1000
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


--Apple-Mail-7A341AC6-A75B-4D44-BE0E-91BAD62D6702
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

I have started bisecting again.

Link: https://forum.hyperion-entertainment.com/viewtopic.php?p=3D53106#p5310=
6


> On 6. May 2021, at 10:09, Christophe Leroy <christophe.leroy@csgroup.eu> w=
rote:
>=20
> =EF=BB=BFHi,
>=20
>> Le 06/05/2021 =C3=A0 09:56, Christian Zigotzky a =C3=A9crit :
>> Hi Christophe,
>> Ok, so let's summarise from my side.
>> The issue is in the PowerPC updates 5.13-1. I reverted these and after th=
at the issue is gone.
>> We know that only BookE machines are affected. Book3S machines are workin=
g with the PowerPC updates.
>> I think it=E2=80=99s not directly an Xorg issue. It=E2=80=99s more a symp=
tom that Xorg restarts again and again. In my point of view the changes for B=
ookE machines in the PowerPC updates are responsible for this issue.
>> Bisecting costs a lot of time and I don=E2=80=99t have time for my main w=
ork anymore.
>> Bisecting is good but sometime you have to check your code yourself. We k=
now all facts and now it=E2=80=99s time to check the code because of BookE c=
ompatibility.
>> @All
>> You can test it with QEMU as well. I provide some virtual machines and ke=
rnels for testing. Guys, it is really important that you test your changes b=
efore you release them.
>=20
>=20
> So, summary from my side:
>=20
> You popped up telling that commit 887f3ceb51cd was the reason of your prob=
lem. As I am the one who released that commit, I took a look, and identified=
 that 525642624783 should have fixed it.
>=20
> You are working with a 64 bits kernel. My domain is 32 bits kernels.
>=20
> I have no problem at all with corenet64_smp_defconfig booting QEMU with an=
y of the commits you pointed.
>=20
> On my side QEMU doesn't work at all with the configuration you provided, I=
 don't get any output at all on the screen.
>=20
>=20
> So how can we progress ?
>=20
> I know bisecting is not always easy, and for sure you must have spend a lo=
t of time with all those skipped steps. But it provided us good information a=
nyway and I'm sure we could progress quickly if you can do the few tests I s=
uggested in my last email:
>=20
> - Can you check that 887f3ceb51cd with cherry-picked 525642624783 has Xorg=
 working ?
> - Can you bisect between 887f3ceb51cd[good] and 56bec2f9d4d0[bad] to ident=
ify first bad commit that stops after loading the dtb and uImage ?
> - Once that first bad commit is identified, can you check whether the prec=
eeding commit with cherry-picked 525642624783 has Xorg working or not ?
>=20
> Thanks
> Christophe

--Apple-Mail-7A341AC6-A75B-4D44-BE0E-91BAD62D6702
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto">I have started bisecting again.<div><br></d=
iv><div>Link:&nbsp;<a href=3D"https://forum.hyperion-entertainment.com/viewt=
opic.php?p=3D53106#p53106">https://forum.hyperion-entertainment.com/viewtopi=
c.php?p=3D53106#p53106</a><br><br><div dir=3D"ltr"><br><blockquote type=3D"c=
ite">On 6. May 2021, at 10:09, Christophe Leroy &lt;christophe.leroy@csgroup=
.eu&gt; wrote:<br><br></blockquote></div><blockquote type=3D"cite"><div dir=3D=
"ltr">=EF=BB=BF<span>Hi,</span><br><span></span><br><span>Le 06/05/2021 =C3=A0=
 09:56, Christian Zigotzky a =C3=A9crit&nbsp;:</span><br><blockquote type=3D=
"cite"><span>Hi Christophe,</span><br></blockquote><blockquote type=3D"cite"=
><span>Ok, so let's summarise from my side.</span><br></blockquote><blockquo=
te type=3D"cite"><span>The issue is in the PowerPC updates 5.13-1. I reverte=
d these and after that the issue is gone.</span><br></blockquote><blockquote=
 type=3D"cite"><span>We know that only BookE machines are affected. Book3S m=
achines are working with the PowerPC updates.</span><br></blockquote><blockq=
uote type=3D"cite"><span>I think it=E2=80=99s not directly an Xorg issue. It=
=E2=80=99s more a symptom that Xorg restarts again and again. In my point of=
 view the changes for BookE machines in the PowerPC updates are responsible f=
or this issue.</span><br></blockquote><blockquote type=3D"cite"><span>Bisect=
ing costs a lot of time and I don=E2=80=99t have time for my main work anymo=
re.</span><br></blockquote><blockquote type=3D"cite"><span>Bisecting is good=
 but sometime you have to check your code yourself. We know all facts and no=
w it=E2=80=99s time to check the code because of BookE compatibility.</span>=
<br></blockquote><blockquote type=3D"cite"><span>@All</span><br></blockquote=
><blockquote type=3D"cite"><span>You can test it with QEMU as well. I provid=
e some virtual machines and kernels for testing. Guys, it is really importan=
t that you test your changes before you release them.</span><br></blockquote=
><span></span><br><span></span><br><span>So, summary from my side:</span><br=
><span></span><br><span>You popped up telling that commit 887f3ceb51cd was t=
he reason of your problem. As I am the one who released that commit, I took a=
 look, and identified that 525642624783 should have fixed it.</span><br><spa=
n></span><br><span>You are working with a 64 bits kernel. My domain is 32 bi=
ts kernels.</span><br><span></span><br><span>I have no problem at all with c=
orenet64_smp_defconfig booting QEMU with any of the commits you pointed.</sp=
an><br><span></span><br><span>On my side QEMU doesn't work at all with the c=
onfiguration you provided, I don't get any output at all on the screen.</spa=
n><br><span></span><br><span></span><br><span>So how can we progress ?</span=
><br><span></span><br><span>I know bisecting is not always easy, and for sur=
e you must have spend a lot of time with all those skipped steps. But it pro=
vided us good information anyway and I'm sure we could progress quickly if y=
ou can do the few tests I suggested in my last email:</span><br><span></span=
><br><span>- Can you check that 887f3ceb51cd with cherry-picked 525642624783=
 has Xorg working ?</span><br><span>- Can you bisect between 887f3ceb51cd[go=
od] and 56bec2f9d4d0[bad] to identify first bad commit that stops after load=
ing the dtb and uImage ?</span><br><span>- Once that first bad commit is ide=
ntified, can you check whether the preceeding commit with cherry-picked 5256=
42624783 has Xorg working or not ?</span><br><span></span><br><span>Thanks</=
span><br><span>Christophe</span><br></div></blockquote></div></body></html>=

--Apple-Mail-7A341AC6-A75B-4D44-BE0E-91BAD62D6702--
