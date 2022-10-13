Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F02E55FD738
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Oct 2022 11:43:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mp4MJ38TWz3drj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Oct 2022 20:43:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=hZx0QgCG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=81.169.146.166; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=hZx0QgCG;
	dkim-atps=neutral
X-Greylist: delayed 96649 seconds by postgrey-1.36 at boromir; Thu, 13 Oct 2022 20:42:19 AEDT
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.166])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mp4LM6QPHz2yQl
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Oct 2022 20:42:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1665654130;
    s=strato-dkim-0002; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=p25XJfA6SWOm2D/HeZZQoE9uKNJGvX+6s9DzTaon1wQ=;
    b=hZx0QgCGyMF70xklWKGQ3+mzU6u31sUSmmFTntTg1dBIksxfrI+nhEfGqgNj1Vx0B4
    4SMwl1I9HyufuMStnZfMQmEe/Oa+cMy4cZmqs4TN5so5+NVWMiYHsRMKoRYZ1UmbKUFD
    CG5IchUGhMAaHuKrEknjHLU/vC95ZEJy83nBhGR0bJbhNIv7vcxy74bmRUmbI+rGoeNh
    xlF/Es/ZZb3F2PED2VAHdtf7Tt5n36tGmZVQh49T2zvT7PYPN5FPqRcZePdrZgRDtNNf
    MFpeJAN6kfvh89QWe7EXJnJlc/OPfhR1RrE7ic5ICoPt34Pz36j9kM5OgcNNXS8fLHa6
    i4FQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7R7bG522bozl37kaui3HwOGhWp+RmNzb4NyZUji/bQ="
X-RZG-CLASS-ID: mo00
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 48.2.0 AUTH)
    with ESMTPSA id j7449ey9D9g9nbR
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Thu, 13 Oct 2022 11:42:09 +0200 (CEST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Mime-Version: 1.0 (1.0)
Subject: Re: Issues with the first PowerPC updates for the kernel 6.1
Date: Thu, 13 Oct 2022 11:42:08 +0200
Message-Id: <0D40FEF9-D87D-42C4-BC31-EC8AE952C1FB@xenosoft.de>
References: <c91416ef-f450-9111-a0b1-4e04070ac309@csgroup.eu>
In-Reply-To: <c91416ef-f450-9111-a0b1-4e04070ac309@csgroup.eu>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
X-Mailer: iPhone Mail (19H12)
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
Cc: Darren Stevens <darren@stevens-zone.net>, Andrew Donnellan <ajd@linux.ibm.com>, mad skateman <madskateman@gmail.com>, npiggin@gmail.com, rmclure@linux.ibm.com, Trevor Dickinson <rtd2@xtra.co.nz>, Olof Johansson <olof@lixom.net>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christophe,

Thanks a lot for your answer. OK, now, I know, that I don=E2=80=99t need to t=
est it. After the boot of the latest git kernel, my system was extremely dam=
aged. Some config files has a size of several gigabytes for example the reso=
lv.conf. I tried to repair this Debian system but without any success.
I copied with dd and Netcat via network another rootfs from another computer=
 to the damaged partition.
I don=E2=80=99t have the time to do it always again and again after a bad bi=
sect result.
I will wait some weeks and try it again.

Cheers,
Christian

> On 13. Oct 2022, at 09:28, Christophe Leroy <christophe.leroy@csgroup.eu> w=
rote:
>=20
> =EF=BB=BF
>=20
>> Le 13/10/2022 =C3=A0 09:03, Christian Zigotzky a =C3=A9crit :
>> Hi Andrew,
>>=20
>> Does this patch also affect 64-bit kernels?
>>=20
>> We use often 32-bit userlands with 64-bit kernels.
>=20
> As far as I understand, it was already correct for 32-bit userlands with=20=

> 64 bit kernels, aka compat.
>=20
> The patch applies the same approach for 32 bit kernels, as explained in=20=

> the commit message : "Fix this by having 32-bit kernels share those=20
> syscall definitions with compat."
>=20
> Christophe
>=20
>>=20
>> Cheers,
>> Christian
>>=20
>>>> On 12. Oct 2022, at 09:56, Andrew Donnellan <ajd@linux.ibm.com> wrote:
>>>=20
>>> =EF=BB=BFOn Wed, 2022-10-12 at 08:51 +0200, Christian Zigotzky wrote:
>>>> Hi All,
>>>>=20
>>>> I use the Nemo board with a PASemi PA6T CPU and have some issues
>>>> since the first PowerPC updates for the kernel 6.1.
>>>>=20
>>>> I successfully compiled the git kernel with the first PowerPC updates
>>>> two days ago.
>>>>=20
>>>> Unfortunately this kernel is really dangerous. Many things for
>>>> example Network Manager and LightDM don't work anymore and produced
>>>> several gigabyte of config files till the partition has been filled.
>>>>=20
>>>> I deleted some files like the resolv.conf that had a size over 200
>>>> GB!
>>>>=20
>>>> Unfortunately, MintPPC was still damaged. For example LightDM doesn't
>>>> work anymore and the MATE desktop doesn't display any icons anymore
>>>> because Caja wasn't able to reserve memory anymore.
>>>>=20
>>>> In this case, bisecting isn't an option and I have to wait some
>>>> weeks. It is really difficult to find the issue if the userland will
>>>> damaged again and again.
>>>=20
>>> Could you try with
>>> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20221012035335.8=
66440-1-npiggin@gmail.com/
>>> to see if your issues are related to that?
>>>=20
>>> Andrew
>>>=20
>>> --=20
>>> Andrew Donnellan    OzLabs, ADL Canberra
>>> ajd@linux.ibm.com   IBM Australia Limited
>>>=20

