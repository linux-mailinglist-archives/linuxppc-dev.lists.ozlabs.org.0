Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B67546F76
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 23:57:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKZZf284wz3cd9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jun 2022 07:57:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=twvFhPE2;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=AxKzW2Cf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=dongli.zhang@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=twvFhPE2;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=AxKzW2Cf;
	dkim-atps=neutral
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKZYq09Wcz3bsq
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jun 2022 07:56:59 +1000 (AEST)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25AK4PA3013538;
	Fri, 10 Jun 2022 21:56:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=Ah1q/mlyzuwQjVr+0PaIA+PZqMDHC3wQFrogkSXgZ1o=;
 b=twvFhPE2hMl+9jDxQPaZ6hPSr5g5f+sVWYa5EKYaReCYaHZyme6fCvCluyt94gT1VK5L
 E9J76yJ+BXNaV/VKV3nAHOQ3ORCX8Br1cvV1hhLWsfKWWbX0J++lXtUsR69SjNbtMmbE
 KZ7sKY4oqn97s2kRqE+4s6GZZPXVHu0OqBlMKIi9TTp88xTu/mk5Vy5fWLsqVUGPqX+r
 W2fu/pjUhCvFW273l44LRRA2MZcuOqt+6bwqUP/+CCppi9/neIRopn4lMMi87fC3RuMv
 EON3GXFbE9TSWrJ7s/vAmBxrpink4+MGopueDV/BxmWUZ57u+JJD/O9BuzvqV3DiVa0m 7Q== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gfydqxjwx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Jun 2022 21:56:16 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 25ALURow035728;
	Fri, 10 Jun 2022 21:56:15 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2105.outbound.protection.outlook.com [104.47.55.105])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id 3gfwu70apy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Jun 2022 21:56:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RkfIyM7RiKKEhZlKQMn5AG0Stv1daxuZRc6CgGjA+f5/gjHT0P8s6KWDVLOsMckVeVEiE4/RynRYK1ROhHRtthZRBOCGdE1td4UYabgcVMK1JpXCPmam3ZCvHOoJDOFfAPiqt54mBUIGSjPE5U41zmxgrqhciNJuMREXtdp97q3Jq/1HJmVIxJf2iwJLMzHBPGn+jp1oWEPAvQX6JMdaSpcSzmn7WrlC5/xU7sUTSA+AyPgH+E71WZIS2SQN/ds2QrAbrX9QtrNnt8/F0ZlanceoaDc05cebgoR9EcYTI+deTYIW5Kby+k4bNVEPRVKpN6utlz33RKxLSnamt7jz8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ah1q/mlyzuwQjVr+0PaIA+PZqMDHC3wQFrogkSXgZ1o=;
 b=S+Q8TeJNBI8rDNDuZau8dDQmxhwc9ZWNJ6GrnYaRm62bwrNZrEZj3PWkfjPB9cwxy5UiE6ejFlZvC5HnrhCwd5XrYzA8acGcQzryw9M/yOsfeMuApuRhgORis8X2Kmvk5H7ZemSNummNlr8+7+ivL+kxEFFQUCGS9i5amuLKmhSj6HgUlc3Xd8yADQeQqseYdhYMTOmwlrkVa1Ww+OLZGimhNTt3/hJvI13ZkRqRadZPkpTf6Itc/tAP08Vm5glt8VCc1YAl9OB66AX8B7HBtPiovRPleJQTD/LYts3SQ/ycTDhQl5gsUX0coMhAK43TajmoUNymNM9jXgSRWMFdqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ah1q/mlyzuwQjVr+0PaIA+PZqMDHC3wQFrogkSXgZ1o=;
 b=AxKzW2CfhOl6Ha43E4IrDl+dLlbthxL9dgpYr2bNksa3w7cQlzNTKhxZils/pyA3y9drnQNIvMXsB0oxCOEG8ujj2BqZjh0Uj0H/OaazJ65ismvf66UXJKY6qRM8AdVhgXG2CfserLzhmNPCaHwSp1ycGfIRvAl5J6EZyhrJXpw=
Received: from BN7PR10MB2659.namprd10.prod.outlook.com (2603:10b6:406:c5::18)
 by MWHPR10MB1887.namprd10.prod.outlook.com (2603:10b6:300:10b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.15; Fri, 10 Jun
 2022 21:56:13 +0000
Received: from BN7PR10MB2659.namprd10.prod.outlook.com
 ([fe80::54fd:3174:8ce4:985a]) by BN7PR10MB2659.namprd10.prod.outlook.com
 ([fe80::54fd:3174:8ce4:985a%6]) with mapi id 15.20.5332.014; Fri, 10 Jun 2022
 21:56:13 +0000
Subject: Re: [PATCH RFC v1 4/7] swiotlb: to implement io_tlb_high_mem
To: Christoph Hellwig <hch@infradead.org>
References: <20220609005553.30954-1-dongli.zhang@oracle.com>
 <20220609005553.30954-5-dongli.zhang@oracle.com>
 <YqF/sphJj6n+22Si@infradead.org>
From: Dongli Zhang <dongli.zhang@oracle.com>
Message-ID: <e6345c27-78fd-be72-9551-1d1fd5db37a4@oracle.com>
Date: Fri, 10 Jun 2022 14:56:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <YqF/sphJj6n+22Si@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DM6PR04CA0023.namprd04.prod.outlook.com
 (2603:10b6:5:334::28) To BN7PR10MB2659.namprd10.prod.outlook.com
 (2603:10b6:406:c5::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3d1c90ed-5e46-4fa9-ef24-08da4b2c0924
X-MS-TrafficTypeDiagnostic: MWHPR10MB1887:EE_
X-Microsoft-Antispam-PRVS: 	<MWHPR10MB18874953901C1646FDF821D9F0A69@MWHPR10MB1887.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	g3DMbLC2NULjwmYZwgktrD/KIFgWWHKyIx4cQciMNUNL3NH3Dxaw508Vcej5050h3vD0RliliGOAbYLXZTuGwfDRxO/ePEL+vFlAgiwOL0ErnAAOt0L+9Lqs7iFkvUSQj2Iyux1CV5+Hn8JgLsJdE+HfZHyEJ6UPhNAlZIYOmHuer8YgQGvGteoqqgBqXVTwQe+BwNZtHpS8/cgkelYox3PrZC9q3D4SpmS7/pkgk9JM5dlMB4iAN7DkLhqsJrAIJsYDzrepUyjljKMcwJQrZWEjJQtTIBcR7IqYhdKHMjVpkg+rZHgJRAf+Tv8JL6A/ygvd3KK0Ap+BCTfWnioT1kAA5ehXZ9kJfZ0j18sRgLdsLDjvWYUcWqzeitx+4plaZ2au/vpQwTNIOD4lDfedzb/ONLLfWbXJan26VQtZVCMeCV5ngbVB8uHGinoJAbY/cXICdajPXZaG8ATZTyI8nW1unFq5Ydrm5DGiB+Rpq1D1HsAswwwwOWuvkDHHmOXF7HDGPKj1HKPj1gqBzXUbM5NFRPu/7yBU32P/eV93U1fNWDWwO2dlb5kZ6jFMWqwTVJRtYPtmeD7yhKhkUJIpivjQHpK6zeEgcZRjhTYtoU0auLC46NRbeeh7yPV+R/cdvPRhw+2iet7m4tGkrCsHMT7E9m/epqX48pFhiAdVaOL1An+B9ldXHIMwFklcc9E5RfLYuFKOJycct4Peitll1bSYexZk/pyLDWWO6k0EAGO+tsRLWWTe+7vXUcSh2Qwn
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR10MB2659.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(44832011)(7416002)(2616005)(6486002)(508600001)(8936002)(5660300002)(83380400001)(186003)(6666004)(316002)(86362001)(2906002)(107886003)(6512007)(31696002)(6506007)(53546011)(36756003)(8676002)(66476007)(66946007)(66556008)(4326008)(6916009)(31686004)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?SElMakVJdHpJcUg2VVlKOTA5OG9Od041YndoTzdGQ3FyVGNBS0d3amkrOHh6?=
 =?utf-8?B?RElTenFzSXRaQmZuSDlPOEhVK2N6blVnNElHRDJuY2FvSDJteVBpbnlieXE2?=
 =?utf-8?B?eXNUMlRHUXVqK0g3cjBaZXB1R3NEeElKRmcyRmNod0dYdzh5eEhGWTdteGJF?=
 =?utf-8?B?MEQzc1NUQkFlZzNRVnJZclk5UEpjU3cwTG1rSVlaUmh6L2xBUzlaTFY4dC9p?=
 =?utf-8?B?dDZxTTFXRWt2VHZTQ0J2eHFmclQ3TjhDbE90dDRLa1BJcVI0dHJlcFFGdTJB?=
 =?utf-8?B?dThyc3BNeGpjOXgzTTBOUzVwKy91Y25OUW1QQnJJUGphUEc5MWxPclN3T0pO?=
 =?utf-8?B?aVpNQ0QwNGZ5ZUk5d3g3ZWxHNW9aeW1mOW44WlpTMnE2VmtRSWNwdTRYUGox?=
 =?utf-8?B?OVlRUTZEdWNOT25LREE4eWtBU2N5dDVoUkUxZy90WUUyYTJwWmE0bXdvZFdM?=
 =?utf-8?B?SkNDaFM4dWZSekxad0pRSHphQzV2czUzTm11b1hHbm1aYVEwTmk5elRCbnpt?=
 =?utf-8?B?WnBlUkhjMEdDejVVa2tPU3FNS1RVTUZjVEFkVkw0YTFza1R4Rk9vMHorc2VY?=
 =?utf-8?B?blBIVE9FR0lrUmRzbjZNbmxUamIwQ3lDN003aVhvYUlZSnVJREdSVi9sZHZV?=
 =?utf-8?B?MDBGanAyQWFXRVVndkNpZlptaEJwM1dNU0xaTEgwZ0xKYUhZSi9NR0FnKzNI?=
 =?utf-8?B?ejRqZ1djM0w2QnM3WkJMV3Uxd01iUUhFY1hwT2d2K3kyNTZtUWlySnpEMUFk?=
 =?utf-8?B?TVhhcjU3K0pjWmtZalIzZkFaMmZtREYzVHU5eGZ0dkZRRTFJeTkrSU1KK2V3?=
 =?utf-8?B?NmlmVy9SOHM3dkdmdndPSzB2UVZQVHExSWpwVFdNOGRKZ2IwMUZOc0U1akpB?=
 =?utf-8?B?U1o4TWIySkFjVnpHZWpWamYxNEVubEowUEg4eDFqWnQwV25SZDI2TCs0U1Qv?=
 =?utf-8?B?S3lnVmFUZGhFV3dEbWtSZ0kwV1FuUWlWUFhTSWdSWTkrRWpHTnRXeWVGWHRv?=
 =?utf-8?B?U2RtT0JtTlduR0NkWVlVNUx6OXBFZ1lXNzUwdGRxdlpLcXk0TnRrcXdTZmRx?=
 =?utf-8?B?UGk3SWZJR3hua0RmZWRvQVRvRDV2elBXMFRYQjZIcm16dWsyUjVMQm5YNzNL?=
 =?utf-8?B?NVdFTVF0clU4ZjFiZzNUZzhGb2JyNnAwT3VqS2srY0RTaVFTZTdiVjNVVUts?=
 =?utf-8?B?TXc1bnNRdThwRFJiek02Y094YVlaMnJkaGsxMGJYSFVKS0JUelZXcVZ1T2pX?=
 =?utf-8?B?Q1VxOHd4dXRibDdxakNnQWNFSHJuWUZkSC9TQTFnOGVkeGVvUzUrL1lQSUIr?=
 =?utf-8?B?UnI4QlN4SUxsRmg1ZU1RQk0rU0FqUCtUV0JmN3MxVUxqcjM0SUlLdmRYSXo0?=
 =?utf-8?B?aHJrSFR6QWpGRUVGSjVpZ0ttUVBzWnUwbEVKdzd2bG5lWnM2Qm5aSktlaERq?=
 =?utf-8?B?K09Wc0s3amNRUUtLczRFbFB0QzZKN0tYOWtxSExGbllzSjhKck02Nmo4bndz?=
 =?utf-8?B?T0VUSU5WRG1rWGdheHN4R2QyRElZRm1UaG9EUTNoeGw0Q1FKOGVyY1cyNXdw?=
 =?utf-8?B?QitZdjRQQW9mZ3F1N2YzQ2V0Zk1lU2VHelZzV1diYmF4V28wOG5qZmxtYWlV?=
 =?utf-8?B?Q2RyZ3hFNzdKNG1RWi92THZweTlBQTQ4L3B5SEZ5a0tzTk9pTnAxRW5BckI5?=
 =?utf-8?B?Z1BvRnlkbXVvalIxc0ZFNWVUcGJUUDZBc0hMWHlObFBDRUFsVXlpbUx0ZmZ3?=
 =?utf-8?B?RS9WN2FiQXdlTFl0WUhaMWVGTzJiOVVuY1ZnbXNJdFcrSGZGRGJneXo4SjZI?=
 =?utf-8?B?OWhQNjg3RjdqQ2NvWkdHSmpCbGhoTSsyL24vamVaYXEwMHNINTVOcmExclF2?=
 =?utf-8?B?TkVJSXNRTDQ5UjRPaDlTWWFwRnU3TUlpUC8zaG9UWmUrQ2QvYkJ4U1NENnhQ?=
 =?utf-8?B?eTR1RXEvbG1iU0dzZFJSOHRiTHNjSnJsZFZ0KzRnd2dndGhiNFEzRHhmZzkx?=
 =?utf-8?B?aFdUa0psKzZ2c3pMZEl3enBEM003Tjl0bUpUQUZsRkZqU1lFL1h5VDBSbnd1?=
 =?utf-8?B?Mi9EcktDTTQ5eGlRTWxQUnk1L1h6N1dkVjRVSmwxK3owUkFTRlNtYzRxcXNr?=
 =?utf-8?B?cmRhYU5HR0R1VVBkZHhsbUV5QnJrUW9heDJVUnN3SFpJTlMvWXZEZmRHdzlE?=
 =?utf-8?B?dVpXZ3hNQzhvb3FBODFrcHNVTVFvNUVnU000RXcraWFtZ0NneUFSM0ZqSGlC?=
 =?utf-8?B?N3lOSzhTYVpndDgwd3U5amRhL1dnMDh1RDlHTUR5Z3RWNDhvR1ZZYnd1RE5P?=
 =?utf-8?B?VGh6T0hxTVJyU0E1KzYrVHBVaFcvSXFTR3N5Zmtqa25jdmVsZ0kvY213V2dG?=
 =?utf-8?Q?XbFAqF6a3vabdqTnQpttHFELvaFmdK/s2RvHB?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d1c90ed-5e46-4fa9-ef24-08da4b2c0924
X-MS-Exchange-CrossTenant-AuthSource: BN7PR10MB2659.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2022 21:56:13.1656
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FxU1E+KjBkwdSLtMS5Eqqir0vGhxNcn33SnePkFruX5zkUnvfuLqNGXAqJlDVkrZiPFY7PcwSg6MgUl9Xy7U4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1887
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517,18.0.874
 definitions=2022-06-10_09:2022-06-09,2022-06-10 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 bulkscore=0
 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206100082
X-Proofpoint-GUID: X_VrRHmM9J-mUPYgf3I4FFxvCnOFl0Og
X-Proofpoint-ORIG-GUID: X_VrRHmM9J-mUPYgf3I4FFxvCnOFl0Og
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
Cc: jgross@suse.com, dave.hansen@linux.intel.com, mst@redhat.com, konrad.wilk@oracle.com, jasowang@redhat.com, x86@kernel.org, joe.jin@oracle.com, linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org, iommu@lists.linux-foundation.org, mingo@redhat.com, bp@alien8.de, sstabellini@kernel.org, xen-devel@lists.xenproject.org, tglx@linutronix.de, linuxppc-dev@lists.ozlabs.org, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christoph,

On 6/8/22 10:05 PM, Christoph Hellwig wrote:
> All this really needs to be hidden under the hood.
> 

Since this patch file has 200+ lines, would you please help clarify what does
'this' indicate?

The idea of this patch:

1. Convert the functions to initialize swiotlb into callee. The callee accepts
'true' or 'false' as arguments to indicate whether it is for default or new
swiotlb buffer, e.g., swiotlb_init_remap() into __swiotlb_init_remap().

2. At the caller side to decide if we are going to call the callee to create the
extra buffer.

Do you mean the callee if still *too high level* and all the
decision/allocation/initialization should be down at *lower level functions*?

E.g., if I re-work the "struct io_tlb_mem" to make the 64-bit buffer as the 2nd
array of io_tlb_mem->slots[32_or_64][index], the user will only notice it is the
default 'io_tlb_default_mem', but will not be able to know if it is allocated
from 32-bit or 64-bit buffer.

Thank you very much for the feedback.

Dongli Zhang
