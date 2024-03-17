Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E03AD87E073
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Mar 2024 22:43:37 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aOyDNAG6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TyWh74hQ1z3vYB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Mar 2024 08:43:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aOyDNAG6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TyWgQ6Qk3z2xdg
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Mar 2024 08:42:58 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 42HARLgR006254;
	Sun, 17 Mar 2024 21:42:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=32l/oWdwS0f8dobh3SRwswvURDxo2yuyJxSOplLBq6Y=;
 b=aOyDNAG6BLJ9uSYNvMvAIgb5JWXBlTS/bHCrWnDAGGljIaWPJlTBqUbriF6+wbEGRcus
 ammyn93RD7ZYM2c/DaQyJd4ToefcDMjq0R8zF3OS63NtpbtUfpAFfgbOvD3oA/yFKcu+
 Oue6Y9c+Ys2n8fFb+zxMhvaZ61/dpO8RTUBi+nJRqK2R7H4swBXyDR+zGqPI9nAgFCYW
 JQnq7dzv3R6xd05n8wUorqHabOvF4ZbXxVzmuwPchHcSQ7AegXYQ8UAct64QeA+UXWOO
 Xfk8sod3RomMy1dCjh24un67pYsx2bCgB8mPYabn5c8vQtFVTJNIelqOIhXXjYG8Krp5 Ug== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wwxrnk34r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 17 Mar 2024 21:42:50 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 42HJt4RR022245;
	Sun, 17 Mar 2024 21:42:50 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3wwprnmusj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 17 Mar 2024 21:42:50 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 42HLgkHN38994326
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 17 Mar 2024 21:42:48 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4DA9F20043;
	Sun, 17 Mar 2024 21:42:46 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 715DA20040;
	Sun, 17 Mar 2024 21:42:45 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 17 Mar 2024 21:42:45 +0000 (GMT)
Received: from [10.61.2.107] (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 8D71660128;
	Mon, 18 Mar 2024 08:42:43 +1100 (AEDT)
Message-ID: <a01524cc16eebd6658084666e6c4ac350a9b76bb.camel@linux.ibm.com>
Subject: Re: [PATCH v1 2/3] powerpc/code-patching: Use dedicated memory
 routines for patching
From: Benjamin Gray <bgray@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        "linuxppc-dev@lists.ozlabs.org"
	 <linuxppc-dev@lists.ozlabs.org>,
        "mpe@ellerman.id.au" <mpe@ellerman.id.au>
Date: Mon, 18 Mar 2024 08:42:43 +1100
In-Reply-To: <27cc5332-7431-450e-8433-9ac6c6a864a2@csgroup.eu>
References: <20240315025736.404867-1-bgray@linux.ibm.com>
	 <20240315025736.404867-2-bgray@linux.ibm.com>
	 <27cc5332-7431-450e-8433-9ac6c6a864a2@csgroup.eu>
Autocrypt: addr=bgray@linux.ibm.com; prefer-encrypt=mutual;
 keydata=mDMEYzuwexYJKwYBBAHaRw8BAQdAsgBYEqW6nNaL7i0B3z1RqyMl8ADupDef+5Sfe+JbzeC0I0JlbmphbWluIEdyYXkgPGJncmF5QGxpbnV4LmlibS5jb20+iJMEExYKADsWIQQ9K5v9I+L06Hi4yOJ5xrdpFsvehAUCYzuwewIbAwULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgAAKCRB5xrdpFsvehCiCAP4g7CDkmsakpwv9QxU2D8dophyCIS8meDOQX4/83/sjHgEA5HWbUsbRCpVmeIgu0iNwhw3cmqhkv7ZkBGe3HhHaXg65Ay4EYzuwkREIAJjQ1EDAmLbOENucLy7VUzyNNCHkBirK/+FbjwOW7VIphc8zgsbZ26ZjIu5vC1NY7U7DpOvLAfR0g4+2QeKiQ8EEcuxLhif5X+jsekq0oSTVLcyNYXArJ3mhmV7jRhz8wBueMoXY/k+P3HCVLi4vzroJzN06Hrnmeu5ELlC4MbuvGRTvW751Y/o7gTa6hyyLb2P4pQ+sj/PuIn2Ly1RJPF839HVcOOERkjZ2QZNJnXEhlpfDD7LyRsy9Xm6MxGKRE5VsfjaO+Q8B6ByhXIy5/QK41AF1uSIPBfkZ8+AsBFw8Z87VGQ61tDdzi0U77IdYr98KsgRJ30vHInfKKdSj4csBALzNKjOFmp7dS8mefp3viouy4vWPla8+XZU6ZrRNtD8hB/9FsE7KVTdIBp4xqf6oN1ieTD7PNsQsBQWdDA/rg2bP7IJQkf4Pvn0yoATOFgqhQwadkwT7fwWAfk0YPEE+DPom1V3JwNM6wPaEJeNaMjleqTfAfauLaB9Sc+zJvN5cORrEjSL/0jfJBBdjW5j5BmdUDM1mGuBNVQhGlWHc/Rf7qokMoZAfYiPi/z44rB9zvNfb8t6sVNqHbC2fKRBn/0k8cZ9+qBEIj6vbkqUuih8xNDA+TU+FxPqJxyahqFv+LL9cfZelC0v3D
	mjW5LaBPOdGiiDE1w95Ri9HRK27S2dRZpyib9L4mkfYWPAF41mTudjKmVpgtBLO//rO+zmF04OMB/4sWJhLfvhq1CXULDqw5dcuIAIYwf2ughOtyAPFK1ViDcMO5X1bVpNAFO5m4VBpZvFDQ0j0JfqfVBdL68uH05W1/8dMj76RaWj5m0rLM5slY1FQUPddSU+ic9vaZhlDepjU3ZyI8fmioofNGHaxJq6uNTytKdj87kwDV6PQ4hmuGtY56C7JCgjp053sRJ6sXqgKBWfe4ZOJH17mQm+fws93byLoZvvz4Z3im0Rb0MlFo/WirNyhu+TmTNLpnzFUZfenoKrqAkZLY8u1iCFquhgqA321P+sfYew66DtwQmaoi2GKmF89y2enXXzjLNKfLDKkuVoKxFSPeizYqrLi22R9iO8EGBYKACAWIQQ9K5v9I+L06Hi4yOJ5xrdpFsvehAUCYzuwkQIbAgCBCRB5xrdpFsvehHYgBBkRCAAdFiEESFUlaLYscsf4Dt5gaavCcpI6D/8FAmM7sJEACgkQaavCcpI6D/95UgEAqfSj0QhCrYfazQiLDKJstrz3oIKFjhB6+FYMZqt+K1MA/2ioFtHbypeeWbsqYYRhRyTjAKcvE1NZGtH/YWLgkViUidoBAN6gFX/P+VWB77/w8S/BnPmnJx45wmphlkCL8ckOyopFAQCj9eWamHCl2DSaASMSuoZed6C6Gm0OFtuZh/r8K485BQ==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Lb7nrxZ3Cjsnt-QhXNg4lboOo9tEYLBu
X-Proofpoint-ORIG-GUID: Lb7nrxZ3Cjsnt-QhXNg4lboOo9tEYLBu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-17_12,2024-03-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 mlxlogscore=999 adultscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 bulkscore=0 spamscore=0
 impostorscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2403140000 definitions=main-2403170169
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

On Fri, 2024-03-15 at 06:36 +0000, Christophe Leroy wrote:
>=20
>=20
> Le 15/03/2024 =C3=A0 03:57, Benjamin Gray a =C3=A9crit=C2=A0:
> > The patching page set up as a writable alias may be in quadrant 1
> > (userspace) if the temporary mm path is used. This causes sanitiser
> > failures if so. Sanitiser failures also occur on the non-mm path
> > because the plain memset family is instrumented, and KASAN treats
> > the
> > patching window as poisoned.
> >=20
> > Introduce locally defined patch_* variants of memset that perform
> > an
> > uninstrumented lower level set, as well as detecting write errors
> > like
> > the original single patch variant does.
> >=20
> > copy_to_user() is not correct here, as the PTE makes it a proper
> > kernel
> > page (the EEA is privileged access only, RW). It just happens to be
> > in
> > quadrant 1 because that's the hardware's mechanism for using the
> > current
> > PID vs PID 0 in translations. Importantly, it's incorrect to allow
> > user
> > page accesses.
> >=20
> > Now that the patching memsets are used, we also propagate a failure
> > up
> > to the caller as the single patch variant does.
> >=20
> > Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
> >=20
> > ---
> >=20
> > The patch_memcpy() can be optimised to 4 bytes at a time assuming
> > the
> > same requirements as regular instruction patching are being
> > followed
> > for the 'copy sequence of instructions' mode (i.e., they actually
> > are
> > instructions following instruction alignment rules).
>=20
> Why not use copy_to_kernel_nofault() ?

I had not come across copy_to_kernel_nofault(). It looks like the
optimised memcpy() I wanted, so thanks.

>=20
>=20
> > ---
> > =C2=A0 arch/powerpc/lib/code-patching.c | 42
> > +++++++++++++++++++++++++++++---
> > =C2=A0 1 file changed, 38 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/arch/powerpc/lib/code-patching.c
> > b/arch/powerpc/lib/code-patching.c
> > index c6ab46156cda..c6633759b509 100644
> > --- a/arch/powerpc/lib/code-patching.c
> > +++ b/arch/powerpc/lib/code-patching.c
> > @@ -372,9 +372,43 @@ int patch_instruction(u32 *addr, ppc_inst_t
> > instr)
> > =C2=A0 }
> > =C2=A0 NOKPROBE_SYMBOL(patch_instruction);
> > =C2=A0=20
> > +static int patch_memset64(u64 *addr, u64 val, size_t count)
> > +{
> > +	for (u64 *end =3D addr + count; addr < end; addr++)
> > +		__put_kernel_nofault(addr, &val, u64, failed);
> > +
> > +	return 0;
> > +
> > +failed:
> > +	return -EPERM;
>=20
> Is it correct ? Shouldn't it be -EFAULT ?

The single instruction patch returns EPERM, which was set this way to
align with ftrace's expectations. I think it's best to keep the
single/multi patching variants consistent with each other where
possible.

>=20
> > +}
> > +
> > +static int patch_memset32(u32 *addr, u32 val, size_t count)
> > +{
> > +	for (u32 *end =3D addr + count; addr < end; addr++)
> > +		__put_kernel_nofault(addr, &val, u32, failed);
> > +
> > +	return 0;
> > +
> > +failed:
> > +	return -EPERM;
> > +}
> > +
> > +static int patch_memcpy(void *dst, void *src, size_t len)
> > +{
> > +	for (void *end =3D src + len; src < end; dst++, src++)
> > +		__put_kernel_nofault(dst, src, u8, failed);
> > +
> > +	return 0;
> > +
> > +failed:
> > +	return -EPERM;
> > +}
> > +
> > =C2=A0 static int __patch_instructions(u32 *patch_addr, u32 *code,
> > size_t len, bool repeat_instr)
> > =C2=A0 {
> > =C2=A0=C2=A0	unsigned long start =3D (unsigned long)patch_addr;
> > +	int err;
> > =C2=A0=20
> > =C2=A0=C2=A0	/* Repeat instruction */
> > =C2=A0=C2=A0	if (repeat_instr) {
> > @@ -383,19 +417,19 @@ static int __patch_instructions(u32
> > *patch_addr, u32 *code, size_t len, bool rep
> > =C2=A0=C2=A0		if (ppc_inst_prefixed(instr)) {
> > =C2=A0=C2=A0			u64 val =3D ppc_inst_as_ulong(instr);
> > =C2=A0=20
> > -			memset64((u64 *)patch_addr, val, len / 8);
> > +			err =3D patch_memset64((u64 *)patch_addr,
> > val, len / 8);
> > =C2=A0=C2=A0		} else {
> > =C2=A0=C2=A0			u32 val =3D ppc_inst_val(instr);
> > =C2=A0=20
> > -			memset32(patch_addr, val, len / 4);
> > +			err =3D patch_memset32(patch_addr, val, len
> > / 4);
> > =C2=A0=C2=A0		}
> > =C2=A0=C2=A0	} else {
> > -		memcpy(patch_addr, code, len);
> > +		err =3D patch_memcpy(patch_addr, code, len);
>=20
> Use copy_to_kernel_nofault() instead of open coding a new less
> optimised=20
> version of it.
>=20
> > =C2=A0=C2=A0	}
> > =C2=A0=20
> > =C2=A0=C2=A0	smp_wmb();	/* smp write barrier */
> > =C2=A0=C2=A0	flush_icache_range(start, start + len);
> > -	return 0;
> > +	return err;
> > =C2=A0 }
> > =C2=A0=20
> > =C2=A0 /*

