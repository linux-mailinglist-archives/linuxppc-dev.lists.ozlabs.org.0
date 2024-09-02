Return-Path: <linuxppc-dev+bounces-891-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 545C4968E49
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2024 21:17:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WyJRn4BR1z2yN4;
	Tue,  3 Sep 2024 05:17:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725304661;
	cv=none; b=l/SccFK4A7SOxNxAM25k5VKxf1RSWa152xS+MEQYcISY5YB+h09Gd2IE3czcRbu3HIJUpPy7lx39jzd8eEYD5uAbU7Y2k7RSsE/KNNOX6QGQ3joOkdw047XHj0bLLIDhY393QZnXGHuirYXSp65sJaGmYAhNVXl9GnBUQLOh4mwkFC5kqemKhxwMYUu2mwIZUwaJfQNFsFDgYU7bXKQmddCwfGrJOy0tl3iHztBMbNGcLGQPzAi8IdS+T2MkZJDTFOwhmw0pusSnvRoLyUf97lCDVh1bCYKa1NjNEaNFP42D0TNCpZBLLQ190qGWK/A6HNmKsBJw1MeRHZP6P7iQxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725304661; c=relaxed/relaxed;
	bh=tAg61Zyqrflk/oJA5T5Z5RbcySQiS7N9PdlZqAQYPWw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Auz9ngOUryC7b9NeNLYyG0RUqzD+M0nXDohFKQrSLY+FvZBJelc9Ulb6ZZApx91R4i31xjnDwNjaTdmyPqzsVAq8lx6JxFKlH7BJvtcvFvtKFMDx4H8mC1RVt/uw6a87JAcKmO8wa/7ZyfcEVmfBX0dSTW+aijEFcjjK8l5ey5EYiSh0F+NDErHBxLEckX5IuIdazdrCLfki+nUZcPLeRBscLXMHcoxQxtqHTudP41j1An5IA5LBBG9dap65b0/FlUQBfcK/ZKB5iQ/tTdwRiGXSvOpLbXQEjE0siUuJETlV4vzVWaoUMZtD1KeZ7RqX/8Kg5uDWUCM9RgRUM63OzQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WyJRn232pz2xfK
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2024 05:17:41 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4WyJRb4YChz9sSK;
	Mon,  2 Sep 2024 21:17:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rliv3BQP30eL; Mon,  2 Sep 2024 21:17:31 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4WyJRb3KmGz9sS7;
	Mon,  2 Sep 2024 21:17:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 642888B773;
	Mon,  2 Sep 2024 21:17:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id RznGlAhRZuPR; Mon,  2 Sep 2024 21:17:31 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.234.167])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 5C7B58B770;
	Mon,  2 Sep 2024 21:17:30 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Andrew Morton <akpm@linux-foundation.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Shuah Khan <shuah@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kselftest@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-trace-kernel@vger.kernel.org,
	Adhemerval Zanella <adhemerval.zanella@linaro.org>,
	Xi Ruoyao <xry111@xry111.site>
Subject: [PATCH v5 1/5] mm: Define VM_DROPPABLE for powerpc/32
Date: Mon,  2 Sep 2024 21:17:18 +0200
Message-ID: <0e6772967de99ca9282bb0310c874ea12d7451ac.1725304404.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1725304404.git.christophe.leroy@csgroup.eu>
References: <cover.1725304404.git.christophe.leroy@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725304637; l=3068; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=D2XQkJzjCFhHvddcGK1wPF6zrU/7AFSP1S12xB5e/Jg=; b=wPREOAD0QoGI3TW4gibAz+4870cjqR2AP1EDXAzDUImqHYutjDy/A0w6uXuA0u18wT9L6TgOA YxZ/LTuImy+AoekkJJDf68lKw7vkcVjepyt1+WTQH38anbkqvsubuT+
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit

Commit 9651fcedf7b9 ("mm: add MAP_DROPPABLE for designating always
lazily freeable mappings") only adds VM_DROPPABLE for 64 bits
architectures.

In order to also use the getrandom vDSO implementation on powerpc/32,
use VM_ARCH_1 for VM_DROPPABLE on powerpc/32. This is possible because
VM_ARCH_1 is used for VM_SAO on powerpc and VM_SAO is only for
powerpc/64. It is used in combination with PROT_SAO in some parts of
code that are restricted to CONFIG_PPC64 through #ifdefs, it is
therefore possible to define VM_SAO for CONFIG_PPC64 only.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v4: Added more details in commit message following comment from Michael.
v3: Fixed build failure reported by robots.
---
 fs/proc/task_mmu.c             | 4 +++-
 include/linux/mm.h             | 4 +++-
 include/trace/events/mmflags.h | 4 ++--
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index 5f171ad7b436..3a07e13e2f81 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -987,8 +987,10 @@ static void show_smap_vma_flags(struct seq_file *m, struct vm_area_struct *vma)
 #ifdef CONFIG_X86_USER_SHADOW_STACK
 		[ilog2(VM_SHADOW_STACK)] = "ss",
 #endif
-#ifdef CONFIG_64BIT
+#if defined(CONFIG_64BIT) || defined(CONFIG_PPC32)
 		[ilog2(VM_DROPPABLE)] = "dp",
+#endif
+#ifdef CONFIG_64BIT
 		[ilog2(VM_SEALED)] = "sl",
 #endif
 	};
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 6549d0979b28..028847f39442 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -359,7 +359,7 @@ extern unsigned int kobjsize(const void *objp);
 
 #if defined(CONFIG_X86)
 # define VM_PAT		VM_ARCH_1	/* PAT reserves whole VMA at once (x86) */
-#elif defined(CONFIG_PPC)
+#elif defined(CONFIG_PPC64)
 # define VM_SAO		VM_ARCH_1	/* Strong Access Ordering (powerpc) */
 #elif defined(CONFIG_PARISC)
 # define VM_GROWSUP	VM_ARCH_1
@@ -409,6 +409,8 @@ extern unsigned int kobjsize(const void *objp);
 #ifdef CONFIG_64BIT
 #define VM_DROPPABLE_BIT	40
 #define VM_DROPPABLE		BIT(VM_DROPPABLE_BIT)
+#elif defined(CONFIG_PPC32)
+#define VM_DROPPABLE		VM_ARCH_1
 #else
 #define VM_DROPPABLE		VM_NONE
 #endif
diff --git a/include/trace/events/mmflags.h b/include/trace/events/mmflags.h
index b63d211bd141..37265977d524 100644
--- a/include/trace/events/mmflags.h
+++ b/include/trace/events/mmflags.h
@@ -143,7 +143,7 @@ IF_HAVE_PG_ARCH_X(arch_3)
 
 #if defined(CONFIG_X86)
 #define __VM_ARCH_SPECIFIC_1 {VM_PAT,     "pat"           }
-#elif defined(CONFIG_PPC)
+#elif defined(CONFIG_PPC64)
 #define __VM_ARCH_SPECIFIC_1 {VM_SAO,     "sao"           }
 #elif defined(CONFIG_PARISC)
 #define __VM_ARCH_SPECIFIC_1 {VM_GROWSUP,	"growsup"	}
@@ -165,7 +165,7 @@ IF_HAVE_PG_ARCH_X(arch_3)
 # define IF_HAVE_UFFD_MINOR(flag, name)
 #endif
 
-#ifdef CONFIG_64BIT
+#if defined(CONFIG_64BIT) || defined(CONFIG_PPC32)
 # define IF_HAVE_VM_DROPPABLE(flag, name) {flag, name},
 #else
 # define IF_HAVE_VM_DROPPABLE(flag, name)
-- 
2.44.0


