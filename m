Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0F273A081
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 14:07:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=Vy5xcPrL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qmzdf5w43z3bZK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 22:07:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=Vy5xcPrL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::630; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20630.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::630])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qmzcj19pJz2yHr
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jun 2023 22:06:44 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Np1tylk24IVqYHfIzY6kPcC+1UpdD2B1giYiMDppp2hFitUNG/yVTOaJ9l/luQ1ykSt93vjFNWsoAoHT+txq0rWDUDYDdXQR96lLBAaEjEXmrlNRaoHoBiiqkecc6bnN1/xyslQJP0h5KmqnqUT00kF19yfP0105ITIo35RPl3dojZc1eXP2K/ozpeKwG/t28mQ+PCfY5NBvrsitK9GdBcsZyf4WfvlQKULxtLs/kzmNMKgK1JdcQ1FJQpwJeF1Q93+TVK+wpeblPiK0r/4ScKd0TQuGfZNrbZIMU1Oel8eWZOvKT9WUPmQ7TWyooovojInUejQ72R4KwnzDzM8rNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gsQmOxblE9LvjchaOwqAEYcvE6bnX6yug6qqwEaPU54=;
 b=FNtJIZnHVuRNKXC8b9FBfKLNj6Bkg9F1KFyt5sUDVc3+WYa2rjZpyrIO4rayy82b1cc50M753Mh1lFSyr7wjoaDPvmgJn+jPLKXuLQwCgMmF4FF19mPXftJRAmUcGkbRi84mdIu53KgOCoqy2ScQp6J6dilXH+urAvKZV5cDHTM6YoderH8dBBxtwkmjbGz8hqdYIN0b39onBP0zj9qTmwDXP/F5m7fSw6OzCbOg66Z/PI+sV/2mhd/T0edBKnt0qDdV0Pla9vvZDBZbDGnJPgs8C5x6FZDNC1yUsXIj9BXiPU6F+ruTPuwc5KzKwf8ipm7eDj+Mavx62phNztoHxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gsQmOxblE9LvjchaOwqAEYcvE6bnX6yug6qqwEaPU54=;
 b=Vy5xcPrLPBB0fa7Ij3g446PCaBu3JV5DXphWZgWRTNsb+SoKfQULaaVXPOWNcQl8RcJ7E318BlZcJzuH2dDJCnJcdheEYBrHnAcxM4nzpXDvpA2MkTjmUelUUtYYNqGch5njrGWES1ZTXp7LhyKFcaDOZHiFwx8ouFLUB11/7c04yCjsC1jlbp5T13LqCnR59KyuvVDZpQleou8PVLY8ScSnstsijhfqLXqUIaMzGt700o+q05eLqcs7KZAfVn/xhIKloTOSwcmVay85Tjm1xhK12mkBIXtiNKkkFc2p1ktvUmxgYRGrYgVPsNjKe9dOQ2KMKL0hQnJO7YfrSsL2Rw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2133.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Thu, 22 Jun
 2023 12:06:22 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::802b:33:561c:4217]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::802b:33:561c:4217%4]) with mapi id 15.20.6521.024; Thu, 22 Jun 2023
 12:06:22 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH] powerpc/64e: Fix obtool warnings in exceptions-64e.S
Thread-Topic: [PATCH] powerpc/64e: Fix obtool warnings in exceptions-64e.S
Thread-Index: AQHZpPxHX38XUC4QN0eGnpqdnLpRDq+WufIA
Date: Thu, 22 Jun 2023 12:06:22 +0000
Message-ID: <11d08617-8fe6-5d5e-866c-5e30517363f3@csgroup.eu>
References: <20230622112451.735268-1-mpe@ellerman.id.au>
In-Reply-To: <20230622112451.735268-1-mpe@ellerman.id.au>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB2133:EE_
x-ms-office365-filtering-correlation-id: 095a7f5a-98de-40d1-d4db-08db731918b2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  oyrtSHv+d7pTRoNzMSHLUqAiPL7cWcvEghwAcYadJnwmw7f2qzJqbYCl+aKg+PlO4CiiagsTRM9bRcBXTL2guZHVfnNJkcWFzbEaIfJljbgT9+ty5hSmalVMs8BWxGlHi3zN7TIXNOeZDacW4HvNp2TfhcSomzSj1xUHUMQfw/CkLKsKRycYnrSFE+TFc+XPP2i7m5vCTbsc61BSb4uQYE+uOTwhkL0zX2d1aPb8mJm/eRgEZACas+BAAghf5VegJM2c2vmwJlLT2xdjYnAxDLpAz+1s0ek7nF6/GWDMQGshxmsRio/OveXHEF7Ps7EHMTAiSEzFkLMh0zqmUb07AkloQx7CouGLOKg8zMV6G4rjcO5bXIt74sv7PuVxeGNQKY/F90TK51I+TSTc+m5ZS507c/ySqUFAvyfsYqNID9MkekKmHJ52G2SNLrDL+M8iF0cTjZfyIqwLY2HlMV5Wch01Y3OvuKs90WU4VbxtmOmGcXMCcW11Xx3oog0zPb6BabI1t5roK+uQyHp1ANX+7OAthcStRNVubmTgxh2cH/UKFz1f+JJ1438ciEG+wnYy9hx9m0wxiM6dEpT2SYayWhzVs8kGrYsa0QG3hwujpmnL+BcHllVkllGmSGNZ+uaUVo+s/sWZ49M9u4VCKjquUbnZVAVACduHk8cyPiipQ/L18tLAB5rRx6ELC5mDFDKkA2COTmABhM0znWLNn0cYsQ==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(366004)(39850400004)(376002)(396003)(451199021)(8936002)(41300700001)(8676002)(186003)(6506007)(2906002)(26005)(6512007)(38070700005)(110136005)(66556008)(86362001)(64756008)(66476007)(316002)(76116006)(91956017)(66946007)(66446008)(31696002)(6486002)(2616005)(38100700002)(122000001)(71200400001)(478600001)(83380400001)(36756003)(66574015)(44832011)(31686004)(5660300002)(21314003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?RGJzYlIzQ2RoZmlSTk00c2ZQZDg0aGlXRjRQb1VONjI3b2xubjh2NjFKOWhr?=
 =?utf-8?B?dituWm1JSElXdTVkcUNGTU51ZjRQTkM5OUtaUUUxU3J4WVEzcUZTRC9vRXE2?=
 =?utf-8?B?TTZzcHZVb0YxT3o3aG5yUlZJN1kzWFNWcHFJc0IrMFJmSXRXRVhUTEJ5K2g2?=
 =?utf-8?B?aTdJck5VVUFUK3JjTnZhNG40UGN5czBsVDNwbkljQlc4T0JkWkI4UU5jVGh6?=
 =?utf-8?B?UEZ2enVHUEFzTHVNK21hMGtKQUJCdS9rbURiemJxeU04UEpmMnlDRlF2WCsv?=
 =?utf-8?B?aHJEc0NyekNBMmlPL2Zrd1NtUDNuSkFhUFFXZEdnODB4dTNPZjcybGZxamd5?=
 =?utf-8?B?bS8rNnBVdENJZFo0TUxBN1RPdTNTU1JoVktXR1pqdkxtQTR2YVNZeXIxNHhs?=
 =?utf-8?B?eDlCZFVFYVNzZHd1Q29jNjI2Tm1vVHBTTjY2K1NTcjNST1RMTk11NlhlZ2pJ?=
 =?utf-8?B?YUhESkQ5VnU4V3IwcmZOWlEwNGNFZEova0F2dk84RFB5dUhMVlVHZ0tWU2dU?=
 =?utf-8?B?Zm5PRks5U1Bqam0rS0RpckwrNStPa3VlaEhFU204akpnSDc4cnI0cnNMUDlC?=
 =?utf-8?B?RVo2Qm9LSEE5NUx2c2ZEQWhoL0E2SjV3UkdxTDZ1ZTJONWNsODdFNndrRjZa?=
 =?utf-8?B?NU90OXhURVpEZjAwTXlPTmlnKzIxWktLVzFtbTQ2ZmJPSm5EYTRTRk5TNzVn?=
 =?utf-8?B?QThnYzlRUjd4eERQdlNJQXVHdEN3TFJ6R2lKMWhXa1M2L3RtY3dmNll5THVV?=
 =?utf-8?B?dWRFd2srT0xvY3ZLeU00c0pyU0ljOThKa1dsYnpyTFp5TnZJcWxycEQydDd6?=
 =?utf-8?B?NFJzejd1SVRjK2dHN2VLaEJlenk2RE11ajdUVHY4RkdGSytvWUpjM3k1WUxL?=
 =?utf-8?B?SUdHb3hEVVYyWDhzSElwTVMwUTVxT3NmUUNFUGVHNjR1TEJsNGZOcjZIaWpT?=
 =?utf-8?B?bjMxc0xWNUFTNmEvQm9vaTBNRVlvNjhzNjBlSlJQMTA1eEhsQ0ZxYkdCYUlj?=
 =?utf-8?B?ZHhEclJ1c0FjTXJKRFUzU1hYY3dLam1DUlBsSi81ZXFZZ2FWOEVGTmFPRGRr?=
 =?utf-8?B?aHNsV2FOdUhIZndJb0ZORndzSmdmVnJ4K0o3d1J1T0pMUGVuemdIM2hDRjl3?=
 =?utf-8?B?aU5ZaXpDaU43S3F3WTdVWFJyQS9FRy9qWEpNQ082d2YvQ3ZKYnVOdS9kRUFy?=
 =?utf-8?B?eGF0aWpKdlBqV1REaTNQS3ZHYTVXY2lMVTJmS2pudHdaY3NqWm1iMEliYjY5?=
 =?utf-8?B?OGllZkZIanUyQTRBQ1ZzWkVrVlh5aG1FMjY0T2EzZGJhT1NVY3FHOWpsQlU3?=
 =?utf-8?B?NDk3K01pM3ExajZjZWVhSUFwN3F6Nk5LK0VvQW84QmZLbnl5VUZoam1WVlVE?=
 =?utf-8?B?OW9EVGhFWms5c3o3RXZXZDVZNkNDWUdISXlnZXZWdVEzMzNhUVc0aVN0Y1Ir?=
 =?utf-8?B?V2VONGVYc2Rla2RzL09IT3g5SlJId1pTRUw1TVBBTFlzQUhGWFJ0NTBzaTJk?=
 =?utf-8?B?enZseExFMktwWVN4cWszZ25HZ3QrQjA5SzMyYlZJdWpLdGdwUUtheXNaSExI?=
 =?utf-8?B?N0xHaFkyZG9udlEyTFpmTFJRaFJsT2ZyVWZDZDVyMzVoTlBEMmxoamhtNVFt?=
 =?utf-8?B?U21jMGd0TXRiVEVmOTFCcUd1bENLTFoxNWcvVWFlWjJHZStzdUc4TzQ5U1FR?=
 =?utf-8?B?UlRtSmRyaDNNYVBCTDFwdUVWU2h5VTRJVnIwRlN6NFdUbGQzVlFFSkI2TWdP?=
 =?utf-8?B?SkNhZlgxYkl5VVpCUnhvdjVRNThsMHhiTUY5YzltdnFNRlNyQ2Z3ZEhmMVYv?=
 =?utf-8?B?akt5OEhDSTlORDNGSHpFMmFsYmhnTW5JMTZDZXZnSCtBNnF2eUFIcVhGaDlW?=
 =?utf-8?B?ZGZ3TE9wRTJ1RVA4T3VtVGE4ZW90Vmcyazhsc1FGbnNzMjlDTzBvQnpBT3BI?=
 =?utf-8?B?cHUvZjVzbXNPY0F4OHVXL1haN2dkRmRpMGNaY05tZ3RDeUtJMzBDNVpkd1ZB?=
 =?utf-8?B?cThZK09PblJsV2RYSm8zU1dKMWNoaVUraDVVQ3Bod016eERRV1lXZHg4Yi8z?=
 =?utf-8?B?elBCQXR6aUpqYS9FOHNncVdRTWphUFArVjNLSVNTWjk1Tk9wSWdPK1I1ZDZk?=
 =?utf-8?Q?S4j+rsUxke0lgpIfNKJozynZl?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DDDA13173931D3418A14E42AE626780F@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 095a7f5a-98de-40d1-d4db-08db731918b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2023 12:06:22.8318
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Du4+FHvbxOxczbw9IQ4odhlddgfCI/3bFMGUm7/p7WSaJ+aun1MGRzMk42s2PfRDu+RqJan6ZzOV1zl4cXjlQ4rMt6RoIYBB9NyDB9CbdXA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2133
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDIyLzA2LzIwMjMgw6AgMTM6MjQsIE1pY2hhZWwgRWxsZXJtYW4gYSDDqWNyaXTCoDoN
Cj4gU2luY2UgY29tbWl0IGFlYzBiYTc0NzJhNyAoInBvd2VycGMvNjQ6IFVzZSAtbXByb2ZpbGUt
a2VybmVsIGZvciBiaWcNCj4gZW5kaWFuIEVMRnYyIGtlcm5lbHMiKSwgdGhpcyBmaWxlIGlzIGNo
ZWNrZWQgYnkgb2JqdG9vbC4gRml4IHdhcm5pbmdzDQo+IHN1Y2ggYXM6DQo+IA0KPiAgICBhcmNo
L3Bvd2VycGMva2VybmVsL2lkbGVfNjRlLm86IHdhcm5pbmc6IG9ianRvb2w6IC50ZXh0KzB4MjA6
IHVuYW5ub3RhdGVkIGludHJhLWZ1bmN0aW9uIGNhbGwNCj4gICAgYXJjaC9wb3dlcnBjL2tlcm5l
bC9leGNlcHRpb25zLTY0ZS5vOiB3YXJuaW5nOiBvYmp0b29sOiAudGV4dCsweDIxODogdW5hbm5v
dGF0ZWQgaW50cmEtZnVuY3Rpb24gY2FsbA0KPiANCj4gU2lnbmVkLW9mZi1ieTogTWljaGFlbCBF
bGxlcm1hbiA8bXBlQGVsbGVybWFuLmlkLmF1Pg0KPiAtLS0NCj4gICBhcmNoL3Bvd2VycGMva2Vy
bmVsL2V4Y2VwdGlvbnMtNjRlLlMgfCAzMSArKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tDQo+
ICAgMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQ0KPiAN
Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9rZXJuZWwvZXhjZXB0aW9ucy02NGUuUyBiL2Fy
Y2gvcG93ZXJwYy9rZXJuZWwvZXhjZXB0aW9ucy02NGUuUw0KPiBpbmRleCAzZjg2MDkxZTY4YjMu
LjdhYjRjOGMwZjFhYiAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL2tlcm5lbC9leGNlcHRp
b25zLTY0ZS5TDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9rZXJuZWwvZXhjZXB0aW9ucy02NGUuUw0K
PiBAQCAtMTAzMCw4ICsxMDM3LDcgQEAgQkFEX1NUQUNLX1RSQU1QT0xJTkUoMHhlMDApDQo+ICAg
QkFEX1NUQUNLX1RSQU1QT0xJTkUoMHhmMDApDQo+ICAgQkFEX1NUQUNLX1RSQU1QT0xJTkUoMHhm
MjApDQo+ICAgDQo+IC0JLmdsb2JsCWJhZF9zdGFja19ib29rM2UNCj4gLWJhZF9zdGFja19ib29r
M2U6DQo+ICtfR0xPQkFMKGJhZF9zdGFja19ib29rM2UpDQo+ICAgCS8qIFhYWDogTmVlZHMgdG8g
bWFrZSBTUFJOX1NQUkdfR0VOIGRlcGVuZCBvbiBleGNlcHRpb24gdHlwZSAqLw0KPiAgIAltZnNw
cglyMTAsU1BSTl9TUlIwOwkJICAvKiByZWFkIFNSUjAgYmVmb3JlIHRvdWNoaW5nIHN0YWNrICov
DQo+ICAgCWxkCXIxLFBBQ0FFTUVSR1NQKHIxMykNCg0KSWYgd2Ugc3RhcnQgcGxheWluZyB3aXRo
IHRoYXQgbm93LCBhbGx0aG91Z2ggSSBoYXZlIGEgcGF0Y2ggaW4gbXkgDQpVQUNDRVNTIHZhbGlk
YXRpb24gc2VyaWVzIHRoYXQgdG90YWxseSBkaXNhYmxlcyBPQkpUT09MIGZvciBBU00gZmlsZXMs
IA0KY2FuIHdlIGJhbiBfR0xPQkFMIG1hY3JvIGFuZCB1c2UgU1lNX0ZVTkNfU1RBUlQgLyBTWU1f
RlVOQ19FTkQgaW5zdGVhZCA/DQoNCkNocmlzdG9waGUNCg==
