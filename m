Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E0294C418
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 20:09:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=D+4WxU7u;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=nehxE5JU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wfw6h1Q5Sz2xJ6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Aug 2024 04:09:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=D+4WxU7u;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=nehxE5JU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=liam.howlett@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wfw5z0ynkz2xCd
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Aug 2024 04:08:53 +1000 (AEST)
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 478HfXZn017685;
	Thu, 8 Aug 2024 18:08:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:content-transfer-encoding:in-reply-to:mime-version; s=
	corp-2023-11-20; bh=eWA/S2rLlBZqpLOaE3zd2jaEOy57VLD13JlCwUbrPVU=; b=
	D+4WxU7uQVwCE02fjAEknNcxwdGCQ1D8c6YaSvTNyk9TDpr2JaP+ZFKJdH6g3oln
	qi9j8tA4QavBEEL0hJv89RG6/LrXq6SAyrHSX+8JgydMhTl15aLkHCE8C2zgLYMJ
	tbSKCIgYbUiq6Ty1fiYRd6AChZgwWh0kUFdJNILjPtnKJ/ccVvsYaF4dqzd7GR6T
	+OoxrpSTzttl+XYTyL2LbBBNXL9+2vUY2HIPWCFQdFOEbtWKZHi81Lu6K5vlqpw8
	cwGInC8utIMdM9ajOeO8N6bLxSuxZwCR05enHV1y2dJwxm6dhLl6cVfVT5MGgq22
	PppcsHN587yw1tQsg6rXLQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40sbfatja2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 08 Aug 2024 18:08:35 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 478HY3Cd039491;
	Thu, 8 Aug 2024 18:08:34 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2048.outbound.protection.outlook.com [104.47.70.48])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40sb0d0apa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 08 Aug 2024 18:08:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cWn/VlGYR/J0gwLXUfpXVx5FIzatcnnqthbWgPiJlEa1GpyMZ8GDD3CfdouLBG5ByKnDJjWictQbDGLqDtuKkJhSu+U9T+kk2Y+1D7xrJz2f1vRmiyiGRG/GXEy4KwU/V6x6PLNEWYnyteMFDmyoQOJwpktNwomYHya3bovLeGdLPeMcMb5cIklFILCzXZqrC60LH4sUqfF7V0XV2OLYvdhPKQJIE7nZ+RhBmjqGFtA9U8QheCyy4AMS4U/am4/h4ZXZ/FCYzYONrPh/3rMb5NehPYjevNPv0Hd5JP81iVG84DwHORq2ad5btlwCujc2krJq2jLqjSfZQWsGAbyBEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eWA/S2rLlBZqpLOaE3zd2jaEOy57VLD13JlCwUbrPVU=;
 b=AAaJ3zo8DIvdt7wd1+ducGuahv1wAHggpPvwT6N0bSWf7ri356UP7oGhTFfGhlq44slcSPJQfeG7K9v6ad46KmjmBrmEdcQa9BR1ULAoriuOGLBbos35+Ed6IRst87YtZF5hrukIV2laHu2gHV0PV6jFR1zOKcw9LSv0SEUN5pBZvT2iX9ZNYFrpYimkmPfBRKeZXlO3r+jenj/oy/loOQP40LYuUYaWI4ApEbBkwj+7daL0UYnsNgLqovgKKuCjUFKSTK/eckoGsCwrrrqL2VOuy1lrX83ZQg3ymrhYCLftozWbJ7+lD92ATRwOyUhmICRAaHPstb42BJLURa36AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eWA/S2rLlBZqpLOaE3zd2jaEOy57VLD13JlCwUbrPVU=;
 b=nehxE5JUp7gY8aQ41cn7xTJfmzrOu/OEyMODHaPJTP2eHHYEx5RtDF/9jYiOQpaKipO/As8qIR8jJ4pX2PGHkW5tBqPyxPC1TYJsZfOGroiEKVhfPhuBfHpNGzSiFUv7YLI0Khu8tF88TXFC09dHLvkUJ6pj9iUuskvvMuCsEMw=
Received: from DS0PR10MB7933.namprd10.prod.outlook.com (2603:10b6:8:1b8::15)
 by PH0PR10MB4774.namprd10.prod.outlook.com (2603:10b6:510:3b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Thu, 8 Aug
 2024 18:08:32 +0000
Received: from DS0PR10MB7933.namprd10.prod.outlook.com
 ([fe80::2561:85b0:ae8f:9490]) by DS0PR10MB7933.namprd10.prod.outlook.com
 ([fe80::2561:85b0:ae8f:9490%3]) with mapi id 15.20.7849.008; Thu, 8 Aug 2024
 18:08:31 +0000
Date: Thu, 8 Aug 2024 14:08:29 -0400
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Jeff Xu <jeffxu@google.com>
Subject: Re: [PATCH 2/4] powerpc/mm: Handle VDSO unmapping via close() rather
 than arch_unmap()
Message-ID: <6i3f5bvcppm4bkpphcb7sxsopmeani5mg5irytc3nr464p24ka@jpno77j7cgyd>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Jeff Xu <jeffxu@google.com>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, 
	akpm@linux-foundation.org, christophe.leroy@csgroup.eu, jeffxu@chromium.org, 
	linux-kernel@vger.kernel.org, npiggin@gmail.com, oliver.sang@intel.com, 
	pedro.falcato@gmail.com, Kees Cook <keescook@chromium.org>
References: <20240807124103.85644-1-mpe@ellerman.id.au>
 <20240807124103.85644-2-mpe@ellerman.id.au>
 <CALmYWFsCrMxkA1v58fJxtyGR15ZGxmSP8x7QC=oeKwzcwGL76A@mail.gmail.com>
 <gtz7s4eyzydaomh2msvfhpemhiruexy53nutd3fwumqfpos7v5@4fnqun2olore>
 <CALmYWFvqoxyBf4iP7WPTU_Oxq_zpRzvaBOWoHc4n4EwQTYhyBA@mail.gmail.com>
 <babup6k7qh5ii5avcvtz2rqo4n2mzh2wjbbgk5xeuivfypqnuc@2gydsfao3w7b>
 <CALmYWFsAT+Cb37-cSTykc_P7bJDHmFa7mWD5+B1pEz73thchcQ@mail.gmail.com>
 <lhe2mky6ahlk2jzvvfjyongqiseelyx2uy7sbyuso6jcy3b2dq@7ju6cea62jgk>
 <CAHk-=wgTXVMBRuya5J0peujSrtunehRtzk=WVrm6njPhHrpTJw@mail.gmail.com>
 <CALmYWFtAenAQmUCSrW8Pu6eNYMcfDe9R4f87XgUxaO4gsfzVQg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CALmYWFtAenAQmUCSrW8Pu6eNYMcfDe9R4f87XgUxaO4gsfzVQg@mail.gmail.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT4PR01CA0435.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10d::28) To DS0PR10MB7933.namprd10.prod.outlook.com
 (2603:10b6:8:1b8::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7933:EE_|PH0PR10MB4774:EE_
X-MS-Office365-Filtering-Correlation-Id: 4901a5e8-91bd-4a47-239f-08dcb7d51cb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: 	=?utf-8?B?WmVzRTlMY3g2ZjVqcDNyZGx1MDlLc21LQ0ovaHZmbFg1UnlIcFZCaW4wb0x6?=
 =?utf-8?B?ZmRKVm1uOCtZQ1ZYU0ZVNHRieUFMRHZZREpkaHN3MXl5STI0QW5GTlpOeHBW?=
 =?utf-8?B?eURQcGRZTTB0bXRVa0dTNllCdWdTUGFwdTJrU0l3bW5GRG5jSjFGdlBMUVBG?=
 =?utf-8?B?dUQ3b2RldzVUWm1WSlFGcnkwd0tYejdMTU9YZHY3NU1hMXRjRTE1SWRLVCtL?=
 =?utf-8?B?NENXMXcxNzRCcllKaktET0RkaUFlNjR2cFJ5WVpONC9XNk9NYXRCMjdMV3dq?=
 =?utf-8?B?NmhldExJOHpDdjFjMk8xb2JOSDZpTUJwajRXWHJac3c4aFhTS2xFc2ZGb0Zk?=
 =?utf-8?B?ZWVkNWpvdUFoZXMreEFjWE50YnA0TFBLcWFZWmtaMEZ5UlBuQnFlL0FXbWY5?=
 =?utf-8?B?Qk5GbmNIV0hpZG9aY1MwREd6eGlFRXkyTklWbXZZMURpNjZwSG1UaUU3QS9P?=
 =?utf-8?B?bElScGRYWDNNaWM1Y3JkbERsS0ZzelAwaFE5Q0JiMUorZmdtYlhjWUQ5eVc5?=
 =?utf-8?B?cFZQeGV4eXNXdmFnY0NPVU4zeDFSY3huTzlYRXhwemZkMDFYN09EcnA3RDFy?=
 =?utf-8?B?ODZLd282TWtjaWhiRFZSYVhkNjRSMU5GeDk5a2M0N1AwbkcwOGhVdVhDN1B5?=
 =?utf-8?B?WGg4dkZEbHFGOTBXMmFaMkJVbkE5aXBIK01ZQmx5R2lRdUZPNTQ5MHEyUFJz?=
 =?utf-8?B?WjdXcTZMWCtEZFpYeC9JWTZBK0kxakluS2NFV1hNNSszbFUyYmZWbm5Qb3lV?=
 =?utf-8?B?a2JxbDhYYWFCSkJHckVwL0Uxbm5xNnVKUXRaemQ5QkFKVCtRbDlPMWFjeFhN?=
 =?utf-8?B?eGh3UXJNZ1N4SjVQM0grUHZNbWQ2dU1DaTZSMUV0MVZ2NnJpdnZzMzBwWTh4?=
 =?utf-8?B?LzVVMi9ISVlxV2N4dGFWdVJGalFPME1IODM0L0dSNHd4WUdWT296NWtSYmVn?=
 =?utf-8?B?K0pwUk5YSkh5WjhvWCtDWUZWR05zZWtCSWFlZ3o2Q3pEZmlrcElDWG9sRi9Q?=
 =?utf-8?B?TDZ5ait1VUpEcmtYMzdqc0M3dTJIZUNJNkpud0RyY0ZSNkVNdHpNemtZNm5s?=
 =?utf-8?B?WjdLS014QTh5VmwwM1B5R3BISmdubjdTSXNnT1NWVmt0REUrS2Rjb0E5QzBn?=
 =?utf-8?B?cFlPY0laL0d5OVd2enNSQTZNYUxkbCtLTlNhWVNzRmlCS0huVmRxUW1ZUHFY?=
 =?utf-8?B?bU5TSExzTkpGV0huTHk5TENVcGxyTDg2eEE0N2VoSloxZTZnL0xoKzlycU5B?=
 =?utf-8?B?ZllLdTFHLzNySXFRRlRQb29zVVZucDNnYUdENTVpN3pRMVZHTXcwbTdNNzY4?=
 =?utf-8?B?TkwzVlUwcWZJcUxENlJrUjhoN2EreGNFL0dncTBTL0hYVjhjMm4xMmU5Qlpi?=
 =?utf-8?B?dkxQTklHcEs5R1U0MGh4SXVRYkZqZVlmdERTV0Vqbnp0b2FPRWFtTkJwQnFR?=
 =?utf-8?B?RWhiZ3lSRW1rZ29SUzRnZWorSWxPNTNSdzNTOFFqVDZIb1EzQzRVeisvdUdl?=
 =?utf-8?B?cmxzWC80OENNaUNSeXA5Wk5xU1VaZVFVL0RJdnpKcEJEUUt3TkVMRjRYakFF?=
 =?utf-8?B?YVVrMU1mOE0yRU53L3N1ZDNGalBMM1o1R3U0ZDdnTGkvRkx0WFJzenE3UTNO?=
 =?utf-8?B?Y1gwYVBlZnQreVhNQXBjMUNHdU94TWo3R3hjKzJYTG55M0RTQjJ6cGZGMlNr?=
 =?utf-8?B?aVl3MkdoTEFZUVdCTGNqalczcmhVaWVHQjVUZnpsM0F5WHZyVmZUb1BkWXhv?=
 =?utf-8?B?cVp6bmk5MVJ1VTI1NkFUOS9jL1gzRXMvUEpESFZnTHFjcjlNYWZMY2NQVmZ0?=
 =?utf-8?B?YmFwODBYUllPU1FPSi9GQT09?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7933.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?SUprVGFoQ2hLK21tRHBNV0NvTTgwckovTjBTczJ0NG5RRlF4UTF2RUlJTFll?=
 =?utf-8?B?NVVJUHZCdnpTSzhmVnRSN1ZieDJvTm96VFoyWmJ1REhvWmltVU9qUXhjaXY0?=
 =?utf-8?B?eTVoOGhPYi9GUUJuUDAxVDZ5aXcyWEdTNGdwMjZ1VjZuMTBPaEJNNmxTNXVJ?=
 =?utf-8?B?VFVnSHpQQ0Z3c2krMEJYbnJsbTF1RDdjUDg1U0t5ekV2RW11b0h0OWp4UXJw?=
 =?utf-8?B?V3VGTitsQXhjdDR2YWlqd1NSWXZPbnl1eFhSMWpJT3BvTUlvY0Z2UFlQa0tL?=
 =?utf-8?B?VjNXVEZvMlRMM0ZoUFp5VlpOR2VDVWIzb093QkhNU1VEcE9VNlVlYU1kWGE0?=
 =?utf-8?B?NXN3VklPMytsMzR0NkRuWnp5eDJtT2t4Mk1heDJOMEdocXBrOHpIVWNWK1ZD?=
 =?utf-8?B?bXFiTVZLcXJRN1FjZWE0SkFqLzJqRWIrS29GQjEzb3BQUzc0NnZNOC9UWjRE?=
 =?utf-8?B?dmd3b2xPbUg3VllyNlhpL0JyVlhxanpLVDF2NzNZcWs4dUhMSGRJcWhUQ29a?=
 =?utf-8?B?TERVcSsvei9ETFZvdmM2ZWwvSzBPOHFCdTdJNkxjNERVSEM4cG9PVlVSRkFq?=
 =?utf-8?B?QkpWb3d3dE9YSGVPNGg4N1c4OENnZTdjbUJUVlQyd0RtUUd6NHFsWnNBOUg0?=
 =?utf-8?B?TndxMVd2OWo1Vk5IQzJyMUNDMnowS2JnWTNTdDh4bExPeHlZdkJGeTBKVEtq?=
 =?utf-8?B?VGVRZUd2SGJZeVJxd0hEY0xqV3hHSndta1pvWkJxb1V3aTE5T2FZMTN1eHg2?=
 =?utf-8?B?T3dibFQ2K2V2cWkxS1QvSzE2c3h4MHdFNzZrZndlU0haWWVERkc5RENFMnRr?=
 =?utf-8?B?Y1FodDZrZnlKWjRrb1lIQ3UwUXlDdHdrSE1QM3JvMlRFRjgyZm9BTGxyK213?=
 =?utf-8?B?WFA1SEY4b1pELzRSVXpUL1hzSmUyL2dZc2RvNmd2QXFQaXlIYTFrOFpjR0sr?=
 =?utf-8?B?VTJ4b0lkbGVjeXJmZkxwVnhmbHdMd3l0ZGhORm94Rm5NNHI3ZUl3aTFKOFR6?=
 =?utf-8?B?czJ1K0FoWDk3SmcvQ01ZSkFmVjdXZHRCOEZ6S0ZFV2xOSTllY0g5cnJBY0FG?=
 =?utf-8?B?WmpOa0drK250d01Ld0JKZnc2SHZqQm1KUVlBTis3THNwcXNlZWJmSVR4cmls?=
 =?utf-8?B?UHRBZXl6UzlHY1liM3pqUTVVd1dtMVFEZS9WNkZRTWxKNVFDcmdaS09NZElC?=
 =?utf-8?B?dUR4TGU1RlNkMU5mUFRTNksvQ0QybWExV3J1eExhTHZ6Q09kNHhsYmhQVWdZ?=
 =?utf-8?B?NTJnNGpMOFRyMGVDWnlkK1JFTm9xK1ErbStEeVYyVXorZDJoeHlsaE1LbUZ6?=
 =?utf-8?B?aTNlUHpGZmJ1UFVqVDlSZVlaNktmNmIraElzTXlaR0xsa0lZY0xhU0NhOXow?=
 =?utf-8?B?SXd6QTMvbm5tWFUrbktZenZrVk5XUXVnMWVKQytGYnJvcm5Bdi8vN21YaHIv?=
 =?utf-8?B?MStlZWJFT3NRVDErUWN3d2ZhYTV1ejBxWFZQcVFBVjU4TUEvaDVqTytTZktZ?=
 =?utf-8?B?YnZaKzZpcFJaaE1KeWNIc1M5UURPZ0pYMWdMKzN0MGpWZ0p0aGt0amEwc09S?=
 =?utf-8?B?TEtpVS9PaXJGU3VHQ2pUbXN1RDBrcTNUeTZTcWRXRkdPVkJQUmZVSzdoMjl5?=
 =?utf-8?B?dG1RblB0ZW4vLytsMkRwVVJXM08yNlA0SnA5K3RxSGhFRUdPWXI1QXZ5VWxk?=
 =?utf-8?B?dW1qMWZGRzg2ZnQvVWZpdDRmR3RSckJkd3dCK2VXRmlsYjArKzZLTjk0clp5?=
 =?utf-8?B?TGt6OE1DSnoxa3BtWnUveGJ4SXF2RWY0eEpqUHBUM1NMeExpSWJWUjFQK25H?=
 =?utf-8?B?OWQ5R1puaDVtZDJJUG1MNmtnRldQQVNUTmhxbCsyWC8ydkVNazhtQXlyUmZI?=
 =?utf-8?B?aVo1YVZCZDZ1TlB6N2dlVWlwNEg5Z2lrWlcyTDkyTFB6RHQ5WFR3bzlsUmJY?=
 =?utf-8?B?TXpKOW54R1dITGtEajUzbG1HMnplclpZci85c3c1bXhrSzJiV0tNdXRPbFdP?=
 =?utf-8?B?LytvcVlER1hVbXZYQy9zZzZnNWVTWkVoaXp3dGRMcWh2SEpjRFgweHBQMGxk?=
 =?utf-8?B?SjBHSkhocE05V3IvYTM1RHkwVytJOFRseEIxbENZVjdxNXVPZCtlbGFMems3?=
 =?utf-8?Q?pFlMgjvlee09mwNKMecX8hFzF?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	wgFXLSGzOP5pceNe1kHAh22DvIx4ypEtJ9UxnAX8rYH5JVdhWQh83tSNwiyMuanf3+FKTCp1HEjGwkkg2fudoGRma8JHcn9eb6i/dR6AcVzYJ2rqrz4mrbyc+wb0dTdNEvcPoz4VWPIE5TFuIBwLQ6Xy5KvTYriT0/x7h/qFy8t/9tjupk5iwE++ZX+wcfL9dD8HnM5kHrGSH4cHqNlfIHczpisQzmrpGKCFoyZL3F5zBqU3nhXqg8AOgvRwyu7CHRNpEsuazcBpiyUv0oXXt0l3/OCkD+aBHi2o65lA0bPvh7rjViAi/jAxxesQMb075FmTG56a5jdET0lk1AtrTitarCvQueQna/b5nMlLawjhUO7oLai+4400RiRw1unh+aUj656+6HtBBxIUQmsmCf/wnMsQTM74h15xmLSR9Art9Hdk8KMThBfLiQvuv3jHbtfsF8Um6K9zjRi+K+thxDrvXTXsNAhfyS0OAA33PiWcR7QHM9qUUOuNyUau1vOospNK5aZNynKbd7C09TzsFkjjw7etlZR53BMPTq7JD+rI/QV7lrufY+3hycC9Wv3c/2I1E10dx/IDLsDh6RZo9npcyUCCm5bLUJC3vNRxb5c=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4901a5e8-91bd-4a47-239f-08dcb7d51cb8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7933.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2024 18:08:31.9115
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zW3ZjXwAoEpK0ry+Kj8GT6E5zUfwbCFVQ4HCvzGPCMMQIv87DApzEFOMow89Zq4dOGJGm379canN/lU3CruQvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4774
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-08_18,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 suspectscore=0
 adultscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2408080129
X-Proofpoint-GUID: O6Y0UjBisCrYxHVifVwWP5ypAG3weZpe
X-Proofpoint-ORIG-GUID: O6Y0UjBisCrYxHVifVwWP5ypAG3weZpe
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
Cc: Kees Cook <keescook@chromium.org>, jeffxu@chromium.org, linuxppc-dev@lists.ozlabs.org, christophe.leroy@csgroup.eu, linux-kernel@vger.kernel.org, linux-mm@kvack.org, oliver.sang@intel.com, npiggin@gmail.com, akpm@linux-foundation.org, Linus Torvalds <torvalds@linux-foundation.org>, pedro.falcato@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Jeff Xu <jeffxu@google.com> [240807 23:37]:
> On Wed, Aug 7, 2024 at 8:21=E2=80=AFPM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > On Wed, 7 Aug 2024 at 16:20, Liam R. Howlett <Liam.Howlett@oracle.com> =
wrote:
> > >
> > > Okay, I'm going to try one more time here.  You are suggesting to hav=
e a
> > > conf flag to leave the vdso pointer unchanged when it is unmapped.
> > > Having the close behind the conf option will not prevent it from bein=
g
> > > unmapped or mapped over, so what you are suggesting is have a
> > > configuration option that leaves a pointer, mm->context.vdso, to be
> > > unsafe if it is unmapped if you disable checkpoint restore.
> >
> This is a new point that I didn't realize before, if we are going to hand=
le
> unmap vdso safely, yes, this is a bugfix that should be applied everywher=
e
> for all arch, without CHECKPOINT_RESTORE config.
>=20
> Do we need to worry about mmap(fixed) ? which can have the same effect
> as mremap.

Yes, but it should be handled by vm_ops->close() when MAP_FIXED unmaps
the vdso.  Note that you cannot MAP_FIXED over half of the vma as the
vm_ops->may_split() is special_mapping_split(), which just returns
-EINVAL.

Thanks,
Liam
