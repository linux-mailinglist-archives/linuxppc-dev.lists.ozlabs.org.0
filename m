Return-Path: <linuxppc-dev+bounces-6277-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA51A38965
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Feb 2025 17:38:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YxSxc4JQWz30WT;
	Tue, 18 Feb 2025 03:37:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739810260;
	cv=none; b=byKR+sKOvzjjia/QO3uVr4Ur9AuwMsGfb1yMpoccYE7DaldxTLhJICtG/0TG92qpvkb8xRLXbBW8Tto+A+CCbMqvj3lYXXQJSB1rDjL3gGzDkbmETKwEfTQvHYzo7Qhg3mqfBci0P5sw0ZcNmPaY8fnvbMJjr8Bb6UHIB6uWVvoALCj5kfGTN++zcZAGD/WnN3rAOpPSKdJBLVaM8AML0jD9fTmsQs4ld8FUMhwcsEOvxY0mKuXFuVR5mUFEUhFQxL7uN8MDM2Bd5mE7lf+G9ELzqBwA8mfPzUfQo7EFD9frXdzEZaHGG7zCvCkipaK//E96wOPFYk1UI71ilMi9lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739810260; c=relaxed/relaxed;
	bh=VcpOOuxQgTIkODYzKhCUSbyWoJK/c0mt1V0DRu+9cfQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EsAiKhunzY8hCnGJ35xxPNg8022SjfFvVj8WeZshttSOsnLJ0gMB41vbma2uPKeYMip+JFiq0KwAumnXo40O4oIyBGZo6XvrKNsQpnajutnQ0X1ROscYCkBHSHVoojRFPUura7Q9J3uP3Rkx3KA0qUiWJQgPo4ldhIS067NIieI82TI+WMs/Aqc+WNqvxvNe9ahc6OO8ePKpKkF8ShYRsyxwItDjRW4Wzl7tWfOfAMj3hgIKhh5XS6xxWpT2em2bfkR0qRdtKrnIlWJ6ttThDIUe0HZuGd6azpPdp/4Tj38RkqkNL0g/TVzHX2VUhZ2udSorUqChi/Lyy/C6pDs4rg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aRqWRZ2Z; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com; envelope-from=thierry.reding@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aRqWRZ2Z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com; envelope-from=thierry.reding@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YxSxZ2DxCz30Pn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Feb 2025 03:37:38 +1100 (AEDT)
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-38f24fc466aso3254963f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2025 08:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739810255; x=1740415055; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VcpOOuxQgTIkODYzKhCUSbyWoJK/c0mt1V0DRu+9cfQ=;
        b=aRqWRZ2ZIafVGKRdtIe+ek9NhDNWaMXdgyQIqYOMJdFv+fTYtQX5RaK3gEeJ0rxfXY
         hgVIOCW98YVUV4qQejjKHFO6PtohYm8RH6GaZvAaTaHdU+xoJEz0eOM7lhgS9RlRRKS5
         9Y8TEwPy9yrjLlGrpG2TyP5eLMDy/N4ncGF0q/kzZ0MCoMsOZPj+czHdIUID+WTmiFdm
         0cIvYfO0xdLY6o6jwjX5hqfJACPiBirZJ0UK1efbOZM0XsfyGDXXhJe6YEDCuCssbKnd
         Lyq3rjwgArL/DCm/BqImVpi8+bDoryJilYGgysvzJNAlOSoK8GQdex1i5MDv61IGhkEy
         JaEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739810255; x=1740415055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VcpOOuxQgTIkODYzKhCUSbyWoJK/c0mt1V0DRu+9cfQ=;
        b=XQ3G6SgIET0I6rUvah4IP+SXYCeaTj/E2a3S4UQTOjkGKgerrbn/RzaJUI/yXk4/RH
         OjU5nCpvTINfkrkfIjuZc+5qCXOyvvGTGEZipEZ6Pi8a5UpjWKQQ6EmIDMPFY9jF1y+k
         wFP35FmTU6ceFBqh89E6zFb30FOaLMNSElbpp30VPRIdSySwzDwwhpRpjmwCNYR9FWTA
         n9Brld6koWWGiP/32sx3ryu97fodGSYRzuJa5SHhIT3aAYVLTzq/P2JbeUBhAuO4/q1k
         JUbYjHPlJPP70qgn5p62ZYVUkYZ++vdzu1cc9+OvzUYE/Ny4Fpbe4PqjXvOAxvsIvxsT
         bN3A==
X-Forwarded-Encrypted: i=1; AJvYcCXMbcvawbd859a4RRZVhW1GxXTeSmPVOZcLx1Vwia/OK/MxZ2mS+8b6bidVg9xXyR7BKIlDBO+5/oS2oNQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yykqs9KiP9F7ZJPIqFvaTAFns2PRIy5yZiDe96i7fUzPuy4mIC4
	GXEuHgeg7NYHJQCv8gEwgW4yTg8BFK+sv62wpojWRDAx6AeCvuwC
X-Gm-Gg: ASbGncuWJx99Ce4qj8bNkYerwWmSWLWAoHCtR5ihEWXTu6GacPxS1EWYYR95cqA1r2W
	7o0WNZM2WDP1nFxeAbZAezpGSPSnl2Umu3K7TM3hlHLxyzR5npaog+BEmrdZ/ISe8jpek/swdDy
	iodqCEfDQ6zKL65/q/3vWzYXuJK/RkAgOcBhJi+nVrTPCdxTlSLTDwhxV4kHbjgqLhPnha6FQUp
	fRcm49nMwbJshx+mSQvG0l2ksayzuToXZlhxjEF89qCTAtnRdoUCvnxp60+spWGXFmFCxcAadaj
	9VaLirU1GVY5VPul3UDqMMPL2k8G+Pxiq7AxRzurwYKBbl7xOpF6CS8r9O75Q0GwZsuDky75wOI
	EUfvApQs=
X-Google-Smtp-Source: AGHT+IHfk4fhCYlLR37pJBvXWtv75DWNoeEDbdc68Ccdk3uRnLzXu0R2uoxz3Sfrv9nYBkbSbSFitQ==
X-Received: by 2002:a05:6000:4007:b0:38f:2b59:b550 with SMTP id ffacd0b85a97d-38f34167df2mr8240262f8f.50.1739810255313;
        Mon, 17 Feb 2025 08:37:35 -0800 (PST)
Received: from localhost (p200300e41f22a600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f22:a600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-38f2591570esm12881221f8f.59.2025.02.17.08.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 08:37:34 -0800 (PST)
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
Subject: [PATCH 7/7] soc/tegra: pmc: Derive PMC context from syscore ops
Date: Mon, 17 Feb 2025 17:37:13 +0100
Message-ID: <20250217163713.211949-8-thierry.reding@gmail.com>
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

Rather than relying on a global variable, make use of the fact that the
syscore ops are embedded in the PMC context and can be obtained via
container_of().

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 6a3923e1c792..ea26c2651497 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -3143,6 +3143,7 @@ static void tegra186_pmc_process_wake_events(struct tegra_pmc *pmc, unsigned int
 
 static void tegra186_pmc_wake_syscore_resume(struct syscore_ops *ops)
 {
+	struct tegra_pmc *pmc = container_of(ops, struct tegra_pmc, syscore);
 	u32 status, mask;
 	unsigned int i;
 
@@ -3156,6 +3157,8 @@ static void tegra186_pmc_wake_syscore_resume(struct syscore_ops *ops)
 
 static int tegra186_pmc_wake_syscore_suspend(struct syscore_ops *ops)
 {
+	struct tegra_pmc *pmc = container_of(ops, struct tegra_pmc, syscore);
+
 	wke_read_sw_wake_status(pmc);
 
 	/* flip the wakeup trigger for dual-edge triggered pads
-- 
2.48.1


