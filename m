Return-Path: <linuxppc-dev+bounces-15608-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5619D1650D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jan 2026 03:38:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqthZ726kz2ydn;
	Tue, 13 Jan 2026 13:38:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=52.101.125.143 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768271886;
	cv=pass; b=fW6WvqZ5pUXyi9l9frz9cFs6Xw1nXnejhQXTrlCDLTLWiEC4ybOxEDLe+T8/HCmMjHF7ivSsR5UMpsjx3rEkQCL/W5Uvty0MQERYaElXq5AmP5qN8B3gMAlbtFlKNXIf4art1T/UGjfDAzq4zqfYszp75Y2WpNIg/tJv7FRlP4/oUMC4Ga+SJJZ/d95iU2ReecSLUxfeXI/woP+OlEi+662iamvB4cF1UskoRA9e0597jPsHhh3JAHA49Jom8Ph5s674pl6k7a5n+FK8TDoHEUvzQ1XaDb7jtHD7Gg03he+hJnmlewNzXL5NR/jXMzs/1o5VvZHihcUBkxenm5bHCA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768271886; c=relaxed/relaxed;
	bh=FHdCwclZ92YvSuAnIfg0L9liBqe0Nkcq+I87Oq+wAj4=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=dJlvYq+xw6p7f/3/4+UU2kUVP6TSd14cmAgipopHnlu0iweZaZ0HM039e3D6TZCNJ0l/Z5wBKXG0DlTbhwPyHA/JVRJvUME9QkqYZOKTFEKz/K2Mn0LsmFtIfIbhz8ZOM73i8mVln4NJABPvOBlunj4rshWL9ZoDJwtL1WPKfzPlJ1bk4cpbMW+/debaF6h6SIOiDOlFy50v/DdN3KgZzzLJ2jIexMngpwQ58pFMAnppZbN5viKbChH+Uyih56Fwic95t4n+pm1izoOMdu6T5eINJP+fpNe6Lp2FmF6C9ANPjDFJXYgW+aqFx1Hp7FsS1bzEQex4o1sZQoyH09IU2w==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; dkim=pass (1024-bit key; unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=WN6qDeE6; dkim-atps=neutral; spf=pass (client-ip=52.101.125.143; helo=tyvp286cu001.outbound.protection.outlook.com; envelope-from=den@valinux.co.jp; receiver=lists.ozlabs.org) smtp.mailfrom=valinux.co.jp
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=WN6qDeE6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=valinux.co.jp (client-ip=52.101.125.143; helo=tyvp286cu001.outbound.protection.outlook.com; envelope-from=den@valinux.co.jp; receiver=lists.ozlabs.org)
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11021143.outbound.protection.outlook.com [52.101.125.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dqthZ2GRKz2yNv
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 13:38:06 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z/43iQL2xZi7gaf3EQ5yE23kT4NE9yojCjZix1LKEHhQofKRGxyrSiypC0InFS+pKh+Mr0ZnjMlfqZvCLdTMJutGso4AjbiAJ3U9yaMcCb9P+8e6exRlpFnF3kBIgt4VbiPtc1xdgu1AQd+WD+hdF6gBNYLRcnfq2MKZg3Kguoax9GLGmvWbBbKLWUqeMEhwg1UCtrhEh5kqW8BQQuKwnXCW7Jka6glLkdQ/gUNgZNRu8sucsgcZ/AO4Oo+VPQ0nWQrrm8s5LG7NcwFZbMhT12E2/yurppixn5eepUEDb+AAnDw/ESVUH1fEkwNFICOXGE7TiSCsE0JYSzpUBczhjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FHdCwclZ92YvSuAnIfg0L9liBqe0Nkcq+I87Oq+wAj4=;
 b=rfKy2KwUcvlMdbmnJbN/3NPQNczt83XRt52ta5dLrtALjODzTFOPShqOF1Z0o/GfiBMXokeog8LBl9j2VSw0kyiRI8Zc33admO/9od4QIUjoSLlck+iLGDadf8zRohZS5wtGqHWLoThrCQAw9UlrpL333Xj8CxQED6W/dOCNNI3AqDHtQJ/p8BLn/wXdR4AMU+oxw6B8MYcabQUXsOzRh2ovykobUe/YP8yw1GlHhP/jFOQ6XdpkJWq+KSaYiLEU3DYVkkrX4pdTKfVdxrimW9Mve8HYBP9ZQDBnR+GujNwGXHWEWc7qg9b/UEoAhNH0JQ0BatYg7aUfRSzUsMEL3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FHdCwclZ92YvSuAnIfg0L9liBqe0Nkcq+I87Oq+wAj4=;
 b=WN6qDeE6tNSVQXmREzfQcQIyV5ssFVsB5ydoMpkwqUuoHcjIxm2Alz8riNyttzvdEzq1Kgqc5qnCZR3XTrJwvJWJcavy4jcL6aPensH4laJhaxLXKAfVzs8yJsVV6OkyFM2o8hGsvvg1/DXbvbszCGgHkyNSAuudN9Z5cLbZhGQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TY7P286MB6708.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:323::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 02:37:18 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 02:37:18 +0000
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
Subject: [PATCH v6 0/5] PCI: endpoint: BAR subrange mapping support
Date: Tue, 13 Jan 2026 11:37:10 +0900
Message-ID: <20260113023715.3463724-1-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0091.jpnprd01.prod.outlook.com
 (2603:1096:405:3::31) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
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
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TY7P286MB6708:EE_
X-MS-Office365-Filtering-Correlation-Id: e9d4b94e-93a2-405d-d287-08de524cab9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1jdG7yVk5dcZm8OMSZpzew7EhVtAHhHvF/QOM4LPCEQGykHM145ybMenZdAJ?=
 =?us-ascii?Q?cCUoJ5kKM17BqbN2YkW/AdgNchlG4OSz3OUrgafxF3saUt6IjKfECmyh5AaN?=
 =?us-ascii?Q?H4f1YFf0zMK5tnW57Lc95PJDcWyqYIRyVb+xDTs2pEQ2V3S+TKszVI7PnZEG?=
 =?us-ascii?Q?v1wcgNSBW6CrVfctHedHNsI8xBYn8f9b25rjg+ON9gJHCHhjFOJCwUZ5qstx?=
 =?us-ascii?Q?HecjzdgVkC5dQdRvQQ4FcFrPpziRVPYmqiOYLsTa9dw0BVHNjvDy6jxfF7dq?=
 =?us-ascii?Q?QUYBC7Z39DlyxN3Ppxix0MfcyJOlRFOrekWTG4+D8r0gBn9Za+uI5Q8bw+vQ?=
 =?us-ascii?Q?1ZItgaH6jynJTtblnGPO/+CC8Og/y+zQhQ6AnBx5x5xIdzTQvE4QzCGYZvjG?=
 =?us-ascii?Q?vU58NICJlMaZVXFcjIoKGpPxC6Wab6Z8r7xvjrfNKybaUG6KSZqW3+oCLwxY?=
 =?us-ascii?Q?WS1pcy93K8ICwr+EGa5cWFmlStuyO9ybdxO2sAAUKsTgGMrLj4OyjVYJeyyF?=
 =?us-ascii?Q?Gw03diGenao+drDvciqCNXq6235BmYfpyhZMc8pVndJL9TF1wYFlz7M+u0wT?=
 =?us-ascii?Q?jj7/jUy1v1eo4we4Minem8rZ6VH7qzVEUmutmOjNKCZRnryM+tN36pSTzKNr?=
 =?us-ascii?Q?jALMIoGDzr7+NiwB4oG9wGjRq/86qOkgrSYtsbRG9e2VuP9FKHgEORq9zOmX?=
 =?us-ascii?Q?2R0djZ3XsjcUaeWWRvSNvEsfqvjaB9ij6DOvi/GCBYBI9DGVP3zxaQ0Qfv7c?=
 =?us-ascii?Q?mKULWOOmSKP4sK3Lc9lOWrx8ghp/YKRl6zUXppoBmCR1PbHh9fyg2yarcZ2Y?=
 =?us-ascii?Q?QkGgG/2E6jFobR3Rs+VimcltDTu/Ax/PvN7fBaPzBX12aaiSC44mJ3gbQoxP?=
 =?us-ascii?Q?6R7FpJ1CfLaRd2E3B7zuIe5WlbNjoUiA8NnPEZds+wUQu7yFY8UYZF5BXf55?=
 =?us-ascii?Q?aiOECbxRm3K9DcqQqMNDTano/TNzobMLkIMNCFFQp0Z+MA3+UYGEbXZrAqO5?=
 =?us-ascii?Q?ZpM02jxTfWs7EVkqDm6FE+Xi5b4iyFEX5KQYyKgmhG4/BVKRRBXtOeQ8xVsk?=
 =?us-ascii?Q?ku7d++Me9se7q3Rn2bEFHqshLXMpXkiwtjJZU2qxg5ZJuJO0FRSNiKQs2fIN?=
 =?us-ascii?Q?6oJYB2kNcdfndWx3fSdZDec1/iiwWaJeWayhWTa8X7xRDO6FCRIqZklMixhr?=
 =?us-ascii?Q?05F0dDJUdzM++9jNIbywX0+GSSfi2aBaIZ62JOctA0wFlb7vL0YBMSF84Mom?=
 =?us-ascii?Q?3c6xZktppWaMAaJTk6x8lAQguMKr4nH/u1vu6MxkJsdoInL7vxjyHKJo6MPO?=
 =?us-ascii?Q?TCmDxsoYXiouv3fOsd9s/k9btDf+oqU8uAF2KF64lkTAWqDLUybr8qH6fEWd?=
 =?us-ascii?Q?PO/Z+3gkRJFBi9P3bNsfzn/9ijCZmhiMkFS96+uVIrPGu8yGkEBtsdEUc8d0?=
 =?us-ascii?Q?KDJlO+QnfErdEvxhCsKb/J1gk+qqcKgE?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(7416014)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Nsb1BISxhA7fAGB9+whGbD8bDOlziyrm/Xw1MV7B8fAq0tgbECUU4IQGEEKy?=
 =?us-ascii?Q?IYXecI65oKRlYZ9bIDPHoE39V2KdQFhsXnDlNvpHmbpETalbS9KB7SOdDsIx?=
 =?us-ascii?Q?9NFrbfX+esvOKugKkfg3rp0aHsFoUsAtIuFJYBMOrbpN+si+6vppaXFdRg5o?=
 =?us-ascii?Q?IpH/NyIC18uZNB2hEFNeUKKcVsN57VjCwmjTLCMdTDxvx9/GhHxh1M3poCPF?=
 =?us-ascii?Q?Iu3eFgOi7Ol+Gq9oezHnP1Y0Xu7GPKi9pPop4gGGzAtrYGkg62ZEWVY2TjA8?=
 =?us-ascii?Q?ISFkIpx4URwYB+PzwUIEE+xVFO4+8Zh+MbQdR3VZkqK9t+VzhcV1yrfDroeO?=
 =?us-ascii?Q?UEzPQde5l4Bo+rCHQLS4IyFM7AaKyPmVinxsr/pz3RM/v6dgZyls98fqA8+W?=
 =?us-ascii?Q?EdyB1I3N0xDb7wZ3m6ipbFsOUDmEEF1UyaxVil37cNa+ouYvErdT72G9kTZg?=
 =?us-ascii?Q?U+fcNF0/5+8Kk3x/WpJNKvDM/JEBgfDx4v84uUfm8nCcvSue7MruzsNQYlMc?=
 =?us-ascii?Q?1n50lFnJFy1TfKN3EvRKrmONbLxsB0cAu/A6LEbsheq4aLWc9G+tX2hO7kDs?=
 =?us-ascii?Q?/PFTsBoti9Z88fIVjpycarnG/W8aSGndvXxAsNzgwTdcc88UZ1Iz6Z4Rcm8R?=
 =?us-ascii?Q?w6cMSDGAjPMRBcQwt6f0/yWlldZBAJFAH19EDxQEUdr2docqHi776WQn54bY?=
 =?us-ascii?Q?DNijbLbvKalFJBSbq8a2PaRJiHa+L/L7kITEjBoIh3gMkG2r739kT8AnNP49?=
 =?us-ascii?Q?zoQJvgsSwevR1pnvkY4ICrUCrqq1jhRfqJGPAr7gJVkVPZXvBfsw/xjhl+tY?=
 =?us-ascii?Q?d4RcqnAeM5QoOef1N7leTT8spOLL53fIWbqeuTM7tgmRTyn0myLowt6OQKkh?=
 =?us-ascii?Q?LgGnmmJkn3ChAwID90PM01taUjvHHtemxcNjB0BrQU3R3d/FUu2B0LfZzc+b?=
 =?us-ascii?Q?teD17KXDXyZec48OBZo1wxKvrzJJwidQNyrI7DB5ntDfh6mgfCEDpITyXQ3U?=
 =?us-ascii?Q?q9cuOfjTG8qJBlCbXVUqcHq4Rk6sPolM3a6Nh0afAG68KMNmNCoJCbmqR0zP?=
 =?us-ascii?Q?e3tJ8IiKELaTaYpezB31qyi6FYyFctvcwfyTt/GCQ9Vw/ur1w4wNj9i99cbs?=
 =?us-ascii?Q?ndNAjIbu8BlDLYEE/rXrcXwR+k7ptLn/qUvxGFAUfU9A1HchlEDJr1L25eq2?=
 =?us-ascii?Q?2jG69GfMghj2jKn01OskmZ0WZGOOOcE9e8Wv93ru1f1E/2CavJwHNuX71R5i?=
 =?us-ascii?Q?1BtxHaosr/C8V48V9/nXmxmwncMlByLx7u1ZMrbsGkZxNO3zPne/iCm1awmc?=
 =?us-ascii?Q?R86nd94+oyEBxeeYAVf3W4cz/ecJXvYyOFqgJEOVKsy2K2LarWZvM+vyvubJ?=
 =?us-ascii?Q?H9xprd0VNoQZ7myZEsvpbqOiHTcDZh7kMZuIci4IZh8ufIp/j9pJ1PbpO4oT?=
 =?us-ascii?Q?CFbJHxXRNv1Clsn7O5shjz+VezGbilRDC6ICjrMeUXgoAO2CN7jN2vJ5CLjk?=
 =?us-ascii?Q?JPkj8dU4EwsUmLKgS8oItsU1kmxdpGEaZBmhqEIbXpGVCSH2rUIVCoNEZzSt?=
 =?us-ascii?Q?+HNYLUnI2+s39vppVt3Z0Yk5sfDQuLvMT7P2kg2zwxPVqpLtvIVRq8JkKby6?=
 =?us-ascii?Q?gvTTngELWqA6t4mUIoc8lyRyRJC8rHHhD886yyFlYRiTvKmqgNySKj118t/0?=
 =?us-ascii?Q?5VXDZP6CM4aZT4uLwX9NaUVbZ5mAQrXUtORXVholjZwtEWOhWEvJKMfjyCvv?=
 =?us-ascii?Q?Z3+EEUV+PFwVCawueX4rnUS7tRnFvze3UOdL/0LsDgKrc9gx8OFP?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: e9d4b94e-93a2-405d-d287-08de524cab9f
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 02:37:18.4302
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UlO8ROWIkamA+f58Zjye8Cal7dLGsrL1jKlt3Jgjw6KuX9iSjjbHSmCu1jSCw7z/hkufYIIO48kE4F7WN/kq4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7P286MB6708
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This series proposes support for mapping subranges within a PCIe endpoint
BAR and enables controllers to program inbound address translation for
those subranges.

- Patch 1/5 introduces generic BAR subrange mapping support in the PCI
  endpoint core.

- Patch 2/5 changes dw_pcie_ep_ops.get_features() to return a mutable
  struct pci_epc_features * and updates all DWC-based glue drivers
  accordingly. This is preparatory work for subsequent patches.

- Patch 3/5 introduces dynamic_inbound_mapping feature bit. This can be
  used as a safeguard to check whether a BAR can really be reconfigured
  without clearing/resetting it.

- Patch 4/5 adds an implementation for the DesignWare PCIe endpoint
  controller using Address Match Mode IB iATU. It also advertises
  subrange_mapping support from the DWC EP midlayer.

- Patch 5/5 updates a documentation for pci_epc_set_bar().

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
* v5->v6 changes:
  - Added a new feature bit dynamic_inbound_mapping and set it centrally
    in dw_pcie_ep_get_features() for all DWC-based glue drivers.
  - Updated documentation for pci_epc_set_bar().
  - Dropped a needless and harmful dw_pcie_ep_clear_bar() call on the error
    path.
  - Fixed "Bar Match Mode" to "BAR Match Mode" in a source code comment.

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

v5: https://lore.kernel.org/all/20260108172403.2629671-1-den@valinux.co.jp/
v4: https://lore.kernel.org/all/20260108044148.2352800-1-den@valinux.co.jp/
v3: https://lore.kernel.org/all/20260108024829.2255501-1-den@valinux.co.jp/
v2: https://lore.kernel.org/all/20260107041358.1986701-1-den@valinux.co.jp/
v1: https://lore.kernel.org/all/20260105080214.1254325-1-den@valinux.co.jp/


Thank you for reviewing,


Koichiro Den (5):
  PCI: endpoint: Add BAR subrange mapping support
  PCI: dwc: Allow glue drivers to return mutable EPC features
  PCI: endpoint: Add dynamic_inbound_mapping EPC feature
  PCI: dwc: ep: Support BAR subrange inbound mapping via Address Match
    Mode iATU
  Documentation: PCI: endpoint: Clarify pci_epc_set_bar() usage

 Documentation/PCI/endpoint/pci-endpoint.rst   |  22 ++
 drivers/pci/controller/dwc/pci-dra7xx.c       |   4 +-
 drivers/pci/controller/dwc/pci-imx6.c         |  10 +-
 drivers/pci/controller/dwc/pci-keystone.c     |   4 +-
 .../pci/controller/dwc/pci-layerscape-ep.c    |   2 +-
 drivers/pci/controller/dwc/pcie-artpec6.c     |   4 +-
 .../pci/controller/dwc/pcie-designware-ep.c   | 240 +++++++++++++++++-
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
 include/linux/pci-epc.h                       |   8 +
 include/linux/pci-epf.h                       |  31 +++
 19 files changed, 355 insertions(+), 67 deletions(-)

-- 
2.51.0


