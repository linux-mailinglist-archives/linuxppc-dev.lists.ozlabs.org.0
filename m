Return-Path: <linuxppc-dev+bounces-5027-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8E0A09F0B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jan 2025 01:12:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YVJqh5P61z3cfy;
	Sat, 11 Jan 2025 11:12:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::349"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736534462;
	cv=none; b=MwT3kDhlMQoyLNP8CQcQfNKzJzVlWYLi5aypudtkK2QfzR1/OhowL4g9ajen3HLV5hxYUYgWJoIRHdxD0v3u0ZqyBGPuA/hlA/d1GNJPnM5v+n6/A6Y3/8XZrKurNhMI23wSoRdi1p0DEuepiOP4//zEzis8QErmuqbNMMPjfO4UsIkDciYTesUuQxAzP2QEOo9enLmTr9vZJR0EqdBteK3uIUfRP/0ryYof16yArd1NSsMwBt/M7Vacw9uKN4E11V7xH10dh6QAEtwTCHRv6IUrHh9z9dGG7sq2sleT6/O6ETenyHTBiGTWsxdVEoY6LxCSbkApXnnCJQR67ODFIg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736534462; c=relaxed/relaxed;
	bh=kYL7XeCfcudeBLlUDEGoh0o6eIbGWBwJtwhvHOdo8c0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=kfv2fWRhIv9ghFZbq2U/ZXuHGNxrQDqx73LYKr1KScWIa82UKxiwIAQVzX4W2j2ynj3jlspiVxC5ejCLZw4nf/3GNvvbc5k3daCcLzv9n68T9Jb1KhOIJS3m7TM24jXKURuIwxUckksTxmtfHEYRMJIsqX0dvatG1E+ojcwoadaP0CwEcDh9G38kAWF8IeQvbq0kPidzXoXV3cakKaizfJ0kILq/3LltlVJSKWLtGPUfAglNnxRoyH8awmIav3JYKUxf6daYoAhJlBPVrK+P2o1m/I/+9Qzg2IsXKaXD1n6Dp343EHz8BMLhg9Nd20Y0EopJHm6BKkPJY3p18kVQCA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=JT394fAU; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::349; helo=mail-wm1-x349.google.com; envelope-from=3u2mbzwgkdnyb24ce2f38gg8d6.4gedafmphh4-56ndaklk.grd23k.gj8@flex--jackmanb.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=JT394fAU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--jackmanb.bounces.google.com (client-ip=2a00:1450:4864:20::349; helo=mail-wm1-x349.google.com; envelope-from=3u2mbzwgkdnyb24ce2f38gg8d6.4gedafmphh4-56ndaklk.grd23k.gj8@flex--jackmanb.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x349.google.com (mail-wm1-x349.google.com [IPv6:2a00:1450:4864:20::349])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YV9TT6zdBz3cb8
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jan 2025 05:41:01 +1100 (AEDT)
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4361b090d23so12504965e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2025 10:41:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736534459; x=1737139259; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kYL7XeCfcudeBLlUDEGoh0o6eIbGWBwJtwhvHOdo8c0=;
        b=JT394fAUHoOMvyONTM1LVdKllqhk+2rMJe+4NpF43145IVEWZ8oCUOoitLrqgMfSjb
         kkj4gmz2bNOGlkcT1vR9bwTF1GkwCBMI5Kg3QEaSNS9FmJ91XE8fMUUoLR51mjEXFQT4
         5KgnFsev8tEn1XfO1+Ka71UEx9bLfvo2HSGWh7ZUoIjgnGvEGh4zfZirbPKd2SDJDQCm
         Jw9j9XaI6dfDltQLBRnFqh9suBi5tgDTayHMmMRPG0mbbtX9UJHURYAi02FnInS1yFLZ
         Oauwj6PHEqiFvnN9WZVwUBVTDMGmz98LczIsZ8tKf5cs+B2fsj+cDUuhs5x7Eh6Uxy86
         iVEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736534459; x=1737139259;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kYL7XeCfcudeBLlUDEGoh0o6eIbGWBwJtwhvHOdo8c0=;
        b=vxaCnH0AQN2YCwnpuyZz7dRd+7k9DTG8tJ/n8f9qs6m93wKPUoUp6DJrsOWioKCT6O
         Fi6B4Q9sRaudbtEIM+lngZrn0uY8atky0DoqPweQzoXW4jr13+8aSKQ4nIIBGpOthHZW
         XPemqTxPV3NFYuF/fRqZtrAsg0DkQEsWRyTYmsZaGKhwI4f+sRPi2TGKuR0HZNeK+O28
         mS+40mjgPTQuCn8TpE7A31vFZrBCSQ3AsKoZ/ku0gPUDtQmdDNQ1QWptmMRrFzC3SqfE
         c6tskcphh35iJR8ae+4PHOR/TiSyY5ptdUVYeyXpzmeCgXWWQmjpAmCkdkX1v0MUsJ6Q
         UIhg==
X-Forwarded-Encrypted: i=1; AJvYcCUsdvma4ruUi+Gd/wF+7bwTPvxKHWl5ZIhHaKiYOcx/Fmb8vowdI2ylABsJugeLNerW25fk/eoImrhUhD8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyzVnqLPkm1+FLMr9OnpIuGFVhtemS/Hcvf+5m1g4nHhx6a+N/W
	oKxd4dJhxUG9JytbIiIUY6X19KrO0xyECvRlU/JOkD5m7NX+02/5luepGBq0OSLBdlcOz3Ub3cs
	ltiTv87oKMQ==
X-Google-Smtp-Source: AGHT+IH0DyTQGUBeXAkb8pkdNHIPyF1JMCOQ9V4x2A26uY/IXi2bUp3/F2mGP9HMTIoPxxyBiM7AkavMfpYEag==
X-Received: from wmdn10.prod.google.com ([2002:a05:600c:294a:b0:436:d819:e4eb])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4f09:b0:434:fafe:edb with SMTP id 5b1f17b1804b1-436e26f00fdmr96576145e9.24.1736534459144;
 Fri, 10 Jan 2025 10:40:59 -0800 (PST)
Date: Fri, 10 Jan 2025 18:40:32 +0000
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
Message-ID: <20250110-asi-rfc-v2-v2-6-8419288bc805@google.com>
Subject: [PATCH RFC v2 06/29] mm: asi: Use separate PCIDs for restricted
 address spaces
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
	Brendan Jackman <jackmanb@google.com>, Yosry Ahmed <yosryahmed@google.com>, 
	Junaid Shahid <junaids@google.com>
Content-Type: text/plain; charset="utf-8"
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Yosry Ahmed <yosryahmed@google.com>

Each restricted address space is assigned a separate PCID. Since
currently only one ASI instance per-class exists for a given process,
the PCID is just derived from the class index.

This commit only sets the appropriate PCID when switching CR3, but does
not actually use the NOFLUSH bit. That will be done by later patches.

Co-developed-by: Junaid Shahid <junaids@google.com>
Signed-off-by: Junaid Shahid <junaids@google.com>
Signed-off-by: Yosry Ahmed <yosryahmed@google.com>
Signed-off-by: Brendan Jackman <jackmanb@google.com>
---
 arch/x86/include/asm/asi.h             |  4 +--
 arch/x86/include/asm/processor-flags.h | 24 +++++++++++++++++
 arch/x86/include/asm/tlbflush.h        |  3 +++
 arch/x86/mm/asi.c                      | 10 +++----
 arch/x86/mm/tlb.c                      | 49 +++++++++++++++++++++++++++++++---
 include/asm-generic/asi.h              |  2 ++
 6 files changed, 81 insertions(+), 11 deletions(-)

diff --git a/arch/x86/include/asm/asi.h b/arch/x86/include/asm/asi.h
index 9a9a139518289fc65f26a4d1cd311aa52cc5357f..a55e73f1b2bc84c41b9ab25f642a4d5f1aa6ba90 100644
--- a/arch/x86/include/asm/asi.h
+++ b/arch/x86/include/asm/asi.h
@@ -4,13 +4,13 @@
 
 #include <linux/sched.h>
 
-#include <asm-generic/asi.h>
-
 #include <asm/pgtable_types.h>
 #include <asm/percpu.h>
 #include <asm/cpufeature.h>
 #include <asm/processor.h>
 
+#include <asm-generic/asi.h>
+
 #ifdef CONFIG_MITIGATION_ADDRESS_SPACE_ISOLATION
 
 /*
diff --git a/arch/x86/include/asm/processor-flags.h b/arch/x86/include/asm/processor-flags.h
index e5f204b9b33dfaa92ed1b05faa6b604e50d5f2f3..42c5acb67c2d2a6b03deb548fe3dd088baa88842 100644
--- a/arch/x86/include/asm/processor-flags.h
+++ b/arch/x86/include/asm/processor-flags.h
@@ -55,4 +55,28 @@
 # define X86_CR3_PTI_PCID_USER_BIT	11
 #endif
 
+/*
+ * An ASI identifier is included in the higher bits of PCID to use a different
+ * PCID for each restricted address space, different from the PCID of the
+ * unrestricted address space (see asi_pcid()). We use the bits directly after
+ * the bit used by PTI (if any).
+ */
+#ifdef CONFIG_MITIGATION_ADDRESS_SPACE_ISOLATION
+
+#define X86_CR3_ASI_PCID_BITS 2
+
+/* Use the highest available PCID bits after the PTI bit (if any) */
+#ifdef CONFIG_MITIGATION_PAGE_TABLE_ISOLATION
+#define X86_CR3_ASI_PCID_END_BIT (X86_CR3_PTI_PCID_USER_BIT - 1)
+#else
+#define X86_CR3_ASI_PCID_END_BIT (X86_CR3_PCID_BITS - 1)
+#endif
+
+#define X86_CR3_ASI_PCID_BITS_SHIFT (X86_CR3_ASI_PCID_END_BIT - X86_CR3_ASI_PCID_BITS + 1)
+#define X86_CR3_ASI_PCID_MASK (((1UL << X86_CR3_ASI_PCID_BITS) - 1) << X86_CR3_ASI_PCID_BITS_SHIFT)
+
+#else
+#define X86_CR3_ASI_PCID_BITS 0
+#endif
+
 #endif /* _ASM_X86_PROCESSOR_FLAGS_H */
diff --git a/arch/x86/include/asm/tlbflush.h b/arch/x86/include/asm/tlbflush.h
index c884174a44e119a3c027c44ada6c5cdba14d1282..f167feb5ebdfc7faba26b8b18ac65888cd9b0494 100644
--- a/arch/x86/include/asm/tlbflush.h
+++ b/arch/x86/include/asm/tlbflush.h
@@ -425,5 +425,8 @@ static inline void __native_tlb_flush_global(unsigned long cr4)
 }
 
 unsigned long build_cr3_noinstr(pgd_t *pgd, u16 asid, unsigned long lam);
+unsigned long build_cr3_pcid_noinstr(pgd_t *pgd, u16 pcid, unsigned long lam, bool noflush);
+
+u16 asi_pcid(struct asi *asi, u16 asid);
 
 #endif /* _ASM_X86_TLBFLUSH_H */
diff --git a/arch/x86/mm/asi.c b/arch/x86/mm/asi.c
index 054315d566c082c0925a00ce3a0877624c8b9957..8d060c633be68b508847e2c1c111761df1da92af 100644
--- a/arch/x86/mm/asi.c
+++ b/arch/x86/mm/asi.c
@@ -238,6 +238,7 @@ static __always_inline void maybe_flush_data(struct asi *next_asi)
 noinstr void __asi_enter(void)
 {
 	u64 asi_cr3;
+	u16 pcid;
 	struct asi *target = asi_get_target(current);
 
 	/*
@@ -266,9 +267,8 @@ noinstr void __asi_enter(void)
 	this_cpu_write(curr_asi, target);
 	maybe_flush_control(target);
 
-	asi_cr3 = build_cr3_noinstr(target->pgd,
-				    this_cpu_read(cpu_tlbstate.loaded_mm_asid),
-				    tlbstate_lam_cr3_mask());
+	pcid = asi_pcid(target, this_cpu_read(cpu_tlbstate.loaded_mm_asid));
+	asi_cr3 = build_cr3_pcid_noinstr(target->pgd, pcid, tlbstate_lam_cr3_mask(), false);
 	write_cr3(asi_cr3);
 
 	maybe_flush_data(target);
@@ -335,8 +335,8 @@ noinstr void asi_exit(void)
 
 		unrestricted_cr3 =
 			build_cr3_noinstr(this_cpu_read(cpu_tlbstate.loaded_mm)->pgd,
-					  this_cpu_read(cpu_tlbstate.loaded_mm_asid),
-					  tlbstate_lam_cr3_mask());
+					 this_cpu_read(cpu_tlbstate.loaded_mm_asid),
+					 tlbstate_lam_cr3_mask());
 
 		/* Tainting first makes reentrancy easier to reason about.  */
 		this_cpu_or(asi_taints, ASI_TAINT_KERNEL_DATA);
diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
index 7c2309996d1d5a7cac23bd122f7b56a869d67d6a..2601beed83aef182d88800c09d70e4c5e95e7ed0 100644
--- a/arch/x86/mm/tlb.c
+++ b/arch/x86/mm/tlb.c
@@ -13,6 +13,7 @@
 #include <linux/mmu_notifier.h>
 #include <linux/mmu_context.h>
 
+#include <asm/processor-flags.h>
 #include <asm/tlbflush.h>
 #include <asm/mmu_context.h>
 #include <asm/nospec-branch.h>
@@ -96,7 +97,10 @@
 # define PTI_CONSUMED_PCID_BITS	0
 #endif
 
-#define CR3_AVAIL_PCID_BITS (X86_CR3_PCID_BITS - PTI_CONSUMED_PCID_BITS)
+#define CR3_AVAIL_PCID_BITS (X86_CR3_PCID_BITS - PTI_CONSUMED_PCID_BITS - \
+			     X86_CR3_ASI_PCID_BITS)
+
+static_assert(BIT(CR3_AVAIL_PCID_BITS) > TLB_NR_DYN_ASIDS);
 
 /*
  * ASIDs are zero-based: 0->MAX_AVAIL_ASID are valid.  -1 below to account
@@ -125,6 +129,11 @@ static __always_inline u16 kern_pcid(u16 asid)
 	 */
 	VM_WARN_ON_ONCE(asid & (1 << X86_CR3_PTI_PCID_USER_BIT));
 #endif
+
+#ifdef CONFIG_MITIGATION_ADDRESS_SPACE_ISOLATION
+	BUILD_BUG_ON(TLB_NR_DYN_ASIDS >= (1 << X86_CR3_ASI_PCID_BITS_SHIFT));
+	VM_WARN_ON_ONCE(asid & X86_CR3_ASI_PCID_MASK);
+#endif
 	/*
 	 * The dynamically-assigned ASIDs that get passed in are small
 	 * (<TLB_NR_DYN_ASIDS).  They never have the high switch bit set,
@@ -153,17 +162,22 @@ static inline u16 user_pcid(u16 asid)
 	return ret;
 }
 
+static __always_inline unsigned long __build_cr3(pgd_t *pgd, u16 pcid, unsigned long lam)
+{
+	return __sme_pa_nodebug(pgd) | pcid | lam;
+}
+
 static __always_inline unsigned long build_cr3(pgd_t *pgd, u16 asid, unsigned long lam)
 {
-	unsigned long cr3 = __sme_pa_nodebug(pgd) | lam;
+	u16 pcid = 0;
 
 	if (static_cpu_has(X86_FEATURE_PCID)) {
-		cr3 |= kern_pcid(asid);
+		pcid = kern_pcid(asid);
 	} else {
 		VM_WARN_ON_ONCE(asid != 0);
 	}
 
-	return cr3;
+	return __build_cr3(pgd, pcid, lam);
 }
 
 noinstr unsigned long build_cr3_noinstr(pgd_t *pgd, u16 asid, unsigned long lam)
@@ -183,6 +197,19 @@ static inline unsigned long build_cr3_noflush(pgd_t *pgd, u16 asid,
 	return build_cr3(pgd, asid, lam) | CR3_NOFLUSH;
 }
 
+noinstr unsigned long build_cr3_pcid_noinstr(pgd_t *pgd, u16 pcid,
+					     unsigned long lam, bool noflush)
+{
+	u64 noflush_bit = 0;
+
+	if (!static_cpu_has(X86_FEATURE_PCID))
+		pcid = 0;
+	else if (noflush)
+		noflush_bit = CR3_NOFLUSH;
+
+	return __build_cr3(pgd, pcid, lam) | noflush_bit;
+}
+
 /*
  * We get here when we do something requiring a TLB invalidation
  * but could not go invalidate all of the contexts.  We do the
@@ -998,6 +1025,20 @@ static void put_flush_tlb_info(void)
 #endif
 }
 
+#ifdef CONFIG_MITIGATION_ADDRESS_SPACE_ISOLATION
+
+noinstr u16 asi_pcid(struct asi *asi, u16 asid)
+{
+	return kern_pcid(asid) | ((asi->class_id + 1) << X86_CR3_ASI_PCID_BITS_SHIFT);
+	// return kern_pcid(asid) | ((asi->index + 1) << X86_CR3_ASI_PCID_BITS_SHIFT);
+}
+
+#else /* CONFIG_MITIGATION_ADDRESS_SPACE_ISOLATION */
+
+u16 asi_pcid(struct asi *asi, u16 asid) { return kern_pcid(asid); }
+
+#endif /* CONFIG_MITIGATION_ADDRESS_SPACE_ISOLATION */
+
 void flush_tlb_mm_range(struct mm_struct *mm, unsigned long start,
 				unsigned long end, unsigned int stride_shift,
 				bool freed_tables)
diff --git a/include/asm-generic/asi.h b/include/asm-generic/asi.h
index 7f542c59c2b8a2b74432e4edb7199f9171db8a84..f777a6cf604b0656fb39087f6eba08f980b2cb6f 100644
--- a/include/asm-generic/asi.h
+++ b/include/asm-generic/asi.h
@@ -2,6 +2,7 @@
 #ifndef __ASM_GENERIC_ASI_H
 #define __ASM_GENERIC_ASI_H
 
+#include <linux/log2.h>
 #include <linux/types.h>
 
 #ifndef _ASSEMBLY_
@@ -16,6 +17,7 @@ enum asi_class_id {
 #endif
 	ASI_MAX_NUM_CLASSES,
 };
+static_assert(order_base_2(X86_CR3_ASI_PCID_BITS) <= ASI_MAX_NUM_CLASSES);
 
 typedef u8 asi_taints_t;
 

-- 
2.47.1.613.gc27f4b7a9f-goog


