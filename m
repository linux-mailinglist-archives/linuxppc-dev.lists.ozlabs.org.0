Return-Path: <linuxppc-dev+bounces-16195-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBW0CRoUc2lksAAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16195-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 07:24:26 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D0770E69
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 07:24:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dy7Dv5l9Pz3c9d;
	Fri, 23 Jan 2026 17:24:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c111::9" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769149455;
	cv=pass; b=cTQJwERV3SFclAndosPt/v7Zu/MU67OoxGi2Zjt85ad7Puzw6gCVNrK0Q1YHe16GiYQIdk104VMa/M0u7lr3o8/bfU8xr0F79XIfjJzD11Lo6ssKuVX7vGaW1XcsHSC36RmXsHj5v7xqCgdH9DmdnSE3dUgBS8pok1u4bd836rqwf6ngHrclqM1jzn39jjSEfqjaHjzzbt8xQfB9vRetkP6QuuV01adt1minkLZNT9VrVfmXGgpDdSsGNBzO9U5lrnr3iNj5/3re3b0ZajSnCapSQM2znoVEy8nOwDoYcB/PhFeYdN8aEF7s0R9gA249rkX4YqDETr1AFAfb98ggGg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769149455; c=relaxed/relaxed;
	bh=svKuLk8T2SeFVvAWdUEoTSVnNraWK7+T3W5jbyZQoW8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZNtzFuI3XfSGHmjDH6BGo1mJ356WsDrXEBku6JcNDLJqhO+EZjK6Rp7AMK8TzWMNYBCcrC5lP+Fqk51KNMnwh+pFxybEw6xZhTg5WOJ/mEm45YpkcBqur5/Ae7CRc3LWHo9JAs7lCvaPkRPbdwRCrgENx/BGjlHdevqNv/E13e0cQbWUzGu8xSvcdNwjJ1IvbK9kKExO1bZN75/uUZ3MvjJUlKCxl8Wfd+gayiFU28fAIBU6lLF0shoxGjrdvcsM8Ff+fqV7s8evm+kQUdZSEjHjLxMp9T7S+2d7gVKUDmIOzydEECbylRCDm6/YXvhxr7ROZiCMyL4NLJidx+Xhlw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=aGSHLtTc; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c111::9; helo=dm5pr21cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=aGSHLtTc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c111::9; helo=dm5pr21cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org)
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazlp170110009.outbound.protection.outlook.com [IPv6:2a01:111:f403:c111::9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dy7Dv0sbFz2yFY
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jan 2026 17:24:15 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kGiYnRTagp1v03iWNLs3XLgtP1iP8vfqf8zoV4jb4jyQ+lSi6sNUbZO0Uek4+2pjI6WIwoqnTl6aKVJ7ncphQOo6QeBIcSICOfyns/9ittcR8bStj08c/O6ksAcJ3fMlSzKgZ2xbbtQlYKRPG1bbI5KLSKINPSIJ+WsatUhXY4W6W88dX+teYQqZRkZc0ky1NHeD7smu1GOsVibRUkDCA3dmM1C94CMs8KY3Vk6L7YoKYnZAIOqv7M23Ger1WzoSSXqlvcJKnmk85COT6se3IoeZEqUQoFXsQls5po2frPFzyNygxCjKGaBr97xVDI1UcHMvR9nESNmaBwpq73KRzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=svKuLk8T2SeFVvAWdUEoTSVnNraWK7+T3W5jbyZQoW8=;
 b=Conf5XBCtymiZrOkeu9IVXQ2iBXVCR7Zp8zNDI2oVeWdqYyKUtc9RqMw3gOrQ+8/ZOH05F2ReXGhXN1NPMwSYkWQiljD7ohTg9j88v/H44UnOL5uuNRR+JTygDR36HRVnQGuKUIw2AWZpzli78cYa7NxPXg8EPxDXb1YzP+U11u3U9R6Y1cI9hYPBySDVqR9XYnhrBB86x65ltVkbImrpHJLbUVQEAr+C5w3Y/CGwAS5CAUtIdI2kSKhwfWZ2Bz2GMrY6wbTlgfpX6PP/tavH3wtf4nMYblkuSoLj+z5ENHrNbizZp+hME7ZeHNf1F1WTsPkTXKVcfriXe4vG4FRQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=svKuLk8T2SeFVvAWdUEoTSVnNraWK7+T3W5jbyZQoW8=;
 b=aGSHLtTcM5Zsrp1k+6ObKbFdzNxc17WICueEgQU1LOww9LywX+WYqVP5DN8k+0Vu86w1CCQ9tWNvStk8UCTT75GJ87WK39bH/6UO3u8SHMJnGhBl9l2qCzd51zSYa0LrVFoZ2CDN8MvhubCXpyh/lNq8Pv7HDXC5zRW4lyiz6WfUhGDXDOGwaLT0cNxT7aARgTHUqYjjqMgBLtF5QY8Gduf69Q9tprHFIIx3R84li0UZQYAZ1uWJ94gI0migmcKZ/eLIBtN4COF+N+Cgnr/T3nNHixzqbFOZ+QrIHEjfgRVOK0MnVbkBNq1ZuCoO2DGnG3zJLgM6BWeKJNdiTq8Xjw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 DS0PR12MB8020.namprd12.prod.outlook.com (2603:10b6:8:14f::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.11; Fri, 23 Jan 2026 06:23:54 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 06:23:53 +0000
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
	Felix.Kuehling@amd.com,
	jniethe@nvidia.com,
	jhubbard@nvidia.com
Subject: [PATCH v3 05/13] mm/page_vma_mapped: Add flag to page_vma_mapped_walk::flags to track device private pages
Date: Fri, 23 Jan 2026 17:23:01 +1100
Message-Id: <20260123062309.23090-6-jniethe@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260123062309.23090-1-jniethe@nvidia.com>
References: <20260123062309.23090-1-jniethe@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0209.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::34) To DM4PR12MB9072.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|DS0PR12MB8020:EE_
X-MS-Office365-Filtering-Correlation-Id: 39d7741f-1cd7-407b-5cbb-08de5a47faf6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?P3vwI+Yx/RD6G3kTOhCR67RkV/UPAlI76DJBrlZahSrDvY5XeQP+1K0NTCne?=
 =?us-ascii?Q?nAcLOj0B29LMEsWZsSM7nbv/rUVIIF9cJ3wCvtPewDdWvJp6vnPUajtBUoUu?=
 =?us-ascii?Q?+s5h8xeR/rOy3lEh3djtJZhg00ZDljXSYJhHUmigScwQyI5ncOJMWf8E/2vq?=
 =?us-ascii?Q?D+rXkG4ofiqz/cVgI7TKAqC1DFplKQcD0YWtGyapUzlAH8zONAcEvRv8PPIE?=
 =?us-ascii?Q?1d/+eVlK7O/s0FGgAwZoq+Y0lJzfvXePX0Lx0/n1/8BagN+e3hU50gg1BBUk?=
 =?us-ascii?Q?vpCUCapxDGTLrSPHfQViX//qGfv9+VQOLeWuwlT0YB6MmL8uzW/A3KvNCRAs?=
 =?us-ascii?Q?5BlDQmimWKRSiQ9GzKFBKzO7T8o5jGBDMBADGEqcpRdumm3n0naoxkusll2z?=
 =?us-ascii?Q?O+Q1q9mEK18W3bHr2mgBGSFskxzVOOtd8ZUet6g62c9somOgW6aoO3tEYoy+?=
 =?us-ascii?Q?q+PrX4/JVbvVxdK995247tlrGJOcId+yyy+miS1s9BD5Ba2A3rD/jJ3wRo+b?=
 =?us-ascii?Q?RaUtrKYg5hsja5HF8TjF5bRbAg3it76ooSjeqaFaLAfFHf/7xpZYhP7GxnFR?=
 =?us-ascii?Q?a+aCh9k8F3D+129F27A6yIwzFmBuPj2EEcovWXo/h4HZhWUJZD6JsnTIXTRS?=
 =?us-ascii?Q?o6vtQTWs4em3evaaxVLHVqgwx5Obwnfl2MydcLEF0UyvhdfB2cGBceX8K6C5?=
 =?us-ascii?Q?EJ9hx8JBBxrYkujlgoDDiTRptukSfX085kR/itMxo7Ww9wy8cYiVqjOU0Dfb?=
 =?us-ascii?Q?DvMC39IR2FD9mUCMLIxZJp8UoQfU8ovFEYk0LgOjTTkQlSXc1vsnV3Dp94F2?=
 =?us-ascii?Q?DPlC1sGbQOgSPvEZw5Xbz5Yf18CvsgfnZ19iQnKahTwE+fcG2tAXh1If17XX?=
 =?us-ascii?Q?nkyKZ6IweGRmVu273gTt8uqmckAy+sefrui2kZ4C7jOi/Wz9ks7M5Y/ScSy6?=
 =?us-ascii?Q?t7KudBsA6Nd2RPRtbKBunJL9HQ4JdsZUHKZKE7n1oCIUdsFdoorayAXSSki3?=
 =?us-ascii?Q?QXzH1XgkgNT6DFIaSsW/UfcZra/3F6Bup/EFoOWR8ZiVAECsyjIPdsGO4qed?=
 =?us-ascii?Q?pMVQGnJF1cFadDaqHVi0ckI4qWtlhlcKuR1ZPkE3gT+FMY7vXxB50cVukSPJ?=
 =?us-ascii?Q?LnAfc+lGUC2McgJ9HS3S6QPEgNjZ+4ddmyxcR3PVtnZn471/tnpPy+IdEwyt?=
 =?us-ascii?Q?7x9tQUV+frCsGOB6wcbsyZATe3t95Nfn6gK7WO06Qk03gFYxVgjSFscFdcqi?=
 =?us-ascii?Q?iSOVXiZHsJu7xFmJH6oYPYbKwbBOs6qTZ1pIwXsV548J2Nm0ndQzw/ZDpnLG?=
 =?us-ascii?Q?GYboRyoIkZnxfIR2aUOvHofJEcrzwjwh8mySu6ivmtStMO1HwMIqSbcf+fzg?=
 =?us-ascii?Q?OSa2IkAcEL7qX6KkWWZTqhkl9YIc4E4NHPrIa9kfmqwEicMO7D064sSiK2QK?=
 =?us-ascii?Q?mQYOGN4hARgdsTQKn/DPbhEqdOQ6Qm13MJ1LPWVWiUG918IRDe/eRM6K1xFs?=
 =?us-ascii?Q?oZsuuZ6ctdVHAqGrmbqNZnJrw6P9Sz0eq9p6t6bEpaiVRuOPbq9iwvs0kviV?=
 =?us-ascii?Q?XEwAgnYGc7gxcTanyQU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB9072.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fBr5X1GGTrvskiHYnwnI8gQt7D6TZ1xzS2OKskN7LMHoK+DTozTiKgoMU2Ls?=
 =?us-ascii?Q?JNmC38KZcsj64eCGH/WWrwXXRjDdlVIXece+DTc4Arkamt20RhmDjmYpE/n6?=
 =?us-ascii?Q?IhFoG/lG50lx19EVwfgXMD/txGbdK4WVNKPvhloQfRv5pFRbtdWk5riTnHky?=
 =?us-ascii?Q?2nnsxJ8X+RYJLJxBmKRyaIkLgzzGQCoDaCMsqaqWIzUVSB5/0fVosF+xy7zV?=
 =?us-ascii?Q?ie298vg4/SvbopH2u+EuViVln4sUp3VDTZksFTLruGqV06e/UOnubiQrc/BD?=
 =?us-ascii?Q?P6TisJBYXd6Skyq+uM+GBTIX7+382QGlmwEt2Gn+ee4iupqns8qFz6q5ueyJ?=
 =?us-ascii?Q?8F47Db9ZhvqYB7mesQCcTZSConVlwY55L7W7PUv28Fafas8b2+eqYmO7ogYt?=
 =?us-ascii?Q?Oxnc7CwEMr5l65e+fdV2z7PZn0VpHSz4R7vGAZO0l8ZN7IPJLkT1UdTBZLW2?=
 =?us-ascii?Q?gopLE3ZO/l/oaMk5bqevzMZI4x5ZAix6fD5nHrxmCFjPCq0O1qmG3+mArb9/?=
 =?us-ascii?Q?kvO92ru+Hfau5EuRy7lL+i2HIP/BwIVTPpYRlpDk0JnY/n0We0/bW8717FjB?=
 =?us-ascii?Q?b8PL0ZS5XBl5l8a7E4/8Dh5hMeCcm9qqiEAM7QuqVTmLAAJIjV5dtS78kmW6?=
 =?us-ascii?Q?p8PzIE+vTUJhRKRqDOSH6jqSR85wtmA3ANX2mvZfUBuifxzP7ayGJ0HnaruE?=
 =?us-ascii?Q?Zceu+cHXipilsdAHO2XK2KA5JHcAu94kH77JnLMffjQuKuWVWy2y9WJq9fHx?=
 =?us-ascii?Q?Mj5Mzt2mn1dvpFM4NDb+qrIYCChd5/bKtV3cA0qQMLZo2R0jY3xwyHD5MQr0?=
 =?us-ascii?Q?LnFdmlYgNwuFFhAGkXSzErx1ZCiugxYQfDApsXdTbLhzO1Z61qkwUfBJW79x?=
 =?us-ascii?Q?sek2IsLSKQGTEngCHTHz916/j1qt1pgXdv5VC4O3JUpGdiYHAsN3FnAVqd/1?=
 =?us-ascii?Q?pGWmC41DM42l+iHpcqQ/qhW9Crav1oNF2UBeXsY3OJWJyDJe5F6EOjn8Lsmi?=
 =?us-ascii?Q?7CS1HujIbIlwfg/SqPX/n1lWBdd47AoCfsbpq9gxJwd3mIsGRQnw74xWG01S?=
 =?us-ascii?Q?1MN2yC6sqrEWYb3cmAdiiUdxjwRWV4J/esXFDlfSuMMkSTi+Nj6Puf7ADQlS?=
 =?us-ascii?Q?UHYWTLtXSi8noMeUojq6Tf6Z/euzb4erm6ppxl0gKkU5vF6wNbfLi627fMcY?=
 =?us-ascii?Q?fX8P+BYn3GNriaZv7DGI906LBz2yKkiVMxw7HPetm06lRpvLr+2UpQjwU8Dr?=
 =?us-ascii?Q?8MJ1bo/Q8akvkRy/GboERvrdmDVXFRx4EucmbU+kuKs/+pyZcrWeIiEEC6dJ?=
 =?us-ascii?Q?Jf9Fm8F95fUh0nMgGqCrkmaS3gPTR4qLWRGRrnnLjuGc9pOxLUdENRSksdbZ?=
 =?us-ascii?Q?FZtvibW4S62dH1Lgd9cXpyvHBSDloWY7hCVBJ5K+zbl66ODHF9N/ailIXUAm?=
 =?us-ascii?Q?azons5Sdv7In/1+KKOOlwyvvZ5jDDnYtDfEuIlUPGqgO7Tx3oQXT6+Xc22uL?=
 =?us-ascii?Q?GWar7HAIe2YM4nBRK8oRM3Z1OIIYWKaboVd2w8ul41wnXur9ydMZFhCGEBdN?=
 =?us-ascii?Q?qBMUNFN950aXNCzoX9KJUE20OtQWL7fIz3nvI7QxQIstH8ea0hz8cSbHoioD?=
 =?us-ascii?Q?hI34itcmW6ALOvU4HhirdcZlB1PzqIhi/2Iwc9iBbjlFHj449dVIjseEzzC7?=
 =?us-ascii?Q?zNqaVxJ+JPAX+QbuF6FuMLrbHF15LutpeLBRAjK28yoi0yL14iUYrXhTJEfg?=
 =?us-ascii?Q?3PWMsYBCKA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39d7741f-1cd7-407b-5cbb-08de5a47faf6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 06:23:53.7970
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lKEvxNgki3Z53M4D31+dnhy9IbnZybSQTEfUIPphJi7DmpTeodSsiGtbQM+GFVITJLDhuJK3FxMuU5+w2VvuDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8020
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16195-lists,linuxppc-dev=lfdr.de];
	FREEMAIL_CC(0.00)[nvidia.com,intel.com,linux-foundation.org,vger.kernel.org,lists.freedesktop.org,redhat.com,oracle.com,kernel.org,gmail.com,ffwll.ch,infradead.org,lists.ozlabs.org,ziepe.ca,amd.com];
	FORGED_RECIPIENTS(0.00)[m:linux-mm@kvack.org,m:balbirs@nvidia.com,m:matthew.brost@intel.com,m:akpm@linux-foundation.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:david@redhat.com,m:ziy@nvidia.com,m:apopple@nvidia.com,m:lorenzo.stoakes@oracle.com,m:lyude@redhat.com,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:rcampbell@nvidia.com,m:mpenttil@redhat.com,m:jgg@nvidia.com,m:willy@infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:intel-xe@lists.freedesktop.org,m:jgg@ziepe.ca,m:Felix.Kuehling@amd.com,m:jniethe@nvidia.com,m:jhubbard@nvidia.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[jniethe@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jniethe@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_SPAM(0.00)[0.133];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim]
X-Rspamd-Queue-Id: 74D0770E69
X-Rspamd-Action: no action

A future change will remove device private pages from the physical
address space. This will mean that device private pages no longer have
normal PFN and must be handled separately.

Prepare for this by adding a PVMW_DEVICE_PRIVATE flag to
page_vma_mapped_walk::flags. This indicates that
page_vma_mapped_walk::pfn contains a device private offset rather than a
normal pfn.

Once the device private pages are removed from the physical address
space this flag will be used to ensure a device private offset is
returned.

Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
v1:
  - Update for HMM huge page support
v2:
  - Move adding device_private param to check_pmd() until final patch
v3:
  - Track device private offset in pvmw::flags instead of pvmw::pfn
---
 include/linux/rmap.h | 24 ++++++++++++++++++++++--
 mm/page_vma_mapped.c |  4 ++--
 mm/rmap.c            |  4 ++--
 mm/vmscan.c          |  2 +-
 4 files changed, 27 insertions(+), 7 deletions(-)

diff --git a/include/linux/rmap.h b/include/linux/rmap.h
index daa92a58585d..1b03297f13dc 100644
--- a/include/linux/rmap.h
+++ b/include/linux/rmap.h
@@ -921,6 +921,8 @@ struct page *make_device_exclusive(struct mm_struct *mm, unsigned long addr,
 #define PVMW_SYNC		(1 << 0)
 /* Look for migration entries rather than present PTEs */
 #define PVMW_MIGRATION		(1 << 1)
+/* pvmw::pfn is a device private offset */
+#define PVMW_DEVICE_PRIVATE	(1 << 2)
 
 /* Result flags */
 
@@ -939,14 +941,32 @@ struct page_vma_mapped_walk {
 	unsigned int flags;
 };
 
+static inline unsigned long page_vma_walk_flags(const struct folio *folio,
+						unsigned long flags)
+{
+	if (folio_is_device_private(folio))
+		return flags | PVMW_DEVICE_PRIVATE;
+	return flags;
+}
+
+static inline unsigned long folio_page_vma_walk_pfn(const struct folio *folio)
+{
+	return folio_pfn(folio);
+}
+
+static inline struct folio *page_vma_walk_pfn_to_folio(struct page_vma_mapped_walk *pvmw)
+{
+	return pfn_folio(pvmw->pfn);
+}
+
 #define DEFINE_FOLIO_VMA_WALK(name, _folio, _vma, _address, _flags)	\
 	struct page_vma_mapped_walk name = {				\
-		.pfn = folio_pfn(_folio),				\
+		.pfn = folio_page_vma_walk_pfn(_folio),			\
 		.nr_pages = folio_nr_pages(_folio),			\
 		.pgoff = folio_pgoff(_folio),				\
 		.vma = _vma,						\
 		.address = _address,					\
-		.flags = _flags,					\
+		.flags = page_vma_walk_flags(_folio, _flags),		\
 	}
 
 static inline void page_vma_mapped_walk_done(struct page_vma_mapped_walk *pvmw)
diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
index b38a1d00c971..039a2d71e92f 100644
--- a/mm/page_vma_mapped.c
+++ b/mm/page_vma_mapped.c
@@ -350,10 +350,10 @@ unsigned long page_mapped_in_vma(const struct page *page,
 {
 	const struct folio *folio = page_folio(page);
 	struct page_vma_mapped_walk pvmw = {
-		.pfn = page_to_pfn(page),
+		.pfn = folio_page_vma_walk_pfn(folio),
 		.nr_pages = 1,
 		.vma = vma,
-		.flags = PVMW_SYNC,
+		.flags = page_vma_walk_flags(folio, PVMW_SYNC),
 	};
 
 	pvmw.address = vma_address(vma, page_pgoff(folio, page), 1);
diff --git a/mm/rmap.c b/mm/rmap.c
index f955f02d570e..7f12934725d1 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1871,7 +1871,7 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 	 * if page table locking is skipped: use TTU_SYNC to wait for that.
 	 */
 	if (flags & TTU_SYNC)
-		pvmw.flags = PVMW_SYNC;
+		pvmw.flags = page_vma_walk_flags(folio, PVMW_SYNC);
 
 	/*
 	 * For THP, we have to assume the worse case ie pmd for invalidation.
@@ -2299,7 +2299,7 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 	 * if page table locking is skipped: use TTU_SYNC to wait for that.
 	 */
 	if (flags & TTU_SYNC)
-		pvmw.flags = PVMW_SYNC;
+		pvmw.flags = page_vma_walk_flags(folio, PVMW_SYNC);
 
 	/*
 	 * For THP, we have to assume the worse case ie pmd for invalidation.
diff --git a/mm/vmscan.c b/mm/vmscan.c
index 670fe9fae5ba..5d81939bf12a 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -4203,7 +4203,7 @@ bool lru_gen_look_around(struct page_vma_mapped_walk *pvmw)
 	pte_t *pte = pvmw->pte;
 	unsigned long addr = pvmw->address;
 	struct vm_area_struct *vma = pvmw->vma;
-	struct folio *folio = pfn_folio(pvmw->pfn);
+	struct folio *folio = page_vma_walk_pfn_to_folio(pvmw);
 	struct mem_cgroup *memcg = folio_memcg(folio);
 	struct pglist_data *pgdat = folio_pgdat(folio);
 	struct lruvec *lruvec = mem_cgroup_lruvec(memcg, pgdat);
-- 
2.34.1


