Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 575FC7F5D5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 13:17:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 460Pl60M3kzDr1D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 21:17:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="fenY0jRP"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 460PM45830zDqXJ
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2019 21:00:00 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id l21so35892478pgm.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Aug 2019 04:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BvGZRk5F5zY8W1ZFjbc++khQoghN0Na+KgLhUmUpIgo=;
 b=fenY0jRP9GAOAeLKZZeXkLaw+vqdTCYuFUWGGRri6nHBww9FfftTw66yw7Iy7XlFW+
 UVgdZ/vuGtKQ/JaVSw3+GiEOSutWCdLyXnvP1IWAmkoFy7a0MXXcRgJnvv3BcOWv2+Xw
 /7jbwn2wsUZc7/+mNr4fX21GoX5XhodAahVqwRsU5MuZe9OFKelDG9NquHu4ZFTLEGNj
 Sp1a168BWs5E5OdvsODrcQW4ggKvgT2ygWDyrauggV7YtqYuGNEuRm8ydXKVtUsDw3cL
 55T34jEbFdGvKEqULjs+ucPkMZwYZECTaE1NmSF+WpJbfplGhy8bVVGiNiLqQV/2AaJV
 syfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BvGZRk5F5zY8W1ZFjbc++khQoghN0Na+KgLhUmUpIgo=;
 b=W9TYpeUA/D4XGXHHWZ1UQyHN+h1k1+KJWqqp2FEEo+rwx55fXH4UnW3keFZICbm7Gb
 z3vcXr2dLYwHKLgEsnlEZooQPTyWNbuOvrAAR9p1BZz4H/xaoNezJ4hXOge3kfS0t6uB
 8RTYO+D00xjyMhJutFyijFAP122NHITNb8Oj2/Y5lfG7K5+gXXhxbT4MoPfajlG9b9QN
 QEhIsknC5ptaT4gRHUiSsK54ZUUgwwmmov2HiZgLHLl9+lHZaDBuv/nvGwHcIekhpBYi
 5FmB4qycFLN8VNNPQmVHsN8XYlAi04iRKdiTKo2+a8KX9ergxV/hvi+PQiOSShycamyQ
 aqKg==
X-Gm-Message-State: APjAAAUlCiiNumU9Ofm9HvTBqYw/rEYNpxbewp9mrZKM/8XQzwU4n1hF
 UMtAzlgjX+lpROX2Zx6ZZ0JyMt3FO9k=
X-Google-Smtp-Source: APXvYqyqOq4oN/BjpKjtwIQbCbLGkViD1QTPp8XvTrYUUciS8K13l42C/yCvpkO+FtNMBfQmKpcXwg==
X-Received: by 2002:a63:4e05:: with SMTP id c5mr2873496pgb.333.1564743597636; 
 Fri, 02 Aug 2019 03:59:57 -0700 (PDT)
Received: from bobo.local0.net (193-116-68-11.tpgi.com.au. [193.116.68.11])
 by smtp.gmail.com with ESMTPSA id t96sm7377118pjb.1.2019.08.02.03.59.55
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 02 Aug 2019 03:59:57 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 07/44] powerpc/64s/exception: machine check use correct
 cfar for late handler
Date: Fri,  2 Aug 2019 20:56:32 +1000
Message-Id: <20190802105709.27696-8-npiggin@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190802105709.27696-1-npiggin@gmail.com>
References: <20190802105709.27696-1-npiggin@gmail.com>
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

Bare metal machine checks run an "early" handler in real mode before
running the main handler which reports the event.

The main handler runs exactly as a normal interrupt handler, after the
"windup" which sets registers back as they were at interrupt entry.
CFAR does not get restored by the windup code, so that will be wrong
when the handler is run.

Restore the CFAR to the saved value before running the late handler.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 6ec296762720..16d4881108d5 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1186,6 +1186,10 @@ FTR_SECTION_ELSE
 ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE)
 9:
 	/* Deliver the machine check to host kernel in V mode. */
+BEGIN_FTR_SECTION
+	ld	r10,ORIG_GPR3(r1)
+	mtspr	SPRN_CFAR,r10
+END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
 	MACHINE_CHECK_HANDLER_WINDUP
 	EXCEPTION_PROLOG_0 PACA_EXMC
 	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXMC, 1, 0x200, 1, 1, 0
-- 
2.22.0

