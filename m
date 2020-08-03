Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B91823A30C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Aug 2020 13:04:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BKw4Z3rldzDqXT
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Aug 2020 21:04:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BKw2n0l14zDqMg
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Aug 2020 21:02:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=irn85kuW; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BKw2m2pT4z9s1x;
 Mon,  3 Aug 2020 21:02:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1596452560;
 bh=Ixzz+6INoFrmvb7f27GTnI38vME4BqZRTGItR8pOUjY=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=irn85kuW+iEFrOhtJfAkHgrRnCuFjg0ybGaWZAt35S81vaVffhDk22qsYWD17xk3M
 1RgJsSckrngydkMkp5zVMjMRnt26A/cT9V1Nhm8+F4IvLcU7j5UOIpkgQOv79YBaSi
 3XBuaVqF3R0MxauAsDNSFaB/doUrzCR+b60Vw2yZ2eoF+nTTxk3bZstmC88ZrolbA3
 cth2xTrQjABxCuBlTd1cis9Qf8v0dt6AXMBVJl8Z150JhlbFqFalw3SwQ9vssQLuAV
 8PPwClzLNfs51K4oM4WPJHWE9NbmmJvhIvZnaCWg9vAxED7jILoIGfZdhG410OeDgL
 RFWuh/fckwt0g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Sachin Sant <sachinp@linux.vnet.ibm.com>,
 Sandipan Das <sandipan@linux.ibm.com>
Subject: Re: [merge] Build failure selftest/powerpc/mm/pkey_exec_prot
In-Reply-To: <C44DC5C2-5133-49AA-BAA6-58E334EB70BA@linux.vnet.ibm.com>
References: <37C1E196-B35D-46C4-AAA7-BC250078E4F2@linux.vnet.ibm.com>
 <63dc2f90-9a16-21f8-51fa-cfef9df80676@linux.ibm.com>
 <C44DC5C2-5133-49AA-BAA6-58E334EB70BA@linux.vnet.ibm.com>
Date: Mon, 03 Aug 2020 21:02:38 +1000
Message-ID: <875za00z75.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

Sachin Sant <sachinp@linux.vnet.ibm.com> writes:
>> On 02-Aug-2020, at 10:58 PM, Sandipan Das <sandipan@linux.ibm.com> wrote:
>> On 02/08/20 4:45 pm, Sachin Sant wrote:
>>> pkey_exec_prot test from linuxppc merge branch (3f68564f1f5a) fails to
>>> build due to following error:
>>>=20
>>> gcc -std=3Dgnu99 -O2 -Wall -Werror -DGIT_VERSION=3D'"v5.8-rc7-1276-g3f6=
8564f1f5a"' -I/home/sachin/linux/tools/testing/selftests/powerpc/include  -=
m64    pkey_exec_prot.c /home/sachin/linux/tools/testing/selftests/kselftes=
t_harness.h /home/sachin/linux/tools/testing/selftests/kselftest.h ../harne=
ss.c ../utils.c  -o /home/sachin/linux/tools/testing/selftests/powerpc/mm/p=
key_exec_prot
>>> In file included from pkey_exec_prot.c:18:
>>> /home/sachin/linux/tools/testing/selftests/powerpc/include/pkeys.h:34: =
error: "SYS_pkey_mprotect" redefined [-Werror]
>>> #define SYS_pkey_mprotect 386
>>>=20
>>> In file included from /usr/include/sys/syscall.h:31,
>>>                 from /home/sachin/linux/tools/testing/selftests/powerpc=
/include/utils.h:47,
>>>                 from /home/sachin/linux/tools/testing/selftests/powerpc=
/include/pkeys.h:12,
>>>                 from pkey_exec_prot.c:18:
>>> /usr/include/bits/syscall.h:1583: note: this is the location of the pre=
vious definition
>>> # define SYS_pkey_mprotect __NR_pkey_mprotect
>>>=20
>>> commit 128d3d021007 introduced this error.
>>> selftests/powerpc: Move pkey helpers to headers
>>>=20
>>> Possibly the # defines for sys calls can be retained in pkey_exec_prot.=
c or
>>>=20
>>=20
>> I am unable to reproduce this on the latest merge branch (HEAD at f59195=
f7faa4).
>> I don't see any redefinitions in pkey_exec_prot.c either.
>>=20
>
> I can still see this problem on latest merge branch.
> I have following gcc version
>
> gcc version 8.3.1 20191121

What libc version? Or just the distro & version?

cheers

> # git show
> commit f59195f7faa4896b7c1d947ac2dba29ec18ad569 (HEAD -> merge, origin/me=
rge)
> Merge: 70ce795dac09 ac3a0c847296
> Author: Michael Ellerman <mpe@ellerman.id.au>
> Date:   Sun Aug 2 23:18:03 2020 +1000
>
>     Automatic merge of 'master', 'next' and 'fixes' (2020-08-02 23:18)
>
> # make -C powerpc
> =E2=80=A6=E2=80=A6
> =E2=80=A6...
> BUILD_TARGET=3D/home/sachin/linux/tools/testing/selftests/powerpc/mm; mkd=
ir -p $BUILD_TARGET; make OUTPUT=3D$BUILD_TARGET -k -C mm all
> make[1]: Entering directory '/home/sachin/linux/tools/testing/selftests/p=
owerpc/mm'
> gcc -std=3Dgnu99 -O2 -Wall -Werror -DGIT_VERSION=3D'"v5.8-rc7-1456-gf5919=
5f7faa4"' -I/home/sachin/linux/tools/testing/selftests/powerpc/include  -m6=
4    pkey_exec_prot.c /home/sachin/linux/tools/testing/selftests/kselftest_=
harness.h /home/sachin/linux/tools/testing/selftests/kselftest.h ../harness=
.c ../utils.c  -o /home/sachin/linux/tools/testing/selftests/powerpc/mm/pke=
y_exec_prot
> In file included from pkey_exec_prot.c:18:
> /home/sachin/linux/tools/testing/selftests/powerpc/include/pkeys.h:34: er=
ror: "SYS_pkey_mprotect" redefined [-Werror]
>  #define SYS_pkey_mprotect 386
>=20=20
> In file included from /usr/include/sys/syscall.h:31,
>                  from /home/sachin/linux/tools/testing/selftests/powerpc/=
include/utils.h:47,
>                  from /home/sachin/linux/tools/testing/selftests/powerpc/=
include/pkeys.h:12,
>                  from pkey_exec_prot.c:18:
> /usr/include/bits/syscall.h:1583: note: this is the location of the previ=
ous definition
>  # define SYS_pkey_mprotect __NR_pkey_mprotect
