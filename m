Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1963036C9B1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Apr 2021 18:45:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FV70x03dPz30BP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Apr 2021 02:45:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aCwpVR9a;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=aCwpVR9a; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FV70P1bp6z2xfd
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Apr 2021 02:44:52 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13RGY2Qv033631; Tue, 27 Apr 2021 12:44:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : subject :
 to : references : in-reply-to : mime-version : message-id : content-type :
 content-transfer-encoding; s=pp1;
 bh=VG20HRy4a1wV1+9MyrY0gMHvsdQkcuRtUpbBv9aSZC4=;
 b=aCwpVR9aLJsojb3UQiulHtTWG7zMtwh2+VxNEsTzSebfWIL5fHOdcZ6wg9GB4zsN/qIH
 ZoEH+chDac8voEqa4zFx8k6bkUiMMhf32655f8axrO/p4JcYZot6mD1ROhbR1CyNj0fv
 omsoqx+4APCd+d1qQG7QyzIMmzwL38gtQGLWJ23AxDWC5WQG0Ag82W4dMJsjsSVwP1qk
 IDupZaGSjqqyj6O9adkIzewYhuvw0vgh79GfWiQSXMUMFlEEU2MNqBWBwBD4joYgits6
 +CZjSxnYo5StlULoIXwhB1i/pE+mREoL9z37C5nm67Hutpna3Otry1WCufY5/B0cBjq6 lQ== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 386had3r76-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Apr 2021 12:44:37 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13RGhgb7021815;
 Tue, 27 Apr 2021 16:44:35 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06ams.nl.ibm.com with ESMTP id 384akh9eyp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Apr 2021 16:44:35 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 13RGi8Ol25297166
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 27 Apr 2021 16:44:08 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A59CA42042;
 Tue, 27 Apr 2021 16:44:32 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3427D42045;
 Tue, 27 Apr 2021 16:44:32 +0000 (GMT)
Received: from localhost (unknown [9.85.74.4])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 27 Apr 2021 16:44:31 +0000 (GMT)
Date: Tue, 27 Apr 2021 22:14:30 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Subject: Re: [PATCH 1/2] powerpc/sstep: Add emulation support for
 =?CP1251?B?kXNldGKS?= instruction
To: Daniel Axtens <dja@axtens.net>, linuxppc-dev@lists.ozlabs.org,
 Michael Ellerman <mpe@ellerman.id.au>, Sathvika Vasireddy
 <sathvika@linux.vnet.ibm.com>
References: <cover.1618469454.git.sathvika@linux.vnet.ibm.com>
 <767e53c4c27da024ca277e21ffcd0cff131f5c73.1618469454.git.sathvika@linux.vnet.ibm.com>
 <875z0mfzbf.fsf@linkitivity.dja.id.au>
 <1618899164.u2uju6vw3c.naveen@linux.ibm.com>
 <87lf9caycg.fsf@mpe.ellerman.id.au>
 <1619085028.flue8xv2n9.naveen@linux.ibm.com>
 <87bla5b041.fsf@mpe.ellerman.id.au>
In-Reply-To: <87bla5b041.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
User-Agent: astroid/v0.15-23-gcdc62b30 (https://github.com/astroidmail/astroid)
Message-Id: <1619541277.598mrhcod5.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 8Kk7kE1B0i6MqKJDC0wlDEdgH0STf2fl
X-Proofpoint-GUID: 8Kk7kE1B0i6MqKJDC0wlDEdgH0STf2fl
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-27_10:2021-04-27,
 2021-04-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 adultscore=0 mlxlogscore=999 clxscore=1015 priorityscore=1501
 impostorscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104270112
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman wrote:
> "Naveen N. Rao" <naveen.n.rao@linux.ibm.com> writes:
>> Michael Ellerman wrote:
>>> "Naveen N. Rao" <naveen.n.rao@linux.ibm.com> writes:
>>>> Daniel Axtens wrote:
>>>>> Sathvika Vasireddy <sathvika@linux.vnet.ibm.com> writes:
>>>>>=20
>>>>>> This adds emulation support for the following instruction:
>>>>>>    * Set Boolean (setb)
>>>>>>
>>>>>> Signed-off-by: Sathvika Vasireddy <sathvika@linux.vnet.ibm.com>
>>> ...
>>>>>=20
>>>>> If you do end up respinning the patch, I think it would be good to ma=
ke
>>>>> the maths a bit clearer. I think it works because a left shift of 2 i=
s
>>>>> the same as multiplying by 4, but it would be easier to follow if you
>>>>> used a temporary variable for btf.
>>>>
>>>> Indeed. I wonder if it is better to follow the ISA itself. Per the ISA=
,=20
>>>> the bit we are interested in is:
>>>> 	4 x BFA + 32
>>>>
>>>> So, if we use that along with the PPC_BIT() macro, we get:
>>>> 	if (regs->ccr & PPC_BIT(ra + 32))
>>>=20
>>> Use of PPC_BIT risks annoying your maintainer :)
>>
>> Uh oh... that isn't good :)
>>
>> I looked up previous discussions and I think I now understand why you=20
>> don't prefer it.
>=20
> Hah, I'd forgotten I'd written (ranted :D) about this in the past.
>=20
>> But, I feel it helps make it easy to follow the code when referring to=20
>> the ISA.
>=20
> That's true. But I think that's much much less common than people
> reading the code in isolation.

I thought that isn't so for at least the instruction emulation=20
infrastructure...

>=20
> And ultimately it doesn't matter if the code (appears to) match the ISA,
> it matters that the code works. My worry is that too much use of those
> type of macros obscures what's actually happening.

... but, I agree on the above point. I can see why it is better to keep=20
it simple.

I also see precedence for what both you and Segher are suggesting in the=20
existing code in sstep.c

>=20
>> I'm wondering if it is just the name you dislike and if so,=20
>> does it make sense to rename PPC_BIT() to something else? We have=20
>> BIT_ULL(), so perhaps BIT_MSB_ULL() or MSB_BIT_ULL()?
>=20
> The name is part of it. But I don't really like BIT_ULL() either, it
> hides in a macro something that could just be there in front of you
> ie. (1ull << x).
>=20
>=20
> For this case of setb, I think I'd go with something like below. It
> doesn't exactly match the ISA, but I think there's minimal obfuscation
> of what's actually going on.
>=20
>     	// ra is now bfa
> 	ra =3D (ra >> 2);
>=20
> 	// Extract 4-bit CR field
> 	val =3D regs->ccr >> (CR0_SHIFT - 4 * ra);
>=20
> 	if (val & 8)
> 		op->val =3D -1;
> 	else if (val & 4)
> 		op->val =3D 1;
> 	else
> 		op->val =3D 0;
>=20
>=20
> If anything could use a macro it would be the 8 and 4, eg. CR_LT, CR_GT.
>=20
> Of course that's probably got a bug in it, because I just wrote it by
> eye and it's 11:28 pm :)

LGTM, thanks. I'll let Sathvika decide on which variant she wants to go=20
with for v2 :)


- Naveen

