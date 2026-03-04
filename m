Return-Path: <linuxppc-dev+bounces-17735-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YIjUEPONqGmbvgAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17735-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 20:54:27 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 504AF2073F9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 20:54:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fR3K90cRqz3c40;
	Thu, 05 Mar 2026 06:54:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1034"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772633031;
	cv=none; b=iO5Ez0kG+Z3g2WhJV4fbljXE2F/4wXrSiHpAu85QMnV74rKvGfr4lhapWXizgGOzYjcxC6Jj52rPkcXSpLrdZ0mUK645CjLwSAkP49yARvGVYpa0LX49J9Qfsfyp6pTZax0cOAzm7LqRwJGIWnGiqKJv0Q7Wj3+8w+WF/kGKK9WFNmfHO81IvMN422K2r2b13OBYpVdUpVUOit5mv2ywOadTJxPgvUK31MNUAdKD13fHtFV9ezhHV4sf4Zly2UhYEagG+UQ7lVhInLf6YSF2nkCsNHGg5ODnT38KH0Bs4Euzc0+kge4wf9+m/Sto+0dkV6nb4C2/v2FCdSL82iAuNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772633031; c=relaxed/relaxed;
	bh=wMG/35vxQWRecO7x0lChQ2qa5zQ+cEwiNdTCEbyqm04=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oynaZCpjS2zwZ4S+HQdlaHOx81gWoJvTJvQDShv8cNFosJUsTddSQ0KQKsBh3dN26/8FtS6wDs6RHX0d5ZIMlwtZL+BhDeSwI5I2qG/s4yb6LUw/X2FRrC/zdPRUkrYc6ugsGA0ACfaps5JGsc1f5+8wg7QFwq2S+vezqNpS33ze0MDzHa4cDzDEysvVtzsAlbZbcTV9Ls+YzLjks/QXg6iAemaC1BuBdKpXZ3hrlm45k7FxvigdVqqlsnH55YEhSXqyFUO280j6Bv8RGg6jAGnAxS3Xq7BxSFRcreZBYE/xWrza2eeG80ZbItGgtIU67YMUY7O/2rLaHWEqZkcujA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bttw0xHm; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=linux.amoon@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bttw0xHm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=linux.amoon@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQvXk0n0Nz3btg
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Mar 2026 01:03:49 +1100 (AEDT)
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-3567e2b4159so3665557a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 06:03:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772633026; x=1773237826; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wMG/35vxQWRecO7x0lChQ2qa5zQ+cEwiNdTCEbyqm04=;
        b=bttw0xHmsKut/kq0SmoWKjuzN5Bxe34x7o8X9/VmIgDM2uimb8BC1d96kviyrk/gKe
         vYKwcMpIi9cP5QjLbTsOzhSv0hUZl0n5N17ltc5cxP4z3MD6sa7/tdJVmR/8zyQ5QQoR
         lQqXQKUCKSQCgW9LpV67alkmYquRu1Ok+BQiH6v9ZGoUeSWSSa5JFC0wf1Dp+BQqjlmM
         dbv/5mD0xbbk13mEw6k6XGYJXySjVbKGNrXIl0k0LP0BqVsh+it2MpuOBso8KoEf14uP
         ZPi/I8SioYG1ZWwhIotcnbfbktW6NRX8C+vtY9lbJi/l/kvmkKLEIASnaKi/2A+7Cevm
         Ca2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633026; x=1773237826;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wMG/35vxQWRecO7x0lChQ2qa5zQ+cEwiNdTCEbyqm04=;
        b=AUssxGH4FC32+bI3UHo3ir9xw7xKpKOeyqK2Ne1en421Ajd8Bhlx3ozA58TDqnMlZ5
         hbIqycUFPdB9o4ISnONOliZZ67S0Hj7ix0gStfRWDoN/DLXSTg8PknaaQtigLQMwDyDi
         Al+pk0x51KP+OY5pg9KSjAADc0bhaz6ljzZnxRBVs/5nV+w3jkuSG2H1n/qXTcd+KPEW
         90bQVzJasKwfAZnr9oPATt43SWpD1tPeVvu2C1X2IOjWj9/mI6x7xpd7iZ59KmW5Zb95
         L9qH56uq+oQL7Hu9aQ8Ptq21v22w507J2MnTdRUuoH1KDA911TOZ3d7HPoYO0GxYK+PM
         MWhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUa3WewxccLqW9WcMwm890kTu+5VQmHgQzJhw/nynqqCrDDnvQqud3VBRgiGj/HMIuAqRp6PnY7IIucoC8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyBiViRXR28Dupy6mqO1kkIFsH4mTx4BAPN81KTT13nM3y/3JKz
	EaXHHsmVMcSpUR7cpOq1q5csOUnWsvqQpdZASRMSKukY7zp9th60bDP3
X-Gm-Gg: ATEYQzzWM5/bnXPRizS3IfQYJj9O66jB6NI49UNXES29awgCaqClXFORdgCpcIEzUWV
	bHsbntPZB+1l6iaD0CX/NRmRjO+7+GKdlcVhM2m9pjiCfM1PJ9qG5JcNbRRTFRpcvhJ7QQF4hwQ
	UCMXyFwuytJu75ptXMmUjLYQYoCdn0UzhZumeY4vPljufzANTwaPUsUq17tTgxW1Rv9ujx1mtQU
	FPX/K6PZ9S3YXcS18FJi5Na5BadCzvEIH62p4UMRuIj0Ox3m2/qWryM96f46keOL32zIFZOVeeO
	PHOG+9A/0nKyT/QCQUcWHnn30dajfwn61pmwAEyApPct5Q51eyzqnjlQXHqIt9cRQ6MwiMhqoRX
	wzXhPYbud81yyWAa3PLoDKfp8AJVOyCxRb8OzoKOg3uL6rCZl+J7qfQv0TvjS5bhzsFgKjfffy6
	fm8PKUYBQ3Glp4t2vgIBkQPQSKzBKtqoU=
X-Received: by 2002:a17:90b:3d50:b0:356:2fc5:30f5 with SMTP id 98e67ed59e1d1-359a69cad3amr2158954a91.13.1772633026479;
        Wed, 04 Mar 2026 06:03:46 -0800 (PST)
Received: from rockpi-5b ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c4c0f80sm6826545a91.16.2026.03.04.06.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:03:45 -0800 (PST)
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
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	Koichiro Den <den@valinux.co.jp>,
	Hans Zhang <18255117159@163.com>,
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
Subject: [RFC v1 00/18] PCI: Enable async probe by default
Date: Wed,  4 Mar 2026 19:21:43 +0530
Message-ID: <20260304140329.7089-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
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
X-Rspamd-Queue-Id: 504AF2073F9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-17735-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[ti.com,kernel.org,google.com,gmail.com,samsung.com,nxp.com,Amlogic.com,linaro.org,baylibre.com,googlemail.com,amazon.com,bootlin.com,axis.com,sifive.com,maxlinear.com,intel.com,hisilicon.com,outlook.com,nvidia.com,socionext.com,mail.toshiba,vivo.com,valinux.co.jp,163.com,amd.com,vger.kernel.org,lists.infradead.org,lists.ozlabs.org,lists.linux.dev];
	FORGED_SENDER(0.00)[linuxamoon@gmail.com,linuxppc-dev@lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vigneshr@ti.com,m:s-vadapalli@ti.com,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:mani@kernel.org,m:robh@kernel.org,m:bhelgaas@google.com,m:jingoohan1@gmail.com,m:krzk@kernel.org,m:alim.akhtar@samsung.com,m:minghuan.Lian@nxp.com,m:mingkai.hu@nxp.com,m:roy.zang@nxp.com,m:yue.wang@Amlogic.com,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:jonnyc@amazon.com,m:thomas.petazzoni@bootlin.com,m:jesper.nilsson@axis.com,m:pjw@kernel.org,m:greentime.hu@sifive.com,m:samuel.holland@sifive.com,m:lchuanhua@maxlinear.com,m:srikanth.thokala@intel.com,m:songxiaowei@hisilicon.com,m:wangbinghui@hisilicon.com,m:unicorn_wang@outlook.com,m:inochiama@gmail.com,m:thierry.reding@gmail.com,m:jonathanh@nvidia.com,m:hayashi.kunihiko@socionext.com,m:mhiramat@kernel.org,m:nobuhiro.iwamatsu.x90@mail.toshiba,m:cassel@kernel.org,m:jirislaby@kernel.org,m:rongqianfeng@vivo.com,m:den@valinux.co.jp,m:18255117159@163.com,m:s
 ai.krishna.musham@amd.com,m:thippeswamy.havalige@amd.com,m:vidyas@nvidia.com,m:linux-omap@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-samsung-soc@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:imx@lists.linux.dev,m:linux-amlogic@lists.infradead.org,m:linux-arm-kernel@axis.com,m:sophgo@lists.linux.dev,m:linux-tegra@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:linux.amoon@gmail.com,m:martinblumenstingl@gmail.com,m:thierryreding@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_GT_50(0.00)[56];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linuxamoon@gmail.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

Following recent asynchronous probing updates to the Rockchip PCIe
controller, this change enables default async probe functionality for
all DesignWare Core (DWC) based controllers to optimize boot times [0]. 

[0] https://lore.kernel.org/all/20260226101032.1042-1-linux.amoon@gmail.com/

This PROBE_PREFER_ASYNCHRONOUS flag help to parallelize device initialization.

Thanks
-Anand

Anand Moon (18):
  PCI: al: Allow asynchronous probing for background link training
  PCI: amd-mdb: Allow asynchronous probing for background link training
  PCI: armada8x: Allow asynchronous probing for background link training
  PCI: artpec6: Allow asynchronous probing for background link training
  PCI: bt1: Allow asynchronous probing for background link training
  PCI: dra7xx: Allow asynchronous probing for background link training
  PCI: exynos: Allow asynchronous probing for background link training
  PCI: fu740: Allow asynchronous probing for background link training
  PCI: intel-gw: Allow asynchronous probing for background link training
  PCI: keystone: Allow asynchronous probing for background link training
  PCI: keembay: Allow asynchronous probing for background link training
  PCI: kirin: Allow asynchronous probing for background link training
  PCI: layerscape: Allow asynchronous probing for background link
    training
  PCI: meson: Allow asynchronous probing for background link training
  PCI: sophgo: Allow asynchronous probing for background link training
  PCI: tegra194: Allow asynchronous probing for background link training
  PCI: uniphier: Allow asynchronous probing for background link training
  PCI: visconti: Allow asynchronous probing for background link training

 drivers/pci/controller/dwc/pci-dra7xx.c     | 1 +
 drivers/pci/controller/dwc/pci-exynos.c     | 1 +
 drivers/pci/controller/dwc/pci-keystone.c   | 1 +
 drivers/pci/controller/dwc/pci-layerscape.c | 1 +
 drivers/pci/controller/dwc/pci-meson.c      | 1 +
 drivers/pci/controller/dwc/pcie-al.c        | 1 +
 drivers/pci/controller/dwc/pcie-amd-mdb.c   | 1 +
 drivers/pci/controller/dwc/pcie-armada8k.c  | 1 +
 drivers/pci/controller/dwc/pcie-artpec6.c   | 1 +
 drivers/pci/controller/dwc/pcie-bt1.c       | 1 +
 drivers/pci/controller/dwc/pcie-fu740.c     | 7 ++++---
 drivers/pci/controller/dwc/pcie-intel-gw.c  | 1 +
 drivers/pci/controller/dwc/pcie-keembay.c   | 1 +
 drivers/pci/controller/dwc/pcie-kirin.c     | 1 +
 drivers/pci/controller/dwc/pcie-sophgo.c    | 1 +
 drivers/pci/controller/dwc/pcie-tegra194.c  | 1 +
 drivers/pci/controller/dwc/pcie-uniphier.c  | 1 +
 drivers/pci/controller/dwc/pcie-visconti.c  | 1 +
 18 files changed, 21 insertions(+), 3 deletions(-)


base-commit: 0031c06807cfa8aa51a759ff8aa09e1aa48149af
-- 
2.50.1


