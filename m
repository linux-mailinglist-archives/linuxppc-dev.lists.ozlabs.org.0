Return-Path: <linuxppc-dev+bounces-9135-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 216BDACD67C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Jun 2025 05:24:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bBtGX5zzkz2xXP;
	Wed,  4 Jun 2025 13:24:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:200a::60a" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749007444;
	cv=pass; b=bxHCcdwNwVPPdX0FW+duQ5JghYhyQbNkuX3mUQGWjaqiY/oq9+1qiPOAbSGxQMgzJhNq8G8ZMm6Aub39QgboeDcN06TzYk932+F5diKN32k0PMfJXAOwcJzpBkrs9o4UY5K7vdWuIqvHoRUsllFMuCEvlbYUiqj2NYdwk4EdO+9On6S/50hWVXQG3j/xgJUvigCOtwJRlj4HA7BeYBHfR7M6jb0d5hQwaaZ8Rh9M9diEkw0H7zQ8XKJHK5iI2QR1U0IhurMyV/vPBrpvqx3uEK372765FwvIgLCw9EXWa4rQZPM5FBIOS2s7JtSDh0AlUYTi6AUNVIa7LCvx7FuQkw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749007444; c=relaxed/relaxed;
	bh=iVrMq+2phiuQI++sLZ7/W2FmwHDwbhFujpNR8TI6UW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TKAD5NHmFwk7GgHE/j4Tnny5d2dh+fFXF22HJMnSgaoIFB85yxaZvx0sZGhBvVeXNBhV2tv2TV3OQyhGYlPu7fEKZa1ix0SUxWtw17JlejILmTXSK/pKK5b31uHtHClOf40+27YgCUfmmcHzVPHeMhMjodRV70IwUAsNkBFvDpSvpp9xJi4kBW27AB3JQELyZt7V98itdcoyHVLEH/iumHupm3cToyi3R0XxLb0HTzQ3zrjrLnQy9E0D60tbrN8E8kMXAxt9n1Ht4B6s9uBCsT6p0mdcVorYg4t0he/Kcyzb5tbttXPKB8amcKbJmXGYITzErycQCiAWTS+LmRI9rQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=dtScJbE0; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:200a::60a; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=dtScJbE0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:200a::60a; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2060a.outbound.protection.outlook.com [IPv6:2a01:111:f403:200a::60a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bBtGX1qJFz2xGv
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Jun 2025 13:24:03 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nDrXIftySgLLYanckg7gcNktK2cVnZtpBR99hCBOGZs4rJdr0fEscE3yMwDzm2gYTW/DRiiQmbtJDDdgQJohSz36C/9wDYBHaqwOkJ2seDXI0ALnlci4W98kA/duSwkRPvsm2EC2Tf9OV6EKUM+Mb43jq+4vXsewLsPpah/2ZG/S7iSJKRjRphcQVaNA/Ov3S6IGL5A3gvJrYOKAkjbAD4+47Gl2846JAcuhKBv1wsYrhlHCkjLtCzbhzCOBt7AfVcwP0X5ipKZdog2uHS/j4cb8VsPPBHvItWjcQlAzZkhXJluz1dv5CykW8JIqEcR6JWpKD8n6yLRi7DlksUeMyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iVrMq+2phiuQI++sLZ7/W2FmwHDwbhFujpNR8TI6UW4=;
 b=PXfNta3Mk3Q/JyIgIoGPP9Gj+GM6vFPtPBJCOZmE1mzMyaQhalEs6pIsivLoqBJwyEM9jwdAXQooxkEphTUykhIEc6B+GpprbW1pYwu0gNfvxVmaiBm71OQL6up35JRNsNLmCi9O09X7MVHPIGPk3qPtD1Emo+JntbkF0Gtz/CHL0uTpxH4SdwfbHPeNIYyywRVV6gC4ZT0kKfnjnEwGTFi9FnWNf13kL79yANvGn773TYRuaolICIn136rG12frTYzgrjs2nXjql9FLxSlGA6byDYCwdj/zoQ3Rpne2HuVQKFGZ4b3CYSKzEPqPkepmBNnkgR9rveVRu/6AqRdTlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iVrMq+2phiuQI++sLZ7/W2FmwHDwbhFujpNR8TI6UW4=;
 b=dtScJbE08pMFL0kkvqLxBBfKMaIEylv6vuHR0YIbLaaRs3/B3QPVYDWH6887eLTkNnEYg4445f3wwOE5fFlOv4okobJHE/d2K7NaFK1xkBWhsMy/xCQRvNnTUvJbA96n3DUA8mGavRxKxpzjtfptkxrYZu6ZPMrOnuzgOjMuJ92SfZqiGgTYS+ufmg+g0X1Hm5YMhRcnDo43b3pUoT/JoQqbOfU28CLUQpo6j2xIYfPvVbGHd0CX1sIAlCtGkJ4udwWrCNJ7LK+tQg3mcMrULaK35l+VHi2v3FrPVBT8+2wWNIHNUHHOQ93kryw7Se3Iu01FhUVJg9ZPka5bDL2TnA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7728.namprd12.prod.outlook.com (2603:10b6:8:13a::10)
 by MW3PR12MB4345.namprd12.prod.outlook.com (2603:10b6:303:59::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Wed, 4 Jun
 2025 03:23:44 +0000
Received: from DS0PR12MB7728.namprd12.prod.outlook.com
 ([fe80::f790:9057:1f2:6e67]) by DS0PR12MB7728.namprd12.prod.outlook.com
 ([fe80::f790:9057:1f2:6e67%5]) with mapi id 15.20.8769.022; Wed, 4 Jun 2025
 03:23:44 +0000
Date: Wed, 4 Jun 2025 13:23:39 +1000
From: Alistair Popple <apopple@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Cc: linux-mm@kvack.org, gerald.schaefer@linux.ibm.com, 
	dan.j.williams@intel.com, jgg@ziepe.ca, willy@infradead.org, david@redhat.com, 
	linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org, jhubbard@nvidia.com, 
	zhang.lyra@gmail.com, debug@rivosinc.com, bjorn@kernel.org, balbirs@nvidia.com, 
	lorenzo.stoakes@oracle.com, linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-cxl@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, John@groves.net
Subject: Re: [PATCH 01/12] mm: Remove PFN_MAP, PFN_SG_CHAIN and PFN_SG_LAST
Message-ID: <sldyvyn4lodqgcj3zfh6p6dxkp66aqwrzk66tgj7afog2u6wb6@wcb2b4dxqbdk>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <cb45fa705b2eefa1228e262778e784e9b3646827.1748500293.git-series.apopple@nvidia.com>
 <20250602045427.GA21646@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602045427.GA21646@lst.de>
X-ClientProxiedBy: SY5P282CA0008.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:208::7) To CY8PR12MB7705.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB7728:EE_|MW3PR12MB4345:EE_
X-MS-Office365-Filtering-Correlation-Id: d5caa23f-58d1-4328-0632-08dda31735b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pqFt2n3iuRZLEfoe5AXeeq8v6G9EmCYAuHPvCXwhCAyPF58YJwc/eUG8cw0L?=
 =?us-ascii?Q?OJu1kmZusG6fFUZJ6Bnlt+IQQykPDOF1D/HXtwcX+wQNnctFBEArn4iIxGPA?=
 =?us-ascii?Q?rVNuPJdA2gWKQpS/LnfhOgElmMISVml1zolCxQzmLMqLNC4sGIcDLVLinSyI?=
 =?us-ascii?Q?0BxByidsXZ68qx+q9I9dSbDq1pyiHKGBaga3ySHggRQGPCxeRkiGa6+iy9Ot?=
 =?us-ascii?Q?nYzslgrD6S+dccOVhVX2QPyUS+fp+OWmotHzJxiL7F1vkNQEzCAyxx1V61sF?=
 =?us-ascii?Q?pm+DL7/F5EonXSD0KXGYkvXkyoonihvGyIfmUN3Bj8UfT6t1fBAXOAr8SdO5?=
 =?us-ascii?Q?H+h82mZDDHhh545Wdlg2ml2RKfYMpbiYquVuXY7O9MQaiyl+BHeZfb5VbSf+?=
 =?us-ascii?Q?j5K8eFkQzAIrpdt8q2XNej+3/9wYbDqudTMgrB19toyuBoB9E6itIyt5zJHn?=
 =?us-ascii?Q?4kRixx/y3qtSpLER7SPwYzWAh5G7ITexh+7ZT8YKQSzx7WZPZJCfiPTyg8Ze?=
 =?us-ascii?Q?epS0ACsq/JGpwKH5nKvB2z+iB8wufZqG07WpGOz+Uuaj6jeMISzNuxt6sjSe?=
 =?us-ascii?Q?LVBHO34KI5BZR1bsfcPsO+7LZKUxo10PcAx2YXjXqkGon8cHSG6VG9DbKUR8?=
 =?us-ascii?Q?C4PhMCIzwEjlyaWb4jsHwf7CtYRv8C9K52vTjp5qz3oUVtqJBRMpVadduryX?=
 =?us-ascii?Q?2kyRuDSSy9s0DxkfLqa2Ir52+LGgew2grekJs6lqSrxb72n9rU9VhkMAzvj+?=
 =?us-ascii?Q?6GP9aKpPP9/RSGSWcvVl0ND2XQxLratvytM0sihz4SffUBeJlT30pjFiaQBo?=
 =?us-ascii?Q?21heNvRpb/dyKf4oE7s4kF6jUmw6psWLzqXu6eb7O/R8pkwiuA6hh5fe8ng1?=
 =?us-ascii?Q?wTmLDgTjoZ/loXcnMpololzaAj0w7JfMd+V3PZPdcRIMdVhcOwUBYIfb7v1k?=
 =?us-ascii?Q?oKrA9LVPjJh5oAanDGXiMHg5owawaEtQ/veVREnTTdkuz7mkbFuxkIR0Ydfx?=
 =?us-ascii?Q?FxYkmwbtsKSlZDH9xGaN1pghawwZCH13F0wibPuOATQMJztZYgolH7GknVHn?=
 =?us-ascii?Q?T+FVRXLG3pUa0e5oIqast60shWrPCizJ+EP7dTZCKJw+Q2ChzUShrcqrMITT?=
 =?us-ascii?Q?4iJUDatXaAqAAWjopjjqu9I9vqETB2tpSvNMtAHUZhz7nfh7Hq3n3oDJoqSh?=
 =?us-ascii?Q?M+g1bjERukKpHeRd62BK+yhX/S8xFsQw7QY7JR/Thf1yspId4DHDwexVAMbg?=
 =?us-ascii?Q?fKetxcIDv/yrhwWDtKIo/c5y1AXH54vO/lXyhOOkMAcQlHAMmy9w0m3Y+/tJ?=
 =?us-ascii?Q?can3W2KB1kCKTPwQmGCrMksKFmhCOgs9Q+V9mqOjm6w43gSZIa8wpcsV/KJl?=
 =?us-ascii?Q?wYTjYB6/PFaUH1JtSA26eejspULoBYW61jMpV2GYaXcuusqaUg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7728.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qy2DMj68wAWpIG+RGzMYqsRXSRDQxEmz56qaVUfpK+W6snydV13OVZNR4V2r?=
 =?us-ascii?Q?DujbvT3XrSauGG7E1/LQtzr+DAjao2FwR6V62vTR7QP10FJOs/itcMgy97B7?=
 =?us-ascii?Q?JBki+Xj26LElChK2csinC3UYbnI9a9h1715G53kO6L2mVl14iXurzMeEM6dF?=
 =?us-ascii?Q?gz9futvPACKdWHA03gdpO72ve554zq89m1I3xcaTqlWHZBXGbErO5Z2Y2BnH?=
 =?us-ascii?Q?hhsDBlCViUpQGj8ouyUibK9vmnatUZxm45osJyDOAWx55l/bnSLlf85GDy1C?=
 =?us-ascii?Q?qUgd8hF9DtIUdxVNi86mfd526HIfafEvGDnFR+G+PrfV0OVrgkZCGJWUi8xm?=
 =?us-ascii?Q?966hM9BjsIoHqQqByhDGNUf4NCsS5FYwpYbsVyp3pu6LF26nlF+HbwMTncMQ?=
 =?us-ascii?Q?NqfwAPw/1DXFNl+o5OYsB/QZU50hK3LVlgDB01aEjpaNHFiU/GuUr2HXJtd9?=
 =?us-ascii?Q?3Ac+7IDhvhl53HwxVA97Dxr5g6Uf8rJuZrXIxfOtPK8HLG6XKdy3F0NjE+cU?=
 =?us-ascii?Q?FrFEBwXMvsBfQeUcu8QvVmzv53sD4bxgsQjkrzSQ7A1LywDYn7iuaSrTuQR9?=
 =?us-ascii?Q?jcamQIOfcXOF6eWGF495PFn18rNnFFBQv3BLF9vkJTiEcXwNSjUqLtG15j5t?=
 =?us-ascii?Q?Dmtan/efDMC8cF57NOTdFP+fWJjNrHyzJPCSukiI6bwthKqSWbwHrKTy9d1V?=
 =?us-ascii?Q?M9IpKKaO00cRTwO5g9bhz0EiK1c5iieOaoCb5an4BsfJqN/VLU5iO1zKBx/N?=
 =?us-ascii?Q?8Go8Ic2C3FbIh9F9cqaa/AvMgmgwKBE9ggTRjyJNbDM3H+ZFh924L24HlJb/?=
 =?us-ascii?Q?dpR5dusIbxHBEoVnyGdMvPU8NO1R28h3sfXqYulAwaCNT6VGBqXC/O8Zrf6o?=
 =?us-ascii?Q?K/It0MDkbZy8Y3crhuFlSZ1AaSYIS5egVH2OgHm99AFX2FPcWNt+IqP6vrc0?=
 =?us-ascii?Q?Ak8pTMOfxVwDtK0cBs3/C0VFRCdeFwM48QbGoN8+uwxEupOQzgAFW5bw/lkU?=
 =?us-ascii?Q?/YsFG04RbNSEhbNWB4ixpluoriIx1R7D2++5V3eFTw2DqQsJREAwleuNW/2y?=
 =?us-ascii?Q?oZGTD81yfVaU/ejgQ/Y4Jj+5NPGICR8WDDhpmnQMMr2BbBXL00HVvS8935ky?=
 =?us-ascii?Q?SOQB/pJ1c2NRYricJT4QwqBrt+ZvW/t11zqSek4L4NOo70INbWlIt14uPu6d?=
 =?us-ascii?Q?5/nqU3z7kIgJeRt4mDAg/pYripp8lb7D3gfS/+jG/NT5WorWs1QVNlJaNscX?=
 =?us-ascii?Q?jjl2NxQF3LVuFhXpAOdg9gtdfEClwS8oyiMzak5t6MU8M+XBI1epX7SEK4kB?=
 =?us-ascii?Q?rdgo6hJnOU6VYIQk8CmR4n3VFUvNviikykawYqY9eEN/x0Y/xHsgXcVTl3ds?=
 =?us-ascii?Q?2+C7lIUCmAlXGK9WcLTnyy9fohhxcmHhmtCKCL01WWcs2v1FX8SkxHXuvXfG?=
 =?us-ascii?Q?v468HzY+Mh/9j2zyeLpNaVlbdIxxxUxee+O/OGm0wNSW7cxXGJqw+V1U2jzN?=
 =?us-ascii?Q?Ka5fmMVNQc27SGjB/hg2MyvvQatg4wm3VB+uXjfJlhyRTKft5Di6lo2Q7mA9?=
 =?us-ascii?Q?Dcz4snkAMqvVKGy9vZ5Sj7hti8FKXf8gKlVCgV51?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5caa23f-58d1-4328-0632-08dda31735b8
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7705.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 03:23:44.2020
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L8m8A61nMDuMFEPvXbLRdbe4eUq/0x05It8NnrEcnYJ/0PGACEcpSH2zMw8+FSE6DMUPmruHXjTNe+nxNFnkkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4345
X-Spam-Status: No, score=-3.1 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Jun 02, 2025 at 06:54:27AM +0200, Christoph Hellwig wrote:
> On Thu, May 29, 2025 at 04:32:02PM +1000, Alistair Popple wrote:
> > The PFN_MAP flag is no longer used for anything, so remove it. The
> > PFN_SG_CHAIN and PFN_SG_LAST flags never appear to have been used so
> > also remove them.
> > 
> > Signed-off-by: Alistair Popple <apopple@nvidia.com>
> > Reviewed-by: Christoph Hellwig <hch@lst.de>
> 
> FYI, unlike the rest of the series that has some non-trivial work
> this feels like a 6.16-rc candidate as it just removes dead code
> and we'd better get that in before a new user or even just a conflict
> sneaks in.

Good idea. I have just sent it as a stand-alone patch.

