Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5AE46914B4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Feb 2023 00:37:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PCYF33MHYz3f4F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Feb 2023 10:37:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mvE+FQ/J;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mvE+FQ/J;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PCYD406cQz3c7X
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Feb 2023 10:36:35 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 319NXKRR016791;
	Thu, 9 Feb 2023 23:36:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type : subject :
 from : in-reply-to : date : cc : message-id : references : to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=jaf6m4VhlbXDwH+cMaQh7RkDpa1SzKlRanNCyGBdWcQ=;
 b=mvE+FQ/JX2Vyw3dmO77qmBeaJAqlF8zHcV7BEPNNUb3TU0lOZymZTl1YRhxGjA851z6k
 9/nht/RHCtECfo4d3du3XtTocr2pw+LpDW8NqoAEbgfsH8Ub6AGr/IQEHR+d+Yd47Y23
 zgDseHeopMDG98htJzgAP9UPutLfGGL//dQDRjAz499r4BJ8FatbMcif5wgHhdJwUgx8
 O+p9ox/QM4mB2A23PKF3CINSmeyOWjYCJsE1IbBniXfh5uD3CB12B7mXdI8j2G3MIUzH
 0ChTFIxvys3Mlu4rFwBoVPMboDkIZbZUMkCGRrIKTOVb+hpHV8+H00deywt0ssw2dzJL Kw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nnakxg380-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Feb 2023 23:36:29 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 319NXsLm017722;
	Thu, 9 Feb 2023 23:36:29 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nnakxg36v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Feb 2023 23:36:29 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 319CXVwT023824;
	Thu, 9 Feb 2023 23:36:27 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3nhf06xsdx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Feb 2023 23:36:27 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 319NaPAC26542612
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 9 Feb 2023 23:36:25 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2BE282004B;
	Thu,  9 Feb 2023 23:36:25 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 25DDB2004E;
	Thu,  9 Feb 2023 23:36:24 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  9 Feb 2023 23:36:24 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.177.7.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 439B4600BA;
	Fri, 10 Feb 2023 10:36:16 +1100 (AEDT)
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH v4 1/7] kcsan: Add atomic builtin stubs for 32-bit systems
From: Rohan McLure <rmclure@linux.ibm.com>
In-Reply-To: <E2FD06BA-F229-425B-B143-01152496C01D@linux.ibm.com>
Date: Fri, 10 Feb 2023 10:36:01 +1100
Message-Id: <2BF57568-3288-42A5-B274-65B116DFF71A@linux.ibm.com>
References: <20230208032202.1357949-1-rmclure@linux.ibm.com>
 <20230208032202.1357949-2-rmclure@linux.ibm.com>
 <fab33693-3a11-2649-0556-e4501faec418@csgroup.eu>
 <E2FD06BA-F229-425B-B143-01152496C01D@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
X-Mailer: Apple Mail (2.3731.400.51.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: buZAZpdW47jfkrBpGewRpf5Mhb8ENgRn
X-Proofpoint-GUID: BqJ8uyujq8pxxOeS9905LGNBKfD5jgQc
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-09_15,2023-02-09_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015
 adultscore=0 bulkscore=0 phishscore=0 impostorscore=0 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302090212
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
Cc: "chris@zankel.net" <chris@zankel.net>, "elver@google.com" <elver@google.com>, "linux-xtensa@linux.xtensa.org" <linux-xtensa@linux.xtensa.org>, "npiggin@gmail.com" <npiggin@gmail.com>, "jcmvbkbc@gmail.com" <jcmvbkbc@gmail.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 9 Feb 2023, at 10:14 am, Rohan McLure <rmclure@linux.ibm.com> wrote:
>=20
>=20
>=20
>> On 8 Feb 2023, at 11:23 pm, Christophe Leroy <christophe.leroy@csgroup.e=
u> wrote:
>>=20
>>=20
>>=20
>> Le 08/02/2023 =C3=A0 04:21, Rohan McLure a =C3=A9crit :
>>> KCSAN instruments calls to atomic builtins, and will in turn call these
>>> builtins itself. As such, architectures supporting KCSAN must have
>>> compiler support for these atomic primitives.
>>>=20
>>> Since 32-bit systems are unlikely to have 64-bit compiler builtins,
>>> provide a stub for each missing builtin, and use BUG() to assert
>>> unreachability.
>>>=20
>>> In commit 725aea873261 ("xtensa: enable KCSAN"), xtensa implements these
>>> locally, but does not advertise the fact with preprocessor macros. To
>>> avoid production of duplicate symbols, do not build the stubs on xtensa.
>>> A future patch will remove the xtensa implementation of these stubs.
>>>=20
>>> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
>>> ---
>>> v4: New patch
>>> ---
>>> kernel/kcsan/Makefile |  3 ++
>>> kernel/kcsan/stubs.c  | 78 +++++++++++++++++++++++++++++++++++++++++++
>>> 2 files changed, 81 insertions(+)
>>> create mode 100644 kernel/kcsan/stubs.c
>>=20
>> I think it would be better to merge patch 1 and patch 2, that way we=20
>> would keep the history and see that stubs.c almost comes from xtensa.
>>=20
>> The summary would then be:
>>=20
>> arch/xtensa/lib/Makefile                              |  1 -
>> kernel/kcsan/Makefile                                 |  2 +-
>> arch/xtensa/lib/kcsan-stubs.c =3D> kernel/kcsan/stubs.c | 26=20
>> +++++++++++++++++++++++++-
>> 3 files changed, 26 insertions(+), 3 deletions(-)
>>=20
>>=20
>>>=20
>>> diff --git a/kernel/kcsan/Makefile b/kernel/kcsan/Makefile
>>> index 8cf70f068d92..5dfc5825aae9 100644
>>> --- a/kernel/kcsan/Makefile
>>> +++ b/kernel/kcsan/Makefile
>>> @@ -12,6 +12,9 @@ CFLAGS_core.o :=3D $(call cc-option,-fno-conserve-sta=
ck) \
>>>  -fno-stack-protector -DDISABLE_BRANCH_PROFILING
>>>=20
>>> obj-y :=3D core.o debugfs.o report.o
>>> +ifndef XTENSA
>>> + obj-y +=3D stubs.o
>>=20
>> obj-$(CONFIG_32BIT) +=3D stubs.o
>>=20
>> That would avoid the #if CONFIG_32BIT in stubs.c
>=20
> Thanks. Yes happy to do this.
>=20
>>=20
>>> +endif
>>>=20
>>> KCSAN_INSTRUMENT_BARRIERS_selftest.o :=3D y
>>> obj-$(CONFIG_KCSAN_SELFTEST) +=3D selftest.o
>>> diff --git a/kernel/kcsan/stubs.c b/kernel/kcsan/stubs.c
>>> new file mode 100644
>>> index 000000000000..ec5cd99be422
>>> --- /dev/null
>>> +++ b/kernel/kcsan/stubs.c
>>> @@ -0,0 +1,78 @@
>>> +// SPDX-License Identifier: GPL-2.0
>>=20
>> Missing - between License and Identifier ?
>>=20
>>> +
>>> +#include <linux/bug.h>
>>> +#include <linux/types.h>
>>> +
>>> +#ifdef CONFIG_32BIT
>>=20
>> Should be handled in Makefile
>>=20
>>> +
>>> +#if !__has_builtin(__atomic_store_8)
>>=20
>> Does any 32 bit ARCH support that ? Is that #if required ?
>>=20
>> If yes, do we really need the #if for each and every function, can't we=
=20
>> just check for one and assume that if we don't have __atomic_store_8 we=
=20
>> don't have any of the functions ?
>=20
> Turns out that testing with gcc provides 8-byte atomic builtins on x86
> and arm on 32-bit. However I believe it should just suffice to check for
> __atomic_store_8 or any other such builtin i.e. if an arch implements one=
 it
> likely implements them all from what I=E2=80=99ve seen.

In reality, __has_builtin only specifies that GCC is aware of the existance=
 of
the builtin, but linking against libatomic may still be required. Let=E2=80=
=99s
remove this check, and have ppc32 and xtensa opt into compiling this stubs =
file.

Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D108734

>=20
>>=20
>>=20
>>> +void __atomic_store_8(volatile void *p, u64 v, int i)
>>> +{
>>> + BUG();
>>> +}
>>> +#endif
>>> +
>>> +#if !__has_builtin(__atomic_load_8)
>>> +u64 __atomic_load_8(const volatile void *p, int i)
>>> +{
>>> + BUG();
>>> +}
>>> +#endif
>>> +
>>> +#if !__has_builtin(__atomic_exchange_8)
>>> +u64 __atomic_exchange_8(volatile void *p, u64 v, int i)
>>> +{
>>> + BUG();
>>> +}
>>> +#endif
>>> +
>>> +#if !__has_builtin(__atomic_compare_exchange_8)
>>> +bool __atomic_compare_exchange_8(volatile void *p1, void *p2, u64 v, b=
ool b, int i1, int i2)
>>> +{
>>> + BUG();
>>> +}
>>> +#endif
>>> +
>>> +#if !__has_builtin(__atomic_fetch_add_8)
>>> +u64 __atomic_fetch_add_8(volatile void *p, u64 v, int i)
>>> +{
>>> + BUG();
>>> +}
>>> +#endif
>>> +
>>> +#if !__has_builtin(__atomic_fetch_sub_8)
>>> +u64 __atomic_fetch_sub_8(volatile void *p, u64 v, int i)
>>> +{
>>> + BUG();
>>> +}
>>> +#endif
>>> +
>>> +#if !__has_builtin(__atomic_fetch_and_8)
>>> +u64 __atomic_fetch_and_8(volatile void *p, u64 v, int i)
>>> +{
>>> + BUG();
>>> +}
>>> +#endif
>>> +
>>> +#if !__has_builtin(__atomic_fetch_or_8)
>>> +u64 __atomic_fetch_or_8(volatile void *p, u64 v, int i)
>>> +{
>>> + BUG();
>>> +}
>>> +#endif
>>> +
>>> +#if !__has_builtin(__atomic_fetch_xor_8)
>>> +u64 __atomic_fetch_xor_8(volatile void *p, u64 v, int i)
>>> +{
>>> + BUG();
>>> +}
>>> +#endif
>>> +
>>> +#if !__has_builtin(__atomic_fetch_nand_8)
>>> +u64 __atomic_fetch_nand_8(volatile void *p, u64 v, int i)
>>> +{
>>> + BUG();
>>> +}
>>> +#endif
>>> +
>>> +#endif /* CONFIG_32BIT */


