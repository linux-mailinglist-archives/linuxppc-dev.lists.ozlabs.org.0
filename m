Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 66ACD56BA87
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Jul 2022 15:20:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LfYmY2dj0z3cGC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Jul 2022 23:20:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ZBl3znQZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=40.107.244.48; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ZBl3znQZ;
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2048.outbound.protection.outlook.com [40.107.244.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LfYlp0nsCz3c1y
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Jul 2022 23:19:31 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JL5glnukQ+ABmz5B7WVMyhP8pVccCA1g+aQijbT5YMrB1lmIWCof+2xjcj4BaLBCebQgnukGhfn1Ej3f6c4YlfVb69UxlRq2nRoZAM1K8MJMs+uGkKoS7xj9Sq17zVUstKuSsEIZduAEy1vWeGVrVkhQ/uUJg9SfKXAHugqvCKvxNv4Awp1SpfHata1OpJcTNPD/6HHxT4sEvZHVvWTq6ip1020jyKIBZZIlJOSB6AIoUMzoVS7HtSgtglXAXjGzfgZ9BDgy1CIVnZx/hxJTY14tEt3HUfIhaPLKntK+D+X62QgTNsKtAUvH+7WVyd2+dBMlsg46T/SBuaKOqKAKfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QtAxvfdM4x/ead6Dc22XuBCqjpy37X6oVwpa6hgmiTY=;
 b=ij39DG4CQO+zTTg7V1fKGgNB2fAHRS/h+BqmGAf7f4t/KzTw/43XBQRdXjkcu+deYSr1Syv11T7I0Oy1mR1D8khyKxojkyvOfcoCOGUcwatA89XXUwcXwMxDXUF0nK1WnK71glAlVDg5DppVVb/gdVpi6j3/HBY1hfwnD378wR3HqQ7G61U/rYNkFziAqdJuCR5XqV1ijkUeV1SbVer3tfOETNbTvyKDsoVkmT335K4+5UvzPDOfJnguwMfP1ljmGYcfcJBSeSjZ8i8WwkviRo7564eiPfdhqIW04dAACmstQba1P2Xo5nldJZ6TvYjXFHI6+EgsXguXcXndJ/bALQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QtAxvfdM4x/ead6Dc22XuBCqjpy37X6oVwpa6hgmiTY=;
 b=ZBl3znQZHdCGJU4h80cBMN5ybWgi1Z3yja8Zzs+UznG7IddeMCtXbGXt/War/ByC9xmrGw5y/XONuGEObnHyzEVoycFwApHJIU8XaVeoYYCGiHL2bAa4UuTLtFj/B140SvAqbNr+8mS6NTJb5BDlqAUU942GZwcZBei8Hm7dhLXojbhkuY7zODUMqQuDMQJhwA/aYjAoFWW8rY6RoxBKu94oN3/dFwrZFy7R37n+lSsoSWvQCFkLy6P0I22TtJBilLbmBC5oV66i+nTs/oly9sRSXgxuyP5qnhLzSJvtsRl5UYH2qQFTCsA17RcjcJeuOL0fVai8Be7M2dmGECPgxA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by PH0PR12MB5433.namprd12.prod.outlook.com (2603:10b6:510:e1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20; Fri, 8 Jul
 2022 13:19:12 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb%3]) with mapi id 15.20.5417.016; Fri, 8 Jul 2022
 13:19:12 +0000
Date: Fri, 8 Jul 2022 10:19:10 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH kernel] powerpc/iommu: Add iommu_ops to report
 capabilities and allow blocking domains
Message-ID: <20220708131910.GA3744@nvidia.com>
References: <20220707135552.3688927-1-aik@ozlabs.ru>
 <20220707151002.GB1705032@nvidia.com>
 <bb8f4c93-6cbc-0106-d4c1-1f3c0751fbba@ozlabs.ru>
 <bbe29694-66a3-275b-5a79-71237ad7388f@ozlabs.ru>
 <20220708115522.GD1705032@nvidia.com>
 <e24d91fb-3da9-d60a-3792-bca0fe550cc7@ozlabs.ru>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e24d91fb-3da9-d60a-3792-bca0fe550cc7@ozlabs.ru>
X-ClientProxiedBy: YQBPR01CA0051.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:2::23) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e84d6c88-0aca-4228-695b-08da60e472cf
X-MS-TrafficTypeDiagnostic: PH0PR12MB5433:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	NwvDPPIWzG86Iakcwmxu0ojOBucThTWhLCz3cBTTon9MZrZEGqhFqZgNvf24GtZ2g2L4NWFtYQterXU5Nd7Nsbvjm0vKpP7+6wUmu/taWbWYKILM0/+DXOlBs2Ay/gAqHm/NMZsaEIJgsJPyV/y90hP7PZqLGAjMugsEmsYmcTX3Lu917Y5cIM8bsrH0OZebiv72s0Nf33Z8BNcojNc4RIiYjmYxELUc11mOT5qtVCLLdW2ZNgJOshoXDItPj4nBHx7bK/CEFXq/iQlkljhIyCEnJ1shxZRXsoIWYnkEbvSOZAz+73Fb8IyQjlOuzewGbXaoyrvUgM7tIket3dokAIX/eAlr0rrHhegQ7tZitHvzYHjz/G3x1w6SnlzcwZ9j2DNCz51AI6JGr720KqNJM7qeElAJNKaoCHNUc/DT8KAFxEeYeEUVz1UashdpoxLYZ0DcvQRzG3tWH/K+f/HWn2xiSwqFugbPtysa9z4zJS3pDWWEWjjdFhmUS4+H6OVujM7ek8SdS4K9RQ2iUP1F2bkbjQscbOMSz44HCZViFQ3NEHOsGQgF9AOt6lqMGYbhuki8n5rktIhXvPDTB41pCyKELm3GRK5wi1EWEmabjCeVLAgU/bEL9quehuOmftcNF4ITw7SDvZ75xQC1mMzCSbgcxq18CVVd5lPJLsMpu1R9BFl860fMmsATIKmiulv2AiGIztEw0zczUGv6wF0EIDFh1AY3ifj3F5kBkV36DVhEU9ExKBEDSzbViW0o6S2L
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB4192.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(396003)(346002)(39860400002)(366004)(478600001)(2906002)(33656002)(6916009)(316002)(2616005)(38100700002)(54906003)(7416002)(5660300002)(36756003)(83380400001)(8936002)(26005)(6512007)(53546011)(66946007)(66476007)(8676002)(66556008)(4326008)(86362001)(186003)(6486002)(41300700001)(1076003)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?dbW+neyTeHv0d+otoaiMKdEFzeGjQu6Hba6ngAa6tgrwepyB0HpfoOsp6nLc?=
 =?us-ascii?Q?J4Rfsce6Eg4zJvg1VFr38zgNnSY1SBD/QYTV4aI/Z78n/f2m8fIt/oBE1d+X?=
 =?us-ascii?Q?9nUFvoorkoyiGy02YzqLfBJRe06zWUvvblPz5qadIzSYzhMfVSl5VX1BiXKb?=
 =?us-ascii?Q?9RSzvOa+ucxXCABf6QfbNTaeAzne9vwvRDdDWCF7dhryp0WJE4M2F9CpMlpz?=
 =?us-ascii?Q?B85YFBrYv6YzlmTU4IeBTdF5L04UeNN2Yy7PdaFrnREg96YvonMAkzYgya8K?=
 =?us-ascii?Q?e2dXsDKiR5jpL0sJnvTAjWTJif/bXmlNlMLHikLTIuQ4CrM7i1r8OvLufDAE?=
 =?us-ascii?Q?QNUizwf+3I+48tXyX+V8Ypnd4HJqVRCeU2fRtDHwspxxwDWwvpe5yrfnjDhx?=
 =?us-ascii?Q?+SKc1mDzc1cbtu2kikrWPN+/WylksiDuVsJTQnvn44vUW96+Gf36vrqy7MEY?=
 =?us-ascii?Q?eGHfjNGFXTcpAejp/JxN5qIQQpJyoesf2aRFZ5k73aWvQy1zdEZPXULuk99U?=
 =?us-ascii?Q?4dwwAFn/Gt0qLDjzF7S+Xx4fNqSc0NY9gBBHj7SZZEUjF51/pAem4bW3XUmv?=
 =?us-ascii?Q?E7ALpr7R+DZ+aC6sSuuhMuE0t23srQASPul8FLTBsMccEAt1zP6+Om0tpZpJ?=
 =?us-ascii?Q?pNWgB9WlhDQw12VjuZiGBreFBaFDWUmpF9Kw3L6smxhgbbyKKA/Utas6dLIM?=
 =?us-ascii?Q?/S0zWu8u+lEHsUBtm9coQIZWeiDm0+ty1lzu9gPiNsu3j/m0QeVUXhOpEGOf?=
 =?us-ascii?Q?FiWQBgs6BHMe64IiSX/AQ0abwGkWY3kOvD7Zni56uY8SN2ZDNUyCbrPwW7xO?=
 =?us-ascii?Q?vcmVEX3WBWaNR8DUoDhn16g7XG8Ghyc3sek0DbWfxalRBFCh7z8lSvJyMkj8?=
 =?us-ascii?Q?MouKktl+Rj8MCdfeL1gDMqcDZ+fmzVWoZJZ9YS0FVS5qWbOYYJnR14vg3Stu?=
 =?us-ascii?Q?XvUr8MVIluuD1Oc8/3VGS8SC8l/CGSYNzdNk9UyO4qkHXOtKvRLenYjpDkcF?=
 =?us-ascii?Q?0JBUpoeY8+E7B7vg5fNnPrun7qo+p1dZ3buoz2saRX3bTh1+LXj0BwtZOOra?=
 =?us-ascii?Q?MiF/NivEyRIihAvgvCt4GJLaxRgAn0XMhcWR589FCRhXRiQCazyhgiaFdDoy?=
 =?us-ascii?Q?e5tpQLr057ttDnrweryZiW+zMjdsW/OZgSgTtbbkiaWEoAZmhukU4u7mryWz?=
 =?us-ascii?Q?rs5Vv5vFaHaFFfNhr5iEDuPe28wf9FuJzAfQdLosbQlo/uGawtSX9nBUP72x?=
 =?us-ascii?Q?ta2QNlwiEW6Lxbz+hb7befXKO5aRHPU6ycikB0Hynoe4EsL9AsWdkcBt3S96?=
 =?us-ascii?Q?v6ykO6iNQlLdU7/gc3I/30UQsLTGFJzLdPMzrrGUCiaWlEbKEqSpURm5VE4z?=
 =?us-ascii?Q?tsFWh1DYKrEC3vNADYKJY+6SIOBzRWI9h6PuGVIrkayrYtBaziEOya8B+ivD?=
 =?us-ascii?Q?onhQeVbdbSOlZ5n4Bjv7oF1kb9ImTcqEzGPTKkqxepamL/kwHp1N8OpLSgdE?=
 =?us-ascii?Q?GZTYiOKUSjiZpB55vHGljTDgaW1DOIRbbdx1S3Uu2a/kCLgr0CC5nnkf0QyR?=
 =?us-ascii?Q?Yyu1s05Zb/QacupW6x0cfdFL629vfOPy/10gS8Kt?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e84d6c88-0aca-4228-695b-08da60e472cf
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2022 13:19:12.2914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RupvM1x0oZxfzWrtYrLA5vSj7tcHl7Y9LNA8lMHgWd8wNgMYvgDiVag2BXMNqsdA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5433
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
Cc: Joerg Roedel <jroedel@suse.de>, kvm@vger.kernel.org, Fabiano Rosas <farosas@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Daniel Henrique Barboza <danielhb413@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, Murilo Opsfelder Araujo <muriloo@linux.ibm.com>, kvm-ppc@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>, Oliver O'Halloran <oohall@gmail.com>, Joel Stanley <joel@jms.id.au>, Robin Murphy <robin.murphy@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 08, 2022 at 11:10:07PM +1000, Alexey Kardashevskiy wrote:
> 
> 
> On 08/07/2022 21:55, Jason Gunthorpe wrote:
> > On Fri, Jul 08, 2022 at 04:34:55PM +1000, Alexey Kardashevskiy wrote:
> > 
> > > For now I'll add a comment in spapr_tce_iommu_attach_dev() that it is fine
> > > to do nothing as tce_iommu_take_ownership() and
> > > tce_iommu_take_ownership_ddw() take care of not having active DMA mappings.
> > 
> > That will still cause a security problem because
> > tce_iommu_take_ownership()/etc are called too late. This is the moment
> > in the flow when the ownershift must change away from the DMA API that
> > power implements and to VFIO, not later.
> 
> It is getting better and better :)
> 
> On POWERNV, at the boot time the platforms sets up PHBs, enables bypass,
> creates groups and attaches devices. As for now attaching devices to the
> default domain (which is BLOCKED) fails the not-being-use check as enabled
> bypass means "everything is mapped for DMA". So at this point the default
> domain has to be IOMMU_DOMAIN_IDENTITY or IOMMU_DOMAIN_UNMANAGED so later on
> VFIO can move devices to IOMMU_DOMAIN_BLOCKED. Am I missing something?

For power the default domain should be NULL

NULL means that the platform is using the group to provide its DMA
ops. IIRC this patch was already setup correctly to do this?

The transition from NULL to blocking must isolate the group so all DMA
is blocked. blocking to NULL should re-estbalish platform DMA API
control.

The default domain should be non-NULL when the normal dma-iommu stuff is
providing the DMA API.

So, I think it is already setup properly, it is just the question of
what to do when entering/leaving blocking mode.

Jason
