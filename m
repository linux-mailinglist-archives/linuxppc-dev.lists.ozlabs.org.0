Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2FE5FFBF7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Oct 2022 23:06:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MqbQy74Pnz2xk6
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 Oct 2022 08:06:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=hsN4X+Mx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.50; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=hsN4X+Mx;
	dkim-atps=neutral
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MqbQ16fgFz2xJM
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 Oct 2022 08:05:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1665867935;
    s=strato-dkim-0002; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=LjM6lRzDYAe5roHknPWgBqRkH+2x6FZgY4Yv8xAjliY=;
    b=hsN4X+Mx1EtoA1gKXyxmVFozfgPznkQkRLq/NR+mQJIx5XpD5M68IDodbohOrkjZXa
    hvLCv5HN/b1rFYHIkTQnwZ1lLp47BS0H65N48CGbeFKeLr5J2oPtVpvGONtq6j/6eaVr
    n5ZriKAjxYRFsMkRXhdLRTDkERPxF+ZIdrV7L/US5uFRa2p86q40QUVVhVWST3ERGHXy
    zdDMHKPD7j/vhH1FfVSnd4WbJTZF/WsNjkcPGww7jsCBM90ucijSvnecrdIYB5fRPfz2
    FgicB76nSbjehLPhcQbTtydaXWv7ZBeziISQI9z+SPE71OAYiBbo+V0PAZeFdMwbxngv
    rFvw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr7gZzRF4Fu6EsCAhrq2bV"
X-RZG-CLASS-ID: mo00
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 48.2.0 AUTH)
    with ESMTPSA id j7449ey9FL5YVCv
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sat, 15 Oct 2022 23:05:34 +0200 (CEST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Mime-Version: 1.0 (1.0)
Subject: Re: Issues with the first PowerPC updates for the kernel 6.1
Date: Sat, 15 Oct 2022 23:05:34 +0200
Message-Id: <79B50086-9F37-4B32-A6D3-77DE4A42148F@xenosoft.de>
References: <15ac95abdde9a466746a3cb468bde2369c038333.camel@linux.ibm.com>
In-Reply-To: <15ac95abdde9a466746a3cb468bde2369c038333.camel@linux.ibm.com>
To: Andrew Donnellan <ajd@linux.ibm.com>
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
Cc: Darren Stevens <darren@stevens-zone.net>, mad skateman <madskateman@gmail.com>, npiggin@gmail.com, rmclure@linux.ibm.com, Trevor Dickinson <rtd2@xtra.co.nz>, Olof Johansson <olof@lixom.net>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 15. Oct 2022, at 11:51, Andrew Donnellan <ajd@linux.ibm.com> wrote:
>=20
> =EF=BB=BFOn Thu, 2022-10-13 at 11:42 +0200, Christian Zigotzky wrote:
>> Hi Christophe,
>>=20
>> Thanks a lot for your answer. OK, now, I know, that I don=E2=80=99t need t=
o
>> test it. After the boot of the latest git kernel, my system was
>> extremely damaged. Some config files has a size of several gigabytes
>> for example the resolv.conf. I tried to repair this Debian system but
>> without any success.
>> I copied with dd and Netcat via network another rootfs from another
>> computer to the damaged partition.
>> I don=E2=80=99t have the time to do it always again and again after a bad=

>> bisect result.
>> I will wait some weeks and try it again.
>=20
> You're right, I was in a rush, saw a processor that wasn't IBM and
> assumed it was 32-bit without thinking too much!
>=20
>=20
> Andrew

Hi Andrew,

Thanks for your answer. Is it possible to fix it?

Thanks,
Christian

>=20
>=20
>>=20
>> Cheers,
>> Christian
>>=20
>>> On 13. Oct 2022, at 09:28, Christophe Leroy <
>>> christophe.leroy@csgroup.eu> wrote:
>>>=20
>>> =EF=BB=BF
>>>=20
>>>>> Le 13/10/2022 =C3=A0 09:03, Christian Zigotzky a =C3=A9crit :
>>>>> Hi Andrew,
>>>>>=20
>>>>> Does this patch also affect 64-bit kernels?
>>>>>=20
>>>>> We use often 32-bit userlands with 64-bit kernels.
>>>=20
>>> As far as I understand, it was already correct for 32-bit userlands
>>> with=20
>>> 64 bit kernels, aka compat.
>>>=20
>>> The patch applies the same approach for 32 bit kernels, as
>>> explained in=20
>>> the commit message : "Fix this by having 32-bit kernels share those
>>> syscall definitions with compat."
>>>=20
>>> Christophe
>>>=20
>>>>=20
>>>> Cheers,
>>>> Christian
>>>>=20
>>>>>> On 12. Oct 2022, at 09:56, Andrew Donnellan <
>>>>>> ajd@linux.ibm.com> wrote:
>>>>>=20
>>>>> =EF=BB=BFOn Wed, 2022-10-12 at 08:51 +0200, Christian Zigotzky wrote:
>>>>>> Hi All,
>>>>>>=20
>>>>>> I use the Nemo board with a PASemi PA6T CPU and have some
>>>>>> issues
>>>>>> since the first PowerPC updates for the kernel 6.1.
>>>>>>=20
>>>>>> I successfully compiled the git kernel with the first PowerPC
>>>>>> updates
>>>>>> two days ago.
>>>>>>=20
>>>>>> Unfortunately this kernel is really dangerous. Many things
>>>>>> for
>>>>>> example Network Manager and LightDM don't work anymore and
>>>>>> produced
>>>>>> several gigabyte of config files till the partition has been
>>>>>> filled.
>>>>>>=20
>>>>>> I deleted some files like the resolv.conf that had a size
>>>>>> over 200
>>>>>> GB!
>>>>>>=20
>>>>>> Unfortunately, MintPPC was still damaged. For example LightDM
>>>>>> doesn't
>>>>>> work anymore and the MATE desktop doesn't display any icons
>>>>>> anymore
>>>>>> because Caja wasn't able to reserve memory anymore.
>>>>>>=20
>>>>>> In this case, bisecting isn't an option and I have to wait
>>>>>> some
>>>>>> weeks. It is really difficult to find the issue if the
>>>>>> userland will
>>>>>> damaged again and again.
>>>>>=20
>>>>> Could you try with
>>>>> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20221012035335=
.866440-1-npiggin@gmail.com/
>>>>> to see if your issues are related to that?
>>>>>=20
>>>>> Andrew
>>>>>=20
>>>>> --=20
>>>>> Andrew Donnellan    OzLabs, ADL Canberra
>>>>> ajd@linux.ibm.com   IBM Australia Limited
>>>>>=20
>>=20
>=20
> --=20
> Andrew Donnellan    OzLabs, ADL Canberra
> ajd@linux.ibm.com   IBM Australia Limited
>=20

