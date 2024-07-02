Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02CD9923BD8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2024 12:51:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=gyCBhUOB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WD08k5ztLz3fqM
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2024 20:51:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=gyCBhUOB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2416::600; helo=nam11-co1-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:2416::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WD0823g3jz2y8Z
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jul 2024 20:51:12 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oBD8cxQNCGhv2q4bUoUgHez59euwEZ/glKv/OoNOwsBu5Mi3bD1QTajL7HGQF3r0dvQsZv1ZX2tx9TBn+q96MYZ/k/xClaD250F9MDSJ0Za8bt+V/wpOR9jKbe/buuXAwsssToe9OuTVdv3S5JmXX3DQhk8F8M0WYTnPuGmOw4Tq9SbCwMr6EJwzS8yNnxRLe/QvBS/nqx8ZBEoOUz+NAjTYCNAKMCwoPtZoiTBSqqlQdJKJt4UdOAGO1e4K8SbGIhxwWb4ahV3qoLpwq3CgPf7253Mk+fffv9VQKBCsKNEDJk4YjaDzWMvFN1U/JZIkmIsD0g8QhMWjpzuWD3HHRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lV7BVviFIlqDtjVN8GCJeGSwbod73hK3R3sV2OAHLEM=;
 b=eo0Bgw6hjLyKBy0Ez0T1mlx1YsMdKUmpoMWsPYEQnDNSgMcUAJQ+dHaYKPKW16fpwGFRyCPQlp+S0f1RiiQ0OJouZZ0KUHFpulbbFuIJ8cTDvA2oZsB4+Bsgg2nRn7JPYtwjNHvDZmQuxpi/liElSnvV2PGihSXjhqpDPmkLpolChY1v++ov0q0zjvk3TGNqcjvUKOwOdTsU1hGkE7Pvdx5g5KjrO2a0EyY0gED465xrSknB2rbBvQuqwCOquqfzExUoHLgYzpBJHtmVqC68xhNNgl2/f1p61bWA3ofTbYU5V3kCylWLpNvnrA+bnIESsZ4YHTg40LZWj38thSF/XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lV7BVviFIlqDtjVN8GCJeGSwbod73hK3R3sV2OAHLEM=;
 b=gyCBhUOBZHUd1tdi9yJxvpqlDYO3zJXG01rt7Fnxa/dBEAPQSVtzsAu+xuQO3pWEdcyiIAwSxLyTUDupnhcrPo86xamr4eAvAw/B9nqZYJdkJrA20EMVXw59dZOuRwIiQLHoP8PDIVA9DnVAkTJzVmEI0X0IZFs3zphkzzH9U+CpkSK3lDL2+LRHUMU3Ph6ICDJaBAliHutPQsZLJ7W4TCxFBvI+Z7RtubSG+aJlgsFujxLp/45DNRLNKslgpXsLqaYfSDwPI6QsTyoI8REo6y3wqF8WzgGuiP7PmiA1xooCHL0YUZwUWz7Nqiwn5P3t+s2tkQ+HIzrCZSW9d0sstw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 MN2PR12MB4063.namprd12.prod.outlook.com (2603:10b6:208:1dc::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7719.32; Tue, 2 Jul 2024 10:50:53 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%6]) with mapi id 15.20.7741.017; Tue, 2 Jul 2024
 10:50:53 +0000
References: <cover.66009f59a7fe77320d413011386c3ae5c2ee82eb.1719386613.git-series.apopple@nvidia.com>
 <50013c1ee52b5bb1213571bff66780568455f54c.1719386613.git-series.apopple@nvidia.com>
 <eb3120fd-44db-4cb3-af3c-a13f9e71380b@redhat.com>
User-agent: mu4e 1.10.8; emacs 29.1
From: Alistair Popple <apopple@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH 06/13] mm/memory: Add dax_insert_pfn
Date: Tue, 02 Jul 2024 20:47:50 +1000
In-reply-to: <eb3120fd-44db-4cb3-af3c-a13f9e71380b@redhat.com>
Message-ID: <87zfr0f4oo.fsf@nvdebian.thelocal>
Content-Type: text/plain
X-ClientProxiedBy: SY5P300CA0106.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:248::7) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|MN2PR12MB4063:EE_
X-MS-Office365-Filtering-Correlation-Id: 19b3bc10-5a53-47f4-a83c-08dc9a84d7e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?5ctS0T3sEfGEmg4Sh7vc6i685Z4ZV61MlXoxr+dur1ScXoj/T+8BwRiURqe5?=
 =?us-ascii?Q?iUlY3q/vQE1ysXhkLPGQwYqd0SNMV1MmRzoY5B2EvRmmfCTRHrR8YbJPZ3cz?=
 =?us-ascii?Q?cPY2tOBao/ldYL3DVKFBtj0eQRYom9Ion1v/m6tAClT5cnKGxMogEpmqP8Jt?=
 =?us-ascii?Q?j4SEOA4Q+eroPHa/fluiJqTeckLpxki458j9caJMQMtb1cJouVnZGHvRxKBd?=
 =?us-ascii?Q?vkoXvPaA3ES5zBjsh/82I9N9hUwue/k4AQYiVslW7jiHcBpAXajoF+aT26lV?=
 =?us-ascii?Q?sZWxbcwyhTm+Ch0bf/IQpDZn4IVYAeZnopW0nYAyeTGjSafLJxo1y5aW4JeC?=
 =?us-ascii?Q?6a46gGL4sHcEtpnqe8UiHjmzxeUWcYRMa02hEBT0iFrPiQk3pWDUSGLKqFSF?=
 =?us-ascii?Q?d8UMOv2t4p89+gGXsqmQsYdIpiqHdItZR+XdIcG7UxaPIKZ2gn3Xea0FchiF?=
 =?us-ascii?Q?Wfvb9ktuvwkshvcTdoYZI1O81aPT62uJTIYpy4ylrUBbiuBzX6DIIaJoJTRu?=
 =?us-ascii?Q?tzXtBfifKopWxMqZPulIIz4QHaL80N/VoYV1BzDIULZtifJH3eCLY5fwMlvS?=
 =?us-ascii?Q?IhtPUDfA9wO/XSisDw1zesPMRIsfjxb1+AGIILmAHBVAUjU1/cas1BFn+f7Y?=
 =?us-ascii?Q?7NQc587ottolLQuFFhoOXMZZ2MN9hvyNyJ4ovp0WSAb3F6mPAVXPJDoGd8VP?=
 =?us-ascii?Q?0awJPZ5tnJCvS4fPDmLuYFMzzLL/oah6Aa2jBnPKoIhbNFs7osWRvx+4siSx?=
 =?us-ascii?Q?aJfGhKIVaBVF/O/kFKMKXz8J6ASA+1RKJeDiBtCzBlVqUJeQQPaDfiTxUrwS?=
 =?us-ascii?Q?tloq/YlrH5TRIk5NA3yPTQig012hFaLPw9yeB7CSiYoCyDKI0Ux+CxGt8bY6?=
 =?us-ascii?Q?QSLNP6Rzz73CaulotUS4ZTA/9875mYc0/c9tkxpONPfxaxqLhQ0g7jOwLZzC?=
 =?us-ascii?Q?ZcovjSWqNrBYZnhhlHBIfSwlRfn6iWwg5zVVQ1OhXlxB0K4Pv5LBFB/9hsWQ?=
 =?us-ascii?Q?Rz33vsTaPYaOYd5u09TMCTZyjhD4e9Y50DWaN3w+BHAMbMUogtSQLyeo/+68?=
 =?us-ascii?Q?cJmV2pnYuK/FO68DurTwdXApHKF70ioRD4z+LfDnCsbrmz1mHmSLpW1RDMjj?=
 =?us-ascii?Q?i+SxcKIx5KVfIjSwqfwYBys6wK4V45o2kaxph8DBAyV/sRnB90xdc6cGiBEe?=
 =?us-ascii?Q?HsS7k4+LJm3WCIVdd0YMbypJoCJAvpSFHisW0/FqJWt7SZEIKrJUiz7Rkb4/?=
 =?us-ascii?Q?wzcdfI+aRlwmh/g/3CiZPx3NVnv1nNr7k/4H7iGJCG4AMwOv/5ZNRFZYfBIw?=
 =?us-ascii?Q?rMSNxedT6R5qIEoQMkUb7B6Ar28qOEZ7TjRw3t29riQSqQ=3D=3D?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?4BDO7vWjzliW4r2OXCiMmbQLnCg3VG+tA9fu4CPe9ZP/yNNoxX5tc/ZR0aWo?=
 =?us-ascii?Q?G+szZNjfzugehUlRUyGPblrm/aEFk3gSP6tdozKDtOp/OHyUSc9xYaUKCTJr?=
 =?us-ascii?Q?oZ3Ziq7KEBFFXo2V5okD3hnIboExO23aBtsFbuQi42b/Pl4boYG6rzitApeC?=
 =?us-ascii?Q?LPhawV/9lLF3Ic0p48qwapVMmkZW5qMi6sIeyIRG9hYmmbyM7vpoR++bxxVF?=
 =?us-ascii?Q?mIt64ofLAr+INNutV+rHTznXizG8P5kvOK4AgGtLCBZ1lMeyfrZpvsMf7SyJ?=
 =?us-ascii?Q?RJVS8TXfzQEUb7vThNb/7pbk56mAH9AJMmd5LvrRzTZR7LmwiL+PmFZ0xIdC?=
 =?us-ascii?Q?ehIH69g2Urd6UkdbPBED3V1M3hclRmwwyV5wXrClecgY5o2jmtM94YyIk9wq?=
 =?us-ascii?Q?U1mFvXCTlrBSTE3UbfuEVo+QC9Itl+rsSA5FQveoPku+Cg0yfdXcZ5DA+LRe?=
 =?us-ascii?Q?N63wgioGKSSkBsNzKxpIRwXS6MRUtBPDpJW4fRh2s7AyIFMjfZ09G+8LBxfl?=
 =?us-ascii?Q?0VU9GhFYB4VT6H3hDUUQw3Tc7ZR7HYChPS0xS7jVQ8iCNYbm7neIrImAjDbI?=
 =?us-ascii?Q?fIepWEfP5Ldf6YXz16AAcl0ddHZQHWGgeatqkP+X3RZApiWsMKo5KB1WcyO4?=
 =?us-ascii?Q?AAUNYqwsW+xJEeSSzVywOz1RQerTAoLNxHys5yxCaA2M7qAx+V/NWkOt0EkL?=
 =?us-ascii?Q?/SykHz315uG2CBC6aWizVyQxGDZWCrsFPhu5NkaSglgjE5GmLRchTLFn6EF4?=
 =?us-ascii?Q?/BCIw9Ni39xeqtxy7LnoENxrLCIGMkRXZPluaIUT64JVg/v0farTx0CgNuBS?=
 =?us-ascii?Q?LF7q1UbJg06FytzFvPMZR0dQKL1oHsVKm3PF85sE+XWfQXOEdIXDjUmq/9bi?=
 =?us-ascii?Q?4tYWsiufRvVo7yDajidBd4TjMaivsuAiO/pnHEs/BsKVXuUULeQLAGo02KOn?=
 =?us-ascii?Q?fmoDxP/y/KD7u0Ok2Q41KtzIl2p1aDaKlmy9dn3gBVD5NtU4i0pA2u0hQJUv?=
 =?us-ascii?Q?yjcNlBSldA6bajSzFOsiqN99ptHzVvUcEEXFvOjIRIlyBbBdSM+iSa6LHRZp?=
 =?us-ascii?Q?e6M9axoRNbWBH5TBS2YSEUlYupfkHqQi5cgO9S6ED+CvrktsJSKSDGxWH8Sb?=
 =?us-ascii?Q?Ks7g3cD0MelgNT1WKj02+nPsMNxxcXuLgK8zp5F1sr0aV31PItxRxifr4lJp?=
 =?us-ascii?Q?zD2yeWt1G6fF5+UNld2LWYu7vBzEsjbIZ/SpJpZQ0A+ucQU8V5PYEmJQQ6iB?=
 =?us-ascii?Q?1s7WvD3xW1KyU3IJzC3lSeGJN4EZQvxQwUrF4lthwYudOIenr5SYnSCRYJBD?=
 =?us-ascii?Q?Ve+aHJDzxQ61uTU9lMSO0+BkDrfEqGit3mXvdOr8IqKmHeRhVU/fT1Rsm5cr?=
 =?us-ascii?Q?+F7rSy/9HK64CuDsHSWOIp0zoxYnGRhNFNeNyEXnMiq2Ma9b0uYI77d9+7YE?=
 =?us-ascii?Q?zNBB2GPwZnzP491SN/3R+6Wra8vy6jl0QYWgTlfNq+s+k6/693jt+sHfql/9?=
 =?us-ascii?Q?ZlKedttLKwOw2Ux5mwMpaq7jKsHaG+ZMQtFS2DcVXGcHR62kZ+HBgwh3egcR?=
 =?us-ascii?Q?ehX4eN5i1V3YBOZZTVyYZyk0dj6n6IounbUdQ78p?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19b3bc10-5a53-47f4-a83c-08dc9a84d7e4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2024 10:50:52.9365
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cH3e8+JqqVVzXZGzU4/557t8yK8CU7L+KUK5wWAI8gpXs2W+hx8bXd4OVYDnBzzd+lTBhzqJsNPN0CxbcFFDZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4063
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linmiaohe@huawei.com, nvdimm@lists.linux.dev, jack@suse.cz, linux-doc@vger.kernel.org, djwong@kernel.org, dave.hansen@linux.intel.com, david@fromorbit.com, peterx@redhat.com, linux-mm@kvack.org, will@kernel.org, hch@lst.de, dave.jiang@intel.com, vishal.l.verma@intel.com, willy@infradead.org, jgg@ziepe.ca, catalin.marinas@arm.com, linux-ext4@vger.kernel.org, ira.weiny@intel.com, jhubbard@nvidia.com, npiggin@gmail.com, linux-cxl@vger.kernel.org, bhelgaas@google.com, dan.j.williams@intel.com, linux-arm-kernel@lists.infradead.org, tytso@mit.edu, logang@deltatee.com, linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


David Hildenbrand <david@redhat.com> writes:

> On 27.06.24 02:54, Alistair Popple wrote:
>> Currently to map a DAX page the DAX driver calls vmf_insert_pfn. This
>> creates a special devmap PTE entry for the pfn but does not take a
>> reference on the underlying struct page for the mapping. This is
>> because DAX page refcounts are treated specially, as indicated by the
>> presence of a devmap entry.
>> To allow DAX page refcounts to be managed the same as normal page
>> refcounts introduce dax_insert_pfn. This will take a reference on the
>> underlying page much the same as vmf_insert_page, except it also
>> permits upgrading an existing mapping to be writable if
>> requested/possible.
>
> We have this comparably nasty vmf_insert_mixed() that FS dax abused to
> insert into !VM_MIXED VMAs. Is that abuse now stopping and are there
> maybe ways to get rid of vmf_insert_mixed()?

It's not something I've looked at but quite possibly - there are a
couple of other users of vmf_insert_mixed() that would need to be
removed though. I just added this as dax_insert_pfn() because as an API
it is really specific to the DAX use case. For example a more general
API would likely pass a page/folio.
