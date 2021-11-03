Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDEF1444A08
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Nov 2021 22:01:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HkzhD4rj5z3cZv
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Nov 2021 08:01:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=AXEWEp3e;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635;
 helo=mail-pl1-x635.google.com; envelope-from=f.fainelli@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=AXEWEp3e; dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HkzcP01gsz2ysq
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Nov 2021 07:57:40 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id y1so3564543plk.10
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Nov 2021 13:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S0dFQ/UQsJWaH1kYJj3rWoS4C5q2ObA8TNk2IQSTt/E=;
 b=AXEWEp3emvXTgbngg4++MXlbgCHH34v77Xce8c+ORkiO3/qFOKvu0613Q6ztFJfnPS
 VeoxlHXujoFqOXxq322zYzRFXYyauddU9hS0kdhCp9F7Yr2xVUF34o+uS2pwXVPSMc3a
 CyrLgQLFw1Duf1oMB2WN8QuOXt4V4HB3CwFyavkEpqN8dfvxmYSee7yAo8lTPnV/PWJa
 CpaaShYJCHMUSRu3yD8vPSTstS8/E2uMd9awmsBMSB/GpyeXh3Ol5jv1IYmFhT3dsdu8
 9IBtuS22yL8DvScVbbeS2BK5usQTjChqURTmsc2be3zGiw7+EmRDEwy6nXGFC/PS11Xz
 Bhxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S0dFQ/UQsJWaH1kYJj3rWoS4C5q2ObA8TNk2IQSTt/E=;
 b=JgXlZKqlLD/ASB7ZBzdsPjqDNN3KazpwuyKBXCvo8Q28fXrNUL7IM442tqVYrkIE4Q
 f9nrfUUn4F7yTTkDvWpKnQhyIrs6/7HP+iKanN5bNjP95ISk3VVlxayUWG2DEqZLV8vf
 gybAsPKWbKewK58QFaUWfnsxlxYN5v/t7FAtRLCGBWKzHMq4QQSVRPVntM+wUf8xwh6F
 hDTFhNsy/SE5UxTv2N6BL2hdyWUxsYTz84cuXkZqd9dUrMBAp3aSeb6zWkN7VUbXMfBB
 YCG9QAaxrugxAobgcZ6R4G+GkvCZNRKCv2mIOAcrIjKw3qDdqCjQv0afj+sJlllXsgft
 s6QA==
X-Gm-Message-State: AOAM533XLrTNlQfeU6RGIwKU1yujfMDv8wAwZ8/Mq1kVl56E57HAqtYU
 CKmEznJLkEaPTT5eyfsqlAg=
X-Google-Smtp-Source: ABdhPJx3h3YvixDAK7XkDn1NEXW/Ly0bj8zLO7l9ZanyuX8A7hDGbBtgHH352XBpCOFs5bwZzGQnXg==
X-Received: by 2002:a17:902:cec4:b0:141:cfa1:f7e with SMTP id
 d4-20020a170902cec400b00141cfa10f7emr26542606plg.13.1635973058968; 
 Wed, 03 Nov 2021 13:57:38 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id n14sm2512073pgd.68.2021.11.03.13.57.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 13:57:22 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH stable 4.9 1/2] mm/zsmalloc: Prepare to variable
 MAX_PHYSMEM_BITS
Date: Wed,  3 Nov 2021 13:57:13 -0700
Message-Id: <20211103205714.374801-2-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211103205714.374801-1-f.fainelli@gmail.com>
References: <20211103205714.374801-1-f.fainelli@gmail.com>
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
Cc: "open list:MIPS" <linux-mips@linux-mips.org>,
 Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Stefan Agner <stefan@agner.ch>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>, stable@vger.kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@kernel.org>,
 Sasha Levin <sashal@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 "maintainer:X86 ARCHITECTURE 32-BIT AND 64-BIT" <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@suse.de>,
 Nitin Gupta <ngupta@vflare.org>,
 "open list:GENERIC INCLUDE/ASM HEADER FILES" <linux-arch@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 "open list:LINUX FOR POWERPC 32-BIT AND 64-BIT"
 <linuxppc-dev@lists.ozlabs.org>, Thomas Gleixner <tglx@linutronix.de>,
 "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ralf Baechle <ralf@linux-mips.org>, Andy Lutomirski <luto@amacapital.net>,
 Minchan Kim <minchan@kernel.org>, Vineet Gupta <vgupta@synopsys.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>

commit 02390b87a9459937cdb299e6b34ff33992512ec7 upstream

With boot-time switching between paging mode we will have variable
MAX_PHYSMEM_BITS.

Let's use the maximum variable possible for CONFIG_X86_5LEVEL=y
configuration to define zsmalloc data structures.

The patch introduces MAX_POSSIBLE_PHYSMEM_BITS to cover such case.
It also suits well to handle PAE special case.

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Reviewed-by: Nitin Gupta <ngupta@vflare.org>
Acked-by: Minchan Kim <minchan@kernel.org>
Cc: Andy Lutomirski <luto@amacapital.net>
Cc: Borislav Petkov <bp@suse.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-mm@kvack.org
Link: http://lkml.kernel.org/r/20180214111656.88514-3-kirill.shutemov@linux.intel.com
Signed-off-by: Ingo Molnar <mingo@kernel.org>
[florian: drop arch/x86/include/asm/pgtable_64_types.h changes since
there is no CONFIG_X86_5LEVEL]
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 arch/x86/include/asm/pgtable-3level_types.h |  1 +
 mm/zsmalloc.c                               | 13 +++++++------
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/arch/x86/include/asm/pgtable-3level_types.h b/arch/x86/include/asm/pgtable-3level_types.h
index bcc89625ebe5..f3f719d59e61 100644
--- a/arch/x86/include/asm/pgtable-3level_types.h
+++ b/arch/x86/include/asm/pgtable-3level_types.h
@@ -42,5 +42,6 @@ typedef union {
  */
 #define PTRS_PER_PTE	512
 
+#define MAX_POSSIBLE_PHYSMEM_BITS	36
 
 #endif /* _ASM_X86_PGTABLE_3LEVEL_DEFS_H */
diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
index 8db3c2b27a17..2b7bfd97587a 100644
--- a/mm/zsmalloc.c
+++ b/mm/zsmalloc.c
@@ -83,18 +83,19 @@
  * This is made more complicated by various memory models and PAE.
  */
 
-#ifndef MAX_PHYSMEM_BITS
-#ifdef CONFIG_HIGHMEM64G
-#define MAX_PHYSMEM_BITS 36
-#else /* !CONFIG_HIGHMEM64G */
+#ifndef MAX_POSSIBLE_PHYSMEM_BITS
+#ifdef MAX_PHYSMEM_BITS
+#define MAX_POSSIBLE_PHYSMEM_BITS MAX_PHYSMEM_BITS
+#else
 /*
  * If this definition of MAX_PHYSMEM_BITS is used, OBJ_INDEX_BITS will just
  * be PAGE_SHIFT
  */
-#define MAX_PHYSMEM_BITS BITS_PER_LONG
+#define MAX_POSSIBLE_PHYSMEM_BITS BITS_PER_LONG
 #endif
 #endif
-#define _PFN_BITS		(MAX_PHYSMEM_BITS - PAGE_SHIFT)
+
+#define _PFN_BITS		(MAX_POSSIBLE_PHYSMEM_BITS - PAGE_SHIFT)
 
 /*
  * Memory for allocating for handle keeps object position by
-- 
2.25.1

