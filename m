Return-Path: <linuxppc-dev+bounces-12330-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E16D9B7FB63
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Sep 2025 16:04:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cRgSR1Tzwz3dKw;
	Thu, 18 Sep 2025 00:02:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758117735;
	cv=none; b=LmECseNOgeEEVP0kDoxeRcNhNDouUw7jSXG9Y+ofpGU4LiAcBh96zxwoUdHicfG82MIg+Tea3mfMmOIm551A9bTxOUbeTYni5YhZgbXK22mKCM++Gzx0efsiNW0rLd56LKQ8d28MkP982S08Nnk+Jrp/wf2WpLPB6BeMjZt9ANv26zsTNJNUYEbX8Jq6RVD11ISRWt6kalakh2f6EhLECKMRa6Vzirc3oSjFAGvX4oHmGmUlcBt/VxkI33A1u6anwwwVrKLieckvrs0Dry7RSC3YMqcuHe98p4679WLq4ohr1iIloVW3yxYRyCEkKfraUwSx7x6lIctXKUplf1ttQw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758117735; c=relaxed/relaxed;
	bh=Gpmb9cDwEzk02Y+DfJzHKrCKqKqd+Vk47vVVsRIqy1A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CfjdwUUxLpBHY9z+CZa71SL7OEDFJ7I8vq6il75lY2fmzeSfk+d8Dsgejja2owji2/wbHAvpvCkMKBnt4+zxuAa2WgvqnNr24QkxcHPaD3BL+TmBkpnYqs/9Zvj3OLP606DyWVLc6oxIHBf3Kb/dm53QH6N7CBPLCr1lLqa4jOH59hs8MM+NLTb5UWAy0SVetsbHKE2BHQGThm0bYfSOJm4zGuBiGCDbzoYUENbirHbvzH6S3LBk91Y+PWsNaL8cb+H/IHx1R8R0j8Pz+4GBxk5dX0rqXgzjJWbka5gaScNGUtLmN/xx4wyerhqUwfB90rvWQgc3sLyFlWiueST86w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=zzcQj+H+; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=GTuw+m+w; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=zzcQj+H+;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=GTuw+m+w;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4cRgSQ1zd7z3dFL
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Sep 2025 00:02:14 +1000 (AEST)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1758117728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gpmb9cDwEzk02Y+DfJzHKrCKqKqd+Vk47vVVsRIqy1A=;
	b=zzcQj+H+wV5XHh7JlmQgfczb/SrRXVkOy25S1jepBvRY1OvCDzb0SJCkznPomBX9mcgfqF
	/ZYOkCYJis4p6VSLvvhey+9FR+llhxD/ioegVLEy6q2nsdjOJRDj4L92e+gfwsHHc7aLBT
	WAxmW2WVLQrlrl+9xqJ0YeplQxUmBwwooT1LSX0mDpGzhqX0Lg5TzIYdtLFydRxNHAyZjR
	9wlheU8BHYcKkSSJZ18mF61aXUDCQ1AIhdN3YbwX7YvjwoTE5S4BQeWZuh7g4M9/Rb1I43
	HyEVJiFPQMWc0/bsduhYPPqU5u6dFf0GXivewKKUYVBT8UeBOecHV2X5jKUB8g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1758117728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gpmb9cDwEzk02Y+DfJzHKrCKqKqd+Vk47vVVsRIqy1A=;
	b=GTuw+m+wQOSdJ2yMAXigPYcPa71hWYh+ILRSyBQvDKyMeYS8Wfje/LSrijnvlSXpaQR3m/
	wxvLNd6jekFY0BDQ==
Date: Wed, 17 Sep 2025 16:00:26 +0200
Subject: [PATCH v3 24/36] vdso/datastore: Allocate data pages dynamically
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250917-vdso-sparc64-generic-2-v3-24-3679b1bc8ee8@linutronix.de>
References: <20250917-vdso-sparc64-generic-2-v3-0-3679b1bc8ee8@linutronix.de>
In-Reply-To: <20250917-vdso-sparc64-generic-2-v3-0-3679b1bc8ee8@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Arnd Bergmann <arnd@arndb.de>, "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>, Nick Alcock <nick.alcock@oracle.com>, 
 John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 Shuah Khan <shuah@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Theodore Ts'o <tytso@mit.edu>, 
 "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Nagarathnam Muthusamy <nagarathnam.muthusamy@oracle.com>, 
 Shannon Nelson <sln@onemain.com>
Cc: linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758117712; l=4686;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=QgZWh2CTRuRkVkUn1WW0CJWymakhf5V9YWE5DyFtGgI=;
 b=pOWKEqrLPj1SLyPcTKi14JdVomBv9bCCXIehSogW2jrTVnFtKz2E7s3mSIq15X4wwIsu4UKkw
 rJVX1dAWNHLA5UUNnHFOZ/ONopbJqhLqNpaKXm/JddK/gB3KKSSLbi2
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
	T_PHOTO_EDITING_DIRECT autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Allocating the datapages as part of the kernel image does not work on
SPARC. It is also problematic with regards to dcache aliasing as there is
no guarantee that the virtual addresses used by the kernel are compatible
with those used by userspace.

Allocate the data pages through the page allocator instead.
Unused pages in the vDSO VMA are still allocated to keep the virtual
addresses aligned.

These pages are used by both the timekeeping, random pool and architecture
initialization code. Introduce a new early initialization step, to make
sure they are available when needed.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 include/linux/vdso_datastore.h |  6 ++++++
 init/main.c                    |  2 ++
 lib/vdso/datastore.c           | 44 ++++++++++++++++++++++--------------------
 3 files changed, 31 insertions(+), 21 deletions(-)

diff --git a/include/linux/vdso_datastore.h b/include/linux/vdso_datastore.h
index a91fa24b06e09321fdff8c2c7bdfbc1b206db574..0b530428db711e58660e797d9d3cf5dce60217fe 100644
--- a/include/linux/vdso_datastore.h
+++ b/include/linux/vdso_datastore.h
@@ -2,9 +2,15 @@
 #ifndef _LINUX_VDSO_DATASTORE_H
 #define _LINUX_VDSO_DATASTORE_H
 
+#ifdef CONFIG_HAVE_GENERIC_VDSO
 #include <linux/mm_types.h>
 
 extern const struct vm_special_mapping vdso_vvar_mapping;
 struct vm_area_struct *vdso_install_vvar_mapping(struct mm_struct *mm, unsigned long addr);
 
+void __init vdso_setup_data_pages(void);
+#else /* !CONFIG_HAVE_GENERIC_VDSO */
+static inline void vdso_setup_data_pages(void) { }
+#endif /* CONFIG_HAVE_GENERIC_VDSO */
+
 #endif /* _LINUX_VDSO_DATASTORE_H */
diff --git a/init/main.c b/init/main.c
index 0ee0ee7b7c2c0a7aceb6f428f8ee61edeead60ec..0d4510a7a5c21a47a040c05da1db919211706a7e 100644
--- a/init/main.c
+++ b/init/main.c
@@ -103,6 +103,7 @@
 #include <linux/randomize_kstack.h>
 #include <linux/pidfs.h>
 #include <linux/ptdump.h>
+#include <linux/vdso_datastore.h>
 #include <net/net_namespace.h>
 
 #include <asm/io.h>
@@ -1007,6 +1008,7 @@ void start_kernel(void)
 	srcu_init();
 	hrtimers_init();
 	softirq_init();
+	vdso_setup_data_pages();
 	timekeeping_init();
 	time_init();
 
diff --git a/lib/vdso/datastore.c b/lib/vdso/datastore.c
index 6e5feb4a95b85f5a1cbdced7cdeddc593fcbad40..67799e8919c202e0800cb78ff70919f9604ac492 100644
--- a/lib/vdso/datastore.c
+++ b/lib/vdso/datastore.c
@@ -1,41 +1,43 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
-#include <linux/linkage.h>
 #include <linux/mm.h>
 #include <linux/time_namespace.h>
 #include <linux/types.h>
 #include <linux/vdso_datastore.h>
 #include <vdso/datapage.h>
 
-/*
- * The vDSO data page.
- */
 #ifdef CONFIG_GENERIC_GETTIMEOFDAY
-static union {
-	struct vdso_time_data	data;
-	u8			page[PAGE_SIZE];
-} vdso_time_data_store __page_aligned_data;
-struct vdso_time_data *vdso_k_time_data = &vdso_time_data_store.data;
-static_assert(sizeof(vdso_time_data_store) == PAGE_SIZE);
+struct vdso_time_data *vdso_k_time_data;
+static_assert(sizeof(struct vdso_time_data) <= PAGE_SIZE);
 #endif /* CONFIG_GENERIC_GETTIMEOFDAY */
 
 #ifdef CONFIG_VDSO_GETRANDOM
-static union {
-	struct vdso_rng_data	data;
-	u8			page[PAGE_SIZE];
-} vdso_rng_data_store __page_aligned_data;
-struct vdso_rng_data *vdso_k_rng_data = &vdso_rng_data_store.data;
-static_assert(sizeof(vdso_rng_data_store) == PAGE_SIZE);
+struct vdso_rng_data *vdso_k_rng_data;
+static_assert(sizeof(struct vdso_rng_data) <= PAGE_SIZE);
 #endif /* CONFIG_VDSO_GETRANDOM */
 
 #ifdef CONFIG_ARCH_HAS_VDSO_ARCH_DATA
-static union {
-	struct vdso_arch_data	data;
-	u8			page[VDSO_ARCH_DATA_SIZE];
-} vdso_arch_data_store __page_aligned_data;
-struct vdso_arch_data *vdso_k_arch_data = &vdso_arch_data_store.data;
+struct vdso_arch_data *vdso_k_arch_data;
 #endif /* CONFIG_ARCH_HAS_VDSO_ARCH_DATA */
 
+void __init vdso_setup_data_pages(void)
+{
+	unsigned int order = get_order(VDSO_NR_PAGES * PAGE_SIZE);
+	struct folio *folio = folio_alloc(GFP_KERNEL, order);
+
+	if (!folio)
+		panic("Unable to allocate VDSO storage pages");
+
+	if (IS_ENABLED(CONFIG_GENERIC_GETTIMEOFDAY))
+		vdso_k_time_data = page_address(folio_page(folio, VDSO_TIME_PAGE_OFFSET));
+
+	if (IS_ENABLED(CONFIG_VDSO_GETRANDOM))
+		vdso_k_rng_data = page_address(folio_page(folio, VDSO_RNG_PAGE_OFFSET));
+
+	if (IS_ENABLED(CONFIG_ARCH_HAS_VDSO_ARCH_DATA))
+		vdso_k_arch_data = page_address(folio_page(folio, VDSO_ARCH_PAGES_START));
+}
+
 static vm_fault_t vvar_fault(const struct vm_special_mapping *sm,
 			     struct vm_area_struct *vma, struct vm_fault *vmf)
 {

-- 
2.51.0


