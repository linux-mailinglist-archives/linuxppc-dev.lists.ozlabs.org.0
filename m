Return-Path: <linuxppc-dev+bounces-9300-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FE1AD6874
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jun 2025 09:03:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bHtlT6DNVz2xPL;
	Thu, 12 Jun 2025 17:03:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2418::621" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749711781;
	cv=pass; b=B7OvkQsbrpTYKdad2lV1uorsV2ncXFmPoLgp7rhbv9vDNWOTSfqUlljUKWecU75eMjxktkgz++GXwkJYcDeAfHH5rOdH6KJUloQlAcWJNtFsLx11SiBhKaBFkbaWKfmCat96RcwWnQOa7KF5exg+7uDYv7O31DYaQrLLIA4bGVm6B4Ggkc8PW05Qr1Yh/29arRvz9VtXuo9cglCxiwbvoC3e2q74uZGDx38oU4box4Y1DQcKXf59qOSKfsH6OVKK+GQUkuWcLXYETiNauyoleBUblvJaEsOD27mXQPCYWcFIcqDEyDKrYHScPDJLjGCMChrHP3vR7uJ4+Y8ZcfVDdg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749711781; c=relaxed/relaxed;
	bh=vUCXf5yox9l5DUFaTFtbl3hXhpvAgfaqtQE0oVZ+/Qo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KbvMHGJa5Su/KsOeTEEvOTs37xaLScka5gCiZXD66jSw6hxJpTksu/uB7HIX+BhirBKXLeDiYoHKvCRGAdrjKBevGad+Xw6gzsRfNoU0UB/nEyuQzirWyLPXo2jm0AlKLfIljKeDU7ooCMFzhSI+rMmcmkV8tcRkNsJeTIyEWcv3IPq0VnpufLeGg1nFDkccJSlQ4VUpNc5gu7BHU/MzEIJ5GBfZOFPCs5W2irfIHV8UzOlj3Um5sLtMFHriiUz30kLOUWXk2j9G6gEmnc+oCPtkj8uodAaVAuM1kQFlHHgLxm6/zStSw5rdBtF6DLvOKzT466Cv77QsL722FoaW2g==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Uoda2a1M; dkim-atps=neutral; spf=temperror (client-ip=2a01:111:f403:2418::621; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Uoda2a1M;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=temperror (SPF Temporary Error: DNS Timeout) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2418::621; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on20621.outbound.protection.outlook.com [IPv6:2a01:111:f403:2418::621])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bHtlP61hkz2xGw
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Jun 2025 17:02:37 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q/5CQrzJlXTDzsqsH+FMRzSEtrH71NWBcSEfnZn1K11jZOv76DNEraI9c0Ib8L6xsTRjg//IP1tBUkapXjFlcjBX6aXdkyInn/5GyjuIED41MY9v+xGVP0egrXYyghpiSpaEniwWeWb//0EgBB+L7lzGXU5b1OjUumAqvHP76RDtHnGNJS+WJI+iGkTc7gzi9V0ZSn2XMKvmluZ1JyNWqGe+o8YmGv8RWfH+5ZwCtk6IAowU+wRFbgYVQUrWB/f6tcuwFev3oBM3d2u2f6QLzcGmnUkvzofquBAKf3vLXR4jlVytsIk+GETrJSzJuGNQvGpdNPb0Z/i6SBuvjBaYnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vUCXf5yox9l5DUFaTFtbl3hXhpvAgfaqtQE0oVZ+/Qo=;
 b=bclDWkIJxu757+XhbskISKV+Ias2tqrxUZnIzSJ4XJb108flOnns8qvwyIDrNNdjC4ezg5rPq+aIzPmfujCSwjdbmmlgz8FGBvgATEI/OxK+eRCjnE22xTTLVbF4h1/1ZG115uFpB+IKQzEZiioUe+Hlug7T81g8L2DEF9DRzUxg/u5d242CMsc+JI0S6oFCnu2oj5Uz2yPdJ35j6oib+K/yZKo/sfy8nzcLKQW6zY42jKWInPychhjXopKX8I8vrlBLIAz5B6dyc9UYkhMTeXdODeqqHZ+jVKz62N/bHNAgwsYLwcoSAPeks6i53yNSIPi2uxHMFizFMpQuJc5DSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vUCXf5yox9l5DUFaTFtbl3hXhpvAgfaqtQE0oVZ+/Qo=;
 b=Uoda2a1M5WLTPQE0SRcaVRuhqpe7PnzCrV6lN9VOFBSsxJCEVhnG7h4aypaMXJ24S4c0YG7AL03J/C6kU9M+ny/DNYa6m9BrDb4EhLRyPrE0Gsyx5uOsZ7iWayVs0DN211C397TtGCon1kY3SLrJ87sxQuywRSXacLA/KBzgLfd0B1GygVYkxihLC+Ytk3NeB2jdzwflUmXJheqCUXJPUQ3K0QJmVlMFaxS3ZcSQmgvzEX+bqPDGqB6KVfuY+E/sj5EhADhk4UgIJLVeocDL7qBvlZn+Qr1LakbqboKiCrDUmx3gtxqqsbbTM1X//72TouEOX/iZivzByMA2cM0gTg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7728.namprd12.prod.outlook.com (2603:10b6:8:13a::10)
 by PH7PR12MB7257.namprd12.prod.outlook.com (2603:10b6:510:205::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.33; Thu, 12 Jun
 2025 07:02:18 +0000
Received: from DS0PR12MB7728.namprd12.prod.outlook.com
 ([fe80::f790:9057:1f2:6e67]) by DS0PR12MB7728.namprd12.prod.outlook.com
 ([fe80::f790:9057:1f2:6e67%5]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 07:02:18 +0000
Date: Thu, 12 Jun 2025 17:02:13 +1000
From: Alistair Popple <apopple@nvidia.com>
To: Dan Williams <dan.j.williams@intel.com>
Cc: David Hildenbrand <david@redhat.com>, Christoph Hellwig <hch@lst.de>, 
	linux-mm@kvack.org, gerald.schaefer@linux.ibm.com, jgg@ziepe.ca, willy@infradead.org, 
	linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org, jhubbard@nvidia.com, 
	zhang.lyra@gmail.com, debug@rivosinc.com, bjorn@kernel.org, balbirs@nvidia.com, 
	lorenzo.stoakes@oracle.com, linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-cxl@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, John@groves.net
Subject: Re: [PATCH 03/12] mm/pagewalk: Skip dax pages in pagewalk
Message-ID: <axbj5vrowokxfmrm3gl6tw3mn6xbzz7uwbxkf75bbgmzf7htwc@vcr5ajluw3rn>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <1799c6772825e1401e7ccad81a10646118201953.1748500293.git-series.apopple@nvidia.com>
 <6840f9ed3785a_249110084@dwillia2-xfh.jf.intel.com.notmuch>
 <20250605074637.GA7727@lst.de>
 <b064c820-1735-47db-96e3-6f2b00300c67@redhat.com>
 <6841c408e85d3_249110075@dwillia2-xfh.jf.intel.com.notmuch>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6841c408e85d3_249110075@dwillia2-xfh.jf.intel.com.notmuch>
X-ClientProxiedBy: SYBPR01CA0084.ausprd01.prod.outlook.com
 (2603:10c6:10:3::24) To DS0PR12MB7728.namprd12.prod.outlook.com
 (2603:10b6:8:13a::10)
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB7728:EE_|PH7PR12MB7257:EE_
X-MS-Office365-Filtering-Correlation-Id: f502f158-533f-4b51-fae3-08dda97f11a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4a3FS1wnQOy9+H8iy88nbDY2bWFS0ZAe6UogmZqC1Xt5Tr3xP2LHgqFw4nJb?=
 =?us-ascii?Q?7bCVBNill4fJs13n7tLjTlCRZnz5oiXh4dbyNUSOR/RvdpXpUFjFrGO5FyaK?=
 =?us-ascii?Q?zdZMrkTPW4B9rDTc+sooBHR25NYgFYyEbzik1/ufcg7jsGbIcnZpNtGnFOl0?=
 =?us-ascii?Q?b8kn2jx1110REbGAgYTomZcmgetNWu5Fgs/VK1BXW/UQgvwb3gjpyLN+PnEr?=
 =?us-ascii?Q?ZSNq2QTS/+wxwxfpLO0v0Ym2iZNcwMfIzwWUlmOu8ExzfCEYZjRn9xCQfKGM?=
 =?us-ascii?Q?V5yLRzhz/6MEUKY5p19QzO7qNY9VnMrAzfHCQtSW9rRX6AAldK79oNIPkHx4?=
 =?us-ascii?Q?0sv8UApzIa9uX+tq+UdgG2PVhi0NskVqny2BUt5HzytiOTeSKCHttkjIRzhV?=
 =?us-ascii?Q?V9DHMCAoulvSctdaOgDNlzP4bBzAFPzPnB4QqtzPapktvMHFVEZ63oqasDiS?=
 =?us-ascii?Q?whrn3YDlFVuU9vFp7f+YfkL3WTj8lOR+0fPgxdVOXXvR6wPHUEnY46lkpOcb?=
 =?us-ascii?Q?tr8nf2BVV7TdevzZB4qMxQKUgOKFlKYf3o4C1zh1eRQA92kindq6reahZT+L?=
 =?us-ascii?Q?4LMpocYw3Z/1eWFygwoF1lE8LCGgvOOmYdyPEBiwEi8lDblteIMWDlLFC3Sv?=
 =?us-ascii?Q?D3AQVAgELZg40wQtE8Oilhb3oEmTdnaDwn/R7Ln88mkPYLNNWG9EasjUne4W?=
 =?us-ascii?Q?wD9JYxRJDeIvlXOudvWA/a61lxQJnJdw7Z/MvqrSXsw7RRVs7M0rhpAj6I9h?=
 =?us-ascii?Q?Op20MC42CLuDZICR3o/qhKtISXtvIMMuOJxwpDIFBgNONvPJgbqRuZ+tFLIl?=
 =?us-ascii?Q?Z2n3dlbM5TBu4bnqCfaD50eW+nSxNu/k1Xv0scGuxwmqFRySgHzIqQGO6799?=
 =?us-ascii?Q?VnA8m2Z/yxKX9Wd1/QY1RsUd2TgfreedFXU24WImQ9P7ZKKd9HDr1h3kTfss?=
 =?us-ascii?Q?Ud4y4Cef5vCMCJ01QtNENt/v1MryKV1uhiyZZKFtpRRB05ncMqICUp9mQRwK?=
 =?us-ascii?Q?O73pMRKbUIGWk+pLn1UP/S8Sw35p3eVfpsAxJGkID68xXih/XuAkgh1A/2GC?=
 =?us-ascii?Q?CpbejkKRw8rw6BBL6D8xbegznuRi+tkrrR7Dl9H2kXxkqgJptblWJIvtYVNB?=
 =?us-ascii?Q?xxlD5/GZCSi/7uZe1hMHVW9JV6TDmG3eChMr2Ru80QN5BXtrrE/8ezl2uJNo?=
 =?us-ascii?Q?4JNnAp6ErMrsNCi2E7oyDnOOdBnLWpW/5jaNp15rjxKHdZJiqy8FM21Wa9P5?=
 =?us-ascii?Q?7ukAkZ5JkX/60cuTnZ+SH/NlsWlWWnESFLvWOfdzMxayisicqAKNEL/IVPVz?=
 =?us-ascii?Q?ZywR/QjWp7Zy54yXU3+jixBspfOKuLxFETSDLZkSa9dv8Vlefnk+wyjemBdv?=
 =?us-ascii?Q?AMgJbMgIkstTEF5rXrtR5H5DlTgqnG/XJZ5nEvrsWZE/Oru1cDm2EI8zBvCg?=
 =?us-ascii?Q?QW69X9VM6zU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7728.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aFlEOLD2IHJOSSXxiB6jHCmiSGiy6QIllTDJ9kVah7bohtG0zH9f/nFXHzyZ?=
 =?us-ascii?Q?GU2iozlIngO6tN+q1sD3SuonjBbOsgEzES8iafV0i+0PO3o/zpFddFwY/Dow?=
 =?us-ascii?Q?0pOkGdFxdaXsbmkw0mDTvc3467ZZA5Qei+HQnfagv/QnvbMi8LUGgg1fZf/p?=
 =?us-ascii?Q?3vi8eFBoz6X7wkwi79pEYRBzw6lS3E7uilojRV8U+LQLHaZx/+hnlVkpeo8W?=
 =?us-ascii?Q?OhnZFUWEm+JYwebLwMNRsNX6ZDgOl860ftoP82VbhuBvPmeKO7jUVwoPBA/4?=
 =?us-ascii?Q?cjlDd7LMDhnctWp/MPiznWbIYPu8FxGy9BjpyxN1bvQRG8RRGJkolGRTUNVp?=
 =?us-ascii?Q?a4Sd1kQfDg7UNQTF5P8XTmV8hib/Qk7gMdp3PzD3d2pd6Ve40HbpXNpAi1km?=
 =?us-ascii?Q?+Fv9cI/hJ0YBIXWWUNVleK+eswEuvEzOmQC+WILacr3GAJ6psuEpKFT8bXip?=
 =?us-ascii?Q?dkY+Yh0jzbNEKE4tRez8uAQTh7k8eTphUHtDCZGm1jFre0ectS8Zbb/7AyOF?=
 =?us-ascii?Q?htsbOn1UoXdN/HsRWptMHs+QWwHC0hhCywVwkkIhaYof3jHnv1dQix+aHD9L?=
 =?us-ascii?Q?lK96dlxMGPjvfKj+W4+jRwsuBZJ9lDmuv+DY4ScFTIWMjG3SpiROX4ugAfbB?=
 =?us-ascii?Q?4hBEiRlc8o/jDD4LS6w0EoR7VhZovLzXKDUHIBf6CwPb+3RI7avTKsMHvBQO?=
 =?us-ascii?Q?N8Yu2T2RwMN2iHUVpuxAhLy9Ar5u3OTcIgKu00dxL8A7Fpf9k9aIjR91ZyyP?=
 =?us-ascii?Q?LkDSpQH9JGBTMmE2JWoAdrvwSXse3AclDVoDCf/Aq/GNlKOSi/6nvHacm4bQ?=
 =?us-ascii?Q?1z9sM4jcEFKszb2T64Ay+S8nO0wHvLM5MrFUQZ28VrKGcO1NbQXCRxKXCfqr?=
 =?us-ascii?Q?c9m+cGTy7S6xxU5OqmGRj7apMrZLzu0sLdqEbIxlvuGIw1N13b+Zq/pyfNCe?=
 =?us-ascii?Q?SB6vyVhkPlG1RV67YCjWramP57tNAI7M5xvcjPR3G9DlCRqeauof6/c6/VB2?=
 =?us-ascii?Q?elpvK7j8OVNVh6xZ2ehhZftmvPvn6Pcs1UK8/kd9gSk8h9A67PD9BrpZ7WRX?=
 =?us-ascii?Q?NY/adlHz7nGCYLLOtUQL4D8Mj91D2zVJLrAxY7Y0mZrxGf/G1IfVUCHgmis2?=
 =?us-ascii?Q?Ne6R+jMR7S2fXx0h5XfaomiSLFyjbdBeD0cKsn7hBH5sVNcXLJs35ONe6POP?=
 =?us-ascii?Q?/1njy5z9tcmoB66WXBjYnx6NiN6OJxEbI5ZeAV7pydYtrL9rFiZ674Ab4m1f?=
 =?us-ascii?Q?1Y7h/GDMEtt1xOm/J0pOfWsY60acKXslmwWnwOn2KXjCzXFNKyAAHeyBJQHw?=
 =?us-ascii?Q?ch50gcow2AjcizDTLQ2RirZeKmahbqU8X2F5hMXtvgo0JW5eZvve3ftUAbMz?=
 =?us-ascii?Q?fthN8mMODz/wNJ7t4y46+B8fAOiRBpT47m/nNONb9QZU3W7CKB29fyCkwt3P?=
 =?us-ascii?Q?/V282wnyFGRmG0az2n1g4N6RIw0IGppDFkFavmJaxPkXKOh4+yibR3K5sKa8?=
 =?us-ascii?Q?dk7dLk6ck6GJPhsXxkoOpY+U7WX04tw5k2hMTj68o6vrK+Gb91BGyDzxIrIx?=
 =?us-ascii?Q?vkaRFRsSiFZmUBFHb33FOiKGl5x45iT+bAzbEf2g?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f502f158-533f-4b51-fae3-08dda97f11a0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7728.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 07:02:18.2867
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xpBxcDnQe+MJ5At/ibFW2GlOpZ5y9xX+HiYXMYLG21aGp9ybCrTpER6dxLQEAifDIAH4fSIg31Ul3Bbdr7HxIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7257
X-Spam-Status: No, score=-2.1 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FORGED_SPF_HELO,SPF_HELO_PASS,T_SPF_TEMPERROR autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Jun 05, 2025 at 09:21:28AM -0700, Dan Williams wrote:
> David Hildenbrand wrote:
> > On 05.06.25 09:46, Christoph Hellwig wrote:
> > > On Wed, Jun 04, 2025 at 06:59:09PM -0700, Dan Williams wrote:
> > >> +/* return normal pages backed by the page allocator */
> > >> +static inline struct page *vm_normal_gfp_pmd(struct vm_area_struct *vma,
> > >> +					     unsigned long addr, pmd_t pmd)
> > >> +{
> > >> +	struct page *page = vm_normal_page_pmd(vma, addr, pmd);
> > >> +
> > >> +	if (!is_devdax_page(page) && !is_fsdax_page(page))
> > >> +		return page;
> > >> +	return NULL;
> > > 
> > > If you go for this make it more straight forward by having the
> > > normal path in the main flow:
> > > 
> > > 	if (is_devdax_page(page) || is_fsdax_page(page))
> > > 		return NULL;
> > > 	return page;
> > 
> > +1
> > 
> > But I'd defer introducing that for now if avoidable. I find the naming 
> > rather ... suboptimal :)
> 
> Agree, that was a "for lack of a better term" suggestion, but the
> suggestion is indeed lacking.

I don't like the naming either ... maybe that is motivation enough for me to
audit the callers and have them explicitly filter the pages they don't want.

