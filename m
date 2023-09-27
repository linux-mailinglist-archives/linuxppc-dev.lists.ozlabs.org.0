Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BCF7B04DA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Sep 2023 15:00:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=dXOiR9kV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RwcD81LgKz3cRn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Sep 2023 23:00:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=dXOiR9kV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7eaa::609; helo=nam11-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on20609.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eaa::609])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RwcCF0zpsz2ytV
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Sep 2023 22:59:50 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k+0dlD50TL/ZMKJ8VU+RK+Yiue5qnkr4YJdeib+61ssZmX/+6XO52IDZF62VqGKNC84Wh8fWOg3GFluAfrMqi13f1U3XysZEKRwATOetiWgB61po95cnYVq7tqCJel1RI0ayUz4roeIOx4wYv+kCVWlQRDcUuHIqBrdgwq6eVjT6w5lIng4GvMkR+k+uWqINyPB9cC5oyrHoslFjYP/V1VBxYwxGapg2cVbcnnYdXIzYuOv1NTU7PEtydV38v8EZBkIRFdgHGySodec6wzSCqqSRm0d8Bqd72TuX4uv8vWkucq2FL/VQWAGYPnB1PvDlapUlPmcDI8htcBgtPCxxTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ITfwk1MmcjuHQKGlcYPiiTrPDyk19y8gQhAnRH7FHlU=;
 b=loZWg1SxvDXCarhWQnkqU9nBfA3bzbJeenLAKzmbZvfsTzZCTRJvBiryLmvRq1tirCQVPAz5naEPTuhijEBOfsb2XngS/FUtsgrz/kta+e1ChBzIyUFVihkzTAW2XfVDNfIx8J81VYeGej3L3pQu9dVHWyNCYGwIH/GHHh+iQomQU2hApHplXVNbz6j8RUUkI5hpdDzVwoRSyoexifIs6+DeNnKFG8fTApG7LB6i3D7T1/H17hsE1pdKDuyNK5hZ6hAcRIYyyq3rS/Ud/TIOVatz2bNln2HfuLY9CyXNXH/yicX4U+NP4HeFJVqiIg9F2jLfrou2PsMgHqcKI2HFDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ITfwk1MmcjuHQKGlcYPiiTrPDyk19y8gQhAnRH7FHlU=;
 b=dXOiR9kVsYBC27xCuHwlsckubX/KWWUn8QCkuaKO6OczwBhQfZ8SLwk885IlIJW2TN7DO99W7wMfvJeHyq5LnRATN2oaUBwK0841c11piGwpmDNcte8yHs8fYycg8nU8ZHJqxM/22i9nn8m1j0aeym2mX+0b/TTvII65w+K5xrn3YkJj+8x+T2sWaW6t8Vc4zLDeGWgahOto0js6KWonnMFkwZF4RJ2/yZh6bOfLbK4/6y9Lu0rRZlvphft6Kj6XUFhFnlrE1qOdbCwuqTqOXjOdjbLw0EkIex/VJ62BvhPiusWpotbZaf0zxwL1K0mPfyYXerW8V5gKngljvQqzZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by BL0PR12MB4899.namprd12.prod.outlook.com (2603:10b6:208:1cf::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.21; Wed, 27 Sep
 2023 12:59:27 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::3f66:c2b6:59eb:78c2]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::3f66:c2b6:59eb:78c2%5]) with mapi id 15.20.6838.016; Wed, 27 Sep 2023
 12:59:27 +0000
Date: Wed, 27 Sep 2023 09:59:25 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Janne Grunau <j@jannau.net>
Subject: Re: [PATCH 6/8] iommu/dart: Move the blocked domain support to a
 global static
Message-ID: <20230927125925.GT13733@nvidia.com>
References: <0-v1-8060f06462cc+c0a39-dart_paging_jgg@nvidia.com>
 <6-v1-8060f06462cc+c0a39-dart_paging_jgg@nvidia.com>
 <ZRMrZJ1HgpULWeyv@robin>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZRMrZJ1HgpULWeyv@robin>
X-ClientProxiedBy: MN2PR01CA0064.prod.exchangelabs.com (2603:10b6:208:23f::33)
 To LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|BL0PR12MB4899:EE_
X-MS-Office365-Filtering-Correlation-Id: 3aea5661-c71c-414f-6578-08dbbf599491
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	Xw6OwZHtGKK15B6l0wFGMsc3MprE9mdYp/6+DxNFTFiBKEzbL4XizmRY5WCQujn+CeRqWZt6vfMsQE+A0KQKXj9RY8GGbJ7mpZ+rqr7MACNXVH2ElhuULaDUholNGP3LiT/oRdRO0zCH26sYhnHYbQMh2PbpLnZFs0E704j5bTpBKqH3ydPnQTjY60R4C9V0MT84PBDGK3n5Tn/REwhVHibhRzAW3dbiUt6A7Z+WTTRbdIzisRWdZ1dFiKJ+O2kqyYbNWnvmd2O+RJsRr1K1BTrJf4qAPDy9oXlqjEXmGLWacKxQCGWAq4Gg+sNRRfbBdVn5iQFQbr8Nj0sCw+WKgyds6gBr4uMfEEo1gBK7qvJmAJhZIrVHyTqcjcf2DAByDx2+HC1vKmViaE612yR2RojXJC5OHRV9TreUdIwjxlX+dtK4lWYTVunSpWr4tYrm+nnjVZ35f5thLSxNDfdiLmDiXqGxUC9+qXd7I0sJIxOVZKz53jrNQWK1A+t+04StdzI191ZHDPztbCDq7Svx+vgqRs1L3bz62LYJyzdCYZV8anMjnJA2ckLRu8VZfnCWNdL1HDAlSoUmISHE5nxye9MSJYpxqAGwd5wU6Jr+q4k=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(366004)(136003)(39860400002)(376002)(230922051799003)(186009)(451199024)(1800799009)(6916009)(4326008)(7416002)(66476007)(66556008)(26005)(66946007)(1076003)(15650500001)(8676002)(8936002)(5660300002)(41300700001)(2906002)(33656002)(478600001)(38100700002)(6512007)(316002)(54906003)(36756003)(6506007)(6486002)(83380400001)(2616005)(86362001)(781001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?6Y3jfop/etktEUUSSypZvphTriYkqINAG/lK9OKySAM6u+34RbGS3DxVsKU5?=
 =?us-ascii?Q?67GvmSYpLQ4iapW25sEusJk21oD4HvL5kpHIyaFUAIddDrypryfPZgnG1Bs0?=
 =?us-ascii?Q?yqm7iSju/Zu5RLrFNj7HTCtNGjk4Mc3rmJjm3Us3ntyAjUCO0lWSX03AVlcw?=
 =?us-ascii?Q?YFpRmeOXsHg5uP6kOymogapWYJKMesejWMWajIpRWdyJnm1GbKh8IUGgxfl/?=
 =?us-ascii?Q?1MHZ/O90vhdw1i4XUBQ10skVTuCm+UPK6VZOFGhNWsvRbds5i1wG04RKtzsY?=
 =?us-ascii?Q?oVfM7qL7fT1iZQFmD6ZYFvXZzJEqzKzbnIgG3uOEvRjOn2JiP4JP9d0LIvbZ?=
 =?us-ascii?Q?n/uMGTAR1Kd565mtlM7k6yKwe8IJl/JaEiXgCkrwd5Icol8ZwxlE6b9rIQSV?=
 =?us-ascii?Q?QoIjh+41DQ1yccIrY5ir1PXg9yZqCUgD4ojyDJIseJBG++inGnZ49EDDy3GB?=
 =?us-ascii?Q?/Ey3N87VwzrYkAOrwLU30QRm1feYc5ILiL7tsD60Yw0/MyQDjXvFLkimZblA?=
 =?us-ascii?Q?vNqUytaI9CYn6/+2JMp73J0PHgeoeNXMFwWHbjoeyxtbQXDAMJ3t9/n9DVZY?=
 =?us-ascii?Q?IXx6Lm5qeqkwb11tc3WLR0EB2p/KVYCQVVfK4imY6Z+e3dMP+njYRz1S/YE8?=
 =?us-ascii?Q?7GTQbAyZyPPFUD6yyQOgt84eHd7eXZEpTFjwi4cKN2BM8cRMXE4soQRiVbrd?=
 =?us-ascii?Q?+M+IujujNm+UTeyPvb2+ILp4NQoNeqD6eh+7hKosnzU8KoIw5XSglqsXV9BK?=
 =?us-ascii?Q?uc72R3sZeNaFZkPXX/d3ldtD2nViMfrerlvLSLoiElBaA7X0Nq0iBqDMPTyO?=
 =?us-ascii?Q?Bwr7gjmn3C/+Qk1W017qeVHb1qdTVt5dMs/Tkfb9bL/ZEpPr/3oVWJOtJMZc?=
 =?us-ascii?Q?IhHf5sxPQEOJBmANU7jV/F9aKHhjUoFhhapJ/V8Dk4czYxcru9A13hcCwMLN?=
 =?us-ascii?Q?2iRujh3jgaaewWvdomBNiu6SlaO4CUeVxDqbNIzPoHiVZDzy91GCSH5BADTS?=
 =?us-ascii?Q?8XpifQxd/sPkZvxPb3vNGerXSCzbqfUILb43otHQcEfpwgPvn9nf0DncrHyi?=
 =?us-ascii?Q?OpIaxImTGQ34J1lVxX/sEyJq97uTraOtawoQFMtwITdBbIDJHxqMGwE3rHoB?=
 =?us-ascii?Q?L+yJza1qHGC4mkfxajK5HJmyj0TsNqvtpmdo8wKGNbl2DhMy3/VuH4U2cOww?=
 =?us-ascii?Q?bLU2pXznRioXdODDAPiauDDx6JjUYzdsv6LQiL+VSQu9aRRTNtH4EaWCd7fe?=
 =?us-ascii?Q?IW/0GktW9+whBRS+dKkJlXeyLe/vy3Gu998D7Jjuy5qHW6XzGpoXgyFBUupI?=
 =?us-ascii?Q?ymx2A3YbGtXowCJnmiCojtwcX8Tk5VnSQ/FMTqIdjulSM1h5ZQAw6yQO8/5a?=
 =?us-ascii?Q?xF+H96qDpKLBs0/rUkYSebSjpbx5XmcAnH5nguiDsSWnkVb23rndXnRUK64F?=
 =?us-ascii?Q?IstA/ww6nZi3dj7R/wvhX8Ultw0Cm5VLA70u9TaibHzF9ikgVYk5RNbM6CPV?=
 =?us-ascii?Q?QP7d9NTBK0dIEBQiL7eUzEQGm5o6UgxkrhSCql61rdXzC/3Ap23ZtmeWG4GI?=
 =?us-ascii?Q?Xdz7kqLeR5r30Y2MvKqOFQf3r9ylcZWrUQLMEn6a?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aea5661-c71c-414f-6578-08dbbf599491
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 12:59:26.9748
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q7KemYPRYBtNPBLNAQE0Wng4PssYT7Njhd8WwgijPbA0Y3nNyHaD/91VdxWphIXW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4899
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
Cc: linux-arm-kernel@lists.infradead.org, Kevin Tian <kevin.tian@intel.com>, Will Deacon <will@kernel.org>, Sven Peter <sven@svenpeter.dev>, linuxppc-dev@lists.ozlabs.org, Joerg Roedel <joro@8bytes.org>, Hector Martin <marcan@marcan.st>, Nicholas Piggin <npiggin@gmail.com>, Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev, asahi@lists.linux.dev, David Woodhouse <dwmw2@infradead.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 26, 2023 at 09:05:08PM +0200, Janne Grunau wrote:
> > +static int apple_dart_attach_dev_blocked(struct iommu_domain *domain,
> > +					 struct device *dev)
> > +{
> > +	struct apple_dart_master_cfg *cfg = dev_iommu_priv_get(dev);
> > +	struct apple_dart_stream_map *stream_map;
> > +	int i;
> > +
> > +	if (cfg->stream_maps[0].dart->force_bypass)
> > +		return -EINVAL;
> 
> unrelated to this change as this keeps the current behavior but I think
> force_bypass should not override IOMMU_DOMAIN_BLOCKED.

That would be great, dart is the only driver that can fail blocked..

> It is set if the CPU page size is smaller than dart's page
> size. Obviously dart can't translate in that situation but it should
> be still possible to block it completely.

Wonderful, actually it probably shouldn't even support allocating a
paging domain if it can't support PAGE_SIZE mappings?

> How do we manage this? I can write a patch either to the current state
> or based on this series.

Let me just add a patch to this series to remove that test with your
explanation, that will avoid patch ordering troubles.

Thanks,
Jason
