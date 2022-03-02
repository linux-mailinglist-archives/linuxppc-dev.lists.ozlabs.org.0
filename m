Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C86A4CA5DF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Mar 2022 14:24:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K7vvz1bTfz3bwT
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Mar 2022 00:23:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::620;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0620.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::620])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K7vvT6Mwzz3bWG
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Mar 2022 00:23:31 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ITnadHyDdamdHxPmDKBMKAOVIwI4lgER+wZh/Q2WEWLWoTq69/07JgmCwWdC9w638KRU/oBTZLHZMbm6TSFHvHXEpcrmBMpfcTBBQ8nt6spLs/g8DbPmxlc9Fvxs1+0I3hjHTsqhrJ6dyqZN1+aYq9CR7trliuY4WRwAYa9pEfsHuqr1W/mN2qsA+vtVV9l5l5Wrswb50dcn93AXt/VnsHCImORrMT8VwXdfhlI5qRJ73jt7D648MSMcrhVSY2BXos6qBlqDPmT1kMBOpjSrFGpMkKb3qDQ2LGTYX8hd/bWpdRL6au5afnEmQjAG4f918MI6Wwtb0bRwWK1+Sc+Bnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RukMqGxAyiX0nw0c8ba/WTubefOiZx2YgwQruGdL3PQ=;
 b=mqlisALQ9AgwsEHGwJ4UradcmBsioC0LrGxpI1RH/+2wMRSNG0IvNloddrUoBwbkVvfLwseYZc6mbrqWRE1YXstO1VyykDhXzdub8FSqENPb9P6QwPY0Usgvu/di81lZJDGnMcXR3CN+k3UR/vvbkAHKth/o6HzoQeLv168xsrum4aq94f2IDjJ3Q76xcN6BGYo0NXqHSUJBL+b4vpQKX6TtmDqlEoTkeBB0feMKde49wcTSA99IBUxlPRtbztrhJ/J5U1yVSSDK5EQauKmroIKgTsKLffQMafIL3fR2Ixf+0lxbcXcE4AzhQYwoUpeDvWXHNoqih/CpvD5JUTvCqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB4268.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:25f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Wed, 2 Mar
 2022 13:23:08 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d%4]) with mapi id 15.20.5038.014; Wed, 2 Mar 2022
 13:23:08 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Zucheng Zheng <zhengzucheng@huawei.com>, "benh@kernel.crashing.org"
 <benh@kernel.crashing.org>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
 "paulus@samba.org" <paulus@samba.org>, "rppt@kernel.org" <rppt@kernel.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "oohall@gmail.com"
 <oohall@gmail.com>
Subject: Re: [PATCH -next] powerpc/pmac: Make some symbols static
Thread-Topic: [PATCH -next] powerpc/pmac: Make some symbols static
Thread-Index: AQHYLjio4DY57a4TcUKGZXMuIM/f+w==
Date: Wed, 2 Mar 2022 13:23:08 +0000
Message-ID: <8055476e-b7f9-f4b5-92f9-48d21eebba14@csgroup.eu>
References: <20210409093815.118619-1-zhengzucheng@huawei.com>
In-Reply-To: <20210409093815.118619-1-zhengzucheng@huawei.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4b7aaeb0-348d-46d2-630f-08d9fc4fcb0f
x-ms-traffictypediagnostic: PR0P264MB4268:EE_
x-microsoft-antispam-prvs: <PR0P264MB42683FDCA81F68A412489223ED039@PR0P264MB4268.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QuDnnHK4q+2yNQN+qZOzllHdoK4oKjaWw0uyn2kspcXSrNx1GLpnkZyM3oqtx+BfMVLwX81NWycq3+E16xx8nthQZWzFvXCfmaWiaQrx8NGFwRknRqA2EmrGgK6Db8dHQDjwhfaALjJVCEiLTnxgP6OfXxEB9rTMhaOm9u8k7POTFVfrrtrINSmYjdEpUsuh7xUcWKIk8jlCgsbvsF6e6CXi1nPTx2QKg2VGG/UBetseATUCrgpmSZm0hkeZ3VTFyZkgq0kSB7qwBxiauYYZSUVIJ/nN60Fi0ZycyMq/uU9rP/PGnPzvfcUWagxRLXqYUZpgx/COVN2TD2NEKRaXxsKCCsruwLALDL4nzNl5LdZ39HuLw6e+fpP6n/mV3UNkg7Wpnpd/I3WNn+On62voZdXEbhKcOKtrzLcwHmbJtbzOpxKapS7y1JW5yb5OhYt1NOmce2LJWaC9voVsWXHYd77V4JsDLzHlPxExjvT/IW0BOcabjK2ojevYT7WIjxKLFwDqCCYnq/tBcQymKwoFMp8kEmn2zEKbtNj9TkrbXWH4zrtG/d1ZNrTysHeoKW7O1YWiF1QGdaWxX/F19f6IaMBdRRWoomZaV8SV5WZ/c18C08e0eqx593ct9yWagvLK6P1X5wOfIOhdOLRPVmFJgVWKU4VAjZjla8gvRuTkeeZbRYzxGkBP+ql0hn287YsZ380bleFEGpRzwRh/dEPJ+XE9qUNjP0ITyiNTmfSM77ZCoUj/qGGsIuHhnYufqtaSIIWqg/77ZIYbWv0Zv7zvBw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(26005)(186003)(38070700005)(2616005)(36756003)(44832011)(8936002)(6512007)(31686004)(316002)(76116006)(8676002)(6506007)(122000001)(5660300002)(66946007)(91956017)(2906002)(66556008)(66446008)(64756008)(66476007)(4326008)(71200400001)(38100700002)(508600001)(86362001)(31696002)(6486002)(83380400001)(54906003)(110136005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RFcvZVgvdDRNSlZvdDZGbHNhREZFYm5lbytFOWFhaUJ4TEVqdHFyQzJQU3pT?=
 =?utf-8?B?WUhqQThjZTBsNkRUVUkvQ2NlZy9CUCs2R0xWQy82V0RHWmVjZURWMFNqQ2RN?=
 =?utf-8?B?K0tOOXdheUVBMnhYb1ErbTZGTWJGVk9zaW5BUXAwVlIyMys2TVR4cGl5VUJa?=
 =?utf-8?B?by8wZVJoZXhtN2VLcHZvR2x2YmxwYWNHSWVwWWxjdlA1N0lkQ01yM2JBRzMv?=
 =?utf-8?B?Vm1SU2p1Q1lKNXBPcmF3ZVY2ZlViU3diR2Z3UVdJK0Q0Z3RhUUZtY1d1d2Zl?=
 =?utf-8?B?OWR4Z3c5cUNxOGtIMHF6cE42bkFtREU1Qmd2V2hBUW9FNG0wZ0FFSFpwYlpJ?=
 =?utf-8?B?ZVM1YXVIRzlFSi80cm1XVlQzT094NGJETUxsL3plRXpZYkJEeXpreUZtRFNP?=
 =?utf-8?B?WGpFRzdBM2NIUXhGMFFJS21UYlVmdHgyTkpDSU1QRTN3S0Z2TU1pSjVka2lz?=
 =?utf-8?B?NUpRSW9lKzNXQXArcVRWbm5tL241TXRWNXhYay9SVjMrSUkyYjYya0JiS0JF?=
 =?utf-8?B?cDFZMU9TOTNMdHY5NkpmRzVCUGJNeU81dHUyY0h2TG1kMGJzTnlidk8rNGVG?=
 =?utf-8?B?OWdicHBSUWd3QnErNVQxTis2cHpPbms1aDRSSWVOaXlocjZNT2VwcUN1MHVS?=
 =?utf-8?B?OGdVMzg4U0hoVE4xYmVJVWNiWEN2REp4L0dVbXlybjFXeVVNMzZSSEVzeUJ3?=
 =?utf-8?B?REFJT3k1UnR6NE9CS0l1SGFMbzQxVXRDakN5ejBraXRmMmRNSi9OcGJTd2NN?=
 =?utf-8?B?elV2WGdTNVlBczNYd1grUWcwUUZFbmNCak5vZkxnMXVFNTF3TjJTazloR1I5?=
 =?utf-8?B?NDNPN0JGa3RBZjMzTW5vd094OTdIalFKY2Y5NGdiS3g2NEZ6OVZ4TnZPVWVU?=
 =?utf-8?B?L2JLUStETm9uSHc1VFQzb2FSei9XQkxJMEJyZERmOW9NM2Fma3NWRXQ3VUZx?=
 =?utf-8?B?R0l4aGJtaWxRcDhsVVA5QXQyaHNEaUF3eUduSld1ckw3YlQ1SFVNZWRQZFB4?=
 =?utf-8?B?eU02SkhPUjlDT2dGZzFYL0NBWkdEa0E1dXdGQmtjLzFEekpPdEtEdVdnRlNq?=
 =?utf-8?B?RWYyRXBRT2xNczg3czZ3bUZJeFRIa1UrVm1SUi9rM2tKYnFFTmhtazEwdSsr?=
 =?utf-8?B?dks2YW9VVnBCNU1LTHkvSHREdkNsREFyelhlcjJJMi9udWNlN3NKbGNNclFM?=
 =?utf-8?B?cTIyUXNVTUY0SmJYZ2xtM0hSdnNOTC8wcHY1cVRvbmFjYUZOc0FZWHJXUzJp?=
 =?utf-8?B?NWdPZ01iQ04xMlpZc1BYVHJwK29ucnFkU3Nyayt2TEptNk5HT2V1UytJcGFx?=
 =?utf-8?B?b1VzazV1RkM4WWVqejMvdDdnRFFzcFh5WWF2NVo1cXdkNTF3S2RNdWhnbmNZ?=
 =?utf-8?B?U1c3aHFpSU5DcXhQVXZHbW5HNXFocGIwK0xDYktJR3lPSjFLalJKSzNCeWQz?=
 =?utf-8?B?dno5NngveXIyU2dEK0g4WjJwSkVxY1V4OUVNZkRvZTJUR2JnU3BYWUJ0d2Z5?=
 =?utf-8?B?Vk9ranBTUlc2WGdFbFhxeENuOGZweGNzc3FQKzFyRHU0SkFxRGl4WlpZMzJM?=
 =?utf-8?B?TlZ6RkV1K25JNGI3OUt6a1JSVHdDZ2VqUzVOS3JLWUNFU1Q5M0pBWjdiNHg2?=
 =?utf-8?B?aDlQSndwbWQ1T2xLTjVVd0hEdnhTbjJibldXcTdHUkkzbjdoMmx4WjRxU1E3?=
 =?utf-8?B?UVAwWnpwR1BQT0VGRDdzeStEYkFCYmRNaGRCQ3owS0ZWeWliWDVsaS9PWEs3?=
 =?utf-8?B?QksrejFXM1cydUgxRVAzUlgyODRCQTk2TGNza29zd2lCY3pWbU1PdDhLcXVx?=
 =?utf-8?B?dGhTSlBNNzI1OVpOV0owZnZwTy96VFdHMklocUw0MS9INGN6aHNLMzA1b3lN?=
 =?utf-8?B?ZjhlSXRRUE0xSTNTT3d6NmxrcjArT0QrQ2JEVWJUSmxHRTZLL1k2MWtHUW9k?=
 =?utf-8?B?cVp0MWZGN1REOG93eE80K0FzRCtGY2Vhb0dueGVHVkg3N1R3NGp3cWp3L251?=
 =?utf-8?B?OTd5cEpHT0RnK1FTaVAzV3grR1MrdWxUdDNUbCtsMGlOSk56ZWpGS09aN1pu?=
 =?utf-8?B?TkpOMjM5Ymtpa1I5Y3ZPMWJJVjlYdXMxUWx0SGhleTBCSnFPeFNlUVNLMDFO?=
 =?utf-8?B?dlJ6QXhYaXBiZzdqbUh1MWprRG16UVNsT0RDYU9jcTdTdDBYUzVGcVRTY25o?=
 =?utf-8?B?b0JuVW4xQXhNdXV4SjE5b2NhZXVsL3A2OTdGK0pYRmROTnVpYXJHa2JyYXFn?=
 =?utf-8?Q?usdYCJyB7b2RVBHIQvDgteI9anaL67wERc2A5pS96o=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <76D6EEC62F87864686A4FD14F8AB91D3@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b7aaeb0-348d-46d2-630f-08d9fc4fcb0f
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2022 13:23:08.8097 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9+e5QTjF7FyHZYdlDZlYkQpa2hcUgTwZiJfvYR8D1dADfc4gL9whbIhjrK2+r7zyqqBg34Jkgrv8bGym76KG6g5JPIUkLaoUQITgC+/4tE0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB4268
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

DQoNCkxlIDA5LzA0LzIwMjEgw6AgMTE6MzgsIFp1Y2hlbmcgWmhlbmcgYSDDqWNyaXTCoDoNCj4g
cHBjX292ZXJyaWRlX2wyY3IvcHBjX292ZXJyaWRlX2wyY3JfdmFsdWUvaGFzX2wyY2FjaGUgc3lt
Ym9sIGlzIG5vdCB1c2VkDQo+IG91dHNpZGUgb2Ygc2V0dXAuYywgc28gY29tbWl0IG1hcmtzIGl0
IHN0YXRpYy4NCj4gDQo+IFJlcG9ydGVkLWJ5OiBIdWxrIFJvYm90IDxodWxrY2lAaHVhd2VpLmNv
bT4NCj4gU2lnbmVkLW9mZi1ieTogWnVjaGVuZyBaaGVuZyA8emhlbmd6dWNoZW5nQGh1YXdlaS5j
b20+DQo+IC0tLQ0KPiAgIGFyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvcG93ZXJtYWMvc2V0dXAuYyB8
IDYgKysrLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlv
bnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvcGxhdGZvcm1zL3Bvd2VybWFj
L3NldHVwLmMgYi9hcmNoL3Bvd2VycGMvcGxhdGZvcm1zL3Bvd2VybWFjL3NldHVwLmMNCj4gaW5k
ZXggODZhZWUzZjI0ODNmLi5kYjUxMDdjODA0ODUgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJw
Yy9wbGF0Zm9ybXMvcG93ZXJtYWMvc2V0dXAuYw0KPiArKysgYi9hcmNoL3Bvd2VycGMvcGxhdGZv
cm1zL3Bvd2VybWFjL3NldHVwLmMNCj4gQEAgLTcxLDkgKzcxLDkgQEANCj4gICANCj4gICAjdW5k
ZWYgU0hPV19HQVRXSUNLX0lSUVMNCj4gICANCj4gLWludCBwcGNfb3ZlcnJpZGVfbDJjciA9IDA7
DQo+IC1pbnQgcHBjX292ZXJyaWRlX2wyY3JfdmFsdWU7DQo+IC1pbnQgaGFzX2wyY2FjaGUgPSAw
Ow0KPiArc3RhdGljIGludCBwcGNfb3ZlcnJpZGVfbDJjcjsNCj4gK3N0YXRpYyBpbnQgcHBjX292
ZXJyaWRlX2wyY3JfdmFsdWU7DQo+ICtzdGF0aWMgaW50IGhhc19sMmNhY2hlOw0KPiAgIA0KPiAg
IGludCBwbWFjX25ld3dvcmxkOw0KPiAgIA0KDQpXaXRoIHBwYzY0X2RlZmNvbmZpZywNCg0KICAg
Q0MgICAgICBhcmNoL3Bvd2VycGMvcGxhdGZvcm1zL3Bvd2VybWFjL3NldHVwLm8NCmFyY2gvcG93
ZXJwYy9wbGF0Zm9ybXMvcG93ZXJtYWMvc2V0dXAuYzo3NToxMjogZXJyb3I6IA0KJ3BwY19vdmVy
cmlkZV9sMmNyX3ZhbHVlJyBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVdlcnJvcj11bnVzZWQtdmFy
aWFibGVdDQogICAgNzUgfCBzdGF0aWMgaW50IHBwY19vdmVycmlkZV9sMmNyX3ZhbHVlOw0KICAg
ICAgIHwgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fg0KYXJjaC9wb3dlcnBjL3Bs
YXRmb3Jtcy9wb3dlcm1hYy9zZXR1cC5jOjc0OjEyOiBlcnJvcjogDQoncHBjX292ZXJyaWRlX2wy
Y3InIGRlZmluZWQgYnV0IG5vdCB1c2VkIFstV2Vycm9yPXVudXNlZC12YXJpYWJsZV0NCiAgICA3
NCB8IHN0YXRpYyBpbnQgcHBjX292ZXJyaWRlX2wyY3I7DQogICAgICAgfCAgICAgICAgICAgIF5+
fn5+fn5+fn5+fn5+fn5+DQpjYzE6IGFsbCB3YXJuaW5ncyBiZWluZyB0cmVhdGVkIGFzIGVycm9y
cw0KbWFrZVszXTogKioqIFtzY3JpcHRzL01ha2VmaWxlLmJ1aWxkOjI4ODogDQphcmNoL3Bvd2Vy
cGMvcGxhdGZvcm1zL3Bvd2VybWFjL3NldHVwLm9dIEVycm9yIDENCg0KDQpZb3UgaGF2ZSB0byBt
b3ZlIGl0IGluc2lkZSB0aGUgI2lmZGVmIENPTkZJR19QUEMzMiBibG9jayB0aGF0IHVzZXMgaXQu
DQoNCkNocmlzdG9waGU=
