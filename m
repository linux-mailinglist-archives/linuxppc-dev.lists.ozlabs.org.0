Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF614F0FD4
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Apr 2022 09:10:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KX23q6mNlz2xrm
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Apr 2022 17:10:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=wyJNA4OU;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=N6HL3att;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=205.220.177.32;
 helo=mx0b-00069f02.pphosted.com; envelope-from=dongli.zhang@oracle.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2021-07-09 header.b=wyJNA4OU; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=N6HL3att; dkim-atps=neutral
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KX2306zksz2xBF
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Apr 2022 17:09:43 +1000 (AEST)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2341piQn020990; 
 Mon, 4 Apr 2022 07:09:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=cfVaDeBc+xYAEJUW1i4rR6c2Eono9lckX0H6AxfZXuo=;
 b=wyJNA4OUMYbbD5pyPny9T8yboUMbbBU8QOK50WX/8TdkNg3oO1BVLlQS9FpExs/96jKt
 NNLu4pDCAq5PoYQJKQwYn3BqPcdB/ComU9DR0I5KCz5HdWEw+OTjGiXZdNvdhZZA6SJ8
 MNvUR6kYHQ45D3+JEca7eEhldX6WhmvhKblobm2kf2RoyLsymy/CRRA9ed1HCkxGKgES
 maVa3ZtmPWFCcW2djIpMxd3BDJUd4NWvP6p2f+ahicOFTDS6JVanxYo9mstaDwfilTZm
 dcUxeKfbO9HDQLYOpk6+P0os/9lTuXjjdJ/squV4xh85Wi/dzWj2FGB1NX14g7OcsMY8 jw== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com with ESMTP id 3f6d92t95d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 04 Apr 2022 07:09:13 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 23470ITt031697; Mon, 4 Apr 2022 07:09:12 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2104.outbound.protection.outlook.com [104.47.58.104])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3f6cx1x32k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 04 Apr 2022 07:09:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O1wUASXnQl7ry1oF8Z6q3t3j3oqmFMXmP5h0sCJFECFMkmKgLagxF5DP1frmG8vp9cJtVOATy+ifDT7NqhFbkS03rWBz9snjHgcKe89zyyaAS+/Bjn36n1sExIj+MfyXv8eA4bywurk+WZIRXgeouJX8thRF3ryy9Z+FCbU4zd2X4D+2BPhXn4tExZmIETBikB2Th+f8zzhAgsRBshd5uR1t+obh8sOtqPS7wwxndHLOcOG/KDuHoXJtXRXCPANfCauveiajKAG94hQsgEqzdOysZFahMzb9zx9WA6PYhmGK/KLZyTrC7CVrcfwGv9DEeLZ+cF04tIsQsf00ZQFbRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cfVaDeBc+xYAEJUW1i4rR6c2Eono9lckX0H6AxfZXuo=;
 b=Iqit9bam3RE28mDD2RrOdX9GCjxVwaDJUgeUl3DA5imGwFetlS4EQVIkBiYv0C4ges/9SpEUCI7UKyUY/xc9ebDHvy4cjjtK819DKam8+8/kzWerdAsWO3EoBvnj9lRpoRBqdiczt51HHJClUU7mqKAc/BWVIhMqNr/KIooDaSBvGRIySAizGJtSKYdf85z1H1vYB+AdzdnjuYVvNP1bKwHJzNxG5pJ45qcNYlZir/rZmlOTB3xj1+lSr9GsEeCpQouHQ/Zm/Ng4HYWZCeWY+7nm/t/gaPQWeiewVHidP6fAQNvYrbrRPUx0OMPw4Be7kstWA4P9+qY0B1y+fT7PRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cfVaDeBc+xYAEJUW1i4rR6c2Eono9lckX0H6AxfZXuo=;
 b=N6HL3attkP/oERoO/RmZ4JOwAWTfXAcmLmRhA6Cte3umeVlxEeAWXiFSE7fMvgwn6sInCA73akxWsdWXra2U0jplJ5NOGSZ3YUiEug/tJgoWsyMMdVuv/W7sbK8M3ERMoYyrzK7WdQQgT6Bl/9NwWgm9KTlrlXkviyXc/eXbA1Q=
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by BN6PR1001MB2340.namprd10.prod.outlook.com (2603:10b6:405:30::36)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Mon, 4 Apr
 2022 07:09:10 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::6c4e:65d8:4e2d:d942]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::6c4e:65d8:4e2d:d942%7]) with mapi id 15.20.5123.031; Mon, 4 Apr 2022
 07:09:10 +0000
Subject: Re: [PATCH 12/15] swiotlb: provide swiotlb_init variants that remap
 the buffer
To: Christoph Hellwig <hch@lst.de>, iommu@lists.linux-foundation.org
References: <20220404050559.132378-1-hch@lst.de>
 <20220404050559.132378-13-hch@lst.de>
From: Dongli Zhang <dongli.zhang@oracle.com>
Message-ID: <54ec407f-eda2-6e28-90f9-eb48b2ec8763@oracle.com>
Date: Mon, 4 Apr 2022 00:09:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20220404050559.132378-13-hch@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0258.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::23) To BYAPR10MB2663.namprd10.prod.outlook.com
 (2603:10b6:a02:a9::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d850cdbc-933c-4a65-b2d0-08da160a0416
X-MS-TrafficTypeDiagnostic: BN6PR1001MB2340:EE_
X-Microsoft-Antispam-PRVS: <BN6PR1001MB2340E896B177E99B615501CEF0E59@BN6PR1001MB2340.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aX8/C9LNeDD1ritQCp/1YZyln1l87AxIe7JjjwdthQ+0b9dJOdRmyiriJtHBUK/O4ZBWdVGy3C8TXqofsgyUpydVOWv37YtnkBqft59hdQayrZoBqx66U0KgK6Y1c/i3iOEdxkJxUgGUybB9vrPpmASWUx0DKjWim5Pv5L1IM5a1PpxFbzT+oI2PmTdKttl/GM6GfW3ubpnMm2SNHA0h4s/CVjWYHbWkUcJrBFpMSXUaeZHIfcpmrtMP4iGIxcvRt73UrgCI3Exk4VxfoG5hrG+S3LzD1F2jMfoGhq2ew7nrsiuI7s7Gcgq9RH81zsLEmapIBseYipeef0KltLjJCoyyt+rCFv4eEYHRZWThEzz+InY1SacscvD7DuRCoppdRu3q3ZhL558dSx0XFbYhwE+F6/3xpdbudUDX9enMTrQMHmvv9rZze/XXoPwPOEUT4bQQLKIcRo2/Mt37DPXxmh8f1kB/S3w5pEe1qMRBXKzvBLxY9+TMtC7DPYqf7eT3nudKeXBQrhYewWqf+DoaYpfN3lAnvn0IDvFdBEQWuuOGiX/739PxgUJ3TCiyOkzCM5cc7rPuM8Y6K3Ckn6vPGiqA228YFPTymozmWOiJPXXntqLPf8QNEOnQglqGPJseOj1/A1tawxs7Am12ni9PlGzgoXN7BOC/U5Dmf2rMgIeWyK/woRFewT5bqLcb4ooFpfpWgjuPy7ptgZu6vjkt8Zd7lY3HWU1aXbNz8KWqwfE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2663.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(86362001)(31696002)(53546011)(2906002)(6512007)(83380400001)(6506007)(8676002)(31686004)(66556008)(36756003)(4326008)(316002)(66476007)(66946007)(54906003)(7416002)(6486002)(508600001)(5660300002)(44832011)(8936002)(2616005)(186003)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ak9PRzROa1F2VVQxN3RkMDA2V2w3QjNmbnZGNWw5NW4vUXFTZWEwVmRJZmVZ?=
 =?utf-8?B?blRvQ2ZWTHZFN1BXUDZlSjFSbjJKZU8yRktYQTdCWms3dVc4eTRRWldNaGFQ?=
 =?utf-8?B?dk4yc01jbnV3a2xYTnp0NmxScjdsQUpUTGdDa25VOWNJdFZ1Ti9mWEJVL0Nj?=
 =?utf-8?B?N3dndWxEWHd2QWhBRVJ5Smt3aGZPQTVmRnVzYXE0SmlaRFdaUmpoSHBHT3Zx?=
 =?utf-8?B?MGxielBWYzhYclNRbUVxODJoYTR1OHV6WFNVVWNTKzFzU2J3cmNrYVdVZGNH?=
 =?utf-8?B?OUdGOGxuVFdlTy9vS0dWajJ4eGdXakFpNDhOMTJJeldHZ0RXemV3MmUrenY4?=
 =?utf-8?B?ZGdua2loQmhyN1pzeElWVmhwUXBkOXNCWUxicjZ1LzJldEhYNlpwTmZzMFFU?=
 =?utf-8?B?dytNT29YbTVCQ2N4eFl3dGszQWVNUW5qMGJTdXZoMGoyUGhCVXZVREZYc3Ri?=
 =?utf-8?B?d3VhZjhHRE8vMW1wZHQwMEpkVDk0cTB0UWgxTEpDVkp2WUJ2VlBRTmcxelBS?=
 =?utf-8?B?ZmRhaW1wMXp6N0Q4ZXB3UEZOQVllbi91M292TWl5SW9Hd3l6WDZ6ZnVJK2xV?=
 =?utf-8?B?Yk1nUzgycHFzYXdobjRKZVdkbXFkKzIwcGJFQlVqY2V2QnB6QjRobHhXMU0y?=
 =?utf-8?B?T09JTmlpSG9HUjBTL0R0Yk94SllpTW5iQjlWTTYrVHlXV0JaTTM4WkFnQzNq?=
 =?utf-8?B?U2hLNlRPc3Vld3BvRUZKQndZUEFUVG5ZeUpDaW10cmF5YkJOWjZjWFlJOXNG?=
 =?utf-8?B?N282REdaVTdNMVlYL3BWMHJZSE1QUXJvTVUrTURhK0tJK1UwK01OUlI1TXAx?=
 =?utf-8?B?dzljcFFzMkphZXBNNkt6Nmk4am9lc0FOelBHTGxtTDNiV282T3Z0YmNPaTRo?=
 =?utf-8?B?d01FQ3RNY2dsMnlMN3RaU1FYR3VNbE5kMVlFSGU4Q2l0aVgzODI1V3FhejFj?=
 =?utf-8?B?YmhMUDk1NmpSWVBlNzhIMmJLQ1ZpR0lDRkdoUUkwOTI5ZnhhVWJwZE5OZ2l1?=
 =?utf-8?B?Y05qMzdmcGVnN09KOTdRVjk2dlF2Z2xENGpaQ0xCOGJFRlZQaEJQNmVkZUwy?=
 =?utf-8?B?aVh4VzB6SmYzeElKR3B3cG1BWGkwaUtKSVpDemwxSDhFVlM5ckFOYktlSzdM?=
 =?utf-8?B?M0F2dXpzUkZuTTRlc1EzSkFkNDAyRnZKY1E3S0pRSHBEaDRKVTBwbGJGME5z?=
 =?utf-8?B?bzBOWEFhRDhoR1FBSzJ3TzBkL0lxeURUN3Z5Z0xtOEp4UlB6dkFKMk1jOW9o?=
 =?utf-8?B?a2p5SE5GUm8xSkRkQUxOUWtrYm5ZWWZqRGlYWXZUTzY5SGJUYm9jRGNuYTNY?=
 =?utf-8?B?Qlc3b3NSbno1N1lrY0o4eVN6Tm9jeTNiUlc3ZzhDeVFMRXQ3ay9rbTMzV1Zk?=
 =?utf-8?B?ZEtZMzNVMnhoY3ZLbkZpUEp6Tmpva1ZzNm1sZUtPVG9mTjlLZU9VNWVtdjBJ?=
 =?utf-8?B?YnIzNTh6d2p0ekdCY1ZzSlFubmg2c0daTEZNZEtuY052bFlWL0hNalJHSVRN?=
 =?utf-8?B?RzJEYVNhWDFmVlhHS0VLb1hXbWxDMW9lMlR3RmFOVjlSa1ArdGFVNFFzTUhT?=
 =?utf-8?B?c0FSa0M5Z0UvMVNOMkI5TjFlRk9YVVpBL1p6VHJOMGlBMXFaK3VmeUVvQmda?=
 =?utf-8?B?YTFSS2JGN003V0NsYStvMWV5YklTNCsxNldXN2gySjNsNDE0K2o3NWJxODFx?=
 =?utf-8?B?OUFjVEdBU1RSZGE5RVdTK1JLb3RJWGdPeHZxOFN4VTlTZFpzWHNSS2FCajMz?=
 =?utf-8?B?eWg5WjN6U0ZXQXNoYUI3c3FXZ0R1UmRJU2swSCtLQTZ3Zm83ai9PNlRqTnhu?=
 =?utf-8?B?U3dJSXk3b0JQWEdhbFJlZTZOV2d5SCt1Q2c5Y3psaE9kVzdvU0tUR3E4YXJI?=
 =?utf-8?B?SEJHT0xpWGN0VG0yVkJmMXAwb0FvT1hNbWxjUWhZTGU0R282Vld2WU1wOHNO?=
 =?utf-8?B?aDFVZC8yd3BYZ3V2Z3hPMTh1TWh3UW5NQU5uYjlUeTh0S21QL0ZCTnNCYXJX?=
 =?utf-8?B?a1YyY2tkNUNUMzI0V3ZlaWNHM203UGZRZlY5aHBlS09hTlhKVVJsTkJhcnJR?=
 =?utf-8?B?V0cxcG8zaWgvR2UyU2VwaFI4K2hhdy8rOEthVEtlYkF5UWZQNDlGSUhqNEVx?=
 =?utf-8?B?dWhkdDlMUUwzcHZYd3dFbnBSTnYrT0pNaG9HQjRjUzNIZngzS3Rteklaa1Z5?=
 =?utf-8?B?enZaWW5uamZaTE56V2xSQkVBNDNpbHJ4N0Eydi9EZDJyZk0vRXZDYlFSM3Fh?=
 =?utf-8?B?VjgzdnRnOWxiODc5UzY4Y2JUZkMrTWdjUjdTUGxJQVZSNk9lMDJWbXlZQTEr?=
 =?utf-8?B?VEszNENBazU5Z1JWTnhtTmlraDZadnBJVFF0b0JaM1NMSmVjV3k5clIva2ND?=
 =?utf-8?Q?NrVBx07mFvEL67XyezraO+YHCpa5MIlvMOAAk?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d850cdbc-933c-4a65-b2d0-08da160a0416
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2022 07:09:10.3239 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q6hB9PUkQroZregA5CgGo5ZUdZppcT2DmA+1CIUiOMJqsmmHEgss7AQSrF4z7Kh1q6JwXRnc1vlCCMTYxE7v5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1001MB2340
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.850
 definitions=2022-04-04_02:2022-03-30,
 2022-04-04 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0 bulkscore=0
 adultscore=0 mlxscore=0 phishscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204040042
X-Proofpoint-ORIG-GUID: hxCO3FgQKWRWKinXDhtkSBFm1Q-03idM
X-Proofpoint-GUID: hxCO3FgQKWRWKinXDhtkSBFm1Q-03idM
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
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 4/3/22 10:05 PM, Christoph Hellwig wrote:
> To shared more code between swiotlb and xen-swiotlb, offer a
> swiotlb_init_remap interface and add a remap callback to
> swiotlb_init_late that will allow Xen to remap the buffer the
> buffer without duplicating much of the logic.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/x86/pci/sta2x11-fixup.c |  2 +-
>  include/linux/swiotlb.h      |  5 ++++-
>  kernel/dma/swiotlb.c         | 36 +++++++++++++++++++++++++++++++++---
>  3 files changed, 38 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/x86/pci/sta2x11-fixup.c b/arch/x86/pci/sta2x11-fixup.c
> index c7e6faf59a861..7368afc039987 100644
> --- a/arch/x86/pci/sta2x11-fixup.c
> +++ b/arch/x86/pci/sta2x11-fixup.c
> @@ -57,7 +57,7 @@ static void sta2x11_new_instance(struct pci_dev *pdev)
>  		int size = STA2X11_SWIOTLB_SIZE;
>  		/* First instance: register your own swiotlb area */
>  		dev_info(&pdev->dev, "Using SWIOTLB (size %i)\n", size);
> -		if (swiotlb_init_late(size, GFP_DMA))
> +		if (swiotlb_init_late(size, GFP_DMA, NULL))
>  			dev_emerg(&pdev->dev, "init swiotlb failed\n");
>  	}
>  	list_add(&instance->list, &sta2x11_instance_list);
> diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
> index ee655f2e4d28b..7b50c82f84ce9 100644
> --- a/include/linux/swiotlb.h
> +++ b/include/linux/swiotlb.h
> @@ -36,8 +36,11 @@ struct scatterlist;
>  
>  int swiotlb_init_with_tbl(char *tlb, unsigned long nslabs, unsigned int flags);
>  unsigned long swiotlb_size_or_default(void);
> +void __init swiotlb_init_remap(bool addressing_limit, unsigned int flags,
> +	int (*remap)(void *tlb, unsigned long nslabs));
> +int swiotlb_init_late(size_t size, gfp_t gfp_mask,
> +	int (*remap)(void *tlb, unsigned long nslabs));
>  extern int swiotlb_late_init_with_tbl(char *tlb, unsigned long nslabs);
> -int swiotlb_init_late(size_t size, gfp_t gfp_mask);
>  extern void __init swiotlb_update_mem_attributes(void);
>  
>  phys_addr_t swiotlb_tbl_map_single(struct device *hwdev, phys_addr_t phys,
> diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> index 119187afc65ec..d5fe8f5e08300 100644
> --- a/kernel/dma/swiotlb.c
> +++ b/kernel/dma/swiotlb.c
> @@ -256,9 +256,11 @@ int __init swiotlb_init_with_tbl(char *tlb, unsigned long nslabs,
>   * Statically reserve bounce buffer space and initialize bounce buffer data
>   * structures for the software IO TLB used to implement the DMA API.
>   */
> -void __init swiotlb_init(bool addressing_limit, unsigned int flags)
> +void __init swiotlb_init_remap(bool addressing_limit, unsigned int flags,
> +		int (*remap)(void *tlb, unsigned long nslabs))
>  {
> -	size_t bytes = PAGE_ALIGN(default_nslabs << IO_TLB_SHIFT);
> +	unsigned long nslabs = default_nslabs;
> +	size_t bytes;
>  	void *tlb;
>  
>  	if (!addressing_limit && !swiotlb_force_bounce)
> @@ -271,12 +273,23 @@ void __init swiotlb_init(bool addressing_limit, unsigned int flags)
>  	 * allow to pick a location everywhere for hypervisors with guest
>  	 * memory encryption.
>  	 */
> +retry:
> +	bytes = PAGE_ALIGN(default_nslabs << IO_TLB_SHIFT);
>  	if (flags & SWIOTLB_ANY)
>  		tlb = memblock_alloc(bytes, PAGE_SIZE);
>  	else
>  		tlb = memblock_alloc_low(bytes, PAGE_SIZE);
>  	if (!tlb)
>  		goto fail;
> +	if (remap && remap(tlb, nslabs) < 0) {
> +		memblock_free(tlb, PAGE_ALIGN(bytes));
> +
> +		nslabs = ALIGN(nslabs >> 1, IO_TLB_SEGSIZE);
> +		if (nslabs < IO_TLB_MIN_SLABS)
> +			panic("%s: Failed to remap %zu bytes\n",
> +			      __func__, bytes);
> +		goto retry;
> +	}
>  	if (swiotlb_init_with_tbl(tlb, default_nslabs, flags))
>  		goto fail_free_mem;
>  	return;
> @@ -287,12 +300,18 @@ void __init swiotlb_init(bool addressing_limit, unsigned int flags)
>  	pr_warn("Cannot allocate buffer");
>  }
>  
> +void __init swiotlb_init(bool addressing_limit, unsigned int flags)
> +{
> +	return swiotlb_init_remap(addressing_limit, flags, NULL);
> +}
> +
>  /*
>   * Systems with larger DMA zones (those that don't support ISA) can
>   * initialize the swiotlb later using the slab allocator if needed.
>   * This should be just like above, but with some error catching.
>   */
> -int swiotlb_init_late(size_t size, gfp_t gfp_mask)
> +int swiotlb_init_late(size_t size, gfp_t gfp_mask,
> +		int (*remap)(void *tlb, unsigned long nslabs))
>  {
>  	unsigned long nslabs = ALIGN(size >> IO_TLB_SHIFT, IO_TLB_SEGSIZE);
>  	unsigned long bytes;
> @@ -303,6 +322,7 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask)
>  	if (swiotlb_force_disable)
>  		return 0;
>  
> +retry:
>  	order = get_order(nslabs << IO_TLB_SHIFT);
>  	nslabs = SLABS_PER_PAGE << order;
>  	bytes = nslabs << IO_TLB_SHIFT;
> @@ -323,6 +343,16 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask)
>  			(PAGE_SIZE << order) >> 20);
>  		nslabs = SLABS_PER_PAGE << order;
>  	}
> +	if (remap)
> +		rc = remap(vstart, nslabs);
> +	if (rc) {
> +		free_pages((unsigned long)vstart, order);
> + 

"warning: 1 line adds whitespace errors." above when I was applying the patch
for test.

Dongli Zhang

> +		nslabs = ALIGN(nslabs >> 1, IO_TLB_SEGSIZE);
> +		if (nslabs < IO_TLB_MIN_SLABS)
> +			return rc;
> +		goto retry;
> +	}
>  	rc = swiotlb_late_init_with_tbl(vstart, nslabs);
>  	if (rc)
>  		free_pages((unsigned long)vstart, order);
> 
