Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 706E562C726
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 19:02:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NC9qk1np4z3fWL
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 05:02:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Uo0f67BV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5a::618; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Uo0f67BV;
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on20618.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5a::618])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NC9nM0QtKz3fKs
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Nov 2022 05:00:21 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AiVzwSNWrYwTLWxffdIb1SV1Uu1/yuheaNQaDglSLCRVHsTivXSM1Q1pwJ3Ay6fDBF1rP+6zkpTThFXcrbKzNuh632jzOZwUmBW32uLAYAYxMg3t7AmHdehXETOB0tGB1L9xrVT2Xp3AVdIpE7uW3Nu7+xXAk7bmD/iYWagdfDJyuxx8L4QF0jURAz6DP5qNW20Tq3bPb8Ampb1lExR44+0ZQpnJmtDkrj8+E7Wk9HPJWnPccVZp9157bbxfskYJ7J6VsjtsUc4wfbFnBAvClYEuYybw1c2cjXOMk9h+AoONwjJ0BpleXubya8g2dgq3+4zK11nQULYrD2CbO5Mxkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A17gj4NUxZDots2H5QxNfYCTEc6ZflViiqabHK6PbVk=;
 b=oZcg6wEcMXktVRah+DgpgNgflMrSiz9D2Oe6BbH7v61/68jRUTQIfG0Bh3VEfohiaZ5WgXJFT37uLmdFA7d28MU+7Nz57LS3l823Y7hlBv8iyGzMRPuZ8mtLhHYImWhctnHm1/3ONvdWG2hPXC/qqoLEUHUfUlvaZ4Wnv7GbzPqjwMQKgien4P6qBLEuU6TnFmydCUBgxsNHyjZT0MAl6dtmMeLcAtqammnyQQpm6s/b9FuYFelSCjoihcBUKsV+4ciA7MHrKgHtRLGnivDFFaN7kWhq1s/sqjHboqfGWDKFXMJEgPp7FCMjJxFaNNVVH5TY+iV8HrN9muygMxQ6MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A17gj4NUxZDots2H5QxNfYCTEc6ZflViiqabHK6PbVk=;
 b=Uo0f67BVq6hfjxhChlD+WS0tdxarFlCps0/GqTF/u0+KE7LLJg2vdLRuVj6ATDp9AmZ+rDIWhIOu3bBWPR0PYqlFRRuK4yDOykyAdEETdkq2M7efHEk85nyFcLXufMxlv5QRWHtjgY5ZMQY+fw3NSCkW6RqPDj+LuKRt7YszjGOYShRTyyfOlzP2BmLboya2dq8FjjbYvf7kJMUKNVSMYljATrAHVaXeGNFrsM+/QlXdhDLJT7NdJ2nBg5E5lLpxNQzvpMcHZ801g+B2O+UazsI3Xn/dIlXAZMOPWxB14/L6r/kTLb9LXlybQ8lQzKPukKShlbYM7K/r2zisXM2a5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by DS7PR12MB6024.namprd12.prod.outlook.com (2603:10b6:8:84::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.19; Wed, 16 Nov
 2022 18:00:03 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f8b0:df13:5f8d:12a]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f8b0:df13:5f8d:12a%7]) with mapi id 15.20.5813.017; Wed, 16 Nov 2022
 18:00:03 +0000
Date: Wed, 16 Nov 2022 14:00:01 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch 35/39] PCI/MSI: Reject MSI-X early
Message-ID: <Y3UlIatCC+Jsc6fv@nvidia.com>
References: <20221111120501.026511281@linutronix.de>
 <20221111122015.631728309@linutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221111122015.631728309@linutronix.de>
X-ClientProxiedBy: BL0PR01CA0011.prod.exchangelabs.com (2603:10b6:208:71::24)
 To LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|DS7PR12MB6024:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e80ff01-ee99-4bbc-85d9-08dac7fc630c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	GBRl3kvo1KvVNMAbOeZ7EGquVQQNxyqrRnfTRNpQxWlXJ5U9ZtueRsNnZ0FmG9/wjPUSgvWXmsnPks/juSBr+kcuntt0wSJlpjOkyElvAJNof4sWvlxq+CFNsGx4VbNFjbvQOxODq18Bt8R9C61e1C6Ca63Lo3XV5q9HrgxMUYDtruI5cKnw4s8PfIPnzqF/zrBmOIQ3q+aWUNNWKeHUvQg1j58eBiLaMrjZZqRTkqYdC9M5Old/r+1MmEqmOVyMpiMXPZINoGy7ZQVvnpMmiQI1aBmXex5lR9c54CX4xFf3SJ0GnU8YrHdnIdH/nNk70abdDEemDha1ozeEqcxv/qatLCOquhzWw5HKwG38gRac4p8Y5coyRAUbbPtax+bAcC6BlEZSZXwS9aO1iL+yK7YdRFVdCITiceZzcHcZioczcdVeDI8D1kULomB3FSz3h1Dhcmwgf8TWWXTnfCtghDlQfl7nv9JRrAV0+AYxVQuoruzrpyI4wBUO6MYFK7TSt2pjJjP83jqtvwP84rlSPsswT2HJ7hhbWzvvbMCQ/zDmx+QvgxmNHqC2ydKQy4QeZtM3yBKxn2ZIRse+177jm+tzIQ84uwpPHsgv4O2mV7+d+yxu0h/450inmeI3fqgA2Y7WYQScr2PMYPEr2c6dupyzFxS0Umtg4WmRVkRvrsYiusWAHYFT+yiwbWTHBoJ2SOvhGSEf3MjwFdHry7lECt3V5aeubHO04yXZq3FtyNWeupLfOrSY5fM+5PpoyFhZ
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(376002)(346002)(366004)(136003)(451199015)(86362001)(38100700002)(4744005)(2906002)(41300700001)(5660300002)(7416002)(8936002)(6506007)(2616005)(478600001)(6512007)(26005)(186003)(66946007)(66476007)(66556008)(8676002)(316002)(4326008)(6486002)(6916009)(54906003)(36756003)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?FOg44g53+tOSjmNG9xVUug8c0mrCEsKvUATe48W/uzIhP41UrsVDRQg4Gl4Y?=
 =?us-ascii?Q?iimCQAgQQwk0OBXB5FiRi96h8To64Qoc2Xb32XVQyM9axeGk7BFLHZOFADdA?=
 =?us-ascii?Q?KkPvM+5H+TYBkNV7confk3VaOwmQihyMfxm2WmCIkG9N+qot/RWZRzTJVQSI?=
 =?us-ascii?Q?wrLGFy+itHmLcgB/Jq8DJzGKtxW8Wn9PqLuFATGmeyNrM/7skwCq3qhrj6Wp?=
 =?us-ascii?Q?M1Ehf1JwYdIy8NVPzVh2zV8GqCsykYCgv/35h5u1++kuOthFkMXBE1rI8hVF?=
 =?us-ascii?Q?tlpoQD2vb0NTJsvtZ5b5u0QnV3Fet4slfgjYUAFm9iijVentMCMIXyejWYNU?=
 =?us-ascii?Q?KOJak7JR9dEJpFB7kF4EZ1Ng/0h4e1J+MLTMYxKRzOzK0KNRLglR1VKtws3L?=
 =?us-ascii?Q?L0nfZYUkkP628ovxmIVI7KXvRNtNb7Aw2v+vEgq0msbruHXsBQ+9eO5Abbxn?=
 =?us-ascii?Q?VOucJBcE4r7n+CyNaEZtTaljDOlWs+/qwaMrOIdD8GOb0/kXOL8pVuz0eiso?=
 =?us-ascii?Q?ly+OZ0PEoe7a8QfALYQoDymatp7m0n+wp+TFKHnowvpMWOV5GRLTL8GB8mou?=
 =?us-ascii?Q?c15c8Q1K6cwr/Ea+8F4x6NDWXmMclv34i8+BVfM/4yUK90wvdhJIzN5JdBLv?=
 =?us-ascii?Q?QRUsgB6gAEfphXOTvS4qvfmRfovKKCaZ4KZSi+DyBbHiCwtyw/GlKPQVVLzd?=
 =?us-ascii?Q?TWTfPSGrl+Wr+jMc/ZLlV2+xQmdAwsI1bUbMfGp35foV6cSEpodExJ9q4dzr?=
 =?us-ascii?Q?JkVzBB14C+CzzNms4Y3ZR9PnD2HJMBi3Chyq5uXJXg4hNzGuFKN4NgOKjrIF?=
 =?us-ascii?Q?3ry9y8GkQdC09F3RKwXNywiA2nvHD8cNShCOjA/VlHw89v3WjjUfRCpi0D4z?=
 =?us-ascii?Q?sz/m9ilg5Rq/U146J3TWo8lVGLP/pzrUVv1WDSyTQ4ckod7o8lAbOTkVQZ77?=
 =?us-ascii?Q?Pmj/NPgE0CxdgRNzeDrGW2HwdS6G1O+g6XwvThWi/UUuzS5BoSkV0XIwzF41?=
 =?us-ascii?Q?gN9ydMGz/IQgn5YgLL/N3Bx7MsZ/xURTR566uEqVhNbrX2yO4KVjufQKyDL6?=
 =?us-ascii?Q?bF/56sTxvt4h5I/F4KhVNTl5lN0FsmS9AnXeyjupMBZoIprcEd7JttdEYLCM?=
 =?us-ascii?Q?CX3+m3aMrn1fyOR6RLjFpNM+3Fq8ArxfN30IeqqsXRJo/fBYXoMUZmgtboct?=
 =?us-ascii?Q?d2cxF5aHMasdyPO6wrTBTjuyohmKD0nhWAEYzb2TNoIMfce4sP1oNXMmzvXs?=
 =?us-ascii?Q?cVHoH30mVQ59+Hr/iPDfp3Y66ShgHRClWVNM+fa/yohvppbAveqmurYhoJQL?=
 =?us-ascii?Q?mcQoklnt+PNWEVZRPnzCoRo8GnNbN4QNuqF/7xBNCK8r+4mrzYkeEi5wWxS5?=
 =?us-ascii?Q?nP2G/qgMO5IhY76Ytv7y6sVN7JQ1ICz0c2Svj8eQ3Ub8RN+ivNYQetDm5s0v?=
 =?us-ascii?Q?0+xD4VZYqOfXDk2g0PUy1xrsd3K2J+omavFC+iFwzxVJ18X2Zq72dqp/YKPC?=
 =?us-ascii?Q?HlZtT6QkoqoIA5ysmu7DNatsl69fq0clbyhX/b/w1CMD7ewBJsVWxKyL6ddd?=
 =?us-ascii?Q?mSRtP70Fh13LoEVB+lzCERA0zewYjcCA1NUk1wZV?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e80ff01-ee99-4bbc-85d9-08dac7fc630c
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2022 18:00:03.5928
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q2+rTWsV4MjKQEp9bqXnCqEHfaDG748dazfx62gYPYIjaXyilN1UfCBwfde+0xF4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6024
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

On Fri, Nov 11, 2022 at 02:55:11PM +0100, Thomas Gleixner wrote:
> Similar to PCI multi-MSI reject MSI-X enablement when a irq domain is
> attached to the device which does not support MSI-X.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> ---
>  drivers/pci/msi/msi.c |    4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
