Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 175642567A0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Aug 2020 14:48:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bdx8g1dCkzDqnD
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Aug 2020 22:48:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::542;
 helo=mail-ed1-x542.google.com; envelope-from=luc.vanoostenryck@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Hew/ODMp; dkim-atps=neutral
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bdx6X5M9FzDqlh
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Aug 2020 22:46:25 +1000 (AEST)
Received: by mail-ed1-x542.google.com with SMTP id n13so1462853edo.10
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Aug 2020 05:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e52rc4zDcLwYIKS8oi+duVhjBLUdNkpPNyhl018nj50=;
 b=Hew/ODMpbqiuT9ygl7dWUZSpQZgywitQhWoLluFmNui8dQaHgiK/bLImqDIrgVgAQ5
 PjRIH9yQC8MLwQP4HNuy6fJVJ3XVryhg96DmdtzoH6ZxSSNHpqFp3V+s+EOFkwunED2x
 kt2Yt1RHfXzxHedJakqGsX5XYPoiIf4okPs5x8wGGd8+VqKBzd4njqmVYIvA6g9J5fFq
 xTLWqaOOwU3VW1//s34T1bR0hSQqu9FGRT9ZftBUnN1nxtA0tjPBWywms2S4HPQFdzzn
 /ADSzcrhdFDm7mfsxvuxkN2qEdKnYTAMIuJI5i5jyLweW8HTZnmHWo56owUWOsvr3zMs
 qTNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e52rc4zDcLwYIKS8oi+duVhjBLUdNkpPNyhl018nj50=;
 b=BJTLRMZYFnux1+gFnC6aUqht0gY3rYDmGrljkK5AwQPlxoAe/bk34wNCQWVdeDFV/r
 Oc+41Zf0RuHvhutsxXK7UAoXg2S2sHtrVU40botgXVyqgJhDcExBDexhvb8pdLMGiN2i
 d/2cILg2jPW6N+z9hNJTv7HMJOo8ZmRDdiGUWMdmlkzu0ywTyqXGPrAoUFaXM97wuWoC
 Ntv0FqkfPFtXbNRInDyCLzfaJRmSPE0Xg3SXUuJTWPluSpo3TjceHp0Eop45XP/eijSm
 pUdFYOee85UJ+hW+05KUWUvEsUB9owIQ2K0uuhJeOWkvZR2EkXdaVnIYFAuzRist0C4b
 57CQ==
X-Gm-Message-State: AOAM531E/aDMTsbhbQBRTBpi82T6rqIjTAqqQGi1yFWtUJqUIvU+voC4
 BcmhzfjulmeJ2AWMXjlhWLs=
X-Google-Smtp-Source: ABdhPJzcjxxnjokV5mGXr56iS0uOolltS1jUKTNzwMECcvPSzNJ1LTFu8Bh5mASuKnhQx67V/u4hGg==
X-Received: by 2002:a50:b946:: with SMTP id m64mr3374913ede.92.1598705179494; 
 Sat, 29 Aug 2020 05:46:19 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a03f:a7fb:e200:414a:8107:3def:ee41])
 by smtp.gmail.com with ESMTPSA id h2sm2054664edz.60.2020.08.29.05.46.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Aug 2020 05:46:18 -0700 (PDT)
From: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Subject: [PATCH] fsldma: fsl_ioread64*() do not need lower_32_bits()
Date: Sat, 29 Aug 2020 14:45:38 +0200
Message-Id: <20200829124538.7475-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200829105116.GA246533@roeck-us.net>
References: <20200829105116.GA246533@roeck-us.net>
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
Cc: linux-kernel@vger.kernel.org, Joerg Roedel <joerg.roedel@amd.com>,
 linuxppc-dev@lists.ozlabs.org, Li Yang <leoyang.li@nxp.com>,
 Zhang Wei <zw@zh-kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, dmaengine@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Dan Williams <dan.j.williams@intel.com>, Guenter Roeck <linux@roeck-us.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

For ppc32, the functions fsl_ioread64() & fsl_ioread64be()
use lower_32_bits() as a fancy way to cast the pointer to u32
in order to do non-atomic 64-bit IO.

But the pointer is already 32-bit, so simply cast the pointer to u32.

This fixes a compile error introduced by
   ef91bb196b0d ("kernel.h: Silence sparse warning in lower_32_bits")

Fixes: ef91bb196b0db1013ef8705367bc2d7944ef696b
Reported-by: Guenter Roeck <linux@roeck-us.net>
Cc: Li Yang <leoyang.li@nxp.com>
Cc: Zhang Wei <zw@zh-kernel.org>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: dmaengine@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 drivers/dma/fsldma.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/fsldma.h b/drivers/dma/fsldma.h
index 56f18ae99233..6f6fa7641fa2 100644
--- a/drivers/dma/fsldma.h
+++ b/drivers/dma/fsldma.h
@@ -205,7 +205,7 @@ struct fsldma_chan {
 #else
 static u64 fsl_ioread64(const u64 __iomem *addr)
 {
-	u32 fsl_addr = lower_32_bits(addr);
+	u32 fsl_addr = (u32) addr;
 	u64 fsl_addr_hi = (u64)in_le32((u32 *)(fsl_addr + 1)) << 32;
 
 	return fsl_addr_hi | in_le32((u32 *)fsl_addr);
@@ -219,7 +219,7 @@ static void fsl_iowrite64(u64 val, u64 __iomem *addr)
 
 static u64 fsl_ioread64be(const u64 __iomem *addr)
 {
-	u32 fsl_addr = lower_32_bits(addr);
+	u32 fsl_addr = (u32) addr;
 	u64 fsl_addr_hi = (u64)in_be32((u32 *)fsl_addr) << 32;
 
 	return fsl_addr_hi | in_be32((u32 *)(fsl_addr + 1));
-- 
2.28.0

