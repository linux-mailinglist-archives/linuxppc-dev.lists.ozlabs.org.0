Return-Path: <linuxppc-dev+bounces-4222-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE819F41F6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Dec 2024 06:14:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YC4jG6pypz304C;
	Tue, 17 Dec 2024 16:13:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2415::614" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734412434;
	cv=pass; b=QZWMKBWUt3I9AhHbPtXd0LhypqeNq7SeZ0Y3mDUYiL8Fv6zuLUhU99aDjVJfaFEKjGvd6q9CtS8aMNZBRR33SYk7r/hvfEGMCAD8A5mCD3hdigMJM2Ho/1eXz5T3OovhFsiMYN8HygmHSDDR0NiJtYamFjLOXTzwvO82uWg7LFeS0LXKCNommT8NGXXz1LsSs79hJ5mqvEW5TAGp0KW59KU0kNTamuzdDiUYFiCNBsNZ1GQhzqcHDEHFSI/82/sOdZ3/duASe8slTKRLZpXNl16dT3E9gwgRV/djmSULtSNxzjYXSd0iZ10k8h8wfhvdgOqy1uAifa6iDFoYcNubwQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734412434; c=relaxed/relaxed;
	bh=fr+IvtDG4tlBRjnd4t0ov6kscjwRm8udTIzF1grJaok=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=h30h0I5yYtbCfF/76PN4cv+Yv+kEt6i+9f6X1SlvibdLTQMmKCSRCBYdZvXR8ZFlgrIJHH0VnNPASG+FD+i6y4bA8Eu205IXLxuSymCSZv/iYLrzthfPInKN7+rAHYyVj/ECm0zHOkDiIR6AaKNcZdKnCXEXI8DWnuExydEoqT8ox2PP7c1ioe8cAbMH5B7PKMakKDALEf7ImRtIGkc44PxEntcP+R3ImepK1xk5+VrqouLqvy8TEoeZXQUESxiMjE7HswuXHV7fWljzCdMWJHbfZOdbalzrQYIUz9pMfewJVw2IsVCCdfaX9rZ1goFNST2TcUwy9BsGOcDxokKL7A==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Uzwh4mY1; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2415::614; helo=nam11-dm6-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Uzwh4mY1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2415::614; helo=nam11-dm6-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on20614.outbound.protection.outlook.com [IPv6:2a01:111:f403:2415::614])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YC4jG2tqlz305P
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Dec 2024 16:13:54 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AQEc8LQ5pP3TFj8N1k6l4+qBmM1QDPwhz7S+GP0vHhMSJ8TLX/3ftRu2NLrMWci7jiMbT0dNYrnAG+F9Y+CRsv2ubzH/f51ZsH+59/XxjGtxslXohMfm2cTt7GN0u6GalxOmV8if/i6yec0yr4mMWEg1kh2ERlP7rMJmY0UBkLrglc7tA5fnwSPauf4zH83Q0q2/5Hoj/2C/zeqlEECVAF5ujRJhe19HdAgPJzFHvlIuIB9KEPKmfT+IOw8VCLWejhS30OKPVq7DdCsW+YGAAJ1mqHryj8mrIUZx3uQjxUwYUXvXXXpcQ7lpe7rma6ZXpJAqq1aQMo2oV2kjNvqq8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fr+IvtDG4tlBRjnd4t0ov6kscjwRm8udTIzF1grJaok=;
 b=HQD5Xcq5M6ArMKL+Np+Sdj/SjEYjdsOJHWKsGmLm9VIZfhNDRs3X6OQqKugVv18qPR2sNpQGIeGhGs2B445YRl9KcDnPGDLI84sCPA994Si/kt5BjbKfOmdVVIr3NTY1iyCkZprd7beyjxfM1KwTjg3BwYmT1wctGNPUsyEcaesLb3pAVycjZMkFZCMc6tshhNizEZd2N+LPZLjfsnO0a3kkm66+J8AjQYhwP3ftesFtVGbWuzfCA41fSQ8P9lrJkrEyqPCtY/kLmolfOUYJNbX3GMiLhbxEpzaOSQGS6hz0NxQPQkIoOPXlQ7waFvaUIi6jDAcRyqCjbTLicIewPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fr+IvtDG4tlBRjnd4t0ov6kscjwRm8udTIzF1grJaok=;
 b=Uzwh4mY1bQJRKpWPpF8fusvvpTHIF9SZd+H+Iwz+UvZj5s5BYGG286Ov98Odu5nAr2MqlftgNAVdZcFu1GaFBeoLe/nd/dMwMQcIByQygPYKLNNvxHMx4BID/TOxlnG53RXVX6meXkhe3v9Brz2N91XLXPKQd4QTFf5ehxG5BRR8megyw3Myx44MXZf+Mhzd08197bCDOT/w2FP0ucmm8+FH7kxQ8jbpFhU5PmukZrxPN5MGGHJAE9erF7xC0doNs3PCQ8uRO77b4IDcY0HzNMTAMmz63BZjQp5ugbUEs1Cc7INmttao/ina7eR7twzOaJEBAIjAvOeAvnaqRc4glg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 CH3PR12MB8936.namprd12.prod.outlook.com (2603:10b6:610:179::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Tue, 17 Dec
 2024 05:13:48 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 05:13:48 +0000
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
Subject: [PATCH v4 04/25] fs/dax: Refactor wait for dax idle page
Date: Tue, 17 Dec 2024 16:12:47 +1100
Message-ID: <62a85767a21fb76b548801a002a85c7831e8e25c.1734407924.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.18cbcff3638c6aacc051c44533ebc6c002bf2bd9.1734407924.git-series.apopple@nvidia.com>
References: <cover.18cbcff3638c6aacc051c44533ebc6c002bf2bd9.1734407924.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY5PR01CA0047.ausprd01.prod.outlook.com
 (2603:10c6:10:1fc::9) To DS0PR12MB7726.namprd12.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 08b0dd21-bf0a-4f3e-d3de-08dd1e59966f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xRHfboL8jp9t8g+DH5rgij/57/HpF2BjN4AJccRpudabCufimCQebEoCwhu8?=
 =?us-ascii?Q?azTjcY2OafxWzFXde5aKDFF5sVDWIYqtm1Yr3No3Vhc8C9zQtBb0ZsIr8oLx?=
 =?us-ascii?Q?FkZHfNGz2f7dIxHZu+rclyf65mdtWejGR0Wvckr753fIiPWmx6RxA4QbP8qA?=
 =?us-ascii?Q?ebVIGSB+RG2It7gsNR9Ik69l4oNkkgX+uDGk2zLFnAyTKKGrZKc5GhY5l/CV?=
 =?us-ascii?Q?FrW6jmQsLEI8bXoIOFnSrCbFZyy0+W+Tm4EYu7LOGcAPw64nRkuPfAWxzjcI?=
 =?us-ascii?Q?15GaiLvE331dZFqKRESe/b9jAT24jvRoLHinsSSKQGLKq2AWLbYGzFNgbnHN?=
 =?us-ascii?Q?xCrYTovUj7vNSebAMFX+k9//sh6ivh66w6Z2OElp3YkbfxUfzcpAdRq03zLi?=
 =?us-ascii?Q?PdvMi2UqsCEVZbFCFxxdRVWLNjQizxLiQiVFJF4V7StjBj+TBtyzI/zhKFiJ?=
 =?us-ascii?Q?rApqJGb5upPfhw/DDJFmir//8Hit5H+T1ChVPmbUaWYYsf3CUtRoXAUT/uuJ?=
 =?us-ascii?Q?yndP1/xK9OYTLMYgUuvwuKEEhJzst/+8QE/101jtmNUm7fIJcsWOkH1cOo+y?=
 =?us-ascii?Q?He4EwDc9MiYxumcyNjDbLSx0A8zXTU4wypy++Rua1af7zxuZTgCJG+6zqWQn?=
 =?us-ascii?Q?zYRp15bJxPYqQrKeb8Y22oyREgXBcPi49+BTnvcQmkSEh5mLsSXIN15DFEwb?=
 =?us-ascii?Q?i1AxUE+2udSTreDHoyIyQdIwib2GSYyWX/Nc/TUYCADOftqErhR3QogHOgZf?=
 =?us-ascii?Q?gwx+zRp/QMRnHk/KApY6XzZ20nNpyh+hs6hATXuztQ6AwCy938D2DY/fkgYj?=
 =?us-ascii?Q?fGnQUlf1ebrFpuLeXelFK3ZqJ0Mz60hWNbEoYa31fsD5EfOQ950FY2TMXrh0?=
 =?us-ascii?Q?Wz8XIR05wWTIynR7HsoK6D4kE75Xu7BRq/eUYy8Qz3zYEXsYLKV+7D79aPe4?=
 =?us-ascii?Q?CALIYfludDkMp7RJX5TnOzCaNNDr0+YE769xI2Toyg/rcO+BKMJ9MG1cdewz?=
 =?us-ascii?Q?oxjPKkHGbBI4ZbguQx59w669/I5/7zQB38oxWWdHAak/FHpYJJfrGRELz7vR?=
 =?us-ascii?Q?E65Io/Of2FKNDS/CM0YDNs7qLFuuqtQ/2s5un9FHNEDu8Gx0tGxmXgTtoS6E?=
 =?us-ascii?Q?XT6TbRSZffvCf4mlcqVRekuy0/IZnEqmrRTqrXkFwM73JrORPBcKZFcE3uZO?=
 =?us-ascii?Q?evLYYNmaDyRzed1unrxXnkhWzJpbfEX/GL0LQ9sPJhzbvJQwsguouiKM9yOB?=
 =?us-ascii?Q?e0T0DtnxmyqbXt3aOBr3a7AJzIfZbRlTKsCZDuMZfLavz8EQ6LOXQhdGyxiU?=
 =?us-ascii?Q?ZLqd2py2A7V4ucF58AfvIPlQGU/g0qPIXvJnGYTGzByJu2klFjhX371l0DvT?=
 =?us-ascii?Q?UcLR5DfaXSXqp5U0qEXJu+V2ruyG?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QLiRVcc470yxys26mmzm3/aAnIYti6nktJ0FJ9tQqr1iRyBdo7tLXn5wSH8z?=
 =?us-ascii?Q?dSfHhWhidjL1zSvm4TrH4w3qXKLjnM+qNNN3xd6mLJyQsgAh66PAMJKCLSzC?=
 =?us-ascii?Q?JtDo1CmvCUbmYeEKCnMSMfQrH0Ara0OLqODEErRVTACy0EGbdBWYJR8Ey9cV?=
 =?us-ascii?Q?CcvGoyqmvqcUBIzk+xYfg+RAONoXUW74TmlLJqYf+yM2QSB3m3DGJIgDAXaJ?=
 =?us-ascii?Q?UuNluIEptU+5ZmcHxWqQ3jZhA067laUyElEuCxnSQHW+0CBPgh9JLuDfjPqj?=
 =?us-ascii?Q?1EcGlUwpA/QsvFmrG+d958AKO5smMaEtXn6S9/0wd/5M/wEivE56aVfdMoGN?=
 =?us-ascii?Q?EsnNZFp4B059a2QmYQXxCHmY3qjvZloeqN2F8S0f6z1SZaC70C2BAENSYOqI?=
 =?us-ascii?Q?1dUGQdsbCKhhBPK4TI4+MWGzFjyxw4jPTQ0+3aRBsalN8pHLxOKFgdkI9TeO?=
 =?us-ascii?Q?JUIi1Eb2Y6ac/1SoEwR25+AKFhsoZiiQIuAAO53wdz2jocLDXQAnDYDavNIG?=
 =?us-ascii?Q?oURWu/a9UOfFiDnQ3xVAXN5Sr8zj6aR2Kj8wevkyuMpIik8czrFYUXg1g0NT?=
 =?us-ascii?Q?GAXZRnw9+NkWyKc1sqL0+5R8Lg19PF2Qfje/dIjERjmuyz5/ti3Ry55cbsXo?=
 =?us-ascii?Q?t1dfOnZ2Sp0EzchS04stFk8Ws0cCRdUpwCO1y5OiHOgzCVR+eWm606jJnCxo?=
 =?us-ascii?Q?jOYbHpWq6tJB0S9rwtlTHMir4Ef0LBRF6r5QpYXwU5wUkOI1JXSTcX6EZfv7?=
 =?us-ascii?Q?degeI7knSQEtME61wTT8TLnlSKSPcXCgw4NWwgrJIg3uOGvNTuwzThE7blTQ?=
 =?us-ascii?Q?CyzhhptzYvJjzc8xc1NmuP+62NZTKLSIv4QJLFLAGFwjkMMq87dGShGQWhGm?=
 =?us-ascii?Q?DSz3p84VirCu+PnXyJp6ZpTMcAMkDntw/ss6xsIUB2rxgGbzYPaiAMeBr3FU?=
 =?us-ascii?Q?HaqsDltffAiZ8NuVy+aNGrw8raKLUOvLfqSengGExNwlMl8uYmgUVyKBpkUg?=
 =?us-ascii?Q?GGsXLxzs9PzfIVhhpnU/ZkBbTWit1UO48Pz8Nyu6OyRnH9x9OskqMS/OE34P?=
 =?us-ascii?Q?EGXD831b1srq6/LYqLybUBpK8HsQ7v1U3ed55qzFfNx0DVWWc7gJ2A0nqBKg?=
 =?us-ascii?Q?WfBxDtyfjcw4lNWoY36FAWIgcGJidzANMQFNqihsgb4EG7vRjj61YhObZS/+?=
 =?us-ascii?Q?ujQW5LaGapA/weTv+V/fbHWtDXbkm8MfAGc/gHyAwO867pxZ4/cuXNInoWhU?=
 =?us-ascii?Q?ZWckno61ogjnN/xUV3x3/HglUGbSJJoD8VoCChBheG3179ROaBeXrvSa5vZw?=
 =?us-ascii?Q?VMFwkn1lk4AqHq8zI6RjMRI+PfAAe+zDaMeX8Hmz2EI2MaC6xd/iX657i3CD?=
 =?us-ascii?Q?Uxyts3eFReFOaYirCWngkDqNbDQV1u5EFb0+Zagodhp1rlCoyTVDpftsjN2X?=
 =?us-ascii?Q?plh49utDuHNc0icO1AbkHH4HKQIl42q7jtrCVw5QsBpRVfvXxDbe8ntotA//?=
 =?us-ascii?Q?LT0rzqKWfkDzWf0OOCn3MK8uifexxLztri2o0RscbSkrW+RAt9UHhqoXWprD?=
 =?us-ascii?Q?5vd/Cv7IitcQCQ5dG2fRn87eSz0XIFhcjZ/WUM2C?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08b0dd21-bf0a-4f3e-d3de-08dd1e59966f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 05:13:48.4210
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Vmb+tfF020UXtxVXbesMdKgZjh8JDjKLYoEDW/WanNGhyMPy2SjZXrNglWqLNOjHYRzZQvq/9AFsTGnFFSaaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8936
X-Spam-Status: No, score=-0.5 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

A FS DAX page is considered idle when its refcount drops to one. This
is currently open-coded in all file systems supporting FS DAX. Move
the idle detection to a common function to make future changes easier.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Reviewed-by: Jan Kara <jack@suse.cz>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Dan Williams <dan.j.williams@intel.com>
Acked-by: Theodore Ts'o <tytso@mit.edu>
---
 fs/ext4/inode.c     | 5 +----
 fs/fuse/dax.c       | 4 +---
 fs/xfs/xfs_inode.c  | 4 +---
 include/linux/dax.h | 8 ++++++++
 4 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index 7c54ae5..cc1acb1 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -3922,10 +3922,7 @@ int ext4_break_layouts(struct inode *inode)
 		if (!page)
 			return 0;
 
-		error = ___wait_var_event(&page->_refcount,
-				atomic_read(&page->_refcount) == 1,
-				TASK_INTERRUPTIBLE, 0, 0,
-				ext4_wait_dax_page(inode));
+		error = dax_wait_page_idle(page, ext4_wait_dax_page, inode);
 	} while (error == 0);
 
 	return error;
diff --git a/fs/fuse/dax.c b/fs/fuse/dax.c
index c5d1fea..d156c55 100644
--- a/fs/fuse/dax.c
+++ b/fs/fuse/dax.c
@@ -676,9 +676,7 @@ static int __fuse_dax_break_layouts(struct inode *inode, bool *retry,
 		return 0;
 
 	*retry = true;
-	return ___wait_var_event(&page->_refcount,
-			atomic_read(&page->_refcount) == 1, TASK_INTERRUPTIBLE,
-			0, 0, fuse_wait_dax_page(inode));
+	return dax_wait_page_idle(page, fuse_wait_dax_page, inode);
 }
 
 /* dmap_end == 0 leads to unmapping of whole file */
diff --git a/fs/xfs/xfs_inode.c b/fs/xfs/xfs_inode.c
index c8ad260..42ea203 100644
--- a/fs/xfs/xfs_inode.c
+++ b/fs/xfs/xfs_inode.c
@@ -3000,9 +3000,7 @@ xfs_break_dax_layouts(
 		return 0;
 
 	*retry = true;
-	return ___wait_var_event(&page->_refcount,
-			atomic_read(&page->_refcount) == 1, TASK_INTERRUPTIBLE,
-			0, 0, xfs_wait_dax_page(inode));
+	return dax_wait_page_idle(page, xfs_wait_dax_page, inode);
 }
 
 int
diff --git a/include/linux/dax.h b/include/linux/dax.h
index df41a00..9b1ce98 100644
--- a/include/linux/dax.h
+++ b/include/linux/dax.h
@@ -207,6 +207,14 @@ int dax_zero_range(struct inode *inode, loff_t pos, loff_t len, bool *did_zero,
 int dax_truncate_page(struct inode *inode, loff_t pos, bool *did_zero,
 		const struct iomap_ops *ops);
 
+static inline int dax_wait_page_idle(struct page *page,
+				void (cb)(struct inode *),
+				struct inode *inode)
+{
+	return ___wait_var_event(page, page_ref_count(page) == 1,
+				TASK_INTERRUPTIBLE, 0, 0, cb(inode));
+}
+
 #if IS_ENABLED(CONFIG_DAX)
 int dax_read_lock(void);
 void dax_read_unlock(int id);
-- 
git-series 0.9.1

