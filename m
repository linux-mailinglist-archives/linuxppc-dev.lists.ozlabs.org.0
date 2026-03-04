Return-Path: <linuxppc-dev+bounces-17751-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cCSrM36OqGmzvgAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17751-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 20:56:46 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D482074AB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 20:56:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fR3Mr0B2sz3cDr;
	Thu, 05 Mar 2026 06:56:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772633803;
	cv=none; b=NdljTn03z1FtOB4kLpoty8Tz9hvwU82F3eUXYAjakxeYZUt9muSR+HMv9y4v0UGjtz3VlD3N54iCqXCop7kj87pc/1Es3WZuIOaQpIjOEBRPChQEkRUuAEQMwmoLDmQBV3N4LDIpzyJ/5XWpMA9vVjZleUZAbgbx4MRSWNVsC2NbpsCEyAqAC+9lRDbIMSBAkPj8YPX3W00kbrnT5heantCi1fow1ZRFJ9vX8J//7PUVk0fJCvu1Gd+7jlzky75pM5v8ysyY0DapfZGTf3tF1bfVCpMFTxH5Qxq255LWpqgGJhpYzcutG8gS8hMrb5YSwb5FQQXax9ESIXgPKSda3g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772633803; c=relaxed/relaxed;
	bh=KDjBy/zS51mD1PxaQ7mIKoDOiKAIHa799oQhdGW8t+4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fwx4rIAlBCZnSZzQD8AhYIZckbWS1Zsl/mNcSzy9FZhMaiNAyY2W7I1pyq0B+GUu0pKIrvARf4OMOu6URbOfp1IM663WPHVS/PxmF1WTfVFFKoZcTobBqtjMk+I+RkA8gHKdx+zrMlHz+4nrYKxG59WrZ1orLPvlSx6sKY+UybBN61tZq7lx9B47KwiEx7FGyqQMnEOzWPln6fDAKyDJNNS3W2ZwhdsD4em/vfn/G3xvU7Mm8RydQ8E1CTwnqBEUUa+t6j3WUmZDMu3UroynH1UU0jJBDYbDiMxBRFpkgG46kjJ88Qrc+Ngbj68Sy2P9Zrk4aSKOuysuo4NOUsD7gg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OujS2PdI; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com; envelope-from=linux.amoon@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OujS2PdI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com; envelope-from=linux.amoon@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQvqZ64Vrz3btg
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Mar 2026 01:16:42 +1100 (AEDT)
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-3591cc98871so3036818a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 06:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772633801; x=1773238601; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KDjBy/zS51mD1PxaQ7mIKoDOiKAIHa799oQhdGW8t+4=;
        b=OujS2PdIPKeA7dQ7HPulk57U0GryWENy+ZNLZZGDB1YlcqiXVco8bBN8JGOE98P05w
         /EfQ2xt8vUBi8js6jTJLb+HVV3mNizBNHzXPqiH7hdLIGeyDq2Bm8E4Lhp82PMBjKN39
         YUcULCmSmE2XCXuJa13gLfTdeJUp0iaBXF9IPbdvciJvgBHwvWt+eDVrvj6rdrv+p3xF
         Mp+N8me5sTOZ/235Rv+xJtXQokzJWM1oRZHGxnCcy2VICF9UVZ87G8f+MIxJlY0p7muG
         9pzWrWuQl9tEesUiyA0s8hbfZGSOlua7GR0n86uMs7l3TZuopmpfUHmmTTfHmLZieLaY
         +8Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633801; x=1773238601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KDjBy/zS51mD1PxaQ7mIKoDOiKAIHa799oQhdGW8t+4=;
        b=fL8ETEcqcKEyradeKG8rxo1kEP56p83WFpUQgaQP2E7kvy+62G9Z2lYRP8QaUcnwYh
         2aGNhaYQKxjeGkkNux0lk+j2/0n8/gGPgK3PVUKTEgTfURfISSFmY2aRp8aToXMHPKEB
         PY7opgN8SgJgdRe8K0znD91RlWXdEV5HQ7s+FG+/N3YyLi9j0qRscnYFKgZ0oJLk5z6m
         D56xBTBOVOoO0W2WRM8gXBZ7veOB/5XEw4Fw9TK/ZdMK2GLCrakt315Q46NF4qfhnix4
         dJaF7vaMqPoi1ulQ5UhmfIy0R93M0eKG8Hr3DBNlkjYNbg2uHA+XNIJALy3mMPTU6ea8
         7Mcg==
X-Forwarded-Encrypted: i=1; AJvYcCXOxg52DTDr0UpHUFfSzc/NUvNozofIXfgcL0dPJ/wSgDDfCSF0nX5E1zsLAdmhXb1P7UwXhO+1f8stIpc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzJGbjtqzj6iKyW0gt4ZFjaCAI9VN84qOz0yjNZ6Ad4XTNHaXYW
	8FlEpXXUaGGi98q37+K7ctmiwKngi5cclubO5nKjOK6DpXoeo/EVL5uP
X-Gm-Gg: ATEYQzzVw4D/ln2MV32Q35wtH0TA9rvGIx9cM7xtvwjHLfXXxz/Kd9xbAbv0NXakKCx
	Iqj3zbdYGiqcwtzyDjnlzpkUre45pCcO5lIixYUw5XpXvE90pOri6ckqbMTKQZtCTEWVm16ziFW
	CxwIGaLc9dGC47P2uW7r32SaJWgKSjuqtziv9LNDE8i9Ol0V8HhWuTVygMar9VWyeAHSFEpHPPH
	1TR6aWQoVt3aEzXewZUYSX7F6QxY5M0cGDMXeGt5TrLoyyR3WhVhiEAQdQU47L2MbSYXSw+Yol5
	ebV74L76RmhPGslop46yHcuhJn4rpc5UtWO51I+HzwOcqTnTFP5T++B20H1m9RoUEJ6TQnpkAJ4
	b++j3gkvHnX2WbB0Ga23jovCGejQKN1ECvhqza6PQUH0U5aw7G1dCq7QDzO7rWI4+6jlXZC3xa0
	zpJZqwsgDzJ1P2HdY491uk
X-Received: by 2002:a17:90b:1d4e:b0:359:8f84:ad8a with SMTP id 98e67ed59e1d1-359a6a88709mr2213203a91.33.1772633800980;
        Wed, 04 Mar 2026 06:16:40 -0800 (PST)
Received: from rockpi-5b ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c4c0f80sm6826545a91.16.2026.03.04.06.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:16:40 -0800 (PST)
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
	Qianfeng Rong <rongqianfeng@vivo.com>,
	Hans Zhang <18255117159@163.com>,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Sai Krishna Musham <sai.krishna.musham@amd.com>,
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
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
Subject: [RFC v1 16/18] PCI: tegra194: Allow asynchronous probing for background link training
Date: Wed,  4 Mar 2026 19:21:59 +0530
Message-ID: <20260304140329.7089-17-linux.amoon@gmail.com>
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
X-Rspamd-Queue-Id: E4D482074AB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-17751-lists,linuxppc-dev=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:vigneshr@ti.com,m:s-vadapalli@ti.com,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:mani@kernel.org,m:robh@kernel.org,m:bhelgaas@google.com,m:jingoohan1@gmail.com,m:krzk@kernel.org,m:alim.akhtar@samsung.com,m:minghuan.Lian@nxp.com,m:mingkai.hu@nxp.com,m:roy.zang@nxp.com,m:yue.wang@Amlogic.com,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:jonnyc@amazon.com,m:thomas.petazzoni@bootlin.com,m:jesper.nilsson@axis.com,m:pjw@kernel.org,m:greentime.hu@sifive.com,m:samuel.holland@sifive.com,m:lchuanhua@maxlinear.com,m:srikanth.thokala@intel.com,m:songxiaowei@hisilicon.com,m:wangbinghui@hisilicon.com,m:unicorn_wang@outlook.com,m:inochiama@gmail.com,m:thierry.reding@gmail.com,m:jonathanh@nvidia.com,m:hayashi.kunihiko@socionext.com,m:mhiramat@kernel.org,m:nobuhiro.iwamatsu.x90@mail.toshiba,m:cassel@kernel.org,m:rongqianfeng@vivo.com,m:18255117159@163.com,m:jirislaby@kernel.org,m:tglx@kernel.org,m:sai
 .krishna.musham@amd.com,m:thippeswamy.havalige@amd.com,m:vidyas@nvidia.com,m:linux-omap@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-samsung-soc@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:imx@lists.linux.dev,m:linux-amlogic@lists.infradead.org,m:linux-arm-kernel@axis.com,m:sophgo@lists.linux.dev,m:linux-tegra@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:linux.amoon@gmail.com,m:martinblumenstingl@gmail.com,m:thierryreding@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[linuxamoon@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[ti.com,kernel.org,google.com,gmail.com,samsung.com,nxp.com,Amlogic.com,linaro.org,baylibre.com,googlemail.com,amazon.com,bootlin.com,axis.com,sifive.com,maxlinear.com,intel.com,hisilicon.com,outlook.com,nvidia.com,socionext.com,mail.toshiba,vivo.com,163.com,amd.com,vger.kernel.org,lists.infradead.org,lists.ozlabs.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_GT_50(0.00)[56];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linuxamoon@gmail.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
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
 drivers/pci/controller/dwc/pcie-tegra194.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
index 06571d806ab3..7381d0019d24 100644
--- a/drivers/pci/controller/dwc/pcie-tegra194.c
+++ b/drivers/pci/controller/dwc/pcie-tegra194.c
@@ -2493,6 +2493,7 @@ static struct platform_driver tegra_pcie_dw_driver = {
 		.name	= "tegra194-pcie",
 		.pm = &tegra_pcie_dw_pm_ops,
 		.of_match_table = tegra_pcie_dw_of_match,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 };
 module_platform_driver(tegra_pcie_dw_driver);
-- 
2.50.1


