Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A60423BA44
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Aug 2020 14:25:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BLYqv2NxkzDqcN
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Aug 2020 22:25:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BLYnT1NKpzDqST
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Aug 2020 22:23:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=IVwai/wy; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BLYnS4CVsz9sTC;
 Tue,  4 Aug 2020 22:23:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1596543804;
 bh=iCcEy9l5MhmmCUSrBgymTzz3rFYN21abzNxwZncBv3g=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=IVwai/wyH5IjjEywUho1iRCuq7CUKACI+qBiuQ1xS//vILxDyWKX3Kayz2buuOY9U
 C/Mg4IZ7aEBHbSpveHLkQQkNLtyiYvAvF/w2cukJT8MiPumHfj+ua3kOnUMWWqt6q5
 EutqUzRAblThEmHWfJrmlBZgvhX6uSkshR71GJGyVv02jTu91Uq9/CpTzYGcHJmi4r
 ROW+v3Hp5WSgEpw8qk3+u/hGjAYJmTRwbjQKgqWnzIsQjjBtLR6BZIkHBB9XA37ykL
 ztLKs/+/XPqWKEyVRwfuLWH+lzoQQ/sN5CHHNgDAb6cl39xVDG8c9XFtjvOQGRtUjf
 iotAnIAly3gDg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Sandipan Das <sandipan@linux.ibm.com>
Subject: Re: [merge] Build failure selftest/powerpc/mm/pkey_exec_prot
In-Reply-To: <185c2277-91fd-74eb-3c04-75caeb90ed9e@linux.ibm.com>
References: <37C1E196-B35D-46C4-AAA7-BC250078E4F2@linux.vnet.ibm.com>
 <63dc2f90-9a16-21f8-51fa-cfef9df80676@linux.ibm.com>
 <C44DC5C2-5133-49AA-BAA6-58E334EB70BA@linux.vnet.ibm.com>
 <875za00z75.fsf@mpe.ellerman.id.au>
 <3ada0268-9474-5ee6-b1aa-82e8d245615d@linux.ibm.com>
 <87mu3bz083.fsf@mpe.ellerman.id.au>
 <185c2277-91fd-74eb-3c04-75caeb90ed9e@linux.ibm.com>
Date: Tue, 04 Aug 2020 22:23:24 +1000
Message-ID: <877duezjk3.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sandipan Das <sandipan@linux.ibm.com> writes:
> On 04/08/20 6:38 am, Michael Ellerman wrote:
>> Sandipan Das <sandipan@linux.ibm.com> writes:
>>> On 03/08/20 4:32 pm, Michael Ellerman wrote:
>>>> Sachin Sant <sachinp@linux.vnet.ibm.com> writes:
>>>>>> On 02-Aug-2020, at 10:58 PM, Sandipan Das <sandipan@linux.ibm.com> wrote:
>>>>>> On 02/08/20 4:45 pm, Sachin Sant wrote:
>>>>>>> pkey_exec_prot test from linuxppc merge branch (3f68564f1f5a) fails to
>>>>>>> build due to following error:
>>>>>>>
>>>>>>> gcc -std=gnu99 -O2 -Wall -Werror -DGIT_VERSION='"v5.8-rc7-1276-g3f68564f1f5a"' -I/home/sachin/linux/tools/testing/selftests/powerpc/include  -m64    pkey_exec_prot.c /home/sachin/linux/tools/testing/selftests/kselftest_harness.h /home/sachin/linux/tools/testing/selftests/kselftest.h ../harness.c ../utils.c  -o /home/sachin/linux/tools/testing/selftests/powerpc/mm/pkey_exec_prot
>>>>>>> In file included from pkey_exec_prot.c:18:
>>>>>>> /home/sachin/linux/tools/testing/selftests/powerpc/include/pkeys.h:34: error: "SYS_pkey_mprotect" redefined [-Werror]
>>>>>>> #define SYS_pkey_mprotect 386
>>>>>>>
>>>>>>> In file included from /usr/include/sys/syscall.h:31,
>>>>>>>                 from /home/sachin/linux/tools/testing/selftests/powerpc/include/utils.h:47,
>>>>>>>                 from /home/sachin/linux/tools/testing/selftests/powerpc/include/pkeys.h:12,
>>>>>>>                 from pkey_exec_prot.c:18:
>>>>>>> /usr/include/bits/syscall.h:1583: note: this is the location of the previous definition
>>>>>>> # define SYS_pkey_mprotect __NR_pkey_mprotect
>>>>>>>
>>>>>>> commit 128d3d021007 introduced this error.
>>>>>>> selftests/powerpc: Move pkey helpers to headers
>>>>>>>
>>>>>>> Possibly the # defines for sys calls can be retained in pkey_exec_prot.c or
>>>>>>>
>>>>>>
>>>>>> I am unable to reproduce this on the latest merge branch (HEAD at f59195f7faa4).
>>>>>> I don't see any redefinitions in pkey_exec_prot.c either.
>>>>>>
>>>>>
>>>>> I can still see this problem on latest merge branch.
>>>>> I have following gcc version
>>>>>
>>>>> gcc version 8.3.1 20191121
>>>>
>>>> What libc version? Or just the distro & version?
>>>
>>> Sachin observed this on RHEL 8.2 with glibc-2.28.
>>> I couldn't reproduce it on Ubuntu 20.04 and Fedora 32 and both these distros
>>> are using glibc-2.31.
>> 
>> OK odd. Usually it's newer glibc that hits this problem.
>> 
>> I guess on RHEL 8.2 we're getting the asm-generic version? But that
>> would be quite wrong if that's what's happening.
>
> If I let GCC dump all the headers that are being used for the source file, I always
> see syscall.h being included on the RHEL 8.2 system. That is the header with the
> conflicting definition.
>
>   $ cd tools/testing/selftests/powerpc/mm
>   $ gcc -H -std=gnu99 -O2 -Wall -Werror -DGIT_VERSION='"v5.8-rc7-1456-gf59195f7faa4-dirty"' \
>         -I../include -m64 pkey_exec_prot.c ../../kselftest_harness.h ../../kselftest.h ../harness.c ../utils.c \
>         -o pkey_exec_prot 2>&1 | grep syscall
>
> On Ubuntu 20.04 and Fedora 32, grep doesn't find any matching text.
> On RHEL 8.2, it shows the following.
>   ... /usr/include/sys/syscall.h
>   .... /usr/include/bits/syscall.h
>   In file included from /usr/include/sys/syscall.h:31,
>   /usr/include/bits/syscall.h:1583: note: this is the location of the previous definition
>   In file included from /usr/include/sys/syscall.h:31,
>   /usr/include/bits/syscall.h:1575: note: this is the location of the previous definition
>   In file included from /usr/include/sys/syscall.h:31,
>   /usr/include/bits/syscall.h:1579: note: this is the location of the previous definition
>   /usr/include/bits/syscall.h
>   .. /usr/include/sys/syscall.h
>   ... /usr/include/bits/syscall.h
>   /usr/include/bits/syscall.h
>   .. /usr/include/sys/syscall.h
>   ... /usr/include/bits/syscall.h
>   /usr/include/bits/syscall.h
>
> So utils.h is also including /usr/include/sys/syscall.h for glibc versions older than 2.30
> because of commit 743f3544fffb ("selftests/powerpc: Add wrapper for gettid") :)

Haha, of course. :facepalm_emoji:

> [...]
> . ../include/pkeys.h
> [...]
> .. ../include/utils.h
> [...]
> ... /usr/include/sys/syscall.h
> .... /usr/include/asm/unistd.h
> .... /usr/include/bits/syscall.h
> In file included from pkey_exec_prot.c:18:
> ../include/pkeys.h:34: error: "SYS_pkey_mprotect" redefined [-Werror]
>  #define SYS_pkey_mprotect 386
>
> In file included from /usr/include/sys/syscall.h:31,
>                  from ../include/utils.h:47,
>                  from ../include/pkeys.h:12,
>                  from pkey_exec_prot.c:18:
> /usr/include/bits/syscall.h:1583: note: this is the location of the previous definition
>  # define SYS_pkey_mprotect __NR_pkey_mprotect

Aha, that explains why redefining gives us an error, because we're
defining it to the literal 386 whereas the system header is defining it
to the __NR value.

Is there a reason to use the SYS_ name?

Typically we just use the __NR value directly, and that would avoid any
problems with redefinition I think, as long as we're using the same
value as the system header (which we always should be).

eg:

diff --git a/tools/testing/selftests/powerpc/include/pkeys.h b/tools/testing/selftests/powerpc/include/pkeys.h
index 6ba95039a034..3312cb1b058d 100644
--- a/tools/testing/selftests/powerpc/include/pkeys.h
+++ b/tools/testing/selftests/powerpc/include/pkeys.h
@@ -31,9 +31,9 @@
 
 #define SI_PKEY_OFFSET	0x20
 
-#define SYS_pkey_mprotect	386
-#define SYS_pkey_alloc		384
-#define SYS_pkey_free		385
+#define __NR_pkey_mprotect	386
+#define __NR_pkey_alloc		384
+#define __NR_pkey_free		385
 
 #define PKEY_BITS_PER_PKEY	2
 #define NR_PKEYS		32
@@ -62,17 +62,17 @@ void pkey_set_rights(int pkey, unsigned long rights)
 
 int sys_pkey_mprotect(void *addr, size_t len, int prot, int pkey)
 {
-	return syscall(SYS_pkey_mprotect, addr, len, prot, pkey);
+	return syscall(__NR_pkey_mprotect, addr, len, prot, pkey);
 }
 
 int sys_pkey_alloc(unsigned long flags, unsigned long rights)
 {
-	return syscall(SYS_pkey_alloc, flags, rights);
+	return syscall(__NR_pkey_alloc, flags, rights);
 }
 
 int sys_pkey_free(int pkey)
 {
-	return syscall(SYS_pkey_free, pkey);
+	return syscall(__NR_pkey_free, pkey);
 }
 
 int pkeys_unsupported(void)


cheers
