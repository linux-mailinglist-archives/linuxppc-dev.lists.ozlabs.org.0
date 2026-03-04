Return-Path: <linuxppc-dev+bounces-17742-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KG4NGzSOqGmzvgAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17742-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 20:55:32 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFB3207453
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 20:55:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fR3LT1Gm3z3cBW;
	Thu, 05 Mar 2026 06:55:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::429"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772633369;
	cv=none; b=jhgLDAZera9Bzb4Jae07E2bev/re4/rn4p8crv6Us1j/oD6cOxjJNVwHZVI15xgjjMlLeKceQQjtConDDm40p6L6k85xhW7eDIoPA9yFYc6XnyP4XEzkZzk0otxxfydJlKbq0hOjPPbNrmz+hKfuK2MxoQ+owXS8NfnIRcvNUcMACi1ROaS67hvhUOdYTFwZwEFx3LBZY7WwuaXWGmYORgh/9UaI4HTvSBA5aF0ut+nIMCWnxSBz+86D3sGck6f3H/Ipc/utFQfBMZ/5mUU0tPqCkUiaQlFfm1dTuIBhFjvhHg6wwMsQ9nd8nOhJwB3jEYMd3c4EqSVGP5aRsVLwFg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772633369; c=relaxed/relaxed;
	bh=mrS7ZIa0rilgM/jlzfLJJeKLRZ0Q0OYSRBkIhGwwFqw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YuVEQNGYa5RsWFQR7SXBKwZUzT0oBJuJEdZUjd6GU7d2wEMlebfTM6duPjjQ7i/nieLu1utq05y3T2OGokWvu26Dn1GpHa/FlIMo3GsWgsFrm1rpWHXUJUKAj3o/cDM9DRfIDLbf90AEJRvaFU+cueBgTsdWNl/JfVykK192+4bXqwNjdCHP0usHo8AYa4lMudGmINeb200McsL2a4S4hdUGRa39Fz/Acxclv3iHkiz56TOrvs9VOCez06I/r9MWBYS9LcO7D7OlQUjTf/f5xVpSQLZ0Gm3PmNyWgptH79Hh/5STmb7uMUhbu1x+UZ588C2gcO7qmdEDDZ/gALqrhA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PFTwv8Eg; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=linux.amoon@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PFTwv8Eg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=linux.amoon@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQvgD6lY3z3btg
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Mar 2026 01:09:28 +1100 (AEDT)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-82747396358so3571652b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 06:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772633366; x=1773238166; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mrS7ZIa0rilgM/jlzfLJJeKLRZ0Q0OYSRBkIhGwwFqw=;
        b=PFTwv8EgFaD5xfaK7nY6ClyzyOMuT66/K9/8gAwVPAY8BHrJWjNUzmX9UyM1C4DnHo
         C0CfiwdkWUnPeUF8TfRYSDcnj4PEB/9jwzZ0VKaE0aSBfomCU8M70rXR0h/u/xPznwuf
         pEdCcWwQ6BlhcH4tkUb8tB6mx0b4pk9up/TLvzTyKPWYcQUfUOiSba98hEfSPtIZCmfn
         MK9vQfaN4QfEJBAQ8nPjGxXo2RzuI7/NKyoiWujM2yRhsOGUn+dQZmtlvZ+/mQxabOyd
         ergIkAbiRJCqJg8KzrSq4p3ePIkH/6ijFfi26iOHY/NjgE2UFJaFDPEDHtdDFT1a9NOr
         nzDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633366; x=1773238166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mrS7ZIa0rilgM/jlzfLJJeKLRZ0Q0OYSRBkIhGwwFqw=;
        b=GMv6tUhi3kR7WEA6UV6BUgWJslFmQZHZ3QzAKzS97ni2san51JzXfPzuTqX/x1OrCG
         kITB3jeKb94DcHQI+kied55UBprqIWm76cqjBysndtCEIrjRh03HQdjHp66CbZfFM5NF
         MXZB/D2AEqjaeFbndNXc/MKBj08rW4cjFPzzZlNYvw+RrP8Bf7zGOiQDnTLuBWIOnijt
         oUbA32B88qchAtfvzu1zADQ9GVegnaG6hI765lwhfsyFJbReDD229rUB0NMYy19AaYMh
         2rFwMcOm1wqHErRiozaBG5jNH3IYgQsxVqmNqXwI5qGzhiX2Fq9nuCGinXhdjOi1dwM6
         MNwA==
X-Forwarded-Encrypted: i=1; AJvYcCWKh+etSqBwVGE51RHgnuy3qN7bYD15sKhL/KQqP0DnW3aHgqzB6+x91zYHfnQXKei4i3TIKaN7MMRBgZ0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyDmS881lx/l6im2NNIdjWsbr96ls6aTDscJJBej8N/7TWHFyl1
	TVb+1mNExuQtMfaK4q0IVy3Iwaio6iY1XhCW0uO/KGOU5cxVdCvzXqeO
X-Gm-Gg: ATEYQzz0Skn7vk8WYZMD0WkEF1Uzih8ZJD2Hg/It3yY+1hAUrpxzv98PGdQsuGamlM7
	BeDj1u1TQI33mDax79dn/QUQ1kCy2bafp9xUAWQyncn1kDU2w8wfFKNv7KeGyk9GnA9W6hLv5Gf
	pfS4vwZEIAdTF1PwP9qy1+e+18rGc5flIFwmYNAeXDnLEX6AUCHKKwLTfZJempjHhdd6VKzmc2i
	oszrF0XgpOR1Y+ajZzVwH9ypRn3yHK91G6ItachHDaCyZZFW9w41tszt4W2Mq4Lm1Nx7BcAYime
	iGDch8iaYQfToFQrTXi6d4AGQCyPg0+RgmA0Kw7xSVKZPHHzRUg1xKnDpdlBFxpHg+Uq+ke4lZr
	VTThFarmkLKrdzj+COuocViPxLqzkfAB83cDuDoEpbSG2J8hv0lO0uf9YEQORKpK6JS+016cV62
	Ba5F3DHwx5dwbRMN0WjT76
X-Received: by 2002:a17:90a:d00b:b0:34c:9cec:dd83 with SMTP id 98e67ed59e1d1-359a6a7a0a3mr1687183a91.27.1772633366451;
        Wed, 04 Mar 2026 06:09:26 -0800 (PST)
Received: from rockpi-5b ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c4c0f80sm6826545a91.16.2026.03.04.06.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:09:25 -0800 (PST)
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
	Hans Zhang <18255117159@163.com>,
	Koichiro Den <den@valinux.co.jp>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Sai Krishna Musham <sai.krishna.musham@amd.com>,
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
Subject: [RFC v1 07/18] PCI: exynos: Allow asynchronous probing for background link training
Date: Wed,  4 Mar 2026 19:21:50 +0530
Message-ID: <20260304140329.7089-8-linux.amoon@gmail.com>
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
X-Rspamd-Queue-Id: 8FFB3207453
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
	TAGGED_FROM(0.00)[bounces-17742-lists,linuxppc-dev=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:vigneshr@ti.com,m:s-vadapalli@ti.com,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:mani@kernel.org,m:robh@kernel.org,m:bhelgaas@google.com,m:jingoohan1@gmail.com,m:krzk@kernel.org,m:alim.akhtar@samsung.com,m:minghuan.Lian@nxp.com,m:mingkai.hu@nxp.com,m:roy.zang@nxp.com,m:yue.wang@Amlogic.com,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:jonnyc@amazon.com,m:thomas.petazzoni@bootlin.com,m:jesper.nilsson@axis.com,m:pjw@kernel.org,m:greentime.hu@sifive.com,m:samuel.holland@sifive.com,m:lchuanhua@maxlinear.com,m:srikanth.thokala@intel.com,m:songxiaowei@hisilicon.com,m:wangbinghui@hisilicon.com,m:unicorn_wang@outlook.com,m:inochiama@gmail.com,m:thierry.reding@gmail.com,m:jonathanh@nvidia.com,m:hayashi.kunihiko@socionext.com,m:mhiramat@kernel.org,m:nobuhiro.iwamatsu.x90@mail.toshiba,m:cassel@kernel.org,m:18255117159@163.com,m:den@valinux.co.jp,m:rongqianfeng@vivo.com,m:tglx@kernel.org,m:thippe
 swamy.havalige@amd.com,m:jirislaby@kernel.org,m:sai.krishna.musham@amd.com,m:nkristam@nvidia.com,m:vidyas@nvidia.com,m:linux-omap@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-samsung-soc@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:imx@lists.linux.dev,m:linux-amlogic@lists.infradead.org,m:linux-arm-kernel@axis.com,m:sophgo@lists.linux.dev,m:linux-tegra@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:linux.amoon@gmail.com,m:martinblumenstingl@gmail.com,m:thierryreding@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[linuxamoon@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[ti.com,kernel.org,google.com,gmail.com,samsung.com,nxp.com,Amlogic.com,linaro.org,baylibre.com,googlemail.com,amazon.com,bootlin.com,axis.com,sifive.com,maxlinear.com,intel.com,hisilicon.com,outlook.com,nvidia.com,socionext.com,mail.toshiba,163.com,valinux.co.jp,vivo.com,amd.com,vger.kernel.org,lists.infradead.org,lists.ozlabs.org,lists.linux.dev];
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
 drivers/pci/controller/dwc/pci-exynos.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pci-exynos.c b/drivers/pci/controller/dwc/pci-exynos.c
index 0bb7d4f5d784..ee2423e16b58 100644
--- a/drivers/pci/controller/dwc/pci-exynos.c
+++ b/drivers/pci/controller/dwc/pci-exynos.c
@@ -388,6 +388,7 @@ static struct platform_driver exynos_pcie_driver = {
 		.name	= "exynos-pcie",
 		.of_match_table = exynos_pcie_of_match,
 		.pm		= &exynos_pcie_pm_ops,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 };
 module_platform_driver(exynos_pcie_driver);
-- 
2.50.1


