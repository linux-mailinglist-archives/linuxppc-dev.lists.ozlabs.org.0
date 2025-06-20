Return-Path: <linuxppc-dev+bounces-9579-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BC21EAE1554
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jun 2025 09:57:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bNqb14crbz30Qb;
	Fri, 20 Jun 2025 17:57:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c20f::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750406269;
	cv=pass; b=PYUlp998gJa//zjK/R/UDHmjUaOtumcz2LoIh+U/MBlb7FiSFCnD7qbxqwJ0Ky/mO2MWm0mTphYW7wl2EyTqToNL9fqvKeQbC02yXcUGTkXNEkN9Hf4dxGHfk2zXjPhhQix9w8+cl1Yw0vSitW9L6OYeZ3G0UJ0CsFb/S5RMwAanszod7lFAPmqhX/UgBE1CMPcOecWc5K76YkFwRgW1Muye9lso6yWDM7MlsX/8YUJ7WoaskErJWZ3oB2Kh0koT5ZWqJhzIIm0i7USN1UGwtVonBEPF89qgKW2KXkFvOZWfsZM0LEqouFfLtDLBu+H4S/C/vwW6NcSwafr7fg6Tew==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750406269; c=relaxed/relaxed;
	bh=zKda50V2hSjAw2K/xEfdbQwOdQtvVOkcI5ZAhnKWCfE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Z5T3vN/ATXOXHxIZEullWrXHbwlAY6baAwhmg5ycDeGbB4oq9x94Ae2KRvhRMdiwH8zGiZuV4og9kR5q8DtpPpCwC0IHcwaJ76cP2YH+cDFjpwb1/Qd+Q3eQXg7i8R8p9RMZBhjXy6FabUSKBFVYxLj1q2ll7lJfea7AZgzkl4NhSSvTRwFU/+JPzp8clxyj9DE/LwvfTlmp/X2dv069Z3IgK1A9XSJuMHkszIpGlX38uZFqGnSX+jjlgjlYb7500I/+1moxBoVP7+tUAuoFMb/Udf1UKUlIyqFQS3/d40dMA5Mz1tmJXADPGp2+EHOnF8HFGuZz8jOfwHHugGFXow==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=cs-soprasteria.com; dkim=pass (2048-bit key; unprotected) header.d=cs-soprasteria.com header.i=@cs-soprasteria.com header.a=rsa-sha256 header.s=selector1 header.b=GfFdzd0G; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c20f::7; helo=osppr02cu001.outbound.protection.outlook.com; envelope-from=christophe.leroy2@cs-soprasteria.com; receiver=lists.ozlabs.org) smtp.mailfrom=cs-soprasteria.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=cs-soprasteria.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=cs-soprasteria.com header.i=@cs-soprasteria.com header.a=rsa-sha256 header.s=selector1 header.b=GfFdzd0G;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cs-soprasteria.com (client-ip=2a01:111:f403:c20f::7; helo=osppr02cu001.outbound.protection.outlook.com; envelope-from=christophe.leroy2@cs-soprasteria.com; receiver=lists.ozlabs.org)
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20f::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bNqb00QG7z30QJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Jun 2025 17:57:47 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HnAYQUMR0FwZww47ZVKFlNrOFYhcJgmYgD9EN529Su+qirQqdEwKF0ce35H42Z0Re0BOlBKc0CkZK9/fYQO0RquvAH0rVqBsUutWuSzHkZK23M2ult4qFBlLktwoCiuv4C0tRB0+muhrRrkZ9+M80gDbNS0+or21xaQBUoyoIwtsIDAuMa5ch46XI/KGlkw5PmkgZR4Blm0qatRMa3roUlSYRVDiCh4WJCncII+52YQua8HR40JJcGH3kfQKDKFAGD2ppq8Me4Ri7opwxW1rbR2fR+LCA2uJ7vANZV5eSxccQovzuZ4lHJvGrkMFDw+WQRHTYRMu0QYn+NcZ7N90Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zKda50V2hSjAw2K/xEfdbQwOdQtvVOkcI5ZAhnKWCfE=;
 b=ItImZwawpcRGMkqHg514abD2vQXynZ/aTi6zTKwAIzyKrdCTol+0YuHLFsu8IGRBwGb1HNV220VWBaV7sJPbMUBPm+DWFDnt733BdWK25G9f/GOKD70GgXmQRFDdVgld6dmDAfzpHRIoQBWv1o5HoLVtc0iYPGcnedd8JnQjchyJUh3KYtlcAxp+2UwKE8M+9yLHdpJTUQnVn8zJVXX7OXxh3rEfaNPAnJy0v+RCRo7EQH3nQfVWUeqkK0nQifXO1km9VhS0n7Ujx4fnPGC+GKaD4wsE7fJck8JKQKiXV4I+VLvh5d4y93jJqXVS19xjxvR5PKOc6TsNGD0NZkdW8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cs-soprasteria.com; dmarc=pass action=none
 header.from=cs-soprasteria.com; dkim=pass header.d=cs-soprasteria.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cs-soprasteria.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zKda50V2hSjAw2K/xEfdbQwOdQtvVOkcI5ZAhnKWCfE=;
 b=GfFdzd0G5cdHF5YR++UaRl8QRR1UcMuJZwQ2LfQ1kKvopcXsmf1q1LXGg2RrOi+r0+rHJUdaqtwqj6dZCC/xcjWEqo0CJ0K9NRV4875UJeW4j88+dgxAtsvhAm2ZJy+sDRf9k+ZgzOtdrelBFjDBfb36BXELyClKzXn0UeUfmXH9ZfUvH0xwuqTFFSYfVr35x7zuIhVUOiFpA+wKvTsWKaBhNUor3SsFb6kTVuNuK1nTZr+Pge1p1W7hHxzembS/mLcNBIT1dB786/2BRygSqgxBlC1+eqekexPzI/ijMd9/pazeuGvAyKe4q85yvrAzL9Mjd8yE19i2Glm2+lwdLg==
Received: from AM0PR07MB6196.eurprd07.prod.outlook.com (2603:10a6:208:ed::33)
 by PAWPR07MB9663.eurprd07.prod.outlook.com (2603:10a6:102:383::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.23; Fri, 20 Jun
 2025 07:57:23 +0000
Received: from AM0PR07MB6196.eurprd07.prod.outlook.com
 ([fe80::7cb7:ff63:d358:1a]) by AM0PR07MB6196.eurprd07.prod.outlook.com
 ([fe80::7cb7:ff63:d358:1a%7]) with mapi id 15.20.8835.027; Fri, 20 Jun 2025
 07:57:23 +0000
From: LEROY Christophe <christophe.leroy2@cs-soprasteria.com>
To: Thomas Fourier <fourier.thomas@gmail.com>
CC: Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman
	<mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] powerpc: floppy: Add missing checks after DMA map
Thread-Topic: [PATCH v2] powerpc: floppy: Add missing checks after DMA map
Thread-Index: AQHb4bjJD4aKwG/kmECO6INc1n60OrQLrneA
Date: Fri, 20 Jun 2025 07:57:23 +0000
Message-ID: <b54bbe95-7136-4ea7-a6e6-8bf0e1d12a7b@cs-soprasteria.com>
References: <20250620075602.12575-1-fourier.thomas@gmail.com>
In-Reply-To: <20250620075602.12575-1-fourier.thomas@gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cs-soprasteria.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR07MB6196:EE_|PAWPR07MB9663:EE_
x-ms-office365-filtering-correlation-id: 337cd805-61a8-46ce-1036-08ddafd01760
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|7053199007|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?R2hRN241WU5QWGcxMVVUWWhTd3dPS0JlVE1PVk1pa01MTUxrWkFBQU5BTElv?=
 =?utf-8?B?eWVBS3RsYWE2ZU1wbW9rMzRaQ3JHYlJzaVRLc3hJZHl0WFkzR1prcVkySzFn?=
 =?utf-8?B?SDA4SlRaYU9PNTc1dzZjNk8raFUwVUZtS3RMQzl0M25sNWZ6TFFOaVd6UnJa?=
 =?utf-8?B?aU5ERkg1ZXM3eDkwRUpPd2lzWHJGR2RqT1UxRFA4elJFeUo3ekhObjNoQUh1?=
 =?utf-8?B?Wis1UUJyRi91MXZEeHFQa0x5S1pNR3dvMmpkZThKeHhKZUloc2locVVIZVJh?=
 =?utf-8?B?aVJiY2N4b1ExNnNPLzNWbFpITEZjbVJsaTQybVdWSWs2RENyQVNsLzVwNFlT?=
 =?utf-8?B?dmFGeGpocU9vbmtGeWdrRkNuL2duRkRiL05lbWRiT3JlZU96NHIxSTFaMzZs?=
 =?utf-8?B?NnRSNTBCUWt4MWlGT2V3bGF1c3p1UWdjem15T0tWNmY2RkxPWkRXN1Zsd3Vp?=
 =?utf-8?B?RURKVDIzdUZIQmJDdTk0dHJTTlJlWmFaQ2NkVjdJWDlNQ0ZqSWRqYk0rNHhh?=
 =?utf-8?B?cUpEc2ZSREp2c0E3b09tNjJGaWp1UklybE5oZzNOMkcwRWxLTDZqYVRZOWhs?=
 =?utf-8?B?THd1dXN3Z1pBVEdWSzNjVlNSUFN0aXB2bUs0SVdCc1JlenRTNUsxNi9Qc29i?=
 =?utf-8?B?WXRNNjhKWjNWTDNZVjhyNWxaanR2UWNaWHNrY3p0VDREU1lHcDVOR0lsVTZ6?=
 =?utf-8?B?c0hVZndxYktoRkxQYktobitaVjNMRUNWNGtpTjN2L1MyNUxrN2wxQ29WM2JM?=
 =?utf-8?B?SXgrejlvcHoycEduQ1dBbVF4K1ljbXJqcWNmZnB0MmF1eGtOczhuRzVjUEUv?=
 =?utf-8?B?aDJFcFJBWUtzaDNMQlUwU0wrUXY4Y3JlNkFDenhOam5OVTJ2THFTYTQzRm8x?=
 =?utf-8?B?MnRYUGI2WEJIM3dkMXY2UXNQZnRVN0R5YVpoWkQ1d3dVZUtUaHVKNmJ1bWE2?=
 =?utf-8?B?YnBmdkd4Y1hUZlFzR21XSUdnWDBDdHF4aHNTTFpjbmJXOUVZTklMV2ducVBD?=
 =?utf-8?B?eXlPMkJ3M1lBWW41V0pQRVFpajMxL1BvN05tWTlIWFAwWk5tTkJQQU81YTR1?=
 =?utf-8?B?YjIreWZGT2Uybm5leVVuaVpXaHpGMGpuQkdLOGV0K0IrMG4zb004SURuRndE?=
 =?utf-8?B?eHQ4cXJpN3Z2bjk0a2FhQVZHOURLS1VYK043dWFEOE5jL25sT3IzTy9JOXBD?=
 =?utf-8?B?T3lKa29aNWtMNldna0psNDRRYmFqTWZ0Z3lCUm9wK2hiTzVsSnBWSTJxY1lh?=
 =?utf-8?B?cE0zMDVoNnhsNHl3K1BHZm5kSlpWTlQ1TEpTMHg5UGkvT1hRSytiRTRKNkM1?=
 =?utf-8?B?WDRTRUtiUzA1N2VZeGpQRjd5VG8zQlU1bDRkQ0ZpSE1vaTNWM1gxcmdEblFN?=
 =?utf-8?B?T0MwYUptWnJVKzRRa2h6MzVmTHcwQnFpRHhacTlXTlU2eXVML21xdmgyQ0ox?=
 =?utf-8?B?WG80TDRSaGxnYmNTQXR3MDRxWm1pOWhQdEVkVmZwdmZzMnkwWUVhVVhkVFNO?=
 =?utf-8?B?cWJsd3laZVNLYWFQYm1mNmxiVEU4azFobGthcVBTMld5VzJwaWxXOUh2VlRU?=
 =?utf-8?B?bzBReGpOV25WOUxQb2p0alBkdzVJaU4wN2hnS0dSNHJPWFlLa1V6VlovbEpL?=
 =?utf-8?B?ZVh0bGJ2WW1RazNyYUhqQ1BocnlFNEVjcTBhZHJ5aEVTNkhMV1ZvVjI2UzQ5?=
 =?utf-8?B?RWw4UGdncjBzVnQyR291c3Y5cENLMHZ0cUU0aVFyM0lOYmdGRU9nN3dkbWJK?=
 =?utf-8?B?NVVNTnk3bDZiS1I1TXVPN0lTVGUwd2lubnlFZUxtTW9PUWtMWkx3enAvM2Qr?=
 =?utf-8?B?L2xEelRQY29OSExsV015ZkRub3MxdlJGYVBTS0NraHFYTVl0cHFSY0hxU2l6?=
 =?utf-8?B?cy9IWVl5V09CSUpoUWRvVGRUZG4yVUwzekN2bnRZWENXVU9FM0gvZ2VjOFZQ?=
 =?utf-8?B?SnVuNitScnVvdkZkVGxUczFqYXRhTVVuY1llNDdQR3U5Y0FmNXR2OUpWR2Nz?=
 =?utf-8?B?OUp2NXJxaC9RPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR07MB6196.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cVgwbFFFa3hNK3ArcVY0VkNpcFZDVzBDYWZZUXh4OC92cGhvK2dtb1JjTmMx?=
 =?utf-8?B?UjFjZVJaY0g0OW5VNTJJQTh1eE9KYzFkU2M0bnNXNlRCcUtTRGIyTzQrR0Ni?=
 =?utf-8?B?L3Q2VzBpclZQNDg3ZTVobC91c21BbzF5RzhKaVV2aGV0UlRhZHFpUjk2OTlS?=
 =?utf-8?B?YVU4VHhpY3hIbWxTQWh3RXlnOE1nR1Nuc1ZzL2l2UElNYmpZNVZiZWszcytz?=
 =?utf-8?B?UjNwNmJDWjRxNG5kK3BmbStmU0tMN09JMURzekVya2NXMmRnTFhYdXJCVExB?=
 =?utf-8?B?NnlZaXNmNGFUblBZME9SN0NwL1dxMXZSQURPT3A3S0g4eGRvcTZLb09IYzdO?=
 =?utf-8?B?bnN0THkzZ2Y4anFUZDNVNDZXcmFSMGhVU1B4dGZFeXl4NXYzZlJIcWNlS3Fk?=
 =?utf-8?B?UHdpSnBuZjI5SGdUd3N5NENwOUxuS29CQ2hwa1N6T3pSWVRuUm1iSFA1SUti?=
 =?utf-8?B?MmROT0JNVzZIamx0MytHOTU5TDV4NkJVSFNnczZCcTM5enprdVY0RVgxa2VL?=
 =?utf-8?B?ZFhxb1hHMVVwcEhOY2VMYmgxbGhsaFA1WWlxcWtCZFRxVmpQQ1dWZFZiSTkr?=
 =?utf-8?B?MGVPZGhDTXdSeEtVd3E1U3U4SkVKV2F2Z2VMU01qUHhjaU9VTy9PL0I5MVk2?=
 =?utf-8?B?NU9GZXlrZHlmanJ2SWpKTVFIdzhpYW5sNHBseWFBaWd4blRoZ2gvNnoyQ2ll?=
 =?utf-8?B?Y0FMQllwNnprMi9KZDMrY3FPNjZOQjBCMzcrL3gzT0JZdy9ZbjZwM1ZReEFo?=
 =?utf-8?B?cVRmRnVwY3NpMjdUM1ByR1RFeUxpZFdJdjNDd0FSVStFeGpTcTZlT2RGemJ6?=
 =?utf-8?B?SkpuVUxua3BTVXJFV2VMWEl0OHdXVzM2OXBwMDRjdnJNdXVKQ0xMRmpNdWU1?=
 =?utf-8?B?N1Zkc1YzVUlDbmhveWdtWTNlaCtJTjBBNDBrN1RoNnUxa1ExdlZVVmoydlk0?=
 =?utf-8?B?eURQRFFxbmhIcys0aTVxREJOMUU1dzNwSzE5aVhhdXJkeWl0d2JPQWJIVFNs?=
 =?utf-8?B?SEtWOGNXYWJGd1JHK1ZVNGcxTnV3NDhkUEV1TEJORkoxbEEzQkVqNFlVenV4?=
 =?utf-8?B?Z2U0c0J6Y2FocEVwSXY2NGxqQ1VCeUpuWlhpeVNJRmhsVmpUYUQ0MTBoYnM0?=
 =?utf-8?B?d0oycysxOTV3Z2Q3bUZhbmd3eksxekJyZGVHcWVqaTBzTXRpWjhHcTZpOWNz?=
 =?utf-8?B?L0FHWXFGeE0zSWs2Y0Z2UGxjSERhZXM4TEJ0UkJTRHZUVmN4L2ZoaGcvNktp?=
 =?utf-8?B?T3IyVU8zaEwwSGdrREhiYUJSYnhtRFhWcWFHWVVHMnJRbzhDMzhVL0ZHTVFo?=
 =?utf-8?B?RzdGU2xXRWNIYWVTUmszZk1mc2wwcHVCdDFWLzh4dnRjVlBiMFFuQURYUXRa?=
 =?utf-8?B?WHp4bnhkNDVUZEZzRjVnSDNHeTIyaXNMSmhERnhBT0h5VEFHbmZMUXBpd3RV?=
 =?utf-8?B?dFhKKy9uUGdFMDdVcEkrNFQySjI0S0M2WnVBUTBNQWZBeVoraGlUanFOZ2k2?=
 =?utf-8?B?eE9taWl4TmVoUmx2Z1h0dUcrZGdBSm5BVWtsdEpPdDhqdktLVHRyTkM5Zlp3?=
 =?utf-8?B?YWxHQS9rb0xnZU1NTXozZW5oZE5HTk4rZWN2UVF5ZlNUc2lLK1Q4cDNSR0dY?=
 =?utf-8?B?ODhrSUM2dlVzQUE4YzJEcnNJRDdTaEY0ZG45alVmeXh5eGI2WjFqeWtPUzJj?=
 =?utf-8?B?NTlGb1cvV0piOFQ1Rk5QQW1Wb0dScGJVOTFUaUtHRFRyVFhaUk5aWXM1ZXlu?=
 =?utf-8?B?cXZFK3pHMHc3U1V6WnRhRzIzQURxTGV2aVZLbnR1eFNocVp5aml3czlMWTlL?=
 =?utf-8?B?dGF0YWFaZ1UvUXd1TWRkT2ZPZUsxNVM4TnVMMDU1YStETzkxa3lDRDd5YlhO?=
 =?utf-8?B?bFhPcHUvNnBqK0VTSTlrbklxcnhNZXNXSFRxdlBpYjZVUWt0NHlBZ1BFWVNH?=
 =?utf-8?B?US83UlhKeWRJeVpBdnRGTHZKOWtBVjE4UFVaSkdSOUxtbENXTHBRYS9xWXlZ?=
 =?utf-8?B?L2REdUt4VStYRnN0ZkJuZ2kzNW9pVjJzVHlSQ1lXcEkyKzVvbzUrZ2pXQk1K?=
 =?utf-8?B?STlidmxoUHJGRWdGZnJOc2w2dnlZS2Z3ZkVhalVTU2pnS3ZNSmE3UDZEZWZO?=
 =?utf-8?B?Qm5Lc1RtSDRIMnRGVGRTTXZPWVY4a29HL1EzcmhweWRkQXhqT3dVdTNuY2pt?=
 =?utf-8?B?ZEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <45DA32F81B12444080B219897FE72CA6@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
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
X-OriginatorOrg: cs-soprasteria.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR07MB6196.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 337cd805-61a8-46ce-1036-08ddafd01760
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2025 07:57:23.6479
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8b87af7d-8647-4dc7-8df4-5f69a2011bb5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tt/1zvHsdF+3MNXlg6X+LNpPCNm6e3a82Hz/svw5eJIgbXMWVkrALlzZmg5h5T0wfvflnjGI0QJxg5N4iIg0C+QweNbTKMVEK4YASH1YQm3aP1jG6AQloQ7PYZA6SpGX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR07MB9663
X-MS-Exchange-CrossPremises-AuthAs: Internal
X-MS-Exchange-CrossPremises-AuthMechanism: 04
X-MS-Exchange-CrossPremises-AuthSource: AM0PR07MB6196.eurprd07.prod.outlook.com
X-MS-Exchange-CrossPremises-TransportTrafficType: Email
X-MS-Exchange-CrossPremises-SCL: 1
X-MS-Exchange-CrossPremises-messagesource: StoreDriver
X-MS-Exchange-CrossPremises-BCC:
X-MS-Exchange-CrossPremises-originalclientipaddress: 93.17.236.2
X-MS-Exchange-CrossPremises-transporttraffictype: Email
X-MS-Exchange-CrossPremises-antispam-scancontext: DIR:Originating;SFV:NSPM;SKIP:0;
X-MS-Exchange-CrossPremises-processed-by-journaling: Journal Agent
X-OrganizationHeadersPreserved: PAWPR07MB9663.eurprd07.prod.outlook.com
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

DQoNCkxlIDIwLzA2LzIwMjUgw6AgMDk6NTUsIFRob21hcyBGb3VyaWVyIGEgw6ljcml0wqA6DQo+
IFtWb3VzIG5lIHJlY2V2ZXogcGFzIHNvdXZlbnQgZGUgY291cnJpZXJzIGRlIGZvdXJpZXIudGhv
bWFzQGdtYWlsLmNvbS4gRMOpY291dnJleiBwb3VycXVvaSBjZWNpIGVzdCBpbXBvcnRhbnQgw6Ag
aHR0cHM6Ly9ha2EubXMvTGVhcm5BYm91dFNlbmRlcklkZW50aWZpY2F0aW9uIF0NCj4gDQo+IFRo
ZSBETUEgbWFwIGZ1bmN0aW9ucyBjYW4gZmFpbCBhbmQgc2hvdWxkIGJlIHRlc3RlZCBmb3IgZXJy
b3JzLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIEZvdXJpZXIgPGZvdXJpZXIudGhvbWFz
QGdtYWlsLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUu
bGVyb3lAY3Nncm91cC5ldT4NCg0KPiAtLS0NCj4gICBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20v
ZmxvcHB5LmggfCA1ICsrKystDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2Fz
bS9mbG9wcHkuaCBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9mbG9wcHkuaA0KPiBpbmRleCBm
OGNlMTc4YjQzYjcuLjM0YWJmOGJlYTJjYyAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL2lu
Y2x1ZGUvYXNtL2Zsb3BweS5oDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9mbG9w
cHkuaA0KPiBAQCAtMTQ0LDkgKzE0NCwxMiBAQCBzdGF0aWMgaW50IGhhcmRfZG1hX3NldHVwKGNo
YXIgKmFkZHIsIHVuc2lnbmVkIGxvbmcgc2l6ZSwgaW50IG1vZGUsIGludCBpbykNCj4gICAgICAg
ICAgICAgICAgICBidXNfYWRkciA9IDA7DQo+ICAgICAgICAgIH0NCj4gDQo+IC0gICAgICAgaWYg
KCFidXNfYWRkcikgIC8qIG5lZWQgdG8gbWFwIGl0ICovDQo+ICsgICAgICAgaWYgKCFidXNfYWRk
cikgeyAgICAgICAgLyogbmVlZCB0byBtYXAgaXQgKi8NCj4gICAgICAgICAgICAgICAgICBidXNf
YWRkciA9IGRtYV9tYXBfc2luZ2xlKCZpc2FfYnJpZGdlX3BjaWRldi0+ZGV2LCBhZGRyLCBzaXpl
LA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZGlyKTsNCj4g
KyAgICAgICAgICAgICAgIGlmIChkbWFfbWFwcGluZ19lcnJvcigmaXNhX2JyaWRnZV9wY2lkZXYt
PmRldiwgYnVzX2FkZHIpKQ0KPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVOT01F
TTsNCj4gKyAgICAgICB9DQo+IA0KPiAgICAgICAgICAvKiByZW1lbWJlciB0aGlzIG9uZSBhcyBw
cmV2ICovDQo+ICAgICAgICAgIHByZXZfYWRkciA9IGFkZHI7DQo+IC0tDQo+IDIuNDMuMA0KPiAN
Cg0K

