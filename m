Return-Path: <linuxppc-dev+bounces-5039-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01EA4A09F1C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jan 2025 01:14:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YVJtJ5Y0Fz3cnS;
	Sat, 11 Jan 2025 11:14:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::449"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736534490;
	cv=none; b=bD6BYwTNWQez+VPVM7uLgh/0+9TVtblJs7Qe+TeJM7Arn3nnzbWRuDjMwIyEAFQ1XBmRxMzz47iCdQm7N78jZ5Bysw7GqH+F7dDA9kSK3ryjJAkV+bXeDvA56StsGrr8SzySyOcJmjedACcuYuGIySXYQxOPeD1fiDwP/inf/dTR2Atr7on9xPUsAqJlEo//vAxDqzSkQzaFLWfyz3WVS9Y54TnXxck4fQyEG2QHaRTk7TLoMN6xZx5ZwGpDJc9f7m6ufcp8jyL3A5b6t0mv6bkSV/snPO34YoO3OSEMH9C7MfhDaktPtErhzHuBXuFSVljrInjitG5E3T4MItU+pg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736534490; c=relaxed/relaxed;
	bh=+fqV4f6s/Eo+EZ+PE2OCyE0kBm/vfnsLcFKRz+1otrE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gRDIqZWcB9XUad46cIkCSegsTbCbDLuo1IMa+QgjxOWgK60hINdsc+BgzmJBQRe+8Aw0SG/bSq743WOIYohbGENaqVWO9UgP2jZczIT7VzBO3izonXs8PGwIwL0hS3T4JLbINCsHqNphql5aazUC9ar1sZ2STYRBhu3JbCZuBC23jcOWD2Fd8Xr5aIFA0fvZVRY1P1pJCM9/EKVlhtepJhLLxguYC5W9dlTiNVzcSry/OkHyQiybOERBDi1QWnvq2s2JgcqZ2FYYsbmlO6wfEl9YKJxylAb2ABoYMzMJCibtHjm6iJAGSFe0SSR9oOr/FSN94eSJVJdjtWCJiPrOSw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=q9hTM89O; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::449; helo=mail-wr1-x449.google.com; envelope-from=31mmbzwgkdpectvdftguzhhzex.vhfebgnqiiv-wxoeblml.hsetul.hkz@flex--jackmanb.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=q9hTM89O;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--jackmanb.bounces.google.com (client-ip=2a00:1450:4864:20::449; helo=mail-wr1-x449.google.com; envelope-from=31mmbzwgkdpectvdftguzhhzex.vhfebgnqiiv-wxoeblml.hsetul.hkz@flex--jackmanb.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x449.google.com (mail-wr1-x449.google.com [IPv6:2a00:1450:4864:20::449])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YV9V10q1Xz3cYR
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jan 2025 05:41:29 +1100 (AEDT)
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-385ded5e92aso929892f8f.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2025 10:41:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736534486; x=1737139286; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+fqV4f6s/Eo+EZ+PE2OCyE0kBm/vfnsLcFKRz+1otrE=;
        b=q9hTM89Ok/nxfvoSsArQnyAjuZu7qL5cxArlQiADCYR+Q2PDoKJ3gesMpiIoRtdLdV
         xzeqer/MbCC5DbcTTWO/9rHnvaNjy/LRq1ajJMntfXQC1abS7y+Q8ZrlrXTCRoVDmDup
         LbJUhnRrOe9VYyPmC1QcoLei7uyYds5yb/B8ZN53Po72G889bPxbfcG/RcZYZOYd6gSF
         zH3/iByeu1aOF+UZvp/ALwRlvccydcIR+tKPHUnLM298DALuha9O3xjxD6WKBufBZhG3
         oxFJgHl32CXhQmp0axhcgyJB2HsyCU7X0R7trUOuMiPXYBcSAkM0IggTxvUQnZeQb634
         n/3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736534486; x=1737139286;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+fqV4f6s/Eo+EZ+PE2OCyE0kBm/vfnsLcFKRz+1otrE=;
        b=TwZqlgRIx2vb2PcB9ZtAwYRoXD4mLw9cOVYYgKOneXjAY8EwIexgMyKaNsWRg4HSYQ
         IRg3B5OvOniGHBRxfEpmZvQooSWgT87pv2/SkrMDf7etJQAzILnoTjvk0cExIm2JMnIB
         t9Eb2IWMjA/lZJn6wawmO49LyAOi6IeCWexFSaEO5+a9uE1oD5KJEGDPu5QhU/WZmtAl
         Ez7tK/OTyZ11Wt9SG1ksorJ6pTF27d5JW2KdDoXco03czC1K+MiqLE0xPzhBR7EomNny
         SVLI0XHvZE43msKJw2V3260FwkUb+0prgftNjUocc01MiRKFWpZZ4tdt/WfJo3KFI4pY
         8vGg==
X-Forwarded-Encrypted: i=1; AJvYcCVhKf76ERSicvtU7YNJcPen6g7HLqxkT5nQYXkmxX0YuwIHUUH36qketbUoPHW67tuHhrbQCo3reJIoAC0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyY98nVyuwy0BCW2W0LzPXeQl9OpoCTblXnkXcFxI+0UxLZiQZo
	QXmP1ZI1C4Gmjnv3VvFnyd72XqNiu6uDr0uV7fRd2NswbB5eDzf+z65BCF5tevphuGa4Qxpo3VK
	IqCdWVSO52w==
X-Google-Smtp-Source: AGHT+IFgJUpClA++DtJe4xQ45Yc9kKsVSyJCXKqF0cxpPlCBfuMButRzIe/JLM7ynzshFcOsnG5hhjluySNsEA==
X-Received: from wrbeh5.prod.google.com ([2002:a05:6000:4105:b0:382:4235:c487])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:adf:8b5b:0:b0:38a:88bc:aea4 with SMTP id ffacd0b85a97d-38a88bcaebfmr7355114f8f.30.1736534486264;
 Fri, 10 Jan 2025 10:41:26 -0800 (PST)
Date: Fri, 10 Jan 2025 18:40:44 +0000
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
Message-ID: <20250110-asi-rfc-v2-v2-18-8419288bc805@google.com>
Subject: [PATCH RFC v2 18/29] mm: asi: Map dynamic percpu memory as nonsensitive
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
	Brendan Jackman <jackmanb@google.com>, Reiji Watanabe <reijiw@google.com>, 
	Junaid Shahid <junaids@google.com>
Content-Type: text/plain; charset="utf-8"
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Reiji Watanabe <reijiw@google.com>

Currently, all dynamic percpu memory is implicitly (and
unintentionally) treated as sensitive memory.

Unconditionally map pages for dynamically allocated percpu
memory as global nonsensitive memory, other than pages that
are allocated for pcpu_{first,reserved}_chunk during early
boot via memblock allocator (these will be taken care by the
following patch).

We don't support sensitive percpu memory allocation yet.

Co-developed-by: Junaid Shahid <junaids@google.com>
Signed-off-by: Junaid Shahid <junaids@google.com>
Signed-off-by: Reiji Watanabe <reijiw@google.com>
Signed-off-by: Brendan Jackman <jackmanb@google.com>

WIP: Drop VM_SENSITIVE checks from percpu code
---
 mm/percpu-vm.c | 50 ++++++++++++++++++++++++++++++++++++++++++++------
 mm/percpu.c    |  4 ++--
 2 files changed, 46 insertions(+), 8 deletions(-)

diff --git a/mm/percpu-vm.c b/mm/percpu-vm.c
index cd69caf6aa8d8eded2395eb4bc4051b78ec6aa33..2935d7fbac41548819a94dcc60566bd18cde819a 100644
--- a/mm/percpu-vm.c
+++ b/mm/percpu-vm.c
@@ -132,11 +132,20 @@ static void pcpu_pre_unmap_flush(struct pcpu_chunk *chunk,
 		pcpu_chunk_addr(chunk, pcpu_high_unit_cpu, page_end));
 }
 
-static void __pcpu_unmap_pages(unsigned long addr, int nr_pages)
+static void ___pcpu_unmap_pages(unsigned long addr, int nr_pages)
 {
 	vunmap_range_noflush(addr, addr + (nr_pages << PAGE_SHIFT));
 }
 
+static void __pcpu_unmap_pages(unsigned long addr, int nr_pages,
+			       unsigned long vm_flags)
+{
+	unsigned long size = nr_pages << PAGE_SHIFT;
+
+	asi_unmap(ASI_GLOBAL_NONSENSITIVE, (void *)addr, size);
+	___pcpu_unmap_pages(addr, nr_pages);
+}
+
 /**
  * pcpu_unmap_pages - unmap pages out of a pcpu_chunk
  * @chunk: chunk of interest
@@ -153,6 +162,8 @@ static void __pcpu_unmap_pages(unsigned long addr, int nr_pages)
 static void pcpu_unmap_pages(struct pcpu_chunk *chunk,
 			     struct page **pages, int page_start, int page_end)
 {
+	struct vm_struct **vms = (struct vm_struct **)chunk->data;
+	unsigned long vm_flags = vms ? vms[0]->flags : VM_ALLOC;
 	unsigned int cpu;
 	int i;
 
@@ -165,7 +176,7 @@ static void pcpu_unmap_pages(struct pcpu_chunk *chunk,
 			pages[pcpu_page_idx(cpu, i)] = page;
 		}
 		__pcpu_unmap_pages(pcpu_chunk_addr(chunk, cpu, page_start),
-				   page_end - page_start);
+				   page_end - page_start, vm_flags);
 	}
 }
 
@@ -190,13 +201,38 @@ static void pcpu_post_unmap_tlb_flush(struct pcpu_chunk *chunk,
 		pcpu_chunk_addr(chunk, pcpu_high_unit_cpu, page_end));
 }
 
-static int __pcpu_map_pages(unsigned long addr, struct page **pages,
-			    int nr_pages)
+/*
+ * __pcpu_map_pages() should not be called during the percpu initialization,
+ * as asi_map() depends on the page allocator (which isn't available yet
+ * during percpu initialization).  Instead, ___pcpu_map_pages() can be used
+ * during the percpu initialization. But, any pages that are mapped with
+ * ___pcpu_map_pages() will be treated as sensitive memory, unless
+ * they are explicitly mapped with asi_map() later.
+ */
+static int ___pcpu_map_pages(unsigned long addr, struct page **pages,
+			     int nr_pages)
 {
 	return vmap_pages_range_noflush(addr, addr + (nr_pages << PAGE_SHIFT),
 					PAGE_KERNEL, pages, PAGE_SHIFT);
 }
 
+static int __pcpu_map_pages(unsigned long addr, struct page **pages,
+			    int nr_pages, unsigned long vm_flags)
+{
+	unsigned long size = nr_pages << PAGE_SHIFT;
+	int err;
+
+	err = ___pcpu_map_pages(addr, pages, nr_pages);
+	if (err)
+		return err;
+
+	/*
+	 * If this fails, pcpu_map_pages()->__pcpu_unmap_pages() will call
+	 * asi_unmap() and clean up any partial mappings.
+	 */
+	return asi_map(ASI_GLOBAL_NONSENSITIVE, (void *)addr, size);
+}
+
 /**
  * pcpu_map_pages - map pages into a pcpu_chunk
  * @chunk: chunk of interest
@@ -214,13 +250,15 @@ static int __pcpu_map_pages(unsigned long addr, struct page **pages,
 static int pcpu_map_pages(struct pcpu_chunk *chunk,
 			  struct page **pages, int page_start, int page_end)
 {
+	struct vm_struct **vms = (struct vm_struct **)chunk->data;
+	unsigned long vm_flags = vms ? vms[0]->flags : VM_ALLOC;
 	unsigned int cpu, tcpu;
 	int i, err;
 
 	for_each_possible_cpu(cpu) {
 		err = __pcpu_map_pages(pcpu_chunk_addr(chunk, cpu, page_start),
 				       &pages[pcpu_page_idx(cpu, page_start)],
-				       page_end - page_start);
+				       page_end - page_start, vm_flags);
 		if (err < 0)
 			goto err;
 
@@ -232,7 +270,7 @@ static int pcpu_map_pages(struct pcpu_chunk *chunk,
 err:
 	for_each_possible_cpu(tcpu) {
 		__pcpu_unmap_pages(pcpu_chunk_addr(chunk, tcpu, page_start),
-				   page_end - page_start);
+				   page_end - page_start, vm_flags);
 		if (tcpu == cpu)
 			break;
 	}
diff --git a/mm/percpu.c b/mm/percpu.c
index da21680ff294cb53dfb42bf0d3b3bbd2654d2cfa..c2d913c579bf07892957ac7f601a6a71defadc4b 100644
--- a/mm/percpu.c
+++ b/mm/percpu.c
@@ -3273,8 +3273,8 @@ int __init pcpu_page_first_chunk(size_t reserved_size, pcpu_fc_cpu_to_node_fn_t
 			pcpu_populate_pte(unit_addr + (i << PAGE_SHIFT));
 
 		/* pte already populated, the following shouldn't fail */
-		rc = __pcpu_map_pages(unit_addr, &pages[unit * unit_pages],
-				      unit_pages);
+		rc = ___pcpu_map_pages(unit_addr, &pages[unit * unit_pages],
+				       unit_pages);
 		if (rc < 0)
 			panic("failed to map percpu area, err=%d\n", rc);
 

-- 
2.47.1.613.gc27f4b7a9f-goog


