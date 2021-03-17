Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9EE33F157
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Mar 2021 14:43:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F0rvR1b1Pz3bpP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Mar 2021 00:42:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2020-01-29 header.b=Gv7n6DMU;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=bmGiU51H;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=156.151.31.85; helo=userp2120.oracle.com;
 envelope-from=konrad.wilk@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=Gv7n6DMU; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=bmGiU51H; dkim-atps=neutral
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F0rtt2zMZz2yjB
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Mar 2021 00:42:29 +1100 (AEDT)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12HDa1mp109003;
 Wed, 17 Mar 2021 13:42:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=UO4nQ+8IdYLmNMwK0SJ17RQ/xMqltbB4iQCeQZxLkyA=;
 b=Gv7n6DMUMB+pC9z/cjnKUEXtX9SisSGueGRzVAX7j5Jq3+n888KQR2FuMy7LZo6FIxGD
 eOg7BWJGzWZwDu7gSCz/REkcbuIMjzQIJcYNRfxPcSk0SjKUPYjun/VfqrnhvWD2uZcL
 5iX9Gl+IRf9k2hT2K2sebh5pSjI8WiPVQDRows+prUGx+/6JYujvbC3ANORvHb992bPW
 vRdo6dLE1fx1T0qqA6IWOni29NCmLpveX38GTKVLeWgonQi/tmPQlHeBc20ceYlPlDOj
 kffp0e5Qi6wPNjoHzfp+vphELZuEb7QiA2gNTu+/fvWZ5p3xNJWlIA9f4yxF4+XA75yR SA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 378p1nv2fg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 17 Mar 2021 13:42:15 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12HDYke7134481;
 Wed, 17 Mar 2021 13:42:14 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2102.outbound.protection.outlook.com [104.47.58.102])
 by aserp3030.oracle.com with ESMTP id 3796yuum12-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 17 Mar 2021 13:42:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SUHw/HVbau2QpVJgPzEeDCfUvHE++N9q5bs3ZyswhLKxaxQFCaddF11f7KDSXQqxPemadFJ4eM0RhodtSwVSzSw2fh6OKt0xZBrigIr1tsySewQNeUlhi4iFVFpMzTROHEQ/iuFKzbLB+ya37uoyMSrUnaIbWrwWwkdtoA/r6/j33JyNJxMcNeDSPEBwt9skrwrAF9bGspbu90WdBNBZXKY5KWYmutikHexnxb2nGdrU4uhvtC5LewXVVjUEWIXTiMojruOp8aG+XIkcKme1BTQga/CbdaWH/7NKt8qP8fhlsmi2/J0OsxE8WWF/H1bv69q9WYJ9gxgcz6KZL0ANRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UO4nQ+8IdYLmNMwK0SJ17RQ/xMqltbB4iQCeQZxLkyA=;
 b=c7RkZEXb7vVIUr09Z4PxUgBTosjGFGqzozg4GhTNt02HbDIquv1K1J+lmxZZF6P3qdTM7p0xHpPb0i0pCfkCli0kJxkalAFR0apECxQ8gjOnh5DWsFF5gu15mtXJf7VgZUnMCy0kfAvxzomNkD0DoV8yUdBgEHTHf+eaS6ddzPRzloz1XhGpBy8daUNZDh+dcxuyr/WWj8wxkGvJiVP1xC7bGRsJUWNvyH2WJk/NdeNZLVZfsxqE6PQoEeVPiM7da7q0Lc5dVEyQK1ytle5UyPxw5RPYS7w9qmhzBN4efoojZOgdmkegEWRQ/4NCJFNACBzAR/78o4Rfc4BSiaxLFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UO4nQ+8IdYLmNMwK0SJ17RQ/xMqltbB4iQCeQZxLkyA=;
 b=bmGiU51H/2Hy6nFzEnWV6rw8V+3m2dc+iK66r/1vTV51CrmrxomLQJ0xlTxtURPFHVXcQUEzw3vyNIS6zwezuqcLRilOje5p+nSmCknde2+FPMjKPObKMFRoe64DeLgBjJG0pK3IMFExAWbDEJOitNRScThyFPkrhzd5NQOqH8I=
Authentication-Results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2999.namprd10.prod.outlook.com (2603:10b6:a03:85::27)
 by BY5PR10MB4211.namprd10.prod.outlook.com (2603:10b6:a03:20c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Wed, 17 Mar
 2021 13:42:10 +0000
Received: from BYAPR10MB2999.namprd10.prod.outlook.com
 ([fe80::50f2:e203:1cc5:d4f7]) by BYAPR10MB2999.namprd10.prod.outlook.com
 ([fe80::50f2:e203:1cc5:d4f7%6]) with mapi id 15.20.3955.018; Wed, 17 Mar 2021
 13:42:10 +0000
Date: Wed, 17 Mar 2021 13:42:07 +0000
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 12/14] swiotlb: move global variables into a new
 io_tlb_mem structure
Message-ID: <20210317134204.GA315788@konrad-char-us-oracle-com.allregionaliads.osdevelopmeniad.oraclevcn.com>
References: <20210301074436.919889-1-hch@lst.de>
 <20210301074436.919889-13-hch@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210301074436.919889-13-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Originating-IP: [209.17.40.37]
X-ClientProxiedBy: SJ0PR13CA0183.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::8) To BYAPR10MB2999.namprd10.prod.outlook.com
 (2603:10b6:a03:85::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from
 konrad-char-us-oracle-com.allregionaliads.osdevelopmeniad.oraclevcn.com
 (209.17.40.37) by SJ0PR13CA0183.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.9 via Frontend
 Transport; Wed, 17 Mar 2021 13:42:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6961133c-965f-4efe-1fd4-08d8e94a76f4
X-MS-TrafficTypeDiagnostic: BY5PR10MB4211:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR10MB4211EA7488FB480393F2B05D896A9@BY5PR10MB4211.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:901;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ape6wbm2igxDebgQnT7GV3m7/wqyfrp3AhiSrNOr9HvaK5jejQn6gJmwQuB7h8InCWsNmn+HmUwljlwGTEsfre0qRAJzmJZCWDU5D8aXh8i4vBdc/d8h8JHVIoZ/uSsy384GD0+QUdc1rAoAefIpUh04G4/5pt3TENwlTcrt0IFU5wmTzgVvPv/l43ihxkGsh+wcAoE4Pw0fqJuLG5dTop/ZgaUJXoobsWjUw4MKlUWMVhODg5+RoTX1krylcDBLjqfkQzInB8x7k1i0XT90tUz3jCQUcgCzQUm4SBabgupD43TaEYD+kiM0P2XnPK8np55HgPOYlEZWWeHrNkDhssUSHV5cYC+vWf9WeNTlglt0o0BRemPAoNTH/iE9zxPHaF10dpuVvlS7aLNHXMoFeqxuGyBhN8e4PfAojruSfoekklZaruEUA1vnJP19fdkQL5i6VNOX4ADHsk1W5REt5njN262oHmZDNZxiFtjtbnqkYaoIH5kUhbDnpWhJOfmaOhddRMTw5YUwWWeuCnMTkXnIV+J3N//HvLUo8K6pgWKi9sH3Dwbredn4qGMIyzze
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2999.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(39860400002)(396003)(136003)(376002)(346002)(33656002)(66556008)(83380400001)(8676002)(7696005)(956004)(186003)(52116002)(5660300002)(316002)(66946007)(478600001)(4326008)(54906003)(6506007)(107886003)(1076003)(2906002)(86362001)(66476007)(8936002)(9686003)(26005)(6916009)(55016002)(16526019);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?c4NHgPWKCyxISLqtAYw9IABI9HTRLFGk7eQXtLrx8394X8nbY5LD+PMn2RxU?=
 =?us-ascii?Q?etEck+L18nIxPfG65Wty5CX4SQ1nobGfwSBMpjm0iB2mlbyhYTgT82nx/7Ac?=
 =?us-ascii?Q?aJdNZgTZPMA+p5KSA7jXvmhNR9UZkJZOgYNomnOSipR8rYdsyDq8QLBwKecE?=
 =?us-ascii?Q?pHNfv2gEmgRxtWqBfV83CYVORkHJlYPIzqKFgDinxh2gHbcpebtH9qpb1CwY?=
 =?us-ascii?Q?vlxzBjc1rKwe4W/slarx6eq4YkAHTvZix97LCxRM6JwaUWwuY2j82nMhUP6D?=
 =?us-ascii?Q?SUWEmGKwDJxK4N5hTihj37x06wQdASpvWx9fhl6nNCMDgNgjzUx5etamCx2O?=
 =?us-ascii?Q?VmvU927AzwxRO5nKCx8xWln3/DfDtftBBerhb/WjOaHnmmpJ80AJqqGUsPK7?=
 =?us-ascii?Q?a8U5adiaJrFq7LbaxYHo8716V9KOI3M1mGetfFysFmExM2qBG6rdhAcN6Fn2?=
 =?us-ascii?Q?NHTRjFdmDnla3wuhaqd4Pdx4Yg8P2quUfYIAEEPpUozMt4GsCld+Z2hltqOI?=
 =?us-ascii?Q?pnw6deEXBqANWios4hIhn/j/uOzK2ebfuuP70BcqE+I2lYn0BiUxiOQUH+SS?=
 =?us-ascii?Q?qTqwHL3VZb5OkAMblwQiO58w5dE9BYWG1AcXSOC/0U+rMQ167tFEVzCsMl2c?=
 =?us-ascii?Q?Q9lKPDSuv6PLfJiNsZSAOzv3floZssHaJaNg0pLbEuUIsNATXAZvZMC0X/nS?=
 =?us-ascii?Q?dPeQcQohmZHsjjRPA6waMDlO/+GBoOywMjWVRMYPwOP6F+mEAtYL7lJj4gZE?=
 =?us-ascii?Q?+Hs0zBx0C44SwQZ5iSlJjM+R5f4R6k32XNhl++Rsrn5OHX6IOcD2Dto0d2Ql?=
 =?us-ascii?Q?IXeii0GyT5STGkMgJAV+g0X/F+I8aa1QMH67U3XXEm549edvpRgsPZdL/Y2v?=
 =?us-ascii?Q?62E/ndK31bjSiBKv5EE2k1sAUU12SmTKidRPHplgj0GNl+1D+veKPjCtZRlJ?=
 =?us-ascii?Q?vtqjSSE/ab1T2eidnxZMToO6feWJ7y3PZrktI1ihwT42CwO5x2dM6tKl8WGA?=
 =?us-ascii?Q?04Gs9sPJ4fyQF3s/uojqfKpTHJa+GbZosMCmTzT05meJ6ut9ZkW5hgQCp89s?=
 =?us-ascii?Q?tO3cyUQNaQVms81dww90HeAgqmoT1YKmEUFmvXZAkjh8BkKPkNMrnrQsUTvb?=
 =?us-ascii?Q?LSM0Qkv2+6yT80bRtHfTGH1ErDcQPQ8xtN9J3ijsU3+WshehwlVza/3zcuMe?=
 =?us-ascii?Q?paha8YhImvkpnHxI9nJFjblS8szrbf2xeBsvc0yB7vbq0xlDWC7SXRVA2Ho/?=
 =?us-ascii?Q?lcFh4mXQsEoljdy+6U2oftY67vPgSfwt2sKC5C+5YgqD9Tuzx+KehQunVlFI?=
 =?us-ascii?Q?XQ4GC0Y+rdYm8iG5Sw9/KALO?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6961133c-965f-4efe-1fd4-08d8e94a76f4
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2999.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 13:42:10.6416 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NohjA6T9zVgAmd9QK+HG/yofgX25tRhrTL1oB6nry7jvyclCJcNaVCkxSoPncGdLTw3NgeTS8BcFCTgOUHM/bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4211
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9925
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 malwarescore=0 spamscore=0
 bulkscore=0 mlxlogscore=999 mlxscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103170102
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9925
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 suspectscore=0 adultscore=0
 spamscore=0 clxscore=1015 phishscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103170102
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
Cc: xen-devel@lists.xenproject.org, iommu@lists.linux-foundation.org,
 Dongli Zhang <dongli.zhang@oracle.com>, Claire Chang <tientzu@chromium.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

..snip..
>  int __init swiotlb_init_with_tbl(char *tlb, unsigned long nslabs, int verbose)
>  {
..snip..
>  	/*
>  	 * Allocate and initialize the free list array.  This array is used
>  	 * to find contiguous free memory regions of size up to IO_TLB_SEGSIZE
> -	 * between io_tlb_start and io_tlb_end.
> +	 * between mem->start and mem->end.
>  	 */
> -	alloc_size = PAGE_ALIGN(io_tlb_nslabs * sizeof(int));
> -	io_tlb_list = memblock_alloc(alloc_size, PAGE_SIZE);
> -	if (!io_tlb_list)
> +	alloc_size = PAGE_ALIGN(mem->nslabs * sizeof(int));
> +	mem->list = memblock_alloc(alloc_size, PAGE_SIZE);
> +	if (!mem->list)
>  		panic("%s: Failed to allocate %zu bytes align=0x%lx\n",
>  		      __func__, alloc_size, PAGE_SIZE);
>  
> -	alloc_size = PAGE_ALIGN(io_tlb_nslabs * sizeof(phys_addr_t));
> -	io_tlb_orig_addr = memblock_alloc(alloc_size, PAGE_SIZE);
> -	if (!io_tlb_orig_addr)
> +	alloc_size = PAGE_ALIGN(mem->nslabs * sizeof(phys_addr_t));
> +	mem->orig_addr = memblock_alloc(alloc_size, PAGE_SIZE);
> +	if (!mem->orig_addr)
>  		panic("%s: Failed to allocate %zu bytes align=0x%lx\n",
>  		      __func__, alloc_size, PAGE_SIZE);
>  
> -	alloc_size = PAGE_ALIGN(io_tlb_nslabs * sizeof(size_t));
> -	io_tlb_alloc_size = memblock_alloc(alloc_size, PAGE_SIZE);
> -	if (!io_tlb_alloc_size)
> -		panic("%s: Failed to allocate %zu bytes align=0x%lx\n",
> -		      __func__, alloc_size, PAGE_SIZE);

Shouldn't this be converted to:
	mem->alloc_size = memblock_alloc(alloc_size, PAGE_SIZE);
	if (...)

Seems that it got lost in the search and replace?
> -
> -	for (i = 0; i < io_tlb_nslabs; i++) {
> -		io_tlb_list[i] = IO_TLB_SEGSIZE - io_tlb_offset(i);
> -		io_tlb_orig_addr[i] = INVALID_PHYS_ADDR;
> -		io_tlb_alloc_size[i] = 0;
> +	for (i = 0; i < mem->nslabs; i++) {
> +		mem->list[i] = IO_TLB_SEGSIZE - io_tlb_offset(i);
> +		mem->orig_addr[i] = INVALID_PHYS_ADDR;
> +		mem->alloc_size[i] = 0;
>  	}
> -	io_tlb_index = 0;
>  	no_iotlb_memory = false;
>  
>  	if (verbose)
>  		swiotlb_print_info();
>  
> -	swiotlb_set_max_segment(io_tlb_nslabs << IO_TLB_SHIFT);
> +	swiotlb_set_max_segment(mem->nslabs << IO_TLB_SHIFT);
>  	return 0;
>  }
>  

..snip..
