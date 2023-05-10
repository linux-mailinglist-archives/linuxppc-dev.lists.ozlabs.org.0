Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 12BBB6FD3B9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 May 2023 04:01:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QGJD173d0z3fQQ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 May 2023 12:01:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=g6iMuhvK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=g6iMuhvK;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QGJC30lDCz3cgv
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 May 2023 12:00:30 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34A18a5Q004219;
	Wed, 10 May 2023 02:00:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=deM1Y0NjYDOiATFKtk5RrGalz1ogdg4NPOdzCSuYMF8=;
 b=g6iMuhvKG8LozvgVyHh3PDE47Taej/bElpVWdxvAub5l5LraexPT8jdKmD0y2YOiK2co
 Z3zieS4ZrYlwTi+KLd32/P0rmdW7Sn7kwKtxBvXuFVVi7IXMaaJ3AwiLOZWVBuqbJSJI
 QkcbGUvww4RvesbpzDrP4yex8ekARnXCrOrxkMK8oi5noT4z0T8JuiZAl+LT06PPrnbj
 KUK+DdQd/vaM+g5lAL7yp2HgO8YqyKTIWwsczhIw6awYK9OWUGhDGV6Wyfh72d7DZUmv
 hKaAosV6WMy7qZuUaimjZYeC8FPNDmDCKagAtpgtt+GOoy6WbptMKPHZruOuaHfGjsMr dg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qg02xb2kp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 May 2023 02:00:25 +0000
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34A1xSap019643;
	Wed, 10 May 2023 02:00:25 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qg02xb2j7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 May 2023 02:00:25 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 349NpUqp011891;
	Wed, 10 May 2023 02:00:22 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3qf7nh0re5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 May 2023 02:00:22 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 34A20KtT43057854
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 10 May 2023 02:00:20 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 233A22006C;
	Wed, 10 May 2023 02:00:20 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3428720075;
	Wed, 10 May 2023 02:00:19 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 10 May 2023 02:00:19 +0000 (GMT)
Received: from smtpclient.apple (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id C36CA6033D;
	Wed, 10 May 2023 12:00:15 +1000 (AEST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.500.231\))
Subject: Re: [PATCH 07/12] powerpc: powernv: Fix KCSAN datarace warnings on
 idle_state contention
From: Rohan McLure <rmclure@linux.ibm.com>
In-Reply-To: <CSHE3ZGL9GZJ.QSN86CUY0BQ4@wheely>
Date: Wed, 10 May 2023 12:00:03 +1000
Content-Transfer-Encoding: quoted-printable
Message-Id: <5C2A3405-C30C-43DE-AFD1-96947E8CBE76@linux.ibm.com>
References: <20230508020120.218494-1-rmclure@linux.ibm.com>
 <20230508020120.218494-8-rmclure@linux.ibm.com>
 <CSHE3ZGL9GZJ.QSN86CUY0BQ4@wheely>
To: Nicholas Piggin <npiggin@gmail.com>
X-Mailer: Apple Mail (2.3731.500.231)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: PbrV_PzYNDSPwefCK5IBPDJUYoRwYyD5
X-Proofpoint-ORIG-GUID: _zNjaGF-miSzQYnwH8ifUwS2nBm9d2lF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-09_16,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 mlxlogscore=999
 impostorscore=0 clxscore=1015 mlxscore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305100010
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
Cc: Rohan McLure <rmclure@ibm.com>, linuxppc-dev@lists.ozlabs.org, arnd@arndb.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> On 9 May 2023, at 12:26 pm, Nicholas Piggin <npiggin@gmail.com> wrote:
>=20
> On Mon May 8, 2023 at 12:01 PM AEST, Rohan McLure wrote:
>> The idle_state entry in the PACA on PowerNV features a bit which is
>> atomically tested and set through ldarx/stdcx. to be used as a =
spinlock.
>> This lock then guards access to other bit fields of idle_state. KCSAN
>> cannot differentiate between any of these bitfield accesses as they =
all
>> are implemented by 8-byte store/load instructions, thus cores =
contending
>> on the bit-lock appear to data race with modifications to idle_state.
>>=20
>> Separate the bit-lock entry from the data guarded by the lock to =
avoid
>> the possibility of data races being detected by KCSAN.
>>=20
>> Suggested-by: Nicholas Piggin <npiggin@gmail.com>
>> Signed-off-by: Rohan McLure <rmclure@ibm.com>
>> ---
>> arch/powerpc/include/asm/paca.h       |  1 +
>> arch/powerpc/platforms/powernv/idle.c | 20 +++++++++++---------
>> 2 files changed, 12 insertions(+), 9 deletions(-)
>>=20
>> diff --git a/arch/powerpc/include/asm/paca.h =
b/arch/powerpc/include/asm/paca.h
>> index da0377f46597..cb325938766a 100644
>> --- a/arch/powerpc/include/asm/paca.h
>> +++ b/arch/powerpc/include/asm/paca.h
>> @@ -191,6 +191,7 @@ struct paca_struct {
>> #ifdef CONFIG_PPC_POWERNV
>> /* PowerNV idle fields */
>> /* PNV_CORE_IDLE_* bits, all siblings work on thread 0 paca */
>> + unsigned long idle_lock; /* A value of 1 means acquired */
>> unsigned long idle_state;
>> union {
>> /* P7/P8 specific fields */
>> diff --git a/arch/powerpc/platforms/powernv/idle.c =
b/arch/powerpc/platforms/powernv/idle.c
>> index 841cb7f31f4f..97dbb7bc2b00 100644
>> --- a/arch/powerpc/platforms/powernv/idle.c
>> +++ b/arch/powerpc/platforms/powernv/idle.c
>> @@ -246,9 +246,9 @@ static inline void atomic_lock_thread_idle(void)
>> {
>> int cpu =3D raw_smp_processor_id();
>> int first =3D cpu_first_thread_sibling(cpu);
>> - unsigned long *state =3D &paca_ptrs[first]->idle_state;
>> + unsigned long *lock =3D &paca_ptrs[first]->idle_lock;
>>=20
>> - while (unlikely(test_and_set_bit_lock(NR_PNV_CORE_IDLE_LOCK_BIT, =
state)))
>> + while (unlikely(test_and_set_bit_lock(NR_PNV_CORE_IDLE_LOCK_BIT, =
lock)))
>> barrier();
>> }
>>=20
>> @@ -258,29 +258,31 @@ static inline void =
atomic_unlock_and_stop_thread_idle(void)
>> int first =3D cpu_first_thread_sibling(cpu);
>> unsigned long thread =3D 1UL << cpu_thread_in_core(cpu);
>> unsigned long *state =3D &paca_ptrs[first]->idle_state;
>> + unsigned long *lock =3D &paca_ptrs[first]->idle_lock;
>> u64 s =3D READ_ONCE(*state);
>> u64 new, tmp;
>>=20
>> - BUG_ON(!(s & PNV_CORE_IDLE_LOCK_BIT));
>> + BUG_ON(!(READ_ONCE(*lock) & PNV_CORE_IDLE_LOCK_BIT));
>> BUG_ON(s & thread);
>>=20
>> again:
>> - new =3D (s | thread) & ~PNV_CORE_IDLE_LOCK_BIT;
>> + new =3D s | thread;
>> tmp =3D cmpxchg(state, s, new);
>> if (unlikely(tmp !=3D s)) {
>> s =3D tmp;
>> goto again;
>> }
>> + clear_bit_unlock(NR_PNV_CORE_IDLE_LOCK_BIT, lock);
>=20
> Sigh, another atomic. It's in a slow path though so I won't get too
> upset. Would be nice to add a comment here and revert it when KCSCAN
> can be taught about this pattern though, so we don't lose it.
>=20
>> }
>>=20
>> static inline void atomic_unlock_thread_idle(void)
>> {
>> int cpu =3D raw_smp_processor_id();
>> int first =3D cpu_first_thread_sibling(cpu);
>> - unsigned long *state =3D &paca_ptrs[first]->idle_state;
>> + unsigned long *lock =3D &paca_ptrs[first]->idle_lock;
>>=20
>> - BUG_ON(!test_bit(NR_PNV_CORE_IDLE_LOCK_BIT, state));
>> - clear_bit_unlock(NR_PNV_CORE_IDLE_LOCK_BIT, state);
>> + BUG_ON(!test_bit(NR_PNV_CORE_IDLE_LOCK_BIT, lock));
>> + clear_bit_unlock(NR_PNV_CORE_IDLE_LOCK_BIT, lock);
>> }
>>=20
>> /* P7 and P8 */
>> @@ -380,9 +382,9 @@ static unsigned long power7_idle_insn(unsigned =
long type)
>> sprs.uamor =3D mfspr(SPRN_UAMOR);
>> }
>>=20
>> - local_paca->thread_idle_state =3D type;
>> + WRITE_ONCE(local_paca->thread_idle_state, type);
>> srr1 =3D isa206_idle_insn_mayloss(type); /* go idle */
>> - local_paca->thread_idle_state =3D PNV_THREAD_RUNNING;
>> + WRITE_ONCE(local_paca->thread_idle_state, PNV_THREAD_RUNNING);
>=20
> Where is the thread_idle_state concurrency coming from?

Yeah, I agree, WRITE_ONCE isn=E2=80=99t necessary here, as all reads of =
this variable
by xmon are purely diagnostic (data races permitted), and the=20
isa206_idle_insn_mayloss() call is a compiler barrier. So write =
instructions
will be emitted on each side of the call.

>=20
> Thanks,
> Nick


