Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF4A92D224
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2024 15:00:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=cs-soprasteria.com header.i=@cs-soprasteria.com header.a=rsa-sha256 header.s=selector1 header.b=aiWWQYV/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WJydX0RYLz3fVR
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2024 23:00:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=cs-soprasteria.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=cs-soprasteria.com header.i=@cs-soprasteria.com header.a=rsa-sha256 header.s=selector1 header.b=aiWWQYV/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cs-soprasteria.com (client-ip=2a01:111:f403:260c::628; helo=eur03-vi1-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy2@cs-soprasteria.com; receiver=lists.ozlabs.org)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on20628.outbound.protection.outlook.com [IPv6:2a01:111:f403:260c::628])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WJycl6cS3z3c5t
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jul 2024 22:59:50 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IHCByryuRcI7wf7z+XEZalViM8Z/nz4xKecNDQUQyqFx8ZAfxnPi/KH2S3HQmwx8x/y9peVESUCRn5EhJPh+YHD52W8WKNc31FEHnvUEVrgmMq78b+ECQVf3Nd8dslILKgQW3bmTFcA1EXeJzsTv9CMNodvsjSDtGvMdYKOh8GR4h3/+FFopjWFwM1U4F/o1omN1RLuxXCZLW3/iXzVqRysBEsSX1IovXEorHBuP8FTEPiDn1HU7b/mZlJltsdqF8qb0iLD2lkx6VHNweMu1aJp8u9y7Hjlzw4v0OQqsa2LYjTvaM6fhwHOgf3hoYMYieSWeayjiDE3QXTiyTsJdQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fDzOrJ6TUhGPXxBFv8nZBiORey1yzz085ciTpvBSXFE=;
 b=bAUaqs8AhwiyD5lDA+GLq+ipTDlT9yu6wgsT+S63rHrxWhOvvZREVHTdddjD/0Wk0Vvb+H67SL28hytT/gVoL6TP1eAjzuT+wYUGrKNMx2dIGTF6s9BrAkz1JU+FTlceunTz2VP7XTOqUAe+Iu1oOfnp+TULg3oM5IdDjP6rHqrmZyhKry8sgxr2VhErcYcIuQ6h3GBM31RHs1OCKT5qTLJSHVjrXxbRcU1rkVysuMQ/C6wphTD/Kl23zTtfwyVKsVo8UM27gparuDuMQZmW2Hl3WvqKIbK+8x9DpFHtMGBfH1xa5I98Qp8Z30x5VieUhq7qZBcoQoOZGa+Rh/FERw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cs-soprasteria.com; dmarc=pass action=none
 header.from=cs-soprasteria.com; dkim=pass header.d=cs-soprasteria.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cs-soprasteria.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fDzOrJ6TUhGPXxBFv8nZBiORey1yzz085ciTpvBSXFE=;
 b=aiWWQYV/bS4Zw/MPkzikp2Re8mv8WHgwvPSxkdt69bB0TpgkN/JChMDE8lhA1D38MW3nHOW7gvGvLRMD4UIij0tNbmfcWqWwbHxjpbEfhtCQ2RH4Tn4okj0LUD4zJ9WynnK8iSZI3+kg7p+rOxOOnQ4ot8jX4zFDx6lNtTHZWqAZjjAxgchy4auPMKD+shlcLyZORtdOmyT1uhTz89yUruubkjfwy00DfW3GLW58sqyMNAihGWhisToxfwB7ZHi9vB2eTx8C3M1DXbLQTidh4Q4kOeeklG1ZJ28jj5IqNaLuuSgopfYiCLtcw6BEMwn7iylky+S6rFY+c45jN5n4/w==
Received: from AM0PR07MB4962.eurprd07.prod.outlook.com (2603:10a6:208:f3::19)
 by PR3PR07MB6891.eurprd07.prod.outlook.com (2603:10a6:102:75::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.5; Wed, 10 Jul
 2024 12:59:29 +0000
Received: from AM0PR07MB4962.eurprd07.prod.outlook.com
 ([fe80::6724:2919:9cbb:2bb2]) by AM0PR07MB4962.eurprd07.prod.outlook.com
 ([fe80::6724:2919:9cbb:2bb2%6]) with mapi id 15.20.7762.016; Wed, 10 Jul 2024
 12:59:29 +0000
From: LEROY Christophe <christophe.leroy2@cs-soprasteria.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Michael Ellerman
	<mpe@ellerman.id.au>
Subject: Re: [PATCH v3 16/16] mm/mmap: Move may_expand_vm() check in
 mmap_region()
Thread-Topic: [PATCH v3 16/16] mm/mmap: Move may_expand_vm() check in
 mmap_region()
Thread-Index:  AQHazj/73szxdShcFku5GHM/3RSbbrHszwWAgACDZICAAS53gIABa9WAgAAE/ACAAAPMgA==
Date: Wed, 10 Jul 2024 12:59:29 +0000
Message-ID: <7161cef3-49e4-4057-8a66-ec1ad6eb3f9e@cs-soprasteria.com>
References: <20240704182718.2653918-1-Liam.Howlett@oracle.com>
 <20240704182718.2653918-17-Liam.Howlett@oracle.com>
 <8fbb424d-a781-4e61-af7a-904e281eba8c@lucifer.local>
 <e5ldsusdn3som7wn2rw76wtrhnlrxk3vkyk3iyimh6qv3ptvwu@24zfmamllev6>
 <0998f05b-9d5f-4b24-9030-22421e1dd859@lucifer.local>
 <874j8x5t4e.fsf@mail.lhotse>
 <92ce2025-51c3-423a-902e-dbd19d5d7850@lucifer.local>
In-Reply-To: <92ce2025-51c3-423a-902e-dbd19d5d7850@lucifer.local>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cs-soprasteria.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR07MB4962:EE_|PR3PR07MB6891:EE_
x-ms-office365-filtering-correlation-id: ba1737a8-66d1-40bd-51c0-08dca0e0226c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:  =?utf-8?B?VE1vbUM5TkRwM0pJWWlLN2xsZ2NZMjJ4WUIwUlMwcmJ1SGtvU09VeHhxdlNz?=
 =?utf-8?B?SDlwdSs0VVNxMEFYUm1NRGFsZlliQjFsMXZCaTQvNzI0TXJlczRQTktkQnZR?=
 =?utf-8?B?OXJHMTJmQ2VSUS9SSjYxbDVqeWMzRnB3VzJNOTRrTVUrbWx1SEx0NzN2VGpo?=
 =?utf-8?B?YlhCYkp0U3ZLUXBjR1MyU3FwbWRPRHVIcm4wQ2tJWmU2b0d6ZGpmMWNLYkI0?=
 =?utf-8?B?bWhkcFMwYUEvNGgyaDJVRjZJZWxQMWE2UGY1SFI1U0UzVGM3bklZY0NsRzZh?=
 =?utf-8?B?QUNGSGdWMjRmMEQzNDlLTVVlTU9YeGM4Y1JWNGp1cTlLY1ZRaW5vU0F0Sldz?=
 =?utf-8?B?Qlh3YXFaSTMvWnMvanpjNVEyZFVFbWp2dndOaXVCY1hmVVovejdxcHdqWU5v?=
 =?utf-8?B?c05pS2tKWGkvT1hVa1k5dHUzWUlOZUJvK1ZJODZvR3YvZWxrUmhOK25VVGhN?=
 =?utf-8?B?NUFUWlJwcG15RU9CNmpkRFdUOHJTS2V1RE5KbklNQnNCS1ptQmhIcGNOOUEv?=
 =?utf-8?B?bjU0MGRpZzVEbWE5ckNwY0xxc3Y0OEs0cHdWUmxrWnNJK1RqdjFVaHNCdGph?=
 =?utf-8?B?Y2RyeXA2NGFwN01DMHY3ZkZZRUZsQnA5V1RTMXNBdkxQT1U3UDhvTVJySU9P?=
 =?utf-8?B?YWRISm81QW82Ump1QjZpS0dMRFdnTDNqSmVHb0FwOGR2eXVOcUR0M3gvNDVJ?=
 =?utf-8?B?Ly9CK0lSYmk5THhieEVmZGtoaHNUaFdrN3hHcVZubXVwZ2RZSjZ3eVdOZ3gy?=
 =?utf-8?B?QkN3REJ6aGJCSlQrK0V2Vll1SFZqTnphQ0hoY3JMejgyZ0w1bDBWeWVjZ0h2?=
 =?utf-8?B?Y3pROGZWK1FwRmt4QnhSZlpFVU1kZmNPQnBXRElDS05QNStRNUUvdlZoSEVU?=
 =?utf-8?B?K1BWbXRiOVpNOExRYjNaWE1TM0E1TTZrbkZiaVNpQytLaVVVUjN3OGROejNM?=
 =?utf-8?B?ZWpkQWlCYVA5SngrT3ptL1BCWGZPRGNQbkVteXgxTWtzVTRyUTdFOEZyeGFS?=
 =?utf-8?B?R0VvK0V6TWtJOXZ4V1dWRE1iSUgySEdUUlkraEdVV3RiUVYxRjBpenlINWpM?=
 =?utf-8?B?NVRlamMyYnhKOUdxVFhUY0lLWk5TYkhNMnZielg5aFlHUDQ4bWZRR3dEY0tW?=
 =?utf-8?B?eE9KSXZQTWtzK3JYeFJSbmxRTmx2VzdsZHNQU3FmU1NOcG1ERUFxZW5NeHBO?=
 =?utf-8?B?T29ZT25NRStaUU5pZDUwZklQRVIwWlZIN2ZMSElrZm5adXNoRDQzMldodTg2?=
 =?utf-8?B?UGV0SnV1VVRjVzNoY091RmhkY2N5b1VGTXJYZW4rdWJmY25OcTVuVG16TUF4?=
 =?utf-8?B?ZFFGMkIzbFkxWm1NdTA4NUp3L1pIZTdPL1ZaU2orOEtTak9aeGw0eExuRk5p?=
 =?utf-8?B?SGNlWGhrSGI2ZzQ3ZWVXK3V5QjA1cllZSHVaYTBKWFc2eWdIV0dhT2swOVR0?=
 =?utf-8?B?QjFXWW9rek1XOTVQL0JPQUFmTlNtRTE4MjdzUDdUb09nSWlpWHRCWUdHcnQv?=
 =?utf-8?B?QytQVHhpazB4Vms4UFBkR2xiZldiUFV0RzBRc0J4Ky9aMldmK1Jya1ArQ2l2?=
 =?utf-8?B?SEY3QVVXS1ZoejJSa08wc1dsd1pTcUJ6RXpKUU95OGxWTlNaVlAyUjM5Nkxy?=
 =?utf-8?B?OXVGcHVJVlNSK1pXVWVVNXlMaEY5Uzg1dk1hajAzYzRSZmpsMnlCL3Q4TzJz?=
 =?utf-8?B?WmdZWDJSblE0dlNQdWQ4SlFpV290dnpOVGt6dlI3cHVRV1dCQ1lvajJsdm9H?=
 =?utf-8?B?RmozOUp2YUdwUjhTbTZUY1lMc3FJU0ltM0lBazJiRlhySWFzZWc1L2lnWWxY?=
 =?utf-8?Q?FTWPiVqCy27FrIZJHmDW02fLqAvDGQ00Syr50=3D?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR07MB4962.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?UmVsWUtsZTZNSDhITTBEUytIdXplNEs0UWRpYWgrQzhkZW5LT09PdnA3Slg1?=
 =?utf-8?B?ZzNzdWEzU1RXakIyNUlyMjMrNm1oK0ZKa3p6QlNYUXVzR1NlSmVJU0VabCtG?=
 =?utf-8?B?dGhZTForbGxEa3NOcWloVnRET3Q0VUZyNlBtT3BjdnJkSHV2akswMTR2cnZq?=
 =?utf-8?B?WjRESy9xTEFzemU0WnpmWjk5NnB3Q1BMSTJENmZ2U2hxb2RvU1YzRUV6VldN?=
 =?utf-8?B?aWRHMmF6WmpJQURnMnlRUkdkRzMwWkI4WmtodG9RcUVlZWVkRDMxa3NabitF?=
 =?utf-8?B?ZHUwWWg3aDZSUTk0V2ltbTUxdXU0U2tCVmFYZ0NwM3VscTVTdW1YRjVZcllP?=
 =?utf-8?B?UXZSUWdmUE5SZTJlL1ZhcHBrVjFkQzdxd05hSkRyWW9ibUZxNGVOU09aS0hz?=
 =?utf-8?B?Smt6WXJUVEVVRk9ZWWk0bWhHWnRvQjlKczNYUnhuR01JTEQwQ25NQTVHMldU?=
 =?utf-8?B?TjJnSzd3SW5VUDFId2tRMHRCRE83Y0RXMmJ6U0JDSVNaMkZlUlUydXhkNW9G?=
 =?utf-8?B?SmVoTkE5djEycTQ2bmdGRUI3eitTcVAzb2NVck0rcC9XbnpGSnc5aXcxWUpk?=
 =?utf-8?B?L05YM21mUThZV01vb2ZOVGNuYU5EeDVxK2FmcXFkY0tsVEJwRnJNU2taWGlx?=
 =?utf-8?B?YnF5eHhvYVMxSmhnVCtESEtNWlQ4dmplNGcra1pIeFhrWk1RU1ZzV3hiWjEv?=
 =?utf-8?B?Y3AwT2VieHdWbmFHOXo3M21KTUNqQThrZXBmZWp6dk9DeHJpMzBIdXoyK09K?=
 =?utf-8?B?VzlOdFFSZkNlZ3NyZTFUcHdROHJBNkFxNTc2K2QzRGg4azBteVRXSnRhQnVi?=
 =?utf-8?B?M2IvR0t2enl2MEJFOExDTDE0L3drTFQzNlV2a3NvOTdJenJuSXFnWmFtZERh?=
 =?utf-8?B?NHFkYnk5ZGp0Z0tVTjAvaVdrZVhWRWlqeGUrZkJobTVXQUVyZXhaUDlvQzR4?=
 =?utf-8?B?SGZ0eUNINzQzbmh2Y3BUR0NNWW8rWDZKejI1K3k4a2FhclVHVWVTS0Nvajkw?=
 =?utf-8?B?RjFFYlc1K3pMdjB0Vm5XWVNQd2l5Q0ZpWmdXZG9MOVNyc2RpWndCekhwcmI5?=
 =?utf-8?B?R3MrSVFWWllyWVlocWt4TWNWQmhRVHFla2hUSUJPS2JnbmxtTW9QNFBhNEdP?=
 =?utf-8?B?S3E0K05vSWdxdlpMQUpwdjF6c0xaVEllREUvRW53Y0wwRGw1STJCNms5U25N?=
 =?utf-8?B?VzYxMXNoaStWYUdXYzhDZGtiV21ycHEwN0pmbzJQK3FKTTJ0cHh5ZStwbWZJ?=
 =?utf-8?B?b3FkM0cvRVdmdlEra3ZiRUlZajRmSWV0NWw3OHZETDl5Y3BVVUVRdzd1UlNE?=
 =?utf-8?B?OVE3d0hMUTUybFFQMlh3UXdIS1ZBRzBLSnlqQzllUXBtYVQ5OW43RHl4aGxO?=
 =?utf-8?B?akF4K1hPSW52ZmdqWVJYRStWd3pNNlk0WGVvZlZzQnd2Rk8rSFpCY0lNOWRu?=
 =?utf-8?B?U3VMNDkzeFYxbzBFQ1UwemF2RjNZTHpNVjlJN0lxSHJtbmw1QkJxZ1MvTkIv?=
 =?utf-8?B?bnJjbURBSFBROVZoNjV6a2lNdDJBdEo4UGlweXdjeFRMSFNuKzMvNW1ZNS8z?=
 =?utf-8?B?bnA4OHdXSi9mM3lGUVhRYjloOHlKVEhUZUUxUWFWRUROenRRWGp2bVZqdmVR?=
 =?utf-8?B?RHIzSDk4QXFLTlgvTHZPOCtzTGUyckllRkxYekFQTjBwRUZsS1ZOU1JISE9E?=
 =?utf-8?B?ZHRJd1JRdnRzRzBpMjcrMjYwNlY2UGpEeStQNk5ZRVVrd2gvSnhocEhhZzNW?=
 =?utf-8?B?cEFKLzY2YUxjWi9vYWxRTFhLL1FmSjQxYVdnQm5EM0ZoMm5rNkVxSk9FNzV1?=
 =?utf-8?B?MHhIMG5aV0FZb0hIMSt4RFA3M0lKaVk0aWcvdEJMYWlOV0hoQll6N3BDYmxJ?=
 =?utf-8?B?UGdDWkVIUUtoaFo2Z2Y3MzkyckZ4L1pZdWhOUm1wU2RGK0d1dWNIOUlrVlVD?=
 =?utf-8?B?dGlzazhhZUtzNmI2RjkvNGo3RmpFYWJ3cDNHS0w4MWNSSmF4ejNBdHNaY0lT?=
 =?utf-8?B?MmFhVGtpVmlaVjZRRldDYTQ3N3V3RTdOZzR2UGg3TUp5U1V2OHN1VWFoR2lN?=
 =?utf-8?B?dWU2eFV0RE45S0REaC9sdUR5dG94dkNaWUUxRjYvNkJtU2dnREU0ZkZzUXRP?=
 =?utf-8?B?S0tzZnBlcDZsTGhKUTlxekQyeWMyWUNyZ2xVazd0TElvSmQ4aHdhUWF5SGNK?=
 =?utf-8?B?bnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9221B43D04B8434D9A412BFA1993D0ED@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: cs-soprasteria.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR07MB4962.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba1737a8-66d1-40bd-51c0-08dca0e0226c
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2024 12:59:29.0385
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8b87af7d-8647-4dc7-8df4-5f69a2011bb5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: psauSbqrSrAqyY34Sh60A7KaroN0SjDMCRByTFGPSG1msHC+Ua9Umo2GqTBc44bFF1eepgn3sYk9m79jncRfusETLbEQ1XwY1qtC+7hUY1hFqLUf4S4Wk0VrGim006YW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR07MB6891
X-MS-Exchange-CrossPremises-AuthAs: Internal
X-MS-Exchange-CrossPremises-AuthMechanism: 04
X-MS-Exchange-CrossPremises-AuthSource: AM0PR07MB4962.eurprd07.prod.outlook.com
X-MS-Exchange-CrossPremises-TransportTrafficType: Email
X-MS-Exchange-CrossPremises-SCL: 1
X-MS-Exchange-CrossPremises-messagesource: StoreDriver
X-MS-Exchange-CrossPremises-BCC: 
X-MS-Exchange-CrossPremises-originalclientipaddress: 88.128.88.81
X-MS-Exchange-CrossPremises-transporttraffictype: Email
X-MS-Exchange-CrossPremises-antispam-scancontext: DIR:Originating;SFV:NSPM;SKIP:0;
X-MS-Exchange-CrossPremises-processed-by-journaling: Journal Agent
X-OrganizationHeadersPreserved: PR3PR07MB6891.eurprd07.prod.outlook.com
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
Cc: "Paul E . McKenney" <paulmck@kernel.org>, Kees Cook <kees@kernel.org>, Jiri Olsa <olsajiri@gmail.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, Andrew Morton <akpm@linux-foundation.org>, Suren Baghdasaryan <surenb@google.com>, "sidhartha.kumar@oracle.com" <sidhartha.kumar@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, Bert Karwatzki <spasswolf@web.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDEwLzA3LzIwMjQgw6AgMTQ6NDUsIExvcmVuem8gU3RvYWtlcyBhIMOpY3JpdMKgOg0K
PiBPbiBXZWQsIEp1bCAxMCwgMjAyNCBhdCAxMDoyODowMVBNIEdNVCwgTWljaGFlbCBFbGxlcm1h
biB3cm90ZToNCj4+IExvcmVuem8gU3RvYWtlcyA8bG9yZW56by5zdG9ha2VzQG9yYWNsZS5jb20+
IHdyaXRlczoNCj4+PiBPbiBNb24sIEp1bCAwOCwgMjAyNCBhdCAwNDo0MzoxNVBNIEdNVCwgTGlh
bSBSLiBIb3dsZXR0IHdyb3RlOg0KPj4+Pg0KPj4gLi4uDQo+Pj4+IFRoZSBmdW5jdGlvbmFsaXR5
IGhlcmUgaGFzIGNoYW5nZWQNCj4+Pj4gLS0tIGZyb20gLS0tDQo+Pj4+IG1heV9leHBhbmRfdm0o
KSBjaGVjaw0KPj4+PiBjYW5fbW9kaWZ5X21tKCkgY2hlY2sNCj4+Pj4gYXJjaF91bm1hcCgpDQo+
Pj4+IHZtc19nYXRoZXJfbXVubWFwX3ZtYXMoKQ0KPj4+PiAuLi4NCj4+Pj4NCj4+Pj4gLS0tIHRv
IC0tLQ0KPj4+PiBjYW5fbW9kaWZ5X21tKCkgY2hlY2sNCj4+Pj4gYXJjaF91bm1hcCgpDQo+Pj4+
IHZtc19nYXRoZXJfbXVubWFwX3ZtYXMoKQ0KPj4+PiBtYXlfZXhwYW5kX3ZtKCkgY2hlY2sNCj4+
Pj4gLi4uDQo+Pj4+DQo+Pj4+IHZtc19nYXRoZXJfbXVubWFwX3ZtYXMoKSBkb2VzIG5vdGhpbmcg
YnV0IGZpZ3VyZXMgb3V0IHdoYXQgdG8gZG8gbGF0ZXIsDQo+Pj4+IGJ1dCBjb3VsZCB1c2UgbWVt
b3J5IGFuZCBjYW4gZmFpbC4NCj4+Pj4NCj4+Pj4gVGhlIHVzZXIgaW1wbGljYXRpb25zIGFyZToN
Cj4+Pj4NCj4+Pj4gMS4gVGhlIHJldHVybiB0eXBlIG9uIHRoZSBlcnJvciBtYXkgY2hhbmdlIHRv
IC1FUEVSTSBmcm9tIC1FTk9NRU0sIGlmDQo+Pj4+IHlvdSBhcmUgbm90IGFsbG93ZWQgdG8gZXhw
YW5kIGFuZCBhcmUgdHJ5aW5nIHRvIG92ZXJ3cml0ZSBtc2VhbCgpJ2VkDQo+Pj4+IFZNQXMuIFRo
YXQgc2VlbXMgc28gdmVyeSByYXJlIHRoYXQgSSdtIG5vdCBzdXJlIGl0J3Mgd29ydGggbWVudGlv
bmluZy4NCj4+Pj4NCj4+Pj4NCj4+Pj4gMi4gYXJjaF91bm1hcCgpIGNhbGxlZCBwcmlvciB0byBt
YXlfZXhwYW5kX3ZtKCkuDQo+Pj4+IHBvd2VycGMgdXNlcyB0aGlzIHRvIHNldCBtbS0+Y29udGV4
dC52ZHNvID0gTlVMTCBpZiBtbS0+Y29udGV4dC52ZHNvIGlzDQo+Pj4+IHdpdGhpbiB0aGUgdW5t
YXAgcmFuZ2UuICBVc2VyIGltcGxpY2F0aW9uIG9mIHRoaXMgbWVhbnMgdGhhdCBhbg0KPj4+PiBh
cHBsaWNhdGlvbiBteSBzZXQgdGhlIHZkc28gdG8gTlVMTCBwcmlvciB0byBoaXR0aW5nIHRoZSAt
RU5PTUVNIGNhc2UgaW4NCj4+Pj4gbWF5X2V4cGFuZF92bSgpIGR1ZSB0byB0aGUgYWRkcmVzcyBz
cGFjZSBsaW1pdC4NCj4+Pj4NCj4+Pj4gQXNzdW1pbmcgdGhlIHJlbW92YWwgb2YgdGhlIHZkc28g
ZG9lcyBub3QgY2F1c2UgdGhlIGFwcGxpY2F0aW9uIHRvIHNlZw0KPj4+PiBmYXVsdCwgdGhlbiB0
aGUgdXNlciB2aXNpYmxlIGNoYW5nZSBpcyB0aGF0IGFueSB2ZHNvIGNhbGwgYWZ0ZXIgYSBmYWls
ZWQNCj4+Pj4gbW1hcChNQVBfRklYRUQpIGNhbGwgd291bGQgcmVzdWx0IGluIGEgc2VnIGZhdWx0
LiAgVGhlIG9ubHkgcmVhc29uIGl0DQo+Pj4+IHdvdWxkIGZhaWwgaXMgaWYgdGhlIG1hcHBpbmcg
cHJvY2VzcyB3YXMgYXR0ZW1wdGluZyB0byBtYXAgYSBsYXJnZQ0KPj4+PiBlbm91Z2ggYXJlYSBv
dmVyIHRoZSB2ZHNvICh3aGljaCBpcyBhY2NvdW50ZWQgYW5kIGluIHRoZSB2bWEgdHJlZSwNCj4+
Pj4gYWZhaWN0KSBhbmQgcmFuIG91dCBvZiBtZW1vcnkuIE5vdGUgdGhhdCB0aGlzIHNpdHVhdGlv
biBjb3VsZCBhcmlzZQ0KPj4+PiBhbHJlYWR5IHNpbmNlIHdlIGNvdWxkIHJ1biBvdXQgb2YgbWVt
b3J5IChub3QgYWNjb3VudGluZykgYWZ0ZXIgdGhlDQo+Pj4+IGFyY2hfdW5tYXAoKSBjYWxsIHdp
dGhpbiB0aGUga2VybmVsLg0KPj4+Pg0KPj4+PiBUaGUgY29kZSB0b2RheSBjYW4gc3VmZmVyIHRo
ZSBzYW1lIGZhdGUsIGJ1dCBub3QgYnkgdGhlIGFjY291bnRpbmcNCj4+Pj4gZmFpbHVyZS4gIEl0
IGNhbiBoYXBwZW4gZHVlIHRvIGZhaWx1cmUgdG8gYWxsb2NhdGUgYSBuZXcgdm1hLA0KPj4+PiBk
b192bWlfbXVubWFwKCkgZmFpbHVyZSBhZnRlciB0aGUgYXJjaF91bm1hcCgpIGNhbGwsIG9yIGFu
eSBvZiB0aGUgb3RoZXINCj4+Pj4gZmFpbHVyZSBzY2VuYXJpb3MgbGF0ZXIgaW4gdGhlIG1tYXBf
cmVnaW9uKCkgZnVuY3Rpb24uDQo+Pj4+DQo+Pj4+IEF0IHRoZSB2ZXJ5IGxlYXN0LCB0aGlzIHJl
cXVpcmVzIGFuIGV4cGFuZGVkIGNoYW5nZSBsb2cuDQo+Pj4NCj4+PiBJbmRlZWQsIGFsc28gKGFz
IG1lbnRpb25lZCBvbiBJUkMpIEkgZmVlbCBsaWtlIHdlIG5lZWQgdG8gbG9vayBhdCB3aGV0aGVy
DQo+Pj4gd2UgX3RydWx5XyBuZWVkIHRoaXMgYXJjaF91bm1hcCgpIGNhbGwgZm9yIGEgc2luZ2xl
LCByYXRoZXIgYW50aXF1YXRlZCwNCj4+PiBhcmNoaXRlY3R1cmUuDQo+Pg0KPj4gWW91IGNhbiBj
YWxsIGl0ICJuaWNoZSIgb3IgImlycmVsZXZhbnQiIG9yICJmcmluZ2UiLCBidXQgImFudGlxdWF0
ZWQiIGlzDQo+PiBmYWN0dWFsbHkgd3JvbmcgOikgUG93ZXIxMCBjYW1lIG91dCBvZiB0aGUgZmFi
IGp1c3QgYSBmZXcgeWVhcnMgYWdvIGF0DQo+PiA3bm0uDQo+IA0KPiBGYWlyIHBvaW50IDspIHBl
cmhhcHMgd2UgY291bGQgZ28gd2l0aCAicmFyaWZpZWQiPyA6PikNCj4gDQo+Pg0KPj4+IEkgbWVh
biB3aHkgYXJlIHRoZXkgdW5tYXBwaW5nIHRoZSBWRFNPLCB3aHkgaXMgdGhhdCB2YWxpZCwgd2h5
IGRvZXMgaXQgbmVlZA0KPj4+IHRoYXQgZmllbGQgdG8gYmUgc2V0IHRvIE5VTEwsIGlzIGl0IHBv
c3NpYmxlIHRvIHNpZ25pZnkgdGhhdCBpbiBzb21lIG90aGVyDQo+Pj4gd2F5IGV0Yy4/DQo+Pg0K
Pj4gSXQgd2FzIG9yaWdpbmFsbHkgZm9yIENSSVUuIFNvIGEgbmljaGUgd29ya2xvYWQgb24gYSBu
aWNoZSBhcmNoaXRlY3R1cmUuDQo+Pg0KPj4gQnV0IGZyb20gdGhlIGNvbW1pdCB0aGF0IGFkZGVk
IGl0LCBpdCBzb3VuZHMgbGlrZSBDUklVIHdhcyB1c2luZyBtcmVtYXAsDQo+PiB3aGljaCBzaG91
bGQgYmUgaGFuZGxlZCB0aGVzZSBkYXlzIGJ5IHZkc29fbXJlbWFwKCkuIFNvIGl0IGNvdWxkIGJl
IHRoYXQNCj4+IGFyY2hfdW5tYXAoKSBpcyBub3QgYWN0dWFsbHkgbmVlZGVkIGZvciBDUklVIGFu
eW1vcmUuDQo+IA0KPiBPaCB0aGF0J3MgaW50ZXJlc3RpbmchDQo+IA0KPj4NCj4+IFRoZW4gSSBn
dWVzcyB3ZSBoYXZlIHRvIGRlY2lkZSBpZiByZW1vdmluZyBvdXIgYXJjaF91bm1hcCgpIHdvdWxk
IGJlIGFuDQo+PiBBQkkgYnJlYWssIHJlZ2FyZGxlc3Mgb2Ygd2hldGhlciBDUklVIG5lZWRzIGl0
IG9yIG5vdC4NCj4gDQo+IFNlZW1zIHRvIG1lIGxpa2UgYW4gaW50ZXJuYWwgaW1wbGVtZW50YXRp
b24gZGV0YWlsIHRoYXQgc2hvdWxkIGhvcGVmdWxseQ0KPiBub3QgcmVzdWx0IGluIGFueXRoaW5n
IHRoYXQgc2hvdWxkIGhhdmUgdmlzaWJsZSBBQkkgaW1wYWN0Pw0KPiANCj4gSSBndWVzcyB0aGlz
IGlzIHNvbWV0aGluZyB3ZSBvdWdodCB0byBhc3Nlc3MuIEl0IHdvdWxkIGJlIHVzZWZ1bCB0bw0K
PiBlbGltaW5hdGUgaG9va3Mgd2hlcmUgd2UgY2FuIHNvIHdlIGNhbiBiZXR0ZXIgY29udHJvbCBW
TUEgYmVoYXZpb3VyIHdpdGhvdXQNCj4gaGF2aW5nIHRvIHdvcnJ5IGFib3V0IGFuIGFyY2ggYmVp
bmcgYWJsZSB0byBkbyBhcmJpdHJhcnkgdGhpbmdzIGF0DQo+IHVuZXhwZWN0ZWQgdGltZXMsIGVz
cGVjaWFsbHkgcGVydGluZW50IHdoZXJlIHdlIGNoYW5nZSB0aGUgb3JkZXIgb2YgdGhpbmdzLg0K
PiANCg0KSSBzZWUgeW91IGFyZSB0YWxraW5nIGFib3V0IGFyY2hfdW5tYXAoKS4gSSBkaWRuJ3Qg
Zm9sbG93IHRoZSBlbnRpcmUgDQpkaXNjdXNzaW9uIGJ1dCB3ZSBoYXZlIHNvbWUgcmVsYXRlZCBz
dHVmZiBoZXJlOiANCmh0dHBzOi8vZ2l0aHViLmNvbS9saW51eHBwYy9pc3N1ZXMvaXNzdWVzLzI0
MQ0KDQpJZiBJIHJlbWVtYmVyIGNvcnJlY3RseSBhcmNoX3VubWFwKCkgc2hvdWxkIGhhdmUgZ29u
ZSBhd2F5IHdlIERtaXRyeSdzIA0Kc2VyaWVzIA0KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGtt
bC8yMDIxMDYxMTE4MDI0Mi43MTEzOTktMS1kaW1hQGFyaXN0YS5jb20vI3IgDQpidXQgaXQgaGFz
bid0IGJlZW4gYXBwbGllZCB5ZXQuDQoNCkNocmlzdG9waGUNCg==
