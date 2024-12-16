Return-Path: <linuxppc-dev+bounces-4182-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B2E9F325C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Dec 2024 15:11:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YBhgT0b0qz2ywR;
	Tue, 17 Dec 2024 01:11:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734358260;
	cv=none; b=BVS9BiPyZs7AHRbI+GRSNEqu3u3Q6tHPnHxdGC3bleRYbNrXD5SE358EedqEjVUTuo/xl2B1uCyLbFPaUfjtZ8M0YUlGl2kzjxy39BiHnmb//iEyzP4RkmK8SunfgDG8oC1v10ewq1CaXctBOvcfRlpYTZfFKh1klAVqUiABhA5Zq+anqMzKNTzUAUe9wrQdGBL5D+o2zWyZxL0lzfyuCJ60KZLWa4RAVD9D3HCIW4qf974hXB6+yto84l8zrf1awQDyEX2pFNUkMqHqjcCuqV2RQ+F4Hytp1AOvIwq2OAQTlpYX9J8iuEvksms4w75sq4OYggJZsol1rDrUY3SL1g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734358260; c=relaxed/relaxed;
	bh=wSwWjoN9hxq4jHDYryBIZocNpGvXWb/8NjpFHhRy2oo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aeoCxfzHZSBjQwE/SQlLsUxEXAbBNG8qeuaTpfU8T7M6ScKfbjcVgdHwY34JuI7KmZNKImDXtVM8UfiXkyXb+Pm37i7Xd5ihMIfT38pWX933dN16mnIKaNU+oj4YlZNN1u4tkMPOe/yiZJRwl35lOL4seUDsPhP7n+jw1708hLOAy+B2tr/U2Qv4oYs1jwkg5tXxsADLhblICuP82JbkkL+Mf+8dAhJJzBWSVCnRGsf7G93ed5mqqOYzfLIibVWaBz4kh3E/7tbjLDowVCmTm0pPyJXUfsP1P9KFk29MdEeNxwJaCz57zKM5r2OoH2yYKu8XKn4aYNExi1czNQdMzA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ZMQujSz5; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=qm/1Jdwi; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ZMQujSz5;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=qm/1Jdwi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YBhgR0Rptz300C
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Dec 2024 01:10:58 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1734358253;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wSwWjoN9hxq4jHDYryBIZocNpGvXWb/8NjpFHhRy2oo=;
	b=ZMQujSz5tD2kN7+lI0fYpPj98xs+sNfo+W3vBIuWWMNlwpDV/izuo9GkscwMhLkuBG+VwU
	gHcWMsBZi+0oJhgJRxAUYy5qeuKaj3OpwcngqvunDPibOk9ughtlxw6pMuUb6pCV3sFP0Z
	+ARJ8WdZfA7lEkHqX+a58WZSo2329Sf4ZWH/WQT83OraaLzYcppk0aOpV6RYAD5lZFFCM6
	WJhmmmkV6HuSG5f9T1Dv37/9DZ33NYVKdO0fkvbOXx9aGqKVyKsknZEJH9KHiPTtrWK+E6
	INXYArNSQNPlC8uqsma3APkSoos+GlBeVzWuv5mM9ZqC1MYMmGxLAl0UZiWS7w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1734358253;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wSwWjoN9hxq4jHDYryBIZocNpGvXWb/8NjpFHhRy2oo=;
	b=qm/1JdwisukCAQ6GVoTkT6wBWxbHH10UkJwsn+dKhsduD9m20Mq0KPz3CVRZZHlB2C11fW
	9Ov67GseUEPV1BDA==
Date: Mon, 16 Dec 2024 15:10:00 +0100
Subject: [PATCH 04/17] vdso: Add generic random data storage
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
Message-Id: <20241216-vdso-store-rng-v1-4-f7aed1bdb3b2@linutronix.de>
References: <20241216-vdso-store-rng-v1-0-f7aed1bdb3b2@linutronix.de>
In-Reply-To: <20241216-vdso-store-rng-v1-0-f7aed1bdb3b2@linutronix.de>
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
 "H. Peter Anvin" <hpa@zytor.com>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
 loongarch@lists.linux.dev, linux-s390@vger.kernel.org, 
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-arch@vger.kernel.org, Nam Cao <namcao@linutronix.de>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734358247; l=4160;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=Klz0GewD0ghfBFLK7c5qIVdXa+oTtzdoujgf0ypgqME=;
 b=thexmYXfp+n2eSvYCtrf5cHaHBiOJId1Zbewgq/CRRe/slaV9CWnriEbx6SMa7+VxZ1s/NRmL
 of3YMYg6mVqBPc5bM65DLHRgkU9CD5Z5/CTZ07zGsAVXWNGT54vKQM2
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
 include/vdso/datapage.h     | 24 ++++++++++++++++++++++++
 lib/vdso_kernel/datastore.c | 14 ++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/include/vdso/datapage.h b/include/vdso/datapage.h
index 69af424413db1f265607d0f1bdbf88550548c5ba..5ce322422fcb7ba77aeafddbf132fd3e5dbc5a0c 100644
--- a/include/vdso/datapage.h
+++ b/include/vdso/datapage.h
@@ -145,8 +145,10 @@ extern struct vdso_rng_data _vdso_rng_data __attribute__((visibility("hidden")))
 #else
 extern const struct vdso_time_data vdso_u_time_data[CS_BASES] __attribute__((visibility("hidden")));
 extern const struct vdso_time_data vdso_u_timens_data[CS_BASES] __attribute__((visibility("hidden")));
+extern const struct vdso_rng_data vdso_u_rng_data __attribute__((visibility("hidden")));
 
 extern struct vdso_time_data *vdso_k_time_data;
+extern struct vdso_rng_data *vdso_k_rng_data;
 #endif
 
 /**
@@ -162,6 +164,7 @@ union vdso_data_store {
 enum vdso_pages {
 	VDSO_TIME_PAGE_OFFSET,
 	VDSO_TIMENS_PAGE_OFFSET,
+	VDSO_RNG_PAGE_OFFSET,
 	VDSO_NR_PAGES
 };
 
@@ -185,6 +188,20 @@ static __always_inline const struct vdso_time_data *__arch_get_vdso_u_timens_dat
 #define __arch_get_timens_vdso_data(vd) __arch_get_vdso_u_timens_data()
 #endif /* CONFIG_TIME_NS */
 
+#ifdef CONFIG_VDSO_GETRANDOM
+static __always_inline const struct vdso_rng_data *__arch_get_vdso_u_rng_data(void)
+{
+	return &vdso_u_rng_data;
+}
+#define __arch_get_vdso_rng_data __arch_get_vdso_u_rng_data
+
+static __always_inline struct vdso_rng_data *__arch_get_vdso_k_rng_data(void)
+{
+	return vdso_k_rng_data;
+}
+#define __arch_get_k_vdso_rng_data __arch_get_vdso_k_rng_data
+#endif /* CONFIG_VDSO_GETRANDOM */
+
 #endif /* CONFIG_GENERIC_VDSO_DATA_STORE */
 
 /*
@@ -211,10 +228,17 @@ static __always_inline const struct vdso_time_data *__arch_get_vdso_u_timens_dat
 #define __vdso_u_timens_data
 #endif
 
+#ifdef CONFIG_VDSO_GETRANDOM
+#define __vdso_u_rng_data	PROVIDE(vdso_u_rng_data = vdso_u_data + 2 * PAGE_SIZE);
+#else
+#define __vdso_u_rng_data
+#endif
+
 #define VDSO_VVAR_SYMS						\
 	PROVIDE(vdso_u_data = . - __VDSO_PAGES * PAGE_SIZE);	\
 	PROVIDE(vdso_u_time_data = vdso_u_data);		\
 	__vdso_u_timens_data					\
+	__vdso_u_rng_data					\
 
 
 #endif /* !__ASSEMBLY__ */
diff --git a/lib/vdso_kernel/datastore.c b/lib/vdso_kernel/datastore.c
index c9cd269b1ed1b6cdd5fdf9fe929d0b778314b962..0d4f5317b508a54b4f3295f0335d1eefce74d78c 100644
--- a/lib/vdso_kernel/datastore.c
+++ b/lib/vdso_kernel/datastore.c
@@ -15,6 +15,15 @@ static union vdso_data_store vdso_time_data_store __page_aligned_data;
 struct vdso_time_data *vdso_k_time_data = vdso_time_data_store.data;
 static_assert(sizeof(vdso_time_data_store) == PAGE_SIZE);
 
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
@@ -49,6 +58,11 @@ static vm_fault_t vvar_fault(const struct vm_special_mapping *sm,
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

-- 
2.47.1


