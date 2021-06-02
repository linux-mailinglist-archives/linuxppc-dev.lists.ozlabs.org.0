Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADCA3987B6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Jun 2021 13:08:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fw5r14g28z3095
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Jun 2021 21:08:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=DSMn1WG0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=DSMn1WG0; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fw5qb2Npbz2yZF
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Jun 2021 21:08:26 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Fw5qX5hdPz9sCD;
 Wed,  2 Jun 2021 21:08:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1622632105;
 bh=IMyZmrDIAgMUzwTxOPoPRs0AW/oFM2vmxwOL5ZFB9j8=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=DSMn1WG0DQ5pHQ3IeCVr1q212M7f2G4ckZTq6X91jxyjebm/XGUwksO9bUBKYrJxi
 Y3M9RMD9K2kex1LLwdlsMeg3fcgKLSvLJbiOHgeztsbCQyXLiYz5JYS6Mv1ouTFRXO
 ue0s3vWJpLsfjqz1YVH1vzeJH7s8P2na7Co6rOED0Q8varKiwV7AcKrLZPYEJV7La0
 rMP8yvOVL3iIWzhTBbWMOJ9TCymKwwlcitlsGVcyAAXFs36aGhmwJMpGkafZjrHlqm
 zEwYvnwJKz+iktV79dmrNVt95tRU0mQwfCbC+d91iIFxYGinx/6qXQaSIsYTpdNB/l
 8pTXa+kLoK9fg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/stacktrace: fix raise_backtrace_ipi() logic
In-Reply-To: <20210527011550.235443-1-nathanl@linux.ibm.com>
References: <20210527011550.235443-1-nathanl@linux.ibm.com>
Date: Wed, 02 Jun 2021 21:08:20 +1000
Message-ID: <87eedkh6cb.fsf@mpe.ellerman.id.au>
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
Cc: ldufour@linux.ibm.com, paulus@samba.org, clg@kaod.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Lynch <nathanl@linux.ibm.com> writes:
> When smp_send_safe_nmi_ipi() indicates that the target CPU has
> responded to the IPI, skip the remote paca inspection
> fallback. Otherwise both the sending and target CPUs attempt the
> backtrace, usually creating a misleading ("didn't respond to backtrace
> IPI" is wrong) and interleaved mess:

Thanks for fixing my bugs for me :)

> [ 1658.929157][    C7] rcu: Stack dump where RCU GP kthread last ran:
> [ 1658.929223][    C7] Sending NMI from CPU 7 to CPUs 1:
> [ 1658.929303][    C1] NMI backtrace for cpu 1
> [ 1658.929303][    C7] CPU 1 didn't respond to backtrace IPI, inspecting paca.
> [ 1658.929362][    C1] CPU: 1 PID: 325 Comm: kworker/1:1H Tainted: G        W   E     5.13.0-rc2+ #46
> [ 1658.929405][    C7] irq_soft_mask: 0x01 in_mce: 0 in_nmi: 0 current: 325 (kworker/1:1H)
> [ 1658.929465][    C1] Workqueue: events_highpri test_work_fn [test_lockup]
> [ 1658.929549][    C7] Back trace of paca->saved_r1 (0xc0000000057fb400) (possibly stale):
> [ 1658.929592][    C1] NIP:  c00000000002cf50 LR: c008000000820178 CTR: c00000000002cfa0
>
> Verified using the test_lockup module, e.g.
>
> $ echo 5 > /sys/module/rcupdate/parameters/rcu_cpu_stall_timeout
> $ insmod test_lockup.ko time_secs=1 iterations=10 state=R lock_rcu \
>   touch_softlockup all_cpus
>
> Fixes: 5cc05910f26e ("powerpc/64s: Wire up arch_trigger_cpumask_backtrace()")
> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
> ---
>  arch/powerpc/kernel/stacktrace.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/arch/powerpc/kernel/stacktrace.c b/arch/powerpc/kernel/stacktrace.c
> index 1deb1bf331dd..e0ccc5a46d7e 100644
> --- a/arch/powerpc/kernel/stacktrace.c
> +++ b/arch/powerpc/kernel/stacktrace.c
> @@ -174,11 +174,14 @@ static void raise_backtrace_ipi(cpumask_t *mask)
>  {
>  	unsigned int cpu;
>  
> +	if (cpumask_test_cpu(smp_processor_id(), mask)) {
> +		handle_backtrace_ipi(NULL);
> +		cpumask_clear_cpu(smp_processor_id(), mask);
> +	}
> +
>  	for_each_cpu(cpu, mask) {
> -		if (cpu == smp_processor_id())
> -			handle_backtrace_ipi(NULL);
> -		else
> -			smp_send_safe_nmi_ipi(cpu, handle_backtrace_ipi, 5 * USEC_PER_SEC);
> +		if (smp_send_safe_nmi_ipi(cpu, handle_backtrace_ipi, 5 * USEC_PER_SEC))
> +			cpumask_clear_cpu(cpu, mask);

I think there's still a race here, but instead of causing us to emit a
spurious "didn't respond" trace, it could lead to us failing to emit a
proper trace when we should.

It's hard to follow this code, but mask above is backtrace_mask from
lib/nmi_backtrace.c, because of:

void nmi_trigger_cpumask_backtrace(const cpumask_t *mask,
				   bool exclude_self,
				   void (*raise)(cpumask_t *mask))
{
	int i, this_cpu = get_cpu();

	cpumask_copy(to_cpumask(backtrace_mask), mask);
                                ^^^^^^^^^^^^^^
	...

	if (!cpumask_empty(to_cpumask(backtrace_mask))) {
		pr_info("Sending NMI from CPU %d to CPUs %*pbl:\n",
			this_cpu, nr_cpumask_bits, to_cpumask(backtrace_mask));
		raise(to_cpumask(backtrace_mask));
                                 ^^^^^^^^^^^^^^

And raise there is raise_backtrace_ipi() (the function we're patching).

On the receiving CPU we end up executing:

int smp_handle_nmi_ipi(struct pt_regs *regs)
{
	...
	nmi_ipi_lock_start(&flags);
	if (cpumask_test_cpu(me, &nmi_ipi_pending_mask)) {
		cpumask_clear_cpu(me, &nmi_ipi_pending_mask);
		fn = READ_ONCE(nmi_ipi_function);
                ...
	}
	nmi_ipi_unlock_end(&flags);

	if (fn)
		fn(regs);


The key detail being that we drop the nmi lock before calling fn, which
means the calling CPU can return back to raise_backtrace_ipi() before fn
is called.

In our case fn is handle_backtrace_ipi() which just calls nmi_cpu_backtrace().

Which does:

bool nmi_cpu_backtrace(struct pt_regs *regs)
{
	int cpu = smp_processor_id();

	if (cpumask_test_cpu(cpu, to_cpumask(backtrace_mask))) {
        	...
		pr_warn("NMI backtrace for cpu %d\n", cpu);
		if (regs)
			show_regs(regs);
		else
			dump_stack();


ie. if the CPU has been cleared from backtrace_mask it doesn't emit a
stack trace.

So we could end up with the following interleaving:


CPU0								CPU1
====								====
if (smp_send_safe_nmi_ipi(cpu, handle_backtrace_ipi, ...
   								// smp_handle_nmi_ipi()
								fn = READ_ONCE(nmi_ipi_function);
								...
								nmi_ipi_unlock_end(&flags);
// in smp_send_safe_nmi_ipi()
nmi_ipi_lock();
while (!cpumask_empty(&nmi_ipi_pending_mask)) {
...
nmi_ipi_unlock_end(&flags);
return ret;

	cpumask_clear_cpu(cpu, mask);
			       					fn(regs)
								// -> nmi_cpu_backtrace()
								if (cpumask_test_cpu(cpu, to_cpumask(backtrace_mask))) {


But like I said, it's not easy to follow, so maybe I missed something
along the way.


To solve it I think we want to avoid clearing a CPU from the mask unless
we know that the IPI failed for that CPU. That way there's no risk of
suppressing a trace from a CPU that successfully handles the IPI, and we
know we've waited 5 seconds for CPUs that fail to handle the IPI.

I don't think we want to allocate a whole new cpumask to track which
CPUs have failed to respond, but I don't think we need to. We can just
synchronously handle them.

Something like below.

cheers


diff --git a/arch/powerpc/kernel/stacktrace.c b/arch/powerpc/kernel/stacktrace.c
index 1deb1bf331dd..980e87f7ae7a 100644
--- a/arch/powerpc/kernel/stacktrace.c
+++ b/arch/powerpc/kernel/stacktrace.c
@@ -172,17 +172,19 @@ static void handle_backtrace_ipi(struct pt_regs *regs)
 
 static void raise_backtrace_ipi(cpumask_t *mask)
 {
+	struct paca_struct *p;
 	unsigned int cpu;
 
 	for_each_cpu(cpu, mask) {
-		if (cpu == smp_processor_id())
+		if (cpu == smp_processor_id()) {
 			handle_backtrace_ipi(NULL);
-		else
-			smp_send_safe_nmi_ipi(cpu, handle_backtrace_ipi, 5 * USEC_PER_SEC);
-	}
+			continue;
+		}
 
-	for_each_cpu(cpu, mask) {
-		struct paca_struct *p = paca_ptrs[cpu];
+		if (smp_send_safe_nmi_ipi(cpu, handle_backtrace_ipi, 5 * USEC_PER_SEC))
+			continue;
+
+		p = paca_ptrs[cpu];
 
 		cpumask_clear_cpu(cpu, mask);
 
