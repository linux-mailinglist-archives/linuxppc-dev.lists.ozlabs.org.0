Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A86B38690BE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 13:39:42 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UV74+i2Q;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TkcWJ3Fymz3d2S
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 23:39:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UV74+i2Q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TkcVb1Rt0z3cRc
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Feb 2024 23:39:02 +1100 (AEDT)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41RCHViA006252;
	Tue, 27 Feb 2024 12:38:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=b928xqbPLuWZeWemVeMhSuZ04GMXi6apGDQECkQ6APY=;
 b=UV74+i2QSvzidOPysLPByYq1ckc9ZtShO0BjGbkCyzfP76IBoinx3etFv1wqHQQt1baH
 j4RAZCzLPl30R2xV4aV39dU8FwT31Zbarso8+sLO6arxxkBB7Q5awYyUe23bak8lg19F
 W3rPV5HOiJ1KQsPDoTQHVHlJP6k5/61qZug2CuOOnRr0kixkbkkNZ3V9r7QfPgvadUrt
 BCtCxRhGpdeEg1qtl4hdGOjpPbi1Cg3ev/L/4Wx3P1YaZBTeqx+P4wt6spWkW6PNTONO
 p7iag6w3GtaLX5LqoImC6JF31YgPI/h+p+1ht9uEGfRmGXaYcHQNr4Uz4DK0aHqhqNtr uA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3whfkw8gy7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Feb 2024 12:38:47 +0000
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 41RCUScs010671;
	Tue, 27 Feb 2024 12:38:46 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3whfkw8gxv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Feb 2024 12:38:46 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41RCPGrK021792;
	Tue, 27 Feb 2024 12:38:45 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3wfu5yys5w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Feb 2024 12:38:45 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41RCcdsd21496464
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 Feb 2024 12:38:41 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8F05320043;
	Tue, 27 Feb 2024 12:38:39 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 92C8920040;
	Tue, 27 Feb 2024 12:38:36 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.0.228])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 27 Feb 2024 12:38:36 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.300.61.1.2\))
Subject: Re: [RFC PATCH] selftest/powerpc: Add rule file to address sub-folder
 test fail
From: Sachin Sant <sachinp@linux.ibm.com>
In-Reply-To: <20240225163926.264286-1-maddy@linux.ibm.com>
Date: Tue, 27 Feb 2024 18:08:24 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <955703B5-578C-4189-A6D4-34AC56DC264C@linux.ibm.com>
References: <20240225163926.264286-1-maddy@linux.ibm.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
X-Mailer: Apple Mail (2.3774.300.61.1.2)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: gPWmQ56CeLUPpoGOTsta0n8WYXz_El07
X-Proofpoint-ORIG-GUID: 3e3wpgc3H3UBFcYpgkt5FasdULpCACFB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-26_11,2024-02-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 adultscore=0 phishscore=0
 bulkscore=0 mlxlogscore=999 malwarescore=0 impostorscore=0 clxscore=1011
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402270098
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
Cc: linuxppc-dev@lists.ozlabs.org, aneesh.kumar@kernel.org, Nicholas Piggin <npiggin@gmail.com>, linux-kselftest@vger.kernel.org, naveen.n.rao@linux.ibm.com, shuah@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 25-Feb-2024, at 10:09=E2=80=AFPM, Madhavan Srinivasan =
<maddy@linux.ibm.com> wrote:
>=20
> When running `make -C powerpc/pmu run_tests` from top level selftests
> directory, currently this error is being reported
>=20
> make: Entering directory =
'/home/maddy/linux/tools/testing/selftests/powerpc/pmu'
> Makefile:40: warning: overriding recipe for target 'emit_tests'
> ../../lib.mk:111: warning: ignoring old recipe for target 'emit_tests'
> gcc -m64    count_instructions.c ../harness.c event.c lib.c ../utils.c =
loop.S  -o /home/maddy/selftest_output//count_instructions
> In file included from count_instructions.c:13:
> event.h:12:10: fatal error: utils.h: No such file or directory
>   12 | #include "utils.h"
>      |          ^~~~~~~~~
> compilation terminated.
>=20
> This is due to missing of include path in CFLAGS. That is, CFLAGS and
> GIT_VERSION macros are defined in the powerpc/ folder Makefile which
> in this case not involved.
>=20
> To address the failure incase of executing specific sub-folder test =
directly,
> a new rule file has been addded by the patch called "include.mk" under
> selftest/powerpc/ folder and is linked to all Makefile of powerpc/pmu
> sub-folders.
>=20
> Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
> ---

Thanks for the fix Maddy. The patch fixes the reported problem
for me.

=E2=80=94 Sachin

