Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9644D5B7E25
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Sep 2022 03:13:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MS2Ql2JYcz3byL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Sep 2022 11:13:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=umj6RZhp;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=Wzqz31u6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=indu.bhagat@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=umj6RZhp;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=Wzqz31u6;
	dkim-atps=neutral
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MRzJK174tz2xKX
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Sep 2022 08:52:42 +1000 (AEST)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28DM3unc018331;
	Tue, 13 Sep 2022 22:51:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=kZ5m0sZWtCycBZj/M6R0luZFWjrJ8MFEpdNYdWEkm9Q=;
 b=umj6RZhpa4RFplkOTf6DxivFsTTLpPAZKTaUqUlHaVMtIuEL9DWkqKlmgyc5zo7VQ+Py
 2ZdrUqz1zaBuNsHymTX8E63Tctt6mx3bOvSdJNxbaY4NxuErUl8QhuaLCduXu98h8ZTs
 1gqeWnLHZo+swOL2vZrfr0swKhdp7sNGz2MGUwLRca25ifjwysjVT6u6VgensSiIe9CA
 WWlr6Yr8UE45AjsBYb5BDIGRYjSod3FBlF4gOhv9Pq4NH0SWb3mX0CiInPrAPD9YsZR9
 QgKHM83SQNmz0ZVsbBe0FeQAbayVjttjlf+8LjbrayAT/XwcXfsn/r871/Uuz3Ma57N4 /Q== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3jjxyc8kd0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 Sep 2022 22:51:55 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 28DLtd8n023890;
	Tue, 13 Sep 2022 22:51:54 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2104.outbound.protection.outlook.com [104.47.55.104])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3jjyegng5b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 Sep 2022 22:51:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tk2H6jy8gItKbXV2VL37f1UtzBZD2Rhnkd9N8/KZ87mWvpK1qb5z+kXyGVB/7Dvn6Xfc2v2YuPhhDeVRODEQSganGgP9wqMdBdW6L0HV7rbLGRGf2akcCkRPqCyRtDzjhNvuczh4uk6gWtevIHbdSovBrmGSg9a8ZleU4PaWn0ctn9RATyOWL0LovwhrFYCzRk9WS45yuQyMLo0E4/OmIyHCHZOXyozx55IH9+aVdIb+IqCMdeLpCsxThMjaAdtOpcXdURVcQ0H1fTn8lzwAgk9GT8Zh0w1TdEEMJO23TTS+uAGrYADT5pTMmu5hw8UaLNSWHsEpxdfRnpfjI105IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kZ5m0sZWtCycBZj/M6R0luZFWjrJ8MFEpdNYdWEkm9Q=;
 b=H31sqSlX5IQDIDWM9hewdGJ/YGzPwJ6Erqkr6bVMEAPNkcQ4bqkguA6uEcQi1xQweFsWk/UnA3dlcra0oq28kAMDI3HAr6piCzCY38DtfRZLxeEA11vVMuLH5xImzUCT+P+AsHqwJUKVvBUbPkH2CzRjQuWPoztTWw8koyMHTce8l7VASJtZ+lR9Ia2e6CRdIZU/6nyz1GqledzPdUPgBdA26Pbj8cSy4+h/93VDx+fGnkUro8YTsnMBUArCq8j1qZSryECSnLU0wj0labOdT+g84RfJNaKVu9ahUJ7mdltoopJg6bAZ3lkl6WvMXI8jAe1dX/KCjI1CgLqssjNeJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kZ5m0sZWtCycBZj/M6R0luZFWjrJ8MFEpdNYdWEkm9Q=;
 b=Wzqz31u6mb/XdQ/lr3R1HNF4fMlmf4JygzzZ0yOYFfrpFLswC+LGSX3fKm+x7ApCMeLKH4iGEUHnk9ujCC8DRFJsMuWT8ExmqZw7gnuVWzlDhVfOt2s1+vagBuY11pLmd8P0Xd97i6J3xyjVLTUbURWkv7srrIvn6dvuwqwVAGc=
Received: from MWHPR1001MB2158.namprd10.prod.outlook.com
 (2603:10b6:301:2d::17) by PH0PR10MB4598.namprd10.prod.outlook.com
 (2603:10b6:510:34::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12; Tue, 13 Sep
 2022 22:51:52 +0000
Received: from MWHPR1001MB2158.namprd10.prod.outlook.com
 ([fe80::e830:545a:2bf1:28ef]) by MWHPR1001MB2158.namprd10.prod.outlook.com
 ([fe80::e830:545a:2bf1:28ef%7]) with mapi id 15.20.5612.022; Tue, 13 Sep 2022
 22:51:52 +0000
Message-ID: <9f01a8b9-9ec6-6759-ba14-ee529a5b973a@oracle.com>
Date: Tue, 13 Sep 2022 15:51:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [RFC] Objtool toolchain proposal:
 -fannotate-{jump-table,noreturn}
Content-Language: en-US
To: Josh Poimboeuf <jpoimboe@kernel.org>, linux-toolchains@vger.kernel.org
References: <20220909180704.jwwed4zhwvin7uyi@treble>
From: Indu Bhagat <indu.bhagat@oracle.com>
In-Reply-To: <20220909180704.jwwed4zhwvin7uyi@treble>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P123CA0012.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:338::18) To MWHPR1001MB2158.namprd10.prod.outlook.com
 (2603:10b6:301:2d::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2158:EE_|PH0PR10MB4598:EE_
X-MS-Office365-Filtering-Correlation-Id: ee1b1d83-7bd8-42ed-9f5c-08da95da8c75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	YhtG036J/TKiGTga1NRUf8jSGPeGKk8Isr9rVB65CDaOUT9RVVnASMbPh856ijTB9W/JhpB8anC1Yat9B7JAs618EZl1ufdvoe1y3FmLuWNjpeLO/WQnu8PmtybDYCyaXGlJJ8Ti46/0HikYfKP1QTp1QuQH8XSzSG83yFUw6INA7742zsve1+KIle0O7zdU/UK0nCOFWTCoWorz4cT4agHaR9yFDkt53vulhIp6O/gMzoi0PcirMsZzUZBVV3KtY1XR1JnIwyKJ1weKjZOoc1hhpov+NPr34sPpKg9RtR/ViBJqmzy5bnLTCsqllhj1KpONjkd2eliwUis6HgA88Z9B8psM3FLlL44/UgOdjv6htOSfb1K5uW8X3Vc4dCeZD9qttb/E0SdNTNc1mshD7MyOjiNENdnqzEJDLGypJtzYQxS24ungxynGd26fSZGfmkIEwZNK3VxFXzEn6NVu+A2KCNhrBFZvpIA9vaw0c0uQhiMVSJQQwPnidK0LdO71JGX7Q/kTkaN3MgiuIsduVXBQ2yesYlLYYn7WLHg2TDYX2RXzt45r+ECxi0ePPLh0a6ZtsggMwOceV8T6DqZzNKY8OzqyVDH+18BZs9z95G/pTLIoLLELB1arSl5le/zGMoMDPFJA7V2Cj+COLFW/VdHOL24CTA/Tj+mgKc3N39ei0098862rSNOZsCEGz9GCoVBOqYAkK4L4iaZKTqOGKvEY1TBSMPTvm+pvdD+FhtML+lkF0nCHArYbe2V026lAbBhlE0I0iFwCYQzNNxRL7esxU2NH7cKmUMsg0upMvq8=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2158.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(366004)(39860400002)(346002)(396003)(376002)(451199015)(6512007)(186003)(6486002)(26005)(53546011)(83380400001)(6666004)(6506007)(31686004)(8936002)(41300700001)(86362001)(478600001)(66556008)(8676002)(2906002)(2616005)(66946007)(36756003)(38100700002)(54906003)(5660300002)(316002)(44832011)(31696002)(7416002)(4326008)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?WDM5TGRhVy8rc0F2Y2IrU2FvUnErMlJXaXlUMUIzL21RSC9ma2oxbWN6UU5X?=
 =?utf-8?B?RkJHcm4rWHhwd0hiY3RyRGJxQnNocWk0MklVMHl1M2xlWlI5MWNOL3BrdjAr?=
 =?utf-8?B?eVZoaWZRdWtNUjQyN214bytWL2F3b2l6ZHY4M3Jyc2VhMXFDU01HaDBWOEs4?=
 =?utf-8?B?NFIyRmJPN2RneXBQb3JCNjJCc1VkdkFaSENzMDV0bFh0UnRaalBPeTlMNEtG?=
 =?utf-8?B?QlZ1anpBbnpudmJDS091eE5JWVNWVU5WN3VJUDVNWDFCWnF2SGZzOG9KOTJU?=
 =?utf-8?B?eXVrWVlMc1QveStqMXBTZUhCQ3gvUDdYL0padlpsYjhzSU5pT0dKQVhrRVFV?=
 =?utf-8?B?NkthQkVpZUp1OEdNcUxndjF0NUNoVHJCc3BjT0U1SUxURWx4WW0vVHl1cUlT?=
 =?utf-8?B?SU16SnNrQ2d4RUZyOUQxYzdsdTZMM05ZNEMrYnZITGpJV09ZbnRwTU05ak1r?=
 =?utf-8?B?YXRncnJoVmpKc3kzQjZvTStRTGJUdU05ekRHWnlXUjJFTnIwRmZDeVNna29B?=
 =?utf-8?B?TzlqK0RNYiszeWtyTlNMSjhscFVCRjBvdXJEREV6cTZWRks3RE1sdVFYSFRH?=
 =?utf-8?B?b3krODF4d0txckZIajcyL0hjdGgxVkpHcHRRdkhONkdwQjYvNGdzdVFRY0Fn?=
 =?utf-8?B?WkNzNWhVcCs0bDc5ZS9oZThsZkpqZlJaK0hYUHFSekNJNEVDeG8rcUhlMEZE?=
 =?utf-8?B?Sy9zeWE1TC9FU0VrSGJsMDE4bWxwd1g0S0RRZFNnSVc5QVhxNG1ka1E3Vmpj?=
 =?utf-8?B?RkNpZ2tYU2FmSlBLNTdHRVk4U1FGYVVFVjhvaUFTMkRhWCt0OWMxbWRiaDBm?=
 =?utf-8?B?M29YNEpmaU9RcGVOcVhBeG8xU3dMR3lvckhqSzBhN3JnQmlRTnBqa01tUjVz?=
 =?utf-8?B?ODFWTUYyMnVWT2FUbDVObTArOHUvYm52d1ZNNWxJMnRyNjN4N3kyaTVoZmlo?=
 =?utf-8?B?bDVHZlAzNzBtWkVKZjQ3VHc4a0pZVnNvMFI4VEQ2VmVxQ2RibzhjL1VTODlU?=
 =?utf-8?B?YkxVNWtzVnZCYmlMQ0ZBVXNseUpyUmdQTU5LTDROQ1Q3ZnM0OE13TlJwV3pu?=
 =?utf-8?B?bm1MR21ibXFsbklBTjBITG1yQ2J6N3RLY3BQTThOa2FsUzZoQlRPZW1hL1Fy?=
 =?utf-8?B?a3Rjckd3b2V1SDAzcnhYVjBaU0UvcWtWR1U3TllkK0ZKTkhRU1MrTTFqeFZU?=
 =?utf-8?B?ckJlTklaTFVwemZmcWhvSGhPby96bytwN1RKVU9OZFVNSlhPL2VMNmJ4YkFm?=
 =?utf-8?B?aExIU0QwS3ovdndydTRsSFJtbm5aQlo0dWlGWHdhb0h3T1RtMU9nbi8zT3lr?=
 =?utf-8?B?Ti9FS0VNQVFjWFhicVM1UG5mYUF3OHRBQmlieEpWQWw1NnViak1SQ0hiZEU5?=
 =?utf-8?B?VDUrMm1reGVlY28wWFF4bUdKai9uaU5KS1Fvc2JnRFNmOXFFbzBBRmVKRkgz?=
 =?utf-8?B?UlJQbVhla0hYL1JPWkwwMkFOc3lWM0FkVzhJaDNzcFAvNE1aYXRnOWdXMHdF?=
 =?utf-8?B?N0dTZ3BPOGVuZEl1RSt5VzlqY2cxOHp4Y1grY0R1cENOU2IvSnVBS0tqRUZW?=
 =?utf-8?B?VFpVSXpzSmFZL2N5N2hYQ1JRN0M5azFqUHJaN2s0clk2dGorK2lIR2ZDeld0?=
 =?utf-8?B?UG5xYUxXZ3F4TFY0UzBIS2FMQVg5djA0WUZEY1VxK3FXSnU4WXBxY2paR3BL?=
 =?utf-8?B?dzcyVVYrQStHUXB4R2xqbjlKSHl4RUI4QUp5WDNXckxEVXI1dFZ5emdlWktG?=
 =?utf-8?B?QitzSTVyTGViWnEyUWV0aERuN3Awc0dSQ3l6UU5LaU1md080b3VqUVRWczRn?=
 =?utf-8?B?MTh6TVI5and0eld2ZlR2VGpUTWIzMmRaeWlOYllqSWpJaW03T1pxN3FNTW1o?=
 =?utf-8?B?TFdYKzd5MFN2MFQwQ3E5WmNNQy9kQmN3MHU2cWRBVG9ZTEpkcG0rSzZ6SU1F?=
 =?utf-8?B?UjlGaXcyWmYra1hGTSt0ZkdkREpUeDVlRmd6NXdVMVpUSzZ1UkRsV0c0U1lz?=
 =?utf-8?B?WXNiUXJtMnlRWWZONThxYjZCNE1lb1V4OEN4MkthKzFkN1p5Y0NZOXVkR3FP?=
 =?utf-8?B?QUQzYmxBY2xaWmxaTzhLL2lPQzNkcTN6Z2kweVlZNm1RSzkrT05QY2FwMUtN?=
 =?utf-8?B?MVA0Y24wdXpaeVhhaGg4UzVuQXVCelJhYUdBa2JkY1EwcEs0R25RelVDNFhq?=
 =?utf-8?B?dnc9PQ==?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee1b1d83-7bd8-42ed-9f5c-08da95da8c75
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2158.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2022 22:51:52.1086
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4368Vrd2cBJokU/ICfRVxw6IX1NFQrleWT41kjltiyByx0q6RJRCGXpldchzloShsuBm6AZugxcvnBFX2/NGsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4598
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-13_10,2022-09-13_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=993
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2208220000 definitions=main-2209130105
X-Proofpoint-ORIG-GUID: reBbGwAorqAJUrOZj8QMf3XvG7fNBhZd
X-Proofpoint-GUID: reBbGwAorqAJUrOZj8QMf3XvG7fNBhZd
X-Mailman-Approved-At: Wed, 14 Sep 2022 11:12:55 +1000
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
Cc: Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, linuxppc-dev@lists.ozlabs.org, Chen Zhongjin <chenzhongjin@huawei.com>, x86@kernel.org, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, Sathvika Vasireddy <sv@linux.ibm.com>, live-patching@vger.kernel.org, Miroslav Benes <mbenes@suse.cz>, Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org, "Jose E. Marchesi" <jemarch@gnu.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Josh,

On 9/9/22 11:07, Josh Poimboeuf wrote:
> Hi,
> 
> Here's a preview of what I'm planning to discuss at the LPC toolchains
> microconference.  Feel free to start the discussion early :-)
> 
> This is a proposal for some new minor GCC/Clang features which would
> help objtool greatly.
> 
> 
> Background
> ----------
> 
> Objtool is a kernel-specific tool which reverse engineers the control
> flow graph (CFG) of compiled objects.  It then performs various
> validations, annotations, and modifications, mostly with the goal of
> improving robustness and security of the kernel.
> 
> Objtool features which use the CFG include include:
> validation/generation of unwinding metadata; validation of Intel SMAP
> rules; and validation of kernel "noinstr" rules (preventing compiler
> instrumentation in certain critical sections).
> 
> In general it's not feasible for the traditional toolchain to do any of
> this work, because the kernel has a lot of "blind spots" which the
> toolchain doesn't have visibility to, notably asm and inline asm.
> Manual .cfi annotations are very difficult to maintain and even more
> difficult to ensure correctness.  Also, due to kernel live patching, the
> kernel relies on 100% correctness of unwinding metadata, whereas the
> toolchain treats it as a best effort.
> 
> 
> Challenges
> ----------
> 
> Reverse engineering the control flow graph is mostly quite
> straightforward, with two notable exceptions:
> 
> 1) Jump tables (e.g., switch statements):
> 
>     Depending on the architecture, it's somewhere between difficult and
>     impossible to reliabily identify which indirect jumps correspond to
>     jump tables, and what are their corresponding intra-function jump
>     destinations.
> 
> 2) Noreturn functions:
>     
>     There's no reliable way to determine which functions are designated
>     by the compiler to be noreturn (either explictly via function
>     attribute, or implicitly via a static function which is a wrapper
>     around a noreturn function.)  This information is needed because the
>     code after the call to such a function is optimized out as
>     unreachable and objtool has no way of knowing that.
> 
> 

Curious to know what all features of objtool rely on the need to reverse 
engineer the control flow graph. Is it a larger set or it is only for 
ORC generation ?

> Proposal
> --------
> 
> Add the following new compiler flags which create non-allocatable ELF
> sections which "annotate" control flow:
> 
> (Note this is purely hypothetical, intended for starting a discussion.
> I'm not a compiler person and I haven't written any compiler code.)
> 
> 
> 1) -fannotate-jump-table
> 
> Create an .annotate.jump_table section which is an array of the
> following variable-length structure:
> 
>    struct annotate_jump_table {
> 	void *indirect_jmp;
> 	long num_targets;
> 	void *targets[];
>    };
> 
> 
> For example, given the following switch statement code:
> 
>    .Lswitch_jmp:
> 	// %rax is .Lcase_1 or .Lcase_2
> 	jmp %rax
> 
>    .Lcase_1:
> 	...
>    .Lcase_2:
> 	...
> 
> 
> Add the following code:
> 
>    .pushsection .annotate.jump_table
> 	// indirect JMP address
> 	.quad .Lswitch_jmp
> 
> 	// num jump targets
> 	.quad 2
> 
> 	// indirect JMP target addresses
> 	.quad .Lcase_1
> 	.quad .Lcase_2
>    .popsection
> 
> 
> 2) -fannotate-noreturn
> 
> Create an .annotate.noreturn section which is an array of pointers to
> noreturn functions (both explicit/implicit and defined/undefined).
> 
> 
> For example, given the following three noreturn functions:
> 
>    // explicit noreturn:
>    __attribute__((__noreturn__)) void func1(void)
>    {
> 	exit(1);
>    }
> 
>    // explicit noreturn (extern):
>    extern __attribute__((__noreturn__)) void func2(void);
> 
>    // implicit noreturn:
>    static void func3(void)
>    {
>    	// call noreturn function
> 	func2();
>    }
> 
> 
> Add the following code:
> 
>    .pushsection .annotate.noreturn
> 	.quad func1
> 	.quad func2
> 	.quad func3
>    .popsection
> 
> 
> Alternatives
> ------------
> 
> Another idea which has been floated in the past is for objtool to read
> DWARF (or .eh_frame) to help it figure out the control flow.  That
> hasn't been tried yet, but would be considerably more difficult and
> fragile IMO.
> 


