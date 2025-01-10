Return-Path: <linuxppc-dev+bounces-4940-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C147A08748
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jan 2025 07:03:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YTrf06cgcz3c8w;
	Fri, 10 Jan 2025 17:02:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2416::62a" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736488936;
	cv=pass; b=erwIOxD7nDpFvaIL5MMx6VyoEDW6CJOMYHyr00LotK1nWBePu7POSFvtBaORKTx2owft4VBw3LlUjxsDCjKE62UJBLP+MbqoULuQ5vcegBfrhtbjsExLN+oz490fbaG3HcGAkgWBIr1698Lyko/tnV1xdqtdyjRuf9m4TE3WNjZK/mn7SvMwJaSSBWmPOptavHgAZqJuxLPE4rKSYtOJJFZPf4Nhrm6qng7TAwtyIO2DF+KPxtciCgYNzMj9T2P3fyhjR4iS4pyALVXKnXqOyglDlLxxCYWG8nbq8cqFLsA57OGjmedVdIoiY51FM5H6xvYhBg1ui4S0hoSB7SAp3A==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736488936; c=relaxed/relaxed;
	bh=rWLD/0xp0BR6MUjdXJUQ+QA/Pxu3/82VW88rj0w5N0E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eFy4hDPY9WJEsi9jubFlek0eMqj2klAZfVeQ0aYQuxmE5j2Wl5MoEXMAmJm9M+CN1aWaZ4U8fgT02EH7S8B5y9s6kjU7fJfINFkBRz9av19NWELG60/AwCOoJsb77RJWXiD0dnWqnWbz5PdDK8m8E+68nFDncCaTfmHTufQCc/3+DDIct9zL+wDV14PSr0QuSkem3K09Gw79F614dagGcTGfn+GfmpqPgWi/cwMlk4Fx9e3i2xMqDMSElGIdmWHt31hfL3/SmyVrbviMXei6hzUU0IlT7UbkkGtiMsDWfe0Ah+H38w1E4axrFAf+WX3GwQxleEp7qypjJjx4UzVjkA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ETGX3D/A; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2416::62a; helo=nam11-co1-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ETGX3D/A;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2416::62a; helo=nam11-co1-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2062a.outbound.protection.outlook.com [IPv6:2a01:111:f403:2416::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YTrf02WvFz3c8Y
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2025 17:02:16 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WAvmvX5JZQMf5ZS+3wR6i6cE5PNlbur5tWUnnITFvfBd3D8heicP6FiG/Uio7jvV9CQ4+6HwV1X0CNBfI4ThJH/nZnK234jFoILQyO+oWjqkOlXqo5xOFTO9eMuOuVDH+Dmu73T86JYOp5xRFP+dJmksywmWmrtOWamriYYuREujvSq8wBHiqU7+B2y2/xWqUXwozl1TFQzuLS5lzy7eV4wa6/gJE3aEOgefIqGaQv2YfWsRZVSTrpDPpVVkdxGxnVQT8KsuQtHjcrpxxlvCaw9UVic4ejo/i95nZz3qOB97Bo6QbP2MGB9NjXfPeE9zOS4cadpF0fT+inDxXYbchg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rWLD/0xp0BR6MUjdXJUQ+QA/Pxu3/82VW88rj0w5N0E=;
 b=FfAm3EE+uUt6dTDkfk7YKgsUbQO+2qgGDr4Qq/1m9gdoQTlbXYmxR7gj3XlD5Xt4aPjfhp5Jl772WGpqCLVjwtRlfkxWC3WmLJyM0K2cBVzlz4b1rp8PxJr+D7X0d6bMB6c3YtiKHCbyDcxyq8WIUElS8h5N5kDr/4oxyTaeCKGmw9dReRH6XTxjpFeU/nM/4rs1mmsysn0JHHm5Roa/8XwXyYTlACiODYkl+cERvMAlu+E74EZYk4yZA4LEor2W4+eMJaYct9NtvlAihxJ3DSk9hzkYaOqr5JFs1gHAs24zwNhjdyzAcQ60EJOW/0LDfvgud8/JyeBYbAx6nUZq+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rWLD/0xp0BR6MUjdXJUQ+QA/Pxu3/82VW88rj0w5N0E=;
 b=ETGX3D/Aof+L/13AM8OqeeZ+7/z7eCo1TahOSpZfgpysd/skvBM59jD/89IrOIUv+jq0+bAs3O+y6KoOBKsjl3Leoq0qgOOA3S0WpBBIRH6gFQW0lfYcIEKSkjbvUHbYUXyy90vMt7O/AQ8ZtnQpvUD7GzLNecmWgIDrsEIezv2PYJ0xaEEqpeasHl4DxbzZ8al518+NFA96PF2RlmIzzZq2ZCS4rwEBvHVQ+6B+2AxN6FrxiQg90XAj+UDyBJpxLnw3r0ckmCua7CPmM6HkMtZ8LQ4Vz/cRi7B3mhQa6GdvtmHpEfTA3VhANg6bw84e9Jsh7oNERe6SwnENw5B2jA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 BY5PR12MB4132.namprd12.prod.outlook.com (2603:10b6:a03:209::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Fri, 10 Jan
 2025 06:02:07 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%7]) with mapi id 15.20.8335.011; Fri, 10 Jan 2025
 06:02:07 +0000
From: Alistair Popple <apopple@nvidia.com>
To: akpm@linux-foundation.org,
	dan.j.williams@intel.com,
	linux-mm@kvack.org
Cc: alison.schofield@intel.com,
	Alistair Popple <apopple@nvidia.com>,
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
	loongarch@lists.linux.dev,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: [PATCH v6 09/26] mm/gup: Remove redundant check for PCI P2PDMA page
Date: Fri, 10 Jan 2025 17:00:37 +1100
Message-ID: <92ad193d19959e361b91eaf021a3ad81edc9f1b7.1736488799.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.11189864684e31260d1408779fac9db80122047b.1736488799.git-series.apopple@nvidia.com>
References: <cover.11189864684e31260d1408779fac9db80122047b.1736488799.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY5P300CA0055.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:1fe::10) To DS0PR12MB7726.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|BY5PR12MB4132:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bd742e5-ffca-4cc1-7358-08dd313c5031
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Gu6eaCo/giHFwOb2EvG+yFQuTN+KVL0fUktWrliD3O3fpGUkh92lq1t/GQin?=
 =?us-ascii?Q?FBZ2va/YIeY3drJ52mC11kjR8SA6+FJFeewSUseFkmckV6Q0MNWFQfhOSQwz?=
 =?us-ascii?Q?8tyzB7AygTE/w59h5TMKITmBes5GL0n/GFeWSkPDD13grFrGpHu6XEeynluR?=
 =?us-ascii?Q?QW21Kn0cJ4FWTpJdTXIQ55EMI4GRn8lp6+swp8QPtcAWDv3cD1Kh5bLAPqvg?=
 =?us-ascii?Q?8J+8efIx5ztRdY3IWsUZm0ZGaQwpX6WteExlVyBrn9NpvT+sC8pNAWMjHDLs?=
 =?us-ascii?Q?6x/n15mb4e+3lkcsCvVrliw+KFtnAaoLxJANKtOIAF5BaqQF2xLy9dQ/nffC?=
 =?us-ascii?Q?iR523TH6n8y1VTMkJlxCEUo/fbslV7T/PnxGiCvKuAdV5wh4OWoLaDNSUwVU?=
 =?us-ascii?Q?E4Udx/EaNAb2PYBVzV6XRJthB4p0UmRteibgq0Dauelbq+dFi4p7nSGN36Z6?=
 =?us-ascii?Q?5lqttju/cUGtr8mU46gwq7I+hSbIRHWzqrMq6eNBIOqYPZSkkSSb9jdM0YhM?=
 =?us-ascii?Q?vCxon4sWORmAiiNZ/+8/2UzFW5og2RVWlg3+THVDUzffGnVERGCDT0J/xuZx?=
 =?us-ascii?Q?Y+ahjWp6Z8UZwVHU3PCyIlvrM+evw3B9lIBbkkn19StLePlFeLSl3a5H1KUv?=
 =?us-ascii?Q?zSIkPm+zc7wdO1UYESD85iV1iz8MOBLh16oiFG0HiF6aXoinVeHD7VC9t5y2?=
 =?us-ascii?Q?F3Qni1Tyyd3DcoyZXDZCAAvNh//duLg21n2sb5P4CMZV+WaWvQ6LEmoFRi0Z?=
 =?us-ascii?Q?RvoOVz6PprUsJwxzV5qy9h9Ak8ub/KsX7QTb71Io1ZfOC4Bzfc0/5E0s1/YK?=
 =?us-ascii?Q?QJ+ob5e3yjPmT2p2G+YocdqeweNChJ2QEWFspmrMxdcMM0RPM0IZo0aqeIVb?=
 =?us-ascii?Q?OqCzfrQ11DfyJ3uiUTTGZgKQDDaW0gagSVafedIUzWj/CQXPi2RHM7Hn49H0?=
 =?us-ascii?Q?pDcGoUXAj8574XAGhsl180zOGJODyAZB859L5QzpOunZrrmFr5but4dsq7xO?=
 =?us-ascii?Q?rqwT484Iv6Q704VfisZsGuSVlkFdxWuP6+bmL+FYROUuP/BbF2ZL874S3VcE?=
 =?us-ascii?Q?hkLqFAYmZGRmOQ0L0P1YKecBtksfIF5GJG6wKyO8uxcgBS9vVgY64fcOnus3?=
 =?us-ascii?Q?/iZYbj/6EOSSwOUP7x1kXrie9f1+nGr0cOBTeet61z/FEFjXk5NnY4fOBPIL?=
 =?us-ascii?Q?v9j32+Zwx3lSzqCSaotFmkj5sv6OMI3I0MnVQ53xw/fmtm6+TK2JHSAwzhXA?=
 =?us-ascii?Q?uJV0xDtmyKerTQqN1m5w+H8h4q9kiHzFRXavq+71WDIx0DILhtFBhukeJzYO?=
 =?us-ascii?Q?EcmW4KhzAuOw5XoLDa2yOL9+ns/J9akfKZn7mkVcrm9UPjVwDuZqHRnhs+Hc?=
 =?us-ascii?Q?UzWGqfuruYOYwEyy+TVXUYP0bIZ2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QVGOf4HcpExUuM7MBJL1KI5wB22HyGTaAbGurY00v87kv/DSj/V+t+KD+nm2?=
 =?us-ascii?Q?cP+qczyBnrDnzZpr9jhiRwzyp3TKCIKVY/xEbO/9eXf8feaR6XVUmkivg+Ri?=
 =?us-ascii?Q?ypl90mD7bwuX7oFSNqR6l81hKLme1CPZ/nA8nDZ0SiLHfkIUCjY7c1WELVui?=
 =?us-ascii?Q?pKQ37qtFNUBOyVuxga/g52m56ffzkkjuxnuOSZGcVzacByrG4mSGKUr/KPrb?=
 =?us-ascii?Q?mWVqDr8/DGF6uN6QrOZdcVx0GUntIoxh/Ikt4MuPD8VKCvzWue8XmLZRwXtG?=
 =?us-ascii?Q?kJNexWV0XG2Yff6BiT/cBgDkdlY46gQej+E3bgX/ZRmsNHY9RhocBG4ItNTi?=
 =?us-ascii?Q?wuoeya6dEqklTNUv7kwhgNb4+KDg2JdAwee3to/xEWP0koFWUly2iITISpNQ?=
 =?us-ascii?Q?4zU0Sndu66JVyIW7j3kIrtn+U9VaG1rnaTApMvle6J5SRZt3vJNf2H9BvB64?=
 =?us-ascii?Q?6Ak2m6CIlMiEIGB4J19TuHjODRf8w1rMfmGCglR2Nu6XqrardFB0WHGHqLDT?=
 =?us-ascii?Q?CySDILgE88JnjSurGTa6vnT9eBaeBgiV2E9EwT/in7O7JKhMVoiCn6WePTDq?=
 =?us-ascii?Q?i9SpNyxF72Xd/OxRpR6bzHuvLucIRu98IFKnB0TmOXrTc/ZnL4d4H10VaNPk?=
 =?us-ascii?Q?YpnKM3PsdAiUtBFjwEijVMYxoxmMgbnTIYuBkKYOgNqsD1LVimA/bJzrDo0E?=
 =?us-ascii?Q?V2tPZPhiIiNP8u4tttiCKJHQwCVbfOPorPMjS5AqtePReRl34AwMGsfHpmvt?=
 =?us-ascii?Q?Dgq2I8ssFtBTmnFZhofJpQfLyFT9nIVoW2MsynmvOt0seeoUY3zOi1rVin0B?=
 =?us-ascii?Q?AgB4igdKkCuda0AsQH9ohO8cSOX1bu22Q0Qy6yfS1Ugw+8seHYGFQlLTiE7g?=
 =?us-ascii?Q?qrBOkdy1zN9ZopKMFe3BEOCgwFLrbVxQwbZDvSIPXqtXWjv4wWAtfF+AZ9Yv?=
 =?us-ascii?Q?hjs9RbbJt9Vpp7d8cO3pyde/sgKXIA+POhKjgsIeEB3Bpcc1tVyXzRs3abZX?=
 =?us-ascii?Q?cYKu7SVG+c/5mfp5yFh8oJ8GrcT1QSpWQXl6MmI5xDS4SjV3+jVF82BR8WVj?=
 =?us-ascii?Q?rq2Hm0dESadxBCNJe+kfy/8d7ZU851d3zr5ZDKTGwlLkRmfWpt3mvyGdkPTu?=
 =?us-ascii?Q?ib3rEBs9GaIp4++I8pSDKVG+rPVWgrv3BNWN1QKiaSw9fS3/iUwF2XEPBj/S?=
 =?us-ascii?Q?pu/nQnkJPTTKjKLNJdgvbShoHxjIOah5aRb5aVd/bWnpOiOKTaXFl/Y3riy+?=
 =?us-ascii?Q?mobAgUg/W5hO23b1RTp7JP7zVHq/bGkYfxNMrGPMtHMWmSPHJDbRATb5kcua?=
 =?us-ascii?Q?luJNWFhDtaNgkR7QxTDTr0UrCqdQ8c4Xwx4BWxs+DWxC8hdbIN/P6Sf9h/WE?=
 =?us-ascii?Q?haQTGW91g2xfVr3SQebbKL5G6M02IBvatw3lNnioeyQ5gSIx/LhHKQclwsmq?=
 =?us-ascii?Q?wliIysbgpV2N0vAbRfkyZsrHxj1oH1/bVjZFDGOLGq2z4io/mcwGfvtnIuZ3?=
 =?us-ascii?Q?LBDNN1vfSyTF4rZanOtidZ/pedMDU8qjOts7I/IsNop66TAaTypieTeVtnmC?=
 =?us-ascii?Q?UmA0CUM/gBqXNhm6LdQunkWpl2ffdOWfPQPJ/G4g?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bd742e5-ffca-4cc1-7358-08dd313c5031
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 06:02:07.1006
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o+ZAvNdB434eYnLjWIVD8kB/+MQergxCvpIdT39+qsvmUOhJtTvg02hZ0m4GEY9ZcrmTxB9gyamcu4y6ZKo3Ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4132
X-Spam-Status: No, score=-0.5 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

PCI P2PDMA pages are not mapped with pXX_devmap PTEs therefore the
check in __gup_device_huge() is redundant. Remove it

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Dan Wiliams <dan.j.williams@intel.com>
Acked-by: David Hildenbrand <david@redhat.com>
---
 mm/gup.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index 2304175..9b587b5 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -3016,11 +3016,6 @@ static int gup_fast_devmap_leaf(unsigned long pfn, unsigned long addr,
 			break;
 		}
 
-		if (!(flags & FOLL_PCI_P2PDMA) && is_pci_p2pdma_page(page)) {
-			gup_fast_undo_dev_pagemap(nr, nr_start, flags, pages);
-			break;
-		}
-
 		folio = try_grab_folio_fast(page, 1, flags);
 		if (!folio) {
 			gup_fast_undo_dev_pagemap(nr, nr_start, flags, pages);
-- 
git-series 0.9.1

