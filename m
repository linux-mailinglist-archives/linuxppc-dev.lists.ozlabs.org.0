Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD064D31A6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Mar 2022 16:20:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KDG904KS5z3bSx
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Mar 2022 02:20:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=PABVro5j;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=0Kqty1EG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=205.220.177.32;
 helo=mx0b-00069f02.pphosted.com; envelope-from=boris.ostrovsky@oracle.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2021-07-09 header.b=PABVro5j; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=0Kqty1EG; dkim-atps=neutral
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KDG883YFvz2yQC
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Mar 2022 02:19:32 +1100 (AEDT)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 229EcPTq016927; 
 Wed, 9 Mar 2022 15:19:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=Dx641JSVlBiQrD+zJH2H/HezAIOHGVb03Y0nL/kDJBw=;
 b=PABVro5jJvRfd7cJQOORPeuJQTAk5yGtVHq1Ikm/p3PCK3Pl1meH5CZiCA5YsmDnbFYv
 4+1IqW+8ImIAUAcQ7wS+P/ipv6p1YRaeCmeIE8BpefbFml6gWnlll9fyJNIu5hPGNslO
 F5HA/XpWAt+HAWDxzMP+kS1C/KExNtaVyyo8EsMQ2kT6algAbYmpglcV8g7V0yvPnPRz
 XJVzEFS3wTK206fGz/AcvpufD+jE6o99RjUZMpyApp54GsliBzBy6EBlBlUh8ELPk4lK
 Q6aNx4CiUW7a6XmwEBpQg5FM/8Tfd9FdScxwerUUBY/vqiaOoG95QLfJysI1SVq+7h1m 9w== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ekx9cj9sb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 09 Mar 2022 15:19:08 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 229FBk5O159973;
 Wed, 9 Mar 2022 15:19:07 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
 by aserp3030.oracle.com with ESMTP id 3ekwwcv4df-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 09 Mar 2022 15:19:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HEHPyjSwOBD3pR0mcIfAdUxRXe3UhUKlabQ0+C2C7Ob0ptn01/CPHsVmGZD9VZrZuAx0pPEQqyvlT6b3wCz/yvqRm4s2VL9ed76YO5PMMOW2+NBS9+t1bALedcJr/69K6yqGyiTI0bbAY/h5D3ZbMf9Jma1oIa1iTT3zqSjZflju37nhnixOQ8J2PARJTggDNYEvM+40WCkntw70diTB4mNw7tSBoYULHav2GoLJqsPx3d6TRjTkJ0f6fTjxGF7Pj8QJiB3f0KmntsqyZob8IRg8+9tj+BC5N4iHafcjpVTuZCMotCHkBDmmrwP8c4IvRsYzvlB2Rk794L72FKFgoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dx641JSVlBiQrD+zJH2H/HezAIOHGVb03Y0nL/kDJBw=;
 b=IIEjjqZ6k0gmWray/FUYEshYIpfu54ofKRN/JTPTJsUylaVanCTekZ0wY/FZZb5LZmMO3H25LLwyGsrdMO4ymwf8/e7avW04kKQryaBx3lNTKRBuS0BIm6/DGB+fSgoipAVNlpAopKMUgAJfu8YpyWAsoEKhHW4b/yzIcV8hUrIj1LjAbBsmwqp9LtVUPGjj+2QYrIaX8BX2zOOZZdHPnnk4UyNOBwoMk+F8VzSHwWfKb3gFKeOg21IgJ+IjcB2pHL5vuWdEGan5NXh12xRz+GMBvu75aeZaD1J8yqSOk2g3dXT2XlCAaQrc/R3PI+NBJMbEU11TkijJZ5hQxWPwQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dx641JSVlBiQrD+zJH2H/HezAIOHGVb03Y0nL/kDJBw=;
 b=0Kqty1EG5d/PfM9n7JZzkSJpKBgadK3l78TdLjrx7xB+Q26Cta1VcTum7/JDuIzqDbCABLzQUDHGbr2Qhwa6OQuA9CiXHU9XqMVY5Al2kydKbzTL7GYLFcLHzvDyak17ubJmtmhuxN7V1fTxo+K4b4jJfrDeN9uNS2QfhFViDNM=
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by BN8PR10MB3393.namprd10.prod.outlook.com (2603:10b6:408:ca::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.15; Wed, 9 Mar
 2022 15:19:05 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::1b2:b41c:b2f0:c755]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::1b2:b41c:b2f0:c755%7]) with mapi id 15.20.5061.021; Wed, 9 Mar 2022
 15:19:05 +0000
Message-ID: <9fd239df-b066-36da-f27a-5d3231de82ee@oracle.com>
Date: Wed, 9 Mar 2022 10:18:57 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.2
Subject: Re: [PATCH 11/12] swiotlb: merge swiotlb-xen initialization into
 swiotlb
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>
References: <20220301105311.885699-1-hch@lst.de>
 <20220301105311.885699-12-hch@lst.de>
 <6a22ea1e-4823-5c3b-97ee-a29155404a0d@oracle.com>
 <20220309061840.GA31435@lst.de>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
In-Reply-To: <20220309061840.GA31435@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0212.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::7) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fb6a8038-0539-4d83-b05f-08da01e025e6
X-MS-TrafficTypeDiagnostic: BN8PR10MB3393:EE_
X-Microsoft-Antispam-PRVS: <BN8PR10MB3393E2CBCCE5ABC49F18CFAD8A0A9@BN8PR10MB3393.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1QNkRX/p+GG8mKkn8Q1NVDgS5QikrhZ7/BtpBtCwMk3hMRq+eMVn15qyq6tjn2phAWHBw64SMmlo66fMV2+4i6+KfGMtJIG8i4MTHPQzYOpAVrszRojK0l5Py2NZwg1gwWN7lFX5k8+zJ25kXP6dozz86HngLcvWeK2wdiMhkvh2ucKlYxwzgr3HDt5FjLT+xu7Z+ckaT9YeS4CZb980XBDIsfwVdDFnD0NH9PMufTGCb7EOqdI/jg6RrfBlt0VcopKD4sYTRtU83/HezczZrHK7/VKPVyvKsrrr6DoUHgxOSDyortYfOJ4TNcBzgD+orZ8o9Vo/oSL6ZJ6cDD3F5Ywjj8+2RytHzroj5ABqhWOmb9AiK2zS0nKalQPuuOzx+7CAqoAfjlpdidwJOsrssB9Scmh8ViIadgnOm7QUD18EZzwAkGXGXwDHEM2gXW9qEwRd9UWDgVpU+mYzbxPBDdX4XuzorZInUFmMZjNzRbsvH7hedSMGDtgtObRXEQ5kS6X11JtFI2Ew2IEDLs36mfq/8qegstfwbGBLKDni7JDqq/i7un54GBfLqR5TcvEzdUhVrOy8NHHp/qwQhjtzPDJGecHPF1zNZrNoA15eKjwBrVICWTUEuIy1irzNzKxdSVGm9EqzgALTeAw4GXtKPoqjBYc/TF2PD+Nd8+ewko95XnkHmq+QcMFR5sl5lEB1XJzthUc2wiEhbJq4qWRqA67EdAwO1xMeZDsgkAsiqV85kpQA/SGrG1W0DLcQvNVh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB5009.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(26005)(36756003)(53546011)(6486002)(31696002)(38100700002)(83380400001)(508600001)(6666004)(2906002)(2616005)(6506007)(6512007)(31686004)(186003)(6916009)(86362001)(316002)(66946007)(66476007)(66556008)(54906003)(7416002)(5660300002)(8936002)(4326008)(8676002)(44832011)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0s5cGhaWkl6Sk5LZDhqS1RBK3Y0YWtzREh0bUY4cXJCeVBkcUo3K0pSNzZi?=
 =?utf-8?B?dVd5QVJsTXhRYWpGamtMbXRCNnN4czFmQmlpZDArUHpaNHdWdEJ5dDlDVTdw?=
 =?utf-8?B?c2tGbjBTemZ6NFh4ZDJlR3orODZicllhdmx3Mk5XaXFtTkNmVmlDTkJaVVN3?=
 =?utf-8?B?UmVlUU4veEt0dWRoS1UvZjQrazN5Q0dzbFlUSUV1b2Y1bFQ4VFVMNmVIL2wx?=
 =?utf-8?B?NVZwVExFTnpRbVBpeDJCcjFJdDZZNFZaVFJ6NGJrKzlkWlN3THNDQ0dnU25o?=
 =?utf-8?B?aDh2dUE5ZTltMlM5WDBiZld3K1FiT01iUUxROS83UDNad2YyU0Z5QVlOOEl0?=
 =?utf-8?B?bTNqTDVxTTBpczlYR0RGRW4vTmlqWmpFbTQwZ2t6SUdpS0ZrRnZ1aEwyalBn?=
 =?utf-8?B?S1l1ZUhhZUNINTV0ekQwL2s4aFVucVRBb2JmaHRlZzlpcS9mUGM3dG9zZFo3?=
 =?utf-8?B?NEUyUVFXdnFLZmhET2d4b056WHhUWHRmeVptVWt1U0RxaTBvNGFmTDVWUzR1?=
 =?utf-8?B?NnpKbTBVTHpjRS9LNVJ5dVFTR0l1K1JaTFN0VWhudTFHMkRhRU1oVmtrQ1pz?=
 =?utf-8?B?OGplak5QZ2F2Y0FyVS9NcDRxaHR1M3hPU3UzRWZRLzZPczhvd3FxcWNXdXJa?=
 =?utf-8?B?V0dwcVl3cXZPdThmcG5nRGxqZy82MGF6M1dPZTVDdjFXdG5XZjNaU3VDd0tS?=
 =?utf-8?B?aGVMOFBmZEVQdVFydCtBVk52YmpYenpnVFRhRkxPSWZjY1NJYVIwNHNSeGlR?=
 =?utf-8?B?OGlhS1BNODBTL1NWTzd1MnBlc2lpVEFGSWR5STFTbHlVNHcwZkhhWXNvaTdx?=
 =?utf-8?B?SzBMRkprZEx2RXF3c3psSHZKOGxSN0pxbk9hMmFsWUxmUlFLczRMVytKcXM4?=
 =?utf-8?B?ejc2VFRLZkRoUDZqSlR4M1hLMk1MZzVqeFpJU0FpeUUxRlJ0dVA3enJ5T2xM?=
 =?utf-8?B?RjZUOE5MelNpVDg4TlFjQ3QxSzVBNStmVGVRQndDLzkrVWVNa3J4SFFRcWlS?=
 =?utf-8?B?cUtGKzl5eUMwcG5wQ0hIeExsT245eEVaZzg4UDBCRHFLQTlwZkJNQTFDVUtX?=
 =?utf-8?B?OERQc3h1K0Q0M3p4Y1ZUUHdpcDAybGpnVWJhZDJDNm9yeGs3bUxvaFNFRUZJ?=
 =?utf-8?B?eVB5bW9BaEx4OFNtM2JMN3lTd0k3S2tYakUxL1lrMTFlY0xpRGg4QnZLUHRO?=
 =?utf-8?B?cThBS2F5SnVRVHROM09sYnFDUWgyVzFTNkNVZWFtRnMzdkRkdDB2ZUFPeUUv?=
 =?utf-8?B?MHN6cXUrQUUxQWlrZG05U0RTRlI5NUtjK1FodUxDU0tYbzQ2VEkvWEhiQWRP?=
 =?utf-8?B?bU9SM05CL3VLZjVlZTRMZUJTUHl0c3VRbzZ0WFZOT3h6SXNndzh6cUF5c3Zu?=
 =?utf-8?B?dUxtU21meXV6ZmswVmx3VDkwOWk5Y2VKWHpabzJsdGdTcjJYeFFlaWo2SWFI?=
 =?utf-8?B?eUgzVkp3TEl3d1BtbldyalNwVytIdUg1blJWbndEL1l2cDUzTUROSTFlVWlB?=
 =?utf-8?B?OTFvYU50bUc4c3BpZTVpcXhNVWdTS1g1N2VZOWR4SmJIWU8xWU00dXBSYVdO?=
 =?utf-8?B?NHl5ZUZ6UnBRcTFkK0tkVkxzN0J6SWRqMDBjMUNkTWJJSjVFSXZiRnYxUEg5?=
 =?utf-8?B?RjlMam9Vb3E1T2tFMmJZaUdWL0ZkaEFHWWQxcVVCSHQvNjBLeWUra24xOWpi?=
 =?utf-8?B?VFVCKzUxY0haU1RYbFJPa2hxZkg2cUhxRjBKekdGWDRLUlR1Mzh1WkVSV0tR?=
 =?utf-8?B?M2U5WEp2N3RtZ2tVc3VEeU1oT3ZDR3VhbERSWE5vUExqZXBZdlVob1F5VENJ?=
 =?utf-8?B?ekRaV2hSU3ljN0Nhd1h2MHJVUXJ5RjhhczlRYWJEUnYyM1cwdjNxdWRPTzZ1?=
 =?utf-8?B?ZVBLS2gycVVLOGEya0M2V1gvVnJUL3JMdDVuV0N5OHpvUTRvdVMzOUdtOEIw?=
 =?utf-8?B?UU9Ud2M3bWRwVlR5ejVwSXRCSHdqOEh1dmMrOTJ0QkY1UllsQkxYMEFMT2hV?=
 =?utf-8?B?eTViWTdzWmZNd2FmTnF4QTdhR3NLQnJneEhiaUNGWE9WQkJ1aFN5MXN6cHcx?=
 =?utf-8?B?S1N5R2JrWWU3Sk1COFhCNCsrUHFsaHFIZWpoV3I0SWcwWWRRWUE4ZzR6K1BX?=
 =?utf-8?B?V0luYnZZVTBlVys1YytxRjVKQXlwR1gxRWdKVllZVWtVZzlzendBUDZxOTlD?=
 =?utf-8?B?VGFNa1BadDZMR2xLeTZ0ejJOanlackc5UXFqcUxWNWtOK3NLZzJqdWVQRUV3?=
 =?utf-8?Q?TugvA2MvwI39/l2rQ9CjmMwL0j3PMNKFcFquqwWvcM=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb6a8038-0539-4d83-b05f-08da01e025e6
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2022 15:19:04.9325 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C+DD9S6tdroI373tssDi2EgvnipQGchDK8a5RzpziOozDroVU4+ycD29E1J8y8PmXwyoU0Aj37uOG+9iOO2DZ/AizdjyTMty/uj3n+/YBJU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR10MB3393
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10281
 signatures=692062
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=670
 spamscore=0
 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203090085
X-Proofpoint-ORIG-GUID: WIi58lydhaEBuwimINUF8pWYN2lXAfqV
X-Proofpoint-GUID: WIi58lydhaEBuwimINUF8pWYN2lXAfqV
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


On 3/9/22 1:18 AM, Christoph Hellwig wrote:
> On Tue, Mar 08, 2022 at 04:38:21PM -0500, Boris Ostrovsky wrote:
>> On 3/1/22 5:53 AM, Christoph Hellwig wrote:
>>> Allow to pass a remap argument to the swiotlb initialization functions
>>> to handle the Xen/x86 remap case.  ARM/ARM64 never did any remapping
>>> from xen_swiotlb_fixup, so we don't even need that quirk.
>>
>> Any chance this patch could be split? Lots of things are happening here and it's somewhat hard to review. (Patch 7 too BTW but I think I managed to get through it)
> What would be your preferred split?


swiotlb_init() rework to be done separately?


>
>>> diff --git a/arch/x86/kernel/pci-dma.c b/arch/x86/kernel/pci-dma.c
>>> index e0def4b1c3181..2f2c468acb955 100644
>>> --- a/arch/x86/kernel/pci-dma.c
>>> +++ b/arch/x86/kernel/pci-dma.c
>>> @@ -71,15 +71,12 @@ static inline void __init pci_swiotlb_detect(void)
>>>    #endif /* CONFIG_SWIOTLB */
>>>      #ifdef CONFIG_SWIOTLB_XEN
>>> -static bool xen_swiotlb;
>>> -
>>>    static void __init pci_xen_swiotlb_init(void)
>>>    {
>>>    	if (!xen_initial_domain() && !x86_swiotlb_enable)
>>>    		return;
>>
>> Now that there is a single call site for this routine I think this check can be dropped. We are only called here for xen_initial_domain()==true.
> The callsite just checks xen_pv_domain() and itself is called
> unconditionally during initialization.


Oh, right, nevermind. *pv* domain.


-boris

