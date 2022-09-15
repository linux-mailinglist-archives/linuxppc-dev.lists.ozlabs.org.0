Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7619E5B9405
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Sep 2022 07:46:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MSmRQ2cxsz3c18
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Sep 2022 15:46:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UEzWe7GM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UEzWe7GM;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MSmQg5kRPz305M
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Sep 2022 15:46:03 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28F5PYvi007936
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Sep 2022 05:46:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=x4J5NDFLDDP8SpiLnPVXkj3sdi5Vs3GaTfpGI+zz/qk=;
 b=UEzWe7GMT2SlGRcpJ/agnJIIw1yVv1R3UmBZONthVvyeVT+vhLizXEoKFQZ0fSqcMBER
 p19df87YRv6XQU4QsbY71sMVVUhcj6K1FspDSmrkaw64voHCDjdnbY2Qu6U7eTcumR+g
 hwKnFXS0kmLR6qOr5tvDRe7LVfBIcfR55GIRbh8lrtUjxe+CLOEYK98oAdKD3l0OoUiV
 u3m92dPP3XkUIZaGokjhLVLJ1BTcc4XBwFlpVYhWso0/QMjzsiONkNpnjvuT/JS2j0k7
 LGszckZgb2NX8f6OG5BR+Y5DgO9Y+Z8TXGi7msjfWNvEzugvQi5mTZm0wJBRzWG6nthO OA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jkww30hb7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Sep 2022 05:46:00 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28F5RGxP011964
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Sep 2022 05:46:00 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jkww30ham-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Sep 2022 05:45:59 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28F5YkUv032117;
	Thu, 15 Sep 2022 05:45:58 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma03ams.nl.ibm.com with ESMTP id 3jjy95swfk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Sep 2022 05:45:57 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28F5jtLc38470108
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Sep 2022 05:45:55 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C643CA405B;
	Thu, 15 Sep 2022 05:45:55 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 285D6A4054;
	Thu, 15 Sep 2022 05:45:55 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu, 15 Sep 2022 05:45:55 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.192.255.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 7E42C6010D;
	Thu, 15 Sep 2022 15:45:49 +1000 (AEST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH v4 10/20] powerpc: Use common syscall handler type
From: Rohan McLure <rmclure@linux.ibm.com>
In-Reply-To: <CMUDA0ALFBSI.5KMSI1NSJZH7@bobo>
Date: Thu, 15 Sep 2022 15:45:48 +1000
Content-Transfer-Encoding: quoted-printable
Message-Id: <6E8ADD7A-6122-4615-8BFC-C1104F13B283@linux.ibm.com>
References: <20220824020548.62625-1-rmclure@linux.ibm.com>
 <20220824020548.62625-11-rmclure@linux.ibm.com>
 <CMUDA0ALFBSI.5KMSI1NSJZH7@bobo>
To: Nicholas Piggin <npiggin@gmail.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Mvd2U8UvlsyWKB9RBFSfjfbxbDd8L2pZ
X-Proofpoint-ORIG-GUID: v_RvpW8O4DBrwDeNwGPmCWh3QE0lz-uO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-15_02,2022-09-14_04,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 phishscore=0 priorityscore=1501 mlxscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2208220000
 definitions=main-2209150028
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



> On 12 Sep 2022, at 8:56 pm, Nicholas Piggin <npiggin@gmail.com> wrote:
>=20
> On Wed Aug 24, 2022 at 12:05 PM AEST, Rohan McLure wrote:
>> Cause syscall handlers to be typed as follows when called indirectly
>> throughout the kernel.
>>=20
>> typedef long (*syscall_fn)(unsigned long, unsigned long, unsigned =
long,
>>                           unsigned long, unsigned long, unsigned =
long);
>=20
> The point is... better type checking?
>=20
>>=20
>> Since both 32 and 64-bit abis allow for at least the first six
>> machine-word length parameters to a function to be passed by =
registers,
>> even handlers which admit fewer than six parameters may be viewed as
>> having the above type.
>>=20
>> Fixup comparisons in VDSO to avoid pointer-integer comparison. =
Introduce
>> explicit cast on systems with SPUs.
>>=20
>> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
>> ---
>> V1 -> V2: New patch.
>> V2 -> V3: Remove unnecessary cast from const syscall_fn to syscall_fn
>> ---
>> arch/powerpc/include/asm/syscall.h          | 7 +++++--
>> arch/powerpc/include/asm/syscalls.h         | 1 +
>> arch/powerpc/kernel/systbl.c                | 6 +++---
>> arch/powerpc/kernel/vdso.c                  | 4 ++--
>> arch/powerpc/platforms/cell/spu_callbacks.c | 6 +++---
>> 5 files changed, 14 insertions(+), 10 deletions(-)
>>=20
>> diff --git a/arch/powerpc/include/asm/syscall.h =
b/arch/powerpc/include/asm/syscall.h
>> index 25fc8ad9a27a..d2a8dfd5de33 100644
>> --- a/arch/powerpc/include/asm/syscall.h
>> +++ b/arch/powerpc/include/asm/syscall.h
>> @@ -14,9 +14,12 @@
>> #include <linux/sched.h>
>> #include <linux/thread_info.h>
>>=20
>> +typedef long (*syscall_fn)(unsigned long, unsigned long, unsigned =
long,
>> +			   unsigned long, unsigned long, unsigned long);
>> +
>> /* ftrace syscalls requires exporting the sys_call_table */
>> -extern const unsigned long sys_call_table[];
>> -extern const unsigned long compat_sys_call_table[];
>> +extern const syscall_fn sys_call_table[];
>> +extern const syscall_fn compat_sys_call_table[];
>=20
> Ah you constify it in this patch. I think the previous patch should =
have
> kept the const, and it should keep the unsigned long type rather than
> use void *. Either that or do this patch first.
>=20
>> static inline int syscall_get_nr(struct task_struct *task, struct =
pt_regs *regs)
>> {
>> diff --git a/arch/powerpc/include/asm/syscalls.h =
b/arch/powerpc/include/asm/syscalls.h
>> index 91417dee534e..e979b7593d2b 100644
>> --- a/arch/powerpc/include/asm/syscalls.h
>> +++ b/arch/powerpc/include/asm/syscalls.h
>> @@ -8,6 +8,7 @@
>> #include <linux/types.h>
>> #include <linux/compat.h>
>>=20
>> +#include <asm/syscall.h>
>> #ifdef CONFIG_PPC64
>> #include <asm/syscalls_32.h>
>> #endif
>=20
> Is this necessary or should be in another patch?

Good spot. This belongs in the patch that produces systbl.c.

>=20
>> diff --git a/arch/powerpc/kernel/systbl.c =
b/arch/powerpc/kernel/systbl.c
>> index 99ffdfef6b9c..b88a9c2a1f50 100644
>> --- a/arch/powerpc/kernel/systbl.c
>> +++ b/arch/powerpc/kernel/systbl.c
>> @@ -21,10 +21,10 @@
>> #define __SYSCALL(nr, entry) [nr] =3D __powerpc_##entry,
>> #define __powerpc_sys_ni_syscall	sys_ni_syscall
>> #else
>> -#define __SYSCALL(nr, entry) [nr] =3D entry,
>> +#define __SYSCALL(nr, entry) [nr] =3D (void *) entry,
>> #endif
>=20
> Also perhaps this should have been in the prior pach and this pach
> should change the cast from void to syscall_fn ?

This cast to (void *) kicks in when casting functions with six or fewer
parameters to six-parameter type accepting and returning u64. Sadly I =
can=E2=80=99t
find a way to avoid -Wcast-function-type even with (__force syscall_fn) =
short
of an ugly casti to void* here. Any suggestions?

>=20
>>=20
>> -void *sys_call_table[] =3D {
>> +const syscall_fn sys_call_table[] =3D {
>> #ifdef CONFIG_PPC64
>> #include <asm/syscall_table_64.h>
>> #else
>> @@ -35,7 +35,7 @@ void *sys_call_table[] =3D {
>> #ifdef CONFIG_COMPAT
>> #undef __SYSCALL_WITH_COMPAT
>> #define __SYSCALL_WITH_COMPAT(nr, native, compat)	__SYSCALL(nr, =
compat)
>> -void *compat_sys_call_table[] =3D {
>> +const syscall_fn compat_sys_call_table[] =3D {
>> #include <asm/syscall_table_32.h>
>> };
>> #endif /* CONFIG_COMPAT */
>> diff --git a/arch/powerpc/kernel/vdso.c b/arch/powerpc/kernel/vdso.c
>> index 0da287544054..080c9e7de0c0 100644
>> --- a/arch/powerpc/kernel/vdso.c
>> +++ b/arch/powerpc/kernel/vdso.c
>> @@ -313,10 +313,10 @@ static void __init vdso_setup_syscall_map(void)
>> 	unsigned int i;
>>=20
>> 	for (i =3D 0; i < NR_syscalls; i++) {
>> -		if (sys_call_table[i] !=3D (unsigned =
long)&sys_ni_syscall)
>> +		if (sys_call_table[i] !=3D (void *)&sys_ni_syscall)
>> 			vdso_data->syscall_map[i >> 5] |=3D 0x80000000UL =
>> (i & 0x1f);
>> 		if (IS_ENABLED(CONFIG_COMPAT) &&
>> -		    compat_sys_call_table[i] !=3D (unsigned =
long)&sys_ni_syscall)
>> +		    compat_sys_call_table[i] !=3D (void =
*)&sys_ni_syscall)
>=20
> Also these.
>=20
> Thanks,
> Nick
>=20
>> 			vdso_data->compat_syscall_map[i >> 5] |=3D =
0x80000000UL >> (i & 0x1f);
>> 	}
>> }
>> diff --git a/arch/powerpc/platforms/cell/spu_callbacks.c =
b/arch/powerpc/platforms/cell/spu_callbacks.c
>> index fe0d8797a00a..e780c14c5733 100644
>> --- a/arch/powerpc/platforms/cell/spu_callbacks.c
>> +++ b/arch/powerpc/platforms/cell/spu_callbacks.c
>> @@ -34,15 +34,15 @@
>>  *	mbind, mq_open, ipc, ...
>>  */
>>=20
>> -static void *spu_syscall_table[] =3D {
>> +static const syscall_fn spu_syscall_table[] =3D {
>> #define __SYSCALL_WITH_COMPAT(nr, entry, compat) __SYSCALL(nr, entry)
>> -#define __SYSCALL(nr, entry) [nr] =3D entry,
>> +#define __SYSCALL(nr, entry) [nr] =3D (void *) entry,
>> #include <asm/syscall_table_spu.h>
>> };
>>=20
>> long spu_sys_callback(struct spu_syscall_block *s)
>> {
>> -	long (*syscall)(u64 a1, u64 a2, u64 a3, u64 a4, u64 a5, u64 a6);
>> +	syscall_fn syscall;
>>=20
>> 	if (s->nr_ret >=3D ARRAY_SIZE(spu_syscall_table)) {
>> 		pr_debug("%s: invalid syscall #%lld", __func__, =
s->nr_ret);
>> --=20
>> 2.34.1

