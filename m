Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E851A0695
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 07:31:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48xGGw4x6vzDr15
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 15:31:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=h6ey34lK; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48xG0D35RWzDqy9
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Apr 2020 15:18:36 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id c23so1173732pgj.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Apr 2020 22:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JRLs41yYdcYPkLphCnYT0V2CoBtaXPrFw05FqsMKt+0=;
 b=h6ey34lKJImpUNY5yXr/DYyLAIb+nu8rRnHAQUKFQu1k5e3eIMwn4O/ocvTuE+1gyS
 3yUD4rGAN6JExM/pvs+e/I+x6zEuaE2FW4xODGTRxlQ+cOwGCUKiurea4ZCsmZDuuBC+
 GZptZVM57cV+WVAXZ048iZqR5DRrS6JnoMr0bywB9k5rIigsYSlonsttpGHv6Ekn/8qn
 lmWcOh0i4Hwp6rtpBLghiSHXIwjHk1qgHceMNdSC+Jae2PNY7XxlOq/oexKDEhf8AYkz
 ovjOZLVMEtQY/T3hViqWScRR5GhpEEHcImF6P1vZevyqqug/mzoskP4SfinJkt3wcBVv
 gnyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JRLs41yYdcYPkLphCnYT0V2CoBtaXPrFw05FqsMKt+0=;
 b=KmseV4hBuk6pNeOorI3ttiepA3q5zKUD3vZgT0qAF3MhtYsg7D9xhdqyXUp/NOYqxU
 Lc8IIp53KxyYcJo+b5EG9uaiUoo2eqpDraSywaW7ZZ4CSalVNBM+ddEkWiBEOOqmEXTL
 nKZUB0nI5/BGcZd6C9mBL1p3uOO6daHenGgAVdvAVg8k39SmnHw5Chxo3FX9zivv0Jrb
 UjizqDD93ap9gOH3NlpH9VtbY4+mFWuNycwREBSaKnCIUMgKJSM6z/uZHbXL0QfRgjEs
 mjJHEFszFDq18L1Vb494tQOfAnUz63dnKkSVNTQqjT9cE3oXQiwwJrbWRNMoWWuejVAt
 Ed6Q==
X-Gm-Message-State: AGi0PuaZZAhPBGbVdMdnx/eE3j+yaHSi2P7oUTS069Rf4nPhkfHp8nUt
 F4J29SC4UIKRL/EvEmEXg94d12wP
X-Google-Smtp-Source: APiQypL1aRuxvrMTUyYgh0yapkvJPC2KXd3tSuOV3U0oSmKHCgGuOw9fkIStBoPpGe+hQvF01erh9g==
X-Received: by 2002:a63:e80b:: with SMTP id s11mr338708pgh.350.1586236712660; 
 Mon, 06 Apr 2020 22:18:32 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (60-241-117-97.tpgi.com.au. [60.241.117.97])
 by smtp.gmail.com with ESMTPSA id y17sm12866486pfl.104.2020.04.06.22.18.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 22:18:32 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 06/15] powerpc/pseries/ras: FWNMI_VALID off by one
Date: Tue,  7 Apr 2020 15:16:27 +1000
Message-Id: <20200407051636.648369-7-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200407051636.648369-1-npiggin@gmail.com>
References: <20200407051636.648369-1-npiggin@gmail.com>
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
Cc: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This was discovered developing qemu fwnmi sreset support. This
off-by-one bug means the last 16 bytes of the rtas area can not
be used for a 16 byte save area.

It's not a serious bug, and QEMU implementation has to retain a
workaround for old kernels, but it's good to tighten it.

Acked-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/platforms/pseries/ras.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/ras.c b/arch/powerpc/platforms/pseries/ras.c
index 972b95ebc867..ed43c2e4d4ee 100644
--- a/arch/powerpc/platforms/pseries/ras.c
+++ b/arch/powerpc/platforms/pseries/ras.c
@@ -395,10 +395,11 @@ static irqreturn_t ras_error_interrupt(int irq, void *dev_id)
 /*
  * Some versions of FWNMI place the buffer inside the 4kB page starting at
  * 0x7000. Other versions place it inside the rtas buffer. We check both.
+ * Minimum size of the buffer is 16 bytes.
  */
 #define VALID_FWNMI_BUFFER(A) \
-	((((A) >= 0x7000) && ((A) < 0x7ff0)) || \
-	(((A) >= rtas.base) && ((A) < (rtas.base + rtas.size - 16))))
+	((((A) >= 0x7000) && ((A) <= 0x8000 - 16)) || \
+	(((A) >= rtas.base) && ((A) <= (rtas.base + rtas.size - 16))))
 
 static inline struct rtas_error_log *fwnmi_get_errlog(void)
 {
-- 
2.23.0

