Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FAB4A7BC9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Feb 2022 00:38:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JpysK698nz3bVK
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Feb 2022 10:37:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=wxIzXWVl;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=rS4sWZZE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=205.220.177.32;
 helo=mx0b-00069f02.pphosted.com; envelope-from=mike.kravetz@oracle.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2021-07-09 header.b=wxIzXWVl; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=rS4sWZZE; dkim-atps=neutral
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JpyrT50Nwz3cQJ
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Feb 2022 10:37:11 +1100 (AEDT)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 212KwbPW010115; 
 Wed, 2 Feb 2022 23:36:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=/cRydjx/qDvXcJHwjVTMF9NnwcYBRYuWbLwXc4HEdmQ=;
 b=wxIzXWVljEQNOo0MLFiFiJRVrN08bC/9lQdHpcbvZgLuY6T1JNxkLx+WUsfN76OU/cZR
 sCDQUsphybZMr2AnAJV8pzfz4O88vk2zvaMaAWgQUBKrayqElfDUTVRqZL5SLkl+bD4a
 DiDLQrSA7Fy1aRFl70+pQFs4TnRXPW/oF6/aRVWwnNNtreiQz6ZtTL1olpaaDeRbK8yH
 mBtJRDZLd/eGzsWNC6SbmybjZV9PMTEmaJKpOS62skU+SFsl7i8f+6wtVTrj2GinOoEM
 n8+Ox4Zo5BHLPdDkBJbLhGSi4V0rcJ0wK025i0dIIsKI4Grjhafy5lsbG92mzuozNdcO 2Q== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dxj9wfgw9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 02 Feb 2022 23:36:46 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 212NaQ9p069918;
 Wed, 2 Feb 2022 23:36:45 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2177.outbound.protection.outlook.com [104.47.58.177])
 by userp3020.oracle.com with ESMTP id 3dvy1thqyv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 02 Feb 2022 23:36:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UvfbS5Oq/1Cm8elxw5+yjOhY94B1JBYVBAd0qOa5kxO6vjuwVNn6nYfcWqynrYojR8hU8LIKCZwmynr/sKXeTRTOYF2w0Z9REtKdGWTdMEaXLldEHMZh36EEd0gdTjUxP5Qk0RPVybEOnEsGkiuvVfUOIrqpUfSeLv2cpT6+thVUloJF1sjlAPtR6yQQXT16zkGmg1xB10Ug3pImiuE7pnC7j59jPMUmwzqu49NYUvSKepeJBjLLLsG8xBxOQBUEPEnuEJYLAk0ClhpYzQGGL/YyMj/TB3HF2Lpc8HfttogGqfs5NDSn20ZG3l5KMP88zgHntLGrYYUd2DKjSClNDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/cRydjx/qDvXcJHwjVTMF9NnwcYBRYuWbLwXc4HEdmQ=;
 b=JdEo+7LHbWgmwgBKi5+XGBEQE5+rbXNxPscwsBL7UcQkOLjrjjjfLnCGsdbKpdAqJh1LzZahblyPGYbwppffsZ/vBKvSoxCONCQmBaxkFzgHOxPaPtITurUd9vnv5pdwUfUnn8BP+aynGcoYw3xmVMPIOT83jSihaavylBMs+bo6GJvV8xbru6pYpg4frSwbTn/d8mOI+PuT4hsns6tSjZwL5pTrqsPdkOK0TSpQznwCR9q0CLKSH7erR6vffpSV4nx4L0ejxs+tOAHrZncsR+oaSjbqksq0xyCzkw8DCyPPCs+htQT0pD32JHEIW9wgPNDHRNDUOJ8aD06i+JDabw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/cRydjx/qDvXcJHwjVTMF9NnwcYBRYuWbLwXc4HEdmQ=;
 b=rS4sWZZEjlvMuVVtaJj/kTcinjbOaqdd3+8CHjDJ8sYSC+CKIvClivk7Q6ffy7/eOmh30ln/5LTlwVwA41/r/a3ZYCFqC7f1aOuasGJ2JXEONpuZrgNA/Xaz2ez9fBRmYeFrt0ecTcXugeHv+3Nng2bE3g8btweZ7t1LEXTXqTU=
Received: from BY5PR10MB4196.namprd10.prod.outlook.com (2603:10b6:a03:20d::23)
 by MN2PR10MB3695.namprd10.prod.outlook.com (2603:10b6:208:10e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.20; Wed, 2 Feb
 2022 23:36:42 +0000
Received: from BY5PR10MB4196.namprd10.prod.outlook.com
 ([fe80::11f6:860e:575a:e6f1]) by BY5PR10MB4196.namprd10.prod.outlook.com
 ([fe80::11f6:860e:575a:e6f1%5]) with mapi id 15.20.4951.012; Wed, 2 Feb 2022
 23:36:42 +0000
Message-ID: <11d0036e-e6b6-2b8a-836d-bd75b8bcd64d@oracle.com>
Date: Wed, 2 Feb 2022 15:36:40 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] mm: Merge pte_mkhuge() call into arch_make_huge_pte()
Content-Language: en-US
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org
References: <1643780286-18798-1-git-send-email-anshuman.khandual@arm.com>
From: Mike Kravetz <mike.kravetz@oracle.com>
In-Reply-To: <1643780286-18798-1-git-send-email-anshuman.khandual@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P222CA0029.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::34) To BY5PR10MB4196.namprd10.prod.outlook.com
 (2603:10b6:a03:20d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d12b243f-999e-41f5-3bee-08d9e6a4de10
X-MS-TrafficTypeDiagnostic: MN2PR10MB3695:EE_
X-Microsoft-Antispam-PRVS: <MN2PR10MB369567CAD62005D9645EAA04E2279@MN2PR10MB3695.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ddshtpmlw4HSsyxxxHBSBXIsDjgZSCfgYXBHbjrxVK3/kxBYIyG5VD7nXu/LRG36Fb9YHmly1lgOMKTDEvLvNHpJC8Xqe0kWaBjZgjHAi6e2OrugpYkKYmzyBMe/j+0LDLSKAywVHDvwdMPMd9OYWdoznmLK/oc+IYyLBWl0dI10B09s8Oe6EQKtVX/Lsp4kAex6qJd7VJ+wYS8n4MtJEifO4eUAZjRNm6VVt/VZnVQujZmgSKdq6fK4PvObDKj/0yuBNc+8h8yuU8rJwd1G7epp4pfbD1JG4WODJ/7IhtP6GfbAzpBIhOGzDS/e1wYiHd71kvucKH2zFMtaPIpYX937YfGR9NhDPmMnu7A4QXm2tVptVlGEkaDrRDvDV2usS8SGx5dRhjoJvI/1yNKbebVkPwREcwd3u37pGYobZOPRsd07Nxe9c6sbM2HmfVdAcaftjddQrRXf5CDllKt2xLf1g+nAewbQ+ejP14YKt6ta0y+RxkgdOUucPUJzterbYpn6QBDnG9Yi1dP71fzlyI8WPJZIXyZwOtkjYrH4PgtIbNY8IKdcvJw5hh3P8a7GI64IRPGuxR1TdiFrNch9TY4oSAB4lYclZpMMBA41vTjtDdMSDwOTHM1phWRSCI8t9KBUUR+3rd10cyYWVKoQ26/XlsFEoL3LVyGdnnDcryd3m/mUAd+6cFYw7C1t7/F5//CL6RyAYQ+xzv9tU2TFBK6+j7xuwI3dgr2uhtzsqUS4y/PBn13AUPi0cZP/sORvIPDxAOX5valALmLjQq3Fu6fLLzwWas9id3mPKHcBYXA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR10MB4196.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(86362001)(2616005)(4326008)(6486002)(7416002)(508600001)(26005)(44832011)(8936002)(8676002)(5660300002)(186003)(53546011)(6506007)(52116002)(36756003)(6512007)(2906002)(31696002)(31686004)(66946007)(66476007)(38100700002)(38350700002)(54906003)(66556008)(83380400001)(316002)(14583001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RGtZaFdCZFVlWDRldERFY05VdzlMOEhaYWN1SjNGbFhINmYxbm1RSDYwOWJ6?=
 =?utf-8?B?djdmelhFblI5SjhIMktBMURialVTN1VhUkJ1QUtIbUtOamZMZkdvY3luMEJ4?=
 =?utf-8?B?eTNzZGQ3QXVhd3o2MmZTWnFLZGNmNFpTTTlmazI5K0VPUm5LRmJuWUtIRUY5?=
 =?utf-8?B?K0JIc3VlRnFlMng1VnlLU1MwaHo3WnhDdE9Vc3d1VlVLMnRIRGNIU1pCQmg1?=
 =?utf-8?B?U2JxdXRlRDd1RUtHQ3AzVENEZTZzc3pVdnFKRW1WenZXWWQxam9oKzJNQXBT?=
 =?utf-8?B?eGhaZjg4cDRiNk9Dc1VrMUFmbi96WHBUL1NoQ2ppamg1SHFhUWxTSEdIUFox?=
 =?utf-8?B?aDBkWXErUWNJTHZXaXRMbWNhTGNwWWg4TGNxOGpxQlA5YitDMUtrSFFybThp?=
 =?utf-8?B?L2ZIZytEUTYxSUtxd0VmOTVkVkF5ZWVuejJTZE12Um1mMjRaNEJzang4TU93?=
 =?utf-8?B?SlA4NmQ4RGNxZTNtaVd6THp1U3RIWGE3VkM4bXMxVjdhWWh2U3ZBTnpOTGxa?=
 =?utf-8?B?SCtxSVlqVzRNVTFyUWVTdWV2VUJDQVJCVlpuekFxTUtGYnAzWkVDOEFjTElH?=
 =?utf-8?B?emowTy9YSVlHU0FjUmpqYzY1QXIxMjd5M1RUMWJzWEZMZEV2ZVpkMnk4Tml5?=
 =?utf-8?B?MWtKWkpzelRzQkRxK29iUTg5aGpwK2ZTTUplWHlaYWRMZmM4VEFQQWlCbVVk?=
 =?utf-8?B?MHNidk45bGJMNUtiUERGNDRhNFVvYStid1VDNWtRY3FnMDgxYTFZRUtzYVVE?=
 =?utf-8?B?TTdiTFlQUTJTUmpNZmtFL1ZFRVNZMWdmNnUvZEd6dnlKQnNpeFNBTjBqOHdn?=
 =?utf-8?B?VDJKRWNzclNyMUxiSXQwMXFpaG91dDhDSUNnYnByNE5YZnZxbld6czV0ODNx?=
 =?utf-8?B?SHc2V2RHMUdadFFaZHUxRWFhWXNuQzcvazE4cjQ4QWRLcW8rYTNjdHFMdW5E?=
 =?utf-8?B?RndablRyYjV4eDVUVm5xRUhwcU4rV29oQlRYVFMwMTM5RkNySXoreGRyR0VT?=
 =?utf-8?B?eGd3cWFLNEJZbTkrNFlrWHBUaWlWMTh6SlArdTU5TmJleTA1VTRxbEdieVZL?=
 =?utf-8?B?aUJGK2o0VTFkbjdvM0pJMVYycE82SkREWDJ6WTZYd0E3MWRVSUlmSUFjQ1g5?=
 =?utf-8?B?ZmhGZldSVlBTWHBlQlpOUk5wM0pBODVZQlRzT0p0ZkxNZU9SVXQ5a3pkM2dm?=
 =?utf-8?B?Y3lNMC9vN0xlbEgxTFF0UUpoWURNeVpYWGgzYVRLRTJmajFEUHR5T1ZrYTRj?=
 =?utf-8?B?WDlqQ0tWbk5rdU5SbktpRE5sSGdKZmJsRFlEbWwwSzU4K0VwU0N1N0JySGVj?=
 =?utf-8?B?TExoVzVVV2hOa25BOFhWMXE3WHB5cWZzNG1kblYwcHJGcG4rNFVjK3ZmWUNp?=
 =?utf-8?B?TGFjaVcrTnFmNHJKcHp2cTMyRU55TXREWmhYWmtSS1B5ZXZCaTIxZHB6Y1Na?=
 =?utf-8?B?RkxkNlRISFVBQ0hzcFI4T2VNR2hWcXBVR2NISlAwZ3hWZjJ1YjlBZzNRMnpS?=
 =?utf-8?B?eEpXS0V0bkxwMEZreFZyNHFxV0FpQWVkTmJrUkNpMEdwc3EyczlJeTZ4SDdn?=
 =?utf-8?B?YUNiNkk3SW44bEY3ekxrSWY5MklKV2NCb2xKRCtxbGNUdE80bm4rcDNjMjZC?=
 =?utf-8?B?ZjBpZUl3MnNWNE03eEo5djRKRUxMS1FEVVBkUVVrWlc5NHkyWkV1QU5xNksv?=
 =?utf-8?B?WG1pdXdQMGVZS3NzME9pd1JKdGhMRmVGUFhSK2swOFVLQTNCZmwzSktocWxL?=
 =?utf-8?B?S0VGbCtHQ3pvWXpKYmN6akgrd1VUckhEejB1UlRSV0JGV25XRFFUd1FWVGNp?=
 =?utf-8?B?YkxCQ1V1TmFWNnRCUXVkdU04RnNZVzJ2aXU3ZUJlY29BNWV0QnNNNzZiUW9z?=
 =?utf-8?B?TkVuM2J1UkR2NjJpZlNRbDJWYTRuZ0xXN1VKNkl2dk14U2plbVdWeTI0Z0VC?=
 =?utf-8?B?S1B5bVVDSXVuQVpRRytKWDVYYys5ZXRyeVl5ZXpmVVZ0dkcxNTNzRGlQUjFO?=
 =?utf-8?B?YzJ0NkZUcVp5dnRjTlFHK0RFYmJ5OG82MzZPdzE1aTgvZlVrUkVoZ3VzZDFj?=
 =?utf-8?B?K1YrN2V6Tm1ORWNabi9pMHNVeFpZcU9URW84YjM0UlBiUThhMHFpbWtUc1RY?=
 =?utf-8?B?RzhxNTgxZ3F0djEyZUNWSFBDYlMvdDJoRTlXN2VlaU1ZV1RJL0JTaUhuOVhs?=
 =?utf-8?Q?7Ed5g8+Dpwy271IpaDVoByw=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d12b243f-999e-41f5-3bee-08d9e6a4de10
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB4196.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2022 23:36:42.6288 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ooy68oOVkZj+bidKa9mpAuKt0W2pc+dIb8tSsH+tDDYksCb4A57f4UgbtttuxGIlmxW7bbA5zEkvRP/1ikXP0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3695
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10246
 signatures=673430
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxscore=0 spamscore=0
 bulkscore=0 adultscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202020128
X-Proofpoint-ORIG-GUID: 4BqPHVEGcRETf8BqRNLAmtOv-Dah6i03
X-Proofpoint-GUID: 4BqPHVEGcRETf8BqRNLAmtOv-Dah6i03
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Will Deacon <will@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2/1/22 21:38, Anshuman Khandual wrote:
> Each call into pte_mkhuge() is invariably followed by arch_make_huge_pte().
> Instead arch_make_huge_pte() can accommodate pte_mkhuge() at the beginning.
> This updates generic fallback stub for arch_make_huge_pte() and available
> platforms definitions. This makes huge pte creation much cleaner and easier
> to follow.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Mike Kravetz <mike.kravetz@oracle.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: sparclinux@vger.kernel.org
> Cc: linux-mm@kvack.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
>  arch/arm64/mm/hugetlbpage.c                      | 1 +
>  arch/powerpc/include/asm/nohash/32/hugetlb-8xx.h | 1 +
>  arch/sparc/mm/hugetlbpage.c                      | 1 +
>  include/linux/hugetlb.h                          | 2 +-
>  mm/hugetlb.c                                     | 3 +--
>  mm/vmalloc.c                                     | 1 -
>  6 files changed, 5 insertions(+), 4 deletions(-)

Seems like a reasonable cleanup/simplification to me.

Acked-by: Mike Kravetz <mike.kravetz@oracle.com>

-- 
Mike Kravetz
