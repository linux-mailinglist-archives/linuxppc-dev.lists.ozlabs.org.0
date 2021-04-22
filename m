Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 51397367E42
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Apr 2021 12:01:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQtHn2Vz4z30Bk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Apr 2021 20:01:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TSe2pVDh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=TSe2pVDh; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQtHL41qXz2xfl
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Apr 2021 20:01:33 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13M9YcE1053501; Thu, 22 Apr 2021 06:01:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : subject :
 to : references : in-reply-to : mime-version : message-id : content-type :
 content-transfer-encoding; s=pp1;
 bh=bua06TQZiUZW96KKFivBQiVW6dbvhdkNvHUA9amRvo8=;
 b=TSe2pVDhyOjjAMlFWrZGAAep921y74aj4HMqJP3FxTWI88Jma7qj0GMV3z5/XVsrfTEz
 CtgmY6D6OZkENslijYEzxS30zgxMPou+t3mGNUYWXrQ0gME+CrioQV/lxW6B8e3GoMnt
 aW40bADspXwDU+cTMGvRH80C1Ft5phBxeUZRJaz7zvgUDdd5qjCGw7fXOEEqyzsI2q4w
 InGHnsxQ7zGtDXY1BvvpQN9qEhfHYnPXtVvrhUiuZwEEGc5TlYJA1FdWsbIH4TL+Wzd8
 rqgvYYNSXEvzo/Fsw48FmAL5lim0H5ODxgW5+Gfv/xu8eyBzNnk/UtqChRk3CYf5VZKU bA== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3832cmqtpc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Apr 2021 06:01:23 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13M9wY8a011290;
 Thu, 22 Apr 2021 10:01:21 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 37yqa8jsj8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Apr 2021 10:01:21 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13MA1J0L26542468
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 22 Apr 2021 10:01:19 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3355AA407E;
 Thu, 22 Apr 2021 10:01:19 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 79107A4072;
 Thu, 22 Apr 2021 10:01:17 +0000 (GMT)
Received: from localhost (unknown [9.85.113.232])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 22 Apr 2021 10:01:17 +0000 (GMT)
Date: Thu, 22 Apr 2021 15:31:15 +0530
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
In-Reply-To: <87lf9caycg.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
User-Agent: astroid/v0.15-23-gcdc62b30 (https://github.com/astroidmail/astroid)
Message-Id: <1619085028.flue8xv2n9.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: tmYQt7VhlZ1tdfct1HX74QXQT82Y57gz
X-Proofpoint-ORIG-GUID: tmYQt7VhlZ1tdfct1HX74QXQT82Y57gz
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-22_01:2021-04-21,
 2021-04-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1011
 adultscore=0 bulkscore=0 suspectscore=0 mlxscore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104220080
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
>> Daniel Axtens wrote:
>>> Sathvika Vasireddy <sathvika@linux.vnet.ibm.com> writes:
>>>=20
>>>> This adds emulation support for the following instruction:
>>>>    * Set Boolean (setb)
>>>>
>>>> Signed-off-by: Sathvika Vasireddy <sathvika@linux.vnet.ibm.com>
> ...
>>>=20
>>> If you do end up respinning the patch, I think it would be good to make
>>> the maths a bit clearer. I think it works because a left shift of 2 is
>>> the same as multiplying by 4, but it would be easier to follow if you
>>> used a temporary variable for btf.
>>
>> Indeed. I wonder if it is better to follow the ISA itself. Per the ISA,=20
>> the bit we are interested in is:
>> 	4 x BFA + 32
>>
>> So, if we use that along with the PPC_BIT() macro, we get:
>> 	if (regs->ccr & PPC_BIT(ra + 32))
>=20
> Use of PPC_BIT risks annoying your maintainer :)

Uh oh... that isn't good :)

I looked up previous discussions and I think I now understand why you=20
don't prefer it.

But, I feel it helps make it easy to follow the code when referring to=20
the ISA. I'm wondering if it is just the name you dislike and if so,=20
does it make sense to rename PPC_BIT() to something else? We have=20
BIT_ULL(), so perhaps BIT_MSB_ULL() or MSB_BIT_ULL()?


- Naveen

