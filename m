Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DED3569A251
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 00:25:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHrf55f6qz3cMt
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 10:25:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oNcbgnk+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oNcbgnk+;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHrcK2Hp4z3f3x
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Feb 2023 10:24:01 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31GNCUFm007237;
	Thu, 16 Feb 2023 23:23:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type : subject :
 from : in-reply-to : date : cc : message-id : references : to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=WcVW/aeSMtX332lAWfno4lAAkIXtiaglwu4yU4RuTlY=;
 b=oNcbgnk+ayNGu0mozNAxH/RRFkWdPGq1EQUQ+5LNoG2SvyccyBiYTa15J9sm+L2yHZgJ
 a3Ow0YIQ+DXk+9xdSUu5qHttc9qBf84CivmwBFMCLaydr4thQPDrOrHCZ2/mOUawupv6
 Di98jgC73gKY8toP9uaXU46JnSeUwcYL8jwJdHCWYcVTfMCjfu8GaiR8IwVPHuOrim2V
 93WdkWvbIk09CCwwSvkyPmiiRrjdmWCZdOS//8bbguo68r5iBXWvQ+ljbAP4lUheQQbN
 pG9wLQkDOpXN/0Lfk+K/e9vD+sEvEtRbLZbHo7OErQHr/eY0I+X62GH83VE3AOQUtIx+ nA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nswxur66h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Feb 2023 23:23:55 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31GNFQcS018415;
	Thu, 16 Feb 2023 23:23:55 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nswxur65w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Feb 2023 23:23:54 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31GHOGmc022562;
	Thu, 16 Feb 2023 23:23:52 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma04fra.de.ibm.com (PPS) with ESMTPS id 3np2n6dd7v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Feb 2023 23:23:52 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 31GNNof741419228
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 Feb 2023 23:23:50 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 12DA72004B;
	Thu, 16 Feb 2023 23:23:50 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0D88D20040;
	Thu, 16 Feb 2023 23:23:49 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 16 Feb 2023 23:23:49 +0000 (GMT)
Received: from smtpclient.apple (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 4AA65600A5;
	Fri, 17 Feb 2023 10:23:47 +1100 (AEDT)
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH 1/2] kcsan: xtensa: Add atomic builtin stubs for 32-bit
 systems
From: Rohan McLure <rmclure@linux.ibm.com>
In-Reply-To: <Y+3kwmFhWilN2OaE@elver.google.com>
Date: Fri, 17 Feb 2023 10:23:37 +1100
Message-Id: <BD87DB92-9BE9-4145-AAAE-F947DA4EF7FD@linux.ibm.com>
References: <20230216050938.2188488-1-rmclure@linux.ibm.com>
 <42e62369-8dd0-cbfc-855d-7ad18e518cee@csgroup.eu>
 <Y+3kwmFhWilN2OaE@elver.google.com>
To: Marco Elver <elver@google.com>
X-Mailer: Apple Mail (2.3731.400.51.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: GekkrYdHog4pLala9GAJcHwQnvoRdTUn
X-Proofpoint-ORIG-GUID: 1B7vN6wjGsbzGTiyS85nSqhUW6E26uuf
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-16_16,2023-02-16_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 bulkscore=0
 spamscore=0 lowpriorityscore=0 mlxscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302160198
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
Cc: Dmitry Vyukov <dvyukov@google.com>, Max Filippov <jcmvbkbc@gmail.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, kasan-dev <kasan-dev@googlegroups.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> On 16 Feb 2023, at 7:09 pm, Marco Elver <elver@google.com> wrote:
>=20
> On Thu, Feb 16, 2023 at 07:12AM +0000, Christophe Leroy wrote:
>>=20
>>=20
>> Le 16/02/2023 =C3=A0 06:09, Rohan McLure a =C3=A9crit :
>>> KCSAN instruments calls to atomic builtins, and will in turn call these
>>> builtins itself. As such, architectures supporting KCSAN must have
>>> compiler support for these atomic primitives.
>>>=20
>>> Since 32-bit systems are unlikely to have 64-bit compiler builtins,
>>> provide a stub for each missing builtin, and use BUG() to assert
>>> unreachability.
>>>=20
>>> In commit 725aea873261 ("xtensa: enable KCSAN"), xtensa implements these
>>> locally. Move these definitions to be accessible to all 32-bit
>>> architectures that do not provide the necessary builtins, with opt in
>>> for PowerPC and xtensa.
>>>=20
>>> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
>>> Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>
>>=20
>> This series should also be addressed to KCSAN Maintainers, shouldn't it ?
>>=20
>> KCSAN
>> M: Marco Elver <elver@google.com>
>> R: Dmitry Vyukov <dvyukov@google.com>
>> L: kasan-dev@googlegroups.com
>> S: Maintained
>> F: Documentation/dev-tools/kcsan.rst
>> F: include/linux/kcsan*.h
>> F: kernel/kcsan/
>> F: lib/Kconfig.kcsan
>> F: scripts/Makefile.kcsan
>>=20
>>=20
>>> ---
>>> Previously issued as a part of a patch series adding KCSAN support to
>>> 64-bit.
>>> Link: https://lore.kernel.org/linuxppc-dev/167646486000.1421441.1007005=
9569986228558.b4-ty@ellerman.id.au/T/#t
>>> v1: Remove __has_builtin check, as gcc is not obligated to inline
>>> builtins detected using this check, but instead is permitted to supply
>>> them in libatomic:
>>> Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D108734
>>> Instead, opt-in PPC32 and xtensa.
>>> ---
>>>  arch/xtensa/lib/Makefile                              | 1 -
>>>  kernel/kcsan/Makefile                                 | 2 ++
>>>  arch/xtensa/lib/kcsan-stubs.c =3D> kernel/kcsan/stubs.c | 0
>>>  3 files changed, 2 insertions(+), 1 deletion(-)
>>>  rename arch/xtensa/lib/kcsan-stubs.c =3D> kernel/kcsan/stubs.c (100%)
>>>=20
>>> diff --git a/arch/xtensa/lib/Makefile b/arch/xtensa/lib/Makefile
>>> index 7ecef0519a27..d69356dc97df 100644
>>> --- a/arch/xtensa/lib/Makefile
>>> +++ b/arch/xtensa/lib/Makefile
>>> @@ -8,5 +8,4 @@ lib-y +=3D memcopy.o memset.o checksum.o \
>>>      divsi3.o udivsi3.o modsi3.o umodsi3.o mulsi3.o umulsidi3.o \
>>>      usercopy.o strncpy_user.o strnlen_user.o
>>>  lib-$(CONFIG_PCI) +=3D pci-auto.o
>>> -lib-$(CONFIG_KCSAN) +=3D kcsan-stubs.o
>>>  KCSAN_SANITIZE_kcsan-stubs.o :=3D n
>>> diff --git a/kernel/kcsan/Makefile b/kernel/kcsan/Makefile
>>> index 8cf70f068d92..86dd713d8855 100644
>>> --- a/kernel/kcsan/Makefile
>>> +++ b/kernel/kcsan/Makefile
>>> @@ -12,6 +12,8 @@ CFLAGS_core.o :=3D $(call cc-option,-fno-conserve-sta=
ck) \
>>>   -fno-stack-protector -DDISABLE_BRANCH_PROFILING
>>>=20
>>>  obj-y :=3D core.o debugfs.o report.o
>>> +obj-$(CONFIG_PPC32) +=3D stubs.o
>>> +obj-$(CONFIG_XTENSA) +=3D stubs.o
>>=20
>> Not sure it is acceptable to do it that way.
>>=20
>> There should likely be something like a CONFIG_ARCH_WANTS_KCSAN_STUBS in=
=20
>> KCSAN's Kconfig then PPC32 and XTENSA should select it.
>=20
> The longer I think about it, since these stubs all BUG() anyway, perhaps
> we ought to just avoid them altogether. If you delete all the stubs from
> ppc and xtensa, but do this:
>=20
> | diff --git a/kernel/kcsan/core.c b/kernel/kcsan/core.c
> | index 54d077e1a2dc..8169d6dadd0e 100644
> | --- a/kernel/kcsan/core.c
> | +++ b/kernel/kcsan/core.c
> | @@ -1261,7 +1261,9 @@ static __always_inline void kcsan_atomic_builtin_=
memorder(int memorder)
> |  DEFINE_TSAN_ATOMIC_OPS(8);
> |  DEFINE_TSAN_ATOMIC_OPS(16);
> |  DEFINE_TSAN_ATOMIC_OPS(32);
> | +#ifdef CONFIG_64BIT
> |  DEFINE_TSAN_ATOMIC_OPS(64);
> | +#endif
> |=20=20
> |  void __tsan_atomic_thread_fence(int memorder);
> |  void __tsan_atomic_thread_fence(int memorder)
>=20
> Does that work?

This makes much more sense. Rather than assume that kcsan is the only
consumer of __atomic_*_8, and stubbing accordingly, we should just
remove its mention from relevant sub-archs.


