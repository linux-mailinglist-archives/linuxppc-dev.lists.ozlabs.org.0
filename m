Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 008EE869165
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 14:09:10 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dB7tQ/a+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tkd9J50rjz3vWy
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Feb 2024 00:09:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dB7tQ/a+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tkd8W4Ltcz3cDt
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Feb 2024 00:08:27 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41RCX7wG004005;
	Tue, 27 Feb 2024 13:08:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=Yg290spHizKK+yZgYqDMfQfUG4G9w4xV4ejIx2taWqM=;
 b=dB7tQ/a+sFvS4eE8JAiI5y/1cNXAAzSt8OdG/OJ1vopArcvaJd6eS8PlECAHJJhEdTzZ
 0WG17x0QeYPcbHs2ivb4Ii8oClpaZfTkPc5waQtFK4CY5C+/Kv2Sw6nGc4UKvkK4qT3o
 /7pUCEqSUNS+8lt49ah4hlGLkjSjnWvNqI2UfOMByFbkpuLAZ2qFtAi6QbxiF3jS8jxh
 +TqoVLSYhe4AJ6x7/JdMEwnt/stbSYm3wEUVTQBjJKDIhWgYwqzQ92h1PDCTxQ3dJFGT
 DPcWQA3EfKstZ0wEYLcbx0DpyZ4maEXu94lU1qqhGBrZG+S7OCguuPf+s4/w0nyF/tPk ow== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3whfu915ua-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Feb 2024 13:08:23 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41RBcNYH012328;
	Tue, 27 Feb 2024 13:08:22 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3wfwg279ek-16
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Feb 2024 13:08:22 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41R9aUMA57409918
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 Feb 2024 09:36:33 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E467A2004F;
	Tue, 27 Feb 2024 09:36:30 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 251822004D;
	Tue, 27 Feb 2024 09:36:30 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.53.114])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 27 Feb 2024 09:36:29 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.300.61.1.2\))
Subject: Re: Kernel WARNING at lib/vsprintf.c:2721 while running ftrace kernel
 selftests
From: Sachin Sant <sachinp@linux.ibm.com>
In-Reply-To: <20240226122208.344447f1@gandalf.local.home>
Date: Tue, 27 Feb 2024 15:06:18 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <129D90CC-6DEB-4953-8061-EAA89F1ED514@linux.ibm.com>
References: <C7E7AF1A-D30F-4D18-B8E5-AF1EF58004F5@linux.ibm.com>
 <20240226122208.344447f1@gandalf.local.home>
To: Steven Rostedt <rostedt@goodmis.org>
X-Mailer: Apple Mail (2.3774.300.61.1.2)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: zJJeUPcjJIoF26fkzIpQoFiR-offaynd
X-Proofpoint-ORIG-GUID: zJJeUPcjJIoF26fkzIpQoFiR-offaynd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-26_11,2024-02-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 mlxlogscore=855 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402270102
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

>> --- interrupt: c00
>> Code: f821ff91 2f890000 409e0034 7c0802a6 3c62fff0 39200001 3d420177 =
3863e310 992ad6db f8010080 4b209899 60000000 <0fe00000> e8010080 =
7c0803a6 2f9f0000=20
>> ---[ end trace 0000000000000000 ]=E2=80=94
>>=20
>> This warning is seen while running test that was added by
>> following commit:
>>=20
>> commit 3bf7009251f0f41cdd0188ab7b3879df81810703
>>     tracing/selftests: Add test to test the trace_marker
>=20
> This adds the user space selftest that triggered this warning, but it =
is
> not the cause of it. Could you run this test against kernel builds =
before
> this commit. Does this test cause this to trigger on older versions of =
the
> kernel?
>=20

Running the mentioned test against an older kernel does not trigger this
warning.

# uname -r
6.7.0
#
#  ./ftracetest test.d/00basic/trace_marker.tc
=3D=3D=3D Ftrace unit tests =3D=3D=3D
[1] Basic tests on writing to trace_marker [PASS]
[2] (instance)  Basic tests on writing to trace_marker [PASS]


# of passed:  2
# of failed:  0
# of unresolved:  0
# of untested:  0
# of unsupported:  0
# of xfailed:  0
# of undefined(test bug):  0
#

I used this setup to again run bisect between 6.7.0 and 6.8-rc1.
Bisect points to following patch=20

commit 8ec90be7f15fac42992ea821be929d3b06cd0fd9
    tracing: Allow for max buffer data size trace_marker writes


=E2=80=94 Sachin


