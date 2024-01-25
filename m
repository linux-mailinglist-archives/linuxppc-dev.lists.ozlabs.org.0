Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4567183C87A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jan 2024 17:47:06 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=iVj/Os3j;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TLRZ01bTcz3cWS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jan 2024 03:47:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=iVj/Os3j;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:261d::600; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:261d::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TLRY86knDz3c96
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jan 2024 03:46:19 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gsS0w/yQgT0S0GvinA//fUbVLlcevzhpJMeniqUSqJa819UNQFkz1THggFNogm327FONK6wQ66l8Ni0M2fDnXOFavzG29lKt7AswGe3NIP7uu/Mbj+WZCmTZsNSTUhRjMLrgjNH2Wtodpai6jkYo6vg3jfbxyq8bES5NKQTqfH/SYFU/QFyQLMiNeW4ApCCMuCJgCNphV/XD1W/eesFeAy6vD57hM5euC4C1QBDUzFvgIXciHL3349p4jbay6kWerEgYj+LIFa4eg1MG2uOeDvPD3toDo7omL9iQc1wxP5ufla7RYyKfcbIDtifPLVMPaGZvIzj6UfztQdihJ81iDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gPYxP9Eo33Kwdrb5snvs95Fjl/UwnJEIgi54fMDY7m0=;
 b=jk+rS/l7L7KrMJrhh/1yCz0vM5N6PC42B3HkLpOAwaO0G/UE8H5ghLPgphqSrn32cEeR09e/kLw+yGTN1nfKK3Z7hryz1piV5dELpauRsB5nwrZwZb6TxfjpypbFec92xbC3Ub5UWKszItfevdx4ydx+u9941txbDNTqe03fqv+jf/LS5ng7+d188W6ZxirXVAF8RDiyROAAtDbMWUO+liBzZk5vq6gwiDQ0zvSYU7pnjEc7KoZBYW5NUkZzuW34XXO+jrVefSCHW8gVOjrWMCeoURgmr36akdtnXqYKCJLzgSmRkjCcg+OjowJRGYg8CnvWUgeANEaSRKRb+EGXSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gPYxP9Eo33Kwdrb5snvs95Fjl/UwnJEIgi54fMDY7m0=;
 b=iVj/Os3jtBsfCl3rdspI1+tyr4I3RIOz5ISGH4C+z/MQ5ZnryICLFfjQhPxMyXJnRBtjXKmztufqecnZomEu0GzGaUA+lzw4eG2/zxlSXLr3FVTmO/AqNhODsqpBbwO7I6E9/brbkUKNqbY1Q2OazjgXf6wWbG5WrwWhP5RzIzUzQ6GzEUZORXORUqug/uTSoLbfdbF4iHfNz48AlU+tyHtrN7M2ZEdUrcc0yChdZjInlsneGPgpDQ+pKOhQLURl8FmukUJAZYHYG8fLGm/zUIXvxIaQe03t0W7Zo5oPPzxuCe3JrBVvCmVG5lJzlZvxZoDiZyIqnUngcsLZtf3xjA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB3239.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1d6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.26; Thu, 25 Jan
 2024 16:46:00 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9f77:c0ff:cd22:ae96]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9f77:c0ff:cd22:ae96%4]) with mapi id 15.20.7228.026; Thu, 25 Jan 2024
 16:46:00 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Nathan Lynch <nathanl@linux.ibm.com>
Subject: Re: [PATCH 8/8] powerpc/rtas: consume retry statuses in sys_rtas()
Thread-Topic: [PATCH 8/8] powerpc/rtas: consume retry statuses in sys_rtas()
Thread-Index: AQHZUHNzvgETCt3DKkWwO9y8qB7dhbDsrNYAgAAK1QCAAANfAA==
Date: Thu, 25 Jan 2024 16:46:00 +0000
Message-ID: <316c43e9-cffe-46fc-b21f-50596bcd60aa@csgroup.eu>
References: <20230220-rtas-queue-for-6-4-v1-0-010e4416f13f@linux.ibm.com>
 <20230220-rtas-queue-for-6-4-v1-8-010e4416f13f@linux.ibm.com>
 <33ca48b8-f847-4d2b-b95f-741f0e082d2d@csgroup.eu>
 <87wmrxqsnh.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
In-Reply-To: <87wmrxqsnh.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB3239:EE_
x-ms-office365-filtering-correlation-id: 2ac1a305-c4a0-4804-0efc-08dc1dc51c59
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  pyWFhPFG8/kFTkYgW7/aXMYGaBvppXeFujPCsdkQkoSl2QEhDkcAT0SwBWuToE1cMAmCxnLwRcX7k9sFvRV60nStvlXf3O8YdS1lNZGEVcKdew4FoqoQNqslzzFOXwg9maiGdSCFlapxVKw1a1yT1chaKVxp/Adg4Mc99lLdLx+es9rXz9cN+gEADvfh/jjyTz8cB0WmloMMKQfI3JeB1t9gDSL0rpASRhr4bv/+XoIAHqiEnmPsnIJhYqvG7kIZOsvUr90gPdDjgS+rqEvObbivxc31QdHYVeQjUy/m/EHa6FWNNsQfsLCrRWpdLurd5mjGItS0PgUN5GZ7aX8qUvW8o69HebRywcHo4zEEgocKtclPSnjsL9K9zGJxM9KM38GnhFMbo+hYJ4joGTaTjX3N7E78KvoaBX/bW/LXZ6SYBW7piSvKoJNb1Bcrv1BP0qGJFLMtfpBZNake4iX+kB0xa7jOF+zthvLGLOnklfqQ9gBy/XQ2rUokvrwj6ESUTL+Bu/alXin0/TsjEQh+WkUgDEYZb5kEUn4Z/DYEPK6eDV7ELj5sbFnVJW577zy/TfT6Y7iwpyuKpP41mEqYh4ub5mdBjxpWAm72jv9yE3IN3MftltuLnhek3jbPC37S9EM63C0iXoHqqx5orirxSotu8wir+q5P4La2Bu4d+TA=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(346002)(376002)(136003)(39860400002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(38070700009)(31686004)(83380400001)(5660300002)(8676002)(44832011)(66446008)(76116006)(6506007)(316002)(6916009)(966005)(54906003)(64756008)(91956017)(66556008)(66476007)(66946007)(71200400001)(2616005)(6512007)(478600001)(8936002)(6486002)(4326008)(26005)(122000001)(38100700002)(2906002)(36756003)(86362001)(41300700001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?clNMWkdIZkcxMlU2VGN3RENxaW5JL2JCOEpYNWd2T2kvcy8wd2psaHBkUHo1?=
 =?utf-8?B?aTVpVUdkbFA4ZkxFL2RNWDZCcUJGTG9yS0ZNMkVsUmVZN2JGcVhQSE5hVlhK?=
 =?utf-8?B?alV6blZ6UEVPNlBwb3VYVGhzcG1zTFI0WktQckVtUCtIZm85K2FoSWYra3lZ?=
 =?utf-8?B?aGhLd0p2M2VkTll5Uld4eW4vSmFYTGhxOW56NlQyRzFETDhWcmE1UE13Um5l?=
 =?utf-8?B?V2NOU2FJcmMxcmhicFZGUWRKVGp2OTRUeWlURlF0WThUWEtha1RsUFFrWm1X?=
 =?utf-8?B?WTY4a01sSEZFaDRwT3l4aVFJdms2WHVhVnZVTnJ2MDBLbHdaVEZjSWdMZVM0?=
 =?utf-8?B?WDNzT3hMekxoQU5PcmY3SHhYNU83OXlma1NVQ3FJQWlxWW0rcDRaU2ViWnU0?=
 =?utf-8?B?SnRicmkwRFIvS2phVHRnN1ZlUmJpT3hVK1pRNE1vZU05ZFJTY0dJWjFUMWFs?=
 =?utf-8?B?bVVnSENJSFhNRHNnZmlxYlFOTlVmUWovSUhaSXgzNlg3NDhtdkRUaERCQ2ZE?=
 =?utf-8?B?anhHZUJzeHBheGMvZUJOU01hNGYzdnRpZ1JYRytmZlBjekRIYjlaTHZTbmVU?=
 =?utf-8?B?TldoNGZGc1d0ZVRDRnlxQjlOTHVzYjJORjY5L25vZmVBclRPVjVQdklLb1M4?=
 =?utf-8?B?NUsxZk5qbWxURWI0b3JYRm1RN0hpTHpXaGdQVVBQRFkxVWNweEhWYm16cDlN?=
 =?utf-8?B?Z1N1d0FObjRsM25LS29Nc2FrVGxYazNxdTdzK3VMcWROc3kvQm1hTStVNWsr?=
 =?utf-8?B?d3daM1R1b0tKVnpmN3FROTN5ckVjamRJT1B6Q3M0bElWNzJMZVhwc08vUkx1?=
 =?utf-8?B?NjRSSUhCUEoyNU5Ia2dDQVdmTlJBYXYyL25XdnB1SDAxbE9JcWJua2dFVU00?=
 =?utf-8?B?cXEveEJXczEybzdvVExTTVM5MUZrNGRiMnp6d1NIV3Y1SUI5bStvck9rMnR1?=
 =?utf-8?B?Q3RRT1d5dVZPTlR3R25pTVZLSCswTlJtbnNISGVrZmliMmVBS1ZyVFM4RFNt?=
 =?utf-8?B?WkJKMHZGajVIVkpRUjhZcFlKZXFkMVZlSDN0bGExUGxaOGp4TXZ4Wmc0Mkcy?=
 =?utf-8?B?N3pMNi9CaGo2b1hnbnNLRWlJaVYxY0FMamROWm16OU5ZdjRlYmEzZit3Umt6?=
 =?utf-8?B?VExXS1BXOC9kL21WVVhOV05zRUdkYTdCNVVDSXhGbmlaY3RGaTdJVjloY2Z0?=
 =?utf-8?B?dGRuSXpJdFVtcm9VMndqdURuQW42WGxINy8xWDBVelNtcGFoa1lmRHI3SU11?=
 =?utf-8?B?YWpOYTZNaEhvakNIL05ycTU1NzJpekwwVmxVdmFYMjJzNUYrWWVpWHlVWjE2?=
 =?utf-8?B?RGtQemp6RVhNc1ZCVkRKY2tBaTF5SGl1WDEvVnFza2hENjI4MVJYVzdGSytT?=
 =?utf-8?B?ZmlYY0o4MkVDQ1RHNDJmbHZVMWFadnBUZTFBNlZZMzZBK2ZuR0ZLN2RELzFo?=
 =?utf-8?B?OXdQcE94Y0ZKUmgxYS9sdkFyZjV4a2dEMHFwU0h5TVBNUmd4eERPejJrYmhj?=
 =?utf-8?B?WWw2SVVrSExidUdzL0ZjZWd4ajFWL0VWV2ZsZkYxQVFKb2NibkZPR2pzVmM5?=
 =?utf-8?B?cDlYK29tZmw4Y2ZpYk0wMVMvQnJlSWxPQW4rbTZZSWRQNG5mV2tyWlVQNEx3?=
 =?utf-8?B?cXF5c3hLcUduUTJ0bjlLWW0xVVUybFpmcjh1OTlUNXRGaEZMOHFOcmM5WTZL?=
 =?utf-8?B?NERyTkhSVW8wSUhORXNzRnRWS1RyOTNwU3FvRjNLUGlydUNTaDB4WW1ja2tH?=
 =?utf-8?B?NnRRaVpoMWdqd0NnbmFnd1hvRkxYaERHd0o5OGEyc3JqZzg0eFBSeXo2WnZJ?=
 =?utf-8?B?YnhPYXR0aDM2Q0RSWGJsZDF2NjZQTGFndVoyM205Y3VINzF6ay9tcXhXd01u?=
 =?utf-8?B?MjNMS25zQklSQ3E1dERyNjR2MGtCTWt4ZHEzWm9tUGU3T1IrR2Vkbi9GUW5l?=
 =?utf-8?B?c3J1YXBsdkJXT2J5cDNjL1NZU01qNHM3Mm56bzNLSVdaQjJhYnQ3S1VhN1Vv?=
 =?utf-8?B?SG5vaHlWQWZLK1JxVWQyR3d3bG1JQ0RtZ1dReERGRk1vYTFIdTlyMjBWcVJt?=
 =?utf-8?B?UEsrTHp2bWhPdEVQVFJoNmRpc25IS3VJS0JxbjQ1bXJQSyt0MTNhd1RkUFNk?=
 =?utf-8?B?RjZaVjJCRytlRTQzdWllaGhSbnkyS0VhTUh1ODNsUkJHTXZmZmFYNTBPdEhS?=
 =?utf-8?B?RGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4EA7D5E2AF23FC4CB6B0D7543976E5E8@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ac1a305-c4a0-4804-0efc-08dc1dc51c59
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2024 16:46:00.0628
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0oX6iFI0ToUAqAB5tIyyfRxei5NhDiMuhvFPKFLeSI1a6RNM85UtbyWPzaaxn4fD5ZNms8ztEm7Vc+m8xVlFW+ib+b/IXVqnn9RPYSW1c9I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB3239
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, Nick Child <nnac123@linux.ibm.com>, Andrew Donnellan <ajd@linux.ibm.com>, Scott Cheloha <cheloha@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Laurent Dufour <ldufour@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI1LzAxLzIwMjQgw6AgMTc6MzMsIE5hdGhhbiBMeW5jaCBhIMOpY3JpdMKgOg0KPiBD
aHJpc3RvcGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+IHdyaXRlczoNCj4+
IEhpIE5hdGhhbiwNCj4+DQo+PiBMZSAwNi8wMy8yMDIzIMOgIDIyOjMzLCBOYXRoYW4gTHluY2gg
dmlhIEI0IFJlbGF5IGEgw6ljcml0wqA6DQo+Pj4gRnJvbTogTmF0aGFuIEx5bmNoIDxuYXRoYW5s
QGxpbnV4LmlibS5jb20+DQo+Pj4NCj4+PiBUaGUga2VybmVsIGNhbiBoYW5kbGUgcmV0cnlpbmcg
UlRBUyBmdW5jdGlvbiBjYWxscyBpbiByZXNwb25zZSB0bw0KPj4+IC0yLzk5MHggaW4gdGhlIHN5
c19ydGFzKCkgaGFuZGxlciBpbnN0ZWFkIG9mIHJlbGF5aW5nIHRoZSBpbnRlcm1lZGlhdGUNCj4+
PiBzdGF0dXMgdG8gdXNlciBzcGFjZS4NCj4+DQo+PiAgIEZyb20gdGhpcyBzZXJpZXMgd2l0aCBz
dGlsbCBoYXZlIHBhdGNoZXMgNSwgNyBhbmQgOCBhd2FpdGluZyBpbg0KPj4gcGF0Y2h3b3JrLCBz
ZWUNCj4+IGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9saW51eHBwYy1kZXYv
bGlzdC8/c3VibWl0dGVyPTg1NzQ3DQo+PiBhbmQgcGF0Y2ggOCBkb2Vzbid0IGFwcGx5IGFueW1v
cmUuDQo+Pg0KPj4gQXJlIHRob3NlIDMgcGF0Y2hlcyBzdGlsbCByZWxldmFudCBvciBzaG91bGQg
dGhleSBiZSBkaXNjYXJkZWQgPw0KPiANCj4gVGhhbmtzIGZvciBjaGVja2luZyAtIDUgYW5kIDcg
Y2FuIGJlIGRpc2NhcmRlZC4NCj4gDQo+IEkgaW50ZW5kIHRvIHJldHVybiB0byA4LzggKCJjb25z
dW1lIHJldHJ5IHN0YXR1c2VzLi4uIikgd2hlbiB0aW1lDQo+IGFsbG93cy4gU28gdGhhdCBjb3Vs
ZCBiZSBwdXQgaW4gImNoYW5nZXMgcmVxdWVzdGVkIiBzdGF0ZSBJIHN1cHBvc2UsIGJ1dA0KPiBp
ZiBpdCdzIGVhc2llciBvbiB0aGUgbWFpbnRhaW5lciBzaWRlIHRvIGRpc2NhcmQgaXQgdGhhdCdz
IGZpbmUgd2l0aCBtZQ0KPiB0b28uDQoNCk9rLCB0aGFua3MgZm9yIGFuc3dlcmluZywgSSByZWpl
Y3RlZCA1IGFuZCA3IGFuZCByZXF1ZXN0ZWQgY2hhbmdlcyB0byA4Lg0KDQpXaGlsZSBhdCBpdCwg
d2hhdCBhYm91dCBwYXRjaCAyIG9mIHNlcmllcyANCmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5v
cmcvcHJvamVjdC9saW51eHBwYy1kZXYvbGlzdC8/c2VyaWVzPTM4MjE5NSZzdGF0ZT0qDQoNCkNo
cmlzdG9waGUNCg==
