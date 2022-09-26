Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC165E984D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 05:44:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MbTCd28tqz3f8R
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 13:44:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=aVrCTr92;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=aVrCTr92;
	dkim-atps=neutral
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MbT7n5h09z3c4K
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 13:41:25 +1000 (AEST)
Received: by mail-pf1-x42f.google.com with SMTP id l65so5400918pfl.8
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Sep 2022 20:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=cRbBORDYtqR6tQoQJPRZHFleROrZNGiYhRZwxfl+U98=;
        b=aVrCTr92x7FdAIzdujBcd2Z+HKoJxZ/mZaPGZiC47wEumbvKZUBwOr+RBR3/ERVIDz
         yaF04RF5401sbTYZCWtMONjTb9CxUxnQtUfoyTMnKjd4/zp6X4e1sOmrExrK9BiCLVap
         0MejFPx8jh1JpVZAJ6hUiAw1nNnueBDTVOf4C2iclxia99i2PKYU4s9BeYFk9Cx3QJ1m
         i8KZtoQ1Mg7XEuH/COCy1tzm3TeH+L8z+Xha38MlFTxG/kVKlj4ItuEbAR2jMKD60M0j
         k3bfR7v1qbpa0unWBZWY3nkou6lw6XL0FkGkESZdaoImG7WzBqrSzhGf8A13luMIruG5
         5aag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=cRbBORDYtqR6tQoQJPRZHFleROrZNGiYhRZwxfl+U98=;
        b=nl/VeEF+yUP5H4zJRNLvmNocaE4PFeHjfWx4RnRWquteig1f4vgrJsz1fw7Yrt/Wod
         7GojAo5hitTim7ubO7CAcKr3VrUR9h8NFCqX2oZHsTfPpjbIkp10Qg6ccCI8r8kQu1mx
         KT5vdRWLBuOFSwna7IP6JUSw6eGA9SFFyge6CiduZLROaUr4KL+FuHLkVR4whuUqTf4o
         SfqfFFCoQlFts9Y3zevI04gUzw8jqAPsJy8m1DPwNFc91Dwk1M4a9VetmVo7WEGSFvxG
         pkQq+ofz5U/dCi4pKTTw/WMaolOMooL77+oOo56/MLfx8kGzohf1WIOm0nTW5/eKhCI3
         IEXA==
X-Gm-Message-State: ACrzQf07/FvANaeYDRqD3klcrgrzvyiZW8Vm4ojnfNljOP2e1xH60rfb
	bG8/3NLVK3RhXFgMvDHmC0i3ClLWgvw=
X-Google-Smtp-Source: AMsMyM7tYLvWqEgpT/SdNtIrp77FvnSgy65XfLN/Z+jOoIZMXjEPfMNjIq5gi6A6YvKNftm8HrDvRQ==
X-Received: by 2002:a05:6a00:b8d:b0:545:e7de:78e5 with SMTP id g13-20020a056a000b8d00b00545e7de78e5mr21581398pfj.72.1664163682669;
        Sun, 25 Sep 2022 20:41:22 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (27-32-155-116.static.tpgi.com.au. [27.32.155.116])
        by smtp.gmail.com with ESMTPSA id a3-20020a170902710300b001746f66244asm10122907pll.18.2022.09.25.20.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Sep 2022 20:41:22 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 5/5] powerpc/64e: provide an addressing macro for use with TOC in alternate register
Date: Mon, 26 Sep 2022 13:40:57 +1000
Message-Id: <20220926034057.2360083-6-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220926034057.2360083-1-npiggin@gmail.com>
References: <20220926034057.2360083-1-npiggin@gmail.com>
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

