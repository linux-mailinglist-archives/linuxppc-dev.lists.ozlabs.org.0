Return-Path: <linuxppc-dev+bounces-15603-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2235CD16456
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jan 2026 03:19:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqtH030MJz2yCL;
	Tue, 13 Jan 2026 13:19:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=52.101.125.126 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768270764;
	cv=pass; b=kWg+3uBr8LD2HYFP/1bS/TiqPr0hOE4+y87cV/tDu7K7TYIxQDo8XhUEnqWgu8mz6t9ATm5KYDSM4fLLXX9r5rSgUdCawPvWXQiLGQ9Tt5VyC9niYOLeQ2l7M5AyzP7/21G2iibsVOyg+6eE+6sSEFTnYJ7lazGVz+TKuJWJ9aCiFprIoqXeko2oM7iT4QC6XUZP0Mr4YDu5JpUk6j3ofCRFJV83yscVw/HFr6BTJK/ougD31odNauzXNcGZbo5goZM5uJ8NT8FwpNzFlPC6ZguG0WYcjdjVx8PJxqiDxMyxo0MZ2thSdTeTq22j0KAmlDkKTHRaavtyGsL4j1adLQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768270764; c=relaxed/relaxed;
	bh=uxde/HcnyG6Gaq3w/4Z3vefmrWbHn/QgN5zb/PVM3/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HoQ54RyI+E2kmL9s/qtc1y03YQoR31FLIQK5haJhy2mCem3j0lg4ws8XRL8yKCSyHNhiyEz1IIYKh6F6oPWSjAAsvEBJF+me7i6ALfoqZVeOgEvmLwZEMRPqWhvqsL/dIz2FEfJC7YYx3ycmnxwUmIDClAirO0k38Z0qmqnh2c0av+u5Z7uOmdjeEdPQeI/qJ/f9lImNn95LU+y1x/mrgF/mrdqVLUmhAw4UZTo9ZB9K2HfW2ZlJcZ2tdg6DFUb38O5078zJDQIMiHE05eYVY6aeF6E+QQSLvGMOaZB5vUThWmYxNFoFrRX50rnW6d4INe4nOvqFuR9fOliMpNp++g==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; dkim=pass (1024-bit key; unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=qa9C2KXu; dkim-atps=neutral; spf=pass (client-ip=52.101.125.126; helo=tyvp286cu001.outbound.protection.outlook.com; envelope-from=den@valinux.co.jp; receiver=lists.ozlabs.org) smtp.mailfrom=valinux.co.jp
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=qa9C2KXu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=valinux.co.jp (client-ip=52.101.125.126; helo=tyvp286cu001.outbound.protection.outlook.com; envelope-from=den@valinux.co.jp; receiver=lists.ozlabs.org)
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11021126.outbound.protection.outlook.com [52.101.125.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dqtGw5SsZz2xl0
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 13:19:18 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nQBWfcjexKJ8nmAy9pQGsNMZQsp6iu8HnVs4yTjJw6avo+flbQ6oKpJdgiRNi0ZI3k2xiHjREfodk9qepC+jq9tJaE65I+U48BAeTXCjegEjsSFqQtvLT3cjNKzQsyd0KJrWkNpe2R4fw67UTVyeQqRMsLQaVZrA8DobQnHpYOeRKpgruo8+4aKYt0zTPEz0IOUwR/nHOs+/Gdn6EakUyfC6brUudeWfg1HMIKD/McWbVaIeGDTA0iBsLlHglRjsdNkqKMDlCZNP+yp8cpnKJ2WEN3RWxzMVBxfNXqq6Lpbgcmf0K1VKkaponzQ0EoV37BhBBLKL6AtZuNwrEHsdNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uxde/HcnyG6Gaq3w/4Z3vefmrWbHn/QgN5zb/PVM3/8=;
 b=aMxX9O7VLGeMtaKCJsdQYIuQhUUxdv0ZS2jBDOh4OjBsklERPPAaysb6nSEEMn6y4Uv+lSw8bEyPQXxAsnXQeJQjtrcuQdxvH98rZ+55dc9XH0/EZj8iMyqkoe35IFgi1tW+S0MzLdffL6lZfPBdKsOWCSz+gyCUwBp1JXTANlgARsUqX7t8IgVEnbEt+sUjfAvjA1zfP3+XpZRE4qYYJHjNPSxQvIvj9QEvclKT8xn/UEz6UdDsQa+5Zdc5gZtnQEZVgqPRBbKO0lwOVzxVGxeQoEZks9WixqNt3123lCZ+8T2fVz5SOeqAVtDdC17RXiiaSLbJMF1EtqWMWipccw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uxde/HcnyG6Gaq3w/4Z3vefmrWbHn/QgN5zb/PVM3/8=;
 b=qa9C2KXurHJvv7+onhpsb9gNyk3wq4MNX7BkzihZj7ug5VatkrE45pD9wd+2/hpumx3lcnI2ITD4FB9VlUkuChickCnBRx9glPwy3sZR3SmYQGRZXeReA4reoRhX61tdJCm5YVWQuph6Fp3xJPGnmwh9YOsL4bDPOtkQ761bwwM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYCP286MB2193.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:156::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 02:18:38 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 02:18:38 +0000
Date: Tue, 13 Jan 2026 11:18:36 +0900
From: Koichiro Den <den@valinux.co.jp>
To: jingoohan1@gmail.com, mani@kernel.org, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com, cassel@kernel.org
Cc: vigneshr@ti.com, s-vadapalli@ti.com, hongxing.zhu@nxp.com, 
	l.stach@pengutronix.de, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, minghuan.Lian@nxp.com, mingkai.hu@nxp.com, 
	roy.zang@nxp.com, jesper.nilsson@axis.com, heiko@sntech.de, 
	srikanth.thokala@intel.com, marek.vasut+renesas@gmail.com, yoshihiro.shimoda.uh@renesas.com, 
	geert+renesas@glider.be, magnus.damm@gmail.com, christian.bruel@foss.st.com, 
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, thierry.reding@gmail.com, 
	jonathanh@nvidia.com, hayashi.kunihiko@socionext.com, mhiramat@kernel.org, 
	kishon@kernel.org, jirislaby@kernel.org, rongqianfeng@vivo.com, 18255117159@163.com, 
	shawn.lin@rock-chips.com, nicolas.frattaroli@collabora.com, linux.amoon@gmail.com, 
	vidyas@nvidia.com, Frank.Li@nxp.com, linux-omap@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@axis.com, linux-rockchip@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v5 3/3] PCI: dwc: ep: Support BAR subrange inbound
 mapping via Address Match Mode iATU
Message-ID: <773s32dqpeauari7yxmzqz4t6wlpbkazv74forku75sw62f6u3@b4lf5tojka7p>
References: <20260108172403.2629671-1-den@valinux.co.jp>
 <20260108172403.2629671-4-den@valinux.co.jp>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108172403.2629671-4-den@valinux.co.jp>
X-ClientProxiedBy: TYXPR01CA0052.jpnprd01.prod.outlook.com
 (2603:1096:403:a::22) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
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
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYCP286MB2193:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cca5227-1bc1-4e51-a150-08de524a0ff6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dBo+gBeNhqSPNTSpI06RtI0moacZQq9yIa0nzd1vw+Mc60Syi1+eT1/J6a2K?=
 =?us-ascii?Q?FkYp/H/7xue6xw9cK92V5xEhKmYk7rOrxHRoIkCpV1Opwi9lNPrSQJERgYSn?=
 =?us-ascii?Q?XLSoUPne4KH5x28govXjjg+3An+Zl9cB1Vi/8A6K5E9WREyNc6y0vyhTxAA4?=
 =?us-ascii?Q?6P6RX70sziVqXSJTCzA6BULvsYka1KB7O0zMYG2XtmyIyOZBBReXhoReSnOM?=
 =?us-ascii?Q?qEYX1D7v+EJnxsrRXLWExQubAdj2ZZBlP1055WjTmzd7EmB0r0aClvgALubJ?=
 =?us-ascii?Q?22o0ypAH8ih8e3sSevQzCfg5N3nDaevlgW/CzDEEEi2TF9lt2R6MURRX7m50?=
 =?us-ascii?Q?0+hLNi4B36InSTMjiXbriyKJnnAW/ww32Mu8dULINBTJEu/5vw5Qj13fk3J0?=
 =?us-ascii?Q?wv4NR6hArZOhbPxwkzoOMn2ZR5rULHK+7IEGWwONB3Vs8pmJKSSL0Y5BIl8u?=
 =?us-ascii?Q?g0WNQQAybAJkN9hEeo54E5VylUW1HlDrXYK/FKV+VP6CttmKQ+SL8no87Ipt?=
 =?us-ascii?Q?hZSCNVqSJH05PNDu8eSDu9Cyhlo4LTBofYa06/34qAA/SasMN7hxMUrTfH/9?=
 =?us-ascii?Q?L7eAxu6OKFGvp+PZIZJzPtSgj5xPpOGsnGEwXmISUBicG13cADrO0sxnV5Hl?=
 =?us-ascii?Q?8yKK1TxIHpQ9hz/N6m3p7OVHS8GR4iFcY7bocJPdbUXkVQcq6Gicpnldtkbv?=
 =?us-ascii?Q?7kbTlIoY4geTL6CWMzDxamf7CaF4u9D+lDgsGSnDRZDZfpQ58Uv9stnmfF7F?=
 =?us-ascii?Q?xn2BIl4cS+F899hioSEax4q4skeVnKO1sME5nUjFnKWEZhi99H5N2lI2D7bt?=
 =?us-ascii?Q?AVZZ+sYrzcnBo5iImSoVwv7ejjzNy7MNoTJN+JyKQ32Pukf1Uu3znulEp4eR?=
 =?us-ascii?Q?6lOdXYmf9k6RJ+UWaY7RXtC/Vqs//yTud/ynRt43kmYGUIAkTmxFWnZx1p4J?=
 =?us-ascii?Q?2ME7klOZLPrZVddZ5yAmwimeAocfjDOHyglykLekP5WNPbqX98YrJyMbIkjR?=
 =?us-ascii?Q?XEomtty5ZdHvNEOeyRF5pQXCjfl3vea0eyW4iQz+sgTI02O0VbKI2/eN96rt?=
 =?us-ascii?Q?8m1q+wcbgzicDHJji0p1irQOUritiijUTq+qjYoH1TdZ69VHtbX/oKiIqJgC?=
 =?us-ascii?Q?Brxt2LmpDeMtQf3LQKNpH4PmHXD6PuJZPQi5H2teA3ULH6+JhWQHWwsvk2cm?=
 =?us-ascii?Q?InUoBCG4e4KdWxC4lrWzV1ar5f1rulDZyUGFy7B5SxxtjXMuWitPiNXtoqop?=
 =?us-ascii?Q?Som+lkr/0ud/H14YiZQ2vsLj6SF/cFcCvbUxb6ZdhM7XWU+dFdKwlFpQLpcS?=
 =?us-ascii?Q?YmfkvbvrfNMdM2tjZdwz7o6FHeUiU1a5n25p2gsZW38I0aQAUXNtjeLnjBE8?=
 =?us-ascii?Q?PEaIgE2pwDKLV3PeLqwvw5TeojDGhC+2HeD2fgk4lkbg5Jyouv9uYD0U4bVn?=
 =?us-ascii?Q?sT740Ke9P8GRzCL0pVJifFvhfgy94Rb1?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(10070799003)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?givWq2OFYDF+xavCeyV+8yjr492iMVx8aEIvtFMVFT9l7Q6lM2rStJVV/D/A?=
 =?us-ascii?Q?Z1KoBgmN+d8xsiTtI3ffZZqShoJd9nVlrBIYGcxcL+GAwaP0scTvZNM7Y1zj?=
 =?us-ascii?Q?H9UEhz7qlIpSmfkCVO2XOT5ienGmBXG0PMFmWpy+/VO5c+OiTDBkSOE/5m+A?=
 =?us-ascii?Q?MJxGsQrQq5WzkK7/lBkfZXYok9o/jf7NcZt8beODTX/A8lL9cgjLDvrTiPoT?=
 =?us-ascii?Q?jaPk6GekXadiipACgOv+4VVcsEidAaq4H+vQwUZEs/j/F4QOD9em4gswVwO4?=
 =?us-ascii?Q?3d1x20GNnLVuouq8syjsRoZNS2d1TwNIfdRUhc60h6hwHVp+dsqH9VScqzG0?=
 =?us-ascii?Q?2CcqIiGhACRV/U+JbY+FJj3yfLiQiozfXiCH9jtqhIBProsCTeUPWZueygaT?=
 =?us-ascii?Q?pf/UChi5xwDt6pOSEdfDa9thJc/y9yNS+FKRK+O6NN9Oc8EP7vr++scaGdAA?=
 =?us-ascii?Q?Egvd5o7h2Thz4HHyBfXtWYIVw93+aZnUWWBYCcAd05SffRMQJsWWwLNWe65R?=
 =?us-ascii?Q?B0/bCsmwOU+AKwaPf7zmAgKOMpZUjoLzGSRNM5Z4tirmpuOiW5/DY8zNxwJc?=
 =?us-ascii?Q?axN36uNc+iMSOKBscAdHhjKFWW3H14Up96Etf4WJhUhDp3aH6THW8foZioY8?=
 =?us-ascii?Q?WvR8lY0ynzRzSSCiu2xQdRSIQWhBoLpgFoiGcd16XOt9DQyfHnCZ8g499YNM?=
 =?us-ascii?Q?VxeId5ew9+eQG6QOGzAslwEQ7YylblvlMubvm/aglE1w3uSofYqemikFdz19?=
 =?us-ascii?Q?gW8Y3ghoRne3GlWIoitiqrr+quUnOpVzE/uaP/rFMp6u4lEnWZmwRgYYQpfj?=
 =?us-ascii?Q?5xoV2/CJxR0x2NwheTrJwhDaJp3TISS65N1TkpAQEAp07tOs3FZxrc8mlkEj?=
 =?us-ascii?Q?3Pl5wJ+DzPs0upVOGyHbZuYqstSVeDyPASzEw2wMPmKq0snGnzGDu9yrSlQW?=
 =?us-ascii?Q?NR9fXsVUTlKEd9fcjWkv+tSFzHetXxUGMo5MCqG67YqOcJ0dIUYTrdqEVTZQ?=
 =?us-ascii?Q?k0TbkP2K8wV2VJigx723kK5sq0QWJgTnjtk6WGtoaU+CVIL3k95EwOmbz17x?=
 =?us-ascii?Q?JpC3LqW/TWeirzlUQdfwF7OZhtDTA5gGdKE8030J0NrkMqiWGIs2nj2jZF1x?=
 =?us-ascii?Q?FJfWbvXxyNwjGjA/RKiUmwKtK8pDG69O9u4JLhzJEKlkYgBj5yqesDqvVoSd?=
 =?us-ascii?Q?Ayp6cBQ2Qqq5ySe5oFZH0Wr3v31QEfw/5bdVBHm/xNjxiYpXXB8JMCmP4I2/?=
 =?us-ascii?Q?SjOAKUAz4+FQcOf+CT1glIeY3k9SOpkQ5mhsfYGFenC3qShNVPsh5A4SUsHM?=
 =?us-ascii?Q?PKu5/pl9sAjzPg6Lp23wU4w3Vp++7p6RbSM3E0hPW/IXAtFY3MmBebDZ13Nb?=
 =?us-ascii?Q?AQL6XKc1Dp6mlO2TnebjbCksiNnIDGD8xhz0eQrr2G/4Lc5jUo6DG2E9sCxq?=
 =?us-ascii?Q?XWT5GEqj9Gm9taOiw2CF4l8o0gBfGNn3ZnPo6nuo9i4X4weNiRtoOw081uMl?=
 =?us-ascii?Q?Ld/odm7fYZ5fuBq7vHglPvnMqCIJhslp5pTf4P1cK0GkquM84rbvRZsm29zK?=
 =?us-ascii?Q?A4Z6RAE6bL/H5CVNQ+uoUwvkT14sXP/YogqgXi6I1ZIbs+CTLu25eo2oGMYB?=
 =?us-ascii?Q?8DCRrceKuedF4LiVgpTA5x7Buwu3JWALVzkWJc50ILEF4GcNH5JzZJK7+1dp?=
 =?us-ascii?Q?U+xrj8tROTWw7//WDfBEMC39M01JnQXcz7VmrN8FTL7nD/Tucq9jPVi929l6?=
 =?us-ascii?Q?AwiXTF8d8RArfRRtHchTNuOdIWRCCNybZm9WMsvLLUAblwYC0PvR?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cca5227-1bc1-4e51-a150-08de524a0ff6
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 02:18:38.3312
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4u+FjSyq1CSTFP0tAVwO0KjF99HxuNSkA9IcWAyaN5xDXuh8CrpF9jw6E+gW2YML44a3Co29SUnW+v1JASzUYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB2193
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Jan 09, 2026 at 02:24:03AM +0900, Koichiro Den wrote:
> Extend dw_pcie_ep_set_bar() to support inbound mappings for BAR
> subranges using Address Match Mode IB iATU.
> 
> Rename the existing BAR-match helper into dw_pcie_ep_ib_atu_bar() and
> introduce dw_pcie_ep_ib_atu_addr() for Address Match Mode. When
> use_submap is set, read the assigned BAR base address and program one
> inbound iATU window per subrange. Validate the submap array before
> programming:
> - each subrange is aligned to pci->region_align
> - subranges cover the whole BAR (no gaps and no overlaps)
> - subranges are sorted in ascending order by offset
> 
> Track Address Match Mode mappings and tear them down on clear_bar() and
> on set_bar() error paths to avoid leaving half-programmed state or
> untranslated BAR holes.
> 
> Advertise this capability by setting subrange_mapping in the EPC
> features returned from dw_pcie_ep_get_features().
> 
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> ---
>  .../pci/controller/dwc/pcie-designware-ep.c   | 242 +++++++++++++++++-
>  drivers/pci/controller/dwc/pcie-designware.h  |   2 +
>  2 files changed, 232 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
> index 1195d401df19..406e9218e4ea 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
> @@ -139,9 +139,10 @@ static int dw_pcie_ep_write_header(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
>  	return 0;
>  }
>  
> -static int dw_pcie_ep_inbound_atu(struct dw_pcie_ep *ep, u8 func_no, int type,
> -				  dma_addr_t parent_bus_addr, enum pci_barno bar,
> -				  size_t size)
> +/* Bar Match Mode inbound iATU mapping */
> +static int dw_pcie_ep_ib_atu_bar(struct dw_pcie_ep *ep, u8 func_no, int type,
> +				 dma_addr_t parent_bus_addr, enum pci_barno bar,
> +				 size_t size)
>  {
>  	int ret;
>  	u32 free_win;
> @@ -174,6 +175,208 @@ static int dw_pcie_ep_inbound_atu(struct dw_pcie_ep *ep, u8 func_no, int type,
>  	return 0;
>  }
>  
> +/* Inbound mapping bookkeeping for Address Match Mode */
> +struct dw_pcie_ib_map {
> +	struct list_head	list;
> +	enum pci_barno		bar;
> +	u64			pci_addr;
> +	u64			parent_bus_addr;
> +	u64			size;
> +	u32			index;
> +};
> +
> +static void dw_pcie_ep_clear_ib_maps(struct dw_pcie_ep *ep, enum pci_barno bar)
> +{
> +	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> +	struct dw_pcie_ib_map *m, *tmp;
> +	struct device *dev = pci->dev;
> +	u32 atu_index;
> +
> +	/* Tear down the BAR Match Mode mapping, if any. */
> +	if (ep->bar_to_atu[bar]) {
> +		atu_index = ep->bar_to_atu[bar] - 1;
> +		dw_pcie_disable_atu(pci, PCIE_ATU_REGION_DIR_IB, atu_index);
> +		clear_bit(atu_index, ep->ib_window_map);
> +		ep->bar_to_atu[bar] = 0;
> +	}
> +
> +	/* Tear down all Address Match Mode mappings, if any. */
> +	guard(spinlock_irqsave)(&ep->ib_map_lock);
> +	list_for_each_entry_safe(m, tmp, &ep->ib_map_list, list) {
> +		if (m->bar != bar)
> +			continue;
> +		dw_pcie_disable_atu(pci, PCIE_ATU_REGION_DIR_IB, m->index);
> +		clear_bit(m->index, ep->ib_window_map);
> +		list_del(&m->list);
> +		devm_kfree(dev, m);
> +	}
> +}
> +
> +static u64 dw_pcie_ep_read_bar_assigned(struct dw_pcie_ep *ep, u8 func_no,
> +					enum pci_barno bar, int flags)
> +{
> +	u32 reg = PCI_BASE_ADDRESS_0 + (4 * bar);
> +	u32 lo, hi;
> +	u64 addr;
> +
> +	lo = dw_pcie_ep_readl_dbi(ep, func_no, reg);
> +
> +	if (flags & PCI_BASE_ADDRESS_SPACE)
> +		return lo & PCI_BASE_ADDRESS_IO_MASK;
> +
> +	addr = lo & PCI_BASE_ADDRESS_MEM_MASK;
> +	if (!(flags & PCI_BASE_ADDRESS_MEM_TYPE_64))
> +		return addr;
> +
> +	hi = dw_pcie_ep_readl_dbi(ep, func_no, reg + 4);
> +	return addr | ((u64)hi << 32);
> +}
> +
> +static int dw_pcie_ep_validate_submap(struct dw_pcie_ep *ep,
> +				      const struct pci_epf_bar_submap *submap,
> +				      unsigned int num_submap, size_t bar_size)
> +{
> +	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> +	u32 align = pci->region_align;
> +	size_t expected = 0;
> +	size_t size, off;
> +	unsigned int i;
> +
> +	if (!align || !IS_ALIGNED(bar_size, align))
> +		return -EINVAL;
> +
> +	/*
> +	 * The array is expected to be sorted by offset before calling this
> +	 * helper. With sorted entries, we can enforce a strict, gapless
> +	 * decomposition of the BAR:
> +	 *  - each entry has a non-zero size
> +	 *  - offset/size/phys_addr are aligned to pci->region_align
> +	 *  - each entry lies within the BAR range
> +	 *  - entries are contiguous (no overlaps, no holes)
> +	 *  - the entries exactly cover the whole BAR
> +	 *
> +	 * Note: dw_pcie_prog_inbound_atu() also checks alignment for
> +	 * offset/phys_addr, but validating up-front avoids partially
> +	 * programming iATU windows in vain.
> +	 */
> +	for (i = 0; i < num_submap; i++) {
> +		off = submap[i].offset;
> +		size = submap[i].size;
> +
> +		if (!size)
> +			return -EINVAL;
> +
> +		if (!IS_ALIGNED(size, align) || !IS_ALIGNED(off, align))
> +			return -EINVAL;
> +
> +		if (!IS_ALIGNED(submap[i].phys_addr, align))
> +			return -EINVAL;
> +
> +		if (off > bar_size || size > bar_size - off)
> +			return -EINVAL;
> +
> +		/* Enforce contiguity (no overlaps, no holes). */
> +		if (off != expected)
> +			return -EINVAL;
> +
> +		expected += size;
> +	}
> +	if (expected != bar_size)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +/* Address Match Mode inbound iATU mapping */
> +static int dw_pcie_ep_ib_atu_addr(struct dw_pcie_ep *ep, u8 func_no, int type,
> +				  const struct pci_epf_bar *epf_bar)
> +{
> +	const struct pci_epf_bar_submap *submap = epf_bar->submap;
> +	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> +	enum pci_barno bar = epf_bar->barno;
> +	struct device *dev = pci->dev;
> +	u64 pci_addr, parent_bus_addr;
> +	struct dw_pcie_ib_map *new;
> +	u64 size, off, base;
> +	unsigned long flags;
> +	int free_win, ret;
> +	unsigned int i;
> +
> +	if (!epf_bar->num_submap || !submap || !epf_bar->size)
> +		return -EINVAL;
> +
> +	ret = dw_pcie_ep_validate_submap(ep, submap, epf_bar->num_submap,
> +					 epf_bar->size);
> +	if (ret)
> +		return ret;
> +
> +	base = dw_pcie_ep_read_bar_assigned(ep, func_no, bar, epf_bar->flags);
> +	if (!base) {
> +		dev_err(dev,
> +			"BAR%u not assigned, cannot set up sub-range mappings\n",
> +			bar);
> +		return -EINVAL;
> +	}
> +
> +	/* Tear down any existing mappings before (re)programming. */
> +	dw_pcie_ep_clear_ib_maps(ep, bar);
> +
> +	for (i = 0; i < epf_bar->num_submap; i++) {
> +		off = submap[i].offset;
> +		size = submap[i].size;
> +		parent_bus_addr = submap[i].phys_addr;
> +
> +		if (off > (~0ULL) - base) {
> +			ret = -EINVAL;
> +			goto err;
> +		}
> +
> +		pci_addr = base + off;
> +
> +		new = devm_kzalloc(dev, sizeof(*new), GFP_KERNEL);
> +		if (!new) {
> +			ret = -ENOMEM;
> +			goto err;
> +		}
> +
> +		spin_lock_irqsave(&ep->ib_map_lock, flags);
> +
> +		free_win = find_first_zero_bit(ep->ib_window_map,
> +					       pci->num_ib_windows);
> +		if (free_win >= pci->num_ib_windows) {
> +			spin_unlock_irqrestore(&ep->ib_map_lock, flags);
> +			devm_kfree(dev, new);
> +			ret = -ENOSPC;
> +			goto err;
> +		}
> +		set_bit(free_win, ep->ib_window_map);
> +
> +		new->bar = bar;
> +		new->index = free_win;
> +		new->pci_addr = pci_addr;
> +		new->parent_bus_addr = parent_bus_addr;
> +		new->size = size;
> +		list_add_tail(&new->list, &ep->ib_map_list);
> +
> +		spin_unlock_irqrestore(&ep->ib_map_lock, flags);
> +
> +		ret = dw_pcie_prog_inbound_atu(pci, free_win, type,
> +					       parent_bus_addr, pci_addr, size);
> +		if (ret) {
> +			spin_lock_irqsave(&ep->ib_map_lock, flags);
> +			list_del(&new->list);
> +			clear_bit(free_win, ep->ib_window_map);
> +			spin_unlock_irqrestore(&ep->ib_map_lock, flags);
> +			devm_kfree(dev, new);
> +			goto err;
> +		}
> +	}
> +	return 0;
> +err:
> +	dw_pcie_ep_clear_ib_maps(ep, bar);
> +	return ret;
> +}
> +
>  static int dw_pcie_ep_outbound_atu(struct dw_pcie_ep *ep,
>  				   struct dw_pcie_ob_atu_cfg *atu)
>  {
> @@ -204,17 +407,15 @@ static void dw_pcie_ep_clear_bar(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
>  	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
>  	enum pci_barno bar = epf_bar->barno;
> -	u32 atu_index = ep->bar_to_atu[bar] - 1;
>  
> -	if (!ep->bar_to_atu[bar])
> +	if (!ep->epf_bar[bar])
>  		return;
>  
>  	__dw_pcie_ep_reset_bar(pci, func_no, bar, epf_bar->flags);
>  
> -	dw_pcie_disable_atu(pci, PCIE_ATU_REGION_DIR_IB, atu_index);
> -	clear_bit(atu_index, ep->ib_window_map);
> +	dw_pcie_ep_clear_ib_maps(ep, bar);
> +
>  	ep->epf_bar[bar] = NULL;
> -	ep->bar_to_atu[bar] = 0;
>  }
>  
>  static unsigned int dw_pcie_ep_get_rebar_offset(struct dw_pcie *pci,
> @@ -408,10 +609,17 @@ static int dw_pcie_ep_set_bar(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
>  	else
>  		type = PCIE_ATU_TYPE_IO;
>  
> -	ret = dw_pcie_ep_inbound_atu(ep, func_no, type, epf_bar->phys_addr, bar,
> -				     size);
> -	if (ret)
> +	if (epf_bar->use_submap)
> +		ret = dw_pcie_ep_ib_atu_addr(ep, func_no, type, epf_bar);
> +	else
> +		ret = dw_pcie_ep_ib_atu_bar(ep, func_no, type,
> +					    epf_bar->phys_addr, bar, size);
> +
> +	if (ret) {
> +		if (epf_bar->use_submap)
> +			dw_pcie_ep_clear_bar(epc, func_no, vfunc_no, epf_bar);

I just noticed that this dw_pcie_ep_clear_bar() should be dropped, since it
goes too far and resets the BAR. Also dw_pcie_ep_ib_atu_addr() already
rolls back partially programmed inbound mappings on failure, so this extra
clear_bar() is unnecessary. I'll drop this in v6.

Koichiro

>  		return ret;
> +	}
>  
>  	ep->epf_bar[bar] = epf_bar;
>  
> @@ -626,11 +834,19 @@ static const struct pci_epc_features*
>  dw_pcie_ep_get_features(struct pci_epc *epc, u8 func_no, u8 vfunc_no)
>  {
>  	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
> +	struct pci_epc_features *features;
>  
>  	if (!ep->ops->get_features)
>  		return NULL;
>  
> -	return ep->ops->get_features(ep);
> +	features = ep->ops->get_features(ep);
> +	if (!features)
> +		return NULL;
> +
> +	/* All DWC-based glue drivers support inbound subrange mapping */
> +	features->subrange_mapping = true;
> +
> +	return features;
>  }
>  
>  static const struct pci_epc_ops epc_ops = {
> @@ -1120,6 +1336,8 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
>  	struct device *dev = pci->dev;
>  
>  	INIT_LIST_HEAD(&ep->func_list);
> +	INIT_LIST_HEAD(&ep->ib_map_list);
> +	spin_lock_init(&ep->ib_map_lock);
>  	ep->msi_iatu_mapped = false;
>  	ep->msi_msg_addr = 0;
>  	ep->msi_map_size = 0;
> diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> index 4dda9a38d46b..969b1f32dddf 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.h
> +++ b/drivers/pci/controller/dwc/pcie-designware.h
> @@ -479,6 +479,8 @@ struct dw_pcie_ep {
>  	phys_addr_t		*outbound_addr;
>  	unsigned long		*ib_window_map;
>  	unsigned long		*ob_window_map;
> +	struct list_head	ib_map_list;
> +	spinlock_t		ib_map_lock;
>  	void __iomem		*msi_mem;
>  	phys_addr_t		msi_mem_phys;
>  	struct pci_epf_bar	*epf_bar[PCI_STD_NUM_BARS];
> -- 
> 2.51.0
> 

