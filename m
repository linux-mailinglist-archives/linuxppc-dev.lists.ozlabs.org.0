Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D46D111F13C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Dec 2019 10:51:53 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47ZjVZ4Hk7zDr2s
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Dec 2019 20:51:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=neutral (access neither permitted nor denied)
 smtp.mailfrom=zonnet.nl (client-ip=212.54.42.168;
 helo=smtpq5.tb.mail.iss.as9143.net; envelope-from=jjhdiederen@zonnet.nl;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=zonnet.nl
X-Greylist: delayed 1061 seconds by postgrey-1.36 at bilbo;
 Sat, 14 Dec 2019 20:50:07 AEDT
Received: from smtpq5.tb.mail.iss.as9143.net (smtpq5.tb.mail.iss.as9143.net
 [212.54.42.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47ZjSb23l9zDr1c
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Dec 2019 20:50:05 +1100 (AEDT)
Received: from [212.54.42.136] (helo=smtp12.tb.mail.iss.as9143.net)
 by smtpq5.tb.mail.iss.as9143.net with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.90_1)
 (envelope-from <jjhdiederen@zonnet.nl>)
 id 1ig3mZ-0007hI-7S; Sat, 14 Dec 2019 10:32:15 +0100
Received: from 94-209-172-18.cable.dynamic.v4.ziggo.nl ([94.209.172.18]
 helo=debian) by smtp12.tb.mail.iss.as9143.net with smtp (Exim 4.90_1)
 (envelope-from <jjhdiederen@zonnet.nl>)
 id 1ig3mY-0002wB-U8; Sat, 14 Dec 2019 10:32:15 +0100
Date: Sat, 14 Dec 2019 10:32:13 +0100
From: Jeroen Diederen <jjhdiederen@zonnet.nl>
To: Romain Dolbeau <romain@dolbeau.org>
Subject: Re: PPC64: G5 & 4k/64k page size (was: Re: Call for report -
 G5/PPC970 status)
Message-Id: <20191214103213.309bfbbb1f9c50fe47e733d9@zonnet.nl>
In-Reply-To: <CADuzgbo=Yr09hxrkbkwj7Crg0aUfx+RQZOt0sCSNOeYUfR0SmA@mail.gmail.com>
References: <CADuzgbqYpv40NvAMGjo1cU2cNnij-2p4SYpWgM-Xn0v-8Qapsg@mail.gmail.com>
 <e87e2397-a8d4-c928-d3d4-7ae700603770@physik.fu-berlin.de>
 <CA+7wUsxBkmG-jW_UVBUuMriZbDkJko3kg0hzmMrVMoJLu2+rPw@mail.gmail.com>
 <CADuzgbqoX3DQ6OVqdR6dw1oqnNn-Q0zLPshDi23DwDtYukDYdg@mail.gmail.com>
 <CADuzgboWQtVqp7-Ru4uQQaPerkhLnaS9=WiwX2dD4-5VypT2MA@mail.gmail.com>
 <CADuzgboYv69FQxQRvJ_Bd563OPO0e=USd+cTChfDK60D5x75hw@mail.gmail.com>
 <b2256437-efe1-909d-1488-174b6522f9e0@physik.fu-berlin.de>
 <87eexbk3gw.fsf@linux.ibm.com>
 <CADuzgbq-P8mgf9zLaxhdqUfQcqfRpSzjgRoofF84rp+-S064xg@mail.gmail.com>
 <87mubxl82x.fsf@igel.home>
 <CADuzgbqU-SVy5U_4Pkv2G8SJcT9JhyirhFGamnQusZBSRSgcPw@mail.gmail.com>
 <87immlkytp.fsf@igel.home>
 <CADuzgbo=Yr09hxrkbkwj7Crg0aUfx+RQZOt0sCSNOeYUfR0SmA@mail.gmail.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; powerpc64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-SourceIP: 94.209.172.18
X-Ziggo-spambar: /
X-Ziggo-spamscore: 0.0
X-Ziggo-spamreport: CMAE Analysis: v=2.3 cv=OIFZIhSB c=1 sm=1 tr=0
 a=hX1wvrNIyYTyeNV4br3Ikw==:17 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19
 a=8nJEP1OIZ-IA:10 a=pxVhFHJ0LMsA:10 a=4N9OZ5xKAAAA:8 a=tBb2bbeoAAAA:8
 a=bZG9RO2IwdgYX660zAIA:9 a=wPNLvfGTeEIA:10 a=PVzpVZy-QHXMxH31aWPS:22
 a=Oj-tNtZlA1e06AYgeCfH:22
X-Ziggo-Spam-Status: No
X-Spam-Status: No
X-Spam-Flag: No
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
Cc: Andreas Schwab <schwab@linux-m68k.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 PowerPC List Debian <debian-powerpc@lists.debian.org>,
 linuxppc-dev@lists.ozlabs.org, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

on my iMac iSight:


grep CONFIG_PPC.*PAGE config-5.3.0-3-powerpc64=20
# CONFIG_PPC_4K_PAGES is not set
CONFIG_PPC_64K_PAGES=3Dy
CONFIG_PPC_PAGE_SHIFT=3D16
# CONFIG_PPC_SUBPAGE_PROT is not set

I can't give you info about the G5 PowerMac 7,3 as it is not my machine.

Regards,
Jeroen

On Fri, 13 Dec 2019 08:47:49 +0100
Romain Dolbeau <romain@dolbeau.org> wrote:

> Le jeu. 12 d=E9c. 2019 =E0 22:40, Andreas Schwab <schwab@linux-m68k.org> =
a =E9crit :
> > I'm using 4K pages, in case that matters
>=20
> Yes it does matter, as it seems to be the difference between "working"
> and "not working" :-)
> Thank you for the config & pointing out the culprit!
>=20
> With your config, my machine boots (though it's missing some features
> as the config seems quite tuned).
>=20
> Moving from 64k pages to 4k pages on 'my' config (essentially,
> Debian's 5.3 with default values for changes since), my machine boots
> as well & everything seems to work fine.
>=20
> So question to Aneesh - did you try 64k pages on your G5, or only 4k?
> In the second case, could you try with 64k to see if you can reproduce
> the crash?
>=20
> To Jeroen - is your iMac booting with 4k or 64k pages? Same question
> for the crashing G5, though I assume the answer is going to be 64k
> there.
>=20
> Thanks & cordially,
>=20
> --=20
> Romain Dolbeau


--=20
Jeroen Diederen <jjhdiederen@zonnet.nl>
