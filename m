Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F1982E03F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jan 2024 19:52:13 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=NT2S93lN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TDLpz1VHCz3w4l
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jan 2024 05:52:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=NT2S93lN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e8c::61e; helo=nam04-mw2-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2061e.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e8c::61e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TDLp9289Qz3vyJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jan 2024 05:51:27 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U473ISkqTD2rgPlUk95UsqOD4lEH3TmUDTX3Kv+qRKxYku+SY8vmsz/9QXIyCY+GLV+D/yb2tekjhXOJIbleepOSiYusuQ3mz/YuyNJNCaffNvAh5CjtoWHEQSFzhmE/fh85SoeXaoS2i+1oOnG6TlJcKjbTvZSjULp37GvIYwbZVv4silUTxz/PRC+iSo+yREk5O7PYSQPfST8M0p/HrwF967DnOi6+oobjyyV9flEtIAOEwnDSkiQ7e0POzKTrCqAOcs7tolw3Ii7pQ01PLi6W6DZOoldLusnodb6Ho1ejqVeTJutDzNDHou7R49CXS9EkZvDqLZPYa2QCfrdHXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U4zQwuX2MFUlfhO8gVzvGSHNoLQIiG/kR/yzPWO7Dn8=;
 b=VCvxlMyjftfu94EjunoEG8A9DKCdcQMCDasQZfW9Hz269qiuOsEsk0rdsUcXAs5o6qKxrkQ/U+y7tsoqrLdj4mAGIgdofLSwqJC6A08ytrQ0J1FQaugA1IJg+LaIlc3PUnhT1ppBqdyXJZL0Fpl09+aSusLcKSF6VrIqJHH2y1P1kgSg23HkZDJvyG/v/1bgmJzR8pNr3CTf0cjSgF/dcd2CmWW2NOO/OIkNxcTE5QBGog7sq5xTX5WLgqCTBG15Vh2bWU2h+LOCLm0/IT07iSCzq1wxSGvqFLN5k/LrMnEtwerkxv0jPvsTwKLfWrw+ctxav/I64eU8sR4BncWseA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U4zQwuX2MFUlfhO8gVzvGSHNoLQIiG/kR/yzPWO7Dn8=;
 b=NT2S93lN14HMUHx07sUUczGy82AbUVl7b3uz9R6OnJb4AB2/3MXXdREunpNDMOp2Rr1f6cTjj2wAhQ8OH8khCaNdPOAsFxjKInJxc9x5mOcSp2PdIDA8iGbISBQmrF4mfGosTjP6nEFWNpgwUvubIUOtocYb3XyhfE56p+JQ1vwvxonMQLN4MGUwN53TsHsbGUZopT1AavBMBYijh5mX4vF1T8QUtpqEJTRiPb1mBJZCxuUSLVSVthKzSNXEQhVdLQMgLHp905tvvQAHmQCQp2i8ScJdf40I3/JeviokdE5F+iLuXoktZilJdYVgIt7KNu5wMlHXonhDtaPLg2xZ4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by DM4PR12MB5769.namprd12.prod.outlook.com (2603:10b6:8:60::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7181.21; Mon, 15 Jan 2024 18:51:08 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::96dd:1160:6472:9873]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::96dd:1160:6472:9873%6]) with mapi id 15.20.7181.020; Mon, 15 Jan 2024
 18:51:08 +0000
Date: Mon, 15 Jan 2024 14:51:07 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: peterx@redhat.com
Subject: Re: [PATCH v2 11/13] mm/gup: Handle huge pmd for follow_pmd_mask()
Message-ID: <20240115185107.GW734935@nvidia.com>
References: <20240103091423.400294-1-peterx@redhat.com>
 <20240103091423.400294-12-peterx@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240103091423.400294-12-peterx@redhat.com>
X-ClientProxiedBy: BL1PR13CA0028.namprd13.prod.outlook.com
 (2603:10b6:208:256::33) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|DM4PR12MB5769:EE_
X-MS-Office365-Filtering-Correlation-Id: 58f3eacf-11e8-495d-3337-08dc15faefa8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	piNEPncTYCf60S9om+ZPGzPFaAFLvfW7GkKYaEUm6MW1J/ksuPREnTkonZ7hBtHvbhZ1fZxwkzZLAvMczZqdWlpoXwA60aNhubY9pUyBBGQ0xLRoS5CudUJ1uhlqcSIZ3ZwyNvvT9NUUNAtGOjvINvWz7bODogkIFeQeKmr/B3lHgB+Zte5s/rH7qY82jv03qGAHsM+QMAwXjJByrxJtRYN7we8NJkG5B2U7nhRv0ffCkLhGArRrHEVx9Lfa+ywa4jtfLbmrG46vuzXWyu177kmo7zTdIJpo1q2LNkd9UMYn3Sb/zKgzNh2tXA/iWVaxU88/0/t6AJWchQ3z6T7oDs9/TXdAPYtqtDPJmEryaYYksnUtI/lvFRDWB6BHwfg0ZbpDPNqz2+yWyI2B0T0MF2zJncalY2NgwwChIvlMGhH3rbKk76dXM9EWikIMgad8+eMT83U7A7i7PlXzMFnKM44qbavB0R64ZpvdFt34qZ2quVkZ6miyoytgAJBW8UV6237+sHtIfzS8+ZE3BR6a9+6e027cRinwhnendBYqvjXpSRioZgGNMNC/XlO/UBXI5Wp7f+x7qZa+qY0oAZEQKj7ugBZVJFyryIgh0dxAcmjcolrhtKXeSrbSM9xTKxCeARyy280c3Cs/KdU6WR8P3Q==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(376002)(366004)(39860400002)(346002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(66946007)(36756003)(316002)(66556008)(6916009)(66476007)(54906003)(6506007)(6512007)(478600001)(6486002)(41300700001)(8936002)(8676002)(4326008)(2906002)(7416002)(38100700002)(83380400001)(5660300002)(33656002)(26005)(1076003)(86362001)(2616005)(27376004)(14583001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?jX3QNSpOZwtINWcBOwz39nQ2SkQLrQJ4BQvkz/yzJqGCsT9l9Kn/QB/n5N5R?=
 =?us-ascii?Q?EFgUfIg9QNV10iclP1vFU8NejLYfJnKUCXriBI7OjRiP/Q0IBaAD5tapAWHW?=
 =?us-ascii?Q?YbVkGeO6N0+zuOeP1OyrkG+TtX2uze9sJ7N5SXWV8Ds8BRyaFKNpE/oc/cHt?=
 =?us-ascii?Q?9ToUeyuP8t1B60OKtOscu878eiowvhalD/KP1huAPJ/9puPbK8WS90sExXIY?=
 =?us-ascii?Q?sJ1b6+QA9AH8KEs8On29OhmW9JY8PqV7g7geUqVzr4BJt6j2/1OP8eT2jjHj?=
 =?us-ascii?Q?LFSbSV0s9ZMYTWs2MY6l6gD5dLvFo3pySIwqPNxWb2Ku8IcjdydtO6EuJjYR?=
 =?us-ascii?Q?32KgMg6eMiZjk+1UbzUqYn3nMgIuxLANTL4ZmpKYuKc9uSzzRMMBQgwZWPS8?=
 =?us-ascii?Q?pKhE6Jf3ECKXdY8FrTeDjwqcZ8d2djWx0mQrSTKQwV7rzFsKg/b+RhX4CuLA?=
 =?us-ascii?Q?z3AF6MOuoKN6XPPNpQzI2AD3mejjmN6MrtOC9qEC2RVvUVlGVl7qKaMNXwBt?=
 =?us-ascii?Q?1eOoO9Plh8Yt1r6iFc961PhBdAlG3VHKFwJdhR5dNVZanDh0Mqmc7eR8uvHK?=
 =?us-ascii?Q?mxtopxhQQVhzoZCCeNQXv2kuLzY0OmQwK8zdR2zFs9D6dxsBSUGPpoTOUI2E?=
 =?us-ascii?Q?Yjh441+BsqUQI1tWHK2sNINWBUo2A6YRbCJUq3EDcvL45xMjFBB+fajVyQqy?=
 =?us-ascii?Q?ZpMO3Favn5CbrexNTu7rcT7PLBBZ05zQpklzwtWJZTxH+uEEpggr8P8Hz8Vn?=
 =?us-ascii?Q?stAIDpYw5NZ0+zg9NDM6CVphZlK01o1Uby9VltuRfTa9uAch6zKKcCXzMdJs?=
 =?us-ascii?Q?Kl/pl7d84mGPtogxCEplM2s7Uo2eROpDEYhCTpEPlsqLvdwFcWO6o/WVmgjR?=
 =?us-ascii?Q?MntYxEvgsuw5ngqkVuEeL8jcl5n9k+8bbAEt025E2FD2Cv10lTylNfTpkLEi?=
 =?us-ascii?Q?neYsmXEZwVbR8TipPJzoJlNb7P/ml/IsJjG3u6sgi9IVUen7arh/fH5g6J8b?=
 =?us-ascii?Q?Opeeaun/Ly6g8Ysm/kor7OOWCS5ipAEaSsTvEuw5HnurtCihk0sMcvNQamyj?=
 =?us-ascii?Q?7Jfiqn+xBiv7cYu18CWtlLiZaY8S8ZyPaO7q5E3JXA0C0Xp9hFm2+YiBsvbb?=
 =?us-ascii?Q?ZP8L777KE044zHF+mBEO/OTAfyWmAyWhAGjNwQPxGcl12dRX1+fZ0ZvjVQgt?=
 =?us-ascii?Q?ZkV/ijKGRt9OGr+xpmpNc/iFxsnDcutywF4HNPdEmUCEC47i1nkEQ1QzlzN1?=
 =?us-ascii?Q?XbRjH0TggJX5iczno3nEDRlPsMzzDwDj9iW5xtpjCZB3vsy0bZ3zldiMsSsg?=
 =?us-ascii?Q?PuapAcK3BIfY9ZC/RhNDU+4PgdczHj3Ls+A4t1z+9W0QW0eEPr2eQ3mODb4z?=
 =?us-ascii?Q?/5KmGFZK3+fpOKu/Tw6B6+qqoRFq8aT0g+csOUOEMbJSv51B0i7G7oD1SC7m?=
 =?us-ascii?Q?Bv65dDpy4TV/Q/+kYOTqKdS/x6MNME3lITVW65zt/LLu7Ri3PYFp5ea4N9wu?=
 =?us-ascii?Q?H51Eg+yOwUVezO+rnzOXkecqKN5sYwsaZ/YmtGG1/0OkCWeLks91sWVcpc4Z?=
 =?us-ascii?Q?gCe5bJE3gqlRK9edffXcRKGOKTopSTjf3+DERrYc?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58f3eacf-11e8-495d-3337-08dc15faefa8
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2024 18:51:08.7660
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h2ONvC+x4X73qqLknIM1poogsOHktZKgevjy1eKdc1nZZYsAsGbc0axtuU6y0082
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5769
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
Cc: James Houghton <jthoughton@google.com>, David Hildenbrand <david@redhat.com>, Yang Shi <shy828301@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, linux-mm@kvack.org, Matthew Wilcox <willy@infradead.org>, linux-riscv@lists.infradead.org, Andrea Arcangeli <aarcange@redhat.com>, Christoph Hellwig <hch@infradead.org>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Vlastimil Babka <vbabka@suse.cz>, Axel Rasmussen <axelrasmussen@google.com>, Rik van Riel <riel@surriel.com>, John Hubbard <jhubbard@nvidia.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, linux-arm-kernel@lists.infradead.org, Lorenzo Stoakes <lstoakes@gmail.com>, Muchun Song <muchun.song@linux.dev>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 03, 2024 at 05:14:21PM +0800, peterx@redhat.com wrote:
> From: Peter Xu <peterx@redhat.com>
> 
> Replace pmd_trans_huge() with pmd_thp_or_huge() to also cover pmd_huge() as
> long as enabled.
> 
> FOLL_TOUCH and FOLL_SPLIT_PMD only apply to THP, not yet huge.
> 
> Since now follow_trans_huge_pmd() can process hugetlb pages, renaming it
> into follow_huge_pmd() to match what it does.  Move it into gup.c so not
> depend on CONFIG_THP.
> 
> When at it, move the ctx->page_mask setup into follow_huge_pmd(), only set
> it when the page is valid.  It was not a bug to set it before even if GUP
> failed (page==NULL), because follow_page_mask() callers always ignores
> page_mask if so.  But doing so makes the code cleaner.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  mm/gup.c         | 107 ++++++++++++++++++++++++++++++++++++++++++++---
>  mm/huge_memory.c |  86 +------------------------------------
>  mm/internal.h    |   5 +--
>  3 files changed, 105 insertions(+), 93 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
