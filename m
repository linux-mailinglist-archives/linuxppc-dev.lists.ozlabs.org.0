Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D844E5A1B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Mar 2022 21:47:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KP0m56936z3bkm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Mar 2022 07:47:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=kH8NHUYH;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=KZFCMfkT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KNxn90PR3z2yxS
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Mar 2022 05:33:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2021-07-09 header.b=kH8NHUYH; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=KZFCMfkT; dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4KNxn90HLwz4xvN
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Mar 2022 05:33:17 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
 id 4KNxn90Byxz4xvW; Thu, 24 Mar 2022 05:33:17 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=205.220.165.32;
 helo=mx0a-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com;
 receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2021-07-09 header.b=kH8NHUYH; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=KZFCMfkT; dkim-atps=neutral
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4KNxn84x0Sz4xvN
 for <linuxppc-dev@ozlabs.org>; Thu, 24 Mar 2022 05:33:16 +1100 (AEDT)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22NI0w43014981; 
 Wed, 23 Mar 2022 18:33:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=jcfFr98C3ZELYDxKnIw8FfMmhj/jsCn/8amxuRteB5c=;
 b=kH8NHUYHrlv1/TYG8W+4NKwTA+aoWAZLaqOYiZXe925agExyfmq919tlYkSmfnqjG/OC
 0/cbGaKKj8ma0otzYZF1fLwDjxw1apUTHrsi45A5nn/S2u8ggitrewtOA/KW51dXRXGu
 nJrrLDdcyE2ujQ/pklIRWzZY6y9doqr0lAvNnqNrxIsH1qC1dOuQygkzWujh8LyHU7/Q
 adJ/CmsiEKjxNMbu7yJKhi9e53KxxS4jo7A5htoHJJZo4UXptMDNbdlLflGtKCnz5VGa
 3o2RRFMi3LJkMsy2pPLEgC5W6XzZcbDtWh7ZxeXrZiG0CjkAIlS8RlWGIPUDQoFdlX0E TQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ew5s0teer-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Mar 2022 18:33:09 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22NIUewD170920;
 Wed, 23 Mar 2022 18:33:08 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2173.outbound.protection.outlook.com [104.47.58.173])
 by aserp3020.oracle.com with ESMTP id 3ew701pvdw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Mar 2022 18:33:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fkoa4/nGesjzvOsY+uL4Lj3BP8dE3Ww9AmkuJicspHRoUYvRpH5+ImO64vrmUPoyARVMjis4WoBw9RAIMvruVZx73gvZWhhGitypMPJU/TrFKA4/CIdSvWckAi8NIBfc/19UA3bNL7FfN/D2aqSRHkY8rVBm/2GUgrbbLjWmtQ+SO8O0qfwNKnj2Kk/s9nLS53Ui55wYYfagHi7QBTTvIqNic0dknjKqlv8MjHt9Qj3eTGg3SIaUIgQhSYpWkBbgSPtxc9MjiUa6Nxly9/Mbq/Nd5G5BVjS61z8JJO3XMPRWZZlPp1LvCFjAv1y2kAjLDyI9tZpWqL79zHYIPUXNvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jcfFr98C3ZELYDxKnIw8FfMmhj/jsCn/8amxuRteB5c=;
 b=kCl0ZA2yB+kAC6N3W9advLxTDK7r25x6E/iya5m1JWxQU+rLoNrN9BhEAmRRLHHKuuolOUkasuzhSrDnva/nC2/XvBqjUaSINbKafZTIyUxhklrKJK9Vgxgr2LnNj4mSbxQpomwO4eU4KJ6toyfZMMfOAS8NRQyuGGvBWGjap0/F7JS7qXb3nWNciyVXimnU3fQ1Rw1cZLC7aVqqH+Uz1zvCpqtFGGcXH+XKi5V9XMyVWdcCCv8ciY85MgxQqwIGuH0bW09SrnLbtyLye4HkGWAAcFTKFw+ktMBQ6CAKfx3qgsegPVQrk3DkLmKCuEAKLKdDd1kb4TZEAUpA5HLgVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jcfFr98C3ZELYDxKnIw8FfMmhj/jsCn/8amxuRteB5c=;
 b=KZFCMfkTdDFXOAmEpzXIQSo76KMFIcKFG76WYmCkwMIo4MVkjyy4qVABcoCUpjHgWjYCQNQugQdQh92ciLWAP8I46xWtvw2Qti8dgLY0q9MPvLy266XsoIgj8vWqrgSoUrjDmauA7IXHJbk5D5XOGIiN50kdq1F94BVIUxo5ay0=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by SA1PR10MB5823.namprd10.prod.outlook.com (2603:10b6:806:235::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17; Wed, 23 Mar
 2022 18:33:06 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::3188:fe86:1d6f:53ac]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::3188:fe86:1d6f:53ac%9]) with mapi id 15.20.5102.017; Wed, 23 Mar 2022
 18:33:06 +0000
Message-ID: <02d339bc-b7fd-4a11-19ec-7a8fc05a77fc@oracle.com>
Date: Wed, 23 Mar 2022 13:33:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [RFC v3 PATCH 5/5] powerpc/crash hp: add crash hotplug support
 for kexec_load
Content-Language: en-US
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@ozlabs.org,
 mpe@ellerman.id.au
References: <20220321080422.56255-1-sourabhjain@linux.ibm.com>
 <20220321080422.56255-6-sourabhjain@linux.ibm.com>
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <20220321080422.56255-6-sourabhjain@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR03CA0028.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::41) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 848ad94b-ebb2-4d10-3e92-08da0cfb92d4
X-MS-TrafficTypeDiagnostic: SA1PR10MB5823:EE_
X-Microsoft-Antispam-PRVS: <SA1PR10MB58237168B7AD2669558DDF4397189@SA1PR10MB5823.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FmHHXoaN5wZmmF7h2qxoeyKQk57OMOXau23CuxgMXH8Hfnc4J0rkiNWoXqF35IUQ6os3q9VcOk2aFWK/6slQTzF5Yh5rDUnSCu/Ws18JLMAaBCwmLjJRV85m+l5FFTq9BzXnC3LszUdlMxyhXMEi9cD1aQgGXRlQuAvHxwcMpbF0WQTApR4SmELjaaMesHCCZvdUAJB8UzZONo+exV5d60JicAIIhkusURzhqoYO4AKAxd1oPSANpUOE3Fsy7gxD/j5Mjc2MxjGYB+hgQUrW1OiarePctuGxK5Y0OIFWvM5MI3wXPNtmnsBsaapscP8ggSIbfL0haT8BoX3Cqdeho4RejOeFn/jpwNaeKZRctUPdKFId3bOQwimSufcVBG7WRRbrHOD9Ju+a2EXHQ4CMF6gzuH4lBqnTMAkwlUo4z+cO3maMpomQOEP7r0cQV0+BaNMrrUwc0k9IhisCm0CLNpPp+YIScS3sd0BA2Km3eaameHNX0B2UXTrdV9XBL0lAOxwdkOYmdofrTDtlVvAD2C+phqW/qy73Pv38giA52p/60Q4qNatFQoVeMJ/R08vtKrm01u+5DDvRxr1xk6q5BfBulBkdz0V8E9m+btZ3orRRuRODztmTyk0lo0b8a1AAD/X5oY0nSj1Y3XJwo0oH/09+rzoHC0JjsDPKCoBIBksWfXBVk14h9f5ybTAw1wSfGEb1a0r5mSnOFSHWP5Pqq1uVEQjDjjeSmY7BQydnRj0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6486002)(66946007)(6506007)(53546011)(66476007)(66556008)(8676002)(2616005)(4326008)(86362001)(31696002)(38100700002)(2906002)(6512007)(83380400001)(508600001)(316002)(8936002)(36756003)(5660300002)(186003)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QlNtM1BPdW9VMXVjTGs0S2tGQjEvUVYyaHJhUW1jMEduRDZFZ3lQSEN1L3NR?=
 =?utf-8?B?WEtjYjZtUVRmcFpRRHB1OUFtWGthZkExMU56QXNpM0ZjZmxCWTdIOXYvcG96?=
 =?utf-8?B?Mkc0MEhoWWFqUlBzWHh0RWc0TktNRDRqSTkrYXk0Z3UvRXV1c1RqLytKY2JD?=
 =?utf-8?B?amhCZFQxL0lnbzk1NEIrNTZWTVhmdHNIR0VHcURvU3ErNFdJZGo0ZUtoQlF5?=
 =?utf-8?B?VkQ0TW05UHErTkwzR2hoU2hWQWIxT1FINEF4WEwvOWJXYmx6ajl1S25HM3RR?=
 =?utf-8?B?aExIOEhHZUIydk9RenJGbnIvL2V2bzlueFdJNUQwMDRBbE9ROXFndk9MbnNQ?=
 =?utf-8?B?SXVZcXVQQXFaOGpRclpTYThRNWljWWg4QUIyaEJ1MVU0VjRsM0dYUjFjbFJr?=
 =?utf-8?B?Mkx5aHRhdWV4WG8vMUtHaWtlU1NYNnlNSEttL0NKVk0waEY4MG5hdmlDVVJG?=
 =?utf-8?B?ekVPcFI1Y0ttcGpXeHdEeFlOQ3FsZTJSZkRDWkY5MDF2N2lBSS93V3ZQZ1la?=
 =?utf-8?B?eU56WlFia2xJM2NqM0RiMjNrVnNMSG5QUUZ3MDN5aFhnQXl4NGlReEFzRGZQ?=
 =?utf-8?B?TjJxNWFYZ1BFTXVEamJhcGxibnZrM3RSdUlDWXk1ZGZtT2hWMDZEMjlpRm4r?=
 =?utf-8?B?OVJPVTA3dk5WS1ZMUmtiUXg4Z1Jqc1hOVTRYU2NRbnBDbE9qSXBPN1JBa2tW?=
 =?utf-8?B?SHk0ekp3bFhQM1lUMFBITVhxbFF4MlMyQWlBS2d4TDN5TWFlUFlZaFNxTXZB?=
 =?utf-8?B?U0V5QVo4WTVCU0pjZ1dsWjZDNEttbmpmNnQ5cU9ZTGZMR3BYZHdFSERkd01Q?=
 =?utf-8?B?anl3WkRDNXhsYUlRcXJzRGFwZjJQYkpoY3ljZmxEeVdRS3p6bHViYVAvS3BX?=
 =?utf-8?B?RHVYSFB3VkVCVlJoQms5UVdVMnhSU1MrRmR5YTZScXRDOURYeXpxbmF1V25z?=
 =?utf-8?B?Qm9TS2pveGJwU3ZJSWl1MTRMUHRzaExBSGgyd3djd0g2QVp2Q1VnaEMxL1Rk?=
 =?utf-8?B?T2FVMExFU2FRUmJSdWEvQmFJblNPc1ZJc0pTLzBMemhqNUV2dW9YbVIzL3J2?=
 =?utf-8?B?Q1Ivd0YrNDdEcVFmZTB3N3BOZ1lKRlJDb3g1ZDdFQlZQYmZ2anRSeHpxeGVn?=
 =?utf-8?B?ZkNnR0NOdTgyTmFEVU1PZVhZQ3JvUWdCWFBIQlVsTVhtWi9FQW9vWTYrYTZt?=
 =?utf-8?B?UnA3dEZVMzlWaDk1djdPYjNBRTdUVFJqYzloamRGYXNtVnVBZ3NpS2syZWJL?=
 =?utf-8?B?Qk9POFFSWXRMM016UUZPV0pRelFPOFphRW84RXVyYTgrWXFzUFRWSTNGd1g4?=
 =?utf-8?B?aTdQOFBJeHdPMkwvb1BRbzBHSEFwWEUrRWdJdmVpREtacVdWVDNrYlF2eDNs?=
 =?utf-8?B?eURORzh5QyswWkpGVGx6TG1QaGZYbW9oZktVblRDcHZOdHQ1cDIzdjEwWjUr?=
 =?utf-8?B?T0RERndzb2hSZnErMVFaVWVOb1VTTDIrVlR3amprczdWSXdyejFka2kzZTNN?=
 =?utf-8?B?S01zY2hOdWc1Nnc2ZmU0WlgxWGdMRnl5YTMybjByaGFNWUMrYXJNM0gzT0Vy?=
 =?utf-8?B?aStYMk5JTHhORHhmOGZBUTkrMFo2am9CQXpXN3BnNGJ4Vk01cWZtRDJBWUQ5?=
 =?utf-8?B?T3Vua1AyQVcvaUJOQ0JWR1ljaElhbFl5M2tQNUZCaFYwZG9yOVBsamVCVnV2?=
 =?utf-8?B?ZmxjUlFUNnpnTTdkTXZiYTlCTVIrWUNFUUp4V2F0RlVXSE5od0lQWk5vV2dl?=
 =?utf-8?B?MzJMa0FkeHVUR3F5cGFLR0wvUTBLWHcySUNDZjFlcDNKazUxYjFkbzNFV0xJ?=
 =?utf-8?B?TFJ1bXorL1ZRbUVLdm04dDY0cVNSYTNJZkdhTTh6cXJuY1JWaVVEZ0hvcFU3?=
 =?utf-8?B?RE9FSjNWTWFiMHBKeCs5ak5qVjdUQ2hFZndGZDBGVVlHWjI3QkkwQTdtWGo3?=
 =?utf-8?B?b3d5ZlY2MEVwVXRmZ3pYZmlHQlNtSk1PYkd6T1FMbEZtakRhc0ROQWNNcGx0?=
 =?utf-8?Q?01PFfqHC00xHvLZ4wJC3kcJ+8iyYxk=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 848ad94b-ebb2-4d10-3e92-08da0cfb92d4
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2022 18:33:06.7304 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QVP4na0qWjc5LlY2vsLrXbE5awoYkXGFlNdcBP3YuRq7UzOXelPJxLFZMKRHUx72M8gZWcM4xZgH2h5MAIG9dBZsEvQdrUTh3FBAQfoQCbc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5823
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10295
 signatures=694973
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=999 bulkscore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203230097
X-Proofpoint-GUID: fNCK6SRBnE8NP19NqeA8jB0DLb8-6eiS
X-Proofpoint-ORIG-GUID: fNCK6SRBnE8NP19NqeA8jB0DLb8-6eiS
X-Mailman-Approved-At: Thu, 24 Mar 2022 07:43:54 +1100
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
Cc: mahesh@linux.vnet.ibm.com, kexec@lists.infradead.org, bhe@redhat.com,
 hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Some minor nits below.
eric

On 3/21/22 03:04, Sourabh Jain wrote:
> The kernel changes needed to add support for crash hotplug support for
> kexec_load system calls are similar to kexec_file_load (which has already
> been implemented in earlier patches). Since kexec segment array is
> prepared by kexec tool in the userspace, the kernel does aware of which
s/kernel does aware/ kernel is not aware/ ?

> index FDT segment is present.
> 
> The only change was done to enabled crash hotplug support for kexec_load is
s/was done to enabled/to enable/ ?
> updated the crash hotplug handler to identify the FDT segment from kexec
s/updated/ to update/ ?
> segment array.
> 
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> ---
>   arch/powerpc/kexec/core_64.c | 21 ++++++++++++++++++++-
>   1 file changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/kexec/core_64.c b/arch/powerpc/kexec/core_64.c
> index a470fe6904e3..2c248dfb169b 100644
> --- a/arch/powerpc/kexec/core_64.c
> +++ b/arch/powerpc/kexec/core_64.c
> @@ -480,7 +480,9 @@ int update_cpus_node(void *fdt)
>   void arch_crash_hotplug_handler(struct kimage *image, unsigned int hp_action,
>   				unsigned long a, unsigned long b)
>   {
> -	void *fdt;
> +	void *fdt, *ptr;
> +	unsigned int n;
> +	unsigned long mem, memsz;
>   
>   	/* No action needed for CPU hot-unplug */
>   	if (hp_action == KEXEC_CRASH_HP_REMOVE_CPU)
> @@ -492,6 +494,23 @@ void arch_crash_hotplug_handler(struct kimage *image, unsigned int hp_action,
>   		return;
>   	}
>   
> +	/* Sine kexec segments for kexec_load system call is prepred by
s/Sine/Since/
s/is prepred/are prepared/
> +	 * kexec tool in userspace we need loop through all the segments
> +	 * to find out segment index corresponds FDT segment. In case of
> +	 * kexec_file_load it is discovered during the load itself.
> +	 */
> +	if (!image->arch.fdt_index_valid) {
> +		for (n = 0; n < image->nr_segments; n++) {
> +			mem = image->segment[n].mem;
> +			memsz = image->segment[n].memsz;
> +			ptr = __va(mem);
> +			if (ptr && fdt_magic(ptr) == FDT_MAGIC) {
> +				image->arch.fdt_index = n;
> +				image->arch.fdt_index_valid = true;
How about adding a break; statement to early exit?
> +			}
> +		}
> +	}
> +
>   	/* Must have valid FDT index */
>   	if (!image->arch.fdt_index_valid) {
>   		pr_err("crash hp: unable to locate FDT segment");
> 
