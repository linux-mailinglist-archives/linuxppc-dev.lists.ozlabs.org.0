Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E688F94B391
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 01:21:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=V4XWyqWK;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=oYDxiyri;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WfR556H3yz3dKH
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 09:21:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=V4XWyqWK;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=oYDxiyri;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=liam.howlett@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WfR4N0P9kz30Tk
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2024 09:20:50 +1000 (AEST)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 477L3KOe009399;
	Wed, 7 Aug 2024 23:20:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:content-transfer-encoding:in-reply-to:mime-version; s=
	corp-2023-11-20; bh=JcwwuxdrxmV5MBY+OsZQSvS9r3b6MGvFYRAwZmVWTS0=; b=
	V4XWyqWKMi0UWIxq+MFhQSXZJdWeIXR5Be+wLhq3Hvk3OM3lwHXMeQebikt247jA
	tmlQ95xAtEhn6JjRl4DA0UaBkzMlpjkXIWsocBrfEZTZrYTJPd6Fbx/91W9rmjwm
	S+rf2fNXZLBWzLP9sSPAqcn6Ytigf/pD4qSAHSVEIXHFfhHKxBk60ur1X4hTF7ec
	zNaVmKVORy1yL61ziXX7R/kKoGWTn3ZJysV0OGJL3NnG0OhbYy9G07okEQIIbaDJ
	RQFncWZIcmZy8ch7Gij8mnJYju0OEp3SjiABqgEK274nmQx9ZMwCS+MPL0K2eXpw
	eD7bWvxmyW9f5qbA10OjCg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40sbb2rq7v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 07 Aug 2024 23:20:30 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 477N7VcD018638;
	Wed, 7 Aug 2024 23:20:29 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2045.outbound.protection.outlook.com [104.47.51.45])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 40sb0akymq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 07 Aug 2024 23:20:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bC7rBtO6EXHSRHgGK563C292bpi0UXqIH1lmKvE8ynmRJ2/7Nsrz6VC20UO6/47Pj+iTUHYtZj0V9pAT4R5RZCQYXedXjme4DBJzBsPa9bKH0yNr39tWGNUSNj8E0GlTJ4TBF3jr0QSW/dn10jyWuX290UNriuUKKnU9y4+yiQucAv4WUA34OVZOo+DIgjiz82MX9BcOXUS/30a3mrd7/7uG2xEgSGuFF9AADNjRpZIOKg1JbYsSiMPTq4F5oezWMN0RCvBb5gumIvXR1rGismf+Ph/WsQKHfvUD89t8L9p5H15okUFpefwu7SA2pZyHStmpC3fpji7cvfFKv1equw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JcwwuxdrxmV5MBY+OsZQSvS9r3b6MGvFYRAwZmVWTS0=;
 b=Xpi0JclVkaEwCunocnOGf0hRX+Pnp9fm6nyf2fqslWxIta3iBf13gk918qASChc9qcsXSZz7KJtHZ8UR9OYtIvEb0id+ZywLAhay+G5aj24JE43YgLUsGQMN43FzsJqOLUDvYxygOpDgSnCAiDswapHQUxQhTx+V7bA2Dzgx+cynDmwbEnj8WkushDZxxPLohYt4dUJmJj2lfAYYkU6yjMhYmdu4gKJROfmQt0QN4Pkc6KabWwnIU3FJjtztRS5iqJJmUFHXw6eSW8aXma9pShWvQjO++u/lS09rhoqlim8TQWKuLPwNrSD2Lweb1JWjl7QpRJeoazU4RyZwA6Jb0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JcwwuxdrxmV5MBY+OsZQSvS9r3b6MGvFYRAwZmVWTS0=;
 b=oYDxiyri5zS5VmGmZGlKrVk6dxlfkc2ZLAB70lpBrbbXxF+TsH6jUxZFZYpH6W82J1y8NsFE93sQCps5riZ0w60ntGGQ4Hhc4nze1rt44Hb1ye17yBGHSdnX7oeeGGWf9mzSp6z49MFHBy5LY31/inc4nGATK70H/RbO6QvSTkM=
Received: from DS0PR10MB7933.namprd10.prod.outlook.com (2603:10b6:8:1b8::15)
 by SJ0PR10MB4528.namprd10.prod.outlook.com (2603:10b6:a03:2d4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Wed, 7 Aug
 2024 23:20:26 +0000
Received: from DS0PR10MB7933.namprd10.prod.outlook.com
 ([fe80::2561:85b0:ae8f:9490]) by DS0PR10MB7933.namprd10.prod.outlook.com
 ([fe80::2561:85b0:ae8f:9490%3]) with mapi id 15.20.7849.008; Wed, 7 Aug 2024
 23:20:26 +0000
Date: Wed, 7 Aug 2024 19:20:23 -0400
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Jeff Xu <jeffxu@google.com>
Subject: Re: [PATCH 2/4] powerpc/mm: Handle VDSO unmapping via close() rather
 than arch_unmap()
Message-ID: <lhe2mky6ahlk2jzvvfjyongqiseelyx2uy7sbyuso6jcy3b2dq@7ju6cea62jgk>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Jeff Xu <jeffxu@google.com>, Michael Ellerman <mpe@ellerman.id.au>, linux-mm@kvack.org, 
	linuxppc-dev@lists.ozlabs.org, torvalds@linux-foundation.org, akpm@linux-foundation.org, 
	christophe.leroy@csgroup.eu, jeffxu@chromium.org, linux-kernel@vger.kernel.org, 
	npiggin@gmail.com, oliver.sang@intel.com, pedro.falcato@gmail.com, 
	Kees Cook <keescook@chromium.org>
References: <20240807124103.85644-1-mpe@ellerman.id.au>
 <20240807124103.85644-2-mpe@ellerman.id.au>
 <CALmYWFsCrMxkA1v58fJxtyGR15ZGxmSP8x7QC=oeKwzcwGL76A@mail.gmail.com>
 <gtz7s4eyzydaomh2msvfhpemhiruexy53nutd3fwumqfpos7v5@4fnqun2olore>
 <CALmYWFvqoxyBf4iP7WPTU_Oxq_zpRzvaBOWoHc4n4EwQTYhyBA@mail.gmail.com>
 <babup6k7qh5ii5avcvtz2rqo4n2mzh2wjbbgk5xeuivfypqnuc@2gydsfao3w7b>
 <CALmYWFsAT+Cb37-cSTykc_P7bJDHmFa7mWD5+B1pEz73thchcQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CALmYWFsAT+Cb37-cSTykc_P7bJDHmFa7mWD5+B1pEz73thchcQ@mail.gmail.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT4PR01CA0194.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ad::19) To DS0PR10MB7933.namprd10.prod.outlook.com
 (2603:10b6:8:1b8::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7933:EE_|SJ0PR10MB4528:EE_
X-MS-Office365-Filtering-Correlation-Id: 263c370a-a6da-4aa9-9412-08dcb73784db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: 	=?utf-8?B?SWhxRXFiQ0gvMW0wcUlWOHhwQWNvRExodmloVjdiZE5SUG0vVkliNHhydTk1?=
 =?utf-8?B?T3d4NUZHZ21zZTNlbTdzSzRCb3BDSlhjUDhReVBTSmVUeStCMmxrcHhEcTcx?=
 =?utf-8?B?ZGtyM3BWMmhmNmdLSFd4dDFjVW9KZzBrQlhRM2d2VHJ4MWFxMk40aTFZaFVu?=
 =?utf-8?B?TWtyZUd6SGV1aHJIdFVkdDVVZHQ5VnRRaE1uZE9IZ1VVVWs2NmF2MnRFc201?=
 =?utf-8?B?Rk45bndncWpKM3UzcnlFeHpKOGR3TGFnR2huTEdEdjF0eVZRQVdTSW93WjZy?=
 =?utf-8?B?ZHR5NGdVVFJpVnkzbTBKbjFCeFpwSzR6RDdiL2VQWnM1em5KRXJoVGo4ckdT?=
 =?utf-8?B?ZnJPemt4Z0ZscG1BWnQ0eSt0Ti9rUkkyOXdkNDdabDRsTllBdm1JejlPZW1H?=
 =?utf-8?B?aWQ4ZTBWYzY3TWhRb3NtK3RCZHVLMWlxL2ZKSlpNVnNpVUV4ejJUKzRDTnpE?=
 =?utf-8?B?M0lld1Z5OUhzTFBZeHl6aXVkc0VOYXNVMDF0OXl6dHpDaFpoZE44cC9sUW1P?=
 =?utf-8?B?d1ppOFVvY2pqcXIvMFk3eXJDOTFwOEhVRnNubVc5K283bWVrTFl4aW9uWEl2?=
 =?utf-8?B?Y2Y4aWdDOFcwWkQ4ZzJVV1JHWklobzRlRVlSbUNWS3dYTnhGZFpxVE0wNllv?=
 =?utf-8?B?NjB4bWQvMjNTMEJ0YkJjR3ZsTENHd2g2ckkyb21PVTFORGlYbVlxRzIrZ01U?=
 =?utf-8?B?MTJPajczRmJDb0RYMmpSalEvZVlQYnlOa2YvelhTZ2NTOHZvNzdCKzh0cEJa?=
 =?utf-8?B?MHBkTTRuV1hNL0RoT2pVczQ5NUNHN1RJYmdibXFKZEROZXl4K251bHdXSlcz?=
 =?utf-8?B?RjE4WW12SlM0b051MUNZZTJGNEwxSnR6dlNIQkZlcWtnSnhuaFpJYU50dEtH?=
 =?utf-8?B?dTJ3OUVqTkcxVkY5UEVvVk95eVNQSGI5alpqdTl1eUd2ZzJieEt0YzhvZG9T?=
 =?utf-8?B?ZDUwRmRHM09iYTNUT3R2WC9NaEUwOFVhdy96L01ZY1Y2TCtTQXFyTHEzaVg3?=
 =?utf-8?B?b1RSLzB0SzNQOG5hb3NnTkd0TmNteFRvVzhXbnVCZGtENkswL0w3cmt5OGFh?=
 =?utf-8?B?ck9aRWcxcko4R0tRQ0lvVmVUeDRMUnR2SWlaUmdmcWZhMkIwWXl3UmEzV2Mr?=
 =?utf-8?B?cXAxUk1LVW9IcDZ0ZzM4WERrTUtQd2xYWmk5Sis2WTVQWE5aNWdjR1lyNlVN?=
 =?utf-8?B?dXhFaWUrOHVFS1Q2cGk5d05IdlRBRVlLUXVHalBZNVJUVFVIZVFVNFQwL1Zu?=
 =?utf-8?B?Q0NyYUJTSGtUWUw3M0V2ajhxSHhobGhJV2cxZU1Gc0pyeXZMd1g3VkV1VnYz?=
 =?utf-8?B?K2k0ZVZTZ0ZaVVUxSmFCRTBGQTBRQzdUVXJoU3NEMWxXdk1NZFUyZEx3MS9E?=
 =?utf-8?B?RXJQK1RuWVJrVzQrY0t6MVQ5RVNkdURKUU1BaHZVMUVlK3ZUVnd3UXRzL25j?=
 =?utf-8?B?MUcxdmlaRU5nclJVbTY4SjA0cXJWQmdyV0VMdGw5bzFlQ0c3RkNBQWFDQXpk?=
 =?utf-8?B?WXVMVFVLeWRiazRvcU1CQVZmdlQ5aGtlMnJqdE1yYW1rVkpNVTdhMTREK3Mz?=
 =?utf-8?B?amxkNm03R00wTjJ1VmEreVV2ckhIK3lnTXZJS3dtclUydkxXNWQ1ZHRBcG1w?=
 =?utf-8?B?cksrWFF4RXNXaGMySXZCNVYxcW9haTBDZ1F1OElxM2J1LzcveTFIMmlYck1y?=
 =?utf-8?B?SFZNRFUyU1hJMXBrNWpZU0R6b2h1ajdFYlM0T2JCM2xhU2N5azVCTzhuZG1q?=
 =?utf-8?Q?H16KMxB/A05Ulp8Eof5X0CbcgtkFXgilOGyx6s2?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7933.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?YVVFVVFxV3pEQnNtTG5zMDgzMnVoeXN0bVFkL1prZlJTZkZvUFk4RjdDVFZO?=
 =?utf-8?B?c3d3TU5YNWVqTDJOejBKVHRjWWFiUzFnYXlDMUFaZGt4VzQ1cWxnbFlWNmxT?=
 =?utf-8?B?Nzl1UGZqQkFpUDJKelNUd1Q3ZElhTGI3L2o0UzVLd0hpYTFHdmVlRzUzYnlG?=
 =?utf-8?B?SzgwS1VaWjI1M3pEU09EblRJRmhPSkhsMWRpczlNODV6VEU1TmZ2V3FBTWdD?=
 =?utf-8?B?YnhETUZIQ0ROcWdCakhBR3laY0NqbkIxU0plcER3dWZGNUhZU2gzdVJaYVRs?=
 =?utf-8?B?Y3l3QWhvc0xQeWZsN2ZqVm5jWEQydmR2cmhaQVBZbjJYVmpJTDRXeDZIYy9B?=
 =?utf-8?B?OUJBNWw1OGl4SHVhNklkcFpSU3c5TkRTQjMrWkJjRnYyLzlhUUVuazc1MzZT?=
 =?utf-8?B?cm9TeFFpcEVtWjc1N1NWSmZsR0xIL3pKUyt3MnFWbHdIMGNGMlpwMGxDMnI1?=
 =?utf-8?B?SUxjdFZSc2VoR2JEZmJzZkU3VUwzaEorbTZGQnRweWR0V2piZlN2V3dnV2pR?=
 =?utf-8?B?aVY1SExYOUR3MWkrMjVZK3BnUEJnVWp4TmwzTUFMcHM2UnJPYkxpVC92MzBy?=
 =?utf-8?B?b1BRU2VLY0xvN3Bmdm5UeHE1dEo3MU9oNmdabGZLWDhEbGdGSG9BNklETEhE?=
 =?utf-8?B?R1FndXY5YXk3RGV3WHRRMkZ3SlFlVkprNzh6MFQ2UFI2NUs0MlIwNExpdE4r?=
 =?utf-8?B?d2hIQ2NFTzlBdlQyOHlFSFVHUDlJQy90KzB6U21aek5QTEFWYVB3YUpkcEVn?=
 =?utf-8?B?YURGVytFZHNjTDcyWVNUODYwbnVScERucW83K3Q3N1M1V1hlNFYyZy9STGQr?=
 =?utf-8?B?SjI5azhmVUJUZ0dNa1lLaThuQ2xVdzZTeEYzUjFkVzFlTjMrOThsbVFiMUVD?=
 =?utf-8?B?NUxsVVllR2w3WHFzVVpjYkRnQmJqWlhCbS9UMmhpVEh2bDAwclN0QWlZZGdS?=
 =?utf-8?B?c0t2WUlWQlBRT0g4Rmhqd3VzUEl4cWJYTzJHaTh3U0lFdU5xbGJuTnZXYmw5?=
 =?utf-8?B?WHdhWDhqRG56RjBtN3hzaGR1TVJkbjJwU2xwc2pLU3dSdXBXQ3IzZ1ZVeTlF?=
 =?utf-8?B?MGI5YzUyRGVIL3NvZVVWMHAxSUFtS2t1QThYQzZEa3B6WnhjeFF3NVFQd3ZN?=
 =?utf-8?B?S0cyUkdSc0ZIaTlIaHZqdWszeTBnTWlYYi9WMWEyRUFPVGpPQTBXeFpXZ1hG?=
 =?utf-8?B?dWxpQUY2Ly81dDY4OTFBNjYxR0lSMjdMRkl5VStqek44S0M0Q09TZ1VwMWNt?=
 =?utf-8?B?N0F0UFV6bDlPTWx5WHlvZmgySFdLUXY5ZXY5aGR5ZkV1YWhvdjB6akxmeXlS?=
 =?utf-8?B?eklVWmM0N05SemNtaEFDSlRqTVhNZWwvbEZwT2M2Mkt3ck14U21OVGs2ZExx?=
 =?utf-8?B?MG9PdlVCcllMQ0MzWmdydmk5M0xqY3drZm0raXVydm1vTG1RbHlUNGM3R1Ni?=
 =?utf-8?B?NDEzYlgraDBPUHBhMnU4YWE5Ry9SZzFraVRSS0NxMHVkNFNPazc0RWtMY2Nl?=
 =?utf-8?B?akZmT2FjNnVtYmsvTGpiYjl4RGdncmVYQjBrTW1aSFdCeENhMExlaFpkbXFt?=
 =?utf-8?B?TFdzd3B3SWZNSW9TSFhJWDVLMERJME82UGV3eTNSV3M2dm41b3FWRVJOWGxy?=
 =?utf-8?B?bFI1cmQyOTVIVnpLZkpaRHlZK0RHbURWQjd2U0F5Z0R5eXFBK1N2K3gwZzZJ?=
 =?utf-8?B?aGZ4cGI3M1JWeFI0MEsrSHo3dzdCUWY0ampMdXVpbWZzTHFILzNpTCtyTStt?=
 =?utf-8?B?WnRLWEFMb2dNb1JPcDBqa09KeG5KTUgxbFBuQ1BTZHJ1eURybVVGUzkzUlA3?=
 =?utf-8?B?V3YwOWd1c3k4Z2o3RHpYSEkrWjZlUkV5enJ0c2ZOTllCNkpYYnVlRXBEcEd6?=
 =?utf-8?B?N3Fadkl5L01ocVEzNi8xd21VU2IzNWFUMlVTZDZQcUMxZTJIU1NYZzJpVjdS?=
 =?utf-8?B?SlNSWndsM0tjUlZCRHVGZWFHQmtkY0RFNERjY2w4VVVDN1dZd1Q3aDJXQWtI?=
 =?utf-8?B?MTA0TjFqbm10aVlsUy9nZStZb1R5QzNLNEk1ZFJzMmlEc05zNVBxMEpwQ0F6?=
 =?utf-8?B?Z1lqVVpsUUpPRGtxaUxKTFA3T3hIZkhtdXN2REZaeXdFVy9rNEE0QWRDb09n?=
 =?utf-8?Q?FNZ5WiY9tG7JAygUjG1WO4UN7?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	tKYz8tDYGWUjcubK1n2JmLAf+MwVidwYugCwEBh//wgjz1zJ2bi43OpDclf1PJBbRXa0ReZUAxKehc2aE82sZbJ+91y7+a+vAz/QNDW4jHambGvKRbtYF9R9n11+LizvtvwFmoyg3OaIpweFoeEgpe4KmrV1HbPP1tBy19nAdr1r/s0IblxZkkS3oESIlLVVW1LzHziPTl1FmIsBMbY1BexteEtGikBDzEYHqTo4B11fDQvtCyPg5p6pJ2oA/JCn2c+MUHhZ/MLQrjTEajpfRryL6mzNibSJxrRUqE+FE4+YDyO37Lh9cTJcDkyTR+lFwdeqa02bbsUXM4uXyNeajIBGMs9reJEx1zCAC09FZG/CVpeYAm9OsQepJoue2NswcFuqQaZQ65D3a0GxMjGkep+ardVquwZdrwxCRoF6a+QoZ/9VIkVJ4zaK4HQgTds5dHg6IzwX5WzgBu7zYqIYWjjpPpI4Cb89upc9yOBI46HLjJ0fPWF9s+ZxbO27Gn004rIVOgnpMDPXeyf4wcniRHd06abiVVh8Hse1uUehBKAYqXbILW03OkRL9FkZTHNS1SrerbIxpOSP4LVIy8FCtrTRLaWEBBf9DmiLG+n6mjY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 263c370a-a6da-4aa9-9412-08dcb73784db
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7933.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2024 23:20:26.1360
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Afp8pd0Xaa0cWG10x2rJy1V5t5ivEjxB49osE/SD+4x+Ryxy6eE/0mameUgFVjOlBZihpoKqX49e985ozqoAqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4528
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-07_13,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0 adultscore=0
 mlxscore=0 phishscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408070163
X-Proofpoint-GUID: VWH99ILDmosbDIYGRZmDK_7o7B-3_Dwx
X-Proofpoint-ORIG-GUID: VWH99ILDmosbDIYGRZmDK_7o7B-3_Dwx
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
Cc: Kees Cook <keescook@chromium.org>, jeffxu@chromium.org, linuxppc-dev@lists.ozlabs.org, christophe.leroy@csgroup.eu, linux-kernel@vger.kernel.org, linux-mm@kvack.org, oliver.sang@intel.com, npiggin@gmail.com, akpm@linux-foundation.org, torvalds@linux-foundation.org, pedro.falcato@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Jeff Xu <jeffxu@google.com> [240807 16:12]:
> On Wed, Aug 7, 2024 at 10:11=E2=80=AFAM Liam R. Howlett <Liam.Howlett@ora=
cle.com> wrote:
> >
> > * Jeff Xu <jeffxu@google.com> [240807 12:37]:
> > > On Wed, Aug 7, 2024 at 8:56=E2=80=AFAM Liam R. Howlett <Liam.Howlett@=
oracle.com> wrote:
> > > >
> > > > * Jeff Xu <jeffxu@google.com> [240807 11:44]:
> > > > > On Wed, Aug 7, 2024 at 5:41=E2=80=AFAM Michael Ellerman <mpe@elle=
rman.id.au> wrote:
> > > > > >
> > > > > > Add a close() callback to the VDSO special mapping to handle un=
mapping
> > > > > > of the VDSO. That will make it possible to remove the arch_unma=
p() hook
> > > > > > entirely in a subsequent patch.
> > > > > >
> > > > > > Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> > > > > > Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> > > > > > ---
> > > > > >  arch/powerpc/include/asm/mmu_context.h |  4 ----
> > > > > >  arch/powerpc/kernel/vdso.c             | 17 +++++++++++++++++
> > > > > >  2 files changed, 17 insertions(+), 4 deletions(-)
> > > > > >
> > > > > > diff --git a/arch/powerpc/include/asm/mmu_context.h b/arch/powe=
rpc/include/asm/mmu_context.h
> > > > > > index 37bffa0f7918..9b8c1555744e 100644
> > > > > > --- a/arch/powerpc/include/asm/mmu_context.h
> > > > > > +++ b/arch/powerpc/include/asm/mmu_context.h
> > > > > > @@ -263,10 +263,6 @@ extern void arch_exit_mmap(struct mm_struc=
t *mm);
> > > > > >  static inline void arch_unmap(struct mm_struct *mm,
> > > > > >                               unsigned long start, unsigned lon=
g end)
> > > > > >  {
> > > > > > -       unsigned long vdso_base =3D (unsigned long)mm->context.=
vdso;
> > > > > > -
> > > > > > -       if (start <=3D vdso_base && vdso_base < end)
> > > > > > -               mm->context.vdso =3D NULL;
> > > > > >  }
> > > > > >
> > > > > >  #ifdef CONFIG_PPC_MEM_KEYS
> > > > > > diff --git a/arch/powerpc/kernel/vdso.c b/arch/powerpc/kernel/v=
dso.c
> > > > > > index 7a2ff9010f17..220a76cae7c1 100644
> > > > > > --- a/arch/powerpc/kernel/vdso.c
> > > > > > +++ b/arch/powerpc/kernel/vdso.c
> > > > > > @@ -81,6 +81,21 @@ static int vdso64_mremap(const struct vm_spe=
cial_mapping *sm, struct vm_area_str
> > > > > >         return vdso_mremap(sm, new_vma, &vdso64_end - &vdso64_s=
tart);
> > > > > >  }
> > > > > >
> > > > > > +static void vdso_close(const struct vm_special_mapping *sm, st=
ruct vm_area_struct *vma)
> > > > > > +{
> > > > > > +       struct mm_struct *mm =3D vma->vm_mm;
> > > > > > +
> > > > > > +       /*
> > > > > > +        * close() is called for munmap() but also for mremap()=
. In the mremap()
> > > > > > +        * case the vdso pointer has already been updated by th=
e mremap() hook
> > > > > > +        * above, so it must not be set to NULL here.
> > > > > > +        */
> > > > > > +       if (vma->vm_start !=3D (unsigned long)mm->context.vdso)
> > > > > > +               return;
> > > > > > +
> > > > > > +       mm->context.vdso =3D NULL;
> > > > > > +}
> > > > > > +
> > > > > >  static vm_fault_t vvar_fault(const struct vm_special_mapping *=
sm,
> > > > > >                              struct vm_area_struct *vma, struct=
 vm_fault *vmf);
> > > > > >
> > > > > > @@ -92,11 +107,13 @@ static struct vm_special_mapping vvar_spec=
 __ro_after_init =3D {
> > > > > >  static struct vm_special_mapping vdso32_spec __ro_after_init =
=3D {
> > > > > >         .name =3D "[vdso]",
> > > > > >         .mremap =3D vdso32_mremap,
> > > > > > +       .close =3D vdso_close,
> > > > > IIUC, only CHECKPOINT_RESTORE requires this, and
> > > > > CHECKPOINT_RESTORE is in init/Kconfig, with default N
> > > > >
> > > > > Can we add #ifdef CONFIG_CHECKPOINT_RESTORE here ?
> > > > >
> > > >
> > > > No, these can be unmapped and it needs to be cleaned up.  Valgrind =
is
> > > > one application that is known to unmap the vdso and runs into issue=
s on
> > > > platforms that do not handle the removal correctly.
> > > >
> > > Maybe Valgrind needs that exactly for checkpoint restore ? [1]
> >
> > Maybe, and maybe there are 100 other applications unmapping the vdso fo=
r
> > some other reason?
> >
> When PPC added arch_munamp, it was for CRIU, wasn't it ? That was the ori=
ginal
> intention.
>=20
> Maybe there are more apps that have started unmapping vdso, it might
> be interesting
> to know those use cases before widely opening this without kernel config.
>=20
> > >
> > > "CRIU fails to restore applications that have unmapped the vDSO
> > > segment. One such
> > > application is Valgrind."
> > >
> > > Usually when the kernel accepts new functionality, the patch needs to
> > > state the user case.
> >

...

> > > The only user case I found for .mremap and .close so far is the CRIU =
case.
> > >
> >
> > In fact, this is broken on other archs for valgrind since they unmap th=
e
> > vdso and then crash [2].  There has been a fix in the works for a while=
,
> > which I stepped in during the patch set [1], which can be seen here
> > [3].  In the discussion, the issue with Valgrind is raised and a generi=
c
> > solution to solve for more than just ppc is discussed.  The solution
> > avoids crashing if vdso is unmapped and that seems like the sane
> > direction of this work.
> >
> > We also have users unmapping vdsos here [4] too.
> This is a strange code. If the use case about clock_gettime is legit, the=
n
> kerne can provide an option to not unload vdso during elf loading.

Yes, I would not want to do this - but there are people doing strange
(to put it politely) things that we did not intend.

>=20
> >
> > Why would we leave a dangling pointer in the mm struct based on a
> > compile flag?

Okay, I'm going to try one more time here.  You are suggesting to have a
conf flag to leave the vdso pointer unchanged when it is unmapped.
Having the close behind the conf option will not prevent it from being
unmapped or mapped over, so what you are suggesting is have a
configuration option that leaves a pointer, mm->context.vdso, to be
unsafe if it is unmapped if you disable checkpoint restore.

This is also not what userspace sees today, so you are changing user
visible behaviour based on a configuration option because you think, but
are not sure, that checkpoint restore is the only user.

Or did I miss something?

Thanks,
Liam

> >
> > [1] https://lore.kernel.org/linux-mm/20240717200709.1552558-18-Liam.How=
lett@oracle.com/
> > [2] https://lore.kernel.org/lkml/87imd5h5kb.fsf@mpe.ellerman.id.au/
> > [3] https://lore.kernel.org/all/20210611180242.711399-17-dima@arista.co=
m/
> > [4] https://github.com/insanitybit/void-ship
> >
