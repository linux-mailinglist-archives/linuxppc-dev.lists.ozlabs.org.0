Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB4D3055E1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Jan 2021 09:37:14 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DQcRB49LYzDqnr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Jan 2021 19:37:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=CU2R/1+L; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DQcNQ2BpKzDqjW
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Jan 2021 19:34:45 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10R8W8HD191696
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Jan 2021 03:34:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=eOPw00Q5tal9mrc2TvJWEFSWCdM7vqKLbXkNDWo7xVM=;
 b=CU2R/1+LyIkDUFHQ6NLKSg/cW/zALF65a9lQ1WJZeKjfrc7BtJBHUaNb7Qm+jem7VVzC
 GyEdksISustc6NewBGSV0MbwopSjdsWDPeyBFzMkyqBxzJIzcmmyIMoLQfpKASRSLI4M
 Z0Q7o7UH2qJaX701Z8CXNQujioQpb48WAr741eR7JHin7uw6+BlQNdaVtQgI1ZQd6F9K
 dSqXKk6Dsl9Jpw5NHPxMeBtcmcEqOu8R0NGh0M/RVHPkec2wPiGRURR0FuUXHQhvKVOt
 nhpvMQ9E03guFrh1mr2tGxOfBYEUmOqY/udZ464LGpJ2sO9Gi7NXgHPugMyu4lavw/G+ sg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36awe79efv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Jan 2021 03:34:42 -0500
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10R8WMx8192182
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Jan 2021 03:34:41 -0500
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36awe79eee-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jan 2021 03:34:41 -0500
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10R8VwY0025855;
 Wed, 27 Jan 2021 08:34:37 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 368be7um3r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jan 2021 08:34:37 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 10R8YRZo18284938
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Jan 2021 08:34:27 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 045C7AE056;
 Wed, 27 Jan 2021 08:34:35 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 212D0AE051;
 Wed, 27 Jan 2021 08:34:34 +0000 (GMT)
Received: from [9.79.251.195] (unknown [9.79.251.195])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed, 27 Jan 2021 08:34:33 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: [PATCH] powerpc/64s: prevent recursive replay_soft_interrupts
 causing superfluous interrupt
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20210123061244.2076145-1-npiggin@gmail.com>
Date: Wed, 27 Jan 2021 14:02:09 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <0864DB9F-88F5-4507-B045-AC9C4B96285B@linux.vnet.ibm.com>
References: <20210123061244.2076145-1-npiggin@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-27_03:2021-01-26,
 2021-01-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 bulkscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=999 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2101270043
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



> On 23-Jan-2021, at 11:42 AM, Nicholas Piggin <npiggin@gmail.com> =
wrote:
>=20
> When an asynchronous interrupt calls irq_exit, it checks for softirqs
> that may have been created, and runs them. Running softirqs enables
> local irqs, which can replay pending interrupts causing recursion in
> replay_soft_interrupts. This abridged trace shows how this can occur:
>=20
> ! NIP replay_soft_interrupts
> LR  interrupt_exit_kernel_prepare
> Call Trace:
> interrupt_exit_kernel_prepare (unreliable)
> interrupt_return
> --- interrupt: ea0 at __rb_reserve_next
> NIP __rb_reserve_next
> LR __rb_reserve_next
> Call Trace:
> ring_buffer_lock_reserve
> trace_function
> function_trace_call
> ftrace_call
> __do_softirq
> irq_exit
> timer_interrupt
> !   replay_soft_interrupts
> interrupt_exit_kernel_prepare
> interrupt_return
> --- interrupt: ea0 at arch_local_irq_restore
>=20
> This can not be prevented easily, because softirqs must not block hard
> irqs, so it has to be dealt with.
>=20
> The recursion is bounded by design in the softirq code because softirq
> replay disables softirqs and loops around again to check for new
> softirqs created while it ran, so that's not a problem.
>=20
> However it does mess up interrupt replay state, causing superfluous
> interrupts when the second replay_soft_interrupts clears a pending
> interrupt, leaving it still set in the first call in the 'happened'
> local variable.
>=20
> Fix this by not caching a copy of irqs_happened across interrupt
> handler calls.
>=20
> Fixes: 3282a3da25bd ("powerpc/64: Implement soft interrupt replay in =
C")
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Thanks for the fix Nick.

Tested this below scenario where previously it was resulting in soft =
lockup=E2=80=99s with the trace described in the commit message.=20
I re-tested this patch along with =
https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=3D226017
And there were no soft lockup=E2=80=99s.

Test scenario: My test kernel module below tries to create one of =
performance monitor
counter ( PMC6 ) overflow between local_irq_save/local_irq_restore. I am =
also configuring ftrace.

Environment :One CPU online and Bare Metal system
prerequisite for ftrace:
# cd /sys/kernel/debug/tracing
# echo 100 > buffer_percent
# echo 200000 > buffer_size_kb=20
# echo ppc-tb > trace_clock
# echo function > current_tracer

Part of sample kernel test module to trigger a PMI between=20
local_irq_save and local_irq_restore:

<<>>
static ulong delay =3D 1;
static void busy_wait(ulong time)
{
  udelay(delay);
}
static __always_inline void irq_test(void)
{
  unsigned long flags;
  local_irq_save(flags);
  trace_printk("IN IRQ TEST\n");
  mtspr(SPRN_MMCR0, 0x80000000);
  mtspr(SPRN_PMC6, 0x80000000 - 100);
  mtspr(SPRN_MMCR0, 0x6004000);
  busy_wait(delay);
  trace_printk("IN IRQ TEST DONE\n");
  local_irq_restore(flags);
  mtspr(SPRN_MMCR0, 0x80000000);
  mtspr(SPRN_PMC6, 0);
}
<<>>

With the patch, there is no soft lockup=E2=80=99s.

Tested-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>

> ---
> It's actually very tricky / practically impossible to prevent softirqs
> from being run like my previous attempt tried to do, when you really
> get into details. Certainly not for a fix. I might try to attempt that
> some time in future, but it would require kernel/softirq.c changes and
> what we do now isn't conceptually different from architectures without
> soft-masking, it's just another complexity to the complex soft-masking
> code.
>=20
> Anyway this hopefully fixes the PMU bug, but as I said I couldn't
> reproduce it with your test case so it would be good if you could
> give it a test.
>=20
> Thanks,
> Nick
>=20
> arch/powerpc/kernel/irq.c | 28 ++++++++++++++++------------
> 1 file changed, 16 insertions(+), 12 deletions(-)
>=20
> diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
> index 6b1eca53e36c..cc7a6271b6b4 100644
> --- a/arch/powerpc/kernel/irq.c
> +++ b/arch/powerpc/kernel/irq.c
> @@ -180,13 +180,18 @@ void notrace restore_interrupts(void)
>=20
> void replay_soft_interrupts(void)
> {
> +	struct pt_regs regs;
> +
> 	/*
> -	 * We use local_paca rather than get_paca() to avoid all
> -	 * the debug_smp_processor_id() business in this low level
> -	 * function
> +	 * Be careful here, calling these interrupt handlers can cause
> +	 * softirqs to be raised, which they may run when calling =
irq_exit,
> +	 * which will cause local_irq_enable() to be run, which can then
> +	 * recurse into this function. Don't keep any state across
> +	 * interrupt handler calls which may change underneath us.
> +	 *
> +	 * We use local_paca rather than get_paca() to avoid all the
> +	 * debug_smp_processor_id() business in this low level function.
> 	 */
> -	unsigned char happened =3D local_paca->irq_happened;
> -	struct pt_regs regs;
>=20
> 	ppc_save_regs(&regs);
> 	regs.softe =3D IRQS_ENABLED;
> @@ -209,7 +214,7 @@ void replay_soft_interrupts(void)
> 	 * This is a higher priority interrupt than the others, so
> 	 * replay it first.
> 	 */
> -	if (IS_ENABLED(CONFIG_PPC_BOOK3S) && (happened & PACA_IRQ_HMI)) =
{
> +	if (IS_ENABLED(CONFIG_PPC_BOOK3S) && (local_paca->irq_happened & =
PACA_IRQ_HMI)) {
> 		local_paca->irq_happened &=3D ~PACA_IRQ_HMI;
> 		regs.trap =3D 0xe60;
> 		handle_hmi_exception(&regs);
> @@ -217,7 +222,7 @@ void replay_soft_interrupts(void)
> 			hard_irq_disable();
> 	}
>=20
> -	if (happened & PACA_IRQ_DEC) {
> +	if (local_paca->irq_happened & PACA_IRQ_DEC) {
> 		local_paca->irq_happened &=3D ~PACA_IRQ_DEC;
> 		regs.trap =3D 0x900;
> 		timer_interrupt(&regs);
> @@ -225,7 +230,7 @@ void replay_soft_interrupts(void)
> 			hard_irq_disable();
> 	}
>=20
> -	if (happened & PACA_IRQ_EE) {
> +	if (local_paca->irq_happened & PACA_IRQ_EE) {
> 		local_paca->irq_happened &=3D ~PACA_IRQ_EE;
> 		regs.trap =3D 0x500;
> 		do_IRQ(&regs);
> @@ -233,7 +238,7 @@ void replay_soft_interrupts(void)
> 			hard_irq_disable();
> 	}
>=20
> -	if (IS_ENABLED(CONFIG_PPC_DOORBELL) && (happened & =
PACA_IRQ_DBELL)) {
> +	if (IS_ENABLED(CONFIG_PPC_DOORBELL) && (local_paca->irq_happened =
& PACA_IRQ_DBELL)) {
> 		local_paca->irq_happened &=3D ~PACA_IRQ_DBELL;
> 		if (IS_ENABLED(CONFIG_PPC_BOOK3E))
> 			regs.trap =3D 0x280;
> @@ -245,7 +250,7 @@ void replay_soft_interrupts(void)
> 	}
>=20
> 	/* Book3E does not support soft-masking PMI interrupts */
> -	if (IS_ENABLED(CONFIG_PPC_BOOK3S) && (happened & PACA_IRQ_PMI)) =
{
> +	if (IS_ENABLED(CONFIG_PPC_BOOK3S) && (local_paca->irq_happened & =
PACA_IRQ_PMI)) {
> 		local_paca->irq_happened &=3D ~PACA_IRQ_PMI;
> 		regs.trap =3D 0xf00;
> 		performance_monitor_exception(&regs);
> @@ -253,8 +258,7 @@ void replay_soft_interrupts(void)
> 			hard_irq_disable();
> 	}
>=20
> -	happened =3D local_paca->irq_happened;
> -	if (happened & ~PACA_IRQ_HARD_DIS) {
> +	if (local_paca->irq_happened & ~PACA_IRQ_HARD_DIS) {
> 		/*
> 		 * We are responding to the next interrupt, so =
interrupt-off
> 		 * latencies should be reset here.
> --=20
> 2.23.0
>=20

