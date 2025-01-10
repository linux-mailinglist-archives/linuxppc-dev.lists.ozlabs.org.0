Return-Path: <linuxppc-dev+bounces-5045-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4806A09F22
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jan 2025 01:15:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YVJvG4739z3d2N;
	Sat, 11 Jan 2025 11:15:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::349"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736534503;
	cv=none; b=NhNLMzRgyBxg//Ys3ps7k3zD83PUgXaSeNMWZrU+EiX2OyPPcoIjtNXRaFtPxE21y3jtt3u7Q8qPVNFPEHW2HCc/exL6B5mY2TEHyUuRAzAYNdk576Sn9+4O8wseqAtMDKPme7bSe+almr05MxYeBzPEvC+sQW3dIooztx5AhLmbMlTYqcv+TN3bTI2UvdVqX8i5qcoLt8Of3xhlTPO+rM0+cjlEFDSSo7I3XAV/95OljcTNgZAnBxQwS+bAVWVYDKOUimx1zDYwNUWICSFXfoCq2guuuM81rzlCGV/pZRJZ45Q7jw2ueQCNLh7HjUgzNQ/wiK6VbVIX8/JBe3jjwg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736534503; c=relaxed/relaxed;
	bh=P63tWziIl5MLfOevD/STQnofaJPDmGipUyDaNTwON8A=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hxuv+Zr7z6sv6Llt2DL8UheeKRcxqBqam/QnkQcpSXzJtSjIGp6Fq/41nI3RXy6KPwfAv0HZJbmN9gh9oIjEC/9Lilg+WMDfAAGReEEMLlFAsZ6kVLrIDDC1o0ujhLQ1eMyUbWs6lu+Z5PnfKaT/CA46tu9zlTEtwowyZq4DYU0MvmvwfelxuVykM6FJjNt0nnDxb1STm4Ck3Nlz+ekhOhLUrnOwLB6sdJQmPD2qgf4K3UtKXUoYZdP1lduZBYaBw2vUpeIdFIlGApQkBkiOqwU58NZK26vFF7qFkzXO2IagUulsyYyyhtywVjK/ynu3R/MZSuA8HDEMc4uyEXzcug==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=vfAVJTGa; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::349; helo=mail-wm1-x349.google.com; envelope-from=342mbzwgkdp4pgiqsgthmuumrk.iusrot03vvi-jk1royzy.u5rghy.uxm@flex--jackmanb.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=vfAVJTGa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--jackmanb.bounces.google.com (client-ip=2a00:1450:4864:20::349; helo=mail-wm1-x349.google.com; envelope-from=342mbzwgkdp4pgiqsgthmuumrk.iusrot03vvi-jk1royzy.u5rghy.uxm@flex--jackmanb.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x349.google.com (mail-wm1-x349.google.com [IPv6:2a00:1450:4864:20::349])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YV9VG5752z3cYR
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jan 2025 05:41:42 +1100 (AEDT)
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4362552ce62so12186635e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2025 10:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736534500; x=1737139300; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=P63tWziIl5MLfOevD/STQnofaJPDmGipUyDaNTwON8A=;
        b=vfAVJTGaGHY4OeH83cwzWWQJEKUrKO7IKvrRn9eek6Y4Z+ap+wLgCUuzAMw9S6R3Ps
         gBS+Gw3MD/IRuafEcfGdxtGnW88p30QuwKI/epCyX8Sklexa6XT8Sy8AtE3sWnWbrEuh
         7uyuxTGLwfGQLnNVdZNIGTLFfDEaArgZ2Q202EN5Xypa8H5488dEj4Am9ZSTX2iavz65
         rFe4QPNTXX4zT5NNhjBr3qlBaGFeNQ03igD6xUs8O8YGHNfQYwllLCsdPbs6tFzK7BP3
         dU05ESibxOHk1B0sO8Ak4Pe9g0yXbCSzdNXdHOSTyN9D6IDXeZbgRW457qhwSJoMSscc
         xm4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736534500; x=1737139300;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P63tWziIl5MLfOevD/STQnofaJPDmGipUyDaNTwON8A=;
        b=sQJVPJk36xgVBxao6AKk7ZYv+IviGwDBaG/0V7d32OFEH9sJ4a8irWUgHzVtBToGHU
         TRYrCoh9GVJVWtkrjhuqWkTtJmQebb+BU4KHwaFmjd5mCspnT6PCFEznOeTZIQlsxrio
         rhZV4ZiWiD47cacgLBiHMUnkj16FcR1uNoFb3gKXo1DwDN7mTQzhyH4tFcfc3/1g7E5/
         d4r0iPZCmxoluPoT+Q12B3fVHRemw8eifpz6qgVq4sNvWR89LnFhxvTVjbfwoThixML2
         Sl2SPpvKrzb5vgQUe7RAkHJ48bDdX41rwwt4+jLq4V7eXLVFq3cWiGHG2YcxIRO4Emc5
         CeoA==
X-Forwarded-Encrypted: i=1; AJvYcCWjz+HX7JkwO5KmakvNq0gvAowRkG+qPm3qIA4PmDfnvtxU8/QLifPe6RcAq+d53GKsZ/8MEPP+uJwQwvE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy9BnMra5Cz0JDq8BYoXk2b4ujpR/YUd7tfO3tKSBeqmUai3hf9
	dG2HFs6OyCkGP2vnD+Z/HDNNZfIudyI1fHMnHHZOuJW1aEuhSKWQGgougFeJqACOzxf2fEZSExL
	T5wuNzNnG1A==
X-Google-Smtp-Source: AGHT+IFpLRoJ7ZhWq6f6CfOMCmb66msRmVLu03/rxTgeCGcpzkKTsEslMdO3oeVqCUER7+YbrfuCetVYZstiXQ==
X-Received: from wmbew14.prod.google.com ([2002:a05:600c:808e:b0:436:16c6:831])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:156c:b0:385:e3c5:61ae with SMTP id ffacd0b85a97d-38a873125c3mr11343217f8f.31.1736534499784;
 Fri, 10 Jan 2025 10:41:39 -0800 (PST)
Date: Fri, 10 Jan 2025 18:40:50 +0000
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
Message-ID: <20250110-asi-rfc-v2-v2-24-8419288bc805@google.com>
Subject: [PATCH RFC v2 24/29] mm: asi: Add infrastructure for mapping
 userspace addresses
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
	Reiji Watanabe <reijiw@google.com>
Content-Type: text/plain; charset="utf-8"
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

In preparation for sandboxing bare-metal processes, teach ASI to map
userspace addresses into the restricted address space.

Add a new policy helper to determine based on the class whether to do
this. If the helper returns true, mirror userspace mappings into the ASI
pagetables.

Later, it will be possible for users who do not have a significant
security boundary between KVM guests and their VMM process, to take
advantage of this to reduce mitigation costs when switching between
those two domains - to illustrate this idea, it's now reflected in the
KVM taint policy, although the KVM class is still hard-coded not to map
userspace addresses.

Co-developed-by: Junaid Shahid <junaids@google.com>
Signed-off-by: Junaid Shahid <junaids@google.com>
Co-developed-by: Reiji Watanabe <reijiw@google.com>
Signed-off-by: Reiji Watanabe <reijiw@google.com>
Signed-off-by: Brendan Jackman <jackmanb@google.com>
---
 arch/x86/include/asm/asi.h        | 11 +++++
 arch/x86/include/asm/pgalloc.h    |  6 +++
 arch/x86/include/asm/pgtable_64.h |  4 ++
 arch/x86/kvm/x86.c                | 12 +++--
 arch/x86/mm/asi.c                 | 92 +++++++++++++++++++++++++++++++++++++++
 include/asm-generic/asi.h         |  4 ++
 6 files changed, 125 insertions(+), 4 deletions(-)

diff --git a/arch/x86/include/asm/asi.h b/arch/x86/include/asm/asi.h
index 555edb5f292e4d6baba782f51d014aa48dc850b6..e925d7d2cfc85bca8480c837548654e7a5a7009e 100644
--- a/arch/x86/include/asm/asi.h
+++ b/arch/x86/include/asm/asi.h
@@ -133,6 +133,7 @@ struct asi {
 	struct mm_struct *mm;
 	int64_t ref_count;
 	enum asi_class_id class_id;
+	spinlock_t pgd_lock;
 };
 
 DECLARE_PER_CPU_ALIGNED(struct asi *, curr_asi);
@@ -147,6 +148,7 @@ const char *asi_class_name(enum asi_class_id class_id);
 
 int asi_init(struct mm_struct *mm, enum asi_class_id class_id, struct asi **out_asi);
 void asi_destroy(struct asi *asi);
+void asi_clone_user_pgtbl(struct mm_struct *mm, pgd_t *pgdp);
 
 /* Enter an ASI domain (restricted address space) and begin the critical section. */
 void asi_enter(struct asi *asi);
@@ -286,6 +288,15 @@ static __always_inline bool asi_in_critical_section(void)
 
 void asi_handle_switch_mm(void);
 
+/*
+ * This function returns true when we would like to map userspace addresses
+ * in the restricted address space.
+ */
+static inline bool asi_maps_user_addr(enum asi_class_id class_id)
+{
+	return false;
+}
+
 #endif /* CONFIG_MITIGATION_ADDRESS_SPACE_ISOLATION */
 
 #endif
diff --git a/arch/x86/include/asm/pgalloc.h b/arch/x86/include/asm/pgalloc.h
index dcd836b59bebd329c3d265b98e48ef6eb4c9e6fc..edf9fe76c53369eefcd5bf14a09cbf802cf1ea21 100644
--- a/arch/x86/include/asm/pgalloc.h
+++ b/arch/x86/include/asm/pgalloc.h
@@ -114,12 +114,16 @@ static inline void p4d_populate(struct mm_struct *mm, p4d_t *p4d, pud_t *pud)
 {
 	paravirt_alloc_pud(mm, __pa(pud) >> PAGE_SHIFT);
 	set_p4d(p4d, __p4d(_PAGE_TABLE | __pa(pud)));
+	if (!pgtable_l5_enabled())
+		asi_clone_user_pgtbl(mm, (pgd_t *)p4d);
 }
 
 static inline void p4d_populate_safe(struct mm_struct *mm, p4d_t *p4d, pud_t *pud)
 {
 	paravirt_alloc_pud(mm, __pa(pud) >> PAGE_SHIFT);
 	set_p4d_safe(p4d, __p4d(_PAGE_TABLE | __pa(pud)));
+	if (!pgtable_l5_enabled())
+		asi_clone_user_pgtbl(mm, (pgd_t *)p4d);
 }
 
 extern void ___pud_free_tlb(struct mmu_gather *tlb, pud_t *pud);
@@ -137,6 +141,7 @@ static inline void pgd_populate(struct mm_struct *mm, pgd_t *pgd, p4d_t *p4d)
 		return;
 	paravirt_alloc_p4d(mm, __pa(p4d) >> PAGE_SHIFT);
 	set_pgd(pgd, __pgd(_PAGE_TABLE | __pa(p4d)));
+	asi_clone_user_pgtbl(mm, pgd);
 }
 
 static inline void pgd_populate_safe(struct mm_struct *mm, pgd_t *pgd, p4d_t *p4d)
@@ -145,6 +150,7 @@ static inline void pgd_populate_safe(struct mm_struct *mm, pgd_t *pgd, p4d_t *p4
 		return;
 	paravirt_alloc_p4d(mm, __pa(p4d) >> PAGE_SHIFT);
 	set_pgd_safe(pgd, __pgd(_PAGE_TABLE | __pa(p4d)));
+	asi_clone_user_pgtbl(mm, pgd);
 }
 
 static inline p4d_t *p4d_alloc_one(struct mm_struct *mm, unsigned long addr)
diff --git a/arch/x86/include/asm/pgtable_64.h b/arch/x86/include/asm/pgtable_64.h
index d1426b64c1b9715cd9e4d1d7451ae4feadd8b2f5..fe6d83ec632a6894527784f2ebdbd013161c6f09 100644
--- a/arch/x86/include/asm/pgtable_64.h
+++ b/arch/x86/include/asm/pgtable_64.h
@@ -157,6 +157,8 @@ static inline void native_set_p4d(p4d_t *p4dp, p4d_t p4d)
 static inline void native_p4d_clear(p4d_t *p4d)
 {
 	native_set_p4d(p4d, native_make_p4d(0));
+	if (!pgtable_l5_enabled())
+		asi_clone_user_pgtbl(NULL, (pgd_t *)p4d);
 }
 
 static inline void native_set_pgd(pgd_t *pgdp, pgd_t pgd)
@@ -167,6 +169,8 @@ static inline void native_set_pgd(pgd_t *pgdp, pgd_t pgd)
 static inline void native_pgd_clear(pgd_t *pgd)
 {
 	native_set_pgd(pgd, native_make_pgd(0));
+	if (pgtable_l5_enabled())
+		asi_clone_user_pgtbl(NULL, pgd);
 }
 
 /*
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 3e0811eb510650abc601e4adce1ce4189835a730..920475fe014f6503dd88c7bbdb6b2707c084a689 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -9712,11 +9712,15 @@ static inline int kvm_x86_init_asi_class(void)
 	/*
 	 * And the same for data left behind by code in the userspace domain
 	 * (i.e. the VMM itself, plus kernel code serving its syscalls etc).
-	 * This should eventually be configurable: users whose VMMs contain
-	 * no secrets can disable it to avoid paying a mitigation cost on
-	 * transition between their guest and userspace.
+	 *
+	 *
+	 * If we decided to map userspace into the guest's restricted address
+	 * space then we don't bother with this since we assume either no bugs
+	 * allow the guest to leak that data, or the user doesn't care about
+	 * that security boundary.
 	 */
-	policy.protect_data |= ASI_TAINT_USER_DATA;
+	if (!asi_maps_user_addr(ASI_CLASS_KVM))
+		policy.protect_data |= ASI_TAINT_USER_DATA;
 
 	return asi_init_class(ASI_CLASS_KVM, &policy);
 }
diff --git a/arch/x86/mm/asi.c b/arch/x86/mm/asi.c
index c5073af1a82ded1c6fc467cd7a5d29a39d676bb4..093103c1bc2677c81d68008aca064fab53b73a62 100644
--- a/arch/x86/mm/asi.c
+++ b/arch/x86/mm/asi.c
@@ -14,6 +14,7 @@
 #include <asm/pgalloc.h>
 #include <asm/mmu_context.h>
 #include <asm/traps.h>
+#include <asm/pgtable.h>
 
 #include "mm_internal.h"
 #include "../../../mm/internal.h"
@@ -351,6 +352,33 @@ static void __asi_destroy(struct asi *asi)
 	memset(asi, 0, sizeof(struct asi));
 }
 
+static void __asi_init_user_pgds(struct mm_struct *mm, struct asi *asi)
+{
+	int i;
+
+	if (!asi_maps_user_addr(asi->class_id))
+		return;
+
+	/*
+	 * The code below must be executed only after the given asi is
+	 * available in mm->asi[index] to ensure at least either this
+	 * function or __asi_clone_user_pgd() will copy entries in the
+	 * unrestricted pgd to the restricted pgd.
+	 */
+	if (WARN_ON_ONCE(&mm->asi[asi->class_id] != asi))
+		return;
+
+	/*
+	 * See the comment for __asi_clone_user_pgd() why we hold the lock here.
+	 */
+	spin_lock(&asi->pgd_lock);
+
+	for (i = 0; i < KERNEL_PGD_BOUNDARY; i++)
+		set_pgd(asi->pgd + i, READ_ONCE(*(mm->pgd + i)));
+
+	spin_unlock(&asi->pgd_lock);
+}
+
 int asi_init(struct mm_struct *mm, enum asi_class_id class_id, struct asi **out_asi)
 {
 	struct asi *asi;
@@ -388,6 +416,7 @@ int asi_init(struct mm_struct *mm, enum asi_class_id class_id, struct asi **out_
 
 	asi->mm = mm;
 	asi->class_id = class_id;
+	spin_lock_init(&asi->pgd_lock);
 
 	for (i = KERNEL_PGD_BOUNDARY; i < PTRS_PER_PGD; i++)
 		set_pgd(asi->pgd + i, asi_global_nonsensitive_pgd[i]);
@@ -398,6 +427,7 @@ int asi_init(struct mm_struct *mm, enum asi_class_id class_id, struct asi **out_
 	else
 		*out_asi = asi;
 
+	__asi_init_user_pgds(mm, asi);
 	mutex_unlock(&mm->asi_init_lock);
 
 	return err;
@@ -891,3 +921,65 @@ void asi_unmap(struct asi *asi, void *addr, size_t len)
 
 	asi_flush_tlb_range(asi, addr, len);
 }
+
+/*
+ * This function is to copy the given unrestricted pgd entry for
+ * userspace addresses to the corresponding restricted pgd entries.
+ * It means that the unrestricted pgd entry must be updated before
+ * this function is called.
+ * We map entire userspace addresses to the restricted address spaces
+ * by copying unrestricted pgd entries to the restricted page tables
+ * so that we don't need to maintain consistency of lower level PTEs
+ * between the unrestricted page table and the restricted page tables.
+ */
+void asi_clone_user_pgtbl(struct mm_struct *mm, pgd_t *pgdp)
+{
+	unsigned long pgd_idx;
+	struct asi *asi;
+	int i;
+
+	if (!static_asi_enabled())
+		return;
+
+	/* We shouldn't need to take care non-userspace mapping. */
+	if (!pgdp_maps_userspace(pgdp))
+		return;
+
+	/*
+	 * The mm will be NULL for p{4,g}d_clear(). We need to get
+	 * the owner mm for this pgd in this case. The pgd page has
+	 * a valid pt_mm only when SHARED_KERNEL_PMD == 0.
+	 */
+	BUILD_BUG_ON(SHARED_KERNEL_PMD);
+	if (!mm) {
+		mm = pgd_page_get_mm(virt_to_page(pgdp));
+		if (WARN_ON_ONCE(!mm))
+			return;
+	}
+
+	/*
+	 * Compute a PGD index of the given pgd entry. This will be the
+	 * index of the ASI PGD entry to be updated.
+	 */
+	pgd_idx = pgdp - PTR_ALIGN_DOWN(pgdp, PAGE_SIZE);
+
+	for (i = 0; i < ARRAY_SIZE(mm->asi); i++) {
+		asi = mm->asi + i;
+
+		if (!asi_pgd(asi) || !asi_maps_user_addr(asi->class_id))
+			continue;
+
+		/*
+		 * We need to synchronize concurrent callers of
+		 * __asi_clone_user_pgd() among themselves, as well as
+		 * __asi_init_user_pgds(). The lock makes sure that reading
+		 * the unrestricted pgd and updating the corresponding
+		 * ASI pgd are not interleaved by concurrent calls.
+		 * We cannot rely on mm->page_table_lock here because it
+		 * is not always held when pgd/p4d_clear_bad() is called.
+		 */
+		spin_lock(&asi->pgd_lock);
+		set_pgd(asi_pgd(asi) + pgd_idx, READ_ONCE(*pgdp));
+		spin_unlock(&asi->pgd_lock);
+	}
+}
diff --git a/include/asm-generic/asi.h b/include/asm-generic/asi.h
index 4f033d3ef5929707fd280f74fc800193e45143c1..d103343292fad567dcd73e45e986fb3974e59898 100644
--- a/include/asm-generic/asi.h
+++ b/include/asm-generic/asi.h
@@ -95,6 +95,10 @@ void asi_flush_tlb_range(struct asi *asi, void *addr, size_t len) { }
 
 static inline void asi_check_boottime_disable(void) { }
 
+static inline void asi_clone_user_pgtbl(struct mm_struct *mm, pgd_t *pgdp) { };
+
+static inline bool asi_maps_user_addr(enum asi_class_id class_id) { return false; }
+
 #endif /* !CONFIG_MITIGATION_ADDRESS_SPACE_ISOLATION */
 
 #endif  /* !_ASSEMBLY_ */

-- 
2.47.1.613.gc27f4b7a9f-goog


