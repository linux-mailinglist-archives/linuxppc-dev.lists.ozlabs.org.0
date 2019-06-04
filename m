Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4C43453F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2019 13:19:26 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45J8Zg44xSzDqTL
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2019 21:19:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (mailfrom) smtp.mailfrom=socionext.com
 (client-ip=210.131.2.79; helo=conuserg-12.nifty.com;
 envelope-from=yamada.masahiro@socionext.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.b="zU9GZzrI"; 
 dkim-atps=neutral
Received: from conuserg-12.nifty.com (conuserg-12.nifty.com [210.131.2.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45J8YN6CJ8zDqDF
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jun 2019 21:18:15 +1000 (AEST)
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp
 [153.142.97.92]) (authenticated)
 by conuserg-12.nifty.com with ESMTP id x54BGvLH009633;
 Tue, 4 Jun 2019 20:16:58 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com x54BGvLH009633
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1559647019;
 bh=0QZKxY5pgYied5dcdhzPAVfJ4vw59SmOyFiNqN2eH8Y=;
 h=From:To:Cc:Subject:Date:From;
 b=zU9GZzrIDSRFvCVh22UF0auDxXNQY1UOH1VC8qhSJSrflclWa9p0lSsoH5fzjiYTT
 +4mYPcE3hXLAWcyOeOr0Zts1pGZyCaqkkB2wvG6r+HvJV0nIEnrHcPCOz9TWelrYxh
 uj98l9srM15CKvuhGxgGjHXMDS7H+v0cK6sj5KR8G2rNWQLqmEdaQTUFQrHNYJyxzF
 KYglswUnZ5u4XZnRpld3T1e6sbEtr8WG2AZDafPjNHltAabVyHE95uSdbJYRrOYGpr
 8YTfe0pi8nTwKmFMg3ZkfnlWhWfXrWLtjfBHlphKgBTTQAn4wXgYcuQ/Ir6502MGW7
 PzSsqx3DC0tYQ==
X-Nifty-SrcIP: [153.142.97.92]
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: Frederic Barrat <fbarrat@linux.ibm.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] ocxl: do not use C++ style comments in uapi header
Date: Tue,  4 Jun 2019 20:16:32 +0900
Message-Id: <20190604111632.22479-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Arnd Bergmann <arnd@arndb.de>, Greg KH <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 Masahiro Yamada <yamada.masahiro@socionext.com>, Joe Perches <joe@perches.com>,
 Thomas Gleixner <tglx@linutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Linux kernel tolerates C++ style comments these days. Actually, the
SPDX License tags for .c files start with //.

On the other hand, uapi headers are written in more strict C, where
the C++ comment style is forbidden.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 include/uapi/misc/ocxl.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/uapi/misc/ocxl.h b/include/uapi/misc/ocxl.h
index 97937cfa3baa..6d29a60a896a 100644
--- a/include/uapi/misc/ocxl.h
+++ b/include/uapi/misc/ocxl.h
@@ -33,23 +33,23 @@ struct ocxl_ioctl_attach {
 };
 
 struct ocxl_ioctl_metadata {
-	__u16 version; // struct version, always backwards compatible
+	__u16 version; /* struct version, always backwards compatible */
 
-	// Version 0 fields
+	/* Version 0 fields */
 	__u8  afu_version_major;
 	__u8  afu_version_minor;
-	__u32 pasid;		// PASID assigned to the current context
+	__u32 pasid;		/* PASID assigned to the current context */
 
-	__u64 pp_mmio_size;	// Per PASID MMIO size
+	__u64 pp_mmio_size;	/* Per PASID MMIO size */
 	__u64 global_mmio_size;
 
-	// End version 0 fields
+	/* End version 0 fields */
 
-	__u64 reserved[13]; // Total of 16*u64
+	__u64 reserved[13]; /* Total of 16*u64 */
 };
 
 struct ocxl_ioctl_p9_wait {
-	__u16 thread_id; // The thread ID required to wake this thread
+	__u16 thread_id; /* The thread ID required to wake this thread */
 	__u16 reserved1;
 	__u32 reserved2;
 	__u64 reserved3[3];
-- 
2.17.1

