Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 36EAD61DC4A
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Nov 2022 18:08:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N4P8s0ys7z3dsv
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Nov 2022 04:08:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=fcQfol2c;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.41; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=fcQfol2c;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120041.outbound.protection.outlook.com [40.107.12.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N4P7r6SBxz2yQg
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  6 Nov 2022 04:07:50 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BGeXcLMvaLZNcG1tF0PlgEkki+pYVmz3mtgIjS3rvkoFE3f0fE1GoqBGpsDDlctPXFd7+gOt8b2NLf8hi2nHXjnO18RmicZ0dA9CQxue58zY2Ad13OVGbDLwNn/uKqZHscHpBKzamgia1/AOSv/MXdk0ncmlSykzYyrrE9zhrGdIeHNu+eeXtikaq8r3CFzqzYOw0AKouap88hzAUg0j12xeg/98AS8MXJmEdRdAwTuIhQq0OmkPUIZ0enWdvFLupveGeXLY6lptruicAFisg5UuZ94jDLE99G7zPP+hxopUJml9Cf3fp2/MeERRVvBwpzP+JX6/qvbkgsT74rt/mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xclsnu7n8KzCsnpVLZnjw4ft69qBuSM4NfMQaXvkMXU=;
 b=Bn0ElRO0rAC+jN+mNUubLdypwy9HBL+fRyV7GlVGLITMQGKG1DvuQV0AAE/Svu1hKaun6za8ij/pUTSIWknPJAqsNSgDpY/5dffr+vIxWOM1bHIy3m1TOqX3BBcW6sX3FL45IB2qQSTYJHTHEwrCzabsizFAD8BzL++R3dG+C4OLgIbkGde0BlpMkWDpBtit9RKtHVVPKfNzOFOPGGwfblzed3CZqUjvALM7hQF5sYBV82osmwhGVZfXrcfhRNTTtNuknSEiviE+MmYc4skMABeKut6+2zAFVjBdT6k2pTwoSQ+XhKrmjdvvMWrbtOOPWYVtMZWqg1UbJO/yBVf1TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xclsnu7n8KzCsnpVLZnjw4ft69qBuSM4NfMQaXvkMXU=;
 b=fcQfol2cyBcHKuCcUohWIwSNdJzBlVXZfczIWTRvD+elDirMpfjIae9VotgyfYm2P5h3t+fRwvQmhuSBUUX+IrHfSgKoMiMSO84BpD/opIMqT10xquMd7lVyyX/vJ7MPTia/LuXlNR1hEZdYtt7o1JH+xsm9M3+vt5HZ6GMnIPHzRSEJvWdP85AQbT5YBY/0g2cP86UwVdniiNbBJHPwAZeXcRLBzmaglhOaxUv+evBxtm4Gp2jbWYvGFmFFBFKqkC6d5HoaCEK74DQ6rxqzcfvrCd/xSbQAU0//O3pnda0iQ3uAKgvVFOAjVSQbodaUvw8LbC/s6JzVjFQfIPVzmA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB3442.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:26::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.25; Sat, 5 Nov
 2022 17:07:30 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6%7]) with mapi id 15.20.5791.024; Sat, 5 Nov 2022
 17:07:29 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Andrew Donnellan <ajd@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [RFC PATCH 6/6] powerpc/64s: Enable CONFIG_VMAP_STACK
Thread-Topic: [RFC PATCH 6/6] powerpc/64s: Enable CONFIG_VMAP_STACK
Thread-Index: AQHY8HLg7A/l90vSgEGOZFEkAVuYDa4wkTsA
Date: Sat, 5 Nov 2022 17:07:29 +0000
Message-ID: <1ae2abf5-e85d-cc6d-0cd4-1b89400ea780@csgroup.eu>
References: <20221104172737.391978-1-ajd@linux.ibm.com>
 <20221104172737.391978-7-ajd@linux.ibm.com>
In-Reply-To: <20221104172737.391978-7-ajd@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB3442:EE_
x-ms-office365-filtering-correlation-id: a899e3ee-fc42-4713-3445-08dabf5038b7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  ghq2wRCIo8DGStVNrJkADPtg2RgQjqP7qGCzGAOE6IM3+iA0WxvoXM/PO5mQQ9aUl5eodwwc0tkzyAqIifrBQVi2Q3fmcPTfCwBEefZ4gCiwTxXN/mfbYjyaQ1KrbBLLHs82EvZTaNPnge7ED/7cW1A7SwKOC3C9iGeCenXQk1cqpfdj0/II5flTA8FflSp9xHC2gsuN1VwwlDRPtiGNWLVQMD1IwAcy+5tPxlW9kO/tRRqm48jQPa7LFdZmY+ldDzhARMQmM0ZAZusgBwjqrzh/GVxJWLd5KReE+/DFNApO9RGVGBSo/XunD5sq5KM8lzvVOWU0FZ1S5+awLKQT+LmNzSjGVAVCm23T0TnzdgRvIXbnetqexFVwdV1KEhld4Qq9ppSS52a2XW8WyISAKEcSdxLyHPuXH5UT4/iqGDJeZj6X+zgMvEHNrDyXKZmFlWkZBczHtIpPSqQChTEGRgu+DfLv7GXarfKkCJNKe6eHRrdoeM43ousSWcgF7MuU9N1wCrD04QNHS4hrScKcY2rugjuogZF3ky3NbxC+f8Bl9tjuwnrA7dA0l/h8iuxZI9V3WMWsrMxbxNorrjxAJfOcTkYIcgXMO9XHr4UP84ry8ei+G8EAv5cutfLXFaaRreVU2xKsH6DRSm+12L8nnngKRZbXAgdlvWJ4DH/xyZMMZgnMhKBtgAARLfCjsWpEM6GzIKucywXxzfYEo3ynFWGDiDgxmNGE7R4/JmF/84p1DicGb3YVLpt5n3+XpB8eOPcpfb2ik04NaIcNzE7pnQfsfTmVbHWrZFX0tvef5kf1Qa5Llag6SycbQNDYpdwXjbdH1mfCM2kypsrwkgNNmw==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39840400004)(136003)(376002)(396003)(346002)(366004)(451199015)(316002)(54906003)(110136005)(31696002)(86362001)(36756003)(83380400001)(41300700001)(8936002)(5660300002)(66574015)(44832011)(8676002)(2616005)(66556008)(66446008)(38100700002)(186003)(66946007)(76116006)(91956017)(2906002)(4326008)(64756008)(122000001)(66476007)(31686004)(71200400001)(6512007)(26005)(38070700005)(6486002)(478600001)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?RzBYQ0dIc2lITC8rNmdDVDQ0a2h0STI4UFNpaEpIVEJBVHZOb1JLSFNYOENN?=
 =?utf-8?B?OWwxZ1JyU25WbmpXbmVCcXVSRS8yMmtlMS9iUjM1d01HdEkrU0Q4RGpSNThK?=
 =?utf-8?B?SVpFZDFLYzJGTXdTSG5lU09mM1d1V1diQ2JRVDVrN01FSVdtVzIva1FnK1Zj?=
 =?utf-8?B?U21ha3hiUXUyYmlLcm9nb2p4RWR6ak1HczlqUGZkSkVnZDdMMGJzcFlwRjk2?=
 =?utf-8?B?NHlMZThhc3h4ZENTTURycG5TeFNnTnZUd0w2djgzMkNjSGxGYnB1N3VzSDVu?=
 =?utf-8?B?emM0UjlkdlhzckFJV0tFY3oyekZHd1RWZXZpSGlWZllDUXhveFRtb003bXYx?=
 =?utf-8?B?RThnZ2lrOWxyeFRzOWt3MEJkYkFvWmYrUm9kc0JPMzFtNDVhR05uaEo0dGZB?=
 =?utf-8?B?RzE0cm1nNExqMkFvMlZYdVVlMXpSdm5Kb25vSVhBL2hCeDhDOUljKzNoZ1Uv?=
 =?utf-8?B?V3hVazQ4MFR4V3BLU0E0TmFxa0lLUzZOVDhGK2J6QnR2ck1aWTVOSGZ5a2Fm?=
 =?utf-8?B?ejhGaG16WW4wR1dlUXZkdkhEM01hemhKdlErTHBvMFBEdWlZclhHMDlpckxS?=
 =?utf-8?B?dUFYb1B3TmlWc0ZCZDBEbjljQUw3cmRMdUxWZCs1QWlYSnVaUWJQR1U1cmt6?=
 =?utf-8?B?YzlqNXpxY1E4ZEpjZDdFWkpLRDlkdUcybit6a045S1hadlh1c2pVYmNGdWlE?=
 =?utf-8?B?V1RWN3ZBTjhMakRsYldaaDBFMGlqYjdLSnpoVFhIYnIxVkllWkp4NlZUZ0NI?=
 =?utf-8?B?b0VHN0hodzdIQnpIaGJxc1VxYnV3SkszOFFnSThEQzlZNnVXQTYzejJzRlVy?=
 =?utf-8?B?aWs3YW81UkpmajZKRkFsY2ZzMlh1TFRqdm1ndlM3TEFXb2VrN3l0Y2NaVjhh?=
 =?utf-8?B?RUlzbElkUWpUNHZrWlVqZXlqcVdPWkxkSE5EOExzUjdtdmFkem1pNDZSL2dh?=
 =?utf-8?B?bVlYRFhneHVNMk01WEE1Z1pXUnB0V01OMTZnbUJjcTloV3lFZmxPYVNRWm54?=
 =?utf-8?B?VWpwSHFNN2poSG83YjArbGZva0JuUERla0NTQ0JHK0xuOUoxYW1ES0dHRXNV?=
 =?utf-8?B?WDZJSnpPaFpPbzBUamcvWDJzQ3pZMTdyeDF1ZXEwQ2gvNmhUajdiOHJxS2Yv?=
 =?utf-8?B?MW51bks1UXFQUjNCU1JoQzF1ODFnM1NxYUJmSEc2anpjMFc1NE5Ga1R5bW16?=
 =?utf-8?B?WkVZVG9hUDNmeDkwVVZBY29HRHlqdnA3SmVNVzZSank2cDNQVmtmTGdNK3N2?=
 =?utf-8?B?bXpITks0Z0dtR2JQU3h2ZFlFS3NpVDAvZ1lLUW9QcnZsTFhQeEJSV1pkTm1a?=
 =?utf-8?B?d0NPckN1RHZpQ1lhMlcwTUVNZE8xS2dMeU1qVGI2eGhObVJXZmpoMkoxQ0hw?=
 =?utf-8?B?VXRtc21mbTdGYjBqMFZacTNTeGJYY3l3d0FNcW9DOTZPMUxiWVhlVDRqUlNB?=
 =?utf-8?B?dmw1eGlJZGJBSGpMZDBIelZmVG5ZMWRmbXB4UjdnQ29QRDhHcUE3RHdFekZ0?=
 =?utf-8?B?UDMwYjZjK1dSTEFMZll0bWF1RkdZN0VQb2YzV2FUT082bDY4UDlCeGJLbERN?=
 =?utf-8?B?bjlxRGYvc28wdkdPdDM1TTQvVUcvL2pWOFJ4Q1ZkQnlFYWdaSmVPR0lONUh5?=
 =?utf-8?B?Q1FVZ2QxUFZIcTRNY2pxcUJuK0cyM2JVMWttT0NnRk5QdldEZFhqZGhXR00y?=
 =?utf-8?B?MFlTUThXSWRpYTJ6Z1pabmI2M09RZzZJczVsWmNrY0ZGQi9valN2b3FXcVYz?=
 =?utf-8?B?SzVBdzZmNXk1d0xod0N2T2hkeTl5R2EzaXIydktORVlSbXNDRUh5akFFcUJ1?=
 =?utf-8?B?NHVGV1d0Sm00OVBNM2dHVWJZZ2lqbjV6YWJLMU1qNVY3RDlCNEZZdHBkRkR5?=
 =?utf-8?B?R3VEYTFDdTVoWUhtRHQ1a252dnptM1dpekdPOU5VR3B2T3pHeisyN2tHeFJH?=
 =?utf-8?B?Z2xhS2pEaHAzSzIrU0VuWkF4bnlGT3dPVEdHaGErckNoQ2QrZkRLN3V0Wnhm?=
 =?utf-8?B?QjBJd0xJcXF0OWJZQkwxSVJXSVIrKzRSSW85YW5SVVpocDgzQWRTNkhpTTNT?=
 =?utf-8?B?d2ZGbVoweU5vSmh0U1JKelpYR3FRSjZveHpJcTg5bWJHdnJTcmZmdlpCa3FV?=
 =?utf-8?B?N1p0aUV3bUl3Z0tlaDVmLzN4c1JmblV5dURQTGNocGxpb3VZcEhzMFk0SHM2?=
 =?utf-8?Q?r9PlvKlR0B0CTFIOmu9/bNU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <00DEC6277AABCF409773382685D360C4@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a899e3ee-fc42-4713-3445-08dabf5038b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2022 17:07:29.6009
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UNf7LBUwm27uFiH3ls0KS5xBV4ggIj+3Qt98l910QBJdtZf44rUMdxJLLcIjgktdoAwNT5O2DVsxNswPqDgVA3QMx4tCgEFDdLX28O2SeqI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB3442
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
Cc: "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>, "cmr@bluescreens.de" <cmr@bluescreens.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA0LzExLzIwMjIgw6AgMTg6MjcsIEFuZHJldyBEb25uZWxsYW4gYSDDqWNyaXTCoDoN
Cj4gRW5hYmxlIENPTkZJR19WTUFQX1NUQUNLIGZvciBib29rM3M2NC4NCj4gDQo+IFRvIGRvIHRo
aXMsIHdlIG5lZWQgdG8gbWFrZSBzb21lIHNsaWdodCBhZGp1c3RtZW50cyB0byBzZXQgdGhlIHN0
YWNrIFNMQg0KPiBlbnRyeSB1cCBmb3Igdm1hbGxvYyByYXRoZXIgdGhhbiBsaW5lYXIuDQo+IA0K
PiBGb3Igbm93LCBvbmx5IGVuYWJsZSBpZiBLVk1fQk9PSzNTXzY0X0hWIGlzIGRpc2FibGVkICh0
aGVyZSdzIHNvbWUgcmVhbCBtb2RlDQo+IGhhbmRsZXJzIHdlIG5lZWQgdG8gZml4IHRoZXJlKS4N
Cg0KVGhlcmUgaXMgb25lIG1pc3NpbmcgcG9pbnQgOiB3aXRoIFZNQVBfU1RBQ0ssIGEgc3RhY2sg
b3ZlcmZsb3cgd2lsbCANCmdlbmVyYXRlIGEgcGFnZSBmYXVsdC4gWW91IGhhdmUgdG8gaGFuZGxl
IGl0IGF0IGludGVycnVwdCBlbnRyeSwgYmVmb3JlIA0KZ29pbmcgYmFjayB0byB2aXJ0dWFsIG1v
ZGUsIG90aGVyd2lzZSBpdCB3aWxsIGZhdWx0IGZvcmV2ZXIuDQoNClNlZSBob3cgaXQgaXMgZG9u
ZSBpbiBhcmNoL3Bvd2VycGMva2VybmVsL2hlYWRfMzIuaCwgaW4gbWFjcm8gDQpFWENFUFRJT05f
UFJPTE9HXzENCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IERvbm5lbGxhbiA8YWpkQGxp
bnV4LmlibS5jb20+DQo+IC0tLQ0KPiAgIGFyY2gvcG93ZXJwYy9rZXJuZWwvcHJvY2Vzcy5jICAg
ICAgICAgIHwgIDQgKysrKw0KPiAgIGFyY2gvcG93ZXJwYy9tbS9ib29rM3M2NC9zbGIuYyAgICAg
ICAgIHwgMTEgKysrKysrKysrLS0NCj4gICBhcmNoL3Bvd2VycGMvcGxhdGZvcm1zL0tjb25maWcu
Y3B1dHlwZSB8ICAxICsNCj4gICAzIGZpbGVzIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2tlcm5lbC9wcm9j
ZXNzLmMgYi9hcmNoL3Bvd2VycGMva2VybmVsL3Byb2Nlc3MuYw0KPiBpbmRleCAwNzkxNzcyNmM2
MjkuLmNhZGYyZGI1YTJhOCAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL2tlcm5lbC9wcm9j
ZXNzLmMNCj4gKysrIGIvYXJjaC9wb3dlcnBjL2tlcm5lbC9wcm9jZXNzLmMNCj4gQEAgLTE2ODUs
NyArMTY4NSwxMSBAQCBzdGF0aWMgdm9pZCBzZXR1cF9rc3BfdnNpZChzdHJ1Y3QgdGFza19zdHJ1
Y3QgKnAsIHVuc2lnbmVkIGxvbmcgc3ApDQo+ICAgew0KPiAgICNpZmRlZiBDT05GSUdfUFBDXzY0
U19IQVNIX01NVQ0KPiAgIAl1bnNpZ25lZCBsb25nIHNwX3ZzaWQ7DQo+ICsjaWZkZWYgQ09ORklH
X1ZNQVBfU1RBQ0sNCj4gKwl1bnNpZ25lZCBsb25nIGxscCA9IG1tdV9wc2l6ZV9kZWZzW21tdV92
bWFsbG9jX3BzaXplXS5zbGxwOw0KPiArI2Vsc2UgLyogQ09ORklHX1ZNQVBfU1RBQ0sgKi8NCj4g
ICAJdW5zaWduZWQgbG9uZyBsbHAgPSBtbXVfcHNpemVfZGVmc1ttbXVfbGluZWFyX3BzaXplXS5z
bGxwOw0KPiArI2VuZGlmIC8qIENPTkZJR19WTUFQX1NUQUNLICovDQoNCkkgdGhpbmsgeW91IGNv
dWxkIHVzZSBJU19FTkFCTEVEKCkgaW5zdGVhZCBvZiBhbiBpZmRlZjoNCg0KCXVuc2lnbmVkIGxv
bmcgbGxwOw0KDQoJaWYgKElTX0VOQUJMRUQoQ09ORklHX1ZNQVBfU1RBQ0spKQ0KCQlsbHAgPSBt
bXVfcHNpemVfZGVmc1ttbXVfdm1hbGxvY19wc2l6ZV0uc2xscDsNCgllbHNlDQoJCWxscCA9IG1t
dV9wc2l6ZV9kZWZzW21tdV9saW5lYXJfcHNpemVdLnNsbHA7DQoNCj4gICANCj4gICAJaWYgKHJh
ZGl4X2VuYWJsZWQoKSkNCj4gICAJCXJldHVybjsNCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJw
Yy9tbS9ib29rM3M2NC9zbGIuYyBiL2FyY2gvcG93ZXJwYy9tbS9ib29rM3M2NC9zbGIuYw0KPiBp
bmRleCA2OTU2ZjYzN2EzOGMuLjBlMjFmMGVhYTdiYiAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dl
cnBjL21tL2Jvb2szczY0L3NsYi5jDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9tbS9ib29rM3M2NC9z
bGIuYw0KPiBAQCAtNTQxLDcgKzU0MSw3IEBAIHZvaWQgc2xiX3NldF9zaXplKHUxNiBzaXplKQ0K
PiAgIHZvaWQgc2xiX2luaXRpYWxpemUodm9pZCkNCj4gICB7DQo+ICAgCXVuc2lnbmVkIGxvbmcg
bGluZWFyX2xscCwgdm1hbGxvY19sbHAsIGlvX2xscDsNCj4gLQl1bnNpZ25lZCBsb25nIGxmbGFn
czsNCj4gKwl1bnNpZ25lZCBsb25nIGxmbGFncywga3N0YWNrX2ZsYWdzOw0KPiAgIAlzdGF0aWMg
aW50IHNsYl9lbmNvZGluZ19pbml0ZWQ7DQo+ICAgI2lmZGVmIENPTkZJR19TUEFSU0VNRU1fVk1F
TU1BUA0KPiAgIAl1bnNpZ25lZCBsb25nIHZtZW1tYXBfbGxwOw0KPiBAQCAtNTgyLDExICs1ODIs
MTggQEAgdm9pZCBzbGJfaW5pdGlhbGl6ZSh2b2lkKQ0KPiAgIAkgKiBnZXRfcGFjYSgpLT5rc3Rh
Y2sgaGFzbid0IGJlZW4gaW5pdGlhbGl6ZWQgeWV0Lg0KPiAgIAkgKiBGb3Igc2Vjb25kYXJ5IGNw
dXMsIHdlIG5lZWQgdG8gYm9sdCB0aGUga2VybmVsIHN0YWNrIGVudHJ5IG5vdy4NCj4gICAJICov
DQo+ICsNCj4gKyNpZmRlZiBDT05GSUdfVk1BUF9TVEFDSw0KPiArCWtzdGFja19mbGFncyA9IFNM
Ql9WU0lEX0tFUk5FTCB8IHZtYWxsb2NfbGxwOw0KPiArI2Vsc2UNCj4gKwlrc3RhY2tfZmxhZ3Mg
PSBTTEJfVlNJRF9LRVJORUwgfCBsaW5lYXJfbGxwOw0KPiArI2VuZGlmDQoNClNhbWUsIHNob3Vs
ZCBiZQ0KDQoJaWYgKElTX0VOQUJMRUQoQ09ORklHX1ZNQVBfU1RBQ0spKQ0KCQlrc3RhY2tfZmxh
Z3MgPSBTTEJfVlNJRF9LRVJORUwgfCB2bWFsbG9jX2xscDsNCgllbHNlDQoJCWtzdGFja19mbGFn
cyA9IFNMQl9WU0lEX0tFUk5FTCB8IGxpbmVhcl9sbHA7DQoNCj4gICAJc2xiX3NoYWRvd19jbGVh
cihLU1RBQ0tfSU5ERVgpOw0KPiAgIAlpZiAocmF3X3NtcF9wcm9jZXNzb3JfaWQoKSAhPSBib290
X2NwdWlkICYmDQo+ICAgCSAgICAoZ2V0X3BhY2EoKS0+a3N0YWNrICYgc2xiX2VzaWRfbWFzayht
bXVfa2VybmVsX3NzaXplKSkgPiBQQUdFX09GRlNFVCkNCj4gICAJCWNyZWF0ZV9zaGFkb3dlZF9z
bGJlKGdldF9wYWNhKCktPmtzdGFjaywNCj4gLQkJCQkgICAgIG1tdV9rZXJuZWxfc3NpemUsIGxm
bGFncywgS1NUQUNLX0lOREVYKTsNCj4gKwkJCQkgICAgIG1tdV9rZXJuZWxfc3NpemUsIGtzdGFj
a19mbGFncywNCj4gKwkJCQkgICAgIEtTVEFDS19JTkRFWCk7DQo+ICAgDQo+ICAgCWFzbSB2b2xh
dGlsZSgiaXN5bmMiOjo6Im1lbW9yeSIpOw0KPiAgIH0NCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93
ZXJwYy9wbGF0Zm9ybXMvS2NvbmZpZy5jcHV0eXBlIGIvYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy9L
Y29uZmlnLmNwdXR5cGUNCj4gaW5kZXggMGM0ZWVkOWFlYTgwLi45OTgzMTcyNTc3OTcgMTAwNjQ0
DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvS2NvbmZpZy5jcHV0eXBlDQo+ICsrKyBi
L2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvS2NvbmZpZy5jcHV0eXBlDQo+IEBAIC0xMDQsNiArMTA0
LDcgQEAgY29uZmlnIFBQQ19CT09LM1NfNjQNCj4gICAJc2VsZWN0IElSUV9XT1JLDQo+ICAgCXNl
bGVjdCBQUENfNjRTX0hBU0hfTU1VIGlmICFQUENfUkFESVhfTU1VDQo+ICAgCXNlbGVjdCBLQVNB
Tl9WTUFMTE9DIGlmIEtBU0FODQo+ICsJc2VsZWN0IEhBVkVfQVJDSF9WTUFQX1NUQUNLIGlmIEtW
TV9CT09LM1NfNjRfSFYgPSBuDQoNCklzIGl0IGRpZmZlcmVudCBmcm9tDQoNCglzZWxlY3QgSEFW
RV9BUkNIX1ZNQVBfU1RBQ0sgaWYgIUtWTV9CT09LM1NfNjRfSFYgPw0KDQo+ICAgDQo+ICAgY29u
ZmlnIFBQQ19CT09LM0VfNjQNCj4gICAJYm9vbCAiRW1iZWRkZWQgcHJvY2Vzc29ycyI=
