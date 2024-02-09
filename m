Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A45148500B9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Feb 2024 00:24:55 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=PiQhf/tH;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=e2f2Mr57;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TWqh53xDFz3cQT
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Feb 2024 10:24:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=PiQhf/tH;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=e2f2Mr57;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=jane.chu@oracle.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 2834 seconds by postgrey-1.37 at boromir; Fri, 09 Feb 2024 18:30:23 AEDT
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TWQVl397Tz2ytQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Feb 2024 18:30:22 +1100 (AEDT)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 4194wjht031897;
	Fri, 9 Feb 2024 06:41:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-11-20;
 bh=JFrTmGH6izMHm8hF5fVab+OC90BWP/wiE/sG3HL8oZE=;
 b=PiQhf/tH+jHkBbGjRKLT5zh7OG2xYdzVrbfu8tHL55VP/xWd6GNzJRGameSHwM+VeTEc
 OaKYb4xNkpf68HsKqzFSaMAgmzuhfcGHleXcAjunv9FpFXQgxugc/XPiVVdXD5GqpfCb
 +dkrr2hTk8geD1fzousZvVBPWbAMsgoMjdvBtTLSRJ69LRQq5tHb6Xe/Qvg8zyx630WB
 u5HCfrlAgU7nf9fJjgnXzMIEmkQWxoyCimQBC0EGwglGdL1xcPyrEcwGHPPIgdNPZkLZ
 1GGbsJ4ofbWkFEC/gETa0uxujb15JcWZl/9hcg9QQunO0sZpi1sau+YTWfxIV7L0M50w Pg== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3w1dhdpsac-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 09 Feb 2024 06:41:32 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 4195UbQQ038296;
	Fri, 9 Feb 2024 06:41:31 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3w1bxbqy5g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 09 Feb 2024 06:41:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kq19z0Ate0AeefytD3pEthwO4vU7D258Fkw5bsk/Ma9U71osrWjHbSjjb5nskmIN74KpP5x6St8IvczX+NShRe6XubOqesymPiRBpxLc+DPaGSqLVWsiNY3HOqscFpRMJQI1aKYwDejgeHT1Cq6SkuvAhBlfDFPvpJbmsyMcVGEHvwjhU2iq3UfV1aiRBXzC5OzcwHA1C+dL/m6x+5n9OoAOiOEWQ7AMGnr3ZatwhFm7x0dul4TjDsIbS43nFdqcX8tIERHFKp+zReDdZOu1LG9JbVnxXst5qjCcOihq7J+C7VLGpTJjBlS1Wco3zDa+dhM9yOCg6JRmKPjGyI2ApQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JFrTmGH6izMHm8hF5fVab+OC90BWP/wiE/sG3HL8oZE=;
 b=bWfR/32U1xr8c1Cq32yU9612MiFVYNQJzUDSIuTHDVOnKMgYI0rbD4cyWcQVTuXnekUMyPodmYwE3PKCTsJGERHDwPtvJBZseOsIoGsTaDSN6K3UfwxgF5lpMc2rqBz312/k1mnb5HUZNjx2cv5MakiIBPe+JMwEyVcTBjKoUKVMkMUlKm4ooqsJZ6cfxgqNn2bn/E98jkQ8AcmGcBjU5GOWS1VzDRXbj9xYpgtWEviChdzprJSHrWclpDFrZcXRX8AHQMgkmZs5lK3Lw2JkiWHjabiM6PryrpgmnH4mjyfZ8IAnmsrTSCgg4CAKMnTF4kR61eyyZcmCdIilwaEI4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JFrTmGH6izMHm8hF5fVab+OC90BWP/wiE/sG3HL8oZE=;
 b=e2f2Mr57E4I0wBoxpYmqrMyCo/6GjlZz232bqR+o8tbiravm9e0kUSEXfI9/aVbYM3N47VPBUUVtNV+6QuTeZaPG8dFnKuRXrke70lBfBrhDdPLmIvMqpZdtCGfe9uJ2Cz60g2nuqs4xlK3S9VKQWtNf1oZB7bEkLuH21yZ+YME=
Received: from SJ0PR10MB4429.namprd10.prod.outlook.com (2603:10b6:a03:2d1::14)
 by MN2PR10MB4207.namprd10.prod.outlook.com (2603:10b6:208:198::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.25; Fri, 9 Feb
 2024 06:41:28 +0000
Received: from SJ0PR10MB4429.namprd10.prod.outlook.com
 ([fe80::210e:eea7:3142:6088]) by SJ0PR10MB4429.namprd10.prod.outlook.com
 ([fe80::210e:eea7:3142:6088%5]) with mapi id 15.20.7249.038; Fri, 9 Feb 2024
 06:41:28 +0000
Message-ID: <75803311-29fc-42ab-9c39-0b18cf875347@oracle.com>
Date: Thu, 8 Feb 2024 22:41:23 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/hugetlb: Move page order check inside
 hugetlb_cma_reserve()
Content-Language: en-US
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org
References: <20240209054221.1403364-1-anshuman.khandual@arm.com>
From: Jane Chu <jane.chu@oracle.com>
In-Reply-To: <20240209054221.1403364-1-anshuman.khandual@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BLAPR05CA0034.namprd05.prod.outlook.com
 (2603:10b6:208:335::15) To SJ0PR10MB4429.namprd10.prod.outlook.com
 (2603:10b6:a03:2d1::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4429:EE_|MN2PR10MB4207:EE_
X-MS-Office365-Filtering-Correlation-Id: f76c8ca8-f50b-49f6-7543-08dc293a24ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	z9nJBodygirMDUrLMtquhzcT1MLLLaaBwca7goJRbWv7Y5hACuG/eKNQ1jwbIbeU7NuaDFoVKGFMBVgNXbg8gF9/FAU1AQk74DulSy2fJdpCCBab3bKe0tL0MgEW7tyTrSvB6HseBesvYgDHORSB3i8P7nUabgx8q8K/27I49A2fXNmkMLqrTqnKEG12pczRetoctffF51hfpZeKHIQVbW/sJRcR8ZyY4UHMSLwgznyUy22BExhn4x6Xb2C1Q8fjabtJgJbIcA5kdBLhEgZZvVnj5Kx08vG5uSLKdc20Z9XMlJhWdA4tgcEbIB5Rvk2S4FmNc17tpGhdmXK3pzJpQ8FCJ43dnd+Jt420y1DxFcEpknX7GxqR9k5ZD+kEXoYWhXhXK8/rv2jodDRefvdJ+iYdVc+aN+L2nVj3qeHAAOBSGObj0KUKN9O7wNr5giCYX69zIeg34XIseZBUfhBlbaFBWYux2jGA5siQ2/1vAyPyoC+V9P964AsZilZkupQCjQ7VHh0FqQ+88OLUed82aXdisJlTAJSiJED9TuCGtSQ62CAbk8Pv+BEln/0YYgaD
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB4429.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(346002)(376002)(136003)(39860400002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(83380400001)(31696002)(86362001)(54906003)(6486002)(478600001)(6666004)(316002)(53546011)(66476007)(66946007)(26005)(2616005)(66556008)(38100700002)(6506007)(6512007)(36756003)(44832011)(41300700001)(8936002)(8676002)(4326008)(5660300002)(31686004)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?bERBRjhaWGgzbEFVSVhBTHdTSFlaYjFMREZMN0k3dTRQREczMjhDU29YUnov?=
 =?utf-8?B?ZWpNSkxNc21tVGJvT1RsdVVSd0ovMjZZdWZCSjhGd3JmZlhKdUxhLzByK3FH?=
 =?utf-8?B?MmhWUzB6K0hZSUdHeTRUcXFlc0l0TnVMMkpaZFlIRHBqTmhRbm1hcW83aFFW?=
 =?utf-8?B?WWVoUHJ3MVFram9UREhxUXhoeVlNdzlsbGR3akpvRlNCeVdmcWM3MFJOakhw?=
 =?utf-8?B?ZWt3TGF1Q1RYaUp5dkNlS1VPSitLeDJBcytlSkpwclBCMmgzbkpiZE5VM28x?=
 =?utf-8?B?TjNyalpDNUVkbC9YOEp4Z2pKbGFqdHZ4RisybGh0RXF3TnlCWEFvbkJOVVBU?=
 =?utf-8?B?c2hQcDl0M2lRTkNjbFptRFpoN2RSMXVjVXFFMTkxZzFiemtlZGN6ZTdPUzhq?=
 =?utf-8?B?QlF6SXZoMkxrS1RhTDE5cERINnFBRFZxZG8xUjdYK1BJZ3A1cXRpNmpZdEl1?=
 =?utf-8?B?dEFkRTRLUFppUE9BVjZtNGlUZ3JWaXNiblJ6QksrV2k3SkwwUUlYM05MUDNz?=
 =?utf-8?B?NTI5SzJaTXFMbGw2UGh4NmE5bTVRUEh6ZmNFMTVFRk92ZnZLZDZIMm12V09o?=
 =?utf-8?B?SGFFWHlGT21YWjZITkdsWXVGWm8wLzliYm41cUpTMmRDMHdyWHdSaEkzbTJy?=
 =?utf-8?B?WUdJbUF1SnpJQ0VENzRwZFJ3SGh1NjlsbkpmaVhHYU5ScVliekNvWm9xQzFv?=
 =?utf-8?B?U2NCMDV2L0pVYXN3UGVrU0MyOENRRWxQcHNhV0dibm5CSnVLT2dUckh3Vnl6?=
 =?utf-8?B?VlZoSWFiSm82ZVRVaVNHZjN6bHVmMkp0cWlpbUhodllqTURwUklCamNrcVVK?=
 =?utf-8?B?SlBHaVVLbUY2VHpiTmVhd3RKajFxc1VBdzV6VXRSMkduRzJOMm9saXdJcURl?=
 =?utf-8?B?YVE2UjUyalhTNHJ1MDRCeDZZTWJYL0lJc2FFWjMxYVBBWlZLTEUxYVhjM3lv?=
 =?utf-8?B?T3kwUm9rWHQ5akZ4YitsbTBnekRUcDJ2WVZPSUsveExPZFR4ZDNUenArSzhS?=
 =?utf-8?B?c2o2dTVSd0p5UXEwaE1qUVJ5cDVuR01mSUZRQUt5ZG50dGhUcnFnV3VyYzBK?=
 =?utf-8?B?K0VmOElrUldZOEtTZzNJYVlvTXU5K3EvMkRheVI1NmRIMUR1VkxJVTNkdCtM?=
 =?utf-8?B?Mno3NmtZdVFkWlV4a2haK3FrbmVLNEdWK0VrUUhYQkhHcklOa293MGVNWFZZ?=
 =?utf-8?B?ZTZFZnlVVmwyQTdsZWZnV3VqV3VGemFFUFo2WkYrY01QaVZoUGRBblhITUpL?=
 =?utf-8?B?OENFUFMyVnhxTVFhYytuWUl5eEd4RWlXUWhJRFg5TnRENER0bWFTcHBHSzJG?=
 =?utf-8?B?eG5uV3ZzN1Q2ZlVhK1hJdkxDejdpUlZ2RkV2cjNSNnRiMFVRbUI1VDFCT0VK?=
 =?utf-8?B?VmN0bHdqNndvM0haT2FSaTVmMm5nTVFNZGRUY3UrZFU3aTdsMnpXd3hxUGRy?=
 =?utf-8?B?TnlIL0xoWTRxSkFGM0dESkJpRUtoTkg0dHhiMlhTVTk3WDlheVlibFg0TGl3?=
 =?utf-8?B?R2ptZHh0azVwRmRMM2pBSHd3eWJHSFVqN1dSN0dKWEUrekZtQVdPZXlxd2lI?=
 =?utf-8?B?b1VIa3pMSXJqMk5OZW1LaGh0a0dzUjdrL2VRRUdDcm1GVVkzeTFEWUF6QmRz?=
 =?utf-8?B?cGFEc3ZxUEI2M29xajVMNHBJcVF6VW5rdUgzUmVTU0pjelEyRXB4VWhrcW9k?=
 =?utf-8?B?QU1jbTBqTVlUS1ppQ0pIcWJ2S2Y4ekZXMmZuM3dOUU1TcXUwbkF3U2Q0WnZv?=
 =?utf-8?B?NVlTOGh4V1F2bEFBcGpsSjdGTVpCR3pwY24xQjZTWlVoV2V4dnR6bENvV0R5?=
 =?utf-8?B?alhZMWpFRURsbGx1TlAzcnBMbkJ2b3A5cDh1Q3FxaXgyZXl6L3lkNEluN1dF?=
 =?utf-8?B?dy9YQ0N0RUJDeGtEa3luanVOWDF6NzFOTmxsVXcvMm4zNDE3TUphclV5WDJm?=
 =?utf-8?B?U2V6KzAycXl6S1ZZN2dmZk9mS0tRakdyRWIyZm1tZ21pVGc4YkhaRUtnTFFL?=
 =?utf-8?B?TlE4VHFrb3A4dTBhdWhSbEJud0F6L2JmVnhDQ2FiSm14WHBQQnQwdXNHb0Fv?=
 =?utf-8?B?SDZxYTZJaXdtWnNIUDNkNXNnKzhQNlpsRDkxOS8rV3NCaHdvZUxub0NGNFBE?=
 =?utf-8?Q?3DO/cljtPO9mpzzSa0tOxfZro?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	2p8gB8VFNMY94u1vVu0m0sgVvct0ybNBom5jqgk9gN/wZ95b3EmFb4Pxn0Xb8CM6jD/vvrNHCA2KlW1RCmIWt7qa+utWdBef5w88HW9HcjF0IskPT6rkq/u54epQP9ZYR4paf0p5a2+m55nXH5qVj0qYAbFYtsOzDXmn2w0DFVIRPCB8xFYSlTiVGhZtP5rdCSxJhrK1W6/ZjkspoWIMSyq06aELGSz2kO+p9hLhHvLho8v2ysBnYp9iAd7jpFmD4pmcJsm9AxSzDFpYlTwPLgFfB/mvZy4iGFs78Jcaj1zWxYvC9N9kFQVEASOsha/iddsfXmk0fdfASOH9tfNlrIosw5YsQF/jmoqkSEg6PWHBFZw06hz9O8+AjZT4uGXfe/Y1iweo706UcTdobjfSZHRnuja2XgqaEsQ65dgQfWLg1ziYLYcXuXqguFMXwCCR6rWvTig/cVjhFHgEeuLYCS3M1h25To5yYFEg7YK4LwNb06DlrhRfYSLkmRC1n8Rd4J0ZjmICArKt9wbTsZz9dRyo0dWnVPzWlV4jA+uG0wD25/lGLGoGqknocYjgDsF8k4wi94WchNAkTxgAL2bncEfNjXhK0Pf7VykF1DslZSI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f76c8ca8-f50b-49f6-7543-08dc293a24ef
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4429.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2024 06:41:28.6198
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aBmzcVYYzm4FsJkoWaCGc776tV9AtSJ01/kazn9xBn7bKyVzgr1yZeBlmzeN1NREgxgAf65LuiAELTuBXR3JSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4207
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-09_04,2024-02-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0
 mlxlogscore=999 phishscore=0 spamscore=0 mlxscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402090047
X-Proofpoint-GUID: DDglHVInCtT8l6KGbMnxd5GL-L408zmD
X-Proofpoint-ORIG-GUID: DDglHVInCtT8l6KGbMnxd5GL-L408zmD
X-Mailman-Approved-At: Sat, 10 Feb 2024 10:24:14 +1100
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
Cc: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2/8/2024 9:42 PM, Anshuman Khandual wrote:

> All platforms could benefit from page order check against MAX_PAGE_ORDER
> before allocating a CMA area for gigantic hugetlb pages. Let's move this
> check from individual platforms to generic hugetlb.
>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-mm@kvack.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
> This applies on v6.8-rc3
>   
>   arch/arm64/mm/hugetlbpage.c   | 7 -------
>   arch/powerpc/mm/hugetlbpage.c | 4 +---
>   mm/hugetlb.c                  | 7 +++++++
>   3 files changed, 8 insertions(+), 10 deletions(-)
>
> diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
> index 8116ac599f80..6720ec8d50e7 100644
> --- a/arch/arm64/mm/hugetlbpage.c
> +++ b/arch/arm64/mm/hugetlbpage.c
> @@ -45,13 +45,6 @@ void __init arm64_hugetlb_cma_reserve(void)
>   	else
>   		order = CONT_PMD_SHIFT - PAGE_SHIFT;
>   
> -	/*
> -	 * HugeTLB CMA reservation is required for gigantic
> -	 * huge pages which could not be allocated via the
> -	 * page allocator. Just warn if there is any change
> -	 * breaking this assumption.
> -	 */
> -	WARN_ON(order <= MAX_PAGE_ORDER);
>   	hugetlb_cma_reserve(order);
>   }
>   #endif /* CONFIG_CMA */
> diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
> index 0a540b37aab6..16557d008eef 100644
> --- a/arch/powerpc/mm/hugetlbpage.c
> +++ b/arch/powerpc/mm/hugetlbpage.c
> @@ -614,8 +614,6 @@ void __init gigantic_hugetlb_cma_reserve(void)
>   		 */
>   		order = mmu_psize_to_shift(MMU_PAGE_16G) - PAGE_SHIFT;
>   
> -	if (order) {
> -		VM_WARN_ON(order <= MAX_PAGE_ORDER);
> +	if (order)
>   		hugetlb_cma_reserve(order);
> -	}
>   }
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index cf9c9b2906ea..345b3524df35 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -7699,6 +7699,13 @@ void __init hugetlb_cma_reserve(int order)
>   	bool node_specific_cma_alloc = false;
>   	int nid;
>   
> +	/*
> +	 * HugeTLB CMA reservation is required for gigantic
> +	 * huge pages which could not be allocated via the
> +	 * page allocator. Just warn if there is any change
> +	 * breaking this assumption.
> +	 */
> +	VM_WARN_ON(order <= MAX_PAGE_ORDER);
>   	cma_reserve_called = true;
>   
>   	if (!hugetlb_cma_size)

Looks straight forward to me.

Reviewed-by: Jane Chu <jane.chu@oracle.com>


