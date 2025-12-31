Return-Path: <linuxppc-dev+bounces-15103-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B58ADCEB472
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Dec 2025 06:02:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dgyWD274Lz2ygD;
	Wed, 31 Dec 2025 16:02:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=40.93.194.63 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767155605;
	cv=pass; b=AMLfy6//8nFojP5eSyh0xtNdU4lDJIZd0gcn9vkpbv6deJN+TTxy+P9nrActiSXuAvAKIXlLc6k11iMNSvcVF99FQwo5SwKaA7wVgUsbaM+iEEWNVgfvXQUvulVZyn1l5w+FJBqV2jpnaOARdBWGrNmLm8kEgAOaVq6mup4ROqmyj2fiu2O8SiSQQ8vri9kjh8j41e3Iy4GwcfDVFqxJih9O1WWgmemOl39uinW/TU+H+NU+FDyNdkiHIiXNdH5ZbIKODZVVhdc5WPL75JMyprlF1GWSCQYx0ghnYGDVps5aDdhc1SXT9BUpk1KbeLDyYvjS6VlNnynQIiPg6hHVlQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767155605; c=relaxed/relaxed;
	bh=I9L0/67QVZPSe0VYtmONMbvA95dyeR985X9oOvLwB2o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MGrjZmFWMcLU4SunicfEtYEBKiMDKOorGRz8eDUJnJDeTR3iq9zjENrRj5FsSLKIZrPceDThwci2Qr4rTX5m+FTguGDRkyk/0zFt1ZAky6bKMD/oImxACleGMGPEQ4d3IkhDGKemXWp1nc78E/GDl0QY9rpk+4eKsISe1dZI/yyIfYftbLR32cojTbFhXi0ZHKyYK3svAEMEWC4uh74crcQfAZXvehSoXMvaaHAIosEVFtdTiBxTqeKaXrX1QIrZhVAu4o7oY5Pvij+H0ysbQqNIlmwsciF7i4rw7PrSyD4DxJBPYPMda/7Mi+BwI8arnmMhpLbI2pyv7RnOtloNHA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=BAxvmr02; dkim-atps=neutral; spf=pass (client-ip=40.93.194.63; helo=sn4pr0501cu005.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=BAxvmr02;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=40.93.194.63; helo=sn4pr0501cu005.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011063.outbound.protection.outlook.com [40.93.194.63])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dgxsd0CM8z2xP9
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Dec 2025 15:33:24 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IaywzIfdaIYqNIeDKWZNW7ONHcDfPAmZVMaAn8PzfWAfAbIGckgpZM4+8N5gPsYEjVFASpTbZR5I5KFgRigBlwcQRfakUH71DEabj/TLtQOL7F5PttNcg0eWZeE/vl7tYxq9qBlOYMI6FGsYzCPFelpCl3sj2D/AuoRQMsSb4uZBBdWEJ+l23MzBgizOZdt6QPQWUFaNov4yc5VM8BFSGH94YCqhWBhB56neBng8gLciqeCWFO1SqgcfI5fI8WBtNA/IMWkZXHhXFyMVaFhdZj565I9CTJoZj3EPRhhDvXA1OO3Q2K3tUYBv0J6os0Y5cndj1n/7fqpsJAdm4v69Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I9L0/67QVZPSe0VYtmONMbvA95dyeR985X9oOvLwB2o=;
 b=QcaOxuL6TeixJrSQSsx99gu6+8apDG/E0y8HN/7xEsrloSK+jkkoYe8sDCMaVJfBRNo9JR3kMSlFFVGq83iVoEXg1x4dv/5iXDrdi6Id+h4ehBtJkH9jguIjvO7uD0kaWuM34Fno9QI+9akRwludXUhmgEZoWmWBPMgQp6/U9bpzxCZUL9+U0+9g2xHh9ugGBI9PPa83gHs/w4PApiZTe60gNzokj28MzezRpS7HXo3nguGUZnaw8LfhW4UASx7hnHpTK/He1uzHkX9dt4MYbM5w0UaYo9FqFxLOKLTuc9q2gkNh1X2dgbSHOnghfYByW/KYA14jMGWewNYkVlPgDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I9L0/67QVZPSe0VYtmONMbvA95dyeR985X9oOvLwB2o=;
 b=BAxvmr02SV9GVxQTrfaOb1x7WszTQzw9sekJbfSqJUWVFsLj8z+9o74hYHk474xMaAwuFAuD5idmPT8WcFcpRpftjPXjo4DCw5sJuKliYCx//he4ZS3L7a6bS3jvEgKw0jyCYGLLODxhhR06Uuk+oujEJUh3tQdaxeeNJNbEa2Ekd7LF/MfzDsAlbdwG4WAbJd2zYfo1qPKmxQAOM4EQlGZpTEi4+pWsT6Q4jmVo6ftIsnoL4JV1G3go1A4lX15tTgSmfzvxCk5atU10BCsrL2mDMxtgYLGJS3dWdYgSPlBwPJz8Zp4YTXZfe0qWXMXhnOzNNxQvxNDTSxUt4mHpJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 DS7PR12MB6045.namprd12.prod.outlook.com (2603:10b6:8:86::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4; Wed, 31 Dec 2025 04:32:18 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9478.004; Wed, 31 Dec 2025
 04:32:18 +0000
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
Subject: [PATCH v1 1/8] mm/migrate_device: Add migrate PFN flag to track device private pages
Date: Wed, 31 Dec 2025 15:31:47 +1100
Message-Id: <20251231043154.42931-2-jniethe@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251231043154.42931-1-jniethe@nvidia.com>
References: <20251231043154.42931-1-jniethe@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0360.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::35) To DM4PR12MB9072.namprd12.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 1e54785b-1e37-48c6-b069-08de4825949d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6O/5xER6pG6SnaALUh0HcDAg2VemNHq95bSvB6PW8rmEPPD2hnDQY9cvyie1?=
 =?us-ascii?Q?62oXuBmYzydYhHd95khEL8cYE35Gxr8v8Um/wUpv+ld5++Zz3XvdGVRsZ1VC?=
 =?us-ascii?Q?vt6U+i0o0W1PaBNmIFhtSD1GejDjCJgU9CdUtpe0B+cmjJYwPD1fOeOsvrcS?=
 =?us-ascii?Q?OklxXg+u2k9Uj84LajxLV2wnqKjVDKENpOS6jqlwFOIOMyBc81SdaM1JrqWe?=
 =?us-ascii?Q?+u39n1VOfKMLSOxxjCJsS1pejkNDpSo3Ckkvj8XkUuAAxXtGpfKpouYWduES?=
 =?us-ascii?Q?nzH3imSsUg+MSLlD/qwIHok/a5mdEp8nB9KUSmMWS8iupNsSdUNYGFuGYNYb?=
 =?us-ascii?Q?weJ1n3e6u15NE2cyCiMCv5s4fciTjQgxhDAMyBeTbVfafOUDdWVxSF+2t2AR?=
 =?us-ascii?Q?VAW8Fo+M7cql3caZfUO1oBU8CGJZqqlRNG4oOPFXoXiDpt7WARSGcOWO0288?=
 =?us-ascii?Q?xZF9mpj2VdWWQCWfaHDkmpUJejdQVhkNSTYD9m2/tXBNUyApyg1XkJ45eddP?=
 =?us-ascii?Q?TAM97oY2TZisDCDgfqZVRAvdYI9/0QRdFQXM5e1RBNGGQTxb13jPFSeY5MZ6?=
 =?us-ascii?Q?6XtIn3mbVY8pC11ArdlWEE3/dhKZPSzAcsUNdZ3NdAQX8hcjzG7ksupD4BZl?=
 =?us-ascii?Q?UhjJotgfiauHDCtlZ+bpEOtZJkawgRJzsxP7wc5swDdcFASahtKzpB9hgYgw?=
 =?us-ascii?Q?NfgA2erDjBLcu6bJEIDg0meyk0DVOkC8pha0fj7YhZryi67I+D3Vbx2ecK1L?=
 =?us-ascii?Q?2ZecOcD4snrevO++lriTmpvYToehHFHWnX6g0KTzQHDNEDimc5+w+zmQY+B6?=
 =?us-ascii?Q?EramS2Y44iAVvprU4Cw7qPbiMsARI8qgYRuq9QVwS9qAfXRyDMZ+SVootAO5?=
 =?us-ascii?Q?mgjFP0fAsgTcmkCb2SUr0c82qYasPMSKM7rONTnWZdowPD14/s1j3Rd3/U/V?=
 =?us-ascii?Q?F5sQU/5fVewgifPvZdFqzfaN0PfoLCxilIU3oqHeYCGljGIK7itNi7lp5pdC?=
 =?us-ascii?Q?YlB1twPy4S0jwrH4we0Nnw+iTklDj4BgkXwcFtgZCOf0LquYZRujEExXONAr?=
 =?us-ascii?Q?uD4VlwGUC/hI+rkIPWlqMOc1/n4NRG3JJmS3MRCCpk54N3O74fbLS0ccuCMh?=
 =?us-ascii?Q?opS78LLrCg1ePeNe20VXo/ng38WRrLB9iEzjQWw2n75zBCxMFQPF1dwoBYZc?=
 =?us-ascii?Q?nHLskoJodaAO+MRbu4ZVGrc2xWIYsubIB9dSRVdBhuHeduFT8Y0ge3WjY4iE?=
 =?us-ascii?Q?IHhA7mfHnLOFA2KIGnifDtMjNKcUnAJWgFiUjKmC55H3CpQG10qECRWLLrOd?=
 =?us-ascii?Q?CgQz6KSM6nnZE1/ktrwbsyXebuXaKAj2jCck9v3/dESInjL6Pss0OLctQvjV?=
 =?us-ascii?Q?aYY0mm8fY9pATf8OPbFKDLy3MhTS38XBj8M2WIPi7/ZDpLNd0ICafqN6DlQ/?=
 =?us-ascii?Q?kuq0oz5riGHTDBowLO/mfZAwLc0A1oEg?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB9072.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oqaVoYVxS78UjUL75Fcc2Iw8u+SUeJlyaJDYp5xrdQ5fWL0Ws5NJ5VIsyruB?=
 =?us-ascii?Q?Vox9RmQQ/J0Lp6w81l7qAgfuL/vmMGI2VX52Q5p2NfqkiHCK+GwmokAfbZHg?=
 =?us-ascii?Q?zPA372Mt0j8he/nEpMqnMC1IDXy4efqoAzJjlwqdsmImeOkHTPoEayagyB9m?=
 =?us-ascii?Q?SNnzTL9RqaJiLYLBo/KO+GI86KSf1uHzc3Mz5CsoGBhpMn8fdcqCt0c3r2/4?=
 =?us-ascii?Q?AThJDsNq2f8t2S2KzLwdTZ75osOMCuzrCshJLBQ0OCpRHx2bIxYazhHxuhWe?=
 =?us-ascii?Q?F18q6Gadcb/bgAPk6TtMP1sjsB+u7/5VHkzlN7sRdravLtwl1n/V0wRCoGPs?=
 =?us-ascii?Q?Tw4ZNHd5xhsBBuvhP4jhuvC7r8NRiOiQoN6oIBlfDBBgHj0UoThNBOm32njz?=
 =?us-ascii?Q?3PQHBzGEnrxfWwV9+PoaE4G8k5n9X0H3f8y05TlT7keD6u+Y+jhcHwLwWEWX?=
 =?us-ascii?Q?bEKC4qOFVnx8fHDv13Ue1wKFq0dXPOqUVMG22Jm48kbDEu6SYq6NNFP6r77i?=
 =?us-ascii?Q?lvtwkr/7OKay5iAxeTt95XxzSw76R+3cW1k0xjLgQjPzL9ann4o4GfPsX6no?=
 =?us-ascii?Q?pvwagpkff82KIS0+xfpTCXuAkwoeqAwwW1iF2rPlICOEwn7iGTqKpxzjGRgE?=
 =?us-ascii?Q?ZHy4A9j6kmQzux1zc9kfnTnAlwRVmZk7fxypWLQMrnkSNWl4blcGmPcK8H6v?=
 =?us-ascii?Q?pby0AyH0qRG0ZMige3Z9jrEIHC33W2UnSjzAH3uhpaTrzpnPmx16VwKdIJOS?=
 =?us-ascii?Q?ySzox+c3JHSy8QhKLzvWQWr9BT9nfoAYxgQTVlvYXlgO0xWx3G4IRVtAmWHi?=
 =?us-ascii?Q?Ewx+kGNuxOKreJ7C8jVD+M1sK5q2+XsQnNSb1zxISn2kW9UHrvQoU2j6TmlY?=
 =?us-ascii?Q?+TBFHO5oCYQDFS8neWrqocf6LjxQqYlbQV40wT1j/bZ2un/zZiVdOh4V+m0H?=
 =?us-ascii?Q?hmCsw5+yTb7cluX1Cp6jIyO/f3IXDRzvxOKNfNxEdumalerl9o0lMi6KBN0J?=
 =?us-ascii?Q?ogquKargqO8bE5MH7wvDfnOjgI9cI+HJE4LsXFc85WYmfiJD1/bGusxRdeXB?=
 =?us-ascii?Q?jx32UR/q467qh2lWz8yraBXz6olXrnV3+EngInuF3VdaPWjZUJLCLNKtasla?=
 =?us-ascii?Q?k/j50KIzejrMlLPWWz3tigDS+9CmxOdI70JH8mz7xBFYT4ilwcba43BfCv7P?=
 =?us-ascii?Q?vDr+YR3/TwA50gIsJzmKu3sysQcwxrCKgQK8eNUU0zu6ospsylleP1Qg4VHE?=
 =?us-ascii?Q?SfGmStBL1Cn2Wi+GBjhDcAt/PjiR+rpgBB4VdFytve8HHbApzwIKyCAIDBNv?=
 =?us-ascii?Q?wiXlHYsTFgOJ+Sg6GdPdeRHfT8YyjgjatC1qy0yWNE9UKpCmyIlFczdPSr6m?=
 =?us-ascii?Q?1vRk6G0uMgzrfSvwZuEypN4KXvEMHlgKWzzjy4KxueOhM/aML0cVd+vFj0xy?=
 =?us-ascii?Q?rh84Rhd7rygxe5nzyBpWxLCqWCQ+ElcoCd12eTgGxAkRpB77445aF8h1wE9A?=
 =?us-ascii?Q?OCYxbdyBSx+749fpA0YmL/bdwX15w5+k61Dn417G6Qq1Rs+VQX0SmDlRBycr?=
 =?us-ascii?Q?rQ1+rv8K05X/H1Gah6JxyR60dKc/jPCxg058HUDmSZiGzf0eB7ossYd0UmtB?=
 =?us-ascii?Q?DiDOJ8uvcPuRXyVhDs/1GwG1/pO0QoutyDJGNGmVlcbduiC4MQ6TwVyXKiLR?=
 =?us-ascii?Q?QPriPqDZ3SG10+0e4HGn19CX542Fwv6xwmmR+Tg3483FG3m2PIL7RBz8U9ny?=
 =?us-ascii?Q?gcPy+Y05KA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e54785b-1e37-48c6-b069-08de4825949d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 04:32:18.1169
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uu4VXig+kOevU3hGfSnq0HFBfXYyfJiNZq1ZYKOOOd9Vjwoyls/cQ/6wzcc1QpH2Ga3Xi1BLwnA63U88aTDyfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6045
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

A future change will remove device private pages from the physical
address space. This will mean that device private pages no longer have
normal PFN and must be handled separately.

Prepare for this by adding a MIGRATE_PFN_DEVICE flag to indicate
that a migrate pfn contains a PFN for a device private page.

Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
Signed-off-by: Alistair Popple <apopple@nvidia.com>

---
v1:
- Update for HMM huge page support
- Update existing drivers to use MIGRATE_PFN_DEVICE
---
 arch/powerpc/kvm/book3s_hv_uvmem.c       |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  3 ++-
 drivers/gpu/drm/drm_pagemap.c            |  2 +-
 drivers/gpu/drm/nouveau/nouveau_dmem.c   |  2 +-
 include/linux/migrate.h                  |  1 +
 lib/test_hmm.c                           |  4 ++--
 mm/migrate_device.c                      | 11 ++++++++---
 7 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
index e5000bef90f2..dac5d6454920 100644
--- a/arch/powerpc/kvm/book3s_hv_uvmem.c
+++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
@@ -784,7 +784,7 @@ static int kvmppc_svm_page_in(struct vm_area_struct *vma,
 		}
 	}
 
-	*mig.dst = migrate_pfn(page_to_pfn(dpage));
+	*mig.dst = migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_DEVICE;
 	migrate_vma_pages(&mig);
 out_finalize:
 	migrate_vma_finalize(&mig);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index af53e796ea1b..0257c6e7f680 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -303,7 +303,8 @@ svm_migrate_copy_to_vram(struct kfd_node *node, struct svm_range *prange,
 			dst[i] = cursor.start + (j << PAGE_SHIFT);
 			migrate->dst[i] = svm_migrate_addr_to_pfn(adev, dst[i]);
 			svm_migrate_get_vram_page(prange, migrate->dst[i]);
-			migrate->dst[i] = migrate_pfn(migrate->dst[i]);
+			migrate->dst[i] = migrate_pfn(migrate->dst[i]) |
+					  MIGRATE_PFN_DEVICE;
 			mpages++;
 		}
 		spage = migrate_pfn_to_page(migrate->src[i]);
diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
index 37d7cfbbb3e8..0c756d73419f 100644
--- a/drivers/gpu/drm/drm_pagemap.c
+++ b/drivers/gpu/drm/drm_pagemap.c
@@ -404,7 +404,7 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
 		struct page *page = pfn_to_page(migrate.dst[i]);
 
 		pages[i] = page;
-		migrate.dst[i] = migrate_pfn(migrate.dst[i]);
+		migrate.dst[i] = migrate_pfn(migrate.dst[i]) | MIGRATE_PFN_DEVICE;
 		drm_pagemap_get_devmem_page(page, zdd);
 	}
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index 58071652679d..2bd80c6f5bcd 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -766,7 +766,7 @@ static unsigned long nouveau_dmem_migrate_copy_one(struct nouveau_drm *drm,
 		((paddr >> PAGE_SHIFT) << NVIF_VMM_PFNMAP_V0_ADDR_SHIFT);
 	if (src & MIGRATE_PFN_WRITE)
 		*pfn |= NVIF_VMM_PFNMAP_V0_W;
-	mpfn = migrate_pfn(page_to_pfn(dpage));
+	mpfn = migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_DEVICE;
 	if (folio_order(page_folio(dpage)))
 		mpfn |= MIGRATE_PFN_COMPOUND;
 	return mpfn;
diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index 26ca00c325d9..52f65cd5c932 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -126,6 +126,7 @@ static inline int migrate_misplaced_folio(struct folio *folio, int node)
 #define MIGRATE_PFN_MIGRATE	(1UL << 1)
 #define MIGRATE_PFN_WRITE	(1UL << 3)
 #define MIGRATE_PFN_COMPOUND	(1UL << 4)
+#define MIGRATE_PFN_DEVICE	(1UL << 5)
 #define MIGRATE_PFN_SHIFT	6
 
 static inline struct page *migrate_pfn_to_page(unsigned long mpfn)
diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 8af169d3873a..19681904a666 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -727,7 +727,7 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
 				rpage = BACKING_PAGE(dpage);
 				rpage->zone_device_data = dmirror;
 
-				*dst = migrate_pfn(page_to_pfn(dpage)) | write;
+				*dst = migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_DEVICE | write;
 				src_page = pfn_to_page(spfn + i);
 
 				if (spage)
@@ -754,7 +754,7 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
 		pr_debug("migrating from sys to dev pfn src: 0x%lx pfn dst: 0x%lx\n",
 			 page_to_pfn(spage), page_to_pfn(dpage));
 
-		*dst = migrate_pfn(page_to_pfn(dpage)) | write;
+		*dst = migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_DEVICE | write;
 
 		if (is_large) {
 			int i;
diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index 23379663b1e1..5d108ddf1a97 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -199,6 +199,7 @@ static int migrate_vma_collect_huge_pmd(pmd_t *pmdp, unsigned long start,
 		(migrate->flags & MIGRATE_VMA_SELECT_COMPOUND) &&
 		(IS_ALIGNED(start, HPAGE_PMD_SIZE) &&
 		 IS_ALIGNED(end, HPAGE_PMD_SIZE))) {
+		unsigned long device_private = 0;
 
 		struct page_vma_mapped_walk pvmw = {
 			.ptl = ptl,
@@ -208,10 +209,13 @@ static int migrate_vma_collect_huge_pmd(pmd_t *pmdp, unsigned long start,
 		};
 
 		unsigned long pfn = page_to_pfn(folio_page(folio, 0));
+		if (folio_is_device_private(folio))
+			device_private = MIGRATE_PFN_DEVICE;
 
 		migrate->src[migrate->npages] = migrate_pfn(pfn) | write
 						| MIGRATE_PFN_MIGRATE
-						| MIGRATE_PFN_COMPOUND;
+						| MIGRATE_PFN_COMPOUND
+						| device_private;
 		migrate->dst[migrate->npages++] = 0;
 		migrate->cpages++;
 		ret = set_pmd_migration_entry(&pvmw, folio_page(folio, 0));
@@ -329,7 +333,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 			}
 
 			mpfn = migrate_pfn(page_to_pfn(page)) |
-					MIGRATE_PFN_MIGRATE;
+					MIGRATE_PFN_MIGRATE |
+					MIGRATE_PFN_DEVICE;
 			if (softleaf_is_device_private_write(entry))
 				mpfn |= MIGRATE_PFN_WRITE;
 		} else {
@@ -1368,7 +1373,7 @@ static unsigned long migrate_device_pfn_lock(unsigned long pfn)
 		return 0;
 	}
 
-	return migrate_pfn(pfn) | MIGRATE_PFN_MIGRATE;
+	return migrate_pfn(pfn) | MIGRATE_PFN_MIGRATE | MIGRATE_PFN_DEVICE;
 }
 
 /**
-- 
2.34.1


