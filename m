Return-Path: <linuxppc-dev+bounces-4236-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7552D9F4213
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Dec 2024 06:15:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YC4l63MY7z30Ss;
	Tue, 17 Dec 2024 16:15:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2415::610" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734412530;
	cv=pass; b=B0vfAj7hLfFi+ZrfYEQszCfh38Bd9usLAme1EcpNPGa3wFZ6bkB5IFMNE27r4P+cc5sJ7FAjYS/6Pm10KninZ9HwE9MxEvm8B8SvzVe/DwZ/F31UMpXJ7NJDZH10ae6u2CIi4rzXIgZn9ZduxNfdb2mb9AdNdVvCsapVlzh2Nw3rCuyMbp5ODP/jM2ak2fuXpgrpr1RT5UVkp26x/UM5KBP9MMBlLw6u3CDbPpFekQfOTgW9Tcb3MvbdIOPBKfi7qJFn8wOZSqjWxQ2L7kOpiKAlHjmAkokma2bXpFHKBR5tjiVE9exyl7SifojG5pNkW2LSev2PuQ5XTenDW7/p6w==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734412530; c=relaxed/relaxed;
	bh=OyhHXaVFCP98wAJCXCHi7ZVmXU5gORdXGbcIAEpJcHI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QGzWw27pKu/yRcROyaljxQJOKZnVgYqexSx8lZleqxGTJt5OgsR/OA+V7nblVQrVhS33uX6gTfw1rDH75/ymH+r8bmNqWSs6p+LLuwlrDplCbhtnk7bF1DxmOtkjP6R8+z6oIpU+r8Gx6oMk9gSPOs78wlwFkEMOgKw0UoGDBkuhWrOQnPD9NZpnlkoeM9heEWKmM3dd6YCRIQLHqLcAB7BPAzbPNYTtyVKOUtvMZBMYIoY+xaRSjE2YLxtiOTxLhoFWS7CYIgIaUcj7h6+X14o4niNSVNBcLMynj3rmJlk/JkI/Xur61vJ6z1ch2TuufiB+0uiBnRhBE5Z3iLWBuQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=MHihlebL; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2415::610; helo=nam11-dm6-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=MHihlebL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2415::610; helo=nam11-dm6-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on20610.outbound.protection.outlook.com [IPv6:2a01:111:f403:2415::610])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YC4l54fF7z302D
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Dec 2024 16:15:28 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=keYKQM1d8I01eCGn8b5Jq1kQiJQH051JIKH20Rbrtw+hBVbCKrHXlwm/PsI4QfDsNrdgG6+KrqoUuIHGM+qruX74Tm/Twv8J/nIc/beCoDLEKhTYtBp37ZeckLDxOD5HQ1cMsPMRx/WDWUWCsKv4U2apmdm7XsSXbziEH0PHdg7KBBNJE3qC0OfNsNg1LGpM3EU0epyd4LF+gTiiuw3a+bnkD40PfB+kr+bcLa0EM7Xzah3HI2/fJ2deiy30vbmes1jOGROdCBaImGqC2s2R28bFm8NBk9eqPE+RbjRwMVVJ4SXNRSFCrGzhP1GJsQTsnWgjuQmJzMl/juxxThp5Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OyhHXaVFCP98wAJCXCHi7ZVmXU5gORdXGbcIAEpJcHI=;
 b=sRyWpMreKNYNd3njWAf+ZG97qJXj8+d5CwZke+YAVQqDhyN8OtdG/uhTX3AFy/q3rq6Cp7CtuXp82nVft4KqWBB5PNT0bfWxtDUKf03H2aqbHvx9eZdJHy2FpGmSgyqeJbWYACuuDfb37+HZDo444pNYpBuJgq4bLMHhDVZnVa5QFyIIIutPhxjPWRqLoKQWk6s7hp4TICiF21uuUxoWyYg9c/k1o4wDetZGy5jsY10zFFerlngFE7UtTWlBF9e0zjNC1O+14LoCBZ8WE/Q26VcnjuRS1QU9djLNX1YFL2SWK13E9Df+xTTfGTzG7jXW6tdLr0uXTTh5gd+h3UIWNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OyhHXaVFCP98wAJCXCHi7ZVmXU5gORdXGbcIAEpJcHI=;
 b=MHihlebLY9uab34eD+S2QlJWe4kJWsoK/OLgkt8GApBtnuTx+vESwtVNyAga4U6ZsKdEiiytv6A+a9UV9DRbhon7ZB/5fuxkBXHyDFVEe66TIxNnR9Ly0S/llR9t8CoY0/iJS5znqr8DKs0S8Ajr6Gvoc7zPUErWq0LcDXZeLE5E09gQ+9DM+0ZZKuxbA333QA29SnZc7Jk2lltlwMDvV3AO9tylgY9dpsKX0eyT9oFTLb81auzuxH3pBUq7uQGhOu4JN+6sVKV7QctM1KDBEnBrlr8Urk0/eyYYxvc9VhKAotcT/s7mcxCg6WVNOd+19Xt1I3SxKptE6xDOlml/gg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 CH3PR12MB8936.namprd12.prod.outlook.com (2603:10b6:610:179::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Tue, 17 Dec
 2024 05:15:10 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 05:15:10 +0000
From: Alistair Popple <apopple@nvidia.com>
To: akpm@linux-foundation.org,
	dan.j.williams@intel.com,
	linux-mm@kvack.org
Cc: Alistair Popple <apopple@nvidia.com>,
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
	david@fromorbit.com
Subject: [PATCH v4 18/25] gup: Don't allow FOLL_LONGTERM pinning of FS DAX pages
Date: Tue, 17 Dec 2024 16:13:01 +1100
Message-ID: <f315b61169d0671301e4a793ecbb1a6c46b69bef.1734407924.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.18cbcff3638c6aacc051c44533ebc6c002bf2bd9.1734407924.git-series.apopple@nvidia.com>
References: <cover.18cbcff3638c6aacc051c44533ebc6c002bf2bd9.1734407924.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY6PR01CA0137.ausprd01.prod.outlook.com
 (2603:10c6:10:1b9::22) To DS0PR12MB7726.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|CH3PR12MB8936:EE_
X-MS-Office365-Filtering-Correlation-Id: d2d6589a-78c4-42e1-4680-08dd1e59c75e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FXjBHr6Bg4Wi9Wn8IDtv4IUCDW6mQGnFmn3tS86Ro+Q3jX9paW7uU+8dXTXk?=
 =?us-ascii?Q?NYTTftV1cT39Mwe2RQDiXqsYqrZvY2BMkd24ETaZqgQ13cv5QwPPMvFNNsDU?=
 =?us-ascii?Q?6JP1/jZuVYji2B/I2bqmfsKZNfRqjrko1jLj4CvqO/daL33KAQ1awLZpOGED?=
 =?us-ascii?Q?bVfB79hA8qBrszy8RmWcrkv4AR111x3CnSafGudTs3JifNnm9i1uT8Oq2bCJ?=
 =?us-ascii?Q?7AGduAW2aH2zVfOVQ1vB7kA6nGKzyWeQbHn49Z+JxCD/qacvqzzlky7Bh3U+?=
 =?us-ascii?Q?VsQJr5ywPxS4poC4iUtGJ3wpkfcn/I9Flest7pMbD3WbtPETRaZdTatj+xKl?=
 =?us-ascii?Q?SFgTxwWxhuBbihngaDW6b35nfCCYduCP04Z+TSndCzqBzq8oPvKZ7z+7mFek?=
 =?us-ascii?Q?myZGOsXMgkAD6f1yGa9J6Bx7IPhNAHDhPEeEfkToBp6vAeZ2+rCBx916m+0M?=
 =?us-ascii?Q?o1IPa01NumK2z+eSNocLAlV6PSoWsogfyliCa5ufQ5YG/veMbVqkjMEZQ3E8?=
 =?us-ascii?Q?ehr7VIq5umDFNCCPMlMnX+XVue6NDU5dc7ynhq8uAKV+C7LNVPs4x4ev9yf7?=
 =?us-ascii?Q?irlx6QhKqHZGuHx4MIOwj7A7Z4keFP3jeMUMkDRn+WgFQ4iUi45qMtXb7A8a?=
 =?us-ascii?Q?EJeUmNx3EbaY7rils0SNxUOMscmiX91oyDGrKNmLPWXDYgrGPQodb3ZIOkkK?=
 =?us-ascii?Q?oGJkjjmbh/oFNWO4xapj5rNB/PlY9jfDSzw97ohFcUzcYfk4E0Jf4ENvK0Ry?=
 =?us-ascii?Q?5uR0pQAa3psxS2ey3szC8Ze4DZmy1pgnhfoYLg83lYEjx6Rqgih+uq61/row?=
 =?us-ascii?Q?wNagHnaMG3D2j9rxXVIZ2fPbdtk2eMDTf6/dTAI9Pp5S8zYddUglb29GmvZ1?=
 =?us-ascii?Q?HWRFoWdDjc2GFmTcEhIV6TsxXy3PAjSMHdjv6KBOe/RAaE5+Pfv+18A+/Ais?=
 =?us-ascii?Q?9btzK01VhxG41W00LhCepj1wcUyQjYw68aGTDNglA4Zd56YV9wQIAzipIybF?=
 =?us-ascii?Q?jfTg/qOBqwh/NrI8zleWylPNiact472FAhgKVwXyGsbYggU6ONF24tZKcu5C?=
 =?us-ascii?Q?6OZ4IqjoqNkBiZBI6TaSpHaT92zyfcY9aQZhiAvJxHB7Qu4DnxIX1I7RCPR3?=
 =?us-ascii?Q?nyysGxtnWI1cuVKljFBlaenNwVLrpCRHaUQ4sro/9yLCRKLkc/+0n+Z0IqVN?=
 =?us-ascii?Q?+fGYmSiG1tiKek+FNb3CgsuGXmomL2L2C5hMDO6JArmH1ElcgjMYnjW4iYsZ?=
 =?us-ascii?Q?Q7K1gKW/OluX7SZ7eTqIarLXSAN/D+DczxFtdgPldaAPEV2gjTZFM5bYpqsI?=
 =?us-ascii?Q?hhOr0H+jOqNJVe+6U9kzA/ZtxSmHX2+7FBgdC+r2WQ8vkSOQ9Nfp66gAcnJq?=
 =?us-ascii?Q?i7Q0SpbVInJgxLLe15VvFYDmu4J4?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MtlgIeiMDaEAOr7ppCQ4yx3J3oQdSLZ1eLYvcOnX9xuVPKzWXpWLghzFzTNs?=
 =?us-ascii?Q?4LoWWloZXdlM4lPRutC4AcsEdkpq9LU6X89diScnYdTYTyQRjvmBsip4uL+w?=
 =?us-ascii?Q?SeXhSAXa+KGaJG/ToAH1Ud1H9wcuBQh5Lh7S9SG8U3KN7s00Wg7HhSQQKgDs?=
 =?us-ascii?Q?7gW0lPb9b8QaSUZ7paoU7qdsDlzERd+Jhxxo0xs6oPfjFmuQmE719jJ7JQF9?=
 =?us-ascii?Q?Xu7X8a84cEe8zucrqzE5uRqEInqeN/U6erC6b+I9KK4YDFCPubpWEfKicUTk?=
 =?us-ascii?Q?UWz5dDcFXmXZV1OCTbNEKASPss2lmlAxBKw5/+c6RZ03gH5hOYsfZDF2tWwI?=
 =?us-ascii?Q?nv7IOdhytl4Jdt+/KvHhNpHJHrTgIhn5ueLgpe3yCLIMsvrnxoW4vyl5iBSC?=
 =?us-ascii?Q?E6fWdi0964OuCd9QoFI9bKLsPOVmJS/6MR/82YsiL0mptB1iG884WYcSNmq7?=
 =?us-ascii?Q?HeNqndfZiuE0GmZnnTcXjZLt++7XlZesg9TAKLwX3ny6EMd5edeXiL+PPGEB?=
 =?us-ascii?Q?rbeHAkPr2k6Kv0ab7dTMPuMzYNURhTyTVNIiV9ult+u5osCddteozyOBNBPu?=
 =?us-ascii?Q?NJW0u242K9FJZguiMegjQbF0s+j+6xOOBeAxQE3TcOLE7KbPwv2KQYiLXN2D?=
 =?us-ascii?Q?12hDYkaS3H4J9dhoAjAg5muoOzP+Ln9EKRgXufxDEvyzbGrXZV9BRjP7LMtj?=
 =?us-ascii?Q?09uVWHvJE6a4Gn1NTbdpvVMMCiDRetBgD+E7NAZQaoWOhr50X0DuehiwbYRj?=
 =?us-ascii?Q?rdl8meMF8auCpoAIUB8FqS46rJ4Zc7wWb/QWFEZlRQbmyEsfJnoQXwUfG04W?=
 =?us-ascii?Q?tGIBuWf0Q15FNDWwO5uiNi61hLAqkb4HxeqHuMKNtYr0oT/AQJ9FbWsuxj8L?=
 =?us-ascii?Q?XJ+8nSkAiRnwjQIcEGnwd7B5YzunkNoJggguaUHlMxRTEkYarwjNJqrVzkMM?=
 =?us-ascii?Q?5Yc1n65iDwmlAsR/aZnypotawTPQke05g4n1GEiSegX5KQTt3G4GCDrpMg01?=
 =?us-ascii?Q?+mpoC9u9tkt7fEr9/Gu/CuUsQQZvGxhhaR53F0K2HiZYCTIPhKIcWeYnBtDW?=
 =?us-ascii?Q?rx/Wok87f/RniKmJu6pVv4Q2CU/aK4rm16wLdkVTA/CJywdnZ+QDolpGEjsR?=
 =?us-ascii?Q?wfyxoDzHjS+R6+mTiYk74ps0LYdrEj85RNNQ68rdLWxfVLLptSojwV1SdWvy?=
 =?us-ascii?Q?tVgQr6QlT9JGQACX3vYSGmTNI4HoXYXPKycmdHK/Cpf6V00FlKgQhJi2Teqr?=
 =?us-ascii?Q?zidUEKRdm+kyEOUYgnQlpt3NWsItK7v3ktNl7oUJvTF+43uHLjHEwBJJjsD0?=
 =?us-ascii?Q?ULhUnAsJnSjj8N/l7XUzIdU5HL2Ljq+S+YYH/f4yJF0oLcpIFW7oHkZcd4DU?=
 =?us-ascii?Q?CvJSSuvMcmFyQ5Aif0WHVrqjRxUyQr5XR+U+/fKVOTIiEkl+sQzdBhmL0xWQ?=
 =?us-ascii?Q?EM3JswOdtUIkvMOsx7kZ4uXNULMAu1/GofkfrSHJXDurKZxqObuYBtLdW8sf?=
 =?us-ascii?Q?r1JpieTGbzJ6+qqC1yfV7HRrThUWuFN1N4AznsBwhC48trsWgmD6r7JqxXp/?=
 =?us-ascii?Q?Ci8CAK/hWfRZ4v2XmYG9YxNJosfLojz8/2OdgSe8?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2d6589a-78c4-42e1-4680-08dd1e59c75e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 05:15:10.3453
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mNg9rKRHSGT4IA+kpvRtLrAqFoyZG2rSAlG3LyVqri4S+ZzzJqvLi1ONfTwmUVRxcwa7gLtieWFKNx3mpGRMIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8936
X-Spam-Status: No, score=-0.5 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Longterm pinning of FS DAX pages should already be disallowed by
various pXX_devmap checks. However a future change will cause these
checks to be invalid for FS DAX pages so make
folio_is_longterm_pinnable() return false for FS DAX pages.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Reviewed-by: John Hubbard <jhubbard@nvidia.com>
---
 include/linux/mm.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index f267b06..01edca9 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2078,6 +2078,10 @@ static inline bool folio_is_longterm_pinnable(struct folio *folio)
 	if (folio_is_device_coherent(folio))
 		return false;
 
+	/* DAX must also always allow eviction. */
+	if (folio_is_fsdax(folio))
+		return false;
+
 	/* Otherwise, non-movable zone folios can be pinned. */
 	return !folio_is_zone_movable(folio);
 
-- 
git-series 0.9.1

