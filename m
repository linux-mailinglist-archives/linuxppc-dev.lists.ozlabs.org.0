Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2980B7E7D2F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Nov 2023 15:54:26 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=n0+JCyig;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SRhg40Hk9z3d96
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Nov 2023 01:54:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=n0+JCyig;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7eab::622; helo=nam11-co1-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on20622.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eab::622])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SRhf76zKtz2yk3
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Nov 2023 01:53:33 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mrVMLsf6nzBzdiKOHjoseNZd4SwgbZU94Lu6bsXXX6JinSMiYt0W9whbdpBdFRggaWPESA0eDROiam+3eWkMvbdYXO6epKV10JH1uw3h+SdnuyphwaCNzFHfJI/SO+T5Jc+MvM/uMosMqsysdteudbC3fu9vgy2j2VBm/FzluGses+b6dhaaFeMcbT3hTDH/2ylHpQnt/CC/TjO1hU5y1b5Yr1+04CxPmu4eIUkk73T8UwhGRtfMBAYMqVWOkFmg0W+pew2AxQy8ivmj9BjInT8RI5mIWV9FfVQgmtr4KYGdEP7vNE7xgI1T1n1GTHZRfk0bVxEA16ypkqcdBG1D9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BtuvZ2D/8A5qwv2eUVcT5+fgAS7Ld3CNevaBxR2DouI=;
 b=j2GH/VcAXf7ZDNqgNpTiQbZ9NUgMjVFP4YZzdoAkfn+hpZy/ukHaYb0ud/R27227rQfgJVHzyXX/wQv+svglK7Y3rrRMRmkyJIJ6FI5Hx86iqvg9U4OlItfZIJViz1YdvLkrQZ4jJUPyVFr1YhmMqvX9SY6gPlHUNOg3WBer4Fv8s9SPuVaDS0PzgGAdOvKRUTF4D0xG9vIdV9ybj6uWqwZVav9dsALgHNQa5W3Y2S/QWPn6u2FrgA2+zmX8dk0buGd0TrAEV8V/D+/d2gjQye7E3limvvLtzkaMTrA+QT3aIAzFUUa8IEk1xLzdEEfCf9UvZt2uij1fJJr0o41ksg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BtuvZ2D/8A5qwv2eUVcT5+fgAS7Ld3CNevaBxR2DouI=;
 b=n0+JCyigceJctBJ2KoAblzehVOEWPm4w5rO2eLab7jOFwL/PiyxU+q+sPzfXesMvE0DGJoZrH4i/h3z2bWrjxzfWHa6FzGKyK444FuGaJBckFcWXnJW51z4VjAwWQXTPBzEXwws2dpMxn6x++2yBADVvolZYIXOIptV1OYFxLXSNYhFiEbh2v1FMmGisUpoLCpsp90iYKmrCP+GEieLhHmme6zA2712aJstVLlHGPS58kArIWbD4KNYSSAF541cjDcF5ZYOWbDuEIYXSGrnaghpiX/+cVcanHkfS2HjzfynqA5NeTk5Aj+M+SVAKbHPk0jtwhDn/Vwd6oxHESal88A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by DM6PR12MB4419.namprd12.prod.outlook.com (2603:10b6:5:2aa::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.19; Fri, 10 Nov
 2023 14:53:07 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::60d4:c1e3:e1aa:8f93]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::60d4:c1e3:e1aa:8f93%4]) with mapi id 15.20.6977.018; Fri, 10 Nov 2023
 14:53:07 +0000
Date: Fri, 10 Nov 2023 10:53:06 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: get_user_pages() and EXEC_ONLY mapping.
Message-ID: <20231110145306.GP4488@nvidia.com>
References: <87bkc1oe8c.fsf@linux.ibm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87bkc1oe8c.fsf@linux.ibm.com>
X-ClientProxiedBy: SN6PR16CA0059.namprd16.prod.outlook.com
 (2603:10b6:805:ca::36) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|DM6PR12MB4419:EE_
X-MS-Office365-Filtering-Correlation-Id: ce7dbab3-05f6-4995-1dc5-08dbe1fcc01f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	xb2kt9SilzvsdQaITNEQOqrTvGjMeLGhojfv7Np+CQwwvOPEjZ3QoiKATUTf6xHYWEy5+bQ4jl8ywoi+eW1RN+wPzruN9k4tRQM2DLGoKkb5lN0Guoj9U1ufLVraOHyXkPppWeJj9XtjsYWwmhUtlfNxYegKv+nOPTSs7O61d056RSvNw+kUluTUPHOsRfM9KyjWzaRWMci0TwRVM3r2blZG5vxDv7P7zAMV6m9p1oJqrR6Cn9sWUZPeE5i1utXqnDJ/N6MrjgEYBFBtbV95gtG6fpz2u0g9xPjFXYYKZexlSIm9CXYaR44KiNGg38hCHAJecaaGIU+H6IS7NH0mxodh5DnMkBu2D3HO1chLSoXmgLkSCMcIguu9+CKuIB13TLA8W1gGF6CBlnGN+Ya1HsYS9Tsjep+YXbPjyGDiV+tlx4G4ixuc6SI3R0kXLmDce4sBNuzdXNKZy+qgGzl1gCJq4Klicizx3UfnVJA+eZ/4yc//KGFbJzula2I3UGAQLhioIr58Evt3CKQWUxMEcMbViYAUFWTnDAKosL3DZqH3l9v+5kcsayRXpMnsd1GL
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(39860400002)(346002)(376002)(136003)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(6486002)(5660300002)(478600001)(6506007)(8676002)(6916009)(41300700001)(86362001)(316002)(2906002)(66946007)(38100700002)(8936002)(54906003)(36756003)(66556008)(66476007)(33656002)(4326008)(2616005)(1076003)(26005)(83380400001)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?4BtQ3DRH92goPN9W+TQlHg+GWYgrBeeSNLp2xiskIr2J90uy3oA4J12rbQWp?=
 =?us-ascii?Q?YLpkZkDeENtWC+0il04ccQvLYXDH9Pj+6lDYbrEWKAluO8NIirCBsOlfQb7R?=
 =?us-ascii?Q?/gyT/C3c1Kt683igEgxBo3GrR8kkk+TenBf8HXG7dVoLmM2DYtEEDuJ7nuO5?=
 =?us-ascii?Q?bMhF9v5DaWLeJNaKu2DjdRHJW5C1F8mL9K0niVSJ4LcyJOp0Xg9PEVSlr3cx?=
 =?us-ascii?Q?45tSqZfG0A+Rw7LHNG5xzL/jDYrZ5FxRCUolrylPiuAn21iDLbvSqQNYXqTk?=
 =?us-ascii?Q?T7g9gy74KIQIaEn3nx4yNJp+sFppo1ujO4qjGUfH+3ImqC4mXgWJmzyZDL/E?=
 =?us-ascii?Q?EVL8gwHTG4hlCNliyFGj7mKjRklGWL//knX6PNQZj84kOL2ZbVTVCKGYbU0O?=
 =?us-ascii?Q?hcm3bhNKVkUHrwdz8CP1ZKkyb7t0vSEgDhdOn/fvZTTTdK+LhzysVPydKqLJ?=
 =?us-ascii?Q?NvwRlz+23OHVSZVCv8xbUUuDeWxHKFzcP0K+DM8NjEi5EZT4U5hCqdvlz+Ce?=
 =?us-ascii?Q?FN+ToLBNL1hmfeWGWesNvjFeWEsCLX9qM6Ah8x63i9cawMqVavq5u7PrUkDd?=
 =?us-ascii?Q?xKGQmrkNwm0dRohZapETsE2Fb5JHEpYBLlb/Ib4Y9I+1sDwaF+QXYmbrMnWc?=
 =?us-ascii?Q?eGD2EKRg4mWWWBHxnmzQiI7qCG0Kl/JUeC8pAtsrPbIoJdT0esQDNYputdPx?=
 =?us-ascii?Q?q3nQzPN79vxu0k89720Ij3HqQZC9v/Nf6gLuoONjjJNJQ5s3Qnj5CGRMOTmQ?=
 =?us-ascii?Q?4eaDeIOM4cHyDw5S2H63HVBOWxBkP9M8Zp3FEkzmenyyTrVGJJII6QHsg7g+?=
 =?us-ascii?Q?bHhhkcsV+NPa6A5SjKvTq4o20z0x7OdZWQs/TAPAdejn5XT75ADUxfeNeWNU?=
 =?us-ascii?Q?14Fbfy3O5k1gc0PfSCbuFT7a0sobh102W0KBiSKK24/jik2tDz70EGW21y8o?=
 =?us-ascii?Q?3YjgsH+ZqKwyIdMyPlj3EVmNMZiQTAzqL81CQOwEhs9QrnkjdzMJzR34SaXy?=
 =?us-ascii?Q?02GSZ2EThr3AVJRhwKVEDRvd0w1S5LNI2AnRPIwdAV72RQPW5fruqo5zuNiX?=
 =?us-ascii?Q?+O2R2zl7aNsTl3Aq2psirD/rm0LECxZZBKkdSDTUK1x1p+og//6ZRQizV3mX?=
 =?us-ascii?Q?NnVsSEOlyvviMRwdVesEEYuzDRpyGSfqeyzNUr9SZ58vYujFKHclPSQ6zRpA?=
 =?us-ascii?Q?3GTo0a9SROkM9YYr1WQaIQ05NWgv6FOAOgZ/Kgl7aFTXo73LoQSw4ezlgp8C?=
 =?us-ascii?Q?4vpFlfSax4aV6ai5rwxQCDQixzWrrQCvG/DR0WGc9asZ/YnJbOC2LY9dXo4K?=
 =?us-ascii?Q?nkIHaAtO8MZOtOzvrYeF3YHdlNcXevQJpPRw+R7Hjgqqp95/7KYVQi26lrxL?=
 =?us-ascii?Q?o8Vbg8qVZRPeRHShG7yN7zu5BBEdgQl5MxXB8pyBlHHpbDxoqD3uchgEwkYB?=
 =?us-ascii?Q?KS3ikeyaxmpR24THL0CXewb+GNQusNAjRG8xMMEbvWZvzVOs8iBGPtlvegrg?=
 =?us-ascii?Q?nApK73gaxLdf/XO7zySdufMR5KO7DQJVPJ8wL0x5O5HXcoXHSSg6wu60Uw9u?=
 =?us-ascii?Q?veBzyOgyIB2ElA4U5S5al1L1pr0w8GGIrUenyteT?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce7dbab3-05f6-4995-1dc5-08dbe1fcc01f
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2023 14:53:07.5566
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GJ649ucN6Pv2j1i07uTDm0n4ONyFFNwkP9+Ri84ixWjZFs2Xk6HJ2CMxVrSMSjlK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4419
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
Cc: David Hildenbrand <david@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, linux-mm@kvack.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Nov 10, 2023 at 08:19:23PM +0530, Aneesh Kumar K.V wrote:
> 
> Hello,
> 
> Some architectures can now support EXEC_ONLY mappings and I am wondering
> what get_user_pages() on those addresses should return. 

-EPERM

> Earlier PROT_EXEC implied PROT_READ and pte_access_permitted()
> returned true for that. But arm64 does have this explicit comment
> that says
> 
>  /*
>  * p??_access_permitted() is true for valid user mappings (PTE_USER
>  * bit set, subject to the write permission check). For execute-only
>  * mappings, like PROT_EXEC with EPAN (both PTE_USER and PTE_UXN bits
>  * not set) must return false. PROT_NONE mappings do not have the
>  * PTE_VALID bit set.
>  */
> 
> Is that correct? We should be able to get struct page for PROT_EXEC
> mappings?

If the memory is unreadable then providing a back door through
O_DIRECT and everthing else to read it sounds wrong to me.

If there is some case where a get_user_pages caller is exec-only
compatible then a new FOLL_EXEC flag to permit it would make sense.

Jason
