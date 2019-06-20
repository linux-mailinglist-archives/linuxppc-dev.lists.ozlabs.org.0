Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB304C755
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 08:16:22 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Ts5b4dBpzDqMl
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 16:16:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::641; helo=mail-pl1-x641.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="S+e9ZWDG"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Tqm345bvzDqw4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2019 15:16:03 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id cl9so871925plb.10
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 22:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kmj43MduLNm2yoaxL9n0bh7AimYCnQQWctQopksQRnk=;
 b=S+e9ZWDGEWqclfu2R43UFsY3y2IuxwQvH44lc3KHjLVLEXamsfEufVNay8mnnxXfuI
 Dy3uOVaEWIP9fFhcYziU8UVu+2vrx94Ji1fZsxSQ0/lldctGf9uNHMUP2Kb0QM1a84Mn
 EStgdth244cCOlzffHN5/OFKr1m/K9WvIjj8c6q7sTssL/bR14Vw9XWPTUMwCZBnyIUD
 +HsiJdsGkXmacPQjQ+Owksh1uyb+F3vwRUsdG81KgwSpe2Vk0JyeK1ocImbF/mcFw0Bb
 pLVS3AiQ7Sq41UDuBs/jGrCGbXRQ6as0n3zvj87gQC9bXfxymah5BYFlY4Nz69G9sMIR
 ED3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kmj43MduLNm2yoaxL9n0bh7AimYCnQQWctQopksQRnk=;
 b=G8d8g+6rXD9xkh+KkUYkY1/xOA6zs7J6h2bd/GDT87qr5raBSNqR9SNnUs4n1MlEoh
 3ORPmyLPHNXJxCGPwvOa97KG8PhPeNtH0qB8dtOG4Tw2PbFK42+pBQ5MwKSx6BjYHfEs
 Yd6wUQ36TFNs8nCK/vfV33+TWZqiWDI7jiVPJbUvLKPHK7SKn2dggqBy41cJYp5ptdfd
 cZjY5vNO8/E7US0k6fnwwaxvrH+FW3BYx2io0syas6XvkYvryb4K7OGWcHkbHKyQPN2J
 ZNSZWM10On0a50wl7zexJpWTuI5qLr1aCNg/Mk8plhTHU4yWKkFFsjjeoG4YphHs4Pe1
 ufaw==
X-Gm-Message-State: APjAAAWv25VHHNVMi1P7fBNr1omeF0uPdW8htEeB2Y4/jfRQ2tNDj1LF
 0n8Ll1LxXSbU79zdeWqJPP42n3fv
X-Google-Smtp-Source: APXvYqyqNp3lf58cdxgrU+z80WPbx8nVnUJKzOj1bGiuAr0j64+T/35p0iyfFMnNM80yKx6l9bsyUA==
X-Received: by 2002:a17:902:6903:: with SMTP id
 j3mr47309676plk.247.1561007761724; 
 Wed, 19 Jun 2019 22:16:01 -0700 (PDT)
Received: from bobo.local0.net (193-116-72-140.tpgi.com.au. [193.116.72.140])
 by smtp.gmail.com with ESMTPSA id
 h12sm8235847pje.12.2019.06.19.22.15.59
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 19 Jun 2019 22:16:01 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 29/52] powerpc/64s/exception: avoid SPR RAW scoreboard
 stall in real mode entry
Date: Thu, 20 Jun 2019 15:14:36 +1000
Message-Id: <20190620051459.29573-30-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190620051459.29573-1-npiggin@gmail.com>
References: <20190620051459.29573-1-npiggin@gmail.com>
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

Move SPR reads ahead of writes. Real mode entry that is not a KVM
guest is rare these days, but bad practice propagates.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 62f7e9ad23c6..e0492912ea79 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -183,19 +183,19 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 	.endif
 	.if \hsrr
 	mfspr	r11,SPRN_HSRR0		/* save HSRR0 */
+	mfspr	r12,SPRN_HSRR1		/* and HSRR1 */
+	mtspr	SPRN_HSRR1,r10
 	.else
 	mfspr	r11,SPRN_SRR0		/* save SRR0 */
+	mfspr	r12,SPRN_SRR1		/* and SRR1 */
+	mtspr	SPRN_SRR1,r10
 	.endif
-	LOAD_HANDLER(r12, \label\())
+	LOAD_HANDLER(r10, \label\())
 	.if \hsrr
-	mtspr	SPRN_HSRR0,r12
-	mfspr	r12,SPRN_HSRR1		/* and HSRR1 */
-	mtspr	SPRN_HSRR1,r10
+	mtspr	SPRN_HSRR0,r10
 	HRFI_TO_KERNEL
 	.else
-	mtspr	SPRN_SRR0,r12
-	mfspr	r12,SPRN_SRR1		/* and SRR1 */
-	mtspr	SPRN_SRR1,r10
+	mtspr	SPRN_SRR0,r10
 	RFI_TO_KERNEL
 	.endif
 	b	.	/* prevent speculative execution */
-- 
2.20.1

