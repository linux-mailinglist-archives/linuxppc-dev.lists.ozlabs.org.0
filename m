Return-Path: <linuxppc-dev+bounces-16429-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJXQDzuNfGnyNgIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16429-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jan 2026 11:51:39 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA8AB98ED
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jan 2026 11:51:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f2Xr51xYZz2xWJ;
	Fri, 30 Jan 2026 21:51:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c007::2" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769770293;
	cv=pass; b=MA2ZPgFkX+49rGVd3zA8t0GEaHjRvzObZ7bmgnjiloarDkUBVdnk733GkGbse78/AFY1CZ9pkf+yDdHc4AmEEi6Bzo4YV1A3KRB9ShV1nZAD1IZETX2Pr/6WTpZAcX4su4im0fhwz+M58M+DptZ2Xflyksp0sMzojcJbgr9qy+naHl/k59+K65pXxZF8IHjexDHFe0Pgel01q7VOib00GaZ95WYdtV627kfrixdHkkhBHFGOK5OW9TgLriMDyMkorQWmbFaUzlqUi8oKzHXnbbWMAmDYPcbL9ST4RssF7t/WD1AUnEo2RFhDUaBB8y1m1hFNSi6voOdXRs0c/H8OZg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769770293; c=relaxed/relaxed;
	bh=HKWjn5EM/PqHwR2jXeRG0vgE89Hlu18YuCCcgql3Ya0=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=dg2SJlP/r1CXGOhcZxRZ1Dnzwv2TXC0aY52rf7pWLLajzF7akz4c1RsTQMEZI5NQEC1xJPcIdFXCrOUwyRukPT4w6HD91AH6/Enpp8sK4xlNVJQrfM/3KS9ji34vPuUkrv1UQoYNaFdXoRBFwx6vfgxFk0joeb2t7hGXR2O+OUzecgYlfGKZPlfh+CSl9Ln7mpuZFV/erlZBj9ErbnLApIcp2XOb55F00enKtBHQv2Qr/iirPEpDOrpcyEhrc0a+Y+p2z3KQ81lliXdhqNz2gCVK4P3fGqNokowVA/5kNB/gfhe31YuNYBx29tbk6hDuv+I+qGWHusoSZZj23EPwNg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=a6E/7NyM; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c007::2; helo=mw6pr02cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=a6E/7NyM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c007::2; helo=mw6pr02cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org)
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azlp170120002.outbound.protection.outlook.com [IPv6:2a01:111:f403:c007::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f2Xr32fv4z2xS6
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jan 2026 21:51:29 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kalnv7njngZKI4/qyJ455P/uEtTp4Jl5pOHVysOZX9gKsxIP38py3sGUQ80v75e0/FM1HMMzjAPSt29PeoxlRbde/aLi4uDlfuDM/KtDcialH0TOWftrCSy5m27KQQrlmhwQHJJvBQhJnCpbpExOdLxdY5Tx8AN9jIQBz8bWc+PaMt4dVYMuGiGD5lXD8v/L+CU6Ww127EQZdIpKMEbNCt21DZNbD0ig5tpJKsVDxTcGIkOH647knu7Jt0KAKHFcTimExzr+U1531PfgptaohOr4klzjqbg9tch3SBbAUoK41K9cJTcgPVtmxujg73YZW0S7pPSSYFcPqwxaVYoiXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HKWjn5EM/PqHwR2jXeRG0vgE89Hlu18YuCCcgql3Ya0=;
 b=XrCA+wjwt24VVVIY0KoH06ZeXD/VhyhxIt/6hpBYuCcdlxARtefQWBBeNhbrcHrKQrOxiKD5w9wj/41ixYofCCgbA0p/LnFHl+hFQ/7tcNdw4l+4WaD37cZhilkl7YqKQLLCklPhJiOPYjiNuh9j7oziuy0NR8+C55giMlE9QE0ZUV2eZ024nklqvM9f9Dtq7140E1Ou3gmFH0omhYukZKPrj3RWlOTSbTGe4K5q0YpEURdDPRRM2252syUth70EBsO3I4AXaFDo+jPhhDhawQfLPMcY6WacQ5qUqyZh5WVlBHaSyWs6QD8NNm+chxdq/E8GDibLq7U6KVRlMO+EBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HKWjn5EM/PqHwR2jXeRG0vgE89Hlu18YuCCcgql3Ya0=;
 b=a6E/7NyMUC9PVUL6ZsnBAeVGpyV9V1qYRcBVl0Pi+cCOZaqM5cA1rPqpi4832W8ydqq4kaRFFfRlTEI6t1Ro8rPSq+EkXbKm0MVHeyCu69JmFrcdWJRwXCCnzhre+3s/y077YlHKwGr4uUC3Q0a0HrrcBD7mUReBfwJ8RTtzbXyvrkoPMK4d6l3Xh5p+PuIl01VGak4z7KnnlCBS4QJxBPbB+94xudfL3r6Cuz39FandSWgH3Rp+1IuvEAQ+eSiOHREUtc4/Vf/4GV/1Kpme8Gjwgbat0mobcX+I4V4Z3vrQNsJoxxk08JQrkOW/RsjZ5APo2J0N+mXkXvAFTmvbDg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 CYYPR12MB8730.namprd12.prod.outlook.com (2603:10b6:930:c1::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.11; Fri, 30 Jan 2026 10:51:03 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9564.013; Fri, 30 Jan 2026
 10:51:02 +0000
From: Jordan Niethe <jniethe@nvidia.com>
To: linux-mm@kvack.org
Cc: balbirs@nvidia.com,
	matthew.brost@intel.com,
	akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	david@redhat.com,
	ziy@nvidia.com,
	apopple@nvidia.com,
	lorenzo.stoakes@oracle.com,
	lyude@redhat.com,
	dakr@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	rcampbell@nvidia.com,
	mpenttil@redhat.com,
	jgg@nvidia.com,
	willy@infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	intel-xe@lists.freedesktop.org,
	jgg@ziepe.ca,
	Felix.Kuehling@amd.com,
	jniethe@nvidia.com,
	jhubbard@nvidia.com,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au
Subject: [PATCH v4 00/13] Remove device private pages from physical address space
Date: Fri, 30 Jan 2026 21:50:46 +1100
Message-Id: <20260130105059.51841-1-jniethe@nvidia.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0060.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::35) To DM4PR12MB9072.namprd12.prod.outlook.com
 (2603:10b6:8:be::6)
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
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|CYYPR12MB8730:EE_
X-MS-Office365-Filtering-Correlation-Id: e1b94061-b125-493a-f551-08de5fed7614
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GzCWbY532AMxrGEBQnp11bkmBfSJxEXe9JOBCfefS1zKC3LzH8oiN7xX5HAh?=
 =?us-ascii?Q?wPLhQUeV6A1z0MLUp4+u0D7qHchsx/Rn8/9z8ii0dGmpWGwOxzKhnIcNqDj5?=
 =?us-ascii?Q?7sDV1KGg6TmSFHKUSxgUjP9pFNzR1l97cO3tKDU/mqpo+JuvHJyF7ojylVb8?=
 =?us-ascii?Q?JtQDGhMZbs78XMdH2mApE4+yIOYiQBo2QTXUfG0uCOnH5oHdRyQm0mCmmQWi?=
 =?us-ascii?Q?BfZkMf9cv5aeEm51pLI1uTh2zq5aR7gfh5MXkVmPnm4wCXbf2G6PygtXDruP?=
 =?us-ascii?Q?YtlSoycZ/tNyOvltng9SqAIgqVqbZVo7o9XbstZFDwLvnTux7qOrMcEo8EJ0?=
 =?us-ascii?Q?/dGF3UHNdZ6MkvuAMH6rbl+RXgMZSPiHtZzIThY1MhQZtw4x8IQ2tm850IA0?=
 =?us-ascii?Q?6TDhqJQySBArno3T3hbWqU5X5p4i2r+cFvZBOmLiF68bPG+gZgAqcUNdCAbq?=
 =?us-ascii?Q?241U220gVEUXo1/4tNIznAor41S1XWRxWP0fzP5EmlAYSaTL1mRGj8n1PVt3?=
 =?us-ascii?Q?X7Z9MEVlIi1U3QwsJOrx3mVjQXnFPbDXP15c4Aeihi31vMw+JgIFLXl0CNmU?=
 =?us-ascii?Q?T0/Sd+SYyqNxOShcQ8wp7Ag+BhSZAh4o/7MHQxLNQhUrCyvRhEybc6rHdqWS?=
 =?us-ascii?Q?UDWMwyJUMnGJ7ZRb8CaZgkKG5PBNRDgluFvEPBGmCybRX3QNlZm1/Ob264dQ?=
 =?us-ascii?Q?HdBWi9aYHTCS7/wkJn0inTdNlXWEChegUmJAo+ngS0YPlglxyaOINH2rgHSK?=
 =?us-ascii?Q?hvovneELOvk/YRrxcvzgQvl2wT6xy49SB8DW9qqZUQL+T3PRHmvgOpIr/U+1?=
 =?us-ascii?Q?hsexJ7tmIu63/WtVSb2GvNXPCBmxGYX94YrRSduIbflMgiRSofNgKLUodUif?=
 =?us-ascii?Q?cT2dGg91PlA5m7NVPjgxGiZh8J/VWBSvlIr7ZjLv0tO4xRh6iH+DmcLRHLNe?=
 =?us-ascii?Q?/1Hx6AaRg/ZtgJiVAhdDsCyQXa7ylVTkUei8rVYkkh1m1H0+M4WUGCyYWkEk?=
 =?us-ascii?Q?gk8Ha/KbRggCVgoDUoDhryXXut5L0/NtcQzSJFVujDO/jXsetk+Bn9IpYnz7?=
 =?us-ascii?Q?GM+UIYzm8GHjDdpfkUGKD3OJFCUB344/ZDROAu0uG8cxael0V+DNX+mZTlNt?=
 =?us-ascii?Q?39sZURnj4eorVDeOJjKEVZRV5hC2bvtTb0DPxEIGT6iE9qPUthMysDbockmf?=
 =?us-ascii?Q?FsGV+c3KsuvYz6ke4rregAvY4yjYshZeYOIKf1ObxMfHtNMb+GjTE6JiuO/U?=
 =?us-ascii?Q?exR4naVR0bxQ9YLKHy4Ye4pS28TTSpP52PgPi53SRh7BweL6QFrv34QlkdMp?=
 =?us-ascii?Q?KjlushWVWHuobQt6rIwZGXUetx5WZD0MJCCHtsyJJdZkTTiwQ/8Ysz4FOlt3?=
 =?us-ascii?Q?55T+0nVrOFvSxt7AJartXi4sosgpL698c9szbO15RZr0lsaVMqHUs9v7cTSY?=
 =?us-ascii?Q?E0+578d0RUJLu7CzyqFx7lkkfHF19qJT5gFC2zN8hvbkK4IH/kEOS1rXssGD?=
 =?us-ascii?Q?6DLB2FVUIelzUx6fqGsP90FnF+nOfApDFHdqu+4gdGPavMHVPRwVBgNp+qG4?=
 =?us-ascii?Q?ZDyB+SpwrPWX1tH++Ro=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB9072.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Dff4DjT3Ng33Oj/giLya97bLDJfOAOgJj5lFv93AV8Adj1ancW5N0AkDTu/G?=
 =?us-ascii?Q?7B5scX8G+RBJxWrh0RHylVpoI2rnt7wP8AExrexaUgJ1LkyAafwpEVC333J4?=
 =?us-ascii?Q?pOaLA1EXh8+qTsBpOYu4CnU8A4fq755kuvCzDlXDKK1hCu42pq4RkRYi/AXl?=
 =?us-ascii?Q?YHUCJEqN4KK4xU77Zy8VTh7sWlrj9UC/n2Z89pmoLz5gQHiPT3ziHD7vqHSh?=
 =?us-ascii?Q?69LIbLYNm5Bg8zLAhFxKRDoqzcgAkonzhPplQ/Y5cEk62u4U5hneOQoSTs3y?=
 =?us-ascii?Q?2xZGUze/V0FKEDD9RZWgjGbpYCryH7RWM/0xeJAwRRihH044p3QurJu/qy3E?=
 =?us-ascii?Q?i1MNer9TY/Gfe419l88zD7/+xplyBatfK+gbPdEWcb/vBdUlOvuhpfhXEk/d?=
 =?us-ascii?Q?6XZhAjC+314Q0z1MzfX1bNIrGEH/YTIAOPbNjrxtySNdttVGwW8o5UF6gZnb?=
 =?us-ascii?Q?u4dgl/5Xi7mcw6pQEisVlFR9JGAQ7WxSKLpe76+j8c5OUBHJcsF1Odad9oPo?=
 =?us-ascii?Q?g1dn/4zqXdf5QxlKxmh6VaWaTyP7MU7mvwUjSnqXiyrePXS/jyM6bYl7qJrq?=
 =?us-ascii?Q?xV7EhTfqXF8BHZQfdjYLeaUubRNU9AG8vmiEd9fN0596oONEcwKVD2Hdk7dh?=
 =?us-ascii?Q?e9FYR4vOacaR35zdj4Dz7WFWmzYi8CdsDEOUOFVSGlncosuMYBlPUh0qQWqC?=
 =?us-ascii?Q?NQ4kY2zhIRkyjYRNDN9I4cXOJN29FE9Gky/OOK0I68ye4EWtzxrHJ1rkFEC8?=
 =?us-ascii?Q?olTLp2dwdAelwizgTEozY+XzexRN2DfcaIJXxo/UsutUpS+qnOR3CDhj1zRp?=
 =?us-ascii?Q?VEZ0lOsgtbFbQAebl9gh//3bkLdRXTc+978opQEwy85tQn00n5/rTHf1lwYB?=
 =?us-ascii?Q?lbDPYvAsHLLL8v3AlSnpRS7uiQBOGINTA8o79FBeMJ/DoWq3ZuBZJqDkUpkY?=
 =?us-ascii?Q?lb6nPHuRYkPKVcVbvgvsDsu3poXLW5uFY+99ltgP0BcuTqF0FLam1oi3DILZ?=
 =?us-ascii?Q?GYN1PCdDqwJ4aHuaXkoZPkmd8ad7i9mNQizh3SSit0VNcwCNloWEna9jsW7z?=
 =?us-ascii?Q?ltve1K+3satmB1xRwzgipU+YgdY88n8AXPd47x8DPYx5TWcMbSePjnJeycoH?=
 =?us-ascii?Q?1ZVMEDqb3jayAshcfeX5Uoh3jjhxqQHabbEDKpNgP1HlURCkgt4ULeZlQtwM?=
 =?us-ascii?Q?BxUoiVpZh4LHb+p1/606EjbUtRHqf0srSVunHINFY58Jixr1hlIEt/zMvRfA?=
 =?us-ascii?Q?AhWgDr1pRzLUxW27YS8/SFWqy/mWTi9lTjQ0mqxmqzjTxmePmk4V6NNcB6ut?=
 =?us-ascii?Q?upFAs0bfIYR80Sf9tlI5RL1RAMAM1eMsG1ii4LsxDCKxmGlYl7aue4tOR/2u?=
 =?us-ascii?Q?Bf64xiQPCGHp7+PaL4bJ51EUfTiL4KyXoogHOGgnUu9YX+lp/oeUQXHUv/VK?=
 =?us-ascii?Q?T9vUqnoCwPV061zBbF8UALKkZstoMVYKb9Jv79MpeOKke1eN0PKMvEviOeJN?=
 =?us-ascii?Q?cekhLTyBm8GdNR52rdVwDj2RRz0XuxLmygZcUBVhaAb4Zm4/s0ADT3RbGcmq?=
 =?us-ascii?Q?0WNL39Le58VNmzPcpYJvQ32wGpSiUs18xJztPD3l3BknCS53hWsafGsyZq4M?=
 =?us-ascii?Q?Eyb/S2jMiBPi2hTQv34Jrc3jN2VgrGeX0RPTkhfUeogCUry0YSbYaiRKcnZb?=
 =?us-ascii?Q?A3d8oksVgq+Oo2/tcvxVy8OPMM/dJzKM5yaOoPiyVgPZGi1lKUaNQKykri7V?=
 =?us-ascii?Q?RJQ9kshqTQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1b94061-b125-493a-f551-08de5fed7614
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 10:51:02.8389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TrHRCAA4SCUHlXJxFfBPbauePc3kVgONNdfCAX0Nth6SjFrGPbCbeGGNN4UTwB7KhqLZfXRK0fXk9aGopd+w0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8730
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-16429-lists,linuxppc-dev=lfdr.de];
	FREEMAIL_CC(0.00)[nvidia.com,intel.com,linux-foundation.org,vger.kernel.org,lists.freedesktop.org,redhat.com,oracle.com,kernel.org,gmail.com,ffwll.ch,infradead.org,lists.ozlabs.org,ziepe.ca,amd.com,linux.ibm.com,ellerman.id.au];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-mm@kvack.org,m:balbirs@nvidia.com,m:matthew.brost@intel.com,m:akpm@linux-foundation.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:david@redhat.com,m:ziy@nvidia.com,m:apopple@nvidia.com,m:lorenzo.stoakes@oracle.com,m:lyude@redhat.com,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:rcampbell@nvidia.com,m:mpenttil@redhat.com,m:jgg@nvidia.com,m:willy@infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:intel-xe@lists.freedesktop.org,m:jgg@ziepe.ca,m:Felix.Kuehling@amd.com,m:jniethe@nvidia.com,m:jhubbard@nvidia.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jniethe@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jniethe@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 2BA8AB98ED
X-Rspamd-Action: no action

Introduction
------------

The existing design of device private memory imposes limitations which
render it non functional for certain systems and configurations where
the physical address space is limited. 

Limited available address space
-------------------------------

Device private memory is implemented by first reserving a region of the
physical address space. This is a problem. The physical address space is
not a resource that is directly under the kernel's control. Availability
of suitable physical address space is constrained by the underlying
hardware and firmware and may not always be available. 

Device private memory assumes that it will be able to reserve a device
memory sized chunk of physical address space. However, there is nothing
guaranteeing that this will succeed, and there a number of factors that
increase the likelihood of failure. We need to consider what else may
exist in the physical address space. It is observed that certain VM
configurations place very large PCI windows immediately after RAM. Large
enough that there is no physical address space available at all for
device private memory. This is more likely to occur on 43 bit physical
width systems which have less physical address space.

The fundamental issue is the physical address space is not a resource
the kernel can rely on being to allocate from at will.  

New implementation
------------------

This series changes device private memory so that it does not require
allocation of physical address space and these problems are avoided.
Instead of using the physical address space, we introduce a "device
private address space" and allocate from there.

A consequence of placing the device private pages outside of the
physical address space is that they no longer have a PFN. However, it is
still necessary to be able to look up a corresponding device private
page from a device private PTE entry, which means that we still require
some way to index into this device private address space. Instead of a
PFN, device private pages use an offset into this device private address
space to look up device private struct pages.

The problem that then needs to be addressed is how to avoid confusing
these device private offsets with PFNs. It is the limited usage
of the device private pages themselves which make this possible. A
device private page is only used for userspace mappings, we do not need
to be concerned with them being used within the mm more broadly. This
means that the only way that the core kernel looks up these pages is via
the page table, where their PTE already indicates if they refer to a
device private page via their swap type, e.g.  SWP_DEVICE_WRITE. We can
use this information to determine if the PTE contains a PFN which should
be looked up in the page map, or a device private offset which should be
looked up elsewhere.

This applies when we are creating PTE entries for device private pages -
because they have their own type there are already must be handled
separately, so it is a small step to convert them to a device private
PFN now too.

The first part of the series updates callers where device private
offsets might now be encountered to track this extra state.

The last patch contains the bulk of the work where we change how we
convert between device private pages to device private offsets and then
use a new interface for allocating device private pages without the need
for reserving physical address space.

By removing the device private pages from the physical address space,
this series also opens up the possibility to moving away from tracking
device private memory using struct pages in the future. This is
desirable as on systems with large amounts of memory these device
private struct pages use a signifiant amount of memory and take a
significant amount of time to initialize.

Changes in v4
-------------

Thanks all for feedback and suggestions on v3.

The only major change is using devm_memunmap_device_private_pagemap() in
xe_pagemap_destroy_work.

Note removed previous discussion in the cover letter relating to aarch64
and memremap_pages() as this was actually already addressed in commit
eeb8fdfcf090 ("arm64: Expose the end of the linear map in PHYSMEM_END"). 

Details:
  mm/util: Add flag to track device private pages in page snapshots
    - style: move logical continuation to previous line
  mm: Remove device private pages from the physical address space
    - Use devm_memunmap_device_private_pagemap() in
      xe_pagemap_destroy_work()
    - Replace ^ with != for PVMW_DEVICE_PRIVATE comparisions
    - Minor style changes

Jordan Niethe (13):
  mm/migrate_device: Introduce migrate_pfn_from_page() helper
  drm/amdkfd: Use migrate pfns internally
  mm/migrate_device: Make migrate_device_{pfns,range}() take mpfns
  mm/migrate_device: Add migrate PFN flag to track device private pages
  mm/page_vma_mapped: Add flag to page_vma_mapped_walk::flags to track
    device private pages
  mm: Add helpers to create migration entries from struct pages
  mm: Add a new swap type for migration entries of device private pages
  mm: Add softleaf support for device private migration entries
  mm: Begin creating device private migration entries
  mm: Add helpers to create device private entries from struct pages
  mm/util: Add flag to track device private pages in page snapshots
  mm/hmm: Add flag to track device private pages
  mm: Remove device private pages from the physical address space

 Documentation/mm/hmm.rst                 |  11 +-
 arch/powerpc/kvm/book3s_hv_uvmem.c       |  43 ++---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  45 +++---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.h |   2 +-
 drivers/gpu/drm/drm_pagemap.c            |  11 +-
 drivers/gpu/drm/nouveau/nouveau_dmem.c   |  45 ++----
 drivers/gpu/drm/xe/xe_svm.c              |  39 ++---
 fs/proc/page.c                           |   6 +-
 include/drm/drm_pagemap.h                |   8 +-
 include/linux/hmm.h                      |   7 +-
 include/linux/leafops.h                  | 120 ++++++++++++--
 include/linux/memremap.h                 |  64 +++++++-
 include/linux/migrate.h                  |  23 ++-
 include/linux/mm.h                       |   9 +-
 include/linux/rmap.h                     |  29 +++-
 include/linux/swap.h                     |   8 +-
 include/linux/swapops.h                  | 100 ++++++++++++
 lib/test_hmm.c                           |  87 ++++++----
 mm/debug.c                               |   9 +-
 mm/hmm.c                                 |   5 +-
 mm/huge_memory.c                         |  43 ++---
 mm/hugetlb.c                             |  15 +-
 mm/memory.c                              |   5 +-
 mm/memremap.c                            | 196 ++++++++++++++++++-----
 mm/migrate.c                             |   6 +-
 mm/migrate_device.c                      |  76 +++++----
 mm/mm_init.c                             |   8 +-
 mm/mprotect.c                            |  10 +-
 mm/page_vma_mapped.c                     |  26 ++-
 mm/rmap.c                                |  59 ++++---
 mm/util.c                                |   8 +-
 mm/vmscan.c                              |   2 +-
 32 files changed, 783 insertions(+), 342 deletions(-)

(drm-tip for intel-xe CI)
base-commit: 344db0fba38920be64a429c64a8ca0531572896c
-- 
2.34.1


