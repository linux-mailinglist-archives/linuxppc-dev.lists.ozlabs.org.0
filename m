Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 23EE862C6AF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 18:46:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NC9TG08hRz3f4s
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 04:46:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=l8v/dGkb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7eab::612; helo=nam11-co1-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=l8v/dGkb;
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on20612.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eab::612])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NC9Qq4Z7Zz3f2w
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Nov 2022 04:44:17 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JnO7DvUclb2x4RfD4UVEcbsz7hjgWAknptQ0JkRSHbW1EcomtWgNLo8KS00tQwaMM2UsHZzdganSGZVqsrVTS8Vb07+JtCRU7Ez0ESpdnnKCiUMueHhrl3lCjMZ0+73B37SRB2mbCo5Afy0QnZG4obdsBu8L3iuLk4m9objFmmMPVc8gdy5FkGAump6MD8Z1o8zzNYTmo2OqFEH//mnXXA3T6mHRfOFth1u8FgW0bB1/oW9XtQa/qG/qhJjSxabJ95otvDBom9iO+NLqdWSfXigPaxhC5jgAtVfDAfJ4ANbI3JxeRDh6ECg6F8JhjGkS2FRyfVVKDL+nPog8uiM4kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Jl4YX9Al2hVj8C9P/J0tCazovWVwe8TM2nqK9QGMjU=;
 b=XSv3N7ptkEYVjk6gMKGs7ijig/Pdw6ywP3dciOdnws2PD9ESkVVxym3GHsXM4KYTCNuUKqqSzxwz+DKklO0rKzytO26nOwu7uzQsJx6XTuXXgOu43OSLpsEEbG7bKsd/YBv2s/ZArlGPpo9gvx0DFG/YlHDuEXprKoTv5KiT5bi2Ze9ZJ8wg4WQlvOku/qV2hUc6YKTV9q4Il15+g3vXZIlzGPPb26CriVaHvvmAH3XlSgicSgwwKfni/ApPZfStoQsgKo3aeQrGa6oEI6NjlPO/8BY7nwGv3zR0zUi9YJUc5jODzU+++vhGLEmWBjTwpSMNiFWpWnbUtjz7pY8+og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Jl4YX9Al2hVj8C9P/J0tCazovWVwe8TM2nqK9QGMjU=;
 b=l8v/dGkbZyaDGDSqCDxPvo9EU0Y51ekYZ9M/fHMAKHMbIlD9aZdWIYMmYtBuCkSCnrn1mDZgwMdqDdvJnvA/2gtN4FDlZe29IqjcGqaniz7R8s2pf0mXHvFR1Cq4HJa6UBPjEToJG940pE2lAEBeVBKdVfDCvDhMVssz03wGfwnN6B3e5sTiPdKHdp4PdfnfdgJy06BGWaPVvb95EOosMvtD3Ir6IKsKx3CeC+rvHM3/t/1vgII0lSBQ14ogYekM6tlcf8ogVf+ttUjb4QUuLZUhqcWJCmXcccOGcGLFgZQb9/hdc48cqgHzQl99jDIG/0o+3RWJSnjgxbKB1U/iHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by BL1PR12MB5945.namprd12.prod.outlook.com (2603:10b6:208:398::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.19; Wed, 16 Nov
 2022 17:44:00 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f8b0:df13:5f8d:12a]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f8b0:df13:5f8d:12a%7]) with mapi id 15.20.5813.017; Wed, 16 Nov 2022
 17:44:00 +0000
Date: Wed, 16 Nov 2022 13:43:59 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch 05/39] genirq/msi: Remove filter from
 msi_free_descs_free_range()
Message-ID: <Y3UhX9MT3VLSeM3m@nvidia.com>
References: <20221111120501.026511281@linutronix.de>
 <20221111122013.888850936@linutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221111122013.888850936@linutronix.de>
X-ClientProxiedBy: CH2PR08CA0006.namprd08.prod.outlook.com
 (2603:10b6:610:5a::16) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|BL1PR12MB5945:EE_
X-MS-Office365-Filtering-Correlation-Id: 925a031a-6d08-4b27-58cb-08dac7fa2509
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	3fCnOnNqjX1JXUK696c3CVU9y4yr0zBaK9nAh3xpSP5XHloaZ300VXPoClm16bATXNTZW9Yykrgc9et9rDKn91yr7C9IcLyfU0zrr13CyqhSuM0RY7ogvf1GrTbgc6X7SiU7+dhdGVl6IZ9FVH8YajLSO9wuc4iAmfRyUIzbQ3r7p91ayRYR2i4lL7fTjZQBmnCIA4C9CGyuQkcBXF1DK3I7dje1bO+j7ArFax3LDPYcf8Nr4g5g892syHsIDupSafnqiPO3Ztt5bXBZWjSA8SaGZyw2N95T5ZFsXEJG59qCHQvbt6DPNrT4BDhXw/SUjgh8NjRm9lEF5nYjugxW6dXIG4EITm3pP7/dotolWn7EeAlihgAcc7oKdMgv9mDy9PeanULSMScWC4nbXF2WlNQTJgzUGCZN881M/7eZLebaxXvFo8jEycPdkM6rRazmec7Lq08ByvVbkPwQVZNRj9pVBgMRx8NR582ZeplfFr1DPDed8RkwfwO0NNmsDMjuy6AL0l5jolBmmtTD/YcBIpf5QJ2CMsycDuypPF4aXdNE1eNLrpMYWbDp60mfogOt//z6Dn6be2ChuHCm8DwGkxNFcYReQn5ClEjgB4Za9VikXEctI/CnWhcJ+a+y6dQULaMHTlxJ2Jihe+MvRVMYX9LvgSmhheAqYfFDkQcPWpX8AUMjheHeKJiJ1K+Vgd82FgD0Cx8hYUQNVeF6n40xog==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(39860400002)(136003)(396003)(366004)(451199015)(6506007)(6916009)(54906003)(26005)(6512007)(6486002)(66476007)(8676002)(4326008)(478600001)(2616005)(66946007)(41300700001)(66556008)(186003)(8936002)(2906002)(83380400001)(7416002)(5660300002)(4744005)(86362001)(36756003)(316002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?9L8RsaLOD1AdmoemXv2CU+UXCcbK4wJ7H1y1hXgtyou4dhUn5EVOrUIw7N3n?=
 =?us-ascii?Q?GiMbFNYYiY5UgtKM+KrNj18BjN9az3uiDXR2em2gXeBq6QErU1xkcd6bPB7S?=
 =?us-ascii?Q?ilMCodGZN9sWILfu2u1xUARz+a1GBU92AKrqqGPRY6XsYWbZ67A96x2ZJIqx?=
 =?us-ascii?Q?O+uWgxJmCqRIUdXqUobiR1aG1WB6oXwtsdWh5EWqkPm/iAAGX9iSXIEd7Di5?=
 =?us-ascii?Q?tmfyVBapIGCKzCia/9MfexCue7HBVdA1c/rA5hF/ZHieJq12nXoxj1YYDg6n?=
 =?us-ascii?Q?dYlai3RZ0s9ny4+cPXUEFAqLzN1Gdc2QTwWYNRyqi8kTGnECyTHKstoHB+5D?=
 =?us-ascii?Q?j6u0LTaQ4TdQa8vcqTJMLKVf9LobF1NZD6w1w2ywOj9PUzgXtBPwB+oji+co?=
 =?us-ascii?Q?1i8T/+IuyUCpnr+E1wleHg7u/oLj5IyGzy0D5gplw4zhD2N/CeQSxRgah6V1?=
 =?us-ascii?Q?i2PjS0QMbbMHf2PI/8dB4OkDB5SfiXuKLFDj67eY6ORAdiR7SVMzeY/vO76S?=
 =?us-ascii?Q?Nfh/gJy1VwNhkVJs8kaiBhokM+LfrjVfNhbgVbmLf+1ZeX+fTgZFKoMiCiKC?=
 =?us-ascii?Q?YRf6vSqEg/TO2n2JD7GwNqqOm1RIf3biaMUoNSu+Zb5M+3XB4mu1xs8bquRB?=
 =?us-ascii?Q?fbQY1nvM5Ux5IWb2ndvVGvrIv+vQnddJLukjKnszO+LoM1iD2cVlioQysI5w?=
 =?us-ascii?Q?M4IiRd2aVuiPA4MNNqyQjiTOT5bIamGev3hMQYo2Ft6q7B9bjqF2MxKl8N4U?=
 =?us-ascii?Q?d4sHXT/1W2GouG/xlzxx3KusmTCb1j7nzvC+rxnQZvXHkATwXcFbGcSEWY69?=
 =?us-ascii?Q?QT+I8u4rFXwoJgia3IhygFHbk2D7HaXPLWJQ2HNWgcDOMHhy7h00jYKv08HU?=
 =?us-ascii?Q?bzgHg36OBThbLSAVuQg4JhPXGxGhCE3LOsLdx3M1dGI0taCYv4RuedbUTmV5?=
 =?us-ascii?Q?fG5JUB59gGiilVKc3NpwLvEmqToRfpdy7eXh2KDigEEGIrjf0MzqB5P+681I?=
 =?us-ascii?Q?GJGND7hneee7b6KxjVx/86T2qiof+nrs+RoIx7aYk0YJkVyMEtD1JgOf6en4?=
 =?us-ascii?Q?g5GqcGMd/76IKqLstKtIXcCxj4T/oPRAVNZ1epgJRIVF7wENkrWQVkDEEnA3?=
 =?us-ascii?Q?6rSGpr9qbTumgkFeQnSu1FLozg6mKSTvvteHQ/a6t1kO2HfqQhbmb1HgAPoX?=
 =?us-ascii?Q?toKmH27V/VoOLJEKa7sIYaemup1irAgxIf64Hx3ncVFfMNZfiujM7RoWpA+6?=
 =?us-ascii?Q?I5uFQuql5nQTJctQ0wdInx+6gDuVC2eVaEi3iXkGdj3snLjd2mRHgxc2Yx85?=
 =?us-ascii?Q?wpKzILQIBx9/bzfI+FXFCOy4Ho1Ab12US2I++2Af78I8DhU9Bx5kH/9Nahig?=
 =?us-ascii?Q?V9vDmrmppIEswWzCs3fmIy6wM4dfW+0q0IwgaFEjHJqDvPpztDeXIMC5yNPE?=
 =?us-ascii?Q?V6tV6fhcU7lue0IbsjSrF1BtazhRPzmUDRtCnP0kHF8mG6h3LdxctdFCtsom?=
 =?us-ascii?Q?+aEtJd06q1sO0JZf7KIBgB/Ubmf2k8JmWi4ByA+LrRpxkn3DwkSiohPYfAne?=
 =?us-ascii?Q?JfSyQb/8tMUTi0GPYOhxCKb7U0AuQct5S7gn/sfh?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 925a031a-6d08-4b27-58cb-08dac7fa2509
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2022 17:44:00.5967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MTo5Dua3nREJSKuCzUzYUhrDafFFlqGUqQ9A/yP/ButMQbz6SPND684U/JAr3ncy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5945
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

On Fri, Nov 11, 2022 at 02:54:22PM +0100, Thomas Gleixner wrote:
> When a range of descriptors is freed then all of them are not associated to
> a linux interrupt. Remove the filter and add a warning to the free function.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> ---
>  drivers/base/platform-msi.c |    2 +-
>  include/linux/msi.h         |    5 ++---
>  kernel/irq/msi.c            |   19 ++++++++++---------
>  3 files changed, 13 insertions(+), 13 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
