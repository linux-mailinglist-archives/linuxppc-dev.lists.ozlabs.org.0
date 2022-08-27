Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2D55A397E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Aug 2022 20:33:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MFQMF66zNz3c2h
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Aug 2022 04:33:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=mm9RlCB2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.43; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=mm9RlCB2;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90043.outbound.protection.outlook.com [40.107.9.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MFQLS3jS6z30Ly
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Aug 2022 04:33:03 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LuJi9KT/1XCBmAQmN/OUddDDjaJDuri+NeZ4X2CF1pxmd3UaLzevGNS2KEVF5nm+Xl1PfXq2eOD5ei+mK6qACPMX0ByMJVkvaJAtFFrkzo0Az573xoRY5fVlnSL8uyKxlJIiBg7XCbwMKQhT38p5syrnYvJ6xFrC+iHrMMbQutWD4DoFQqculXKZAV/NbSk7RsCD2uy9UjidAehj7ABCnenpaN+i0D2TbFJEtwCbWEVJo3CMeJlUHfNBJ+5BtNBWXxGvU6MolCaVf/1E2qG5twBZpqVg8edc4MQnIg0+fz/op85JEafa73szvSG2+iVq9xSArncfnVUjcI6seuQ/dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KuDA/P0oX4uznOxbSZK5algcZmg7FpAlsdd3W+Xy/Oc=;
 b=TEbUSQYFN12melh5I9hM7KULjyJb6JXkJ/mvu0SAZj7PiNy+oi3N+JaubCGnmWdaZSiX7tDLhroIU54ZJNddUBibK7ig80kh0HQ+oOlk2yQYrtfyeq8LAKOWwRpmNr2I5tVTxIWZv8otggSygAzdVawbcLjvmn++EB787hj5amujGMVe002ozC8JNjh5vzgczgKx9lMBvfwSQn9dLNo/R/EZqApgqPBgnLnYoO1AnHPnPkPlFNW9xpXLQCOWsbyAwdtIxGDiF3bM5UJh8HlYtX0XWePj0qiavKqAAO0k5F2e5cqaJzUeRnR03L0YdpZutsnpMam9ue2bZ8yOxKqBFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KuDA/P0oX4uznOxbSZK5algcZmg7FpAlsdd3W+Xy/Oc=;
 b=mm9RlCB2pqddU3jI1R3qdpAtFTw8xaCqQeEBIEPh831VaUQ6dg7NzqW8XO0yzjUczeaEoZxo5SlBbdgt3HwJd+BWSPlJJCuSGB131+stnS4UI6wMnlRmMacP3lqoRk20TpNPDrUrgNmCznH7A9syqxQXpjllpWCjX5xu1CeBnGFbfnsoIPshY0tFundG3HWgen1KpvVV40cKOQA8HonEfVvqsMQsabptalsLEahdoPnJ+kuLB+dQocFfjegPeL+f5U7hv1n0Lb1ZrFgEdCkbCF988qgCvTHayUkZd2S0gcBCNhoB1MDT80dMtnklfkiU2XjkwpGEOxrPr4fh4/hhgQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB4260.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:42::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Sat, 27 Aug
 2022 18:32:42 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8%4]) with mapi id 15.20.5566.019; Sat, 27 Aug 2022
 18:32:42 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: =?utf-8?B?UGFsaSBSb2jDoXI=?= <pali@kernel.org>
Subject: Re: [PATCH v2] powerpc/boot: Don't always pass -mcpu=powerpc when
 building 32-bit uImage
Thread-Topic: [PATCH v2] powerpc/boot: Don't always pass -mcpu=powerpc when
 building 32-bit uImage
Thread-Index: AQHYuhp7k37dhRsWc063Etn2tgkb7a3DAWGAgAABZwCAAA/KgA==
Date: Sat, 27 Aug 2022 18:32:42 +0000
Message-ID: <1da78077-a050-a391-a002-9e25eabc89d1@csgroup.eu>
References: <20220820105200.30425-1-pali@kernel.org>
 <20220827133900.16634-1-pali@kernel.org>
 <63f4bce4-7965-9bc6-2104-42e26acd0208@csgroup.eu>
 <20220827173610.7bdp7zychwu2u5i6@pali>
In-Reply-To: <20220827173610.7bdp7zychwu2u5i6@pali>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 656a420c-4e3f-44da-6767-08da885a8786
x-ms-traffictypediagnostic: MR1P264MB4260:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  s5enI9xH1flFrLe/SE7V70RL2vb74IHnyy1T5OjWciiMfTprpjikNiARaEeo1AIRMjoEhQPMUwseCWwcIkx1hClDvlr7qjqjv0C31RC27kWwesTRkRDWipHkfAsBUWch6KeboGbH4Dq8LCjif299Rk2DoyaJ648D13GKcFUI75NRwXWdJTsQCQ7OSuIzCq9Zy0z3I9HcHisp1zrWBVN9bmQMs6KzyqxwTt4gJEHEApLLuhJJDNlIus4TZ3fTHEV5qwNagTbYTxCwg47puFjkCC8yr6fXq7ntsPSwJ3Xfdi/Xx7YEiyFDFVwLIk9Xp8k9byjj8v/Yap20INJCvTWFJUB5N/tJMTofWBpAEQQp7Edp7irqRhh39grbZkNbIGwtHW/apLgPrK301FbQQ3cWN3jieM5p0KZ9QQZ2QAdZHTZZdUiVK47gOxCtdnw/Djx/fm1XkhHXjdK5KGp1/WxaD3DCdXJRmAuga3Kd/4df0F5LxUnDO/+dzTMRpNygYjQ5o5T2nP3NBci/k7m3d7cUPTKWqhRKRPuJXefH71eJAzH6qCGPFGQMzGfiBuzOAqnWInps/kLjIOzgxp9DhtqZrI5NHjOcYIVREpF60o5zUW/gbp5s1LqeGZJonwh38GJQpYa7dzIOLoYjiSLMkdQK0+uhafW5ted4xfSj1RHWnc9lo77Y09c0MHcw7549p9PnQs3wjKcQ6db/HQ7Zlz9MNHt7r2aLNcAqUaCUt7wOY46V+tBlskMfYA3KNCW6NIhw5oJWJiJwxgUAT75Cd1mdqZuhaCXAbtrMdbaxmVVMLEaTdxRVvDgNRgFTGH3IkqW5IsyPa0pW3KFN9RPCcrqUUQ==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(39840400004)(346002)(366004)(396003)(66556008)(38070700005)(8676002)(4326008)(76116006)(66946007)(66476007)(66446008)(64756008)(91956017)(86362001)(122000001)(478600001)(31696002)(316002)(36756003)(38100700002)(31686004)(6486002)(26005)(186003)(6512007)(6506007)(41300700001)(71200400001)(54906003)(6916009)(2616005)(2906002)(44832011)(5660300002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?alg5cXVKc2c3Vno1eDhZY0hLQ2RPSlJsOVJkUkRHUU5EWW9Ldkg5RWNVSWlo?=
 =?utf-8?B?UlRjWWpkcWRwWlhpNHo5Z2xnbUQzWXphV3BuZUVjcGlEZUlYTkg5bmFUc1Bo?=
 =?utf-8?B?YitRTGJXM0lIaUtyRE53Y0ZzMGZjODJxbW1RZmROaEZ4WnptZGxEZkRIOWQw?=
 =?utf-8?B?cGlRMXE1V0ovY2k1MTYyci93OVlWV2RqdnlLUHZyVFJZSWpzNDJrL3JKcTFs?=
 =?utf-8?B?Yk1qQU4rejVyWVJOdmROdk9icVJXVkppRVFqdUE0TXdGSi9hSFZyY3ZmTHJC?=
 =?utf-8?B?dFg1cGlCRHJRd0puZ0djc3VqbnJFT2lLL1JTbXNHUGhlOHBqbS9WNlAvU0ds?=
 =?utf-8?B?QXpwSnF5Ylovc1N6NmFKM1hMWDVmZURERHVuQjZkQkY2dnV0cERuU0RoVmhO?=
 =?utf-8?B?YXVPOFZSL3pTUlgvT0tJTHV2RVhoNUN3SStvajB1Ty94UzMzQ3IrQ1hvMGJs?=
 =?utf-8?B?NWc0K2N4MldiczNkN3BrcEp6QVNxRm5PUkJwYStnM2FlRXg3b2lWZG9BclAr?=
 =?utf-8?B?UGFUMDFTZjVhcjJZanJ5RWI5cTRtRXpKcm9BZzN1NU1aZFA1WENobXN0QnR0?=
 =?utf-8?B?YXVKUU8zNkk4Q3FBK085UXZuQ1JHSDQwSHJpY0ZTT0pQcTZnbU9JalgrdVRN?=
 =?utf-8?B?UVFoWFBXbUxMVDgwVEdNSXpwSC9IdWJkamFtQ0hiTTBZdnE2a2ZYNVpFOFpV?=
 =?utf-8?B?aDlhSEE0L3BOZnV4b1dpQ0lZWjQzZ0VnbGMrV2N4NFRDVVpJYVEvd1lOVmdL?=
 =?utf-8?B?aTdhem4rbGR4bW42QlBIMkh6RHZwYlVIZklSZUhHVGs1cHhkVEJzUmFjbXBN?=
 =?utf-8?B?NG9FUnNzYnJxWUhuNGxFTmJaamZBN2t2bWVmNnZXcnhSY01DRGcvNENFNEh1?=
 =?utf-8?B?VllBVWd4VEZoQWc5Sk1US0NTRU1YeDBvUEc0RHN2bTdDYS8vWG1JTWFoekg2?=
 =?utf-8?B?SzlJZzBhWHNiQmpmVkZhMXBxL2dWdURaTUgvR0l3eEhGelpYWTJyeVZ5djZt?=
 =?utf-8?B?cmlpQXl3bWU2NG9RYXJnS1Z1a0RrYVJvZ1l2SEpia0hCUUt5TEFiUXpIMGxG?=
 =?utf-8?B?b0tjS1ZXazJtVlBKL2x0VUtHU2k0Z2Y5TlU0L2xLb1QrTHhCNlV1Z3lBTnpX?=
 =?utf-8?B?dkdWNXBwVEdCSEVGeFVndEd3a1FZQXVGVzY4WmJ4N1hML3A4U1A2Z0JRTXds?=
 =?utf-8?B?YmpUeWlzaS9zN1c4ZmgrUnJBazN3SjdnczF6dkRadzlFOStpU004WnpCWU5C?=
 =?utf-8?B?dXgzaVlOd3d1RVFDTmtqNmFFcHJnZnkwSHd4SS9rbFYwR2gxZjJIOWdjSG9a?=
 =?utf-8?B?R0pNRXEvRW5JdUhWZkFyVFRQRi9pdlNqSFJRd0wzNi9VdFZnVVFnTTlPeHpj?=
 =?utf-8?B?SEdZRzlpdm9yUDIzZkxwY0RreUJvb213REF3bk9waFcrb2k3ZjdDNW5WYnFV?=
 =?utf-8?B?aTRmaDhmQWhEQ3RldU5jNHk5MzFJWXRmbzE4OG9CKzN2MVEyeUJFem10cW84?=
 =?utf-8?B?ekUxdmthU21HWHl2YmFLYUFDZDhxYkUveUJYQ09mRkk5QzZtQkZJdmlUTkdK?=
 =?utf-8?B?L0F0a045RjdVU25mT0lSWHRGcWZBNWhJb0xUSy9TeVdPUGxaQlNEL1B6cW4x?=
 =?utf-8?B?Z1c3dGpxc0tOWHB5UldhdWVWc2pwWklYdnpUbkpudEZ0L3M4Umt5Wit6MGxZ?=
 =?utf-8?B?bkhhVzBmR3ZmaDRCNDkvaGJyTEcyYytMRGFHTWtzdnVudXFJWVRGNG1qWEZB?=
 =?utf-8?B?OHlzWHF5VWNxejFLc3ViZjR4aDNDVnFCbW1IbWhDeDlmdzI2TmN5cHZ5Vyt2?=
 =?utf-8?B?WkJ1WXkrUHlMZnpvNHdMMTlhcDJSQzgwd3VpU3o4N05SSTd4aDhjNktCQ0hz?=
 =?utf-8?B?NzFyelMwR0ZsaGdzOGNjcnZ5ak5XV3JxVlU3REJzSnN2Z25SZjJOUk9PVmlv?=
 =?utf-8?B?ZEVDOFF4dXM1UWRmSTR6WnlHeHZnMDRzSWVpMWRoOWN6QXl4aWRvUUs4WHF3?=
 =?utf-8?B?V0Rma0JuZXFXTzRMck83NitwNEVtUEE3RnZoRjQrV1ZyQU9LRGd2VkRoUjl6?=
 =?utf-8?B?OEltTDhqcTBISjVFYWdtNGYwNHpoWGdPRzQ5V1J2VDZyRWQrNU82VVhSa3pZ?=
 =?utf-8?B?SmVQNjFqdlVMOUU2QlZ5UFFITnlaNGlZZy9yNUh3MHBoQnpzSGlUMXBFWmhm?=
 =?utf-8?B?ZkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <ADD47712551BDD438C7388F4585D3FD5@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 656a420c-4e3f-44da-6767-08da885a8786
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2022 18:32:42.8044
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FfoajKVgbxAcOE67dzbrtPnjC2PBgaJZGMSCXQqFVqkuENmSlPEIhaxT/weHnQT29ZDmBjFD2i0u6hXdAZA3v2TPNx5+I34+PdEbQDSkL/Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB4260
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Paul Mackerras <paulus@samba.org>, Joel Stanley <joel@jms.id.au>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI3LzA4LzIwMjIgw6AgMTk6MzYsIFBhbGkgUm9ow6FyIGEgw6ljcml0wqA6DQo+IE9u
IFNhdHVyZGF5IDI3IEF1Z3VzdCAyMDIyIDE3OjMxOjEwIENocmlzdG9waGUgTGVyb3kgd3JvdGU6
DQo+PiBMZSAyNy8wOC8yMDIyIMOgIDE1OjM5LCBQYWxpIFJvaMOhciBhIMOpY3JpdMKgOg0KPj4+
IEZvciAzMi1iaXQgdUltYWdlIHRyeSB0byB1c2UgQ09ORklHX1RBUkdFVF9DUFUgb3B0aW9uIGZv
ciAtbWNwdS4gVGhpcyBmaXhlcw0KPj4+IGZvbGxvd2luZyBjb21waWxlciBlcnJvciB3aGVuIGJ1
aWxkaW5nIGtlcm5lbCB3aXRoIHBvd2VycGMgZTUwMCBTUEUgY2FwYWJsZQ0KPj4+IGNyb3NzIGNv
bXBpbGVyczoNCj4+Pg0KPj4+ICAgICAgIEJPT1RBUyAgYXJjaC9wb3dlcnBjL2Jvb3QvY3J0MC5v
DQo+Pj4gICAgIHBvd2VycGMtbGludXgtZ251c3BlLWdjYzogZXJyb3I6IHVucmVjb2duaXplZCBh
cmd1bWVudCBpbiBvcHRpb24g4oCYLW1jcHU9cG93ZXJwY+KAmQ0KPj4+ICAgICBwb3dlcnBjLWxp
bnV4LWdudXNwZS1nY2M6IG5vdGU6IHZhbGlkIGFyZ3VtZW50cyB0byDigJgtbWNwdT3igJkgYXJl
OiA4NTQwIDg1NDggbmF0aXZlDQo+Pj4gICAgIG1ha2VbMV06ICoqKiBbYXJjaC9wb3dlcnBjL2Jv
b3QvTWFrZWZpbGU6MjMxOiBhcmNoL3Bvd2VycGMvYm9vdC9jcnQwLm9dIEVycm9yIDENCj4+Pg0K
Pj4+IEZvciA2NC1iaXQgdUltYWdlIGFuZCA2NC1iaXQga2VybmVscyB3aXRoIDMyLWJpdCB1SW1h
Z2Ugd3JhcHBlciB0aGVyZSBpcyBubw0KPj4+IGNoYW5nZS4NCj4+Pg0KPj4+IFNpbWlsYXIgY2hh
bmdlIHdhcyBhbHJlYWR5IGludHJvZHVjZWQgZm9yIHRoZSBtYWluIHBvd2VycGMgTWFrZWZpbGUg
aW4NCj4+PiBjb21taXQgNDQ2Y2RhMWIyMWQ5ICgicG93ZXJwYy8zMjogRG9uJ3QgYWx3YXlzIHBh
c3MgLW1jcHU9cG93ZXJwYyB0byB0aGUNCj4+PiBjb21waWxlciIpLg0KPj4+DQo+Pj4gRml4ZXM6
IDQwYTc1NTg0ZTUyNiAoInBvd2VycGMvYm9vdDogQnVpbGQgd3JhcHBlciBmb3IgYW4gYXBwcm9w
cmlhdGUgQ1BVIikNCj4+PiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZw0KPj4+IFNpZ25lZC1v
ZmYtYnk6IFBhbGkgUm9ow6FyIDxwYWxpQGtlcm5lbC5vcmc+DQo+Pj4gLS0tDQo+Pj4gICAgYXJj
aC9wb3dlcnBjL2Jvb3QvTWFrZWZpbGUgfCA4ICsrKysrKysrDQo+Pj4gICAgMSBmaWxlIGNoYW5n
ZWQsIDggaW5zZXJ0aW9ucygrKQ0KPj4+DQo+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9i
b290L01ha2VmaWxlIGIvYXJjaC9wb3dlcnBjL2Jvb3QvTWFrZWZpbGUNCj4+PiBpbmRleCBhOWNk
MmVhNGE4NjEuLmY1NmE1ZjkwYTVkOCAxMDA2NDQNCj4+PiAtLS0gYS9hcmNoL3Bvd2VycGMvYm9v
dC9NYWtlZmlsZQ0KPj4+ICsrKyBiL2FyY2gvcG93ZXJwYy9ib290L01ha2VmaWxlDQo+Pj4gQEAg
LTQ0LDggKzQ0LDE2IEBAIGVsc2UNCj4+PiAgICBCT09UQ0ZMQUdTCSs9IC1tNjQgLW1jcHU9cG93
ZXJwYzY0DQo+Pj4gICAgZW5kaWYNCj4+PiAgICBlbHNlDQo+Pj4gK2lmZGVmIENPTkZJR19QUEMz
Mg0KPj4+ICtpZmRlZiBDT05GSUdfVEFSR0VUX0NQVV9CT09MDQo+Pj4gK0JPT1RDRkxBR1MJKz0g
LW0zMiAtbWNwdT0kKENPTkZJR19UQVJHRVRfQ1BVKQ0KPj4+ICtlbHNlDQo+Pj4gK0JPT1RDRkxB
R1MJKz0gLW0zMiAtbWNwdT1wb3dlcnBjDQo+Pg0KPj4gWW91IGNhbid0IGRvIHRoYXQuIFlvdSBn
ZXQgaGVyZSBvbmx5IGlmIHVzZXIgaGFzIHNlbGVjdGVkDQo+PiBUT09MQ0hBSU5fREVGQVVMVF9D
UFUsIGluIHdoaWNoIGNhc2UgeW91IGRvbid0IHdhbnQgdG8gZm9yIC1tY3B1PXBvd2VycGMuDQo+
IA0KPiBTbyBkbyBJIHVuZGVyc3RhbmQgaXQgY29ycmVjdGx5IHRoYXQgaW4gdGhpcyBicmFuY2gg
SSBzaG91bGQgb21pdCAtbWNwdT1wb3dlcnBjPw0KDQpDb3JyZWN0Lg0KDQo+IA0KPj4gLW1jcHU9
cG93ZXJwYyBpcyBzZXQgd2hlbiB1c2VyIHNlbGVjdHMgQ09ORklHX1BPV0VSUENfQ1BVLCBpbiB3
aGljaCBjYXNlDQo+PiBDT05GSUdfVEFSR0VUX0NQVV9CT09MIGlzIHNldCBhcyB3ZWxsLg0KPj4N
Cj4+PiArZW5kaWYNCj4+PiArZWxzZQ0KPj4+ICAgIEJPT1RDRkxBR1MJKz0gLW0zMiAtbWNwdT1w
b3dlcnBjDQo+Pg0KPj4gU2FtZSwgZm9yIFBQQzY0IEkgdGhpbmsgeW91IGRvbid0IHdhbnQgdGhh
dCBlaXRoZXIsIHVubGVzcyB0aGUNCj4+IENPTkZJR19HRU5FUklDX0NQVSBoYXMgYmVlbiBzZWxl
Y3RlZCBpbiB3aGljaCBjYXNlDQo+PiBDT05GSUdfVEFSR0VUX0NQVV9CT09MIGlzIG5vdCBzZXQu
DQo+Pg0KPj4gV2hlbiBDT05GSUdfVEFSR0VUX0NQVV9CT09MIGlzIHNldCBmb3IgUFBDNjQgeW91
IGFsc28gd2FudA0KPj4gLW1jcHU9JChDT05GSUdfVEFSR0VUX0NQVSkNCj4gDQo+IEkgdW5kZXJz
dGFuZCB0aGF0IHRoaXMgYnJhbmNoIGlzIGNhbGxlZCBmb3IgUFBDNjQgYnVpbGQgd2l0aCAzMi1i
aXQNCj4gdUltYWdlIHdyYXBwZXIuIFNvIGluIHRoaXMgY2FzZSBzaG91bGQgbm90IGJlIHVzZWQg
VEFSR0VUX0NQVSBhcyBpdA0KPiB3b3VsZCBiZSA2NC1iaXQgYW5kIG5vdCAzMi1iaXQgYXMgcmVx
dWl0ZWQgZm9yIDMyLWJpdCB1SW1hZ2Ugd3JhcHBlci4NCg0KV2h5ID8NCg0KLW1jcHU9ZTY1MDAg
LW0zMiB3b3JrcyBhcyBmYXIgYXMgSSBjYW4gc2VlLg0KDQo+IA0KPiBBbnl3YXksIGluIHRoaXMg
Y2hhbmdlIEknbSB0b3VjaGluZyBvbmx5IFBQQzMyIGJ1aWxkLCBzbyBhbGwgUFBDNjQgc3RheQ0K
PiBhcyBpdCB3YXMgYmVmb3JlLg0KPiANCj4+PiAgICBlbmRpZg0KPj4+ICtlbmRpZg0KPj4+ICAg
IA0KPj4+ICAgIEJPT1RDRkxBR1MJKz0gLWlzeXN0ZW0gJChzaGVsbCAkKEJPT1RDQykgLXByaW50
LWZpbGUtbmFtZT1pbmNsdWRlKQ0KPj4+ICAgIA==
