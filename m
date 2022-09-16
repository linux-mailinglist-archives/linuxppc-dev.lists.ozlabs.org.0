Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7E75BA59F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 06:10:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MTLFs6t0vz3cCD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 14:10:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=cveJIIEo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d; helo=mail-pj1-x102d.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=cveJIIEo;
	dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MTLCP0RQ7z3bbj
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Sep 2022 14:08:16 +1000 (AEST)
Received: by mail-pj1-x102d.google.com with SMTP id x1-20020a17090ab00100b001fda21bbc90so24389794pjq.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Sep 2022 21:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=xqjBga+6XbGptpb0rb3aHgGnjLc0TWSRyuonhzQh2hw=;
        b=cveJIIEo4vkB5MCyclVdFZ2eSws7U8MayI+qseH4U0KROScly8bUl30Yqc9XXC8r43
         iUVhsdnZsBBmB05ejVVMpD/x32a4DkkxKaBxPeUdyPkp2Y6MrN9sGcdQbvnUMOYpjJMD
         oat/yoxb1yjFQSfEpgoYDXPJMv1hej9ock1o2HN34VyMFUylqyxWJ7DoUEowriwruBv9
         2wi6eXfVbFtu45zo5ftX6iDPKSKoMx5ypwIYVS9HND0gzZUVtFmaAzlLcj1qCdpRvGZB
         XevIRiIg9dJAL453ck/tsRfGFP0emR6J75BbBqC8Et5K/pBvi1QYm9ZWf/pz9BfuriKS
         9v1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=xqjBga+6XbGptpb0rb3aHgGnjLc0TWSRyuonhzQh2hw=;
        b=anUKLMQ0654ImVuuroXeoa4MBHNyoUVv2RcJd/SekJIDHy/zVxtbLwwIPK/W8K/VQ0
         QBNX72An6RXPxWtq0++N1YdiaJzyo7zNkf5tBoyVIRA+Wc0SFhubIWYON5FYUfhRXUzS
         UHZy1E+KxYR0/RPWhMT+6zvoIZHCoXsTVD5LICqzhBPrSD9JoLXfZ9GFdFScnCAZ9+Fd
         dumpEKibRnhRzEIKhTz9aVzIo8yKJDKI/JkJE1yrfLDbdBMpM29fBoyOxtOlRRWbwUcj
         hcmsI5FXcK9WcHBo1FDhJ7JQE5KD8oZsGDEns/sDbvxiQfP6iRdd7i9tIzoHnizmjvh0
         OtLw==
X-Gm-Message-State: ACrzQf34Cx1Qt6Ehkpnz3GJPAghtYHP6Hpo8z2YZitCvg+lkuiTKrSID
	p6vL+3sLuuJVJPzWKDq6qmrJd2SFzd8=
X-Google-Smtp-Source: AMsMyM6KXqCb+CbbIY473wKOnw3jXVRJ8gFX9gXe1M6VX9B2/vsZ020QKUn5unzg35oupLIWs99lLg==
X-Received: by 2002:a17:90b:254a:b0:200:53f:891d with SMTP id nw10-20020a17090b254a00b00200053f891dmr3388092pjb.168.1663301294458;
        Thu, 15 Sep 2022 21:08:14 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (193-116-127-167.tpgi.com.au. [193.116.127.167])
        by smtp.gmail.com with ESMTPSA id t6-20020a1709027fc600b0017534ffd491sm13696816plb.163.2022.09.15.21.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 21:08:13 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 3/7] powerpc/build: move got, toc, plt, branch_lt sections to read-only
Date: Fri, 16 Sep 2022 14:07:51 +1000
Message-Id: <20220916040755.2398112-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220916040755.2398112-1-npiggin@gmail.com>
References: <20220916040755.2398112-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This moves linker-related tables from .data to read-only area.
Relocations are performed at early boot time before memory is protected,
after which there should be no modifications required.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/vmlinux.lds.S | 42 ++++++++++++++++++++-----------
 1 file changed, 27 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
index 607b17b1e785..16c4389d498d 100644
--- a/arch/powerpc/kernel/vmlinux.lds.S
+++ b/arch/powerpc/kernel/vmlinux.lds.S
@@ -131,6 +131,10 @@ SECTIONS
 	/* Read-only data */
 	RO_DATA(PAGE_SIZE)
 
+	.branch_lt : AT(ADDR(.branch_lt) - LOAD_OFFSET) {
+		*(.branch_lt)
+	}
+
 #ifdef CONFIG_PPC32
 	.got1 : AT(ADDR(.got1) - LOAD_OFFSET) {
 		*(.got1)
@@ -140,7 +144,30 @@ SECTIONS
 		*(.got2)
 		__got2_end = .;
 	}
+	.got : AT(ADDR(.got) - LOAD_OFFSET) SPECIAL {
+		*(.got)
+		*(.got.plt)
+	}
+	.plt : AT(ADDR(.plt) - LOAD_OFFSET) SPECIAL {
+		/* XXX: is .plt (and .got.plt) required? */
+		*(.plt)
+	}
+
 #else /* CONFIG_PPC32 */
+	.toc1 : AT(ADDR(.toc1) - LOAD_OFFSET) {
+		*(.toc1)
+	}
+
+	.got : AT(ADDR(.got) - LOAD_OFFSET) ALIGN(256) {
+		*(.got)
+#ifndef CONFIG_RELOCATABLE
+		__prom_init_toc_start = .;
+		arch/powerpc/kernel/prom_init.o*(.toc)
+		__prom_init_toc_end = .;
+#endif
+		*(.toc)
+	}
+
 	SOFT_MASK_TABLE(8)
 	RESTART_TABLE(8)
 
@@ -327,26 +354,11 @@ SECTIONS
 		*(.data.rel*)
 		*(SDATA_MAIN)
 		*(.sdata2)
-		*(.got.plt) *(.got)
-		*(.plt)
-		*(.branch_lt)
 	}
 #else
 	.data : AT(ADDR(.data) - LOAD_OFFSET) {
 		DATA_DATA
 		*(.data.rel*)
-		*(.toc1)
-		*(.branch_lt)
-	}
-
-	.got : AT(ADDR(.got) - LOAD_OFFSET) ALIGN(256) {
-		*(.got)
-#ifndef CONFIG_RELOCATABLE
-		__prom_init_toc_start = .;
-		arch/powerpc/kernel/prom_init.o*(.toc)
-		__prom_init_toc_end = .;
-#endif
-		*(.toc)
 	}
 #endif
 
-- 
2.37.2

