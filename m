Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D434D2374
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Mar 2022 22:40:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KCpdS6tcYz3bY3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Mar 2022 08:39:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=F7g+Ykh4;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=dweFUTWP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=205.220.177.32;
 helo=mx0b-00069f02.pphosted.com; envelope-from=boris.ostrovsky@oracle.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2021-07-09 header.b=F7g+Ykh4; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=dweFUTWP; dkim-atps=neutral
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KCpcc3zrnz2xb1
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Mar 2022 08:39:04 +1100 (AEDT)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 228LDuVo027923; 
 Tue, 8 Mar 2022 21:38:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=DhFtv67WuVLsRFNLT222tZVmBbgE3btJpR6JDsNZ8QI=;
 b=F7g+Ykh4y2SAP+9SwGCDIwemS8we9hH5tG+VkEC9K3yRz2WB9SfQ6ZzmfDJ+SQ6pt35p
 7PTEbFF8xivElUrKRDWDlmc6AamyVC8WJNyu3qzb1epAV96jHU0ZpzwX5SqUzlALettP
 K3vStBpQTfZfODZzReCRi/G9SpNT5MQUkiBork64AIOBBPKOQuj47TrbpZv+T/nKeeEK
 fbnsrRovHQLjS/3Vlu0F61lJcCncYN+SzsKStVmZaRJTfLVbDjbEJ/R5uUUZhf6c16af
 b34sWpT5W0aZzdfX5Dg+wJYA/4nX5zN2mircGRKSOsfeMX/V6o0G6f5FY1kAhhQRKLQR Cg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ekxn2gc2b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 08 Mar 2022 21:38:36 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 228LaPoO120217;
 Tue, 8 Mar 2022 21:38:35 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2177.outbound.protection.outlook.com [104.47.58.177])
 by userp3030.oracle.com with ESMTP id 3ekvyv9uh4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 08 Mar 2022 21:38:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B4eUYEiuVLxfAIFoLTUKkT6HBej2c7szDrRteYJhwqZG7ul4gy2G8IWCtOgy5wYYJTSPsdwiW52UIjvk7Y/Vww7s0fEicgrl/S27DIWHzrTUEf8fhL6tBbG54R4zmozFWb3UPdQKpo/Y25/1tV5l1aahmaGw2MgsjU9RtFlI9MZiXpQuPjsalG1ykwa67flbHKLtBfXFkIozcVAeki6Q6cvBZRuqoC7ntJJMvjqhd/1YvCqyOE2Qe3SQpi/3jFb9e5v1SHObU4K7q8fQEvA5SDuz/Uuo108jEkYwkntjVN0P3s66aFE464dNVSbwDlZvNLwUiRVMTK0hLvlYHcUhVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DhFtv67WuVLsRFNLT222tZVmBbgE3btJpR6JDsNZ8QI=;
 b=ORl8TmJJ5gQ34Fw4sklC1lmnScrYpHAAZGpfhSKsUme+lYH6isd7FKfBi8j/iDnlZHGc/HqX071HUBS04NUPYITMVo9JlwyV/CEvc3KJFPc/oOpJrPUeWQMlPxFp/AsEaH8F642DgkgLSXNdmBtS8/d66iUwyFU8KqFnhiz6j6W8A6HrFocvjmbyzKFPT8rzhAc9GmaYQp5yt4316miKX+/kZebFtbYj85vHMVCrtVyg2ypSH3HWoETHqZkw2UntUQKmLFWfCmFjYAE6vusjKy96mjajBLFOyxEppW2o30pXDP81983MjvtCrbwln1yezuGpgBHeveEVKa6zplp7cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DhFtv67WuVLsRFNLT222tZVmBbgE3btJpR6JDsNZ8QI=;
 b=dweFUTWPrTn8YHb6QoS3/Czf8M9GYhX8dEH8+GYE7n/9g4TDEDKfJS08X6Ki8oBC7iDsxStZtBpeKd1O1fwcBGgTsB4fPbh3q4nGJ7FtV/WJj0fVhTd/KVNoxw6PEE/Kea6MwCrf/dlzZJy9EwuP5SBuJ8IZSmup7uZaIA3HybA=
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by BYAPR10MB2710.namprd10.prod.outlook.com (2603:10b6:a02:b5::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.19; Tue, 8 Mar
 2022 21:38:31 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::6d20:6694:a16:56f7]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::6d20:6694:a16:56f7%3]) with mapi id 15.20.5038.027; Tue, 8 Mar 2022
 21:38:31 +0000
Message-ID: <6a22ea1e-4823-5c3b-97ee-a29155404a0d@oracle.com>
Date: Tue, 8 Mar 2022 16:38:21 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH 11/12] swiotlb: merge swiotlb-xen initialization into
 swiotlb
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, iommu@lists.linux-foundation.org
References: <20220301105311.885699-1-hch@lst.de>
 <20220301105311.885699-12-hch@lst.de>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
In-Reply-To: <20220301105311.885699-12-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR01CA0036.prod.exchangelabs.com (2603:10b6:a02:80::49)
 To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a5497499-5231-4669-a72e-08da014bfd50
X-MS-TrafficTypeDiagnostic: BYAPR10MB2710:EE_
X-Microsoft-Antispam-PRVS: <BYAPR10MB2710B19FF89408863850F5508A099@BYAPR10MB2710.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zpm3AbzfYsLIS6+hWgb7lSGWLoUo1jjusiM9Dxdnt2alpTe5MIqdooOVzcypscvRXFXYT5XvkVs3wjlfX8hhxILJMcSS8pm5Kbi1R5FemDfmpAN6Xt+QJ//J/vl0uDqPkDJ8kQ1IkxkRJFDlYaeluUj5V/uFX1LHh1OpF1iyPyuShjZAbF9H1sbjPb5uls0L0On2QoC6iygNOMQCxjrPzUrnXJ2O5NLibqo6pfYfLyEtDfaWHjFof6mL9pbkromai8bcBVKXMEAneJh1KbrD45unTbaU2sWJFHe4S+lZZzEeWT2Mrd72MbqQW8moZNh2r60f2RUMSHiBJJ+ic7vwOrexl46la5NDWu7D40kVJBpIPJyIMznXbaqx3HvnPqQlAIkLM8okwfc+TY8X7KsgyJNtqIDpLL3Ku0sqY8P6qJ0ijhwpMIeStG7rNqvMvXAN01s9BDB49ewXQzvzDsl9IOE832NuBxHz13uyjrUnSomOats+erEGFDSwalj/49/X0IbdfNFWlGUE1EkjL8nAQMhTjSiY1Lt94AJ35ARg+hrImBVFWSZhgFRdm5t5Kae8uZM7mMWxqP6AJ/XqhBCPOjzBpza2eNtz1qhgB/KwGU2RUCQkECiJjeBG9YAQo0N76fJJ03npK3D1ZvUhOlyDU/yTxjIwfr5SgdLoqjpS3+zpGsvepOBGT6HA29aYoGHPeU1Z/WZvlbtVsyW4ZsdOKnqtFG5kQxcVOxyz8ETljFU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB5009.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(53546011)(54906003)(31696002)(6666004)(86362001)(8676002)(66946007)(66476007)(66556008)(5660300002)(508600001)(7416002)(4326008)(6512007)(44832011)(316002)(8936002)(6506007)(6486002)(38100700002)(2616005)(26005)(31686004)(186003)(36756003)(83380400001)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZEs5MDBsbXY4eU9GSCtNNmRhaFNsK05lM1BCVEpNMmI2KzkyUUdKY2RWRWUv?=
 =?utf-8?B?Z01DaVc5UG4vWWNiSzBXK2VEVnZvU2k2OEZjOCsrRFJUL2g3NkFKdjFGcVdC?=
 =?utf-8?B?ZFd5Q3VNWUxaMHlyenVkNk1oU0Nrb3RqVUlwaGpTYlZOd2wwR1liYW5abmlz?=
 =?utf-8?B?cHlKYUxzNFNteVFjZkl2OG1sVXl2VlpuZmplRDYyTWZ2V1dZNmkvNVlsWDBa?=
 =?utf-8?B?SE5qSnNzZTFRMFdpajdTWUtGSk9RNzJPOTdOcitQQzc4dzNVelNJY000RW15?=
 =?utf-8?B?ZndjdmJ5Z2l4RjhzemVwRWM0RHNkY0o5c0FXRnJhS25jVlJZbzhVNUxPT2E4?=
 =?utf-8?B?ZjFyTkxLN21mTTJESFBLWnA3UzA4MnZMdjBhdEpIMUxNLy90WDZ2ZUNja3VW?=
 =?utf-8?B?M1h0eWNpbnU0bXBaNGVFK2Z0TUNnSklUZXRER2huLzZWb0ZqelZrVFBGZHVo?=
 =?utf-8?B?T1kxWjNmZ3V1SUIzUmptNmZXVDFBeG9hNzlvUW9VdXZzV2oxcy9Nck1UZElL?=
 =?utf-8?B?aVh5VTlhVHJLUGtYUVhoQVpMRVV4NmpDaHp3dktXRlRZcUxISnY0eEFiQUl1?=
 =?utf-8?B?QlBFSWN5VGg1ZUhxVEtwNEhtSGNtOUlSaVhNakZjNDYwRGpMSkRVMXlKSTZH?=
 =?utf-8?B?YVk1MHVmRHhZSWZDSTdLcXdRdDkxNklWTUlQeURkQWRReDRuNERCTGh2ejVp?=
 =?utf-8?B?RUcwckQvdTdsZXdaTDJJanExMFZCaWRHcVh1bjVVcCs3VVFzZitablpBQ1RM?=
 =?utf-8?B?WFRKN01EcWtEK3dHWklROU85OWJjcEhTMUNnejJ4U2JMRXJPUnJjUFJnL2Ju?=
 =?utf-8?B?aEw1ekhvbHJpYy9kckVHbTBITHQ1RFFzQTczM1JFTFluSlpEeHBRa1l6emJ5?=
 =?utf-8?B?MHFJYVVKYUEyODVVZEFmTHRjZCtOVkxWRUNoRUdldGF6ZXVRL1dJODVEcVpq?=
 =?utf-8?B?cklUK3R4K2w2U24vd04vVEJlVlplblhYZHNRL1FwRm9aaXpGR09mT1FnSUZ3?=
 =?utf-8?B?SENxZVZkRWw2bFJMbHFEYVJzSTBLbkZGTU9KOWdPbU4xc0o1dUxkOHgrcXpw?=
 =?utf-8?B?bEFLRm8vRk81SFMyem1USkZUUERoaGVodldicXl1VHc2UG9ISUNtMUJSRDBE?=
 =?utf-8?B?UnBiWjZjWU1qeXJyYmZiZHdieGQvZktCOFc2Sko5ZWtra1U0cWZwQUYwQUd0?=
 =?utf-8?B?eHZtaWJmbUdyRFR4c2FuZmt5NTN3TkVNcnM4SG53OXFQOHZSQWxKWjRGZFdZ?=
 =?utf-8?B?bE9RbXdnUEJXZWM3RkMvQU9RWDRXaTFDeWlKaFE5TTVDc0dIU05UTHN3YnNX?=
 =?utf-8?B?NmQ2NExrL0swUTlsWDZPbWFPbEROREZ2ekk3cGt6T1RWakl0K0NSejYvQlJq?=
 =?utf-8?B?THBCU0s3VXgvOW1QR1kzTzVIN29NTGZjWERaKzV5dGJ2SHE4VDk0VzBrS1d0?=
 =?utf-8?B?SWVFYmhHblVvdys5OGM1dkhETTdBOHJOVzZrSFgxREQ5b0V3NFJBb1Z4dnIy?=
 =?utf-8?B?dlFBTHZYZ0JaS0xQbE1IT0l1OTVDUlM2Z3NDRkJ4QmROTjEvcDdrNlk5UC8r?=
 =?utf-8?B?MGFLWmthOHJrR21BVnRWTTJqclR6eUFXMjh5Q3d1NG40d2FyZmFwOFRMYkYz?=
 =?utf-8?B?NS81ZHgxNkU4bEFjWHlPZzZhbnFNNUZuV1pzL09RQm5mbG9mZzdXUXVSL3ZI?=
 =?utf-8?B?bDVWRkZJQWVsMXM3NVNUd0lGbzQzc1RtaXZXUlpCZmhRRGd6VCtCMVZNR3Vk?=
 =?utf-8?B?SHl3WmRUbjM2ZVNndlB4MnQyelJMRVpwL0tQY1pPa0VqTTFWdStNdXQ2UTh0?=
 =?utf-8?B?RE9KMVlHVGJqWkpSTjkxbmdYS1o1bmJHbnU1TUg5bnBMbWVuek5MMWlXOUQ2?=
 =?utf-8?B?aFcycHpoYmNaQ0dQdllwb05YM3c5QTNsZy9YcmRpdlZDanZNMCswUUV3dFJM?=
 =?utf-8?B?a1BDZXdSRE1DY25IR0ZLb0xyRTJRQmVTNHBRSkphalU1KzJIei8reUxMZVM2?=
 =?utf-8?B?bGszTVpxY2xsMXVmcURFdWxUdENCUHlxSEVucGh3V1JxbFNBak56QmVQbkJI?=
 =?utf-8?B?Z1hQKzRhNGJkdmR2eGErQzBWZGpFYUkzYU81RHlhZFhmWnByanIvbkRoTU9p?=
 =?utf-8?B?dnE2SWFldGdRYkJVNStmR2pFMys2cllGQytMRkd5NTZpQUxHZnVUaXdINkhU?=
 =?utf-8?B?V0R4ajlSMW5tMUZjeEdpdklGb1ZXWi82dXFYSDUwcytUdUpHcS9MRnpwRzd1?=
 =?utf-8?B?T242c2tIcmZ5WkNkNXpNUitWNS9RPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5497499-5231-4669-a72e-08da014bfd50
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 21:38:31.2786 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vb92VElZb1vD5AEwKvnEjGDwvHfwNocegSuRX2xflLeDODXD1huAuFsmO0Pa3qhKq4HDCzfnKvJCrt0pwrw1AeQHidhPaPQDQ0TN3abVtA8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2710
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10280
 signatures=690848
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0
 suspectscore=0 bulkscore=0 mlxlogscore=769 adultscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203080110
X-Proofpoint-ORIG-GUID: IPRsMW4fSjoQvfjcYGaso-sG-LdxRZL7
X-Proofpoint-GUID: IPRsMW4fSjoQvfjcYGaso-sG-LdxRZL7
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
 x86@kernel.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 tboot-devel@lists.sourceforge.net, linux-hyperv@vger.kernel.org,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-riscv@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 linux-arm-kernel@lists.infradead.org, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 3/1/22 5:53 AM, Christoph Hellwig wrote:
> Allow to pass a remap argument to the swiotlb initialization functions
> to handle the Xen/x86 remap case.  ARM/ARM64 never did any remapping
> from xen_swiotlb_fixup, so we don't even need that quirk.


Any chance this patch could be split? Lots of things are happening here and it's somewhat hard to review. (Patch 7 too BTW but I think I managed to get through it)


> diff --git a/arch/x86/kernel/pci-dma.c b/arch/x86/kernel/pci-dma.c
> index e0def4b1c3181..2f2c468acb955 100644
> --- a/arch/x86/kernel/pci-dma.c
> +++ b/arch/x86/kernel/pci-dma.c
> @@ -71,15 +71,12 @@ static inline void __init pci_swiotlb_detect(void)
>   #endif /* CONFIG_SWIOTLB */
>   
>   #ifdef CONFIG_SWIOTLB_XEN
> -static bool xen_swiotlb;
> -
>   static void __init pci_xen_swiotlb_init(void)
>   {
>   	if (!xen_initial_domain() && !x86_swiotlb_enable)
>   		return;


Now that there is a single call site for this routine I think this check can be dropped. We are only called here for xen_initial_domain()==true.


-boris
