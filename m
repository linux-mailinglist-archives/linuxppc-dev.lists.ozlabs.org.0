Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF9C4D2E32
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Mar 2022 12:36:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KD9Bd0Hsyz3bbr
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Mar 2022 22:36:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Xjv54iyk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Xjv54iyk; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KD99t5Kjpz30Fn
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Mar 2022 22:35:46 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 229BJ10F030689; 
 Wed, 9 Mar 2022 11:35:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : subject :
 to : cc : references : in-reply-to : mime-version : message-id :
 content-type : content-transfer-encoding; s=pp1;
 bh=O2BUNUTzGb+7cQ8rm8DHMyjnM+LWM5EfmcO0Tz4pHzw=;
 b=Xjv54iykDrpDbsZcGuj81AUJEypYqnHR1rz8TI+lyQAewWuFK9fxoso/EO3KdJA6grAw
 5YrgU/9v/HZ+9HDbgFacb20zYwfuR9uBPjMQzE1nzYUz/V1N3iRIPWKvKiLEcQbumj3O
 OHqFADbes+gvcjgtT34s5k4pvZ3NFE01i2pbYp7Td8QMPsgzcEi1fXAkCRW/GXHNLYK7
 TehAImu6qsW5fHNIgQ+pdSZ/uMl6TUaQox/pnzwUgpeiFgs7dCBQTxE3BgtbL4LCIA6N
 +JlGmY5NeBqXseK5+0QjMuiwhVJWWTv4zGsPeMnI/PNwnIkSOR5Ew9LHDitbafgBUEXI Ug== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3enww82uda-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Mar 2022 11:35:36 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 229BXlLq014484;
 Wed, 9 Mar 2022 11:35:33 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma02fra.de.ibm.com with ESMTP id 3ekyg90h15-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Mar 2022 11:35:33 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 229BZVXD50397678
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 9 Mar 2022 11:35:31 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5DF9042047;
 Wed,  9 Mar 2022 11:35:31 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E74E442042;
 Wed,  9 Mar 2022 11:35:30 +0000 (GMT)
Received: from localhost (unknown [9.43.9.116])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  9 Mar 2022 11:35:30 +0000 (GMT)
Date: Wed, 09 Mar 2022 17:05:29 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH v1 2/4] powerpc/ftrace: Refactor ftrace_{regs_}caller
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>
References: <ec286d2cc6989668a96f14543275437d2f3f0e3a.1645099283.git.christophe.leroy@csgroup.eu>
 <9d7df9e4fc98a86051489f61d3c9bc67f92f7e27.1645099283.git.christophe.leroy@csgroup.eu>
 <1646326634.jzerx009p9.naveen@linux.ibm.com>
 <5c0a3a26-ee52-a4f7-9bc2-b38f27a12a76@csgroup.eu>
In-Reply-To: <5c0a3a26-ee52-a4f7-9bc2-b38f27a12a76@csgroup.eu>
MIME-Version: 1.0
User-Agent: astroid/4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1646825481.p25t8oi12m.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: EuvBYT_Q0yDRCRNv2BxaO7OCSMM--y8m
X-Proofpoint-GUID: EuvBYT_Q0yDRCRNv2BxaO7OCSMM--y8m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-09_04,2022-03-04_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0
 mlxlogscore=986 phishscore=0 mlxscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203090063
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy wrote:
>=20
>=20
> Le 03/03/2022 =C3=A0 17:59, Naveen N. Rao a =C3=A9crit=C2=A0:
>> Christophe Leroy wrote:
>>
>> The ability to disable ftrace in certain code paths through=20
>> paca_struct->ftrace_enabled will also be relevant on ppc32 - it will be=20
>> nice if it can be introduced there.
>=20
> Ah ? I understood from commit ea678ac627e0 ("powerpc64/ftrace: Add a=20
> field in paca to disable ftrace in unsafe code paths") that it was for=20
> when it runs in real mode. PPC32 doesn't run any C code in real mode.

It likely isn't necessary in that case.

>=20
> Are there any other situations that real_mode where we'd like to disable=20
> it ? If so we could use the thread_struct as we don't have paca on PPC32.

For ppc64, we use this flag to disable certain paths in kvm, kexec,=20
mce/hmi and idle/hotplug. If none of those are problematic on ppc32,=20
then this isn't necessary.


Thanks,
- Naveen

