Return-Path: <linuxppc-dev+bounces-17746-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YOMPFlyOqGmzvgAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17746-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 20:56:12 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 763FC207486
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 20:56:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fR3MD67dSz3c8x;
	Thu, 05 Mar 2026 06:56:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::534"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772633561;
	cv=none; b=KTCGS9xg8saEJ7wsIgwn9shuGy3nJbExmkptfK92e5axe1SGx82QDsoUz6757q2GBMqK0Y3viOC99lfu4pwAQtylS2J9oUZt5caTp3dAsp1nrQN4NxxLAiBNhfINC2H7FXG8D4RDMdEDsyIIc3c7ihibBydR8TwMaVPNj4yrBAWFJZnS7FdXV5xDqM1JvAr+gI+Vq3jSgDg8H2sGG+7qx+HED2Us6TZOyGhoW/Gjgvh2rmzc8uGzohwmovvXctTybdHekSD+Wx+tjEkssYyAPX2l7aWiqxSom+cNKc0p/yW0AI8Buplr922HqWSsvqFle2HpoJ7rEolOdXukV0Yg4g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772633561; c=relaxed/relaxed;
	bh=wvXorwNx3S8EJD2J965xM8gci4hmlt6ydwx4B/ML9So=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wjr7+Sf6+gPD4omfqpEnt8cl7oJ/kL9rSY1yIH/jn/3IMRoFspjCSmSjhn44gBil8uiNTp/tSGPfgvZPxqB9EGfkHZg9/znIOYC36uFJBpb2m5FvST6aqdH3n75RTKMwvw1JkttIO+95oUeCql3qjajNtdmQZ9LXhnC5Uvi9wP2JOQCJgvW6Dllob6yHB9XFarvei2z9fBQ/uEGX3x94VErp4Mbz6BjwI5ps1g/NgIlNDjKyMpvXDLSDaRIBLanwsXl0GwKbFrIXFvHTpxQKTBv6XQah2Ty1scLEoJcitusz91A5DSd6cUvpCQdjNYTajlSWynRmLSsl7rBdKF174g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Owga0+GI; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::534; helo=mail-pg1-x534.google.com; envelope-from=linux.amoon@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Owga0+GI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::534; helo=mail-pg1-x534.google.com; envelope-from=linux.amoon@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQvkx2FVfz3btg
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Mar 2026 01:12:41 +1100 (AEDT)
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-c7358a7a8d1so2071090a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 06:12:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772633559; x=1773238359; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wvXorwNx3S8EJD2J965xM8gci4hmlt6ydwx4B/ML9So=;
        b=Owga0+GI0ToGZIyBOybw9Z7zVSsKCz6TycFerbNLIsJlNv/sxkre0cXsmPmLJLMGa4
         hidAIU8NzzQSvb925x1gQ7p9MG16M33JuQjpPSmPzpC1+JaXwRtcIXrZkpyzT5YT5y4r
         xQyufbO2U6IKOu4VBrD2KDjOvU9hCWMb1O8S41ZT/ALmkx7VwQ3enxdsuX+bmegIypqv
         cluUAqk6Vd00NJZALYOhTT2Q/J7edF60qE/u+MSaldKQfyURkPWm69ZZT8gzTYyFLn5i
         WI8UT7tW//qoA/JWUFVCgipce/BmFu/Cgfq8iUgHaJgjboGI5OEHOXpMtnDoGO6SHyYF
         85ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633559; x=1773238359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wvXorwNx3S8EJD2J965xM8gci4hmlt6ydwx4B/ML9So=;
        b=u9NICe2UJgaAOy9/g28DbAP7x9glY8OC4II91iuSCWeOsuFHgSNZS1bbIrD5+m9pNQ
         GJ0oZ3IUfg+to5UZVFtCwP7LGHuvKbdaV9RjsF/jmCmhT93/mcs0zHLJfmh527NaZcEY
         YeqkLaiuT3mgrWRs2iIJhQ9VVTitWun8L2du/SwHeKVUANFjbIXzE4WLtQgzquQDa17k
         y4cN3OvbYcsTudEqht4dKYqXfOaMA49VXR9XYt1ob60039Ds98WyJEL34u/3wZeGjjKu
         vN6EAKjbFO+Z6RTFMDyIE6VQJFLKQbdzXkYtfce7ih/ho7hUQhMHsQXkVP5q5tQbq6Ui
         RkaA==
X-Forwarded-Encrypted: i=1; AJvYcCUh5G0P18VqMhSciWSXB7R71TB5LFjBX9UNsK2kYvKxZmsvMfW95Yi5Wgcf1lYd9600uoIW6muSv1inFIM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwhfA3mcYtZSGUxS4X8wJ2MiaBFjsb8/1H3OIj56Eq0L9HNNruU
	n+5lubFjShHXn6SCLMxfE0Hmfe/t7p2bVryC/C7yGpoVAM1ZiSHs9Tkr
X-Gm-Gg: ATEYQzx3V0YG+Asc5nNsEkVs6HPAFCAFQGqet4fx1x3bzqJmoifIq00ZbM/HV9Q6/h0
	eDx0HuhZb1B/Z4GuvNfArZS2S5mCqlrk5S8KrWgneibvuUCyR6MnoTBH1ahhg5WspEOON/GLjey
	hY4qdme2TMdIlieHZy3EzE6giufFy3jmATPrtqCSVljPwm89DthPXmW2FrPvkj9DmEuiznV3Kc8
	7hihTgt1Bqg9QOKpPIA0F47IwmD+VAh9rCM3HIaCPiu/XyxYVIAs7uxh+XlgkjvHLrjCCf/lZjR
	Vh9uN1Y9GydzymeFw5xXItsGuVBeCvc1Mm8UnWzKHcysXxiths0NW5jvKhHe8D024Rp+KzCTP8q
	kJu6rOiINs4TJwUOok+qA8VRKabXNbCflgIrIBZd4+tV6nVNUMMu22dhiVsqKTOuDFRprOPQKy7
	lowXsSpaoqBePx+RqvmJek
X-Received: by 2002:a17:90b:3c46:b0:354:9b26:cdf8 with SMTP id 98e67ed59e1d1-359a69c774cmr2111843a91.10.1772633559439;
        Wed, 04 Mar 2026 06:12:39 -0800 (PST)
Received: from rockpi-5b ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c4c0f80sm6826545a91.16.2026.03.04.06.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:12:38 -0800 (PST)
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
	Koichiro Den <den@valinux.co.jp>,
	Hans Zhang <18255117159@163.com>,
	Sai Krishna Musham <sai.krishna.musham@amd.com>,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
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
Subject: [RFC v1 11/18] PCI: keembay: Allow asynchronous probing for background link training
Date: Wed,  4 Mar 2026 19:21:54 +0530
Message-ID: <20260304140329.7089-12-linux.amoon@gmail.com>
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
X-Rspamd-Queue-Id: 763FC207486
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
	TAGGED_FROM(0.00)[bounces-17746-lists,linuxppc-dev=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:vigneshr@ti.com,m:s-vadapalli@ti.com,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:mani@kernel.org,m:robh@kernel.org,m:bhelgaas@google.com,m:jingoohan1@gmail.com,m:krzk@kernel.org,m:alim.akhtar@samsung.com,m:minghuan.Lian@nxp.com,m:mingkai.hu@nxp.com,m:roy.zang@nxp.com,m:yue.wang@Amlogic.com,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:jonnyc@amazon.com,m:thomas.petazzoni@bootlin.com,m:jesper.nilsson@axis.com,m:pjw@kernel.org,m:greentime.hu@sifive.com,m:samuel.holland@sifive.com,m:lchuanhua@maxlinear.com,m:srikanth.thokala@intel.com,m:songxiaowei@hisilicon.com,m:wangbinghui@hisilicon.com,m:unicorn_wang@outlook.com,m:inochiama@gmail.com,m:thierry.reding@gmail.com,m:jonathanh@nvidia.com,m:hayashi.kunihiko@socionext.com,m:mhiramat@kernel.org,m:nobuhiro.iwamatsu.x90@mail.toshiba,m:cassel@kernel.org,m:rongqianfeng@vivo.com,m:den@valinux.co.jp,m:18255117159@163.com,m:sai.krishna.musham@amd.c
 om,m:jirislaby@kernel.org,m:thippeswamy.havalige@amd.com,m:nkristam@nvidia.com,m:vidyas@nvidia.com,m:linux-omap@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-samsung-soc@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:imx@lists.linux.dev,m:linux-amlogic@lists.infradead.org,m:linux-arm-kernel@axis.com,m:sophgo@lists.linux.dev,m:linux-tegra@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:linux.amoon@gmail.com,m:martinblumenstingl@gmail.com,m:thierryreding@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[linuxamoon@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[ti.com,kernel.org,google.com,gmail.com,samsung.com,nxp.com,Amlogic.com,linaro.org,baylibre.com,googlemail.com,amazon.com,bootlin.com,axis.com,sifive.com,maxlinear.com,intel.com,hisilicon.com,outlook.com,nvidia.com,socionext.com,mail.toshiba,vivo.com,valinux.co.jp,163.com,amd.com,vger.kernel.org,lists.infradead.org,lists.ozlabs.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_GT_50(0.00)[57];
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

Establishing a PCIe link can take a while; allow asynchronous probing so
that link establishment can happen in the background while other devices
are being probed.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/pci/controller/dwc/pcie-keembay.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-keembay.c b/drivers/pci/controller/dwc/pcie-keembay.c
index 2666a9c3d67e..a82d69b37e4d 100644
--- a/drivers/pci/controller/dwc/pcie-keembay.c
+++ b/drivers/pci/controller/dwc/pcie-keembay.c
@@ -478,6 +478,7 @@ static struct platform_driver keembay_pcie_driver = {
 		.name = "keembay-pcie",
 		.of_match_table = keembay_pcie_of_match,
 		.suppress_bind_attrs = true,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 	.probe  = keembay_pcie_probe,
 };
-- 
2.50.1


