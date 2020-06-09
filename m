Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A45D11F3505
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 09:37:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49h2543YlRzDqfq
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 17:37:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036;
 helo=mail-pj1-x1036.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=MuCEjmTz; dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49h1Pm6TsKzDqk5
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jun 2020 17:06:36 +1000 (AEST)
Received: by mail-pj1-x1036.google.com with SMTP id q24so1001071pjd.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Jun 2020 00:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rKfUjglDOVyzflc8oiqPOKNNxsCBrisCi40ZVFiBBhE=;
 b=MuCEjmTzFVOzCu06XCjEGPLTa6RbOmiCAEGUKESrIIKEuHCQuAkidQKjSI5VHhLiVq
 RaIqEOEAvi6MdVyV4nnH1rpbHNtvMjct0GLLxHTr+clugGouWlls/zCwenHjcVBWMD+C
 3vpJbSYCnMEzBe3fF+rM9+NM4j7o918PrJm1N1i0SCyIpR/Gy7zDPvx4xm4418DdMOxk
 HGTxCimZ4tXRO7lkTFx0MOxUyMCzBrUOzqCXv+MtyK6KZop2QO3H6OCIJrG2Mx31LZM7
 qCzHgeRuWAz3NH4wkYDy6i8b+FihOALt91BXSmDuorxBIQs5Z0/SubYM5uQYWmnQ+4K/
 mlbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rKfUjglDOVyzflc8oiqPOKNNxsCBrisCi40ZVFiBBhE=;
 b=lECWDRCbpFy6soC9eIpsqgv7tDMRMe7f5DSHKnuAMKuV0dl8ce3MA3u/22HYGL41Cf
 FtEM9vGae/RTRnmNLQsaHOo6Usul7EOUU1Rny46EjI5SQLGhFl56BrlWKI+EIWsXMScc
 QsgvQqNB5b8v6+I4UMnt776vKl6O/LTSWZ/NAKN8NnjcMTb+fxVM+MYDOexsEKqYJL76
 cLUQWVaBnctvqhtclGASBFjduGLkNewqZ/FLoZFy0aJhomj5nONPmQg9ebVb/ifiuZGg
 tB6RlztWmRZfEzHtJYbnd7bXSJOdHf3uzTpOBsL0ONPgGpXSUKC3qhs7fr+w0snxa6sS
 UkDA==
X-Gm-Message-State: AOAM531wRu5Sv45CsAzk1mDRpV7NsxFI/s0OBRe77hBF0fwjS3op3Q6s
 ooHwTplM2z2+dMbql4dXejUtJHxstD8=
X-Google-Smtp-Source: ABdhPJxdeHgf9xfIZrwp4c3FT/4ICWVW9hX1hxjVuQU+2jhd6KekOeDmtxd5nlW4wC4BqrBwIRvYBQ==
X-Received: by 2002:a17:90a:d3d6:: with SMTP id
 d22mr3237357pjw.184.1591686393875; 
 Tue, 09 Jun 2020 00:06:33 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([61.68.71.10])
 by smtp.gmail.com with ESMTPSA id 9sm1545615pju.1.2020.06.09.00.06.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2020 00:06:33 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 5/7] powerpc/64s: Move branch cache flushing bcctr variant to
 ppc-ops.h
Date: Tue,  9 Jun 2020 17:06:08 +1000
Message-Id: <20200609070610.846703-6-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200609070610.846703-1-npiggin@gmail.com>
References: <20200609070610.846703-1-npiggin@gmail.com>
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/ppc-opcode.h | 2 ++
 arch/powerpc/kernel/entry_64.S        | 6 ++----
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include/asm/ppc-opcode.h
index 2a39c716c343..79d511a38bbb 100644
--- a/arch/powerpc/include/asm/ppc-opcode.h
+++ b/arch/powerpc/include/asm/ppc-opcode.h
@@ -195,6 +195,7 @@
 #define OP_LQ    56
 
 /* sorted alphabetically */
+#define PPC_INST_BCCTR_FLUSH		0x4c400420
 #define PPC_INST_BHRBE			0x7c00025c
 #define PPC_INST_CLRBHRB		0x7c00035c
 #define PPC_INST_COPY			0x7c20060c
@@ -432,6 +433,7 @@
 #endif
 
 /* Deal with instructions that older assemblers aren't aware of */
+#define	PPC_BCCTR_FLUSH		stringify_in_c(.long PPC_INST_BCCTR_FLUSH)
 #define	PPC_CP_ABORT		stringify_in_c(.long PPC_INST_CP_ABORT)
 #define	PPC_COPY(a, b)		stringify_in_c(.long PPC_INST_COPY | \
 					___PPC_RA(a) | ___PPC_RB(b))
diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_64.S
index 2ba25b3b701e..a115aeb2983a 100644
--- a/arch/powerpc/kernel/entry_64.S
+++ b/arch/powerpc/kernel/entry_64.S
@@ -261,8 +261,6 @@ _ASM_NOKPROBE_SYMBOL(save_nvgprs);
 1:	nop;			\
 	patch_site 1b, patch__call_flush_branch_caches
 
-#define BCCTR_FLUSH	.long 0x4c400420
-
 .macro nops number
 	.rept \number
 	nop
@@ -293,7 +291,7 @@ flush_branch_caches:
 	li	r9,0x7fff
 	mtctr	r9
 
-	BCCTR_FLUSH
+	PPC_BCCTR_FLUSH
 
 2:	nop
 	patch_site 2b patch__flush_count_cache_return
@@ -302,7 +300,7 @@ flush_branch_caches:
 
 	.rept 278
 	.balign 32
-	BCCTR_FLUSH
+	PPC_BCCTR_FLUSH
 	nops	7
 	.endr
 
-- 
2.23.0

