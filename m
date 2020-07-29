Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 59521231873
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jul 2020 06:20:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BGgLk3wbXzDqx2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jul 2020 14:20:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BGgJs0ZYZzDqth
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jul 2020 14:18:36 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06T43ZTM111689; Wed, 29 Jul 2020 00:18:32 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32jw2jx5n3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jul 2020 00:18:32 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06T43qjw112800;
 Wed, 29 Jul 2020 00:18:32 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32jw2jx5m8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jul 2020 00:18:32 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06T4BBYe028444;
 Wed, 29 Jul 2020 04:18:29 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04fra.de.ibm.com with ESMTP id 32gcpwas8g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jul 2020 04:18:29 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06T4IRUt32768398
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Jul 2020 04:18:27 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 58C5FA405C;
 Wed, 29 Jul 2020 04:18:27 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B8439A4060;
 Wed, 29 Jul 2020 04:18:25 +0000 (GMT)
Received: from [9.79.210.172] (unknown [9.79.210.172])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed, 29 Jul 2020 04:18:25 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Re: [PATCH] powerpc/64s/hash: Fix hash_preload running with
 interrupts enabled
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <87h7ts79iv.fsf@mpe.ellerman.id.au>
Date: Wed, 29 Jul 2020 09:48:23 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <3AD5787A-4CDC-4D84-B281-5889462E1A70@linux.vnet.ibm.com>
References: <20200727060947.10060-1-npiggin@gmail.com>
 <4925309C-A338-4C0F-90E3-4522643021CB@linux.vnet.ibm.com>
 <87k0yp6sqh.fsf@mpe.ellerman.id.au>
 <9A09C920-D61C-41DC-BCCC-702F9D4BB055@linux.vnet.ibm.com>
 <87h7ts79iv.fsf@mpe.ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-29_02:2020-07-28,
 2020-07-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0
 impostorscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999 clxscore=1015
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007290027
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



> On 28-Jul-2020, at 6:14 AM, Michael Ellerman <mpe@ellerman.id.au> =
wrote:
>=20
> Athira Rajeev <atrajeev@linux.vnet.ibm.com> writes:
>>> On 27-Jul-2020, at 6:05 PM, Michael Ellerman <mpe@ellerman.id.au> =
wrote:
>>>=20
>>> Athira Rajeev <atrajeev@linux.vnet.ibm.com> writes:
>>>>> On 27-Jul-2020, at 11:39 AM, Nicholas Piggin <npiggin@gmail.com> =
wrote:
>>>>>=20
>>>>> Commit 2f92447f9f96 ("powerpc/book3s64/hash: Use the pte_t address =
from the
>>>>> caller") removed the local_irq_disable from hash_preload, but it =
was
>>>>> required for more than just the page table walk: the hash pte busy =
bit is
>>>>> effectively a lock which may be taken in interrupt context, and =
the local
>>>>> update flag test must not be preempted before it's used.
>>>>>=20
>>>>> This solves apparent lockups with perf interrupting =
__hash_page_64K. If
>>>>> get_perf_callchain then also takes a hash fault on the same page =
while it
>>>>> is already locked, it will loop forever taking hash faults, which =
looks like
>>>>> this:
>>>>>=20
>>>>> cpu 0x49e: Vector: 100 (System Reset) at [c00000001a4f7d70]
>>>>>  pc: c000000000072dc8: hash_page_mm+0x8/0x800
>>>>>  lr: c00000000000c5a4: do_hash_page+0x24/0x38
>>>>>  sp: c0002ac1cc69ac70
>>>>> msr: 8000000000081033
>>>>> current =3D 0xc0002ac1cc602e00
>>>>> paca    =3D 0xc00000001de1f280   irqmask: 0x03   irq_happened: =
0x01
>>>>>  pid   =3D 20118, comm =3D pread2_processe
>>>>> Linux version 5.8.0-rc6-00345-g1fad14f18bc6
>>>>> 49e:mon> t
>>>>> [c0002ac1cc69ac70] c00000000000c5a4 do_hash_page+0x24/0x38 =
(unreliable)
>>>>> --- Exception: 300 (Data Access) at c00000000008fa60 =
__copy_tofrom_user_power7+0x20c/0x7ac
>>>>> [link register   ] c000000000335d10 =
copy_from_user_nofault+0xf0/0x150
>>>>> [c0002ac1cc69af70] c00032bf9fa3c880 (unreliable)
>>>>> [c0002ac1cc69afa0] c000000000109df0 read_user_stack_64+0x70/0xf0
>>>>> [c0002ac1cc69afd0] c000000000109fcc =
perf_callchain_user_64+0x15c/0x410
>>>>> [c0002ac1cc69b060] c000000000109c00 perf_callchain_user+0x20/0x40
>>>>> [c0002ac1cc69b080] c00000000031c6cc get_perf_callchain+0x25c/0x360
>>>>> [c0002ac1cc69b120] c000000000316b50 perf_callchain+0x70/0xa0
>>>>> [c0002ac1cc69b140] c000000000316ddc =
perf_prepare_sample+0x25c/0x790
>>>>> [c0002ac1cc69b1a0] c000000000317350 =
perf_event_output_forward+0x40/0xb0
>>>>> [c0002ac1cc69b220] c000000000306138 =
__perf_event_overflow+0x88/0x1a0
>>>>> [c0002ac1cc69b270] c00000000010cf70 record_and_restart+0x230/0x750
>>>>> [c0002ac1cc69b620] c00000000010d69c =
perf_event_interrupt+0x20c/0x510
>>>>> [c0002ac1cc69b730] c000000000027d9c =
performance_monitor_exception+0x4c/0x60
>>>>> [c0002ac1cc69b750] c00000000000b2f8 =
performance_monitor_common_virt+0x1b8/0x1c0
>>>>> --- Exception: f00 (Performance Monitor) at c0000000000cb5b0 =
pSeries_lpar_hpte_insert+0x0/0x160
>>>>> [link register   ] c0000000000846f0 __hash_page_64K+0x210/0x540
>>>>> [c0002ac1cc69ba50] 0000000000000000 (unreliable)
>>>>> [c0002ac1cc69bb00] c000000000073ae0 update_mmu_cache+0x390/0x3a0
>>>>> [c0002ac1cc69bb70] c00000000037f024 wp_page_copy+0x364/0xce0
>>>>> [c0002ac1cc69bc20] c00000000038272c do_wp_page+0xdc/0xa60
>>>>> [c0002ac1cc69bc70] c0000000003857bc handle_mm_fault+0xb9c/0x1b60
>>>>> [c0002ac1cc69bd50] c00000000006c434 __do_page_fault+0x314/0xc90
>>>>> [c0002ac1cc69be20] c00000000000c5c8 handle_page_fault+0x10/0x2c
>>>>> --- Exception: 300 (Data Access) at 00007fff8c861fe8
>>>>> SP (7ffff6b19660) is in userspace
>>>>>=20
>>>>> Reported-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>>>>> Reported-by: Anton Blanchard <anton@ozlabs.org>
>>>>> Reviewed-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>>>>> Fixes: 2f92447f9f96 ("powerpc/book3s64/hash: Use the pte_t address =
from the
>>>>> caller")
>>>>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>>>>=20
>>>>=20
>>>> Hi,
>>>>=20
>>>> Tested with the patch and it fixes the lockups I was seeing with my =
test run.
>>>> Thanks for the fix.
>>>>=20
>>>> Tested-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>>>=20
>>> Thanks for testing.
>>>=20
>>> What test are you running?
>>=20
>> Hi Michael
>>=20
>> I was running  =E2=80=9Cperf record=E2=80=9D  and Unixbench tests ( =
https://github.com/kdlucas/byte-unixbench ) in parallel where we were =
getting soft lockups
>>=20
>> 1. Perf command run:
>> # perf record -a -g -c 10000000 -o <data_file> sleep 60
>>=20
>> 2. Unixbench tests
>> # Run -q -c <nr_threads> spawn
>=20
> Thanks, I can reproduce it with that.

Sure Michael


>=20
> cheers

