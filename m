Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 496872C9751
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 06:55:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ClWXQ6FfxzDqxB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 16:55:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sukadev@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=GqMRrCRw; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ClWTr2X4RzDqbv
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Dec 2020 16:52:43 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B15WkXl045528; Tue, 1 Dec 2020 00:52:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=pp1;
 bh=PnhNZ34ER7lKCVIeW2+JNwIO4ojOAmJNJffOblTlbDk=;
 b=GqMRrCRwpMkK7vM7xuE9jtjhbZlsiUGwWD5xYqym1zZW1A2jTM5bc5wekRgtj+Bw9EcZ
 jfiga9dNritGEMVq4BFkNnNEjA8Byr9SqQPz/Zo7DPQ7LlDMkwCBW8JBpS2JJFQSlv0n
 SJvnp8VsDyh4puhyIiSVNH11n/oDZ2xJX3st7WYO2hdSSOadjH9jFAYBjjFcB2HHSMzX
 ne03rwD/EHlq9GObT7kB6Q8nBj9Nz98O+pO6kGBauMkhndlZWQq33SF+xSJaDThS03z3
 pAHutReO1yEg3xfl7z3tvlR9SoHNcalmhkmYqxikn6FTuOIdmrAO3+PP37q1/CZ5ENNF 4g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 355ecyjc04-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Dec 2020 00:52:33 -0500
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0B15Wwfo046399;
 Tue, 1 Dec 2020 00:52:32 -0500
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 355ecyjbyw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Dec 2020 00:52:32 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B15pLsn030422;
 Tue, 1 Dec 2020 05:52:32 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma02dal.us.ibm.com with ESMTP id 353e69jtjw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Dec 2020 05:52:32 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B15qVv69700094
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Dec 2020 05:52:31 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 48FDCAE05F;
 Tue,  1 Dec 2020 05:52:31 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 23048AE05C;
 Tue,  1 Dec 2020 05:52:31 +0000 (GMT)
Received: from suka-w540.localdomain (unknown [9.85.149.157])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  1 Dec 2020 05:52:31 +0000 (GMT)
Received: by suka-w540.localdomain (Postfix, from userid 1000)
 id 5BC8C2E123B; Mon, 30 Nov 2020 21:52:28 -0800 (PST)
Date: Mon, 30 Nov 2020 21:52:28 -0800
From: Sukadev Bhattiprolu <sukadev@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: CONFIG_PPC_VAS depends on 64k pages...?
Message-ID: <20201201055228.GA2213889@us.ibm.com>
References: <7171078.EvYhyI6sBW@sheen>
 <2b234a7e-e9f6-d02b-a20f-74c0cc1df8d3@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <2b234a7e-e9f6-d02b-a20f-74c0cc1df8d3@csgroup.eu>
X-Operating-System: Linux 2.0.32 on an i486
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-30_12:2020-11-30,
 2020-11-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0
 phishscore=0 mlxlogscore=999 spamscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012010037
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
Cc: daniel@octaforge.org, haren@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 Will Springer <skirmisher@protonmail.com>, abali@us.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Christophe Leroy [christophe.leroy@csgroup.eu] wrote:
> Hi,
>=20
> Le 19/11/2020 =E0 11:58, Will Springer a =E9crit=A0:
> > I learned about the POWER9 gzip accelerator a few months ago when the
> > support hit upstream Linux 5.8. However, for some reason the Kconfig
> > dictates that VAS depends on a 64k page size, which is problematic as I
> > run Void Linux, which uses a 4k-page kernel.
> >=20
> > Some early poking by others indicated there wasn't an obvious page size
> > dependency in the code, and suggested I try modifying the config to swi=
tch
> > it on. I did so, but was stopped by a minor complaint of an "unexpected=
 DT
> > configuration" by the VAS code. I wasn't equipped to figure out exactly=
 what
> > this meant, even after finding the offending condition, so after writin=
g a
> > very drawn-out forum post asking for help, I dropped the subject.
> >=20
> > Fast forward to today, when I was reminded of the whole thing again, and
> > decided to debug a bit further. Apparently the VAS platform device
> > (derived from the DT node) has 5 resources on my 4k kernel, instead of 4
> > (which evidently works for others who have had success on 64k kernels).=
 I
> > have no idea what this means in practice (I don't know how to introspect
> > it), but after making a tiny patch[1], everything came up smoothly and I
> > was doing blazing-fast gzip (de)compression in no time.
> >=20
> > Everything seems to work fine on 4k pages. So, what's up? Are there
> > pitfalls lurking around that I've yet to stumble over? More reasonably,
> > I'm curious as to why the feature supposedly depends on 64k pages, or if
> > there's anything else I should be concerned about.

Will,

The reason I put in that config check is because we were only able to
test 64K pages at that point.

It is interesting that it is working for you. Following code in skiboot
https://github.com/open-power/skiboot/blob/master/hw/vas.c should restrict
it to 64K pages. IIRC there is also a corresponding change in some NX=20
registers that should also be configured to allow 4K pages.


	static int init_north_ctl(struct proc_chip *chip)
	{
		uint64_t val =3D 0ULL;

		val =3D SETFIELD(VAS_64K_MODE_MASK, val, true);
		val =3D SETFIELD(VAS_ACCEPT_PASTE_MASK, val, true);
		val =3D SETFIELD(VAS_ENABLE_WC_MMIO_BAR, val, true);
		val =3D SETFIELD(VAS_ENABLE_UWC_MMIO_BAR, val, true);
		val =3D SETFIELD(VAS_ENABLE_RMA_MMIO_BAR, val, true);

		return vas_scom_write(chip, VAS_MISC_N_CTL, val);
	}

I am copying Bulent Albali and Haren Myneni who have been working with
VAS/NX for their thoughts/experience.

> >=20
>=20
> Maybe ask Sukadev who did the implementation and is maintaining it ?
>=20
> > I do have to say I'm quite satisfied with the results of the NX
> > accelerator, though. Being able to shuffle data to a RaptorCS box over =
gigE
> > and get compressed data back faster than most software gzip could ever
> > hope to achieve is no small feat, let alone the instantaneous results l=
ocally.
> > :)
> >=20
> > Cheers,
> > Will Springer [she/her]
> >=20
> > [1]: https://github.com/Skirmisher/void-packages/blob/vas-4k-pages/srcp=
kgs/linux5.9/patches/ppc-vas-on-4k.patch
> >=20
>=20
>=20
> Christophe
