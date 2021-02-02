Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA9F30B5B0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Feb 2021 04:13:40 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DV8z53hJXzDqTh
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Feb 2021 14:13:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102e;
 helo=mail-pj1-x102e.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=CEUyru6Q; dkim-atps=neutral
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DV8lc5y9NzDqyZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Feb 2021 14:03:40 +1100 (AEDT)
Received: by mail-pj1-x102e.google.com with SMTP id nm1so1362778pjb.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 Feb 2021 19:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9ye4rWrswKagx8tGr0mJPjZ2bjOD6zfWGQw0pHYQImY=;
 b=CEUyru6Qa/aGvIoSwUBAH62ICmV6uTUGryVz8jOGYxm5+AANyR5vWe/zUfJ4NVuRBY
 NxU5A4HpX+jydcf7KJz3yu9OJPw2eAwJ3FPcu3jxKb1AoMsZaNgWbUDZnuLmNj94W1fq
 20aRDN4sqkYggd7fAxgyjzG2woM2ToJe/BbbVBmKARR0v9Elp72I5OEiqBVI5DxsBdAC
 8mv8mo+1SBY20Aw4V7loI1qkKygf5tfrsKPXFq/HpGkJRVONH3F50hwsMpKKllYJic90
 1z0Ou9psp99zi7l+E3bOuiR6wsDm7lnVM7zvrbgeyeW1rd5RZ2MakG96J/Vh3gk52LNz
 u4wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9ye4rWrswKagx8tGr0mJPjZ2bjOD6zfWGQw0pHYQImY=;
 b=Jkjkw9khGYhmRsJINqLTzS+LM+g6sMOyD983ZWpf5ueucS43yqw6PWmzoD2MBUK0iN
 cLbTUKT4WDcz9cM6zRoB4QeNljxN0zy23VnZ9w6TezwBFJJzejID7tFvZtNUZGVpaKlO
 2sCIaXcnZOubZRwNRdcVfonvCe+OAVrgx95X2StowJNCUjSBAEtkL9WZ8cl+dtujHCv2
 RMwkq+qFGb179ihUAuaQWkC2GVDRhMYNQkU6bk8o5T+ecxrc45e3SmYzH8ayxcXLyc2W
 hVMjzrHLOLoXIMIn/BU5qoI+gtsEUwwvZHMAFXHIX2Ymld8QQpd7GKSNrRYXXEstTNy1
 4pUQ==
X-Gm-Message-State: AOAM531/3uOho3FPdiNWBuxPjP2npeUhj90FH7ttkdbf+S3SBWxjHu9m
 I+FThnyDHP04+4qWv1Bkqv0=
X-Google-Smtp-Source: ABdhPJz3ZezmcrSIHmW3tiOEycfUi1fUcI3ESd3IsW/BTlLZBmhChsB9/iYxeUovadT4Hn1h0D2RHA==
X-Received: by 2002:a17:90a:9ac:: with SMTP id
 41mr1969819pjo.136.1612235017666; 
 Mon, 01 Feb 2021 19:03:37 -0800 (PST)
Received: from bobo.ozlabs.ibm.com
 (192.156.221.203.dial.dynamic.acc50-nort-cbr.comindico.com.au.
 [203.221.156.192])
 by smtp.gmail.com with ESMTPSA id a24sm20877337pff.18.2021.02.01.19.03.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 19:03:37 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [RFC PATCH 5/9] powerpc/64s: Remove EXSLB interrupt save area
Date: Tue,  2 Feb 2021 13:03:09 +1000
Message-Id: <20210202030313.3509446-6-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210202030313.3509446-1-npiggin@gmail.com>
References: <20210202030313.3509446-1-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SLB faults should not be taken while the PACA save areas are live, so
EXSLB is not be required.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/paca.h      | 3 +--
 arch/powerpc/kernel/asm-offsets.c    | 1 -
 arch/powerpc/kernel/exceptions-64s.S | 5 -----
 3 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/arch/powerpc/include/asm/paca.h b/arch/powerpc/include/asm/paca.h
index 9454d29ff4b4..be0b00cb9fbb 100644
--- a/arch/powerpc/include/asm/paca.h
+++ b/arch/powerpc/include/asm/paca.h
@@ -108,8 +108,7 @@ struct paca_struct {
 	 */
 	/* used for most interrupts/exceptions */
 	u64 exgen[EX_SIZE] __attribute__((aligned(0x80)));
-	u64 exslb[EX_SIZE];	/* used for SLB/segment table misses
- 				 * on the linear mapping */
+
 	/* SLB related definitions */
 	u16 vmalloc_sllp;
 	u8 slb_cache_ptr;
diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index 489a22cf1a92..51302fb74d14 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -255,7 +255,6 @@ int main(void)
 #endif /* CONFIG_PPC_MM_SLICES */
 	OFFSET(PACA_EXGEN, paca_struct, exgen);
 	OFFSET(PACA_EXMC, paca_struct, exmc);
-	OFFSET(PACA_EXSLB, paca_struct, exslb);
 	OFFSET(PACA_EXNMI, paca_struct, exnmi);
 #ifdef CONFIG_PPC_PSERIES
 	OFFSET(PACALPPACAPTR, paca_struct, lppaca_ptr);
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index e964ea5149e8..c893801eb1d5 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1412,13 +1412,9 @@ ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
  *   on user-handler data structures.
  *
  *   KVM: Same as 0x300, DSLB must test for KVM guest.
- *
- * A dedicated save area EXSLB is used (XXX: but it actually need not be
- * these days, we could use EXGEN).
  */
 INT_DEFINE_BEGIN(data_access_slb)
 	IVEC=0x380
-	IAREA=PACA_EXSLB
 	IRECONCILE=0
 	IDAR=1
 	IKVM_REAL=1
@@ -1507,7 +1503,6 @@ ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
  */
 INT_DEFINE_BEGIN(instruction_access_slb)
 	IVEC=0x480
-	IAREA=PACA_EXSLB
 	IRECONCILE=0
 	IISIDE=1
 	IDAR=1
-- 
2.23.0

