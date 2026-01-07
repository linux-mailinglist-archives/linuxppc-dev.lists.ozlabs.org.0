Return-Path: <linuxppc-dev+bounces-15365-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B713CFCCE1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 07 Jan 2026 10:19:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dmMtF1B9Xz2yMB;
	Wed, 07 Jan 2026 20:19:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=52.101.56.71 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767777557;
	cv=pass; b=EJvM0g49kDhGRrXUPUKHVhI0vwuu9PMS3Eg5Pn+tV5J2rccn7fnoII0EHicrWNAb3C4SShXCoQSh9a+uhOmyq55t2qEiQg13QMMc91rvI0SoS0fg03PbE+R4kXdvmOciWhmnt+jShTO4Nc5VhjAKstiGVI8+emMUD06UGfl8A/WrY4EZD7uKikdRTK76kfwRHPo270ZRi6aHYNcrVxEmtWo8WhND4OsBUibd2R+KXeJINfvmhMUCmuujw/uaxw8ADaUYr5d2+0eEmLRLcndDB519LrCKrZKtD2mc0V5fwm+wT7ZdcrTlUompY+tBeMJucTcqVKXod+K6lLeIX3TkBQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767777557; c=relaxed/relaxed;
	bh=RiPfsVeSco4+tw9MLR3a6AO8th+OP5bcrFN+x/BIKr4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BwwVp4BK5ExJBICJFoDzwU6Zlc0gePOcDB5JwWdsw7oQSiq1DghKigji11WcjUXkeop2gZlkpUC1m9T8/IquZ9fnyUsHYrm1mtFgIgjFz/wr5jaJ4PLqia0a9AKR2M3tNCeWAlTGhkrvA5SH6CKLsKlaJRa3vkPniLrc7OlwDtSAjlsUi8OAytmYfX+X2Qu3/xWeH5lFgY/8mYsZq/dnFFww+M0E8roHOPn+wTtIsaXcFyr2rkvp2AQviEO5JFQDfqGiurkJ75shxTUYIXOqmteq6vvwscZ0Oud3oinLv8LlWWkNJywGtUY/stNA8qv9cvbNdyxWb0lxkyrGvYTwyA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=mSgXs/Ob; dkim-atps=neutral; spf=pass (client-ip=52.101.56.71; helo=bn1pr04cu002.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=mSgXs/Ob;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=52.101.56.71; helo=bn1pr04cu002.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org)
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010071.outbound.protection.outlook.com [52.101.56.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dmMtD1mbMz2yGD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Jan 2026 20:19:16 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZLQxwNlZjwktSnACPhuOFrcuEhx0Pk2+aPh20RCWU1pXwcd6W8O6pMUmO3x2/GZBEQsyZgUTMp9+4K4AXgMc7Fr1Y1wTiBLjnArXn8ntMbBMNlMKXCiqWp7q3t70T0bdC2RifDKY8E52YsWzxxcI0bWHuKwpJoqj2dO8dxY+rwjDtL8mOAU7jUKmkECwQlXzVCjGxYfRiowCuCzqkx4R7TOg6eNnHyEe4GJSUlO+sDy/tpu9QXVvT3tXAfP4x470PUYlbKuuND3URfiDKySS7N7FckdPRxtESLGoSLqmM9/nWNDCnN6XbdpUWJDOgNnLjXJXsQnj0lqgX3y7O2B2Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RiPfsVeSco4+tw9MLR3a6AO8th+OP5bcrFN+x/BIKr4=;
 b=S9L+fGmPDbkOaHiDlHa8idiFsi+X66YwXpqyXPYAYgdBe1ODp3JSOOIJV+xfMRtsv7CBxeMpNU/UDQDyBnejfolx+AJJziwfhJ5fjZ8pVQ6iSkM0FM+vhl0jzFC2Rn2wn1u34Wlf/BGsH0FDPtm6NELDMjYbfc1DJJKEO8v4iYCrzgXUOxSAKfBbmlIoq9owfB7v5IKOar+InrbLTdOPtTz+39bGXSMg7O+YsFn+hRCTZc3j8UYJUIzElVZSp31QbzjvMkUAMZgwcOj5zb5GFKyb1NdABR5V46US2so1SEgduiVujJtNytZ3Y0IpJE826nHoYYXj7w75f/N/bMVtKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RiPfsVeSco4+tw9MLR3a6AO8th+OP5bcrFN+x/BIKr4=;
 b=mSgXs/ObBn9EHqPfUmrOVEkF8n5mnEKMiT6dInjMTJxZoFcTd33PkJG35Kt07LmesMOVUJH1G3DlRL8JmEE3gtj3FvLW24kbUuPzvcdRj3s/mkpRBQyzcgKSEcCiRAzrn/YLRbDWmpVd3cISGH5PtrmBNyuVhIvy97XO0uKabDSc+qyOhQHQ7jsDbFk3qMwvOOJjNyR3uA9vKkHY1S4JdHf4m9lEeCROdYx3ADukcKGqb7G/ZSQvbZG2WPCse+5IyRxFFkAOiK0RYc5J4OGh3Pu1aGbDlN9AktnVPfvU7sYsSw74pO3E5Vy88fPYOZ4hZ2EjwGrlvwv51+18bZWTWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 MN2PR12MB4335.namprd12.prod.outlook.com (2603:10b6:208:1d4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 09:18:39 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 09:18:39 +0000
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
Subject: [PATCH v2 02/11] drm/amdkfd: Use migrate pfns internally
Date: Wed,  7 Jan 2026 20:18:14 +1100
Message-Id: <20260107091823.68974-3-jniethe@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260107091823.68974-1-jniethe@nvidia.com>
References: <20260107091823.68974-1-jniethe@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0088.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::33) To DM4PR12MB9072.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|MN2PR12MB4335:EE_
X-MS-Office365-Filtering-Correlation-Id: b50f75a3-b3c1-4f25-ee76-08de4dcdbebb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ht2hzWEkpYHYdJ3SnrQI+/WUi3+0McxrO1BfqRULwy2A/PBx6Hqkgy9Cfxnb?=
 =?us-ascii?Q?npDNpBhy/cm+zXSwWv3GwFXJnAXvV76BBr5kwSwXObF8qZMsDNxsbvtued/N?=
 =?us-ascii?Q?QwZJaPius1lBLSJGI6G1vdHyWLwDI7AGTUGEE13IB+yXqak8z8J32NIOdtu3?=
 =?us-ascii?Q?W8AUWL9x20oDPF4NyghpJ37jy3IJ0Lfx1/RwmOvv38E5ydOFmW877bJA0pSO?=
 =?us-ascii?Q?0cxvjNdsMNurmkoC6UDi9DVpE6mr8pQUlkFrvw9/C9EE9qukI5sYh10ecRyE?=
 =?us-ascii?Q?zbAgiQRPN3j+dIGTrVVldClGmZ5jsgMtTaRDEF8G2rpDSx2mSAXOyLAeEiVW?=
 =?us-ascii?Q?kPBvr6JC0Dh/A28NzvBHW6TApXYU7k3//M1Xc7wzRr0iEIN0cfzoGIZPOxNJ?=
 =?us-ascii?Q?DFeZXMG6B29sWclyGqOno1i6cpO/11CyKGrofEYoM2PetcoWcnCh1xKdqrHN?=
 =?us-ascii?Q?P4rDx/VqlvR90gxBR66rwZvTe3vrYvaxhN6MaTIxc0kW2GAznAkMLqOZePgM?=
 =?us-ascii?Q?uztlWnFrCxB7Unwn0iC+n8K9rB1ONW2+bY1ALqirwT3/8qT7T88pAUbyc5gp?=
 =?us-ascii?Q?LNeSOLavvzHFiPRxfwZYj12tkYoAWgLVxMAnR9Ld6VCgN9dHMsP1/1cT0T39?=
 =?us-ascii?Q?iCgh6fBWf7ftj5o+6IEAlAtWmD6In2vwFIjxShhFwufyCUjAYyCHNkmWw0Xd?=
 =?us-ascii?Q?m04LFQwxPAIc054KgaDYKKaNwN8qRkdV9eFJW28QB7xpvTIML6cJe5Y3HRKu?=
 =?us-ascii?Q?BQv937u6z4cuP/1UBLkMH+MQWKdjD0aZLZfsIcHj0kaOcU6C0kcHYws7nCBP?=
 =?us-ascii?Q?Mj7Z/FeGNpmbTvP/thp3BL7J40PwF8EMaZfXaUsZ7p+eCiwyouSI7n9uFeA8?=
 =?us-ascii?Q?lxOm4AcYGVMYj3szsxXfS9sjI9+mrR+O+o/eIsekw+fb0laGyEpvPbYFJ60w?=
 =?us-ascii?Q?kXtWSdvLrSPChGuiam1hYzgxv/ivai1w9DeCyBwcMIT6kbaq0GQXMsP255Mb?=
 =?us-ascii?Q?h86oIbOOYu7aD4cY7kjcnNyAQsPMKm6aFLox/nhJ9QG5Av1IjD/CwguHl/2Z?=
 =?us-ascii?Q?qxGz/18JVY/BPieS40cap1v+CJ10pPDh5DwV2QJvk81QIhdTFnnGz8zcj3fM?=
 =?us-ascii?Q?caS4Q0oiLWU67xNbtEIfBCz5+AA9EEXB6EwOsjwd7LqpzyzTPSBF0sr3THAJ?=
 =?us-ascii?Q?Z1xcrtQ+IiSaMbHrq38EEWoQpVuONbhbMb9jjgn6f2mopYy/Iy6dfe9jI4NL?=
 =?us-ascii?Q?cEL4ecdeaLPM05PGz0Ek3dMAsCUsZgxbfPeTh45bb8cb5N1ov8WKPH1L6n5j?=
 =?us-ascii?Q?UkKQ1oQZeHwH3ecnC0s8JYgHI6FHJqfWyyYF2ER51/EsXtNgjNefHDbLaJQn?=
 =?us-ascii?Q?vFs6ffV76/YN93mFalQP5y03AktYgMlvnPiz/besEuldOXBfH/KjprgB6Z+c?=
 =?us-ascii?Q?rIYoAhmNap47zkZ0EcQopYpIBYwrv/zu?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB9072.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TCdr0I3l4QWPrwFFi5lHosQ7HhbTtAGak9zRtr7jfpFCscgseMnWcI2XufyU?=
 =?us-ascii?Q?d89OfYXoWTZuZDg1mVXHoJ+u05tDCUmvA7QFj71dkbj1hp7EXX56beS37N4v?=
 =?us-ascii?Q?uPbBwl+GsZep/Sy7hq86Qbi8cwzTuuxnIbCwWcVRDgZfpwc4+izC9s6WZh+o?=
 =?us-ascii?Q?Gx+qiNCQowd/JmPcKJ76csYY1uuusQuzjIP4kYq1VHc8kKgTnGu4xH71C4gV?=
 =?us-ascii?Q?HywCcK8CZkj05PJwtMtlFklON0RYfPUBguKY153q/k49++EESIKf6IDuKpaY?=
 =?us-ascii?Q?CQa2X2RDsr/wylupPHqjswVKX3UsnZueQCJzVVSDzX9D/0NiL5nYF9sVsGPe?=
 =?us-ascii?Q?/1eNCdLxg39BB30YAtHfl7i5ZQRkSjsOjrWiywfQvi9AF0o5hRIe0ON8++GR?=
 =?us-ascii?Q?PMPbWp8Pd3uokPiqhaTfMeAxUu1yVxPPy77oL6FwF8yq6/X/P5up4bo+JxkS?=
 =?us-ascii?Q?zJU/ZEl71wsespK37jfnCGXOOvoQRG3uiyOemAzxh5TOyEoh6D3neGIgowL+?=
 =?us-ascii?Q?1cAhU99xXjTDM85rpGuahsysCoJOOm4Xi1AkLzyO0cL48dlEh8QEEleSXO1u?=
 =?us-ascii?Q?LHaaxI3gZ1vFlblqLINZ3hoXB0/fs1HDo64gREvwrf10NMzg3JBYLPMOlfpf?=
 =?us-ascii?Q?8ECntDmtJbNCnykNK6C0QY/kQotv/Js0xw0hC9yUG3+3gdtiPbud4SwPywZE?=
 =?us-ascii?Q?J4Wo8ZZK3hiR0caO8xQX6BXYZDSm1ra57ax8Xou8oaz9bGBP0srnRLDgQsMm?=
 =?us-ascii?Q?p202NcIwfaHxO3igPuMsKDyaFu9F32pzpUrCJuhFtlnZ1VKKoKCmBnD47Joy?=
 =?us-ascii?Q?1EnjeuIXiAdRiQCP7s1Gs7rHUlqMIpZ4ibPJQlsba0hfrUfRvFzuRuLHKqa/?=
 =?us-ascii?Q?V36GurgEdvBAP7SLbkJhBnRODt9+8C9qtOnYMKSYDqHCiSq9KsUEpU/JHN/Y?=
 =?us-ascii?Q?7qrXnW6XurP4u0Sx8NyxwwXhGmNuNsmp4tHChWVDkJCCP1uZbIJZHp6J9XaL?=
 =?us-ascii?Q?fNMlq3eNlrpukt5jkqfqWVJomHZ4ZeJzosjHVi/t1pwc1EsRifqWjRqZsZYi?=
 =?us-ascii?Q?lp9OLL81RgZwJ+67Nisrqayqmf/eXbI6wUTfqxJok0lcgxl9xKvmK27Bx6SN?=
 =?us-ascii?Q?w5cOmGMmOSA87kJN3UnrD+O1ZqWWQWXLU8DqEwq3MVXkAb4wXKdJz3sPEl0K?=
 =?us-ascii?Q?NfbnhaB4l/2Ml1Vda5tedcF5YCfXodHDDxTywqI7nTjB9EUTzNiSwrItc9qd?=
 =?us-ascii?Q?qnUGol+FkoDnfCeq8QsY/SEmMLlIGI+bXeuN34xxFo6aDmNPDfqV9njmLfCd?=
 =?us-ascii?Q?qcHrPRk3qIvqQcilfF7/AomiaOeFfyRruKHCxC6MLJP0o8lgDe0swH0VinaN?=
 =?us-ascii?Q?IdwBIcM/JAfEYc8+zKNmWk1bSJnFkqBluxNg+UJ9Lr5aO8JKYu9ToCFeqDNL?=
 =?us-ascii?Q?8VrfYO84HL2U0bESEubhHqAXM/M1+UbTRBZP+GZ9H+yDazGQ6YEeKekv8Zyh?=
 =?us-ascii?Q?A8pV0ZArxhBEMDv8uQ0cz8/ArjBoVflcwtcgyGl9/M4FWR2VLq2sqdN7VCcG?=
 =?us-ascii?Q?bxk6o10qK46i06C9K65atlG6QHwycdSVHcmOQw9drQB14XcnfmoKiSTU63H1?=
 =?us-ascii?Q?BP687snziMVjT84+W0Z71hi9RJbMfz7wCUYcFjR99tNFhzIr2jhhSkUlPvLm?=
 =?us-ascii?Q?Fx/nby62zm4v8Ds7DO8TtB6qjLSaNp9kbVy2NR3Tq98a4yE8moxqUmq8Syec?=
 =?us-ascii?Q?Yi5jeYZoAg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b50f75a3-b3c1-4f25-ee76-08de4dcdbebb
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 09:18:39.7927
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mGYfVMHJZtjE43fhRM2WJcAswJ4mqRfgDYtKFqcjs77+5SrP7+Izx+Z4hqu76ucJuCM/e5qIoV7MO/3Gf1/wlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4335
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

A future change will remove device private pages from the physical
address space. This will mean that device private pages no longer have a
pfn.

A MIGRATE_PFN flag will be introduced that distinguishes between mpfns
that contain a pfn vs an offset into device private memory.

Replace usages of pfns and page_to_pfn() to mpfns and
migrate_pfn_to_page() to prepare for handling this distinction. This
will assist in continuing to use the same code paths for both
MEMORY_DEVICE_PRIVATE and MEMORY_DEVICE_COHERENT devices.

Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
---
v2:
  - New to series
---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 15 +++++++--------
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.h |  2 +-
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index ca552c34ece2..c493b19268cc 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -204,17 +204,17 @@ svm_migrate_copy_done(struct amdgpu_device *adev, struct dma_fence *mfence)
 }
 
 unsigned long
-svm_migrate_addr_to_pfn(struct amdgpu_device *adev, unsigned long addr)
+svm_migrate_addr_to_mpfn(struct amdgpu_device *adev, unsigned long addr)
 {
-	return (addr + adev->kfd.pgmap.range.start) >> PAGE_SHIFT;
+	return migrate_pfn((addr + adev->kfd.pgmap.range.start) >> PAGE_SHIFT);
 }
 
 static void
-svm_migrate_get_vram_page(struct svm_range *prange, unsigned long pfn)
+svm_migrate_get_vram_page(struct svm_range *prange, unsigned long mpfn)
 {
 	struct page *page;
 
-	page = pfn_to_page(pfn);
+	page = migrate_pfn_to_page(mpfn);
 	svm_range_bo_ref(prange->svm_bo);
 	page->zone_device_data = prange->svm_bo;
 	zone_device_page_init(page, 0);
@@ -225,7 +225,7 @@ svm_migrate_put_vram_page(struct amdgpu_device *adev, unsigned long addr)
 {
 	struct page *page;
 
-	page = pfn_to_page(svm_migrate_addr_to_pfn(adev, addr));
+	page = migrate_pfn_to_page(svm_migrate_addr_to_mpfn(adev, addr));
 	unlock_page(page);
 	put_page(page);
 }
@@ -235,7 +235,7 @@ svm_migrate_addr(struct amdgpu_device *adev, struct page *page)
 {
 	unsigned long addr;
 
-	addr = page_to_pfn(page) << PAGE_SHIFT;
+	addr = (migrate_pfn_from_page(page) >> MIGRATE_PFN_SHIFT) << PAGE_SHIFT;
 	return (addr - adev->kfd.pgmap.range.start);
 }
 
@@ -301,9 +301,8 @@ svm_migrate_copy_to_vram(struct kfd_node *node, struct svm_range *prange,
 
 		if (migrate->src[i] & MIGRATE_PFN_MIGRATE) {
 			dst[i] = cursor.start + (j << PAGE_SHIFT);
-			migrate->dst[i] = svm_migrate_addr_to_pfn(adev, dst[i]);
+			migrate->dst[i] = svm_migrate_addr_to_mpfn(adev, dst[i]);
 			svm_migrate_get_vram_page(prange, migrate->dst[i]);
-			migrate->dst[i] = migrate_pfn(migrate->dst[i]);
 			mpages++;
 		}
 		spage = migrate_pfn_to_page(migrate->src[i]);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
index 2b7fd442d29c..a80b72abe1e0 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
@@ -48,7 +48,7 @@ int svm_migrate_vram_to_ram(struct svm_range *prange, struct mm_struct *mm,
 			    uint32_t trigger, struct page *fault_page);
 
 unsigned long
-svm_migrate_addr_to_pfn(struct amdgpu_device *adev, unsigned long addr);
+svm_migrate_addr_to_mpfn(struct amdgpu_device *adev, unsigned long addr);
 
 #endif /* IS_ENABLED(CONFIG_HSA_AMD_SVM) */
 
-- 
2.34.1


