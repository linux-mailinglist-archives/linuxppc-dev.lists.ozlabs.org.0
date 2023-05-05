Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BD06F853F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 May 2023 17:09:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QCYxV6bj3z3fKp
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 May 2023 01:09:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YwMq8SMV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YwMq8SMV;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QCYwc02JSz3bqx
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 May 2023 01:08:31 +1000 (AEST)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 345F7rbx013715;
	Fri, 5 May 2023 15:08:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : subject :
 to : references : in-reply-to : message-id : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=s9ZYWDFBJwL4SJ/+B25AgfPJ4NYtYot0+J8O3XUQ6MM=;
 b=YwMq8SMVvGj+CSBNtPhDPyX0FXV37Q1MD4bu8JuWtr9mPUGzAozl/QyLupqzLIOJ0Y8A
 pcMj1NUBN9qpPClhZ01XHjJ5Uita7zphp+irSGyMRTC2ya5bzhAlvWxqnzPUmyr0XIas
 ZDHZpsUCMjhH35X1wppIYmblS1m0aO3YHjVJzC3K5MZulQGsH3/ueG4rXT1NAeUxMOxl
 24yqpm6Uo49SOzWwYpbci8GcDnx2gf7LuLDMsN06dFSDi0f4H+uVd9vFiHL1BXtStUgj
 dL8Tn22szEozXDSzNsygUWtH9/f/Bq4Yzt0HrPZyO7r4HLriMUh7dgzybCyIPbxwdUOS Aw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qd32pjfby-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 May 2023 15:08:21 +0000
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 345F7vLo013902;
	Fri, 5 May 2023 15:08:19 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qd32pjf3m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 May 2023 15:08:18 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 345DwopD017325;
	Fri, 5 May 2023 15:08:10 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3q8tgg3huv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 May 2023 15:08:10 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 345F88jw18809374
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 5 May 2023 15:08:08 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 778082004D;
	Fri,  5 May 2023 15:08:08 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CA01220040;
	Fri,  5 May 2023 15:08:07 +0000 (GMT)
Received: from localhost (unknown [9.43.97.180])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  5 May 2023 15:08:07 +0000 (GMT)
Date: Fri, 05 May 2023 20:38:06 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Subject: Re: [PATCH 0/4] powerpc/64: ELFv2 conversion
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>
References: <20230505071850.228734-1-npiggin@gmail.com>
	<6d0609ae-e31b-8530-7509-7861b07d66c7@csgroup.eu>
	<87wn1n55qc.fsf@mail.lhotse>
In-Reply-To: <87wn1n55qc.fsf@mail.lhotse>
User-Agent: astroid/4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1683298879.x90su0d4vv.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: GAqIRGRhrfA9UnE2-r5bvMXBMi9Bg8r0
X-Proofpoint-ORIG-GUID: Fiyw75pAsCjZ1gXUVtxGdPkcTECtVsI4
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-05_22,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 phishscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 mlxscore=0
 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0 mlxlogscore=847
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305050126
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

Michael Ellerman wrote:
> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>> Le 05/05/2023 =C3=A0 09:18, Nicholas Piggin a =C3=A9crit=C2=A0:
>>> This series has the steps to remove ELFv1 from the kernel build.
>>> Patch 1 is a build fix, 2 defaults everything to ELFv2, 3 is
>>> really a separate issue that concerns userspace. 4 removes v1
>>> support.

Super glad to see this!

>>
>> I see CONFIG_MPROFILE_KERNEL is restricted to LITTLE_ENDIAN. Is that=20
>> correct ? Don't we have mprofile_kernel as well on BIG ENDIAN once=20
>> switched to ABI v2 ? If so, can we drop the -pg based profiling=20
>> completely, or is CLANG still not supporting mprofile_kernel ?
>=20
> Clang does not support -mprofile-kernel.
>=20
> AIUI they would like us to switch to -fpatchable-function-entry which
> could then be supported on GCC & clang.
>=20
> That would be a nice cleanup but also a bunch of work that no one has
> found time to do.
>=20
> https://github.com/linuxppc/issues/issues/447
> https://github.com/llvm/llvm-project/issues/57031

GCC's support for -fpatchable-function-entry needed fixes for ABIv2,=20
which have landed in the recent v13.1 release. I am looking into adding=20
support for that.

>=20
>=20
> So for now we need to keep the -pg based version.

Indeed, but removing elf v1 support does help cleaning up and=20
simplifying some of the tracing code. Much of the -pg code is already=20
separate, so it should be easy to drop that once clang picks up support=20
for -fpatchable-function-entry.


- Naveen

