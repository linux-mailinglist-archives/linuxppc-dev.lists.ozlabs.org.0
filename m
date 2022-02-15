Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CEF84B64F1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 09:01:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JyYSd6z06z3cSZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 19:01:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::61e;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on061e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::61e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JyYS95M1Qz3bT5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Feb 2022 19:00:55 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L1hcKuVk5bpQ7mu84AtBjx8mhRT9Ah3eNXoXL36nF87ZilKlSz03neFL7Gs5hlUwT7mEn/36rrBOb1huGOGPd7tOWdGITXgCnkG+dOK5xYp/YPeMP8ZeCozAeEAzY5YGXk+4e39KZ/BtsK9gFj7O3tMOtjUo1gumMklY3gi8L6X72Rt4IRT5wEyt7OrKffI9Cn9yqGo64Xw631ypJrzMjdioffYPsS2aFlYJsR7Ns9l+xY+AIdXo8du13ZHznXidcBK0ar7h9k/KS+S45XyCdOY6ghyMeqGyPpSy4fy/gXkLH7KzVsXir0eq6VNFQbrQc3ANOIbsCo6pWafTOPXe+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2QKZLjtowQQ4RBp06oFqUgTkF7NfrWVGfi+DYEnbaOo=;
 b=LWM88+4E3YY4+CikOlQJSavH9cGcR6CbQTz8pDqKaWhomSi3zM7qiLxovOwDW7eCBduGoEcyoBaxJL547NlumSWhptJD5RbW5sy9HB/fHPIW6GE2Ez/yYHNETaiKz5uonMvfD+WKAyglQueTTzr9ItZ6/gt1gmOnldQc/DnTEq7NIWQkD607liMk4ZWCD+oA26Y468krMIcpHVAI3iQbwxfQDk+Ilpu2bKbjSnAjsNs+XPd4vC+it5S50SHxOwLdpv4OHskY/NJM4bOu5U7eg3k3kg3sry6j/XikgI4SPDMbdHmINPTDUIaLHyXeHixNGp1usTpOEN1qD9TdTBR30Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB3755.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:160::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.14; Tue, 15 Feb
 2022 08:00:33 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c9a2:1db0:5469:54e1]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c9a2:1db0:5469:54e1%9]) with mapi id 15.20.4975.019; Tue, 15 Feb 2022
 08:00:33 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, Jiri Kosina
 <jikos@kernel.org>, Joe Lawrence <joe.lawrence@redhat.com>, Josh Poimboeuf
 <jpoimboe@redhat.com>, Miroslav Benes <mbenes@suse.cz>, Ingo Molnar
 <mingo@redhat.com>, Petr Mladek <pmladek@suse.com>, Steven Rostedt
 <rostedt@goodmis.org>
Subject: Re: [PATCH v2 09/13] powerpc/ftrace: Implement
 CONFIG_DYNAMIC_FTRACE_WITH_ARGS
Thread-Topic: [PATCH v2 09/13] powerpc/ftrace: Implement
 CONFIG_DYNAMIC_FTRACE_WITH_ARGS
Thread-Index: AQHX9cAEWTCD8cHnLE+YV5TEx6NNVqyTgraAgAEV/wA=
Date: Tue, 15 Feb 2022 08:00:33 +0000
Message-ID: <1b28f52a-f8b7-6b5c-e726-feac4123517d@csgroup.eu>
References: <cover.1640017960.git.christophe.leroy@csgroup.eu>
 <5831f711a778fcd6eb51eb5898f1faae4378b35b.1640017960.git.christophe.leroy@csgroup.eu>
 <1644852011.qg7ud9elo2.naveen@linux.ibm.com>
In-Reply-To: <1644852011.qg7ud9elo2.naveen@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9ea3408a-36bc-4a06-7140-08d9f0593def
x-ms-traffictypediagnostic: PR0P264MB3755:EE_
x-microsoft-antispam-prvs: <PR0P264MB375572E69A6C4D4D0F329FAAED349@PR0P264MB3755.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YS4dShMjtkLbKynFVkwJ9aS7kngHmIYm3yFnYUe/q0NfM1BzXca1siyvv0jpUPt+7hAPum3tI/lOGJl0PSlntM2wDlaRqvz25RW4tIiTD4KMiRHPnrqbNn7uWoZLiwPToqFhKNTfPBcQ0cZaJ90BS5Iv/inZhlpwM0HByxWmuLFeKBz/3EXpXqADOLQdA5P2HNQ6PGN7DfEcpoWPc/CLlpxupix5fbCKXRkL8Uc8um2GhFL8rh20sUR5Wt/oX66+6lfITS4w/HD0HgP4UVhO8632dW5WG8EEfI/JuLlOfXnxFH4Dn1Ry08MmZh3iKdRMz1aCSpawkfMCIHxTAC81rXeEgQISsM/6CWNMHCFwUG1pqZTwVFqAteFIe6kyFRo3ipUUO/TBfILufO5kcf8JwmQ2opUhgLbfAelR9hIIxS1DFFPttv4zOiyN1wX4rxKMQOAVH9bldMhhzICYKWfpc2VcqyqQh0xamb212fXBj8IE66WFB9F1GnSNqEMC8YV73fILhQj/aqSB+knkwPI3iK9s4QhrgruGYzqkc6G6cuI3ne8rOEtzeaomT6c1SP9YjLDuP9KhkTpYrQC5lLHnTUUwnOTY/NlYiuuluUxznjgf6Q8h52UiBFhD4b4lq+EC82ORTFCcSmQeRkIRwX+xYYMkDHII1OAc7qzCqq0FondGHs1ZKL4NwV49k8oWCRTCPg/dQFQgHX1aa+NgLsgj+2G128cCMibletq0eQrcb86IVKjbWiPV4KsBfv8DOvDoYdCWqas3QgBoj8liva4fnw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(31686004)(2616005)(83380400001)(6512007)(31696002)(66574015)(36756003)(26005)(186003)(8676002)(6506007)(316002)(122000001)(110136005)(44832011)(76116006)(66476007)(91956017)(8936002)(54906003)(71200400001)(66556008)(508600001)(2906002)(5660300002)(66446008)(66946007)(6486002)(7416002)(64756008)(86362001)(38070700005)(4326008)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K1BuYW4wWWNxaW1na1Q1Y3VtL3dRWnlJeGJNQ3kzemxndkdMbW5mZmE0Ty9V?=
 =?utf-8?B?MGk4Qi91cTdYcnVOZWFLS3BRODZqRVZXT1RzWVNFTzZuaGh5N3l1Wkx3YXZq?=
 =?utf-8?B?TXhkeDkrQ2ZpTHN4S2w5TmRhcjBMSXh6ZXpPZHh3THU2QkN4ZjMrS2Z0WVUv?=
 =?utf-8?B?c0xFTXFWem9nZG55SGZ4RmlqL012bXFIYWZuaGlJVk5HM3FnUjhhUVpKUGRh?=
 =?utf-8?B?WmFiR2t5YjBnZXZCZlFocjFPV0k2TTdnYTk2eTNsV090OVVxNzljMmxLUDdj?=
 =?utf-8?B?c05sUXFhSEFUV0piWHNUQ0hmOStKQUloeEFqdE01TmhscUVBazBuTmoxMDU5?=
 =?utf-8?B?VnZOdVowdjRIVnJUSVpHZUlubFRYQWd0RlBIYUhHUlU4QXQ2SVJaWDBTUXVa?=
 =?utf-8?B?OGM4cDByNW9odk9XYldwY2pnaGRJeVZIaU1hQnFQaXRLbWJQaUFPV2E5WUd0?=
 =?utf-8?B?RlovS05aVTNJMTBNSWIxdnZreXVsOEdpRnBLL3VjY2daQ0dNNzB1MUJCcUp6?=
 =?utf-8?B?NnV5QkNwYWs0ZkdOSHZSdURtdUJpSnRVdFBFNnJxSzdPRHAydW41bzNSUVY4?=
 =?utf-8?B?VGhaQU9TRERQcnhJQ3ZSbGcwakZqd0VtVHpiYnBkSFJXdTNiN3NBRGpTWTFz?=
 =?utf-8?B?SkVkNWlwSEk0RHhqV3VVVUg3OTg0d09aVk1ZcjZhZks1V2Roc0JVOGFKeG9Q?=
 =?utf-8?B?cWFVN1BkTStwWnBOVnZBaWhLZG1lcy9qRU9OQi9DOUtWbFRnMlFaYzdnTVhT?=
 =?utf-8?B?bWd5b3NmczBJTCtIZStSQlF3M2JLd20zY0dCZGJPTWRBS2tXY2dmT2kyR1dM?=
 =?utf-8?B?Z0dsK1BHalNLZUNvbzFjeDBjVXBSanl1aFM3bFF1dk5QWTZaejJ3QU5jNVhl?=
 =?utf-8?B?d2FRN2N2STNkSjdUN3Zib0ZxcWFHZU1McDZsQllVMkFxOEJmSnJoL3hmbGxq?=
 =?utf-8?B?aUhOc3JMQ3N5K1E4d21RLzJLcUMvR1A0NEVqMVYvQUxHSG1lSHBxNEMvMWNi?=
 =?utf-8?B?YTFzeHNMOUpvOGlhcDBNb2tqSkU3bGtWSkhqK0IwNXZkRkpRTS9FSkxhYi9W?=
 =?utf-8?B?LytWczR3UGxkQUhnQ0pRTDlVNUMwdFRESEx0MER0SzBPeEgwVlNweTltVGYr?=
 =?utf-8?B?cWNyKzBBK2JOVjJjWHBtdDBZSE03ellhcEdxTFRNZUo3TGJEM1JWQlVrSlFj?=
 =?utf-8?B?VGZqSytVVm9kNllWTFZ4VFpVamNGNjdZMmhkd2F5Z25tZ1psRkR5aEpDMFhR?=
 =?utf-8?B?SGxQYUpyUUN3NzF2ZkVmL1Y3YzBMMU93eFlTcEhDZmtNdmUwUVVLbFhHSlp4?=
 =?utf-8?B?QTg3ZEJONXRLSVNvL0RJMEEveWZON3BIVnF5VlRjclBvTFRPQjR3YUNYd3pH?=
 =?utf-8?B?aFFJanQ4WEE2TnVZb3BXdS9pQVhXRVVZY2JjWlFsWTNkamp2RzV4bmFpZEJ5?=
 =?utf-8?B?ZnQ4RXEreTNNQzBvS3ZKVERGZktZR0hGaXZWMkFkdEYxVDZCTXpNaEtvN0ZK?=
 =?utf-8?B?Z1M1T1RSRmljbWIyVmJISXBOYUVtUk1sSFhneGNQQW85bkVQWklNbW1Xd2kw?=
 =?utf-8?B?S1g2MytMNjNPTGJpV3ZUQVpRRzNYZUpRa1p4TzJJQXdpUzRBbE5tVklKVVNV?=
 =?utf-8?B?a2pLTVpBQUxweVJTVG9hV0RxdHg0M1RISVNhUVk1bXgwTXg2ZkVYRW9QR01W?=
 =?utf-8?B?TnZRU0RKN3ZnME1VVXlDVFdaVEhUZ2hIcXZ1WFlnQitDYmxSeVVNYXhZWWJY?=
 =?utf-8?B?R003Ykp0aStvK2l5VDVzM0E1ZFRZanZSckg4YzI5bzIxaHJiTWJNaThickNG?=
 =?utf-8?B?Q1dYd0NQQ05GaGpPWlFGTjZZSkcxbytUaG1HYVNqUjVyVWpWUUU2TkV2aVlW?=
 =?utf-8?B?d0I5eHAyN3JNWWlUVW5XNCt0VHBEbFlKdHl1dnJYRmtLSm9vM1c1Si9MQ2pW?=
 =?utf-8?B?dERpT2VIMWljRC9uSDBiamRvT2JPcllZd2dqeUlLaHFVcTZBQWdzYVp1M2Uy?=
 =?utf-8?B?cStnMEdSVzUzanlkRmpDdWNTSHYwVk9kMlJhMTIzcFpkY3c0MU5LZlYreGJ3?=
 =?utf-8?B?NkxWQ2R5ZktUUENuREJsREpQWEZVdEpDNkFheXBhK2w3K1pZL3hKc3RNWjZq?=
 =?utf-8?B?V1NmV1dYcTNYSlhYdWRwOVpGZkJyRWlPVGpjM0c0NEczcGdtY1pCOWJudUdD?=
 =?utf-8?B?ZXB0cjVEQjhvalJISm1iNUxGOEdNcUtVUFdkS1RLYktIWk1ZYTJCUmVhT2tY?=
 =?utf-8?Q?V7pE7IxenF2Pk9DtK1+cZmQpRUDx9E2MFUscEooY6Y=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <10E0D0EE8F581044996F6D768EC5B00B@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ea3408a-36bc-4a06-7140-08d9f0593def
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2022 08:00:33.1025 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GN4w7TCRE20coRphOd9dzQxWrPIu6FEWcHcoIkqL0QVAJx37HjycbIHF35wqet1dbclqMC8cLRFANReeiKI33tf2zfa8nJzManh+u3L5dhk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB3755
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
Cc: "live-patching@vger.kernel.org" <live-patching@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE0LzAyLzIwMjIgw6AgMTY6MjUsIE5hdmVlbiBOLiBSYW8gYSDDqWNyaXTCoDoNCj4g
Q2hyaXN0b3BoZSBMZXJveSB3cm90ZToNCj4+IEltcGxlbWVudCBDT05GSUdfRFlOQU1JQ19GVFJB
Q0VfV0lUSF9BUkdTLiBJdCBhY2NlbGVyYXRlcyB0aGUgY2FsbA0KPj4gb2YgbGl2ZXBhdGNoaW5n
Lg0KPj4NCj4+IEFsc28gbm90ZSB0aGF0IHBvd2VycGMgYmVpbmcgdGhlIGxhc3Qgb25lIHRvIGNv
bnZlcnQgdG8NCj4+IENPTkZJR19EWU5BTUlDX0ZUUkFDRV9XSVRIX0FSR1MsIGl0IHdpbGwgbm93
IGJlIHBvc3NpYmxlIHRvIHJlbW92ZQ0KPj4ga2xwX2FyY2hfc2V0X3BjKCkgb24gYWxsIGFyY2hp
dGVjdHVyZXMuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0
b3BoZS5sZXJveUBjc2dyb3VwLmV1Pg0KPj4gLS0tDQo+PiDCoGFyY2gvcG93ZXJwYy9LY29uZmln
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDEgKw0KPj4gwqBhcmNoL3Bvd2Vy
cGMvaW5jbHVkZS9hc20vZnRyYWNlLmjCoMKgwqAgfCAxNyArKysrKysrKysrKysrKysrKw0KPj4g
wqBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vbGl2ZXBhdGNoLmggfMKgIDQgKy0tLQ0KPj4gwqAz
IGZpbGVzIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+Pg0KPj4g
ZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9LY29uZmlnIGIvYXJjaC9wb3dlcnBjL0tjb25maWcN
Cj4+IGluZGV4IGNkYWMyMTE1ZWIwMC4uZTJiMTc5MmIyYWFlIDEwMDY0NA0KPj4gLS0tIGEvYXJj
aC9wb3dlcnBjL0tjb25maWcNCj4+ICsrKyBiL2FyY2gvcG93ZXJwYy9LY29uZmlnDQo+PiBAQCAt
MjEwLDYgKzIxMCw3IEBAIGNvbmZpZyBQUEMNCj4+IMKgwqDCoMKgIHNlbGVjdCBIQVZFX0RFQlVH
X0tNRU1MRUFLDQo+PiDCoMKgwqDCoCBzZWxlY3QgSEFWRV9ERUJVR19TVEFDS09WRVJGTE9XDQo+
PiDCoMKgwqDCoCBzZWxlY3QgSEFWRV9EWU5BTUlDX0ZUUkFDRQ0KPj4gK8KgwqDCoCBzZWxlY3Qg
SEFWRV9EWU5BTUlDX0ZUUkFDRV9XSVRIX0FSR1PCoMKgwqAgaWYgTVBST0ZJTEVfS0VSTkVMIHx8
IFBQQzMyDQo+PiDCoMKgwqDCoCBzZWxlY3QgSEFWRV9EWU5BTUlDX0ZUUkFDRV9XSVRIX1JFR1PC
oMKgwqAgaWYgTVBST0ZJTEVfS0VSTkVMIHx8IFBQQzMyDQo+PiDCoMKgwqDCoCBzZWxlY3QgSEFW
RV9FQlBGX0pJVA0KPj4gwqDCoMKgwqAgc2VsZWN0IEhBVkVfRUZGSUNJRU5UX1VOQUxJR05FRF9B
Q0NFU1PCoMKgwqAgaWYgIShDUFVfTElUVExFX0VORElBTiANCj4+ICYmIFBPV0VSN19DUFUpDQo+
PiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Z0cmFjZS5oIA0KPj4gYi9h
cmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vZnRyYWNlLmgNCj4+IGluZGV4IGIzZjYxODRmNzdlYS4u
NDVjM2Q2ZjExZGFhIDEwMDY0NA0KPj4gLS0tIGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Z0
cmFjZS5oDQo+PiArKysgYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vZnRyYWNlLmgNCj4+IEBA
IC0yMiw2ICsyMiwyMyBAQCBzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGxvbmcgDQo+PiBmdHJhY2Vf
Y2FsbF9hZGp1c3QodW5zaWduZWQgbG9uZyBhZGRyKQ0KPj4gwqBzdHJ1Y3QgZHluX2FyY2hfZnRy
YWNlIHsNCj4+IMKgwqDCoMKgIHN0cnVjdCBtb2R1bGUgKm1vZDsNCj4+IMKgfTsNCj4+ICsNCj4+
ICsjaWZkZWYgQ09ORklHX0RZTkFNSUNfRlRSQUNFX1dJVEhfQVJHUw0KPj4gK3N0cnVjdCBmdHJh
Y2VfcmVncyB7DQo+PiArwqDCoMKgIHN0cnVjdCBwdF9yZWdzIHJlZ3M7DQo+PiArfTsNCj4+ICsN
Cj4+ICtzdGF0aWMgX19hbHdheXNfaW5saW5lIHN0cnVjdCBwdF9yZWdzICphcmNoX2Z0cmFjZV9n
ZXRfcmVncyhzdHJ1Y3QgDQo+PiBmdHJhY2VfcmVncyAqZnJlZ3MpDQo+PiArew0KPj4gK8KgwqDC
oCByZXR1cm4gJmZyZWdzLT5yZWdzOw0KPj4gK30NCj4gDQo+IEkgdGhpbmsgdGhpcyBpcyB3cm9u
Zy4gV2UgbmVlZCB0byBkaWZmZXJlbnRpYXRlIGJldHdlZW4gZnRyYWNlX2NhbGxlcigpIA0KPiBh
bmQgZnRyYWNlX3JlZ3NfY2FsbGVyKCkgaGVyZSwgYW5kIG9ubHkgcmV0dXJuIHB0X3JlZ3MgaWYg
Y29taW5nIGluIA0KPiB0aHJvdWdoIGZ0cmFjZV9yZWdzX2NhbGxlcigpIChpLmUuLCBGTF9TQVZF
X1JFR1MgaXMgc2V0KS4NCg0KTm90IHN1cmUgSSBmb2xsb3cgeW91Lg0KDQpUaGlzIGlzIGJhc2Vk
IG9uIDU3NDBhN2M3MWFiNiAoInMzOTAvZnRyYWNlOiBhZGQgDQpIQVZFX0RZTkFNSUNfRlRSQUNF
X1dJVEhfQVJHUyBzdXBwb3J0IikNCg0KSXQncyBhbGwgdGhlIHBvaW50IG9mIEhBVkVfRFlOQU1J
Q19GVFJBQ0VfV0lUSF9BUkdTLCBoYXZlIHRoZSByZWdzIGFsc28gDQp3aXRoIGZ0cmFjZV9jYWxs
ZXIoKS4NCg0KU3VyZSB5b3Ugb25seSBoYXZlIHRoZSBwYXJhbXMsIGJ1dCB0aGF0J3MgdGhlIHNh
bWUgb24gczM5MCwgc28gd2hhdCBkaWQgDQpJIG1pc3MgPw0KDQoNCj4gDQo+PiArDQo+PiArc3Rh
dGljIF9fYWx3YXlzX2lubGluZSB2b2lkIGZ0cmFjZV9pbnN0cnVjdGlvbl9wb2ludGVyX3NldChz
dHJ1Y3QgDQo+PiBmdHJhY2VfcmVncyAqZnJlZ3MsDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGxvbmcgaXAp
DQo+PiArew0KPj4gK8KgwqDCoCByZWdzX3NldF9yZXR1cm5faXAoJmZyZWdzLT5yZWdzLCBpcCk7
DQo+IA0KPiBTaG91bGQgd2UgdXNlIHRoYXQgaGVscGVyIGhlcmU/IHJlZ3Nfc2V0X3JldHVybl9p
cCgpIGFsc28gdXBkYXRlcyBzb21lIA0KPiBvdGhlciBzdGF0ZSByZWxhdGVkIHRvIHRha2luZyBp
bnRlcnJ1cHRzIGFuZCBJIGRvbid0IHRoaW5rIGl0IG1ha2VzIA0KPiBzZW5zZSBmb3IgdXNlIHdp
dGggZnRyYWNlLg0KPiANCg0KDQpUb2RheSB3ZSBoYXZlOg0KDQoJc3RhdGljIGlubGluZSB2b2lk
IGtscF9hcmNoX3NldF9wYyhzdHJ1Y3QgZnRyYWNlX3JlZ3MgKmZyZWdzLCB1bnNpZ25lZCANCmxv
bmcgaXApDQoJew0KCQlzdHJ1Y3QgcHRfcmVncyAqcmVncyA9IGZ0cmFjZV9nZXRfcmVncyhmcmVn
cyk7DQoNCgkJcmVnc19zZXRfcmV0dXJuX2lwKHJlZ3MsIGlwKTsNCgl9DQoNCg0KV2hpY2ggbGlr
ZSB4ODYgYW5kIHMzOTAgYmVjb21lczoNCg0KCXN0YXRpYyBpbmxpbmUgdm9pZCBrbHBfYXJjaF9z
ZXRfcGMoc3RydWN0IGZ0cmFjZV9yZWdzICpmcmVncywgdW5zaWduZWQgDQpsb25nIGlwKQ0KCXsN
CgkJZnRyYWNlX2luc3RydWN0aW9uX3BvaW50ZXJfc2V0KGZyZWdzLCBpcCk7DQoJfQ0KDQoNCg0K
VGhhdCdzIHRoZSByZWFzb24gd2h5IEkndmUgYmVlbiB1c2luZyByZWdzX3NldF9yZXR1cm5faXAo
KS4gRG8geW91IHRoaW5rIA0KaXQgd2FzIHdyb25nIHRvIHVzZSByZWdzX3NldF9yZXR1cm5faXAo
KSBpbiBrbHBfYXJjaF9zZXRfcGMoKSA/DQoNClRoYXQgd2FzIGFkZGVkIGJ5IDU5ZGM1YmZjYTBj
YiAoInBvd2VycGMvNjRzOiBhdm9pZCByZWxvYWRpbmcgKEgpU1JSIA0KcmVnaXN0ZXJzIGlmIHRo
ZXkgYXJlIHN0aWxsIHZhbGlkIikNCg0KQ2hyaXN0b3BoZQ==
