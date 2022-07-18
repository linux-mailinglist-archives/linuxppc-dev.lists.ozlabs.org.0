Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E675787C7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Jul 2022 18:50:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LmnyQ0LWtz3c4v
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Jul 2022 02:50:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=RMA6Hqus;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=40.107.100.48; helo=nam04-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=RMA6Hqus;
	dkim-atps=neutral
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2048.outbound.protection.outlook.com [40.107.100.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lmnxh4wZkz307g
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Jul 2022 02:49:40 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C66J1GqJT0L9CCuszqSdyXhID8Ay+APAGplk0Exqc+15QRtfpJRxDHQybF85wIfgxZy0e59XfapCI3XWzu1UNyguX7vpnLJn26mTqnlUp0sjPTZXRlpajg3vT0ZHbQU7N1xmQ5oOeookLsoySOdmhdzUr6zTvnuO8akEhYfGltnV8Zbisj0yopjYjzymaYFTF206zdbeI/hB1lkOMqJAEaNsz9sJH5qdQX38UF6d2oN6jxFtTlVMUycZkvC2YUr+KJ1mU5+OI8VTnJjplNu48G0BwBIVjIJKArwot6w3gw4mj0zPGf2/T/jeFORTXyC+460eLdnW8I+znW92hLRAYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fCQGx+i2YlwnVu/5q34Bx2+nKeo5q84suxQWNuy5Rm4=;
 b=Ws2QzlWv+JJamcWV0421OnTvkMcgTr5zxp213SVByWSvSKSpE8Hh679YkaA+srjemrsByvZEB+C1CeKzbcXaouq71Ab0LnNmQJy8HSQdsCc8pm0yt/5wBl4ESjRvAaGy6ejv+ugPX3zfnavacSh+5LWCjAdk4D4FbiGfqP/mnLoLC421WZoegXWWfhWjXKtoaptqS4VBkpSxodLh5Ki/Sht7OFK1OW/vdogvgvYp/fMNaVsZwMooO8at2/Ji707iuruc+4fivpxZPw09a4cAH1ppVHvwXJ/8/U03P413uLGul6Sn88RXTdHFrIj5NZiNgUy/9AyV/h7jZgL+Re9WxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fCQGx+i2YlwnVu/5q34Bx2+nKeo5q84suxQWNuy5Rm4=;
 b=RMA6Hqus7z5VZ4hMm4Z8vL6zoeAK7m66Z0cNtSyegOtFuHJw8hF+CiqGJjf4AXLZJwDFIwzOC21JA6shj8CNyfPTLjstz8uuxYuNT5BvPFf5Ggz07ufBLRjHGcsWgdbtPR7C1SJK/oCQOhIUgzEmt8AsFwZtjY9SfUhvB25smtMhzvt+ps9n03bj92tw6Ai2Fz92T1u/XN+Nfi91dG5TLOzEgp4Ul6Xa9UW5rR41fiZnDXMAiDzzyvEgrkzD+D5cR3GGZFRnx9yFyx2Zp8ND9BtZFioHUMTXSMKWBw5g5zi5FpUwGIkXnFVenyB6Yl3JpvcjB++8ACa34diepTv2PQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by DM6PR12MB3529.namprd12.prod.outlook.com (2603:10b6:5:15d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Mon, 18 Jul
 2022 16:49:21 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb%3]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 16:49:21 +0000
Date: Mon, 18 Jul 2022 13:49:20 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH kernel 1/3] powerpc/iommu: Add "borrowing"
 iommu_table_group_ops
Message-ID: <20220718164920.GC4609@nvidia.com>
References: <20220714081822.3717693-1-aik@ozlabs.ru>
 <20220714081822.3717693-2-aik@ozlabs.ru>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220714081822.3717693-2-aik@ozlabs.ru>
X-ClientProxiedBy: BL1PR13CA0158.namprd13.prod.outlook.com
 (2603:10b6:208:2bd::13) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 728e9366-5518-420d-bb41-08da68dd768b
X-MS-TrafficTypeDiagnostic: DM6PR12MB3529:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	MeISQJdijtlSeISty9yoorhKS6vyonw0eSEFwiBejZRGwF9wlgIw+OxKRbCSqQcI2HStBVvY49wPsrzKdF7gHCpcbqnFq58kuDe54aO/nH7XaJ3fmApl5iMjodTxkxdhq8lU6EYVBCFlxUN5zSKP3scpeZm1F5/6s17sHNlHsD5fO2fNWLTh8+VD5U851v+nNunw3Te2/nQqbfNkl0crymWLWWVUL1wWaSR4GhWZ1uNig3QLkPZaM0Y1VM612KOM/rZWn4pAMCxydToNXgM32vWCt9ko4ylzmp/nbKPpXfRKeHl6MQ8QmZSIdKlRspGeTysZZxGSN+TSy3zs2Nfce6MxIj39N7IQH4qVDMLq5MbpTqEtnmjsgNql7DxlYLYRgJT0oIUlQbMF8nGKxylcyQlSxVdVcod8uTKzGRZsEjgzGHgLoyhX4S0mjA9LwYVPZuhL+4B1Q7IcdrKEwMXq2h3J+gxrkYQnYMZCwVeb+/T+JQG5nnB6j4Fwa61ecuPreuojJ5j//vkiTu67R+cnB0FoamEUFrpYTFNAvwEmNQ8Opjw41PSK/gXdcYGE2b69GLxL5L7edQ91yiN7MHttZLdg3vPXIz66bV7vf7aOrrv8zaHovrThiL/UsNzZ9nShaiVGd53TMkiqApdRNtISQaiwhyJD1abd/+aoAWd5Pswdcv85TX+VNT4gBBri/+7ZWxwJjwtmo2MYM23UAAtQ8XGcYqC5M7FY41kqCVekOoAG1PvZPVKjdLOzAXDouY7WOSjbQNdG9T27+MWCoU4m/Q==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB4192.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(136003)(396003)(346002)(39860400002)(376002)(2906002)(8936002)(33656002)(316002)(66946007)(66556008)(6916009)(4326008)(54906003)(86362001)(36756003)(6486002)(41300700001)(66476007)(8676002)(478600001)(6506007)(2616005)(83380400001)(26005)(6512007)(5660300002)(1076003)(38100700002)(7416002)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?2EZ6WkW9C01Zc+7v+jcgwKZBz9coctBwNw3uVQ+HmPzV/azj0cRYKdocN3bY?=
 =?us-ascii?Q?ZzVXdusoypidqvzRIqCBnJ1xSe+Nf8GMRW2vgchDTbxReR+ejMIXd4/829T0?=
 =?us-ascii?Q?Y1Hn/2qHJqxk3IXmH7EP5RsDV+7+BCu9fZNdCRMNBFzQXgVqgmFjUawmilH/?=
 =?us-ascii?Q?wjlI7XjNHpFYKCi4RQNlweWbeeq1RgQB2stateoqMX2ctVtqmlBydu9wkzbA?=
 =?us-ascii?Q?MQwTuC01id/MdPfIK9LumUIoKs2CPn+4eBHKL3kc3jOUVUcyKJQEz/NrWaaR?=
 =?us-ascii?Q?lxko609LYiZ6Ngtr/d/qesp7kFy8g/wY5AI8XZbI1yam2z39sMswSAcEO+Kc?=
 =?us-ascii?Q?YE9mS1zZAHja4KSLJpMNm2lit52jk5gKJo/9AjP/UvnWMSeHIrmeH8XRWltV?=
 =?us-ascii?Q?Ld5eHRp3+f6d2XtTDwgmAw5jHbMS0e9K0JBPQSkhnRPpm+yK7QMY3rkRTzdC?=
 =?us-ascii?Q?sEX86hD88ArY4eVVHg+tVKCiU+FsWU519/+noixRWhfIxH8tnRye5Wm+5CFV?=
 =?us-ascii?Q?jogEWzlol3Fq8f0nWjw71VyULL0YSDeU9KPeG1McsFL4dW+ukLeE0C/tz0EL?=
 =?us-ascii?Q?Y/J9pLDo5vKtFf1pfo81HjmmS8dSvjQdCNtJMvBDPCIzOzuqWgkYmC10XhYI?=
 =?us-ascii?Q?2fuz9x86g3Ec1+Ag6DbTTpi3wIIXmu9EDi6k1I/VHofy+3ahGdEJJPi6hEzo?=
 =?us-ascii?Q?WMBSeS2eN9FTgeNJMOAra412mW411zserfqRGreDTfNwpuUMtehGjudUL+Bn?=
 =?us-ascii?Q?ZmvgCGStX4iufHrgrYsWkmiU9q9dUGNtqh8qPpt/QnCi1KfI3TIDFveQ0bbw?=
 =?us-ascii?Q?Mx9ev3uTDpT07G6IylGpEThnIN4Q2HWpkNxScw/A7KxYKqe2Zelhg3VGQrOV?=
 =?us-ascii?Q?FjXMv2MCA9mJZeA2OQ7ysHTz6QgFZeeDbh14KIYHPBtUarCOk7VtjPfxS90O?=
 =?us-ascii?Q?LTCigvu9nDGmNY40i7I5ZdSLgmX9JrkP5nv402ejTiRtP+6DlybR65CV4AuV?=
 =?us-ascii?Q?01HzGJFcQ6+PVnlq9w/5t3gzEz1k1pSbltUVUK2ncK2Mm+u0EzBgRi67arMQ?=
 =?us-ascii?Q?3eIZt6hm9qkHW1IWnACmew0rBIkXt6oymRnKYRDNkVyD4YF4qFHs6QOskjga?=
 =?us-ascii?Q?dk8MGIGlz6tPXEdhm1RhGJ0Xiyw0HmDmEkOoHwQfcBDHt4KozavXy2oJfffq?=
 =?us-ascii?Q?mnA4DWAgR68nPxpveZ1fJFuukg+iiF988/xsDz/GHIzBon40gFKe8gg/8Ffg?=
 =?us-ascii?Q?3oLAKUrxFdNsSFoGWj1Cq4eh2CHWn3jQ4jp2YoCiY9ebMMV4OPYd0YSA9oi3?=
 =?us-ascii?Q?uZwoMVNTIlZT8AYkRes64bKerX/zHoDLt2EbpD4cxDw5w3MUgCpLOIXWKVyL?=
 =?us-ascii?Q?jkRlwnYAM/4GucCCXSaC/HMXXlPwsw8gpjutQUW+i80IKRjLVfmHN/VwqpB9?=
 =?us-ascii?Q?38RyES59mKQCtRZg7F9r2OmptnpWFLAKErFHr6KVUChDkKfulkr8P/8cHxad?=
 =?us-ascii?Q?0NNMIpVaulnG7MCowgFk78mQI/3R/r9iKYxCmzqzHOWw8xMPLvqoogRrdCO3?=
 =?us-ascii?Q?o8ZzzKc1hKD6g8wnF4HU4d5P8Pbj1rj1QmqwBbJN?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 728e9366-5518-420d-bb41-08da68dd768b
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2022 16:49:21.3682
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tjb+2uWzJxdd3KRv4so80rNAdkTOlQnFsTO5D4UtRbtLV3JPa5MXjEvX8DRehpWG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3529
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
Cc: kvm@vger.kernel.org, Fabiano Rosas <farosas@linux.ibm.com>, Robin Murphy <robin.murphy@arm.com>, Daniel Henrique Barboza <danielhb413@gmail.com>, Deming Wang <wangdeming@inspur.com>, kvm-ppc@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Murilo Opsfelder Araujo <muriloo@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 14, 2022 at 06:18:20PM +1000, Alexey Kardashevskiy wrote:
> PPC64 IOMMU API defines iommu_table_group_ops which handles DMA windows
> for PEs: control the ownership, create/set/unset a table the hardware
> for dynamic DMA windows (DDW). VFIO uses the API to implement support
> on POWER.
> 
> So far only PowerNV IODA2 (POWER8 and newer machines) implemented this and other cases (POWER7 or nested KVM) did not and instead reused
> existing iommu_table structs. This means 1) no DDW 2) ownership transfer
> is done directly in the VFIO SPAPR TCE driver.
> 
> Soon POWER is going to get its own iommu_ops and ownership control is
> going to move there. This implements spapr_tce_table_group_ops which
> borrows iommu_table tables. The upside is that VFIO needs to know less
> about POWER.
> 
> The new ops returns the existing table from create_table() and
> only checks if the same window is already set. This is only going to work
> if the default DMA window starts table_group.tce32_start and as big as
> pe->table_group.tce32_size (not the case for IODA2+ PowerNV).
> 
> This changes iommu_table_group_ops::take_ownership() to return an error
> if borrowing a table failed.
> 
> This should not cause any visible change in behavior for PowerNV.
> pSeries was not that well tested/supported anyway.
> 
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---
>  arch/powerpc/include/asm/iommu.h          |  6 +-
>  arch/powerpc/kernel/iommu.c               | 98 ++++++++++++++++++++++-
>  arch/powerpc/platforms/powernv/pci-ioda.c |  6 +-
>  arch/powerpc/platforms/pseries/iommu.c    |  3 +
>  drivers/vfio/vfio_iommu_spapr_tce.c       | 94 ++++------------------
>  5 files changed, 121 insertions(+), 86 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
