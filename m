Return-Path: <linuxppc-dev+bounces-17749-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KNlcOG+OqGmzvgAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17749-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 20:56:31 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 465D320749C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 20:56:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fR3MY742hz3cDT;
	Thu, 05 Mar 2026 06:56:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1029"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772633708;
	cv=none; b=b/gmjhW+5yTJJmuX5Z7+OzPO4zTA0aP8eSPTZEI5QWxFkXIquO+sDTLyQVoaMoUROJK4PznUHxvmaYxKNlbRHoKfq/C0z5qesu6JboRtvbGRATPF9RV7Aq8KCo5fW5gHEvvBD7J8b+Zj7DTv3zdLgGtiM8K2iLB6fq5z0Xa8mgKOs6Smz/rfkik/pLk2hUgJVHARcBpu6FMkf/dJKNVlidg1nD95PtuM+h7spXqchLeHdfV6q6OpG4WwfIT9tXsqOpDiADoSBGXkWKt87tHREhVPL78WFmgOlHDomPbxe6hQUe6sKQ/IZu9WCV4kN7yXhKnOvq5w5UPF+G1lgOJI8g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772633708; c=relaxed/relaxed;
	bh=9OBV1g9f6o6sz6h2YLW6cb0WqXaVph12Op+HL554xjY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lKgjVCb3gITClZPh86oehnVuqLl7ERaSLLzavW5FF93C8Z2/DgVnrfXelx35q8h68ZnjMIp3l3VBdx4xkuZYbbeesH7UUdq3dQugY1j+jYyt6MUuA2oSpMYk9a2nTB+Qq/ISGrHqXt5aSLESYy5aer/4gRrlysHhsP+3jzl2aObiHdJi2ZLZGroaYO7FP9TjEVNvkFLEH9n2TSf5InW9P5u27AHT1KGc+odTm6AAj0wbK54O5uq2d4R4ej2OCA9vilNPv9ceTzUEXd0WhbvkhvwWNIjW0lXKg3ZHX/S0/TiV9fmJRog81uVRv9njgg20F3q3nxvfAGsFLupen8wlJA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ow75zy4s; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com; envelope-from=linux.amoon@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ow75zy4s;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com; envelope-from=linux.amoon@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQvnl3Bqrz3btg
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Mar 2026 01:15:06 +1100 (AEDT)
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-3591cc98871so3035060a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 06:15:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772633705; x=1773238505; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9OBV1g9f6o6sz6h2YLW6cb0WqXaVph12Op+HL554xjY=;
        b=Ow75zy4s9l8rmh3qofbhISxz7hRj5PO/8+TDlGeC3naNZM7QiuVwRXRoWXXjEHFKu/
         jBEFeglFreglcR3KSSFiQb4aCd0NV7AT0znGEJujxSx+ggLJBT6fYN2oiX6tToa10W3H
         QlCq+5LecA3MPJjdyuABz8Y2Hz/SEe/O+sesU8c77pW2AFwqJTszk040lO+1MF18Inx8
         y4BL4HDfvghu7qZ/7ukefx1GMn5V4rUPgBSUeWXJWRHgH24D+x65tvQDhtG99dL33xfD
         hw7mYlWDETBinbv5iOQceBCV15k2vRQZxylIObQvAm8n8ygK2yAjWcRSYEBWax96uuE0
         XS6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633705; x=1773238505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9OBV1g9f6o6sz6h2YLW6cb0WqXaVph12Op+HL554xjY=;
        b=fZfFqnI8O9+AG45Sw/WEoimu3CZFkVz4pASPnbgg7b309eTU77p/dUMNX8cbE9gsr/
         hRNldHGf0MszEnUqjQQ5pimbTFstxCao3gjDe/JYVt3eN8isGBSIs/ylLROKJlXqoxYn
         JViTPhW98saCe58J3+LCAp01zea6QOAwagr5dY2tJLEDju0qMs3PND/rht5UjP7ig2Kb
         CafjPkDkxS8rLbWSpalenvUOW7xVYhqZOyK0vSYmsF0PmCh5S4Fm1Z8f8r1D/SS+ZZDX
         FT4bB7tABouxMw9psHqI7jEzPxem8jzN01/wcdw0txEnQyLX3fVkO+FoRHcJR5qgHFA1
         Zl5w==
X-Forwarded-Encrypted: i=1; AJvYcCWGCnMaLeIJY2T7Ie2nRgbEgQvZAVJosCkIZQibs6b+kbZO+Lb+M4enxtSeWKp4RNFP+KCk0dvnEkUbD9U=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyci6OhnIJ6s0gxpHsOnfnQq+SBzuE+wrqWWkd/IUL+AYJnsLF7
	idMCTko705Jnz4TXN5BCdzofXwG3dsVbb8uU86fqAuhIbIxETdJ0N4va
X-Gm-Gg: ATEYQzzOHakrnDZomu7TKnIcor64eX1gaFHeksnHDi5YugIx9LjPBSzfALrUBcyM1aG
	FI66rIjg5TH7Sk8gi3qZ+g9F5YwS/PhfbfaYyuyE09Y9FBMdCJRwZvacdtjTw1EZnX+IxUoJVdq
	WPOK9d2iuf9tUH0RG2S1y42kWLUsQVvJAsldQBq4pj3cKyeqpqN5Dt4WEZk63appzGMWjLdAbMZ
	gH1Jn9o81e/6i6QnmRGw8GV6jXrSqX9+Fu458wVXXHOoIz/QvqZyTaNmh0r/HzFka72Cek8qq3o
	Up+biofhAqURhISDCWSa3reE92lbVWSNl16UAZ23sVvxOTHf9JQVKnmdge9InEmp+tGEUwinJo0
	/mMv6SRDXIVs5g0gFyvKpQYW7hR/65MAN2c4BM4Ut1aOkkq8OUFhFy+eGJ7+53VM5FZX4lkSSu9
	oMNBhGOqrBGg1RqnRJSzGE
X-Received: by 2002:a17:90b:164d:b0:359:964f:491b with SMTP id 98e67ed59e1d1-359a69c8cb6mr1870621a91.9.1772633704630;
        Wed, 04 Mar 2026 06:15:04 -0800 (PST)
Received: from rockpi-5b ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c4c0f80sm6826545a91.16.2026.03.04.06.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:15:03 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Minghuan Lian <minghuan.Lian@nxp.com>,
	Mingkai Hu <mingkai.hu@nxp.com>,
	Roy Zang <roy.zang@nxp.com>,
	Yue Wang <yue.wang@Amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jonathan Chocron <jonnyc@amazon.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Jesper Nilsson <jesper.nilsson@axis.com>,
	Paul Walmsley <pjw@kernel.org>,
	Greentime Hu <greentime.hu@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Chuanhua Lei <lchuanhua@maxlinear.com>,
	Srikanth Thokala <srikanth.thokala@intel.com>,
	Xiaowei Song <songxiaowei@hisilicon.com>,
	Binghui Wang <wangbinghui@hisilicon.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	Niklas Cassel <cassel@kernel.org>,
	Koichiro Den <den@valinux.co.jp>,
	Hans Zhang <18255117159@163.com>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	Sai Krishna Musham <sai.krishna.musham@amd.com>,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Nagarjuna Kristam <nkristam@nvidia.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	linux-omap@vger.kernel.org (open list:PCI DRIVER FOR TI DRA7XX/J721E),
	linux-pci@vger.kernel.org (open list:PCI DRIVER FOR TI DRA7XX/J721E),
	linux-arm-kernel@lists.infradead.org (moderated list:PCI DRIVER FOR TI DRA7XX/J721E),
	linux-kernel@vger.kernel.org (open list),
	linux-samsung-soc@vger.kernel.org (open list:PCI DRIVER FOR SAMSUNG EXYNOS),
	linuxppc-dev@lists.ozlabs.org (open list:PCI DRIVER FOR FREESCALE LAYERSCAPE),
	imx@lists.linux.dev (open list:PCI DRIVER FOR FREESCALE LAYERSCAPE),
	linux-amlogic@lists.infradead.org (open list:PCIE DRIVER FOR AMLOGIC MESON),
	linux-arm-kernel@axis.com (open list:PCIE DRIVER FOR AXIS ARTPEC),
	sophgo@lists.linux.dev (open list:SOPHGO DEVICETREES and DRIVERS),
	linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT),
	linux-riscv@lists.infradead.org (open list:SIFIVE DRIVERS:Keyword:fu[57]40)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [RFC v1 14/18] PCI: meson: Allow asynchronous probing for background link training
Date: Wed,  4 Mar 2026 19:21:57 +0530
Message-ID: <20260304140329.7089-15-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260304140329.7089-1-linux.amoon@gmail.com>
References: <20260304140329.7089-1-linux.amoon@gmail.com>
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
X-Rspamd-Queue-Id: 465D320749C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-17749-lists,linuxppc-dev=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:vigneshr@ti.com,m:s-vadapalli@ti.com,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:mani@kernel.org,m:robh@kernel.org,m:bhelgaas@google.com,m:jingoohan1@gmail.com,m:krzk@kernel.org,m:alim.akhtar@samsung.com,m:minghuan.Lian@nxp.com,m:mingkai.hu@nxp.com,m:roy.zang@nxp.com,m:yue.wang@Amlogic.com,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:jonnyc@amazon.com,m:thomas.petazzoni@bootlin.com,m:jesper.nilsson@axis.com,m:pjw@kernel.org,m:greentime.hu@sifive.com,m:samuel.holland@sifive.com,m:lchuanhua@maxlinear.com,m:srikanth.thokala@intel.com,m:songxiaowei@hisilicon.com,m:wangbinghui@hisilicon.com,m:unicorn_wang@outlook.com,m:inochiama@gmail.com,m:thierry.reding@gmail.com,m:jonathanh@nvidia.com,m:hayashi.kunihiko@socionext.com,m:mhiramat@kernel.org,m:nobuhiro.iwamatsu.x90@mail.toshiba,m:cassel@kernel.org,m:den@valinux.co.jp,m:18255117159@163.com,m:rongqianfeng@vivo.com,m:sai.krishna.musham@amd.c
 om,m:jirislaby@kernel.org,m:thippeswamy.havalige@amd.com,m:christophe.jaillet@wanadoo.fr,m:nkristam@nvidia.com,m:vidyas@nvidia.com,m:linux-omap@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-samsung-soc@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:imx@lists.linux.dev,m:linux-amlogic@lists.infradead.org,m:linux-arm-kernel@axis.com,m:sophgo@lists.linux.dev,m:linux-tegra@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:linux.amoon@gmail.com,m:martinblumenstingl@gmail.com,m:thierryreding@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[linuxamoon@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[ti.com,kernel.org,google.com,gmail.com,samsung.com,nxp.com,Amlogic.com,linaro.org,baylibre.com,googlemail.com,amazon.com,bootlin.com,axis.com,sifive.com,maxlinear.com,intel.com,hisilicon.com,outlook.com,nvidia.com,socionext.com,mail.toshiba,valinux.co.jp,163.com,vivo.com,amd.com,wanadoo.fr,vger.kernel.org,lists.infradead.org,lists.ozlabs.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_GT_50(0.00)[58];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linuxamoon@gmail.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Action: no action

Establishing a PCIe link can take a while, allow asynchronous probing so
that link establishment can happen in the background while other devices
are being probed.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/pci/controller/dwc/pci-meson.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
index 0694084f612b..280146f7b783 100644
--- a/drivers/pci/controller/dwc/pci-meson.c
+++ b/drivers/pci/controller/dwc/pci-meson.c
@@ -467,6 +467,7 @@ static struct platform_driver meson_pcie_driver = {
 	.driver = {
 		.name = "meson-pcie",
 		.of_match_table = meson_pcie_of_match,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 };
 
-- 
2.50.1


