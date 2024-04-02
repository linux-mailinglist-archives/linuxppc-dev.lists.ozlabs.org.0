Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C6A895FA3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Apr 2024 00:35:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=UVNWjPNn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V8N4m14cyz3vkh
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Apr 2024 09:35:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=UVNWjPNn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:200a::700; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on20700.outbound.protection.outlook.com [IPv6:2a01:111:f403:200a::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V8N2M4z1tz3dSj
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Apr 2024 09:33:29 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UYOJ629h/amg0s7ZPF2q8XMdeds4WOpr8PY6D5SVO0eY675vBLyGxpTt75dqSfRYmhD47nhcZWqpzC27BzEjU2O5R7ivP6QUAiGi72d7cOEYH5H7wW5uootptDkfp6DZ7byWokat5FDcxX6BDS5QbuZrqBiJ6JThdJw2DuZuxHI/2Q8mEbOQXhl4yFh1sjQdZc5FNlhg/Vri8X5/xdMv2XbBb7hhg/AX4PPftG1DRxYga8J9pfeB2ZuRwiDBsLZayM8UhgcRY1+OAOOAayq9GabCtBmJgMAY8DsReoqdp4uBw/JI5ambgvmB3TP2D5vpCuQEwvbQeMJRZjK9N+nTXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FGB3RLPha+QguM37KHrWQnEz83qU88FPV1ll/mi651w=;
 b=XStSNyVlSBhq091zkeKOMh19yaAwfVjdgoLv2Rio3zOxBeGp3NPjNG7dqKh1gqbrgAPEyt7Gs0VtCKSlRolpVfzY4BtvSr27yoRiTpO4QJRSN63MvTfw7rR1zEUJKP6V8qDigrjIhQddhIsbwAxZ9ztUpFZIO1Y0OV28N3vS7IKtfV7Zq3cvkqrBMbqpAu6o+wxyFaFS63hbk82uYT2mttEVUgL5pXzMLhbNkZKS5kVF40Zk9YN5Jn2jHKMnSZLmjVFmCuT4ailBkBHbLIYE6IANdrTIhTGQtWZgURC6q6N7mNBjuv0a27VvdT0lKwtJMGFInKOatTDK3W/VfHhPXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FGB3RLPha+QguM37KHrWQnEz83qU88FPV1ll/mi651w=;
 b=UVNWjPNnNVEYLbtYCDLJ8H3wf83f/pqH4rn4pS08vg75icyFpEr/ihLbbfagfMVYvRhIi4fojR4uE4or70cc5bQU3pQjU1UShs30ctobArbKh/dlm7Flza/71aPQudtZ9jIwx4oqEJ2L80iK+zspceiqOvgK+o9axwBNA4s08a5OaFmCAl5awVtQrVG8uZJQ14TEo4PyGXBI11bQBKtt+655W0oITOFlf8K6j7xT1oijARkqNVWCt41NhcXPJ4+MPlBFNK6Nhal1dIYbTfsn+cgKVy2VR2NOn0jPDoiTvyo9qzOz7ujBL66cvuLsO+vHWKm/p7SAu1EfViz2P7KvWg==
Received: from DM6PR12MB3849.namprd12.prod.outlook.com (2603:10b6:5:1c7::26)
 by CH3PR12MB8305.namprd12.prod.outlook.com (2603:10b6:610:12e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Tue, 2 Apr
 2024 22:33:11 +0000
Received: from DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::6aec:dbca:a593:a222]) by DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::6aec:dbca:a593:a222%5]) with mapi id 15.20.7409.042; Tue, 2 Apr 2024
 22:33:11 +0000
Date: Tue, 2 Apr 2024 19:33:09 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 3/3] mm: use "GUP-fast" instead "fast GUP" in
 remaining comments
Message-ID: <20240402223309.GS946323@nvidia.com>
References: <20240402125516.223131-1-david@redhat.com>
 <20240402125516.223131-4-david@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240402125516.223131-4-david@redhat.com>
X-ClientProxiedBy: SN7PR04CA0217.namprd04.prod.outlook.com
 (2603:10b6:806:127::12) To DM6PR12MB3849.namprd12.prod.outlook.com
 (2603:10b6:5:1c7::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3849:EE_|CH3PR12MB8305:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	RsTJpYBxlc+FvhCF0ewsWfCr32pQpVT329FpXDcQJnt6HHn3yAHHzvsmjW/9vQ78lUGUThIDKYBU1Z5J7UpOK82O1GPZmqTqvxs4WNGSx9c6yqcNLfbn183vX3NmwOzANHlhpIUkqXcppV2WESi5Z5eK2DXOSeup32dOJCXjcT+Pb2/ZOnTDiFrB377K8oAh85c92L++ylePcL7qrridYIyOyXkLQlIHLW3kFGohW9pE87KnboUbkf1VrcMoiSCfNBsaqzHjqG0e4WEtqpwOsZvROlt+YJnbgKliVy3fKiHGEMX9bbRfEafir0ivQYPClB5SD/DOx2MEbhZ/qojFaoRjeQugeKGBYWov4yin7TOfxwU5b3MYWYAzgDjqKfSOCOVErnYCHAd9ysbKKwTdfTmdht3dnUvoXBzZQCkIRPCbhXD8Yz8soQQ4RR16BWxv0Sq+4do8207LcepI76XQpYKUDdTTcLXQXZyxnGMCK/Mj+2I365BfKC0I4HKYT9wtM0FkTF4nb7kAEdGPEl3UH0s+DkjBKYoOqEd51iagqI82ikZWg/g+7qa5kujDzsrb3RUSRPy3Br9cG9FgO2Fzb1OYypJ3EBQFZtG0V7tDDAKZhzi4gY+BHoiwU/zVapyhTSASc0dYUK9IQ0VqUji+BoDEPx9O21TdRdmkZO6tuxU=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB3849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(7416005)(1800799015)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?l26r7gx9+QyX16D7RsMRqut+KUdQkJdl099kxzSBRBpoQAjDwxKv/v/kX/K9?=
 =?us-ascii?Q?mrzHbAZFkJLgunD18kxgy9luQpp4d/oxk3SOEgKs84lEqKwjcHGaddJ3M++U?=
 =?us-ascii?Q?kmAq+lkak2ZZR4t7aI5KHP8C6aeQ7MDEJtc4ZgVVS5GtimgNsbx7NePClk9z?=
 =?us-ascii?Q?/G9t2VQfMCg/owMFSQge+vDkowPUfkZn4X3bFCDjOtTEPaRU0JTmGapdaDLA?=
 =?us-ascii?Q?I9crK0PRNJIbrVwLhCMBI0g/udHCMcQBQV+q2lowoTMmm7XEHMEgTUUd1cME?=
 =?us-ascii?Q?yJyhO1sFNOi04fqJiuH4Hsp5w1jZHvBDXl73lorR5ChkFGa8EhBBiyMwGyn8?=
 =?us-ascii?Q?/fRyiz+s9Pdwp8TSib2DdMr7sJhEXi9o+H67yl6HfCQ20SP9/fNaGjq58pG+?=
 =?us-ascii?Q?P6+462DwELW4t0JRmE8vTNPrQOONl+u8J6C1vBKp/JJ9Ws7CIWJmJ2pWGUQB?=
 =?us-ascii?Q?rj06ytd5qcWwfj4LkKau7A+ThrQOgMCmkeeYs0YECeqFsQbr+thtwJFEdvuB?=
 =?us-ascii?Q?GNpwhGCn/lNUzrZ8Pi8IidbooPYm7bb/+Ur3awRNr2vrLfgo1QIvck14WZ1v?=
 =?us-ascii?Q?zR/mER0u4f0FcS468fG1cR1SqNGefaZln/4dKk7v6m6DxZqwbHkzT1YFNSqg?=
 =?us-ascii?Q?aNeyXcWYD++vYJGxaXcsiEpAeuXPOWMEDu7Ruug7NImCiAhKR8F9JVpiWRLi?=
 =?us-ascii?Q?ROar9JSuNwgHq61ltlB/j93cEWz0UjlTWOPrqf6J4029LB6bSoOZc7R11iSc?=
 =?us-ascii?Q?Oij+Sk5RrS3z2tnlaxT1YszK4HgISXzA9Q3jo6RZMX+immGWtSIb1NU+37jD?=
 =?us-ascii?Q?WhBbzBJU4t9Rm4pLFIJv88N/UhArMoD6YzARsEnfWAr1Tjr/TF8rhI4H72rQ?=
 =?us-ascii?Q?NQdUSl1omQ5bx4RR9YWRZ/loyjqkc6f2PlKOse1Cpf1VNf3zOcOMgtWroVFG?=
 =?us-ascii?Q?0pUyrlmiergg5gQ7ntu2CDO45rkX0aHfuZOvE9aYEWmRFlD817L8D920Zwht?=
 =?us-ascii?Q?LdL2TWPkgmW+jUJsvOV4zsxTVMQ/MTLGBvPdAGZ1BhVtAzd0VQvjG8ZeG9sb?=
 =?us-ascii?Q?L9fnapY3XXYayHIM9Av56sUuKd93no/t2XyM4Yps9MiJETe2jPoKVb3ZwNMa?=
 =?us-ascii?Q?9LReSDP66ulf9qf/JYpymphN6WwSk22FlsFqLnoHKmNUVkhQlx1Dm+Ag55Sg?=
 =?us-ascii?Q?YbdPxBghSkjMaVs7IlZL8WwakxmjPXVIAz6ecAU5lIiNA0DLDF2kuQuboGRJ?=
 =?us-ascii?Q?wnadjYoj31h/4DWrtlXi4/DJmFR3A7rC8UJ4Z/+7nFOLoAbb4dkGsqangPbA?=
 =?us-ascii?Q?vsAmXo7dlNjvCLGwy8EdrJ2ZFf3l0xL72JQbbkopy7fmFYpfnni5CA8OdFfs?=
 =?us-ascii?Q?A0P2ZBSdWv+YmC/i2Cc/iRhd4L4lO55uCUXlGXgi7QlzfgwCxXg74sD0UJOZ?=
 =?us-ascii?Q?P9THXiwZe4311Db7rVJQEs8nzMiWj//kA0H4ijWbzoXkERmFOr1N4kF94mAo?=
 =?us-ascii?Q?TOJzNrXxFSq0Z2qKZCY/VJL98Q4XxuwKelyJPBmxKeATgIEh41Y5TdaeBGFL?=
 =?us-ascii?Q?J2E8Xp2I3LDGQltkphYi8EBQ5tivc33ACgA0PKFN?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16d2417c-72f5-40b6-3c8c-08dc5364e088
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2024 22:33:10.9973
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vc/703ML1r+wp4l1KvDhuMCnnK2uSaoYrMRxgaBfL0wr+BlPtXcgkW+ZGWRreTAV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8305
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
Cc: linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>, x86@kernel.org, linux-kernel@vger.kernel.org, Peter Xu <peterx@redhat.com>, linux-mips@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 02, 2024 at 02:55:16PM +0200, David Hildenbrand wrote:
> Let's fixup the remaining comments to consistently call that thing
> "GUP-fast". With this change, we consistently call it "GUP-fast".
> 
> Reviewed-by: Mike Rapoport (IBM) <rppt@kernel.org>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  mm/filemap.c    | 2 +-
>  mm/khugepaged.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
