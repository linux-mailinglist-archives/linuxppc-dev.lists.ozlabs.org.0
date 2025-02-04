Return-Path: <linuxppc-dev+bounces-5822-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82573A27652
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Feb 2025 16:45:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YnSPp00Mnz2yYJ;
	Wed,  5 Feb 2025 02:45:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:1004:224b::ae"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738683949;
	cv=none; b=bCpXNi3n9qdHBXNriEvWzJPDWLI6fOgPsyNMbRZke9wHqrd+bYwyypIvFntfOsoxgsRvwDe6EX/AkKc7/EJ2xdRrq1HayFJcWE7hUYNadXj4LtkvD0OH5eR9PKSO3AKYiHbBgDRtoQuwrZRf4pAy9faPPmW80Ebby/7UZlLaY27PGTKqvx+jKAzZ8qTyu1Yuo2AovHqQxO8bWBIyFQTFooBujJbKi0GUCWTe+qGkSo7r1bLfMx2owtXM4/dRvkjXa4KtSnIGO/Q56mK/1ndj78kODIpUvqmfEhFDyPN9i7A5dMWDaz8V4Nzpsb4g+Qq9hpVRpTWCH/CAiUJNwZiVFA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738683949; c=relaxed/relaxed;
	bh=HV8F/QPONcXmwgU3Iqo9jmtTqj8w2A6vXUojkBDn4XI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ne+fDkElckHsLt4Q5MMx+ohZPbPdquNu9mVYVUee4eldPF2IcBp4upBHcX9DaibGKaX/Yg+W5o8PWz4mR+OJYgYk/sdiq+KDpwfvm49X/tjSJ8u8nxGsVyphCj4H4K2XMpBNgY0eH6xdEB9cJVuD+4eur6WZ4Mz8CX03HSNooDdu0rb8Nyini6dMYMO3fl+p6g5iExBj1TDWZeCmPojWl5sxnvVHXLcwsONnze8HLnhOkr5iMSEQ052kbH38I8R/2jNdFcO6UV0ECLIiSY52j1WAQeyQ8LGEKjafRQnG5+uRl+ijUpAZGVwmYlRHeYyZCTybMhOGsQIG+k+n93+swg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass (client-ip=2001:41d0:1004:224b::ae; helo=out-174.mta0.migadu.com; envelope-from=thorsten.blum@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:1004:224b::ae; helo=out-174.mta0.migadu.com; envelope-from=thorsten.blum@linux.dev; receiver=lists.ozlabs.org)
Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [IPv6:2001:41d0:1004:224b::ae])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YnSPh0gs0z2yLB
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Feb 2025 02:45:43 +1100 (AEDT)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738683913;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HV8F/QPONcXmwgU3Iqo9jmtTqj8w2A6vXUojkBDn4XI=;
	b=IkxMHlWEOWz1bJJ4ijXGuhcWv92foF8HM/3nkXf+hNjSoQGa1geTG4kHuASkF6/j39T/Jl
	p4dZnU8Bdw4BL8ie0B294nQzOUhbe3yNZ5cYzkxP2GBQ5lALZrGVlk09onMm9yAudmn6nN
	5w0WLhfnLySrXyQB3ud+kUS0F6fLoL0=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Ricardo B. Marliere" <ricardo@marliere.net>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc: mpic: Use str_enabled_disabled() helper function
Date: Tue,  4 Feb 2025 16:44:23 +0100
Message-ID: <20250204154424.4231-2-thorsten.blum@linux.dev>
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Remove hard-coded strings by using the str_enabled_disabled() helper
function.

Use pr_debug() instead of printk(KERN_DEBUG) to silence a checkpatch
warning.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/powerpc/sysdev/mpic.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/sysdev/mpic.c b/arch/powerpc/sysdev/mpic.c
index d94cf36b0f65..25fc4ac91814 100644
--- a/arch/powerpc/sysdev/mpic.c
+++ b/arch/powerpc/sysdev/mpic.c
@@ -27,6 +27,7 @@
 #include <linux/spinlock.h>
 #include <linux/pci.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 #include <linux/syscore_ops.h>
 #include <linux/ratelimit.h>
 #include <linux/pgtable.h>
@@ -474,9 +475,9 @@ static void __init mpic_scan_ht_msi(struct mpic *mpic, u8 __iomem *devbase,
 		addr = addr | ((u64)readl(base + HT_MSI_ADDR_HI) << 32);
 	}
 
-	printk(KERN_DEBUG "mpic:   - HT:%02x.%x %s MSI mapping found @ 0x%llx\n",
-		PCI_SLOT(devfn), PCI_FUNC(devfn),
-		flags & HT_MSI_FLAGS_ENABLE ? "enabled" : "disabled", addr);
+	pr_debug("mpic:   - HT:%02x.%x %s MSI mapping found @ 0x%llx\n",
+		 PCI_SLOT(devfn), PCI_FUNC(devfn),
+		 str_enabled_disabled(flags & HT_MSI_FLAGS_ENABLE), addr);
 
 	if (!(flags & HT_MSI_FLAGS_ENABLE))
 		writeb(flags | HT_MSI_FLAGS_ENABLE, base + HT_MSI_FLAGS);
-- 
2.48.0


