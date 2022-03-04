Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AD55C4CDB0D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Mar 2022 18:37:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K9FRn4rtmz30Ks
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Mar 2022 04:37:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=e1FmGaKb;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=NnBzQt7i;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=205.220.165.32;
 helo=mx0a-00069f02.pphosted.com; envelope-from=boris.ostrovsky@oracle.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2021-07-09 header.b=e1FmGaKb; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=NnBzQt7i; dkim-atps=neutral
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K9FQv6CF3z2yLg
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Mar 2022 04:36:50 +1100 (AEDT)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 224HD9QD009041; 
 Fri, 4 Mar 2022 17:36:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=8uDqCUNhTviB4mhiyVPkrrcvb7ikd/TcQJ7W18h5qzQ=;
 b=e1FmGaKbZATpdIe3v+TJm5KR4vqL7EQoIJpHNUwV+M0kCP7IiPQ5XL3mYnKsXW//Yyg3
 l0AjseHHqUl8OWn2ILV6UCW0r1Onk5hCHNQVuc2CdbBu1n5/SbD4C+DIXgq4NRujUsaw
 hGvTbxtthDSR9Gj8FzRuIZivKUTZOXMOLB3fOEsGmasQJu05visKti+IqL+GrE6gkSy5
 JA5uYoiRvP0ccIOOgyrKAlGkYjSw9dIqFr9usEu6ITU6kWUiyv9rrsKruZb7jr2JQcvm
 rDiZEraGKeeAQ3WZsd2h9i4WZFBG0TeVku9CR3dK4J4tRhSoqxb0OowP4bs4PrgJ5z8K gg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ek4hv2c2a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 04 Mar 2022 17:36:27 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 224HW9Vu196350;
 Fri, 4 Mar 2022 17:36:25 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2040.outbound.protection.outlook.com [104.47.73.40])
 by userp3030.oracle.com with ESMTP id 3ek4juj0vq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 04 Mar 2022 17:36:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PtKCDmlz24K1BNOjrslp07cPDZKhRaJ3EwRT5o9PzUHYh3ChFUAI44wa6bV1m2pp/OcdeCsFSwy9uuDNjtuQ0PiHxiqPCo1BFfr2wp0a5DyNJsjLh7knL2/sqhB4iqqvbARoIQAjOUcXSgY+wdE7LxFfiehRBd9IuZePcyUNe/43BPxTgnbS0S+L6Wx8wXs03DrFlFg7qHSzklQqkLSMq0GOnyCzsN0XNlrCSamFdcx64BbU5gzOwJqjtcrecvzQctZAmERB3sFJBPu74lMpePVXQQ3bW0+oPz2VECbOocSpoXMqICC4UbUTOoRBrpE/TW/3S/vKHU7lN4cJgERufA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8uDqCUNhTviB4mhiyVPkrrcvb7ikd/TcQJ7W18h5qzQ=;
 b=NZQmAyO+pnCdswTpCTkXwlbs2UfaG3nVFGjFzHXrPBcPrYnYrouE7Fkaw4JHFczbdzmNwWpOoim/79VvhQ3eSx67k3aikPl2DtKcCEMIrGVoRA/gPZ8L3aoklxrlb+I/jwtHq1QjQrAocMP8SbT70q1eMI8U+h5PcVt+yi/HVKK6/o4D1vgVCsKYhhnLOH3Dcnca1tapTeq6jrBl9S0fC7uc50RlJIS330KBCgjjIP5FbBaMXRPmqbLRXBSBMtv1e2g7q7lIGWQKdi4OCQJbi71HALjUc+GV4L9jF4WAYYg1tpiELatamR1YcL7S7ee7EKNOII4blSVjmsku8rR4yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8uDqCUNhTviB4mhiyVPkrrcvb7ikd/TcQJ7W18h5qzQ=;
 b=NnBzQt7imRTHEphuBC6woD/cADs09z/aaC1r+Y3jg/g5qsbrm3aPy4GokflAao62PpIuAw09SvbGeEQTqcl0bxaM8QC8YH7R/mNV5fuVtu7g4380Mt+drmSoWP4+0vJq+U9eXaU9rynCa9+aSjQcmprrqRuxXGdbTLguLyUUj0E=
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by CY4PR10MB1285.namprd10.prod.outlook.com (2603:10b6:903:2a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.17; Fri, 4 Mar
 2022 17:36:23 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::6d20:6694:a16:56f7]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::6d20:6694:a16:56f7%3]) with mapi id 15.20.5038.017; Fri, 4 Mar 2022
 17:36:23 +0000
Message-ID: <fc3992a8-896b-f0fc-e500-9010ec085c57@oracle.com>
Date: Fri, 4 Mar 2022 12:36:17 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH 11/12] swiotlb: merge swiotlb-xen initialization into
 swiotlb
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>
References: <20220301105311.885699-1-hch@lst.de>
 <20220301105311.885699-12-hch@lst.de>
 <alpine.DEB.2.22.394.2203011720150.3261@ubuntu-linux-20-04-desktop>
 <ca748512-12bb-7d75-13f1-8d5ec9703e26@oracle.com>
 <20220304172859.GA12860@lst.de>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
In-Reply-To: <20220304172859.GA12860@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN4PR0501CA0134.namprd05.prod.outlook.com
 (2603:10b6:803:2c::12) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7e7187f7-d4db-4948-94b2-08d9fe05803a
X-MS-TrafficTypeDiagnostic: CY4PR10MB1285:EE_
X-Microsoft-Antispam-PRVS: <CY4PR10MB1285ADD3FBA21F562F3E40038A059@CY4PR10MB1285.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MH3gkrhXX4IxX/Fa3hOgBKf0Zvz+HsmF5ZwwSvLKXuELIqo86AvI352uGtwZh1TrVNndCGJHMKLheXcnQoIOs/cvDtLih/a773HcxV3p4M5IOFH3Sezg0DlC3bsoU1q3ydeS1ydk8wQHMerkG3T93iQnWNwXT7qxdsCvdL/xIhWhQTY/w/ZzsIZdv1nXbVIwhXrug35+5OaMMFoUvtfR0ingL4zXzFEAlUbT4uon8Lp7sfVpuu/dX439KOddkw7uw5zPJJdR+lyIFneC4dBz/OtmqT/UpcFbgre0r8Jj2AnuQjDbAfiUlMFO3mOUPlkxAaOOZFH3jOyNPr8+krZesioPSh88kXIEu7bxR0w3EhT85ZDg80XZNa6P+2hYJj+75XDy+C1i7g5QjNxKXVTcNfm+MwrgFX0sFc1XXe4+LahnikuJXcCZTfU8+4moi7LCDzrCFZJ0mLSpgSbijtbR+KSCGaPIzRyvUc2X/0eDPGeKMIoPPR/DtrFr8WXfGbNxZZO+fqc+QvNyn05DwkfghcrSy6LbfC4K0JmpMJf/F4YRn+n9ANZLaW5AX9mc1HtkeZQRgHca4nxxLGgfBIVbkyjcNEJ96UHsc98daKO10ykLGvxwej2wmINDXtqRZSvMzb4RL6NomlC6iXVQImGR9M4NHno+pHaaxb9Pvsgr+eMHkU6BE+hfsuIl85aZ4O0ezOh6ibb6UhktE6lyytmPgC0acl7WxHKlZGJ0YA6tQKyeZs6fJbCAZ1Xt0wiwB76T
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB5009.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(5660300002)(508600001)(36756003)(26005)(31696002)(186003)(2616005)(7416002)(2906002)(6486002)(38100700002)(31686004)(66946007)(86362001)(4326008)(66556008)(66476007)(8676002)(316002)(54906003)(6506007)(6512007)(6666004)(6916009)(53546011)(44832011)(8936002)(4744005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2lYd0x1dnpWNTVQUExqSWFzLzhteS9rQndBeG9IeXBXNENMaTNhTStLeUhL?=
 =?utf-8?B?UUk3ekxzQkw2ajh6Q0JrWHNiNGJ6MHh6Mkh3OVhET25pdUdBbXU5aVpobzln?=
 =?utf-8?B?REN3dFJwOWsvZFc1dU84L2VXME4xUSsrVlFKbUFqRnBvKzVSZ1lJTEZjUDd4?=
 =?utf-8?B?Q1NDc2pjaG9OcVc2SmNxME5qelJ3UEF3SzZKQW5DMkdybmNJOWU0TDhmMlJJ?=
 =?utf-8?B?ME91aldQVXJKcmcweDJJVEkvcnYxdHJET0g5NXhRMDFQTU9HSjNIaUpaMFQ0?=
 =?utf-8?B?RUg5bEptL2w1T3E4dENQbHdHWk03eGxJK2kvbG9yT0Q3K0o0dWpDL3pqOEN5?=
 =?utf-8?B?MUo0N21lNFVOV1FEdU5yaDRuSVJHREZpdjNDc2xTTGdhdnk1THlPOEhNczJ5?=
 =?utf-8?B?K2xGUTdnRTdnZzVIOW1nUGpuOFpzQ3pQdTAzdFRibHhtWGNVOFBpVlVIeVFN?=
 =?utf-8?B?VWNpenNjUFdMbW12ZjlDVSt1MUsycWxGUkQ3WXRTeVB6dll1THd2RHU1SzFD?=
 =?utf-8?B?UXR3aWVDN0szUzF6SWs0K2c1SEVjNTZxRjR1UFVnS2NxL0NsRmpRL0ZtZ2dW?=
 =?utf-8?B?VEpTUVp0U2t0ZVFydjhXczIreGFZRHFQV3lWdWo2Mk9nR3daSDZzTExpMXFT?=
 =?utf-8?B?eFZwdDJyTUd4WGp2bTUrVy9kRHdOdEQ2aGVSTU52Tnl5aDVud2tLalp2S3RE?=
 =?utf-8?B?S1V0eDVUY0hna1pjampQZEZoS2Fnc3BHVlFWdkZTZVNqUVVPSWE0a3ZyZHF1?=
 =?utf-8?B?QXlyVGhEU3Z2WXVqVDBWclpDbDFnWnB2cGx0M1J3bUhFYThneDVpbzE4c0Zy?=
 =?utf-8?B?VG5QMmxRTzk3Z2dJSzhRUDkrU3dEbU1MS2pZaHVoMUs0bHVvUWFNdDRDQVc3?=
 =?utf-8?B?aWMybHZaUWd5R3dEMDh3V2xmSDhIcTZMc1FQSzN3NlQ4cEVmTnZQMGprbEZv?=
 =?utf-8?B?algxQU5scEN5Y1lrdTVKcDFtb1pRQnRlbnFwTURGNFlDSGlhbVpTVzdsNklu?=
 =?utf-8?B?WXZBeHFuUlNEY1ZreEd6ZzluLy9yeWcxSDNKRlRzdkpTRk9hNCtjUlVtQ1VZ?=
 =?utf-8?B?WHFKTXhiVDFyUE95ZG9SREdnbXQ0SjFpK0ltYkZlcWJqekFvTUtQcGJiUlJV?=
 =?utf-8?B?eS83c3FHckdXTTducTJ3eVAxRU9pUHhYMlNwd1laaDhyVlk2YWI0eHdKL01t?=
 =?utf-8?B?MkdiWkVRNmk2ZFhyM05pemlCelZ3bmQzeU5UTExtdllHK0JtN3JPK21iTXlG?=
 =?utf-8?B?MHZKWkErQVFDUmV4bmJTM2toeTloNUdySnNiS0ZBOStYRUNwZ3BsN1Jscmxw?=
 =?utf-8?B?WHlVL29sdDFoUjJGWHk0RmtiSWpmQjJkVFdvZHZqT0NiaFduOTUwZ0NQb3VX?=
 =?utf-8?B?NmVlYmZLQzEwdldnTEJ4RFdjd08yT1IrQXpkdHhNQkIzcjlBbytIYzVkYm1Y?=
 =?utf-8?B?djFTSjRhQzhtZXhHbTJ3bmRaRkg2cjlxUms2Q1VuZm1USldwSi82dE9GYlpL?=
 =?utf-8?B?M2xuQWt3aHZiQjdZbklHNTdtdlhKM05iOXBXOGVLWk84YUhLMHN2UzhzcElB?=
 =?utf-8?B?U2h2NXovRTdEZ3RzTXNSQk5kYTZyQm9XQ1JoVEk4TDRPK0x4b0F2VHdSd2l6?=
 =?utf-8?B?WDhCRVg1ZXhSTWF3dk5DRkZFQmJmVFl4MlFzeHVSZTNwTnkrSm9XRXd0dzll?=
 =?utf-8?B?Rmduc0M3NEhMUVpTWUllSEpxaGRVbWJ3bld6YkhuWlVYNzFkMy80ZHFFanpM?=
 =?utf-8?B?KzZ6MzhCLzNTU1ZlTWlkbTJ2TFY5VlhhK0tlbVNZMFhwck1YaG5md255bGlj?=
 =?utf-8?B?MDVDREdWdW5UOGVSU2MrbC9tczF6bUowVENRV012YUhUaEpuRnhJTlJ3SVE2?=
 =?utf-8?B?OGhWQUZWYXNlTkpSQXdTSDRmT3V6SHE1MDlvUUY0SDdDOEdCb1hQY3BKeitF?=
 =?utf-8?B?NlNzdVAwcENPcUFwd3FiWXJPWFZKMERyTGFOMHE4azBLaTVPaCtTRHgvdXBo?=
 =?utf-8?B?dERkVTRkS3lZYTNzKzVVSzlpWWJ4eDdhQytPZGQvaHg4U3g3VWlMczZkMndi?=
 =?utf-8?B?bkNpZWp1eHJWb0phNkxJYlZraGE5TWI0U3FETlpQMkpCRDVOZDZDeXJxUHIr?=
 =?utf-8?B?ZG83cjlDVDhqTGRiUnV4UmNpNjFpT1praGVZSHZ6bVo4QkhMQ0c5KzZvQzQz?=
 =?utf-8?B?bUlRYjBSOG9hUndkUSt2dCtBYm44QVRlNElqU2VrRE9INWs0ZzV2aFh1VVlK?=
 =?utf-8?Q?52r73YbfsAMeV2/9C16damm+jYZr8KlJC72T56dDHA=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e7187f7-d4db-4948-94b2-08d9fe05803a
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2022 17:36:23.0812 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1YVb7NxWLJoThYJHosOYKO8D8ONaG67SC76V75LqbIWMc95M7KdQvRJJRh8FROXLz83NsdgApeiLB4kiNe//Fkv1iPblNdZBc5nBq6q2QYI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR10MB1285
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10276
 signatures=690470
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 adultscore=0
 suspectscore=0 mlxlogscore=901 malwarescore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203040088
X-Proofpoint-GUID: kizS7Ryb1NSRvb55A1Pvqpf1wnjNU6K5
X-Proofpoint-ORIG-GUID: kizS7Ryb1NSRvb55A1Pvqpf1wnjNU6K5
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
 x86@kernel.org, linux-mips@vger.kernel.org, tboot-devel@lists.sourceforge.net,
 linuxppc-dev@lists.ozlabs.org, iommu@lists.linux-foundation.org,
 linux-hyperv@vger.kernel.org, linux-pci@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-riscv@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 3/4/22 12:28 PM, Christoph Hellwig wrote:
> On Wed, Mar 02, 2022 at 08:15:03AM -0500, Boris Ostrovsky wrote:
>> Not for me, I fail to boot with
>>
>> [   52.202000] bnxt_en 0000:31:00.0: swiotlb buffer is full (sz: 256 bytes), total 0 (slots), used 0 (slots)
>>
>> (this is iscsi root so I need the NIC).
>>
>>
>> I bisected it to "x86: remove the IOMMU table infrastructure" but haven't actually looked at the code yet.
> That looks like the swiotlb buffer did not get initialized at all, but I
> can't really explain why.
>
> Can you stick in a printk and see if xen_swiotlb_init_early gets called
> at all?



Actually, that's the only thing I did do so far and yes, it does get called.


-boris

