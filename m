Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C17787ED39
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Mar 2024 17:17:32 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=AEzlhRln;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tz0PQ0mfgz3vjH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Mar 2024 03:17:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=AEzlhRln;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:240a::601; helo=nam04-mw2-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:240a::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tz0NW5VSWz3vZl
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Mar 2024 03:16:43 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ggU2T2+dW5s6Jl2d0IwtXFeqUSSDq9wPJqcoLLiT15hXKN2xiZ8jiiLxEUpsXy+lHu3ksu3Q98h5lhTxF5yw02H8dmvHQEHm1o/W0JwTw9hBDE0r5tbzf2o7GAeIVLoxM+fCa7SBp34QFQu+Gq1iwTCkRxaSROGBn7NVC2hnJMpuy3y+Lold4vVbs1EUuKBrWskeqiK2gumAs3/5qCz/lrWJX2FiBF+ppD+v7pwEjUzSSFVDNacKW5e9hCQDL/DV6iKOFyTDR7ftLgsmPz6X9yf6XiEyco4vP/oE3O3cll1xz5CSzJHpmmatYzUiiboYaNrks5jiF6qqHX1fuZFBdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bHPGI0sgsnO463bBG9OyVNa4jROqiE7xpF6jdd5I06I=;
 b=B/R8nMZx4EeZodp4q5yfseF+Y/QR3DeULAg+6s7JDzOWyZ9N+qliajNvLYo9YPsaNNW4ENz+Vw9ObKurN9x2Cv15Nkgz+Vc7+6KmM/hrKESfuQ4hPJsjkkE/JQ99KPz/ajNi3WM32k65EAcZUnbk7KdTMLe5dSHwZZEqLI2M3IBme6aM6l5DcA0T/ctaoaFa7d7nSAuaWdRWTWP2dTVFN/mwOUG/omgShdd9yJE7E8bcP4+UASzYbvHY3FI5DnfeV60iplShvKQWLwavEEnkZ05QlNETJQpWegVlAf9PxAUUU916M9vJk+hf6FRa7xeYO5iGLsENqym5mWgdKoDljg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bHPGI0sgsnO463bBG9OyVNa4jROqiE7xpF6jdd5I06I=;
 b=AEzlhRlnrOSA0DyBXbxK8dZeBR/+5KQic4KDWPbGQGdvLRvNFzEQdMh6ik67/S9D0j3E/gmR/M5uh4T5Czaw8kdTGRvCF3DUoH03VzLnqDnnIVCT7IppnMASh4iSaaQ/Pgyks1xa5KKbUzxCEv1oZOFh7UpG6q6VHBRaXyThMBwvH8PjLZ7OF2c5gygzOMrwj6FO1WJ/IbSph3bjRzdiD2eFkTMWdanpr4K7SL5D/VrGp3BgGT+8SKKpwFwOtLM2p8C3g4sQsL1bblVOVBpoMnpEFnngaztyB+5/G/4b4euRoISSiyByh1Mq3vQGzLeg2uhWWVIleLBOCYny2HJxrQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3849.namprd12.prod.outlook.com (2603:10b6:5:1c7::26)
 by CH3PR12MB8331.namprd12.prod.outlook.com (2603:10b6:610:12f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.26; Mon, 18 Mar
 2024 16:16:25 +0000
Received: from DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::6aec:dbca:a593:a222]) by DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::6aec:dbca:a593:a222%5]) with mapi id 15.20.7386.025; Mon, 18 Mar 2024
 16:16:25 +0000
Date: Mon, 18 Mar 2024 13:16:23 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 11/13] mm/treewide: Replace pXd_huge() with pXd_leaf()
Message-ID: <20240318161623.GB5825@nvidia.com>
References: <20240313214719.253873-1-peterx@redhat.com>
 <20240313214719.253873-12-peterx@redhat.com>
 <0f929f80-92fd-4824-a7d6-839f1aef4c8a@csgroup.eu>
 <ZfL0qh0re5BpYGba@x1n>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZfL0qh0re5BpYGba@x1n>
X-ClientProxiedBy: SN7PR04CA0169.namprd04.prod.outlook.com
 (2603:10b6:806:125::24) To DM6PR12MB3849.namprd12.prod.outlook.com
 (2603:10b6:5:1c7::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3849:EE_|CH3PR12MB8331:EE_
X-MS-Office365-Filtering-Correlation-Id: cd2ba8d5-2498-470a-5de1-08dc4766c242
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	5R9VlEMi4F4P2NagsgZhz97fAh/GDS4WvK99aifrcZftVfBgP7iMBcyUS0ERzvatCyS4ZpyHPDXkdD04kwL7nblOyc5ipabejo6JpSODlaoUMeRRQ66VyexP08ZwxXEzJfMyfUb61xeseE88qry9nsoyDq0XwBLMzvppr/wldCPmkj+TeeuqJraR2qQHxM1ErTYvHUPihobdq9GnfAVK6BznG3dbPyzbMnQxerLrB/PaDldtHfavxiN6ZgNa1iFpAQjEb2vw8f7YE64p/EhVmii9uFl6G9fADuf5BYFoHmN1FVk+nPOpcWp4KhaOuzoPN6lanRmEe+2OBn41OJpsYE5TRmqvGx8n+eD6IP6rrQRGvIUkmvMdI5aE7PwXcqs6NyOPW8v5R8Qe85tdVpcTl+LdydHWJpsRBQL+f2H4MGu1uMPoMVFC1vkaEV17cvSFmSyiQiZSASTg5vtCWxI1/K9ihUXXlI8P08OZoTtSTfD4d6EUDqswyXs533Vhm2kTmcR65eYZXN+ADd5b155eAhs/JPZMEM5+ZvokVOAQl2hOUuHHtsdkhCmCPQAEIfpZnzuFwpuaID2NeSaoJs5YDn3WPM025x79eu8ZzF253+DG1KU1AaM2+dH1sJ77QXd9zjyR3yZuMMWoEny4kt5vtTb0FaAFeaWOa5HXn1WBGnA=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB3849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(7416005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?9sK+rlVthDEJlrnSJpDOsTBTV1nHVv6ZxTdUDLVqjaLA1HnRnNB006izuCjN?=
 =?us-ascii?Q?sMyQU6ATSVkt9o5z9KzkC6qApIoCM2ZD0X+1QsgZ1cgAkKRBbywjKgHwkDWe?=
 =?us-ascii?Q?2Cd8DL0s6cW8jWxxThZhWZmQqztTPQ9Hof6M7PSed+S1ZYGSJDV1jksfzVu9?=
 =?us-ascii?Q?3BW78pOQ4wtmjh7baLWjcWvu1acO3PG4NrhPsOyjr+wBC3x7Yntdp0S6j53u?=
 =?us-ascii?Q?eMNfm26K09UF/0Py7VlNjZmSfnD9PRgIiYqEe/QTnr66BIsEWNFFkPiwX/4e?=
 =?us-ascii?Q?kmC0mb86agBJISOkCbYbuXAzsFBi/WZJQGXTK/MWn9ks8REQNG0z77nmYipO?=
 =?us-ascii?Q?QcQCUcxa9ZTJUQPLjfZcgCazPOfuKgdVSFrBmqlIMSLMjNq8qsp4ENhfbxYk?=
 =?us-ascii?Q?K1YcaxRib6zOPGu1kQh6CQJKJVVv018pYEVC/ow6JK1pBCJCEo679lpDnjMH?=
 =?us-ascii?Q?25H6WEx59ltWb/2cE5ymrbSSrNJ/RQbThlLoyBE41f7kzCbmTIktVw1JhdIY?=
 =?us-ascii?Q?0dw+a78J8f/GyxOe1i36CVp9cqDfU5clKEKjCQXaOwZ4NKCW7hWY0vDBwIF7?=
 =?us-ascii?Q?9ZsFMyrS4ehhR6X+YR9Da1wr40gVnWOV7t9b8syaeGnHYNOHRyMyFBdJpOPg?=
 =?us-ascii?Q?3AXzVoJiCCNYL7OTL1cX+/h6vw4cPiv+iGQyxy6YNDBx+XenzIfyJELWh0qY?=
 =?us-ascii?Q?LBxO2jA2lIzCziwTWKVQCQopQsSr7X0v73+aMfBvxM8azxSA5EBSYMT1i388?=
 =?us-ascii?Q?kNuBiTyZBem05836ZBi4zfyMxmp5R5yPbyHqKrTcwYXX3jVKq3eCkPiC76KO?=
 =?us-ascii?Q?KQZGSPyPFXYFhj1aE0v+jozwmrI9Hb9w7S53D09GvggkmJpbHAmPd+jn3j0f?=
 =?us-ascii?Q?Yci8B6dDODYgN+/zgBBqLuLWlVYUCXCnJTVZGTbRvo+RiO1V3DQe3eNsmS6R?=
 =?us-ascii?Q?YGykz7bEg7JlgvYaGdEK1XDwQakPcLQQOdXUYn5tK0buZsm545qXEcUn8Sjq?=
 =?us-ascii?Q?6G14KQsZtruvJdTVptA423d23SJkmN+3hpjLocgLZZhSVAWTnmPw1jL/oWxe?=
 =?us-ascii?Q?nscDEPXj+G07UXL61ulPXWXgub5d95+Tq5mUkh1W9HXmJbvZG9Hatk/9V0x9?=
 =?us-ascii?Q?rafn1uTmOZYEgcUUoajZu/+6K8EwWnhyrFgm3iH+l8w7NAUyw2kTOYztHjv/?=
 =?us-ascii?Q?lNXFVROC/lBqsFEDCFfGk9TnK/+McQ6GSov0/inOR9VgQ2dhgXYMA/+66O+P?=
 =?us-ascii?Q?gDfoEVXZu8FFe7kMgDqhy3NvKVYSrIiOWIvdj5M4srhXCA/LyJlCsj9f/hwx?=
 =?us-ascii?Q?9aQAbOpLzL27DxdeRi5nJdgQq6+oaZFofU4MYI0eKBkH+lIwtiTpOViJ4VbG?=
 =?us-ascii?Q?Y46dwKMfIEL/dqrRLa+Wq5q95ha34fw+wBc29AbU7AoXPgFPk16l6ed7bU8n?=
 =?us-ascii?Q?HbirpVdmULI4fLb8k1O5RRwi8iZZW5cwyxHd9h46LRu6FYP8imiwaSnihKvb?=
 =?us-ascii?Q?ibb49k21Wvr8gpnQVHbX8zpnAeI17NzDsdk/GC1X/GrYxQa+wZsu5rnx8Tsw?=
 =?us-ascii?Q?fcASbXQOx7ottXT+zVE=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd2ba8d5-2498-470a-5de1-08dc4766c242
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2024 16:16:25.3057
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2L4gyrK+ZKTmJPnB51EriTxZnleDFjlf/kcepXfjxBaiyEpQzV7czB9M7BBT2B0P
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
Cc: Muchun Song <muchun.song@linux.dev>, "x86@kernel.org" <x86@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, Mike Rapoport <rppt@kernel.org>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 14, 2024 at 08:59:22AM -0400, Peter Xu wrote:

> > > --- a/mm/hmm.c
> > > +++ b/mm/hmm.c
> > > @@ -429,7 +429,7 @@ static int hmm_vma_walk_pud(pud_t *pudp, unsigned long start, unsigned long end,
> > >   		return hmm_vma_walk_hole(start, end, -1, walk);
> > >   	}
> > >   
> > > -	if (pud_huge(pud) && pud_devmap(pud)) {
> > > +	if (pud_leaf(pud) && pud_devmap(pud)) {
> > 
> > Didn't previous patch say devmap implies leaf ? Or is it only for GUP ?
> 
> This is an extra safety check that I didn't remove.  Devmap used separate
> bits even though I'm not clear on why.  It should still imply a leaf though.

Yes, something is very wrong if devmap is true on non-leaf..

Jason
