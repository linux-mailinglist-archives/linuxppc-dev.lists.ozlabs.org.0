Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8821372AB56
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Jun 2023 14:05:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qdc8S2PRKz3fb2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Jun 2023 22:05:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=hthEUyYJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e88::619; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=hthEUyYJ;
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on20619.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e88::619])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qdc7V01stz3bT1
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Jun 2023 22:04:18 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TjGEzgGAq/zw5xPNUYL6NGnplhsDzHEBtl2X5ti5tHq6O76lxQyxPsJCdAEfg4FTJ5dJvRvwEZaYL8KXkl3bxPKHYx/P61nZetjLdmstqNTTd1yXoRtCKVooxy0PpVkRfrLXq5FriOJugv+8XtFmeptUnl6vkdi8QpwYQ8nb0uSONAeFF/HgFQxSEKrmkpFiS54DCOIz1DwcjsLSL9rkjdm3vF8Pxu4O5CzhCWXViy2wPdpn8omIeRqIrsAxkkepSHkLON4+438X4LhZb6QrQAe+ekdVL2JFOUjJ8wK9Onzq14DFjh+AOhFxxevKQeMiEt53xsPiiQDdO3FYTvlETQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=klal1Vz/qPejYayGBh2aS897x3En5tvWg0ZJR3RzSHo=;
 b=LZx6AExQMSSnyaBY52XNUWuY4e60SAvUd174ESI7PSqupfZIaqmA0S7Sogn4TBARCpGEnuzMtfJP0t0X6DdFPj2KR1Eg9xIVeLqj+pY08P0kUic1fdlDKsO1Vf1DIcstOgCuy5iGEZ5xvgHdB1e3+qb2eSyXj66zN2TSA5g8/395spaAQMkhIagZQhUi8C2x/PdObb5OYIjdmjJfd4lKmbtljXpMNAe1svnpl8rVVpuZMtKZ/ztPXyOp6jMo+bTVvlGHtVKulF3mE+0X/nHMlA72DRSoeJDmFoT83i4kGYM1DwSLYUUFSNpYH4/m+as/4TphjXCWZlpjQcRDseP8dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=klal1Vz/qPejYayGBh2aS897x3En5tvWg0ZJR3RzSHo=;
 b=hthEUyYJHCzaEKYLL6dS6zH336pHqcOgQsPXh9QKuAP79VTayYeWgLsVLFXWNJbvntZDka28Ga37dihqTnigAHIc+TQJQffBGKcRc+cHHPtloyXSQ82b6GLlMjZbOBTYy87Jbo6dy42PhsQwM4CODetEiiLzFYy6aUFxJVDt3cAcXAc/DDqK4ci9JRGFNoeiGQtsop9LdtZoBuSP3vlUohhSb1aLroaO2iA++KPwF3n1GlMZvRUCEQdeN4oNfgb5s8pGb4MGMTPlAJ9cZ9ls5Rw+pi5xhT/h7lP8XGjAz4F7wV5FLhRIRt15NhW4ayjKVWuACJ4PkYUShN+iOwjnhg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SA1PR12MB8858.namprd12.prod.outlook.com (2603:10b6:806:385::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.44; Sat, 10 Jun
 2023 12:03:55 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6455.030; Sat, 10 Jun 2023
 12:03:53 +0000
Date: Sat, 10 Jun 2023 09:03:52 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Baolu Lu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH v3 23/25] iommu: Add ops->domain_alloc_paging()
Message-ID: <ZIRmqK1565B/COT8@nvidia.com>
References: <23-v3-89830a6c7841+43d-iommu_all_defdom_jgg@nvidia.com>
 <b1225451-2a2d-0f06-da37-d476342db365@linux.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b1225451-2a2d-0f06-da37-d476342db365@linux.intel.com>
X-ClientProxiedBy: BLAPR05CA0003.namprd05.prod.outlook.com
 (2603:10b6:208:36e::10) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SA1PR12MB8858:EE_
X-MS-Office365-Filtering-Correlation-Id: d9ab38e6-aabb-4311-81ff-08db69aac2ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	ob8YGfs3lBL0hMAbAtVYypTgACwFqNMu2IjYBtWONSs07VtU1kc6Bs75qw7ugJxJ3qPqdeAw/WiV8YtNp8PEs4awU0v/p+qJnsMeUHAFVSjUyC9IyMsMuzayN8VF73INsJFJjxoqOid6691jSMhdv4L43+tYmyGtDMcWgArunv8tY+iXbR29fs+4fKyOEvJd2UqDD65K7DRbU1WcMxbIZKBrrpeb8DBaULpiIED0OKQ+6xcSija/Oe2mpn6SLM4pErJN8divzgpmuhrfj9RhNUIcCF3EjvFZ/ciN+JpaEIP3ueq2MpCSKNnrTdWJDXiGR9hoglZyPxr0yUzZt5s11uDeDzThkB2nq6CV6qNLR8338lstJxlkelae9u7M1z2dBxRIjH4F1rhPzN78Aef2xolbS5MGE5xpYbXe846Jb3uR+nsw15iBD5358nBuyY0TQlCIkiAgyJLlBzggVvlNMyVKbfTB28bwM3VDJDj0UXP7ZeMyxtXtEjkOylr1tEMEQIhVS34arA8oTgPg6uPujOFPxy3q2GAKqEvR+tUbhS5tg8xrfXkbs14vg03Eh0ZG
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(39860400002)(396003)(366004)(136003)(451199021)(54906003)(478600001)(7416002)(5660300002)(7406005)(8936002)(8676002)(36756003)(86362001)(2906002)(66476007)(4326008)(66946007)(316002)(6916009)(66556008)(186003)(41300700001)(38100700002)(107886003)(6506007)(6512007)(26005)(6486002)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?hXZIhjQOnUnXFiILxWmrU+BxuH7r7TDK+u8xI2tIrJ0tzf+Gj6fD/0pjqFKZ?=
 =?us-ascii?Q?e+8CBbeph/If7/K1EIJtp5pQ/hB+ZUaZAf2GGiXNqOwFVmlMvNXFx6jUUApC?=
 =?us-ascii?Q?2tNslLxMMzC2BM8CAq4dqtSbsrERCC4KeJ2t5xo5OvTBIorojlc+HRqQ0uyx?=
 =?us-ascii?Q?8EHU+Ok+5UKWuCxAo1ge8+0bquIX1u+5JKie7OC8CqBZdovcYtItNfqVf8RU?=
 =?us-ascii?Q?9+nBF4zyiYwl6vTEmAULx+xmGyCfbtyabgU281IA+sgYsMoPuaCbVdS9ZfnL?=
 =?us-ascii?Q?KCsMwkvMY+Q87fCLqvnUnLKqywa0ks7VKf6utXL6ld7lmvP9biq5rFkxMpAo?=
 =?us-ascii?Q?pJ0P59yiS5FiSfr9lqaFo6zPLtEQoI4bNs3CAjSn+X7ZN1wFVZze7/TQ4Z9G?=
 =?us-ascii?Q?B9+yxczgkYSbkKwj4EvUcjfDcGLeCsG5pj7kXJuCIs+bPNJKg4tpsDFp0BoV?=
 =?us-ascii?Q?1l2i40tNhVneVlPEgg0Ll0smhjCdAkMEpQRFzJMI5QKP32rbuuVU+vEr2fVw?=
 =?us-ascii?Q?rWOIQSRZiCM07b3SQSId5K1HWrVNKGKe9gcHpi7D6rKON1XMVB84+tKqeK2B?=
 =?us-ascii?Q?WIyzsvLGloPty3SYVy1zgUr1oaXf6giN1FAyP87pWRGYxdPi6GhXsOCAI55u?=
 =?us-ascii?Q?ao+qSrEYYb2lIRhORei2INr+mShtLrxzW5El8ZLzdzdnDoUi6jaz8RCYib3u?=
 =?us-ascii?Q?Lz50ArpwfTu8rrMlquj5GX6qYx5Htzh6NgUUaRVTT36L8yLaR5hoQMKiPDJU?=
 =?us-ascii?Q?AykAzoMawHZJqJTJUZGJfIbafbHzqmH0tR9G/cgjXJWqu7IyQya5jXb/Ta3v?=
 =?us-ascii?Q?4cWg0xOkXW/D38C3qYW/F73fY5pAuc1DD08q4ih3srFZasNYn3wsknsGPYt8?=
 =?us-ascii?Q?8E6JKGeGlBE17FaeBLQLEmbtGe3W9giIQxFOljweSwiRwi7aGjEAsxvGAOfA?=
 =?us-ascii?Q?+sfM/+qiwRUz/lA/CAjkzylWFLNwFGojuDs3KWNI3QJl5NFXcO6tmHYaRKry?=
 =?us-ascii?Q?hMGdXUpVYTrldGz9xiMum/vfS/1D0RXL489SaB+V4z4bCSt52FDYQHU1+S7T?=
 =?us-ascii?Q?Nb+LpebB/5/0sPEKZPbhMPMcMp8893MHatl8jBOSbhzmsgu//vNm9VOfcG7t?=
 =?us-ascii?Q?NYICpozBsExdh7iYMg70mYduGra5mcCK7XVsM97Obpi0n7zb3NljbEglv2nL?=
 =?us-ascii?Q?eAE11fxfhZvdwDjlpeZ384yCiL71hDWHp7Aov8ECnNiJBWbOcCTnAtOHXGEB?=
 =?us-ascii?Q?NPaivB6QcUkWR/HV/ZZAkupwT7TeOkBkcltz/ZOZ1i2bsOM+xQFPYRBZem6J?=
 =?us-ascii?Q?msZCZfjgAc/0SyShL4mw5HalH4gbERiiMzI4341VM8IgRtvJEfc+k7cQphZs?=
 =?us-ascii?Q?jazEPIo62d6/eBFLVUyu1clU897qflD6eV3hDXFlk5H0lKW+UNadjc8nQJES?=
 =?us-ascii?Q?LzbgkkN9BS1vxvnI0ONVb06fVCk6mKouovS2bupPaA1ikqE3M4HHNHY5Tttw?=
 =?us-ascii?Q?A9xxaAVM/3wQuipbUPOK9CRW6Bu4d3O0mw+Hvgu3PJinGNWbsfLnBSVywYxh?=
 =?us-ascii?Q?ArzY/KjTKrw2KYnuPBcOQeQ9izmND9nt+W7VGo3F?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9ab38e6-aabb-4311-81ff-08db69aac2ba
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2023 12:03:53.7279
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i0zZ9CjV0T/pAHrJO+X+0nPX2mvnViGoZBdi6LdECaIR8MZ+PCBhzuWBSHRGsp5R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8858
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
Cc: Heiko Stuebner <heiko@sntech.de>, Matthew Rosato <mjrosato@linux.ibm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Alim Akhtar <alim.akhtar@samsung.com>, Dmitry Osipenko <digetx@gmail.com>, Steven Price <steven.price@arm.com>, Will Deacon <will@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Samuel Holland <samuel@sholland.org>, Joerg Roedel <joro@8bytes.org>, Russell King <linux@armlinux.org.uk>, Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org, iommu@lists.linux.dev, Andy Gross <agross@kernel.org>, Nicolin Chen <nicolinc@nvidia.com>, Yong Wu <yong.wu@mediatek.com>, Orson Zhai <orsonzhai@gmail.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Thierry Reding <treding@nvidia.com>, linux-sunxi@lists.linux.dev, Rob Clark <robdclark@gmail.com>, Kevin Tian <kevin.tian@intel.com>, Niklas Schnelle
  <schnelle@linux.ibm.com>, linux-arm-msm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Krishna Reddy <vdumpa@nvidia.com>, linux-mediatek@lists.infradead.org, Baolin Wang <baolin.wang@linux.alibaba.com>, linux-tegra@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Robin Murphy <robin.murphy@arm.com>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Chunyan Zhang <zhang.lyra@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jun 10, 2023 at 05:08:31PM +0800, Baolu Lu wrote:
> > @@ -1992,8 +1993,13 @@ static struct iommu_domain *__iommu_domain_alloc(const struct iommu_ops *ops,
> >   	if (alloc_type == IOMMU_DOMAIN_IDENTITY && ops->identity_domain)
> >   		return ops->identity_domain;
> > +	else if (type & __IOMMU_DOMAIN_PAGING) {
> > +		domain = ops->domain_alloc_paging(dev);
> 
> This might be problematic because not all IOMMU drivers implement this
> callback now. In the missing cases, the code will always result in a
> null pointer reference issue?

Ah, thank you that is a rebasing error :(

> >   struct iommu_domain *iommu_domain_alloc(const struct bus_type *bus)
> >   {
> >   	if (bus == NULL || bus->iommu_ops == NULL)
> >   		return NULL;
> > -	return __iommu_domain_alloc(bus->iommu_ops, IOMMU_DOMAIN_UNMANAGED);
> > +	return __iommu_domain_alloc(bus->iommu_ops, NULL,
> > +				    IOMMU_DOMAIN_UNMANAGED);
> 
> Suppose that iommu_domain_alloc() is always called from device drivers
> where device pointer is always available. Is it possible to convert it
> to a real device pointer?

Yes, Robin has a series for that

Jason
