Return-Path: <linuxppc-dev+bounces-360-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B25795B85D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 16:27:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqQWv0TvFz2yZZ;
	Fri, 23 Aug 2024 00:27:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:260d::621" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724336843;
	cv=pass; b=AXIChCdYuKkfh8GnAYnV4PaGt1qp40+ft35Eftt/3dVSiwfUY39jXWrBvnZ4IbIme0pZl2HRI1PpHveE09zU1JVKq1TbjOGtnuT/RJjr/gWLcSIJrEvdmXXr4RM5ZSsVBlLmp6tjYTXZWX767LK4gB8J8R7E0PdAOIhh4O0pWkOz9Ju6ql3vzu32HDOFPIiaEwvUvjjtOrlZ4AtofCXD+MnV+umkW6Pt29xRzTC6duSO9ObBdCHYDXN9dMW7vsj3nvv8y9zUK7sOvqc9bflBMfmbf3lqULuMXln0WHyKi8EHqGKdq/G6BS5oWY9yZSU6jsoWBIKKIkuYwGD0bwn2RQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724336843; c=relaxed/relaxed;
	bh=wuLuV/frSVoONPON3eu82l+Rpo8rrFH2wFIIVIqiBiM=;
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
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=cs-soprasteria.com; dkim=pass (2048-bit key; unprotected) header.d=cs-soprasteria.com header.i=@cs-soprasteria.com header.a=rsa-sha256 header.s=selector1 header.b=MFDszZQd; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:260d::621; helo=eur03-dba-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy2@cs-soprasteria.com; receiver=lists.ozlabs.org) smtp.mailfrom=cs-soprasteria.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=cs-soprasteria.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=cs-soprasteria.com header.i=@cs-soprasteria.com header.a=rsa-sha256 header.s=selector1 header.b=MFDszZQd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cs-soprasteria.com (client-ip=2a01:111:f403:260d::621; helo=eur03-dba-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy2@cs-soprasteria.com; receiver=lists.ozlabs.org)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on20621.outbound.protection.outlook.com [IPv6:2a01:111:f403:260d::621])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqQWt3WvDz2yHT
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 00:27:22 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QB0d04EocdZDkq7N578+wx4ka3OMfgAydxy75cSqFR4zouDgotuJRtw1x3CHc33EQMRCy0rcxTtACLN59pp+J2ZAtseCFxjq5uBX+ctwT4puXFsVSOu3qBmDquUyGeOxzYXGMv3lvc3YRuEMTxhq8HdSv6EAAAsF+1b0xwFy9JB23l41QkH0gtv3qmgDSQffuhcrSfIwAJsrRvS7z7gVyd0PeZPww1qZkTHesN7xoWNu+vpbqNT/iPK+IrJgN7+50QbcoZ/6tGsbQt2rGaz35htPfhvhz3Vg/eBHiONteCglB5rEgjQAKT00QVhmEnGmUpuyYRqJv9LCRSyHG+9/2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wuLuV/frSVoONPON3eu82l+Rpo8rrFH2wFIIVIqiBiM=;
 b=RyTgmQWDvUmUB4X+Fzh7kyH+cwT/NZOPIXCl4qejJx6HW87Cs7YRoyigetQe/Czy1+ktII9WN8U2vxZTWtm39Zj+5UoCqSHBF1W7rm61wV2zf5V5o5eJEsHsaZ2x2LrZXNrpTvEPRcw+4d6EIgGhTG32WNnNmgAWY/R1UBkuA5HyNnEWp+kmcDO+X1JaMWKUmDqoCrS3rW9hNulBjY9ILMF72mulMcdIrWUL8OEyYcJdc/vBO4PJGkJ1Z+KYNlHnUChSiJUrbMSwxRBRvcTQuQr6RXxcvZV5SmRoMw8rKAEPlbzn/X9uqFuzZcVCWLHzl8V6alf2nhkwrMUWubQMDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cs-soprasteria.com; dmarc=pass action=none
 header.from=cs-soprasteria.com; dkim=pass header.d=cs-soprasteria.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cs-soprasteria.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wuLuV/frSVoONPON3eu82l+Rpo8rrFH2wFIIVIqiBiM=;
 b=MFDszZQdhJJS2hQk1o+IEMlv7pT+WJDfST1fGqeAe09td/69h07VMwO6cQpOGXoNYldIcZfUP3qGnXpRGUriU9adIn4QkZE7EI4F0/GbcF2AlZm5q2GQ5zwCSTA5jgsgFAQaqqFb7NtExRj4mLzMGJGgAA6SHCJHDzrYLUXn00vrqRyqLbd0knttPtiXoGTcmdtbDn6GlnGf9K/Q4v/l71qT1+EVx71fdIU/iZ7YgSOvH5DH6m20MHS4ZurquER39vgqXg8PgkNFMmA2Tlp739OeSN4iz0G95FPTyJ46j711jalvLBnaquXfaccAxC/1wmNyk74hdfgaq+UBZ93X7Q==
Received: from AM0PR07MB4962.eurprd07.prod.outlook.com (2603:10a6:208:f3::19)
 by PAXPR07MB7726.eurprd07.prod.outlook.com (2603:10a6:102:15f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.18; Thu, 22 Aug
 2024 14:27:03 +0000
Received: from AM0PR07MB4962.eurprd07.prod.outlook.com
 ([fe80::6724:2919:9cbb:2bb2]) by AM0PR07MB4962.eurprd07.prod.outlook.com
 ([fe80::6724:2919:9cbb:2bb2%4]) with mapi id 15.20.7875.023; Thu, 22 Aug 2024
 14:27:03 +0000
From: LEROY Christophe <christophe.leroy2@cs-soprasteria.com>
To: Narayana Murty N <nnmlinux@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC: "mahesh@linux.ibm.com" <mahesh@linux.ibm.com>, "oohall@gmail.com"
	<oohall@gmail.com>, "npiggin@gmail.com" <npiggin@gmail.com>, LEROY Christophe
	<christophe.leroy2@cs-soprasteria.com>, "naveen@kernel.org"
	<naveen@kernel.org>, "vaibhav@linux.ibm.com" <vaibhav@linux.ibm.com>,
	"ganeshgr@linux.ibm.com" <ganeshgr@linux.ibm.com>, "sbhat@linux.ibm.com"
	<sbhat@linux.ibm.com>
Subject: Re: [PATCH v1] powerpc/pseries/eeh: Fix pseries_eeh_err_inject
Thread-Topic: [PATCH v1] powerpc/pseries/eeh: Fix pseries_eeh_err_inject
Thread-Index: AQHa9G0qIjGcQ99lf062U2nT9tpv8rIzVdyA
Date: Thu, 22 Aug 2024 14:27:03 +0000
Message-ID: <4010437a-b543-413d-9e82-fd36dfad3221@cs-soprasteria.com>
References: <20240822082713.529982-1-nnmlinux@linux.ibm.com>
In-Reply-To: <20240822082713.529982-1-nnmlinux@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cs-soprasteria.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR07MB4962:EE_|PAXPR07MB7726:EE_
x-ms-office365-filtering-correlation-id: 11aedeb6-d753-4d1f-005c-08dcc2b67e35
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?d3NpMTI0UmltbTd0U0VwZ1RaRXJucGlyRXd3amt3aDJiNEU0aHNDZklQUjJk?=
 =?utf-8?B?SlJZL2dPZTJDcEl4QVBWT0hyazBJNzY4cEtvanBYRERkNjlQcHg1ejJiUm8r?=
 =?utf-8?B?NUczNWQyQmZBS2tzL0l1MDlPdnBpN2dUSjZORHRtR29SdzdIUWJXQ0VlTk8z?=
 =?utf-8?B?N1R0WmVLQXVKaU1zQTJIVnQ3dWFHOVQwMDJ5VXRpQ2tqWnFjVG5TWkg2TGFG?=
 =?utf-8?B?UVBLWHpqWjVEUm5WYzRxOFFkNm40S0t4TEVnOFdKUTlGeGxFNjhnNGlWWU1k?=
 =?utf-8?B?c2h5QnpNc2t3WnY3MlVFdkVxcVoxeDVRaUM4dGRKemJONHpIdFBGR1V4N1U0?=
 =?utf-8?B?OTNUT3JGLzhDTjlPb2loM1Iyb28xaUx4c3pXOVlkeGpGNXZvMFpOUG1kR2tl?=
 =?utf-8?B?NGwvVGgvRU51RWQ0Zm5XbzJMSTdnZVkydEl2TlFBUUNSSG9IRGcrd2FSbytG?=
 =?utf-8?B?MU5OZTdZOGE2WDl6QU9oTXlTa0N6Um0yY1VpaXNVSDdDT1VUU0tBVkJINHdx?=
 =?utf-8?B?UGhVcmg4Sld0RFVXTDE5bXQzMUpOTGZzVW9XZ1d0MjlUYndMZ0loQlBBMmh0?=
 =?utf-8?B?d0srejNJNHRkaVVJSVh3dE5hZnN1dkNIU0tFK0dYRXpTMkJSWVVQcjVSZVJ6?=
 =?utf-8?B?czk2cDVPRmYwZ1k1NEpQZ2IzNmwyNSt4RlVXQjNsOFRyOC8wQTJRZ25lRzVw?=
 =?utf-8?B?WlFHaHhhZmtkV0ZkYUhIYzZueUdwNzRZN3U0Q0hodWFER1k5SU5tRGtqRnNI?=
 =?utf-8?B?czRjcmN3aDR2VFlWZEtCbTRBMk1pQU1rbmtKc0ZWRGgyREhqaFdMaFd4VHZz?=
 =?utf-8?B?TTVKVVZjS3VzckNsMnZmNG5SUEJ5SUczd2M0d2hRcFc1L0tRUkM4Y0JPblVC?=
 =?utf-8?B?OE52aHNITFpXWkNYUzc3M2RCMlQyU0JNN0FUZHdlWlVUZ0RndzlQUFNYRE1Z?=
 =?utf-8?B?clVhVUJGWVlqbjhrUDZUOEZCVjhZdWU4U3JraEtiQXVxT09vYVgxRlhCTGh0?=
 =?utf-8?B?N3NaZjRyMzlkTWpMS1dyQ2ZIRmU4U1JlK2s3OWRLWCtFbnZLYnFVZkRabzZ2?=
 =?utf-8?B?ZW1LT3ZqOXRtajRFY2FwVlFCeE5VWXZrNzRMYVlhZGFoVDJpck5TblAxOWF0?=
 =?utf-8?B?ejFJeWlnT1ZQaExyYlNVb2NaNnV5c25DdkFoc0xlVExiNUt0Ti82WDhmRG5s?=
 =?utf-8?B?ZmRBTG5RVmlEa2xvNUppQ2xneE1LcUZuRWpaVko3UjgwbU41a25iNHdEbmdN?=
 =?utf-8?B?U3ZvUUNIakhHcmFKazB0ME9yRjlxMEMzaERhak9OQmlsVEkzYTBFRDFPeDJk?=
 =?utf-8?B?T2dLRFZ5RUNQbjcwdDVpaFh5bld1TVNwanVvMmR6ekk0eWN6anR2S0VSZWEy?=
 =?utf-8?B?aHIyRTBDTUFEOFhoRlU2eENEejZkRnhKNkYybE9QVGYxd2JYZVIvWE80SGlF?=
 =?utf-8?B?Si8wR01CR2lNTTQ4Q2krcXVpc2RMM2JDRWJyS2YvSnYwRnBOL2RNanIraWdQ?=
 =?utf-8?B?THhhVUpiS3JvNm9hRkxMZEJnOTc2clE0bENIZEhtRHVNUlZ3VFk4L3hYYW1v?=
 =?utf-8?B?U055RUh3NUhySUk4OXQ3K0NFTmg3QXJia2RUbTd2NXNOUk1wNUwvOVducFY2?=
 =?utf-8?B?WnFwclQ0ZVpaYkdmN2JFc2tPSDF0VEY1WlJoZTgxaHFFaXR1eUF2aVNZaW5j?=
 =?utf-8?B?ME9SS0JTMjVTZDR4QldENVJrRlhDVW9GYXh4RnhxT1ZYeEI5RXFkMWs0anlm?=
 =?utf-8?B?RzU3SUI2YjhHSEE1UWxVdE5GTmpWZEJiOWZkTEozTEtNVnQxRFBrOXNxL1lB?=
 =?utf-8?Q?HXedKthmNaehESUZ+QPnmhn+PRVoFUKTFDSfM=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR07MB4962.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cmphMkU4dG9xQ01mY2NYRlFWVWRYTHpWZ2tCMVpDV2l4ZUZDQlNaaVN3QVNE?=
 =?utf-8?B?dzJxZUdVcVBvL0lLSm5YV3JqU1Q1QzlBZnh6cFZwdERXZG5SYnBKMWZaZWxH?=
 =?utf-8?B?TTloNlllYmtDaGF6eTRQME53WUVlRTZzRkhaVWdIOGxIaUc0eVpEYzU4aEJo?=
 =?utf-8?B?c1owUDZLdmkzbGtCMEFNSUIzREhQb1E1VDdFeFBRTXE2WXBCcTZvNm1NYWQ4?=
 =?utf-8?B?RjJjWGZkTS9jUW16aEw3enYyZFNrdXVHMDUyMEMxVGVhc2RISmhjY05CdEtu?=
 =?utf-8?B?czVFK3BGdE0zWWNRck84OEFuYXBZNGtVbFQ4UnVmYWRHb0tmR0ZzOGhRUEtU?=
 =?utf-8?B?NHQ2aS9VSHh5a0MyV0xGdHUrcDk1OXRmdnFiY1lVMmFpQU1TWWJXc3lIbHBj?=
 =?utf-8?B?U1dDUWxXaTBHUkR0R1l1S1hMZ0tHaWJ4bmRJMTlpTDJldkQ3azBQdWdFMzE4?=
 =?utf-8?B?RTQ4M2pJVWUwQ3p6VnFuaENQUDVqcW5jWFRxYysxeWtITWJnalM2Z3NKYkpi?=
 =?utf-8?B?c01raHNRbzRIcTNEcXA0eTAzOGhEdTEra2RjcUxXbWMrMG9oWU0xNTE1L3Bq?=
 =?utf-8?B?QVJINlNETmpqTVdrZm5aQkZJMnpXN2ovbEpiUXRGS0dOdWdwZFk4c1BhV1da?=
 =?utf-8?B?NWw3QTUwTzFtOWtiUXljRHJIOG5GTnMzV285RVprbUZRL1c0WTlwd1hKQ0VU?=
 =?utf-8?B?MnFJQzYwQVBhMTIramVadVhweGZ6ZDNaSW92V1N4RGxFbkxENFFQZVUrM2dn?=
 =?utf-8?B?UHdkTktaenpXT2VKWDRIZWQyb1BNQmNNMWNBT3VnWllrcHo2VDgvU1ZKWUJx?=
 =?utf-8?B?eDJWZnN1WU5sT2hKaFUzaVl2K21aTHdYOGtUR084MjVzbUdjYXFXSllvT3lv?=
 =?utf-8?B?aGtiem5FcUUxNlFFWC82NGMxODB0Nnk1MGlZUG9yay91Q1M4b0Q1OTk5YnpX?=
 =?utf-8?B?SkVBSk9hNGdOR3hVRm1FVzVVK0dzUklrL1FEUGZEalhEaEtCYzYvZlU2MVd5?=
 =?utf-8?B?T1o4M2dVNzVEZDFpa0JmMUZkYjV1NDdiVlMzejUzUGVaRHd1eEJZUDB3ZTVN?=
 =?utf-8?B?SDlWSVgvYzNEOGhQTThtRU5HbnB0dW5jbnNTSWpMY3E5dkxNZmJ2c25tcm94?=
 =?utf-8?B?T056b2RKNHRxZWk5VktiQzhYTTVtZnBuR0t5Q3JzUzd3MVFPM0FPVUQrR0xn?=
 =?utf-8?B?ZlZIS3A3MmZoRWx3UHpvN3FGbjk3b1oxbzNDbmJtYklhZ0pvVVJIWlVmSWlw?=
 =?utf-8?B?eWt3THVIZDduSUJINlBzR1dMWkludVJSR2pzY2VibWxVU0xNcThDZnpoS1c2?=
 =?utf-8?B?ZjZudWNML3E1bVh4ZnVXbWRsMUZxWTBqektXMDZZcUo4L0JTZHo0SjhYMndD?=
 =?utf-8?B?cmhQM281dVFRYzVuRHJWMlFNQWRmdUJ4K0h2c3BQeHU0ckx6VFI5c3EvNVcv?=
 =?utf-8?B?S2JVZGM0WmRLNG9QK1N0WUxLbTNuVHpoMXFRbHh4alJSOVAwcmQ4clJwNnBI?=
 =?utf-8?B?NDlQblZrbW5BYnBUVWZORFNFUVFONEkrZjFpZnZyYWQzRTlXQTRGUStkYWJJ?=
 =?utf-8?B?MU9QMnFhRENOdXlpN1RGdU9RV3NKSnZ2Zjg3R3VTTEpOeWdIY3BMMXBzWUxL?=
 =?utf-8?B?TWl1eW95WjZ3c1YxWXJKMVp3KzlCMUpEZEZZeEtKYWIxVWl0ZDM3ekswWTFh?=
 =?utf-8?B?Y1ZLeFp0QThHRDFDcEdyZkJuUFFlOUIyYmtpQmx5U3ZXVUZZSmpMOEVHdlhD?=
 =?utf-8?B?aFFsdGcvRWY3MFZFeE9JK1hsT05QcWxHdUx5VytRNUZKeDlkc2J1clpKVjQr?=
 =?utf-8?B?cm83bVlZa1FRS1ZYNnJ5bnF3WlhQVVIwdC9FcDI4OERHSzc3UTZCMW1SNVRU?=
 =?utf-8?B?MEdJVGx2U2FoQzdpR2VYMkYvZmhJcnc2Sk9iclBEZEw1c00vOG9lNWJscExi?=
 =?utf-8?B?VVQ0Q3E5ZGFqNndHRjNiQU5heTVxMFRtMHdWQzFia2NmTEcvYUlCZTloMVFo?=
 =?utf-8?B?Y3dOTGoxQ2N1YWFFbVdWUUlnV01tTmhtZlM5eWJqbjdsWTNVVjVlMjZJNzVF?=
 =?utf-8?B?WnBtWGNQbGlHaHBPZ0hFaXZyemdWVGQ5NEtWdXB0VDdqaVBZb25JSi9GTTN5?=
 =?utf-8?B?bjlrdERsNTE2aDhLMjdyQzdnZ0MyTUEza0RFQUl3ZFVySnlvLzczanVuYVlJ?=
 =?utf-8?B?Znc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <33A91ADD45526B469C66321948E83466@eurprd07.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 11aedeb6-d753-4d1f-005c-08dcc2b67e35
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2024 14:27:03.6588
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8b87af7d-8647-4dc7-8df4-5f69a2011bb5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: prA9wqJryhzfVeXndsVwVT3bsDYKxPq/TtOQwWUaMkUnwkRBP13DH7esKskIBr6LNHRNMCGtvCcqV0O4p05PnqqBRD45jrP73VrOLOebynK0ujtXkFZxGJ3qk1zZG1pc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR07MB7726
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
X-OrganizationHeadersPreserved: PAXPR07MB7726.eurprd07.prod.outlook.com

DQoNCkxlIDIyLzA4LzIwMjQgw6AgMTA6MjcsIE5hcmF5YW5hIE11cnR5IE4gYSDDqWNyaXTCoDoN
Cj4gW1ZvdXMgbmUgcmVjZXZleiBwYXMgc291dmVudCBkZSBjb3VycmllcnMgZGUgbm5tbGludXhA
bGludXguaWJtLmNvbS4gRMOpY291dnJleiBwb3VycXVvaSBjZWNpIGVzdCBpbXBvcnRhbnQgw6Ag
aHR0cHM6Ly9ha2EubXMvTGVhcm5BYm91dFNlbmRlcklkZW50aWZpY2F0aW9uIF0NCj4gDQo+IFZG
SU9fRUVIX1BFX0lOSkVDVF9FUlIgaW9jdGwgaXMgY3VycmVudGx5IGZhaWxpbmcgb24gcHNlcmll
cw0KPiBkdWUgdG8gbWlzc2luZyBpbXBsZW1lbnRhdGlvbiBvZiBlcnJfaW5qZWN0IGVlaF9vcHMg
Zm9yIHBzZXJpZXMuDQo+IFRoaXMgcGF0Y2ggaW1wbGVtZW50cyBwc2VyaWVzX2VlaF9lcnJfaW5q
ZWN0IGluIGVlaF9vcHMvcHNlcmllcw0KPiBlZWhfb3BzLiBJbXBsZW1lbnRzIHN1cHBvcnQgZm9y
IGluamVjdGluZyBNTUlPIGxvYWQvc3RvcmUgZXJyb3INCj4gZm9yIHRlc3RpbmcgZnJvbSB1c2Vy
IHNwYWNlLg0KPiANCj4gVGhlIGNoZWNrIG9uIFBDSSBlcnJvciB0eXBlIGNvZGUgaXMgbW92ZWQg
dG8gcGxhdGZvcm0gY29kZSwgc2luY2UNCj4gdGhlIGVlaF9wZV9pbmplY3RfZXJyIGNhbiBiZSBh
bGxvd2VkIHRvIG1vcmUgZXJyb3IgdHlwZXMgZGVwZW5kaW5nDQo+IG9uIHBsYXRmb3JtIHJlcXVp
cmVtZW50Lg0KDQpTZWVtcyBsaWtlIGl0IGRvZXNuJ3QgYnVpbGQgd2l0aCBwcGM2NF9kZWZjb25m
aWcgb3IgcHBjNjRsZV9kZWZjb25maWcsIA0Kc2VlIGh0dHBzOi8vZ2l0aHViLmNvbS9saW51eHBw
Yy9saW51eC1zbm93cGF0Y2gvYWN0aW9ucy9ydW5zLzEwNTA3ODA1NTM3DQoNCkNocmlzdG9waGUN
Cg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTmFyYXlhbmEgTXVydHkgTiA8bm5tbGludXhAbGludXgu
aWJtLmNvbT4NCj4gLS0tDQo+IA0KPiBUZXN0aW5nOg0KPiAtLS0tLS0tDQo+IHZmaW8tdGVzdCBb
MV0gYnkgQWxleCBXaWxsYW1zb24sIHdhcyBmb3JrZWQgYW5kIHVwZGF0ZWQgdG8gYWRkDQo+IHN1
cHBvcnQgaW5qZWN0IGVycm9yIG9uIHBTZXJpZXMgZ3Vlc3QgYW5kIHVzZWQgdG8gdGVzdCB0aGlz
DQo+IHBhdGNoWzJdLg0KPiANCj4gUmVmZXJlbmNlczoNCj4gLS0tLS0tLS0tLQ0KPiBbMV0gaHR0
cHM6Ly9naXRodWIuY29tL2F3aWxsaWFtL3Rlc3RzDQo+IFsyXSBodHRwczovL2dpdGh1Yi5jb20v
bm5td2VibWluL3ZmaW8tcHBjLXRlc3RzL3RyZWUvdmZpby1wcGMtZXgNCj4gLS0tDQo+ICAgYXJj
aC9wb3dlcnBjL2luY2x1ZGUvYXNtL2VlaC5oICAgICAgICAgICAgICAgfCAgMSArDQo+ICAgYXJj
aC9wb3dlcnBjL2tlcm5lbC9lZWguYyAgICAgICAgICAgICAgICAgICAgfCAgNiArLS0NCj4gICBh
cmNoL3Bvd2VycGMvcGxhdGZvcm1zL3BzZXJpZXMvZWVoX3BzZXJpZXMuYyB8IDM5ICsrKysrKysr
KysrKysrKysrKystDQo+ICAgMyBmaWxlcyBjaGFuZ2VkLCA0MCBpbnNlcnRpb25zKCspLCA2IGRl
bGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9l
ZWguaCBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9lZWguaA0KPiBpbmRleCA5MWE5ZmQ1MzI1
NGYuLjk2NDQ1ZTFlYjI4ZSAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNt
L2VlaC5oDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9lZWguaA0KPiBAQCAtMzA4
LDYgKzMwOCw3IEBAIGludCBlZWhfcGVfcmVzZXQoc3RydWN0IGVlaF9wZSAqcGUsIGludCBvcHRp
b24sIGJvb2wgaW5jbHVkZV9wYXNzZWQpOw0KPiAgIGludCBlZWhfcGVfY29uZmlndXJlKHN0cnVj
dCBlZWhfcGUgKnBlKTsNCj4gICBpbnQgZWVoX3BlX2luamVjdF9lcnIoc3RydWN0IGVlaF9wZSAq
cGUsIGludCB0eXBlLCBpbnQgZnVuYywNCj4gICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25l
ZCBsb25nIGFkZHIsIHVuc2lnbmVkIGxvbmcgbWFzayk7DQo+ICtpbnQgZWVoX2RlYnVnZnNfYnJl
YWtfZGV2aWNlKHN0cnVjdCBwY2lfZGV2ICpwZGV2KTsNCj4gDQo+ICAgLyoqDQo+ICAgICogRUVI
X1BPU1NJQkxFX0VSUk9SKCkgLS0gdGVzdCBmb3IgcG9zc2libGUgTU1JTyBmYWlsdXJlLg0KPiBk
aWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2tlcm5lbC9lZWguYyBiL2FyY2gvcG93ZXJwYy9rZXJu
ZWwvZWVoLmMNCj4gaW5kZXggZDAzZjE3OTg3ZmNhLi44ZGIxMWVkZDY1ZmIgMTAwNjQ0DQo+IC0t
LSBhL2FyY2gvcG93ZXJwYy9rZXJuZWwvZWVoLmMNCj4gKysrIGIvYXJjaC9wb3dlcnBjL2tlcm5l
bC9lZWguYw0KPiBAQCAtMTUzNywxMCArMTUzNyw2IEBAIGludCBlZWhfcGVfaW5qZWN0X2Vycihz
dHJ1Y3QgZWVoX3BlICpwZSwgaW50IHR5cGUsIGludCBmdW5jLA0KPiAgICAgICAgICBpZiAoIWVl
aF9vcHMgfHwgIWVlaF9vcHMtPmVycl9pbmplY3QpDQo+ICAgICAgICAgICAgICAgICAgcmV0dXJu
IC1FTk9FTlQ7DQo+IA0KPiAtICAgICAgIC8qIENoZWNrIG9uIFBDSSBlcnJvciB0eXBlICovDQo+
IC0gICAgICAgaWYgKHR5cGUgIT0gRUVIX0VSUl9UWVBFXzMyICYmIHR5cGUgIT0gRUVIX0VSUl9U
WVBFXzY0KQ0KPiAtICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+IC0NCj4gICAgICAg
ICAgLyogQ2hlY2sgb24gUENJIGVycm9yIGZ1bmN0aW9uICovDQo+ICAgICAgICAgIGlmIChmdW5j
IDwgRUVIX0VSUl9GVU5DX01JTiB8fCBmdW5jID4gRUVIX0VSUl9GVU5DX01BWCkNCj4gICAgICAg
ICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4gQEAgLTE3MzEsNyArMTcyNyw3IEBAIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgZmlsZV9vcGVyYXRpb25zIGVlaF9kZXZfY2hlY2tfZm9wcyA9IHsNCj4g
ICAgICAgICAgLnJlYWQgICA9IGVlaF9kZWJ1Z2ZzX2Rldl91c2FnZSwNCj4gICB9Ow0KPiANCj4g
LXN0YXRpYyBpbnQgZWVoX2RlYnVnZnNfYnJlYWtfZGV2aWNlKHN0cnVjdCBwY2lfZGV2ICpwZGV2
KQ0KPiAraW50IGVlaF9kZWJ1Z2ZzX2JyZWFrX2RldmljZShzdHJ1Y3QgcGNpX2RldiAqcGRldikN
Cj4gICB7DQo+ICAgICAgICAgIHN0cnVjdCByZXNvdXJjZSAqYmFyID0gTlVMTDsNCj4gICAgICAg
ICAgdm9pZCBfX2lvbWVtICptYXBwZWQ7DQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvcGxh
dGZvcm1zL3BzZXJpZXMvZWVoX3BzZXJpZXMuYyBiL2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvcHNl
cmllcy9lZWhfcHNlcmllcy5jDQo+IGluZGV4IGIxYWUwYzBkMTE4Ny4uNWNlMWUxMWNhNDJmIDEw
MDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMvcGxhdGZvcm1zL3BzZXJpZXMvZWVoX3BzZXJpZXMu
Yw0KPiArKysgYi9hcmNoL3Bvd2VycGMvcGxhdGZvcm1zL3BzZXJpZXMvZWVoX3BzZXJpZXMuYw0K
PiBAQCAtNzgyLDYgKzc4Miw0MyBAQCBzdGF0aWMgaW50IHBzZXJpZXNfbm90aWZ5X3Jlc3VtZShz
dHJ1Y3QgZWVoX2RldiAqZWRldikNCj4gDQo+ICAgICAgICAgIHJldHVybiAwOw0KPiAgIH0NCj4g
Kw0KPiArLyoqDQo+ICsgKiBwc2VyaWVzX2VlaF9lcnJfaW5qZWN0IC0gSW5qZWN0IHNwZWNpZmll
ZCBlcnJvciB0byB0aGUgaW5kaWNhdGVkIFBFDQo+ICsgKiBAcGU6IHRoZSBpbmRpY2F0ZWQgUEUN
Cj4gKyAqIEB0eXBlOiBlcnJvciB0eXBlDQo+ICsgKiBAZnVuYzogc3BlY2lmaWMgZXJyb3IgdHlw
ZQ0KPiArICogQGFkZHI6IGFkZHJlc3MNCj4gKyAqIEBtYXNrOiBhZGRyZXNzIG1hc2sNCj4gKyAq
IFRoZSByb3V0aW5lIGlzIGNhbGxlZCB0byBpbmplY3Qgc3BlY2lmaWVkIGVycm9yLCB3aGljaCBp
cw0KPiArICogZGV0ZXJtaW5lZCBieSBAdHlwZSBhbmQgQGZ1bmMsIHRvIHRoZSBpbmRpY2F0ZWQg
UEUNCj4gKyAqLw0KPiArc3RhdGljIGludCBwc2VyaWVzX2VlaF9lcnJfaW5qZWN0KHN0cnVjdCBl
ZWhfcGUgKnBlLCBpbnQgdHlwZSwgaW50IGZ1bmMsDQo+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB1bnNpZ25lZCBsb25nIGFkZHIsIHVuc2lnbmVkIGxvbmcgbWFzaykNCj4gK3sN
Cj4gKyAgICAgICBzdHJ1Y3QgIGVlaF9kZXYgKnBkZXY7DQo+ICsNCj4gKyAgICAgICAvKiBDaGVj
ayBvbiBQQ0kgZXJyb3IgdHlwZSAqLw0KPiArICAgICAgIGlmICh0eXBlICE9IEVFSF9FUlJfVFlQ
RV8zMiAmJiB0eXBlICE9IEVFSF9FUlJfVFlQRV82NCkNCj4gKyAgICAgICAgICAgICAgIHJldHVy
biAtRUlOVkFMOw0KPiArDQo+ICsgICAgICAgc3dpdGNoIChmdW5jKSB7DQo+ICsgICAgICAgY2Fz
ZSBFRUhfRVJSX0ZVTkNfTERfTUVNX0FERFI6DQo+ICsgICAgICAgY2FzZSBFRUhfRVJSX0ZVTkNf
TERfTUVNX0RBVEE6DQo+ICsgICAgICAgY2FzZSBFRUhfRVJSX0ZVTkNfU1RfTUVNX0FERFI6DQo+
ICsgICAgICAgY2FzZSBFRUhfRVJSX0ZVTkNfU1RfTUVNX0RBVEE6DQo+ICsgICAgICAgICAgICAg
ICAvKiBpbmplY3RzIGEgTU1JTyBlcnJvciBmb3IgYWxsIHBkZXYncyBiZWxvbmdpbmcgdG8gUEUg
Ki8NCj4gKyAgICAgICAgICAgICAgIHBjaV9sb2NrX3Jlc2Nhbl9yZW1vdmUoKTsNCj4gKyAgICAg
ICAgICAgICAgIGxpc3RfZm9yX2VhY2hfZW50cnkocGRldiwgJnBlLT5lZGV2cywgZW50cnkpDQo+
ICsgICAgICAgICAgICAgICAgICAgICAgIGVlaF9kZWJ1Z2ZzX2JyZWFrX2RldmljZShwZGV2LT5w
ZGV2KTsNCj4gKyAgICAgICAgICAgICAgIHBjaV91bmxvY2tfcmVzY2FuX3JlbW92ZSgpOw0KPiAr
ICAgICAgICAgICAgICAgYnJlYWs7DQo+ICsgICAgICAgZGVmYXVsdDoNCj4gKyAgICAgICAgICAg
ICAgIHJldHVybiAtRVJBTkdFOw0KPiArICAgICAgIH0NCj4gKw0KPiArICAgICAgIHJldHVybiAw
Ow0KPiArfQ0KPiAgICNlbmRpZg0KPiANCj4gICBzdGF0aWMgc3RydWN0IGVlaF9vcHMgcHNlcmll
c19lZWhfb3BzID0gew0KPiBAQCAtNzkyLDcgKzgyOSw3IEBAIHN0YXRpYyBzdHJ1Y3QgZWVoX29w
cyBwc2VyaWVzX2VlaF9vcHMgPSB7DQo+ICAgICAgICAgIC5yZXNldCAgICAgICAgICAgICAgICAg
ID0gcHNlcmllc19lZWhfcmVzZXQsDQo+ICAgICAgICAgIC5nZXRfbG9nICAgICAgICAgICAgICAg
ID0gcHNlcmllc19lZWhfZ2V0X2xvZywNCj4gICAgICAgICAgLmNvbmZpZ3VyZV9icmlkZ2UgICAg
ICAgPSBwc2VyaWVzX2VlaF9jb25maWd1cmVfYnJpZGdlLA0KPiAtICAgICAgIC5lcnJfaW5qZWN0
ICAgICAgICAgICAgID0gTlVMTCwNCj4gKyAgICAgICAuZXJyX2luamVjdCAgICAgICAgICAgICA9
IHBzZXJpZXNfZWVoX2Vycl9pbmplY3QsDQo+ICAgICAgICAgIC5yZWFkX2NvbmZpZyAgICAgICAg
ICAgID0gcHNlcmllc19lZWhfcmVhZF9jb25maWcsDQo+ICAgICAgICAgIC53cml0ZV9jb25maWcg
ICAgICAgICAgID0gcHNlcmllc19lZWhfd3JpdGVfY29uZmlnLA0KPiAgICAgICAgICAubmV4dF9l
cnJvciAgICAgICAgICAgICA9IE5VTEwsDQo+IC0tDQo+IDIuNDUuMg0KPiANCg==

