Return-Path: <linuxppc-dev+bounces-510-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8631995EA99
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2024 09:35:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WsjC53djLz2yWr;
	Mon, 26 Aug 2024 17:35:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724655743;
	cv=none; b=Y6fsrqisVzNWwq32fTIzs/eycR7xk1fYVlDMvZgit2pUjNStvRShkbvhP9TyERLlLcpGtMPgOLR4Hf0qqB5WweAd0EXh/Jt4uPx8cZNqor2gF9DDG3GtJoudYaoAqj4o6dFquNAIefc0jvjBPGtoGofcwgy7Q3ee9aiY/ISKj867QMFaoQfFlmsItjNc33U7lJFnXGraoj5vYw0RLxFkfSHIohdNYfbIDztzSXwBWqF696zZT9zt3cKFT289cCrtP+QJ0Tu8fTaqJRxR9HJHd90ZjLHpJwyP0FBUeLvxZ3J9C8ord/xb+4NKz2wLJJjMSfsm2fqRxbKGLOSRVTAeFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724655743; c=relaxed/relaxed;
	bh=t1oKofdsKxK0ldQ2tCa0yio0SYsDFNlLCnwbaE19ST0=;
	h=Received:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding; b=Bre+rzVqUbeMmrXEOXpuAphg4WKl3Ex8M/3U0WPaAWgjccx8ywTuJlmuEv3Aktltuk7Oni19+/32Jy2eZb2w6QludjAZjranPtoGlZU5xMkCz8JTVW9MEQAzcUW4UxBXYGlE2Fwqeq60Xh54aq2WaCHRAO/TVcLe1zrQzRm3Gg9ChVpDvg0wUVSaiGKX4egXtfq4lK02PZmesjwfSzz+/y1eodV7Blm7QS9ecG0sRhoec/LqnXevEotb+SL4Xg0CPGFn8aD4yjTb69uKHyEvmMMxcYMjmQAsn7QvWegLIg1Tm6WUD8R4E9BRILaE8Lp2V8C4cQJklPWTfeNEyn3b5Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YhbSmxe0; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YhbSmxe0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WshSb0xY9z2xSM
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2024 17:02:23 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 70A5AA41C59;
	Mon, 26 Aug 2024 07:02:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17547C52771;
	Mon, 26 Aug 2024 06:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724655431;
	bh=V5vgSKLMNC5xDauNsA8Q9sUWVFSHgPBigpP0dkRNui8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YhbSmxe07BA1yJFRiZKO2RvsIZALsjMSoPns6+ARiwj5IzU0ASkQGmtoKb+hh90hS
	 J6BDgg1zhpqDu4VFALJrA8keVSlzcNnojJmSrtAHrdm0i3g+EHsP35vTP7f7gfe6fj
	 upMbgJciteuQOoh50BNTPMeykyZKVoF4YMAanalap68kfwGpncXqPEpJY0yKHsNGxg
	 PaPCzCzmedEwNLxcmR1GbsCwpZ8unLntdigA+zr4dFZmGtAOJ6Ulh6Ng84JE0Ver08
	 ckebHWlrVw/K6qXHl1fJsZxADBkuR+8dAiAZNb74jQsl55r8nweVnEVhDBSb5n0BnB
	 aYOVxtMhEaH6A==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Andreas Larsson <andreas@gaisler.com>,
	Andy Lutomirski <luto@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Borislav Petkov <bp@alien8.de>,
	Brian Cain <bcain@quicinc.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christoph Hellwig <hch@infradead.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Guo Ren <guoren@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Matt Turner <mattst88@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Simek <monstr@monstr.eu>,
	Mike Rapoport <rppt@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>,
	Song Liu <song@kernel.org>,
	Stafford Horne <shorne@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Uladzislau Rezki <urezki@gmail.com>,
	Vineet Gupta <vgupta@kernel.org>,
	Will Deacon <will@kernel.org>,
	bpf@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-mm@kvack.org,
	linux-modules@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-sh@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org,
	linux-um@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH v2 5/8] ftrace: Add swap_func to ftrace_process_locs()
Date: Mon, 26 Aug 2024 09:55:29 +0300
Message-ID: <20240826065532.2618273-6-rppt@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240826065532.2618273-1-rppt@kernel.org>
References: <20240826065532.2618273-1-rppt@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Song Liu <song@kernel.org>

ftrace_process_locs sorts module mcount, which is inside RO memory. Add a
ftrace_swap_func so that archs can use RO-memory-poke function to do the
sorting.

Signed-off-by: Song Liu <song@kernel.org>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 include/linux/ftrace.h |  2 ++
 kernel/trace/ftrace.c  | 13 ++++++++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/include/linux/ftrace.h b/include/linux/ftrace.h
index fd5e84d0ec47..b794dcb7cae8 100644
--- a/include/linux/ftrace.h
+++ b/include/linux/ftrace.h
@@ -1188,4 +1188,6 @@ unsigned long arch_syscall_addr(int nr);
 
 #endif /* CONFIG_FTRACE_SYSCALLS */
 
+void ftrace_swap_func(void *a, void *b, int n);
+
 #endif /* _LINUX_FTRACE_H */
diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index 4c28dd177ca6..9829979f3a46 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -6989,6 +6989,17 @@ static void test_is_sorted(unsigned long *start, unsigned long count)
 }
 #endif
 
+void __weak ftrace_swap_func(void *a, void *b, int n)
+{
+	unsigned long t;
+
+	WARN_ON_ONCE(n != sizeof(t));
+
+	t = *((unsigned long *)a);
+	*(unsigned long *)a = *(unsigned long *)b;
+	*(unsigned long *)b = t;
+}
+
 static int ftrace_process_locs(struct module *mod,
 			       unsigned long *start,
 			       unsigned long *end)
@@ -7016,7 +7027,7 @@ static int ftrace_process_locs(struct module *mod,
 	 */
 	if (!IS_ENABLED(CONFIG_BUILDTIME_MCOUNT_SORT) || mod) {
 		sort(start, count, sizeof(*start),
-		     ftrace_cmp_ips, NULL);
+		     ftrace_cmp_ips, ftrace_swap_func);
 	} else {
 		test_is_sorted(start, count);
 	}
-- 
2.43.0


