Return-Path: <linuxppc-dev+bounces-6275-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7138A3895F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Feb 2025 17:38:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YxSxW01Npz30Vm;
	Tue, 18 Feb 2025 03:37:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739810254;
	cv=none; b=k1XIHl4t759wn4F8IHSbctzvBa7VIe2y2HFC2V5lDYpcNSyRFUFDo2zaqGl0np+CVNmaVWbCMQYLUQJA43rDusBOUeEbnfAWcyxaH0RxwoWoRgdJcLM4RFDGZjaXx9Wt2UD+FD7Cy1Pe5HQWnHg+nkBHLiMQk3KuTcDB9oCjU7/mH7PCd3B/N1rflE6QZ5Y4PBywhugLufUs9aIrmRuILAnKHc1h1pE7Z8xBb4opUWkTPaesXy80csYlMikdhh3xgolZwtLRwLUEybHiy6jmOEpE8bLhHU4k+gDZKVQ9NB++4b96eUM6I3GCisbJ6EhixPsOHoV1iCOzb8LsFNSdoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739810254; c=relaxed/relaxed;
	bh=YX3Bs3MZrgBGo5LMWaEIe0GFuG33MQ381ctUNe/mVnI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QBt/NlsaovUES/yh1TH731ZZ5fYrtEeTJenI7FZxSA0mjAEkcymijS9vcBMvivOeHehLIT7mXZZMEkcXAXKSyDTWnJYQ04xL61AOw7Fi/XM/Rdpf7fpJLNJ3nWOdBErtAlp/oTKdFhQwh54QjxO7Ua/THoS/sRgNolLlgwt5LTJakslt9X/iFehOZuj8BJzDIxXdwE0BxRWBv0VZvZyBJkNryY8zR0y9skH5YFy/hN2IJXP+0Gt2/HbW8ST4glakPQptCW8svrkYoVr8b6kw1Q4SmoNG4KhF/uerlW5Eb/QXWb1ohnw3aEkFdXAMhNl2Mz33p/prwScLNxokuMwh/g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mIvht4Xn; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com; envelope-from=thierry.reding@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mIvht4Xn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com; envelope-from=thierry.reding@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YxSxV15KRz30Q3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Feb 2025 03:37:34 +1100 (AEDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4398e839cd4so2723425e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2025 08:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739810251; x=1740415051; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YX3Bs3MZrgBGo5LMWaEIe0GFuG33MQ381ctUNe/mVnI=;
        b=mIvht4XnykDn5Tv+zNbVrkyUlA6nasPcBkT4+OppNENUSvkY891I/1W4FNbwt/y8eF
         SMBZCPaiUhJ4u7i8gsxUerNdCDD8Wg0G3LZKtI3A6q/rPK+DQu/F/VDdp+O1y6j58e+r
         dzciyIoyvURfnQi7tu6lI1AtxrYTV9rF1VvnXobjOmnfQATrOqk22OoOiiX+hhEwmDw3
         qfVjzv1UGsd9+K2Fu3+sQcs5mD/+UUDz48VsLG8ZP+88KI90AGdMIqrZsCe8PwgFNfSN
         hxXYwWfTaKyZOpl33w56SAecCa+qvRyL3hgey8CtpCqq4kCJELrgv7AekH3f8/NZ9/wf
         YbGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739810251; x=1740415051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YX3Bs3MZrgBGo5LMWaEIe0GFuG33MQ381ctUNe/mVnI=;
        b=Q0Rfkt8kl3o9D2TFB4paL9/YLrBzERzBB+NFWi1kesMX8QMKI/unUDlHXuO4b8Df5v
         BzfQQZvA6dbRLsPttJizQI3erSe3i7GiSe+Dcadx79AuAwAKts63ZQpJOJqZSoxjHBF9
         EARGUdv7l7a6s32XES5/1YbYmuU5gQmp6Eytaie45ECt6eUM7f3mvh7WhZq5bouSSgSN
         R1uDMGnxmpGHqQcMlb4kFnfBsqNE5lsNyCxVo3doD37gOBi6tD+LBaJNIaypkDTsyEFb
         eRD+nkvboEW63Rwkb6s8gykLxwEqKGd9QgzHA2g8SA2zvnHriyLXix+Ft/1oFOEYd9fh
         kGLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUOKBEFHODIyhu5G16NtaTVasO81oNpUNF2Wkbp2ljKioVydYb4GVtTPjFFOzSS6ElWbU4CB77u5rZCH4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxpULqg9212LJUswdUn7Yf4ffR4n1JwUJTyi7UrfxruPq5DHv/d
	5tFHMTLCtON/LrGMGrg3z8cnziWQycIbL4iOWwg/4Q3NxRo60BIb
X-Gm-Gg: ASbGncvEH1n5w4rsdUwRRZsIY7x6luGZtiT77ylVauUITYAe3xiTjotQFwiBB+/ZbdM
	cnym2flsh4v7/3vLHLIkgDZtS/IMSFmV47JAUWVslzzLATGITmiJECztUmRNPixrgMFa1b7K0FB
	pHky0wYbteJISfqvizQUNto7ve9iMTPi7WSfVXYt8wDrG+lIxQylU8755SBj1cPhLT+sJIO9GMm
	Pzt9uSYf0+4316+oYxyyc9biIGB8UwqMrn23W209UHl4ME9SoTCHh/VthBeBVIFdcACZA+LW6D6
	4VvQboyXN8RGT/37DVuu33zF5ChoBoVQx9OVS7rNts2xcTicFQZ+/V0QY48wusaYu1soiZ44TCK
	5QNd2Nkc=
X-Google-Smtp-Source: AGHT+IGKeFn1JZI+61Y36W80rkeFL6tO0xV+0w/zCm2hwXiflv2MWSmUK04720sV0csGUnPk6PUGmQ==
X-Received: by 2002:adf:9bdd:0:b0:38d:dffc:c14f with SMTP id ffacd0b85a97d-38f24ce77dcmr14937408f8f.1.1739810251284;
        Mon, 17 Feb 2025 08:37:31 -0800 (PST)
Received: from localhost (p200300e41f22a600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f22:a600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-38f259d5d8bsm12702877f8f.70.2025.02.17.08.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 08:37:30 -0800 (PST)
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
Subject: [PATCH 5/7] clk: mvebu: Embed syscore_ops in clock context
Date: Mon, 17 Feb 2025 17:37:11 +0100
Message-ID: <20250217163713.211949-6-thierry.reding@gmail.com>
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

This enables the syscore callbacks to obtain the clock context without
relying on a separate global variable.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/clk/mvebu/common.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/mvebu/common.c b/drivers/clk/mvebu/common.c
index ee77d307efe0..53712c3e5087 100644
--- a/drivers/clk/mvebu/common.c
+++ b/drivers/clk/mvebu/common.c
@@ -189,6 +189,7 @@ void __init mvebu_coreclk_setup(struct device_node *np,
 DEFINE_SPINLOCK(ctrl_gating_lock);
 
 struct clk_gating_ctrl {
+	struct syscore_ops syscore;
 	spinlock_t *lock;
 	struct clk **gates;
 	int num_gates;
@@ -196,11 +197,15 @@ struct clk_gating_ctrl {
 	u32 saved_reg;
 };
 
-static struct clk_gating_ctrl *ctrl;
+static inline struct clk_gating_ctrl *from_syscore(struct syscore_ops *ops)
+{
+	return container_of(ops, struct clk_gating_ctrl, syscore);
+}
 
 static struct clk *clk_gating_get_src(
 	struct of_phandle_args *clkspec, void *data)
 {
+	struct clk_gating_ctrl *ctrl = data;
 	int n;
 
 	if (clkspec->args_count < 1)
@@ -217,23 +222,23 @@ static struct clk *clk_gating_get_src(
 
 static int mvebu_clk_gating_suspend(struct syscore_ops *ops)
 {
+	struct clk_gating_ctrl *ctrl = from_syscore(ops);
+
 	ctrl->saved_reg = readl(ctrl->base);
 	return 0;
 }
 
 static void mvebu_clk_gating_resume(struct syscore_ops *ops)
 {
+	struct clk_gating_ctrl *ctrl = from_syscore(ops);
+
 	writel(ctrl->saved_reg, ctrl->base);
 }
 
-static struct syscore_ops clk_gate_syscore_ops = {
-	.suspend = mvebu_clk_gating_suspend,
-	.resume = mvebu_clk_gating_resume,
-};
-
 void __init mvebu_clk_gating_setup(struct device_node *np,
 				   const struct clk_gating_soc_desc *desc)
 {
+	static struct clk_gating_ctrl *ctrl;
 	struct clk *clk;
 	void __iomem *base;
 	const char *default_parent = NULL;
@@ -284,7 +289,9 @@ void __init mvebu_clk_gating_setup(struct device_node *np,
 
 	of_clk_add_provider(np, clk_gating_get_src, ctrl);
 
-	register_syscore_ops(&clk_gate_syscore_ops);
+	ctrl->syscore.suspend = mvebu_clk_gating_suspend;
+	ctrl->syscore.resume = mvebu_clk_gating_resume;
+	register_syscore_ops(&ctrl->syscore);
 
 	return;
 gates_out:
-- 
2.48.1


