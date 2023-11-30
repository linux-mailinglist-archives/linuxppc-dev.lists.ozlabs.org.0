Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB237FEEA0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Nov 2023 13:09:07 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=tkK3iflv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sgw3457dhz3dBW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Nov 2023 23:09:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=tkK3iflv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe59::623; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20623.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::623])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sgw2859Q6z2yDD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Nov 2023 23:08:13 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H0ierRWbva/yzhJKTbXUcqPPrcbU5R5lqSgDF2Mg6pI5keTqdQcV5UazIPBAB5VVd9lWR/rSky3rCrvherxRcuTpWgC7ra811Yby8peB977coaVExRnjcggTG5QTrUulgCrkox7I8/+Vow8Tp0/kPA+Ec8Ar2IOYf2rwyWo0QYv0JBRp/Fs3KdxqOGOY+4zQMqwN1aqRzsZHiqy1kM35KcrRBHWviMTsatKJ9qbXhx0N4hLGRg3kJ8YP41tcSnIUS8TNWHtY+c8Kdqttb3LcBMIENl9O9BModoTZ8W3YdKGQW2eiWKqPV94eQNTUS715QFSDbDIyhtXG5TbED2qwrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/bf+Eog8H80/LYq0vgSrbt5YRK9tITMPAvNJQ+r7N8s=;
 b=WzKYwgV0ZuHhVwTUjf4rP1gpCczVOF3XBgDoFbCeAcPYgOkl2MLEhbXj15DOrTbWGP0lz7fbyLOjMEcLQ2v564x9XR6L94wRdNJpLpGV/dE4QKb4cv4eSDqAyfbYk3OQ+P+xK5UpcAwYzSg1iAQO1d4/qdxV99QZN+IhINQ7dPf4FDG66zCgrdS8A3haErD38jsjeXYg7rMehJ2hzP0i+wT9KE+s1VVltHc02mPR+4kWEzN8+/YlmF7vF7aKtfbnM9fnMxMhvXZJX5tavSJZ934q+5b0xZgSwAwZfnaZzTVsK2uMyVI8BPdLDu2ON6+TNTo5YWnJXTgmC2dDlRAYqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/bf+Eog8H80/LYq0vgSrbt5YRK9tITMPAvNJQ+r7N8s=;
 b=tkK3iflvhmd4W0N5upR95GRWyEeukoKi4ZKpIAEeD6CVdI3bKl0q9XAU/uxv3mwi9+GrQr0ZPt3bTjviWp1YqzSL+xrJWXl8AT94IGTpljuQn5kAfxWf90+WSVOvDXPesXRe9+Q31m/SFWWppH16nYTsqR2tPtp7pJIS8fcJhe6Nsge6x/z1q9dQBc0sr22mELndUDhSqjpfSx2yqVY2xrAKwgzJqgT8UaNVD+6erlKWz7j9V5jquEkICteNiCNwiM7G+CuC4oDEE4mB9clbW0MECsDiw0rU2CGyZ2eJxFSHJ1HT35t2SwITetkt+n1rcJmiF6iQGmxx/11vCGw6Ag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by DS0PR12MB8413.namprd12.prod.outlook.com (2603:10b6:8:f9::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7046.24; Thu, 30 Nov 2023 12:07:45 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::60d4:c1e3:e1aa:8f93]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::60d4:c1e3:e1aa:8f93%4]) with mapi id 15.20.7046.015; Thu, 30 Nov 2023
 12:07:44 +0000
Date: Thu, 30 Nov 2023 08:07:43 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: Ping? Re: [PATCH rc] kvm: Prevent compiling virt/kvm/vfio.c
 unless VFIO is selected
Message-ID: <20231130120743.GF1389974@nvidia.com>
References: <0-v1-08396538817d+13c5-vfio_kvm_kconfig_jgg@nvidia.com>
 <87edgy87ig.fsf@mail.lhotse>
 <ZWagNsu1XQIqk5z9@google.com>
 <875y1k3nm9.fsf@mail.lhotse>
 <ZWfgYdSoJAZqL2Gx@google.com>
 <20231130011650.GD1389974@nvidia.com>
 <ZWftIIEpbLP2xF5H@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZWftIIEpbLP2xF5H@google.com>
X-ClientProxiedBy: SA0PR13CA0023.namprd13.prod.outlook.com
 (2603:10b6:806:130::28) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|DS0PR12MB8413:EE_
X-MS-Office365-Filtering-Correlation-Id: b2b859a9-1fbc-4b8c-842f-08dbf19cf613
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	SdZP8p2k8IxR1wCTPNTV01yFiZNR9CKGkVWtvnUpLdFwzd8KSypB83JEcAyoLgvnLlUuet5zj4R+K9ar7QrHRXecoq/BHKyFrSdyqNBbKXWSAT5xfB39qqCyZOF9hndEGw8dxM59QuuJUc2uLyMErKw9PfbO/+qDf4ip8T2z+rAZZm3Gut3URzwD0lFmMjDOEGsM/FmN5d6LNx8FhOuF1xTgqAgr7G7rSOYUhpZBGNXIn5icn2kzN2fMbngLiafXNp60Mp6+vsb/D/5uVJhDYGvZkCCop4JP/cQ1uFZtf97jvyUc45T72tJPpkNkQNIFpvmpFwIzEehbrpiZBBGYQYWkAozg339NGPwrG49fgOO1lVLihbVEpoVt7UOjX+7xiltA8VAq8HcqoKhjT/jLMiKw37xBF7uZ/ZKI6Wk/LUzp5CQ8U/FmhVGP5qVXsWX079+1XQJ9uqhZnTggkqcP5vSZ6c1RWqz4u7usNgznQkyA5Q11kIcJ0Muc2Og43sDt6ISQxeGDbxqW4DECvCVGi3TQuYKtVgoQ6ajFsCPNHdFvoeyQNYSyVRCk8TcthHh4WJAU6s82UUUVvKK9ECL7kE5hhiHkN/1QD7z2T/wG3OZYpGT1XOTz9Tg7fo7rmaVq89zTXXMjYxyyJlzlysvC1V3QX0r6s9Ev1yfGNNMLJxI=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(136003)(346002)(376002)(396003)(230273577357003)(230922051799003)(230173577357003)(1800799012)(186009)(64100799003)(451199024)(1076003)(26005)(6506007)(83380400001)(2616005)(6512007)(6486002)(7406005)(5660300002)(4326008)(8676002)(8936002)(41300700001)(4744005)(7416002)(2906002)(478600001)(316002)(6916009)(54906003)(66476007)(66556008)(66946007)(202311291699003)(86362001)(33656002)(36756003)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?j1DuB+h7uY/Ghdp9YIiRQs8QKO5GQjBXN0LGO7WQaLVm+NdJzl22btnkhyvg?=
 =?us-ascii?Q?ygJnG+q2WBq1Y9tNoZPRERVrFeC1uBBnSP3ORasb/mg/B+Y23dw1DH8G+pJQ?=
 =?us-ascii?Q?7Lp1XAMtPfFUuOsC+/FaA+ojnUbb5jrYaQ3nbFN9+kSbCl/4TiLgKfQ6XVlA?=
 =?us-ascii?Q?lQoUYCzyApBz227BS+hLMgrh199BRdzqMTxHURd5TARYBDxQuSUZ3CZ5hcTX?=
 =?us-ascii?Q?zbl093zqyrXUGYdstUvwT2Ez0cdaEgUmCsUGblettnLREDypxbrnRGnpBuva?=
 =?us-ascii?Q?qAxuxY2LE01hl5atmJ3Twktp+5sNMqBNiQEqOnyRJv5NIDL6mFxbPRrRltDi?=
 =?us-ascii?Q?xm5wjLdvz8zpsEoQl9Ml/zpSYtMvYu2MU2RGbAHmocLq9Z+afyQzB91uCvcL?=
 =?us-ascii?Q?MUtEaILJd3wAxNTz7BgxHugU04rZykp0A0srfFda0ZNsM1gf0y8Hol99VKNk?=
 =?us-ascii?Q?82MAS6CGWhyoqUiShDtKibUmVOvPk5Nyo1zKueqQQg4VXJUFCpmTHoXRy+Xe?=
 =?us-ascii?Q?Y6jriHuEt2dumScKiBt6rWpW86o1IaeJ5TlFnZzBpi2NAe9niiNFkc8RC9rk?=
 =?us-ascii?Q?Yd7EwDeQfpBIRLxBbegIhfy4XG5iBvRTwXzdfb0G3P+QIfpr+QLX2Vj2SBNY?=
 =?us-ascii?Q?K9Orud9xElSgCbQ5ECIYx26/B1jkphxeoHje3hk5MWstXfrb1s9pNtVqTSE3?=
 =?us-ascii?Q?En25V2nWD5U/A0tRLoQkazKU/W701pWzTTpPXwP2NIIhIk/VCzrMnyk691V1?=
 =?us-ascii?Q?/nSMof+9M4YM9Ey393wVvmjG8BEuK5fwfw4TGNVhzmTFQIA+jkb4hDp69RLn?=
 =?us-ascii?Q?OLWwrRl/oBxCm9rz4OcY9szyCxesdFe2dI4xhXCy4J3XyIpyLQdychb13ArI?=
 =?us-ascii?Q?xZ7vbX87y0V1D2/88rWo4pWrGdBfHWojzk82BO2dRMu5Zrs88xPRoLXzDY+l?=
 =?us-ascii?Q?owA5tAlIsQ1nXgq/S2NPVelpvHzfJbIoBkOm9IyB3+3OnE3X4TCxhYEUyV+w?=
 =?us-ascii?Q?NBKHVHpGQsjP4xq0pwvTqJnv1/HNwle653GsGBSR51j/qbqxsW+mrGAKNgJZ?=
 =?us-ascii?Q?W+CNRKStAe3B1ZdNhDYZVITK6W95RAMnnrv2Gr658nb2uEU6HlQTldvRURoc?=
 =?us-ascii?Q?HwWIk8mjH7wSFJqhPeB6YEFc6zD+G5krkLhUlORMxHibL2T7SHv37qHcZw+Z?=
 =?us-ascii?Q?ZIG3jQEPWESu7P8eJfRBnSaLgDATB96MnLo9DNeC8RXV9XICNvhnCrpHx10g?=
 =?us-ascii?Q?W6JvqauW0QWUPooN7YVkuRQvOJW0K5ktjM+oHNTqXrxNlRERygFovs85wo4S?=
 =?us-ascii?Q?n+i5L/9sKv1pDHOuEuY/pf7EKVQcTEE4M0Gys4hIE8GwaK0CH4pCgf4pWRkl?=
 =?us-ascii?Q?F/hng9j3mJ6AxEL6f7WWflQx/Kqw1LlzS3gwFHqlK+3rqGbGFSSEr7AxO0DR?=
 =?us-ascii?Q?ME0Vm+5kZTCGqSS1KF2nfqlQQKn307HeoAAdyn7rBYfyRN8DAbDvsWc3ihZN?=
 =?us-ascii?Q?FPkxZiB39vWFzlT67VpkN0MpCztdC45n0l6bc/l72s3zxXrp+I6hkcmonIKJ?=
 =?us-ascii?Q?vK1FJ46+2rlLPq4gjC2OsJB3dXlv+KISvFbFpUuZ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2b859a9-1fbc-4b8c-842f-08dbf19cf613
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 12:07:44.9575
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E1qqUaKUshzXuz+Ed62sZnrDyvhVpLdaXEknGQG3/tGqYPAM1+ZIMT0aMl+yve1/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8413
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Janosch Frank <frankja@linux.ibm.com>, x86@kernel.org, Ingo Molnar <mingo@redhat.com>, Zenghui Yu <yuzenghui@huawei.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, Sven Schnelle <svens@linux.ibm.com>, Marc Zyngier <maz@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 29, 2023 at 06:02:08PM -0800, Sean Christopherson wrote:

> > > Ah, it's the same warning, I just missed the CONFIG_MODULES=n requirement.
> > 
> > Oh, wait, doesn't that mean the approach won't work? IIRC doesn't
> > symbol_get turn into just &fn when non-modular turning this into a
> > link failure without the kconfig part?
> 
> Yes, but it doesn't cause linker errors.  IIUC, because the extern declaration
> is tagged "weak", a dummy default is used.  E.g. on x86, this is what is generated
> with VFIO=y

Oh wow that is some pretty dark magic there :|

Jason
