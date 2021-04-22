Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0053681EE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Apr 2021 15:53:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQzQN63xQz30Bq
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Apr 2021 23:53:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Ccm9D0JH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=40.107.236.48;
 helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=Ccm9D0JH; 
 dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2048.outbound.protection.outlook.com [40.107.236.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQzPv2w2Qz2xfh
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Apr 2021 23:52:33 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NWQudN9NB3FcP7uCtOQ4/Kuro7T0AllO96QpW7lVkWxyaOzHNgt8q/KLxVedle5lGOCd5DH0AujBQZL8j7D2cC39cEtIitb8kC/t+r1GDHVWBueu3nbD1b9AgwgfevOy5JW7sX66+kFUDow6gsMEf7N9bglDQ+u58d5no7l7hR8liR+mxxSxO6vj6Y2tkZH2Yb1T0AvvKPTt+hvL2SpCWjAHInZfYwKKnEfTQb+rxACpT1IxossQGji5PLgSLfQTXU0YGhiI5gwFz+snmZH24JEiN2P8lEncAkaAsyLbVTO/ptHg2ADbUNQr28VngwnegfCWYL7E0W6r9x6ez+/Spg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d/T9DpKdTjd9YTNZtoxKZZjXCzJb4K425xTc2wL0hNg=;
 b=K5nZQnmasTJrAyLc1KU51zcfyAQ938joRFR8xslsxCsnvhFUBOzWXG/iRGStJRNNR4pEROAZBKQZic43+Wl3kPiEj+dqpmbksRU6cdzyqKH+k8A8bntW8GyZbSXarkwjifJDbK/wm9XY6FDAEPtcMACD7NnLoNDKk5VyNct0Zpdg7MjH0gMkOruSknTnuDJiInwFBNK0PmI2Z2LLwuRk3m1hblyH5NBiA8glRNkhbgPVKv17/YL0bKj1b7in5P9htYndzdPSvZ2Q2f77FnN3f/T7KenMp/1cP6B+wTVjHIGCfKoQNd28B+6Xb6/aZL3t1mi10ooRhZizYKE4RrJKZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d/T9DpKdTjd9YTNZtoxKZZjXCzJb4K425xTc2wL0hNg=;
 b=Ccm9D0JH4VzHG8p+FKCBC0x/jhJZY3XCqsCb8vwTL3jU6knK9Fw80hZomGzCLjxlA2YpP+1/xxzTM6ack6ENpUiL+Gy2AuEEW8ew7aLUYG7/oh9NIvaDjTUBV8MJ33JeLO2isd6Kn6ffRxpbBqiKLMTM3RshjpIDQLUJQFFAMpuBfW0qo0WQKU6oOhbc7Qw75LjuWwOxUxoqAqM49rwi9MtlCu6MS3NLTRfJorqzlFY/ha4IVm6ZY8sW5wZWp4PhzFi748XNZP6FV/pQWOQhBj5NjADkYKF2Y56k1kgcCdWoFcrwy5XK8ncqyuzhQBqOLLFeRgu6ZxAti0ky+YvOXg==
Authentication-Results: ellerman.id.au; dkim=none (message not signed)
 header.d=none;ellerman.id.au; dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM6PR12MB4299.namprd12.prod.outlook.com (2603:10b6:5:223::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Thu, 22 Apr
 2021 13:52:26 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87%6]) with mapi id 15.20.4065.023; Thu, 22 Apr 2021
 13:52:26 +0000
Date: Thu, 22 Apr 2021 10:52:25 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 1/2] vfio/pci: remove vfio_pci_nvlink2
Message-ID: <20210422135225.GY1370958@nvidia.com>
References: <20210326061311.1497642-1-hch@lst.de>
 <20210326061311.1497642-2-hch@lst.de>
 <20210406133805.715120bd@omen> <87y2dndelm.fsf@mpe.ellerman.id.au>
 <20210412082304.5e7c0a80@omen> <87h7jybf9w.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h7jybf9w.fsf@mpe.ellerman.id.au>
X-Originating-IP: [47.55.113.94]
X-ClientProxiedBy: BL1PR13CA0284.namprd13.prod.outlook.com
 (2603:10b6:208:2bc::19) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (47.55.113.94) by
 BL1PR13CA0284.namprd13.prod.outlook.com (2603:10b6:208:2bc::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.17 via Frontend
 Transport; Thu, 22 Apr 2021 13:52:26 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1lZZkn-00A2Ni-1h; Thu, 22 Apr 2021 10:52:25 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fcfa0a31-7711-4f94-308f-08d90595dcc9
X-MS-TrafficTypeDiagnostic: DM6PR12MB4299:
X-Microsoft-Antispam-PRVS: <DM6PR12MB42991DC94BFA7ED2F298BB5CC2469@DM6PR12MB4299.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g2jowWGXJ21/UrrtNxlj6HDbGJkbu3ECiU7iTOsPAKj6gQhPRpdh46jfuEp2EEJaiJZ8Ob58QVCrX4vaDoJC1qgqWbXqn19aAHUSSsHDkbth7AOYUZ2WQb8Q+voo6xbEALYHbxXU/NNNLG7+JBTF6U6iLZGZx+glfh/8/4c0kBg2yJAj9h656qmvZp7WlxmtPKcyFOmIbE/zjQXy6XKud3jY6nTRWUzl/BEkgSm/+Viy/S1fuYmxYbcnEU9dh0W5bv6ZZbgRyar+zvrTQWjfPjJzglaY2rQfa116y6quWCdMg2xRn5+THbN3mOjCjjxH7sg/XTVBiI4q+NWcqdU6dNi/CDxfffC0FHaBK91XA4eA7o48KNwvDddAZ/IMz3RF4TfUWNGK+nw+EJuPqSXnxIirD1tKAY+uO7Z7Dz6zWZZteFTdVRnuiHLtt/mYMornBXicWVThdV2GBix+RJ8mlHctH2qLbgTYezPO4hTq41+oZKhRFPRyXYC0IACsZxK/w+gvd0QWK4n5f7JO9/bB7CMKOSSJneLUJjwKTc1aYJeDWE7XI1yLs0YjnbjAK4vlLL/YCN8xFiP5RqgrxFdn7n6WZznH0LETrVp90CSeqD3DpX+t3VLkkNC3dfyMpkBGsgTZuGiu036GHnx0LJqYL/n/hGjQUrwDvv3365L9/C5Ck/ElP0KfnyJhKy0RtmYD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3834.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(136003)(346002)(366004)(396003)(66946007)(66556008)(966005)(1076003)(38100700002)(54906003)(66476007)(83380400001)(426003)(186003)(8936002)(7416002)(8676002)(4326008)(2616005)(33656002)(316002)(26005)(5660300002)(6916009)(86362001)(478600001)(36756003)(9746002)(9786002)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?MEfPBHhKO20gGRbwpNT4z2loyQrefFn/XDtC20qMlPlgvKTI8aV8sY20jWoR?=
 =?us-ascii?Q?FTOIV9T6orA8uNfGrIg4jpsKg2QHodK2Ps/hKVb1QhOpjXrpFM+nRSZmlD3k?=
 =?us-ascii?Q?H6zOBGSoOnlQDFPNow37ogOHoYDg/KU/bsrU3AHpSHe69Ny6+nj9a8f5Pe++?=
 =?us-ascii?Q?dry3ndSJiuBdAUHFMzuYkpnlNktooUBkfics3z64Px+WX8EZak/3L9JJOmcQ?=
 =?us-ascii?Q?pIRojGf8Ycm1y4Jky4Kf6TqpZ+mkMQiZBgJUKqUh5thzOszDCf/1qZbYsLMA?=
 =?us-ascii?Q?PQRjDJmWO2WlBqC/cMP/E1KVDQvo2rWPhC0CCLvebkO3vNm4Pw3rOh75p2gP?=
 =?us-ascii?Q?yG+TGrccx0Ebxn8N+yjkbuZzFC9BDYXR3NSPmp6C39JThmqisYvN6HvvGdbe?=
 =?us-ascii?Q?BptIwuwrYlRCDnW1FgaO2Z9GDfKb/nRxd6SFaYuwle0k4Xh8BYpV5VGWK8UT?=
 =?us-ascii?Q?lCNUZqFOlhBFbezm/MFa1LOx0y4kjACNq3MZig87He9cq9sIeilOxhw8etKT?=
 =?us-ascii?Q?ekWq1qWKFLb3s5SzzKJ2v3oiAculKA4l5/Z+kD+bNdRG6advNcsZS2NyM+AF?=
 =?us-ascii?Q?hMfb0INEAOexQmf2M6Z0R/1WWF2UQTH1vT19fhiLnTUnwbd00QgzK67qHGog?=
 =?us-ascii?Q?p+qNMXt2x1K+Vap+GosBtRF5WlHI6sJdmvqLCs+w+ShprvUVs6hVkoz69yJV?=
 =?us-ascii?Q?hOpAsC+GGICShG7ay/DjpTzgtvROSwQ/efYNhp5phzWuCRXug3B4l+hmwZ/h?=
 =?us-ascii?Q?jxvZ9qYC1vZ/Kuv5HHKECTExrVauK7GofimM9XL1E6vsRHbFqeBHRoZhghLz?=
 =?us-ascii?Q?hOGK8ASYWWq9AgipLv9TY51tEWGiR4bqdxyyrKnL1vY8eum9+b7T7lqmyZpJ?=
 =?us-ascii?Q?eScEqTndqmdpgwJVEu58NRXq4Y1uQMR/+hMdPhkvvOcM+kf09EgecY1jBO7j?=
 =?us-ascii?Q?ytmd2K74NlVyiu/E2oqbTdr5xmWMzl2GTju4aoCt2QLbkT+gCo4QOjzQENXy?=
 =?us-ascii?Q?VjfuJn1dm/v6p6VcX6fDdPfl56LYVpCvbCKnWt7XlC3KMl7T4kDTDULYihsz?=
 =?us-ascii?Q?/NQeNCsUFeNBmLsulk1qNJflTroD4644hZezgHovXdiWBqM03dB3NGhyMR0o?=
 =?us-ascii?Q?jxca5J1ntnmFkf3s2Kt6EeHhv0IBmju7HBcRmsMjZNneI1Iag1RbnaKbqjQH?=
 =?us-ascii?Q?xXwnQ/o9ZWudYwl3KeuTTKT/6vJ6Dc6FfAdLbhIvAhglnz7EgEo5eZWr8rj1?=
 =?us-ascii?Q?UkJvOLadlgX6rfBJwRLvKbZ2YBchd1FK7Zmqgc760Y7hDgwhbETt8lmdkHKc?=
 =?us-ascii?Q?z49AaSLJtGqZGaRTHIuLGrwv?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcfa0a31-7711-4f94-308f-08d90595dcc9
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3834.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2021 13:52:26.3573 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9WPo9pPtxxsN0N6G/XVu7RO07E3auqp9hxic3aAA8sZPXzdLCcMUysnLaM8lOhgo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4299
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
Cc: kvm@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Alex Williamson <alex.williamson@redhat.com>,
 Paul Mackerras <paulus@samba.org>, Daniel Vetter <daniel@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-api@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 22, 2021 at 11:49:31PM +1000, Michael Ellerman wrote:
> Alex Williamson <alex.williamson@redhat.com> writes:
> > On Mon, 12 Apr 2021 19:41:41 +1000
> > Michael Ellerman <mpe@ellerman.id.au> wrote:
> >
> >> Alex Williamson <alex.williamson@redhat.com> writes:
> >> > On Fri, 26 Mar 2021 07:13:10 +0100
> >> > Christoph Hellwig <hch@lst.de> wrote:
> >> >  
> >> >> This driver never had any open userspace (which for VFIO would include
> >> >> VM kernel drivers) that use it, and thus should never have been added
> >> >> by our normal userspace ABI rules.
> >> >> 
> >> >> Signed-off-by: Christoph Hellwig <hch@lst.de>
> >> >> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> >> >>  drivers/vfio/pci/Kconfig            |   6 -
> >> >>  drivers/vfio/pci/Makefile           |   1 -
> >> >>  drivers/vfio/pci/vfio_pci.c         |  18 -
> >> >>  drivers/vfio/pci/vfio_pci_nvlink2.c | 490 ----------------------------
> >> >>  drivers/vfio/pci/vfio_pci_private.h |  14 -
> >> >>  include/uapi/linux/vfio.h           |  38 +--
> >> >>  6 files changed, 4 insertions(+), 563 deletions(-)
> >> >>  delete mode 100644 drivers/vfio/pci/vfio_pci_nvlink2.c  
> >> >
> >> > Hearing no objections, applied to vfio next branch for v5.13.  Thanks,  
> >> 
> >> Looks like you only took patch 1?
> >> 
> >> I can't take patch 2 on its own, that would break the build.
> >> 
> >> Do you want to take both patches? There's currently no conflicts against
> >> my tree. It's possible one could appear before the v5.13 merge window,
> >> though it would probably just be something minor.
> >> 
> >> Or I could apply both patches to my tree, which means patch 1 would
> >> appear as two commits in the git history, but that's not a big deal.
> >
> > I've already got a conflict in my next branch with patch 1, so it's
> > best to go through my tree.  Seems like a shared branch would be
> > easiest to allow you to merge and manage potential conflicts against
> > patch 2, I've pushed a branch here:
> >
> > https://github.com/awilliam/linux-vfio.git v5.13/vfio/nvlink
> 
> Thanks.
> 
> My next is based on rc2, so I won't pull that in directly, because I
> don't want to pull all of rc6 in with it.

Linus is fine if you merge in rc's for development reasons. He doesn't
like it when people just merge rc's without a purpose.

Merge rc7 to your tree then pull the nvlink topic is acceptable.

Or just do nothing because Alex will send it through his tree - this
extra co-ordination is really only necessary if there are conflicts.

Jason
