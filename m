Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C09FE4CDC76
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Mar 2022 19:29:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K9GbC5S26z3bVc
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Mar 2022 05:29:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=lC4dawYd;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=V/2Xe5di;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=205.220.177.32;
 helo=mx0b-00069f02.pphosted.com; envelope-from=dongli.zhang@oracle.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2021-07-09 header.b=lC4dawYd; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=V/2Xe5di; dkim-atps=neutral
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K9GZN3Q4Qz30BP
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Mar 2022 05:28:23 +1100 (AEDT)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 224HCat4015308; 
 Fri, 4 Mar 2022 18:27:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=E41W9AB7/X2xx7UrWdagdqfWZZYBGIFtIK/VhE/09OQ=;
 b=lC4dawYdb0VDvsY75ChKSioIuBPZEi0JorEE4gTIX8lDtVtzBMK/SNXOgt1bwaENOShK
 HvNpEFIlzDDaqB7pO/Os4pXUI7jBwrvhZ9gh2PBuHIsM6q3w5TYwLSRxMA2HsaCRCEjf
 hQTA4/BvlLpty73Q7neEpY3oaF2+aAuH+Rl1TyT14xRQRiTc7r9HO0cn79HxphXKNQFK
 i8D2E1BS8iTU6+QX9t8RWDKnpWrvfh0MtF3NkMf++3lXkuyLNy4CK0J63xYWr5tiRi4O
 TN3WYFosocYY5hhAbAnKYQ0VQHcXSB4fJOQxf17vd2KxK5B+uwG+rF2RHP8vad9TSw6T Fg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ek4ht2j6s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 04 Mar 2022 18:27:56 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 224IH39h128219;
 Fri, 4 Mar 2022 18:27:55 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2171.outbound.protection.outlook.com [104.47.59.171])
 by aserp3020.oracle.com with ESMTP id 3ek4j92jn9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 04 Mar 2022 18:27:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gmmU5gxqtTr0n+hCoWI4tOvvTPlA0iNC9lieqh7D6KBl9+VYFbX5YZ7mE8PO7dt4YTfly8E9CZssq1vb1aLngQSZayuFw7PcvDL76LDW9nkRWaFrfCGyb+ubmAZZFGrJR2GMuLzk17XKR6avI8K0u2ekDP/FSHpAJ7DjGdL9pNcWomXxvUDhkK63I1jYZ+P0/Npitjr+XjEMkCue/ryuC9Xg8r4lpxz6CwJYHUjtAxJMkYhQE1UfqqnS5eHYSDC386C2ScrnmpJF8CWlgOepXDjwaAA/FRhqMTYSMSCW5lz8D+pJpDmHt+sV6oZbc25hJ/1+zOlPc43yW4XOGlou8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E41W9AB7/X2xx7UrWdagdqfWZZYBGIFtIK/VhE/09OQ=;
 b=UojoVXG6sM5Z8jSUl/ZAJrk99MoyYBQOncH3STNycdd0MLK/i9Xf9S0jeUTDpXqeCKiLp6dgkYErVC6u7e0HqDqm0Cx8UNug0J+pQ0Zw2jHzGKdPX38xlVr9YbVAktxZH579V5xI6e+al0V5qLERMBE8Etbdt3xfPOS+aNr0R9pjYI7XMFDukbjhqGia8fw5bNyTN10fgDuxWgohxdw0GkZRuJqP9pdHqXYnZWDL3KLvGpwWsdiGJe36tzs5vq4tBoiWj6LZ3FQH5wlbmOUzXlm7adA4aHWdlXW2fNT84pvJ9zMnNpVP/iGWIO1d4R15B5pj6phO/ddlvFqWza+7ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E41W9AB7/X2xx7UrWdagdqfWZZYBGIFtIK/VhE/09OQ=;
 b=V/2Xe5dianinvARdqhn/uw3gmqOXWhpf7J/M2IJ++1z2wussNs2j65WKX856pegCRblzwxGLT6yIV2qwLjg04lQDTv7II2sI0djzD/6IE2pVQXnqQzGAQn+EMX1ONlQLHXX21GPKez9bPLAbaO3JVqVUBCszkdM7eKryUf8e5Fw=
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by DM5PR10MB1849.namprd10.prod.outlook.com (2603:10b6:3:10b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.16; Fri, 4 Mar
 2022 18:27:53 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::a0d5:610d:bcf:9b47]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::a0d5:610d:bcf:9b47%4]) with mapi id 15.20.5038.017; Fri, 4 Mar 2022
 18:27:53 +0000
Subject: Re: [PATCH 10/12] swiotlb: add a SWIOTLB_ANY flag to lift the low
 memory restriction
To: "Michael Kelley (LINUX)" <mikelley@microsoft.com>,
 Christoph Hellwig <hch@lst.de>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>
References: <20220301105311.885699-1-hch@lst.de>
 <20220301105311.885699-11-hch@lst.de>
 <MN0PR21MB3098F7AFC85BE5D83B0E64E5D7059@MN0PR21MB3098.namprd21.prod.outlook.com>
From: Dongli Zhang <dongli.zhang@oracle.com>
Message-ID: <556312e4-da86-b980-475c-1cfd7818ffdc@oracle.com>
Date: Fri, 4 Mar 2022 10:27:50 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <MN0PR21MB3098F7AFC85BE5D83B0E64E5D7059@MN0PR21MB3098.namprd21.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0035.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::10) To BYAPR10MB2663.namprd10.prod.outlook.com
 (2603:10b6:a02:a9::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2de9445d-3444-479f-1615-08d9fe0cb225
X-MS-TrafficTypeDiagnostic: DM5PR10MB1849:EE_
X-Microsoft-Antispam-PRVS: <DM5PR10MB1849E5A16214D1BA5A77FBE8F0059@DM5PR10MB1849.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T0nDl+o7gSSkYKtGZad7dLh0S5JfaMzvaWYqwDDJ8s+UKGiONT/n29WbPW+Q2xqq28sADWCKP/E0JoHZWjiQJ/FERWnftp0tsAy6+rdi/bNYkOHIwcS+aK8rcD2bJhwaaByI8Fq2FgrJQRyiHtfrB7mloNoyGhKWXUQU85rFCzfkXQbeMQbzs8g3uH3KBhpFdGQQBS24OoQqCEL+JDHT2MWGkl9NBhk6BLF4+yH52mKGo4t5yEOdO13w7qgRaqHx9jBDKUIU9HA/WHH5F6RPI0/qlZQeAUvR8f0AFDjU8bwOwCixBJ4KfHj0KkivCk/4+s1qalHpJzxZBZ0dj4orRF0qvkX40I1qfVSvf5KyBvE8eHoObBSYq2EvqjIYoSZwEZcMS79FW3Tv3ckEudgEYL5tSeRD8pSqypnrAC1PG3ScGuIZRiQGtluu9B48ewHv2koxTXlilx54qYWXktWVDLplvL/OKwWCv1e1yP0wOkOm60Ts73LOH64lNfEx9qd4XsNKb0jYQaYGvQci4N5qEstR76O+wNHUXAFGsQ+h4LoC8T48Q08OsHDIFg80AY/AiMfkZ+KvsaSrqI9sp47uZ7NHVCDP5XafFI3K6LAMTR+0qCKfwRnNFzivCq4y86uIcO3RhUUjpmMjlNRGzfXbOO0aFcWa7bjswoXs8KGdcjDYq3lKPtd1ebSyu9UIWcJyqaD515wprvzc5bxYU3EE/pR4bQuVbsJMKKlhNvRfV66+STlcM+4yurZnpd73OCn0X2DW9cX8rNA3k20JYyyjgdX+gEqqmvionG4sECAjO+Dp+RQahBlCKI0xCWu1p4g4aqusOhzao9VeEdA/6T0m/SQzyr9tP1PtgnfVi1rdaeg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2663.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(7416002)(186003)(5660300002)(44832011)(31686004)(110136005)(6506007)(508600001)(8936002)(38100700002)(2616005)(8676002)(53546011)(86362001)(66476007)(66556008)(66946007)(83380400001)(2906002)(6512007)(966005)(316002)(6486002)(4326008)(54906003)(31696002)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WDAxZkZDSWV6MFc4a2h2VnBGUzBNQjE3MTVNMWhmL3ZEbnJyaGlwS3VpK0NG?=
 =?utf-8?B?cTRXaU91WmFqNE1xYnZXczA1VjhUeHRpUlpaSDVjTzZvYjBVMGtmMU04OGVy?=
 =?utf-8?B?bTNHdGVrWm1MclZ5NHJrNzZnY0U4aUdBMk1rdHFJTitZbDhUVWRrSjlyNVZu?=
 =?utf-8?B?WUQxRUxzemhIWnRLa09Wa3UzdzNsL1hPTjMxY0FycGNHT0R5anNybG03dzlh?=
 =?utf-8?B?Q0NGbzZjQ1lUdDJ4UEhNTFBqbHhCc0QyTm9TNWZmNDM3N0dnWWJNd0V4VmJN?=
 =?utf-8?B?Q21LVkRac1pwZFVNb0RWTGExSDQ1SndoU21Cd2JFMHpSQzVwaFRLem9iR1hz?=
 =?utf-8?B?SkJuM01LVVZadFR4ek9sbGdsOUpjRVRYaUFYZ3oyZFVTd09SZHVrT1ZGNS9V?=
 =?utf-8?B?SzBHaSt6N3JrdUZldm55VVAzSlZ4T3N5NnVvcUg0Y0JGMkhERHFNZkJHY3oz?=
 =?utf-8?B?ZEhBRUJZYzUzcVRKb0cvdlNSbmF3bXkxWFFrSFh5UVl3RUR1eVdmbC9UNHQ4?=
 =?utf-8?B?cm9id2JkcTBWWWtxMzByU0RyLyt4THp4UXFIWVJIZnZJV3RyVE1sVUNrZks1?=
 =?utf-8?B?bG1LOEJWd2pTZGJpQzdjb0V5K2trazkxY3lkSldmRzZKaGxTb3VJSXIzSVFJ?=
 =?utf-8?B?RXhHc1VaQ0pNYUFmSWlGMWdQamhIMlNXQTdzRERod3IrVDhQbFRwTzYvd1o1?=
 =?utf-8?B?Z3E1dnN3VkdQbUgyZ0ZGZ0RPTUdoL3UzWFlmWDh6bE11VHFKUzlNclRvTTZu?=
 =?utf-8?B?RXpGNkJHNWh3a3V6UEgrS3pGS0YwWlB5a1pBaUZHek0yczBQdFZLOXoyaVFZ?=
 =?utf-8?B?Sm1GQ3hNSDNRa1NvTDZIOHVqdnRqU0ZIV0thQzNHbkNJVlRNa3A0Z1JRaDNZ?=
 =?utf-8?B?U2E0Z0kxeEkzbUZuVFFsSzROTENZWHRjT2R2SmhZVnhGRVhUbGRPaUVKUHJF?=
 =?utf-8?B?cEc0Z29FZlBZVVdSbXRXcWV1N3hibU93TTh2aDF6bW91TWFLcTNnYVlhSzFJ?=
 =?utf-8?B?dEpKdmdGd1M2MHkrcmZhNkZOREZLZDh0aFZXamQ3dTJEbzVOWVlXdGxjNVNZ?=
 =?utf-8?B?SjNqcTR6YUNFdmRzTVMyaGZYVlBPWXBlbkQ0cWhiUWFDbWJGNTZsbG1nekVV?=
 =?utf-8?B?dDErcmZHM214RFZYUXl3WVI0RTdCWnc0TUJqSHFCTWVFTzFCWmhrUkRGaDJx?=
 =?utf-8?B?bVlqUXdudmd5d0FWL0VVS0VoQ3dUSzFoZmpxeGdXNUFqeCt1ZXBWTDcyNnVP?=
 =?utf-8?B?WjZUa1M5U0xaQ3JtcEhkWDZBc0ErVHp3K1ZJOTZQaFN2d21FdjlSYVFtQTJk?=
 =?utf-8?B?S1ExUmNnT2ZVUWhJdmRrQTZlWlAyd05MR2R1NldTMTB4TllGL2RROTVzK3ZL?=
 =?utf-8?B?MWlVdkZxblNWSGhnb3MyTS9xNDB6K3d1dkp4bmFlNnhEZ0RyV2I3ZndwNU5P?=
 =?utf-8?B?cEpuaDhlbVY0T25sUFBXdjJUTjlrQWc0UzJ6dktoSWR4VHZhdzc5Skh1Wm1t?=
 =?utf-8?B?QnVUZlZQeVplUlY3Tm9uT1ZmOUhWTFZMcVJDdERrM09WbVJ6S0sxRXFUTTY5?=
 =?utf-8?B?aU42V2pSOHpyelZOeWFSTmxyL2xDME53N1dGeTRiU3kxeVI5QzRBZENtQU9y?=
 =?utf-8?B?U2szeCtMQ2tNUCtHMXFmR0d6cGNzSXhtQUh0TVRpTDZaYzllWFZhc1ZSWkd0?=
 =?utf-8?B?WGJVelNBTEE5dnUyZWdjTUhRSFdwZ0RXWGlOQWlqQ3AvWk1BNlIrM3gvL0Jl?=
 =?utf-8?B?RzROUStBemFGRmwzYk1ENHlMVy80ZlAxV1FoM3pHVnpYVFVKOWxCWEZDQVJa?=
 =?utf-8?B?cnlNa0JnT2lSTHk1bnc2L3JNRFJUM3NtU0NxTGx1T0hvN0ZqRUFIOHNxbnNo?=
 =?utf-8?B?WmpXSSt3aUtOTStnakZRWFRhU0ZXWEhuM1NocHRXZ0lnaUlKeFNUV0laS2dB?=
 =?utf-8?B?d0sveUhUOStDdENwTUdPYVkyK2RjYU5FZHNUbTJaWVpKRmVjOE1kaU4ycE5T?=
 =?utf-8?B?K25aeC9hbWFCUzd4b0s2VlV3NXVlYXcrSGpId3ZobWl5RjczZ2FCZGpObEl3?=
 =?utf-8?B?bWZNa3RvRFBaU0xpR1VSU05vWm02MHZFV1Bnd01OUVFFdmRUdERsTW9KUUg4?=
 =?utf-8?B?TDdaUnAvWnJwSncyK25FeUhaaTA5RXFsMTFaQnhjcVpNSkxtN2VucE54NzNz?=
 =?utf-8?Q?8krf42B7GoJ7C4N+k6IUVJ2E4YZ1f/POPV04CHKAW+Eu?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2de9445d-3444-479f-1615-08d9fe0cb225
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2022 18:27:53.4129 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GKjFR8zhBR98XVYezKj18C7MPnB6fFzjs1UYx9YrejjusZjdFSq5Qum0RiztGuGIRBVn8bLyEMuMzoSyLt3oHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB1849
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10276
 signatures=690470
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0 bulkscore=0
 malwarescore=0 mlxscore=0 spamscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203040092
X-Proofpoint-ORIG-GUID: 5zkTEFZIUil-jkep0W3bngAeAxQzK4mA
X-Proofpoint-GUID: 5zkTEFZIUil-jkep0W3bngAeAxQzK4mA
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
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 "x86@kernel.org" <x86@kernel.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "tboot-devel@lists.sourceforge.net" <tboot-devel@lists.sourceforge.net>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 David Woodhouse <dwmw2@infradead.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael,

On 3/4/22 10:12 AM, Michael Kelley (LINUX) wrote:
> From: Christoph Hellwig <hch@lst.de> Sent: Tuesday, March 1, 2022 2:53 AM
>>
>> Power SVM wants to allocate a swiotlb buffer that is not restricted to low memory for
>> the trusted hypervisor scheme.  Consolidate the support for this into the swiotlb_init
>> interface by adding a new flag.
> 
> Hyper-V Isolated VMs want to do the same thing of not restricting the swiotlb
> buffer to low memory.  That's what Tianyu Lan's patch set[1] is proposing.
> Hyper-V synthetic devices have no DMA addressing limitations, and the
> likelihood of using a PCI pass-thru device with addressing limitations in an
> Isolated VM seems vanishingly small.
> 
> So could use of the SWIOTLB_ANY flag be generalized?  Let Hyper-V init
> code set the flag before swiotlb_init() is called.  Or provide a CONFIG
> variable that Hyper-V Isolated VMs could set.

I used to send 64-bit swiotlb, while at that time people thought it was the same
as Restricted DMA patchset.

https://lore.kernel.org/all/20210203233709.19819-1-dongli.zhang@oracle.com/

However, I do not think Restricted DMA patchset is going to supports 64-bit (or
high memory) DMA. Is this what you are looking for?

Dongli Zhang

> 
> Michael
> 
> [1] https://urldefense.com/v3/__https://lore.kernel.org/lkml/20220209122302.213882-1-ltykernel@gmail.com/__;!!ACWV5N9M2RV99hQ!fUx4fMgdQIrqJDDy-pbv9xMeyHX0rC6iN8176LWjylI2_lsjy03gysm0-lAbV1Yb7_g$ 
> 
>>
>> Signed-off-by: Christoph Hellwig <hch@lst.de>
>> ---
>>  arch/powerpc/include/asm/svm.h       |  4 ----
>>  arch/powerpc/include/asm/swiotlb.h   |  1 +
>>  arch/powerpc/kernel/dma-swiotlb.c    |  1 +
>>  arch/powerpc/mm/mem.c                |  5 +----
>>  arch/powerpc/platforms/pseries/svm.c | 26 +-------------------------
>>  include/linux/swiotlb.h              |  1 +
>>  kernel/dma/swiotlb.c                 |  9 +++++++--
>>  7 files changed, 12 insertions(+), 35 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/svm.h b/arch/powerpc/include/asm/svm.h
>> index 7546402d796af..85580b30aba48 100644
>> --- a/arch/powerpc/include/asm/svm.h
>> +++ b/arch/powerpc/include/asm/svm.h
>> @@ -15,8 +15,6 @@ static inline bool is_secure_guest(void)
>>  	return mfmsr() & MSR_S;
>>  }
>>
>> -void __init svm_swiotlb_init(void);
>> -
>>  void dtl_cache_ctor(void *addr);
>>  #define get_dtl_cache_ctor()	(is_secure_guest() ? dtl_cache_ctor : NULL)
>>
>> @@ -27,8 +25,6 @@ static inline bool is_secure_guest(void)
>>  	return false;
>>  }
>>
>> -static inline void svm_swiotlb_init(void) {}
>> -
>>  #define get_dtl_cache_ctor() NULL
>>
>>  #endif /* CONFIG_PPC_SVM */
>> diff --git a/arch/powerpc/include/asm/swiotlb.h
>> b/arch/powerpc/include/asm/swiotlb.h
>> index 3c1a1cd161286..4203b5e0a88ed 100644
>> --- a/arch/powerpc/include/asm/swiotlb.h
>> +++ b/arch/powerpc/include/asm/swiotlb.h
>> @@ -9,6 +9,7 @@
>>  #include <linux/swiotlb.h>
>>
>>  extern unsigned int ppc_swiotlb_enable;
>> +extern unsigned int ppc_swiotlb_flags;
>>
>>  #ifdef CONFIG_SWIOTLB
>>  void swiotlb_detect_4g(void);
>> diff --git a/arch/powerpc/kernel/dma-swiotlb.c b/arch/powerpc/kernel/dma-
>> swiotlb.c
>> index fc7816126a401..ba256c37bcc0f 100644
>> --- a/arch/powerpc/kernel/dma-swiotlb.c
>> +++ b/arch/powerpc/kernel/dma-swiotlb.c
>> @@ -10,6 +10,7 @@
>>  #include <asm/swiotlb.h>
>>
>>  unsigned int ppc_swiotlb_enable;
>> +unsigned int ppc_swiotlb_flags;
>>
>>  void __init swiotlb_detect_4g(void)
>>  {
>> diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c index
>> e1519e2edc656..a4d65418c30a9 100644
>> --- a/arch/powerpc/mm/mem.c
>> +++ b/arch/powerpc/mm/mem.c
>> @@ -249,10 +249,7 @@ void __init mem_init(void)
>>  	 * back to to-down.
>>  	 */
>>  	memblock_set_bottom_up(true);
>> -	if (is_secure_guest())
>> -		svm_swiotlb_init();
>> -	else
>> -		swiotlb_init(ppc_swiotlb_enable, 0);
>> +	swiotlb_init(ppc_swiotlb_enable, ppc_swiotlb_flags);
>>  #endif
>>
>>  	high_memory = (void *) __va(max_low_pfn * PAGE_SIZE); diff --git
>> a/arch/powerpc/platforms/pseries/svm.c b/arch/powerpc/platforms/pseries/svm.c
>> index c5228f4969eb2..3b4045d508ec8 100644
>> --- a/arch/powerpc/platforms/pseries/svm.c
>> +++ b/arch/powerpc/platforms/pseries/svm.c
>> @@ -28,7 +28,7 @@ static int __init init_svm(void)
>>  	 * need to use the SWIOTLB buffer for DMA even if dma_capable() says
>>  	 * otherwise.
>>  	 */
>> -	swiotlb_force = SWIOTLB_FORCE;
>> +	ppc_swiotlb_flags |= SWIOTLB_ANY | SWIOTLB_FORCE;
>>
>>  	/* Share the SWIOTLB buffer with the host. */
>>  	swiotlb_update_mem_attributes();
>> @@ -37,30 +37,6 @@ static int __init init_svm(void)  }  machine_early_initcall(pseries,
>> init_svm);
>>
>> -/*
>> - * Initialize SWIOTLB. Essentially the same as swiotlb_init(), except that it
>> - * can allocate the buffer anywhere in memory. Since the hypervisor doesn't have
>> - * any addressing limitation, we don't need to allocate it in low addresses.
>> - */
>> -void __init svm_swiotlb_init(void)
>> -{
>> -	unsigned char *vstart;
>> -	unsigned long bytes, io_tlb_nslabs;
>> -
>> -	io_tlb_nslabs = (swiotlb_size_or_default() >> IO_TLB_SHIFT);
>> -	io_tlb_nslabs = ALIGN(io_tlb_nslabs, IO_TLB_SEGSIZE);
>> -
>> -	bytes = io_tlb_nslabs << IO_TLB_SHIFT;
>> -
>> -	vstart = memblock_alloc(PAGE_ALIGN(bytes), PAGE_SIZE);
>> -	if (vstart && !swiotlb_init_with_tbl(vstart, io_tlb_nslabs, false))
>> -		return;
>> -
>> -
>> -	memblock_free(vstart, PAGE_ALIGN(io_tlb_nslabs << IO_TLB_SHIFT));
>> -	panic("SVM: Cannot allocate SWIOTLB buffer");
>> -}
>> -
>>  int set_memory_encrypted(unsigned long addr, int numpages)  {
>>  	if (!cc_platform_has(CC_ATTR_MEM_ENCRYPT))
>> diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h index
>> dcecf953f7997..ee655f2e4d28b 100644
>> --- a/include/linux/swiotlb.h
>> +++ b/include/linux/swiotlb.h
>> @@ -15,6 +15,7 @@ struct scatterlist;
>>
>>  #define SWIOTLB_VERBOSE	(1 << 0) /* verbose initialization */
>>  #define SWIOTLB_FORCE	(1 << 1) /* force bounce buffering */
>> +#define SWIOTLB_ANY	(1 << 2) /* allow any memory for the buffer */
>>
>>  /*
>>   * Maximum allowable number of contiguous slabs to map, diff --git
>> a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c index 1a40c71c4d51a..77cf73dc20a78
>> 100644
>> --- a/kernel/dma/swiotlb.c
>> +++ b/kernel/dma/swiotlb.c
>> @@ -275,8 +275,13 @@ void __init swiotlb_init(bool addressing_limit, unsigned int
>> flags)
>>  	if (swiotlb_force_disable)
>>  		return;
>>
>> -	/* Get IO TLB memory from the low pages */
>> -	tlb = memblock_alloc_low(bytes, PAGE_SIZE);
>> +	/*
>> +	 * By default allocate the bonuce buffer memory from low memory.
>> +	 */
>> +	if (flags & SWIOTLB_ANY)
>> +		tlb = memblock_alloc(bytes, PAGE_SIZE);
>> +	else
>> +		tlb = memblock_alloc_low(bytes, PAGE_SIZE);
>>  	if (!tlb)
>>  		goto fail;
>>  	if (swiotlb_init_with_tbl(tlb, default_nslabs, flags))
>> --
>> 2.30.2
> 
> 
