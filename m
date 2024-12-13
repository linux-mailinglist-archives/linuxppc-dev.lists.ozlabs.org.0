Return-Path: <linuxppc-dev+bounces-4082-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C9D9F0578
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2024 08:27:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y8gsF3JPbz2xKN;
	Fri, 13 Dec 2024 18:27:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2612::609" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734074849;
	cv=pass; b=ONG3PIFpQnX+quAqhSUB2kZmM1aISOnWRf+2EIqzU7vWEOGKzWOyxh4Lvcj+j6lMW02BT7vmzqX6Sirr+VqtJ58ubA/qK5dVUhSTAVHvlkk3+METh7HEFG7QByLTxAJtXl3OAA0wNcHv0vK0dll3XMyb/FWcsbiO/E8Fi9APXhcHCk6/0zFjJ67IDC7cm/3P/y0lfXWddWC9p+9H/hpajVA0jBx3GghBPLi2m0ZUyMXy6dnfUtijutQx7Z0bLHWB3sB1i5VBc+nmmyqDPD+Eg9wfktCFjUIN8Mnd5sTLzFCzZo/B9E9j4AnFxhoHpr0vrs5HqqSfjhL1Vh7brYj3CA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734074849; c=relaxed/relaxed;
	bh=hdL3UCKYJLbJXvGaCsvSydMZY+u1pV5Ev91i21iPTNw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=C8JJlp9BLayI+fmZ3EyOHs+Jv63jTL1r6mol6C6JUfrdSFhi01M9Fkc8TmaKyymWJn3qtdFebgmQjJ94Kob98MDFy2LOw3UOz/OXhtQVBUYFVOkIY2OvEYCxQizTJXFuq2cCZcZZOpp6GXCx7tne/YP+f9+LawnW/XtrLUVRX0xDZdo1M77GNcbMCmaB3YXDINK3e3FIAoD6EwjzOjfysUe+RYpSLjQ+3fgSFP9sV4wVDjk8hS+MrloV8c4S3Ndg7PUMGyT6Vx9PThnbebY7uKUuTFdEbBzqf/Log0Ta3aGPw/55Ksa+OFUQKmWNsl8ZELJTTkRQ9vVm1Ph5SQ/HCw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=cs-soprasteria.com; dkim=pass (2048-bit key; unprotected) header.d=cs-soprasteria.com header.i=@cs-soprasteria.com header.a=rsa-sha256 header.s=selector1 header.b=Wrtfd0VX; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2612::609; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy2@cs-soprasteria.com; receiver=lists.ozlabs.org) smtp.mailfrom=cs-soprasteria.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=cs-soprasteria.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=cs-soprasteria.com header.i=@cs-soprasteria.com header.a=rsa-sha256 header.s=selector1 header.b=Wrtfd0VX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cs-soprasteria.com (client-ip=2a01:111:f403:2612::609; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy2@cs-soprasteria.com; receiver=lists.ozlabs.org)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on20609.outbound.protection.outlook.com [IPv6:2a01:111:f403:2612::609])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y8gsC6hhJz2xCC
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2024 18:27:27 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BNVnEcfoCiEffcNBryJothiprXT4Pt0CrrI4hE0DWzM/vOKGpsf/6QIPmg+DjJ2RTGPuOQh2PjittWfnjHfxLQsI8kmIomCW0CAPsuEFwAqrfhNl4hQxC46U01/IIk+Ch3Ce1F4kkwdan+re4BYc1exN4Ovl8ks6S73mHn5mlPUT8AGR3G2JVHhzchZsbFITMjKFcwuhHhC7ma1twLbVT63T38BPQr8/+q50j1ekKMiL5rOD0XvBUfWoZ7OKiZD/IDOWqI+kzKgmUzc2CGQT77fpXkex1gMma7dguMtgvUt15FnECSz+1LENEYS3SYXfZfQ4/86jQETsHlfPh9Sd1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hdL3UCKYJLbJXvGaCsvSydMZY+u1pV5Ev91i21iPTNw=;
 b=x2kBnDLNTbu039GSym4y3uKHXZqKink3ymHqz/eYbWWmDBzrUxtHgkPfxYb2OU9BifoWwMBleZvbICGTE910VEOY8yWlH8eahv4QVeODMs8lTwZO+aSQgNcscl3q+LIv7FXOowa2A3YlZDRLaTV5Jrc5w1yV6J5xUobPZODN/LPYU2bjcYc5UCnr/j7JVL27yEQa762Ag/uCo7OGSvqmt1ClzSzQrRyHsK6GPR00EPIj+YU7yDerIZatH51lF6QMeoeLR9zrrPknbkty/8+i4g0BG5FaAWzi7fUfRuyjD7Lz5LQgG5hodFvSJtJS4RyDbMKkmDnbvVQeT77lR+fESw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cs-soprasteria.com; dmarc=pass action=none
 header.from=cs-soprasteria.com; dkim=pass header.d=cs-soprasteria.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cs-soprasteria.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hdL3UCKYJLbJXvGaCsvSydMZY+u1pV5Ev91i21iPTNw=;
 b=Wrtfd0VXOesybT/CY7vFDtxML8TmqSOlhvxCzClZflhWPXOMFomR6MzAXnY6lXYNiOUGvWtoP5ScVasu+DXKerYnlczEFi5xCit7064cTXyb1olT7lO8rPRNhGlTgo8UIHbwMXI0WIJGt/Km/f7ybG3EfZTehweLT8Ad+sFJ046229ttenTCmHLUxLSo3WO3e9+4cSKJOSPA3m4q2Wd4lL+NlQ9iJJy2oMRTsRpMCjFm8rb67GtYWSd2r2zHoU9k6PAqI2TNCDDtIHngHx7odmuofD0247/hk6iu/Vruy0Pg+81d39jmfrjvqYTV8sn8/CKRFWGq358aNejGOD/zIA==
Received: from PA4PR07MB7455.eurprd07.prod.outlook.com (2603:10a6:102:b9::12)
 by AS8PR07MB9111.eurprd07.prod.outlook.com (2603:10a6:20b:567::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Fri, 13 Dec
 2024 07:27:03 +0000
Received: from PA4PR07MB7455.eurprd07.prod.outlook.com
 ([fe80::191c:a08d:4945:6288]) by PA4PR07MB7455.eurprd07.prod.outlook.com
 ([fe80::191c:a08d:4945:6288%6]) with mapi id 15.20.8251.008; Fri, 13 Dec 2024
 07:27:03 +0000
From: LEROY Christophe <christophe.leroy2@cs-soprasteria.com>
To: Frederic Weisbecker <frederic@kernel.org>, LKML
	<linux-kernel@vger.kernel.org>
CC: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Andrew Morton
	<akpm@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, Thomas
 Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 06/19] soc/qman: test: Use kthread_run_on_cpu()
Thread-Topic: [PATCH 06/19] soc/qman: test: Use kthread_run_on_cpu()
Thread-Index: AQHbS+Mex5HqM2GsQkaLVT6cfvGz17LjyQcA
Date: Fri, 13 Dec 2024 07:27:03 +0000
Message-ID: <986fee5c-8537-498f-83ec-65a7c7c7a71c@cs-soprasteria.com>
References: <20241211154035.75565-1-frederic@kernel.org>
 <20241211154035.75565-7-frederic@kernel.org>
In-Reply-To: <20241211154035.75565-7-frederic@kernel.org>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cs-soprasteria.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR07MB7455:EE_|AS8PR07MB9111:EE_
x-ms-office365-filtering-correlation-id: aa59d417-63ba-458b-bb31-08dd1b478a4a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?RW1udzFrNVhQN2NNemR1dnhjZ29WT0RycE5nYUIvaHNUZEtuclhYVFlwQVNh?=
 =?utf-8?B?dXlXL0k4UmxFQ2VOUytvTEdJL2hvWU1raVJnU2VmaUNwVVdwMzNHemhqNlVP?=
 =?utf-8?B?dFUrVWwyQVJ1UlhYemgrNngwb2R3RzdKQ0tBS2FQVmxwYVB2ejJHaWlHTlp0?=
 =?utf-8?B?cHYwaFBseUNnTWhKMlE5Tk9mSDZXZGpxQS9oczRZZjlxVks2eEdTMWhHT1hz?=
 =?utf-8?B?U3ZpaUhNN2J6a1VDKzB0UEZIUmJHRHNLQ1phU0NEVk93dVdCaUMrUUFmWVNy?=
 =?utf-8?B?TFFMb3hmdkQrM0c0M3FmQ0EyVW15bjN2RnFsNGZBd3QrQkdtZ0FrSm9UWDQz?=
 =?utf-8?B?endqQ2EzNjV4TldEdmZVWVVGajltODJXQWhGVUJxdENGTzBCVkNaNURjS1Ey?=
 =?utf-8?B?QmxjalBKZ1ZObHFKcXJqdWsvSzRtRWNtMTJtUmdCS0J3SURoVUhmek9wSFFa?=
 =?utf-8?B?azhIYjgxZGF1T0JicGd6SG1WQW9rTWNwN0ovTUQxcllSN01xbVZjNXhqK3F0?=
 =?utf-8?B?ZGF2Q1V6T1hrQ1VidVFhZllpSVJuOG5kK2dCSU5qRlZLZ29qNGJtaHpEL3dw?=
 =?utf-8?B?ZUdrdXZXZXcvdFZhVTlWVWUxdGtMVlBsUFp2Uk1HMXpxRFBIb3J1aTZ4a0Y2?=
 =?utf-8?B?NVRsL2cvd2dWa3VoZEJBdmQzOFpUOG1PbDVhTVE0UGRmNzlLUWkySFVXclRE?=
 =?utf-8?B?L0NyUG1VaWZaM095bWp2akpLcHkvQUY1WnlCNHM2MWlDWjlaRU5hU29qVWpG?=
 =?utf-8?B?WGZKQjZSSURxbENLcG1CVXpkd2hnSGZCbkNOcVZLUlNuTXdzNU9vMHl4U1kw?=
 =?utf-8?B?ZTd5T1h1ZGVpdjRIR01CemNHVVhxT2cxayt0M2c5T0FidzlYTWZFTGVUbWtZ?=
 =?utf-8?B?NE1YKzM3dUtieFFYUDArM1Z3UVlyV0VWSFNaWGxIcUN5Q01wKzhZUHZOcHo5?=
 =?utf-8?B?WEdIVDlMYlZLSGVRUTN1TlNDRDhEdVc5SjhPMEJtR3hVakRhckwvbDRPcFZJ?=
 =?utf-8?B?dXJXQ3VqTUFpZVJWZ0ttakczUXNCbVZPQmFvTFFWWnBWNHJxRXFvdG9qSG11?=
 =?utf-8?B?NWNCZitHOHUyQ2FUaUNxNmRpdjlkZTJYcE1xYS9qQVEwNGxWbkFOZTVkV0Fw?=
 =?utf-8?B?c0Q5M2pOamNQVzJ3SngwL2FKaFZ2aXhDUzEydmJ2dHNJZXcxTDVRZWRmd3dD?=
 =?utf-8?B?Q1QzVkNPZlJSYkc5R2FCUTR2L2p2NzVhR2NDQlk2SGdQVzNxR2UxQzdOUEc1?=
 =?utf-8?B?blgzZTgyUzYveHZtM25DZEh5RWF5RVUrc0FYQ3lmOXk5MVJ6T0tnejNNemcr?=
 =?utf-8?B?NW0xVXdzM3lMNnMxUklKaGkwOVd1K202Y2ZEUXpoM2lOazB4a3pPaExFUFlY?=
 =?utf-8?B?blFHdUs5eVUrSUlOL3dKK3h0L1N6WmgyUG1hNGZKeUFyQmljWlVySVBVVGll?=
 =?utf-8?B?Rk1KVVVacy82UStQdG9ZK2RTNy9ObFNNb3JWS0gvSDZJTXJ2SWJpWi9ERDlU?=
 =?utf-8?B?L1pESWlHb3VwcVgzbThSMjZKSjk1WGxNL29BU2xxUTJSU3BnRnRhZXZwMUtk?=
 =?utf-8?B?NVJBaS91SUdkUUhDU2dhVm9SSGJsN2pubC9LZjh3RVJtRkloOS9wM0lKcVBw?=
 =?utf-8?B?RUk5YnhiWHhWbGxLcW1nQjB6dWlZQ2Ziem96M1BBOG1GcTJUQTNFc04zNXVr?=
 =?utf-8?B?QzZXNDBzZGp2UXE2UDJURkN1ZFRXblJFYW9HZ09BZWwxVzZRRUdmNmtxY1Vh?=
 =?utf-8?B?OUc2RFplUjlNUmJiTnhXVDE0SWQxRmpOQ2FzTFRKdFN1M0EwYzliZ0NqRE5z?=
 =?utf-8?B?aVRnSHNqeVo1cDYvMGFKU1dLNHMxTTQ0N1d4ZUdyNlg1eFkxVW9GRXcyc2tJ?=
 =?utf-8?B?d1V1MVRtZ2wxbEdoQVE2MnExQkVabHFLd3lHSWNTb1g4UmFKYUJ1SXdpTHVY?=
 =?utf-8?Q?PdQHZ9k3ewPaTGbN4jUH7ikPe1UDwXQi?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR07MB7455.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dlhnRVluU25QM2Z0QzNnRWEzSTdrZjdYT2RNSEFPNUVlZW8yVUd6WFd6Rmtn?=
 =?utf-8?B?Y0FQcnB2N1JNQ1c0RGwwMWRXdlgydURRMHEwU290QzJ5L3VQdVFESEJpSDhV?=
 =?utf-8?B?R0hsaHVzM3RNRXRVeHVCWWRHZHVIR1lEWXp3L3lPcFN6dDRSRXk2blV1Qmxy?=
 =?utf-8?B?VHRRelhjcTMydGZ3Tk5PZlI3eVBhRmpndWc4amxuYjI4VTUvZnhPckZWaE9Q?=
 =?utf-8?B?eDV3VlNpa21nWTJUU1N5SFAvelF0OHlobCtoaHNaaHlJNTAyOTdFTExPMkhH?=
 =?utf-8?B?di9EeG5nQUpPWkY1RDF3Z0VueW9qa2hNalM0WS9SSUtuSVVmV3dkZm5DYmsx?=
 =?utf-8?B?OHdXaWN6REVyVyt6YzR3ci9CUno2U3VSaEZkSmx3V1ViT2VmR3M4UDV6QVdn?=
 =?utf-8?B?RVJ5RG43UXQwSFRGS2xGZFFVSmlFS2JuVWpzSk5GTThOR2NTUW5rUnUyeEJh?=
 =?utf-8?B?OXU4OWlQWDhnUUttZ21PQXY3Y1I1NUpQYVB2bFBVeEFJYmp6NGlyQjN5aldY?=
 =?utf-8?B?UStoUEV3VTl0OEI0THN2NjBhcnZZeTluSXluTm56OHRmK3RkbjgwTXpkYVZZ?=
 =?utf-8?B?Z09HamJSWkExY0tYUWR4NmJBbGUwM0RZL0ovcnpRdjFIQjNwTk9EVk1uMXh1?=
 =?utf-8?B?ZXZKNzF3SUJPOGlaVXZYdGhIalR2ZmlPdlkyVlZXY3NMZE9MU0hBQmRjdW1r?=
 =?utf-8?B?N0hPOEdMQ3pTdzlKVDFFdUFoc1ljcmNtUVdicHJPUVdCaSs2VEJqalVPU2FC?=
 =?utf-8?B?NVNYYWFUQTJZSDVQWGhNS0w3cDJ4ZFFjL3cvRnhUZzQ1MGVFbjhBb09HalFV?=
 =?utf-8?B?OGNIRkpseWRCeFkzMWpOckpod1ZEUnZnMmRpT0RrRDlGc1dLQ0gweEVDeEY5?=
 =?utf-8?B?R3U0eWZPaFhhbWlTTFVGbkdiL0tDelhaRDl1RG01WU9Ra2FQdUhFRVVZclk4?=
 =?utf-8?B?dldGd1NwcXdQM0czbHlPb3VhY2VVeEhiR1VBZjFUaW9CVVluSGF6dTMza2pt?=
 =?utf-8?B?S1ZBUjRnUUpQbW54eXV5eGNkVVh1U0s1dDNlWlZlczM0dHRUSnlNOWppQ1B5?=
 =?utf-8?B?cXM4V3IrVHJyUVNUdVhhbVpERHZXZHBzTVdHOWllVENsaWdqT04wa0xlNUo3?=
 =?utf-8?B?SGNOSWVFUkJhdElOVlNWR1NGeHRpSzhVK1Fmc0hONUNObzZCRlQvNG5ObEk1?=
 =?utf-8?B?aHcrek5YZHV3Z1RLVy9HNEN5REFZSnlraWFVSWpsMjhiekxlZU5OZHVNZGtN?=
 =?utf-8?B?VTM5blBrUmV5aHFKN3o0blRic1ppNDAyZ3c5K3NsVnEwTFI5MFB5K1cxUG9C?=
 =?utf-8?B?QjB4WUs2RG13UGdPOGtoN1dobHhhZGl1QkZvbmlmaGNKZlJYVlBQTDNaa2pq?=
 =?utf-8?B?aHpQN1JPOUMzdlZpZ1BTanhSV0tRV20rOUN4a0lUVzd4TDlvSjdpNmtOVlNK?=
 =?utf-8?B?K1poV0Z1aGNUUUV1VFAvL1BqaHRWampyVVBpQ09Xa1BmVjdONDgzQ01jYkkz?=
 =?utf-8?B?NXIyUmxlankrOEUzQk5JekJndGJvYWFrOFhVdUxlS2ZjNktUV2pqSi9LVDVl?=
 =?utf-8?B?UHZScVRrSGlnUFd3cU0xNHplU3ljalkzNGxjWWV5WkdkdU43V0pCUVlaY0Nl?=
 =?utf-8?B?SmxJREIrZm1QQjhnMXQvK3cybUtndmZPYVNOSnVzU1FwaTFuOXR3YWo2NUta?=
 =?utf-8?B?TlluNGx0MkJPQ0hlYlBETUVUNDBZYStzcGtHb1dhaVJVVFZSSXZhMTQwZjVq?=
 =?utf-8?B?eWJ1TWVmd2dkVXAycWlhSGQxY1orUlErbVZtWlBoMklJc25ZV1pmQXFoZlZX?=
 =?utf-8?B?NVNpQndlVTlIVUpxZEZQQXBYakw4c1RiU08zMDUxcmdlSGpnRDdHaUhiUklm?=
 =?utf-8?B?dVJERy9NVU9iem4yZWt1a0gyK28xcENpNmpyY0xrM0VKVW54bnVwOEQ5c3pt?=
 =?utf-8?B?aDRDeUo5M0hGK29YM3dXSTJGUXNtdWJmSzVQNWxFR3FSSTgrajhsQmJiZ2xM?=
 =?utf-8?B?VUw2Z3BEbTZwaTFIWGoxWGJhYWs1UTNhYmVkRkJzdHR1VWRzalozaVc5cVJh?=
 =?utf-8?B?Qkt4VXpXUnRiTjZ5QXh0WXdGYmgySHo5RU9tR3VjVEg2TkdRY0dVdE5MUnhF?=
 =?utf-8?B?TC81WTZLRU1CMi9HTGJVczlKOGdWR3RJUEVzMkJYR3FRQk5MS3ZXOG5iTklu?=
 =?utf-8?Q?ostCVC4X50ZucpF9qIvxNkc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F7D7DD7166234949A5178134762653A0@eurprd07.prod.outlook.com>
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
MIME-Version: 1.0
X-OriginatorOrg: cs-soprasteria.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR07MB7455.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa59d417-63ba-458b-bb31-08dd1b478a4a
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2024 07:27:03.2642
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8b87af7d-8647-4dc7-8df4-5f69a2011bb5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iYaECwIX2PddRGv7phiqsaPALMYISHNVD/irhNop6RKv8y87bYiXHZK47leYOKYKe7Akmbxu6a0Llf4lTn00NU6iBgDW8ovxnO39S2zJtROa2CKbZGWLeUvxV/V3XwOx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR07MB9111
X-MS-Exchange-CrossPremises-AuthAs: Internal
X-MS-Exchange-CrossPremises-AuthMechanism: 04
X-MS-Exchange-CrossPremises-AuthSource: PA4PR07MB7455.eurprd07.prod.outlook.com
X-MS-Exchange-CrossPremises-TransportTrafficType: Email
X-MS-Exchange-CrossPremises-SCL: 1
X-MS-Exchange-CrossPremises-messagesource: StoreDriver
X-MS-Exchange-CrossPremises-BCC:
X-MS-Exchange-CrossPremises-originalclientipaddress: 88.124.70.171
X-MS-Exchange-CrossPremises-transporttraffictype: Email
X-MS-Exchange-CrossPremises-antispam-scancontext: DIR:Originating;SFV:NSPM;SKIP:0;
X-MS-Exchange-CrossPremises-processed-by-journaling: Journal Agent
X-OrganizationHeadersPreserved: AS8PR07MB9111.eurprd07.prod.outlook.com
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

DQoNCkxlIDExLzEyLzIwMjQgw6AgMTY6NDAsIEZyZWRlcmljIFdlaXNiZWNrZXIgYSDDqWNyaXTC
oDoNCj4gVXNlIHRoZSBwcm9wZXIgQVBJIGluc3RlYWQgb2Ygb3BlbiBjb2RpbmcgaXQuDQo+IA0K
PiBIb3dldmVyIGl0IGxvb2tzIGxpa2Uga3RocmVhZHMgaGVyZSBjb3VsZCBiZSByZXBsYWNlZCBi
eSB0aGUgdXNlIG9mIGENCj4gcGVyLWNwdSB3b3JrcXVldWUgaW5zdGVhZC4NCj4gDQo+IFNpZ25l
ZC1vZmYtYnk6IEZyZWRlcmljIFdlaXNiZWNrZXIgPGZyZWRlcmljQGtlcm5lbC5vcmc+DQoNCkFj
a2VkLWJ5OiBDaHJpc3RvcGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+DQoN
Cj4gLS0tDQo+ICAgZHJpdmVycy9zb2MvZnNsL3FibWFuL3FtYW5fdGVzdF9zdGFzaC5jIHwgNiAr
Ky0tLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygt
KQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc29jL2ZzbC9xYm1hbi9xbWFuX3Rlc3Rfc3Rh
c2guYyBiL2RyaXZlcnMvc29jL2ZzbC9xYm1hbi9xbWFuX3Rlc3Rfc3Rhc2guYw0KPiBpbmRleCBi
N2U4ZTVlYzg4NGMuLmY0ZDNjMjE0NmY0ZiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9zb2MvZnNs
L3FibWFuL3FtYW5fdGVzdF9zdGFzaC5jDQo+ICsrKyBiL2RyaXZlcnMvc29jL2ZzbC9xYm1hbi9x
bWFuX3Rlc3Rfc3Rhc2guYw0KPiBAQCAtMTA4LDE0ICsxMDgsMTIgQEAgc3RhdGljIGludCBvbl9h
bGxfY3B1cyhpbnQgKCpmbikodm9pZCkpDQo+ICAgCQkJLmZuID0gZm4sDQo+ICAgCQkJLnN0YXJ0
ZWQgPSBBVE9NSUNfSU5JVCgwKQ0KPiAgIAkJfTsNCj4gLQkJc3RydWN0IHRhc2tfc3RydWN0ICpr
ID0ga3RocmVhZF9jcmVhdGUoYnN0cmFwX2ZuLCAmYnN0cmFwLA0KPiAtCQkJImhvdHBvdGF0byVk
IiwgY3B1KTsNCj4gKwkJc3RydWN0IHRhc2tfc3RydWN0ICprID0ga3RocmVhZF9ydW5fb25fY3B1
KGJzdHJhcF9mbiwgJmJzdHJhcCwNCj4gKwkJCQkJCQkgICBjcHUsICJob3Rwb3RhdG8lZCIpOw0K
PiAgIAkJaW50IHJldDsNCj4gICANCj4gICAJCWlmIChJU19FUlIoaykpDQo+ICAgCQkJcmV0dXJu
IC1FTk9NRU07DQo+IC0JCWt0aHJlYWRfYmluZChrLCBjcHUpOw0KPiAtCQl3YWtlX3VwX3Byb2Nl
c3Moayk7DQo+ICAgCQkvKg0KPiAgIAkJICogSWYgd2UgY2FsbCBrdGhyZWFkX3N0b3AoKSBiZWZv
cmUgdGhlICJ3YWtlIHVwIiBoYXMgaGFkIGFuDQo+ICAgCQkgKiBlZmZlY3QsIHRoZW4gdGhlIHRo
cmVhZCBtYXkgZXhpdCB3aXRoIC1FSU5UUiB3aXRob3V0IGV2ZXINCg0K

