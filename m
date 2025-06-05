Return-Path: <linuxppc-dev+bounces-9178-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EE630ACF9F6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Jun 2025 01:19:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bD0lW37fBz2yPS;
	Fri,  6 Jun 2025 09:19:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749141585;
	cv=none; b=Jm9rhnk4kKWzz4yN/4NxXtuEs9/3wewgmPx3I0HwjiEuTNoe97MM03yuj8KvbSDk2pz9gEz1NVfamchLE28nlsjuRc792IaFhclrBJd1rV5V/tNuYxdbxMmYblXuYbRZ61JnesswZqaFgle/USRnMNGZ3gmXzPL1zbpUsdxArkIB99nZ/Z6Ff2laJBWbTe3UZwaXQq7jWAPm8WTLeYNULYXJc3uuDy82xS782LUPkX669BtZEO0wWwBgv2yXu+7/FZ/2VVT7XfSUb5ACs2ZSrb5xB30+MMq8C8vHT8qMRTDa+Z7Hv1wACpBD8cIaIBUjOJ9ZwJ6ayIQ6TddTxHnWVg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749141585; c=relaxed/relaxed;
	bh=JQDRq2J6JVZdzzl58I/TpodvSza3ScCl+sz60fx5X0c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oQ+mVE801s+TiHKwInjKGYVS/bGnvzUcjf6X1eVA81FH7+t0CNwdBaH6KXM+ST2YHt226mlqS+g2NqJgFXWwosjtod7GWGehyDVxA99xC/jXnJ3eiDLUeJkjBtSU96p2C6KIUtxDktAtLBhm6fSBHRPlZdRRDv8vix20CQW3Jp+mc80Xpuez0nkGJ5qrTEXf0+gtzKD91XC5Hrh2EHBPCNptxp8FIJsylh88mZHSlgxY7WOd5uIEVSdEZnZ0gqGgjS9fc4I9DAlZQp2/J//8BVzkStSJeTFBfifqaJpTOQDpeQ1th050J7S5Gr5jPwS7d6L14dfy7Bh7OZ4vgOkerA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MG8r6uia; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com; envelope-from=fourier.thomas@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MG8r6uia;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com; envelope-from=fourier.thomas@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bCqt81sBjz2xHX
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Jun 2025 02:39:43 +1000 (AEST)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3a528e301b0so78977f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Jun 2025 09:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749141578; x=1749746378; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JQDRq2J6JVZdzzl58I/TpodvSza3ScCl+sz60fx5X0c=;
        b=MG8r6uiaflM/RnhHzdcl2IQ0Ui4TwrhnczK3+/F6LPJ2IjMa+brR42SroktAxPZaNk
         h1q4GKqYTkbyA7JDGuhnDyNKnxDFbEuZCPdIrMpWx+wBPUIT5rAnt90crNV8wWKjv6pM
         c2p1IO7fmPP5maKCw1Q0JSYBR+ge6nMJ4I2zSCxnf6WQc4wq8+yiEn7SH+GJAjWxoBTz
         9iwEJuSFnlRbJNrKd3ofQHfiRGptr7LZZm3j+0QCF/+enr/zqggjmF4szvDI/ko727qf
         4JqyrGedsJkgot3NSafqY+xdxqYFPqH/gsTxKae5OncVmn9IE0EdAKRo3kv2TWWGnLiL
         vYZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749141578; x=1749746378;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JQDRq2J6JVZdzzl58I/TpodvSza3ScCl+sz60fx5X0c=;
        b=jh67EBfvIbxYwVzs+MFqg3f0oi0Yn6iRV9lK5b7Tdjcf/rWb4UTdBLvu1EsligwKY8
         +Jesq7JnjaehvNpAY/sen5XfAOxA/rwdJKaoA0exEKdp2LA0ZDBZlE8dO6Fo44vtT9xB
         QrbWbrBxYUaJ2jTH/GKeZYEkzgLPTT8xtiAwTV8R8iJwTng/FTXV7+qylhn7btVyBZ4a
         boh11MnIWmRAlFKUcJQSI134KYTnhOlSUSNSoq6bcCcMLG+TCbiGwAh9IJR+Z4yx5W6W
         Xysr3QD/OMcZFKUAJghrTQSJggCa8PpYZuE8yVxUDTrYoA2vs44/gQ4XwLe5mrbYl6PT
         QxDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGWXPiOwAifkaF4fQw02shkJljS8XcVuYWeev1Hz5kSW6tDk+L6YgNmpcItju7tG/ci9zRZJM7Yy/3HA4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywo/7efwnHvOD7qdxbC+MmBzTVLW3Nhy/Nuk8/FEgMKiEOFVpjM
	0ZlpUFFiiOMN/Fzyiewbt/51Q0jad9ZLi+Bjg/uGBUpB5vCZTuXFYNIg
X-Gm-Gg: ASbGncviZARSNiHgBmRV/AsWvtS+jHa6GgYuaNbaEghekvKFCVhZCr43xoyK0NCAk9u
	qYaHQ67+R8PH42YasI4Vn2CWlEFLNK9RUocKAdtNKtqkji20tvD5m0l5YoPU1CQG4y29HScHVPz
	bY96TN3tzsr4Rav8tP1x5aRnIX7tKMRuFP3guePi5pIx4N9r29EjGqgfqtrXArHrCY71P839qOR
	nf+M7Crbm8I6+1euZIPO8ftf+pP3C5cIFlnlNOOaPkSKvr+p/2QGOGz3wkUEVn83lGz4Z+oIniY
	EOXlOUXTp7NpOhFjoEN1L0KQwsUtC6tfl1vN64thv9CdVJUp/r5fk9ZwTBEDL2ewLlrMBaE=
X-Google-Smtp-Source: AGHT+IFapntRUB2pslt9OoGnLM+SrlC1B8O0oNVU16LpEOaPAczQ9ZO8r4IU5V0ImeNESiOYiHqvKg==
X-Received: by 2002:a05:6000:2891:b0:3a4:f6e0:c1c6 with SMTP id ffacd0b85a97d-3a51d9236d7mr2791274f8f.6.1749141578411;
        Thu, 05 Jun 2025 09:39:38 -0700 (PDT)
Received: from thomas-precision3591.. ([78.246.169.42])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a4f009745esm25224425f8f.71.2025.06.05.09.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 09:39:37 -0700 (PDT)
From: Thomas Fourier <fourier.thomas@gmail.com>
To: 
Cc: Thomas Fourier <fourier.thomas@gmail.com>,
	Anatolij Gustschin <agust@denx.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	linuxppc-dev@lists.ozlabs.org (open list:LINUX FOR POWERPC EMBEDDED MPC5XXX),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] (powerpc/512) Fix possible `dma_unmap_single()` on uninitialized pointer
Date: Thu,  5 Jun 2025 18:37:10 +0200
Message-ID: <20250605163717.18020-1-fourier.thomas@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

If the device configuration fails (if `dma_dev->device_config()`),
`sg_dma_address(&sg)` is not initialized and the jump to `err_dma_prep`
leads to calling `dma_unmap_single()` on `sg_dma_address(&sg)`.

Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
---
 arch/powerpc/platforms/512x/mpc512x_lpbfifo.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/512x/mpc512x_lpbfifo.c b/arch/powerpc/platforms/512x/mpc512x_lpbfifo.c
index 9668b052cd4b..ef3be438f914 100644
--- a/arch/powerpc/platforms/512x/mpc512x_lpbfifo.c
+++ b/arch/powerpc/platforms/512x/mpc512x_lpbfifo.c
@@ -241,8 +241,7 @@ static int mpc512x_lpbfifo_kick(void)
 
 	/* Make DMA channel work with LPB FIFO data register */
 	if (dma_dev->device_config(lpbfifo.chan, &dma_conf)) {
-		ret = -EINVAL;
-		goto err_dma_prep;
+		return -EINVAL;
 	}
 
 	sg_init_table(&sg, 1);
-- 
2.43.0


