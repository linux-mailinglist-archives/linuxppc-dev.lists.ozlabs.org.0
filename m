Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 608AF372B45
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 15:45:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZLhf2q9nz30D8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 23:45:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=m8TG5dvT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=m8TG5dvT; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZLhC1gFwz2yYm
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 May 2021 23:45:30 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4FZLh947fKz9sRf; Tue,  4 May 2021 23:45:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1620135929;
 bh=TiZIibgBklOGr0ceOIIAZrCutatbELwfRsHZKoe/Fl4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=m8TG5dvTLpHBrb0EalolYC1wBauuyj4sjItISTOgNlTPs3ts91SEDewn6h5Bnufzk
 TJEXcJuLacDJAOcB/4MyEUVVP+o71VR8yrRLnBDwfvVGv+7WPKon3SD3R1FH8K1xJO
 WrRJEvuWOM8wfvYEobv/tbzW2sP92Y/gE+ZqCqNbm8ia34GXVqihVqARVFmWoArHJG
 IluiSi1+K76kJ1oxyn744lshiENn8i4QRYL/O9jtsOcz47HsYZefny6RuKZS0vF6M/
 ZWoCqb3q+3ayBHIXBaQqd/vxhQCfgEEJ9gsusnM44eD9r4MVIPVTOiJCz+gstSwyeM
 wV6tPlniPgsvA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/2] powerpc/64s: Fix crashes when toggling entry flush barrier
Date: Tue,  4 May 2021 23:42:50 +1000
Message-Id: <20210504134250.890401-2-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210504134250.890401-1-mpe@ellerman.id.au>
References: <20210504134250.890401-1-mpe@ellerman.id.au>
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
Cc: nathanl@linux.ibm.com, anton@samba.org, npiggin@gmail.com, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The entry flush mitigation can be enabled/disabled at runtime via a
debugfs file (entry_flush), which causes the kernel to patch itself to
enable/disable the relevant mitigations.

However depending on which mitigation we're using, it may not be safe to
do that patching while other CPUs are active. For example the following
crash:

  sleeper[15639]: segfault (11) at c000000000004c20 nip c000000000004c20 lr c000000000004c20

Shows that we returned to userspace with a corrupted LR that points into
the kernel, due to executing the partially patched call to the fallback
entry flush (ie. we missed the LR restore).

Fix it by doing the patching under stop machine. The CPUs that aren't
doing the patching will be spinning in the core of the stop machine
logic. That is currently sufficient for our purposes, because none of
the patching we do is to that code or anywhere in the vicinity.

Fixes: f79643787e0a ("powerpc/64s: flush L1D on kernel entry")
Cc: stable@vger.kernel.org # v5.10+
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/lib/feature-fixups.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/lib/feature-fixups.c b/arch/powerpc/lib/feature-fixups.c
index 8f8c8c98a6ac..679833564e19 100644
--- a/arch/powerpc/lib/feature-fixups.c
+++ b/arch/powerpc/lib/feature-fixups.c
@@ -299,8 +299,9 @@ void do_uaccess_flush_fixups(enum l1d_flush_type types)
 						: "unknown");
 }
 
-void do_entry_flush_fixups(enum l1d_flush_type types)
+static int __do_entry_flush_fixups(void *data)
 {
+	enum l1d_flush_type types = (enum l1d_flush_type)data;
 	unsigned int instrs[3], *dest;
 	long *start, *end;
 	int i;
@@ -369,6 +370,19 @@ void do_entry_flush_fixups(enum l1d_flush_type types)
 							: "ori type" :
 		(types &  L1D_FLUSH_MTTRIG)     ? "mttrig type"
 						: "unknown");
+
+	return 0;
+}
+
+void do_entry_flush_fixups(enum l1d_flush_type types)
+{
+	/*
+	 * The call to the fallback flush can not be safely patched in/out while
+	 * other CPUs are executing it. So call __do_entry_flush_fixups() on one
+	 * CPU while all other CPUs spin in the stop machine core with interrupts
+	 * hard disabled.
+	 */
+	stop_machine_cpuslocked(__do_entry_flush_fixups, (void *)types, NULL);
 }
 
 void do_rfi_flush_fixups(enum l1d_flush_type types)
-- 
2.25.1

