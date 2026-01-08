Return-Path: <linuxppc-dev+bounces-15432-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC89D06283
	for <lists+linuxppc-dev@lfdr.de>; Thu, 08 Jan 2026 21:46:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dnH4W6xCgz2yFs;
	Fri, 09 Jan 2026 07:46:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=40.107.74.132 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767893092;
	cv=pass; b=m0rPXUrfHqWFKcSvvx4YZJFYUsHkZFFGReGiFZR//VKMqA/3PRgPW2JQu+Iyn+qnOUb170eI43Qa7E2sUXYCqE8UY29q5tcxbhpLDkFLhbjQJJDw7cyQhpHXke7jmYIB8VVnJfATBm8bHB+uuIQQb7SXwlPsi0xk323Rw596P1qMes5aGvtWNvAyCiA2ZBNqj77CkAO/5koQ4wNTsCkZmRbjBoA3YaeaoNzNwbbJ4Rdan5RTTI2cb2dapfoMaEgeR8oAZDhQwKxiZnmoCO+7PRZDM4Du4FihWH9s16R4kifB+WpPqVOZjkUYPWFCghET7fJvpRD/E6bmSSlvQeCiAA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767893092; c=relaxed/relaxed;
	bh=75dvJDSfkBp8tOkhejdnZa7L5gqYY8qqC+jo97YGPwE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nRI8mHIXGzCwgevEnlZPgWYfQTu/90frqGRA3sIRWazFFWiC6MANwjSod+t+Ip+25yHhc7ugJ9E3e1gGwwyZfDQT6oIu5I+VzD2e+FtFZjTpSXa2avHggWEVk2WRmdSr708bkcgfd40TU7MXT5GvvheAj2T8YserKn0mUiyyXCwFU3hXE+Z+6OmBpNIFl6I8iVrMYKX/MKmbb4iiwEFIEkzK4wTjaEVHSK/UenOxpQ8p171P9m+4SM5n6pbaSnqo6iDNx/3ajOYxiMi3wR5NtoQCryPqhl8yiJQVOZI62N2N3SPcKosmxgC5XJd4TyY/9UMFlsr/fjk0iioFbdXAfw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; dkim=pass (1024-bit key; unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=JXrKhROL; dkim-atps=neutral; spf=pass (client-ip=40.107.74.132; helo=os0p286cu010.outbound.protection.outlook.com; envelope-from=den@valinux.co.jp; receiver=lists.ozlabs.org) smtp.mailfrom=valinux.co.jp
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=JXrKhROL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=valinux.co.jp (client-ip=40.107.74.132; helo=os0p286cu010.outbound.protection.outlook.com; envelope-from=den@valinux.co.jp; receiver=lists.ozlabs.org)
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11021132.outbound.protection.outlook.com [40.107.74.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dnBc41Sw9z2xGF
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Jan 2026 04:24:52 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yqP0NL3eJj6pYw9LGBrsNCgBbc4ese7a/KgUApAQe/W1PhKUh9VTziokaii9+7Z5kGeafCYTty2GFt67fKN2TcnMMi+mIHxUrxtSvXJJCtgyf/e28aCrMvVttz3ZycRbfuN36AagJohf7cD9MJYYmFNYR5ixHheuk9QzTPrtUiNGj6YzDqsTLY+T+RLEnZ0seIBtHa3Ig0sVTbo1vGLJBqYMmoZ1/+e/yCtrnJpFaxG6AIuRGfmLEMokjd6c1MboTBL7LYaUivXNr2sRAzJ6fTAHGgWRjCpVLDc7xQLtmr7AD/oqxFS3AG/SF/mKb2iurPXCpBll+V9BV5QS16DCyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=75dvJDSfkBp8tOkhejdnZa7L5gqYY8qqC+jo97YGPwE=;
 b=nZ43rko2jUJH1Ku4Fv6lWbUsgcon/xpv1qpMCJ/MO4OkJw7U+otJc2VB2kACUn0GUSBERfpxEDkQdlGpk4Wt5tgiPDl7WGiQ22zW938tLcJxu4DaKloEfb/BV14WOK9rFfwt5yWWZtpIxSXX0K110Pe2wkR/P38PxyCnSAjVDxW8ephVP2/0y96OkZ/hc972at5gfwFNuV5xEc3waMabuMwlQ/SOwhTFhgbu569Qy18MvX19HwnV59dtstNwPn0zakFaBp5vFMNzz0n+b0d4qkdrgsuDRY4JSUcuZ/dGqL0bj1YcVFangEOfNyl5/PC+M5fdPneYrjV7jE4hexEh+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=75dvJDSfkBp8tOkhejdnZa7L5gqYY8qqC+jo97YGPwE=;
 b=JXrKhROL2S8+heU5Q9qryJmLEbtVTUKMYKDwYnUV8CSofCfzJ1DHBwPTgZnAstUz8mfCHCDT35zZFKDrZi2wCN0ngS6wPAB1WnZsioUi78gvDVtAfZMC88FT+YQeZaOrbMfDNk390zn2QyM21Ju5HWYmL+vesefhh1OUEawIups=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYRP286MB5284.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:11a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 17:24:08 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9499.002; Thu, 8 Jan 2026
 17:24:08 +0000
From: Koichiro Den <den@valinux.co.jp>
To: jingoohan1@gmail.com,
	mani@kernel.org,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	robh@kernel.org,
	bhelgaas@google.com,
	cassel@kernel.org
Cc: vigneshr@ti.com,
	s-vadapalli@ti.com,
	hongxing.zhu@nxp.com,
	l.stach@pengutronix.de,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	minghuan.Lian@nxp.com,
	mingkai.hu@nxp.com,
	roy.zang@nxp.com,
	jesper.nilsson@axis.com,
	heiko@sntech.de,
	srikanth.thokala@intel.com,
	marek.vasut+renesas@gmail.com,
	yoshihiro.shimoda.uh@renesas.com,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	christian.bruel@foss.st.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	hayashi.kunihiko@socionext.com,
	mhiramat@kernel.org,
	kishon@kernel.org,
	jirislaby@kernel.org,
	rongqianfeng@vivo.com,
	18255117159@163.com,
	shawn.lin@rock-chips.com,
	nicolas.frattaroli@collabora.com,
	linux.amoon@gmail.com,
	vidyas@nvidia.com,
	Frank.Li@nxp.com,
	linux-omap@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@axis.com,
	linux-rockchip@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-tegra@vger.kernel.org
Subject: [PATCH v5 3/3] PCI: dwc: ep: Support BAR subrange inbound mapping via Address Match Mode iATU
Date: Fri,  9 Jan 2026 02:24:03 +0900
Message-ID: <20260108172403.2629671-4-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260108172403.2629671-1-den@valinux.co.jp>
References: <20260108172403.2629671-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0001.jpnprd01.prod.outlook.com (2603:1096:405::13)
 To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
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
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYRP286MB5284:EE_
X-MS-Office365-Filtering-Correlation-Id: ba346560-21e4-4281-cfc1-08de4edabb6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?roAtOmEmeiUYo1mQEQe52tmcAaVCuAYeJA7B4n2K5TxvV5ZLwvAIyRqnv/fm?=
 =?us-ascii?Q?rDTOnVsqN7dbL1UPNTMazsALFVFR/XmLMlIZAsYBu3AdV9xD0/v0gC1OVE8P?=
 =?us-ascii?Q?MY1LVGknbQRfYzUbapby4BbjgeOgCmfd6qbHLVIfC2sxSXXxgcUdkJ1aB3L4?=
 =?us-ascii?Q?JoLlSjvCVHQwnSu+gGjaL8SI1ITtygDpI3+1PeDPmNbkIw5H/mwI2aLKVFvy?=
 =?us-ascii?Q?a7oNrCfdr6AZ4gIfEWw5e5Wox3goeSNLTBRFUo6sHY6PbxtJb39Ecy8pq9TJ?=
 =?us-ascii?Q?siJdob4GEHfSFi11QzqFPfsW+lgnAIU/tEwavOIlvMxmJZvEXfQgKTna2E4g?=
 =?us-ascii?Q?2mwWa/7WhP9GBdE6fMYzSoDw0q/eW94GYfsZPkqyxtiZDtyjCvsqSUm/IfL9?=
 =?us-ascii?Q?YGscVppL0LbJBGNN8CBouXpmRaLou/Xh7i5Fwh83qVkk9vc4trdrJ2OK25E8?=
 =?us-ascii?Q?LmbZcunLi4vblsgg7zxvCvnDy/RgkAp2Y6VwWfGROXDEsKILFzsDSq8ad4o+?=
 =?us-ascii?Q?7yyE/o/N7pHaxtkr1JiXI10HB3AA6o6im9RjqSttaZsvyWqmIhf8aphRuOda?=
 =?us-ascii?Q?mJzxMym9N5QaTJax+/vgp4zFjBi36a4AqwcTzQ1wtBqLfvkBIE69lOh4+mTs?=
 =?us-ascii?Q?Eyq2blawegVIhpzwVyekDYKzMm7AtYQy0uLEuHAurMEt0WE+BPGj24NpZueq?=
 =?us-ascii?Q?6bVjWzBfJVb7cESid9JF5tGClgS5qJgV9/f9FsygdFHP5iAyOKun4YNeIbPo?=
 =?us-ascii?Q?xQ7zemL6Mhf33APcAJN/xzOZhpV5rv4XgmKGX+suUsMBT/nuqfvSz9jYCdw+?=
 =?us-ascii?Q?3+DfzdgTkghxALCc7l+mjSe8P+TVmHG+tZavKLhSEKBZFPw4bipjJVvX+OaP?=
 =?us-ascii?Q?uRdvG7U6GJDXPDTLVukqYkVrq4ViJaKBQy6s5Vgp0+Iasww8X47L7j5LFbgF?=
 =?us-ascii?Q?r+bJcwDtFdPj3Ib18ehtgWoQfQzf417yGOXI25GhFQReUjflGsPfr9ca5FQR?=
 =?us-ascii?Q?ckTe7MAHOp3g6I8fr9oDOQmXll9xpfac2rQkhUsSIIlNRC7QlCsTyMGAeYat?=
 =?us-ascii?Q?ygwKcArP7M6+wsKsxXcdD9YHxLVMkjZH87vWpTnmwcZC0KaXoixQeKJBMpRb?=
 =?us-ascii?Q?Eu/N3F1EZ6CA03NZU6OQtW4CYNbFD1T+J9DoU3Ikm5PxzocaHSMDUzS89jFg?=
 =?us-ascii?Q?A9+kkt3fqd7/mafRuIpCvjO4bc5nd13Hk716E6ah2e42CtGWjO0pRTvBSgqn?=
 =?us-ascii?Q?dyCiDNvJxU89l35SuMEgmLOgRp8JplCNycEGYUOeF0qnrVLDy65DJFwA3Z8d?=
 =?us-ascii?Q?DN7GYN11tj0LxustWE0q08dONcxNLBrWKdiM50vd8CHxGMi/wtbCb2PjpFWw?=
 =?us-ascii?Q?pSxG6IHSfUu3w8DaOYXHPE6MTml4m+Oj37Eel9BKuortL/5KvNEYCy8Y/E2Y?=
 =?us-ascii?Q?FNIk+7W4UkalEgdzgyeWL9ySOgFOgAJT?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(7416014)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vgMY4+aI08vSua7Lgw6Jjxvo8abemPb+UQxQ2rznFa/iYCyNWjaMht0v4Hyq?=
 =?us-ascii?Q?sLtTj3rU4g/QtdkSqpd0deWsXDrGlc7Kfx0/ceIDkjMgYSeTt2HsqAN7/MAd?=
 =?us-ascii?Q?G6uVhbMPbjuPwpVTHaWGA6JYrm8eT0Xw9VWrI9Yq/QrPIq6jLKAnLHuZqu1v?=
 =?us-ascii?Q?3Obvn7s/3QwcRaKPI+5prjMEFDmqjbLDCBac1g5gV+5rlBU++nkxoMivbKAI?=
 =?us-ascii?Q?7YCtZrJu+SnhUhsIU4b67VgheKBfMIvhAtMi5rP1Zxh4c+dij5CVfrRs7Bhz?=
 =?us-ascii?Q?N/Bu6JIxFqjOHyrt/G3JxQtqYA6sImSl49Gcgor9ZTggGMr1EOHY5CCezZd9?=
 =?us-ascii?Q?ZtFaFVUaRmlqzP3gZiPCRSZVU14sfyRE/W7YCaRDrzxj+keUXD453nLwHNk1?=
 =?us-ascii?Q?2EN55Aqdp+ZgbV+EX/dIIby7vVJl3dvDyuzOPCaAXRWxwx84kWC748MMHSOu?=
 =?us-ascii?Q?1yioo6b2lHOIv7SmdMh0A+GN/cxlCMMJDBPHh3KA/+X+F3lG5sEiUf4gtl5o?=
 =?us-ascii?Q?YcvkMq0NUN3eHmDX1uSTKFFt16iQZk37T69ECp65hjLQ2RkO+fUmQ7R1acit?=
 =?us-ascii?Q?50auoY7PSpIsYBgA9t1MZI0wJWM9zRUp6r7pSObBABzdTtEdkDL4qxNS561j?=
 =?us-ascii?Q?+n8GgoiTbqUs9e7cBL2S/ZzXvQw5bxow9ZkRnerk5KlvvcAOoYjxjaVbeEuS?=
 =?us-ascii?Q?AlC9jGZOC+FfFoJv6g83czNXBisXJjQkNVB2xuEFVuxcjU4lbtQSKRcBJFda?=
 =?us-ascii?Q?MyIX7HP/Oc+yu6oJG1ZuWhiZep8ybkN1SDKQaF96vs1Bn0NDxdAGpBj7Ilr3?=
 =?us-ascii?Q?5YxCyHWedgy72T9rLNr+BMXmuwHMavY8kvBGISsX+MtzNHfRYfln/lIMGN//?=
 =?us-ascii?Q?G+WyiarzDhe2TKqZMtn64Q0Waa/hNvcwwP30AtwDINiWwKiDlPmCS80UB0Lu?=
 =?us-ascii?Q?ThW/3e82ma/SLKht7tR0z04DtOmpybgUYzxC3nLQav2FB8zeQFpyXhe05ru3?=
 =?us-ascii?Q?LadZxqoTvzSmti7uZw7XZ4jkigf9UpdATQxx+cUip/ZgoW7Dse53D7GX2I+5?=
 =?us-ascii?Q?Y8p/9uxrSx7Xl3nFoegXMI+4r0k3LW+xCbor373P9eKDwfYV1/zMT5Hc3c0V?=
 =?us-ascii?Q?eil8hRyrPEbuDo6d9iccfb1YdoXqKyEYkXiQWe7BAlnWcXBsa05EfSyo8U+w?=
 =?us-ascii?Q?CZ/V3tRncJQaVrb7J6sMBecGXF7W3Gq1So09BcbCAPEl/u/zZ108nqO8hKTy?=
 =?us-ascii?Q?BZv4ivxtUahIvjWERBMRmxh4hkCgxfZ9ijMtlt3X8e5ymlpZ874Gbs/CMOjU?=
 =?us-ascii?Q?/SlhCX6AjchEw5ePFKXZ3XsdJLZoN/TzQYf2eFvCC+JR7kbdjRmxXoltea4/?=
 =?us-ascii?Q?JkP8uANzg7vU/+HLDaUBwOCby0oxq+n3U7ozD4XHaNvn/JJfMCu2e4Luup3F?=
 =?us-ascii?Q?mtyBZ5kouXk+CeFmm9ESm1LCm5fz0pa89YmJ3QuIhINUfK1142pEf8vLHcfY?=
 =?us-ascii?Q?ryIosRO68ef+MfJlTrzHr1Ema1WHh3GS69ljREp9HOfvWWwawQ4zdXR+JIA2?=
 =?us-ascii?Q?FrdVGvVtlHJpzErzCaGJpkMMLGTt/zZBK3ZKQCjxNWKYPUVpyW+iBYTDq+Q/?=
 =?us-ascii?Q?ShE5WdKbtF8ACpCIGYeYrHL/3IoF1nHc+ENVmVeNbk8z/BS0X9C83Diz23Wo?=
 =?us-ascii?Q?UB3IagbzxVynwEjiK75UMh13ZT2KdOsoYyoFspztk45qasWH7h5rJv4NXngQ?=
 =?us-ascii?Q?VrBiPaeO9rK0p649mCWhjpnbmarQ66eHMx3bz1id3KDt13rTBv6a?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: ba346560-21e4-4281-cfc1-08de4edabb6e
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 17:24:08.8136
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DTqjl7Nk96f7TIMzmHv6ROaySR0cycaYHlWc8B5suLWBcHrp2y1eFzHv6dhcEMe5Od04zsApwvRtiyz+fKOYUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRP286MB5284
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Extend dw_pcie_ep_set_bar() to support inbound mappings for BAR
subranges using Address Match Mode IB iATU.

Rename the existing BAR-match helper into dw_pcie_ep_ib_atu_bar() and
introduce dw_pcie_ep_ib_atu_addr() for Address Match Mode. When
use_submap is set, read the assigned BAR base address and program one
inbound iATU window per subrange. Validate the submap array before
programming:
- each subrange is aligned to pci->region_align
- subranges cover the whole BAR (no gaps and no overlaps)
- subranges are sorted in ascending order by offset

Track Address Match Mode mappings and tear them down on clear_bar() and
on set_bar() error paths to avoid leaving half-programmed state or
untranslated BAR holes.

Advertise this capability by setting subrange_mapping in the EPC
features returned from dw_pcie_ep_get_features().

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
 .../pci/controller/dwc/pcie-designware-ep.c   | 242 +++++++++++++++++-
 drivers/pci/controller/dwc/pcie-designware.h  |   2 +
 2 files changed, 232 insertions(+), 12 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index 1195d401df19..406e9218e4ea 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -139,9 +139,10 @@ static int dw_pcie_ep_write_header(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
 	return 0;
 }
 
-static int dw_pcie_ep_inbound_atu(struct dw_pcie_ep *ep, u8 func_no, int type,
-				  dma_addr_t parent_bus_addr, enum pci_barno bar,
-				  size_t size)
+/* Bar Match Mode inbound iATU mapping */
+static int dw_pcie_ep_ib_atu_bar(struct dw_pcie_ep *ep, u8 func_no, int type,
+				 dma_addr_t parent_bus_addr, enum pci_barno bar,
+				 size_t size)
 {
 	int ret;
 	u32 free_win;
@@ -174,6 +175,208 @@ static int dw_pcie_ep_inbound_atu(struct dw_pcie_ep *ep, u8 func_no, int type,
 	return 0;
 }
 
+/* Inbound mapping bookkeeping for Address Match Mode */
+struct dw_pcie_ib_map {
+	struct list_head	list;
+	enum pci_barno		bar;
+	u64			pci_addr;
+	u64			parent_bus_addr;
+	u64			size;
+	u32			index;
+};
+
+static void dw_pcie_ep_clear_ib_maps(struct dw_pcie_ep *ep, enum pci_barno bar)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
+	struct dw_pcie_ib_map *m, *tmp;
+	struct device *dev = pci->dev;
+	u32 atu_index;
+
+	/* Tear down the BAR Match Mode mapping, if any. */
+	if (ep->bar_to_atu[bar]) {
+		atu_index = ep->bar_to_atu[bar] - 1;
+		dw_pcie_disable_atu(pci, PCIE_ATU_REGION_DIR_IB, atu_index);
+		clear_bit(atu_index, ep->ib_window_map);
+		ep->bar_to_atu[bar] = 0;
+	}
+
+	/* Tear down all Address Match Mode mappings, if any. */
+	guard(spinlock_irqsave)(&ep->ib_map_lock);
+	list_for_each_entry_safe(m, tmp, &ep->ib_map_list, list) {
+		if (m->bar != bar)
+			continue;
+		dw_pcie_disable_atu(pci, PCIE_ATU_REGION_DIR_IB, m->index);
+		clear_bit(m->index, ep->ib_window_map);
+		list_del(&m->list);
+		devm_kfree(dev, m);
+	}
+}
+
+static u64 dw_pcie_ep_read_bar_assigned(struct dw_pcie_ep *ep, u8 func_no,
+					enum pci_barno bar, int flags)
+{
+	u32 reg = PCI_BASE_ADDRESS_0 + (4 * bar);
+	u32 lo, hi;
+	u64 addr;
+
+	lo = dw_pcie_ep_readl_dbi(ep, func_no, reg);
+
+	if (flags & PCI_BASE_ADDRESS_SPACE)
+		return lo & PCI_BASE_ADDRESS_IO_MASK;
+
+	addr = lo & PCI_BASE_ADDRESS_MEM_MASK;
+	if (!(flags & PCI_BASE_ADDRESS_MEM_TYPE_64))
+		return addr;
+
+	hi = dw_pcie_ep_readl_dbi(ep, func_no, reg + 4);
+	return addr | ((u64)hi << 32);
+}
+
+static int dw_pcie_ep_validate_submap(struct dw_pcie_ep *ep,
+				      const struct pci_epf_bar_submap *submap,
+				      unsigned int num_submap, size_t bar_size)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
+	u32 align = pci->region_align;
+	size_t expected = 0;
+	size_t size, off;
+	unsigned int i;
+
+	if (!align || !IS_ALIGNED(bar_size, align))
+		return -EINVAL;
+
+	/*
+	 * The array is expected to be sorted by offset before calling this
+	 * helper. With sorted entries, we can enforce a strict, gapless
+	 * decomposition of the BAR:
+	 *  - each entry has a non-zero size
+	 *  - offset/size/phys_addr are aligned to pci->region_align
+	 *  - each entry lies within the BAR range
+	 *  - entries are contiguous (no overlaps, no holes)
+	 *  - the entries exactly cover the whole BAR
+	 *
+	 * Note: dw_pcie_prog_inbound_atu() also checks alignment for
+	 * offset/phys_addr, but validating up-front avoids partially
+	 * programming iATU windows in vain.
+	 */
+	for (i = 0; i < num_submap; i++) {
+		off = submap[i].offset;
+		size = submap[i].size;
+
+		if (!size)
+			return -EINVAL;
+
+		if (!IS_ALIGNED(size, align) || !IS_ALIGNED(off, align))
+			return -EINVAL;
+
+		if (!IS_ALIGNED(submap[i].phys_addr, align))
+			return -EINVAL;
+
+		if (off > bar_size || size > bar_size - off)
+			return -EINVAL;
+
+		/* Enforce contiguity (no overlaps, no holes). */
+		if (off != expected)
+			return -EINVAL;
+
+		expected += size;
+	}
+	if (expected != bar_size)
+		return -EINVAL;
+
+	return 0;
+}
+
+/* Address Match Mode inbound iATU mapping */
+static int dw_pcie_ep_ib_atu_addr(struct dw_pcie_ep *ep, u8 func_no, int type,
+				  const struct pci_epf_bar *epf_bar)
+{
+	const struct pci_epf_bar_submap *submap = epf_bar->submap;
+	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
+	enum pci_barno bar = epf_bar->barno;
+	struct device *dev = pci->dev;
+	u64 pci_addr, parent_bus_addr;
+	struct dw_pcie_ib_map *new;
+	u64 size, off, base;
+	unsigned long flags;
+	int free_win, ret;
+	unsigned int i;
+
+	if (!epf_bar->num_submap || !submap || !epf_bar->size)
+		return -EINVAL;
+
+	ret = dw_pcie_ep_validate_submap(ep, submap, epf_bar->num_submap,
+					 epf_bar->size);
+	if (ret)
+		return ret;
+
+	base = dw_pcie_ep_read_bar_assigned(ep, func_no, bar, epf_bar->flags);
+	if (!base) {
+		dev_err(dev,
+			"BAR%u not assigned, cannot set up sub-range mappings\n",
+			bar);
+		return -EINVAL;
+	}
+
+	/* Tear down any existing mappings before (re)programming. */
+	dw_pcie_ep_clear_ib_maps(ep, bar);
+
+	for (i = 0; i < epf_bar->num_submap; i++) {
+		off = submap[i].offset;
+		size = submap[i].size;
+		parent_bus_addr = submap[i].phys_addr;
+
+		if (off > (~0ULL) - base) {
+			ret = -EINVAL;
+			goto err;
+		}
+
+		pci_addr = base + off;
+
+		new = devm_kzalloc(dev, sizeof(*new), GFP_KERNEL);
+		if (!new) {
+			ret = -ENOMEM;
+			goto err;
+		}
+
+		spin_lock_irqsave(&ep->ib_map_lock, flags);
+
+		free_win = find_first_zero_bit(ep->ib_window_map,
+					       pci->num_ib_windows);
+		if (free_win >= pci->num_ib_windows) {
+			spin_unlock_irqrestore(&ep->ib_map_lock, flags);
+			devm_kfree(dev, new);
+			ret = -ENOSPC;
+			goto err;
+		}
+		set_bit(free_win, ep->ib_window_map);
+
+		new->bar = bar;
+		new->index = free_win;
+		new->pci_addr = pci_addr;
+		new->parent_bus_addr = parent_bus_addr;
+		new->size = size;
+		list_add_tail(&new->list, &ep->ib_map_list);
+
+		spin_unlock_irqrestore(&ep->ib_map_lock, flags);
+
+		ret = dw_pcie_prog_inbound_atu(pci, free_win, type,
+					       parent_bus_addr, pci_addr, size);
+		if (ret) {
+			spin_lock_irqsave(&ep->ib_map_lock, flags);
+			list_del(&new->list);
+			clear_bit(free_win, ep->ib_window_map);
+			spin_unlock_irqrestore(&ep->ib_map_lock, flags);
+			devm_kfree(dev, new);
+			goto err;
+		}
+	}
+	return 0;
+err:
+	dw_pcie_ep_clear_ib_maps(ep, bar);
+	return ret;
+}
+
 static int dw_pcie_ep_outbound_atu(struct dw_pcie_ep *ep,
 				   struct dw_pcie_ob_atu_cfg *atu)
 {
@@ -204,17 +407,15 @@ static void dw_pcie_ep_clear_bar(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
 	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
 	enum pci_barno bar = epf_bar->barno;
-	u32 atu_index = ep->bar_to_atu[bar] - 1;
 
-	if (!ep->bar_to_atu[bar])
+	if (!ep->epf_bar[bar])
 		return;
 
 	__dw_pcie_ep_reset_bar(pci, func_no, bar, epf_bar->flags);
 
-	dw_pcie_disable_atu(pci, PCIE_ATU_REGION_DIR_IB, atu_index);
-	clear_bit(atu_index, ep->ib_window_map);
+	dw_pcie_ep_clear_ib_maps(ep, bar);
+
 	ep->epf_bar[bar] = NULL;
-	ep->bar_to_atu[bar] = 0;
 }
 
 static unsigned int dw_pcie_ep_get_rebar_offset(struct dw_pcie *pci,
@@ -408,10 +609,17 @@ static int dw_pcie_ep_set_bar(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
 	else
 		type = PCIE_ATU_TYPE_IO;
 
-	ret = dw_pcie_ep_inbound_atu(ep, func_no, type, epf_bar->phys_addr, bar,
-				     size);
-	if (ret)
+	if (epf_bar->use_submap)
+		ret = dw_pcie_ep_ib_atu_addr(ep, func_no, type, epf_bar);
+	else
+		ret = dw_pcie_ep_ib_atu_bar(ep, func_no, type,
+					    epf_bar->phys_addr, bar, size);
+
+	if (ret) {
+		if (epf_bar->use_submap)
+			dw_pcie_ep_clear_bar(epc, func_no, vfunc_no, epf_bar);
 		return ret;
+	}
 
 	ep->epf_bar[bar] = epf_bar;
 
@@ -626,11 +834,19 @@ static const struct pci_epc_features*
 dw_pcie_ep_get_features(struct pci_epc *epc, u8 func_no, u8 vfunc_no)
 {
 	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
+	struct pci_epc_features *features;
 
 	if (!ep->ops->get_features)
 		return NULL;
 
-	return ep->ops->get_features(ep);
+	features = ep->ops->get_features(ep);
+	if (!features)
+		return NULL;
+
+	/* All DWC-based glue drivers support inbound subrange mapping */
+	features->subrange_mapping = true;
+
+	return features;
 }
 
 static const struct pci_epc_ops epc_ops = {
@@ -1120,6 +1336,8 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
 	struct device *dev = pci->dev;
 
 	INIT_LIST_HEAD(&ep->func_list);
+	INIT_LIST_HEAD(&ep->ib_map_list);
+	spin_lock_init(&ep->ib_map_lock);
 	ep->msi_iatu_mapped = false;
 	ep->msi_msg_addr = 0;
 	ep->msi_map_size = 0;
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 4dda9a38d46b..969b1f32dddf 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -479,6 +479,8 @@ struct dw_pcie_ep {
 	phys_addr_t		*outbound_addr;
 	unsigned long		*ib_window_map;
 	unsigned long		*ob_window_map;
+	struct list_head	ib_map_list;
+	spinlock_t		ib_map_lock;
 	void __iomem		*msi_mem;
 	phys_addr_t		msi_mem_phys;
 	struct pci_epf_bar	*epf_bar[PCI_STD_NUM_BARS];
-- 
2.51.0


