Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A230287E070
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Mar 2024 22:39:46 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NJmJGEVN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TyWbh2pg8z3vYC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Mar 2024 08:39:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NJmJGEVN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TyWZx5ht7z2xLW
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Mar 2024 08:39:05 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 42HI5bcA004374;
	Sun, 17 Mar 2024 21:38:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=cSqeIv5Gyx+PXx0ef4isn6el9LrOCjlN//sTvBDIIAA=;
 b=NJmJGEVN7UwALmX0iy3vsoQIkgnBuEAYcIikWk4ca7AqPKeuqxwvajLs6OpYliH2B1xz
 y5oP1XRoVI7XYOwNEGyMY4cTOkqr4mGWRgwKEwj43V5fra+8jy0dXu10srPHg+tsuhLA
 WAT4UEuIOv4waRncer4Uacj3lf/6IPqRoZKrx8gif7W9cisD3kkxAz8klrDhnyX/QXaw
 VWS+DSyX/L0v8z+D4LDDQNWOy4QWx0SEjpBOSAPjnvDU5vA1kv+ADI4rj7JN9XGQzWV0
 TN7XFtCoDKZNzYWL1xF/s638vdsJH4lUutrrbQm8vEogfiagy/iMmsIOc8taoNQVf2oD Rg== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wwxrnk2k6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 17 Mar 2024 21:38:56 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 42HLMCTw019843;
	Sun, 17 Mar 2024 21:38:56 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3wwqyk4gev-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 17 Mar 2024 21:38:56 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 42HLcqPS34669020
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 17 Mar 2024 21:38:54 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 945262004D;
	Sun, 17 Mar 2024 21:38:52 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BA7F020040;
	Sun, 17 Mar 2024 21:38:51 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 17 Mar 2024 21:38:51 +0000 (GMT)
Received: from [10.61.2.107] (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 4E17060128;
	Mon, 18 Mar 2024 08:38:50 +1100 (AEDT)
Message-ID: <9673db665ac9243e931530bd14ef3d5487d846d6.camel@linux.ibm.com>
Subject: Re: [PATCH v1 1/3] powerpc/code-patching: Test patch_instructions()
 during boot
From: Benjamin Gray <bgray@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        "linuxppc-dev@lists.ozlabs.org"
	 <linuxppc-dev@lists.ozlabs.org>,
        "mpe@ellerman.id.au" <mpe@ellerman.id.au>
Date: Mon, 18 Mar 2024 08:38:50 +1100
In-Reply-To: <701ee036-c32e-4c75-98d1-a46582012eb1@csgroup.eu>
References: <20240315025736.404867-1-bgray@linux.ibm.com>
	 <701ee036-c32e-4c75-98d1-a46582012eb1@csgroup.eu>
Autocrypt: addr=bgray@linux.ibm.com; prefer-encrypt=mutual;
 keydata=mDMEYzuwexYJKwYBBAHaRw8BAQdAsgBYEqW6nNaL7i0B3z1RqyMl8ADupDef+5Sfe+JbzeC0I0JlbmphbWluIEdyYXkgPGJncmF5QGxpbnV4LmlibS5jb20+iJMEExYKADsWIQQ9K5v9I+L06Hi4yOJ5xrdpFsvehAUCYzuwewIbAwULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgAAKCRB5xrdpFsvehCiCAP4g7CDkmsakpwv9QxU2D8dophyCIS8meDOQX4/83/sjHgEA5HWbUsbRCpVmeIgu0iNwhw3cmqhkv7ZkBGe3HhHaXg65Ay4EYzuwkREIAJjQ1EDAmLbOENucLy7VUzyNNCHkBirK/+FbjwOW7VIphc8zgsbZ26ZjIu5vC1NY7U7DpOvLAfR0g4+2QeKiQ8EEcuxLhif5X+jsekq0oSTVLcyNYXArJ3mhmV7jRhz8wBueMoXY/k+P3HCVLi4vzroJzN06Hrnmeu5ELlC4MbuvGRTvW751Y/o7gTa6hyyLb2P4pQ+sj/PuIn2Ly1RJPF839HVcOOERkjZ2QZNJnXEhlpfDD7LyRsy9Xm6MxGKRE5VsfjaO+Q8B6ByhXIy5/QK41AF1uSIPBfkZ8+AsBFw8Z87VGQ61tDdzi0U77IdYr98KsgRJ30vHInfKKdSj4csBALzNKjOFmp7dS8mefp3viouy4vWPla8+XZU6ZrRNtD8hB/9FsE7KVTdIBp4xqf6oN1ieTD7PNsQsBQWdDA/rg2bP7IJQkf4Pvn0yoATOFgqhQwadkwT7fwWAfk0YPEE+DPom1V3JwNM6wPaEJeNaMjleqTfAfauLaB9Sc+zJvN5cORrEjSL/0jfJBBdjW5j5BmdUDM1mGuBNVQhGlWHc/Rf7qokMoZAfYiPi/z44rB9zvNfb8t6sVNqHbC2fKRBn/0k8cZ9+qBEIj6vbkqUuih8xNDA+TU+FxPqJxyahqFv+LL9cfZelC0v3D
	mjW5LaBPOdGiiDE1w95Ri9HRK27S2dRZpyib9L4mkfYWPAF41mTudjKmVpgtBLO//rO+zmF04OMB/4sWJhLfvhq1CXULDqw5dcuIAIYwf2ughOtyAPFK1ViDcMO5X1bVpNAFO5m4VBpZvFDQ0j0JfqfVBdL68uH05W1/8dMj76RaWj5m0rLM5slY1FQUPddSU+ic9vaZhlDepjU3ZyI8fmioofNGHaxJq6uNTytKdj87kwDV6PQ4hmuGtY56C7JCgjp053sRJ6sXqgKBWfe4ZOJH17mQm+fws93byLoZvvz4Z3im0Rb0MlFo/WirNyhu+TmTNLpnzFUZfenoKrqAkZLY8u1iCFquhgqA321P+sfYew66DtwQmaoi2GKmF89y2enXXzjLNKfLDKkuVoKxFSPeizYqrLi22R9iO8EGBYKACAWIQQ9K5v9I+L06Hi4yOJ5xrdpFsvehAUCYzuwkQIbAgCBCRB5xrdpFsvehHYgBBkRCAAdFiEESFUlaLYscsf4Dt5gaavCcpI6D/8FAmM7sJEACgkQaavCcpI6D/95UgEAqfSj0QhCrYfazQiLDKJstrz3oIKFjhB6+FYMZqt+K1MA/2ioFtHbypeeWbsqYYRhRyTjAKcvE1NZGtH/YWLgkViUidoBAN6gFX/P+VWB77/w8S/BnPmnJx45wmphlkCL8ckOyopFAQCj9eWamHCl2DSaASMSuoZed6C6Gm0OFtuZh/r8K485BQ==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: tPax_xy3nhXCAJdWojdh_ODd9XGlaodC
X-Proofpoint-ORIG-GUID: tPax_xy3nhXCAJdWojdh_ODd9XGlaodC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-17_12,2024-03-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 mlxlogscore=999 adultscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 bulkscore=0 spamscore=0
 impostorscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2403140000 definitions=main-2403170168
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

On Fri, 2024-03-15 at 07:14 +0000, Christophe Leroy wrote:
>=20
>=20
> Le 15/03/2024 =C3=A0 03:57, Benjamin Gray a =C3=A9crit=C2=A0:
> > patch_instructions() introduces new behaviour with a couple of
> > variations. Test each case of
> >=20
> > =C2=A0=C2=A0 * a repeated 32-bit instruction,
> > =C2=A0=C2=A0 * a repeated 64-bit instruction (ppc64), and
> > =C2=A0=C2=A0 * a copied sequence of instructions
> >=20
> > for both on a single page and when it crosses a page boundary.
> >=20
> > Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
> > ---
> > =C2=A0 arch/powerpc/lib/test-code-patching.c | 92
> > +++++++++++++++++++++++++++
> > =C2=A0 1 file changed, 92 insertions(+)
> >=20
> > diff --git a/arch/powerpc/lib/test-code-patching.c
> > b/arch/powerpc/lib/test-code-patching.c
> > index c44823292f73..35a3756272df 100644
> > --- a/arch/powerpc/lib/test-code-patching.c
> > +++ b/arch/powerpc/lib/test-code-patching.c
> > @@ -347,6 +347,97 @@ static void __init
> > test_prefixed_patching(void)
> > =C2=A0=C2=A0	check(!memcmp(iptr, expected, sizeof(expected)));
> > =C2=A0 }
> > =C2=A0=20
> > +static void __init test_multi_instruction_patching(void)
> > +{
> > +	u32 code[256];
>=20
> Build failure:
>=20
> =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arch/powerpc/lib/test-code-=
patching.o
> arch/powerpc/lib/test-code-patching.c: In function=20
> 'test_multi_instruction_patching':
> arch/powerpc/lib/test-code-patching.c:439:1: error: the frame size of
> 1040 bytes is larger than 1024 bytes [-Werror=3Dframe-larger-than=3D]
> =C2=A0=C2=A0 439 | }
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | ^
> cc1: all warnings being treated as errors
> make[4]: *** [scripts/Makefile.build:243:=20
> arch/powerpc/lib/test-code-patching.o] Error 1
>=20
>=20
> I have to avoid big arrays on the stack.

All good, I can do that.

I do run my patches through a couple of 32-bit configs, but I didn't
see this error. Is this a standard config I should be testing with?

>=20
>=20
> > +	void *buf;
> > +	u32 *addr32;
> > +	u64 *addr64;
> > +	ppc_inst_t inst64 =3D ppc_inst_prefix(OP_PREFIX << 26 | 3UL
> > << 24, PPC_RAW_TRAP());
> > +	u32 inst32 =3D PPC_RAW_NOP();
> > +
> > +	buf =3D vzalloc(PAGE_SIZE * 8);
> > +	check(buf);
> > +	if (!buf)
> > +		return;
> > +
> > +	/* Test single page 32-bit repeated instruction */
> > +	addr32 =3D buf + PAGE_SIZE;
> > +	check(!patch_instructions(addr32 + 1, &inst32, 12, true));
> > +
> > +	check(addr32[0] =3D=3D 0);
> > +	check(addr32[1] =3D=3D inst32);
> > +	check(addr32[2] =3D=3D inst32);
> > +	check(addr32[3] =3D=3D inst32);
> > +	check(addr32[4] =3D=3D 0);
> > +
> > +	/* Test single page 64-bit repeated instruction */
> > +	if (IS_ENABLED(CONFIG_PPC64)) {
> > +		check(ppc_inst_prefixed(inst64));
> > +
> > +		addr64 =3D buf + PAGE_SIZE * 2;
> > +		ppc_inst_write(code, inst64);
> > +		check(!patch_instructions((u32 *)(addr64 + 1),
> > code, 24, true));
> > +
> > +		check(addr64[0] =3D=3D 0);
> > +		check(ppc_inst_equal(ppc_inst_read((u32
> > *)&addr64[1]), inst64));
> > +		check(ppc_inst_equal(ppc_inst_read((u32
> > *)&addr64[2]), inst64));
> > +		check(ppc_inst_equal(ppc_inst_read((u32
> > *)&addr64[3]), inst64));
> > +		check(addr64[4] =3D=3D 0);
> > +	}
> > +
> > +	/* Test single page memcpy */
> > +	addr32 =3D buf + PAGE_SIZE * 3;
> > +
> > +	for (int i =3D 0; i < ARRAY_SIZE(code); i++)
> > +		code[i] =3D i + 1;
> > +
> > +	check(!patch_instructions(addr32 + 1, code, sizeof(code),
> > false));
> > +
> > +	check(addr32[0] =3D=3D 0);
> > +	check(!memcmp(&addr32[1], code, sizeof(code)));
> > +	check(addr32[ARRAY_SIZE(code) + 1] =3D=3D 0);
> > +
> > +	/* Test multipage 32-bit repeated instruction */
> > +	addr32 =3D buf + PAGE_SIZE * 4 - 8;
> > +	check(!patch_instructions(addr32 + 1, &inst32, 12, true));
> > +
> > +	check(addr32[0] =3D=3D 0);
> > +	check(addr32[1] =3D=3D inst32);
> > +	check(addr32[2] =3D=3D inst32);
> > +	check(addr32[3] =3D=3D inst32);
> > +	check(addr32[4] =3D=3D 0);
> > +
> > +	/* Test multipage 64-bit repeated instruction */
> > +	if (IS_ENABLED(CONFIG_PPC64)) {
> > +		check(ppc_inst_prefixed(inst64));
> > +
> > +		addr64 =3D buf + PAGE_SIZE * 5 - 8;
> > +		ppc_inst_write(code, inst64);
> > +		check(!patch_instructions((u32 *)(addr64 + 1),
> > code, 24, true));
> > +
> > +		check(addr64[0] =3D=3D 0);
> > +		check(ppc_inst_equal(ppc_inst_read((u32
> > *)&addr64[1]), inst64));
> > +		check(ppc_inst_equal(ppc_inst_read((u32
> > *)&addr64[2]), inst64));
> > +		check(ppc_inst_equal(ppc_inst_read((u32
> > *)&addr64[3]), inst64));
> > +		check(addr64[4] =3D=3D 0);
> > +	}
> > +
> > +	/* Test multipage memcpy */
> > +	addr32 =3D buf + PAGE_SIZE * 6 - 12;
> > +
> > +	for (int i =3D 0; i < ARRAY_SIZE(code); i++)
> > +		code[i] =3D i + 1;
> > +
> > +	check(!patch_instructions(addr32 + 1, code, sizeof(code),
> > false));
> > +
> > +	check(addr32[0] =3D=3D 0);
> > +	check(!memcmp(&addr32[1], code, sizeof(code)));
> > +	check(addr32[ARRAY_SIZE(code) + 1] =3D=3D 0);
> > +
> > +	vfree(buf);
> > +}
> > +
> > =C2=A0 static int __init test_code_patching(void)
> > =C2=A0 {
> > =C2=A0=C2=A0	pr_info("Running code patching self-tests ...\n");
> > @@ -356,6 +447,7 @@ static int __init test_code_patching(void)
> > =C2=A0=C2=A0	test_create_function_call();
> > =C2=A0=C2=A0	test_translate_branch();
> > =C2=A0=C2=A0	test_prefixed_patching();
> > +	test_multi_instruction_patching();
> > =C2=A0=20
> > =C2=A0=C2=A0	return 0;
> > =C2=A0 }

