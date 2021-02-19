Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E906320333
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Feb 2021 03:44:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DjCT20bpFz3cMP
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Feb 2021 13:44:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2020-01-29 header.b=RrPwkanv;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=rn3tuoDT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=156.151.31.86; helo=userp2130.oracle.com;
 envelope-from=boris.ostrovsky@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=RrPwkanv; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=rn3tuoDT; dkim-atps=neutral
X-Greylist: delayed 9757 seconds by postgrey-1.36 at boromir;
 Sat, 20 Feb 2021 13:43:50 AEDT
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DjCSQ4lH1z30Hq
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Feb 2021 13:43:49 +1100 (AEDT)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11K007Vd108102;
 Sat, 20 Feb 2021 00:00:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=Y/1Rbl3M9BfZ0Z0hndSyr6AhqYtgqVV5G/OyW4hBz7I=;
 b=RrPwkanvaetiVvaN/34DZC6QPNCVDceabm0+2pUq/x8j27lA/hYON9sGlsnme9KZwQm4
 9M6Zo4gWxR9/V3Yhm1WF+VqN8GL+U06yv953pVgJNEXaop5XRzeLSYm+W/uExG0yWcMf
 im9eGs7SeCgkyWsQEm6UqQZTzkfQFdRgNY/zz6qfEXJujTbqFkGKk+bUrZVvY5u3UkI3
 GIBmYEkbqp5MTFUGaVRjund5P6hc/V0lsIOIxjqw7K67C0A6KgDM+P8Cdy+dtPn+z32v
 YfU0xSIg9HDQH+buDTtlxDIHm2fzIXTOk1+Y3+5NFG6Jh7XvTvQ3Qnf8D9cP7SEYko1T mg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 36p66rb3t9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 20 Feb 2021 00:00:07 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11JNuVkv131595;
 Sat, 20 Feb 2021 00:00:06 GMT
Received: from nam02-bl2-obe.outbound.protection.outlook.com
 (mail-bl2nam02lp2055.outbound.protection.outlook.com [104.47.38.55])
 by aserp3030.oracle.com with ESMTP id 36prbsqydk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 20 Feb 2021 00:00:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QCmOyuJrc/ZVzb9DLnW6nhkAaVU54Rqn9LIvbKIFHDF7ivmxxZ1s0hAhAyiLjKlXU6Q00XC677BD7Xb1OZRhIj45KabeDDJg4AH7A/4cmLTKhM0Z++B9J8zOUo7lfZU/jOW9kyrt9NUrczL4CXcxO+5QUWK17gdR0xb4hNU9YLPwpKijFoEjB5E1BGnUytLHZMWvMVw8Zl/wePx08Amx3DGO+KlaV/pJqnCHysY4PX+pJ302jONXXA1C6B2zedP7oJdQnjtqQ/AJKblgvFkaOtljA+9Rc3+FLNzRwfWALMI2/g5ylz/lLLMfvWirIJfRShJksgS0Ga+NztqIWUSsVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y/1Rbl3M9BfZ0Z0hndSyr6AhqYtgqVV5G/OyW4hBz7I=;
 b=FGv/cD/onuD6rn36VacLKq0wRegFJxsfzAFFlpZzPAuO432Qb59OPk+jVyUUcjpsOv4fsvpnKI8EvIT60VHY89dhyea7uHBdbRs1NubjCGveWCJBB69lJMoKdNgj+brGkcQEs+V8YEMBwt0Qngea2gpQGJcg8C1mAILEdo5HWVqZgOwWdxlQ7uZHhy28Q7dFMK2npDyIx3KjLsm7Hu2JB46TCw+7U+vAsOgs4pOsb+Jsm2ELh/qv0tgyPOy8Eu1xxxsSZBzkePORQR972k0en3s0Db4CR1IPsaTqktjmv11HUoERoYILX9FkOqZOlWBLoZQ3ASSkZI3A+p06ZnKSMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y/1Rbl3M9BfZ0Z0hndSyr6AhqYtgqVV5G/OyW4hBz7I=;
 b=rn3tuoDTZG8LxnbDl5WtBXHVX+/Kw9sUIf7++eP1+3d29N6LX8iyox2HZZimXwwtHwJdsY7Q5Q7z6xh+CPdgt3/Z1I4oShP8dU9DOTcaoL3zB3CWTeA9islOlBkWcjCZ5v5MPE/3VrtmNKkbdt/Yd8XxdEVokQyBkVYfYW3sx4Y=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3288.namprd10.prod.outlook.com (2603:10b6:a03:156::21)
 by BYAPR10MB3478.namprd10.prod.outlook.com (2603:10b6:a03:124::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.31; Sat, 20 Feb
 2021 00:00:02 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::f489:4e25:63e0:c721]) by BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::f489:4e25:63e0:c721%7]) with mapi id 15.20.3868.029; Sat, 20 Feb 2021
 00:00:02 +0000
Subject: Re: [PATCH RFC v1 5/6] xen-swiotlb: convert variables to arrays
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Christoph Hellwig <hch@lst.de>, jgross@suse.com
References: <20210203233709.19819-1-dongli.zhang@oracle.com>
 <20210203233709.19819-6-dongli.zhang@oracle.com>
 <20210204084023.GA32328@lst.de> <20210207155601.GA25111@lst.de>
 <YDAgT2ZIdncNwNlf@Konrads-MacBook-Pro.local>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <e0baa2fa-0ca4-ef21-aeb0-319d9648e830@oracle.com>
Date: Fri, 19 Feb 2021 18:59:50 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
In-Reply-To: <YDAgT2ZIdncNwNlf@Konrads-MacBook-Pro.local>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [138.3.200.49]
X-ClientProxiedBy: SA9PR13CA0183.namprd13.prod.outlook.com
 (2603:10b6:806:26::8) To BYAPR10MB3288.namprd10.prod.outlook.com
 (2603:10b6:a03:156::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.74.102.113] (138.3.200.49) by
 SA9PR13CA0183.namprd13.prod.outlook.com (2603:10b6:806:26::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.12 via Frontend Transport; Fri, 19 Feb 2021 23:59:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bb977870-6db9-4847-4298-08d8d5327889
X-MS-TrafficTypeDiagnostic: BYAPR10MB3478:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB347819496D28F67CB66D38608A839@BYAPR10MB3478.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wHw8Rtx56J3eNRtZBG9OfoZ1cOLDXUf6QDLcCWPioJ5/KOPcUj3PSCBdhUP7BePHPJ6ibTO6BrurKX3Exn4z+Ksng6aTsUlWNbm1G09qeQWyZfSwuhPHQxpmy9/yWDJAzq5qjIrtO4wYs1YIUzcOc4h6YpRoISCpv3l9eDx3QTjzUuhWuRcSlM0N6jXktGmoJ3CvjBdiZmBxzoD3cUFDmHGwsf3xTmMRvfSkZsr4wJej2OvfnF0plIxq0yfiKeiJOm038h6DGy4hz1z3Yn6GUjOUY1NmhKCHKUay95nlQce1Ae1MxZ68x1cMUzsZHGb4HssnfLTgnq5ACwU7dvu7Siyyllr7mYN7d4siXgzqtxBuNAgQZkFsTfDi1KuzKC+zKFJol1Wl18x7y/YEtCcng/cbeyFT9wO18tJ0IEEKveNT+HLyit2yadfNjZIV7kguyyoK3jgNePYYM4paLSijNM8AIEjD18LwhZ5vmILZrhXotVvTB7NWCNpYeBRs3dUjFJLwU/OV7PIfnPmvBFAB3VyZsgeB7NmvIBJZ9YsHqDmLV/A+F/cISJl2SraKa3/0/D0ni6tVIQi+OR5Q8wfZg5RFzwOQejne37B3sjBHnFU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3288.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(136003)(346002)(39860400002)(396003)(376002)(6486002)(186003)(86362001)(53546011)(36756003)(2906002)(8936002)(66476007)(16526019)(31686004)(7416002)(478600001)(316002)(5660300002)(8676002)(26005)(31696002)(66946007)(2616005)(44832011)(7406005)(16576012)(6666004)(110136005)(956004)(66556008)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QVNCUUpBb2NkS1p2blZLb3hFcGxJUkI3NHQvSElScElQcUNXNTVVcWErT2hQ?=
 =?utf-8?B?ckZScGRYT3UvRWM1czFuVjgrVDViTVVyY0FQQmpqNCt5eVJEMUtNcDkxYjFD?=
 =?utf-8?B?L28xVWtrRUQ2YXYrcGw3cVBIVm1CbmQ2aS9DeDJSWnBPeVc1aXN2S3FIVkdP?=
 =?utf-8?B?WmV6TkNuTjdUazdKR0hOUStHKzFWajlZWmFBdisvRnFRTmR6RVIxVGQraFpQ?=
 =?utf-8?B?T2dPUkpEY3dvMFBFT2FqOG5HWUZOR20wYnkxQ0s3cVlsMEN6OXpGaDUxTW8v?=
 =?utf-8?B?Rm54WURzTDh4RWJjb2hUWlpibkZrdDFyc29OQjduRDhwK1NKalk5bkMvWXFl?=
 =?utf-8?B?SVllM3ROWVcyZkZvNXNRd1BEM2pobm5jWUNhOWl3VC9JOFFESi82YzhLeFN0?=
 =?utf-8?B?TjVxcVJtTkhjSm45akN0TW90UU5kU2ZLQ0pXUDlJRTQ1MFAzbno5ajQ3eWxt?=
 =?utf-8?B?SlUyUWhZTDZCOTZLSEw1anJ1T0lVMmVZU2txMTdQbXI0NWhsbE82RnhobXMv?=
 =?utf-8?B?VHF3S2tESy8rYmhlSWh6OTZhN1VjUDRKbHcyckJpckVFRjdXcHVoanVnZkJy?=
 =?utf-8?B?VHdPZmczc05abzEwMkxrdW4wS1NqRTFwbzJ4L082OVZmbVp5VTk2aDFOQURJ?=
 =?utf-8?B?RWZOKzNMWnRDNGpxdHM0YkpCVjlwQzZ2d1FZcWtFYWVqR3plMzU1U0ZtSWpZ?=
 =?utf-8?B?YjFxUzhDcmZIYUJSL2JOR25scGZkM1dVWGpVLzdsMEdvN2hwMzlXVmlDa01O?=
 =?utf-8?B?QVErY3VCa3J0bzBFMThmN2xzWEtWb3VqTHFVcTdBUmlBeWE3ZWJndDhhTkUv?=
 =?utf-8?B?dE12QnNPUGhUZWVHZ01TZzdJamhBZEo1UW44NGhhM1NTUkhjbkdEeitpeHIw?=
 =?utf-8?B?d2pjRStpNFFjSFlaeUFQbWl3TUZEZWlNZ3lGaE5razNaY2lqZ2JIUCtTSUpM?=
 =?utf-8?B?YUNyRUtySjg5eVhxYzNDZkV5V3o5N3hnUUdFN3pybzYrRnRhUDdSSGxUb2x5?=
 =?utf-8?B?NFNoQnFuMVkxRk1xN3EvT0pwRUJEcTRHbmZCdUVOamRlbWNjTHJoaldTMExn?=
 =?utf-8?B?RW9kcVhyQU9qV3dPbG14S2ZwMjVHQlZzak1PU0N1RHpGcHNWYjJNRFU1TERE?=
 =?utf-8?B?K0RadlpBaGpUVklYZW9iZUl0TVpCQlpUMzFsdmU4S0tHRWxVcEphQWI1MG1i?=
 =?utf-8?B?aURDSXgwbzZBR0U0aHM3am5kZzZHL0U1OWhJVjlvem5CQ3VNR3ZRRU1YQWRJ?=
 =?utf-8?B?MkxTdlBXNkU4QWMyZnBNNFIvZzNhSHU1MGRmV3RJK2lmVU5nYTNOTmgwMHJ5?=
 =?utf-8?B?YVpKVkVXNTRQRTkzZVB3Z1pXZEVjQ3FzMDcramdETkZveXZrNjB3ODV3V0dN?=
 =?utf-8?B?Y0ZhcTF6YXZmbHFrcDlNZjdEYVBGbjA1bzNmZ050R3FPbTVIYVllY0g3VFVj?=
 =?utf-8?B?NWRJbm9tOEhmVStJQ3hzWWlyclJQQlZwVzBlYkVvVWN4RFMrc0d4SUJGamlK?=
 =?utf-8?B?S2hEb05WejZmclpKd1pvOUtXeHVteHEzNUZkS1ZOWTY3a0Rzc0dKdHNZMzRl?=
 =?utf-8?B?WUlWRVhQWEMzQ1dNUkkzQzVVOHlpeTEzbWo0Z1lYNThxSkRDUTBkajdZM3VQ?=
 =?utf-8?B?OXVkUVI0eVNTYkZqeDV2cU9ObDBEeEpoaExaSmQ1YjRhN25lZm5NMXpZSURl?=
 =?utf-8?B?S2FsVGZCS3J0YU1aZ3c3NmgvWE5rb09qNDBaeVo1Wk43NXArbU9GZFhTeEhz?=
 =?utf-8?Q?n2oelDtJvZWoXjrMy4S1QIGAPbxs5OfZ1Dx/wvW?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb977870-6db9-4847-4298-08d8d5327889
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3288.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2021 00:00:02.3805 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Des4+MdYQUm56M8MWeOPJBdTKtHtZDWQxPVWdvf+t3tq7lw1L/455wkojdxiIP+TV14ml/NWhpHwXjt94wgy9iCuufxjtuBu/+w3PAZeb30=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3478
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9900
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0 mlxscore=0
 phishscore=0 adultscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102190196
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9900
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 clxscore=1011 spamscore=0 mlxscore=0
 phishscore=0 malwarescore=0 bulkscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102190196
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
Cc: ulf.hansson@linaro.org, airlied@linux.ie, joonas.lahtinen@linux.intel.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 paulus@samba.org, hpa@zytor.com, mingo@kernel.org, m.szyprowski@samsung.com,
 sstabellini@kernel.org, Dongli Zhang <dongli.zhang@oracle.com>, x86@kernel.org,
 joe.jin@oracle.com, peterz@infradead.org, mingo@redhat.com, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 matthew.auld@intel.com, thomas.lendacky@amd.com,
 intel-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com, bp@alien8.de,
 rodrigo.vivi@intel.com, bhelgaas@google.com, tglx@linutronix.de,
 adrian.hunter@intel.com, tsbogend@alpha.franken.de, chris@chris-wilson.co.uk,
 nouveau@lists.freedesktop.org, robin.murphy@arm.com, linux-mmc@vger.kernel.org,
 linux-mips@vger.kernel.org, iommu@lists.linux-foundation.org,
 bauerman@linux.ibm.com, daniel@ffwll.ch, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 2/19/21 3:32 PM, Konrad Rzeszutek Wilk wrote:
> On Sun, Feb 07, 2021 at 04:56:01PM +0100, Christoph Hellwig wrote:
>> On Thu, Feb 04, 2021 at 09:40:23AM +0100, Christoph Hellwig wrote:
>>> So one thing that has been on my mind for a while:  I'd really like
>>> to kill the separate dma ops in Xen swiotlb.  If we compare xen-swiotlb
>>> to swiotlb the main difference seems to be:
>>>
>>>  - additional reasons to bounce I/O vs the plain DMA capable
>>>  - the possibility to do a hypercall on arm/arm64
>>>  - an extra translation layer before doing the phys_to_dma and vice
>>>    versa
>>>  - an special memory allocator
>>>
>>> I wonder if inbetween a few jump labels or other no overhead enablement
>>> options and possibly better use of the dma_range_map we could kill
>>> off most of swiotlb-xen instead of maintaining all this code duplication?
>> So I looked at this a bit more.
>>
>> For x86 with XENFEAT_auto_translated_physmap (how common is that?)
> Juergen, Boris please correct me if I am wrong, but that XENFEAT_auto_translated_physmap
> only works for PVH guests?


That's both HVM and PVH (for dom0 it's only PVH).


-boris



>
>> pfn_to_gfn is a nop, so plain phys_to_dma/dma_to_phys do work as-is.
>>
>> xen_arch_need_swiotlb always returns true for x86, and
>> range_straddles_page_boundary should never be true for the
>> XENFEAT_auto_translated_physmap case.
> Correct. The kernel should have no clue of what the real MFNs are
> for PFNs.
>> So as far as I can tell the mapping fast path for the
>> XENFEAT_auto_translated_physmap can be trivially reused from swiotlb.
>>
>> That leaves us with the next more complicated case, x86 or fully cache
>> coherent arm{,64} without XENFEAT_auto_translated_physmap.  In that case
>> we need to patch in a phys_to_dma/dma_to_phys that performs the MFN
>> lookup, which could be done using alternatives or jump labels.
>> I think if that is done right we should also be able to let that cover
>> the foreign pages in is_xen_swiotlb_buffer/is_swiotlb_buffer, but
>> in that worst case that would need another alternative / jump label.
>>
>> For non-coherent arm{,64} we'd also need to use alternatives or jump
>> labels to for the cache maintainance ops, but that isn't a hard problem
>> either.
>>
>>
