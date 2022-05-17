Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A5500529FAE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 May 2022 12:45:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L2XpW42N0z3c8j
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 May 2022 20:45:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::615;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0615.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::615])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L2Xp11Ggrz3bpf
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 May 2022 20:45:27 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lv6Na2PqVSRWeA0lL/wk4Ck4f0kY6XxNWwhzcdqn4jz3qqaQ35ZfaAoARf5ahqq21gMejrk7H5Dqu8WqENODL62vCzvfwp7xaU4plg7a4sDNteX7/OPHFscwhVL2+7nljADYyPfm8vdZsq3+BAd9ux1fqsCm+RKE/dyif8m447Yt8F4tVh6/Z9QKcoxT00U8uyFuuyyogDeHFEbSnHZ1vzKW2baIuvS36R0xx3N8Z3ASvxafgwBIHI2xTWGdifCxJcnP83rmOhb8Ik4xXoiaKxMdkOidqCBfHtAMDwKZydwF6AQT1/WBFdXt1sHIOmuVxYSsIPWccWbDwJhpMxAhjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PHbeRBOfuS/M+nC+AasVmanTHSUu0Qku72cuC7K8Y8k=;
 b=kfH4w6JJFhC2sF9RWkk7irR2kT+Dxw4fAywf1aEzG7PO1c1lqwvg4OyaGbmB0Ul1cDVQZzTH8CxaCjar5210Un3hMt/+vyCvXr27vGHpnA0uq7oikc7Z5VxyWfrimdFhvQHTXgNJ/g+E38bvqn3bPJZiIWFU5G83GQXhPII5FX/NEoflFCkEIOfkasq6Llid9jlF4O82UvMePZpJnBdCuGcraXltstJrcibaDmkskJibV0EZ2IGc31wKCZawKbPaH4irRBFOTBTDczA+wKoVAIKtHtwzwFxByiuaouhs5HR3SEZk/ISYbwsE43Sohlrane55ayD8dpStmcO04ovmFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2102.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Tue, 17 May
 2022 10:45:01 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::ad4e:c157:e9ac:385d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::ad4e:c157:e9ac:385d%8]) with mapi id 15.20.5250.018; Tue, 17 May 2022
 10:45:01 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: YueHaibing <yuehaibing@huawei.com>, "mpe@ellerman.id.au"
 <mpe@ellerman.id.au>, "benh@kernel.crashing.org" <benh@kernel.crashing.org>,
 "paulus@samba.org" <paulus@samba.org>
Subject: Re: [PATCH -next] powerpc/book3e: Fix build error
Thread-Topic: [PATCH -next] powerpc/book3e: Fix build error
Thread-Index: AQHYadNJAMLjP+EZt0SBLxAi6OP6060i4qkA
Date: Tue, 17 May 2022 10:45:01 +0000
Message-ID: <0e8b7931-9bfb-1948-c141-c4e612ba0fe6@csgroup.eu>
References: <20220517094830.27560-1-yuehaibing@huawei.com>
In-Reply-To: <20220517094830.27560-1-yuehaibing@huawei.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f0ec0c17-d493-4b4e-50c9-08da37f24b73
x-ms-traffictypediagnostic: MRZP264MB2102:EE_
x-microsoft-antispam-prvs: <MRZP264MB210256940A83A1B5EF45FEE7EDCE9@MRZP264MB2102.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qfmFqVCtX5UWTDi3+Uq+lm9e0PTSYfXB8o+M3h8s5ehk6qwfeVpKNoTjOQ2o9Riee6kerHgftnvO+JgQzVOLlX4wJ2TiNdZwT+ISdSNvo9tsqK+3saKIklu9/UATkjeyG2Qe1xWWJcQ1aiOzHz//x4cOykLlmKPypGWX1woDQTxQl8D0SK7VTjloUdWiBhwPVTfBLkaNMbwajeIdZzaXXzF2HJbrGW2Por2iAf3PKgojJKGrUF4yJkcrukID8vAcjk0Rdf1MCIyCSugKGs/oFzgg3439rEtIgvB59ha8uPUsJ1vSqfdlC4HV0s7WMqzkvUifydEgS2+n7TO5qH+xJaQQOwEScTLCNVZB6DIDwv/GtnOnaj87OPIuVAF95X97UX8gh4a1UweIXT4AL0xe+VeJCfGSgS7Prf1WgEkzF+5mrpT95E9YvMBGuJuEn4euGS2adrYRmIYDBgskxcqjA0p6clIOtcK262ARdGH+EQ3cTQ/1+YSp7VKknWZ4+wWr77uS1lmM5qggaq2MzYoTNhol/jyvpn2NuNZrcjYqtr4Fs8M0D93eual/wo58D+nw2cyxWKTl8ZsyHdF3J9korScHhwT1AiEUD+y1VM4tfIyV924QyzQfqA9LYpN5gIxFK/AYShLbgNhoATniLnRkOfAXqkuTIFd/Q1VAsY5ij9W9/jcnxxL4GwSPg6Gr8gGZhvF3bcKqzE0+XzFng6txqPcQU4l5JpWZuRKnfwVtH7BC0XslinbjjjZafGg5ersSI/vwfLL51Y/XE30A/QUbDw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(186003)(83380400001)(2616005)(36756003)(4744005)(6512007)(71200400001)(508600001)(31686004)(6486002)(2906002)(5660300002)(31696002)(91956017)(76116006)(122000001)(38100700002)(38070700005)(66556008)(8936002)(66476007)(64756008)(4326008)(8676002)(66946007)(66446008)(6506007)(110136005)(54906003)(44832011)(26005)(86362001)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eTEvL25pRUJoWUJYeG5UcWRxTXhhVHhSNG13V1ZrZVp2NWlELzlucWJEQWlU?=
 =?utf-8?B?ZkRwY1d6K1dOV0R6MlZQME15ekFReHNDSFlFaXkwRnRIVndKc2dJRTVlRWtJ?=
 =?utf-8?B?RjgwUHRqMzRvbU1veWwrSDk0eXZOUUpuVXpuTzlkd0I2QXJieU5iWjd6K0xQ?=
 =?utf-8?B?NWcyMjJXUDF2UzB5MmpMR1pNbDhJMlBZMnJlazdDV2l2REtodUoyYmR2VDcz?=
 =?utf-8?B?TmVNc3VCWHFUSDZLU1hqdnRLcGNaam1LZ014RzVwNFpUYlhqM09GeW9Xc0tW?=
 =?utf-8?B?aHZ5d0VFcUErSXRKTVQxZy85N2hleTFRTDRGSFhjbjJKbm9mRXRkZnhOd2hr?=
 =?utf-8?B?NWJ3ZzJ6bmtycXRoQytabGV2Z2NqeHZkeURvZ1g0YnUwSGpkZVdwNlhVWkZW?=
 =?utf-8?B?eXFrLzF5VUdKVjhJLzlTTEtvWjU5bGdsclBtLzNTaHFCWGlqYTdTbnlZbmti?=
 =?utf-8?B?MXppSGVkTlA3S3NZMTF1TC8zK0FNcGNZYnFIaTVWK21QYlducTM1YndDUUhU?=
 =?utf-8?B?QVVTNkY5T2JPZWxBbzNwekx5RWFncEFrZ3hpZSs0Tzh2TTE0OXo1TGl6eXpi?=
 =?utf-8?B?QUdua0RFOTNCQ3ZnVGJzdk9hT0NublpvY1NkRGpwQ2RHVVE3OTlxRTVObmh1?=
 =?utf-8?B?YzVMbVBwRWpLN3BZc0JpQ2t0OGJmYlU3WXhNeXhaTWZLWHJtM3Q3bzRWTUdz?=
 =?utf-8?B?UVdDdmZTWVhLTTBxdHBvZzdBTEh4VXBERTNCMXNqVnNtM2NKalFkU25jN0F0?=
 =?utf-8?B?RlZRZUU3UjNHR0dyam43bHAwUkdtNDBCaVFUa1VqMUVVQ0NEcmZnWDZoRTds?=
 =?utf-8?B?ekY3QkdXakJmZkxmNnExZTlHRmxFR2xwdmh4YkVNTHFrZzYydm5KYWtuSWgw?=
 =?utf-8?B?RHhuaktGcE83bHFaaHpjN0E2aFBQdzhueTdEZ0ZyK1NvZ05kWXJ2VHhTSGUv?=
 =?utf-8?B?OXp1WDNYR0hvNlMzcUsxUWUxOVJoQTRXWFVoQkZVa2lVMDIxaEF0Y0lBSE83?=
 =?utf-8?B?MmJmcWtpaHdhQjRXcUd6b0FrNFRPWjRTelNidjhDUVVIM0xDZnhrK3J1NmhX?=
 =?utf-8?B?SEZrR3FMR2NyMXZRWGxZRlhmNC9RWmQrQkN3V0F1THJoQjkzNkJTL0FvZ1Y5?=
 =?utf-8?B?QzlsOEhsT1ZZUXlkdk9qVkVEWEw5U2lBR0o2UDBnYU8vZmhyYXJxQWZwMFEv?=
 =?utf-8?B?bkYxQ0krTVpleDN5R09MTnFUd2V2MXVHMEpPeTZPdGIyOFJFQkNYOEtSK0Fj?=
 =?utf-8?B?Q1crNzdOT0hQZkVadGI5dU9nNjNJTnFPZ0xXNC9iUmU4Nm01ZldjeTVzNHJo?=
 =?utf-8?B?ZmhFVy9ZQ1JLZG1TVGg2Y2tSNzhEWHdnNVFQYi9Ca0pnaGtNc2plQjlIb2JS?=
 =?utf-8?B?TnF2TC9FdXFRalRqb0dvRi9JUUQ2c2JqOG16L2NodWxBT1Z2VmlrZS9QeXJU?=
 =?utf-8?B?VjROWVZtRXZ2SGlpRWwrRDQrQ2g0U2J6aW1QTHlPMXNlTUhuRm9ET2xTTzEy?=
 =?utf-8?B?QU8zMk5tWDVBRTNDSy9rTGtoMFJkblBjNGdISWN3TU9NaGpFRkJ1QlM4SUI4?=
 =?utf-8?B?QWlyWnBGWCtoUERLWHh3aTZ6UXJKUWFqdlJpUXhhNUVGNzdPSDFvR1VJQ0s2?=
 =?utf-8?B?bzVXKzErZWp2VG1RWDR5REhPd2VGS0IvSUFRRlE4VWMwYldSS0E5MG1yNEE5?=
 =?utf-8?B?TUI3d3JvTmd6UUdKaSt2S2dVejhZNWw4RklBWitjTlhSL1RFbHFTenBscjVl?=
 =?utf-8?B?bHBQWENVUDVnMFFpQkk4K0FJNDZnREM1YVBrLzk3ekRwNDVjVkJ5a2VaU1gx?=
 =?utf-8?B?OW1yWmsvZnVmNGs5K0EzZkNueUoyNGN1Q1JxYTBVV2F6QzhuUzBod25WVWN0?=
 =?utf-8?B?YzJQN09OSEc4ejVGTlU1bmpyUlI1RklFNXM1SnpNZGU5d1FwNHJXN3VNNjJv?=
 =?utf-8?B?a3YyS3l5L3hDRTg3bUJ1RVpxbjk2WkJyUnVTS2puTWZFQ2xlL0pwb0xtWWhL?=
 =?utf-8?B?MStzMUNmRlU1blB4TUZQcjVTTkdqSmhwbzdyT3RDZ1d0YXU0MHRiMlQrQVB3?=
 =?utf-8?B?SVlYaDVVWjBuL010REZZd2V0cFNvRm04NC9JN3dTbTNYWVFpSEp0QWFTUlZP?=
 =?utf-8?B?dDZSUGg4dnJ6U1RSdmdYQ0pwQlc0bUhKdmE0L1VzQUdpbkVSaldoTHJ2bWVT?=
 =?utf-8?B?YmxGTWdyT3YrM3BCYVhVTTVQdWl5V3psZENHb3B0elFhNU1UNTdnQlNnMEdm?=
 =?utf-8?B?VjY2RzBCNlBmZW1WRDBuSGdJci9kZDduaCtaYjE3TU54QXNiN3FxVGprRW9J?=
 =?utf-8?B?alkwdXpTN0tTWjhFeGY2UFZGK0ZWZkY4ZGlEb3NIalAwcDdBVktmakczcU40?=
 =?utf-8?Q?op/ydELsg+FPezf5dlqt+78EdQdqdyOF4Q5BQ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E5BA5B4D04E4AD4EA1B05C435E178D8C@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f0ec0c17-d493-4b4e-50c9-08da37f24b73
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2022 10:45:01.3339 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mfxrGnUGP4fNWGA+AVYp20GOQpRHn69Ca9hyk+QALYTo51agatxx/60EZKFQrsIFfdWO1zPbZ3ZlX5HhUKpUg4ecxSU3nCeMEI8ECQE3gaM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2102
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE3LzA1LzIwMjIgw6AgMTE6NDgsIFl1ZUhhaWJpbmcgYSDDqWNyaXTCoDoNCj4gYXJj
aC9wb3dlcnBjL21tL25vaGFzaC9mc2xfYm9vazNlLmM6IEluIGZ1bmN0aW9uIOKAmHJlbG9jYXRl
X2luaXTigJk6DQo+IGFyY2gvcG93ZXJwYy9tbS9ub2hhc2gvZnNsX2Jvb2szZS5jOjM0ODoyOiBl
cnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24g4oCYZWFybHlfZ2V0X2ZpcnN0
X21lbWJsb2NrX2luZm/igJkgWy1XZXJyb3I9aW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25d
DQo+ICAgIGVhcmx5X2dldF9maXJzdF9tZW1ibG9ja19pbmZvKF9fdmEoZHRfcHRyKSwgJnNpemUp
Ow0KPiAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fg0KPiANCj4gQWRkIG1pc3Npbmcg
aW5jbHVkZSBmaWxlIGxpbnV4L29mX2ZkdC5oIHRvIGZpeCB0aGlzLg0KPiANCj4gU2lnbmVkLW9m
Zi1ieTogWXVlSGFpYmluZyA8eXVlaGFpYmluZ0BodWF3ZWkuY29tPg0KDQpUaGF0cyBmb3IgZml4
aW5nIHRoYXQuDQoNClJldmlld2VkLWJ5OiBDaHJpc3RvcGhlIExlcm95IDxjaHJpc3RvcGhlLmxl
cm95QGNzZ3JvdXAuZXU+DQoNCkl0IG1lYW5zIHdlIGRvbid0IGhhdmUgYW55IGRlZmNvbmZpZyBm
b3IgMzIgYml0cyBib29rZSB3aXRoIA0KQ09ORklHX1JFTE9DQVRBQkxFID8NCg0KPiAtLS0NCj4g
ICBhcmNoL3Bvd2VycGMvbW0vbm9oYXNoL2ZzbF9ib29rM2UuYyB8IDEgKw0KPiAgIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9t
bS9ub2hhc2gvZnNsX2Jvb2szZS5jIGIvYXJjaC9wb3dlcnBjL21tL25vaGFzaC9mc2xfYm9vazNl
LmMNCj4gaW5kZXggMDhhOTg0ZTI5NDMzLi4wOTNkYTRkYmRlZTEgMTAwNjQ0DQo+IC0tLSBhL2Fy
Y2gvcG93ZXJwYy9tbS9ub2hhc2gvZnNsX2Jvb2szZS5jDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9t
bS9ub2hhc2gvZnNsX2Jvb2szZS5jDQo+IEBAIC0zNiw2ICszNiw3IEBADQo+ICAgI2luY2x1ZGUg
PGxpbnV4L2RlbGF5Lmg+DQo+ICAgI2luY2x1ZGUgPGxpbnV4L2hpZ2htZW0uaD4NCj4gICAjaW5j
bHVkZSA8bGludXgvbWVtYmxvY2suaD4NCj4gKyNpbmNsdWRlIDxsaW51eC9vZl9mZHQuaD4NCj4g
ICANCj4gICAjaW5jbHVkZSA8YXNtL2lvLmg+DQo+ICAgI2luY2x1ZGUgPGFzbS9tbXVfY29udGV4
dC5oPg==
