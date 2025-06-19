Return-Path: <linuxppc-dev+bounces-9542-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65AF1AE00D1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jun 2025 11:00:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bNF1253Mnz3bm7;
	Thu, 19 Jun 2025 18:59:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2408::601" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750323590;
	cv=pass; b=Ywyi3IDzfO/n+1YuOtMJSUJRBBLrquvNtv5jVpwdxMBpcf+TzX04aZBPYMwnwB3kY9VmFrz23vdQG8kM5+xjhjWeKyhmBx/uJ9w8wMWYWxajWQ5FIUWVM75fkxpPqZPcBjhh5TiMWWR02FJT6IXpJf1nliRUcBrIF9+Lt/VILsEq6Irio36YVUiZveamiYhurV8flRzviXgtuzmB08r1ifYw7X7u+UrIUJCb2JHE2/bvahhjhrU1BBRsg2ibyVvzB8zby3brJn8j1Zcx0yod5TsfCQ2zjIkKewLK6nzSNz+Wj71Jdy92KOFZB68txAVGMtDxPFUcqmhCIF+njA6AcA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750323590; c=relaxed/relaxed;
	bh=5RhlgsKm/HCcDnF2PlGZRwe6SDVLs+gcNL5Sum8GV6E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QOfcypBpt49h84+304T108X4fnHV0M6L4bZBu3nK837ikrWhUR0t9AixYtjCvCERxxxG34piuT3vnKQRuCUnBZL6X7oJBf7433C8bZRdG7GimLl5MZ+kGRpT1Dp07+XQpNCyTIcF6nAgqyIkXFsHmGKaHRAXoucl3v5rXWR7LEbmUdPvZRYAIl/HNahA5hwVuBidm+Y7rByQy5wmRIgxMlmzvWV1NCOlViv3KGdjF8ouKKzpLVwt96t4p6EPF/y/l0lqixZNjJCv4mxk4Qg8H/JOzyYZW/5KNtSLWvtB3WGv2awAiLH6MY57o92tNWRWBQmEGXgyPlGPxGnfDk0b9w==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=AqqY5MCq; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2408::601; helo=nam04-bn8-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=AqqY5MCq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: No valid SPF record for included domain: 2.A.0.1.0.1.1.1.F.4.0.3.2.4.0.8.0.0.0.0.0.0.0.0.0.0.0.0.0.6.0.1._ip.nam04-bn8-obe.outbound.protection.outlook.com._ehlo.nvidia.com._spf.vali.email: include:%{i}._ip.%{h}._ehlo.%{d}._spf.vali.email) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2408::601; helo=nam04-bn8-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:2408::601])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bNF113zgSz3bkg
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jun 2025 18:59:49 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AtzL8EezWQ19jBf96MRmpnDap62BkBsvpHUpNvlGPs3Wh85mfCG76yZKVqRknj3obtOvgJXVVI23ywWeVDviYx3i4yK9QIyghMhMt+L+S/sm9xqF2Pe/bhc2rjaApGPdlCNMOdIP4Qj/K2r0OaStAIVqJDNzNLlwilJ/wdRMOL6Z7z2vWY/AiXnpkcDH9zn8vW1cbHRmHhHZtaFVdLNYjBzRdGaxmazxdNRadbyHcCtuQK/YPxzyphUv44x0fAQVdQiw0+c25ytxg1k1ImIORhX19PUrZ6xXtncEBFeVVtDvFC4xp36jI70tM/e2rWGSbVEJ+Ibwsq7Mile7E5uZZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5RhlgsKm/HCcDnF2PlGZRwe6SDVLs+gcNL5Sum8GV6E=;
 b=iqEpjSa3SReyd/8BiiWx9GLfPKvflJsIUd4cwP0Lfx+7iHTWpbCwfPHIgSyzhw2tCBlwwHtq3967JT5UnsOOnUfKxdaDKeji4w3jn44uwspFKXTUnCvxrPLhfMrGvHr3AEr5uY/NfQpHSHiVK12nZWFxPb9pEaCtFT1ah6WvuRBwvF9HaSZDGrxRf6iNKp2PFBxHppyP5HOCp4y1wSabSvizQkUt6tyhzQh4iMcj5oN52Szy/PZVJTy6LoZxZD/DtODiX0hwkoVj8qbU3+MNI23ASp+WOWt9IXjRV4wO6JIpp9Vqh/l72ZY/y/M0A+izZr6WzrJERSG+ZEUN+XjDwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5RhlgsKm/HCcDnF2PlGZRwe6SDVLs+gcNL5Sum8GV6E=;
 b=AqqY5MCqJW4w6geOyT4zfcsr7ZbNMpkXM6QLhzwVUsyyfmi7ob4XhTMWjsg/hGdL7FNWpODrFIoTdTUB1vN5MRJTzIn9GlpHXpm63jvHKTofVVsAzqBdTL3vd4Kmr9aPwOOLDdHjZFUVWHRBe1wRBKeL3xCZByKuMgeDS/7rlzhlGAeauYI5G2xYnCcjIEOOzyXcutteezZR1ppfQjQR2CY7aefpA/+Jp6/KNKQgviMl0WlG4NtJJW7meMe4fDuCdOujI7JCPvq3muodBvxRcsRUKJJysPIT1zjQZtbwMagS4/mt8ANeL/2HdRfaVk2VtT/vmgRrG9+LGv9VB9IZxA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY8PR12MB7705.namprd12.prod.outlook.com (2603:10b6:930:84::9)
 by SN7PR12MB7956.namprd12.prod.outlook.com (2603:10b6:806:328::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.25; Thu, 19 Jun
 2025 08:59:03 +0000
Received: from CY8PR12MB7705.namprd12.prod.outlook.com
 ([fe80::4b06:5351:3db4:95f6]) by CY8PR12MB7705.namprd12.prod.outlook.com
 ([fe80::4b06:5351:3db4:95f6%5]) with mapi id 15.20.8835.026; Thu, 19 Jun 2025
 08:59:03 +0000
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
	m.szyprowski@samsung.com,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: [PATCH v3 09/14] powerpc: Remove checks for devmap pages and PMDs/PUDs
Date: Thu, 19 Jun 2025 18:58:01 +1000
Message-ID: <31f63cc8dd518f9e2ec300681fe302eb4adf49b4.1750323463.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.176965585864cb8d2cf41464b44dcc0471e643a0.1750323463.git-series.apopple@nvidia.com>
References: <cover.176965585864cb8d2cf41464b44dcc0471e643a0.1750323463.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SYBPR01CA0128.ausprd01.prod.outlook.com
 (2603:10c6:10:5::20) To CY8PR12MB7705.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CY8PR12MB7705:EE_|SN7PR12MB7956:EE_
X-MS-Office365-Filtering-Correlation-Id: fa473b6a-30bc-4e44-4602-08ddaf0f89d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PN8bXvcJm8auI0BPchaSyh7srKmq2iHGYMYrxu+Elk6sB3GFK6U8QiwjXKti?=
 =?us-ascii?Q?cM4ghbj5gKn33/dBMHl4dGNAsQkfq6ZI0NUxo3epfEzKPvn4Lq+m8c5BRywP?=
 =?us-ascii?Q?0nPqmqxdpN7vU9yIlQEXj+kyI7L9e3nV/PcXN998jm0Iva8/UVogJ9C6qSZX?=
 =?us-ascii?Q?4wf1EZAD1RMUdCuqH4WTYgUj2neOtMfDYuKXrQJa8yhr1pN4T3QhWizxyeaD?=
 =?us-ascii?Q?iQlh54k4DKHDl+GYogxua5ER45xgwkXPWELKSR/ujUsm75z4atAByxCQ5spR?=
 =?us-ascii?Q?M/OLaRilzgcEV/ghaC5LybD1HR9nG63I2qN04E0FNG/tC0miZJhhHhbg/gNh?=
 =?us-ascii?Q?ujEU/Wbc3obb2U2Idv/QeMe6A1hFKy3ODMn9N9xTtaYJ4uTtLBRj383cJRRT?=
 =?us-ascii?Q?pozT0Z+2UPD2Qh9bf8YFRyW5hw2fC4NbpGxG2jWxnBlMP5ECHMdrCPpl/Uj9?=
 =?us-ascii?Q?l/ugt/5+x477tNxj2+Jj7NycGWv0VEALTz7oEauI9W0cjmO+4VasSjoVz/Ai?=
 =?us-ascii?Q?ZkEN3PIhRwLZN1B7YULvMxzWkX8E8tOzSpU2hAmhn/Ti9jpC0S7hG1wBOxv6?=
 =?us-ascii?Q?kOrvz8yxB6khVhIrawFRNJGhdQzlGQpgv2yv72PigJPKzqGcA149U8krK3az?=
 =?us-ascii?Q?zD1RmdiMBJ7PlvZHXIS7a1Tg703pju7A9aK17P6R94GwOzxudtnFhRZnNLk6?=
 =?us-ascii?Q?5x1C/V0tMDZYLZKwzpCn/TsqQK34e1/KKcWK8LwKIVBTsIzljCD1gjdi0D4q?=
 =?us-ascii?Q?melIIVJTbqnXzF5IduKTAitznfyjR8bkpQaQyGR8WL22MDqprnUAZ5hFjrWE?=
 =?us-ascii?Q?TCRa2rJuu9IUs9DbVSIzrKxs/Ts4uhsA7f1hYvasKu9rdkohOL+MVQQnrKld?=
 =?us-ascii?Q?zaSLAgbDuKNsYnoEtKzF10nSYwyQOuoJ8Bd5Gki8Zsjy+kxhOQXP2Y1r1Duj?=
 =?us-ascii?Q?ihea8jvBi7ssRnpPYF0qVE4SEem8pRQ6E+qENSwmpe/CryqM7v2qGtYsqynk?=
 =?us-ascii?Q?hr7Mhk3/huBuDpuTb7hp8S2WJS9MfCQzR59W1wGM7mT2xgfdEo5+cZ1l/Il8?=
 =?us-ascii?Q?xuiXbGFsRStpx31bneHxsYziwR8ZaDKoRwC6YvpnknLITajT4pMY84y6lmhM?=
 =?us-ascii?Q?bexy09EZ9b8Gkb7cdeEUifKr2o28NVxuZjLSNmEOZKa99pc5O9rQQB/4UOlg?=
 =?us-ascii?Q?u90ibzoyIYg0Ip6kQEbJA5CyyMhTFx6cN0VTc9BxPgySEVdrc846YYF5hTZ8?=
 =?us-ascii?Q?RIGuGYTp34+iU3ImTH4TjQi4bJJ/kPHwmUQ8jDpegQlSNOBbX4BViprY0Uou?=
 =?us-ascii?Q?lYEYD2+kF+uikibYYUwRw6KnvmsJCiOndc24yu2wK2gyTH+Ck0uUcHvYrdkk?=
 =?us-ascii?Q?EhWn+EKVEQ4JUNsxNDDWlsgjWDNgCZVjcM/2dJ88nRvwkl8LLg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7705.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6Uag2d4iNst98Qjvqt+yFtwsYoBjFIWW6iZlD2i49L/m7d4GgEUyaTcYDtys?=
 =?us-ascii?Q?1z9tbrv3oIOkTTbkcmmcwoXqCLEuofpdbpnY7UCosibGq1S6PMSyymIPye2W?=
 =?us-ascii?Q?Fp1e8fKFM8OdUycMjwjwuwOSbt3tAKf7PJyH6ikeK3Z0YOhrny9t1CtX0BJC?=
 =?us-ascii?Q?wuzFt8/Q1Juco3XlDvwSIYF+Yp761TbAodkrnSaFdSLGVmWf0zi0TKq6Si0v?=
 =?us-ascii?Q?BDWHIobYVEkNwapu2X2NtNe8Anmol1FVWuL0kVloGthMV9h5Y2kodDymnL6y?=
 =?us-ascii?Q?2q7cUnFuEQLU9tr6nW6Nb9vdrgkMssvuKhF4+puaa8FosLiMzS/BegnGfsjv?=
 =?us-ascii?Q?7/r5AnXRAaQthw3a7/OaLkpMHHlCElyrwnpVxHCFUTaPH5yjmK3rK0rDjPbS?=
 =?us-ascii?Q?r3c0Ia1WpPB7UiP9YPFpvJAer7jkdC1ZHAmFWjlyfs1FQjDQcPSo2Xg56UB9?=
 =?us-ascii?Q?Q31V3CwmsARaESIyQJoGR0pyq3cmL1vN6Ory496aTZyaSt7ytyNRKIb4gvIQ?=
 =?us-ascii?Q?TyTvEDstlFlL0nQFXocyPLBuEHSE0PVHQpi97U+prWTLgmda6QdTWkeTkeQb?=
 =?us-ascii?Q?3JGh8XcKhGBfH+suhpXv+mtKTPscJ8zMQ6kk9mYvfUTKZOhEkpn06JSsCros?=
 =?us-ascii?Q?oPfQSEBnWzSMWc5kN8RxAIgJC9uZKZGu7zyAM7vobGEIHikb0ck5c/j8ufMW?=
 =?us-ascii?Q?X+uaIkfg9y21z0w/+IaTzbr/V3XejCf4UK6NCsQqG3wL0mv6DWUnnYC/OI/4?=
 =?us-ascii?Q?1EfZ3zHbPlspyy80jKQqKHBtcKn5TlrsqOhU1+aKWS+VEWmTkKIrvbi//KaK?=
 =?us-ascii?Q?Jsa6GV4yj3IkLGlQtpg5HkcV8MGCJR/omYK1wwyRZ2O5h7fyu2i/gqbK9wph?=
 =?us-ascii?Q?9bEhCffM9onJsJg9qI52AoJ4Xqd34vBvHqP46xmy7ZW3rSBdAieW89tlZS8H?=
 =?us-ascii?Q?js9dIVnN/9dVEaZtNKZpFAdwS9AOOrCeGPgyYV8kM/AU+xy9vVcZaiCZ+oEE?=
 =?us-ascii?Q?8p3HJEGx8IswUwep+KyxHZB/a0o6s94KjlPRbpS+GLhH7M3odDEo8cyAnbr9?=
 =?us-ascii?Q?NtqmcV5k4FHDgDwtSYb+kn5LVmccYgvTtUyV9BGnGoPD+vfm/RkQJrOSQ8Hx?=
 =?us-ascii?Q?8OCe9nBnxCjwuPYjugUt2koDKWDXjJShTcOrb5Xb9lfqPszt9oz36xeK77Af?=
 =?us-ascii?Q?GPdWphAEjgrxrva1YWyODT/QTeB/2aKvjSJmsnwbgQS95aro1kdXe1YN1Qh9?=
 =?us-ascii?Q?ItJXRrXLMdiBHC3yPxSFoAyCG02/Ymx/rq6QdRlLkIvzJLAfFU1HnEClKOdE?=
 =?us-ascii?Q?V+LasEXvQFMKI8FNUilaqAHOXM+e/Fifgi6cbOBGtVgPToqFPxVaekMKtNd/?=
 =?us-ascii?Q?pafMXSKgxF3nE0PuKomijYygI0FBD1fElsQ+Z/JFA+Uu7q4mBQr5++mQyXEO?=
 =?us-ascii?Q?ItZqwhq3JgHHerhUxgea991Y28vT6oh3tHwruSsD19KDhrOgn/GyxF1hIEwS?=
 =?us-ascii?Q?fO2FR8dgl4BWH/qd362Xqbypu6iwSxBsUv4YpcDrTD0QEmHUZsCkzMCA/7Ub?=
 =?us-ascii?Q?wlvs0OXVsBwmAT+iXM++ndkLZ/Q2w0Z0o6rOTBzo?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa473b6a-30bc-4e44-4602-08ddaf0f89d6
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7705.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 08:59:03.1730
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rJed4KXKRZRbvrhGgKHXObuKQDtxaWg9OpTPanp90oHEw9L58aXaTXMnKOmlwEKwQdWA5Lp9NRgiqtFIvVQZKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7956
X-Spam-Status: No, score=-2.1 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FORGED_SPF_HELO,SPF_HELO_PASS,T_SPF_TEMPERROR autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

PFN_DEV no longer exists. This means no devmap PMDs or PUDs will be
created, so checking for them is redundant. Instead mappings of pages that
would have previously returned true for pXd_devmap() will return true for
pXd_trans_huge()

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Acked-by: David Hildenbrand <david@redhat.com>
---
 arch/powerpc/mm/book3s64/hash_hugepage.c |  2 +-
 arch/powerpc/mm/book3s64/hash_pgtable.c  |  3 +--
 arch/powerpc/mm/book3s64/hugetlbpage.c   |  2 +-
 arch/powerpc/mm/book3s64/pgtable.c       | 10 ++++------
 arch/powerpc/mm/book3s64/radix_pgtable.c |  5 ++---
 arch/powerpc/mm/pgtable.c                |  2 +-
 6 files changed, 10 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/hash_hugepage.c b/arch/powerpc/mm/book3s64/hash_hugepage.c
index 15d6f3e..cdfd4fe 100644
--- a/arch/powerpc/mm/book3s64/hash_hugepage.c
+++ b/arch/powerpc/mm/book3s64/hash_hugepage.c
@@ -54,7 +54,7 @@ int __hash_page_thp(unsigned long ea, unsigned long access, unsigned long vsid,
 	/*
 	 * Make sure this is thp or devmap entry
 	 */
-	if (!(old_pmd & (H_PAGE_THP_HUGE | _PAGE_DEVMAP)))
+	if (!(old_pmd & H_PAGE_THP_HUGE))
 		return 0;
 
 	rflags = htab_convert_pte_flags(new_pmd, flags);
diff --git a/arch/powerpc/mm/book3s64/hash_pgtable.c b/arch/powerpc/mm/book3s64/hash_pgtable.c
index 988948d..82d3117 100644
--- a/arch/powerpc/mm/book3s64/hash_pgtable.c
+++ b/arch/powerpc/mm/book3s64/hash_pgtable.c
@@ -195,7 +195,7 @@ unsigned long hash__pmd_hugepage_update(struct mm_struct *mm, unsigned long addr
 	unsigned long old;
 
 #ifdef CONFIG_DEBUG_VM
-	WARN_ON(!hash__pmd_trans_huge(*pmdp) && !pmd_devmap(*pmdp));
+	WARN_ON(!hash__pmd_trans_huge(*pmdp));
 	assert_spin_locked(pmd_lockptr(mm, pmdp));
 #endif
 
@@ -227,7 +227,6 @@ pmd_t hash__pmdp_collapse_flush(struct vm_area_struct *vma, unsigned long addres
 
 	VM_BUG_ON(address & ~HPAGE_PMD_MASK);
 	VM_BUG_ON(pmd_trans_huge(*pmdp));
-	VM_BUG_ON(pmd_devmap(*pmdp));
 
 	pmd = *pmdp;
 	pmd_clear(pmdp);
diff --git a/arch/powerpc/mm/book3s64/hugetlbpage.c b/arch/powerpc/mm/book3s64/hugetlbpage.c
index 83c3361..2bcbbf9 100644
--- a/arch/powerpc/mm/book3s64/hugetlbpage.c
+++ b/arch/powerpc/mm/book3s64/hugetlbpage.c
@@ -74,7 +74,7 @@ int __hash_page_huge(unsigned long ea, unsigned long access, unsigned long vsid,
 	} while(!pte_xchg(ptep, __pte(old_pte), __pte(new_pte)));
 
 	/* Make sure this is a hugetlb entry */
-	if (old_pte & (H_PAGE_THP_HUGE | _PAGE_DEVMAP))
+	if (old_pte & H_PAGE_THP_HUGE)
 		return 0;
 
 	rflags = htab_convert_pte_flags(new_pte, flags);
diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
index 0db01e1..b38cd0b 100644
--- a/arch/powerpc/mm/book3s64/pgtable.c
+++ b/arch/powerpc/mm/book3s64/pgtable.c
@@ -62,7 +62,7 @@ int pmdp_set_access_flags(struct vm_area_struct *vma, unsigned long address,
 {
 	int changed;
 #ifdef CONFIG_DEBUG_VM
-	WARN_ON(!pmd_trans_huge(*pmdp) && !pmd_devmap(*pmdp));
+	WARN_ON(!pmd_trans_huge(*pmdp));
 	assert_spin_locked(pmd_lockptr(vma->vm_mm, pmdp));
 #endif
 	changed = !pmd_same(*(pmdp), entry);
@@ -82,7 +82,6 @@ int pudp_set_access_flags(struct vm_area_struct *vma, unsigned long address,
 {
 	int changed;
 #ifdef CONFIG_DEBUG_VM
-	WARN_ON(!pud_devmap(*pudp));
 	assert_spin_locked(pud_lockptr(vma->vm_mm, pudp));
 #endif
 	changed = !pud_same(*(pudp), entry);
@@ -204,8 +203,8 @@ pmd_t pmdp_huge_get_and_clear_full(struct vm_area_struct *vma,
 {
 	pmd_t pmd;
 	VM_BUG_ON(addr & ~HPAGE_PMD_MASK);
-	VM_BUG_ON((pmd_present(*pmdp) && !pmd_trans_huge(*pmdp) &&
-		   !pmd_devmap(*pmdp)) || !pmd_present(*pmdp));
+	VM_BUG_ON((pmd_present(*pmdp) && !pmd_trans_huge(*pmdp)) ||
+		   !pmd_present(*pmdp));
 	pmd = pmdp_huge_get_and_clear(vma->vm_mm, addr, pmdp);
 	/*
 	 * if it not a fullmm flush, then we can possibly end up converting
@@ -223,8 +222,7 @@ pud_t pudp_huge_get_and_clear_full(struct vm_area_struct *vma,
 	pud_t pud;
 
 	VM_BUG_ON(addr & ~HPAGE_PMD_MASK);
-	VM_BUG_ON((pud_present(*pudp) && !pud_devmap(*pudp)) ||
-		  !pud_present(*pudp));
+	VM_BUG_ON(!pud_present(*pudp));
 	pud = pudp_huge_get_and_clear(vma->vm_mm, addr, pudp);
 	/*
 	 * if it not a fullmm flush, then we can possibly end up converting
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 9f764bc..877870d 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -1426,7 +1426,7 @@ unsigned long radix__pmd_hugepage_update(struct mm_struct *mm, unsigned long add
 	unsigned long old;
 
 #ifdef CONFIG_DEBUG_VM
-	WARN_ON(!radix__pmd_trans_huge(*pmdp) && !pmd_devmap(*pmdp));
+	WARN_ON(!radix__pmd_trans_huge(*pmdp));
 	assert_spin_locked(pmd_lockptr(mm, pmdp));
 #endif
 
@@ -1443,7 +1443,7 @@ unsigned long radix__pud_hugepage_update(struct mm_struct *mm, unsigned long add
 	unsigned long old;
 
 #ifdef CONFIG_DEBUG_VM
-	WARN_ON(!pud_devmap(*pudp));
+	WARN_ON(!pud_trans_huge(*pudp));
 	assert_spin_locked(pud_lockptr(mm, pudp));
 #endif
 
@@ -1461,7 +1461,6 @@ pmd_t radix__pmdp_collapse_flush(struct vm_area_struct *vma, unsigned long addre
 
 	VM_BUG_ON(address & ~HPAGE_PMD_MASK);
 	VM_BUG_ON(radix__pmd_trans_huge(*pmdp));
-	VM_BUG_ON(pmd_devmap(*pmdp));
 	/*
 	 * khugepaged calls this for normal pmd
 	 */
diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
index 61df5ae..dfaa9fd 100644
--- a/arch/powerpc/mm/pgtable.c
+++ b/arch/powerpc/mm/pgtable.c
@@ -509,7 +509,7 @@ pte_t *__find_linux_pte(pgd_t *pgdir, unsigned long ea,
 		return NULL;
 #endif
 
-	if (pmd_trans_huge(pmd) || pmd_devmap(pmd)) {
+	if (pmd_trans_huge(pmd)) {
 		if (is_thp)
 			*is_thp = true;
 		ret_pte = (pte_t *)pmdp;
-- 
git-series 0.9.1

