Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC037EAFB6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Nov 2023 13:15:37 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=WP9GUrZI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SV4xz0T80z3dBX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Nov 2023 23:15:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=WP9GUrZI;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SV4x40Pxkz3bq4
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Nov 2023 23:14:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1699964081;
	bh=dmfoRa6q3l9wHu1Qv9ibDohPVvl0BHXoNrO5F6AT/D0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=WP9GUrZI4BJN5cEqhltcaDYMik5uHaCs13aNyQVC2oki9XggL1W1Uo7oOCEDOcM7M
	 Qtr4V/0XtatXrhudY/tEM/FuK+ySrgNXxs3H1RDw2WTBpYEHYTyr78HGtU5JGUZKUo
	 aeeDdazA+bNeJrH2p9AIWbQOzh59rmvxioD4VngTxlfsH+ikbIjqEH1ANLM0YWV4ff
	 qFJtTn0vGOp+Rbo3sMmrIxJ0uiLqyHEtO+fIUI0fEXwKhdzkEfxJU/DWsnThCe6vFH
	 645OcUH8myIhhqq8ChV9aWhvJNOFEC4kQGyw4eoMu0KEkCY+ZvKn3T5OXsXWGr92SE
	 Oqy8VRYiXWTGQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SV4wx0Xsrz4wdB;
	Tue, 14 Nov 2023 23:14:40 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Timothy Pearson <tpearson@raptorengineering.com>, linuxppc-dev
 <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH] powerpc: Fix data corruption on IPI
In-Reply-To: <1654757454.47202735.1699948827325.JavaMail.zimbra@raptorengineeringinc.com>
References: <1654757454.47202735.1699948827325.JavaMail.zimbra@raptorengineeringinc.com>
Date: Tue, 14 Nov 2023 23:14:37 +1100
Message-ID: <87pm0c7cr6.fsf@mail.lhotse>
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
Cc: Jens Axboe <axboe@kernel.dk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Timothy,

Thanks for debugging this, but I'm unclear why this is helping because
we should already have a full barrier (hwsync) on both the sending and
receiving side.

More below.

Timothy Pearson <tpearson@raptorengineering.com> writes:
> From 0b2678b7cdada1a3d9aec8626f31a988d81373fa Mon Sep 17 00:00:00 2001
> From: Timothy Pearson <tpearson@raptorengineering.com>
> Date: Mon, 13 Nov 2023 22:42:58 -0600
> Subject: [PATCH] powerpc: Fix data corruption on IPI
>
> On multithreaded SMP workloads such as those using io_uring, it is possible for
> multiple threads to hold an inconsistent view of system memory when an IPI is
> issued.  This in turn leads to userspace memory corruption with varying degrees
> of probability based on workload and inter-thread timing.
>
> io_uring provokes this bug by its use of TWA_SIGNAL during thread creation,
> which is especially noticeable as significant userspace data corruption with
> certain workloads such as MariaDB (bug MDEV-30728).  While using
> TWA_SIGNAL_NO_IPI works around the corruption, no other architecture requires
> this workaround.
>
> Issue an lwsync barrier instruction prior to sending the IPI.  This ensures
> the receiving CPU has a consistent view of system memory, in line with other
> architectures.
>
> Tested under QEMU in kvm mode, running on a Talos II workstation with dual
> POWER9 DD2.2 CPUs.
>
> Tested-by: Timothy Pearson <tpearson@raptorengineering.com>
> Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
> ---
>  arch/powerpc/kernel/smp.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
> index ab691c89d787..ba42238de518 100644
> --- a/arch/powerpc/kernel/smp.c
> +++ b/arch/powerpc/kernel/smp.c
> @@ -369,8 +369,10 @@ static inline void do_message_pass(int cpu, int msg)
>  
>  void arch_smp_send_reschedule(int cpu)
>  {
> -	if (likely(smp_ops))
> +	if (likely(smp_ops)) {
> +		__smp_lwsync();
>  		do_message_pass(cpu, PPC_MSG_RESCHEDULE);
> +	}
>  }


Expanding the code:

static inline void do_message_pass(int cpu, int msg)
{
	if (smp_ops->message_pass)
		smp_ops->message_pass(cpu, msg);
#ifdef CONFIG_PPC_SMP_MUXED_IPI
	else
		smp_muxed_ipi_message_pass(cpu, msg);
#endif
}

The kernel should be using smp_muxed_ipi_message_pass() on your machine, so:

void smp_muxed_ipi_message_pass(int cpu, int msg)
{
	smp_muxed_ipi_set_message(cpu, msg);

	/*
	 * cause_ipi functions are required to include a full barrier
	 * before doing whatever causes the IPI.
	 */
	smp_ops->cause_ipi(cpu);
}

void smp_muxed_ipi_set_message(int cpu, int msg)
{
	struct cpu_messages *info = &per_cpu(ipi_message, cpu);
	char *message = (char *)&info->messages;

	/*
	 * Order previous accesses before accesses in the IPI handler.
	 */
	smp_mb();
	WRITE_ONCE(message[msg], 1);
}

Where that smp_mb() expands to hwsync (aka sync).

The receiving side is:

irqreturn_t smp_ipi_demux(void)
{
	mb();	/* order any irq clear */

	return smp_ipi_demux_relaxed();
}

irqreturn_t smp_ipi_demux_relaxed(void)
{
	struct cpu_messages *info;
	unsigned long all;

	info = this_cpu_ptr(&ipi_message);
	do {
		all = xchg(&info->messages, 0);
                ...
		if (all & IPI_MESSAGE(PPC_MSG_RESCHEDULE))
			scheduler_ipi();


The hwsync is not in *exactly* the same place as the lwsync you added.
But the only accesses between the lwsync and the hwsync should be the
load of ipi_messages, and I don't see why that should matter.

There must be something going wrong in this path though for your patch
to fix the issue for you, but I'm not sure how the barrier is fixing it.

You said you tested in a VM, I guess it's not easy for you to test on
the host?

I see now there's a long thread on this which I haven't read so I'll go
and read that. (Can you cc linuxppc-dev next time please? :D)

One thing you could try is just adding xnops in that location and see if
some number of them also makes the bug go away, eg:

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 5826f5108a12..6c84bf55557e 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -369,8 +369,10 @@ static inline void do_message_pass(int cpu, int msg)

 void arch_smp_send_reschedule(int cpu)
 {
-       if (likely(smp_ops))
+       if (likely(smp_ops)) {
+               asm volatile ("xnop");
                do_message_pass(cpu, PPC_MSG_RESCHEDULE);
+       }
 }
 EXPORT_SYMBOL_GPL(arch_smp_send_reschedule);


cheers
