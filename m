Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB8B2F81E4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 18:14:34 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DHSTd5rLkzDsj3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Jan 2021 04:14:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432;
 helo=mail-pf1-x432.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=QJJgo1CS; dkim-atps=neutral
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DHRyT6mZQzDsj8
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Jan 2021 03:50:57 +1100 (AEDT)
Received: by mail-pf1-x432.google.com with SMTP id c12so5835982pfo.10
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jan 2021 08:50:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=30ztDOD3lXTwn+XDGjWOrtEQKE1kjC0Q7RaaABxo/Tk=;
 b=QJJgo1CSR1sY0YDFt3E3zSkMYBUUOdoyAYaykAEtjLATkIVriOg+j0nRWZKCJw1g/7
 Jmcf/rqptRem/FuDZ+1T5uMvP46tJfVseG/BYAwmvbhXoVmoOMmzclC59/n2XTM4gnjs
 QNt2XLU1caFD8fNbbQ0V9PX8q1PwJvvUO64noZivmOiDUeyZSiTyoSMT8MPV3Tc1N7CC
 xn506l5bOB8+cVV9qJTJVf5L9cYAMgKHC79E5l4HSxLNTczU2BsvaAHP17wDFN+A+lqe
 oyj+w4CZsbAQxyp1o6WEiR/66HAS3Pv/90w+XWRvQOnrKVd9c+af9SSuLs0B+4pRAHU7
 4byQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=30ztDOD3lXTwn+XDGjWOrtEQKE1kjC0Q7RaaABxo/Tk=;
 b=lyHOI57wbaONhW0PJ/5fYhMfUSG1o1G45W/zMBa2RdheZIN49UqrU1CCxDNRQ95khm
 lFhzsAbbh2RYrTM2iw8E4UqOt0axTV+AqqZpU93x7fY8noV61cVlf993lTaFXHxGaWrh
 2pKiV5EkYBS9JNm6QMgP/a+OfSq2dpy92xAxHwnd5zu5fJiO4wgOMdtUOmccr2+iD5oF
 pvg7jqEfTtxSn2afift/VQ3af1LyJhcNE4ll2+ILH2G2jrWiN+TChTmR84ToQKWo8ZeN
 EdsN1vnCcnbS6TGWqnN3r981aUjaHGEm3zYjMz8DOwSy13IVo6p1IB8M97n1zYfRn67+
 4H0Q==
X-Gm-Message-State: AOAM533nvCTRRHyXduP9r8k62Ai5lTSu8q+WqlZZ1Lq8ZZjpkxlUig3p
 ctCxmUNg4uwtPLw6D2Qfc/0FUd9ovws=
X-Google-Smtp-Source: ABdhPJwn0l9LHFibKPwElbu4YOYiF+4afiq+BcrSUwRlNYXuqkU/qx4nh4f73WcK0B9+VUGydZjYVA==
X-Received: by 2002:a62:25c7:0:b029:156:72a3:b0c0 with SMTP id
 l190-20020a6225c70000b029015672a3b0c0mr13245977pfl.59.1610729453779; 
 Fri, 15 Jan 2021 08:50:53 -0800 (PST)
Received: from bobo.ibm.com ([124.170.13.62])
 by smtp.gmail.com with ESMTPSA id u1sm8455477pjr.51.2021.01.15.08.50.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 08:50:53 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 09/39] powerpc/64s: move bad_page_fault handling to C
Date: Sat, 16 Jan 2021 02:49:42 +1000
Message-Id: <20210115165012.1260253-10-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210115165012.1260253-1-npiggin@gmail.com>
References: <20210115165012.1260253-1-npiggin@gmail.com>
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

This simplifies code, and it is also useful when introducing
interrupt handler wrappers when introducing wrapper functionality
that doesn't cope with asm entry code calling into more than one
handler function.

32-bit and 64e still have some such cases, which limits some ways
they can use interrupt wrappers.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 12 ------------
 arch/powerpc/mm/fault.c              |  4 ++++
 2 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index b90d3cde14cf..e69a912c2cc6 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1447,12 +1447,6 @@ BEGIN_MMU_FTR_SECTION
 MMU_FTR_SECTION_ELSE
 	bl	do_page_fault
 ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
-	cmpdi	r3,0
-	beq+	interrupt_return
-	mr	r5,r3
-	addi	r3,r1,STACK_FRAME_OVERHEAD
-	ld	r4,_DAR(r1)
-	bl	__bad_page_fault
 	b	interrupt_return
 
 1:	bl	do_break
@@ -1557,12 +1551,6 @@ BEGIN_MMU_FTR_SECTION
 MMU_FTR_SECTION_ELSE
 	bl	do_page_fault
 ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
-	cmpdi	r3,0
-	beq+	interrupt_return
-	mr	r5,r3
-	addi	r3,r1,STACK_FRAME_OVERHEAD
-	ld	r4,_DAR(r1)
-	bl	__bad_page_fault
 	b	interrupt_return
 
 	GEN_KVM instruction_access
diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index e4121fd9fcf1..965c89e63997 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -556,6 +556,10 @@ long do_page_fault(struct pt_regs *regs)
 		if (likely(entry)) {
 			instruction_pointer_set(regs, extable_fixup(entry));
 			err = 0;
+		} else if (IS_ENABLED(CONFIG_PPC_BOOK3S_64)) {
+			/* 32 and 64e handle this in asm */
+			__bad_page_fault(regs, err);
+			err = 0;
 		}
 	}
 
-- 
2.23.0

