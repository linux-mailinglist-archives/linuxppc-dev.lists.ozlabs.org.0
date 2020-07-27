Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B4C22E916
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 11:35:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BFZRD1sKJzDqYt
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 19:35:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BFZPF2T90zF0fW
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jul 2020 19:33:36 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06R9XNQh043608
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jul 2020 05:33:33 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32hs0rx080-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jul 2020 05:33:33 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06R9XWmw044205
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jul 2020 05:33:32 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32hs0rx00g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jul 2020 05:33:32 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06R9L9kA029039;
 Mon, 27 Jul 2020 09:32:26 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma02fra.de.ibm.com with ESMTP id 32gcq0s896-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jul 2020 09:32:26 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06R9WNLi55574610
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Jul 2020 09:32:24 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D89C911C054;
 Mon, 27 Jul 2020 09:32:23 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B53C911C071;
 Mon, 27 Jul 2020 09:32:22 +0000 (GMT)
Received: from [9.85.98.87] (unknown [9.85.98.87])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon, 27 Jul 2020 09:32:22 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH] powerpc/64s/hash: Fix hash_preload running with
 interrupts enabled
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20200727060947.10060-1-npiggin@gmail.com>
Date: Mon, 27 Jul 2020 15:02:20 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <4925309C-A338-4C0F-90E3-4522643021CB@linux.vnet.ibm.com>
References: <20200727060947.10060-1-npiggin@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-27_06:2020-07-27,
 2020-07-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 mlxlogscore=999 spamscore=0
 mlxscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007270066
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
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 27-Jul-2020, at 11:39 AM, Nicholas Piggin <npiggin@gmail.com> =
wrote:
>=20
> Commit 2f92447f9f96 ("powerpc/book3s64/hash: Use the pte_t address =
from the
> caller") removed the local_irq_disable from hash_preload, but it was
> required for more than just the page table walk: the hash pte busy bit =
is
> effectively a lock which may be taken in interrupt context, and the =
local
> update flag test must not be preempted before it's used.
>=20
> This solves apparent lockups with perf interrupting __hash_page_64K. =
If
> get_perf_callchain then also takes a hash fault on the same page while =
it
> is already locked, it will loop forever taking hash faults, which =
looks like
> this:
>=20
> cpu 0x49e: Vector: 100 (System Reset) at [c00000001a4f7d70]
>    pc: c000000000072dc8: hash_page_mm+0x8/0x800
>    lr: c00000000000c5a4: do_hash_page+0x24/0x38
>    sp: c0002ac1cc69ac70
>   msr: 8000000000081033
>  current =3D 0xc0002ac1cc602e00
>  paca    =3D 0xc00000001de1f280   irqmask: 0x03   irq_happened: 0x01
>    pid   =3D 20118, comm =3D pread2_processe
> Linux version 5.8.0-rc6-00345-g1fad14f18bc6
> 49e:mon> t
> [c0002ac1cc69ac70] c00000000000c5a4 do_hash_page+0x24/0x38 =
(unreliable)
> --- Exception: 300 (Data Access) at c00000000008fa60 =
__copy_tofrom_user_power7+0x20c/0x7ac
> [link register   ] c000000000335d10 copy_from_user_nofault+0xf0/0x150
> [c0002ac1cc69af70] c00032bf9fa3c880 (unreliable)
> [c0002ac1cc69afa0] c000000000109df0 read_user_stack_64+0x70/0xf0
> [c0002ac1cc69afd0] c000000000109fcc perf_callchain_user_64+0x15c/0x410
> [c0002ac1cc69b060] c000000000109c00 perf_callchain_user+0x20/0x40
> [c0002ac1cc69b080] c00000000031c6cc get_perf_callchain+0x25c/0x360
> [c0002ac1cc69b120] c000000000316b50 perf_callchain+0x70/0xa0
> [c0002ac1cc69b140] c000000000316ddc perf_prepare_sample+0x25c/0x790
> [c0002ac1cc69b1a0] c000000000317350 =
perf_event_output_forward+0x40/0xb0
> [c0002ac1cc69b220] c000000000306138 __perf_event_overflow+0x88/0x1a0
> [c0002ac1cc69b270] c00000000010cf70 record_and_restart+0x230/0x750
> [c0002ac1cc69b620] c00000000010d69c perf_event_interrupt+0x20c/0x510
> [c0002ac1cc69b730] c000000000027d9c =
performance_monitor_exception+0x4c/0x60
> [c0002ac1cc69b750] c00000000000b2f8 =
performance_monitor_common_virt+0x1b8/0x1c0
> --- Exception: f00 (Performance Monitor) at c0000000000cb5b0 =
pSeries_lpar_hpte_insert+0x0/0x160
> [link register   ] c0000000000846f0 __hash_page_64K+0x210/0x540
> [c0002ac1cc69ba50] 0000000000000000 (unreliable)
> [c0002ac1cc69bb00] c000000000073ae0 update_mmu_cache+0x390/0x3a0
> [c0002ac1cc69bb70] c00000000037f024 wp_page_copy+0x364/0xce0
> [c0002ac1cc69bc20] c00000000038272c do_wp_page+0xdc/0xa60
> [c0002ac1cc69bc70] c0000000003857bc handle_mm_fault+0xb9c/0x1b60
> [c0002ac1cc69bd50] c00000000006c434 __do_page_fault+0x314/0xc90
> [c0002ac1cc69be20] c00000000000c5c8 handle_page_fault+0x10/0x2c
> --- Exception: 300 (Data Access) at 00007fff8c861fe8
> SP (7ffff6b19660) is in userspace
>=20
> Reported-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> Reported-by: Anton Blanchard <anton@ozlabs.org>
> Reviewed-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> Fixes: 2f92447f9f96 ("powerpc/book3s64/hash: Use the pte_t address =
from the
> caller")
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>


Hi,

Tested with the patch and it fixes the lockups I was seeing with my test =
run.
Thanks for the fix.

Tested-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>

> ---
> arch/powerpc/kernel/exceptions-64s.S  | 14 +++++++++++---
> arch/powerpc/mm/book3s64/hash_utils.c | 25 +++++++++++++++++++++++++
> arch/powerpc/perf/core-book3s.c       |  6 ++++++
> 3 files changed, 42 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/powerpc/kernel/exceptions-64s.S =
b/arch/powerpc/kernel/exceptions-64s.S
> index 0fc8bad878b2..446e54c3f71e 100644
> --- a/arch/powerpc/kernel/exceptions-64s.S
> +++ b/arch/powerpc/kernel/exceptions-64s.S
> @@ -3072,10 +3072,18 @@ do_hash_page:
> 	ori	r0,r0,DSISR_BAD_FAULT_64S@l
> 	and.	r0,r5,r0		/* weird error? */
> 	bne-	handle_page_fault	/* if not, try to insert a HPTE =
*/
> +
> +	/*
> +	 * If we are in an "NMI" (e.g., an interrupt when =
soft-disabled), then
> +	 * don't call hash_page, just fail the fault. This is required =
to
> +	 * prevent re-entrancy problems in the hash code, namely perf
> +	 * interrupts hitting while something holds H_PAGE_BUSY, and =
taking a
> +	 * hash fault. See the comment in hash_preload().
> +	 */
> 	ld	r11, PACA_THREAD_INFO(r13)
> -	lwz	r0,TI_PREEMPT(r11)	/* If we're in an "NMI" */
> -	andis.	r0,r0,NMI_MASK@h	/* (i.e. an irq when =
soft-disabled) */
> -	bne	77f			/* then don't call hash_page now =
*/
> +	lwz	r0,TI_PREEMPT(r11)
> +	andis.	r0,r0,NMI_MASK@h
> +	bne	77f
>=20
> 	/*
> 	 * r3 contains the trap number
> diff --git a/arch/powerpc/mm/book3s64/hash_utils.c =
b/arch/powerpc/mm/book3s64/hash_utils.c
> index 468169e33c86..9b9f92ad0e7a 100644
> --- a/arch/powerpc/mm/book3s64/hash_utils.c
> +++ b/arch/powerpc/mm/book3s64/hash_utils.c
> @@ -1559,6 +1559,7 @@ static void hash_preload(struct mm_struct *mm, =
pte_t *ptep, unsigned long ea,
> 	pgd_t *pgdir;
> 	int rc, ssize, update_flags =3D 0;
> 	unsigned long access =3D _PAGE_PRESENT | _PAGE_READ | (is_exec ? =
_PAGE_EXEC : 0);
> +	unsigned long flags;
>=20
> 	BUG_ON(get_region_id(ea) !=3D USER_REGION_ID);
>=20
> @@ -1592,6 +1593,28 @@ static void hash_preload(struct mm_struct *mm, =
pte_t *ptep, unsigned long ea,
> 		return;
> #endif /* CONFIG_PPC_64K_PAGES */
>=20
> +	/*
> +	 * __hash_page_* must run with interrupts off, as it sets the
> +	 * H_PAGE_BUSY bit. It's possible for perf interrupts to hit at =
any
> +	 * time and may take a hash fault reading the user stack, see
> +	 * read_user_stack_slow() in the powerpc/perf code.
> +	 *
> +	 * If that takes a hash fault on the same page as we lock here, =
it
> +	 * will bail out when seeing H_PAGE_BUSY set, and retry the =
access
> +	 * leading to an infinite loop.
> +	 *
> +	 * Disabling interrupts here does not prevent perf interrupts, =
but it
> +	 * will prevent them taking hash faults (see the NMI test in
> +	 * do_hash_page), then read_user_stack's copy_from_user_nofault =
will
> +	 * fail and perf will fall back to read_user_stack_slow(), which
> +	 * walks the Linux page tables.
> +	 *
> +	 * Interrupts must also be off for the duration of the
> +	 * mm_is_thread_local test and update, to prevent preempt =
running the
> +	 * mm on another CPU (XXX: this may be racy vs kthread_use_mm).
> +	 */
> +	local_irq_save(flags);
> +
> 	/* Is that local to this CPU ? */
> 	if (mm_is_thread_local(mm))
> 		update_flags |=3D HPTE_LOCAL_UPDATE;
> @@ -1614,6 +1637,8 @@ static void hash_preload(struct mm_struct *mm, =
pte_t *ptep, unsigned long ea,
> 				   mm_ctx_user_psize(&mm->context),
> 				   mm_ctx_user_psize(&mm->context),
> 				   pte_val(*ptep));
> +
> +	local_irq_restore(flags);
> }
>=20
> /*
> diff --git a/arch/powerpc/perf/core-book3s.c =
b/arch/powerpc/perf/core-book3s.c
> index cd6a742ac6ef..01d70280d287 100644
> --- a/arch/powerpc/perf/core-book3s.c
> +++ b/arch/powerpc/perf/core-book3s.c
> @@ -2179,6 +2179,12 @@ static void __perf_event_interrupt(struct =
pt_regs *regs)
>=20
> 	perf_read_regs(regs);
>=20
> +	/*
> +	 * If perf interrupts hit in a local_irq_disable (soft-masked) =
region,
> +	 * we consider them as NMIs. This is required to prevent hash =
faults on
> +	 * user addresses when reading callchains. See the NMI test in
> +	 * do_hash_page.
> +	 */
> 	nmi =3D perf_intr_is_nmi(regs);
> 	if (nmi)
> 		nmi_enter();
> --=20
> 2.23.0
>=20

