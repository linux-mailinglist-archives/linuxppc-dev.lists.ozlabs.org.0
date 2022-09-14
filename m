Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 544355B8C43
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Sep 2022 17:51:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MSPvh15rjz3f6g
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Sep 2022 01:51:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Jr6e09q2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Jr6e09q2;
	dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MSPqp4qPFz3blb
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Sep 2022 01:48:06 +1000 (AEST)
Received: by mail-pj1-x1030.google.com with SMTP id x1-20020a17090ab00100b001fda21bbc90so19426571pjq.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Sep 2022 08:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=wLFF1Utp08/9v1deXG6kJe1MWo/7JPmqFzpswU3seJU=;
        b=Jr6e09q2xZDyt5Q9eHtgnEU8DY9KLvVwYL/XqvOA0n+6kR8ZZsQM3PBnBY2x80ehoY
         2hMZ/lIhgy24vVDbvZAhbl/TxsgZK11nOhThTxmGVLy2wxLaE7QXISrE7bHkwqRN97YS
         iBI/YeUz2WSGBhTaCbQ+WoTV5LKYS8ydgX762iX+d32I/AJQL3ucokru1hljpac/yODa
         F2KFyFUfT5PtZB2WUqcKdt6LgSh1MKnPz1CdmXeyis+KSl5sAkopBVxrDeCYw/q5Uekc
         u0KY06jFd8RXDflEObAn+XmlN3QoXK63g0DM4Gh+BrP3ZH+oGrc+jDY96ST4bXqok7KL
         J6Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=wLFF1Utp08/9v1deXG6kJe1MWo/7JPmqFzpswU3seJU=;
        b=Q89V076WD+q5Y7oZAeP4agveQD6+EZmQ8SJz/HIODD83DRDFNIxUFsTJ39s1aVjPLX
         W+ke2XrqdhJBlMU2TG4VvvMLoOwygjYGEeIXzoYqULfO03qGbNTemnMhyzAjKv7esQlb
         DGzaFbWCA8s8y5r270Ntt/caRFjYapJAkMWtmyo/rFGj42QzySnIhVdvRRXZPMBZg5PF
         r1T7ZOnzlGlKy0eYppyFh8Lq+sRUagyPMxqnHK5wYoJFQWZTwZ47rgmBEUjzNC4NjAzY
         amLQNYSD3k+DVPval4SmLqFvfzrS4FDWJlXLwmBrTgxmykFEI94FaiIiXf71FEvYKY+P
         7aCA==
X-Gm-Message-State: ACgBeo12Lup6qGQ2u7XcQQWgUzbxy97SlFp/PGJ81dxgAILoXjgH6UwF
	BF6AKR8NON6wYIX0e/6g/S8hfTM1H74=
X-Google-Smtp-Source: AA6agR536HQiIUsPSUt9O5NSLCeUjrddI/0uwa0rNVNxkI3V/oY5u0yCRCG+JCdIcxP156cLnAvQ+g==
X-Received: by 2002:a17:902:ccd1:b0:176:6eb8:37b2 with SMTP id z17-20020a170902ccd100b001766eb837b2mr38103097ple.69.1663170485767;
        Wed, 14 Sep 2022 08:48:05 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([118.210.107.131])
        by smtp.gmail.com with ESMTPSA id i7-20020a17090332c700b00177e263303dsm9919892plr.183.2022.09.14.08.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 08:48:05 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 5/7] powerpc/build: move .data.rel.ro, .sdata2 to read-only
Date: Thu, 15 Sep 2022 01:47:44 +1000
Message-Id: <20220914154746.1122482-6-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220914154746.1122482-1-npiggin@gmail.com>
References: <20220914154746.1122482-1-npiggin@gmail.com>
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

.sdata2 is a readonly small data section for ppc32, and .data.rel.ro
is data that needs relocating but is read-only after that so these
can both be moved to the read only memory region.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/vmlinux.lds.S | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
index 716fff86c3fd..44050863032e 100644
--- a/arch/powerpc/kernel/vmlinux.lds.S
+++ b/arch/powerpc/kernel/vmlinux.lds.S
@@ -131,6 +131,16 @@ SECTIONS
 	/* Read-only data */
 	RO_DATA(PAGE_SIZE)
 
+#ifdef CONFIG_PPC32
+	.sdata2 : AT(ADDR(.sdata2) - LOAD_OFFSET) {
+		*(.sdata2)
+	}
+#endif
+
+	.data.rel.ro : AT(ADDR(.data.rel.ro) - LOAD_OFFSET) {
+		*(.data.rel.ro*)
+	}
+
 	.branch_lt : AT(ADDR(.branch_lt) - LOAD_OFFSET) {
 		*(.branch_lt)
 	}
@@ -348,19 +358,13 @@ SECTIONS
 	. = ALIGN(PAGE_SIZE);
 	_sdata = .;
 
-#ifdef CONFIG_PPC32
 	.data : AT(ADDR(.data) - LOAD_OFFSET) {
 		DATA_DATA
 		*(.data.rel*)
+#ifdef CONFIG_PPC32
 		*(SDATA_MAIN)
-		*(.sdata2)
-	}
-#else
-	.data : AT(ADDR(.data) - LOAD_OFFSET) {
-		DATA_DATA
-		*(.data.rel*)
-	}
 #endif
+	}
 
 	/* The initial task and kernel stack */
 	INIT_TASK_DATA_SECTION(THREAD_ALIGN)
-- 
2.37.2

