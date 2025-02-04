Return-Path: <linuxppc-dev+bounces-5813-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24168A2710F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Feb 2025 13:07:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YnMXZ3l0Sz3039;
	Tue,  4 Feb 2025 23:06:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738670782;
	cv=none; b=deTjjaiMoYzTSf8qXMtRa+ZOJZ8SpvUKag+9s72EJrHN7AegHOWy2EYoVyxHjXKiLyOblTnTuL13pzSn/FxNOXc9IYgpJK5X3JgWOy/2V2Zw6lMFZ5QxWzEmJkNAs+HeQvo/PbOPOd9OVRPQigzDos/A6lff50G3BFT3/hV6QAFzgHxIhDsPBnntIytJiQUvPcR1Li9GJaHjaYc/1p+dXAHFmKQ488YyC1W4uu7xB6RRjcoyfPcUffzAt5Pywr+EypJBPwgOHQCZ7WmhSehC1sv8w6+ggsUIK2Ifqmf6VfRStnzQ7qaVBgc1vie1qZNyq22C1Iu5Z5b75BcHNvbQIw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738670782; c=relaxed/relaxed;
	bh=8/4Eamx7aNctQ2PVRu06x5JtFo62FPJ6w8GVVkokEaU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JXgmmTL27k6VcguGzCNOhs3gd0mRfJMWm/rbev0tIRMkdFH3fqmBY29+T3MZZAZNEgxkFm5f72SK/kjz3pbJndbOB9jtf1qZQOILRCx9gLTEET0xt6Z7VTDGR7bnx9dPOHqrj04LdEfHZ4Xq6lCeu1gIp6bUDC0ybr0IwUpR1d85UAjKqs8mrxvcrc3W04jmd9RIeR5Bf87QOAdsU0F4FBzkkjwB8ypz61e4vv2oufBuoMf3tVMWejcKSEtcKtBd9he2z66gh6Fmzg+aodgj/nIc3jOKbyXBZOECioDam2AH2+SCKY2VSFJLQ0ZZ1S0YFPtPBRssV85+tTcbRSUY3w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=gU3VZk1t; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Jljy/6no; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=gU3VZk1t;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Jljy/6no;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4YnMXV3vQ9z300C
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Feb 2025 23:06:18 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738670769;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8/4Eamx7aNctQ2PVRu06x5JtFo62FPJ6w8GVVkokEaU=;
	b=gU3VZk1tswzMN5aAS1haWWN80hBzULa9dfUVscLiuP3Byw9YSrUaDeQlSQJpS65KwXB1dK
	yzGLSyvoIg2vnJPZfSx2dIbhFMhTx293Mg0hPBv6iFEJDcBHAgqvONumKAH2oYM9vqmF9o
	m4XIvTVJTnlybjzzf+NQA8JEc9D5EYTX+MAWYRLFcYmZuawp62YqDE9ebUNDprFrD846n7
	ZCdk/QgTuzLOPnfu2aKjfkyiNuhgccXnOiwV+exTRTexkHIgIapJxdU6jNWmaLAFFlT4DH
	UnA9fNHQ029qkf2QJ/DL41hrEqKDK8yxgpmAEl9kfkHGOqEMI/pJakpXrLxpNA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738670769;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8/4Eamx7aNctQ2PVRu06x5JtFo62FPJ6w8GVVkokEaU=;
	b=Jljy/6nozneeAxZyTqOBcZ5c0Hkshk+feAumY4O8hzW0YK3+FYNLkTo4LGSPC2hUO0BIfG
	Omo/GIP2gu4c8SAw==
Date: Tue, 04 Feb 2025 13:05:38 +0100
Subject: [PATCH v3 06/18] vdso: Add generic random data storage
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250204-vdso-store-rng-v3-6-13a4669dfc8c@linutronix.de>
References: <20250204-vdso-store-rng-v3-0-13a4669dfc8c@linutronix.de>
In-Reply-To: <20250204-vdso-store-rng-v3-0-13a4669dfc8c@linutronix.de>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Andy Lutomirski <luto@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Russell King <linux@armlinux.org.uk>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Arnd Bergmann <arnd@arndb.de>, 
 Guo Ren <guoren@kernel.org>
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
 loongarch@lists.linux.dev, linux-s390@vger.kernel.org, 
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-arch@vger.kernel.org, Nam Cao <namcao@linutronix.de>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 linux-csky@vger.kernel.org
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738670761; l=7434;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=esL609CqiCzQLEE84B6OgMfzgIhlQimUQfR9uontbrU=;
 b=EQSmxJeSGvIfdPcQ2kKR3d09IefAxX+Uz+t6uOTkw6bgsKysS66kCmQ84shanqobY3+v1nE/k
 m4nrVpK6htxDJ5GtELbKQ4fM2h1kBxpFy+awqeQ0QW0l2gpHq+FBpTQ
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Extend the generic vDSO data storage with a page for the random state data.
The random state data is stored in a dedicated page, as the existing
storage page is only meant for time-related, time-namespace-aware data.
This simplifies to access logic to not need to handle time namespaces
anymore and also frees up more space in the time-related page.

In case further generic vDSO data store is required it can be added to
the random state page.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 drivers/char/random.c               |  6 +++---
 include/asm-generic/vdso/vsyscall.h | 12 ++++++++++++
 include/vdso/datapage.h             | 10 ++++++++++
 lib/vdso/datastore.c                | 14 ++++++++++++++
 lib/vdso/getrandom.c                |  8 ++++++--
 5 files changed, 45 insertions(+), 5 deletions(-)

diff --git a/drivers/char/random.c b/drivers/char/random.c
index 2581186fa61b7b278916a27f99ee22b4851dc37a..92cbd24a36d8c73ac6a17e8e787eeae3f6af1922 100644
--- a/drivers/char/random.c
+++ b/drivers/char/random.c
@@ -278,7 +278,7 @@ static void crng_reseed(struct work_struct *work)
 	WRITE_ONCE(base_crng.generation, next_gen);
 #ifdef CONFIG_VDSO_GETRANDOM
 	/* base_crng.generation's invalid value is ULONG_MAX, while
-	 * _vdso_rng_data.generation's invalid value is 0, so add one to the
+	 * vdso_k_rng_data->generation's invalid value is 0, so add one to the
 	 * former to arrive at the latter. Use smp_store_release so that this
 	 * is ordered with the write above to base_crng.generation. Pairs with
 	 * the smp_rmb() before the syscall in the vDSO code.
@@ -290,7 +290,7 @@ static void crng_reseed(struct work_struct *work)
 	 * because the vDSO side only checks whether the value changed, without
 	 * actually using or interpreting the value.
 	 */
-	smp_store_release((unsigned long *)&__arch_get_k_vdso_rng_data()->generation, next_gen + 1);
+	smp_store_release((unsigned long *)&vdso_k_rng_data->generation, next_gen + 1);
 #endif
 	if (!static_branch_likely(&crng_is_ready))
 		crng_init = CRNG_READY;
@@ -743,7 +743,7 @@ static void __cold _credit_init_bits(size_t bits)
 			queue_work(system_unbound_wq, &set_ready);
 		atomic_notifier_call_chain(&random_ready_notifier, 0, NULL);
 #ifdef CONFIG_VDSO_GETRANDOM
-		WRITE_ONCE(__arch_get_k_vdso_rng_data()->is_ready, true);
+		WRITE_ONCE(vdso_k_rng_data->is_ready, true);
 #endif
 		wake_up_interruptible(&crng_init_wait);
 		kill_fasync(&fasync, SIGIO, POLL_IN);
diff --git a/include/asm-generic/vdso/vsyscall.h b/include/asm-generic/vdso/vsyscall.h
index ac5b93b91993224da245e80031b9f51e0c083f3c..a5f973e4e2723ef1815c88a7846f7c477e3febd9 100644
--- a/include/asm-generic/vdso/vsyscall.h
+++ b/include/asm-generic/vdso/vsyscall.h
@@ -13,6 +13,13 @@ static __always_inline const struct vdso_time_data *__arch_get_vdso_u_time_data(
 }
 #endif
 
+#ifndef __arch_get_vdso_u_rng_data
+static __always_inline const struct vdso_rng_data *__arch_get_vdso_u_rng_data(void)
+{
+	return &vdso_u_rng_data;
+}
+#endif
+
 #else  /* !CONFIG_GENERIC_VDSO_DATA_STORE */
 
 #ifndef __arch_get_k_vdso_data
@@ -25,6 +32,11 @@ static __always_inline struct vdso_data *__arch_get_k_vdso_data(void)
 
 #define __arch_get_vdso_u_time_data __arch_get_vdso_data
 
+#ifndef __arch_get_vdso_u_rng_data
+#define __arch_get_vdso_u_rng_data() __arch_get_vdso_rng_data()
+#endif
+#define vdso_k_rng_data __arch_get_k_vdso_rng_data()
+
 #endif /* CONFIG_GENERIC_VDSO_DATA_STORE */
 
 #ifndef __arch_update_vsyscall
diff --git a/include/vdso/datapage.h b/include/vdso/datapage.h
index b3d8087488ff35fbbc4d5058ae21e2c6cc58ed9c..7dbc8797e3b8923c06f4b6b34790766e68b2abd2 100644
--- a/include/vdso/datapage.h
+++ b/include/vdso/datapage.h
@@ -144,8 +144,10 @@ extern struct vdso_time_data _timens_data[CS_BASES] __attribute__((visibility("h
 extern struct vdso_rng_data _vdso_rng_data __attribute__((visibility("hidden")));
 #else
 extern struct vdso_time_data vdso_u_time_data[CS_BASES] __attribute__((visibility("hidden")));
+extern struct vdso_rng_data vdso_u_rng_data __attribute__((visibility("hidden")));
 
 extern struct vdso_time_data *vdso_k_time_data;
+extern struct vdso_rng_data *vdso_k_rng_data;
 #endif
 
 /**
@@ -161,6 +163,7 @@ union vdso_data_store {
 enum vdso_pages {
 	VDSO_TIME_PAGE_OFFSET,
 	VDSO_TIMENS_PAGE_OFFSET,
+	VDSO_RNG_PAGE_OFFSET,
 	VDSO_NR_PAGES
 };
 
@@ -184,9 +187,16 @@ enum vdso_pages {
 
 #else /* !__ASSEMBLY__ */
 
+#ifdef CONFIG_VDSO_GETRANDOM
+#define __vdso_u_rng_data	PROVIDE(vdso_u_rng_data = vdso_u_data + 2 * PAGE_SIZE);
+#else
+#define __vdso_u_rng_data
+#endif
+
 #define VDSO_VVAR_SYMS						\
 	PROVIDE(vdso_u_data = . - __VDSO_PAGES * PAGE_SIZE);	\
 	PROVIDE(vdso_u_time_data = vdso_u_data);		\
+	__vdso_u_rng_data					\
 
 
 #endif /* !__ASSEMBLY__ */
diff --git a/lib/vdso/datastore.c b/lib/vdso/datastore.c
index d3181768424cc3ee2e980bd537ac5ca14dfcb304..9260b00dc8520af109bd9dd05ac7f7504eafbea0 100644
--- a/lib/vdso/datastore.c
+++ b/lib/vdso/datastore.c
@@ -17,6 +17,15 @@ struct vdso_time_data *vdso_k_time_data = vdso_time_data_store.data;
 static_assert(sizeof(vdso_time_data_store) == PAGE_SIZE);
 #endif /* CONFIG_HAVE_GENERIC_VDSO */
 
+#ifdef CONFIG_VDSO_GETRANDOM
+static union {
+	struct vdso_rng_data	data;
+	u8			page[PAGE_SIZE];
+} vdso_rng_data_store __page_aligned_data;
+struct vdso_rng_data *vdso_k_rng_data = &vdso_rng_data_store.data;
+static_assert(sizeof(vdso_rng_data_store) == PAGE_SIZE);
+#endif /* CONFIG_VDSO_GETRANDOM */
+
 static vm_fault_t vvar_fault(const struct vm_special_mapping *sm,
 			     struct vm_area_struct *vma, struct vm_fault *vmf)
 {
@@ -53,6 +62,11 @@ static vm_fault_t vvar_fault(const struct vm_special_mapping *sm,
 			return VM_FAULT_SIGBUS;
 		pfn = __phys_to_pfn(__pa_symbol(vdso_k_time_data));
 		break;
+	case VDSO_RNG_PAGE_OFFSET:
+		if (!IS_ENABLED(CONFIG_VDSO_GETRANDOM))
+			return VM_FAULT_SIGBUS;
+		pfn = __phys_to_pfn(__pa_symbol(vdso_k_rng_data));
+		break;
 	default:
 		return VM_FAULT_SIGBUS;
 	}
diff --git a/lib/vdso/getrandom.c b/lib/vdso/getrandom.c
index 938ca539aaa64bc46280ef6dd17aa661126699eb..440f8a6203a69a6462aafee4ad8d5670cef6a353 100644
--- a/lib/vdso/getrandom.c
+++ b/lib/vdso/getrandom.c
@@ -12,6 +12,9 @@
 #include <uapi/linux/mman.h>
 #include <uapi/linux/random.h>
 
+/* Bring in default accessors */
+#include <vdso/vsyscall.h>
+
 #undef PAGE_SIZE
 #undef PAGE_MASK
 #define PAGE_SIZE (1UL << CONFIG_PAGE_SHIFT)
@@ -152,7 +155,7 @@ __cvdso_getrandom_data(const struct vdso_rng_data *rng_info, void *buffer, size_
 
 		/*
 		 * Prevent the syscall from being reordered wrt current_generation. Pairs with the
-		 * smp_store_release(&_vdso_rng_data.generation) in random.c.
+		 * smp_store_release(&vdso_k_rng_data->generation) in random.c.
 		 */
 		smp_rmb();
 
@@ -256,5 +259,6 @@ __cvdso_getrandom_data(const struct vdso_rng_data *rng_info, void *buffer, size_
 static __always_inline ssize_t
 __cvdso_getrandom(void *buffer, size_t len, unsigned int flags, void *opaque_state, size_t opaque_len)
 {
-	return __cvdso_getrandom_data(__arch_get_vdso_rng_data(), buffer, len, flags, opaque_state, opaque_len);
+	return __cvdso_getrandom_data(__arch_get_vdso_u_rng_data(), buffer, len, flags,
+				      opaque_state, opaque_len);
 }

-- 
2.48.1


