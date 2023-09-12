Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 447C979C889
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Sep 2023 09:49:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=SQrRbNxv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RlG1W1Pwvz3dFb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Sep 2023 17:49:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=SQrRbNxv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::631; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20631.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::631])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RlG0Z60tGz2xl6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Sep 2023 17:48:13 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=doak5QWHbKt4hzr1V0OvBo777GVxEfsqhdr4H7Ti2RHFzTy+kwddGiG+kH1xSsNUC7w2bkVDTBkbSK5Js9BNj7vSJa2KE5SImKn9QY4G7D7kQ3WgYMXCq+jkT4ig/U7hn/wfAl1Ydk5xwLoK/W4o8w5+lkPMX2+XzqHs1KqJQ8DEqQsSGOi9ll4NiGmBr1MTu2kAkU67L1solGTEmQ+uOg6GAku08cHwHPQsYWa4V5j6PGgSCdqKHd1F5b9I3GmVX3QrF8JUGwqPPrJgxt6grzEib+gbtyGlVheV7GchFdJRSLR2EJjTYLexyQkP28cD6wTlTQOt+9Yf11ZTYps+nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o0k++9swEvWZ6QAb79cYSrXHvye2RsWZQF25EIkav9Y=;
 b=TShHsS4pPqSgQG0895hGMJGUbCeNoY449fkocJ7F6ZG0zuiKPqUnpY84fdHgntEFQcAZA59fHU2kH0gdd+TdCQba1JkXwiOg8idNf7ny4pY5cqUHEKfFvS5dBPK8lvT/DHtKcO+xlZLJ83WaikMaA+SKrCRq83V/98FLuCxjymok1I0LkvqlVohiBjUp4Z6DgWAqUPcl6XaB99WqWkMynb0RrCJLGuX6FkBzx6nBCMUi/zgUBGYpMDp6w3bwlZ2CYn29qcZAWppUpZApl5/XmbY2LwDSrLt7tUEDhrH0HRgKsijR/yW0+xluu1w7dvwG08Q7nb66Wc1sQFZxkfnuMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o0k++9swEvWZ6QAb79cYSrXHvye2RsWZQF25EIkav9Y=;
 b=SQrRbNxvabxk0eAyRBoWiuZxOhcpE1wynOzReaW3AWV+Hxj0v60FHz2FltPC92a7fncgkOikL2Z22/ER+5xF1a1CfRmg2KWVfAFkS3BlDG4JvTX/6wVAW4tHnTLEi582edGSO42WZRe4/Mvre4K67A/qaNsiiUTWde63LAsbphsuvf/xM2j7g+eVoDZrMLzCpUqGrrYJvorcKPp8iHCXtrluKSOxwysq8ZsJqknsTxJZ3G+UCoLjj7/uVFL8NpdCkHp4iDRlf+oHUQQbvG5eQFLSKy0D2/zmOK50zG5jAoeIkOwXDKgzFxXGcsTtMZcXBeoCg1cucYyrHAKOiOSqjg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB3081.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:1a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.37; Tue, 12 Sep
 2023 07:47:50 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e%7]) with mapi id 15.20.6768.036; Tue, 12 Sep 2023
 07:47:50 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Erhard Furtner <erhard_f@mailbox.org>
Subject: Re: KASAN debug kernel fails to boot at early stage when CONFIG_SMP=y
 is set (kernel 6.5-rc5, PowerMac G4 3,6)
Thread-Topic: KASAN debug kernel fails to boot at early stage when
 CONFIG_SMP=y is set (kernel 6.5-rc5, PowerMac G4 3,6)
Thread-Index:  AQHZy+ViBGkHrlry0EW7JbY0oo0AC6/kpveAgAP81YCAAOsxAIAAgoIAgAGRmwCAACvKAIABTb0AgAG9zgCAAE6agIAAqJKAgABtOACAAAn3AIAFtNyAgAKmeoCAAMKDAIAFewAAgAUftACAASA2gIAAlqsAgAQFCICAASjBgIAAAdaAgAubzoCAAH9ogA==
Date: Tue, 12 Sep 2023 07:47:50 +0000
Message-ID: <22f67fc2-ae70-bbc7-ca2a-dffbf62731f3@csgroup.eu>
References: <20230811014845.1bf6771d@yea>
 <f8f09049-3568-621d-88ce-1b61fe8b63fe@csgroup.eu>
 <20230813213855.794b3c8f@yea>
 <57bdfad9-cbec-1a9f-aca7-5956d22a8ada@csgroup.eu>
 <20230814192748.56525c82@yea>
 <6d710a2b-5cac-9f0a-cd30-0ad18172932b@csgroup.eu>
 <20230815220156.5c234b52@yea>
 <0876e754-7bee-ec61-4e3c-c0ee08d59d87@csgroup.eu>
 <20230817203202.2b4c273c@yea> <87y1i9clf2.fsf@mail.lhotse>
 <20230818111641.7f680ce7@yea>
 <fcdf2bf7-0834-b27f-4d24-28e05815ee6f@csgroup.eu>
 <20230818182316.79303545@yea>
 <5ea3302e-0fb1-1670-e4b6-adba5115ab94@csgroup.eu>
 <20230824020015.78733931@yea> <87jztkvfid.fsf@mail.lhotse>
 <20230828011758.3b7b9daf@yea>
 <1085cc49-b5e8-0aa5-dc97-ec4a100463b5@csgroup.eu>
 <20230901004417.631dc019@yea>
 <b9671cd2-9cad-c5d9-dd94-8b39f67e29b4@csgroup.eu>
 <20230903230635.5751b620@yea>
 <438d8790-8a55-2f36-4ef0-2fddcb39edae@csgroup.eu>
 <c0891617-43b9-5b56-2c51-69eec81e3b48@csgroup.eu>
 <20230912021147.57c85033@yea>
In-Reply-To: <20230912021147.57c85033@yea>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB3081:EE_
x-ms-office365-filtering-correlation-id: 71136df0-2753-4eb8-5a33-08dbb364903b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  T/nVbUnOhPdBuW/KPcnsb7nsKGOs4i/WB5Fa0TxSMi7OgnP0Z2+HdrhAwwjmqAq0Pcn9EV5catx6Iwebz2cvqTK7nH3VJQDFP+nY2gczW5yMYGjGJ8A42iDsZwyRyJd6BPj2/7tdSBGLorzI4kxpuvEgapF0RY9p0rdij7/3Rl18JW0zT3lBHtnEqCNg38dNxiLygoIrBvzCkemdrerqryg4U8HR8TZVZZQMlo+ZEzjg3xkOiNcZoiPEttkDoatT6dyeXl+DAAPwzhusqq/0hiIQeCUGjGDo8sSNAOK374c9rgLqShdZhbgFaBHpCTtRm2ucLh19Q0HTJXy0jCY+CnGDO03gSg57AJPajVs4PF0FDWEyhTjQSiilXUY06UyLeX1RsH3092bl9tX7x5ZrLKBjaeXI+yviliCVivxw/ulshY/QJCUj5b6CaXwk9MG6xGL5FlKhwh8SMvTqVCj6LPn/3vMmuhZl4Vnv9O3AvaH4oolt+m7iN//+AfxtRmz6V8/CYWCvH2cSJSI75GGjf7r3qdl6CYdXYEtSZ6FPi81hlpNIbsfOb0Lf6CyrztfIA6XYX8UqDd8Ngx4Zm47g6JVH/dWAZ7JQWR7OpqDgjMHf5acSoAQbo588z5fyYtRfNcpNzPh92u21kmfxviwInGwJ76Z/f9ZZY/hHyTZbOd5xpa4LGibnuahiWnXmfHpk
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(136003)(39850400004)(346002)(396003)(376002)(366004)(186009)(451199024)(1800799009)(6512007)(31686004)(5660300002)(71200400001)(6506007)(6486002)(26005)(478600001)(2906002)(2616005)(83380400001)(44832011)(4326008)(8936002)(66946007)(8676002)(6916009)(41300700001)(66574015)(76116006)(122000001)(38100700002)(91956017)(36756003)(64756008)(66446008)(54906003)(66476007)(316002)(38070700005)(31696002)(86362001)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?UFJrcFlYVHRJMHIvYUdUQ2c5b2hVaklYU0tHV2xVVExCT2xkNjFFckNrUHBu?=
 =?utf-8?B?VFRMVTlDWUZMZE9lRkFWcEk2bC9hTEt4TGRqbXhBRGk0WnlvSmRQNkJSWHNh?=
 =?utf-8?B?ZFVVdnBCZHBhV3hITzZqY1RtUnBFeFdxbXNaN01CbEV5UHUzRGRmamphRnhv?=
 =?utf-8?B?ZlRLTlVqMVdIMXdMWWM5MHpEV2MyM0pVbXJDRGNBTGs0cXFYM21hWmQ0Q21l?=
 =?utf-8?B?R3lJL3VKanJUV3lLWWdpcXlrbHBmdEwxeHN6eGp0Y255TDJlRURGQ0M2UlQ0?=
 =?utf-8?B?RkRPWjVZNE9EaEZIbTNpRHNMR3FhRExaeHE2WVhhQnZhekFUWGZDVEVIVEE0?=
 =?utf-8?B?endUT0IwUnFYKyt0T1psWUk3Y2JHb2NSL1I3OVhlOGRnWFlFVC9lRnhQUytq?=
 =?utf-8?B?QlhRelcwYTJyZ2NRck9nekJVR2t5Q251V2tpU0kybWk3aWNxR1VtZWl2YXB1?=
 =?utf-8?B?Qkt2eVdqMEx6ekwxZnVJOXF5L2dzVjhzZDRNQUlJakw1c0pNZ00yZklXRjBU?=
 =?utf-8?B?SktsaFdKNTRsTkRaRmkyS1RGSlFGSHBNV1NXdXNrUmpKRWwyRlpVREdIc1FS?=
 =?utf-8?B?bnhYM1V0REVTaDZXMjQzRVJNSTdOVkVvbXFlZEpWL1ExZVRINlVjS0xBdXRU?=
 =?utf-8?B?enRHeEJqQ2lvQkRXbU1CWVV6bk9Yd1FFTVJPdkZsT0wwTWRKOExnaWR5OXR1?=
 =?utf-8?B?UjhEWTlNOTFBdmRUOFRGNzFhd0VYSWVwOVRwUGg1ZmQ5QjkxS1BGWjRQODlG?=
 =?utf-8?B?RTAxODRjbzBNc0ZqT1pxeVgrNERYSW9CK3d1VUdrQ1JZdUFFZ1REWjRaZU1N?=
 =?utf-8?B?ZzV6UWdPemxjM04vbFIxSWJkdXVWR2c5LzcvZGE2QTBleUpGREc5NzhzenJ6?=
 =?utf-8?B?Yjc0TGFSK2pEeThDRkVwMWJkVjBxWWw2VGFrN3RVTGtKeXpuVlVzWjR5M3hH?=
 =?utf-8?B?R25CQzZLalE4VDBtQ0N4Z2ZYaW9YRGRLNGE4VWNhVjJOd0NpaEdSUnZBa09p?=
 =?utf-8?B?ZXFTa1UyTVplK055V0t3NUs5YU5TUWxjbTNEcStsQmtyQ0hXbXFRNURQSFdt?=
 =?utf-8?B?S0ZLOHp3cXJHcjRRb0ZveFlKWmxWemlNVld5QjNlQThhM2I3T2RsY3I2MmtJ?=
 =?utf-8?B?dElPM0lNNUtFbXRldlMyYXVabmk3UUNPWDhhVWFUZlp3ZFNxdWQ0aDBBNlVh?=
 =?utf-8?B?MENQaHN6OVhmdzExeDZJNmY4S2JXNFYxTU95QTBzbGNyRmw4TkNuTy9MWDky?=
 =?utf-8?B?WjIwUXRQWUFCL01YT0ZOaDkwak1MU29XNVczSExISmNZUXM0aTZjVUZ4S1pH?=
 =?utf-8?B?WGY3YU9YNUpXQlFodDRnajRQRlBIUXlvYW1aVXREVWl5czY4RzZKVFVXNldN?=
 =?utf-8?B?d2hXdEdzbDF2M1BFN3JWOUZPM2c1b1l4NjdiYWR3SitXREZOdC9mcTg2Qlhn?=
 =?utf-8?B?NmJHQS9DdTQxWS9MV01rMzg1N21aZnhtazhtektIa3g5T0xBZDF0eEJ6ZWVW?=
 =?utf-8?B?QUNESlJhd2FYVVVGMFpSSStBWTdmZU8zT0lFcFhwdzFwVVhDaTEvMUVacTlz?=
 =?utf-8?B?ekdjbjM2YUtwMGc4UzdlVHBXbWZMUUp6WmhPeFRVb1BqSmsxbk5HTkQzNnBL?=
 =?utf-8?B?ZjJNL3hUMW5BY2dtdVlJUmxWSU53TnJDSTlxaTJIUnVuSHp4TThwSFE3Mi94?=
 =?utf-8?B?WmptU29YaXlXUXFQWDdCbWhDN2ZvUDNYODBCM0hsWlpYbEJxQVdqRDZCSDBS?=
 =?utf-8?B?TTNmMXRsY1RqWW5QNlpsWENXbEt2akxPSWFKYkFiOFphVlZ5V1dWTkg3cXcx?=
 =?utf-8?B?QloxRklwT3c4VFg4c3VjbUpGQTIxY2ZEMFFQUkJUNjJSSHBxUUp5bHJhVHdU?=
 =?utf-8?B?M015azlsK3AvUlZUOXY0S2ZMUDl4SGFXVVdNNHQzMTY1Ty81Rjd0dmtFVGFu?=
 =?utf-8?B?SG5LaG44RG1MbldqTlg0VUY3ZHBxK2VnT1NZdmU2OHE5UXppM3BQbnN2VjdK?=
 =?utf-8?B?U2Z1STNaY1hLRjNWc3NPRzdWTFRtYjFEM0NtYTc4V0hGTGxucXErUGdYQWJl?=
 =?utf-8?B?MmNZZGpaK3JmcHlsTDNPT2g3SEFBam5KeloxUDRHYndGQ3FLZnNEc2t6NWlR?=
 =?utf-8?Q?j4hNE62FvkqJh9wN9/PES8cUS?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D4F78A51F86D7142808430120D2CA56D@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 71136df0-2753-4eb8-5a33-08dbb364903b
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2023 07:47:50.0800
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n+/IKdRSDM5vtFb9uuXgw7xY5tBBlgkw/NyWspimnvzi4//I0XLr/kYzJSorbA5f6ehMtn2vzN4lPbx1LJmlTHN0qFkp+lhJh2QWkqGzN5k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB3081
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDEyLzA5LzIwMjMgw6AgMDI6MTEsIEVyaGFyZCBGdXJ0bmVyIGEgw6ljcml0wqA6DQo+
IE9uIE1vbiwgNCBTZXAgMjAyMyAxNDo1NToxNyArMDAwMA0KPiBDaHJpc3RvcGhlIExlcm95IDxj
aHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+IHdyb3RlOg0KPiANCj4+IEFub3RoZXIgdGhpbmcg
dGhhdCBjb3VsZCBiZSBpbnRlcmVzdGluZyB0byB0ZXN0IGlzIHRvIHJlbW92ZSAob3IgY29tbWVu
dA0KPj4gb3V0KSB0aGUgZm9sbG93aW5nIGxpbmUgaW4gYXJjaC9wb3dlcnBjL21tL2thc2FuL01h
a2VmaWxlIDoNCj4+DQo+PiAgICAgb2JqLSQoQ09ORklHX1BQQ19CT09LM1NfMzIpCSs9IGJvb2sz
c18zMi5vDQo+Pg0KPj4gVGhhdCB3YXksIHRoZSB3ZWFrIHZlcnNpb24gb2Yga2FzYW5faW5pdF9y
ZWdpb24oKSB3aWxsIGJlIHVzZWQgaW5zdGVhZA0KPj4gb2YgdGhlIG9uZSBpbiBib29rM3NfMzIu
Yw0KPiANCj4gVGlua2VyZWQgYXJvdW5kIHdpdGggb2xkZXIga2VybmVscyBhbmQgLmNvbmZpZyBv
cHRpb25zIG1lYW53aGlsZS4gSSBmb3VuZCBvdXQgaXQncyBub3QgYSBuZXcgaXNzdWUsIGFsc28g
aGFwcGVucyBvbiBrZXJuZWwgdjYuMC4gSGF2ZSBub3QgdHJpZWQgb2xkZXIga2VybmVscyB5ZXQu
DQo+IA0KPiBBbHNvIG9uIHY2LjAgdGhlIGlzc3VlIGRpc2FwcGVhcnMgd2hlbiBJIGNvbW1lbnQg
b3V0ICJvYmotJChDT05GSUdfUFBDX0JPT0szU18zMikgKz0gYm9vazNzXzMyLm8iIGluIGFyY2gv
cG93ZXJwYy9tbS9rYXNhbi9NYWtlZmlsZS4NCj4gDQo+IEV2ZW4gbW9yZSBpbnRlcmVzdGluZyBp
cyB0aGUgaXNzdWUgZGlzYXBwZWFycyB0b28gd2hlbiBJIGRlc2VsZWN0IElOSVRfU1RBQ0tfQUxM
X1BBVFRFUk4gaW4gbXkga2VybmVsIC5jb25maWcuIFRoZSBrZXJuZWwgYm9vdHMganVzdCBmaW5l
IHdpdGggS0FTQU4gd2hlbiBJTklUX1NUQUNLX05PTkU9eSBpcyBzZXQhIFRydWUgZm9yIGtlcm5l
bCB2Ni4wIGFuZCB2Ni42LXJjMS4NCj4gDQo+IEN1cnJlbnQgdjYuNi1yYzEga2VybmVsIC5jb25m
aWcgYW5kIGRtZXNnIGF0dGFjaGVkLg0KPiANCg0KSSBzdXNwZWN0IHNvbWV0aGluZyB3cm9uZyB3
aGVuIHdlIHNldCB0aGUgQkFUcy4NCg0KQ2FuIHlvdSB0cnkgd2l0aCB0aGUgZm9sbG93aW5nIGFk
ZGl0aW9uYWwgdHJhY2VzOg0KDQpkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL21tL2thc2FuL2Jv
b2szc18zMi5jIA0KYi9hcmNoL3Bvd2VycGMvbW0va2FzYW4vYm9vazNzXzMyLmMNCmluZGV4IDQ1
MGE2N2VmMGJiZS4uOTk1NGI3YTNiN2FlIDEwMDY0NA0KLS0tIGEvYXJjaC9wb3dlcnBjL21tL2th
c2FuL2Jvb2szc18zMi5jDQorKysgYi9hcmNoL3Bvd2VycGMvbW0va2FzYW4vYm9vazNzXzMyLmMN
CkBAIC0xNSw2ICsxNSw3IEBAIGludCBfX2luaXQga2FzYW5faW5pdF9yZWdpb24odm9pZCAqc3Rh
cnQsIHNpemVfdCBzaXplKQ0KICAJcGh5c19hZGRyX3QgcGh5czsNCiAgCWludCByZXQ7DQoNCisJ
cHJfZXJyKCIlczogJXB4ICV4ICVseCAlbHhcbiIsIF9fZnVuY19fLCBzdGFydCwgc2l6ZSwga19z
dGFydCwga19lbmQpOw0KICAJd2hpbGUgKGtfbm9iYXQgPCBrX2VuZCkgew0KICAJCXVuc2lnbmVk
IGludCBrX3NpemUgPSBiYXRfYmxvY2tfc2l6ZShrX25vYmF0LCBrX2VuZCk7DQogIAkJaW50IGlk
eCA9IGZpbmRfZnJlZV9iYXQoKTsNCkBAIC0yOCw2ICsyOSw3IEBAIGludCBfX2luaXQga2FzYW5f
aW5pdF9yZWdpb24odm9pZCAqc3RhcnQsIHNpemVfdCBzaXplKQ0KICAJCWlmICghcGh5cykNCiAg
CQkJYnJlYWs7DQoNCisJCXByX2VycigiJXM6IHNldGJhdCAlZCAlbHggJXggJXhcbiIsIF9fZnVu
Y19fLCBpZHgsIGtfbm9iYXQsIHBoeXMsIA0Ka19zaXplKTsNCiAgCQlzZXRiYXQoaWR4LCBrX25v
YmF0LCBwaHlzLCBrX3NpemUsIFBBR0VfS0VSTkVMKTsNCiAgCQlrX25vYmF0ICs9IGtfc2l6ZTsN
CiAgCX0NCkBAIC00Nyw2ICs0OSw3IEBAIGludCBfX2luaXQga2FzYW5faW5pdF9yZWdpb24odm9p
ZCAqc3RhcnQsIHNpemVfdCBzaXplKQ0KDQogIAlrYXNhbl91cGRhdGVfZWFybHlfcmVnaW9uKGtf
c3RhcnQsIGtfbm9iYXQsIF9fcHRlKDApKTsNCg0KKwlwcl9lcnIoIiVzOiBsb29wICVseCAlbHhc
biIsIF9fZnVuY19fLCBrX25vYmF0LCBrX2VuZCk7DQogIAlmb3IgKGtfY3VyID0ga19ub2JhdDsg
a19jdXIgPCBrX2VuZDsga19jdXIgKz0gUEFHRV9TSVpFKSB7DQogIAkJcG1kX3QgKnBtZCA9IHBt
ZF9vZmZfayhrX2N1cik7DQogIAkJcHRlX3QgcHRlID0gcGZuX3B0ZShQSFlTX1BGTihwaHlzICsg
a19jdXIgLSBrX25vYmF0KSwgUEFHRV9LRVJORUwpOw0KDQoNCllvdSdkIHRoZW4gZ2V0IHNvbWV0
aGluZyBsaWtlOg0KDQpUb3RhbCBtZW1vcnkgPSAyMDQ4TUI7IHVzaW5nIDQwOTZrQiBmb3IgaGFz
aCB0YWJsZQ0KQWN0aXZhdGluZyBLZXJuZWwgVXNlcnNwYWNlIEFjY2VzcyBQcm90ZWN0aW9uDQpB
Y3RpdmF0aW5nIEtlcm5lbCBVc2Vyc3BhY2UgRXhlY3V0aW9uIFByZXZlbnRpb24NCkxpbnV4IHZl
cnNpb24gNi42LjAtcmMxKyAoY2hsZXJveUBQTzIwMzM1LklEU0kwLnNpLmMtcy5mcikgDQoocG93
ZXJwYzY0LWxpbnV4LWdjYyAoR0NDKSAxMi4yLjAsIEdOVSBsZCAoR05VIEJpbnV0aWxzKSAyLjM5
KSAjNDYxIFR1ZSANClNlcCAxMiAwOTozNzoxMSBDRVNUIDIwMjMNCmthc2FuX2luaXRfcmVnaW9u
OiBjMDAwMDAwMCAzMDAwMDAwMCBmODAwMDAwMCBmZTAwMDAwMA0Ka2FzYW5faW5pdF9yZWdpb246
IHNldGJhdCAzIGY4MDAwMDAwIDdjMDAwMDAwIDQwMDAwMDANCmthc2FuX2luaXRfcmVnaW9uOiBs
b29wIGZjMDAwMDAwIGZlMDAwMDAwDQpLQVNBTiBpbml0IGRvbmUNCg0KDQpUaGFua3MNCkNocmlz
dG9waGUNCg==
