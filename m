Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A0D70693A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 May 2023 15:13:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QLtp45sSMz3f6h
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 May 2023 23:13:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Fc6SUEmS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Fc6SUEmS;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QLtmP35l7z3f4m
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 May 2023 23:11:49 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EBCE1646FD;
	Wed, 17 May 2023 13:11:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C17AC433A1;
	Wed, 17 May 2023 13:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684329106;
	bh=3mI163DMR4d+cuXu5u65rsW45kyqp2CKp+3eSlb6arE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Fc6SUEmSZTQUkEUQjfQXj6txmruIJCzCuO4Ae3j0P53kfZPDs/OWZkdHVUzrtWv5M
	 0rPrYmGV3lkc2LdVoiXnN0tesbaj+I+HdnU+5OYNZ19tKdQSCcQFdCfF7CIjRf43g3
	 HHrOqIEp3ibRRhUsGRDH+Iul9ef7vI7xGy9SOg7wZXkSxKf5Bbrmmph902wZT+4dAO
	 hkBdrDx6I/lx0He0nfCXC9E/60W8qZMraYv4eYeOaM6lvyD6ZDXWH5H+onPY0eEF1E
	 Z4hxRtdg3qOggQ4VULZzLpo6PInRLslC9REuvbQ434IZjCDyjjo139W2Et9i6tb9pM
	 t75TKQPb0GvKQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 01/14] mm: percpu: unhide pcpu_embed_first_chunk prototype
Date: Wed, 17 May 2023 15:10:49 +0200
Message-Id: <20230517131102.934196-2-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517131102.934196-1-arnd@kernel.org>
References: <20230517131102.934196-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-kselftest@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org, Pavel Machek <pavel@ucw.cz>, Christoph Lameter <cl@linux.com>, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, Paul Moore <paul@paul-moore.com>, linux-sh@vger.kernel.org, Helge Deller <deller@gmx.de>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>, Dennis Zhou <dennis@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Waiman Long <longman@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, kunit-dev@googlegroups.com, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, Eric Paris <eparis
 @redhat.com>, audit@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Tejun Heo <tj@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Arnd Bergmann <arnd@arndb.de>

This function is called whenever CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK
or CONFIG_HAVE_SETUP_PER_CPU_AREA, but only declared when the
former is set:

mm/percpu.c:3055:12: error: no previous prototype for 'pcpu_embed_first_chunk' [-Werror=missing-prototypes]

There is no real point in hiding declarations, so just remove
the #ifdef here.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 include/linux/percpu.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/linux/percpu.h b/include/linux/percpu.h
index 1338ea2aa720..42125cf9c506 100644
--- a/include/linux/percpu.h
+++ b/include/linux/percpu.h
@@ -103,12 +103,10 @@ extern void __init pcpu_free_alloc_info(struct pcpu_alloc_info *ai);
 extern void __init pcpu_setup_first_chunk(const struct pcpu_alloc_info *ai,
 					 void *base_addr);
 
-#ifdef CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK
 extern int __init pcpu_embed_first_chunk(size_t reserved_size, size_t dyn_size,
 				size_t atom_size,
 				pcpu_fc_cpu_distance_fn_t cpu_distance_fn,
 				pcpu_fc_cpu_to_node_fn_t cpu_to_nd_fn);
-#endif
 
 #ifdef CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK
 void __init pcpu_populate_pte(unsigned long addr);
-- 
2.39.2

