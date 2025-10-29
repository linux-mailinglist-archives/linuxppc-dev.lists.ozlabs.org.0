Return-Path: <linuxppc-dev+bounces-13530-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CABC1C1D3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Oct 2025 17:34:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cxXrB4c99z3dW4;
	Thu, 30 Oct 2025 03:34:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::52c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761755642;
	cv=none; b=cYe2Fd+c9nPi5mngv/ihmMIFxF5dcZLVyDweTj+19fheCcs9kPJGZ3rKGGfh5968qneYI3ifa5giDFCIVy3LbeyeJ6/92tX8slXFHpSuMLWpBWNSbzKfLZpXkN4KouD5zSO4OqWm2sWCR0UaIHq1CvXel/JsVxuNweUEXN3nwjofR3TjG9WWrgs9y6K+ulV6T01ph6DlBvvP7ymlW3E0CoTnPMmZVbtM/Lf5E9dFNr+VRG7fD1JL3ghkTtxR7yUkryVSBGbP4AhtWpI60euk8JFQubZzQjgvwykmObYI/m4GznC+faPdQUBBjqbD2b8z3+whhsuTm2JNOZ3xqjdSPA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761755642; c=relaxed/relaxed;
	bh=MkaU4JsM1D+JY4wiuorXEjJy2zEEfje0oExQGt/PLrU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VyzRzHJKq3eNtIxB3eIQB4GNux1xMjxWaOG/dF0KshGkhrJV8IH5dgGVTbajQ4le5FggUbREE48aIPkAneDINe/PEw8KsxVPtNqvB57b3LI+uuGLWSZ9zFIOmLq2oqOlmlDk+N27H/Iz1xPqjC2KzFeYHv9tGCv1pNISmUvxvld8kZtRhUzVVAT3oqgcWxrHreLfFFLUWVJti/f3nBdPjC0jH6wbmJMgdxM0Ki6xYVu6NWMCMrB3dMtc9A2fhcIS27SzcVg2mX9baCkBXUSDpCNVWqcybgWWZbiwvfRrJd2ka6JpqCX+GiPlBk0lpEYZYzTFhpyzVlPB54jGeCc6ag==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CoWrvxoN; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com; envelope-from=thierry.reding@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CoWrvxoN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com; envelope-from=thierry.reding@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cxXr94szWz302b
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Oct 2025 03:34:01 +1100 (AEDT)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-63bad3cd668so14650829a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Oct 2025 09:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761755638; x=1762360438; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MkaU4JsM1D+JY4wiuorXEjJy2zEEfje0oExQGt/PLrU=;
        b=CoWrvxoNj+SijcmTQjuw3wZD5vYnVbhscl0ELy8vCYEuEph/ZEK9qyygVwmO3TMuJg
         p0TVDkE8U1MVXWVJqK1nuZP9FZTIEZXFz3ZHjmzgCEYzEKASiZu4Ri6Goiwl1gW9z5IB
         iAoH2034EE1Id2ktiAMtTD25YRxjEaSfR4r3VXoATQfTJF4m4yxFEQ+O681me6llVVJS
         3ISDYqQsBrNU0uSsdRv82jApLisbAjABjuHvmSBmKyQevxoXZy/aqUv2LoYa63UXX5+B
         UZiOGwyT1IHWG49c3LX3/c6dlroVkJpbr2B3bJW6r653rsklgz/9zEZWitrN0ogUFFS6
         BBHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761755638; x=1762360438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MkaU4JsM1D+JY4wiuorXEjJy2zEEfje0oExQGt/PLrU=;
        b=vLt5EkoueTZRd4NVbVBmNElOoEH1MabBubIIDuRjHFRmoMsdWmNc+Qy9e/bVX0sZ10
         PJBCsDFFzC8L+LjvaYPJVE1B/RLOA7DvjaciGM03C1bk/m8+OS6nfqTSKXKcT8hBYe3a
         DaxHn054yhIFJdQV8qUmIteNJdzkgtZIKRTRsMVlGWUMfHApEq0P4kfw0p8ObgVczp+E
         9yIv9Vy9lFxnYoJMQ/h4uC8oXBGj314XScbKcQZJCaLG70lgGXgMx9yvniEbc2uaT1Ob
         hoc1NxF40kSgcb4oE4OQkwsbRLUba6TWkEUqZBZ+xBbI729Aeo8QkXjEPphIeM+BviMm
         LMRA==
X-Forwarded-Encrypted: i=1; AJvYcCVr/SQyxqcy6bsGlaR3RIPrNVMkQQVOxF1ZhFCQN0tbf+l1m9BrNr8VeL9ThohYSGr9VdxVI9+R5bSYz+w=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwCzeL29H6TtGUGI22u7DjFIWuryAWinaZcbqfOWZqMUeK14Da1
	OEmzbFDL0y3edU7+YPTs8QYPjR/Gr/3tSR8m8PAnI5ec8JlZyzKfKYey
X-Gm-Gg: ASbGncvat0c6kwCroOVR6vS2FhZgFF6g2frLPmDf9kqubEpgpSzXHf0un+NpD0zcmfl
	KZLso7G8T6pUklYllo1GCnIP8Fw2ao1Yt1UWljRWVlUjx9RrqWTWHP77uxWCdn1L09EzCGFVgXG
	FMriWTxYKYoftQlFcxPJYxgCCLxVkqg24K4kpyXMZk5uas1AMiRDQaQMsWfmsV0LmnLNFBacMs3
	CmAiU03iVAsfzCuZHMLhImESWJt7nP/0Q7eQiHcjxYIXTteQI6Ic4g/w9qUp/zx7OkR38acxQue
	1rxPdT/YtdGXAAnfqzTrnoR5rSzmAZHPFzzfadDJfdAh0rKkn4aZ7KOgCfl9xmNwasJNMioSkZH
	6wuwlw3p9qp2uhXJFvYLhQJ3XwvIDgupu/h1XIt9D+5DAgbHB56TS+JthgowI1VxGMLFDxk6eiW
	FNkJXsEyeVPjkuVCpKpiHF4x4ouUkjJDWLB6pATMgbevRKKw5DpbHz8+w/MiU32DRxybkf
X-Google-Smtp-Source: AGHT+IHnWRqBehOWBCyuY7cscNzDJLcQ8Q1/xskpkrSKjJiOMcliraM9J9uBI/ZGi7u/t3zd09QFLA==
X-Received: by 2002:a05:6402:e9b:b0:634:544b:a740 with SMTP id 4fb4d7f45d1cf-64044255cf2mr2554809a12.22.1761755638150;
        Wed, 29 Oct 2025 09:33:58 -0700 (PDT)
Received: from localhost (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-63e86c6d7d3sm12474615a12.27.2025.10.29.09.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 09:33:56 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Cc: x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-mips@vger.kernel.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-sh@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 7/7] soc/tegra: pmc: Use contextual data instead of global variable
Date: Wed, 29 Oct 2025 17:33:36 +0100
Message-ID: <20251029163336.2785270-8-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251029163336.2785270-1-thierry.reding@gmail.com>
References: <20251029163336.2785270-1-thierry.reding@gmail.com>
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

From: Thierry Reding <treding@nvidia.com>

Pass the driver-specific data via the syscore struct and use it in the
syscore ops.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v3:
- adjust for API changes and update commit message

 drivers/soc/tegra/pmc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index f57e5a4b4d96..6e0ae0ede263 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -3150,6 +3150,7 @@ static void tegra186_pmc_process_wake_events(struct tegra_pmc *pmc, unsigned int
 
 static void tegra186_pmc_wake_syscore_resume(void *data)
 {
+	struct tegra_pmc *pmc = data;
 	u32 status, mask;
 	unsigned int i;
 
@@ -3163,6 +3164,8 @@ static void tegra186_pmc_wake_syscore_resume(void *data)
 
 static int tegra186_pmc_wake_syscore_suspend(void *data)
 {
+	struct tegra_pmc *pmc = data;
+
 	wke_read_sw_wake_status(pmc);
 
 	/* flip the wakeup trigger for dual-edge triggered pads
@@ -3836,6 +3839,7 @@ static const struct tegra_pmc_regs tegra186_pmc_regs = {
 static void tegra186_pmc_init(struct tegra_pmc *pmc)
 {
 	pmc->syscore.ops = &tegra186_pmc_wake_syscore_ops;
+	pmc->syscore.data = pmc;
 	register_syscore(&pmc->syscore);
 }
 
-- 
2.51.0


