Return-Path: <linuxppc-dev+bounces-11419-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 464A3B39E0C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Aug 2025 15:03:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cCM6N2f7tz2xnx;
	Thu, 28 Aug 2025 23:03:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2415::60d" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756386236;
	cv=pass; b=Zez2Tzeuhk6QhpWF0e1nISi5U7Dme66dGpg7s0s2oUTUqBgzKntMP5e0O6W+FDbwcdR/G8e6hhiivpIlCsrrHfk398FXnymc+Wg+p5Rh+tZemQrOWXAY3zCwbvpVpDl6i2EqK/CGHeqq6KQnt4t5g3JIYeZAzT4ErUY/LgQmDvvmNxjoXiJVg7a+9PDxkeMfHTl3EXHTJKK8IRyN2PgeBxZrLIOOl0BqC4NdCjHHX1IcANMcgKHYiCtBXdI51sD0RnWgY8AzfGA834WlhxEYQ+tG8zhV+d90paIO7woONhaPsHyWhq+RPGuV/SyQuOPs1FLcfKGzn5If7l2TjnrzqA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756386236; c=relaxed/relaxed;
	bh=lb1aBSrT7FmXIFNg2GsFQ9EVeTQg1mhe6sX7cdRiThE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kmIXcYV+oQCt3MpTn8EP+tESPzgn4GVAQ2T2IcQA+TXN7SWRHPPZ9FXO4fRpTep/HPF2iSccqjRxXtvLB/AuGS093UQsWqTkxOEmtUcvJNbDGe6TwoTTjLAxi2v/9OrE9pqzm/z3Gfg5yTgi3of09X0ql84iSNKbdCYynL7Ppf4B6qKiiO5Hhf2KeAG6iMxxoc7pTmXWZbpuTLYCanDj8aq9ai8iz4d8otbQe6RJAJBEAO4aJmDcZZJaYpMEIBv0JPdkWFBpDfmyOVgV+aegTcYkSGomyNCMhehal6E4JqgzdLjJ+pXj+n6E2ZByCmyvyjJmjNKyrLeqE82DzPwUow==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=fMOHKVpY; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2415::60d; helo=nam11-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=fMOHKVpY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2415::60d; helo=nam11-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2060d.outbound.protection.outlook.com [IPv6:2a01:111:f403:2415::60d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cCM6M1fJkz2xnm
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Aug 2025 23:03:54 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RK2boCbuG8+THudRPPBnz2BVqcPYNNmsZyx6ar7cyi1lJcWMGtn/ODmZOffdT7qr3h/4lPrOQHsyY0CzZyoXlH3KOo8fq3J/HKXq/eqAPshsEvv8YSYqfMsroBxHgj34lnK0rmecBfSBeQz5+oCEtxl/1Nn22bBVz1yHfe44eZVE5G9Ojmrf2vMxAyujQbF3+V68y9Q+yG9nQJPhEt+KuMx2MNwNHStPV0a56gCrM0dCvTyf6B7qlLqlvQGTcF0wxRVMFUd+09dOJ8bvoSNPLhXE28LxX7xbHWbbK5imu4qfBVrlX0MMEuby46JVtyi1JCRp/F//MobtUQ+GdES3+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lb1aBSrT7FmXIFNg2GsFQ9EVeTQg1mhe6sX7cdRiThE=;
 b=QNE/q3aD/UhQyoArlwBvT6pR78ENgDH6SthcNwV2RzXCPOlWNTfJcH3icSZ4l0uhf6Fyb+axnIji94LsLZkCJhlsF53MITYJ8SYoPZY011pKsGidejJBAQ0tbmuGbFIz4dccEIw+0fZDlg3Yxc+oQoCDIWESr/CyrE2c4DcC938qFUmzyPCRGKI7Uwk3ivluL4NxAgtFCcSBYwxQS/r33nvygfw2jJrpV1U73jzZQ8nXk4em9We9fxr6L5U5UY3QCewrgOHTnOxd6B5lJhcXMtfXit0+pRdHr2wfBSw/pctbtVtPldJawM/erewW4h+9CtsOVnzzahYOWIFNOo7hvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lb1aBSrT7FmXIFNg2GsFQ9EVeTQg1mhe6sX7cdRiThE=;
 b=fMOHKVpYuCuv+ambfjY9KDMvSz059JfbWmFFJ2vP1G843jbMFTDv4HXQFLi8Qe2tlJMTaTUYiizwAG7J9J7p4vzPz2O1twGnyXYVM/HwCpTCqoonrr+Vo35/IhGzeN31s+NwUwIKGMEbZ0G7qt2Q7y/9P+5Cs2lQAnMDCoA6xWK00jUNOfxA7GM7IstzQyEg0DkohfxFnoedCFgCzVcxoL8YbkfHpP8uALzotkp87NZNt40HWCoYA2/hcZzfw1PI7Xs7CeDJ1xMLECgM51aS4D6GOsJoZHIAt/X7AtBwmkwhD9FSpO9RNvh7P5KdAIReLcydUtVFz+Ue/D7PC1uahg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by CY1PR12MB9583.namprd12.prod.outlook.com (2603:10b6:930:fe::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.13; Thu, 28 Aug
 2025 13:03:31 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.9073.010; Thu, 28 Aug 2025
 13:03:31 +0000
Date: Thu, 28 Aug 2025 10:03:29 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Leon Romanovsky <leon@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Leon Romanovsky <leonro@nvidia.com>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>, Danilo Krummrich <dakr@kernel.org>,
	iommu@lists.linux.dev, Jason Wang <jasowang@redhat.com>,
	Jens Axboe <axboe@kernel.dk>, Joerg Roedel <joro@8bytes.org>,
	Jonathan Corbet <corbet@lwn.net>, Juergen Gross <jgross@suse.com>,
	kasan-dev@googlegroups.com, Keith Busch <kbusch@kernel.org>,
	linux-block@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-nvme@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-trace-kernel@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, rust-for-linux@vger.kernel.org,
	Sagi Grimberg <sagi@grimberg.me>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	virtualization@lists.linux.dev, Will Deacon <will@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 01/16] dma-mapping: introduce new DMA attribute to
 indicate MMIO memory
Message-ID: <20250828130329.GA9469@nvidia.com>
References: <cover.1755624249.git.leon@kernel.org>
 <08e044a00a872932e106f7e27449a8eab2690dbc.1755624249.git.leon@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <08e044a00a872932e106f7e27449a8eab2690dbc.1755624249.git.leon@kernel.org>
X-ClientProxiedBy: YT4PR01CA0331.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10a::27) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
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
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|CY1PR12MB9583:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e8ce38d-1495-4e9c-fbd5-08dde633497c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?js25oaDOXC1PcXJuXby3MQJZ3I26MTRuNb2Mzk6+4y5rkgGrDvohXSlf/qIm?=
 =?us-ascii?Q?BoL/lRuUSmmk6jDV4j9TNDCZVuU+mk9bgVAHZ3LPGwfZ3JluaHL4Njb/BxTX?=
 =?us-ascii?Q?5Cw9YeJSXbEjnuCzrd9NW2mbFh0etMT4jm/SfC/4K4X5J3jOUg//9oRaOLIU?=
 =?us-ascii?Q?+A6sDEgKzo5AbemFCiD56LnQc/ViOBLF4Lbugl70oHH2Qf2N1Armg4SLLxMH?=
 =?us-ascii?Q?lOnumEAoTZZkBv9S79uAObcb1Db8Eeyr+MiL/xNHuxs7xxVKjZCLMSJvvIbK?=
 =?us-ascii?Q?Gq3tEoSfg5wVXzDGYdVRICaGPvRC5DkyrRokbcKMJz9RLG6BQI+Py69KHOM9?=
 =?us-ascii?Q?kUb8lRnRKtv20kXjar1fS5jPwxIxJdqwnDEvqph1YC3G3nlXhX13PsorJ89V?=
 =?us-ascii?Q?LF4U9f6A510WkPbyjMqe9Z5X5gloGfieT5ojgSRR5aidoskVFEPhSg05EfeW?=
 =?us-ascii?Q?St4cblaAlN/p/UZn9RLg5E4n2RjOitB9j5DOPqfgo/v9oSO8v5snnUxdfpYy?=
 =?us-ascii?Q?tOAVVGha6SaMNGhdSQTaoyIRsG+70sUscfdsLQzwWOXznwzQDMZSHt2jbYY+?=
 =?us-ascii?Q?0GRIIw8+iliUtb9Opvh572fs714cbkIlX/MwkZ3HrpERdGzgyIgI6Kwue1yt?=
 =?us-ascii?Q?P5x2GL+6Ck41N/fCcJkIt/BlZJFQj+NBBgTeDyENWfl0H7yOZ1+UlBkBsvYN?=
 =?us-ascii?Q?A93YXE2aoIb/oEQ3tn70Wtj2oCOkuUyN1ClVwy2MhB2OI12cRU3WCF9XImtH?=
 =?us-ascii?Q?ZGQ2wAgmsf6MLHhLrmbcbDm7G8aOR0OKPyCs+7oLdpapYokRbTFB6kp5XQm6?=
 =?us-ascii?Q?PGSeS0/RdtYTXI0u9w0HTmUGyWXe+nP7YjJvft6vWvmorxNA1JQf4zrBdisM?=
 =?us-ascii?Q?mhHZnlb9uKPCzP4++8fl/BWkUPrxNCrlA7Y48ad1QrCxpNP4hBbKhbPIaENQ?=
 =?us-ascii?Q?sFOBi17yp3lndZrOr8mR34QqIfShd8+qw8ynE9/A/S0j91f4laQXx0uugGiy?=
 =?us-ascii?Q?YUaEupYaD07R14df//37cpWUPUT2YcNEu43MQp3FttrYinCkfXL+QEmpxvXx?=
 =?us-ascii?Q?pbkeA4qcaGgg3Q8vWl94dSmA+vedIspxIM+C9kOBGA6vju3Uh/uCz9VsHTcw?=
 =?us-ascii?Q?hgg96ayEx8J3Vg+qqO2qN3/mtuMU0tw5ZbG//3lXqwyDJ9AfnEba4wj0rGz/?=
 =?us-ascii?Q?HL8ZOJ/L1EKxYSDyKDUq+aZnQsBzsfKuYb3UH8jlN/cTXcJa7l2fvMPlaDnC?=
 =?us-ascii?Q?YRLi5e09+b2ERDgeihK0w2U8HRnze+77o97+MPX9DPr/Ka+qZYSsrUYot4QB?=
 =?us-ascii?Q?Uv1IjWIFxYm62bJMpF0gdD2rckJ6RVhfz/A4QXBAWTAvPrQmYe1+t6Qm2G6Z?=
 =?us-ascii?Q?D71WfPVmpCfQH+S92jhbuixwQiPV6Z0PTEOvCgIGjIzLPFdzQFwGNM3JbQpk?=
 =?us-ascii?Q?CzpsWKvkBKU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1ckjCiMh3aH7YHuAcYKILzSmiSeqWlaX0cjU6lr4SyHlEcJpmEAmCeyOV40z?=
 =?us-ascii?Q?9e1fR89T7j6Xp4z815rEDhXVCgZIIo5/9Sb04mNpuRfGYPRBY9zvqpgOkh35?=
 =?us-ascii?Q?/IOPcsnkEdYIiouJI/wlLh7BnCc/nEB/fa3oJleLj3SXEa/1YouLRDZ/ieHd?=
 =?us-ascii?Q?Fhgn69Lu1zSjAD4cDL8F4xerway++pdKYp7fMh6cIZ+VlW6jycFV1P5MXmgS?=
 =?us-ascii?Q?mGoV98JXp74/ppnciUAThGSQzIxV/501z03pCA1eCrV3j/v+1Br3yDy4QJxW?=
 =?us-ascii?Q?frMzh866Wke8P8HGgSkgaXpOEwgWy3NKvZOWom5IlZaQ7STgDF21n3deg2Bn?=
 =?us-ascii?Q?smMK5qJYmUv/jkHZMtLRoXgBwR9hcu6+SvkgrewPkzyqBlRl6GTkMCr3k5VU?=
 =?us-ascii?Q?Giq4WnZqwKFeLOQps32EJCGUMPry83QrPBaNQL6gWIPmnMvFyZSyAVDm33RB?=
 =?us-ascii?Q?Nsr45KQ1aoLyewrNb+mw5B+uzTtLwjFV+N2mOUGeVFIHf75PqWqyy4eoQWco?=
 =?us-ascii?Q?wsPshiiaB2TYJsV+YT+NrgZovS94Jcb5smuzQLTnPPYLsbEfZgq8vP23JNE5?=
 =?us-ascii?Q?0oIZWVjvcbOUXUQ2nxNg9O6CsRDFOnW6vwXQ8hIeYJ0z7OlEC4uo+6X9hqsK?=
 =?us-ascii?Q?y4Gl1D9IPDsnjZEc5PABOo7nWuuY9OkIfi+DzpgT6SH8PGC8O9gsn12QD9iD?=
 =?us-ascii?Q?VHCXBZ/dky8PMllRareAMm9eiICY+eX+htBuOVv6YHLr+eHCDo5EzEJso+ZA?=
 =?us-ascii?Q?DvjhpqVdbeaZwt7TnBuqzgfG4taKsF9UKdhPYrjQQNQ/d/iHvMNy0gtC9jDv?=
 =?us-ascii?Q?A8wYHhwRWc07lOdovRO6IA4mL9B02+icHfZr1/KGehCEHBqrBFbeO6zOVurf?=
 =?us-ascii?Q?ISrwNfw+VWQFC2e2Jxr7QeagvEtwLbOPYlUsVvv5ouP/fmLkb9L+vQsiADaQ?=
 =?us-ascii?Q?0KFF0SxzmH8inER9VlRkWQj0uNmQsVFoU7A7VEop+6CPD+kMmtDkfsXixQKw?=
 =?us-ascii?Q?2IiT0TOhGwzqVh1hNf2+uFaw4c9EhIXWPBB8fpLj+KDyJZCRxevz6pgajGiD?=
 =?us-ascii?Q?6e7tp4RsiOIP/Xavv4sXZ1KwcKti2bFyaaRW9q3aE5/5bOj7YvQSlvTJyFcy?=
 =?us-ascii?Q?kpYDF/yTAwhXZyFXDbgZ9IjCIjLtGugtDk4bAJjQ/gr1GrnLqqhzXPE57QWJ?=
 =?us-ascii?Q?tvusWzcZabNSlAxrYhLQt9cEh/6g/IXqiyuBEp/8uUB53JY5tovj1FwY7dBa?=
 =?us-ascii?Q?POWqTvzzR9OjJNSNOYA1vFMFL0NX1qP4KFiAOxEPvZl/bNot7SBXmSsUqQRb?=
 =?us-ascii?Q?i2roYAb0OOObJ5qpVpyF/VUBMiTm/Ffg65Y6dDlp3oYLtb98fMfrqLNlir5o?=
 =?us-ascii?Q?69dWufR7H944Ebi7jgYNTTnrOi+apHLvwcBfiNyXb6pO8LPkL+toURxOapMC?=
 =?us-ascii?Q?txtSAZPvR0gYWoN6ASv0OhUDjZNkxjBzocQbB3nXsjABL9de5niWUn4J1UsY?=
 =?us-ascii?Q?1AM2M6EZA2k2+hd/hd6eZSjh1JlTWb6QuWfgRP1wqdgQbsfEPseK/hCvJ0i4?=
 =?us-ascii?Q?kzEeLZAg6e2kdvXAlIY=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e8ce38d-1495-4e9c-fbd5-08dde633497c
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 13:03:31.1146
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RspixjdFPbAilZf2tLBPnkO+nFqvF4XSCsFdPZ/SEHIuDVu4IvPjaklp3X5pg66+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9583
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Aug 19, 2025 at 08:36:45PM +0300, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> This patch introduces the DMA_ATTR_MMIO attribute to mark DMA buffers
> that reside in memory-mapped I/O (MMIO) regions, such as device BARs
> exposed through the host bridge, which are accessible for peer-to-peer
> (P2P) DMA.
> 
> This attribute is especially useful for exporting device memory to other
> devices for DMA without CPU involvement, and avoids unnecessary or
> potentially detrimental CPU cache maintenance calls.
> 
> DMA_ATTR_MMIO is supposed to provide dma_map_resource() functionality
> without need to call to special function and perform branching by
> the callers.

'branching when processing generic containers like bio_vec by the callers'

Many of the existing dma_map_resource() users already know the thing
is MMIO and don't have branching..

> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> ---
>  Documentation/core-api/dma-attributes.rst | 18 ++++++++++++++++++
>  include/linux/dma-mapping.h               | 20 ++++++++++++++++++++
>  include/trace/events/dma.h                |  3 ++-
>  rust/kernel/dma.rs                        |  3 +++
>  4 files changed, 43 insertions(+), 1 deletion(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

