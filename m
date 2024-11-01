Return-Path: <linuxppc-dev+bounces-2762-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B899B92E3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Nov 2024 15:12:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xg2qg1cqTz301n;
	Sat,  2 Nov 2024 01:12:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2607::60d" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730470335;
	cv=pass; b=HQzCpUyXf8b8I5NdDUggC7olHaO+I0PBjpOHZudcgWqLuxOWwYpQT1+VQNudjqCspYxmIammxm6eZk1i2g3/DaSEw0+GyhYzvuvQT0YTiGTptQKgUGrdAhl0T39y7ba6+yg9FK/tpnIe9kLneTq5bl2o7YCQFvlfAVymTWe9fBm+gE9Up37ZSt5shh8oH1zuapzrZfvoRo7XZU+4mvop3OUQ+aTiro/aMM5d//rOEMXM+xMTynHpSPVFD6BbGB5EBXIztkqHl7mdbQfgkRBjrWiOYLpwDMyEgUr1LuPiErHvua8UJbtx7eg2wCSkAPU7142mnqpP++SKKZ4DNtRe5g==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730470335; c=relaxed/relaxed;
	bh=FcuBZIVAiIvm+uqz+Qg3cVryH2iFqIfgBMsZH5XY33E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lLIADoMgpwIALoVAHYDYJPaDu5mKsv8gsT+g/6aFVGrawP7dEWv+hyaQxkVvzaMrRZ4R4+xcBcwAeDZcPcVcEPKYvuAINT/Ykt1VTgLvE4o5OmyHcoL39f6818rb6T2O1urEnm+/EJdMPFy14vQgKGHI1o/NZltVQspYabYl0ovA6WaKHH0LqP+Oa+PReUwUPJshQ6NYX2NXYSwRhu1JRNIKDt9oBPXuomScLyFoK5UnkR0W1HSG5ASqsmGb/K2oa2/xxXNAcV6B2CLES2tHOh6oXvjGeXqJAtxawXpHjigWL86I6X3ycJcWtMVfdkIpjeAl7h7/ilYKSUPqBm23JQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=ML1LqBsL; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2607::60d; helo=eur02-vi1-obe.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=ML1LqBsL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2607::60d; helo=eur02-vi1-obe.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2060d.outbound.protection.outlook.com [IPv6:2a01:111:f403:2607::60d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xg2qc1Fhzz301G
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Nov 2024 01:12:11 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=REOBmEEetSh0SD6r91Y69LLoyD3dZB1zXBYvTVWtsn5o1vlS8lAthpxj353xvFOKSj8DI9bqIc0iQger2/oQpjd4Ua9hDyL5lpCZBjZJWXaXBznJxmIv9vWkHf3uYO2eUOFy0PwmScP2i5fVUE4Vzef52i/C1KEYa94Ln5aeFvrNK2wOjmhM9zkaDrd22tGUizBCw9rkYTpB/Hxy+VMAOh1i8Vk36ZlBS447NCvthSdD7jiSvEBFFPfIKPTbdmgCuLkV+Yu3pOAMZKT4GhVRzFVi4K0gQicUPeVNhSxr4zoSRiScgYpv1Nb9HRZHQ6wSsN9B+XQsU3O9VikAXCiftw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FcuBZIVAiIvm+uqz+Qg3cVryH2iFqIfgBMsZH5XY33E=;
 b=s7Ay+eMoZca8GTADkDj6TjNxpw8lZBoQQfzNjbwGx/6PnyVZgVxkzQzb6paxf7VJVwX3fvl06UAjrrWkOCcE2KxjWC2+14zY5IGJN1XaLHHuV20hYX7Y79iq/1Pes+ad+MyvlyUhH1HdL4PTEE7vDbGWQW99vg4VhStqcpG8QGloHn+5GbWUI2cweVHdHNjfDGjU+MlzSCZaO35k6Hd1LGSKQk8tDmmtRH/c/0egYalY1p2wOVDjEQUB25nO803+v5aO4kTYp9+H/+6/c/EyPCzlBjau1d3rMvcwXQ5hxIXvIVHbVpPml3UbPGfI6lHVsNsVwrAyPZ0w9bIFhnT10Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FcuBZIVAiIvm+uqz+Qg3cVryH2iFqIfgBMsZH5XY33E=;
 b=ML1LqBsL/Xur/PveIZ+HLyxJxWUdQ0/wMqBDh7OeLfwbyf1CTIcSE2OBbdYtYbS4n2gSVQkgAieJnpj3CIG68pJg5AEH4DMq/tp13QJ0kflnm/wcPNhsjj8deU0y3s0yuoolbMJ5bw7ME9ta29KFfsW0iJ+VVe9xqeiIFAolfyxZ33njbIw3S3rurhkwLvn6mFZHYNcd5RgDdGrZezYScEFC9xHYYcn1O0UOssVohZW8Avh4YkuJCHBgLaEpzmTlqLJJem1CvZ4NYAMjCqt/uJgLWWJ36rHbCDKbmkQx/DoACLnXJx4VrpUd++WgGUmwLI1QDiUDTJrXWET0QNxugg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by DU0PR04MB9418.eurprd04.prod.outlook.com (2603:10a6:10:359::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.29; Fri, 1 Nov
 2024 14:11:45 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%3]) with mapi id 15.20.8093.027; Fri, 1 Nov 2024
 14:11:45 +0000
Date: Fri, 1 Nov 2024 16:11:40 +0200
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Louis Peens <louis.peens@corigine.com>
Cc: Caleb Sander <csander@purestorage.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Arthur Kiyanovski <akiyano@amazon.com>,
	Brett Creeley <brett.creeley@amd.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	David Arinzon <darinzon@amazon.com>,
	"David S. Miller" <davem@davemloft.net>,
	Doug Berger <opendmb@gmail.com>, Eric Dumazet <edumazet@google.com>,
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
	Felix Fietkau <nbd@nbd.name>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Geetha sowjanya <gakula@marvell.com>,
	hariprasad <hkelam@marvell.com>, Jakub Kicinski <kuba@kernel.org>,
	Jason Wang <jasowang@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
	Leon Romanovsky <leon@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
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
Message-ID: <20241101141140.umi3qwpnirb2x4vy@skbuf>
References: <20241031002326.3426181-1-csander@purestorage.com>
 <20241031002326.3426181-2-csander@purestorage.com>
 <ZyN8xpq5C36Tg9rz@LouisNoVo>
 <CADUfDZoba9hNOBU7TT+0K6BYiYzVkZ_awt751g6HBm+-cCZf8w@mail.gmail.com>
 <ZySXV46T4IE8YVqX@LouisNoVo>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZySXV46T4IE8YVqX@LouisNoVo>
X-ClientProxiedBy: VI1PR0102CA0046.eurprd01.prod.exchangelabs.com
 (2603:10a6:803::23) To AM8PR04MB7779.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|DU0PR04MB9418:EE_
X-MS-Office365-Filtering-Correlation-Id: d2de5844-94ac-4e8c-25d1-08dcfa7f1e49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vPRAA/mP1hMqM6II9NAyNAkZLAhpnKhNDvnPJDjPW6zkPGfmme6+viuAFV24?=
 =?us-ascii?Q?J4A8O5Lmv9BCx26F+QXEFJ2KZi18LxYlO5HDiz60GrZISaFgZL9iY2zO2tz9?=
 =?us-ascii?Q?6EQjJWI1EnF99EbPANvgEVAYrmgiLR+/k5P3L0qW5KoIxvBYhZpubgA6ShnH?=
 =?us-ascii?Q?1KpX1PIc8WjOTvvVI6NwqpmHUI1ZVM2VHoTUWVIrp4paBwFSgGK4qwXELSBW?=
 =?us-ascii?Q?SLHOUBDjtu73hrv0fzRDVDQ00e9yFO3zoH5VjuIQ2wx5vfjpayqm3qEeuM1T?=
 =?us-ascii?Q?wX40GiB3U4gV2umguJUasl6cyC2xk859L8IzMKeVoQmQs0fSdg6Ryn0z/ec1?=
 =?us-ascii?Q?sjfzmdsea6KSrFccEXD9/N11io1TinXv5WC1Cr/VumZ7MhZbFQe1k1HtKPf5?=
 =?us-ascii?Q?QpPwi/eS143tj09kt6iBynqdPc7Rhmrq/zxNonES90p2CdVosA7j+irrv60i?=
 =?us-ascii?Q?AprS+Krui26DFxTP3MbH6Y1rvx+RqcqjOftAvmwcZ5kj/iTmXI5BGhwH+yTA?=
 =?us-ascii?Q?QpzdCf/0dohJrFFzp+FAA1CBNKrVqpU2EWk/MDnGwnfi7WPQ2yq1AybXPYid?=
 =?us-ascii?Q?Ciad3T1oQiuT1x5qp4hNJLj5ql4LbVAir/RbD0TpIB/8vA1RkWK+bmuOox71?=
 =?us-ascii?Q?yPnYcOPbOmFhk+7rFw3XViQXtH3IA07up9hkV8WRf2tH7wePHrahpCTTFyD5?=
 =?us-ascii?Q?2QhBg3kVArq9+6chvEAplz/GXquIhJOlifHpXM83JNZ+MVHwswk0JcxsBENT?=
 =?us-ascii?Q?CLmgoGS70opaGCiLp386A10lPdG4Z0oykzC1wiGTPCPydPxIcqeh4EsoszyW?=
 =?us-ascii?Q?G2CGhGzkWbi0nTDN5hh04Qo3Ec++e38XcnCHkSrpeKXDbsxzVy2tsjQNRTfr?=
 =?us-ascii?Q?yCa6I1fzzBdsA0EfpOYEjzCnbIjBgJkr30zN4ieZdbQOtDIb4slD2Y36JEer?=
 =?us-ascii?Q?PWkaIqu6BgzZuh9R4Y3YSTHu4n0ko6MRRQ01F/Sv0QiLRIg77fbZRjew/5rI?=
 =?us-ascii?Q?DUmmUiPb6XLh3PO8CtdZ32pOCAICRUleWJi+MyUfbyIXlfzsY8A1UFzI7ygp?=
 =?us-ascii?Q?d8BHuRUycQrZi4OJb3VJvfObeb00ZlR69Z3pSqv44hSPc7jLxI/Kskaz4ESu?=
 =?us-ascii?Q?QuCWHmGUUS5csxBj8BGD3sv4vDB2MNtWaXUrWqmbueJV0UngF9qod+yOUTNm?=
 =?us-ascii?Q?XTO9uUQ31NcxbN7v1Op8C6VvmH0EdS/yplgUqxXwNeSnZ8Fn22pui4BxXmOu?=
 =?us-ascii?Q?B6d83GLmoGPYi5r+KOjihQm1C+kLsWuw+nd/08ubLx7fthZ0fJjYPgyne7dF?=
 =?us-ascii?Q?1si1PoTG3SoeABUJIitKQA8G?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7779.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qc0CwUh2UiVTxFZ+vLYY4JxI7CkcnXr+wlVKd8Fn+TUyHeFjD6R0HuJe4ZqH?=
 =?us-ascii?Q?2dphNV6Cm5KwkoghylQGj80B8QNjLo1C0WOAiSgOdiGOfZ2DppVjwnAJN2CF?=
 =?us-ascii?Q?SytOIp3AJUbwpRqCvCPijfif6QW/0QmOghapZ52vZcMH6qceVwwyU2CT3400?=
 =?us-ascii?Q?Brj2pQ9W0j5hc+trEBKPDlTBaZX4bFXrmXlanI/Og9b/iaQuk8ILbjKDEJrK?=
 =?us-ascii?Q?O/zjqSCnhl3d3mNCOJuvj01Qs9pUOahN1vtmY+hHvtD6kks0KG2OOkGpZQHE?=
 =?us-ascii?Q?jjXRu6KVd8mSlrfa0lGz57gvBRpWf4yUtw5bYxXYRmv2cwGqhCMIikHX5axE?=
 =?us-ascii?Q?kxYe5lNRRfv8Mok7qFUA5tbRA3MlooTp8mL3TFLa5K/kB5gmjxCGr5DJN+9d?=
 =?us-ascii?Q?kQN1r3L+rvOruw+JDUqcf2pmwWwYBGjtA9MYYzO/7akJUhANfE4l/udZ7orH?=
 =?us-ascii?Q?XNlqwGOgOAAaBdmQtp/2CYLLgDlyhwwB4e4DKDktQbDwlBaLFzxN9THzzB/o?=
 =?us-ascii?Q?0Lw3ZEmwTBtK2Vcr7QTJ9Ta5xeD7Cwq15Vo9njaTHq9VXsqZG2EEQ0cH+Cwz?=
 =?us-ascii?Q?gjTDMIRnYB+QcNMS/aQ2aSGTlBUBCr9etXdLg2lcshc10mzlsqWU6/7kveJ4?=
 =?us-ascii?Q?hyYjG6shk/qJWjldriKuHoN9IaNHk/qullqNdl+7vilfIf1DyY+Nsl8syhKp?=
 =?us-ascii?Q?SnLVZvuEhSxo5ooc0bgWFi7Js+2VtIHMXNL/UjhYt5lPLIOvG5rUi5L9FLsy?=
 =?us-ascii?Q?pksLKdYA2iqBniP3aF6lw7g2o49DoDdWsvR0xVBUnbKVw2qUTaieOJbcUlzm?=
 =?us-ascii?Q?Ufhm1koVFbXZ7Junf5L+cENc+BdBdoM9E32utsFLcSMia2BTTNQurtrxsCog?=
 =?us-ascii?Q?hEgdXOqM5axELxuvHR64orqGJLhQsuTwkd9YjbqMqwSGe+kd2Y83Y0mThQpG?=
 =?us-ascii?Q?BSC1BhxImxRa+3i/hyqrcc9f0Jnesgc+ZIhKQDWNB6jtn/83qzn2U4UQgNfy?=
 =?us-ascii?Q?pE3ENABTUlTT4qMMcjSnIN+buwZu3XzkyLFhYrFezT7FSRvpCLK33DpAYP7l?=
 =?us-ascii?Q?HzAeN/p669fGwJX2SGbVmgMJzkKhd2DQrQjD8G/J6VXiQsXJ83Fn0hvAE+Qt?=
 =?us-ascii?Q?4sGBv++XTI4IRb0uesAYiPGIoJArQ+geiTsBQHaDRl+P0fnUU2KhddDlyPYA?=
 =?us-ascii?Q?w2Q0Fgbu+a5rtsGSRGnvh5iLT1uzUrmLtNQXHVxaHpFKm3H9xr5R23Ew9V+R?=
 =?us-ascii?Q?Xe+7dgNGv6k9C6khjEjm0JQvjx1EhddqeDlm8HuZC6/FJ/RfGX0qN4P2zTbL?=
 =?us-ascii?Q?0zm9grbpxciEPXk/CVLwpVCuOv2YJcPZhfQNvEqsCBpG1Ryw+Ln+OmoR3iU4?=
 =?us-ascii?Q?ajTSmR56xT6XPfAjQ9V8M3QaqreFpza3sTlXyb7NQVjhhUDPCeI/pVa2nsNm?=
 =?us-ascii?Q?MeyWz/vVT3zd+LIVUdjcF0lhTigxl+cZtcoU2oDHNuKLuPikMBdZcB7n0mto?=
 =?us-ascii?Q?rEiAcEpZgXzpxoNd22aaXJjMyOsctZswSJENK+D233I+4KMCF/zX7310g0fz?=
 =?us-ascii?Q?gNNH47Zf2aZJgO1ycPIjbboy5fWBKJ7JDZZnMRfmimz49sVZfvJMOTRePw2/?=
 =?us-ascii?Q?HA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2de5844-94ac-4e8c-25d1-08dcfa7f1e49
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7779.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 14:11:45.7255
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lvz+wtk68xfzuakCOH59mkdbwJBLa6IrP+KSUxbxKcwDNgP/LPJ6SO6Et/7e5fVb2cJYCgszdlaYrDARHy6Y3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9418
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Nov 01, 2024 at 10:54:47AM +0200, Louis Peens wrote:
> Hi - sorry, I do still manage to mix up when to use signed-off-by and
> reviewed-by.

You use Signed-off-by when you submit a patch and Reviewed-by when you
review it.

