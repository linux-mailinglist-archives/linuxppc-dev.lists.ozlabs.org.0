Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E7F320013
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Feb 2021 22:01:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dj3rz6bNKz3cP8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Feb 2021 08:01:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2020-01-29 header.b=GHDkVsZa;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=a8khe1Nb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=156.151.31.86; helo=userp2130.oracle.com;
 envelope-from=konrad.wilk@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=GHDkVsZa; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=a8khe1Nb; dkim-atps=neutral
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dj3rP4Y9Tz30H7
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Feb 2021 08:00:36 +1100 (AEDT)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11JKx5C3034782;
 Fri, 19 Feb 2021 21:00:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=UqlfMFUiDpITjvYlTcrtKvtc2PjKHLcDk3gvr6X5NFY=;
 b=GHDkVsZabbK6MQK/2sMpriOwNE8OOry0IxfItawRGxrWvuc0fmmU3uyDsFA8M6aCMqQP
 g8FgoTkN4wM8UpBrvt0E02ohR4JkOBN9UenIoeK9VaLgmfJGDMDIxW5RPovSGb6oeOjE
 pEesFTfxLgCUHHwgHiFGhUZog3qTAAfH9cGFAzSNtgJZ+V6YEPZ5KjB+Ar0/WNP3OGqn
 iUUL0un0GmqZWVaaSIaJCYWjF6EFoZPJ1xNJOVQc/+5L3W5+Luz0asC5sgZs8NR2iGWu
 YgPbZAvvVmpIVv85biV3xB5FgBFFgIuN+h6zPv+iL5bhw2fZyu+Q9y0ejyEaxAXvHfsD aw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 36p66ratgk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Feb 2021 21:00:30 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11JL0Gln015849;
 Fri, 19 Feb 2021 21:00:29 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
 by userp3030.oracle.com with ESMTP id 36prq2c8wb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Feb 2021 21:00:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MT74IFNh5PljWJ5GOKU9nN8+5VCKDN2S55rMBcishaDOfXtBKxzJwvxDrV7TZwoEMQu4Vbu0z+9osQ+0N58Yg+vucSGPAJgzWWViNsTBytJzjo83nJr5oNGlSVnIjXs9I713eQrCeem6PsMluUfx7m62Z24Fi3KUOPthvAoE58pVwjtsYK9+Bcb+znurccFA//kOZlLbY+RsBXd1jRXXCXg6NqWhnZQiRTrhfOaLwqp3s76wNi0z7wbouuRBjfSoZYjbmeh81nbWtsHaWrTibqIhu6KIq7tXl0ILA8O0hn3Z3LNKwkEY7z4fU/7uQQL0sX7XSgPAWJJSrjSRio3ypw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UqlfMFUiDpITjvYlTcrtKvtc2PjKHLcDk3gvr6X5NFY=;
 b=EgJUIGf2Sp2FRic75OJladf1FNn/SntjPzEMia2I/uwSUVNI6JlqiFimDp7zTh59tqYBorQ4JymT1ZqeroPlyhxfzVdzPEYMpzUm6bquA22epKOX6NriNbRMq6+L2Zxvzmk/zlCyqpLb3W9Yd7OPzYpxBzeZTFNMSggcQhzX7nohc1mB8G9pbb36mB39827COtQMrGIEOsR/4VvXkxaBU6ygfwQec5pNJRw5rMMCOqDxbTgQ6JvPO6apgRoBzeZ64vMLaMz4EmlETThbOh7kdzV1zqPA5ucwOM42azEQ8TMnSQZ0AH1MPB/QlhO2V1BKCXopOmnqwfRIRgN5u4h9Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UqlfMFUiDpITjvYlTcrtKvtc2PjKHLcDk3gvr6X5NFY=;
 b=a8khe1NbiTabokezKPPkNMEYHdOT/n+e/nSxIewEk8/bO6iT0i++XcICr2Y66EeI4AYTQtLCx08hNCQdMpJvapuHqgN47H8qIgU/rLqYfqBrZOSbiYr8fQvgCTMn5ii4AigwPe7Rrv7zdaubti6tBoJqfjObgEnj2yUVpMceCVY=
Authentication-Results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2999.namprd10.prod.outlook.com (2603:10b6:a03:85::27)
 by SJ0PR10MB4526.namprd10.prod.outlook.com (2603:10b6:a03:2d6::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Fri, 19 Feb
 2021 21:00:24 +0000
Received: from BYAPR10MB2999.namprd10.prod.outlook.com
 ([fe80::e180:1ba2:d87:456]) by BYAPR10MB2999.namprd10.prod.outlook.com
 ([fe80::e180:1ba2:d87:456%4]) with mapi id 15.20.3846.039; Fri, 19 Feb 2021
 21:00:24 +0000
Date: Fri, 19 Feb 2021 16:00:20 -0500
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 3/8] xen-swiotlb: use io_tlb_end in
 xen_swiotlb_dma_supported
Message-ID: <YDAm5Mfd7lILBrl6@Konrads-MacBook-Pro.local>
References: <20210207160934.2955931-1-hch@lst.de>
 <20210207160934.2955931-4-hch@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210207160934.2955931-4-hch@lst.de>
X-Originating-IP: [209.6.208.110]
X-ClientProxiedBy: SA0PR11CA0196.namprd11.prod.outlook.com
 (2603:10b6:806:1bc::21) To BYAPR10MB2999.namprd10.prod.outlook.com
 (2603:10b6:a03:85::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Konrads-MacBook-Pro.local (209.6.208.110) by
 SA0PR11CA0196.namprd11.prod.outlook.com (2603:10b6:806:1bc::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27 via Frontend
 Transport; Fri, 19 Feb 2021 21:00:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 58b9bc58-6d20-4af6-e291-08d8d519608c
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4526:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB4526A494E303AD546FC1990F89849@SJ0PR10MB4526.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 09nqe3xyOrlaqEKeYPnkiRKRmGjoNc7l50xIzmn7uVFpbsVZ8YhbDxdjkEj0r1AXM3JVTXM/1/MbgYEKzPj3Ji/HWoAlC28B9hoVKLmGf2dsZmyxSw1/E6ZwKMEroo6Q56MVoe85bwDTL7Stl6RYq9+fG+1duWtjPYl4w5mPLxmcgIRwZoI+/0DbiJcEAjYH51OaQPTKn47Sn0gmqUfMUFcHawZdbxT/4QHQXAGjqhBdpUEWyZdyf4AEG7JkXhvedB78vyKzdGJFrZFMz6MblF10gEQ75Zd6Sg9BCDBMbugYXbS+kGVg4OUpvm1SEKdsmzyODgE6zC4/Cu0l62+l9LfmUF71xDjV6RgupgH6olUwZmZPHgiChkJCg6wbcPMke/kIUGqrGTsmEB7kQqN5KokREFEq4zw2/sffYvKRYtnzh/lKA8f6G5gi9WVrgafinW+Ezj4VPMmccHHWvCxTTJ+DTOsMetMrm8Gcjy+sz+uff300VmIZjpDQKaUmi3P6v1oaUZeBkKLxkasZU97fTg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2999.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(366004)(376002)(136003)(39860400002)(346002)(7696005)(66476007)(6506007)(4326008)(66556008)(66946007)(956004)(9686003)(478600001)(52116002)(86362001)(54906003)(186003)(26005)(6916009)(8936002)(2906002)(55016002)(16526019)(8676002)(83380400001)(5660300002)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?29+DMH2ZNIfHkBy6u5qzPXMdjy6RNMwCjwRXQLW0+WMAdrRZteX+ZakgBs/H?=
 =?us-ascii?Q?XBmCPOvcUx2v1h+8S4DUFbgcDM8AwTCcWExPLVnNrV20AaTKMIYaBUBhchkN?=
 =?us-ascii?Q?lxVzaZOck8f27FunuklHqqn8CnL82gTh90oP+jj60bG/RELpsBAILRcrjg8g?=
 =?us-ascii?Q?Gx4I+SrvvxTLmVTJSir5vFRKIpBbpfRQ2luoRg+okM9E4/c2zUIFNSM6jQUU?=
 =?us-ascii?Q?weBOvSSeLrnKQB1yxBYZl4GVZsUqYqDFFMjMzQkCtXoJCOTDbozSWwzMf2E/?=
 =?us-ascii?Q?7eRA7gtLVtbPKjvebReDJon2TwEKaDt/BgCC/YslHBYhq7tyM3gENOI2gCWg?=
 =?us-ascii?Q?+Ns+2uk4l6Q/kryjmhdFUsQEj3g5tGHMEzxYA21dJv2xcLReIwftW8dqBmOO?=
 =?us-ascii?Q?h9X98wV+BUEGf8+MPOvo1pgRBS8FTBsE48JBiAoGL+lF2z+ICecxupMdtBNp?=
 =?us-ascii?Q?vSvHHROFNEu1VlhrebX2gQUtkinlaCmKrVNSXcmevSSyebmIvePJK9VYD4cx?=
 =?us-ascii?Q?UpaWyfc6qd44M9hbbLEHNHclTAIL0mvK4qn6bb4Zq3Zf7xAhrJZ7oZr6IYf3?=
 =?us-ascii?Q?sTnQy/In+zvlsBUJ7WDOAjyjsrLE2dXbA0uahbsmYtYbpJAnPCv5p84s/KMA?=
 =?us-ascii?Q?5P79YQiBRxjQKqvbGajLrqZrbPCrAmvThxXTkr8IufGG1wjLp8YV1g4bZavL?=
 =?us-ascii?Q?rC09kqXXnwiTVQ58I/ImxxreOycjRCelyic3qE42SelrHZWFD6lBTwEXGreG?=
 =?us-ascii?Q?Rc8MfAFt3t7K6Tc/wNBUsDkVWBYZT0aoSjZ544IVf53PUc5Zx9jQz3yvdxAu?=
 =?us-ascii?Q?65iEIjybrVXaRIFB4suhjnFxXVGVI+TjE3+bpH+vcfHyye4zf7cv1xvJtZqJ?=
 =?us-ascii?Q?mURO+xJF6/aMbTCv2RrPTy7pmnYxp2Hru8yM73hN2dRxvR5GyFWseMzb3NWJ?=
 =?us-ascii?Q?b3/i+Se1JkTBBCmpQCqlM274uoY/4wpRGHRwvj8/g534DoHzuCtqEtD30oFl?=
 =?us-ascii?Q?gzJoFJNSJJRyrGqWH1KgXMGg0TXCxG60wimI0w8VWAqZE3XDsR/ds4je1vt+?=
 =?us-ascii?Q?+JduKl2O/7x9s6mGWAWUqLVWDbs6MeCcK9rzdXTYzlV7QdscTtH24KFwFDDo?=
 =?us-ascii?Q?L+YxiFPwKt2P8Z25RcJikIwz5aDL/JphOZ4eby7uIlxz39efeWSuQ6F6nnOi?=
 =?us-ascii?Q?s88F0Q6NMsaw4xxX9Le5rxqWrwB89lf5qeIij16BNUOFH877gaQGTrR3JtdG?=
 =?us-ascii?Q?o4BxnndMUs7MiVnqGLJtGZmtP95idx5dwJUoyu4kwqeEjMJL2dyAwlaXbT+e?=
 =?us-ascii?Q?FcEgG++qF6FotmCatH/2Lxm3?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58b9bc58-6d20-4af6-e291-08d8d519608c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2999.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2021 21:00:24.5708 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 06gukbd3g2XPcDBY5Jqo2xvEEBrt7YOzdPFThTPzuhTFuMv6+pGzkz0/qRByXmJIbsZaGs2uqhSjpfiMg0xYHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4526
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9900
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=999
 phishscore=0 adultscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102190169
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9900
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 spamscore=0 mlxscore=0
 phishscore=0 malwarescore=0 bulkscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102190169
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
Cc: iommu@lists.linux-foundation.org, xen-devel@lists.xenproject.org,
 Claire Chang <tientzu@chromium.org>, linuxppc-dev@lists.ozlabs.org,
 Dongli Zhang <dongli.zhang@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Feb 07, 2021 at 05:09:29PM +0100, Christoph Hellwig wrote:
> Use the existing variable that holds the physical address for
> xen_io_tlb_end to simplify xen_swiotlb_dma_supported a bit, and remove
> the otherwise unused xen_io_tlb_end variable and the xen_virt_to_bus
> helper.
> 
Reviewed-by: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>

> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/xen/swiotlb-xen.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
> index a4026822a889f7..4298f74a083985 100644
> --- a/drivers/xen/swiotlb-xen.c
> +++ b/drivers/xen/swiotlb-xen.c
> @@ -46,7 +46,7 @@
>   * API.
>   */
>  
> -static char *xen_io_tlb_start, *xen_io_tlb_end;
> +static char *xen_io_tlb_start;
>  static unsigned long xen_io_tlb_nslabs;
>  /*
>   * Quick lookup value of the bus address of the IOTLB.
> @@ -82,11 +82,6 @@ static inline phys_addr_t xen_dma_to_phys(struct device *dev,
>  	return xen_bus_to_phys(dev, dma_to_phys(dev, dma_addr));
>  }
>  
> -static inline dma_addr_t xen_virt_to_bus(struct device *dev, void *address)
> -{
> -	return xen_phys_to_dma(dev, virt_to_phys(address));
> -}
> -
>  static inline int range_straddles_page_boundary(phys_addr_t p, size_t size)
>  {
>  	unsigned long next_bfn, xen_pfn = XEN_PFN_DOWN(p);
> @@ -250,7 +245,6 @@ int __ref xen_swiotlb_init(int verbose, bool early)
>  		rc = swiotlb_late_init_with_tbl(xen_io_tlb_start, xen_io_tlb_nslabs);
>  
>  end:
> -	xen_io_tlb_end = xen_io_tlb_start + bytes;
>  	if (!rc)
>  		swiotlb_set_max_segment(PAGE_SIZE);
>  
> @@ -558,7 +552,7 @@ xen_swiotlb_sync_sg_for_device(struct device *dev, struct scatterlist *sgl,
>  static int
>  xen_swiotlb_dma_supported(struct device *hwdev, u64 mask)
>  {
> -	return xen_virt_to_bus(hwdev, xen_io_tlb_end - 1) <= mask;
> +	return xen_phys_to_dma(hwdev, io_tlb_end - 1) <= mask;
>  }
>  
>  const struct dma_map_ops xen_swiotlb_dma_ops = {
> -- 
> 2.29.2
> 
