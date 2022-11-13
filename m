Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F002627166
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Nov 2022 19:01:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N9KyP3FBjz3dtw
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Nov 2022 05:01:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=F+IGr4VD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.55; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=F+IGr4VD;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120055.outbound.protection.outlook.com [40.107.12.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N9KxP0dB6z2yHc
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Nov 2022 05:00:55 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GFxX8BMb8qAg8a/FZfI8aORMbhqdDzxwZjDlQrOPLgMfCyCy+mV8WwziUsHr78RlkrLbndsb6mC4nc9436nmTHcCVDALVTUd58/Yc871CRBVOOxg+VI+UJxY+zkbxoP4zRF/9gE9nw1XzZee3IOZHpPj8wfqaFHYH+bKwZzfNlCdgl6RBu2FjwGBtRQtMNfH8Y/1toVLxT6XW2SNJxXoC4G9C4mtWZrv0d6zOTPfSSybWbySGKbF2Ri1d2DHapFV3LCMyXx4sm7tG8PaUiHe+8qrvRtTH9X+7z5cjf8gGH2o7wW6zmmxgxK+pdw/lw5L152oPJ+hxw+Xgo0LKCkMGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AX6sANSvjmbmibz0+9WO5KsMBolCPp0TxctvTg0Y7Qk=;
 b=c9yaMzwAb8MZhR/ZFeNsXnnrTQWNdLjltdWRozM/O/m5DmUYb6vKDihLUTftSTXuQhPrXbUaNrjLq0Cx6HXgP3A3a+yyLwbCUBaP5kXUMQPuZL/hXhGP4JSdfw3a/4we5FuqAQekc86nhnD4OCV564DIbGmDRYLOZ23OMV1q7s9KV7CCiGowLjcTfL86iONXACKk3VV1WdN0sVDm9VkYtEXlgXOpCo3FIFtVS0MN8o7AP1RBak6Cn4874ABv9YdbvSbpp+0u47V8nlCYCIpwXzyKdoLGh1kGRKUC++pKWjPkOtw4iyxK7frH4RcOF62t7vXwX/X9w6iYwKAUo5kbBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AX6sANSvjmbmibz0+9WO5KsMBolCPp0TxctvTg0Y7Qk=;
 b=F+IGr4VDH4n2XD493HAxV9TJr3s61yLfRPRJ7mYTXFk8O1fGrq6h98VZC6h7YA/p2Nqb47NPniMzOH9xaAV4iNLspKdhYxMeFUIBPQSN6//G2px7aKw9X07xQS4rwDuXDF1KVaJRREHhc/dEwzMPCXEYkSY4IIaS5PL2iiPAFsN70k9w16y87b4U9nqUMj55vgsKmaZ0E33wcA40H/Ysvx/eJQNsIB4lPOxdPgBYvXIsMPOuWQShJI3souw8hnu9P7JgIlksw8dXI7BtVZH8/1vt95T9qCkVRKWl/5JfSSMfH4W8t2QDuaeGUWy/yPa7XXLjuHsFN4+lk1C7HzTJEg==
Received: from MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3d::7) by
 PR0P264MB1787.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:16f::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.17; Sun, 13 Nov 2022 18:00:35 +0000
Received: from MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fd:d69d:cf17:c18]) by MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fd:d69d:cf17:c18%4]) with mapi id 15.20.5813.017; Sun, 13 Nov 2022
 18:00:35 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Hari Bathini <hbathini@linux.ibm.com>, linuxppc-dev
	<linuxppc-dev@lists.ozlabs.org>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>
Subject: Re: [RFC PATCH 2/3] powerpc/bpf: implement bpf_arch_text_invalidate
 for bpf_prog_pack
Thread-Topic: [RFC PATCH 2/3] powerpc/bpf: implement bpf_arch_text_invalidate
 for bpf_prog_pack
Thread-Index: AQHY9TSc0oruryYX3EWtbkBZh4KbHa49KT0A
Date: Sun, 13 Nov 2022 18:00:35 +0000
Message-ID: <0efbcdd4-8e08-2c31-debe-389f3415ec21@csgroup.eu>
References: <20221110184303.393179-1-hbathini@linux.ibm.com>
 <20221110184303.393179-3-hbathini@linux.ibm.com>
In-Reply-To: <20221110184303.393179-3-hbathini@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MR1P264MB2980:EE_|PR0P264MB1787:EE_
x-ms-office365-filtering-correlation-id: 8ad8b250-5e10-44c2-a136-08dac5a0f6cb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  K1LMjvEh5Qdf/gDA/ONu8NhRBVYzpKe/xLHCRwU6vvUhiSKDb3WzDOR98KtKAMVivuJWtyMWpK9/sBbUe038ihX3vVmJVGdfUGdc/3pJULNgwVFG+4sRbuH7fsPQc7T5s90srN6npvZPLPDe7xg/HFFHlyNVzfZYnxVJQ3fUGbwvdA36EXBPSBUKg2wpf51s80Gm+pPG2JFLp2llANcZZfyeX4/73RSrgilDQiu3hndB1KbDHl4iCfCXp690szbN4FyO+wEtAQbUbDxt4sQSjHURfPTtzTBBaKaDyhKAXjugGNxlcSqFlnO6M24vtkSFBxmqtXTbKQgZ9/Uomk7hEdaGO7481n1Kdl9ZYs3WLrO6qHJWGs4z6cOk7Idp/Uckivup889ReBMdmSk8clvdK+WEX5n5t8Jkmy0rHMQzPja4z0ABCt7yyrGtsdUZYOHtdYtKTYpGxQMEcsVcJ9jeYlCIu7R8jFg2lm/mG6OWQLeedaldg5jJI6Qpy2kb5rKdJ7nF6hRRCEIKN1TiZSIy35k5vixP1yKAS4huGo9oUlwW2DucHLkh/Yfzt4/KeaLcGQ7oSV/Oxm7dBAei/gLbayUf5orPhHunVjW/sbXTQ/RK37nwNRy+8+GqlQNHyPF4pHWTLyPwZu1SY7PujLhtf4cMZUUb1+5kl0/Zh8Z0FmqekQe1pIZ9VoJNuRGNY/sq+T4/19LuCYtI7K2T+g9eDeZSANflJUbMTA6bwblo0SEtKAEAzNbTioS5GAOJfDQKnPuWGalR4OE48nUet+34oLdryqkeQ+4z9LqBXWD6au0C8s3ilNtQopO8oKlqRmHQA+wkqmugnB+IYRS39F40qA==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(376002)(136003)(39840400004)(366004)(451199015)(6486002)(38070700005)(478600001)(71200400001)(31696002)(122000001)(86362001)(38100700002)(110136005)(316002)(83380400001)(41300700001)(2906002)(6506007)(186003)(54906003)(26005)(8676002)(66946007)(76116006)(66446008)(64756008)(66556008)(66476007)(6512007)(91956017)(4326008)(31686004)(66574015)(44832011)(5660300002)(36756003)(8936002)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?a2FBdHY4ZWJxU1l4QjRyUnZ5ekp6ZzhUb3A4WndCRW54RmFVVzJNNlh3SFZC?=
 =?utf-8?B?MFZoM3ppV3pCTTJIcFJyY0xHUHhROGFTRTJUUVRQdWFVMjkyTzF4elRSZTZD?=
 =?utf-8?B?cno5TGZZUzY3bGpwSnJLZW1LRjhQK1kwWnJlMlVJSGlCSnZISWprTHAwZDVo?=
 =?utf-8?B?NTRISTlmOElNUmhoTlJkaW5GV1dTaXZiNXVIVXhjbWpuM2pKRG5PMkp6YkpO?=
 =?utf-8?B?QmN6TWdlWUdOMm9yMU1ja0pDM2J2UnVLZmFveXh2b2VyRytZVnhKTlVXR0Nq?=
 =?utf-8?B?L1VpcG9BaHJ1cmo3RDVHREdZV0ZsdlNvMUlFZXl5ZWtwZlhGTEVkNTZsTTVN?=
 =?utf-8?B?ckMxL2FKaStPY3g0YVdhUkw2YldtTGU0V2pLaE9QQ0Q3ZXNZK1lpWWlXemJJ?=
 =?utf-8?B?Zk1qZzBIUkpqcy9ZYytIaFg4bFJaS2dxbmxidDgwZ0tkcGsvaU5jT0k1NlVp?=
 =?utf-8?B?djF4VUJ0VTFoekpQT3RRUUU1S3VCaUVlOU5ya2hKa0tEbzdYV3JTdGd5TzB2?=
 =?utf-8?B?ZVloRzM2NG9WUitqQ1FjbE4rVzFuYVFLUGJHMitmSGNjaHdGcVNocmYxdWZJ?=
 =?utf-8?B?UU5GQUR5SGh5NERYTGlWM0NZbXFrZVByTzdYOExHWU9CZVNVOGFCY00wc1c3?=
 =?utf-8?B?anZROVRNTGxiR055dytNQ0JNV2lPSVZ4L215aUtqM0VlZTNrMW9Ld3FyZkM2?=
 =?utf-8?B?Q3NUZUZsdkJDQVNKdi9zVVJwUW92SVJ4M1lSQmsyNUFnR3hmYUdqV28yT29V?=
 =?utf-8?B?WDZoMWF3bE9HNWY1Z2JsSWJSVkV0eVNDdVV3cnFoWTZMckNqNm91QnFMek9I?=
 =?utf-8?B?bElYd0VYZ3kyd1RkVzcwWEYwZms4QUVGSWoySXN5SlZndXVid05nc1hwSUpo?=
 =?utf-8?B?bFpoeWpvN3ZRUjkzdXVFSmpsTFExcndYWkExNDVxWXVXdjBKa1RHSlpsT1J5?=
 =?utf-8?B?eUdhcjlVUjgyaTRIMi9kTFdFT2VobGVKamFVUEV6WEZBV2pZdUZkSmZLK3Ey?=
 =?utf-8?B?NTdPM2tuRGhUS3FJT00xaURYbzg2U09YWGZpSGZLa2xwT0FXVm5ld3hYbW5F?=
 =?utf-8?B?K0piSzFHeC9JLzBuL004QVNHdHNQeWEzaU42aGIzT3ZVbGdCMkFOVXc1eVdF?=
 =?utf-8?B?ZFRpeHFaaUUvUjF4WWdDc1h2cHE3TE5Rcmx6Q3pxZHNGMXBCL1hGbXBEWUxa?=
 =?utf-8?B?eVVRYkZzMnhkRWdnYUdmNitUdHplSFA5d3NVTGxEdy9vZmpIb0NYeHA5emJJ?=
 =?utf-8?B?V0MzT0RVYWEzZUpLNXFHSlVMNytIaU94b3lqNVIwTVZtT0RIK3A3MWh6d1hC?=
 =?utf-8?B?bzFSZVlRQURPa1pwd3FvQnpTdG9GeEs3dDZLOTFDSUJQbDNST3VWd0hUYkM0?=
 =?utf-8?B?TUgzYS9KekZqdHZOZkcrUDlQSjdFc2gxSE9JbXBUU2NnQkRkZ1c3VWZ1VTdk?=
 =?utf-8?B?QjBwenZSMWI2QWFsdHgzRmNjSGFmeG10blJrTmpibnVoT0hCK2dvNk1CZTEz?=
 =?utf-8?B?UzlCS1FWSFJibk5STS9YNVdJYUtmNUNYWTQ1cnZrak9Ed1lLTGdUT3VoTlRq?=
 =?utf-8?B?UlI0d2pvOWREMVgzNTN3L3N4QmdhL0g1MkFqejFsaUhqWmxTRU5yR1RMNzJj?=
 =?utf-8?B?ZjhUa0hLOUlYY0RLUzF2NVV5TW5Ba1NWMHRrSitYOEJVd0o0aTcya2pObUVv?=
 =?utf-8?B?dEZGb3RjTGZob3ZrbkpjZHpWcDVxc0FsTlp2TDh6blNGLzNMSFlHcUJaYkE0?=
 =?utf-8?B?TjJiQzJJTnhKbWVvbEVSREpWaGhFZ3hKOUt5ZFhPRCtqZ296QTRleFpIRzVI?=
 =?utf-8?B?TURrS2M4WTNZOTExeHllS2lJenQxb0t4REJORUxnaVpjVzhaNUpobDQ0bDh4?=
 =?utf-8?B?OTZXajZvUXJwekRydWFHYUplT1lOUlplSnFqaWU2ZTJDNHEzZ25EcEIvSzNM?=
 =?utf-8?B?eGF5dk9BcWRoZ0lFeWZtSTVZM3RaN0NtbWhWZkVleGk1aEUrcWRhTFYzMzRQ?=
 =?utf-8?B?T2x2U290ODNFRnVMNTFHY05Td0VuSUhIcGFIY1BVb0tHZDhsMnZ5Vk12NE4r?=
 =?utf-8?B?bHVjY05NeUY2RmhpTk90YlBPOU1aY2FQT04wSFhMWVZjSVdpVlpJWCs3R2g3?=
 =?utf-8?B?a0dobFl0aHplK09jc3JKeVRwSUNndEUxSnRLSklEZWVQZTBQVS9Bd3JVdS96?=
 =?utf-8?B?NXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AF7B472B4B2B6C489573EA484510D4FA@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ad8b250-5e10-44c2-a136-08dac5a0f6cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2022 18:00:35.2012
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +sNj0jbmmMvScQ7iCPPojVKqO97ujbwyrvhh+tZSf5IqW/OnYIYvvFm+SCcH4U0fzSbNMfOV78lFfF1m63F/QVepckhxkm6NlcPGQWIDPIg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB1787
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
Cc: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Song Liu <songliubraving@fb.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

TGUgMTAvMTEvMjAyMiDDoCAxOTo0MywgSGFyaSBCYXRoaW5pIGEgw6ljcml0wqA6DQo+IEltcGxl
bWVudCBicGZfYXJjaF90ZXh0X2ludmFsaWRhdGUgYW5kIHVzZSBpdCB0byBmaWxsIHVudXNlZCBw
YXJ0IG9mDQo+IHRoZSBicGZfcHJvZ19wYWNrIHdpdGggdHJhcCBpbnN0cnVjdGlvbnMgd2hlbiBh
IEJQRiBwcm9ncmFtIGlzIGZyZWVkLg0KDQpTYW1lIGhlcmUsIGFsbHRob3VnaCBwYXRjaF9pbnN0
cnVjdGlvbigpIGlzIG5pY2UgZm9yIGEgZmlyc3QgdHJ5LCBpdCBpcyANCm5vdCB0aGUgc29sdXRp
b24gb24gdGhlIGxvbmcgcnVuLiBTYW1lIGFzIHdpdGggcHJldmlvdXMgcGF0Y2gsIGl0IHNob3Vs
ZCANCmp1c3QgbWFwIHRoZSBuZWNlc3NhcnkgcGFnZSBieSBhbGxvY2F0aW5nIGEgdm1hIGFyZWEg
dGhlbiBtYXBwaW5nIHRoZSANCmFzc29jaWF0ZWQgcGh5c2ljYWwgcGFnZXMgb3ZlciBpdCB1c2lu
ZyBtYXBfa2VybmVsX3BhZ2UoKSwgdGhlbiB1c2UgDQpicGZfaml0X2ZpbGxfaWxsX2luc25zKCkg
b3ZlciB0aGFuIHBhZ2UuDQoNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEhhcmkgQmF0aGluaSA8aGJh
dGhpbmlAbGludXguaWJtLmNvbT4NCj4gLS0tDQo+ICAgYXJjaC9wb3dlcnBjL25ldC9icGZfaml0
X2NvbXAuYyB8IDMyICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ICAgMSBmaWxl
IGNoYW5nZWQsIDMyIGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2Vy
cGMvbmV0L2JwZl9qaXRfY29tcC5jIGIvYXJjaC9wb3dlcnBjL25ldC9icGZfaml0X2NvbXAuYw0K
PiBpbmRleCA3MzgzZTBlZmZhZDIuLmY5MjU3NTVjZDI0OSAxMDA2NDQNCj4gLS0tIGEvYXJjaC9w
b3dlcnBjL25ldC9icGZfaml0X2NvbXAuYw0KPiArKysgYi9hcmNoL3Bvd2VycGMvbmV0L2JwZl9q
aXRfY29tcC5jDQo+IEBAIC0yNiw2ICsyNiwzMyBAQCBzdGF0aWMgdm9pZCBicGZfaml0X2ZpbGxf
aWxsX2luc25zKHZvaWQgKmFyZWEsIHVuc2lnbmVkIGludCBzaXplKQ0KPiAgIAltZW1zZXQzMihh
cmVhLCBCUkVBS1BPSU5UX0lOU1RSVUNUSU9OLCBzaXplIC8gNCk7DQo+ICAgfQ0KPiAgIA0KPiAr
LyoNCj4gKyAqIFBhdGNoICdsZW4nIGJ5dGVzIHdpdGggdHJhcCBpbnN0cnVjdGlvbiBhdCBhZGRy
LCBvbmUgaW5zdHJ1Y3Rpb24NCj4gKyAqIGF0IGEgdGltZS4gUmV0dXJucyBhZGRyIG9uIHN1Y2Nl
c3MuIEVSUl9QVFIoLUVJTlZBTCksIG90aGVyd2lzZS4NCj4gKyAqLw0KPiArc3RhdGljIHZvaWQg
KmJwZl9wYXRjaF9pbGxfaW5zbnModm9pZCAqYWRkciwgc2l6ZV90IGxlbikNCj4gK3sNCj4gKwl2
b2lkICpyZXQgPSBFUlJfUFRSKC1FSU5WQUwpOw0KPiArCXNpemVfdCBwYXRjaGVkID0gMDsNCj4g
Kwl1MzIgKnN0YXJ0ID0gYWRkcjsNCj4gKw0KPiArCWlmIChXQVJOX09OX09OQ0UoY29yZV9rZXJu
ZWxfdGV4dCgodW5zaWduZWQgbG9uZylhZGRyKSkpDQo+ICsJCXJldHVybiByZXQ7DQo+ICsNCj4g
KwltdXRleF9sb2NrKCZ0ZXh0X211dGV4KTsNCj4gKwl3aGlsZSAocGF0Y2hlZCA8IGxlbikgew0K
PiArCQlpZiAocGF0Y2hfaW5zdHJ1Y3Rpb24oc3RhcnQrKywgcHBjX2luc3QoUFBDX1JBV19UUkFQ
KCkpKSkNCg0KVXNlIEJSRUFLUE9JTlRfSU5TVFJVQ1RJT04gaW5zdGVhZCBvZiBQUENfUkFXX1RS
QVAoKQ0KDQo+ICsJCQlnb3RvIGVycm9yOw0KPiArDQo+ICsJCXBhdGNoZWQgKz0gNDsNCj4gKwl9
DQo+ICsNCj4gKwlyZXQgPSBhZGRyOw0KPiArZXJyb3I6DQo+ICsJbXV0ZXhfdW5sb2NrKCZ0ZXh0
X211dGV4KTsNCj4gKwlyZXR1cm4gcmV0Ow0KPiArfQ0KPiArDQo+ICAgLyoNCj4gICAgKiBQYXRj
aCAnbGVuJyBieXRlcyBvZiBpbnN0cnVjdGlvbnMgZnJvbSBvcGNvZGUgdG8gYWRkciwgb25lIGlu
c3RydWN0aW9uDQo+ICAgICogYXQgYSB0aW1lLiBSZXR1cm5zIGFkZHIgb24gc3VjY2Vzcy4gRVJS
X1BUUigtRUlOVkFMKSwgb3RoZXJ3aXNlLg0KPiBAQCAtMzk0LDMgKzQyMSw4IEBAIHZvaWQgKmJw
Zl9hcmNoX3RleHRfY29weSh2b2lkICpkc3QsIHZvaWQgKnNyYywgc2l6ZV90IGxlbikNCj4gICB7
DQo+ICAgCXJldHVybiBicGZfcGF0Y2hfaW5zdHJ1Y3Rpb25zKGRzdCwgc3JjLCBsZW4pOw0KPiAg
IH0NCj4gKw0KPiAraW50IGJwZl9hcmNoX3RleHRfaW52YWxpZGF0ZSh2b2lkICpkc3QsIHNpemVf
dCBsZW4pDQo+ICt7DQo+ICsJcmV0dXJuIElTX0VSUihicGZfcGF0Y2hfaWxsX2luc25zKGRzdCwg
bGVuKSk7DQo+ICt9DQoNCg0KVGhlIGV4YWN0IHNhbWUgc3BsaXQgYmV0d2VlbiBicGZfYXJjaF90
ZXh0X2ludmFsaWRhdGUoKSBhbmQgDQpicGZfcGF0Y2hfaWxsX2luc25zKCkgYXMgcHJldmlvdXMg
cGF0Y2ggY291bGQgYmUgZG9uZSBoZXJlLg0KDQo=
