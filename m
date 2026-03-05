Return-Path: <linuxppc-dev+bounces-17773-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WMYmKcZ0qWl77wAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17773-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 05 Mar 2026 13:19:18 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C60532117A6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 05 Mar 2026 13:19:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fRT9Y6G4Fz3c5j;
	Thu, 05 Mar 2026 23:19:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:d409::" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772670487;
	cv=pass; b=kI8qv5uxFAqnjeProYF7A+gbCgWmMvLarrEnQ40a3PI6HmuC7oT1HfdqoPQkJDzEqIeh/2D4v+Uwb7RkyH23zMCPwONNqpzrF8Tnz0bn3Vba+UKJ8by+mGUxZGK+2cNP3utacaZDGo00sEdHib5phEY8aQTBbznnwTVu0N/3dKWkEhrNrsUo/uWstU/BcwTfuaoOtn1rjIotVl/BJ0ASmtbCcJiDEBKcpLNJ59vN2AVUdGSjPdKhMDWWFpJZEjXu2Usa1HPMlfh/zfd3ZbVjTxdPiCKriDT+4x+/GQCedO014/kVtxU7K868mVccWny6I18T5WY0DNtqbih2eyvqWw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772670487; c=relaxed/relaxed;
	bh=sdw/+VpM6iouSnsmX5ZjIJcyigPK/dF56hm7Xnv792U=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=MtRX47ke9ZA1JyATapVlAM1q2OehPMT4iIbICOCBPnrFA+5874g8IzzwUejq5zcL5XSPhaBDtpS4e/8UiJf1zg9VGSb7ecI7O1ew1mUvclGo8ulsegWkmUakuYD9lfnRqgEXtxkeROV9M3NSUaKqSwtwqr7Y/fsUaADFq7pw8Oay+zRt7zFdzVCoQ0QnVv7GTxuL7hQSZ7PlPVwx0HSk05uDPOtvuozUpG4qD4L/uGZMDXcLYxKzRKhJ0RNAW37P/U0wRe1ATibJ5lMhZc6MIyOMVbYFj2t3acIoq7pojfngGxx4bS0/Dx01RFjoFQmbcU61SBtgSYGgHrczAWaGIQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=outlook.com; dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=sahOjNw8; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:d409::; helo=pnypr01cu001.outbound.protection.outlook.com; envelope-from=unicorn_wang@outlook.com; receiver=lists.ozlabs.org) smtp.mailfrom=outlook.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=sahOjNw8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=outlook.com (client-ip=2a01:111:f403:d409::; helo=pnypr01cu001.outbound.protection.outlook.com; envelope-from=unicorn_wang@outlook.com; receiver=lists.ozlabs.org)
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn190100000.outbound.protection.outlook.com [IPv6:2a01:111:f403:d409::])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fR9P22r60z30FF
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Mar 2026 11:28:06 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UHbvkvq/xN1U/13Qmsacw8iS+jR/n5Cpz+PFL1GQcQ/rS9YY88uI8j8lQ1i42PrgD0QykFGksk4gubjhQTPWiuB7cFKcTTzBqSt5M6jbQ1jB4ltGhbArgkZIM68C4OHZactcc17UEUaOYWyJtEGeR6eQpdlPpcbNwYuaB2aqNuEnOYiYP8RpUI7lZbBTjb8UZt8Z0sW+PSDiIdPLvHUkNco/5L6lKMuwvv7RH6y3P36339w2WPC9vVxcZhZDxLvEwamg/tN4MZ24hMJXjjZ+8er9UHxnXF9CbmnCi1nVF81nCFmZCo8/QNcNBaoLSmnb/HxkTwfDG0JQ78WojcWmtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sdw/+VpM6iouSnsmX5ZjIJcyigPK/dF56hm7Xnv792U=;
 b=zMntNX4w/51y+b8yeiuIeyEhGTsHNmZtsMBMjNLgepQ9iI0rY+hVROCIWwkyg5RCPfD/E4ceRWB2wu5cQi1gkq9OniYQ2o2EoU9xq9iYF4JN2yF/IYPaB5Udkaxt8NlZ/lfy4pwnkTSN84+lc5CJCiqIa8dRijyzJjMv+f6zNfnBQq58OtPrxXLI/oHMIgXZvIotgt/4OlyvrpTj9gTW8hTGe4SGrJ79iKq/7wVYjFHHcOZi3RKqiq4cjwWSKWitFja32dBNpmZLM+HGSGdWnScKf2S+XTZhrb0RFgMnJQFNRXAZGM8D8jkG+fzHACRpcF1+enzezMklmogI+af6LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sdw/+VpM6iouSnsmX5ZjIJcyigPK/dF56hm7Xnv792U=;
 b=sahOjNw8Z4HusYGsweaJ56M8GwyEK+F8kQRHQx80tRK/8/NCFiLKiHY48Iv2lcQ3N8cj+Y6PXW4Ndq5KexR61114CV9SWLsD9rg/rSUYpXQjMcR6CMJPWGAKXCTOrj2xlgTas8pYmX7Awej81y28FztFvQwNrcYFohPA5ZUQwRK1BvYSiEsb/wbvx8ztu5ChfFsf03BU9HrEpkupaUa+XaRtg9n8Tn+u3a8gTr7Yu8n6YORTxHqMY8rU9z3aJ8KHrytv8QzmruodNOl3T1kXkocrO2FMiQnpoMg4vxVhqSvnGmiSTuLUIVH6EAgc3oV/WIG7VzRys9uNasz20Jf7Bg==
Received: from MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1e9::18) by PN3PR01MB9936.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:171::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 00:27:26 +0000
Received: from MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8a6b:3853:1bc:67e4]) by MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8a6b:3853:1bc:67e4%6]) with mapi id 15.20.9678.017; Thu, 5 Mar 2026
 00:27:26 +0000
Message-ID:
 <MA5PR01MB125008C876FC8461A80514DE8FE7DA@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
Date: Thu, 5 Mar 2026 08:27:12 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v1 00/18] PCI: Enable async probe by default
To: Anand Moon <linux.amoon@gmail.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, Siddharth Vadapalli <s-vadapalli@ti.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Minghuan Lian <minghuan.Lian@nxp.com>,
 Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>,
 Yue Wang <yue.wang@Amlogic.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jonathan Chocron <jonnyc@amazon.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jesper Nilsson <jesper.nilsson@axis.com>, Paul Walmsley <pjw@kernel.org>,
 Greentime Hu <greentime.hu@sifive.com>,
 Samuel Holland <samuel.holland@sifive.com>,
 Chuanhua Lei <lchuanhua@maxlinear.com>,
 Srikanth Thokala <srikanth.thokala@intel.com>,
 Xiaowei Song <songxiaowei@hisilicon.com>,
 Binghui Wang <wangbinghui@hisilicon.com>, Inochi Amaoto
 <inochiama@gmail.com>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
 Niklas Cassel <cassel@kernel.org>, "Jiri Slaby (SUSE)"
 <jirislaby@kernel.org>, Qianfeng Rong <rongqianfeng@vivo.com>,
 Koichiro Den <den@valinux.co.jp>, Hans Zhang <18255117159@163.com>,
 Sai Krishna Musham <sai.krishna.musham@amd.com>,
 Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
 Vidya Sagar <vidyas@nvidia.com>,
 "open list:PCI DRIVER FOR TI DRA7XX/J721E" <linux-omap@vger.kernel.org>,
 "open list:PCI DRIVER FOR TI DRA7XX/J721E" <linux-pci@vger.kernel.org>,
 "moderated list:PCI DRIVER FOR TI DRA7XX/J721E"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:PCI DRIVER FOR SAMSUNG EXYNOS"
 <linux-samsung-soc@vger.kernel.org>,
 "open list:PCI DRIVER FOR FREESCALE LAYERSCAPE"
 <linuxppc-dev@lists.ozlabs.org>,
 "open list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <imx@lists.linux.dev>,
 "open list:PCIE DRIVER FOR AMLOGIC MESON"
 <linux-amlogic@lists.infradead.org>,
 "open list:PCIE DRIVER FOR AXIS ARTPEC" <linux-arm-kernel@axis.com>,
 "open list:SOPHGO DEVICETREES and DRIVERS" <sophgo@lists.linux.dev>,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
 "open list:SIFIVE DRIVERS:Keyword:fu [57] 40"
 <linux-riscv@lists.infradead.org>
References: <20260304140329.7089-1-linux.amoon@gmail.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20260304140329.7089-1-linux.amoon@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TP0P295CA0019.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:5::13) To MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1e9::18)
X-Microsoft-Original-Message-ID:
 <be3e4319-e9ec-46ea-bcd9-42d7707c3646@outlook.com>
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
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA5PR01MB12500:EE_|PN3PR01MB9936:EE_
X-MS-Office365-Filtering-Correlation-Id: f9ad4c95-ffeb-430f-2457-08de7a4df9c6
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|39105399006|19110799012|5072599009|461199028|6090799003|23021999003|8060799015|15080799012|1602099012|40105399003|31055399003|3412199025|4302099013|440099028|10035399007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dzF4Q3NIZ3BualFaSDdld0w0RjU1aSswejZ2TFozTGhvOHhaRGtOd0tnZTA1?=
 =?utf-8?B?NHl5OGhxb0IyRHpHS1R2TTloZ2dVQjRjRGtLU3FrK0UrUjhweUFvay9UVnh0?=
 =?utf-8?B?bTNsZTh1NkFBTVNOREhWVEt0dlhDZVR2bVZlR2F4V3VxQXpPVFhDVFpMK1NO?=
 =?utf-8?B?ekd5RytQanJhamVBZGRIZjF4ZS9TNTk1YVg2Q2w0YVRSNS9Hd09xNHQ2Mkpk?=
 =?utf-8?B?emdCSFkraExIdlVvTE11bjl2alpTTnNGZUMxK281VWZOZWYzaWx6Sy9kNTl1?=
 =?utf-8?B?V0NzWnAyWldWeHA1NjlUVGhvLy94V2tEK05mbFhXMGFGb0pneU9QMTdjNUlD?=
 =?utf-8?B?KzZ2c28zQVNkSS9aTEdLdzR5Sk5xQzdaOGdyVkNra2JweG9qUUVZQkJaaW1v?=
 =?utf-8?B?YUdIYnBlQjZMQjRHWkRPUWczK3FqSXRjeCttNWR1MDdLcnlOK0VrODUyN0E3?=
 =?utf-8?B?YXlWcXo5RW5FRXZoNWtIUjZhZC9lZk1oVkc5dVFoeDMwakpuNjg1Yks2SGc4?=
 =?utf-8?B?THJDVHEveFhaSmd5SkdUM01CdGVwNkJIV2gwcWxhdXdYUDBPd3pxd1lld0Rm?=
 =?utf-8?B?RGtSUElvbTF0NzdqUU9jb3FGL1J6VGFGNlE5VVZMdHFtSDlabE5qZW1NMnYy?=
 =?utf-8?B?ZmlEWm1uM0dESHBUdlo4WHVETlZiY20zLzVveDB3cVpsTGpBWWFWamhqVUR0?=
 =?utf-8?B?Z2JyUFdFSXFYV3RpNGFRUytSL3lBdXVmZHA1cGVFWThxd25IdFJCU1ltdTZL?=
 =?utf-8?B?TE9rSzFvQzlLSk1LY3V1aFFuM1Nra09paWoyd1JuNjBPMzlBVjBIK3dRV2xY?=
 =?utf-8?B?SVRMSmZINXBrL2d1UFpReHVISTFXdTBTUHpMM0RuZ0FPSnZjanhHWksraEM4?=
 =?utf-8?B?UDN6VXQ4ZHYxd1dVU1lSRGxvK0dvamIrQkFncUpMcS8wbjdVc2c0VFN3RmFH?=
 =?utf-8?B?aGhIRUFVc0R6WTQ0MG9tQSt2ZVV5dXFVRjlIR0k0cThWYnVSOHBid1orUDFM?=
 =?utf-8?B?Y0tDVWxwN0ppRkNxNkxOaHhjQXRUUk00YTVCcEE4T3p3cnM3UDg2TnFJL1ph?=
 =?utf-8?B?Q25RZ2xLY21aUzRyWWYyR01SbU5RVWM1RXhmUHdLbncvWWJXZWVuYVBPZTFI?=
 =?utf-8?B?S3hWK0FVUTRkWFdSTVE0bU8xaDk5Ry9laFBrNEliWFRqVDVXby9ZVjVubWdz?=
 =?utf-8?B?NnJsM2h3LzgrZjYxNHZta1pqVDhOdUtaOFl1MGpPVzZycml3UWdNN2Y1NzNt?=
 =?utf-8?B?cldxVEl2OHFQclNwVldTSmdHTHN2M01EaElwSkRJZWdzc21BVEYyTGpZZlJR?=
 =?utf-8?B?Uk1Gc0lTRk9zV21hQWRHYjhvY24xcTAxQjdHSmlucHM1Ri9nTnYrREJQaGNn?=
 =?utf-8?B?MlpaVkFNSkFWVHN5bWhWWElLR2Z4TlM5dnhHNCtCT3VyZWc3Q2JwUnArYndm?=
 =?utf-8?B?Zm1XZm5KVVo2K2xuRkltK2dxK29oZ0ZUaGdta3ExT1hRSkZsYUFQU1dJVGgy?=
 =?utf-8?Q?MrUkGw=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?djZJMmpDaDY3NG5aSDlzU05WU1RtWjhuak5RT29scE1yUk16UldvcGxvaHA1?=
 =?utf-8?B?eHFsYnE3aThvMEozckpOcEVJa2R1T2w4VHJwUHRxU3Y0bzFvYVBkbWRLK2F4?=
 =?utf-8?B?SERRZFJHUkZYQjB2OXgyT2RWQzJ0WmkzdzMwQkYvVDBudk9KOFNWYWw2MU1a?=
 =?utf-8?B?MWhOdG4rWXBlR2xSVHE3aVVHZm51bkpnSklpZ3pVeHhmblpYVUFOMU4zVUxH?=
 =?utf-8?B?RTU2djBzNWRpTWZ2aFZIa3UvMzhIb0ZKc2RKVUxMMjljWm0xSjFhVkg4Q0hS?=
 =?utf-8?B?cGJiYzFRZEV1aml0QmkrbzJGeDFwd1BaQXFsRHNOcmNEK0ZIMDA4VVBYcmJj?=
 =?utf-8?B?NFdGTUtMUGpVL2pmWVFSbmVYb2dYUUkxS0hUZ3VpdDhvU3pzZ2RBT3N1TmJB?=
 =?utf-8?B?NzFEMUtzWDN3clNTNjYxbEs2T1ZtSmJQVmllNWhaUDg2aUJTOFFMbGJkWTNu?=
 =?utf-8?B?RVpwZUlmbzN6b3FqSHA5TThwSkErMTdOQ1Rrd2lKM01KRGRmUXR4VHFjRnhz?=
 =?utf-8?B?MlR6enV6YlR0bit4U09DdFhOV3hNWTEza2FmWU8vMDdVc2NERnZreHBsOEh2?=
 =?utf-8?B?M3p0d3UrYlBncVVtYjBzaytMc3VJSGhiS1NWSGpOd3E5TVJOZHllVGVlT0Uy?=
 =?utf-8?B?dWpzQk93aHc4K044eXRURkRJdUtWRGhrcUNvcHVFMno2N2pwclVyRnhCRWRO?=
 =?utf-8?B?eGtOREVxcStvOURnRStUcytITEdhbEpmNjVQUzY3b2xSNnBnNENKVys4YWw4?=
 =?utf-8?B?Y1d4WXJtbEwzWDQ4L1ZyUnZuVDVJRDE3K2JDWnE5VWhDS3BJcmw2Z3pKckVB?=
 =?utf-8?B?NGFqZzh0NjVjT1R6d3o2eC9XMnpZc0RaRnZvcjREWFdvU04vd3FsakViTU9x?=
 =?utf-8?B?ZkQ0Mjl3YUwxOEdEK3pEQzh1SnZQbXBlcWlhQ1BoYjcweEs3NGYwMWFteXNr?=
 =?utf-8?B?RFRvUmUrUW55S0ZZM0ZkSFFPYWlSS2ZFV2s2WHVDd2RXTkJpZ3pmUjFSQW5M?=
 =?utf-8?B?QUU4Mks1ZUpaZGxGNitZUEEzdmxpLzloUlVMWWVvdlpJWlpaNTBTUnFNM0Zp?=
 =?utf-8?B?UWQvN0tPZDZXSVExeGF3WXBoS2tWcnhsbVJ2Y0l6dm9vNUdBcC9VdElYd3d2?=
 =?utf-8?B?aG1ZVllGZXI4R1JMckNvRXVpUU0xKzJkRWV4d1BrbWw1V3hPcGduMHZwd01w?=
 =?utf-8?B?c0ZEZHVWK3Z3UjRRUnlSeFdFRVZlMDhoT01JRFJ1TmhsNGlXdm9aSmhuS1Vt?=
 =?utf-8?B?Y1ZOcWIxNVFNV0gxeGRNRVlOOW9hZVRkd3lvbml6VGw1Z3JtNVZtRisxNHBq?=
 =?utf-8?B?ZmlMTmlna0k4b2M4aTFjemxYSXBhQWM1RzVYeGZPeFVmSFBkRUNTOHAzRVNo?=
 =?utf-8?B?akNSbXVmcC9JalpjdnBCZThQS2xQd3g2Nk12SUZqbjhyby95M3NmejBoVzVq?=
 =?utf-8?B?QWpLaTNHcFhnY2Yxd2FNQnAxcEZ2aHlXZTZiWDJMV2EyQ3RRdjRBaE43Q3BM?=
 =?utf-8?B?end5em9yR2szV0dRTkU4L1Q3NzJmbE9uUldoWmtCejlEVFdwMEJBTk1wcjNs?=
 =?utf-8?B?M1BsRlBwMnl0T0xFOXM3QjZvN290TEk2MUFNR2hQWXZWemQrSmxQYllJQzF6?=
 =?utf-8?B?eUQ0SjZEd1BtM21LSDlvWjBkcWEvUFlkRm1oM3BRaS9wcVpYZitMRmtMdDZO?=
 =?utf-8?B?WVB0SDZYSU9zcXdBM0VNQVJSbmxmTnc2RTVUekhQWVIrR3lrYlRITEZVRDBH?=
 =?utf-8?B?ZElzcjUxK1RGUzYvMXl6WHdYRmtHMXAzQnJiZEE3SGNqZGlyZFNlb2Y4NC9s?=
 =?utf-8?B?bWJiVHVSOFRFc0pTRUQxcEZ6cUEzNFRycHhiTWpqektDT0hTNUl1UU9qeStP?=
 =?utf-8?B?V1E0YVJ4cjhwZ0dIQ0lnYi9sSU9peFoyWnQ5OHZEaUgwZDhtbCt2N3J4UHFu?=
 =?utf-8?Q?SGbUydehJYyqyFtYUlf3lTxMWyKwWDx9?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9ad4c95-ffeb-430f-2457-08de7a4df9c6
X-MS-Exchange-CrossTenant-AuthSource: MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 00:27:25.8239
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB9936
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: C60532117A6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-17773-lists,linuxppc-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_MUA_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[unicorn_wang@outlook.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_TO(0.00)[gmail.com,ti.com,kernel.org,google.com,samsung.com,nxp.com,Amlogic.com,linaro.org,baylibre.com,googlemail.com,amazon.com,bootlin.com,axis.com,sifive.com,maxlinear.com,intel.com,hisilicon.com,nvidia.com,socionext.com,mail.toshiba,vivo.com,valinux.co.jp,163.com,amd.com,vger.kernel.org,lists.infradead.org,lists.ozlabs.org,lists.linux.dev];
	FORGED_RECIPIENTS(0.00)[m:linux.amoon@gmail.com,m:vigneshr@ti.com,m:s-vadapalli@ti.com,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:mani@kernel.org,m:robh@kernel.org,m:bhelgaas@google.com,m:jingoohan1@gmail.com,m:krzk@kernel.org,m:alim.akhtar@samsung.com,m:minghuan.Lian@nxp.com,m:mingkai.hu@nxp.com,m:roy.zang@nxp.com,m:yue.wang@Amlogic.com,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:jonnyc@amazon.com,m:thomas.petazzoni@bootlin.com,m:jesper.nilsson@axis.com,m:pjw@kernel.org,m:greentime.hu@sifive.com,m:samuel.holland@sifive.com,m:lchuanhua@maxlinear.com,m:srikanth.thokala@intel.com,m:songxiaowei@hisilicon.com,m:wangbinghui@hisilicon.com,m:inochiama@gmail.com,m:thierry.reding@gmail.com,m:jonathanh@nvidia.com,m:hayashi.kunihiko@socionext.com,m:mhiramat@kernel.org,m:nobuhiro.iwamatsu.x90@mail.toshiba,m:cassel@kernel.org,m:jirislaby@kernel.org,m:rongqianfeng@vivo.com,m:den@valinux.co.jp,m:18255117159@163.com,m:sai.
 krishna.musham@amd.com,m:thippeswamy.havalige@amd.com,m:vidyas@nvidia.com,m:linux-omap@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-samsung-soc@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:imx@lists.linux.dev,m:linux-amlogic@lists.infradead.org,m:linux-arm-kernel@axis.com,m:sophgo@lists.linux.dev,m:linux-tegra@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:linuxamoon@gmail.com,m:martinblumenstingl@gmail.com,m:thierryreding@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[outlook.com];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_GT_50(0.00)[55];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[unicorn_wang@outlook.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[outlook.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:dkim]
X-Rspamd-Action: no action

Hello Anand,

On 3/4/2026 9:51 PM, Anand Moon wrote:
> Following recent asynchronous probing updates to the Rockchip PCIe
> controller, this change enables default async probe functionality for
> all DesignWare Core (DWC) based controllers to optimize boot times [0].
>
> [0] https://lore.kernel.org/all/20260226101032.1042-1-linux.amoon@gmail.com/
>
> This PROBE_PREFER_ASYNCHRONOUS flag help to parallelize device initialization.
>
> Thanks
> -Anand
>
> Anand Moon (18):
>    PCI: al: Allow asynchronous probing for background link training
>    PCI: amd-mdb: Allow asynchronous probing for background link training
>    PCI: armada8x: Allow asynchronous probing for background link training
>    PCI: artpec6: Allow asynchronous probing for background link training
>    PCI: bt1: Allow asynchronous probing for background link training
>    PCI: dra7xx: Allow asynchronous probing for background link training
>    PCI: exynos: Allow asynchronous probing for background link training
>    PCI: fu740: Allow asynchronous probing for background link training
>    PCI: intel-gw: Allow asynchronous probing for background link training
>    PCI: keystone: Allow asynchronous probing for background link training
>    PCI: keembay: Allow asynchronous probing for background link training
>    PCI: kirin: Allow asynchronous probing for background link training
>    PCI: layerscape: Allow asynchronous probing for background link
>      training
>    PCI: meson: Allow asynchronous probing for background link training
>    PCI: sophgo: Allow asynchronous probing for background link training
>    PCI: tegra194: Allow asynchronous probing for background link training
>    PCI: uniphier: Allow asynchronous probing for background link training
>    PCI: visconti: Allow asynchronous probing for background link training
>
>   drivers/pci/controller/dwc/pci-dra7xx.c     | 1 +
>   drivers/pci/controller/dwc/pci-exynos.c     | 1 +
>   drivers/pci/controller/dwc/pci-keystone.c   | 1 +
>   drivers/pci/controller/dwc/pci-layerscape.c | 1 +
>   drivers/pci/controller/dwc/pci-meson.c      | 1 +
>   drivers/pci/controller/dwc/pcie-al.c        | 1 +
>   drivers/pci/controller/dwc/pcie-amd-mdb.c   | 1 +
>   drivers/pci/controller/dwc/pcie-armada8k.c  | 1 +
>   drivers/pci/controller/dwc/pcie-artpec6.c   | 1 +
>   drivers/pci/controller/dwc/pcie-bt1.c       | 1 +
>   drivers/pci/controller/dwc/pcie-fu740.c     | 7 ++++---
>   drivers/pci/controller/dwc/pcie-intel-gw.c  | 1 +
>   drivers/pci/controller/dwc/pcie-keembay.c   | 1 +
>   drivers/pci/controller/dwc/pcie-kirin.c     | 1 +
>   drivers/pci/controller/dwc/pcie-sophgo.c    | 1 +
>   drivers/pci/controller/dwc/pcie-tegra194.c  | 1 +
>   drivers/pci/controller/dwc/pcie-uniphier.c  | 1 +
>   drivers/pci/controller/dwc/pcie-visconti.c  | 1 +
>   18 files changed, 21 insertions(+), 3 deletions(-)
>
>
> base-commit: 0031c06807cfa8aa51a759ff8aa09e1aa48149af

Suggest you indicate in the title of the cover letter for the next patch 
that this patchset is only related to dwc.

Thanks,

Chen



