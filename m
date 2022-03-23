Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B384E5A17
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Mar 2022 21:46:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KP0lF0MTlz30HY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Mar 2022 07:46:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=j4J+Rh26;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=Vv3SYZcw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KNxn50rnnz2ywQ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Mar 2022 05:33:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2021-07-09 header.b=j4J+Rh26; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=Vv3SYZcw; dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4KNxn50llqz4xn3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Mar 2022 05:33:13 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
 id 4KNxn50hVJz4xv2; Thu, 24 Mar 2022 05:33:13 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=205.220.177.32;
 helo=mx0b-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com;
 receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2021-07-09 header.b=j4J+Rh26; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=Vv3SYZcw; dkim-atps=neutral
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4KNxn44n2qz4xn3
 for <linuxppc-dev@ozlabs.org>; Thu, 24 Mar 2022 05:33:12 +1100 (AEDT)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22NHvFKG007538; 
 Wed, 23 Mar 2022 18:33:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=Sw53e5Ay6SqwtpX5mtWCD01mAp6ybIbksFs4xbhOx6s=;
 b=j4J+Rh26/6b6ZE9lUrbKZCrOumZE5y0nnJlEiLtndyj23oN6O/nTYBJTF7u3KrfBTI49
 DZCLI8wINrCpGLajOuoxsMXWF+EJ2XpKNroB9BqWrRo0roshX9brZ28N1UbBXFg36dbZ
 WaDI8oyrEIR6AuPPwqYs3AdnQTikcp6tuTBS1DEq0wicgFj97Pega3SkAzYk3GPQqd/F
 qehdBH0VZzDYcOADXcQ9GobAWJr0TPruvJTiAXRqZLMA3xc/v2K1O74n9pwDLb8pJdg6
 xk6jqUQ/UkRbdH4d9HS+y0EvlSnu2XlKz2xfDMvdKZAljbbZfoWs7TK840ppg6bV4qGR xg== 
Received: from aserp3030.oracle.com ([141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ew6ssabk5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Mar 2022 18:33:03 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22NIX2hg114043;
 Wed, 23 Mar 2022 18:33:02 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
 by aserp3030.oracle.com with ESMTP id 3ew578xq39-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Mar 2022 18:33:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lTVXnLJ5Xc6IgNbOyDajFwvWchVvPVoqOSBfauS2jU6eLZE7/dOUyYjDrUSFBEiGEjFcCc1PMd+dG0cZXlzLtBHQI0LFdNDcVovsst9+cGi1+Vri0FqFQq+5shPujMF1v9PIbwNh1Wle8sOhjI2fSqZUq66Cqgo545TwkTGVavtCaMdmLwur+jYtdYztVr+Xmb/Zrd6G8xkl5oYlQkpTeCv0PbaQurVp8NeNCAD6fskOnEkviJqdowOK2uZaFguQFEqZURd+cgpdNBdFsrQzSdEo7Bop8vZWkrehnwnAHR8zjDbqiUkK2DXa4NABvSHGy51HSNtT8S3o25tpJDAxjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sw53e5Ay6SqwtpX5mtWCD01mAp6ybIbksFs4xbhOx6s=;
 b=A1UEzGrqgSeinhURfFWvMQPMXN2omHDH5chTDcYU576HUxt2FyvWN8kx468KPRwQx8hOxPBYarHfZzi+/gBPRQYZ/GVwMFHk0j0LQuOwmgE/UFVomg75TxsJSCk1jhkTidFWYEMNGBjwX0iEkEpILigNio6RTQVG9sm9FVHBqVmzGuWcM9Bp3ODOW7mTbEJ3JxaKzR7liVmtI/wGeMsHET/CKEiJQEFbOGkCzPnGWuArTvPbGF0+TRsDJQM9Om+tq62qOAKI0/KKYz0KZgIOwYj72sbiuoCf/gO3i9W6ewm3DBkU0TDdxVmdFWin4PDnXxJj9WOqs7ZZNTKr2Na/Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sw53e5Ay6SqwtpX5mtWCD01mAp6ybIbksFs4xbhOx6s=;
 b=Vv3SYZcwTIaUYkV6ydCCRYxDAkSF8Q7UtuGF8Q7BV18yvjqUuuMAAyJSbNqMk3swgUAon3cD4GbAtgLRo4sRKXoi+d7tjyILAHeQU2EUJgT7Y3IgTsyjGtSZO0nK/Kvm1ehtVZfT8fk1XjIEVBlADXZJGbG7GpzgOQuPxZHuHNE=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by SA1PR10MB5823.namprd10.prod.outlook.com (2603:10b6:806:235::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17; Wed, 23 Mar
 2022 18:33:00 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::3188:fe86:1d6f:53ac]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::3188:fe86:1d6f:53ac%9]) with mapi id 15.20.5102.017; Wed, 23 Mar 2022
 18:33:00 +0000
Message-ID: <a8b58549-1fee-24d5-4fcb-b12cf8851ca4@oracle.com>
Date: Wed, 23 Mar 2022 13:32:57 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [RFC v3 PATCH 4/5] powerpc/crash hp: add crash hotplug support
 for kexec_file_load
Content-Language: en-US
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@ozlabs.org,
 mpe@ellerman.id.au
References: <20220321080422.56255-1-sourabhjain@linux.ibm.com>
 <20220321080422.56255-5-sourabhjain@linux.ibm.com>
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <20220321080422.56255-5-sourabhjain@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR03CA0025.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::38) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 33bb8914-9bf7-4bdf-5589-08da0cfb8f51
X-MS-TrafficTypeDiagnostic: SA1PR10MB5823:EE_
X-Microsoft-Antispam-PRVS: <SA1PR10MB582384A256D3D64872DC611997189@SA1PR10MB5823.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /aZhH/z2cmi4oj06V8Brsnxv3M0sOHupyVT84LYifUZmsjaKes5rlccTvxU39i1voLTMTi15+05mFfvSYmsOhzPIJUpqNGA82Yab3SFPnr1/QqZxBsi6+LzrSspuZTUReXCs29vFneVGdR0lQeMQgftVvyP1Hb5JLCtQcFX1l8YOum6i4eox2zQH7TT/tx1jp16CS7De/OEpFq7GcfNCYllnku4hNXqupNjqeqCi60ctAa1ermoYibPpXtRZ459Sotal7baxDN8HDIraCLV8pjlAdSjANi9A3+xTXpSCOGbTw4U/NVB0amwQuqU/0T9uJNU1FTifofu16hiCM/teEnP9/HS+LqUPtAIFKy/kJ+H+gNcnpVwfbxhui1BiAG/aUVLR5V25Gz6jyRnuMThNoF/qyvdSWmSEWI/NvT32gOQQ2lX/eE0+5QggmbMUDOmtSbt3d8Uq/x12USvuDFGmz92hVXcuRqMxMETOT5BuRH8BGgDevlFNi/jJEv3R3UEuPO9Vl6TgbaoNeWlJlvOqcToOhXmMoGZ56lCAwPDj3X1kVDMQBilre67TECKYhPIU5I5xc4+yTr+FDNbwL6PmQw1/AZNx2jtRK3vomfa5sVfddPiBv6B/YsjWJMUYpZRd22CX6fLK95FVjc+nkn/trDR6me28NY4bd61+9heSmlXrQdo58AKCyvkyU6OnpPBpAMy0OfTKoDIrqLDTSGOC1fG3lVFVu7Po3c10kNVeKmWV/tTpgwowgN9wxCFpZqo4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6486002)(66946007)(6506007)(53546011)(6666004)(66476007)(66556008)(8676002)(2616005)(4326008)(86362001)(31696002)(38100700002)(2906002)(6512007)(83380400001)(508600001)(316002)(8936002)(36756003)(5660300002)(186003)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVhJd3IyaWJuNEE4aExFaDN5TVNRSTNiOTVVODhVN09ORDAxbXhFL3JhSVYv?=
 =?utf-8?B?VXFTNTNwZkdwMXZFNC82d3hQNjdEbjFSdDMrdnU0NDdlQUtwcVZpY0drcEFr?=
 =?utf-8?B?b2t3amtBdkUzQ2xWa3gzTWlKTXdYbzBMQ0pkdVJUV1hvZWdvQWtIZG5vNmZ3?=
 =?utf-8?B?Q2JzS2xiU25qd2RwZ29DNFVOWlFBZGlYM0llS2VPK1FId0Yyc3BHQ0xRbDNB?=
 =?utf-8?B?Z1daNTVLRXJOaUhqcDVHRmhmbCszZjNZdTBzcE9rRUFZTEVmWDFCK1k1VnEw?=
 =?utf-8?B?a1BIeUE5cUxRY1BEWGc0KytyMWxIclBCL0xaazdhV3lDU2ZYTUt1VkRFU2Vm?=
 =?utf-8?B?MkNHYnpSWVRnSkxrbGUrcDBmK3Jtak1WeW8rZy9RZG0xT2U5WUN1OEFLQ0RP?=
 =?utf-8?B?b1ZybWFjZTRhcmErSWhqTnh2TFBZb3RGc2dBRXJMZUovNE9sK21qc2RLbzda?=
 =?utf-8?B?QUExU0NQUm53WWpXaWl2MEVvK0l4eUY5QnB6cCtyOUZkYlRxYUhZVDB6dlBj?=
 =?utf-8?B?UlJNVWVtTW9tUHFmRmFORjFLc1JObGlrNVRoeHpJVC9nb1U2RllsU2RTMjhj?=
 =?utf-8?B?dytReU9KUkJBazVwb0NWdkFQWXFMZ2JKenl3VU9rMkhpekpLUFl4K3p3cFlw?=
 =?utf-8?B?eVZxS0FTcWIvYkxrb0RocWdRMGJSM1c1Um4wZlgwUG1yKzNQTkkxY2RtVk90?=
 =?utf-8?B?U2YxK1FMYW9EL2J1MVVISUZsK25OaE9mZDhscFBOYURlQVl0UWxQS3dRdDZF?=
 =?utf-8?B?NFkwQXNTeFNZNTlrcDc1MldDcWpaUkJBS1diM3puVmxmK0prNFFjaGNDd3JS?=
 =?utf-8?B?L09KVlFDTFFGQmJTbXBxNldBK21TeEh6SEwvMjZjcU5hQnBhUWJoRWdvbm5R?=
 =?utf-8?B?VWxWYVUxQ1AyNkRub29CK2w3VmQvUUdsYmdVd1NVUWZVUjNEVHJVWkVaRlVa?=
 =?utf-8?B?bWNFMFk3VnpmMG9oZzJoZ2NWZmVrclNqc0lPcVM2TjdLOENvR0Y0ZHhoQ3Nj?=
 =?utf-8?B?M0pZZDd4WjdLbzcweldqazdLa25XdVFxWHVmY3lyQkpzanc0cTgrN0s2ekJJ?=
 =?utf-8?B?YiswaStuVXd4aEszSGJ2Z0NlekNYRFF4a1JZVTVOTXZGRUJ4VU5pT2dnQmln?=
 =?utf-8?B?M09LUjB6K1R4dXJSM0JHdTJTOGFaY3JuR2VIc3c4SU1LeU5WS0JSZGM1Ylc2?=
 =?utf-8?B?WUV0NDl1eDYvditBTkUzME5YWEtZZDUrUHhyZFZjRHJKakdHem01RkdZTkt6?=
 =?utf-8?B?Q0liWEw0TUxwQndMYmN6K2xTRElyWlRzbGVUSk5mNTlabkFQLzhlUldXemV3?=
 =?utf-8?B?RnZlTmNWMi9CTDJXVHk5ZHJDTDVMK1IvUjRSMUJ6RE01a01RaGFMZ2ZHNW9C?=
 =?utf-8?B?cE1weTdzT1BCcXBEOXBYUStMUW1DSS9iOTQzRXNTcm1qNHNBbFBTRHQ1ekh1?=
 =?utf-8?B?ZTFKRGtHNzNDRU9MVStJRkk2N1FpaUhUMVZqRlo4UHVpSnJGaEIwN2kvTTlq?=
 =?utf-8?B?WSt5RGRoVVp5UStRNnVGWWtuTTkwL3FoNis0bG41VHlIbGUzbjNjUmgyNWoy?=
 =?utf-8?B?TXFMWnNMWGxoZnJGNytUeW11ekFKT0dGUStaYlJhdXplSTRibUlnMkxyejdp?=
 =?utf-8?B?ME4xNnNiVzVma0ZTSmN2dDFGbzgzcUxlSkd0N3lxMDM4VzA5KzFnUHBmdkFR?=
 =?utf-8?B?ajAwVWNzbUtGeE9yeTEwT2pDRDJSbDJtSWdwQVVIaHY4d2lROW81T0hqMlM4?=
 =?utf-8?B?SklaR21ndEI2bFhuaDE0dWxmN2N0SHpLRzFVQ3NHNWJxYXBMeEZmOGdISlh3?=
 =?utf-8?B?TnRCc2x5eDFLaEhzYXNySnZ0Vm4ySWlGNUgxdlN2RTBIL3RCV1BUaFhVZHRy?=
 =?utf-8?B?SEFmbVE4a2pka1dCaTVLRkVKTmtmVVdUZ0tCUzh2MDU3aFA2NjN6T2FkOWJJ?=
 =?utf-8?B?NFd3c253T2MwWVRpdG1aYTllUDRtSFhPMElRVWVMQ0hrTGJFSlNRUjQ2ck5z?=
 =?utf-8?B?T2pCVThDZGZ4ZEYwUjBVVHdWZjZ1akZjbXVxVmhpdFZkdGlaWWxNVEErdWJn?=
 =?utf-8?Q?1FQHLb?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33bb8914-9bf7-4bdf-5589-08da0cfb8f51
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2022 18:33:00.8236 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pbc1TEYzrnzxQLMipV4I0c+UJbwTFjYCutfhagG9BotpQf7ZBUXI2OK1JIFHLSwReWWBtboLLPOI9BtSAH792ikDT7sFIN2ECEJgBgAYVqE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5823
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10295
 signatures=694973
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0 spamscore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203230097
X-Proofpoint-ORIG-GUID: XLCm09spuFQ8e0BkjG43XUQNkzj9pZSk
X-Proofpoint-GUID: XLCm09spuFQ8e0BkjG43XUQNkzj9pZSk
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

Notes below.
eric

On 3/21/22 03:04, Sourabh Jain wrote:
> Two major changes are done to enable the crash CPU hotplug handler.
> Firstly, updated the kexec_load path to prepare kimage for hotplug
> changes and secondly, implemented the crash hotplug handler itself.
> 
> On the kexec load path, memsz allocation of crash FDT segment is
> updated to ensure that it has sufficient buffer space to accommodate
> future hot add CPUs. Initialized the kimage members to track the FDT
> segment.
> 
> The crash hotplug handler updates the cpus node of crash FDT. While
> we update crash FDT the kexec_crash_image is marked invalid and restored
> after FDT update to avoid race.
> 
> Since memory crash hotplug support is not there yet the crash hotplug
> handler simply warn the user and return.
> 
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> ---
>   arch/powerpc/kexec/core_64.c | 46 ++++++++++++++++++++++++++++++++++++
>   arch/powerpc/kexec/elf_64.c  | 40 +++++++++++++++++++++++++++++++
>   2 files changed, 86 insertions(+)
> 
> diff --git a/arch/powerpc/kexec/core_64.c b/arch/powerpc/kexec/core_64.c
> index 249d2632526d..a470fe6904e3 100644
> --- a/arch/powerpc/kexec/core_64.c
> +++ b/arch/powerpc/kexec/core_64.c
> @@ -466,6 +466,52 @@ int update_cpus_node(void *fdt)
>   	return ret;
>   }
>   
> +#ifdef CONFIG_CRASH_HOTPLUG
> +/**
> + * arch_crash_hotplug_handler() - Handle hotplug FDT changes
> + * @image: the active struct kimage
> + * @hp_action: the hot un/plug action being handled
> + * @a: first parameter dependent upon hp_action
> + * @b: first parameter dependent upon hp_action
> + *
> + * To accurately reflect CPU hot un/plug changes, the FDT
> + * must be updated with the new list of CPUs and memories.
> + */
> +void arch_crash_hotplug_handler(struct kimage *image, unsigned int hp_action,
> +				unsigned long a, unsigned long b)
> +{
> +	void *fdt;
> +
> +	/* No action needed for CPU hot-unplug */
> +	if (hp_action == KEXEC_CRASH_HP_REMOVE_CPU)
> +		return;
Just curious why no action is needed on cpu remove?

> +
> +	/* crash update on memory hotplug is not support yet */
> +	if (hp_action == KEXEC_CRASH_HP_REMOVE_MEMORY || hp_action == KEXEC_CRASH_HP_ADD_MEMORY) {
> +		pr_err("crash hp: crash update is not supported with memory hotplug\n");
> +		return;
> +	}
> +
> +	/* Must have valid FDT index */
> +	if (!image->arch.fdt_index_valid) {
> +		pr_err("crash hp: unable to locate FDT segment");
> +		return;
> +	}
> +
> +	fdt = __va((void *)image->segment[image->arch.fdt_index].mem);
> +
> +	/* Temporarily invalidate the crash image while it is replaced */
> +	xchg(&kexec_crash_image, NULL);
> +
> +	/* update FDT to refelect changes to CPU resrouces */
> +	if (update_cpus_node(fdt))
> +		pr_err("crash hp: failed to update crash FDT");
> +
> +	/* The crash image is now valid once again */
> +	xchg(&kexec_crash_image, image);
> +}
> +#endif /* CONFIG_CRASH_HOTPLUG */
> +
>   #ifdef CONFIG_PPC_64S_HASH_MMU
>   /* Values we need to export to the second kernel via the device tree. */
>   static unsigned long htab_base;
> diff --git a/arch/powerpc/kexec/elf_64.c b/arch/powerpc/kexec/elf_64.c
> index eeb258002d1e..2ffe6d69e186 100644
> --- a/arch/powerpc/kexec/elf_64.c
> +++ b/arch/powerpc/kexec/elf_64.c
> @@ -24,6 +24,33 @@
>   #include <linux/slab.h>
>   #include <linux/types.h>
>   
> +
> +#ifdef CONFIG_CRASH_HOTPLUG
> +#define MAX_CORE 256
Is there a better config option to tie this value too?
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
> +static unsigned int get_crash_fdt_mem_sz(void *fdt)
> +{
> +	return fdt_totalsize(fdt) + (PER_CORE_NODE_SIZE * MAX_CORE);
> +}
> +#endif
> +
>   static void *elf64_load(struct kimage *image, char *kernel_buf,
>   			unsigned long kernel_len, char *initrd,
>   			unsigned long initrd_len, char *cmdline,
> @@ -123,6 +150,19 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
>   	kbuf.buf_align = PAGE_SIZE;
>   	kbuf.top_down = true;
>   	kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
> +
> +#ifdef CONFIG_CRASH_HOTPLUG
> +	if (image->type == KEXEC_TYPE_CRASH) {
> +		kbuf.memsz = get_crash_fdt_mem_sz(fdt);
> +		fdt_set_totalsize(fdt, kbuf.memsz);
> +		image->arch.fdt_index = image->nr_segments;
> +		image->arch.fdt_index_valid = true;
> +	} else
> +#endif
> +	{
> +		kbuf.memsz = fdt_totalsize(fdt);
> +	}
> +
>   	ret = kexec_add_buffer(&kbuf);
>   	if (ret)
>   		goto out_free_fdt;
> 
