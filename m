Return-Path: <linuxppc-dev+bounces-2748-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D37519B808F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2024 17:48:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XfVLn3wfGz2yRP;
	Fri,  1 Nov 2024 03:48:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2614::62c" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730393329;
	cv=pass; b=IbnRd4ZuGtgACJSAfJVGV7EGSw/GUxoDcW6+Sq5lJYaI/A/5BsYFfA3JZMA8LY19bwYTf8FmJr82at5GQEwiPSWc8M3BWHlRj0dffweDU/UXrlcsJecz6vudXcDL0s87UWeKR+/GrsxFaAiOFA8+67MkgLH6tedIstzjBCmRkw78uaTVM2/YHdLvBvpW3RICoHMX0162ls71qpZNgU2bI9hoJVxZ12DxDWoMSHp2w2Tuu4OWIHAsiTcTqJ0Pd1UI4gnr+frTiYeRKReaWWA6UmdK0nAqFOwKDJi8kS48GlUC8Ver3wL7xi9T1qJ+zBDdRm3V7h883sdcsDYDstkvNA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730393329; c=relaxed/relaxed;
	bh=Dvth1Xcw+HeCUb3YC5Fbjcsx9Cr2ejr6N2HxPk9eIck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=AfEXWwDdtQ7gkheb7KyKz8CZg18AJqYdBdf/DP5vzYINXIwPrvF1n0fyNSlSr4dDk/yZTg8bWmkBVViCG99tjNa19ziRkqn1jLvrjvQVKiaebK+EjvRZwyuuL3r7Ta/KOgvCSHRqVuAdYrwwOIO7Ad2MT6ja8jKrw5WzD7WNVXowE9Q8NVeeJ7NQ6DjIsuOB9G9NkZadjYKS8A6tZvmRFx1lyx/2pTTvSVmKi9wEzY4v6UQRH1YFj5MHMDEJzjrBcBUyruiiOn19+JLPuxgcM+uHjp8Fu3ZHJXrL12PPPBLp+38/KWNlP6iSv92MlTe3wDQ7q3rFWwARrqGN1rD5LQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=UMX3167S; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2614::62c; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=UMX3167S;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2614::62c; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2062c.outbound.protection.outlook.com [IPv6:2a01:111:f403:2614::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XfVLm29klz2y8k
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Nov 2024 03:48:48 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=psSta7BdBz4w1VYtazEtf9ROQ68UXK+BoulNd+57sRTYaBw2ETpol6A2Hw0Nx9/wSBgYWpMXybOgqHa/D8XuiuA7IilWqZ3ZLvD4tTUpwi/d3vWl/SybxdJoCdQR1bH96OENSGwiXAEHyxS4L7MXjaEtWdIf/sfE64Q7pXHmlnkWN1KrkOxydyp2vA5p/QXsJ4VOdbC029PUMQUGoRdQp9pP/i5hkDZm7PV0V8g1Fo/QsONJJ6q111jIQ3gzE04UtG4oGZmyjN/WHcK0vKVepEANmDlcbcIvNcuwqRH7ustze409h+T4Fe0k+LmCfoHKDrlCo/Di5FOxMqJ5l8sZ1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dvth1Xcw+HeCUb3YC5Fbjcsx9Cr2ejr6N2HxPk9eIck=;
 b=XkJm79TIUHylXLzHJq9jYh1knhRELq0BuwxOrFl3TA4N4Jy+Wc3e3ytQ6mFlBSbpfgFKnzL3qaBARcn8wh8/Z8gNhbeC/tMuwCKnLx3O8GUtvoYe1lPU2SwLnlPXwE+cpxg19Tw1UwctRaHpRmjyLAPh+NoIfEF2btc66EVx4VHLaPUJUl+bvk3o9aCaP1LSAZe1z/KW+GnBnTa12hiTVQoHrWyKDb9PKdOs6cMjzhku/Y5tyevwDGaTbCzUEAWdDQVGSu6pHzUjbsnaRbv460pLdhZ4k1nW1NMdeEHpIaYC2IxTXUBHEuaJbPFYUX2YZaQ437npir2REqBlVhmpGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dvth1Xcw+HeCUb3YC5Fbjcsx9Cr2ejr6N2HxPk9eIck=;
 b=UMX3167Sgt7Bz6zJT5VJI/fl8DpNnYwd9000qgsdnVmmK3SNhXAFc2WTpqpOVi9+VxQOgIPKz9B8ebGEze3yiQOvgCdj41Rc8PRm6ywpdvI67QD0oobdXHRke8kT7xhVIoTCskerSPts+JCNQDNpj5BgA3pCqeo0nKg5U1gcNaDhVXImMv7TLref+U6O9q/V5avEK2Ni+K3Yn4/ufrBo0vFhkOibAGqyTlabdO9upuGHsI/qgub3E90iii/4+u77ZlLLRBv+i1cDDSPyvbpSOpN1nDGgd5isjCY00kyhQthxTp1TlEcYXVPuF7tMfpzY+Y2nTrVx57+nQfMA4Q6u+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by DBBPR04MB7801.eurprd04.prod.outlook.com (2603:10a6:10:1eb::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Thu, 31 Oct
 2024 16:48:29 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%3]) with mapi id 15.20.8093.027; Thu, 31 Oct 2024
 16:48:29 +0000
Date: Thu, 31 Oct 2024 18:48:23 +0200
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Caleb Sander Mateos <csander@purestorage.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Arthur Kiyanovski <akiyano@amazon.com>,
	Brett Creeley <brett.creeley@amd.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	David Arinzon <darinzon@amazon.com>,
	"David S. Miller" <davem@davemloft.net>,
	Doug Berger <opendmb@gmail.com>, Eric Dumazet <edumazet@google.com>,
	Eugenio =?utf-8?B?UMODwqlyZXo=?= <eperezma@redhat.com>,
	Felix Fietkau <nbd@nbd.name>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Geetha sowjanya <gakula@marvell.com>,
	hariprasad <hkelam@marvell.com>, Jakub Kicinski <kuba@kernel.org>,
	Jason Wang <jasowang@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
	Leon Romanovsky <leon@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Louis Peens <louis.peens@corigine.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Michael Chan <michael.chan@broadcom.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Noam Dagan <ndagan@amazon.com>, Paolo Abeni <pabeni@redhat.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Roy Pledge <Roy.Pledge@nxp.com>, Saeed Bishara <saeedb@amazon.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Shannon Nelson <shannon.nelson@amd.com>,
	Shay Agroskin <shayagr@amazon.com>, Simon Horman <horms@kernel.org>,
	Subbaraya Sundeep <sbhatta@marvell.com>,
	Sunil Goutham <sgoutham@marvell.com>, Tal Gilboa <talgi@nvidia.com>,
	Tariq Toukan <tariqt@nvidia.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	intel-wired-lan@lists.osuosl.org,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-rdma@vger.kernel.org,
	netdev@vger.kernel.org, oss-drivers@corigine.com,
	virtualization@lists.linux.dev
Subject: Re: [resend PATCH 2/2] dim: pass dim_sample to net_dim() by reference
Message-ID: <20241031164823.k6gqr6hm7ukd4dt6@skbuf>
References: <20241031002326.3426181-1-csander@purestorage.com>
 <20241031002326.3426181-1-csander@purestorage.com>
 <20241031002326.3426181-2-csander@purestorage.com>
 <20241031002326.3426181-2-csander@purestorage.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241031002326.3426181-2-csander@purestorage.com>
 <20241031002326.3426181-2-csander@purestorage.com>
X-ClientProxiedBy: VI1P191CA0011.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:800:1ba::19) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
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
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|DBBPR04MB7801:EE_
X-MS-Office365-Filtering-Correlation-Id: 225c4781-6ef8-4ed0-c614-08dcf9cbd8a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LKhfy6N84xQEEB5cvM9XjMjhkbRDJ3glU7CzuuCAT2sJZRVsGHRBX2YM67W0?=
 =?us-ascii?Q?4sZx+MWBYbOG8+UW9bxDuLaEdJNLhxJjtnuH20NL8tbmlqe+IvqagAYcQ0xQ?=
 =?us-ascii?Q?xooJCxEC+Bi6EIfrZ9tGcy+5qekCdPmC1ct/U0vzJyuIAjGxgHL1wKu4wjgM?=
 =?us-ascii?Q?SugU2HO4PQ0T07I/2djKOfma1fxk0nd+AabO34WeGKFRnXvSJM+VJ89opq36?=
 =?us-ascii?Q?1Ts6y5hbbSAiWJDOzETXl7aVwPtzz0jSlMyMue9t4Rql8I6+F42Ioaem0Y6X?=
 =?us-ascii?Q?3SXHHbhdg8uAypRqr+MFBf90ZHCj1g5TL3qwAzxWfQJaHSoaV/2DFp87zg+h?=
 =?us-ascii?Q?KUpYykxuA9qIaR7Y4JgsiCxO29uaILIQrc5Ii7gsNioXY9IB5VhJj+JDtBDI?=
 =?us-ascii?Q?GDs7HfKkUUMxy2hiLrhO1Qe038OJOQojhssS453p/KbCfqyLeTgPpBGl2kN/?=
 =?us-ascii?Q?fZWGaE3SizwChMzWqwyxLpIF3ZbCY+g4yPtLI33idwhj4nOtO5ADdQJW7nb0?=
 =?us-ascii?Q?XyvIREuUUA4ixXu3IGJ1iAF5Q8nCQltFdZx8oghAShGLlzgYXDOD/pJ4VVtF?=
 =?us-ascii?Q?QhxoXk8b1PNc2GVoi3Xixy7TPM6NLdbWvTXaiQ4NY+345Ama8n103jntxvco?=
 =?us-ascii?Q?GmpfOZx5fNJ9PJuaFU9j8ND5Y2GxXL5qUj9dwMXU8MmkOfhpIj6OpXQsxvsr?=
 =?us-ascii?Q?mh/LvVo4+BrOn47cNUM9PxNgZ0YlokT+6NyStbS0O1s/QTcErpRm20vzXCva?=
 =?us-ascii?Q?1LIZuwNj/Rh8GLM6xJL7BnAhDeq7l6ys5oF6wEcWLa5W/bd/0hWnIrC6Vr2N?=
 =?us-ascii?Q?0+n0yvxYcDh2jCpdVi30ObKQt9deeG5nOz6Sua70aHL162j5HDQmVXkXRSG7?=
 =?us-ascii?Q?8701uHTrtXyAbXsXaJHd23edAKnFXShgmvhFCkaWvTdux4/eZ5NZniEk1aNj?=
 =?us-ascii?Q?BL7aJBtl+v6BW9ZiF/CTzKZSSQN46mK8zp/BlIOx1nAsQXU/iGOtj8PBGNoM?=
 =?us-ascii?Q?3FIJsQdrxLqpJO61U3Qnt0xzAnXAfhA62m02jsSC0bg4P7tCMGgTojJaTtrB?=
 =?us-ascii?Q?CsrpvDBJAzUy5EoDuuqVHs0pOpY53HvE2otsxpQC3VlKyR5QgtG44dQsadAz?=
 =?us-ascii?Q?uizUVzjRcbbSOOzYDyET9HBlvQeh8DtJpNVrInhQavrWLIeGr/coeeotQFbi?=
 =?us-ascii?Q?4U2NWtGE5YLbT+HZILE7l9u8xq5Z67j+K8fQg63U/I6uqNe8/Q8V8774bTP9?=
 =?us-ascii?Q?LuNfQFPCAfhXXKjv3WcdYRiZUIThEYAD+0QPPToCe+38U4Yt2tTWBYQTPqfx?=
 =?us-ascii?Q?pwtYs/0wBkQF6MVcNefb3sWX?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7779.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5FR96h1b/XT/jHL8H4uv/PZDgMQUuibUQk4N3LP5B34nd+IzsJ8H2SqBDS/2?=
 =?us-ascii?Q?ADicqYF1szzzeU0OdADPefPTPOCfAygrToPxWkGbKwlZVGg25rQ8/EMaHL6j?=
 =?us-ascii?Q?HJfuZ2Czc+hm7VbggRD4/PGvyU9144hGb/c2pAN0Ors0cpe1NBhafFWdGnE8?=
 =?us-ascii?Q?qEkPE4MAzctJCk0wwt2CmXYnkNjY0eJN6eHTAapA8lmW+F2/tR+7/lzrg3IZ?=
 =?us-ascii?Q?Re2AEGEJYI7IrfMOqY0aD/H0QzfUD8o4f6uwoKnAu5BRNn1p6ux7GLcJHXX8?=
 =?us-ascii?Q?XMDz6MbAapk/E1bWWc9MEVUs7JbQba+aAP5ewOqCxTCdKR1+8ImTB5Fo/ztH?=
 =?us-ascii?Q?UmxHylHF7yxBiW/ZsCTbiDkY7pL1neYHs52rc43ZMAcl++HdlpZbmZsnvn2i?=
 =?us-ascii?Q?OHs9uuIqsmCmpgbtRT1t6myC+NU8IiDgJv2TEwMsKvx1Cxu7ZaA0H1LRfEeC?=
 =?us-ascii?Q?a6A1LZd9X0YvX2L/9aIRJFe7PUvyBtP9Jm0DVpnA2oOysuhxGTNMXHaW+ITo?=
 =?us-ascii?Q?GoCpGsyegtzdDp9/STxMsmfEg1l6qe1s2V+AfH6C4dG9fNVIqiwrxRWQ2Ina?=
 =?us-ascii?Q?fXn/4L6DtKyPMFz++wr2C5EVS4lF8FqC84RJaznMXojd0w34+I0Nm6Af9mYo?=
 =?us-ascii?Q?zlOnmpquNdYdHAUOsVHMqb70Nf0/4WFycBfu7QSMRR0hFQa1MOr3XPgJwtjb?=
 =?us-ascii?Q?tnNy9qL7FJnlCuzDJlQQ/z46t/MZ97i4ZR2S9i2k3h8GVx7dsgmvcpmpeIyX?=
 =?us-ascii?Q?1lRWV/H3ZSK2+qRJlzP/A20/R8h4FhqjCwc2SqNzQEsfkLmlv2Em70LKp1Zl?=
 =?us-ascii?Q?3+FWhqTIoQgcG3cix3Tg3P5ZZKGDSuLqymRPG9aXHefI0tbeonKxpUHZUpHR?=
 =?us-ascii?Q?klqLubj8pp2g/dJmQhHVVudl0lPBvwXSC05CjJ9q64UwvWQ2jGaUeg77Os0X?=
 =?us-ascii?Q?96XDgMT3iwNfs7pK72nnhwwwHIv13sKvrgFO3ja66NRJlVEdrD47AsSCRVc7?=
 =?us-ascii?Q?HGm5UofoHiSaG9z/oZ3G/CORGa6xu5QR/zlgZUxMZjrv22AFWAjG0InP2G8h?=
 =?us-ascii?Q?UaNsFHwLi9IWBqfAiLtireWTSwgVpdTG/COn4t/uJVSIHbKpl0HPFkCoO/94?=
 =?us-ascii?Q?VeO4261gJjQsNu94X+BQoeVO7KZG83hw6pWOdRT8+R4AJ1/iUDakWh1SXLEX?=
 =?us-ascii?Q?kNqQ30eJqQPit1pmzPVou7NHVej65ACg5MZpu0E5U/JRfIJBxna8nLI1ByrL?=
 =?us-ascii?Q?/snAS/t28kgVHpCG0tM7Wda/NWV6MysDDw5qMA9VdNroGBqRZtZcLDGwmhu6?=
 =?us-ascii?Q?iLxiutD6N0lP+YHQKuXIOne3dNjd++0PbGivrj1oCMlrjg0VPGC5BURUT16H?=
 =?us-ascii?Q?r98APJZ2c8pVQih1rQty976I44A195agCVH+WzM/EaAZ5IOhGHpJBur0ZTUj?=
 =?us-ascii?Q?509yYOKBMNNeBKiINADAJ8AwNkukR4xWFZQ0C/Kg0XDPhl4Ulc10nZYm9Iv4?=
 =?us-ascii?Q?Pb8SCDRoEuDO74RZbL6rvLEYxUDFwLs8jmL4ywsroDcao/r+my9gMOan05f4?=
 =?us-ascii?Q?eCnDE9pft5dto3H5MN8zTdBJqftoxkOdZlrQyPXEyCyOgn6BVRDNygu+dxja?=
 =?us-ascii?Q?LA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 225c4781-6ef8-4ed0-c614-08dcf9cbd8a9
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7779.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 16:48:29.0235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9o14lwAVwmzpPh2FvAZXElB/z6IBBXOXTvlF/OI/e0A5xvfjtZ5E761Wu3SbCU130AXkA/Mr+M6WMTfEYGcu5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7801
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Oct 30, 2024 at 06:23:26PM -0600, Caleb Sander Mateos wrote:
> net_dim() is currently passed a struct dim_sample argument by value.
> struct dim_sample is 24 bytes. Since this is greater 16 bytes, x86-64
> passes it on the stack. All callers have already initialized dim_sample
> on the stack, so passing it by value requires pushing a duplicated copy
> to the stack. Either witing to the stack and immediately reading it, or
> perhaps dereferencing addresses relative to the stack pointer in a chain
> of push instructions, seems to perform quite poorly.
> 
> In a heavy TCP workload, mlx5e_handle_rx_dim() consumes 3% of CPU time,
> 94% of which is attributed to the first push instruction to copy
> dim_sample on the stack for the call to net_dim():
> // Call ktime_get()
>   0.26 |4ead2:   call   4ead7 <mlx5e_handle_rx_dim+0x47>
> // Pass the address of struct dim in %rdi
>        |4ead7:   lea    0x3d0(%rbx),%rdi
> // Set dim_sample.pkt_ctr
>        |4eade:   mov    %r13d,0x8(%rsp)
> // Set dim_sample.byte_ctr
>        |4eae3:   mov    %r12d,0xc(%rsp)
> // Set dim_sample.event_ctr
>   0.15 |4eae8:   mov    %bp,0x10(%rsp)
> // Duplicate dim_sample on the stack
>  94.16 |4eaed:   push   0x10(%rsp)
>   2.79 |4eaf1:   push   0x10(%rsp)
>   0.07 |4eaf5:   push   %rax
> // Call net_dim()
>   0.21 |4eaf6:   call   4eafb <mlx5e_handle_rx_dim+0x6b>
> 
> To allow the caller to reuse the struct dim_sample already on the stack,
> pass the struct dim_sample by reference to net_dim().
> 
> Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
> ---

Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>

