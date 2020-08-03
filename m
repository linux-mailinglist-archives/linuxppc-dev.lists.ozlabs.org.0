Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 10878239F32
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Aug 2020 07:45:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BKn0D4Qj9zDqNm
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Aug 2020 15:45:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BKmyS6M9vzDqGM
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Aug 2020 15:43:28 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0735XEN1087228
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 3 Aug 2020 01:43:25 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32pa5ru5yr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Aug 2020 01:43:24 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0735ZLNe009095
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 3 Aug 2020 05:43:23 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma05fra.de.ibm.com with ESMTP id 32n017s38m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Aug 2020 05:43:22 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0735hKsm24248792
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 3 Aug 2020 05:43:20 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0B147AE055;
 Mon,  3 Aug 2020 05:43:20 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DEE80AE056;
 Mon,  3 Aug 2020 05:43:18 +0000 (GMT)
Received: from [9.85.107.151] (unknown [9.85.107.151])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  3 Aug 2020 05:43:18 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.15\))
Subject: Re: [merge] Build failure selftest/powerpc/mm/pkey_exec_prot
From: Sachin Sant <sachinp@linux.vnet.ibm.com>
In-Reply-To: <63dc2f90-9a16-21f8-51fa-cfef9df80676@linux.ibm.com>
Date: Mon, 3 Aug 2020 11:13:17 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <C44DC5C2-5133-49AA-BAA6-58E334EB70BA@linux.vnet.ibm.com>
References: <37C1E196-B35D-46C4-AAA7-BC250078E4F2@linux.vnet.ibm.com>
 <63dc2f90-9a16-21f8-51fa-cfef9df80676@linux.ibm.com>
To: Sandipan Das <sandipan@linux.ibm.com>
X-Mailer: Apple Mail (2.3445.104.15)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-03_04:2020-07-31,
 2020-08-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=999 impostorscore=0 mlxscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=2 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2008030037
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 02-Aug-2020, at 10:58 PM, Sandipan Das <sandipan@linux.ibm.com> =
wrote:
>=20
> Hi Sachin,
>=20
> On 02/08/20 4:45 pm, Sachin Sant wrote:
>> pkey_exec_prot test from linuxppc merge branch (3f68564f1f5a) fails =
to
>> build due to following error:
>>=20
>> gcc -std=3Dgnu99 -O2 -Wall -Werror =
-DGIT_VERSION=3D'"v5.8-rc7-1276-g3f68564f1f5a"' =
-I/home/sachin/linux/tools/testing/selftests/powerpc/include  -m64    =
pkey_exec_prot.c =
/home/sachin/linux/tools/testing/selftests/kselftest_harness.h =
/home/sachin/linux/tools/testing/selftests/kselftest.h ../harness.c =
../utils.c  -o =
/home/sachin/linux/tools/testing/selftests/powerpc/mm/pkey_exec_prot
>> In file included from pkey_exec_prot.c:18:
>> =
/home/sachin/linux/tools/testing/selftests/powerpc/include/pkeys.h:34: =
error: "SYS_pkey_mprotect" redefined [-Werror]
>> #define SYS_pkey_mprotect 386
>>=20
>> In file included from /usr/include/sys/syscall.h:31,
>>                 from =
/home/sachin/linux/tools/testing/selftests/powerpc/include/utils.h:47,
>>                 from =
/home/sachin/linux/tools/testing/selftests/powerpc/include/pkeys.h:12,
>>                 from pkey_exec_prot.c:18:
>> /usr/include/bits/syscall.h:1583: note: this is the location of the =
previous definition
>> # define SYS_pkey_mprotect __NR_pkey_mprotect
>>=20
>> commit 128d3d021007 introduced this error.
>> selftests/powerpc: Move pkey helpers to headers
>>=20
>> Possibly the # defines for sys calls can be retained in =
pkey_exec_prot.c or
>>=20
>=20
> I am unable to reproduce this on the latest merge branch (HEAD at =
f59195f7faa4).
> I don't see any redefinitions in pkey_exec_prot.c either.
>=20

I can still see this problem on latest merge branch.
I have following gcc version

gcc version 8.3.1 20191121

# git show
commit f59195f7faa4896b7c1d947ac2dba29ec18ad569 (HEAD -> merge, =
origin/merge)
Merge: 70ce795dac09 ac3a0c847296
Author: Michael Ellerman <mpe@ellerman.id.au>
Date:   Sun Aug 2 23:18:03 2020 +1000

    Automatic merge of 'master', 'next' and 'fixes' (2020-08-02 23:18)

# make -C powerpc
=E2=80=A6=E2=80=A6
=E2=80=A6...
BUILD_TARGET=3D/home/sachin/linux/tools/testing/selftests/powerpc/mm; =
mkdir -p $BUILD_TARGET; make OUTPUT=3D$BUILD_TARGET -k -C mm all
make[1]: Entering directory =
'/home/sachin/linux/tools/testing/selftests/powerpc/mm'
gcc -std=3Dgnu99 -O2 -Wall -Werror =
-DGIT_VERSION=3D'"v5.8-rc7-1456-gf59195f7faa4"' =
-I/home/sachin/linux/tools/testing/selftests/powerpc/include  -m64    =
pkey_exec_prot.c =
/home/sachin/linux/tools/testing/selftests/kselftest_harness.h =
/home/sachin/linux/tools/testing/selftests/kselftest.h ../harness.c =
../utils.c  -o =
/home/sachin/linux/tools/testing/selftests/powerpc/mm/pkey_exec_prot
In file included from pkey_exec_prot.c:18:
/home/sachin/linux/tools/testing/selftests/powerpc/include/pkeys.h:34: =
error: "SYS_pkey_mprotect" redefined [-Werror]
 #define SYS_pkey_mprotect 386
=20
In file included from /usr/include/sys/syscall.h:31,
                 from =
/home/sachin/linux/tools/testing/selftests/powerpc/include/utils.h:47,
                 from =
/home/sachin/linux/tools/testing/selftests/powerpc/include/pkeys.h:12,
                 from pkey_exec_prot.c:18:
/usr/include/bits/syscall.h:1583: note: this is the location of the =
previous definition
 # define SYS_pkey_mprotect __NR_pkey_mprotect
=20
In file included from pkey_exec_prot.c:18:
/home/sachin/linux/tools/testing/selftests/powerpc/include/pkeys.h:35: =
error: "SYS_pkey_alloc" redefined [-Werror]
 #define SYS_pkey_alloc  384
=20
In file included from /usr/include/sys/syscall.h:31,
                 from =
/home/sachin/linux/tools/testing/selftests/powerpc/include/utils.h:47,
                 from =
/home/sachin/linux/tools/testing/selftests/powerpc/include/pkeys.h:12,
                 from pkey_exec_prot.c:18:
/usr/include/bits/syscall.h:1575: note: this is the location of the =
previous definition
 # define SYS_pkey_alloc __NR_pkey_alloc
=20
In file included from pkey_exec_prot.c:18:
/home/sachin/linux/tools/testing/selftests/powerpc/include/pkeys.h:36: =
error: "SYS_pkey_free" redefined [-Werror]
 #define SYS_pkey_free  385
=20
In file included from /usr/include/sys/syscall.h:31,
                 from =
/home/sachin/linux/tools/testing/selftests/powerpc/include/utils.h:47,
                 from =
/home/sachin/linux/tools/testing/selftests/powerpc/include/pkeys.h:12,
                 from pkey_exec_prot.c:18:
/usr/include/bits/syscall.h:1579: note: this is the location of the =
previous definition
 # define SYS_pkey_free __NR_pkey_free
=20
cc1: all warnings being treated as errors
make[1]: *** [../../lib.mk:142: =
/home/sachin/linux/tools/testing/selftests/powerpc/mm/pkey_exec_prot] =
Error 1
gcc -std=3Dgnu99 -O2 -Wall -Werror =
-DGIT_VERSION=3D'"v5.8-rc7-1456-gf59195f7faa4"' =
-I/home/sachin/linux/tools/testing/selftests/powerpc/include  -m64    =
pkey_siginfo.c =
/home/sachin/linux/tools/testing/selftests/kselftest_harness.h =
/home/sachin/linux/tools/testing/selftests/kselftest.h ../harness.c =
../utils.c -lpthread -o =
/home/sachin/linux/tools/testing/selftests/powerpc/mm/pkey_siginfo
In file included from pkey_siginfo.c:22:
/home/sachin/linux/tools/testing/selftests/powerpc/include/pkeys.h:34: =
error: "SYS_pkey_mprotect" redefined [-Werror]
 #define SYS_pkey_mprotect 386
=20
In file included from /usr/include/sys/syscall.h:31,
                 from =
/home/sachin/linux/tools/testing/selftests/powerpc/include/utils.h:47,
                 from =
/home/sachin/linux/tools/testing/selftests/powerpc/include/pkeys.h:12,
                 from pkey_siginfo.c:22:
/usr/include/bits/syscall.h:1583: note: this is the location of the =
previous definition
 # define SYS_pkey_mprotect __NR_pkey_mprotect
=20
In file included from pkey_siginfo.c:22:
/home/sachin/linux/tools/testing/selftests/powerpc/include/pkeys.h:35: =
error: "SYS_pkey_alloc" redefined [-Werror]
 #define SYS_pkey_alloc  384
=20
In file included from /usr/include/sys/syscall.h:31,
                 from =
/home/sachin/linux/tools/testing/selftests/powerpc/include/utils.h:47,
                 from =
/home/sachin/linux/tools/testing/selftests/powerpc/include/pkeys.h:12,
                 from pkey_siginfo.c:22:
/usr/include/bits/syscall.h:1575: note: this is the location of the =
previous definition
 # define SYS_pkey_alloc __NR_pkey_alloc
=20
In file included from pkey_siginfo.c:22:
/home/sachin/linux/tools/testing/selftests/powerpc/include/pkeys.h:36: =
error: "SYS_pkey_free" redefined [-Werror]
 #define SYS_pkey_free  385
=20
In file included from /usr/include/sys/syscall.h:31,
                 from =
/home/sachin/linux/tools/testing/selftests/powerpc/include/utils.h:47,
                 from =
/home/sachin/linux/tools/testing/selftests/powerpc/include/pkeys.h:12,
                 from pkey_siginfo.c:22:
/usr/include/bits/syscall.h:1579: note: this is the location of the =
previous definition
 # define SYS_pkey_free __NR_pkey_free
=20
cc1: all warnings being treated as errors
make[1]: *** [../../lib.mk:142: =
/home/sachin/linux/tools/testing/selftests/powerpc/mm/pkey_siginfo] =
Error 1
make[1]: Target 'all' not remade because of errors.
make[1]: Leaving directory =
'/home/sachin/linux/tools/testing/selftests/powerpc/mm'
make: *** [Makefile:41: mm] Error 2
make: Leaving directory =
'/home/sachin/linux/tools/testing/selftests/powerpc'
#=20

Thanks
-Sachin=
