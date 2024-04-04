Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC93389865B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Apr 2024 13:47:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Hbua/KuA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V9KcY3f7Vz3vgm
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Apr 2024 22:47:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Hbua/KuA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2417::700; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20700.outbound.protection.outlook.com [IPv6:2a01:111:f403:2417::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V9Kbq07TLz3vZB
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Apr 2024 22:47:16 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ODPKaqFV67ojdM6EHR2zBK6avAqhQmHp64G6dZcXRA7EmjhoUeLQRJ6k3PT0n3MeBbLcU7daYUyBGAQe9mhPg0LGgLsFC6fuFACEJJ4nx125qkEQu5KsB/Wy5/WHBH8UIfedcb0ci0IsxWJR7cIuGgYWEf3aDQwh+k11x2khIL2Oknih6AMQO3AtYn8hZ9lRocLuIgjt4cSF321n7gszRVCP/FsrcwwNukq0q9FsP/N1zyTzCgsUCfJM8EVuOoYVkannxXr9V8pjChaS/PAl4cTIvTWgOOYWbr4DvkLdVCiUplzajiioICG/DyZPo9lPrsjNLb58y0RxjyhSpHNXEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jDVLRVBwfIkXrIF5Slkpfvy2bGm9/+fZdo83oNPsJd8=;
 b=fkti/VWT4VARHkUlNMBk2Qtpk2m2v6MpaHuFFJ9ICogPBuSLLdT/EYgw/rTciAt46iOQPY0tV4Ge38hz+fD+uXUupseiHvNx5HbFqhfYat0aCyuaVZce3uF1KsX3BEPceT377//0Bq7WK7SgvOBv1qj9xLQ0ljIYIWgTXKAqbcYLyp9gc3aJ39bgWLXQ9vdaR5MhMlAAVaHBX3rJxSGAZ9IdfcOsLm6B3Mg0zcMkDthxKC+pVJQAS4DjFEmAdA8Lfzs+3us6Kda0kFLTise9sUL+AjeiSgjdsepEfHSI/CT4/Oisv+DOpheBCOA8Uzy+839WA8+G+xOH10Dj66NfiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jDVLRVBwfIkXrIF5Slkpfvy2bGm9/+fZdo83oNPsJd8=;
 b=Hbua/KuAviEZqzrX9Db3EqF0Y6XNI6Av50ruGBl1vTJjTcW/q4yEzYPvcLsNMaNWa/MsVghOcKZ1LK5NqiednmTqPlwPNZWhE83sAv6lBHXcUvciGTiFX/iViODzFI+ulhCWAMZ5qF6iku+zgVtoGpEwwDG8CNENjx87QlYZSEluIKJgcbUzz53upkvNkDX2mnCrTxxF7hxqmPUVo/bg/G/SwVePwuzqbH9/2zt9hJr6bhJ20OBmHi+JLe+Ut19WFd75cZ6+vwBNOICnEjJyp6+4UV5y1n5bmmdy4VzyW0LuU9vdk4udtn4p3SrxbusDa7NMr9oQA03TmdhJ1Spl6g==
Received: from DM6PR12MB3849.namprd12.prod.outlook.com (2603:10b6:5:1c7::26)
 by SJ2PR12MB8181.namprd12.prod.outlook.com (2603:10b6:a03:4f6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Thu, 4 Apr
 2024 11:46:54 +0000
Received: from DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::6aec:dbca:a593:a222]) by DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::6aec:dbca:a593:a222%5]) with mapi id 15.20.7409.042; Thu, 4 Apr 2024
 11:46:54 +0000
Date: Thu, 4 Apr 2024 08:46:52 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [RFC PATCH 1/8] mm: Provide pagesize to pmd_populate()
Message-ID: <20240404114652.GH1723999@nvidia.com>
References: <cover.1711377230.git.christophe.leroy@csgroup.eu>
 <54d78f1b7e7f1c671e40b7c0c637380bcb834326.1711377230.git.christophe.leroy@csgroup.eu>
 <20240325161919.GD6245@nvidia.com>
 <6e16e042-0143-4a52-b4b7-09cf0022bc3e@csgroup.eu>
 <20240326150118.GI6245@nvidia.com>
 <9703878c-c0b0-48ff-a356-d43e8f7391f3@csgroup.eu>
 <20240327165754.GM946323@nvidia.com>
 <dee0b89b-8daf-4003-b26f-f612b14012e0@csgroup.eu>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dee0b89b-8daf-4003-b26f-f612b14012e0@csgroup.eu>
X-ClientProxiedBy: SN1PR12CA0111.namprd12.prod.outlook.com
 (2603:10b6:802:21::46) To DM6PR12MB3849.namprd12.prod.outlook.com
 (2603:10b6:5:1c7::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3849:EE_|SJ2PR12MB8181:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	yzrcdYRsrt+a6W34Ub9erLYosw44ewQGVz6o+anmHnLVLWpnd7OvyIGyhu+2PAzdm6E5ttVX8q2Y43lmy+q0pcqTdM7wXdQIN44AgkGhY+72hc+1jcklNlj0JAKoYTg6CJncHG6MngYFMj+xG9Ch1rRfB+RsskBdAdti+iEoyvUnYQEBCY9mNpRbp7zeUzZqoc/iX12gr8lN3meSVrcJ/kCFSz4YGzu/XVd+gt9Qb1fr/mHQ/PGe939v6uEacPO/4/7cBkZdzxMx2Fy5bJ50W3HdXg4hgmCqH1WUAnIdRcQ9wc5nIY0NeszmXz8SGgIxP9JVofhkvEEfqLEHYqrZedW49+24WobXXkH6EM7OqfcS/TPq9HlsunzIiLLMAGyMRDD/bh1Kw6+KvLfnnkekEhuX/LpCnGNkU531luWh47XRkeKcgICQoCLvgDsH/e5/2wC7JuGYUMW3+edblgWwODs1NCQ0yNCpjzCy0VpCJ2IUzapijioooH8Ny2yXVGVbNcHlnjyGoxG++cTPj5sOg5/IM8DI33HrrHSW9Ladc9IZRmPdbCiFF92x4X/stJF1GbmQQTFc9i/84uPGEtRXl40DdMISZQ03Yco1cbSafgqAJ49MJnFFgBulSWDzBYvaPxvpiAwzFW7frVyCzXbFFK7zZK+vk9+TbPDgLLHu/3E=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB3849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?h8seUJdKwMtAS1IeSuM0VDx1Ky8IF28eKjAYNE0xQLuSCa6dI9HDKbuk0p7x?=
 =?us-ascii?Q?kacRGlUqz8G6B9IUy/AE1UYSPEAXm89UxCfyfI/E63ffGxOBFDUb5qVdoKVk?=
 =?us-ascii?Q?BqHYNrU3eEiOQ/YCv2E7UeBKGpWmlZbIZw9UqS2Aol65kA1FH/d0gQ7GRcoW?=
 =?us-ascii?Q?jq3L6LIClJnwr4+Jtxr7BkgB8xvBPj4ynpk9nXjStzaD1uRpvTRU3pJmYJDO?=
 =?us-ascii?Q?cqUCIAeNL20FEpDNr8K+nzvIE4ZO0D6WFnC51E5lX7ouNE9L+MUbQIdT11BK?=
 =?us-ascii?Q?RvXjxdtKF4s77rphsXoTcfXb43pHgD4PknlYVBMZ2zhWI6YIuIzVhTmkbH0f?=
 =?us-ascii?Q?PaklWN4r2m23eM06RypdI35Dc5VaXFoETJRmgKcfch4A0lGrYGJWaDPc2vxa?=
 =?us-ascii?Q?zEOxeHpLyGUkD+lSG8qFJjurOK1QHeQOJCOs3hP6I9fz0zsuH1QovEdkRKms?=
 =?us-ascii?Q?ZEPJyvBZcrovhmrWfK0u93unTOwuUMYQm2jLC6HFlMaD15ylYTb8/0Pgg9k+?=
 =?us-ascii?Q?vaA/ER/HfsdHk9n/cWjGHdQTQKXQS5vJt1ZUFk96ZfKyLjnv2Obd1uGS3upp?=
 =?us-ascii?Q?AbEcXTb9uC2aKMZAe0BaEiAq8kVEd3Fi4gM8iybtIThKhxkkgYf8iAbxzxLn?=
 =?us-ascii?Q?WiNBZ0Ji0bCBTSoQnZyoDkTnzxeS+lCzBPiUIFNRuaPxlhmszasWCTSOANhU?=
 =?us-ascii?Q?8As7Wmmq+VNwmcgyKJ5fMsmugJOFP+atZ6oWQ5BMnDXWPjJM/chcZj6k0fOG?=
 =?us-ascii?Q?DRJaQsGNoBBC1pzScgNXBNoJdS6xiPen3Fc+tU6Fdzs4nPOl6cqH17tsAGW4?=
 =?us-ascii?Q?a6BrjnJubV5sW2fCnEUYqUdQea89tQPG76/dsZ/I5q+GhRtvTTNS4YS7I9dz?=
 =?us-ascii?Q?dOfEl6vASA8VJ98nZL31QhnFv+RXWpDbIbdxsy2QzUalQORHKc7V/Jkn+RdH?=
 =?us-ascii?Q?mng7P98SWRgDtEEhH3TO7+qARJYAx06KEpS/XKIOy9N//zRySGWAinfwfyNf?=
 =?us-ascii?Q?4R5SD4ED16YaUWpUgeLawm6YWNUCjGTkrutR7izY/p+0GDipLLsHVqHevZSH?=
 =?us-ascii?Q?7LIOEa/VNKjq1kudLMSOI0WjHoJogjwQBWrCo3g2kX4AXsxn2m1bZ7qk50zm?=
 =?us-ascii?Q?2+hof2JJ2jNHFNc/y0qnGdwePX+Oc+t9R4SOmFG32JwwgoWi8UC/GsVdIS67?=
 =?us-ascii?Q?ZJwThMLiICJ03gQUIx5Sy//kknaxmQD7ujCXgRS14ifshTQwla0SCZkf0nfT?=
 =?us-ascii?Q?NuknwE9zR0FUXr3n4AOeqlh9bQzbSl8j+ffTJzMkbtf0bZRTXWcqvas4wJgY?=
 =?us-ascii?Q?ydT/m5DcJiNT5x3PMVAWY5EmKzCjfVagX3x60kipXSL25jdey8B+D60Dk66A?=
 =?us-ascii?Q?z78ONkAsDp1TomO2zXmC8CMD1LPKfPnxC4M5BwroirPBwativxRJVjoB30w0?=
 =?us-ascii?Q?Y7s3r/td+eqH7Py55TxbnTVfCagH1icBhVHd73JOz9VZKwftG7bX4xTSGfX7?=
 =?us-ascii?Q?GncfPOPScARf+vXgPVlhAKeT4YM7kEKI90ultnkxTT3noM8m4y3F1XTpK7NB?=
 =?us-ascii?Q?WQ5CuxXPsii9u6NbFaPAr2SmfjDecdSKaQId07Pw?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0d3243b-4ac3-4cce-bd86-08dc549cecc3
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2024 11:46:54.5446
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R6caJb69MrWzhHBQAny8WVnrggL9DzUPmCGUEFtgFEBrl/ds/OxNTD2n01/AkwQy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8181
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
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Peter Xu <peterx@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 03, 2024 at 06:24:38PM +0000, Christophe Leroy wrote:
> > If it is a software walker there might be value in just aligning to
> > the contig pte scheme in all levels and forgetting about the variable
> > size page table levels. That quarter page stuff is a PITA to manage
> > the memory allocation for on PPC anyhow..
> 
> Looking one step further, into nohash/32, I see a challenge: on that 
> platform, a PTE is 64 bits while a PGD/PMD entry is 32 bits. It is 
> therefore not possible as such to do PMD leaf or cont-PMD leaf.

Hmm, maybe not, I have a feeling you can hide this detail in the
pmd_offset routine if you pass in the PGD information too.

> - Double the size of PGD/PMD entries, but then we loose atomicity when 
> reading or writing an entry, could this be a problem ?

How does the 64 bit PTE work then? We have ignored this bug on x86 32
bit, but there is a general difficult race with 64 bit atomicity on 32
bit CPUs in the page tables.

Ideally you'd have 64 bit entries at the PMD level that encode the
page size the same as the PTE level. So you hit any level and you know
your size. This is less memory efficient (though every other arch
tolerates this) in general cases.

Can you throw away some bits of PA in the 32 bit entries to signal a
size?

> - Do as for the 8xx, ie go down to PTEs even for pages greater than 4M.

Aside from the memory waste, this is the most logical thing, go down
far enough that you can encode the desired page size in the PTE and
use the contig PTE scheme.

Jason
