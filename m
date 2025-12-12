Return-Path: <linuxppc-dev+bounces-14729-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CFEACB85E9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Dec 2025 10:06:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dSNqK1ZM3z2xnl;
	Fri, 12 Dec 2025 20:06:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765530381;
	cv=none; b=lmkubEL/YTz08dy6IIf8saLTzyvWzUajde04PbmVqa7O/YRGEoirR7TCW+b01LWHT7I5D4VdD1yU6HM8tWP0OYl/EIaCor/sQ4k1/0h2lhWfFEV2G7312OblI77712jC7KAE60Z3Tdw1U8XymwWkgJHe8Zkqco1jJHjUDJtgKgFxR9OC6OZu5gzEflEVmBr+QNRf6atPgcG0kpcpEYTR36674eTHtO7udny8GHd/vSt1zOi3inzMwKidKmNFydJRazn1B4vfV2J28kid0uBAC49WUIgUTvw/vK4R6YQ3hWAsjjFT+Z5KylEbL7LrFA3YS4hXr+Vg1+jyUQHT6jq9vA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765530381; c=relaxed/relaxed;
	bh=18rjT9pgaNvB9Qf9LpM1y6kM3HyLMcgHWq36AJ/Vv+M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aYdPoZGDJqwQUfCloZGeik6SgkzQYLbz9z0PpMOiOp7dKd4maDXzY5TACb5aZUQZgNM0nWnH1DGKxTnRgCkWhpzmaRxy3fXelR9tZwqC8l++HFQBETtbphYp1KezAqF9FuDYFUaQoOPNItxPP6r8bXB9J2bLv2xE2kMR7dlmp0gH7nQJbkOFrblJ7bG7tyf21DwhaN2H+4Z6gq5YFgdFcFYfF73mPagfE2cvFqStsspILitWsDNoYz2lhRo2iE5LCoQXnhgvzzc0GS+MlGzgWV9RLJ7fdEP0mwy0VgFXLUrMm589OgPuZhybZeQsS2oXK2FRjdp57jcOsZaR6hXxUw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BjwjnkHE; dkim-atps=neutral; spf=pass (client-ip=209.85.210.181; helo=mail-pf1-f181.google.com; envelope-from=linmq006@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BjwjnkHE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.210.181; helo=mail-pf1-f181.google.com; envelope-from=linmq006@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dSNqH5Zg9z2xNk
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Dec 2025 20:06:18 +1100 (AEDT)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7bf0ad0cb87so1213951b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Dec 2025 01:06:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765530316; x=1766135116; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=18rjT9pgaNvB9Qf9LpM1y6kM3HyLMcgHWq36AJ/Vv+M=;
        b=BjwjnkHEnhuBsRhlwWh5Jus7XXBcK+ARYEN6RMVuVyrbJ8ZBjXoqAdsC6/RK/Xzjr4
         +EyOp4SeCviAgxwl4U9jYWDI/6kuEBuwtq957yrPvy0wRifBPdp5zpzrkGCpiifx2584
         P3NWpqbQsmIwfyEslc9LaLS0OaLiWREfrX0drJ1vCTKgX0+yGaGVxfka/DNLSM43S0d/
         8DPFMdPfL/ADAszAE8m+ExU+rC/LB2vvVk06jcqgXGxoL4cAccY4AS5diCVaZJDxRsHX
         6rX+pN6zMu7Jfk92IO4jAqyJNCUug5hHFGco6ZeDHtHVcMZaifT34aN4sj+7iNC46/3M
         mIxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765530316; x=1766135116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=18rjT9pgaNvB9Qf9LpM1y6kM3HyLMcgHWq36AJ/Vv+M=;
        b=Hp1vqvP4dZ+Ip28roDA17ls1bZr8U654tw1xU2BZFqZEjtlHF8lH0SKXKMuV5+S4EW
         w6czg3JexzX4JDQXst4OuIKctb9x7W6D8DK7XO6++mquPTLljrkvSYH9TOTUAJUXeqHD
         jgkP5equjkWJ7E+bqx2O7ozEr/vK7FhRtQIcn0bEAPbleLvle2OiVjXgt4GLJ7xfu2l5
         zh0AdZ4Bdq7YWVbfKXz3BGkJxOsjvNQJ68hu7x9IfpzFEddiyZ3N/IBEn9jJukJWNiAk
         ZuDAgm+NyyqN1q+JM2aDjfN3e4qSn2a/n5t6/iFPeHg5ts7zSey4PjcH/Xcbhazqmz5+
         fC8A==
X-Forwarded-Encrypted: i=1; AJvYcCXrE+NdfySLKnsxBy+jJcZWFtAj947fd8IBJtHi96I3PXAbrxnS8NPkAKV5iZQS6IpXlEhbGGqCMZbgmCM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw9x0JJSz3R7QRbv1uQGj4AUw7y8YHbbLRj2Jg4Us0N1OAC2C7h
	K9zroS5yGjYKni8sMgF3frfqnUy6+eM2nGxcOHtsC3SUWi6hAyBzRIJY
X-Gm-Gg: AY/fxX5BAiqswXknDVQrAntolE/m5WQqNNk3HuJdsRzm/dkQETeGor00G7xSnif4Id7
	JkoufiUAtPE2aNL4NFnE+V+3kfVqncpl/HmvigmKSRKMrhs4dFFmkCqDJoUTxPP4mYdniRDJ6yC
	F3fjjYpOUwDoZBKVNLqo83Ue3EA/fwzsITfXsMqzAyfvsM18dUQiMnKqjmBvU00gnuJHzID+j8m
	vFPFS6wytv77NDReDsBHrEBojNzAXlA37f9AdUpzq60hxleD5iHbbC2XaNse8y8RJDF4KW+S98e
	f46yNzITRU4BPlo7XH2obT9QxQc6Efn+smWutDYcT8FQxiU4d3QF8JUYm0ELPL8ZuetSgM3/VXC
	2IeqmDlYRSlxvSIqLJvPN1ZK20ELXkQrdAuzhLu/KqJBLDqhRKXYbYXoTrNxxzVKMfQxtaG44wc
	GrT/qVWOZFShV5
X-Google-Smtp-Source: AGHT+IEDygPV7ef+AunvCxcliNZzMaymBcHsi+xWx0um/y/3lc9mq5i2cxK/n6h0T+vGIbbV/Ff6Dg==
X-Received: by 2002:a05:6a00:bc81:b0:7f6:2b06:7129 with SMTP id d2e1a72fcca58-7f6691b1681mr1561358b3a.43.1765530316226;
        Fri, 12 Dec 2025 01:05:16 -0800 (PST)
Received: from c45b92c47440.. ([202.120.234.58])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7f4c2d4c2eesm4691139b3a.29.2025.12.12.01.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 01:05:15 -0800 (PST)
From: Miaoqian Lin <linmq006@gmail.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Miaoqian Lin <linmq006@gmail.com>,
	Olof Johansson <olof@lixom.net>,
	Jeff Garzik <jeff@garzik.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH] powerpc/pasemi: Fix error handling in pasemi_dma_init
Date: Fri, 12 Dec 2025 13:05:01 +0400
Message-Id: <20251212090503.2447465-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.25.1
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
X-Spam-Status: No, score=0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Add missing pci_dev_put(iob_pdev) to drop the reference count
obtained by pci_get_device() in case of error.

Found via static analysis and code review.

Fixes: 8ee9d8577935 ("pasemi: DMA engine management library")
Cc: stable@vger.kernel.org
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 arch/powerpc/platforms/pasemi/dma_lib.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/platforms/pasemi/dma_lib.c b/arch/powerpc/platforms/pasemi/dma_lib.c
index 1be1f18f6f09..b824bfe97ce8 100644
--- a/arch/powerpc/platforms/pasemi/dma_lib.c
+++ b/arch/powerpc/platforms/pasemi/dma_lib.c
@@ -530,6 +530,7 @@ int pasemi_dma_init(void)
 		BUG();
 		pr_warn("Can't find DMA controller\n");
 		err = -ENODEV;
+		pci_dev_put(iob_pdev);
 		goto out;
 	}
 	dma_regs = map_onedev(dma_pdev, 0);
-- 
2.25.1


