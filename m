Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6344D372D61
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 17:54:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZPXY1pMdz30Fd
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 May 2021 01:54:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=uafKNoQf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=40.107.95.63;
 helo=nam02-dm3-obe.outbound.protection.outlook.com;
 envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=uafKNoQf; 
 dkim-atps=neutral
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2063.outbound.protection.outlook.com [40.107.95.63])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZPX259JKz2xMw
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 May 2021 01:53:35 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RpSLLCCttapERRxue9VMJ2EURH3ITNrdDjQiWp1x/S+nPPX4VeIIkyVNQauj/XoXbGw1Iq8D4JHG2lHGsmbMCr9spxebLr6Ltu69+EUK+moVTY3Q7DN1GGSk7+mA8rsPvLFgHCm3XJ3ZTmMiYOuo8Whgt6jsM4kPTlKBMFyQTQ41NjGRTTs/H2xRoSveA6DKURQ0UcKeM3EljFJPrvE4Br+xhcx89AoCe+3YSUFPUtLr8j/rlU647AqE8O07Io+96q7tTGC/JhRdB2hA+ssRsDUPyxzc7mm1AhClkO62zDKkYAwqCucge1Xj7vZSk9lVMszUllaENKNjsqd6blVTPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9fk7vSHH76rCwRJ/dvveQNZmwI29ddZ/htCxCI1e734=;
 b=PueQIbwLJJ2IzsdO2a0sbaPUQEg/eORwUqtbfa7bAfKPf31NHVTihEGRvj8Xnmd57vg0RhIwpFyTU/nAAsxl1zFkgsNzg73z2LzdDmoQiXHrfVl2RM7bzvCe85uVpEhDVv48v8Ut35JeMYawg65P9DxPSIjW7ojLfuH5nZ5WGVVyOi8nLv1vu0p0vdNi3vc+0URY6gtZM1CJNlrAiaeQ9Pe0Eahn7NcCBOMtGPxh/ea5FGHjXHmQAyhCyH/23HhNN5arItM6MljKiAZCIIFXha/GJ8JVY6j8Ba3LtpQkUK/rRyLp+IVEDw+k67bQJNEg+ad84kh56Qabd/Gi7DQTtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9fk7vSHH76rCwRJ/dvveQNZmwI29ddZ/htCxCI1e734=;
 b=uafKNoQfDhUwIC1aPK/LHrYNrr0jDr/RoagpbKTShou75zgF3v/XLHTYC+tLYhjaFtkbJ+94HdHCpd7OBKa7BuW2oHTtBxmN0Mfo1Qz7jz80qWZMMuc1BOma6wkk6OjAGPe7M93+ql7/ZC9eCwkSgyI1slO5tRwSedv/53hVNNyGUfOlDVQnIutu8kQzNRCdMiMV5/NHRsGYQuBj4r3NKGkcGMGA+91WM6pjQqo0KHRGyrACIsZUztKn2O73RsVt6TN3KUj5PMaUEMCe4AaJwjAixCYGkS79eLpjU3zZjNWbIcSC+lnqccOwJMCOHL4KVzvRtirLlp+zjQ0d8sQVvg==
Authentication-Results: kaod.org; dkim=none (message not signed)
 header.d=none;kaod.org; dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB3827.namprd12.prod.outlook.com (2603:10b6:a03:1ab::16)
 by BYAPR12MB2902.namprd12.prod.outlook.com (2603:10b6:a03:12f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.41; Tue, 4 May
 2021 15:53:29 +0000
Received: from BY5PR12MB3827.namprd12.prod.outlook.com
 ([fe80::81ef:d824:43ae:aef5]) by BY5PR12MB3827.namprd12.prod.outlook.com
 ([fe80::81ef:d824:43ae:aef5%4]) with mapi id 15.20.4087.044; Tue, 4 May 2021
 15:53:29 +0000
Date: Tue, 4 May 2021 12:53:27 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Greg Kurz <groug@kaod.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Christoph Hellwig <hch@lst.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Alex Williamson <alex.williamson@redhat.com>, kvm@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Paul Mackerras <paulus@samba.org>,
 linux-api@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Subject: Re: remove the nvlink2 pci_vfio subdriver v2
Message-ID: <20210504155327.GA94750@nvidia.com>
References: <20210326061311.1497642-1-hch@lst.de>
 <20210504142236.76994047@bahia.lan> <YJFFG1tSP0dUCxcX@kroah.com>
 <20210504152034.18e41ec3@bahia.lan>
 <YJFY7NjEBtCSlJHw@phenom.ffwll.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YJFY7NjEBtCSlJHw@phenom.ffwll.local>
X-Originating-IP: [47.55.113.94]
X-ClientProxiedBy: BL1PR13CA0202.namprd13.prod.outlook.com
 (2603:10b6:208:2be::27) To BY5PR12MB3827.namprd12.prod.outlook.com
 (2603:10b6:a03:1ab::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (47.55.113.94) by
 BL1PR13CA0202.namprd13.prod.outlook.com (2603:10b6:208:2be::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.8 via Frontend
 Transport; Tue, 4 May 2021 15:53:28 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1ldxMV-000QaC-2L; Tue, 04 May 2021 12:53:27 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 690aaf03-92dd-4e81-f1e5-08d90f14c294
X-MS-TrafficTypeDiagnostic: BYAPR12MB2902:
X-Microsoft-Antispam-PRVS: <BYAPR12MB2902250DC07AB2848DE5A2D5C25A9@BYAPR12MB2902.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yhtRYdliGrikzJDXHFlkvW/Ivx07rePzDou9hJVVmWT41FeSTzweZsBFukYbSBQ0DI7XBkQmXuFkVGmS043Iy4TbgEISo0ORgAQe+q3LyjYHra5noGVrynvEWy+P2SI9xOeLHvC3xjIetEtMeSc9QxMhyUVmQSoLi6Ese5BK8k26mXxyHsObSL5i2YoW7h5BuhBuffzWQzCLXPtNQT9BnhBP01gO6GWCrNxxA8P/d9JuRUlOA8lATDiyFnjBRmORj6YUEnqjL/nLMHOAI28FKxuvnIbxSZ3t1PndZ2RGrA333+O8dOfinrJGbFUNVUptgSsRI1q6HlY7Psx+s3tNbV8CuqookIyf5HDgpo4ctjaF5eSwDHE0ckMwJN51SpzEsAOmi8OSwlyUMxXGuXhZ8NO9LA0qSi5VU6YtL6aVZiROJmANoMPuu4iW0kC/EtXQXUypWxTGwF61l1LShhjtWuClzy9MU4faCHkLV+q7PxngPR99xr1Ua/gB52S86q4Gu1VVPXqEqTKQK3UY/Ey/+eMI4fY+0eezpkMoP+DiiaMOIcSWX1edkkTlf/HWDki4lf0hv5pkQRnbcC3vfqiabO+zt6FR4SySC6Ltsujewl7IMwm7+a2Ai5bFUsLyCftPj9gtDT93pD/de/Qa5PLqcw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB3827.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(366004)(376002)(396003)(136003)(186003)(5660300002)(9786002)(316002)(26005)(921005)(9746002)(8936002)(7416002)(426003)(38100700002)(86362001)(36756003)(1076003)(2616005)(83380400001)(478600001)(2906002)(66556008)(66946007)(8676002)(33656002)(110136005)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?hJIT1eMQQ1VtxmcUhDOLrmaTtzO1A46C1nUWXmxA5JeL7wZBvLLh+cG+82Ex?=
 =?us-ascii?Q?0SXZYrgRXDS33cft2NglMlsTLk7fZZ8R43ox4WIBGOksI+MMk8VZ3vjSlkN2?=
 =?us-ascii?Q?mlyqC2kruSPYRzW1sXNL7F8GzWKr/IC/UWOz7QuvUcAS0HjnYmUnoPak3/Gn?=
 =?us-ascii?Q?6GagQUhEjVAEa84R7+FCA9tAU5ls3hapu/knAJOA7p2J2KSfqcxuMX3ptlwW?=
 =?us-ascii?Q?UXB+ZSe7nFdCyosBEGPnmezypkZ0Uxwkql/fKtQM3tJC93q0OxZCQraa9liT?=
 =?us-ascii?Q?jaQpJWuC1vWjJBRVLVG6rED7sm0Tof7kBfu61XtSGX10e+sttTGdfmsHCsTx?=
 =?us-ascii?Q?qQKuzRFCia3yx3wSu7er+iYMyutz0Kc2u2NyxR0cq7STR7s6HjZ6i0++HFz1?=
 =?us-ascii?Q?Ob1WLUgrMijv6soLZfAQrhahM7608wUpC7Y9rUnDZMWFsXIcVq+i6tsoVhiK?=
 =?us-ascii?Q?WXY2BAvRZUNEgcfSJzoTC78Z7q9XyUX6r8jw3qMFeOUTEe7rdY4oXyXMzbMT?=
 =?us-ascii?Q?ndHMSoqfpQ5Q2FeR2kJiDAVtNZ0B1gsKZ7ReTKfnxU58pWkA2DVxC3WNFxhy?=
 =?us-ascii?Q?rG0yn8FOxUhbeV/1rt0+lH4GJ7vI1FUorLr/a5eLNZh61EUOlF/3qEeOgWSb?=
 =?us-ascii?Q?rRRJ2+IgEN9UjZLB9JbCvJVFEwHrf89XQV/C5lexGW4CB8k3We+pz31GtSeH?=
 =?us-ascii?Q?lg6jzVIQ7RNBx+qg2Q1v57DQNIvpZ8dwGnuJWozVn+1pOSdy3r3ry5yqyU+P?=
 =?us-ascii?Q?gFc8nuVlYfoZIQc/vDpywMjuYVHAiCDNZpgqVGZavm4x8xTJgzxDLnyhuQxk?=
 =?us-ascii?Q?6o1CunrN1UzUe1IMPsBg2sWA843q11MVSlYP6jpmW5THfw8e+seydSVgCztd?=
 =?us-ascii?Q?pGnMmrbdBLy+0uY9NHkjN0MHv6XwBoT0JsD/VYErFCL0Nu9j22An6d1u+lfb?=
 =?us-ascii?Q?Wz4zGPjt+cPTeId71LBPm5e9owVgfGhbD2inv4dB/WEVBjUJfPsZD+uE23C5?=
 =?us-ascii?Q?7+bjZkWjeuBSVwD9hMEEDc6/E/+3rV1kQyvIYdlSk9JWceZzsdYf3ceepmG1?=
 =?us-ascii?Q?ZJ/TeNnhFu0Cq31R0AK6NuHu4CLBWAYjmRTsikW963yrWCx1EUzGsFnhCM/e?=
 =?us-ascii?Q?me8mgr6LCarPw4XRUri1N7iT+gmh0oO0qp2DFYXkdoESaqPiJT+2NXbOqHY8?=
 =?us-ascii?Q?yG4ma6Gja1rgXYZF/IoQixhEYSN4PVVtB3yr2DjUX6RXJwOpKYhjkc0B5Z1F?=
 =?us-ascii?Q?lT7B0H0lDZ8TvX72EVAxF4RoikqwJ2prncPsMIXMVbyQSWFFMeBuOVgYo3Ve?=
 =?us-ascii?Q?SpKB5QZuQLu+eiPxtoLd4GCS?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 690aaf03-92dd-4e81-f1e5-08d90f14c294
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB3827.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2021 15:53:29.1007 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Q6wZfryuVkoYYO6BQJhlFugkryk3hUvlGTHxvfhlE6/dJyvBuNIFUM8r9FS2f1K
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2902
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 04, 2021 at 04:23:40PM +0200, Daniel Vetter wrote:

> Just my 2cents from drm (where we deprecate old gunk uapi quite often):
> Imo it's best to keep the uapi headers as-is, but exchange the
> documentation with a big "this is removed, never use again" warning:

We in RDMA have been doing the opposite, the uapi headers are supposed
to reflect the current kernel. This helps make the kernel
understandable.

When userspace needs backwards compat to ABI that the current kernel
doesn't support then userspace has distinct copies of that information
in some compat location. It has happened a few times over the last 15
years.

We keep full copies of the current kernel headers in the userspace
source tree, when the kernel headers change in a compile incompatible
way we fix everything while updating to the new kernel headers.

> - it's good to know which uapi numbers (like parameter extensions or
>   whatever they are in this case) are defacto reserved, because there are
>   binaries (qemu in this) that have code acting on them out there.

Numbers and things get marked reserved or the like

> Anyway feel free to ignore since this might be different than drivers/gpu.

AFAIK drives/gpu has a lot wider userspace, rdma manages this OK
because we only have one library package that provides the user/kernel
interface.
 
Jason
