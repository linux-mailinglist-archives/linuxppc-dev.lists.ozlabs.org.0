Return-Path: <linuxppc-dev+bounces-5041-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C880DA09F1E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jan 2025 01:14:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YVJtg4HrWz3cgP;
	Sat, 11 Jan 2025 11:14:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::44a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736534494;
	cv=none; b=GuiExghSk5HiVAfT7qzk7CXsFhQx3zDdO3xmT+O3lPOmyK6kGg82scJGPqWtoz0iWJxCORsmyQxzsPFkijlQegqVW7JLIlx0/+6EyjG8MS4UA2a58+GO3tFeGMcg757YRL/EOjT1yEeKlKgNEkLfo3iaMc8htXvwX+EOj1m0aWHJWgxNPMTjuYd3JEFB8rnBpWGs3NbAWHpoSygbAwRPUp23uUDwnRtSnC2jBdO6sEEVpt5+eWOHuGa2lNKX4elor4wMgFJFYTBATKCi9cO7QkCpXJOqDDAIuuQekpZoG4IOPHNv89V6///wr9gSvA9Y5V6TaX9SlgukW24HxkFODg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736534494; c=relaxed/relaxed;
	bh=z5b6fu2IPJ4vMWdeJyvKaXZwCsIFdjwPZGonrVH8VuY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KeFnWNdECoA8KclZqhL0nUwW/VeE/aYFE3E7ifSgHRooStwT5d9qE9KtlToVxJhhkhhdrw17pucxKbsnWi4l5nsniO01o0JABTq41JRVSFpLc3UVZjR6ECfyNp0X56Cm5PlTaV5Pz8du0Ko+C719uVwCHzyHmXlalzsn6x5FlEpUsmY/6XZp9+4zrX2TKCPfTBX9O6z48w3OnvEUCJOytbN7yS3wQVraIQujJfBpT/vrrWNuMHkv9n+kQpWADigukZnxfdIrWwyyo9BfwVBElm/mJfwZL8586/Tfy28e2jytOrP1AhG5C1oLbfkkezMZwqRa3RXMtsrk0tDzP4ujQg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=L4bDmPVd; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::44a; helo=mail-wr1-x44a.google.com; envelope-from=32mmbzwgkdpugxzhjxkydlldib.zljifkrummz-absifpqp.lwixyp.lod@flex--jackmanb.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=L4bDmPVd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--jackmanb.bounces.google.com (client-ip=2a00:1450:4864:20::44a; helo=mail-wr1-x44a.google.com; envelope-from=32mmbzwgkdpugxzhjxkydlldib.zljifkrummz-absifpqp.lwixyp.lod@flex--jackmanb.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x44a.google.com (mail-wr1-x44a.google.com [IPv6:2a00:1450:4864:20::44a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YV9V5414sz3cYR
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jan 2025 05:41:33 +1100 (AEDT)
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-385e27c5949so1426797f8f.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2025 10:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736534491; x=1737139291; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=z5b6fu2IPJ4vMWdeJyvKaXZwCsIFdjwPZGonrVH8VuY=;
        b=L4bDmPVdV5PG9NAOV3mvOvXbOmx5n+XzewmH5OIn+NL1iMdlA/8kUmImQta1Xwa6Bi
         k4DoInrUlgTQB7+Qid77t+KYDhEOVtMaBbLaz65lAAFIg2PsRptbGotLvl7WMnmYZF1o
         wJLLPGE/YQBYqHE/CA9gqjpT7ypI8gIQZSKfMUloA1AQt/pEwIEDCJTrlBHiQOj34hdC
         iLNwqs05SmXpeMtphEauTro67QyZLe9oehNNJm+lonB5kcIpuyI4cEuFNBdhxdiZhHjQ
         6dUiZbSSjHrquA7XDVwiSQcwgz+e+/U1Lq4EmFB42tLvdhF61ignV7CvMGnjMe0AAykq
         JcUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736534491; x=1737139291;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z5b6fu2IPJ4vMWdeJyvKaXZwCsIFdjwPZGonrVH8VuY=;
        b=vNEJ9tE9FnV7K4ckneHs5VE9tQo4Yp/uZC1AyA+kvcouW/EUUjC3DaKgd29AIKOFUh
         3KW2cECsEdRHLyFdzRASLhg7AKTW/RXWtnLZbiyGyg5cE7K/hPdv80gWOZKBU6i4vw6/
         5kqaVTS7qjfxE+iKTN36ivZDhiTYgao5z5KuwdH3SV96H6JJDVOHZPmAPJwwbCkEDqk9
         PMwlVSRdZQn9RRHirl5cBO6HdbLh5ZuOPis9guLH5V8UWDNlEpEyO4O2vK2tTCgM97u7
         /JWkA35VnZfuOgNs1hQCaKwc1e2mYFR839j8KUbgKAw/ccGgcfNttbsjGugh78XntuxF
         qRUw==
X-Forwarded-Encrypted: i=1; AJvYcCUp/6gtIuOTQdMFGnKP+vPBagS+RTaEEaSj4rhVwKw2HcwYgDb67b+rvYJA+yV26MqRHwWBjs8eUaIt4J8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzQF+Gdq9udz1Ufy0K+7ZlSNiHYbUpW+0WMH0zBgAB7FnZJmoqb
	UbDOHeqcqVjPXD1u9afBAXItCvA6xRRLtM3CZYTD0UykT0fqcMzKrNO3ydukLYavoahEKdWir9L
	XYkTkGkMt0g==
X-Google-Smtp-Source: AGHT+IEE74PFwgraC6zRNOcME3rOW4swKtJd/bKE4AIl8MRowFtdpWNq19ZBTTKPz5sLGPxmEc1GHABVlwipiQ==
X-Received: from wmjv9.prod.google.com ([2002:a7b:cb49:0:b0:434:f173:a51])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:1a85:b0:38a:4184:1520 with SMTP id ffacd0b85a97d-38a872eb1eamr9947778f8f.27.1736534490587;
 Fri, 10 Jan 2025 10:41:30 -0800 (PST)
Date: Fri, 10 Jan 2025 18:40:46 +0000
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
Message-ID: <20250110-asi-rfc-v2-v2-20-8419288bc805@google.com>
Subject: [PATCH RFC v2 20/29] mm: asi: Make TLB flushing correct under ASI
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

This is the absolute minimum change for TLB flushing to be correct under
ASI. There are two arguably orthogonal changes in here but they feel
small enough for a single commit.

.:: CR3 stabilization

As noted in the comment ASI can destabilize CR3, but we can stabilize it
again by calling asi_exit, this makes it safe to read CR3 and write it
back.

This is enough to be correct - we don't have to worry about invalidating
the other ASI address space (i.e. we don't need to invalidate the
restricted address space if we are currently unrestricted / vice versa)
because we currently never set the noflush bit in CR3 for ASI
transitions.

Even without using CR3's noflush bit there are trivial optimizations
still on the table here: on where invpcid_flush_single_context is
available (i.e. with the INVPCID_SINGLE feature) we can use that in lieu
of the CR3 read/write, and avoid the extremely costly asi_exit.

.:: Invalidating kernel mappings

Before ASI, with KPTI off we always either disable PCID or use global
mappings for kernel memory. However ASI disables global kernel mappings
regardless of factors. So we need to invalidate other address spaces to
trigger a flush when we switch into them.

Note that there is currently a pointless write of
cpu_tlbstate.invalidate_other in the case of KPTI and !PCID. We've added
another case of that (ASI, !KPTI and !PCID). I think that's preferable
to expanding the conditional in flush_tlb_one_kernel.

Signed-off-by: Brendan Jackman <jackmanb@google.com>
---
 arch/x86/mm/tlb.c | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
index ce5598f96ea7a84dc0e8623022ab5bfbba401b48..07b1657bee8e4cf17452ea57c838823e76f482c0 100644
--- a/arch/x86/mm/tlb.c
+++ b/arch/x86/mm/tlb.c
@@ -231,7 +231,7 @@ static void clear_asid_other(void)
 	 * This is only expected to be set if we have disabled
 	 * kernel _PAGE_GLOBAL pages.
 	 */
-	if (!static_cpu_has(X86_FEATURE_PTI)) {
+	if (!static_cpu_has(X86_FEATURE_PTI) && !static_asi_enabled()) {
 		WARN_ON_ONCE(1);
 		return;
 	}
@@ -1040,7 +1040,6 @@ static void put_flush_tlb_info(void)
 noinstr u16 asi_pcid(struct asi *asi, u16 asid)
 {
 	return kern_pcid(asid) | ((asi->class_id + 1) << X86_CR3_ASI_PCID_BITS_SHIFT);
-	// return kern_pcid(asid) | ((asi->index + 1) << X86_CR3_ASI_PCID_BITS_SHIFT);
 }
 
 void asi_flush_tlb_range(struct asi *asi, void *addr, size_t len)
@@ -1192,15 +1191,19 @@ void flush_tlb_one_kernel(unsigned long addr)
 	 * use PCID if we also use global PTEs for the kernel mapping, and
 	 * INVLPG flushes global translations across all address spaces.
 	 *
-	 * If PTI is on, then the kernel is mapped with non-global PTEs, and
-	 * __flush_tlb_one_user() will flush the given address for the current
-	 * kernel address space and for its usermode counterpart, but it does
-	 * not flush it for other address spaces.
+	 * If PTI or ASI is on, then the kernel is mapped with non-global PTEs,
+	 * and __flush_tlb_one_user() will flush the given address for the
+	 * current kernel address space and, if PTI is on, for its usermode
+	 * counterpart, but it does not flush it for other address spaces.
 	 */
 	flush_tlb_one_user(addr);
 
-	if (!static_cpu_has(X86_FEATURE_PTI))
+	/* Nothing more to do if PTI and ASI are completely off. */
+	if (!static_cpu_has(X86_FEATURE_PTI) && !static_asi_enabled()) {
+		VM_WARN_ON_ONCE(static_cpu_has(X86_FEATURE_PCID) &&
+				!(__default_kernel_pte_mask & _PAGE_GLOBAL));
 		return;
+	}
 
 	/*
 	 * See above.  We need to propagate the flush to all other address
@@ -1289,6 +1292,16 @@ STATIC_NOPV void native_flush_tlb_local(void)
 
 	invalidate_user_asid(this_cpu_read(cpu_tlbstate.loaded_mm_asid));
 
+	/*
+	 * Restricted ASI CR3 is unstable outside of critical section, so we
+	 * couldn't flush via a CR3 read/write. asi_exit() stabilizes it.
+	 * We don't expect any flushes in a critical section.
+	 */
+	if (WARN_ON(asi_in_critical_section()))
+		native_flush_tlb_global();
+	else
+		asi_exit();
+
 	/* If current->mm == NULL then the read_cr3() "borrows" an mm */
 	native_write_cr3(__native_read_cr3());
 }

-- 
2.47.1.613.gc27f4b7a9f-goog


