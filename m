Return-Path: <linuxppc-dev+bounces-5036-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DB72EA09F19
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jan 2025 01:14:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YVJsv4N91z3clf;
	Sat, 11 Jan 2025 11:14:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::449"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736534483;
	cv=none; b=ZZbJi+z4HpzP5MzQFSJiefJHKgg1zFGVA6NimxXO9+cI0Xe+l3na/Hd9SSYBIcNHOvCKg0ZjF4ggNHgx52RZd3ighRKgwlLDSYF5+QF6TMv2vQ+daztSg1SYYGEHD9WdVrOvpj5l/Pql1VOSqteKgl4G7vD0mFLGmmF6GZlLvNe2oq6YBawNfG1dFrjzXPncV8H4xCWIISP0Pv+2xXd9n/RslxWV3DnBgIC9dgs/5lQi7bSfpT3d76BK7VMHgwkIDA6LGsYjmUgQT5twfNDPJGEnFVvciHy2uDK8qilqcDjIp09q+dltDVCpHk7GmJGY/J5uMKRrO0VXP9H/ay/Pqg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736534483; c=relaxed/relaxed;
	bh=Aw/CnxStV8mvixiIOCl4TLOf7+c8cjSAdFrfDhkuuHg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=kjD9bwwYiLt0tlYxht8W9CsQbPH+zzuMhbb5SPDxPuN7WBQqFlxNJLWoh0F11YseHuu7IR5QKPscR1ZRemIAMQ9nzINhdBrtVkANTNgnMqlu2WsMqtxlMGt/aCkAjNXiJaMc9IDuAPorngvTITAU0qn0RzEgMXSyBa3QHpPMlPmZmhz0jIgl1r/bM8QLFhvUOPuaqs/EC0e/3k+rSC3VFrkvyg4D6ZBKzObTiD377PZGFNixewr2oVoyTxYSZMv56Wxiuh3F0xH3DVHlEX3jVg/1dKDQ8Hje8X5qX9SfTLmpVOBLDz/y9IE1bCEea3aYK8FD5xS2U2rLxyv0YSN0wQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=FkjYYZVK; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::449; helo=mail-wr1-x449.google.com; envelope-from=3z2mbzwgkdoovmowymznsaasxq.oayxuzgjbbo-pqhxuefe.alxmne.ads@flex--jackmanb.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=FkjYYZVK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--jackmanb.bounces.google.com (client-ip=2a00:1450:4864:20::449; helo=mail-wr1-x449.google.com; envelope-from=3z2mbzwgkdoovmowymznsaasxq.oayxuzgjbbo-pqhxuefe.alxmne.ads@flex--jackmanb.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x449.google.com (mail-wr1-x449.google.com [IPv6:2a00:1450:4864:20::449])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YV9Tt3n5lz3cYR
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jan 2025 05:41:22 +1100 (AEDT)
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-385ed79291eso1665594f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2025 10:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736534480; x=1737139280; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Aw/CnxStV8mvixiIOCl4TLOf7+c8cjSAdFrfDhkuuHg=;
        b=FkjYYZVKcWdvRs4KgthAePd1M5ZBSvwdLpPGrUlBYs4qm9fT2dfxaBOZzU2on6fbt5
         FZzs8nFbu4QPUHMsKS1PsSut1dLKJL6QxQAwRKQZnRZs5q6PinSXHPUlJy7kCgofsX4V
         qno8A/DDc0oHWR6lW70T9NIQylYzymJShjMB6sJd8GNG8825HCT2Cto7Z0DrDisbwQVL
         HJHGFgSLJtamWMxSEcLo2AYvpNkDh7OiC5MPIHypuifA+qyKCqV8dpksklY+K7cQzzsB
         Ozjx74y+JEhaAqhbpCEzKsrq86JapsCbtFyPirO3FeixB0zoPfT223PY0PGZ/XeoaO5P
         ERqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736534480; x=1737139280;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Aw/CnxStV8mvixiIOCl4TLOf7+c8cjSAdFrfDhkuuHg=;
        b=PRhBu9PfRe9ZRQ4dk1AiUqaqb8FmC4/TnG2JJ2S7DEkgbkPthmvYOTIDP5FMfridrY
         VQWr8IgtL4kntoevWvjYJB2ZmfqJ8VZ4Al+qYbuVg6UyU8HRwOzR8JuvNVDzHl8zGNKi
         wzgug5pdSddTYKs+i02juRCiOFvD6FQT8RdYfkSJv4pySt6wqbRiffox/qvGJ86pK0at
         nnmh9uq10+GHWlGjdjsvwSNdxp9p3dOSNR0pMUfZYdtaxkQ9SUPXqsFxt7FrHCwuOtnc
         aOOdKjXUoiPLzHMy9zV8tWDHXHfJYKQeJWB6nSH9CSfw0pD9hhJZufjkZ+Gh5UtMX61u
         Hv4g==
X-Forwarded-Encrypted: i=1; AJvYcCV+aha8t6knXzq2iE57jxw8DhcSkw97xj6iY78Do7b1VKxFI+vC5rIDW+wqnxAXT1AHuskUKd2AblMOgxo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz1qKUhAWtc+2V/bxFPIsa40bNabN/NL76Stp28GEsxzuI5uzTt
	fSvWjVrt7Ulrme834ckKJ3BUDNhqi4kfaPd55iVCZsX6eECxiUDI6FTeaggjacDsqZACqsVQpNq
	UddooHPV76w==
X-Google-Smtp-Source: AGHT+IEfIL+1aAzwB4pbtK9eyCgzXtWnxn8Tg5skOTY2l9Jdg/lcArfVr7lNF3vncmrBkENqt6o7go6KThD7+Q==
X-Received: from wmqe1.prod.google.com ([2002:a05:600c:4e41:b0:434:a050:ddcf])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:1547:b0:386:34af:9bae with SMTP id ffacd0b85a97d-38a8b0b7fd0mr6975597f8f.4.1736534479521;
 Fri, 10 Jan 2025 10:41:19 -0800 (PST)
Date: Fri, 10 Jan 2025 18:40:41 +0000
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
Message-ID: <20250110-asi-rfc-v2-v2-15-8419288bc805@google.com>
Subject: [PATCH TEMP WORKAROUND RFC v2 15/29] mm: asi: Workaround missing
 partial-unmap support
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

This is a hack, no need to review it carefully. asi_unmap() doesn't
currently work unless it corresponds exactly to an asi_map() of the
exact same region.

This is mostly harmless (it's only a functional problem if you wanna
touch those pages from the ASI critical section) but it's messy. For
now, working around the only practical case that appears by moving the
asi_map call up the call stack in the page allocator, to the place where
we know the actual size the mapping is supposed to end up at.

This just removes the main case where that happens. Later, a proper
solution for partial unmaps will be needed.

Signed-off-by: Brendan Jackman <jackmanb@google.com>
---
 mm/page_alloc.c | 40 ++++++++++++++++++++++++++--------------
 1 file changed, 26 insertions(+), 14 deletions(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 3e98fdfbadddb1f7d71e9e050b63255b2008d167..f96e95032450be90b6567f67915b0b941fc431d8 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -4604,22 +4604,20 @@ void __init page_alloc_init_asi(void)
 	}
 }
 
-static int asi_map_alloced_pages(struct page *page, uint order, gfp_t gfp_mask)
+static int asi_map_alloced_pages(struct page *page, size_t size, gfp_t gfp_mask)
 {
 
 	if (!static_asi_enabled())
 		return 0;
 
 	if (!(gfp_mask & __GFP_SENSITIVE)) {
-		int err = asi_map_gfp(
-			ASI_GLOBAL_NONSENSITIVE, page_to_virt(page),
-			PAGE_SIZE * (1 << order), gfp_mask);
+		int err = asi_map_gfp(ASI_GLOBAL_NONSENSITIVE, page_to_virt(page), size, gfp_mask);
 		uint i;
 
 		if (err)
 			return err;
 
-		for (i = 0; i < (1 << order); i++)
+		for (i = 0; i < (size >> PAGE_SHIFT); i++)
 			__SetPageGlobalNonSensitive(page + i);
 	}
 
@@ -4629,7 +4627,7 @@ static int asi_map_alloced_pages(struct page *page, uint order, gfp_t gfp_mask)
 #else /* CONFIG_MITIGATION_ADDRESS_SPACE_ISOLATION */
 
 static inline
-int asi_map_alloced_pages(struct page *pages, uint order, gfp_t gfp_mask)
+int asi_map_alloced_pages(struct page *pages, size_t size, gfp_t gfp_mask)
 {
 	return 0;
 }
@@ -4896,7 +4894,7 @@ struct page *__alloc_pages_noprof(gfp_t gfp, unsigned int order,
 	trace_mm_page_alloc(page, order, alloc_gfp, ac.migratetype);
 	kmsan_alloc_page(page, order, alloc_gfp);
 
-	if (page && unlikely(asi_map_alloced_pages(page, order, gfp))) {
+	if (page && unlikely(asi_map_alloced_pages(page, PAGE_SIZE << order, gfp))) {
 		__free_pages(page, order);
 		page = NULL;
 	}
@@ -5118,12 +5116,13 @@ void page_frag_free(void *addr)
 }
 EXPORT_SYMBOL(page_frag_free);
 
-static void *make_alloc_exact(unsigned long addr, unsigned int order,
-		size_t size)
+static void *finish_exact_alloc(unsigned long addr, unsigned int order,
+		size_t size, gfp_t gfp_mask)
 {
 	if (addr) {
 		unsigned long nr = DIV_ROUND_UP(size, PAGE_SIZE);
 		struct page *page = virt_to_page((void *)addr);
+		struct page *first = page;
 		struct page *last = page + nr;
 
 		split_page_owner(page, order, 0);
@@ -5132,9 +5131,22 @@ static void *make_alloc_exact(unsigned long addr, unsigned int order,
 		while (page < --last)
 			set_page_refcounted(last);
 
-		last = page + (1UL << order);
+		last = page + (1 << order);
 		for (page += nr; page < last; page++)
 			__free_pages_ok(page, 0, FPI_TO_TAIL);
+
+		/*
+		 * ASI doesn't support partially undoing calls to asi_map, so
+		 * we can only safely free sub-allocations if they were made
+		 * with __GFP_SENSITIVE in the first place. Users of this need
+		 * to map with forced __GFP_SENSITIVE and then here we'll make a
+		 * second asi_map_alloced_pages() call to do any mapping that's
+		 * necessary, but with the exact size.
+		 */
+		if (unlikely(asi_map_alloced_pages(first, nr << PAGE_SHIFT, gfp_mask))) {
+			free_pages_exact(first, size);
+			return NULL;
+		}
 	}
 	return (void *)addr;
 }
@@ -5162,8 +5174,8 @@ void *alloc_pages_exact_noprof(size_t size, gfp_t gfp_mask)
 	if (WARN_ON_ONCE(gfp_mask & (__GFP_COMP | __GFP_HIGHMEM)))
 		gfp_mask &= ~(__GFP_COMP | __GFP_HIGHMEM);
 
-	addr = get_free_pages_noprof(gfp_mask, order);
-	return make_alloc_exact(addr, order, size);
+	addr = get_free_pages_noprof(gfp_mask | __GFP_SENSITIVE, order);
+	return finish_exact_alloc(addr, order, size, gfp_mask);
 }
 EXPORT_SYMBOL(alloc_pages_exact_noprof);
 
@@ -5187,10 +5199,10 @@ void * __meminit alloc_pages_exact_nid_noprof(int nid, size_t size, gfp_t gfp_ma
 	if (WARN_ON_ONCE(gfp_mask & (__GFP_COMP | __GFP_HIGHMEM)))
 		gfp_mask &= ~(__GFP_COMP | __GFP_HIGHMEM);
 
-	p = alloc_pages_node_noprof(nid, gfp_mask, order);
+	p = alloc_pages_node_noprof(nid, gfp_mask | __GFP_SENSITIVE, order);
 	if (!p)
 		return NULL;
-	return make_alloc_exact((unsigned long)page_address(p), order, size);
+	return finish_exact_alloc((unsigned long)page_address(p), order, size, gfp_mask);
 }
 
 /**

-- 
2.47.1.613.gc27f4b7a9f-goog


