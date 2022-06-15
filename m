Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 707E854C169
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jun 2022 08:00:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LNF5W0yGwz3bwk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jun 2022 16:00:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=sQYMIO/C;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=hotmail.com (client-ip=2a01:111:f400:feab::813; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=wenhu.wang@hotmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=sQYMIO/C;
	dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01olkn20813.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::813])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LNF4J0R2Pz3bqg
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jun 2022 15:59:10 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TbsY0NLWfSjDzwUeJaeLwj7TjXiu5Xo4BuTHK0Xgij62RjRE96i0kB7IaNsrqN+HHtWcHiOc1r4RgC4Oq4AJ4bn1jZLY9b3DFAKHMYQsdt8WgM4Kjr2tAsiNwsKOWNV/42HjxAwDhwYhWu68zr1isEZj1brRkA4eZfFTJrgHlijPYJruWaETHQVXToFpkYRakdd42euUwJsBeOY5CHyHfUK3aCcon2g3U0LCIzjiS5ldQJW8Hkvy2nZ1HFVg5NoLBAn5T0p+j5g8Sf/tBYu19GppsF00Wpie2umOE/QEI1BnH2uEYveBoQyP27pQBdAMMmBuqP7q6FVOfCKgaSOzqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kA8/IuLqP59nQUuH48k/jN1J40Mwg2cPNtoPi2uNK0U=;
 b=ZmAe+cHy2W78s9O3a3uF66OfGyK0sdR3AUgDTWY7ooYfA86KfxzdoEM8snWzYtOLJOQV5/jsyaOFJDxMKS6rqIqeVauq1Je7frI7K/bQHOeK/0Xd8bvGMUBzns/8kX3iVsA5iWd2Q/hdAwy1K+AB/BkCtYrs1d2tO0XS4/Q0Vn6DW1jSX4pXkrn7Re2Vx9vsmef1t7E9T4UsrqM6h7+r3p5bYNL2A6+S0aKfe9EaF9EnzbyUAfD2zYLBY2rolNHmOrmaYtSqes91IJF8tkuwb/TrHMgW/m8nn6fL00p6kC92+KoNirai7tDT8+m71NFQo01TZeOzwtE2IaHROOdHZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kA8/IuLqP59nQUuH48k/jN1J40Mwg2cPNtoPi2uNK0U=;
 b=sQYMIO/C3XGNsk834jB9aqTHSxq5AOi0vcHSVr0bxlq7IyMthxfuaURloBVkeu/449i+tMPuMgFXiE8N9zf1k6jGJIeekiSydQfpMkDi3ZvniF9QGeNGh/TshoiukEb53GZ8bWrb0mYdYZIVy0+1rLU2LAYeuUzRvmv4IFQ+UlokyDx7DIJ4dkD7ypiapf5mfR/y+A9yby27O4UAYtvE1ZdJyso2BawrkgJ1Sjx8PNDHG973VVdhd46d4mo/6D4zRn/bbopiuOn3ye/rOjSnjH9uMjdvCi/UotBsLE1Cpv26AK38xG0hzFxcJWNtdE/nhyYrarxwhfhZiFvm0sKJ2Q==
Received: from SG2PR01MB2951.apcprd01.prod.exchangelabs.com
 (2603:1096:4:76::15) by PU1PR01MB1947.apcprd01.prod.exchangelabs.com
 (2603:1096:803:19::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.22; Wed, 15 Jun
 2022 05:58:47 +0000
Received: from SG2PR01MB2951.apcprd01.prod.exchangelabs.com
 ([fe80::a1f7:b32:baa1:3d12]) by SG2PR01MB2951.apcprd01.prod.exchangelabs.com
 ([fe80::a1f7:b32:baa1:3d12%7]) with mapi id 15.20.5332.022; Wed, 15 Jun 2022
 05:58:47 +0000
From: Wang Wenhu <wenhu.wang@hotmail.com>
To: gregkh@linuxfoundation.org,
	arnd@arndb.de,
	hao.wu@intel.com,
	trix@redhat.com,
	mdf@kernel.org,
	yilun.xu@intel.com,
	bhelgaas@google.com,
	akpm@linux-foundation.org,
	linux-fpga@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCHv2 0/2] uio:powerpc:mpc85xx: l2-cache-sram uio driver
Date: Tue, 14 Jun 2022 22:57:33 -0700
Message-ID:  <SG2PR01MB29510049C49D4D9281E88A6D9FAD9@SG2PR01MB2951.apcprd01.prod.exchangelabs.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <YqHy1uXwCLlJmftr@kroah.com>
References: <YqHy1uXwCLlJmftr@kroah.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [e/ivNtV7/ONGGlruoE+moSA28uoP/vXX]
X-ClientProxiedBy: SG2P153CA0018.APCP153.PROD.OUTLOOK.COM (2603:1096::28) To
 SG2PR01MB2951.apcprd01.prod.exchangelabs.com (2603:1096:4:76::15)
X-Microsoft-Original-Message-ID:  <20220615055735.53585-1-wenhu.wang@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dddb7be2-678e-4b38-7c9a-08da4e941c6a
X-MS-Exchange-SLBlob-MailProps: 	6rN1YWC+iUWsRh032Lw5Z0CQAJRF/Q/XDJSy/jzflduZU80Cop7TOrOo59C/7QUFHkq8K7NTP6pH1/boQ9M3sIKe3zdtNTt0WT3tpUbmPeLWJzGBIxx3dEeJIewLbO2P5Dh7HxtupqgAmrUWSt7b2ODONiGMQK3C2I2MUoXOtql79+mFD6lxfQLREpTmBJnry2KL5IyZ/eF13OESl1KksEsm8RZh3gjzfkVtqWm8fZ8fQds9E8zPsLGAdZcI16iox2eCsQtKUs44L7XnMGeaNGG3HlqkjE+/9HkAuJO3t2FyBzcaHbxREqsGwWj4m8XIFTiPcwRlF2vc0ykUMWLuTaeAEPAF8SXKgZXTDTGS18tqKqnu0DRXYSqxqsI5bxVIuns5YjP8HP7pMK2yKOtq8M26RaLcG2nDwMN8YWjYdmoR719/ECYpqE1MqTXybBmAr5Qm5h+/Ggc5OeWow5a0pzsDUcOOXCqPiPH+2cSLSzfL6beZkaQTw0ylpRlLSQs6mS95CRBs22/CTyeKWc7hN9QORX1XQrNfCPNtwhYNFNDOzCfAZxls86sjOR4xfDH6c9sfQGePOEmyQmum5P+/aB3BBrElgpH1cXV94Ei3EkgYWLBGxQ/7JbR/GSM6Q0/Fbz9+LcceRUOVK+KHTq7cuPIvUqtG9uAe8WKgz47zRNecfsIoti4M8usfCSNQ1EHhBqk64Qu9tug75FgzYsDomEsDBR8/eTPD4cYP+t0uKS5ISFcaCMus0iSTmSaVjJIdAMWLCa1A+IxSC8s2/2yC1g2R7x1Sf6aJV3/NsKWmViGPJ2t4Fuadqt/u2rXj3wM4
X-MS-TrafficTypeDiagnostic: PU1PR01MB1947:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	5tUrzGmbSxTNw6hUVOHJy0XTbHXLVpY8cBJ1p4dQKbBnxN3ibiqEd7m8eCEAywMGRDTiwdFljKV/fp4uHcDYAO89VrWj6xWUaZHc7QMbgg/t609T80LenPEpnHf8KvtRhfgvu45m+C3mRxs+f2XExEZck6bMDW3P7ycCRHGHlyf4Q/fkT/v8pZfIwwZ7EAII/RXI7Rp15QyS0FAQL0HfgX+ZALupmjBNpHPKyG8qb8FE2sBGeLg4a+XZ11lanRTmBgnkGuuJFNlT0r7PcLl3zGjc+NQqXrJ5a6mLkC0nGaOFsw38usCBdgjPvfIf4e2zI6cN89u0PgBftiqmn6qmlj5odC01Z6t3DEM083y8Y8qZ6fOaBpMEyy5UV+KUaABcd+N4Pndd0OM+HZwGvjnonP7SxVEEaeBLWO82x6QgoOdLfsWTyPdRynGQX/HU2jz9Ry1ORKyZjGkZN8EDznU4SHHmRtPpqUBL0N9PZqhdAnVBnB32X92Ephm44RpPOMr5pnNxZd05TPSVNw3r0JzyQ/S8ObIy+9FiO2ACPp/vs1YNUE6dKXrBGtMIW70jj+tAU/hIzIF1b+jIs2/bLG0eHpplfaPzx8IKloIX9X60LTpCXnHL+vtpFJoODqTxMwc++hLSLBt3KQHOvP+QtrQjcg==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?8wE41USK1psQ3F6xQvSzu5mIBITuJGUPnTSzPELENKgZH701ZVpuwcD3Lo9j?=
 =?us-ascii?Q?qBybjQ+vpoKRtOrXwIfqsVGoIsyhqpK985FcN+f3s0m/KFGigh+qyBLZsGvk?=
 =?us-ascii?Q?LYABjCCL48nXOTXl3YQSdKONspanEMy/RO443DJLdbooZkflmrK8N614S8vo?=
 =?us-ascii?Q?rafG4ydzOyanIVWzhZzcYbQG3+as1kwJE6M93GAhl3Rlh5x7ElF0EghwMDXM?=
 =?us-ascii?Q?KhQ9W1mHzP4lTjarf6wZ1ljfZtxlS7WEgm0cQeDSKf2C33yJmqO7jSEj7cvG?=
 =?us-ascii?Q?JYcS5XfKcFam6OL/0VxN5cCfoZ5l2NMJyndSBYP1dBUlv5XqeuV+nKStjrU9?=
 =?us-ascii?Q?sutgYEgtWKiGIzB4m4ufEplQcj2jN345C+XF1OByTQp6UoWY/qe93GY5uAIG?=
 =?us-ascii?Q?P2KZq8Z3MTy0WLONcEcbqBlA1tYVooLQpGWCtqEMRWyAkZ91t9IRpNWaOW87?=
 =?us-ascii?Q?xQak82VGm6uHhuBP3lMzJ6e5vSJMrXpMg5QMZawUpgq7K8gmZjv/z9Imyb44?=
 =?us-ascii?Q?MdP+furceZA7kPi5YIZxrIjFeQ5p+YjULRJRXegmSW6ByDCVkN8vIQ9bTQgR?=
 =?us-ascii?Q?HH79gR0jp91EJYBogzFGrpEAlpOCXnxxz1s2hL/iSmy74tuBYcmyx0ogNBhR?=
 =?us-ascii?Q?eqXZeHpmukubAdYjeiXbX6C2VDSRq4CsftHC0rke10NfySAEQvyWrlRcCrKr?=
 =?us-ascii?Q?PgoUMdt13aYfY1r+8BDaTkyey8j9tGjsFmkLLmuHVlZ4Or2++VIn4RVvC6Ee?=
 =?us-ascii?Q?FuN9kbf2meRj2x3YXuI+LO+gfbJpIfwZm/RdB5rN/PL8I4qXkZoEd26DCkQr?=
 =?us-ascii?Q?ph1HFVSsj5rwrHCiyvcgwWuFwhoM6fh6Dpu3V0QadYzR+75cHPeXJzbUUZxc?=
 =?us-ascii?Q?1TEbfC75sDGV0bD9AhtADSN/nwZPzyl+Xsph3qaJ2XhQKMP6VGMOKX4mA4DT?=
 =?us-ascii?Q?JbU306sT5XK6tO+7qlyaE3VYA3gWR5nLPOQWCiGj0v5YfuJ4qwp1cMY+LYrI?=
 =?us-ascii?Q?Hv6yZlKwTRbHSxOrbL/acOL87H58YFUfD2+iIGnkYomOWWs1BgC1Gl4wU2Ws?=
 =?us-ascii?Q?i0D+LvaewIEDvfASu36vXOJ3fPIW/iaBtDdD/ugIW5Ou1CLK7gRtBSf+QYvL?=
 =?us-ascii?Q?IopMtF0f+24Q3+BrBPplUMqcpz58ZyTN6Q+t7WJ1t86f26FkxNX6R94mmX2g?=
 =?us-ascii?Q?6xK66rPTAF5DOoIc4H26pKUn6LVxtFYVMoZ+TT+4LRPel9cK25PVe8ooQxup?=
 =?us-ascii?Q?b6u4WXyhGcSrU2twA7ilwbVA2+hlJ33gdId9OCebHn35m5J/7QKt09xk1qQ2?=
 =?us-ascii?Q?PJe9NdwXu8VAY7G/iErgK7eSn2D86JSu2iuFA6r+vmdtFn+JajOrRsjV3lj7?=
 =?us-ascii?Q?8N7chiBAuvnIpEdjLkzqmwnQ1m2Jmy/+O0Bwo+oK5Y25EGOsehnIY0UtgZ9m?=
 =?us-ascii?Q?V3+o2Wyapd0=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-d8e84.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: dddb7be2-678e-4b38-7c9a-08da4e941c6a
X-MS-Exchange-CrossTenant-AuthSource: SG2PR01MB2951.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2022 05:58:47.1931
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU1PR01MB1947
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, wenhu.wang@hotmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series try to push an uio driver which works on freescale mpc85xx
to configure its l2-cache-sram as a block of SRAM and enable user level
application access of the SRAM.

1/2: For coding-style consideration of macro CONFIG_HAVE_IOREMAP_PORT;
2/2: Implementation of the uio driver.

This is the second version, which addressed some commets:
1. Use __be32 instead of u32 for the big-endian data declarations;
2. Remove "static inline" version of generic_access_phys definition in .h file
and give a version of no-op definition in mm/memory.c;
3. Use generic ioremap_cache instead of ioremap_coherent

For v1, see:
1/2: https://lore.kernel.org/all/20220610144348.GA595923@bhelgaas/T/
2/2: https://lore.kernel.org/lkml/YqHy1uXwCLlJmftr@kroah.com/

Wang Wenhu (2):
  mm: eliminate ifdef of HAVE_IOREMAP_PROT in .c files
  uio:powerpc:mpc85xx: l2-cache-sram uio driver implementation

 drivers/char/mem.c                    |   2 -
 drivers/fpga/dfl-afu-main.c           |   2 -
 drivers/pci/mmap.c                    |   2 -
 drivers/uio/Kconfig                   |  14 ++
 drivers/uio/Makefile                  |   1 +
 drivers/uio/uio.c                     |   2 -
 drivers/uio/uio_fsl_85xx_cache_sram.c | 288 ++++++++++++++++++++++++++
 mm/memory.c                           |  13 +-
 8 files changed, 312 insertions(+), 12 deletions(-)
 create mode 100644 drivers/uio/uio_fsl_85xx_cache_sram.c

-- 
2.25.1

