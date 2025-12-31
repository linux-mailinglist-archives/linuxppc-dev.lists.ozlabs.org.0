Return-Path: <linuxppc-dev+bounces-15102-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 077ABCEB46F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Dec 2025 06:02:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dgyW11s97z2yYJ;
	Wed, 31 Dec 2025 16:02:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=40.93.196.40 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767155574;
	cv=pass; b=JbmCmgPfn33GryciRexHepmm0Pg9364J0TMV+M4bk9tyMqNO43La+eN2EfNagJmBKSzQJhl5Wo42kfgeNX9cqy3/uU2e57ZrEzd3a1lZd/zFeB0cjieAohPPRQoaOYvd03GIqqlta7VtQ/Zs7ZiVmxDrlvoqLEH7ui4j8DEPlE3Zl1aUJEQipTeN7pqJDDSFyIan0lWSyQjPWZ/xaW755zZQ/p31ZT/btLK0C9jDNfnA3ANyZBF2tMCAcT8smKIEjRpqfxaPQFKdpjHUYOAZPYH4PqrNEilLlLLtxSDoOstLo9jsz4pHxdlzSTqXoWNdfjTlpcazVnCbO4KVAf1FSQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767155574; c=relaxed/relaxed;
	bh=ZXcGpxN/5z0CDRd/P4tQKYOTeChpzYdaFmOpdJP7XzY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XfgRJRyN0tFxdhMitzL+zpb7Dc+RxYEP/CfdBGBo6HhofVeXH/vHJPEz6BaSnzgjM30Rav6lyUcXvMm8vsey08M+rqh9w+oZgBadJTImXhHwUuq60s1LXs3tFTOgmGcC4V+4NIvH7dMMx3I+v47jBfUwrGWa9Wl5MgtOgjE94Op0N/LYbAYYDq+SwBxAXEoqM5Jnc5uNTDixUwDeDmy1uEmpSJjq+jNlDTdFWrS7DinQ0NmbPCe8mdTqMahmOSyWn/zSgU7pZPuozy8MAmnsVMRqcy3ymDnRbTuYAaHD4//l4VPaeuh+eJ2lmVHPFHOEadclrnoAhjUfnyLMXuHLQw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=aybnOwB/; dkim-atps=neutral; spf=pass (client-ip=40.93.196.40; helo=sa9pr02cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=aybnOwB/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=40.93.196.40; helo=sa9pr02cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org)
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013040.outbound.protection.outlook.com [40.93.196.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dgxs21wr5z2xP9
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Dec 2025 15:32:54 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f6pJYfcRxxdWB+KxVfjgEzjgeEiogOLdHwI2tBQG3UtH0uuVg1GcW2QdfUs9Q6+LTDuIWZYMmRfjFDDu6M6mOqV3i/wwcbpGBwSWE6tnu35+gPr64iOchW70pADZiWBBE32sSqQCy8d7jeZmYIxryArUIZ7cDA/AtdrBpzeK8g/tnjgQ+g5NXqpCcswpgrp9a277NMep7mHFugil6BqHuO4EK1IJZp0QUyx2j6I/nitKgT2qca60lJ7wDBkw4qtjdJ4O3C85EwAZHRJCzr5RuLI+bC925uQ3VpirNOdNIliBim5RFQ6P0MXrrChZZL5kBj7XuLDFWTTl5Ry4jM9nzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZXcGpxN/5z0CDRd/P4tQKYOTeChpzYdaFmOpdJP7XzY=;
 b=hPaKc+3teeeHS3K+BF4zjDEoCRehvWDd1D0LPN3olNvXM52a+V3ckaMaHjNMeESDLydOZpBHbSI1/iRHY8nL7nzg2E58eJvGVfzlHtzBTHWV0uhZopZwz2ODQMNDjfYD2cwaPXhAiKO8PWI/oUtv7qnr48qQMS+YHktVaJkrUemc32LczEYd9uzNYBZcfNX0S+1l29zbvizFaOjANpJpdtlxnnjx5tlq+hhhHkUP3isYDJi0ewO7F6/DnqzRywMlEvgmGqRWtoDihp2zGNFCEk41YEzkVRBfWFFyg+7evpxNQWhXDzrM5TTvXezcekBMmf4Hd9PWzP4Kn2Nf/1sysw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZXcGpxN/5z0CDRd/P4tQKYOTeChpzYdaFmOpdJP7XzY=;
 b=aybnOwB/tzApbzS5vd1mLe+E+g7Rj436JaIav7hw1k7of1/h0JMUBH8QkUMSUMyvocTCpYqda4b5qGDBNQPj4aLQZEiMj40KL8MPyvv+MdCaRD+lrmmmbzCqxyuIF2H2+MkEOTVNTEBAxiacCRYDN490qiHuEqEn/TCQJNNioZ2wdGoMq3kNm7ggHO9OmSE1KR4dAu2I+eZDPkgdhi/B4qLnVZFcPnyBRbAcLvhyt8ZyYLluXKZ5DTZTiljk3Fp5ma8Y27PPvOiS5VpPDj1Gv0EgO+arRamVjnRXh8Xzdp4ZnR3BDD9Itjj3XYeXL/Zb+n7U/ZNHX5iOvxqDG6gpXw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 DS7PR12MB6045.namprd12.prod.outlook.com (2603:10b6:8:86::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4; Wed, 31 Dec 2025 04:32:35 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9478.004; Wed, 31 Dec 2025
 04:32:35 +0000
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
	Felix.Kuehling@amd.com
Subject: [PATCH v1 4/8] mm: Add a new swap type for migration entries of device private pages
Date: Wed, 31 Dec 2025 15:31:50 +1100
Message-Id: <20251231043154.42931-5-jniethe@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251231043154.42931-1-jniethe@nvidia.com>
References: <20251231043154.42931-1-jniethe@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2PR07CA0008.namprd07.prod.outlook.com
 (2603:10b6:a03:505::8) To DM4PR12MB9072.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|DS7PR12MB6045:EE_
X-MS-Office365-Filtering-Correlation-Id: c197bc99-d54a-4702-261b-08de48259eee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eVltL3gx7FKnk0snLTxfrPDkiK/U0qrwJftt8MbXokOZxc4bn16fud16avim?=
 =?us-ascii?Q?bAuM92Kz5CpAaAzIm3o7dz41a0Xh3vQm/DOlzpUInREPNaJPdzyWD7d8oQpM?=
 =?us-ascii?Q?4KIDXeQONO5MMNgf56yzrJOTlEx0Irk9CebbQWa846FgewdQNkUpVqeT4ikN?=
 =?us-ascii?Q?tGP2Ns23qWJsQNdU3utPjPA3sjnknlfHJkDlLOIiIpXfrZnJV+Ct0ZmU68bo?=
 =?us-ascii?Q?pmKYXtUI3sga7oK9a9wJUABPZBJvb0ZW0ulQig2M2UJyjlfmdABiD9XrTDZ2?=
 =?us-ascii?Q?mNnluqHqPF2tssk7ew/jeChrqkLEjaIB2xEPQSypX9bFYeqhDDyOGKSi1r52?=
 =?us-ascii?Q?E9Q87KLUmE4lBq/ZaxUDNkdyEVJwidi4Usd4xPlP1tcmNee7uvZOkzwgHWGc?=
 =?us-ascii?Q?F5+9V4IjRQw/ie//AG6TXEzVvoQyPAoWwEhjpV1HBx6pf+Pc85YWQkF0zp8l?=
 =?us-ascii?Q?Wq+WwoCaPz0OnZS/UbfCcrS3RCXR3E2aJXXksSOdH5g/V/3Ryxhot4yRNlb6?=
 =?us-ascii?Q?kwdDG/ej6Lz3Kk/c2gHXOLsbYgeuUcvlRTQcN4QU+xXOofTh7CnL6V8Ch2vd?=
 =?us-ascii?Q?l5aD7dzXIt7yNFB23qfG/YeUsWW/VVF50qwLoOJ/AOmgYncyXTVYiaDiaNfB?=
 =?us-ascii?Q?nzgReS313iv3mZ2tznt4pcnhV5/eE5aqlhVGmoITLVCMQtCa7ULIyanTHlXb?=
 =?us-ascii?Q?kgmO2nBXEQJ3jZAC3rpMUE05q7OfJnxSxoo0WBVVm07PWxkvSQxsrR+qPvr5?=
 =?us-ascii?Q?mFoTbD9R2guFjit9aMmIfZnjJRTpy+WT5xxYEWQqIw76Y5gT4t9hQOQ6buhd?=
 =?us-ascii?Q?dLbDqMxN76upWMnjImv2rMslInf+eo82v8LUHBcIJ5CLE66sad6IG4c8Z1QT?=
 =?us-ascii?Q?sqejnglamLyXiBIHtXegyfhlCQvL+4XMwm1U0voo0DkJAsW+cr69vIgBtFtm?=
 =?us-ascii?Q?n/Rf99/9Tl7+3OjmBr+diBD+mfUAlfL4t6MHsFTLGta5+NSjP1YdhPU1FagV?=
 =?us-ascii?Q?fQhb7y6iA4jZVTbox3EXZiHYpLJwSQZsrWnWn8UPm3UWPQkOfL0oP6QyFhAe?=
 =?us-ascii?Q?JYeIXG4GUnxMT2sT7JjcVzVOUpI3ymXWYmrXZ21Ycwm20L/z3bO8rg7olE4T?=
 =?us-ascii?Q?8bgtTTWc76DSV4/2L+DGLlyWVCQN53ItSImBBFr8845b9dLKQ8j1QfhRbQML?=
 =?us-ascii?Q?qNnx/M84AztgAFyPhauCM7ytUzxibG73QXise3+tWcGa6kX8Ft0XAyWNal0L?=
 =?us-ascii?Q?TSrLXUwYRfFzCUFscqXGJeiJff4OGqc3IewSKiANejmUBk2c4rj96/FpIOqi?=
 =?us-ascii?Q?DsDdnZIZERyMNes0yJdqQajmYGwovhPV/LoJ6HC4sVpwBCcf8fVnDteOh8K3?=
 =?us-ascii?Q?OaGHIUUNnqgaKyad8johvPKz2rsgoI1NGPTiRSy+w/7DljFC8JIXIJEO51Cb?=
 =?us-ascii?Q?nPdIqw24UsUUreG1XpWjOjGznJbN+Ie7?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB9072.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UX6ViS+FGPXs5wMD7D+294fp5jC1p+bOBmN3Fk5WHWe73MsoZCl4OWWixYGp?=
 =?us-ascii?Q?gDdU57dn5c8MP+8LBG2NT7WnGaITexA1gwFRDVT+/PWS0aYN00VOf+siAvW8?=
 =?us-ascii?Q?OomOPs3U0SZd/yyrJOoeykcnWX4UUwEqr561d6/Tes9ts1NERlFQVuyDUo7e?=
 =?us-ascii?Q?vj9jGzNaN3SNmU//NN4QdSO9iaaN2w228KTyYYQjTumPl2/m575hOS105Kp0?=
 =?us-ascii?Q?HHkgbmN+UWgzlPc69cpqFJmHrKTDDhkwU1mOQOJ54hBhgpTewYupubsbHOE5?=
 =?us-ascii?Q?klGCvCWMvxPoTW05MVhQpG0rQ6mwOHoH/ZPB4h7vtzJLgbRkI1s415xYrRWN?=
 =?us-ascii?Q?xGcsevZ1LjcotE8fjN9Nuy1ympSc/PyHTtiNEtzRpB5IEGZCdojjiIbwWPKM?=
 =?us-ascii?Q?5aRW9vB4lal6ksBClSPYB7IftoRpDgl/gj/rShQoR9LLN1rCOOlepcVEB3SI?=
 =?us-ascii?Q?zxPJZdnE0vS4ekb8XnUWl0QNnb501NRxBvoYSOvbmUYYBeNydHJjjCpcvXdo?=
 =?us-ascii?Q?LnkemTlwgv3bFb6JDHHSKZnLeuB0CE83dBnOoONYLwNFU737XHScwrLhJtXp?=
 =?us-ascii?Q?5jGjBj/ZEDWoXhvz/IusD/MfljZ2qo/S5IxXQbwwlaF3cB98xzbhgYLvaeJN?=
 =?us-ascii?Q?BF0lYCyYnuk14rwMTUvBfv2K5SoLuDvhgWDfavtHidyMGvqxOu168lQ7fshe?=
 =?us-ascii?Q?fvZ5TrFLWtnESECse56y41PpOFE0uSjrFuwjFPmJdVpgUZBZk9V2cPGKITdo?=
 =?us-ascii?Q?vVHIjb9EpJTtOv1sPECj+LKixifWiVXGyZgLBt/2tRfVYezzVyIdLfg6gAfH?=
 =?us-ascii?Q?GTKJbX42WEkH+S233ew2cyR+v+bxpV36YMC0MUwsIxuDZpIjIWN6wX5xvQCe?=
 =?us-ascii?Q?Ew3LoUms0ZBlpbNC9MCVDqmriLsgSN03mkRndMkn9CqBuBnGdRBXBwazleFh?=
 =?us-ascii?Q?W46IKh/3j43Zv/9lzShxgDL3CGi+lN0+/wdxPbgQF929d8ij/Xvep/cXhQLO?=
 =?us-ascii?Q?D90YHAQ/3s8mCxuYlqKLuNv9ztBvKydp9DHfDZJ6Ua6fCOjZobZ8XIAdKg2Y?=
 =?us-ascii?Q?1khWVVbtmWhNS5abCWFv3GSPmdZeERgEAqsQ1v+L4LWZsGHYTmXypgME8kHF?=
 =?us-ascii?Q?5b+eMpttPdP3/klKxiX30Tg6V3uIfZJoFYbV5Lvop2WzOtQq3eFrRwJ60nM/?=
 =?us-ascii?Q?ufLAJi4uWQWEt6VEE9JZA7LMq1Dk1lHA7QkJlicc6pS/ELOgyz+nvelClT0s?=
 =?us-ascii?Q?PSB2Xqv+luOLaYD36XZkEQb/F3/42yBSusxau7Mb2Uwtrxqlsom34FPGvGY4?=
 =?us-ascii?Q?NDYWqAKkJGfpgoYGme4sJ16uWZrFX8DZUcJYcymddgY7dj2DXV6yJCu1z3jn?=
 =?us-ascii?Q?/aRYSW/toGh0Zla28KYPtQtj6wb/emD1c2iWm77/rMgLSDag+DnxnushuNo6?=
 =?us-ascii?Q?DAsECk10iudzpN/68GNdQx8/lhKN+7bl7PrUfx8+z3EiTjd1TjSYvTyuxsEe?=
 =?us-ascii?Q?C8JcA+2/KlpG8aYGIA4To0yq8P2zfArWKm54vgmn1O1RYq/s8/aueJHQimwE?=
 =?us-ascii?Q?6leZ91YtCFGKYGS95PV1jXj7QC8p+rQ1998MfSYGQ4ARJx3JeGmwIoLTo0NT?=
 =?us-ascii?Q?Ubjt3SC74yRSIjtR7fRV9IBhoXwci2RMw/60XZuNOCwJUqIUDbrgdJbatuSZ?=
 =?us-ascii?Q?63qq+wtcIezwEZ7OiTwIvmT1k8niSiWFCAl6R1JWTdoCBN2dCCxaRxqD8sRQ?=
 =?us-ascii?Q?rmotcz5cgA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c197bc99-d54a-4702-261b-08de48259eee
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 04:32:35.7297
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vjupX6hidb4R07cLusgnwoFlbH504Mma7ErZptRWd6Wzp0gH5riGKTpiscoMFkYnkhvjRH7JgHaq47MBSRWHbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6045
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

A future change will remove device private pages from the physical
address space. This will mean that device private pages no longer have
pfns and must be handled separately.

When migrating a device private page a migration entry is created for
that page - this includes the pfn for that page. Once device private
pages begin using device memory offsets instead of pfns we will need to
be able to determine which kind of value is in the entry so we can
associate it with the correct page.

Introduce new swap types:

  - SWP_MIGRATION_DEVICE_READ
  - SWP_MIGRATION_DEVICE_WRITE
  - SWP_MIGRATION_DEVICE_READ_EXCLUSIVE

These correspond to

  - SWP_MIGRATION_READ
  - SWP_MIGRATION_WRITE
  - SWP_MIGRATION_READ_EXCLUSIVE

except the swap entry contains a device private offset.

The existing helpers such as is_writable_migration_entry() will still
return true for a SWP_MIGRATION_DEVICE_WRITE entry.

Introduce new helpers such as
is_writable_device_migration_private_entry() to disambiguate between a
SWP_MIGRATION_WRITE and a SWP_MIGRATION_DEVICE_WRITE entry.

Introduce corresponding softleaf types and helpers.

Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
v1:
  - Update for softleaf infrastructure
  - Handle make_readable_migration_entry_from_page() and friends
  - s/make_device_migration_readable_exclusive_migration_entry/make_readable_exclusive_migration_device_private_entry
  - s/is_device_migration_readable_exclusive_entry/is_readable_exclusive_device_private_migration_entry/
---
 include/linux/leafops.h | 70 +++++++++++++++++++++++++++++++++----
 include/linux/swap.h    |  8 ++++-
 include/linux/swapops.h | 76 +++++++++++++++++++++++++++++++++++++++++
 mm/huge_memory.c        | 21 +++++++++---
 mm/memory.c             | 10 ++++--
 mm/mprotect.c           | 21 +++++++++---
 mm/page_vma_mapped.c    |  3 +-
 7 files changed, 188 insertions(+), 21 deletions(-)

diff --git a/include/linux/leafops.h b/include/linux/leafops.h
index cfafe7a5e7b1..a4a5c3ad647b 100644
--- a/include/linux/leafops.h
+++ b/include/linux/leafops.h
@@ -28,6 +28,9 @@ enum softleaf_type {
 	SOFTLEAF_DEVICE_PRIVATE_READ,
 	SOFTLEAF_DEVICE_PRIVATE_WRITE,
 	SOFTLEAF_DEVICE_EXCLUSIVE,
+	SOFTLEAF_MIGRATION_DEVICE_READ,
+	SOFTLEAF_MIGRATION_DEVICE_READ_EXCLUSIVE,
+	SOFTLEAF_MIGRATION_DEVICE_WRITE,
 	/* H/W posion types. */
 	SOFTLEAF_HWPOISON,
 	/* Marker types. */
@@ -165,6 +168,12 @@ static inline enum softleaf_type softleaf_type(softleaf_t entry)
 		return SOFTLEAF_DEVICE_PRIVATE_READ;
 	case SWP_DEVICE_EXCLUSIVE:
 		return SOFTLEAF_DEVICE_EXCLUSIVE;
+	case SWP_MIGRATION_DEVICE_READ:
+		return SOFTLEAF_MIGRATION_DEVICE_READ;
+	case SWP_MIGRATION_DEVICE_WRITE:
+		return SOFTLEAF_MIGRATION_DEVICE_WRITE;
+	case SWP_MIGRATION_DEVICE_READ_EXCLUSIVE:
+		return SOFTLEAF_MIGRATION_DEVICE_READ_EXCLUSIVE;
 #endif
 #ifdef CONFIG_MEMORY_FAILURE
 	case SWP_HWPOISON:
@@ -190,16 +199,62 @@ static inline bool softleaf_is_swap(softleaf_t entry)
 	return softleaf_type(entry) == SOFTLEAF_SWAP;
 }
 
+/**
+ * softleaf_is_migration_device_private() - Is this leaf entry a migration
+ * device private entry?
+ * @entry: Leaf entry.
+ *
+ * Returns: true if the leaf entry is a device private entry, otherwise false.
+ */
+static inline bool softleaf_is_migration_device_private(softleaf_t entry)
+{
+	switch (softleaf_type(entry)) {
+	case SOFTLEAF_MIGRATION_DEVICE_READ:
+	case SOFTLEAF_MIGRATION_DEVICE_WRITE:
+	case SOFTLEAF_MIGRATION_DEVICE_READ_EXCLUSIVE:
+		return true;
+	default:
+		return false;
+	}
+}
+
+/**
+ * softleaf_is_migration_device_private_write() - Is this leaf entry a writable
+ * device private migration entry?
+ * @entry: Leaf entry.
+ *
+ * Returns: true if the leaf entry is a writable device private migration entry,
+ * otherwise false.
+ */
+static inline bool softleaf_is_migration_device_private_write(softleaf_t entry)
+{
+	return softleaf_type(entry) == SOFTLEAF_MIGRATION_DEVICE_WRITE;
+}
+
+/**
+ * softleaf_is_migration_read_exclusive() - Is this leaf entry an exclusive
+ * readable device private migration entry?
+ * @entry: Leaf entry.
+ *
+ * Returns: true if the leaf entry is an exclusive readable device private
+ * migration entry, otherwise false.
+ */
+static inline bool softleaf_is_migration_device_private_read_exclusive(softleaf_t entry)
+{
+	return softleaf_type(entry) == SOFTLEAF_MIGRATION_DEVICE_READ_EXCLUSIVE;
+}
+
 /**
  * softleaf_is_migration_write() - Is this leaf entry a writable migration entry?
  * @entry: Leaf entry.
  *
- * Returns: true if the leaf entry is a writable migration entry, otherwise
- * false.
+ * Returns: true if the leaf entry is a writable migration entry or a writable
+ * device private migration entry, otherwise false.
  */
 static inline bool softleaf_is_migration_write(softleaf_t entry)
 {
-	return softleaf_type(entry) == SOFTLEAF_MIGRATION_WRITE;
+	return softleaf_type(entry) == SOFTLEAF_MIGRATION_WRITE ||
+	       softleaf_is_migration_device_private_write(entry);
 }
 
 /**
@@ -219,12 +274,13 @@ static inline bool softleaf_is_migration_read(softleaf_t entry)
  * readable migration entry?
  * @entry: Leaf entry.
  *
- * Returns: true if the leaf entry is an exclusive readable migration entry,
- * otherwise false.
+ * Returns: true if the leaf entry is an exclusive readable migration entry or
+ * exclusive readable device private migration entry, otherwise false.
  */
 static inline bool softleaf_is_migration_read_exclusive(softleaf_t entry)
 {
-	return softleaf_type(entry) == SOFTLEAF_MIGRATION_READ_EXCLUSIVE;
+	return softleaf_type(entry) == SOFTLEAF_MIGRATION_READ_EXCLUSIVE ||
+	       softleaf_is_migration_device_private_read_exclusive(entry);
 }
 
 /**
@@ -241,7 +297,7 @@ static inline bool softleaf_is_migration(softleaf_t entry)
 	case SOFTLEAF_MIGRATION_WRITE:
 		return true;
 	default:
-		return false;
+		return softleaf_is_migration_device_private(entry);
 	}
 }
 
diff --git a/include/linux/swap.h b/include/linux/swap.h
index 38ca3df68716..c15e3b3067cd 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -74,12 +74,18 @@ static inline int current_is_kswapd(void)
  *
  * When a page is mapped by the device for exclusive access we set the CPU page
  * table entries to a special SWP_DEVICE_EXCLUSIVE entry.
+ *
+ * Because device private pages do not use regular PFNs, special migration
+ * entries are also needed.
  */
 #ifdef CONFIG_DEVICE_PRIVATE
-#define SWP_DEVICE_NUM 3
+#define SWP_DEVICE_NUM 6
 #define SWP_DEVICE_WRITE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM)
 #define SWP_DEVICE_READ (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+1)
 #define SWP_DEVICE_EXCLUSIVE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+2)
+#define SWP_MIGRATION_DEVICE_READ (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+3)
+#define SWP_MIGRATION_DEVICE_READ_EXCLUSIVE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+4)
+#define SWP_MIGRATION_DEVICE_WRITE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+5)
 #else
 #define SWP_DEVICE_NUM 0
 #endif
diff --git a/include/linux/swapops.h b/include/linux/swapops.h
index 72aa636fdb48..2bd01f97b4f0 100644
--- a/include/linux/swapops.h
+++ b/include/linux/swapops.h
@@ -148,6 +148,43 @@ static inline swp_entry_t make_device_exclusive_entry(pgoff_t offset)
 	return swp_entry(SWP_DEVICE_EXCLUSIVE, offset);
 }
 
+static inline swp_entry_t make_readable_migration_device_private_entry(pgoff_t offset)
+{
+	return swp_entry(SWP_MIGRATION_DEVICE_READ, offset);
+}
+
+static inline swp_entry_t make_writable_migration_device_private_entry(pgoff_t offset)
+{
+	return swp_entry(SWP_MIGRATION_DEVICE_WRITE, offset);
+}
+
+static inline bool is_device_private_migration_entry(swp_entry_t entry)
+{
+	return unlikely(swp_type(entry) == SWP_MIGRATION_DEVICE_READ ||
+			swp_type(entry) == SWP_MIGRATION_DEVICE_READ_EXCLUSIVE ||
+			swp_type(entry) == SWP_MIGRATION_DEVICE_WRITE);
+}
+
+static inline bool is_readable_device_migration_private_entry(swp_entry_t entry)
+{
+	return unlikely(swp_type(entry) == SWP_MIGRATION_DEVICE_READ);
+}
+
+static inline bool is_writable_device_migration_private_entry(swp_entry_t entry)
+{
+	return unlikely(swp_type(entry) == SWP_MIGRATION_DEVICE_WRITE);
+}
+
+static inline swp_entry_t make_readable_exclusive_migration_device_private_entry(pgoff_t offset)
+{
+	return swp_entry(SWP_MIGRATION_DEVICE_READ_EXCLUSIVE, offset);
+}
+
+static inline bool is_readable_exclusive_device_private_migration_entry(swp_entry_t entry)
+{
+	return swp_type(entry) == SWP_MIGRATION_DEVICE_READ_EXCLUSIVE;
+}
+
 #else /* CONFIG_DEVICE_PRIVATE */
 static inline swp_entry_t make_readable_device_private_entry(pgoff_t offset)
 {
@@ -164,6 +201,36 @@ static inline swp_entry_t make_device_exclusive_entry(pgoff_t offset)
 	return swp_entry(0, 0);
 }
 
+static inline swp_entry_t make_readable_migration_device_private_entry(pgoff_t offset)
+{
+	return swp_entry(0, 0);
+}
+
+static inline swp_entry_t make_writable_migration_device_private_entry(pgoff_t offset)
+{
+	return swp_entry(0, 0);
+}
+
+static inline bool is_device_private_migration_entry(swp_entry_t entry)
+{
+	return false;
+}
+
+static inline bool is_writable_device_migration_private_entry(swp_entry_t entry)
+{
+	return false;
+}
+
+static inline swp_entry_t make_readable_exclusive_migration_device_private_entry(pgoff_t offset)
+{
+	return swp_entry(0, 0);
+}
+
+static inline bool is_readable_exclusive_device_private_migration_entry(swp_entry_t entry)
+{
+	return false;
+}
+
 #endif /* CONFIG_DEVICE_PRIVATE */
 
 #ifdef CONFIG_MIGRATION
@@ -175,6 +242,9 @@ static inline swp_entry_t make_readable_migration_entry(pgoff_t offset)
 
 static inline swp_entry_t make_readable_migration_entry_from_page(struct page *page)
 {
+	if (is_device_private_page(page))
+		return make_readable_migration_device_private_entry(page_to_pfn(page));
+
 	return swp_entry(SWP_MIGRATION_READ, page_to_pfn(page));
 }
 
@@ -185,6 +255,9 @@ static inline swp_entry_t make_readable_exclusive_migration_entry(pgoff_t offset
 
 static inline swp_entry_t make_readable_exclusive_migration_entry_from_page(struct page *page)
 {
+	if (is_device_private_page(page))
+		return make_readable_exclusive_migration_device_private_entry(page_to_pfn(page));
+
 	return swp_entry(SWP_MIGRATION_READ_EXCLUSIVE, page_to_pfn(page));
 }
 
@@ -195,6 +268,9 @@ static inline swp_entry_t make_writable_migration_entry(pgoff_t offset)
 
 static inline swp_entry_t make_writable_migration_entry_from_page(struct page *page)
 {
+	if (is_device_private_page(page))
+		return make_writable_migration_device_private_entry(page_to_pfn(page));
+
 	return swp_entry(SWP_MIGRATION_WRITE, page_to_pfn(page));
 }
 
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 08c68e2e3f06..bbfe5e87884a 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1800,7 +1800,11 @@ static void copy_huge_non_present_pmd(
 
 	if (softleaf_is_migration_write(entry) ||
 	    softleaf_is_migration_read_exclusive(entry)) {
-		entry = make_readable_migration_entry(swp_offset(entry));
+		if (softleaf_is_migration_device_private_write(entry) ||
+		    softleaf_is_migration_device_private_read_exclusive(entry))
+			entry = make_readable_migration_device_private_entry(swp_offset(entry));
+		else
+			entry = make_readable_migration_entry(swp_offset(entry));
 		pmd = swp_entry_to_pmd(entry);
 		if (pmd_swp_soft_dirty(*src_pmd))
 			pmd = pmd_swp_mksoft_dirty(pmd);
@@ -2523,10 +2527,17 @@ static void change_non_present_huge_pmd(struct mm_struct *mm,
 		 * A protection check is difficult so
 		 * just be safe and disable write
 		 */
-		if (folio_test_anon(folio))
-			entry = make_readable_exclusive_migration_entry(swp_offset(entry));
-		else
-			entry = make_readable_migration_entry(swp_offset(entry));
+		if (folio_test_anon(folio)) {
+			if (folio_is_device_private(folio))
+				entry = make_readable_exclusive_migration_device_private_entry(swp_offset(entry));
+			else
+				entry = make_readable_exclusive_migration_entry(swp_offset(entry));
+		} else {
+			if (folio_is_device_private(folio))
+				entry = make_readable_migration_device_private_entry(swp_offset(entry));
+			else
+				entry = make_readable_migration_entry(swp_offset(entry));
+		}
 		newpmd = swp_entry_to_pmd(entry);
 		if (pmd_swp_soft_dirty(*pmd))
 			newpmd = pmd_swp_mksoft_dirty(newpmd);
diff --git a/mm/memory.c b/mm/memory.c
index 2a55edc48a65..8e5e305bc2dc 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -963,8 +963,14 @@ copy_nonpresent_pte(struct mm_struct *dst_mm, struct mm_struct *src_mm,
 			 * to be set to read. A previously exclusive entry is
 			 * now shared.
 			 */
-			entry = make_readable_migration_entry(
-							swp_offset(entry));
+
+			if (softleaf_is_migration_device_private(entry))
+				entry = make_readable_migration_device_private_entry(
+								swp_offset(entry));
+			else
+				entry = make_readable_migration_entry(
+								swp_offset(entry));
+
 			pte = softleaf_to_pte(entry);
 			if (pte_swp_soft_dirty(orig_pte))
 				pte = pte_swp_mksoft_dirty(pte);
diff --git a/mm/mprotect.c b/mm/mprotect.c
index 283889e4f1ce..61542a80074b 100644
--- a/mm/mprotect.c
+++ b/mm/mprotect.c
@@ -327,11 +327,22 @@ static long change_pte_range(struct mmu_gather *tlb,
 				 * A protection check is difficult so
 				 * just be safe and disable write
 				 */
-				if (folio_test_anon(folio))
-					entry = make_readable_exclusive_migration_entry(
-							     swp_offset(entry));
-				else
-					entry = make_readable_migration_entry(swp_offset(entry));
+				if (!is_writable_device_migration_private_entry(entry)) {
+					if (folio_test_anon(folio))
+						entry = make_readable_exclusive_migration_entry(
+								swp_offset(entry));
+					else
+						entry = make_readable_migration_entry(
+								swp_offset(entry));
+				} else {
+					if (folio_test_anon(folio))
+						entry = make_readable_exclusive_migration_device_private_entry(
+								swp_offset(entry));
+					else
+						entry = make_readable_migration_device_private_entry(
+								swp_offset(entry));
+				}
+
 				newpte = swp_entry_to_pte(entry);
 				if (pte_swp_soft_dirty(oldpte))
 					newpte = pte_swp_mksoft_dirty(newpte);
diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
index 7fddafed3ebb..b19820a51e95 100644
--- a/mm/page_vma_mapped.c
+++ b/mm/page_vma_mapped.c
@@ -255,7 +255,8 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
 
 				if (!softleaf_is_migration(entry) ||
 				    !check_pmd(softleaf_to_pfn(entry),
-					       softleaf_is_device_private(entry),
+					       softleaf_is_device_private(entry) ||
+					       softleaf_is_migration_device_private(entry),
 					       pvmw))
 					return not_found(pvmw);
 				return true;
-- 
2.34.1


