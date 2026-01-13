Return-Path: <linuxppc-dev+bounces-15656-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA735D1A40F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jan 2026 17:28:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4drF6v53PLz2ymg;
	Wed, 14 Jan 2026 03:28:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=52.101.125.141 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768321719;
	cv=pass; b=fpJM8OHED23YsKKUI19wZr0YgOld3FR6+e6B6fCmk8xUpsxCmS5tnOdOj+9iXse/MDmnxr7JFokc0DbGGvufBdfuV12+JGncBW7OWZaoIvfDy3JrAVEOFFPOa8fUOEfNNgOx94zvgTgB+sZZRhwxorZUt1J/guXT81Gj2bhickyOYZW6mb4WKLHijw6cEHGwJGEPDx27o5kurj62KDFi05TAO7fPRpsGRFwMNzmcMTOxXqZeiWzqAAKFvC+w+HyHHnPGqNY2974iTmsJZrFMQ42papR9/RPufI9aoh0Et1Azw2NHhkGlZpvk7M5VpeQdlhKiO4vXRTf3ituzFTs5aA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768321719; c=relaxed/relaxed;
	bh=W6dqE8YYSzrsgwZDSkBSCL/W2RUCSZBG39FOEzSuysk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FOyD913LZCACi+h/CHHr1eftuJVvKBpufJRwmrCnTs45URRJAchtEuA30iCruIDGVGMZaZn0TsiUJrMZeL+ZDMlwq8G7DilpoZrMZme1QP8L4xE90ZqA3idNQ1w6q04uMKCJhxAJDrpdKDHSuZJwJJZ2kwr58mZ4TqM4Fvumojw+TFX7TraHsomb9pVmXBd08DqWCWWZESkuB4xPvvuS3pWr8Uxri0EQEMtGa9pg01fth3HkJzStU6leXRp3o8drqvI419wQjc/CMb6McI7Hzt6ZAB/wE1k3NknaVtkjQqgXaEk2Hzoxs8PCUtIFvkY+a7Q0PoLeDmK6OL1EtNKzSg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; dkim=pass (1024-bit key; unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=DmUT1VTK; dkim-atps=neutral; spf=pass (client-ip=52.101.125.141; helo=tyvp286cu001.outbound.protection.outlook.com; envelope-from=den@valinux.co.jp; receiver=lists.ozlabs.org) smtp.mailfrom=valinux.co.jp
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=DmUT1VTK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=valinux.co.jp (client-ip=52.101.125.141; helo=tyvp286cu001.outbound.protection.outlook.com; envelope-from=den@valinux.co.jp; receiver=lists.ozlabs.org)
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11021141.outbound.protection.outlook.com [52.101.125.141])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drF6t72sFz2xrC
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jan 2026 03:28:38 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NPFWHAevv8ZbnFHAmeXE3npX2XXkXZ3BwXC2jgAIWPUqKIuMU9lHru3iSDSTqUyOO4AASIaPtygVExLTkq0xfr0//KkHaYTmEJN52AGlb9N1ymjN0N36SbD7/W2LYFOtzR846RIid568bPRCAIAJisK/uYdTk0lcUHTKzqN+ND0meNbSXf5GlYJIqJudQdfxM/jgDKNAc/hsGsC/2Oq6e063BR1790wd5UovO1c37BL4vzC9F3y5rUXkZZphN9S//IhP+61gy6g3dN2yK+NUIZgcr5AbjkAeV3+EM2vt2ZAeVwAbAkVRiJRjgM8fcdCx8eMaeHtsykZ8T8Vpzz4Wqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W6dqE8YYSzrsgwZDSkBSCL/W2RUCSZBG39FOEzSuysk=;
 b=dFrIsAwdBb8Lyvigg2A14FjpkQOpfuhW5Q5g4EtU+uhiOs5BIaBd+CLa3Q36dVhQhesQXQrmO9PAO2cg6eC96e8kZE8JwdxXvLf/WY072q6wzCeHQh2lABwUFSbyIEPSgKxoQJ2rik/Z44JiRsIjnTfCCgcTZY7sGEl0Iwg0BU2cx0Eo2kimqYNzEQrUPjgBvIDkwxRySZm6mqWPqn0yWWKdzuhfJ5tnyq5WX0l3Ngb8uS/mw6Zd9rleUFR/bbboFKzkqBOYvraWrl7TYIMVz5TDyExLwXwM1j8/UImPeT7AlWyAFIS9fiFtsC4JycySWOphCIHxlLT/55L2z7T2WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W6dqE8YYSzrsgwZDSkBSCL/W2RUCSZBG39FOEzSuysk=;
 b=DmUT1VTKKG5+F5gIXfRLNZluOf5hjHHEW9U1gu7n1OuI8ePOplUb2GkmksVlUY1mnaEa220v+G0/EKmTmaCIkrsET/+b1nFbH9WYVYg0oQXr79bG5QyjxDCQKjEtTXFWB7Hqrjc10txjeFk1bTbrh51pSgedxYBR+nWAjCLuwR8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYWP286MB3400.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:2dd::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Tue, 13 Jan
 2026 16:27:27 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 16:27:27 +0000
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
Subject: [PATCH v7 3/6] PCI: dwc: Allow glue drivers to return mutable EPC features
Date: Wed, 14 Jan 2026 01:27:16 +0900
Message-ID: <20260113162719.3710268-4-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260113162719.3710268-1-den@valinux.co.jp>
References: <20260113162719.3710268-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P301CA0013.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:26f::19) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
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
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYWP286MB3400:EE_
X-MS-Office365-Filtering-Correlation-Id: 652379bb-589d-4c0d-b5c8-08de52c0a428
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QNprUhTC8tfeQyvJpIzDUSoYAQ+TXolLo6gQk8o81QUNsreGcyLWaqVqMzfw?=
 =?us-ascii?Q?OUD+BRCdlts55YwRbicKu9VbyU3eNO1KBPg+1/FX6aL+ACCTJN9+YUOPpFM4?=
 =?us-ascii?Q?yGaXecDkd/bDGtmX4pn3QClUwIZzppkckt39buP51g6keZsSdrgPm3gP88nD?=
 =?us-ascii?Q?UC8KA43It3JVefYtT+cXJaic1ly1SYIcffJmQgwl4oFSgPARHOjdsXNugWRn?=
 =?us-ascii?Q?U1+KAk+aZQBRvNzycw05d4lhZPYcoEuC4vZyeiUNiqbpdtWTOa4wiQhtUvRV?=
 =?us-ascii?Q?+t1dLROrEgPsL8asW3byGXB1sx5fQ0aXj70mYoKTMqmZz9Vi38+mAV13M3/J?=
 =?us-ascii?Q?PdKpWDWlK98sykfnoUIJXkI8T8dLqNvSA7GsbBpNbxnmEJHzOENCc/+vqs1P?=
 =?us-ascii?Q?rVo0GLUZbpotTet3Is2GIWSZibh02wpWlBC4nR5GdtowdX9hPfAmmLrGeKh2?=
 =?us-ascii?Q?0NNiaO8WAQLfYwuowH/O9chBHX6HtBEBtn9K/qd2cu5hPxqKg8xvlYX9a3B+?=
 =?us-ascii?Q?2D3Oq+OAFKTEr7ATwlXprsBbRVQnJEU6P95LfreyUfmH2swBySGP/d9YPxs+?=
 =?us-ascii?Q?RwcoB9sG33/QU66lMBvKUImyhmYHDzfAyd+2/iS2yF6Ku7TRtgc3ck+bBumK?=
 =?us-ascii?Q?WRbC7yPvInWeovT4HqNGKAtXfcBUt4DnK+NS82eqP2/4C3RDdrxvoCkGGXej?=
 =?us-ascii?Q?lT/krExkxLJ9yhT9tAQJW6N7s3n6stQ+JdPaR27pixwM1fd9mY4pJtp22RPp?=
 =?us-ascii?Q?PjefURt4VAb+Y4jW9DoUjhrYhcqRfm5ektrqR25EiLtjlveMQQSSBiiVNO2i?=
 =?us-ascii?Q?2PF1CHuHe5vli11m6BE4yoiwz8+blLE95IlzDoxwex2llD278RCkX0yCZNiX?=
 =?us-ascii?Q?HJGt9mpL16km3WaibxfFBpg2SRtMZXhmFdrcxPn/CLsjQxW7Oeq+EKQJClz/?=
 =?us-ascii?Q?X4WUSWLM8ML9aFG4JqWPEiZgnf+kGCp+O4xgxe6zX+eFJg6oD+sdkiStPWuA?=
 =?us-ascii?Q?97hWBEshPMDJ9cGh1YDfGDm7A2FZnUkEfKyfk9/aW42f/PJ7SJtrdIcajBos?=
 =?us-ascii?Q?ujHF7mwuJ2K8+Z1FaiP1DT7LtlFaJ1XIXnTph9U59JgQfWQxQ7xQNCowECMS?=
 =?us-ascii?Q?8vbODwgrhHkqYT478vtPv2KOwc1pMOag13j2VBBEa36tGUyw2TMvMm4a7xkk?=
 =?us-ascii?Q?kbFHJYCwcJkhE27sxglMpBjA0yYHhsFRz3IwM1Xs1aE261ycjqK+8MN84DMk?=
 =?us-ascii?Q?tEVxYVNuMCQS/Tc4/L0ePRUmKBIrgLNE8MNyqQEWCg3ZajlHl84GNzN9dfi3?=
 =?us-ascii?Q?qdSh2o+DxeBJ24AAwQqhLutKld1yFE8sJcmJAbbUu7bs14DChMzWTH0M03s7?=
 =?us-ascii?Q?vlTk73446tpDivesKXRFgJEetQY/asLFZEzXO/WDIJjURafE5jMXdOMEZw5P?=
 =?us-ascii?Q?jQQ9zr+TE5V3zJ62vuJmkp//opWN/3Dw?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(10070799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Bm6uS5Ib5dUiW08J7LVj/d/w2ZyFMTbaF6xcXyGMMCgCNYnIQdJH+yXTL1kq?=
 =?us-ascii?Q?2SzxfLevbKaG+9+j88LfOCgPm/e+UYMnXP1mA7jtgM2+WCSO5pF7H1o7GxMd?=
 =?us-ascii?Q?0gNxHfUpH5F0sBiBAJyhbLMygaEJeoIv0Kn3md0S6gtsPVA74HqLXNi2F1e8?=
 =?us-ascii?Q?bRS2PsosGXceh4icuwrZJV7lTdALm7smVNLBoHHG4CSR6/D1vJLQR7aFIZx6?=
 =?us-ascii?Q?gGaQ47kQ1iMcfZB2i9nkvaXRDK1RqdTwcD3DMiEqGU0jdnDRwBHIEpeH6mfN?=
 =?us-ascii?Q?JP71Im26L4ptugqTYVDp8R+7M2INIscFvA1+5t9q/wjcslBxVMldJE5PK4yB?=
 =?us-ascii?Q?lxBeXsgBYJ4iMOxMNCaCbH9ilhLUYRNeCu6Z3WT0BHpTaI93dCcx2pKTDiCB?=
 =?us-ascii?Q?ef1GiREGyqEudLOayz4s3RmeTPOiRMfZ9kp3Ly5O1QnjvD7uvW45dOFqBsCV?=
 =?us-ascii?Q?KL/ZWRHiZPruzJTokZtTi7aqTCVE4ovs+bMhumNDxdcRUHQiobcyvH56FeSS?=
 =?us-ascii?Q?ewzsG0UJ4lZeBu3oaGl1NlDyEmibHDEMZCfQhSsFnPrUodp4yyuo9peY1UTU?=
 =?us-ascii?Q?Mz+IQVliQNyroWCWT/vWyqlMtysBEiAWowdiDpIVi0iXxEAQ2IZmzMZxTRa3?=
 =?us-ascii?Q?R5j5TM0KKP4uN/wlaIObsLUWpZkkZHKkaP0gfGEHRQE2HSVlqKojP6xuzJkQ?=
 =?us-ascii?Q?JaURqkp7ziOONxue0m8p333jdIPbq76pHHW014h+C0UVdtr5h1nGCmyfhlIf?=
 =?us-ascii?Q?7ZQpBCE3IscLZcQr2PLsCo/exGymjhcqli1iRPzzWm8CVkQHLSWFptSiHiSR?=
 =?us-ascii?Q?/U8TBR/c56VCNTfjqQ48NlkeRBBqEhpCTOqiRMLtLoD8V1fZye/kpS986jra?=
 =?us-ascii?Q?EFAc6Uiygrek7uxgh1gKWQvlU/7mgWl1cKno2o3XKVN7NxNjCzW5z8W92vDf?=
 =?us-ascii?Q?htx9pMMm+S8G9LM2LNPKmYEa1zhJC0Fluu46P5Ak6HzM46fRTvAMzTy8ts3B?=
 =?us-ascii?Q?buRMcYksBagvAG1PSFrCYA/HCkXRaHxU2CzGq7gfyONEv9F8/KHnqCsJVtJn?=
 =?us-ascii?Q?CQ2YGCnw9DEK6H9aGfOVSQoCb8bMxIrBe5kfxMMCdTKRf6h0LZhkaLce0xui?=
 =?us-ascii?Q?9m9isTo9XufeZmhTVNJO4OqYJjiH5PnJbuVZAKI6vkRpQkhkDMrjJETw+iO/?=
 =?us-ascii?Q?g6ktcrVBY5p5od328hCdrwRWRxj6IQ0Rga6UvQkzKZurbZZ8iCFS/xLwpdg9?=
 =?us-ascii?Q?dX+nTlN4VS2hjoCcF2aI86YuGjiBfT5jhKxeutdzKm5gqwjPSNbM3KouaHF9?=
 =?us-ascii?Q?xj7NYX6gEsqPU7H351fZgRCWI90c49kpKumwM+NyXCqg+BBGFLWgazK1e3nI?=
 =?us-ascii?Q?k//XJczMaN84zKzj6JmlX6G8aWloGnUWjCAGVGriQ7ppVkOTw6DSnjXCiRH0?=
 =?us-ascii?Q?qM5vVU5bJzp0sMr1w3mnkgiAPjINhtSkGJmrhKHw+dCPwBhXg70nAr3cdPv1?=
 =?us-ascii?Q?6F5Gx3F01eI6AtgvqbC3NwNFx5dCDtW0uYGHZyFuutPCKsD5zvveG8oRDXi/?=
 =?us-ascii?Q?wW8I35ETlvBy1zXdoezOtflJoa+6s/yDP7iAMwEdgxbF4KxoI3VONnmUHhGA?=
 =?us-ascii?Q?tPKGGXGxTEgKlZnKxZ0K2V3a3yBe+ymMptifr85bjV6dcnRvBDByjqEHtjtv?=
 =?us-ascii?Q?sTwdoNwXxZAfLiYru9lIRQJGsxQ07kVLmfdBjSe3rL61cEqWLv2EYMEwMqmu?=
 =?us-ascii?Q?lmGMooqWTCSXZg7EtzsB/LFR5UHtOOtG9BXoZmS5K2iEjp6ZcdFx?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 652379bb-589d-4c0d-b5c8-08de52c0a428
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 16:27:27.5027
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LDUS1OzyQZwPrxAf4IXvK8Ejf2SVWZ3COnRxL5V/lekIwOBTuT5T4SogPDzih1s1e4H6cnKgptMjHij9sb/ZCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWP286MB3400
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The DesignWare EP midlayer needs to advertise additional capabilities at
the DWC layer (e.g. subrange_mapping) without duplicating the same bit
in every DWC-based glue driver and without copying feature structures.

Change dw_pcie_ep_ops.get_features() to return a mutable
struct pci_epc_features * and update all DWC-based glue drivers
accordingly. The DWC midlayer can then adjust/augment the returned
features while still exposing a const struct pci_epc_features * to the
PCI EPC core.

No functional change on its own.

Suggested-by: Niklas Cassel <cassel@kernel.org>
Reviewed-by: Niklas Cassel <cassel@kernel.org>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
 drivers/pci/controller/dwc/pci-dra7xx.c       |  4 +-
 drivers/pci/controller/dwc/pci-imx6.c         | 10 ++--
 drivers/pci/controller/dwc/pci-keystone.c     |  4 +-
 .../pci/controller/dwc/pci-layerscape-ep.c    |  2 +-
 drivers/pci/controller/dwc/pcie-artpec6.c     |  4 +-
 .../pci/controller/dwc/pcie-designware-plat.c |  4 +-
 drivers/pci/controller/dwc/pcie-designware.h  |  2 +-
 drivers/pci/controller/dwc/pcie-dw-rockchip.c |  8 +--
 drivers/pci/controller/dwc/pcie-keembay.c     |  4 +-
 drivers/pci/controller/dwc/pcie-qcom-ep.c     |  4 +-
 drivers/pci/controller/dwc/pcie-rcar-gen4.c   |  4 +-
 drivers/pci/controller/dwc/pcie-stm32-ep.c    |  4 +-
 drivers/pci/controller/dwc/pcie-tegra194.c    |  4 +-
 drivers/pci/controller/dwc/pcie-uniphier-ep.c | 58 ++++++++++---------
 14 files changed, 60 insertions(+), 56 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-dra7xx.c b/drivers/pci/controller/dwc/pci-dra7xx.c
index 01cfd9aeb0b8..e67f8b7b56cb 100644
--- a/drivers/pci/controller/dwc/pci-dra7xx.c
+++ b/drivers/pci/controller/dwc/pci-dra7xx.c
@@ -423,12 +423,12 @@ static int dra7xx_pcie_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
 	return 0;
 }
 
-static const struct pci_epc_features dra7xx_pcie_epc_features = {
+static struct pci_epc_features dra7xx_pcie_epc_features = {
 	.linkup_notifier = true,
 	.msi_capable = true,
 };
 
-static const struct pci_epc_features*
+static struct pci_epc_features*
 dra7xx_pcie_get_features(struct dw_pcie_ep *ep)
 {
 	return &dra7xx_pcie_epc_features;
diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 4668fc9648bf..fe1de30b3df6 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -131,7 +131,7 @@ struct imx_pcie_drvdata {
 	const u32 ltssm_mask;
 	const u32 mode_off[IMX_PCIE_MAX_INSTANCES];
 	const u32 mode_mask[IMX_PCIE_MAX_INSTANCES];
-	const struct pci_epc_features *epc_features;
+	struct pci_epc_features *epc_features;
 	int (*init_phy)(struct imx_pcie *pcie);
 	int (*enable_ref_clk)(struct imx_pcie *pcie, bool enable);
 	int (*core_reset)(struct imx_pcie *pcie, bool assert);
@@ -1386,7 +1386,7 @@ static int imx_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
 	return 0;
 }
 
-static const struct pci_epc_features imx8m_pcie_epc_features = {
+static struct pci_epc_features imx8m_pcie_epc_features = {
 	.msi_capable = true,
 	.bar[BAR_1] = { .type = BAR_RESERVED, },
 	.bar[BAR_3] = { .type = BAR_RESERVED, },
@@ -1395,7 +1395,7 @@ static const struct pci_epc_features imx8m_pcie_epc_features = {
 	.align = SZ_64K,
 };
 
-static const struct pci_epc_features imx8q_pcie_epc_features = {
+static struct pci_epc_features imx8q_pcie_epc_features = {
 	.msi_capable = true,
 	.bar[BAR_1] = { .type = BAR_RESERVED, },
 	.bar[BAR_3] = { .type = BAR_RESERVED, },
@@ -1415,13 +1415,13 @@ static const struct pci_epc_features imx8q_pcie_epc_features = {
  * BAR4	| Enable   | 32-bit  |  1 MB   | Programmable Size
  * BAR5	| Enable   | 32-bit  | 64 KB   | Programmable Size
  */
-static const struct pci_epc_features imx95_pcie_epc_features = {
+static struct pci_epc_features imx95_pcie_epc_features = {
 	.msi_capable = true,
 	.bar[BAR_1] = { .type = BAR_FIXED, .fixed_size = SZ_64K, },
 	.align = SZ_4K,
 };
 
-static const struct pci_epc_features*
+static struct pci_epc_features*
 imx_pcie_ep_get_features(struct dw_pcie_ep *ep)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
index f86d9111f863..4292007a9b3a 100644
--- a/drivers/pci/controller/dwc/pci-keystone.c
+++ b/drivers/pci/controller/dwc/pci-keystone.c
@@ -929,7 +929,7 @@ static int ks_pcie_am654_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
 	return 0;
 }
 
-static const struct pci_epc_features ks_pcie_am654_epc_features = {
+static struct pci_epc_features ks_pcie_am654_epc_features = {
 	.msi_capable = true,
 	.msix_capable = true,
 	.bar[BAR_0] = { .type = BAR_RESERVED, },
@@ -941,7 +941,7 @@ static const struct pci_epc_features ks_pcie_am654_epc_features = {
 	.align = SZ_64K,
 };
 
-static const struct pci_epc_features*
+static struct pci_epc_features*
 ks_pcie_am654_get_features(struct dw_pcie_ep *ep)
 {
 	return &ks_pcie_am654_epc_features;
diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/controller/dwc/pci-layerscape-ep.c
index a4a800699f89..8d48413050ef 100644
--- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
+++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
@@ -138,7 +138,7 @@ static int ls_pcie_ep_interrupt_init(struct ls_pcie_ep *pcie,
 	return 0;
 }
 
-static const struct pci_epc_features*
+static struct pci_epc_features*
 ls_pcie_ep_get_features(struct dw_pcie_ep *ep)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
diff --git a/drivers/pci/controller/dwc/pcie-artpec6.c b/drivers/pci/controller/dwc/pcie-artpec6.c
index f4a136ee2daf..84111d8257f2 100644
--- a/drivers/pci/controller/dwc/pcie-artpec6.c
+++ b/drivers/pci/controller/dwc/pcie-artpec6.c
@@ -369,11 +369,11 @@ static int artpec6_pcie_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
 	return 0;
 }
 
-static const struct pci_epc_features artpec6_pcie_epc_features = {
+static struct pci_epc_features artpec6_pcie_epc_features = {
 	.msi_capable = true,
 };
 
-static const struct pci_epc_features *
+static struct pci_epc_features *
 artpec6_pcie_get_features(struct dw_pcie_ep *ep)
 {
 	return &artpec6_pcie_epc_features;
diff --git a/drivers/pci/controller/dwc/pcie-designware-plat.c b/drivers/pci/controller/dwc/pcie-designware-plat.c
index 12f41886c65d..60ada0eb838e 100644
--- a/drivers/pci/controller/dwc/pcie-designware-plat.c
+++ b/drivers/pci/controller/dwc/pcie-designware-plat.c
@@ -60,12 +60,12 @@ static int dw_plat_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
 	return 0;
 }
 
-static const struct pci_epc_features dw_plat_pcie_epc_features = {
+static struct pci_epc_features dw_plat_pcie_epc_features = {
 	.msi_capable = true,
 	.msix_capable = true,
 };
 
-static const struct pci_epc_features*
+static struct pci_epc_features*
 dw_plat_pcie_get_features(struct dw_pcie_ep *ep)
 {
 	return &dw_plat_pcie_epc_features;
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index f87c67a7a482..4dda9a38d46b 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -449,7 +449,7 @@ struct dw_pcie_ep_ops {
 	void	(*init)(struct dw_pcie_ep *ep);
 	int	(*raise_irq)(struct dw_pcie_ep *ep, u8 func_no,
 			     unsigned int type, u16 interrupt_num);
-	const struct pci_epc_features* (*get_features)(struct dw_pcie_ep *ep);
+	struct pci_epc_features* (*get_features)(struct dw_pcie_ep *ep);
 	/*
 	 * Provide a method to implement the different func config space
 	 * access for different platform, if different func have different
diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
index 352f513ebf03..1f3c91368dc3 100644
--- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
+++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
@@ -100,7 +100,7 @@ struct rockchip_pcie {
 
 struct rockchip_pcie_of_data {
 	enum dw_pcie_device_mode mode;
-	const struct pci_epc_features *epc_features;
+	struct pci_epc_features *epc_features;
 };
 
 static int rockchip_pcie_readl_apb(struct rockchip_pcie *rockchip, u32 reg)
@@ -383,7 +383,7 @@ static int rockchip_pcie_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
 	return 0;
 }
 
-static const struct pci_epc_features rockchip_pcie_epc_features_rk3568 = {
+static struct pci_epc_features rockchip_pcie_epc_features_rk3568 = {
 	.linkup_notifier = true,
 	.msi_capable = true,
 	.msix_capable = true,
@@ -403,7 +403,7 @@ static const struct pci_epc_features rockchip_pcie_epc_features_rk3568 = {
  * default.) If the host could write to BAR4, the iATU settings (for all other
  * BARs) would be overwritten, resulting in (all other BARs) no longer working.
  */
-static const struct pci_epc_features rockchip_pcie_epc_features_rk3588 = {
+static struct pci_epc_features rockchip_pcie_epc_features_rk3588 = {
 	.linkup_notifier = true,
 	.msi_capable = true,
 	.msix_capable = true,
@@ -416,7 +416,7 @@ static const struct pci_epc_features rockchip_pcie_epc_features_rk3588 = {
 	.bar[BAR_5] = { .type = BAR_RESIZABLE, },
 };
 
-static const struct pci_epc_features *
+static struct pci_epc_features *
 rockchip_pcie_get_features(struct dw_pcie_ep *ep)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
diff --git a/drivers/pci/controller/dwc/pcie-keembay.c b/drivers/pci/controller/dwc/pcie-keembay.c
index 60e74ac782af..e6de5289329f 100644
--- a/drivers/pci/controller/dwc/pcie-keembay.c
+++ b/drivers/pci/controller/dwc/pcie-keembay.c
@@ -308,7 +308,7 @@ static int keembay_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
 	}
 }
 
-static const struct pci_epc_features keembay_pcie_epc_features = {
+static struct pci_epc_features keembay_pcie_epc_features = {
 	.msi_capable		= true,
 	.msix_capable		= true,
 	.bar[BAR_0]		= { .only_64bit = true, },
@@ -320,7 +320,7 @@ static const struct pci_epc_features keembay_pcie_epc_features = {
 	.align			= SZ_16K,
 };
 
-static const struct pci_epc_features *
+static struct pci_epc_features *
 keembay_pcie_get_features(struct dw_pcie_ep *ep)
 {
 	return &keembay_pcie_epc_features;
diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index f1bc0ac81a92..6ad033301909 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -819,7 +819,7 @@ static void qcom_pcie_ep_init_debugfs(struct qcom_pcie_ep *pcie_ep)
 				    qcom_pcie_ep_link_transition_count);
 }
 
-static const struct pci_epc_features qcom_pcie_epc_features = {
+static struct pci_epc_features qcom_pcie_epc_features = {
 	.linkup_notifier = true,
 	.msi_capable = true,
 	.align = SZ_4K,
@@ -829,7 +829,7 @@ static const struct pci_epc_features qcom_pcie_epc_features = {
 	.bar[BAR_3] = { .type = BAR_RESERVED, },
 };
 
-static const struct pci_epc_features *
+static struct pci_epc_features *
 qcom_pcie_epc_get_features(struct dw_pcie_ep *pci_ep)
 {
 	return &qcom_pcie_epc_features;
diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
index 80778917d2dd..ff0c4af90eff 100644
--- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
+++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
@@ -419,7 +419,7 @@ static int rcar_gen4_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
 	return 0;
 }
 
-static const struct pci_epc_features rcar_gen4_pcie_epc_features = {
+static struct pci_epc_features rcar_gen4_pcie_epc_features = {
 	.msi_capable = true,
 	.bar[BAR_1] = { .type = BAR_RESERVED, },
 	.bar[BAR_3] = { .type = BAR_RESERVED, },
@@ -428,7 +428,7 @@ static const struct pci_epc_features rcar_gen4_pcie_epc_features = {
 	.align = SZ_1M,
 };
 
-static const struct pci_epc_features*
+static struct pci_epc_features*
 rcar_gen4_pcie_ep_get_features(struct dw_pcie_ep *ep)
 {
 	return &rcar_gen4_pcie_epc_features;
diff --git a/drivers/pci/controller/dwc/pcie-stm32-ep.c b/drivers/pci/controller/dwc/pcie-stm32-ep.c
index 2cecf32d2b0f..8a892def54f5 100644
--- a/drivers/pci/controller/dwc/pcie-stm32-ep.c
+++ b/drivers/pci/controller/dwc/pcie-stm32-ep.c
@@ -69,12 +69,12 @@ static int stm32_pcie_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
 	}
 }
 
-static const struct pci_epc_features stm32_pcie_epc_features = {
+static struct pci_epc_features stm32_pcie_epc_features = {
 	.msi_capable = true,
 	.align = SZ_64K,
 };
 
-static const struct pci_epc_features*
+static struct pci_epc_features*
 stm32_pcie_get_features(struct dw_pcie_ep *ep)
 {
 	return &stm32_pcie_epc_features;
diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
index 0ddeef70726d..06f45a17e52c 100644
--- a/drivers/pci/controller/dwc/pcie-tegra194.c
+++ b/drivers/pci/controller/dwc/pcie-tegra194.c
@@ -1987,7 +1987,7 @@ static int tegra_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
 	return 0;
 }
 
-static const struct pci_epc_features tegra_pcie_epc_features = {
+static struct pci_epc_features tegra_pcie_epc_features = {
 	.linkup_notifier = true,
 	.msi_capable = true,
 	.bar[BAR_0] = { .type = BAR_FIXED, .fixed_size = SZ_1M,
@@ -2000,7 +2000,7 @@ static const struct pci_epc_features tegra_pcie_epc_features = {
 	.align = SZ_64K,
 };
 
-static const struct pci_epc_features*
+static struct pci_epc_features*
 tegra_pcie_ep_get_features(struct dw_pcie_ep *ep)
 {
 	return &tegra_pcie_epc_features;
diff --git a/drivers/pci/controller/dwc/pcie-uniphier-ep.c b/drivers/pci/controller/dwc/pcie-uniphier-ep.c
index d6e73811216e..ddb5ff70340c 100644
--- a/drivers/pci/controller/dwc/pcie-uniphier-ep.c
+++ b/drivers/pci/controller/dwc/pcie-uniphier-ep.c
@@ -82,7 +82,7 @@ struct uniphier_pcie_ep_soc_data {
 	bool has_gio;
 	void (*init)(struct uniphier_pcie_ep_priv *priv);
 	int (*wait)(struct uniphier_pcie_ep_priv *priv);
-	const struct pci_epc_features features;
+	struct pci_epc_features *features;
 };
 
 #define to_uniphier_pcie(x)	dev_get_drvdata((x)->dev)
@@ -273,13 +273,13 @@ static int uniphier_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
 	return 0;
 }
 
-static const struct pci_epc_features*
+static struct pci_epc_features*
 uniphier_pcie_get_features(struct dw_pcie_ep *ep)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
 	struct uniphier_pcie_ep_priv *priv = to_uniphier_pcie(pci);
 
-	return &priv->data->features;
+	return priv->data->features;
 }
 
 static const struct dw_pcie_ep_ops uniphier_pcie_ep_ops = {
@@ -415,40 +415,44 @@ static int uniphier_pcie_ep_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static struct pci_epc_features uniphier_pro5_features = {
+	.linkup_notifier = false,
+	.msi_capable = true,
+	.msix_capable = false,
+	.align = 1 << 16,
+	.bar[BAR_0] = { .only_64bit = true, },
+	.bar[BAR_1] = { .type = BAR_RESERVED, },
+	.bar[BAR_2] = { .only_64bit = true, },
+	.bar[BAR_3] = { .type = BAR_RESERVED, },
+	.bar[BAR_4] = { .type = BAR_RESERVED, },
+	.bar[BAR_5] = { .type = BAR_RESERVED, },
+};
+
+static struct pci_epc_features uniphier_nx1_features = {
+	.linkup_notifier = false,
+	.msi_capable = true,
+	.msix_capable = false,
+	.align = 1 << 12,
+	.bar[BAR_0] = { .only_64bit = true, },
+	.bar[BAR_1] = { .type = BAR_RESERVED, },
+	.bar[BAR_2] = { .only_64bit = true, },
+	.bar[BAR_3] = { .type = BAR_RESERVED, },
+	.bar[BAR_4] = { .only_64bit = true, },
+	.bar[BAR_5] = { .type = BAR_RESERVED, },
+};
+
 static const struct uniphier_pcie_ep_soc_data uniphier_pro5_data = {
 	.has_gio = true,
 	.init = uniphier_pcie_pro5_init_ep,
 	.wait = NULL,
-	.features = {
-		.linkup_notifier = false,
-		.msi_capable = true,
-		.msix_capable = false,
-		.align = 1 << 16,
-		.bar[BAR_0] = { .only_64bit = true, },
-		.bar[BAR_1] = { .type = BAR_RESERVED, },
-		.bar[BAR_2] = { .only_64bit = true, },
-		.bar[BAR_3] = { .type = BAR_RESERVED, },
-		.bar[BAR_4] = { .type = BAR_RESERVED, },
-		.bar[BAR_5] = { .type = BAR_RESERVED, },
-	},
+	.features = &uniphier_pro5_features,
 };
 
 static const struct uniphier_pcie_ep_soc_data uniphier_nx1_data = {
 	.has_gio = false,
 	.init = uniphier_pcie_nx1_init_ep,
 	.wait = uniphier_pcie_nx1_wait_ep,
-	.features = {
-		.linkup_notifier = false,
-		.msi_capable = true,
-		.msix_capable = false,
-		.align = 1 << 12,
-		.bar[BAR_0] = { .only_64bit = true, },
-		.bar[BAR_1] = { .type = BAR_RESERVED, },
-		.bar[BAR_2] = { .only_64bit = true, },
-		.bar[BAR_3] = { .type = BAR_RESERVED, },
-		.bar[BAR_4] = { .only_64bit = true, },
-		.bar[BAR_5] = { .type = BAR_RESERVED, },
-	},
+	.features = &uniphier_nx1_features,
 };
 
 static const struct of_device_id uniphier_pcie_ep_match[] = {
-- 
2.51.0


