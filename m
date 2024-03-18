Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ED54C87ED31
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Mar 2024 17:16:42 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=QzZuBY7h;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tz0NS5874z3dWw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Mar 2024 03:16:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=QzZuBY7h;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:240a::601; helo=nam04-mw2-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:240a::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tz0Mh6rCTz3cNN
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Mar 2024 03:15:57 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e+CcdGzsnTq72yJAOE+f8Me64HjGti6A26PWbOMrP9LABVfDZd5KReGe/kTpZ1XR/0AtN1nfXox3rlh3cvZtbrYpfKLKPBrgjSKAM/jb+9n/wZazTNXs9m4dpfGNRIX0TEkmVsmY6fz/dFd0n8IvSrWz9q363qOXaqq0VhOPqVG+3nRmTn9WzIe3gQPBiY/IOP7O/oCgsf7wGKzw1xvFPpGRgKCaT97ei1AIjBH3W7ktfh7pign0vjWX0xYLmWwYBT5W49GMgE74PaSNoC+4UuQJzZFKUulPc8NaryvfBTi7QHw+UmZZgNji6vjjz4XyVkh9WNahxGnju+n3uQStUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dlv9s2X6IUZXoWRPusJ/nMrZ6cYw3m45dbmZorYVX7Y=;
 b=dEsp+C/289gGr6movhZhmTpf5fAFa3IVXYDdL7+OGeCNrSY62JV3JmuJv7AQT33mzSikZgaDEYgX6HYzMsn9MRHhGJnqlgX4sVbaQBASZUjVUABBHA+dwKJLwCUEhrIK2jxXJl69bqoFMG5+btyksOkKCi4SR8R1SgNRUpkdFhcPEDBXyxYwfs+6K8jLwzqz5PWJh9DY+1sgeoQbfeKceUMHMrDydmUdlXEPqVu5gX5iz9NQUWAnU4p+jKJpWGXz/o2ANXNBv8DXd9S6NLpJRRTiz+qb9RXcax9RupgqaRvtzQ1mY+r85mKUfUNnJb3h8mef/S8zMAGMxrME35OuVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dlv9s2X6IUZXoWRPusJ/nMrZ6cYw3m45dbmZorYVX7Y=;
 b=QzZuBY7hXHCOR8706MkWbH1fDoSq2MN/Ob7GM/NjS74eXtzpITp3CC9bmX3IGr9mNw93+0Tyi8JlwgkOwCiwsDiSyMl0P5M1J4u5gAR0QAz6xdw74EFoUP13hFo7j6Fm5DEw4DtsMTIW+qTU3sQWTzzR3vDmXqzx5O1beJAkwl1GQS8Afujp1LXSzeo92aXztc8WxD0Uo3CfPZcGB6YIjVaRUSDm27pPZJRO7LJkUJCIJZY07leuZ2RiJcnpFQPZ+rAEgq81xxYP8Ksu6AGDir/sAZPBuFtCXyJoB1lZIaRruUU6ksq0rhtN8vHJ9VqO5s+iXPTHZyF9qC0QvJwIIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3849.namprd12.prod.outlook.com (2603:10b6:5:1c7::26)
 by CH3PR12MB8331.namprd12.prod.outlook.com (2603:10b6:610:12f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.26; Mon, 18 Mar
 2024 16:15:21 +0000
Received: from DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::6aec:dbca:a593:a222]) by DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::6aec:dbca:a593:a222%5]) with mapi id 15.20.7386.025; Mon, 18 Mar 2024
 16:15:21 +0000
Date: Mon, 18 Mar 2024 13:15:19 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 09/13] mm/powerpc: Redefine pXd_huge() with pXd_leaf()
Message-ID: <20240318161519.GA5825@nvidia.com>
References: <20240313214719.253873-1-peterx@redhat.com>
 <20240313214719.253873-10-peterx@redhat.com>
 <7b7d6ce1-4a3f-4392-951d-a9bd146c954c@csgroup.eu>
 <ZfLzZekFBp3J6JUy@x1n>
 <1f6ad500-3ff7-44d4-8223-067bd2ed9ffe@csgroup.eu>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1f6ad500-3ff7-44d4-8223-067bd2ed9ffe@csgroup.eu>
X-ClientProxiedBy: SA9PR13CA0141.namprd13.prod.outlook.com
 (2603:10b6:806:27::26) To DM6PR12MB3849.namprd12.prod.outlook.com
 (2603:10b6:5:1c7::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3849:EE_|CH3PR12MB8331:EE_
X-MS-Office365-Filtering-Correlation-Id: 21eacb3b-8bd6-4b62-a007-08dc47669c17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	VeKXYvAoK6iWXmAcXLaQEH4lPt94aqq5ovoSX7V3j15TdBEc7W4CWTVb4GuQrIsYtcEn2mr8Y031SJcq0lDu6/8ciSsxpyRcnYGNyPe5HuoXyea7ddZlen3EnoV+xkxHAMeLbZc+sUFV3X7YIAxpv8yNywKaXKDpucWj49i3yGvn4Rmc8QOenBXgMulnvoxda/8Q4rX+V+eliOpyIVoqKF5jeWwIev8VxDgxNPW/XPEDS9xAvC28QBdb5gImHjBjbRSm3MSq7FymDuEGdc51Hrsczy7FTDrQ8s77Tm2DUvQ5YrhEyQ7Q5LZpH1K2cM6u1XxEWmoQJRjtflJFMogrMDAiq+h43g+TovnTPRxVBpKQ7JwmUpYgRZSYeVhkBN4zHpJAmqZsqooTuupFc2zfdLi93rV+EuQUa8v2xBK0s7CuE/OdNz1eUNWYySCi3HcTOQWy8lrJut1qCU8cssJS9DfHGiSfbvnNriv6rgZr+RFKplNXdC+NaK/C+TdoLPgn/kEG1pJ4dmCRkDpd26wwyjPvbX1jihoLvtNQ7nu1pAdnRY79lgcpPsZShhzWjVoY35wbGf6xDeJTwrYYNppqvAHARxi7+r4GitMqw8oQ3d6aNDXWWCQF6uUekUvbnNzT7d7t0IzW2KOQstVWUVwyEXm/qADHXC1ekb/Uk6/oM6Q=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB3849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(7416005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?bHhHUWZoQllXU0VoeTFmTE9SZkdIbU96VFpLSHdrSFJJd0s1blBzMFZ5NExp?=
 =?utf-8?B?dG01RGwzOEN3Y1Ztck9ScjZnaUpKYXJkSjFjcFlBdkhCUzNwc2MwTXRGcWcr?=
 =?utf-8?B?MmhzdWNQcUp6WFd6Wi82MWZRV3V4YjBERUJqdHdvWUlRNlpwYVJZOGcrREFL?=
 =?utf-8?B?Skl4U1RFUUlZbWVvYnJGSVNncWZIWjlDQmNOSXJhb0VMUWhSSHJhMVlpb2hP?=
 =?utf-8?B?NS80N2drWXpYQ21HVnAzS2hnTnZOblBVb1BtOE9vVENDSERLNkJGcU9RZHkx?=
 =?utf-8?B?WDk5MnZQUXRJdHcvT1Z2TmNxRENHVGtzMGNiU1htUUkrTEJxblh6QXpJS2Mx?=
 =?utf-8?B?THhEek0zM2xVWVJESDRhNDFXTUtrajhqQWwwaGVucldqWmdLMkxYUEN1ZUhI?=
 =?utf-8?B?cVZObFBFRjdUcUhablVkOElYMXkyTFd4NVMvS3NBN2EyVjR2WUthOFdCVzJr?=
 =?utf-8?B?Z2ZUOVBmTyt3RStOSlJhclkyRVFjREtjTkpzR0xMY0ZGU0VraWNSKzJtUzNS?=
 =?utf-8?B?RTVsN1dRYnFMMnlsYUNpd2hsMGhaTTNxQVlEV0Z3RmM1OTJJbzJPRmR0Mm9R?=
 =?utf-8?B?aUtFOFVJVjZPZElkRk4yWGcrWjZuNGtUdnhjOFpJZ04yNWQxaGdsamN0M1Rw?=
 =?utf-8?B?TGc5YWExdElLb0tsTnlRdGxHM1BhSjB5ZW5id0lwLzlLSGNHMVBaZjk0bXJN?=
 =?utf-8?B?a1JFbDlkemR6S3ppcSttT2dYOFlselJWZ1RLVGZkeEZlVWp3bG5KSnFtbWkw?=
 =?utf-8?B?aS9nV2VQd3dqcUxodzF1ekJBbTlDQXU0SXcvL25WUnBSMDhaNm8xanV4Nlcr?=
 =?utf-8?B?Q0FlZ0hOYm1yTFhwSVF1dHhiZXJ1NHNXRlliOWNlZjM1VUhrWlI3Wm5qRHpD?=
 =?utf-8?B?ZjU5dW84UWNUZXJXUWVQWmZEbXlJYllHbWVWL2tjdlN1MGt0ekwyMnVyZWxV?=
 =?utf-8?B?VjM4VzJmc2NxUy9NTWdINDIrL0RyVVI2ZHpndGJWWW5PaDdkSmhTUTBzbDJZ?=
 =?utf-8?B?MFJFUndqVEhrTDhjUUFiVDUwbkpIM3cvMXBhWWRNNzRXWXJJODc0Slc4eFVq?=
 =?utf-8?B?bDF2TXk2Z1hsQ1BsaUxRT1A4OFJJWlo2TG1OanBJaC8yeU1NelFCOU1SK2VT?=
 =?utf-8?B?RXE4THp0bGx0YVZTQmtPYy9BZFEzSWowWnhpbFgxMHFyU29odE1pd1BOTmMy?=
 =?utf-8?B?S3UwZWxyN0FzblNIdHp5SnpjaER2N3o0eXVQR2F0WTRpRWx6N0QyMVRUVVVv?=
 =?utf-8?B?QUd2M01DcUs5N29OZ3hjWmY1aWN5b21tQzJwZjZkekliU01WUDFBTjQyMzNS?=
 =?utf-8?B?cmZLcUtoenBWUWY2a0QxVGpweVp3MWY2WExmcnd1K01UWmxPOUZmeTZzQ1Ey?=
 =?utf-8?B?ZnBPdDhDNWcyTFlBV3dCTzhCOVB6MCszeVdIejJlY2xCUkk1V2szZTRHdXJl?=
 =?utf-8?B?NFpCTjBzY0k3N0xOSVI4eTV2OXNhTDhqZ2RzUGp6NWR1VHhlQVBWMlo1SWZF?=
 =?utf-8?B?ckpXOVVsN2diK0w0OHY2MlRTVlp0cW9DQllSTEZTTFBjMEpBRi83bFN1LzQ2?=
 =?utf-8?B?TTJJZ3E3bGw0ajZwSkhwdGN5YTdzcVRmYXV4MlFydFpha3YrMnpKa3hxYkdE?=
 =?utf-8?B?VlBXbitWb3lqUnVTUzdTRzRGNG1oZCtPRVg5Mkg1SERpTkRFUFhEZFk5U0lK?=
 =?utf-8?B?OS9tL1NsdHZwTkg5bDhPdE5HUUJSWlFNOWxSTUhDK0ZRQ0JrQWQvS0Y1eFZu?=
 =?utf-8?B?QWxWVWNBVGVzNzdwcFozQThiY2M0RnlndlBzVnNvRXpvYmFJS3djRTd3eGp2?=
 =?utf-8?B?b3Bja0JHdUppSGJjSTRNQllGTmlzTThaMkJHbnJSaFNsVUFacno4STlHRUU5?=
 =?utf-8?B?OGxxckZhZkhZVUl3MElRNFlCZGpQTmJveWtxc2F4aE52SVRTYmVLYUNoQ3Jt?=
 =?utf-8?B?WldzQzBFS2djaG5YVnRSRk81bWZqVmI3UXRKc0dzc1A3QXRGdmtnQ3R5Z1Iv?=
 =?utf-8?B?RkxwY01pT21NcVF1bnRPRG5OR0UvSzdwL3ZNVkUwRTliYnRLdDMyUXFacURW?=
 =?utf-8?B?UG5ZTVFOQ04wbXk5enFjd2s3NDZSSndrMklKQW1CTEdkM1RIRGNuUm0yZU1V?=
 =?utf-8?Q?fYwU=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21eacb3b-8bd6-4b62-a007-08dc47669c17
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2024 16:15:21.2007
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ptvgPTtAQp9uxgSCr5rnubGdY/jszhNphhnpNM1hGNKovsx6qNC1ywe+pYvIhi6b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8331
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
Cc: Muchun Song <muchun.song@linux.dev>, "x86@kernel.org" <x86@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, Peter Xu <peterx@redhat.com>, Mike Rapoport <rppt@kernel.org>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 14, 2024 at 01:11:59PM +0000, Christophe Leroy wrote:
> 
> 
> Le 14/03/2024 à 13:53, Peter Xu a écrit :
> > On Thu, Mar 14, 2024 at 08:45:34AM +0000, Christophe Leroy wrote:
> >>
> >>
> >> Le 13/03/2024 à 22:47, peterx@redhat.com a écrit :
> >>> From: Peter Xu <peterx@redhat.com>
> >>>
> >>> PowerPC book3s 4K mostly has the same definition on both, except pXd_huge()
> >>> constantly returns 0 for hash MMUs.  As Michael Ellerman pointed out [1],
> >>> it is safe to check _PAGE_PTE on hash MMUs, as the bit will never be set so
> >>> it will keep returning false.
> >>>
> >>> As a reference, __p[mu]d_mkhuge() will trigger a BUG_ON trying to create
> >>> such huge mappings for 4K hash MMUs.  Meanwhile, the major powerpc hugetlb
> >>> pgtable walker __find_linux_pte() already used pXd_leaf() to check hugetlb
> >>> mappings.
> >>>
> >>> The goal should be that we will have one API pXd_leaf() to detect all kinds
> >>> of huge mappings.  AFAICT we need to use the pXd_leaf() impl (rather than
> >>> pXd_huge() ones) to make sure ie. THPs on hash MMU will also return true.
> >>
> >> All kinds of huge mappings ?
> >>
> >> pXd_leaf() will detect only leaf mappings (like pXd_huge() ). There are
> >> also huge mappings through hugepd. On powerpc 8xx we have 8M huge pages
> >> and 512k huge pages. A PGD entry covers 4M so pgd_leaf() won't report
> >> those huge pages.
> > 
> > Ah yes, I should always mention this is in the context of leaf huge pages
> > only.  Are the examples you provided all fall into hugepd category?  If so
> > I can reword the commit message, as:
> 
> On powerpc 8xx, only the 8M huge pages fall into the hugepd case.
> 
> The 512k hugepages are at PTE level, they are handled more or less like 
> CONT_PTE on ARM. see function set_huge_pte_at() for more context.
> 
> You can also look at pte_leaf_size() and pgd_leaf_size().

IMHO leaf should return false if the thing is pointing to a next level
page table, even if that next level is fully populated with contiguous
pages.

This seems more aligned with the contig page direction that hugepd
should be moved over to..

> By the way pgd_leaf_size() looks odd because it is called only when 
> pgd_leaf_size() returns true, which never happens for 8M pages.

Like this, you should reach the actual final leaf that the HW will
load and leaf_size() should say it is greater size than the current
table level. Other levels should return 0.

If necessary the core MM code should deal with this by iterating over
adjacent tables.

Jason
