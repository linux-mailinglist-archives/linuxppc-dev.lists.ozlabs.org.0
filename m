Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFCD4C46F8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Feb 2022 14:55:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4rrH0nD2z3cNv
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Feb 2022 00:55:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K4rqn2lFPz30Pf
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Feb 2022 00:54:45 +1100 (AEDT)
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4K4rqm3cTVz4xcZ
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Feb 2022 00:54:44 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
 id 4K4rqm3Z7rz4xml; Sat, 26 Feb 2022 00:54:44 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::604;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0604.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::604])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4K4rqm08zdz4xcZ
 for <linuxppc-dev@ozlabs.org>; Sat, 26 Feb 2022 00:54:41 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RorJRJ/3Fdt3W1E0g7jcWXPXrXrnw93G8DowTs1EFAOGiZ4DTYdQbsZkXzfy1tJTtb5Qvmvvoq6aO0bfQia0QNY4nygxjuxuY1rdjZ4GgBBP+EHIkFDre/eH2yaS75nEQwsEFzmncVpf165NnknxAiBQBqvBweorvaEJEkEEEyLpj6LmJR2CGH8nvEa5WeA7KaoCeFoV9JSbHerRKmjswr/NYOXwkCRhV9Rh+KTdIHGD7FU+22HPr895jStX2AryKH5FAc5qdadIRO8q/aNPDGZ3wo6iiCx4f0FvF6Bz4kg+0cNjMEN2yRQWYU9nQa6wYfFrTUc6lhmf5VH6exJo9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y2FvkaFFp811LJ07I5XN29HO1mvREkxfBZK4eIhPKBA=;
 b=CFCpiBRfdV6X5d41l4u8tsM4kQgtCNt102LvnyUMZxTsTlZ7w2cLwfb5IX/Eku52cGLhJWmFgpteYzcmqT4zMiztHnBAk2QEDYo1DppPkyyGlqzGWDvN7JqSpd9xYd0E8+c+IooRTtkdc7K5IQPJ7bBpj4PU5pe4uTqk+hOIQrrLBqB3rIM/yIPUEytZi1eEa4iRYMuhg/RWmbTCl7qmyAyre7WXUkZcWziqp89155iXP5ohrv6bUndldd2n5c13O9gzRmMqTdAP1HvWf8bY+tcjbxUKLuKHT5sVEW2rwKb96XB0CVwkPY3T6tyYDfeiC4nA7gl+/VhTQOYhzgplSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB3222.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1d5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Fri, 25 Feb
 2022 13:54:33 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8142:2e6f:219b:646d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8142:2e6f:219b:646d%5]) with mapi id 15.20.5017.025; Fri, 25 Feb 2022
 13:54:33 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Mahesh Salgaonkar <mahesh@linux.ibm.com>, linuxppc-dev
 <linuxppc-dev@ozlabs.org>
Subject: Re: [PATCH] powerpc: Avoid nmi_enter/nmi_exit in real mode interrupt.
Thread-Topic: [PATCH] powerpc: Avoid nmi_enter/nmi_exit in real mode interrupt.
Thread-Index: AQHYKjICtcwW5fJ9DE2rof2xv5uoBaykSgkA
Date: Fri, 25 Feb 2022 13:54:33 +0000
Message-ID: <85f9c728-6355-5d7f-255a-c2d9e0b5efa5@csgroup.eu>
References: <164578465828.74956.6065296024817333750.stgit@jupiter>
In-Reply-To: <164578465828.74956.6065296024817333750.stgit@jupiter>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b0424cf0-2a58-4cb6-ac83-08d9f8665a88
x-ms-traffictypediagnostic: PR0P264MB3222:EE_
x-microsoft-antispam-prvs: <PR0P264MB32221570E67CF8831301F0AEED3E9@PR0P264MB3222.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gcJKdmxuu6crjVlBXhZ43hCjSsB8yDz9enpA9kBm3AmQbRd7+G9/1HTee4xIqOJT43uOjX0H4lg7N4oODXsT9NolgJwigEGDXO885Hp1FQoLqpYAqV5WhkpSYy8ogYE0PwCfYJBmK9E4Nux2brnjt+IBo3s/Ae1VhfWuW/+GrHRqLbxMLHPfTDEewtJaMKqH+va+2dLk/qJW3rS1pqcCQGi3nC3hhYhEimoXp5woH72ypyJh1ACWKCjB2VdND97CTNc0p4jJ6ilj9MQQoiOwApI0Z2UvnXP6nOuWHf0R3jK9vWxOFK0TCL4NaBbijKFkhxnrw8HgxaBwh0u5eCbWxlKKNz+nSMCwz4ttJOvRXf9kEpv4xT/wK75HTl3dvkO0uhxhEXpS5g8dvgWv/smYr59gxdITfysvntXAYp84TfMnqtNdqcI+Q0og8A2Ly2y6MZb08z3XdHGQ+9M2/y0m/gyAyzgocZkvseYoRg4MQIwnkvFPCXlbnjIIvEjRnrI91BGPCacFI7St/3HcBLyTepAUrUcqPt/MQJAzkyj4fhTCcrTLzbGstFB8cKzIrXQIARMLnXnPl3rLXFbVHUneozucO+zZCFDViJ5/4EE+KIjveN4+Tw2tWkyygEHCas9BWd5puaBRhI5rR28qf31nw4Mt6uQ+yEeVxa3jrNEDi6VageUhTCzbAFqdtr+aKJ0hOKDsHZLXNUH3o/PNcaNsyLf7S4yQD4d71g7Uajn/iSu3/eB5Obo9FYPOCXeUTFdxDxACBCLG1ySK4tbdzcS+cA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(64756008)(186003)(83380400001)(66574015)(38100700002)(2906002)(44832011)(76116006)(66556008)(71200400001)(66946007)(66476007)(66446008)(31686004)(4326008)(8676002)(36756003)(26005)(31696002)(6512007)(8936002)(508600001)(6486002)(5660300002)(316002)(2616005)(6506007)(122000001)(91956017)(86362001)(38070700005)(110136005)(54906003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Nmd2TmxUS3UxajROcENrdXlrQzltS000STFKdEpvSzVnemxLL2ZuODlWQVQ4?=
 =?utf-8?B?bjlPc1ZPUEMwQzBTUklscU1IOTlWVW81MERyVy9kMVhvMSt1QVpxZTdXTjUy?=
 =?utf-8?B?RE1UYjBSRGphQ2ZPWXc4N3o0NDMrQVhFeDlWT2djSWxaMVNDamIveVFEZGNO?=
 =?utf-8?B?LzF3cjdUUFh1Y3dVN214c1I0Y0VmbGp0WWJub2VENW5pZUh2b1BMZHlhQ2wx?=
 =?utf-8?B?Q0xVNlJERE0xK3Jad3F4MGk3NEw1ZUd4T0ZLbGdRU3dYQzcxMVg4M0ROa0FM?=
 =?utf-8?B?WkVKdk1FdzI5SHpabmJGNU5OaGFwUndmZFVWMnNkZDZuNHV1U0Q3dGdQbFJ3?=
 =?utf-8?B?UDRFaUZML0ZGbWMxK1RscTlQLzRYR2RhMldVVE4rNFJpQndpUWxxVDdDTS92?=
 =?utf-8?B?RXJyNFhaM2lSSVFWc1JnMldQbFFBbFJKT1NxQzdPNUpoc25sYmxnc0QyN0VZ?=
 =?utf-8?B?U01FcUFGN05IdkZOMmZYTnpYNzV4VVh4enlmN2JvOUdSZnJiZVd6MkF4L3hD?=
 =?utf-8?B?T1g2dzVBSXp5STROMDFRR29HWFFzdmFVT1MzRnZpc21valJ3dzh3UnpDQ0R1?=
 =?utf-8?B?MDNROE5SNnNQQWNLcG42YXQvaDZtNS9PL25MaG1PQzdib3RYUktvREpIdGNI?=
 =?utf-8?B?dGNaWUhnYlpoa1ZJM21rTUwzaEhrQnNIalpoUmFGclhoeFI1aUtTdHVZdzBJ?=
 =?utf-8?B?bm5ieXh5VzlFMW9YdXREdG0xTWc2WTZvWkMxWHdTNEFWWWxtRGZiM3I5ZWtR?=
 =?utf-8?B?azJ6VDVwd0JsVkg4WmFFZGpLa3ZvRUxGbnArQnBmOXhEeUhGVjlNOGx6b01v?=
 =?utf-8?B?NEg5Z08wYk1nbnVXcVpxbC92YkMvaTJTbXY0K29ycjNGV0RuRXNzTUx0SVEx?=
 =?utf-8?B?cmw4NE5RQnNwWGJuSWpiTU5ON1ZrcDdWSzNJb1NJbjkyQytiUEorb2w5dWRN?=
 =?utf-8?B?OWlIVHJIY3dFdG90ZGQ1YTNvVHJ1Z2NFUk9aRXdDQ0RhajlpdGM0dWhvSlN5?=
 =?utf-8?B?MXhsa0ZrUlloTytBTDRBdDJ3VDZVWmkxc2o4TjlDNVJLbHZSd3NpK1ZPZDg4?=
 =?utf-8?B?QS8xWWhPaVIvUGx0K0RaQm1Lb2IxRldkcllJcDhDODBpSTlsNjZuemNRdWxC?=
 =?utf-8?B?RGRYcnVOYnBMWm9ZbEs1MWdSM0hmVVVKcUlacnBJOUlaNUpPVEszTjBQQkRj?=
 =?utf-8?B?RENEOU5ic21UbjZuM1RQcUdjVWVrOUZic3JWUm5RZ2h6N1YweVJvSFJOaEJF?=
 =?utf-8?B?Y1BVcjlIWjJmWWZsYmdjQXMyQUF5U1FKRllEMlVYWmk2UE9iWTM0eFRDd1V5?=
 =?utf-8?B?YU9RaWM0WWhWOUFpRWFrQUVrN05ZRzJURDJHVk1UMEp2L3NmUVhHdjlpZUQx?=
 =?utf-8?B?czNKbWZuQU9ZU3Z3c2lhNHVIdlNvVzQ5Y0VkTDh1MU1zd3U1MG4yRWRXRzZy?=
 =?utf-8?B?cDJKdEY4eExsSEFWRVBMS0ZJYlE2QVlXQnlQK05qRVF5V1BzdHJ6dy9yRXpR?=
 =?utf-8?B?R1UvNWZITDFFbUdVWVpQZnNtcHN2cHdmRE5XakRIdjluOUQ3Yk50TDU1aElK?=
 =?utf-8?B?ZU1wVHZwQ2RsWDlmQkJyeXpyNWczYytNTmdpVkRSY1pUUGVKN1FSS2w4M2kz?=
 =?utf-8?B?WlNIZVF4eVIxMnNERTlPVEpwMmNFTjhGc0xaWXFKUnFEYWp0dTB2K2ZvSUNl?=
 =?utf-8?B?UXBPOWVnUTF2OXVpQUJqZzRlYktpeTZoWGFoMVVOTXhiUFZmMGFlRmJCL0xi?=
 =?utf-8?B?SVdJV0xmNGtJWk9pRkxSV1hzZXVvL2l6SWZQWFlGa1lBZ3VpMDZBZmFQcWZh?=
 =?utf-8?B?OU1YN3U0YVpSOThCYlhlWHQ3OXdDU1p3UndGUFVweFR3K214OExUTnpmWTZ4?=
 =?utf-8?B?UXBQQ2NueS9HbHQ3YXdnd3lvUDdwbzkzQWd2V2tnRE9rb29kR2U4d3dNWnY0?=
 =?utf-8?B?Uy82ZU1tdWNHOGNpRVpiTWV3TEErWjhqOEZVaTZRRlkwek9aaC9JMnZ1TER3?=
 =?utf-8?B?RUh2TWNGbm56NEt3N1l5M0RJSERkRjdBWE5ZS3NzSmJpVEwzeTFCekpza2JW?=
 =?utf-8?B?aW1ZQVQ1aUJDYnZmQ3Avb3crRkw5a3ZadG1IRFN5ejJpZnZVcjFDM0R4aURa?=
 =?utf-8?B?ck14ZkJURWNSSnh6dk0yQ3B3ekVURytEalF4MmxHSkZiZUQ4cXk1WS9uWDdu?=
 =?utf-8?B?TENGeDIrbUc0bEVlcEptSVV0QlpDZ2RqL0xaSDRZazF2VUVySjh4QjlTRU1w?=
 =?utf-8?Q?5e35hWyjhljrULC5ZEaqH/e6M/iFPZ1wj3cYASzjhk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2B7750F8632E4D4CADFEB35A7C6267D7@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b0424cf0-2a58-4cb6-ac83-08d9f8665a88
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2022 13:54:33.8425 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5GEr1EJJ94HWMUp6Iu6g97MgiMm2v3uV8X1lAUXCaVpCQouWb7aYbE0nHT/Lp+2UnIuJOfbx7ctsTVARMRUNf6tE+egYfQKKZm/MTInFee8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB3222
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI1LzAyLzIwMjIgw6AgMTE6MjQsIE1haGVzaCBTYWxnYW9ua2FyIGEgw6ljcml0wqA6
DQo+IG5taV9lbnRlcigpL25taV9leGl0KCkgdG91Y2hlcyBwZXIgY3B1IHZhcmlhYmxlcyB3aGlj
aCBjYW4gbGVhZCB0byBrZXJuZWwNCj4gY3Jhc2ggd2hlbiBpbnZva2VkIGR1cmluZyByZWFsIG1v
ZGUgaW50ZXJydXB0IGhhbmRsaW5nIChlLmcuIGVhcmx5IEhNSS9NQ0UNCj4gaW50ZXJydXB0IGhh
bmRsZXIpIGlmIHBlcmNwdSBhbGxvY2F0aW9uIGNvbWVzIGZyb20gdm1hbGxvYyBhcmVhLg0KPiAN
Cj4gRWFybHkgSE1JL01DRSBoYW5kbGVycyBhcmUgY2FsbGVkIHRocm91Z2ggREVGSU5FX0lOVEVS
UlVQVF9IQU5ETEVSX05NSSgpDQo+IHdyYXBwZXIgd2hpY2ggaW52b2tlcyBubWlfZW50ZXIvbm1p
X2V4aXQgY2FsbHMuIFdlIGRvbid0IHNlZSBhbnkgaXNzdWUgd2hlbg0KPiBwZXJjcHUgYWxsb2Nh
dGlvbiBpcyBmcm9tIHRoZSBlbWJlZGRlZCBmaXJzdCBjaHVuay4gSG93ZXZlciB3aXRoDQo+IENP
TkZJR19ORUVEX1BFUl9DUFVfUEFHRV9GSVJTVF9DSFVOSyBlbmFibGVkIHRoZXJlIGFyZSBjaGFu
Y2VzIHdoZXJlIHBlcmNwdQ0KPiBhbGxvY2F0aW9uIGNhbiBjb21lIGZyb20gdGhlIHZtYWxsb2Mg
YXJlYS4NCj4gDQo+IFdpdGgga2VybmVsIGNvbW1hbmQgbGluZSAicGVyY3B1X2FsbG9jPXBhZ2Ui
IHdlIGNhbiBmb3JjZSBwZXJjcHUgYWxsb2NhdGlvbg0KPiB0byBjb21lIGZyb20gdm1hbGxvYyBh
cmVhIGFuZCBjYW4gc2VlIGtlcm5lbCBjcmFzaCBpbiBtYWNoaW5lX2NoZWNrX2Vhcmx5Og0KPiAN
Cj4gWyAgICAxLjIxNTcxNF0gTklQIFtjMDAwMDAwMDAwZTQ5ZWI0XSByY3Vfbm1pX2VudGVyKzB4
MjQvMHgxMTANCj4gWyAgICAxLjIxNTcxN10gTFIgW2MwMDAwMDAwMDAwNDYxYTBdIG1hY2hpbmVf
Y2hlY2tfZWFybHkrMHhmMC8weDJjMA0KPiBbICAgIDEuMjE1NzE5XSAtLS0gaW50ZXJydXB0OiAy
MDANCj4gWyAgICAxLjIxNTcyMF0gW2MwMDAwMDBmZmZkNzMxODBdIFswMDAwMDAwMDAwMDAwMDAw
XSAweDAgKHVucmVsaWFibGUpDQo+IFsgICAgMS4yMTU3MjJdIFtjMDAwMDAwZmZmZDczMWIwXSBb
MDAwMDAwMDAwMDAwMDAwMF0gMHgwDQo+IFsgICAgMS4yMTU3MjRdIFtjMDAwMDAwZmZmZDczMjEw
XSBbYzAwMDAwMDAwMDAwODM2NF0gbWFjaGluZV9jaGVja19lYXJseV9jb21tb24rMHgxMzQvMHgx
ZjgNCj4gDQo+IEZpeCB0aGlzIGJ5IGF2b2lkaW5nIHVzZSBvZiBubWlfZW50ZXIoKS9ubWlfZXhp
dCgpIGluIHJlYWwgbW9kZSBpZiBwZXJjcHUNCj4gZmlyc3QgY2h1bmsgaXMgbm90IGVtYmVkZGVk
Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTWFoZXNoIFNhbGdhb25rYXIgPG1haGVzaEBsaW51eC5p
Ym0uY29tPg0KPiAtLS0NCj4gICBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vaW50ZXJydXB0Lmgg
fCAgIDE1ICsrKysrKysrKysrKysrKw0KPiAgIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9wZXJj
cHUuaCAgICB8ICAgIDIgKysNCj4gICBhcmNoL3Bvd2VycGMva2VybmVsL3NldHVwXzY0LmMgICAg
ICAgfCAgICAzICsrKw0KPiAgIDMgZmlsZXMgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKQ0KPiAN
Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9pbnRlcnJ1cHQuaCBiL2Fy
Y2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9pbnRlcnJ1cHQuaA0KPiBpbmRleCBmYzI4ZjQ2ZDJmOWRj
Li44YzViM2E3Y2EyYWI2IDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20v
aW50ZXJydXB0LmgNCj4gKysrIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2ludGVycnVwdC5o
DQo+IEBAIC0zMjcsNiArMzI3LDE2IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBpbnRlcnJ1cHRfbm1p
X2VudGVyX3ByZXBhcmUoc3RydWN0IHB0X3JlZ3MgKnJlZ3MsIHN0cnVjdCBpbnRlDQo+ICAgCX0N
Cj4gICAjZW5kaWYNCj4gICANCj4gKwkvKg0KPiArCSAqIERvIG5vdCB1c2Ugbm1pX2VudGVyKCkg
aW4gcmVhbCBtb2RlIGlmIHBlcmNwdSBmaXJzdCBjaHVuayBpcw0KPiArCSAqIG5vdCBlbWJlZGRl
ZC4gV2l0aCBDT05GSUdfTkVFRF9QRVJfQ1BVX1BBR0VfRklSU1RfQ0hVTksgZW5hYmxlZA0KPiAr
CSAqIHRoZXJlIGFyZSBjaGFuY2VzIHdoZXJlIHBlcmNwdSBhbGxvY2F0aW9uIGNhbiBjb21lIGZy
b20gdm1hbGxvYw0KPiArCSAqIGFyZWEuDQo+ICsJICovDQo+ICsJaWYgKElTX0VOQUJMRUQoQ09O
RklHX05FRURfUEVSX0NQVV9QQUdFX0ZJUlNUX0NIVU5LKSAmJg0KPiArCSAgICAhKG1mbXNyKCkg
JiBNU1JfRFIpICYmICFfX3BlcmNwdV9lbWJlZF9maXJzdF9jaHVuaykNCj4gKwkJcmV0dXJuOw0K
PiArDQoNCkl0IHdvdWxkIHByb2JhYmx5IGJlIGJldHRlciB0byByZWZhY3RvciB3aXRoIHRoZSBm
b2xsb3dpbmcgdGVzdCBhbmQgDQphdm9pZCBjYWxsaW5nIG1mbXNyKCkgdHdpY2UuDQoNCj4gICAJ
LyoNCj4gICAJICogRG8gbm90IHVzZSBubWlfZW50ZXIoKSBmb3IgcHNlcmllcyBoYXNoIGd1ZXN0
IHRha2luZyBhIHJlYWwtbW9kZQ0KPiAgIAkgKiBOTUkgYmVjYXVzZSBub3QgZXZlcnl0aGluZyBp
dCB0b3VjaGVzIGlzIHdpdGhpbiB0aGUgUk1BIGxpbWl0Lg0KPiBAQCAtMzM5LDYgKzM0OSwxMCBA
QCBzdGF0aWMgaW5saW5lIHZvaWQgaW50ZXJydXB0X25taV9lbnRlcl9wcmVwYXJlKHN0cnVjdCBw
dF9yZWdzICpyZWdzLCBzdHJ1Y3QgaW50ZQ0KPiAgIA0KPiAgIHN0YXRpYyBpbmxpbmUgdm9pZCBp
bnRlcnJ1cHRfbm1pX2V4aXRfcHJlcGFyZShzdHJ1Y3QgcHRfcmVncyAqcmVncywgc3RydWN0IGlu
dGVycnVwdF9ubWlfc3RhdGUgKnN0YXRlKQ0KPiAgIHsNCj4gKwlpZiAoSVNfRU5BQkxFRChDT05G
SUdfTkVFRF9QRVJfQ1BVX1BBR0VfRklSU1RfQ0hVTkspICYmDQo+ICsJICAgICEobWZtc3IoKSAm
IE1TUl9EUikgJiYgIV9fcGVyY3B1X2VtYmVkX2ZpcnN0X2NodW5rKQ0KPiArCQlnb3RvIHNraXBf
bm1pX2V4aXQ7DQo+ICsNCj4gICAJaWYgKCFJU19FTkFCTEVEKENPTkZJR19QUENfQk9PSzNTXzY0
KSB8fA0KPiAgIAkJCSFmaXJtd2FyZV9oYXNfZmVhdHVyZShGV19GRUFUVVJFX0xQQVIpIHx8DQo+
ICAgCQkJcmFkaXhfZW5hYmxlZCgpIHx8IChtZm1zcigpICYgTVNSX0RSKSkNCg0KU2FtZSBoZXJl
LCBpZiB5b3UgY2FuIGF2b2lkIGNhbGxpbmcgbWZtc3IoKSB0d28gdGltZXMgdGhhdCB3b3VsZCBi
ZSBiZXR0ZXIuDQoNCg0KPiBAQCAtMzQ5LDYgKzM2Myw3IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBp
bnRlcnJ1cHRfbm1pX2V4aXRfcHJlcGFyZShzdHJ1Y3QgcHRfcmVncyAqcmVncywgc3RydWN0IGlu
dGVyDQo+ICAgCSAqIG5ldyB3b3JrIHRvIGRvIChtdXN0IHVzZSBpcnFfd29yayBmb3IgdGhhdCku
DQo+ICAgCSAqLw0KPiAgIA0KPiArc2tpcF9ubWlfZXhpdDoNCj4gICAjaWZkZWYgQ09ORklHX1BQ
QzY0DQo+ICAgI2lmZGVmIENPTkZJR19QUENfQk9PSzNTDQo+ICAgCWlmIChhcmNoX2lycV9kaXNh
YmxlZF9yZWdzKHJlZ3MpKSB7DQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9h
c20vcGVyY3B1LmggYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vcGVyY3B1LmgNCj4gaW5kZXgg
OGU1YjdkMGI4NTFjNi4uNDVjMDhmNWIwYjRlOSAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBj
L2luY2x1ZGUvYXNtL3BlcmNwdS5oDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9w
ZXJjcHUuaA0KPiBAQCAtMTIsNiArMTIsOCBAQA0KPiAgIA0KPiAgICNkZWZpbmUgX19teV9jcHVf
b2Zmc2V0IGxvY2FsX3BhY2EtPmRhdGFfb2Zmc2V0DQo+ICAgDQo+ICtleHRlcm4gYm9vbCBfX3Bl
cmNwdV9lbWJlZF9maXJzdF9jaHVuazsNCj4gKw0KPiAgICNlbmRpZiAvKiBDT05GSUdfU01QICov
DQo+ICAgI2VuZGlmIC8qIF9fcG93ZXJwYzY0X18gKi8NCj4gICANCj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvcG93ZXJwYy9rZXJuZWwvc2V0dXBfNjQuYyBiL2FyY2gvcG93ZXJwYy9rZXJuZWwvc2V0dXBf
NjQuYw0KPiBpbmRleCBiZTg1NzdhYzkzOTcxLi4zOWRiZjJmYjIzZDYxIDEwMDY0NA0KPiAtLS0g
YS9hcmNoL3Bvd2VycGMva2VybmVsL3NldHVwXzY0LmMNCj4gKysrIGIvYXJjaC9wb3dlcnBjL2tl
cm5lbC9zZXR1cF82NC5jDQo+IEBAIC03ODYsNiArNzg2LDcgQEAgc3RhdGljIF9faW5pdCBpbnQg
cGNwdV9jcHVfdG9fbm9kZShpbnQgY3B1KQ0KPiAgIA0KPiAgIHVuc2lnbmVkIGxvbmcgX19wZXJf
Y3B1X29mZnNldFtOUl9DUFVTXSBfX3JlYWRfbW9zdGx5Ow0KPiAgIEVYUE9SVF9TWU1CT0woX19w
ZXJfY3B1X29mZnNldCk7DQo+ICtib29sIF9fcGVyY3B1X2VtYmVkX2ZpcnN0X2NodW5rOw0KPiAg
IA0KPiAgIHZvaWQgX19pbml0IHNldHVwX3Blcl9jcHVfYXJlYXModm9pZCkNCj4gICB7DQo+IEBA
IC04MjEsNiArODIyLDggQEAgdm9pZCBfX2luaXQgc2V0dXBfcGVyX2NwdV9hcmVhcyh2b2lkKQ0K
PiAgIAkJCXByX3dhcm4oIlBFUkNQVTogJXMgYWxsb2NhdG9yIGZhaWxlZCAoJWQpLCAiDQo+ICAg
CQkJCSJmYWxsaW5nIGJhY2sgdG8gcGFnZSBzaXplXG4iLA0KPiAgIAkJCQlwY3B1X2ZjX25hbWVz
W3BjcHVfY2hvc2VuX2ZjXSwgcmMpOw0KPiArCQllbHNlDQo+ICsJCQlfX3BlcmNwdV9lbWJlZF9m
aXJzdF9jaHVuayA9IHRydWU7DQoNCklmIEkgdW5kZXJzdGFuZCBjb3JyZWN0bHkgdGhhdCBoYXBw
ZW5zIG9uY2UgYXQgc3lzdGVtIHN0YXJ0dXAgPw0KDQpUaGVuIGNvdWxkIHlvdSB1c2UganVtcF9s
YWJlbHMgaW4gb3JkZXIgdG8gYXZvaWQgcmVkb2luZyB0aGUgdGVzdCBhdCANCmVhY2ggaW50ZXJy
dXB0IGVudHJ5ID8NCg0KDQo+ICAgCX0NCj4gICANCj4gICAJaWYgKHJjIDwgMCkNCj4gDQo+IA==
