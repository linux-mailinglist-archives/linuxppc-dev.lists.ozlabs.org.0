Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8323E4D902F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Mar 2022 00:13:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KHXQk2LxPz307W
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Mar 2022 10:13:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=J+m3Ubiq;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=ZYUAgIkC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=205.220.177.32;
 helo=mx0b-00069f02.pphosted.com; envelope-from=boris.ostrovsky@oracle.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2021-07-09 header.b=J+m3Ubiq; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=ZYUAgIkC; dkim-atps=neutral
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KHXPw1GcCz2xTr
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Mar 2022 10:12:45 +1100 (AEDT)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22EKrivV008016; 
 Mon, 14 Mar 2022 23:12:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=3MuYOLTOkylaHJzU8Tl5QA/7wYuewROYqN/cIfLF+8A=;
 b=J+m3UbiqtVgkvu8k8QZVKYh9CY9axDk5lvp0P/BqCLjEvOJlFzTwl7bdJoqT4LnIkNX/
 InIWL8qw0yoSVl27o87NFLXAa7LknZcfV8JHp72xnr+7y5cZfucPRz3SkeF3cL8O8pSE
 um+LaWXiC3+1kqsIeLaECkK7kuV2jNo//5/eGcGJ7LA9zSLeQGKH2d0U0zHoBct2q95z
 WBpS+byK5nxux83VQ3hTuzvGcv9kWENpN/+yA/MyDD1drzdfDbp+JZrATGqRhXEOl/G7
 1T38tqi2/C6/dJpJYOE4QyLM4/WIC0NfZ5CwKoG6ZXwD0YNpzEtgtrgkfq6iwQRmDVkK CA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3et5s6hn77-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Mar 2022 23:12:26 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22EMptt9056697;
 Mon, 14 Mar 2022 23:12:25 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
 by userp3020.oracle.com with ESMTP id 3et6573cnv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Mar 2022 23:12:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aKaTad3FPHeZAPyJave5/Te4e/R8bfgkZ6OENMhHOkz1cB9XTEoBWAqZcKpxruc8bdQpIw9/TnU4GuHpWp9sSfSQr9cigVrIlPvEfL9i8Pp9JzEGSr1Qr/ttp4IOl8ztfGoySqL2Qs8OO7ZUTDYarcddPQU5gTHSecwRfCxQ0kNtOp+qKSrGrf01RVsmRMeaZhqnRqnkJW+uCqym1RzibotPqfqe3NcNpk3GrYKsTCBhxyA1h8X15OhOtr1UtvXIMOuzgscV8LRb6TPUZ3drODl4aUPXKpwL16frkqxpmNhuSUDEYIwz/O7PxYykb8zploF7Y1WFJzokiJNgnyCsjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3MuYOLTOkylaHJzU8Tl5QA/7wYuewROYqN/cIfLF+8A=;
 b=fFqf1COeKM460F7stQVFHzX1oMZicnWpgRGzk3+CD7j/cjXwzVxhntGHO9wMCF/tY0RExb+zjzJ0pHC7WKVajxZviZ5Ft8ovgmkh/qace9hblVTRg65NSqatCedb5jfYpYhLlOlV4ORbXkkxDITIPn2aCBLvNCZYj81W8keYyYjkRY6QcgpCe3k0Qm1FEulBmlSx2BfqZBAV2oiXDA5Ixd1yLBXR4m863gMxDd/k2eLFpGjpAe4/U53bTFDibHK6DuGyysQg6a9bOl/iqyNbLWPEjW38/VG9nVy6I6z32pk7uH/IGBQq71FdKzuwt+IeRUBlts3XlonXD6ZCHzICjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3MuYOLTOkylaHJzU8Tl5QA/7wYuewROYqN/cIfLF+8A=;
 b=ZYUAgIkCRev6z5c70z+1eL4y3OWTbnItacc0OGfmGKHX41+lAr5slHePQwU0bw5vn6JQLspBTkt9T4N40Npbt8b77/dyvxVsKeDcupCo1WUdXG8U+waXxfSxLZNOCM5f72lacuUV/26lk1CBeK+w6Mki8MpUVNU2NbnmRh+nQDw=
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by CH0PR10MB4876.namprd10.prod.outlook.com (2603:10b6:610:c9::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.24; Mon, 14 Mar
 2022 23:12:22 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::1b2:b41c:b2f0:c755]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::1b2:b41c:b2f0:c755%7]) with mapi id 15.20.5061.029; Mon, 14 Mar 2022
 23:12:22 +0000
Message-ID: <ab552f6a-958a-e8c8-037f-b143119fefe5@oracle.com>
Date: Mon, 14 Mar 2022 19:11:55 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH 14/15] swiotlb: remove swiotlb_init_with_tbl and
 swiotlb_init_late_with_tbl
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, iommu@lists.linux-foundation.org
References: <20220314073129.1862284-1-hch@lst.de>
 <20220314073129.1862284-15-hch@lst.de>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
In-Reply-To: <20220314073129.1862284-15-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0174.namprd05.prod.outlook.com
 (2603:10b6:a03:339::29) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ce63db34-f038-43d7-af15-08da0610185c
X-MS-TrafficTypeDiagnostic: CH0PR10MB4876:EE_
X-Microsoft-Antispam-PRVS: <CH0PR10MB487647FAA3AB7F33C110390F8A0F9@CH0PR10MB4876.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B0K8hDoDVPST/aL8m6OBCaf3lU95SdLcr6GB1QGVC6UapBb4G5kQWPkGhzFS3Pc3iD1xNKMXMHc4xjtHrspy+O8vtE39ttd5670BSmikVMEux+OYclsRbjpj67LalVylecly+UOEKdvy7JVo8hTAuIwJlgX876adEAb1RKDCeyXAhdTpIpAS+JeAeY2ZMPXDmdxekyEcOm3duDaSBvVL8ediexV1tEdc2FC+mqRMZc8Vb0nJwmKNPvEm1a+bFqjv8gAwtD2VWp7f5vUjCDhwtE6CjL8mYxt+Kpir6erkuSL3Dx0zUUZL1uIqmSccyPlQwSi6oKvcoI897hYwMGWVbtEtDXWv9s4yt8Kw9h3HJ/kbPQKH7bE3TBgrNQ6kYzZil0n3ZZ09iQe1dEOeVWw6UX6qN0uzjvb+QRTlejKdWS7YOxg698GEozfGLkLUAps1/YUPXmc1zpD3C2snyYnlP3RHUDn8pkRqNNmSXOj7avexOsfdF6oZ1Nu+zRSTHLtu0s0o6hPxRpqkYT62er2XB6iAcMBdAoo73WhaxcvBy3i/cN7s8ePx+SfZ29k1ilnWgHvixyu6kIJBgY3EnLDCr7v3CiY2n+c7qpvCEsHfK4TW7VK6BmkBFPGaSfyzkZzjSZb+dJG07zlPxCNtHxeBgknZThZZ7XR4KZoOUOvsdnCr3CH/oB0dBmfXVF/P2+CdpbAbHmHHuNAs3rRCHFm1s5bqnFFv1A47CMXe0rjHXUUcI/ygBMUfx6pVNxZleYDt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB5009.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(38100700002)(316002)(2616005)(508600001)(66946007)(66556008)(66476007)(8676002)(4326008)(31696002)(6486002)(26005)(31686004)(53546011)(6506007)(36756003)(83380400001)(44832011)(6512007)(2906002)(5660300002)(7416002)(54906003)(8936002)(6666004)(86362001)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YjBocEZiT2RNV2RCVXYzZFltWkgrUk0reHJDS3RpdzBjYURyM0d1SE4veU5u?=
 =?utf-8?B?NkcyY2o3cnBzMmdhWFVQdHUzZTI4d0swU1hhNURhZjI5ZEphZkpsWEhzQ3Fm?=
 =?utf-8?B?VUVxR0VjaE94VHJBcEUzQy9meFM1ZWdNQUNPcjd5dVN5UHRWUjIvS1RrQXMr?=
 =?utf-8?B?Zi9sbFc4VGoxcktwM0xwYkdyQW9KYlNuNXdwRFBrMTNSOGNDS2JwakhPenYr?=
 =?utf-8?B?a3lkWUdRZFZMNVljeUZUWFBuQVpoVjdXbTVXcjFVSnlNVVUvdWJpQXdRTXU5?=
 =?utf-8?B?UE8wb3FRSFVBRjdEcXFoeXdpZVRncFV4NVJKWkJBeXozMTBoVjcvd01vN1Nt?=
 =?utf-8?B?Wm5pQ3ZFZUR4eUZKNXAyS09HNkJieStVOURFZ0xLV3IvTStRcHR0ay9LNVRD?=
 =?utf-8?B?cWF3SU5SeWZHU005REpzMExuOG5iaXZiQTZPaER0Q05wenNIdnJ3TU5yeEM3?=
 =?utf-8?B?c09sMktyV0dyUHVRZVF3UEh6TU1wQ1ZGWm44ZTZ6S3BjUXlvdnhFV2FSRFZH?=
 =?utf-8?B?dU9yU0c0ZGVKREJnTUxuZFY3aDJnWTJYYXdXV1BFaHhQSzMyeHYzOFVDVlJi?=
 =?utf-8?B?NzgybHROVUlFbmhlRmszb25PRkdONnVUS0lrSEtRUE9Ja09UTFZqNFVBWnkw?=
 =?utf-8?B?U0NROUxQc2VmU2VScXM3V3Q5UG5YTEFsWmx1ZEVWWm5UN3NSVG1HazhZQXJ4?=
 =?utf-8?B?MGFFNlFQeXhDVzlvZEl6Q3ZIbnVHZWhiRWNZQ3BXbXoyY1dDSzVHdmtkeWZp?=
 =?utf-8?B?U0Rlc0pUOCtNV2xscURVUHVjTkZwOFI2UklhMTEvaHZhNjdPQzNDUVBZTGJY?=
 =?utf-8?B?WFRjZ1ExMWhCMHpqWDI2YjlxREJXaHJLNWJaYWgvQ1oxOHBEc2Rkd3cvQkI3?=
 =?utf-8?B?U29BSHpyWXJXOTJNR1hjSFE5YkpzMEdGR0M3bWZ0dlVRdDAycytOZHNmOUpv?=
 =?utf-8?B?QitsVW13RlNKWkF4dElCdVRZckxRWU1iVWtDWDJhalZjSVBwMmdvSEZjQjRQ?=
 =?utf-8?B?ODM3bDV2aFFEY3RGVW5vMEtqclpzK1NuVms5Qm1zbTdWNG1YYUJyRU50SXlB?=
 =?utf-8?B?blVEVktUOWpvTFgvdEJEYkJldnhSVkJEQzM5QVZ3cXhwNm9kbnhocHFLK2RC?=
 =?utf-8?B?U2pDOWJQUVFkc3oxdTQvMkp4a0l2QUd3NE9ic3VKOEFrQUszUlVxK3NnRkJ3?=
 =?utf-8?B?SThqaVM0WGhzTWJVVUsxOVBERmpPYXlMSjk1MGxXSlZMcjZLYityTXdoaEN0?=
 =?utf-8?B?TDZpejQyZVEzSm1XS1NUVEQ3OHdFWUplWTFmZ1ExZGsxUHQ1OWthdlRueG9j?=
 =?utf-8?B?bEwxbEF4bnZoU1JZZ3hjb1NCMWovSzI1a2dTaUlxV1k1Y21GaXFOVXBmWm41?=
 =?utf-8?B?Sng3dTJPalI5U29XMXhrWVY2R2FHeHVHQVpiOHg3QXJpR09Gbmd3S0hQcDJl?=
 =?utf-8?B?Z1B0dURaMFhHc016eXFPSjJuakRYeDJEVndKS2VnNlhIcWhpekxoR081VDhs?=
 =?utf-8?B?bWtJdk9PaFAvMm56Q0FNK1UxUnA5OGxhcHFNQjJFTjhqVER0UWtoT2RqWXdS?=
 =?utf-8?B?MFFzMXFtRWQxVXlaTnhFOG9YeS9Ua010VEp3VXpoQWgvdEl0MzQrVm9jYUt6?=
 =?utf-8?B?ZFNSY2JmWEtLOVJjL0xmSFFETTRETFdQNXUzUlNRekVHMUxTcGVSNUtlSjJE?=
 =?utf-8?B?RjNrNThsSWN2d3ZtNGZkTDZwam5iNzFKUCtLM1hWOW1zdWh1WkhPQkM4c1Fo?=
 =?utf-8?B?c0lEUk9zbUhKaCttTXRGUHh4dTF3SldRQnFNREF3L3ZEWEd2cE1iMHJ1bFlx?=
 =?utf-8?B?dk82RFI4ZkdrUGp6L1Z3WEZKKyt2U1M4LytGV2hQdkJwNCtlT3RZNVBQZTZC?=
 =?utf-8?B?RkY0QU5kT1pPeGx0SkIvU0NvWndkeXJTa3lCUFRxYkFOOC94ak00eW4zdVNG?=
 =?utf-8?B?MzFDOVBUa3E0cnphQmNCWVRna3JyUHRLUmxkMWk3bGc1SUtVbzIyR3ZRZ3RJ?=
 =?utf-8?B?eHJLc01WdnJBPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce63db34-f038-43d7-af15-08da0610185c
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2022 23:12:22.6035 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gUi5UAK090Z5OyKDyRjbcj49X/ouK7laefLVWkhlXxliWGdCYmMOYFUXxjGj2lOX33YemdheTJ0wZW3e1PMBLMKNWmszMJpYSmJavDlJVag=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4876
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10286
 signatures=693139
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0
 malwarescore=0 adultscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203140131
X-Proofpoint-GUID: ACQ41wJtjvZxEcuTUN7WbifiatMsXeKI
X-Proofpoint-ORIG-GUID: ACQ41wJtjvZxEcuTUN7WbifiatMsXeKI
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
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 linux-s390@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>,
 linux-ia64@vger.kernel.org, Anshuman Khandual <anshuman.khandual@arm.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 x86@kernel.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 tboot-devel@lists.sourceforge.net, linux-hyperv@vger.kernel.org,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-riscv@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 linux-arm-kernel@lists.infradead.org, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 3/14/22 3:31 AM, Christoph Hellwig wrote:
> @@ -314,6 +293,7 @@ void __init swiotlb_init(bool addressing_limit, unsigned int flags)
>   int swiotlb_init_late(size_t size, gfp_t gfp_mask,
>   		int (*remap)(void *tlb, unsigned long nslabs))
>   {
> +	struct io_tlb_mem *mem = &io_tlb_default_mem;
>   	unsigned long nslabs = ALIGN(size >> IO_TLB_SHIFT, IO_TLB_SEGSIZE);
>   	unsigned long bytes;
>   	unsigned char *vstart = NULL;
> @@ -355,33 +335,28 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask,
>   			(PAGE_SIZE << order) >> 20);
>   		nslabs = SLABS_PER_PAGE << order;
>   	}
> -	rc = swiotlb_late_init_with_tbl(vstart, nslabs);
> -	if (rc)
> -		free_pages((unsigned long)vstart, order);
> -
> -	return rc;
> -}
> -
> -int
> -swiotlb_late_init_with_tbl(char *tlb, unsigned long nslabs)
> -{
> -	struct io_tlb_mem *mem = &io_tlb_default_mem;
> -	unsigned long bytes = nslabs << IO_TLB_SHIFT;
>   
> -	if (swiotlb_force_disable)
> -		return 0;
> +	if (remap)
> +		rc = remap(vstart, nslabs);
> +	if (rc) {
> +		free_pages((unsigned long)vstart, order);
>   
> -	/* protect against double initialization */
> -	if (WARN_ON_ONCE(mem->nslabs))
> -		return -ENOMEM;
> +		/* Min is 2MB */
> +		if (nslabs <= 1024)
> +			return rc;
> +		nslabs = max(1024UL, ALIGN(nslabs >> 1, IO_TLB_SEGSIZE));
> +		goto retry;
> +	}


We now end up with two attempts to remap. I think this second one is what we want since it solves the problem I pointed in previous patch.


-boris


