Return-Path: <linuxppc-dev+bounces-13570-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 51605C212BC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Oct 2025 17:27:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cy8dd4W1Qz30V1;
	Fri, 31 Oct 2025 03:27:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c200::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761841621;
	cv=pass; b=YBHdEI0o18bbW8qO/0FOzrqV5UCcfWT8p/AAkWGIQ0SsndDuBHIJJVJ/1H4otusjBFH6Pn+FJ87sFWLpmV1MSZt+6Ru//fBWNpCtvkTyfSRqIYpN2bxWlz/M0JVfftoeqwUGl+Qe0LcM8pwBqxEBAz1J7IjRlUzejsifMg2Klavk7q1tkAcFbpGg7ep3+Smv84yoAabtTfXe5gowD4WJ86zWPH+mEdIpETSEhoc6PrWerG0oward6/d1ll3cT0eAtO3M+92s8H74KPWle1y/yFxOt1fmanO00QN9NMg3DyTJ56blYjhBwPsTEILvVF/9LbD6PvpJwvO7H3GadyHiiw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761841621; c=relaxed/relaxed;
	bh=5telhZSLNsB9r9gpHc+JJCdhN38mD6orT3clR1Vt4Gc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=lqebmI5mC+VeudW01Xe2bFOp2WMMs/4AGGc1HfHyc2akrM7aokEdaKdDuvo2rx2daA56fOw0vyVPjiWVA0/NKWtMwhcjW47YdOLmUUKnbxzVLKPYazQqA3Zc9II85d8TvWuv0MCAtAWek7GyAyLCKJjLntT6Uvm+mLmdUSdy+seljR2snUQmngHItP4Rsq8UDavUNG00x+d2Aww7szVmDeqB7J2Z+Lv3YN/OYdQhGvbXXdj3yU4BNVs1rNrn6+CiEtBd6ZcWdnfIV0xMCVEMTVtn8w1W5m2SEHWw9MqKWTlq3l17+lvFFbHA9UXLM0xLNtLNOx9BovNTX0XKi8Rc+Q==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; dkim=pass (2048-bit key; unprotected) header.d=siemens.com header.i=@siemens.com header.a=rsa-sha256 header.s=selector2 header.b=JVZmG7mS; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c200::5; helo=duzpr83cu001.outbound.protection.outlook.com; envelope-from=jan.kiszka@siemens.com; receiver=lists.ozlabs.org) smtp.mailfrom=siemens.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=siemens.com header.i=@siemens.com header.a=rsa-sha256 header.s=selector2 header.b=JVZmG7mS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=siemens.com (client-ip=2a01:111:f403:c200::5; helo=duzpr83cu001.outbound.protection.outlook.com; envelope-from=jan.kiszka@siemens.com; receiver=lists.ozlabs.org)
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazlp170120005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c200::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cy8db1SbKz2yjw
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Oct 2025 03:26:57 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l0SETN7q3tu8i++19rtonnVM0KgaYig01MQPxok/9/Iz8OTncpCB7Vs1AIGzgCjqMtHiYt/agCYRiGmGPxR1jV1N6PlBHKqKVqOSTu9SbmRsVWgNLvX3daQ0bfgWPS5Q5ov85Kc1pfdv9EUZQ1ky79hyv9xcrwVLKl3IcSdEGzxUjnrmtc23kVAtFDpPl8sQz2V3fezSpiyDbaSRHLXE87/42ly9+jaEvp+uYK+HBNJWfo+ZH+0nyFWy1HucyQ4o0+o88pgP4gzn2CAYu/sPsPCu3oqK+Qo7CCAZTPRpctVrmsKTrpHb1RTMMOMU75GpuSO7MtnRdkyPUhe8h8PUfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5telhZSLNsB9r9gpHc+JJCdhN38mD6orT3clR1Vt4Gc=;
 b=jCSbuxE1cqJMppMMEqO/ZvMuyTZHYLkVr2vEbbdNo/qXve3eI/S1SS9YQsp2nNxG3IZeHxdUeXosmVMQJ+4KUrHbascpiMBhJ4H1bzPDFkEgmOdOKNfYyqFwk+tqZPhKy2zJag7a81qkyUwQ3ELIntM30Td1S7L9uoiXOQE6/N0KJ8eLLoOookqEBdoynfLOPZRCx5V9+YryY0CuE+e5/wND8qMmhxE3vUXuol//YyHlfEMeRJbmQgQaQnllgViwtRF8hrBfJWRqJvZukdjYh4tE5dwJ1tmtgTrBtdeiS85975JP29co7Wb25Wo1r3pRDkEFX+io90G874qfII+Eow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5telhZSLNsB9r9gpHc+JJCdhN38mD6orT3clR1Vt4Gc=;
 b=JVZmG7mSt2zpgfE4sC0ug/RrQM4d5Qfo1S2OCxShOWF/X2BV+m2KB/2B85eoXM8VeU7vCU6vVYmkhX7v/poQ/ruGR5GpOyeMtOW1mQ6z3gHzzn+l3+iDyhPtnGIwe30JTU6rvKo6BucYQwqlOvyMM70m83yOCZqQMJp9HKoK08m7oDmQb997T+kiXONDXb4eDe6TdVaKdI8uO6ygkeGLQ8JDAPFNEmT3EozgnHdJVwfHUWMEiI3lW2C/K5x2zXSrBOIor2JZasrzH36O0VqafAIKDgr0RH+VhEOr62H3SFMmXcqbiBCnW6Tk6uvWgiD0GuuVb+2zc8jGJOzyibsUbA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:588::19)
 by GVXPR10MB8782.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1d9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Thu, 30 Oct
 2025 16:26:30 +0000
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::8fe1:7e71:cf4a:7408]) by AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::8fe1:7e71:cf4a:7408%6]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 16:26:30 +0000
Message-ID: <6f931a16-6d62-4002-938b-bd366715f602@siemens.com>
Date: Thu, 30 Oct 2025 17:26:28 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/02] scripts/gdb/mm: Add support for powerpc book3s64
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Kieran Bingham <kbingham@kernel.org>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
References: <cc4af3fa0fcda2a52cbbab05463e0ad0561fd017.1756521755.git.ritesh.list@gmail.com>
 <9da03d8e78cd895666deb1aec7ec8318833f1b6a.1756521755.git.ritesh.list@gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Content-Language: en-US
Autocrypt: addr=jan.kiszka@siemens.com; keydata=
 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
In-Reply-To: <9da03d8e78cd895666deb1aec7ec8318833f1b6a.1756521755.git.ritesh.list@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0168.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::20) To AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:588::19)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR10MB6181:EE_|GVXPR10MB8782:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b99bf4f-8e0d-4772-07f1-08de17d114f3
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?clIrNGpkTTZBUk12VDdCNDNJdU1GTkRZdjB4eFF5SUpCZm1ZckZyYUNPa1Jo?=
 =?utf-8?B?eFRsZFI5TlZVVjhNUnNHYzhDRHVpYmVwV1pjVjlVM1hhQUhva2xCWHhnSG94?=
 =?utf-8?B?dUNwU2s3NGdmZlpHczd5T1JyYWowbHJtd2lGOUtQSW90VmVMRng1SDVWRkhz?=
 =?utf-8?B?Rlh1L1Iza2lwYWF3SUw0SzhkQitKMzZjRkp5WTFPeGh1WGNTLzZiRHI0M09j?=
 =?utf-8?B?S1ZKVjV3Sm9Uc3pUeTJxb2xEK2sxWThzM2krSHR4TGdETklUM3cxSjRjcGkz?=
 =?utf-8?B?R2dtdXVyREs5NHB6eVRiZ0VGejlhZjJqaVhpN25zQzJxajFLbFFmNmUyL2d4?=
 =?utf-8?B?cjRKdnVrRE02OE56MUVjZVAycEpwYndtcnF6SHUxdm8zMVdvZnI3TDdKd2RP?=
 =?utf-8?B?SXNWTFF6TnJZMFdVTGFPWTE4NWVTcXA5VnlxUWttYm93S1E4SGc2UHk0VS9H?=
 =?utf-8?B?SVlYb2dhRi91Rkh1K0NBazN0MkNlSTRFbHBzaVdLcWlFWVhCWnN1V3ZldEtv?=
 =?utf-8?B?citnSHdIa2NzUHE1YzZyS0F3WW51dy92SDV2cXl5S0lHRTJrTVVRTTR0dFpL?=
 =?utf-8?B?MzhYQ1M1YlVFRThydGtieGlqT21HdHozNGV0ZVFqL2N5VWhWeEdxN2QxU2tJ?=
 =?utf-8?B?Y3Rzd0xWM0ZLc0o1NGViQUNRdTNMdDloc2xHVW1HcEI1SFF3ZUxJRkJJZzl5?=
 =?utf-8?B?MEtiL0xhS1hWYUVkbE0wdzVsVWZlbmJnMUEzc1A3NVJ2UzcxaUFQenpuMWZS?=
 =?utf-8?B?QmduY21yR0RKYlZKVzZ0RHNTY2hQVWlaejV4S1NwT2FleUZ3YXhSNUE4aWdM?=
 =?utf-8?B?MG5jVkdKcHFpVmVlRFh5Q0RncVB0VFpodzIrQjNVa2hVbGlvd0tTenRrVEl3?=
 =?utf-8?B?Nm1TYVZ1bzRkWlhMT20reGJtSUxLUFZzRW1LblI4dFpuVElxWE4vbkQyTlkw?=
 =?utf-8?B?U0xNWWNFYXJYR0l4ZVFzMndoelZzRWpGcGZTUmwyaUNCRGhqaHBEajdLOGRZ?=
 =?utf-8?B?QzZSZm5mM2dSWXBPekdzWjR3cEp0U1laakdwazV6djhHZGpTbGhaQmJPQXln?=
 =?utf-8?B?WUpnUlhyS3QrVUpFZGIwdDNhcm5nRXgxdXdVL0lPcWs5VWJxWldHZ2szYlZh?=
 =?utf-8?B?Qkk5MEF1d2pTa2Z0TTRuN3RENm5tdHovc2RSOWhIV20zR1lvZ2lKOGhhU05r?=
 =?utf-8?B?d1dYSUJZYkZCbE54bHhRYUkwTERwOVkyMVZJSXFmV1VLVDJueXpoQ3o4aUhD?=
 =?utf-8?B?bGNKSzNYNHVPMTZVdzlrcWR6ZnRMZjE4NFo2TUNWZGJ5N0dBYkFkODZ0NFcz?=
 =?utf-8?B?OGZtdjhra3k5ekFndWg5WWpGT0hmdGpFS0xqN0MxQW9MbXpqRGxNYUJDNzNO?=
 =?utf-8?B?c2g5V25KM2VrODZyb1FrZnhQdDRTbHpzL2dWTFF3TUFqeC9NKzljQmtZdFlq?=
 =?utf-8?B?R3RZV2dlbmR4SVE1SmZDSkEybEFrT0RPaUtsSUtRelRXT3ZRcG04cjl0VjFk?=
 =?utf-8?B?RjZ5Vk1DbG5KM1J2MjJsTy92bEFrTWY2dm52dVM0dlB1c0t4RExMK3dEV3cv?=
 =?utf-8?B?T1JyZnhIOXR5SGExa2kwRDRvZTdXL1ptMGs5cHdQZ2RYN1M4bitiZ1l4dUo5?=
 =?utf-8?B?M0ZSYlJvbVlBQVNXTUFVRUdSWWFSaURQeTJVQlBNL2g1SHpNMHlHYjZsMmRI?=
 =?utf-8?B?NFpTMVBxeDlVRzF0VlpiaFl6WGtGQWFSNStLTDF5bWdyUFNxUFFIYkdzU3BD?=
 =?utf-8?B?U2RBbkNGTW1RV3IxK2wrZHNQM3hUVDd1a09BZVFSZHRQKzdlVEZKcXNpWUhR?=
 =?utf-8?B?UHc5QzU3YUJ4M2drTnFqcVBCeTlBSWUzNzNwWWE5K01QczFxbkZYdmZaM1p1?=
 =?utf-8?B?Y3gxYWgrRlZsSE1PV3NQQzNEdHdGTlhZOWpGQ1cvSmR6eHBNN0FLWDUxMTlQ?=
 =?utf-8?Q?cPyIR3mhSgd32WzDJ3n3gxHQRzTECKKq?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VTU1ajVEU2F4ak5ianJlTElVL0JuQnV4aXRMZ2thYjdNTEx5T1paaCt3NTNz?=
 =?utf-8?B?clRieTZRVXpnZ2wvZ0h5K3hKQTIzQ0hLR0RUd0ZxWWFabzArN25ZR0RJUG9Z?=
 =?utf-8?B?OGs0QmVmQmMyenZlY0FCR0tOS1A4S1NUc3NUSmZxWVY3Yy8zV2RSUElCcHpq?=
 =?utf-8?B?T3c0dWlOL0EzMzdpZ1BkVUdrZmdoQ2YveVRZS0pkc1BjSkN0Y0VCeGR6dGJP?=
 =?utf-8?B?bFJFMmJNcWZvWFFJdnoyMGFTZ0xRb0lyMmx6T09UbmZ2SjZoSzVWa0JvWGYv?=
 =?utf-8?B?K0gyck5ONDk0VUZ6YldBTjZYQ2ZXcjFYYTBtODhPdFQveUZDV2RkbUJIUVBD?=
 =?utf-8?B?Q0JkRUd6aWNQcnltN2t6K2xBT3paNENjcmNqK1VnNzdxbFhFSjRTYzVrTStk?=
 =?utf-8?B?Y1pwMXpGMS9rd2RrbndkeWcvd1VKSlNldnZ6Y1dydDhQa21oWDhtSDEzU3RZ?=
 =?utf-8?B?aGRaSldVWVk1SXg2L2JQSldqY3ZvbTE5aVVnOVNENHpldWJseVFoeDgyTjlV?=
 =?utf-8?B?SU50Ukgydi9TMTJPUXRIYXV5UkFlQnJ4Q0FHUjBWalJiWUJKSjY3Q1laTGpw?=
 =?utf-8?B?R2R1QkNEc1VjZUpOdzhnM1FIcm5NNHp2Q00xdnAxL0NodTB2N1N5NW10djgy?=
 =?utf-8?B?RWJvM0wzRmlzTCtvTTBNSUdWdjJsUHNzOVhYdTl5SkRkLzZDN0p6TUkvTTFq?=
 =?utf-8?B?dk83Qk05aFROVTlYKzBHUEJ6RUxVMFQ0OWRUYmhuWitzL2c2WmluU2NMTzIz?=
 =?utf-8?B?dVNESzZLSUxpaGFESU5IZWU5SE54dDN3VGJNaXZWTlFIQWxRTTVIYWdLS1hG?=
 =?utf-8?B?L1pyMDNIdW01dWNTaThJVjZyd0s3YXprWTc0TnM4S0FBRVBtZ2swOUVQWFl1?=
 =?utf-8?B?UDZvK3RaenZTbTRsR1U3YmIreFdncGZROERTVXhHTURjaTlOcFU0cFgrNktR?=
 =?utf-8?B?UDlqM3ZTYyt1aGdtc3R2SWRWc1J1endpTDdQVlA5dUpQMS9JRnA1RGlsMHc4?=
 =?utf-8?B?UVoyT3dxZjh4aGtCaVVIazFmQmJiblZOUEc0UXV0NHl1dHFXQldiemhSUUdJ?=
 =?utf-8?B?Z0RPTWFHRE1aYUorclNyYWJJb1R1VU5CZmQ4aXN2ZDVLOWllbjI5bEpwSFJJ?=
 =?utf-8?B?NVhkcys1aFV6Z1BVaEYwMnB1Y1ZMc0VzZGhxZWlUZEhjZXhQOHlTNlBKNWl3?=
 =?utf-8?B?TkFqQ25tcFd1RnFhcUs2YTBVZEdqMFM5YTQxdExyb0p6R2xtZWdycDFyUFkw?=
 =?utf-8?B?QWczM3REYThGSWVrQjc5OHZUODRKM1ovYXVXb1pGYVJaL3VjaWlTd2psTXc4?=
 =?utf-8?B?MzhuWWM1bi92YjdPOFJBWVZFRGdQS09iWksxTjRLQ1ZjNG4yM0RpODRqQW5j?=
 =?utf-8?B?WmMyVjljL25LN3BmeTk3ZkdTZG0xZ3RWUFRjR0x3T3A0MGVmZCtxckxSZ0xV?=
 =?utf-8?B?WHFVdWdxL1B0aVNvMGZWd1IwNEJpZjdjWDU1M3VNbWJhdkFKcnd2TzFpMjF6?=
 =?utf-8?B?Rlo0VUYyS1ZEUUd3TGlMMUFMRytBQlN5Um1zdDV1R0picE85UFlMeUNmcTZJ?=
 =?utf-8?B?a29rKy9wemJERVFHSkFzZ25uTkhGczUyMzNINjduL2gxQ2Z0Z2ttNVd2SHdF?=
 =?utf-8?B?SWEzTzcza1UvQ0pXS21RYXBGZWwrUjhRd2I5NFB3RWFKK2pVS3lVSG9oQXM0?=
 =?utf-8?B?cDB6eGdKRUd4NHQ3TFVZelp4cVFmclhaeWVxcVprMWQ4eUFvOUxaY1pvTmx0?=
 =?utf-8?B?Q0daeEJycFVyeXFNemhLNkJ6ckxWbTdRZ0tNL1JRNnpYdUFSeTdGc2R4eTd0?=
 =?utf-8?B?V3RPY3UvZ05UOHJLMVVSUTdMbmRORUI3TCtOck9xdlZSMTVsSU04MjFVM2Nl?=
 =?utf-8?B?STdzbHpodzRyenRNSjk1R0cwbC9EYnlXSnVUV0srU2d5bGllZDBQakY4YkZk?=
 =?utf-8?B?MlZ3ZGNmNFhEaUdiVk9tZzlVYmhJTDBKdVVLeXhuTmo2RllSNzFsU2NHMThm?=
 =?utf-8?B?YVo1bDJBczdDN0FpR1g3N1Qvby9IWU53ZWJpeFB3UlcyVHdHTnlmdnYyS0Rn?=
 =?utf-8?B?dlBtSVZvcnJxcmxzVUhtWnd5R3JCaTUyNXBtTEFYdWt0bFJYYkZUaHo1TlJN?=
 =?utf-8?B?ZE5UZjdXeXc3MTdVVnU5UVV2K3hNRmlpZFJkTHdDWUlXNUZMd2lXZ3RFb0cz?=
 =?utf-8?B?K1E9PQ==?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b99bf4f-8e0d-4772-07f1-08de17d114f3
X-MS-Exchange-CrossTenant-AuthSource: AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 16:26:30.2356
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oUUdCZD2POkxgjoqSkg87Wd8TZkI13KQoDKt6+847VrWUT+kOwSb1vvapOQufctfPpy4gpXT8ec2KgLfVPaExA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB8782
X-Spam-Status: No, score=-0.5 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 30.08.25 05:45, Ritesh Harjani (IBM) wrote:
> This adds page ops support to powerpc book3s64. Following operations are
> now supported:
> 
> lx-pfn_to_kaddr -- PFN to kernel address
> lx-pfn_to_page -- PFN to struct page
> lx-page_address -- struct page to linear mapping address
> lx-page_to_pfn -- struct page to PFN
> lx-page_to_phys -- struct page to physical address
> lx-virt_to_page -- virtual address to struct page
> lx-virt_to_phys -- virtual address to physical address
> 
> lx-vmallocinfo -- Show vmallocinfo
> lx-slabinfo -- Show slabinfo
> 
> e.g. Below showing lx-mmu_info command i.e.
> On Radix:
> (gdb) lx-mmu_info
> MMU: Radix
> 
> On Hash:
> (gdb) lx-mmu_info
> MMU: Hash
> 
> e.g. Below shows that struct page pointers coming from vmemmap area i.e.
> (gdb) p vmemmap
> $5 = (struct page *) 0xc00c000000000000
> 
> (gdb) lx-pfn_to_page 0
> pfn_to_page(0x0) = 0xc00c000000000000
> 
> (gdb) lx-pfn_to_page 1
> pfn_to_page(0x0) = 0xc00c000000000040
> 
> Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> ---
>  scripts/gdb/linux/constants.py.in |   4 ++
>  scripts/gdb/linux/mm.py           | 114 +++++++++++++++++++++++++++++-
>  2 files changed, 116 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/gdb/linux/constants.py.in b/scripts/gdb/linux/constants.py.in
> index 154db10fe94a..97a731db6e89 100644
> --- a/scripts/gdb/linux/constants.py.in
> +++ b/scripts/gdb/linux/constants.py.in
> @@ -153,6 +153,10 @@ if IS_BUILTIN(CONFIG_ARM64):
>      LX_VALUE(CONFIG_PAGE_SHIFT)
>      LX_VALUE(CONFIG_ARCH_FORCE_MAX_ORDER)
>  LX_CONFIG(CONFIG_PPC_BOOK3S_64)
> +if IS_BUILTIN(CONFIG_PPC_BOOK3S_64):
> +    LX_VALUE(CONFIG_PAGE_OFFSET)
> +    LX_VALUE(CONFIG_PAGE_SHIFT)
> +    LX_VALUE(CONFIG_KERNEL_START)
>  LX_CONFIG(CONFIG_SPARSEMEM)
>  LX_CONFIG(CONFIG_SPARSEMEM_EXTREME)
>  LX_CONFIG(CONFIG_SPARSEMEM_VMEMMAP)
> diff --git a/scripts/gdb/linux/mm.py b/scripts/gdb/linux/mm.py
> index 7571aebbe650..9e5b1632f910 100644
> --- a/scripts/gdb/linux/mm.py
> +++ b/scripts/gdb/linux/mm.py
> @@ -24,10 +24,17 @@ class page_ops():
>      def __init__(self):
>          if not constants.LX_CONFIG_SPARSEMEM_VMEMMAP:
>              raise gdb.GdbError('Only support CONFIG_SPARSEMEM_VMEMMAP now')
> -        if constants.LX_CONFIG_ARM64 and utils.is_target_arch('aarch64'):
> +
> +        if utils.is_target_arch('aarch64'):
> +            if not constants.LX_CONFIG_ARM64:

This reorders the check, pulling the dynamic part before the static one
- why? Not that this is run on every command, but at least
initialization could slow down by some cycles (or more...).

> +                raise gdb.GdbError('ARM64 page ops require CONFIG_ARM64')
>              self.ops = aarch64_page_ops()
> +        elif utils.is_target_arch('powerpc'):
> +            if not constants.LX_CONFIG_PPC_BOOK3S_64:
> +                raise gdb.GdbError('Only supported for Book3s_64')
> +            self.ops = powerpc64_page_ops()
>          else:
> -            raise gdb.GdbError('Only support aarch64 now')
> +            raise gdb.GdbError('Unsupported arch for page ops')
> 
>  class aarch64_page_ops():
>      def __init__(self):
> @@ -287,6 +294,109 @@ class aarch64_page_ops():
>      def folio_address(self, folio):
>          return self.page_address(folio['page'].address)
> 
> +
> +class powerpc64_page_ops():
> +    """powerpc64 minimal Virtual Memory operations
> +    """
> +
> +    def __init__(self):
> +        vmemmap_sym = gdb.parse_and_eval('vmemmap')
> +        self.vmemmap = vmemmap_sym.cast(utils.get_page_type().pointer())
> +
> +        self.PAGE_SHIFT = constants.LX_CONFIG_PAGE_SHIFT
> +        self.PAGE_OFFSET = constants.LX_CONFIG_PAGE_OFFSET
> +        self.KERNEL_START = constants.LX_CONFIG_KERNEL_START
> +
> +        # These variables are common for both Hash and Radix so no
> +        # need to explicitely check for MMU mode.
> +        self.KERNEL_VIRT_START = gdb.parse_and_eval("__kernel_virt_start")
> +        self.VMALLOC_START = gdb.parse_and_eval("__vmalloc_start")
> +        self.VMALLOC_END = gdb.parse_and_eval("__vmalloc_end")
> +        self.KERNEL_IO_START = gdb.parse_and_eval("__kernel_io_start")
> +        self.KERNEL_IO_END = gdb.parse_and_eval("__kernel_io_end")
> +        # KERN_MAP_SIZE can be calculated from below trick to avoid
> +        # checking Hash 4k/64k pagesize
> +        self.KERN_MAP_SIZE = self.KERNEL_IO_END - self.KERNEL_IO_START
> +        self.VMEMMAP_START = gdb.parse_and_eval("vmemmap")
> +        self.VMEMMAP_SIZE = self.KERN_MAP_SIZE
> +        self.VMEMMAP_END = self.VMEMMAP_START + self.VMEMMAP_SIZE
> +
> +        if constants.LX_CONFIG_NUMA and constants.LX_CONFIG_NODES_SHIFT:
> +            self.NODE_SHIFT = constants.LX_CONFIG_NODES_SHIFT
> +        else:
> +            self.NODE_SHIFT = 0
> +        self.MAX_NUMNODES = 1 << self.NODE_SHIFT
> +
> +    def PFN_PHYS(self, pfn):
> +        return pfn << self.PAGE_SHIFT
> +
> +    def PHYS_PFN(self, pfn):
> +        return pfn >> self.PAGE_SHIFT
> +
> +    def __va(self, pa):
> +        return pa | self.PAGE_OFFSET
> +
> +    def __pa(self, va):
> +        return va & 0x0fffffffffffffff;
> +
> +    def pfn_to_page(self, pfn):
> +        return (self.vmemmap + int(pfn)).cast(utils.get_page_type().pointer())
> +
> +    def page_to_pfn(self, page):
> +        pagep = page.cast(utils.get_page_type().pointer())
> +        return int(pagep - self.vmemmap)
> +
> +    def page_address(self, page):
> +        pfn = self.page_to_pfn(page)
> +        va = self.PAGE_OFFSET + (pfn << self.PAGE_SHIFT)
> +        return va
> +
> +    def page_to_phys(self, page):
> +        pfn = self.page_to_pfn(page)
> +        return self.PFN_PHYS(pfn)
> +
> +    def phys_to_page(self, pa):
> +        pfn = self.PHYS_PFN(pa)
> +        return self.pfn_to_page(pfn)
> +
> +    def phys_to_virt(self, pa):
> +        return self.__va(pa)
> +
> +    def virt_to_phys(self, va):
> +        return self.__pa(va)
> +
> +    def virt_to_pfn(self, va):
> +        return self.__pa(va) >> self.PAGE_SHIFT
> +
> +    def virt_to_page(self, va):
> +        return self.pfn_to_page(self.virt_to_pfn(va))
> +
> +    def pfn_to_kaddr(self, pfn):
> +        return self.__va(pfn << self.PAGE_SHIFT)
> +
> +    # powerpc does not use tags for KASAN. So simply return addr
> +    def kasan_reset_tag(self, addr):
> +        return addr
> +
> +class LxMmuInfo(gdb.Command):
> +    """MMU Type for PowerPC Book3s64"""
> +
> +    def __init__(self):
> +        super(LxMmuInfo, self).__init__("lx-mmu_info", gdb.COMMAND_USER)
> +
> +    def invoke(self, arg, from_tty):
> +        if not constants.LX_CONFIG_PPC_BOOK3S_64:
> +            raise gdb.GdbError("Only supported for Book3s_64")
> +
> +        lpcr = gdb.parse_and_eval("(unsigned long)$lpcr")
> +        # Host Radix bit should be 1 in LPCR for Radix MMU
> +        if (lpcr & 0x0000000000100000):
> +            gdb.write("MMU: Radix\n")
> +        else:
> +            gdb.write("MMU: Hash\n")
> +
> +LxMmuInfo()
> +
>  class LxPFN2Page(gdb.Command):
>      """PFN to struct page"""
> 
> --
> 2.50.1
> 

Rest (including patch 1) looks good to me, though not looking deep into
the architectural bits.

Jan

PS: Sorry for the late feedback.

-- 
Siemens AG, Foundational Technologies
Linux Expert Center

