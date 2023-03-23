Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1C06C6F13
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Mar 2023 18:32:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PjC8K1n6Fz3fQs
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Mar 2023 04:32:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pNhny9if;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pNhny9if;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PjC7K3zKZz3f52
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Mar 2023 04:31:25 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32NFgsjF024916;
	Thu, 23 Mar 2023 17:31:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=MNoS4Gyvfm8TosyaqhjyVn5ODMUmahFiqFYTcJIr4/o=;
 b=pNhny9ifE0nNUadSDSsy3qDaEfC7GYSakjO1mO5IiNSS9JJpNe6nIhdP+8bwXjXTM/1j
 cAEhzMwHfPrnKmRIXkuIuOdJ6q6BHNo6IDecRkBVy2LTbu+Tuk8zRcSAVxWMBQDXWh2O
 ve5IQO6Ck9HJhW1i3xvseagi+7/nyDIXpfrbcGOxc76rFMRPC91nkAtuxiXbI3OdGLq1
 zbhx1SrpVkdAQjXo2R4rrZLGIXKvK6De9LJ0A7bcDswOn7nToAlEMVfZ4FrHGO9anPa3
 dHCEWCmf6r6ju+uyEO0F4CBvymwu9+zcJioQPl3DBw33q84m7cMq8lrX8v2HvJNCnaNN Wg== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3pgmu7k4rx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Mar 2023 17:31:16 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32NDlMbY014687;
	Thu, 23 Mar 2023 17:31:14 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma05fra.de.ibm.com (PPS) with ESMTPS id 3pd4x6eepn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Mar 2023 17:31:14 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 32NHVCEC24052346
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Mar 2023 17:31:12 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E91C220043;
	Thu, 23 Mar 2023 17:31:11 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DD73820040;
	Thu, 23 Mar 2023 17:31:10 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.34.166])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 23 Mar 2023 17:31:10 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.400.51.1.1\))
Subject: Re: [next-20230322] Kernel WARN at kernel/workqueue.c:3182
 (rcutorture)
From: Sachin Sant <sachinp@linux.ibm.com>
In-Reply-To: <fbb628c1-08bd-44ff-a613-794b134f6d46@paulmck-laptop>
Date: Thu, 23 Mar 2023 23:00:59 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <233B28DA-70DD-4AD8-9C72-1FFCA6EFE56D@linux.ibm.com>
References: <139BEB3F-BC1C-4ABA-8928-9A8EF3FB5EDD@linux.ibm.com>
 <fbb628c1-08bd-44ff-a613-794b134f6d46@paulmck-laptop>
To: "Paul E. McKenney" <paulmck@kernel.org>
X-Mailer: Apple Mail (2.3731.400.51.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 3M356xG5GLdKkxm4sUicxH7aE3_zQHtU
X-Proofpoint-GUID: 3M356xG5GLdKkxm4sUicxH7aE3_zQHtU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-22_21,2023-03-23_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0
 mlxlogscore=999 phishscore=0 priorityscore=1501 spamscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303150002
 definitions=main-2303230124
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
Cc: Zqiang <qiang1.zhang@intel.com>, linux-next@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, open list <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


>> [ 3629.243407] NIP [00007fff8cd39558] 0x7fff8cd39558
>> [ 3629.243410] LR [000000010d800398] 0x10d800398
>> [ 3629.243413] --- interrupt: c00
>> [ 3629.243415] Code: 419dffa4 e93a0078 39400001 552907be 2f890000 =
7d20579e 0b090000 e95a0078 e91a0080 39200001 7fa85000 7d204f9e =
<0b090000> 7f23cb78 4bfffd65 0b030000=20
>> [ 3629.243430] ---[ end trace 0000000000000000 ]=E2=80=94
>>=20
>> These warnings are repeated few times. The LTP test is marked as =
PASS.
>>=20
>> Git bisect point to the following patch
>> commit f46a5170e6e7d5f836f2199fe82cdb0b4363427f
>>    srcu: Use static init for statically allocated in-module =
srcu_struct
>=20
> Hello, Sachin, and it looks like you hit something that Zqiang and I
> have been tracking down.  I am guessing that you were using modprobe
> and rmmod to make this happen, and that this happened at rmmod time.
>=20
Yes, the LTP test script rcu_torture.sh relies on modprobe to =
load/unload
the rcutorture module.

> Whatever the reproducer, does the following patch help?
>=20
> Thanx, Paul
>=20

Thank you for the patch. Yes, with this patch applied, the test =
completes
successfully without the reported warning.

- Sachin

