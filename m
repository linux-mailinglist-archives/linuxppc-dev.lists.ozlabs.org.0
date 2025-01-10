Return-Path: <linuxppc-dev+bounces-4957-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDBBA08784
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jan 2025 07:05:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YTrgq08H1z3cTw;
	Fri, 10 Jan 2025 17:03:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:240a::61e" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736489030;
	cv=pass; b=DWOAbIzR8MKR0CVHGN1NG/x0aqdtsOgFZe440ceGaVZvao42nuYGGcOcfV0swZekSvfgdr2eT3ZnbDIgbJaUX458l7PhusPLgDPmif8RgAGdfZzWUBlfDGELGvzrSuiuiMyQIIsyy+zGnGyMBBsR2ldHKlK7tfZQRNHoFJCQ9RVBwHM8lAFwKrc7O1LD9TX0xzbz4fm9uN8PKPfRR81w3cftrf/2o/XAUUjwgSPc6wj8+X+syTRnSq/DApEXpa5+CFbm59HILcDVkRi6PvGw7Xl+c+pE2yZb8tTibTTQYr/68/LIZIAEti49t30GLbtkckgFtI/oJwlx4FkI7vDJ7Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736489030; c=relaxed/relaxed;
	bh=kiAoIARrBjNNw7BA9QwAwcx8RUIlKCs4CuNxfKRDF4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Vs3JJhO10y88g0zxldibMILqkU54kPWHAuEEAkLosAd1gRgM+Hg9RmI5xFjCI5cN0M+siaJH2lVzQmR8NqsQoOPvXidvr7EuLg8FmbRj8TCossSH8iMcqMXYWyr+vyxVkJwTjKGUrqim9POAJKQD3JEd70+69ezYCjISqXTy7mVbnK6QckZRfp5sthRMOBSkFq3FcB4STUFRX8PjWktxfA+psQrVwmFliibcE9ftSuUo5Gg8y16uWsAXDiSJhV+j4yxDN/MsM2zcJ4BsyvApjAojK58NyccyaDorfv9ei2TXfSGfp7QB7TFnj0tls5K5I60k3vahl7+/tQQVAhYRFg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=e749WiBh; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:240a::61e; helo=nam04-mw2-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=e749WiBh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:240a::61e; helo=nam04-mw2-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2061e.outbound.protection.outlook.com [IPv6:2a01:111:f403:240a::61e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YTrgp1cRbz3cTs
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2025 17:03:50 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FH8j7lNZwNomFhPlbUmQJ3x3jmhvQxrowGxkY4ZqUbyOszuP//dQCywJX7bOtAFnRUhaqXHFXMiP641lBDTJTGC1Sc2dSmIhXTSyrz5bRvad8dR/5WVOO+KDvudl4qUvKRHMzFQ9g48Ptr4PLiqu+VmhwUhacz0BJyJWb+GD612QcW3qVQMTsKLIgK67f7zXNJzwHK5ZZjOsKWRSLUZAaYE2bqhvViDousNAZRdah01VmztvYyeX8pFr2zo+b8ELYGyOn6C5EbpahVm+3kNDgY308POG89suCCPzk03sqKa4qGXxaml+BNmAb75DtywognrAdB/KWxo5h1HbzZYG0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kiAoIARrBjNNw7BA9QwAwcx8RUIlKCs4CuNxfKRDF4M=;
 b=Ke2qIQHtEhbGUsUY41/Lg/uQxNaueNaGDS6AWbmJpIXo83rdcaSRvMmplyPdXld9ke7Ow5Z6rYe6KcywIKjuOuCNEWBIJp/yi7+zwy9ZqGwt8AtkalqRbwugZoxpn55seegpIKLGBatj8kg0MB4dI+VOLlx6isPdtRWHHoY6SD9vQNmYX0XCPzV1HKK0UmNAFPjhxYM0LDkfL6jrd3F0C40Pg+Pw4+0ZNm7iv4bVdDx+oma38/OR18wWdTnUmVzEZb+oAl2JrOmF8GfBo3gg8JrV3q9J5X3xebJnUVjcZdQm9cTZ+2PEQNFRd9XaMFX+6CtNW2CEJB06jCtYl6INZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kiAoIARrBjNNw7BA9QwAwcx8RUIlKCs4CuNxfKRDF4M=;
 b=e749WiBhr6XpjXeYy9f/zg6Oqahh7Um8QK0hxswot7LhwQ1VxeGN90ivMUSnHDBDzM9Mhehb0ieqOaop6V30Re+fRhkVz4eWPFKlSdQPEj5qpvXDn99xygjYMfZHdqcpWcQTt3hCQcjOg7LZetDUH/qlh766HO1P0O1xxitZhXJfmIES26WR5dLbHlFWfFPL/WZbO0DazYpVblJRYjCusxTRZQatQadGkMtnHJ2EqZjY30sWf8Jjepz76bkdM1kqoBYf7OXP/7zPcq+e+w2sxxQiVPjwijshviKO4K59QYNOX7gj84vX7wPH5I7Kx5BwBgA2F+zIkY0rAuvb3YU3iw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 IA1PR12MB6331.namprd12.prod.outlook.com (2603:10b6:208:3e3::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8335.11; Fri, 10 Jan 2025 06:03:36 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%7]) with mapi id 15.20.8335.011; Fri, 10 Jan 2025
 06:03:36 +0000
Date: Fri, 10 Jan 2025 17:03:31 +1100
From: Alistair Popple <apopple@nvidia.com>
To: Alison Schofield <alison.schofield@intel.com>
Cc: akpm@linux-foundation.org, dan.j.williams@intel.com, 
	linux-mm@kvack.org, lina@asahilina.net, zhang.lyra@gmail.com, 
	gerald.schaefer@linux.ibm.com, vishal.l.verma@intel.com, dave.jiang@intel.com, 
	logang@deltatee.com, bhelgaas@google.com, jack@suse.cz, jgg@ziepe.ca, 
	catalin.marinas@arm.com, will@kernel.org, mpe@ellerman.id.au, npiggin@gmail.com, 
	dave.hansen@linux.intel.com, ira.weiny@intel.com, willy@infradead.org, djwong@kernel.org, 
	tytso@mit.edu, linmiaohe@huawei.com, david@redhat.com, peterx@redhat.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, nvdimm@lists.linux.dev, 
	linux-cxl@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org, 
	linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de, david@fromorbit.com
Subject: Re: [PATCH v5 00/25] fs/dax: Fix ZONE_DEVICE page reference counts
Message-ID: <nviexwlqvfwzarbaqki4f7iz7kt55ovg6gaksyhywwmzme2yy7@mbolad73gtfk>
References: <cover.425da7c4e76c2749d0ad1734f972b06114e02d52.1736221254.git-series.apopple@nvidia.com>
 <Z38npigJajz_gm-5@aschofie-mobl2.lan>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z38npigJajz_gm-5@aschofie-mobl2.lan>
X-ClientProxiedBy: SY5P282CA0128.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:209::8) To DS0PR12MB7726.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|IA1PR12MB6331:EE_
X-MS-Office365-Filtering-Correlation-Id: e03dabb0-2f0a-418f-2a4e-08dd313c853b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UsD1Oojqt1pQ/VJmAknz1h/cPoibGZrbHdik+lYB20aX/5TtnYsUxXJoeIEH?=
 =?us-ascii?Q?kZCLvL4UT0ZhYgi3idfmh/Syy0rB3YHA9msTg/88MxIQBPZ2Fm7dHc/dy6JS?=
 =?us-ascii?Q?olcZ8VKvByrB7N/U9nbWhC8gtLsbBBzx5X/N8eZtTHyoqurCcdfxDLlOLZY7?=
 =?us-ascii?Q?m5UNNQ4WM0y/202SrlYQSExJk/tuCjAe6jJTckgcdkKzLY8DOYQX+ZypEyXI?=
 =?us-ascii?Q?/fhzmXkmB5QjetBfGmzTlUQsfvR5nVU6/vAVeoBhBPaf5jHHxiWYtDDLroj8?=
 =?us-ascii?Q?/YqEfMfyFfAUGGerGz93bC79djgww+LW69s53OAkaSY/EVLYq+cpLAipJA/j?=
 =?us-ascii?Q?IthLk4S3grA6uTDmPrSqImTVAfIU78+B5m0pi4bAuL91GGap6U8WKOx3LT7h?=
 =?us-ascii?Q?GxH1H/OZmRiIRLzERd1o9pIfLSJN3K0YfiYjNFge9nM+mW1LdFeqyyr0Q3WQ?=
 =?us-ascii?Q?Hj0MZnY266neOcTbzfv00YqogPwAu4TVMkbMNolV77dSutZR22Dtib2Asi6v?=
 =?us-ascii?Q?i7UhmSA4FM0AnR5lBXaku7cWNMGUnMHnxp2W5BZEyUjYxJFaSE8veMUVkgpL?=
 =?us-ascii?Q?mz9BPCy+GLtlYmXgVW/nuOj1cesvnulCw8C5vIB5jap05TyM3lNQrpDJTwh9?=
 =?us-ascii?Q?dCTxIaHTMSDz4djFEu+rsKGECFbtjRXZbqhwSDNH8mzgX68VbTLiHW+5T3FD?=
 =?us-ascii?Q?Pb4nSXtRIwINYC3oJiWFJiV4YHhlJfgkt2U6YCUpZ0fGriuQUOmoa8cL4IvJ?=
 =?us-ascii?Q?b6pTY3iVt0Z0VWI8k7iOnhpz8KotauvHegbSY30BkfuHkWPnS1rdVyYJFtrI?=
 =?us-ascii?Q?uERMCs0oirQV/+S+H6i4JrMlCYGSW6aLCyhcVd66Pcp5EyFh+H7avRf9bgUn?=
 =?us-ascii?Q?NjqWm/LEU2SaBp05Nwfc/Fn51dFeq6ZC/D5CY6cIgeyuLrkURpL2oWAAARTF?=
 =?us-ascii?Q?p0xNqU3UyBczDRov2ORZ1k8nbjEflwtodWH0quRrpi6/Aj6zMpjgJUglj2AT?=
 =?us-ascii?Q?SGZWuT7mocopoFABHL8X+8z8mKJmbRwCdrwu/z5GTxJ4ZkEspRN+hzqLVkdy?=
 =?us-ascii?Q?pFGOvjUiYstFlX1JTU42oD7dmRoLV49RY3QJNzCbrGFUlPuSRpAq5vkjLpyl?=
 =?us-ascii?Q?88UIqPhW3e0k7Gu+vCSxybLeqOEZCp8Tbne6JpYCBkW0dYa8omfNupM2fWOe?=
 =?us-ascii?Q?TfBzYGv4RuHC3mQ7V4YfxUSxobf930+BC43SpB6i84qJIvQ5AAzYXg1KsyFB?=
 =?us-ascii?Q?6Jv6kOREprD6pwslDJ8RZ98SMaVn/xr+rI3KIvjvreftVcju7lhWu/Egm5wL?=
 =?us-ascii?Q?ZzruYNhdOLKz6Trw9+p77nRn3zQuHQWCKu79YSbcjVd+67mxuLDc8b8zs7od?=
 =?us-ascii?Q?3+nDo/SPKjTnvDYwc2wtpPDH8Dxi?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?q1KvqITZSZLtoKxx/R1gZfH1KrFGYkIYYumAcWucr67aiwKfv0nFEzoNWlBo?=
 =?us-ascii?Q?yNfEbpsIwIclzNUUu8nxn1HUwF+62L0yg+F180KubXi8Nt8Cv82gSmNWUGz1?=
 =?us-ascii?Q?fFlLv9CQaKyG0J+mPLY6+LaylxW8nSyLQ2VzjHGpcB/ozQvqhAfTAQuKQkvR?=
 =?us-ascii?Q?DuezOrrPS9fAJDjoSiS0pfLZmEKAA87NoHfmLrDtYL6Iu0CTkG0Toz85mH3X?=
 =?us-ascii?Q?l564ecEtnQkNOhQnjTxhCEFxoHoHj7TurS3xk4d4dH5uRhQHpfB9Uvu1SHIH?=
 =?us-ascii?Q?IvQNRSioD9EobYgn4kOZT6vQacLB3iSgInYF0F11HRVjF+SPthZCivKLr2mf?=
 =?us-ascii?Q?PcSeuL9txohxC0Qzeyyem8KeIijpMridMkQiiUz1vzGzDv7lUdN/DPUUlNld?=
 =?us-ascii?Q?DK/LqrHNZh4mWx7Bb7jOijix5I7xLfH4smXQwRYS62o3hty3QcRppQ4Hms7m?=
 =?us-ascii?Q?pfvw5d1peASf5VzonOvJIN/ksebwUNmuHZEBi0Y7FEtLPYmpoFZTu27LtztL?=
 =?us-ascii?Q?z+qbax+LldBgP6DrUh0OQGUN2mVzxArVvThz5fyerF5nLXyq1vdh/Xl/lcL9?=
 =?us-ascii?Q?498W2CHhi4uTQEQdNfBDnBj2TEG365sQRzlLNERJZ+UGuEgXacHbiXwg2kSL?=
 =?us-ascii?Q?Dg1850GlDuX0QJrEY20nxn1EWr9/VBOsblRG5FH6FO8jc4m8TVtyRzjl1txj?=
 =?us-ascii?Q?M4DnEvmV39v4a34/vFTeyTXBW8FmrNmZpKR/RocIrxVyQ1JLguNnSJYso6WV?=
 =?us-ascii?Q?cKVxT+55EiFs03VaE9JSLfsOxpX46uVEn9zEDgzF1gcAQqPOQ5dak3DilVQw?=
 =?us-ascii?Q?nZnTqlgGNAPof+UaP27Ja+/tjpzNmAKJ6IQ5PxU8LiiosKVvI1E3/3vMgqjO?=
 =?us-ascii?Q?acXNBlAx+CC3meeuJxo8Sx7NizPXJxYJ4xBI6x2dknQRcWat/zb2afldWJIP?=
 =?us-ascii?Q?4ehIMJffy8sNt/op5EnNC9TVORUle0J5RMIBcOT1NbRpKO61iZwowpULGTkU?=
 =?us-ascii?Q?GgpiHGQK/HhELViGBvH9IacAkmr5Nm3PssCM02qqEnJxF5VO6ob7oTiQo4Dx?=
 =?us-ascii?Q?OUgYOR39PyX5d/kVV6NpiWF12Jkr9DgWaB/tEPym4Y7+IazaLETytz3kcBOq?=
 =?us-ascii?Q?YbgSwNdv4jn8gtIZ3pxKlb5Ds04J4yo55yHaPzfuGlB57XKVlf9iTMZ6yWbj?=
 =?us-ascii?Q?KObcQuDi9DgfmCF2gFcP+YvjGal9dK1NumTh9H4ktP8GPG9Jot5rtE4PVap4?=
 =?us-ascii?Q?zn/pHbf18Ei0MXgGLj6n0XLCc30XCog56VcQSEa+jN2D37FxEHv998M5P0VJ?=
 =?us-ascii?Q?gU3/cSU8trsT2jF32tCHG2f77EgVMAl9hmnNu1RW51qivQ6bSf0TL9pnfYFI?=
 =?us-ascii?Q?w8nYsEJigWqFFDleOze7y8MMGUY5aBXgXiPspIrHhmyJC46Z8AbWbOWl/+5Y?=
 =?us-ascii?Q?JlvyydqibUxzdpIvc0EC+kK2IxTgZVOyPPFrC7n7sHUXft45cnL+dTgoONAJ?=
 =?us-ascii?Q?UBwwjVT7OeQ1Hbij8/yT7seWwHU1meZnveYvLviraOoGvm3GEuw/O3hecyPY?=
 =?us-ascii?Q?alNlp8RIeKfQ+rpCv8k8POcCCMehMML9uGUnyUx+?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e03dabb0-2f0a-418f-2a4e-08dd313c853b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 06:03:36.0945
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MRndiSYDTGd9cSeqbzyZgVCI7sDMqH+jxrOFkfNDj3osL1Bkk+mHqSryRYqq1CrMdjMPKtK1V5bWxJzl/k0nwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6331
X-Spam-Status: No, score=-0.5 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Jan 08, 2025 at 05:34:30PM -0800, Alison Schofield wrote:
> On Tue, Jan 07, 2025 at 02:42:16PM +1100, Alistair Popple wrote:
> > Main updates since v4:
> > 
> >  - Removed most of the devdax/fsdax checks in fs/proc/task_mmu.c. This
> >    means smaps/pagemap may contain DAX pages.
> > 
> >  - Fixed rmap accounting of PUD mapped pages.
> > 
> >  - Minor code clean-ups.
> > 
> > Main updates since v3:
> > 
> >  - Rebased onto next-20241216.
> 
> Hi Alistair-
> 
> This set passes the ndctl/dax unit tests when applied to next-20241216
> 
> Tested-by: Alison Schofield <alison.schofield@intel.com>

Thanks so much Alison! I wasn't sure whether to add your tested by to every
patch or just the cover letter when I respun so I added it to the cover letter.
If that's not the best option hopefully Andrew can fix it.

 - Alistair

> -- snip
> 
> 

