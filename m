Return-Path: <linuxppc-dev+bounces-6546-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4E3A48F33
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2025 04:32:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z3tzm3rnQz3bqq;
	Fri, 28 Feb 2025 14:31:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2413::60a" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740713508;
	cv=pass; b=drS5XyoaYNFT9b4CNLeJHRIJkPfQtMsNGhEVxIFLrOi/cQgH96EmxVN7uxsBdmSUWNQq+lpLsJPJeg1vNu+VDA7wYZmTp7zZMuOta1cyd7qWQGogexgLZfDaWegalSPNn0Gw/3ruJ+XkvMZRtN5D0o9m5mKpniv2ho4uLcaz8uPCbKf9t93DwxYZwOWqFt6QykJDwDDvr/LlZYYxHsN1gMDjw8ZyhHhtzvfw5XYzfOe42RsUj8o0bzX1DCtcx3Z4CaJCyNR21kKGL4/CUvtYM4UqgpPvG9LmPskBqEhGdpuC9+0HSsqTrYbheuh4b+U21/6ONyFtE0DF/u0V/DhkRw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740713508; c=relaxed/relaxed;
	bh=P0+55lF1ewPGjHL4a+DdtnQpGk+9xCAh01YxiyDIjWQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AVBzgLe7llPFggo02V+Q5jCeMnSxMgIiQTlC3KUXyjd3cPLoh83GuchHBPPo4iy4Zc0WOs4chipvSTRLmQug8+jvuZ94TQqsEIdhlVA/Ilu6j8+l8rkIMIL/t46EIdJpUvO24thVHmayozYabcYrGCpopToJdxG7wam9VZ5xS2aCHUOwhByEvgBSSavOOp2f4TaSPkyaqTv8qmcvcAEKWkVPdeD2UawB0LQdx5tjVV7vj5PVrqEX8C67R+jmuUGWZmZWK8rCRnUgXXdhpSQkUORToPBz73BxiBR94H+H0BsDcnR1Kd/FY0zn6Ffia6yc6b5DH/Wzs3GOuFE8r4QQhw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=S1GjkDV8; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2413::60a; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=S1GjkDV8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2413::60a; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2060a.outbound.protection.outlook.com [IPv6:2a01:111:f403:2413::60a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z3tzl397Sz3brM
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Feb 2025 14:31:47 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZcYMKwqh1xo5lpt0K5diHXjFAF1XuVhu9fAT6AzwGbIs5II/xxUTNZSgGHYOxU8OmsgWb86gaj8nZKUwpXdvOaZLUaOchRHyXWYQEf65aCrYHTx3UPenyt70lxv4mQ6dycCcUTkQ9dFdsUOGfheHnLM46yL49hevEbljm0CXfpgnqFU4t1l/1Hp64D6GjrT4b0psNGFwnNPmUZj8/nCyP5ktOjA/G5uI0YUKldV4DRTdFrAYYyPznjMLXBvxuMOYqHx0BGnafX7ZI32wWuLluG795glgzWpbhfluOcinxE0l5uLrbrwg+FZ0VFczNQ8npO2BvAs7KGV7qAHrJsE4DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P0+55lF1ewPGjHL4a+DdtnQpGk+9xCAh01YxiyDIjWQ=;
 b=JmzIyl7S7Gxm1Q/jp1G0GZZNh6wWQ9oFZupLitY5xZGvwfVWz1pwURN0+4nLXKHV7H3k1rnLKn83v8q7HKHyfacfjWyVf2IfpE7U3KfWWIFRJbgiiSCd0C3G5EBSXMjk/823z5oai14Y5TCS9obee2rmpifTzNxklNaYymtqNQaVmBtV0kchELXbiBADaJSdNqob1ApJ5d7iDXiJEk4to8XPiRAW6CNl2MFAhkJwdKLO15qsFsIg+U4T/hTmpfVoZDc+2fZYJXAPlqoPXSJe8GSXz0ATVIZ2psx6k4DIVUHWnUIRQnb/YU3+A9kkrNATpAOuWQJRhtGs4xfeKZCWtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P0+55lF1ewPGjHL4a+DdtnQpGk+9xCAh01YxiyDIjWQ=;
 b=S1GjkDV8uWDQ1V3dpJoeGYfPQ7aNFOwvw9pziTYrcD+6WY8c4KUVDPz4GtGqSbILPbgmXaUtSiigKq9er4ilhpkLcSr6YjdN+0H9DZulcDSrkcMrCF8cwUYwhJ4nuDC4i/Diwo+S0Tq54OBeWAxwMAeTb7HV/1HPEjshS50xfAIl0GC7WKhuxIEecQZuFUZBK8pFjmpdT6IrvjU/xOhFtRwXLoKN+6kUQg3mtdrt+MxDqq8GrhQa4XkcuGvBRhNZAo8+xnE0WADbnSgnUo3xsDB+HpzjvXA14lscMqOKVgN8ALu9LcFHV374DvpJ5EREZ0kRtWZrkCd7CGCwnVWnWA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 SJ2PR12MB7991.namprd12.prod.outlook.com (2603:10b6:a03:4d1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.22; Fri, 28 Feb
 2025 03:31:37 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%7]) with mapi id 15.20.8489.018; Fri, 28 Feb 2025
 03:31:37 +0000
From: Alistair Popple <apopple@nvidia.com>
To: akpm@linux-foundation.org,
	dan.j.williams@intel.com,
	linux-mm@kvack.org
Cc: Alistair Popple <apopple@nvidia.com>,
	Alison Schofield <alison.schofield@intel.com>,
	lina@asahilina.net,
	zhang.lyra@gmail.com,
	gerald.schaefer@linux.ibm.com,
	vishal.l.verma@intel.com,
	dave.jiang@intel.com,
	logang@deltatee.com,
	bhelgaas@google.com,
	jack@suse.cz,
	jgg@ziepe.ca,
	catalin.marinas@arm.com,
	will@kernel.org,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	dave.hansen@linux.intel.com,
	ira.weiny@intel.com,
	willy@infradead.org,
	djwong@kernel.org,
	tytso@mit.edu,
	linmiaohe@huawei.com,
	david@redhat.com,
	peterx@redhat.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	nvdimm@lists.linux.dev,
	linux-cxl@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	linux-xfs@vger.kernel.org,
	jhubbard@nvidia.com,
	hch@lst.de,
	david@fromorbit.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	loongarch@lists.linux.dev
Subject: [PATCH v9 03/20] fs/dax: Don't skip locked entries when scanning entries
Date: Fri, 28 Feb 2025 14:30:58 +1100
Message-ID: <b11b2baed7157dc900bf07a4571bf71b7cd82d97.1740713401.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.8068ad144a7eea4a813670301f4d2a86a8e68ec4.1740713401.git-series.apopple@nvidia.com>
References: <cover.8068ad144a7eea4a813670301f4d2a86a8e68ec4.1740713401.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY5P300CA0023.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:1ff::13) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|SJ2PR12MB7991:EE_
X-MS-Office365-Filtering-Correlation-Id: b426778c-13fe-4dfc-a2b0-08dd57a8680d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?r449XtztPjVa25o6+uk9d1fQBvhYfXxP28WJhLdA+ZeQqzdtjzTgAPMIAlLn?=
 =?us-ascii?Q?GtPZAuzodMt9fsrUacOPSLeEuBFxkq2LqlN3FU5AAq98BjagmQzdiGuC7SmE?=
 =?us-ascii?Q?xslTN4fGrK6J5WdQmiQ6mB4T5v7XVbBu4fsCbKWsNnFDXfbQ9kje0GFCWzRR?=
 =?us-ascii?Q?nt8tPmDNuXuMOPcXqqtPZvlxqelWkdOSUtvvnryRI3uwCInb1BySnbqcibL6?=
 =?us-ascii?Q?VFVaAKoi+sOUjvW4RjUacZeZMXNxVbwaPjXt7p47pgbOxVHbloe07qN/iefx?=
 =?us-ascii?Q?INAF2svKi3UKz8lk7OVR/sHpUOUiRgu97W8m70CzOM8jIO7kUdZ1DKkplz+j?=
 =?us-ascii?Q?CL38eutbjJlvSu9iU7fUMNtSzxxD2HBzGDAbyviS80oAHUUEIPjgd2Dl4n0B?=
 =?us-ascii?Q?Au26OWDNXMoSLJeUHs1KoQHzESdU5U5vpaGaa5ZCXDkpf7dZ3kYUvFe9WIPx?=
 =?us-ascii?Q?SAsWVhgw/J96KEHcJPv6H9SRL/XvDgkGWemWvOdoIFESc8KnQbU14vX3xunC?=
 =?us-ascii?Q?pm25kadF+AtOz0PYVA6IzwooHm4dAMw/Ixx0sKZXWrKyRJRCWcUVrAZhN7Yp?=
 =?us-ascii?Q?1+aeJ5kNTCmAb59cbAF1ujxEROSHv0+rxodXG/CWPT2NXyEpmW35ClPCQjiS?=
 =?us-ascii?Q?5oj0BT5SOIE2DMMXBS3sDYRFhyu12v6yVZP0+yMtWMXVoRhB0vRK/HDM1IFT?=
 =?us-ascii?Q?tfjsCLI39JTSVkq/AlBYp6xOGQeQLupwhG0hHnDOiRPzkN962399jAJ6xrpd?=
 =?us-ascii?Q?boYUd537YWPuo3/lG6V9GPGZNdloGZKs3N4iVjZsJhnLZyE0pkSYHBsxn6Zt?=
 =?us-ascii?Q?riHB+oFfY1Vpjy8sMl2g1wTDh6DAIE46Se/TtDSb1gG+kz3K8UqilhUxeWq1?=
 =?us-ascii?Q?16CiCAToFJX+UOHcFcqiFfigX70jrSNtguQxSXbFtnz+qU25FRBnwzRaWVdz?=
 =?us-ascii?Q?GZX75pGGmi1vUqJyRSYA3VC5plBUP72Ocgd+hMRA/0iRNwUklXkiftCCgHvu?=
 =?us-ascii?Q?96POmO5SsVfBNPj1Wq+A7tbN5pMSrqSmYC6izrvcbXMLSFfP593KgdsWqclE?=
 =?us-ascii?Q?xUv4og+773WWlGfDrcN/QrDjQo2OSHpN16OifYYKH7TrZbCMozTRii0RF5sc?=
 =?us-ascii?Q?ZVA+wZ75eg0MdFK1hViqnmAzNF5RLIssBgQIQaaM1ekgZayW8C2Q79XmNcAr?=
 =?us-ascii?Q?/BQ3My4XQO6rYAlKF+1wpeYR50pkz1aL9uIidoBKK3VDBWdpsAnB43iapC2V?=
 =?us-ascii?Q?IxUSywA/j84r+eNpF/Qu1KCuavAteS3Dkng71Aa7+fpeGDNqhIEdNYDHC3Bt?=
 =?us-ascii?Q?be0moslh8O5YYW4nUehgHY0RjqGoGBg34vYsnuT5JnElIB1f78P0AyG+6AgU?=
 =?us-ascii?Q?uNnt+05PF+4TYAFZgwVDsS8x3fN/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JPhIN83ED/8Msq9MjD8XlUqX16BeY3DuS8KhghG215L/5hXb0QbYmwp5qRmY?=
 =?us-ascii?Q?ZQjX/+WK9ETnd1ynOo5lgH3PX/Qw85/MommUeJoObmozYiP2c+qzaBF/NXn2?=
 =?us-ascii?Q?oK+hC4utCtOf4Vg7QmVL4ObX0E7rtbiZBKDDz0SmEjTc1f9KbKD8jUI6rUrt?=
 =?us-ascii?Q?qcfPfVyMcCr3GZ+v+fhmX6b4KlCRnFuvjuz4//pi17QBYSZ4nNOueJKBMuFC?=
 =?us-ascii?Q?fYfeyp8kAgruguhq3iIYVGcXONWkMhDVC3GNXh0ErJktA7oLz2Ax3/j1GBEh?=
 =?us-ascii?Q?DaXChYDvvONlZu0gziLn7Od/JSzG34x+rbzEqr4Fsl8cllg52PZhi9rYVybY?=
 =?us-ascii?Q?9IZ1UofwokeWvWR00ylISZ129W4HRSWpIw9gvOr5hc6yMRH7AhrCSCbzdEdX?=
 =?us-ascii?Q?dRG3jVfrMWbr2YMwoKBC2vN/ALF86hxjO8bpT312gGOwCCbW/DRWPnz0dRw+?=
 =?us-ascii?Q?EoprlbPtEsGPjK8CisXD+L4RkQ25qbJaWKSdJgl5QfhbrZYkJ823N4AlOhhI?=
 =?us-ascii?Q?2b5PIgkyZ3NXpQZSqb+ATD4wY2UkWb4ZGY87Gf9iytCZPvAGD9Va9bVIEufu?=
 =?us-ascii?Q?NanF07hRBvR6s4vWfflZuzqhA0b4YfzOfnUFL6me38elXvmRAsa40CVhrOJE?=
 =?us-ascii?Q?pRigZU9EsNoJUvDheiHawg/TCOLxnV+M5A6dzCUgUd14Ix42wHJUa/HJhIn2?=
 =?us-ascii?Q?F+WchJYAfOW8ttGLDAT25r6flGcpgbjzT9ENVFKZjmjSrrZ8K/vKzuBio4rb?=
 =?us-ascii?Q?3qibSmt+aJNNihRTdfewz9ximXplRkNtbidKqO2Wc2hrWmd1wyRcAOT7BFmU?=
 =?us-ascii?Q?Iiip0w1gQPhD0UYr/CAiMLNUdQ7aon3+N3gaVwCUB32TiYq7dqmc/dyYnnyH?=
 =?us-ascii?Q?9fZk+U33xvchDfRL3OaLFYKmb6o+PqgxKG/sRY+QhK6x3OLfoFs6iD4mpgvQ?=
 =?us-ascii?Q?/yDwKZue+TVz34eklU+9x8jTZHuNgy8VnvXh+HQaYxhXJkjH1uFmdNc1nDeO?=
 =?us-ascii?Q?XOZuCsLy+heSKEoIweG5Q6XBAfsFD7TTVz1RiwDy+GjnRypKZKdGYLh1W0sw?=
 =?us-ascii?Q?ZtT0740sn/48vP/B1/+c7s41tjM9Zp8LR8kiuq5zKTI7o97jzg7lVS9VuN6G?=
 =?us-ascii?Q?PTxHkhTxVeF9EwDta/lh3COx+rAtQolsr4V+TXotf12OSEwjoJZw/GFPnfWU?=
 =?us-ascii?Q?ccdvi7iUq9WGZLrp5yIswZxv2KtvgrwCbPzt3vNewAxJY5v2GInD74tv7Z/x?=
 =?us-ascii?Q?Jk2ZskVz18qpxmUVyoGrWHnc3GAbxLBCV7EDPcgk7DOogOPoLCvaVwu3q/rQ?=
 =?us-ascii?Q?MuHGjbFavtCZE2ZI8l1AgX7sT4QIoLU6nUoiPdXB3KUyU26BgjYyvYUCmGvw?=
 =?us-ascii?Q?feFJJEHhaVTozxJUjz66dppb/MHDA2FV3qFeohI1smkLZOAvaUQnTGhzdiAN?=
 =?us-ascii?Q?dMcELK79SpTZE1fdwC4j8dh7ChrwRo9rdGV9d9mW1H0yfgspHQvHK/TOotRS?=
 =?us-ascii?Q?thcWqB5rLuaw0OXeeYrl97GXhUTEdYYRmmTsyuHPYnunHNOSW352Hs01EHLW?=
 =?us-ascii?Q?qJQGDWBn/BRfbvd3dnRTiNBujExvDKzwsZ3YEUvq?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b426778c-13fe-4dfc-a2b0-08dd57a8680d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 03:31:37.2419
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 93/N9nrCmRiQL6lqndLCzp9ttLYRt7VQLCVcxEu2OL1art0SyjdLzWdo+4jL0mUL8H5K77F8QwQUD7H56HbeVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7991
X-Spam-Status: No, score=-0.4 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Several functions internal to FS DAX use the following pattern when
trying to obtain an unlocked entry:

    xas_for_each(&xas, entry, end_idx) {
	if (dax_is_locked(entry))
	    entry = get_unlocked_entry(&xas, 0);

This is problematic because get_unlocked_entry() will get the next
present entry in the range, and the next entry may not be
locked. Therefore any processing of the original locked entry will be
skipped. This can cause dax_layout_busy_page_range() to miss DMA-busy
pages in the range, leading file systems to free blocks whilst DMA
operations are ongoing which can lead to file system corruption.

Instead callers from within a xas_for_each() loop should be waiting
for the current entry to be unlocked without advancing the XArray
state so a new function is introduced to wait.

Also while we are here rename get_unlocked_entry() to
get_next_unlocked_entry() to make it clear that it may advance the
iterator state.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Reviewed-by: Dan Williams <dan.j.williams@intel.com>
---
 fs/dax.c | 50 +++++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 41 insertions(+), 9 deletions(-)

diff --git a/fs/dax.c b/fs/dax.c
index b35f538..f5fdb43 100644
--- a/fs/dax.c
+++ b/fs/dax.c
@@ -206,7 +206,7 @@ static void dax_wake_entry(struct xa_state *xas, void *entry,
  *
  * Must be called with the i_pages lock held.
  */
-static void *get_unlocked_entry(struct xa_state *xas, unsigned int order)
+static void *get_next_unlocked_entry(struct xa_state *xas, unsigned int order)
 {
 	void *entry;
 	struct wait_exceptional_entry_queue ewait;
@@ -236,6 +236,37 @@ static void *get_unlocked_entry(struct xa_state *xas, unsigned int order)
 }
 
 /*
+ * Wait for the given entry to become unlocked. Caller must hold the i_pages
+ * lock and call either put_unlocked_entry() if it did not lock the entry or
+ * dax_unlock_entry() if it did. Returns an unlocked entry if still present.
+ */
+static void *wait_entry_unlocked_exclusive(struct xa_state *xas, void *entry)
+{
+	struct wait_exceptional_entry_queue ewait;
+	wait_queue_head_t *wq;
+
+	init_wait(&ewait.wait);
+	ewait.wait.func = wake_exceptional_entry_func;
+
+	while (unlikely(dax_is_locked(entry))) {
+		wq = dax_entry_waitqueue(xas, entry, &ewait.key);
+		prepare_to_wait_exclusive(wq, &ewait.wait,
+					TASK_UNINTERRUPTIBLE);
+		xas_pause(xas);
+		xas_unlock_irq(xas);
+		schedule();
+		finish_wait(wq, &ewait.wait);
+		xas_lock_irq(xas);
+		entry = xas_load(xas);
+	}
+
+	if (xa_is_internal(entry))
+		return NULL;
+
+	return entry;
+}
+
+/*
  * The only thing keeping the address space around is the i_pages lock
  * (it's cycled in clear_inode() after removing the entries from i_pages)
  * After we call xas_unlock_irq(), we cannot touch xas->xa.
@@ -250,7 +281,7 @@ static void wait_entry_unlocked(struct xa_state *xas, void *entry)
 
 	wq = dax_entry_waitqueue(xas, entry, &ewait.key);
 	/*
-	 * Unlike get_unlocked_entry() there is no guarantee that this
+	 * Unlike get_next_unlocked_entry() there is no guarantee that this
 	 * path ever successfully retrieves an unlocked entry before an
 	 * inode dies. Perform a non-exclusive wait in case this path
 	 * never successfully performs its own wake up.
@@ -581,7 +612,7 @@ static void *grab_mapping_entry(struct xa_state *xas,
 retry:
 	pmd_downgrade = false;
 	xas_lock_irq(xas);
-	entry = get_unlocked_entry(xas, order);
+	entry = get_next_unlocked_entry(xas, order);
 
 	if (entry) {
 		if (dax_is_conflict(entry))
@@ -717,8 +748,7 @@ struct page *dax_layout_busy_page_range(struct address_space *mapping,
 	xas_for_each(&xas, entry, end_idx) {
 		if (WARN_ON_ONCE(!xa_is_value(entry)))
 			continue;
-		if (unlikely(dax_is_locked(entry)))
-			entry = get_unlocked_entry(&xas, 0);
+		entry = wait_entry_unlocked_exclusive(&xas, entry);
 		if (entry)
 			page = dax_busy_page(entry);
 		put_unlocked_entry(&xas, entry, WAKE_NEXT);
@@ -751,7 +781,7 @@ static int __dax_invalidate_entry(struct address_space *mapping,
 	void *entry;
 
 	xas_lock_irq(&xas);
-	entry = get_unlocked_entry(&xas, 0);
+	entry = get_next_unlocked_entry(&xas, 0);
 	if (!entry || WARN_ON_ONCE(!xa_is_value(entry)))
 		goto out;
 	if (!trunc &&
@@ -777,7 +807,9 @@ static int __dax_clear_dirty_range(struct address_space *mapping,
 
 	xas_lock_irq(&xas);
 	xas_for_each(&xas, entry, end) {
-		entry = get_unlocked_entry(&xas, 0);
+		entry = wait_entry_unlocked_exclusive(&xas, entry);
+		if (!entry)
+			continue;
 		xas_clear_mark(&xas, PAGECACHE_TAG_DIRTY);
 		xas_clear_mark(&xas, PAGECACHE_TAG_TOWRITE);
 		put_unlocked_entry(&xas, entry, WAKE_NEXT);
@@ -941,7 +973,7 @@ static int dax_writeback_one(struct xa_state *xas, struct dax_device *dax_dev,
 	if (unlikely(dax_is_locked(entry))) {
 		void *old_entry = entry;
 
-		entry = get_unlocked_entry(xas, 0);
+		entry = get_next_unlocked_entry(xas, 0);
 
 		/* Entry got punched out / reallocated? */
 		if (!entry || WARN_ON_ONCE(!xa_is_value(entry)))
@@ -1950,7 +1982,7 @@ dax_insert_pfn_mkwrite(struct vm_fault *vmf, pfn_t pfn, unsigned int order)
 	vm_fault_t ret;
 
 	xas_lock_irq(&xas);
-	entry = get_unlocked_entry(&xas, order);
+	entry = get_next_unlocked_entry(&xas, order);
 	/* Did we race with someone splitting entry or so? */
 	if (!entry || dax_is_conflict(entry) ||
 	    (order == 0 && !dax_is_pte_entry(entry))) {
-- 
git-series 0.9.1

