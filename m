Return-Path: <linuxppc-dev+bounces-15743-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BA7D208D7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jan 2026 18:30:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4drtRL6jjlz2xT6;
	Thu, 15 Jan 2026 04:30:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c405::" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768411806;
	cv=pass; b=EkZxO3tjCrsZbNJyejQTrI6B2kVfmC20N9bbjnEmsZEOLpH08ZRoXVMVRnBEuarvA0gc41oLehdoPuEEZwzSnUPO5bCWTNpaAjfd1DLtZDc674g0qA+gmkhUCJR0VMs0RUOfSslS3tKL+0KW3PG6ZHCamfkJBDCXKSmO8lR5Ko9T8vhx20bogYjgZZQGoKr9Q5MBMkq5oPDXOCffL9rZ10k8nOnx45VKq4B7/iHjPGEASwGDKgGwwQX/fa6GI/t6b+a4m1zEMohHSLq+lY2sM6dqSKFqCvwGn4BbbULkYSMEux+1aZQVIgPkJIj/YTPvSiMcrR6lKhVTgknZvGXQBQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768411806; c=relaxed/relaxed;
	bh=B00qWTvDFKEF/V78cwgYX4qYDQ6bTraGwIdgGtyrMqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=I9L8YgEMW+i6TibXZaZb/u1VQVPzIcCAyv/32bs0RmhAUFpDpmRc/EhapXcYRsZ5KlPMVtpEVYRKboRo2vDZ50rECUBcTJx7KHy2hExjqr7Ul75w9T0qUbnKaq1Rtch4jo2K1EUa4Pz9/UCl/RFZyWXYvWAG+2UULeTSIEeUCYUgSr3W5MrepRzEC5Kra5rwtCtgrLXk4M0p133xJhZgGaVK6hJcWEx2HRUphl8e4gJI/3ZYW3ycUk1pj6+9POInDovzYTljSH4q2fq88Ingmd9JlCCnwoHbdYkIHJ/aBcB4NoP+M3/eFx+vdH55Z0CN8C7Qtr44YFAIRAnBpcss9w==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; dkim=pass (1024-bit key; unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=bC64zsIt; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c405::; helo=ty3p286cu002.outbound.protection.outlook.com; envelope-from=den@valinux.co.jp; receiver=lists.ozlabs.org) smtp.mailfrom=valinux.co.jp
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=bC64zsIt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=valinux.co.jp (client-ip=2a01:111:f403:c405::; helo=ty3p286cu002.outbound.protection.outlook.com; envelope-from=den@valinux.co.jp; receiver=lists.ozlabs.org)
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazlp170100000.outbound.protection.outlook.com [IPv6:2a01:111:f403:c405::])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drtRK4dLWz2xJ6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 04:30:05 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o8nFelAaF71fO+iZWkDyjc02Pmuxa9OQyqyWdtksjHJyIGYVYZCifCuBPMxGkHRAwxWnHt+Pyxf2AVJbyNniY4u7kqQpCh5w8xKKXrPzZSBU6g7U0/45XFwmrTbxlHOH1V9QJJjYfQGbyyVr4clOuxcKU0yTdZe2FRpA5CMnKK4ISzqCkQqFVLYliH+gz2yDgMcADBtT9xwRu70GzD2IBUBkPmkAHxX4D9D0DJ7+XonJBakYzpsL5O57VjrwMVRTKpwS/lDiR73sEZJ50Dr/ehtTNvIG+Qldhh1ZiJY9D8zS61SOOEGuLp+393xebUYre0EC0oCdNowAK1lWSnozNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B00qWTvDFKEF/V78cwgYX4qYDQ6bTraGwIdgGtyrMqY=;
 b=Vrw4BJdP73uZimLWqOJCJ530R1Xyn06rpYG5SSHP++1ohfSYlJcztCWtdUJ2EhEB7l29i5J6fioTwuy6cA/RGKCb74ZJlKWFUJV2dI8GKs2OXb3aGVXufyhrLDoIzx2qAHR3LGTRRXhY7yA01U8s8h4w8E+Ae3f0D2Nffrgm5eEAJPHPT53hA98WD081TEjtmURgz1xPqBfWWxLBa8zagWBV9fZDDCrrdlcQ3djH/g7mBxyZMnF3CkWeosZddE7fd0meW0goYgVxATiH2yH/BBrWiwXLeBd4Pn1lej0FIyc7zgEK0ukq041JXhjdiJUYgcc5zEhLgpk/mwnL2SRpVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B00qWTvDFKEF/V78cwgYX4qYDQ6bTraGwIdgGtyrMqY=;
 b=bC64zsItLETHHHtdZcuNq+VBK2/mDKQiEZ1IQ/fpve6BM+Uk4VqxzVHKTJKfsqkXVIZ4H1rphfvIJTNMQjoGoTF9JH6pNxQVBTAwgW1YHmDLfWyx5RZaJoeOUko2swS4vMFrrxrSVouwAxlysYsCbbshg8E4ABO7u+/+bA1r78I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TY4P286MB5544.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:280::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Wed, 14 Jan
 2026 17:29:42 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9520.005; Wed, 14 Jan 2026
 17:29:42 +0000
Date: Thu, 15 Jan 2026 02:29:41 +0900
From: Koichiro Den <den@valinux.co.jp>
To: Niklas Cassel <cassel@kernel.org>
Cc: jingoohan1@gmail.com, mani@kernel.org, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com, vigneshr@ti.com, 
	s-vadapalli@ti.com, hongxing.zhu@nxp.com, l.stach@pengutronix.de, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, minghuan.Lian@nxp.com, mingkai.hu@nxp.com, roy.zang@nxp.com, 
	jesper.nilsson@axis.com, heiko@sntech.de, srikanth.thokala@intel.com, 
	marek.vasut+renesas@gmail.com, yoshihiro.shimoda.uh@renesas.com, geert+renesas@glider.be, 
	magnus.damm@gmail.com, christian.bruel@foss.st.com, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, thierry.reding@gmail.com, jonathanh@nvidia.com, 
	hayashi.kunihiko@socionext.com, mhiramat@kernel.org, kishon@kernel.org, jirislaby@kernel.org, 
	rongqianfeng@vivo.com, 18255117159@163.com, shawn.lin@rock-chips.com, 
	nicolas.frattaroli@collabora.com, linux.amoon@gmail.com, vidyas@nvidia.com, Frank.Li@nxp.com, 
	linux-omap@vger.kernel.org, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@axis.com, linux-rockchip@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v7 5/6] PCI: dwc: ep: Support BAR subrange inbound
 mapping via Address Match Mode iATU
Message-ID: <karx7k6lkem22dwyon2veqwvhko6e5jgzsk6bfhuymyzbdohqs@cqmsmclsgqnj>
References: <20260113162719.3710268-1-den@valinux.co.jp>
 <20260113162719.3710268-6-den@valinux.co.jp>
 <5kexuvze2a4m6bd3yhv2cd7yrzo4r6ubbbouktdsurv7n22v7o@7s3pgf6ftgur>
 <aWdyR4Xkh2_ZgOf8@fedora>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWdyR4Xkh2_ZgOf8@fedora>
X-ClientProxiedBy: TY4P301CA0080.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36f::8) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
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
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TY4P286MB5544:EE_
X-MS-Office365-Filtering-Correlation-Id: 81f71753-cf7b-4e5c-26a4-08de539280ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|10070799003|366016|27256017;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?T56Ngj/qJFEG/+sGL74RKCUwwVJadBVM2y2u9dvDSxKWQY2FFb0D1qL2kgbg?=
 =?us-ascii?Q?WJ0H8WnkB3UbOiHCH0erJoCKS1lVvyF08nZaClzX3xXsrZxXTudS+AQOjp14?=
 =?us-ascii?Q?/koK8RD3bxVtMQB131xNbzAlaMetvsz4g8IcfroYCQoOWpP6drRlgusLgroC?=
 =?us-ascii?Q?Khhs+S5eufd8xbW6bWnYGP7jiXy8+S8FLOjcm835jC6pvusVfVNTEFaKXDjC?=
 =?us-ascii?Q?Sv3bzpob++jVpGzyndMVUfcl+3tx8cYWrswyY7qhGmZ1bL9KpgW6LP8tZ7Vg?=
 =?us-ascii?Q?h9qUgkKSCUanXd3mLwaE5h5IqifvXmsEj7vZHkTEpd1fm7fUB6eXWIpLkfdl?=
 =?us-ascii?Q?zf0bf9RsiY1XEtVYclMMZtVEtjlQwCMJv1iuoMJildD2gLND+4t5YbEt94GB?=
 =?us-ascii?Q?f6pXex6ChYOQ3BEKJ0000laIusbEzRfSLjkGlbFVr1tWJPgQIRY9dLXt554L?=
 =?us-ascii?Q?0spC0SBhJjClYTaLiQpmSV8AFjfcmHyTWZD+sUtByxiixhKZxTWsaIkSZid7?=
 =?us-ascii?Q?PCLeuD/xodUzwewMtkY2KNADkt6QH2zt2H0eks3ygRvmN7b71G7E7+/XGCTO?=
 =?us-ascii?Q?bUoVd+eOWKfzgyXnl42L0aAk+JEy6TC5gJZe4amo/+B6RUqkvgO+rzjgbZIs?=
 =?us-ascii?Q?hGM5B8KE6N8qZrKXFtRTfXq1ZuvpSMQxEiD4S0FOkOG0w0vEZ+Ez6m2c1ll1?=
 =?us-ascii?Q?Sap4Rf5fB0tmwf1HExuwW0+8ZuuhT1aPYhiOjishbCj7CAh9zPm+kkNMd4I/?=
 =?us-ascii?Q?nKXz+YG35V8geIEEqBAMFhOpy0Dctzo+FnNLeNYUCL5KXwNje9REU1csuamY?=
 =?us-ascii?Q?dls+92bS9xpAn+CF+CmJEEevPIXKdZgXAz5GlcqSgB0YKhJ3hhFZz64cLyFz?=
 =?us-ascii?Q?nrWV/+Orrqgj3qWVhaENCfflHJM9P4tOtCTTs1EcUEV9ZsmffwMgnOLqQibF?=
 =?us-ascii?Q?ic/boy7y+JY2oeGbLuFZDcKMcfQ9o1skRi7DxG3jX1fShhZTmHGNTNM9vE75?=
 =?us-ascii?Q?lWMb00q1ZbKYO221LQGwOIVXayS6+a4kWm3uLoz7XEg8JJLpF0m5B1fmCtax?=
 =?us-ascii?Q?ffLTBkS1XFokf1cVUGj5y4+krlRfwl1uXgwW8iaUVDmxqFMsKI1tg7vKrsCF?=
 =?us-ascii?Q?RK92JqcsFMZ2MlhSKmaWPRVZhQ4WhFldnxVgIkA+w5JQMQsd/SU8s2ueJL/0?=
 =?us-ascii?Q?QyffR9p5NBAXKbOds5VoOM+yB4Spmn58pgNjH6UhH05C+CKozjetryxAZseJ?=
 =?us-ascii?Q?wwRpk9cTQDtzJhaI8Dj4M3TfQEl1lnlNlK3h0adNp4YErYUZmou9Z6qa88L3?=
 =?us-ascii?Q?Lb8gN3ptMsVdDUbCwscXQa0JCS5D6MfZSiRM39kIPKjFfBLCHd9MQf1gJ1qi?=
 =?us-ascii?Q?i38YOrlIs0FwuySZLEuU3VZLVO2bH9JankVgwndsvgVeRJ12UzjeMghV7yzY?=
 =?us-ascii?Q?XUW2myQSWEvAYBDkLxKQnzMiERSl6c4VZAjRPQoqDWuwGYIcngAFCVfZHdDF?=
 =?us-ascii?Q?RRkhGxGruxz++Rk7fdXcShbZgAfw90tZ1LkGyPLcZyqLDXtew9XJrDSroYsO?=
 =?us-ascii?Q?A8TIZXGw2eZbHscXPGiTf/2Igvq1Kx/bfcWGY2uyKFoRexebimHNzV5KBjMk?=
 =?us-ascii?Q?B6E3qeBI/H8uAkwCesPgg8A=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(10070799003)(366016)(27256017);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bfJAoykAqqyrZQ9TiyOOAAUDb87Y/5BCPEKUj0Pn62TWbgf3oV5Pw34gpdet?=
 =?us-ascii?Q?M+9467zQ6/kfX9KAwozVV/v21O+FNO+UqbZJ2LlfaiNK1+4VvIdm4mh4mJ8/?=
 =?us-ascii?Q?NHxitnG94BjWnBKablJaacPUZGm35wq1S9YIy1p+vAG8v0dSHaZqec3Kk3IX?=
 =?us-ascii?Q?iwpGdFGowAdo6FDX7IUqXoJg6AGbPYRil0We5DNbhJGsHc41DCGiOsTG1eji?=
 =?us-ascii?Q?LIfUg/voc+Gn3at3A9/nzRfyrOQSIldd9CCfY5EvmJNG/EF37626ZUXAD88h?=
 =?us-ascii?Q?ydQ8b48SN+P1O3QTpg8nPar3n4uEBQ6qUFQ7Pk7LU71N15wdhAoXmskMNM6V?=
 =?us-ascii?Q?2tlPljZDtZaE59F9+rZaWTiRGCulkqmaU2raYQjfpg1FA+o2gElQZb6imjgF?=
 =?us-ascii?Q?II/8L9T5RKhGskfkABeecjNttP7bXar+YHgN2rQFWARq4cRIUxhfN+N0S0Uf?=
 =?us-ascii?Q?RHSGmq8uwxQfJdIidDqQhK8IQEZFM2fLmAXsk4tm4T5tWhelJUsgeW6W5tVX?=
 =?us-ascii?Q?wbsts7jxxp54wIO87oeGCVJH6wXBNSjr4c6GSts6s7fRvbOn3YqVWxc3Yldd?=
 =?us-ascii?Q?3A/PYu6WbDz2OpYbSjspBUCX3l1Q9tcP/B+S+6s3glR8Ahl90jsPJ6WElpjP?=
 =?us-ascii?Q?999Kqv+DUhIPDsTYblgUqkOn4UGQaduiYPDrrnKcbAZSqbse4SPjAEKtfAc2?=
 =?us-ascii?Q?8kU0jAx+TiHDGOBJTVadE3Rrf10mD1MBGeJiDL+9lLIQGeRFAl/tR9yyxBIq?=
 =?us-ascii?Q?+hTQCWv08LytJ0DKcPzQdDmN4J/tbUFLLi5XFJAHpG15RUwgWCAUWDNycpMx?=
 =?us-ascii?Q?xviTDOHd4OG+oBFgdAqhkBXFGpUk2wCuZ0N7zlaKrViCVCwdiyFBsxJQDDdP?=
 =?us-ascii?Q?FDjk8L55dYlNMAeKzcq74EQoTxhi/4HnwhmZofTSYI9BlSEQX+4EexcH2XzG?=
 =?us-ascii?Q?uUYsGQrlNYsuaNxBfNuhLgC+p2GXSK/PICQt9Sd+nhFEhD+xSCEMObsSo/xC?=
 =?us-ascii?Q?Q/ckmkXwfuRQ7Lu1badoioZObZ18upOktyFm7u9kiUcqa1xrcCTLaW1wG2SM?=
 =?us-ascii?Q?iyrADk8UMXZvx1dhg2I5fhE0MenRFsFUpSRFcvsg6TuIxTFlWPAxEh4z4pE+?=
 =?us-ascii?Q?PRmVTba1DfOWUfCO1LfZe0qWRZZYDqjOLDqXYa3Ud9FKg5rWEkjNDh23HWRL?=
 =?us-ascii?Q?W194yU3CLpiQrr9EPeLwhKxaI9OU2SgtEAaSnsnEKk9JFv75ya1K+oEpjxdW?=
 =?us-ascii?Q?KixKwNyqkRf3I6Y2bfsajPXFA0ucIBcXYxv/fQXuoiv3YTtRClLVjSyP9fi1?=
 =?us-ascii?Q?EaTv5Bp3wBhJBPf9uwc11w0uHwUFh3pzipb6L1dLdf6dPOpx7EGLZAHQTZEK?=
 =?us-ascii?Q?pwL5b/jxVD2nIOczaEh/+Uo3o0OiNa9CYnegoGaxcxM9oQBhsoWx01uNK0dt?=
 =?us-ascii?Q?LHgAwAyAaqKgXDAmhnlV/QLbavcq98Ujg+fJKY4nQevzECn+Vic0zT59g1J8?=
 =?us-ascii?Q?IBfiLuEittC1jxF9MG5lk24PQGCUMblG6IuNah4EbVntrxGwST5bcfTxeEia?=
 =?us-ascii?Q?ImL6g/UPQqKpQRAKayHjdTpsbAvk6A5PY5jg075eE1QTMXykkAldupTwNXJC?=
 =?us-ascii?Q?iYL8s16IhWJfHhTSnADdpJQya1RuZLxEBFb2oUoz0SQjgShZ8+8Iecx+Ww8l?=
 =?us-ascii?Q?Mob66hY/SSBMQssSOaUrAA0iXa7G49Tzx4gAoBNJhbG+52RpjzSyuwbjQEca?=
 =?us-ascii?Q?DH3Z38h2U5ieaQivgqGq6KyYtGTPQpUnhiI/azrYI/GXhk1OqILD?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 81f71753-cf7b-4e5c-26a4-08de539280ea
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 17:29:42.6849
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5n998RUZ6pDPOxK4s2fUXCoNzxAai5NOkt0iP4VeqaTS8ye9yooGELxmn53l092jYoA12NDXDFvp5JOpPu44aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4P286MB5544
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Jan 14, 2026 at 11:39:03AM +0100, Niklas Cassel wrote:
> On Wed, Jan 14, 2026 at 12:54:37PM +0900, Koichiro Den wrote:
> > I realized that I missed one case in v7.
> > 
> > I think dw_pcie_ep_clear_ib_maps() should also be called from
> > dw_pcie_ep_ib_atu_bar() to tear down any existing inbound mappings for the
> > same BAR before re-programming it in BAR Match Mode.
> > 
> > This matters when updating inbound mappings for a BAR without resetting the
> > BAR in between. There are four possible transition patterns, and pattern #4
> > below was overlooked:
> > 
> >   1. BAR Match Mode -> BAR Match Mode
> >      As the current implementation does, the mapping is simply updated
> >      (with the same atu index)
> > 
> >   2. BAR Match Mode -> Address Match Mode
> >      This patch series already ensures the old BAR Match mapping is
> >      torn down before reprogramming.
> > 
> >   3. Address Match Mode -> Address Match Mode
> >      Likewise, existing Address Match mappings are cleared first.
> > 
> >   4. Address Match Mode  -> BAR Match Mode
> >      This case was not handled. The change below adds the missing
> >      teardown so that stale Address Match mappings do not remain active.
> > 
> >      --- a/drivers/pci/controller/dwc/pcie-designware-ep.c
> >      +++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
> >      @@ -148,9 +148,12 @@ static int dw_pcie_ep_ib_atu_bar(struct dw_pcie_ep *ep, u8 func_no, int type,
> >              u32 free_win;
> >              struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> >      
> >      -       if (!ep->bar_to_atu[bar])
> >      +       if (!ep->bar_to_atu[bar]) {
> >      +               /* Tear down existing mappings before (re)programming. */
> >      +               dw_pcie_ep_clear_ib_maps(ep, bar);
> >      +
> >                      free_win = find_first_zero_bit(ep->ib_window_map,
> >                                                    pci->num_ib_windows);
> >      -       else
> >      +       } else
> >                      free_win = ep->bar_to_atu[bar] - 1;
> 
> If one of the branches has braces, both branches should have braces:
> https://www.kernel.org/doc/html/latest/process/coding-style.html#placing-braces-and-spaces
> 
> 
> > 
> > Unless there are objections, I'll include this fix in v8.
> 
> Isn't it easier/cleaner if we call dw_pcie_ep_clear_ib_maps() in
> dw_pcie_ep_set_bar(), rather than calling it in both dw_pcie_ep_ib_atu_addr()
> and dw_pcie_ep_ib_atu_bar() ?
> 
> dw_pcie_ep_set_bar() knows the condition if we are dynamically reprogramming
> a BAR or not, and all the four cases are when dynamically reprogramming a BAR.
> 
> I.e. instead of adding additional code to dw_pcie_ep_ib_atu_bar(), we do
> something like:
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
> index b2ea2c2c986f..63ae5471fe13 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
> @@ -318,9 +318,6 @@ static int dw_pcie_ep_ib_atu_addr(struct dw_pcie_ep *ep, u8 func_no, int type,
>                 return -EINVAL;
>         }
>  
> -       /* Tear down any existing mappings before (re)programming. */
> -       dw_pcie_ep_clear_ib_maps(ep, bar);
> -
>         for (i = 0; i < epf_bar->num_submap; i++) {
>                 off = submap[i].offset;
>                 size = submap[i].size;
> @@ -571,6 +568,9 @@ static int dw_pcie_ep_set_bar(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
>                     ep->epf_bar[bar]->flags != flags)
>                         return -EINVAL;
>  
> +               if (ep->epf_bar[bar]->num_submap || epf_bar->num_submap)
> +                       dw_pcie_ep_clear_ib_maps(ep, bar);
> +
>                 /*
>                  * When dynamically changing a BAR, skip writing the BAR reg, as
>                  * that would clear the BAR's PCI address assigned by the host.
> 

For pattern #2 and #3 (ie. either mode -> Address Match Mode), the v7 code
withholds the dw_pcie_ep_clear_ib_maps() call unless the submap validation
passes. The above patch differs slightly in that sense, but I agree it
looks much simpler. I don't think the difference matters much, since
pci_epc_set_bar() with an invalid submap should already indicate that
something has gone wrong (most likely a bug in the API call site). So I
think I'll go with your suggestion.

Thanks!
Koichiro

> 
> 

