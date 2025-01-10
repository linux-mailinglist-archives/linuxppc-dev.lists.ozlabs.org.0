Return-Path: <linuxppc-dev+bounces-5047-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CED8A09F24
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jan 2025 01:15:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YVJvZ1snRz3cgg;
	Sat, 11 Jan 2025 11:15:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::349"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736534508;
	cv=none; b=RKOyai+nXdmf7DFdBGDYVpbhLrxo/JhAkgoH7tdZamODfSd04vedFGnJgNw+1STcvl0qh45127sztRZk2hUiblR0Y6++PrXpkrvQ1YNeTn7bEk9GXW5i+alCo/MafAYe8GWywdZD/aaX/mRk2rKW/U4Eee47RyPL5XYKTBZtqNBiW0Em4VHA2+Le+FSiYaNLWqFem85L26TOayt+zKgg5QD/9PNRF2iizQXfkG9a2VepSWfqtzT1LwxoC5CjRo8CfwTmfHmhfWWuun5nZ79pB/ab4rJ1NRnZXyDRor34qiY9JF87zDnNr6ThwdoG9wlZTwy6iu5TZMEmos7EXAWoDw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736534508; c=relaxed/relaxed;
	bh=CAllTjvu+aeRJsuZfnIbaARP70yHbpTXyh5BDwNTLpw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=AWYFw4WCCrqRgXzi4fujJS1N35F+G7Oop1mfW2BUz3IFF9xLBzsoeCADloBhLjBMkYpOpXCTX8m0VKDDg+ikk15oJAdFEfPZAgYg4qY3RovMjUATYtRSwMnVzCoGpuHP1ilN6+7msoG0u5Oz5MCrSF6vqUhVMlx6rv8XvbsUba7jVMYdSwWN025pMUFrDr6jYsNxVt0MdcrRTvjKL1cIPZRSdWjPWz1PG17AArS8n8N2E8YMput1WRlylo2kvNQzwMkRJZqToe7bmIluNeTQ55lpKWiBccR03seljAaHFKJP//0hqCva4WwZEDoQNdiFfdYcH8z8rB+sIv+0UfmbCA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=yMZeBMfV; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::349; helo=mail-wm1-x349.google.com; envelope-from=36gmbzwgkdauofhprfsglttlqj.htrqnsz2uuh-ij0qnxyx.t4qfgx.twl@flex--jackmanb.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=yMZeBMfV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--jackmanb.bounces.google.com (client-ip=2a00:1450:4864:20::349; helo=mail-wm1-x349.google.com; envelope-from=36gmbzwgkdauofhprfsglttlqj.htrqnsz2uuh-ij0qnxyx.t4qfgx.twl@flex--jackmanb.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x349.google.com (mail-wm1-x349.google.com [IPv6:2a00:1450:4864:20::349])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YV9VM2n0Yz3cYP
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jan 2025 05:41:47 +1100 (AEDT)
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-43621907030so19343075e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2025 10:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736534505; x=1737139305; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CAllTjvu+aeRJsuZfnIbaARP70yHbpTXyh5BDwNTLpw=;
        b=yMZeBMfVzdM2hQK9vIInezA8lz1QdfM5qwIx+mnBW7hAy1dwjiP0PptXvWzohJDLir
         33ebuxlYsg6RzMyyLMgIbo9j09eo9rl+KwzknTDcZ+AgKhy8RHkcPOzGubtUXrmBcBAt
         TgK0JiZJWoVMI/XgjONdtaCOuNk5WHrTS5V2fNAKHuvBTg58yIvn5xFiiQixARrhBA0y
         x01+TO72T84LQhHCzGAWWNvl2ChQeSc/7dQvxcuqP3hkV9E9o8XVmJ5XJrl7dBuS33xD
         TSplUM+GKmbbY1q8i405RrM3LbdQkMqqxI9ZSlIB3n3fDpdHLieIeFDx0WmOYysxl0vr
         F1dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736534505; x=1737139305;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CAllTjvu+aeRJsuZfnIbaARP70yHbpTXyh5BDwNTLpw=;
        b=jVzI0mIG/Vb9bbtDmdt3iwgvGTVszdeKXFEFIaNZNWAKHLSEeu0kAW+/CCQZ9hUrY3
         jQQIlHMbw7U75+45/2PKk3e6cx2QaLNOewncUU73DyNLcv3BHCxFfdlGEOu8tFyKq6l6
         L4nXk6RHVbGN81mHYsqgkwo38/rxJgg4knVUWY7zUcFVx0jOtsUb2Kf+NLYZ5c/sX0pR
         iTtttegDlxpDHQQ2hLXqJ0Zdwd7/jbbgtX6c1pglAP6NQk5k99cKRm/o8t8rrDWDQyGU
         BU04euoAPnMpypWRux/LLPuMidv9HJdU0yE8/JDZVE9x/9ENt46EmqNahd+uZfdL6Pm5
         fveA==
X-Forwarded-Encrypted: i=1; AJvYcCUTGbk+cXV+2JUzi02PHJVPhjWs7LR5OLApbkOH6Nw7DLVFDhgxdn37jB20B32U4VqQHJzbAGL51FOH+uw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxaMlCEk3VBSQFdf3ZBnbQmqdUDbayux1mEeyAB7xy/blejskF8
	42mduXdC1NnjoTr22bVk/N3mTz6NI647HPMrQq/Q4RNLd5U1rjU95ip/E0+fyD7a7c0+4OqL9WP
	xTuuWfpWtBA==
X-Google-Smtp-Source: AGHT+IFbu2VfquZETrYawBwFSqjLwW/Qzimn4MDKfCetEVKQSMACYt32ELZsfcDoj+dSkmxIf50qY6QNFb/+Xg==
X-Received: from wmqe1.prod.google.com ([2002:a05:600c:4e41:b0:434:a050:ddcf])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3c85:b0:436:18d0:aa6e with SMTP id 5b1f17b1804b1-436e2679a7cmr125841955e9.5.1736534504638;
 Fri, 10 Jan 2025 10:41:44 -0800 (PST)
Date: Fri, 10 Jan 2025 18:40:52 +0000
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
Message-ID: <20250110-asi-rfc-v2-v2-26-8419288bc805@google.com>
Subject: [PATCH RFC v2 26/29] x86: Create library for flushing L1D for L1TF
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

ASI will need to use this L1D flushing logic so put it in a library
where it can be used independently of KVM.

Since we're creating this library, it starts to look messy if we don't
also use it in the double-opt-in (both kernel cmdline and prctl)
mm-switching flush logic which is there for mitigating Snoop-Assisted L1
Data Sampling ("SAL1DS"). However, that logic doesn't use any
software-based fallback for flushing on CPUs without the L1D_FLUSH
command. In that case the prctl opt-in will fail.

One option would be to just start using the software fallback sequence
currently done by VMX code, but Linus didn't seem happy with a similar
sequence being used here [1]. CPUs affected by SAL1DS are a subset of
those affected by L1TF, so it wouldn't be completely insane to assume
that the same sequence works for both cases, but I'll err on the side of
caution and avoid risk of giving users a false impression that the
kernel has really flushed L1D for them.

[1] https://lore.kernel.org/linux-kernel/CAHk-=whC4PUhErcoDhCbTOdmPPy-Pj8j9ytsdcyz9TorOb4KUw@mail.gmail.com/

Instead, create this awkward library that is scoped specifically to L1TF,
which will be used only by VMX and ASI, and has an annoying "only
sometimes works" doc-comment. Users of the library can then infer from
that comment whether they have flushed L1D.

No functional change intended.

Checkpatch-args: --ignore=COMMIT_LOG_LONG_LINE
Signed-off-by: Brendan Jackman <jackmanb@google.com>
---
 arch/x86/Kconfig            |  4 ++
 arch/x86/include/asm/l1tf.h | 11 ++++++
 arch/x86/kvm/Kconfig        |  1 +
 arch/x86/kvm/vmx/vmx.c      | 66 +++----------------------------
 arch/x86/lib/Makefile       |  1 +
 arch/x86/lib/l1tf.c         | 94 +++++++++++++++++++++++++++++++++++++++++++++
 6 files changed, 117 insertions(+), 60 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index ae31f36ce23d7c29d1e90b726c5a2e6ea5a63c8d..ca984dc7ee2f2b68c3ce1bcb5055047ca4f2a65d 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -2523,6 +2523,7 @@ config MITIGATION_ADDRESS_SPACE_ISOLATION
 	bool "Allow code to run with a reduced kernel address space"
 	default n
 	depends on X86_64 && !PARAVIRT && !UML
+	select X86_L1TF_FLUSH_LIB
 	help
 	  This feature provides the ability to run some kernel code
 	  with a reduced kernel address space. This can be used to
@@ -3201,6 +3202,9 @@ config HAVE_ATOMIC_IOMAP
 	def_bool y
 	depends on X86_32
 
+config X86_L1TF_FLUSH_LIB
+	def_bool n
+
 source "arch/x86/kvm/Kconfig"
 
 source "arch/x86/Kconfig.assembler"
diff --git a/arch/x86/include/asm/l1tf.h b/arch/x86/include/asm/l1tf.h
new file mode 100644
index 0000000000000000000000000000000000000000..e0be19c588bb5ec5c76a1861492e48b88615b4b8
--- /dev/null
+++ b/arch/x86/include/asm/l1tf.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_L1TF_FLUSH_H
+#define _ASM_L1TF_FLUSH_H
+
+#ifdef CONFIG_X86_L1TF_FLUSH_LIB
+int l1tf_flush_setup(void);
+void l1tf_flush(void);
+#endif /* CONFIG_X86_L1TF_FLUSH_LIB */
+
+#endif
+
diff --git a/arch/x86/kvm/Kconfig b/arch/x86/kvm/Kconfig
index f09f13c01c6bbd28fa37fdf50547abf4403658c9..81c71510e33e52447882ab7b22682199c57b492e 100644
--- a/arch/x86/kvm/Kconfig
+++ b/arch/x86/kvm/Kconfig
@@ -92,6 +92,7 @@ config KVM_SW_PROTECTED_VM
 config KVM_INTEL
 	tristate "KVM for Intel (and compatible) processors support"
 	depends on KVM && IA32_FEAT_CTL
+	select X86_L1TF_FLUSH_LIB
 	help
 	  Provides support for KVM on processors equipped with Intel's VT
 	  extensions, a.k.a. Virtual Machine Extensions (VMX).
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 0e90463f1f2183b8d716f85d5c8a8af8958fef0b..b1a02f27b3abce0ef6ac448b66bef2c653a52eef 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -42,6 +42,7 @@
 #include <asm/idtentry.h>
 #include <asm/io.h>
 #include <asm/irq_remapping.h>
+#include <asm/l1tf.h>
 #include <asm/reboot.h>
 #include <asm/perf_event.h>
 #include <asm/mmu_context.h>
@@ -250,9 +251,6 @@ static void *vmx_l1d_flush_pages;
 
 static int vmx_setup_l1d_flush(enum vmx_l1d_flush_state l1tf)
 {
-	struct page *page;
-	unsigned int i;
-
 	if (!boot_cpu_has_bug(X86_BUG_L1TF)) {
 		l1tf_vmx_mitigation = VMENTER_L1D_FLUSH_NOT_REQUIRED;
 		return 0;
@@ -288,26 +286,11 @@ static int vmx_setup_l1d_flush(enum vmx_l1d_flush_state l1tf)
 		l1tf = VMENTER_L1D_FLUSH_ALWAYS;
 	}
 
-	if (l1tf != VMENTER_L1D_FLUSH_NEVER && !vmx_l1d_flush_pages &&
-	    !boot_cpu_has(X86_FEATURE_FLUSH_L1D)) {
-		/*
-		 * This allocation for vmx_l1d_flush_pages is not tied to a VM
-		 * lifetime and so should not be charged to a memcg.
-		 */
-		page = alloc_pages(GFP_KERNEL, L1D_CACHE_ORDER);
-		if (!page)
-			return -ENOMEM;
-		vmx_l1d_flush_pages = page_address(page);
+	if (l1tf != VMENTER_L1D_FLUSH_NEVER) {
+		int err = l1tf_flush_setup();
 
-		/*
-		 * Initialize each page with a different pattern in
-		 * order to protect against KSM in the nested
-		 * virtualization case.
-		 */
-		for (i = 0; i < 1u << L1D_CACHE_ORDER; ++i) {
-			memset(vmx_l1d_flush_pages + i * PAGE_SIZE, i + 1,
-			       PAGE_SIZE);
-		}
+		if (err)
+			return err;
 	}
 
 	l1tf_vmx_mitigation = l1tf;
@@ -6652,20 +6635,8 @@ int vmx_handle_exit(struct kvm_vcpu *vcpu, fastpath_t exit_fastpath)
 	return ret;
 }
 
-/*
- * Software based L1D cache flush which is used when microcode providing
- * the cache control MSR is not loaded.
- *
- * The L1D cache is 32 KiB on Nehalem and later microarchitectures, but to
- * flush it is required to read in 64 KiB because the replacement algorithm
- * is not exactly LRU. This could be sized at runtime via topology
- * information but as all relevant affected CPUs have 32KiB L1D cache size
- * there is no point in doing so.
- */
 static noinstr void vmx_l1d_flush(struct kvm_vcpu *vcpu)
 {
-	int size = PAGE_SIZE << L1D_CACHE_ORDER;
-
 	/*
 	 * This code is only executed when the flush mode is 'cond' or
 	 * 'always'
@@ -6695,32 +6666,7 @@ static noinstr void vmx_l1d_flush(struct kvm_vcpu *vcpu)
 
 	vcpu->stat.l1d_flush++;
 
-	if (static_cpu_has(X86_FEATURE_FLUSH_L1D)) {
-		native_wrmsrl(MSR_IA32_FLUSH_CMD, L1D_FLUSH);
-		return;
-	}
-
-	asm volatile(
-		/* First ensure the pages are in the TLB */
-		"xorl	%%eax, %%eax\n"
-		".Lpopulate_tlb:\n\t"
-		"movzbl	(%[flush_pages], %%" _ASM_AX "), %%ecx\n\t"
-		"addl	$4096, %%eax\n\t"
-		"cmpl	%%eax, %[size]\n\t"
-		"jne	.Lpopulate_tlb\n\t"
-		"xorl	%%eax, %%eax\n\t"
-		"cpuid\n\t"
-		/* Now fill the cache */
-		"xorl	%%eax, %%eax\n"
-		".Lfill_cache:\n"
-		"movzbl	(%[flush_pages], %%" _ASM_AX "), %%ecx\n\t"
-		"addl	$64, %%eax\n\t"
-		"cmpl	%%eax, %[size]\n\t"
-		"jne	.Lfill_cache\n\t"
-		"lfence\n"
-		:: [flush_pages] "r" (vmx_l1d_flush_pages),
-		    [size] "r" (size)
-		: "eax", "ebx", "ecx", "edx");
+	l1tf_flush();
 }
 
 void vmx_update_cr8_intercept(struct kvm_vcpu *vcpu, int tpr, int irr)
diff --git a/arch/x86/lib/Makefile b/arch/x86/lib/Makefile
index 98583a9dbab337e09a2e58905e5200499a496a07..b0a45bd70b40743a3fccb352b9641caacac83275 100644
--- a/arch/x86/lib/Makefile
+++ b/arch/x86/lib/Makefile
@@ -37,6 +37,7 @@ lib-$(CONFIG_INSTRUCTION_DECODER) += insn.o inat.o insn-eval.o
 lib-$(CONFIG_RANDOMIZE_BASE) += kaslr.o
 lib-$(CONFIG_FUNCTION_ERROR_INJECTION)	+= error-inject.o
 lib-$(CONFIG_MITIGATION_RETPOLINE) += retpoline.o
+lib-$(CONFIG_X86_L1TF_FLUSH_LIB) += l1tf.o
 
 obj-y += msr.o msr-reg.o msr-reg-export.o hweight.o
 obj-y += iomem.o
diff --git a/arch/x86/lib/l1tf.c b/arch/x86/lib/l1tf.c
new file mode 100644
index 0000000000000000000000000000000000000000..c474f18ae331c8dfa7a029c457dd3cf75bebf808
--- /dev/null
+++ b/arch/x86/lib/l1tf.c
@@ -0,0 +1,94 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/gfp.h>
+#include <linux/mm.h>
+#include <linux/string.h>
+
+#include <asm/cpufeature.h>
+#include <asm/l1tf.h>
+#include <asm/msr.h>
+
+#define L1D_CACHE_ORDER 4
+static void *l1tf_flush_pages;
+
+int l1tf_flush_setup(void)
+{
+	struct page *page;
+	unsigned int i;
+
+	if (l1tf_flush_pages || boot_cpu_has(X86_FEATURE_FLUSH_L1D))
+		return 0;
+
+	page = alloc_pages(GFP_KERNEL, L1D_CACHE_ORDER);
+	if (!page)
+		return -ENOMEM;
+	l1tf_flush_pages = page_address(page);
+
+	/*
+	 * Initialize each page with a different pattern in
+	 * order to protect against KSM in the nested
+	 * virtualization case.
+	 */
+	for (i = 0; i < 1u << L1D_CACHE_ORDER; ++i) {
+		memset(l1tf_flush_pages + i * PAGE_SIZE, i + 1,
+			 PAGE_SIZE);
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(l1tf_flush_setup);
+
+/*
+ * Flush L1D in a way that:
+ *
+ *  - definitely works on CPUs X86_FEATURE_FLUSH_L1D (because the SDM says so).
+ *  - almost definitely works on other CPUs with L1TF (because someone on LKML
+ *    said someone from Intel said so).
+ *  - may or may not work on other CPUs.
+ *
+ * Don't call unless l1tf_flush_setup() has returned successfully.
+ */
+noinstr void l1tf_flush(void)
+{
+	int size = PAGE_SIZE << L1D_CACHE_ORDER;
+
+	if (static_cpu_has(X86_FEATURE_FLUSH_L1D)) {
+		native_wrmsrl(MSR_IA32_FLUSH_CMD, L1D_FLUSH);
+		return;
+	}
+
+	if (WARN_ON(!l1tf_flush_pages))
+		return;
+
+	/*
+	 * This sequence was provided by Intel for the purpose of mitigating
+	 * L1TF on VMX.
+	 *
+	 * The L1D cache is 32 KiB on Nehalem and some later microarchitectures,
+	 * but to flush it is required to read in 64 KiB because the replacement
+	 * algorithm is not exactly LRU. This could be sized at runtime via
+	 * topology information but as all relevant affected CPUs have 32KiB L1D
+	 * cache size there is no point in doing so.
+	 */
+	asm volatile(
+		/* First ensure the pages are in the TLB */
+		"xorl	%%eax, %%eax\n"
+		".Lpopulate_tlb:\n\t"
+		"movzbl	(%[flush_pages], %%" _ASM_AX "), %%ecx\n\t"
+		"addl	$4096, %%eax\n\t"
+		"cmpl	%%eax, %[size]\n\t"
+		"jne	.Lpopulate_tlb\n\t"
+		"xorl	%%eax, %%eax\n\t"
+		"cpuid\n\t"
+		/* Now fill the cache */
+		"xorl	%%eax, %%eax\n"
+		".Lfill_cache:\n"
+		"movzbl	(%[flush_pages], %%" _ASM_AX "), %%ecx\n\t"
+		"addl	$64, %%eax\n\t"
+		"cmpl	%%eax, %[size]\n\t"
+		"jne	.Lfill_cache\n\t"
+		"lfence\n"
+		:: [flush_pages] "r" (l1tf_flush_pages),
+		    [size] "r" (size)
+		: "eax", "ebx", "ecx", "edx");
+}
+EXPORT_SYMBOL(l1tf_flush);

-- 
2.47.1.613.gc27f4b7a9f-goog


