Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8922D52B685
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 12:01:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L37mP3Cybz3cGZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 20:01:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MoSszXE8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=MoSszXE8; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L37lh3dX1z3bpT
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 May 2022 20:00:32 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24I9sns0013962;
 Wed, 18 May 2022 10:00:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : subject :
 to : cc : references : in-reply-to : mime-version : message-id :
 content-type : content-transfer-encoding; s=pp1;
 bh=1pIKyQD/tRADRieOKwg2VV4jlIouzLS23FBWvwKrF1c=;
 b=MoSszXE84TC+G/oNL46QRnbIjUnLigoiyoEF90dNhx6jaZDXshVzV3JoQ36U2ItM1Us3
 rOFM8he27WF0ncXmIolt+ZRpsJyNA+3Hjf5nPsyZP6VOazn5VznhGs9IJE2oyl10WOIQ
 rRA/fEdBQYe8aqGsklt8tq0PGHP7jSNrUsEZN4ecipbQXtDNAiOnPJ6E2JiGqwJLdct2
 QNd35VVmVvc/ZDitrww4TMH1h+mXwEBZj/bx9R+Qa+UBaSkDWispS7CNiZtKg6VKgmqj
 /nFClJwXLkIcMes1aQl6vTkfYyn/WpwggUNsaHSq1pteyNEXJwoSPSNmnhc1qvam7YRp rg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g4xk4047v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 May 2022 10:00:26 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24I9uo49026936;
 Wed, 18 May 2022 10:00:25 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g4xk40463-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 May 2022 10:00:25 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24I9XqEM009669;
 Wed, 18 May 2022 09:38:31 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 3g2429dfrs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 May 2022 09:38:31 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 24I9Oaci46661984
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 May 2022 09:24:36 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BCA80AE053;
 Wed, 18 May 2022 09:38:28 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 50AEDAE04D;
 Wed, 18 May 2022 09:38:28 +0000 (GMT)
Received: from localhost (unknown [9.43.19.36])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 18 May 2022 09:38:28 +0000 (GMT)
Date: Wed, 18 May 2022 15:08:26 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Subject: Re: [PATCH] powerpc/vdso: Fix incorrect CFI in gettimeofday.S
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
References: <20220502125010.1319370-1-mpe@ellerman.id.au>
 <1652772528.r6qrwbbda5.naveen@linux.ibm.com>
 <877d6kpcfq.fsf@mpe.ellerman.id.au>
In-Reply-To: <877d6kpcfq.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
User-Agent: astroid/4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1652865530.upfk0dsdui.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: OIcX4jYeW48fIsMDJnE0F5pwUeA80rjB
X-Proofpoint-GUID: nZhvcOUbS4ebo8q0GcaM24_wIoB2bT34
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-18_03,2022-05-17_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 mlxlogscore=934 bulkscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205180052
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
Cc: amodra@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman wrote:
> "Naveen N. Rao" <naveen.n.rao@linux.ibm.com> writes:
>> Michael Ellerman wrote:
>>>
>>> diff --git a/arch/powerpc/kernel/vdso/gettimeofday.S b/arch/powerpc/ker=
nel/vdso/gettimeofday.S
>>> index eb9c81e1c218..0aee255e9cbb 100644
>>> --- a/arch/powerpc/kernel/vdso/gettimeofday.S
>>> +++ b/arch/powerpc/kernel/vdso/gettimeofday.S
>>> @@ -22,12 +22,15 @@
>>>  .macro cvdso_call funct call_time=3D0
>>>    .cfi_startproc
>>>  	PPC_STLU	r1, -PPC_MIN_STKFRM(r1)
>>> +  .cfi_adjust_cfa_offset PPC_MIN_STKFRM
>>>  	mflr		r0
>>> -  .cfi_register lr, r0
>>>  	PPC_STLU	r1, -PPC_MIN_STKFRM(r1)
>>> +  .cfi_adjust_cfa_offset PPC_MIN_STKFRM
>>>  	PPC_STL		r0, PPC_MIN_STKFRM + PPC_LR_STKOFF(r1)
>>
>> <snip>
>>
>>> @@ -46,6 +50,7 @@
>>>  	mtlr		r0
>>>    .cfi_restore lr
>>>  	addi		r1, r1, 2 * PPC_MIN_STKFRM
>>> +  .cfi_def_cfa_offset 0
>>
>> Should this be .cfi_adjust_cfa_offset, given that we used that at the
>> start of the function?
> =20
> AIUI "adjust x" is offset +=3D x, whereas "def x" is offset =3D x.
>=20
> So we could use adjust here, but we'd need to adjust by -(2 * PPC_MIN_STK=
FRM).
>=20
> It seemed clearer to just set the offset back to 0, which is what it is
> at the start of the function.

I read the first .cfi_adjust_cfa_offset directive (rather than the=20
.cfi_def_cfa_offset directive) in this macro to be intentionally=20
retaining the offset to what it was before the VDSO. If that is=20
desirable, then setting it to 0 here will change it, I _think_.

>=20
> But I'm not a CFI expert at all, so I'll defer to anyone else who has an
> opinion :)

Oh, the above is just my hypothesis. Would be good to get confirmation.


- Naveen
