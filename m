Return-Path: <linuxppc-dev+bounces-5037-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A2FA09F1A
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jan 2025 01:14:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YVJt012M4z3cmC;
	Sat, 11 Jan 2025 11:14:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::349"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736534485;
	cv=none; b=NvVHslz9yNP75ZixPbaSeWtgOyzJ5NFHLpAvIttlN/QkS23diTxHVI8DKIg717KP1o8Dl6f1xgZNAiAxv3owDmz3I/CmKDDtwt7GwSkrOnXaNibB+R0KSL9BzfAzIOR31bGengXC7OG2yTAkGkz9rQ22wApnq3k6T2xWWwWPgIQPHNplJpa8cDB7dy3M6jY9NMwpHOqz9Xn4Pk3dXFtQ2m5JCDl/aQED5GcFVPmcP6nh+dU6suKGil+dW5eMmxuSayH9UrXtigVe1TdAsUqfIzW1me6OG7KRC8CE3XQctmbNj3NKIFCnphVfYilliNKhXLwCgimich1TxeTMMh98FA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736534485; c=relaxed/relaxed;
	bh=KV+yP+i7I0yJqjdnPuT5zohhg/S0Da4STnyrBal2kA0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=L6v5FvofHZ7odsryvtIGpDDiG6NlhMOU2+6Ady35Opggh1Twn9ZfW8pm+vVDIER57Dife4ugoPpSwB1VJSkniY1z+ZBHd1uE3JjMo7P8JlYVa03af6DNQgxEPN6x5BfG+p4LH7HQ1UvJMOkLyA48S3MgOyAz9YKcl0F+dyI3pjwWwqk/J3h1oj7oGHtcYY6sDwaWFi5kfx5PvBeZ/ckhy6Bc5l1flyFc292JROqStQH6pOYb7bBsRBqm9eUAdr3V3qrAZeltCWB++qsD1GqIVuS3429lRc0CPFoj97yuNllenhFceI2bXmtpziTR8bREgiXClLQwMR615/E0RvHtfw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=KczI4yRu; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::349; helo=mail-wm1-x349.google.com; envelope-from=30wmbzwgkdowxoqyaobpuccuzs.qcazwbilddq-rsjzwghg.cnzopg.cfu@flex--jackmanb.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=KczI4yRu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--jackmanb.bounces.google.com (client-ip=2a00:1450:4864:20::349; helo=mail-wm1-x349.google.com; envelope-from=30wmbzwgkdowxoqyaobpuccuzs.qcazwbilddq-rsjzwghg.cnzopg.cfu@flex--jackmanb.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x349.google.com (mail-wm1-x349.google.com [IPv6:2a00:1450:4864:20::349])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YV9Tw4n7wz3cYR
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jan 2025 05:41:24 +1100 (AEDT)
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-436248d1240so11543455e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2025 10:41:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736534482; x=1737139282; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KV+yP+i7I0yJqjdnPuT5zohhg/S0Da4STnyrBal2kA0=;
        b=KczI4yRuh4ox5krn9dtM/ERwUWC+Wu7E9MzMfGYApzBCK+bdNGGNp0N1ugXB8vr1Yv
         8AL87gSicvj9Q3eV6XBG8JWXd5iOVbu5zA9WN3u60eeHvmmbJvwnNnIlJV/o3W32/VHu
         reDT0gVHLNe+d7fU1y1qlJ8tK+oayQwXuRhSF1ebjh0ot6TiLuuX6/Q/fOo+P+XpKBpY
         FJZMEREddoQDM2m4yNSoP3soLuXF0Fn4iU0LUV92FK6USbaTLTk0OuBtTPKdYFm+uckx
         PZvlrhzkXoKBHJ99MEwFRKvRfoVoIwXIqHdQAXiTNROxTAdHLqfxRzTyoYKmTLKMBDUI
         Gvvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736534482; x=1737139282;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KV+yP+i7I0yJqjdnPuT5zohhg/S0Da4STnyrBal2kA0=;
        b=hUI+VNYYH810nVkky3yhNMQ+NBbxddwbl9OWfJxuEWOkSvSG5HSdwzNC2KWAp4voma
         mgDmGq/Hx5fagp3PMLNU4kFp/MHECARw6X3x+Ns9JpdfHQKMlemA3AlFDp1MAvr3ZRmk
         s8wFuRFDSXBd/aPc6FpYgHN9LBNCv4uT5Sm3gars/zRtn1Cqs9fl0VOQq3JK123suLKO
         /u+HollHryx4/6N5sJKr5MPqq+1xgmxj24XnNdGkDLKGe4X8AImTBIo6yMOSb6pSkR3W
         0dMV/sLHeIp/FCLG7eIQOKH/lLIZkcmfUFsZn+o64C84CfJREnLuya49jhmYGRWf1eiJ
         ENUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXl9h8BL5/iLyTx7+iLoJy0YL7pnSbS2GxxShfDcHBIxQYgWQjcuRNCeUnK6fIuR4W9V/Muok7paEaCYqI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxPhhdv7pNQKinhpQ1bHesq362Vr9Ks49ZlnF1kK/ZZS47B+6i5
	usoHHwbrP28tt+1HLaf+9DMP44kjYdCfg/va5hK89j3/+fc3CK61THiBwgx+Gg1PU0KmgZsIY3k
	yiSJz831EjA==
X-Google-Smtp-Source: AGHT+IGysxF4lj+Pa3edYCQyxcx2uUdgDB4x/aH3it4KUk62HUjYx0xS9V+RTFKPnAfHJUfpiQOrJBNcPZbgiA==
X-Received: from wmbfl22.prod.google.com ([2002:a05:600c:b96:b0:436:6fa7:621])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5117:b0:431:60ec:7a96 with SMTP id 5b1f17b1804b1-436e26ddc53mr94187935e9.25.1736534481726;
 Fri, 10 Jan 2025 10:41:21 -0800 (PST)
Date: Fri, 10 Jan 2025 18:40:42 +0000
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
Message-ID: <20250110-asi-rfc-v2-v2-16-8419288bc805@google.com>
Subject: [PATCH RFC v2 16/29] mm: asi: Map kernel text and static data as nonsensitive
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
	Brendan Jackman <jackmanb@google.com>
Content-Type: text/plain; charset="utf-8"
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Basically we need to map the kernel code and all its static variables.
Per-CPU variables need to be treated specially as described in the
comments. The cpu_entry_area is similar - this needs to be
nonsensitive so that the CPU can access the GDT etc when handling
a page fault.

Under 5-level paging, most of the kernel memory comes under a single PGD
entry (see Documentation/x86/x86_64/mm.rst. Basically, the mapping is
for this big region is the same as under 4-level, just wrapped in an
outer PGD entry). For that region, the "clone" logic is moved down one
step of the paging hierarchy.

Note that the p4d_alloc in asi_clone_p4d won't actually be used in
practice; the relevant PGD entry will always have been populated by
prior asi_map calls so this code would "work" if we just wrote
p4d_offset (but asi_clone_p4d would be broken if viewed in isolation).

The vmemmap area is not under this single PGD, it has its own 2-PGD
area, so we still use asi_clone_pgd for that one.

Signed-off-by: Brendan Jackman <jackmanb@google.com>
---
 arch/x86/mm/asi.c                 | 105 +++++++++++++++++++++++++++++++++++++-
 include/asm-generic/vmlinux.lds.h |  11 ++++
 2 files changed, 115 insertions(+), 1 deletion(-)

diff --git a/arch/x86/mm/asi.c b/arch/x86/mm/asi.c
index b951f2100b8bdea5738ded16166255deb29faf57..bc2cf0475a0e7344a66d81453f55034b2fc77eef 100644
--- a/arch/x86/mm/asi.c
+++ b/arch/x86/mm/asi.c
@@ -7,7 +7,6 @@
 #include <linux/init.h>
 #include <linux/pgtable.h>
 
-#include <asm/asi.h>
 #include <asm/cmdline.h>
 #include <asm/cpufeature.h>
 #include <asm/page.h>
@@ -186,8 +185,68 @@ void __init asi_check_boottime_disable(void)
 		pr_info("ASI enablement ignored due to incomplete implementation.\n");
 }
 
+/*
+ * Map data by sharing sub-PGD pagetables with the unrestricted mapping. This is
+ * more efficient than asi_map, but only works when you know the whole top-level
+ * page needs to be mapped in the restricted tables. Note that the size of the
+ * mappings this creates differs between 4 and 5-level paging.
+ */
+static void asi_clone_pgd(pgd_t *dst_table, pgd_t *src_table, size_t addr)
+{
+	pgd_t *src = pgd_offset_pgd(src_table, addr);
+	pgd_t *dst = pgd_offset_pgd(dst_table, addr);
+
+	if (!pgd_val(*dst))
+		set_pgd(dst, *src);
+	else
+		WARN_ON_ONCE(pgd_val(*dst) != pgd_val(*src));
+}
+
+/*
+ * For 4-level paging this is exactly the same as asi_clone_pgd. For 5-level
+ * paging it clones one level lower. So this always creates a mapping of the
+ * same size.
+ */
+static void asi_clone_p4d(pgd_t *dst_table, pgd_t *src_table, size_t addr)
+{
+	pgd_t *src_pgd = pgd_offset_pgd(src_table, addr);
+	pgd_t *dst_pgd = pgd_offset_pgd(dst_table, addr);
+	p4d_t *src_p4d = p4d_alloc(&init_mm, src_pgd, addr);
+	p4d_t *dst_p4d = p4d_alloc(&init_mm, dst_pgd, addr);
+
+	if (!p4d_val(*dst_p4d))
+		set_p4d(dst_p4d, *src_p4d);
+	else
+		WARN_ON_ONCE(p4d_val(*dst_p4d) != p4d_val(*src_p4d));
+}
+
+/*
+ * percpu_addr is where the linker put the percpu variable. asi_map_percpu finds
+ * the place where the percpu allocator copied the data during boot.
+ *
+ * This is necessary even when the page allocator defaults to
+ * global-nonsensitive, because the percpu allocator uses the memblock allocator
+ * for early allocations.
+ */
+static int asi_map_percpu(struct asi *asi, void *percpu_addr, size_t len)
+{
+	int cpu, err;
+	void *ptr;
+
+	for_each_possible_cpu(cpu) {
+		ptr = per_cpu_ptr(percpu_addr, cpu);
+		err = asi_map(asi, ptr, len);
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
+
 static int __init asi_global_init(void)
 {
+	int err;
+
 	if (!boot_cpu_has(X86_FEATURE_ASI))
 		return 0;
 
@@ -207,6 +266,46 @@ static int __init asi_global_init(void)
 				  VMALLOC_START, VMALLOC_END,
 				  "ASI Global Non-sensitive vmalloc");
 
+	/* Map all kernel text and static data */
+	err = asi_map(ASI_GLOBAL_NONSENSITIVE, (void *)__START_KERNEL,
+		      (size_t)_end - __START_KERNEL);
+	if (WARN_ON(err))
+		return err;
+	err = asi_map(ASI_GLOBAL_NONSENSITIVE, (void *)FIXADDR_START,
+		      FIXADDR_SIZE);
+	if (WARN_ON(err))
+		return err;
+	/* Map all static percpu data */
+	err = asi_map_percpu(
+		ASI_GLOBAL_NONSENSITIVE,
+		__per_cpu_start, __per_cpu_end - __per_cpu_start);
+	if (WARN_ON(err))
+		return err;
+
+	/*
+	 * The next areas are mapped using shared sub-P4D paging structures
+	 * (asi_clone_p4d instead of asi_map), since we know the whole P4D will
+	 * be mapped.
+	 */
+	asi_clone_p4d(asi_global_nonsensitive_pgd, init_mm.pgd,
+		      CPU_ENTRY_AREA_BASE);
+#ifdef CONFIG_X86_ESPFIX64
+	asi_clone_p4d(asi_global_nonsensitive_pgd, init_mm.pgd,
+		      ESPFIX_BASE_ADDR);
+#endif
+	/*
+	 * The vmemmap area actually _must_ be cloned via shared paging
+	 * structures, since mappings can potentially change dynamically when
+	 * hugetlbfs pages are created or broken down.
+	 *
+	 * We always clone 2 PGDs, this is a corrolary of the sizes of struct
+	 * page, a page, and the physical address space.
+	 */
+	WARN_ON(sizeof(struct page) * MAXMEM / PAGE_SIZE != 2 * (1UL << PGDIR_SHIFT));
+	asi_clone_pgd(asi_global_nonsensitive_pgd, init_mm.pgd, VMEMMAP_START);
+	asi_clone_pgd(asi_global_nonsensitive_pgd, init_mm.pgd,
+		      VMEMMAP_START + (1UL << PGDIR_SHIFT));
+
 	return 0;
 }
 subsys_initcall(asi_global_init)
@@ -599,6 +698,10 @@ static bool follow_physaddr(
  * Map the given range into the ASI page tables. The source of the mapping is
  * the regular unrestricted page tables. Can be used to map any kernel memory.
  *
+ * In contrast to some internal ASI logic (asi_clone_pgd and asi_clone_p4d) this
+ * never shares pagetables between restricted and unrestricted address spaces,
+ * instead it creates wholly new equivalent mappings.
+ *
  * The caller MUST ensure that the source mapping will not change during this
  * function. For dynamic kernel memory, this is generally ensured by mapping the
  * memory within the allocator.
diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index eeadbaeccf88b73af40efe5221760a7cb37058d2..18f6c0448baf5dfbd0721ba9a6d89000fa86f061 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -1022,6 +1022,16 @@
 	COMMON_DISCARDS							\
 	}
 
+/*
+ * ASI maps certain sections with certain sensitivity levels, so they need to
+ * have a page-aligned size.
+ */
+#ifdef CONFIG_MITIGATION_ADDRESS_SPACE_ISOLATION
+#define ASI_ALIGN() ALIGN(PAGE_SIZE)
+#else
+#define ASI_ALIGN() .
+#endif
+
 /**
  * PERCPU_INPUT - the percpu input sections
  * @cacheline: cacheline size
@@ -1043,6 +1053,7 @@
 	*(.data..percpu)						\
 	*(.data..percpu..shared_aligned)				\
 	PERCPU_DECRYPTED_SECTION					\
+	. = ASI_ALIGN();						\
 	__per_cpu_end = .;
 
 /**

-- 
2.47.1.613.gc27f4b7a9f-goog


