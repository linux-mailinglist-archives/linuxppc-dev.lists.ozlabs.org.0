Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F90354B36D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jun 2022 16:41:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LMrhy3sxtz3btl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jun 2022 00:41:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=Y0Ou/ez7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=hotmail.com (client-ip=2a01:111:f403:704b::821; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=wenhu.wang@hotmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=Y0Ou/ez7;
	dkim-atps=neutral
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01olkn20821.outbound.protection.outlook.com [IPv6:2a01:111:f403:704b::821])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LMrh54n2Tz3bkv
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jun 2022 00:40:20 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eR7cnfjiXdT0GmJjCmg5DF2uOmZkCfHfXptCKz7AKj+k1Fl2WjL+r/wqijHCLn+7zGGv3MAwCLNu1LkI7MPgONq0lVk8a7S4C+dnIIqJaHJDRhqYG3hJhvSE8RImiNNh8UluqRTzUEQrK3d48cUbgUxiiDnaLB4OzHiHxptMhj09NkiPfWOO8CgeKmCEgnodQDlgmeeqWeDcoW6AWiqoooGFpLdSVsCJjlox+zH8TtSxoscICyD9Ho12hamNVEQzLtDgnAGPT8RUuvwzyC3Lt811KCVy5vB3LQMhOsxpOp+mKyJIaDUZQhafBNCmvf21d8JoPZjdx0JLajmcmNh69w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LlWz6cSW1T366yhDwDnKcQEe/jVSMDJSSCJMrr6+1LM=;
 b=Cbmp2uS00sJ+Mo9rVWIJT28Lmex3t1g4qVLX37AqoEKxBdoIOUpX0QsEvc0Iq9s5k4/jqfEwmU5FjwW1ozhx1mY/7P51PfGR7jY8mQLxFeuK28Vew5vd/ymoW8ai38Eo/9RqB/uK0PqZWQwKCqpBM/xRcuw1k0S+F3KsQB/mGyNJ4qNAEHDUS6OQvIk2ceHwd3/bwqYyPkW4tkIcd3lB6L/KK/Hf+oGmhqv1hb6O1/TVekaFdM/2pHctEKrPPqXp7WlFhI3faONZ1NU8DqElnOOblfcxtx7ac3B7bdH4TeuHwwBv3glxBiUpsTDA8LVGI/hUAMcAwMsrOZPsqAccUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LlWz6cSW1T366yhDwDnKcQEe/jVSMDJSSCJMrr6+1LM=;
 b=Y0Ou/ez77kyCOXK6JoOU7BV19YJEV16iXcw8Wkot00PFsAFDsvyUVfysRNtpM3e5YMAQpsew75EvIYsrJErR2t0jsNxolwedELWXKU98ML6kV8YFaeIwN5iMxu6vAEYxltDcpm6TlUAuASxKy4Gz5nAKwCO8TnJKnmiYGEgOJSSNoNwAzIZf+cayw8mKX3AzmvWbhFe0ZqiCNyHf7qrK5RyZQHTPwlgov5tbU9bBtEe8E80KYaCF2b/yqc4Eg273SHZIm6mfNiMrREtKPn63rKiwm3huoUHrG9R9XfJyQESlwPkcc01uFpmWJ0wg13McDsuxMkN4w7bDsMm6ICGGLw==
Received: from SG2PR01MB2951.apcprd01.prod.exchangelabs.com
 (2603:1096:4:76::15) by TY2PR0101MB3408.apcprd01.prod.exchangelabs.com
 (2603:1096:404:f2::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.22; Tue, 14 Jun
 2022 14:40:00 +0000
Received: from SG2PR01MB2951.apcprd01.prod.exchangelabs.com
 ([fe80::a1f7:b32:baa1:3d12]) by SG2PR01MB2951.apcprd01.prod.exchangelabs.com
 ([fe80::a1f7:b32:baa1:3d12%7]) with mapi id 15.20.5332.022; Tue, 14 Jun 2022
 14:40:00 +0000
From: Wenhu Wang <wenhu.wang@hotmail.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Greg KH
	<gregkh@linuxfoundation.org>
Subject: Re: [PATCH 2/2] uio:powerpc:mpc85xx: l2-cache-sram uio driver
 implementation
Thread-Topic: [PATCH 2/2] uio:powerpc:mpc85xx: l2-cache-sram uio driver
 implementation
Thread-Index: AQHYf8PgfEfUKvdhvUy2TYJx5fnwT61O8plW
Date: Tue, 14 Jun 2022 14:40:00 +0000
Message-ID:  <SG2PR01MB2951CE54262F791931F4AAE19FAA9@SG2PR01MB2951.apcprd01.prod.exchangelabs.com>
References: <20220609102855.272270-1-wenhu.wang@hotmail.com>
 <SG2PR01MB295139AA7360917B2C4846E19FA79@SG2PR01MB2951.apcprd01.prod.exchangelabs.com>
 <YqHy1uXwCLlJmftr@kroah.com>
 <SG2PR01MB2951EA9ED70E5F766DD26A069FAA9@SG2PR01MB2951.apcprd01.prod.exchangelabs.com>
 <efebcb50-0481-622a-894c-7000999aacc6@csgroup.eu>
 <c76598b5-2d60-ea22-d590-4cc6998a8830@csgroup.eu>
 <SG2PR01MB29516D3BB7525390ADD5B0829FAA9@SG2PR01MB2951.apcprd01.prod.exchangelabs.com>
In-Reply-To:  <SG2PR01MB29516D3BB7525390ADD5B0829FAA9@SG2PR01MB2951.apcprd01.prod.exchangelabs.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [nNdH+dYBw+N431KwjLgUsISnPV3fbX7hqNrQt1AVR14mu3GZdicTd2b0cWiJQUxa]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 80f8223f-12ae-4083-23cf-08da4e13c298
x-ms-traffictypediagnostic: TY2PR0101MB3408:EE_
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  wbTvD0jjMx1aOkDPJRMT0b+0acnjv00mT57SMbJXdy22veD1D7EmnHS5PyFz6zxsiNegF4JinkX+DyFdXhAKf8GUUdHrok5GdWFJJDCXLGtvgqhUBU+28Yj8D8DVjxLbgdOtSVt2/AkwhelqoqRkjckrCLviO0Y+8Uu4gIWyZmK+Z4zQdsXMlo22TGkrtWf7ONJKjCF5l4+zVmURoG7EIPaoFC2MLfR0Pi/KW5hAnKC/62XAYZsdCCUbKdDKy2AOFIdzDvXOBlt27QSi10vD75dyFlo+30ywe2dRnyOuAyTGxZfzfyyc5MBbsM+JxHcTYsacIDEgBiqOARBsZ+ne+KC9nH+J5K8/q44nndlyniPj1of6CPQVnIvgPdfnkPAt36D82smnNv/+Zhwy4ISOTw4oDPJpydiwJJY2mFRVbW+PuchCu/Ly5YWebxdcHNLI+RZJpnmj6EMt3V/PwYRQNnJY/e8zgEkc89J34MS26dGVpe0unGp3o/E4rXWBGHUY+SPNSJ/a22G+lPNjKxk5i9MdXqCQArLH8eMA8BqHOtQcGlOdKCO2rYGjNdigVvpl15NH+MiSEtfMwBXajpG3xw==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?iso-8859-1?Q?q5Tm333GJnv6bSxXrYzyGgD0eQ+KTJLP0bP5RPO0HyrjFKx4LceL0vfA2W?=
 =?iso-8859-1?Q?8dCQrxvvRiBCTWbGrJ9FZPykayD/i4WESmVhRll0lyJmhJik+3C4T8zfQK?=
 =?iso-8859-1?Q?X/QTawzHROCoFCbQ9/lPEdT6ZLfVWBhlNN2UzmL5TJx/SwJ/LEPl+M1y5T?=
 =?iso-8859-1?Q?9teTsc0zrYPftog7P3P4hp4p4Jqt93uU/gg/zEBktXF+MmKIuu6SR5h01n?=
 =?iso-8859-1?Q?j9liFKd6+hxciO0fG5noJ021vDCkR350AZu6F3vRGJmAXoELMRnMNW7opL?=
 =?iso-8859-1?Q?e6cn8A7oXyP745oCdrAkYPqEui59SDxIVC4H3odXjmjpPwqSUWuaQ8Xrsd?=
 =?iso-8859-1?Q?N/Xx4AKkWFhc3UZanjnsReZD+0AxRi36Hg7ppLAR8unu8//MNNTI4idtdR?=
 =?iso-8859-1?Q?VMYJwmKHxi+qy9ZdO3jsCEGtAntn4je+uj0kxsCTQnT6+LsAvk2VKvOhV9?=
 =?iso-8859-1?Q?+ZksjlsJSYJsqRneXYKfWQbC6+nPoU97IphFTdzM20bNYQWFwX72KoDO0P?=
 =?iso-8859-1?Q?rURXmXRqHrZK3NpvzhNuJD3wJNrAYR5tVtTdCxelsiYSk+Oa+sdLeYX35x?=
 =?iso-8859-1?Q?ALEaEYPU7yqtFz8EOkbp93U8dNKduQNuOSfhMr0OnpIHQcyaFHZbSRYfJ2?=
 =?iso-8859-1?Q?qOzrL+dXSVIWS6P1cOjbnwBwLXcfXJy00qsV1dcaNvDuO7JzBfYINLwPNs?=
 =?iso-8859-1?Q?UAkhus4OgEqMd3Q79IFOCAiyRYTXeWoTAhzomqyA7nwOUw4mWg1tmeFXTR?=
 =?iso-8859-1?Q?rD+w+v7Kgr9zqSwtY1OBg8h/I22NqARMjautDo6mIlcOSlITAiCm7vayf/?=
 =?iso-8859-1?Q?9nG9SeHluessQLOunG8uXw3oFsJfFnvFXn3/LCZQfLGJiVvqp7kTzp/PB0?=
 =?iso-8859-1?Q?O9kSqZo5Tm9goTUFJ4Me1TGwbhmcNkEZObXD2RrFpw9UgE7+Xil1+9tI26?=
 =?iso-8859-1?Q?9d1Bm8AOHjf86jT2s7cvHv0/BxAYHzLV1P2a8Csl4VjnkT/KsFwOZctU34?=
 =?iso-8859-1?Q?8mkigkBsKAcMvVnPO+JscoJN/MEGIhXvbpluCk18tRaj3rRuWhlLsUi32c?=
 =?iso-8859-1?Q?pGT6nHYlNwmWao98bGiIsO83ZLKYjspalVUDxnu4catS5U1Ez+lsAkq081?=
 =?iso-8859-1?Q?XRh7CKWCNm+ulUnxzCDiqSkhk0TLF/AeY/F4Y5gcNqIqJsi2q1bnDVWsY0?=
 =?iso-8859-1?Q?cxBCQvMCiGdHPeFyaEN6QkIcPKT4S2t5+QBeD+zvtetKTmQ4oiARZq4Qxi?=
 =?iso-8859-1?Q?559Uq5lRNR7rwGVgwhrkuaBj2A40Ovr/NsjqxCQ+zrpB4AJeERRxNBlj9y?=
 =?iso-8859-1?Q?lwYFg1AMwheiZ8Xb5EHxnUTZAtR5TCj42L2n8eWUjzdL+oJ6+HLxFR/Jjq?=
 =?iso-8859-1?Q?BaVGeSoY7k4b6VIU9OwMIiqVslc5o/P4u/uMHKSBoZdylQ6HMXpZgBjv2J?=
 =?iso-8859-1?Q?Mda2AviTdliLXeqEwdJwHVz49Rv3a1R+ULSpHYC2KzIkcXa/vMFwHWf/NM?=
 =?iso-8859-1?Q?IpN2xRdzH84b5XnoDSQ/NP7aetZ7PfgGnWNO7w8Hc2SA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-d8e84.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR01MB2951.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 80f8223f-12ae-4083-23cf-08da4e13c298
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2022 14:40:00.2129
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR0101MB3408
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

>>>=0A=
>>> I looked at that patch.=0A=
>>>=0A=
>>> I don't think you can just drop the #ifdef in function=0A=
>>> __access_remote_vm() in mm/memory.c=0A=
>>>=0A=
>>> You have to replace it with something like:=0A=
>>>=0A=
>>>=A0=A0=A0=A0=A0 if (!IS_ENABLED(CONFIG_HAVE_IOREMAP_PROT))=0A=
>>>=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;=0A=
>>>=0A=
>>=0A=
>>=0A=
>>Another thing in that patch:=0A=
>>=0A=
>>By making generic_access_phys() a static inline, it means that everytime=
=0A=
>>you refer to the address of that function in a vm_operations_struct=0A=
>>struct, the compiler has to provide an outlined instance of the=0A=
>>function. It means you'll likely have several instances of a=0A=
>>generic_access_phys().=0A=
>>=0A=
>>What you could do instead is to add the following at the start of=0A=
>>generic_access_phys() in mm/memory.c :=0A=
>>=0A=
>>=A0=A0=A0=A0=A0=A0=A0 if (!IS_ENABLED(CONFIG_HAVE_IOREMAP_PROT))=0A=
>>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return 0;=0A=
>>=0A=
>=0A=
>It is really a better chmoce, thanks for the advice.=0A=
>Multiple instances exist as you mentioned, the block returns 0 with no-op=
=0A=
>instance which makes no difference with the function return value.=0A=
>=0A=
>I will update the patch after a re-confirming.=0A=
>=0A=
=0A=
I tried as adviced but when not defined, error happens on archectures such=
=0A=
as arm64. Actually the function generic_access_phys calls a lot of function=
s=0A=
that become undefined if we compile it with CONFIG_HAVE_IOREMAP_PROT disabl=
ed.=0A=
The archectures that support CONFIG_HAVE_IOREMAP_PROT are mips, x86, sh, ar=
c,=0A=
s390, loongarch and powerpc.=0A=
=0A=
So we may just define the function with static inline and add IS_ENABLED=0A=
condition branch in function __access_remote_vm in mm/memory.c. The executi=
ng=0A=
path breaks if CONFIG_HAVE_IOREMAP_PROT is disabled, and never goes into th=
e=0A=
static no-op function.=0A=
=0A=
In short, the static inline no-op function would never be executed, the onl=
y=0A=
difference is that there would be a lot of function code in compiled target=
.=0A=
=0A=
Thanks,=0A=
Wenhu=
