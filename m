Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD18586DA73
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Mar 2024 04:58:38 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FNJiCO4p;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TmDph3T8Kz3vbk
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Mar 2024 14:58:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FNJiCO4p;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TmDnw6rsmz3d8y
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Mar 2024 14:57:56 +1100 (AEDT)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 4213JLam016311;
	Fri, 1 Mar 2024 03:57:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=p5+p52mB34XnsI5TxDlp1VJZFYxgxclYpeW9vdq4/hU=;
 b=FNJiCO4pKvy7IpOjLzFdwi/TN6ZBdafsy1SDiGPIXAEKJFlr0QAUQjGQI7WADMV1Idvu
 fpCI7uBqncIYdKIWPte2buZb231LSqstuN3vsML58D03fi/KFZMItZNqH6Xy9BbMnmXM
 mB6vcuXyEhVCYGOFQg60FqRDaTVZ09FctlkDFqOAK+m7gymNEzU+TX+BmnM+BVjMJOwM
 tFgqQR+aq2S73O5hrlMoBXg7wFUSnFxC51cNhPwN8+nHnlLN0CVis+vjW2QYNu4nGFsa
 mojgguhTL1rCANfzzz6V+gpnFsH6BNkrc6fWe0bj6Qn9HXI5X0FAJdu32K2UgUtQTCsW 6A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wk70vgsh7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Mar 2024 03:57:50 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4213nRhk008767;
	Fri, 1 Mar 2024 03:57:50 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wk70vgsh1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Mar 2024 03:57:50 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 42112fC7008154;
	Fri, 1 Mar 2024 03:57:49 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3wfv9mstuf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Mar 2024 03:57:49 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4213vjUi29295038
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 1 Mar 2024 03:57:47 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5FC4620043;
	Fri,  1 Mar 2024 03:57:45 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1322320040;
	Fri,  1 Mar 2024 03:57:44 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.11.96])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  1 Mar 2024 03:57:43 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.300.61.1.2\))
Subject: Re: [kselftests/powerpc] Primitives test build failure with
 linux-next
From: Sachin Sant <sachinp@linux.ibm.com>
In-Reply-To: <87o7bygbip.fsf@mail.lhotse>
Date: Fri, 1 Mar 2024 09:27:32 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <74E707B6-E4DC-4977-967E-4D8A47E6C130@linux.ibm.com>
References: <C11ED986-3959-4C4D-8780-ABD97D5FB0D1@linux.ibm.com>
 <87o7bygbip.fsf@mail.lhotse>
To: Michael Ellerman <mpe@ellerman.id.au>
X-Mailer: Apple Mail (2.3774.300.61.1.2)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: fjfZb8OZPjicHPbjrPgRDtiD8y7VjcaL
X-Proofpoint-ORIG-GUID: pFLnYm-uz4WMoz9DLuxKphPru-ftpdUV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-29_08,2024-02-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 phishscore=0 priorityscore=1501 mlxscore=0
 spamscore=0 mlxlogscore=999 malwarescore=0 lowpriorityscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2403010031
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
Cc: tanzhasanwork@gmail.com, andy.shevchenko@gmail.com, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-kselftest@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 01-Mar-2024, at 3:48=E2=80=AFAM, Michael Ellerman =
<mpe@ellerman.id.au> wrote:
>=20
> Sachin Sant <sachinp@linux.ibm.com> writes:
>> Powerpc specific selftests (specifically powerpc/primitives) included =
in linux-next
>> tree fails to build with following error
>>=20
>> gcc -std=3Dgnu99 -O2 -Wall -Werror =
-DGIT_VERSION=3D'"next-20240229-0-gf303a3e2bcfb-dirty"' =
-I/home/sachin/linux-next/tools/testing/selftests/powerpc/include  =
-I/home/sachin/linux-next/tools/testing/selftests/powerpc/primitives    =
load_unaligned_zeropad.c ../harness.c  -o =
/home/sachin/linux-next/tools/testing/selftests/powerpc/primitives/load_un=
aligned_zeropad
>> In file included from load_unaligned_zeropad.c:26:
>> word-at-a-time.h:7:10: fatal error: linux/bitops.h: No such file or =
directory
>>    7 | #include <linux/bitops.h>
>>      |          ^~~~~~~~~~~~~~~~
>> compilation terminated.
>>=20
>> The header file in question was last changed by following commit
>>=20
>> commit 66a5c40f60f5d88ad8d47ba6a4ba05892853fa1f
>>    kernel.h: removed REPEAT_BYTE from kernel.h
>=20
> Patch below should fix it, can you please confirm?
>=20
Thanks Michael. Yes, this fixes the reported problem.

Tested-by: Sachin Sant <sachinp@linux.ibm.com>


=E2=80=94 Sachin=
