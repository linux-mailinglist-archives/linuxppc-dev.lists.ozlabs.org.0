Return-Path: <linuxppc-dev+bounces-9399-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0365BADAF77
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Jun 2025 14:00:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bLT7c2R5tz30Ql;
	Mon, 16 Jun 2025 21:59:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2009::627" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750075164;
	cv=pass; b=L9dPEJgWHyevrY6MQ2zvczhCg6Abb+7f7nNU20Z4eSZfLOJKeZI969B4ivdugoq/zWUo12kzkYHBoeqnTS+JO1wU8VFxAO8B799SDptUELIt1MqGw7h8qx0eOdiOuzTwlI/e1MbomOGFLRUZWiNxcip7G+2EV+ia5C15Z/qyB12qTLMWR4CwI0tkLaVveGemSKcMgwS0tRkyMOyBnJAF0kFmKU6evbf8boZjEfXzekFTQ5c0VIcTLDjDQSskEUTYf43b4jM5PNdUc41c3yLg34/pETtEAPj7RoXvPCaVNSpDXI9zg4brwp7UzWUccUabzSukwbnUOPb3aFYZaNofWA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750075164; c=relaxed/relaxed;
	bh=dtfJ4sC1sHvipc3AQoz4cFP5LuPWOfMwzfszFVhYRBM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Z58s2aaE47qKVuzDfjIRb67Olm8T1Zg6q3ZUy21U4hjKyj2VKKUywFSp9G5o43BEGiXlQvx2vnm07Qp4JrxKvgZEFcbxemKpXU+IZkUmCfzHVQvtbFzsMa/LHUAM29nnABAy03RkMfiif3/A7rTdF3FHMzSsSuCFn+AgPMmeFZ6dmfo2p5Cpzo2UKgj2pBZ0GHPHYFpfc3xOCZXZwpgvxZkfsy6Lusftrb5GGrDy9dyn6t50S9yfUO3NYaP4q3BNiykIzJ/kDuYe93RFcpDgZvS/FyCI/hHjCYJaTL/ItKN4LOKADRyXMj3MTKmNu0CHoMsXmFDgome37cMn6l81/w==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Rsna5Alq; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2009::627; helo=nam10-bn7-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Rsna5Alq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2009::627; helo=nam10-bn7-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on20627.outbound.protection.outlook.com [IPv6:2a01:111:f403:2009::627])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bLT7b4M6Wz30Sx
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Jun 2025 21:59:23 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QaZ7TwqfUTz8bUv0JVmAICkvyoBxR/LPZm+FfBuX8CbeN0pHlO//bphoDtd6G19rXRwRfM/7WkU12gDX1fHDfamJa+tRq3y/w6E9BOLQ8NkdUbQmc+8e/kauZau0nxTw9Tsvo+C8q8DZz8KE7ibMUr7zzrXfC/7zi2yoNMGKYiJRgHyc1goUbqrvOZpifYwq6bFH5H3RrV4xo8kki0zeVdPJ667nUOBDiBEnOiKJ8qWezgHR2FAxmkRx07Zrg+Z6mQT85bpqDeRJfvrKIii4tRvUClVtCLadtT/HvTtu33H2bS4gReF5Kvu2LBD5OuRLztSf8CNF/ngtgzAMRscSkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dtfJ4sC1sHvipc3AQoz4cFP5LuPWOfMwzfszFVhYRBM=;
 b=KXdNgLiEB5Vs7aU8XxlAPHuNHgPK+7qzTexA9DUpSw6jVmh2zVRpBpWos0PwvyJnA6Jg8uq3acc/9dENuGweGz+H1bwhtdFXOTjknWS/KwF1doMpUr5xkO3qd6tNeE2GH34f9gxuABdv27WdOYMZDIzr9pVvoPQ6KCqlsaQQUyt13oI+3+qJUdwOTaPx0uy3aM1PaWf1Zn6JllG6miibhn+JudKVm9tVhc7RT5yh6nauH49INIMfIXesqKJpBMHhOd10HapWqrwqsQgBe6mPOVt5GAWhcWSmlcK/nv8dXXB4R2FYVmFUqCuDk58oRywya/6RVycXJL2poq8QJb5nDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dtfJ4sC1sHvipc3AQoz4cFP5LuPWOfMwzfszFVhYRBM=;
 b=Rsna5AlqIZoK5JtfL92U2+zAypBfu4dMzzCtsHkvlF2DFv3iGoklxQ84KS9hHQi1Y+ViVKzrmDhcJvWEQZu9sjK4sv8BYwsXlc16DArsXlmctMu/i1G0piUBtvGz6lmLfFuN1/L+D+A2KFp1mo5HzK+wvxBgQLCu9woogtPFogURJchkayAvR45PO3QNqt6Bvp6TUeJMzBU7ijpuGBqeewfqLS1KkImQGjmyS/JCysk5HKgLtbENukiRoPFPwuQK/6iWPCUJt4wVqqYS9yo9BH5FciWF4iZNptym2TKr3G4t2sKzO6t4NJikaRCUkop5jfAR1YBk7SZ+BwyjQK474g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY8PR12MB7705.namprd12.prod.outlook.com (2603:10b6:930:84::9)
 by SA3PR12MB7878.namprd12.prod.outlook.com (2603:10b6:806:31e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 11:59:06 +0000
Received: from CY8PR12MB7705.namprd12.prod.outlook.com
 ([fe80::4b06:5351:3db4:95f6]) by CY8PR12MB7705.namprd12.prod.outlook.com
 ([fe80::4b06:5351:3db4:95f6%5]) with mapi id 15.20.8835.026; Mon, 16 Jun 2025
 11:59:06 +0000
From: Alistair Popple <apopple@nvidia.com>
To: akpm@linux-foundation.org
Cc: linux-mm@kvack.org,
	Alistair Popple <apopple@nvidia.com>,
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
	John@Groves.net,
	m.szyprowski@samsung.com
Subject: [PATCH v2 06/14] mm/huge_memory: Remove pXd_devmap usage from insert_pXd_pfn()
Date: Mon, 16 Jun 2025 21:58:08 +1000
Message-ID: <67bc382c49ed8b165cfbd927886372272c35f508.1750075065.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.8d04615eb17b9e46fc0ae7402ca54b69e04b1043.1750075065.git-series.apopple@nvidia.com>
References: <cover.8d04615eb17b9e46fc0ae7402ca54b69e04b1043.1750075065.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SYCPR01CA0008.ausprd01.prod.outlook.com
 (2603:10c6:10:31::20) To CY8PR12MB7705.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CY8PR12MB7705:EE_|SA3PR12MB7878:EE_
X-MS-Office365-Filtering-Correlation-Id: a5d11c88-504d-48b7-e429-08ddaccd3208
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OPJ3b9tb00hydTmeZ0y/cpBCaToNNRXwgLuOZXrrQi3jRsVpH6IMiEbKjtYF?=
 =?us-ascii?Q?/Ep7atZAccmwgekfaiKP+z3qbCzNVopScP0LtU7O+gZOt6tc/pLiFQ3kRMEP?=
 =?us-ascii?Q?pXrtxkQstTMaOpw/BV6deTEgm6qNEUNanvd6+pV7/M5UT7HjoOD38y21mZHD?=
 =?us-ascii?Q?VjwjmgYgxh+Z4MUwT3S5HIExGkjGluw8ZqrMl8Hr9bjuRzIi03hqiU9YtP9p?=
 =?us-ascii?Q?T3TINWZDeCVKSdkXOVbfnox2z+fzD3HYpZlsw+L/WEjD53CJ8ppnYh6xASfi?=
 =?us-ascii?Q?yWjt4aE1+vv/POVKEnhI8GrH+wt1G735ilbGKCNWGGlrvRT0rK401Z30nfmL?=
 =?us-ascii?Q?H2tYtHlEEuYgzCiN/UgQgDm1rAJVV/eOwSOtrht1d2VFLVtOK14BDF+GpY0H?=
 =?us-ascii?Q?BBMTwmgeFALXXxVs6WW2WMv+xT5J33z7MbFENEbXFN4Fz+IBm10rRfPgHlIf?=
 =?us-ascii?Q?rTdgiH6Nvhw3ClCsd1ih9IzLgaN3LrNwzN9+OKk9/7w3UhYa8VfmugSXLWxY?=
 =?us-ascii?Q?Ms77SYCbyJTkdTqAs2Fm5AVjrukTP44+y/XnWgemnd7vHbUHF9+fDTPuGpMs?=
 =?us-ascii?Q?hcVtHFuLIvn+L83dRZpyNumAFOHBDyG6E9L+Eqi6/uA7KUEyqr4bxoEBmeeb?=
 =?us-ascii?Q?pSKZjMhWcZ67sTWnfplDvfSKVd7q3VCqo94vYzNcz5Ln4634fIUArzHgW0n1?=
 =?us-ascii?Q?E69qYIsw+t8AXVAboyPT0r4aJz1R+NY/4XvQBQdJt050Dnr86pBduc9WnMIx?=
 =?us-ascii?Q?o0BUDRO6LAcrHkp68Apd/Be3/TGEGTgm9fX3aWERUOvIBOy5y2kOh6dUAole?=
 =?us-ascii?Q?lt0RpykhzVzNcDFWj7wWU9Jt3YIS21fy7E+THRSpFjl30/Z95vVB8ZINFJYb?=
 =?us-ascii?Q?Qr7tkGBE384Ca98V0fL/e8UxmvZP7C9Y/iNjlj7cvCNQcd6gmBYWnzF0nB88?=
 =?us-ascii?Q?5qTIfyQyIsHPdBuY9B+gyw7G0fEes1cSjRhyAjDBep0i2LkCK2uTL4x0dNvW?=
 =?us-ascii?Q?l3qWLFk+lSyNo2rkpqIIbqL8ous4LiyPQ+R1tXPWcpgO/lCmHcvTSM/Bi1r/?=
 =?us-ascii?Q?joAcrFGRJyOlCkzANyaPt5uwhEAoKYxbj7cEmKX8XL+N+v15i9o4naDBRj8S?=
 =?us-ascii?Q?Oz4oir+DZ+AVWZl0itU3zA1rA94BC7p7PjdNPxhod+2tSXRYz1aqkOevxuC0?=
 =?us-ascii?Q?G28q8Q9bkIcPDIysjerj7unCcacMfXgUorHc22SfoK6lMnlEDsG0eboalxzi?=
 =?us-ascii?Q?PAsuRBuhIbrDzSR7yB24jQkBMIPNwLQssVXYFWzo/5Q4paHCJGhK0By5/aI6?=
 =?us-ascii?Q?dOaNomgYh35S+VecT2VUOaIPeN9iFskbq1q/zoxRFrx8H2cC8vX8dd+oGgfL?=
 =?us-ascii?Q?+i0dNzR3of7z1p/IHfFPiMHFW3Y/vHbO8eSTs856VXlGcp9iJtaP3ExrFn+T?=
 =?us-ascii?Q?O+gmcC9vmCE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7705.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?igE7p3Ped9vKZljYan8Jr6njisD/99hr3AIlAAfGI+HQBw9tdY1sgbFFtMOI?=
 =?us-ascii?Q?uqwnt8r/7TuS+lXSgEIAx0PfHzkV89HfocrqTl7yiiH1rS9kFoYjP2KMy2pR?=
 =?us-ascii?Q?1vwpTq012DeNHkJq758oEr6hvnqJVwGtowjCzpWaIdIfeHMEKV1uAJrM9K/T?=
 =?us-ascii?Q?1A/s522/udEZ/R4C65lq9yU7tPvICQTPmgabvAixvXmM8F8UG4z2rde8bonm?=
 =?us-ascii?Q?esT+PyNvY29Y4ZaESr6G+bmlq7d2Z4FpakRFAaDSGZeFT2HIZo0hRdmxoRkf?=
 =?us-ascii?Q?IYiFdsdKsjyVfRqPknndlbFU69U+dn6R/EXsvhTcLf3soNK0Dkv9qgHA4x4f?=
 =?us-ascii?Q?Ih8QSqRq5KjPUuLxHc2uZRjvCUqoCNMG+ykTemXBOA4nU/XVyHWjK0RYssku?=
 =?us-ascii?Q?3SmBU/Od3oYFszQ9i5R2MzmRfZs9x6zQwt6q7v6Hu3Ln6Wm0sEHmwewGRee5?=
 =?us-ascii?Q?UEp+moUWqLNHt8bzT1dsaCA9Aq0r3YLy5+mhTrNlFx0NEljTCJIKNFB6Jj18?=
 =?us-ascii?Q?BzYzAG9umSNSgpvaA65gpGq0VI8PNRsudBP6kGw6VcTuYRis3yFMSuQewZPl?=
 =?us-ascii?Q?nSI+MTZ6c/xX0oXPbTZw7/z92NNiyCf+8cecDB31YiNYv+o2eoynSIkNnGuC?=
 =?us-ascii?Q?O8OUB4NgtKghuA8xLSBlkhB9i1BpgOT9QL19KA2F4LnXX2jAUCBTqeLfdLmh?=
 =?us-ascii?Q?wuDAdV65wX/0ND+5H6z2E0Nb6tMCw9XGafYqt3+V+NlRnLoRHjVWbe/X50js?=
 =?us-ascii?Q?8xgIBKmqZUNR87msSo5Nw9yN7hXCVO5uvgNf5NM2h35lbAGBXhdcxNQBIcbz?=
 =?us-ascii?Q?ePgkvSXKhjCHyl/cu+h2LpyXgzf4d4IHmhRPrJPkfrbnNLd6FLgJIX1Tid8q?=
 =?us-ascii?Q?IIh46SK2WiRMbyqVApZXASAJFBo4x55F4Q9TiQCXnIJSA8zj3pMbKim5tb32?=
 =?us-ascii?Q?g4uwomonJs/SH3ft+LGBo5fSYvC0qLtCv22Vbcf2VDFMp6Z/bSwtr2gDj7Qm?=
 =?us-ascii?Q?o4+jXHBQ9H3vk8l5zMRhqID+8zHqhCVV74ylNHNY14i9fich+hXk6Lob8xZ/?=
 =?us-ascii?Q?JQGBqNINq8yOvaK6MJROTW/FLAYnoA2MCfpQPH+Qd8quMsJDeqouT/SjlkCq?=
 =?us-ascii?Q?jGkpjB+x9WHYuBsFG+TawvMnbXh9EpA9AP8K3CvbXiN6aHeezfmy2hgQ3Q3Z?=
 =?us-ascii?Q?apLF0cgI0oozAIqiY9RLiXNXa632cB02dgqzAXuA7E6EbXoLRVGpc+4mLSrf?=
 =?us-ascii?Q?xVxv8ZJfYUvysPpizHopw1rpk2IZD8jfP5LSngcJzL+CMtWwk28wnIHb03ui?=
 =?us-ascii?Q?X+U/Suz2wQNHG5S3BxcZPWuGH9wKCT961ePBQj4u7b5kh2EzhjjM+GruZWMl?=
 =?us-ascii?Q?37X9vGJiEFko91kvUStGXA4u4i+6rFg8k2cgs/fCrXxM2xkcPbr0mF7adJMz?=
 =?us-ascii?Q?BJrKjVt01u4bmpW4Mjk7FfJCgPvdmP2icI5Nc//VFH4aEv1E/lsdbJtD/kB4?=
 =?us-ascii?Q?fyEpwI40EdaZSCl3dogdnk8UEUBXeEWLi8WfSDhtYadKEOl4vOKsDfN9A7p8?=
 =?us-ascii?Q?7a5UPCK/NlQu61o+U9ZbMCrYVSwvPghU7kap2Ywl?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5d11c88-504d-48b7-e429-08ddaccd3208
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7705.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 11:59:06.6090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CWj61tfbQ/TqtM12AjFQ5nUrPMl7Sn1NxjqwIJqIf7+EM7vHN7CEABOmUyDezx3sgRpFMUplgjfXvX3FUnj/3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7878
X-Spam-Status: No, score=-3.1 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Nothing uses PFN_DEV anymore so no need to create devmap pXd's when
mapping a PFN. Instead special mappings will be created which ensures
vm_normal_page_pXd() will not return pages which don't have an
associated page. This could change behaviour slightly on architectures
where pXd_devmap() does not imply pXd_special() as the normal page
checks would have fallen through to checking VM_PFNMAP/MIXEDMAP instead,
which in theory at least could have returned a page.

However vm_normal_page_pXd() should never have been returning pages for
pXd_devmap() entries anyway, so anything relying on that would have been
a bug.

Signed-off-by: Alistair Popple <apopple@nvidia.com>

---

Changes since v1:

 - New for v2
---
 mm/huge_memory.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index b096240..6514e25 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1415,11 +1415,7 @@ static int insert_pmd(struct vm_area_struct *vma, unsigned long addr,
 		add_mm_counter(mm, mm_counter_file(fop.folio), HPAGE_PMD_NR);
 	} else {
 		entry = pmd_mkhuge(pfn_t_pmd(fop.pfn, prot));
-
-		if (pfn_t_devmap(fop.pfn))
-			entry = pmd_mkdevmap(entry);
-		else
-			entry = pmd_mkspecial(entry);
+		entry = pmd_mkspecial(entry);
 	}
 	if (write) {
 		entry = pmd_mkyoung(pmd_mkdirty(entry));
@@ -1565,11 +1561,7 @@ static void insert_pud(struct vm_area_struct *vma, unsigned long addr,
 		add_mm_counter(mm, mm_counter_file(fop.folio), HPAGE_PUD_NR);
 	} else {
 		entry = pud_mkhuge(pfn_t_pud(fop.pfn, prot));
-
-		if (pfn_t_devmap(fop.pfn))
-			entry = pud_mkdevmap(entry);
-		else
-			entry = pud_mkspecial(entry);
+		entry = pud_mkspecial(entry);
 	}
 	if (write) {
 		entry = pud_mkyoung(pud_mkdirty(entry));
-- 
git-series 0.9.1

