Return-Path: <linuxppc-dev+bounces-6026-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09EC7A2E8AD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Feb 2025 11:07:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ys0ct3spgz2yn9;
	Mon, 10 Feb 2025 21:07:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:1004:224b::aa"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739182062;
	cv=none; b=eHihotD0YL2mUhwlGt0gYfzZyTXnAXvsHZX9O1JVqcX0Et3GBuJUxCSXI0z91/BAn+h8z2ly9UA5TVfREA2kgDAZ/SVfghlt2IhmFWqpPC90PIf4gCkT25HCNAjAYsd5E+klSs0C4gq/ePxgfuAy0cyo6B84frtpY98/3QTysCTmw80DBp+iHul6/r4ujo5SrKb4mPZlbGQjWRpxxzDdxPjCbK04w/P/zlMMNJVsS0pLdQba4FDWLY8qHXc4M+3cozggzWJm+tr1DjbZyY7tF332UoCLlf1exV0vFk38HH1Y6LX041bo9kTW8No4/rPTV+p5lce3WCkV83aLMNuaYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739182062; c=relaxed/relaxed;
	bh=zzp1WaG1POUvvccWRbF+ncZqgOZGseBWxYU9NWcpXLs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KjAOYSgpYnel9ECWsFYjB504cgECuYl5U3AvfzzfN3ErdVNiiajVGskzkF2MCXKoLa2FpeNTDX6g8NmuJKdGBiedAVSsrLg0kS2gaHROKBOYfo0RHHj0bkBgvfaz+/9CAvijSSU9MzaQavvd0HQl7BCn2MJCQre9awJUo/NFuocrchOJP5ect84xe2W4oX0mYTgFYRibN9rrvs1Qor+CeWtZeZIcXzPPgStMAgy1pop15+2MfS9LfNmeW5DIi5KrmhFBTA9TkvfyhMiNzxdD/SnHEd+t+u6158WaUxsDrZh6hEedZwuOxXysSVhadiKqwkdSCdSBrYqylXGXWSLAug==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=c02SMLqg; dkim-atps=neutral; spf=pass (client-ip=2001:41d0:1004:224b::aa; helo=out-170.mta0.migadu.com; envelope-from=thorsten.blum@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=c02SMLqg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:1004:224b::aa; helo=out-170.mta0.migadu.com; envelope-from=thorsten.blum@linux.dev; receiver=lists.ozlabs.org)
Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [IPv6:2001:41d0:1004:224b::aa])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ys0cq3NQbz2y92
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Feb 2025 21:07:37 +1100 (AEDT)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1739182037;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zzp1WaG1POUvvccWRbF+ncZqgOZGseBWxYU9NWcpXLs=;
	b=c02SMLqgN1gpepKc/mxxuzLgp8mK9gTEhsw0r+h6m+9C5Khfrb1tengXQJT1ury1V0kCfV
	iX3yWec4waM95BSGt5vw0CaejgZK/IFw95Q8JUgSSxPZSXQ8S62QLzfLOvGJD31v7nMzwB
	2+h9Dfz78pYnbr9dLfA/D0K7tj/nRXs=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc/mm/fault: Use str_write_read() helper function
Date: Mon, 10 Feb 2025 11:06:46 +0100
Message-ID: <20250210100648.1440-2-thorsten.blum@linux.dev>
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

Remove hard-coded strings by using the str_write_read() helper function.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/powerpc/mm/fault.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index c156fe0d53c3..806c74e0d5ab 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -17,6 +17,7 @@
 #include <linux/kernel.h>
 #include <linux/errno.h>
 #include <linux/string.h>
+#include <linux/string_choices.h>
 #include <linux/types.h>
 #include <linux/pagemap.h>
 #include <linux/ptrace.h>
@@ -218,7 +219,7 @@ static bool bad_kernel_fault(struct pt_regs *regs, unsigned long error_code,
 	// Read/write fault blocked by KUAP is bad, it can never succeed.
 	if (bad_kuap_fault(regs, address, is_write)) {
 		pr_crit_ratelimited("Kernel attempted to %s user page (%lx) - exploit attempt? (uid: %d)\n",
-				    is_write ? "write" : "read", address,
+				    str_write_read(is_write), address,
 				    from_kuid(&init_user_ns, current_uid()));
 
 		// Fault on user outside of certain regions (eg. copy_tofrom_user()) is bad
@@ -625,7 +626,7 @@ static void __bad_page_fault(struct pt_regs *regs, int sig)
 	case INTERRUPT_DATA_STORAGE:
 	case INTERRUPT_H_DATA_STORAGE:
 		pr_alert("BUG: %s on %s at 0x%08lx\n", msg,
-			 is_write ? "write" : "read", regs->dar);
+			 str_write_read(is_write), regs->dar);
 		break;
 	case INTERRUPT_DATA_SEGMENT:
 		pr_alert("BUG: %s at 0x%08lx\n", msg, regs->dar);
-- 
2.48.0


