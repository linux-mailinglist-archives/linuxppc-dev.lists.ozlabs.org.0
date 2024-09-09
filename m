Return-Path: <linuxppc-dev+bounces-1170-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A145A970E4A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Sep 2024 08:49:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X2HVy1pxSz2yMv;
	Mon,  9 Sep 2024 16:49:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725864554;
	cv=none; b=WD2UHfADTv5VSOevtWfkzE8C+qKQHQMPiefLehyQuf6YiCu6xIDvbEpX/izzvNtjLqA/0l94kLVPTSJP0g8h2aOqpuzmHByguhTp0HZknamjtKdmLLy5DVtSeVIYNcelYCGJo1rZx/VNZC9oQuh964wla+LSOqRO32iyGK6P1wz/ll2WzaQ2lwCfRgEye68iCUrp4OKplB1Wh8OJE8zK+LYhTLNPORC4wgiH9TBUhcAM6QxX6zH3I82VP9zIZkv8xLxDM7UdtldDIsN7DmjdiynX0PfaimCg+ZG1TSx0/CtN9qHM7yBNL44c3UeKD3oobDhcvdqYqxntPJXNX5TjuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725864554; c=relaxed/relaxed;
	bh=E/8oKQWQ1fglLyTxHETDdJztnkJGSyY84+n1OIbt7tI=;
	h=DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version; b=AlqfNNqIaqHfC/m++5cRQ1he6xno5LHFC6hcx1OgzcUFPnxMCd9mKDnazNEocZyxC2nGSthgoH10W8ye3xtbbOQShy5I2Jgv1pT9z1JVS5iq0IzcrC8hVYjTKaX9mMR77dU/5kpoisHuQzNt3PlTQBRykR/TAkPjctFWC7SfzbOFWTxfdk0VpHZjG4Eumh5umb+SXYMtWpGXIUui+E1vl8r6yRWfejUfvONxrAb68kdSDiS1HGor0W1Ea2U6cPquL2C8Sj5gxsAx3PO7Dc7tNQHW7aMfznKC1Rb/fzbGKNiHBgdbxjEHUfiF1oDZ2vPSQbqcjJofr9FlG/ldWFxxRQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gE5rHksS; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gE5rHksS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X2HVx5cyKz2yMD
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Sep 2024 16:49:13 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 225E9A4272E;
	Mon,  9 Sep 2024 06:49:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4244C4CECA;
	Mon,  9 Sep 2024 06:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725864551;
	bh=X9sfhUFgPK5V3fglnGNo5sHB9wMPevyPr+qKgRxwoik=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gE5rHksSDO3uZ8d+BpxC3iCqxZ+t+kYtAmK8ij3ReKzOLwADAXD1KPV81Gv59cLJB
	 QeffyMC9I/10+jXBXTc3t+0L43Q/5LUUYAuSWRRkqMF1qUTuLgE0CHJfsn1QJzpnCc
	 vpbE4JzC9jBNebxwgUnNlq4/NCkpYAMAlNBdq0T9QBn3F+30lZRo0AKiT/LUxF50CU
	 ovqI5rDJnLv1Xkn6214K1cbtBxdD6gx3ThLFeZUH9qVKkVoE+XrXj8aDCwlWIX7+qy
	 pjaJ4YltFeHWHyE9MeOm4kT8zBk9Qw94w2NQP5QJetbV7d9rtaQpBgupHNkhqraFay
	 cord90B6KD2bQ==
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
Subject: [PATCH v3 5/8] ftrace: Add swap_func to ftrace_process_locs()
Date: Mon,  9 Sep 2024 09:47:27 +0300
Message-ID: <20240909064730.3290724-6-rppt@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240909064730.3290724-1-rppt@kernel.org>
References: <20240909064730.3290724-1-rppt@kernel.org>
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
 kernel/trace/ftrace.c  | 19 ++++++++++++++++++-
 2 files changed, 20 insertions(+), 1 deletion(-)

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
index 4c28dd177ca6..95bb9b52ab36 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -6989,6 +6989,23 @@ static void test_is_sorted(unsigned long *start, unsigned long count)
 }
 #endif
 
+/*
+ * ftrace_process_locs sorts module mcount, which might be inside RO
+ * memory.
+ * ftrace_swap_func allows architectures to use RO-memory-poke function to
+ * do the sorting.
+ */
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
@@ -7016,7 +7033,7 @@ static int ftrace_process_locs(struct module *mod,
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


