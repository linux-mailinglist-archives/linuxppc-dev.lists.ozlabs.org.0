Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2478531FFF4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Feb 2021 21:43:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dj3Sv1YG1z3cPj
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Feb 2021 07:43:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2020-01-29 header.b=NuUwTwag;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=kW5lRKS5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=156.151.31.86; helo=userp2130.oracle.com;
 envelope-from=konrad.wilk@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=NuUwTwag; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=kW5lRKS5; dkim-atps=neutral
X-Greylist: delayed 583 seconds by postgrey-1.36 at boromir;
 Sat, 20 Feb 2021 07:43:14 AEDT
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dj3SL0Mlfz30Qm
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Feb 2021 07:43:13 +1100 (AEDT)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11JKd3tk191969;
 Fri, 19 Feb 2021 20:43:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=tB/dvSZM1X/jBc7PdsTaWhjcO8FcDvh672wUSDa5wD8=;
 b=NuUwTwaglOm/EkkdFVtC/tpRVeutlMXWLNObeu6mF4N3ViU9FcoGlVz9WBytpZ0Elf7w
 AVMcKpUkZ8ncMv/jUXfvNLa9fofQtrB6j3Rj1h51/Y7XV3/LmxBvLDffRfZYKmFgc2GS
 HweG5PQ0KRdKqLmkq63o+G46cAPe0xsdWMUXZ/5Fks3LDL0jLvwhuMQjFZpx6G20eC8k
 +IHZ+5OZjRLlbDgLtmflkmODIT23gpWts7uUT7UfcH0vwEh3VsqmKWN+gb2EFOi/vD17
 /3B6EEhrSodOfCfTc9Ps/rZ6rC12H9SFZv+uj0jqk15CZD/6HdPigfR8XcWLDsl0LQaJ 3A== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 36p66rasat-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Feb 2021 20:43:06 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11JKdnmI144771;
 Fri, 19 Feb 2021 20:43:06 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2176.outbound.protection.outlook.com [104.47.57.176])
 by userp3020.oracle.com with ESMTP id 36prhw3yxa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Feb 2021 20:43:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LIqrkcrVIf4cX991XyND1nlQh6kd4fIKaN/zt7Wxsb6WGJntAct1J7nunQiH3i+BHjLtgSgQ2plKvBjre08CuajTCaOjgcXNVuuWBkngmOGMqaVsQ1mlWRkqbfMsEzAH6UE9cattxM2/j/qV42WYNo5RutYSUoy89YetWOdWICmbulMsfWZBQV50iWByk0zBoknfKWCQgbAi6cltCUJoVcQ2v5rh/ir+IOuxLmtqfy50Me1NlXYpXdhqrWHDTWwueNCQDsXFMraCc0JsdAmJG558OaFD0wDA8yyDmghL3vCWUZovtYsN85V+e3QN46ZnehMxbI0LA3DeHxSai3ckFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tB/dvSZM1X/jBc7PdsTaWhjcO8FcDvh672wUSDa5wD8=;
 b=i0M2wFX7Ob40JUrfIizLpHIdhvATot0XRFhBB38F/ealWLAunzUoefcfUE4/pJg5h8D5THDC1RyVfqnysU1W18i4iV6vllkqssbgEqZCDqvPh28UrPgumZ2UugvVd2sxDe1B5n0vvI9w25T5xegQrMwk8XGPdJyKqnL4dC9UjNF+eb2G0+RHU0omugavTRAkBkOuI20vUW/usdRC4kml8MiSQJKegbRPpOmz1V84tpV3e/vpnvRaY1Eh0VW6uhiMW07DmhXMen9aEM2U2HY21wbvc7wtiv8QL5rPHyYug2UGXpiO49UD54v9vsIPRs9C0cnRzN2BS99Rcz2ne2oJfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tB/dvSZM1X/jBc7PdsTaWhjcO8FcDvh672wUSDa5wD8=;
 b=kW5lRKS5Z+UQIwV801kdSgLkQOBZn6qu69czW0mGQaOAps76CTyXHI/KayzpvolPVET2jx9jIyzmH+rO/MMJlLEpMPotke4Erpwd7qpL64FULu7u19Zf9lASAI959/tHptPA//lkz4BN/jIfia+xjTVyOb1EnpKOfjAIAOv7Jls=
Authentication-Results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2999.namprd10.prod.outlook.com (2603:10b6:a03:85::27)
 by BY5PR10MB3988.namprd10.prod.outlook.com (2603:10b6:a03:1b1::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25; Fri, 19 Feb
 2021 20:43:03 +0000
Received: from BYAPR10MB2999.namprd10.prod.outlook.com
 ([fe80::e180:1ba2:d87:456]) by BYAPR10MB2999.namprd10.prod.outlook.com
 ([fe80::e180:1ba2:d87:456%4]) with mapi id 15.20.3846.039; Fri, 19 Feb 2021
 20:43:03 +0000
Date: Fri, 19 Feb 2021 15:43:00 -0500
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 2/8] xen-swiotlb: use is_swiotlb_buffer in
 is_xen_swiotlb_buffer
Message-ID: <YDAi1FXOHVWd1DcI@Konrads-MacBook-Pro.local>
References: <20210207160934.2955931-1-hch@lst.de>
 <20210207160934.2955931-3-hch@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210207160934.2955931-3-hch@lst.de>
X-Originating-IP: [209.6.208.110]
X-ClientProxiedBy: BYAPR03CA0025.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::38) To BYAPR10MB2999.namprd10.prod.outlook.com
 (2603:10b6:a03:85::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Konrads-MacBook-Pro.local (209.6.208.110) by
 BYAPR03CA0025.namprd03.prod.outlook.com (2603:10b6:a02:a8::38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3868.28 via Frontend Transport; Fri, 19 Feb 2021 20:43:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 383273e8-7f20-4b2e-c9b4-08d8d516f425
X-MS-TrafficTypeDiagnostic: BY5PR10MB3988:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR10MB3988C2F1B07B0F0914DB700F89849@BY5PR10MB3988.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jFTnc+S5PmSJiqUnr32F5lQRJwlxvU0bMmpoFDorlslET/3gBF/c7iypaExJjytKNVEvDZgszDy0RoEjlWhEPJywi08C7BidCElpaUFWjCG3t3J1wBX35svD3AzMnlJv+cp1gBmmEWH1I0n8VeGCsx65xqXclPIvAKheAGiVpQXhg03ImViKP1YUEHcU2quiVWYgVX2bCFMEI1RACKYuWZCX/KZo622wWAh/Tsg3fMQqHQH9tkPkKxrOIJTL/VCz6aBTryplq3Z7ZNNLcK3x28iHP/rKvcbDVSgAZZoLTXbUSqbJksOdrX6HWUn5kjtyy59R5O5z2QT4kWan/o1F70HAPBZNRSQG/lgLAb8wX9QwXCETBlnlCqv8r8Wt/LqZ2wWHavybgzynxs29WqHWk1Z9D/uVbnaeNyhj4J0KbxE8pUILCfarQB8RlWIDzd5rNSBoLTeuz2v7qZIFaFAI835syFupCoRGLVNljdlLZogpmnL1Y7VnkysSSrSNICysmxautMgtAV9DoDJQnfsV5A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2999.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(136003)(366004)(396003)(39860400002)(346002)(5660300002)(52116002)(8676002)(316002)(956004)(83380400001)(26005)(6506007)(6916009)(478600001)(8936002)(16526019)(54906003)(66556008)(66476007)(66946007)(86362001)(2906002)(55016002)(9686003)(186003)(4326008)(7696005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?2UROQch2XVpYuI6Fiuld7XK42k7YlTz4wySzQVH6pSPLeR/ifylyghZ4KyXk?=
 =?us-ascii?Q?vuQ9o9aaMUHx3J/kInpJepW+Jr5+BRejkjg2oGtHJ04r0ES79fXmGeX6dyjp?=
 =?us-ascii?Q?HDZXwg4HhNBOpry1AHsghDDGyVa16gIV9ZbJ/1s35Ej4e8PilPdAOAmrzhO8?=
 =?us-ascii?Q?W/edZlpVT0rUmR+oRfy7ZaXvn+owbvWHewnI9rCGb26SrX3jV7/j4/YO+h7C?=
 =?us-ascii?Q?90F/ujU+SmqFevVU0Xnt3V/xVmIknNY78krA6kg1N8egjBmNt7KuTCMxkQOz?=
 =?us-ascii?Q?JT1M2fD0jgKl5meJG2k1upzqzzfa7pPP32Lpphs+ummy/wp3wwF94RGhxrSW?=
 =?us-ascii?Q?I6JjKBmg4hhtdGqyQTcgxIwzEUwzHAYbA7KtiZnPawI+xnJb2R2xqu1uaMBa?=
 =?us-ascii?Q?pLn2jVlxNiL9btFN2dtbG2xS0JUjk+ALdvr0rkjXcTjo+sb3DcG1u5RYrjc5?=
 =?us-ascii?Q?QImJdqLAuABFVYkO5a8FpdAHk3hJbnTtQPkzKkMQ9g+7Ubk5UODwtCTRBqdK?=
 =?us-ascii?Q?1AnHeaD1CuDRZUkmRHD24d+q+9l+jHycwQbBUdNw6iYk6YpDb7hEE7cKhbXf?=
 =?us-ascii?Q?bzcomAwbQZ+8j9mWKfPhljvNvpw6RSfU5O9niMnlzHoObevxk3Nk4wsBu07M?=
 =?us-ascii?Q?ai5ZD1hMK86UPYEaS2wOmMbEaE77Ygl3YwDAWW1EIYx5DUAfCRpRYUsz4v66?=
 =?us-ascii?Q?jXJYcZgZzd+Ty9jT74cVxoDhmybP0Oqmb8b9A1CGAoRuKANgaaYQzpeOekpt?=
 =?us-ascii?Q?XqyyGfW6S9Vd6e41QspXrZcnRmFrN9eD0Rge/OHgorRS1rdcTeb67guADYLg?=
 =?us-ascii?Q?g3Xu9wDr00cZkjFjrV/t+JwCSB6eluC/qfWfelwPkDINjLG/iAkjuchU9eSW?=
 =?us-ascii?Q?yrHfAnGP2SjkMVlnzoVI6IRy+6bIC1nxQ5wtzTs1Kfys++Dd03VX5qnQSQqz?=
 =?us-ascii?Q?vr5PHkjcMO/Q/9TIyMi1nNjPda2On0vk8bzSEtk3e4fKQbCcADY9sTKvZ78d?=
 =?us-ascii?Q?DwgbW7XlrqlpA3aoERIZEKnRnGTQuzq5l/Q4rBuM65dxDKgsq0D/TyZ3f2wE?=
 =?us-ascii?Q?RtZq03sj3SMU0AGUVAtZJFgGp53YMsGH6jiZCA5H1LZiHPbmNYuuzVXxKvZ7?=
 =?us-ascii?Q?B4oALljuzV4yIWzZxV1wP9H+FnOMHD/ljeurlBD9vbsZ1/dxZxSVaj6KFJM/?=
 =?us-ascii?Q?CAsGh0XLyWIIwNqLwfnRhQT/9kbiSvbzHIJApIahdFitAw0pue91XvfgDA3X?=
 =?us-ascii?Q?sWVu0+6eMj15d8dWITgCa3xpQABKxVS3S+bnC84WYF+k+NrDn8QnWGUtxpaF?=
 =?us-ascii?Q?TD7ASglPker/eeZHDXNz3kmM?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 383273e8-7f20-4b2e-c9b4-08d8d516f425
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2999.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2021 20:43:03.8217 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IeUTIh7ZWfW2E2cxgKb0qOdUvPw62eK4SoUIsTO2eL4ELCbeJlEZ9ZAFGEQ8JPRBYXa9VPQanu8ykIHi56kUAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB3988
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9900
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 adultscore=0 mlxscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102190166
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9900
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 spamscore=0 mlxscore=0
 phishscore=0 malwarescore=0 bulkscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102190166
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

On Sun, Feb 07, 2021 at 05:09:28PM +0100, Christoph Hellwig wrote:
> Use the is_swiotlb_buffer to check if a physical address is
> a swiotlb buffer.  This works because xen-swiotlb does use the
> same buffer as the main swiotlb code, and xen_io_tlb_{start,end}
> are just the addresses for it that went through phys_to_virt.
> 

Reviewed-by: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>

> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/xen/swiotlb-xen.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
> index 2b385c1b4a99cb..a4026822a889f7 100644
> --- a/drivers/xen/swiotlb-xen.c
> +++ b/drivers/xen/swiotlb-xen.c
> @@ -111,10 +111,8 @@ static int is_xen_swiotlb_buffer(struct device *dev, dma_addr_t dma_addr)
>  	 * have the same virtual address as another address
>  	 * in our domain. Therefore _only_ check address within our domain.
>  	 */
> -	if (pfn_valid(PFN_DOWN(paddr))) {
> -		return paddr >= virt_to_phys(xen_io_tlb_start) &&
> -		       paddr < virt_to_phys(xen_io_tlb_end);
> -	}
> +	if (pfn_valid(PFN_DOWN(paddr)))
> +		return is_swiotlb_buffer(paddr);
>  	return 0;
>  }
>  
> -- 
> 2.29.2
> 
