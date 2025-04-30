Return-Path: <linuxppc-dev+bounces-8185-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCE9AA4D34
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Apr 2025 15:18:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Znd6k1m6Rz2yrX;
	Wed, 30 Apr 2025 23:18:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c201::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746019118;
	cv=pass; b=QksGVniK3ttMaAOgU/zcLy/u8+DUyvSUYuomqfGzeHssDiswmnxTUYRysm6XGXNhmnNQApYXJLiuj+iHd0tS4BNrCFpekJEQkbdEITcpP9ubUEbLKUivv4Sqh1Z0aJ7eAtK+48fNBQfepf+ipnGa9sTj/tE2R2q+x+gmAmn7HJWecTr8YdvGxu6drEB3XQVWE2A3oX0pdnInZ30/77yoOWvapVyXWmyYAE1CIg7UbctcdeE6cnFki/CbAo60G5CgnagDljz3ZzybMSevTKHsssYj/V+l5v9RqIIVkPxmAYQSiiKr7f+608opRqeK1ruhNmFlLlCam8ogSiZ51oFDjA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746019118; c=relaxed/relaxed;
	bh=r3Kdfo7KNDhulKC3Bdqn1ijej8jgqm1XDG2IEtKMPKY=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FM6mrTSkl0G3IiKyChA29H7TVYo9YrapCEL1ro5rydth8E/e96eHFBdDSV9qKFNCBdkp15SM8Q1JRkciBCk2riFVhMXHw+XtOhkwdp9l2TBOTmHOl3xrnr/13amWlASlYOUcec2Y5EeUwSBt0mxga9IQD/2qlEbt4P0Fax3QPNWLnJqvRfUAo5h1FZkkTDn1/pvIoHOHkLm9XJLbO8ji3jMf5Ur1Fdx6LnXinRXQn58bABr7p5KzOa+c9yo84XdpPZ2BXFIl7LzrUOyOcP8VxFo2b1j9MrZtWwaVeuRnmy6V7lFMvnfdeT7E2k/iMR7E9v2/RfC9kHCkilGcA3TfQg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=hitachienergy.com; dkim=pass (2048-bit key; unprotected) header.d=hitachienergy.com header.i=@hitachienergy.com header.a=rsa-sha256 header.s=selector1 header.b=Fn1sWdWA; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c201::5; helo=as8pr03cu001.outbound.protection.outlook.com; envelope-from=tomas.alvarez-vanoli@hitachienergy.com; receiver=lists.ozlabs.org) smtp.mailfrom=hitachienergy.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=hitachienergy.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hitachienergy.com header.i=@hitachienergy.com header.a=rsa-sha256 header.s=selector1 header.b=Fn1sWdWA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=hitachienergy.com (client-ip=2a01:111:f403:c201::5; helo=as8pr03cu001.outbound.protection.outlook.com; envelope-from=tomas.alvarez-vanoli@hitachienergy.com; receiver=lists.ozlabs.org)
Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazlp170120005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c201::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Znd6h4vD7z2yVV
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Apr 2025 23:18:36 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HAlIfG99bNdcfomU16G3h4Xp5hD17lRd1XbagfLM5T5ConGBSORsNEUT6xlbbSo3fAM5wuwzRDLaBVZ2logINmQumE1GOGVMVD3yEl0HhIiNyfuCrEXtuR1R/cg0OnhHqBSiIJO0C0Ugtvay3oja7SBteMH3vZqpzt8j0U82GkWmcJrVL0GimlwVQmAr5f5BRlGWPAtPDGrI8mzgkD7w81Bx9bmHEVFXrSuVMpA5ilHBWSqLbFJAPeSW9mWu9DkknM34uE5UZfHBei8RqMv7w1rzhimG0zL50tZTiDkNm7e8ZgLrSOFDk58JZt6WYAuS7aMpUGuZ1bigWbxK8VoLpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r3Kdfo7KNDhulKC3Bdqn1ijej8jgqm1XDG2IEtKMPKY=;
 b=ttpJWqrjKsKsN70Zhm9vz6fWNMG/nQkXtXYGIM4SK1tVQtfvmy1gwgN3FjF3A4OAIOSLxPOICbSmlM/Nu5jgNoc0h0iXPwKjXeZVHu9TvDhOQ4n9F1NWByF2KVFlLvCgSXs1J+vgqLAFllVWuzbv/3Angu7wfYvzOjxIBoL+dqHorJ9YlQUEJvaQfQ7PlJpePLUEE+1YAFKYkFrDxMtemAM+9/MegEDD+vD/wiQQ4y8Y5TR+yuJdN9Odmm5+7C6PeH+Ri4pI3ncz7K8Cn5dZKH5Ty1Uol8yd9SX9IlKQ/krthxwGfA6jM3OKuyL45I1bbEen+340EC243PkKA47alQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hitachienergy.com; dmarc=pass action=none
 header.from=hitachienergy.com; dkim=pass header.d=hitachienergy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hitachienergy.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r3Kdfo7KNDhulKC3Bdqn1ijej8jgqm1XDG2IEtKMPKY=;
 b=Fn1sWdWAL2tYOAWbcsFOjyCI8xONfo+7vaK4yXUJxpay1kVIsHqzdC1KETY5gdu5wYUvMeVYBuTcBYjh/YYf/kz6RaC3t2/9MY2+96ambApMYxRl4x6leSpHH6N2LLtJ8SLEDORxw/FBG6okc9t62caIT2JOo75a6K5nWnrkHibahPw23Y5Cl6K6Is8ckOhAaNbS3CqM039VD4XtW+QiK+Me210092YTe9h8ausbnF0GGNBAHFOox1J4Z67ShUl1Kb8QO9Qn8vpJyp0i0cWH2xS6aJ0iFc/1cquJxcLOZogkMHudSzhSRYcV2b8G/tS5C8dkSWybhQPbGy+HRFvf4Q==
Received: from DB9PR06MB7849.eurprd06.prod.outlook.com (2603:10a6:10:291::22)
 by VI2PR06MB9214.eurprd06.prod.outlook.com (2603:10a6:800:22b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Wed, 30 Apr
 2025 13:18:12 +0000
Received: from DB9PR06MB7849.eurprd06.prod.outlook.com
 ([fe80::b9c2:ace6:6179:45d]) by DB9PR06MB7849.eurprd06.prod.outlook.com
 ([fe80::b9c2:ace6:6179:45d%3]) with mapi id 15.20.8699.012; Wed, 30 Apr 2025
 13:18:11 +0000
From: Tomas Alvarez Vanoli <tomas.alvarez-vanoli@hitachienergy.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: RE: segmentation fault when stepping multi-threaded application
Thread-Topic: segmentation fault when stepping multi-threaded application
Thread-Index: Adu4Ll9wBWFRSggERdine9fbQKY53ABoDtqAAAC267A=
Date: Wed, 30 Apr 2025 13:18:11 +0000
Message-ID:
 <DB9PR06MB78494431B8D974B1BF69A077C2832@DB9PR06MB7849.eurprd06.prod.outlook.com>
References:
 <DB9PR06MB7849819F8C6A43108E66C610C2812@DB9PR06MB7849.eurprd06.prod.outlook.com>
 <d8911b8a-94a4-4ede-8e58-8de3afeccf3f@csgroup.eu>
In-Reply-To: <d8911b8a-94a4-4ede-8e58-8de3afeccf3f@csgroup.eu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-processedbytemplafy: true
x-templafyemailsigvstoversion: 9.21.0.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=hitachienergy.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR06MB7849:EE_|VI2PR06MB9214:EE_
x-ms-office365-filtering-correlation-id: 2c8c9492-870b-417d-1978-08dd87e9752d
x-he-o365-outbound: HEO365Out
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|13003099007|7053199007|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZUEyREN6dTFaVGdCRFpnU2ZEZUtlN01NV0J1eVZjSm90UDNsemx0NzkrYlpC?=
 =?utf-8?B?UnI5cVN2bTFQQUgzcTV4cTcxdUdkVVJ6TGpCNHpwSVhBWWJzbTE4RVRPdkxt?=
 =?utf-8?B?NzAvblFZUW1HMjJwNi9VVjRsazdMVTJQVGVkbjEwSkUyR3lMZFZmMGh4ZEZx?=
 =?utf-8?B?cFMwbW1oTXV0UHBDTTNCaHFTelBZN0xOc1JmY0wrQkVMR0NiVmFXK1ZPdm5X?=
 =?utf-8?B?b09nK1pXU2ZuSmV1QWNqaVpDcVlyOVB5U25LWFUrTHkxc0JGbkR3S0N0OEdH?=
 =?utf-8?B?em1QWXd1a3A3NmZ3dXF6TFR3RVJFSEpzNmJXRkl3M1pFcjJuSXlmbFNTbDQx?=
 =?utf-8?B?V2twQ2hTNFE2NEhzelYzb0JtdHhkOU1iNTJUK3VjbGpmOHdrOXlyQnlISVN1?=
 =?utf-8?B?c25zY09WRnlUbFRYdUErM05qKzBWcEI3clBaMHdXaXJ5TE4wb0NqZVBrVTF0?=
 =?utf-8?B?eGhEbG9VTHl5SW5GZEpMUVR0dGRDY25xYTcrS1FKaERDblJQQ2t3MXI1NVVp?=
 =?utf-8?B?NzBlK3l3MElhY2Zmcy9PMEdOdXhoalkxSDBiRFJZVFg0V3RkTjAzbVVWVWw4?=
 =?utf-8?B?aEJERmpSa3ZjMU1icWJTUGdkeHRMQnBoR1pqeUh6M2pVNTJ1Z2dRR1R1bmkw?=
 =?utf-8?B?eXI3M21DVC9tT3pOTHBwQkJNRi80L1BtYVJsRkh3QnRCdzlMeGNibHR1TGhW?=
 =?utf-8?B?VTJRZWtXVDJqQjFYYzF3SnlsQnFqemZyTW9MMlMzcUFwTUpWVmdEczh3bW5N?=
 =?utf-8?B?WENtWTlSV3JYSkM1RWlvdjRzSkthVElSbTE3a2J3MlBIUXk5SExjeVZXSXhZ?=
 =?utf-8?B?cmlWYTh6YURmMG5GUG54TER6V0NUYUdPL0lLVEVpcTU3WmhyQ1IzMWFzUG5y?=
 =?utf-8?B?R2p1L3c0N2kyVWJvd0E4RXljZG4xaU5sRlYvRzc0cW5PVUJLRkQxc1gzcDdU?=
 =?utf-8?B?N3ZISjZ6QTlnblE2TGUrZmllVXllR1doQWE2bUVWaUF0TU93YnJZNjJLeFdh?=
 =?utf-8?B?RVVTQmluU1VwVU1tN0RaRHE3Vkp3aDJRTlVocEV4bmN3UVNtdGdzQUhTc1Ir?=
 =?utf-8?B?MlNJWHBJS3lPeEtpaFM5RStXMnNWeFNRaHZzWUpUdWVJeWIralVvSUtaQk0x?=
 =?utf-8?B?enkxOGpLbFlEUmV4K3JOaFZjeVpVMmlpU01TY1kyMCswUlRQaUczdTArdnlM?=
 =?utf-8?B?RWdYVmEwOEtZamhZdlFWaEg4MzczU004Z1pUYWIwRUxYdzFWRHpQS2s2OEJO?=
 =?utf-8?B?KzNSSkY0RVBSbCtwYjRZMlprV3ZCU241MjRMOUdDaEdmSGoybmw0MlJJTlds?=
 =?utf-8?B?V3lGZUZZVG5pVXhvQ3hsNEhKd0FYamswVFU4S3JrN210MkhIV0pPaTdJVVBS?=
 =?utf-8?B?T25rdVIreEZHcXJST1REcWttMVQxVjdtK1A0WHI0dFZzejJnM3doM1dXcFYr?=
 =?utf-8?B?NVU4amxIRnNSL1VWTHoxa0w1RHVwZGJvanorc1RjQTBRdlBaNUdIUUJmRE55?=
 =?utf-8?B?SU5wWGpZbWdVZGY4b3hEeTRVL1dtcUdKSktIV2xadHhsaURKbWlMcnFwWUEy?=
 =?utf-8?B?ZmY2d2hNVDhHOHByMlpxZE0rM2JjbjF5UkpuZzE0dmtkK2p2UWRoVkw1RmVY?=
 =?utf-8?B?T1BkdHMvYzdKY01rUWZwZXZRdEJxQ3N1K1VaWjN5ZnVDL1NCK3lVNTdvMjJp?=
 =?utf-8?B?UGFNQ1lNeldOcWRoT05lMU1VRGxIU2RhK25IZFV1M0ZPOEJzSzVLeU1XR3Jh?=
 =?utf-8?B?NkZ3Q2FoU1o3aFljeGF0bmpMNHh4aysxUkI4bXZrME5lQnJmSFhZU1RhYk9p?=
 =?utf-8?B?YjNGa0R5YXpHaUJlN1RNOCtLaGwxdi9PN095S21rVFZhcVA2Slh2S2lsNVh1?=
 =?utf-8?B?OElONzR2VHdkSEd0MjF6MllGWFVIWlI0S24zYkxlOU14eVNTeitxREdMcDVG?=
 =?utf-8?B?dkd6Mk5ZdXF0UmlPQkQvRWlhQVFtSytnOCtadGZpMllhRW90dzhBSk1EMWVF?=
 =?utf-8?B?cHplb1N4QU9RPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR06MB7849.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(13003099007)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?L1RGZDFFTjhKUTc4K0UxbVkwM3I4bmliRWdhNVFnbzM3Y1BrYllvdWtyOVlv?=
 =?utf-8?B?NWtqM0FWSTdlTjNzNHlvdUFsNXpBdTBmQkpTU3ZRSUxpRE9ac0s1RWErais4?=
 =?utf-8?B?YThnbDU1eWNoZ1ZBOVNLa243c1lZdWJLRUZSLzAyK1IreGlOcHpxZDJ0UWh6?=
 =?utf-8?B?blFhaTdWWG9UV2k4WCtZQ3BISFlLZnR6Y1ZhdWgvc3hGNlFxa2F5NGJYN0dF?=
 =?utf-8?B?Uis0Y25vM1RGdkxqK0tkWTUyS1krVEFOUkNNTlNSUEVIeFBWbFQzRVQ0Y3lR?=
 =?utf-8?B?WUNhcEdYdk9yOXQxQm5aK3Y5YkJGMEhtUCtpdnRINlE5cEM0YVVGa1dpd2tz?=
 =?utf-8?B?Vm5qTGpOTDEzem9URWVNeTZMazZIL0xwMExQeGZJTTlXUlJGSGUxUVlzWlNS?=
 =?utf-8?B?WmhzVFFraEw2OUZwV3BLNit4UkM3clFsenRyaWs5WnFEc1dWSWd4RTB0anZS?=
 =?utf-8?B?UmcvSExDWXFmck5uNVo4QnF3WXE5QjVNSjNUaTFZVmx6NG9uYUZGNi90SGxn?=
 =?utf-8?B?UGlXQ2NGZW9kUXhmOTlwRXNRa1IrN0V2U2RPV2FWVHZxeURvQ0UwRXJXWGpF?=
 =?utf-8?B?d1R4aEE2WXdIOGVtdVozdDNFaEZpL0RHSk5CZTBQNVBzeVJhZVd5N0N4Zlc2?=
 =?utf-8?B?cmM5T3JlNWdFTnBSVFBYL05OQ2ZBUWkxVk5NZ0cxODk2cTZ6TitPZGlENlJV?=
 =?utf-8?B?d2xoNjFpUm9HNS93MTNTMjYzdXZHbXFqNDZQZW1VZm85QVZEN3I4ZUZJWnVi?=
 =?utf-8?B?My9RaXNUWURwOFU2SUlZUFZRNUNSU1lRMURJanBId01WVXk5QXl6Vks1aWE3?=
 =?utf-8?B?NGRzVnlWaEwzcWJmRlE3YTAwSVJ0TFhmdlhUSEcybitjendLbDFmci9jVjZM?=
 =?utf-8?B?QldqSjFZa0hVZkQvei9KRTRwR1VzazR5SUlGN1pPYVRXeVlvNUd2ZHBWV1ln?=
 =?utf-8?B?MG13Vld1MVJQY0RwZkhVWDl2bU1XV3hMVDVhcU5zMWtYMGxCUVhlemhvdlJY?=
 =?utf-8?B?c2xEZVpFdHNnREtZb3pqNVZQMHhOc0hEWGpZTmlNaTZZUytUdW1PR0dzOHlu?=
 =?utf-8?B?bU85SEVzODRyamw2RVhGTGZkazBwRGJtRnN3eExOZVZOMEdDZ1lkRkxtRjM2?=
 =?utf-8?B?UXloNEhyYTJGcXR0Q24yWTIrdmtZL0VOcE5VMENFTldzczZsenpTMC91WnRG?=
 =?utf-8?B?L25xM3B2WnFCVTdqMmhEMnI5SmpBcVFGMmtjd2hxcW91OUF5YlFKdVNNOWlC?=
 =?utf-8?B?TWFuR2M5TFltejFLU0J4Y1p0QmYvc2d2MGpleDFrQ0RyRGw3K2ZYK1RlY1px?=
 =?utf-8?B?QWE3d3NJNlVsNFZOaXhwVzdMWlpVaWxUNEVTSVlzU1N3RmU4bXVDSU41M3l1?=
 =?utf-8?B?TlJOYTd0cDAveEZyTGRKcFp3YWRHNHphUmswRktDb0FCWTY4cXVMVHhiR3Jr?=
 =?utf-8?B?cTdUdkpLdUFmRUtEai9vb090WDgrVXdiSjAxSFJrL2NzT1duU3cxZHFINE8z?=
 =?utf-8?B?TEZ6SHNRSmdOR0w0ckVXSWZSeGpnRW05Z1BacHQ1OUYwRGpKcnJKRVE2L3BU?=
 =?utf-8?B?Tk9FenNDbnNtaDVRU2IxcEVUNE9XOXhXZzk5RU80QXJwc05jYmticEx3N2VR?=
 =?utf-8?B?c2QzN1FMVG1PSWU1d200eWpWaFNnUWRFQUl4N1NnOHA3NVlLMCtLK01ja3Rz?=
 =?utf-8?B?VnNvOERKMmFwT1orZkZKdGN0K3VJbWN4cHdoTFpDTUNtK2ZNOW1UbE5WU0V3?=
 =?utf-8?B?aVBacGFzYk1ZRnMrTEpnd0RtbTN4ejVoZTJad1dsZ0ZyU2FnUWdlbFlWdkRm?=
 =?utf-8?B?WUEvU3lTRldDMSswNlBNNHpib3d3VDJtdWtWQTkxWjlCK2gzL1hlWURHTklJ?=
 =?utf-8?B?eTNUYTkxY0gxeVNLZmF1SEJEdnBXbVlVT2lhTUFKZFhLRmppdjhqR1dxWjRl?=
 =?utf-8?B?cUJQbWFsbTgyb3ArYTB3YVdHcGNnMXBYc0Z0Vmx0UnpoU2xnbGFRRUVMUThF?=
 =?utf-8?B?SkViNnpKU3RNbHNqM1NHQ1RGQmZ1NkcwMjArS3JSN290N2Vnd2F2L2J3UlFu?=
 =?utf-8?B?K2FUak1xRVg5S1MyQ21MYWFXeEJxQXhUTDBEM2JFMEs5bjNnbWZYOEczYUxR?=
 =?utf-8?B?L3dwdGZ2akc5TFRYNVZxY2hnQlIxWldtSC9wL3AxUXRHWjdkTmI3anN5WHpk?=
 =?utf-8?Q?GQ4mAw+wDVO1akq3UyYy4FE=3D?=
Content-Type: text/plain; charset="utf-8"
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
X-OriginatorOrg: hitachienergy.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR06MB7849.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c8c9492-870b-417d-1978-08dd87e9752d
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2025 13:18:11.9171
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7831e6d9-dc6c-4cd1-9ec6-1dc2b4133195
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GKpk/Z72eaHdqxnrhZM9RJUNOwZQ3Ag2aGIrpFutc5J0TQ4FWEkQoWR7+Mi/in7YdcMvM/cNJ4UDvU1LwrtUb9tcyDUkPN7RECJ9K3ZswcYFPCyMoQ3aj8Gvm0X/ohdM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR06MB9214
X-Spam-Status: No, score=-0.3 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

PiBBbSBJIG1pc3Npbmcgc29tZXRoaW5nID8NCg0KQXBvbG9naWVzIGZvciB0aGF0LCBJIG1hZGUg
YSBtaXN0YWtlLiBUaGUgYm9hcmQgaXMgYmFzZWQgb2ZmIFQxMDQwLCB3aXRoIGU1NTAwLg0KUHJl
dmlvdXMgcmVwb3J0IGFmZmVjdGVkIHR3byBvZiBvdXIgcHJvZHVjdHMsIHRoZSBvbmUgZnJvbSB0
aGUgcHJldmlvdXMgcmVwb3J0IGFuZCB0aGUgb25lIEkgYW0gcmVwb3J0aW5nIG5vdy4NCg0KU2lu
Y2UgSSB3cm90ZSB0aGUgZW1haWwgSSB3YXMgYWJsZSB0byBhbHNvIHJlcHJvZHVjZSBhIGNyYXNo
IHdoZW4gc3RlcHBpbmcgMyB0aW1lcyBhbmQgdGhlbiBjb250aW51aW5nLCBidXQgaW4gdGhhdCBj
YXNlIHRoZSBwcm9ibGVtYXRpYyBhZGRyZXNzIGFsd2F5cyBjb21lcyBmcm9tIHIyLg0KDQpUb21h
cyBBbHZhcmV6IFZhbm9saQ0KUiZEIEVtYmVkZGVkIFNvZnR3YXJlIERldmVsb3Blcg0KLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUu
bGVyb3lAY3Nncm91cC5ldT4gDQpTZW50OiBXZWRuZXNkYXksIDMwIEFwcmlsIDIwMjUgMTQ6NTIN
ClRvOiBUb21hcyBBbHZhcmV6IFZhbm9saSA8dG9tYXMuYWx2YXJlei12YW5vbGlAaGl0YWNoaWVu
ZXJneS5jb20+OyBsaW51eHBwYy1kZXZAbGlzdHMub3psYWJzLm9yZw0KU3ViamVjdDogUmU6IHNl
Z21lbnRhdGlvbiBmYXVsdCB3aGVuIHN0ZXBwaW5nIG11bHRpLXRocmVhZGVkIGFwcGxpY2F0aW9u
DQoNCltZb3UgZG9uJ3Qgb2Z0ZW4gZ2V0IGVtYWlsIGZyb20gY2hyaXN0b3BoZS5sZXJveUBjc2dy
b3VwLmV1LiBMZWFybiB3aHkgdGhpcyBpcyBpbXBvcnRhbnQgYXQgaHR0cHM6Ly9ha2EubXMvTGVh
cm5BYm91dFNlbmRlcklkZW50aWZpY2F0aW9uIF0NCg0KV2FybmluZw0KDQpUaGlzIGVtYWlsIGNv
bWVzIGZyb20gb3V0c2lkZSBvZiBIaXRhY2hpIEVuZXJneS4gTWFrZSBzdXJlIHlvdSB2ZXJpZnkg
dGhlIHNlbmRlciBiZWZvcmUgY2xpY2tpbmcgYW55IGxpbmtzIG9yIGRvd25sb2FkaW5nL29wZW5p
bmcgYXR0YWNobWVudHMuDQpJZiB0aGlzIGVtYWlsIGxvb2tzIHN1c3BpY2lvdXMsIHJlcG9ydCBp
dCBieSBjbGlja2luZyAnUmVwb3J0IFBoaXNoaW5nJyBidXR0b24gaW4gT3V0bG9vay4NClNlZSB0
aGUgU2VjdXJlV2F5IGdyb3VwIGluIFlhbW1lciBmb3IgbW9yZSBzZWN1cml0eSBpbmZvcm1hdGlv
bi4NCg0KTGUgMjgvMDQvMjAyNSDDoCAxMzoxNiwgVG9tYXMgQWx2YXJleiBWYW5vbGkgYSDDqWNy
aXQgOg0KPiBbVm91cyBuZSByZWNldmV6IHBhcyBzb3V2ZW50IGRlIGNvdXJyaWVycyBkZSANCj4g
dG9tYXMuYWx2YXJlei12YW5vbGlAaGl0YWNoaWVuZXJneS5jb20uIETDqWNvdXZyZXogcG91cnF1
b2kgY2VjaSBlc3QgDQo+IGltcG9ydGFudCDDoCBodHRwczovL2FrYS5tcy9MZWFybkFib3V0U2Vu
ZGVySWRlbnRpZmljYXRpb24gXQ0KPg0KPiBIZWxsbywgSSBhbSB3cml0aW5nIGJlY2F1c2UgSSBo
YXZlIGEgc2VnbWVudGF0aW9uIGZhdWx0IHdoZW4gcmVtb3RlLWRlYnVnZ2luZyBhIFBQQyAzMi1i
aXQgdGFyZ2V0IHdpdGggZ2Ric2VydmVyLg0KPiBUaGlzIGlzIHRoZSBzYW1lIHBsYXRmb3JtIGRl
c2NyaWJlZCBpbiANCj4gJ2h0dHBzOi8vZXVyMDQuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9v
ay5jb20vP3VybD1odHRwcyUzQSUyRiUyRmxvcg0KPiBlLmtlcm5lbC5vcmclMkZsaW51eHBwYy1k
ZXYlMkZkYzM4YWZlOS02Yjc4LWYzZjUtNjY2Yi05ODY5MzllNDBmYzYlNDBrDQo+IGV5bWlsZS5j
b20lMkYmZGF0YT0wNSU3QzAyJTdDdG9tYXMuYWx2YXJlei12YW5vbGklNDBoaXRhY2hpZW5lcmd5
LmNvbSUNCj4gN0NkNDhmZWZjNTUwYWI0MDc3YjI0NTA4ZGQ4N2U1YmUwMyU3Qzc4MzFlNmQ5ZGM2
YzRjZDE5ZWM2MWRjMmI0MTMzMTk1JQ0KPiA3QzAlN0MwJTdDNjM4ODE2MTQyOTk3MTQxMDkyJTdD
VW5rbm93biU3Q1RXRnBiR1pzYjNkOGV5SkZiWEIwZVUxaGNHa2lPDQo+IG5SeWRXVXNJbFlpT2lJ
d0xqQXVNREF3TUNJc0lsQWlPaUpYYVc0ek1pSXNJa0ZPSWpvaVRXRnBiQ0lzSWxkVUlqb3lmUSUN
Cj4gM0QlM0QlN0M2MDAwMCU3QyU3QyU3QyZzZGF0YT1JbmZJNVc4MG9lTFFNUGt4OXljOHpEZ1l2
R2RhelRVVVc1aHdQOCUyQg0KPiBvNlVNJTNEJnJlc2VydmVkPTAnLCBhbHRob3VnaCB0aGUgYnVn
IGRvZXMgbm90IHNlZW0gdG8gYmUgdGhlIHNhbWUgYW5kIA0KPiB0aGUgcG9zaXRpb24gb2YgdGhl
IHRocmVhZCBzdHJ1Y3QgZG9lcyBub3QgYWZmZWN0IGl0Lg0KPg0KPiBUaGUgc2VnbWVudGF0aW9u
IGZhdWx0IG1lc3NhZ2UgaXMgdGhlIGZvbGxvd2luZzoNCj4NCj4gdG9tY2xpWzEzNV06IFVzZXIg
YWNjZXNzIG9mIGtlcm5lbCBhZGRyZXNzIChkZmZiZGYxMCkgLSBleHBsb2l0IA0KPiBhdHRlbXB0
PyAodWlkOiAwKQ0KPg0KPg0KPiBnZGJzZXJ2ZXIgaXMgc29tZXRpbWVzIHVucmVzcG9uc2l2ZSwg
YWx0aG91Z2ggc29tZXRpbWVzIEkgYW0gYWJsZSB0byBraWxsIGl0IHdpdGggQ1RSTCtDLg0KPiBU
aGUgY29kZSBJIHVzZSB0byByZXByb2R1Y2UgdGhpcyAodG9tY2xpKSBpcyB0aGUgc2FtZSBhcyBt
eSBjb2xsZWFndWUgc2VudCBiYWNrIGluIDIwMTY6DQo+DQo+DQo+DQo+IFRoaXMgY2FuIGJlIHJl
cHJvZHVjZWQgYWx3YXlzIGJ5IHN0YXJ0aW5nIHRoZSBkZWJ1ZyBzZXNzaW9uLCBzdGVwcGluZyA1
IHRpbWVzIGFuZCB0aGVuIGlzc3VpbmcgYSBjb250aW51ZS4NCj4gU29tZXRpbWVzIGp1c3QgYSBj
b250aW51ZSB3aWxsIGRvLg0KPiBUaGlzIGVycm9yIGlzIGFsc28gaGFwcGVuaW5nIHNwb3JhZGlj
YWxseSB3aGVuIHJ1bm5pbmcgb3VyIG1haW4gYXBwbGljYXRpb24gdW5kZXIgZ2Ric2VydmVyLCB3
ZSBnZXQgYSBzZWdtZW50YXRpb24gZmF1bHQgaW4gZGxfZml4dXAuDQo+IEl0IG5ldmVyIGhhcHBl
bnMgZHVyaW5nIG5vcm1hbCBydW50aW1lLg0KPg0KPiBUaGUgYWRkcmVzcyB0aGF0IHRoZSBrZXJu
ZWwgY29tcGxhaW5zIGFib3V0IGlzIGNvbWluZyBmcm9tIHB0X3JlZ3MtPmdwclszXS4gVGhpcyB2
YWx1ZSBpcyBwdXQgaW4gdGhlIHJlZ2lzdGVyIGluIGEgY2FsbCB0byBQVFJBQ0VfU0lOR0xFU1RF
UCAodmFsdWUgOSkuDQo+DQo+IEkgcG9rZWQgYXJvdW5kIHRoZSBwdHJhY2UgY29kZSBhIGJpdCwg
c2VlaW5nIGlmIHRoZXJlIHdlcmUgYW55IHBvc3NpYmxlIG92ZXJmbG93cyBidXQgSSBjb3VsZCBu
b3QgZmluZCBhbnl0aGluZywgc28gbWF5YmUgSSdtIGJhcmtpbmcgdXAgdGhlIHdyb25nIHRyZWUs
IGFsdGhvdWdoIGl0IGRvZXMgc2VlbSB0byBiZSByZWxhdGVkIHRvIHB0cmFjZS4NCj4NCj4gSSBh
bHNvIGFkZGVkIGEgZHVtcF9zdGFjayBiZWZvcmUgdGhlICJleHBsb2l0IGF0dGVtcHQiIG1lc3Nh
Z2U6DQo+DQo+IENQVTogMyBQSUQ6IDEzNSBDb21tOiB0b21jbGkgTm90IHRhaW50ZWQgDQo+IDYu
MS4xMzMtMDA1NjQtZzBjMzAyYjI2YTJjNC1kaXJ0eSAjMCBIYXJkd2FyZSBuYW1lOiBuYW1lLHBy
b2RuYW1lIA0KPiBlNTUwMCAweDgwMjQxMDIxIENvcmVOZXQgR2VuZXJpYw0KDQpJbiB0aGUgYmVn
aW5pbmcgeW91IHNheSBpdCBpcyB0aGUgc2FtZSBwbGF0Zm9ybSBhcyB0aGUgb3RoZXIgcmVwb3J0
Lg0KV2hlbiBJIGZvbGxvdyB0aGUgbGluayBJIHVuZGVyc3RhbmQgdGhhdCBwbGF0Zm9ybSBpcyBh
IDgzeHguDQoNCkhlcmUgaXQgaXMgYSBlNTUwMC4NCg0KQW0gSSBtaXNzaW5nIHNvbWV0aGluZyA/
DQoNCkNocmlzdG9waGUNCg0K

