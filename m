Return-Path: <linuxppc-dev+bounces-403-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 578C195C1F9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2024 02:08:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqgQG6kNSz2yQl;
	Fri, 23 Aug 2024 10:08:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=205.220.178.238 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724371702;
	cv=pass; b=J502nAgQX+0tkpBC9dQy4oTOeq18hbmXcIURCUfFRnshTbcDw1tUQrlW8uBbyzRmsmAwisxs6SE2qCmu1CAFFLMjuE1qTU08Uws9SnuA8M56MuyjO7vsL2QUvnfEvpQn910aivcWL12atrt7SzsIbk+bgtht+4BM6N0hf48YoNYXtQUpSGdwMXbQhIWV/Y6rlRtAW4KivCug4+oOdDpb2jIh4YGCk2q8thurWHP3+rKgldratKMhk8qByuqVRZOiIyZjVZnNHNdHOzLlqrT+XMViYP/DIXN+j8QiKMyO9xD+zdlldhDMFEQzfbg7JxpvQ4F291Pe/myUQAPQubPKmQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724371702; c=relaxed/relaxed;
	bh=eISFEs7UKtv1YQ6ZmuLaorNIG1FAb6jdGeBiyFcgTfs=;
	h=X-Greylist:Received:Received:ARC-Message-Signature:
	 ARC-Authentication-Results:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass (client-ip=205.220.178.238; helo=mx0b-0064b401.pphosted.com; envelope-from=prvs=8964df137d=xiaolei.wang@windriver.com; receiver=lists.ozlabs.org) smtp.mailfrom=windriver.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=windriver.com (client-ip=205.220.178.238; helo=mx0b-0064b401.pphosted.com; envelope-from=prvs=8964df137d=xiaolei.wang@windriver.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 1699 seconds by postgrey-1.37 at boromir; Fri, 23 Aug 2024 10:08:22 AEST
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqgQG1Gslz2yGD
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 10:08:20 +1000 (AEST)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47MNOGbu011815;
	Thu, 22 Aug 2024 23:39:38 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 412ju6wxcn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Aug 2024 23:39:38 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h18wcQ1nOFislx4GNvgHLZP/oyeFvXgxewXcHI6rgyKDLskIgTphqdyeF9+WfRvrqki5EbL7EcOYxHMB86iG+QOo0A7FGONwXvb0ZSe4ZwcFSopOeHK8bEzB08LvNRIyXRfe3+AHsYn4UyjBXNWdEkSBEqc7/r4qFF9sISYttwuvNuQEH/xGWDxjFKXqHazWGYg3r2sD9THMRJX79sJAbm4a/eKTEZGc/RBntOEuYwBZGqFyyPnbva0ZKH+g8MU0OU7/fqO9HXhRfIofD2BGL57+GwnGs+cbOr5eROKhu7CPQcnrUQQQDvvfj+UEliqFyqDiHF7q0uwJYwJj6PToRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eISFEs7UKtv1YQ6ZmuLaorNIG1FAb6jdGeBiyFcgTfs=;
 b=P8H8kpaCk/IVX1yNqmUC0ewxB4HetIWjxZoKqj+157nfakLIJ3eMMwpRGBevKwex+PCaLBozdG6/FJULBIgrWkfWWuwpkosg/M+wmblyglktCJfLzXKBIbJYi+I/I3qbaxaRHjR9tK+JSsEGgHAZPt+uUvRYpWC5zmEOxjIYbPr779MKB9su3nuDa0yRo09EEAZ74CcoBMoenQZZkXUaUjkXRCxM46/hcwgJ3w5oEdPCu2d6KEp1RsJiPQfFRXqQPXh9a3J0prcAhFu8oKiNW/Wav6fD5dyXkzvNT9XEmIVV24u9PFrA/1hkgd43GoiDDLN+6XxNbi2g1QojUwByiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW5PR11MB5764.namprd11.prod.outlook.com (2603:10b6:303:197::8)
 by SJ0PR11MB6621.namprd11.prod.outlook.com (2603:10b6:a03:477::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Thu, 22 Aug
 2024 23:39:35 +0000
Received: from MW5PR11MB5764.namprd11.prod.outlook.com
 ([fe80::3c2c:a17f:2516:4dc8]) by MW5PR11MB5764.namprd11.prod.outlook.com
 ([fe80::3c2c:a17f:2516:4dc8%6]) with mapi id 15.20.7828.023; Thu, 22 Aug 2024
 23:39:34 +0000
Message-ID: <4e7d4ed7-049b-47d7-8502-7f9d0bd9c196@windriver.com>
Date: Fri, 23 Aug 2024 07:39:28 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: fsl: qbman: Remove redundant warnings
To: Christophe Leroy <christophe.leroy@csgroup.eu>, robh@kernel.org
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20240802021651.3854295-1-xiaolei.wang@windriver.com>
 <3241a692-088d-4316-85c9-f2939a9179b2@csgroup.eu>
Content-Language: en-US
From: xiaolei wang <xiaolei.wang@windriver.com>
In-Reply-To: <3241a692-088d-4316-85c9-f2939a9179b2@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYAPR01CA0059.jpnprd01.prod.outlook.com
 (2603:1096:404:2b::23) To MW5PR11MB5764.namprd11.prod.outlook.com
 (2603:10b6:303:197::8)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW5PR11MB5764:EE_|SJ0PR11MB6621:EE_
X-MS-Office365-Filtering-Correlation-Id: c600db5a-22e3-499d-8a31-08dcc303ada0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VGt1RHlPS2F0ZVpWNDduUXZJbGFJSnhYSVlMMlJaMWk1cWwxNlpJbmIwWnFu?=
 =?utf-8?B?b2I1bzgwV003V2tlcHdiQzVTdnpnSklGaTRYd3Eyc2NSQldMM0pWQVMrZGpy?=
 =?utf-8?B?L1BpUytiMEZsMiszcEdDekM4Ujkzd0dWTnZiQVVkWUlIdWpXSUlSNTBpYzFk?=
 =?utf-8?B?WXEwOUpyYldRWDRaZlQ3d1hwbFZLNmZobFh2Ull2cDJ6azZ3alo0dXFaZFdk?=
 =?utf-8?B?YUVvK3B0K2NVYi96SFFsemtBdzhJOWYzdmtKNlRONjRQdmRPbFhXcnF0ZVF6?=
 =?utf-8?B?M0oxZXVpVnF3QlRlNkhVR3pZa0RxUWRlOW9sbldNSDZHVjlDTlZpYS9ZNjRH?=
 =?utf-8?B?cFBIY3B0VnZ1dDY5b1F2dyt5ZnA3N0ZJU2lsYlJ0ZUVkOWoxVzVkWWR3N25S?=
 =?utf-8?B?QWQwVWdBWVNNRHZuM1R3b2R6UFlPVnFxZElGUUs1bHo5OWxPdm56SXNFVEdq?=
 =?utf-8?B?WUlqcWEwTXNnZ3RFRWtIYzh2dEZCMGFvTEJEdmtRTlc1QVZQZXFPVEp6Z0hl?=
 =?utf-8?B?SWVBanZ2aXcyc0t4UmNob2tzUkJ1ZWJ3NlJqbWllN1B5NHQyQ2lIRDFtN1VQ?=
 =?utf-8?B?R0dVcjluUFhrOExHQnQzUHB6S1dxZUhmNmVOT1hXaFl4Wm5rSkhVUFZCTFQx?=
 =?utf-8?B?c2dzcFRGWStPemwrdFFzeDVtc2E0YjdwOHNDWk1nNnB6TnVFaEVhNFFBUk5a?=
 =?utf-8?B?VzZHMm83cjFldEVHdXdCZ2hRWFdkRlc5YzZvMkRCdVZCTi8zVWgxTDNkcWNq?=
 =?utf-8?B?Slh2M051ZGoweit3M2dMSXNvRnR5dEdMVHR4enNxa0FEMFcxWGdXQ3Rod1lw?=
 =?utf-8?B?cHlqU0hubDJxM00yOCtaOWNlZEc5a2tJZFVwZ2pRV2pubE5mbnpZRHJiSmxq?=
 =?utf-8?B?Q04vTGtPZGxnZXROM2QzRU1MWVFjWGx3cFdRSlJkaW1jU1RzQUdneUJJTWJi?=
 =?utf-8?B?bkEyTUJibm9PS0dlQW42clJEZFAvK29LU3V6STFBYkcwTThIa0h1MXc2SnBS?=
 =?utf-8?B?MTJ1c1B6eHBndWtkeUpNQUh4QlcrbXBCMVVDTS9JUlp4czZyenJJcUpPT3Zo?=
 =?utf-8?B?MjZZUUp1MGRtSFNLbXVyQU1XeXRDMDlOTDh3Y0d3dmlBaDJ2TlYwc1Mzbm5r?=
 =?utf-8?B?YkZaN291ZjhOUVhGTGg0bG5LSTQ3YW9ZUCttbnJkWm5XYysrdWpOSmxiMCs3?=
 =?utf-8?B?am5wZ0ZPUGYrSmNNOUJHWUJ5d1pra3hNMFYyUkRGcnEycmV2UGlMYmZYeS9J?=
 =?utf-8?B?ak5LVXg2N0w5UG82cjJVUUYzazdRekJ1UDU5TjdiRnBTZEVGdWVzN0NmQ2VG?=
 =?utf-8?B?Ny9EM3pSL2hmTjBJZ2N2bGUvYjZaTjd1bmp3VEh3d25sUkp1bVNHcldGL3o5?=
 =?utf-8?B?TjBZTTNGa1E3L2ZLeWlpQzFnbmdZN3lwWW5vN3VoTjIrRGpTcklJckFqb3ZJ?=
 =?utf-8?B?MDczREVDV3VXWlJ6KytPcTNoMHN0aEZSK0tqYXU1Vk16TmNyY0FmUlRnZ25X?=
 =?utf-8?B?VXFXWXpQT1ljSFZNdzlKaE5PeXZ3RjZzUTRZbFBLVGlZM3V3VHlnbVdMVnNm?=
 =?utf-8?B?SUVMaGNla0tPei9sSGtjTXgxSDdXcGR2dkdCVTVaTTJ1cDlaRy9JOEV4WjFT?=
 =?utf-8?B?dSsxUXhZTWp5YjBxQzFXUnQxaUhEV1l2NDNXcDlhK1A2VVE4M3pmYytTUGds?=
 =?utf-8?B?TkxqSUQwNkpOTCtjY0UyQzdYQnMxN0ZFTThJL21FVmtoeWI4cTNvWHFzcndv?=
 =?utf-8?B?eTJqWkxZQTZIcFhoZFdOTXoyTDJuaDEvRFF6UHBnN2RvaE1HeFJ2ZldTdm15?=
 =?utf-8?B?RmRzRE0zakx5L3l1d0hnUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR11MB5764.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d3pBWHFVa3FXd0pWZFR0SWx0clovdnN5VENzeElDL0JpbkZjait6Njhhb0VE?=
 =?utf-8?B?NS9KMEJJUGdFS0hVSnJKK3FrZjV5REo1M3pjNGEyUW1uTk56NWFwM1dZd1p2?=
 =?utf-8?B?V3NvMXluUzJrWjJ0LzRMQnZRVjUzdDJmTUJFNy9nSDB3Qy9jNE40UlNrem1Y?=
 =?utf-8?B?aWVKU1oxcmJ5citMK0NVYStWVTlzSGxjTytyNVBHZjI2VVhvbkUyTERVQ2tu?=
 =?utf-8?B?bHZGZFFHT2RuNDlXS2ZVUFZkUU9qdUpQRFRFazlnZk1oRUhSblFaNjI1WEZF?=
 =?utf-8?B?NS9yNkxZU0hqa3R2S0xwOExlTXJlcE5jcFhmd0RJNE1sWWp3OURUcndOd2RE?=
 =?utf-8?B?Q3d3ejY2YklPK0R4bWFzR3FDOVQwYjJJYllqSkdNaFFjSm5CM2JtL2xhUEIx?=
 =?utf-8?B?SVFQc1ZIUC9TQnU1MlZNUnVWeiszdDUyMFJST1pQWStLaFhCaEZKT1laenY0?=
 =?utf-8?B?ZDhobldTc1pHdVBuczhTN281bGJmK0JIOFNUdVhWSXFSeHVoTFBoMWlUWnRx?=
 =?utf-8?B?RktmSEEwS1NMTkdqdXdQckVqVktsZ1lyWGlYY3BPc1RkLzBxTUQ0STV5em52?=
 =?utf-8?B?UjE2Nk93QU56eURRKzE4K2t0U2tQVWxVNzZ1VmJlb3h3ZEg1aHNkRngzQVNk?=
 =?utf-8?B?dUpjOG9TYVBGZWVET2dQdTVVZ2tkVEZncHlXZ3VIZlIzRFZDNEJkQ0FlSElm?=
 =?utf-8?B?U2NwVlBCT3YyTlhpZUx6MElVdWlkcS90dzRPZ3Z1eG5HdVBQVG41WDAxVXc4?=
 =?utf-8?B?UFd5YStFNDgzQUwyS0FDQVpMSy85emw3MisxeFprUGExSzN0bGNnQVg0dHNv?=
 =?utf-8?B?ZWprTXVvN2pCM09oazUva1NYbXl0c1pqYSsvSlZsVGFkT0JVUU9xM1hqcWxF?=
 =?utf-8?B?ZkZPVHU2U005YkxuTnUyUGZpNFlUckdXL3ZPSTBjeldaNzYzVkxPeUYvRkFE?=
 =?utf-8?B?bllQLzNMeXRTbUx6WS9xbTF2OTBKYnJVMndJOXNENmFEbEJyckNjdnJuMWdG?=
 =?utf-8?B?NVV3OEZ2eWdyOHB5V1JNbTBMaFNxUGZwUnB2VEpTdmROTThZRnpGUjJDemsr?=
 =?utf-8?B?QlRqQ2wrQ0hNVTdXNnlmL2oxYlN2Y2dnRXV0TTFXalVZTGU2cTNMbzV1a054?=
 =?utf-8?B?VWJZUllXUFp3QzkzZEQzL2dlcFhwMWZsQ3FuMlU3R1BRR2RoRU9xalBEazk5?=
 =?utf-8?B?MmM0QmpURGtxaXpOS1lJVHVwaXgxNUV6VnNBQWw0bEl6dkg4b05lR0NocDh0?=
 =?utf-8?B?dW9FN0VjMkh1MkRMQkNZd0M4L3FleGRnNFVUdjllUjdoUTNBdU5lWk0zVWVT?=
 =?utf-8?B?ck1mSjNoMkVjUGJTR0pDMU9NZEpKaE1ITCtmS1k2R05aWVU2OHU3aEhOOUhX?=
 =?utf-8?B?VFhNYnJLZDV1bGJZZURqTW1kOEFoKzRxM29SQTZQNTFYMjFORk13cXlvby9z?=
 =?utf-8?B?QjNOeHllWndIN3Zkdk4wa3FpMVYrVXdnUVV5dnlPZDgzNGlPZWdXNm9Kc3hC?=
 =?utf-8?B?WlZTSmd4WG92RldFaDhQRXNHU0dMUFBscmJZZGJMRlNJM0JXN2o5a2ROUHJ3?=
 =?utf-8?B?dEs1dmFMaWhHbzBzeUFyL24rL0VUekFTY3RGcWVFdlZLYmxYaTJKT1B5aEl4?=
 =?utf-8?B?cUxiY2ptaHppZXNLWFZuc2JzR2xkdWZtVTZLckVFOXBpdEpNaXVWSTA5Z3NL?=
 =?utf-8?B?eXBVeUZQSkZqK3lyaVk4ZW5aRDFIOURFcUtLVGYweGtmTkxnSndrcTVKbnVx?=
 =?utf-8?B?TnExQ2xmdTVZbjZ6a2VBNUF1YjFRbVBacmNwRjNJa1JnQkZhNjBjWlB0V3Az?=
 =?utf-8?B?bWtQQ2JwNGQvem13elIvd1Axc2VvRHkvK3dKV3NlRnpxZTBOdGg5V1hWSHE3?=
 =?utf-8?B?MWx6Q2srWFBUN0ppeTdMRnpDb1NQWlJPSnpZWGJYNzY2YjdBUVlmZTU4Vzd3?=
 =?utf-8?B?R09UVm9Ob2JKLzNLLzIyeG5oaEdHeDIvVlBQOVpSWTRXbkFWV3krMVVzQWtV?=
 =?utf-8?B?UkVsWWNMR3l1VWpTdWovTUtWMEV5WS9ZZVoweW9BYkhQanFjRUYyWkFLK1RG?=
 =?utf-8?B?Q3hIWGM3elA4bkZXSXBiT1dweXpLd3ZUd3pWRWpxcm9HM3FxaVJCd1FmVkg1?=
 =?utf-8?B?d0dicFFxSW9xM2ppakRhZjRITGhzYjFGWVRZNzQ3MlhvS1hFMXo3UThBR01Q?=
 =?utf-8?B?WXFCeVNCWlVjYWMvV0YxYkhQS1NBRGpld1NVYjR0RVEvcXE3TFkvRVdoam1L?=
 =?utf-8?B?YStqM3VZYmtrSjVBbC9pOVdvSDNnPT0=?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c600db5a-22e3-499d-8a31-08dcc303ada0
X-MS-Exchange-CrossTenant-AuthSource: MW5PR11MB5764.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 23:39:34.6869
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7rKkT4H6K8Sks0OsezRQbAzvduqiyeRuGVNga064870i6V87mr7m+Lqt55w+kGYf4M6vd857m3lomb1NbW6/U2yKoZSx2LICiGfwqLJZ3uw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6621
X-Proofpoint-ORIG-GUID: TlmkyfuUMDLFyIfJ1AmCqgOVsABYxTkp
X-Authority-Analysis: v=2.4 cv=VdWlP0p9 c=1 sm=1 tr=0 ts=66c7cc3a cx=c_pps a=vIBLTX18KUGM0ea88UIWow==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=yoJbH4e0A30A:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=_EeEMxcBAAAA:8
 a=r2w2zTtO5Mu2xhSWNFQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22 a=syqr5EOPB93U0NEwqYpB:22
X-Proofpoint-GUID: TlmkyfuUMDLFyIfJ1AmCqgOVsABYxTkp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-22_16,2024-08-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 phishscore=0
 spamscore=0 malwarescore=0 impostorscore=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408220178


On 8/23/24 00:55, Christophe Leroy wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender 
> and know the content is safe.
>
> Hi,
>
> Le 02/08/2024 à 04:16, Xiaolei Wang a écrit :
>> [Vous ne recevez pas souvent de courriers de 
>> xiaolei.wang@windriver.com. Découvrez pourquoi ceci est important à 
>> https://aka.ms/LearnAboutSenderIdentification ]
>>
>> RESERVEDMEM_OF_DECLARE usage has been removed. For
>> non-popwerpc platforms, such as ls1043, this warning
>> is redundant. ls1043 itself uses shared-dma-mem.
>
> Can you please explain in more details ? I don't understand what it is
> redundant with.

commit 07f86917a450 used shared-dma-pool for QMan private memory 
allocations and

added this warning, but this is only for non-PPC platforms and using non 
shared-dma-mem

reservations. However, for non-PPC platforms, commit 3e62273ac63a will 
output a warning anyway.


At the same time, ls1043 already uses shared-dma-mem, so is this warning 
still necessary?


thanks

xiaolei

>
> Thanks
> Christophe
>
>>
>> Fixes: 3e62273ac63a ("soc: fsl: qbman: Remove RESERVEDMEM_OF_DECLARE 
>> usage")
>> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
>> ---
>>   drivers/soc/fsl/qbman/qman_ccsr.c | 2 --
>>   1 file changed, 2 deletions(-)
>>
>> diff --git a/drivers/soc/fsl/qbman/qman_ccsr.c 
>> b/drivers/soc/fsl/qbman/qman_ccsr.c
>> index 392e54f14dbe..aa5348f4902f 100644
>> --- a/drivers/soc/fsl/qbman/qman_ccsr.c
>> +++ b/drivers/soc/fsl/qbman/qman_ccsr.c
>> @@ -791,8 +791,6 @@ static int fsl_qman_probe(struct platform_device 
>> *pdev)
>>           * FQD memory MUST be zero'd by software
>>           */
>>          zero_priv_mem(fqd_a, fqd_sz);
>> -#else
>> -       WARN(1, "Unexpected architecture using non shared-dma-mem 
>> reservations");
>>   #endif
>>          dev_dbg(dev, "Allocated FQD 0x%llx 0x%zx\n", fqd_a, fqd_sz);
>>
>> -- 
>> 2.25.1
>>

