Return-Path: <linuxppc-dev+bounces-15947-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E6FD39DF3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jan 2026 06:42:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dvfVL2nFrz2yDk;
	Mon, 19 Jan 2026 16:42:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c005::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768801338;
	cv=pass; b=LnFU7ZDnM8otiHtjaWS0JFSMUTFMHZ0A2dbXBPTAE3RBr2I8oZksfqIgzCD3exS8UMyg12EtRtNDDxKUk8VF3k+oJjZZip+9VYRureLjAjR6ye2QYRqkNohvUfUtNICvVvadVCxYHqHieq7rkeurYYKNvaY52rFm1J4E0Nr/29L2kXVThKo2aufv8B+I2rdkYpm5jUDRfuz/nnR7h8LNu6nFmK4u40DDp751IC+jkOPuhDHlWUGzCwWvEsSbLke/UFi58Ba9wNldMQJ8em9QtdVpUqreCYKBX2kTcHpDOwYL5aIbbU0A3OfrN2pT3HfiarbvKh/LTekS6EZrfD4UWw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768801338; c=relaxed/relaxed;
	bh=qK3XiTS+uSs4Wa2VPlJvbJxUnlZWwPdIxsUpN6pCDjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fUdO+vMvqrlXCPka0RtWMmmg9q0ZziXNYZYuWGEQUqQniAWusutjjXJu2+QZrw6YqCgFl5qG2Sbm0lNTN6xal3lk6l2ZOCWn2XqGWEhTY6CADk5PW/s8ymbfElr+EE2bSvMHtWBzyeRl0IhIbHmy9voxmtTeQJu1zr0AzCIQxX5LGnfacQ+QP28ttoSkEpqsHFre6K9qaRSpbKabyTEEHjLidOSm2iLyF+mmCAhkh6ZljxRIfALp6qUIIQ4d+yJDSBsKaZi3I2Pm+q3ynqKVFgMZj7jLsxh3qU7tbx8Ar3/UvI6e151NUbVmeBTC5V2sO3hOlazVpiQvnq2bjFJhuw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=jUbGVqYx; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c005::5; helo=co1pr03cu002.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=jUbGVqYx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c005::5; helo=co1pr03cu002.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azlp170100005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c005::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dvfVJ3hQ3z2xSZ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jan 2026 16:42:15 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wE5Bv7/ig79+QnmvXPZjggD2v0pYM6wzLfOtwd4qE2UOK6BBRdT7q+F66Fjlg4BEGTTKWtk6xoOgODXMNGBYsb9OUN5qF/iUIKdzmO3a9Bb/MX2084+ihWLJjianpFD2TzBgqMGPEnwv2yvQZ0xLNwU9GHt/4Tq67oJTGMgzo7Mso4CUB96g4u+zHAYlD7wKC7ppvnzDCCVzAI7mRTTQ6HDT5d7VwzQ3iO2R2XZdPs+l4f+2AuVlGfXEokKlwn9Ci4xowZaUGSixODceQzRPD20WDCPeLUvm0EB9OJkkITnz6N8LlUVPYw8ykx6rXsvDOKikoNsaWKuWchg9WXtQ0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qK3XiTS+uSs4Wa2VPlJvbJxUnlZWwPdIxsUpN6pCDjQ=;
 b=Z6ujz6TEXuRC6rHeXDkfu8+R/xHy7Wqx1K8c8gVGWQu+HsfxiwiHtl5pAPZS9c+fYoUY7eL0FgVemlKeI56wZAVxdcVSQaA3eXA1+ro+UCpBoPOhTc3O0D99sXVo+gegwLReylkHdb3FJCcH2zVc6cdPSA53lytqNFLOGu3umQQJEPJP5mlBkvTvbl8fQaTWifEpleagfuG8leQTGOV02RWqkCXsGbZ9Vy/gkbNsXdOe66loGomuZHdK6jP10kKMSBnBY5fB6iV4Jn0ZlqNptDMwvEyS50o2fXHyBdlbaKeGg8hT+slEX9bSF/SpdPe96V5MNRHSb6cc3Ai1BQVURw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qK3XiTS+uSs4Wa2VPlJvbJxUnlZWwPdIxsUpN6pCDjQ=;
 b=jUbGVqYxt9lDNuZjrmpaFO3l7m3FLYsgnvoyzQl/L+fXIPAeUlJ9LQ5NxtRSuzacEqxcsWYUbZYEqsERW8zhIM5iAc5r9o3r8knahxS+80+aq85JedpPoPtkLcLEDDnPz6QKPA682Ts4Uw7WJxODYcbxW/ZgpxsfcRlk1TqUVlyKDzIvpg9TWbbb96rH4ixzUB0Xjpuh+5WygBnE7rqQCx4qPmhANymI/7Tpt95V490e0jz6MlkpqSwlmZVCZfuD3XZgIPq+JK4c88TQhT6F8AbHULJdv3ES5lAhzN7KI4YYJA8bSD70KS70goUbNqEMQt8rMlWt5d6UZh5cpfUB9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 PH7PR12MB9256.namprd12.prod.outlook.com (2603:10b6:510:2fe::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 05:41:49 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9520.011; Mon, 19 Jan 2026
 05:41:49 +0000
Date: Mon, 19 Jan 2026 16:41:42 +1100
From: Alistair Popple <apopple@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Vlastimil Babka <vbabka@suse.cz>, 
	Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	Matthew Brost <matthew.brost@intel.com>, Zi Yan <ziy@nvidia.com>, 
	adhavan Srinivasan <maddy@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	Felix Kuehling <Felix.Kuehling@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Oscar Salvador <osalvador@suse.de>, 
	Andrew Morton <akpm@linux-foundation.org>, Leon Romanovsky <leon@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Balbir Singh <balbirs@nvidia.com>, linuxppc-dev@lists.ozlabs.org, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
	nouveau@lists.freedesktop.org, linux-mm@kvack.org, linux-cxl@vger.kernel.org
Subject: Re: [PATCH v6 1/5] mm/zone_device: Reinitialize large zone device
 private folios
Message-ID: <y7dm2sqf5t5txirxkbu7hlmsfsnlbtdirgn4ts2l4st3z4kawo@qpa56ysy5v3t>
References: <20260116111325.1736137-1-francois.dugast@intel.com>
 <20260116111325.1736137-2-francois.dugast@intel.com>
 <20260116174947.GA1134434@nvidia.com>
 <8006ea5f-8845-436a-a2d7-125399428762@suse.cz>
 <20260117001921.GB1134360@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260117001921.GB1134360@nvidia.com>
X-ClientProxiedBy: SY5P282CA0028.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:202::14) To DS0PR12MB7726.namprd12.prod.outlook.com
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
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|PH7PR12MB9256:EE_
X-MS-Office365-Filtering-Correlation-Id: 2437e481-3942-431b-7785-08de571d70bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DF7cAHISt2s3lbua59Aks1H4DGe9dQkCJ4vR+Rq1U5NULpWQysaxM0tTIAf1?=
 =?us-ascii?Q?DC6OIcmszD3q/VnDHezCAcFYCiR3SvA6yyRjsDg8lQKaj1iHhtRrhDIn2T/m?=
 =?us-ascii?Q?EnZAiLxrxtNLQNonzw3Q8bARNlTcdakNUAWx/l9LJTawXJd6abH1kWz75win?=
 =?us-ascii?Q?3c8eWpslO/i+liuTL5ENG53nHHNdPQX1QYICNE33JfDDZygSwtyh3/7aLTW4?=
 =?us-ascii?Q?Rq8lE2YaF40AxZol/BvkahB//rZrcMQW5jfuHjnTX0BDYzfzTVkOVyreCgea?=
 =?us-ascii?Q?h9B4gd5ECkY3dwDMFFplwTKfWc2M4tTwdS0JQyIycc6j0yYEqSXnS+X77HQU?=
 =?us-ascii?Q?uk3yxc9LRvFVDrOQMY9VaWUHT5nbENbrXD47GgKtxLYf4Ka9o/AzIVjUFs4Q?=
 =?us-ascii?Q?x4egJykK5HEq2AozipbVQSObRkskZQT1O8QJw7/AxoZNiI0j89hNiaXBVVn3?=
 =?us-ascii?Q?9rENectb670Y+U9uDkPK1D7m/M/7neVJt9imI/oTG+wSKIShp9IQUUXpiN6T?=
 =?us-ascii?Q?FCXQRQqLIc7kj6Cgvfo7YrsN4ua8fbI+/4FVuFyoUU6QxtMScl2h4xPS0ni2?=
 =?us-ascii?Q?XtwKEhBmPD7quf4deUluRPfrXyINBGAUWSy315HxGHjNpcJm9MN4ljvzXFVx?=
 =?us-ascii?Q?oxaf0ek3tTZRs6ZUjCm4kOyWIoba6d7Lbtx1D0fGwR5RBR3Lt0QOlOXxBwSP?=
 =?us-ascii?Q?kEzT7K9B+xn3y2Zeb1l3ilUehKGDO+JnW1JjesB6M4BYrsZW0VqWmEDekbBg?=
 =?us-ascii?Q?VW1201rsErESVQDBLJqEh6L3iGQM4y9Nq6Wk3m6a2otIMBbmKfEQBnshWsnL?=
 =?us-ascii?Q?optR6YaNee0tPOGOhF1iu3aLEVoj/yT/0c1bMv/HRXsXRlehqLCazpGJ4FCG?=
 =?us-ascii?Q?aMWx7sv89ML6JzdI6S3e4pCXInj4F6kPaLi9yfbtVCj1hFgKiT5qeNYMT7nD?=
 =?us-ascii?Q?AGhlBXheFOmACsBQpxP5tfHcHDKppiPKkSodgfXQ5O6c/JDZOIqkOIFfDEi4?=
 =?us-ascii?Q?tz2412nOKKKE1RtLecHpWA1b1u9MYeP/3M9FCk/5/bya7myHz6Ys7uW7wFEz?=
 =?us-ascii?Q?gA3/NQLduf+B84rywz01FIuq+pDfmiz0+3AuY65m79sRqMgTOJI5SlHEbLPc?=
 =?us-ascii?Q?Vla9U4jcC+THc8EDRObouMqlemVcPC6i4GWQ4/dvvnOUzCNRGhin6GU4LiUD?=
 =?us-ascii?Q?1XH7RWYWdyIA6vwgNccNlVHz8T3X2yvzyMSaCtElZFFQUE7dlxY0UCJ/MBK0?=
 =?us-ascii?Q?rfkcAP0xF3eR+jXIh3gBJOyFu5881IdXOzbAEZvOmWXpWKISoa8VCdTYQJNU?=
 =?us-ascii?Q?oDGAuZe6h1AXAKh6BRYmDlH7z8eCR6Z9Cf4m+MgPm1nxu6wGMCg2s59kgdXu?=
 =?us-ascii?Q?6EKFfuyqc7F2YoVoYLACh1Bp7ora4efJgdeqjiCd3/Pcsc0ePv3qBxWFpX/d?=
 =?us-ascii?Q?WqqhzklK1I2DBDQ51vmftCZHf2xZNbIGbMx+Z1ATRU5YVZIZQFqrVbjNTQIs?=
 =?us-ascii?Q?R4g6n7uPBvAMkhA1CgfsgNgG+EW7uwPHq+PxDwVzCcMnq2Hm7F26nPlgdV4M?=
 =?us-ascii?Q?Kyn16ShYTrSvMmt5ZIE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UL6vDGw3053/l9bc+92xDLkK1xVCNND8u/eOQjpJCMCAWDI5fCcBeR8P9itV?=
 =?us-ascii?Q?RPNzyXJmeiUgUPJbyqY1m5X0bFILQprcOMgncC4u8eAfgbOVa5ylXWE0vtFP?=
 =?us-ascii?Q?foYHTGAEEm0hQBg2laEBfOH0x4IaJhNE9rFBKga0E9Mh0ZJ9z7tAW9ZfdjII?=
 =?us-ascii?Q?rVU9BoZDrrecGyqkZ8TTBgd9CJWU55KwEgr06jtIHPsgHtQ3xP/zBBEZkpCa?=
 =?us-ascii?Q?HCRW0oW+nYvOx8QU6k5CUhpoxrUu5u2474moBgDrnATE3ooavjB3p3dBqgVu?=
 =?us-ascii?Q?K0NtKdmchmeAOVkFliaw48qoREI8COb/6IHmJ5OoPafiGOmL3NWrO67KeG5g?=
 =?us-ascii?Q?Gvo+MYqugnJTtpCGxzMSjMOuygsUvQSjVz46NXRtBQW70u2on488e8kPCmsk?=
 =?us-ascii?Q?tox4EBlTrcxmpMUa1YOx6Z+IsbK/LWLjoPApSiJR50HnrG1LIWq4e79PQHy9?=
 =?us-ascii?Q?j74Y08q+UNv5IqKmvrQMPDdiVAY5I7r/D8b8+ZU8Z86Hz50vvb1fgGPkspPD?=
 =?us-ascii?Q?MxwZtBrpdO1o/yRwDW5CTqehAKSBt92Vis2HZc9qJYsSCb9hJZ5hKVO9/L6Z?=
 =?us-ascii?Q?ZjpqiWA/GfuF9kEO88Gr5duydHBG09vTv/IsCSyNXOkRcCMrqWVmSOsZnXyQ?=
 =?us-ascii?Q?Q2aEA7smF9I1M6ajwkWVUAT7zhNDtK8N5wyC0NOtdZ0cDTRpnBqMi/80NhLm?=
 =?us-ascii?Q?g0eEIuYB3U/Kt/aCaUSqFt/DicRwY1MO4P2ggsYukDc+xF+lfv6QrL2JIafF?=
 =?us-ascii?Q?gFSCpCm8X19J0ryfmU+Usj8IWQvQod6Gd2y/1IhbFkr/50muBvw5gM+cJmz6?=
 =?us-ascii?Q?pIWaGryM57tAUyqsoaAZUrUt9FI+fhOqYJF7GyPkJ3I+DjQjhphtARWjBTJw?=
 =?us-ascii?Q?J5QjffNuZ/odntLsFJujY13t5cMiScvszGK5+JqpVw1nXZ834/1r9zCWaj01?=
 =?us-ascii?Q?V7slNsPE4Mytro4Ylf142faZLtOoCY554ddE1riwJ003FAeigduBOkV7uNYj?=
 =?us-ascii?Q?CJ82E1KtkULcDzFs7vdvbPpIye4fluIAC+1NZtEPvbEtO3fjKjPf2TsYq0C+?=
 =?us-ascii?Q?WOfQ2yiCWvr+EqL5dPfmu5Ao5u2+wN2DR94URRkQm5oBmHlPnzMZgluXZ6c2?=
 =?us-ascii?Q?epYf+65mXnGfL06zZeNDSGqF5nrERxyOiLQG/Aq34RGU0fIIx4EIRERfetXu?=
 =?us-ascii?Q?VNsAUsRuUCyBHbv4fF2gcLmid4G9NWuKPWMTN47CDjtsf1z2sMuFw8zHLabX?=
 =?us-ascii?Q?KYMGeO3ZgIwqk9/RcdEbmh+nAGA4h1oDcuLMC7m696gSTE20fXPzBud0tnO5?=
 =?us-ascii?Q?WwqjeV3Wg4WV1ywQptwSyMaTsFzOq3qVfZbvZLu+yvCFJZLvppYhN+cC7Mci?=
 =?us-ascii?Q?xM3jlMZl9tu0O3xOmpBGGiZeCanS4aGuMqBCGBw+A3AdghyoSXbW2X+FUy14?=
 =?us-ascii?Q?AS1MDBOG/SsPFQ5jB5ST8hFIpzkvrf/CvrWZ5liB0n8G7Y42nFYAepVwl599?=
 =?us-ascii?Q?95uICIksg8pznNIJrcbi7eIv7pF5U20SiDr21mGmnjNmQfErzXH+hdBpsJ8l?=
 =?us-ascii?Q?y4AvCaZiDjGz/7Lon6zii7cIv8NlUgoVoZYwhlGl8rIdvJT9kn9G3sFZQ8Ii?=
 =?us-ascii?Q?YwdsqpDHWbRh8acWlU3WWkdySnsXo8PtTxSde70jNCVxJa3ZJf03dyJ/ezMt?=
 =?us-ascii?Q?DSj5xnLU31uQ0uoSCGZM3KXFa4dcCSd6OHNW42UgOVkL8WT7lnoX1Pun6m1C?=
 =?us-ascii?Q?vZaCncgRUQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2437e481-3942-431b-7785-08de571d70bc
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 05:41:49.4159
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ki3Svp+xizI3bno4NIrSroQ46uIc+M8KbCin65A8XaIduLWGlvcvX8U6tiiVPqgbjRiIOcZK1Gfm0A8/vONK8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9256
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 2026-01-17 at 11:19 +1100, Jason Gunthorpe <jgg@nvidia.com> wrote...
> On Fri, Jan 16, 2026 at 08:17:22PM +0100, Vlastimil Babka wrote:
> > >> +#ifdef NR_PAGES_IN_LARGE_FOLIO
> > >> +		/*
> > >> +		 * This pointer math looks odd, but new_page could have been
> > >> +		 * part of a previous higher order folio, which sets _nr_pages
> > >> +		 * in page + 1 (new_page). Therefore, we use pointer casting to
> > >> +		 * correctly locate the _nr_pages bits within new_page which
> > >> +		 * could have modified by previous higher order folio.
> > >> +		 */
> > >> +		((struct folio *)(new_page - 1))->_nr_pages = 0;
> > >> +#endif
> > > 
> > > This seems too weird, why is it in the loop?  There is only one
> > > _nr_pages per folio.

Yeah, I don't really know what the motivation is for going via the folio
field which needs the odd pointer math versus just setting page->memcg_data
= 0 directly which would work equally well and would have avoided a lot of
confusion.

> > I suppose we could be getting say an order-9 folio that was previously used
> > as two order-8 folios? And each of them had their _nr_pages in their head
> > and we can't know that at this point so we have to reset everything?
> 
> Er, did I miss something - who reads _nr_pages from a random tail
> page? Doesn't everything working with random tail pages read order,
> compute the head page, cast to folio and then access _nr_pages?
> 
> > Or maybe you mean that stray _nr_pages in some tail page from previous
> > lifetimes can't affect the current lifetime in a wrong way for something
> > looking at said page? I don't know immediately.
> 
> Yes, exactly.
> 
> Basically, what bytes exactly need to be set to what in tail pages for
> the system to work? Those should be set.
> 
> And if we want to have things set on free that's fine too, but there
> should be reasons for doing stuff, and this weird thing above makes
> zero sense.

You can't think of these as tail pages or head pages. They are just random
struct pages, possibly order-0 or PageHead or PageTail, with fields in a
"random" state based on what they were last used for.

All this function should be trying to do is initialising this random state to
something sane as defined by the core-mm for it to consume. Yes, some might
later end up being tail (or head) pages if order > 0 and prep_compound_page()
is called. But the point of this function and the loop is to initialise the
struct page as an order-0 page with "sane" fields to pass to core-mm or call
prep_compound_page() on.

This could for example just use memset(new_page, 0, sizeof(struct page)) and
then refill all the fields correctly (although Vlastimil pointed out some page
flags need preservation). But a big part of the problem is there is no single
definition (AFAIK) of what state a struct page should be in before handing it to
the core-mm via either vm_insert_page()/pages()/etc. or migrate_vma_*() nor what
state the kernel leaves it in once freed.

I would like to see this addressed because it leads to all sorts of weirdness -
for example vm_insert_page() and migrate_vma_*() both require the page refcount
to be 1 for no good reason (drivers usually have to drop it immediately after
the call and they implicitly own the ZONE_DEVICE page lifetimes anyway so why make them
hold a reference just to map the page). Yet only migrate_vma_*() requires the
page to be locked (so other ZONE_DEVICE users just have to immediately unlock).

And I presume page->memcg_data must be set to zero, or Matthew wouldn't have
run into problems prompting him to reinit it. But I don't really know what other
requirements there are for setting page fields, they all sort of come implicitly
from the vm_insert_page/migrate_vma APIs.

 - Alistair

> Jason

