Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C208052079B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 00:27:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kxwlg57nmz3c94
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 08:27:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=jOEWiTfg;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=Os744Cd2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=205.220.177.32;
 helo=mx0b-00069f02.pphosted.com; envelope-from=mike.kravetz@oracle.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2021-07-09 header.b=jOEWiTfg; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=Os744Cd2; dkim-atps=neutral
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kxwkv1ZQdz2yHp
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 May 2022 08:26:45 +1000 (AEST)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 249Jv9bE024483;
 Mon, 9 May 2022 22:26:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=Gr+MlNTbqPHQffrlEBXcP72frYYZ2qVaGOFnR02GtgE=;
 b=jOEWiTfgXCf2fa4sSyTrdfmNgXdISevyBfqZqSJV34Xtr30MkoxGTrI83orrmHEH62ws
 5ZmWrcHZFjMQAmIeG0C/VqmbV15Wddax9t3/TRLtEHMQANtEsaENSfph/vFizBRhLMJw
 KvOTct5+ebqPKzYEBUxyVfiFHS2jfrahuIdszFkpoH8zBOp9YwAV2rGGFvx+cbCh95kb
 z64Ykhqd2xbMI9Ka5hXGNccuw98kJA9O8KExY8L3QS5fjmGYXr8c7ikSQCtKmKx+YUjI
 d6rjX/djYtgxsTosZpd2oFFWDjUF/00iKCFyRT6elugcj9BC+ojFi18OBD8NvYqlsqGo YQ== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fwfj2d3bp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 09 May 2022 22:26:04 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 249MLbj6037514; Mon, 9 May 2022 22:26:03 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3fwf729q35-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 09 May 2022 22:26:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FE9DJtKvWupr5/VtWd8eLDUg1WepJSN0Lc4lDgUDv/2d19+09p5Rb7jeTcryM8Bb8ePms6uPvLTq63ls4atOsjSibJjqF+HwdNE26KKNzbBQ0ipA7vmSoxppfA471zPen3O6KhCbs+pSg/MXZ7WCw/puY1tFTUUanubyaVLrTYv60asy4STE5iQKTTMQ6SZP2oz8cnYbPnePur6cVCUkYaf+0eNygSRJ86SBQGhE/tQ3meu7oI/tiXRflORFBrPePhpfzihNA3DadUidMekkQzZUUmi4+OPck19dVd6YDrTzNX5Eoj7PtXyNwYexkfGXr9okJamkzZokktFXzdnuPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gr+MlNTbqPHQffrlEBXcP72frYYZ2qVaGOFnR02GtgE=;
 b=aDTQ/yhfa787muyVQEzaEenWFRsvh+RLdokj2CKjVkrVHraaKfWUzo39AI3MsIs5LBcRDVDiXG6R5YqzuYp7nS1+0SxauwyX05vioVpbFuTPBGZy+BkSPEDW8QnXqVKMKlV9X1vVYxsWeG6ofuollCUUu1z5VskwYBfoGAxGaspTNOU5bAS4pnoKZ0B5pYKquwvqMx4VeiTYobTZhD5TN38cQQcHlfILla1fB0wlHFb12jMsv1u4qVh1Ky2ronLR1tu7y7ZKtaaFIhQsXxlfLZfdlcQ0yK1HNlu+sz68dfolrU/cLb4WMU0w7ppPtnLyOswz4vP0oveW+YuPbOrGQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gr+MlNTbqPHQffrlEBXcP72frYYZ2qVaGOFnR02GtgE=;
 b=Os744Cd2BNX7bZoqFdft8Qgjfasy9IsS52JRQvztp2+7yrSuy/wyZmiJT3AQCXBEDLfwA1uyHJBvnC1m2tmrCpD53V1J8nffBhT4Ra9xEMcXbcEp/85sWKvN0z6YNN+0Rjc0fyRtQd4Srnyhm94SCdDqCnaO6LeUbZu1lcLf6zE=
Received: from BY5PR10MB4196.namprd10.prod.outlook.com (2603:10b6:a03:20d::23)
 by BN6PR10MB1601.namprd10.prod.outlook.com (2603:10b6:405:11::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.20; Mon, 9 May
 2022 22:26:00 +0000
Received: from BY5PR10MB4196.namprd10.prod.outlook.com
 ([fe80::9d76:7926:9b76:f461]) by BY5PR10MB4196.namprd10.prod.outlook.com
 ([fe80::9d76:7926:9b76:f461%9]) with mapi id 15.20.5227.023; Mon, 9 May 2022
 22:26:00 +0000
Message-ID: <918c0479-4d1a-3f3c-346c-051de4b26d30@oracle.com>
Date: Mon, 9 May 2022 15:25:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 3/3] mm: rmap: Fix CONT-PTE/PMD size hugetlb issue when
 unmapping
Content-Language: en-US
To: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org,
 catalin.marinas@arm.com, will@kernel.org
References: <cover.1652002221.git.baolin.wang@linux.alibaba.com>
 <43b11b69e9f0d9d7e7960b86661db27cc404d0c7.1652002221.git.baolin.wang@linux.alibaba.com>
From: Mike Kravetz <mike.kravetz@oracle.com>
In-Reply-To: <43b11b69e9f0d9d7e7960b86661db27cc404d0c7.1652002221.git.baolin.wang@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P222CA0011.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::16) To BY5PR10MB4196.namprd10.prod.outlook.com
 (2603:10b6:a03:20d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 20886a61-503c-4e02-16f5-08da320ae523
X-MS-TrafficTypeDiagnostic: BN6PR10MB1601:EE_
X-Microsoft-Antispam-PRVS: <BN6PR10MB16017E5F4163DE6E647E6E3FE2C69@BN6PR10MB1601.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HPzzybCLniKTrc5GfXOa0MvZvpM0HX6TQ5TzLHn1n9F75bDjY58GQ92mm6jMJIqpObslo3d8qaFtmD1CAmu4Oh1hHf1xzbxDUR+UCy+yIbbLiv4Xnx3dvem4pkkapbvhb0UxW3qWM0NAjs37zOTHwA5ljJVvEgMIO4HE+BeEmwYgD7AodLxOxAtW4ngyMuLaTP5zvaZbsil5mbQj06ykrDPSderu7E1XA8k5ioHSKT4G0MzFYGwrIRUJfcQY0qPCdd4WNqj+VSE7Mm+CD4rTVgWQQFoXuDFrX2MD6ZLsu39LwezWd8RS8Nix1mfRpNpWfdc3hwGES4SxpNFQlOxa6GtEmSnEGuNjL1H8Kl9fFxgkWuiftMDSDh5wIWJKaOWW8RG5cSbFLxa8MLedR5FqspQcziAyt6AGK32YRpOhQ1lUpNfguxC/poBAWv7l62bso0FAYT35LxDpAMraR2PVbXC/L0UgER7jsKBreAcFH6LJ6y8NUj+xYCoEytMmrUC4w6Ug3YROynE5Zx6lk/AiosQj+4bz5IzPI6YNgm+8HjG3mARpuVm0e+TfWcTDse7EOpfMHWckAQ1Tsf7zMUUzSleUmE//WJ98qbf2B8rYS8bnidBZny4kq6GY2LFr2Srivq2WPmrYDulBrA/qhCR3JRKPHLvRZjZmyP+pJhsRZQ9o68WX5hJxCpegsl/OgGVN9oKdRVId+U45hXmqWtLhXPJ7CuoUFCnQbcnfR3+bdF0x/5SIiLfhtjP4Kasz+iel8i7rfMv1bT5AcpGJUcwWBw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR10MB4196.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2616005)(66556008)(66946007)(31696002)(8936002)(66476007)(8676002)(4326008)(316002)(86362001)(53546011)(6666004)(6512007)(6506007)(52116002)(26005)(508600001)(38350700002)(6486002)(38100700002)(2906002)(36756003)(31686004)(83380400001)(5660300002)(7406005)(7416002)(44832011)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Uyt6clI4NmdNQlpYc3J5R1NZYWwzcmwwc3A4TEl5V2VqZ3ZkNjJ4UmJoZGVv?=
 =?utf-8?B?K0pVaHhvbnlOVFN5Z0hPY1BLTit4REZRNHlsdTZPS0FpTUZGVVVDNEkybzdB?=
 =?utf-8?B?d2hCei9PWGY3WjkwOXdvOCtZTVBiVGtheXIxemdDaTROYjV3TnVBb0Q5Z3BL?=
 =?utf-8?B?L0ZqRStDYmFtNWZoY2w5cno5SC9mSS8zT0c3UWJhSGpLcGxaWFR4NHVEV1I1?=
 =?utf-8?B?azFiNWRQMnUwM0ZDdktzM3VMQ2JpajRJdzJwN3VrWVlXUkorNzZYR1FiZlJM?=
 =?utf-8?B?d0JmVnNGdDVSL01BUXdTaXpDQTVzcFNCRTRvbE1Wb2lXeVVjRDFUaStnTnR1?=
 =?utf-8?B?Zm9FQjZGREFraGZCWVBCM0xtdkNXbStwSVlQVmJ0YjRsOVhjV0tweGUzUGYy?=
 =?utf-8?B?dVpFS0NMaHM4RExUZ3dIZktNUFNqQ0RVQXRXMVkyL1JDbE1yUXE3SjRFb241?=
 =?utf-8?B?RXQyUU1Tc2ZBK2huWXVQM205OE03cU9hWU1jMHE4UGVsQXBOZjB6YnVrekxJ?=
 =?utf-8?B?NDVtODdzbWJ5YXEvWDNYcEpiOVc1WXNKU29NcDBiWllxVkE3Uk9ZY3BsTFBM?=
 =?utf-8?B?YkY3ZUZheHZVS1lQMUN1eGtzaGtXYUdwMTZpdDBSWm1rUXh5ajdFTklMYjJs?=
 =?utf-8?B?ZHdjSStkRGV1Mm9iTlBZUk0xR21zb2RWTThibWxNSWI4Z3A5MkovYTBrOEZK?=
 =?utf-8?B?Q0xTRkM0MStCQm5KUmE5bzQxcVJYcC9IVWlvMVNBeVk1c1NCcWxhQ0o1M0xl?=
 =?utf-8?B?WDFBOUNybEpaOGlUWG5EQmM5YlZkaVpGaFhUbE01ZGRHakdhRm80eFEwU0wz?=
 =?utf-8?B?ZmVlQTZTSUNrZGF4RkpuTE91bFN5ejd1bU1RbU83WFg3SWRVR2M4WTNGUTEr?=
 =?utf-8?B?NFFaUFdBR0V3d1RMWG0rMFR3bWZXK0xUYjRCazlTVVVxWVNxRURUUnljTlJU?=
 =?utf-8?B?MEprU01OSWQxT1A5dEp0bUEyTmVjZndrYlNlTUZnK01MeXIwSm5tL3NoUlFa?=
 =?utf-8?B?RUVCZHJjL0VUL1AxckIxSlViVEpSU1prOVlGczR0OUliYUxSdXAyNCtsU1pZ?=
 =?utf-8?B?ckVWV2xLRUZFU3Frc0NZeWk4b2hhdzlyZk9HMzRFdE80SVI5VEdLYlVpekJ1?=
 =?utf-8?B?Z0I4MXIxTXVva1NhRlpIcjRXSmw5V3JMWUpFUjZvblRJRGFsc0NUdU9MWnU0?=
 =?utf-8?B?WVRHZFUwSkxvajUvbWVSQ01LQTZrZlVCQnRJbnhoeUlIb0ZJd0NxTUtYM2xY?=
 =?utf-8?B?TjJpbml5cTV2RDRBSW00R3lUQVZkZWNJZ0ovUGY0Q0FUTGJuVVZGWDJjVHdP?=
 =?utf-8?B?eDZneWNIMUx6Ry90cXJpY2lXdlhpWG9hbHdEaTlWWnJPbG9wQTV1VEZxYTYz?=
 =?utf-8?B?Q3dhWVZIVHh6SEhCblhCTjFkVlRjWW9VSGJ2RE1CUVRKcXJ4MWk0UWJScW1t?=
 =?utf-8?B?ZCtxcFFrYWFiaVpPVytBZ2k4K2JQZTE1dXU3Z05TaGVodzdka09uZ3FLNGYy?=
 =?utf-8?B?clhFYUN3Y08vVUhtakhocjJMbmNWNFEwVWZQSzI5MDlXVE10V3Zyd0ZUUTlT?=
 =?utf-8?B?MFgxa2x6VzBDZGxWMkVnc2NKbXYzaHFuWS9xejVPV1VvUVlvaUJ5a0FUdVpv?=
 =?utf-8?B?WUlndFZsekY1Q3h6bW50QVRPV0ZITzhLUk1laFdVVGhYdjdPTnA0clF0WkZX?=
 =?utf-8?B?NXR4RTF5ZFpkMHROU2NsV29hS2tBMWJramlqSDVoak5jenhmOXZkem9CdUQ2?=
 =?utf-8?B?RGZuc0lJNnBFUnF5blVCeURDcmVwTzU3ekFWRnowOEZxdDlYYWV0SC9mOHlm?=
 =?utf-8?B?UlJLNkVTYnA5Uzk2M2VqbDg2Ni9paEQzZUZFaThUdkZEY3NrMnEwYmQ5R05w?=
 =?utf-8?B?Z3ZvSXFtcE9DOGZsMFRxT0J1L1VoQnJ3Y20rd2pNZjlPZ1lJWXZSTWRwTkFy?=
 =?utf-8?B?MUR5VHZrYStJNnd3d3pEWjArSFlVcE9Bd1hXckNwclVNSzBBTGhRNnZrNEZw?=
 =?utf-8?B?YU5IVVJOck1jbXlBbjB5WGlXTU10R0QxSkJQelB3VTBNcHFRdGRUeS8wOU4w?=
 =?utf-8?B?TnZwZWNqRkhkSjVTMWxzTnZORXVhU2QxODNucGp6TGg0Q1F1SVlVSU1IQWhp?=
 =?utf-8?B?NUtyeGJLZzE4U2FFZDNmSlNQMjdTS2pTcDhZMmFOeW1HL21kdHl3YnFKOGNT?=
 =?utf-8?B?a1FzRy9ya1pCcDFSTXMvR01ZNTlja0p4Z0JySmU1SXN6NG9jWCtvRzRvS2Jy?=
 =?utf-8?B?dUtmTWk3YWJQK1dKSGhXYk5HT0hTM3FJQkw2L2ZNV292endObk80VTBjZFVl?=
 =?utf-8?B?MTUxNmRaNkx3WnhQQjU5MDZOczVyRUFJWkxoMXRsOGpxQk4wQ0xlU3pPc2N5?=
 =?utf-8?Q?f3afW6e3J7BW4Yrw=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20886a61-503c-4e02-16f5-08da320ae523
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB4196.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2022 22:26:00.5127 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: At4OBimoywK1N0GB8TEoTF/DQsJFGFDsPZP02jh5uZkHefjoQe5sxE5b/YG8Y35obKiQ2WbL/G7cwqm+PDSg/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR10MB1601
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-09_06:2022-05-09,
 2022-05-09 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 malwarescore=0
 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205090110
X-Proofpoint-ORIG-GUID: nQajJNnnSKOEfl5HIz-k2pZLPF8LwQf5
X-Proofpoint-GUID: nQajJNnnSKOEfl5HIz-k2pZLPF8LwQf5
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
Cc: dalias@libc.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-kernel@vger.kernel.org, James.Bottomley@HansenPartnership.com,
 linux-mm@kvack.org, paulus@samba.org, sparclinux@vger.kernel.org,
 agordeev@linux.ibm.com, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 arnd@arndb.de, ysato@users.sourceforge.jp, deller@gmx.de,
 borntraeger@linux.ibm.com, gor@linux.ibm.com, hca@linux.ibm.com,
 linux-arm-kernel@lists.infradead.org, tsbogend@alpha.franken.de,
 linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org, svens@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 5/8/22 02:36, Baolin Wang wrote:
> On some architectures (like ARM64), it can support CONT-PTE/PMD size
> hugetlb, which means it can support not only PMD/PUD size hugetlb:
> 2M and 1G, but also CONT-PTE/PMD size: 64K and 32M if a 4K page
> size specified.
> 
> When unmapping a hugetlb page, we will get the relevant page table
> entry by huge_pte_offset() only once to nuke it. This is correct
> for PMD or PUD size hugetlb, since they always contain only one
> pmd entry or pud entry in the page table.
> 
> However this is incorrect for CONT-PTE and CONT-PMD size hugetlb,
> since they can contain several continuous pte or pmd entry with
> same page table attributes, so we will nuke only one pte or pmd
> entry for this CONT-PTE/PMD size hugetlb page.
> 
> And now try_to_unmap() is only passed a hugetlb page in the case
> where the hugetlb page is poisoned. Which means now we will unmap
> only one pte entry for a CONT-PTE or CONT-PMD size poisoned hugetlb
> page, and we can still access other subpages of a CONT-PTE or CONT-PMD
> size poisoned hugetlb page, which will cause serious issues possibly.
> 
> So we should change to use huge_ptep_clear_flush() to nuke the
> hugetlb page table to fix this issue, which already considered
> CONT-PTE and CONT-PMD size hugetlb.
> 
> We've already used set_huge_swap_pte_at() to set a poisoned
> swap entry for a poisoned hugetlb page. Meanwhile adding a VM_BUG_ON()
> to make sure the passed hugetlb page is poisoned in try_to_unmap().
> 
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> ---
>  mm/rmap.c | 39 ++++++++++++++++++++++-----------------
>  1 file changed, 22 insertions(+), 17 deletions(-)
> 
> diff --git a/mm/rmap.c b/mm/rmap.c
> index 7cf2408..37c8fd2 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -1530,6 +1530,11 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
>  
>  		if (folio_test_hugetlb(folio)) {
>  			/*
> +			 * The try_to_unmap() is only passed a hugetlb page
> +			 * in the case where the hugetlb page is poisoned.
> +			 */
> +			VM_BUG_ON_PAGE(!PageHWPoison(subpage), subpage);
> +			/*

It is unfortunate that this could not easily be added to the first
if (folio_test_hugetlb(folio)) block in this routine.  However, it
is fine to add here.

Looks good.  Thanks for all these changes,

Reviewed-by: Mike Kravetz <mike.kravetz@oracle.com>

-- 
Mike Kravetz
