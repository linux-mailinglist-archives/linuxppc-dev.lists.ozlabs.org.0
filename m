Return-Path: <linuxppc-dev+bounces-15777-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F2FC8D23442
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jan 2026 09:50:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dsGs74w5tz3c97;
	Thu, 15 Jan 2026 19:50:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c405::" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768467019;
	cv=pass; b=NYZYF7DqLbbBF4AjTROr7hl7mDClAte/B2+hUM9NhjYh6FWXlJRUD93xL4HX37j51h1glQik9L3vV76piFbLmkP67Q4UMb8/+Npj2cbLkBRktw7AaJmlvHBgbraQ/s3zY/I69DIjqWrNbTl9413WRF/s5e+XmDk/84BWJiX6g7eJer/pRFyohpH5k3/3SkravAlmktvl4SKzBjXjo2EUUMRTca76zdCz9crKLHKjzawBvhpvSNn/UspLRT+SvB535Q4gQImiuZ80TFVnigZMgtvIt7xl4tsVB/hQGkKzxOw2qmXgOKGVnBKnR9vpKl/BOW/NI1RR5quR3S0WHqchyg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768467019; c=relaxed/relaxed;
	bh=PlhEqAwn8W6c6GYgp3MfrJnHtHWw5y4wM8Zns23nSBw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=n6IVGDHatnrBPOyySUZENIlMWJL+vGqwc//3Nf/2LXrjWxAByZUu0jDwkrOWQI/ucvKUHnIq4Bza5PcaybTfPzKHSk97PggklwVluqXuWaBId9/+NhRW497YXOKgQiMUU5HDpCPlo/M1u0AhFf12rSZPgp2/mS1imjCTEpQhOXfEvxwsgEGh3BHSq2+daFtD1qfUKlz/JVzNEOHjlq8+nxHKRPfASk7RcXr2nh09DPiscQel/UE16DE49KsZbZLzkuI/e4gIyY79i4+FwmlWQqcdnR/OlZaMFdOtaWjOlzNt6j0P5mSBIW3Zqro0308AfEqFyrwMg46LMyCc7jxQCw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; dkim=pass (1024-bit key; unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=i2tL+5tl; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c405::; helo=ty3p286cu002.outbound.protection.outlook.com; envelope-from=den@valinux.co.jp; receiver=lists.ozlabs.org) smtp.mailfrom=valinux.co.jp
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=i2tL+5tl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=valinux.co.jp (client-ip=2a01:111:f403:c405::; helo=ty3p286cu002.outbound.protection.outlook.com; envelope-from=den@valinux.co.jp; receiver=lists.ozlabs.org)
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazlp170100000.outbound.protection.outlook.com [IPv6:2a01:111:f403:c405::])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dsGs70TxJz3c1T
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 19:50:19 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CdhB+a6/4pflJclhQwZP/L9C7oDT795zm1g12MLmuIfPLzTzWjIZnfWwWo2aTRLAT+VL/pBHB32JrpEgFNl+zu5RdHnraoSq9dpDTragrGut3UXBwKLHg472UPy3lKCtDhECGdf2tPCUfvYaBcsaZ4+OUIZ2spTQWx5iRqhLqRSpDa/Dketz+7B7wkxxgpuIKieYft3lL+lMALCcWadHYifXYdZZF2TkFNMEJ20BhdO4abwhW3HoIQR51JE77hPWo5MnTgFTqZ8O6wsNCjpfOvzs0AJ9RhWrKKU7vtKiybJStx4NX97W9jnPnfZgZR3a2HtH7vbZwbUb/mCtPHOYwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PlhEqAwn8W6c6GYgp3MfrJnHtHWw5y4wM8Zns23nSBw=;
 b=ftSE+hicno9oNNU7TH1TPPLY8RJyEziyEFIGgoTCa1YTYnLxUU2xiXhGJcOAckBAFbZSDW0zM1RDZXNJ++DSpCULX3FjVjqvbg+ClWI+uwgM+z0A5EQDfflctogYw2hr5sclzZk1Qc+Z/bYugKtDSKy7NVRxumF+h5MU/nYt8lF7Z6JeQv/+0ig1lRiJ5NKo7cbmySPew1UAKvUUOoewDebh6iPz3Vt63ou3F2kUrab7JQGNW2ailOEEUZEbLKksS7mnzgh4KKfKgiRf4zAXYf9UGU6GRxz8z/qCN7ltZwhwQA/nG8D3IQ7UerkO81t4ANPbnPfxZwV1LUwmDhgKGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PlhEqAwn8W6c6GYgp3MfrJnHtHWw5y4wM8Zns23nSBw=;
 b=i2tL+5tlx21OdOEXk56C5QPgkqSu2KZU8gKxiVlVpcaevCpBwd+E+uT0c2CRTWsSkOT3MMbGOXdvKpHvuhaV2/U1R+8A5YqjlSQzEqVziQKCfjYOmzQaBrIrCzllDZOJl7VZb/shnq/GOhGKAAm0XSK0SvoMSH9aWcHQo+b24oc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYRP286MB4454.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:133::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Thu, 15 Jan
 2026 08:49:59 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 08:49:59 +0000
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
Subject: [PATCH v8 5/5] Documentation: PCI: endpoint: Clarify pci_epc_set_bar() usage
Date: Thu, 15 Jan 2026 17:49:28 +0900
Message-ID: <20260115084928.55701-6-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260115084928.55701-1-den@valinux.co.jp>
References: <20260115084928.55701-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0123.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::9) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
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
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYRP286MB4454:EE_
X-MS-Office365-Filtering-Correlation-Id: 38b9b6c1-575c-4b04-c20d-08de541310c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kWTl1aW+aGck157S0b+qF8BPCcvBglD9121zWvs+EA/NVUZ4uknSgEoOaiUZ?=
 =?us-ascii?Q?JUG+Xpj2ep6iWejuVBM/XV50VRab5DCTx+4WrsY4OMo8H+RBJy5NeIhFFYUV?=
 =?us-ascii?Q?hMl0sAXsI9RPDa5c22Ffq8Hm2tNX2pRGxKewnBsQkBYMIuf2CcnI9UA8WP9n?=
 =?us-ascii?Q?1/Cwou2S1wHeg77I1RNes+NdT/p6vcnu2zvegtkkbxdkNT+ZtiPtqKxD2xw9?=
 =?us-ascii?Q?pX15v0mvjNs9lcve/qv4yAm4FF4/+Tbio7jStnJK4VCs7o+pM7ScvDY4G43U?=
 =?us-ascii?Q?WflkxqwuuZiSCTQPRaR1B1ll9XF497zMziv+ZHkHdsajdkb7iJb74z89QqSn?=
 =?us-ascii?Q?gRdi6H4ZU/YAoZRKFTOH7hFgMhxEbTvnSOd6BBnBRJutBWX84bpkSpFCdIWn?=
 =?us-ascii?Q?eOd57gogNViZHQiA3VItdqYQU3FmEqf+8bouYNikNFxhSmhc/VgutIPfhNRI?=
 =?us-ascii?Q?9apm1Ca92KcivCPDwUd/04svXtQ6ONb3JO18kKDsGNKedUA5FKz3kfVJmTWR?=
 =?us-ascii?Q?XvbP064JfPOE3q33/0sVeh8Y+/VEu3OqW1Fr+H6Bs99X5wKFZArZsg2wsJOm?=
 =?us-ascii?Q?WZVrCkKTM0mT8AWhd25eDMD22D1Ld7VOyTc5PBwF/S+owqZqrVUcpcQs7PBQ?=
 =?us-ascii?Q?5iSHrQR+6Xx12imDgwGBHhAaAmLgSMexCdpKi08dSHAIjCu87YGyASJGbriw?=
 =?us-ascii?Q?HggOBU2SYcpeMmneY2gpgEo+svJxpjPn55l+26ok9dlyAHAUyDqk/VlLtlg0?=
 =?us-ascii?Q?Gv1Oj7W7tf1TGSL+Lpiq7fSoRrbFGMvgAGaAj+zNDhRFhQlNtDWWZj3UgW2d?=
 =?us-ascii?Q?DAvRnrFM1wGgiSrTHJd6JitcPD8Mbic1ppkgGKauVQpLi5ycRbLL/0m4GARl?=
 =?us-ascii?Q?fVzjPgf0zd6wUdFyQKgbg8oOftXKCwNqevc+afijKzFsBYoFHPRuhtV3JQtc?=
 =?us-ascii?Q?y9uQ7Dv6qv1OHUX9srmUtfSYt5vndqi4eGAZ6kRJpKbrGikSYd/EpnG3qYRu?=
 =?us-ascii?Q?21vLBZ089XQfZF0wrdlYXLSOEVH1Kb1Kxbz0tX7t/dZNhbNaV8X7iVEItYnB?=
 =?us-ascii?Q?MWio6NYxmA+f6ygTC4fKa0NaJvuoco+tfBKfhwkhETAQm2iEH+D0UOib9vaA?=
 =?us-ascii?Q?kLWofdfYonlXQEQyeeQ6piRWWMjR7JtxIclZnZ9V9UOcwo+YuvJFY8KZGTiQ?=
 =?us-ascii?Q?bG9SIOak8xrYYPY9KfK5wwbitnvNtrQiP6mjt2tHIJTldIUAoHw/jaotpN2u?=
 =?us-ascii?Q?gfOaLSf4TITfx9yJ5R++lsOu2OhMihHbGYfi7x5vhgTxNEmMryY831pvqsmm?=
 =?us-ascii?Q?avc/9LK36igx0vuq88ghNeqbahjBYF97WTrnQ+QwbX+jSJElXMmu2oz6kArx?=
 =?us-ascii?Q?SzvfuqBH9uOdImyRdVWxenlLr8HXvcQxGbqI/77YAjsKGBSUGmPp9C6NLRtx?=
 =?us-ascii?Q?nO3YwUXI8Fozf3dd2kFuXyod8Ggn4ht9Lo6IgO9MCTb4j5Bdj5F83wlswFve?=
 =?us-ascii?Q?5+e55lInIKiBtWby07yboTkZQ9Bzc6Gb5YC8pEBBPDmMcU1mpIMe9fLlamRS?=
 =?us-ascii?Q?CDwNYHbd3YFB3yNF7Xo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(7416014)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yPSmn6oARbe5rwiiFpg6Om1+g4jEKPmzzQBpNOmCwpI/4GL+BDsn7R8OgXCv?=
 =?us-ascii?Q?XnwbvrW/gQYAwHGx5Fdb477BhP9UI78mt03IS7+pBcApwUfINiEfGiococ5M?=
 =?us-ascii?Q?IPm15/eqnyAZwj3GFv0zX9k/WpI041IeoX06AW0Tv5te6RrvTEgkf2QxDb++?=
 =?us-ascii?Q?E4ITFDn+CQe29iy2kzIWav7zKdBZs9xVCFQsJL7w7upc0eYKR0FOedT8lEO9?=
 =?us-ascii?Q?lNsX2mF77kzeRos4j23bNJvCqGKUgOSCJj0LYjHv291sw46bNzys/CcRVVxd?=
 =?us-ascii?Q?SRHjjN5r8l/PL5M2r+KibGpfI/z2UIdtO4NuuxapE9WOxzD11BeNprThDfEi?=
 =?us-ascii?Q?u/t8zclB7x+jeWLca9YK/2K1XYMAZgyUOC40r1nMZ45mh0j1o7mxjhOs1moW?=
 =?us-ascii?Q?eynTwT8rEx4zIN0wH3Ncy+yTfePwOIQn6NfB/SSXEZA2QkRq7EyuShKS5fNo?=
 =?us-ascii?Q?D9NyflQgUHTIhg2W4TANWxvIYo3QHgK0jSeJh++O01epdn7fmregYSc1Ff/V?=
 =?us-ascii?Q?JpCcDOKbfqn77MVj7n/kDijGdnkLEmfxY6mu95Shh9XDbgTbA8gc3kSydAW0?=
 =?us-ascii?Q?ebilZVa2jn0eMS1mMmzDJR5RD9ZV8PragRZxnrz42JhPcevVFpdc1R3qLoYk?=
 =?us-ascii?Q?MGaZbRANt8lchqb/xzyGzIJzW8Vo8H0ixbAleIDYvgBezpJfB0V6XZkrvumL?=
 =?us-ascii?Q?XVvQfddW9pawkQq2RhKYprZheJ+Ex6yERI0lP1MGhwuSRvd6znS4EJ/TEMN2?=
 =?us-ascii?Q?9zlcgMW0PqlmLzSLn3bFiCQ3FgsxwlWD6N7FNl76lBFhRkVuUSLcqcy66Qk5?=
 =?us-ascii?Q?P+6fFVWf0P1nmt0O7dczarR/TTwptKX55wCHLUQwgX8msWSEJlikty6Blxzw?=
 =?us-ascii?Q?yK/BiM3ROLEBNLq2qM5/cVUJy3pfkGnE31vQwM1x6wSUNy67dJ5SVJWqVHmx?=
 =?us-ascii?Q?tCrYsQWCDjh7N93Xv5eKB2mpIorPtnDdTBcWhUFqwbwu1YnaKZHMIObiBTv2?=
 =?us-ascii?Q?SJRk824QS0+QTFrXelpH9GIBhT43cY7RpJBK+2lkBQkM3+oH7C7UVCN0c6cJ?=
 =?us-ascii?Q?cYiZeyyVPr9ZrNBZ+MDrhnBw0U3s9IokbeH8ACSunoMttjIA15eD+slvlt8+?=
 =?us-ascii?Q?Dkv7DymtZxV5wqrcvro40NY5cJwhbMlZm/aaskY8HeeuiP7p0y/nbSathoTl?=
 =?us-ascii?Q?l06W2tGn/igSIlGVo+5lPv+eqY44SyyXjF8cliGLigD/yBKQ7VzVCCNLk97w?=
 =?us-ascii?Q?N1QjcsOUSfIIO2EMVv5cNJSmOyufEoquUZ48D4hcA3rvIxRgzxyFWo1l3ots?=
 =?us-ascii?Q?sdC6za29/qgshQ4aoGJgtFXF/PIt/lpEpjJ7wUgbFFGsE2dtsT/wgc++mvcB?=
 =?us-ascii?Q?iCKbn2hWXh12SugEtG3Swt6ApYfmkCBtGpfWcD2IZLXWFbCXI9Rna58z65hN?=
 =?us-ascii?Q?0yZV3xjbQbG73AQW6N2IRVLk5YaWk5bg7/L2tHGGlwxGSu1AEYjm32KOlD83?=
 =?us-ascii?Q?ehN9Xmho5XkeRdbmoMMd4PeuEWhzBs257wpqeYyF2G1Fc2VgnFkW/mtMSV0J?=
 =?us-ascii?Q?GEvMn5kMNnapFXGEpX9i7o04h2Wrcx7KotkrXX9PEBeNNLx0HnWXW2OHgORQ?=
 =?us-ascii?Q?SqSoy6vW75XqCKuxv/wut/rwGCKC3vZdj6tAw4FSOD6Dmx6UXtNDjSQaZ+TB?=
 =?us-ascii?Q?hoJWEqNdY0En5cfsbwR62muef9bAjIhnPKQL3pMfVb2mbgRHxbyQuE7iLlsn?=
 =?us-ascii?Q?JfQfKrNYp+e5lfjEt8dkoaxu+WqFWU5ZiCnc4mgOQLWt0OByoQeD?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 38b9b6c1-575c-4b04-c20d-08de541310c6
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 08:49:59.6427
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /9mRkX/j9t2suCTLKglU5zb1OKdJZwPket13ny0NwBc9/BiZcEaI/oCIsgRIpHWXdRjlUxljM+o5CDIakeTqbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRP286MB4454
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The current documentation implies that pci_epc_set_bar() is only used
before the host enumerates the endpoint.

In practice, some Endpoint Controllers support calling pci_epc_set_bar()
multiple times for the same BAR (without clearing it) in order to update
inbound address translations after the host has programmed the BAR base
address, which some Endpoint Functions such as vNTB already rely on.
Add document text for that.

Also document the expected call flow for BAR subrange mapping
(pci_epf_bar.num_submap / pci_epf_bar.submap), which may require a
second pci_epc_set_bar() call after the host has programmed the BAR base
address.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
 Documentation/PCI/endpoint/pci-endpoint.rst | 24 +++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/PCI/endpoint/pci-endpoint.rst b/Documentation/PCI/endpoint/pci-endpoint.rst
index 0741c8cbd74e..4697377adeae 100644
--- a/Documentation/PCI/endpoint/pci-endpoint.rst
+++ b/Documentation/PCI/endpoint/pci-endpoint.rst
@@ -95,6 +95,30 @@ by the PCI endpoint function driver.
    Register space of the function driver is usually configured
    using this API.
 
+   Some endpoint controllers also support calling pci_epc_set_bar() again
+   for the same BAR (without calling pci_epc_clear_bar()) to update inbound
+   address translations after the host has programmed the BAR base address.
+   Endpoint function drivers can check this capability via the
+   dynamic_inbound_mapping EPC feature bit.
+
+   When pci_epf_bar.num_submap is non-zero, the endpoint function driver is
+   requesting BAR subrange mapping using pci_epf_bar.submap. This requires
+   the EPC to advertise support via the subrange_mapping EPC feature bit.
+
+   When an EPF driver wants to make use of the inbound subrange mapping
+   feature, it requires that the BAR base address has been programmed by
+   the host during enumeration. Thus, it needs to call pci_epc_set_bar()
+   twice for the same BAR (requires dynamic_inbound_mapping): first with
+   num_submap set to zero and configuring the BAR size, then after the PCIe
+   link is up and the host enumerates the endpoint and programs the BAR
+   base address, again with num_submap set to non-zero value.
+
+   Note that when making use of the inbound subrange mapping feature, the
+   EPF driver must not call pci_epc_clear_bar() between the two
+   pci_epc_set_bar() calls, because clearing the BAR can clear/disable the
+   BAR register or BAR decode on the endpoint while the host still expects
+   the assigned BAR address to remain valid.
+
 * pci_epc_clear_bar()
 
    The PCI endpoint function driver should use pci_epc_clear_bar() to reset
-- 
2.51.0


