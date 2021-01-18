Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B6D2F99FE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Jan 2021 07:37:34 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DK2CH5jX2zDrCM
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Jan 2021 17:37:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::533;
 helo=mail-pg1-x533.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=rl9X0ucm; dkim-atps=neutral
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DK20p5s9czDq5t
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Jan 2021 17:28:26 +1100 (AEDT)
Received: by mail-pg1-x533.google.com with SMTP id 30so10312878pgr.6
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Jan 2021 22:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DRPSJD7+yRSMbzMAVOs56nCLOyY7wHWQSU/LgGBests=;
 b=rl9X0ucm6tIBSec+46Ft4KEBHhkqpMquh7iVCDgAPJMoa7pGKmIxqCEKI5wvvd3Ble
 CCaFitk/Yu0thY6dyCLpjrKUGzrVnXT8uP+WjKxQpNI+uUnv4z38KoiV33D3nU8ohpwi
 ZLE3x7JeyeyfdAScWQYAcTrme0S9ieWjhd0UaTrxXI+qG7seVEYfGveXsbXWoVxG+LR3
 gC4aSI/ba8N5sQNHft/izB5A/SHuvvtTsVt1J37EirLue4tQ4eWwzCmQJVWygtd6u+7a
 tpiw7Oq+y81cCShU0E1kWgednaKiJ+La6D8gfqdQ2IKbWAwaVTiShaOdwZNdkeO7oTJl
 hoIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DRPSJD7+yRSMbzMAVOs56nCLOyY7wHWQSU/LgGBests=;
 b=SrjerDhn2XxooVzl+J6fmyQwMJLx4kk/AnGn4Z9t+C1LgKbvxHAsDlIVe8N6fKgD5E
 IFS/M7lPpAX0/dQF0t+kw+yTu9UFvOcCnL1uqudKycaqosBvt/sqdtxHSy+Oxyu7uG+w
 9N6PZ7/y3dJgix+04bGjPxU7jEuXSFSkvqY6HCJ9fllwWwo4cuuyYxnKFhroPT1eHT69
 nb8CuCuiNgr/PYN2FOmLoS/5Rq2WEY1PmshsI6cbj52q7UJI/6r0oEwDG+BVNNfwyNvZ
 hY7r9U0QGfkLOZT5u9uAP9mexGgXaToi99tkUijybmM7JZ4JLJnEf6KvmIekfOOU8YHG
 8ujA==
X-Gm-Message-State: AOAM530jg4LHYnJ+XXZgcZ/rAJTFSUi2vGpp2jiaTvn6DQCFLu3G3W9v
 fsXEbhcfi/r/pTH9KvQnRQs=
X-Google-Smtp-Source: ABdhPJzuDgOZ1yOV4nFB/Vn8Xa8D/e1LZ/1qZseMeKA2f9bOopinPfG3A1rS5nGTvN/PrE25ucqKxA==
X-Received: by 2002:a63:1f54:: with SMTP id q20mr24665084pgm.135.1610951304259; 
 Sun, 17 Jan 2021 22:28:24 -0800 (PST)
Received: from bobo.ibm.com ([124.170.13.62])
 by smtp.gmail.com with ESMTPSA id w25sm8502318pfg.103.2021.01.17.22.28.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jan 2021 22:28:23 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH 3/4] KVM: PPC: Book3S HV: No need to clear radix host SLB
 before loading guest
Date: Mon, 18 Jan 2021 16:28:08 +1000
Message-Id: <20210118062809.1430920-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210118062809.1430920-1-npiggin@gmail.com>
References: <20210118062809.1430920-1-npiggin@gmail.com>
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

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv_rmhandlers.S | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
index 0e1f5bf168a1..9f0fdbae4b44 100644
--- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
+++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
@@ -888,15 +888,19 @@ ALT_FTR_SECTION_END_IFCLR(CPU_FTR_ARCH_300)
 	cmpdi	r3, 512		/* 1 microsecond */
 	blt	hdec_soon
 
-	/* For hash guest, clear out and reload the SLB */
 	ld	r6, VCPU_KVM(r4)
 	lbz	r0, KVM_RADIX(r6)
 	cmpwi	r0, 0
 	bne	9f
+
+	/* For hash guest, clear out and reload the SLB */
+BEGIN_MMU_FTR_SECTION
+	/* Radix host won't have populated the SLB, so no need to clear */
 	li	r6, 0
 	slbmte	r6, r6
 	slbia
 	ptesync
+END_MMU_FTR_SECTION_IFCLR(MMU_FTR_TYPE_RADIX)
 
 	/* Load up guest SLB entries (N.B. slb_max will be 0 for radix) */
 	lwz	r5,VCPU_SLB_MAX(r4)
-- 
2.23.0

