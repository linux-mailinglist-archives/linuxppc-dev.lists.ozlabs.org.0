Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B72462C363
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 17:05:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NC7DW0PFLz3dvM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 03:05:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jszdmQAs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mga04.intel.com; envelope-from=ashok.raj@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jszdmQAs;
	dkim-atps=neutral
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NC7CW65WKz2xfS
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Nov 2022 03:04:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668614664; x=1700150664;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=27rEbg5qsQ63jwAF0ER7LdkpNQ60QTdUTTYVRoL05nw=;
  b=jszdmQAstTly48m8BIZIkHjgP+pj7INc+fduPEfbDbqnhRbp/MEH7GIx
   8IksX4mbU66RDLrVKTvcgzXUlS+P7tDrqkxxw1Ssqy0M67DTOhMMQQnKt
   pW1lQyGECq2KYGxH8BsAkkvgpx1CKXM1kN1UnaZ/0purr0YDCcm/we6sU
   0ymLvMSF39YuwKnBOG42cfTxj12pd+5k3n5urbGePAMMx87Y4jqELC+mL
   NSXqUiKUIXOfNprigBoary2TT8zXKHK8JdrLUkerTjkqJf3T8t4e7054M
   r/Og8+1MhNNNp4HKJ3kN6/XU04UW12RqklalsgAApu9LEvj1rHxowL7Gh
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="311288022"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; 
   d="scan'208";a="311288022"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2022 08:02:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="728416314"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; 
   d="scan'208";a="728416314"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by FMSMGA003.fm.intel.com with ESMTP; 16 Nov 2022 07:53:01 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 16 Nov 2022 07:53:00 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 16 Nov 2022 07:53:00 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 16 Nov 2022 07:52:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fPeVkBVY1VZZd4onHUrMVVD4EPxqs1Y1zHpD0WY64gb74c6dqhwz8mBMfPTPrG+3yJCwUDAQdFQKDmFLZra3i85yCtuESyyy3rBqRcVm1JK0WLLS2IwxTYq02/T0JDlD5M8JdHldpc9FBY/IQZWhM4PybPr9iBJz3OU8u5UgOvqdp5SJfvgkM0qcIlAz+LkxnsfhjF4h8VLo0IV6PchBaTviAV3dNmTea53g5behmexsaBSl3pY65ep4nhJ14ot75vnNsfuJG/hYP18r1suhDItT/z9YXdNKrr+pnXooek14A2phODAnP0k2f49aF5BYzCtBz23yekPRqUcZ4GEgwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Cb9/NacONNl31NQIx9knsGtTu1EGjhJcEXs60dPul4=;
 b=PoA533iguYCkqVhf0Eer0nlOiePGKAODMOWKXd+SzPjLv5Hf+bpy9i3oiKrel3yDMfw9CszJ7fS0jXHPQimlJNyxW+Y7tPr+Y+Zo8TF0TG70+F/MbPavYE2O06QoyC4FzqlLeBNQa8BfVmJfFyC16kAeWqHfxvB1/XwJsA3PJlUw6IV+flPpAkXT7sJ3gzx/UlGAeIicBmSSQDlh/xGXNYgAnSQ9y3EelT/EM3eve1rbcFNm7iw/Uz515q1gXkKb80w0EVEUKOTX00cKKz8qIpXDrJhFHbvAEQVVQPeNJc+/OW/A7RUKcf7wgiGD6PCWMt1/BGR6gp82tkvkRr4+Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6201.namprd11.prod.outlook.com (2603:10b6:a03:45c::14)
 by SA2PR11MB5145.namprd11.prod.outlook.com (2603:10b6:806:113::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.18; Wed, 16 Nov
 2022 15:52:58 +0000
Received: from SJ1PR11MB6201.namprd11.prod.outlook.com
 ([fe80::6dd2:a8a3:7f9:ad]) by SJ1PR11MB6201.namprd11.prod.outlook.com
 ([fe80::6dd2:a8a3:7f9:ad%4]) with mapi id 15.20.5813.013; Wed, 16 Nov 2022
 15:52:58 +0000
Date: Wed, 16 Nov 2022 07:52:52 -0800
From: Ashok Raj <ashok.raj@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch 02/39] iommu/vt-d: Remove bogus check for multi MSI-X
Message-ID: <Y3UHVGptkWZnIEgI@a4bf019067fa.jf.intel.com>
References: <20221111120501.026511281@linutronix.de>
 <20221111122013.713848846@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221111122013.713848846@linutronix.de>
X-ClientProxiedBy: BYAPR05CA0054.namprd05.prod.outlook.com
 (2603:10b6:a03:74::31) To SJ1PR11MB6201.namprd11.prod.outlook.com
 (2603:10b6:a03:45c::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6201:EE_|SA2PR11MB5145:EE_
X-MS-Office365-Filtering-Correlation-Id: 1917dd24-de18-4d92-a23d-08dac7eaa20c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6Rs8rg7XSsd4kZa0UVAohDgPZWDtlZU/fRjzsOoHvZbN17KbsAY/x09Rv//eSFrB29ZrXqWtrAbXimDlFjMM8LPoLBLCWMFm/bN9LpUh6vsoKeAwPALUSksOZslCzqSaegcUEoWCZ5zFIZVQpM0sRKAWcq6NPoHwTvqW9I/47oUnrJgKLtj6tE+1OKDalWC0HoRFMH/Nt2fxdulE860heoRyE3ecO2Q1LISySRaG6Jhf9mmzr/t9sD9WNZFkP2vMCtYCKgf8txdhnITImqEnKfwWCHKOKvK4z2UL7T4pJH8iUlbZqLQu0z7z6U008zISNUVkK+/UAt26tDxbrTP46ipJ+2mHXihN8UCHiUonmZ+8Ts/gHRXaLTGo1b9LWxqFST/qywRn+Ld7m/sPfOL6NjnqJLN7GzC2RLrF2GmR+HC2C1nsYung59XICJmeBUMrLOpVxBLOnwAGz0gVVIeqyboUlfkckHO2rRRNeq8rKyEPHrg9nSxfmfUhzdzF7VQjJK9z4m/OI3zAzY1LD3BIbGK7WJHGirEyEaDMd6O8Ase9QOgf+SBzTjQ65x0KXoqTaL9tk63CHdR+vTsWez1Jvc40crZOyuS6rcopuCUPH2k7tAkhWTXQPh9D/uXmcoW4y/EJqDAViy+4qNQWFzI++QSbjDncYdoRV1hhf3NpN9CebgLqdAbIh/h1Y80LC44yDRx8bmSNS34XR3QPW4BMqg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6201.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(136003)(346002)(366004)(376002)(396003)(451199015)(186003)(107886003)(86362001)(6666004)(54906003)(6916009)(82960400001)(38100700002)(6506007)(83380400001)(6512007)(26005)(44832011)(7416002)(41300700001)(5660300002)(8936002)(478600001)(6486002)(4744005)(8676002)(2906002)(66476007)(66556008)(316002)(66946007)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/UCQHGbF2Yoti2eipVvlZSxNSnp6giUR30ymsXQRpqy8DPesGY6qVZ2Mp9Sw?=
 =?us-ascii?Q?h+tbpaqGzekgmWJ6Fz15b169Jbl9awta/8xqlBvseV7MKBK+maYTbxuU5qsn?=
 =?us-ascii?Q?pB+LobnqYDf77VqSXAP9iPkMXtOFThG+OFVsJTmrhxQKE/P+SM4FVCejd+Kc?=
 =?us-ascii?Q?aGIKsaX0re6WsEMCkB5smgDbsbyXUZa2ZW1w6UAVMJem4F/dmiLXlKonUulx?=
 =?us-ascii?Q?ysXO3iCkAE9RWT0NNSUxhqxzlZMLSsY0Njv3+HLwBKYiAli6k6nDwL9jeo7Q?=
 =?us-ascii?Q?0BOESG4niEMbPy7ryaRhR5eTtIZiO0Wh5xhKCFKxTK7v3xsU6w6shI4rvERz?=
 =?us-ascii?Q?AopHJKlARKbPVQYpBEhFNA+7y7+EvA5+vSyJWKD3KgtgLBCKB0Kb6At/gikw?=
 =?us-ascii?Q?Jjv8vKqtFwAn+gy7PZE7iqaSUYXMthsUmCuwX3jF3xaZ0ueXsGGyKUFxz5UE?=
 =?us-ascii?Q?brLO9/tq98e+t4hlXP/0rDSAwOK+ZKxek09KL/IsEBmzoJqgmgKKhq6GhAdy?=
 =?us-ascii?Q?mjdXm0hfI6icq00ZBoZ7GiZ/QTHc6IEsw2vUYnx4g1gIdTbEd71qAuv3Xcxt?=
 =?us-ascii?Q?9+LXKZigVSr3j2pfO8JoqkfwvJVosyIkjMhJC0gIKhlFnsrxR1fjKmCZuneO?=
 =?us-ascii?Q?FMFE5lVnaN567+fA2q6v59rkLZjPw5XLgBhjtR8kL49Of+oIv2HLzXYes1hl?=
 =?us-ascii?Q?PEPXEL8lWi/ys+2ZlHZtMa9A6ZsSWJdbLKrD6H6fynub4MG8hRceA/uuHD5W?=
 =?us-ascii?Q?VrSrU7Ps/H0eloqkleyV9DxfK1N/KVk3kNp74hM7LGoYiyFH3+B+CLUWNxh2?=
 =?us-ascii?Q?kDkEjcqrg0vuNuD3TaeajhomSXLx0gR19XYqa0OmpWxabFHRkCrWKTvtn6cD?=
 =?us-ascii?Q?tdlVDcDOpg2465VExuB4C3AHGhIE82Cfw0dzA6Epe+ueXd+boc2YyIOT8uzv?=
 =?us-ascii?Q?9andhIU7Znq9tSqT68asw4v5+hDB8nAzD/ENAO1dsaYxIs4AJ/TRJCQld4wB?=
 =?us-ascii?Q?Xq8gduvaGOwLDpBpQUTLdAQ2dT3u9iW8y+jV+kB4idE9w6nB1w8I/i6FP+FA?=
 =?us-ascii?Q?wqkQ6PnalR5gFTzxdtuMOdpnfsDU4xfp8qjUMi6W7MVTm8u3T0oyKssT60sw?=
 =?us-ascii?Q?9PMzOIszmH7RxWByDUjzfzLX2jxTHhkjba1CmPXayxMLV6Aq8oM+FWkq+k8B?=
 =?us-ascii?Q?CWkDKMiu8BRfNzdI5izFMZXU8vQpNUyZxgQDY3C158gdqal4CiG99cNmoYGA?=
 =?us-ascii?Q?yif5So6BF9RbP1TucWSfs5FiVvqsUT0+kbZ6cLDG964WgpOBVLj+KCstyJ3H?=
 =?us-ascii?Q?o9Bh6i7BkBsV5dfJJw8OYq/qaFA92B4+JkMiVRBrU4UONi6jqm4d1znKfB5u?=
 =?us-ascii?Q?D1ryKrjetfBqhxJYH30rGHYGkSqszhtghLXe2D37w36mwqeo09iEP3XqUdwY?=
 =?us-ascii?Q?RqHcY9e+DEHFg3OD4TR85J8WDMG0eMqjBq0fRl3C1X81/HJKxnZzg49nogks?=
 =?us-ascii?Q?pw0tuOPwS1A3R3AsADYg2ieaJXiNHoJg/sxeUdl9wLP9VIAB7421UN3WhA7h?=
 =?us-ascii?Q?v8fWTIwRr5qbFYzhnUHj8pmvl+fTtGJYqMYwr5c8luWKhU0wBeok5NSCeUzS?=
 =?us-ascii?Q?7g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1917dd24-de18-4d92-a23d-08dac7eaa20c
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6201.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2022 15:52:58.2302
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b0+Qs0R3avDukFSO4bMIXW5Ir8LhdAKq6ZE5mGSAbwbP5eV0+u1NSWUll2qJifdUgMmOFBQ5UDsMxuRr9fg+xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5145
X-OriginatorOrg: intel.com
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
Cc: linux-pci@vger.kernel.org, Will Deacon <will@kernel.org>, Lorenzo
 Pieralisi <lorenzo.pieralisi@arm.com>, Dave Jiang <dave.jiang@intel.com>, Ashok Raj <ashok.raj@intel.com>, Joerg Roedel <joro@8bytes.org>, x86@kernel.org, Jason Gunthorpe <jgg@mellanox.com>, Allen Hubbe <allenbh@gmail.com>, Kevin Tian <kevin.tian@intel.com>, "Ahmed S. Darwish" <darwi@linutronix.de>, Jon Mason <jdmason@kudzu.us>, linuxppc-dev@lists.ozlabs.org, Alex Williamson <alex.williamson@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>, Dan Williams <dan.j.williams@intel.com>, Reinette Chatre <reinette.chatre@intel.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, LKML <linux-kernel@vger.kernel.org>, Marc Zyngier <maz@kernel.org>, Logan Gunthorpe <logang@deltatee.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Nov 11, 2022 at 02:54:17PM +0100, Thomas Gleixner wrote:
> PCI/Multi-MSI is MSI specific and not supported for MSI-X.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> ---
>  drivers/iommu/intel/irq_remapping.c |    3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> --- a/drivers/iommu/intel/irq_remapping.c
> +++ b/drivers/iommu/intel/irq_remapping.c
> @@ -1334,8 +1334,7 @@ static int intel_irq_remapping_alloc(str
>  
>  	if (!info || !iommu)
>  		return -EINVAL;
> -	if (nr_irqs > 1 && info->type != X86_IRQ_ALLOC_TYPE_PCI_MSI &&
> -	    info->type != X86_IRQ_ALLOC_TYPE_PCI_MSIX)
> +	if (nr_irqs > 1 && info->type != X86_IRQ_ALLOC_TYPE_PCI_MSI)
>  		return -EINVAL;
>  
>  	/*
> 

This check is only making sure that when multi-msi is requested that the
type has to be either MSI/MSIX. 

Wouldn't this change return -EINVAL when type = MSIX?
