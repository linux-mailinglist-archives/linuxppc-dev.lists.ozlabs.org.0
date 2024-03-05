Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F03FC872187
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 15:34:11 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=J1BA/WcU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tpyk95Xzgz3vZW
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Mar 2024 01:34:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=J1BA/WcU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e88::603; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on20603.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e88::603])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TpyjN72m7z3cB0
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Mar 2024 01:33:26 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BEKz1kt2xQfrTUWjKVO6Kb9ejJoEYfqbhCiNBvJYP6TbSI5FHwh4dHSDj/yy3VhIUNIpbNb7VHanegTaVV03HlEXzE0cXcvyz0C1nrMUDfLuJ2on9HEd5SMaST75zyv+VqWuKdHukdaQt93NGKu+9bh7Vl2RR0nD/11/2RuHv8dqFpjLr/cPScCSWzIFNRTGDG3HOe8bbME10FEV0KUigKo9upMLZMP0JJbO/gOvaixpJ48PSaZztdPvhrPk5gQKziYs1R+qHq++uIyE1WIS6jU5N98Zg+vgQjs9QYwEINelGaP0hBWuGdIH5IAFrO+uJux6/JeyOuI9GyAJujtDMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XjeRnNJXbQlipXi1ZJmRuedKAaTwAjrzBaLKfo5NbRg=;
 b=cTVQciXdmjx81/w0px20u0qKqr3tnhqKwfNI2GrKjWkKDCjKJokj9gWmMn/A7oOuOBhE1iy6SuiZWfCZouhmuTOEA0UPQyUB/jRnHHWIaIlev93Y0gElUtBsOfGqlPmiy0C1+G3yZJDEKB7lnM9H5xPoHfa2lUneM5zIfsbDS3IufZkngAXnYT/hu9BEhZEXfB4c474utp14TcB/g5m0l+ujbFY4viFYwC9YA2QZAsfdZUGYCbFWGcwPKTYkd/7vxWLMqB9ogfJk9qidlF90wRWIHb0IHlJHvqZlg0p2wQqJt4VknbH3d5t4AprOKIaedw0fQzJOncHXfdXFTcnWrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XjeRnNJXbQlipXi1ZJmRuedKAaTwAjrzBaLKfo5NbRg=;
 b=J1BA/WcUdZuHcBAlq1hrFJzWA27wmW57Sf8woOjWd9P37ErZlrAHblZDoHcF/QDUD+YtdSAMkFzUrUPR1PTT/2nbfeQM/+zU6SQMzax7EaiQ194xYzPXxpePj/GTQD+ihkzcnMII499N9/jPKih+cni1lUAV2ggz4rfSLs/rf7Da89i5mDRu5FAMrS7O6E0qq64t1Fm6FQd6o6kSmjOu3GELyLeNd9lE9ivRt26ncHAJzrxxVnFU/KVyOTmaobZrRRcT4IAe5qIB8XS0mjZIUnas8HW6onEc9buscdcrc2Jir8h/AgIZ0W3Z7HWV0v4WLsothcVkb7AJl0VHdVX/vQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3849.namprd12.prod.outlook.com (2603:10b6:5:1c7::26)
 by SJ0PR12MB6784.namprd12.prod.outlook.com (2603:10b6:a03:44f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24; Tue, 5 Mar
 2024 14:33:07 +0000
Received: from DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::c33c:18db:c570:33b3]) by DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::c33c:18db:c570:33b3%5]) with mapi id 15.20.7339.035; Tue, 5 Mar 2024
 14:33:07 +0000
Date: Tue, 5 Mar 2024 10:33:06 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: peterx@redhat.com
Subject: Re: [PATCH v3 10/10] mm/treewide: Align up pXd_leaf() retval across
 archs
Message-ID: <20240305143306.GZ9179@nvidia.com>
References: <20240305043750.93762-1-peterx@redhat.com>
 <20240305043750.93762-11-peterx@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240305043750.93762-11-peterx@redhat.com>
X-ClientProxiedBy: MN2PR07CA0021.namprd07.prod.outlook.com
 (2603:10b6:208:1a0::31) To DM6PR12MB3849.namprd12.prod.outlook.com
 (2603:10b6:5:1c7::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3849:EE_|SJ0PR12MB6784:EE_
X-MS-Office365-Filtering-Correlation-Id: f3bd94cc-2118-4432-f03a-08dc3d212cae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	AAD/bJwYeTJb6NcXt1+1HP68woKbPHM6SzvHb41WFWg79FhSpvG2Ahy6VBh8WQrD+wy4eILEsvud2TUGNUvkepZYqWM851bG1AYjU6Q6QqStQ3qGMEA6M4emWQywuNH2unhsdJUXD86QlgmnyDbGNzPqYMFtBUzJ8Bd7Q1mB1fH7XKXjOOxqsHvo2P0mUejH+2+PXHDKIZI7PuHA1H5HWYMIWEzj/TvuvY/PJ+Eg1DcBh9C+iIxOzkDaswcoHajZejbx08IPip5mZ5z2Asu9c3zN0lYWYrLWYCAS/2XVY4TitvJm49HZNWcTFhEEbyd4nsImrM/zKofrk1jaGrZHvbULI2MGgFx3vIgrCzqVQkzOHiFhkNT9BWgggK39oRYSeTrtHCd1DAI4W8+xLqPDFR6Zwoc+A78bG52B24giLVzXI64k/nVhi0pZbEbPCNDNEKRtHxsmi/9bvw4d0rIYGehwry2FHFepVFz7QsyAz+vOQbvZvgxHqlk2dPhFtWICvsDqsyboqx+Fg+adafiB0rdZRvoMsxaOb9qRmSVKhWgS4dS2rN09SpoxGLDDeJq1qeoXZRC1Hu//M7pAGF7rCqfM6GFeWFtAQOyqegq7cHp8MuhEeLXqquxskYxWa9Q1I5WbkQp7d2AQ8OE04cd50BQyKzvSYbmKMMEekXGFWK4=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB3849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?YcphlCYBpgIEgTSfr0jAKllH/O2GE8k32Ni2IItKezEcothMB+WGHJO7U00C?=
 =?us-ascii?Q?yvhU4K/4XhYg9VQuRSlsyJCGDyHyrsdbNUnd8Yb56HdbEjO9i9oRvbmCkG+F?=
 =?us-ascii?Q?3ec/AoAWyss1+X8DkokRE3nm+ZcdguN1PhVWe1xKJ7rHUwYlA6rYiaTDN58V?=
 =?us-ascii?Q?71xicl1u4RY23Eq7tBWzDW8fnorc49Jq8HWRsRvCmHIoJVJ7GsqlqGq0AuoM?=
 =?us-ascii?Q?J2Xup8LnoDRxScsA1I1wwHMk2OZfUiz66OArUwi8SJs7WA7Ve9JcWE7shxCU?=
 =?us-ascii?Q?KpLu2xVWvGO8auYbdVa5DcNGWtX/aU02fcg4T//4Lp4xb7wATqv7J68GmgQ9?=
 =?us-ascii?Q?BrDrnZESS4S5KPj5dw1Nj+oIwO20oom5gS7HMh212TNGMlQqes+QKYkomwd5?=
 =?us-ascii?Q?F/1VMChwW9bg+fsZ9gnSnyaRBHHSmt2Snp+rLp8r0LbLSlfhgE7/IyGffCNS?=
 =?us-ascii?Q?/vFTsLye7aBhJC147wq5DyC19UkMhuZV4OSArpzAb48SnkZZYWZA7DBlZU+Y?=
 =?us-ascii?Q?+nO6lV/RhdBLc2w/d7SUTUPXX6JXT0kOzToA2Gs8U2o1CII6heevn3MYX8Fu?=
 =?us-ascii?Q?odwbqk6XmxSjTb7jWMyWqTH3TLjhuj230UISXWoPwv9I48iPLV7fjJtCWGQV?=
 =?us-ascii?Q?n8Mhk8T7eQ5v6LX5rqjrnDv5EaUZ+ke/08uwQlWR6nOHLo3jCtiiZt/YvOOj?=
 =?us-ascii?Q?G8fHfFbu2UkLQcxJnYYitLri6GIaZDRh5aiPbxdto+s0JoxdVrDEUAeOZFGs?=
 =?us-ascii?Q?JfWc6jvb7A1jUCwj4R31ThpduETTXBHN0NxojHR7bTe/pjoWWot57acBJkbx?=
 =?us-ascii?Q?mCjDvonn/ntimTUhm47SREqO1rRG3uQ++xd97NM6a9PWTpV7sUH9WzIZngKi?=
 =?us-ascii?Q?SdwBJB9yJO0TNIrdjilw+DPBrPr5jmhnOtar+SYTG6+3ZeK2mJ3HUAc05Qd1?=
 =?us-ascii?Q?8pb/A6SDgfe2jKbgqKZYXpMhfOxxggSYECop1T5NWGb2WmLnq0rGDfyyWwHc?=
 =?us-ascii?Q?m8zTSgLTWceCsXBmZhHrrQ5WbgmAOWofHOqAeH1UFQAOrLPXTXDvAQlPFLSm?=
 =?us-ascii?Q?75+N0nG4HiuhPk15m8qUzqAyuQ5ALyfNGTQNmgrUvvRolJaU4qHAJwmiJ94q?=
 =?us-ascii?Q?fzDDCCSMYezruVRypyxCupZE6uLysiE10gwh4UKacoIFxfKgfrQinXu+xhlJ?=
 =?us-ascii?Q?YRfvP12GW7opWUo46CBluoJSvC91WJjDHl6hUNU1xeVnpVGk0LCcLqiIDmYA?=
 =?us-ascii?Q?zNDbe8if5HVXFKWNmrrDS8JTstJJq4aV5aGeZFUgI11lcNtNWAzWb+NdOCg0?=
 =?us-ascii?Q?o6amcrWA4dGZkkkk0CjIJsYYBDJ8Uv+q5Kg4Opuqm9aFPmWN1/a4pXJLiStv?=
 =?us-ascii?Q?EIewJHxih9izwA3amdDvNOMQxuwS1NqxdtVoq917Q4aNWtKGnZFPFmr7dHQH?=
 =?us-ascii?Q?6J+1TWVA+6hbGYCfRYJZvbsoGaBbD0ZgD2w5U9je0XGFIJwuxcDNqXyIlu7F?=
 =?us-ascii?Q?zqgDkG+dLpE6ICRSV9QFFcfIEOjUzFQuyQUKUUQ2a1Xxmqm6zPhX7B4riMSO?=
 =?us-ascii?Q?cAs1s1tfOjaYW/kgbIsu9gHCv1l1rKUTffzwmLaD?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3bd94cc-2118-4432-f03a-08dc3d212cae
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2024 14:33:07.4394
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3OOxcYidUDs9uw4w00blY6qVsoUnXhEcuUWxo04DxJ3oHwLn8qKH2NELIBP4kwaD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6784
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
Cc: Muchun Song <muchun.song@linux.dev>, Yang Shi <shy828301@gmail.com>, x86@kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, "Kirill A . Shutemov" <kirill@shutemov.name>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 05, 2024 at 12:37:50PM +0800, peterx@redhat.com wrote:
> From: Peter Xu <peterx@redhat.com>
> 
> Even if pXd_leaf() API is defined globally, it's not clear on the retval,
> and there are three types used (bool, int, unsigned log).
> 
> Always return a boolean for pXd_leaf() APIs.
> 
> Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  arch/riscv/include/asm/pgtable-64.h | 2 +-
>  arch/riscv/include/asm/pgtable.h    | 2 +-
>  arch/s390/include/asm/pgtable.h     | 4 ++--
>  arch/sparc/include/asm/pgtable_64.h | 4 ++--
>  arch/x86/include/asm/pgtable.h      | 8 ++++----
>  include/linux/pgtable.h             | 8 ++++----
>  6 files changed, 14 insertions(+), 14 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
