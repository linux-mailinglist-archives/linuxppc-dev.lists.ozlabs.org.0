Return-Path: <linuxppc-dev+bounces-10281-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6645B08A9D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jul 2025 12:33:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bjTlX5QPKz3blc;
	Thu, 17 Jul 2025 20:32:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752748376;
	cv=none; b=NVA7AdbG1bvmPL6BTyRz+KbLmg+y8bQdzt+J8LIIKxsPRBYVrjML6Htfa3Y7aqwQzuQjbtipkNCtXujCJvHp4qUjZiUPijn7sx3VVjf+QHAB37hw6UvW/mcT+BdvFAeEdnR2v8tp7x/ueoMLnuR7GrLizGAPnJo9a63XwgfXf0/b9S/Osoas8EA+BeFczIoPW8vyHaIFkkh8oi7nj4Z604l+J143UZWfdlGqtS4zH9sOPZ+HJTWReZ7MRMBBrbWAgtSpkxRAyZ2QWjN3P/9MIvOPbF7GmnDJp0pfv8BxzG79RSClFdZ8bqYejjfEl1yD5MFQhgkdK5eZve0IssEFoA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752748376; c=relaxed/relaxed;
	bh=2aLo6QmBH2sfDcjFNDrVzv+tdtk/K/9cagqqXKGweA0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VUbY0t4W6EIntyTx9PfYYCHLUf1kdC6PmAGWAOOuYHpuHneOJkXsxv33OdgY4I78TM5vpXewXaPKQ41uqd7u9suo3gZT6TrOHs9ZtWfawACLaTkG5Gyo/d13soxvnWbXHDrrihFIkvl93z4lZ0P/RwsRV66b2NRpZc8bjxJwav5rVITf71pvZp3aENf5qCrPNq6x/0T0HgaGtrFwlsUxOFzFgfUdKyoN/NtbZWUl1F7jn7vKfHa0W+0LgQxDN0OFaQ1xx+bca72Rm/4CgE/UaVJrx0amWM6dJDG4xIlzi2wptZvcjGO3qpxt/0MEfALf9XO5xQsfjT+nvXV2YWa7WQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AzGkLbtn; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com; envelope-from=thierry.reding@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AzGkLbtn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com; envelope-from=thierry.reding@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bjTlW5S76z2xd3
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jul 2025 20:32:55 +1000 (AEST)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-455e6fb8057so7835475e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jul 2025 03:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752748372; x=1753353172; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2aLo6QmBH2sfDcjFNDrVzv+tdtk/K/9cagqqXKGweA0=;
        b=AzGkLbtnpI6VycIYHGmlMpmVaEGLqcrK/QLNcq+40jQNwyS5EYPeyKP9n+xgQZ2amM
         Cv3k8mkOEpuejcBg8hlKD7IPKazPpYQncteR47EpLzpThw9iXiX9s+w9MxC7D1f/RsM0
         eW01mkXVM2zjFr6poPYLipXFREaDW7Pl477MLS9pBEW55us/UCxxeVEnTuumSsDPJ2I0
         fyIuKnvqoHAXT0C4fDnrlu4/3W6AL5Onmp3POjPTcduAQKeI8VquqZD7WPF/HR7kiMxu
         HGt/KNYHV5wQ7npAPoSTtzdqDH0XZ/Py3zaPUN/FRe9Xp1mJ0MUY5NSIt0L/Tf7otfa2
         3cYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752748372; x=1753353172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2aLo6QmBH2sfDcjFNDrVzv+tdtk/K/9cagqqXKGweA0=;
        b=VMXBv50VBJ+4N6ztwY/Q+t41QPmma2eUO+8g9pBAb+62zDJiG8Ag02BDqEyF0rmSyN
         //EhYUoZqJjJ0Ohx+VfXHLvZg/O4vmOEW5pUwhp+Vrd7UCvIn+vVLFhR767VR+pJbv4h
         6JlZbXve3I0WuFt8sjbavp8NNumaaqCFD5xsZo8Znq1vdPekIUb05nPJFit3JehpszjW
         Ws6/4iYtFvI/otVKSeLPQkOz73ed/FUgOLWQGiy0gWrTML16KxSzIMyuuwIpiYMa/Y2O
         FMjOeCZ3090soX2EzT9zYkOGTVDxHA0mjINJZTlvEP2nnGI1JE9oS5zH7j4eyF7opNWH
         h9Tg==
X-Forwarded-Encrypted: i=1; AJvYcCVQIewA8pD/fnwOSuWDOZph66P0eNfE27c02IJT9m4nyTR4amJaa0H7os7+N//VSMKdSfVY9fAUv6eSrvE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy9AgqoU5CwS62Og4Qk8R7FB9FFsIJTYhQpF7KlXLLHPBON7fVA
	V9VOUQx0/zddoDNCVM7bNtzqsnQTVLHLEC1xpl8hdlCBh+01LC1at58q
X-Gm-Gg: ASbGncvr8H9vqoUVEyajE+jC09yRzraIBQgN/dHw83I/Cfrv4ItJB1oeb9nvoh0Z7ab
	G4MmODIp8iN7wAQm23qzvIBDySU1qf1b7NFdSwwRjY0cRMUiZix2wstGotkzoT03/N5NVFFG21S
	mCpFhnx6CM+437yS/BDCS3e/ohjWDoQl9ElYOA/aGFBipU1Aj272fzzvdtaop6IP0ZXmVtdGidv
	1HKblXMZDZgebluak4xSS2NEvW3HhB8hPE6WOx92a1J0CIFiCwqvJFmzvPkpLjnyARp9U/eRXn3
	fzauPPEWgm7hiDUSpIMUpk/TDKVS0seV/35hbuzG3Xu0ckMWZyj0gra1zXvZfOYie2qqmYtkDCx
	RKZbqukwxXEoOhdg70/oJ2i+Qg2BO1J/d2Y3WZKUZcrFMNlgmWbqBsrDLqJyKldXcgdHd5fl2Ci
	wDneuQWfD688lkjA==
X-Google-Smtp-Source: AGHT+IHy7PA+ydb4zAWKmtnVkxvp2yVipMuhRsPFmT5ULPVHvkEqwkx5+jJwmnytUHEZv9na/OVQiw==
X-Received: by 2002:a05:600c:1d20:b0:454:a37a:db67 with SMTP id 5b1f17b1804b1-4562e36c7a6mr69982365e9.17.1752748372489;
        Thu, 17 Jul 2025 03:32:52 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b5e8bd15bfsm20610595f8f.19.2025.07.17.03.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 03:32:50 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
Subject: [PATCH v2 2/7] MIPS: Embed syscore_ops in PCI context
Date: Thu, 17 Jul 2025 12:32:36 +0200
Message-ID: <20250717103241.2806798-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250717103241.2806798-1-thierry.reding@gmail.com>
References: <20250717103241.2806798-1-thierry.reding@gmail.com>
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
X-Spam-Status: No, score=2.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,SUSPICIOUS_RECIPS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Thierry Reding <treding@nvidia.com>

This enables the syscore callbacks to obtain the PCI context without
relying on a separate global variable.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/mips/pci/pci-alchemy.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/mips/pci/pci-alchemy.c b/arch/mips/pci/pci-alchemy.c
index a20de7160b6b..02f0616518e1 100644
--- a/arch/mips/pci/pci-alchemy.c
+++ b/arch/mips/pci/pci-alchemy.c
@@ -33,6 +33,7 @@
 
 struct alchemy_pci_context {
 	struct pci_controller alchemy_pci_ctrl; /* leave as first member! */
+	struct syscore_ops pmops;
 	void __iomem *regs;			/* ctrl base */
 	/* tools for wired entry for config space access */
 	unsigned long last_elo0;
@@ -46,6 +47,12 @@ struct alchemy_pci_context {
 	int (*board_pci_idsel)(unsigned int devsel, int assert);
 };
 
+static inline struct alchemy_pci_context *
+syscore_to_pci_context(struct syscore_ops *ops)
+{
+	return container_of(ops, struct alchemy_pci_context, pmops);
+}
+
 /* for syscore_ops. There's only one PCI controller on Alchemy chips, so this
  * should suffice for now.
  */
@@ -306,9 +313,7 @@ static int alchemy_pci_def_idsel(unsigned int devsel, int assert)
 /* save PCI controller register contents. */
 static int alchemy_pci_suspend(struct syscore_ops *ops)
 {
-	struct alchemy_pci_context *ctx = __alchemy_pci_ctx;
-	if (!ctx)
-		return 0;
+	struct alchemy_pci_context *ctx = syscore_to_pci_context(ops);
 
 	ctx->pm[0]  = __raw_readl(ctx->regs + PCI_REG_CMEM);
 	ctx->pm[1]  = __raw_readl(ctx->regs + PCI_REG_CONFIG) & 0x0009ffff;
@@ -328,9 +333,7 @@ static int alchemy_pci_suspend(struct syscore_ops *ops)
 
 static void alchemy_pci_resume(struct syscore_ops *ops)
 {
-	struct alchemy_pci_context *ctx = __alchemy_pci_ctx;
-	if (!ctx)
-		return;
+	struct alchemy_pci_context *ctx = syscore_to_pci_context(ops);
 
 	__raw_writel(ctx->pm[0],  ctx->regs + PCI_REG_CMEM);
 	__raw_writel(ctx->pm[2],  ctx->regs + PCI_REG_B2BMASK_CCH);
@@ -354,11 +357,6 @@ static void alchemy_pci_resume(struct syscore_ops *ops)
 	alchemy_pci_wired_entry(ctx);	/* install it */
 }
 
-static struct syscore_ops alchemy_pci_pmops = {
-	.suspend	= alchemy_pci_suspend,
-	.resume		= alchemy_pci_resume,
-};
-
 static int alchemy_pci_probe(struct platform_device *pdev)
 {
 	struct alchemy_pci_platdata *pd = pdev->dev.platform_data;
@@ -478,7 +476,9 @@ static int alchemy_pci_probe(struct platform_device *pdev)
 
 	__alchemy_pci_ctx = ctx;
 	platform_set_drvdata(pdev, ctx);
-	register_syscore_ops(&alchemy_pci_pmops);
+	ctx->pmops.suspend = alchemy_pci_suspend;
+	ctx->pmops.resume = alchemy_pci_resume;
+	register_syscore_ops(&ctx->pmops);
 	register_pci_controller(&ctx->alchemy_pci_ctrl);
 
 	dev_info(&pdev->dev, "PCI controller at %ld MHz\n",
-- 
2.50.0


