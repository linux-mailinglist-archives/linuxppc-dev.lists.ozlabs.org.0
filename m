Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 871B64D8FAF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Mar 2022 23:41:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KHWjJ1m7zz308G
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Mar 2022 09:41:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=wcT5+HWZ;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=mpN+wyd3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=205.220.165.32;
 helo=mx0a-00069f02.pphosted.com; envelope-from=boris.ostrovsky@oracle.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2021-07-09 header.b=wcT5+HWZ; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=mpN+wyd3; dkim-atps=neutral
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KHWhQ0lRrz2yxL
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Mar 2022 09:40:15 +1100 (AEDT)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22EKrrsg003078; 
 Mon, 14 Mar 2022 22:39:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=YUB3eyOnJQjBJ29CUuL6JrbNLuLwNjWuywF7K5wFCzg=;
 b=wcT5+HWZUtlaqV9xbhwbwgjKtgxbYWoJpxJsmyNRy1cu9NIyDDl84ZcmQxAV1jAxG/lb
 2A9pq25IdVO2RJKktbnxBgnLZRc8zrwMpYRVWFBRc9SrZNKBYijoyH+UMUgfShOvK8Xx
 ZcHz/a4/nmS/T8TzE9O+ANjNUy1sUKXKKG5zPIgivN6mmGzd1YVHuZKaJoipqQBkcrsQ
 OlKlGXEyzVs/rpR9k71yYnAAX0xMiiGccxFU3vky2HwJKpwPTLAMfnhRUMdLJtiqHPiO
 8eGZul6SK4gHUoNLusiJCeDlgWhbx8yZN1dcly2SJw51YzTfbHwtpIvatiOa+RJWjY7T 6Q== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3et5fu1pce-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Mar 2022 22:39:41 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22EMVjAR111023;
 Mon, 14 Mar 2022 22:39:40 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2109.outbound.protection.outlook.com [104.47.70.109])
 by aserp3020.oracle.com with ESMTP id 3et64jgy7h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Mar 2022 22:39:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lND4Kd5AF0MzEjgziIBmsPBR9ab6DWR+ODdTU9sJhmxd/aW+3lqhHgJlwEybqQcK5wvka/pgU4wQ8iLTjtkbcZLLlA3jSb0guuhALqD27c6Uqs6w4kNPkKlM9fYrrBWnKLARUKBwg7XYHZxCYmlODD1U4wv/scj41QqukCAzbH4T3UIvWBTLW3Zzql3PfWryzsPgGbGeri4NgFns2RgStoI4hPn9BR01crulKlhol52YRZzWnPodfnx8bJJDQrIrnrraHp0Lu0cSUmgoqiX7ZcQRl7ChOx9ZG3X44m8tVJX+ZrKsX/dRrHJ+Whxz/hSbulV3fBWgZBtgP7FB7gg2HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YUB3eyOnJQjBJ29CUuL6JrbNLuLwNjWuywF7K5wFCzg=;
 b=O0+zzUGW9wpSqP6kbMqJ0x4bUcxLQX6e6tiExVq9iAAa2Rb0E37dlE24qNL5hxsqvS9O88dG6PMnzEmBp/yjBCwMoEfkYwm2SwwOHp3P+R9X3AaIRKK76eNSvun8ploaJybrAwRX62v3Zz2fIHxs+qu73BhB4A4l30cgHu4qocWJXOOEZH3VvK2WwoAq2WsYeDpA+KjLXi3Ek5f8pEuysRQ2bzJvRHdj7K9rDZWHCZUREjvQeo6Je1RQPurY15iArQA7Fch0Rtix2qEwUsNdKJaszIe7Va1wL4tjPMNVOcU6HrOb+9h0Rn9ftSjeF4G8r52iVRuG6jvuBhG6TFveZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YUB3eyOnJQjBJ29CUuL6JrbNLuLwNjWuywF7K5wFCzg=;
 b=mpN+wyd3xPOapE4hcyl/a0BoNEn233/KW75faPdYP8gGdiriezxx+vnRAPE7Uxkc7qK0AR0UCJroOOVy/38GKYfkwL8tgG+FSaST2mkmhLIB14o8lZx16lae7QAJN4RliEa8ORTen/vB2MDqDJZFWABNFG+5vj1tlLUreb9gK2A=
Received: from CH0PR10MB5020.namprd10.prod.outlook.com (2603:10b6:610:c0::22)
 by CH0PR10MB5115.namprd10.prod.outlook.com (2603:10b6:610:c4::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Mon, 14 Mar
 2022 22:39:38 +0000
Received: from CH0PR10MB5020.namprd10.prod.outlook.com
 ([fe80::e52b:dcd7:84b9:cbd0]) by CH0PR10MB5020.namprd10.prod.outlook.com
 ([fe80::e52b:dcd7:84b9:cbd0%9]) with mapi id 15.20.5061.028; Mon, 14 Mar 2022
 22:39:38 +0000
Message-ID: <4d800aa8-5e38-1ad9-284f-1754c83d0f8a@oracle.com>
Date: Mon, 14 Mar 2022 18:39:21 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH 12/15] swiotlb: provide swiotlb_init variants that remap
 the buffer
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, iommu@lists.linux-foundation.org
References: <20220314073129.1862284-1-hch@lst.de>
 <20220314073129.1862284-13-hch@lst.de>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
In-Reply-To: <20220314073129.1862284-13-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR05CA0010.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::23) To CH0PR10MB5020.namprd10.prod.outlook.com
 (2603:10b6:610:c0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 10731717-0988-4e71-1982-08da060b8564
X-MS-TrafficTypeDiagnostic: CH0PR10MB5115:EE_
X-Microsoft-Antispam-PRVS: <CH0PR10MB51153240CDB5265CD0BA78358A0F9@CH0PR10MB5115.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J3bgRFBLV/4FRgN5UplzfxvwakHV2UmmO8g0f87nGPRZfXHD4NSaijqc7RoHFmRaqtX49TpKjWOpbouoB2SGc+RrfYZzX8bQWvabweaYhGYYB9PpA5Pbz0M8t0DiMqr/zNY3Zq34XRrmqONoaEMoX76Ng8hYOPxd6/CJFTQU8PKXF4AGEjsJ5oZzJxQ+eucZ1464gVpUNWczWBsX/r+O1IcRejrf/58Dmb8tAA65sJfEyi9bFvpbZVQNjVjt8gV4TTChzDSAcKRSb2k9MgrY+Tney28oF4YtrVPVJRUwMOHusls5WPYum2IWzNXr7wtWpJU+2JTsceAHTmomPKvtbk5VXKZe/62ggyDoOFgqW7Lorki3EtKfSz4iJl+8NZHsNP4W/vWshmi2mqPiSrV9qWejkBLcQtwBxOlqPoTnslyFTVGExp1f2j673XerQl49ljAFhHModZOzcQG92ZT4GyMf0tMFs1hqfqAx0pQ3/u8EFhZeEKMOpFHRZjNFH9vR5y1H2tSbhe/zYdye5GVy6lj6DmrhfUqZeZe7LB55GYwvwvtjc/4Fj1pey6OHDiUkQErKbU3LUXPY4JGOi4yRkz9gzNICM6g9z3/kGGVo0EAAiWVzesHtWSXDCYbTQPA6Wi9lPJ3x8ODVBGiqsY8ipJg1zBDO1XdyC474qq0xUx6JdkqG+VuYGaGgOoIKB3xIrehaUE5U3+qi6YckknYJKO1NFl/hSBP1wiO8DfDloBW4M0AmVhrpkkx4GoEHA8rp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR10MB5020.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(54906003)(38100700002)(316002)(66946007)(31686004)(66476007)(66556008)(8676002)(36756003)(4326008)(31696002)(5660300002)(83380400001)(6666004)(8936002)(44832011)(6486002)(86362001)(6512007)(6506007)(2616005)(53546011)(186003)(26005)(2906002)(508600001)(7416002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WU1oQzdxaGo2Snp3b0RmZ3h3d3BzSk9GSlQ1SHNDSUZ3ellic0Exb2xZWkNP?=
 =?utf-8?B?YWQrMzJHT01ZWGt1WmRJdTA1L2ZtQldybjJ1NDFCTjJVOFZrcGNCTlNrVWxM?=
 =?utf-8?B?ampXdmNsdVlldWxaUUR3WDlkZ0FlQ0hXemdyaEx3Si9IR0NKZU9FaFlKbnll?=
 =?utf-8?B?dHRIZFJ4ZXNFNUpXUVk1b2pVMTUybHhwSW5PVHhEMnV5cUs5UmRoeVFFcENx?=
 =?utf-8?B?VGNydmcycXAyQ0w4L2lmQkdYSDNGSzZIdE11OW5saU5TOE1OYllOcHJLOVBq?=
 =?utf-8?B?MkhuNk1ZOHBMcjdtQmt3YTY1eWQvSWh3Sm1vZG8vSzB0SjZzOXBVUjgrakpB?=
 =?utf-8?B?T0E3MGdQek55T21kUllyOWdDWS8veTJrRTdMNDdtaGRSN0FDbVVRNHdSRnhC?=
 =?utf-8?B?eTJCVmtoYTlmVDgzY0tOajhEK29lTENlUkxwY2xFTkJ6eDRFdmJBYUROMURC?=
 =?utf-8?B?OXFKVmhWWXp4QmtsdGY3UlU0ZldhNG1VVVZXZmwvUSthK0VlNlpoWERiUGJL?=
 =?utf-8?B?VjlRSjY2MDNnbVh5STN5U2FXUmVRQXBYVTlYcUtHb0xJclZrOE43d2pFNmFR?=
 =?utf-8?B?cHQ0bjhoeitCbk5EVXU3bk9EeGlQQ3JLdSswSFl0dWZPblRxaHcwbmo2UWJ3?=
 =?utf-8?B?b1psYm94enlpK3orUWFFb2FFUXBocUw1S2sweURFKzMxU0YyWmZaMUdscVZ4?=
 =?utf-8?B?NU1zTWVnSWdTRE9vdXArUnZCa2Y3Q1VkZzVGc1hYT2R0VU9ySnVGRFhFUmdF?=
 =?utf-8?B?NUNidzRoa0h0WStVYTlHVWcyRE1HR3NhSWVsZTArcjJVYXV1dzRkcWVkRXhQ?=
 =?utf-8?B?Z01KSytUUWJ1Ykh4V052dWYyMmo0NStqdURRbWNpSEZOV001aG1Jb3JMNHk0?=
 =?utf-8?B?Q2FLZmJzV3pDVnVZMHdWaFg3TUs4RDZUR3N1b1BhRVRWMTVHdEY3NjFoREc0?=
 =?utf-8?B?RFhzS2RsdCtLWFVSUWdCdHZUdmNkU1Q0NTFudk15RndtdG8ybkNFNUVjVUxU?=
 =?utf-8?B?MEJoaTNtSCs3N1dZQmRjZzB3R0xsL2MySWM0QXBkZTgwYWRoSy9nc2JvQnFE?=
 =?utf-8?B?MG5NMjEyeGhkWWRCMmNja2dST0svQlFQMHdhWlRQMk9Fd2Q3WUltdnR6SFRq?=
 =?utf-8?B?WkF0Z2N6R2JUMk5GUVlYTkZRYTZTUFk1UlppdUpvRGZIVk5MRENla0pmck9E?=
 =?utf-8?B?b3pGRllCcjZWVHZIMjd6NUJZWElJM0hQUDNBTVZ3cndOTzU5aTcvS1BMRFpn?=
 =?utf-8?B?YVFadk5NTUh5emE3Rkt1UGVVQ05OU1g4RzBXbUptTWVpN28zZmpmN2VXYlpw?=
 =?utf-8?B?akN0R3NKRDlpdHpMZmQzSmhDd2xGTVVqbDZyakxVV0w3V1oyU0VqSDIzVjZB?=
 =?utf-8?B?dXRQUE5WMWpqTkpGcjdiWC9La0x1bTF2SU16SXl2R2U5ZkpVTHRVYlFHY1Fy?=
 =?utf-8?B?QnB2a084VWdmRjQxcXZXbnlHMHA0dGpXOTRlQUM3SkZkajRSdVpWRUJqSEIr?=
 =?utf-8?B?VjFpUlZyN3Bkbzl3dUpLNklNdDR3a0ZhQW5RR3ZBSGUxazF4YlVLL01FdFlB?=
 =?utf-8?B?ZzhDdnhvaDF1SnlPMjNMODlBdjR1bXNJN0ZLMm45bk9Oc2tkRENYRGtNWG1P?=
 =?utf-8?B?S1R0ZUpCQTVXamVmSEdrMk1WQS9vUVZmdDhKUm5jUmZiVEhpL0NRZ0V6SDVV?=
 =?utf-8?B?Um9NQ3N6VXdvT25Rb0tralQvT3ZQdjFKM1l4bkVzTGNoS3RHVm1ibEVXbHdV?=
 =?utf-8?B?cm5Nb1BXTHlsZmo5Ykk1c0dpUVhob2FrVWZoYVpnV3RkSnpyQzhGNmFTbjNG?=
 =?utf-8?B?NGZXeXVlWVJibzBVaXQ3c25zek9xbmR6VjVxQVBIOUdkWFpxeWNFa0UwUk5w?=
 =?utf-8?B?b3VoSWdJZjBhRy9yZnA1SEVsRFZSOWVTZExiUHp0R3dEYW5CVG5TTVNLbTlu?=
 =?utf-8?B?emZVekYrVnM5aXNQUTQxWXRxK2I1dldVcmFDZFhVTm5VREFVbVFPQ1VWMHVp?=
 =?utf-8?B?RkUzbGMyVzBRPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10731717-0988-4e71-1982-08da060b8564
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5020.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2022 22:39:38.0870 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WvgZpS9smdVuPGmXNwQvWZfoQLLUQM2dYH7gq67QBBhZq4r3Lxl10xnErMBwsSzsIwoKaDtLJgBNkQpT6hIV5pwkkHyVpny1eCaQiJ8Nblk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5115
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10286
 signatures=693139
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0
 malwarescore=0 mlxscore=0 suspectscore=0 spamscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203140128
X-Proofpoint-GUID: M_Ojeg5hmnV_qlJcsebHEPBLHVZta-Ao
X-Proofpoint-ORIG-GUID: M_Ojeg5hmnV_qlJcsebHEPBLHVZta-Ao
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
> -void __init swiotlb_init(bool addressing_limit, unsigned int flags)
> +void __init swiotlb_init_remap(bool addressing_limit, unsigned int flags,
> +		int (*remap)(void *tlb, unsigned long nslabs))
>   {
> -	size_t bytes = PAGE_ALIGN(default_nslabs << IO_TLB_SHIFT);
> +	unsigned long nslabs = default_nslabs;
> +	size_t bytes;
>   	void *tlb;
>   
>   	if (!addressing_limit && !swiotlb_force_bounce)
> @@ -271,12 +273,24 @@ void __init swiotlb_init(bool addressing_limit, unsigned int flags)
>   	 * allow to pick a location everywhere for hypervisors with guest
>   	 * memory encryption.
>   	 */
> +retry:
> +	bytes = PAGE_ALIGN(default_nslabs << IO_TLB_SHIFT);
>   	if (flags & SWIOTLB_ANY)
>   		tlb = memblock_alloc(bytes, PAGE_SIZE);
>   	else
>   		tlb = memblock_alloc_low(bytes, PAGE_SIZE);
>   	if (!tlb)
>   		goto fail;
> +	if (remap && remap(tlb, nslabs) < 0) {
> +		memblock_free(tlb, PAGE_ALIGN(bytes));
> +
> +		/* Min is 2MB */
> +		if (nslabs <= 1024)


This is IO_TLB_MIN_SLABS, isn't it? (Xen code didn't say so but that's what it meant to say I believe)


> +			panic("%s: Failed to remap %zu bytes\n",
> +			      __func__, bytes);
> +		nslabs = max(1024UL, ALIGN(nslabs >> 1, IO_TLB_SEGSIZE));
> +		goto retry;
> +	}
>
> @@ -303,6 +323,7 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask)
>   	if (swiotlb_force_disable)
>   		return 0;
>   
> +retry:
>   	order = get_order(nslabs << IO_TLB_SHIFT);
>   	nslabs = SLABS_PER_PAGE << order;
>   	bytes = nslabs << IO_TLB_SHIFT;
> @@ -317,6 +338,17 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask)
>   
>   	if (!vstart)
>   		return -ENOMEM;
> +	if (remap)
> +		rc = remap(vstart, nslabs);
> +	if (rc) {
> +		free_pages((unsigned long)vstart, order);
> +
> +		/* Min is 2MB */
> +		if (nslabs <= 1024)


Same here.


-boris


> +			return rc;
> +		nslabs = max(1024UL, ALIGN(nslabs >> 1, IO_TLB_SEGSIZE));
> +		goto retry;
> +	}
>   
>   	if (order != get_order(bytes)) {
>   		pr_warn("only able to allocate %ld MB\n",
