Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D55525C8F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 May 2022 09:53:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L019k6fLZz3cLW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 May 2022 17:53:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::623;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0623.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::623])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L019H3Xy4z3bfq
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 May 2022 17:53:22 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h/NujyttRf1MLX62TVyR4c/e0vDn66qxjwnZfxeZ+ebVMeRUF0gIopBoKJJmJ8iG0JqkjiSjCTyCWzyK5WKzu1ATLxsNh4tLBpLyJXuIo0idtC9w9DE0jDKCX9BSBX912gXBJ1AItQYsFbgguliM0hnemXE69uMum9wyyMD824S0ZNDNoZKTbfNiaLbiv7kswmyAf59oEZxhCmCzcj9xsKsAAcvN6uEzmuIRCV0FI3P6gzlJHBumDI6KO5HIsjSrdqF2oE4OhUofOGBMX2MwiDEaM5hBLdJTKbYQS5WpLA1BlIinq8cgwBFjGgJkZlOA+FjNKkSkGcSkC2WFGHR1VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fD6MdzhpblSiEfietptdPqPp2ybrb06MVAEGs5Pa7lU=;
 b=iIsBHd4KjckBYGmX/1xwWyAYouowg1sH5hQa4+Nhv+EMxYfUIUnzN6j+GrECq0gTNJa5Vq2RL5cmuRUZpuhRaQOPYgzC7G4e1R+xBPhOXLGUcP9sP5FfrOfbRAN9WYQdxmLTO6EhH7f3DM+h8/Gl4kH8rUjUvGF/eh786gkshEyKF4x7W0Ifa9CLQ8DhZpB7/1731siBOzJwbvSUopcuk0u/dhUysjc/Xn2feXU0/h3PO4u1JTRD3mrqf27XkODIOqUn9P/0wReEBdxFqJg2365GgfRkdTUlpNQqIiwCGZ76dJ7Coqu/Rjou5fQXv8pvug6pXSCGXFSTtjjdiX+psw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2060.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:166::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Fri, 13 May
 2022 07:53:03 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::ad4e:c157:e9ac:385d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::ad4e:c157:e9ac:385d%6]) with mapi id 15.20.5250.015; Fri, 13 May 2022
 07:53:03 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Alexander Graf <graf@amazon.com>, "kvm@vger.kernel.org"
 <kvm@vger.kernel.org>
Subject: Re: [PATCH v3] KVM: PPC: Book3S PR: Enable MSR_DR for
 switch_mmu_context()
Thread-Topic: [PATCH v3] KVM: PPC: Book3S PR: Enable MSR_DR for
 switch_mmu_context()
Thread-Index: AQHYZGrGlW8yuyOY8kmqYwYuCo7YfK0cdBqA
Date: Fri, 13 May 2022 07:53:03 +0000
Message-ID: <cded4dd4-4ce5-b664-b2b4-e5b181ec867e@csgroup.eu>
References: <20220510123717.24508-1-graf@amazon.com>
In-Reply-To: <20220510123717.24508-1-graf@amazon.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e3bada5f-1f09-483a-fd75-08da34b59b9a
x-ms-traffictypediagnostic: PR0P264MB2060:EE_
x-microsoft-antispam-prvs: <PR0P264MB20600949B35D6358FD60CF2FEDCA9@PR0P264MB2060.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UeHHZS7OeMXTgbjLLLmQTS+5ol9cKs14/gzNt+9ZXmDPjHbFmVggNQK+EvJJdqLLqKRTh4jQqHMZelQEROTcM54LllM327GF7f0jmOgdAt5vi2C8S0iGDoJnFVnWM1cWCLHCq0oNoYHSFMnBHmtmPHFJK7rH6QQZXrTGbsZDatra7nejOMWT3TltEZypnEgpkrn7kc8y0ojvxIwq0jz3GSjXjMiaGIoPz4WgNKgLHRc0nLFR5G1y0Zgmt+zMEJgIwoieSJ5ttTcFXOnKXzZKKAu7ZsN5hiT1Ml4pkp4vAVEIQk82SkjNur5/8FXZPC5rX2u8gnNnm3xeSjo3QtchHob2ZK6TKSAr6E5ntwMnkOsEs1ZGK+ELHfkaThCv6W15E6HwhZuQOk++JAArc7dQUHl+wLmWUKn0RJ7VTqqZo9GR3eY1Nabh4lBufEGmzVqz3BdSBkO0BeYvYXBrNgEGzSGbYAckSPggIhl/aqZnmNF2/CHYo+3SKhUxUHQOCeX4B6lvRZvswdrbY/rDDvb7CrI/3g5tvSqhcRywI2odCfhXHjoWJB+SFNnZDV6IpcaHzqBBuDGM6wn5CCMZEW6HWnMIOfZIz97dcIp78JBe+MMMXqsJfg+k6WgYh2OkbzDo9QULthneJhbV3sDz5AJbvijtzqJcMIUCF0g2Sg1jzvISRW8rWPFgNJ7aqoA+VpE6m93l0d8/fqVJCfVB2d6ctVfC5QhZJhihPB2w3OLEyXpbEWvQ8jPruT790iOdFRdb8qgFele0OL6o0PbtX7lYlr/ewukv6rZpu6DpW/HzRsY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(44832011)(86362001)(6512007)(5660300002)(8936002)(31696002)(26005)(71200400001)(4326008)(2616005)(66946007)(6506007)(6486002)(76116006)(64756008)(66476007)(38070700005)(54906003)(66556008)(508600001)(38100700002)(66446008)(110136005)(91956017)(122000001)(83380400001)(316002)(2906002)(66574015)(36756003)(186003)(31686004)(8676002)(32563001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dHVsUnJOK0V6OU9ySm91T0lQa2JsQjVWL1dVU3phZFRvK1dDdENodExpUDVi?=
 =?utf-8?B?ZVk1QThiZFk0NFpta0hneFBYaFl3NHZhQ01JUndvbC9ITWpLV2l0VjVGMU8y?=
 =?utf-8?B?QmRhZzJSazJoNk5iSEVmbWZlU1Z3YUM0czdCR2xxK2JSU1hMMWQwZWRDQXJk?=
 =?utf-8?B?RkVYc0hNd0cvaXFKR3ZvVTZQSXE2aDBhUW9nMk9YNExLc1l0bFBONlhDcjlM?=
 =?utf-8?B?cDZ2Sk1TdmhTbVNlb0d3YlcydGhCQ0hTazd0MStLYmRxeGJNdHhBRzA2UGhs?=
 =?utf-8?B?NTZiWjEycXNJTnpXNXZmNFZtTFZOZXFtb0ZZWkVQbVlFd2dSaDc1aW9wNDVs?=
 =?utf-8?B?NWVxcStxNXdNQVA5NkE1UStrK0ZqMC90bHhGQTdxd014UlUvSFNxNVhkNVl3?=
 =?utf-8?B?eTBON2pkME9CbVA4TVlJSklhbTgxTnZpQ0kzZU1tK3UzM1N2d2N0NCttby9k?=
 =?utf-8?B?NnJ6a1JCcGtwTHJJNU9JakRwa0dRUU5mNE5OZ2tQSUdEUnBUaHNJdytyNktk?=
 =?utf-8?B?UHE2YjFZZ2JmcHY5WHZHOEprVW1SeTNWMlpKbjJ4dURQV1JYZkt3Q2gwT0xa?=
 =?utf-8?B?VVpDL2hHaVRiNlV2YTF4MHhSUkVjQWZaZi9TejNIUFJ4TWUvMytQZXBrSWtD?=
 =?utf-8?B?enc3Y3p5UmpFK0RSSFBFMFQrRzFnQ2JjZU8wK0kzNlM3SW1ZOG16SFh1MEp0?=
 =?utf-8?B?ZmNuakVzMnMxQjRMMUlFRnp4VTJDR1F4b2VhaUhhdFdIR1lVNk1MeGlCRW1m?=
 =?utf-8?B?S1JuMEJ3RVpZeVlGRFBQcmJ2LzJTeklGWUxBOXptUUxPTG5sV3B2bmQ4ZzNq?=
 =?utf-8?B?TVM4MjhzL29VR1lSRzBDQ1dnMEVGNnBOb2V6UTZ2b3lNNi9TSFlmY29kSy9D?=
 =?utf-8?B?Q0p4czc1dTFueDNMbWZXTjlQT0NIci9TMnJ0Y05CdlpyWHp0WmRyNVhLZmR4?=
 =?utf-8?B?ajhkNHBJb1FDU1hjbURqdXdqWDhIQVBEMzE0RjJ2b3NzSXBRTlZHWlhuN3Fr?=
 =?utf-8?B?cGNZODBmK1lnK0hldXdNeHdqQmpEeEVQYThGOE1PQ25pZkdsZlhvaURhK1Jr?=
 =?utf-8?B?QzJYNytQMFJqMU5oWVJrSlVGNnoyRnNFR211VEp4cTlJdEtNWWlja3NjQlhj?=
 =?utf-8?B?Z0F6Z3JETlBCNG5UejdPMDBFdU1yQ25aNUhjYk5QOUwwSVlUb3F2V0c4eXNz?=
 =?utf-8?B?VWRML1daSkcxSFlxQzIrSEtnU2JlaDVVVTFNUGxjcVR6QzU0SThMME44SEJ1?=
 =?utf-8?B?K1RBL2hBOC9lUHBGSmtIN2UvUDNOOWZOR0wrVmZIT1cxMUVQODU1QTlHM2E2?=
 =?utf-8?B?QzJTbCtUU0d2T1FrNFdqUVpEd084T2hmT3cvaFhVTlM2Q0hNand6a2ovZmdw?=
 =?utf-8?B?MmNlOEIzcGRCQ3FiQnU3cG5hdXQxbzcwZVFyMHlNSzVScmw0WkwyY1NSTlhx?=
 =?utf-8?B?dC9zelIyRjJEeS8zK0pVdkNzMjFNY1F2ZFNlWFhMVjIxNmFzRlJoR3hPSk9m?=
 =?utf-8?B?OFVCY3pNL3ZqMStHMERuK0NxSHpubkNmRVhFVnV6RXFXbER2MlRUeWM2d3RQ?=
 =?utf-8?B?eFJUS2YvdlRPeXcvT0kvNVVVRE1WQkJvcXByRWJ4Y09Ic2FhMHNHVFdHdDRr?=
 =?utf-8?B?V0FXTHlpYnNGZm4zSDBrRHlxR3hUWFFIQzJBR3dlU2pjMWZmS1lYZWFQSVNX?=
 =?utf-8?B?cEZzSHZ4cGRVbjhkc1gzaDEwcE5tQ25rajMvMnpCWGJ2R24rcDhueUFjajRj?=
 =?utf-8?B?K3ROMjNwTUhXWXVtNmpWZFUxVlBpc0RUS3Z6YVhZM2dHNXEwdUJMWkhzWCtV?=
 =?utf-8?B?ekYzOGtHRnpCM0JuYW9XMW4vMUt2d2ZXRllZd2Z4QVAzRStuVXFnNzVJUlh3?=
 =?utf-8?B?MlY0MVp2WDg2Q1Q0ZDg5eFJDL0FUdDN1ZXhTa0dsQUd2WnkyYTgrVlI0TlVz?=
 =?utf-8?B?TVc2Y2M5YzFSdUlxNjBhTDJKaCtlUjhWaVVLRmoxUlJ0UGI5Zi8rU2QyYzVw?=
 =?utf-8?B?NUhCdkdJM3VRTXFSRkpzQjhBL0xYbC83U1pINTY3MzNzZGJ6UVFFTXJzcHlB?=
 =?utf-8?B?aGxXQzBlWG90QzFxSTBhOFJPRGdiUkZMWDdkSC90T2tUdTNDLzQ2enhXUVgr?=
 =?utf-8?B?NDhzTmZJSmZqZmpWdUhiYzBkeUxndi9WdnV5UVlQSSt3K2FJNlZBN2FFeGk5?=
 =?utf-8?B?UHRoeFRUVm0zLzNNZGlVMW9mYzFMK2phVWNZSEo4OWYyRmg5QVVtdVNPMkE5?=
 =?utf-8?B?c01pNXFrZmxJaFhCSWEzWDVIY2tXMjFIeDVJNzRoSkh1cGZ5eWYza3hlQmtq?=
 =?utf-8?B?elJIWjhwKzdyTGJOQURtYVNZRERJS3BVeERHN1g0VHprUWdzLzZwVVRPYUVu?=
 =?utf-8?Q?ijOIrJOc/BFFLlFtWZW05NkfPlG0hViBcsMha?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F40CA9F782D9144593B946AD73994E6A@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e3bada5f-1f09-483a-fd75-08da34b59b9a
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2022 07:53:03.0228 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9inalx26lmNn+ZtL3yHU5gB5QfiaiUCCcKL33pARK2+sFylHSeioxkmySjpIqNzyq0tSSNhOYZnA3XtLJUEIHyqt19BLq9GCh8kNw9JE6IY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2060
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
Cc: Matt Evans <matt@ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDEwLzA1LzIwMjIgw6AgMTQ6MzcsIEFsZXhhbmRlciBHcmFmIGEgw6ljcml0wqA6DQo+
IENvbW1pdCA4NjM3NzFhMjhlMjcgKCJwb3dlcnBjLzMyczogQ29udmVydCBzd2l0Y2hfbW11X2Nv
bnRleHQoKSB0byBDIikNCj4gbW92ZWQgdGhlIHN3aXRjaF9tbXVfY29udGV4dCgpIHRvIEMuIFdo
aWxlIGluIHByaW5jaXBsZSBhIGdvb2QgaWRlYSwgaXQNCj4gbWVhbnQgdGhhdCB0aGUgZnVuY3Rp
b24gbm93IHVzZXMgdGhlIHN0YWNrLiBUaGUgc3RhY2sgaXMgbm90IGFjY2Vzc2libGUNCj4gZnJv
bSByZWFsIG1vZGUgdGhvdWdoLg0KPiANCj4gU28gdG8ga2VlcCBjYWxsaW5nIHRoZSBmdW5jdGlv
biwgbGV0J3MgdHVybiBvbiBNU1JfRFIgd2hpbGUgd2UgY2FsbCBpdC4NCj4gVGhhdCB3YXksIGFs
bCBwb2ludGVyIHJlZmVyZW5jZXMgdG8gdGhlIHN0YWNrIGFyZSBoYW5kbGVkIHZpcnR1YWxseS4N
Cj4gDQo+IEluIGFkZGl0aW9uLCBtYWtlIHN1cmUgdG8gc2F2ZS9yZXN0b3JlIHIxMiBvbiB0aGUg
c3RhY2ssIGFzIGl0IG1heSBnZXQNCj4gY2xvYmJlcmVkIGJ5IHRoZSBDIGZ1bmN0aW9uLg0KPiAN
Cj4gUmVwb3J0ZWQtYnk6IE1hdHQgRXZhbnMgPG1hdHRAb3psYWJzLm9yZz4NCj4gRml4ZXM6IDg2
Mzc3MWEyOGUyNyAoInBvd2VycGMvMzJzOiBDb252ZXJ0IHN3aXRjaF9tbXVfY29udGV4dCgpIHRv
IEMiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgR3JhZiA8Z3JhZkBhbWF6b24uY29tPg0K
PiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZyAjIHY1LjE0Kw0KPiANCj4gLS0tDQo+IA0KPiB2
MSAtPiB2MjoNCj4gDQo+ICAgIC0gU2F2ZSBhbmQgcmVzdG9yZSBSMTIsIHNvIHRoYXQgd2UgZG9u
J3QgdG91Y2ggdm9sYXRpbGUgcmVnaXN0ZXJzDQo+ICAgICAgd2hpbGUgY2FsbGluZyBpbnRvIEMu
DQo+IA0KPiB2MiAtPiB2MzoNCj4gDQo+ICAgIC0gU2F2ZSBhbmQgcmVzdG9yZSBSMTIgb24gdGhl
IHN0YWNrLiBTUFJHcyBtYXkgYmUgY2xvYmJlcmVkIGJ5DQo+ICAgICAgcGFnZSBmYXVsdHMuDQo+
IC0tLQ0KPiAgIGFyY2gvcG93ZXJwYy9rdm0vYm9vazNzXzMyX3NyLlMgfCAyNiArKysrKysrKysr
KysrKysrKysrKystLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCA1
IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9rdm0vYm9vazNz
XzMyX3NyLlMgYi9hcmNoL3Bvd2VycGMva3ZtL2Jvb2szc18zMl9zci5TDQo+IGluZGV4IGUzYWI5
ZGY2Y2YxOS4uNmNmY2QyMGQ0NjY4IDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMva3ZtL2Jv
b2szc18zMl9zci5TDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9rdm0vYm9vazNzXzMyX3NyLlMNCj4g
QEAgLTEyMiwxMSArMTIyLDI3IEBADQo+ICAgDQo+ICAgCS8qIDB4MCAtIDB4YiAqLw0KPiAgIA0K
PiAtCS8qICdjdXJyZW50LT5tbScgbmVlZHMgdG8gYmUgaW4gcjQgKi8NCj4gLQl0b3BoeXMocjQs
IHIyKQ0KPiAtCWx3eglyNCwgTU0ocjQpDQo+IC0JdG9waHlzKHI0LCByNCkNCj4gLQkvKiBUaGlz
IG9ubHkgY2xvYmJlcnMgcjAsIHIzLCByNCBhbmQgcjUgKi8NCj4gKwkvKiBzd2l0Y2hfbW11X2Nv
bnRleHQoKSBuZWVkcyBwYWdpbmcsIGxldCdzIGVuYWJsZSBpdCAqLw0KPiArCW1mbXNyICAgcjkN
Cj4gKwlvcmkgICAgIHIxMSwgcjksIE1TUl9EUg0KPiArCW10bXNyICAgcjExDQo+ICsJc3luYw0K
PiArDQo+ICsJLyogc3dpdGNoX21tdV9jb250ZXh0KCkgY2xvYmJlcnMgcjEyLCByZXNjdWUgaXQg
Ki8NCj4gKwlTQVZFX0dQUigxMiwgcjEpDQo+ICsNCj4gKwkvKiBDYWxsaW5nIHN3aXRjaF9tbXVf
Y29udGV4dCg8aW52PiwgY3VycmVudC0+bW0sIDxpbnY+KTsgKi8NCj4gKwlsd3oJcjQsIE1NKHIy
KQ0KPiAgIAlibAlzd2l0Y2hfbW11X2NvbnRleHQNCj4gICANCj4gKwkvKiByZXN0b3JlIHIxMiAq
Lw0KPiArCVJFU1RfR1BSKDEyLCByMSkNCj4gKw0KPiArCS8qIERpc2FibGUgcGFnaW5nIGFnYWlu
ICovDQo+ICsJbWZtc3IgICByOQ0KPiArCWxpICAgICAgcjYsIE1TUl9EUg0KPiArCWFuZGMgICAg
cjksIHI5LCByNg0KDQpJbnN0ZWFkIG9mIGxpL2FuZGMgeW91IGNhbiBkbzoNCg0KCXJsd2lubQly
OSwgcjksIDAsIH5NU1JfRFINCg0KPiArCW10bXNyCXI5DQo+ICsJc3luYw0KPiArDQo+ICAgLmVu
ZG0=
