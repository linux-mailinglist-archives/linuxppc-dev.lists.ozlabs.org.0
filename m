Return-Path: <linuxppc-dev+bounces-17789-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YMWzOpleqmkhQQEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17789-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Mar 2026 05:56:57 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A1A21B98B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Mar 2026 05:56:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fRvJh51HGz3c8x;
	Fri, 06 Mar 2026 15:56:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a00:1450:4864:20::629" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772770516;
	cv=pass; b=W1jgyso+jSRZtWmnZPWWM/wM7tD6LU6wwFIJR+SfanGTovktILc27EtdL069UzevXXzOITIsDG15g4bA5P6c9dcvY3SbADZrgKMQnesTTTBCP20xHTzL3Utd49xE8ODXZtKo7HfgqQfVlzWMsuxpUCP0tR/Tvd0H2AXQgD/naRNKiqyk2v9m83nNotI199yqKSoB++SnHKmdY3w8ZViVgXOSP8EGIkQEEVa8+mmlpR/HqldyAmLG4UAk+Mr8iaXLbzrQmbQqgTy3Ok0dqQGfhfgDubQ9I9lga0WX5ZL+S0rEu5KAf08imk0wPfrAo9e/pNPx2l15vf3d84YA9F24VQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772770516; c=relaxed/relaxed;
	bh=caYlw5uZFtDTjdpuJpoLZkB8qzJjrGN/QTXEgHQCJYY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EbKBKS4IO6fNOfbxg5gxR0csXPWpnt7UvKHDlLoLLkazy42wbADOiEceNpbHuglW981BXd3F5nSQ+V7BWHY/DkVI27nGcnODcDa06z7yQjqshtwyeGiaP0CfT0S5qazbfaJowSFrnihC0bLwy1gG9kQw5Es0Jhe0nPLHCx8l0123m6rpoutFbn08H1phxzAEFS3AgggTY00gItl19KdgalAZncCh/rNCcicX1grPnJuStbyqlG3h77/2lPO3yu5waHRpkP9XFrj5XLBvAuFAggzVT0aHXSYo065Zf3jmqt9B4YHTZ/9RUr6DlvrZIr8Za/E84AYN5GmuPxYh6O4dOg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UeLgyOhM; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com; envelope-from=linux.amoon@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UeLgyOhM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com; envelope-from=linux.amoon@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fRtNf3yz1z3bfV
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Mar 2026 15:15:13 +1100 (AEDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-b9431300833so13450866b.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Mar 2026 20:15:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772770510; cv=none;
        d=google.com; s=arc-20240605;
        b=Smhdy2FxUWj1J9rhRmmQuE0T0Maz3XWUuIYFAZjQrgZXaYCnjUyrTOOMmestihG5Aj
         vIz/ue3WmDvKjlWsf2NIQR0PfGsXWYKhJc9XimBbfANnXB8I4RUjs7pN1KRQwUFK+IlZ
         lh7ERo7N++97uA88msTWStH/HqHHIVTutpWQUZwgFWEhZHDamk/J1ZKH/2CfiDMpF+Wo
         +aXNmtPOMknAZSyXut1tyvv6CnYcuf+mcq6P7oT1vPbQ5puA3TL+UeYXPRZh1bZ1H2cu
         /XA1uGOwXe5FwTKkj3bBQm/AMxtishhbqHKjgQ1AqjKuqXLCM/iQ1lG9bBf5PJaIe4vF
         ZPAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=caYlw5uZFtDTjdpuJpoLZkB8qzJjrGN/QTXEgHQCJYY=;
        fh=mZg18eSjYfjMLKQu/dnZ7EhM9m0WvCOVhZybfBcfEAE=;
        b=gmqnvmGmUkeptNZwEkaacTnpvYC/kunNQQltea7LKRcwdHl0yoy6FuZFOg0aDJxbFL
         FyOh/QdBxvE/RmU6K3vzOCWD4vKmH3/52BudbHA8WSMHWVzPKE3CowDYppEAx+g/wodI
         As7h/hGcV57rgnCuFt9NgVxBC6VxOeXXMx+dNmSga7uIm9rGjTbPPkCP8uKVd9pjXwjx
         3QszBO2ODZVT4+7WS4DFXKbHKm+9A9FvcHc13Po+zVXHizw41P4N7SJe8sW3CgT1Lvc5
         eWtQXgF0srR/nlPRyFtT3CSUT0ZjqhWXrrbDMGkaDwCNA7Ziiyyit50FG93sLYr6lrZE
         k8QA==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772770510; x=1773375310; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=caYlw5uZFtDTjdpuJpoLZkB8qzJjrGN/QTXEgHQCJYY=;
        b=UeLgyOhMOPodcKAMzeOSdnEtsvX0wFvsrgcYtOBABRVf3m1cpWM2O4DHqJQcQg5fZs
         f6BNAK3rfj1O/fwaZ+ZPCvYmXhVZtrPq93VqR1rIuElNOttIgjlFCWL2/FAJ7yreFHgi
         u8WelwY34XekrkZTgq7KiNsluxClqIetXCTj9JV72vtiKY6B5h8NMTC3m7KAN3JbPsST
         fuN4BdSruJvlUm0QZksUsh1qGV9QCMVmaFnd8bC5mxES14yJWUVnHfQF0+E+MBNa3OCq
         xHlX8ih8+3TzAd3hR1eld/UMZ9O5eA3a4ASXPFf4yQPOK94Mq4WBs8uGkLTYfe2mC6W+
         qzhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772770510; x=1773375310;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=caYlw5uZFtDTjdpuJpoLZkB8qzJjrGN/QTXEgHQCJYY=;
        b=cmBGZzw5vqhseGVVuRhyfCc/Y7NJdAqm950CO95S5LpxrJKX4QiZ2YTcCAx+L2GHRd
         GOm9G4F012oqh5sRVezYHWirrhZLaKiVUVnmw7sGZr9t/bCcKVzXEVj5HGxTFMNm2QDX
         UVbjKikdUKz5dEf9UdnGFa0E6Cfd5CSg9CwvV1yN8NO5w1Kkxhg12bbh68yGcS/wDiU6
         K5JMWW0nbmlRA8nxSV6cUG5V3RPOBIjU+mqWH6eHmSHAWM1I2F8XmXYtvxkAfHdC91cs
         10clv9tW9CCrgDbxQgE4jj++VGCozgfwG07oly3LCiEI8XqBfJviOMmqxPZiPPf7g87W
         sA3w==
X-Forwarded-Encrypted: i=1; AJvYcCUowhhTFJuxT8R/RkvRkN5xArToXemdB+u5PPHI64ve24YmaU+ZANGw7PFT95iqP/3yrlbNNIrYdf/tYEU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzBi/OQEFJQswXJuRY71uwfaj3OOiHfD4Gez5RVWJPnnKJBlgYr
	n2lePgvRNgWUMzWffsX5g/LKzVOJdxEAwXlrwnH7YbSYlVZEER3J0NRw27a6RbktRhI26Ajq7oy
	c2Fue9uhZuIi6O8NifEt/bReeJVnHDGo=
X-Gm-Gg: ATEYQzxg6PiWsSKKs4htVe6/cG5sAl6LeiOfJw0kiJZJf/UOUxEWB+LBUqUa1YSHbIP
	lqjR4RsvxvLn4E1RlRoCfa4CYdRL2gNMAQwx04AYj6g5UB808kH7I7YTtX1AGst8wN8ey+lqLIj
	ka4oNYprmntdjp4IgG3jW5EqqQR8/qWDnc0Ea9/vGSuujR9y7vZBxOcrNjV1L2wldG8RpP8alu3
	9lL1cBN8q2KTXs22NxqUrjJygx07eOQeAiTgsIMnbMJoVjGP8y05cL8iDpbt7blokfqrL/apVbS
	FnHEsA==
X-Received: by 2002:a17:907:6d02:b0:b93:6bfe:d556 with SMTP id
 a640c23a62f3a-b942db8682dmr33539966b.7.1772770510037; Thu, 05 Mar 2026
 20:15:10 -0800 (PST)
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
References: <20260304140329.7089-1-linux.amoon@gmail.com> <MA5PR01MB125008C876FC8461A80514DE8FE7DA@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <MA5PR01MB125008C876FC8461A80514DE8FE7DA@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
From: Anand Moon <linux.amoon@gmail.com>
Date: Fri, 6 Mar 2026 09:44:53 +0530
X-Gm-Features: AaiRm51D8WbPwjbtXZGUsnsbSyyBH4WmUaM2xaSBTKwsUjOwhQr-zWi1-hyOtG4
Message-ID: <CANAwSgQ8eKV4jyxGeva_2aT98sPW=44Q9J5PxMgJ-bs3XdwrkA@mail.gmail.com>
Subject: Re: [RFC v1 00/18] PCI: Enable async probe by default
To: Chen Wang <unicorn_wang@outlook.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Jingoo Han <jingoohan1@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Minghuan Lian <minghuan.Lian@nxp.com>, 
	Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>, Yue Wang <yue.wang@amlogic.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jonathan Chocron <jonnyc@amazon.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Jesper Nilsson <jesper.nilsson@axis.com>, 
	Paul Walmsley <pjw@kernel.org>, Greentime Hu <greentime.hu@sifive.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Chuanhua Lei <lchuanhua@maxlinear.com>, 
	Srikanth Thokala <srikanth.thokala@intel.com>, Xiaowei Song <songxiaowei@hisilicon.com>, 
	Binghui Wang <wangbinghui@hisilicon.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, Niklas Cassel <cassel@kernel.org>, 
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>, Qianfeng Rong <rongqianfeng@vivo.com>, 
	Koichiro Den <den@valinux.co.jp>, Hans Zhang <18255117159@163.com>, 
	Sai Krishna Musham <sai.krishna.musham@amd.com>, 
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>, Vidya Sagar <vidyas@nvidia.com>, 
	"open list:PCI DRIVER FOR TI DRA7XX/J721E" <linux-omap@vger.kernel.org>, 
	"open list:PCI DRIVER FOR TI DRA7XX/J721E" <linux-pci@vger.kernel.org>, 
	"moderated list:PCI DRIVER FOR TI DRA7XX/J721E" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:PCI DRIVER FOR SAMSUNG EXYNOS" <linux-samsung-soc@vger.kernel.org>, 
	"open list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linuxppc-dev@lists.ozlabs.org>, 
	"open list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <imx@lists.linux.dev>, 
	"open list:PCIE DRIVER FOR AMLOGIC MESON" <linux-amlogic@lists.infradead.org>, 
	"open list:PCIE DRIVER FOR AXIS ARTPEC" <linux-arm-kernel@axis.com>, 
	"open list:SOPHGO DEVICETREES and DRIVERS" <sophgo@lists.linux.dev>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, 
	"open list:SIFIVE DRIVERS:Keyword:fu [57] 40" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 83A1A21B98B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17789-lists,linuxppc-dev=lfdr.de];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:unicorn_wang@outlook.com,m:vigneshr@ti.com,m:s-vadapalli@ti.com,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:mani@kernel.org,m:robh@kernel.org,m:bhelgaas@google.com,m:jingoohan1@gmail.com,m:krzk@kernel.org,m:alim.akhtar@samsung.com,m:minghuan.Lian@nxp.com,m:mingkai.hu@nxp.com,m:roy.zang@nxp.com,m:yue.wang@amlogic.com,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:jonnyc@amazon.com,m:thomas.petazzoni@bootlin.com,m:jesper.nilsson@axis.com,m:pjw@kernel.org,m:greentime.hu@sifive.com,m:samuel.holland@sifive.com,m:lchuanhua@maxlinear.com,m:srikanth.thokala@intel.com,m:songxiaowei@hisilicon.com,m:wangbinghui@hisilicon.com,m:inochiama@gmail.com,m:thierry.reding@gmail.com,m:jonathanh@nvidia.com,m:hayashi.kunihiko@socionext.com,m:mhiramat@kernel.org,m:nobuhiro.iwamatsu.x90@mail.toshiba,m:cassel@kernel.org,m:jirislaby@kernel.org,m:rongqianfeng@vivo.com,m:den@valinux.co.jp,m:18255117159@163.com,m:s
 ai.krishna.musham@amd.com,m:thippeswamy.havalige@amd.com,m:vidyas@nvidia.com,m:linux-omap@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-samsung-soc@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:imx@lists.linux.dev,m:linux-amlogic@lists.infradead.org,m:linux-arm-kernel@axis.com,m:sophgo@lists.linux.dev,m:linux-tegra@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:martinblumenstingl@gmail.com,m:thierryreding@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[outlook.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[linuxamoon@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[ti.com,kernel.org,google.com,gmail.com,samsung.com,nxp.com,amlogic.com,linaro.org,baylibre.com,googlemail.com,amazon.com,bootlin.com,axis.com,sifive.com,maxlinear.com,intel.com,hisilicon.com,nvidia.com,socionext.com,mail.toshiba,vivo.com,valinux.co.jp,163.com,amd.com,vger.kernel.org,lists.infradead.org,lists.ozlabs.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_GT_50(0.00)[55];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linuxamoon@gmail.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:email,mail.gmail.com:mid]
X-Rspamd-Action: no action

Hi Chen,

On Thu, 5 Mar 2026 at 05:57, Chen Wang <unicorn_wang@outlook.com> wrote:
>
> Hello Anand,
>
> On 3/4/2026 9:51 PM, Anand Moon wrote:
> > Following recent asynchronous probing updates to the Rockchip PCIe
> > controller, this change enables default async probe functionality for
> > all DesignWare Core (DWC) based controllers to optimize boot times [0].
> >
> > [0] https://lore.kernel.org/all/20260226101032.1042-1-linux.amoon@gmail.com/
> >
> > This PROBE_PREFER_ASYNCHRONOUS flag help to parallelize device initialization.
> >
> > Thanks
> > -Anand
> >
> > Anand Moon (18):
> >    PCI: al: Allow asynchronous probing for background link training
> >    PCI: amd-mdb: Allow asynchronous probing for background link training
> >    PCI: armada8x: Allow asynchronous probing for background link training
> >    PCI: artpec6: Allow asynchronous probing for background link training
> >    PCI: bt1: Allow asynchronous probing for background link training
> >    PCI: dra7xx: Allow asynchronous probing for background link training
> >    PCI: exynos: Allow asynchronous probing for background link training
> >    PCI: fu740: Allow asynchronous probing for background link training
> >    PCI: intel-gw: Allow asynchronous probing for background link training
> >    PCI: keystone: Allow asynchronous probing for background link training
> >    PCI: keembay: Allow asynchronous probing for background link training
> >    PCI: kirin: Allow asynchronous probing for background link training
> >    PCI: layerscape: Allow asynchronous probing for background link
> >      training
> >    PCI: meson: Allow asynchronous probing for background link training
> >    PCI: sophgo: Allow asynchronous probing for background link training
> >    PCI: tegra194: Allow asynchronous probing for background link training
> >    PCI: uniphier: Allow asynchronous probing for background link training
> >    PCI: visconti: Allow asynchronous probing for background link training
> >
> >   drivers/pci/controller/dwc/pci-dra7xx.c     | 1 +
> >   drivers/pci/controller/dwc/pci-exynos.c     | 1 +
> >   drivers/pci/controller/dwc/pci-keystone.c   | 1 +
> >   drivers/pci/controller/dwc/pci-layerscape.c | 1 +
> >   drivers/pci/controller/dwc/pci-meson.c      | 1 +
> >   drivers/pci/controller/dwc/pcie-al.c        | 1 +
> >   drivers/pci/controller/dwc/pcie-amd-mdb.c   | 1 +
> >   drivers/pci/controller/dwc/pcie-armada8k.c  | 1 +
> >   drivers/pci/controller/dwc/pcie-artpec6.c   | 1 +
> >   drivers/pci/controller/dwc/pcie-bt1.c       | 1 +
> >   drivers/pci/controller/dwc/pcie-fu740.c     | 7 ++++---
> >   drivers/pci/controller/dwc/pcie-intel-gw.c  | 1 +
> >   drivers/pci/controller/dwc/pcie-keembay.c   | 1 +
> >   drivers/pci/controller/dwc/pcie-kirin.c     | 1 +
> >   drivers/pci/controller/dwc/pcie-sophgo.c    | 1 +
> >   drivers/pci/controller/dwc/pcie-tegra194.c  | 1 +
> >   drivers/pci/controller/dwc/pcie-uniphier.c  | 1 +
> >   drivers/pci/controller/dwc/pcie-visconti.c  | 1 +
> >   18 files changed, 21 insertions(+), 3 deletions(-)
> >
> >
> > base-commit: 0031c06807cfa8aa51a759ff8aa09e1aa48149af
>
> Suggest you indicate in the title of the cover letter for the next patch
> that this patchset is only related to dwc.
>
Thanks, If I get positive feedback I will append dwc in the $subject.
> Thanks,
>
> Chen
>
Thanks
-Anand

