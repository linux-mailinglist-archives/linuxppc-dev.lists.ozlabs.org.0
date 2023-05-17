Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D493970696C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 May 2023 15:14:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QLtqv5Mfgz3f7v
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 May 2023 23:14:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EYIGhjsk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EYIGhjsk;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QLtmg6gPlz3fBD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 May 2023 23:12:03 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 49DC4646FF;
	Wed, 17 May 2023 13:12:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E14AC433A1;
	Wed, 17 May 2023 13:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684329121;
	bh=ZEuLmqNfBu4LwIeDkvzu7YMjKyFq0rMolN8SHAt1hRo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EYIGhjskS/xv5B1p/ij9PND0/tmwkdiUYlvegDshPwFUbpxuTFyigABp4MTrw0TuQ
	 P78r6F9mokfxX2GOn5NNxJ7Y8gpKeQ2JIJPOlwKyXwrocJSsJPMgZ5so90ndZnWLIH
	 aGDrxnHeZ7PSsfX8ujY8+iBUJh64lKQ8tuj1W6/9ZjHk9UY72TP6XbnI7D4PlCH7We
	 aaUModTzCCSrDAZVc+++qyvzPpkjq5ahpjt1CIVik3sjBmumD9LM7YmBA788qeLjcM
	 2OMcn8FcIbxKuRPscWnHIx9nPzp5O441qpjTVop2Tg6G0Jcnayutfz950N7PCb338P
	 sb4vFIfH5scjQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 03/14] mm: sparse: mark populate_section_memmap() static
Date: Wed, 17 May 2023 15:10:51 +0200
Message-Id: <20230517131102.934196-4-arnd@kernel.org>
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

There are two definitions of this function, but the second one
lacks the 'static' annotation:

mm/sparse.c:704:25: error: no previous prototype for 'populate_section_memmap' [-Werror=missing-prototypes]

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 mm/sparse.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/sparse.c b/mm/sparse.c
index c2afdb26039e..b8d5d58fe240 100644
--- a/mm/sparse.c
+++ b/mm/sparse.c
@@ -701,7 +701,7 @@ static int fill_subsection_map(unsigned long pfn, unsigned long nr_pages)
 	return rc;
 }
 #else
-struct page * __meminit populate_section_memmap(unsigned long pfn,
+static struct page * __meminit populate_section_memmap(unsigned long pfn,
 		unsigned long nr_pages, int nid, struct vmem_altmap *altmap,
 		struct dev_pagemap *pgmap)
 {
-- 
2.39.2

