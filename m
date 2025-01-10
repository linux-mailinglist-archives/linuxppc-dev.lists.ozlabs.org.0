Return-Path: <linuxppc-dev+bounces-5022-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 818E5A09F06
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jan 2025 01:11:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YVJpm2BXwz3bT8;
	Sat, 11 Jan 2025 11:11:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::34a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736534458;
	cv=none; b=UG6QpEf+57/qSf4umwhYjtmm5CV9D2qxibyRy02XpQPNWWXCWUB5OulYqpNuvwVYDcHXXWKywUvQpe71df9GnMLFUNOJ1dwT6KLd+MZZUjc/0SdzSyXFvfCpBZmWiw0WIoPqEhwlmnypaPByQ7cRpNUcI7EZGA1gbHCwpUgLze39xOcoh+xQl0lydYQG920HArkHcsDqlco3rmkUJuTXoHtZPKceWfjopKYuCV1pyYPppmfvojOgRYwNr0RpxFoZoyCohfiF4elZf/pbg1QWk7P47lqIczenGuLRFHHXBQlq7554gHL4Y+3TeCy9LtAGC7hPrvSAx4GEB/0Qy11PhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736534458; c=relaxed/relaxed;
	bh=lMV7uJ7I18OKYw8GMGFQsmzHxbOybRxQHWQLaqO2yfM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PePnHC65/n8o3FQC8yqtBXEwOgP/2jUV2AYbvdK9JqoQR9oP3O10dAJPxicA2QcStGUklllKisAXx4BqzNKeUw6WS+dlNC10a03nouEch7YA/idaxHpTs5+GgLjzIXEBi2+paM2+RJUHKqL2n6n4hR0rDYviPpWxOuC2HdgfqDLJ+AujH9mbWmb+i3jCnV5GVqR+OCOHkwTB5IvgFYJ0OB030Eed6zmdWrY+Lt09E/MduMfvhxymaCGYhvfxgaTCtkspiN42zqaWkJpWvaL6WHvELKANIpj3w9NbcchS1WXJclVxUr15CdZH6VMbgiCgah1UMMumQD2vwDF/CvcH/A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=KP/RIdoI; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::34a; helo=mail-wm1-x34a.google.com; envelope-from=3r2mbzwgkdmozqs02q3rw44w1u.s421y3ad55s-tub1y898.4f1qr8.47w@flex--jackmanb.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=KP/RIdoI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--jackmanb.bounces.google.com (client-ip=2a00:1450:4864:20::34a; helo=mail-wm1-x34a.google.com; envelope-from=3r2mbzwgkdmozqs02q3rw44w1u.s421y3ad55s-tub1y898.4f1qr8.47w@flex--jackmanb.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x34a.google.com (mail-wm1-x34a.google.com [IPv6:2a00:1450:4864:20::34a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YV9TN4xjJz3cYP
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jan 2025 05:40:55 +1100 (AEDT)
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-436289a570eso19444315e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2025 10:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736534448; x=1737139248; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lMV7uJ7I18OKYw8GMGFQsmzHxbOybRxQHWQLaqO2yfM=;
        b=KP/RIdoIM8dUnXcvJLao2zTmYMqNS49i4AgpP6lv+aETAzkTsArMIzI/NuMFWOAWYK
         qgzUMV10zwavNosCNEBUVxAOOp2vNfjlHc6rTkb6Q4/h8sIJb9kOsjtRfybqI+7K90b7
         Ze0bxWEDkJ7wozpfEcTT3QhEcRH5vB27OZLsm3EAQOMKe1IGYGloc4YoRrSL9QWNWJ4O
         AK23Unn0G6SbM4n+EEVEYGhFOMdj9dklJhiFWiEiOtvbr+IqoiJjwrSMpoCRjKhMmE7C
         2NREoXSbhNRTny2twy254uLyX1sGKJKrfNO1DZ6XKrPLOyV80qRWPpuo0yH+rJwXIxqB
         S6xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736534448; x=1737139248;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lMV7uJ7I18OKYw8GMGFQsmzHxbOybRxQHWQLaqO2yfM=;
        b=VqD/8h1k9JJdjFPLBnV9IP7ocJVvAKlLNXhd3fKRe0aHhI6fBEeiuEe/815kXLBRfp
         wKB+VySpcm8jhZrql/ehPpFDWOEIL9BQndEbBqkfrhC3ipQAL1GIjuVVmnDIy2kxnwns
         dATYYfPgjZ/30Oc08SAiEFEJHTsZuXT1AVPPDGCme2vi8nFffVe82Gwbox7Bm5S+0y7c
         fDFs/sQ4Dgk7fAnVbN5At3xXB0q4PuGiPEDAH3htLNAy29Phlk63FNKWj8fyPaMVoBTf
         5En5xKOC3ql7MAg8CtOcfpxo7RC7fe0nU8E3dHYVYBJPF9Wbv91worN3BGXcpz+1EH+d
         hskA==
X-Forwarded-Encrypted: i=1; AJvYcCWckaKWDvoxsMZ2Kjq2htr0xWvxD3jF6Bt3VtNPyjG4acae3hMeCuEsjwTXYoDHl9chQuWKAqgcZicuwxc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwN4EA1aCigCadZJgOD4nYFbBUwgaLxJt77fvbhSUINUnvwAMCA
	yvX+LFCl7JQcUBNfWaWtswwt2ng19J5JCFNrAd2pUHrz1ptB/HqAHF/Fi8B6c4sq8tyFKjVQhd/
	Mkggln2PMHQ==
X-Google-Smtp-Source: AGHT+IFp39E9krgcILEXjwgS0eG/yaDAJpZCMdfJgN+pTbMyBclx0Pttf9qnW8OHp1hJ5TpOh65GX4riAPR9zA==
X-Received: from wmbbd12.prod.google.com ([2002:a05:600c:1f0c:b0:434:fd41:173c])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1d03:b0:434:a781:f5d9 with SMTP id 5b1f17b1804b1-436e2697b32mr62972955e9.11.1736534447848;
 Fri, 10 Jan 2025 10:40:47 -0800 (PST)
Date: Fri, 10 Jan 2025 18:40:27 +0000
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
Message-ID: <20250110-asi-rfc-v2-v2-1-8419288bc805@google.com>
Subject: [PATCH RFC v2 01/29] mm: asi: Make some utility functions noinstr compatible
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

Some existing utility functions would need to be called from a noinstr
context in the later patches. So mark these as either noinstr or
__always_inline.

An earlier version of this by Junaid had a macro that was intended to
tell the compiler "either inline this function, or call it in the
noinstr section", which basically boiled down to:

 #define inline_or_noinstr noinline __section(".noinstr.text")

Unfortunately Thomas pointed out this will prevent the function from
being inlined at call sites in .text.

So far I haven't been able[1] to find a formulation that lets us :
1. avoid calls from .noinstr.text -> .text,
2. while also letting the compiler freely decide what to inline.

1 is a functional requirement so here I'm just giving up on 2. Existing
callsites of this code are just forced inline. For the incoming code
that needs to call it from noinstr, they will be out-of-line calls.

[1] https://lore.kernel.org/lkml/CA+i-1C1z35M8wA_4AwMq7--c1OgjNoLGTkn4+Td5gKg7QQAzWw@mail.gmail.com/

Checkpatch-args: --ignore=COMMIT_LOG_LONG_LINE
Signed-off-by: Brendan Jackman <jackmanb@google.com>
---
 arch/x86/include/asm/processor.h     |  2 +-
 arch/x86/include/asm/special_insns.h |  8 ++++----
 arch/x86/include/asm/tlbflush.h      |  3 +++
 arch/x86/mm/tlb.c                    | 13 +++++++++----
 4 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/arch/x86/include/asm/processor.h b/arch/x86/include/asm/processor.h
index 4a686f0e5dbf6d906ed38276148b186e920927b3..1a1b7ea5d7d32a47d783d9d62cd2a53672addd6f 100644
--- a/arch/x86/include/asm/processor.h
+++ b/arch/x86/include/asm/processor.h
@@ -220,7 +220,7 @@ void print_cpu_msr(struct cpuinfo_x86 *);
 /*
  * Friendlier CR3 helpers.
  */
-static inline unsigned long read_cr3_pa(void)
+static __always_inline unsigned long read_cr3_pa(void)
 {
 	return __read_cr3() & CR3_ADDR_MASK;
 }
diff --git a/arch/x86/include/asm/special_insns.h b/arch/x86/include/asm/special_insns.h
index aec6e2d3aa1d52e5c8f513e188015a45e9eeaeb2..6e103358966f6f1333aa07be97aec5f8af794120 100644
--- a/arch/x86/include/asm/special_insns.h
+++ b/arch/x86/include/asm/special_insns.h
@@ -42,14 +42,14 @@ static __always_inline void native_write_cr2(unsigned long val)
 	asm volatile("mov %0,%%cr2": : "r" (val) : "memory");
 }
 
-static inline unsigned long __native_read_cr3(void)
+static __always_inline unsigned long __native_read_cr3(void)
 {
 	unsigned long val;
 	asm volatile("mov %%cr3,%0\n\t" : "=r" (val) : __FORCE_ORDER);
 	return val;
 }
 
-static inline void native_write_cr3(unsigned long val)
+static __always_inline void native_write_cr3(unsigned long val)
 {
 	asm volatile("mov %0,%%cr3": : "r" (val) : "memory");
 }
@@ -153,12 +153,12 @@ static __always_inline void write_cr2(unsigned long x)
  * Careful!  CR3 contains more than just an address.  You probably want
  * read_cr3_pa() instead.
  */
-static inline unsigned long __read_cr3(void)
+static __always_inline unsigned long __read_cr3(void)
 {
 	return __native_read_cr3();
 }
 
-static inline void write_cr3(unsigned long x)
+static __always_inline void write_cr3(unsigned long x)
 {
 	native_write_cr3(x);
 }
diff --git a/arch/x86/include/asm/tlbflush.h b/arch/x86/include/asm/tlbflush.h
index 69e79fff41b800a0a138bcbf548dde9d72993105..c884174a44e119a3c027c44ada6c5cdba14d1282 100644
--- a/arch/x86/include/asm/tlbflush.h
+++ b/arch/x86/include/asm/tlbflush.h
@@ -423,4 +423,7 @@ static inline void __native_tlb_flush_global(unsigned long cr4)
 	native_write_cr4(cr4 ^ X86_CR4_PGE);
 	native_write_cr4(cr4);
 }
+
+unsigned long build_cr3_noinstr(pgd_t *pgd, u16 asid, unsigned long lam);
+
 #endif /* _ASM_X86_TLBFLUSH_H */
diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
index 86593d1b787d8a5b9fa4bd492356898ec8870938..f0428e5e1f1947903ee87c4c6444844ee11b45c3 100644
--- a/arch/x86/mm/tlb.c
+++ b/arch/x86/mm/tlb.c
@@ -108,7 +108,7 @@
 /*
  * Given @asid, compute kPCID
  */
-static inline u16 kern_pcid(u16 asid)
+static __always_inline u16 kern_pcid(u16 asid)
 {
 	VM_WARN_ON_ONCE(asid > MAX_ASID_AVAILABLE);
 
@@ -153,9 +153,9 @@ static inline u16 user_pcid(u16 asid)
 	return ret;
 }
 
-static inline unsigned long build_cr3(pgd_t *pgd, u16 asid, unsigned long lam)
+static __always_inline unsigned long build_cr3(pgd_t *pgd, u16 asid, unsigned long lam)
 {
-	unsigned long cr3 = __sme_pa(pgd) | lam;
+	unsigned long cr3 = __sme_pa_nodebug(pgd) | lam;
 
 	if (static_cpu_has(X86_FEATURE_PCID)) {
 		cr3 |= kern_pcid(asid);
@@ -166,6 +166,11 @@ static inline unsigned long build_cr3(pgd_t *pgd, u16 asid, unsigned long lam)
 	return cr3;
 }
 
+noinstr unsigned long build_cr3_noinstr(pgd_t *pgd, u16 asid, unsigned long lam)
+{
+	return build_cr3(pgd, asid, lam);
+}
+
 static inline unsigned long build_cr3_noflush(pgd_t *pgd, u16 asid,
 					      unsigned long lam)
 {
@@ -1084,7 +1089,7 @@ void flush_tlb_kernel_range(unsigned long start, unsigned long end)
  * It's intended to be used for code like KVM that sneakily changes CR3
  * and needs to restore it.  It needs to be used very carefully.
  */
-unsigned long __get_current_cr3_fast(void)
+noinstr unsigned long __get_current_cr3_fast(void)
 {
 	unsigned long cr3 =
 		build_cr3(this_cpu_read(cpu_tlbstate.loaded_mm)->pgd,

-- 
2.47.1.613.gc27f4b7a9f-goog


