Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A2F74DC6B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jul 2023 19:27:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=Y2oY3T/N;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R09tD4pMTz3bnB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 03:27:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=Y2oY3T/N;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::604; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20604.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::604])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R09sJ3XZ0z3bP2
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 03:26:27 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h6dh4ZZigjpuye0GasZ3lApVaIQN7Rh1yd7vY2zTvJGqVRgZCQ3avGHu/XubGKglHDgR1Ol4y3F2yxJOG8+i7s2vDOralu3NMGbnVADonZOwIXbWnIZPJhpj7duwwXWodNmYBzEsUhX0ddBGxoK64/VyiuTOPGQIf/G/3t95rMNLWDLLELtjoH+nLt0aGGFaW4UqLBI6b1C3rG5/p0rG7hbsZKy9S06huPb5esMTFMsoZ4NHeCkOrTGc3XB1b+xq1C2oryuP6PEKpLfCRBRrrTnugxOqVKe8aMELRBZEuYPSSDDAFidYt0J8/vVXSEx3E8ElB8tkP2sqLWk67g67Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sbun6ldggI68DA40LYaLld3RrwCyfTileonvE5PdlMM=;
 b=LWwe2UG+TeJsOArNBZLbfZ1MogThbQEelZqHBmILok6j/uecBk8BqfOM5gBahl1ZTT2nP+O5U3IdTOLhRRWR8gYxTAMOB+rAX7IoBW2CcfFJz63/QaO8Y7XgGk/kdc9x+1KRGtRWUgKbEBv3SKEwoxLoow+8+eNCRCkE0devuN5xE+J4j/oHFeAbRpgQJ0y3ZVY/SwTNqfA5TGIiIQE9dO6JY/IDMDz7vIs5AAzhEGL4/ZTxP/fVoW41Xv/x0jbl1+ZJWX9Sve8JvCG+5yV1JiKS6uOKtC6moYibd0prACW5Gwph/TFNtZ7lM//OvffJby9YzfRx+OLRzYYqliLTNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sbun6ldggI68DA40LYaLld3RrwCyfTileonvE5PdlMM=;
 b=Y2oY3T/NBZo0WC/XGa0eYG9OfPI3w9mtFw/DOCFzUg/9vYkkt89+VxuQ0/T9YNSIQ2ms+slkw22D7QZ/xp3Xjz1kAeXIbEg+niis1XGXtukkYIlbAjFiZYeebJ+StOX50mrmItFf1AfeSkXDGtcd4AgFj9OhPp+DxYJZQTBa940b8BPlJX1TOyDo3wlJSXpZQR09Yy7fvQ2E6uMvm6LOhVPm0h+Je1QYz6J8Id50H0rURt49hc+CXn7RuG23+1yGKoXodv80Z0b4ptISIftaH4+52hbfD4A9eJ0TkMpoxoiOmFk4EnN4eWmksvFFv1UDwDe6gtsTenptoTk+YV00nA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2956.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Mon, 10 Jul
 2023 17:26:08 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::802b:33:561c:4217]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::802b:33:561c:4217%4]) with mapi id 15.20.6565.028; Mon, 10 Jul 2023
 17:26:07 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>, "linux-mm@kvack.org"
	<linux-mm@kvack.org>, "akpm@linux-foundation.org"
	<akpm@linux-foundation.org>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"npiggin@gmail.com" <npiggin@gmail.com>
Subject: Re: [PATCH v4 04/13] mm/vmemmap: Allow architectures to override how
 vmemmap optimization works
Thread-Topic: [PATCH v4 04/13] mm/vmemmap: Allow architectures to override how
 vmemmap optimization works
Thread-Index: AQHZs0jmoaNw8vb/dkO5404EDoobdq+zQKcA
Date: Mon, 10 Jul 2023 17:26:07 +0000
Message-ID: <444ec1b2-296e-fee1-bf24-d4e83c825518@csgroup.eu>
References: <20230710160842.56300-1-aneesh.kumar@linux.ibm.com>
 <20230710160842.56300-5-aneesh.kumar@linux.ibm.com>
In-Reply-To: <20230710160842.56300-5-aneesh.kumar@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB2956:EE_
x-ms-office365-filtering-correlation-id: 0c26005a-f70c-49a4-1bf8-08db816abf4f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  7sCNbQ1H1sIkQGln8bHu+1kUK8iUBKfhe93kiVQmBu+KK1epC8dncE6qem/mByej2NAswwiA+EdKiwwJNw1OBtRVq+NN+rc8wa+RlPL0okTn74ckNG+A/Eq2wnslE4mfDBlJEQ6Y4lflaq/EUyfPIpUcNosr0ry7b3rlpYtEtv6ZoEBt/5kfS4VnwBEodV+D+vc6AqSSZ7FMzMlUr51+Tr6YzHuTiItCqNaRAlWNzhLjl2prnzvUlQzRPJ+J/K7BqpHhh+t1kDi15pWzI/Nx5vtbXs18migBx2I1pmjyWGhlhZ4UZJLjPZTEuW4l5QYqP4O+E4LGNtVJbLsSzQSHcw5Cl+fa680k4+qAV6/h48+glBUZ3Tr7X0MZDK8UK9l1TwO0pK8DNhMF80AQkP3J3G/uIczD3mOO4YVk379zne8RaUvq9xvKQHjygmC431RvalYDerC86W417mW44w07s/hebLKPWXTCQgxZmsHioZA0LLcYutufcimWkCXaRE2t48pX8WVDlOat8otJvTYbAjFnatfJGcOJPwp+RAw7+3xiK+PshGpBxgJ3/ixPLMGtCYDFhMt3GteVZspb4FzTVXzinUYmbt4vsPuCEUfry+ptEoZY7K/2d4Tz5PiKxwdAWlH8ZEfV16godTNCT8OX8uuUtt09I0JXpaA3uBDzvWTul2uw1HcZJHZsFkmsEpCL
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(376002)(39860400002)(136003)(396003)(451199021)(86362001)(38100700002)(38070700005)(31696002)(31686004)(36756003)(6486002)(76116006)(110136005)(54906003)(71200400001)(91956017)(122000001)(26005)(186003)(6506007)(6512007)(2616005)(44832011)(7416002)(5660300002)(316002)(2906002)(66556008)(478600001)(66946007)(8936002)(8676002)(66574015)(83380400001)(4326008)(64756008)(66446008)(66476007)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?WWNycDNCZkdjS2U5OXJwVVlnOE9rVFJzMkFpbDgrbVpEc1JrRG5oVnBsQk5R?=
 =?utf-8?B?emhFbEpFYVY3dUowZXQwVXRNNGRqZiswTFBoa2cxUFJuOHBVdnJna3ZQTUhj?=
 =?utf-8?B?R1JKSmZUdlBvN3BPMzNiNEhMREhYNnhyZkFRL0R3Snc3TWIwZE9TMmpVR08y?=
 =?utf-8?B?T29vM2daM1U4VDRrdllYM2VYQjI2Qk55S3JGTUxZSUs2dXlNRDF0MjIvbXZn?=
 =?utf-8?B?N2lGbDV0QXVGUGt2eVRKVktGckFpeTZFcTBkdFUrTFQxYzFJWWF3THlUd1kz?=
 =?utf-8?B?WGtmSFlJYmo2QmFDRHhzQ1ljQUo3d3gvaTVwa2E5b2p3L1VCaEk3TE0vdTdK?=
 =?utf-8?B?RnhXV21oU3Fvb1UrOS9WZzgrZjFUdlprajJ0YnVpelUzY3MvLzdwTEFQRnI4?=
 =?utf-8?B?YXhma0E4bXp6clpjK0lDMCtqYnFKOTlzVVI5SXA2N1RmSkFBelpGZTdnbEJ6?=
 =?utf-8?B?Rks5MFg4OWpBbUE2UmFpR3A3dU5EVlFIN2swM2FmbWZpek44WjFxV1B5YUkx?=
 =?utf-8?B?dW0zbFhNYjVTK1hrNUFRbjNpSGRiUXMralloQktxK3k5SkJVcW1jOXNFbFdh?=
 =?utf-8?B?Y0YxWWczck5GcGZhREJnSkRKYlh1VGlGcHN2cGV4WGxycmxqaWNWVDFUNjV5?=
 =?utf-8?B?c0E5Mkw2dXVpS1piRUdpR2Fmd0FMeGhDZXI5STFYQmV1TnV5dzVZWG5yK2Fx?=
 =?utf-8?B?dlpHNlFSUkxCS292NVNncHkzaUg1VXNPQUpKS24vQjVSN3F1cUUycGtoem53?=
 =?utf-8?B?NnhmN2lEQTczR0VXZzJ5ejdzazZQaGNiNitHeEo3NW5aejd5U0xpZHIxSXEr?=
 =?utf-8?B?eU9YbmNyRFpCaFllMWR3WHVNWkpjUkVBN1BIWkF3dlZTbGhWbE1ub0lYYWFS?=
 =?utf-8?B?dGdFMDlEdElKNG1ZRkEwZnV4Q3UvSG5HcUo5K0szZktjQWkyUytibWY0anJJ?=
 =?utf-8?B?TVJCL3FveVBVNWJDSUJrRk8rMmxCQ1o4MkJKTFpiUWl3KzU1UlR1NkxMblNt?=
 =?utf-8?B?VUdqYjBSTzdrbGkvYVVCV1VxdFFoNDJ5RVFFQkVuS3pwcUNwZFBjYW8ya1cv?=
 =?utf-8?B?cmgwOHhwb1NNWWdjSE84Qm1oTTJ0ZXFhQkQxZmN6VFBvY05mTldwTHEyVHJa?=
 =?utf-8?B?cTlDTnhuVW1TVGQrOGxNY3E0K1NUWkZBOHhoQ21MZENyZ2JHUFQ5ZkkrV044?=
 =?utf-8?B?bzlnSDQ3WDBvaXNMU256a2pDWVp2eVh1TUI1Q3g4cVZ3OEtCNXNmcExIWWpF?=
 =?utf-8?B?UVNrQnpjcUpqUXVsYXk5WTZhdS9sUW5Bb0ZUN1ZDeHpmUEtUN2lkYTM5N1R3?=
 =?utf-8?B?VE9IVmFneUdLa2o4MVRiM2traHIzZnRDc2h4ZFZHd2hSTDN1bFR3S0FuSTZN?=
 =?utf-8?B?em9ya2hPSmZRZjVQcXNYcEZUWFhSVmZCWHZmTC9VTXNoSjR6eHNLL0J5cklE?=
 =?utf-8?B?dGdtYzk0VklyWjEySThVNml2WjhNMWZ1WDkwUnJ0anYyZXFzT1o3bEYzVlRj?=
 =?utf-8?B?M3lFN3hZWmNyYmh0WDZWV3Q0dkJKaXJhSmQwcGduTWxoQ282TWdSdW9wZFhr?=
 =?utf-8?B?MFpDRW96ZkVZYUZiYW5nMDIvS1A0bStmYjZlMmpDNFFHcHpFY2Y0M0l5OGFV?=
 =?utf-8?B?ZThYSHlYeGc0dk10SW1UTDhpQ3VmL3dlSDgvcGtMS29mS0tlWFBTZEJIOXkr?=
 =?utf-8?B?VDNMMkdBUzNJNVRZUWtPQXRWMWpQWW1LODdJSlVuVHU3cnVVaHY1TitpaUlN?=
 =?utf-8?B?WHBZUEdkRmtDMVZGbG5Rdmx2ZHpZZlIwSVZtM1hJS2E2TzlOYzBiRW14ZGRx?=
 =?utf-8?B?dVRhbExRWitMMWMvMURXeVhzUGxzTzJ1MXQ2TzJYUkNNdTQyZ1krUXVsU2tt?=
 =?utf-8?B?ZzkxSHBpM3BLQjVpVkxHRWM3dmc1RGlVS3d5MWVLWmFldU9ZazNEVWd0RTBM?=
 =?utf-8?B?YmhDR1cvRFJwbmpZNXdwMU9HWlRSaTNmRE1zeU9LNmJKR3A0eWFOa0lkeDZ0?=
 =?utf-8?B?OGFpeHMyRnBIanl0K3JJR2Z5T2pLdHpoOE5WYnpjT1lnTHNiOS80QXkzbkVy?=
 =?utf-8?B?eVpDYWE0ZGNqSGlJNllFTTZUWUpTYlgydE00SVNVUU1YRzlGOVorV2FVdVZV?=
 =?utf-8?Q?DpbAJ/ilEcLcO0n9YmsR/YwNw?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <ACE003338FA812459CBB6C19B2817976@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c26005a-f70c-49a4-1bf8-08db816abf4f
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2023 17:26:07.9147
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WCkGlaMY8U73fM02N9At3ok3Cq8dUCU8wSRoz5oDFi28+3csI86pQNEcx+oS9jeFkfANe9RDo4cw2Jk4vbSpCAU2lcekMu4DsGqRkMMBRH0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2956
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, Muchun Song <muchun.song@linux.dev>, Dan Williams <dan.j.williams@intel.com>, Oscar Salvador <osalvador@suse.de>, Will Deacon <will@kernel.org>, Joao Martins <joao.m.martins@oracle.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDEwLzA3LzIwMjMgw6AgMTg6MDgsIEFuZWVzaCBLdW1hciBLLlYgYSDDqWNyaXTCoDoN
Cj4gQXJjaGl0ZWN0dXJlcyBsaWtlIHBvd2VycGMgd2lsbCBsaWtlIHRvIHVzZSBkaWZmZXJlbnQg
cGFnZSB0YWJsZSBhbGxvY2F0b3JzDQo+IGFuZCBtYXBwaW5nIG1lY2hhbmlzbXMgdG8gaW1wbGVt
ZW50IHZtZW1tYXAgb3B0aW1pemF0aW9uLiBTaW1pbGFyIHRvDQo+IHZtZW1tYXBfcG9wdWxhdGUg
YWxsb3cgYXJjaGl0ZWN0dXJlcyB0byBpbXBsZW1lbnQNCj4gdm1lbWFwX3BvcHVsYXRlX2NvbXBv
dW5kX3BhZ2VzDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbmVlc2ggS3VtYXIgSy5WIDxhbmVlc2gu
a3VtYXJAbGludXguaWJtLmNvbT4NCj4gLS0tDQo+ICAgbW0vc3BhcnNlLXZtZW1tYXAuYyB8IDMg
KysrDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdp
dCBhL21tL3NwYXJzZS12bWVtbWFwLmMgYi9tbS9zcGFyc2Utdm1lbW1hcC5jDQo+IGluZGV4IGEw
NDRhMTMwNDA1Yi4uNTQxYjNmNjlhNDgxIDEwMDY0NA0KPiAtLS0gYS9tbS9zcGFyc2Utdm1lbW1h
cC5jDQo+ICsrKyBiL21tL3NwYXJzZS12bWVtbWFwLmMNCj4gQEAgLTE0MSw2ICsxNDEsNyBAQCB2
b2lkIF9fbWVtaW5pdCB2bWVtbWFwX3ZlcmlmeShwdGVfdCAqcHRlLCBpbnQgbm9kZSwNCj4gICAJ
CQlzdGFydCwgZW5kIC0gMSk7DQo+ICAgfQ0KPiAgIA0KPiArI2lmbmRlZiB2bWVtbWFwX3BvcHVs
YXRlX2NvbXBvdW5kX3BhZ2VzDQo+ICAgcHRlX3QgKiBfX21lbWluaXQgdm1lbW1hcF9wdGVfcG9w
dWxhdGUocG1kX3QgKnBtZCwgdW5zaWduZWQgbG9uZyBhZGRyLCBpbnQgbm9kZSwNCj4gICAJCQkJ
ICAgICAgIHN0cnVjdCB2bWVtX2FsdG1hcCAqYWx0bWFwLA0KPiAgIAkJCQkgICAgICAgc3RydWN0
IHBhZ2UgKnJldXNlKQ0KDQpTaG91bGQgdm1lbW1hcF9wdGVfcG9wdWxhdGUoKSBiZSBzdGF0aWMg
Pw0KDQpJdCBsb29rcyBvZGQgdG8gZXhjbHVkZSBhIG5vbi1zdGF0aWMgZnVuY3Rpb24gYmFzZWQg
b24gYSBub24gcmVsYXRlZCBtYWNyby4NCg0KVGhlcmUgYXJlIHNldmVyYWwgc3VjaCBmdW5jdGlv
biBpbiB0aGUgYmxvY2sgYmVpbmcgZXhjbHVkZWQgaGVyZS4gQ2FuIA0KeW91IGV4cGxhaW4gd2h5
IGl0IGlzIGNvcnJlY3QgdG8gZG8gdGhhdCA/DQoNCj4gQEAgLTQ0Niw2ICs0NDcsOCBAQCBzdGF0
aWMgaW50IF9fbWVtaW5pdCB2bWVtbWFwX3BvcHVsYXRlX2NvbXBvdW5kX3BhZ2VzKHVuc2lnbmVk
IGxvbmcgc3RhcnRfcGZuLA0KPiAgIAlyZXR1cm4gMDsNCj4gICB9DQo+ICAgDQo+ICsjZW5kaWYN
Cj4gKw0KPiAgIHN0cnVjdCBwYWdlICogX19tZW1pbml0IF9fcG9wdWxhdGVfc2VjdGlvbl9tZW1t
YXAodW5zaWduZWQgbG9uZyBwZm4sDQo+ICAgCQl1bnNpZ25lZCBsb25nIG5yX3BhZ2VzLCBpbnQg
bmlkLCBzdHJ1Y3Qgdm1lbV9hbHRtYXAgKmFsdG1hcCwNCj4gICAJCXN0cnVjdCBkZXZfcGFnZW1h
cCAqcGdtYXApDQo=
