Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D1C68FAFE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Feb 2023 00:16:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PBwpk6JYBz3f39
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Feb 2023 10:15:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CzqvkzzD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CzqvkzzD;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PBwnl1gFZz2yWN
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Feb 2023 10:15:06 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 318N1ONt029724;
	Wed, 8 Feb 2023 23:15:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=iJEMfIEJ+eKz0m9NlfTC6JyD4dkRjrd2p8urC0MvJPc=;
 b=CzqvkzzDW2lfAd2gEhHH4eHL7LBEL0zhFgAB4VVBIHrSRH2pfc46X9a3FlJg+Hgz0uLM
 ItPmLuAHkc8opwwmJFbLuacJ1h2GUOnlQ35cY5ENwU/sONLrSnxL/nOILTmJXpjUUJ8X
 SPo5igqvx6zlnpbqgT/SeK/MaKus4VADVF8zFhGG0iv1qYjcgJ1gdoBLmF2jL47KnT+A
 Ede/txK5c9wEOO6M8Nw1wyJ11aoQNTmUj3/wHiuNYUe2RXHXwlPlFxEMe4hNmwiSnvLd
 0XWOXYvL7aimFImvr26DWOAVG5e4NNL4izMwuM187wsL+KJQV3vMMqWjVFhIoddKmWdT oQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nmn1y89bw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Feb 2023 23:15:00 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 318N7cAx017967;
	Wed, 8 Feb 2023 23:15:00 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nmn1y89b9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Feb 2023 23:14:59 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3186VH5D018248;
	Wed, 8 Feb 2023 23:14:57 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma03fra.de.ibm.com (PPS) with ESMTPS id 3nhf06kuxf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Feb 2023 23:14:57 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 318NEtmN47186206
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 8 Feb 2023 23:14:55 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EA3A520040;
	Wed,  8 Feb 2023 23:14:54 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E428620043;
	Wed,  8 Feb 2023 23:14:53 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  8 Feb 2023 23:14:53 +0000 (GMT)
Received: from smtpclient.apple (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 24680605F1;
	Thu,  9 Feb 2023 10:14:52 +1100 (AEDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.400.51.1.1\))
Subject: Re: [PATCH v4 1/7] kcsan: Add atomic builtin stubs for 32-bit systems
From: Rohan McLure <rmclure@linux.ibm.com>
In-Reply-To: <fab33693-3a11-2649-0556-e4501faec418@csgroup.eu>
Date: Thu, 9 Feb 2023 10:14:41 +1100
Content-Transfer-Encoding: quoted-printable
Message-Id: <E2FD06BA-F229-425B-B143-01152496C01D@linux.ibm.com>
References: <20230208032202.1357949-1-rmclure@linux.ibm.com>
 <20230208032202.1357949-2-rmclure@linux.ibm.com>
 <fab33693-3a11-2649-0556-e4501faec418@csgroup.eu>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
X-Mailer: Apple Mail (2.3731.400.51.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: kM2CQDlrm8oSbuwJw8GoibswDc3L9Tq-
X-Proofpoint-GUID: FiCAvpf9UIC7hTHirJl6A0Km7UC1RGWi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-08_09,2023-02-08_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 phishscore=0 adultscore=0 mlxlogscore=999 spamscore=0 mlxscore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302080195
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



> On 8 Feb 2023, at 11:23 pm, Christophe Leroy =
<christophe.leroy@csgroup.eu> wrote:
>=20
>=20
>=20
> Le 08/02/2023 =C3=A0 04:21, Rohan McLure a =C3=A9crit :
>> KCSAN instruments calls to atomic builtins, and will in turn call =
these
>> builtins itself. As such, architectures supporting KCSAN must have
>> compiler support for these atomic primitives.
>>=20
>> Since 32-bit systems are unlikely to have 64-bit compiler builtins,
>> provide a stub for each missing builtin, and use BUG() to assert
>> unreachability.
>>=20
>> In commit 725aea873261 ("xtensa: enable KCSAN"), xtensa implements =
these
>> locally, but does not advertise the fact with preprocessor macros. To
>> avoid production of duplicate symbols, do not build the stubs on =
xtensa.
>> A future patch will remove the xtensa implementation of these stubs.
>>=20
>> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
>> ---
>> v4: New patch
>> ---
>>  kernel/kcsan/Makefile |  3 ++
>>  kernel/kcsan/stubs.c  | 78 =
+++++++++++++++++++++++++++++++++++++++++++
>>  2 files changed, 81 insertions(+)
>>  create mode 100644 kernel/kcsan/stubs.c
>=20
> I think it would be better to merge patch 1 and patch 2, that way we=20=

> would keep the history and see that stubs.c almost comes from xtensa.
>=20
> The summary would then be:
>=20
>  arch/xtensa/lib/Makefile                              |  1 -
>  kernel/kcsan/Makefile                                 |  2 +-
>  arch/xtensa/lib/kcsan-stubs.c =3D> kernel/kcsan/stubs.c | 26=20
> +++++++++++++++++++++++++-
>  3 files changed, 26 insertions(+), 3 deletions(-)
>=20
>=20
>>=20
>> diff --git a/kernel/kcsan/Makefile b/kernel/kcsan/Makefile
>> index 8cf70f068d92..5dfc5825aae9 100644
>> --- a/kernel/kcsan/Makefile
>> +++ b/kernel/kcsan/Makefile
>> @@ -12,6 +12,9 @@ CFLAGS_core.o :=3D $(call =
cc-option,-fno-conserve-stack) \
>>   -fno-stack-protector -DDISABLE_BRANCH_PROFILING
>>=20
>>  obj-y :=3D core.o debugfs.o report.o
>> +ifndef XTENSA
>> + obj-y +=3D stubs.o
>=20
> obj-$(CONFIG_32BIT) +=3D stubs.o
>=20
> That would avoid the #if CONFIG_32BIT in stubs.c

Thanks. Yes happy to do this.

>=20
>> +endif
>>=20
>>  KCSAN_INSTRUMENT_BARRIERS_selftest.o :=3D y
>>  obj-$(CONFIG_KCSAN_SELFTEST) +=3D selftest.o
>> diff --git a/kernel/kcsan/stubs.c b/kernel/kcsan/stubs.c
>> new file mode 100644
>> index 000000000000..ec5cd99be422
>> --- /dev/null
>> +++ b/kernel/kcsan/stubs.c
>> @@ -0,0 +1,78 @@
>> +// SPDX-License Identifier: GPL-2.0
>=20
> Missing - between License and Identifier ?
>=20
>> +
>> +#include <linux/bug.h>
>> +#include <linux/types.h>
>> +
>> +#ifdef CONFIG_32BIT
>=20
> Should be handled in Makefile
>=20
>> +
>> +#if !__has_builtin(__atomic_store_8)
>=20
> Does any 32 bit ARCH support that ? Is that #if required ?
>=20
> If yes, do we really need the #if for each and every function, can't =
we=20
> just check for one and assume that if we don't have __atomic_store_8 =
we=20
> don't have any of the functions ?

Turns out that testing with gcc provides 8-byte atomic builtins on x86
and arm on 32-bit. However I believe it should just suffice to check for
__atomic_store_8 or any other such builtin i.e. if an arch implements =
one it
likely implements them all from what I=E2=80=99ve seen.

>=20
>=20
>> +void __atomic_store_8(volatile void *p, u64 v, int i)
>> +{
>> + BUG();
>> +}
>> +#endif
>> +
>> +#if !__has_builtin(__atomic_load_8)
>> +u64 __atomic_load_8(const volatile void *p, int i)
>> +{
>> + BUG();
>> +}
>> +#endif
>> +
>> +#if !__has_builtin(__atomic_exchange_8)
>> +u64 __atomic_exchange_8(volatile void *p, u64 v, int i)
>> +{
>> + BUG();
>> +}
>> +#endif
>> +
>> +#if !__has_builtin(__atomic_compare_exchange_8)
>> +bool __atomic_compare_exchange_8(volatile void *p1, void *p2, u64 v, =
bool b, int i1, int i2)
>> +{
>> + BUG();
>> +}
>> +#endif
>> +
>> +#if !__has_builtin(__atomic_fetch_add_8)
>> +u64 __atomic_fetch_add_8(volatile void *p, u64 v, int i)
>> +{
>> + BUG();
>> +}
>> +#endif
>> +
>> +#if !__has_builtin(__atomic_fetch_sub_8)
>> +u64 __atomic_fetch_sub_8(volatile void *p, u64 v, int i)
>> +{
>> + BUG();
>> +}
>> +#endif
>> +
>> +#if !__has_builtin(__atomic_fetch_and_8)
>> +u64 __atomic_fetch_and_8(volatile void *p, u64 v, int i)
>> +{
>> + BUG();
>> +}
>> +#endif
>> +
>> +#if !__has_builtin(__atomic_fetch_or_8)
>> +u64 __atomic_fetch_or_8(volatile void *p, u64 v, int i)
>> +{
>> + BUG();
>> +}
>> +#endif
>> +
>> +#if !__has_builtin(__atomic_fetch_xor_8)
>> +u64 __atomic_fetch_xor_8(volatile void *p, u64 v, int i)
>> +{
>> + BUG();
>> +}
>> +#endif
>> +
>> +#if !__has_builtin(__atomic_fetch_nand_8)
>> +u64 __atomic_fetch_nand_8(volatile void *p, u64 v, int i)
>> +{
>> + BUG();
>> +}
>> +#endif
>> +
>> +#endif /* CONFIG_32BIT */


