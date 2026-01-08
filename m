Return-Path: <linuxppc-dev+bounces-15433-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC639D06286
	for <lists+linuxppc-dev@lfdr.de>; Thu, 08 Jan 2026 21:46:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dnH4s3N69z2yK7;
	Fri, 09 Jan 2026 07:46:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=40.107.74.132 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767893091;
	cv=pass; b=OmDd418eRVwFYoKS4VXJzxDmQbPFhomX6QWlCQOcJ2XuyoqlaICEPmcPqlhoug3Z9cQX7zLLGnUzT80G0iQY5ZDnSrRmJuOqT4asXL2EyUQdG1uNCvxTdK/TQ63IxEeTqPW0pPxVqXlA6xuRsjv+agQ1Fl9pyMXgEJRUHH1oI1udnY5iVAr6sVW3+DB00M1KVCqNlwmQJ9jn1WkL5xQZqWddQeW+5/jzLxI/lVBxayyRVs4adc7nPR/0V8+zOsgC4qR/PvPjtpOkSUKLSeXxQD2Es0qd6fZ8wThLNO2SrGy0F0miz3PWooQ5dlCwwF5so113HQeslQwicvDx0z2UgQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767893091; c=relaxed/relaxed;
	bh=NEnGqyk6kWbwWBWQHmxCSy3uSyBj0wKlATqMBiyBvoo=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=FS42AOjXsga5IosHonkLB/liV5yAwBzOKbxj6xe0hDCa3a7ua9hkn9PzBxCKCu42KXSMq2Z7aWvKpHAQjIcgKEIWmSwe02aYfSdraRji7K+u4S/3xE3HA7UAtU/A8WUEFU0I9anWZoWIcXP+3ea1/QUIsrtay43rkJ0P98zFge5cxm1GYv0v7iXFWk24KJR/SX3Io14GyNowIZMlQ3L4LughYB/EEh6Parmw9BkjgkXaJeCgAYgiAMwnMGi225kYYobYzAfRGdv2T50jrAmYlJ+bze+tgPy3hVysXDP5kjfbQr6wiKx5ZNgBcmbsA+hrd2rRZ8ufzC7FF+mJc+COKw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; dkim=pass (1024-bit key; unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=HUmuBHkb; dkim-atps=neutral; spf=pass (client-ip=40.107.74.132; helo=os0p286cu010.outbound.protection.outlook.com; envelope-from=den@valinux.co.jp; receiver=lists.ozlabs.org) smtp.mailfrom=valinux.co.jp
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=HUmuBHkb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=valinux.co.jp (client-ip=40.107.74.132; helo=os0p286cu010.outbound.protection.outlook.com; envelope-from=den@valinux.co.jp; receiver=lists.ozlabs.org)
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11021132.outbound.protection.outlook.com [40.107.74.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dnBc06sdvz2xGF
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Jan 2026 04:24:47 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aH+Seh9bWW92bSaQO6bpCXgDwxjx/9XlIj9F90ARvJMyUF84LxONc+e9eB2lrNEr4sbP+0LeOfls6OG2L4tLX7deNZh6IZrA2yDruNiEwhWMybExDBCcUmdWFsoFyZQjNMlaQFlI6mPblDxnx51Uvbby0tZSm/2dwrE5Yb9+1AXHrZudVSO+Ga/ug0W6pgfOsRtyIzwIM8kM9w1hiCkfKUxPV/6UGeKHFkL6B+l0wzpbvCU2tEgEix3J5RNAsx8mhIio4aupNle50CbF5egytptfiQVCOHEXfGnn7cKCV45eHRgCz1sGuGuuMhSch6TxJXq/LQYi2cxWjIdfeFCC4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NEnGqyk6kWbwWBWQHmxCSy3uSyBj0wKlATqMBiyBvoo=;
 b=HNhTDSokU5VRr52fJ62dQrHsrCaZs+BbaSfiWtx8g3T4Pb61aPD3T84d2+EhoE+zRVpOn7ZThSjVwo93/HwtZjshQHZL9scT2s8w3u2v4nHwEzftE6levwJXFN4phDo6ms2tsGtsI87IDh0FNTg0P3dy/U7fNCmCdeinbgAq+nmf38qXSO1GqbUi2XTrvCbaxsblFe+X0bOGEamAN55xsdBL/CP/v7DyGJpNly/ls00TbvD/PG8kWzoudFG5LrjwuCPqH/U8vlwbPfFszNn6PEMOEJRA1Tdj6yZs68sERhhxrlEtvQ6tA5gHrmUEbLKJRIU+CkaU2X33PvlhrzlrMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NEnGqyk6kWbwWBWQHmxCSy3uSyBj0wKlATqMBiyBvoo=;
 b=HUmuBHkbSw9L9MgUsUCvFuOCkUWrhtpgh30k5zpH/dSr7u2VxdQ5GRI3Vj5TNirBpdvnejl1k4DTPccq6Ix4Gkulj2+mWKaKbQSjlItQJOVSwdxupO4vOfG15VqethTak41TFzxK71euI5qJqVpAAYDU5FqSlQtLJEu4FF6mOts=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYRP286MB5284.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:11a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 17:24:06 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9499.002; Thu, 8 Jan 2026
 17:24:06 +0000
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
Subject: [PATCH v5 0/3] PCI: endpoint: BAR subrange mapping support
Date: Fri,  9 Jan 2026 02:24:00 +0900
Message-ID: <20260108172403.2629671-1-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0105.jpnprd01.prod.outlook.com
 (2603:1096:405:378::19) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
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
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYRP286MB5284:EE_
X-MS-Office365-Filtering-Correlation-Id: 93caf446-6a3c-4075-dc4d-08de4edaba11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tSN36dROWGdRLv+n1OUKz7NB1wHKUXZjUWo2LLM7djRXrq1LT14J4bf2pRnQ?=
 =?us-ascii?Q?kKIb6w2NiRQoIbnfDwBFMiN3ZenlJL9Bfk2v+DqxqRRnZs71iJ4NeSi+2PmI?=
 =?us-ascii?Q?TfaihHMrLxsjyvfcAdRLZjnYj7sS58Sr7TX3YfdkyBIkxZJtElI3pwjXtHWf?=
 =?us-ascii?Q?SS3WFG9oIxmkTWX7q2FZCfeSxFy13twbXU0E3wAdqDYQdeu3XcMgTBUNGU9b?=
 =?us-ascii?Q?RCFaIzQD47boX6bFSYeuQnBmF0cEhhRG0297QP2CmYEy1MQLYU3mXpMWugsx?=
 =?us-ascii?Q?YAVGnVEr0mwryunXKEdCpDCxQR3WgxoCuzDE+fhNKOEIY75iy2Yy73dmzlHk?=
 =?us-ascii?Q?KIOOqV4iRT9yxyqFQuBrLlv5KtjzPPxzOAg7gHHhkfqa6K1lc4TaWAExsjOF?=
 =?us-ascii?Q?cE4wEozYO/Dq/cvSVxJ56YExiSGhR7S/rDLCvhY+JPVEVnBHu6Hp0mRP3utJ?=
 =?us-ascii?Q?WJALri+EX3PJ4usJExrn42YpzWTsUEVETzAR56vCZXU0DeGweooLCYIdXPYZ?=
 =?us-ascii?Q?I5queMRgf1uEbZcg52XDnrgF9DH9lEavbjsOHu4pGg67+OY71StEFM9J+YT2?=
 =?us-ascii?Q?ge6+aLYyqO/jw2ZqDfJ6me5Avli/uFZgw6DXFrbNjZ38PfkizBp09WPggdAQ?=
 =?us-ascii?Q?5q7dFTAOVxSSqJlcqPzMQc1La+PW9sjARGRAOLvL6UcFJVkSlBKIipwSTIsU?=
 =?us-ascii?Q?aOxNElgcF6mtYK4KuOL0WvvVCW2MAsn3n8F50G3iv9wGhroCMf+DnxzFMXWn?=
 =?us-ascii?Q?6OFJtsvZe2nErW3uxvUqF/CT9pmhOSKY5m2gkLnXJ0463OyAUvstUuLSYBtF?=
 =?us-ascii?Q?cxb2JsG0Zy3TF4G00fD6EcQ5ChU+IztSYiMAFL4Z9JGjKWZXNDGuMn2HX8P+?=
 =?us-ascii?Q?UFf4fIFV2D3qKnoAbbPzFnQI+6R18LAXQjNvD7FezZviTqGdK4WgvmfTF1JC?=
 =?us-ascii?Q?DZijq5rsBkS89u2rwC54H3VfvbSNb7KDC6SadTrkK8Kj8KlX8e9OBhthgYo/?=
 =?us-ascii?Q?sFNb3I5O5NFPPPovnBnMF/VTGxdFQH7waLHhCqvvLPPRah8HdSLZ1c1nKZuL?=
 =?us-ascii?Q?7cnXMR+xB1yzhSTwtEseKuaMQv4WBaWdaV0VQdCRJB2vjFLujUfYy5P9Y3zc?=
 =?us-ascii?Q?IViuIvWS+dCGyJrSyiSEVSY10niGwZTThqiNj+cNOpAweaDS2cc/UV/LiNTl?=
 =?us-ascii?Q?ftzrpynVHSvgCwUsTGFsd4kEIQ+zVzlJCBPBOhx9+V/uDe9NTaST/GOAYwcG?=
 =?us-ascii?Q?n33iMBUfV6yUasSf0yy84azQIxWX7Aeh4unBG7O443ZhY/EGnj+IHFSybhtz?=
 =?us-ascii?Q?xaJB8Smar8XdCKzc1u76IQ+Vs3/iv1IyOwPr+nktK+YG57XQRrKjdaNEL38s?=
 =?us-ascii?Q?1KkBKUeviMF+j0wBLtNc6CngFpsrug5hwKuW4LPZtlcohlGEC3VrCTqSs8Ui?=
 =?us-ascii?Q?zt8+fppNsfCW7XHUfRTtPTm+aodLdVbVferOeODZ7TWE61R1lmxUiw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(7416014)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lCV+TN8Ur+k8pvzRPQpmZ4Ryp1IKLi8ezdWdC+TXmh9VJ4tR+JNyphJw4jlN?=
 =?us-ascii?Q?ifAyyVpj/buj6hLFvV99rO9U06hJqHYI4LF2kX460GwTyGWis0uNa0ySwQup?=
 =?us-ascii?Q?cFWmjqVKeGKiOEEmZ4H1/Z8ghtl8Gq+dDBI8wQK4EUYu2G60RLNIA5g6QKqP?=
 =?us-ascii?Q?19gQLLbRZhSBDuuxMhSq/qxmjf+I/VmBoU0OwW4YG0aMu2oHiW16RU1cUOzT?=
 =?us-ascii?Q?0ZKxBsM4P9Xk0X0rRSjoccp9MnIPUk2JwHd5f6H520nMdEIGFHfHeIkznIFu?=
 =?us-ascii?Q?NB/fidCUT7UqR/b2IZPEULX5X9EMM7vlUa8K0TPlunm4K2CY47qSLa9KYxcz?=
 =?us-ascii?Q?ge+gJp4Hv+957sVO5ouhr/ahep3la9CgSTWn6g+bn3QIFnz1DROsixwwnRmA?=
 =?us-ascii?Q?Xx3iEJQHFFz9l2wLx/J2QKt0Rt7cIHPjM48oLCT7Lb7l8EEbZIB3QWjsIggo?=
 =?us-ascii?Q?Ksv9VpukxC/NGdpG6YznmT0KYeIoIW5ZkSFnB3txzOLEJImhZeptju1lcc8L?=
 =?us-ascii?Q?5BlYdrPc1/sETOh2kosLykZFSCq2J0vuXRWS2FQXsDxyz5O790RGa+u+4UkX?=
 =?us-ascii?Q?oBSfHjD0X1lHWe62IE8b3KNKBB2Ud2GaoPq3tA4ZqMQvRaJnFo0P06AHXcU4?=
 =?us-ascii?Q?G9Ll+srr/uJDRXrbFR7xa1rLL26g/BznssZr/8L75g0k8VXSMQICqF078B06?=
 =?us-ascii?Q?ueDd9NeU1GKUWK+29d8d5NGEp/GRDsFfhdqFSl7uJpDb1SZKPAEQCUIj6LMT?=
 =?us-ascii?Q?184bmyTTUTjpCNRFcgFMp5ZWM9ZBOBJoqC9OjvyxX9j5SWlXg1jdakH/1FFA?=
 =?us-ascii?Q?OuRBW/Ge+pvy3/K3TDyf46tRfwuew6kNe88c+uaOouFsa72WZ7zcetagyQ4i?=
 =?us-ascii?Q?FCzV0Yz4bk8mFrpRNfePvMftFk6zhBBQy45bQa2rr+MPwqD+yqK1IeDClME/?=
 =?us-ascii?Q?LM/s6tJu5xwzck0hAWQiK2aBWNbxoBTc339kS+Z/RUBFByQPeoL773UfvomW?=
 =?us-ascii?Q?tl0ocqhRAGcIbd9tHcMDzzICXfphS0cv5TxrcChloPuhEDkksw+1178rZe4h?=
 =?us-ascii?Q?M81Ini63KYFzuJBToo+HtqCjO87d7q1gBNXHaSFjuGEKNWNZPoyXmBXl46G+?=
 =?us-ascii?Q?rgToIbpJgp1ZHqjc5iT9jQRFT/ZZXLFE2whtrxN0AllKbXcK8jSmmjR7xuGY?=
 =?us-ascii?Q?zOF5i1UQDP/WftUTKuWYCY1fLfk7IOUCyEOl0NG4qlxTMfBC9LnR4JST2hXL?=
 =?us-ascii?Q?Gqk7FJIK9rgjXoprN3JEkuLxC6xlSgobI0KsDLKsCm6fQVSXvLA5pB7gaY/A?=
 =?us-ascii?Q?V2AgPwraVLRTfiS4ZFrGscSTOrf95fwebqhtTx3b3LGXnZVs9bQ1PEyctoWc?=
 =?us-ascii?Q?E7p66aFoqaWqo52Ug2qupf1XRB2wNty0yozVmObo8ZKx54H9cxILaI+VZJmJ?=
 =?us-ascii?Q?rncrwf2hOKl0jcEQCZAh4nWol6QzOKPkg1PHa2M2EOyJaxCiZZlJcgY+pv+/?=
 =?us-ascii?Q?QwMzywumdzle+QzNJZiXprJrEmmSGX9lLXbca6ibRHJdZBPydT6AgL/WmqYj?=
 =?us-ascii?Q?exKcs9H5mXASuaSnjx2FhruIHCykWsXLePM6tOF8zZhgKXBRQb8owc2IBSJf?=
 =?us-ascii?Q?4aWPCYOm3Zke1JIiQw1WAm1OsBXUTYFo0YKVf7X8Rsk0hG8JVe06qHV6aCbM?=
 =?us-ascii?Q?G0cWMuu8wFfEQrNG3+dp2joGY7mn+Vhsz9b9AAbeg+TFRHAm9QQrrjo7pzvf?=
 =?us-ascii?Q?pAtOp3xNbTMNJF1W1A6SV4dw9R+a7CfgY8+nIzUS0MBq6lHG3vlB?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 93caf446-6a3c-4075-dc4d-08de4edaba11
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 17:24:06.5299
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bP+BHahR+P6xYBpeAvVh0JOCdd9EA6buoKRyvZ1UN1V6l9hJCvwnDqlk/nFJHxAqyYMkub8bpWG+qrUB+/r10Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRP286MB5284
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This series proposes support for mapping subranges within a PCIe endpoint
BAR and enables controllers to program inbound address translation for
those subranges.

- Patch 1/3 introduces generic BAR subrange mapping support in the PCI
  endpoint core.

- Patch 2/3 changes dw_pcie_ep_ops.get_features() to return a mutable
  struct pci_epc_features * and updates all DWC-based glue drivers
  accordingly. This is preparatory work for Patch 3/3.

- Patch 3/3 adds an implementation for the DesignWare PCIe endpoint
  controller using Address Match Mode IB iATU. It also advertises
  subrange_mapping support from the DWC EP midlayer.

This series is originally a spin-off from a larger RFC series posted
earlier:
https://lore.kernel.org/all/20251217151609.3162665-4-den@valinux.co.jp/
The first user will likely be Remote eDMA-backed NTB transport,
demonstrated in that RFC series.

Kernel base:
  - repo: git://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git
  - branch: controller/dwc
  - commit: 68ac85fb42cf ("PCI: dwc: Use cfg0_base as iMSI-RX target address
                           to support 32-bit MSI devices")

Changelog:
* v4->v5 changes:
  - Added subrange_mapping to struct pci_epc_features and enforced a
    strict capability check in pci_epc_set_bar() (reject use_submap when
    unsupported).
  - Changed DWC-based glue drivers to return a mutable features pointer
    and set subrange_mapping centrally at the DWC midlayer.
  - Split the series into 3 patches accordingly.

* v3->v4 changes:
  - Drop unused includes that should have been removed in v3

* v2->v3 changes:
  - Remove submap copying and sorting from dw_pcie_ep_ib_atu_addr(), and
    require callers to pass a sorted submap. The related source code
    comments are updated accordingly.
  - Refine source code comments and commit messages, including normalizing
    "Address Match Mode" wording.
  - Add const qualifiers where applicable.

* v1->v2 changes:
  - Introduced stricter submap validation: no holes/overlaps and the
    subranges must exactly cover the whole BAR. Added
    dw_pcie_ep_validate_submap() to enforce alignment and full-coverage
    constraints.
  - Enforced one-shot (all-or-nothing) submap programming to avoid leaving
    half-programmed BAR state:
    * Dropped incremental/overwrite logic that is no longer needed with the
      one-shot design.
    * Added dw_pcie_ep_clear_ib_maps() and used it from multiple places to
      tear down BAR match / address match inbound mappings without code
      duplication.
  - Updated kernel source code comments and commit messages, including a
    small refinement made along the way.
  - Changed num_submap type to unsigned int.

v4: https://lore.kernel.org/all/20260108044148.2352800-1-den@valinux.co.jp/
v3: https://lore.kernel.org/all/20260108024829.2255501-1-den@valinux.co.jp/
v2: https://lore.kernel.org/all/20260107041358.1986701-1-den@valinux.co.jp/
v1: https://lore.kernel.org/all/20260105080214.1254325-1-den@valinux.co.jp/


Thank you for reviewing,


Koichiro Den (3):
  PCI: endpoint: Add BAR subrange mapping support
  PCI: dwc: Allow glue drivers to return mutable EPC features
  PCI: dwc: ep: Support BAR subrange inbound mapping via Address Match
    Mode iATU

 drivers/pci/controller/dwc/pci-dra7xx.c       |   4 +-
 drivers/pci/controller/dwc/pci-imx6.c         |  10 +-
 drivers/pci/controller/dwc/pci-keystone.c     |   4 +-
 .../pci/controller/dwc/pci-layerscape-ep.c    |   2 +-
 drivers/pci/controller/dwc/pcie-artpec6.c     |   4 +-
 .../pci/controller/dwc/pcie-designware-ep.c   | 242 +++++++++++++++++-
 .../pci/controller/dwc/pcie-designware-plat.c |   4 +-
 drivers/pci/controller/dwc/pcie-designware.h  |   4 +-
 drivers/pci/controller/dwc/pcie-dw-rockchip.c |   8 +-
 drivers/pci/controller/dwc/pcie-keembay.c     |   4 +-
 drivers/pci/controller/dwc/pcie-qcom-ep.c     |   4 +-
 drivers/pci/controller/dwc/pcie-rcar-gen4.c   |   4 +-
 drivers/pci/controller/dwc/pcie-stm32-ep.c    |   4 +-
 drivers/pci/controller/dwc/pcie-tegra194.c    |   4 +-
 drivers/pci/controller/dwc/pcie-uniphier-ep.c |  58 +++--
 drivers/pci/endpoint/pci-epc-core.c           |   3 +
 include/linux/pci-epc.h                       |   3 +
 include/linux/pci-epf.h                       |  31 +++
 18 files changed, 329 insertions(+), 68 deletions(-)

-- 
2.51.0


