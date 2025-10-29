Return-Path: <linuxppc-dev+bounces-13528-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E659CC1C1BD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Oct 2025 17:34:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cxXr62nBdz3d44;
	Thu, 30 Oct 2025 03:33:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::62d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761755638;
	cv=none; b=oNHXPLvLJ2h/0rKz5x6jIUKQipAVIxBSx2rXoTCH6YVaWZpSMWWqX2TNYH+vpGPC4UZg/LP+YdOkLJbvsQHDkl1whsTgtRDt924xRiwEWA1HT+3x2JU4CByDhVllDwJ33xWN/iOpx3f5WKUjdT4mKzAICTzM5Gvf9fcCW89kDYN1b9HAOXfEvQmla80NYdKpAsjXY27r82sTgZitvd6b2GGSRqnhQ6dRR/8Htl3mVdWt/M/IeYis2ca1FjOPO8OisEdySTDl+BlPdtQBi6m0VkkveyYXiTFSASZlqfLjIBNHeKuFYytGILdfUDZypYD9S7yVd+JuCHgjVDGPdS+aVA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761755638; c=relaxed/relaxed;
	bh=D7niwucTDN3MnvT2f7z1+zCVDCBNmgQwG7r5182Kk6g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i5r7CJ9yGGJrhUGBex69M4J4TjgP61HKRmks8o8YYNcT29ghh1OIEXlOYNaf6+GuTy77+uTLzxJnbeuDS6Tq+3OoqbPoFHMNIINKGu5+40yRkKXoq/72P+DsROeNrYTr0BISk1Y+9xpuq75qW00Cg6A9J6KIHcW0xtHrQDk4Zr85OTp471+WbbaNHAkUMdNgk6gLXMRgdMoZb6qGj9Sp+WdxHXyMYkMNA6ESgS+A9AsuYO9h2HV+VTERNFRyJMD0ZyOK0p7tx2vBESs/csIqEqcrNkgWophMg5wCkNu+WEQPNx8FcT4gr5urmm3TMdRPT83pPrUs754QAO8RHut8ww==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KVYF/0rv; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com; envelope-from=thierry.reding@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KVYF/0rv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com; envelope-from=thierry.reding@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cxXr52wQPz302b
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Oct 2025 03:33:57 +1100 (AEDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-b6d345d7ff7so257422766b.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Oct 2025 09:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761755634; x=1762360434; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D7niwucTDN3MnvT2f7z1+zCVDCBNmgQwG7r5182Kk6g=;
        b=KVYF/0rvjcZyJUPgCt0Qboml4tbF+YNOlXeHAANcNT5N7KPrR+XS6ybB+XmHkLyP+2
         FY9TDzSsOuQSp/zC6f14kbok5uSO6YFVOFK+fzj30VFHB6AWUkzxSzP5Q4WjeNVLkn2w
         fIdD8OSyogENmvxtiIPVFzgydJXKDsH0VmqC6CMsBiWu7V5jWp2PrEGuj8kEt2Vbei2O
         4YUeERBSbzGxc+yhGDss2McYCtPnnXoIiAmRkJpZtSJkbfusIsWBWh19aY4Tws6Npufh
         Mp/2YcV8xj4pkQRXkBXsROUJY6E2MPILkUC2W/fsiEX+jqnqbABN/yy7B9eJvjQqVBaP
         j8Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761755634; x=1762360434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D7niwucTDN3MnvT2f7z1+zCVDCBNmgQwG7r5182Kk6g=;
        b=HSIzDnQqaYivpFLuvPDgBTP3FonOpj78McySv7FxXElV4LHfdtdvzGu5SB2AURcjOj
         8CYfEicp41EgQwORpU44SpTCi7kYCRw2+79M+OU9Iavo6hNUEUiS8sgisl4FPEZDXsaN
         Z2Omh575c2LU/+w+C2880loKqJWL+DdRR9r+xSSfTkXU+kuUJrz/uHnA6Bk3DQ2Xz8B9
         mtWpMwA6OUFQdbcGqKbPLFIO1UWUJZP3AAJ4a3zNAFXiZOt3MVN7Xu+SkXFy1RM2UpAf
         lw1dPOmrJRwK+kZSuNLn1dmrxwtuz+6vfo4mmEo7FcngxxspFAmvrXVJxZzD2s2Haq7V
         2Z0A==
X-Forwarded-Encrypted: i=1; AJvYcCU1zXDBgCcAzUU1p+qSG8cO9QisXrR6wrQ7ifgj8cLaaYVGdVnJASy+Cjbqci+uP+8ybPX8cE6JT1wVJsM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyxmvhXRWYyu0YQx/FDEcH5fdaLj5p3f2LaMRtzlgUwGVktj4hH
	bPGVr2qu+ctzQvFajDfaVFm6VKOJ5kPWENjtWoW0iL0tGRVqIJ9jgEjN
X-Gm-Gg: ASbGnct0evDPY9e3mJm2f1fiPJix3+W5mfUyFymwfLvAvYIvpNpoqPdCMs0Eqa3v8Z9
	smWrAKfkHntiu0WY62VYH9HeRyXXht/wEzvpl4CvtSvIYqyklbeRrFiZh7MiEuWNSAGUwJtPJFT
	z2VmHOTvjXUr3AqFmmCbQ9e7/kBAljnnN2dIhduHXezyq7O8SuDzL2CMT4WbZwlQ9aLPjHDh2cN
	OyWQGOAv83LBtvkGjDfJGIlVN8JJ80+JzcgWjS/Iw/H68HXtdiPxHjiDtVdl+oVJ0C5+h2iHikG
	phdUeQsKEdLloLoXdMgKENHbjg83mxCpCKXGHYI6dZ5bKgXZrkLWk/CHzhYFiDcO9vh2mYzH1sC
	Kdrg/Hd0BdDj8L9TGM0p34jk0Fm948I/xk+K7p/izArxmSHvP19Tj32AsBX+5M/vwsawkf/XBIr
	fwRvvzBmD2ZlXSd2auF3hzU3Km+hP/I9ldZBdE3ouY5pqts1vGNrRiXRytKrI2LyHYUeJx
X-Google-Smtp-Source: AGHT+IGxst0GGPbE3zlpzuYvmZD7MtT+fgNns/2gbspQBUcAcExwpAJ9gNyBIh9hmr+9IwgchPtgzg==
X-Received: by 2002:a17:906:6a21:b0:b3f:f6d:1d9e with SMTP id a640c23a62f3a-b7051f278acmr28890666b.6.1761755633985;
        Wed, 29 Oct 2025 09:33:53 -0700 (PDT)
Received: from localhost (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b6d853696a3sm1468789266b.27.2025.10.29.09.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 09:33:52 -0700 (PDT)
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
Subject: [PATCH v3 5/7] clk: mvebu: Use contextual data instead of global variable
Date: Wed, 29 Oct 2025 17:33:34 +0100
Message-ID: <20251029163336.2785270-6-thierry.reding@gmail.com>
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

 drivers/clk/mvebu/common.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/mvebu/common.c b/drivers/clk/mvebu/common.c
index 5adbbd91a6db..8797de93472c 100644
--- a/drivers/clk/mvebu/common.c
+++ b/drivers/clk/mvebu/common.c
@@ -189,6 +189,7 @@ void __init mvebu_coreclk_setup(struct device_node *np,
 DEFINE_SPINLOCK(ctrl_gating_lock);
 
 struct clk_gating_ctrl {
+	struct syscore syscore;
 	spinlock_t *lock;
 	struct clk **gates;
 	int num_gates;
@@ -196,11 +197,10 @@ struct clk_gating_ctrl {
 	u32 saved_reg;
 };
 
-static struct clk_gating_ctrl *ctrl;
-
 static struct clk *clk_gating_get_src(
 	struct of_phandle_args *clkspec, void *data)
 {
+	struct clk_gating_ctrl *ctrl = data;
 	int n;
 
 	if (clkspec->args_count < 1)
@@ -217,12 +217,16 @@ static struct clk *clk_gating_get_src(
 
 static int mvebu_clk_gating_suspend(void *data)
 {
+	struct clk_gating_ctrl *ctrl = data;
+
 	ctrl->saved_reg = readl(ctrl->base);
 	return 0;
 }
 
 static void mvebu_clk_gating_resume(void *data)
 {
+	struct clk_gating_ctrl *ctrl = data;
+
 	writel(ctrl->saved_reg, ctrl->base);
 }
 
@@ -231,13 +235,10 @@ static const struct syscore_ops clk_gate_syscore_ops = {
 	.resume = mvebu_clk_gating_resume,
 };
 
-static struct syscore clk_gate_syscore = {
-	.ops = &clk_gate_syscore_ops,
-};
-
 void __init mvebu_clk_gating_setup(struct device_node *np,
 				   const struct clk_gating_soc_desc *desc)
 {
+	static struct clk_gating_ctrl *ctrl;
 	struct clk *clk;
 	void __iomem *base;
 	const char *default_parent = NULL;
@@ -288,7 +289,9 @@ void __init mvebu_clk_gating_setup(struct device_node *np,
 
 	of_clk_add_provider(np, clk_gating_get_src, ctrl);
 
-	register_syscore(&clk_gate_syscore);
+	ctrl->syscore.ops = &clk_gate_syscore_ops;
+	ctrl->syscore.data = ctrl;
+	register_syscore(&ctrl->syscore);
 
 	return;
 gates_out:
-- 
2.51.0


