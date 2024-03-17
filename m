Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A40F87E0AA
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Mar 2024 23:24:28 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=q97HRgOd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TyXbG2b4vz3d42
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Mar 2024 09:24:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=q97HRgOd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TyXZT6xMWz2yNX
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Mar 2024 09:23:45 +1100 (AEDT)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 42HDZnAu023453;
	Sun, 17 Mar 2024 22:23:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=EduEWvEw8piY6C+A/+rR5eJ/e3fo6o1j18kTRziv2/4=;
 b=q97HRgOdEnhC/Kv7ZjumQv8CwR5CanGfOYQOye1uW96p5XkvDjIgt5l812NnwLPBrSmj
 P4ZJJuckay0bsDfvfn5Ib5Qs+9Ww4hwBOhJTql0FNRoULLU3jD3C7QJLi8cAFC6L4HUw
 7W3Augm/ysACcKEaX4UdRDlrUm/tXoLCOBZAzDJdMeIRlRUqqeNwaqvLWRvedGXzm3wo
 ufwfwWt+kDhn8iuUMMX/6V+eUvjMNhEB4JAxI9YEHGzz/FW9QAptNKooG+wG7zLOoIm/
 YWD8GYjxMM1fsQxclqoQ+Q8Fq3xKF2K37tpOTmasQsXMD4y91vGv9o/cPEkn+RzjVCEy mA== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wwabeupa9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 17 Mar 2024 22:23:37 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 42HLe4rW002815;
	Sun, 17 Mar 2024 22:23:36 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3wwrf24hay-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 17 Mar 2024 22:23:36 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 42HMNWHT51839386
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 17 Mar 2024 22:23:34 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9BDF620043;
	Sun, 17 Mar 2024 22:23:32 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AE1A120040;
	Sun, 17 Mar 2024 22:23:31 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 17 Mar 2024 22:23:31 +0000 (GMT)
Received: from [10.61.2.107] (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id AFE0660128;
	Mon, 18 Mar 2024 09:23:26 +1100 (AEDT)
Message-ID: <60d38487654911261c1d2f9f8952e0878ab7e071.camel@linux.ibm.com>
Subject: Re: [PATCH v1 1/3] powerpc/code-patching: Test patch_instructions()
 during boot
From: Benjamin Gray <bgray@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        "linuxppc-dev@lists.ozlabs.org"
	 <linuxppc-dev@lists.ozlabs.org>,
        "mpe@ellerman.id.au" <mpe@ellerman.id.au>
Date: Mon, 18 Mar 2024 09:23:26 +1100
In-Reply-To: <9673db665ac9243e931530bd14ef3d5487d846d6.camel@linux.ibm.com>
References: <20240315025736.404867-1-bgray@linux.ibm.com>
	 <701ee036-c32e-4c75-98d1-a46582012eb1@csgroup.eu>
	 <9673db665ac9243e931530bd14ef3d5487d846d6.camel@linux.ibm.com>
Autocrypt: addr=bgray@linux.ibm.com; prefer-encrypt=mutual;
 keydata=mDMEYzuwexYJKwYBBAHaRw8BAQdAsgBYEqW6nNaL7i0B3z1RqyMl8ADupDef+5Sfe+JbzeC0I0JlbmphbWluIEdyYXkgPGJncmF5QGxpbnV4LmlibS5jb20+iJMEExYKADsWIQQ9K5v9I+L06Hi4yOJ5xrdpFsvehAUCYzuwewIbAwULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgAAKCRB5xrdpFsvehCiCAP4g7CDkmsakpwv9QxU2D8dophyCIS8meDOQX4/83/sjHgEA5HWbUsbRCpVmeIgu0iNwhw3cmqhkv7ZkBGe3HhHaXg65Ay4EYzuwkREIAJjQ1EDAmLbOENucLy7VUzyNNCHkBirK/+FbjwOW7VIphc8zgsbZ26ZjIu5vC1NY7U7DpOvLAfR0g4+2QeKiQ8EEcuxLhif5X+jsekq0oSTVLcyNYXArJ3mhmV7jRhz8wBueMoXY/k+P3HCVLi4vzroJzN06Hrnmeu5ELlC4MbuvGRTvW751Y/o7gTa6hyyLb2P4pQ+sj/PuIn2Ly1RJPF839HVcOOERkjZ2QZNJnXEhlpfDD7LyRsy9Xm6MxGKRE5VsfjaO+Q8B6ByhXIy5/QK41AF1uSIPBfkZ8+AsBFw8Z87VGQ61tDdzi0U77IdYr98KsgRJ30vHInfKKdSj4csBALzNKjOFmp7dS8mefp3viouy4vWPla8+XZU6ZrRNtD8hB/9FsE7KVTdIBp4xqf6oN1ieTD7PNsQsBQWdDA/rg2bP7IJQkf4Pvn0yoATOFgqhQwadkwT7fwWAfk0YPEE+DPom1V3JwNM6wPaEJeNaMjleqTfAfauLaB9Sc+zJvN5cORrEjSL/0jfJBBdjW5j5BmdUDM1mGuBNVQhGlWHc/Rf7qokMoZAfYiPi/z44rB9zvNfb8t6sVNqHbC2fKRBn/0k8cZ9+qBEIj6vbkqUuih8xNDA+TU+FxPqJxyahqFv+LL9cfZelC0v3D
	mjW5LaBPOdGiiDE1w95Ri9HRK27S2dRZpyib9L4mkfYWPAF41mTudjKmVpgtBLO//rO+zmF04OMB/4sWJhLfvhq1CXULDqw5dcuIAIYwf2ughOtyAPFK1ViDcMO5X1bVpNAFO5m4VBpZvFDQ0j0JfqfVBdL68uH05W1/8dMj76RaWj5m0rLM5slY1FQUPddSU+ic9vaZhlDepjU3ZyI8fmioofNGHaxJq6uNTytKdj87kwDV6PQ4hmuGtY56C7JCgjp053sRJ6sXqgKBWfe4ZOJH17mQm+fws93byLoZvvz4Z3im0Rb0MlFo/WirNyhu+TmTNLpnzFUZfenoKrqAkZLY8u1iCFquhgqA321P+sfYew66DtwQmaoi2GKmF89y2enXXzjLNKfLDKkuVoKxFSPeizYqrLi22R9iO8EGBYKACAWIQQ9K5v9I+L06Hi4yOJ5xrdpFsvehAUCYzuwkQIbAgCBCRB5xrdpFsvehHYgBBkRCAAdFiEESFUlaLYscsf4Dt5gaavCcpI6D/8FAmM7sJEACgkQaavCcpI6D/95UgEAqfSj0QhCrYfazQiLDKJstrz3oIKFjhB6+FYMZqt+K1MA/2ioFtHbypeeWbsqYYRhRyTjAKcvE1NZGtH/YWLgkViUidoBAN6gFX/P+VWB77/w8S/BnPmnJx45wmphlkCL8ckOyopFAQCj9eWamHCl2DSaASMSuoZed6C6Gm0OFtuZh/r8K485BQ==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: X3wJAc5AyonRkh3hv91JVeIYMNfGCoVZ
X-Proofpoint-ORIG-GUID: X3wJAc5AyonRkh3hv91JVeIYMNfGCoVZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-17_12,2024-03-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 adultscore=0 suspectscore=0
 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2403140000 definitions=main-2403170174
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2024-03-18 at 08:38 +1100, Benjamin Gray wrote:
> On Fri, 2024-03-15 at 07:14 +0000, Christophe Leroy wrote:
> >=20
> >=20
> > Le 15/03/2024 =C3=A0 03:57, Benjamin Gray a =C3=A9crit=C2=A0:
> > > patch_instructions() introduces new behaviour with a couple of
> > > variations. Test each case of
> > >=20
> > > =C2=A0=C2=A0 * a repeated 32-bit instruction,
> > > =C2=A0=C2=A0 * a repeated 64-bit instruction (ppc64), and
> > > =C2=A0=C2=A0 * a copied sequence of instructions
> > >=20
> > > for both on a single page and when it crosses a page boundary.
> > >=20
> > > Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
> > > ---
> > > =C2=A0 arch/powerpc/lib/test-code-patching.c | 92
> > > +++++++++++++++++++++++++++
> > > =C2=A0 1 file changed, 92 insertions(+)
> > >=20
> > > diff --git a/arch/powerpc/lib/test-code-patching.c
> > > b/arch/powerpc/lib/test-code-patching.c
> > > index c44823292f73..35a3756272df 100644
> > > --- a/arch/powerpc/lib/test-code-patching.c
> > > +++ b/arch/powerpc/lib/test-code-patching.c
> > > @@ -347,6 +347,97 @@ static void __init
> > > test_prefixed_patching(void)
> > > =C2=A0=C2=A0	check(!memcmp(iptr, expected, sizeof(expected)));
> > > =C2=A0 }
> > > =C2=A0=20
> > > +static void __init test_multi_instruction_patching(void)
> > > +{
> > > +	u32 code[256];
> >=20
> > Build failure:
> >=20
> > =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arch/powerpc/lib/test-cod=
e-patching.o
> > arch/powerpc/lib/test-code-patching.c: In function=20
> > 'test_multi_instruction_patching':
> > arch/powerpc/lib/test-code-patching.c:439:1: error: the frame size
> > of
> > 1040 bytes is larger than 1024 bytes [-Werror=3Dframe-larger-than=3D]
> > =C2=A0=C2=A0 439 | }
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | ^
> > cc1: all warnings being treated as errors
> > make[4]: *** [scripts/Makefile.build:243:=20
> > arch/powerpc/lib/test-code-patching.o] Error 1
> >=20
> >=20
> > I have to avoid big arrays on the stack.
>=20
> All good, I can do that.
>=20
> I do run my patches through a couple of 32-bit configs, but I didn't
> see this error. Is this a standard config I should be testing with?

Specifically pmac32_defconfig and ppc44x_defconfig
