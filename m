Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4646E476BC4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 09:20:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JF4mQ16t9z3fHX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 19:20:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=X8n1kF0C;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82c;
 helo=mail-qt1-x82c.google.com; envelope-from=nnac123@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=X8n1kF0C; dkim-atps=neutral
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JDgKF0y12z30HX
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Dec 2021 03:13:37 +1100 (AEDT)
Received: by mail-qt1-x82c.google.com with SMTP id v22so22281410qtx.8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Dec 2021 08:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5zwVV20JyZ7tzD2KFvN/thIii6fJmIVhEMKDPdNM4kM=;
 b=X8n1kF0CtqztlyxvWV/CMngliejYtvC1Hsl9qvaZ1hxYazpKY7PbsxcSL/Ee2fwzol
 A35DuPWYyXvSCUifJigs6OZkBjwQRTITiiWYCyBHEmJyraXk5QqfZ+0Xf47Nytra1hxx
 QgpGX9lv2XqQNfp/sGkYoqnkSLYWnSkTo/FZfd2JcQwoLNyz0kLW6VYQ6ShYcYBuKunk
 /4Q3dr5YJvkTRTmEplzfciYene0AKZZsfdFLnA6xLNDVxkb1HhnBttHPvLMcve2g2JVz
 N5Owf/SUxMLbi7wjku6vW2ShhM0j/jKnDKfSpNmXW0HP6E7OmfGCiDOO86vSayDh8h1U
 jSQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5zwVV20JyZ7tzD2KFvN/thIii6fJmIVhEMKDPdNM4kM=;
 b=kcqc+mlz9yjsNpiIsR8TJRCEvTs9V8gVwkyZcUfL+e1vDK9JOwN7eTvqRjQrblhJPJ
 6Xr4qQn8r2pXEM5tED6hZ7P3MPua71LAQXFX1YoJn0UJqGvTQjMr/d1KcSqrpp5WsfXv
 2ahkBxhYgMytl9++/zk2C04c13dTiXQOIZUm/dD/vMbzs6CO34wH48HYDVvqUGUxX6b1
 d9TrMMB6/pVBG+stDG85uJfXmv4au1u3Y9j2xjnGOYmK5U8lYEVHrKqx9almilPlasQe
 Q2X98KHeXyP5HTH9sTGUiO9L7m2cxa3L+K+y6SJYHyDtxt1V8VhSzjQysmXJJ4eEHoQa
 lm5g==
X-Gm-Message-State: AOAM530zfGbY4ufAsJzpm44ICOGVN8XAUpZ2/H1NqMZNx3UlxbvKdq8G
 IrI6QhQZyynJLfzysaK1vDFGjnzj4Vo=
X-Google-Smtp-Source: ABdhPJx4/H+/yLrqES31nbJyfcebS1gpbTAxRXAR6CVgXFIRsAhBXXAVo7mYgz6NPr0/G5QOX1pkGA==
X-Received: by 2002:ac8:7252:: with SMTP id l18mr12653814qtp.9.1639584814137; 
 Wed, 15 Dec 2021 08:13:34 -0800 (PST)
Received: from starship-12.hsd1.fl.comcast.net
 ([2601:589:4a00:1ed0:73:d0b0:acf1:e2d0])
 by smtp.gmail.com with ESMTPSA id t11sm1276436qkp.56.2021.12.15.08.13.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 08:13:33 -0800 (PST)
From: Nick Child <nnac123@gmail.com>
X-Google-Original-From: Nick Child <nick.child@ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 15/20] powerpc/44x: Add __init attribute to eligible functions
Date: Wed, 15 Dec 2021 11:12:38 -0500
Message-Id: <20211215161243.16396-16-nick.child@ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215161243.16396-1-nick.child@ibm.com>
References: <20211215161243.16396-1-nick.child@ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 16 Dec 2021 19:09:28 +1100
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
Cc: Nick Child <nick.child@ibm.com>, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Some functions defined in 'arch/powerpc/platforms/44x/' are deserving of an
`__init` macro attribute. These functions are only called by other
initialization functions and therefore should inherit the attribute.

Signed-off-by: Nick Child <nick.child@ibm.com>
---
 arch/powerpc/platforms/44x/fsp2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/44x/fsp2.c b/arch/powerpc/platforms/44x/fsp2.c
index 823397c802de..af13a59d2f60 100644
--- a/arch/powerpc/platforms/44x/fsp2.c
+++ b/arch/powerpc/platforms/44x/fsp2.c
@@ -197,7 +197,7 @@ static irqreturn_t rst_wrn_handler(int irq, void *data) {
 	}
 }
 
-static void node_irq_request(const char *compat, irq_handler_t errirq_handler)
+static void __init node_irq_request(const char *compat, irq_handler_t errirq_handler)
 {
 	struct device_node *np;
 	unsigned int irq;
@@ -222,7 +222,7 @@ static void node_irq_request(const char *compat, irq_handler_t errirq_handler)
 	}
 }
 
-static void critical_irq_setup(void)
+static void __init critical_irq_setup(void)
 {
 	node_irq_request(FSP2_CMU_ERR, cmu_err_handler);
 	node_irq_request(FSP2_BUS_ERR, bus_err_handler);
-- 
2.25.1

