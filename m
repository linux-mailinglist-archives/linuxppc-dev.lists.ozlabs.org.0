Return-Path: <linuxppc-dev+bounces-357-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 552A595B825
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 16:16:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqQHl180cz2yGl;
	Fri, 23 Aug 2024 00:16:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f400:7e1a::621" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724336211;
	cv=pass; b=V7aIu4JiXU3GlYMX1OQ4f4iyLwpM/kTFTdT8Os7tzyYJbE5tm5njyU73MMi2EP/BL8U705FCRI5EZK0Vs3Jv6LSWL9WuByMxiXojSRjhIBy6aROvej5j1MRe+vQ36eaz9di52MEl+A9xyAq7nXh3C3Trs0l6OPEcOBV8J5IAPDfDAZWtv9mgXjiNHdpKe7Cjg1lY+sAzQq4/60B7ok4BqBRLlRpmdR50EJPy4VJO7gh8cdjZz9riumg04gZeHUPzf38CdQ1N1y+wjzMEdVzBbwJCCphtfef1K1/IUUVJDvgASz3p81uaMKJ4A/6jQgKXzrWAhvU4tSL4/aNwbXNk3Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724336211; c=relaxed/relaxed;
	bh=PC+vGxT0OQg3X/+UUgLRUzPkyAZr5UyDUjGaMYsrbiw=;
	h=ARC-Message-Signature:ARC-Authentication-Results:DKIM-Signature:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:
	 Date:Message-ID:References:In-Reply-To:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:user-agent:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityhea
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=cs-soprasteria.com; dkim=pass (2048-bit key; unprotected) header.d=cs-soprasteria.com header.i=@cs-soprasteria.com header.a=rsa-sha256 header.s=selector1 header.b=Vkm65aoI; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f400:7e1a::621; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy2@cs-soprasteria.com; receiver=lists.ozlabs.org) smtp.mailfrom=cs-soprasteria.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=cs-soprasteria.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=cs-soprasteria.com header.i=@cs-soprasteria.com header.a=rsa-sha256 header.s=selector1 header.b=Vkm65aoI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cs-soprasteria.com (client-ip=2a01:111:f400:7e1a::621; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy2@cs-soprasteria.com; receiver=lists.ozlabs.org)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on20621.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e1a::621])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqQHk2tKtz2xFq
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 00:16:49 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ECprcJmmSfRRxuda/M0uo3M4KkpHht48xOGaHXGvR43PZz9O5HDbxIRF4PZSzokjhsyxgZjb4VpPgq9D9Y6LSh0bhfHsbN2ONXABypivo2tzfdbUBYrpD8bUUevy94GkhZoJ9rcCoOPpZaJr3A27AFO5baONeFJQliW/OJrwT4twFqChsZUXadwhytsvHrZIF+UgPlq8HzOwuJJUjNAW8XMGico9croOFt87YM4EBdOsz4nMLjpZME5JxIgAVgA8Hi7tHtE7XSywvlCW5Q2GOsXD5qEHZjcmtSO2oHSgd4EdEpvNiD+QOQZE9rkoQZ2nAWsJhqzkDSOjzvGIXU7GWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PC+vGxT0OQg3X/+UUgLRUzPkyAZr5UyDUjGaMYsrbiw=;
 b=rVCDNWjh2Mu6D/5eDTSt0ImvlGXV7dIcTHUtXA4JpYhSZusqFJJhoXMGts3myAuNPBEc002gPAp7QcbfWx1Ti1V0iydnFKiZ63K5JYimQCUiJQVd+ShhCfVI9ITdLqrXfRQYTtcADuB9QOpJjDfnHM52OMiH5ITkw4IVP5/5YMs3KZ5ZwbTJux64sEZgGDmRqI/CrWEOca6PYpBUTlj402jBhamsWTPi5MmK+dPCiveINYskU31Ovm/5t7z3GhPp51xhovqYcv1yKIEv21r0sV1RDBf4pzmhFm692m4++13CN6lh0tMRgyk875EDBFTlApLxLlCAKF7I5cKPaFUerw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cs-soprasteria.com; dmarc=pass action=none
 header.from=cs-soprasteria.com; dkim=pass header.d=cs-soprasteria.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cs-soprasteria.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PC+vGxT0OQg3X/+UUgLRUzPkyAZr5UyDUjGaMYsrbiw=;
 b=Vkm65aoIsnsN8F5hoSlX+Z2oI9oN7hgYKwM3J2W2d6cT4n40P9oYKGpTDUQl2k0fN13z49+PCCL9VmSVVx0RPNcC7M98K7Q6KuluKVt431Q8nYKDk6Nc0IqGpBiKMqIX5dMI6ADHiBSWBPCORcqh+Yf3uujUonV6VKpO/FHoBVgbBo3KdGcN5AllUaNZG/+AUWaSXMTBebf0gEsH/Lm4tcg+ni49lcYb0NC5ufh3t7IaPntWxx0cQaXDTjDlNbthwBQaVOHDTNpFQvh6IUTPf1qYcHYz4Sv9GCb9P+pdlwG+y+yyfgEJmITKLHN+GVMSRWrHJTxrhyZUwIUJvyD1uA==
Received: from AM0PR07MB4962.eurprd07.prod.outlook.com (2603:10a6:208:f3::19)
 by PAWPR07MB10024.eurprd07.prod.outlook.com (2603:10a6:102:382::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Thu, 22 Aug
 2024 14:16:30 +0000
Received: from AM0PR07MB4962.eurprd07.prod.outlook.com
 ([fe80::6724:2919:9cbb:2bb2]) by AM0PR07MB4962.eurprd07.prod.outlook.com
 ([fe80::6724:2919:9cbb:2bb2%4]) with mapi id 15.20.7875.023; Thu, 22 Aug 2024
 14:16:30 +0000
From: LEROY Christophe <christophe.leroy2@cs-soprasteria.com>
To: Gaosheng Cui <cuigaosheng1@huawei.com>, "mpe@ellerman.id.au"
	<mpe@ellerman.id.au>, "npiggin@gmail.com" <npiggin@gmail.com>,
	"naveen@kernel.org" <naveen@kernel.org>, "akpm@linux-foundation.org"
	<akpm@linux-foundation.org>, "david@redhat.com" <david@redhat.com>,
	"Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>, "tglx@linutronix.de"
	<tglx@linutronix.de>, "bgray@linux.ibm.com" <bgray@linux.ibm.com>,
	"joel@jms.id.au" <joel@jms.id.au>, "bhelgaas@google.com"
	<bhelgaas@google.com>
CC: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH -next 1/4] powerpc: Remove obsoleted declaration for
 _get_SP
Thread-Topic: [PATCH -next 1/4] powerpc: Remove obsoleted declaration for
 _get_SP
Thread-Index: AQHa9JQXe0SCO3TGGkOsy1obkdLLGbIzUpsA
Date: Thu, 22 Aug 2024 14:16:30 +0000
Message-ID: <1c4f7f77-ad18-4956-b794-98b452d0780c@cs-soprasteria.com>
References: <20240822130609.786431-1-cuigaosheng1@huawei.com>
 <20240822130609.786431-2-cuigaosheng1@huawei.com>
In-Reply-To: <20240822130609.786431-2-cuigaosheng1@huawei.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cs-soprasteria.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR07MB4962:EE_|PAWPR07MB10024:EE_
x-ms-office365-filtering-correlation-id: e3419674-6194-4208-cfaf-08dcc2b504e8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|921020|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?SUxBc09Nc21rcC9OYzFOZDJ1OXMxNXVSTUs5U1ZxbTcxZEJERHhQUFNYVC9W?=
 =?utf-8?B?WWRqZ2R2bTVqU2pFRVY2QWxrN1hHYTZhWURDajJGdk5oQWhweXZwYVN4K0V4?=
 =?utf-8?B?Mkh4bVNKb3Z6RkZFZ2wyL0ovcTlyZ0RpWFlZb2lXc3A0UUVkc3lqSkp5bG4y?=
 =?utf-8?B?UkRWT3FIemJtRFQyUmdqRndRTHdlb1lEa0VUcGhzTG9XTDM5bS9HY1F1NXZT?=
 =?utf-8?B?K2JETEJtV3hmRnFTb1BRRGlFZHBqNEVlVGpwcnY0MEdXRERZRXQ5R2htT3Vn?=
 =?utf-8?B?RnYxeGJKT045V2hGYkYwcWs2RTRQZ0QyYkJwMmRPVmhmWVNNai9QVFZabjhu?=
 =?utf-8?B?UE42UEpMaVlZZmRIVUVDT0RBZTV0ak9mc1Baa0hUakl5TEtlQlF2d2lmM3F5?=
 =?utf-8?B?TWF6SzRjM0d6K1VjWGlZWUg1VXpJaXRiaE1rWE0yZ2VLQ0Y0WjFyMFhvem05?=
 =?utf-8?B?b0dOYVFaYXloNWNpRW4vRHJFVzRpUUhmTFFmaU9JUFc1N0hsU0tiaHBwZzdi?=
 =?utf-8?B?WkU3WktZeVkyRVNRa1dlaVgxYjlDbnJsazY5aGwxcTRwOTllL0dpZ1A2TG91?=
 =?utf-8?B?NHVXeHFDS3oxZjJ6Q2dTRGYxSkFZNDlXV0dCWnFkbjVKNERtdFp4ZTdrM2po?=
 =?utf-8?B?dEpySjN2SW5ScTFHV3VDNktlazFDZ0xYMFN5UmJQRU1GamNNd0ZZQytEY29B?=
 =?utf-8?B?NkVNVGhQcjZMQXFjaDg3VGhtOVJtUHJrVVo5ZXpBQ2N5NUQ1ZllEQTB2VVpI?=
 =?utf-8?B?dkRxQ1pSbkk1RkJtamY5RStwVjJjeFhobHFTRFRaUUtzME5zYUgxbXp4bUZJ?=
 =?utf-8?B?RHA1OWczTUhYcGxWc21hMklTNUpXZVltZW03YVZ6bTdFU0dqRml4cUsySEcw?=
 =?utf-8?B?T0RZSzgwdTZrc3c3WjJmNEpjL0xFZnlhNVFvN2NkeG9KbGJCMjRybG8xNzVI?=
 =?utf-8?B?U2s2UlhpNFl6NExMOUh6dlVkY1F5U0V4VkVyd3hvdXdjQ01JM09ZS1VNRVNI?=
 =?utf-8?B?WUxVamplTmJPTHJzeE03blMzZHNscUNwRmhhWUZJdHNNYncxdjhxamRVQmdX?=
 =?utf-8?B?ekJUZ0FkZlN1MnhSZ1JhUWUvRTcyUTFWdFN2Y09hbHZzTTlPR04wMzY4bzdm?=
 =?utf-8?B?cU5IN2xMYmZiSmg5b2RuSXJsRWp4YmFEVUFsVmhPK2JGNThnVk9wNHVBTGtZ?=
 =?utf-8?B?cGJCcUhuL1Q3NUZlRTlGZ2dPNjdpS2xLSEQxa1cvNWRTTU01VnVkejExM2Nh?=
 =?utf-8?B?SkFtTU1JeGJyUW1vV1RHUndUNEN6NTY2am91Yk40R3hGK0puaGFTOHhwZkFX?=
 =?utf-8?B?aFRlazZIS2RBMWZaT29RYWJRWERvVzBYNGtsajNGYUtTRUNuOFcrUmlkQmFh?=
 =?utf-8?B?Y0JENThoSStGalVzRFkwcXQwd2FWdDl0bmVqSi83RGVoUFovbVcvK3F2QWZy?=
 =?utf-8?B?S0dobmxQSDRWZ3VRSjV3b1dwRXgwVVA5VmtmcmxBWm9IeTVtb0VBWlZ4QXlh?=
 =?utf-8?B?RXAxN1l2QXVQTlBVdm1COXg0MVRvRlF4WGlKV1Z3M3IvWXF0YUkzdnFwQjJT?=
 =?utf-8?B?bkZOQ0VWS3VlWHVQY09FVDdkUzN2bC81UWNwSEtJTVl3eDFnMm05Y1hJZWYy?=
 =?utf-8?B?WUVON1k4N1FJRC8yTlRSYlh0OWRLRjM3N2hJSlhWMko4SnhxY0c0V3M0dkxx?=
 =?utf-8?B?WE40VExQM2lWZkZiRmlMZXRQVm1nY1M1RzNmb2l3YTcrd0lRaWdvSnFBb3Fr?=
 =?utf-8?B?QnV6QkZLak5xK1IyU3B6bit0RFhCcDRWMVErT25HNUl4UkVSMzBlN2ZaN25U?=
 =?utf-8?B?YjdSV3NyZFlnNkhJemRnUEMxQnNjSUVPY1JEb3hBZFcrTEtaV2IzS3IrR3F0?=
 =?utf-8?B?SzFlVGdQdmRKTzR5OGJxU1lVeDc5UXBScG9nZUs4MVJQNDBseVNYb1hlVjR1?=
 =?utf-8?Q?HBB/KujXH+U=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR07MB4962.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RkxiWjhDTzlVYlBFWnVodStkNFdLaVNrMTdzTytNandEVkR6eHpna2lPM0Zh?=
 =?utf-8?B?VEFNSVdPZUJWYXM4emNtSmVUeFFzSzhxK3hrT0o2VFM0ZzhNOE5UM3lqdmIx?=
 =?utf-8?B?d0NmVjBsU3NmT2swOFJDM2NJQ0lGMG5ubjRWQWhIeHViN3VXOWU2QUdwa1py?=
 =?utf-8?B?V3RoMHJ0Qk1WcVY1SXJ2N2F2bWFVL29IZ3BvZTk0NHRGa1lyRmhpdFRFOHh2?=
 =?utf-8?B?TFJVditnc0VaRjJrNXIrc0w0M2JWbWhFK1Y2aENaNkFMMmFMUTkyN3NqUDhl?=
 =?utf-8?B?L3hYN3hNWEtSdkN6ZGIwYVdEL2dqciszNG56cjRFL255Um5ZV2RhUitYTVg1?=
 =?utf-8?B?TDFCNWRKeFcwemhuN0RvRnF0Rm9iTVl1dWE4aWZsZW1nZnpHenFsR2NhSXZy?=
 =?utf-8?B?aVVpRzUzaWp2dEVwdnBoVFlFNks1bmpMMWhRMzkvSUJ0YjR1WnNqY0FnbTVQ?=
 =?utf-8?B?NDVud1J4SWRESEhCdGUrNFZSaEhTYXVwRm4zL0lsRmZnRUV6QVljRysrZnlj?=
 =?utf-8?B?UjdYOG9zN2EvbDJyNWxoYk9KcEVhZEQrNTFTSFlEM2N6eG5LZ2dRU20vNGxC?=
 =?utf-8?B?NEdVOStpbkdFZ1Mzc2VoZDNSeHFOTmJTNzhXdHpucVluek9EYlpCVmdNQjUz?=
 =?utf-8?B?NjRIZzQzTWxCMDc0S3hFaG5FQWE1aXNJTHJKYjZYbVdyMUxiUFdBQlBiMFpi?=
 =?utf-8?B?RHZHUVRUZHZyTFlIckMvS0RDbENQOVAzeE15eDVSNDRVVlBhU25zdlpnNVZU?=
 =?utf-8?B?VzRPQlgwTEdyci9VVmJyWjA4NHN5NWNVOXdGZnhrWmdkS3c1c2doRE5wcmVJ?=
 =?utf-8?B?ZTJTdGsyenl4K09EWE43akZaNnlOUlUveWtXcEszSlQvV0VkRGNxSGtLY01m?=
 =?utf-8?B?TG4vcFh1REdYekZzMjFkSkxxNUpvbUxFK1pLTlkwZi9wQnAxRyt5Qyt0NFNz?=
 =?utf-8?B?Y2RnWE81YkxPcVVVV3RPdEt2a0oveENxS09rRG9aZVhNZVNZc1owMXFqbjdG?=
 =?utf-8?B?dkZtM3FDRUIyTFRIN0xtTVJlbGpRVmxHQS9UeG5OcTJRUXRGaGhrbVhSYy9W?=
 =?utf-8?B?QlBoZ0FscktZVjFmTnhKZEtGUU9UcUVmMGU5VVRQWWxKamRSeEVTSk1CTkts?=
 =?utf-8?B?MzhPb09tS21tb2xoTVJpOFFBUzBiL1l6VVRtT1hKQWdSOWR5QXVwRVNQV05Z?=
 =?utf-8?B?TEV5MTlHaGpKZVhBK2ZHd1U0SHRwU2JYZ2k0aVZtc08wQVdJZ0NrajRJV2Zn?=
 =?utf-8?B?U0ZwaEpKQUpSQTlEenk3RWZwOW1DRHhXZVdEQit5ZExoQTVaVWxJU2ljOU8r?=
 =?utf-8?B?T21HOCtUTGRGMS83cTZic0QvK3ZHYmdHSTRlcU5qM2twenlBWDZIbkM2bVp3?=
 =?utf-8?B?cjBDcGN5TmJ3SWFQWWFncisxWEZCd0lKU051cUFpTVdQbjl5UGI4emhKejFa?=
 =?utf-8?B?VFlHb0l2T05vdFhQSnF5UzRmTitscGNtendGOHRWRFlXS2JXckQxVE8wZlZP?=
 =?utf-8?B?YmtMSFhjeXoySDJVYnc2SlBJRWV5QlJpaUZ1eFpWTCtMVDlQUzFOK2Z5UzF1?=
 =?utf-8?B?c0ZmU1I2ZlcxcFVGSGhjRzBYM005a3BVUXVtQTZJeDlLS2drTkNqZ1lOWllS?=
 =?utf-8?B?M2dvcjI3VTBsT0lVamR0endLWFZBRHh5MVFQR2VneXVncFczNmFmYVMzRW9K?=
 =?utf-8?B?Y0JyUElzZzdMMldhOEQ0MEsyY1ZkU2tzUmFmNUdSaHJhdC9jbFBPVlRUWURt?=
 =?utf-8?B?b2FZZ1dqWUpiYy9NOXFLUG9DTUcvb21kSUdRL01rL2JWc3hxdzRheFAyZEpS?=
 =?utf-8?B?S2IvSS9PZG92QVpsYjVBZ3JpbG5LWVJOcVRBcStEV1h6VlljRzJIU3hmRFYr?=
 =?utf-8?B?TElkY1RMa2N4aGZleXdoNGtaazMyN0tXajV6NUYwM2RqbGMyRDhCWUJvOWRl?=
 =?utf-8?B?b3dRUUVmaDIzaDR4L0t5Qm9wL3VhanlQeVYwS0Fha1FSd0EvLzJmWHB6Ykcy?=
 =?utf-8?B?eGNFTE9qRTVWOFdjeEwxTU01emgvVmxLRFpzZzMrQ0Y1TU0vMmQwM3hnQ3pa?=
 =?utf-8?B?aXZxK2tGUlMwMkNIbUJva0lhbUxKMk1iTVROUG55Q3MwS3h1K1Y1ZDdBSlM1?=
 =?utf-8?B?bk9FeXcyaWVZMjhLY0FxK3VHcmpPeXF6U3NtYitFd0NsTWlsaWY0NWJRdk9v?=
 =?utf-8?B?dkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <87A9D0DE2E901A4B98175B4A3C666246@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-OriginatorOrg: cs-soprasteria.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR07MB4962.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3419674-6194-4208-cfaf-08dcc2b504e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2024 14:16:30.6393
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8b87af7d-8647-4dc7-8df4-5f69a2011bb5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hQSyf0+XGSO2zdbpKUO41Iq5+dcdHh2gzJKHeEDfeX5WgwXn4Dsy+VanUh7GC8ol4kCt8NwpDz8F/YdPSQlVt53ejZ2ocXNMQlUAoReO18G815pVqSiRXPkumzdPgPD6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR07MB10024
X-MS-Exchange-CrossPremises-AuthAs: Internal
X-MS-Exchange-CrossPremises-AuthMechanism: 04
X-MS-Exchange-CrossPremises-AuthSource: AM0PR07MB4962.eurprd07.prod.outlook.com
X-MS-Exchange-CrossPremises-TransportTrafficType: Email
X-MS-Exchange-CrossPremises-SCL: 1
X-MS-Exchange-CrossPremises-messagesource: StoreDriver
X-MS-Exchange-CrossPremises-BCC:
X-MS-Exchange-CrossPremises-originalclientipaddress: 93.17.236.2
X-MS-Exchange-CrossPremises-transporttraffictype: Email
X-MS-Exchange-CrossPremises-antispam-scancontext: DIR:Originating;SFV:NSPM;SKIP:0;
X-MS-Exchange-CrossPremises-processed-by-journaling: Journal Agent
X-OrganizationHeadersPreserved: PAWPR07MB10024.eurprd07.prod.outlook.com

DQoNCkxlIDIyLzA4LzIwMjQgw6AgMTU6MDYsIEdhb3NoZW5nIEN1aSBhIMOpY3JpdMKgOg0KPiBb
Vm91cyBuZSByZWNldmV6IHBhcyBzb3V2ZW50IGRlIGNvdXJyaWVycyBkZSBjdWlnYW9zaGVuZzFA
aHVhd2VpLmNvbS4gRMOpY291dnJleiBwb3VycXVvaSBjZWNpIGVzdCBpbXBvcnRhbnQgw6AgaHR0
cHM6Ly9ha2EubXMvTGVhcm5BYm91dFNlbmRlcklkZW50aWZpY2F0aW9uIF0NCj4gDQo+IFRoZSBf
Z2V0X1NQKCkgaGF2ZSBiZWVuIHJlbW92ZWQgc2luY2UNCj4gY29tbWl0IDkxN2YwYWY5ZTVhOSAo
InBvd2VycGM6IFJlbW92ZSBhcmNoL3BwYyBhbmQgaW5jbHVkZS9hc20tcHBjIiksDQo+IGFuZCBu
b3cgaXQgaXMgdXNlbGVzcywgc28gcmVtb3ZlIGl0Lg0KDQpOb3Qgc3VyZSB0aGF0IGNvbW1pdCBp
cyByZWxldmFudCBzaW5jZSBpdCByZWxhdGVzIHRvIGFyY2gvcHBjLyBub3QgDQphcmNoL3Bvd2Vy
cGMvDQoNCkZvciBhcmNoL3Bvd2VycGMvIEkgdGhpbmsgaXQgaXMgY29tbWl0IGY0ZGIxOTY3MTdj
NiAoIltQT1dFUlBDXSBSZW1vdmUgDQpfZ2V0X1NQIikNCg0KPiANCj4gU2lnbmVkLW9mZi1ieTog
R2Fvc2hlbmcgQ3VpIDxjdWlnYW9zaGVuZzFAaHVhd2VpLmNvbT4NCj4gLS0tDQo+ICAgYXJjaC9w
b3dlcnBjL2tlcm5lbC9wcm9jZXNzLmMgfCAyIC0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgZGVs
ZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2tlcm5lbC9wcm9jZXNz
LmMgYi9hcmNoL3Bvd2VycGMva2VybmVsL3Byb2Nlc3MuYw0KPiBpbmRleCAzYjUwNmQ0YzU1ZjMu
LmU3YjcwYzJjYzAwMSAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL2tlcm5lbC9wcm9jZXNz
LmMNCj4gKysrIGIvYXJjaC9wb3dlcnBjL2tlcm5lbC9wcm9jZXNzLmMNCj4gQEAgLTcyLDggKzcy
LDYgQEANCj4gICAjZGVmaW5lIFRNX0RFQlVHKHguLi4pIGRvIHsgfSB3aGlsZSgwKQ0KPiAgICNl
bmRpZg0KPiANCj4gLWV4dGVybiB1bnNpZ25lZCBsb25nIF9nZXRfU1Aodm9pZCk7DQo+IC0NCj4g
ICAjaWZkZWYgQ09ORklHX1BQQ19UUkFOU0FDVElPTkFMX01FTQ0KPiAgIC8qDQo+ICAgICogQXJl
IHdlIHJ1bm5pbmcgaW4gIlN1c3BlbmQgZGlzYWJsZWQiIG1vZGU/IElmIHNvIHdlIGhhdmUgdG8g
YmxvY2sgYW55DQo+IC0tDQo+IDIuMjUuMQ0KPiANCg==

