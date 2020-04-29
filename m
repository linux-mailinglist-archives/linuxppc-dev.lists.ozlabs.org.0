Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1A41BD4A9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 08:31:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49BpZd47CqzDq5b
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 16:31:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102e;
 helo=mail-pj1-x102e.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=hsqqVHYI; dkim-atps=neutral
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49BpSH5jRLzDr2c
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 16:26:23 +1000 (AEST)
Received: by mail-pj1-x102e.google.com with SMTP id t40so360617pjb.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Apr 2020 23:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZJ7NjDqNcyOI8o7m3x+N2wdTAEyK8lz6RXEr3erPCS0=;
 b=hsqqVHYI4nc/VDsxpz4fawfgjwkUJabpOUiu0h9LPrVnt5JFj5BpAzArFT6bTtLUFR
 8NYCgFxt2Eryi/2Co8Fj/2aFsApdNghUWQZ+tDx48gJkLXlTgbBB4UybfaR6GILJlEyC
 HdjykSvqyFXoHzVpgjidDMTbjNm1rNMNEfglic/RSx9lYlcjextp+xGHq8AkH5m1xfKp
 6D3nrf+Gq72gxExpv0BuKyt576LXC+CC7cUZ0myWNFaJlcqjGceDhKVpravUbSUPeCDR
 n5DBb72uGrUqe/gVDO3iGGt8ZVTUPTaa7SMSsFhWcNrtXNEGV2/UOSyXVZLZb1zbvUxc
 u5/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZJ7NjDqNcyOI8o7m3x+N2wdTAEyK8lz6RXEr3erPCS0=;
 b=oPnUe3x5bX3R3MCyTSEQb5U0SzwUz0TyJQ/BJv0SHC1hKQl3DMn4LEjYNWz24Hi2Oc
 /mISf1Q28ZhwBo/CE/TiXkEFiZ/27XfbqSC2+JW4AFderrbZ5AE8/31uPNpiAeToUEZe
 DFfmilwqlJLQVlBT417ihBlX+M+fYFZ/UlbtyX207yUy0fby8VyCivqoKX8/BHkj2f+Z
 FhBMqH9IZJD/F/7itVOisbO8RrldXo4yDB9tI8w+J884jZBCRZDarWqAEIwjziDUt4+w
 BTaDXevD2hfREMJRhy2cgfuRQiQlm+2BWezkBC2n8pBIdA22uupLOauQUoE6Bs1mqXXM
 tfaA==
X-Gm-Message-State: AGi0PuaUXn8vY6XCIruR+SHq6tAELiG0yipBFHKDPRteHQTPKIpEsrY8
 RYtUc4Ba/1DfyQNRC/lWv6Kv+veJ
X-Google-Smtp-Source: APiQypLoVX2zQVp1ZaDjMgtVsAcGobdA64l0ednpSd5h0l5y/nM8PJv2pUiXbtJIHj9gxWjNzCqquA==
X-Received: by 2002:a17:90a:f418:: with SMTP id
 ch24mr1353430pjb.68.1588141579982; 
 Tue, 28 Apr 2020 23:26:19 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([203.220.177.17])
 by smtp.gmail.com with ESMTPSA id s76sm164373pgc.85.2020.04.28.23.26.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 23:26:19 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/6] missing isync
Date: Wed, 29 Apr 2020 16:26:02 +1000
Message-Id: <20200429062607.1675792-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200429062607.1675792-1-npiggin@gmail.com>
References: <20200429062607.1675792-1-npiggin@gmail.com>
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

---
 arch/powerpc/include/asm/book3s/64/kup-radix.h | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/book3s/64/kup-radix.h b/arch/powerpc/include/asm/book3s/64/kup-radix.h
index 3bcef989a35d..8dc5f292b806 100644
--- a/arch/powerpc/include/asm/book3s/64/kup-radix.h
+++ b/arch/powerpc/include/asm/book3s/64/kup-radix.h
@@ -16,7 +16,9 @@
 #ifdef CONFIG_PPC_KUAP
 	BEGIN_MMU_FTR_SECTION_NESTED(67)
 	ld	\gpr, STACK_REGS_KUAP(r1)
+	isync
 	mtspr	SPRN_AMR, \gpr
+	/* No isync required, see kuap_restore_amr() */
 	END_MMU_FTR_SECTION_NESTED_IFSET(MMU_FTR_RADIX_KUAP, 67)
 #endif
 .endm
@@ -62,8 +64,15 @@
 
 static inline void kuap_restore_amr(struct pt_regs *regs)
 {
-	if (mmu_has_feature(MMU_FTR_RADIX_KUAP))
+	if (mmu_has_feature(MMU_FTR_RADIX_KUAP)) {
+		isync();
 		mtspr(SPRN_AMR, regs->kuap);
+		/*
+		 * No isync required here because we are about to rfi
+		 * back to previous context before any user accesses
+		 * would be made, which is a CSI.
+		 */
+	}
 }
 
 static inline void kuap_check_amr(void)
-- 
2.23.0

