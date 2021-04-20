Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CFA365257
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Apr 2021 08:26:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FPYcG1ppDz301J
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Apr 2021 16:26:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EANxq+f6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=EANxq+f6; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FPYbp4x03z2xYl
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Apr 2021 16:26:13 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13K63AAx077121; Tue, 20 Apr 2021 02:26:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : subject :
 to : references : in-reply-to : mime-version : message-id : content-type :
 content-transfer-encoding; s=pp1;
 bh=i/UuIF+YS3YFTInXHiNxm6eyI8SqiVCxAX3HSHY0Ixs=;
 b=EANxq+f6IjnFLfu3X3Unh4QV3epTlo9ttbMgvGPvwB/XpFXgCARrx15B/PSBJ4dqyptv
 Nrzm/V9sxCetTjfxlE9Crzv1bmMHLdKL9tBOX3x2U9KjiitVAmPmTC4VeM49A/Ipgi2F
 VCzAguuXxDPeGXsz/YDFYp3PLeleg4UR4a7S4YXD6TiybnEXd7M0Ci5F9Jg39t6fOIS5
 +fd8XCWKExhOz2KGvExfaSsV2+eH9Xm1i4eYuVJ9zV0HNAOcy60/cMYHpR1vZAud5Pxq
 5JcWFJ2pr7U2JoyfM2ojsYpV/EwaB8PQNR+9r8CytRBN6tEshaDkzkvVB3iH5Jz0Q+H7 Mw== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com with ESMTP id 380d7e8js5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Apr 2021 02:26:10 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13K6Mhx4026883;
 Tue, 20 Apr 2021 06:26:08 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06fra.de.ibm.com with ESMTP id 37ypxh8thf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Apr 2021 06:26:08 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 13K6PhGK35520770
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Apr 2021 06:25:43 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 02F93A405B;
 Tue, 20 Apr 2021 06:26:06 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 28D0EA4054;
 Tue, 20 Apr 2021 06:26:05 +0000 (GMT)
Received: from localhost (unknown [9.85.73.109])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 20 Apr 2021 06:26:04 +0000 (GMT)
Date: Tue, 20 Apr 2021 11:56:03 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Subject: Re: [PATCH 1/2] powerpc/sstep: Add emulation support for
 =?CP1251?B?kXNldGKS?= instruction
To: Daniel Axtens <dja@axtens.net>, linuxppc-dev@lists.ozlabs.org,
 Sathvika Vasireddy <sathvika@linux.vnet.ibm.com>
References: <cover.1618469454.git.sathvika@linux.vnet.ibm.com>
 <767e53c4c27da024ca277e21ffcd0cff131f5c73.1618469454.git.sathvika@linux.vnet.ibm.com>
 <875z0mfzbf.fsf@linkitivity.dja.id.au>
In-Reply-To: <875z0mfzbf.fsf@linkitivity.dja.id.au>
MIME-Version: 1.0
User-Agent: astroid/v0.15-23-gcdc62b30 (https://github.com/astroidmail/astroid)
Message-Id: <1618899164.u2uju6vw3c.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: W8TiEXg0FtDlv9KPqp5YiZOMLBGxxsvk
X-Proofpoint-GUID: W8TiEXg0FtDlv9KPqp5YiZOMLBGxxsvk
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-20_01:2021-04-19,
 2021-04-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 mlxscore=0 adultscore=0 suspectscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 clxscore=1011 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104200046
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

Daniel Axtens wrote:
> Sathvika Vasireddy <sathvika@linux.vnet.ibm.com> writes:
>=20
>> This adds emulation support for the following instruction:
>>    * Set Boolean (setb)
>>
>> Signed-off-by: Sathvika Vasireddy <sathvika@linux.vnet.ibm.com>
>> ---
>>  arch/powerpc/lib/sstep.c | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>>
>> diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
>> index c6aebc149d14..263c613d7490 100644
>> --- a/arch/powerpc/lib/sstep.c
>> +++ b/arch/powerpc/lib/sstep.c
>> @@ -1964,6 +1964,18 @@ int analyse_instr(struct instruction_op *op, cons=
t struct pt_regs *regs,
>>  			op->val =3D ~(regs->gpr[rd] | regs->gpr[rb]);
>>  			goto logical_done;
>> =20
>> +		case 128:	/* setb */
>> +			if (!cpu_has_feature(CPU_FTR_ARCH_300))
>> +				goto unknown_opcode;
>=20
> Ok, if I've understood correctly...
>=20
>> +			ra =3D ra & ~0x3;
>=20
> This masks off the bits of RA that are not part of BTF:
>=20
> ra is in [0, 31] which is [0b00000, 0b11111]
> Then ~0x3 =3D ~0b00011
> ra =3D ra & 0b11100
>=20
> This gives us then,
> ra =3D btf << 2; or
> btf =3D ra >> 2;
>=20
> Let's then check to see if your calculations read the right fields.
>=20
>> +			if ((regs->ccr) & (1 << (31 - ra)))
>> +				op->val =3D -1;
>> +			else if ((regs->ccr) & (1 << (30 - ra)))
>> +				op->val =3D 1;
>> +			else
>> +				op->val =3D 0;
>=20
>=20
> CR field:      7    6    5    4    3    2    1    0
> bit:          0123 0123 0123 0123 0123 0123 0123 0123
> normal bit #: 0.....................................31
> ibm bit #:   31.....................................0
>=20
> If btf =3D 0, ra =3D 0, check normal bits 31 and 30, which are both in CR=
0.
> CR field:      7    6    5    4    3    2    1    0
> bit:          0123 0123 0123 0123 0123 0123 0123 0123
>                                                    ^^
>=20
> If btf =3D 7, ra =3D 0b11100 =3D 28, so check normal bits 31-28 and 30-28=
,
> which are 3 and 2.
>=20
> CR field:      7    6    5    4    3    2    1    0
> bit:          0123 0123 0123 0123 0123 0123 0123 0123
>                 ^^
>=20
> If btf =3D 3, ra =3D 0b01100 =3D 12, for normal bits 19 and 18:
>=20
> CR field:      7    6    5    4    3    2    1    0
> bit:          0123 0123 0123 0123 0123 0123 0123 0123
>                                     ^^
>=20
> So yes, your calculations, while I struggle to follow _how_ they work,
> do in fact seem to work.
>=20
> Checkpatch does have one complaint:
>=20
> CHECK:UNNECESSARY_PARENTHESES: Unnecessary parentheses around 'regs->ccr'
> #30: FILE: arch/powerpc/lib/sstep.c:1971:
> +			if ((regs->ccr) & (1 << (31 - ra)))
>=20
> I don't really mind the parenteses: I think you are safe to ignore
> checkpatch here unless someone else complains :)
>=20
> If you do end up respinning the patch, I think it would be good to make
> the maths a bit clearer. I think it works because a left shift of 2 is
> the same as multiplying by 4, but it would be easier to follow if you
> used a temporary variable for btf.

Indeed. I wonder if it is better to follow the ISA itself. Per the ISA,=20
the bit we are interested in is:
	4 x BFA + 32

So, if we use that along with the PPC_BIT() macro, we get:
	if (regs->ccr & PPC_BIT(ra + 32))


>> +			goto compute_done;
>> +

I can see why you thought this should be in the section with other=20
logical instructions. However, since this instruction does not modify CR=20
itself, this is probably better placed earlier -- somewhere near 'mfcr'=20
instruction emulation.


- Naveen

