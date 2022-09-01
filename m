Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBBEA5A9D6D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 18:47:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJRmV4vDHz2yRS
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 02:47:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=ayZ4mn52;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.78; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=ayZ4mn52;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90078.outbound.protection.outlook.com [40.107.9.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJRll4pKkz2xB1
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Sep 2022 02:46:59 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aDwqz0w+GGu7queUIGFWRBJmF/VNQInDi9BRG7oKMgXvHeLR1QXYCYfQCCNLgtYGVF3dZN49p5KbwNsMnfKvBk4dmHRM87BXBZlDi/+gn4i6d3mdacxndM/yZDhGTsN87GkWhX2ZEFRxcPLRJT15OeWC9grVS0DBq84/3jFV4qnplTUzsEUeVsVFjVu2+cKg8cduSSBDyP5It7t0lidP3R3VrLD84yNSjWVd9efgwWLS2C7NQhwWRt2wybK3H1NBJuteXMc2Od5dP+PH/UmZisI0MCiU/KzdO4im/mkWfoO+kQ2qssg945qQnOnI/Mh6t9D9oBfdP01tqV/wWw9rpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pbUULbKqPbjbEsIjxCFaoozqOeActmaiAu4CTrqGPdI=;
 b=nILNP9UpEiGtJYDyKHPo3Dnuc4NmkZ8D1h19eNsOjUvCv8Oq37ksi0eJcNFGXDkfMyktyzK7ILQP0+dHjmrRKa7oSY6Au90D/mz5epp3+IBH4cs/pjuk+9vVKU7ENB3nBWAruL8t+xKaOvZXZAWgjwX+iSnVlk/hcSy8t02aUvf5BqPxBXUBJS7PA2HpiDbYL5EN9D9WfaBwqv3nm28n7X/Yg+agflLD0lfA50GjqIPct/vWcLZQwTn/KGzK/53hFI8GcDDvvwmrFhoQPtE8O1nsyKI3z7ehLNZxxtm6qzzVHjj1Yi/Cf3AgUFijld10a8vUHyOag7jdDEX8HfocGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pbUULbKqPbjbEsIjxCFaoozqOeActmaiAu4CTrqGPdI=;
 b=ayZ4mn52dWi8yNz1rQTd9e7nGPJW/Ck0S4mlRjvt7VXlHJrsywu4aevgEq+rAQh7JNbPVogNJxCiw7xgCcmmL1ytZ/1LJL5nkax3SVbPBKTMuLbmIo+2M00KCzZMv/CafDonj6B8WAAMgBmTLkkdCsxUd5EyR5KJeXAIr38yIZ3e0R9kfqmLh1fLlpnPePWYgd3shcLDDVl9DlZbMvtfDwFe2MnZKTFQXWyNSWyIdI7H+K3PfW3drjKu0XIAt+mC4uUEQSI8Urtoj1HxFUioCPXzHFuGn6V1tM9MO34Rdz9K36bjzunj/Xa+r6xfH7CoZ8BASHywB5jDqfMMQ7CQLw==
Received: from MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3d::7) by
 MR1P264MB2020.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:13::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10; Thu, 1 Sep 2022 16:46:40 +0000
Received: from MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fdc6:a1de:d9e8:cb45]) by MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fdc6:a1de:d9e8:cb45%3]) with mapi id 15.20.5588.011; Thu, 1 Sep 2022
 16:46:40 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH v2 0/7] Implement inline static calls on PPC32 - v2
Thread-Topic: [PATCH v2 0/7] Implement inline static calls on PPC32 - v2
Thread-Index: AQHYkvCn1ZX8CT7LUUOpHA8ZAimGXa11mwyAgFWD4QA=
Date: Thu, 1 Sep 2022 16:46:40 +0000
Message-ID: <d35a2039-1755-b0be-6733-bb7ec19b2ea8@csgroup.eu>
References: <cover.1657301423.git.christophe.leroy@csgroup.eu>
 <CAMj1kXFqs=YAbTDJOgzpse9ZkggSxPNNJJphEA=J94FQzF55qg@mail.gmail.com>
In-Reply-To:  <CAMj1kXFqs=YAbTDJOgzpse9ZkggSxPNNJJphEA=J94FQzF55qg@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3b696838-541f-4b93-9563-08da8c398b32
x-ms-traffictypediagnostic: MR1P264MB2020:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  BjYGG1kI5b/Uc3QdE+i/n6mrYxWIWoCbDpRNCuOyUevhJW5HnGh/bpX+q2SL4pe9a6+NnEoHqZrp7e8GBT2t+WwC3j3Dkqb8ZcwlArFroaa0wDWn1pWLKgUvlblD3XyXB4r0BruQz3fWiZm7pfM8pBkMuUsMh32kAScBnxCMZXREctahN1iTt3Ing/JHsOJemDrj6b2JepObQCUKMlWIJs/wznzSHnmCA70soCzXR6xSfV6mAdDC+6WBq4FzsFi/A2JoaLpSmZfRbor0Fth0oR7k83kEuNpks6m0H9wV+Wz13iogcnHw5XahPkp3MsIK0gVTL14k3sFEf82pn6RiNhXitArNf75YIBlSPPZrYp5QjFvRBFlqsEHvwLFvIAWmO3ykgiNdrBNOPJnqc4pmFQm5EPzSdtnonRYvpWIaGhQiLC4rHdL40J08WUPU8XAMHPw6Vb+UYk7froXQ9rVMoDjCanWpc42I9t9f0ukoiF3LIWWI5rfZFsMkUeDOZepMmncAT4tBT05ogBa/IzwwQS0f8+j1UTkRBiilcL8u1yQIa/PtuUh3RLJ1NfEdMZpNztp03uMtGoo6+IbWsho4sePukU0F9VnVIOqT+U00S1xjywQgpb3vYCn19SgntLbR9kGbXzN43N1s9/VeuVgucoaAytq+KIicETw/wPcVwIQz1rBoM9V2RpzfCaJ+jyGOtxrYwSLe3oTG5+E7wt+Vh6BPiHdhT5LmtNuL3ETXnaBAjriNgHWJDzFZf3TmBX0wORyeoTiio2idShFprEpVzUEFmozj0qRzauPfpCeq02JSEmBNjA+CnGgQFjNEqgJ5ZpUmutjRfsp/S3wZJzj8w+kwsIOxFj8joQEeu4Y8qVs=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(39850400004)(366004)(396003)(346002)(376002)(316002)(7416002)(54906003)(6916009)(66574015)(66446008)(8676002)(76116006)(66946007)(2906002)(4326008)(91956017)(5660300002)(44832011)(8936002)(31686004)(66476007)(66556008)(36756003)(64756008)(6486002)(966005)(478600001)(41300700001)(6506007)(71200400001)(6512007)(122000001)(26005)(86362001)(31696002)(2616005)(83380400001)(186003)(38070700005)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?UmVnS09LbEhaKzVhUytrbHNWTnFkRTBBMkN1eEVQeU9hQ1hKREwrNndtZkJD?=
 =?utf-8?B?L3JnZHZBN3ArM01QS1VWa0Y1QTlBdGFPdlRkcmYrdmpZOUN4eFJxQllmclhx?=
 =?utf-8?B?YU1Ldk5leWlxeDJHL3psczBocDdiLzZPdzF6L0pjR1pVTVRvYzFxN3hqcVk1?=
 =?utf-8?B?YUptdkprTkVyUXRvMSt2ZVFIYVdIQWt6ZUNQSVBIY1JXbm9BblFWNTZpeEhz?=
 =?utf-8?B?cWovalk5YjgwdkNHWHJ4dnFrM2xEWHN5ZXVRQ1JtTDd4dkdYRjlKeU1EQWNK?=
 =?utf-8?B?d25kY2Z3dXkraVZlaFdCeElaTHJZRmQ1YmNBMTNBeTNnTjc3ZzFyT2lVcmFx?=
 =?utf-8?B?NmdYYml4dmF0SjZUL3BiT24rRk9idXZrUzhFM0Ewa1h5ODQ2bTFFK1FYWE1B?=
 =?utf-8?B?S1QxbHJDRWg1R3RvNDlNUkxsV0t2alkxZ0hXOFAvN2ZjWVJHd1NEekJkUldi?=
 =?utf-8?B?bzQ5RmVacnQ1VXB2MWxhcDJuYzByVjd5dGY3S0lweWdrWXpTWFR2UFFCUnNk?=
 =?utf-8?B?eGlNSjlIMm1SRGZNeWdUbVZkc1o1MjN0NGQ5dlZDRmVxTDFZa3l6aEc1eUZH?=
 =?utf-8?B?NDRMOFRCVUZUMU5mOENQWWl6ZldpMnBpOFY2UmIrcE1OVnBiOVFwYVRjRHJn?=
 =?utf-8?B?MDJ0QVVzY1EvTHQrTVlDTkFrQTRYcmFMWlJkU25VbENkZEFlblNQK21BVUYz?=
 =?utf-8?B?K2Z3WThIVFprVE5oQk1DMitDQko2L0pBRHV5N1p5QnhuckpmOEZEMVBJL25W?=
 =?utf-8?B?YkQxZWlOK1d0aE5zRDdTSG1mNjJjMmJxNVA2cUlpK3JpczFvTS9FUHBSNXFS?=
 =?utf-8?B?eUo0WUIxZXFCdXd1QmFGQU44SjVrcWkwMzFZbHp1VlFOSEtCYU5FYjZqMnZx?=
 =?utf-8?B?VGxHbUdaRHY0Uk5iOTFjWlE3b0l0Y3g2bVJwbnV0Y1NOS0hicGJSWGxjZWhL?=
 =?utf-8?B?UDNQTmVWWnBYZ2tHTnlMSjBFWnZlVWd6TFFUNDR5bWc5S0NLL0dSaUFUMlpQ?=
 =?utf-8?B?QjFocGxwckM1TGYwbVhMME5qMVhaSk9zRlVOMDFNZ1EzVHlvTmtMK0UxWXJP?=
 =?utf-8?B?dU1BbTY4NGN4ejB4TXVscmVoNTQ5YUVhZXMxbGVsVGFlWTdVeUJsMEZQU294?=
 =?utf-8?B?UFNyYzRSaStaRmJDSWJFRjJWeWt5d3JXRFNTcmx4Mlp6R2FzMW5nSC9tVE15?=
 =?utf-8?B?YXN3eEpuQUdNQklmQy9sSWFlYmVqcnYvbFRIVGJFYm10SVBxano3bStYOVhS?=
 =?utf-8?B?a3dNSGRWQ3JWN3pwU2VoUThCNFBmZTZTN2ZYVmFBVVBIbjAxc0xVQ2g3VFho?=
 =?utf-8?B?Z3dYMUxsME54Y20wakVCY1ZwMndTTU01Vk40S0VoMVRFcmF5NzArMitWTkFZ?=
 =?utf-8?B?Tko4NHBwRVBGeEdUTFJ6NTFWbTJ0N0FHcXRhekJnMEZtd2dLZ0pQaVc3OFVZ?=
 =?utf-8?B?SGJoTW5PUEhkVnJZZDkxZlJMZjc0Sms5aGlXc1B5MGNLQ3pYbS9CeUJDTmJP?=
 =?utf-8?B?ZjVvSlVlcHZMOHZGU0pST1Y3dmZhVWNUbXF0NGF2dFJCclBOZXdJb0lmL1ND?=
 =?utf-8?B?V1NkOFBGeW5GNjlFWEVYaGhYVjNJZVVsV1VoUFUxWDdNZ2pDZCt2WjF2SFRi?=
 =?utf-8?B?ZEJ5RGk1WXR4TkpFV01odWpqWWw0NDFERHlLUVUwR3MzMG5OMlE5VEVYYnpC?=
 =?utf-8?B?dm5IY0svZlM0QXJnQVB5MHAvMUZUUXhWVHY4QXBLeHZaR1JYY1E3dVcwZzZO?=
 =?utf-8?B?am1VUjV1bWNPSGlXcmFvd1ZYYk5RRWpsWXUyd0o4ci9wOHB5RjBGUTdJUGtS?=
 =?utf-8?B?NTU2dW5CanY3WlpvUVF1VE84aEk1aFA1cXcybHl3RmNUNkp4YWNpNlBRcFAv?=
 =?utf-8?B?aDFxc3dteXI1ZURlN1lhU0VsZlpKS281SkZ3NEdOV20rKzdxNmdnMkR1d3l3?=
 =?utf-8?B?eitYOGxDY25WTEk5RUZmbjBKMHVqTXUrWnQvTFUwSC9uT1NwTWNFeXZOZCtN?=
 =?utf-8?B?cUdLSGZFRERoSWF5eW0rdFYvT253QlJMbnNaUDhCL2FJTEgrVlhqcndzMEtX?=
 =?utf-8?B?S21YTDJEcWEyaGw0dVVpZ3h0TVEwMEkwTG1ickxtS0hDekxUbUJ0dDBtVFdN?=
 =?utf-8?B?OWJiRXU2V3g2Ukd1Uk5vY251M1daek4rdFV4Tm1aZjBXYytTVkNpVW4zTm44?=
 =?utf-8?Q?bjfmFLu1zq0Zg7bmzzrbaBs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2398900A528FB547A6539DF81437AEF4@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b696838-541f-4b93-9563-08da8c398b32
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2022 16:46:40.2562
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Rq7Dib0gniykca2A39wYW8DrBVw+pvCwd7jHafCIakerLg30RKmU9jWuruMh2uPk9TieY+ME/kzs3p30ry+5JCuk8qs9+bdDwjT4BX7pxgU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2020
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
Cc: X86 ML <x86@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Chen Zhongjin <chenzhongjin@huawei.com>, Dave Hansen <dave.hansen@linux.intel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Jason Baron <jbaron@akamai.com>, Ingo Molnar <mingo@redhat.com>, "sv@linux.ibm.com" <sv@linux.ibm.com>, "Steven Rostedt
 \(VMware\)" <rostedt@goodmis.org>, "H. Peter Anvin" <hpa@zytor.com>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, "agust@denx.de" <agust@denx.de>, "open list:LINUX FOR POWERPC
 \(32-BIT AND 64-BIT\)" <linuxppc-dev@lists.ozlabs.org>, Josh Poimboeuf <jpoimboe@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA5LzA3LzIwMjIgw6AgMDg6NTIsIEFyZCBCaWVzaGV1dmVsIGEgw6ljcml0wqA6DQo+
IEhlbGxvIENocmlzdG9waGUsDQo+IA0KPiBPbiBGcmksIDggSnVsIDIwMjIgYXQgMTk6MzIsIENo
cmlzdG9waGUgTGVyb3kNCj4gPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4gd3JvdGU6DQo+
Pg0KPj4gVGhpcyBzZXJpZXMgYXBwbGllcyBvbiB0b3Agb2YgdGhlIHNlcmllcyB2MyAib2JqdG9v
bDogRW5hYmxlIGFuZA0KPj4gaW1wbGVtZW50IC0tbWNvdW50IG9wdGlvbiBvbiBwb3dlcnBjIiBb
MV0gcmViYXNlZCBvbiBwb3dlcnBjLW5leHQgYnJhbmNoDQo+Pg0KPj4gQSBmZXcgbW9kaWZpY2F0
aW9ucyBhcmUgZG9uZSB0byBjb3JlIHBhcnRzIHRvIGVuYWJsZSBwb3dlcnBjDQo+PiBpbXBsZW1l
bnRhdGlvbjoNCj4+IC0gUl9YODZfNjRfUEMzMiBpcyBhYnN0cmFjdGVkIHRvIFJfUkVMMzIgc28g
dGhhdCBpdCBjYW4gdGhlbiBiZQ0KPj4gcmVkZWZpbmVkIGFzIFJfUFBDX1JFTDMyLg0KPj4gLSBB
IGNhbGwgdG8gc3RhdGljX2NhbGxfaW5pdCgpIGlzIGFkZGVkIHRvIHN0YXJ0X2tlcm5lbCgpIHRv
IGF2b2lkDQo+PiBldmVyeSBhcmNoaXRlY3R1cmUgdG8gaGF2ZSB0byBjYWxsIGl0DQo+PiAtIFRy
YW1wb2xpbmUgYWRkcmVzcyBpcyBwcm92aWRlZCB0byBhcmNoX3N0YXRpY19jYWxsX3RyYW5zZm9y
bSgpIGV2ZW4NCj4+IHdoZW4gc2V0dGluZyBhIHNpdGUgdG8gZmFsbGJhY2sgb24gYSBjYWxsIHRv
IHRoZSB0cmFtcG9saW5lIHdoZW4gdGhlDQo+PiB0YXJnZXQgaXMgdG9vIGZhci4NCj4+DQo+PiBb
MV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC83MGI2ZDA4ZC1hY2VkLTdmNGUtYjk1OC1h
M2M3YWUxYTkzMTlAY3Nncm91cC5ldS9ULyNyYjNhMDczYzU0YWJhNTYzYTEzNWZiYTg5MWUwYzM0
YzQ2ZTQ3YmVlZg0KPj4NCj4+IENocmlzdG9waGUgTGVyb3kgKDcpOg0KPj4gICAgcG93ZXJwYzog
QWRkIG1pc3NpbmcgYXNtL2FzbS5oIGZvciBvYmp0b29sDQo+PiAgICBvYmp0b29sL3Bvd2VycGM6
IEFjdGl2YXRlIG9ianRvb2wgb24gUFBDMzINCj4+ICAgIG9ianRvb2w6IEFkZCBhcmNoaXRlY3R1
cmUgc3BlY2lmaWMgUl9SRUwzMiBtYWNybw0KPj4gICAgb2JqdG9vbC9wb3dlcnBjOiBBZGQgbmVj
ZXNzYXJ5IHN1cHBvcnQgZm9yIGlubGluZSBzdGF0aWMgY2FsbHMNCj4+ICAgIGluaXQ6IENhbGwg
c3RhdGljX2NhbGxfaW5pdCgpIGZyb20gc3RhcnRfa2VybmVsKCkNCj4+ICAgIHN0YXRpY19jYWxs
X2lubGluZTogUHJvdmlkZSB0cmFtcG9saW5lIGFkZHJlc3Mgd2hlbiB1cGRhdGluZyBzaXRlcw0K
Pj4gICAgcG93ZXJwYy9zdGF0aWNfY2FsbDogSW1wbGVtZW50IGlubGluZSBzdGF0aWMgY2FsbHMN
Cj4+DQo+IA0KPiBDb3VsZCB5b3UgcXVhbnRpZnkgdGhlIHBlcmZvcm1hbmNlIGdhaW5zIG9mIG1v
dmluZyBmcm9tIG91dC1vZi1saW5lLA0KPiBwYXRjaGVkIHRhaWwtY2FsbCBicmFuY2ggaW5zdHJ1
Y3Rpb25zIHRvIGZ1bGwtZmxlZGdlZCBpbmxpbmUgc3RhdGljDQo+IGNhbGxzPyBPbiB4ODYsIHRo
ZSByZXRwb2xpbmUgcHJvYmxlbSBtYWtlcyB0aGlzIGdsYXJpbmdseSBvYnZpb3VzLCBidXQNCj4g
b24gb3RoZXIgYXJjaGl0ZWN0dXJlcywgdGhlIGNvbXBsZXhpdHkgb2Ygc3VwcG9ydGluZyB0aGlz
IG1vZGVsIG1heQ0KPiBvdXR3ZWlnaCB0aGUgcGVyZm9ybWFuY2UgYWR2YW50YWdlcy4NCg0KU3Vy
cHJpc2luZ2x5LCBJIGdldCB3b3JzdCBwZXJmb3JtYW5jZSB3aXRoIGlubGluZSBzdGF0aWMgY2Fs
bCB0aGFuIHdpdGggDQpvdXQgb2YgbGluZSBzdGF0aWMgY2FsbDoNCg0KTm8gc3RhdGljIGNhbGw6
DQoNCnJvb3RAdmdvaXA6fiMgcGVyZiBzdGF0IC1yIDEwIC4vaGFja2JlbmNoIDENClJ1bm5pbmcg
d2l0aCAxKjQwICg9PSA0MCkgdGFza3MuDQpUaW1lOiAxNy4xODYNClJ1bm5pbmcgd2l0aCAxKjQw
ICg9PSA0MCkgdGFza3MuDQpUaW1lOiAxNi43MzgNClJ1bm5pbmcgd2l0aCAxKjQwICg9PSA0MCkg
dGFza3MuDQpUaW1lOiAxNi41NzkNClJ1bm5pbmcgd2l0aCAxKjQwICg9PSA0MCkgdGFza3MuDQpU
aW1lOiAxNi44MzgNClJ1bm5pbmcgd2l0aCAxKjQwICg9PSA0MCkgdGFza3MuDQpUaW1lOiAxNi42
NTINClJ1bm5pbmcgd2l0aCAxKjQwICg9PSA0MCkgdGFza3MuDQpUaW1lOiAxNy4zODANClJ1bm5p
bmcgd2l0aCAxKjQwICg9PSA0MCkgdGFza3MuDQpUaW1lOiAxNi42MzANClJ1bm5pbmcgd2l0aCAx
KjQwICg9PSA0MCkgdGFza3MuDQpUaW1lOiAxNi44NTANClJ1bm5pbmcgd2l0aCAxKjQwICg9PSA0
MCkgdGFza3MuDQpUaW1lOiAxNy4xNjENClJ1bm5pbmcgd2l0aCAxKjQwICg9PSA0MCkgdGFza3Mu
DQpUaW1lOiAxNi43MjINCg0KICBQZXJmb3JtYW5jZSBjb3VudGVyIHN0YXRzIGZvciAnLi9oYWNr
YmVuY2ggMScgKDEwIHJ1bnMpOg0KDQogICAgICAgICAgIDE3MDE5LjU1IG1zZWMgdGFzay1jbG9j
ayAgICAgICAgICAgICAgICAjICAgIDAuOTgwIENQVXMgDQp1dGlsaXplZCAgICAgICAgICAgICgg
Ky0gIDAuNTElICkNCiAgICAgICAgICAgICAgIDQ4NDcgICAgICBjb250ZXh0LXN3aXRjaGVzICAg
ICAgICAgICMgIDI4Mi4yODAgL3NlYyANCiAgICAgICAgICAgICAgICggKy0gIDYuMzIlICkNCiAg
ICAgICAgICAgICAgICAgIDAgICAgICBjcHUtbWlncmF0aW9ucyAgICAgICAgICAgICMgICAgMC4w
MDAgL3NlYw0KICAgICAgICAgICAgICAgMTI0OSAgICAgIHBhZ2UtZmF1bHRzICAgICAgICAgICAg
ICAgIyAgIDcyLjczOSAvc2VjIA0KICAgICAgICAgICAgICAgKCArLSAgMC40OSUgKQ0KICAgICAg
ICAgMjI0NTM0NDk3NiAgICAgIGN5Y2xlcyAgICAgICAgICAgICAgICAgICAgIyAgICAwLjEzMSBH
SHogDQogICAgICAgICAgICAgICAoICstICAwLjUxJSApDQogICAgICAgICAgNzI3NDM3MDcyICAg
ICAgaW5zdHJ1Y3Rpb25zICAgICAgICAgICAgICAjICAgIDAuMzIgIGluc24gcGVyIA0KY3ljbGUg
ICAgICAgICAgICggKy0gIDAuNDAlICkNCiAgICA8bm90IHN1cHBvcnRlZD4gICAgICBicmFuY2hl
cw0KICAgIDxub3Qgc3VwcG9ydGVkPiAgICAgIGJyYW5jaC1taXNzZXMNCg0KICAgICAgICAgICAg
MTcuMzU4NSArLSAwLjA5MDkgc2Vjb25kcyB0aW1lIGVsYXBzZWQgICggKy0gIDAuNTIlICkNCg0K
DQpPdXRsaW5lIHN0YXRpYyBjYWxsOg0KDQpyb290QHZnb2lwOn4jIHBlcmYgc3RhdCAtciAxMCAu
L2hhY2tiZW5jaCAxDQpSdW5uaW5nIHdpdGggMSo0MCAoPT0gNDApIHRhc2tzLg0KVGltZTogMTUu
ODkyDQpSdW5uaW5nIHdpdGggMSo0MCAoPT0gNDApIHRhc2tzLg0KVGltZTogMTUuNzMxDQpSdW5u
aW5nIHdpdGggMSo0MCAoPT0gNDApIHRhc2tzLg0KVGltZTogMTUuNTA3DQpSdW5uaW5nIHdpdGgg
MSo0MCAoPT0gNDApIHRhc2tzLg0KVGltZTogMTYuMjY5DQpSdW5uaW5nIHdpdGggMSo0MCAoPT0g
NDApIHRhc2tzLg0KVGltZTogMTUuOTM0DQpSdW5uaW5nIHdpdGggMSo0MCAoPT0gNDApIHRhc2tz
Lg0KVGltZTogMTYuMDQ4DQpSdW5uaW5nIHdpdGggMSo0MCAoPT0gNDApIHRhc2tzLg0KVGltZTog
MTUuNzAwDQpSdW5uaW5nIHdpdGggMSo0MCAoPT0gNDApIHRhc2tzLg0KVGltZTogMTYuMDYzDQpS
dW5uaW5nIHdpdGggMSo0MCAoPT0gNDApIHRhc2tzLg0KVGltZTogMTUuODUyDQpSdW5uaW5nIHdp
dGggMSo0MCAoPT0gNDApIHRhc2tzLg0KVGltZTogMTUuOTQxDQoNCiAgUGVyZm9ybWFuY2UgY291
bnRlciBzdGF0cyBmb3IgJy4vaGFja2JlbmNoIDEnICgxMCBydW5zKToNCg0KICAgICAgICAgICAx
NjIyNy4zMiBtc2VjIHRhc2stY2xvY2sgICAgICAgICAgICAgICAgIyAgICAwLjk5MiBDUFVzIA0K
dXRpbGl6ZWQgICAgICAgICAgICAoICstICAwLjQyJSApDQogICAgICAgICAgICAgICAzNzMyICAg
ICAgY29udGV4dC1zd2l0Y2hlcyAgICAgICAgICAjICAyMzAuNTI1IC9zZWMgDQogICAgICAgICAg
ICAgICAoICstICA2LjQyJSApDQogICAgICAgICAgICAgICAgICAwICAgICAgY3B1LW1pZ3JhdGlv
bnMgICAgICAgICAgICAjICAgIDAuMDAwIC9zZWMNCiAgICAgICAgICAgICAgIDEyNDQgICAgICBw
YWdlLWZhdWx0cyAgICAgICAgICAgICAgICMgICA3Ni44NDIgL3NlYyANCiAgICAgICAgICAgICAg
ICggKy0gIDAuMTElICkNCiAgICAgICAgIDIxNDEwOTQyODggICAgICBjeWNsZXMgICAgICAgICAg
ICAgICAgICAgICMgICAgMC4xMzIgR0h6IA0KICAgICAgICAgICAgICAgKCArLSAgMC40MiUgKQ0K
ICAgICAgICAgIDcxMjU5ODQ0MSAgICAgIGluc3RydWN0aW9ucyAgICAgICAgICAgICAgIyAgICAw
LjMzICBpbnNuIHBlciANCmN5Y2xlICAgICAgICAgICAoICstICAwLjI5JSApDQogICAgPG5vdCBz
dXBwb3J0ZWQ+ICAgICAgYnJhbmNoZXMNCiAgICA8bm90IHN1cHBvcnRlZD4gICAgICBicmFuY2gt
bWlzc2VzDQoNCiAgICAgICAgICAgIDE2LjM1MzkgKy0gMC4wNjc1IHNlY29uZHMgdGltZSBlbGFw
c2VkICAoICstICAwLjQxJSApDQoNCg0KSW5saW5lIHN0YXRpYyBjYWxsOg0KDQpyb290QHZnb2lw
On4jIHBlcmYgc3RhdCAtciAxMCAuL2hhY2tiZW5jaCAxDQpSdW5uaW5nIHdpdGggMSo0MCAoPT0g
NDApIHRhc2tzLg0KVGltZTogMTcuNTEyDQpSdW5uaW5nIHdpdGggMSo0MCAoPT0gNDApIHRhc2tz
Lg0KVGltZTogMTcuMjQwDQpSdW5uaW5nIHdpdGggMSo0MCAoPT0gNDApIHRhc2tzLg0KVGltZTog
MTYuOTAxDQpSdW5uaW5nIHdpdGggMSo0MCAoPT0gNDApIHRhc2tzLg0KVGltZTogMTcuMTI1DQpS
dW5uaW5nIHdpdGggMSo0MCAoPT0gNDApIHRhc2tzLg0KVGltZTogMTcuMjYyDQpSdW5uaW5nIHdp
dGggMSo0MCAoPT0gNDApIHRhc2tzLg0KVGltZTogMTcuMjk4DQpSdW5uaW5nIHdpdGggMSo0MCAo
PT0gNDApIHRhc2tzLg0KVGltZTogMTcuMTgyDQpSdW5uaW5nIHdpdGggMSo0MCAoPT0gNDApIHRh
c2tzLg0KVGltZTogMTYuOTg4DQpSdW5uaW5nIHdpdGggMSo0MCAoPT0gNDApIHRhc2tzLg0KVGlt
ZTogMTcuMTAyDQpSdW5uaW5nIHdpdGggMSo0MCAoPT0gNDApIHRhc2tzLg0KVGltZTogMTYuNjY5
DQoNCiAgUGVyZm9ybWFuY2UgY291bnRlciBzdGF0cyBmb3IgJy4vaGFja2JlbmNoIDEnICgxMCBy
dW5zKToNCg0KICAgICAgICAgICAxNjk3Ni43NiBtc2VjIHRhc2stY2xvY2sgICAgICAgICAgICAg
ICAgIyAgICAwLjk2NCBDUFVzIA0KdXRpbGl6ZWQgICAgICAgICAgICAoICstICAwLjQ0JSApDQog
ICAgICAgICAgICAgICA0NzYwICAgICAgY29udGV4dC1zd2l0Y2hlcyAgICAgICAgICAjICAyNzMu
MDA3IC9zZWMgDQogICAgICAgICAgICAgICAoICstICA0LjkzJSApDQogICAgICAgICAgICAgICAg
ICAwICAgICAgY3B1LW1pZ3JhdGlvbnMgICAgICAgICAgICAjICAgIDAuMDAwIC9zZWMNCiAgICAg
ICAgICAgICAgIDEyNTIgICAgICBwYWdlLWZhdWx0cyAgICAgICAgICAgICAgICMgICA3MS44MDgg
L3NlYyANCiAgICAgICAgICAgICAgICggKy0gIDAuMzUlICkNCiAgICAgICAgIDIyMzk5ODYxMTIg
ICAgICBjeWNsZXMgICAgICAgICAgICAgICAgICAgICMgICAgMC4xMjggR0h6IA0KICAgICAgICAg
ICAgICAgKCArLSAgMC40NCUgKQ0KICAgICAgICAgIDcyMTU0MDE4NCAgICAgIGluc3RydWN0aW9u
cyAgICAgICAgICAgICAgIyAgICAwLjMxICBpbnNuIHBlciANCmN5Y2xlICAgICAgICAgICAoICst
ICAwLjMxJSApDQogICAgPG5vdCBzdXBwb3J0ZWQ+ICAgICAgYnJhbmNoZXMNCiAgICA8bm90IHN1
cHBvcnRlZD4gICAgICBicmFuY2gtbWlzc2VzDQoNCiAgICAgICAgICAgIDE3LjYxMjYgKy0gMC4w
NzYyIHNlY29uZHMgdGltZSBlbGFwc2VkICAoICstICAwLjQzJSApDQoNCg0KU3VtbWFyeToNCg0K
Tm8gc3RhdGljIGNhbGxzOg0KICAgICAgICAgICAgMTcuMzU4NSArLSAwLjA5MDkgc2Vjb25kcyB0
aW1lIGVsYXBzZWQgICggKy0gIDAuNTIlICkNCk91dC1vZi1saW5lIHN0YXRpYyBjYWxsczoNCiAg
ICAgICAgICAgIDE2LjM1MzkgKy0gMC4wNjc1IHNlY29uZHMgdGltZSBlbGFwc2VkICAoICstICAw
LjQxJSApDQpJbmxpbmUgc3RhdGljIGNhbGxzOg0KICAgICAgICAgICAgMTcuNjEyNiArLSAwLjA3
NjIgc2Vjb25kcyB0aW1lIGVsYXBzZWQgICggKy0gIDAuNDMlICkNCg0KSXMgdGhlcmUgYW55dGhp
bmcgd3Jvbmcgd2l0aCBpbmxpbmUgc3RhdGljYSBjYWxscyA/DQoNCkNocmlzdG9waGU=
