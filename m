Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BE58D19D3EA
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 11:39:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tvz73rXQzDqQt
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 20:39:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=cnBUR6GH; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tvtn56KczDqB5
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Apr 2020 20:35:45 +1100 (AEDT)
Received: by mail-pl1-x641.google.com with SMTP id g2so2500376plo.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Apr 2020 02:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jck+N8Cd5XHMVjsqS5EZ7OUXYiHgDO298ha4DXB2730=;
 b=cnBUR6GHb1sHPBU9qugGgCKGnsv02iz08ONX8Y5XHOzlOVGzh0KFU/d4YGl/Mknx1r
 dGCrjmo6PRMVZlSHEwGhDyazSlLdUtbA7Zu5FblrINzPEm1LtZJP+goO4gcCudpnwNtT
 YKt4BO+1uE1ia2ooxHQdagAWiTpfUTwKIxvju67Nu+fLyosi1WVMTujJIGUmNvi2/ppu
 XV3fvqoZNuCjke7pPBi3irg7VFlLnoplWeJSGp6xu+5FrDIDgTHjB18FNDNsRIRbmRE8
 mMCMyqW+UBKRdc4W6nsUf6SSLgUCgg5d4FWWEgL1tGHDLFBkKz2GKv8DVzKsCYj415/7
 pRxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jck+N8Cd5XHMVjsqS5EZ7OUXYiHgDO298ha4DXB2730=;
 b=ttq4KL0s2SkODQj0dJJCw8Cq86L7NWeY+Kqc/GG71/lrP5cvcOswNZherELmp8VYnn
 12II4BXl9GNR8miRBnfSCO2DpKyCvoj2/m5XMo5MsSwb1uwEtg5bQhiYzOHSM/ydD+pg
 nPPx7NfZ2DuoL3AZI/RIBXeuoccRXkoENz4KOIZ/kqeHCucbEdW5Nri0ObBNmr++B6eR
 W9toeO+GyJO9SUK0sBumhXga///DhlJ65qjaT0oLeEE+y83yQgGQZPdWcCm+DxRuDEMS
 wYty/ZjlH5pjcp4CF9cFvBO/czBu5TgxcO4WSgKLqrizrbj0Yn+LgVNz3sAQIz4ch40d
 CmBw==
X-Gm-Message-State: AGi0PuY9dy3QbDCfpHEWL8SuahyrT5srHGjDCQpYmWzVgSgWRd9gnSRK
 2nM3PU0H658bGQ+H0b5meBQTOrIV
X-Google-Smtp-Source: APiQypLGVBCjCUIjc3iAvM6qXEnOBBFsUbxAYOmxe/0rES6an1+n4fpq778EIcelt9cUXdsx9qB5Bg==
X-Received: by 2002:a17:902:7c0c:: with SMTP id
 x12mr7087692pll.155.1585906541910; 
 Fri, 03 Apr 2020 02:35:41 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (60-241-117-97.tpgi.com.au. [60.241.117.97])
 by smtp.gmail.com with ESMTPSA id i7sm5502677pfq.217.2020.04.03.02.35.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2020 02:35:41 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 2/4] powerpc/64s: use mmu_has_feature in set_kuap() and
 get_kuap()
Date: Fri,  3 Apr 2020 19:35:27 +1000
Message-Id: <20200403093529.43587-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200403093529.43587-1-npiggin@gmail.com>
References: <20200403093529.43587-1-npiggin@gmail.com>
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

Commit 8150a153c013 ("powerpc/64s: Use early_mmu_has_feature() in
set_kuap()"), had to switch to using the _early feature test, because
probe_kernel_read was being called very early. After the previous
patch, probe_kernel_read no longer touches kuap, so it can go back to
using the non-_early variant, for better performance.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/book3s/64/kup-radix.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/kup-radix.h b/arch/powerpc/include/asm/book3s/64/kup-radix.h
index 3bcef989a35d..67a7fd0182e6 100644
--- a/arch/powerpc/include/asm/book3s/64/kup-radix.h
+++ b/arch/powerpc/include/asm/book3s/64/kup-radix.h
@@ -79,7 +79,7 @@ static inline void kuap_check_amr(void)
 
 static inline unsigned long get_kuap(void)
 {
-	if (!early_mmu_has_feature(MMU_FTR_RADIX_KUAP))
+	if (!mmu_has_feature(MMU_FTR_RADIX_KUAP))
 		return 0;
 
 	return mfspr(SPRN_AMR);
@@ -87,7 +87,7 @@ static inline unsigned long get_kuap(void)
 
 static inline void set_kuap(unsigned long value)
 {
-	if (!early_mmu_has_feature(MMU_FTR_RADIX_KUAP))
+	if (!mmu_has_feature(MMU_FTR_RADIX_KUAP))
 		return;
 
 	/*
-- 
2.23.0

