Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8C85323C8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 09:12:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6lkw37smz3bpY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 17:12:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gI51vRW1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=gI51vRW1; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6lk96VjVz2ynL
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 May 2022 17:11:45 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24O6pu1p000755;
 Tue, 24 May 2022 07:11:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : subject :
 to : cc : references : in-reply-to : mime-version : message-id :
 content-type : content-transfer-encoding; s=pp1;
 bh=xCmdj8t4HE2+lEfhZnxB0HOEDNmJRl/m5MAIicP9obM=;
 b=gI51vRW1e2oD3q0hUp3aFAO9+2ACWQk3Lc7qFiKB3cHxoX3pJGhluXmYcoHmZQMTLeAq
 0NFBwoj8U2M0s9Jh5knj+Pn8eJduOHbiFnH6k20qARDsu5AoRo+3zdEfaMHkupCeOEx+
 Q6YSrv18MB99+FH3IF3A9CHPy+mHxX12zmWFBBXIo9n+KVmbufMH43k4vRkg27c7V9BM
 41xli/XKNRwsZRQ/BhDZyjYFO0vsG31Oc8DMdX9CKbgOlMhQXgeol35xrBD2yqPNBSYz
 AkHPiaHcs2Wb/Mc/Cr0ubeDiv4xUkFiWgt3iI8HQGSCIwbjuNaqE8B4CWdvzQyawNReH pg== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g8tf9rce3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 May 2022 07:11:34 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24O78Fnm018985;
 Tue, 24 May 2022 07:11:31 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06ams.nl.ibm.com with ESMTP id 3g6qbjc0ba-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 May 2022 07:11:31 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24O7BTGv18809298
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 May 2022 07:11:29 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4DB7CA405B;
 Tue, 24 May 2022 07:11:29 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EA1EDA4054;
 Tue, 24 May 2022 07:11:28 +0000 (GMT)
Received: from localhost (unknown [9.199.154.182])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 24 May 2022 07:11:28 +0000 (GMT)
Date: Tue, 24 May 2022 12:41:27 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: linux-next: changed messages in qemu boot
To: Michael Ellerman <mpe@ellerman.id.au>, Stephen Rothwell
 <sfr@canb.auug.org.au>
References: <20220520233602.2738d87c@canb.auug.org.au>
 <1653069342.3xtfot6wli.naveen@linux.ibm.com>
 <87czg3mzyi.fsf@mpe.ellerman.id.au>
In-Reply-To: <87czg3mzyi.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
User-Agent: astroid/4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1653375606.b65qo262yf.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: SbT-gNwLs02CdnQVMakjPqbSX-2HUjUv
X-Proofpoint-ORIG-GUID: SbT-gNwLs02CdnQVMakjPqbSX-2HUjUv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-24_05,2022-05-23_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0
 spamscore=0 impostorscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 lowpriorityscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205240039
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>,
 Linux =?iso-8859-1?q?Kernel=0A?= Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman wrote:
> "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> writes:
>> Stephen Rothwell wrote:
>=20
>> The below diff fixes it for me:
>>
>> diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/tr=
ace/ftrace.c
>> index 46c002a8388804..7418da705d43ac 100644
>> --- a/arch/powerpc/kernel/trace/ftrace.c
>> +++ b/arch/powerpc/kernel/trace/ftrace.c
>> @@ -746,7 +746,7 @@ int __init ftrace_dyn_arch_init(void)
>> =20
>>         reladdr =3D addr - kernel_toc_addr();
>> =20
>> -       if (reladdr >=3D SZ_2G || reladdr < -SZ_2G) {
>> +       if (reladdr >=3D SZ_2G || reladdr < -_UL(SZ_2G)) {
>>                 pr_err("Address of %ps out of range of kernel_toc.\n",
>>                                 (void *)addr);
>>                 return -1;
>=20
> I did:
>=20
> 	if (reladdr >=3D SZ_2G || reladdr < -(long)SZ_2G) {

That was my first attempt.

> Which more closely matches what the old code did, and I think is more
> obvious? ie. we don't want to negate the unsigned value, we want a
> signed value, and then the negative of that.

When you put it like that... :D
In hindsight, I agree though -- _UL() isn't necessarily better.


Thanks,
Naveen

