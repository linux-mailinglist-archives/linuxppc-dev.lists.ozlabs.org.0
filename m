Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9538956BB63
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Jul 2022 16:00:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LfZg03HNnz3c5v
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Jul 2022 00:00:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=LTcBb2ur;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=40.107.94.50; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=LTcBb2ur;
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2050.outbound.protection.outlook.com [40.107.94.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LfZfK20zkz3c2n
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Jul 2022 23:59:49 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=esmcmH1JTMxL6wcjXZE4wCqGUjs8/Zo1T9/WFE9e+9g0G1+wSWlg3geSW8Ip9JVSvxKyCzmxmvFp8kuDeB/jViXeiKA2uZxv49GhFBtco9o+d0AE8400ziI9hfvgoRIWCdZwKTJlKky5YYnH225P1U9MsVjl9o8ikoj6DIh7lN9XIoWK9RVss9JeZbiWu5+jL8J70C/r9cRmf20cI0PMpK7bO9zyV+aOjgTlaIIht5SCl9P0w4fsdSHz2yaUsNOKBNsOWai42LDz6GlyAdnV2Q6+E0l/TjV4xu+fuMqAbLqsOf9xsAZqA9C6nbRQcwD5f2s9MpR7E1F/BLwJUK+OYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fgHGuiZSjdC0idkZ3Wzphb+S1uEI572SM3TEotmVD24=;
 b=eXx0iae5v7LVwAbwmVWrszMFjMriWl0TAwJNIJwGs6ZUDSiCNsPVrhOmuRcmdCGYaRhl+Ei3v7liPQ5Jl1Hz2BKHxI5AMZ9V52kNrjDcv/KsmYrGdnufxXfnEtwVxj45ktM52BRUi7lcKfQxr/2Qwrj7eg/4rXfJqe27nyWruDzgBUtK5cjk18j4dFdQarNibV/WzJBIKu6gZClRA2Q/90cPNry0hS76l+6Ad2wdPiKZNpAzNmPns2/dkR9tAwk0aJfKx90AfNOam8OrFQ/WgrBISjv+7cAshQVpPnDvsIN5372sMTY1GKgVUoHOKzBbT4YSfqvtypGB+/YFcTYD/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fgHGuiZSjdC0idkZ3Wzphb+S1uEI572SM3TEotmVD24=;
 b=LTcBb2ur7Z7cmgQWOJRIqsbwUCrFl2cnefBemv6e3SiMibgvQ+q2z1Us7ky9o0a09kefl9Y0zoHpQ85TC+tcuqrLDwqXt2SVRCiXdJZJvIhCycD74VQNYe9CiACR3NLTb/X8VLKx5FZMv5I0rlMkUVqMt7QkQB/OUdaI4OpBSgKiVnxcnbDLBqLOWEUPAeW2UJ0t3MTu6aciD0j6P5D6TADTpvVJF4/SPKZ7cXdwkyTqHNgYTWvh27q9xfcKaUTmk8P9KUhN6WtxYdW1+oFEULAehWzYBS197+e0cCiseu8prfpONjsDJMA1mAJpNkl82e9LH3izWzXmEA+NPVKiEQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by BYAPR12MB3525.namprd12.prod.outlook.com (2603:10b6:a03:13b::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Fri, 8 Jul
 2022 13:59:30 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb%3]) with mapi id 15.20.5417.016; Fri, 8 Jul 2022
 13:59:30 +0000
Date: Fri, 8 Jul 2022 10:59:28 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH kernel] powerpc/iommu: Add iommu_ops to report
 capabilities and allow blocking domains
Message-ID: <20220708135928.GA64621@nvidia.com>
References: <20220707135552.3688927-1-aik@ozlabs.ru>
 <20220707151002.GB1705032@nvidia.com>
 <bb8f4c93-6cbc-0106-d4c1-1f3c0751fbba@ozlabs.ru>
 <bbe29694-66a3-275b-5a79-71237ad7388f@ozlabs.ru>
 <20220708115522.GD1705032@nvidia.com>
 <e24d91fb-3da9-d60a-3792-bca0fe550cc7@ozlabs.ru>
 <20220708131910.GA3744@nvidia.com>
 <f2b51230-90b8-ecf0-8011-446e2f526bb4@ozlabs.ru>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f2b51230-90b8-ecf0-8011-446e2f526bb4@ozlabs.ru>
X-ClientProxiedBy: BL0PR02CA0051.namprd02.prod.outlook.com
 (2603:10b6:207:3d::28) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cce0c60c-193a-49ac-6f94-08da60ea13ed
X-MS-TrafficTypeDiagnostic: BYAPR12MB3525:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	8KgSu6n26vo4cAhDZlerOu1/8Sk5ZwaWfslRb39k8W/kcidkL8knVnpZz/r4k15HuipFZgK0JlAlYY1AzCkiF7nDE7XpfWf5OBBYO869p0UiSf/kd9QpRJqEkGQkFvEB5si48eLvF3Et1ZIzwxPGjohXLGAESfzb9MViXCjxnDS4bIOm8T2JAQ0jIBm72iA6aMeT5iQD+tXEP79YDL98KEneDQZ1oIz5GA10Q+vvuEBXd5Y1QRPmkNkMNi7/yh3Vk6tjxALkh/fn/GKLTK1I7zxSEbHv585MmOTTMW+9pYyj8bQMeC6JvkG+4ae1cT5cfPTaCZY8JtDgSWw99SEMQ4vh3aTquODeI9jiJvaLnLrJ3v8epdJcFTRansvCR3JvXdKqH3MBp6GTBYhU9zqGlMXAnIhWb1wzqPi1MB1tcBS8GA24EO9rg7zUbsIdSIPZLDkvnb+D2JL9H2tD/d75SUATuCUI1UuYcXg1mtJ1UnEZbYtxvwQmgtt24pQG8pw/QxnYGI6fq+fig3cuSVHfSWApnbC9vhAMeUTYkpKNq7hS4/LLJDk3Hvw+55AzNiY7rxWnpKICyTnoH9utqjPwskwvfxzkOFOvqv6HOOrGHH1H94NVb7Ts2IDJLgkP22eS3LjSyTlKtHqYLdXytKelpdnpJgkvH9rzi8osdDJZ4oo72iFaSogWGebkleYI+5gQ8GSYwrnvvPQCttY3+ZagTEXlMb8ATSKr3w8P9TF63hJ61vG8vumFSk4rQHGpkap6
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB4192.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(39860400002)(346002)(366004)(136003)(376002)(33656002)(8936002)(6486002)(1076003)(83380400001)(66476007)(66946007)(478600001)(66556008)(8676002)(36756003)(41300700001)(86362001)(4326008)(6916009)(6506007)(2906002)(26005)(2616005)(5660300002)(316002)(6512007)(7416002)(186003)(54906003)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?QIQD1EJq1JbpyIF6siP2fT/j+Ot0HJzQwtdw+pee11aZDD46u9mx9S3JIYbz?=
 =?us-ascii?Q?3DCrrqapAevQq43Anfg4luD85CO6RzTggaTXpv5cSlv529PjWm7cREFU0cx0?=
 =?us-ascii?Q?8w/cuMLXWWCr5y+lF3rgJZgKrUw2KrqTn0Lq2h/N2BVKupZsJ/89NtFC1ljm?=
 =?us-ascii?Q?IzCYMavxQEBojE6tbOt9b6asSddptVawfktND9MsHueAN6eoB7aLbvdxotjJ?=
 =?us-ascii?Q?LvmmWomG3VPj0PBbGoCcGUwnV2gjJ/kOJG5rrgpmNzXu34FuNqYCyaS/p8Mw?=
 =?us-ascii?Q?5iCC6C3WlnDxIvFHxcp19FbHciMyTnuf4CoHs3GiXLZG8JdOqPBlqPxuL3Zm?=
 =?us-ascii?Q?xzJnn2X0evpYqgSPj8dAJROV0/SeCRAa6NJ+jt5S/nqS1zCLVocZxEt6MUul?=
 =?us-ascii?Q?aYpckjtkU/HGUS/6/J0fnWw9UfuyZJvfn0gqde7FUaPe/wgoOQqqf4RPoh1z?=
 =?us-ascii?Q?iEEWMHopdafyT85SIiuzQO9qfI3xamghGgqPTwD9JujZ44btNgz1B+sdh8AI?=
 =?us-ascii?Q?O/GNjlzXbpBYSW96Z6tZEiTozljroYsxBDxIydhETOuoCS5zeTwgeQipGTaB?=
 =?us-ascii?Q?MJpHq07LslO1/4x9YziAq1yre7tvyl3NUYwzLwKtvL1ntt2u8HzNeZxvwm+n?=
 =?us-ascii?Q?VHP2B15ZjwIkIHMFibvbM3aaH/PmdXOiCCZpmit/ShaL3nVva49uyWhCNqBa?=
 =?us-ascii?Q?4pwzX3Bt+xc3R90e0AK9O+9ds1aQKGLyU3GHLmo8ClPlFgUOtuIZVYuQyToM?=
 =?us-ascii?Q?oZqCe414KyWAj2nTnzQOIcn/QUYpVxxi9BK9HgxdwSsXATR0YoqGLo/3ei18?=
 =?us-ascii?Q?6ah9vQSXkZFk8OFHlehxWdqXlBzwTTn8HGcC/rfv2YbMvwvC5SntRJK8+JTT?=
 =?us-ascii?Q?LJLPSGBBzBmlCHji7bJWeMv2QoKuwuVmMUeOTJPfV6MiNsb0tqqbQUwZqcms?=
 =?us-ascii?Q?vb/Fp1UydZjWb1ZP4lnajnW4y5MFC806DfSPfcru815PJi5z32AlYPXLMwCb?=
 =?us-ascii?Q?EkLXgwTRGFKg2Hm9Px2Pw1VVL/881Ke7Rhw6HxauYHYxrR8ER+Tv8fyjGkSD?=
 =?us-ascii?Q?B4Sk6w+h55xL00XMEvNEidjgB/acHl4sghmC9QYoyRHlOynV9nZhICvRCHcG?=
 =?us-ascii?Q?PaSYyLEPJNVZvsUMzBqUphnWWsFj+e7rc/8p01VFBHaweFAR+acYFBbKQUTr?=
 =?us-ascii?Q?Rk/pZ1jWsVREnUWiZAFcOlHCfUOnvd3KgZEc7Bp9IOKsCwqhxXCag2j+MSEA?=
 =?us-ascii?Q?5DUksrbMxci8uBs4+YCbVxxF3EXjyF8y3I5eVmBo7agy/f23TRMaRvNwpzCF?=
 =?us-ascii?Q?IGk6z7wRuoTg9cyW93rhldf93GtgnLcxP51xWMXsx6B+kSfmEYVoBcD9zTNP?=
 =?us-ascii?Q?s+bMq5F45XDhwpUbLxFa2zj+XjhMFiUkGdaRhK6cwmHSpoZZQLAncpLxnpb4?=
 =?us-ascii?Q?Dggo4RezJJgMlwkzsQKDrOcwEHC5jbuCoNOwDayanfyz0aiRnZN5NAnXayvK?=
 =?us-ascii?Q?cWBda0ETXJQ5SUXC28PMFJE+q0j9cwlE8bryVS6Aj3RwyG6FpZc7AAvvOLKR?=
 =?us-ascii?Q?AveSKgFnLTJsXBXOBJHDSOhxail3upwzekDZDsJa?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cce0c60c-193a-49ac-6f94-08da60ea13ed
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2022 13:59:30.0381
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aJTTcJ2Bngb1CvrRTQiMA3CuDftZuhvAHrTlZzPLDYkWUNE6tTHBrUEy06ze/e9W
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3525
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

On Fri, Jul 08, 2022 at 11:32:58PM +1000, Alexey Kardashevskiy wrote:
> > For power the default domain should be NULL
> > 
> > NULL means that the platform is using the group to provide its DMA
> > ops. IIRC this patch was already setup correctly to do this?
> > 
> > The transition from NULL to blocking must isolate the group so all DMA
> > is blocked. blocking to NULL should re-estbalish platform DMA API
> > control.
> > 
> > The default domain should be non-NULL when the normal dma-iommu stuff is
> > providing the DMA API.
> > 
> > So, I think it is already setup properly, it is just the question of
> > what to do when entering/leaving blocking mode.
> 
> Well, the patch calls iommu_probe_device() which calls
> iommu_alloc_default_domain() which creates IOMMU_DOMAIN_BLOCKED
> (==0) as

Yes, we always create a blocking domain during probe, but it isn't
used until required

> nothing initialized iommu_def_domain_type. Need a different default type
> (and return NULL when IOMMU API tries creating this type)?

iommu_alloc_default_domain() should fail on power because none of the
domain types it tries to create are supported. This should result in a
NULL group->default_domain

Jason
