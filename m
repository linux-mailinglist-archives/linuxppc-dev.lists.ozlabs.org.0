Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE225E7270
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 05:29:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYd0r5C9jz3f9c
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 13:29:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=R1TUVMrn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=R1TUVMrn;
	dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYcwz0F3Mz3c8P
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Sep 2022 13:25:38 +1000 (AEST)
Received: by mail-pj1-x1036.google.com with SMTP id d64-20020a17090a6f4600b00202ce056566so4403488pjk.4
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Sep 2022 20:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=cRbBORDYtqR6tQoQJPRZHFleROrZNGiYhRZwxfl+U98=;
        b=R1TUVMrnoLnqlebwlJzZIykGF91JLQelXfiqlHJdSWC3H27yyaGzCwYhoc2eFT/ffb
         k3W1103gOQqTNgWoaYEWiQaa3IHvShxm972saR0c05pL+oRWnSi7CUTNfdFXnIAbm5Tl
         8C15xXjfghuiGG5ppqZwOaLgNtgxldPHzeV6c8h9P8ceSUaX5AYuBc5WZqW42mET9JUy
         aFth12mxBxKoli7bXP6BFUruAPTXkWo2WL4/iX84ucUq90XA/4uA8xZJF6T/D0w1ybiB
         xY0sM3qhHVWDacT3w6gGCBLfiZfTqlavabZudyPCBF+/EGq8d8bnLTXsaBidSI+VDdo3
         41Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=cRbBORDYtqR6tQoQJPRZHFleROrZNGiYhRZwxfl+U98=;
        b=wUjWCkroa9ZW3mp6kfxlZGZreb3QxuBeCe5F8uZ5/wX31mv05L+9q9eiBX3YHzS82o
         odHEo+q7HgI+UjuVeF/ko9Sb2MY4REd6viOZpznUmVOK+1wmIfES0Wl0qK8PtBZsdQsw
         GnC+V73c1rZd63xeuRrzQQJqS0Atd2/xOJ/YGPdmmY89rYuNG2xTPDA/NiLCWhEwr5OS
         biLeX4ch8qo3ZxXdogDi5r/NLqfCenusL3YKlMik7Ti2yVMIYVYYLUFK5s05j+OLnhwU
         fXAmQE+fw0CLbTq5BfM8fSSTBIwJ0YgBIfv5xt/L+CsTWXa23LfOT9K9dURYChMGSoL8
         kZvQ==
X-Gm-Message-State: ACrzQf2nCS/A1SFjX4bU0gwoLX0uGHbi/bEPWivEJ6lObwZDl3AlB9Be
	2HwdSxtsfr0eT74pqt8PqRAJLy9f6B7YPQ==
X-Google-Smtp-Source: AMsMyM4NnbKc9QyojV3eem3M4ds7/1C5roD0NAgDUF3VcbtH8zimUPnMCba82YorSi6quYrlRCGutg==
X-Received: by 2002:a17:90b:2398:b0:200:a861:2e86 with SMTP id mr24-20020a17090b239800b00200a8612e86mr7168381pjb.233.1663903536367;
        Thu, 22 Sep 2022 20:25:36 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (27-32-155-116.static.tpgi.com.au. [27.32.155.116])
        by smtp.gmail.com with ESMTPSA id q3-20020a170902f78300b001752216ca51sm4895224pln.39.2022.09.22.20.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 20:25:35 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 5/5] powerpc/64e: provide an addressing macro for use with TOC in alternate register
Date: Fri, 23 Sep 2022 13:25:12 +1000
Message-Id: <20220923032512.535725-6-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220923032512.535725-1-npiggin@gmail.com>
References: <20220923032512.535725-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>, Alan Modra <amodra@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The interrupt entry code carefully saves a minimal number of registers,
so in some places the TOC is required, it is loaded into a different
register, so provide a macro that can supply an alternate TOC register.

This continues to use got addressing because TOC-relative results in
"got/toc optimization is not supported" messages by the linker. Having
r2 be one of the saved registers and using that for TOC addressing may
be the best way to avoid that and switch this to TOC addressing.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/ppc_asm.h   | 11 +++++++++++
 arch/powerpc/kernel/exceptions-64e.S | 14 +++++++-------
 arch/powerpc/mm/nohash/tlb_low_64e.S |  2 +-
 3 files changed, 19 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/include/asm/ppc_asm.h b/arch/powerpc/include/asm/ppc_asm.h
index 17a87ecd82c9..622aaaec2be9 100644
--- a/arch/powerpc/include/asm/ppc_asm.h
+++ b/arch/powerpc/include/asm/ppc_asm.h
@@ -324,6 +324,17 @@ GLUE(.,name):
 	addis	reg,r2,name@toc@ha;		\
 	addi	reg,reg,name@toc@l
 
+#ifdef CONFIG_PPC_BOOK3E_64
+/*
+ * This is used in register-constrained interrupt handlers. Not to be used
+ * by BOOK3S. ld complains with "got/toc optimization is not supported" if r2
+ * is not used for the TOC offset, so use @got(tocreg). If the interrupt
+ * handlers saved r2 instead, LOAD_REG_ADDR could be used.
+ */
+#define LOAD_REG_ADDR_ALTTOC(reg,tocreg,name)	\
+	ld	reg,name@got(tocreg)
+#endif
+
 #define LOAD_REG_ADDRBASE(reg,name)	LOAD_REG_ADDR(reg,name)
 #define ADDROFF(name)			0
 
diff --git a/arch/powerpc/kernel/exceptions-64e.S b/arch/powerpc/kernel/exceptions-64e.S
index c20b39d011a9..8ac9dfd38874 100644
--- a/arch/powerpc/kernel/exceptions-64e.S
+++ b/arch/powerpc/kernel/exceptions-64e.S
@@ -699,8 +699,8 @@ END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
 
 #ifdef CONFIG_RELOCATABLE
 	__LOAD_PACA_TOC(r15)
-	ld	r14,interrupt_base_book3e@got(r15)
-	ld	r15,__end_interrupts@got(r15)
+	LOAD_REG_ADDR_ALTTOC(r14, r15, interrupt_base_book3e)
+	LOAD_REG_ADDR_ALTTOC(r15, r15, __end_interrupts)
 	cmpld	cr0,r10,r14
 	cmpld	cr1,r10,r15
 #else
@@ -770,8 +770,8 @@ kernel_dbg_exc:
 
 #ifdef CONFIG_RELOCATABLE
 	__LOAD_PACA_TOC(r15)
-	ld	r14,interrupt_base_book3e@got(r15)
-	ld	r15,__end_interrupts@got(r15)
+	LOAD_REG_ADDR_ALTTOC(r14, r15, interrupt_base_book3e)
+	LOAD_REG_ADDR_ALTTOC(r15, r15, __end_interrupts)
 	cmpld	cr0,r10,r14
 	cmpld	cr1,r10,r15
 #else
@@ -895,8 +895,8 @@ kernel_dbg_exc:
 .macro SEARCH_RESTART_TABLE
 #ifdef CONFIG_RELOCATABLE
 	__LOAD_PACA_TOC(r11)
-	ld	r14,__start___restart_table@got(r11)
-	ld	r15,__stop___restart_table@got(r11)
+	LOAD_REG_ADDR_ALTTOC(r14, r11, __start___restart_table)
+	LOAD_REG_ADDR_ALTTOC(r15, r11, __stop___restart_table)
 #else
 	LOAD_REG_IMMEDIATE_SYM(r14, r11, __start___restart_table)
 	LOAD_REG_IMMEDIATE_SYM(r15, r11, __stop___restart_table)
@@ -1315,7 +1315,7 @@ a2_tlbinit_after_linear_map:
 	/* Now we branch the new virtual address mapped by this entry */
 #ifdef CONFIG_RELOCATABLE
 	__LOAD_PACA_TOC(r5)
-	ld	r3,1f@got(r5)
+	LOAD_REG_ADDR_ALTTOC(r3, r5, 1f)
 #else
 	LOAD_REG_IMMEDIATE_SYM(r3, r5, 1f)
 #endif
diff --git a/arch/powerpc/mm/nohash/tlb_low_64e.S b/arch/powerpc/mm/nohash/tlb_low_64e.S
index 0e4d9c817382..2f3095716721 100644
--- a/arch/powerpc/mm/nohash/tlb_low_64e.S
+++ b/arch/powerpc/mm/nohash/tlb_low_64e.S
@@ -1125,7 +1125,7 @@ tlb_load_linear:
 	 * final implementation, especially when dealing with hypervisors
 	 */
 	__LOAD_PACA_TOC(r11)
-	ld	r11,linear_map_top@got(r11)
+	LOAD_REG_ADDR_ALTTOC(r11, r11, linear_map_top)
 	ld	r10,0(r11)
 	tovirt(10,10)
 	cmpld	cr0,r16,r10
-- 
2.37.2

