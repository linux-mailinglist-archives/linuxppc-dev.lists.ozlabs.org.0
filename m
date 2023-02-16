Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9DA698DA2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 08:16:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHR7P2Fpvz3f46
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 18:16:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=JpTOKMY9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::61d; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=JpTOKMY9;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on2061d.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::61d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHR6R1Px0z3bhH
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Feb 2023 18:15:10 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yg4E63E19PXW7EZnXThqXygxf67lAk/y76OWPyDVkODsXheO2+G+iSZOwfg3Bw7UDIWIxfOa1Fsgz+IkqdbNg1vEH7aG0xCBioNpkbsQd2b4GqpTLT1XmkQVjHlVmx/Du9fYArT96ChiZ7ZtcEF39tDDBk7OAtBYWma8KCfMR4UAyOD3gim/bu3sw0IgDOsRURApNDjLWyOtLSzsHG4XuAuaTNfK4UR+XIL0SpH8oijfkQFhEBVko0qNVkSeTH+Haa7cYWOkdGM42uID7Dbw0Adbk4neBoIPlQGYEvEoPFP+YKIDOYr9p4L+MUKMqlB0NqL2lqDz1Icp0LTY/LhrMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M0lT1r/RHXUaTOEqT3vq3A+fSPvIVN4ay0cVJ9El8lo=;
 b=RVeaoNGa1vdp8lI3xkBkeGbphHnSptJZ0UVS2pr9F6gcUOW8GbmAD5sNdRB/SdarnqoPLR/Qo447xYQwX0ejGsc66iv5vxNQmoA3izK0kejhPk7pCOWkGLlLwue2x3I9AnSu3l792ftCv22OVpOT4Y++IYPLpUTvwQkr3ctD1fuZUDOWdbH5B7gkN2dnQdtKlIrHmx0VnTDEYsM8XbqJX5KXhaNvDmIX5sCJ5Vmz4Sw5hqtzg2kJ7KxfXjoBM6tkLELot4+9hI8Ldbtp98VrOPma0H/S7b9SrJOkWzY4mJ03MekaOBTw11p5SMyDKi9mJH210J8tGJUvikATzvyysQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M0lT1r/RHXUaTOEqT3vq3A+fSPvIVN4ay0cVJ9El8lo=;
 b=JpTOKMY9vGi4tE/YrTOBz0tHFKxYj7RtQebTOqL76jLNNy2jnf7veWLxgPJTi2UU+vQuxq6yWdMn9aHv9UQoj3bqhKDEq/oXfHe9XYzeYYMTMq0ark8lrCQmrTOZWkB7tvn0SSJvdO0Db3QMhtKxnbpTGWFO0hzlT/J/v5KjLm7Le30KxTlQVhn7npqls9epK5GrByS4j70dME3XWRZ9mcRuppVbtosjn1K79XnBAKu8DiXki/84WBfVP4kmdkbibEGySjKG/1ytHljCbz2wlNHZEvM198MvGuplR/NH1Y910rJxqgfhN+wVwJ54DEsIMH7PLxp/Yw70QQfEbUKRfg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2022.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:d::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6111.13; Thu, 16 Feb 2023 07:14:52 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097%4]) with mapi id 15.20.6111.013; Thu, 16 Feb 2023
 07:14:52 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Rohan McLure <rmclure@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 2/2] powerpc/{32,book3e}: kcsan: Extend KCSAN Support
Thread-Topic: [PATCH 2/2] powerpc/{32,book3e}: kcsan: Extend KCSAN Support
Thread-Index: AQHZQcUHtgTtChsnuU68A5IHvgVhba7RKS6A
Date: Thu, 16 Feb 2023 07:14:52 +0000
Message-ID: <319e4663-2732-4974-5642-f0c1ef98d08a@csgroup.eu>
References: <20230216050938.2188488-1-rmclure@linux.ibm.com>
 <20230216050938.2188488-2-rmclure@linux.ibm.com>
In-Reply-To: <20230216050938.2188488-2-rmclure@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB2022:EE_
x-ms-office365-filtering-correlation-id: 8f1aa6b0-e6fc-4d63-0488-08db0fed7f68
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  oWAw7R5/8a3Win/3Ki3MBvr/R1a3VUMsTzaBPMu+G1tcI1hcD8+pf7LKpXdpLZ2ywc+BkDVT/1D7gwiDHzr2x8N0uOKRqqLubzqx3Pgn5XZUiqc7FQj0pEFuHj/XDryW1vhktTvlD+wPjeLbz3gsyCTK3q4upvV0KY1R3gDwygUPhZ6BjnMZpnAGndE5E/kWNqiuVPV6LMkt5Fy37S4XX50rRTwDNtK8Q5R4tH8RFGovDE7gWmMZmLD95GFOZEEh969Mg1xXZsnz5OmnC+HVwdRTw1azTyfuR2ojNoTGS14Ovz/VcCCc2HTpefD6o8bdHQzfrpEbiOVPma3THz3eFIjMxTeQXz0jaPcGzs6GyObYZ6GD6ynb/otQ5FUETbjU/vpd+dTFn13s7FV9tVbT0FVwCLljZTp85LQ5GNlTaLnug8uOWrsd+DCYiPrBFP8BXEzSkmp8FYsbh1OETUdwPdCeDDMPOUGlEts9G+XVd/IPYj7ybIJMnf7RWvJDntrwCETpjtI9Q7HMjonH7YTDcSPkMeuu1uNiuNxX+FoygT+Gzx03zFMkbFhBDLcqq0fygBeqZCizx0ep+Hi/arVWusz0Ipxu0oJGZ9yzjZmd4lrQoXsEjllX7i30b3FVBdWoXNOm3u+/FCEuFBpvLblYvk1DLOIZAN9GNOY+5OHXAwJEBRhXrVyrJHGpu3WTcTNUZaPLE2Yo6bb75vDtTBin+Xf+sisxSDYo/4pP1IOP5cL40XPIYRkVKmRvY3CwyrzNSLtDIdgdjtGoFfx9Ciih2Q==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(346002)(376002)(136003)(396003)(366004)(451199018)(122000001)(8936002)(110136005)(86362001)(83380400001)(91956017)(66574015)(64756008)(31696002)(66446008)(76116006)(66946007)(66556008)(4326008)(66476007)(316002)(8676002)(6506007)(38070700005)(2616005)(186003)(6512007)(2906002)(26005)(36756003)(41300700001)(38100700002)(5660300002)(478600001)(31686004)(6486002)(44832011)(71200400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?R2d0RTltNFhsZDBlZTRKQXEwNm5TMVRHNFZQSFVGZmpTY0kzV2JtSGJaY1N0?=
 =?utf-8?B?Z0dmNzlZRjNYUElPRElVWDlHV2RyTjVEZ1ErUVNKdW95YzhlY1JaV1VYblJW?=
 =?utf-8?B?aTNPZFpSSjMwcTl1aTZoWDB4Tjc3bTVTY2tQbGp5MFJHbXhtb0ttdEhGYXll?=
 =?utf-8?B?UUljeFJmT0Yzek1JZ1NRbSttUk9iS0NHZjdFNUxZUkZQV1BWWUl6WlZ6ZStK?=
 =?utf-8?B?OU42aVp2WnN5cGNwOHZsbmlPdk1BUzdaa2gvYVl2U2pWMTRsUVp2ZXViWm9u?=
 =?utf-8?B?a2l0TXJyOXhtaDhZa2JrR2pLeFRYRUpaQXJMM2VWQmlZZkVUUFAwcC9wTDZM?=
 =?utf-8?B?cFo0TTZ2Y2R1ekhFZ0NMT08zNzc0R1FGLzFPVkRYRnJzejlMeUI4RVY4TjM0?=
 =?utf-8?B?MkhFOE5ySjkzL3dyOXlLWG1PeEpFa2ZQWTBrYnZQcFRHQXlybGYrd1FiSWhW?=
 =?utf-8?B?U3JYWk5oeDFudkozeXZIZnZzb3A4N3FiYzJibjZwR0lQK1JiVThFOFJ6TGhB?=
 =?utf-8?B?M1V0WW5DeGZ2TXdFbjJ2aGt6MVhmWFROZ0p6THhIaDJiTVFURmUwNnRZOFND?=
 =?utf-8?B?NnRFcFkvajdUK05BVENJRGxKZGRLZVhZWXc3bUU3UTlVWUowcTlMbHJyRnZ6?=
 =?utf-8?B?cEhZUFFFdFZRNFFyby9jekZFUVBDbGdQZzI1YnM5ZUZiSjRzMEF4cEJ2TXpX?=
 =?utf-8?B?dUZaclFDSDJMNjBEcUVVVDZmSVZ1MDZPcklONGQ0YTRDWGw5M21JZjN2VVFF?=
 =?utf-8?B?eFdFVGtROW5kZGxETHYwR05ORndlb0pnRmg0TUVMTnhiUEYyZ3NFZzJVd3du?=
 =?utf-8?B?UE80ZWJqSDVqT2h2eXBJSXcwOUNsa21qV0cxYTB2cWs3SW5PYy9zeTRCd0to?=
 =?utf-8?B?V2dwelowUUVNdVF4dlVsb2hPNDhyTmRFWSs3akxvUnMzelQ4YWhNVXZDa2Mz?=
 =?utf-8?B?MGoreE8wT3dKMFdXcWxrSVFTUDN6cXJqOE1FbHF1eE9SVk9oZDlnU1F1S29E?=
 =?utf-8?B?dHNtdWJPMlc5N2U3bWlpNnFiRlZVZG9tQ215UW1XU0tEOG5jQ0s0MTd1cE5a?=
 =?utf-8?B?REZxTDVlVEVRMzhHaVE3ZGFCZjc3bm9aMFhvWXFhYzZocDY4RlZQb3lYKzV6?=
 =?utf-8?B?ci9JZ1M3bUFUWTdHTStGdlE1dVFDM1EyYjJnTXlwR21HSUZaWHdqYUxPbks0?=
 =?utf-8?B?R2hxQmcrNkFVa2g3MlZFb1VSYy90UzFGNE9pbk5aTFg2dVY4R0hwVDMrRWJl?=
 =?utf-8?B?b0RVWURyZjBsY2MrQW5DeHRsN3Q0SmsyNC9LYVpyQzR2MGkwOHg0eFNIMHpw?=
 =?utf-8?B?bEQzU2FKNWo5bFkyRjhleldrYWNKRGZqS1FYbXcwNktFVmU0R0dmR2ZKQkpv?=
 =?utf-8?B?QzNjbjIvS3RSaExjcm5Gd1lMb3VBdzhGMEZ6VVBkK1BxaXZzeEF4RkFHVS9M?=
 =?utf-8?B?eWh4S2paY2FvZjJxZGs4TThzWHRuWi9aZ3BNNzRlRHU3bktIZHhaSjJFNS9C?=
 =?utf-8?B?ODc4TGZoTytNczRuOHBsd3lNVk1pcmF1SGdmVzlFam9XeHRVYkRmVCtqWGNR?=
 =?utf-8?B?b2JiR29mbWRienhjcW5LekdkeDN4MlRxb2NFNG1Bd0NMVFhQdDVhSzdwYVNM?=
 =?utf-8?B?T3JpRDB5Y0VnV0FRMDdpNVpmbndXT0tmY3BvT24rVm5WUi82VG4xd253Vzkv?=
 =?utf-8?B?RXYwZUI3WER0UXFMZkdJSVlYMlRlaGVrZnp0ekpOYjNqZ2ordDk3N3M2clpT?=
 =?utf-8?B?c2VYUHVoTkhBN3FXUk1idjVobi9OQ0FiMlkxVWJUdzRvNzhZTTA1VFZpOWVV?=
 =?utf-8?B?UDdLRUFBOFlyZks1bitFeWFTa29sa1BkUUF4MTBkN1V0V1dlc0hwM0JJZC9S?=
 =?utf-8?B?bUhrUHJramd2Z2NkWDhrYi9sdnkrT2dYYnR5NHMzRjRxSDN6bTJsaEs2ZXRN?=
 =?utf-8?B?MDMxK2grMjlpVFY2c2dqVXkxVG8vVllFQlBSbnROdXZFTGRsc00va1FvM1U5?=
 =?utf-8?B?WEU5MWpZUDVQcEdlVGJVOG8xYUFsRVhYK3VhRFk1bW54cVNxSytYaEVrdTY3?=
 =?utf-8?B?WXAwWkJTdVpkeTVMRW9yazNiZEpNTkhFeWRZVzViYWtUNk1lOVpra1NUN1dz?=
 =?utf-8?B?VzZWaTVnVkpOMDNwZlB1K1A2bFkvMmNjYUNIbW15YkhTT2ZDS0U1SmgwN25r?=
 =?utf-8?B?VUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0B8B79587971C34A8E98481FC50AA069@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f1aa6b0-e6fc-4d63-0488-08db0fed7f68
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2023 07:14:52.1933
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Uua2PIDrCWEo6I0Il1C6P6K7PD6BKetOjp7pvd9Yk+fMo+Sn2mIFnfrbjRy4EtJ7wSfFk7eLCweiCUiv8ZQMEb1SCXAODa7qPkJgrZv0cRY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2022
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

DQoNCkxlIDE2LzAyLzIwMjMgw6AgMDY6MDksIFJvaGFuIE1jTHVyZSBhIMOpY3JpdMKgOg0KPiBF
bmFibGUgSEFWRV9BUkNIX0tDU0FOIG9uIGFsbCBwb3dlcnBjIHBsYXRmb3JtcywgcGVybWl0dGlu
ZyB1c2Ugb2YgdGhlDQo+IGtlcm5lbCBjb25jdXJyZW5jeSBzYW5pdGlzZXIgdGhyb3VnaCB0aGUg
Q09ORklHX0tDU0FOXyoga2NvbmZpZyBvcHRpb25zLg0KPiANCj4gQm9vdHMgYW5kIHBhc3NlcyBz
ZWxmdGVzdHMgb24gMzItYml0IGFuZCA2NC1iaXQgcGxhdGZvcm1zLiBTZWUNCj4gZG9jdW1lbnRh
dGlvbiBpbiBEb2N1bWVudGF0aW9uL2Rldi10b29scy9rY3Nhbi5yc3QgZm9yIG1vcmUgaW5mb3Jt
YXRpb24uDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBSb2hhbiBNY0x1cmUgPHJtY2x1cmVAbGludXgu
aWJtLmNvbT4NCj4gLS0tDQo+IE5ldyBwYXRjaA0KPiAtLS0NCj4gICBhcmNoL3Bvd2VycGMvS2Nv
bmZpZyB8IDIgKy0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvS2NvbmZpZyBiL2FyY2gvcG93
ZXJwYy9LY29uZmlnDQo+IGluZGV4IDJjOWNkZjFkODc2MS4uNDU3NzE0NDhkNDdhIDEwMDY0NA0K
PiAtLS0gYS9hcmNoL3Bvd2VycGMvS2NvbmZpZw0KPiArKysgYi9hcmNoL3Bvd2VycGMvS2NvbmZp
Zw0KPiBAQCAtMTk3LDcgKzE5Nyw3IEBAIGNvbmZpZyBQUEMNCj4gICAJc2VsZWN0IEhBVkVfQVJD
SF9LQVNBTgkJCWlmIFBQQ19SQURJWF9NTVUNCj4gICAJc2VsZWN0IEhBVkVfQVJDSF9LQVNBTgkJ
CWlmIFBQQ19CT09LM0VfNjQNCj4gICAJc2VsZWN0IEhBVkVfQVJDSF9LQVNBTl9WTUFMTE9DCQlp
ZiBIQVZFX0FSQ0hfS0FTQU4NCj4gLQlzZWxlY3QgSEFWRV9BUkNIX0tDU0FOICAgICAgICAgICAg
CWlmIFBQQ19CT09LM1NfNjQNCj4gKwlzZWxlY3QgSEFWRV9BUkNIX0tDU0FODQoNClNvIHRoYXQn
cyBhIGZvbGxvd3VwIG9mIGEgbm90IHlldCBwb3N0ZWQgdmVyc2lvbiB2NSBvZiB0aGUgb3RoZXIg
c2VyaWVzID8NCldoeSBub3QganVzdCBhZGQgcGF0Y2ggMSBpbiB0aGF0IHNlcmllcyBhbmQgaGF2
ZSBLQ1NBTiBmb3IgYWxsIHBvd2VycGMgDQphdCBvbmNlID8NCg0KPiAgIAlzZWxlY3QgSEFWRV9B
UkNIX0tGRU5DRQkJCWlmIEFSQ0hfU1VQUE9SVFNfREVCVUdfUEFHRUFMTE9DDQo+ICAgCXNlbGVj
dCBIQVZFX0FSQ0hfUkFORE9NSVpFX0tTVEFDS19PRkZTRVQNCj4gICAJc2VsZWN0IEhBVkVfQVJD
SF9LR0RCDQo=
