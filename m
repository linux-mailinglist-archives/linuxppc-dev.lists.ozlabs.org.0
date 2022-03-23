Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6270C4E5A10
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Mar 2022 21:46:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KP0kM1L1nz3bSk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Mar 2022 07:46:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=fWiad01W;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=H11DnCAL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KNxn31rdxz2ymw
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Mar 2022 05:33:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2021-07-09 header.b=fWiad01W; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=H11DnCAL; dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4KNxmy09Lmz4xc5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Mar 2022 05:33:06 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
 id 4KNxmy066hz4xv2; Thu, 24 Mar 2022 05:33:06 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=205.220.177.32;
 helo=mx0b-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com;
 receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2021-07-09 header.b=fWiad01W; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=H11DnCAL; dkim-atps=neutral
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4KNxmx4CVbz4xc5
 for <linuxppc-dev@ozlabs.org>; Thu, 24 Mar 2022 05:33:05 +1100 (AEDT)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22NI1ebW012031; 
 Wed, 23 Mar 2022 18:32:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=8+iPKFb4N2uQ2PC9RNH5pJj43TQCt5LFkOg+zws3+74=;
 b=fWiad01WYoVGGKYaNjQX5H/7wiz22oHx/W+PNNsBmN6rmzrSEoTdWU7QfbUWxwAB64ez
 gHKBZuO8A9cu9yRmZURp+MP4oBJfICiP9IzCv2T3fw/sBu5sc0Fw6VbGJWQQd7XKlq5k
 6a6LIXmzTVon2hmC+3gyhm11rh4a2WKA5inGnCp1RTXZTun0YtUr02pO4TUydOGaAyJn
 du6xY0f7xDMGsdi22FDgzwTN3clivdJSp3S4aP5XjhgJLoofCObH2mdeA/AM1QXEwHXA
 PhBHcAp1E62l1adE4evUhCU3SwC8Kmd1hsFOhpAlVbqGHDpI4A+muNV/hMr42cUhZ/kM Kg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80] (may
 be forged)) by mx0b-00069f02.pphosted.com with ESMTP id 3ew5kct5kc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Mar 2022 18:32:46 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22NIVFR3127934;
 Wed, 23 Mar 2022 18:32:45 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
 by userp3030.oracle.com with ESMTP id 3ew49raq5f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Mar 2022 18:32:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CdW12goUegFwR04qHUwuxjjxB3sXpcM8kVAhqbJr89adFbJZ40juITjnKcoNdXCZHxS9vfZM2I0qtGi4K+H7GHOiuTqrlCFA2oHDcXmtsPBiLaAE9jS8FsqvxcOG3Gathtfue9KMl1satPaTRuNDEP+JH7iFFL25y1xgIk5PJQaBkZ/RjVNw+sXpdgVrJU4O0P3vTKmEy+KA4piLbsWTxTFMp40m1maLPKXdY3B3PJOePoFau3N7M7s+nMpAPJuoeIuCewWXITRJpdHxnJocpGqh5aEULAzSOyEl8RsBkcZvErMjstrLaU5CqM5qkbFWVGYEjNgQ8N0oGTTAhujNow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8+iPKFb4N2uQ2PC9RNH5pJj43TQCt5LFkOg+zws3+74=;
 b=ORi5pMkcKP7kUrwGDPGD6Ge1rypQmS+DcMwIBjLAL7VxxKh6kkVOlu9Sk6iiOLd9NUs86Q1IiaSpyh3e4k0cPlas4v0EetSsYR7pztwd7QaWR/HCaE6ydWIv6XOm3YCEmwhRY1iUJN1o6Ai+zupqg6z+oLuw9rDfOb6OZYroOhlyCP+XjhVBLyw1n/irTD8UvNfOPr3/8Atf+ZQ0rcSjiT7B2++NP+ctPDLECytXZHZDga3bZFJmDtfA+2F7oZvsGb9IhiMZG/lhshxMyPZ7nIimBZUEFLU/1BulqGDRJYmGf/fVwqXj/ml6ZfL+3kH5AeJPyUfZOXBLqCeLnndVWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8+iPKFb4N2uQ2PC9RNH5pJj43TQCt5LFkOg+zws3+74=;
 b=H11DnCALo2/VO+nELYFHSUGAIHTdMjpU0jDYErXn+IUMobBFPQueTY2GFXy2QISbfl0kbjJwx6IrRtUZM6yX1c2Lv/BpCq8d8syVlRUu+HMUhSKE/mjrnw3l5jsLXx657R9kYuL4IjWyTeBpR3NEuwaZzgaNCChA8edXfuqQUrU=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by SJ0PR10MB4574.namprd10.prod.outlook.com (2603:10b6:a03:2dd::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.16; Wed, 23 Mar
 2022 18:32:42 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::3188:fe86:1d6f:53ac]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::3188:fe86:1d6f:53ac%9]) with mapi id 15.20.5102.017; Wed, 23 Mar 2022
 18:32:42 +0000
Message-ID: <fbea3816-1a7b-3f9b-1ebf-1f388537af5b@oracle.com>
Date: Wed, 23 Mar 2022 13:32:39 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [RFC v3 PATCH 0/5] In kernel handling of CPU hotplug events for
 crash kernel
Content-Language: en-US
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@ozlabs.org,
 mpe@ellerman.id.au
References: <20220321080422.56255-1-sourabhjain@linux.ibm.com>
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <20220321080422.56255-1-sourabhjain@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR03CA0035.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::48) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 66881da0-5b73-4aea-b7a0-08da0cfb8442
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4574:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR10MB45746CA06DE79EB28BF67D3C97189@SJ0PR10MB4574.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cqRs04Ewlc9LkpYVHhZSuD0vnZoeLDsvxpHCli+eRujcCO6iVvd6aKD2rpvA2q1gSusBWy/VCm1i5TINZN/LTzH8t8op48KYrP0KyBpc9SpieNpyODYhsnd60oNMtqau4f7a1b1VpDUVoRLBKVbO7iY3xep87XCPtqEhn2RgCH50SQoRI66GK0REnGwl35kaeYeYqR4pLYase6l9QTXy4JjXk4YaOW48eHqVk1+MiD63zD4j1I5neSjmJagEanZWzYTYRJfGPN+7QZA2Sj/4OhyIQFmy1JPBwAcupHIW3PP/lPFFtQqYYUr7vpoSLWWx7uzN1ADSk+1EEyDbYkxr9p+AVDHNVajiJG5lCqaDvXeeT/Ktb9m7tzPLfMDqnI8jgCLHs6nFIrcthKrO9uxxEWtlTL91RySsDbuuU2KVyOMIW6kkkrK3ItaGGtOfSXF5BcBC4lRf6INGghcF5nhlIDKiOQZgc3SjUbRN6e744MKzVLJksbWB4amauyJ6QYE+kyZ8ZXVHpjooDn5rHF9vFrBgNQDg9TVCJO+SRy+fkvH3W1ORn7yAACNky83Z7dZaj7CaN7LO8o1kyl2rRxFkoEwpVZu1zOaEze7x8PVEuoNnhKSj7EHV8pALcOOOV6oTVX9k8YOxwyVgR66xlefFi4B18y/FRmncIAswQj4pC2Oehj8wOC45mLFKAsVR5D3xRWk+QduSOcO/pHk7G5MTjKwCbIkuOJEUldpK/aeDRhm7yrVja2EqqGPpGn+XBBIYn1fNzybg5GxDxf8ZMv9nnZNJmYprCba/Uogz8nggQptDrySxaMDkSlXAiQCSOxRnrd8pLfCmYDH5yJcFR9D6m6+IkOeZpf1RXjvPu/pWHbo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(31696002)(66476007)(66556008)(66946007)(2616005)(186003)(316002)(966005)(4326008)(36756003)(8676002)(86362001)(6506007)(6666004)(53546011)(6512007)(6486002)(508600001)(38100700002)(2906002)(83380400001)(5660300002)(31686004)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QTNacmZxVnlBM2pIMEU4djBoeTIrRHh4MlBITTBJUVEyN0NFcVBobEpiRzhp?=
 =?utf-8?B?Z0phSGx5bmgrNlZNUGZoTDIwemlvWkFCTiszcFNUS3h4cUVUK1hqcGliekNv?=
 =?utf-8?B?cEo0ak9jYzd4Y002YmZDb3NFdTN1UGhybU80WHVFZ2o1ZWlkNUJPeTA0SnlN?=
 =?utf-8?B?dGlVREhxdjRwa0twbHdkVDNwaEZ4aWMyTmppZy9LcXA0eU5aaXZlc1dBMGhm?=
 =?utf-8?B?V1IxNHQydGtNa2kyd1JhUGJnRGU1NUVmbUpmd25kZERLVk05Z25BUllqUFUx?=
 =?utf-8?B?NW93VndRM1UxeGlyRHd5c1NneHZ0ME14RGpxNUlFU2ZPcEhPQVUyZm1TNTFK?=
 =?utf-8?B?QWcrYlVBSHJUN0MveWhlUW5SNkpCc2FlSloxMHFDbFVxbHIxM0dteEp0Njhu?=
 =?utf-8?B?dy8vdisybWtMbDQyb3BpSmh3Y01MWFV0Vi94cE13VDRGREVjZWJMUXpwRXJ3?=
 =?utf-8?B?bm1yMlhWUS9nYm9TY1MrdEJWWVYzdXhLaTk5cW53RW5GSWpqeUhsamJVK0FW?=
 =?utf-8?B?Q1llZVF2M3hzWFg4TGdvN2Jjb2xYNDdlV2NUcGRDZXFRWE9zdHYxRVRaaXZ4?=
 =?utf-8?B?TDNTR1M5OCt1c2hVOUxXalFEWnVETnBTSVBrTEJJc1F2NGFNeXNITGhCMVdi?=
 =?utf-8?B?TEZJOXBlYlZicEdxWUlwUzFxd0V2ZXdaeWlIM0ExMmxEUzgvYVp2YUVxUEUz?=
 =?utf-8?B?Uzg1MHVoczRWd3FiZ1B0S2xqb3JLdDM1R3NiV3lCTFpiRzU5UHlxZGltWnFt?=
 =?utf-8?B?SitHQktZRmdISHZCNVl2UkZxdkxJaGtOMlpidHVKWTh2ek5OVFdubUhCa0Zl?=
 =?utf-8?B?QU50Q013TEtlejlGdy9ZU3B5WXpHSFVrSnhxaVJmK3dSOXY0MXJHSGc5WU04?=
 =?utf-8?B?Mjd3Q3JDZUdDKzVhQmlaRXNVWG9ZK08vRkl2eFFFeEl0VURveXQ0NjNNOVdK?=
 =?utf-8?B?SVpjQ2s3SnFqNDIyOTZoUlBxUmRTaGNLZmZwMi9KTWR4LzkvQm41bWZJcENh?=
 =?utf-8?B?aGNrK1Z2YjBxUmdSTVplS0lCbEdUNkN2TktZMGJjL2JJK05EZHczMmxsRVZ5?=
 =?utf-8?B?Qk1PcVE0Q09TSnFVb3h2UHlidVk0bUVlS2ZYMk5NdzVIV0N0U1BKV21kWWFT?=
 =?utf-8?B?UW1kNzY1bXpyMk1tc1RmMlVKbzYvemNHQVQ5OFRKMFlZVDhDME9PNTJzQklI?=
 =?utf-8?B?UUZNTmhlVXRkT1NORUg2ZjJYdjRyWDk3TElMUEp4Snp4WjZDa25oSUZrU0xC?=
 =?utf-8?B?TENMTGtJSVdtdTJ6ZnhITWVwUlVtRzNmMXNwQVFRdFhiR3YvdVhpUVdHbTF2?=
 =?utf-8?B?VDhrNUhhdXg2RlR5dDV6Vm1TeHlXUU1BUTBvNVRDZWQ1Zld6N1BERGZ6Z1h6?=
 =?utf-8?B?dENBejhMbXgwNzJaem1kY0Yvek9nYWNwVzlvVUZROFJ3YmJsT1FSYzZqQkJ6?=
 =?utf-8?B?V05jY3JwanFBSGVLMFFKUHh1bGZoVVdjVi9iYjQyOTBGQURVM29rcGNJR2xG?=
 =?utf-8?B?Z2tLTjE3S1prWUt5alBDaXpnWGFTN1Zzelp0Wm45WWNrSE9oQVI0U1BHVHcw?=
 =?utf-8?B?bGxpUUZXVHkwQzlNNVpmeE5GTGQrMHNYQS8wUzVQNmRpaVNzWnA4cjRTa1Ux?=
 =?utf-8?B?R2gwaFcyRmdIYjZTREgxTWoydlZXek9McjRWTjNjVC9BWkQyNjExb3hmQmVI?=
 =?utf-8?B?NUt5bDF4YStEcFltN3dSLzIzMUVMK25xakZKK2swVHhjaDY2YW4wbmVlVS9T?=
 =?utf-8?B?TnllSmRRYkFzZXlnWitiN09jMHJTcGdBNmxrMm4zWXhxQVA1Q2k1eXlna0I0?=
 =?utf-8?B?eFZFdDc5ckZaVzFUOTExNVY1aVFhSmg4YUJJQS9ocVVpWjRRU0FWaWdTVjFt?=
 =?utf-8?B?Z1BrYXE1MTZ1cjZVL0d0ZFJsNjl1dHp3Z0lVZHR2dkhTZER5VGU1MnQ1K05x?=
 =?utf-8?B?Zk5GVVVLNHBKdm1WMis4VnZ5TEZaRC9EcEpWSjBXN052OXR1OGVMUEplckNZ?=
 =?utf-8?Q?d8m4mAralIkFMaCf+vvXW8H7bNUpVE=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66881da0-5b73-4aea-b7a0-08da0cfb8442
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2022 18:32:42.4616 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7kKga4iqtF4GOorKCDB1o7dHay/XyYXu1UM5VqsA6BvyfRD/qQq0J2tGqyWCiOb2LxkqLEIiw5HUjqNN+iE58YVk8FtVuAY29qaYGcgzpTA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4574
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10295
 signatures=694973
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0 mlxscore=0
 bulkscore=0 phishscore=0 spamscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203230097
X-Proofpoint-GUID: GoE-fywd4rNgj-CAhzwlJFlaPPncU20L
X-Proofpoint-ORIG-GUID: GoE-fywd4rNgj-CAhzwlJFlaPPncU20L
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



On 3/21/22 03:04, Sourabh Jain wrote:
> This patch series implements the crash hotplug handler on PowerPC introduced
> by https://lkml.org/lkml/2022/3/3/674 patch series.
> 
> 
> The Problem:
> ============
> Post hotplug/DLPAR events the capture kernel holds stale information about the
> system. Dump collection with stale capture kernel might end up in dump capture
> failure or an inaccurate dump collection.
> 
> 
> Existing solution:
> ==================
> The existing solution to keep the capture kernel up-to-date is observe the
> hotplug event via udev rule and trigger a full capture kernel reload post
> hotplug event.
> 
> Shortcomings:
> ------------------------------------------------
> - Leaves a window where kernel crash might not lead to successful dump
>    collection.
> - Reloading all kexec components for each hotplug is inefficient. Since only
>    one or two kexec components need to be updated due to hotplug event reloading
>    all kexec component is redundant.
> - udev rules are prone to races if hotplug events are frequent.
> 
> More about issues with an existing solution is posted here:
>   - https://lkml.org/lkml/2020/12/14/532
>   - https://lists.ozlabs.org/pipermail/linuxppc-dev/2022-February/240254.html
> 
> Proposed Solution:
> ==================
> Instead of reloading all kexec segments on hotplug event, this patch series
> focuses on updating only the relevant kexec segment. Once the kexec
> segments are loaded in the kernel reserved area then an arch-specific hotplug handler
> will update the relevant kexec segment based on hotplug event type.
> 
> As mentioned above this patch series implemented a PowerPC crash hotplug
> handler for the CPU. The crash hotplug handler memory is in our TODO list.
> 
> 
> A couple of minor changes are required to realize the benefit of the patch
> series:
> 
> - disalble the udev rule:
> 
>    comment out the below line in kdump udev rule file:
fwiw, this will need to be conditionalized on arch, ie to skip for ppc64. I'm doing the same for x86_64.
>    RHEL: /usr/lib/udev/rules.d/98-kexec.rules
>    # SUBSYSTEM=="cpu", ACTION=="online", GOTO="kdump_reload_cpu"
> 
> - kexec tool needs to be updated with patch for kexec_load system call
>    to work (not needed if -s option is used during kexec panic load):
> 
> ---
> diff --git a/kexec/arch/ppc64/kexec-elf-ppc64.c b/kexec/arch/ppc64/kexec-elf-ppc64.c
> index 695b8b0..1dc6490 100644
> --- a/kexec/arch/ppc64/kexec-elf-ppc64.c
> +++ b/kexec/arch/ppc64/kexec-elf-ppc64.c
> @@ -45,6 +45,29 @@ uint64_t initrd_base, initrd_size;
>   unsigned char reuse_initrd = 0;
>   const char *ramdisk;
>   
> +#define MAX_CORE 256
> +#define PER_CORE_NODE_SIZE 1500
> +
> +/**
> + * get_crash_fdt_mem_sz() - calcuate mem size for crash kernel FDT
> + * @fdt: pointer to crash kernel FDT
> + *
> + * Calculate the buffer space needed to add more CPU nodes in FDT after
> + * capture kenrel load due to hot add events.
> + *
> + * Some assumption are made to calculate the additional buffer size needed
> + * to accommodate future hot add CPUs to the crash FDT. The maximum core count
> + * in the system would not go beyond MAX_CORE and memory needed to store per core
> + * date in FDT is PER_CORE_NODE_SIZE.
> + *
> + * Certainly MAX_CORE count can be replaced with possible core count and
> + * PER_CORE_NODE_SIZE to some standard value instead of randomly observed
> + * core size value on Power9 LPAR.
> + */
> +static unsigned int get_crash_fdt_mem_sz(void *fdt) {
> +	return fdt_totalsize(fdt) + (PER_CORE_NODE_SIZE * MAX_CORE);
> +}
> +
>   int elf_ppc64_probe(const char *buf, off_t len)
>   {
>   	struct mem_ehdr ehdr;
> @@ -179,6 +202,7 @@ int elf_ppc64_load(int argc, char **argv, const char *buf, off_t len,
>   	uint64_t max_addr, hole_addr;
>   	char *seg_buf = NULL;
>   	off_t seg_size = 0;
> +	unsigned int mem_sz = 0;
>   	struct mem_phdr *phdr;
>   	size_t size;
>   #ifdef NEED_RESERVE_DTB
> @@ -329,7 +353,13 @@ int elf_ppc64_load(int argc, char **argv, const char *buf, off_t len,
>   	if (result < 0)
>   		return result;
>   
> -	my_dt_offset = add_buffer(info, seg_buf, seg_size, seg_size,
> +	if (info->kexec_flags & KEXEC_ON_CRASH) {
> +		mem_sz = get_crash_fdt_mem_sz((void *)seg_buf);
> +		fdt_set_totalsize(seg_buf, mem_sz);
> +		info->fdt_index = info->nr_segments;
> +	}
> +
> +	my_dt_offset = add_buffer(info, seg_buf, seg_size, mem_sz,
>   				0, 0, max_addr, -1);
>   
>   #ifdef NEED_RESERVE_DTB
> diff --git a/kexec/kexec.c b/kexec/kexec.c
> index f63b36b..846b1a8 100644
> --- a/kexec/kexec.c
> +++ b/kexec/kexec.c
> @@ -672,6 +672,9 @@ static void update_purgatory(struct kexec_info *info)
>   		if (info->segment[i].mem == (void *)info->rhdr.rel_addr) {
>   			continue;
>   		}
> +		if (info->fdt_index == i)
> +			continue;
> +
>   		sha256_update(&ctx, info->segment[i].buf,
>   			      info->segment[i].bufsz);
>   		nullsz = info->segment[i].memsz - info->segment[i].bufsz;
> diff --git a/kexec/kexec.h b/kexec/kexec.h
> index 595dd68..0906a1b 100644
> --- a/kexec/kexec.h
> +++ b/kexec/kexec.h
> @@ -169,6 +169,7 @@ struct kexec_info {
>   	int command_line_len;
>   
>   	int skip_checks;
> +       // Given that we might need to update mutliple kexec segments
> +       // then having array to keep indexes of all hotplug kexec segments
> +       // will be helpful.
> +	unsigned int fdt_index;
>   };
>   
>   struct arch_map_entry {
> ---
> 
> ---
> Changelog:
> 
> v1 -> v2:
>    - Use generic hotplug handler introduced by https://lkml.org/lkml/2022/2/9/1406, a
>      significant change from v1.

Generally speaking, this looks good to me!
eric

> 
> v2 -> v3
>    - Move fdt_index and fdt_index_vaild variables to kimage_arch struct.
>    - Rebase patche on top of https://lkml.org/lkml/2022/3/3/674 [v5]
>    - Fixed warning reported by checpatch script
> ---
> 

> Sourabh Jain (5):
>    powerpc/kexec: make update_cpus_node non-static
>    powerpc/crash hp: introduce a new config option CRASH_HOTPLUG
>    powrepc/crash hp: update kimage struct
>    powerpc/crash hp: add crash hotplug support for kexec_file_load
>    powerpc/crash hp: add crash hotplug support for kexec_load
> 
>   arch/powerpc/Kconfig              |  11 +++
>   arch/powerpc/include/asm/kexec.h  |   3 +
>   arch/powerpc/kexec/core_64.c      | 153 ++++++++++++++++++++++++++++++
>   arch/powerpc/kexec/elf_64.c       |  40 ++++++++
>   arch/powerpc/kexec/file_load_64.c |  87 -----------------
>   5 files changed, 207 insertions(+), 87 deletions(-)
> 
