Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8201A374EB4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 06:50:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FbLk23Np7z3bTx
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 14:50:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=AVTqsjB0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=AVTqsjB0; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FbLjX3Cmhz2xZ3
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 May 2021 14:50:08 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4FbLjS3jt8z9sV5; Thu,  6 May 2021 14:50:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1620276604;
 bh=mJk3DGC/2CQn+3l5rJyvGnmGANc+684YGmmMx+++wt0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AVTqsjB0bMZNQ8u1NrDH9Q6LGDYRzfdTwWYd4qfLbEzolYfZ2cK1SK97UqaDS2ekx
 vNjiru36yQzv3IB5PVbaFijR5gWNBLAbRcywB3tZANqMmFpG8cyedBWU1iyVSynreD
 RnhF7yXKFqOIU7OecB1p8zocy97YVmjkMx9Y8vA7p0g/BgrNuB9P3V91GiwYALO6XX
 ETxXs+H2TSypdvfGYHK6Mt+Un/W19g1LbJCs9GPSLORgiX9qx2m3RRpFYNfiTAzLqt
 jBmon5cUlkR23LQLDaGPZ/q68pa4mycRucSyOMngUkd2k1KRl7/0h5Xlzv4SAXLNyK
 pCiE/rYlNeSXw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 2/2] powerpc/64s: Fix crashes when toggling entry flush
 barrier
Date: Thu,  6 May 2021 14:49:59 +1000
Message-Id: <20210506044959.1298123-2-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210506044959.1298123-1-mpe@ellerman.id.au>
References: <20210506044959.1298123-1-mpe@ellerman.id.au>
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

v2: Fix the bugs.
    Pass a pointer to types, rather than wedging into the void *.
    Use stop_machine().

diff --git a/arch/powerpc/lib/feature-fixups.c b/arch/powerpc/lib/feature-fixups.c
index 10083add8b33..0aefa6a4a259 100644
--- a/arch/powerpc/lib/feature-fixups.c
+++ b/arch/powerpc/lib/feature-fixups.c
@@ -299,8 +299,9 @@ void do_uaccess_flush_fixups(enum l1d_flush_type types)
 						: "unknown");
 }
 
-void do_entry_flush_fixups(enum l1d_flush_type types)
+static int __do_entry_flush_fixups(void *data)
 {
+	enum l1d_flush_type types = *(enum l1d_flush_type *)data;
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
+	stop_machine(__do_entry_flush_fixups, &types, NULL);
 }
 
 void do_rfi_flush_fixups(enum l1d_flush_type types)
-- 
2.25.1

