Return-Path: <linuxppc-dev+bounces-3465-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF149D5719
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Nov 2024 02:41:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xvd9s1BK3z2xpf;
	Fri, 22 Nov 2024 12:41:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2412::60a" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732239697;
	cv=pass; b=AgS7527AVOOrDcn3qydVaAlnQFs30bJsqnCCc9rlJxaf4fnuQJ0PxWokzK/xxiVJdLweexUyxzmKrqSlfGcLjw+v8B+SMxgnC9SDWz5iPnvR7Q1JWYnQwxhRNtVEp2M3EDTJptnJlQ5woOHuFNfmJbmPvZNswaYvDCB+Qlg+eHie8P12vCJtTgEmiMsOR1iDOioTAyCiNFo11idBPBAdmTYaX534oCc295PI6EDvCPJKjbwhCiONG3zozQ6mSGLJa6csXFTcOHjOFnXvO7o4+5nMbN1ZgeUoIToYXVSlSB5MVoma9l+flwMfWV6xJnw69nnqi9tyaxdq+zW0Xpmz8A==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732239697; c=relaxed/relaxed;
	bh=MiSKhC/DzexmAjwbx3sF4Vku37jAyZrulJ1Vd2F/Mys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LZ3wSbZOZKhU8QLeMmqy9R8AQ/4ThbnhYWN61gUeuCKnoAM+sZRz+QYyeGt4+2HnEEyIM8CtJegCoQHMU9tJfk+DS+3SFhBZnj2MA500Pq93MAAEt2iNQDdRoNfAdexE3z6ZIklK+c18YbLQ4ATtNlGEuTKAmp6fYHfc4Do6bhWSNnO1yQU6oHG2kDLiUub0vTexGZhd4aZ4kVtLbXzlXZ/QbWv48eywBcLB6cDBHRXtIR891e+ZPh73ZscQUkFbL52iNg8kFZX75SPX92uzxk/apRYAmxbPrAVXuupfZ8edHJKOroXS+bRf9paNyV3tV6RRk3BRim9pAGixhixkVQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=gWozrgwZ; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2412::60a; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=gWozrgwZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2412::60a; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2060a.outbound.protection.outlook.com [IPv6:2a01:111:f403:2412::60a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xvd9r3c8Dz2xxr
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Nov 2024 12:41:36 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cNyIoyA3cQHW6lnahlQfhnRa9dZdDrQtVyyXV3H5UMizrw3Ka0YJSZP4q/npwGh1ddluWaYOyvqQGr+8hB8lVtDKjUIUmRVNV2aGTVf3Ut9d5TAFCJp7aEAxI+P+Hs+ZbfmAsoIcc0QALuAXuLw/dPqpkgP0Qi1jFQhvyk/0L14HsX7iLoNEFtuDiF0HIyruD/LklgzPQU1zIJ8AEqY2kOK5CwT2Zh8eEJ2v6C6dkJsyy1o2rF3fqrs0TJc1g0dAUxqwcVv6NU10saOqJM/YugYbbNqh0H2w7z043/ajWqAFlcW3CFEa3X+9V8pAiOXIioOQoSsFiYthFLQIqMK4vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MiSKhC/DzexmAjwbx3sF4Vku37jAyZrulJ1Vd2F/Mys=;
 b=vSliybnA+ioxNLO2q7o9dBkeFQp3v0i2wg7UfzuGWE5pSp0DDEXXduDDEECi2t4WkFCOl7PZB5vwpwZ3tk//KW51VvU+K7aOodlAEuyborC/SfOuybH60cUQLDVfTBaPvWKrNo9xyjBH+ivLY9DnPk+NroFAkumv648HQ+gVNnsQw8Ugsdn7CgpC6aQugOI9jW7XSQi6xNb1dNujSghJDWPGGgwqDdpYZ6//Zg2UNoXdV0YY4yE2VX20iEuwlCV7dUjA46T4RiXxGDXbKr5ZbypYpmGPUKj1gT1znOnf2Xd3j0GjSOUfYf7ouT7xj4vgrSMD2O3v+R3JdVkLPA3l9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MiSKhC/DzexmAjwbx3sF4Vku37jAyZrulJ1Vd2F/Mys=;
 b=gWozrgwZV65KyVKHeQUa/pwSg12GdWLPerOSDlWTM+1P3R8Ghp1eyWxAd5PBHcr9+32969XEuwBTUU2Oap5Em/zYLNOdTze3xEttWkNOfH/JnlJgvq9LDpijNERR6yFNZXmz7T+AgLKdJZg3Wthvd84IOWPLRLZtmYoiQj/rg9a+7hJJNfl8v92FXcbe8Lql7tfdQnj+KrA+XGJyVwPwsbRXbu4E8LZbLNnMDwtuUQR+58UJZes/f6sp/tNXNbUPbeVYwnrtDHik9w+nz/QDDkfpmaHeGsAG8nghAoUxOa3Chd3O3MTsoft5kHLOEPWyUMLZ+351CfsvZeSYTW4wbg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 IA1PR12MB6305.namprd12.prod.outlook.com (2603:10b6:208:3e7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.17; Fri, 22 Nov
 2024 01:41:12 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.8182.016; Fri, 22 Nov 2024
 01:41:12 +0000
From: Alistair Popple <apopple@nvidia.com>
To: dan.j.williams@intel.com,
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
	david@fromorbit.com,
	Vivek Goyal <vgoyal@redhat.com>
Subject: [PATCH v3 01/25] fuse: Fix dax truncate/punch_hole fault path
Date: Fri, 22 Nov 2024 12:40:22 +1100
Message-ID: <bdceb724f486dbaecb026aad8b224cc247a6b11e.1732239628.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.e1ebdd6cab9bde0d232c1810deacf0bae25e6707.1732239628.git-series.apopple@nvidia.com>
References: <cover.e1ebdd6cab9bde0d232c1810deacf0bae25e6707.1732239628.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SYBPR01CA0190.ausprd01.prod.outlook.com
 (2603:10c6:10:52::34) To DS0PR12MB7726.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|IA1PR12MB6305:EE_
X-MS-Office365-Filtering-Correlation-Id: 61f8c056-7dfc-451d-5a9a-08dd0a96bedf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NPTJ8tG6oj3aZQ0anSPm2zBQaJ1sUykEpXCOAzAZUisWMTqckCBZIfoRsUT1?=
 =?us-ascii?Q?Fg8dPSVEtr0zKsrhMMRb8PU7rQ0M36sKTMnXdqG21nU6Hk2R92IbB0NXqWKy?=
 =?us-ascii?Q?FhAlw1fy+qM1s0y1QTkpD2bFV1wi/Vbnqgmc3vtTajS+RUK0z6j4eCabkFy7?=
 =?us-ascii?Q?Ureq+NDPqJFKBnsC2qjVWZ0NE2wDHRR789TGoCsg1TeZv7S8P1aKe/1uprpB?=
 =?us-ascii?Q?67UbYAdCXtkaFGSx9HIbc+tk7UEcHwuq0sNr/NGyVJ0Q+pv4KZr1KsAZ/k6m?=
 =?us-ascii?Q?FncX8pxoW7C1pKE3RZ4d1n0NR24PO+osDjPWn9pGACOumCaiZeBcrmxHwj8R?=
 =?us-ascii?Q?IvRrYJhwliybTkRwl8lIFMOAtRXWbRyU61DT9XxtEw4FbFNf6HSEKmGtMW0p?=
 =?us-ascii?Q?VQkFNyobdOJ8Q09GaMPEwiSAxNzJKZ5Aa1nAxYsw0A2+LlF0O2R8FBuj4zWu?=
 =?us-ascii?Q?GTYTVRGEvC/Lrs1f/El0B16nh9xfV7/fr5blJX4fNOZFsAPpbIRwqwfg12vT?=
 =?us-ascii?Q?XInZEpgzl9qYVEUn1gUi4Vle9EStreazAct8SwV7vJ1Nvx9KBj66V2miJu1a?=
 =?us-ascii?Q?GXX2WHJq13Cdb71ZunMrQuqaJoXNUTJwmxQek9A18h4YqMKjsfeZgUzdynkf?=
 =?us-ascii?Q?J10hb4URFL/vtHeb6+7NrR/Yop2Yyf83Lg73acf/0LMhDJx55F6s0v+/xdA9?=
 =?us-ascii?Q?tZ2pRA7WEGOENXBkEYRZn4Kmn1k4OCDPiANX4RrR/S410GymkpkKl9/H7sbk?=
 =?us-ascii?Q?0VHfXBwR6yZJL8MejBfFqG5Ueem76z1qwGHeuQMOJ/h2s0WQK7kyLDQ52Jl3?=
 =?us-ascii?Q?c7iohjvn3w20Cm3/bLI7KeO2bz5qzn/Oj/WgKiOtPwg10JTj6haOE7MWl9Zw?=
 =?us-ascii?Q?x8G2YVtDtQYY8BhK+7AWG55rtkUPjathOarMlcUuBBtmKvHWhGhecaSUpApm?=
 =?us-ascii?Q?2/g2v0ukF5sM+RSY/D7ptcUSG6rR5C7TxYlcgwaNt7iUFfkN5fyFGIm3kMnm?=
 =?us-ascii?Q?ccPjBjYObTcu9K9Q7B9bZ/3Lm6uvYXtIM64IkASIttqIGkMJ98z45pfuAzhs?=
 =?us-ascii?Q?GsyVVBdfDj0p77PcxrSxq5K2RzMqWkWKqzXPmnvMvpzCaiEtUU+VLG7aWx75?=
 =?us-ascii?Q?hDaiPMJvHpIuVm+T/wr3vUu0cBogV8OQZCEhKSSu6x5mgIoxIJ5SDmlZzV7C?=
 =?us-ascii?Q?33xEkROX9ZJiB0wSrnMUWrNguOAr3YB581DMBAq3lzev7HvQIF1VIblyHo0l?=
 =?us-ascii?Q?2iMC2NkExPMURGc44D3ABvRTCkrOvkJaXlLoZOzekGJr9hZuUmTwkdEDUXfn?=
 =?us-ascii?Q?f1E=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9PeBowriKVISPg+XZjXB/CfOYHOa49E6iyTMKF9qZZyR3oP320ne6CjzN5zT?=
 =?us-ascii?Q?8ZFoDUx4LxT3oHb1kvXEq8oVO6aWxcnF+DtpWCHPyBfWafUsg0re7c3Fj2jg?=
 =?us-ascii?Q?BA4NslvCpLFMUj4Q0bhC7ulfLKg6/QYNVmo6F5zm6Th3MyLlZ+UtrU6pxA79?=
 =?us-ascii?Q?mmK0ZhmqMuk8zcwZFXNwk6UgeLpIS0FCFxkXW4sG0QWEC6QUcfu6+UYI2DqS?=
 =?us-ascii?Q?oUneZ5+jx3x5JHzBWRgrB9VJUxk1fI7r3dD26wmTIcumnf7jZP8KI67lk9M8?=
 =?us-ascii?Q?se8tYUKKO5PDP8slS0z1A+pzLnEsAcMceYm6DS+8C7HvomlZDiCW0MvUWA/p?=
 =?us-ascii?Q?4u4EetijgXsSjnHjK0zNWQPEboqGhA3ee0j34ujgVUK+gpsHgh13RmrMfR8I?=
 =?us-ascii?Q?/mnTstfDKRl09VOO554NUdldZlFhWvmT4xSZHLBkmousi5IHaPIeyL85bhUV?=
 =?us-ascii?Q?dvYM4hMUlbvwHIv4Ztr7GJdAAMoxyJRTnahC0TXaoT9/KuijBPeOgQ6pJVSF?=
 =?us-ascii?Q?KsR4MUMRSNa/1cqR1DJz3KVLcAb7xnacUqkx1ixwLLKN4RmHRVpePDFc2oSc?=
 =?us-ascii?Q?lej5F4rX8KcTcBSNPW+ogNT2KXEwrxImMR0vZWFXuClUmF72QLPeE8c90tBo?=
 =?us-ascii?Q?ZH4qOlRUuh8dd7UCGBKvoCNY/fKVPZQC3WP67HCMOjFGW2rkFVr2AWm3VF+5?=
 =?us-ascii?Q?dw1rsruL0lOw4nIJDoE8B60XWA8NK1T5uwxLk1czIRA4yqWRRXXHgQkf5ZF/?=
 =?us-ascii?Q?f3+16kESx36GzwICzty+JYTu0CYyEtAuA03l7UaQiyM6OlkifFLc7bxw1ANP?=
 =?us-ascii?Q?oZZmnX0bg8qSTVsUL5ukKKEieJ8C2AgefCaXsiSQgt8JDroLK2rTpo47fYtc?=
 =?us-ascii?Q?ejjKGmfKrWdId6Incv1MH8RFBeLu2XvwNNY5Xwc10mwaZVe4rOtxsM6/WU5V?=
 =?us-ascii?Q?Ui0ssUcc/tWhgkmNl6RhjvsO0JkYgNGDvVAIUwTkJWPZ9Kty7brYjnZpaPB5?=
 =?us-ascii?Q?FtyfKeNy/HDC44w7tYMZFEtzFcuhkFRB8Yn5tdMbQwdoc9bTBQ2b6gxrytsB?=
 =?us-ascii?Q?tR8TGTIAqDP8NNzGtb7SujHKwsef3+UlGeZ42sH+mCcVCHeUFejxY0cK5Iip?=
 =?us-ascii?Q?kcFXfV6XX29CNlKkYyK96/K5GsEPgN2DNYNBnyRdROYKwbSf2V0ijNQn/qnz?=
 =?us-ascii?Q?HAbwvA+AUui0l370cqhxKscdy2+wGlxDL2OU1ZwW4Ge1WsIo/hu2ETXmaGZc?=
 =?us-ascii?Q?co3YGWOHZ7GsnkM3C00xNNoVHqHp1pNHCeO9if1UqmKVL6TeMpzYtU1QLBcx?=
 =?us-ascii?Q?Xd8Tzy4fAEKbGYdCJIrEiTdBIwrgavA0WkaMbU2gTyJJC4c1UsiSStVqIlGd?=
 =?us-ascii?Q?ewOrB/jCvi2/L91uJwZT1hfi3Kvk0XRpTFnKm4FvHTuDKA8QC6qloseBYbOm?=
 =?us-ascii?Q?TQnvHO2RdYQozY2Ib2Z0JSmzaLNt29wkS+rTl5EO/donll1UiN7TDpBuo1KX?=
 =?us-ascii?Q?F9UludWUTBv+MKvsBzUHLiWhVNMhBcfEye80WtfBu2yirr6RbxSFT3XZg8AO?=
 =?us-ascii?Q?gvyAPH7YmsvSqmVBmvM5r3IeADmOwhwgGdql7Wkg?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61f8c056-7dfc-451d-5a9a-08dd0a96bedf
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2024 01:41:12.1704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BH8j941Oeq5Rh9qiZ4VbXwOu3n6fYBS7biU00CJXYfWMSMmaBMeCVoX2O2dNs697wmXEMHPT4rUMSe7DXfO9Ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6305
X-Spam-Status: No, score=-0.5 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

FS DAX requires file systems to call into the DAX layout prior to
unlinking inodes to ensure there is no ongoing DMA or other remote
access to the direct mapped page. The fuse file system implements
fuse_dax_break_layouts() to do this which includes a comment
indicating that passing dmap_end == 0 leads to unmapping of the whole
file.

However this is not true - passing dmap_end == 0 will not unmap
anything before dmap_start, and further more
dax_layout_busy_page_range() will not scan any of the range to see if
there maybe ongoing DMA access to the range. Fix this by checking for
dmap_end == 0 in fuse_dax_break_layouts() and pass the entire file
range to dax_layout_busy_page_range().

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Fixes: 6ae330cad6ef ("virtiofs: serialize truncate/punch_hole and dax fault path")
Cc: Vivek Goyal <vgoyal@redhat.com>

---

I am not at all familiar with the fuse file system driver so I have no
idea if the comment is relevant or not and whether the documented
behaviour for dmap_end == 0 is ever relied upon. However this seemed
like the safest fix unless someone more familiar with fuse can confirm
that dmap_end == 0 is never used.
---
 fs/fuse/dax.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/fuse/dax.c b/fs/fuse/dax.c
index 12ef91d..501a097 100644
--- a/fs/fuse/dax.c
+++ b/fs/fuse/dax.c
@@ -693,6 +693,10 @@ int fuse_dax_break_layouts(struct inode *inode, u64 dmap_start,
 		ret = __fuse_dax_break_layouts(inode, &retry, dmap_start,
 					       dmap_end);
 	} while (ret == 0 && retry);
+	if (!dmap_end) {
+		dmap_start = 0;
+		dmap_end = LLONG_MAX;
+	}
 
 	return ret;
 }
-- 
git-series 0.9.1

