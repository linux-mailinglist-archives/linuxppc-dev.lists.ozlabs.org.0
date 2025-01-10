Return-Path: <linuxppc-dev+bounces-5032-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CF0A09F13
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jan 2025 01:13:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YVJs63B3pz3ck4;
	Sat, 11 Jan 2025 11:13:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::34a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736534475;
	cv=none; b=hI+JsfNdMTXijv6wgs1KVq/xJU4s2tUB8wlQm7EFe8gOfmW4Ha69btDep01Vq8vmWhiraaJBXnxR5axB3vDhzfswwtIhHXX/vWsLRs+C68S4Q2s0aINOw5aEEMq2kQdzYQNo8DcoVRai+9junt+viiMxi62SkAxAAXXzxiP5bhbldNrJfz5dbbnHQHv5gm77pVsgQ8PmlVgKaZrBzMro/49S1j7s2pkzIFyfQ/j6CFy9bboqdjGqIZ5ss0IQH+2xVnRgeHoV7U0RKTFY3p8rww0ZjCqCR6iF5qFt9UKJYVm1+ChxFUm3uM5PizedSfwBQ9MX7is0hmsg8b8kOB7j2w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736534475; c=relaxed/relaxed;
	bh=9R39fCT8BkGaT3ojJEFUEFWnag6aLMpEmNSF+NNhCcA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WHa/yY2h3NgjIs4azQA7+NXEFWZhcFcop3kh/DjtpN2tIVo5XcEZkyE+biTMfgs9zPW6Ajtutf41NxjwQE3pNL2SkyDZl3jcenhccfM0NtbPaNCla0c2ZiHH2kj72WzxCkWHGlVk4f9a+ncQ/8KRQCRvKz/7jTEH5vRZsnKM9jAboyORLyLiXhiCRw695mFT4hLfRmlXEG/VrTmYJq6tYps7C1O4NqpA0OHUbQ1gM/TSzJjkD/6y2WDeD3UOS3Pg7wDAzg5C4xix9N6qB0qkjZ7CoZRFuIfRGAi3YBLVzU+MQKqLYsu09YNMp5QSKn8IyaNhVOrwQA5sq2YxyACYuA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=c7Yf1Xs+; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::34a; helo=mail-wm1-x34a.google.com; envelope-from=3xmmbzwgkdoemdfnpdqejrrjoh.frpolqxassf-ghyolvwv.rcodev.ruj@flex--jackmanb.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=c7Yf1Xs+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--jackmanb.bounces.google.com (client-ip=2a00:1450:4864:20::34a; helo=mail-wm1-x34a.google.com; envelope-from=3xmmbzwgkdoemdfnpdqejrrjoh.frpolqxassf-ghyolvwv.rcodev.ruj@flex--jackmanb.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x34a.google.com (mail-wm1-x34a.google.com [IPv6:2a00:1450:4864:20::34a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YV9Tj51Y7z3cYR
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jan 2025 05:41:13 +1100 (AEDT)
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-436328fcfeeso20435635e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2025 10:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736534471; x=1737139271; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9R39fCT8BkGaT3ojJEFUEFWnag6aLMpEmNSF+NNhCcA=;
        b=c7Yf1Xs+20FJ7qyifF+vlZfOcaGkOt3pEzkpNVOal3PMzpLMJECt6tydDL34FcX3OO
         hMxey16dJjpvxu44C04DU0+kmDiS4sYqVpOGFAafRwXRO3CEpQRN3dtZFTFlBiL+YMAj
         CFS2RxP33J3Fu8Ikq+zlSUpQ3jxgUotLTLMtwedcc6Ul2WFDtK1a1RkaeDwhPgarkpOi
         F/HX5oq8ABwC52ejkDme/v7wYZSuZq6xbCa8b89bHTGUd2W1AZuc7ssJkOLSVJpVcJ4U
         Tg9MwNFYOrzZ+t5jMfjeXD0qMslCdAR4IDymRwhqiOCm8BQawGypEC+1Ri6PsAtlNXV9
         jOOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736534471; x=1737139271;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9R39fCT8BkGaT3ojJEFUEFWnag6aLMpEmNSF+NNhCcA=;
        b=ucdQytvDNV/kENi6Hb3mxAIyIu5yQinCutq+MNAYNS2TwlDBVsfWcy8tt3RppniBW4
         csac2gVUaHXH3ijk1WZxsHNd0/ARMVMyUtMYaLNfsmGU1TTA8Ny4VyKkG+z3AiqJcyCj
         aDoTxOyWwOgvRJMERvCISJoS3AYgFuIF+iA2EUinF879GnSLPSHeCQrARDQwjQ4Cz5ns
         1uAjxq7QqgTCSdVjLuNyNuIoqEmMvRm7DUOi9ohYgDEDyAZIr6wI/8WYQjTVMXrSlgSq
         gE13V6q99KqNvjr6/rj8fPTsnoH43dAqn0HyHxagEsqbuz91NAY7RF5AZdMUov46TQiF
         ykPg==
X-Forwarded-Encrypted: i=1; AJvYcCU5pW+oCxaUzuEvRYc/GEvAHOcNsrkljVoWwNuVk6akOR8sy6Yp/kE9q+rZwpG5k7kuGBse0z1aa8YdjO8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyGo0Vw6tUBD1wjeP230u5aOEMAZQzFPHZCY+9TE0rUruLF3Q2C
	Urs0K7ykflBY/rmctnN+Rg30unfrY7BKgl9ibv3a8SzdK/i84LRW+uczPG15hvCVMkS2g4Wwv9d
	s5NuFIV1Z8Q==
X-Google-Smtp-Source: AGHT+IFAF35eNkOAcz1ZyY8tB2zfXGnUuByWneOp6LmVFLX6PovKFbMifWci/fMsVQav8K8GF97UZk3GG6JG8w==
X-Received: from wmbfl22.prod.google.com ([2002:a05:600c:b96:b0:436:6fa7:621])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:310c:b0:436:840b:2593 with SMTP id 5b1f17b1804b1-436e26ad50emr117815595e9.15.1736534470650;
 Fri, 10 Jan 2025 10:41:10 -0800 (PST)
Date: Fri, 10 Jan 2025 18:40:37 +0000
In-Reply-To: <20250110-asi-rfc-v2-v2-0-8419288bc805@google.com>
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
Mime-Version: 1.0
References: <20250110-asi-rfc-v2-v2-0-8419288bc805@google.com>
X-Mailer: b4 0.15-dev
Message-ID: <20250110-asi-rfc-v2-v2-11-8419288bc805@google.com>
Subject: [PATCH RFC v2 11/29] mm: asi: Functions to map/unmap a memory range
 into ASI page tables
From: Brendan Jackman <jackmanb@google.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Brian Cain <bcain@quicinc.com>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>, 
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Stafford Horne <shorne@gmail.com>, 
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Chris Zankel <chris@zankel.net>, 
	Max Filippov <jcmvbkbc@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Andrew Morton <akpm@linux-foundation.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, Uladzislau Rezki <urezki@gmail.com>, 
	Christoph Hellwig <hch@infradead.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Mike Rapoport <rppt@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	kvm@vger.kernel.org, linux-efi@vger.kernel.org, 
	Brendan Jackman <jackmanb@google.com>, Junaid Shahid <junaids@google.com>, 
	Kevin Cheng <chengkev@google.com>
Content-Type: text/plain; charset="utf-8"
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Junaid Shahid <junaids@google.com>

Two functions, asi_map() and asi_map_gfp(), are added to allow mapping
memory into ASI page tables. The mapping will be identical to the one
for the same virtual address in the unrestricted page tables. This is
necessary to allow switching between the page tables at any arbitrary
point in the kernel.

Another function, asi_unmap() is added to allow unmapping memory mapped
via asi_map*

RFC Notes: Don't read too much into the implementation of this, lots of
it should probably be rewritten. It also needs to gain support for
partial unmappings.

Checkpatch-args: --ignore=MACRO_ARG_UNUSED
Signed-off-by: Junaid Shahid <junaids@google.com>
Signed-off-by: Brendan Jackman <jackmanb@google.com>
Signed-off-by: Kevin Cheng <chengkev@google.com>
---
 arch/x86/include/asm/asi.h |   5 +
 arch/x86/mm/asi.c          | 236 ++++++++++++++++++++++++++++++++++++++++++++-
 arch/x86/mm/tlb.c          |   5 +
 include/asm-generic/asi.h  |  11 +++
 include/linux/pgtable.h    |   3 +
 mm/internal.h              |   2 +
 mm/vmalloc.c               |  32 +++---
 7 files changed, 280 insertions(+), 14 deletions(-)

diff --git a/arch/x86/include/asm/asi.h b/arch/x86/include/asm/asi.h
index a55e73f1b2bc84c41b9ab25f642a4d5f1aa6ba90..33f18be0e268b3a6725196619cbb8d847c21e197 100644
--- a/arch/x86/include/asm/asi.h
+++ b/arch/x86/include/asm/asi.h
@@ -157,6 +157,11 @@ void asi_relax(void);
 /* Immediately exit the restricted address space if in it */
 void asi_exit(void);
 
+int  asi_map_gfp(struct asi *asi, void *addr, size_t len, gfp_t gfp_flags);
+int  asi_map(struct asi *asi, void *addr, size_t len);
+void asi_unmap(struct asi *asi, void *addr, size_t len);
+void asi_flush_tlb_range(struct asi *asi, void *addr, size_t len);
+
 static inline void asi_init_thread_state(struct thread_struct *thread)
 {
 	thread->asi_state.intr_nest_depth = 0;
diff --git a/arch/x86/mm/asi.c b/arch/x86/mm/asi.c
index b15d043acedc9f459f17e86564a15061650afc3a..f2d8fbc0366c289891903e1c2ac6c59b9476d95f 100644
--- a/arch/x86/mm/asi.c
+++ b/arch/x86/mm/asi.c
@@ -11,6 +11,9 @@
 #include <asm/page.h>
 #include <asm/pgalloc.h>
 #include <asm/mmu_context.h>
+#include <asm/traps.h>
+
+#include "../../../mm/internal.h"
 
 static struct asi_taint_policy *taint_policies[ASI_MAX_NUM_CLASSES];
 
@@ -100,7 +103,6 @@ const char *asi_class_name(enum asi_class_id class_id)
  */
 static_assert(!IS_ENABLED(CONFIG_PARAVIRT));
 #define DEFINE_ASI_PGTBL_ALLOC(base, level)				\
-__maybe_unused								\
 static level##_t * asi_##level##_alloc(struct asi *asi,			\
 				       base##_t *base, ulong addr,	\
 				       gfp_t flags)			\
@@ -455,3 +457,235 @@ void asi_handle_switch_mm(void)
 	this_cpu_or(asi_taints, new_taints);
 	this_cpu_and(asi_taints, ~(ASI_TAINTS_GUEST_MASK | ASI_TAINTS_USER_MASK));
 }
+
+static bool is_page_within_range(unsigned long addr, unsigned long page_size,
+				 unsigned long range_start, unsigned long range_end)
+{
+	unsigned long page_start = ALIGN_DOWN(addr, page_size);
+	unsigned long page_end = page_start + page_size;
+
+	return page_start >= range_start && page_end <= range_end;
+}
+
+static bool follow_physaddr(
+	pgd_t *pgd_table, unsigned long virt,
+	phys_addr_t *phys, unsigned long *page_size, ulong *flags)
+{
+	pgd_t *pgd;
+	p4d_t *p4d;
+	pud_t *pud;
+	pmd_t *pmd;
+	pte_t *pte;
+
+	/* RFC: This should be rewritten with lookup_address_in_*. */
+
+	*page_size = PGDIR_SIZE;
+	pgd = pgd_offset_pgd(pgd_table, virt);
+	if (!pgd_present(*pgd))
+		return false;
+	if (pgd_leaf(*pgd)) {
+		*phys = PFN_PHYS(pgd_pfn(*pgd)) | (virt & ~PGDIR_MASK);
+		*flags = pgd_flags(*pgd);
+		return true;
+	}
+
+	*page_size = P4D_SIZE;
+	p4d = p4d_offset(pgd, virt);
+	if (!p4d_present(*p4d))
+		return false;
+	if (p4d_leaf(*p4d)) {
+		*phys = PFN_PHYS(p4d_pfn(*p4d)) | (virt & ~P4D_MASK);
+		*flags = p4d_flags(*p4d);
+		return true;
+	}
+
+	*page_size = PUD_SIZE;
+	pud = pud_offset(p4d, virt);
+	if (!pud_present(*pud))
+		return false;
+	if (pud_leaf(*pud)) {
+		*phys = PFN_PHYS(pud_pfn(*pud)) | (virt & ~PUD_MASK);
+		*flags = pud_flags(*pud);
+		return true;
+	}
+
+	*page_size = PMD_SIZE;
+	pmd = pmd_offset(pud, virt);
+	if (!pmd_present(*pmd))
+		return false;
+	if (pmd_leaf(*pmd)) {
+		*phys = PFN_PHYS(pmd_pfn(*pmd)) | (virt & ~PMD_MASK);
+		*flags = pmd_flags(*pmd);
+		return true;
+	}
+
+	*page_size = PAGE_SIZE;
+	pte = pte_offset_map(pmd, virt);
+	if (!pte)
+		return false;
+
+	if (!pte_present(*pte)) {
+		pte_unmap(pte);
+		return false;
+	}
+
+	*phys = PFN_PHYS(pte_pfn(*pte)) | (virt & ~PAGE_MASK);
+	*flags = pte_flags(*pte);
+
+	pte_unmap(pte);
+	return true;
+}
+
+/*
+ * Map the given range into the ASI page tables. The source of the mapping is
+ * the regular unrestricted page tables. Can be used to map any kernel memory.
+ *
+ * The caller MUST ensure that the source mapping will not change during this
+ * function. For dynamic kernel memory, this is generally ensured by mapping the
+ * memory within the allocator.
+ *
+ * If this fails, it may leave partial mappings behind. You must asi_unmap them,
+ * bearing in mind asi_unmap's requirements on the calling context. Part of the
+ * reason for this is that we don't want to unexpectedly undo mappings that
+ * weren't created by the present caller.
+ *
+ * If the source mapping is a large page and the range being mapped spans the
+ * entire large page, then it will be mapped as a large page in the ASI page
+ * tables too. If the range does not span the entire huge page, then it will be
+ * mapped as smaller pages. In that case, the implementation is slightly
+ * inefficient, as it will walk the source page tables again for each small
+ * destination page, but that should be ok for now, as usually in such cases,
+ * the range would consist of a small-ish number of pages.
+ *
+ * RFC: * vmap_p4d_range supports huge mappings, we can probably use that now.
+ */
+int __must_check asi_map_gfp(struct asi *asi, void *addr, unsigned long len, gfp_t gfp_flags)
+{
+	unsigned long virt;
+	unsigned long start = (size_t)addr;
+	unsigned long end = start + len;
+	unsigned long page_size;
+
+	if (!static_asi_enabled())
+		return 0;
+
+	VM_BUG_ON(!IS_ALIGNED(start, PAGE_SIZE));
+	VM_BUG_ON(!IS_ALIGNED(len, PAGE_SIZE));
+	/* RFC: fault_in_kernel_space should be renamed. */
+	VM_BUG_ON(!fault_in_kernel_space(start));
+
+	gfp_flags &= GFP_RECLAIM_MASK;
+
+	if (asi->mm != &init_mm)
+		gfp_flags |= __GFP_ACCOUNT;
+
+	for (virt = start; virt < end; virt = ALIGN(virt + 1, page_size)) {
+		pgd_t *pgd;
+		p4d_t *p4d;
+		pud_t *pud;
+		pmd_t *pmd;
+		pte_t *pte;
+		phys_addr_t phys;
+		ulong flags;
+
+		if (!follow_physaddr(asi->mm->pgd, virt, &phys, &page_size, &flags))
+			continue;
+
+#define MAP_AT_LEVEL(base, BASE, level, LEVEL) {				\
+			if (base##_leaf(*base)) {				\
+				if (WARN_ON_ONCE(PHYS_PFN(phys & BASE##_MASK) !=\
+						 base##_pfn(*base)))		\
+					return -EBUSY;				\
+				continue;					\
+			}							\
+										\
+			level = asi_##level##_alloc(asi, base, virt, gfp_flags);\
+			if (!level)						\
+				return -ENOMEM;					\
+										\
+			if (page_size >= LEVEL##_SIZE &&			\
+			    (level##_none(*level) || level##_leaf(*level)) &&	\
+			    is_page_within_range(virt, LEVEL##_SIZE,		\
+						 start, end)) {			\
+				page_size = LEVEL##_SIZE;			\
+				phys &= LEVEL##_MASK;				\
+										\
+				if (!level##_none(*level)) {			\
+					if (WARN_ON_ONCE(level##_pfn(*level) != \
+							 PHYS_PFN(phys))) {	\
+						return -EBUSY;			\
+					}					\
+				} else {					\
+					set_##level(level,			\
+						    __##level(phys | flags));	\
+				}						\
+				continue;					\
+			}							\
+		}
+
+		pgd = pgd_offset_pgd(asi->pgd, virt);
+
+		MAP_AT_LEVEL(pgd, PGDIR, p4d, P4D);
+		MAP_AT_LEVEL(p4d, P4D, pud, PUD);
+		MAP_AT_LEVEL(pud, PUD, pmd, PMD);
+		/*
+		 * If a large page is going to be partially mapped
+		 * in 4k pages, convert the PSE/PAT bits.
+		 */
+		if (page_size >= PMD_SIZE)
+			flags = protval_large_2_4k(flags);
+		MAP_AT_LEVEL(pmd, PMD, pte, PAGE);
+
+		VM_BUG_ON(true); /* Should never reach here. */
+	}
+
+	return 0;
+#undef MAP_AT_LEVEL
+}
+
+int __must_check asi_map(struct asi *asi, void *addr, unsigned long len)
+{
+	return asi_map_gfp(asi, addr, len, GFP_KERNEL);
+}
+
+/*
+ * Unmap a kernel address range previously mapped into the ASI page tables.
+ *
+ * The area being unmapped must be a whole previously mapped region (or regions)
+ * Unmapping a partial subset of a previously mapped region is not supported.
+ * That will work, but may end up unmapping more than what was asked for, if
+ * the mapping contained huge pages. A later patch will remove this limitation
+ * by splitting the huge mapping in the ASI page table in such a case. For now,
+ * vunmap_pgd_range() will just emit a warning if this situation is detected.
+ *
+ * This might sleep, and cannot be called with interrupts disabled.
+ */
+void asi_unmap(struct asi *asi, void *addr, size_t len)
+{
+	size_t start = (size_t)addr;
+	size_t end = start + len;
+	pgtbl_mod_mask mask = 0;
+
+	if (!static_asi_enabled() || !len)
+		return;
+
+	VM_BUG_ON(start & ~PAGE_MASK);
+	VM_BUG_ON(len & ~PAGE_MASK);
+	VM_BUG_ON(!fault_in_kernel_space(start)); /* Misnamed, ignore "fault_" */
+
+	vunmap_pgd_range(asi->pgd, start, end, &mask);
+
+	/* We don't support partial unmappings. */
+	if (mask & PGTBL_P4D_MODIFIED) {
+		VM_WARN_ON(!IS_ALIGNED((ulong)addr, P4D_SIZE));
+		VM_WARN_ON(!IS_ALIGNED((ulong)len, P4D_SIZE));
+	} else if (mask & PGTBL_PUD_MODIFIED) {
+		VM_WARN_ON(!IS_ALIGNED((ulong)addr, PUD_SIZE));
+		VM_WARN_ON(!IS_ALIGNED((ulong)len, PUD_SIZE));
+	} else if (mask & PGTBL_PMD_MODIFIED) {
+		VM_WARN_ON(!IS_ALIGNED((ulong)addr, PMD_SIZE));
+		VM_WARN_ON(!IS_ALIGNED((ulong)len, PMD_SIZE));
+	}
+
+	asi_flush_tlb_range(asi, addr, len);
+}
diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
index c41e083c5b5281684be79ad0391c1a5fc7b0c493..c55733e144c7538ce7f97b74ea2b1b9c22497c32 100644
--- a/arch/x86/mm/tlb.c
+++ b/arch/x86/mm/tlb.c
@@ -1040,6 +1040,11 @@ noinstr u16 asi_pcid(struct asi *asi, u16 asid)
 	// return kern_pcid(asid) | ((asi->index + 1) << X86_CR3_ASI_PCID_BITS_SHIFT);
 }
 
+void asi_flush_tlb_range(struct asi *asi, void *addr, size_t len)
+{
+	flush_tlb_kernel_range((ulong)addr, (ulong)addr + len);
+}
+
 #else /* CONFIG_MITIGATION_ADDRESS_SPACE_ISOLATION */
 
 u16 asi_pcid(struct asi *asi, u16 asid) { return kern_pcid(asid); }
diff --git a/include/asm-generic/asi.h b/include/asm-generic/asi.h
index f777a6cf604b0656fb39087f6eba08f980b2cb6f..5be8f7d657ba0bc2196e333f62b084d0c9eef7b6 100644
--- a/include/asm-generic/asi.h
+++ b/include/asm-generic/asi.h
@@ -77,6 +77,17 @@ static inline int asi_intr_nest_depth(void) { return 0; }
 
 static inline void asi_intr_exit(void) { }
 
+static inline int asi_map(struct asi *asi, void *addr, size_t len)
+{
+	return 0;
+}
+
+static inline
+void asi_unmap(struct asi *asi, void *addr, size_t len) { }
+
+static inline
+void asi_flush_tlb_range(struct asi *asi, void *addr, size_t len) { }
+
 #define static_asi_enabled() false
 
 static inline void asi_check_boottime_disable(void) { }
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index e8b2ac6bd2ae3b0a768734c8411f45a7d162e12d..492a9cdee7ff3d4e562c4bf508dc14fd7fa67e36 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1900,6 +1900,9 @@ typedef unsigned int pgtbl_mod_mask;
 #ifndef pmd_leaf
 #define pmd_leaf(x)	false
 #endif
+#ifndef pte_leaf
+#define pte_leaf(x)	1
+#endif
 
 #ifndef pgd_leaf_size
 #define pgd_leaf_size(x) (1ULL << PGDIR_SHIFT)
diff --git a/mm/internal.h b/mm/internal.h
index 64c2eb0b160e169ab9134e3ab618d8a1d552d92c..c0454fe019b9078a963b1ab3685bf31ccfd768b7 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -395,6 +395,8 @@ void unmap_page_range(struct mmu_gather *tlb,
 void page_cache_ra_order(struct readahead_control *, struct file_ra_state *,
 		unsigned int order);
 void force_page_cache_ra(struct readahead_control *, unsigned long nr);
+void vunmap_pgd_range(pgd_t *pgd_table, unsigned long addr, unsigned long end,
+		      pgtbl_mod_mask *mask);
 static inline void force_page_cache_readahead(struct address_space *mapping,
 		struct file *file, pgoff_t index, unsigned long nr_to_read)
 {
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 634162271c0045965eabd9bfe8b64f4a1135576c..8d260f2174fe664b54dcda054cb9759ae282bf03 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -427,6 +427,24 @@ static void vunmap_p4d_range(pgd_t *pgd, unsigned long addr, unsigned long end,
 	} while (p4d++, addr = next, addr != end);
 }
 
+void vunmap_pgd_range(pgd_t *pgd_table, unsigned long addr, unsigned long end,
+		      pgtbl_mod_mask *mask)
+{
+	unsigned long next;
+	pgd_t *pgd = pgd_offset_pgd(pgd_table, addr);
+
+	BUG_ON(addr >= end);
+
+	do {
+		next = pgd_addr_end(addr, end);
+		if (pgd_bad(*pgd))
+			*mask |= PGTBL_PGD_MODIFIED;
+		if (pgd_none_or_clear_bad(pgd))
+			continue;
+		vunmap_p4d_range(pgd, addr, next, mask);
+	} while (pgd++, addr = next, addr != end);
+}
+
 /*
  * vunmap_range_noflush is similar to vunmap_range, but does not
  * flush caches or TLBs.
@@ -441,21 +459,9 @@ static void vunmap_p4d_range(pgd_t *pgd, unsigned long addr, unsigned long end,
  */
 void __vunmap_range_noflush(unsigned long start, unsigned long end)
 {
-	unsigned long next;
-	pgd_t *pgd;
-	unsigned long addr = start;
 	pgtbl_mod_mask mask = 0;
 
-	BUG_ON(addr >= end);
-	pgd = pgd_offset_k(addr);
-	do {
-		next = pgd_addr_end(addr, end);
-		if (pgd_bad(*pgd))
-			mask |= PGTBL_PGD_MODIFIED;
-		if (pgd_none_or_clear_bad(pgd))
-			continue;
-		vunmap_p4d_range(pgd, addr, next, &mask);
-	} while (pgd++, addr = next, addr != end);
+	vunmap_pgd_range(init_mm.pgd, start, end, &mask);
 
 	if (mask & ARCH_PAGE_TABLE_SYNC_MASK)
 		arch_sync_kernel_mappings(start, end);

-- 
2.47.1.613.gc27f4b7a9f-goog


