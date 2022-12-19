Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 497A06507C0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Dec 2022 07:44:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nb9Cq1DFCz3c9T
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Dec 2022 17:44:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=eW9r6+h1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.48; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=eW9r6+h1;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on2048.outbound.protection.outlook.com [40.107.12.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nb9Bq4NK6z2xGH
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Dec 2022 17:43:13 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PMTVVhYgNZgr2C4H2FgqQOec/MFH35vHXJ5D0YVQlWUXZOFGMdXN4NMZ0mAXfu7K+P/+fc23qXVxy3zCosPjnZZB3S1mtd6lg8sl9AAo0yeRj/BMASqua3ZM3lCtunuWzjUUl5+/gGp0o8gXvYD4w63rSeMh2ngk+rdz8odF5H740EkKsCfIgiFfIge7TE6nDwihJAZlTQoyiqs1UHLqN4/shitLvrxXuFXbfJJetdGqYuQ3Qp/Gl5FogEJHtOrlA88vUArfwk3kEHXQjr2yMqxvYNC2Z30I/ZshytG665qAQZ5izHx1RPU8pa5022n5GYZvtLcMaFR7A4BwftODlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6yx7htsFUsREX/4BGtU4RBH+QtJK1tIhRgnCTormc54=;
 b=U9csetoUi3VHp581I7wWpzjfSYJJJdoDaCJVUhhYPaFghonpGv5ZPy7cAGnIUhK0n+bG/Hxzffttp/SxODeUA59gvsZUy/OOM5H49XJK1GpPIEL1qyyfqwpASQrAdK4ZMu+XKTvqLobnD8UZpoa0RrnRGIxvsCjB/gq16VaZy7wyoXcT1b8gj0h/xXX+839RcsPsdwCNdx7ZZYzfyAfbQ8A2NT4BtO8jiPK6Pjgi7dEEqr1iLsRK1y2RunE8YqxCts2grYMuWYKzkq2RFyhZuXqTBqW7D9mK5VRr1ZJgOXClubgV+V0OIqZvnh9VzOYB5ONLlAv5klBGy2hoMA8GEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6yx7htsFUsREX/4BGtU4RBH+QtJK1tIhRgnCTormc54=;
 b=eW9r6+h1q34yjh3oP6vTbIhH+vJ09m9xAkIIx1dZPy7sOkRcFskeQXDaVMLK2nlM/YrsnrHJNXrlckfZhGlf+lTNCIzMY8OUvqiNY1G7M87FVDF3AAtZdW+NQeg6A/Y2hTKg7h/Z+vCMP8TlKkKKTXHgm+D+3tK1eQAinR3aYSK9vUaL/jo+1yvj699BaJ3X44aDz270n1Kv7mXVcRQTXJ6F6OOOE/1PUW7N4jO/YFUI+pyp7TU7o2zB4yzu18sPT2IzXSUXk2qllA07JNX5mwk59HXmt+chPIJZojjBOk7rp/Xs5Payrd1Hg2sYi9LINKa69Y7Zfaw3nyjOFUmThg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2485.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1e0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Mon, 19 Dec
 2022 06:42:53 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8e8b:856e:12eb:ff9d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8e8b:856e:12eb:ff9d%9]) with mapi id 15.20.5924.016; Mon, 19 Dec 2022
 06:42:53 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Li zeming <zeming@nfschina.com>, "mpe@ellerman.id.au"
	<mpe@ellerman.id.au>, "npiggin@gmail.com" <npiggin@gmail.com>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] boot: simple_alloc: check after increasing memory
 allocation
Thread-Topic: [PATCH] boot: simple_alloc: check after increasing memory
 allocation
Thread-Index: AQHZE1AzNOD8Sl1IIEaoEgwmTxa0ja50w5yA
Date: Mon, 19 Dec 2022 06:42:53 +0000
Message-ID: <107b0173-f0b0-adfd-10e2-e5eb76e91b92@csgroup.eu>
References: <20221219021816.3012-1-zeming@nfschina.com>
In-Reply-To: <20221219021816.3012-1-zeming@nfschina.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB2485:EE_
x-ms-office365-filtering-correlation-id: cd02ab3e-d263-4fce-dd73-08dae18c4152
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  01QxsQH/FBKJLZXtPr2VpTdFlg5GXzlVcfX2a1RIDqxVxICUOfOjqfKDDFv1CcSCwxXp0zMYBDX15ykRuIKZNcG7lIqm0Mz4uLHAY7Iqg0hGKurtrxp7nnBM+f9Kb/jKD79GMH2EDJyjJQ7muUbpHYzG93zq+3z0HuhLLdQPLhCqTEg9wkorCP9aMU+HVDD4hOzsX21BgHp6Ck+5sJA45jfcUNPGAY009Yh8dy/bkGoyipEha1Hatt3JXttbyuFmui1irlWgGWRpr09Sk0KDCeEUmeLNEqsOZ0siIbXzSnq8oLcNsVgbkyBcOtPoCctbJFt6w9dAOPFMZw7gm/1zAdcM8sjlx97Uq77owX0zlhYTNohC9SR4QhIqen+igxrzHnm8t0dyoOXGidLnbJP8spvWRcexPC7oZV777Q5RLA0PsVWSWPPU0ajzb8USgoFCGpGQUG3p3ibz8Ktbq2UItFTlioni0uECYPZBWRgiEUY7bomy4lFqAYBqz9VzFylKT4SAJFLQ85rntyGfAaGAjcH55T8vkv2oYpr/zZCys5/ms+y6gUjN0EGxoxewZVTF9rwUncdi3PErqh1NEm50yhYmSaDvLf0pko0OzXfk8km4VaQj3u+jTMommDQMsiqaEcVrj4kRUIafyc+OSxFfAFeVCJ6bWUwhNg5FjmZ381zP/aXQ1R+0NTU1UORyZmEHCnJVpP1idrxNtJ4bN82Yo3OSXQd866bimQOr7dMtePiKmValAfR+Aec7Ua3leV7I
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(376002)(136003)(346002)(39840400004)(451199015)(38070700005)(36756003)(31696002)(316002)(54906003)(71200400001)(6486002)(478600001)(110136005)(2906002)(5660300002)(44832011)(4744005)(8936002)(8676002)(66476007)(66556008)(66446008)(91956017)(66946007)(76116006)(41300700001)(64756008)(4326008)(6512007)(186003)(122000001)(38100700002)(66574015)(2616005)(6506007)(83380400001)(26005)(86362001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?WldoT1RrS3FxUFU1SmNRSE5KMWRsZDV6VW9sTFdxRG1XZGFkQzFjWXJhUFJQ?=
 =?utf-8?B?WUdMQlRHR3ZSWEh0dzJUaHNINllWeVdqWVMvNVBTTFJkM2lnUFBmUnVTSjhj?=
 =?utf-8?B?T1pnZzlsK0tTOXpnbkFDOUo2K1ZvTnZGWVp2MThhZkxsNmJZVVIra1lYdWNZ?=
 =?utf-8?B?Y0F0eUpkNzdDcjMwemJEOTJEai9tMlRsV2gyWnE5aFNRcU05RlY5SHRkS21M?=
 =?utf-8?B?UG5GZTNFSGtjbmZOQkxnZCtqV3JuWXdWN0FydVFWcWVsWWpSc1FoZDhvZzln?=
 =?utf-8?B?NVJJRWZvVk9WOGFWNFJaV3NNUFJLRnBrYUNTMnlUUGNnbU1WemY2TEhpT1l6?=
 =?utf-8?B?YjJWRUV0QjJVdm9hZEpJYjUzVUFSRU54NlVvTzhKbWZ4N2FyKzZCdkJpWWN6?=
 =?utf-8?B?SytVdzRJMk9VbGc4cTYvQU9OUEVXZkgzM0F2RTA3RWtvR1E0TXY0cG40RW1J?=
 =?utf-8?B?ZnNDS1ZxMmhrLzNuczZpOXd5NDNPemRTcmI3Ti9NcEVrQnlsampITmloTWsz?=
 =?utf-8?B?cE8yYzdTUGVYR3NPdnp4UmZrT1NOWE1BNkdjdzBwdUtZWTl0SFBoUjNSRzJY?=
 =?utf-8?B?dklERzRBZmNJWmdlVmJwNmQ4NDU3YWNRUEJyeUc1MCtHSVZYQ2YzUk9aQkZl?=
 =?utf-8?B?a2VnTXQwZUhhWTZPbVdLdnFXYThBZ1lvNExCN041STVseUEvQk05T2tMK2s4?=
 =?utf-8?B?UmZWeTk5Slc1L0FtNG9hcEJSK3U3OUcyM0VBbmE5Wk0rWVNUYm04djlJMkxo?=
 =?utf-8?B?RWJ3K0Mra3dFQWZMZWVyQ0ZOSVQvR21YU29RRlo0ai8rbHBZNHpaeUx4L1Fn?=
 =?utf-8?B?Q1poN091V01zZU53dENoZnB3alpjMlJ3TVc4ajRXTTh2V0ZxNkxzREduTDVO?=
 =?utf-8?B?ZmQrZk1sVG82MFNyRVVYSk5PVHpidnRzUC82RDg2RFdqd2MrbjhhZjBuZFFP?=
 =?utf-8?B?RGVtWmc5THdZY1BQckMxZjk3MGtrRDBIMG1iRWREVGU0bTVUUXNJYVAwZmw2?=
 =?utf-8?B?OCtwZFUvTDVEaUhCaGhRRFpDazlWbFhXVlhDNnVDZXlJYjM3Zm0xbENmRC9m?=
 =?utf-8?B?bUIraVg0bFc2UmtqMUp5RjBHZmNOZ21ydWVac2t2TGx5eEFsUGh2Y0xlUnBS?=
 =?utf-8?B?Zi9GekI1S3JzSHZtbDJnSXdGejYyMFNPTXpIZEwzdmdHenhWNUx5VkRWRzJJ?=
 =?utf-8?B?Nnk2bzNYWHZYSGpzQzJWR3dpbktMVG9CcTlkaTZzMm5Id1VPRTJRcXZUZm5l?=
 =?utf-8?B?R1NlQ2g2ZnFlT2ZyaVF6U2VFaVhZcVFrNExnOENKdWVYZlV1SENXSUtmbW01?=
 =?utf-8?B?bHVSeFVoRTVCbnhMRGtGczRpM3JtUG9aRmswYUJ6ZXJocjl4L2pGOEY3YllF?=
 =?utf-8?B?aGRWZll4ZHNYVEpWS0tNR3JIeGwrbU90aDhUM2xERnRwblJFcmdEOGdzeGZw?=
 =?utf-8?B?YVIwMjZ2TEc0M1dub1lNL2hIeG5jUmU4UDB1MUMzU05UMEx0eDV2a0tteEY1?=
 =?utf-8?B?VisvU0NxaHM3U2ZuVXlGM1k5YVU5bEI2azZEbjI5SWtTK2lOV0I4U0pDU051?=
 =?utf-8?B?STZ1aEwzQ0dCSVU3T0VkeFRpVTN1dGNQdklxdUJla2hZRm1zZ2oxRGVQcE1W?=
 =?utf-8?B?RVdsd29yU0U4N040VElkK1pBbVQrNnAyS0FkNjdEdUV4UVVjcUZTTkIyakNq?=
 =?utf-8?B?OWZNZzdLNm55L245aXJUa3kyT3orQ1g5aTZiZFgyQ3N5Tzl6QlVHTURBa24w?=
 =?utf-8?B?cWxNWEtGUEZPcE1NQnozSnFNZDlLS3hadllKTm1ocTk3dUZHalhCRjFyTXQ2?=
 =?utf-8?B?ay9rSjd2QXlyTEpZNTZZQzJLYlh5UWNUSTdLQzJtNWhtTjRPMEpUcVVjbkJx?=
 =?utf-8?B?QnJxYkt0U2pNWmErSXRwTVZUVGF1aDFQOENwY0ZwdXAzcGNIVEtiSGlWQVlH?=
 =?utf-8?B?U1M2VmxjNWJJQkh3Lyt5YWVaZXFENnBmbThtejdIaWhUZ3VzQkFyMlkwbXV0?=
 =?utf-8?B?SWFIUkJmWXV0c0RTLzIxc2xBV1RqYlBsdDRITWZXcFJRcFlmUGlXRmdNMzdu?=
 =?utf-8?B?QlJxWDJyM0p4L2lMMjIvZWQzZzEvTGFoalNpVk95VU50YU45cWl2N05PVUtz?=
 =?utf-8?B?WE4rM1ducTlyK29YUEhaNnBwT3ZnZXRiUzdmeTE5SHpyVXp2S3Q4MnhqdzFZ?=
 =?utf-8?B?K0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6DE0BF887C30744E95AF62D7732CE0C6@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: cd02ab3e-d263-4fce-dd73-08dae18c4152
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2022 06:42:53.3342
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pEuSFrbONjub0BtHxnM9uCrunJviA5zRGAepGJuBQN2qS1xONEnq+Hk7PSH+TWoYx8RxP3afK+zXVM7q3OVY9W8naJFRiC8HKU0lAgjTxGo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2485
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE5LzEyLzIwMjIgw6AgMDM6MTgsIExpIHplbWluZyBhIMOpY3JpdMKgOg0KPiBUaGUg
cG9pbnRlciBuZXcgYWRkcyBqdWRnbWVudCBhbmQgc2hvdWxkIGhlbHAgd2l0aCBwcm9ncmFtIHJv
YnVzdG5lc3MuDQoNClRoaXMgdGV4dCBpcyBub3QgdW5kZXJzdGFuZGFibGUuDQoNCkRvIHlvdSBt
ZWFuOg0KDQpzaW1wbGVfbWFsbG9jKCkgd2lsbCByZXR1cm4gTlVMTCB3aGVuIHRoZXJlIGlzIG5v
dyBlbm91Z2ggbWVtb3J5IGxlZnQuDQpDaGVjayBwb2ludGVyICduZXcnIGJlZm9yZSB1c2luZyBp
dCB0byBjb3B5IHRoZSBvbGQgZGF0YS4NCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTGkgemVtaW5n
IDx6ZW1pbmdAbmZzY2hpbmEuY29tPg0KPiAtLS0NCj4gICBhcmNoL3Bvd2VycGMvYm9vdC9zaW1w
bGVfYWxsb2MuYyB8IDQgKysrLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvYm9vdC9zaW1w
bGVfYWxsb2MuYyBiL2FyY2gvcG93ZXJwYy9ib290L3NpbXBsZV9hbGxvYy5jDQo+IGluZGV4IDI2
N2Q2NTI0Y2FhYy4uZGI5YWFhNWZhY2UzIDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMvYm9v
dC9zaW1wbGVfYWxsb2MuYw0KPiArKysgYi9hcmNoL3Bvd2VycGMvYm9vdC9zaW1wbGVfYWxsb2Mu
Yw0KPiBAQCAtMTEyLDcgKzExMiw5IEBAIHN0YXRpYyB2b2lkICpzaW1wbGVfcmVhbGxvYyh2b2lk
ICpwdHIsIHVuc2lnbmVkIGxvbmcgc2l6ZSkNCj4gICAJCXJldHVybiBwdHI7DQo+ICAgDQo+ICAg
CW5ldyA9IHNpbXBsZV9tYWxsb2Moc2l6ZSk7DQo+IC0JbWVtY3B5KG5ldywgcHRyLCBwLT5zaXpl
KTsNCj4gKwlpZiAobmV3KQ0KPiArCQltZW1jcHkobmV3LCBwdHIsIHAtPnNpemUpOw0KPiArDQo+
ICAgCXNpbXBsZV9mcmVlKHB0cik7DQo+ICAgCXJldHVybiBuZXc7DQo+ICAgfQ0K
