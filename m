Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2487AD71F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Sep 2023 13:43:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Zo4jiR3G;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RvLbW05Lqz3cms
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Sep 2023 21:43:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Zo4jiR3G;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7eab::622; helo=nam11-co1-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on20622.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eab::622])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RvLZS15rwz3cmH
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Sep 2023 21:42:05 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A4jHDevfeONZ8dOfM84zQR3RrFSoruPZM5xrKHYzA60G1KP3M3ldPkAA7eYsy7RonMeLrYCnEneB9C6avEvMZgU3UMO3VTOB3kuN3YzoA+i//i1aQ/wcRlWWk5rQC+ob6ymDSFvG67s34ZUzlWwHNw+WlSQZtDGQl/2H8/RXZlikiIuQcpD5W5jN/cg4UPZrsJ6rApQiKOBsOtuTEAzAjbs9fxkjYStFgZU/P+KqCVPYcn/mGcNiOZKQ4sNpPPTNInQyrzsoSe+JF84+TPlpDro17qtecZX8a3PSNH/XgN/k7nDPsvGEj+yqovM+77VwDvx61ta3+a6U3WdCVIWx5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FAWWGBvaKqUouRbkKajgoHVy69zRAixjUVwPCCiQk8k=;
 b=OHhVFNXERFaFOcI8ZoI9igEugqC5V9nYZAIFT2HujI7jxmS1epATJQMdj8jvdrFaDBk02xmcDVWkGP2q29PfMdDNYvXxg5UGLnvlAxq7exnVxzCHArQqA84eDg0HWOl75/rielluVsxjoc3rdmhcZBb6i4Q6/3KKxaPSu/4m9bXYkt8+dVn/uhtjTfeg9DEyr8JvVnJ12dH+iepi61m+fK/eX/P/ruqHI6kSw8uYlmI32nRJAaaMGmiOaKpWdJCuFzTZ/uChVMGt/Q5QWKo02OEhGWK4lN2fDMP8WxHmbV6GCdHR9e3SU2MupSzKw9HFbqCnjaBPr6pF16ikwi7Nyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FAWWGBvaKqUouRbkKajgoHVy69zRAixjUVwPCCiQk8k=;
 b=Zo4jiR3Gani0YSTBE7bwgdhPYYdQufaL+D6NuHS2mEksMma6Dx4DQFD3ahq4gL+llL/BCye0N0snS6B9k4/2ZvzWgwMKKHB4UEYLKkknj0wWq6lnvx0Fdd1YTcD7mJBdA3g824/DudjjzyWH/x/oWjPNvjIThKpqvOzFZQsxRXAcZqtGo/PAXsHxP0JBC8M7I9zJphjqrS0wQlgQ9WDI6zqmGRz43IoahFh40WAnekoKHvuPCs+j18P065b4jcwdmBEB56nGA5LB1BXUP5u+qWggsVcqR0yWgi26NkgO3W4MY7LUFRF8/AWJLQr8iBz8s5XlaVAF0hB/+8KwDSGq4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by BN9PR12MB5354.namprd12.prod.outlook.com (2603:10b6:408:103::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.21; Mon, 25 Sep
 2023 11:41:44 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::faf:4cd0:ae27:1073]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::faf:4cd0:ae27:1073%6]) with mapi id 15.20.6792.026; Mon, 25 Sep 2023
 11:41:44 +0000
Date: Mon, 25 Sep 2023 08:41:42 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Baolu Lu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH 3/8] iommu/vt-d: Use ops->blocked_domain
Message-ID: <20230925114142.GU13733@nvidia.com>
References: <3-v1-8060f06462cc+c0a39-dart_paging_jgg@nvidia.com>
 <ad9644a2-e8a6-d0fa-ad55-f4e0564c39a0@linux.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad9644a2-e8a6-d0fa-ad55-f4e0564c39a0@linux.intel.com>
X-ClientProxiedBy: MN2PR19CA0028.namprd19.prod.outlook.com
 (2603:10b6:208:178::41) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|BN9PR12MB5354:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c3767a9-3947-409d-1681-08dbbdbc6491
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	HOoZwpCUSZRZu9Eg9Qtmzltec8LrnTZEerpnrRuJlCEfnAPr3vTE4ovdxvsAfqffslGgKMU4WgdDU+VJB7nCverrtWeorrXWztvLBP4TDn2n7MXD/5/sYFDvv4Qlr9qvaKiyu+F1XSCuVrEX6foZrCJPtMQMCqgnlyeL7+/ZF7X9uMaLhBx8VlqVcC5YFt/fsml62Xb0Jj3WCcBmfNR9oTLfGVqy3ORzT6z9PYDpNCiYxkRpz0Dwzfhax6yN36YOXLa7nWE/eQ4zcXhTSHDBBJPDerceoh1rcgvVol+5J66Ay2FE2nZkq4FFizCeSFSGR2I6FOK+TDGBCFLf1qSbeS9TQpK7NmBv+55AmuuLt0YpIyXHaoFGePpMc82t0MM5PKn/ur1jK11cVbsHODa7GtndBtzZO4TmY7R7DQl4Qfu7crgqvgu54Hd/HVXBZga2oJSvLODsiMqaxF2qnZVtviy0UJ7LPEzzLsrZo5BiMh7XOa1xCe6HC3jjelksEp1IyYJTqvcfnsUnU0YD7v7e3PTV8V20AX8pyJYQGdjUvHYEXWXLWzxe1spd9FCOW0LF
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(376002)(366004)(396003)(39860400002)(230922051799003)(186009)(1800799009)(451199024)(38100700002)(33656002)(86362001)(36756003)(8936002)(6486002)(8676002)(2906002)(5660300002)(4326008)(6506007)(66946007)(4744005)(66476007)(2616005)(6512007)(83380400001)(478600001)(54906003)(66556008)(1076003)(15650500001)(26005)(316002)(6916009)(53546011)(41300700001)(7416002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?3lkeN8gD3/RXGx4Cx60ugfnkkleX8G8LApTbd4F577yryOdYJ6ucVRd54ddP?=
 =?us-ascii?Q?eS7YesViJeR0tzVuCFHUZYH2YGgUu46X2jNkgKs8vC+pNDdeYFz2AmJjUMcO?=
 =?us-ascii?Q?xMNB8nuRCDlxAuCvUrsoBHdH2efvGWTm1EvSNIujojwxYFkQjIQq08Kav1Ei?=
 =?us-ascii?Q?FVArkr5uHOrbIhL0olLpai2dPKOo93tBCYjeUf6HhtFA+6cB0Sgis17p92kI?=
 =?us-ascii?Q?nG/bnW2nY7ssPOk7Ub+/qKDfqPzWL6mMXhITQD2sqZbOWtih+dmj87Jv8aZq?=
 =?us-ascii?Q?0aK7zd/smpFYXV0zki4eNkgHKWfCyRXMw5drCzJfTuMgxLA+tLjCAZ/DeK1I?=
 =?us-ascii?Q?vvm6xJcn4W1z1SB50SUq4GmNbNrdw9WHJurpUHQGwFi5GFbEL0//dMOcALpi?=
 =?us-ascii?Q?oYf2FjEa+guJs3SwS4K+pDxMibqS1+rQdeF1uy2fl98T+9Ry6TzoitSjXzdz?=
 =?us-ascii?Q?ywz/Mm7vpKsgVwzUx9eladyV+8vZbC9DdAjHsXfQbpnpClWJyHEBRn7f1Pi3?=
 =?us-ascii?Q?bjwBixI+61+xeLADpH+R78jouJVRFGR+CnFe3NKTLcN6LFibH9nWeC0FeTml?=
 =?us-ascii?Q?Gr2QzIa66El63JP4ySevoy9ZoZHcWoXiHPrxqksmX2o1juaeDhv7Hxv1WLqR?=
 =?us-ascii?Q?hv/9wMyTDMGWgenH0/B//EL6dLuKIv5X2ftF0axPTCCjD5R2trB9cedIA6r8?=
 =?us-ascii?Q?nHW7yX314IwCY6cuaz6JSrtUEeS62dO4lqq9x/r7StBjmjBqMfLAkSWmHBX3?=
 =?us-ascii?Q?zyOQzF+dimCu8KIobEVjwu+SYcst4Cz69zFgk018UIBhff6gr92vVU3Fl51+?=
 =?us-ascii?Q?mSC1RHHv7/2GOx4eVZSnKjqczvBqTuk+ElxxJ4fzNB1hSRKgJgCjXJL+LLai?=
 =?us-ascii?Q?iti/8SxYnGX4/bUoqqNzNU4046/hjVtrX7G7Uc2ewhwEDXalJUZttBxzmRbP?=
 =?us-ascii?Q?bEOILexaYxRtHzIy0ijBHmWxw06KPPklfjrNVOydwuvVbzKtOIUbs+bUZibY?=
 =?us-ascii?Q?cmjP819ihSOE1H5VYlpq1K4LkvjYPbpcl3UPsrwGbwGvbpnIZxA5VzdPdvbQ?=
 =?us-ascii?Q?98AW1NJEWS8TBoA3WvICa9hZ6AX1lvXZG9gWu2WbOUTeccM5QfsD0HMbCpSk?=
 =?us-ascii?Q?2d4x6GN3p72JHxtiWS/bcuMIxhhBZJbkg5fpf1CElrEVozM6ACju7rFWghJp?=
 =?us-ascii?Q?B242gsdmclutqxHpB3UJdu/oVOEWVCZVt8fsbMiW4kjX6W+obVADv3nAb5ES?=
 =?us-ascii?Q?ohQsnvxpuxL/tMpC6KnML8rqa+q6JLKVW60tJU4rB2eOuv+T9DrkkYAhzDp0?=
 =?us-ascii?Q?viJ6kcAHyzAYatPUoeqJMgbluuYPAt6IG6JIZ1mNQRIqrhyetO7sqtdR5NcB?=
 =?us-ascii?Q?rJTyI03hy1ci7M9g/YXtfVFvkg5qqS6b9+x1bnew41pLCshUYdis4IoKrP+M?=
 =?us-ascii?Q?HPEvhX1jwT0k0V5b3VwpsUM/rSq+ITjVQX6+KYPSdkvOR9+K3pXfnFAIrpoQ?=
 =?us-ascii?Q?ftyp9yIunZDcdYvNNiHEnDes2vlfDrMUFIEqR6NmlHS66itoq3NxbkVUqoAY?=
 =?us-ascii?Q?3sBWB3VRyHayaw928Sk=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c3767a9-3947-409d-1681-08dbbdbc6491
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 11:41:44.3287
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DTMxeE49Lb7yqGx6jfn5+R9ogGYHoCIeuBgUmQ312r1dOOvhQeGpB8z46Nw7WDPL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5354
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
Cc: linux-arm-kernel@lists.infradead.org, Kevin Tian <kevin.tian@intel.com>, Will Deacon <will@kernel.org>, Sven Peter <sven@svenpeter.dev>, linuxppc-dev@lists.ozlabs.org, Joerg Roedel <joro@8bytes.org>, Hector Martin <marcan@marcan.st>, Nicholas Piggin <npiggin@gmail.com>, Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev, asahi@lists.linux.dev, David Woodhouse <dwmw2@infradead.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Sep 25, 2023 at 10:29:52AM +0800, Baolu Lu wrote:
> On 9/23/23 1:07 AM, Jason Gunthorpe wrote:
> > Trivially migrate to the ops->blocked_domain for the existing global
> > static.
> > 
> > Signed-off-by: Jason Gunthorpe<jgg@nvidia.com>
> > ---
> >   drivers/iommu/intel/iommu.c | 3 +--
> >   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
> 
> P.S. We can further do the same thing to the identity domain. I will
> clean it up after all patches are landed.

I looked at that, and it is not trivial..

Both the Intel and virtio-iommu drivers create an "identity" domain
out of a paging domain and pass that off as a true "identity"
domain. So neither can set the global static since the determination
is at runtime..

What I was thinking about doing is consolidating that code so that the
core logic is the thing turning a paging domain into an identity
domain.

Jason
