Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2282A23B21F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Aug 2020 03:11:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BLGt33Y3hzDqQT
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Aug 2020 11:11:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BLGq21Q0yzDqWl
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Aug 2020 11:08:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=c+EXgEgQ; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BLGq14X6yz9sR4;
 Tue,  4 Aug 2020 11:08:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1596503325;
 bh=sqTTqnxaoPbSzcfsW1zeiYdS8SzOZrkg3yBL7fd8tmg=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=c+EXgEgQB9LSYABZaDL9irA+UJWTYe9zF47F2+sUTCqAlrfdjD8+qae5ggxTrNmiG
 UUQ4UazScgVlDRqAaX0SXJx0+5s5ovhiKLYqrAnqGykbb9mJYZ8DiXz3HYZ/YN28Qz
 gY7vV7mnO7sMX4+e8n6isdmaoeUKE8RmeCjxPVDyHW1PlL6ScYy4ZPZTEw94uA/iyx
 ksE89SioGBTw/hQ7yLU4a+psT9R4GWOBozk7krkK24dBl+Z3Ea08dIF/5fYYWZ8rUw
 pT4xiKOmn8EnabUK4kqU1eHSMMTTmK1IQ1MSCp1U3LGud4+AlutFCEJEBeeJD6waTz
 SjmmnfG/IKmBw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Sandipan Das <sandipan@linux.ibm.com>
Subject: Re: [merge] Build failure selftest/powerpc/mm/pkey_exec_prot
In-Reply-To: <3ada0268-9474-5ee6-b1aa-82e8d245615d@linux.ibm.com>
References: <37C1E196-B35D-46C4-AAA7-BC250078E4F2@linux.vnet.ibm.com>
 <63dc2f90-9a16-21f8-51fa-cfef9df80676@linux.ibm.com>
 <C44DC5C2-5133-49AA-BAA6-58E334EB70BA@linux.vnet.ibm.com>
 <875za00z75.fsf@mpe.ellerman.id.au>
 <3ada0268-9474-5ee6-b1aa-82e8d245615d@linux.ibm.com>
Date: Tue, 04 Aug 2020 11:08:44 +1000
Message-ID: <87mu3bz083.fsf@mpe.ellerman.id.au>
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
> On 03/08/20 4:32 pm, Michael Ellerman wrote:
>> Sachin Sant <sachinp@linux.vnet.ibm.com> writes:
>>>> On 02-Aug-2020, at 10:58 PM, Sandipan Das <sandipan@linux.ibm.com> wrote:
>>>> On 02/08/20 4:45 pm, Sachin Sant wrote:
>>>>> pkey_exec_prot test from linuxppc merge branch (3f68564f1f5a) fails to
>>>>> build due to following error:
>>>>>
>>>>> gcc -std=gnu99 -O2 -Wall -Werror -DGIT_VERSION='"v5.8-rc7-1276-g3f68564f1f5a"' -I/home/sachin/linux/tools/testing/selftests/powerpc/include  -m64    pkey_exec_prot.c /home/sachin/linux/tools/testing/selftests/kselftest_harness.h /home/sachin/linux/tools/testing/selftests/kselftest.h ../harness.c ../utils.c  -o /home/sachin/linux/tools/testing/selftests/powerpc/mm/pkey_exec_prot
>>>>> In file included from pkey_exec_prot.c:18:
>>>>> /home/sachin/linux/tools/testing/selftests/powerpc/include/pkeys.h:34: error: "SYS_pkey_mprotect" redefined [-Werror]
>>>>> #define SYS_pkey_mprotect 386
>>>>>
>>>>> In file included from /usr/include/sys/syscall.h:31,
>>>>>                 from /home/sachin/linux/tools/testing/selftests/powerpc/include/utils.h:47,
>>>>>                 from /home/sachin/linux/tools/testing/selftests/powerpc/include/pkeys.h:12,
>>>>>                 from pkey_exec_prot.c:18:
>>>>> /usr/include/bits/syscall.h:1583: note: this is the location of the previous definition
>>>>> # define SYS_pkey_mprotect __NR_pkey_mprotect
>>>>>
>>>>> commit 128d3d021007 introduced this error.
>>>>> selftests/powerpc: Move pkey helpers to headers
>>>>>
>>>>> Possibly the # defines for sys calls can be retained in pkey_exec_prot.c or
>>>>>
>>>>
>>>> I am unable to reproduce this on the latest merge branch (HEAD at f59195f7faa4).
>>>> I don't see any redefinitions in pkey_exec_prot.c either.
>>>>
>>>
>>> I can still see this problem on latest merge branch.
>>> I have following gcc version
>>>
>>> gcc version 8.3.1 20191121
>> 
>> What libc version? Or just the distro & version?
>
> Sachin observed this on RHEL 8.2 with glibc-2.28.
> I couldn't reproduce it on Ubuntu 20.04 and Fedora 32 and both these distros
> are using glibc-2.31.

OK odd. Usually it's newer glibc that hits this problem.

I guess on RHEL 8.2 we're getting the asm-generic version? But that
would be quite wrong if that's what's happening.

cheers
