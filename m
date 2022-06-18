Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DFED55038B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jun 2022 10:49:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LQ8jX3DLsz3cd6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jun 2022 18:49:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=GjxPaPBo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::62e; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=GjxPaPBo;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on062e.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::62e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LQ8hj3R8Rz30Lk
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jun 2022 18:48:51 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LJKwWOkPzWIO8a3ornEF9/tX5ojKE/4vIrWff3aDSTdXFgGFp320cx49Uqz/Mj2fnrolV2r/7vidANxv+4nj9eWX0veI5d/nGoRRZbKwpQqAzelc2kRbmf9rcx8n5YiRDyEmLQT5uoMB1FCj+bgAaBOzjQj6aHyXMVlEhdjVuy6QSsD/w8JLk+p8SfGCX8hvcEjuVQ/ku2+CLUIuy3c5xvRk5AgwgEgdsIPwA0HFHchagFcduysrOfTB+1aKYElk3HEf9IE5qJSEivXMgj4fOafYznDriOiL0iwNS7BWHReOnCMSalTVYWVIcBOL9O2+lPiPrjWXxdyqxr1nMvQ0aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z8elubV3NCQSAS4TN8HHuBHts/9SBfd81DWemQTR5Zg=;
 b=LrJilQCcLCCsKXsUZDjz2Z5DJcJFYFARtr3H5PExRsrVIe0iz11FXwGKJDCe042PrZNE7YVXwFxK4oWE5hEVRLqn10zc/Uz0xw89BumLRYTA65PZJiD6CLd4xOk3o/1+QR7lC0ecdVBp7FaDZjG07285ipsnbOW2gLNLw26c4rVIqTKc6RYHgO+0aX902DDzD9DVBrv2an/KCAJ2G2pIoe1bdcdWCc3OgzOK4RlJBu7Px+UeEkhWMVsyxBZ2TC9SXYNSzug8BwrVTyxxuk5SD4bpH4dW8CCw67mhUrGQQHY1WPUVFOTZZh3L9pX9XbxhkigOY2KnDjIS2MY6v89yyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z8elubV3NCQSAS4TN8HHuBHts/9SBfd81DWemQTR5Zg=;
 b=GjxPaPBo9XjJWjIPLNbQqR/zE6VnHkjImuQr6O3RA6alcKHF0hDxP0GJbH4Tfs9jL6hyd9usay2X5ntHghLzzlWgB1lZ1vOh6GRrmJ5BClI9GlrG6bWC9uorc0r9pSp1/668W6sBc0AC7cO6BKhjybGtBn7pcGMExi+luHenUr2hvgEufK6GOk+GtyGoKuztqv8ykpRxK776a1SwpEuXbkiXIAacfbfJ4sCe2JYVOBZ0SS4MBL+BMuo9loNpZDg4dumZfxWhaEBvD7SNyglUgS4hiIslWT+DsDQ1USSeuMCSZw7gR+nMdp8jWbe4CMgrm7YPXDe53QoKASKfMEXq7g==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB4250.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:25d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.15; Sat, 18 Jun
 2022 08:48:27 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356%5]) with mapi id 15.20.5353.018; Sat, 18 Jun 2022
 08:48:27 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Liang He <windhl@126.com>
Subject: Re: [PATCH] powerpc: kernel: Change the order of of_node_put()
Thread-Topic: [PATCH] powerpc: kernel: Change the order of of_node_put()
Thread-Index: AQHYgvAtGcq5K48jQEuo4UFc0jxJtg==
Date: Sat, 18 Jun 2022 08:48:26 +0000
Message-ID: <c9785db9-b74d-540e-9c83-4db7bee10303@csgroup.eu>
References: <20220617112636.4041671-1-windhl@126.com>
 <a6a5e5b3-ffd1-904b-bba1-22baff5f7b67@csgroup.eu>
 <61c85548.1a55.18175d69e21.Coremail.windhl@126.com>
In-Reply-To: <61c85548.1a55.18175d69e21.Coremail.windhl@126.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 922b017e-9534-4251-4a5d-08da51074fbd
x-ms-traffictypediagnostic: PR0P264MB4250:EE_
x-microsoft-antispam-prvs:  <PR0P264MB4250A8D38DDD9023AAC39E0BEDAE9@PR0P264MB4250.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  SUQiGginGhld85S8xGdsg+PrLimqkDDHqjRK0bKueG4ZEADxm27P1zsN6GWAdbr8STBYJpim7CJQxyrFanOj9C4ymrlbgeM52LFogadHe7wczUfTZ8SuKFwqo8GqGuUtEBsX+goub/h2zuIb6/lT5tpV8ZSKz2R5lC7J6v5rbmCMqKqlr0pj4DYvquF6k3Fbq2U0HiOLZn85XZBws++3stN3/hiSML1mAf60fUbh8ysCUM6hOQKt99Ufe5J/T6/gMmlhjOFdkRXn8PqLWkiUnsppI8KC5JMha1QN3J6LaBkhNROoGcDm/+oOpPLgcMm8xZosQBDiRJkOIn6+mOQpmK4v8wcZMGygOcQKinTB/UdYV1EBOmx284qjOWYLUQw9JJUyzDv+5mBl4QffT0iJfWYw0sJob121w+1gRh+P7vSMX9IkZSW6qhujmnYVU1ILem33Ym0uGX2gTl77IjKmgdiLkGz/iDmPa/lnWhugYPEnId1Mcb3QBrPNPSALcVhJWEk3+Z55R6ZQTJw4Vzf7M7x1vAKSWfShfnHSWAie89tQ6pcss/b/ZEDS0CiL2dbzonZA6Fw589efmQg/32k2c7XGHOtHXXEOvXHSJ5n964TlykBv1ll3M3Ht07e/069CvSRExq/Nxuu7i2zsOl7SgDtZuUDeaPnDauSsokBWWEtFfTklbL/TyU3bM4D8q7jiSDOBWr/82ZqL2bCWFgVC3OUwVcjh4bxdlPV28lxVfE7lj1roIxOG5703UXVFX7JKy6OE07zpyz4KXewuFWm1ZVnYFinCsnptvufxiJP5+1c=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(71200400001)(38100700002)(6512007)(186003)(26005)(31686004)(2906002)(36756003)(316002)(83380400001)(86362001)(66556008)(5660300002)(38070700005)(66946007)(8676002)(4326008)(7416002)(54906003)(6916009)(122000001)(91956017)(64756008)(66446008)(66476007)(76116006)(44832011)(498600001)(66574015)(31696002)(6486002)(6506007)(2616005)(8936002)(21314003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?cWRQQmx1ZElHRlNKTzlUNkNWWmU2VDlhV1Voa2hJNkxTTHlIYndVWFJIRVZN?=
 =?utf-8?B?UTN1RkpMblZOVUV3WGhtMm5GMGRaVEVjRCtqTFpZM2hlTnFIdHdEU2VnUUR0?=
 =?utf-8?B?Mm1BcU9HQkw5c3JoS3UwQm9mZURjMW92ZmcwV21oRUFHZzZBWjk0YjdCeEtl?=
 =?utf-8?B?U2FMMkpTWEg5QWZTdkpleUw4SU94SzZSTWNyakRzOUw0SEt0c2FxU0I3NERQ?=
 =?utf-8?B?RlZpVDRqbWJGZVRhcTV5dVNiQ25leU1sMnJ0K3RLUkp5RjFkbW9IMFllbExr?=
 =?utf-8?B?TC9nZUROczZTS3dlOWsrTXJRWEZXUUNRUkZ4TzI0TEtTQ3ZXZFBYRDJ1VTh3?=
 =?utf-8?B?bkxOSm4rRjlUcGl5MzMrQjFJUnlEd2Z4ajdWS3FMd1ZWcTQ5dFJ3T1JPekRZ?=
 =?utf-8?B?a1UrcWZqZC85Vm9RU2NtbHFJZ0xwUGJvbzNwRlB4aVdhNzU0NW4ycVRhbTRZ?=
 =?utf-8?B?ektSc1RDQTlsTzZ5dWV4QXNmbmZ4YnIzMStHQ1FFeWMrVHNZTjZnL1hIOW42?=
 =?utf-8?B?ZXdyd1JVZ0NURkJXZ1hTTnBJTU1Demk4T3RnRnNYUWJvWUdqdmE5dzVJVkRJ?=
 =?utf-8?B?NitsM0VqZ2FlbUhzRDhsTXJScjZBTzhQYXlCdzF0djJHa3VHdlVnaWtKSDd3?=
 =?utf-8?B?QWtEanRES1lhRlJzcWdqU0NROEJybXRIRGR4NEdwVHhIbFhmWVlmNVYreVpa?=
 =?utf-8?B?Ym8ra1RTVEs0N2U5cTVYL0lEb3BXSngzU3BNWmxiT0RBejRpRkZYQkZnVmlS?=
 =?utf-8?B?TmVocE5WdC9rcmpxRzRYT0NvN0JPWlkvYnNVb2JmcHRxeXlRek1VUndQWkpp?=
 =?utf-8?B?d3dzMit2VEcrbjNLSnJMbmJRV0c4U1Z2RXVKUjhUcTN2dGdSSExhOC93aHBW?=
 =?utf-8?B?OXN1ZjV6Z1VrQlJrM2cyYVNCdkZLVzFGNVJtM2ZITzQ2WVVWTWtEU0RGakRV?=
 =?utf-8?B?SDM3dTFEWGZHMlNrakZlODhDbVBrYlI4Zm51eS9nK3VEY254S1BEd2N0a0tz?=
 =?utf-8?B?NGJiSG5IT0IrdGs0eEZvaHdKSWs2b2FwcWx3T0djMnFxenUxSnYwMUZ2aVUz?=
 =?utf-8?B?NFduSk80dUdWc2JNdEJENjhjYnhRZ3VaanEwaWVWV1JmU3dZV21xSGJqdXdu?=
 =?utf-8?B?cFBqcGhjbDlaNDlNUXRHT01PaU11OVRwdmNqRDRybHNLVlVEMGxUeStycHZy?=
 =?utf-8?B?U284Z3hHVU9qNFpUeXJNMmUwUCtQMkNXZ0RJNVV0WGZnNXNXckR0bHV4NERm?=
 =?utf-8?B?TGgxZEZLUmtnYXhKeFBzZ2liYmxCc2lzWVdPbVZERjJLRkQvTWpmdmpUb3gy?=
 =?utf-8?B?LzkrZFpnYXZSVWNUbEVJTWNFNlBWQ3Q2bUdxMVU2TGJXQmJSWEFqNHhPZ0Rn?=
 =?utf-8?B?QlBHSEN5ZjdEUUtvWGNLWitqTDIvdDN2WGN2Wk8vZzdIS0FWNjBqSGJEaFdZ?=
 =?utf-8?B?WlZaRWtNSHM4ZjhlWHlCQkp4YVpRVG1kdzlkNTZMNUc3RVdXVnVsTHZIT3o2?=
 =?utf-8?B?cS84NHZBZUk2UVdUSUpvUGxBaVhQV1h5V1BYVlhrU250Vk5OZTlYZk1SMXRO?=
 =?utf-8?B?Zi9rQlBueW94cWtuem9OR2hBQkJlRVlZMFA4cnNPZVZGNU5CUlgwazdab3l2?=
 =?utf-8?B?c1h2RC9FV0RlejNmV3dldDBWcTdxN0lEWmMxcXU3RnpLTXVlQnBnSk9lQzFM?=
 =?utf-8?B?SUJuZGFmajhxSDN5NUhRa21lbWd0YllGYlVQc0NHQjNFM2RVQmIyVEFKWU5O?=
 =?utf-8?B?QUQ3SHdzQ21SZGRkVlN3UWMrUU8rY1IyQkoyeGF5VXpxK3JJcUhWRWh1NmV6?=
 =?utf-8?B?Q0dPYy9MMlBlaU83bzEzRlh1cDBJZGI0ZThoY3pnVllPbGtDRlpLR0ZlaENp?=
 =?utf-8?B?MVROYjFLUDI4bE8zSFd2dUoxeFFOT2F1QWIwNjFROGJkWmJXcGxYNDl5KzhY?=
 =?utf-8?B?N0FGUFNJbjRiMWdMRXk2QkxuMEcrdEh6amVpbkM0ZnUrME1YdisxcEovcVpj?=
 =?utf-8?B?aDR2R1pCZlRydEZreXZpRnJQeGMyTThRV1hCVHJQaVpFRVR6TXBQdmhBVFFC?=
 =?utf-8?B?Y0VTV1NPTjNOUkJ1T1AzYjRzT2x4eEU0OERrSkhoYm12d0QwUUhZdjIxM0l2?=
 =?utf-8?B?bmIrRGhVamdjbmpmV1VGaTBRaXdKNGNzaGlBeGdESVM5a0I5L0YwTzlIMWNj?=
 =?utf-8?B?VHYwZ3cxRUVjSm9nL2VxQWdwU0xUUVdpNy9TdXZXMkpCRUdqMjFYcnQ5TWZL?=
 =?utf-8?B?QWJ4RXJrRG9vc0cvUHJGeVlXVFVXdTFodHZGTE1rQ1lKdURHaW8zL3BDaits?=
 =?utf-8?B?a2FuazNjcGVjcUI1dk5pVFdSalA3YmxpRUNRYkRoNWErZjdlNTdyTlVONTl3?=
 =?utf-8?Q?6O7c4TqFC5OS6X/gTqD1nj22afx4qbWTtjr+S?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <49EA3C1B3AE2B24BA524AF57F1E33A41@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 922b017e-9534-4251-4a5d-08da51074fbd
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2022 08:48:27.0147
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9VROfo8TH2lqbRhlRpFdwJNwEFIKvbgMaqSPUP1Bo4bqqRYnPFYTHnJJ53h/6qhoKqSbDP+FOtS6zhrdZbN/ik6Yx1ZmHCnvsEUfxO8MTsE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB4250
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
Cc: "wangkefeng.wang@huawei.com" <wangkefeng.wang@huawei.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "gpiccoli@igalia.com" <gpiccoli@igalia.com>, "paulus@samba.org" <paulus@samba.org>, "aneesh.kumar@linux.ibm.com" <aneesh.kumar@linux.ibm.com>, "dmitry.osipenko@collabora.com" <dmitry.osipenko@collabora.com>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "rppt@kernel.org" <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE4LzA2LzIwMjIgw6AgMTA6MDMsIExpYW5nIEhlIGEgw6ljcml0wqA6DQo+IA0KPiAN
Cj4gDQo+IA0KPiANCj4g5ZyoIDIwMjItMDYtMTggMTU6MTM6MTPvvIwiQ2hyaXN0b3BoZSBMZXJv
eSIgPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4g5YaZ6YGT77yaDQo+Pg0KPj4NCj4+IExl
IDE3LzA2LzIwMjIgw6AgMTM6MjYsIExpYW5nIEhlIGEgw6ljcml0wqA6DQo+Pj4gSW4gYWRkX3Bj
c3BrcigpLCBpdCBpcyBiZXR0ZXIgdG8gY2FsbCBvZl9ub2RlX3B1dCgpIGFmdGVyIHRoZQ0KPj4+
ICdpZighbnApJyBjaGVjay4NCj4+DQo+PiBXaHkgaXMgaXQgYmV0dGVyID8NCj4+DQo+Pg0KPj4N
Cj4+IC8qKg0KPj4gICAqIG9mX25vZGVfcHV0KCkgLSBEZWNyZW1lbnQgcmVmY291bnQgb2YgYSBu
b2RlDQo+PiAgICogQG5vZGU6CU5vZGUgdG8gZGVjIHJlZmNvdW50LCBOVUxMIGlzIHN1cHBvcnRl
ZCB0byBzaW1wbGlmeSB3cml0aW5nIG9mDQo+PiAgICoJCWNhbGxlcnMNCj4+ICAgKi8NCj4+IHZv
aWQgb2Zfbm9kZV9wdXQoc3RydWN0IGRldmljZV9ub2RlICpub2RlKQ0KPj4gew0KPj4gCWlmIChu
b2RlKQ0KPj4gCQlrb2JqZWN0X3B1dCgmbm9kZS0+a29iaik7DQo+PiB9DQo+PiBFWFBPUlRfU1lN
Qk9MKG9mX25vZGVfcHV0KTsNCj4+DQo+Pg0KPj4NCj4+IENocmlzdG9waGUNCj4gDQo+IEhpLCBD
aHJpc3RvcGhlLg0KPiANCj4gVGhhbmtzIGZvciB5b3VyIHJlcGx5IGFuZCBJIHdhbnQgdG8gaGF2
ZSBhIGRpc2N1c3Npb24uDQo+IA0KPiBJbiBteSB0aG91Z2h0LCB4eHhfcHV0KHBvaW50ZXIpJ3Mg
c2VtYW50aWMgdXN1YWxseSBtZWFucw0KPiB0aGlzIHJlZmVyZW5jZSBoYXMgYmVlbiB1c2VkIGRv
bmUgYW5kIHdpbGwgbm90IGJlIHVzZWQNCj4gYW55bW9yZS4gSXMgdGhpcyBzZW1hbnRpYyBtb3Jl
IHJlYXNvbmFibGUsIHJpZ2h0Pw0KPiANCj4gQmVzaWRlcywgaWYgdGhlIG5wIGlzIE5VTEwsIHdl
IGNhbiBqdXN0IHJldHVybiBhbmQgc2F2ZSBhIGNwdQ0KPiB0aW1lIGZvciB0aGUgeHh4X3B1dCgp
IGNhbGwuDQo+IA0KPiBPdGhlcndpc2UsIEkgcHJlZmVyIHRvIGNhbGwgaXQgJ3VzZShjaGVjaykt
YWZ0ZXItcHV0Jy4NCj4gDQo+IEluIGZhY3QsIEkgaGF2ZSBtZWV0IG1hbnkgb3RoZXIgJ3VzZShj
aGVjayktYWZ0ZXItcHV0JyBpbnN0YW5jZXMNCj4gYWZ0ZXIgSSBzZW5kIHRoaXMgcGF0Y2gtY29t
bWl0LCBzbyBJIGFtIHdhaXRpbmcgZm9yIHRoaXMNCj4gZGlzY3Vzc2lvbi4NCj4gDQo+IFRoaXMg
aXMganVzdCBteSB0aG91Z2h0LCBpdCBtYXkgYmUgd3JvbmcuDQo+IA0KPiBBbnl3YXksIHRoYW5r
cyBmb3IgeW91ciByZXBseS4NCg0KV2VsbCBpbiBwcmluY2lwbGUgeW91IGFyZSByaWdodCwgaW4g
YW4gaWRlYWwgd29ybGQgaXQgc2hvdWxkIGJlIGxpa2UgDQp0aGF0LiBIb3dldmVyLCB5b3UgaGF2
ZSB0byB3b25kZXIgaWYgaXQgaXMgd29ydGggdGhlIGNodXJuLiBUaGUgQ1BVIA0KY3ljbGUgYXJn
dW1lbnQgaXMgdmFsaWQgb25seSBpZiB0aGF0IGZ1bmN0aW9uIGlzIHVzZWQgaW4gYSBob3QgcGF0
aC4gQnV0IA0KYXMgd2UgYXJlIHRhbGtpbmcgYWJvdXQgZXJyb3IgaGFuZGxpbmcsIGl0IGNhbid0
IGJlIGEgaG90IHBhdGguDQoNClRha2luZyBpbnRvIGFjY291bnQgdGhlIGNvbW1lbnQgYXNzb2Np
YXRlZCBvZiBvZl9ub2RlX3B1dCA6ICJOVUxMIGlzIA0Kc3VwcG9ydGVkIHRvIHNpbXBsaWZ5IHdy
aXRpbmcgb2YgY2FsbGVycyIsIGl0IG1lYW5zIHRoYXQgdXNhZ2UgaXMgdmFsaWQsIA0KanVzdCBs
aWtlIGl0IGlzIHdpdGggZnVuY3Rpb24ga2ZyZWUoKSBhZnRlciBhIGttYWxsb2MoKS4NCg0KU28g
aW4gYSBuZXcgZGV2ZWxvcHBlbWVudCwgb3Igd2hlbiBkb2luZyByZWFsIG1vZGlmaWNhdGlvbnMg
dG8gYSBkcml2ZXIsIA0KdGhhdCBraW5kIG9mIGNoYW5nZSBjYW4gYmUgZG9uZSBpZGVhbGx5LiBI
b3dldmVyIGZvciBkcml2ZXJzIHRoYXQgaGF2ZSANCmJlZW4gdGhlcmUgZm9yIHllYXJzIHdpdGhv
dXQgYW55IGNoYW5nZSwgYXNrIHlvdXJzZWxmIGlmIGl0IGlzIHdvcnRoIHRoZSANCmNodXJuLiBZ
b3Ugc3BlbmQgdGltZSBvbiBpdCwgeW91IHJlcXVpcmUgb3RoZXIgcGVvcGxlIHRvIHNwZW5kIHRp
bWUgb24gDQppdCBmb3IgcmV2aWV3aW5nIGFuZCBhcHBseWluZyB5b3VyIHBhdGNoZXMgYW5kIGR1
cmluZyB0aGF0IHRpbWUgdGhleSANCmRvbid0IGRvIG90aGVyIHRoaW5ncyB0aGF0IGNvdWxkIGhh
dmUgYmVlbiBtb3JlIHVzZWZ1bGwuDQoNClNvIHVubGVzcyB0aGlzIGNoYW5nZSBpcyBwYXJ0IG9m
IGEgbW9yZSBnbG9iYWwgcGF0Y2gsIEkgdGhpbmsgaXQgaXMgbm90IA0Kd29ydGggdGhlIGVmZm9y
dC4NCg0KQnkgdGhlIHdheSwgYWxzbyBmb3IgYWxsIHlvdXIgb3RoZXIgcGF0Y2hlcywgSSB0aGlu
ayB5b3Ugc2hvdWxkIHN0YXJ0IA0KZG9pbmcgYWxsIHRoZSBjaGFuZ2VzIGxvY2FsbHkgb24geW91
ciBzaWRlLCBhbmQgd2hlbiB5b3UgYXJlIGZpbmlzaGVkIA0KdHJ5IHRvIGdyb3VwIHRoaW5ncyB0
b2dldGhlciBpbiBiaWdnZXIgcGF0Y2hlcyBwZXIgYXJlYSBpbnN0ZWFkIG9mIA0Kc2VuZGluZyBv
bmUgYnkgb25lLiBJIHNlZSB5b3UgaGF2ZSBhbHJlYWR5IHN0YXJ0ZWQgZG9pbmcgdGhhdCBmb3Ig
DQpvcGFsL3Bvd2VybnYgZm9yIGluc3RhbmNlLCBidXQgdGhlcmUgYXJlIHN0aWxsIGluZGl2aWR1
YWwgcG93ZXJudi9vcGFsIA0KaW4gdGhlIHF1ZXVlLiBJIHRoaW5rIHlvdSBzaG91bGQgZ3JvdXAg
YWxsIHRvZ2V0aGVyIGluIGEgc2luZ2xlIHBhdGNoLiANCkFuZCBzYW1lIGZvciBvdGhlciBhcmVh
cywgcGxlYXNlIHRyeSB0byBtaW5pbWlzZSB0aGUgbnVtYmVyIG9mIHBhdGNoZXMuIA0KV2UgZG9u
J3QgbGluayBodWdlIGJvbWJzIHRoYXQgbW9kaWZ5IGFsbCB0aGUga2VybmVsIGF0IG9uY2UsIGJ1
dCB5b3UgY2FuIA0KZ3JvdXAgdGhpbmdzIHRvZ2V0aGVyLCBvbmUgcGF0Y2ggZm9yIHBvd2VycGMg
Y29yZSBwYXJ0cywgb25lIHBhdGNoIGZvciANCmVhY2ggcGxhdGZvcm0gaW4gYXJjaC9wb3dlcnBj
L3BsYXRmb3Jtcy8gZXRjIC4uLg0KDQoNCkNocmlzdG9waGU=
