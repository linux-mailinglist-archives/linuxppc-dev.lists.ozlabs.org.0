Return-Path: <linuxppc-dev+bounces-11425-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2638AB39F5C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Aug 2025 15:49:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cCN7S62Sfz2yg0;
	Thu, 28 Aug 2025 23:49:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2418::61f" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756388996;
	cv=pass; b=okYxvsjGBKQp05Pqja2EGKavXk4C5nA3DXBVM75Ono+mbfn3XXpcDvinxbz6s/+CYlwtk/bVU6CvkUwYTduVY88OxzKhNdkOmuREm4sVr+dM8Fckq/6JDP8GyxP9FECnNfvC7yzVBMlV9h3f7j0BJM0avqSx12cXAXwtjOwg4seDjn3a57/SKj9Cp7VKXo8C5FlG/M/BtovlhXN+CoHbOnZmEjCcz/C/MPmfonUtKdDExtVsa/mjgyZOS2m6MpE4KBzMjfq32WJYoQF2sfmDGi1aZplozqRzGPFbLPcpE5YKWX0NfmnF9dQlKF2KF5p/Cner0yOfnpScYQykJsSQ2Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756388996; c=relaxed/relaxed;
	bh=tmf5+3EpnHgeIhjFkX6hdDPoeYYCVpHZKSkOYrOxExM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cJFj2rk3y2BZIk2IBciVUb6B3odTWnsFPm6sYi1SDNdFHPC4krXwbLS9rxD8Cy9YALVUmhLudromAiiZqa0Fln8fSZGsNHsy4nRRexCaf54V/TcDXhahJo267BZOUk8WTUS0PNo5AiofB52sAF0G1ePdZG/TaZHFzCbS3mevclQyRXRk7kWy7wEk7OD/RtSWyVzGwmnRxfUO98poIQ5q4sG56mJS5GBTuV4dEpxViUJKU7CqE3GpSBEHz4Jy7D+emcIHvKTiMgY9s5ErUGdL3Cj72o4zrGUM8c2a5WyJy+2K/8OxreZgQeFV9guxhpeeS/IGjbmvw1IC98w3xhCpwg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=aykgNITy; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2418::61f; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=aykgNITy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2418::61f; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2061f.outbound.protection.outlook.com [IPv6:2a01:111:f403:2418::61f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cCN7R6gTNz2yGM
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Aug 2025 23:49:55 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mOyYTJbjsO9NCf8rOgy6Inz8ZGlaJmXwbgUjLmipwRKc9+8RwUUalO4/vmuNQn9F/I0tOlrhG67B/DZQndJn9k3oKOWnEz4rDTyQ23POEHnWbu8toQRA3Yd6DxHWksoIcjBBBsmnbXg7nmAcg/ClbSGZzfn6Ykx8D1tWNCYIgFb4n9BEfZRWMVvLmJR/z72ufCX5BDs7RFXlOyQK+zKvjzH2hELYS9KfN0QCuw5I5QtTsM1r2iohhAGeUgTJvRZQLHthlNlzB/FW8F2GZsIZxqMLww1+iH03v56Lqvg6kbMOP4lmQmbbLrRSnlDQU4ml63nfcn1Qb7X6yjvP3akG7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tmf5+3EpnHgeIhjFkX6hdDPoeYYCVpHZKSkOYrOxExM=;
 b=ZZlZTyrwHmzgwzgCSCYXcsv+D/spl2cxkcuiGgwqtUzBH4BxtzFl3cnN4cDOSIcjA4ZvP6QsG8kdu+w4w6DKqaZKbOUv/H6/UJ7a0Oe+R/gpbZLe2ZSD/TTyNZbtrEDB8u3SnoHHKuNklxx2Nj23e7oEXKdBDWcJQ9ZKhK51YgDDiozBHHFp9B7s1664Jb3+MWSQ7cDDYzulWoUElteLRPoOFwQrEUWmiJw7A6HW3X3Tt303cr8V5m6pq/NldilyHOdD91SYfszt+sMG8wlX0RvwOKqBlZ0Msr2b97VESpbo+ETWD//0TGKSzDYZN1EH0c0ZZbDpAYsBbIngEvX4RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tmf5+3EpnHgeIhjFkX6hdDPoeYYCVpHZKSkOYrOxExM=;
 b=aykgNITyuWdx25Vhw+lXn6KBQYJ8yEmlrz5q69YYWlv4+2QIdxKW7xeYV9l4QVSZdJIYFYIfrJGG5x7AIDhTVisX21GRv/GAmAy5tjvtqFO8p/SFxHFxwurrg1WrZ5+21aUwNnek24kZTL5DOTvriaAkoxiQlbSXK0wJQe5NMPgfoo+hQetjZxQCl6szeGQDt0KD6U7dFoda/Me7dZ7dtrA9m7NNI2r2hU7qX6YmBhYxw/Q1OG6g9LsD9mwJns42nORjUYqnsQ3lylOGft1PjLuzTRQwmfJW9tWDmuXo+fzSpEanNt7K0Caq7X9ctkCaMR6m1GozrU/7daOhMbrwZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by LV8PR12MB9336.namprd12.prod.outlook.com (2603:10b6:408:208::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.13; Thu, 28 Aug
 2025 13:49:29 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.9073.010; Thu, 28 Aug 2025
 13:49:28 +0000
Date: Thu, 28 Aug 2025 10:49:27 -0300
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
Subject: Re: [PATCH v4 06/16] iommu/dma: extend iommu_dma_*map_phys API to
 handle MMIO memory
Message-ID: <20250828134927.GE9469@nvidia.com>
References: <cover.1755624249.git.leon@kernel.org>
 <4f84639baf6d5d0e107fd2001dff91b6538ff9ae.1755624249.git.leon@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4f84639baf6d5d0e107fd2001dff91b6538ff9ae.1755624249.git.leon@kernel.org>
X-ClientProxiedBy: YT4PR01CA0489.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10c::8) To CH3PR12MB8659.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|LV8PR12MB9336:EE_
X-MS-Office365-Filtering-Correlation-Id: 10e3762c-9d9f-41d7-cb18-08dde639b556
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ho/h4y0ux9joF8qU9L34AmpmcnS+9JVoSS3ehxuqmJIPmZ10QIBkBvTZAqvV?=
 =?us-ascii?Q?hIKq/J5YNFLUw3H5lBVc1B09vk5J2Ea+EYUUlwJ07CnvdIpjL3SDHj9iSBoq?=
 =?us-ascii?Q?eTkXoWwjU5DUHZtftR/yoCL2133rJ/U4CaAnFZio4Nc/yJwHTp6Yll1Ivofl?=
 =?us-ascii?Q?QCnqx8RsPNZnzlFJu/O3i9vziusVf5l5bAXjcRQ5DEbCGOBZZTLs75rNxYi6?=
 =?us-ascii?Q?D6U2hPpRb2ctl4vsYs3JZEa7eEs1oGWyk5dbtfbhdvCFUUFjVPGYQmci3hjb?=
 =?us-ascii?Q?Px4G2d15pjehZlDSFxm+65Tm2CX8kKotwIQdqEMbUFj/PofJ4tPvxbapucF5?=
 =?us-ascii?Q?KH3LLtmjZaASk8H1LsJD6/qOFEHHxdaDvjiZqzbj3wnpfREdjLaifSYOgDbr?=
 =?us-ascii?Q?JDcilP1Th7UoPeQGU+ALwb0+v+PcBTf1sJc5i/CGel/Gk//7BU1skEv0PmWT?=
 =?us-ascii?Q?JLX2UXhuV6Sbq3I9mkeb74f9YtIp5H6VhfjYYH4K5Oc3n7JCLa2vEJlI2sz3?=
 =?us-ascii?Q?Bp9LAgJX+VolivAYMuAgheKgmUakULCM6eXqSM9ByFTbB+RLklJwVwYPB7/Y?=
 =?us-ascii?Q?T5nv6qI16UzYfSKQOVOj3Q8pIrC84M+KvyNGUIlCdqWmXepCw6vk7udUkjC+?=
 =?us-ascii?Q?2sdfbzwfgQE0hlFn04Y/h2GiXKyu8LVQqTvxX/vum44/QcSNf/waq2nUgh9u?=
 =?us-ascii?Q?s4dIM/UKqQl1Wydk7+8dr52Fn29EF1aG9HtX6Kes6fRwQ+b/NbjQCFTaumzz?=
 =?us-ascii?Q?6kJwxa1sd1dapLYVsEpMEPYMla5I9LdBYfFt6g5r5vRg8JDye+edCgNO1ac5?=
 =?us-ascii?Q?qCrXbId6DMcb3kCCmEL63qlLBlbmRusaN9MC0GK4NbTAMK/geki4HiHqIhaX?=
 =?us-ascii?Q?ZYDIUxD9UxTV3/8N8jFy/3rLuwpxz/zaZgTBotm3Go5eHYf7N4Au3ScMvPyo?=
 =?us-ascii?Q?GJtOlyD8rTSMTq6ov/HU3KLtq9QTBdyYh+mo0c6k8yBstaMFkOVfjPgx+RTQ?=
 =?us-ascii?Q?T8rjtPShvqynrDx7cej+uOiGIKz/71BRjcqLc3m9VIqZQd8g31cVtlEJ9yKF?=
 =?us-ascii?Q?Shgpj6PyiDFXICPZ+lkM+N381jIDNvESQmJkT42+Xom2LCMxJk/vrZ6+nyuj?=
 =?us-ascii?Q?XNBAS3C5soC1enzLogesRYL0wxxSm+m0v0tLrEX2kBmpB9sZq6cd4c8D2Arw?=
 =?us-ascii?Q?jfwaOQJjW0a4uE8Ub3dpTuZoJlkox9Db0ENO+AEQzpjQICsEjvw2Cy26pBp/?=
 =?us-ascii?Q?6BEeKO8nkpajz8EO1ll52RC49xW/VL/xMInGx91anXKvTnumco0wbpP6z126?=
 =?us-ascii?Q?nBEFo89b4fT8t0r0XUqF0ZEt6akuBOG06yghEYZxpgbtb7Tn2v+fw7Ug461d?=
 =?us-ascii?Q?oiR/7FI/LdRACc3DUAd2+mt7DyMIaaAChZNtx9bz2NScH+q90qG7oTdC4eyp?=
 =?us-ascii?Q?mlRVDPFKoGU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RnwI07pU9MhS3fcj6ZjxhKBugYZeOXHf7yczQcXDk5Kxm6tSkU2JFVdCQgSf?=
 =?us-ascii?Q?poBjKBrW54ONXTEgj5vJcSLdueLOBEgoHLDUbM8D092uLdIHdWjUy32VwSyp?=
 =?us-ascii?Q?lwqpffHv5JPwiFqYYdTJ/8bGBrAqhXLfkcIEVHOdY3T92WsyQZk2adqD/ZIz?=
 =?us-ascii?Q?siknKLCQDcUAsoMn6Hcu6mam/lMrbvIhL9Q3xV9jiYVVvPaT9WOkINbLSErr?=
 =?us-ascii?Q?DAn7cj6Ke3+ARrFp60MOhkyoMUE5Y31wm7/EKyGOWv4GNkms3tUi+L+kZ9du?=
 =?us-ascii?Q?28iT4kPOFvVOXjH8aPsfL9Vz0DqBKtIEmvW3JVWGjuDUcVUt/QA7Jwrsy6GK?=
 =?us-ascii?Q?/FFxGgRsPDluK/debsNuL86P3mvlhafZTim0nbfW3+eWjit1XUk72n7Hna2n?=
 =?us-ascii?Q?PMN/STHypoiTR1UsNqcts4esOtF4xvrFmlD8QJcvv/TXymNWZ+fxlXevmVBV?=
 =?us-ascii?Q?a0HtfN3wmILiWcfhCu7SepBuDI9pXKHaJ+qH2+zqtqBWb5tIGeXMqx3uT5ME?=
 =?us-ascii?Q?ipy1xI/DjxJXMQrBoicmp1lF6lBD7BHfqR14hXwXy3Y9F/FpqinD1DZ3n7iH?=
 =?us-ascii?Q?yfZkAT+fq/RaKLZPKAKa4wPxjyzPE1kdXUSs6ueFCml6w3Po89qDduHyZcS2?=
 =?us-ascii?Q?Eh5BpE2GHDnkMRyTJbt+G3aR5ksrDMGf45eUGZkeZZZlVzhghbaqFMU2qArk?=
 =?us-ascii?Q?MpCAA0bg8TdC8PFeVu6Q+2jYebMoL/D4IjiaboXIBf/IDkaJkfIxDzAo1K0n?=
 =?us-ascii?Q?uHpjjjWQeG39f45Y9rr2E07WFfrbTzJY1bDNUXm/PFaKTJkiSzwE8M2f1fQK?=
 =?us-ascii?Q?CXxYeiREeo1yMg0ktCcpkJaYMMAg7pngvccQW0xqDfwdv6omIul/ykfvoovh?=
 =?us-ascii?Q?2VuIJ5s5sm2hx50JFkstQ+y/ppnwN9OgFLxImLg8DFIddHC8Nk9j1fpbYHYz?=
 =?us-ascii?Q?XNtJAzUE2oK9+yD0+34wOEfzoG9/OcVv8tqEz5Nzw7vipUsQ+6OG0Hv3saBS?=
 =?us-ascii?Q?lER25hBAuYh1wSkE2TPBY67aaCtRqm3j34SgnFJZJ6ZWvxGkxPpbX9fRkfwD?=
 =?us-ascii?Q?ESkioC7HMJ3dnBC5e3hhmbcAU7vx14RcEVglsgs/wN9GHYhY4zt5nRcsPcfK?=
 =?us-ascii?Q?gqmd89a3WYDRl/Qb9AP2TIfsgrCv86HmsiLgh2JhktltINwAntOtuLmRZR0r?=
 =?us-ascii?Q?7b5T11hGwVCtx1sepX3Qui1af2VlYXNppiXQYfYaw8XL9QNExZgpwUBE4OKS?=
 =?us-ascii?Q?TVG1rBdAtxDmQsO0C9uiovD5O2y9qou2ZXDL0fzmofi0Nuc2DEtm4lAvGsvu?=
 =?us-ascii?Q?fpAv7PeWh4U+/RmGaNi1/97hfeuQg+nY84qgOiNmwX6IUo7YvXi+TQL09p2y?=
 =?us-ascii?Q?qd7e+Z5B8u9UXUvGmE+ELI6bu4CD1Y4Lf97N02RDxSbqlE+0/2Y3Nr2qoHgd?=
 =?us-ascii?Q?zjIyeI72fYtKuI8QrXiG0eTi/hpTt+k1rfiBFbBo9gMfnnaeECQyUZvm1aeR?=
 =?us-ascii?Q?fVrR4C7hcO1ffd2v8PMuhgCy39AOCVI82CZFCIdR1smzs2YCUVr9xpilMHSY?=
 =?us-ascii?Q?9vdGc6Gnanm4xzcJClM=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10e3762c-9d9f-41d7-cb18-08dde639b556
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 13:49:28.8832
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TbARRk5NFlGpGAaiLFsgPVLVB+j1BOxQvd6Cpogz3hVgGWkgsHzBUyp4/HAjIla7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9336
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Aug 19, 2025 at 08:36:50PM +0300, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> Combine iommu_dma_*map_phys with iommu_dma_*map_resource interfaces in
> order to allow single phys_addr_t flow.
> 
> In the following patches, the iommu_dma_map_resource() will be removed
> in favour of iommu_dma_map_phys(..., attrs | DMA_ATTR_MMIO) flow.

I would reword this a little bit

iommu/dma: implement DMA_ATTR_MMIO for iommu_dma_(un)map_phys()

Make iommu_dma_map_phys() and iommu_dma_unmap_phys() respect
DMA_ATTR_MMIO.

DMA_ATTR_MMIO makes the functions behave the same as
iommu_dma_(un)map_resource():
 - No swiotlb is possible
 - No cache flushing is done (ATTR_MMIO should not be cached memory)
 - prot for iommu_map() has IOMMU_MMIO not IOMMU_CACHE 

This is preperation for replacing iommu_dma_map_resource() callers
with iommu_dma_map_phys(DMA_ATTR_MMIO) and removing
iommu_dma_(un)map_resource().

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

