Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E17374C78D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 08:38:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45TsZm1RQwzDqBX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 16:38:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="OsbqAIHz"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45TqmT35kFzDqwH
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2019 15:16:25 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id l19so915528pgh.9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 22:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fr20Nm1c8bFX3ddktA57agGg9B+il0K4LiRWxyvLy3E=;
 b=OsbqAIHz0W/+fcUEwBKpdXsIYgCE4kALdg9taz+WWCIB/UK/f+qIVhvEe60oxw6oXJ
 /mrBZhIXFUGYZvcKuDu53XBo/ilpCfGT68mVmRJD9SKFZogJnj21OKu6A7lQRgkYie7N
 0by2DADqmoUDpqXvhHPfD9hSQxu9A9FbTC2tqJ6MJ3DypbtF3m7wce4lfLd3F9xcghzb
 LcHgtqCJwc2056NVp67zV0qAoaK1TF/i9uvA+cC8OYkqk63EVfERRX+Th8IhU6N5kjA7
 tp++KB48/7QPQ7TwaUEt9Lzv6qqtluANadPtX/SVQwwbTZV9ZFhTzeQI8QrZ3nUL4jb9
 WlHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fr20Nm1c8bFX3ddktA57agGg9B+il0K4LiRWxyvLy3E=;
 b=DYTIhqxlyl9hAJ6uoFEOopdT9H81MpMZ3lGJYVZGfXRGd8vwKnLjzTZUtgoC6ZgRK/
 Q8NjsUoduT7cBuGIfObDOXP7cNMC9lTt8adf1J2EanWZkNWiSpvCEh9lu9vbC+kdXbLm
 MXHWg1FSUNjatOEiN+wEVXeDEeLGZCgqii5kGaiF1ChtyDKB1E2cG8XzV+xk0SsQF44T
 ESQkry0MElVreIcn+wiAEf4wIWu3P1m0PNf0DL/L+oUqNtS8Sf6kcumYQU67Te3WaV2v
 Yr+5QGiHqMQILd9zisOvcdlGODJERELaO9/EGJuKlT8xv9zqBkb4F9AoQGW71XDj1X6S
 1Tkg==
X-Gm-Message-State: APjAAAVBWI8tzYMbwsBWTGNHbBtiPMadP/2Eofv2d+xRq2hgUxmnQn/i
 7HpLMFvm2xHE0wadYhREN0qvyjNU
X-Google-Smtp-Source: APXvYqwmSyhUd1VU3wDJwZRdjxDZo8iP1HQr1Evwe/C6p5eG+VGNrhZAa+2xH/A43XXgVSxiyBwmlg==
X-Received: by 2002:a62:cdc8:: with SMTP id o191mr59325434pfg.74.1561007783412; 
 Wed, 19 Jun 2019 22:16:23 -0700 (PDT)
Received: from bobo.local0.net (193-116-72-140.tpgi.com.au. [193.116.72.140])
 by smtp.gmail.com with ESMTPSA id
 h12sm8235847pje.12.2019.06.19.22.16.21
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 19 Jun 2019 22:16:23 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 39/52] powerpc/64s/exception: denorm handler use standard
 scratch save macro
Date: Thu, 20 Jun 2019 15:14:46 +1000
Message-Id: <20190620051459.29573-40-npiggin@gmail.com>
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

Although the 0x1500 interrupt only applies to bare metal, it is better
to just use the standard macro for scratch save.

Runtime code path remains unchanged (due to instruction patching).

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 437f91179537..99de397a1cd9 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1920,7 +1920,7 @@ EXC_REAL_NONE(0x1400, 0x100)
 EXC_VIRT_NONE(0x5400, 0x100)
 
 EXC_REAL_BEGIN(denorm_exception_hv, 0x1500, 0x100)
-	mtspr	SPRN_SPRG_HSCRATCH0,r13
+	SET_SCRATCH0(r13)
 	EXCEPTION_PROLOG_0 PACA_EXGEN
 	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 0, 0x1500, 0, 0, 0
 
-- 
2.20.1

