Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AB89E72A315
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 21:28:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QdB223ffMz3fQJ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Jun 2023 05:28:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=MYAE1xd5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7eae::600; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=MYAE1xd5;
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on20600.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eae::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QdB181rT8z3dvv
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Jun 2023 05:27:21 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VYF4/8Es60mn/u6WiEghTedb4ZGOqfzsM+rS22oAR4PHjeAgszz8R2rh99UrHazphWrYtWD91BeuiEL6UnWT2nfMHnQwuB8+Bz+dWhsJyCMZI2oGftcWJyDnP7vKapt6oENpZvIw9kfH92BNdvm27kqmip3h8zxPHR/rCv0NIBNn8REpWpp9vdx7Gd2Qb8XgQvH2/Zk/h3czdeOSqsCQ8G8ICALdeIUGGzmSCwVyR8g/fD8+gD1Y/ohm5qCvLQmUle0edvp5LgLNjTd0gdyH5oR+tKu4A2icbTyTyNfwHW4lW/VXZ1SoCzGqCtps6+jpJ9nPSoFOmlNoQHjYOrsQ9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C9YUPWM91MR4EBiZMLndEnewf6B/l01FB3/xk9//8Cg=;
 b=mNLlYNaSqw0vIhf0zM1//cQKmCc/xMS+P45daT9n9cYQmIlCelUsFrj43VpORnPLFa4fmOjwq4mWANUNt/2CwuBLY8FBXWUb/0lvUBaRuI94wLFrFNErHPfRDCIZZ4JtGPGhjFJjnQFr5WRA3TdILWKvTmpUFLPmcUaON2/2TeFG/687diOQEIrNUF9OHq63SnibkEMJpWR8M1npi3rrtpGiDKWio1aJ9TnPzSr7JC38dlfWTcUrZ9PQxj1wPJmEtoy72/nuVnrHihKkDerZ4jtkj/qpTQgbdhCn9RxouCSg4p17wFCHUwuwYCNlefJee7tLkPyb5WeOkY/O41Zw7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C9YUPWM91MR4EBiZMLndEnewf6B/l01FB3/xk9//8Cg=;
 b=MYAE1xd5vMjvlmrClfoXFTP6lfYSiHnMFPT5GxnTmMuH+PNgELVfAyO4EMLlN/O7JgW8uGpoddL8rtuP0t8bEZmFpkOi83a/ikju3ajf1QuTT6/9j6A61poUqKKKs5pcrfF9e/CKaPDgeUr4suHEkLFCS831gkGCkFBuUTl34/WUEe24Fw7C5wlSa83COVewoopc9vyltIaReH3TJZPIs1n3W3cMTYl95G0wl1Y29PjyLC965ATrcMpYyD+nimmZyhQnmQBWNBp2RtOlIr10QNZXlylRaBRNUnfZa4njrjrQPcnZp9kleLmVQTImpSn/g7ldyurgMgnbCTsBNaUUUA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by IA1PR12MB6412.namprd12.prod.outlook.com (2603:10b6:208:3af::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.39; Fri, 9 Jun
 2023 19:27:02 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6455.030; Fri, 9 Jun 2023
 19:27:02 +0000
Date: Fri, 9 Jun 2023 16:26:59 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Robin Murphy <robin.murphy@arm.com>,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2 25/25] iommu: Convert remaining simple drivers to
 domain_alloc_paging()
Message-ID: <ZIN9AwJ3DskG9s/N@nvidia.com>
References: <25-v2-8d1dc464eac9+10f-iommu_all_defdom_jgg@nvidia.com>
 <67a01c3f-9495-d586-1fee-4fd6161cadd9@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67a01c3f-9495-d586-1fee-4fd6161cadd9@arm.com>
X-ClientProxiedBy: BYAPR21CA0014.namprd21.prod.outlook.com
 (2603:10b6:a03:114::24) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|IA1PR12MB6412:EE_
X-MS-Office365-Filtering-Correlation-Id: a81131c0-b37f-417e-42a5-08db691f800a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	B/cgWAQPwogq7HlZRTr6ERzvw6/6nGsI5aYgBNIAZ/a/2UW+KDSythwsiEDF4H3tOZQutRnvDFaipxzmkw3EOPzVE4SlGOACvlfNGOguYg3jl0DGnKsxyzrBUWcTUDDTVQmxr0YYyLeY23RiWzbp/e44ijesNIp+ondVNLvUJ+VmZtJQZMnrTe/1D/NeAx656B9hnPCuhdC8xjNNInV+52ALoinHEDNPZfmd7smd4aXAFgHi2NaBGi8cCAcWNY/MkdsewlMoFoIbZWBrzMwvm7Nx3ArsBcubFz/7mq39deznxAW+IH4gFVezTVFfCObpXRKNIvIrK3zuOIGkxJnxVxw0qlZvosNU+vcrr7+ARlPGgNelHuHpov5W96XnF3Hxmbamp/e01uD9basJ2WHb/KQFA8JrH9OgzFcgmLmIAklLhPSJVWm8eGDM0xoROcZu0nP/rre4kJ7JwX1fsZe1j8daTX0kTxjb1/gZ2+VdF5W18VktY0E+u8oe++7l8vd7Lm7ao78M+T/0P5D2SeCuys+S0/Vlm4K35sOsYENYEYP8pIRaAYM+wNUNPrcjHc20
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(136003)(346002)(39860400002)(366004)(451199021)(316002)(6486002)(41300700001)(83380400001)(2616005)(86362001)(7406005)(7416002)(6506007)(6512007)(107886003)(26005)(186003)(2906002)(38100700002)(5660300002)(36756003)(8936002)(8676002)(66556008)(66946007)(66476007)(110136005)(54906003)(478600001)(6666004)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?VK6DMr9dLbOMyxiE8Na+F4ZaLTpT6PGQLFwor42lV6LGy78pozwZ2xZhDmFD?=
 =?us-ascii?Q?9i33lIwke1DkDugwRSSOe7lbEQivcAx77jy2YDjB1grPX90jZEnoqA+kt9ia?=
 =?us-ascii?Q?xWAD/TXk4ma18/QY8x/VtHh0/F5xsDacPQ6xwKWPUBoY07M4u+byZcXGEz37?=
 =?us-ascii?Q?+6xEwm0y1/AJDNT14IWwNOclIenXtiUc7mNajHjrNnQAJJ6zsbvVnWENttf+?=
 =?us-ascii?Q?pZpALfF1QKONAzTmH/k6Y06PhuFCfTU80RyzUALZM4voYnZlnBSKv9xkfOz8?=
 =?us-ascii?Q?6K/pV6xaeZc/tGPquclTpHanp47V9Z6vooI9izdJqGvIr/Kh7xHTU51fi6ei?=
 =?us-ascii?Q?eFSoRRaFBrR3GXyRH2xjdfQ9FPeZMgfQzWz4ALqGgGTE66+dI6hMuF656Dyb?=
 =?us-ascii?Q?1lzcyGUi/urmfaG9fWEeCf598UDlP7A71G4tpEiMCvbYFbmLx0wOygHXnZFr?=
 =?us-ascii?Q?jd3vC1VbG3qsy2ILN6Py+P23gf+/f/L6YwmJmjrcZwLRgsP/59CdXfcPCwES?=
 =?us-ascii?Q?OiIRZ2lhk7d1DhAC0QU0KXztkllz1b+wU2laHaig92mIm7tc3AepK9Urv0RE?=
 =?us-ascii?Q?DIsjrNATGewOAcU4Ah9QIiO0eP+kZ+wyWVCIhZozzmifM4Cab59/DhNJCXHn?=
 =?us-ascii?Q?AtqYRzPPzi2YCcOetMJzjqgIx7pS94ixyR6SsKOY+943XVcYhpqZvn+OMGpX?=
 =?us-ascii?Q?p91pSFygTrd0c2C4BejpqbM+EGHjTj3DsRGPXg4BpIcyQ3jjURFPZC6wgI9E?=
 =?us-ascii?Q?s1zAwRVFOfyRI8yTtI1bJa+x+4ZIGWKZsnSFR/hP61C4a+zgv3Luoy1WDB4q?=
 =?us-ascii?Q?+AFPmlPMcCiP4FM71xLt+pO8FZzrkI+yLE1zwULOZeZpn6t6J5r/jCbKiaQ0?=
 =?us-ascii?Q?FeWpvhdLv89SaCRwAhaKzd43YWaaqJEWmsmigPp+7bR7Ob0+chjcyn1Ie4BS?=
 =?us-ascii?Q?BxL2SaOCt64JltcntkwEXoyabGMcYfL7uF+uNcKnaGusZQlW54NvXGMMqnf1?=
 =?us-ascii?Q?eGKKyHgUyfAuLkbGLWWV6XponD2C4SPep56L/tHJQxNtgc0VYqzZx7Kh6RDL?=
 =?us-ascii?Q?Rr3Lq+v+L2btzNB/R00jYooE+gk+3SvA3sbzjWmfbUbtwXga9D+Qw+P/OA/V?=
 =?us-ascii?Q?iTWIpeNlOdCTgKLD+uR399cZ+slGyozs5yqm/htO+6E0bki++s2Y5pxKakAB?=
 =?us-ascii?Q?h3Rrzg59kUwwA4sOW8XF6kEvR5wBsDeEKLFLY+ie69KPDzWUlAGyksB3RtSW?=
 =?us-ascii?Q?1XMJeDymHkuoBBqPgPdUkkmBbiIXc5Gzxo2cDNzztlK+86B7BEJp9RDv1AMR?=
 =?us-ascii?Q?mwVSJk3uUpqoFFobj7borv5IT+HjvE4D/7E68Mfc1GbpKnmpwNhQ8IIkqOj9?=
 =?us-ascii?Q?+4tuDBzNCHNyt4UgQxidJksGz7pRqlqKOS1hoJw+xPOB+lu2M89a0srqQnU1?=
 =?us-ascii?Q?3fJH9ZpPNbunYz2wlq458f8rqxXTlTihYtnWwKyDTQOV2e5vMixTP+zNcCkJ?=
 =?us-ascii?Q?8IrW8dZ2a9gnz5GwoeQT+DJRTPAZaWQXiZR+YTMNWTlNxZDWEsuQYdMMHGPf?=
 =?us-ascii?Q?ie/N9tziYsMnoFnCCDtKUnwuSFhE5S+8vBp11V+4?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a81131c0-b37f-417e-42a5-08db691f800a
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 19:27:01.9210
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u6c1i6ZTVjsDWpu4np0+y2+aTzMM9LSRsVrmYlTgqRMvSAFqM2F0SsJD5zIbTtn9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6412
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
Cc: Heiko Stuebner <heiko@sntech.de>, Matthew Rosato <mjrosato@linux.ibm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Alim Akhtar <alim.akhtar@samsung.com>, Dmitry Osipenko <digetx@gmail.com>, Steven Price <steven.price@arm.com>, Will Deacon <will@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Samuel Holland <samuel@sholland.org>, Chunyan Zhang <zhang.lyra@gmail.com>, Joerg Roedel <joro@8bytes.org>, Russell King <linux@armlinux.org.uk>, Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org, iommu@lists.linux.dev, Andy Gross <agross@kernel.org>, Nicolin Chen <nicolinc@nvidia.com>, Yong Wu <yong.wu@mediatek.com>, Orson Zhai <orsonzhai@gmail.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Thierry Reding <treding@nvidia.com>, linux-sunxi@lists.linux.dev, Rob Clark <robdclark@gmail.com>, Kevin Tian <
 kevin.tian@intel.com>, Niklas Schnelle <schnelle@linux.ibm.com>, linux-arm-msm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Krishna Reddy <vdumpa@nvidia.com>, linux-mediatek@lists.infradead.org, Baolin Wang <baolin.wang@linux.alibaba.com>, linux-tegra@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linuxppc-dev@lists.ozlabs.org, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 01, 2023 at 08:47:28PM +0100, Robin Murphy wrote:
> > diff --git a/drivers/iommu/fsl_pamu_domain.c b/drivers/iommu/fsl_pamu_domain.c
> > index ca4f5ebf028783..8d5d6a3acf9dfd 100644
> > --- a/drivers/iommu/fsl_pamu_domain.c
> > +++ b/drivers/iommu/fsl_pamu_domain.c
> > @@ -192,13 +192,10 @@ static void fsl_pamu_domain_free(struct iommu_domain *domain)
> >   	kmem_cache_free(fsl_pamu_domain_cache, dma_domain);
> >   }
> > -static struct iommu_domain *fsl_pamu_domain_alloc(unsigned type)
> > +static struct iommu_domain *fsl_pamu_domain_alloc_paging(struct device *dev)
> 
> This isn't a paging domain - it doesn't support map/unmap, and AFAICT all it
> has ever been intended to do is "isolate" accesses to within an aperture
> which is never set to anything less than the entire physical address space
> :/
> 
> I hate to imagine what the VFIO userspace applications looked
> like...

After looking at this some more I don't think there is any VFIO
userspace..

There is a VFIO bus driver drivers/vfio/fsl-mc/ but from what I can
tell that is for the ARM version of this platform (from 2020, not
2014) and it doesn't use this driver.

So, really, the only thing this driver does is setup the identity
domain at boot and do something special for
drivers/soc/fsl/qbman/qman_portal.c :\

I wonder if we should just delete it, any chance the power systems
need the code to switch to identity at boot?

Michael do you have an opinion?

Jason
