Return-Path: <linuxppc-dev+bounces-5046-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 998F3A09F23
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jan 2025 01:15:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YVJvQ2Rdlz3cyd;
	Sat, 11 Jan 2025 11:15:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::449"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736534506;
	cv=none; b=hZgIQ/tVzqQcWCNNt3H515v8/Gckfwneycaqe05gIF5NEzaFNu7vJ7AYFAsjgfZhRm9a5MM8foU7kAR0eplzPq3T3Ul/Gx32cN+pJukYvapq34aidYahsEzrOvr6BSXrqEW+F3EpJ3RPs9LBP7X7URQ+sbZOkUhye6pFmy4Ix1SlIb035qIwOx35yGgo5Qd9aRTK+a237iqzRm+t1UKNoCLkz9iiJaRRP8PcohRZGIueSGRJWlE+AXL6HhsrWUgAQRtNa09PM4f+I2CkC3iDv2iEakEiDN/acn+VZLV7BnNgNx37/dqds1jPEjToOvCrWc/Gutgy5mZS2nrYqJZLDw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736534506; c=relaxed/relaxed;
	bh=lGjVOQFY6aPZLutIkt8TLO/unqgXoc0/gnPdxCEE5wQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oXIBTikwozRPmX5pG396d5ktcI0YLhG5Tx0e9+aCfgHwmxza8PKEUK4qZiKG4xi17FNKrbMqFvgMFx6IH57y7GSNYI7PF0dM1TDS5zMt4t+oH7wEF3Jnx6oiK67+4wqWcwvJpDW7lv/quUnOjfw1OXJY64SNYpCuBi/srSot8pjKF8kTacISGiIp5fCDKtFL9X1rjmJ2QKSdjQ4FUJzRBQQll5t8ALw95WhT5B+UHk5D+dZ0aVwGxrb7KVEMjpmPdcwA8XJFNa44GwGcABhBtSihUnyl0jio0JYMFnLKtnF2f/Yjn1p+6/hlniAGsAUSeTpBAUGQ1+Isw842+Egs7g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=USx7pU4F; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::449; helo=mail-wr1-x449.google.com; envelope-from=35mmbzwgkdammdfnpdqejrrjoh.frpolqx0ssf-ghyolvwv.r2odev.ruj@flex--jackmanb.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=USx7pU4F;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--jackmanb.bounces.google.com (client-ip=2a00:1450:4864:20::449; helo=mail-wr1-x449.google.com; envelope-from=35mmbzwgkdammdfnpdqejrrjoh.frpolqx0ssf-ghyolvwv.r2odev.ruj@flex--jackmanb.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x449.google.com (mail-wr1-x449.google.com [IPv6:2a00:1450:4864:20::449])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YV9VK0thWz3cYP
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jan 2025 05:41:45 +1100 (AEDT)
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-385fdff9db5so892451f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2025 10:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736534502; x=1737139302; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lGjVOQFY6aPZLutIkt8TLO/unqgXoc0/gnPdxCEE5wQ=;
        b=USx7pU4FbuN7W9b90NJrfEYP2F7MWv1XRHJoOAq8zestkPkRI7iBD9KWj2w7C9jJKH
         l2pFG9Qkx+oZTsRn/lVJI27Z6js3ybBDVvNEzXgWr7bLlJmn5yc80Kq+G+PFnHJV4hEU
         lSAlaU54SKdG4AefrdfPrV1FKNM4vbj/PPFLqUp7js7TSfvi9AdGzBSOC3V84GXx3xl1
         2gIIqhFH80cKiUZDD5PxltEQq/pmud5gX9TJdWxin1FuthjnoOyGp4M3IDcgSOyfyeBD
         guC3+cIwp03SxZ4qhdjJVYU0DLvcmgU97Cd3CNa/PHyLDDmHzFPyNBbCvNxMTbiSeehR
         YvoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736534502; x=1737139302;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lGjVOQFY6aPZLutIkt8TLO/unqgXoc0/gnPdxCEE5wQ=;
        b=lVTfeeHo9idMTK94mT5KzRwwKbqdLLHe3+or0Q2HwhyV6Iw3qFsaEEhoVgK9T+AA0u
         CLIYmtqML1VY7aX7zuRZTKWO1O0W1Sx11SpgQEipTiFunxich42fm7VXQOB6+a9uvNic
         xE6xZbm0//1zqK4LEmLdvnZdn1//gO0KDV+4XkT1J9+oWGqRkkeKIcZ85Zfwmsk/Sl8g
         Z4Fmu1sTJ7lpMzjux9bNKd4w5p4qFUcDFWT8WMO3xZtNLR7HSv44Y3qFhnjPseO0XwRI
         3bA+tOrcVM+19JoyTQzeX3/yM4tFETsfmc+/jl0bI+OT5yn4FUNTKSjZaaDUvKVFryNF
         OfZg==
X-Forwarded-Encrypted: i=1; AJvYcCVc1cQ4XYgyH4wpfMYGzYlovyDox//uL2ufGSmES6uac6QIkMukhFqnrQdTyklvs4312kg3NhMG1MEgv8s=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxHb/764ivDlGJ81/MyvHtChn1OyJaP4/umXCRGRZ9P2cgQI+tO
	/TxdjQpqlwYQxvvdZbeEpvgPJTc1eq9KJYTyG+EyKKOKPBWlh+IBP6YCcU94BvgM9I8R4YRniiS
	gpyGkCWf96w==
X-Google-Smtp-Source: AGHT+IEWN36a0RhRoQNfORq+2yO51X6txHS1Rw2POezO/cSMdMR6AN2SOjOPPnxrT0b5W7xr5QSy1CVP6p9cPA==
X-Received: from wmqa1.prod.google.com ([2002:a05:600c:3481:b0:436:1995:1888])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:588b:0:b0:385:df84:8496 with SMTP id ffacd0b85a97d-38a872c9432mr10863969f8f.3.1736534502226;
 Fri, 10 Jan 2025 10:41:42 -0800 (PST)
Date: Fri, 10 Jan 2025 18:40:51 +0000
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
Message-ID: <20250110-asi-rfc-v2-v2-25-8419288bc805@google.com>
Subject: [PATCH RFC v2 25/29] mm: asi: Restricted execution fore bare-metal processes
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

Now userspace gets a restricted address space too. The critical section
begins on exit to userspace and ends when it makes a system call.
Other entries from userspace just interrupt the critical section via
asi_intr_enter().

The reason why system calls have to actually asi_relax() (i.e. fully
terminate the critical section instead of just interrupting it) is that
system calls are the type of kernel entry that can lead to transition
into a _different_ ASI domain, namely the KVM one: it is not supported
to transition into a different domain while a critical section exists
(i.e. while asi_state.target is not NULL), even if it has been paused by
asi_intr_enter() (i.e. even if asi_state.intr_nest_depth is nonzero) -
there must be an asi_relax() between any two asi_enter()s.

The restricted address space for bare-metal tasks naturally contains the
entire userspace address region, although the task's own memory is still
missing from the direct map.

This implementation creates new userspace-specific APIs for asi_init(),
asi_destroy() and asi_enter(), which seems a little ugly, maybe this
suggest a general rework of these APIs given that the "generic" version
only has one caller. For RFC code this seems good enough though.

Signed-off-by: Brendan Jackman <jackmanb@google.com>
---
 arch/x86/include/asm/asi.h   |  8 ++++++--
 arch/x86/mm/asi.c            | 49 ++++++++++++++++++++++++++++++++++++++++----
 include/asm-generic/asi.h    |  9 +++++++-
 include/linux/entry-common.h | 11 ++++++++++
 init/main.c                  |  2 ++
 kernel/entry/common.c        |  1 +
 kernel/fork.c                |  4 +++-
 7 files changed, 76 insertions(+), 8 deletions(-)

diff --git a/arch/x86/include/asm/asi.h b/arch/x86/include/asm/asi.h
index e925d7d2cfc85bca8480c837548654e7a5a7009e..c3c1a57f0147ae9bd11d89c8bf7c8a4477728f51 100644
--- a/arch/x86/include/asm/asi.h
+++ b/arch/x86/include/asm/asi.h
@@ -140,19 +140,23 @@ DECLARE_PER_CPU_ALIGNED(struct asi *, curr_asi);
 
 void asi_check_boottime_disable(void);
 
-void asi_init_mm_state(struct mm_struct *mm);
+int asi_init_mm_state(struct mm_struct *mm);
 
 int asi_init_class(enum asi_class_id class_id, struct asi_taint_policy *taint_policy);
+void asi_init_userspace_class(void);
 void asi_uninit_class(enum asi_class_id class_id);
 const char *asi_class_name(enum asi_class_id class_id);
 
 int asi_init(struct mm_struct *mm, enum asi_class_id class_id, struct asi **out_asi);
 void asi_destroy(struct asi *asi);
+void asi_destroy_userspace(struct mm_struct *mm);
 void asi_clone_user_pgtbl(struct mm_struct *mm, pgd_t *pgdp);
 
 /* Enter an ASI domain (restricted address space) and begin the critical section. */
 void asi_enter(struct asi *asi);
 
+void asi_enter_userspace(void);
+
 /*
  * Leave the "tense" state if we are in it, i.e. end the critical section. We
  * will stay relaxed until the next asi_enter.
@@ -294,7 +298,7 @@ void asi_handle_switch_mm(void);
  */
 static inline bool asi_maps_user_addr(enum asi_class_id class_id)
 {
-	return false;
+	return class_id == ASI_CLASS_USERSPACE;
 }
 
 #endif /* CONFIG_MITIGATION_ADDRESS_SPACE_ISOLATION */
diff --git a/arch/x86/mm/asi.c b/arch/x86/mm/asi.c
index 093103c1bc2677c81d68008aca064fab53b73a62..1e9dc568e79e8686a4dbf47f765f2c2535d025ec 100644
--- a/arch/x86/mm/asi.c
+++ b/arch/x86/mm/asi.c
@@ -25,6 +25,7 @@ const char *asi_class_names[] = {
 #if IS_ENABLED(CONFIG_KVM)
 	[ASI_CLASS_KVM] = "KVM",
 #endif
+	[ASI_CLASS_USERSPACE] = "userspace",
 };
 
 DEFINE_PER_CPU_ALIGNED(struct asi *, curr_asi);
@@ -67,6 +68,32 @@ int asi_init_class(enum asi_class_id class_id, struct asi_taint_policy *taint_po
 }
 EXPORT_SYMBOL_GPL(asi_init_class);
 
+void __init asi_init_userspace_class(void)
+{
+	static struct asi_taint_policy policy = {
+		/*
+		 * Prevent going to userspace with sensitive data potentially
+		 * left in sidechannels by code running in the unrestricted
+		 * address space, or another MM. Note we don't check for guest
+		 * data here. This reflects the assumption that the guest trusts
+		 * its VMM (absent fancy HW features, which are orthogonal).
+		 */
+		.protect_data = ASI_TAINT_KERNEL_DATA | ASI_TAINT_OTHER_MM_DATA,
+		/*
+		 * Don't go into userspace with control flow state controlled by
+		 * other processes, or any KVM guest the process is running.
+		 * Note this bit is about protecting userspace from other parts
+		 * of the system, while data_taints is about protecting other
+		 * parts of the system from the guest.
+		 */
+		.prevent_control = ASI_TAINT_GUEST_CONTROL | ASI_TAINT_OTHER_MM_CONTROL,
+		.set = ASI_TAINT_USER_CONTROL | ASI_TAINT_USER_DATA,
+	};
+	int err = asi_init_class(ASI_CLASS_USERSPACE, &policy);
+
+	WARN_ON(err);
+}
+
 void asi_uninit_class(enum asi_class_id class_id)
 {
 	if (!boot_cpu_has(X86_FEATURE_ASI))
@@ -385,7 +412,8 @@ int asi_init(struct mm_struct *mm, enum asi_class_id class_id, struct asi **out_
 	int err = 0;
 	uint i;
 
-	*out_asi = NULL;
+	if (out_asi)
+		*out_asi = NULL;
 
 	if (!boot_cpu_has(X86_FEATURE_ASI))
 		return 0;
@@ -424,7 +452,7 @@ int asi_init(struct mm_struct *mm, enum asi_class_id class_id, struct asi **out_
 exit_unlock:
 	if (err)
 		__asi_destroy(asi);
-	else
+	else if (out_asi)
 		*out_asi = asi;
 
 	__asi_init_user_pgds(mm, asi);
@@ -515,6 +543,12 @@ static __always_inline void maybe_flush_data(struct asi *next_asi)
 	this_cpu_and(asi_taints, ~ASI_TAINTS_DATA_MASK);
 }
 
+void asi_destroy_userspace(struct mm_struct *mm)
+{
+	VM_BUG_ON(!asi_class_initialized(ASI_CLASS_USERSPACE));
+	asi_destroy(&mm->asi[ASI_CLASS_USERSPACE]);
+}
+
 noinstr void __asi_enter(void)
 {
 	u64 asi_cr3;
@@ -584,6 +618,11 @@ noinstr void asi_enter(struct asi *asi)
 }
 EXPORT_SYMBOL_GPL(asi_enter);
 
+noinstr void asi_enter_userspace(void)
+{
+	asi_enter(&current->mm->asi[ASI_CLASS_USERSPACE]);
+}
+
 noinstr void asi_relax(void)
 {
 	if (static_asi_enabled()) {
@@ -633,13 +672,15 @@ noinstr void asi_exit(void)
 }
 EXPORT_SYMBOL_GPL(asi_exit);
 
-void asi_init_mm_state(struct mm_struct *mm)
+int asi_init_mm_state(struct mm_struct *mm)
 {
 	if (!boot_cpu_has(X86_FEATURE_ASI))
-		return;
+		return 0;
 
 	memset(mm->asi, 0, sizeof(mm->asi));
 	mutex_init(&mm->asi_init_lock);
+
+	return asi_init(mm, ASI_CLASS_USERSPACE, NULL);
 }
 
 void asi_handle_switch_mm(void)
diff --git a/include/asm-generic/asi.h b/include/asm-generic/asi.h
index d103343292fad567dcd73e45e986fb3974e59898..c93f9e779ce1fa61e3df7835f5ab744cce7d667b 100644
--- a/include/asm-generic/asi.h
+++ b/include/asm-generic/asi.h
@@ -15,6 +15,7 @@ enum asi_class_id {
 #if IS_ENABLED(CONFIG_KVM)
 	ASI_CLASS_KVM,
 #endif
+	ASI_CLASS_USERSPACE,
 	ASI_MAX_NUM_CLASSES,
 };
 static_assert(order_base_2(X86_CR3_ASI_PCID_BITS) <= ASI_MAX_NUM_CLASSES);
@@ -37,8 +38,10 @@ int asi_init_class(enum asi_class_id class_id,
 
 static inline void asi_uninit_class(enum asi_class_id class_id) { }
 
+static inline void asi_init_userspace_class(void) { }
+
 struct mm_struct;
-static inline void asi_init_mm_state(struct mm_struct *mm) { }
+static inline int asi_init_mm_state(struct mm_struct *mm) { return 0; }
 
 static inline int asi_init(struct mm_struct *mm, enum asi_class_id class_id,
 			   struct asi **out_asi)
@@ -48,8 +51,12 @@ static inline int asi_init(struct mm_struct *mm, enum asi_class_id class_id,
 
 static inline void asi_destroy(struct asi *asi) { }
 
+static inline void asi_destroy_userspace(struct mm_struct *mm) { }
+
 static inline void asi_enter(struct asi *asi) { }
 
+static inline void asi_enter_userspace(void) { }
+
 static inline void asi_relax(void) { }
 
 static inline bool asi_is_relaxed(void) { return true; }
diff --git a/include/linux/entry-common.h b/include/linux/entry-common.h
index 1e50cdb83ae501467ecc30ee52f1379d409f962e..f04c4c038556f84ddf3bc09b6c1dd22a9dbd2f6b 100644
--- a/include/linux/entry-common.h
+++ b/include/linux/entry-common.h
@@ -191,6 +191,16 @@ static __always_inline long syscall_enter_from_user_mode(struct pt_regs *regs, l
 {
 	long ret;
 
+	/*
+	 * End the ASI critical section for userspace. Syscalls are the only
+	 * place this happens - all other entry from userspace is handled via
+	 * ASI's interrupt-tracking. The reason syscalls are special is that's
+	 * where it's possible to switch to another ASI domain within the same
+	 * task (i.e. KVM_RUN), an asi_relax() is required here in case of an
+	 * upcoming asi_enter().
+	 */
+	asi_relax();
+
 	enter_from_user_mode(regs);
 
 	instrumentation_begin();
@@ -355,6 +365,7 @@ static __always_inline void exit_to_user_mode_prepare(struct pt_regs *regs)
  */
 static __always_inline void exit_to_user_mode(void)
 {
+
 	instrumentation_begin();
 	trace_hardirqs_on_prepare();
 	lockdep_hardirqs_on_prepare();
diff --git a/init/main.c b/init/main.c
index c4778edae7972f512d5eefe8400075ac35a70d1c..d19e149d385e8321d2f3e7c28aa75802af62d09c 100644
--- a/init/main.c
+++ b/init/main.c
@@ -953,6 +953,8 @@ void start_kernel(void)
 	/* Architectural and non-timekeeping rng init, before allocator init */
 	random_init_early(command_line);
 
+	asi_init_userspace_class();
+
 	/*
 	 * These use large bootmem allocations and must precede
 	 * initalization of page allocator
diff --git a/kernel/entry/common.c b/kernel/entry/common.c
index 5b6934e23c21d36a3238dc03e391eb9e3beb4cfb..874254ed5958d62eaeaef4fe3e8c02e56deaf5ed 100644
--- a/kernel/entry/common.c
+++ b/kernel/entry/common.c
@@ -218,6 +218,7 @@ __visible noinstr void syscall_exit_to_user_mode(struct pt_regs *regs)
 	__syscall_exit_to_user_mode_work(regs);
 	instrumentation_end();
 	exit_to_user_mode();
+	asi_enter_userspace();
 }
 
 noinstr void irqentry_enter_from_user_mode(struct pt_regs *regs)
diff --git a/kernel/fork.c b/kernel/fork.c
index bb73758790d08112265d398b16902ff9a4c2b8fe..54068d2415939b92409ca8a45111176783c6acbd 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -917,6 +917,7 @@ void __mmdrop(struct mm_struct *mm)
 	/* Ensure no CPUs are using this as their lazy tlb mm */
 	cleanup_lazy_tlbs(mm);
 
+	asi_destroy_userspace(mm);
 	WARN_ON_ONCE(mm == current->active_mm);
 	mm_free_pgd(mm);
 	destroy_context(mm);
@@ -1297,7 +1298,8 @@ static struct mm_struct *mm_init(struct mm_struct *mm, struct task_struct *p,
 	if (mm_alloc_pgd(mm))
 		goto fail_nopgd;
 
-	asi_init_mm_state(mm);
+	if (asi_init_mm_state(mm))
+		goto fail_nocontext;
 
 	if (init_new_context(p, mm))
 		goto fail_nocontext;

-- 
2.47.1.613.gc27f4b7a9f-goog


