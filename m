Return-Path: <linuxppc-dev+bounces-8991-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 654E1AC78BD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 May 2025 08:32:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b7Gl10STpz2yRZ;
	Thu, 29 May 2025 16:32:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:200a::612" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748500364;
	cv=pass; b=oPaz+uIV5qoYx9FBnCa0E3TbXeg8CZnYekqXnTmM1cpuNAnAexeywtLlfjxMHyLzNYYxRylw+r9JYiHva7dPhakmBxxM18WllrGNCYTaAVPapjy7uwl0w+kGIkNRs5ZCVFm1fO/MOMe/66ST5/dDO4VofuxIKVxRmO8fasfHL7cwO+5baDZCNi6EL7rA2kManOdUEOcdnAlhtOTd5YxKlSJ8yHXmArJephICfJzhten3pWQi5V+Ymp0CLYHB8QtseJwNMyLL4+HxdsxDvkmRKiTySWpfd2jwLA9svIpnrCREpbtLbn+/8iht2Vsrs1xq4uRrkOfGMx3fz4kIOLDvcQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748500364; c=relaxed/relaxed;
	bh=xB3oA6Y8+/osQQanzWLFz7e8px4UDa9rXcHzzfQyMCU=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=fmyMxa6YtNpYQSd+0cE2piuw9gHVFtKliCnmd/XWr5KTxepqYg2Ec2QLDyDvUDd9bCXrA3Xh+04u+MpHAPmRJneLeXjiGHYVECN6pu5tirTA7/y5DITa3x7SWbgX5010QXCuWQ2BGy8gfX3W24exUIz8FhBPzCgF02mnEDZMPlhMJI1IK9HHKE6+cBqr30z4MDuxATpfSqJ3+JMnyTY/an/zMmh/rFdFIKhs1t8+K6kRIqhCYcQcNAXfNB1Zsw2Nw7lyYrExo/m/hz3W2l2tG7admwKMyYNP5dbIeBlPzR6y9v25MgThMto2KET9xPeX8BdqZ34G6CvUH9x63oG1kA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=OV4EoCMa; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:200a::612; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=OV4EoCMa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:200a::612; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on20612.outbound.protection.outlook.com [IPv6:2a01:111:f403:200a::612])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b7Gkz42rXz2yGx
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 May 2025 16:32:43 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sX1zKIqONjDKWYEFpFxIieuIpnq6FpccpOUXCWrN3TGN3og5zHUi9xbvkofdcAF0U/MIwPQ96r7RhW4zod4W6C5RqBT4eMaXllaumjMO4gRqed1UOIfGjFpVGURHYZvbdggC5FtX11VA7FHTUJf/kGaG9UiIhDokMMzs8ZY21oheh3RI1gwu5USjrmHRTHd+oxJmeuNo5MRiXQ+ypN1pc5TzGs/gTVVIw7TxCi8kLmQHvqRhrkze7ZXPfd4gfAwv960Ih2L5+nHd1SbUPZve5/UKX5Fk3TXLAChB7RLtZriKzCUbCi7hu2DNyTU+MRg3bh7BsAPpcEFjakuSs8FxNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xB3oA6Y8+/osQQanzWLFz7e8px4UDa9rXcHzzfQyMCU=;
 b=SzDAM4p6noRX58HxgxyXo2oxXidhzQaEOabf9m9/5W0iUTw6PBx4hKMwhlTltXWJ/EECIpj7HWw41N2tjrqG55VbfSqWAj0D2Gxi+Kbnaqh5WjZNbs2AM5FoRpYeCrtWrS91SHFFc7PPu4RhqdsMej/Y8D8PlYMIERFtGonu6bYxZWogtQKvhd1ISeXwvddGjdJZeE77ovDG9hUyRSFYc5+RKpoz0VKCWHn4lY3mRI3vs6DCU99Zs5t9W10qE/O+nQfK9n1Zow2G1j6wUABkAHfMZmzkudywqxq4bxLtG9X/cjv1VJ20h5OiepknSVJTRINz+1LrD6/eBeX0hsuv5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xB3oA6Y8+/osQQanzWLFz7e8px4UDa9rXcHzzfQyMCU=;
 b=OV4EoCMavqLcDlQWz2m49ch05tLN5/eu903fmNOwqAVnyYHEaq16Rw2gEOJ3eHZTFXxPnCjaC0N35a4sVJ6XOGyq9XnxAPUuQuEcq2lAe5EwPCZP23+MilpByGSdL+/va6fuWRyj/m6bYFSx3TMJcLtC0F5WF2a9XqumsBjVxEl2S4r8bl5cCbtf6MYKHW+loKJ/LFMyYgTJuyenuh59hQR/gdGoYwCgarzBuAejmA/ZKjRG3s5M3iPRaDBAgj6vqL8cOOZ10pNvSEz1uJlR5ztqLu8ZKr/xRiIHN9rsC1NFl4ZDLH9bXEBZUF/0AQdvZw743nr3G4Mnm/K+UPuUag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY8PR12MB7705.namprd12.prod.outlook.com (2603:10b6:930:84::9)
 by IA1PR12MB6092.namprd12.prod.outlook.com (2603:10b6:208:3ec::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Thu, 29 May
 2025 06:32:22 +0000
Received: from CY8PR12MB7705.namprd12.prod.outlook.com
 ([fe80::4b06:5351:3db4:95f6]) by CY8PR12MB7705.namprd12.prod.outlook.com
 ([fe80::4b06:5351:3db4:95f6%5]) with mapi id 15.20.8769.025; Thu, 29 May 2025
 06:32:21 +0000
From: Alistair Popple <apopple@nvidia.com>
To: linux-mm@kvack.org
Cc: Alistair Popple <apopple@nvidia.com>,
	gerald.schaefer@linux.ibm.com,
	dan.j.williams@intel.com,
	jgg@ziepe.ca,
	willy@infradead.org,
	david@redhat.com,
	linux-kernel@vger.kernel.org,
	nvdimm@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	linux-xfs@vger.kernel.org,
	jhubbard@nvidia.com,
	hch@lst.de,
	zhang.lyra@gmail.com,
	debug@rivosinc.com,
	bjorn@kernel.org,
	balbirs@nvidia.com,
	lorenzo.stoakes@oracle.com,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-cxl@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	John@Groves.net
Subject: [PATCH 00/12] mm: Remove pXX_devmap page table bit and pfn_t type
Date: Thu, 29 May 2025 16:32:01 +1000
Message-ID: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.47.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SYBPR01CA0125.ausprd01.prod.outlook.com
 (2603:10c6:10:5::17) To CY8PR12MB7705.namprd12.prod.outlook.com
 (2603:10b6:930:84::9)
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
X-MS-TrafficTypeDiagnostic: CY8PR12MB7705:EE_|IA1PR12MB6092:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a6ca56b-6973-4209-743e-08dd9e7a9116
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+o2n/tSGWclT7ExFClM0Q0hjRou/+zNIl70FlEI1E1V9fAVVhgCHoyeIXJLn?=
 =?us-ascii?Q?Z21vDd/54o24HJnLzbqo7dtu29EfeoW1ZkaJ2sssuxPKZvYIia/IN+SJhrCF?=
 =?us-ascii?Q?X5uR+YZqsM7rHCv+GgwZv8S5UDVgkRIkY74Uc2nFHmgFJqm3oPUOCvNiTKV5?=
 =?us-ascii?Q?2CpOOCWVhoN4il6sHCB1xuj0k/Mijv5AH4fHGaNgEKgD7zCFlVt0nrCMGUK3?=
 =?us-ascii?Q?s6pxd+wEJoBkwl/XBiR6vS3tR8tLtHF0589FY4t0ZVFJJp9Q32WDAiwafNCk?=
 =?us-ascii?Q?fQsDqnIRZAifVLBP4fKr95HB29sLS4KKEmtKjPxbNXPJ4+KgB8H3a6189KW5?=
 =?us-ascii?Q?6UTn0F/vtJpQjGxWdo2ZbruZ6a+4qCOfvAZpw+6uY50JaEcHXplLZN4m/QnS?=
 =?us-ascii?Q?lFUdKUXrCs8JfinQaPuQJU4nVf80PujZvVi+YorN7QM7cTsSdS168L9QLToy?=
 =?us-ascii?Q?ZnLAve0D6h4j2Q2dRtxg/x4AUYch5yfZDeg4dEG2vIMn57oto1iT4cTEQVm4?=
 =?us-ascii?Q?jLxAM/26ZQaF+O5iLVh7XLnNaHiBi+7+jTkjFzrjaXR318w0p8dOKSVvVG5B?=
 =?us-ascii?Q?sRugqwDwN7WxHBGwCFllIkiIDwWmiAamsPSmepmcuXNy+eJTLqUc3IwQiG6F?=
 =?us-ascii?Q?1KHI3wljvwyxDgxSV5hWljyEBqbzkPsCHX14C5u5lOjaEG4MdJ2dFGXrAuU+?=
 =?us-ascii?Q?Cr7A3wGIG1j8RHFCURQIsf++hILJFgq4Q5iFP7P6rWvqc599Ei7bEeLPophq?=
 =?us-ascii?Q?cQI9QjWojgRn0+axZvBHqI1pAOLzy2TTbyJ4C8IR3dJ86QvcKGBQoqR7P4UN?=
 =?us-ascii?Q?OHyh6aL5X+K/q+AOSj71/tBxz2VYLPNN6f7HW7EncIp6GXCH66OiI8jP+H+a?=
 =?us-ascii?Q?w3VB/6LTSYRR0taLmijq/j6Yr9fuRQssPpVKH9XHldwZeL9DR36NKuFAAycK?=
 =?us-ascii?Q?vSSjdvEhCXZ1jIopDiHCsjsjQv7Wkg5WbYtlvOEdZWusm0Be3FVMQsMur5Ay?=
 =?us-ascii?Q?Lh7bMC05Nukmfn+UIlYZ5jymL4P/kHHHO4CVPnMaZQxTu8NoDNyuZqW7Hqzx?=
 =?us-ascii?Q?FMiSAK9wOaW7RfyFKhjnTkL0ck3NVHoHpKn2h4GzpYmzlt+itPfQxExL1n1v?=
 =?us-ascii?Q?QVADg49A3stJD5zNUZhIdukkUH6jept/EUZGANWtDB3PezjqhiTPofeB0gTB?=
 =?us-ascii?Q?w3E83nFuO6CTdURozTywL+fSV6fucdxPgPnnuTl1Yvke5gF5zqkqRilQiqrC?=
 =?us-ascii?Q?EKuo7mBoB36MhoD1LSJIGHfAq3Sc6ghPDguD16qp2MKAZDE2k2SlZQ2K/4MH?=
 =?us-ascii?Q?BS/1jvbp8Stmcf2oD1OAonVI1v3vUm1bXuK1P3GpLUG3UrvPpmUhDCW8b+Wy?=
 =?us-ascii?Q?EC1jIvGwnlJyt1h8rEWmtYZ8Ob0n/ibspYHXBzTHVz9xlq74reJ7j/0YMtdL?=
 =?us-ascii?Q?10x6zYBktND6AJS8j5pPtJUazWce53WQ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7705.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?r5X68baWoAVdpwlZtKsvdy/6mKu+AZ7GbvRQbDABEVwkdMKtiaxLb/Fl9JIR?=
 =?us-ascii?Q?2S+rpcFO95aKxeIAR+gwRQl9FbMkk0q89XIlWxfKW7TYHWGrwjILIm9EwNR1?=
 =?us-ascii?Q?CYaT/iB5kLxqxQFMgYNolrm9RfRUlQvgrCnBynNciGvf/Rt6yx8t9c7FCrwM?=
 =?us-ascii?Q?G1FxMzUjYN60g2Bp9OQ3xBuUN8zpIvFQsA5Ulh6vJbrMuS/WeJrGj8lLbX5Z?=
 =?us-ascii?Q?dsFxwST/TqSx8kva7kAseecMhrJX2u88F6p0CZFtudrl3MP7x5rA3m5LkY6z?=
 =?us-ascii?Q?+0m5qANjfG4w1uNakY79OQgzijS9fXeIjF+XInmfXMi5oX47n8A38Zrl00VO?=
 =?us-ascii?Q?idwdW5HPaW2YNFZNYcD9qWWasODpWZpBe7dskgoWQStQkdELip+9BrJ+KoqR?=
 =?us-ascii?Q?W+oJIF3dLAbwyt/5XbAOX7OsDXz7++3h6MvI+r5cTB72jzZsla0hXEJVX2ka?=
 =?us-ascii?Q?FswPdaTbiUgHYzxki3GBn0OVpgHPsYT8t+N51XkFQb41TUYqmHGqIq7vr/W1?=
 =?us-ascii?Q?F5RSC8QaPQUkO0pXj8aY2eTd19DO7ooELUwsJlD/3Z+erUkWiprnpZh+kgLn?=
 =?us-ascii?Q?2yuLhwUyhRre0iUCeecjajwAaHos5uKm2rgKHyzzthC3YQFdrn17DKBxKdXn?=
 =?us-ascii?Q?VKx7b81xtGBLrvqjlvVm/x9hK6pPmDsQlQI8Dho0oAzRRoYBSH7M4IQ5nOm4?=
 =?us-ascii?Q?apNM499WeuIrn8mfJ+wYieE2+GWTs9R5Q4w0WInClIuPDRehC3RJjJEQEeaN?=
 =?us-ascii?Q?55R9+GY800mcJv9KSo5qH47OP+pjoKchioQgGqq9w/yVdahukQ29He4H2Ki5?=
 =?us-ascii?Q?SeGkCngUPLgnKoi3SYB1aZrvxY/bx4eVtR+De+mhAcmTi4MJRxTMsSgAWh8V?=
 =?us-ascii?Q?BSgqeyuSNGdZjggu52+OY4pXndyrffzQKnR9Sjb1ErJm79aqL26iGQ+CfOCA?=
 =?us-ascii?Q?G7MY9RL3JKwQbxvHKuCkATVB5vasZsrfxpObTXDvmqBXciq2AIgIeZkNK0RM?=
 =?us-ascii?Q?zGj9Vo2JbmcsEeR7/XaNUE7Bj82hpKkbrQoXIZLpWdbPt5fZa0YccvFvsOK6?=
 =?us-ascii?Q?gpgEpRH7Fza/zh5xaXIhFDw//wnpV8oVZ4gu5RItpOwuhvDgMRvMAXc0PewD?=
 =?us-ascii?Q?hfpf/cLXKSRQ/jnUJxv5VKyJ+J525izsDz7rWnHT4pJrYdXBFzwgCJbIX5lX?=
 =?us-ascii?Q?YUCLjI3WL4UcZQdOTk9SRn77o8pawdBZ3AdtZFVSNUIBDqcfCDdt36jzkbQP?=
 =?us-ascii?Q?YID4opGSMT02Vvaorai82PSrkgO3G5hDedu6BNSgGGLwbjdJt3CTXEKWxryz?=
 =?us-ascii?Q?bzNEVWr5NGeN8E9sYMFdJEPKRQRL4Tpxil7s2n5jQix/w3O4PRvFf/F8UMGK?=
 =?us-ascii?Q?mf6S29xl+YvJu6J8gN5YbxqYjxCz2P0L8GI3WBs4w+/JfQ7qMm5IWJCQ2Y/f?=
 =?us-ascii?Q?a62ZhLox2D25mFl3fCGrFNXHc3fyKM+B37L5sGq8Jecl7NH1QNfBVeHhXwMa?=
 =?us-ascii?Q?ttnW5Bqjx/+iBjeXuRYRLVddHIOIy6gh99ty48WYXZb5dSp2Q+f9fZKfwc16?=
 =?us-ascii?Q?9bYuHS2PovDBo6AQHeYuiwqAT7tOwyc6NArjWx31?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a6ca56b-6973-4209-743e-08dd9e7a9116
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7705.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 06:32:21.5699
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uIrNfr8HwCB8NBtw7aCjnMnUZ6TL8grGh5hk+Vpm0fYNFjONMJqnpthmhGIiMZkw/EgqZuXw7U4LF5eM29ZabQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6092
X-Spam-Status: No, score=-0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Changes from v2 of the RFC[1]:

 - My ZONE_DEVICE refcount series has been merged as commit 7851bf649d42 (Patch series
   "fs/dax: Fix ZONE_DEVICE page reference counts", v9.) which is included in
   v6.15 so have rebased on top of that.

 - No major changes required for the rebase other than fixing up a new user of
   the pfn_t type (intel_th).

 - As a reminder the main benefit of this series is it frees up a PTE bit
   (pte_devmap).

 - This may be a bit late to consider for inclusion in v6.16 unless it can get
   some more reviews before the merge window closes. I don't think missing v6.16
   is a huge issue though.

 - This passed xfstests for a XFS filesystem with DAX enabled on my system and
   as many of the ndctl tests that pass on my system without it.

Changes for v2:

 - This is an update to my previous RFC[2] removing just pfn_t rebased
   on today's mm-unstable which includes my ZONE_DEVICE refcounting
   clean-up.

 - The removal of the devmap PTE bit and associated infrastructure was
   dropped from that series so I have rolled it into this series.

 - Logically this series makes sense to me, but the dropping of devmap
   is wide ranging and touches some areas I'm less familiar with so
   would definitely appreciate any review comments there.

[1] - https://lore.kernel.org/linux-mm/cover.95ff0627bc727f2bae44bea4c00ad7a83fbbcfac.1739941374.git-series.apopple@nvidia.com/
[2] - https://lore.kernel.org/linux-mm/cover.a7cdeffaaa366a10c65e2e7544285059cc5d55a4.1736299058.git-series.apopple@nvidia.com/

All users of dax now require a ZONE_DEVICE page which is properly
refcounted. This means there is no longer any need for the PFN_DEV, PFN_MAP
and PFN_SPECIAL flags. Furthermore the PFN_SG_CHAIN and PFN_SG_LAST flags
never appear to have been used. It is therefore possible to remove the
pfn_t type and replace any usage with raw pfns.

The remaining users of PFN_DEV have simply passed this to
vmf_insert_mixed() to create pte_devmap() mappings. It is unclear why this
was the case but presumably to ensure vm_normal_page() does not return
these pages. These users can be trivially converted to raw pfns and
creating a pXX_special() mapping to ensure vm_normal_page() still doesn't
return these pages.

Now that there are no users of PFN_DEV we can remove the devmap page table
bit and all associated functions and macros, freeing up a software page
table bit.

---

Cc: gerald.schaefer@linux.ibm.com
Cc: dan.j.williams@intel.com
Cc: jgg@ziepe.ca
Cc: willy@infradead.org
Cc: david@redhat.com
Cc: linux-kernel@vger.kernel.org
Cc: nvdimm@lists.linux.dev
Cc: linux-fsdevel@vger.kernel.org
Cc: linux-mm@kvack.org
Cc: linux-ext4@vger.kernel.org
Cc: linux-xfs@vger.kernel.org
Cc: jhubbard@nvidia.com
Cc: hch@lst.de
Cc: zhang.lyra@gmail.com
Cc: debug@rivosinc.com
Cc: bjorn@kernel.org
Cc: balbirs@nvidia.com
Cc: lorenzo.stoakes@oracle.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: loongarch@lists.linux.dev
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-riscv@lists.infradead.org
Cc: nvdimm@lists.linux.dev
Cc: linux-cxl@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: John@Groves.net

Alistair Popple (12):
  mm: Remove PFN_MAP, PFN_SG_CHAIN and PFN_SG_LAST
  mm: Convert pXd_devmap checks to vma_is_dax
  mm/pagewalk: Skip dax pages in pagewalk
  mm: Convert vmf_insert_mixed() from using pte_devmap to pte_special
  mm: Remove remaining uses of PFN_DEV
  mm/gup: Remove pXX_devmap usage from get_user_pages()
  mm: Remove redundant pXd_devmap calls
  mm/khugepaged: Remove redundant pmd_devmap() check
  powerpc: Remove checks for devmap pages and PMDs/PUDs
  mm: Remove devmap related functions and page table bits
  mm: Remove callers of pfn_t functionality
  mm/memremap: Remove unused devmap_managed_key

 Documentation/mm/arch_pgtable_helpers.rst     |   6 +-
 arch/arm64/Kconfig                            |   1 +-
 arch/arm64/include/asm/pgtable-prot.h         |   1 +-
 arch/arm64/include/asm/pgtable.h              |  24 +---
 arch/loongarch/Kconfig                        |   1 +-
 arch/loongarch/include/asm/pgtable-bits.h     |   6 +-
 arch/loongarch/include/asm/pgtable.h          |  19 +--
 arch/powerpc/Kconfig                          |   1 +-
 arch/powerpc/include/asm/book3s/64/hash-4k.h  |   6 +-
 arch/powerpc/include/asm/book3s/64/hash-64k.h |   7 +-
 arch/powerpc/include/asm/book3s/64/pgtable.h  |  53 +------
 arch/powerpc/include/asm/book3s/64/radix.h    |  14 +--
 arch/powerpc/mm/book3s64/hash_hugepage.c      |   2 +-
 arch/powerpc/mm/book3s64/hash_pgtable.c       |   3 +-
 arch/powerpc/mm/book3s64/hugetlbpage.c        |   2 +-
 arch/powerpc/mm/book3s64/pgtable.c            |  10 +-
 arch/powerpc/mm/book3s64/radix_pgtable.c      |   5 +-
 arch/powerpc/mm/pgtable.c                     |   2 +-
 arch/riscv/Kconfig                            |   1 +-
 arch/riscv/include/asm/pgtable-64.h           |  20 +--
 arch/riscv/include/asm/pgtable-bits.h         |   1 +-
 arch/riscv/include/asm/pgtable.h              |  17 +--
 arch/x86/Kconfig                              |   1 +-
 arch/x86/include/asm/pgtable.h                |  51 +------
 arch/x86/include/asm/pgtable_types.h          |   5 +-
 arch/x86/mm/pat/memtype.c                     |   6 +-
 drivers/dax/device.c                          |  23 +--
 drivers/dax/hmem/hmem.c                       |   1 +-
 drivers/dax/kmem.c                            |   1 +-
 drivers/dax/pmem.c                            |   1 +-
 drivers/dax/super.c                           |   3 +-
 drivers/gpu/drm/exynos/exynos_drm_gem.c       |   1 +-
 drivers/gpu/drm/gma500/fbdev.c                |   3 +-
 drivers/gpu/drm/i915/gem/i915_gem_mman.c      |   1 +-
 drivers/gpu/drm/msm/msm_gem.c                 |   1 +-
 drivers/gpu/drm/omapdrm/omap_gem.c            |   7 +-
 drivers/gpu/drm/v3d/v3d_bo.c                  |   1 +-
 drivers/hwtracing/intel_th/msu.c              |   3 +-
 drivers/md/dm-linear.c                        |   2 +-
 drivers/md/dm-log-writes.c                    |   2 +-
 drivers/md/dm-stripe.c                        |   2 +-
 drivers/md/dm-target.c                        |   2 +-
 drivers/md/dm-writecache.c                    |  11 +-
 drivers/md/dm.c                               |   2 +-
 drivers/nvdimm/pmem.c                         |   8 +-
 drivers/nvdimm/pmem.h                         |   4 +-
 drivers/s390/block/dcssblk.c                  |  10 +-
 drivers/vfio/pci/vfio_pci_core.c              |   7 +-
 fs/cramfs/inode.c                             |   5 +-
 fs/dax.c                                      |  55 ++----
 fs/ext4/file.c                                |   2 +-
 fs/fuse/dax.c                                 |   3 +-
 fs/fuse/virtio_fs.c                           |   5 +-
 fs/userfaultfd.c                              |   2 +-
 fs/xfs/xfs_file.c                             |   2 +-
 include/linux/dax.h                           |   9 +-
 include/linux/device-mapper.h                 |   2 +-
 include/linux/huge_mm.h                       |  19 +--
 include/linux/memremap.h                      |  11 +-
 include/linux/mm.h                            |  11 +-
 include/linux/pfn.h                           |   9 +-
 include/linux/pfn_t.h                         | 131 +---------------
 include/linux/pgtable.h                       |  25 +---
 include/trace/events/fs_dax.h                 |  12 +-
 mm/Kconfig                                    |   4 +-
 mm/debug_vm_pgtable.c                         |  60 +-------
 mm/gup.c                                      | 162 +-------------------
 mm/hmm.c                                      |  12 +-
 mm/huge_memory.c                              |  97 ++---------
 mm/khugepaged.c                               |   2 +-
 mm/madvise.c                                  |   8 +-
 mm/mapping_dirty_helpers.c                    |   4 +-
 mm/memory.c                                   |  64 ++------
 mm/memremap.c                                 |  28 +---
 mm/migrate.c                                  |   1 +-
 mm/migrate_device.c                           |   2 +-
 mm/mprotect.c                                 |   2 +-
 mm/mremap.c                                   |   5 +-
 mm/page_vma_mapped.c                          |   5 +-
 mm/pagewalk.c                                 |  20 +-
 mm/pgtable-generic.c                          |   7 +-
 mm/userfaultfd.c                              |   6 +-
 mm/vmscan.c                                   |   5 +-
 tools/testing/nvdimm/pmem-dax.c               |   6 +-
 tools/testing/nvdimm/test/iomap.c             |  11 +-
 tools/testing/nvdimm/test/nfit_test.h         |   1 +-
 86 files changed, 218 insertions(+), 958 deletions(-)
 delete mode 100644 include/linux/pfn_t.h

base-commit: a5806cd506af5a7c19bcd596e4708b5c464bfd21
-- 
git-series 0.9.1

