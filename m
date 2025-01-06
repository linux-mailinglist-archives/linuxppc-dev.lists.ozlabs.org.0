Return-Path: <linuxppc-dev+bounces-4676-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC68A01D38
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jan 2025 03:08:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YRHf90Tf4z2xs7;
	Mon,  6 Jan 2025 13:08:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2412::602" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736129312;
	cv=pass; b=GhUqUGQ5VT/cpHiDOozQBN2qzGZ5JO4fOXixr/FMrfTYKVTMLIT3QpuCL5dgQWS88ALiMyJPhCAUD8hk9B5evH62tkpHmY3vcEosIHbkk8Zy3aLR/1OmXnZyiFF5UxQlG3Bv/wzHTXs0jqB704e/KfL8fg6G4VwEEgMp738Xz6O7k/jH5PBVX6LygcJdRpsulaKx9gQ94fg2XbLoG1txwKQGidIZMHqgOTwetr7RYBy/OvPYcNZlUTnpn7RpBOYGeBshGIxxIWvqwzWLv4Zmvzjw/quBp8FtOyCKUC5KFwkoQRGYroldmiG25a3Avux4Jb3rxL8fLruVB1u4t6Oy4w==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736129312; c=relaxed/relaxed;
	bh=+hVCHEIpUQo/vZQnBNIGnZKWwYd0e1IulxgIyqJo8LQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=P96XR4bJ94DsO/Uw1aQnqIGIu68USUa4N+jM2z47KJQ4b1x/aYIwuyns5wUqD6itO7WxUx5+NKcq9ELlOdxNsi1Dw7bmyNCpsfYKTqvHdME3dgvP0q3zFri4uwccjmAjYcnFp7xgPw+If0DYA3Wcb/XE7pm/TSd31y+0QhQhDxgJfTp1Mjip2c3CmDMLqAYjHicdhGLYO60of8bxu3hTg5eTRUW4eyOcm5DSTJ8RRtR+MciH/5D7CCtG49fTAU850QouZBBwwuc7vAC3MwKAsqeoPw7Zy7RrPw1CNFgE4+JDb5NEQ+BrM3sq/7CgiZt9NIJVNdaKB4KxAoIOgQkRzQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=EgfET40I; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2412::602; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=EgfET40I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2412::602; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on20602.outbound.protection.outlook.com [IPv6:2a01:111:f403:2412::602])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YRHf72lSzz2xrJ
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jan 2025 13:08:29 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WAFcRxq93vRwrcwye+FyFzV862X2ra6DyYsWlwl3R7oe1uijUkQBjC7uD1A7kOdU80LJmVN/urDCMP41CxbOFs3TPDdyQF9EQOLkKcdFS8XfMMRVasCTY/t+IF+OE+9DXiJ3K+BECP06bmz6woqckVwgox30YLTSc1y/EXY+NieTIhmW0yg2f62em6m0tvrUm6K54b9cQjD6Z2A5bGsX5G6bwbzyt04szTHNRpd/d5sArYGZb8v3xyAdtdubnhp1vwHZRoKmtUvmKuYxcozimeEZgvlxdrzKw4n9qPC+xyty/aGbE//KdJzIUPGRIuVmcjKgQVRapAPxibByHLCYbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+hVCHEIpUQo/vZQnBNIGnZKWwYd0e1IulxgIyqJo8LQ=;
 b=YB8ZFqFL6QhV6HQ5Gw9ZQk6/3EPIi/UbyhN/xFjhaAyhAWS4yovz/cfsI2Z0OUcSOBuV2cAB/VduGd1W0q1zw7oMD6nkTR3/5AsBFYv7QS1dFf03AV1YnW64BHvLuhx+bvZqKLG2L8rV16/EmRVpdbgYl+z4HhRwPdKpnGvk/nei0MPFnlJaqOS+bVXXW11LlwVgIJXL85j0jVKXsmAPv1zhATCgeIrUMecr1W3qXidjkQFWBQjwjR021wyw5ANMhKxo20iiUdOLhabsKIIwb4HFlwBnP3D0x9vGCuUmcGHCoj07q1yM2ZPWixSSq2vR0zfInPGhEYpzJhaap1/lfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+hVCHEIpUQo/vZQnBNIGnZKWwYd0e1IulxgIyqJo8LQ=;
 b=EgfET40ItMcHaTZagsuS3cl5jJXG6VNU8LGrXddmnFcY0yXsiDZ0jkT6GzyjNH1975tqBYkSq5x0kPzVhKisgsjH/rBRVeuGitzYKfBiACRbCKNGrkDlWfwZuiqnHAeeUK+rc0fTmriU+/CcO/ZsQ886IPUYqXSDkvz754mT5ZHUpuQWx4IGHUqr7I1KWjB0L7U1JyXWpjwS/pP6W36mQqEtkCxAklvQ3CBCJ80qDYB7mx0rnFwNMA8j9iCrgjJWYHXCeeCtV/aVFV3tGe4HCrSrucOniJOkDmu2ewtkYLe/x9xnDcYCq7lPGj9CZLOIQw+FuJpoEEjP+aX9IxmCZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 LV8PR12MB9153.namprd12.prod.outlook.com (2603:10b6:408:185::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Mon, 6 Jan
 2025 02:08:05 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%6]) with mapi id 15.20.8314.015; Mon, 6 Jan 2025
 02:08:04 +0000
Date: Mon, 6 Jan 2025 13:07:58 +1100
From: Alistair Popple <apopple@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Cc: akpm@linux-foundation.org, dan.j.williams@intel.com, 
	linux-mm@kvack.org, lina@asahilina.net, zhang.lyra@gmail.com, 
	gerald.schaefer@linux.ibm.com, vishal.l.verma@intel.com, dave.jiang@intel.com, 
	logang@deltatee.com, bhelgaas@google.com, jack@suse.cz, jgg@ziepe.ca, 
	catalin.marinas@arm.com, will@kernel.org, mpe@ellerman.id.au, npiggin@gmail.com, 
	dave.hansen@linux.intel.com, ira.weiny@intel.com, willy@infradead.org, djwong@kernel.org, 
	tytso@mit.edu, linmiaohe@huawei.com, peterx@redhat.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, nvdimm@lists.linux.dev, 
	linux-cxl@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org, 
	linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de, david@fromorbit.com
Subject: Re: [PATCH v4 12/25] mm/memory: Enhance
 insert_page_into_pte_locked() to create writable mappings
Message-ID: <gjuqvidcpvzwqrwogeoygwnsbvlpa4fvsvaoq6rlfzcq4wxmh5@tdhz3f2fm4ga>
References: <cover.18cbcff3638c6aacc051c44533ebc6c002bf2bd9.1734407924.git-series.apopple@nvidia.com>
 <25a23433cb70f0fe6af92042eb71e962fcbf092b.1734407924.git-series.apopple@nvidia.com>
 <d4d32e17-d8e2-4447-bd33-af41e89a528f@redhat.com>
 <6254ce2c-4a47-4501-b518-dedaddcbf91a@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6254ce2c-4a47-4501-b518-dedaddcbf91a@redhat.com>
X-ClientProxiedBy: SYBPR01CA0195.ausprd01.prod.outlook.com
 (2603:10c6:10:16::15) To DS0PR12MB7726.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|LV8PR12MB9153:EE_
X-MS-Office365-Filtering-Correlation-Id: 08099fd0-03a1-4238-e1bf-08dd2df6f412
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cITYSKQRF4nAAZv0ungvDBV7dDs1xhblmZ6R0EiAGsQbmQO75Km7ORqygUyl?=
 =?us-ascii?Q?N4Ez9UerIUCk0akdzCATTbjKkgtlofvCdQp0Pg6BZfrjX6Y0ARREu+91ZBTD?=
 =?us-ascii?Q?stz2p1We5+fHxoRzeXKG+3ZmI2zyGVhplec8E4tDH3HEkUxABC1/nmXDrgBb?=
 =?us-ascii?Q?Y3p8NUi0l0+C4GLliejn8IxexX3wmTV06vbER06hkE8lANuVv1oYdoJFz9Vb?=
 =?us-ascii?Q?7ITy+q5Ec1c9RJ9XACcOG5vnWUlHbfxU5dw5PT5FzlZYGyZKyDseuV5gFwwc?=
 =?us-ascii?Q?QqDhwFSJ7ngTBGwtS/8weWSLMcExMZlWMY12tgwa6nVR5FGbvdIgyWzVpJnm?=
 =?us-ascii?Q?/M/Q07IvGQDRXNxNxnUDKkqXHhQ5sXaF0haARVyPE+ZFlq1+PmPnS7Wvm+kc?=
 =?us-ascii?Q?pLH7snVDrrLMWrMG3uSdDaWt/Oler07VUSJDKbk8bNDZQob+Kzj1ks9/vgTn?=
 =?us-ascii?Q?S0Z7fCDWs/9m2FanqpCadhfyZoBRlXmjlrNV7aqqIhBtB/BHe/J2rhVHF76N?=
 =?us-ascii?Q?XfV8iM//Ngo5guQLEfATL2egbYD45SK5X5gNj/PXOjYpBEMeirggTg9MO9un?=
 =?us-ascii?Q?wcUYSPAJC0caVfK3zP3gia5voFVN2To2wXBI1wVadHnIjHLHC5/xBOzbGT9S?=
 =?us-ascii?Q?jUo4o+LGnt2zQP3SEoPKSH9ajKPMsmtKYvGpjfUWYk65+hMp5bIK/IfWqIQI?=
 =?us-ascii?Q?xasFWzGESh4LU2WDGqn4Fh5xdnACf8O1dZeWXoXv2/l5i/EoCzgb1JtWFhFQ?=
 =?us-ascii?Q?UubZQ+53CM1ozbFEdbMxenuNadxO5du3HchMQyO4kace0QJcIgEs8L71kRwe?=
 =?us-ascii?Q?5tU9LAUj5TvcBjXtUIs+9V203JRq3bvyK1XDZA1zVZUtpk5lVjb6KM3b7tUf?=
 =?us-ascii?Q?PyPrFQlUR3eW0HiWDJFd+Qs5sUVfQRcOnc5nmMupuPpdYTwMT3GA0um7LgEO?=
 =?us-ascii?Q?ArJYaIdA9mtNn/nv7iNjQGIjdjr7xyP0hRWP31jzJquwFrwl9hL0mKGfC3ZN?=
 =?us-ascii?Q?vwsDOb14XIsYwXFfuCUF/iFEyARwa8iF1S3YugsO0vnD+DLtXJIfci6ibP6i?=
 =?us-ascii?Q?FKutS/8nENuhfjSnn+r4dorgdDW+ea0pQnDiGn7yFoq4r5t329DX/6AJCOD7?=
 =?us-ascii?Q?2rwuNLsWGrT8UwBG1dH3oisUKGwFVEKGawNQCjNNM/MPuk10+3DLhRRryTPv?=
 =?us-ascii?Q?y/W8Z+SOBtPcxEuijutFRlWcSP9+xQgYOHYrmuzN3FLL6SAj1Siz9r88z1AB?=
 =?us-ascii?Q?RLhP48AgX6JN5RdXOuEZQu2vNnCthPv4fknwvr4iXO2vgQOyGWkWeXWQZ8lw?=
 =?us-ascii?Q?4g7/JKxvKXPdfmp6Tr1mPXc+gcs+IjDVo8SkfTAU7M85Z/fpvOPmRuHoaCaV?=
 =?us-ascii?Q?8Xdwx8aLw54VbNqD5VeDd7aEFowt?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?M4ArkhiKeKcwE60YDeOiSSW/y4eGefoZnfBhoj0Kj/yHFBfE3H4IgmbMsMxo?=
 =?us-ascii?Q?STDYqhw9IVvL8AR1i/YEeoyEUV1Q3Y9MC5TsSd2KPC23njqNQHcp37EysH1W?=
 =?us-ascii?Q?iq1GTPyDTIvzBTJO8vOWENnpiOOWsCH++Xx5XJlL5UBXF+aZt8igdJk4Wtpl?=
 =?us-ascii?Q?q1SzjaghYWp/3uJbr3wZSh8O/iMaa2H/qIigyz1Ury5kZbSJdMxYM7oIOHdm?=
 =?us-ascii?Q?R3aNfVU2y0yWo4RE0JrQNMtuXGtd43OJOWVx0thjYSTPE8H6aTdMbqXMS6SE?=
 =?us-ascii?Q?lryov6Nqp26TEuAlCP33BmJHQEBcQb8goqNx7oWna6MS4uV0+1qeR0Fva4n8?=
 =?us-ascii?Q?AmhyBMD5Aous9SksPsTrYLnlL759EO1t9OS+Gp+CBS7KNtZ9/fMAh9N99NRM?=
 =?us-ascii?Q?HBBgxStDWsWA93vBpLGY8aiWMqd7Y0OwlIe+thQY797CizwSSUm98XvOIlp1?=
 =?us-ascii?Q?9pF8M5+1PNQ2EH3Ve5RpZrGhR7xNl4k/1fwGe4/yINDIDhCZ+RXJmRaHEYAR?=
 =?us-ascii?Q?DzC0ELcX0uykleX32i+X21rpxkMHTUtKfjG5oQFe1uLyKOdG2sHTfMbeN1c6?=
 =?us-ascii?Q?m8ffN1FMRG5BFy87K0cC0hQ2yQJeexYGw37jiM4X8egegUsLhPniBazYXv+C?=
 =?us-ascii?Q?qttojlgtimt6AUYLkyXv+G40/qR9tX4EKwo+hG9OunYH2BkkAHF2wd09+Y/R?=
 =?us-ascii?Q?VOJ1Sng6DojNCxIP2qaJup+ZDr71QEYTwgGa/E4yyvKdAbz5YS8ZSA+MbFYJ?=
 =?us-ascii?Q?cvwBa4m+2BbGzAIgvnsylmoWPfglk6Hx4o90FtnUARw4T4YdLWq96ZDXENAK?=
 =?us-ascii?Q?Wd7Q2ii553hSD01XabWGYNVN4ngY4Fp2arCsQfY20XcFOTkU5SYmCYLYDQ9W?=
 =?us-ascii?Q?KqYxR58e45UaWbHsXFbSE6MDwFPj5/qp3Z9FQ4gUQ6/2I41724Id2KzaSyet?=
 =?us-ascii?Q?taomf1vhhd6sN7eAPKI1uNQjLFwvO7Z+TcaxG2i22Rn4mG4mj3CHMKWCI1bq?=
 =?us-ascii?Q?RaTX6Cys3seqRv4waUZqS84VM/rZVCbVMGAjmHIPvECEX5AahgtWO0BIFYcj?=
 =?us-ascii?Q?sB2NfGtRGf5kTzPnhFWO76IBkNK1YZiMzJ6DVwrNw/q5fCXGWxENsAsSNpDa?=
 =?us-ascii?Q?2487oA9cOamZqF1+m6AEKKilBPp/blYzg3NfnlHDN1wp1IoeoVFGidJ1hW7h?=
 =?us-ascii?Q?mK3/bN0JTaqcIVrTnzIHoUXwy041eUYlSC38waKccMddVKp7bSqMojdvlp9q?=
 =?us-ascii?Q?pbU9QQE5iIhdAa4wsrMT/+AgUVLt2w8oB2M2GLmDb98T/mTKqtzIO4h56jxV?=
 =?us-ascii?Q?LvpqhgImUfdxNPdX9DSbSvQt5UMoC7cbFy5iGzdlViWerfQa0a4GnFrLQarX?=
 =?us-ascii?Q?C3IoOCsj4gDoyBZwARmqmSTmQ3y0pSzsDAtrJd60x/2T2hAWUpYNkObAPEYt?=
 =?us-ascii?Q?3K3TUtp8AyGNVemeraT5v5vapYA1gxJIvjxN81NvEDSPSJWMoOOlW0IcAolr?=
 =?us-ascii?Q?BSOyDdLydjDBVAxtVN69gqRY8N2QqScbQaIg8nBmrAuuDjKKTAmycUDdX0tP?=
 =?us-ascii?Q?cRIRfNXUscWWnJzAPVucGAga7zhXcnjaA5oj8VA6?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08099fd0-03a1-4238-e1bf-08dd2df6f412
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2025 02:08:04.0496
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /lTVVfB5+rvnN3cylkXTbKpEYyqnhxz1lGso175z+6KC3GX4bxhU/2J8CLYswfgFjFKifu2ebNRB9y9t0zfS/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9153
X-Spam-Status: No, score=-0.5 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Dec 20, 2024 at 08:06:48PM +0100, David Hildenbrand wrote:
> On 20.12.24 20:01, David Hildenbrand wrote:
> > On 17.12.24 06:12, Alistair Popple wrote:
> > > In preparation for using insert_page() for DAX, enhance
> > > insert_page_into_pte_locked() to handle establishing writable
> > > mappings.  Recall that DAX returns VM_FAULT_NOPAGE after installing a
> > > PTE which bypasses the typical set_pte_range() in finish_fault.
> > > 
> > > Signed-off-by: Alistair Popple <apopple@nvidia.com>
> > > Suggested-by: Dan Williams <dan.j.williams@intel.com>
> > > 
> > > ---
> > > 
> > > Changes since v2:
> > > 
> > >    - New patch split out from "mm/memory: Add dax_insert_pfn"
> > > ---
> > >    mm/memory.c | 45 +++++++++++++++++++++++++++++++++++++--------
> > >    1 file changed, 37 insertions(+), 8 deletions(-)
> > > 
> > > diff --git a/mm/memory.c b/mm/memory.c
> > > index 06bb29e..cd82952 100644
> > > --- a/mm/memory.c
> > > +++ b/mm/memory.c
> > > @@ -2126,19 +2126,47 @@ static int validate_page_before_insert(struct vm_area_struct *vma,
> > >    }
> > >    static int insert_page_into_pte_locked(struct vm_area_struct *vma, pte_t *pte,
> > > -			unsigned long addr, struct page *page, pgprot_t prot)
> > > +				unsigned long addr, struct page *page,
> > > +				pgprot_t prot, bool mkwrite)
> > >    {
> > >    	struct folio *folio = page_folio(page);
> > > +	pte_t entry = ptep_get(pte);
> > >    	pte_t pteval;
> > > -	if (!pte_none(ptep_get(pte)))
> > > -		return -EBUSY;
> > > +	if (!pte_none(entry)) {
> > > +		if (!mkwrite)
> > > +			return -EBUSY;
> > > +
> > > +		/*
> > > +		 * For read faults on private mappings the PFN passed in may not
> > > +		 * match the PFN we have mapped if the mapped PFN is a writeable
> > > +		 * COW page.  In the mkwrite case we are creating a writable PTE
> > > +		 * for a shared mapping and we expect the PFNs to match. If they
> > > +		 * don't match, we are likely racing with block allocation and
> > > +		 * mapping invalidation so just skip the update.
> > > +		 */
> > 
> > Would it make sense to instead have here
> > 
> > /* See insert_pfn(). */
> > 
> > But ...
> > 
> > > +		if (pte_pfn(entry) != page_to_pfn(page)) {
> > > +			WARN_ON_ONCE(!is_zero_pfn(pte_pfn(entry)));
> > > +			return -EFAULT;
> > > +		}
> > > +		entry = maybe_mkwrite(entry, vma);
> > > +		entry = pte_mkyoung(entry);
> > > +		if (ptep_set_access_flags(vma, addr, pte, entry, 1))
> > > +			update_mmu_cache(vma, addr, pte);
> > 
> > ... I am not sure if we want the above at all. Someone inserted a page,
> > which is refcounted + mapcounted already.
> > 
> > Now you ignore that and do like the second insertion "worked" ?
> > 
> > No, that feels wrong, I suspect you will run into refcount+mapcount issues.
> > 
> > If there is already something, inserting must fail IMHO. If you want to
> > change something to upgrade write permissions, then a different
> > interface should be used.
> 
> Ah, now I realize that the early exit saves you because we won't adjust the
> refcount +mapcount.

Right.
 
> I still wonder if that really belongs in here, I would prefer to not play
> such tricks to upgrade write permissions if possible.

As you have pointed out this was all inspired (ie. mostly copied)
from the existing insert_pfn() implementation which is used from
vmf_insert_mixed{_mkwrite}().

I agree a different interface to upgrade permissions would be nice. However
it's tricky because in general callers of these functions (eg. FS DAX) aren't
aware if the page is already mapped by a PTE/PMD. They only know a fault has
occured and the faulting permissions.

This wouldn't be impossible to fix - the mm does provide vm_ops->page_mkwrite()
for permission upgrades. The difficulty is that most filesystems that support
FS DAX (ie. ext4, XFS) don't treat a vm_ops->page_mkwrite() call any differently
from a vm_ops->fault() call due to write fault. Therefore the FS DAX code is
unaware of whether or not this is a permission upgrade or initial writeable
mapping of the page in the VMA.

A further issue in there is currently no vm_ops->huge_mkwrite() callback.

Obviously this could all be plumbed through the MM/FS layers, but that would
require a separate patch series. Given the current implementation has no issues
beyond the cosmetic I'd rather not delay this series any longer, especially as
the cosmetic defect is largely pre-existing (vmf_insert_mixed{_mkwrite}() could
have equally had a separate upgrade interface).

> --
>
> Cheers,
> 
> David / dhildenb
> 

