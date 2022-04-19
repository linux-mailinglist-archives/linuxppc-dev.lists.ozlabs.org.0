Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DEB9506FE8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Apr 2022 16:15:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KjQn63ZJJz3bZ4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Apr 2022 00:15:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=windriver.com header.i=@windriver.com header.a=rsa-sha256 header.s=PPS06212021 header.b=GIdlnUs8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=windriver.com (client-ip=205.220.178.238;
 helo=mx0b-0064b401.pphosted.com;
 envelope-from=prvs=11081c7a60=zhe.he@windriver.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=windriver.com header.i=@windriver.com
 header.a=rsa-sha256 header.s=PPS06212021 header.b=GIdlnUs8; 
 dkim-atps=neutral
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KjQmL2R35z2xBv
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Apr 2022 00:14:40 +1000 (AEST)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23JCvp4o013188;
 Tue, 19 Apr 2022 14:13:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=TKCYh77Qld6+GzXGSXRxQdTaAvPHUBYmFX7EUyrF6HA=;
 b=GIdlnUs8wqYuzJkjzxoQ6rjb3RINz0R1Ki3lV879lhZuSDdseh3f0VDrGc+IEUsuov0K
 r2HAzuoAsroPOmKayj9TP/UhJxAi9CyuOVuq9EEAmhmCq1xTNAxpWTtmE9V6jOlezNY4
 T6GMV+JBXgm1k/9t7K/ZnCEJ1i75A6fxHB63rclMfavJykXFjzCTEP3rrJl3j/yQYQYa
 VqfZ6es2m+amlX1o8o+rh2E3nlGJEEdiEjKrRVLDpE1CfzxleFyM8tDsEoenP2A96Rre
 hwqyr/HovA3VRKMOnnhAqgplfEStwCZo9poXfsPtNFggJLU+NLaC26/nX6E+OXBPXZkf eA== 
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ffpj2t5ur-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Apr 2022 14:13:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YNz0QZqt6/mXfjT5qcGf0/1bVLsKqsVt9BwCTKMLcm3lpGdOS/XKe4VvrNRCrEX6IsXYATeO7LYKDJiSGQCbUYpyOjMldIrQm7OwE7wnQjE9i9Q1CIeHJkq3OJ3KfGpbqhafmE7uAQYV365mDVeZh6t8mv9H3zpGaQROO5HbhBpznZEocuf8XKyIzeD7kTdYUU5mcmCWrbBuSQOFHbazJQ+t+UJBP93+cSPWi4NzmNQSHr6hLiFXSw7FlXeEtTWnmgwYU9pESIRCnButN76coqKyEeBKTbv9VVv3GppF2mdVmAs6HceNXVQhH603zPvuTJDCj6w+RHKJQi1MjZsIXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TKCYh77Qld6+GzXGSXRxQdTaAvPHUBYmFX7EUyrF6HA=;
 b=JTNHdQ+oh0aImJPwmixxScOlDZ1pRv7Xq5Q5k3jTl80zouJeJuNsw3tQMpWC1//PKJDmLxnznwztM25gb6JIWajPJ9fzY0ctWRQj1vDd8s6WaGJUg2LRQKKFYxpLCY6exuherefOFdh5eKPhI+QY7Sfsgg6/6ZLaj0HZxpH73DT9VQHU9Pu9qffLy6Gmr9RsMFp+hFDktWjVrTXj0Nz8shMqE7ea7ksD6Zb9DxpTN1U+2g7Tu+9k/Qc8C0vPQV4U4WhXeA6WKqGbI03T+4AgaDL6EGs3NRJHm4o6C6EqgODrHbtnd4Tb+WeQ0R9F1knY6UDVPTFBgbUjgwg928+kJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MWHPR11MB1358.namprd11.prod.outlook.com (2603:10b6:300:23::8)
 by BN7PR11MB2865.namprd11.prod.outlook.com (2603:10b6:406:ac::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Tue, 19 Apr
 2022 14:13:54 +0000
Received: from MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::1cd4:125:344:9fc]) by MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::1cd4:125:344:9fc%7]) with mapi id 15.20.5164.025; Tue, 19 Apr 2022
 14:13:54 +0000
Message-ID: <286b9800-1b17-5274-889e-5a1a361eb410@windriver.com>
Date: Tue, 19 Apr 2022 22:13:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH RFC 1/8] stacktrace: Change callback prototype to pass
 more information
Content-Language: en-US
To: Mark Rutland <mark.rutland@arm.com>
References: <20220418132217.1573072-1-zhe.he@windriver.com>
 <20220418132217.1573072-2-zhe.he@windriver.com>
 <Yl60euwfis+u92cA@FVFF77S0Q05N>
From: He Zhe <zhe.he@windriver.com>
In-Reply-To: <Yl60euwfis+u92cA@FVFF77S0Q05N>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HK2PR02CA0217.apcprd02.prod.outlook.com
 (2603:1096:201:20::29) To MWHPR11MB1358.namprd11.prod.outlook.com
 (2603:10b6:300:23::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0e9eee27-c4a0-40a4-3b53-08da220ed633
X-MS-TrafficTypeDiagnostic: BN7PR11MB2865:EE_
X-Microsoft-Antispam-PRVS: <BN7PR11MB2865A80BF5BFA48AA437DFF78FF29@BN7PR11MB2865.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nc6YLA1KzFGK92zRLDu1qTfrUUysz7J2LMrk13a0mSaZoGjxzs1owMSfJDWj5Dtt8eGSdBzEbRyCdv7wEk/h9UAV8nxhjplnwIhMTRJjT/GUceI9QyhuTfEFNSdPpqqkOKqKE0gkhp5LkDJDUwy4c2IVMEmirs9CK1VDIoo3dq4c32ikrT0929Qhdg5kPJDCJcofU9n4m/QTPGGkmlyQE/RDMFXedE23OENL0AHieEzeqvS3ujaVNZvqKHngx0NJxTpa33HLI+9p80ogduoYgTQ5TgYi7DmJm4+kkp4K4JtYbmzbPDVsAAroUikWRXK1ZBdfhrNVftdYDwUxpWUCdGv7jvCMYuBetqUGsdtjA0X+of52uW1XekyQjMH2ggD7rYtFO+2DAkCE++44TGo4x/ZhUZtNgTmQ9LjYzBzzteuoEFzOIocWOU24KsOj85IKTwkyCl/ITQTWRi+YQjh0bbR0Q46NCRYeVeCrF7Q/D3/qC/hm8ya/xKORbEgOrTAfmlrRCklMmWt8KFMgaYIbn1vl9xpkvMYEgsyI36rrdxjijABzaRqH4s68b8El5VprI88pbO3/Adqcs71yU4emRNh+VQ9LiIejtvH9+L7qtU+VmRXWjeZIOQtj5DXicnepTNlLcVJMUCKBVfyXBtDUM2Bt3qJYQoWT04Xv643Fr6/XD/V1e5rbuLxBBIvKCSQ1SsXTn6hgPWqsGxsQKNPnKX1MaWiHJqhj/DksL+OscRdW4MBv1tvnXddkGqyYgLPivYJFOLd7UyGoDMFISYACxA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(83380400001)(53546011)(38100700002)(38350700002)(6506007)(6512007)(52116002)(6666004)(316002)(26005)(6486002)(186003)(7416002)(6916009)(508600001)(2616005)(5660300002)(2906002)(8936002)(4326008)(8676002)(66476007)(66946007)(66556008)(36756003)(31686004)(31696002)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VFFSdDNCWkR6bHppWERZcmJrRGU2NjFKMTdPVFJjZExYbWYrc29zdEdwbW1n?=
 =?utf-8?B?WGNOZzFJaEwvRERhK3QvMkY0Q3NVL2VVWWI5UHlkWVh4U1I5R0xUK3JWeG44?=
 =?utf-8?B?WDVIUlBhL0hrL3hXM0FHUlVMdFlNcUJraGVjOUI1Ym93WS8rbE5sRHRCTjhF?=
 =?utf-8?B?UndZZ3NxVWVZVW5KTDV2VTgwMGJ0Y1BxMFZtemJKbjdwcHpzNTl5L3N1dkFV?=
 =?utf-8?B?UFJLaHpWQXRtRXUvY29kZGh1U3VSU0VqbHFlSlUwa0lvZGZreE04K2RFYnNQ?=
 =?utf-8?B?Y2x4TmFsQ0Y0TStBSk44TWl2OUQ1SXVJZ0pvVWM3bnAzQ0pVMXVHMUhIZ1FD?=
 =?utf-8?B?eUozQ1kxMXFtaGhWSWx5ckNFalVzQ2ZPbnFGNDlQT2VMa1dOajBTb3ZabC9Q?=
 =?utf-8?B?b2R5Qm5GOVZZajNUNk5NL2FCL1FVUGJVaGJNdmd4YXhxeWdkdHBFa1hMcU5C?=
 =?utf-8?B?bjdrZFUyaFRkaWozcFV0bXlJa01mZFNrZE9HTHVZa2Q4aG9saFNPbzJCRW5D?=
 =?utf-8?B?UXJlOW9oYmk3Sk1kc01QdlJpaHU2ZnNCZHlPZlFTMlRkY2VqZHRNaXRFaWtL?=
 =?utf-8?B?c0xSRFJlc2JGVVEvY0M0dVJuZjlBZHQvd0JjcFJGUUNnRWJMNXhBMmtHVzNR?=
 =?utf-8?B?MER1ZXluTGN3NXowOE0vUjdSaFZLY0xGYWt3ald1aVBtSWhBSlp5czkvYk5q?=
 =?utf-8?B?cUZJMGZ5Ky9OS3RnRzBYS2xHNXlFTmVSaTY3WU1vSXdOOWVuVmFZeEZQM3Rp?=
 =?utf-8?B?OXM3UWpINFRKL2pDbm1DamFQd3JpZGpYN2NnSE5OaWlTb1hlRFcvL2RsZUwy?=
 =?utf-8?B?L2h5LzNVMDVhRWVRTUZjNUtYUWw2VTg0YmpYaFNadTBmNXVMdnpkYVRKVzNM?=
 =?utf-8?B?bVFQK056T09sUy8xanZVT05HdnBZb2daS2pDajVXbUV5MUxjMWp2TVhHZGh6?=
 =?utf-8?B?ekl4ZzRWTm5WM0FFV2p6ZWZBUEN5RXVTeDlHam41RHVNZXA2YXBjUVJkNnlL?=
 =?utf-8?B?QkdsZUF6dDRtMTVveS9BVHduMFk2b1NVRk9lVlBMWWEyRi9UQU1OSDFQdDNF?=
 =?utf-8?B?d095MkJXK0xxZ09kWnFScGZFT0F5akJQK3VhZUVQTzVObTV3dzNtZzRMWHI0?=
 =?utf-8?B?dW55WkNoU254THZNMXN3T3p4Y09tcWp4MUtYQzdVd1VGR3VWaVVXUkRzRUcr?=
 =?utf-8?B?MzJkcHhkMXExQmVjSXp1MmlRVmVhZHJuaHBvRjdEOTF4NURvb0pwWUFRMkN6?=
 =?utf-8?B?bUIxNUNJSlZPamJFQklkczFLblY0eEFiOEQvaTlraVpvTkdJcFBYSzBrajRX?=
 =?utf-8?B?WVJlWXVmUGVhcTdDeUhtUmlUa291UzB5ZkRsRm5kL0dCQVBSa1NRL2V5SThX?=
 =?utf-8?B?TEFzT1JZM1hUY2tRcytHeTBjb2xhRW9heGEzdGczT2V5Ym1NVSs4OXhMMTRs?=
 =?utf-8?B?T1dhYnVLa0tIblRkWGRmYjlUMi9xNEg5dnRKWHRpaWVNM29aa3ZWbzdYY0Rh?=
 =?utf-8?B?VzZmRFBJSVNyV3c3VUJDMnRISFpiRFpzOWUvcEFJWC8zTVBmS0ZmQ1g4SU9l?=
 =?utf-8?B?QUFGd2h0NDdvQWNGejIwdFpoYWJTQjIvS2Nja3hUQWRxak1RUFd4QXJOcUox?=
 =?utf-8?B?cTEySCtaQlVLV3cxM1BZY0pkZEJGM2NDeGU4WnpIS2p3eUxOYjNJdTQrWUtp?=
 =?utf-8?B?bVVTTGRQZ1Fmb0ZxODFMM0NNaXBzZ3dNbjZvc2ZycEZoSVp0MjM5WTN0dFFS?=
 =?utf-8?B?K3dmWTF6b25QdlhuWm94S0htNGZPZGJvMkQ4YWxOajI2ek9IWkdxbS9Zd21m?=
 =?utf-8?B?em50QjBlUHNLaU5aelBReUtCQndGOTFVNzV6UEFKMVpGWUxFQk1OUk1aMG9M?=
 =?utf-8?B?Rjk1eVVEQzJzcWk5Y3VhazZmRWNEK3dlc0s1NzczbkFLTS9OSlhYSG5JQ2hi?=
 =?utf-8?B?RzZWWTZtR2dKNHJ6MWdwSnBta2FTMmN5MVlPaGtMcWNTUm0zNWlMRDZzYm8z?=
 =?utf-8?B?a1ZVQy8wWUNtbU9aaG9PSjd5Nzl4VTR6WTF3OVMrNHM4ZUVadzBobGVNZFJt?=
 =?utf-8?B?K0dnamNTbFE2U3dxS0Vrc2xzQkNGZjlUNUFEOHYwOFhQS1Y4TjNyMjF6U2Rw?=
 =?utf-8?B?SXZHcjRMZXVxR0RjNkhCSm52MkxzeTRXNHFTdm10Nk00Y3V5TEFSNXBOVDU1?=
 =?utf-8?B?UWl5Y0dXbUlsRXZjdHB1bGx3Nk85NnQwREhQYis5Z2tPbjBuVnpXRnNpRDFL?=
 =?utf-8?B?SEk1azdwZmRldzlzbmU1NW95YTFCRFBGRFFNNUNGMkZyRUx4RGRYNG91SUd3?=
 =?utf-8?B?RVM0YVR5TUc3andOd0J2d0VPOEpMYUh5dFlsdWNaY2V4dzZySDE1Zz09?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e9eee27-c4a0-40a4-3b53-08da220ed633
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2022 14:13:54.7258 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: isCXzZ7pGvj3pDLEd2PIG1ji7CY6ausECPkaWsN3P06cBpuvVOyB03aonil4uPKE6EWAc7V8/59nsK7TPHoD9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2865
X-Proofpoint-ORIG-GUID: HLj-IMppU42ZbC1cHJZplarHQDTl5cW-
X-Proofpoint-GUID: HLj-IMppU42ZbC1cHJZplarHQDTl5cW-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-19_05,2022-04-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 bulkscore=0 spamscore=0 mlxscore=0 malwarescore=0
 mlxlogscore=999 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204190081
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
Cc: linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org,
 x86@kernel.org, hpa@zytor.com, keescook@chromium.org,
 alexander.shishkin@linux.intel.com, catalin.marinas@arm.com,
 dave.hansen@linux.intel.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, bp@alien8.de,
 svens@linux.ibm.com, jolsa@kernel.org, namhyung@kernel.org, tglx@linutronix.de,
 borntraeger@linux.ibm.com, will@kernel.org, linux-riscv@lists.infradead.org,
 paulus@samba.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 4/19/22 21:09, Mark Rutland wrote:
> On Mon, Apr 18, 2022 at 09:22:10PM +0800, He Zhe wrote:
>> Currently stack_trace_consume_fn can only have pc of each frame of the
>> stack. Copying-beyond-the-frame-detection also needs fp of current and
>> previous frame. Other detection algorithm in the future may need more
>> information of the frame.
>>
>> We define a frame_info to include them all.
>>
>>
>> Signed-off-by: He Zhe <zhe.he@windriver.com>
>> ---
>>  include/linux/stacktrace.h |  9 ++++++++-
>>  kernel/stacktrace.c        | 10 +++++-----
>>  2 files changed, 13 insertions(+), 6 deletions(-)
>>
>> diff --git a/include/linux/stacktrace.h b/include/linux/stacktrace.h
>> index 97455880ac41..5a61bfafe6f0 100644
>> --- a/include/linux/stacktrace.h
>> +++ b/include/linux/stacktrace.h
>> @@ -10,15 +10,22 @@ struct pt_regs;
>>  
>>  #ifdef CONFIG_ARCH_STACKWALK
>>  
>> +struct frame_info {
>> +	unsigned long pc;
>> +	unsigned long fp;
>> +	unsigned long prev_fp;
>> +};
> I don't think this should be exposed through a generic interface; the `fp` and
> `prev_fp` values are only meaningful with arch-specific knowledge, and they're
> *very* easy to misuse (e.g. when transitioning from one stack to another).
> There's also a bunch of other information one may or may not want, depending on
> what you're trying to achieve.
>
> I am happy to have an arch-specific internal unwinder where we can access this
> information, and *maybe* it makes sense to have a generic API that passes some
> opaque token, but I don't think we should make the structure generic.

Thanks for thoughts. I saw unwind_frame and etc was made private earlier and
took that as a hint that all further stack walk things should be based on those
functions and came up with this. But OK, good to know that arch-specific unwind
would be fine, I'll redo this series in that way.

Thanks,
Zhe

>
> Thanks,
> Mark.
>
>> +
>>  /**
>>   * stack_trace_consume_fn - Callback for arch_stack_walk()
>>   * @cookie:	Caller supplied pointer handed back by arch_stack_walk()
>>   * @addr:	The stack entry address to consume
>> + * @fi:	The frame information to consume
>>   *
>>   * Return:	True, if the entry was consumed or skipped
>>   *		False, if there is no space left to store
>>   */
>> -typedef bool (*stack_trace_consume_fn)(void *cookie, unsigned long addr);
>> +typedef bool (*stack_trace_consume_fn)(void *cookie, struct frame_info *fi);
>>  /**
>>   * arch_stack_walk - Architecture specific function to walk the stack
>>   * @consume_entry:	Callback which is invoked by the architecture code for
>> diff --git a/kernel/stacktrace.c b/kernel/stacktrace.c
>> index 9ed5ce989415..2d0a2812e92b 100644
>> --- a/kernel/stacktrace.c
>> +++ b/kernel/stacktrace.c
>> @@ -79,7 +79,7 @@ struct stacktrace_cookie {
>>  	unsigned int	len;
>>  };
>>  
>> -static bool stack_trace_consume_entry(void *cookie, unsigned long addr)
>> +static bool stack_trace_consume_entry(void *cookie, struct frame_info *fi)
>>  {
>>  	struct stacktrace_cookie *c = cookie;
>>  
>> @@ -90,15 +90,15 @@ static bool stack_trace_consume_entry(void *cookie, unsigned long addr)
>>  		c->skip--;
>>  		return true;
>>  	}
>> -	c->store[c->len++] = addr;
>> +	c->store[c->len++] = fi->pc;
>>  	return c->len < c->size;
>>  }
>>  
>> -static bool stack_trace_consume_entry_nosched(void *cookie, unsigned long addr)
>> +static bool stack_trace_consume_entry_nosched(void *cookie, struct frame_info *fi)
>>  {
>> -	if (in_sched_functions(addr))
>> +	if (in_sched_functions(fi->pc))
>>  		return true;
>> -	return stack_trace_consume_entry(cookie, addr);
>> +	return stack_trace_consume_entry(cookie, fi);
>>  }
>>  
>>  /**
>> -- 
>> 2.25.1
>>

