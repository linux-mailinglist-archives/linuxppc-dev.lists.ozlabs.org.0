Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5FC62C6B9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 18:47:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NC9VR4rZyz3cRW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 04:47:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=oyvXgBIn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7eae::601; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=oyvXgBIn;
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on20601.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eae::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NC9R42RPXz3dvc
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Nov 2022 04:44:30 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UnYs/apNvRNPLoA7100cnmcNXDyQC4/C0LtOIx/XLxCJgeCYxUXRjWLysoDiTkwIlbsDJZ/00cIgQrFkbC6pVs4/q6uDzksGgZu1lEZv2IMHlHOTulNZREAR868Vm6sVfPDbbLqCOe2vWhmHLcr6ti8nbhF1WoTq94NXHocSnEpJy9o6fTGwhW2RJzJWYk2USdyEGPH/1C5AayYVHyb1LhN0Rb7/6h8BZ+KV9zZ5sreUioJraalRZZdhX6lpw3szrgdYaMJiq8P0dC5fJFEiRnHQqLjF6edJm9ABq1sDc5QAENbMvl4ddFFUsh7DXtnLbIqENzeGohmKzyO0H0G8Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4cPwMfg0+hl4SoP6YepL6dPZ2Defx09A7q0p+ih4xm0=;
 b=DiLl6SWYUg9IWgFQg0MSG2W6m05JZWh2/89O5vItNKKSHgKF/m5mqshwyTQf4acQJFSnce23vFoSWzVSJA4yheFXiD75NqSJbxN/q4iQ0Dm4Hybw/7OVhOAtcVQNWfQpfx+HHsM6nHDaUCG8npBKCp6Nw1Dx74SuTYfzOUP/3sLTfxOqyxX3GPu8C2QYbptElnPnZ8o4UsLMdt3jwS8Wj7DRI07MnSrPtqu8z7Jw3EIlIOT+NbJWJGBHA4waQ2JFBhZT6a2yiPeAOcbx1CqIG6YUthxtnV1he8m2HghuYAJHxnGaf74dmaZvljhx91O8DJ29ycpVhz63qGKA5F6RVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4cPwMfg0+hl4SoP6YepL6dPZ2Defx09A7q0p+ih4xm0=;
 b=oyvXgBIn4KIElu5APNMgFyD61K+KzR3Rzi2ZBji7oq7TnUAeKSVlFKTPkUcCdpYE5OeUcqAlI26UUramVqogNknfUT85WtqCCbW/RQuq1gD1/nGZJW+9t6Pl5uiV3V3rdbzlzGsQQJJpZ34ll/BVYEeCIGwdqHuOD5Z9CoBKQ4o6L8Ms1GjRA+jfl5/F6ftuW/oay+Aq3krRoaLlDZN9uw8el2JrJrmxDQouMffX3Ez/jb4RdeY6WID2YIbz80pAzwaHIlDScplc8F4I/cqSjstYY3nd5zeYJk4GkJKf2WHoOVIOG0JkGQeQTQ+mbBNSk8MyoNJd2pW3pqRSgnNlMA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by DM4PR12MB6664.namprd12.prod.outlook.com (2603:10b6:8:bb::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Wed, 16 Nov
 2022 17:44:12 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f8b0:df13:5f8d:12a]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f8b0:df13:5f8d:12a%7]) with mapi id 15.20.5813.017; Wed, 16 Nov 2022
 17:44:12 +0000
Date: Wed, 16 Nov 2022 13:44:10 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch 06/39] genirq/msi: Add missing kernel doc to
 msi_next_desc()
Message-ID: <Y3UhaoVVU5Gb65W0@nvidia.com>
References: <20221111120501.026511281@linutronix.de>
 <20221111122013.947071142@linutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221111122013.947071142@linutronix.de>
X-ClientProxiedBy: MN2PR03CA0001.namprd03.prod.outlook.com
 (2603:10b6:208:23a::6) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|DM4PR12MB6664:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b9614af-9701-457b-2242-08dac7fa2bc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	lvTSGgxEwPBeZQJUHf03Q2gK1fgqvgBvDTXzofCizZq+nA9nby08AvNbBwKl1VSmgGsWEKfcpwI7jqTcP1bUo4TbGfVk6u17JROHn0q38CBBdsPkz20NEzqE/ioTNRC4nI/z0CheC6/EiRsP/AgsY6PF7mgPGe9XR/N5txfjnvWoah7vzcnXoKqM0TbYjsytWn8ENFJCZXlwRjqgZFoDpcom27n3hzGUvsIypRhcVrOq8arrJcy/cguoFLSm5gzHVHR+KjjY9RgWZyF2g4RGk/TAv3XzR3RyvrshLuvznYUuRydQqhgrpCvXUB1DgA/V4RBnOQskcxknoxDrhpvS183QY/VUAf7Gnogh5BTsxand2Edh2D7sCZCLeESNhThUeAoJLYzorZ5+4KvX7VCpBGkF2vt0wSovF6YpxCUoUtZ8eIYH++W5rJHzHv2hN+iVQkE1JuKPVKN4yMX6M0NzUZT7aH0ipNZYagDcWH6WaHVrgADbiEhv3ondwUk5SBXKExmip7vZsq51474ftngQqXdvY6r3Xhk2kb80I3dUc1pCY/vzFeMojNFzWdB3XaOUBqAku9R2VsFCPswzm9cI7Oc9XLgkf8VSej55b0SOdon8SUYGzsd5QgMfNpzNfOcMKZ94IJK5XSkG0MAZoRUwDEKkXg1NdRt2iq2fyGDdFj2n1RmrjI8YP6Y/difdVzsacftpmjwckh28Eff5XkF0gw==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(39860400002)(136003)(396003)(366004)(451199015)(36756003)(38100700002)(86362001)(2616005)(186003)(6506007)(2906002)(6512007)(26005)(7416002)(478600001)(41300700001)(54906003)(6486002)(8936002)(316002)(66556008)(5660300002)(558084003)(66946007)(4326008)(6916009)(66476007)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?yAUegWQUCb6d8oGyiiWwwIldDmLOrINh6IMNvLXewlKOmDmV2wJMyH/Ce6Fl?=
 =?us-ascii?Q?cU5IY7z8Ieje6x8fOOjKQLJw7S2R2++nt41gp/A9Dzefu68dh6MQ8jTjbFfx?=
 =?us-ascii?Q?M9B5WtsrtzmvMojIvluL8eRrTzup62+m2qNrBHdX5Fz9W2JDrCX9SWpk5b4X?=
 =?us-ascii?Q?sBewfc2UxtKSzSbJts07Jw0gejajjWYlLYetiSI7Uc4CeoP/ZWYixN09LwgC?=
 =?us-ascii?Q?H1v6WgLpB+cl4q/+GmCw2CKjn809NcTCO5Qq3eO8ogFyzy+b2qaTJWKTLol+?=
 =?us-ascii?Q?xBA1KNdvO1zfoUn1vqAYDgPsZcyu9LNqHPv1OvH9RC4mv+HUqQ85vyCGHCmt?=
 =?us-ascii?Q?9Cne5W02KhW8TmVu8AS/IMPR1TBuwIbpk3GuSGyplMl/JAXIfWndsp/XiXnY?=
 =?us-ascii?Q?g35TVnja2RmlMKrpb2Ye100cOVhqTPSlkqjhkQ5r1aNAg7bd5674Flx1NfIZ?=
 =?us-ascii?Q?W+sV8n+nYBsQHM6RKd0vT/FLS5+NLi0zKl6wH8RR6p80nCmolu3DJ7cMzLFi?=
 =?us-ascii?Q?s6+su7fyREkHHfCKUCR0ie+ROhVx+3skpoeq1VQqpfS+71N9b64RDGkNCdi6?=
 =?us-ascii?Q?dCGXrjQYc7xJc9gjqM+/epg7VeCqecS1jcSbKCFx1ucqUe93bR/8s/S9fZ8e?=
 =?us-ascii?Q?Omqt0bZ1B5qJIIQ26NtkHC2lJ+lgs92RqG4nHUgjms3KDlfD35jsGb28Q4mR?=
 =?us-ascii?Q?NceiPyHaGpiP41ytfGeETBhDM2wGX0Pc3HmvunBiZ1Np4SMlOdf+SFWozYWh?=
 =?us-ascii?Q?/vrXV7wMhFZkS7UsFEvNi/0fZEp1BchZmoczNZ3F7gx9Pi9w530ijHFsGIJq?=
 =?us-ascii?Q?+beIDLWqMNrR0cZsbwuGP97ppynFzIyWLQbizKx3H1TwD9CGykE081hVULBr?=
 =?us-ascii?Q?ZIY//JQ+e03tBkZiyKb/i+Cms08Pw/GnmPYxtlN1XeALEvYdYfd5VW4PYzWO?=
 =?us-ascii?Q?IEOsqy54rEXe1NLJ5ghIyXxIwUcFJHTy5HJu0XwLztttNSjfqyALFdYRLxuJ?=
 =?us-ascii?Q?U5YKtcZ0T1GIpHP6Lun3sZ0Q5xO+frasYn+TMMZGFIzB2QX1qtGRmSq66nZG?=
 =?us-ascii?Q?ixBe9S31StxAznQAO0hdTewe/F0skLpR3kxuKe0duOS7O4Y4gs3lzTTnTQeV?=
 =?us-ascii?Q?4EZK4VFmB7FDF5eFamCNcCQlUOliqdlZPPHCq001JzEuqQBUK9MQgze0Mb30?=
 =?us-ascii?Q?TyuX0k1XANyTjKOnqNrCTuCuu1OJs6D2Nto4gxQ+Tz0tRQ0j386CigxkarXA?=
 =?us-ascii?Q?8Zqq5lfJoSlbdpk+KcLgu2EV97Y59grwQyN7GuXgSCl1qzitdF76VEcz2kK+?=
 =?us-ascii?Q?YCAsDeB89YpkaqXjVS/meKoxuDV7juC1NOK5gI6ga3RS6kJQxS58E2S36MJ9?=
 =?us-ascii?Q?dK6uPTWYteoZMcQ6P1UzMT1WkJFF1zFb5gEg6QFhAEg1rxXw7bZYnUVrqe+G?=
 =?us-ascii?Q?lgFRTLfxVMC+/jrc/Y0dF23u+xr2JVTvqKepwbWsK86r/G5Qb8WLLw/3l5G+?=
 =?us-ascii?Q?LOvefBDrGhlU9loYJxJWqk8+B7/VDbYR9CCjn9s6Ts3hIEXmRcJNQ+g4l+pb?=
 =?us-ascii?Q?JN5Ftm2q4UwZT8iGGugcbiUnnw8P9ScZlCPNUZHb?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b9614af-9701-457b-2242-08dac7fa2bc8
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2022 17:44:11.9146
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h8mU0xJ2HaVC3vUtHfeimq98sVgkRa/gkeXT2K9CE8MftYV43wf3HoEP/65ZkL9c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6664
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
Cc: linux-pci@vger.kernel.org, Will Deacon <will@kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Dave Jiang <dave.jiang@intel.com>, Ashok Raj <ashok.raj@intel.com>, Joerg Roedel <joro@8bytes.org>, x86@kernel.org, Allen Hubbe <allenbh@gmail.com>, Kevin Tian <kevin.tian@intel.com>, "Ahmed S. Darwish" <darwi@linutronix.de>, Jon Mason <jdmason@kudzu.us>, linuxppc-dev@lists.ozlabs.org, Alex Williamson <alex.williamson@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>, Dan Williams <dan.j.williams@intel.com>, Reinette Chatre <reinette.chatre@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, LKML <linux-kernel@vger.kernel.org>, Marc Zyngier <maz@kernel.org>, Logan Gunthorpe <logang@deltatee.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Nov 11, 2022 at 02:54:23PM +0100, Thomas Gleixner wrote:
> W=1 complains about this.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> ---
>  kernel/irq/msi.c |    1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
