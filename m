Return-Path: <linuxppc-dev+bounces-13524-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A71F6C1C19E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Oct 2025 17:34:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cxXr13GY4z3c4d;
	Thu, 30 Oct 2025 03:33:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::631"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761755633;
	cv=none; b=WNgqsrCs8nexUtwcwIsYttHaQawXzg3mn2XcTPt8ltbVVILrWG8u3XsNluYjoL06tFq5kL6fjvWvfxODC7njNSGdUJiMB8PSagrii6e62tHgsY9Od8+Yq24VDq9TDWuL1G1MqybAt5zjg+edyEXZfiLD6LT8ULxTjhIkWyqnze36OT09SsMwcllRNe1BDay74brXWhqt94jWzLcdLZq4NqE9LLELrj7p0tkziCKkCnJuiOHeb0MYnKPQAFZzEyn1rUkCo5zKNnh0IG3K8+veYQk3SFvVN7G1TxM5a0iKCA/BdowBj6pDpFqCN+ndWlFoSAsNMRjwevYtmwpHDga0uw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761755633; c=relaxed/relaxed;
	bh=oOtQpkg6YutdjljN7zgxOA0UqmJOiKsRIM6+iFOdM9w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y8tYSnkoJDed8NT7ZGvJtRcZQyflkISx02pmghckROhS/iQ1L9bdlTFAMgz7JuoUZRA1o4IEW5/bV0zFsszZ3OTfYInzWn8XRaBzWt/MylDY9zH/byOi1dVcjdz5ikfHCZZx+191fPy6ddh1T7UwKfBLsk1fr/kg3xZqdWXqJbGuGSydH7ifQ0vbAEcUWr3vCNmtLbIV15EhQqhJMhv2WYdxBaa0IWO1anl0/n9Id4e2GB/ERtcc5SiRf6+pz9mEOWgwVLqVK1qhUtBKp4VioNileSLKLJbO1p/FN905bcrkPb1f0QVuXK+SPudbLRWOKaJqk5eM/ubdwDNllzZMww==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=h3wdfUnC; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com; envelope-from=thierry.reding@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=h3wdfUnC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com; envelope-from=thierry.reding@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cxXqy5Wnzz302l
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Oct 2025 03:33:50 +1100 (AEDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-b704db3686cso12313466b.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Oct 2025 09:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761755628; x=1762360428; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oOtQpkg6YutdjljN7zgxOA0UqmJOiKsRIM6+iFOdM9w=;
        b=h3wdfUnC+TM1fGzxyJJ2Z669pR/L5q2F0OA0sJGij1kcZRgwWrtfgZtKFszWBQJgY+
         4WbD/HLy5joVFV79S/MxLYMo3OayKISvAk2a98BJYqgVy7FDv7+Us0RTO6Zy4c7BvXdB
         mnvPx1EOM7aA+Jy+cJ5MuEfKWi+u33cvxDS4Wo5Hx6gtjKGtYZ8cH4HsfCTvDQIjPBng
         R0H6q/RhstKATQPlNuvEQdzEnJTy07Xs2e8Bk4jrCmZNpiq7FpUFaf4l1vuAIPu3IloW
         9Y5o0eX/TUblxkg8/sE8OAn37dk4XyFHIUl0AFbh7ogmGnmmJ0wMr3RzAhF4nmzTl3r2
         O7cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761755628; x=1762360428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oOtQpkg6YutdjljN7zgxOA0UqmJOiKsRIM6+iFOdM9w=;
        b=kQ/nDMoD71UaqXPOdL2UYnB/fvBxHWDCYl/EvEN/80lr+aV+dSNiMfQnGYtA+M5zYh
         pVGtBZjuUPrr1ebQwf1joJc8jfjgD1hu2CwRoNYnwvDvh/iOAKQw8/jMZvzRqwZ3TuOn
         cE1og54ZLUO6tT3949GBm4YaGLCyqsmfaWEj7JvZU1vWEZ5v/TBSjuXgeJGZzHZhAlO3
         j20zztpeI8ivWHHBliCr01LnDwitjuoGgujvInoh8fZF5guR274mFaWKqI8ZIQmOE/HL
         9JRM6Jiipz0AoI33whNpQZs6xRgbShORHHYaO2z7zV7cWbaK203tPsUAFkhNnbKQz7E2
         beRg==
X-Forwarded-Encrypted: i=1; AJvYcCWWp6s8O3c4/qpYAMo20DIgx5y4XmBlSmeDnQiqFyGGOGApKPoZbFNchwVtMecl78HZIfyqcSXEw+TjA8Y=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxBnSLkVZe3pB/ctHI8cPy8Z1br6zL0CNifEjMeCPyZlsZN3hul
	DInshTSV+Aj+aBDslPXh456S983YWsB5YQPMdoEHQwsLcRkQI0roM93c
X-Gm-Gg: ASbGncuj4LgNwMuFnHEeDS4VbXZVqzxiK/LdhuHKJLh8sX9IobBwy7iDg0wKB6167Aw
	4peoPyMAAAI6ozpQrXTfmC9T/UtgTwb4b3oVi+icC/16TEos4Nzpm59S9MaEVLSTYqmWlZ6koqL
	wKIhorBaeSlfTsCUHv8VvyOWlSf5kSyUbfocI9x3+3krgNxgGM6olqAAcuwmgK8aPmQJ/vGTh0y
	/oC+4C6dhGt5n/DoP+W86wMLOEwrZK1dDyOYwmy+AG/9U9VfWI43vtc1vhUKrX2X0U3sDIGN9Ca
	dSj9S0dP/9hZ9/iqHZDceKNrkSAolNKkdqTKOHhlo4VYwdTdO4GRRHUmVubIqndk0qxJ+UAx/BZ
	cpCrIUKMwPIb5eTpE9M6Pt7buxZR9lMYVSCZnCXJXf7JAglqGk1BkzgUYGAG+5ivjHg+Z0U9ohE
	JFCA1vJBjTpbFTW1Qx9iVOJ9cryez6w5nlMM/ZxQ7BaILJ9o3G+aU3iA==
X-Google-Smtp-Source: AGHT+IFucoSpcC/sMHQ4BHPU2Sj/4WR5SsWuPVRxpOY+Rb83Lsjw7eIU5fItk/Z3WAxH0T7dO6D6kQ==
X-Received: by 2002:a17:906:ee81:b0:b6d:7e01:cbc5 with SMTP id a640c23a62f3a-b703d55289bmr367879066b.53.1761755627345;
        Wed, 29 Oct 2025 09:33:47 -0700 (PDT)
Received: from localhost (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b6d853e5138sm1485764866b.44.2025.10.29.09.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 09:33:46 -0700 (PDT)
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
Subject: [PATCH v3 2/7] MIPS: PCI: Use contextual data instead of global variable
Date: Wed, 29 Oct 2025 17:33:31 +0100
Message-ID: <20251029163336.2785270-3-thierry.reding@gmail.com>
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

Changes in v2:
- remove unused global variable

 arch/mips/pci/pci-alchemy.c | 24 ++++++------------------
 1 file changed, 6 insertions(+), 18 deletions(-)

diff --git a/arch/mips/pci/pci-alchemy.c b/arch/mips/pci/pci-alchemy.c
index 6bfee0f71803..f73bf60bd069 100644
--- a/arch/mips/pci/pci-alchemy.c
+++ b/arch/mips/pci/pci-alchemy.c
@@ -33,6 +33,7 @@
 
 struct alchemy_pci_context {
 	struct pci_controller alchemy_pci_ctrl; /* leave as first member! */
+	struct syscore syscore;
 	void __iomem *regs;			/* ctrl base */
 	/* tools for wired entry for config space access */
 	unsigned long last_elo0;
@@ -46,12 +47,6 @@ struct alchemy_pci_context {
 	int (*board_pci_idsel)(unsigned int devsel, int assert);
 };
 
-/* for syscore_ops. There's only one PCI controller on Alchemy chips, so this
- * should suffice for now.
- */
-static struct alchemy_pci_context *__alchemy_pci_ctx;
-
-
 /* IO/MEM resources for PCI. Keep the memres in sync with fixup_bigphys_addr
  * in arch/mips/alchemy/common/setup.c
  */
@@ -306,9 +301,7 @@ static int alchemy_pci_def_idsel(unsigned int devsel, int assert)
 /* save PCI controller register contents. */
 static int alchemy_pci_suspend(void *data)
 {
-	struct alchemy_pci_context *ctx = __alchemy_pci_ctx;
-	if (!ctx)
-		return 0;
+	struct alchemy_pci_context *ctx = data;
 
 	ctx->pm[0]  = __raw_readl(ctx->regs + PCI_REG_CMEM);
 	ctx->pm[1]  = __raw_readl(ctx->regs + PCI_REG_CONFIG) & 0x0009ffff;
@@ -328,9 +321,7 @@ static int alchemy_pci_suspend(void *data)
 
 static void alchemy_pci_resume(void *data)
 {
-	struct alchemy_pci_context *ctx = __alchemy_pci_ctx;
-	if (!ctx)
-		return;
+	struct alchemy_pci_context *ctx = data;
 
 	__raw_writel(ctx->pm[0],  ctx->regs + PCI_REG_CMEM);
 	__raw_writel(ctx->pm[2],  ctx->regs + PCI_REG_B2BMASK_CCH);
@@ -359,10 +350,6 @@ static const struct syscore_ops alchemy_pci_syscore_ops = {
 	.resume = alchemy_pci_resume,
 };
 
-static struct syscore alchemy_pci_syscore = {
-	.ops = &alchemy_pci_syscore_ops,
-};
-
 static int alchemy_pci_probe(struct platform_device *pdev)
 {
 	struct alchemy_pci_platdata *pd = pdev->dev.platform_data;
@@ -480,9 +467,10 @@ static int alchemy_pci_probe(struct platform_device *pdev)
 	__raw_writel(val, ctx->regs + PCI_REG_CONFIG);
 	wmb();
 
-	__alchemy_pci_ctx = ctx;
 	platform_set_drvdata(pdev, ctx);
-	register_syscore(&alchemy_pci_syscore);
+	ctx->syscore.ops = &alchemy_pci_syscore_ops;
+	ctx->syscore.data = ctx;
+	register_syscore(&ctx->syscore);
 	register_pci_controller(&ctx->alchemy_pci_ctrl);
 
 	dev_info(&pdev->dev, "PCI controller at %ld MHz\n",
-- 
2.51.0


