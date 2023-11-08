Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD707E559B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Nov 2023 12:34:47 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=ctB0tYqJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SQNKd3n33z3cTx
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Nov 2023 22:34:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=ctB0tYqJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::623; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20623.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::623])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SQNJk3WpCz3c1C
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Nov 2023 22:33:57 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bKYAMO1VFrvuGMqRp4MEAi7p1/0QKVdZSKOwVW9QQ5rr/PAwUME3/xmIx2uuMmT76s2Npyw4U2o7dqCVMlmB8zMmjtLgawe4Rsqd18x9ZeKHurQDaRE5qK+Aoc93OqWOH651u3QyhaaNw9EfaCzsffczNHSpJYD9uJVgXZ9ty3dDsbKLDhHoubPDalb+SCMXPFfHlUZXbiOZB9qV6OGqQhdpIaefYj6YqPYlTbudN3Jqf8tIp4rfpetSBV0Bxmki2Yvdjj9DwYGOG91iW5iMZ9cBYnkjigw1UsghSHLIQ2+uN8CM4xQ1VoKcHlxI22Zjzl0nDOaz8weGYWlRijEtTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VMOBGQFU8IqU41V+7aFU/aj6YNiGlG0TKrRLuu6+vRU=;
 b=eLdC2eVElyR0dPaobWg7Md4+1kXaFVJn6qqFDZ7j0DLULkCK4ZtpqVCdD1Tvy/4dxLgNLgR+PvmeAel3fPDPQHIyy2ceAOqZuIPxjwLBGtLb7V66NuNlottttSM7BSteJQ0Zsm4J2Ger8FTruHuPH0bQ8ZVos8WzG1czX+uLkUEmd/KqyOOGzNw8kIrDiMfrN/pPelf1Pe88HSCl0tsEnc67KhL8uEuUNdGnH3uAYffx+dU/JgA5h/xJEsJ/JwHS79EMIeHqS3VPveR4g39I/xi+mfUm6Z6WljQlI8yne7G13e9DUch1Hc1kmQ4yzyRsInqVWIRmwld9k478LYPGOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VMOBGQFU8IqU41V+7aFU/aj6YNiGlG0TKrRLuu6+vRU=;
 b=ctB0tYqJz3zHPmVpEvgcskyWT1dq11sfdw6hcG7/QbzAu4Qk2ihiiS95ZYYWVz8E53um5xsRpeVxm0K2rAcEl9iHbgKEzN/gL9I8aGQ3blrfa8IOo0LumO8dVp/dgcLCnvbe2Zq7/uIUdAlDFMAIEInYA1eRItpKxvaspxGne8TnIa62uJeEP/Fq/29T9TYd9mRRLfE95XArqMv45k6tvEFAS8HSS5AuPS5OvweULSVg5g9dFyTvZDu5WrK1eKWpnO3VNVZW3YA3JgNFquWJP9caHHLxOlVR7PrRtMg7pT2hJR+C9sjk/zs8J4VPTda620UM8aDovzXTHyX1NXRCmA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2948.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.18; Wed, 8 Nov
 2023 11:33:37 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97%3]) with mapi id 15.20.6977.018; Wed, 8 Nov 2023
 11:33:37 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Pratyush Brahma <quic_pbrahma@quicinc.com>, "danielwa@cisco.com"
	<danielwa@cisco.com>
Subject: Re: [PATCH 1/4] add generic builtin command line
Thread-Topic: [PATCH 1/4] add generic builtin command line
Thread-Index: AQHZcUhJzils+7kRSECmbWEaEeT8Tq8vr4oAgR86pgCAIqITgA==
Date: Wed, 8 Nov 2023 11:33:37 +0000
Message-ID: <3d127abf-abdc-02e3-7c8b-a39b901ea641@csgroup.eu>
References: <20230417162415.GF1391488@zorba>
 <4c420081-fe57-d036-ded7-2899c13738ee@quicinc.com>
In-Reply-To: <4c420081-fe57-d036-ded7-2899c13738ee@quicinc.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB2948:EE_
x-ms-office365-filtering-correlation-id: 9c5d09e7-3d5f-49a5-c71e-08dbe04e8cb9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  9MR0zfgOFFZxGP7NMX+7ivv255W0YhT/CaZpSAUioCHe7EMdNdSstpJgmI4v5dccbFCUTQoSl8E5yeosIg/7zfNratnYQ7TRKBX3L3yGIqw4Z6mXlUmq16UZKJk4cosqo6iOXtd+VXZQdU4cuW776BtSoaaBnaAgILpJaBdek9VcmJpbLbzVZLAXDtB6Z/bOJ+TUS2PPbYAni+ZBI+5Wsalk86teCaQYeevnoB8/H2zchTTdYVqe2y+Vyp3dvpqqFgGSr5h++Pr0Ou/7NYiOEWvEtouN7G99chKqVSxO27QWEDKESe0LbH7P8mgvoQCWb2chGb3I1lMTIzUtjksiW8CWUZt9XB112lwH6kaDuREpYwPxDiw5qxmde/ViVjiVvzzUnhsR5etfAl8TNZsKsisdTXPkUzNSxCbRssHC8jH0U6ZbaqdvSAMcpKqk4V2kGTkCAOT2cdBxZKA8epR2VibXpPRevMOD2NphdkV/XPUTRrANEt5sgivwH3KNEMDF7hyuU58wfw5KFih1ErHtsAv3GY3pz6U94ISRA9of3laRAmex+wFfDy5KUHk3Hnvmoz5zcYrAcQfhw3k9TnzLKYZ/52PQoq+Ilg/qdKmlOac8KlJwMLeQ/HvdCsxf69we9cJW//1nXEwGnDI+KTsZ6P2xSAZ3ziYmSogRCx4lBVlrCpxbHgFBT2xD8S79NEK0
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(396003)(376002)(39850400004)(346002)(230922051799003)(186009)(451199024)(64100799003)(1800799009)(66446008)(66946007)(66556008)(66476007)(76116006)(64756008)(54906003)(91956017)(110136005)(36756003)(6506007)(6512007)(26005)(66574015)(38070700009)(31696002)(38100700002)(83380400001)(122000001)(71200400001)(86362001)(966005)(6486002)(478600001)(41300700001)(5660300002)(8676002)(8936002)(4326008)(44832011)(2616005)(31686004)(7416002)(2906002)(316002)(41533002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?Rks1L2d3a0FPU1M5cW9ROHhNRHRFT281aitpOEFmVGhiRmpuSW5wK0pZZFNU?=
 =?utf-8?B?RmljZS8yZmQ1NG5ENTliQ0ttT3NVY0JsaTI4VTlsSkVFTUFYSlNHaHY5a0Vh?=
 =?utf-8?B?cEpQbzNJMDUyTS9hQWVTZS9xVnNlRXVWd2YwMjB2YzQvRGhrK3Y3RHZ4YkRJ?=
 =?utf-8?B?QjZqbHdUK2c4YUNNUFUraEVQcS8weHVUekhHY3I2NDNuclk4NzJaakFzdzl4?=
 =?utf-8?B?bWdqc25Kc2twdmovNkpiRU9Vc3FsNEZ2ckJQdDZUOWlKVXZ4d1dHK1lwM0FD?=
 =?utf-8?B?MWJjUUtKRjlILy9mOVJjVldqeGRRUjZGQ1FXd3Y1bEIzaGFrazZRRGJyYkZ1?=
 =?utf-8?B?RjFSdWFtUEZtYzZZc0Zra3ljNUt0THF1ejJNZzlpM2pEWnA1Zmd5eVlvdHc3?=
 =?utf-8?B?ZmlvQXZpWkZndldlZm5NaXBzWGxwd3dTVFMwTWVoWkFYOW01UWxKWFNhRzlE?=
 =?utf-8?B?NG4xODBUYWxXYWpkS255VkhHcVp1SUxkOEx1bXB0YTBBSUlOTzltcnBlRnVq?=
 =?utf-8?B?RzIrdGdlT0dLMzNkc2ZNbk1Tdzg3YXREekx6QVZRVWlmOUNNeHg4Wk1jM3la?=
 =?utf-8?B?bTdobUMzWVUvTTFzaENQb1pJTWV3RUFQTU02ZzFVZGNJR3pvdTYwVGp5elh3?=
 =?utf-8?B?K2p4NzdvMjFaNW9iWVhyaVdoRHBmUjl5OW8vK3VtUzFjb3ZOMzZ1QlJHb2tp?=
 =?utf-8?B?YVV2ZUxwbU5Hd2lHNHFQYXNsYUV2cjkrWXRPRlc3YkJoSUVTNUw5dkV3cUM3?=
 =?utf-8?B?Q2UrOEFNdEhjYkM4RmlHSnp0S0dGaXZyMHE2TjdQdTdRbkJsaWxzYVpFbkNh?=
 =?utf-8?B?Z0FnaVhTc3VhUFpnOGxGN0o3bndVNUtoRi9xMHAyaXhZKzUrRXFzUVJLK1pK?=
 =?utf-8?B?eXdrZjc2WXBMeml3SFQxNGt4NTBlQVpvbWdXZi9kNkJpbFF4MTJPN1I5ajFN?=
 =?utf-8?B?RDZqUFA3U2dQNmQ5cDczSmF1RE1CVFdmdWYrRWFpNnNLckJuSFJqblNMRXgw?=
 =?utf-8?B?VmJ5Rjg4eG5EaHp0RGlVdTA3NVR0ZGRJZ0pWZkIwKzc4ZUdudHJEbm8vMDV3?=
 =?utf-8?B?ZkxERVdhN3N5QlEwenZ0ZG5TUUhnbzliWHhzcXFQVW9hcHFmUFk5YWFJQzVW?=
 =?utf-8?B?Vm5IODJ3QmR3NmxGTzRjK0NOajMzSnhpRjJuaDNybS81MlJlTW1tNnFBelh6?=
 =?utf-8?B?ME1TVkNRSTEwZDlrWXNkTDRidGZhcE5Pdk1oQ0MrTzNaWCsrR2JNMmoxakZZ?=
 =?utf-8?B?YVBHNTYvWWpwcjI0MW81NFFpcENHODJXdzBRL2VxRE04eTE3blpkUDBFcVdU?=
 =?utf-8?B?SUx5L2cvMXBCMHEwc1RRN1BIQ2plSGc5aThmM29KT3d0eXBYWGNCaU9vT0VX?=
 =?utf-8?B?blFEeWYrVUxBLzhDL2tYVDFZQVV6VFpJaG9lN2xKNmhyUEtScmkxYzlOdTJD?=
 =?utf-8?B?L2JadDFScnplTDRnaEVLNXlMZ3ZkVjhPVUlXdHAyQ1RGbFI5cmplNW1ZTXND?=
 =?utf-8?B?UTY2bFVPMFlCNE11WGtRMDhTN0daSW5HOVBqZ21ObitwdzRqeXNGT2ErdWor?=
 =?utf-8?B?ckhTbVZuY3ZzWUpNbktaVElHOGdWWjlOc2ZKWHp2REYvR09xNUF3QS9acXM5?=
 =?utf-8?B?SVB3NFp5bmo2S09NUGV5MzByRjRyY0xneThXM25HQXQwZ3RQQ2tTQXBVcGs2?=
 =?utf-8?B?ODdKWndqN0JKbzdyeWlvQkR4eWN1dUpmbm0yUForL3VaQ1JqSkd0c0hGUXBw?=
 =?utf-8?B?a250TWFhK0pxMXBOVm90bzlNYkJKbWNpQjVSY29vdWJ1RUNmc0R6ODJzTTNu?=
 =?utf-8?B?OXh2Ukk1SDVzZk9oMVhIb3p0ZGxRZFZQR0JYajY0MFl4Nmx5SEs2ckxWcE10?=
 =?utf-8?B?UWhnYWNCZ2cybXc2anJtVzNTaitONnV3bVIrMnB3dFVKbzZkU1ROQzJkcVpj?=
 =?utf-8?B?MWZmQWNrd1FhbzFINDg3YSs2ZmpNbHlDRC9sV2F6WWo1RDdNMlRQZTEwRzNk?=
 =?utf-8?B?bUZLL3lnWGJIVXhrdHNja3BTT2JJYWwwR211WEZmeEJQN3RvaG0zN0FRL2Na?=
 =?utf-8?B?SjRIcWNjMUhpaUtYdE5uTlNYM1lycVFkcDJ6eDBXb051Zi9GMjViTHcrQzV3?=
 =?utf-8?Q?AWRx9AaAjTeg0ifDoLgSUTGNf?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7E328B8B291FD942A12659F54970B605@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c5d09e7-3d5f-49a5-c71e-08dbe04e8cb9
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2023 11:33:37.5826
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZhHTFEZXFqWopYl77X/yCxbKTogGhCkal4YEixIOokL6ptBAhZ/Qam20oAHnmGnLJyDm6qD2HOClS18LlNDVQz28lM/HgTEOL9PjsO8IV3Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2948
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
Cc: Pavan Kondeti <quic_pkondeti@quicinc.com>, "tomas.mudrunka@gmail.com" <tomas.mudrunka@gmail.com>, "quic_vjitta@quicinc.com" <quic_vjitta@quicinc.com>, "xe-linux-external@cisco.com" <xe-linux-external@cisco.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "quic_guptap@quicinc.com" <quic_guptap@quicinc.com>, "maksym.kokhan@globallogic.com" <maksym.kokhan@globallogic.com>, "dwalker@fifo99.com" <dwalker@fifo99.com>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGkgUHJhdHl1c2gsDQoNCkxlIDE3LzEwLzIwMjMgw6AgMTI6NDAsIFByYXR5dXNoIEJyYWhtYSBh
IMOpY3JpdMKgOg0KPiBIaSBEYW5pZWwNCj4gDQo+IFdlIGhhdmUgYSB1c2VjYXNlIHdoaWNoIHJl
cXVpcmVzIHRoaXMgcGF0Y2ggbmVjZXNzYXJpbHkuIEZvciBhbmRyb2lkDQo+IHVzZWNhc2VzLCB3
ZSBoYXZlIHR3byBkaWZmZXJlbnQgYnVpbGQgdmFyaWFudHMNCj4gZGlmZmVyZW50aWF0ZWQgYnkg
ZGVmY29uZmlncyAtIHByb2R1Y3Rpb24gYW5kIGRlYnVnLiBIb3dldmVyLCB3ZSBvbmx5DQo+IGhh
dmUgYSBzaW5nbGUgZHRzIGZvciBib3RoIHRoZXNlIHZhcmlhbnRzLg0KPiANCj4gDQo+IFdlIHdh
bnQgdG8gZW5hYmxlIGNlcnRhaW4gZmVhdHVyZXMgbGlrZSBwYWdlIG93bmVyIGFuZCBzbHViIGRl
YnVnIHdoaWNoDQo+IHJlcXVpcmUgY21kbGluZSBwYXJhbXMgaW4gYWRkaXRpb24gdG8NCj4gdGhl
aXIgcmVzcGVjdGl2ZSBjb25maWdzIHRvIGJlIGVuYWJsZWQuIEVuYWJsaW5nIHBhZ2Vfb3duZXIg
YW5kDQo+IHNsdWJfZGVidWcgb3B0aW9ucyBpbiBkdHMgZmlsZSBlbmFibGVzIGl0IGZvciBib3Ro
DQo+IHByb2R1Y3Rpb24gYW5kIGRlYnVnIHZhcmlhbnRzLiBUaGVzZSBmZWF0dXJlcyBoYXZlIHNp
Z25pZmljYW50IG1lbW9yeQ0KPiBvdmVyaGVhZCB3aGljaCBhcmUgdW5kZXNpcmFibGUgZm9yDQo+
IG91ciBwcm9kdWN0aW9uIGVudmlyb25tZW50LiBIb3dldmVyLCB0aGVzZSBhcmUgbmVjZXNzYXJ5
IGZvciBkZWJ1Zw0KPiBlbnZpcm9ubWVudCB0byBlbmFibGUgaW50ZXJuYWwgdGVzdGluZyBhbmQg
ZGVidWcuDQo+IEN1cnJlbnRseSwgYW5kcm9pZCB1c2VzIG91dC1vZi10cmVlIGNvbmZpZ3MgbGlr
ZSBDT05GSUdfQ01ETElORV9FWFRFTkQNCj4gdG8gZG8gc28gaW4gZ2tpX2RlZmNvbmZpZyBbMV0u
DQo+IE9uZSBvcHRpb24gaXMgdG8gdXNlIENNRExJTkVfRk9SQ0Ugb3B0aW9uIHdoaWNoIHdvdWxk
IGVuYWJsZSB0aGVzZQ0KPiBjbWRsaW5lIHBhcmFtcyBidXQgdGhpcyBkaXNhYmxlcyB0aGUgYm9v
dGxvYWRlciB0byBhZGQNCj4gYW55IGFkZGl0aW9uYWwgY21kbGluZSBwYXJhbXMgd2hpY2ggbWF5
IGJlIG5lY2Vzc2FyeS4NCj4gDQo+IA0KPiBGb3Igc3VjaCBhIHVzZWNhc2UsIHRoZSBDT05GSUdf
Q01ETElORV9QUkVQRU5EIHNlZW1zIHRvIGJlIHF1aXRlIHVzZWZ1bA0KPiBhcyBpdCB3b3VsZCBo
ZWxwIHRvIHN0aXRjaCBib290bG9hZGVyDQo+IGFuZCB0aGUgZGVzaXJlZCBidWlsZCB2YXJpYW50
J3MgY29uZmlncyB0b2dldGhlci4gQ2FuIHlvdSBwbGVhc2UgaGVscCB0bw0KPiBtZXJnZSB0aGlz
IHBhdGNoPw0KDQpBcyBmYXIgYXMgSSByZW1lbWJlciwgRGFuaWVsJ3MgcHJvcG9zYWwgaGFkIHNv
bWUgd2Vha25lc3NlcyB0aGF0IHdlcmUgDQpuZXZlciBhZGRyZXNzZWQuIEF0IHRoYXQgdGltZSBJ
IHByb3Bvc2VkIGFuIGFsdGVybmF0aXZlIHNlcmllcyB0aGF0IHdhcyANCmFkZHJlc3NpbmcgbW9z
dCB3ZWFrbmVzc2VzLCBhbmQgbXkgc2VyaWVzIHdhcyBjb25zaWRlcmVkIG1vcmUgbWF0dXJlIA0K
dGhhdCBEYW5pZWwncyBvbmUgYnkgc2V2ZXJhbCBtYWludGFpbmVycy4gQnV0IEkgbmV2ZXIgZ290
IGVub3VnaCANCmZlZWRiYWNrIG9uIGl0IGluIG9yZGVyIHRvIGZpbmFsaXNlIGFuZCBtZXJnZSBp
dC4NCg0KQ291bGQgeW91IGhhdmUgYSBsb29rIGF0IGl0IGFuZCB0ZWxsIGlmIGl0IGZpdHMgeW91
ciBuZWVkID8gU2VlIA0KaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2xpbnV4
cHBjLWRldi9saXN0Lz9zdGF0ZT0qJnNlcmllcz0yMzcxNTgNCg0KSWYgaXQgZG9lcywgSSBjYW4g
dGhlbiByZWJhc2UgaXQgb24gbGF0ZXN0IGtlcm5lbCBhbmQgcmVzdGFydCANCmRpc2N1c3Npb25z
IGluIG9yZGVyIHRvIGdldCBpdCBtZXJnZWQuDQoNClRoYW5rcw0KQ2hyaXN0b3BoZQ0KDQoNCg0K
PiANCj4gDQo+IFsxXQ0KPiBodHRwczovL2FuZHJvaWQuZ29vZ2xlc291cmNlLmNvbS9rZXJuZWwv
Y29tbW9uLysvcmVmcy9oZWFkcy9hbmRyb2lkMTQtNi4xLWx0cy9hcmNoL2FybTY0L2NvbmZpZ3Mv
Z2tpX2RlZmNvbmZpZyM2Mg0KPiANCg==
