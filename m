Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9074E2221
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 09:24:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KMSM24G9fz3bWk
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 19:23:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZAt7YPkg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ZAt7YPkg; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KMSGV67ksz30J9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Mar 2022 19:20:02 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22L6rFRk005960; 
 Mon, 21 Mar 2022 08:19:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : subject :
 to : cc : references : in-reply-to : mime-version : message-id :
 content-type : content-transfer-encoding; s=pp1;
 bh=CjfWUGHxYhfqPcnHqeIylZHM+/NNuTtAHnW2CbPEIvU=;
 b=ZAt7YPkgb6NnHz1vAXiOlFQ8FuL7xzvDsffWsHuQPrrx4YjmBT/OBNeH125iydkUmLca
 1VJzABKvgrHBxFdyxV4Y2pwgDQq8zXHiXjSFjRKmA5zUvxGBmQ/S+msmS7nM1HGskPZ3
 Pt3IEZOvRRTK8xLTu6gsZ5hr7tMMzDzDFP9JYKiJIqQY7jYODwx7zvN4XqrAjw0srWpA
 DFYRolwImk9/9/NoDh4j4wPOTGPhHKf2Mp4kW5FWYPkFKUPgLuCDES61uVssYzxN7n22
 MX7417gsTu/72UwJ9elCDhTvZEsYueo0d4opUvp+XHlwwuMxGJZFveXHpwO1FkZepbAs pA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3exmg1hw7d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Mar 2022 08:19:35 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22L8IXst010238;
 Mon, 21 Mar 2022 08:19:34 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3exmg1hw72-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Mar 2022 08:19:34 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22L8643A024705;
 Mon, 21 Mar 2022 08:19:33 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 3ew6t8ub3j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Mar 2022 08:19:32 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22L8JUde34275802
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Mar 2022 08:19:30 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BA2064203F;
 Mon, 21 Mar 2022 08:19:30 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 523CC42042;
 Mon, 21 Mar 2022 08:19:30 +0000 (GMT)
Received: from localhost (unknown [9.43.115.88])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 21 Mar 2022 08:19:30 +0000 (GMT)
Date: Mon, 21 Mar 2022 13:49:28 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [RFC PATCH 2/3] objtool: Enable and implement 'mcount' subcommand
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Sathvika Vasireddy <sv@linux.ibm.com>
References: <20220318105140.43914-1-sv@linux.ibm.com>
 <20220318105140.43914-3-sv@linux.ibm.com>
 <8e792a9a-afb8-9b26-5e97-8f51c72c2d42@csgroup.eu>
In-Reply-To: <8e792a9a-afb8-9b26-5e97-8f51c72c2d42@csgroup.eu>
MIME-Version: 1.0
User-Agent: astroid/4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1647850610.961i89najm.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ni1KyhidJzwlSMKtek7onKrFj-bsI0lM
X-Proofpoint-ORIG-GUID: Mu-m5NsU0FC1-WpxvdRKrUJ8ANLjbcdp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-21_02,2022-03-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 mlxscore=0 priorityscore=1501 spamscore=0 mlxlogscore=995
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2202240000 definitions=main-2203210049
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
Cc: "aik@ozlabs.ru" <aik@ozlabs.ru>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>,
 "jpoimboe@redhat.com" <jpoimboe@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy wrote:
>=20
>=20
> Le 18/03/2022 =C3=A0 11:51, Sathvika Vasireddy a =C3=A9crit=C2=A0:
>> This patch adds 'mcount' as a subcommand to objtool, and enables
>> the same for x86. objtool is built if CONFIG_FTRACE_MCOUNT_USE_OBJTOOL
>> is selected. Additionally, architectures can select HAVE_NOP_MCOUNT
>> if they choose to nop out mcount call sites. If that config option is
>> selected, then --mnop is passed as an option to 'objtool mcount'
>>=20
>> Signed-off-by: Sathvika Vasireddy <sv@linux.ibm.com>
>> ---
>>   Makefile                                |   6 ++
>>   arch/x86/Kconfig                        |   3 +-
>>   scripts/Makefile.build                  |  12 +++
>>   tools/objtool/Build                     |   2 +
>>   tools/objtool/Makefile                  |   4 +-
>>   tools/objtool/builtin-mcount.c          |  74 +++++++++++++
>>   tools/objtool/include/objtool/builtin.h |   4 +-
>>   tools/objtool/include/objtool/objtool.h |   1 +
>>   tools/objtool/mcount.c                  | 138 ++++++++++++++++++++++++
>>   tools/objtool/objtool.c                 |   1 +
>>   tools/objtool/weak.c                    |   5 +
>>   11 files changed, 247 insertions(+), 3 deletions(-)
>>   create mode 100644 tools/objtool/builtin-mcount.c
>>   create mode 100644 tools/objtool/mcount.c
>>=20
>> diff --git a/Makefile b/Makefile
>> index 55a30ca69350..316f7d08b30a 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -846,7 +846,9 @@ ifdef CONFIG_FTRACE_MCOUNT_USE_CC
>>     endif
>>   endif
>>   ifdef CONFIG_FTRACE_MCOUNT_USE_OBJTOOL
>> + ifdef CONFIG_HAVE_NOP_MCOUNT
>>     CC_FLAGS_USING	+=3D -DCC_USING_NOP_MCOUNT
>> + endif
>>   endif
>>   ifdef CONFIG_FTRACE_MCOUNT_USE_RECORDMCOUNT
>>     ifdef CONFIG_HAVE_C_RECORDMCOUNT
>> @@ -1303,6 +1305,10 @@ ifdef CONFIG_STACK_VALIDATION
>>   prepare: tools/objtool
>>   endif
>>  =20
>> +ifdef CONFIG_FTRACE_MCOUNT_USE_OBJTOOL
>> +prepare: tools/objtool
>> +endif
>=20
> I don't think that will work for powerpc.
>=20
> See arch/powerpc/Makefile
>=20
> powerpc builds the VDSO under prepare: , and powerpc has=20
> CONFIG_HAVE_GENERIC_VDSO so there are some C files in that step that=20
> seem to use objtool, allthough that looks odd to me. Must be something=20
> to fix somewhere.
>=20
>    powerpc64-linux-gcc=20
> -Wp,-MMD,arch/powerpc/kernel/vdso/.vgettimeofday-64.o.d -nostdinc=20
> -I./arch/powerpc/include -I./arch/powerpc/include/generated  -I./include=20
> -I./arch/powerpc/include/uapi -I./arch/powerpc/include/generated/uapi=20
> -I./include/uapi -I./include/generated/uapi -include=20
> ./include/linux/compiler-version.h -include ./include/linux/kconfig.h=20
> -include ./include/linux/compiler_types.h -D__KERNEL__ -I ./arch/powerpc=20
> -DHAVE_AS_ATHIGH=3D1 -fmacro-prefix-map=3D./=3D -Wall -Wundef=20
> -Werror=3Dstrict-prototypes -Wno-trigraphs -fno-strict-aliasing=20
> -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-function-declaratio=
n=20
> -Werror=3Dimplicit-int -Werror=3Dreturn-type -Wno-format-security -std=3D=
gnu89=20
> -mbig-endian -m64 -msoft-float -pipe -mtraceback=3Dno -mabi=3Delfv1=20
> -mcall-aixdesc -mcmodel=3Dmedium -mno-pointers-to-nested-functions=20
> -mtune=3Dpower7 -mcpu=3Dpower5 -mno-altivec -mno-vsx=20
> -fno-asynchronous-unwind-tables -mno-string -Wa,-maltivec -Wa,-mpower4=20
> -Wa,-many -mabi=3Delfv1 -mcall-aixdesc -mbig-endian=20
> -mstack-protector-guard=3Dtls -mstack-protector-guard-reg=3Dr13=20
> -fno-delete-null-pointer-checks -Wno-frame-address=20
> -Wno-format-truncation -Wno-format-overflow=20
> -Wno-address-of-packed-member -O2 -fno-allow-store-data-races=20
> -Wframe-larger-than=3D2048 -fstack-protector-strong=20
> -Wimplicit-fallthrough=3D5 -Wno-main -Wno-unused-but-set-variable=20
> -Wno-unused-const-variable -fno-stack-clash-protection=20
> -Wdeclaration-after-statement -Wvla -Wno-pointer-sign=20
> -Wcast-function-type -Wno-stringop-truncation -Wno-zero-length-bounds=20
> -Wno-array-bounds -Wno-stringop-overflow -Wno-restrict=20
> -Wno-maybe-uninitialized -Wno-alloc-size-larger-than=20
> -fno-strict-overflow -fno-stack-check -fconserve-stack -Werror=3Ddate-tim=
e=20
> -Werror=3Dincompatible-pointer-types -Werror=3Ddesignated-init=20
> -Wno-packed-not-aligned -mstack-protector-guard-offset=3D3200 -shared=20
> -fno-common -fno-builtin -nostdlib -Wl,--hash-style=3Dboth -include=20
> /home/chleroy/linux-powerpc/lib/vdso/gettimeofday.c -fno-stack-protector=20
> -DDISABLE_BRANCH_PROFILING -ffreestanding -fasynchronous-unwind-tables=20
> -ffixed-r30=20
> -DKBUILD_MODFILE=3D'"arch/powerpc/kernel/vdso/vgettimeofday-64"'=20
> -DKBUILD_BASENAME=3D'"vgettimeofday_64"'=20
> -DKBUILD_MODNAME=3D'"vgettimeofday_64"'=20
> -D__KBUILD_MODNAME=3Dkmod_vgettimeofday_64 -c -o=20
> arch/powerpc/kernel/vdso/vgettimeofday-64.o=20
> arch/powerpc/kernel/vdso/vgettimeofday.c  ; ./tools/objtool/objtool=20
> mcount arch/powerpc/kernel/vdso/vgettimeofday-64.o

We don't enable ftrace for vdso, so I suspect objtool run above will be=20
a no-op. This needs to be confirmed, of course.


- Naveen

