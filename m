Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5827FE93B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Nov 2023 07:38:00 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=KFPRfIMm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sgmj22hkgz3d87
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Nov 2023 17:37:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=KFPRfIMm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::611; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20611.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::611])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sgmh73hwvz3c5j
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Nov 2023 17:37:09 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OXd7iJNnGK3vuNgYedEY2iW0gz4AuKaXC2nNzWqJ3e18oVQ3Y1Ncq07ycgUQ8pki9J0UIR4pwhU2DlzfLJEUbKPhbNzRiunQiHGR9tyESU/kkUq9f33lWyW+UcrdGIu3CjinrFJCborfTazvBVWr89xRyXLEMDvf3jtRLFLodYSxz85EzlXIVz8y9wDbG+oUD3r8JmEw2zyRc23YVr3MekyZnTf2WgSVSL/5NjllJ/PEWthiyiXP4vLlMK7T/ub7rw6LhWHeTIu1VF/jpDgQOdcbKFHIuTkMajJwZHH0qxS4LgaQVg/y7J2qi7dKykhv6NDVyJOEF4LDUKEsOl5NVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5B9uRnoyM2WdShvKSaTramS52GrBHbrFBWhEmXjZWoI=;
 b=jEetHSW8sQPzpupxjiDsv6eXcqjEZWbzSvcZrmlnHflZjxibTsvG8lHPeT8iFFo3C0TyA43M7KM5oENTJvlTypnNvITj0frCooDMkC9TpsoG98i9xAIK5AnFiR/RlDXUHXpcCipn0DeY6kGWl9jqxihIFXyeqitIfGEKbMn6E77JQ9ZLpXTmsVnf/obQyNxk1LToW5RwCI+4wbBw613ydqAL2Zwyk5Do5cJskD7TJRlRxuSiBkas6aO5G6v3Um+fFUXAJnL9bl2znFPE8PpnblVpefUPy9TiAhevnzjuheJMnPV68wGn3ETd3UPbmm/GEb4gSyyCkaBaQCZTtRsorw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5B9uRnoyM2WdShvKSaTramS52GrBHbrFBWhEmXjZWoI=;
 b=KFPRfIMmc0ig3pdlMWTnNNl6YwlYlhfDCMTWa3vIV17SjR3uFC8HcQ5DxAEI1ZF8+05NRihq09/mMbU/X8yD1SINEdPBBcY0uWtM3a6S8JNncPkqhvrW6RLtO1skeffQjPi7anxYG/OYMpyaCOrRdkiU/lpcfU/QS6IoJfOocIfi+N0jQTwVxxfzTBp/NIyPmT+CvMD3FoxICTfzvk0m2Xf+1AuX+odBHN5EUVWL6h3Tf+pmVNMAbiaoNp1OnasMkkno5NDpcPIaaH4Ejx8l+3Nlb9SypJFh5Cf47G4xkYnE25yy7hPiwfnqlvoybssmfoErXz1PdahGF/g3rW1JgA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2891.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:18::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.13; Thu, 30 Nov
 2023 06:36:46 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97%3]) with mapi id 15.20.7068.011; Thu, 30 Nov 2023
 06:36:46 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Rohan McLure <rmclure@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v9 2/7] powerpc: mm: Implement p{m,u,4}d_leaf on all
 platforms
Thread-Topic: [PATCH v9 2/7] powerpc: mm: Implement p{m,u,4}d_leaf on all
 platforms
Thread-Index: AQHaIzioH4qwbXerd0KDhG7QDQvSVrCSaLkA
Date: Thu, 30 Nov 2023 06:36:45 +0000
Message-ID: <5accdfd6-d393-4ded-bb28-65eba4b96d80@csgroup.eu>
References: <20231130025404.37179-2-rmclure@linux.ibm.com>
 <20231130025404.37179-5-rmclure@linux.ibm.com>
In-Reply-To: <20231130025404.37179-5-rmclure@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB2891:EE_
x-ms-office365-filtering-correlation-id: e7f49d8b-8b06-430a-342c-08dbf16eb944
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  hvG/3B1MB5oyoIPhiFwjRe51/ihUyJV0PPFc7bL0borjKwRfXiu3SMPM9XXJvZbpbG8u78mvIcreIo80xuBdIvsBxk22rPyqntqYYZ3lg/bRVHxbKo9pC6A8WZ3GkzK15HiKHrlb5m9I+4PwrplzObUSSUfU6Qet3PjXjsma7pxaCfNkHvzRJX57EddHEJrfXUSZOCr0CwHYShHcBGISJb509rVM1ryZot7G3YfgKamP9P3PxUe9cBHRIT+OHBWq9LgQz3u7cgEDnFfYEWe19T2unRARq5uRhsso7lPiCN6fkIRSKO61lyMWMkf7qfGMgHigBT5FHixGn2/KMsvnihtHvFgCeB79ZkiIR9JtJAezGOQe/hi7faP4wGwkb92HNvQZk42KxOIIGBysGGgezoK2dS5nIKUfwPhOZAvq7sbTsUD9VQXQPglg3g+nyW8FB77/HJ10u3R/LHFWLU6Bs5gWF+G/OI0piPxILzri89cmGGm3lVEe6Egep0kzkBxYFjQiUHuzddNzmxdYz0KtECeTheQMOxjtUI/0MNifRabp89kHot5B9uBeTtvvg5vkTSjIe9IgCzeVExW1CAzYR3dx+em+S/B2vtuSu89RUTgXzieDBenBzkYuqL/mOhii2tImoFPwbU+/X/uyuBQWohNRddpvi6Flu5UsqtxGGMBLFygeRaGNcMi3rj3g5c6YrLg9PpKB6eqKwL+vkJjT42tvro/jQnwtgBpaHo2xreU=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(346002)(366004)(136003)(376002)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(86362001)(31696002)(44832011)(4326008)(8936002)(8676002)(26005)(122000001)(202311291699003)(31686004)(38100700002)(38070700009)(41300700001)(76116006)(91956017)(6512007)(83380400001)(5660300002)(66574015)(2906002)(36756003)(110136005)(66556008)(66476007)(64756008)(478600001)(66446008)(66946007)(316002)(2616005)(6506007)(6486002)(71200400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?NHFXSURUVlNZVXhrQ1Y0K0ZMRDRTVW1zR0Npbi9qalArbjJ6VE5TWXpzVzhD?=
 =?utf-8?B?dUNOU2phZ3dUbG94NVNZWlJNZW9oZ0dMRUdoT0JHekxjSlhObVlxMlk4L1FB?=
 =?utf-8?B?Vk84NGF1U0xDMStobkp0dnU1dUVBdjNTQ093alBKR1FmZWFMUFRDNkxKSG0r?=
 =?utf-8?B?KzFyM3Vzd21zWFkwTnJQL1g5Qk1mSGJRZWRFZkc0dWJSaVoveExuRXpzWjIv?=
 =?utf-8?B?ajhzamFSZGwrOXBNVXprTERxSTRUc2NURHFlNjlFNHRZZjM1WlVjYWRkM1NM?=
 =?utf-8?B?cVJyT01xMldVNytUTnBWemhENXNHaUYxcXBtaDdvSDF1M1NUZVE4ZVQ3ckxR?=
 =?utf-8?B?MG5BVE5KVFR6WEYrT2NmV3IzUjd3Y2YvaTMwR3NLS09kaXNaWVpyQkNabCtO?=
 =?utf-8?B?T1hLNWl0M0JFc3hFR0poU3JFd0lVSVBYbHd1MW1CQnE0aUs3Q3FwTGZ3Wksz?=
 =?utf-8?B?eTljNnBMcWJuNTZWNDhQc1I5VTdydVoxWUp4SnRxa2orU0tJOUtCaWMvcXBI?=
 =?utf-8?B?WnVyanVNd1dsK0pCMllCcGRQOWViYU9saWFWYmttYVVsYkE2Qk5IaEJucUln?=
 =?utf-8?B?MCt1Vm1uUWFPaFlzTVRFei9qRzRYN3BaV3pQVWd0YTcrRi9wU1JpZUpyNG9I?=
 =?utf-8?B?ajVDNmJzc0o5YzlvOUZlamMrQVlJOFJrL1Q1c2h1Uk1seHVPU2hOcUY3aUYr?=
 =?utf-8?B?anRiUktNWWV2VjdrSU55eVByRS9Ldm5IaTdtRWF4THUrelRBNFhMNkpLT0NK?=
 =?utf-8?B?S0srVHZnaUpyWVVQcklOSXh0dXluVTBwcEUxR2NoSVZkS2JHWlJia3dQRnYr?=
 =?utf-8?B?REdJTCtHVzdpc3RiVVhaeVNsSFZ5MjhuZnQxYytOMWhJQ0NDaUNxRzhhMHY3?=
 =?utf-8?B?ZThMTlV5aXQ1NjNUZ3RPM0t0OXBGWHRHOVRwbm1MSHlKSnhNbEJnTVJPdHdM?=
 =?utf-8?B?TkZuL3RJb2VacTdlaURSeHZNRmVVNnlvcnNBV0NKbEZaQkpLZUpTL3F5NzA4?=
 =?utf-8?B?SmcrdTVJOElnR09OK1ZwVUc5bDhXdFZhVXVrdlFwUGsrN083WlRWRytRNFJ0?=
 =?utf-8?B?YU5WcStrWkJTd2dNRkFXVVJpZG0wc2Z6NDhwS09nZXROcWJxSUVXWXZ0VzBP?=
 =?utf-8?B?VVJYYlhaR1pEVnhELzNWelpRbndENlloV3VtT1p0ODBsUWNVOWVVVlIwN1FO?=
 =?utf-8?B?S3NjLzFUNXhkUEdTdE5IT2ZSVEd3YXVrSUtseFNucnBmeFJzWE82bUlBdkZJ?=
 =?utf-8?B?YTMzcFpvaVlVaU1HWmlyZi81NFF2NTJYcjV2M0VVaW5nV243bUFLS00vcTFh?=
 =?utf-8?B?MUM0SFNQWmtPbTFGc1JITEl1OGUrQ2NaTThVaVpLeUxENXI4R0dWU09vUFdP?=
 =?utf-8?B?U2w1eHRyQzRLek9PcEdsOEtZbWd5RVphV3RmLzJyMGplRmNFSU9YcUg5V3g4?=
 =?utf-8?B?cGkvRm0za0c5Y2ZYSVVWSldRSjlnWWwzTU9QTURkQmpiYUdwOEluS0pka2F5?=
 =?utf-8?B?U3phU1AvdFZNSnBWb2tsdHBlTXZPbFNsa1p6RkphMk9lRXJMTmszVVR6Qk5B?=
 =?utf-8?B?VFd0c0Q3aXQwSWtZak9iaHdhQ3lTUy9qYjM4ZXpPMTV3Vjd6TWdkWU11YXBI?=
 =?utf-8?B?TEM3V3g2V0NHZURwZzlnOGlialVpeGgxZ0RPamgrNHY3WTUxelJWMmVxNDRj?=
 =?utf-8?B?NDhHbURDOGJTWk1nSEpjT1BodVVKbVQ5bDF2WHhPY1hpYU05NkpLZENPTWM0?=
 =?utf-8?B?VEZleVZHU0k3MEtlRFV6VVI2Sko0cmN4dmFHWDJoRVFCMDJOSkU0SDhKQXhD?=
 =?utf-8?B?SUlnV05OR2lWRS9BNW5oY0NVVEtqWmVVcDJFZjVlcHErSU1tb3hjVURJYlFR?=
 =?utf-8?B?VWFaKyt4bHcrMnI0OGZubzBvTlo0ZDd2YloxU0NoMlduZ0o0SU9Wc2xncTZY?=
 =?utf-8?B?eTB5V2FLWm9lYnZtdlAzWlJrV1RRV0NGSVIzTHVlbVU4aDRPY2ZGa0huQXMy?=
 =?utf-8?B?L01PQkswVXNnVHhKSTRnRGZzcUFob3NxeUV0dmpxcG1oRDJaT0l3TVBlcXlo?=
 =?utf-8?B?YTBMT3VaeFkwWGNBNUpVaEptbEM0cm8rV1BpaFdRME9zWGs3dVlTbUNFRXRn?=
 =?utf-8?B?bnF5UHpvUFZpc3lYNTc3a3VISnZiUk1NakJQdGJBU2MyZHlmWkpMalZSNE9q?=
 =?utf-8?B?NUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FD203DFE548BFD4783A01DABE547739C@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e7f49d8b-8b06-430a-342c-08dbf16eb944
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2023 06:36:45.9600
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7wrBK2rC0csFNqOwHtwcj3r0j6IjMlHMgiRQzHUhcDwo8N/1S3EKHdXgMt0tubctqUZ/3C0wtozrCM0GN980ggkNRgMIhYtldCQMmZeoR2g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2891
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

DQoNCkxlIDMwLzExLzIwMjMgw6AgMDM6NTMsIFJvaGFuIE1jTHVyZSBhIMOpY3JpdMKgOg0KPiBU
aGUgY2hlY2sgdGhhdCBhIGhpZ2hlci1sZXZlbCBlbnRyeSBpbiBtdWx0aS1sZXZlbCBwYWdlcyBj
b250YWlucyBhIHBhZ2UNCj4gdHJhbnNsYXRpb24gZW50cnkgKHB0ZSkgaXMgcGVyZm9ybWVkIGJ5
IHB7bSx1LDR9ZF9sZWFmIHN0dWJzLCB3aGljaCBtYXkNCj4gYmUgc3BlY2lhbGlzZWQgZm9yIGVh
Y2ggY2hvaWNlIG9mIG1tdS4gSW4gYSBwcmlvciBjb21taXQsIHdlIHJlcGxhY2UNCj4gdXNlcyB0
byB0aGUgY2F0Y2gtYWxsIHN0dWJzLCBwe20sdSw0fWRfaXNfbGVhZiB3aXRoIHB7bSx1LDR9ZF9s
ZWFmLg0KPiANCj4gUmVwbGFjZSB0aGUgY2F0Y2gtYWxsIHN0dWIgZGVmaW5pdGlvbnMgZm9yIHB7
bSx1LDR9ZF9pc19sZWFmIHdpdGgNCj4gZGVmaW5pdGlvbnMgZm9yIHB7bSx1LDR9ZF9sZWFmLiBB
IGZ1dHVyZSBwYXRjaCB3aWxsIGFzc3VtZSB0aGF0DQo+IHB7bSx1LDR9ZF9sZWFmIGlzIGRlZmlu
ZWQgb24gYWxsIHBsYXRmb3Jtcy4NCj4gDQo+IEluIHBhcnRpY3VsYXIsIGltcGxlbWVudCBwdWRf
bGVhZiBmb3IgQm9vazNFLTY0LCBwbWRfbGVhZiBmb3IgYWxsIEJvb2szRQ0KPiBhbmQgQm9vazNT
LTY0IHBsYXRmb3Jtcywgd2l0aCBhIGNhdGNoLWFsbCBkZWZpbml0aW9uIGZvciBwNGRfbGVhZi4N
Cg0KSXMgdGhhdCBuZWVkZWQgPyBUaGVyZSBhcmUgZmFsbGJhY2sgZGVmaW5pdGlvbnMgb2YgYWxs
IHBYZF9sZWFmKCkgaW4gDQppbmNsdWRlL2xpbnV4L3BndGFibGUuaA0KDQo+IA0KPiBSZXZpZXdl
ZC1ieTogQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1Pg0KPiBT
aWduZWQtb2ZmLWJ5OiBSb2hhbiBNY0x1cmUgPHJtY2x1cmVAbGludXguaWJtLmNvbT4NCj4gLS0t
DQo+IHY5OiBObyBsb25nZXIgcmVxdWlyZWQgaW4gb3JkZXIgaW1wbGVtZW50IHBhZ2UgdGFibGUg
Y2hlY2ssIGp1c3QNCj4gcmVmYWN0b3JpbmcuDQo+IC0tLQ0KPiAgIGFyY2gvcG93ZXJwYy9pbmNs
dWRlL2FzbS9ib29rM3MvMzIvcGd0YWJsZS5oIHwgIDUgKysrKysNCj4gICBhcmNoL3Bvd2VycGMv
aW5jbHVkZS9hc20vYm9vazNzLzY0L3BndGFibGUuaCB8IDEwICsrKystLS0tLQ0KPiAgIGFyY2gv
cG93ZXJwYy9pbmNsdWRlL2FzbS9ub2hhc2gvNjQvcGd0YWJsZS5oIHwgIDYgKysrKysrDQo+ICAg
YXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3BndGFibGUuaCAgICAgICAgICAgfCAyMiArKy0tLS0t
LS0tLS0tLS0tLS0tLQ0KPiAgIDQgZmlsZXMgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgMjYg
ZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNt
L2Jvb2szcy8zMi9wZ3RhYmxlLmggYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzMy
L3BndGFibGUuaA0KPiBpbmRleCA1Mjk3MWVlMzA3MTcuLjljYzk1YTYxZDJhNiAxMDA2NDQNCj4g
LS0tIGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2szcy8zMi9wZ3RhYmxlLmgNCj4gKysr
IGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2szcy8zMi9wZ3RhYmxlLmgNCj4gQEAgLTIy
Myw2ICsyMjMsMTEgQEAgc3RhdGljIGlubGluZSB2b2lkIHBtZF9jbGVhcihwbWRfdCAqcG1kcCkN
Cj4gICAJKnBtZHAgPSBfX3BtZCgwKTsNCj4gICB9DQo+ICAgDQo+ICsjZGVmaW5lIHBtZF9sZWFm
IHBtZF9sZWFmDQo+ICtzdGF0aWMgaW5saW5lIGJvb2wgcG1kX2xlYWYocG1kX3QgcG1kKQ0KPiAr
ew0KPiArCXJldHVybiBmYWxzZTsNCj4gK30NCg0KSXMgdGhhdCBuZWVkZWQgPyBUaGVyZSBpcyBh
IGZhbGxiYWNrIGRlZmluaXRpb24gb2YgcG1kX2xlYWYoKSBpbiANCmluY2x1ZGUvbGludXgvcGd0
YWJsZS5oDQoNCj4gICANCj4gICAvKg0KPiAgICAqIFdoZW4gZmx1c2hpbmcgdGhlIHRsYiBlbnRy
eSBmb3IgYSBwYWdlLCB3ZSBhbHNvIG5lZWQgdG8gZmx1c2ggdGhlIGhhc2gNCj4gZGlmZiAtLWdp
dCBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ib29rM3MvNjQvcGd0YWJsZS5oIGIvYXJjaC9w
b3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2szcy82NC9wZ3RhYmxlLmgNCj4gaW5kZXggY2I3N2VkZGNh
NTRiLi44ZmRiNzY2N2M1MDkgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2Fz
bS9ib29rM3MvNjQvcGd0YWJsZS5oDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9i
b29rM3MvNjQvcGd0YWJsZS5oDQo+IEBAIC0xNDU5LDE2ICsxNDU5LDE0IEBAIHN0YXRpYyBpbmxp
bmUgYm9vbCBpc19wdGVfcndfdXBncmFkZSh1bnNpZ25lZCBsb25nIG9sZF92YWwsIHVuc2lnbmVk
IGxvbmcgbmV3X3ZhDQo+ICAgLyoNCj4gICAgKiBMaWtlIHBtZF9odWdlKCkgYW5kIHBtZF9sYXJn
ZSgpLCBidXQgd29ya3MgcmVnYXJkbGVzcyBvZiBjb25maWcgb3B0aW9ucw0KPiAgICAqLw0KPiAt
I2RlZmluZSBwbWRfaXNfbGVhZiBwbWRfaXNfbGVhZg0KPiAtI2RlZmluZSBwbWRfbGVhZiBwbWRf
aXNfbGVhZg0KPiAtc3RhdGljIGlubGluZSBib29sIHBtZF9pc19sZWFmKHBtZF90IHBtZCkNCj4g
KyNkZWZpbmUgcG1kX2xlYWYgcG1kX2xlYWYNCj4gK3N0YXRpYyBpbmxpbmUgYm9vbCBwbWRfbGVh
ZihwbWRfdCBwbWQpDQo+ICAgew0KPiAgIAlyZXR1cm4gISEocG1kX3JhdyhwbWQpICYgY3B1X3Rv
X2JlNjQoX1BBR0VfUFRFKSk7DQo+ICAgfQ0KPiAgIA0KPiAtI2RlZmluZSBwdWRfaXNfbGVhZiBw
dWRfaXNfbGVhZg0KPiAtI2RlZmluZSBwdWRfbGVhZiBwdWRfaXNfbGVhZg0KPiAtc3RhdGljIGlu
bGluZSBib29sIHB1ZF9pc19sZWFmKHB1ZF90IHB1ZCkNCj4gKyNkZWZpbmUgcHVkX2xlYWYgcHVk
X2xlYWYNCj4gK3N0YXRpYyBpbmxpbmUgYm9vbCBwdWRfbGVhZihwdWRfdCBwdWQpDQo+ICAgew0K
PiAgIAlyZXR1cm4gISEocHVkX3JhdyhwdWQpICYgY3B1X3RvX2JlNjQoX1BBR0VfUFRFKSk7DQo+
ICAgfQ0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL25vaGFzaC82NC9w
Z3RhYmxlLmggYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vbm9oYXNoLzY0L3BndGFibGUuaA0K
PiBpbmRleCAyMjAyYzc4NzMwZTguLmY1OGNiZWJkZTI2ZSAxMDA2NDQNCj4gLS0tIGEvYXJjaC9w
b3dlcnBjL2luY2x1ZGUvYXNtL25vaGFzaC82NC9wZ3RhYmxlLmgNCj4gKysrIGIvYXJjaC9wb3dl
cnBjL2luY2x1ZGUvYXNtL25vaGFzaC82NC9wZ3RhYmxlLmgNCj4gQEAgLTExNiw2ICsxMTYsMTIg
QEAgc3RhdGljIGlubGluZSB2b2lkIHB1ZF9jbGVhcihwdWRfdCAqcHVkcCkNCj4gICAJKnB1ZHAg
PSBfX3B1ZCgwKTsNCj4gICB9DQo+ICAgDQo+ICsjZGVmaW5lIHB1ZF9sZWFmIHB1ZF9sZWFmDQo+
ICtzdGF0aWMgaW5saW5lIGJvb2wgcHVkX2xlYWYocHVkX3QgcHVkKQ0KPiArew0KPiArCXJldHVy
biBmYWxzZTsNCj4gK30NCj4gKw0KDQpJcyB0aGF0IG5lZWRlZCA/IFRoZXJlIGlzIGEgZmFsbGJh
Y2sgZGVmaW5pdGlvbiBvZiBwdWRfbGVhZigpIGluIA0KaW5jbHVkZS9saW51eC9wZ3RhYmxlLmgN
Cg0KPiAgICNkZWZpbmUgcHVkX25vbmUocHVkKQkJKCFwdWRfdmFsKHB1ZCkpDQo+ICAgI2RlZmlu
ZQlwdWRfYmFkKHB1ZCkJCSghaXNfa2VybmVsX2FkZHIocHVkX3ZhbChwdWQpKSBcDQo+ICAgCQkJ
CSB8fCAocHVkX3ZhbChwdWQpICYgUFVEX0JBRF9CSVRTKSkNCj4gZGlmZiAtLWdpdCBhL2FyY2gv
cG93ZXJwYy9pbmNsdWRlL2FzbS9wZ3RhYmxlLmggYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20v
cGd0YWJsZS5oDQo+IGluZGV4IDkyMjRmMjMwNjVmZi4uZGIwMjMxYWZjYTlkIDEwMDY0NA0KPiAt
LS0gYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vcGd0YWJsZS5oDQo+ICsrKyBiL2FyY2gvcG93
ZXJwYy9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgNCj4gQEAgLTE4MCwyOSArMTgwLDExIEBAIHN0YXRp
YyBpbmxpbmUgdm9pZCBwdGVfZnJhZ19zZXQobW1fY29udGV4dF90ICpjdHgsIHZvaWQgKnApDQo+
ICAgfQ0KPiAgICNlbmRpZg0KPiAgIA0KPiAtI2lmbmRlZiBwbWRfaXNfbGVhZg0KPiAtI2RlZmlu
ZSBwbWRfaXNfbGVhZiBwbWRfaXNfbGVhZg0KPiAtc3RhdGljIGlubGluZSBib29sIHBtZF9pc19s
ZWFmKHBtZF90IHBtZCkNCj4gKyNkZWZpbmUgcDRkX2xlYWYgcDRkX2xlYWYNCj4gK3N0YXRpYyBp
bmxpbmUgYm9vbCBwNGRfbGVhZihwNGRfdCBwNGQpDQo+ICAgew0KPiAgIAlyZXR1cm4gZmFsc2U7
DQo+ICAgfQ0KDQpJcyB0aGF0IG5lZWRlZCA/IFRoZXJlIGlzIGEgZmFsbGJhY2sgZGVmaW5pdGlv
biBvZiBwNGRfbGVhZigpIGluIA0KaW5jbHVkZS9saW51eC9wZ3RhYmxlLmgNCg0KPiAtI2VuZGlm
DQo+IC0NCj4gLSNpZm5kZWYgcHVkX2lzX2xlYWYNCj4gLSNkZWZpbmUgcHVkX2lzX2xlYWYgcHVk
X2lzX2xlYWYNCj4gLXN0YXRpYyBpbmxpbmUgYm9vbCBwdWRfaXNfbGVhZihwdWRfdCBwdWQpDQo+
IC17DQo+IC0JcmV0dXJuIGZhbHNlOw0KPiAtfQ0KPiAtI2VuZGlmDQo+IC0NCj4gLSNpZm5kZWYg
cDRkX2lzX2xlYWYNCj4gLSNkZWZpbmUgcDRkX2lzX2xlYWYgcDRkX2lzX2xlYWYNCj4gLXN0YXRp
YyBpbmxpbmUgYm9vbCBwNGRfaXNfbGVhZihwNGRfdCBwNGQpDQo+IC17DQo+IC0JcmV0dXJuIGZh
bHNlOw0KPiAtfQ0KPiAtI2VuZGlmDQo+ICAgDQo+ICAgI2RlZmluZSBwbWRfcGd0YWJsZSBwbWRf
cGd0YWJsZQ0KPiAgIHN0YXRpYyBpbmxpbmUgcGd0YWJsZV90IHBtZF9wZ3RhYmxlKHBtZF90IHBt
ZCkNCg==
