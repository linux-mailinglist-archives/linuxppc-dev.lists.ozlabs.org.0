Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B79A8C4B61
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2024 05:00:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RyE/V8j0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vdh1X6C0Hz30Sq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2024 13:00:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RyE/V8j0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vdh0n05lsz2yvs
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2024 12:59:52 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44E1SJ8R024860;
	Tue, 14 May 2024 02:59:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=MoBI8Xqe1CRcAUbP7btd6LO0ix2pBpM+ftj2BKeO38w=;
 b=RyE/V8j01sYpcnesAEtN27m6XR3/FaXhLqnkH0c5RE2YUJbzFmPcCJsCbk9laLcH2AWq
 mnBg5QcaRsKRiEClbTfJMJLXY+N7QfK6B46v79YnlWYeQq1E3bKQPZ5W4iUv8cngZgzr
 1Bs/NvPvQHILZRFfkNaj2Pecp2Ch9YX9fhsVnRoEyDiiA57bdQA80e0d1txXktSr3/UP
 vl/ov1It9xTwZJOIdZmzmmBHRtQQe/KABQxiJYsjQg7BDPiUWRA4lVpZaY9lk/oP17IL
 YJMLFAmQqMxHodh4SmNftjNW9Aiz2Mcle82BwrasAJMylZRoRiw3uPOnS2L8SiUBgg1E ig== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y3tnp8jtb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 May 2024 02:59:46 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44E2KSbk029591;
	Tue, 14 May 2024 02:59:45 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3y2n7kjrxw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 May 2024 02:59:45 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44E2xfHL38011314
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 May 2024 02:59:43 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8B83F20043;
	Tue, 14 May 2024 02:59:41 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AA1A420040;
	Tue, 14 May 2024 02:59:40 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 14 May 2024 02:59:40 +0000 (GMT)
Received: from [10.61.2.107] (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id AEFAE6010C;
	Tue, 14 May 2024 12:59:35 +1000 (AEST)
Message-ID: <8d6ba809067eb332e1c1a8e6103303cd4814df41.camel@linux.ibm.com>
Subject: Re: [PATCH v3 3/5] powerpc/64: Convert patch_instruction() to
 patch_u32()
From: Benjamin Gray <bgray@linux.ibm.com>
To: Naveen N Rao <naveen@kernel.org>
Date: Tue, 14 May 2024 12:59:35 +1000
In-Reply-To: <xjnc3usfjrn3pqitpvvs4fkackuzcrnguqmqm2otocnhtrxmux@cd4d7bsyoweq>
References: <20240325055302.876434-1-bgray@linux.ibm.com>
	 <20240325055302.876434-4-bgray@linux.ibm.com>
	 <xjnc3usfjrn3pqitpvvs4fkackuzcrnguqmqm2otocnhtrxmux@cd4d7bsyoweq>
Autocrypt: addr=bgray@linux.ibm.com; prefer-encrypt=mutual;
 keydata=mDMEYzuwexYJKwYBBAHaRw8BAQdAsgBYEqW6nNaL7i0B3z1RqyMl8ADupDef+5Sfe+JbzeC0I0JlbmphbWluIEdyYXkgPGJncmF5QGxpbnV4LmlibS5jb20+iJMEExYKADsWIQQ9K5v9I+L06Hi4yOJ5xrdpFsvehAUCYzuwewIbAwULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgAAKCRB5xrdpFsvehCiCAP4g7CDkmsakpwv9QxU2D8dophyCIS8meDOQX4/83/sjHgEA5HWbUsbRCpVmeIgu0iNwhw3cmqhkv7ZkBGe3HhHaXg65Ay4EYzuwkREIAJjQ1EDAmLbOENucLy7VUzyNNCHkBirK/+FbjwOW7VIphc8zgsbZ26ZjIu5vC1NY7U7DpOvLAfR0g4+2QeKiQ8EEcuxLhif5X+jsekq0oSTVLcyNYXArJ3mhmV7jRhz8wBueMoXY/k+P3HCVLi4vzroJzN06Hrnmeu5ELlC4MbuvGRTvW751Y/o7gTa6hyyLb2P4pQ+sj/PuIn2Ly1RJPF839HVcOOERkjZ2QZNJnXEhlpfDD7LyRsy9Xm6MxGKRE5VsfjaO+Q8B6ByhXIy5/QK41AF1uSIPBfkZ8+AsBFw8Z87VGQ61tDdzi0U77IdYr98KsgRJ30vHInfKKdSj4csBALzNKjOFmp7dS8mefp3viouy4vWPla8+XZU6ZrRNtD8hB/9FsE7KVTdIBp4xqf6oN1ieTD7PNsQsBQWdDA/rg2bP7IJQkf4Pvn0yoATOFgqhQwadkwT7fwWAfk0YPEE+DPom1V3JwNM6wPaEJeNaMjleqTfAfauLaB9Sc+zJvN5cORrEjSL/0jfJBBdjW5j5BmdUDM1mGuBNVQhGlWHc/Rf7qokMoZAfYiPi/z44rB9zvNfb8t6sVNqHbC2fKRBn/0k8cZ9+qBEIj6vbkqUuih8xNDA+TU+FxPqJxyahqFv+LL9cfZelC0v3D
	mjW5LaBPOdGiiDE1w95Ri9HRK27S2dRZpyib9L4mkfYWPAF41mTudjKmVpgtBLO//rO+zmF04OMB/4sWJhLfvhq1CXULDqw5dcuIAIYwf2ughOtyAPFK1ViDcMO5X1bVpNAFO5m4VBpZvFDQ0j0JfqfVBdL68uH05W1/8dMj76RaWj5m0rLM5slY1FQUPddSU+ic9vaZhlDepjU3ZyI8fmioofNGHaxJq6uNTytKdj87kwDV6PQ4hmuGtY56C7JCgjp053sRJ6sXqgKBWfe4ZOJH17mQm+fws93byLoZvvz4Z3im0Rb0MlFo/WirNyhu+TmTNLpnzFUZfenoKrqAkZLY8u1iCFquhgqA321P+sfYew66DtwQmaoi2GKmF89y2enXXzjLNKfLDKkuVoKxFSPeizYqrLi22R9iO8EGBYKACAWIQQ9K5v9I+L06Hi4yOJ5xrdpFsvehAUCYzuwkQIbAgCBCRB5xrdpFsvehHYgBBkRCAAdFiEESFUlaLYscsf4Dt5gaavCcpI6D/8FAmM7sJEACgkQaavCcpI6D/95UgEAqfSj0QhCrYfazQiLDKJstrz3oIKFjhB6+FYMZqt+K1MA/2ioFtHbypeeWbsqYYRhRyTjAKcvE1NZGtH/YWLgkViUidoBAN6gFX/P+VWB77/w8S/BnPmnJx45wmphlkCL8ckOyopFAQCj9eWamHCl2DSaASMSuoZed6C6Gm0OFtuZh/r8K485BQ==
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: tTJXKTw9CdsjQXeoDzvBG5sLOSGKCL-F
X-Proofpoint-ORIG-GUID: tTJXKTw9CdsjQXeoDzvBG5sLOSGKCL-F
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-13_17,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 bulkscore=0 mlxlogscore=999 impostorscore=0 clxscore=1011
 lowpriorityscore=0 phishscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2405010000 definitions=main-2405140020
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2024-04-23 at 15:09 +0530, Naveen N Rao wrote:
> On Mon, Mar 25, 2024 at 04:53:00PM +1100, Benjamin Gray wrote:
> > This use of patch_instruction() is working on 32 bit data, and can
> > fail
> > if the data looks like a prefixed instruction and the extra write
> > crosses a page boundary. Use patch_u32() to fix the write size.
> >=20
> > Fixes: 8734b41b3efe ("powerpc/module_64: Fix livepatching for RO
> > modules")
> > Link: https://lore.kernel.org/all/20230203004649.1f59dbd4@yea/
> > Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
> >=20
> > ---
> >=20
> > v2: * Added the fixes tag, it seems appropriate even if the subject
> > does
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mention a more robust solution being req=
uired.
> >=20
> > patch_u64() should be more efficient, but judging from the bug
> > report
> > it doesn't seem like the data is doubleword aligned.
>=20
> Asking again, is that still the case? It looks like at least the
> first=20
> fix below can be converted to patch_u64().
>=20
> - Naveen

Sorry, I think I forgot this question last time. Reading the commit
descriptions you linked, I don't see any mention of "entry->funcdata
will always be doubleword aligned because XYZ". If the patch makes it
doubleword aligned anyway, I wouldn't be confident asserting all
callers will always do this without looking into it a lot more.

Perhaps a separate series could optimise it with appropriate
justification/assertions to catch bad alignment. But I think leaving it
out of this series is fine because the original works in words, so it's
not regressing anything.

>=20
> > ---
> > =C2=A0arch/powerpc/kernel/module_64.c | 5 ++---
> > =C2=A01 file changed, 2 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/arch/powerpc/kernel/module_64.c
> > b/arch/powerpc/kernel/module_64.c
> > index 7112adc597a8..e9bab599d0c2 100644
> > --- a/arch/powerpc/kernel/module_64.c
> > +++ b/arch/powerpc/kernel/module_64.c
> > @@ -651,12 +651,11 @@ static inline int create_stub(const
> > Elf64_Shdr *sechdrs,
> > =C2=A0	// func_desc_t is 8 bytes if ABIv2, else 16 bytes
> > =C2=A0	desc =3D func_desc(addr);
> > =C2=A0	for (i =3D 0; i < sizeof(func_desc_t) / sizeof(u32); i++) {
> > -		if (patch_instruction(((u32 *)&entry->funcdata) +
> > i,
> > -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ppc_inst(((u32
> > *)(&desc))[i])))
> > +		if (patch_u32(((u32 *)&entry->funcdata) + i, ((u32
> > *)&desc)[i]))
> > =C2=A0			return 0;
> > =C2=A0	}
> > =C2=A0
> > -	if (patch_instruction(&entry->magic,
> > ppc_inst(STUB_MAGIC)))
> > +	if (patch_u32(&entry->magic, STUB_MAGIC))
> > =C2=A0		return 0;
> > =C2=A0
> > =C2=A0	return 1;
> > --=20
> > 2.44.0
> >=20

