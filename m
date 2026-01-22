Return-Path: <linuxppc-dev+bounces-16137-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8N/nKUT1cWmvZwAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16137-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jan 2026 11:00:36 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4C964EE2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jan 2026 11:00:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dxc4w3V0Yz2ySb;
	Thu, 22 Jan 2026 21:00:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c20f::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769076032;
	cv=pass; b=Rp+J+r++w4gke0uXLlA3iX8+7QN+4je86kR6CTETnCyKSQiX0Krp1OPZeCMjqx4qYc/o8EJw4S496YhOvOZ6DGedJ0g3feiP1USfNSIgrxC1RcBJA2rmIjI0tWxm0jXd9q3N2pmDupcbM5ZD90u210d+zvKcPigWfjZeikCKTHXEgOxIehmkoWWErht4l2PvxL4xi/4KI9i+6DdPBhVS9mmV7HLAIMSRe3JvqwzKTqzw9CEYS74swy3QxVe11G8VWLJDfSRplqjcLDIgXljnrrMjVYdAjVau76CIolPyXoiFe1ls6RSAkpZ8PZcypH9vSQYPeSA34IPkfROCqHHtww==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769076032; c=relaxed/relaxed;
	bh=IU3ESBuLndzmbOURXoJ6rASIjZzsZsPHdAkIonluM+8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OloP+O5Mo4ASQnz7DuPf+Oalb/gPj+j+Z5M2gDa1rk9romx9XRT8oIwKT0EwwF+/BdW90aBmh7rcdywnHwkSg7PpfoTT4P3oULaqQr3/0oQWTT6urT9DzEugjGpplVDjB0xaMczlXCSni3gzFLhegjPH4aWcQf8JjYJRTJwBI0C6LH8zuKVJD5u26V/9yt9TJKVjvZURshFbTUbBpq0PJw+HEb34PwC4Wjrhw5X9m73BTZMfPk42COEhdRSm8wPNtQ+JxZlwi/dloL1urPZseE4yh41au9GUQasnSk2seQkHDy9eqQj6JdCBXn5GIGzWAyYIxDcZA8Cdp/K/OQ2VjA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; dkim=pass (2048-bit key; unprotected) header.d=siemens.com header.i=@siemens.com header.a=rsa-sha256 header.s=selector2 header.b=hw76khZT; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c20f::7; helo=osppr02cu001.outbound.protection.outlook.com; envelope-from=alexander.sverdlin@siemens.com; receiver=lists.ozlabs.org) smtp.mailfrom=siemens.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=siemens.com header.i=@siemens.com header.a=rsa-sha256 header.s=selector2 header.b=hw76khZT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=siemens.com (client-ip=2a01:111:f403:c20f::7; helo=osppr02cu001.outbound.protection.outlook.com; envelope-from=alexander.sverdlin@siemens.com; receiver=lists.ozlabs.org)
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20f::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dxc4t4tkdz2xS5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jan 2026 21:00:29 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LJ8YotOgQACPF7G77luektITggM9YCDzxN62OriXDBf0Yro6f9eDGfcCpCgI/3EGPi9ldc5m9LSuxFmR4vO2gm+B50b/MDQddhFf4sGEzElaXBveuixtfCVTQmnhLLw5R0rVyb3sJknS0doq7XlMJgCoCumKRNA83d693mvOprnLqAjSDjv6LSB5RY0wwSNG4PsKqkIA6P7DELVfkN+4EDscmOieHl2iwB3gFvrqK72oG81gzt8LsCSmeiZJn/4Nml8OxwGE8wzhrsPA+j2BHhtU+s1LpwfxkmMJLrWeA9VISOkWGK53yeTzCvOa2rwYbzCYqPRlE0vi/JrdxLQxqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IU3ESBuLndzmbOURXoJ6rASIjZzsZsPHdAkIonluM+8=;
 b=NQp7MWubbY99GBYbhSYhoh40apc1TsrIdN1GrpA7H/XCFFYPE589RL8sXzVSi1W0cv9x3mVsmrSSB5vHxh7w4QrMupX2bG4YQTDqlx+p3+NBtpmPllBUrmpc0wl5vi/IqmvTjzu7JXSidfe8haG+oJ4aSWo1eTornC7aIxLTUaDXMv3D4YjFIY2VPj9Bf3wy5L9QdULmrnMYLv1c/JGFLZ9L3JgBL8PkC73IiiPlpD/TZj5c+CrVZ9/U8uAq5KkAmizvfyI7TpWGry9NfELfuRXB9HseycEe9g49DGoKw1wGLWbf8Vk9crL/6H0lYI4SafjANFHQ3T7Up0xPuQwd7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IU3ESBuLndzmbOURXoJ6rASIjZzsZsPHdAkIonluM+8=;
 b=hw76khZTfjKrMwK2yDnm5Wwb7isk8u5x3U86eN1EA0jURbpO2kr0Lmh9qyLdjhdJtVw/Qi28VhVFjUfhKuK8JDqOk6a197pdVKFKUQstgc6NXii7UZX1C9KNlY1GIjuFvEE04DvBFbZAEeXFCgK7oWi1HWIdL2aGUfahk0syokPQQ9aNITEtWAc9JSzu0wOcOSpa7Akvw5LTHFrKeyMmLo2VNNmTCw2hYSMz632Wb+hxN5/ZuDL7B3u5hrGye21PhA3wsHAMA9kM60+bkBQgfw18mTvv5iVq41hucjNQgI/Kjv9GfKZ6LxzK7raV6LLdjI0kpdRwkMH/PyQP+uPRjg==
Received: from DU0PR10MB6876.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:465::11)
 by AM9PR10MB3992.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1ce::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Thu, 22 Jan
 2026 10:00:05 +0000
Received: from DU0PR10MB6876.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::dc98:3108:537e:4b14]) by DU0PR10MB6876.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::dc98:3108:537e:4b14%3]) with mapi id 15.20.9542.009; Thu, 22 Jan 2026
 10:00:05 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "thomas.weissschuh@linutronix.de" <thomas.weissschuh@linutronix.de>
CC: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"chleroy@kernel.org" <chleroy@kernel.org>
Subject: Re: [PATCH] powerpc/vdso: Provide clock_getres_time64()
Thread-Topic: [PATCH] powerpc/vdso: Provide clock_getres_time64()
Thread-Index: AQHci4L1Nn+g7BoVqk+B6EKSr0cEh7Vd8h4AgAACnYA=
Date: Thu, 22 Jan 2026 10:00:05 +0000
Message-ID: <9459f1133f7e110ef882401f4bc1b9c1cd517599.camel@siemens.com>
References: <20260114-vdso-powerpc-align-v1-1-acf09373d568@linutronix.de>
	 <f45316f65a46da638b3c6aa69effd8980e6677b9.camel@siemens.com>
	 <20260122104257-3124dc96-5916-4d25-bbce-9b868b30ee18@linutronix.de>
In-Reply-To:
 <20260122104257-3124dc96-5916-4d25-bbce-9b868b30ee18@linutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.54.3 (3.54.3-2.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR10MB6876:EE_|AM9PR10MB3992:EE_
x-ms-office365-filtering-correlation-id: e06b7704-21c9-4de5-e82e-08de599d04b2
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?SGhiTUc4ZjdIWUptTG9IQ3MvL1doZTBXOTNILzJ1KzBjRm1RQzBlWHhOSStI?=
 =?utf-8?B?M0N4SE02WElCSzVNdVMyZDdEYVY1eVl0SnZFYm1FSzZ3bFpDVzBxajI0eDU5?=
 =?utf-8?B?MWtScENCZzNkQnlKK1VCOWt6dDluSVVOQ2xxN2MwT0x3dFp4MmhXenUreHkz?=
 =?utf-8?B?cFkrbld0cUZFK0kzSnpzVzRaY2VzeG9ScnlLeUo4V0tIa2duS1V0Z3hzMDQ5?=
 =?utf-8?B?V1VDdHMyUVZxVVpJaWV2UTNsN3VKVTRNM1JZVG9TUUg3Wmw5T1k4a2RhU0hV?=
 =?utf-8?B?bmVrS1hKamZTem1OeE1Bd1VBKzNzQ0dmaGZlOVczUnlOSXdBZzVsYzhoeUhz?=
 =?utf-8?B?ejNKcXM4Z3dlbklXd0dFM3NKSkJIMy9seDAwM0svUDAxaEQweWZ0OS9vTkp4?=
 =?utf-8?B?aUs3YzE4bGt0RDRWUTNwalpJNXhaTU91bUJwUkI0cnQ1b0lJL1JpSmVtRG9I?=
 =?utf-8?B?cEhWaVpjVGdyMXROc3krQzNuSHhQVXpLc0xRR01relRud3RBVHdnd1ZBZDh0?=
 =?utf-8?B?dkt5cjZ2UXBGWlpaNUQrL1QzcDgxT3dWUEFyYmNTMWttaWRKc0taZDRhTmFS?=
 =?utf-8?B?K3VrenY4YXFXN3F3UmJ3L3pmaGp6R0gya1ZDWUFFMEN6L0VnZ3JyKy8zZ0U1?=
 =?utf-8?B?ZGlnNC9CYTV3U1JZZlU4S1JxNVZWcldCQysvZXdqRnRrOXdkbmJ5aU94bzFY?=
 =?utf-8?B?QlcyNVZMYWxldFJLNzk5bTc4ZmphVVR5RWlRa2VsL0pxNW1HWTFaS0lQZkJH?=
 =?utf-8?B?ampPVHd5eDRzSm0yOTh0M1NnakQ1Z1JVSGR4bnhXRjJucHFBN2pCWE5TY3oz?=
 =?utf-8?B?R21ibWZsS3BBeU9WYXBldnJSR3VON2FoeW9RL3MvVDk5VW9sb3E2TlUyT0th?=
 =?utf-8?B?RmpQdURJQjNtcnh5NERhNmljZlh5MCtKa0Z4cTJ6VEdLSWZFcDRTd2h3L1c4?=
 =?utf-8?B?MnZsMzY0dk02Y0R5enRnSnNkYlN5VVZoZGJnNXE2VGE3Qi9WODdtVWkxSDdM?=
 =?utf-8?B?aXJhdzRwVklpRGN5OXhrWmpzdjNKeW1WYnZuanpxV0pSdVc4VFgvVmpMVUpW?=
 =?utf-8?B?UVpMR1BOSEVENmNDaExIMWQ4YS9XdSsvT0d5OThxZ3VnQ0dZekliQTFnZGFM?=
 =?utf-8?B?MmhZZUxyd08yMDdieG9Ea1NjUnBuZkpVSmlEY0dYYTNTWGJvSlhRSko3WmNK?=
 =?utf-8?B?aXFKNWxocGFQZERESlNQbWZaaGFaWXNJZW1HOWZHL0EyZ2RmcGhUZUVXMURo?=
 =?utf-8?B?SjZoMi92MWlOVFk0cE15Y0ZhODBocWJrVkNwU1VhV1lHZldSaWZJSUZyWFR5?=
 =?utf-8?B?UEtNcVNkN25tWjY1MmpoQmRyc01XY1JybVBTZVp1Z0o2SmhwWWE4SzcxQVR2?=
 =?utf-8?B?U1FYQm5wUFpTdDRFSktrV0l1dXg0c2puc21xRUovLzJTNm91MmNzbEo3TlpJ?=
 =?utf-8?B?SEc1UXUxekZGUFhkd2ovSm93TjVNMjVFcDRkeGtPR0R5Rm55SWw2TGJSck5t?=
 =?utf-8?B?Z0dqR0w2SjlCQ0lQR1N6eCtvTlN2VDFramNjMzh0Ly8xTEdjY3VIVGVVeUpi?=
 =?utf-8?B?WldCcEdPL0NyYk9BS0RuUU1FVVFGbnJ6UWZINVBnVVorc1F2eFNQcExGckh5?=
 =?utf-8?B?U1h2eTZ0cFVUYlpPOThJVU5MZjBWQWhoWDBUeUJ5L29GRmJNMGZDS3g0SFQv?=
 =?utf-8?B?OHJCZ0ErS0RkMllqeU5ZdXpLY1BZaVd0UGhZSTg0U3pIc3Y0SWZWSGpBdUJH?=
 =?utf-8?B?ZlE3WVFoSlA2bk85WG81ckFlay9PV255R21iSmdvc1FiZXZ1MU9hekNjcS9V?=
 =?utf-8?B?VmQ3K0dKUml5c0Y2Yy9HV1JvS2M4WlM3THoyeVM0QjlMaXlteWpwbHJNVnVU?=
 =?utf-8?B?emt1TUJIcWN5NTEzRWFHaGVFekhuVitqYTBJeE9kL0dZbjNyRnpEYTB6UE8y?=
 =?utf-8?B?ODRhYWd4K3hPblg2VXMySitlb3h3bi9xdXFKa01OMGtjeXd1WWY2SWdPbjlq?=
 =?utf-8?B?WFlBU3NxOUgrQ2NTNkd2ZGg0UHJhK3hnck0xcUNoVnkzZXJ6VzRDYnhTbGxi?=
 =?utf-8?B?M2t4UDhFTkhHcE9zWEdTQTM0L1NUelVBMEhwekZpMFp0ZndiQit5bkRpdXp1?=
 =?utf-8?Q?/Af/SHOLXhl3lzGjlKFE5NE9z?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR10MB6876.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?V2NnaXp0cUJicGxXQ0dNM0NwU3hsQWo0Y3lCL0pnR0NNRHZyNElmbEdxZmJW?=
 =?utf-8?B?Z1ZGdFNhUDNJaWY3SlFEczI1ZlRDaVpPdzh3NVE3UCtpd09RcldxbERiTHBs?=
 =?utf-8?B?ZmwrR2ptNXJ3aFg5TGdiYzFMMGdsK2R0WDV1eDVFWDdMQWQ5TlVpRno1S3lB?=
 =?utf-8?B?c2xkanlrUmdKbUV6N0RFQlliclczeWVPaVE5QnhGMmtLMDA4akpaeUI4RUNU?=
 =?utf-8?B?WmoxWlkvRUFvMEFvWGJ5OG41TDNUZng2eHZsbG94NTRmSXptcU1Lb0x1YWI1?=
 =?utf-8?B?N3diaVlzN1NaL3ZlelZYL29ReUV1Q01NL2x6RlVWdklCN3J3RzRmbFNmTTRP?=
 =?utf-8?B?Y04va2Job2REbStkQUw2YkxRTzhuS3IwRFVXdm9zOTk2TzYxMkFlU3VNRWQy?=
 =?utf-8?B?Rms3VmltSE9QMGVsdVl0eVBjSitsbEk1MkRkamlxbjNNR0xlcFdDNDdVdzRn?=
 =?utf-8?B?SFowYVNFZS9tTElDbG5HQzY1eG9iSzJEMTZuMmFadTFzbENjS29DRUpVNWxH?=
 =?utf-8?B?a3FKd3hxRnZyQ2ticUNyby9lUTg3amtoNlluZWFZckpRZTBBenpzU2ZPMmdz?=
 =?utf-8?B?NVVvcWpDOVhoanhiNDk0bS9YKzM1VEtqc0JDQ3Y0ZEN2MmFCRVhzL2VwT1pN?=
 =?utf-8?B?S05YYlpSZXVHOG9aK2llUXVicTQrS2pjdU13K3FVeStwVjZZdTcwcmsvU3JK?=
 =?utf-8?B?VnhBc2Jha0YwVmkvVnNSUkl2WjRuU0dpUGVZaFpFMHVoK3MyZXJRUnIyVGhN?=
 =?utf-8?B?bU9qcGFXY2pLWGUvOFRndDBXZ2xNcWM5NkJJYmE4RlpaTldDalR5Ym1yNnpM?=
 =?utf-8?B?Tm5EbS9Pa0p4VEhnUnlEcFhKSTZLQmxTcTR3WW9ia2Rpay95S2dHVFE3VDNE?=
 =?utf-8?B?V3B4T1pEWU9Wc3JpTE45QlhOdlFNSHZBaGFhUCtMVWhsNExOUFdZS2lDQ29L?=
 =?utf-8?B?MHo2aWMzUXFpYUxWS0toTkY3eFkva2VvQjF5R0picFdXREF0MnBCU3lVMzIw?=
 =?utf-8?B?aUlyRDJBTk9yTTkvTzJwZVcrbzI2SzJEbWUvQUEvTzYwM0hDUmppbHpBaXQx?=
 =?utf-8?B?cGZ3WVBuNCsrM09xZXJuMWZNODNlaG1aRmdxZjhLRDM0ZFFjK2dDUE9mUUt3?=
 =?utf-8?B?YzlPYjNaTWVuY3pwTE9wWTVkb0s1UkRISWxrWWtFZnB6NDNEd1dQMkkzVDhD?=
 =?utf-8?B?RlhZTG93TUg1MTNENnJ0T3liVTF4eEZMbnJVWkdwdkhCTTd2TE9xbFA5ZWtC?=
 =?utf-8?B?ckMycmpRUEtmK1llSGtWeTE1M2ZYSlpmWXBXU3Z2RnB3WXJRdVptbVhpeStW?=
 =?utf-8?B?Ynl1RzZhajQ1MlErNkhCc3pSOW90WGJiVDBXSVdVVGxVQzRvczdvMGZreXVs?=
 =?utf-8?B?MGtEaC81VDhRckp5amFUUjRFOEpZRkxONjZIR09UbEliMjVOSEkwYUdqZ2xE?=
 =?utf-8?B?Yk1CcjRNb2dIWnMxckJJelJRbDFUSEI5TXZsbjE3c1JZanBoNzM5azNLclJm?=
 =?utf-8?B?WEh1USsvc1ZUejhuLzRLb1NDb3d1UUdSdmpNeSt4RHM4c0R1Yk5RcGZ5YVNx?=
 =?utf-8?B?ZGlmUGpxbW04MjNIZDYvdlF5WWhHS0VUaFBxQkFkU0pkWlVSN0VUVTRGTDR5?=
 =?utf-8?B?L1djbWplcGIwZHk3SmZaNWhOMDZJSm9lYkxyb2YvYzlxejZtNXMybWFvdzBr?=
 =?utf-8?B?UW84ZTJzajFCcjdVN0R4cFdHMXZ5QlVtREVwTHhXWCsvKytUV3NwQzE1RWdm?=
 =?utf-8?B?YWc1TU9SQnZ6dDZibVE1MjJGVnh3K1h5Q3pOZmNRWS9RL3JkS2U2Q0ZhL0Q2?=
 =?utf-8?B?NVFCZ0VrUnJFUFdNVFhMVlFGVkRIWTMzaVByNGhqZWN5YXJpS3ZOVkQ3V2xB?=
 =?utf-8?B?RGdRV2FMQWY1Yzh3K1JlQTNsMzVuL0hZQ1FMY1VEanhNeXhJVnV5Ykc4emRo?=
 =?utf-8?B?bVh5ajhjaElUWGlyWHdERUFoRUxjSnVsdEdVa3lVNnVadGZqTmUreFhJSDdo?=
 =?utf-8?B?V3JkZ2dTTklnODV6d0RsTXYxcHlEU1ZPMGJNSHB5WkNBbUc2MW0rV0RMdFRT?=
 =?utf-8?B?TEFPVTBKNnhXQnNSa0kzQ2dqdWpQTnV6L2RjY2s1TlJscjArelhxc1JqYkZY?=
 =?utf-8?B?bHNJS1NtZE0zQTNJQmF4YnhUeGttditnd3ZqUkl0UTJUbE4rcjhVRW0zaC9y?=
 =?utf-8?B?Vm1oSHVoVHJlUUpoRXhnL0tQWjhTVVAwaW1ETm9UbzA5WEs1NCtQZUZYclpZ?=
 =?utf-8?B?V09ma21CcFJxMHA4VDFxeFJ5U05rcDF4TG5MTEt2dHJmZFcwdVNaY2t5Vy9T?=
 =?utf-8?B?MDdiN3VNaUVXSnlZOFdnNTU0bGM1dEJMMzUxa3Rkc0lwVW1wWnY4b3EzV1BY?=
 =?utf-8?Q?bq9GBSY0QOltLAto=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BD66A8FFB1B9B64D933D3FFE28922A41@EURPRD10.PROD.OUTLOOK.COM>
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
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR10MB6876.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e06b7704-21c9-4de5-e82e-08de599d04b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2026 10:00:05.6166
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h4Qpic9ORHtEzDERay7+TdywE/+sg4gQGD5305Ajx54B3bz6f4ccjXkwzT2szYQ85rPl7H9WiMfWDdEpVe1KMFiAXDtBnB1IOsamWu5voa0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR10MB3992
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.11 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[siemens.com,reject];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[siemens.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16137-lists,linuxppc-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:thomas.weissschuh@linutronix.de,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:chleroy@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[alexander.sverdlin@siemens.com,linuxppc-dev@lists.ozlabs.org];
	TO_DN_EQ_ADDR_ALL(0.00)[];
	DKIM_TRACE(0.00)[siemens.com:+];
	MIME_TRACE(0.00)[0:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexander.sverdlin@siemens.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,linutronix.de:email,siemens.com:dkim,siemens.com:url,siemens.com:mid]
X-Rspamd-Queue-Id: 3E4C964EE2
X-Rspamd-Action: no action

VGhhbmtzIGZvciB0aGUgcXVpY2sgcmVwbHksIFRob21hcyENCg0KT24gVGh1LCAyMDI2LTAxLTIy
IGF0IDEwOjUwICswMTAwLCBUaG9tYXMgV2Vpw59zY2h1aCB3cm90ZToNCj4gPiA+IEZvciBjb25z
aXN0ZW5jeSB3aXRoIF9fdmRzb19jbG9ja19nZXR0aW1lNjQoKSB0aGVyZSBzaG91bGQgYWxzbyBi
ZSBhDQo+ID4gPiA2NC1iaXQgdmFyaWFudCBvZiBjbG9ja19nZXRyZXMoKS4gVGhpcyB3aWxsIGFs
bG93IHRoZSBleHRlbnNpb24gb2YNCj4gPiA+IENPTkZJR19DT01QQVRfMzJCSVRfVElNRSB0byB0
aGUgdkRTTyBhbmQgZmluYWxseSB0aGUgcmVtb3ZhbCBvZiAzMi1iaXQNCj4gPiA+IHRpbWUgdHlw
ZXMgZnJvbSB0aGUga2VybmVsIGFuZCBVQVBJLg0KPiA+ID4gDQo+ID4gPiBTaWduZWQtb2ZmLWJ5
OiBUaG9tYXMgV2Vpw59zY2h1aCA8dGhvbWFzLndlaXNzc2NodWhAbGludXRyb25peC5kZT4NCj4g
PiANCj4gPiBJJ3ZlIGJpc2VjdGVkIHRoaXMgcGF0Y2ggdG8gY2F1c2UgdGhlIGZvbGxvd2luZyBi
dWlsZCBmYWlsdXJlIG9uIG15IHNpZGU6DQo+ID4gDQo+ID4gwqDCoCBMRFPCoMKgwqDCoCBhcmNo
L3Bvd2VycGMva2VybmVsL3Zkc28vdmRzbzMyLmxkcw0KPiA+IMKgwqAgVkRTTzMyQSBhcmNoL3Bv
d2VycGMva2VybmVsL3Zkc28vc2lndHJhbXAzMi0zMi5vDQo+ID4gwqDCoCBWRFNPMzJBIGFyY2gv
cG93ZXJwYy9rZXJuZWwvdmRzby9nZXR0aW1lb2ZkYXktMzIubw0KPiA+IMKgwqAgVkRTTzMyQSBh
cmNoL3Bvd2VycGMva2VybmVsL3Zkc28vZGF0YXBhZ2UtMzIubw0KPiA+IMKgwqAgVkRTTzMyQSBh
cmNoL3Bvd2VycGMva2VybmVsL3Zkc28vY2FjaGVmbHVzaC0zMi5vDQo+ID4gwqDCoCBWRFNPMzJB
IGFyY2gvcG93ZXJwYy9rZXJuZWwvdmRzby9ub3RlLTMyLm8NCj4gPiDCoMKgIFZEU08zMkEgYXJj
aC9wb3dlcnBjL2tlcm5lbC92ZHNvL2dldGNwdS0zMi5vDQo+ID4gwqDCoCBWRFNPMzJBIGFyY2gv
cG93ZXJwYy9rZXJuZWwvdmRzby9nZXRyYW5kb20tMzIubw0KPiA+IMKgwqAgVkRTTzMyQSBhcmNo
L3Bvd2VycGMva2VybmVsL3Zkc28vdmdldHJhbmRvbS1jaGFjaGEtMzIubw0KPiA+IMKgwqAgVkRT
TzMyQyBhcmNoL3Bvd2VycGMva2VybmVsL3Zkc28vdmdldHRpbWVvZmRheS0zMi5vDQo+ID4gwqDC
oCBWRFNPMzJDIGFyY2gvcG93ZXJwYy9rZXJuZWwvdmRzby92Z2V0cmFuZG9tLTMyLm8NCj4gPiDC
oMKgIFZEU08zMkEgYXJjaC9wb3dlcnBjL2tlcm5lbC92ZHNvL2NydHNhdnJlcy0zMi5vDQo+ID4g
wqDCoCBWRFNPMzJMIGFyY2gvcG93ZXJwYy9rZXJuZWwvdmRzby92ZHNvMzIuc28uZGJnDQo+ID4g
YXJjaC9wb3dlcnBjL2tlcm5lbC92ZHNvL3Zkc28zMi5zby5kYmc6IGR5bmFtaWMgcmVsb2NhdGlv
bnMgYXJlIG5vdCBzdXBwb3J0ZWQNCj4gPiBtYWtlWzJdOiAqKiogW2FyY2gvcG93ZXJwYy9rZXJu
ZWwvdmRzby9NYWtlZmlsZTo3OTogYXJjaC9wb3dlcnBjL2tlcm5lbC92ZHNvL3Zkc28zMi5zby5k
YmddIEVycm9yIDENCj4gPiBtYWtlWzFdOiAqKiogW2FyY2gvcG93ZXJwYy9NYWtlZmlsZTozODg6
IHZkc29fcHJlcGFyZV0gRXJyb3IgMg0KPiANCj4gVGhhbmtzIGZvciB0aGUgcmVwb3J0IQ0KPiAN
Cj4gPiBEb2VzIGl0IHJpbmcgYW55IGJlbGxzPyBXaGF0IGNvdWxkIEkgdHJ5L3Rlc3Q/DQo+IA0K
PiBOb3QgaW1tZWRpYXRlbHksIGJ1dCBJJ2xsIGxvb2sgaW50byBpdC4NCj4gDQo+ID4gSSdtIHVz
aW5nIGdjYy0xNS4yLjAgYW5kIGJpbnV0aWxzIDIuNDUuMS4NCj4gDQo+IElzIHRoaXMgYSB0b29s
Y2hhaW4gZnJvbSBodHRwczovL2Nkbi5rZXJuZWwub3JnL3B1Yi90b29scy9jcm9zc3Rvb2wvwqA/
DQoNCkl0J3MgYWN0dWFsbHkgeW9jdG8gbWFzdGVyIHRvb2xjaGFpbiBhcyBvZiA2MTQ1ODM3MTQ3
ZGMyYTZkNTRhMjIxZjljZDdmZTkwZDY4OTVmZjkwIChvcGVuZW1iZWRkZWQtY29yZSkuDQoNCj4g
Q291bGQgeW91IGFsc28gc2hhcmUgeW91ciBjb25maWd1cmF0aW9uPw0KDQpEbyB5b3UgbWVhbiBr
ZXJuZWwgY29uZmlnPyBJJ2xsIHNlbmQgaXQgcHJpdmF0ZWx5IGluIGEgbWludXRlIG5vdCB0byBv
dmVybG9hZCB0aGUgbGlzdHMuLi4NCg0KLS0gDQpBbGV4YW5kZXIgU3ZlcmRsaW4NClNpZW1lbnMg
QUcNCnd3dy5zaWVtZW5zLmNvbQ0K

