Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD1962C665
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 18:32:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NC98w1KHTz3cNb
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 04:32:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=eQUH8Rc2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e83::619; helo=nam02-dm3-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=eQUH8Rc2;
	dkim-atps=neutral
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on20619.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e83::619])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NC97w4xVjz2xrk
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Nov 2022 04:31:22 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gVhE1zN98QdqVAGvSJT43JSj3uIZ1m208EbQWhcH+DSLe9BVp4oyKyvvedxBKNirLIp3r/6WFZj7A3dmStfHTC7FIt8NxWV474VHIBjAQfWgjpAu1vZItc77mjr/c7Mm8MURdU0upiCGCU93rvr8yaLBEDEhmaBqaW2L42WQ2J2mk6zSg2G0/qopLrwwVqVRyo8kwCsaZhi7IwTizS6hiOag0kP9bxFDkOapRaqK8wXAd3xfzmusZEBpiJXBLVkVl9L9tlKJRLd4agouUEO0cskUIHT6iW4MkbZo3sIMAYApJV1PnHDn9lSudF2+0thKKa9SpYeYjZnSMX6PyerU3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iGkZr7SnlY6GZCxRuirEBXwWEQe5bmK/jxFQQyUsqF0=;
 b=S8VuNcxWklP3c+om5ZPszKIpR1GWZAfX+zdFhX7R+BrUf+t6x7u+0qKT8rvBt69R32Lr0KRH1PRDctwxuz2MTGrjRdl5rqqsxGEBDRWsEAuqi02LIM54uQwrykGXnqYsSTm9VYnyisV9beWmWOFq7S3MWPuSjU3Jfuf26Z+6eRf4PvkWUpUzrkqI95TemOii4pJp/QNZqhqxEFt+SR5e5ZkB9EqHhhptKipu9xKr57vTDnmIYR+wDx2JVoL7nSLQmXso/iKdZQ0kWMnthXIE+VpPQdDPFi/i9nqJj2dmV9pJE+CET8w6VDxOaZ7ywH6iBjmh1QnBcDpYeC+yuILzaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iGkZr7SnlY6GZCxRuirEBXwWEQe5bmK/jxFQQyUsqF0=;
 b=eQUH8Rc2kYFKRXMIg2+DTBUqcNIzYxvto+mfalYufQjTpNn/aGkMnytlLpGY3hlHwCwm589kWel3VRRNfRAlLL1Mpw5QprXXCdJazBkWF9zL/9Jv29sBpNjcU7V36sGJmiPvpHOT/JAMMjaFW0M2ulh2YJvTOfwQCojzkqU8mXnfJ7BJZjwHnBq5d9Gab9ThPwghiUh+CWnFuckeRCEzSzeK1tS3fW+FJSun7w079Ey0XbHuWVdyq9kONc0Q/TrAPqS/Ep/q+hqHB70i1/d37SlLL4WzC58kmWqL6lbzmAW7W7paU+0cicdf4XJW9swgMI4kS7JfJcBWlv1BJueWLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SA1PR12MB7295.namprd12.prod.outlook.com (2603:10b6:806:2b6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.18; Wed, 16 Nov
 2022 17:31:14 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f8b0:df13:5f8d:12a]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f8b0:df13:5f8d:12a%7]) with mapi id 15.20.5813.017; Wed, 16 Nov 2022
 17:31:13 +0000
Date: Wed, 16 Nov 2022 13:31:10 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch 31/39] Documentation: PCI: Add reference to PCI/MSI
 device driver APIs
Message-ID: <Y3UeXiH4wzUPmtGL@nvidia.com>
References: <20221111120501.026511281@linutronix.de>
 <20221111122015.397739421@linutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221111122015.397739421@linutronix.de>
X-ClientProxiedBy: YT2PR01CA0011.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::16) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SA1PR12MB7295:EE_
X-MS-Office365-Filtering-Correlation-Id: f4062918-6037-45e6-a598-08dac7f85bf6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	H9RKwGLeIQOKoky+W1qARxmKy4aK8eGen/8GAvNhcHJU5gzQMpLIi6YULPGuuicYfDxqdY5AFIqDCuT9g9XCcT257BPmU5ZxPNS5eBcy/GZEQTowLkohcmDLfoQfPa7eOa4ymf3UaPj/CVZKtWVML2uVUQp0cV+NqeoeAcsgrLdhuzDI0wSuSjHFbJBW5/7wez4kWc7z/Z/6223p/KU25VaGNRrqvKERJmecKZVT7BtsCf2j7u+Hy9uleZPk0gWwS8PpGHFuV6AfykCs9fR2mdA0qCUsqcs0eCMgt6TsvQZKtMGKiNqXw4rGE85P5TPSY4rF9/je6KDEA/UsuRVmn2vdBm0FfxrIslC5KHddTen83FWbAkdIN8uP2by0Qmx2hW5xaNWzDHEn6x1mfNVHVkBJnxDrofDj6HAvoDjDp4BZrRPN1uOCp4rDPFEyMBC6HaO5VFQM48aR5OcwQguQZlOtiOyJZPGUIIkgT6q9x6pzr1eHfQ7Ump/ARHpH2p/YM6R/sxAyTc+GOhl6J9E9Zl4jB/ULeRTU2i0PfAugnYsOxTUQpZ+NAnXhRT69+vjvSfNuaxFGNDQ5t3CG1SjTH597myVqGlP8Zlm8odLGvv0mU0wlfd93IsPkKEVQmWSBMlxa9ukxOWhPjyk1rY87kjscooYOR5b6b52qJRZlfarD9XakW4VrQedvxgUB4MWm/+8k7utY4VuEs/WTuwkgux8X+ZzoTezFOuvPeMihXa7HsEhKZdJ3I4OrGiUs1FyV
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(366004)(39860400002)(396003)(346002)(376002)(451199015)(8676002)(38100700002)(5660300002)(54906003)(4326008)(66556008)(66476007)(66946007)(7416002)(316002)(8936002)(6916009)(41300700001)(2906002)(6486002)(186003)(478600001)(6512007)(86362001)(6506007)(26005)(36756003)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?9mgb7qZBKA6p5zPND9J6a5snnBUSWg+iQARY9RCXy9WDN88idkZ6bvZ1U1M1?=
 =?us-ascii?Q?w4xdkLr+LP0/wEnYM8As6dCGPo4Jq2pWcyhiBgI6oUITMrBwbbUFyXHjb6T+?=
 =?us-ascii?Q?yhLfp345ZrHTEriJM091yILnCsYgqDVwTInMgK4hB6MTqfDDKG4o0PlssTbv?=
 =?us-ascii?Q?TlUNejX1lsvu+OBP5JP6PzAt++8C43/IfK+0StXuT7VbzLU2hxrt9Jkuhzht?=
 =?us-ascii?Q?Eaxs3O7M9LYpJe+rLRKddz6SNdAm0gwv8e9pFNIBUg43LP0Ph1mzS/6pdU8M?=
 =?us-ascii?Q?JduM+S9xRr6WeS697Tfd9WnGGoj6KO66kOBZvwVPfL4Yv+HqMwUtji4bavsN?=
 =?us-ascii?Q?Pd6a0aIi2L4HY9LRvhHWSkDZFFOU/yBQKssrC8cbD9CtBW/3GiojMKtJq4hm?=
 =?us-ascii?Q?/PqglZISG8X7qbWi2ov27XLab30h36gMS9wbHjzQF7In5UL7MNoxctD0uw5Y?=
 =?us-ascii?Q?/9j9z/3gneRWP4LP9jh5/g5CypsooBZHOoVAiP28T5jJIlTzhve13LG7tnIY?=
 =?us-ascii?Q?10sdW/lbW8nre1wKDEAZHkffR83HLRGv1IBP/DxjzQcr7QXwOqCeJuPpR1m5?=
 =?us-ascii?Q?Lzq1aEzUQV4dI045Khnha0v4OFbnISrETs4h3asKzCQcInaI7ToYP3Mg+K6X?=
 =?us-ascii?Q?rj9hTytpZlSfaIL98/2GSKnQZCcTOB2zjd69+uYEaHEPqIEZr0lkCCp/RC65?=
 =?us-ascii?Q?u/eVg6XUkjutYBoHvEtleOevZkRKmo+iqcCOgdl4SlvpOIV6qqt60aqYouwi?=
 =?us-ascii?Q?MRAgio8v2sECvWALBgHTOlo8O8R4rvHzvI5Cjg4HPHf/sCd0DVvV5lmBd2CS?=
 =?us-ascii?Q?iwex/usZydDRQwLzTbe31QiYGoGGFvZikXwqvFPoGlSfFoEHq2jxP5TxEGis?=
 =?us-ascii?Q?GkDd5CgCUrlCFbLSwhWjZuWQINTx+WXdiYtXmWhByT+s+VvGP3qfj6LXNbkw?=
 =?us-ascii?Q?+VIk5rh4XbYLK/14huk6SHn+857l/kO12KENG/fOxgYG6gEhJFqdjJq+lMtP?=
 =?us-ascii?Q?kz8DKvw5Wi7B3UnREJVDoVtREXpV8rolte55DW34eLXnmP+6QAnzYvNZWl+o?=
 =?us-ascii?Q?lWt/hE4ayJx7vbcqP0LkGvu+xTHjg3gVB0O27Q1jKL5rZLMTzpEqID8TsgUq?=
 =?us-ascii?Q?VhoDkpTJ/4tX7YszYNCf/MYx2yfqVmecJjQVOxJhlUoLiukXmJ9sfJRQcAme?=
 =?us-ascii?Q?7k2Q0zL78ucOGkK1OO2b8IJ3HIyO5uLXaSi8GDqdoJx6ZINwnLwLZVup1/Ok?=
 =?us-ascii?Q?YsotNuzqG2+CwwZL/rafim5vk2ud0qtlIOJoAUubf0xWCxEZxjrtCxfzAm3s?=
 =?us-ascii?Q?z918MnpIW/K0QvsyBnsXdJWap1WolgvC3drlqZe4mSQOCd4iokJ9t3VjdXTv?=
 =?us-ascii?Q?OTaBcSV4nGdJrRYY683sQu5U+YS4k5rwhbLNlbOiOewcx4hg4kvdiz8ATv7X?=
 =?us-ascii?Q?kFaEH8WYAELo0R51GVOYshQh0j8BUWkWiwkcV7r/NXTWiDM9UJTxGZwaermN?=
 =?us-ascii?Q?yF7AtV9RPGDI1yPKnmNp0/IuwNugHu80HhTSs0sOvQf5QmkmTjGwUkW7QIZH?=
 =?us-ascii?Q?7GwyUAtEFmMD1xteXm0v6QrdM2r83AZKOaNA3JYa?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4062918-6037-45e6-a598-08dac7f85bf6
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2022 17:31:13.7397
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4/yHo2KlvZLaI7alMVa58iAV0om42p3DNHe+/YVxDCMgDwDrZRGSlW8ihVAr+Rb7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7295
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
Cc: linux-pci@vger.kernel.org, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Dave Jiang <dave.jiang@intel.com>, Ashok Raj <ashok.raj@intel.com>, Joerg Roedel <joro@8bytes.org>, x86@kernel.org, Allen Hubbe <allenbh@gmail.com>, Kevin Tian <kevin.tian@intel.com>, "Ahmed S. Darwish" <darwi@linutronix.de>, Jon Mason <jdmason@kudzu.us>, Alex Williamson <alex.williamson@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>, Dan Williams <dan.j.williams@intel.com>, Reinette Chatre <reinette.chatre@intel.com>, linuxppc-dev@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Logan Gunthorpe <logang@deltatee.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Nov 11, 2022 at 02:55:04PM +0100, Thomas Gleixner wrote:
> From: Ahmed S. Darwish <darwi@linutronix.de>
> 
> All exported device-driver MSI APIs are now grouped in one place at
> drivers/pci/msi/api.c with comprehensive kernel-docs added.
> 
> Reference these kernel-docs in the official PCI/MSI howto.
> 
> Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> 
> ---
>  Documentation/PCI/msi-howto.rst |   10 ++++++++++
>  1 file changed, 10 insertions(+)

I was wondering what the payoff was for moving everything to api.c,
this seems pretty good.

Though, in some regards it might be cleaner to teach ":export:" about
how to process symbol namespaces and put all the architecture facing
exports in some PCI_MSI_ARCH/IRQCHIP namespace which could achieve the
same effect for kdoc as moving all the code around and have the bonus
of discouraging people from mis-using the APIs inside inappropriate
drivers.

But, I like the idea, and the outcome is great so

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
