Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2A5566A6D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Jul 2022 13:59:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lch6B44Mjz3c2d
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Jul 2022 21:58:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=RgE+8YDb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=40.107.212.50; helo=nam02-bn1-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=RgE+8YDb;
	dkim-atps=neutral
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam07on2050.outbound.protection.outlook.com [40.107.212.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lch5N4RCLz3bbP
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Jul 2022 21:58:12 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OSYIZ++FU8WWZ19J3tAIU7tmEvHGGpXEqyOMVHa/sHKs91zWkjpE2h/EskUEvpsQKem/5aGD0OJw7ymtijcl6Tn9cjZESw96IVEQ+ZPE2NA324aaINxaTgHSd59rFhVf67Wow3Meb7HKDgrqYQHskhl6EU0X5P1LyJgwqN14GKLOxK7cOzjYM3LBEuu56c/sKSqQaqD1TDpqLsJcmpZ2Ekvqu7bPv0JS2M8Bp1D7/Ez3kONi4y3cJa8eW+Z05snetp2hy0GyEim2YWqdOYrqmso3Xp/Zq8slP+W4cw2lrj8+DoCkRI0vu4ohc9uAiytHxO+DTAOMCYIp2PenAzZmzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SEZ4XSxUHRmxfNscQCunRzyCKVseRaZTRokpRN9U7FU=;
 b=IA8r6tGgb5UhiP1zAxUjEd1BGujOMRA59URGhZMrasy7Oy/CXow067lLIbn5Ynx/EKYn8XBZt8LCkgRuE4xEhvOmPWpOofYjM2zpJaT7gsnPV+UN4BANkghKCwwJ0mp0REvXnUHXnTTcSlYZgPfY4SJm0k6KctrlgaIoOlWSxQbIYivI+Zz0Va1302CFpxijkV5MAaswaNN6IcNuX6ELAipy9mA4K/ef0fhEzrXaceuURfu1R0nSWat68oQIcQfyigLEO0Lq6SLkozpxDGmTJjNHseZxVlagrCuvux08jiHdjstPJxKiu0f01LA1RKhN7bpWrmfZkt6JTC0/QQQaoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SEZ4XSxUHRmxfNscQCunRzyCKVseRaZTRokpRN9U7FU=;
 b=RgE+8YDbxrR+GbnO4d2BKapQu+EqIlODeZJr8dCYVpGo4WXPFh9XlxJukarDUEdCBdGbo6IUQ3KG7rIW5NmKgQGnlMQt58GqbCVkC3eMpLDImQvnYwcxS4xXwRyq6W394fcYnGOgPgXYY7QvgN/ps623JEvr0v84fbS6wWxYllevfx6EsT1tnz0Crvz94Luu0dxwINw65pwK4uSLjcxXbbS5+kgWFskExmJjxuVj44yUtr/pufLc8LH3hqPYmn8urt2CpmV31B3fS41fdTYXGizRDlbpDW2w13DCitCp0cbdoX8CsyZxCf2WOBp9OFXxTtg9EKHLs0lvc5kYJTiGiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by CY5PR12MB6573.namprd12.prod.outlook.com (2603:10b6:930:43::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.21; Tue, 5 Jul
 2022 11:57:53 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb%3]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 11:57:53 +0000
Date: Tue, 5 Jul 2022 08:57:51 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH kernel] powerpc/iommu: Add simple iommu_ops to report
 capabilities
Message-ID: <YsQnP/jBG22FnPMA@nvidia.com>
References: <20220705062235.2276125-1-aik@ozlabs.ru>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220705062235.2276125-1-aik@ozlabs.ru>
X-ClientProxiedBy: YT1PR01CA0147.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::26) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 46229f79-0d2a-468e-b1f3-08da5e7d9720
X-MS-TrafficTypeDiagnostic: CY5PR12MB6573:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	DKWEemuCdmHeg3GWX/HXm8QX1zqNO+X70eTbtAg7T/6SnnenhQUzheKm5Ieoim+ysgcIOBMPxvMKkdsUQBNUXIU8PHChCfAX60mHkD8tqvOg/259X2/HVo30qMpFPkGcPnHsHYvodVMj1D6zEksC8PoPP5GC4X7iTiL4sCEZNrDxdWDVIyER7zeahfjNAhVleq6XQJZkOzSRJzDfW+jNL88VjM6CCTHl68xvYsnU5pcx3Cp8Ghw50PteworUgE8lC3P2iBMmNDzANjfRLYg1GbnkJyMPXiy8KkntKaaBYbjL5BxLoyTZNu3OGiTv+B91mH+fAf3FGw7AVrNqjT7ymJaFjmGMwBeAMZzbcjI6ELiTouotabOAgAYFkEyR1DLH0cRhKD9A6Mq4X+OeWOerdD5TGUCwZMMyWSPNDarzY15XpfuMD1HWK1dKVrVrbLFgyTeCyykS4kUyMDIVqwrGlLh7xBdmp0/c0MNdbIRkg77ShlbAQbjJgJhUbfRMe+ZKE1IFzRQJhiwDCX5zIVKmPz1F7KhC9flo9upRkf06gx7vKWtTCHkQLnYS2EzuSTAse0cdL/MLtErbkVQOsKrEvos9w2Z2hmx2/Z0W+1AGrNDl0Ydgz1YRRfnpt+UFwXo5p9AVBfAFDvYGUzlIiNZ5T30mA6pH1VPffTO1LW6GfBY5MtJHaR9Zdo3qxHOvq+cY0kcNynfrfmX7PjYCgvbjukk/v0Vg/T7k7dVb7Luy2qmxOXjmPWGsF5TC8gRAPJTX
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB4192.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(346002)(376002)(366004)(136003)(39860400002)(36756003)(26005)(2616005)(6506007)(6512007)(186003)(6486002)(83380400001)(478600001)(2906002)(38100700002)(4326008)(8676002)(66476007)(66556008)(66946007)(54906003)(41300700001)(86362001)(8936002)(7416002)(5660300002)(6916009)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?dMaEaxftgyw0NT27JsU2bY/IcOJfByfIKccrX063f8Ex1ShfXFX9vmTcjQY2?=
 =?us-ascii?Q?n9WK7nkm2IQhhRR+63dEd7UP2IhC9AkouciNH4FDCvwtpwkypSK8M7hm7EnU?=
 =?us-ascii?Q?JnnNI2ewOBZ7Dc3ybldKcZ1Z6JUGnzxP2MAsiYznMEdiE51zUAuLDK5hEboM?=
 =?us-ascii?Q?uvOJPyZFFqcFlJKy626MSd+AGAcA8N8bjKud+uvUf+jU7F4PpXRp1K1TP+AR?=
 =?us-ascii?Q?WRT+wgBFAHbV0Ei5mUzLiM/LpnCnNcV1VcKQiEFPNhC8PR8dGap2DOZnHZC1?=
 =?us-ascii?Q?WHxta5BMnP63jzDDHIIpEZ0XBdTXGhWkHhFvpDQ38aCpvyjw8h/T8eL9c0IK?=
 =?us-ascii?Q?uwyEU/94uetqrtHN+8bpzYG29nk5smMrPAZp0RPioJPZg45XKoFDnxJeczHx?=
 =?us-ascii?Q?7CQhRxyEFgXMbzYg1RMT6HI4MltQQBbrOGHeqkVde+xNNL24Ofncn8I7Y/AE?=
 =?us-ascii?Q?hyOtCCJGy67bidLjc98NNPUvFSGOh+1EGMHllxNCCULBcgPSJ6EGzGTGbOtL?=
 =?us-ascii?Q?bzpURDyFSj/1IgGF0D7Y0XkMm4uY9Ysq3PH4gEb6f4k6ypygRQuQahRL28pE?=
 =?us-ascii?Q?kkb2zJo66XTkcS0TdOWik5XWeWZiekyK4brlXnBNnNvt7oppw5BnO2vgLcTx?=
 =?us-ascii?Q?uEbEfZV7vlZFupKBNSt2q8ku+KntBaNrGhn+Gm3QTw/CYF8t0vUJmtbo0mnZ?=
 =?us-ascii?Q?qYqrcpDX3T3Z/qc400cFo6kmjFWuKYJELHqZmVyGLyLGcHyNZXwZmTsx7nP+?=
 =?us-ascii?Q?Qfqt0DhhyijsNGD/glrrxbFKIq0+0In7gNju+eOb/eqLL7iggmdLFKI5IBsw?=
 =?us-ascii?Q?nwLKl8LnuR5V30lLdP0QCrTDV+Gcvyu75R/5r16pwFbIEpqmmVMsgwWQ1ZfY?=
 =?us-ascii?Q?knZWGjI0hEdjB52QtKObmJD0L/lPCcSHimlRNnHhI9M2dEe6HdRirEaOco6Y?=
 =?us-ascii?Q?saY+XhS50VMpiqoYEe5CVdsN20R8pSM4wteggU11yTz1MH6ktaZz6fHMmR/4?=
 =?us-ascii?Q?tin+VQKrJ0C0zE3P5Ji4W9MpJhJfmGSy27bTcGVZSGTpQ272yrOkkpC7w+px?=
 =?us-ascii?Q?j93RYcvrpv9AbiOh+Ud2wH4LfgopDPBKfinB9KNgarLmLwdx696f55LiWjNc?=
 =?us-ascii?Q?a2PhaafPtm8IoWn2VGCzdZc2ob9n7dUykzPD1YOpqgnPmNyvdI/4WAdvXRn8?=
 =?us-ascii?Q?EEBoNFHQPgurF6ynuRD8ZU6ztIwHxYHXkDilhgRMyqTdzgNC9qkdkWq0zMmT?=
 =?us-ascii?Q?SAQHm2/UjJS7F5g3HJsnZPm920pWb4gkPAfNIN5vr/PkVM1KMUKZPDw2S1Fr?=
 =?us-ascii?Q?D9JAzeLoyE+TQj3DNxwLG8xvmsK6f28Ca5KDxS/Z+rJ2ko3PGtl3a+bo77RH?=
 =?us-ascii?Q?S3wCH1kB83/C+Jva/cxletqKnLAcZQivONw0303H2ICnasOpdLmh67vdI5PA?=
 =?us-ascii?Q?K3vSLAgPvTyU8yh4iIl5ubDBOy5vwJCb4x9vlbsP7yLvzsS60doK/CRtQuqa?=
 =?us-ascii?Q?q92gHHvJ84FBODYQ15lHRTdpfOVICMiIrgL7o+PvWJeYnx0FHzZ+t2PWELZs?=
 =?us-ascii?Q?Gz7iqO1R9PMlI1vkdSQ=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46229f79-0d2a-468e-b1f3-08da5e7d9720
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 11:57:52.9052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: anCtLu6piYtef7P8C6+xBJi1ecQ10a44Y2nDlLjjfn80yBV8Kssmi0ORlMBgMouN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6573
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
Cc: Kevin Tian <kevin.tian@intel.com>, Joerg Roedel <jroedel@suse.de>, kvm@vger.kernel.org, Fabiano Rosas <farosas@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Daniel Henrique Barboza <danielhb413@gmail.com>, Murilo Opsfelder Araujo <muriloo@linux.ibm.com>, kvm-ppc@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>, iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 05, 2022 at 04:22:35PM +1000, Alexey Kardashevskiy wrote:

> I have not looked into the domains for ages, what is missing here? With this
> on top of 5.19-rc1 VFIO works again on my POWER9 box. Thanks,

Does this solve all the problems or just coherency? It seems like it
should solve everything now as there will be a IOMMU_DOMAIN_BLOCKED
and the ref logic will succeed to assign it?

> +static struct iommu_domain *spapr_tce_iommu_domain_alloc(unsigned int type)
> +{
> +	struct iommu_domain *domain = kzalloc(sizeof(*domain), GFP_KERNEL);
> +
> +	if (!domain)
> +		return NULL;

This should only succeed if type is IOMMU_DOMAIN_BLOCKED

> +static struct iommu_group *spapr_tce_iommu_device_group(struct device *dev)
> +{
> +	struct iommu_group *grp = dev->iommu_group;
> +
> +	if (!grp)
> +		grp = ERR_PTR(-ENODEV);

It looks like this should just always fail since the code code already
checks iommu_group before calling this? (Arguably ppc should be
refactored to use the normal probe_device and device_group ops to
create groups, but that doesn't seem critical for this.

Thanks
Jason
