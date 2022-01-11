Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DB548AFA6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jan 2022 15:36:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JYCtX49qJz3bbN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jan 2022 01:36:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::62d;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on062d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::62d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JYCt26gN3z2xrt
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jan 2022 01:35:53 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=By7ijQvHjW7meSxL4ExIdx1sueTcNPMZDB/qRGXf5Yu2EksJbXv1+wCDY0IxBSgnc0uqdvfy3rKiu11tO2g6zvn//sOvRYZOOkX0vhK4/SThWmoP91w+A7JEIKyUeVIWcxqPosTeYD1z4mEufdR/gR7q41C26TsRX82MOeLytuOZFJ+vQ/mTOZP+/AhrXp6YtegPtxSicF2c1CzDIwnfEl6SxYtUyV4NTaGucJE/7LjvZc302SsTzLN8lLyQqUup5OY/0s+8Qc9MsNkhy+D4YhREIKcokx8+kxMYnbpwAAtIZBSN28SZxA/szX3Pe5Hj2JFkkg/vdFf3oI/sz+P2tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w+Mi4ArZ3e/6w+ZkzZ5vSQAE1P7Vdz8zcogFZaAoR8o=;
 b=Da9rY/ZlkRNi/wFwrbkJbJDN4eX/wL+lJkPXavtzG68iJOB1UfnGWiawrpl2JB68bkGjf41no93wfCd8MnqWrVPH4eAY9+m11oZ55NgRlZSMvmXVeB0XVgQAOTwtH65fJHRPgJWzgkkmktU1jBB395sO6ZTb6VX+KzQpYJvpWPOCU+9bNgMbO7yu3YzOYNHxgHODNSGSYXIsNvajbq3pSjgkSCf67+LH43g5vyuvgTr/3X605qYOeKTQxYCraWYz6vKK5iZOloHwhTZ/BwI+GTh+y5QzYBsMRgdOdyCblPAAjyLnOqx62ia/u1OkEx/k9fjsWH2Y/FRgXhA8EKNWuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR2P264MB0001.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.10; Tue, 11 Jan
 2022 14:35:29 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5%5]) with mapi id 15.20.4888.009; Tue, 11 Jan 2022
 14:35:29 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, Alexei Starovoitov
 <alexei.starovoitov@gmail.com>, Daniel Borkmann <daniel@iogearbox.net>,
 Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 11/13] powerpc64/bpf elfv2: Setup kernel TOC in r2 on entry
Thread-Topic: [PATCH 11/13] powerpc64/bpf elfv2: Setup kernel TOC in r2 on
 entry
Thread-Index: AQHYAvMR1BciS8LxQE2RqZouE9+3wKxcAKyAgAGmPwCAAEQkgA==
Date: Tue, 11 Jan 2022 14:35:29 +0000
Message-ID: <080527ac-54f2-6e41-17a0-fdb7a556c30d@csgroup.eu>
References: <cover.1641468127.git.naveen.n.rao@linux.vnet.ibm.com>
 <4501050f6080f12bd3ba1b5d9d7bef8d3aa57d23.1641468127.git.naveen.n.rao@linux.vnet.ibm.com>
 <d0e28f07-c24c-200d-de04-5d27c651a5e6@csgroup.eu>
 <1641896867.1ukblu8135.naveen@linux.ibm.com>
In-Reply-To: <1641896867.1ukblu8135.naveen@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e08559bd-cd52-4846-b722-08d9d50f9d9f
x-ms-traffictypediagnostic: MR2P264MB0001:EE_
x-microsoft-antispam-prvs: <MR2P264MB00011A1F1519188547DA373EED519@MR2P264MB0001.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:1013;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8ejQQqv6kZJlc9ZrVgDHcynW1VbXJFXYwNBXViKWB4/um1Mch4WrTz2ShbqYlwvZ+IAUK44jxSI2TFx4cr9T0nxKptKPZpTrAcHEb9nOW5MXQn3jAZHDHRIEnJq4koYjc8msQnjYPqO/M4euENe1mqftLI1hL1yv1k5jQf/dX+V+ScQXGuWkq6wGu+O18IHXykIA2WOQtbuv2cc3SYW28L9teJW69Q0BSzXxU35eSPLJ03UsFwp1uFVKLzcAB3XuhF/R9Z44TF1Xi1Gn8NlKmZnHEIzagwvbLXsftwzHPvLYWHOzSMc4iE6zbbhaKs/JL/qHyFmwTtSISqT1qMCH1/1CHOy8RIsf3ursZIT8DDki/WWfwNK5IOTvxJIfdiU8nCIdIXrdVvW840BtGt7uuVfjJkFXFFpxvxPZemrbbSdL0iPCe9uxh26vRSNEHCEtp3RNTxqZly+4P1GGw2et8auF+/3xBRwmemuqxxbEcU43f9dXKxqt27hgP/vmbd8Ce3FfP3olpiQgscGV+9ypg3eX4m5oUhTLcLgFOWPLm3EOLCl2XZSDDoPW3SwpXeuO7FTSR1IERt9LSqOmYpG+8Vb+aM/6JQPCC2smDbG4l37Td2etwz/JO11Xr5jz7uFWGAkeV/7/mu2ZqZayHLUU7luTDGLHGfO5fu1cHXdNKvr9z+q3ebWzFwPftqrXbXlCv1fXStTibU2USlEb4l2MDVoSpIF0aUBJfNGIEbJbBX+H6PunSJP3PcRoF1meIqPV8YNW0Isenh0bZikL0ywjy8LGS/X9sb0lgEl80oUU6FwXMHpKnbqtMoVQ6JHXnjo7ktlT0AO3Jfbwxfm2ka7gKpn1d+1e5j77mfgBpvi4WCE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(7416002)(86362001)(4326008)(71200400001)(186003)(44832011)(26005)(110136005)(2906002)(316002)(5660300002)(508600001)(54906003)(966005)(76116006)(66574015)(38100700002)(2616005)(36756003)(122000001)(66476007)(91956017)(66946007)(66446008)(64756008)(66556008)(8676002)(31686004)(31696002)(38070700005)(6512007)(6486002)(8936002)(6506007)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bXJZZWJzWDNuWW9QN2xvYU1nUFQ2aWRIODBsSUN0WFkrTU4vc01YS3ZVYUNt?=
 =?utf-8?B?bHRWRWM5NUpmalBjUG9UV0luYVl5OW5UZ2dWSmw0d0V6VTlVcjNDckd0VlpW?=
 =?utf-8?B?N1doYjhoZnZybXZ6bjBNbEhGNkNPdUU5bWUrM0VIaFpLTTZYK3YwRTRhR0Vn?=
 =?utf-8?B?S2tJTkE3d1krNDhwVUZnVWgrTGZITEpMR243QzcwZm05akhSd1JrWUJXbjRF?=
 =?utf-8?B?SXFjenMrbXFhcmMzd0cwRDRmV3Z4amtId3FrM21taFpLVGoyVFc1UHdiekNH?=
 =?utf-8?B?NUZTSmo2bjR3b3BhTHZEYU91Q1lGb2xGV0I2TGVpSEhkWDJiMzRhbWswcFlu?=
 =?utf-8?B?d0RMSE9sWlNVZWNUcVVZWU5STmNjUHZ4NTJseE5ua1IrclVtcmR6QnBYak0w?=
 =?utf-8?B?ZGkzdG9CcURuTTQrYm5YcFgyS2lMR3hjRWIvVTZOTS9FSHBSdEttaGZqREhL?=
 =?utf-8?B?bmJET3hxTzN6MzhRdEFyYmE1aGo1TDhmME1SeForQll4K3kxMmE5TDRvOHY3?=
 =?utf-8?B?c0x4aE40UTd3SU96UUJ6OXE4dDRoMTZaczdYVGRBZVhVT2NuZDFCTzd4V0tu?=
 =?utf-8?B?dlFPcHdhVVJkbjc3U3JuSmkrUGhSb0YwOHBLNFpDWno4RkxOU0oyem5BMkY0?=
 =?utf-8?B?Sm9INGpUTVNqeDdwRzdabVAwUEI0WER0TnZhUzM0c1dqc3hic0FyL0I0dkdW?=
 =?utf-8?B?NHprQUEvWDAvdGV5Mkc4Qm1qcHJjSndnWEsxODdYZkpzZTV0SHNPZXNYTzJh?=
 =?utf-8?B?SmJwaEhhNUZ6RE0yNW9aclhVeVpaTDQrTVZ3a0pUa3hjUWo1UWlHTzVSb2d2?=
 =?utf-8?B?RWQxOUNzNFI0a0hZSmJmVFU0SjAxejBpUjBVQUFiUGszQ3JTWklITllvN0RL?=
 =?utf-8?B?Q1ZITWVZckNPSUc5ZHNIdXhnZCsxVlFuTCtxbmdPZG92T1F3RllhZkRKa3VJ?=
 =?utf-8?B?c1NFc0htMzFES2V5UjB2dHJCeVQ0NmZTNnluSlBoUWlkR0hQNEhtTjdPMTZj?=
 =?utf-8?B?aGQ3SVFTdUlIWTQ5c2RNYVR1TGpaMmtsOERzc0xHczhKM2ZNZWZvdjlNekw2?=
 =?utf-8?B?VXQ4RXpKYUVadW84a2doSGFwcmRDWGRMSS9XaFc3RnBReVJkeUxTZWNCZWEv?=
 =?utf-8?B?S01RSjM5bVZ0UEVycHRlVklITW5PZWszS1dDQkc1RXRHaFdoaWFWL3djbm1W?=
 =?utf-8?B?aUIrTStmMnJrWkUvM01LTUJGaGJLSVBZaDhOSXIwTGUyZHJIS002Ym4xbmtO?=
 =?utf-8?B?UCtFZUNuU0hac3RBR0dObnV3OC90NmptT1NIazlqRlY1amFLNUpRYzVTTVhi?=
 =?utf-8?B?dEs5UEZna3MxTE9uNXZLWE5sTXF0ZEJxWEQ5ZDdrT0Rzam5oWE1YSnVrYWlx?=
 =?utf-8?B?Yk5MMUR5VHNML2NxMmtqQ3FIVUtzcndKaVN6RGgzNGhsYVlIWTErQ0xuS2pO?=
 =?utf-8?B?RGZydG1IOXVDVm0wNVJwcGxJcklNelBVRUY4aXBQK2tNMkRXWjg2SXZ0NzR0?=
 =?utf-8?B?RG9LbmNGSkt6UUN0NXhqVVdhSzA1NkVkbmRRWnlLdzdCNXI2ZHRndHdBdHNE?=
 =?utf-8?B?emFNUElndE9DWldIVFo2KzY2VXAwb3F6S0grRUxoaHp0OUVtam05MCtWeGFt?=
 =?utf-8?B?RXBNWWhYU0lHYnBJNENmZWJkb1Z3em5OZ0lLZnhHYTltS0wyWFRYS1pJczZn?=
 =?utf-8?B?eGEySjArenJTbGpFcStyRUZFWVEyOWh1Z3ZEbmlyVXZVNlV4ajZwdXM3bEk4?=
 =?utf-8?B?ZUltdnhlQ1R3cjlsZGlUSEJPMDZTYTVheTBjZ0ZVaURabEx4S3VOVmZXaUZG?=
 =?utf-8?B?YWMvUmJPL0ErNWEvOC9KQm1vM2Y1MEhQTmpkbXZHa1BkN0dvS1h4ZGkxaXMv?=
 =?utf-8?B?WHB4NXlmZjRYT3BtN1VGRmQ3RHoxdVk5M0pNR1FjTllDOWFZN1JGUVFJdzdx?=
 =?utf-8?B?enBCd3Urem5rMCt4cHF1WGFXMUo1WThrSnh2aHQ5cnZqVjQ5bGNOTlFsY0RM?=
 =?utf-8?B?emNCSlRvaFhnRSswelRJV3dFSWgrTXpVcFlnek54M2JJejltLzhFSTEzRWh0?=
 =?utf-8?B?U3pkbzRCeWNFOU9JWGw5QUpTSlBUSUV2dTF0ZmFpczIrTHhqV1hZMTVSd2lG?=
 =?utf-8?B?TzkzY3ZJcmpqQWtaNGg3MDNPRnlUUmkwZkpsbHdCaHVGL0YvN1BxSXZRTTR5?=
 =?utf-8?B?cWVadExMNUFOdWVQbXV6STdOUm9YeFNuazlaMUFobWJDMG0zQTZ0N0RuMDYz?=
 =?utf-8?Q?rHn8eCtlB0+mBztTiH3TT8bxu5sBN2izQYryqsfenI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <89B36C2DF1F7704788B539FD21179DFB@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e08559bd-cd52-4846-b722-08d9d50f9d9f
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2022 14:35:29.5039 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MimfP8wAWZ99s12D/7vWaPCMUJIOjHDCBEo+Hs8rDSLbc/7EkF+HPtGCaCFfxR4Ni1OLp4AoSbVAeCIhoDBz9bBmcQZlT4lA5FZpX+v9fX0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR2P264MB0001
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
Cc: "ykaliuta@redhat.com" <ykaliuta@redhat.com>,
 "johan.almbladh@anyfinetworks.com" <johan.almbladh@anyfinetworks.com>,
 Jiri Olsa <jolsa@redhat.com>, "song@kernel.org" <song@kernel.org>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDExLzAxLzIwMjIgw6AgMTE6MzEsIE5hdmVlbiBOLiBSYW8gYSDDqWNyaXTCoDoNCj4g
Q2hyaXN0b3BoZSBMZXJveSB3cm90ZToNCj4+DQo+Pg0KPj4gTGUgMDYvMDEvMjAyMiDDoCAxMjo0
NSwgTmF2ZWVuIE4uIFJhbyBhIMOpY3JpdMKgOg0KPj4+IEluIHByZXBhcmF0aW9uIGZvciB1c2lu
ZyBrZXJuZWwgVE9DLCBsb2FkIHRoZSBzYW1lIGluIHIyIG9uIGVudHJ5LiBXaXRoDQo+Pj4gZWxm
djEsIHRoZSBrZXJuZWwgVE9DIGlzIGFscmVhZHkgc2V0dXAgYnkgb3VyIGNhbGxlciBzbyB3ZSBq
dXN0IGVtaXQgYQ0KPj4+IG5vcC4gV2UgYWRqdXN0IHRoZSBudW1iZXIgb2YgaW5zdHJ1Y3Rpb25z
IHRvIHNraXAgb24gYSB0YWlsIGNhbGwNCj4+PiBhY2NvcmRpbmdseS4NCj4+Pg0KPj4+IFNpZ25l
ZC1vZmYtYnk6IE5hdmVlbiBOLiBSYW8gPG5hdmVlbi5uLnJhb0BsaW51eC52bmV0LmlibS5jb20+
DQo+Pj4gLS0tDQo+Pj4gwqAgYXJjaC9wb3dlcnBjL25ldC9icGZfaml0X2NvbXA2NC5jIHwgOCAr
KysrKysrLQ0KPj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkNCj4+Pg0KPj4+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvbmV0L2JwZl9qaXRfY29t
cDY0LmMgDQo+Pj4gYi9hcmNoL3Bvd2VycGMvbmV0L2JwZl9qaXRfY29tcDY0LmMNCj4+PiBpbmRl
eCBjZTRmYzU5YmJkNmE5Mi4uZTA1YjU3N2Q5NWJmMTEgMTAwNjQ0DQo+Pj4gLS0tIGEvYXJjaC9w
b3dlcnBjL25ldC9icGZfaml0X2NvbXA2NC5jDQo+Pj4gKysrIGIvYXJjaC9wb3dlcnBjL25ldC9i
cGZfaml0X2NvbXA2NC5jDQo+Pj4gQEAgLTczLDYgKzczLDEyIEBAIHZvaWQgYnBmX2ppdF9idWls
ZF9wcm9sb2d1ZSh1MzIgKmltYWdlLCBzdHJ1Y3QgDQo+Pj4gY29kZWdlbl9jb250ZXh0ICpjdHgp
DQo+Pj4gwqAgew0KPj4+IMKgwqDCoMKgwqAgaW50IGk7DQo+Pj4gKyNpZmRlZiBQUEM2NF9FTEZf
QUJJX3YyDQo+Pj4gK8KgwqDCoCBQUENfQlBGX0xMKF9SMiwgX1IxMywgb2Zmc2V0b2Yoc3RydWN0
IHBhY2Ffc3RydWN0LCBrZXJuZWxfdG9jKSk7DQo+Pj4gKyNlbHNlDQo+Pj4gK8KgwqDCoCBFTUlU
KFBQQ19SQVdfTk9QKCkpOw0KPj4+ICsjZW5kaWYNCj4+DQo+PiBDYW4gd2UgYXZvaWQgdGhlICNp
ZmRlZiwgdXNpbmcNCj4+DQo+PiDCoMKgwqDCoGlmIChfX2lzX2RlZmluZWQoUFBDNjRfRUxGX0FC
SV92MikpDQo+PiDCoMKgwqDCoMKgwqDCoCBQUENfQlBGX0xMKF9SMiwgX1IxMywgb2Zmc2V0b2Yo
c3RydWN0IHBhY2Ffc3RydWN0LCBrZXJuZWxfdG9jKSk7DQo+PiDCoMKgwqDCoGVsc2UNCj4+IMKg
wqDCoMKgwqDCoMKgIEVNSVQoUFBDX1JBV19OT1AoKSk7DQo+IA0KPiBIbW0uLi4gdGhhdCBkb2Vz
bid0IHdvcmsgZm9yIG1lLiBJcyBfX2lzX2RlZmluZWQoKSBleHBlY3RlZCB0byB3b3JrIHdpdGgg
DQo+IG1hY3JvcyBvdGhlciB0aGFuIENPTkZJRyBvcHRpb25zPw0KDQpZZXMsIF9faXNfZGVmaW5l
ZCgpIHNob3VsZCB3b3JrIHdpdGggYW55IGl0ZW0uDQoNCkl0IGlzIElTX0VOQUJMRUQoKSB3aGlj
aCBpcyBzdXBwb3NlZCB0byB3b3JrIG9ubHkgd2l0aCBDT05GSUcgb3B0aW9ucy4NCg0KU2VlIGNv
bW1pdCA1YzE4OWM1MjNlNzggKCJwb3dlcnBjL3RpbWU6IEZpeCBtZnRiKCkvZ2V0X3RiKCkgZm9y
IHVzZSB3aXRoIA0KdGhlIGNvbXBhdCBWRFNPIikNCg0KT3IgY29tbWl0IGNhNTk5OWZkZTBhMSAo
Im1tOiBpbnRyb2R1Y2UgaW5jbHVkZS9saW51eC9wZ3RhYmxlLmgiKQ0KDQoNCj4gDQo+Pg0KPj4+
ICsNCj4+PiDCoMKgwqDCoMKgIC8qDQo+Pj4gwqDCoMKgwqDCoMKgICogSW5pdGlhbGl6ZSB0YWls
X2NhbGxfY250IGlmIHdlIGRvIHRhaWwgY2FsbHMuDQo+Pj4gwqDCoMKgwqDCoMKgICogT3RoZXJ3
aXNlLCBwdXQgaW4gTk9QcyBzbyB0aGF0IGl0IGNhbiBiZSBza2lwcGVkIHdoZW4gd2UgYXJlDQo+
Pj4gQEAgLTg3LDcgKzkzLDcgQEAgdm9pZCBicGZfaml0X2J1aWxkX3Byb2xvZ3VlKHUzMiAqaW1h
Z2UsIHN0cnVjdCANCj4+PiBjb2RlZ2VuX2NvbnRleHQgKmN0eCkNCj4+PiDCoMKgwqDCoMKgwqDC
oMKgwqAgRU1JVChQUENfUkFXX05PUCgpKTsNCj4+PiDCoMKgwqDCoMKgIH0NCj4+PiAtI2RlZmlu
ZSBCUEZfVEFJTENBTExfUFJPTE9HVUVfU0laRcKgwqDCoCA4DQo+Pj4gKyNkZWZpbmUgQlBGX1RB
SUxDQUxMX1BST0xPR1VFX1NJWkXCoMKgwqAgMTINCj4+DQo+PiBXaHkgbm90IGNoYW5nZSB0aGF0
IGZvciB2MiBBQkkgb25seSBpbnN0ZWFkIG9mIGFkZGluZyBhIE5PUCA/IEFCSSANCj4+IHdvbid0
IGNoYW5nZSBkdXJpbmcgcnVudGltZSBBRkFJVQ0KPiANCj4gWWVhaCwgSSB3YW50ZWQgdG8ga2Vl
cCB0aGlzIHNpbXBsZSBhbmQgSSBmZWx0IGFuIGFkZGl0aW9uYWwgbm9wIA0KPiBzaG91bGRuJ3Qg
bWF0dGVyIHRvbyBtdWNoLiBCdXQsIEkgZ3Vlc3Mgd2UgY2FuIGdldCByaWQgb2YgDQo+IEJQRl9U
QUlMQ0FMTF9QUk9MT0dVRV9TSVpFIHNpbmNlIHRoZSBvbmx5IHVzZXIgaXMgdGhlIGZ1bmN0aW9u
IGVtaXR0aW5nIA0KPiBhIHRhaWwgY2FsbC4gSSB3aWxsIHN1Ym1pdCB0aGF0IGFzIGEgc2VwYXJh
dGUgY2xlYW51cCB1bmxlc3MgSSBuZWVkIHRvIA0KPiByZWRvIHRoaXMgc2VyaWVzLg0KPiANCg0K
QWxsIHRoaXMgbWFrZSBtZSB0aGluayBhYm91dCBhIGRpc2N1c3Npb24gSSBoYWQgc29tZSB0aW1l
IGFnbyB3aXRoIE5pYywgDQphbmQgd2UgZW5kZWQgdXAgdHJ5aW5nIHRvIGdldCByaWQgb2YgUFBD
NjRfRUxGX0FCSV92MiBtYWNybyBhbmQgdXNlIGEgDQpDT05GSUcgaXRlbSBpbnN0ZWFkLg0KDQpG
b3IgdGhlIHJlc3VsdCBzZWUgDQpodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3Qv
bGludXhwcGMtZGV2L3BhdGNoL2FkMGViMTJmNmUzZjQ5YjRhMzI4NGZjNTRjNGM0ZDcwYzQ5NjYw
OWUuMTYzNDQ1NzU5OS5naXQuY2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1Lw0KDQpGb3IgdGhl
IGRpc2N1c3Npb24gc2VlIA0KaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2xp
bnV4cHBjLWRldi9wYXRjaC80ZmRhNjVjZGE5MDZlNTZhYTg3ODA2YjY1OGUwODI4YzY0NzkyNDAz
LjE2MzQxOTAwMjIuZ2l0LmNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldS8NCg0KQ2hyaXN0b3Bo
ZQ==
