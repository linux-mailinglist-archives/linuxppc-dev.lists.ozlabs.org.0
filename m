Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8C287E076
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Mar 2024 22:45:47 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lN4N3ode;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TyWkc6Jw8z3dXD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Mar 2024 08:45:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lN4N3ode;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TyWjv4cMGz3c5P
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Mar 2024 08:45:07 +1100 (AEDT)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 42HBUCCC028506;
	Sun, 17 Mar 2024 21:44:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=8fiO5qByXlyhA8tc2VaE9VGmTujXSSNScXyS2MrQZ6Y=;
 b=lN4N3odemdtXs3UflTjoYVIVetmH6U8a9z0DcoBp1dUFTD4JUjF6Lef6Zp6PHosoWx8x
 +x+aIsYoYGQXJpYrBfO8ng7IiNfaYsi7ofzJmthF48QsFlJg4ksQ7JtkoFuSsrWXpKx0
 tjTFO1HuNDrwh2nMJy4d3YIMLhxA0Lf/czlBGXBQ8fX7PxnnJySNJitDWPToim2YnU4c
 JaOh5sEl/7jIe6yFv1aq1gYQYAqurbUasg+yuIPe33ItKfbCal0OBSDeldmf1h3R/AXR
 y77JZMSc6EbPxnyuifTWANoyIWqSYoYd2wRGlg1GF2hwGO7fNWEx+08eKrxw6drL0jMr Vw== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wwtw4mg1w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 17 Mar 2024 21:44:56 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 42HIMV6r017266;
	Sun, 17 Mar 2024 21:44:55 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3wwnrsw3e5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 17 Mar 2024 21:44:55 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 42HLiq8q45875678
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 17 Mar 2024 21:44:54 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1074E2004D;
	Sun, 17 Mar 2024 21:44:52 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2271120040;
	Sun, 17 Mar 2024 21:44:51 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 17 Mar 2024 21:44:51 +0000 (GMT)
Received: from [10.61.2.107] (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 829C46013D;
	Mon, 18 Mar 2024 08:44:49 +1100 (AEDT)
Message-ID: <994d9a81f1ba39924e87f42c34cc16de07ab04ef.camel@linux.ibm.com>
Subject: Re: [PATCH v1 3/3] powerpc/code-patching: Optimise patch_memcpy()
 to 4 byte chunks
From: Benjamin Gray <bgray@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        "linuxppc-dev@lists.ozlabs.org"
	 <linuxppc-dev@lists.ozlabs.org>,
        "mpe@ellerman.id.au" <mpe@ellerman.id.au>
Date: Mon, 18 Mar 2024 08:44:49 +1100
In-Reply-To: <01aba74d-d05b-46f7-9f57-9c7fe6c31578@csgroup.eu>
References: <20240315025736.404867-1-bgray@linux.ibm.com>
	 <20240315025736.404867-3-bgray@linux.ibm.com>
	 <01aba74d-d05b-46f7-9f57-9c7fe6c31578@csgroup.eu>
Autocrypt: addr=bgray@linux.ibm.com; prefer-encrypt=mutual;
 keydata=mDMEYzuwexYJKwYBBAHaRw8BAQdAsgBYEqW6nNaL7i0B3z1RqyMl8ADupDef+5Sfe+JbzeC0I0JlbmphbWluIEdyYXkgPGJncmF5QGxpbnV4LmlibS5jb20+iJMEExYKADsWIQQ9K5v9I+L06Hi4yOJ5xrdpFsvehAUCYzuwewIbAwULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgAAKCRB5xrdpFsvehCiCAP4g7CDkmsakpwv9QxU2D8dophyCIS8meDOQX4/83/sjHgEA5HWbUsbRCpVmeIgu0iNwhw3cmqhkv7ZkBGe3HhHaXg65Ay4EYzuwkREIAJjQ1EDAmLbOENucLy7VUzyNNCHkBirK/+FbjwOW7VIphc8zgsbZ26ZjIu5vC1NY7U7DpOvLAfR0g4+2QeKiQ8EEcuxLhif5X+jsekq0oSTVLcyNYXArJ3mhmV7jRhz8wBueMoXY/k+P3HCVLi4vzroJzN06Hrnmeu5ELlC4MbuvGRTvW751Y/o7gTa6hyyLb2P4pQ+sj/PuIn2Ly1RJPF839HVcOOERkjZ2QZNJnXEhlpfDD7LyRsy9Xm6MxGKRE5VsfjaO+Q8B6ByhXIy5/QK41AF1uSIPBfkZ8+AsBFw8Z87VGQ61tDdzi0U77IdYr98KsgRJ30vHInfKKdSj4csBALzNKjOFmp7dS8mefp3viouy4vWPla8+XZU6ZrRNtD8hB/9FsE7KVTdIBp4xqf6oN1ieTD7PNsQsBQWdDA/rg2bP7IJQkf4Pvn0yoATOFgqhQwadkwT7fwWAfk0YPEE+DPom1V3JwNM6wPaEJeNaMjleqTfAfauLaB9Sc+zJvN5cORrEjSL/0jfJBBdjW5j5BmdUDM1mGuBNVQhGlWHc/Rf7qokMoZAfYiPi/z44rB9zvNfb8t6sVNqHbC2fKRBn/0k8cZ9+qBEIj6vbkqUuih8xNDA+TU+FxPqJxyahqFv+LL9cfZelC0v3D
	mjW5LaBPOdGiiDE1w95Ri9HRK27S2dRZpyib9L4mkfYWPAF41mTudjKmVpgtBLO//rO+zmF04OMB/4sWJhLfvhq1CXULDqw5dcuIAIYwf2ughOtyAPFK1ViDcMO5X1bVpNAFO5m4VBpZvFDQ0j0JfqfVBdL68uH05W1/8dMj76RaWj5m0rLM5slY1FQUPddSU+ic9vaZhlDepjU3ZyI8fmioofNGHaxJq6uNTytKdj87kwDV6PQ4hmuGtY56C7JCgjp053sRJ6sXqgKBWfe4ZOJH17mQm+fws93byLoZvvz4Z3im0Rb0MlFo/WirNyhu+TmTNLpnzFUZfenoKrqAkZLY8u1iCFquhgqA321P+sfYew66DtwQmaoi2GKmF89y2enXXzjLNKfLDKkuVoKxFSPeizYqrLi22R9iO8EGBYKACAWIQQ9K5v9I+L06Hi4yOJ5xrdpFsvehAUCYzuwkQIbAgCBCRB5xrdpFsvehHYgBBkRCAAdFiEESFUlaLYscsf4Dt5gaavCcpI6D/8FAmM7sJEACgkQaavCcpI6D/95UgEAqfSj0QhCrYfazQiLDKJstrz3oIKFjhB6+FYMZqt+K1MA/2ioFtHbypeeWbsqYYRhRyTjAKcvE1NZGtH/YWLgkViUidoBAN6gFX/P+VWB77/w8S/BnPmnJx45wmphlkCL8ckOyopFAQCj9eWamHCl2DSaASMSuoZed6C6Gm0OFtuZh/r8K485BQ==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: JvSUspToVuI2rzauO_48Esw-B9E58JH2
X-Proofpoint-GUID: JvSUspToVuI2rzauO_48Esw-B9E58JH2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-17_12,2024-03-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999
 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2403140000 definitions=main-2403170169
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

On Fri, 2024-03-15 at 06:39 +0000, Christophe Leroy wrote:
>=20
>=20
> Le 15/03/2024 =C3=A0 03:57, Benjamin Gray a =C3=A9crit=C2=A0:
> > As we are patching instructions, we can assume the length is a
> > multiple
> > of 4 and the destination address is aligned.
> >=20
> > Atomicity of patching a prefixed instruction is not a concern, as
> > the
> > original implementation doesn't provide it anyway.
>=20
> This patch looks unnecessary.
>=20
> copy_to_kernel_nofault() is what you want to use instead.

Yeah, I would drop this patch when using copy_to_kernel_nofault()

>=20
> >=20
> > Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
> > ---
> > =C2=A0 arch/powerpc/lib/code-patching.c | 8 ++++----
> > =C2=A0 1 file changed, 4 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/arch/powerpc/lib/code-patching.c
> > b/arch/powerpc/lib/code-patching.c
> > index c6633759b509..ed450a32918c 100644
> > --- a/arch/powerpc/lib/code-patching.c
> > +++ b/arch/powerpc/lib/code-patching.c
> > @@ -394,10 +394,10 @@ static int patch_memset32(u32 *addr, u32 val,
> > size_t count)
> > =C2=A0=C2=A0	return -EPERM;
> > =C2=A0 }
> > =C2=A0=20
> > -static int patch_memcpy(void *dst, void *src, size_t len)
> > +static int patch_memcpy32(u32 *dst, u32 *src, size_t count)
> > =C2=A0 {
> > -	for (void *end =3D src + len; src < end; dst++, src++)
> > -		__put_kernel_nofault(dst, src, u8, failed);
> > +	for (u32 *end =3D src + count; src < end; dst++, src++)
> > +		__put_kernel_nofault(dst, src, u32, failed);
> > =C2=A0=20
> > =C2=A0=C2=A0	return 0;
> > =C2=A0=20
> > @@ -424,7 +424,7 @@ static int __patch_instructions(u32
> > *patch_addr, u32 *code, size_t len, bool rep
> > =C2=A0=C2=A0			err =3D patch_memset32(patch_addr, val, len
> > / 4);
> > =C2=A0=C2=A0		}
> > =C2=A0=C2=A0	} else {
> > -		err =3D patch_memcpy(patch_addr, code, len);
> > +		err =3D patch_memcpy32(patch_addr, code, len / 4);
> > =C2=A0=C2=A0	}
> > =C2=A0=20
> > =C2=A0=C2=A0	smp_wmb();	/* smp write barrier */

