Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A366E0EF7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Apr 2023 15:38:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Py0zB6Lgpz3fRZ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Apr 2023 23:38:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=DE1UbYm3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Py0yL4M3yz3bg1
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Apr 2023 23:38:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=DE1UbYm3;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Py0yH4GVfz4xDp;
	Thu, 13 Apr 2023 23:37:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1681393081;
	bh=D6Yngrhf/77tbyzUv4PHE1XGjdrZLdCsqxFpA13UCAc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=DE1UbYm3G/dtwFS3saRQY9viWkm9YPf6SYiwBKDezYKRSZsoGJluHPEiDVazFNVrX
	 fq0CsWzpl6jsdpkLr4x1ITotU2R/RhlLKfEcBzDggs50gaFgJ2egum+6YHgqKaV7WG
	 ArZm5tX2ZJ2U4/+IhNW07HBRxDur2c+MvnR9DJ5B1+7oWMZO8ONqLrO3sGOD9N3K+t
	 KdfagfefIKVTYPfqqaHbYWYgLkr4efpVK9ANA5EoqXTAREVamcEVEvGbH9xqe7ssQI
	 e7B21Qxau0K/G+TTnRco/wnq+MiHJux6HZN+vGZnsLtHDgTW2fXs9zbJuqHOLBv0IY
	 aAV4xJfaMFMJw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Laurent Dufour <ldufour@linux.ibm.com>, npiggin@gmail.com,
 christophe.leroy@csgroup.eu
Subject: Re: [PATCH 1/2] pseries/smp: export the smt level in the SYS FS.
In-Reply-To: <20230331153905.31698-2-ldufour@linux.ibm.com>
References: <20230331153905.31698-1-ldufour@linux.ibm.com>
 <20230331153905.31698-2-ldufour@linux.ibm.com>
Date: Thu, 13 Apr 2023 23:37:59 +1000
Message-ID: <87ttxjaonc.fsf@mpe.ellerman.id.au>
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
Cc: nathanl@linux.ibm.com, msuchanek@suse.de, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Laurent,

Laurent Dufour <ldufour@linux.ibm.com> writes:
> There is no SMT level recorded in the kernel neither in user space.
> Indeed there is no real constraint about that and mixed SMT levels are
> allowed and system is working fine this way.
>
> However when new CPU are added, the kernel is onlining all the threads
> which is leading to mixed SMT levels and confuse end user a bit.
>
> To prevent this exports a SMT level from the kernel so user space
> application like the energy daemon, could read it to adjust their settings.
> There is no action unless recording the value when a SMT value is written
> into the new sysfs entry. User space applications like ppc64_cpu should
> update the sysfs when changing the SMT level to keep the system consistent.
>
> Suggested-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
> Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
> ---
>  arch/powerpc/platforms/pseries/pseries.h |  3 ++
>  arch/powerpc/platforms/pseries/smp.c     | 39 ++++++++++++++++++++++++
>  2 files changed, 42 insertions(+)

There is a generic sysfs interface for smt in /sys/devices/system/cpu/smt

I think we should be enabling that on powerpc and then adapting it to
our needs, rather than adding a pseries specific file.

Currently the generic code is only aware of SMT on/off, so it would need
to be taught about SMT4 and 8 at least.

There are already hooks in the generic code to check the SMT level when
bringing CPUs up, see cpu_smt_allowed(), they may work for the pseries
hotplug case too, though maybe we need some additional logic.

Wiring up the basic support is pretty straight forward, something like
the diff below.

cheers


diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 0f123f1f62a1..a48576f1c579 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -260,6 +260,7 @@ config PPC
 	select HAVE_SYSCALL_TRACEPOINTS
 	select HAVE_VIRT_CPU_ACCOUNTING
 	select HAVE_VIRT_CPU_ACCOUNTING_GEN
+	select HOTPLUG_SMT			if HOTPLUG_CPU
 	select HUGETLB_PAGE_SIZE_VARIABLE	if PPC_BOOK3S_64 && HUGETLB_PAGE
 	select IOMMU_HELPER			if PPC64
 	select IRQ_DOMAIN
diff --git a/arch/powerpc/include/asm/topology.h b/arch/powerpc/include/asm/topology.h
index 8a4d4f4d9749..bd23ba716d23 100644
--- a/arch/powerpc/include/asm/topology.h
+++ b/arch/powerpc/include/asm/topology.h
@@ -143,5 +143,8 @@ static inline int cpu_to_coregroup_id(int cpu)
 #endif
 #endif

+bool topology_is_primary_thread(unsigned int cpu);
+bool topology_smt_supported(void);
+
 #endif /* __KERNEL__ */
 #endif	/* _ASM_POWERPC_TOPOLOGY_H */
diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 265801a3e94c..8619609809d5 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -1769,4 +1769,20 @@ void __noreturn arch_cpu_idle_dead(void)
 	start_secondary_resume();
 }

+/**
+ * topology_is_primary_thread - Check whether CPU is the primary SMT thread
+ * @cpu:	CPU to check
+ */
+bool topology_is_primary_thread(unsigned int cpu)
+{
+	return cpu == cpu_first_thread_sibling(cpu);
+}
+
+/**
+ * topology_smt_supported - Check whether SMT is supported by the CPUs
+ */
+bool topology_smt_supported(void)
+{
+	return threads_per_core > 1;
+}
 #endif
