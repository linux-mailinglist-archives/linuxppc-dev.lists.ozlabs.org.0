Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED383932C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2019 19:27:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45L8cR3dC1zDr15
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Jun 2019 03:27:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::342; helo=mail-ot1-x342.google.com;
 envelope-from=larry.finger@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lwfinger.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="HnwPzkHo"; 
 dkim-atps=neutral
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45L8ZJ2c2HzDqsR
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Jun 2019 03:25:59 +1000 (AEST)
Received: by mail-ot1-x342.google.com with SMTP id l15so2552846otn.9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 07 Jun 2019 10:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language;
 bh=KxyBt4jFYkAeqzf1jEUKJMpLVe7B1ILDm+weChcMIWw=;
 b=HnwPzkHoHgK8lOOT8fORnOn+rF7rlPB11fEFxNBLb2wCizpjrn0Ago99EygaIR8z9u
 XjWZkQctj5jJAG65bHjVuFjL9i0NhzMIzc2MKuveTgOfRmLS73o8vaC7lJVfFG2wbpkC
 /OZwr8Ebeu5i/HUwj+we5xFYlBaGtcopi2b8mf1IsWP8y7fZErxntTbPrgY6YzPB0kJM
 KfY2EJbS4bt8fNWlB43PwrRUqLdbGh918XvALaSKWGIELcuFjeYd+QdQ4SVO866gE6hr
 M2pWQf/bvEnpr0J/7Bo4mw92Ep5jTmUxXGMDFK02ArX+W/+iDJY7TusqO52L71+Y777n
 RpSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language;
 bh=KxyBt4jFYkAeqzf1jEUKJMpLVe7B1ILDm+weChcMIWw=;
 b=kltEs/xclVQHCD8GGCYE3DcyeRP28yG4t6zpJwtt9BFPWeOrysIwrkEzQdBjthWytb
 NJiSB8Xviuy/lm7hC/e2eYDDKR7gTZrHARz1eAKVQn9v3u6r2vHfJ8pEnJqqVjBizv2Z
 wVCDhZ245snTYqnUZzVU+VKLYsz8bykrddvc4fDuxnC5nswjCkGGmjPB4y/LnNTbZ4C4
 XcFivm0ZaCGqwMWm05ZuenFZ0/Q+QHJed4LLYAp7Z1KGGqlkkP+CNCma8pOcZMI4lsWb
 DtEmRSeLRh7s7Ugj5CT+DxC4hr2cZxp5a9NEqgx4yqtemz63fc3GEO2ME45FNBNvH91W
 N+Sg==
X-Gm-Message-State: APjAAAWM210gj2CAwwqiTYHFq7fu4SUEkkfUTBUe6raCg9qb1DTuaRyk
 sLZKkRjbwGvjqL6elFOTvIEw388s
X-Google-Smtp-Source: APXvYqwXL1deWJrUvbwAmin4bTYZyo7x2kVTaz7L0oNC2lOp+UdNDa2GM6U8DS0msSrwKTPNKwAkzg==
X-Received: by 2002:a9d:5d1a:: with SMTP id b26mr20723333oti.50.1559928356639; 
 Fri, 07 Jun 2019 10:25:56 -0700 (PDT)
Received: from [192.168.1.112] (cpe-24-31-245-230.kc.res.rr.com.
 [24.31.245.230])
 by smtp.gmail.com with ESMTPSA id c19sm945378otl.70.2019.06.07.10.25.55
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Fri, 07 Jun 2019 10:25:55 -0700 (PDT)
Subject: Re: [BISECTED REGRESSION] b43legacy broken on G4 PowerBook
To: Aaro Koskinen <aaro.koskinen@iki.fi>, Christoph Hellwig <hch@lst.de>,
 Christian Zigotzky <chzigotzky@xenosoft.de>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <20190605225059.GA9953@darkstar.musicnaut.iki.fi>
From: Larry Finger <Larry.Finger@lwfinger.net>
Message-ID: <73da300c-871c-77ac-8a3a-deac226743ef@lwfinger.net>
Date: Fri, 7 Jun 2019 12:25:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190605225059.GA9953@darkstar.musicnaut.iki.fi>
Content-Type: multipart/mixed; boundary="------------248DB5856E99694593DD245B"
Content-Language: en-US
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------248DB5856E99694593DD245B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/5/19 5:50 PM, Aaro Koskinen wrote:
> Hi,
> 
> When upgrading from v5.0 -> v5.1 on G4 PowerBook, I noticed WLAN does
> not work anymore:
> 
> [   42.004303] b43legacy-phy0: Loading firmware version 0x127, patch level 14 (2005-04-18 02:36:27)
> [   42.184837] b43legacy-phy0 debug: Chip initialized
> [   42.184873] b43legacy-phy0 ERROR: The machine/kernel does not support the required 30-bit DMA mask
> 
> The same happens with the current mainline.
> 
> Bisected to:
> 
> 	commit 65a21b71f948406201e4f62e41f06513350ca390
> 	Author: Christoph Hellwig <hch@lst.de>
> 	Date:   Wed Feb 13 08:01:26 2019 +0100
> 
> 	    powerpc/dma: remove dma_nommu_dma_supported
> 
> 	    This function is largely identical to the generic version used
> 	    everywhere else.  Replace it with the generic version.
> 
> 	    Signed-off-by: Christoph Hellwig <hch@lst.de>
> 	    Tested-by: Christian Zigotzky <chzigotzky@xenosoft.de>
> 	    Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Aaro,

Please try the attached patch. I'm not really pleased with it and I will 
continue to determine why the fallback to a 30-bit mask fails, but at least this 
one works for me.

Larry



--------------248DB5856E99694593DD245B
Content-Type: text/x-patch;
 name="0001-b43legacy-Fix-DMA-breakage-from-commit-commit-65a21b.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-b43legacy-Fix-DMA-breakage-from-commit-commit-65a21b.pa";
 filename*1="tch"

From 25e2f50273e785598b6bd9a8aee28cf825d3fe9f Mon Sep 17 00:00:00 2001
From: Larry Finger <Larry.Finger@lwfinger.net>
Date: Fri, 7 Jun 2019 12:04:16 -0500
Subject: [PATCH] b43legacy: Fix DMA breakage from commit commit 65a21b71f948
To: kvalo@codeaurora.org
Cc: linux-wireless@vger.kernel.org,
    pkshih@realtek.com

Following commit 65a21b71f948 ("powerpc/dma: remove dma_nommu_dma_supported"),
this driver errors with a message that "The machine/kernel does not
support the required 30-bit DMA mask." Indeed, the hardware only allows
31-bit masks. This solution is to change the fallback mask from 30-
to 31-bits for 32-bit PPC systems.

Fixes: 65a21b71f948 ("powerpc/dma: remove dma_nommu_dma_supported")
Reported-by: Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
Signed-off-by: Larry Finger <Larry.Finger@lwfinger.net>
---
 drivers/net/wireless/broadcom/b43legacy/dma.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/broadcom/b43legacy/dma.c b/drivers/net/wireless/broadcom/b43legacy/dma.c
index 1cc25f44dd9a..75613f516e50 100644
--- a/drivers/net/wireless/broadcom/b43legacy/dma.c
+++ b/drivers/net/wireless/broadcom/b43legacy/dma.c
@@ -27,6 +27,15 @@
 #include <linux/slab.h>
 #include <net/dst.h>
 
+/* Special handling for PPC32 - The maximum DMA mask is 31 bits, and
+ * the fallback to 30 bits fails. Set the fallback at 31.
+ */
+#ifdef CONFIG_PPC32
+#define FB_DMA	31
+#else
+#define FB_DMA	30
+#endif
+
 /* 32bit DMA ops. */
 static
 struct b43legacy_dmadesc32 *op32_idx2desc(struct b43legacy_dmaring *ring,
@@ -418,7 +427,7 @@ static bool b43legacy_dma_mapping_error(struct b43legacy_dmaring *ring,
 
 	switch (ring->type) {
 	case B43legacy_DMA_30BIT:
-		if ((u64)addr + buffersize > (1ULL << 30))
+		if ((u64)addr + buffersize > (1ULL << FB_DMA))
 			goto address_error;
 		break;
 	case B43legacy_DMA_32BIT:
@@ -617,12 +626,12 @@ static u64 supported_dma_mask(struct b43legacy_wldev *dev)
 	if (tmp & B43legacy_DMA32_TXADDREXT_MASK)
 		return DMA_BIT_MASK(32);
 
-	return DMA_BIT_MASK(30);
+	return DMA_BIT_MASK(FB_DMA);
 }
 
 static enum b43legacy_dmatype dma_mask_to_engine_type(u64 dmamask)
 {
-	if (dmamask == DMA_BIT_MASK(30))
+	if (dmamask == DMA_BIT_MASK(FB_DMA))
 		return B43legacy_DMA_30BIT;
 	if (dmamask == DMA_BIT_MASK(32))
 		return B43legacy_DMA_32BIT;
@@ -802,7 +811,7 @@ static int b43legacy_dma_set_mask(struct b43legacy_wldev *dev, u64 mask)
 			continue;
 		}
 		if (mask == DMA_BIT_MASK(32)) {
-			mask = DMA_BIT_MASK(30);
+			mask = DMA_BIT_MASK(FB_DMA);
 			fallback = true;
 			continue;
 		}
-- 
2.21.0


--------------248DB5856E99694593DD245B--
