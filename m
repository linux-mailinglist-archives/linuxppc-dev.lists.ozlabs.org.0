Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFBD59382
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 07:37:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ZlsX1VWdzDqs1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 15:37:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="nXrbI5lu"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ZlmX1nKFzDqmR
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2019 15:33:32 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id r7so2384799pfl.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2019 22:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xiUASOZ+lxP5tziM882iMyom7CPYApeJ9KoAHmBmFe8=;
 b=nXrbI5luOUJCqGiS6rzx9fl+bRoMsZduNtbSZFdRQsxexCZbmf1wMDZJkaUVQYfIjp
 VcpC8FECiKQeVMYD6ZQzipwimHtmZ2loMGYc1JW/9o8tbCFYjRId2eWi54T9l2vAKC9G
 uRAbpVODymWMp02J/G8Zc/GSD7vKtJ3z7UEttG6cg/wibusRT+ueAwJaQXNgUNbLZpoM
 9Zt3CVBgJIGgVKLPgWxGRHX5DWwIM/78i+JkyCvJAWUrWQ+nZnT0u/cDE5D7y4oZucUm
 OsnLeAADUXsbOVhiZfobbx2ajii+VVy+X681hXBIFS2qPXpGFx4jGVj/hxRoRfWVx5z7
 hzoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xiUASOZ+lxP5tziM882iMyom7CPYApeJ9KoAHmBmFe8=;
 b=LJwzwdSQFxLkg8w2RA1mUL1anLHmUEyYkF0xnE9ncDbcxspXoOKl0b5CpxByf5TWHH
 IY7z3EMc0qSLgG24x7fEUpOob1irySv9so6CFvWwQ6UIllroHGkwXCK0H79NXTG7fhri
 gIwENDt7aHhlfyGpW78iWuVuXz6UC5pocbbK5bcZZMTs9vV2X3b9PBs/R1dr9/CIDSos
 wQshV1r+AEDEJLchOaRkWxvr/Lrc6uDWovIIkLGzdRU4i0ErMy+09fPLjaZWrFlpG4hf
 C0G26rML8/kWPMytBIoPcCj/8LpaBOrCRzDNYZUQkZcUTMM7ZpnDVhIBsAqq/htrAgkE
 scfA==
X-Gm-Message-State: APjAAAXYmfOwuCifiWT+vg5igZvawlkMiP/1QaXGHdTpi5eQCZEQ/0uv
 7gskS3Ww81fTSPmTCumgD3TP08Vv
X-Google-Smtp-Source: APXvYqx1ZKvyJl+vdOlh3WLbm4uJqGWpV8PWUN2VAwh9ZwFAUbUFABBY+vm53dz9GW9qfXml8EaeoQ==
X-Received: by 2002:a17:90b:8d8:: with SMTP id
 ds24mr10640959pjb.135.1561700008732; 
 Thu, 27 Jun 2019 22:33:28 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id 125sm1272614pfg.23.2019.06.27.22.33.26
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 27 Jun 2019 22:33:28 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 02/13] powerpc/64s/exception: avoid SPR RAW scoreboard
 stall in real mode entry
Date: Fri, 28 Jun 2019 15:33:21 +1000
Message-Id: <20190628053332.22366-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190628053332.22366-1-npiggin@gmail.com>
References: <20190628053332.22366-1-npiggin@gmail.com>
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
index 98321ded8df6..c3a9cb8cdfd3 100644
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

