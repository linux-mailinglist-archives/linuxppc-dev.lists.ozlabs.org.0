Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4419066E092
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jan 2023 15:27:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxB780gHnz3bT8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 01:27:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=1mjNY72w;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.50; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=1mjNY72w;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on2050.outbound.protection.outlook.com [40.107.12.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxB5T3znLz3cd6
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 01:26:03 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OzmnzF3eUqHUPV2/smbnvSUSarrF6OmUO6zQ6k7Q3dzxJ9mJfcqixZK5uou9Po1mIErHNU5MGZhJQrklR67XpG/g/872e6r6wIYSqMTs2N9IASbMxsLyI9sS0CKWEXASY0ThnUObn6dYy24uQIBnskoiu261RS7YVxtdpakfbzZnl1IGNxM3tckno1Kkox9/MrhWVK4eSb3U52OkyS+/qGRgAmTGOijhzRCiU6uZmJyjTPZdvfGNq4CRDeaziQTGpKj/1mQapdDbZDQaYcS7/fpOVwFDuSafAzUntDpPzJ590Ir/VXnDuowqXGAvO/WYRoQuuG4581KvQTHYjIs7ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EGBFF6QE7XgMDCysLGfNpMyWtfMQo2NT5RAN4PytnUU=;
 b=LdSL+6wl51D9q8+HFn3673/isxaqXd215Avf76Iz8yM4X0rz1emlAl63qtrDT4YVoa7TX0/zEqW8cTFce9oY3jdrjSBKrzA0XrrPQGkOudLwKweGUj/2NV7+sXojzavxSnDYohkBha/RJZjmFopQZ4lbPtax8akZNHdEYuBXr3tHU3VgFt1Q1OWv6vgurx/ZoxEx8LRsExLNXJ2SYohcNCQbcfwE8XMsTBgx6GejWhDDzRfKTurbyhc8tSz3Da74Lh9JvJJ2msPTl5UR1MZ5NhMuWVvoxS2aRsPZI8Spf4664ZTuSoDv1guW81BKAitAfPWRFyq5TpDH0x/K/0FKbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EGBFF6QE7XgMDCysLGfNpMyWtfMQo2NT5RAN4PytnUU=;
 b=1mjNY72wTJALr8JsW5zhmYkuasdmU4lgAF5ZBU2vcE9nxaUFYHvocHuBFGKrEhjm4fLKhAU3QuH2J8scdaz1ceChHoul+AahX6C7g3RgTwxiJ/kzz6USP4+BWDGERX2PL0dBGshFXA5wey3k0VR/7EYOb7m9QGUi/SsfUEJYbQ3a+GZahRUpYuipBCh7FZN36HPeTeYjep3ggGUoOAFWNkz3oyXG0PwfSDX5Peed9xq2KYJ5zDLK6fSM8EPEFMnBLs4pVOTZkXNOVfhzjMDq28G+dtkoNaZAQybsAtcFT9yQNr6boxQu+KL6RqEYp3aW8G3OFfX8I26zpLOxipgLAw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB3379.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:2a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Tue, 17 Jan
 2023 14:25:43 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097%9]) with mapi id 15.20.5986.023; Tue, 17 Jan 2023
 14:25:43 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Tonghao Zhang <tong@infragraf.org>
Subject: Re: [bpf-next v2] bpf: drop deprecated bpf_jit_enable == 2
Thread-Topic: [bpf-next v2] bpf: drop deprecated bpf_jit_enable == 2
Thread-Index:  AQHZILjtdiBl24vDM0uhRRtlAlrCCa6QG7gAgAFsaoCABDtogIAMZLqAgAAhWICAAES8AIAALWIAgAAB/YA=
Date: Tue, 17 Jan 2023 14:25:43 +0000
Message-ID: <4ab9aafe-6436-b90d-5448-f74da22ddddb@csgroup.eu>
References: <20230105030614.26842-1-tong@infragraf.org>
 <ea7673e1-40ec-18be-af89-5f4fd0f71742@csgroup.eu>
 <71c83f39-f85f-d990-95b7-ab6068839e6c@iogearbox.net>
 <5836b464-290e-203f-00f2-fc6632c9f570@csgroup.eu>
 <147A796D-12C0-482F-B48A-16E67120622B@infragraf.org>
 <0b46b813-05f2-5083-9f2e-82d72970dae2@csgroup.eu>
 <0792068b-9aff-d658-5c7d-086e6d394c6c@csgroup.eu>
 <C811FC00-CE38-4227-B2E8-4CD8989D8B94@infragraf.org>
In-Reply-To: <C811FC00-CE38-4227-B2E8-4CD8989D8B94@infragraf.org>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB3379:EE_
x-ms-office365-filtering-correlation-id: 2ed18fbe-2213-4279-eb4e-08daf896b7a1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  HT7jrXlfQK+nQCMI0OBtVDuWXhlN+9Q28smxVwk7ty2FbiNNJ9ug8u7ctvENMHgA775/dlJ+HHDTUFEYiPyaAyU3tsyfE/kpJbjOJEr1My24P5417FGrW/0B4GOjEZog0IPBGMdb/SEj+AG9ZJLKV9y2qfqkf6L08q9oO81qdNQuaJI3KdDlc5GKSogpUw3gDK6/clUJEmGSB048LDITmFZgBBCc6espR45s9tM+1KXqSQl5wpAPO2GRVRh5EWUb3+Lbc9BKgvIUF9JNjoThJYT1cTrXAePsTgCP1M0RuRbArmGiZQY23HBxd+d+QPXz8HAVUg1bQptjDj14KyYEOnTJcnDL9MCf7iT0Tx2epz5ITQBZFPUIAKm7KK5m7CSC1IGpjlDB2m/yZBeJzRB7j0MaS/bTX4nTyjvUMcIYjuZ9YoH6h7xgissPWvlFRIfn3mcLH4tqO1NuRAVuY5DYDOQH6QjCLEB5+9yS/1LM+pXVBIrbap9wxlTZi38k0fjbDvHMjFAH/g2W5QUtjumfJ0OBdStgQKc47/P19ntnbqYiFjGiIDJkpdIB17lD//+5Kv3PfwaxB0lfxOaH7k07uUPQHNGRe1nNieYBCK2L8bXc7KLn3ARm4Gbah+k/4mA2B6y/qCW7AcqXvCLKXf77Ow0qqUFvB4lLnZd9xjESoabbVE90xx4Ln/QInGO6tvGeidB0znmbGaDR58FYrFnDlNLmOoLBIUaQOsHkFNe8EhlGVznSO2F4eHXBNauDIBKGrleOzH047EcsPkea4T9gpgJ4g/hxkT5vJD3XWaQYVKA=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(136003)(396003)(39850400004)(366004)(451199015)(83380400001)(38100700002)(5660300002)(122000001)(38070700005)(6916009)(86362001)(2906002)(7416002)(4326008)(76116006)(31696002)(8936002)(66556008)(66946007)(64756008)(44832011)(8676002)(66476007)(66446008)(91956017)(478600001)(66574015)(6506007)(186003)(53546011)(26005)(2616005)(6512007)(6486002)(54906003)(316002)(71200400001)(966005)(41300700001)(31686004)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?bG4xdkZGQkZNK05EUEhrcHNWN2g1S2twSlFEK2pNeGZCNkhZRkpmeEJKbXNL?=
 =?utf-8?B?aWI1bGh0WUU4M0NkTWJ4Vm1tMk1la3RjQ1VENTFXU0tJcXZMdmoxRWJWRlVG?=
 =?utf-8?B?RU1kNnc2UTZSSDRHSDZQZFh3NUpRWE9JWVlabllqSEtSTFJ6Q21GbHVlbHV0?=
 =?utf-8?B?aXJKS1VxZFVkaUJvYVR4V2dRWVdNSXZLOWF4UXdFZXBLT2lzd2tWbnQyT0Na?=
 =?utf-8?B?TGJudGVTVFFHOGxEdU5tNHE1RDNBMDdDUGZoOUZGamVXTHR5bHYrYlE3WFVx?=
 =?utf-8?B?UkVlWk1QVHZERXpLNlJSdndQKzVBZUg3U2w3dlN0dnRtTWJXdVVLTUMzT0ow?=
 =?utf-8?B?T3BJNUN5U2JjVFNITFpzZmpRT2I0UEoxL3JFWEl6YVVQZC9FaUlzMkFIMUov?=
 =?utf-8?B?NGxpc2RSc3VhVW44MmoxZUhwQmtsVU05K0pYNFg4QkJGTnFNSW03UWs0bDkr?=
 =?utf-8?B?cTZUcEJ4K2RLbGpldmVhRzlNY1VaR2czeGp2V0IvNzJWblZUc3NxajhrUU92?=
 =?utf-8?B?ZjRKenExelFYd2VRSndTcjBUOUIvN2ZnWWNNUXhIcFdqbHdmYzcwOC95RHNP?=
 =?utf-8?B?UCtmeW13Sm9BdUY3L0xvWmFaVjBIV0xuVnZiTk4yS0x0Q1B5cU13YVZYTC9p?=
 =?utf-8?B?SWtDdktRMDVFYk5lK0tpRzBseVlwei81bkxnYk9Ja3pPWEdwVjVIdGpNSWFZ?=
 =?utf-8?B?MmlvZU5RalpubmNNWVRDaDkvZlZ4NUdHeXhheEZRczlCZTI2N2ZTZUxFZDE0?=
 =?utf-8?B?OG9JY0p1OTFLUGpvYnA5RWZFRGl1TTZLcnYweTV3Z1VkbnYwWUdPSWhlRmZa?=
 =?utf-8?B?c1dBdEhzUC9tZnB6SUVWN1VJVUpNVTNBdTV6TUozK0hMRzJHdWlxTWcwckFD?=
 =?utf-8?B?NHk4dVBvTE1hNnlGMVd2SFROOHA5TFRkQmNZdFg4TmoyN1hnREM2QWdYbGpi?=
 =?utf-8?B?SzY4cHkrVjBHV014eWFBSExRRndnbVA2SG5RUzFQYmptRDlMcXVKNmlQWTVC?=
 =?utf-8?B?dEdZYWNocEw0SCtXQzRQN09iQ0xiZUZuWHduMytURUxMVlNFOWNPMHJBNWJB?=
 =?utf-8?B?ODFzdzI0azBMd0g1dk84c0VIcDNNVEpNY2VnR3RKVXI4TjkwcWxwMFdLYmNj?=
 =?utf-8?B?eFJaQURGeHJBQldFTWZ2OStENWtmRzJtaDlzWEdyOGpEUy9HUnhSZWVFYWsy?=
 =?utf-8?B?UDhIdlBoZDV1U1ZOdTl2K2c2NWtTUFZYTTdVcWpRWmx6c2RuS3dPTDFxcXFT?=
 =?utf-8?B?RW5QSFNuZ0JqNXExc2dBeU5LZ1lOL3JhNjNWZTR0VHE4d001T29hcElpbFZJ?=
 =?utf-8?B?OVVhRWV6RG1mZGJETGg5SzIwZlR2eGJCREszOXovOERuekMyZTl3ck85dlBi?=
 =?utf-8?B?NnpTM3hNNVJZOUVUcVQxZVpCSUpueHppaHg0L1UrL01ndlBXWXpOUkZIRnVV?=
 =?utf-8?B?K0hCcU9mZjY5VVF3MjlyR3kyUFZKdkdSZmJlQmU1TUhSd2luZkFMVVVmSWtF?=
 =?utf-8?B?czBudUF3cEdNanU5d1lObUsrUkREb0o0Q3JQckRlcWJlOFhQNkRKcEdTTlhu?=
 =?utf-8?B?aDRYYlp0RUt0YWxSd3dMME83aGNVYWpNRFhmUVgrSXAyUVYzQkozRDV4bllp?=
 =?utf-8?B?bWFYQzFmejcza3RYQ0ZQOUNVQXlpWnBtTzlYci9BUlNCWHNhMlQvL0NpbWxK?=
 =?utf-8?B?b1FOdXh5WU1hUDhZbkdKbm5vU2NIekRiQTNuMDczeXJnNGYzaUQ0dFppRjBJ?=
 =?utf-8?B?bi9PQkkvZGtjS1JMS01DbTJJZlY2cU02WjlDRWJ2ZFpzZDJZNVYwSkVhVkZy?=
 =?utf-8?B?eEhEb0tFUE1sd3VnQ25rZ0RlNkM0UFlKQktUaHdsUE5jdmlTU0p6Uks5WFVo?=
 =?utf-8?B?UG9mUGxGNnNjZlBMTnhsZmhpV3E3VUlaNXRhbVppb2dTZnMwMkJWV1ZENE9L?=
 =?utf-8?B?Z3prWGwzNGdUek81ZlUyTjQzSE8yZFloNU9lNEZwNzN2SmFtbkFzbWw1QVFD?=
 =?utf-8?B?QlFCZktwZ0ZYYmRucE5KMnFjLy8rZCtzMnR0VHdzZWgzbWgwdzZCTW1xR1U5?=
 =?utf-8?B?OGl3dHQ4S3VtK3J0NENiUER1QXVobHIwWVF0aTE4dklLdUR6TFhrNGM0azVo?=
 =?utf-8?B?b0UxNTdCVHI1US9nWGxKd21qMlMrY0tIT3R5bEFMYjlNSWxWS0FJZHh3WFJZ?=
 =?utf-8?B?NVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <95C28506C0FB1C46B4048301A19AED49@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ed18fbe-2213-4279-eb4e-08daf896b7a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2023 14:25:43.5658
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JG6koJIWBggQxJ0zVKJ/6fKspG0rkU5iRX+jcI2mtBsmlHPHLiHN8yvI4soO+ftGk2oyndFoPFrFFH6mCfy4zAihXuSJXtFSiXxJMaeNw1k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB3379
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
Cc: Alexei Starovoitov <ast@kernel.org>, Song Liu <song@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hou Tao <houtao1@huawei.com>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>, "naveen.n.rao@linux.ibm.com" <naveen.n.rao@linux.ibm.com>, Yonghong Song <yhs@fb.com>, "linux-arm-kernel@lists.infradead.or" <linux-arm-kernel@lists.infradead.or>, KP Singh <kpsingh@kernel.org>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, Hao Luo <haoluo@google.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Jiri Olsa <jolsa@kernel.org>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@li
 sts.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE3LzAxLzIwMjMgw6AgMTU6MTgsIFRvbmdoYW8gWmhhbmcgYSDDqWNyaXTCoDoNCj4g
DQo+IA0KPj4gT24gSmFuIDE3LCAyMDIzLCBhdCA3OjM2IFBNLCBDaHJpc3RvcGhlIExlcm95IDxj
aHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+IHdyb3RlOg0KPj4NCj4+DQo+Pg0KPj4gTGUgMTcv
MDEvMjAyMyDDoCAwODozMCwgQ2hyaXN0b3BoZSBMZXJveSBhIMOpY3JpdCA6DQo+Pj4NCj4+Pg0K
Pj4+IExlIDE3LzAxLzIwMjMgw6AgMDY6MzAsIFRvbmdoYW8gWmhhbmcgYSDDqWNyaXQgOg0KPj4+
Pg0KPj4+Pg0KPj4+Pj4gT24gSmFuIDksIDIwMjMsIGF0IDQ6MTUgUE0sIENocmlzdG9waGUgTGVy
b3kNCj4+Pj4+IDxjaHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+IHdyb3RlOg0KPj4+Pj4NCj4+
Pj4+DQo+Pj4+Pg0KPj4+Pj4gTGUgMDYvMDEvMjAyMyDDoCAxNjozNywgRGFuaWVsIEJvcmttYW5u
IGEgw6ljcml0IDoNCj4+Pj4+PiBPbiAxLzUvMjMgNjo1MyBQTSwgQ2hyaXN0b3BoZSBMZXJveSB3
cm90ZToNCj4+Pj4+Pj4gTGUgMDUvMDEvMjAyMyDDoCAwNDowNiwgdG9uZ0BpbmZyYWdyYWYub3Jn
IGEgw6ljcml0IDoNCj4+Pj4+Pj4+IEZyb206IFRvbmdoYW8gWmhhbmcgPHRvbmdAaW5mcmFncmFm
Lm9yZz4NCj4+Pj4+Pj4+DQo+Pj4+Pj4+PiBUaGUgeDg2XzY0IGNhbid0IGR1bXAgdGhlIHZhbGlk
IGluc24gaW4gdGhpcyB3YXkuIEEgdGVzdCBCUEYgcHJvZw0KPj4+Pj4+Pj4gd2hpY2ggaW5jbHVk
ZSBzdWJwcm9nOg0KPj4+Pj4+Pj4NCj4+Pj4+Pj4+ICQgbGx2bS1vYmpkdW1wIC1kIHN1YnByb2cu
bw0KPj4+Pj4+Pj4gRGlzYXNzZW1ibHkgb2Ygc2VjdGlvbiAudGV4dDoNCj4+Pj4+Pj4+IDAwMDAw
MDAwMDAwMDAwMDAgPHN1YnByb2c+Og0KPj4+Pj4+Pj4gICAgICAgICAgICAwOiAgICAgICAxOCAw
MSAwMCAwMCA3MyA3NSA2MiA3MCAwMCAwMCAwMCAwMCA3MiA2ZiA2NyAwMCByMQ0KPj4+Pj4+Pj4g
PSAyOTExNDQ1OTkwMzY1MzIzNSBsbA0KPj4+Pj4+Pj4gICAgICAgICAgICAyOiAgICAgICA3YiAx
YSBmOCBmZiAwMCAwMCAwMCAwMCAqKHU2NCAqKShyMTAgLSA4KSA9IHIxDQo+Pj4+Pj4+PiAgICAg
ICAgICAgIDM6ICAgICAgIGJmIGExIDAwIDAwIDAwIDAwIDAwIDAwIHIxID0gcjEwDQo+Pj4+Pj4+
PiAgICAgICAgICAgIDQ6ICAgICAgIDA3IDAxIDAwIDAwIGY4IGZmIGZmIGZmIHIxICs9IC04DQo+
Pj4+Pj4+PiAgICAgICAgICAgIDU6ICAgICAgIGI3IDAyIDAwIDAwIDA4IDAwIDAwIDAwIHIyID0g
OA0KPj4+Pj4+Pj4gICAgICAgICAgICA2OiAgICAgICA4NSAwMCAwMCAwMCAwNiAwMCAwMCAwMCBj
YWxsIDYNCj4+Pj4+Pj4+ICAgICAgICAgICAgNzogICAgICAgOTUgMDAgMDAgMDAgMDAgMDAgMDAg
MDAgZXhpdA0KPj4+Pj4+Pj4gRGlzYXNzZW1ibHkgb2Ygc2VjdGlvbiByYXdfdHAvc3lzX2VudGVy
Og0KPj4+Pj4+Pj4gMDAwMDAwMDAwMDAwMDAwMCA8ZW50cnk+Og0KPj4+Pj4+Pj4gICAgICAgICAg
ICAwOiAgICAgICA4NSAxMCAwMCAwMCBmZiBmZiBmZiBmZiBjYWxsIC0xDQo+Pj4+Pj4+PiAgICAg
ICAgICAgIDE6ICAgICAgIGI3IDAwIDAwIDAwIDAwIDAwIDAwIDAwIHIwID0gMA0KPj4+Pj4+Pj4g
ICAgICAgICAgICAyOiAgICAgICA5NSAwMCAwMCAwMCAwMCAwMCAwMCAwMCBleGl0DQo+Pj4+Pj4+
Pg0KPj4+Pj4+Pj4ga2VybmVsIHByaW50IG1lc3NhZ2U6DQo+Pj4+Pj4+PiBbICA1ODAuNzc1Mzg3
XSBmbGVuPTggcHJvZ2xlbj01MSBwYXNzPTMgaW1hZ2U9ZmZmZmZmZmZhMDAwYzIwYw0KPj4+Pj4+
Pj4gZnJvbT1rcHJvYmUtbG9hZCBwaWQ9MTY0Mw0KPj4+Pj4+Pj4gWyAgNTgwLjc3NzIzNl0gSklU
IGNvZGU6IDAwMDAwMDAwOiBjYyBjYyBjYyBjYyBjYyBjYyBjYyBjYyBjYyBjYyBjYw0KPj4+Pj4+
Pj4gY2MgY2MgY2MgY2MgY2MNCj4+Pj4+Pj4+IFsgIDU4MC43NzkwMzddIEpJVCBjb2RlOiAwMDAw
MDAxMDogY2MgY2MgY2MgY2MgY2MgY2MgY2MgY2MgY2MgY2MgY2MNCj4+Pj4+Pj4+IGNjIGNjIGNj
IGNjIGNjDQo+Pj4+Pj4+PiBbICA1ODAuNzgwNzY3XSBKSVQgY29kZTogMDAwMDAwMjA6IGNjIGNj
IGNjIGNjIGNjIGNjIGNjIGNjIGNjIGNjIGNjDQo+Pj4+Pj4+PiBjYyBjYyBjYyBjYyBjYw0KPj4+
Pj4+Pj4gWyAgNTgwLjc4MjU2OF0gSklUIGNvZGU6IDAwMDAwMDMwOiBjYyBjYyBjYw0KPj4+Pj4+
Pj4NCj4+Pj4+Pj4+ICQgYnBmX2ppdF9kaXNhc20NCj4+Pj4+Pj4+IDUxIGJ5dGVzIGVtaXR0ZWQg
ZnJvbSBKSVQgY29tcGlsZXIgKHBhc3M6MywgZmxlbjo4KQ0KPj4+Pj4+Pj4gZmZmZmZmZmZhMDAw
YzIwYyArIDx4PjoNCj4+Pj4+Pj4+ICAgICAgICAwOiAgIGludDMNCj4+Pj4+Pj4+ICAgICAgICAx
OiAgIGludDMNCj4+Pj4+Pj4+ICAgICAgICAyOiAgIGludDMNCj4+Pj4+Pj4+ICAgICAgICAzOiAg
IGludDMNCj4+Pj4+Pj4+ICAgICAgICA0OiAgIGludDMNCj4+Pj4+Pj4+ICAgICAgICA1OiAgIGlu
dDMNCj4+Pj4+Pj4+ICAgICAgICAuLi4NCj4+Pj4+Pj4+DQo+Pj4+Pj4+PiBVbnRpbCBicGZfaml0
X2JpbmFyeV9wYWNrX2ZpbmFsaXplIGlzIGludm9rZWQsIHdlIGNvcHkgcndfaGVhZGVyIHRvDQo+
Pj4+Pj4+PiBoZWFkZXINCj4+Pj4+Pj4+IGFuZCB0aGVuIGltYWdlL2luc24gaXMgdmFsaWQuIEJU
Vywgd2UgY2FuIHVzZSB0aGUgImJwZnRvb2wgcHJvZyBkdW1wIg0KPj4+Pj4+Pj4gSklUZWQgaW5z
dHJ1Y3Rpb25zLg0KPj4+Pj4+Pg0KPj4+Pj4+PiBOQUNLLg0KPj4+Pj4+Pg0KPj4+Pj4+PiBCZWNh
dXNlIHRoZSBmZWF0dXJlIGlzIGJ1Z2d5IG9uIHg4Nl82NCwgeW91IHJlbW92ZSBpdCBmb3IgYWxs
DQo+Pj4+Pj4+IGFyY2hpdGVjdHVyZXMgPw0KPj4+Pj4+Pg0KPj4+Pj4+PiBPbiBwb3dlcnBjIGJw
Zl9qaXRfZW5hYmxlID09IDIgd29ya3MgYW5kIGlzIHZlcnkgdXNlZnVsbC4NCj4+Pj4+Pj4NCj4+
Pj4+Pj4gTGFzdCB0aW1lIEkgdHJpZWQgdG8gdXNlIGJwZnRvb2wgb24gcG93ZXJwYy8zMiBpdCBk
aWRuJ3Qgd29yay4gSSBkb24ndA0KPj4+Pj4+PiByZW1lbWJlciB0aGUgZGV0YWlscywgSSB0aGlu
ayBpdCB3YXMgYW4gaXNzdWUgd2l0aCBlbmRpYW5lc3MuIE1heWJlIGl0DQo+Pj4+Pj4+IGlzIGZp
eGVkIG5vdywgYnV0IGl0IG5lZWRzIHRvIGJlIHZlcmlmaWVkLg0KPj4+Pj4+Pg0KPj4+Pj4+PiBT
byBwbGVhc2UsIGJlZm9yZSByZW1vdmluZyBhIHdvcmtpbmcgYW5kIHVzZWZ1bGwgZmVhdHVyZSwg
bWFrZSBzdXJlDQo+Pj4+Pj4+IHRoZXJlIGlzIGFuIGFsdGVybmF0aXZlIGF2YWlsYWJsZSB0byBp
dCBmb3IgYWxsIGFyY2hpdGVjdHVyZXMgaW4gYWxsDQo+Pj4+Pj4+IGNvbmZpZ3VyYXRpb25zLg0K
Pj4+Pj4+Pg0KPj4+Pj4+PiBBbHNvLCBJIGRvbid0IHRoaW5rIGJwZnRvb2wgaXMgdXNhYmxlIHRv
IGR1bXAga2VybmVsIEJQRiBzZWxmdGVzdHMuDQo+Pj4+Pj4+IFRoYXQncyB2aXRhbCB3aGVuIGEg
c2VsZnRlc3QgZmFpbHMgaWYgeW91IHdhbnQgdG8gaGF2ZSBhIGNoYW5jZSB0bw0KPj4+Pj4+PiB1
bmRlcnN0YW5kIHdoeSBpdCBmYWlscy4NCj4+Pj4+Pg0KPj4+Pj4+IElmIHRoaXMgaXMgYWN0aXZl
bHkgdXNlZCBieSBKSVQgZGV2ZWxvcGVycyBhbmQgY29uc2lkZXJlZCB1c2VmdWwsDQo+Pj4+Pj4g
SSdkIGJlDQo+Pj4+Pj4gb2sgdG8gbGVhdmUgaXQgZm9yIHRoZSB0aW1lIGJlaW5nLiBPdmVyYWxs
IGdvYWwgaXMgdG8gcmVhY2ggZmVhdHVyZQ0KPj4+Pj4+IHBhcml0eQ0KPj4+Pj4+IGFtb25nIChh
dCBsZWFzdCBtYWpvciBhcmNoKSBKSVRzIGFuZCBub3QganVzdCBoYXZlIG1vc3QNCj4+Pj4+PiBm
dW5jdGlvbmFsaXR5IG9ubHkNCj4+Pj4+PiBhdmFpbGFibGUgb24geDg2LTY0IEpJVC4gQ291bGQg
eW91IGhvd2V2ZXIgY2hlY2sgd2hhdCBpcyBub3Qgd29ya2luZw0KPj4+Pj4+IHdpdGgNCj4+Pj4+
PiBicGZ0b29sIG9uIHBvd2VycGMvMzI/IFBlcmhhcHMgaXQncyBub3QgdG9vIG11Y2ggZWZmb3J0
IHRvIGp1c3QgZml4IGl0LA0KPj4+Pj4+IGJ1dCBkZXRhaWxzIHdvdWxkIGJlIHVzZWZ1bCBvdGhl
cndpc2UgJ2l0IGRpZG4ndCB3b3JrJyBpcyB0b28gZnV6enkuDQo+Pj4+Pg0KPj4+Pj4gU3VyZSBJ
IHdpbGwgdHJ5IHRvIHRlc3QgYnBmdG9vbCBhZ2FpbiBpbiB0aGUgY29taW5nIGRheXMuDQo+Pj4+
Pg0KPj4+Pj4gUHJldmlvdXMgZGlzY3Vzc2lvbiBhYm91dCB0aGF0IHN1YmplY3QgaXMgaGVyZToN
Cj4+Pj4+IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1yaXNjdi9w
YXRjaC8yMDIxMDQxNTA5MzI1MC4zMzkxMjU3LTEtSmlhbmxpbi5MdkBhcm0uY29tLyMyNDE3Njg0
Nz0NCj4+Pj4gSGkgQ2hyaXN0b3BoZQ0KPj4+PiBBbnkgcHJvZ3Jlc3M/IFdlIGRpc2N1c3MgdG8g
ZGVwcmVjYXRlIHRoZSBicGZfaml0X2VuYWJsZSA9PSAyIGluIDIwMjEsDQo+Pj4+IGJ1dCBicGZ0
b29sIGNhbiBub3QgcnVuIG9uIHBvd2VycGMuDQo+Pj4+IE5vdyBjYW4gd2UgZml4IHRoaXMgaXNz
dWU/DQo+Pj4NCj4+PiBIaSBUb25nLA0KPj4+DQo+Pj4gSSBoYXZlIHN0YXJ0ZWQgdG8gbG9vayBh
dCBpdCBidXQgSSBkb24ndCBoYXZlIGFueSBmcnVpdGZ1bGwgZmVlZGJhY2sgeWV0Lg0KPj4NCj4+
IEhpIEFnYWluLA0KPj4NCj4+IEkgdGVzdGVkIGFnYWluLCB0aGUgcHJvYmxlbSBpcyBzdGlsbCB0
aGUgc2FtZSBhcyBvbmUgeWVhciBhZ286DQo+Pg0KPj4gcm9vdEB2Z29pcDp+IyAuL2JwZnRvb2wg
cHJvZw0KPj4gbGliYnBmOiBlbGY6IGVuZGlhbm5lc3MgbWlzbWF0Y2ggaW4gcGlkX2l0ZXJfYnBm
Lg0KPiBJdCBzZWVtIHRvIGJlIG5vdCByaWdodCBlaGRyLT5lX2lkZW50W0VJX0RBVEFdLiBEbyB3
ZSBjYW4gcHJpbnQgdGhlIHJlYWwgdmFsdWU/DQo+IC8qDQo+ICAgKiBlX2lkZW50W0VJX0RBVEFd
DQo+ICAgKi8NCj4gI2RlZmluZSBFTEZEQVRBTk9ORSAgICAgMA0KPiAjZGVmaW5lIEVMRkRBVEEy
TFNCICAgICAxDQo+ICNkZWZpbmUgRUxGREFUQTJNU0IgICAgIDINCj4gI2RlZmluZSBFTEZEQVRB
TlVNICAgICAgMw0KPiANCj4gYnBmX29iamVjdF9fZWxmX2luaXQ6DQo+IG9iai0+ZWZpbGUuZWhk
ciA9IGVoZHIgPSBlbGY2NF9nZXRlaGRyKGVsZik7DQo+IA0KPj4gbGliYnBmOiBmYWlsZWQgdG8g
aW5pdGlhbGl6ZSBza2VsZXRvbiBCUEYgb2JqZWN0ICdwaWRfaXRlcl9icGYnOiAtNDAwMw0KPj4g
RXJyb3I6IGZhaWxlZCB0byBvcGVuIFBJRCBpdGVyYXRvciBza2VsZXRvbg0KPj4NCj4+IHJvb3RA
dmdvaXA6fiMgdW5hbWUgLWENCj4+IExpbnV4IHZnb2lwIDYuMi4wLXJjMy0wMjU5Ni1nMWMyYzlj
MTNlMjU2ICMyNDIgUFJFRU1QVCBUdWUgSmFuIDE3DQo+PiAwOTozNjowOCBDRVQgMjAyMyBwcGMg
R05VL0xpbnV4DQo+IE9uIG15IHBjLCBlbGYgaXMgbGl0dGxlIGVuZGlhbi4NCj4gIyByZWFkZWxm
IC1oIHRvb2xzL2JwZi9icGZ0b29sL3BpZF9pdGVyLmJwZi5vDQo+IEVMRiBIZWFkZXI6DQo+ICAg
IE1hZ2ljOiAgIDdmIDQ1IDRjIDQ2IDAyIDAxIDAxIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAw
DQo+ICAgIENsYXNzOiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRUxGNjQNCj4gICAgRGF0
YTogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAyJ3MgY29tcGxlbWVudCwgbGl0dGxlIGVu
ZGlhbiAjIHg4Nl82NA0KPiAgICBWZXJzaW9uOiAgICAgICAgICAgICAgICAgICAgICAgICAgIDEg
KGN1cnJlbnQpDQo+ICAgIE9TL0FCSTogICAgICAgICAgICAgICAgICAgICAgICAgICAgVU5JWCAt
IFN5c3RlbSBWDQo+ICAgIEFCSSBWZXJzaW9uOiAgICAgICAgICAgICAgICAgICAgICAgMA0KPiAg
ICBUeXBlOiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFJFTCAoUmVsb2NhdGFibGUgZmls
ZSkNCj4gICAgTWFjaGluZTogICAgICAgICAgICAgICAgICAgICAgICAgICBMaW51eCBCUEYNCj4g
ICAgVmVyc2lvbjogICAgICAgICAgICAgICAgICAgICAgICAgICAweDENCj4gICAgRW50cnkgcG9p
bnQgYWRkcmVzczogICAgICAgICAgICAgICAweDANCj4gICAgU3RhcnQgb2YgcHJvZ3JhbSBoZWFk
ZXJzOiAgICAgICAgICAwIChieXRlcyBpbnRvIGZpbGUpDQo+ICAgIFN0YXJ0IG9mIHNlY3Rpb24g
aGVhZGVyczogICAgICAgICAgNjQ4MzIgKGJ5dGVzIGludG8gZmlsZSkNCj4gICAgRmxhZ3M6ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAweDANCj4gICAgU2l6ZSBvZiB0aGlzIGhlYWRlcjog
ICAgICAgICAgICAgICA2NCAoYnl0ZXMpDQo+ICAgIFNpemUgb2YgcHJvZ3JhbSBoZWFkZXJzOiAg
ICAgICAgICAgMCAoYnl0ZXMpDQo+ICAgIE51bWJlciBvZiBwcm9ncmFtIGhlYWRlcnM6ICAgICAg
ICAgMA0KPiAgICBTaXplIG9mIHNlY3Rpb24gaGVhZGVyczogICAgICAgICAgIDY0IChieXRlcykN
Cj4gICAgTnVtYmVyIG9mIHNlY3Rpb24gaGVhZGVyczogICAgICAgICAxMw0KPiAgICBTZWN0aW9u
IGhlYWRlciBzdHJpbmcgdGFibGUgaW5kZXg6IDENCj4gDQoNClllcywgbXVzdCBiZSBzb21ldGhp
bmcgd3Jvbmcgd2l0aCB0aGUgYnVpbGQsIEkgZ2V0IHNhbWUgYXMgeW91IDoNCg0KJCBMQU5HPSBy
ZWFkZWxmIC1oIHBpZF9pdGVyLmJwZi5vDQpFTEYgSGVhZGVyOg0KICAgTWFnaWM6ICAgN2YgNDUg
NGMgNDYgMDIgMDEgMDEgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDANCiAgIENsYXNzOiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgRUxGNjQNCiAgIERhdGE6ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgMidzIGNvbXBsZW1lbnQsIGxpdHRsZSBlbmRpYW4NCiAgIFZlcnNpb246ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgMSAoY3VycmVudCkNCiAgIE9TL0FCSTogICAgICAgICAg
ICAgICAgICAgICAgICAgICAgVU5JWCAtIFN5c3RlbSBWDQogICBBQkkgVmVyc2lvbjogICAgICAg
ICAgICAgICAgICAgICAgIDANCiAgIFR5cGU6ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
UkVMIChSZWxvY2F0YWJsZSBmaWxlKQ0KICAgTWFjaGluZTogICAgICAgICAgICAgICAgICAgICAg
ICAgICBMaW51eCBCUEYNCiAgIFZlcnNpb246ICAgICAgICAgICAgICAgICAgICAgICAgICAgMHgx
DQogICBFbnRyeSBwb2ludCBhZGRyZXNzOiAgICAgICAgICAgICAgIDB4MA0KICAgU3RhcnQgb2Yg
cHJvZ3JhbSBoZWFkZXJzOiAgICAgICAgICAwIChieXRlcyBpbnRvIGZpbGUpDQogICBTdGFydCBv
ZiBzZWN0aW9uIGhlYWRlcnM6ICAgICAgICAgIDM0NzA0IChieXRlcyBpbnRvIGZpbGUpDQogICBG
bGFnczogICAgICAgICAgICAgICAgICAgICAgICAgICAgIDB4MA0KICAgU2l6ZSBvZiB0aGlzIGhl
YWRlcjogICAgICAgICAgICAgICA2NCAoYnl0ZXMpDQogICBTaXplIG9mIHByb2dyYW0gaGVhZGVy
czogICAgICAgICAgIDAgKGJ5dGVzKQ0KICAgTnVtYmVyIG9mIHByb2dyYW0gaGVhZGVyczogICAg
ICAgICAwDQogICBTaXplIG9mIHNlY3Rpb24gaGVhZGVyczogICAgICAgICAgIDY0IChieXRlcykN
CiAgIE51bWJlciBvZiBzZWN0aW9uIGhlYWRlcnM6ICAgICAgICAgMTMNCiAgIFNlY3Rpb24gaGVh
ZGVyIHN0cmluZyB0YWJsZSBpbmRleDogMQ0KDQoNCldoZXJlYXMgSSBleHBlY3QgdGhlIHNhbWUg
YXMgYnBmdG9vbCBJIHN1cHBvc2UsIHdoaWNoIGlzIDoNCg0KJCBMQU5HPSByZWFkZWxmIC1oIGJw
ZnRvb2wNCkVMRiBIZWFkZXI6DQogICBNYWdpYzogICA3ZiA0NSA0YyA0NiAwMSAwMiAwMSAwMCAw
MCAwMCAwMCAwMCAwMCAwMCAwMCAwMA0KICAgQ2xhc3M6ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBFTEYzMg0KICAgRGF0YTogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAyJ3MgY29t
cGxlbWVudCwgYmlnIGVuZGlhbg0KICAgVmVyc2lvbjogICAgICAgICAgICAgICAgICAgICAgICAg
ICAxIChjdXJyZW50KQ0KICAgT1MvQUJJOiAgICAgICAgICAgICAgICAgICAgICAgICAgICBVTklY
IC0gU3lzdGVtIFYNCiAgIEFCSSBWZXJzaW9uOiAgICAgICAgICAgICAgICAgICAgICAgMA0KICAg
VHlwZTogICAgICAgICAgICAgICAgICAgICAgICAgICAgICBFWEVDIChFeGVjdXRhYmxlIGZpbGUp
DQogICBNYWNoaW5lOiAgICAgICAgICAgICAgICAgICAgICAgICAgIFBvd2VyUEMNCiAgIFZlcnNp
b246ICAgICAgICAgICAgICAgICAgICAgICAgICAgMHgxDQogICBFbnRyeSBwb2ludCBhZGRyZXNz
OiAgICAgICAgICAgICAgIDB4MTAwMDI3ZDANCiAgIFN0YXJ0IG9mIHByb2dyYW0gaGVhZGVyczog
ICAgICAgICAgNTIgKGJ5dGVzIGludG8gZmlsZSkNCiAgIFN0YXJ0IG9mIHNlY3Rpb24gaGVhZGVy
czogICAgICAgICAgMTg0Mjg5NiAoYnl0ZXMgaW50byBmaWxlKQ0KICAgRmxhZ3M6ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAweDANCiAgIFNpemUgb2YgdGhpcyBoZWFkZXI6ICAgICAgICAg
ICAgICAgNTIgKGJ5dGVzKQ0KICAgU2l6ZSBvZiBwcm9ncmFtIGhlYWRlcnM6ICAgICAgICAgICAz
MiAoYnl0ZXMpDQogICBOdW1iZXIgb2YgcHJvZ3JhbSBoZWFkZXJzOiAgICAgICAgIDkNCiAgIFNp
emUgb2Ygc2VjdGlvbiBoZWFkZXJzOiAgICAgICAgICAgNDAgKGJ5dGVzKQ0KICAgTnVtYmVyIG9m
IHNlY3Rpb24gaGVhZGVyczogICAgICAgICAzOQ0KICAgU2VjdGlvbiBoZWFkZXIgc3RyaW5nIHRh
YmxlIGluZGV4OiAzOA0KDQoNClRoYW5rcw0KQ2hyaXN0b3BoZQ0K
