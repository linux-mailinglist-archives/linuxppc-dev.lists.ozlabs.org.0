Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5623336F4E5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Apr 2021 06:23:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FWfPJ2X0jz2yxb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Apr 2021 14:23:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport header.b=dkbMWdgV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=cisco.com (client-ip=173.37.86.73; helo=rcdn-iport-2.cisco.com;
 envelope-from=danielwa@cisco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256
 header.s=iport header.b=dkbMWdgV; dkim-atps=neutral
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FWfNL3xCQz2xZ2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Apr 2021 14:22:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=cisco.com; i=@cisco.com; l=1687; q=dns/txt; s=iport;
 t=1619756546; x=1620966146;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TkQgQOtm5mZuEq1qK8DidKTwwGyVW3o6m8nKOrtHYls=;
 b=dkbMWdgV4f8DifQ1Jt1OG8sI6IWh0jh83Q56cCdG3EfOjeNfzRhS9wwA
 xvuUjW0knQltbNaTCvKzoQWf/ciY7yO88OGdbtg0GkiZFB4dgOD+bZBV0
 2+qvzmrktPeFstAYguA0CdqJ8dLuyLKpukhPGOQnSiiBEq/pDiCASj6Q+ I=;
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AmM+Zj6N7o1EybMBcT5z155DYdL4zR+YMi2?=
 =?us-ascii?q?QD/UoZc3BoW+afkN2jm+le6AT9jywfVGpltdeLPqSBRn20z+8Q3aA9NaqvNT?=
 =?us-ascii?q?OJhEKGN4dnhLGJ/xTBHGnE+vdZxeNcdcFFeb7NJHxbqeq/3wWiCdYnx7C8gc?=
 =?us-ascii?q?WVrMPT1W1kQw0vS6wI1WZEIz2WGEF3WwVKbKBRfPGhz/FKqDa6dXMcYt7TPA?=
 =?us-ascii?q?hmY8H4u9bJmJj6CCRoOzcb7mC14A+A2frTDwWfmiwTSSpIxq0vtVLYihXj6r?=
 =?us-ascii?q?+42svLrSP05iv255RSlMCJ8Lt+Lf3JrNQJITPxjQvtQ4JtV9S5zUkIidDqzk?=
 =?us-ascii?q?o2m9/RpBplBeBP0jf6e2G4pgaF4XiH7AoT?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0BVAADbhItg/4cNJK1aHAEBAQEBAQc?=
 =?us-ascii?q?BARIBAQQEAQGCAwcBAQsBAYIpgU0BOTGMaKRRgXwLAQEBDzQEAQGEUAKBewI?=
 =?us-ascii?q?lNAkOAgQBAQwBAQUBAQECAQYEcROFXUMWAYVrBjIBRhBRVwYBEoJxgwioVII?=
 =?us-ascii?q?sgQGIMoFEFIEmAYhsdIN2ByAcgUlChHWIB4IzBIJHgQ+CcpQKinKcPYMagSe?=
 =?us-ascii?q?bcxAmpR2VKp9UhDA1gR86gVkzGggbFYMkUBkOjisWjkshAy84AgYKAQEDCYl?=
 =?us-ascii?q?Og0EBAQ?=
X-IronPort-AV: E=Sophos;i="5.82,260,1613433600"; d="scan'208";a="892827651"
Received: from alln-core-2.cisco.com ([173.36.13.135])
 by rcdn-iport-2.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
 30 Apr 2021 04:22:21 +0000
Received: from zorba.cisco.com ([10.24.18.92])
 by alln-core-2.cisco.com (8.15.2/8.15.2) with ESMTP id 13U4MHxw023118;
 Fri, 30 Apr 2021 04:22:20 GMT
From: Daniel Walker <danielwa@cisco.com>
To: linuxppc-dev@lists.ozlabs.org, x86@kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH 3/3] x86: switch amd mem encrypt to early string functions
Date: Thu, 29 Apr 2021 21:22:16 -0700
Message-Id: <20210430042217.1198052-3-danielwa@cisco.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430042217.1198052-1-danielwa@cisco.com>
References: <20210430042217.1198052-1-danielwa@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 10.24.18.92, [10.24.18.92]
X-Outbound-Node: alln-core-2.cisco.com
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
Cc: xe-linux-external@cisco.com, linux-kernel@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This switched x86 early string users to use the early string variants
and re-enabled KASAN on general string functions use thru out the rest
of the system.

Cc: xe-linux-external@cisco.com
Signed-off-by: Daniel Walker <danielwa@cisco.com>
---
 arch/x86/mm/mem_encrypt_identity.c | 4 ++--
 lib/Makefile                       | 7 -------
 2 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/arch/x86/mm/mem_encrypt_identity.c b/arch/x86/mm/mem_encrypt_identity.c
index 6c5eb6f3f14f..212fe90cf5e2 100644
--- a/arch/x86/mm/mem_encrypt_identity.c
+++ b/arch/x86/mm/mem_encrypt_identity.c
@@ -575,9 +575,9 @@ void __init sme_enable(struct boot_params *bp)
 
 	cmdline_find_option(cmdline_ptr, cmdline_arg, buffer, sizeof(buffer));
 
-	if (!strncmp(buffer, cmdline_on, sizeof(buffer)))
+	if (!early_strncmp(buffer, cmdline_on, sizeof(buffer)))
 		sme_me_mask = me_mask;
-	else if (!strncmp(buffer, cmdline_off, sizeof(buffer)))
+	else if (!early_strncmp(buffer, cmdline_off, sizeof(buffer)))
 		sme_me_mask = 0;
 	else
 		sme_me_mask = active_by_default ? me_mask : 0;
diff --git a/lib/Makefile b/lib/Makefile
index 25cc664f027e..314db12c0e98 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -28,13 +28,6 @@ KASAN_SANITIZE_early_string.nosan.o := n
 
 CFLAGS_early_string.nosan.o += -fno-stack-protector
 
-# Early boot use of cmdline, don't instrument it
-ifdef CONFIG_AMD_MEM_ENCRYPT
-KASAN_SANITIZE_string.o := n
-
-CFLAGS_string.o += -fno-stack-protector
-endif
-
 $(obj)/early_string.nosan.o: $(src)/early_string.c $(recordmcount_source) $(objtool_dep) FORCE
 	$(call if_changed_rule,cc_o_c)
 	$(call cmd,force_checksrc)
-- 
2.25.1

