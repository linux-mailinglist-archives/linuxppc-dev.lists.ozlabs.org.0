Return-Path: <linuxppc-dev+bounces-6272-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD92A38955
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Feb 2025 17:37:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YxSxP1SPJz306S;
	Tue, 18 Feb 2025 03:37:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739810249;
	cv=none; b=g7DrvWfQifDEm7SwHGgXCh/6c6DBmJYoWt237oqLflr2H/bbuGz01lL+7xbFM36t1bc3lYRVeUIRmpi9B4qAWRrwDe5ZkNUNr028kcTt3C6MW8eFzjcncGf7bPohwDuHnJTvP94d4kPeUOmLpaKaY8o/qJUyQeJ7CiRGoFu84lsd3zWS1U70FygjAXiqppBSvi9BppA/99TF+N3wa0TXgpGiG6Pd+g22otaTpxOuThTnWyW+SYZGHzuYt9bclY/uW+mL46dN6+triVBG9rvjzOc3DeGhmBYbkbj8EPFOUO7CWmV7FqgjfXIEo42ZSgo/1owDVNOCAKdauAZesgJOLA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739810249; c=relaxed/relaxed;
	bh=X/0biRJus/9M4PhuIap27DDVgRLzlMn9BGl57AT63dU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NcDuiuL3c7FuqgMAeIXwuUbMNhAfpBL+adD2BRkyAgRv75Mo6P0bOEPx/m2BlNknWhbNY+vlPtde2sUnhow1WPwqEB0wqpviVB4N6Zh4qZ0YhVl7SOuMW8aArtfg/vw6M0aXlyq6qiLtTiF9KbRy2Om9KHe65rxviTIa606/m/oJuhuIHXNMEQOeuDwWDGOqzLB39wpIN6eWnNgYdj2Mt7isincSI7hD+V19mJrdDdQV4ipt4ZqswDzFVPSEfjcmblc0bmtXBgX/F7xrXsuEGG1SluCRTf4QqvaZ/E5Npwhfvhij7MM+tpxUUr+H1ARs/j9oWmsV3fGLPFOcNAMDqQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Bnl2+mSM; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com; envelope-from=thierry.reding@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Bnl2+mSM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com; envelope-from=thierry.reding@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YxSxN3PdSz30Q3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Feb 2025 03:37:28 +1100 (AEDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43971025798so11984535e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2025 08:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739810245; x=1740415045; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X/0biRJus/9M4PhuIap27DDVgRLzlMn9BGl57AT63dU=;
        b=Bnl2+mSMrbSp+AL+eTNtLy4RtEWL1CNZOVtbBKwmRizS/QybsRl4p1T0zZDVwL1Wqr
         d1cfh83xrgrRLER1+6s2Bx9UkQRUu7pjGKYoGsN7oWQ/7nc0BvYMzpIBXd649fh3YH7t
         D/FBafVqywLgUe4+dQDBpkXSbWcjhdQhyP1i8UpAlC0X7dVyNbVeQc1Seo33G0/X7qX7
         KFEpQ4cKWSdNN/3zEZDB6ZAgnDIsvMDiOwuY21C2QnBDqrMR5bHYaXENApqGkXeuLGpN
         tCphtMaNnW8wYqngJ+fCvkL1aynCosFw8an0yWpFlsEqrm/DmmGhAcSEIdbvPUOB4Kkg
         gMhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739810245; x=1740415045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X/0biRJus/9M4PhuIap27DDVgRLzlMn9BGl57AT63dU=;
        b=aSbXDJL64D8Cxy3Cc2lgV5yCG/We76ZMzdSlU5tjtBYCx89IwWgK0yBckjSGFGiRhe
         6DDI1xCds0WzyKBqP32VwRTL3WXKy51y9MjKqSdtsqn9u5XXN5vg34j1DWXDM+i3BXFW
         acbq0a9JQbeO/jJdFd5+qIe52sAqEUNgDINX/W44bLH4te5orig0dLh4FGf0UlGKSzxg
         nN+EFvpYSerZgtSjWaHtNHufNyPwWjOVGH78gSKczuYSOsACpcj1YLss77GCJp9m2nmO
         2kuWLMqJ6E0a1H/OAoL/PkgDGf5qJSfkVWsZqjwSfwPT8pH5Ci9hlzd7UiuSgDYwp0h+
         P5AA==
X-Forwarded-Encrypted: i=1; AJvYcCVMgVI4EtNFSG9Va5kq6ChR8QfQVpeGLssNddRQ3xE3jdqrD+ciZaaBcJWaYplqy8dv193TBjPp1op2/xk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx/5eORVBY+GwXRJxKIIPbKpSmenIeNqOPwBlFtuni+IfaQ4DER
	TD3luqAGjxOWnDzd4XcJwXAxEhR8usG7Pb3fX6OHzUeb+LJa+kvHnMdxSQ==
X-Gm-Gg: ASbGncsch/jhn5SnZmCzrdPsXs3WXXtV0bYre0EpjQdV9C4FSeO3n2pO1NK56UrJ11l
	G4XldUn5i31oX6yfVVe6pIqulz/QlBzrE/N1Zfpax8Dcn7w2MtBE3BBf8cPxv10Cnp+ujV1Gh3e
	heSrqbElrTZzW/jKr80X4XXYMR7Qwe7haj8LeWZM+yDDl1dsVxKB2gFIhzzsnilEkF38RG3o5vE
	RWa5mtBwCOdZXsw8+w52qIUj8iwkjB9r0l2qz2BEgB6UN2Pvq4oozcGofMhp2994Z+/xbFrL5lN
	ci/zk+o3fQXJmMC5C6o0v9VGaXysLH2y+54f8sO/JP82TOY8qRMiZ2R6z5socsKtV1wWKYwsDsM
	YvUSwo+E=
X-Google-Smtp-Source: AGHT+IGnpGd1arKCvdVh8OB0EDoGo4KblVvIlIVVW7BFnKV8rTfrkS3K0VNVohWAHieTwgBwEJe4Nw==
X-Received: by 2002:a05:600c:4688:b0:439:89e9:4eff with SMTP id 5b1f17b1804b1-43989e951bbmr25428885e9.10.1739810245015;
        Mon, 17 Feb 2025 08:37:25 -0800 (PST)
Received: from localhost (p200300e41f22a600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f22:a600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4398872fa85sm24012905e9.28.2025.02.17.08.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 08:37:23 -0800 (PST)
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
Subject: [PATCH 2/7] MIPS: Embed syscore_ops in PCI context
Date: Mon, 17 Feb 2025 17:37:08 +0100
Message-ID: <20250217163713.211949-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250217163713.211949-1-thierry.reding@gmail.com>
References: <20250217163713.211949-1-thierry.reding@gmail.com>
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=2.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,SUSPICIOUS_RECIPS autolearn=disabled
	version=4.0.0
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

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
2.48.1


