Return-Path: <linuxppc-dev+bounces-15366-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D26CFCCE7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 07 Jan 2026 10:19:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dmMtG1XJ7z2yR5;
	Wed, 07 Jan 2026 20:19:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=52.101.56.71 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767777558;
	cv=pass; b=Rvd992CyyhkLtrhfOwHnv6GKuLbXlXsVNvHV8SDfeW9LHEOWSBYOT2EC8KJ1C+/hQWnG2mo3Rz8Qw/V0QnSGQJweCxNw4DHaLHn4YrC0v+Vx7mMi4WYyGLsvSllN+WkCVblpUoppvYFfdylcmNcBA0SDYymZSs06a+lTnFF1BbcOJ08wbAMwQraLg3oiQKf1j8b2JLNc/0UA1OCBxOWX3g/8W5giP1+0V/+f5gQC5G2GTKBhr41VX8fKu0taWP4CapCdULTYHcUM+b5A5Yf7Sz/RYZBIZjDuma0jyb4q5v2JF6Bal6IdjmVNOltqOOm9vazAXOo5rUcsnaJPhcYZrg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767777558; c=relaxed/relaxed;
	bh=0FJ0nFMwah6bOPj3aj8uu2307JgLdg6A3pZ+U/MQn4E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lRHfH5hHNCWF+U6qRQ2dELULqiwVyXem7hjLKrSfyCrhDLzQx4dyu7OL8kt9KT13XLIForfnr1CRHNxpQetbUvPX1hMOXByxf9nBm0fQIO6DqCdIhc3gI0ij2ZRsbOf7K0eHnxNx8a8e3MuiNOu4WjYfec3EEegbjjGBBo8gPaOUNgDynLWQGe6fCYifGO3N2aqqTlW9Q4NRVbvUgITMip1Mx4xsuZAAU/KUM9BoyeEu1vo1xj6QqTxswK8hNHL69RAIbYzVrbxALxp0ZHnuiTyJV7KKarLatOYq8/jXlLMoA91dQc2SFd9LrOcW9fX0gkMse7IjYRMqbM7yCd+Syg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=oDmfdQ8S; dkim-atps=neutral; spf=pass (client-ip=52.101.56.71; helo=bn1pr04cu002.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=oDmfdQ8S;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=52.101.56.71; helo=bn1pr04cu002.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org)
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010071.outbound.protection.outlook.com [52.101.56.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dmMtF1vxrz2yN1
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Jan 2026 20:19:17 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wpjgpwG5w1nLihEeKc5WDfjxbOGVkhKKYWNns4DRNaM9Oz5l/31G11QfUCw5AHvluwvKdpyUAebUMhU3edSsrx2fns0z1NAvhh5wXy6120XUIn6lj1zDT+KAjjawUiNSlIUnvoQ6OjHhafKGT2VYN7pOLWYSJcM4IYIXhh9fVgsfS3gNYX9N0bhdR/n0Pcra/GlhHmpUWldUZX4MjyX5gAwcQTEEVmwFA36Zrb85PLgJUUKclz/+4w9EB5inXbILFomFjZu0Uf1qBgW2NN6m1IF/34ujrSUIq5sscM60CQOlvT36TGdlNO3XDpl6jZPB0M5gDFMlbUH+jtWOgZBGyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0FJ0nFMwah6bOPj3aj8uu2307JgLdg6A3pZ+U/MQn4E=;
 b=HdV9ExRTISTpnLINPZJC2Hq5D/ZOYhlKeMvU1ClnmhHNYRFJDze5UTNcDRSXyHeFHgjbH2lEGBpF8VxL39B8DJ2EIuqp6LVF2J+ESuJlls54dm2RcCvjqGXaKqjpRLCvFshtHy+MQzruPvSI0e+T6WpZ3f26iMSPOb0N1acyfmurbByBh1RjU8ATEyjcK/ecdGUN+3Ug2drPoohsP9z/gTP4THpsOmW7Y2E9QnRaXrBs0HNj2EdnmSkqSpUzZO/o5gsaHTxg4ez1Sfns9quBPe5+1cobz8VllBJxMudrN4TGJL31CUG/Q7IVsFDTRpHvRY/NssBYY5mgBmFK7eKsnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0FJ0nFMwah6bOPj3aj8uu2307JgLdg6A3pZ+U/MQn4E=;
 b=oDmfdQ8SkV+HpZ+YO5zotNHN2skZ+It4WhzIGHo2ilonyJ2VzOaL+Vj4Qfkz7tVFtipzvB8CbhddbYR7+Hd4XLfJzZxzkiU37btp34AidP6FyXGB1MTUiNYQHQ+59WZuxyPrdlvlnMbVO5Wbv9s3TD1rI7x2LycOeYXw1/Ik4e/CAQN84IJVBwXviZuM3KYKVkQQRksMm/3zDN9WTv3utKe65qHsW4AqRg3BVP0uiPAxfwXwEkKqMhRo+KFbliuFOF+S528uYw8kQVRF0pOoXpHeepqZGLBzpbgVK/iWfA9DCp4IpX5tRANTXc/bR1NXeG72FGWzrdsYtHrquUwovA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 MN2PR12MB4335.namprd12.prod.outlook.com (2603:10b6:208:1d4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 09:18:43 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 09:18:43 +0000
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
Subject: [PATCH v2 03/11] mm/migrate_device: Make migrate_device_{pfns,range}() take mpfns
Date: Wed,  7 Jan 2026 20:18:15 +1100
Message-Id: <20260107091823.68974-4-jniethe@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260107091823.68974-1-jniethe@nvidia.com>
References: <20260107091823.68974-1-jniethe@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR03CA0028.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::33) To DM4PR12MB9072.namprd12.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 5c3e9036-632c-47c2-f5e0-08de4dcdc0ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MTU9Esvnd0ncORySdqbNUeFPWACA6MV9bGmHkNgoS7jUNKcX5GSC0G0Apf1w?=
 =?us-ascii?Q?lc04E8d///7YQwzrWpR8WX3ahl2okJFtT4XlwkXE0Ptth6sMSeUyzbPbZNnz?=
 =?us-ascii?Q?i6gJBQjj2NQfeok98Zxb8I2/Z5zOkWyorVTrD5eJANixff/xxwtGsmudXJtu?=
 =?us-ascii?Q?8hgwf9RCY1mUxFtbR8iujk2YYtb5PT9el6DOSpd2kddUHCouRJ0SLLhsXnqo?=
 =?us-ascii?Q?JA5sAozEi5//wf5LlUXq8O23JDNfR/nOheqbCIr5qFN/AGyU1ad0XjAR7/r+?=
 =?us-ascii?Q?WLT/y1lyjZ3IAcH3e1JWF+e89ajqaKnn2DdL9wdvnsOW3Cih8uoOCaf+3Wuw?=
 =?us-ascii?Q?GN2CG5TSVBWzu5IEnY8JcydLKHoE4nwYSqi+Er6Yo8/j9PD+J9Z00WVbJNQP?=
 =?us-ascii?Q?dgfhg8zCFcwVg/MvMjS2Pc5vCCerSvoYK2e/pwlufahnlXLbuU3aXXrQrXwH?=
 =?us-ascii?Q?ocOnsabeO7Zk9HtVn+uA+nlu93Pe5oYWtYhgWtgvy2u68KfQN0ASJ01ANJM1?=
 =?us-ascii?Q?pTW9UpubeA86acDhdxOB9erOA+lOF5WP4brjKEvE0B9YFEn7dpV7BjcVA+sz?=
 =?us-ascii?Q?YjLS1R4DHd1BENHhHT7k+4OsjIR4RXFYzqD4Xv9p1SYID4j3Z1spiSGU4rnV?=
 =?us-ascii?Q?zZsv28ecfAduNXqEttIyjBnhwCcOXTlVUgy5URNozQGSc4DEotGdg6ldzFlY?=
 =?us-ascii?Q?Lrb4jOa0awU2gO47Jq3kLSyvJSec4Kzz44Nl1iZ/g0Ax/An9K+Qp4f/F5xid?=
 =?us-ascii?Q?VYdcffYCn2EtY8tonxagQz87TWKkG2KN7RJTc2ZGdPSLCO8CjsH2DTVucvW+?=
 =?us-ascii?Q?l9PkP0caw5p5ObYZv+mw8oA/8fx/9+tFs1i1RZuvjtrC/Zs7YX43j6jyZPXf?=
 =?us-ascii?Q?rAymmW23WhHxm3qPmAhUPtkDmM2ruCIEPY0MtM53oHUcUwT0WlngEV9x/SKZ?=
 =?us-ascii?Q?6x74J3bKRccDLUGxqEwSBhdzPVUOPG6o7Nj3SGQFtFKwxS1zz8ZKJs5ggyJQ?=
 =?us-ascii?Q?KCurpz75NuPsemUlPADG7erI+DLgz+6iojThQZnv0R67P/7tQDHjVYFdEVcl?=
 =?us-ascii?Q?6djUHkK+1w0JMHskasU9Pv8GGMiW/Fn1nsCbVWCtBoTV1Wgy+aegkh94q1f3?=
 =?us-ascii?Q?ewofKVsGD2/N60uCxq02gVVTPiqjk0eUvR9wyIOml5JOezhFPb4ubpO5QPx8?=
 =?us-ascii?Q?64QdGqidyaUnDg5ARkaVCLrEv6NqRnGhyPRyoeEgg+VD7jVa7kZBMLJ0dMfI?=
 =?us-ascii?Q?TZr0fnLuP82mX9vmJds0TMB+i6dnmadcOM3oMoYWXSQzuBcs6d4wV1BNvckQ?=
 =?us-ascii?Q?rgaD4deEd6GgP3ezWS973dxiSz5Jvqg6ymp6i1QaByMPKRtyJsnr1RoNf7r/?=
 =?us-ascii?Q?z7+9V0D30OoxQa4WtYaEZ/aCXMxXbK7LNX0/15UwBgMcDfynynV+hrRQERhK?=
 =?us-ascii?Q?bK+haitpNgMe0eVVvO3zQnbGvkVCVn70?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB9072.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1zmY4AYULCN9r9D0PQV2ZQDucUSPjOXyAuyR496llEPHS4U+mxTo5Gq6Ec2Y?=
 =?us-ascii?Q?T3R5sHu1nrlgHNML9UPL50f+MbEQ5G0GNmlX7LID5w966X0JrITN4Y/hY+Qn?=
 =?us-ascii?Q?QNiyfQBZfEN5saHiDZ88NXtSggUECGObYHxYoGGysM2ioVC8kXdWz7+bjU0q?=
 =?us-ascii?Q?SZuepI0GcIECExBxnAaofybaEJCdQII6poHYm16407r8MqzOCWrbX+GhRJJa?=
 =?us-ascii?Q?zmL17r+kmI+ZXE6R6zaUhu4RsY3BYN63rHjy49tP1+b9eCIe3zBqbeUGVzlC?=
 =?us-ascii?Q?pOqv9eKA3ninkbu6JBOWcEQkycu0XK/os8XYxcfhhhO4fR1kpmw3+QLYNH1C?=
 =?us-ascii?Q?83GLMIhp9CJTzfksCLr49lh8NKewZ9ungjXSiO7oRVl8TYPAj12nqXCqhbns?=
 =?us-ascii?Q?67IaBkLYrDqi+thvxReUW4neEHWu+Rq6PoK76C8kZ/A58qkAeOf5PQM4B2lq?=
 =?us-ascii?Q?a1CD1FxuUHj/r9DJHtMv1Q2JfAUERWgl65fHsVpqJHNHLaOMzLa3WOCCpk/M?=
 =?us-ascii?Q?8HrvLlX8hoZjUREqbEGQhauGiTk02O81umcPD3leWb5NSjKSveQ82mYZdR3p?=
 =?us-ascii?Q?N110sBz1joeHdolXJUd1gWVb3/cSznzOQ4c2mTmKhedeKbfvKn6aMyOwxwXc?=
 =?us-ascii?Q?hHlAvTGuBsrXsAABDk+qBpZLmiTyLJ6oVA6izUm+WBcf/SQRjPyqfhEASH0Q?=
 =?us-ascii?Q?S4qCa8hNEZz1PBXWNLNN0nnoITEAUtxED8AD3jKhvU97y8nU9HXfFZzL3DcI?=
 =?us-ascii?Q?0IPOTEyA/Ueid+DGOp8y+JztvBhKvu9wmRidKKFgt88fQCLLZ8aY8MByauka?=
 =?us-ascii?Q?EKjKark3rfmmkujgYCHkxXSzvCksMCgu0Wir4caS8RlyNBR9DtznY0AmVq64?=
 =?us-ascii?Q?hF440zne18Ao298B4sxlCxhEZLnt0Z1cUFm2AezZs/2kX0Wm0g3URUcpjCm/?=
 =?us-ascii?Q?+az6DZRH6+MApXbpwC2HzB5VyyqikVTMh2xV9s8zx62bShsj9329O7/0UEpP?=
 =?us-ascii?Q?bJATX3X1y30THbodJMNM6s/VM9mHJljYWn1jLTVN+H3lMWalkkdZi+c9bzmo?=
 =?us-ascii?Q?RkDuAOAW4AVG8jsyv9C9fq250vWqXFBqxJWaQoyBBKUhMC/MpzFfmKIwNfpF?=
 =?us-ascii?Q?q4CHlEpJN0j0N3kqmNlU2xUOfXL4OQAeqroKmS7IdzJj0xTxkZKnefPcQsb7?=
 =?us-ascii?Q?eUV6fiS90x2BtBPnZ4k+VV1CVFB6HIYDgiF3w6J6av0mKu3wfmbUuyOgritL?=
 =?us-ascii?Q?Be/bE4+IGa4PUWx7uKUzON3GLatvB3TVqZF8++imRfqBJ57atwZSTe90BSJ3?=
 =?us-ascii?Q?gRjHtYy7kvi0iMr5BYa41ZkxValr1L3yIE7eCyaovBHgZf85o8QXIwF6w8bd?=
 =?us-ascii?Q?efuym8MdKxdhkimzk7+m1Dt9JoNonMGcRodzGZDxol+lNN4xQUf1Lm05Bw3b?=
 =?us-ascii?Q?eebd/PeMUbAc/USfEQJkVlcocxC5AOlKetc4FLwDWjHwERMLerHwQT1S/ZwH?=
 =?us-ascii?Q?UEszzwh5SRCW1noXg7q83TMBJOckfn68oqoxcn1VRkcSL8898vwbbIDO1i1Y?=
 =?us-ascii?Q?UaBHIZIm+8VdKGxtxOPTxNukeP4ejtUw/Zloqr6AHSedctUYbuAmVP65AaM3?=
 =?us-ascii?Q?xqR9i1iA6CakFc54P72dAKrdb9aiaVzI9JeW7lBD3RDLnBP3kzLyQOsba4HR?=
 =?us-ascii?Q?xEhAvAChfCvkOVMPFqfnPjO89LVAJOuULjYfqwrhzw1UhEJDX9NdVavnCnDq?=
 =?us-ascii?Q?E2mASLKYOA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c3e9036-632c-47c2-f5e0-08de4dcdc0ae
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 09:18:43.2973
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jb23eVlR9TKfixmPSh4V2JmVqQbboPiTs7IDT3VK1zFNyHdbXNTBHFCgKPdAGzezSxDuJeD/SZzAoJtzo9aa3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4335
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

A future change will remove device private pages from the physical
address space. This will mean that device private pages no longer have a
pfn.

This causes an issue for migrate_device_{pfns,range}() which take pfn
parameters because depending on of the device is MEMORY_DEVICE_PRIVATE
or MEMORY_DEVICE_COHERENT will effect how that parameter should be
interpreted.

A MIGRATE_PFN flag will be introduced that distinguishes between mpfns
that contain a pfn vs an offset into device private memory, we will take
advantage of that here.

Update migrate_device_{pfns,range}() to take a mpfn instead of pfn.

Update the users of migrate_device_{pfns,range}() to pass in an mpfn.

To support this change, update the
dpagemap_devmem_ops::populate_devmem_pfn() to instead return mpfns and
rename accordingly.

Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
---
v2: New to series
---
 drivers/gpu/drm/drm_pagemap.c          |  9 +++---
 drivers/gpu/drm/nouveau/nouveau_dmem.c |  5 +--
 drivers/gpu/drm/xe/xe_svm.c            |  9 +++---
 include/drm/drm_pagemap.h              |  8 ++---
 lib/test_hmm.c                         |  2 +-
 mm/migrate_device.c                    | 45 ++++++++++++++------------
 6 files changed, 41 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
index 5ddf395847ef..e4c73a9ce68b 100644
--- a/drivers/gpu/drm/drm_pagemap.c
+++ b/drivers/gpu/drm/drm_pagemap.c
@@ -337,7 +337,7 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
 
 	mmap_assert_locked(mm);
 
-	if (!ops->populate_devmem_pfn || !ops->copy_to_devmem ||
+	if (!ops->populate_devmem_mpfn || !ops->copy_to_devmem ||
 	    !ops->copy_to_ram)
 		return -EOPNOTSUPP;
 
@@ -390,7 +390,7 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
 		goto err_finalize;
 	}
 
-	err = ops->populate_devmem_pfn(devmem_allocation, npages, migrate.dst);
+	err = ops->populate_devmem_mpfn(devmem_allocation, npages, migrate.dst);
 	if (err)
 		goto err_finalize;
 
@@ -401,10 +401,9 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
 		goto err_finalize;
 
 	for (i = 0; i < npages; ++i) {
-		struct page *page = pfn_to_page(migrate.dst[i]);
+		struct page *page = migrate_pfn_to_page(migrate.dst[i]);
 
 		pages[i] = page;
-		migrate.dst[i] = migrate_pfn(migrate.dst[i]);
 		drm_pagemap_get_devmem_page(page, zdd);
 	}
 
@@ -575,7 +574,7 @@ int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation)
 	pagemap_addr = buf + (2 * sizeof(*src) * npages);
 	pages = buf + (2 * sizeof(*src) + sizeof(*pagemap_addr)) * npages;
 
-	err = ops->populate_devmem_pfn(devmem_allocation, npages, src);
+	err = ops->populate_devmem_mpfn(devmem_allocation, npages, src);
 	if (err)
 		goto err_free;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index a7edcdca9701..bd3f7102c3f9 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -483,8 +483,9 @@ nouveau_dmem_evict_chunk(struct nouveau_dmem_chunk *chunk)
 	dst_pfns = kvcalloc(npages, sizeof(*dst_pfns), GFP_KERNEL | __GFP_NOFAIL);
 	dma_info = kvcalloc(npages, sizeof(*dma_info), GFP_KERNEL | __GFP_NOFAIL);
 
-	migrate_device_range(src_pfns, chunk->pagemap.range.start >> PAGE_SHIFT,
-			npages);
+	migrate_device_range(src_pfns,
+			     migrate_pfn(chunk->pagemap.range.start >> PAGE_SHIFT),
+			     npages);
 
 	for (i = 0; i < npages; i++) {
 		if (src_pfns[i] & MIGRATE_PFN_MIGRATE) {
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 55c5a0eb82e1..260676b0d246 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -5,6 +5,7 @@
 
 #include <drm/drm_drv.h>
 
+#include <linux/migrate.h>
 #include "xe_bo.h"
 #include "xe_exec_queue_types.h"
 #include "xe_gt_stats.h"
@@ -681,8 +682,8 @@ static struct drm_buddy *vram_to_buddy(struct xe_vram_region *vram)
 	return &vram->ttm.mm;
 }
 
-static int xe_svm_populate_devmem_pfn(struct drm_pagemap_devmem *devmem_allocation,
-				      unsigned long npages, unsigned long *pfn)
+static int xe_svm_populate_devmem_mpfn(struct drm_pagemap_devmem *devmem_allocation,
+				       unsigned long npages, unsigned long *pfn)
 {
 	struct xe_bo *bo = to_xe_bo(devmem_allocation);
 	struct ttm_resource *res = bo->ttm.resource;
@@ -697,7 +698,7 @@ static int xe_svm_populate_devmem_pfn(struct drm_pagemap_devmem *devmem_allocati
 		int i;
 
 		for (i = 0; i < drm_buddy_block_size(buddy, block) >> PAGE_SHIFT; ++i)
-			pfn[j++] = block_pfn + i;
+			pfn[j++] = migrate_pfn(block_pfn + i);
 	}
 
 	return 0;
@@ -705,7 +706,7 @@ static int xe_svm_populate_devmem_pfn(struct drm_pagemap_devmem *devmem_allocati
 
 static const struct drm_pagemap_devmem_ops dpagemap_devmem_ops = {
 	.devmem_release = xe_svm_devmem_release,
-	.populate_devmem_pfn = xe_svm_populate_devmem_pfn,
+	.populate_devmem_mpfn = xe_svm_populate_devmem_mpfn,
 	.copy_to_devmem = xe_svm_copy_to_devmem,
 	.copy_to_ram = xe_svm_copy_to_ram,
 };
diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
index f6e7e234c089..0d1d083b778a 100644
--- a/include/drm/drm_pagemap.h
+++ b/include/drm/drm_pagemap.h
@@ -157,17 +157,17 @@ struct drm_pagemap_devmem_ops {
 	void (*devmem_release)(struct drm_pagemap_devmem *devmem_allocation);
 
 	/**
-	 * @populate_devmem_pfn: Populate device memory PFN (required for migration)
+	 * @populate_devmem_mpfn: Populate device memory PFN (required for migration)
 	 * @devmem_allocation: device memory allocation
 	 * @npages: Number of pages to populate
-	 * @pfn: Array of page frame numbers to populate
+	 * @mpfn: Array of migrate page frame numbers to populate
 	 *
 	 * Populate device memory page frame numbers (PFN).
 	 *
 	 * Return: 0 on success, a negative error code on failure.
 	 */
-	int (*populate_devmem_pfn)(struct drm_pagemap_devmem *devmem_allocation,
-				   unsigned long npages, unsigned long *pfn);
+	int (*populate_devmem_mpfn)(struct drm_pagemap_devmem *devmem_allocation,
+				    unsigned long npages, unsigned long *pfn);
 
 	/**
 	 * @copy_to_devmem: Copy to device memory (required for migration)
diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 7e5248404d00..a6ff292596f3 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -1389,7 +1389,7 @@ static void dmirror_device_evict_chunk(struct dmirror_chunk *chunk)
 	src_pfns = kvcalloc(npages, sizeof(*src_pfns), GFP_KERNEL | __GFP_NOFAIL);
 	dst_pfns = kvcalloc(npages, sizeof(*dst_pfns), GFP_KERNEL | __GFP_NOFAIL);
 
-	migrate_device_range(src_pfns, start_pfn, npages);
+	migrate_device_range(src_pfns, migrate_pfn(start_pfn), npages);
 	for (i = 0; i < npages; i++) {
 		struct page *dpage, *spage;
 
diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index 1a2067f830da..a2baaa2a81f9 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -1354,11 +1354,11 @@ void migrate_vma_finalize(struct migrate_vma *migrate)
 }
 EXPORT_SYMBOL(migrate_vma_finalize);
 
-static unsigned long migrate_device_pfn_lock(unsigned long pfn)
+static unsigned long migrate_device_pfn_lock(unsigned long mpfn)
 {
 	struct folio *folio;
 
-	folio = folio_get_nontail_page(pfn_to_page(pfn));
+	folio = folio_get_nontail_page(migrate_pfn_to_page(mpfn));
 	if (!folio)
 		return 0;
 
@@ -1367,13 +1367,14 @@ static unsigned long migrate_device_pfn_lock(unsigned long pfn)
 		return 0;
 	}
 
-	return migrate_pfn(pfn) | MIGRATE_PFN_MIGRATE;
+	return mpfn | MIGRATE_PFN_MIGRATE;
 }
 
 /**
  * migrate_device_range() - migrate device private pfns to normal memory.
- * @src_pfns: array large enough to hold migrating source device private pfns.
- * @start: starting pfn in the range to migrate.
+ * @src_mpfns: array large enough to hold migrating source device private
+ * migrate pfns.
+ * @start: starting migrate pfn in the range to migrate.
  * @npages: number of pages to migrate.
  *
  * migrate_vma_setup() is similar in concept to migrate_vma_setup() except that
@@ -1389,28 +1390,29 @@ static unsigned long migrate_device_pfn_lock(unsigned long pfn)
  * allocate destination pages and start copying data from the device to CPU
  * memory before calling migrate_device_pages().
  */
-int migrate_device_range(unsigned long *src_pfns, unsigned long start,
+int migrate_device_range(unsigned long *src_mpfns, unsigned long start,
 			unsigned long npages)
 {
-	unsigned long i, j, pfn;
+	unsigned long i, j, mpfn;
 
-	for (pfn = start, i = 0; i < npages; pfn++, i++) {
-		struct page *page = pfn_to_page(pfn);
+	for (mpfn = start, i = 0; i < npages; i++) {
+		struct page *page = migrate_pfn_to_page(mpfn);
 		struct folio *folio = page_folio(page);
 		unsigned int nr = 1;
 
-		src_pfns[i] = migrate_device_pfn_lock(pfn);
+		src_mpfns[i] = migrate_device_pfn_lock(mpfn);
 		nr = folio_nr_pages(folio);
 		if (nr > 1) {
-			src_pfns[i] |= MIGRATE_PFN_COMPOUND;
+			src_mpfns[i] |= MIGRATE_PFN_COMPOUND;
 			for (j = 1; j < nr; j++)
-				src_pfns[i+j] = 0;
+				src_mpfns[i+j] = 0;
 			i += j - 1;
-			pfn += j - 1;
+			mpfn += (j - 1) << MIGRATE_PFN_SHIFT;
 		}
+		mpfn += 1 << MIGRATE_PFN_SHIFT;
 	}
 
-	migrate_device_unmap(src_pfns, npages, NULL);
+	migrate_device_unmap(src_mpfns, npages, NULL);
 
 	return 0;
 }
@@ -1418,32 +1420,33 @@ EXPORT_SYMBOL(migrate_device_range);
 
 /**
  * migrate_device_pfns() - migrate device private pfns to normal memory.
- * @src_pfns: pre-popluated array of source device private pfns to migrate.
+ * @src_mpfns: pre-popluated array of source device private migrate pfns to
+ * migrate.
  * @npages: number of pages to migrate.
  *
  * Similar to migrate_device_range() but supports non-contiguous pre-popluated
  * array of device pages to migrate.
  */
-int migrate_device_pfns(unsigned long *src_pfns, unsigned long npages)
+int migrate_device_pfns(unsigned long *src_mpfns, unsigned long npages)
 {
 	unsigned long i, j;
 
 	for (i = 0; i < npages; i++) {
-		struct page *page = pfn_to_page(src_pfns[i]);
+		struct page *page = migrate_pfn_to_page(src_mpfns[i]);
 		struct folio *folio = page_folio(page);
 		unsigned int nr = 1;
 
-		src_pfns[i] = migrate_device_pfn_lock(src_pfns[i]);
+		src_mpfns[i] = migrate_device_pfn_lock(src_mpfns[i]);
 		nr = folio_nr_pages(folio);
 		if (nr > 1) {
-			src_pfns[i] |= MIGRATE_PFN_COMPOUND;
+			src_mpfns[i] |= MIGRATE_PFN_COMPOUND;
 			for (j = 1; j < nr; j++)
-				src_pfns[i+j] = 0;
+				src_mpfns[i+j] = 0;
 			i += j - 1;
 		}
 	}
 
-	migrate_device_unmap(src_pfns, npages, NULL);
+	migrate_device_unmap(src_mpfns, npages, NULL);
 
 	return 0;
 }
-- 
2.34.1


