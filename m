Return-Path: <linuxppc-dev+bounces-4939-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F1690A08745
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jan 2025 07:02:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YTrf01Dlzz3c7d;
	Fri, 10 Jan 2025 17:02:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2416::62a" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736488936;
	cv=pass; b=oFwxTAFEUd16qv94oVt++V5uFBQmlwJHmHQxal4yDwF8bCWcd1SyUZMoXYitTNIXnBueeHxEIyMCECPPd/OjQNsiaDhz37MA1ZWyibFA4SMtMV6W8kr8vJleFh3ehykCO+eLBjDq1i6oGGj0G95UAs7IG/OQsxoTmREiU/zLXduH3ElsCdAK7ba+FlRLKUbSLNlnwt/uYQV8D0VeCSAbqlCI+cGKVtB+JYQNS4DLWU00kT9J2bPAQeJJswupPRlpFNE2jFd0epITFEwIRGQvdeC087rM1YO+8kWzOV2BjGfCxEw8RqDviG/kiSP5QDwlqg4dUiLKkDM313NwAuH+2A==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736488936; c=relaxed/relaxed;
	bh=YPkvu0HOcKU50op5xWevlI320b4g9MRTTEsTmpTzyxY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MrTFhiz59+k9e5kv91bMzZIS7dNgL1hxXBRRn084ZYvNhQATEEDIw+gox5vWTvLdMbbjJKSs5wS68wHyMjBHjYZhiH7jkK0YLpUE8pBjITsElgox4Zj82spSWcmU3i56HEzWwzbx2H5NeHLhRX3iqu4EL4YhJSZqfREVR+k5pzBYzj/8T6fF/WeQpgjyyrYhTtn27l1hIR/3/h0OxhkXQhVlOrhSV0mYf+0NaMOn0jGulqHyhtBFvYaaa9SmZAaOtlJSgaO7vUPXFmYM00Dmww6uGHL8k0CiIBBQcw2V4DdyAUnLQyhfN7cHY9HDtoBIXq50ZcGEBbZcKl8k0x/+7A==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=YYBoUbdS; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2416::62a; helo=nam11-co1-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=YYBoUbdS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2416::62a; helo=nam11-co1-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2062a.outbound.protection.outlook.com [IPv6:2a01:111:f403:2416::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YTrdz4Nx4z3c8D
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2025 17:02:15 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dpgpcDtj9NIJ4NKcih59h4fIsYxKsBW7Un1o66uxjW4nSR72vHpN4t+NIS1bO9tEr2611rbNHkVLV1UL7hdwSOUbWrhXvxZe9TOVx3PUsGL04Ru7HQG4iEz9d+RmsZxNMvEHeM86FIMXxFJUqXmopQ0w6Ou8uMevhQUgtBSRlsllX5X6uMSh+58brTDdqa6t+p4S61CQSJXSo9iFKHyjDM0JLWo5zNXiW+BSrGAoiEPtcROJ9H8m+kCnwCL9zfTucfOz+1gYvPynWeCs0r4Ng6LlxG169mZRBAWc4t1hVvluxLCbZlAk1EzH9Dm9vJDQh5gCQfEpjWBzCyWNzKYDOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YPkvu0HOcKU50op5xWevlI320b4g9MRTTEsTmpTzyxY=;
 b=Iig8ID6vJT0cs8GBKuzdA7EKXQSt5ysTYvQNF2kMOVuc5UrM3DzfJy6oV0FKBS0bdRLrk5O7T5ZJiuJls75Ad6vqRFScti826zzrMk1A9d6PJ45NHmlwWn0Ou+TxNhyLJ+5Jxx9AKEzI060L+pWTvw+Hdx2o2fdwGQlkddxXjNhamc95T60dvsGRyyxFikECdlYy72cJTy44YPBTRgohLDkY9gP0Z+Orwn3aUk0XaHeD1G2Wl+rN3EvFum0R8yqG83WrS5IA6W62EbieuWXN/+DFouGjyNUqhpWqK47a23/t4bLbM6l6H/u5ZejLrqb3jGGEAj/+alzVcrnxmtA2uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YPkvu0HOcKU50op5xWevlI320b4g9MRTTEsTmpTzyxY=;
 b=YYBoUbdSwK49JmV1OZyEzZLXA5CbTgYJQWkmhB/lEWZcjEq02UrDWDJr2ebkq5x8DAuHchch/pDYTxzb0pq/ulpkvznf1Wpr9DOJix4CzDGbc7twWiu/mX+SvBVgodJE/B9qfunK/poEmGRokLYolLpos6kJNgBkpcPxC52mCE9ap4962PGg0joLB7csq09cHmHTr00kIVL0GtJjEwxwbtHDr0imgzeQtBV+f0IjOaa9vrE6fIY4IolXzFBOIPNiGIzl8veKjBYyqmTC4zyHpRQDdkDZstCZgM91nFkfYrvqx/SJtZ6FLUa8Pc+GxRBc/cUpfDK+3CDw9+yHvRdXpw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 BY5PR12MB4132.namprd12.prod.outlook.com (2603:10b6:a03:209::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Fri, 10 Jan
 2025 06:02:02 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%7]) with mapi id 15.20.8335.011; Fri, 10 Jan 2025
 06:02:02 +0000
From: Alistair Popple <apopple@nvidia.com>
To: akpm@linux-foundation.org,
	dan.j.williams@intel.com,
	linux-mm@kvack.org
Cc: alison.schofield@intel.com,
	Alistair Popple <apopple@nvidia.com>,
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
	david@fromorbit.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	loongarch@lists.linux.dev
Subject: [PATCH v6 08/26] fs/dax: Remove PAGE_MAPPING_DAX_SHARED mapping flag
Date: Fri, 10 Jan 2025 17:00:36 +1100
Message-ID: <b8b39849e171c120442963d3fd81c49a8f005bf0.1736488799.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.11189864684e31260d1408779fac9db80122047b.1736488799.git-series.apopple@nvidia.com>
References: <cover.11189864684e31260d1408779fac9db80122047b.1736488799.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY5PR01CA0062.ausprd01.prod.outlook.com
 (2603:10c6:10:1f4::6) To DS0PR12MB7726.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|BY5PR12MB4132:EE_
X-MS-Office365-Filtering-Correlation-Id: 7115f0ac-8193-4a3f-3824-08dd313c4d49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EBk6dRc/jy3c6e46fEn47r2oLMWOFsk3GkgheYwIJ6hQ3YZgw2Si+/oJe818?=
 =?us-ascii?Q?HcxlejU9V+V4jOilo8dIHLc41/wNic5rmZ9mghh0pBFEss4sFOhktzqF75b5?=
 =?us-ascii?Q?D5/aVAlt1YC98VYUxNPR2I9Ejk1EM1hSkssWbwEErr7WC8JRj67jOou8EBdl?=
 =?us-ascii?Q?h1SQXuzN2ymgEkAhtzfiq5bRgi+fHbo6AWJIZTf+CqdQaxFQ7NDgM0CkPRI6?=
 =?us-ascii?Q?M7trRRk9UY5WPAokDDxoqrlkhffZv+JNKgsIOoyXSd4bx/4lrf0taVyHmQYp?=
 =?us-ascii?Q?Wp7fvoIT6u9/SqG79QMn+dWJcd8vrgY/exQ41A/fYZrcQWoKhAy4w+WjJsX4?=
 =?us-ascii?Q?EuJnW9j0RQPZpRPdljhgIATv2lM6/3H4IL46Eg67hF5KA9NtNaNXMKoIvcoZ?=
 =?us-ascii?Q?hvm/fHO8l4xfNP4aL1/WCLDoGfGG8/JAG1a7eBUu5F7aj+t2RovThfiM232A?=
 =?us-ascii?Q?7QbnmANhA/TOpvEVWCu44ceksvRlRBf0KQkvC4267BURUGrk7P1YUFRRjWbg?=
 =?us-ascii?Q?RXNiEA5pUO7TY2zKcTIregHqVXzBY+AbYY3yXr7eoLfEUfK/6ERP1ZVvHILg?=
 =?us-ascii?Q?t6OIOSnanyAmJH4AY+iR8ryX93NftoKpRisxx9AD7RDs8SZncLG+t4rEpVo5?=
 =?us-ascii?Q?DmS+lu5jmkckl0PuZlHoLLqmbHT24YwPiBzqNpaSDRVrLJPHUP8TEGy8tTj2?=
 =?us-ascii?Q?c1IA4G2iwGFQ1p9YTcHmhbostOTdgmrbUGkMyvqKAD/8HJb0JvB0i2Uhv0hD?=
 =?us-ascii?Q?u/bD7F66lXG4sH5z1R6tR8x3Ssd983lD5ltQYcGDj0cJx1DtdTOfJs+Enm3T?=
 =?us-ascii?Q?f86R7gNNO9VxSYCTJuFdZRXcjQaLBKy1L6vquIstKNCanBx19gmrevg+5hC6?=
 =?us-ascii?Q?sKPQ/9Gtu5vHarauMk07utH60ZVn/Uq88AqtXjrrwG2SHMUEgO+CprYusoSE?=
 =?us-ascii?Q?6MGvvnmBUEoIvAO8AGzhoIPz9OznPchIubg3SD/Yt4tDexkoaBJuv/GG+eve?=
 =?us-ascii?Q?5SFzyFn12VkLLGNXOpi2/oSB0X+tjQs5nFYgFB1bO36wd+dqqu0uqmSCCYFv?=
 =?us-ascii?Q?xa4EulSFg1mw3OpNWU3FyhJ98fNA9C+rxjJow4zF8DQblF8o9WZK1IfMIgGb?=
 =?us-ascii?Q?KEQCoBsXi0TmZIb9sKRHSNYA1HHOWWOx/exKF7lYBUEsTW73HEPlRv67SwqF?=
 =?us-ascii?Q?G75pb9icLf9/3cK80hYpDaqFx2BYyOcRoMf98+0plxjR4KyFp4TgRMB7KPI6?=
 =?us-ascii?Q?eiRvSFqJNNUga+42YYIx3MGawBL0kTykDTsIjGX/fCb8l+wQ7uq+i8+pY+z4?=
 =?us-ascii?Q?Ym/X3IFd1sUuPAuWhdIVWNWKmoCivCbfyjDbbAZPNacndp4nGesw/xFnR8ct?=
 =?us-ascii?Q?PNo7jdjYO3tgj39MASxI3yXA/HOn?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ogCdlVMVtd8OQJVX669PMlHqobJNKo8lLb60ZvzUNEf8V/T7vqZmwFHIP2T0?=
 =?us-ascii?Q?cUb85oNL0y7HnVKSIdDy9qu/L1EBwN9re+Occ13Cy/Yqod6egKDCO/8q8IFi?=
 =?us-ascii?Q?lCIfMO80Q0E7FutRns83UK2iLLiyOJxZS9+to9u1h1CPzLznFNC/+LW1GBYf?=
 =?us-ascii?Q?lZuI0/vUdXUytzWGMKNqvN+7AqFcxoHdRz3F6rrn8+uIoY4vcaf6p3egzanL?=
 =?us-ascii?Q?hfmTprweyag8Ddu6f8md6iOkFY0HxC3HRi7IYWOyYhM4HyJBUtL5hVLuj9wg?=
 =?us-ascii?Q?EOr+yLSmppXz+MFU6zjIMmHy3OMGQgpq6L6d5f5euw5X2jE401UHiEDIleMM?=
 =?us-ascii?Q?dz+JpwXVV3v6VlK8biJfNy3xbKpWK1uTkxNcXJn4ZPcawrxYeKp95hmRLzcO?=
 =?us-ascii?Q?jXIjznG4UZrPRb+vk0muC4XLdft/X1qXMdQw6EXM+xPkRCGXaPp1OCyNyvPC?=
 =?us-ascii?Q?pHmJ19rlKU5gSUg5rnpKaCv80fI0SSmJHXWLCJHsyKL68Al9bTMDm5uhQwvW?=
 =?us-ascii?Q?uwDf4X2eaCC+T1N/av5qPYVKEihUQv9WZvzlYuvg4wBVbQ0rElBpGmscno3o?=
 =?us-ascii?Q?asy5W5uAKhTBfqQbS4JYgiUffC/Nf65LI7gFrA2ODKNM8838vTQH/fj1erYY?=
 =?us-ascii?Q?0SCgURB5ywGoQyeEfVWJxKzDZZ6nf/EjnOmdhfpMDD6Upi2v123Kk/hdqWi+?=
 =?us-ascii?Q?M346wMYzSn8cM1AXhL0gM8zZtB+Q4hDBDr/RqfznxbD6s9RgtMcogW/9TeIX?=
 =?us-ascii?Q?HSt763Nss2O6DJo4OLbt0dyjSbqQNkHeRj7oN06Jd05+1syThWcPb9a/tGlY?=
 =?us-ascii?Q?PV/2aHxoPPV8zXCujpQHcAp6AGbNu6x6GLMU+IZwNeI9zBtgwXUkF/h9tvTi?=
 =?us-ascii?Q?UjuOHciBYAQp590JuvFDn6C4oT7/CnVzSU+SuSyawpBMzqIhtMN79Nf/91rz?=
 =?us-ascii?Q?9gD4v0d+E6UP4lNY9RK6sxp+SAKix/JlyJt/xWnOScJZg1USwz81+DO61ole?=
 =?us-ascii?Q?4JUptWkhTkjyIrcV2FCvzOCp1rLfln3++wyHaRMknIGH6aZnL1tijEr3fNUU?=
 =?us-ascii?Q?V3qSg5SNmzgTz7H7XwUeHzefrkEjw8JVOPHPSuq9YS7FLMS6t8M/SqZ0zru9?=
 =?us-ascii?Q?7ZY6uNQXPA506y5E8oOpedILkJJqBP3iehWF6uEsfLWb5WiOM6ke+JAlaW3Z?=
 =?us-ascii?Q?xG+t8iQLD+qQyCwgeUJSilmyC6730ndAROZsw7Yz/nAVeRLb8j5tN8w8K0QU?=
 =?us-ascii?Q?FBg1855bquELKQYgxqdeGwxeunbWI8GHXdvMBCYN1xWPO5q4EtmP4be6RrgK?=
 =?us-ascii?Q?X+h9dXnKtxXeTSDs8Tzi8TvhXb4ayL/mR7zhMG8NwEAAz3hmUtW4FKeFV131?=
 =?us-ascii?Q?C06zcSOzO9rBNLMyThFQ803YLh4Sf0pg0Try9O+zjq9Mu7XQt7SXdqbqFnG6?=
 =?us-ascii?Q?Vc7eU/DeDqpxDCPniBHpPzyYZCMC1VhbA0lIdZRSRma9dZyE80UpxcIl7ApF?=
 =?us-ascii?Q?j6ScI5sQj3iO1zkVQgbDa0Dl2/sU5ptYhupRM8vthYzy0RDSGJCePZHABSZn?=
 =?us-ascii?Q?4dYRH9UouG7x3Otw9faFJmkIVWAvxGc+7ps2cI8k?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7115f0ac-8193-4a3f-3824-08dd313c4d49
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 06:02:02.4099
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NmYHwA4/8tKbsJZvmJkGZSxL0RoJY8PPNBgFSyQjKAa5kZLq3dzMrymXZvhbzMlkhXAyswrueL6kOFkQlErEXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4132
X-Spam-Status: No, score=-0.5 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

PAGE_MAPPING_DAX_SHARED is the same as PAGE_MAPPING_ANON. This isn't
currently a problem because FS DAX pages are treated
specially. However a future change will make FS DAX pages more like
normal pages, so folio_test_anon() must not return true for a FS DAX
page.

We could explicitly test for a FS DAX page in folio_test_anon(),
etc. however the PAGE_MAPPING_DAX_SHARED flag isn't actually
needed. Instead we can use the page->mapping field to implicitly track
the first mapping of a page. If page->mapping is non-NULL it implies
the page is associated with a single mapping at page->index. If the
page is associated with a second mapping clear page->mapping and set
page->share to 1.

This is possible because a shared mapping implies the file-system
implements dax_holder_operations which makes the ->mapping and
->index, which is a union with ->share, unused.

The page is considered shared when page->mapping == NULL and
page->share > 0 or page->mapping != NULL, implying it is present in at
least one address space. This also makes it easier for a future change
to detect when a page is first mapped into an address space which
requires special handling.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
 fs/dax.c                   | 45 +++++++++++++++++++++++++--------------
 include/linux/page-flags.h |  6 +-----
 2 files changed, 29 insertions(+), 22 deletions(-)

diff --git a/fs/dax.c b/fs/dax.c
index 4e49cc4..d35dbe1 100644
--- a/fs/dax.c
+++ b/fs/dax.c
@@ -351,38 +351,41 @@ static unsigned long dax_end_pfn(void *entry)
 	for (pfn = dax_to_pfn(entry); \
 			pfn < dax_end_pfn(entry); pfn++)
 
+/*
+ * A DAX page is considered shared if it has no mapping set and ->share (which
+ * shares the ->index field) is non-zero. Note this may return false even if the
+ * page is shared between multiple files but has not yet actually been mapped
+ * into multiple address spaces.
+ */
 static inline bool dax_page_is_shared(struct page *page)
 {
-	return page->mapping == PAGE_MAPPING_DAX_SHARED;
+	return !page->mapping && page->share;
 }
 
 /*
- * Set the page->mapping with PAGE_MAPPING_DAX_SHARED flag, increase the
- * refcount.
+ * Increase the page share refcount, warning if the page is not marked as shared.
  */
 static inline void dax_page_share_get(struct page *page)
 {
-	if (page->mapping != PAGE_MAPPING_DAX_SHARED) {
-		/*
-		 * Reset the index if the page was already mapped
-		 * regularly before.
-		 */
-		if (page->mapping)
-			page->share = 1;
-		page->mapping = PAGE_MAPPING_DAX_SHARED;
-	}
+	WARN_ON_ONCE(!page->share);
+	WARN_ON_ONCE(page->mapping);
 	page->share++;
 }
 
 static inline unsigned long dax_page_share_put(struct page *page)
 {
+	WARN_ON_ONCE(!page->share);
 	return --page->share;
 }
 
 /*
- * When it is called in dax_insert_entry(), the shared flag will indicate that
- * whether this entry is shared by multiple files.  If so, set the page->mapping
- * PAGE_MAPPING_DAX_SHARED, and use page->share as refcount.
+ * When it is called in dax_insert_entry(), the shared flag will indicate
+ * whether this entry is shared by multiple files. If the page has not
+ * previously been associated with any mappings the ->mapping and ->index
+ * fields will be set. If it has already been associated with a mapping
+ * the mapping will be cleared and the share count set. It's then up to the
+ * file-system to track which mappings contain which pages, ie. by implementing
+ * dax_holder_operations.
  */
 static void dax_associate_entry(void *entry, struct address_space *mapping,
 		struct vm_area_struct *vma, unsigned long address, bool shared)
@@ -397,7 +400,17 @@ static void dax_associate_entry(void *entry, struct address_space *mapping,
 	for_each_mapped_pfn(entry, pfn) {
 		struct page *page = pfn_to_page(pfn);
 
-		if (shared) {
+		if (shared && page->mapping && page->share) {
+			if (page->mapping) {
+				page->mapping = NULL;
+
+				/*
+				 * Page has already been mapped into one address
+				 * space so set the share count.
+				 */
+				page->share = 1;
+			}
+
 			dax_page_share_get(page);
 		} else {
 			WARN_ON_ONCE(page->mapping);
diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index 691506b..598334e 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -668,12 +668,6 @@ PAGEFLAG_FALSE(VmemmapSelfHosted, vmemmap_self_hosted)
 #define PAGE_MAPPING_KSM	(PAGE_MAPPING_ANON | PAGE_MAPPING_MOVABLE)
 #define PAGE_MAPPING_FLAGS	(PAGE_MAPPING_ANON | PAGE_MAPPING_MOVABLE)
 
-/*
- * Different with flags above, this flag is used only for fsdax mode.  It
- * indicates that this page->mapping is now under reflink case.
- */
-#define PAGE_MAPPING_DAX_SHARED	((void *)0x1)
-
 static __always_inline bool folio_mapping_flags(const struct folio *folio)
 {
 	return ((unsigned long)folio->mapping & PAGE_MAPPING_FLAGS) != 0;
-- 
git-series 0.9.1

