Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 020BB3E9349
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Aug 2021 16:09:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GlBXB65CBz30Lw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Aug 2021 00:09:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=htbBlgVi;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2020-01-29 header.b=y4WCRMVp;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=fUs7Ii9Y;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=205.220.177.32;
 helo=mx0b-00069f02.pphosted.com; envelope-from=boris.ostrovsky@oracle.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2021-07-09 header.b=htbBlgVi; 
 dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=y4WCRMVp; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=fUs7Ii9Y; dkim-atps=neutral
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GlBW53rd6z2y0D
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Aug 2021 00:08:31 +1000 (AEST)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17BE5Zcm014476; Wed, 11 Aug 2021 14:07:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=pOImKLoaG3NEUcdH9TmpuA+OG810TNyWPXJfSzA99yc=;
 b=htbBlgVi1WumoUza2kQJECPUbrc/WQylh7Pk9tDqfA+TZObFnB8uEwbY5bPOcKjtRnmZ
 1IewIkG4FkQ33C+AefGXtQgzS0QV7T9g4o1WawFQwQz7EVsiVtgt7OSVGJGqvDI0XIfy
 90ErAzZlcrhPQTw3zkpidRa3LQyhKDK4e1pAfj/l4xIq0ZH/XdJHuJ1bYlyD8UOHbG46
 ZybVn8J7UlY59PSDfjn7dT8oH+RPntz5qPomqlIwC3FqXYc9SpvGDDg/gKsOlPm3DLHH
 xeTweR/8mL93zhHrGYbMajCj0QvXeaFp/qGlYn8oO+VeoHagomIjSetOJb2P4wL3gCer 4w== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=pOImKLoaG3NEUcdH9TmpuA+OG810TNyWPXJfSzA99yc=;
 b=y4WCRMVpM3TTz7RXs5VCr8US/LYM6OD3o1S4HZOdHfTSOdyXy4FRpy/HKFfHK73NnLEE
 QqtA0IoInjDPB44zxHYGRoEg6JGHcRivpc5zGqlqUPI3wsd98KtFNhF1vLdx673vwC+i
 Xg49g10mWnclkg3GFMPuS3oxNmxlYXqljN4A2bLNWW2rPZEangR7Fo3eQUSXzKbyyxAV
 f8sB+KFUPdmNQ5RkmT71WuPK2WbZ0b8htkuVR1e3ZVVVE18YcB2iymwD9JGWYqbjKkp+
 25JAmP363ddoPdgiwR3Amuj2SsvIwIMSkPqDuoQ4N5/d/JiRTW1l1S9ctO9Ff6UlUw2l Jw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3aceudr70j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Aug 2021 14:07:37 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17BE0c0O065936;
 Wed, 11 Aug 2021 14:07:36 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2104.outbound.protection.outlook.com [104.47.55.104])
 by aserp3030.oracle.com with ESMTP id 3abx3vtmjf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Aug 2021 14:07:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JcD6tecuqXHlhqWjolVakgihSfP7tsDVAPR9EIvUvAGBaLSQ+/EU57+eqIpMgELeWunDXM5WPbLD3v8Fn81boBnYk+NNKKCo3Uz67AfRflQBrQ2jUZa/JBi6SugVur0vg6bCq/ULjVgai/4FhddTkwR/9Dvw8QAz0wYN9/a9wHcYbwyiLtA0S2d3U4feICGWxAEE3lww9TDb6HYWP3WvbRl23g8RUyi+oUvx8th96S+7XS96jE7V7+BsyvyRL0dj85c1mz0FvHQx1j+q5OcF1pTGVUMq2rtiQ70DFK2slCoFIVFqo/8pFOQW8MLh3iM3mfwG8s44QE19+dhib3P00w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pOImKLoaG3NEUcdH9TmpuA+OG810TNyWPXJfSzA99yc=;
 b=m9o2oatopRzOmhOy3+ixn4kdYNeNM/uuduVG/7h5Oh3BlyZsVlrEZh+9adrwuxWpqYxiIYiV7nCZ3VDbZYrPV57KDy8+U1T9MOwCgYf7j+qm1QZQo2+9asEDG874LyhvGnKJS+A8CPWbgmnGNUHklLKKATH5Rg+WEK4+Cw+IYiw1wYtSeq2bkIGhhRWDLyi1cFPzX3SaxXW5GADg+mWQJD9iKttVymtmodOFi8xKfLiLwtxrvAmnnHw2XLMZVvboPpf9CRy2j0DTsVuVK++Z9K1BztS94aM2DAIZkgRlF/EeE9nethzeEzgs5Ttz9epFOZZiSOHjuU/FZ40HAjt/yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pOImKLoaG3NEUcdH9TmpuA+OG810TNyWPXJfSzA99yc=;
 b=fUs7Ii9YJab4cDa7yxImZTgPE+wooTFsJiF5272pYSZnzRWo4kU1iIJrQG0oCy68whtLhCQFlhNSZUfpYsT30fo02aa64N8+RD29kCyCRrrkshH0S6gyUTsYh1RaXVoF1wJsCGQ0xqkZJY+KU8Z6LAGSGAO6+eNBC5FOuVuoSNU=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none; vger.kernel.org; dmarc=none action=none header.from=oracle.com; 
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by MN2PR10MB4383.namprd10.prod.outlook.com (2603:10b6:208:1d4::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.21; Wed, 11 Aug
 2021 14:07:33 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::7cd0:8600:6e6e:aa8c]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::7cd0:8600:6e6e:aa8c%7]) with mapi id 15.20.4415.016; Wed, 11 Aug 2021
 14:07:33 +0000
Subject: Re: [PATCH v3 7/8] PCI: Replace pci_dev::driver usage by
 pci_dev::dev.driver
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Bjorn Helgaas <helgaas@kernel.org>
References: <20210811080637.2596434-1-u.kleine-koenig@pengutronix.de>
 <20210811080637.2596434-8-u.kleine-koenig@pengutronix.de>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <1f843d53-b6ac-762e-eefc-46afd9ae0ff7@oracle.com>
Date: Wed, 11 Aug 2021 10:07:17 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
In-Reply-To: <20210811080637.2596434-8-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: BYAPR02CA0067.namprd02.prod.outlook.com
 (2603:10b6:a03:54::44) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.74.99.104] (138.3.201.40) by
 BYAPR02CA0067.namprd02.prod.outlook.com (2603:10b6:a03:54::44) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.13 via Frontend Transport; Wed, 11 Aug 2021 14:07:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 07a3b679-01e9-44ca-8ff0-08d95cd15d4b
X-MS-TrafficTypeDiagnostic: MN2PR10MB4383:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR10MB4383E6DA2996D6C0C9F08B228AF89@MN2PR10MB4383.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:326;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mJ0paZ6vBETkR6J4HwzVLR1fjdkNhZxr/ppMGrmSeAqrWmeNWK6q6wY8G92t9AOnVKJsm0PNHcD9IrW/XXUxID+UAKCk6qooAW0iXSqZWnhVJrxYlDkCBA65f8NK3txkXCOx25Qwm3Np0udtSxLaZgEy1Vk19Rsd7oywIoUr5geUXlsxOiCcqoRc0rMjGOrfSru2BtYGgsC0vvvpW+O3E0k5Px0bWJymOCtdYbMizDXDBDi8oly6k3MHIMHvZkAJ3tbtym0etE9zvlpYjT3ni46Cpooy9u4G6/SufrVUEVT7KMlQAIZ4kfkfc5ewPgzYcfUkiEwLzoQVMcwXwq/GJXc88+ji1kQ3YtKro64yjHiJT8Dg8eRbG3CWIl1WVPnkRfq3+FCBtN2aHUKUSmWraOxWOV9KlBsmjAdWndJ9DX9IycUWfUdVEGOvN5hrT371qnVK2QBcxF/sbeFza4/GoSpfHQoB5zzrCGnQUbToGdqsCOJV8sFQP13JBTXynzqUzkamYqyz6iFdBQc5GP22Hp5o2aFFsVcW0nSh2p0me6dHOYYZnfq7kerQCdUZBoM4JlOD6Vv0q+zfKyC9h+MF0CnDBgezTGH9SOzkjs9XHcwXlbLpVMa8D0e8ffzO1ZeV7H7CQgsTiNZrZ8/x0m2ze13gpS7Xr4E/Uj4hBKveQ/9rstK3lmK+TaaFNJYe2e0geOhdGzyDgQsDBVqR0mK8HJzaxQTHjBCqyazb0vd9SsU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB5009.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(39860400002)(136003)(366004)(396003)(346002)(478600001)(53546011)(86362001)(31696002)(36756003)(110136005)(186003)(7416002)(26005)(6666004)(54906003)(2616005)(8676002)(2906002)(44832011)(66556008)(4744005)(6486002)(7406005)(956004)(66946007)(66476007)(8936002)(5660300002)(16576012)(31686004)(316002)(38100700002)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SGRuTmt6aEhSY1ZVb2duVXBHWHNrdjBKQlIrZVEzZG9WV1dIWUhYeGg3eUJM?=
 =?utf-8?B?QmN6VjdhT0RNZXptWldXWDBxd2MyYmxFTERJT3JOZXF3U244MVhBZ1Vqamdo?=
 =?utf-8?B?bFc2K3hCSGNtYVlDaTF5eWliK01DdUFJTTJmWTRjVndPSi9ISGVUSGdNY2xY?=
 =?utf-8?B?V2dSZ0QwV2RaNVFyRWlKSEFKQ3NXL3p2V0hENEJNQXZ2ODI2azFIRStRb3lV?=
 =?utf-8?B?aGdVclpUNURmN3F5Lzd6dGRqdTJUc3FIMm1IZXpWaXpudkt1ZUtVSDBNaHNy?=
 =?utf-8?B?bzZ6N2V1aEtUaFJDRklDSVNKZHIxZks5Q2IxeHRLY1VWK0J6TnluQlZBNkxk?=
 =?utf-8?B?bDgvMDFKU3lJOGN1bzQyUXVOWlRZRTlzaFR5YUtHTlRRRzdaU0tYRDJTZ3Ir?=
 =?utf-8?B?ZDRLSVZ6VFFiYkV3WHFyeXI5MmJqMnpxb1prcWVlQ2VXMU9aOGJ2NHB2cmk1?=
 =?utf-8?B?VWJCU1VpY0MycEtnRmJaRHpWYkxWWk01RGkrVTU1SmFzWDRCSmlqbzhlUmdr?=
 =?utf-8?B?ZXVVNmxGUDV4SWd1S1Q0Y29JSjh3ZTB5TUpTano1ZEg0ZG5Ia0JBUTJDbGVE?=
 =?utf-8?B?WkhtRU4vUWpHZDQ4bW0rdjJaRWpMZ0pmdTh3SFpxdXA4R3BLbjFvL3dwS0xw?=
 =?utf-8?B?UGJQMmJCbDJUL1NwMkpvMTBKMGU1cVU3TUJCb3c5bzBBR0JqdDBOZXIwaTFq?=
 =?utf-8?B?NUNRclB5UTBXT000R0llR2txWmRMbERGbk9LdmpYOGRzQ1hDMDQ2MUUwWEN0?=
 =?utf-8?B?aUoxcXRXNG5mMjB6Rk1zRWY3cWQ1dFBHOUdzQ2ZXbWVTYkdyZ01waGo3dXNv?=
 =?utf-8?B?bVhjOSt3UlYyakRCSEtQdzl3amdhTHVmN1YwekNYajhLbXRTUkN4QVRHcEYw?=
 =?utf-8?B?VDgxRE1qcFJGbTdDanA4QnhKRUdISWZPbG4rbFJWb3FQYTBvVTV6c1cxL1V6?=
 =?utf-8?B?cW5oME1XbGJiWnV6N2NWQlpaZUVVMURrOFM1aml6UlJTaSs4TTQ1NlU3dlBo?=
 =?utf-8?B?UlpxMWNFSExvMkQ0azZLMWpCLzlJam51WTV1ZjJGYktydlJ3OFdwamhFcVdo?=
 =?utf-8?B?VG55aG1yZEhrUDBwZGlmSlg2aDhidEpKUG5YRjcyaHRZTk15cjZxK09ZRFU3?=
 =?utf-8?B?SHNndk80bm1rN1BhKzRNNEJpTXFtUkZCU0VvS1JGY1RQTm80TEVrMWJ3TENI?=
 =?utf-8?B?T0VQd0t2VXlyYk5PTVozK1B3b1ZJTS9wSk5WTnkyWmxzdzd0UHhwdlcyMkFN?=
 =?utf-8?B?aVk1Q0UwWEd4VWZyZFhLdVViRG5qUStqdUtFRXhUMnhZMk9GYzFFdmt4WGEr?=
 =?utf-8?B?aEZmMkJRYzJ3N09IMXJTZHg2Vko2QmpTMzA4Q3lsS2hBcmNXdWphR2JXTDVr?=
 =?utf-8?B?ckZGZmdyUVJuZWM0czdySEc1YkszeGMxUDBIMUcxV1VqTzdycytsdTZCQ25V?=
 =?utf-8?B?NVU4azRiOTB0MGpTMzk3Q1Z3dkFtMmJuTFpvSEJQbjJiNFBsRDFvMnkvYkZT?=
 =?utf-8?B?RHIydjVJeFNGcUJOZ2VXcWhvN3pPelRLNThSb2tlbjRZU29uaTZHSzdmZXM1?=
 =?utf-8?B?aG5tYmwrTDFvbmFsVk5CaHVCMnE3OEdPU1V1YmZ5QUJWU2p3bHI4MVJWS2Iw?=
 =?utf-8?B?SkZzWFNpdmtTNDNlYmtQZGs0S1BodnV1eGh5Rk9FY01CUHhXWnJSSytqS2lx?=
 =?utf-8?B?MUFlVW1qRTUwYnFHT0VpSHNEODJkZDYvQnJzSDQ0akVYU0JSMGg5RmJ5bDd5?=
 =?utf-8?Q?luX84VVeQz3HtwhMslpQxWQyrzW8zrWWGyfQSZz?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07a3b679-01e9-44ca-8ff0-08d95cd15d4b
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2021 14:07:33.5666 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jwolo0mL32BhKNdxgkaJuu73dp6oVF9cKNvE7zf4ZLjxzSfrtmEUBgVaa4GyqdHXxilscVUzMHnq7cA2q1UNTfFFxNrq7xFv8SskM2b/DXk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4383
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10072
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxscore=0 bulkscore=0
 spamscore=0 phishscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108110095
X-Proofpoint-ORIG-GUID: 35MWkgmyIv3VJo1ExJX6uD_LN4w-vk7O
X-Proofpoint-GUID: 35MWkgmyIv3VJo1ExJX6uD_LN4w-vk7O
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
Cc: Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Oliver O'Halloran <oohall@gmail.com>,
 Jiri Olsa <jolsa@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Mathias Nyman <mathias.nyman@intel.com>, x86@kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, linux-pci@vger.kernel.org,
 xen-devel@lists.xenproject.org, Andrew Donnellan <ajd@linux.ibm.com>,
 Arnd Bergmann <arnd@arndb.de>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Bjorn Helgaas <bhelgaas@google.com>, Namhyung Kim <namhyung@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Juergen Gross <jgross@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-perf-users@vger.kernel.org, kernel@pengutronix.de,
 Frederic Barrat <fbarrat@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 8/11/21 4:06 AM, Uwe Kleine-König wrote:
> struct pci_dev::driver contains (apart from a constant offset) the same
> data as struct pci_dev::dev->driver. Replace all remaining users of the
> former pointer by the latter to allow removing the former.
>
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>


Xen:


Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>


