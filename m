Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C2987C8F1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Mar 2024 08:15:55 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=NquLaKh0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TwwWr1YyXz3vXB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Mar 2024 18:15:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=NquLaKh0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:c20a::3; helo=paup264cu001.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from PAUP264CU001.outbound.protection.outlook.com (mail-francecentralazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20a::3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TwwW55mHKz3cy9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Mar 2024 18:15:12 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=djnApoGBvXKQRJeU0dTl5igGr+UfCHL3LbSkh9qjPvOv+FuYhxBOP+v0NlHqmp/1tX+ZH50e2TQ6oREuqSXKGX4faYq6GQYRexYPWDPuiXfNO5ptb0fo1gZB1IPC4+BTL7Bp3eC0ax/dCYEOvz+VwGCsO9soyk1evIXn86AigXx8pUHhzK7OVFns/9VyUwKfsXwyVCJif4+c0GPAw9485Bvr9mgziQ8Gfis5angkw5jO0MqcC7ZbftRCmKHHEH9ahprjqoXRFDQfuHrZDGyYo1kn18aEOICAJnw9c18m8drqbr7ux+x9TsRtgnxNRPlZvgD+5Ml8FYYf/ivkXC4iug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u07YJY6jNFYRnQzZmpGG+gfocu8Zu71XMWaeXRA5mhE=;
 b=LZRSS0Z+h9iJHvMJehYLvQ43fs6Gt2pgVlYbELfhJSd877e6AR4ZyOGjZy6Fq4v2I5aVAUTvHmOqNiL2h7KhIgFuXPvp/BpWi8Ej3A6nrX3HRLh1Ghos4xErWJf1SKXy0j16/vMLtH8cPWuWmYVlGmDI78F42BzWKUUrXs6K15/czhEmdWY0lYaZ7iy+SsKapRyJGtyyomNiMflQmhLXvtgu06dX07syHLciFDJDrlfriy2MlbiUoTrzjiNMyCEScaUz1+GlO4FQgYLWBDyOJ27QW0R+V6pqDznCoMNXGMapJBeUbN3OhKFh6jgV3khavGSJFYS+eoeG1m413tRjdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u07YJY6jNFYRnQzZmpGG+gfocu8Zu71XMWaeXRA5mhE=;
 b=NquLaKh03nivBMaeot4wgCGraJurRMsIoSyBHRTMVJk2guRDzklhDiU6VkiL/YdHldai9+iqDB2xRXuEgSI1RGmXKW2BvHvOI3BO70hWTzm5Ald6VoxJSVBse4so0DAFyzuoJB6x7gaoxjBhs4D5IJ/gaz9BeQbKikIHUOaCivbnpFQDlDkmQ18HH2b9Nv7u28x5h5q6cU+iQtb4iBSxrsYRqMhTvNcsZUaMSS6kxf6OBpI/KMehY+iQpbqOmYUoDIKHj2V8JPWnFMooZrLLUWyAAAora8taHRWkcrpgYYpSW+hbP9qc8g9XUM9ALSTtbUbT21r0tTStARxhsAuIug==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB2176.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1b1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.22; Fri, 15 Mar
 2024 07:14:48 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e%6]) with mapi id 15.20.7386.020; Fri, 15 Mar 2024
 07:14:47 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Gray <bgray@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>
Subject: Re: [PATCH v1 1/3] powerpc/code-patching: Test patch_instructions()
 during boot
Thread-Topic: [PATCH v1 1/3] powerpc/code-patching: Test patch_instructions()
 during boot
Thread-Index: AQHadoSy0Zss80qV7EqwDkET0YRK57E4Y+KA
Date: Fri, 15 Mar 2024 07:14:47 +0000
Message-ID: <701ee036-c32e-4c75-98d1-a46582012eb1@csgroup.eu>
References: <20240315025736.404867-1-bgray@linux.ibm.com>
In-Reply-To: <20240315025736.404867-1-bgray@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR1P264MB2176:EE_
x-ms-office365-filtering-correlation-id: 519fbe0c-e58c-4e23-e876-08dc44bf992a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  QymCrSnzHBCNpCbRG1el+N/SDJAO1q4ejBlM+gcudG/LAbJALlJigBzqLcNMCFEL5FjS5ZLlGWpLtBQ4203V7hZXZrRnrA9xS3Ky8FbDHfvfLkjd5hvCJXBStNXeMnjH44RNbOxydE6T8j/aiwFp/EKWih4zoFhavdzbJ7XzBYvRJltbVgrqM8IMTgF4cHhC1m0uQlZTuQKNQu87l3HX0o7Va5nfD70dDQ/xVvlqOoSQMzlFEiU89iT28DH240lVzUryZX9ZtKLlMqqxXBv02eXj47x0+6CWGe9+2sres4uVK7CppuGa4z+yyoXQi6/G4vVJVGwQpDrGMAuOgv52znRsEznwJkJDnXTNwH8f+FvCZcKPVkshbqy6LhhQplAood5KgxKj1cwUwRH8oxq8L1VWxOtpkVVXzYS3mCpYEavUX7PPdbA3RSLB/G/rdGmBc1ZOy6DeoB/FnnX18Ws9+E2W3UigbWaMINT1ugKbPicoCHa1zt+lw6VetCuWKe0tl3RwwuQSzKba0BCgmJb03xtLE2whX/H9nX9FEJuyg405/WP2qg7Xm/fcXoccd2qaZo1N9c1y+6ELPzuYmv+tji7PlohhXZXanbVxYxEmhZ1ydCd6NJRNG69FAIL1bPsvLbrbO1ftsIew9er7JafrsoZiM/sBEX3RvHiMfbk/swrrtl9u6kd7TfQbD0F/w/FBLsc/UodbTMXScxBv46Igzw==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?Rm4vTWdUR0RHYkZDbFd3bVk0VTJDN2xoMnhsMXRWbzJpVXp0VHdQcWhxVzNE?=
 =?utf-8?B?anFPaTV4K3VxZHk2SW10M3BUTWIzNUVmTUt4cUlLd3g2dVBHMWo4am85dUx1?=
 =?utf-8?B?THdyNytna2lsSFNKWjRMZXZrVXNyd3VvWlRNaUpQQ1BBbGhZek1xUW5FN1BX?=
 =?utf-8?B?NlBUYWd4WDQwWjdYQldIV2JGcThNTXFYakYyOHd4UjUrelNSb20zNm9uMWFj?=
 =?utf-8?B?eGJUNWp2cEtuTXhFNDVEWDFxZEk2QU4yVEdOK0pLR1VJLytCS0dYK2VBeWVC?=
 =?utf-8?B?c0d0NmlKMWtselA3RGdFMk5LZ1hUZlA0V3lROTVFTWI2M2lib0RwZXltWWJi?=
 =?utf-8?B?Q053WUVjSVpidHVSblBwTFFzeE1JdFRBZjVwakV6dk1rWVFJUTk3T2hIMkJG?=
 =?utf-8?B?NnpsbGVwK2ZMRGlKR0RjWk5JOTJ3YW5XbmhoaXdGeDJoNXZVVDZLRzVBTCtW?=
 =?utf-8?B?ZFpjaWZYTnp0a1FJK0tRWjNXTFZuMGl1VkdzZ0diRTUwNjVpSEt0OXNaN1Q3?=
 =?utf-8?B?Qm8yWUYwUHBPdUpaaHVyZFJlZDdCQWpRZUF0eFMzaWxlajFxS3FoNkVtY0VZ?=
 =?utf-8?B?U25IdStJNkFaYWlCSW5YdGQ0NFZXSVlSMFBYdHJWT2J2NmZQSG54NWdoVmYr?=
 =?utf-8?B?WE1yaWh0QTdnYkJiYlAvQUhoSlk3RGh3WjlrWVRYTWRYY0NMVHpKM0h6SHMx?=
 =?utf-8?B?M0lPN1oxZklDemlPYjFMbjVZSWpNS0hGTFZKM3JvY1pEcXNTcXVDNUFJdnha?=
 =?utf-8?B?WjczVWxSVklIWUhjc1pSdUw0T2ZZb0VtcEZCMHBIbzhqMFNmaTE1QlFEcnU4?=
 =?utf-8?B?ejc1b05mQVZJajEycHYrR1pDSHJXVERvTS9TSUxMR296UDI2YU0zb1hTOTFZ?=
 =?utf-8?B?eFoxU3crb0hxUGUyTTdCR0c3c2htaDZOU3VGVFBMQm1SdTl2WmxVeTFmVnNF?=
 =?utf-8?B?bUExU2tUY29NOHRqdEN2eUhFZG5ad29QQkd3aXRZcHhhaEVQbEVQUHl3V3Bt?=
 =?utf-8?B?a2FSY0Uyd3JtOHdiUjNIM0E3dEZMeWxDRDVrb1FzSm5YUUpJUitOOHVLWUgv?=
 =?utf-8?B?NzlFS2RxZmZHNGNGeXY5bmlrVStMOE9OV2tnb3RzRE5ZYm52c2JkY0k4Mk9H?=
 =?utf-8?B?OURKSEd1YXVobGZrRXlUS3dhK3FSa1NVWW9aUUp6bEw5L0cyRUJRY0k2K2I0?=
 =?utf-8?B?Mkt6eGhzdEJOZ2xiZnJ4WUhDQms1azE2V280N1hHQ1JJY0w1Vm1rcFpRM3hs?=
 =?utf-8?B?QTNwbmlJQ3BUSG1Yc0NObU51VWJ4ajJDd0tQQXpzWFUxR3hWK3U1MFQ1NElm?=
 =?utf-8?B?OHdKdU13NWVocGloS1hyQTRZTEdqNjByTDgyZGZWcnNDUm83QURwc2NrSFBJ?=
 =?utf-8?B?SC9Ka0UrbFVkTnc0LzMzVFQzbjVXcDdzdHNZcER0akM4ZmNsTGx0c3YzQklY?=
 =?utf-8?B?am5ZNWZHZjh0amlsTmJ5bHJaS2pSeURyVFl2OC9ZV2F3SWlVOHdnS1dDWXUr?=
 =?utf-8?B?K1IrL3BrcytyL1ZYVGcwVDJOZm9Tc1V2Skh4OG1WRXBZREhkUmc1Q05ZTmZV?=
 =?utf-8?B?bGJkVmpYTXNZTzRuSjY2aVhubnI0NVZzL3NvcUI5dTVPWENDNmxlOFVnb25n?=
 =?utf-8?B?WklFSHBhZUUwelBqbjJsUVdvaHFETnpmRjdSY2J4cHlYVFpNcGg5U2VtK3FS?=
 =?utf-8?B?SHNGMzVibjBaMWhkdVVIalVCNGNyZjlDdnJtRXpZbnlKeGZ2eEFNdVE1ekpy?=
 =?utf-8?B?L0t0Z05na3pIbnV3SGR6SnJPTEhpcWlwNm8zNDlhSTdJNnFOZkNPMmgraXpm?=
 =?utf-8?B?R251Ym5WY3ZZNDVhK3k2M1BaNjk1dXh0dy9DWEZvSzZ2L2oybzVsMVk1dnBi?=
 =?utf-8?B?cDhLenZvZkVPNVFtUGhXUEl6d2plNVRsMURlYzN6TSs3Zy9ZNTVNdFNyb1hX?=
 =?utf-8?B?NHpxZlQrZDNpNjNmZGkzMjhVS2xXbkxQSnpHYTdPaXhXeG1jTXVVVytUajUz?=
 =?utf-8?B?dkNOVjd4a2xabnQxOU00WmZhQUJQRUFGK1g3ckFFVnVDeTdmWmNwOU1vWTEw?=
 =?utf-8?B?V2NpVURSOCtUZTBVRnFqZzFHUkFJeDVhK05Ddk5TTVk3Vkk0MXJoMVdiRFY3?=
 =?utf-8?B?c3lDN043K3NZSGcrT25hTUIzZEFtb0Q4RnZzT0hRZ3VNR0FrSlcrRnB6NjJS?=
 =?utf-8?B?czhQajBSOE92c245ZFpyV0JYa2dSeFl2V0VDbm0xdDE3OVlqR3RuNmt2Tk9s?=
 =?utf-8?B?NUl6YmtkSlk0dys0NFB2VDlYVlN3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <924ABDE086DDC845878D45AE21A8E475@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 519fbe0c-e58c-4e23-e876-08dc44bf992a
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2024 07:14:47.8862
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DHzuWFr/Rc9LV9NVJ7OvCh2pQnnt1nOQSAqcDU7QpzLMtQZKABgkkqPWi+Tg/WE7J2uGj3c5sx87T8VqqprhQSfbmcLJwDHUh5fWGF+IhbQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB2176
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE1LzAzLzIwMjQgw6AgMDM6NTcsIEJlbmphbWluIEdyYXkgYSDDqWNyaXTCoDoNCj4g
cGF0Y2hfaW5zdHJ1Y3Rpb25zKCkgaW50cm9kdWNlcyBuZXcgYmVoYXZpb3VyIHdpdGggYSBjb3Vw
bGUgb2YNCj4gdmFyaWF0aW9ucy4gVGVzdCBlYWNoIGNhc2Ugb2YNCj4gDQo+ICAgICogYSByZXBl
YXRlZCAzMi1iaXQgaW5zdHJ1Y3Rpb24sDQo+ICAgICogYSByZXBlYXRlZCA2NC1iaXQgaW5zdHJ1
Y3Rpb24gKHBwYzY0KSwgYW5kDQo+ICAgICogYSBjb3BpZWQgc2VxdWVuY2Ugb2YgaW5zdHJ1Y3Rp
b25zDQo+IA0KPiBmb3IgYm90aCBvbiBhIHNpbmdsZSBwYWdlIGFuZCB3aGVuIGl0IGNyb3NzZXMg
YSBwYWdlIGJvdW5kYXJ5Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQmVuamFtaW4gR3JheSA8Ymdy
YXlAbGludXguaWJtLmNvbT4NCj4gLS0tDQo+ICAgYXJjaC9wb3dlcnBjL2xpYi90ZXN0LWNvZGUt
cGF0Y2hpbmcuYyB8IDkyICsrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiAgIDEgZmlsZSBj
aGFuZ2VkLCA5MiBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBj
L2xpYi90ZXN0LWNvZGUtcGF0Y2hpbmcuYyBiL2FyY2gvcG93ZXJwYy9saWIvdGVzdC1jb2RlLXBh
dGNoaW5nLmMNCj4gaW5kZXggYzQ0ODIzMjkyZjczLi4zNWEzNzU2MjcyZGYgMTAwNjQ0DQo+IC0t
LSBhL2FyY2gvcG93ZXJwYy9saWIvdGVzdC1jb2RlLXBhdGNoaW5nLmMNCj4gKysrIGIvYXJjaC9w
b3dlcnBjL2xpYi90ZXN0LWNvZGUtcGF0Y2hpbmcuYw0KPiBAQCAtMzQ3LDYgKzM0Nyw5NyBAQCBz
dGF0aWMgdm9pZCBfX2luaXQgdGVzdF9wcmVmaXhlZF9wYXRjaGluZyh2b2lkKQ0KPiAgIAljaGVj
ayghbWVtY21wKGlwdHIsIGV4cGVjdGVkLCBzaXplb2YoZXhwZWN0ZWQpKSk7DQo+ICAgfQ0KPiAg
IA0KPiArc3RhdGljIHZvaWQgX19pbml0IHRlc3RfbXVsdGlfaW5zdHJ1Y3Rpb25fcGF0Y2hpbmco
dm9pZCkNCj4gK3sNCj4gKwl1MzIgY29kZVsyNTZdOw0KDQpCdWlsZCBmYWlsdXJlOg0KDQogICBD
QyAgICAgIGFyY2gvcG93ZXJwYy9saWIvdGVzdC1jb2RlLXBhdGNoaW5nLm8NCmFyY2gvcG93ZXJw
Yy9saWIvdGVzdC1jb2RlLXBhdGNoaW5nLmM6IEluIGZ1bmN0aW9uIA0KJ3Rlc3RfbXVsdGlfaW5z
dHJ1Y3Rpb25fcGF0Y2hpbmcnOg0KYXJjaC9wb3dlcnBjL2xpYi90ZXN0LWNvZGUtcGF0Y2hpbmcu
Yzo0Mzk6MTogZXJyb3I6IHRoZSBmcmFtZSBzaXplIG9mIA0KMTA0MCBieXRlcyBpcyBsYXJnZXIg
dGhhbiAxMDI0IGJ5dGVzIFstV2Vycm9yPWZyYW1lLWxhcmdlci10aGFuPV0NCiAgIDQzOSB8IH0N
CiAgICAgICB8IF4NCmNjMTogYWxsIHdhcm5pbmdzIGJlaW5nIHRyZWF0ZWQgYXMgZXJyb3JzDQpt
YWtlWzRdOiAqKiogW3NjcmlwdHMvTWFrZWZpbGUuYnVpbGQ6MjQzOiANCmFyY2gvcG93ZXJwYy9s
aWIvdGVzdC1jb2RlLXBhdGNoaW5nLm9dIEVycm9yIDENCg0KDQpJIGhhdmUgdG8gYXZvaWQgYmln
IGFycmF5cyBvbiB0aGUgc3RhY2suDQoNCg0KPiArCXZvaWQgKmJ1ZjsNCj4gKwl1MzIgKmFkZHIz
MjsNCj4gKwl1NjQgKmFkZHI2NDsNCj4gKwlwcGNfaW5zdF90IGluc3Q2NCA9IHBwY19pbnN0X3By
ZWZpeChPUF9QUkVGSVggPDwgMjYgfCAzVUwgPDwgMjQsIFBQQ19SQVdfVFJBUCgpKTsNCj4gKwl1
MzIgaW5zdDMyID0gUFBDX1JBV19OT1AoKTsNCj4gKw0KPiArCWJ1ZiA9IHZ6YWxsb2MoUEFHRV9T
SVpFICogOCk7DQo+ICsJY2hlY2soYnVmKTsNCj4gKwlpZiAoIWJ1ZikNCj4gKwkJcmV0dXJuOw0K
PiArDQo+ICsJLyogVGVzdCBzaW5nbGUgcGFnZSAzMi1iaXQgcmVwZWF0ZWQgaW5zdHJ1Y3Rpb24g
Ki8NCj4gKwlhZGRyMzIgPSBidWYgKyBQQUdFX1NJWkU7DQo+ICsJY2hlY2soIXBhdGNoX2luc3Ry
dWN0aW9ucyhhZGRyMzIgKyAxLCAmaW5zdDMyLCAxMiwgdHJ1ZSkpOw0KPiArDQo+ICsJY2hlY2so
YWRkcjMyWzBdID09IDApOw0KPiArCWNoZWNrKGFkZHIzMlsxXSA9PSBpbnN0MzIpOw0KPiArCWNo
ZWNrKGFkZHIzMlsyXSA9PSBpbnN0MzIpOw0KPiArCWNoZWNrKGFkZHIzMlszXSA9PSBpbnN0MzIp
Ow0KPiArCWNoZWNrKGFkZHIzMls0XSA9PSAwKTsNCj4gKw0KPiArCS8qIFRlc3Qgc2luZ2xlIHBh
Z2UgNjQtYml0IHJlcGVhdGVkIGluc3RydWN0aW9uICovDQo+ICsJaWYgKElTX0VOQUJMRUQoQ09O
RklHX1BQQzY0KSkgew0KPiArCQljaGVjayhwcGNfaW5zdF9wcmVmaXhlZChpbnN0NjQpKTsNCj4g
Kw0KPiArCQlhZGRyNjQgPSBidWYgKyBQQUdFX1NJWkUgKiAyOw0KPiArCQlwcGNfaW5zdF93cml0
ZShjb2RlLCBpbnN0NjQpOw0KPiArCQljaGVjayghcGF0Y2hfaW5zdHJ1Y3Rpb25zKCh1MzIgKiko
YWRkcjY0ICsgMSksIGNvZGUsIDI0LCB0cnVlKSk7DQo+ICsNCj4gKwkJY2hlY2soYWRkcjY0WzBd
ID09IDApOw0KPiArCQljaGVjayhwcGNfaW5zdF9lcXVhbChwcGNfaW5zdF9yZWFkKCh1MzIgKikm
YWRkcjY0WzFdKSwgaW5zdDY0KSk7DQo+ICsJCWNoZWNrKHBwY19pbnN0X2VxdWFsKHBwY19pbnN0
X3JlYWQoKHUzMiAqKSZhZGRyNjRbMl0pLCBpbnN0NjQpKTsNCj4gKwkJY2hlY2socHBjX2luc3Rf
ZXF1YWwocHBjX2luc3RfcmVhZCgodTMyICopJmFkZHI2NFszXSksIGluc3Q2NCkpOw0KPiArCQlj
aGVjayhhZGRyNjRbNF0gPT0gMCk7DQo+ICsJfQ0KPiArDQo+ICsJLyogVGVzdCBzaW5nbGUgcGFn
ZSBtZW1jcHkgKi8NCj4gKwlhZGRyMzIgPSBidWYgKyBQQUdFX1NJWkUgKiAzOw0KPiArDQo+ICsJ
Zm9yIChpbnQgaSA9IDA7IGkgPCBBUlJBWV9TSVpFKGNvZGUpOyBpKyspDQo+ICsJCWNvZGVbaV0g
PSBpICsgMTsNCj4gKw0KPiArCWNoZWNrKCFwYXRjaF9pbnN0cnVjdGlvbnMoYWRkcjMyICsgMSwg
Y29kZSwgc2l6ZW9mKGNvZGUpLCBmYWxzZSkpOw0KPiArDQo+ICsJY2hlY2soYWRkcjMyWzBdID09
IDApOw0KPiArCWNoZWNrKCFtZW1jbXAoJmFkZHIzMlsxXSwgY29kZSwgc2l6ZW9mKGNvZGUpKSk7
DQo+ICsJY2hlY2soYWRkcjMyW0FSUkFZX1NJWkUoY29kZSkgKyAxXSA9PSAwKTsNCj4gKw0KPiAr
CS8qIFRlc3QgbXVsdGlwYWdlIDMyLWJpdCByZXBlYXRlZCBpbnN0cnVjdGlvbiAqLw0KPiArCWFk
ZHIzMiA9IGJ1ZiArIFBBR0VfU0laRSAqIDQgLSA4Ow0KPiArCWNoZWNrKCFwYXRjaF9pbnN0cnVj
dGlvbnMoYWRkcjMyICsgMSwgJmluc3QzMiwgMTIsIHRydWUpKTsNCj4gKw0KPiArCWNoZWNrKGFk
ZHIzMlswXSA9PSAwKTsNCj4gKwljaGVjayhhZGRyMzJbMV0gPT0gaW5zdDMyKTsNCj4gKwljaGVj
ayhhZGRyMzJbMl0gPT0gaW5zdDMyKTsNCj4gKwljaGVjayhhZGRyMzJbM10gPT0gaW5zdDMyKTsN
Cj4gKwljaGVjayhhZGRyMzJbNF0gPT0gMCk7DQo+ICsNCj4gKwkvKiBUZXN0IG11bHRpcGFnZSA2
NC1iaXQgcmVwZWF0ZWQgaW5zdHJ1Y3Rpb24gKi8NCj4gKwlpZiAoSVNfRU5BQkxFRChDT05GSUdf
UFBDNjQpKSB7DQo+ICsJCWNoZWNrKHBwY19pbnN0X3ByZWZpeGVkKGluc3Q2NCkpOw0KPiArDQo+
ICsJCWFkZHI2NCA9IGJ1ZiArIFBBR0VfU0laRSAqIDUgLSA4Ow0KPiArCQlwcGNfaW5zdF93cml0
ZShjb2RlLCBpbnN0NjQpOw0KPiArCQljaGVjayghcGF0Y2hfaW5zdHJ1Y3Rpb25zKCh1MzIgKiko
YWRkcjY0ICsgMSksIGNvZGUsIDI0LCB0cnVlKSk7DQo+ICsNCj4gKwkJY2hlY2soYWRkcjY0WzBd
ID09IDApOw0KPiArCQljaGVjayhwcGNfaW5zdF9lcXVhbChwcGNfaW5zdF9yZWFkKCh1MzIgKikm
YWRkcjY0WzFdKSwgaW5zdDY0KSk7DQo+ICsJCWNoZWNrKHBwY19pbnN0X2VxdWFsKHBwY19pbnN0
X3JlYWQoKHUzMiAqKSZhZGRyNjRbMl0pLCBpbnN0NjQpKTsNCj4gKwkJY2hlY2socHBjX2luc3Rf
ZXF1YWwocHBjX2luc3RfcmVhZCgodTMyICopJmFkZHI2NFszXSksIGluc3Q2NCkpOw0KPiArCQlj
aGVjayhhZGRyNjRbNF0gPT0gMCk7DQo+ICsJfQ0KPiArDQo+ICsJLyogVGVzdCBtdWx0aXBhZ2Ug
bWVtY3B5ICovDQo+ICsJYWRkcjMyID0gYnVmICsgUEFHRV9TSVpFICogNiAtIDEyOw0KPiArDQo+
ICsJZm9yIChpbnQgaSA9IDA7IGkgPCBBUlJBWV9TSVpFKGNvZGUpOyBpKyspDQo+ICsJCWNvZGVb
aV0gPSBpICsgMTsNCj4gKw0KPiArCWNoZWNrKCFwYXRjaF9pbnN0cnVjdGlvbnMoYWRkcjMyICsg
MSwgY29kZSwgc2l6ZW9mKGNvZGUpLCBmYWxzZSkpOw0KPiArDQo+ICsJY2hlY2soYWRkcjMyWzBd
ID09IDApOw0KPiArCWNoZWNrKCFtZW1jbXAoJmFkZHIzMlsxXSwgY29kZSwgc2l6ZW9mKGNvZGUp
KSk7DQo+ICsJY2hlY2soYWRkcjMyW0FSUkFZX1NJWkUoY29kZSkgKyAxXSA9PSAwKTsNCj4gKw0K
PiArCXZmcmVlKGJ1Zik7DQo+ICt9DQo+ICsNCj4gICBzdGF0aWMgaW50IF9faW5pdCB0ZXN0X2Nv
ZGVfcGF0Y2hpbmcodm9pZCkNCj4gICB7DQo+ICAgCXByX2luZm8oIlJ1bm5pbmcgY29kZSBwYXRj
aGluZyBzZWxmLXRlc3RzIC4uLlxuIik7DQo+IEBAIC0zNTYsNiArNDQ3LDcgQEAgc3RhdGljIGlu
dCBfX2luaXQgdGVzdF9jb2RlX3BhdGNoaW5nKHZvaWQpDQo+ICAgCXRlc3RfY3JlYXRlX2Z1bmN0
aW9uX2NhbGwoKTsNCj4gICAJdGVzdF90cmFuc2xhdGVfYnJhbmNoKCk7DQo+ICAgCXRlc3RfcHJl
Zml4ZWRfcGF0Y2hpbmcoKTsNCj4gKwl0ZXN0X211bHRpX2luc3RydWN0aW9uX3BhdGNoaW5nKCk7
DQo+ICAgDQo+ICAgCXJldHVybiAwOw0KPiAgIH0NCg==
