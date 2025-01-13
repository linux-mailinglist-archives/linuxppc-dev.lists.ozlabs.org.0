Return-Path: <linuxppc-dev+bounces-5121-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 69667A0B155
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2025 09:40:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YWm0m1yXQz3c9g;
	Mon, 13 Jan 2025 19:40:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2612::611" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736757608;
	cv=pass; b=KOtI6FaPy6rSFYdNiV3lxP6PGp8+ioEM5Jkp+C53/QtY+niozR+3Ini2SAf/HI1pRlri8W+nxDfk0ZPOFjkjuKTmw7V4xRnIKJq6WmHUZSnh2kZY+hYX82TG6p7z2Q33g7s0r7UoBD3rRwUVanQD+7lQv4jvrbP/k6PwBkQLadfHdRgmYYRdOAsLyd57b2A2n6ZAoJohXFs6pykNFBkYgT8ND3yAZ18dLL4CBFTL9jjrVmLI4QH9lVvfk3gr3iGN/IwPnGG/QLXUt6yWhU5tkFdfn1dl3L+gG5wyP/T7B3Hs5asMMBZt0d/VuRaUqJObBry7jtxyDKOcEFG630FwlA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736757608; c=relaxed/relaxed;
	bh=v8eza7MfCEMehlY32Wncc9kkglIAzHQw3resHI3ILYg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Qa8zplRCI3WedT6DyBfgob0IunqyZ2kEHlD5UvkFx6/pIGWeNGSc+LrpbA5VnGX+xD2PkwDyUwMw4U6kH5WTtfBObNcweqmoQs+AdR3dsHuBUG8ahDj5hZRz0Gj6eNIwr++Y4eKDd/Gqc4R1Eiq8wVtB8TfW/ElfdzI9PDo5YgO/NThlOffg8oQvH0jtKkINR9JNkUsuHi3Nz5X71jw2qVPkYnj20v56RFv7wp37DJAIS3/8J7M6J2yluyDkoEwsDsO7QQgXGBHjxS6O8aHoQTAzqQROWsaT39omkzATweVVLgM6WPjRmAdQ1uL8fN2uWq4U0ffvrYs3liSgDWWR4w==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=hxcrWrIn; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2612::611; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=hxcrWrIn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2612::611; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on20611.outbound.protection.outlook.com [IPv6:2a01:111:f403:2612::611])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YWm0k5nhnz305C
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 19:40:06 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dGkMhpc5ufXC+YHbWkzEeKs5t7obN0bqUrZzl8R1U4PYEf0vc736Ju/dAyKHOmG2vWFJcNVy4wpdfl5zeWgM7NcmSgH0HsAW4NbWAe26f7AeQKuZHW6bZkSOh+525hYqhtdEnF0qLeNgNXMKHh5hWYxOZ/dPXjb9Y81mEXreKxpIxobU63rOJfjfQY4z6Om6i5nKjN4UlVtwI7T7H4o8VlgGcEo/sjwSKA7OHMkDRnWXNoY3488ymh3K3Af7H9zlJelwSUnfYuVyfJv7OfNDa+Ox+/3dhxggfaCYh8kFkoB0sTnV+1zHxFoNiw+C3IGjhlO+WrnSr7s6VHi32n5eIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v8eza7MfCEMehlY32Wncc9kkglIAzHQw3resHI3ILYg=;
 b=hwS+e4+J98tKUfuDcSZ88N/PnMKDIO4r6lZV4ASC8Cv7BA10iNAPAk63aNN9Di6wMKw6zAxZUW33ereb769cz/0MJCpYh4VGMTfi/mYSinaNPCgMC8toobDkRuKtUmX4HX3cnZnpSUaMuG/aq26cBIgfZJqJLNaJ9Ga+lP5QKNBw5CMazh4rfpLeB9e6zqpJhj5Q5iojQRW2b0mQ/yzVvzHBq+dbsrGixkkC7dcoKToi1HDNnfdrtaoXJwyIbx8iLcQMLKC1gLVftIMuecEiPUCuk8rnhmlNRzInncG+W9HGbon4LtXjd3PJjvl1P1Yxkd+WbRJOyyxCNJpkDGpXXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v8eza7MfCEMehlY32Wncc9kkglIAzHQw3resHI3ILYg=;
 b=hxcrWrInec0j2on7v3plGORXVBo9bCPrSSG1LcrZM0BIyc1XiDbSOBHjzDBsJode0hQIXihKkoLxBGy3dwFAen7y9tRjaEJ3FkWy4IDOtCtQQ6sGZAumRa88KdHs3j+kLCnMpYO9EkEiIvvNkfh5TMVzpC7eEKd+26Wv9Fe4082mlXHlxmyS2h2oawuNEybKuPnYMZEGmx/k3nhyqC9ngtM3Dxfg8DoKss5NcN3NmHLMuY8ru4y7+LEue59bOByzDAxGoiLYRI/RToVxXdI4FceBzLeWYeaUWcFj0/L+C8lOdfhpdydA+yS3w5+UtseEzAvoHnD3r0+cxGsNEhe8ig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by VI1PR04MB9882.eurprd04.prod.outlook.com (2603:10a6:800:1da::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 08:39:47 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%6]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 08:39:47 +0000
From: Wei Fang <wei.fang@nxp.com>
To: claudiu.manoil@nxp.com,
	vladimir.oltean@nxp.com,
	xiaoning.wang@nxp.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	christophe.leroy@csgroup.eu
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev
Subject: [PATCH v2 net-next 01/13] net: enetc: add initial netc-lib driver to support NTMP
Date: Mon, 13 Jan 2025 16:22:33 +0800
Message-Id: <20250113082245.2332775-2-wei.fang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250113082245.2332775-1-wei.fang@nxp.com>
References: <20250113082245.2332775-1-wei.fang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0046.apcprd02.prod.outlook.com
 (2603:1096:4:196::15) To PAXPR04MB8510.eurprd04.prod.outlook.com
 (2603:10a6:102:211::7)
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
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8510:EE_|VI1PR04MB9882:EE_
X-MS-Office365-Filtering-Correlation-Id: fcffe08c-9919-40d5-deab-08dd33add61b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fVdAs55i9xsW9gGAe6cWkZMfZSTx+d8hlpVkKVGQsYj+lkUHZf42p6XeIw15?=
 =?us-ascii?Q?qY+8VrR/0LXxoDMD7qUsUOMCWeAnGtdg3jzInJvTPEXd3QAKynLrg2c21a7c?=
 =?us-ascii?Q?Ji80/kzxbHa9sFbnzjDDA8N09ifIadgr6wqaE7uyf7yOkMVmzDKlf7JqhdyI?=
 =?us-ascii?Q?LeAnKR4VwsuQ9WNRTfeaUDUr95gVOHSB2hhgiPKLALP44Ly2NNfHeLCp0ioq?=
 =?us-ascii?Q?ykaMJPXNV4ZF4wN5ru0y5gqLCd50Kfc4Os2fctqj5EfAfhGSIrtbMuwAH6tW?=
 =?us-ascii?Q?XjfYBsBa6jA4ZwzyY64VkK2e3gW+48Rf8n1DNWC8w4yiuED3ELVknl9I+PMM?=
 =?us-ascii?Q?tYtpQzP2JFKeXtw8SZrq69IaZMlcIZHrn2uqSghEx/Sqp/yMS3AbzbhXJ6AK?=
 =?us-ascii?Q?GxRlsY8gvtnC32yLLDhmDH5O5dkxCOhGe8cScNHIYf7inF8pqnYQZ42mXPQz?=
 =?us-ascii?Q?s6DZuJVciPmx7TURwU5FbUu4lq9e6Q3epvxZwIYUjQyG3UInsPACqGuJhEaA?=
 =?us-ascii?Q?JEl1jy2utOzVImk1AzrMIni8pxXvNfyIHO07A92A2Bu9HFcyFDyzQPNJ+k2m?=
 =?us-ascii?Q?6p/KHYIkcwDFfAkFXnmyEzH+fqVaKCVmB13lA6oW2KsbT2kYAJZs8KnxNt79?=
 =?us-ascii?Q?d9GpVjdf4n+E6jQcTQn0KQBp5FDHSkhfnWsR1uGIblwTDHsTa5Xd2CeVDOrK?=
 =?us-ascii?Q?NBs3cVNVF/R4ghkCPRgeeZeqKlEvBxxToXXt0F4c/a+dP+ivnlYhawnc34ce?=
 =?us-ascii?Q?CtP/YAQzjx2Fmwj7e7K8K3wJ3gTTY3d2Y4QKXdu4jlx0hz2bbBlMwp8I4pMw?=
 =?us-ascii?Q?rGi9NCRvMYKiwZX2NSWL+0t2S9LJaRHzSj3cU1c5TIFlSPTOBOFSRJtEn6HW?=
 =?us-ascii?Q?5jS395fnoFV4m7UV1u302Lsy9OK2c6kYjKSsMZGRf6CaU5Cexy/LZ5StWQTq?=
 =?us-ascii?Q?riz+TPH00JkvPj+47kWU6lokNsmjTFBa4miDKXqL4ZfJ1eitBvatWZAQM03c?=
 =?us-ascii?Q?wJlkK4r8j14IZ8JrWC1Zmm2wZ0Zu66S8TTEzYLyd1sAWgmcVL+p+GSziZ7h3?=
 =?us-ascii?Q?Lti8y24vG0hemORjIQvUHZ3GZym2c0JsbQxscSNk0eHXsYsdR/vuKlCKEdRQ?=
 =?us-ascii?Q?wGxtQv9kRSe3bKDY6FQq9AeToHfdCDB9oPpqpT3/h1sDCONBVb6EAlpYiulN?=
 =?us-ascii?Q?CCvkaHIEOsHo6sSvom3uKZ3aaw2NRiRkiL6Smhr5T0Y19l/kqkWZCb7ajtSS?=
 =?us-ascii?Q?PC4LR3+/Ih5l550oU1M+O3BqqfR2tiMZOAj+2qLxQ9byr4cjBh5j6r29uweU?=
 =?us-ascii?Q?jYhZphVh7KGbo/a8TDnRxe7/cegMvExfZRybhFKLPRCNWpq5rEUhuwbuP0jS?=
 =?us-ascii?Q?lHNNBvqN8n6LacWyTHj+Rqwvlr0KbkYeayumjkxWRbx4imMuGQt7Myjrz+rh?=
 =?us-ascii?Q?YtrHtzk8+ijNQjJ75t2wQC/PWC0goUYr?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TtM5NWr5mO1p/N0yB5E/wSysmC3K/J7/KyC4g6EmyXlahqwBHunquXVOSyru?=
 =?us-ascii?Q?rN5jFSBCxEnEGZxnVocUi2BWRkG7U3f+Owe5gSmLqVM4bHxPsl48fK2kqO0I?=
 =?us-ascii?Q?s7W3jtQqqHDXTpjHcP7kW7/vSybj9FoGuKzX3CV3ejoohp4e4uf/QEdTR2fj?=
 =?us-ascii?Q?xTFM7Wi/0bP4kFmw6lZpNd7/16gosPvHH30OeSPwFc7O3SfMdneD2V5LazQA?=
 =?us-ascii?Q?KUN6/jF1srT6cwOmNqfxkzlJ1wqDmhsckAbGSGUnd8bx7xfYDW7Srrwau9fm?=
 =?us-ascii?Q?AZi7ZopjfAioP9MHXjk10Aqo4KHfsAyBDZ90knAebyceEMXsQmV0KnjYalSl?=
 =?us-ascii?Q?nSCtkS8UETTLxCVHzxF3ajigBhrVTE7/zirJXXdTXjR6JdvEoWy4Ud5KZ38B?=
 =?us-ascii?Q?NOwpOk7IrAFD4fyO7Sz9NCzYpAidZuMCV4QLMm4sCZOXghRcfGHYRa+sirpa?=
 =?us-ascii?Q?kqjQ0ZH6QNfu7BXCptN9RV7czJojv/c4SOOCgidJPL6jpoMm0AzUaJXDEp3V?=
 =?us-ascii?Q?N015gQbx1XgOJRSkQVxlTWXXQ4RgzbTvQFHAmPFoA8aayDi+6F8N7xhcwpuk?=
 =?us-ascii?Q?aEGx20pbaHMHSxcbp6F/x8rR4jKlieoQemf78CT4pp58HiM3K89IdmLHlEIW?=
 =?us-ascii?Q?mW6NSaCpPLV9Z8aJzSbUXmb79I2G9dJQzoorS2LDh7M8bYhT0I7BwKBQh6Oz?=
 =?us-ascii?Q?E7nm9cB123mlXFovIxY1g3X3gcHNsC16VU25e23ouU8pssORdDmw/trNFhX5?=
 =?us-ascii?Q?TMIqiQJ6PGL4kx4UsUAusiA5WCICg72x6iDTaSxENcPdjhO9rVHGxCLPYreo?=
 =?us-ascii?Q?dzTLRGEwh61PpuxWCrxMeDgbXkPFLf9QQxnZ7U8AXs/2n5QijCrAZF0hZcH8?=
 =?us-ascii?Q?kW74HeWZhv8ErNn1Rco6aic+BbQFxK6S9iCOMZxj2d/UU4uhVNFWrm2Al2EH?=
 =?us-ascii?Q?l8sWEPQ5DBwccPcXsqEtfuW2L5fjhZ3XGl6EX1NSIShx6qbQGTqksTR1dOs5?=
 =?us-ascii?Q?8vC5eUzowA9dBm/HCI9hYGZ9ztZZVBh0JGBK56C0VC9CAcSIfO2CDG5geJiX?=
 =?us-ascii?Q?aLO3vVNYaaVtKWtV08Fq149xRCtBOyyxi917Omsv0tbYonkWsQt9bdCxT2bM?=
 =?us-ascii?Q?JAkxlMnA2Xbr7IJvEB6NnQj422QxwXNGAi2OeOsNPqr7kK+o6z1x2lChzwNw?=
 =?us-ascii?Q?TAeHokMenR87+4l0GSHZjAcDy+AxadiVXS3Ko8uUBDpAz5nn+mWjEuwuCUs6?=
 =?us-ascii?Q?+ZQOjoqMMfriVhP623TZ58MELxbhcRbgjyGC99KwdnfyWtHWXyFNTjZOPjv9?=
 =?us-ascii?Q?nq7AboUwvuo0bKm/VKgTvuT3+73fMeGNQZHRmFJibyEl9xa3u933m0hRzif+?=
 =?us-ascii?Q?WEUatTfL1Yjq+S17cRQt4F5X/3euFOS1673X0XCqg0Gt4GDcRGYtKpxax1B1?=
 =?us-ascii?Q?N+2/Q1nZ5rFLNcgRdM2KijN0NsXG3fJKqZkreGKKV0POYutiuHCRN+r32ji+?=
 =?us-ascii?Q?jtIjkSjza8Jxu9JclG/NNwFqAceTNfGREncaOXugFp05GApfPUfK66TJR2P1?=
 =?us-ascii?Q?odcV5cfF2wTPFe8SHOuATKQn6Z6pNOOgEP7mc/Wy?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcffe08c-9919-40d5-deab-08dd33add61b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 08:39:47.6080
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m8Mzq+V+ZT2cnmJw/0+WcPps8xUy1NlyLBgdPtda2kCTD6BX5maPYTXwpO9gquE78v00/Rlz4hWpmRBsrQFx6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9882
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Some NETC functionality is controlled using control messages sent to the
hardware using BD ring interface with 32B descriptor similar to transmit
BD ring used on ENETC. This BD ring interface is referred to as command
BD ring. It is used to configure functionality where the underlying
resources may be shared between different entities or being too large to
configure using direct registers. Therefore, a messaging protocol called
NETC Table Management Protocol (NTMP) is provided for exchanging
configuration and management information between the software and the
hardware using the command BD ring interface.

For i.MX95, NTMP has been upgraded to version 2.0, which is incompatible
with LS1028A, because the message formats have been changed. Therefore,
add the netc-lib driver to support NTMP 2.0 to operate various tables.
Note that, only MAC address filter table and RSS table are supported at
the moment. More tables will be supported in subsequent patches.

It is worth mentioning that the purpose of the netc-lib driver is to
provide some NTMP-based generic interfaces for ENETC and NETC Switch
drivers. Currently, it only supports the configurations of some tables.
Interfaces such as tc flower and debugfs will be added in the future.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
v2 changes:
Change NTMP_FILL_CRD() and NTMP_FILL_CRD_EID to functions.
---
 drivers/net/ethernet/freescale/enetc/Kconfig  |  11 +
 drivers/net/ethernet/freescale/enetc/Makefile |   3 +
 drivers/net/ethernet/freescale/enetc/ntmp.c   | 468 ++++++++++++++++++
 .../ethernet/freescale/enetc/ntmp_formats.h   |  59 +++
 include/linux/fsl/ntmp.h                      | 178 +++++++
 5 files changed, 719 insertions(+)
 create mode 100644 drivers/net/ethernet/freescale/enetc/ntmp.c
 create mode 100644 drivers/net/ethernet/freescale/enetc/ntmp_formats.h
 create mode 100644 include/linux/fsl/ntmp.h

diff --git a/drivers/net/ethernet/freescale/enetc/Kconfig b/drivers/net/ethernet/freescale/enetc/Kconfig
index 6c2779047dcd..94db8e8d0eb3 100644
--- a/drivers/net/ethernet/freescale/enetc/Kconfig
+++ b/drivers/net/ethernet/freescale/enetc/Kconfig
@@ -15,6 +15,16 @@ config NXP_ENETC_PF_COMMON
 
 	  If compiled as module (M), the module name is nxp-enetc-pf-common.
 
+config NXP_NETC_LIB
+	tristate "NETC Library"
+	help
+	  This module provides common functionalities for both ENETC and NETC
+	  Switch, such as NETC Table Management Protocol (NTMP) 2.0, common tc
+	  flower and debugfs interfaces and so on.
+
+	  If compiled as module (M), the module name is nxp-netc-lib.
+
+
 config FSL_ENETC
 	tristate "ENETC PF driver"
 	depends on PCI_MSI
@@ -40,6 +50,7 @@ config NXP_ENETC4
 	select FSL_ENETC_CORE
 	select FSL_ENETC_MDIO
 	select NXP_ENETC_PF_COMMON
+	select NXP_NETC_LIB
 	select PHYLINK
 	select DIMLIB
 	help
diff --git a/drivers/net/ethernet/freescale/enetc/Makefile b/drivers/net/ethernet/freescale/enetc/Makefile
index 6fd27ee4fcd1..707a68e26971 100644
--- a/drivers/net/ethernet/freescale/enetc/Makefile
+++ b/drivers/net/ethernet/freescale/enetc/Makefile
@@ -6,6 +6,9 @@ fsl-enetc-core-y := enetc.o enetc_cbdr.o enetc_ethtool.o
 obj-$(CONFIG_NXP_ENETC_PF_COMMON) += nxp-enetc-pf-common.o
 nxp-enetc-pf-common-y := enetc_pf_common.o
 
+obj-$(CONFIG_NXP_NETC_LIB) += nxp-netc-lib.o
+nxp-netc-lib-y := ntmp.o
+
 obj-$(CONFIG_FSL_ENETC) += fsl-enetc.o
 fsl-enetc-y := enetc_pf.o
 fsl-enetc-$(CONFIG_PCI_IOV) += enetc_msg.o
diff --git a/drivers/net/ethernet/freescale/enetc/ntmp.c b/drivers/net/ethernet/freescale/enetc/ntmp.c
new file mode 100644
index 000000000000..ba8a2ac9d4b4
--- /dev/null
+++ b/drivers/net/ethernet/freescale/enetc/ntmp.c
@@ -0,0 +1,468 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * NETC NTMP (NETC Table Management Protocol) 2.0 Library
+ * Copyright 2025 NXP
+ */
+
+#include <linux/dma-mapping.h>
+#include <linux/fsl/netc_global.h>
+#include <linux/iopoll.h>
+
+#include "ntmp_formats.h"
+
+#define NETC_CBDR_TIMEOUT		1000 /* us */
+#define NETC_CBDR_MR_EN			BIT(31)
+
+#define NTMP_BASE_ADDR_ALIGN		128
+#define NTMP_DATA_ADDR_ALIGN		32
+
+/* Define NTMP Table ID */
+#define NTMP_MAFT_ID			1
+#define NTMP_RSST_ID			3
+
+/* Generic Update Actions for most tables */
+#define NTMP_GEN_UA_CFGEU		BIT(0)
+#define NTMP_GEN_UA_STSEU		BIT(1)
+
+#define NTMP_ENTRY_ID_SIZE		4
+#define RSST_ENTRY_NUM			64
+#define RSST_STSE_DATA_SIZE(n)		((n) * 8)
+#define RSST_CFGE_DATA_SIZE(n)		(n)
+
+int netc_setup_cbdr(struct device *dev, int cbd_num,
+		    struct netc_cbdr_regs *regs,
+		    struct netc_cbdr *cbdr)
+{
+	int size;
+
+	size = cbd_num * sizeof(union netc_cbd) + NTMP_BASE_ADDR_ALIGN;
+
+	cbdr->addr_base = dma_alloc_coherent(dev, size, &cbdr->dma_base,
+					     GFP_KERNEL);
+	if (!cbdr->addr_base)
+		return -ENOMEM;
+
+	cbdr->dma_size = size;
+	cbdr->bd_num = cbd_num;
+	cbdr->regs = *regs;
+
+	/* The base address of the Control BD Ring must be 128 bytes aligned */
+	cbdr->dma_base_align =  ALIGN(cbdr->dma_base,  NTMP_BASE_ADDR_ALIGN);
+	cbdr->addr_base_align = PTR_ALIGN(cbdr->addr_base,
+					  NTMP_BASE_ADDR_ALIGN);
+
+	cbdr->next_to_clean = 0;
+	cbdr->next_to_use = 0;
+	spin_lock_init(&cbdr->ring_lock);
+
+	/* Step 1: Configure the base address of the Control BD Ring */
+	netc_write(cbdr->regs.bar0, lower_32_bits(cbdr->dma_base_align));
+	netc_write(cbdr->regs.bar1, upper_32_bits(cbdr->dma_base_align));
+
+	/* Step 2: Configure the producer index register */
+	netc_write(cbdr->regs.pir, cbdr->next_to_clean);
+
+	/* Step 3: Configure the consumer index register */
+	netc_write(cbdr->regs.cir, cbdr->next_to_use);
+
+	/* Step4: Configure the number of BDs of the Control BD Ring */
+	netc_write(cbdr->regs.lenr, cbdr->bd_num);
+
+	/* Step 5: Enable the Control BD Ring */
+	netc_write(cbdr->regs.mr, NETC_CBDR_MR_EN);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(netc_setup_cbdr);
+
+void netc_teardown_cbdr(struct device *dev, struct netc_cbdr *cbdr)
+{
+	/* Disable the Control BD Ring */
+	netc_write(cbdr->regs.mr, 0);
+	dma_free_coherent(dev, cbdr->dma_size, cbdr->addr_base,
+			  cbdr->dma_base);
+	memset(cbdr, 0, sizeof(*cbdr));
+}
+EXPORT_SYMBOL_GPL(netc_teardown_cbdr);
+
+static int netc_get_free_cbd_num(struct netc_cbdr *cbdr)
+{
+	return (cbdr->next_to_clean - cbdr->next_to_use - 1 +
+		cbdr->bd_num) % cbdr->bd_num;
+}
+
+static union netc_cbd *netc_get_cbd(struct netc_cbdr *cbdr, int index)
+{
+	return &((union netc_cbd *)(cbdr->addr_base_align))[index];
+}
+
+static void netc_clean_cbdr(struct netc_cbdr *cbdr)
+{
+	union netc_cbd *cbd;
+	int i;
+
+	i = cbdr->next_to_clean;
+	while (netc_read(cbdr->regs.cir) != i) {
+		cbd = netc_get_cbd(cbdr, i);
+		memset(cbd, 0, sizeof(*cbd));
+		i = (i + 1) % cbdr->bd_num;
+	}
+
+	cbdr->next_to_clean = i;
+}
+
+static struct netc_cbdr *netc_select_cbdr(struct netc_cbdrs *cbdrs)
+{
+	int i;
+
+	for (i = 0; i < cbdrs->cbdr_num; i++) {
+		if (spin_is_locked(&cbdrs->ring[i].ring_lock))
+			continue;
+
+		return &cbdrs->ring[i];
+	}
+
+	return &cbdrs->ring[smp_processor_id() % cbdrs->cbdr_num];
+}
+
+static int netc_xmit_ntmp_cmd(struct netc_cbdrs *cbdrs, union netc_cbd *cbd)
+{
+	union netc_cbd *cur_cbd;
+	struct netc_cbdr *cbdr;
+	int i, err;
+	u16 status;
+	u32 val;
+
+	if (cbdrs->cbdr_num == 1)
+		cbdr = &cbdrs->ring[0];
+	else
+		cbdr = netc_select_cbdr(cbdrs);
+
+	spin_lock_bh(&cbdr->ring_lock);
+
+	if (unlikely(!netc_get_free_cbd_num(cbdr)))
+		netc_clean_cbdr(cbdr);
+
+	i = cbdr->next_to_use;
+	cur_cbd = netc_get_cbd(cbdr, i);
+	*cur_cbd = *cbd;
+
+	/* Update producer index of both software and hardware */
+	i = (i + 1) % cbdr->bd_num;
+	cbdr->next_to_use = i;
+	dma_wmb();
+	netc_write(cbdr->regs.pir, i);
+
+	err = read_poll_timeout_atomic(netc_read, val, val == i,
+				       10, NETC_CBDR_TIMEOUT, true,
+				       cbdr->regs.cir);
+	if (unlikely(err))
+		goto cbdr_unlock;
+
+	dma_rmb();
+	/* Get the writeback command BD, because the caller may need
+	 * to check some other fields of the response header.
+	 */
+	*cbd = *cur_cbd;
+
+	/* Check the writeback error status */
+	status = le16_to_cpu(cbd->resp_hdr.error_rr) & NTMP_RESP_ERROR;
+	if (unlikely(status)) {
+		err = -EIO;
+		dev_err(cbdrs->dma_dev, "Command BD error: 0x%04x\n", status);
+	}
+
+	netc_clean_cbdr(cbdr);
+	dma_wmb();
+
+cbdr_unlock:
+	spin_unlock_bh(&cbdr->ring_lock);
+
+	return err;
+}
+
+static void *ntmp_alloc_data_mem(struct device *dev, int size,
+				 dma_addr_t *dma, void **data_align)
+{
+	void *data;
+
+	data = dma_alloc_coherent(dev, size + NTMP_DATA_ADDR_ALIGN,
+				  dma, GFP_ATOMIC);
+	if (!data)
+		return NULL;
+
+	*data_align = PTR_ALIGN(data, NTMP_DATA_ADDR_ALIGN);
+
+	return data;
+}
+
+static void ntmp_free_data_mem(struct device *dev, int size,
+			       void *data, dma_addr_t dma)
+{
+	dma_free_coherent(dev, size + NTMP_DATA_ADDR_ALIGN, data, dma);
+}
+
+static void ntmp_fill_request_headr(union netc_cbd *cbd, dma_addr_t dma,
+				    int len, int table_id, int cmd,
+				    int access_method)
+{
+	dma_addr_t dma_align;
+
+	memset(cbd, 0, sizeof(*cbd));
+	dma_align = ALIGN(dma, NTMP_DATA_ADDR_ALIGN);
+	cbd->req_hdr.addr = cpu_to_le64(dma_align);
+	cbd->req_hdr.len = cpu_to_le32(len);
+	cbd->req_hdr.cmd = cmd;
+	cbd->req_hdr.access_method = FIELD_PREP(NTMP_ACCESS_METHOD,
+						access_method);
+	cbd->req_hdr.table_id = table_id;
+	cbd->req_hdr.ver_cci_rr = FIELD_PREP(NTMP_HDR_VERSION,
+					     NTMP_HDR_VER2);
+	/* For NTMP version 2.0 or later version */
+	cbd->req_hdr.npf = cpu_to_le32(NTMP_NPF);
+}
+
+static void ntmp_fill_crd(struct common_req_data *crd,
+			  u8 tblv, u8 qa, u16 ua)
+{
+	crd->update_act = cpu_to_le16(ua);
+	crd->tblv_qact = NTMP_TBLV_QACT(tblv, qa);
+}
+
+static void ntmp_fill_crd_eid(struct ntmp_req_by_eid *rbe, u8 tblv,
+			      u8 qa, u16 ua, u32 entry_id)
+{
+	ntmp_fill_crd(&rbe->crd, tblv, qa, ua);
+	rbe->entry_id = cpu_to_le32(entry_id);
+}
+
+static int ntmp_delete_entry_by_id(struct netc_cbdrs *cbdrs, int tbl_id,
+				   u8 tbl_ver, u32 entry_id, u32 req_len,
+				   u32 resp_len)
+{
+	struct device *dev = cbdrs->dma_dev;
+	struct ntmp_req_by_eid *req;
+	union netc_cbd cbd;
+	u32 len, dma_len;
+	dma_addr_t dma;
+	void *tmp;
+	int err;
+
+	if (entry_id == NTMP_NULL_ENTRY_ID)
+		return 0;
+
+	/* If the req_len is 0, indicates the requested length is the
+	 * standard length.
+	 */
+	if (!req_len)
+		req_len = sizeof(*req);
+
+	dma_len = req_len >= resp_len ? req_len : resp_len;
+	tmp = ntmp_alloc_data_mem(dev, dma_len, &dma, (void **)&req);
+	if (!tmp)
+		return -ENOMEM;
+
+	ntmp_fill_crd_eid(req, tbl_ver, 0, 0, entry_id);
+	len = NTMP_LEN(req_len, resp_len);
+	ntmp_fill_request_headr(&cbd, dma, len, tbl_id,
+				NTMP_CMD_DELETE, NTMP_AM_ENTRY_ID);
+
+	err = netc_xmit_ntmp_cmd(cbdrs, &cbd);
+	if (err)
+		dev_err(dev, "Delete table (id: %d) entry failed: %d!",
+			tbl_id, err);
+
+	ntmp_free_data_mem(dev, dma_len, tmp, dma);
+
+	return err;
+}
+
+static int ntmp_query_entry_by_id(struct netc_cbdrs *cbdrs, int tbl_id,
+				  u32 len, struct ntmp_req_by_eid *req,
+				  dma_addr_t *dma, bool compare_eid)
+{
+	struct device *dev = cbdrs->dma_dev;
+	struct common_resp_query *resp;
+	int cmd = NTMP_CMD_QUERY;
+	union netc_cbd cbd;
+	u32 entry_id;
+	int err;
+
+	entry_id = le32_to_cpu(req->entry_id);
+	if (le16_to_cpu(req->crd.update_act))
+		cmd = NTMP_CMD_QU;
+
+	/* Request header */
+	ntmp_fill_request_headr(&cbd, *dma, len, tbl_id,
+				cmd, NTMP_AM_ENTRY_ID);
+
+	err = netc_xmit_ntmp_cmd(cbdrs, &cbd);
+	if (err) {
+		dev_err(dev, "Query table (id: %d) entry failed: %d\n",
+			tbl_id, err);
+		return err;
+	}
+
+	/* For a few tables, the first field of its response data is not
+	 * entry_id, so directly return success.
+	 */
+	if (!compare_eid)
+		return 0;
+
+	resp = (struct common_resp_query *)req;
+	if (unlikely(le32_to_cpu(resp->entry_id) != entry_id)) {
+		dev_err(dev, "Table (id: %d) query EID:0x%0x, response EID:0x%x\n",
+			tbl_id, entry_id, le32_to_cpu(resp->entry_id));
+		return -EIO;
+	}
+
+	return 0;
+}
+
+int ntmp_maft_add_entry(struct netc_cbdrs *cbdrs, u32 entry_id,
+			struct maft_entry_data *data)
+{
+	struct device *dev = cbdrs->dma_dev;
+	struct maft_req_add *req;
+	union netc_cbd cbd;
+	dma_addr_t dma;
+	u32 req_len;
+	void *tmp;
+	int err;
+
+	req_len = sizeof(*req);
+	tmp = ntmp_alloc_data_mem(dev, req_len, &dma, (void **)&req);
+	if (!tmp)
+		return -ENOMEM;
+
+	/* Set mac address filter table request data buffer */
+	ntmp_fill_crd_eid(&req->rbe, cbdrs->tbl.maft_ver, 0, 0, entry_id);
+	req->keye = data->keye;
+	req->cfge = data->cfge;
+
+	ntmp_fill_request_headr(&cbd, dma, NTMP_LEN(req_len, 0),
+				NTMP_MAFT_ID, NTMP_CMD_ADD,
+				NTMP_AM_ENTRY_ID);
+	err = netc_xmit_ntmp_cmd(cbdrs, &cbd);
+	if (err)
+		dev_err(dev, "Add MAFT entry failed (%d)!", err);
+
+	ntmp_free_data_mem(dev, req_len, tmp, dma);
+
+	return err;
+}
+EXPORT_SYMBOL_GPL(ntmp_maft_add_entry);
+
+int ntmp_maft_query_entry(struct netc_cbdrs *cbdrs, u32 entry_id,
+			  struct maft_entry_data *data)
+{
+	struct device *dev = cbdrs->dma_dev;
+	struct maft_resp_query *resp;
+	u32 resp_len = sizeof(*resp);
+	struct ntmp_req_by_eid *req;
+	u32 req_len = sizeof(*req);
+	void *tmp = NULL;
+	dma_addr_t dma;
+	int err;
+
+	if (entry_id == NTMP_NULL_ENTRY_ID)
+		return -EINVAL;
+
+	tmp = ntmp_alloc_data_mem(dev, resp_len, &dma, (void **)&req);
+	if (!tmp)
+		return -ENOMEM;
+
+	ntmp_fill_crd_eid(req, cbdrs->tbl.maft_ver, 0, 0, entry_id);
+	err = ntmp_query_entry_by_id(cbdrs, NTMP_MAFT_ID,
+				     NTMP_LEN(req_len, resp_len),
+				     req, &dma, true);
+	if (err)
+		goto end;
+
+	resp = (struct maft_resp_query *)req;
+	data->keye = resp->keye;
+	data->cfge = resp->cfge;
+
+end:
+	ntmp_free_data_mem(dev, resp_len, tmp, dma);
+
+	return err;
+}
+EXPORT_SYMBOL_GPL(ntmp_maft_query_entry);
+
+int ntmp_maft_delete_entry(struct netc_cbdrs *cbdrs, u32 entry_id)
+{
+	return ntmp_delete_entry_by_id(cbdrs, NTMP_MAFT_ID,
+				       cbdrs->tbl.maft_ver,
+				       entry_id, 0, 0);
+}
+EXPORT_SYMBOL_GPL(ntmp_maft_delete_entry);
+
+int ntmp_rsst_query_or_update_entry(struct netc_cbdrs *cbdrs, u32 *table,
+				    int count, bool query)
+{
+	struct device *dev = cbdrs->dma_dev;
+	struct rsst_req_update *requ;
+	struct ntmp_req_by_eid *req;
+	union netc_cbd cbd;
+	u32 len, data_size;
+	dma_addr_t dma;
+	int err, i;
+	void *tmp;
+
+	if (count != RSST_ENTRY_NUM)
+		/* HW only takes in a full 64 entry table */
+		return -EINVAL;
+
+	if (query)
+		data_size = NTMP_ENTRY_ID_SIZE + RSST_STSE_DATA_SIZE(count) +
+			    RSST_CFGE_DATA_SIZE(count);
+	else
+		data_size = struct_size(requ, groups, count);
+
+	tmp = ntmp_alloc_data_mem(dev, data_size, &dma, (void **)&req);
+	if (!tmp)
+		return -ENOMEM;
+
+	/* Set the request data buffer */
+	if (query) {
+		ntmp_fill_crd_eid(req, cbdrs->tbl.rsst_ver, 0, 0, 0);
+		len = NTMP_LEN(sizeof(*req), data_size);
+		ntmp_fill_request_headr(&cbd, dma, len, NTMP_RSST_ID,
+					NTMP_CMD_QUERY, NTMP_AM_ENTRY_ID);
+	} else {
+		requ = (struct rsst_req_update *)req;
+		ntmp_fill_crd_eid(&requ->rbe, cbdrs->tbl.rsst_ver, 0,
+				  NTMP_GEN_UA_CFGEU | NTMP_GEN_UA_STSEU, 0);
+		for (i = 0; i < count; i++)
+			requ->groups[i] = (u8)(table[i]);
+
+		len = NTMP_LEN(data_size, 0);
+		ntmp_fill_request_headr(&cbd, dma, len, NTMP_RSST_ID,
+					NTMP_CMD_UPDATE, NTMP_AM_ENTRY_ID);
+	}
+
+	err = netc_xmit_ntmp_cmd(cbdrs, &cbd);
+	if (err) {
+		dev_err(dev, "%s RSS table entry failed (%d)!",
+			query ? "Query" : "Update", err);
+		goto end;
+	}
+
+	if (query) {
+		u8 *group = (u8 *)req;
+
+		group += NTMP_ENTRY_ID_SIZE + RSST_STSE_DATA_SIZE(count);
+		for (i = 0; i < count; i++)
+			table[i] = group[i];
+	}
+
+end:
+	ntmp_free_data_mem(dev, data_size, tmp, dma);
+
+	return err;
+}
+EXPORT_SYMBOL_GPL(ntmp_rsst_query_or_update_entry);
+
+MODULE_DESCRIPTION("NXP NETC Library");
+MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/net/ethernet/freescale/enetc/ntmp_formats.h b/drivers/net/ethernet/freescale/enetc/ntmp_formats.h
new file mode 100644
index 000000000000..3e581901f139
--- /dev/null
+++ b/drivers/net/ethernet/freescale/enetc/ntmp_formats.h
@@ -0,0 +1,59 @@
+/* SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause) */
+/*
+ * NTMP table request and response data buffer formats
+ * Copyright 2025 NXP
+ */
+
+#ifndef __NTMP_FORMATS_H
+#define __NTMP_FORMATS_H
+#include <linux/fsl/ntmp.h>
+
+#pragma pack(1)
+
+struct common_req_data {
+	__le16 update_act;
+	u8 dbg_opt;
+	u8 tblv_qact;
+#define NTMP_QUERY_ACT		GENMASK(3, 0)
+#define NTMP_TBL_VER		GENMASK(7, 0)
+#define NTMP_TBLV_QACT(v, a)	(FIELD_PREP(NTMP_TBL_VER, (v)) | \
+				 ((a) & NTMP_QUERY_ACT))
+};
+
+struct common_resp_query {
+	__le32 entry_id;
+};
+
+struct common_resp_nq {
+	__le32 status;
+};
+
+/* Generic structure for request data by entry ID  */
+struct ntmp_req_by_eid {
+	struct common_req_data crd;
+	__le32 entry_id;
+};
+
+/* MAC Address Filter Table Request Data Buffer Format of Add action */
+struct maft_req_add {
+	struct ntmp_req_by_eid rbe;
+	struct maft_keye_data keye;
+	struct maft_cfge_data cfge;
+};
+
+/* MAC Address Filter Table Response Data Buffer Format of Query action */
+struct maft_resp_query {
+	__le32 entry_id;
+	struct maft_keye_data keye;
+	struct maft_cfge_data cfge;
+};
+
+/* RSS Table Request Data Buffer Format of Update action */
+struct rsst_req_update {
+	struct ntmp_req_by_eid rbe;
+	u8 groups[];
+};
+
+#pragma pack()
+
+#endif
diff --git a/include/linux/fsl/ntmp.h b/include/linux/fsl/ntmp.h
new file mode 100644
index 000000000000..7cf322a1c8e3
--- /dev/null
+++ b/include/linux/fsl/ntmp.h
@@ -0,0 +1,178 @@
+/* SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause) */
+/* Copyright 2025 NXP */
+#ifndef __NETC_NTMP_H
+#define __NETC_NTMP_H
+
+#include <linux/bitops.h>
+#include <linux/if_ether.h>
+
+#define NTMP_NULL_ENTRY_ID		0xffffffffU
+#define NETC_CBDR_BD_NUM		256
+
+#pragma pack(1)
+
+union netc_cbd {
+	struct {
+		__le64 addr;
+		__le32 len;
+#define NTMP_RESP_LEN		GENMASK(19, 0)
+#define NTMP_REQ_LEN		GENMASK(31, 20)
+#define NTMP_LEN(req, resp)	(FIELD_PREP(NTMP_REQ_LEN, (req)) | \
+				((resp) & NTMP_RESP_LEN))
+		u8 cmd;
+#define NTMP_CMD_DELETE		BIT(0)
+#define NTMP_CMD_UPDATE		BIT(1)
+#define NTMP_CMD_QUERY		BIT(2)
+#define NTMP_CMD_ADD		BIT(3)
+#define NTMP_CMD_QD		(NTMP_CMD_QUERY | NTMP_CMD_DELETE)
+#define NTMP_CMD_QU		(NTMP_CMD_QUERY | NTMP_CMD_UPDATE)
+#define NTMP_CMD_AU		(NTMP_CMD_ADD | NTMP_CMD_UPDATE)
+#define NTMP_CMD_AQ		(NTMP_CMD_ADD | NTMP_CMD_QUERY)
+#define NTMP_CMD_AQU		(NTMP_CMD_AQ | NTMP_CMD_UPDATE)
+		u8 access_method;
+#define NTMP_ACCESS_METHOD	GENMASK(7, 4)
+#define NTMP_AM_ENTRY_ID	0
+#define NTMP_AM_EXACT_KEY	1
+#define NTMP_AM_SEARCH		2
+#define NTMP_AM_TERNARY_KEY	3
+		u8 table_id;
+		u8 ver_cci_rr;
+#define NTMP_HDR_VERSION	GENMASK(5, 0)
+#define NTMP_HDR_VER2		2
+#define NTMP_CCI		BIT(6)
+#define NTMP_RR			BIT(7)
+		__le32 resv[3];
+		__le32 npf;
+#define NTMP_NPF		BIT(15)
+	} req_hdr;	/* NTMP Request Message Header Format */
+
+	struct {
+		__le32 resv0[3];
+		__le16 num_matched;
+		__le16 error_rr;
+#define NTMP_RESP_ERROR		GENMASK(11, 0)
+#define NTMP_RESP_RR		BIT(15)
+		__le32 resv1[4];
+	} resp_hdr; /* NTMP Response Message Header Format */
+};
+
+struct maft_keye_data {
+	u8 mac_addr[ETH_ALEN];
+	__le16 resv;
+};
+
+struct maft_cfge_data {
+	__le16 si_bitmap;
+	__le16 resv;
+};
+
+#pragma pack()
+
+struct netc_cbdr_regs {
+	void __iomem *pir;
+	void __iomem *cir;
+	void __iomem *mr;
+
+	void __iomem *bar0;
+	void __iomem *bar1;
+	void __iomem *lenr;
+};
+
+struct netc_tbl_vers {
+	u8 maft_ver;
+	u8 rsst_ver;
+};
+
+struct netc_cbdr {
+	struct netc_cbdr_regs regs;
+
+	int bd_num;
+	int next_to_use;
+	int next_to_clean;
+
+	int dma_size;
+	void *addr_base;
+	void *addr_base_align;
+	dma_addr_t dma_base;
+	dma_addr_t dma_base_align;
+
+	spinlock_t ring_lock; /* Avoid race condition */
+};
+
+struct netc_cbdrs {
+	int cbdr_num;	/* number of control BD ring */
+	int cbdr_size;	/* number of BDs per control BD ring */
+	struct device *dma_dev;
+	struct netc_cbdr *ring;
+	struct netc_tbl_vers tbl;
+};
+
+enum netc_dev_type {
+	NETC_DEV_ENETC,
+	NETC_DEV_SWITCH
+};
+
+struct ntmp_priv {
+	enum netc_dev_type dev_type;
+	struct netc_cbdrs cbdrs;
+};
+
+struct maft_entry_data {
+	struct maft_keye_data keye;
+	struct maft_cfge_data cfge;
+};
+
+#if IS_ENABLED(CONFIG_NXP_NETC_LIB)
+int netc_setup_cbdr(struct device *dev, int cbd_num,
+		    struct netc_cbdr_regs *regs,
+		    struct netc_cbdr *cbdr);
+void netc_teardown_cbdr(struct device *dev, struct netc_cbdr *cbdr);
+
+/* NTMP APIs */
+int ntmp_maft_add_entry(struct netc_cbdrs *cbdrs, u32 entry_id,
+			struct maft_entry_data *data);
+int ntmp_maft_query_entry(struct netc_cbdrs *cbdrs, u32 entry_id,
+			  struct maft_entry_data *data);
+int ntmp_maft_delete_entry(struct netc_cbdrs *cbdrs, u32 entry_id);
+int ntmp_rsst_query_or_update_entry(struct netc_cbdrs *cbdrs,
+				    u32 *table, int count, bool query);
+#else
+static inline int netc_setup_cbdr(struct device *dev, int cbd_num,
+				  struct netc_cbdr_regs *regs,
+				  struct netc_cbdr *cbdr)
+{
+	return 0;
+}
+
+static inline void netc_teardown_cbdr(struct device *dev,
+				      struct netc_cbdr *cbdr)
+{
+}
+
+static inline int ntmp_maft_add_entry(struct netc_cbdrs *cbdrs, u32 entry_id,
+				      struct maft_entry_data *data)
+{
+	return 0;
+}
+
+static inline int ntmp_maft_query_entry(struct netc_cbdrs *cbdrs, u32 entry_id,
+					struct maft_entry_data *data)
+{
+	return 0;
+}
+
+static inline int ntmp_maft_delete_entry(struct netc_cbdrs *cbdrs, u32 entry_id)
+{
+	return 0;
+}
+
+static inline int ntmp_rsst_query_or_update_entry(struct netc_cbdrs *cbdrs,
+						  u32 *table, int count,
+						  bool query)
+{
+	return 0;
+}
+
+#endif
+
+#endif
-- 
2.34.1


