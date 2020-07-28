Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BDE622FE91
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jul 2020 02:46:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BFyft3dnbzDqqJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jul 2020 10:46:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BFycr3gHDzDqjb
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jul 2020 10:45:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=j+U2vxdj; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BFycq7517z9sRW;
 Tue, 28 Jul 2020 10:44:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1595897100;
 bh=IVpWCIspd3oN2Mt9N40CO9xQHpmMYz1gi1CI5Dqlh/o=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=j+U2vxdj1IzBQCm9zOyTW5Rv3hPaDz01DuNoLZWh4hAzIEf0XJkrvDam1zZoq5u5a
 o8aLOWyBwYFyrN2oaLsjEJgWjuoHrrATXWLZH2ZVlS7WeXydACrAt9besuxP8HIiDh
 C972khT5mZ5VUgKtHQl5OERIBTWleFUt8ijLXuko638k600BOitSpwk7aKNoIyhgfN
 lMEDPm0thdl0k+YG2VN2S3HqYXNKBqSHmi9SpQfShikJcUD06FZOyotEL4jLnJ7bQq
 mpO5XPdW+KB3kylEXbYTorA9X2v7l8K6iKSLmkGbJw6IyNCdiL+GyUM8qRCXAW8Oyi
 eI8RMjxTn5XIw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH] powerpc/64s/hash: Fix hash_preload running with
 interrupts enabled
In-Reply-To: <9A09C920-D61C-41DC-BCCC-702F9D4BB055@linux.vnet.ibm.com>
References: <20200727060947.10060-1-npiggin@gmail.com>
 <4925309C-A338-4C0F-90E3-4522643021CB@linux.vnet.ibm.com>
 <87k0yp6sqh.fsf@mpe.ellerman.id.au>
 <9A09C920-D61C-41DC-BCCC-702F9D4BB055@linux.vnet.ibm.com>
Date: Tue, 28 Jul 2020 10:44:56 +1000
Message-ID: <87h7ts79iv.fsf@mpe.ellerman.id.au>
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
Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Athira Rajeev <atrajeev@linux.vnet.ibm.com> writes:
>> On 27-Jul-2020, at 6:05 PM, Michael Ellerman <mpe@ellerman.id.au> wrote:
>>=20
>> Athira Rajeev <atrajeev@linux.vnet.ibm.com> writes:
>>>> On 27-Jul-2020, at 11:39 AM, Nicholas Piggin <npiggin@gmail.com> wrote:
>>>>=20
>>>> Commit 2f92447f9f96 ("powerpc/book3s64/hash: Use the pte_t address fro=
m the
>>>> caller") removed the local_irq_disable from hash_preload, but it was
>>>> required for more than just the page table walk: the hash pte busy bit=
 is
>>>> effectively a lock which may be taken in interrupt context, and the lo=
cal
>>>> update flag test must not be preempted before it's used.
>>>>=20
>>>> This solves apparent lockups with perf interrupting __hash_page_64K. If
>>>> get_perf_callchain then also takes a hash fault on the same page while=
 it
>>>> is already locked, it will loop forever taking hash faults, which look=
s like
>>>> this:
>>>>=20
>>>> cpu 0x49e: Vector: 100 (System Reset) at [c00000001a4f7d70]
>>>>   pc: c000000000072dc8: hash_page_mm+0x8/0x800
>>>>   lr: c00000000000c5a4: do_hash_page+0x24/0x38
>>>>   sp: c0002ac1cc69ac70
>>>>  msr: 8000000000081033
>>>> current =3D 0xc0002ac1cc602e00
>>>> paca    =3D 0xc00000001de1f280   irqmask: 0x03   irq_happened: 0x01
>>>>   pid   =3D 20118, comm =3D pread2_processe
>>>> Linux version 5.8.0-rc6-00345-g1fad14f18bc6
>>>> 49e:mon> t
>>>> [c0002ac1cc69ac70] c00000000000c5a4 do_hash_page+0x24/0x38 (unreliable)
>>>> --- Exception: 300 (Data Access) at c00000000008fa60 __copy_tofrom_use=
r_power7+0x20c/0x7ac
>>>> [link register   ] c000000000335d10 copy_from_user_nofault+0xf0/0x150
>>>> [c0002ac1cc69af70] c00032bf9fa3c880 (unreliable)
>>>> [c0002ac1cc69afa0] c000000000109df0 read_user_stack_64+0x70/0xf0
>>>> [c0002ac1cc69afd0] c000000000109fcc perf_callchain_user_64+0x15c/0x410
>>>> [c0002ac1cc69b060] c000000000109c00 perf_callchain_user+0x20/0x40
>>>> [c0002ac1cc69b080] c00000000031c6cc get_perf_callchain+0x25c/0x360
>>>> [c0002ac1cc69b120] c000000000316b50 perf_callchain+0x70/0xa0
>>>> [c0002ac1cc69b140] c000000000316ddc perf_prepare_sample+0x25c/0x790
>>>> [c0002ac1cc69b1a0] c000000000317350 perf_event_output_forward+0x40/0xb0
>>>> [c0002ac1cc69b220] c000000000306138 __perf_event_overflow+0x88/0x1a0
>>>> [c0002ac1cc69b270] c00000000010cf70 record_and_restart+0x230/0x750
>>>> [c0002ac1cc69b620] c00000000010d69c perf_event_interrupt+0x20c/0x510
>>>> [c0002ac1cc69b730] c000000000027d9c performance_monitor_exception+0x4c=
/0x60
>>>> [c0002ac1cc69b750] c00000000000b2f8 performance_monitor_common_virt+0x=
1b8/0x1c0
>>>> --- Exception: f00 (Performance Monitor) at c0000000000cb5b0 pSeries_l=
par_hpte_insert+0x0/0x160
>>>> [link register   ] c0000000000846f0 __hash_page_64K+0x210/0x540
>>>> [c0002ac1cc69ba50] 0000000000000000 (unreliable)
>>>> [c0002ac1cc69bb00] c000000000073ae0 update_mmu_cache+0x390/0x3a0
>>>> [c0002ac1cc69bb70] c00000000037f024 wp_page_copy+0x364/0xce0
>>>> [c0002ac1cc69bc20] c00000000038272c do_wp_page+0xdc/0xa60
>>>> [c0002ac1cc69bc70] c0000000003857bc handle_mm_fault+0xb9c/0x1b60
>>>> [c0002ac1cc69bd50] c00000000006c434 __do_page_fault+0x314/0xc90
>>>> [c0002ac1cc69be20] c00000000000c5c8 handle_page_fault+0x10/0x2c
>>>> --- Exception: 300 (Data Access) at 00007fff8c861fe8
>>>> SP (7ffff6b19660) is in userspace
>>>>=20
>>>> Reported-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>>>> Reported-by: Anton Blanchard <anton@ozlabs.org>
>>>> Reviewed-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>>>> Fixes: 2f92447f9f96 ("powerpc/book3s64/hash: Use the pte_t address fro=
m the
>>>> caller")
>>>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>>>=20
>>>=20
>>> Hi,
>>>=20
>>> Tested with the patch and it fixes the lockups I was seeing with my tes=
t run.
>>> Thanks for the fix.
>>>=20
>>> Tested-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>>=20
>> Thanks for testing.
>>=20
>> What test are you running?
>
> Hi Michael
>
> I was running  =E2=80=9Cperf record=E2=80=9D  and Unixbench tests ( https=
://github.com/kdlucas/byte-unixbench ) in parallel where we were getting so=
ft lockups
>
> 1. Perf command run:
> # perf record -a -g -c 10000000 -o <data_file> sleep 60
>
> 2. Unixbench tests
> # Run -q -c <nr_threads> spawn

Thanks, I can reproduce it with that.

cheers
