Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A30C762C72F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 19:04:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NC9sn3Kndz3f90
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 05:04:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=XzPyjkb0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe59::62b; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=XzPyjkb0;
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2062b.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::62b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NC9py4zKnz3f8P
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Nov 2022 05:01:44 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gd46bhemXIkTbOVGUMrFy1YzyhhU3rrrqYKb/970eASe6LSNbaeFVbFIr++Ots6PP2Zi2zMAIaUwTzmZDjPCL24Z6IkJuHFpVyNzSLtbdcAgRfwJrWzcIN0piYKpTBBhns2Wbs8iyk/ouEqzHYm8cbcPBqJ2WWbSxMrj0e7uif5nvt51sHAT4l7XAZ5rVu7RXp4wZ3nNcL+Fqn6doBo7NvwzKnHZCN/yAx1B5I5hrolV9PFgx2niI9ZHnEfMaz6KnHfPsECqH8Bwbj9hQh/XrUT7IMJkwgNEjkaCxNZePP61aRGS1hNNlJwrtonVXF333wC8SIDHNeWmBfUX1UErpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QT/O9qiqDDH9f9KnROkX+VNUFAS0kvcnFXuJ589BBAU=;
 b=XyQUu4a0ZAUprRj+DysngsKrrHEC02uvSSVeBdTFYGQXsTCmYgnwTlSp/AEuzAjc2Q604lI/9unGOGSc2eqsHt8q6Bm2uPauEhM6KNKg09/S0Z6w50S9T0quYbN03a31ugqOSec9WXAZF9difV48sDTz1lEbF9ir4kLq/biVMFl2uGL5VSKn80V7gJs/4yDpptm2c+P3nWmzihSYf353hK5glzo7uqEht47ajJsoEWd7TKao1bI8s5mXm3ArVl0uPVTDV/ORlzB9bointPckqyVpMI/NxjwQm5QqfzLaQhdCktHSpyxTSMK269gvoLTlWc8oyJaAKATfFDKH8D7png==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QT/O9qiqDDH9f9KnROkX+VNUFAS0kvcnFXuJ589BBAU=;
 b=XzPyjkb0DVaBLkSftw57O/DPaQqDGRR1WYsSGd7Em1NCeNHYqPLzk4NwjGxDlIVcdo6C0pz91QEuDusMTqIrKosXeYXgCT4yvFzf1G00E6rcK73MALFiZV+9vXyC2lz9ddRAcsRViBtwA64BEyJvkHwIsgd51Ee2+TqiBIfM87ca4thq+BJwyAGdJ8YB21set7ufTSUyHkcUGOQBLFyDonvsSECjTowV6+8v2jfjrqXwCX/GwWunV6m9byC6kySqmiY8Kf6vnzyIbcau2hLOoWr7vFtAI7dHKSuFdMozim0u6XQZvzn/vs9mXyJ1nv8LdSqrobGbxYV7s21YE6fdrA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SJ1PR12MB6243.namprd12.prod.outlook.com (2603:10b6:a03:456::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.19; Wed, 16 Nov
 2022 18:01:27 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f8b0:df13:5f8d:12a]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f8b0:df13:5f8d:12a%7]) with mapi id 15.20.5813.017; Wed, 16 Nov 2022
 18:01:27 +0000
Date: Wed, 16 Nov 2022 14:01:24 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch 37/39] PCI/MSI: Remove redundant msi_check() callback
Message-ID: <Y3UldEe3x7WZe1K4@nvidia.com>
References: <20221111120501.026511281@linutronix.de>
 <20221111122015.749446904@linutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221111122015.749446904@linutronix.de>
X-ClientProxiedBy: YT4P288CA0080.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d0::15) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SJ1PR12MB6243:EE_
X-MS-Office365-Filtering-Correlation-Id: ffcf3829-41b1-4728-ebcd-08dac7fc94cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	oagMb0bbCZTArfUfIKvbfIJ/9KolbxW8hKEHHsiTDdgaj+0sMcEAplI2gAgA1zDfNgxAwjlHdQgXp9TEwdjsL0vAjgyLLLICNpGFfWOB8KdSF+Mcj4IXj4RXuTfkuDLzEq4BclhOIrsIdMHNR8SPX1nX1GP2arhWxCePDmaLQk/Ol7GT8GP1MXTUELpiVqVahYAPSANUXIxg+KELA7TRIWRMGYDllaanE3KgfQC3gzMG38oCG5mRuNlheJtFbXiK3H0OkjQCv2M3CzMNftB/0cH2s0j1rtYT2n0jshVPzGTnSoJzSFO7IEzK2CB47qwNUtFHNXw0N3/4irrriWXse2Jq21k6MpFAorOts8hdpIT7k4RGmea9/Q/LBsHWfcmEAs+BXb2U5Exqrb6iuzeye2Jujm/B6QDBZmJVSDC0gmdByX9mGwIFGlFlowe5PSMAsbiMW2yOSeibGd5WTfkgDuIkg7VccSi+86NvqGXCmmX7mawbMJdEOIdtkQ54SsIXJQWfw0OlexPO1jMwdlY6NCrEBpNa8XCkvdUmxqrnk+UyEaDG8f2eOqnIjxFwS8PA/Hy2EEDlcAnHFBaFRlZBnt7TX6nmiFrk2tm78bcAjeOxI3CzM4rZBqqsNXpWGU7aM8Ag0oLomt72uY79aP9eOvJB3fLoIkOnOeNNXXZYI37vuZZ7PEQf1Imf+6DDHCJHLn+68Nf+1hm7VGxMpFMhew==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(136003)(396003)(366004)(39860400002)(451199015)(6486002)(38100700002)(2906002)(4744005)(66476007)(66556008)(66946007)(41300700001)(6666004)(86362001)(8936002)(4326008)(8676002)(7416002)(5660300002)(36756003)(316002)(6506007)(478600001)(6916009)(54906003)(186003)(83380400001)(26005)(6512007)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?xj39xdBPof7A1OW+MZi90fZ7/2SKHGp+4hpNGNncAOm15u/LKlIPjhujKhjP?=
 =?us-ascii?Q?und1ZxsM1bte5JKx0nxXS7AnvdkBscEVjk/Rhu/JVtRsv7Pe75+PGRpH2dS3?=
 =?us-ascii?Q?zKb6KsKmXOcOWwlTdGsn75lvGlAF3vEww6ka2/73EOpEydCFHU9pq/0EePd4?=
 =?us-ascii?Q?+k4Y4iLgZPONb3dch219KHdwDpV5+5qeU5EhaJ5JRFg4n/AsqDujiyFm7wqj?=
 =?us-ascii?Q?M0OuNPV3SO78katFvzqmTKp4BFgvJOvLv2wEPG4bHFnvgPerWjonjvLiiXLT?=
 =?us-ascii?Q?UxI7Gksp5zdKme6nV5asivuCxq2Ix5drPbCsGZrijClRZadbjPvG+0W+ELo+?=
 =?us-ascii?Q?GjdOanMQd5Qgvwk2GL/2wrz+WnJlFUrxjoFQg77+1hIZyvL6Q2c3rfQnwPpm?=
 =?us-ascii?Q?WdHrIUBy9wVpKFLzGTKU1ik5e0MixFAVCloF61Xzm+5lR1qTE0IsusPL17Wu?=
 =?us-ascii?Q?8Or3mJaOnEwTscJsV3IDH5QpOC7RqdHj5nSjUNRWmrHcBTxlahPkwir/t1z7?=
 =?us-ascii?Q?k58TWq1prSbMf2bqe1R13VbWfxYTDRrHcFZiSn8mFoqEivSuTVy8mhy7GQRE?=
 =?us-ascii?Q?GhhYXj0OXEf4XZZgpzy1+RKwsTY5utOC49jPunMeil6SjeC9KxhaArqMvKpd?=
 =?us-ascii?Q?ARCuLIee+ZR77seLHVGB6UCaUMA9RMRa2qvvb2uKo0TboLmfJTjMuYZPqvGh?=
 =?us-ascii?Q?c1ywHxpMKsUbswVfL3T4GJagYg1El7zl02UEGzt872Ax+Oj1PS3iMOB0wUL9?=
 =?us-ascii?Q?tbZZapbS75uwowjajZBK0CsEdQJsoW8KsoMyVDOGng+sTqCQl0gnz+6eWoaT?=
 =?us-ascii?Q?IA25BgClPuvkSPmY2QTC9x2a0j8MDIj9zq7xYjpKINI9MeTNdYryDwr9kpcL?=
 =?us-ascii?Q?FvdRSOVf5HtkVFEiuSM0mPcCz7Z47FrWeEWApb5DCgR0sfHrclqv5MsiZNTV?=
 =?us-ascii?Q?EavjjwTlr5LW1EGOUTDsQ2iBffcE/+Zmn4KcDoAr3UEQ08SiXiZ8C7KLpoJf?=
 =?us-ascii?Q?ge9OwoPBW1p20mA5Jpus/CL7N5UZirAt+qQ1pZB/QQqIMOgU3ldte9uLJiM6?=
 =?us-ascii?Q?UibSE46qq9rGU2QM/N6xKt/T5F0/24zs8HNyA9/nZXyKXUWQaY34UHTZAqMs?=
 =?us-ascii?Q?2rzuqDvWItXZzRt5pxSrZ+R0gAgq+Osotp7f5+EIhuE0w7pgTuPN81OFW1jS?=
 =?us-ascii?Q?v0HpfoiJRo7zkIFAVXWuWCmlm9Tahj6hOqx81rW0nIDW8IOQx6A+7cnDTRWU?=
 =?us-ascii?Q?95c7t1U1pSjdokvbo6ev3Vuk+YQqZ09MYJOYfdQ+pAAM+Riwx8tWTvVgkI26?=
 =?us-ascii?Q?hKVBjvhytu5q2PNrwjNGQ5Ztg9+Z81S7TWeuvcdfqTu9UurQKJugW6nYsW6y?=
 =?us-ascii?Q?q5I0FYPRvQ6OSp/omwRw9GSEVGun9H9FaRhcMbtElrugiQx22NB7xvT6GzOV?=
 =?us-ascii?Q?OH7zO8t/QJ8HneMxjpydBjnWC7z+ZR4gJrLuiSsIwLk3OrQL95o3i0cEMohT?=
 =?us-ascii?Q?MzzP8Hte3Ye16EBhwB98fTFcZzwgO1wPyZoJF7Ei0CXNSgMbDgBiO+eFsCtv?=
 =?us-ascii?Q?CwFraHf8o9z7Vxnb6Tm2LJwkNPPNU5rZQF9jrRKu?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffcf3829-41b1-4728-ebcd-08dac7fc94cd
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2022 18:01:27.0899
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: saSQRht4UbVwZgv8kB+oKfKt/XqW+lsxlXdMnNsfMaL1dxQPMRJjSpWV1okgUFr1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6243
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

On Fri, Nov 11, 2022 at 02:55:14PM +0100, Thomas Gleixner wrote:
> All these sanity checks are now done _before_ any allocation work
> happens. No point in doing it twice.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> ---
>  drivers/pci/msi/irqdomain.c |   48 --------------------------------------------
>  1 file changed, 48 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Much clearer this way

Jason
