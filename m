Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 27FD368B09E
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Feb 2023 16:40:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P8trL0ZY5z3cK6
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Feb 2023 02:40:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=swWEqYBy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=swWEqYBy;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P8tqM5FC5z3bjy
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Feb 2023 02:39:27 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 315CD1tm023142
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 5 Feb 2023 15:39:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=6Ptm80l+rvsczds6ybSHHv9mvejdewD/X80agvHfnzY=;
 b=swWEqYBy12n3I1MGR79yGBZxm/2DdNaYMpW+MUeuXy4mF5jwS2RFtRlyRxsUw4dytzCj
 MAmpJZXr9iMxg/HXkE7ZERMNzm1prHOVoLBB59PP1CWY7faylfX5Fscwchg7bGDL+DT0
 F5bFPwDaLuQEYhA4SAQ46AQPwVf/a04q911yxdyyzSkJ4UC/NZLxPfdnDfJs18khIV9W
 SiYgpKogX6DJ5N5wZk4FWM3OM3K8pGnGUoCrVUIENjyNiJukO/y7SbbzgPLyIHPmRYW1
 aAVrD+xR4dqROtSArbwtjZM6Ph/5TUWK3DCaC4zR/JLamTzyqrtBUaPaBQm1JfPcCvtr vQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nj16r2w2f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 05 Feb 2023 15:39:23 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 315Fa0t6030690
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 5 Feb 2023 15:39:23 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nj16r2w20-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 05 Feb 2023 15:39:23 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31597ViX015504;
	Sun, 5 Feb 2023 15:39:21 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma04fra.de.ibm.com (PPS) with ESMTPS id 3nhf06s2s3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 05 Feb 2023 15:39:21 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 315FdII252494626
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 5 Feb 2023 15:39:18 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C2A262004B;
	Sun,  5 Feb 2023 15:39:18 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3C79420040;
	Sun,  5 Feb 2023 15:39:18 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.105.62])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun,  5 Feb 2023 15:39:18 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.300.101.1.3\))
Subject: Re: [merge] WARN arch/powerpc/kernel/irq_64.c:278
From: Sachin Sant <sachinp@linux.ibm.com>
In-Reply-To: <CQ8USYNS32BA.37RU0GOQ2LO7M@bobo>
Date: Sun, 5 Feb 2023 21:09:07 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <AD613C6A-769E-461E-9953-AA76DAD900B2@linux.ibm.com>
References: <7C586644-B8B4-4B41-86E3-80A60D5FE1C7@linux.ibm.com>
 <CQ8USYNS32BA.37RU0GOQ2LO7M@bobo>
To: Nicholas Piggin <npiggin@gmail.com>
X-Mailer: Apple Mail (2.3731.300.101.1.3)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: jWaLQqM1B8CUIvuPASKSCsIcEtK4_W7a
X-Proofpoint-GUID: QaukRVQOA90GhSF9_0DmvVojAgavlgK3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-05_04,2023-02-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0
 spamscore=0 clxscore=1015 malwarescore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302050133
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 03-Feb-2023, at 3:55 PM, Nicholas Piggin <npiggin@gmail.com> wrote:
>=20
> On Fri Feb 3, 2023 at 4:26 PM AEST, Sachin Sant wrote:
>> I am observing an intermittent crash while running powerpc/security
>> selftests on a Power10 LPAR booted with powerpc/merge branch code.
>>=20
>> ------------[ cut here ]------------
>> WARNING: CPU: 1 PID: 5644 at arch/powerpc/kernel/irq_64.c:278 =
arch_local_irq_restore+0x254/0x260
>=20
> Okay, I guess the static branch test changes from true to false both
> times it is tested and so it doesn't recover properly. It's a real =
bug.
> I don't know why I didn't change the static branch under stop machine,
> maybe it gets into some recursive issue, that would be ideal if we =
could
> though. But this might be a safer minimal fix?
>=20
> Thanks,
> Nick
> =E2=80=94
>=20

Thanks Nick. Since this failure was intermittent I ran the test 10 times
with and without this patch.

Without the patch failure rate was 3 out of 10
With the patch no failures were seen (0/10).

I also ran the remaining selftests and observed no additional failures.

Based on these tests this fixes the problem for me.

- Sachin

