Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D19824C7B0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 08:53:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45TswW2tDCzDqH6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 16:53:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="cYvbTgf2"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Tqmp4rjXzDqwM
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2019 15:16:42 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id a93so886124pla.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 22:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S36gVoRulIicvgBrxukcBBJSWzxxF1rkoxok2Me9q0c=;
 b=cYvbTgf2KXhdSq/pW1Mgtg+iecBxJ4grQA+Qfzp8jNgC1CwLfYVI7hVJXhzJfrVQDm
 1DU3q9iHmNqOeqlLB4cR1suqay9g98uPlCTriLSj/aRPZSf681xL9B7hlGaiIb34hhkv
 ToXqBD5N3eZKvbtI9trbEHUO8zHXuIGkdCpSTjworwQkF1AQ6tBRS9lVSWdiP3oCPhUM
 HW0QT9ZRTbA38V0WlcW9mXZt038qvv5p4TiEVB7uXEacbRdcwBGVfh1qMdSkX9BDFEk/
 0x8K16o1H4nJXIrWxs2r3BVFhEM2Gj1fnRM7NaOXktyt95y0wQ229FDt8RTvtjbt8tbd
 ZwZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S36gVoRulIicvgBrxukcBBJSWzxxF1rkoxok2Me9q0c=;
 b=fIZmVdzXdbAf9BHNo4oM+zogkAD2MkMWqUgtexRCMi/6yQRkObdyt/IJWcS6kwcKi8
 Xyio3z/EHB62aJq29bP05Zj+7fi8ZbIYE+7HcfQjkGBhYcXN8zOZZF6yO2jx+y8zRWy8
 soo7IWSWcy8SNVcyYIwazz3OatPUEE7LaAnCNHxNp58s2ehHXhcwqD/eieHIIJh2xERn
 FMr9x9+uRnhIUKU6kBAJX9GRNwO/WnZ8JAMhdNYxxgdzuOQBuH4I0hnTWZW3ugk2aHqh
 8o8Se5GOqAMg14Gx3Zeyi+hgGmEhHxkH4lSnsYE5Vz9gHfkX729GL36z28oubXbaLMZC
 CRxw==
X-Gm-Message-State: APjAAAWeGkCDbJIcWlJk2jXL4M5fya17/vrJAWsHfK24tXRkBi/cCnwt
 lgyQhQdibVBvDv4uFMtaGmLhkQiY
X-Google-Smtp-Source: APXvYqzpoCeYAKOguRjg6R7G79Q3arCVHhWnT8711IlwL1dH7YDqVfVDLsxfkFA1DmL5R+JTymg/WA==
X-Received: by 2002:a17:902:b43:: with SMTP id
 61mr126100234plq.322.1561007800529; 
 Wed, 19 Jun 2019 22:16:40 -0700 (PDT)
Received: from bobo.local0.net (193-116-72-140.tpgi.com.au. [193.116.72.140])
 by smtp.gmail.com with ESMTPSA id
 h12sm8235847pje.12.2019.06.19.22.16.38
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 19 Jun 2019 22:16:40 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 46/52] powerpc/64s/exception: fix machine check early
 should not set AMR
Date: Thu, 20 Jun 2019 15:14:53 +1000
Message-Id: <20190620051459.29573-47-npiggin@gmail.com>
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

The early machine check runs in real mode, so locking is unnecessary.
Worse, the windup does not restore AMR, so this can result in a false
KUAP fault after a recoverable machine check hits inside a user copy
operation.

Fix this similarly to HMI by just avoiding the kuap lock in the
early machine check handler (it will be set by the late handler that
runs in virtual mode if that runs).

Fixes: 890274c2dc4c0 ("powerpc/64s: Implement KUAP for Radix MMU")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index ab22af2509d8..8ed787dc579c 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1012,7 +1012,7 @@ TRAMP_REAL_BEGIN(machine_check_common_early)
 	mfspr	r11,SPRN_DSISR		/* Save DSISR */
 	std	r11,_DSISR(r1)
 	std	r9,_CCR(r1)		/* Save CR in stackframe */
-	kuap_save_amr_and_lock r9, r10, cr1
+	/* We don't touch AMR here, we never go to virtual mode */
 	/* Save r9 through r13 from EXMC save area to stack frame. */
 	EXCEPTION_PROLOG_COMMON_2(PACA_EXMC)
 	mfmsr	r11			/* get MSR value */
-- 
2.20.1

