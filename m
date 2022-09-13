Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4E55B6864
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Sep 2022 09:10:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MRZNr1K4jz3c6D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Sep 2022 17:10:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GpM8pSMG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GpM8pSMG;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MRZN53NcXz2xdQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Sep 2022 17:09:40 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28D5kOKc030100
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Sep 2022 07:09:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=PQZJ4QfqoLaPIuwFgpmixiREx0+/hqHXmNMBuEcvYxY=;
 b=GpM8pSMGSyFus9EOCr5y3vXT6M+dx1OtWEuCEVGs0G8+QfVYnoMSKUhhW4YuB9WEcCaR
 E4lE0kExbLviaR1OvBs1J+315VIvkUs9rpxKTPeF4EXeyioIPpFWH+cHO/ZdqBHeZmlC
 bYuiCthxQZvsu71TcsjyRxQias+qPRs/urZG0qVmobPP7xkgGYEAK28L5RcEjoPlgLY+
 RIGAdBLZQ8YfCNcSCgXY1F6uVVQwtqh+mwnlAfM03Fp/aFYZkbdSOYrHX6IJqeRZ4/A9
 qg3vkZH+70+7/sfIbHgv0N/yyyp8krBNRfXBREfiMwS8/8CZSgrhT28F34w+wq2OVW8n xw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jjm0kjca6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Sep 2022 07:09:37 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28D5son6018010
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Sep 2022 07:09:37 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jjm0kjc8k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Sep 2022 07:09:37 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28D764RV000352;
	Tue, 13 Sep 2022 07:09:35 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by ppma03fra.de.ibm.com with ESMTP id 3jgj78tgvg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Sep 2022 07:09:34 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28D79WYN41288136
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 Sep 2022 07:09:32 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7830A4C04A;
	Tue, 13 Sep 2022 07:09:32 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 238744C040;
	Tue, 13 Sep 2022 07:09:32 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue, 13 Sep 2022 07:09:32 +0000 (GMT)
Received: from smtpclient.apple (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id A615D60525;
	Tue, 13 Sep 2022 17:09:26 +1000 (AEST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH v4 08/20] powerpc: Include all arch-specific syscall
 prototypes
From: Rohan McLure <rmclure@linux.ibm.com>
In-Reply-To: <CMUCSHFFSDYT.B7W3EV9G02B6@bobo>
Date: Tue, 13 Sep 2022 17:09:24 +1000
Content-Transfer-Encoding: quoted-printable
Message-Id: <3EF54EDD-6D4F-4F0F-AC27-0FA24CF39C11@linux.ibm.com>
References: <20220824020548.62625-1-rmclure@linux.ibm.com>
 <20220824020548.62625-9-rmclure@linux.ibm.com>
 <CMUCSHFFSDYT.B7W3EV9G02B6@bobo>
To: Nicholas Piggin <npiggin@gmail.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ZHAjPK8_Qpe0iPFZSOo9iYLOOEHUuN7-
X-Proofpoint-ORIG-GUID: 4AM3rnYkS8-sEmy2klVulc56ACIHmSZf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-13_02,2022-09-12_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0
 adultscore=0 bulkscore=0 mlxscore=0 phishscore=0 impostorscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209130031
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 12 Sep 2022, at 8:33 pm, Nicholas Piggin <npiggin@gmail.com> wrote:
>=20
> On Wed Aug 24, 2022 at 12:05 PM AEST, Rohan McLure wrote:
>> Forward declare all syscall handler prototypes where a generic =
prototype
>> is not provided in either linux/syscalls.h or linux/compat.h in
>> asm/syscalls.h. This is required for compile-time type-checking for
>> syscall handlers, which is implemented later in this series.
>>=20
>> 32-bit compatibility syscall handlers are expressed in terms of types =
in
>> ppc32.h. Expose this header globally.
>>=20
>> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
>> ---
>> V1 -> V2: Explicitly include prototypes.
>> V2 -> V3: Remove extraneous #include <asm/compat.h> and ppc_fallocate
>> prototype. Rename header.
>> ---
>> arch/powerpc/include/asm/syscalls.h          | 90 +++++++++++++-----
>> .../ppc32.h =3D> include/asm/syscalls_32.h}    |  0
>> arch/powerpc/kernel/signal_32.c              |  2 +-
>> arch/powerpc/perf/callchain_32.c             |  2 +-
>> 4 files changed, 70 insertions(+), 24 deletions(-)
>>=20
>> diff --git a/arch/powerpc/include/asm/syscalls.h =
b/arch/powerpc/include/asm/syscalls.h
>> index 3e3aff0835a6..91417dee534e 100644
>> --- a/arch/powerpc/include/asm/syscalls.h
>> +++ b/arch/powerpc/include/asm/syscalls.h
>> @@ -8,45 +8,91 @@
>> #include <linux/types.h>
>> #include <linux/compat.h>
>>=20
>> +#ifdef CONFIG_PPC64
>> +#include <asm/syscalls_32.h>
>> +#endif
>> +#include <asm/unistd.h>
>> +#include <asm/ucontext.h>
>> +
>> struct rtas_args;
>>=20
>> +#ifndef CONFIG_ARCH_HAS_SYSCALL_WRAPPER
>=20
> Do you need this ifdef?

Good spot. I=E2=80=99ll introduce that with syscall wrappers.

>> +
>> +/*
>> + * PowerPC architecture-specific syscalls
>> + */
>> +
>> +long sys_rtas(struct rtas_args __user *uargs);
>> +long sys_ni_syscall(void);
>> +
>> +#ifdef CONFIG_PPC64
>> +long sys_ppc64_personality(unsigned long personality);
>> +#ifdef CONFIG_COMPAT
>> +long compat_sys_ppc64_personality(unsigned long personality);
>> +#endif /* CONFIG_COMPAT */
>> +#endif /* CONFIG_PPC64 */
>> +
>> +/* Parameters are reordered for powerpc to avoid padding */
>> +long sys_ppc_fadvise64_64(int fd, int advice,
>> +			  u32 offset_high, u32 offset_low,
>> +			  u32 len_high, u32 len_low);
>=20
> Should this be under PPC32 since you're adding the ifdefs?
>=20
> Because you added a new comment here... This is register padding
> to do with something, even/odd pair calling convention? I can't
> remember the details would you be able to expand the comment a bit
> because I'm sure I'll forget it again too.

Cool. I=E2=80=99ll neaten this up and change that comment.

>=20
> Thanks,
> Nick

