Return-Path: <linuxppc-dev+bounces-4933-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 27120A08732
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jan 2025 07:02:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YTrdV1Gyyz30Nl;
	Fri, 10 Jan 2025 17:01:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2415::610" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736488910;
	cv=pass; b=jAf4e8uymGoa+3JukPNa60kWQ6BFRGkNVVizZpJ6IYfMWiV9g8ciCia5SPOpLTx3Awt92mY//ZkNPWsxHberV0UwT9qKroWi05Y6ye3QNAOttLGyjg7jbVY+7qcon8djJ+GLrcyKr9KPFrGnI0kmfNwfv5D6dkGmdt1omwRM5jg1lnY6h+ReNpwUrhWw3YpbD5KDVhHlv2PDZsq3nkgcwQZQBwp1wttiQp2XfaJ21GZs6ggl9Sro3OSPKf8kBPe78htzKq/RtQefmBa1oCwlDgm8zHz1MuKzDXcc0rWfEf6YHYIlB6ti2fFJcjp/R4som3uegU3sitE0THGrm2aGYA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736488910; c=relaxed/relaxed;
	bh=xy8qh7i3mZHDo6zytroBAIKc7I21BKCOmZX9uuIf+jc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lYnR6XwrpUp3VcAbX9IwPY0q41nIaeNfgT6UY4m+xgO7PKwtXSdislbI5E5p59Wpcura4RWTwWqMRuLzBhTNXleFTezXCCB4Yu8xYqxH+vJ9afum44Q6LwolG/cQSuKz8i35rcN3gRk4jNkCYoIFZPGI1VT5KcAGvG3lzWTWILAxdBV3hUr3J3LCrnW3iQCpIGITmosRJbV0Vu/BtS2E/tfAomtAp+8+iolEnqBtjxHJ41pypG+2jGnLc7Krno/uoFol1Ph/gKVYLakPVQpw89KCRQMOB0bMGEmgat20NeHyqwm78a8ojND8cSOa0n1nhQEUvRQbsxqArJAF52M0pA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=JQXERpPA; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2415::610; helo=nam11-dm6-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=JQXERpPA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2415::610; helo=nam11-dm6-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on20610.outbound.protection.outlook.com [IPv6:2a01:111:f403:2415::610])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YTrdT3cWsz3bVF
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2025 17:01:49 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ThqA6vPA6B6yab0m/OQmJY1GQTRWuDvu40566Gun3+pVOLLp16PMdpot1sN2vBgUV+qvYCpil7jNk5/rnZHdDP3MVPRznaJvRl88KA4hRHDzbqAVgX6/OZhBxKIHmrcGC58F5lM+1WT/fb9Tmk/GUg2+2GpuN6yID3nqfHcith8lg1CJOX10wUPj6RXwoZiQxlJYLkntQt4k8H0OnNn6ZESHknLR4e6iKO10Sbv9ibA3m52XLuPhJrSDpcIPQReFD3/l1nynZWyIqaEq9jfas35Sl/cDYr4iMLgE4apbFehd07GnMphDFeOnnjmP9SAE1z97wTloHPCqO2VTXbWyVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xy8qh7i3mZHDo6zytroBAIKc7I21BKCOmZX9uuIf+jc=;
 b=aOxwuuEB8vqlEiZM8EVK/+s43sZL1JD8wLMCjPzcMqPgMVqtn+qFAEQj2gQOGEZjqCj5dBej4xCM2lUARGiwL5rRtK0rL2cfXgYNr7TJcZKW64lq6vqiyTHINdupY7HjLqcEsZRB1U1Jh59TaFC/ARF/fqFyEM32H7Uu5ERj5TaoMcUqokIiPZyghalsJo1Cbl67dS8Bpgqkt7QmmlqNgGqeDiAdc+cxx6V8dhJWTXujNgU+dXTqTUEk5zz7vi5hPNGLQmPZxRr/9AliUUJiQ819zz16on0N4uGATpZFxb7MvJwXsc9yC6W9hvww2PjjkByT07qVGhxI5sN3lRzp1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xy8qh7i3mZHDo6zytroBAIKc7I21BKCOmZX9uuIf+jc=;
 b=JQXERpPAXK4ChSltsGHf6j2c3YwENDXtk6KvvJPMgb+Cy4zGeOToiNb9FTlbNQHXDamLuSDv2Kb1dqe7ridyb/niWMmatS7I5g9a5gFE1culM1AxbXNJm4uIxzpmbtvEjyIMBdXORAH1Y30RzBSmoxXcY5JC068V3G4caQT85ULCyb7fpEyAHDj5R6W97XurLBrI/cTgsDNcrz8PQYWkNejwB0x1oUVark1VIbGGabiu6mCRTK2p3X5tpzObvctGDUoLKjUmL2apy9L5Am63Svj3jwxgtBgRyd9DcwnNMvuiEkbkSYiHA6igh2P4GzMDtILOI042coPNjExLpOqOTA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 BY5PR12MB4132.namprd12.prod.outlook.com (2603:10b6:a03:209::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Fri, 10 Jan
 2025 06:01:27 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%7]) with mapi id 15.20.8335.011; Fri, 10 Jan 2025
 06:01:27 +0000
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
Subject: [PATCH v6 02/26] fs/dax: Return unmapped busy pages from dax_layout_busy_page_range()
Date: Fri, 10 Jan 2025 17:00:30 +1100
Message-ID: <ad4e6ac759e66855d5a9015746a45112f93a082c.1736488799.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.11189864684e31260d1408779fac9db80122047b.1736488799.git-series.apopple@nvidia.com>
References: <cover.11189864684e31260d1408779fac9db80122047b.1736488799.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SYCPR01CA0034.ausprd01.prod.outlook.com
 (2603:10c6:10:e::22) To DS0PR12MB7726.namprd12.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: b730bb22-f970-4dea-bba5-08dd313c38c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?99ptmx6MPnO+tYG0kMqoHjaBMczHQPL0r4N48qSlfiK/aedflf3Gqbsix0WP?=
 =?us-ascii?Q?S5IPB55kq9H88a3gwix/vBX1Q58XUUCFVkVYOC8vb0GIDZr++sRfoBqhE8lP?=
 =?us-ascii?Q?USW5U+Cmb8AJ7OFwRGVFp4LH3Atd3fb0jDVOuYMiqlhebI9cjCvl1TCDgIKI?=
 =?us-ascii?Q?pUmza0i/uPmyZYycykHj9NmZHuBMGMsZv5DveIMAW5Oi14A/G0aBlpTrV3tM?=
 =?us-ascii?Q?osVQOuVpo7kaEu7hUavHngydxn8bZusXAqJ3Llvg16Jfc8B5Thk/gpLmt4uX?=
 =?us-ascii?Q?eNbr3CriuVa9FQlEwwiHd0Rd3Oj3LnS4fVVNwtuvwKUMYnWF24VJchPvbZ2n?=
 =?us-ascii?Q?i463gf3hAu7lJgMeB9iNbb0hBQAMOddQH8tIGKO7y2GFKj3O8TVsIapj6Z1d?=
 =?us-ascii?Q?+AHI40ONkZ5hERUc3QIOWwceQ0CwCezACmZL4Gy+H7SbB5O0uehwxyzTzEAN?=
 =?us-ascii?Q?P+YLJWxhAmcwvxq6UZMD40npsm7q5KzdA1senMMjKJFUT1+/Tt1Ph6fjS3Ba?=
 =?us-ascii?Q?9PbUnWlFvk7rkvDCqDNmAUiS53FMi1PGBySfzrQiY9zgmYWn/NQF2z3kENDU?=
 =?us-ascii?Q?jOLcKBdtbszooJDDfM7lFShykU4cxNHNFP7R2PVGGqwiYTzTHc4mCQ5esd37?=
 =?us-ascii?Q?FKVgulVl96wREAO5IlLz34fL03TAhmvX0whMhfKnJjzrm0AMcNv+rkR9rxAy?=
 =?us-ascii?Q?cYq+eYnmzWQDR7sVlwyLntG7UUgebNE2FsOUK3vE4KILlG6BcWFUXxSxZtYH?=
 =?us-ascii?Q?0tnOk8yhFYZVTJsKDsAFXxeLcfZyaa2PCsHiEG8M6nwJDCNehI3JNSMxYwzk?=
 =?us-ascii?Q?RWL/GOyySKfw7hbiZldejp3vifU82yUIK8NHf4Qo/lz8xaOEmYF+ZpfOJn/n?=
 =?us-ascii?Q?lt50Apz0vbiASogX7jt6A7KhtM2l1/o2UbcA0GHFb0TaJLNPDTzufLObRdRj?=
 =?us-ascii?Q?PuEK7mhJliHkb/DCTL9TYd59U6UY+6EO8FQg32qivbuR+RGRuiNBfsxAnLQJ?=
 =?us-ascii?Q?Tk0CM9HVHzeem9uErc+mKn1gNah09lk0yMctpEBuGiaQzVVtmASuj7H8PbA6?=
 =?us-ascii?Q?ZmvzWrCdqvwC3LY2QIQJPtaPCAOy8U8H0CvulDNBSh0D7QtW4uQucx0RPHTR?=
 =?us-ascii?Q?SmRWelqgRFbEnbFwQhN4s6HnvqquxqdlxA17krOQUltpZyl38U8WwoL56FFC?=
 =?us-ascii?Q?rYTsGuLdLybposfxZrIC/NzCc0Ifzi47CXBjm0CAXtDo93+mD+Hcqgn559R0?=
 =?us-ascii?Q?M9ZS9eJqaVIjiDec5HqT5AIfJaKZFB+yrlxwBM374n81GJh6TOg/BPFRVByZ?=
 =?us-ascii?Q?l1u218PzD67xfCPrPl9K9PI9hTfaV6AZDFwC2XaW3y9cSAJEgTqPpM6+Lww5?=
 =?us-ascii?Q?uo5NVxDYIyFN2OE2NlepVgSGbi7X?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NSiBEpEDosraW7y2C/vfg6C+QiD9PSZL5bNxmJTy8kRA7CZrTx9izf/0pLxf?=
 =?us-ascii?Q?vluYH6claKDVrf1LwEQ2qgtsHgX9y7DsIGMIbnTevWgKDLgXOQKMcQZcXACL?=
 =?us-ascii?Q?2CmjYLQwLaUUTgsRSl9CwQNjBzwaFrmIwfuKHwIwKHXhWHxt+JF+hrRMav2f?=
 =?us-ascii?Q?VhFBaS4bYcMKHpcvZyXvLr9K+DEkwFm3j1fNWLsCjVj/apQBdx9U8by1H3AT?=
 =?us-ascii?Q?iUgkYSLC3Xchf8q1IJNaFH3xAdgsTooGTMSiXI71BtIuSfJYfUnncxkgHft6?=
 =?us-ascii?Q?2an6QIJWPeS65txQyACzu8YKz1cT/pt2Yx6wc9sByKTcsW8rXQIAZ1ZBLonF?=
 =?us-ascii?Q?p1AF0152uJsk8hn7z44pYOBf55hXitCrUEDXk7N9gdeoYBYJFagyN4EXQYLL?=
 =?us-ascii?Q?90cpixA3oUvw+eZuobQv1p7KUHvK8mfaAwwdNVzFiHJU4ztDd84PnZ8esu8I?=
 =?us-ascii?Q?0z6B32hNbjrqAEALIZZSMXmdVbVlXT+FvoFH9hBIOgJyXIrdIwBNGd5skaMq?=
 =?us-ascii?Q?/i+UC2nGlucY0JeveRM1FN+QDS7xOXc4FGqQQYrqvZgOuq526Ee13TqQxI9W?=
 =?us-ascii?Q?5wRC5/cEl215DOJt9J1VR32CzuWTWV0Nybis0nBRt3ZMRYJvIzmRIBKUtZsF?=
 =?us-ascii?Q?1dUkvijrKKHWxtZxlEePXoC4fVhAUf7KlDyr2AzH3LyEvxkDMoiBQ10LN5ky?=
 =?us-ascii?Q?Md9QJlVzgXpO/vCqgOJxKBXDy8+JjHVuGuvSL8qyyptJJw1/J2NuIJxsIJDq?=
 =?us-ascii?Q?gPcv/IDUHHZ8hW2pYjuUtfZe7VQCgERpvTeDqlnXC9TRl4DmalYYe8LOiOAV?=
 =?us-ascii?Q?+M+Y3FuRwDgbysY6E5qxS3qE7E4MCi9XYesOyehDnV+LBj/W5wumojGAgU/z?=
 =?us-ascii?Q?l2JEUeVlZdaIEzNNS/HBS8F+C/cyFYQTXXKkji9+hXjoQrZiukCXLCL7h/+8?=
 =?us-ascii?Q?3IcfJXqM7qeLqlmxdzvL2DZB4bsT75MDPfFd+/Caxo/+JCOga2/FrulollNt?=
 =?us-ascii?Q?iGcTiot5908rxrw1bDT0YubS946fOPPxTaSqVhzx5Pso2+4cDOSuPrzDaomz?=
 =?us-ascii?Q?pgPCuZN9QIw2M5WzmRrJQodWnnHgnM7K15bzIwuMNcTVhOpqs0+7QEezq8hX?=
 =?us-ascii?Q?EY0H1az2Pac2CxzhDRKdNNxDivgxGngCs4vFjrFJjp1BH19DwtZ4Mz3VMv0H?=
 =?us-ascii?Q?tik6Dt5ZrBk5ts6PW5EpubLPMQps8yJn5vB8lSoRYCRLimup9bJS9uYYKbzw?=
 =?us-ascii?Q?Mq5AO2rtWOptQN/GSNaoZGowblMn+xI7pdM/WigmFRqiLeXKutPjCPBissT0?=
 =?us-ascii?Q?DmTBHwwrn8qpmbpPaN86aV0eee8XvQ90GZy3zp8aRYFzLxfHPIPJ9Y4BIs0i?=
 =?us-ascii?Q?c/5DZ4D53eEq6NYfw9hCXoZLG7r5z58fw/a1C6UQfAaG1j6nNWgClFi811/R?=
 =?us-ascii?Q?2vJ7nh9JPGrMN/8OI/rYGvpKdh8PSVYJA5+0dn6+Qxb0Saq0/kJ50p9JyO0i?=
 =?us-ascii?Q?V9Yor6obUVU0pgOGrrrglaOPLunBSRC49qzC4ecZuSgOkDCvYeCa7cUXWBsL?=
 =?us-ascii?Q?76UDCLhmBlC4CPmNlp3afObebCLwbrbttznOxwF9?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b730bb22-f970-4dea-bba5-08dd313c38c1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 06:01:27.7468
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4sUoIQha1/KGDRArrOpqXPrptxemMSj4zkHh9rVrKbHcCLA7H4Qh2MG8jDKW1L/C/2310BEn6e3/oDB3wa7Nbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4132
X-Spam-Status: No, score=-0.5 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

dax_layout_busy_page_range() is used by file systems to scan the DAX
page-cache to unmap mapping pages from user-space and to determine if
any pages in the given range are busy, either due to ongoing DMA or
other get_user_pages() usage.

Currently it checks to see the file mapping is mapped into user-space
with mapping_mapped() and returns early if not, skipping the check for
DMA busy pages. This is wrong as pages may still be undergoing DMA
access even if they have subsequently been unmapped from
user-space. Fix this by dropping the check for mapping_mapped().

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Suggested-by: Dan Williams <dan.j.williams@intel.com>
Reviewed-by: Dan Williams <dan.j.williams@intel.com>
---
 fs/dax.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/dax.c b/fs/dax.c
index 21b4740..5133568 100644
--- a/fs/dax.c
+++ b/fs/dax.c
@@ -690,7 +690,7 @@ struct page *dax_layout_busy_page_range(struct address_space *mapping,
 	if (IS_ENABLED(CONFIG_FS_DAX_LIMITED))
 		return NULL;
 
-	if (!dax_mapping(mapping) || !mapping_mapped(mapping))
+	if (!dax_mapping(mapping))
 		return NULL;
 
 	/* If end == LLONG_MAX, all pages from start to till end of file */
-- 
git-series 0.9.1

