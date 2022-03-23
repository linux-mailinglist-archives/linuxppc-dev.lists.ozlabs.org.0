Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4F34E5A0A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Mar 2022 21:45:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KP0jT6RxYz3bTf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Mar 2022 07:45:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=LvQxtd4A;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=Ll9SLujj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KNxn30ZXSz2ymw
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Mar 2022 05:33:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2021-07-09 header.b=LvQxtd4A; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=Ll9SLujj; dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4KNxmz5s4Rz4xv2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Mar 2022 05:33:07 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
 id 4KNxmz5mwzz4xvN; Thu, 24 Mar 2022 05:33:07 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=205.220.165.32;
 helo=mx0a-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com;
 receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2021-07-09 header.b=LvQxtd4A; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=Ll9SLujj; dkim-atps=neutral
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4KNxmz3YXbz4xvG
 for <linuxppc-dev@ozlabs.org>; Thu, 24 Mar 2022 05:33:07 +1100 (AEDT)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22NHrukE032651; 
 Wed, 23 Mar 2022 18:32:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=0UEBIKxpFPg9+8Q1CNLkhnKGFTeYdIGbU7X/ttSkgWo=;
 b=LvQxtd4AkkRIqp8HvIhw5WDgHfLIIOw0g0kHmpwXwoDPogQzHfA5Rd3H0aifINxWnczt
 Qk/khbaksuC/AdlX7R+AjKMYQ3dfa2uh38YBD+O6U33YSuXkNc7272VTQy0ZEtogMkXo
 A/+X3bcwtUp6lmpq0vL5bgw2U+Cv7veSDlJfRjeRrScF+21TWcaaRvBW0o1Kz/XxH2Dt
 7Nfy6MujdlFJmq0eq+VNtwN2HqfSS1BhwT7A5VVAxId3YGbzwv8WjrK0CCs+s58isCil
 3UXJlqZ5nomY/WKD1GECtby9gGRmDG0TwTWJ9BR75lQFNSc2MLFcSjiEub40iYVfzc9y wQ== 
Received: from aserp3030.oracle.com ([141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ew7qtahuh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Mar 2022 18:32:57 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22NIWEDF113360;
 Wed, 23 Mar 2022 18:32:56 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2177.outbound.protection.outlook.com [104.47.58.177])
 by aserp3030.oracle.com with ESMTP id 3ew578xq33-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Mar 2022 18:32:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hq9A94IHpJt7Lqxmt2ZoQ7Z6Z1RoELPk+/4pao9/4PAYdG1TIyDdnZ1xCTxgLM+aIFB2r3Z6AJzdrkJRgEoPqMBFLzARGmjYaWl4bS6T4vcyHc1/DDgLSgR1xRZ3YrYl6abMvRz/eSRlQ1+J/ZXULausktUL/qhKxgSkYZAg+ldbYAPdTOulcHo65D1ihA8Jk/b+AiUVIchJeIINzqPmt41+Y2ZZjcSKO3VdJ0CzyvxaFMpl0I0EPuWQiuZIkvdeeXQILp8kjyrvO7Oa+qP2QVJUxJHD9jeJgYrw34YlKsy1XZHGgs9YCFiPYgFSzYRMaCSmdYosyVqk9jPw0lGaAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0UEBIKxpFPg9+8Q1CNLkhnKGFTeYdIGbU7X/ttSkgWo=;
 b=eAd6+i1TVAuHttBdZAz0SrHDVKh+1mytBYUNGPMjLsB6Hn3smbf21vwLdYhk2lCkyiFsBpQP4HCIMtOY71vITEuKwajwidKcmB0o4Zrgj1co2Xgo0HUlNYvR8z4GMzsx7khEdXxz02oY8oxK6cTDXDkDpjYr3UOFxujiV3wXpbhGZnbTbEBNJE/LIJnU9434kTv2JKg/pX+uKxFVdhzju5OoOHrja684SzCAmqA+XzXwR+E20/sBAkOnzyKfTkQhoBiw9ML5+itA75kLZag6tCUazdpn8Ddnn77D55S8uTg9ADajkW/Wwqw397Bw2N8kr2WgD5pnbZddlG/tQzKsZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0UEBIKxpFPg9+8Q1CNLkhnKGFTeYdIGbU7X/ttSkgWo=;
 b=Ll9SLujjl9OIxJJ0J+8AIlu+qyHtEobs/Sud/tLuteftfFk4WiqVt3INfdSLssmR7iBquCy1CGy4H586HVYJcKYe5gzHv33teAlWJsEJx7IDdp5leJN7QxXOm8oaisohYfrKHSWpqhLHnn8V9Wx7P/21EQuxtz2kzZd/1XmOsbY=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by SA1PR10MB5823.namprd10.prod.outlook.com (2603:10b6:806:235::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17; Wed, 23 Mar
 2022 18:32:54 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::3188:fe86:1d6f:53ac]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::3188:fe86:1d6f:53ac%9]) with mapi id 15.20.5102.017; Wed, 23 Mar 2022
 18:32:54 +0000
Message-ID: <8fc2d63d-97db-59ab-3043-d453fed1e7e3@oracle.com>
Date: Wed, 23 Mar 2022 13:32:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [RFC v3 PATCH 3/5] powrepc/crash hp: update kimage struct
Content-Language: en-US
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@ozlabs.org,
 mpe@ellerman.id.au
References: <20220321080422.56255-1-sourabhjain@linux.ibm.com>
 <20220321080422.56255-4-sourabhjain@linux.ibm.com>
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <20220321080422.56255-4-sourabhjain@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR03CA0029.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::42) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 82eb31f3-f4c7-4944-196d-08da0cfb8ba8
X-MS-TrafficTypeDiagnostic: SA1PR10MB5823:EE_
X-Microsoft-Antispam-PRVS: <SA1PR10MB58232233035362D75F35534797189@SA1PR10MB5823.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8BQ51wcngSaU6ePgK3xhCmu+kBKFJpbjnbbQPsyHHiCwCB1llxhwG03YsxBVQkajoBmoQDAEV6Rs6ZEdwa8qJENfnSlaT5QzsjlKkOJTRYi2nQeG5YSHBGN3tDvLupH9ew0qsDENjjRk+VtXQRaW2AFO27swhUI0/4SIMZvC2jzTegljhtfb8xCHtTJs0ZCtYGNGmL8qWmlMjbRls6/nhyd5NPWgbt6XyPw/8Er7qALVk7T9TVOHKCnLOP5HQ+pNgYX1kYFwL6aPR+jQ4Aocj0VcDZ+Rk9XT+uZPzhGcDE9PDWVX2VJZA5OQDFY/HhnFiDb+4+NPBSgfsvYxLP1tJcEOO1UXJUjs1bE9XIrYGI+R/vbyLYVK5ujy02F62TXuJRlcky232eQZr17OH55KOMcadMF2EyUGMczZKq7pAtlgZeiCttpofptbvmstei0VNoQYI1YifpxRTNbt6s69tx+JceVuHdAbZ8FD0F1Aw58t7MBhUrEGxQ8RzLwujdAvNk4eonkNBHgmAzrIShf3NQv09tY5tibRAEHTzSRF6E+napIlHR3dnroKeU7PLF0Bt5ngXp3f5wTWuNUd/YS8oglbv34JL+lZJhl0q5/F5R65AUdiXh0UxhViEoAvG8U4IA1Aw7wLXDhSg79+rIF7OzX6mlIFDB0ispJaxadmdmFMdgNOI5+sQqJwoDjJFYpkIC6Qb1Up3OvVqncCcjf4NWI3IWDZ9aQ1Wll0uFhWXhitpsgHoG77/75s3ecuPmSW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6486002)(66946007)(6506007)(53546011)(6666004)(66476007)(66556008)(8676002)(2616005)(4326008)(86362001)(31696002)(38100700002)(2906002)(6512007)(83380400001)(508600001)(316002)(8936002)(36756003)(5660300002)(186003)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SWx4V0FIMHo3M21pSVNMM1dsa1dzN2w1TU1WZnZOQ09CbStPZjdPSmhMaFM2?=
 =?utf-8?B?V0kwTjVRT09Qc3g4YmhUeWtzcFZNQVdUVTBJN2NRa1ZUSGRTeGdCQ1dVUnk3?=
 =?utf-8?B?RzlmVStnZkdzbnJBQXJ2MmtkemErVXlpTitJbEYwTFY2QjVTK0xLR2dMSFBt?=
 =?utf-8?B?ZUtOaVFQdjFnYWZvd3RhdytycVU3YVJUQm9keEQ4cEdoaXR4N3ZCQnF1dFZh?=
 =?utf-8?B?SzJwOThsQWFlT2N4SHN3UjlFRGZDcmtHQTdibnAzSUZ1M3haNUErR0JHSmc0?=
 =?utf-8?B?NHR3WEpRMmtRTjIrVGEyT2gxVlA5U3RhVk9FZzM2TFUvL2JuNVIzSWpmVG9L?=
 =?utf-8?B?WVdkYkpaL2NCZm53MVppbjZjL3RBdEJPV3p3RHZsVDhPMTUyZWxNejhDdEVH?=
 =?utf-8?B?WnE5b1NkRnJTZUZpTWQwR00reEI5RU1HSEtnYytqNG92ZWJHdDlsUS8welJn?=
 =?utf-8?B?U2licEt1SnA5bGdrUnFva0EwaW41NTBnclFpeG1sME5wWmJqK0s3dVRFZ2tt?=
 =?utf-8?B?cDltVktaSFZjNUdaSlo0Q3U2eDMwZGxJdmJkOXhJZG05MTNzQ1FMVlJJUlNL?=
 =?utf-8?B?NHY4SmFyZkRFUEF1RlQwYVo0OU5FZjAzM1A4aFFzemE2ZHFJZlliSGdEY214?=
 =?utf-8?B?dnd5NXVQQ3UzSlMySXZPcG5wLzllZDNQTWJjWk9wWmk5N050Q1ZSRVdnazlp?=
 =?utf-8?B?T0NSQ3lRdXU3QWVzdE1sakJubThVUURlY0pNNnpLejNUMnRLd3BuTERlaUl5?=
 =?utf-8?B?NnRHd2NLUlRDL054dElTLzhKaEExY0g2VmdWY0E1VVkycW84STFBcjlVTzhx?=
 =?utf-8?B?ckNhMnl6a2M4Z2lGeFp3VkY4TW50bVlZbllUY1YrdytOUTVwZExQdzlKSG1h?=
 =?utf-8?B?elBkZ0NqWURHbStIeUZWdysyUmtjZXZLOUllRG5PREtKZnVnTlZrYmZHZnUv?=
 =?utf-8?B?QzRCYk9IaFlxZ2JTa1RlWjI3RlNsZ1VxcEJDUDVvNzJIRlpBbGY3eFVvMlhi?=
 =?utf-8?B?aGRwM0s0YkYyYzhOSW0xbUNRTzZZbzdRckcvbWtPRC95STB6Nk45cEh3cWZv?=
 =?utf-8?B?WXVzd0hxV2pRd0dyT3NoSGlZR2VyU2pzSFhlYk54Yisram44c3YyeHhXUVpt?=
 =?utf-8?B?cDdtTk5kZ3RwOHVzL1NGN0RXVmZyOUh2VGpvcytnLzBtN3NQdThnRzYwU0dH?=
 =?utf-8?B?cUhCdHo3MVVoYzJNNzJWaUxaMDJWNkpJQ3FSTHFVMnVTYUZZVFZHOGlMak9r?=
 =?utf-8?B?eVE5TWdLbzlPSzNSS3pOQVoyRjdKSmducTVnTFZZcm5rMVFFM0RCWnpvb1FM?=
 =?utf-8?B?TDQ5eWk5R1gyb3RVSndkblQxaVJkY2h6VXJzMDMzMGdOWDJtVGZ0VFBCUWF2?=
 =?utf-8?B?RnovR2dsMzJCMlUxZld4aXo1T1AxSk9QU0xqakJVR0JxZ3ExbVVnc2I3dllK?=
 =?utf-8?B?U0dOT1F5Mk1IS3NJYUhjWFVoc00vNWVkQXhuSVZGbEZ1ZjhOTVo2VldzVk4x?=
 =?utf-8?B?NGNwMG5FY2Z4Z3JjY0JVeUllaThKb2tVcnFNUVo5UVdwcktFWWZMWTZlb0Z0?=
 =?utf-8?B?d0JYWXpiTnRHZFFaR1VoTy9lK1ZkZlFMcEFqc1hhRWFrRG13SHVveTZoOERh?=
 =?utf-8?B?MG9sbUQ4NmRXVlBscjdUSVNLNCtLcWVjRWZseW9KcUh6RnNod1oyM2d3WEYx?=
 =?utf-8?B?T2FLY25rbG5hS0dWZFlKUmEyQ1NXeS9SZjZDeTY4ZlpSUk5GeGJJdGZDQ2ZG?=
 =?utf-8?B?WGlWTzdGdkVXVW1LLytxK3JCakFTbEpNZGR1SUtKRjBwYUUvMXFOaExqeGdW?=
 =?utf-8?B?TnNWR1k4VWFQeXFVRW9FY005TzJWUkYwNHM3QVZGRjBqd083cm9EbEIvR2VO?=
 =?utf-8?B?UmV1dDM3QmlJK3VUZGYxbC83WDBMWm12eDRUQXpJb2hSaVpRNFZycHM5K1pU?=
 =?utf-8?B?eE5Fdjk0Qm1uT0lvT1VIK2JjWjB2Ty91cEFHb0RsNnZnT1ZYNFVLR1F3U2h6?=
 =?utf-8?B?bm9oY0Q3MkRjRWJkL1ZNODlqSEJGMVhxZHY3TkVNNDY4YWZka3FsbW0xYXA1?=
 =?utf-8?Q?IDG9sP?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82eb31f3-f4c7-4944-196d-08da0cfb8ba8
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2022 18:32:54.6969 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OBXnSg+tTo/YbBJvqBYxUdhYpPMlSJhPLdViDDfqsLoXl+4gx722UYceukGUEpXbNSVYrMncFh0xxtFjutv2XTd+uRNQjEV/9pI4EuMspIA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5823
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10295
 signatures=694973
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0 spamscore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203230097
X-Proofpoint-GUID: 60rOp7LNRT8Q6EefL4CgyDV3Wd6zhil7
X-Proofpoint-ORIG-GUID: 60rOp7LNRT8Q6EefL4CgyDV3Wd6zhil7
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



On 3/21/22 03:04, Sourabh Jain wrote:
> Two new members fdt_index and fdt_index_valid are added in kimage_arch
> struct to track the FDT kexec segment. These new members of kimage_arch
> struct will help the crash hotplug handler to easily access the FDT
> segment from the kexec segment array. Otherwise, we have to loop through
> all kexec segments to find the FDT segments.
> 
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>

> ---
>   arch/powerpc/include/asm/kexec.h | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/powerpc/include/asm/kexec.h b/arch/powerpc/include/asm/kexec.h
> index e1288826e22e..19c2cab6a880 100644
> --- a/arch/powerpc/include/asm/kexec.h
> +++ b/arch/powerpc/include/asm/kexec.h
> @@ -104,6 +104,8 @@ extern const struct kexec_file_ops kexec_elf64_ops;
>   struct kimage_arch {
>   	struct crash_mem *exclude_ranges;
>   
> +	int fdt_index;
> +	bool fdt_index_valid;
>   	unsigned long backup_start;
>   	void *backup_buf;
>   	void *fdt;
> 

Question, for the kexec_file_load scenario, is there a need to have the fdt_index segment excluded 
by kexec_calculate_store_digests() ?
