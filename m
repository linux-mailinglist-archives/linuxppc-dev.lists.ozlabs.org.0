Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E52146BC10
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Dec 2021 14:00:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7gQd3lvwz3c56
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Dec 2021 00:00:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Hj2icwL+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7gPz5ZnFz2x9W
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Dec 2021 00:00:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=Hj2icwL+; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4J7gPz281fz4xYy;
 Wed,  8 Dec 2021 00:00:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1638882023;
 bh=EEXHaA1s4zOx91lNyu76SR/+DGlGotoLakXn+wokueA=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Hj2icwL+aOphUgAmLCQKTzLnJhDza6UQgt4WPT3aksSm4+xYf8lF3jO4Q/aqU7lPG
 LNFXBp1WfllODi+4DgX0zl1z/xbKYTds2mQNZcEnxQtR82IyzTHbQvDkmZcUf6tXzs
 7Eb5tSHLxHotECA0XZGOo7mwdKkmqRliHq9N1RAqk4eV36U5OhbwFsxqWIJDwb6UwO
 3y7c7hybv6qJTmxcPWNx/Ni0oAEWePsLaKpkoCTCjMSYRGwQ8BGCEwqDdLK98jCTa6
 SA0ZVxgExHUWiIMCN+3yx9IeJaSUN/O2JdkIYOYAaw62ALF9yidDnUrxFA04qHQlYf
 z9SQdx//EwV7A==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v6 17/18] powerpc/64s: Move hash MMU support code under
 CONFIG_PPC_64S_HASH_MMU
In-Reply-To: <20211201144153.2456614-18-npiggin@gmail.com>
References: <20211201144153.2456614-1-npiggin@gmail.com>
 <20211201144153.2456614-18-npiggin@gmail.com>
Date: Wed, 08 Dec 2021 00:00:22 +1100
Message-ID: <87czm8o9i1.fsf@mpe.ellerman.id.au>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:
> Compiling out hash support code when CONFIG_PPC_64S_HASH_MMU=n saves
> 128kB kernel image size (90kB text) on powernv_defconfig minus KVM,
> 350kB on pseries_defconfig minus KVM, 40kB on a tiny config.
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/powerpc/Kconfig                          |  2 +-
>  arch/powerpc/include/asm/book3s/64/mmu.h      | 21 ++++++++++--
>  .../include/asm/book3s/64/tlbflush-hash.h     |  6 ++++
>  arch/powerpc/include/asm/book3s/pgtable.h     |  4 +++
>  arch/powerpc/include/asm/mmu_context.h        |  2 ++
>  arch/powerpc/include/asm/paca.h               |  8 +++++
>  arch/powerpc/kernel/asm-offsets.c             |  2 ++
>  arch/powerpc/kernel/entry_64.S                |  4 +--
>  arch/powerpc/kernel/exceptions-64s.S          | 16 ++++++++++
>  arch/powerpc/kernel/mce.c                     |  2 +-
>  arch/powerpc/kernel/mce_power.c               | 10 ++++--
>  arch/powerpc/kernel/paca.c                    | 18 ++++-------
>  arch/powerpc/kernel/process.c                 | 13 ++++----
>  arch/powerpc/kernel/prom.c                    |  2 ++
>  arch/powerpc/kernel/setup_64.c                |  5 +++
>  arch/powerpc/kexec/core_64.c                  |  4 +--
>  arch/powerpc/kexec/ranges.c                   |  4 +++
>  arch/powerpc/mm/book3s64/Makefile             | 15 +++++----
>  arch/powerpc/mm/book3s64/hugetlbpage.c        |  2 ++
>  arch/powerpc/mm/book3s64/mmu_context.c        | 32 +++++++++++++++----
>  arch/powerpc/mm/book3s64/pgtable.c            |  2 +-
>  arch/powerpc/mm/book3s64/radix_pgtable.c      |  4 +++
>  arch/powerpc/mm/copro_fault.c                 |  2 ++
>  arch/powerpc/mm/ptdump/Makefile               |  2 +-
>  arch/powerpc/platforms/powernv/idle.c         |  2 ++
>  arch/powerpc/platforms/powernv/setup.c        |  2 ++
>  arch/powerpc/platforms/pseries/lpar.c         | 11 +++++--
>  arch/powerpc/platforms/pseries/lparcfg.c      |  2 +-
>  arch/powerpc/platforms/pseries/mobility.c     |  6 ++++
>  arch/powerpc/platforms/pseries/ras.c          |  2 ++
>  arch/powerpc/platforms/pseries/reconfig.c     |  2 ++
>  arch/powerpc/platforms/pseries/setup.c        |  6 ++--
>  arch/powerpc/xmon/xmon.c                      |  8 +++--
>  drivers/misc/lkdtm/core.c                     |  2 +-
>  34 files changed, 173 insertions(+), 52 deletions(-)


I was able to clean up some of the ifdefs a little with the changes
below. I'll run these through some test builds and then squash them in.

cheers


diff --git a/arch/powerpc/include/asm/book3s/64/mmu-hash.h b/arch/powerpc/include/asm/book3s/64/mmu-hash.h
index 3004f3323144..21f780942911 100644
--- a/arch/powerpc/include/asm/book3s/64/mmu-hash.h
+++ b/arch/powerpc/include/asm/book3s/64/mmu-hash.h
@@ -523,8 +523,14 @@ void slb_save_contents(struct slb_entry *slb_ptr);
 void slb_dump_contents(struct slb_entry *slb_ptr);
 
 extern void slb_vmalloc_update(void);
-extern void slb_set_size(u16 size);
 void preload_new_slb_context(unsigned long start, unsigned long sp);
+
+#ifdef CONFIG_PPC_64S_HASH_MMU
+void slb_set_size(u16 size);
+#else
+static inline void slb_set_size(u16 size) { }
+#endif
+
 #endif /* __ASSEMBLY__ */
 
 /*
diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index 2197404cdcc4..75678ff04dd7 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -231,10 +231,9 @@ static void __init check_cpu_pa_features(unsigned long node)
 		      ibm_pa_features, ARRAY_SIZE(ibm_pa_features));
 }
 
-#ifdef CONFIG_PPC_BOOK3S_64
+#ifdef CONFIG_PPC_64S_HASH_MMU
 static void __init init_mmu_slb_size(unsigned long node)
 {
-#ifdef CONFIG_PPC_64S_HASH_MMU
 	const __be32 *slb_size_ptr;
 
 	slb_size_ptr = of_get_flat_dt_prop(node, "slb-size", NULL) ? :
@@ -242,7 +241,6 @@ static void __init init_mmu_slb_size(unsigned long node)
 
 	if (slb_size_ptr)
 		mmu_slb_size = be32_to_cpup(slb_size_ptr);
-#endif
 }
 #else
 #define init_mmu_slb_size(node) do { } while(0)
diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
index 22647bb82198..703a2e6ab08d 100644
--- a/arch/powerpc/kernel/setup_64.c
+++ b/arch/powerpc/kernel/setup_64.c
@@ -886,9 +886,7 @@ void __init setup_per_cpu_areas(void)
 		atom_size = SZ_1M;
 	} else if (radix_enabled()) {
 		atom_size = PAGE_SIZE;
-	} else {
-#ifdef CONFIG_PPC_64S_HASH_MMU
-
+	} else if (IS_ENABLED(CONFIG_PPC_64S_HASH_MMU)) {
 		/*
 		 * Linear mapping is one of 4K, 1M and 16M.  For 4K, no need
 		 * to group units.  For larger mappings, use 1M atom which
@@ -898,9 +896,6 @@ void __init setup_per_cpu_areas(void)
 			atom_size = PAGE_SIZE;
 		else
 			atom_size = SZ_1M;
-#else
-		BUILD_BUG(); // radix_enabled() should be constant true
-#endif
 	}
 
 	if (pcpu_chosen_fc != PCPU_FC_PAGE) {
diff --git a/arch/powerpc/kexec/ranges.c b/arch/powerpc/kexec/ranges.c
index 92d831621fa0..563e9989a5bf 100644
--- a/arch/powerpc/kexec/ranges.c
+++ b/arch/powerpc/kexec/ranges.c
@@ -296,7 +296,7 @@ int add_initrd_mem_range(struct crash_mem **mem_ranges)
 	return ret;
 }
 
-#ifdef CONFIG_PPC_BOOK3S_64
+#ifdef CONFIG_PPC_64S_HASH_MMU
 /**
  * add_htab_mem_range - Adds htab range to the given memory ranges list,
  *                      if it exists
@@ -306,14 +306,10 @@ int add_initrd_mem_range(struct crash_mem **mem_ranges)
  */
 int add_htab_mem_range(struct crash_mem **mem_ranges)
 {
-#ifdef CONFIG_PPC_64S_HASH_MMU
 	if (!htab_address)
 		return 0;
 
 	return add_mem_range(mem_ranges, __pa(htab_address), htab_size_bytes);
-#else
-	return 0;
-#endif
 }
 #endif
 
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 5f8cbeca8080..3c4f0ebe5df8 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -333,10 +333,8 @@ static void __init radix_init_pgtable(void)
 	phys_addr_t start, end;
 	u64 i;
 
-#ifdef CONFIG_PPC_64S_HASH_MMU
 	/* We don't support slb for radix */
-	mmu_slb_size = 0;
-#endif
+	slb_set_size(0);
 
 	/*
 	 * Create the linear mapping
diff --git a/arch/powerpc/platforms/pseries/mobility.c b/arch/powerpc/platforms/pseries/mobility.c
index 21b706bcea76..85033f392c78 100644
--- a/arch/powerpc/platforms/pseries/mobility.c
+++ b/arch/powerpc/platforms/pseries/mobility.c
@@ -484,9 +484,7 @@ static int do_suspend(void)
 	ret = rtas_ibm_suspend_me(&status);
 	if (ret != 0) {
 		pr_err("ibm,suspend-me error: %d\n", status);
-#ifdef CONFIG_PPC_64S_HASH_MMU
 		slb_set_size(saved_slb_size);
-#endif
 	}
 
 	return ret;
diff --git a/arch/powerpc/platforms/pseries/pseries.h b/arch/powerpc/platforms/pseries/pseries.h
index 3544778e06d0..b4c63c481f33 100644
--- a/arch/powerpc/platforms/pseries/pseries.h
+++ b/arch/powerpc/platforms/pseries/pseries.h
@@ -113,6 +113,11 @@ int dlpar_workqueue_init(void);
 
 extern u32 pseries_security_flavor;
 void pseries_setup_security_mitigations(void);
+
+#ifdef CONFIG_PPC_64S_HASH_MMU
 void pseries_lpar_read_hblkrm_characteristics(void);
+#else
+static inline void pseries_lpar_read_hblkrm_characteristics(void) { }
+#endif
 
 #endif /* _PSERIES_PSERIES_H */
diff --git a/arch/powerpc/platforms/pseries/reconfig.c b/arch/powerpc/platforms/pseries/reconfig.c
index 80dae18d6621..7f7369fec46b 100644
--- a/arch/powerpc/platforms/pseries/reconfig.c
+++ b/arch/powerpc/platforms/pseries/reconfig.c
@@ -337,10 +337,8 @@ static int do_update_property(char *buf, size_t bufsize)
 	if (!newprop)
 		return -ENOMEM;
 
-#ifdef CONFIG_PPC_64S_HASH_MMU
 	if (!strcmp(name, "slb-size") || !strcmp(name, "ibm,slb-size"))
 		slb_set_size(*(int *)value);
-#endif
 
 	return of_update_property(np, newprop);
 }
