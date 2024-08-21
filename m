Return-Path: <linuxppc-dev+bounces-260-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF04959701
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2024 11:06:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WpgSG52zlz2yDj;
	Wed, 21 Aug 2024 19:06:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=cs-soprasteria.com
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:260e::601" arc.chain=microsoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=cs-soprasteria.com header.i=@cs-soprasteria.com header.a=rsa-sha256 header.s=selector1 header.b=1zG6kiBR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cs-soprasteria.com (client-ip=2a01:111:f403:260e::601; helo=eur03-am7-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy2@cs-soprasteria.com; receiver=lists.ozlabs.org)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:260e::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WpgSF6m8yz2xsM
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2024 19:06:37 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y+l+3ThFB8L+yOzuLf4O/NvkQH9V1KD2ijRoVp/rC4NG+dID/Wd/uT+NZJ/mnH1BmkbgV2MedhPurmHFF8+jBCVNAAXCVAZxCZsbNbDbRQv2uOeS024b1zw87Yt6Q5cHJfz4AZo2irDsTqEUAAvHT8eIfGALajyrE+GtOkrsZdd8KT/ZioOV90rdZiVN1VtTuIB2ucGC/DOSauMWIrA+DhNy0uzAbFjn39Z3n3woTVJY+ptdjGpnpSf1GJMIYQ64mwm4t2owPbEbUI7S65XXIr9hoN12dqgP+H7N69jrC79ZYQy5MZAykVqWaUFuZMhPsLjt8gNjEP873fKS0PA1ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cutLXvwoV/dXAKfisy8z6ZUrtt/us152wSc+qKaK/OU=;
 b=kMqmY70kaHiaNeowyufYNNbUnVVDhMT9xP3WaUOYx02tq7mhTRs3ZF5WgjjXguRH8Ap5CQ7yQeBsrcMhdZm/eCC32H3ILX2wApb93UPnhv/CtV63VmSd06PWqk8xIcEzUwDQfcyKJWVCu2Dkw2roKmQdnqHrmicF+MeoZs7DXFN7/+UXvfs+tJfiryl+/VslOwquCyRPch8/OnwNlMSRlTZJO3GqCd/UeLzf1TayDT6a9G+pvPt87z48cnAD6SUVban3a8lMh1j+7bqIVORGz4LHWSt0O0py4AFR6fLsWPjzHT0OfXPE5kJPzr5RsbcTJdRx8DEpxFHJ2uonFF8Z1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cs-soprasteria.com; dmarc=pass action=none
 header.from=cs-soprasteria.com; dkim=pass header.d=cs-soprasteria.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cs-soprasteria.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cutLXvwoV/dXAKfisy8z6ZUrtt/us152wSc+qKaK/OU=;
 b=1zG6kiBRGeTTVXwPKxNFEQvLFEHX4kTyZ+lJRpZPiEgZx8Z1tfU7GjTm9VqelroZCGiukl8gSOlcAZogLr/1VttzsQE3q+Z7KTCxjF+Mv5kd7/yAkaN2xV2tbRhb9q0v0JXPmyHBeSB3PzVYZimQ/rg1AFj0DDsylPxIjcJWhxrbMWqpZjsSODr1RKoUhTfLoTeT2je1dsoWitcmGi+d8b/82ArPaTjbgyb6GoGZ8rWSXLwz12PBG9LP5B0/WaHb2Qjk9YORM8TQpFn25rPKrJtt0dDfTqirXz7C6g/YINbmw7XZcDJB/Jn/+P+OVejCRJr3Xs/hQucDHcyPl9UoNg==
Received: from AM0PR07MB4962.eurprd07.prod.outlook.com (2603:10a6:208:f3::19)
 by PR3PR07MB6922.eurprd07.prod.outlook.com (2603:10a6:102:7e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.18; Wed, 21 Aug
 2024 09:06:13 +0000
Received: from AM0PR07MB4962.eurprd07.prod.outlook.com
 ([fe80::6724:2919:9cbb:2bb2]) by AM0PR07MB4962.eurprd07.prod.outlook.com
 ([fe80::6724:2919:9cbb:2bb2%4]) with mapi id 15.20.7875.023; Wed, 21 Aug 2024
 09:06:13 +0000
From: LEROY Christophe <christophe.leroy2@cs-soprasteria.com>
To: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>
CC: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: perf build failure with v6.11-rc4 (commit 4bbe60029319 ("perf daemon:
 Fix the build on 32-bit architectures"))
Thread-Topic: perf build failure with v6.11-rc4 (commit 4bbe60029319 ("perf
 daemon: Fix the build on 32-bit architectures"))
Thread-Index: AQHa86lfJbpYKsy6YU6TlKjudDsRmg==
Date: Wed, 21 Aug 2024 09:06:13 +0000
Message-ID: <83384a02-60f9-489b-8e58-a5f3b65992b8@cs-soprasteria.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cs-soprasteria.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR07MB4962:EE_|PR3PR07MB6922:EE_
x-ms-office365-filtering-correlation-id: 3720694f-ca89-4dbb-5be0-08dcc1c081ae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?NkFxcnc0a0ZxME8yWmViOWF2UDM5NUF4b1RCWGN3eFNmVm1veWlzdUs4S0p0?=
 =?utf-8?B?cjZvS0JWekFmMnpDdTdkM1JkVXBrUEVDWGRGNkVYVG4zVVZoNndYaE91aWpx?=
 =?utf-8?B?SkEvUVA5MjRkclF2UzdPR2hxa1BpR0FBZFl4eEtETVRnN0dSWkcraklqQ1BP?=
 =?utf-8?B?Sk83Z3dYLzYwZmFraW1vMm9Xb2tWZzVlVG5mRGZ2eTZXZXoyUzVLUlJ1ekJX?=
 =?utf-8?B?RW5rcjErMkM2NlE3VU96clBRTGM4ODhqK1o3T2RXazZJUXNpQy9RTWZkYSs4?=
 =?utf-8?B?UFRKOTk2Qmh4c05HVkRIb0FCVWNWa2t5clA2d29CdmVrd05TZlk0enYvTHZQ?=
 =?utf-8?B?eGJVdExrSVFVUndxem1PZG9DOHFzdk9keU5FZjByN0NMbGRNMThSOWZYeVVO?=
 =?utf-8?B?TkJBV3pUbldhVkMycGdhcVNzVkl2NUpBUy9TdWkwOVJKYXVKWWE1ZnJJcnRK?=
 =?utf-8?B?T2sxUS9Gb2t1SUx0MDM3dkdvRXZ1VXNxMXRmU2gxbmN6bzQ0bmtid3VrVDZJ?=
 =?utf-8?B?WWEwTE9qVzh5QTZ1clorMGR3T0NFb3lCVTUzMWQrSnFaVEJITnpmd3pBQ0hP?=
 =?utf-8?B?Z2liQlVRelBkVVp0ckJ0Mm1ZYm1VY3JjdFRLZnhsT25RbFpsckx4MUk5OXpJ?=
 =?utf-8?B?NTlSYnV3TGw3bjkvRTlyanBLNTY2a2Iwd3BXQXIwU3dXL2dBWDlMMW5EcmZH?=
 =?utf-8?B?WlI2YmNLZUZXZXp6UUMrK0Y3U3pIekJRMEJqQmNYK0NhRnhyZTRQNmdpcWZR?=
 =?utf-8?B?VkVLUHg5S1JmQVh0cHJiUVFkcFN4Z3l4Y1VaamNyS2w2ei9kZ2MySFlOSEo0?=
 =?utf-8?B?bjh1NWQyTm9JV0tMNXpLVUlBalNmUy9MbHQvNmJQQzhVMXBUd2YrcnBEdU40?=
 =?utf-8?B?YjJkZVhpWFhDVk5EaGRBM29kT1RQZmxMMnZxVmZFelJIMnNPT2E3bnkzUVV4?=
 =?utf-8?B?MVlNbW5GMGZ2cDdLUU1FSHNwWXcrcnZvOUxOcGZKdVZ5ZzdxZ1BJalYrTVZw?=
 =?utf-8?B?dlJ6OU5oWDIzaEc5aGNlUDEzR1Y0T1ZrNkhraUIxNXVzMEg4OXVNZytXVjNU?=
 =?utf-8?B?bCtMOCtUMGVFaDhqbU1WMHgyTUxYbXhxZFJpdWYwMHlRYm5LMXErQ1FMUWhj?=
 =?utf-8?B?RVJTT2FlWWtDZHAvSzVHcWgvbkZXWEU4ZThhTVI2OW9iMGd3Z3JjTGE0RlFE?=
 =?utf-8?B?T0RpZmlIVlZvZUZja1ZzRSs4bWhFNFBib0psb2NMNUlRbHBuQVZLUHoza1VH?=
 =?utf-8?B?MU1OZWdUWktZbUhoRFJHb1IrOXBsK1JkYi9yaFZrNU1NQXFyWitPVnV5ZmFU?=
 =?utf-8?B?ZEg4Y2RHWDJQWkwza05BbngvMnZJcFZpSUYvL2gzbVN0dFMwMlQ5Tk0wVU5m?=
 =?utf-8?B?V3N2d0Uvems0UDhjSzIvV2ZzVnQzem9SaWZCUFovRFVpMjkxYmNNU1M3Njdz?=
 =?utf-8?B?VHlxYVJ4SDJIZmdTU1BmUVcwd2xjYVZwbWJUeWxaUWwramxoTUJ5ZXQySDhx?=
 =?utf-8?B?a3lxZ0JYYk1JcnNVWC9lUEdIWk1Sd1lseHRVVDNKUVc4ci85aWNKLzJndzV2?=
 =?utf-8?B?RGJLTEVmRXJhMkRxdEg2MmNhUVJvbko5U2ZZMlA1amZudUtLYkVxWEdsVnpl?=
 =?utf-8?B?bnczYjJlbFRnZnR0Y0ZPYWJ0QnZ4dDU1MkswT0JENXZNYnF4b0hSQ0x0ZnJQ?=
 =?utf-8?B?M0hENzNDR3FFemZ6b2tuSU1GUmRLcjV4ZEpNVi9uYVJsdmY1TFNCYzVHdkRm?=
 =?utf-8?B?bXYweVQybHpSOUxDTHpiR1NVTllYMm5CQ0luOW9wUEhlTVE2ZDVLWTQ2enB5?=
 =?utf-8?Q?D3fQyiu55HQONAVCgrrXXbmsV7akuPet6zRXo=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR07MB4962.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OXFJRGE5WUF3aTltS1hxRG8vaFFLNzJ1R1czU1lHS1VpL0tLYjR6TkwyU21K?=
 =?utf-8?B?SmdJVzcxclFtM0dIN3RJNFZjS0JocjNmbnU3QVc3RDFYRHFxb0NjQmNtKzlM?=
 =?utf-8?B?M3NORGsxcGZjQ1FyMFZna1MzUkdtc3dsTDNPaHZjM1paQVV1bzE2eVgvellK?=
 =?utf-8?B?RjdIL0w5K2VlY0RDSWtFWm14Tm05MjBicXRUQ29helY0Y3hNQTV5cExEWjFZ?=
 =?utf-8?B?RE8yQVh1c2FnZ2NvUVROYWdrN2lCRGtMNjlKZUdFQnEwckwrNlg2Y1o3Ukcv?=
 =?utf-8?B?aGpMQnRleTBGM0RjaUNiNlB4TW9LaGsvQ2NjemNENTFiZzVLaXg0Mi9xdTEv?=
 =?utf-8?B?ZmdubWJDUFRUZ3orZEkvM096eEVTR1l3cklEQWh6U25OTTY3TkJIbjVkUTFK?=
 =?utf-8?B?c1dBWXdhMVhQYnpPUzBlejJUbzFGUjM1VTVYbnlxQ21kL2xYeTYrbHZIN1px?=
 =?utf-8?B?ZUU2RW9mODRuY2RBQTZsQzlIUVgyOUJ0eWlWSk4zV1RQc1Zucndqb1ljOUhY?=
 =?utf-8?B?WmFoMzhlSm9manR0dnZtVmE4bVU4NUgvVUJRR291KzVVcnd0Q1Q0ejhZbVdE?=
 =?utf-8?B?aW9nNmYxQkRseVFKeE9KWTVUckpwS0lvcUREU2NzWEgzUkZ5VnVzOHN2VCtX?=
 =?utf-8?B?TW4weUNncHAwL1c5NFZhdFJjZzJ1NEpBN05SeUtiMGJiVGFlQWNieWFPY20w?=
 =?utf-8?B?a2pmdUtsMThaWlF6SDg2ZnFqTXBuTXZjOFRUN2xwMm5PbEdpT3B2NmQ0c0Jy?=
 =?utf-8?B?M0VObHhSTTNUNVlidmRUR3pucXZhTDNhRmh1VHlpdzdqQzZUTDRaSXdpSzFh?=
 =?utf-8?B?WVZiYWtUT2MxeWJDZjRENWZXTXB6bjB1dndUTDJlbTloVnNJTHdqd2ZKRUth?=
 =?utf-8?B?SXMvQllvQmhMekdWdEw4TjlVTTUzMHo0NDlPTm9pNXZ3Qk5ENzJHRWMvbzhP?=
 =?utf-8?B?LzJQQ05PdUhVd3B2eU85RlJsRHVpa3FqYy9mNEx2SXJreE9UcGoxSGlDQVFC?=
 =?utf-8?B?alEvSkwzRWx4ckVSMWM5aVNGb25CVDZkMGtVS2VOL0RFdm13Um8xb3Y0UzZD?=
 =?utf-8?B?bC9nc1RjcVRaK1VoajQ1ZGJCWkljUVZFS24vT3EwdGV6MWFEbmlLL1dicC9y?=
 =?utf-8?B?TDVQMGJQbFRLOEd3S0s3RXlOVlIzZDJFdmdzSTQ0SHNnNHloNFVGeklFZVNu?=
 =?utf-8?B?Q0Y0aTZBNFZUU24zbWNmbFlUdWNFRWhDVjNQa0xOUWY5U1R3Y2UweFJrTUgv?=
 =?utf-8?B?QTlEVGYzaVJVeDc0cytKdGVyalFVS3ZFdFVOazBUNFVORXBTbVFILzBka2tu?=
 =?utf-8?B?RjZ1RTJlbzRiYjhIVnVqbVJlOHlLa1hzZDZzd0ZTa1FocWI5cjJLcW5XSTVI?=
 =?utf-8?B?K0toSVV5OVByUml1aG1xSUcxeGlqejBvT25RS2xTazJpdXJMWlY5bzdtd20y?=
 =?utf-8?B?MWp1ODFxSGltNGtqc1k1Rm4xQWJsWkhQK2xINHIzOXlZTjZkYXVtZ2E0clFP?=
 =?utf-8?B?ZTJtaXdGOFJzS0pab2hXLzN3RGhzM0xsR3h4cU9GcStOQWF0a1JDREVDTjZk?=
 =?utf-8?B?TEhyRWh6UjM0aUl2V2RmcG9ZbDlIbng3K204Ti9hOHY0YzJYS1hRYUp5N3Ar?=
 =?utf-8?B?V3hYWkNERVlVSlpMVENGVW1XOVA1OE9SOTQ4Z2dGMlN5Z1RkcnpVS3JsQlFt?=
 =?utf-8?B?YUJwZFhoUldCbER5TXVYT1NsejVYeHhaMVhYQ0N4blliL0JpVFJ0RWdxLzcz?=
 =?utf-8?B?b2NKV0ZIeU1NTDFVWC9ESWxRQVN6SXN4blRnVCtWLzFKR1VNQlNWSUdMbzJB?=
 =?utf-8?B?YlhZM00wWXdDVkdHNVUwVThoeTFkMXpCdmpqTGJvcktxeGtaVC94NjJhQnZK?=
 =?utf-8?B?SHN3VWR2YnJ6YXFMY1pSaitjSGJHZXl2TDZSQ2xVempMdmRJeGlhWnRTMXNu?=
 =?utf-8?B?RU9FNDFJVUFQQnpxcTgxQlU0Ujg4eWl3aTVKdGwvUjF2VFRvVmVlMzhmSkY2?=
 =?utf-8?B?VEFDTktyUVBYL25ZNEczYzRvK3lBWEtRSkpFaEhjNytIcTRQM2lTcW03cTBF?=
 =?utf-8?B?Y293SVZiM2lRdys5ckJGWWd1dUtVa1dJQWl4Vk1ML2VtTTBqWCtod1M3ells?=
 =?utf-8?B?QUFTKzNUV0J1QWRLNzU4MEM0dUNud0tCYmFmY2N4YjByQXNWcEI3WTQzb1NE?=
 =?utf-8?B?a3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5238F46466E355478F5B8D2D1CCEDAB7@eurprd07.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 3720694f-ca89-4dbb-5be0-08dcc1c081ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2024 09:06:13.2760
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8b87af7d-8647-4dc7-8df4-5f69a2011bb5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ww4ZYrtuL6imPPx4b8IF7FI6VjV6cj+xrDHk1Mp3O7PqdgdemFRJFmGvVx+jxfuqHKUjWHvbS5jCn9zbxf6WiZ88plLCQ31Dc+IAA21rNAzTd8BMP5nzsGDn/6EmJ9J0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR07MB6922
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
X-OrganizationHeadersPreserved: PR3PR07MB6922.eurprd07.prod.outlook.com

R290IHRoZSBmb2xsb3dpbmcgYnVpbGQgZmFpbHVyZSBvbiB2Ni4xMS1yYzQsIHNlZSANCmh0dHBz
Oi8vZ2l0aHViLmNvbS9jaGxlcm95L2xpbnV4L2FjdGlvbnMvcnVucy8xMDQ4NTY4MDA0MS9qb2Iv
MjkwNDIzMDI1MTkNCg0KYnVpbHRpbi1kYWVtb24uYzogSW4gZnVuY3Rpb24gJ2NtZF9zZXNzaW9u
X2xpc3QnOg0KRXJyb3I6IGJ1aWx0aW4tZGFlbW9uLmM6NjkyOjE2OiBlcnJvcjogZm9ybWF0ICcl
bGx1JyBleHBlY3RzIGFyZ3VtZW50IG9mIA0KdHlwZSAnbG9uZyBsb25nIHVuc2lnbmVkIGludCcs
IGJ1dCBhcmd1bWVudCA0IGhhcyB0eXBlICdsb25nIGludCcgDQpbLVdlcnJvcj1mb3JtYXQ9XQ0K
ICAgNjkyIHwgICBmcHJpbnRmKG91dCwgIiVjJSIgUFJJdTY0LA0KICAgICAgIHwgICAgICAgICAg
ICAgICAgXn5+fn4NCiAgIDY5MyB8ICAgIC8qIHNlc3Npb24gdXAgdGltZSAqLw0KICAgNjk0IHwg
ICAgY3N2X3NlcCwgKGN1cnIgLSBkYWVtb24tPnN0YXJ0KSAvIDYwKTsNCiAgICAgICB8ICAgICAg
ICAgICAgIH5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fg0KICAgICAgIHwgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB8DQogICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGxvbmcgaW50DQpJbiBmaWxlIGluY2x1ZGVkIGZyb20gYnVpbHRpbi1kYWVt
b24uYzozOg0KL3Vzci9wb3dlcnBjLWxpbnV4LWdudS9pbmNsdWRlL2ludHR5cGVzLmg6MTA1OjM0
OiBub3RlOiBmb3JtYXQgc3RyaW5nIGlzIA0KZGVmaW5lZCBoZXJlDQogICAxMDUgfCAjIGRlZmlu
ZSBQUkl1NjQgIF9fUFJJNjRfUFJFRklYICJ1Ig0KRXJyb3I6IGJ1aWx0aW4tZGFlbW9uLmM6NzA0
OjE3OiBlcnJvcjogZm9ybWF0ICclbGx1JyBleHBlY3RzIGFyZ3VtZW50IG9mIA0KdHlwZSAnbG9u
ZyBsb25nIHVuc2lnbmVkIGludCcsIGJ1dCBhcmd1bWVudCAzIGhhcyB0eXBlICdsb25nIGludCcg
DQpbLVdlcnJvcj1mb3JtYXQ9XQ0KICAgNzA0IHwgICAgZnByaW50ZihvdXQsICIgIHVwOiAgICAg
ICUiIFBSSXU2NCAiIG1pbnV0ZXNcbiIsDQogICAgICAgfCAgICAgICAgICAgICAgICAgXn5+fn5+
fn5+fn5+fn4NCiAgIDcwNSB8ICAgICAoY3VyciAtIGRhZW1vbi0+c3RhcnQpIC8gNjApOw0KICAg
ICAgIHwgICAgIH5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fg0KICAgICAgIHwgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgfA0KICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAg
bG9uZyBpbnQNCkluIGZpbGUgaW5jbHVkZWQgZnJvbSBidWlsdGluLWRhZW1vbi5jOjM6DQovdXNy
L3Bvd2VycGMtbGludXgtZ251L2luY2x1ZGUvaW50dHlwZXMuaDoxMDU6MzQ6IG5vdGU6IGZvcm1h
dCBzdHJpbmcgaXMgDQpkZWZpbmVkIGhlcmUNCiAgIDEwNSB8ICMgZGVmaW5lIFBSSXU2NCAgX19Q
Ukk2NF9QUkVGSVggInUiDQpFcnJvcjogYnVpbHRpbi1kYWVtb24uYzo3MzE6MTc6IGVycm9yOiBm
b3JtYXQgJyVsbHUnIGV4cGVjdHMgYXJndW1lbnQgb2YgDQp0eXBlICdsb25nIGxvbmcgdW5zaWdu
ZWQgaW50JywgYnV0IGFyZ3VtZW50IDQgaGFzIHR5cGUgJ2xvbmcgaW50JyANClstV2Vycm9yPWZv
cm1hdD1dDQogICA3MzEgfCAgICBmcHJpbnRmKG91dCwgIiVjJSIgUFJJdTY0LA0KICAgICAgIHwg
ICAgICAgICAgICAgICAgIF5+fn5+DQogICA3MzIgfCAgICAgLyogc2Vzc2lvbiB1cCB0aW1lICov
DQogICA3MzMgfCAgICAgY3N2X3NlcCwgKGN1cnIgLSBzZXNzaW9uLT5zdGFydCkgLyA2MCk7DQog
ICAgICAgfCAgICAgICAgICAgICAgfn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fg0KICAgICAg
IHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwNCiAgICAgICB8ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsb25nIGludA0KSW4gZmlsZSBpbmNsdWRl
ZCBmcm9tIGJ1aWx0aW4tZGFlbW9uLmM6MzoNCi91c3IvcG93ZXJwYy1saW51eC1nbnUvaW5jbHVk
ZS9pbnR0eXBlcy5oOjEwNTozNDogbm90ZTogZm9ybWF0IHN0cmluZyBpcyANCmRlZmluZWQgaGVy
ZQ0KICAgMTA1IHwgIyBkZWZpbmUgUFJJdTY0ICBfX1BSSTY0X1BSRUZJWCAidSINCkVycm9yOiBi
dWlsdGluLWRhZW1vbi5jOjc0OToxNzogZXJyb3I6IGZvcm1hdCAnJWxsdScgZXhwZWN0cyBhcmd1
bWVudCBvZiANCnR5cGUgJ2xvbmcgbG9uZyB1bnNpZ25lZCBpbnQnLCBidXQgYXJndW1lbnQgMyBo
YXMgdHlwZSAnbG9uZyBpbnQnIA0KWy1XZXJyb3I9Zm9ybWF0PV0NCiAgIDc0OSB8ICAgIGZwcmlu
dGYob3V0LCAiICB1cDogICAgICAlIiBQUkl1NjQgIiBtaW51dGVzXG4iLA0KICAgICAgIHwgICAg
ICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+DQogICA3NTAgfCAgICAgKGN1cnIgLSBzZXNzaW9u
LT5zdGFydCkgLyA2MCk7DQogICAgICAgfCAgICAgfn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fg0KICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwNCiAgICAgICB8ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBsb25nIGludA0KSW4gZmlsZSBpbmNsdWRlZCBmcm9tIGJ1
aWx0aW4tZGFlbW9uLmM6MzoNCi91c3IvcG93ZXJwYy1saW51eC1nbnUvaW5jbHVkZS9pbnR0eXBl
cy5oOjEwNTozNDogbm90ZTogZm9ybWF0IHN0cmluZyBpcyANCmRlZmluZWQgaGVyZQ0KICAgMTA1
IHwgIyBkZWZpbmUgUFJJdTY0ICBfX1BSSTY0X1BSRUZJWCAidSINCg0KDQpDaHJpc3RvcGhlDQo=

