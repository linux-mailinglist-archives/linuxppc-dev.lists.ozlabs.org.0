Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C6371999C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 12:22:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QX2Hy2vW0z3fsV
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 20:22:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gpP21c/R;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gpP21c/R;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QX27F2c0Yz3f00
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jun 2023 20:14:49 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9DBE963AC0;
	Thu,  1 Jun 2023 10:14:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E2E8C433A0;
	Thu,  1 Jun 2023 10:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685614487;
	bh=Hrx9VtVZyq4uWMBfRCekQXUO/IA4A1XOafQormtZTuY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gpP21c/RwAJYJm+U25a1tWi/38F4mEWtcst293zmlG6D0PKkBX6d3h9ATwIa7uumf
	 xA2hJJdQXNiMtmOQ7k+n+4Eh/tb5q0l+ZhSYKzMYnVQJJBECXK0Boas7FeJCclB+qU
	 YcYICH1vai6DP7rq0TDqg3DTbnaTA2lnglkoOvwlhDm1fQ7nyhjt7rdP88kQv/EuQI
	 aAPjl78FETn69M4Prx6Edwv1H7cz2NpKwM5xe4vWf7aC2SYCcxtbSZA9vK0QR4+ALQ
	 VYyMUVtF0JdrmF3hiV5k4Z6ygm8TjniyOkfbF+4LCBKjd7eHTl1itn2XLvK6KpbTcp
	 yOKt8OfWFYJOQ==
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 10/13] modules, jitalloc: prepare to allocate executable memory as ROX
Date: Thu,  1 Jun 2023 13:12:54 +0300
Message-Id: <20230601101257.530867-11-rppt@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230601101257.530867-1-rppt@kernel.org>
References: <20230601101257.530867-1-rppt@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linux-trace-kernel@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-mm@kvack.org, netdev@vger.kernel.org, Kent Overstreet <kent.overstreet@linux.dev>, linux-mips@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-modules@vger.kernel.org, bpf@vger.kernel.org, linuxppc-dev@lists.ozl
 abs.org, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Mike Rapoport (IBM)" <rppt@kernel.org>

When executable memory will be allocated as ROX it won't be possible to
update it using memset() and memcpy().

Introduce jit_update_copy() and jit_update_set() APIs and use them in
modules loading code instead of memcpy() and memset().

Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 include/linux/jitalloc.h |  2 ++
 kernel/module/main.c     | 19 ++++++++++++++-----
 mm/jitalloc.c            | 20 ++++++++++++++++++++
 3 files changed, 36 insertions(+), 5 deletions(-)

diff --git a/include/linux/jitalloc.h b/include/linux/jitalloc.h
index 7f8cafb3cfe9..0ba5ef785a85 100644
--- a/include/linux/jitalloc.h
+++ b/include/linux/jitalloc.h
@@ -55,6 +55,8 @@ struct jit_alloc_params *jit_alloc_arch_params(void);
 void jit_free(void *buf);
 void *jit_text_alloc(size_t len);
 void *jit_data_alloc(size_t len);
+void jit_update_copy(void *buf, void *new_buf, size_t len);
+void jit_update_set(void *buf, int c, size_t len);
 
 #ifdef CONFIG_JIT_ALLOC
 void jit_alloc_init(void);
diff --git a/kernel/module/main.c b/kernel/module/main.c
index 91477aa5f671..9f0711c42aa2 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -1197,9 +1197,19 @@ void __weak module_arch_freeing_init(struct module *mod)
 
 static void *module_memory_alloc(unsigned int size, enum mod_mem_type type)
 {
-	if (mod_mem_type_is_data(type))
-		return jit_data_alloc(size);
-	return jit_text_alloc(size);
+	void *p;
+
+	if (mod_mem_type_is_data(type)) {
+		p = jit_data_alloc(size);
+		if (p)
+			memset(p, 0, size);
+	} else {
+		p = jit_text_alloc(size);
+		if (p)
+			jit_update_set(p, 0, size);
+	}
+
+	return p;
 }
 
 static void module_memory_free(void *ptr, enum mod_mem_type type)
@@ -2223,7 +2233,6 @@ static int move_module(struct module *mod, struct load_info *info)
 			t = type;
 			goto out_enomem;
 		}
-		memset(ptr, 0, mod->mem[type].size);
 		mod->mem[type].base = ptr;
 	}
 
@@ -2251,7 +2260,7 @@ static int move_module(struct module *mod, struct load_info *info)
 				ret = -ENOEXEC;
 				goto out_enomem;
 			}
-			memcpy(dest, (void *)shdr->sh_addr, shdr->sh_size);
+			jit_update_copy(dest, (void *)shdr->sh_addr, shdr->sh_size);
 		}
 		/*
 		 * Update the userspace copy's ELF section address to point to
diff --git a/mm/jitalloc.c b/mm/jitalloc.c
index 16fd715d501a..a8ae64364d56 100644
--- a/mm/jitalloc.c
+++ b/mm/jitalloc.c
@@ -7,6 +7,16 @@
 
 static struct jit_alloc_params jit_alloc_params;
 
+static inline void jit_text_poke_copy(void *dst, const void *src, size_t len)
+{
+	memcpy(dst, src, len);
+}
+
+static inline void jit_text_poke_set(void *addr, int c, size_t len)
+{
+	memset(addr, c, len);
+}
+
 static void *jit_alloc(size_t len, unsigned int alignment, pgprot_t pgprot,
 		       unsigned long start, unsigned long end,
 		       unsigned long fallback_start, unsigned long fallback_end,
@@ -86,6 +96,16 @@ void *jit_data_alloc(size_t len)
 			 fallback_start, fallback_end, kasan);
 }
 
+void jit_update_copy(void *buf, void *new_buf, size_t len)
+{
+	jit_text_poke_copy(buf, new_buf, len);
+}
+
+void jit_update_set(void *addr, int c, size_t len)
+{
+	jit_text_poke_set(addr, c, len);
+}
+
 struct jit_alloc_params * __weak jit_alloc_arch_params(void)
 {
 	return NULL;
-- 
2.35.1

