Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id 857428CA0CE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2024 18:41:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=g4fV5BPy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vjjlt1FVSz3g0x
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2024 02:32:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=g4fV5BPy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:c20a::3; helo=paup264cu001.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from PAUP264CU001.outbound.protection.outlook.com (mail-francecentralazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20a::3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vjjl64dJZz3cc6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 May 2024 02:32:02 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hzcvPCrXac17kyaDOTmcziphqRmqLsV272xJUfI8C/7nm0Ih9sHhE+5bndwdSac1Elp38lES3SUBTPEgNVfIHfzT+0ZZIzlyGohrUU/EqbW3InO7wEq5bCNTBGJCodNi1RDpABfslK94dwI3XX0jafTrd0CkXI9u6B0g0K31fi1ZVpHDLrv4GpQtcovnbVLRjmk3LXR8f1z9NoyqA9bdyGJbQAYBb3zvzXYw8ZbqFYHR0e05fMOzcayf9uSE9+Y6sS4i+ZtGyM1U7Q74m6xmpXHtB2SP67TZFS9UzbN/fP9ZPXQjceDUVFh9/Unj+nVKCdFt1YoHtvP/MYUho0mdTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MupZS0nVMJ4CoWfDGr2b1hfM65b/BYZEuC05vmY785A=;
 b=J4tePYtESR40ROqF22s0uIvlrz7oJBoUSH6xnHq71yFYfRIwaHtf36zZgIZrCD7ozo0lJIQZ3JCHcQWGCkE6whS35TWxSC2u4nNmJvuQpszPGm71Z7/D4z9UDi+ZqfQcTwtoo9BY7MmolzTToc9SAo5Rhp3HSOPyf+LxkfuJ+WD45+9rwM6zTygGZllLwz2/poYleixFi13yAKiy2/cxq03L3fLJggHsAsmXkQd1V9PYMLE0VHpjELl9x1J0MVDKXWsBkVVC3mSunxZJatzOxyl3sdjyb1Z5d4K/nwVxLjAYXS8TIMAPtfErRpWGQcdoEO5TLWYNMZjIpcqMhtSwOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MupZS0nVMJ4CoWfDGr2b1hfM65b/BYZEuC05vmY785A=;
 b=g4fV5BPyIMXptrEYVQsisog+4+2a9qCU9fS0wZx0p9copuKUX8MW8G8GDUQnf6xsx2NHZDT82Pu3RHGExAKXWiKRpiEtE5bEvFyCjc/2LovUm1NKbDSsTBarzWxUpywC+yus7vXRG4t/76J8NnBIEuDPD0JaYs4utp7YT2Sed4x75rp3tSxrm+argqsK9UWdcrWqQVsS2ME+mC4PX3DSEVZ1W/JBwZXN9TsPMKJ4tIdUACIdlX0LaOgltVqPej8DLgvDZKm0KXbsg+Q6ba+njN23gom0a9v295jQQmJYL2gb58qk/JbRHQwKTsc8BHXPqKiPQSdv8fWBCoAiSU8yog==
Received: from MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3d::7) by
 PASP264MB5395.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:43e::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7587.35; Mon, 20 May 2024 16:31:39 +0000
Received: from MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
 ([fe80::bc7:7b86:2461:88e1]) by MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
 ([fe80::bc7:7b86:2461:88e1%4]) with mapi id 15.20.7587.030; Mon, 20 May 2024
 16:31:39 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Oscar Salvador <osalvador@suse.de>, Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [RFC PATCH v2 06/20] powerpc/8xx: Fix size given to
 set_huge_pte_at()
Thread-Topic: [RFC PATCH v2 06/20] powerpc/8xx: Fix size given to
 set_huge_pte_at()
Thread-Index: AQHaqIxxLOw0k+xnhUqWHgWN6F7AE7Gf2z2AgAB6CIA=
Date: Mon, 20 May 2024 16:31:39 +0000
Message-ID: <f26807dd-bbd2-405d-9a88-c0654c525a5c@csgroup.eu>
References: <cover.1715971869.git.christophe.leroy@csgroup.eu>
 <04f4e737608ea0b177b88057db138fbf0d6ab138.1715971869.git.christophe.leroy@csgroup.eu>
 <ZksUiwNaKx2n1fJO@localhost.localdomain>
In-Reply-To: <ZksUiwNaKx2n1fJO@localhost.localdomain>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MR1P264MB2980:EE_|PASP264MB5395:EE_
x-ms-office365-filtering-correlation-id: 6909c9a7-b925-4995-4f40-08dc78ea5353
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info:  =?utf-8?B?cURDV0tKVGJDUXQ5NU10d0xmYzNQZVYvTWF1T0ViZlRzS3laTTMzTHVBL0th?=
 =?utf-8?B?UTNIUzRlNlV4ME56OGd4SDFxUWUvdXMzWHdJQnVFVGlZWVBrRjlGUGEzNWNr?=
 =?utf-8?B?YUkzZTBzWmJ1YVRLTGVvSmVmeE5OUmt3VEVSYWVKdjJwNFhZSkNmbFZac1VW?=
 =?utf-8?B?MExhcDdBYkNxZmpsMWFVUjNLdG1TN2R1Q3o2aFlVYWJCT0hZNnZJK1UxV0gr?=
 =?utf-8?B?d1VhdVVzRVR1NXpDNVE1eHhZeHdkeWpOL090UHVIUUJYQzdhQURXTE55Sjkr?=
 =?utf-8?B?ZVk3VkVOcUo5RDZsWStXRnl2eFZLaVV5cHNUc3hkUW5kVXFhVHBlUkdod1p4?=
 =?utf-8?B?WlRIVzdDRko2TDZzMldNbFlDT3g2WGsydHR0YSs2RGovWW9nU1RFbmZJQTZv?=
 =?utf-8?B?RmZueVdsTFpTeHY4bnhZNk1QblEwQXNKS0RPVUdNMGFwRERHWlAxeFNCNkxx?=
 =?utf-8?B?MUZleThBWm5ncHhXZHdINEU2QVExNWR2aGZiclFTcDJEbU01L1dKZng3RkJa?=
 =?utf-8?B?djdzK1B4VTZtNDQ5bk1nNHFzSTJhRUppQnJTUFhkRHdkeUdIekQrL2krM0NJ?=
 =?utf-8?B?U1g0UVY3bTdTZ2FqazJZMURscnRlVWJlWkZQWGJ1VFpjV2d1YkhDN1pYQzYw?=
 =?utf-8?B?S3U0YU5uZzVBL3MzNDBGakhCMDZtTm9wamRCSnVZOS9OcEtmdVRhY3Flckk1?=
 =?utf-8?B?OGlWSk9oNDJBMURmRGJ1ZnV1U1llUlVpN3JOT2xxLzRGUTR0Q0h0d1pBZllR?=
 =?utf-8?B?eFZUY1d1LzBoS1BFc2FpWFhEV0JSU0MrMmVXSU81OE1veVJROFJiRHdIdGJT?=
 =?utf-8?B?d0hsSmRUUjV5c0ZIVHJ0SWVoMkFHQ2VLbWJ4OXk2SDRXOU9laExMOTM0YzlP?=
 =?utf-8?B?ZTB1TU13TityOGZXV1Z4VnUrWDNuU1N5TVMwV2l4L3I0V0lyczkrV0ttY2Fa?=
 =?utf-8?B?U0Z0WG16a05Zb3licW1UMEkrekcwVURVQ2s1b3RYV2RqYkZEeC94TEg3V0w4?=
 =?utf-8?B?cUIrdWVHeXcyTkJoT2d2Mm1HMWlDc2lNMWV5MU5sUDZmSWVqWmNSU3RJb0g1?=
 =?utf-8?B?cHlJRnhKaFhEMkxpNEVldjVCVXNoR1ZOTUtPZ3daWHB6SkJPclZmUWU0cmZz?=
 =?utf-8?B?Qk50bTdRY0swYk1nbXQ0bjRvWEhuMTBCLzhtdU02WTN1bWxYRDlhSWJWWkhK?=
 =?utf-8?B?aXBpWjh4SFFrenlQdUlNMXVJelVZblBSK2lqbHA5eVZnc1A0bW5LRDJFZGoy?=
 =?utf-8?B?ekZ1NC9CemZGQitEbXZZZEh4cVJUNlpreEE0Rld2dkRVcWhjdUo4NUJkKzh2?=
 =?utf-8?B?cndiZVU2WFpoMXFwNGs3cnNYVXBnUVpheWxiVnVkcVQvT2hsMWVxM2ptVkgz?=
 =?utf-8?B?NjhYWCtzS3M0eHZQSzdkWnRSbXdUWS90N3VBbEtkZXA0MWdmUzhGb3VJY2hH?=
 =?utf-8?B?T2V5U2dhVGhKNy9zTW1GTUtGMXhBMkI1UzFVK0NvcDVwelJxeUdsZ2VSS21V?=
 =?utf-8?B?Tlkxc2ZGeHNZTmNtMFVJdzExV25MV2FRa0FKc2xoQVlPTDZSa0VNSWd3OXFj?=
 =?utf-8?B?WG9ySWtFbGFEb0dpQmczTnNGY2JYbXFwZWVxbitQQXhyN2N1UUFvZStPcVA2?=
 =?utf-8?B?QW8rUUYwQm9jOWYrWkJTUXJQbVFRNU9rbFM1ZXZZdnV4S3J1QkNZQXI2aWVH?=
 =?utf-8?B?TkxveEM0RlJ1MWN4SWM4ZlRRZTEySkhMNEp3VUV4Sk9nUFlxYXZrWTJSejNP?=
 =?utf-8?B?YU5GUEN0UHdja3J2bTBBejRQTDZ1RHJUc0paTlNPVUUyTU5VVTY0M1d4eUNB?=
 =?utf-8?B?RnN4ZkVTU2pQQm9WdHV0QT09?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?TEE3TlZNNVZMYkZXWGkyaEtPNkVkaEdGZ3pDa1FXRitWZVAwME9rVEZYWk9a?=
 =?utf-8?B?cW9OYW1VZ2tHYUtLbjk1NjZnSzYrSHlIdlhmSHhScEhRcDVJeDc5c0VUWkda?=
 =?utf-8?B?eGhPSjVvT0dZckswd1ZiSHllVmNMOTQzYkRwaWowOFBZOUNjYnpuNExpcmRi?=
 =?utf-8?B?eEduT25vZ09PZ3JtZ1FGbURqK1NHZ2NPc0oyRXU1U0dwMWl0alp5M0NpczFM?=
 =?utf-8?B?aThqYUwwV1NYVUg2eWtuT0tRMzQwWEMvQ0ZjY3k4RVROc0JtbEZ5LzlOL2xn?=
 =?utf-8?B?ODlMeGlqczY0TDZBMlVyTWQ1ZmprZkNWV21uWjI5aGlZTWExZC9mVTlmWnJo?=
 =?utf-8?B?L2dtOTF6SWdCNGN2cjNoMGd2LzdiZllNZE0rMXl0cnJoLzhqaG1IRGhpZDZ0?=
 =?utf-8?B?dVVhTU0xWlQxTXYxaUZCczlINHU1TWN2T2VUbjcwc2crdTBrV1Q2SlpOSDI2?=
 =?utf-8?B?YXFjZjJWMlR2NlROa2V0b0dZZE4vL1J3dWwvdFFCQkROTVQ1cXUxZENEV21i?=
 =?utf-8?B?dm9KLzdTY2VzUjBvdUhyWXNLZHNyQmtCMThOeFFYaEdhU3J1MDlrdVVkdyt0?=
 =?utf-8?B?YVdJUFRXYnlJaUFMZGY4cmhIcGEwaUFIV2hTQXR0OXZhaExhOGd3NWF3WG9C?=
 =?utf-8?B?Mk0vMC9UMlBWUW9kSDlLUHFja1Y2MjJ6L1RrNklDYnZsbnBva1BkTlQ4cUMr?=
 =?utf-8?B?eXg2QlR2VW05dWtkT0hBdXZ6N3d5UFlSeGZ1U3NaQnZYcWNIS2tXNFROTDJl?=
 =?utf-8?B?akY5UWFRbU1rN1FLNklCbDlTOHFtc3BGNDFYSVpOWHpGWWVzejhRZGFTcTQr?=
 =?utf-8?B?RXBnUVplMmNDbDRSdnkzZVFWektaZVB2WjVMd1phWGVIK1BZSXdLdXlVRGN6?=
 =?utf-8?B?TDhOWHpmNHpQZFoxRnRmbE5rbFpMMnhyMlRNM1B2aUl1ZC9SdWFJdko4b21j?=
 =?utf-8?B?ZCt6Mm9uTzkyUGZ6L1JUSG9iek1EY3ErNFU4aW04ckl5WTNOY2tzWmJuejBJ?=
 =?utf-8?B?R3JHTnhIaldmaFhod2JEczNNeEpvdVpFUFNJSTdVcFBjNkd2YWpFcTV3c1Jp?=
 =?utf-8?B?Q1N4bjg4eFRWU1R2UVdNMzNxekpFN29QbTdsa01NendlellCN1ZzRXdpMkp0?=
 =?utf-8?B?Y3lFdlFySmx3cUhUbmZVRnJHM3Z6TnRpZ01sY0tQK2t5ZHA0bWdoMFVxVkFT?=
 =?utf-8?B?eVFzRGZlZVhDQ2p0SnQ0Yk9CUktlYlcvMVB6YVE0RkRJck1Rc2llUStBTFla?=
 =?utf-8?B?c2g5VElMa1pMY0hab29lQVRGOTlUWUFFY0VYUGZRUDY2T1A0RUlCRndsdXdM?=
 =?utf-8?B?QTZsQVpqb25aY2dlZXFZZ21sMlY3NDVHTGlhRGRmU1dMbU5uaFpVOVBTNU9p?=
 =?utf-8?B?bS9sME9acGlBS3NrSXl6WWRRYjhQd0dRek95UXl3RmpCaXZZay80WU54ZG1J?=
 =?utf-8?B?cXVHeVpkTVpwM0hKOGhiT0N2YU5NQzA5d1B0V1FRTEM3MXRBaHZKMnJSTTFu?=
 =?utf-8?B?K2ZiSzlUS1d0eE9NM00rN09jcGdwU2NwaWpvUDA0Sm9UOXhCSkJQb29odkdY?=
 =?utf-8?B?QVQyR0hDK2RtUExhaGM2L2hEdnV5RTVyKy8xeEtaMERXbzhXS1RvekpMcXRJ?=
 =?utf-8?B?MkZWNWo1cU5oOEZtdVBNUWdiSFVIOFhGdFVWM2Yxb3d5dUZrRjNIOWJQcVd4?=
 =?utf-8?B?MDNFYWhGK1VLSFU1d0M1UFc2S20zVStuclQwVGtvd3JERmx2c1BrNmNlMm0z?=
 =?utf-8?B?dTFxaUlSZ1hjNXJwQ3Z0bHNLOXNrUWw1ais2bzJDNis1QzB1a3RrREhhYU80?=
 =?utf-8?B?RnFIRUxuVDVLNjdzdURsTHVybGEwY3RDdGNIcjI3eVJ3akZCRjhnUGxyUnRh?=
 =?utf-8?B?STJtc2JhYVdRcHo3cTZVblFqZkxacWtQMFhkallmVmRNak5QVmRkaStaL3F3?=
 =?utf-8?B?Z1VuMk11N1dlQUxLYzk5THZuYkVEdksreW1QSEF0THBjcG55cVE3ankxeXpx?=
 =?utf-8?B?dFVuQzZ4WUlpQmtzbkNmOE1UNWgrTDN4K0pva0YzR1JKZW4xZlpJR2IwU1lv?=
 =?utf-8?B?WFJYSi9LbWc0R3pDTkY0YzVHNy9KZnh2VlJNOEZSM2ZscFJhaktrRFdGaDVw?=
 =?utf-8?B?RFN6TnVuVWVNaVpYVEc2dXlnUXphNm02VXZvaEJmbnhLWlJDTkVDQWpOckRl?=
 =?utf-8?Q?z1YvOkwBzct5W0Js6dCNQ8eYy/JSPaiqBKRbGw2hiel+?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1FC85D6959983347B009FA3AC693B2E2@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6909c9a7-b925-4995-4f40-08dc78ea5353
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2024 16:31:39.4796
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TsPE1fmrIPTSO58VcJIYLN+SOPnVf54z24hvRsPkoS9Zhn8S9GXH6v+IXMtVnI4mrlETpnHMoWU6u0fJ5TVbRjDwJoWfNSHo8SyQZ0Z3P1E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PASP264MB5395
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, Peter Xu <peterx@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGkgT3NjYXIsIGhpIE1pY2hhZWwsDQoNCkxlIDIwLzA1LzIwMjQgw6AgMTE6MTQsIE9zY2FyIFNh
bHZhZG9yIGEgw6ljcml0wqA6DQo+IE9uIEZyaSwgTWF5IDE3LCAyMDI0IGF0IDA5OjAwOjAwUE0g
KzAyMDAsIENocmlzdG9waGUgTGVyb3kgd3JvdGU6DQo+PiBzZXRfaHVnZV9wdGVfYXQoKSBleHBl
Y3RzIHRoZSByZWFsIHBhZ2Ugc2l6ZSwgbm90IHRoZSBwc2l6ZSB3aGljaCBpcw0KPiANCj4gImV4
cGVjdHMgdGhlIHNpemUgb2YgdGhlIGh1Z2UgcGFnZSIgc291bmRzIGJldHR0ZXI/DQoNClBhcmFt
ZXRlciAncHppemUnIGFscmVhZHkgcHJvdmlkZXMgdGhlIHNpemUgb2YgdGhlIGh1Z2VwYWdlLCBi
dXQgbm90IGluIA0KdGhlIHdheSBzZXRfaHVnZV9wdGVfYXQoKSBleHBlY3RzIGl0Lg0KDQpwc2l6
ZSBoYXMgb25lIG9mIHRoZSB2YWx1ZXMgZGVmaW5lZCBieSBNTVVfUEFHRV9YWFggbWFjcm9zIGRl
ZmluZWQgaW4gDQphcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vbW11Lmggd2hpbGUgc2V0X2h1Z2Vf
cHRlX2F0KCkgZXhwZWN0cyB0aGUgc2l6ZSANCmFzIGEgdmFsdWUuDQoNCg0KPiANCj4+IHRoZSBp
bmRleCBvZiB0aGUgcGFnZSBkZWZpbml0aW9uIGluIHRhYmxlIG1tdV9wc2l6ZV9kZWZzW10NCj4+
DQo+PiBGaXhlczogOTM1ZDRmMGM2ZGM4ICgibW06IGh1Z2V0bGI6IGFkZCBodWdlIHBhZ2Ugc2l6
ZSBwYXJhbSB0byBzZXRfaHVnZV9wdGVfYXQoKSIpDQo+PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3Rv
cGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+DQo+IA0KPiBSZXZpZXdlZC1i
eTogT3NjYXIgU2FsdmFkb3IgPG9zYWx2YWRvckBzdXNlLmRlPg0KPiANCj4gQUZBSUNTLCB0aGlz
IGZpeHVwIGlzIG5vdCByZWxhdGVkIHRvIHRoZSBzZXJpZXMsIHJpZ2h0PyAoeWVzLCB5b3Ugd2ls
bA0KPiB0aGUgcGFyYW1ldGVyIGxhdGVyKQ0KPiBJIHdvdWxkIGhhdmUgaXQgYXQgdGhlIHZlcnkg
YmVnaW5uaW5nIG9mIHRoZSBzZXJpZXMuDQoNCllvdSBhcmUgcmlnaHQsIEkgc2hvdWxkIGhhdmUg
c3VibWl0dGVkIGl0IHNlcGFyYXRlbHkuDQoNCk1pY2hhZWwgY2FuIHlvdSB0YWtlIGl0IGFzIGEg
Zml4IGZvciA2LjEwID8NCg0KPiANCj4gDQo+PiAtLS0NCj4+ICAgYXJjaC9wb3dlcnBjL21tL25v
aGFzaC84eHguYyB8IDMgKystDQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL21tL25vaGFz
aC84eHguYyBiL2FyY2gvcG93ZXJwYy9tbS9ub2hhc2gvOHh4LmMNCj4+IGluZGV4IDQzZDQ4NDJi
YjFjNy4uZDkzNDMzZTI2ZGVkIDEwMDY0NA0KPj4gLS0tIGEvYXJjaC9wb3dlcnBjL21tL25vaGFz
aC84eHguYw0KPj4gKysrIGIvYXJjaC9wb3dlcnBjL21tL25vaGFzaC84eHguYw0KPj4gQEAgLTk0
LDcgKzk0LDggQEAgc3RhdGljIGludCBfX3JlZiBfX2Vhcmx5X21hcF9rZXJuZWxfaHVnZXBhZ2Uo
dW5zaWduZWQgbG9uZyB2YSwgcGh5c19hZGRyX3QgcGEsDQo+PiAgIAkJcmV0dXJuIC1FSU5WQUw7
DQo+PiAgIA0KPj4gICAJc2V0X2h1Z2VfcHRlX2F0KCZpbml0X21tLCB2YSwgcHRlcCwNCj4+IC0J
CQlwdGVfbWtodWdlKHBmbl9wdGUocGEgPj4gUEFHRV9TSElGVCwgcHJvdCkpLCBwc2l6ZSk7DQo+
PiArCQkJcHRlX21raHVnZShwZm5fcHRlKHBhID4+IFBBR0VfU0hJRlQsIHByb3QpKSwNCj4+ICsJ
CQkxVUwgPDwgbW11X3BzaXplX3RvX3NoaWZ0KHBzaXplKSk7DQo+PiAgIA0KPj4gICAJcmV0dXJu
IDA7DQo+PiAgIH0NCj4+IC0tIA0KPj4gMi40NC4wDQo+Pg0KPiANCg==
