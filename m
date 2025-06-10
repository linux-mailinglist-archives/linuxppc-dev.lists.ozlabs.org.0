Return-Path: <linuxppc-dev+bounces-9246-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C894AD3B1E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jun 2025 16:29:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bGrm14lRdz3bpM;
	Wed, 11 Jun 2025 00:29:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::433"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749565793;
	cv=none; b=FHYgh6IwPKXKT1Pky9xq/QruKlcWWIEbvpmI6BZmRlyr5wmp4ZVyktqu9ygMq0USeHJJTcSoXh7DeTnIBepQsWN8gMniuLoga8ssJSt1ADP7G5sGmImBhc5hdTSwufAYj94nkz33rG9JkHxzPZT4qqGeVE9U5vkXMq82Ew2efFj5tuch/iLr9IuXWz/Q7Rb+RUVY/3ljNvf2Yr6hb4C/gxUoq2aFuf5OlbZ/RO79grwZjAY5rbORfguTc8/vW32LcrVVj5V5RHurNQ1/BCZU8ATW5/zHD7B1RChewLADnakO3NA/Lbz9gBIek/unHtI6wPfUBL0uFjc99MmnabnUhA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749565793; c=relaxed/relaxed;
	bh=esEZPNG+RjP7eIdE+H90U4csFlF97uknnEYr/Yzqr4Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NexVdHRYju+rHGBI6swHT+WBRefpoVRdsG/jteMPVRNVqPFAU4wN1H0HIFtaTNKQD2DdoV9/qlzI2WQa9oMU2LB2dC7LEqP3ToLbxgO1qPZvpY9YNX8z/vToILoPIH3xF68tNysmMWhlbSLhHtGZy6rIdF4iEo1ZjhOdGayOxZYyxoj07Jce9T5AxAp5EJbFAWBOp6kFd7Vd0lv2uBqTsgXGkJtKVg2hQ1lLLpzCGHbweUASVVlzalnQsIbev+GFe2G8PrvA9YUP4U4/64ZbZVj+94Pwu4mvfglQFrchdtc2Hdd/1djDhs3wD9rG10ZGSDN/ko9JHl2OLlQyImFpwA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=i93Lzsp2; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com; envelope-from=fourier.thomas@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=i93Lzsp2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com; envelope-from=fourier.thomas@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bGrm01YjRz3bmQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Jun 2025 00:29:51 +1000 (AEST)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3a4f7865b22so887667f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jun 2025 07:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749565789; x=1750170589; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=esEZPNG+RjP7eIdE+H90U4csFlF97uknnEYr/Yzqr4Y=;
        b=i93Lzsp23NfUOnhLgJ6JyO4MHgMzzhW7MNWUW66L55q8A+uoSzsnCD1Uc2/Rr2+hC2
         JdAG4aHj/2Wza1t+Z9GbpuIA02vdEEuo7L8kFdnYyUCYqDp6ViPO5Nx/gT18Y8fdVQLe
         NlR7TxHYHDnPoWtDjX4gYTzMoGWycLskotk2SOl5h/dkdhjMXwKFOtasBFfAfekWBFLE
         4MGm/leQK2aELpS2pa3HQb0HA/cycPg4tTJE0WOIHQ+omylSPM9SMIZOSURZReey3v+N
         i1Iac6hv2OTl6j1vvjw9hzT3EIDviEKLiagfN4An/VPSa8Rn6zStsIGJbyS1SiRBO/ut
         Ggcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749565789; x=1750170589;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=esEZPNG+RjP7eIdE+H90U4csFlF97uknnEYr/Yzqr4Y=;
        b=PENW1MQt4DsiXtMAqmS8NmX8SCtm79at/gSYcI4NETMuDVoD1YYGE8wzzOPWqIaUM+
         so6aBEoXzE9Xdf+0I8rGQcUcaTi9hCoIheZpy/lGDrSGfzL4ouWFRAiEDiNYf54M2y42
         HJvBw2D2jzVKOq+2+m1g+T/bKQ5yQbRMFIcfRU8SYU7ZDmjXYRXQ/RWtDEgGKXfy9rFu
         a5x7S2SnbXV/t2pkgKc1HxoIlFoqn76aiI4upCc73azxUmTUc9nn58jUZ5BWUef5ge8W
         QvGj6rxZdTqEqnKKKpZrdyhcDMgFMXjpnnLC5WMd+ewuRUfovWKJHbH+TTElNtlaxZGY
         7WOA==
X-Forwarded-Encrypted: i=1; AJvYcCXIf0vMrKV81cpASULYNvlG4wg9WTJd82TfTqbpd4cGjRH5CoBUdUzGo2DKsocgJzIlYa7/Jk4k6a2evG8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywzb7gEYPrZnCT/frpDb/Vas1drKK43C6dhvleewdVZKZie2JKn
	xZ5YIOTXK1GUp8Z9GSrh/0JBWYNPN7zPDVg5gDttnstfCoDpjdZhUmUs
X-Gm-Gg: ASbGncsINuCpyh4AaxygrrLc+Y9h+nCLZ30C4XJd8ZkYVpHgU26afkZrd8EhXwK7kr1
	2AWacGdduYVUbD4nvRA+2AlCTjOKiJ3vopWAnK781WNFPJa79EEuUIkbxPd50BS/ggNlkDTWt0J
	BguioR9F2nXRpXPnlY0Ug7ibjeyu18xgFGldwKIiEYpI0bMGG0mpBBelO9w9tlijMs3wWK/7nqW
	V4GJVSEdpNDYqxnj97ZPVGZgZeqUa4/lwecEGjcf/9HM+oShhCUjIDP7tlJb+NDnrxlXMLz4vTH
	kfZ9af7Fn4v5xk/tObwGOZu1qoMDNvdu8qAxcvcaOV0xy4+LucHKIft66sKX5MvUSMdJ4jFpnAR
	35b1JKa2IIfDjQsg=
X-Google-Smtp-Source: AGHT+IEsEw3VXsZOTaD+aKW25Mfmt5QTfOeNT+U4CyY9HFg2QSr7SIkvRCBKCEAtxjFu1sU2doGYRw==
X-Received: by 2002:a05:600c:4e12:b0:451:dee4:f667 with SMTP id 5b1f17b1804b1-452fe0a41c5mr55546505e9.7.1749565788521;
        Tue, 10 Jun 2025 07:29:48 -0700 (PDT)
Received: from thomas-precision3591.imag.fr ([2001:660:5301:24:31ff:bbc1:f423:fc85])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a53229de53sm12376324f8f.8.2025.06.10.07.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 07:29:48 -0700 (PDT)
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
Subject: [PATCH v2] (powerpc/512) Fix possible `dma_unmap_single()` on uninitialized pointer
Date: Tue, 10 Jun 2025 16:29:11 +0200
Message-ID: <20250610142918.169540-2-fourier.thomas@gmail.com>
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
 arch/powerpc/platforms/512x/mpc512x_lpbfifo.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/512x/mpc512x_lpbfifo.c b/arch/powerpc/platforms/512x/mpc512x_lpbfifo.c
index 9668b052cd4b..f251e0f68262 100644
--- a/arch/powerpc/platforms/512x/mpc512x_lpbfifo.c
+++ b/arch/powerpc/platforms/512x/mpc512x_lpbfifo.c
@@ -240,10 +240,8 @@ static int mpc512x_lpbfifo_kick(void)
 	dma_conf.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
 
 	/* Make DMA channel work with LPB FIFO data register */
-	if (dma_dev->device_config(lpbfifo.chan, &dma_conf)) {
-		ret = -EINVAL;
-		goto err_dma_prep;
-	}
+	if (dma_dev->device_config(lpbfifo.chan, &dma_conf))
+		return -EINVAL;
 
 	sg_init_table(&sg, 1);
 
-- 
2.43.0


