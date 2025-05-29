Return-Path: <linuxppc-dev+bounces-9002-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D84AC78DC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 May 2025 08:34:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b7Glz1Gggz2ypW;
	Thu, 29 May 2025 16:33:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2418::60f" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748500415;
	cv=pass; b=Lx4hpD0bhOAAkOyQcOqvKgpXtFuUx8jO+YFHR8K7acn0yeiH1oAOMQGPJUXU4K++Ne8hhyMbOI3aGhSX79ZFy0StOyasFHPKfAq7I5ppB5X76TlU4YzeCvBoE+9qhsUdhGdAZIV+0cvWlJ0A3BN6dJiCNR4ve+GrqNj4oyPj/dg8hRHAJHa4WnaA1hpmogz14FcCtHK8aL3XikBrDvHab6ioUnWn6kDqEY4vk4mXeJtEoDq/9Gp1BA+1L/Ny0LDQtcA7dLuClXEcj4FpcupDjE7mnVp2WnYLvUW+8oGyJLHEWcOH/XkJM0qN+dcJLi9lKQlwb15JtqUE9S4hn7uemA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748500415; c=relaxed/relaxed;
	bh=m80Z6unURWTByRtQL5+Wu6Jyg5cIN0pRXiD8t+Fu9wE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VGujv9MT3DHHORWKbNTTgAZV5VZnKE2aLpHedzh+MlCda+zovxz9D32LwkqfSq2Rw1tyEkGTDi89FagZb66pflOt+ZgTAW7UKQtAGgdD8ChM8RU5Op1q964ghRiDwWDsm5dVDGMlOarVQwgPSStrkqH8xghGvlU1Arr86XHpgio7Ne/j7Pts3mu26xM0p+njcaOL6jN0iEU8nT4vuohNOrzElgbKHR/5SMEEOJyn0IQN/Em0JFRDLkToaj8s/TzyXQd3aSjzSElVVyqKbFokwnxB3MuDEFVIYArjL5OZ2NKuZnyPla3BCItKVkSvFuXSNDPNBrZl2BsVGumcb99Z9Q==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=lfoa840S; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2418::60f; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=lfoa840S;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2418::60f; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2060f.outbound.protection.outlook.com [IPv6:2a01:111:f403:2418::60f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b7Gly541Vz2yqm
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 May 2025 16:33:34 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M2odla4OOziIskKrZ6HNei7xXQ5mm8p1bNLV1jeYrRsw2lx8U7v3O8cPc/AZohdOE7JZYbMI5Yz7NhbwdLTonV0gR+zaUsMqOCeKN19bHPu2NNpNXuSYjgGjSkAgcw4tOkHqpyv9+gRwMfT+NgFYTVOUyIjj+wPvEBNDl7VRipatLO4WG8Gp3gVJt8awZ/n5YfVg6uFnqROU2V3A/qbnrAoTONhg+erV2aekudF6pvJ6/71bvfEzIJ4HCoYHTLdAe/Mi90//wAgDSBMd/NgwzGQggMSlqdxOragVpHkCEHez+jPgpokDZka2136jSFnirrxtpmWvCn5f+SQzuL832A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m80Z6unURWTByRtQL5+Wu6Jyg5cIN0pRXiD8t+Fu9wE=;
 b=j5wSJqPjectZ4PvR8AS+vV5D1hTPrSUrYyJDfcRYFEFGwP9DTFLW8t92fHQlJ9lW6fCiEWEsSDuOcL5oNVOLEAIEl/3HJS8Uei9L8AHVEqpmAGQte2vn4NC57SKq1w5foEtqiYtlPwKf1JYaG/ypPdq2PyRbz81/ywBhJXisU3iqZcN/gFgrdws7w7dazuSYBqSh5yK8FNi4D/MGiuJPj2H1XI/aCj0P8lR9JFG3lxTti+WNXUHpHpbLfnWYiyCkBiBAN6VdkOsF7HPHxdCUH08Zc/B14hgifTC7dY44KsjrB4GcpB1gkFykpzQiN5rZrrTyipbNyKWD4ffPVdTwwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m80Z6unURWTByRtQL5+Wu6Jyg5cIN0pRXiD8t+Fu9wE=;
 b=lfoa840SPVrysLmOGHBKT5CxYQ+5AgJEj5HJBWWWEEJemI1iUSZjcxdp/u37gsn8B9saLg9A/pBt/V9/LksALxMJj9AU3sgwMJvUQghrKiX3Ij35mji2XSX7YrhKBV0T+f9ilspSmurDMUHItEwP9+prHaC80bvpxV9bXjpx6WRNqsiGdbMLEXzdSnJOlkhoF4bjQv+ogxw50d8OPozYUgpWzKOpmTPxJFwGQPP2nm9zR2NM8c3L4SKaxx5oVKBulF1XF/PDWFaYQfalYF3JdhMgcKzspUR+FgniVXoZvi478I7hZPtvt6WH+D6x+5lFTzN0DHNquuAZcnTviOLwZw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY8PR12MB7705.namprd12.prod.outlook.com (2603:10b6:930:84::9)
 by IA1PR12MB6092.namprd12.prod.outlook.com (2603:10b6:208:3ec::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Thu, 29 May
 2025 06:33:19 +0000
Received: from CY8PR12MB7705.namprd12.prod.outlook.com
 ([fe80::4b06:5351:3db4:95f6]) by CY8PR12MB7705.namprd12.prod.outlook.com
 ([fe80::4b06:5351:3db4:95f6%5]) with mapi id 15.20.8769.025; Thu, 29 May 2025
 06:33:19 +0000
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
Subject: [PATCH 12/12] mm/memremap: Remove unused devmap_managed_key
Date: Thu, 29 May 2025 16:32:13 +1000
Message-ID: <112f77932e2dc6927ee77017533bf8e0194c96da.1748500293.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY5PR01CA0114.ausprd01.prod.outlook.com
 (2603:10c6:10:246::25) To CY8PR12MB7705.namprd12.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: f151afc9-1835-4bb9-df91-08dd9e7ab375
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?I6NvIf+OZZLGEu4obn8VLV2NEwoaf5QTcR6XNSGSPx1vGUXeqWBWrhOq0803?=
 =?us-ascii?Q?4DGQWe9R/pXKJHs0gqazPBzDC2krm3XTPDeOhAXgs3hPWAo1R1bghdKfaLV0?=
 =?us-ascii?Q?ZU8JFMRWV7QxdQRYulKl9fg2huIlNdKdfdGGCOTLEzfWjamKvYEH3m1zR8l9?=
 =?us-ascii?Q?FaYOLkoBRYHHHlfWi2ovRl+dk7AHK6FnDjjh5iDByb+6yiiwXPxoakvmwGi+?=
 =?us-ascii?Q?MM641+QcpL+IDt2EYnmonsGciVLQ2AxoP69jMDxK7vo1VLvzR1E2Rm7nilnU?=
 =?us-ascii?Q?UpYgJjFvPcpJWmP71e2xhpHgzQ9fTgUs3FocXC+U6UBbkejqKiO4SsmrfizE?=
 =?us-ascii?Q?i5xG56BS0DwQTSmGmH14bmkaWy52bjNr/zpZ0F5DKFQ5hLwqAK40e4S2qBgI?=
 =?us-ascii?Q?ncKX6oCWNlMgpeVbVjPLqzbsq9pwFbUmilPu+ctkCWOUXZvOdXzGd1pfuN7A?=
 =?us-ascii?Q?TS6Vr8sd9UDqUCS4b9Vw8b3uzWsEJzj5B3qqu94nBBTv0CnZ1JqO6J0yWJg9?=
 =?us-ascii?Q?6YI+4Eva8Qfz0He1jzXPWrwhpndTKUXw6322okdwodGeoWkx3cW+zB8h3/7A?=
 =?us-ascii?Q?z+Kjk5uIF9gT6Kmb/BxhmLnKKHHcmPoZEp31t0t0s36YxHXrdSgi5Nqv0ZxF?=
 =?us-ascii?Q?Gezbtj8+hiYmE2Qg+5K8h3AWsAYciY2Ojs2xF4BWHcc7UML0Vxw2W3JlAmt9?=
 =?us-ascii?Q?2XP8nX4/C8boooDXtT9Nq87r7iy8JqvyKS+8gSPzmFMTZ5m+rl8usu6NEV/p?=
 =?us-ascii?Q?FKnNisQVJfdSPoG4Ettf9gm3jbgmkOEAL053vcoM0zWAqs3CqC2d1Mtx8DuJ?=
 =?us-ascii?Q?94LIdSwHUIG7XdlT2QUS6pH/LWTtlcmbcXitXQXL3n1lystgGLLmyhBE1K8Z?=
 =?us-ascii?Q?772+jgzw+Onl4x59+qkqG8MA1bxXVe0LwXw+axcD86++v0tJN4GOlp/tuKsu?=
 =?us-ascii?Q?Jsm5JTjV3yVwu/3HaPcKtVkEiN2SysvmorIBZrWCIClmjR5RtpKS8ZLvaJ2U?=
 =?us-ascii?Q?o8kCCBw/jCyv86hl0gzKJZOdWAVCV5XI7+m4Rk2cM/29YeY2a6OEoUzoT1Uf?=
 =?us-ascii?Q?kMV1ztgpzqofaCBuB2AqqZIlQ0QkcmojcoVw8K8x9ilWuEDIQwP1VANhPIRR?=
 =?us-ascii?Q?Zc9Mj6rcueP3wgUI6tTimJhhoFCn0DNOIt7HPKZO/nKHQKI7+zP4RFoz5652?=
 =?us-ascii?Q?cNdIDUR5Ho05z+kkdBxCZcIeLnx0JXAhZER0+gM8w17Dzc6G6br9RdXO9d0Q?=
 =?us-ascii?Q?k6gA39lxoK++i9rTOvzbqd5bTNwrgTJPGVRXrZfN2NoriPpwvSqIV7mhcSkZ?=
 =?us-ascii?Q?EQcd+lz8+kgzcaCj72cIFDVVRZdHXYpdoF7zIsMbuKP7HwyL72roDctHqa5q?=
 =?us-ascii?Q?5ugYLNsZWHmwh24GLFjzKGC0LJ3bpOJQ65dvSGTBgNfEvjeaZdFf7ZJ0YucD?=
 =?us-ascii?Q?12oa4hOJrMg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7705.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+fu2mPX/OHu3u8Bmkhh6r+3dGX4TLll9nWuSggh6adtrBBnyaNPGE1u71CMj?=
 =?us-ascii?Q?7GUk2b0AkJ0SHCjtGIVD/hBJfuqtme+qm7swV+YoOBF6tXqPVvrMaeNhKowK?=
 =?us-ascii?Q?lOaf9KI3x83G/XC2YcGHmsvaCRW6+xmz3kfjQoJ4ucj1JRE8ZEJYKnbEmgpG?=
 =?us-ascii?Q?hMVuewtHULI05a3BEpHw/jlYSpZlFdwkjNe34Kvul/hWdSYiKUBvVaQFK1le?=
 =?us-ascii?Q?+Ma8WPRfuvoUihebzaQEpqyJ/dDbmaEOhFw+g8BmdOev96TGlSoEp1fG7Gpk?=
 =?us-ascii?Q?xT67j+gHV8VmLIYt6A+kOC+GpHOWN7LlDx3GK5vqaqgNmT/NZNyRhMLFjK+L?=
 =?us-ascii?Q?vYxsK8HVNRi1ynmm9tBEdK58fijqpoqLL7czKrITP2/YTgZckpMZQkjIaxfh?=
 =?us-ascii?Q?ZpVNZKO3eGVOHZ6+JF04LCyyWviVJ0P6BDuCDiL9jmStSc9RiTqvZgQbYVK6?=
 =?us-ascii?Q?/APDdErcopFM3EHnYoAVDDir0gp0WmM6uTifl6Du7YJrnbyspkEviye4zwij?=
 =?us-ascii?Q?W0TN7ASuhKcTIUeqHAR3ZPCID4CpYMsIeUxEAwNCZC0XsH1gQ7ZTAW5LV8hI?=
 =?us-ascii?Q?OXbzKwsRqqqVzqeQo0zv5zyDbCp8Go2cDuKVucQ6gDjfqYl3e7U8AJxTj8il?=
 =?us-ascii?Q?TtdTv81AXNgBHhsofFdwi/aceJjFxoh5OIPekzEI2Z2wAFNGaSLAaH0ZYRxK?=
 =?us-ascii?Q?b5Z8VSZ/RT+ZwWrheFP1TtrZvPAbDCG/7ICh8BGzxcVyt4v3pwcNRNFew4nw?=
 =?us-ascii?Q?SxGWpZ2fMWjQYG6DRwe9oBkC6KUQDXvXUL8gyTnhmrCr6szo2+WPqLpTWAeL?=
 =?us-ascii?Q?TNJ1nkJ6WqyEDOPJwfD7SDRI2en8eZ4yQKKO9WVip/T5jddOuKv2CMMHQRhY?=
 =?us-ascii?Q?8R7525IGh3GlI/g72insVcLKWM3n6aRa56px7vtvl5hVBJcry7Gvx2zaljrX?=
 =?us-ascii?Q?ohj3wqayjl1S0CnhEN9FwS1z8/Z91xeLm20k4pIDOLmPEwUah+grfVFmu0a3?=
 =?us-ascii?Q?QZs9lC9X9Ohuk+S9to4HT+uBgw2IsexMEiSSWrdq0Gl45lXMScKNNX8RV6io?=
 =?us-ascii?Q?7mALp83ymgdHCLyZI2UdZ9VvC/gn9k81p9dmh1xoU0yovAAiAGtpS7k8vx8g?=
 =?us-ascii?Q?D/vRCy7ZBPn5y1TsMJbIsM5PZ27ySJhbsaj5jXuIr+XYajYJ0YcSZ0UihauC?=
 =?us-ascii?Q?f9e9USkPpc4zfug8L7x2V9cYor/amO0U59NDs3OjzUwjMKwVdhZvly0bYW3Q?=
 =?us-ascii?Q?rRM9H39Axl3phI4uY452eIF8OGztnGmUrTA9BUygy29yKqNHT8f0OxSbKNrY?=
 =?us-ascii?Q?LLGHkqUOmNfnmr4oNem7IO/qE/Gp+i34WfK5qU2y+N3cKlErfiMrJnDbbJPY?=
 =?us-ascii?Q?gzEHYMw+r01lcn9YG1vzjVAzHCrpssriGbeju0cF/EZiv5NMwMw4LoolqHVn?=
 =?us-ascii?Q?wlKWGudT2pxBUlkVItX8MRv1gtNxOipYHc/t24BpumNtilt+TsI/nkOpj6Po?=
 =?us-ascii?Q?bW0EatUDu0eped27GG3qbvNSIlVJKCbsj4sfDQkbi9h1op9aP4ytKQZIYAAt?=
 =?us-ascii?Q?GAQ6zsyTS7xBF/+Z3VYT3RowiFNhoSsJrdtdJq/I?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f151afc9-1835-4bb9-df91-08dd9e7ab375
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7705.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 06:33:19.3396
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ATiy/uq9Z9VCgPnErqOqXntnVw3+ZL1ntqqbhyndJAP8GYzyadcEh3F2zhBVnis9DurqZhC6exRXuv1ITpbBOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6092
X-Spam-Status: No, score=-0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

It's no longer used so remove it.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
 mm/memremap.c | 27 ---------------------------
 1 file changed, 27 deletions(-)

diff --git a/mm/memremap.c b/mm/memremap.c
index 2ea5322..5deb181 100644
--- a/mm/memremap.c
+++ b/mm/memremap.c
@@ -38,30 +38,6 @@ unsigned long memremap_compat_align(void)
 EXPORT_SYMBOL_GPL(memremap_compat_align);
 #endif
 
-#ifdef CONFIG_FS_DAX
-DEFINE_STATIC_KEY_FALSE(devmap_managed_key);
-EXPORT_SYMBOL(devmap_managed_key);
-
-static void devmap_managed_enable_put(struct dev_pagemap *pgmap)
-{
-	if (pgmap->type == MEMORY_DEVICE_FS_DAX)
-		static_branch_dec(&devmap_managed_key);
-}
-
-static void devmap_managed_enable_get(struct dev_pagemap *pgmap)
-{
-	if (pgmap->type == MEMORY_DEVICE_FS_DAX)
-		static_branch_inc(&devmap_managed_key);
-}
-#else
-static void devmap_managed_enable_get(struct dev_pagemap *pgmap)
-{
-}
-static void devmap_managed_enable_put(struct dev_pagemap *pgmap)
-{
-}
-#endif /* CONFIG_FS_DAX */
-
 static void pgmap_array_delete(struct range *range)
 {
 	xa_store_range(&pgmap_array, PHYS_PFN(range->start), PHYS_PFN(range->end),
@@ -150,7 +126,6 @@ void memunmap_pages(struct dev_pagemap *pgmap)
 	percpu_ref_exit(&pgmap->ref);
 
 	WARN_ONCE(pgmap->altmap.alloc, "failed to free all reserved pages\n");
-	devmap_managed_enable_put(pgmap);
 }
 EXPORT_SYMBOL_GPL(memunmap_pages);
 
@@ -353,8 +328,6 @@ void *memremap_pages(struct dev_pagemap *pgmap, int nid)
 	if (error)
 		return ERR_PTR(error);
 
-	devmap_managed_enable_get(pgmap);
-
 	/*
 	 * Clear the pgmap nr_range as it will be incremented for each
 	 * successfully processed range. This communicates how many
-- 
git-series 0.9.1

