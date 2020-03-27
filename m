Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A6D1951B6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 08:07:40 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48pXx54kZ7zDqZD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 18:07:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=NyVaZRD6; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48pXsN5Sx4zDqCw
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Mar 2020 18:04:24 +1100 (AEDT)
Received: by mail-pg1-x544.google.com with SMTP id j29so4163021pgl.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Mar 2020 00:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jck+N8Cd5XHMVjsqS5EZ7OUXYiHgDO298ha4DXB2730=;
 b=NyVaZRD63OZ2O/j9McEZL3K0f0rHbXjyNnY7etLetUKPOSIftW3BcQ+oDa8P7gqWw+
 ee1Zsj6cH8vLwFggLDQ2sBRT938eG/ys1D6ycPOV4m5D2ViTMelUpdPEdx58aGQ0SPNp
 sAgiI6IhutW6upYaxHmb8Mt134tXPpRR6GvFuu/FMLFcnZlE5ykJRberXAPP8hD1AzYq
 REnRggU9zjSHeiGMm98fi1c+xd5LAbJ9I/lIDjfmjJneIpp3S84JP0QugF0sSzDT10ey
 cMoXfKPR7F7OW1nT93/JQqlQm7ch0BKk7RrTWK4lBy/WTWCiUF0qUye+PiixJH/cDZJa
 Z36g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jck+N8Cd5XHMVjsqS5EZ7OUXYiHgDO298ha4DXB2730=;
 b=H0xXqJ4KMtExAcPh1cZGOJ9Mec22G1tz6gXLqvWUALK6U30E3vBx111vOXHXEr5HRv
 J6YBt6j6T5lqyBxH5dtSpJWanfKidwmlcgZLm68YoST8LxUXd/VjbxRL7/MtqK0MCFFv
 py7YPD5VE+bcPfPzgRv0H3i3lTMAvVdjv/0wv6u//Sb3bkpkNYfs6mQGgUKSm62mRTjo
 vw2JJ4thD3OgqcV//DRnRdbprSfDWdWn0fPzS15mIHw0T7XExajWGFWToDa0jkQgeLqZ
 yOuRJLT8FVwVekK17gMqEe2lAg13VE19HbgPoCTxlL/TkrcIvbRvO9ClpG0oTdwsER6P
 5g/w==
X-Gm-Message-State: ANhLgQ3j0bUlnwyaIBsFQ1LZouy6p8T0BR8YRkE9qCdhUO5uje7KZ6fy
 /JsPy8wX+83om6xRjzielL2dK/3m
X-Google-Smtp-Source: ADFU+vukHpOjLdNXvE9Fh58A7DM1wflpGlqPbt4yeaJukps6vzsy7J40lbJkpZpo2gUp4Kv1LAk+gg==
X-Received: by 2002:a62:3086:: with SMTP id w128mr13225992pfw.63.1585292662084; 
 Fri, 27 Mar 2020 00:04:22 -0700 (PDT)
Received: from bobo.ibm.com (14-202-190-183.tpgi.com.au. [14.202.190.183])
 by smtp.gmail.com with ESMTPSA id s98sm3075805pjb.46.2020.03.27.00.04.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2020 00:04:21 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/4] powerpc/64s: use mmu_has_feature in set_kuap() and
 get_kuap()
Date: Fri, 27 Mar 2020 17:02:38 +1000
Message-Id: <20200327070240.427074-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200327070240.427074-1-npiggin@gmail.com>
References: <20200327070240.427074-1-npiggin@gmail.com>
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

