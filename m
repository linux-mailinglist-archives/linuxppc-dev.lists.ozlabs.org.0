Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC175E9998
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 08:35:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MbY0P6xpRz3bkx
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 16:35:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=xAAdRvyb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.41; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=xAAdRvyb;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120041.outbound.protection.outlook.com [40.107.12.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MbXzf4qGWz2xZV
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 16:34:36 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BE4rvm5CSGY9aR5MSS8Oc1Z+LdwmPX/XweGidVNINTeqL0bsCDuN/yxLWyQ5Manlx4n53/riL9F2oTWL3hxoz3soGu7eEkidmmB5XxaB8EO02l3/kwl20k/QTyAjJyaiKaL66xu6dOhhqD7MaPTMBej66VcebA32X+ruMBOZBWE6deDzhSXMz0lOdWMOQ69yxrB8uy0xvqRdtT6n4B3YI3Ygj+hxs1mW8ttj1CtRQBMrrOK1Mdd/MQt9TZJijr0i3PSO5CE9gd8Ad4BpvicamzWVlWLewKhOkHRxFAveG1320Pi9Ms6pkepknAfyy2fwPA/XdaQUC1P8opPzXwVkig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nyang3UgXAUbCVvoTYDKZO/KOmkTbn5K1nZIzEFnExo=;
 b=gUG2VPYYSlRNnq+fEqt0pYdMP3FHdn+a9IYkozsTcnqFYNjj6XqVJcsLFgy9/aTZWHfwwbOvPfGuyGnxW9bkg2jeCr9hpjNiSxVgJk47oGH1rOXmWnJfv1IDzlfcG6uJSsOrpQ6Exaiuvp1QZBMRNzkloP8opCJ0lZQ+BAFhlmqqG4EoIEiHnXAcRi+U+rCbdu23SpZob0HSR3yDqSDF1D54DLh7ubdHJIy0hMSXykxXQHyNup0qMwlIQRb21G4x8uUwIAPQD4hfkZbGWJRlnhwYp0tCeBYfAUuKEFapVpngtqVf6FV+eQC0IeIg+YEXnX9qkxKfsCZoz7fhhXeUXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nyang3UgXAUbCVvoTYDKZO/KOmkTbn5K1nZIzEFnExo=;
 b=xAAdRvybXvjQ74Mrg2RS113aNuyQkWmtvTbS7bqlE7MXi6M/iZoyVFvzmaND9tLIy0eou/4R068BD978JoTiBGwBJ85EPt7poFYjLdNtBuhNV/o4FKLbeEdaxwvfI5zPEtLgvIt+BZF2j5ghvKXETUFpRHK27o9fniGPqG5j9ClJ+ZYiejh8JQySD1RgJ4/dXeWFJTZouVLYnk4c6OMK8xnwGmm3V2Ut9JN5R5FKmkUYmztU6XiFqzBi7t/5tJvxbukXEn2oKRKGtcrjc3QzoEBs7GtCUtkqNKxkxZEF7fkkQ2U8Tj//9axN2NmK10xtQsv0K8+1eSPjjQp4LzSZEw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1538.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:14::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.16; Mon, 26 Sep
 2022 06:34:17 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f4ad:3944:a7f4:fcf3]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f4ad:3944:a7f4:fcf3%5]) with mapi id 15.20.5654.025; Mon, 26 Sep 2022
 06:34:17 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Michael Ellerman
	<mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: Is PPC 44x PIKA Warp board still relevant?
Thread-Topic: Is PPC 44x PIKA Warp board still relevant?
Thread-Index: AQHY0JyJEpaHikms2kKuSc3Pv0A+DK3xQseA
Date: Mon, 26 Sep 2022 06:34:17 +0000
Message-ID: <ed43b0d6-d6d4-73d2-b4ab-637f6d2e310e@csgroup.eu>
References: <Yy/hv2fOLzdWOuvT@google.com>
In-Reply-To: <Yy/hv2fOLzdWOuvT@google.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB1538:EE_
x-ms-office365-filtering-correlation-id: 76973936-73cb-4316-3c14-08da9f892308
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  wCNXbZqqJRTo6bUeF/7TnuPNDo7UDWfzR/f+LZzKh4blT9UuNQH9vsZKDP1vrFVIPiEkMiP4VFajpgqvDf8TeRGa+QRdgHXV4/WA6eq9hs/vfOvrR14jtMjlL24WzPlDJAmqF8b5PLstqOu7NH+dBtSoFxEVZ4exlnTsOuW/gW6q5xiHrN7YGZl0MhxCtrwDhMZ0d8czXCMHodZwCS87jr+0s2iTtBHM+n8KaWQ7ToZDYCxiZV4DjXM6NAzOYzpYybWCsU+P6zc8FEJNaL0e74fqaHzo68mqFYHBjgcrU8ZSg8yXIlOMAY4gvG15YnwYT4Ltxjx6MBBxGetxk05/+MVKUvqdkAP9A4zFTbSlVIwJanq7mgx5Xwi0sTStSUuefRtnnR1v2Hd46Le/xlJ6Dp7W0PeMKE2A1eSz6UpeBWpcpsIbKi4gN1JFh4K5x0Z/TTvKh1u4BU+fL6jDy4BVmjhf65UDmPx9mFJHdIFw3SgiCUPYb6FNbH4W7wuM98FwIaRlnPcu+5wjaqn5LfZqyDjpezhC19WW3mjV+qN0NBpjwgjMpAflBaQEUMoCuD97FyWguaeTJOxpMZ1EWvKBe6Bsiqkv0WyAYi4U5tPL5GkqTlQ9qA41d7LoyVVVpPbNQZqITGOp/SCtOvYPNRHnCoNQteqyRPYmuVQ5MnUT8g3BNoizNWppOm8H7yvH5QwAqNSvDtx3LPq+VcrqKfPTUHGkPtWhKBp5N8PKAqEU+E674z15d/4hi/LjLclbiozb7YUMpqqX3dL3/lhBQ4YXwlLDMlr9SepQH9ldPwkcMYCjeIE6VXRkSed1cQ5fEGxDyf97TKtjdqltiNoB461hYGfJ6ZEM/Sq0GAaTFqLP4YM=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(376002)(366004)(39850400004)(396003)(451199015)(6506007)(6486002)(71200400001)(966005)(41300700001)(478600001)(6512007)(26005)(83380400001)(66574015)(316002)(186003)(2616005)(2906002)(44832011)(5660300002)(54906003)(110136005)(66946007)(66476007)(76116006)(66446008)(66556008)(8936002)(91956017)(64756008)(4326008)(8676002)(38070700005)(38100700002)(86362001)(31696002)(122000001)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?K3k1R1dUZzc3NFRiUkpPVWhacm1iem9aWU1JSXBHRWpuUFl4cUxncktHSFJn?=
 =?utf-8?B?cFBFdWJPUmY0K2RCWVpvNThDV3RNdHg3aVNHWHNacTJzNTN5dmJKdldxQS9r?=
 =?utf-8?B?ZjJzcXdoTzg4T2djZzJMd1F2NWhYSkkxd3hvSnBHNGppdFNuUldOeExSeXZo?=
 =?utf-8?B?Y2JZOU1vQ1ZuZ3YzeGZlTU5wa0djZnhUOElFOThBcnVuVm9EZml2SlBmSVJQ?=
 =?utf-8?B?WEI1VkNsOFBRUFZIK21hcTY3UzNhekNrNFcweHhmOE02RlloZ3IwOUNDSkdD?=
 =?utf-8?B?M1lsN3NpNlZ6TUhOVHIvVXNFdVU1dmp6RTdqYWRBbVZla1BKczF3V2kwOENj?=
 =?utf-8?B?V0VpNDdpNWNxdG9pSU1oL1ZnTnp3dExKYlZmcys1SkgzWjNvQWw5RG54Vmh4?=
 =?utf-8?B?SlQrNGJWakQySFkwcGJ3VUJzMHQ3VEVINkJJTjZwSUFpR3ZaT1VMOVU5aThE?=
 =?utf-8?B?elMyUWpDcWJGcUhEd1ZuWGZlVldXUk5pVXJoN2xRa1V5RVNoeHJBWW1lbmh0?=
 =?utf-8?B?UGh6eXlpNVVXVWdvVXdYTEVCcUZ1L09TMTYrTm9UdzdBWm03aEIyKzZUZnRJ?=
 =?utf-8?B?WVo3QmllUjdmbnQ1WmkrTWcrU0w3NnVrWThLQnUvQjJSMC9wY093b0h2TnZu?=
 =?utf-8?B?T2FudlFVdG9qU004RUhZakwzOVpqYzllaXNlM1dTaWh0OUx2WWxKVGNlNTFs?=
 =?utf-8?B?cUxldzRrY3lBTzRpUE00ZkpqUllpMC9iSjF4cGJ5YnA3Y3UyY1pXc3pGRWFS?=
 =?utf-8?B?UjBRUTdqdmtvVnlIQmtEZzVGTlZNQitQL0tGTHdWUUtSYmdiNWV5SnMweFVk?=
 =?utf-8?B?ZitqUi85STFzOVRKN21NMnJpUGZ2dW1MMXkwZ2o5cFc4MFcydUgrQ2VCK3Zx?=
 =?utf-8?B?bzVpM2NyNU1uOUNMZWt2Ni8wWWZpVVlnYUFOb0ZFcjNkUWFBWGtKMnhIVkRy?=
 =?utf-8?B?eVpvdWVQS25rUUtQUU1ZRWtrME01Ukg3VW85bEFnamFnMllGVDRuVXNPekIv?=
 =?utf-8?B?bHVZNTBtZGd5aGt4bCtvbyt6TFVpb1kyWkxUMGFCcExWOHVvdWZYQTJzNWQ2?=
 =?utf-8?B?UUxvUGthcDFKVTVCY1JEZUUrZWNPNjgreDgxZFZ4QktacmJDeUszMkZDRGhq?=
 =?utf-8?B?NWM2YVZhOFBqRUZ1bFdIRjllOFhWM2E5bXdTdGZoRVF6V2xLbEVKc2U4Q0VR?=
 =?utf-8?B?NTNGc2c2dFhvZ3NaeGdsbE11aThNZzZSVzdJbjZONzJOTzBMSE1TeGZhOUFX?=
 =?utf-8?B?d1NUN2lyaTVaQzhZTnVSYjhZc1V1OWdVSEJFdlhjTjNTVThSSGRvNzR1anRI?=
 =?utf-8?B?eTlaTW1mVENvek92Nm1EbGJ5aERCWjdPYnZDSDE4c2dvbThOL2tlOWNoaTNm?=
 =?utf-8?B?Uzk0R25WUURpaDJ6MEJBcjR0VjJvWFpudGtib1RKYUx6Zy9wZEFDN0lOTUFU?=
 =?utf-8?B?dkZUeFB4Kzh5ZWE1dFRCRmtobFlZQ29XWDVMZnQ5WUltcy9ZTis4ZlZ2bEdj?=
 =?utf-8?B?L0JYWkV0cThRTG92R1pBZXg2VGdBWUZxcHhYYlZ0ZGFnbjNBWVJ2QWUxV1U2?=
 =?utf-8?B?REtJRkphRmJBZHJiZGxKeUlSQjU2aGVCL3pXd2hjTW1xR1JOeUVKSVBNWlFu?=
 =?utf-8?B?azFWM1JqRHJKZEtENmpIcmJSQ0E4N25rSE5Ma29HSm9WaFRGSlZIWXFiSFBF?=
 =?utf-8?B?cndReWMrTjkwaWJKclJzZkRNb0l1c2NYVlhlMmFYVFlIWlg0WSt0Um41d0xZ?=
 =?utf-8?B?ZXp0ZHNGRmE2Q2VVbk9MNkM0cFpzSnRadmFtblNIeldHYkljVDM1Vkw4bDl3?=
 =?utf-8?B?bXpEYWlyYlVINWhVWXhKMjBrQlZJUHdzMjVVQi9EOHJ5NWtQK3lra2hac05m?=
 =?utf-8?B?UDNFd2FFWGJRSUw0TmcvMWtRVmRETEhpd3NkRUIxZEpCQ0d5elpWSW8vTlNY?=
 =?utf-8?B?Z09qdmEySVl3N2sveWoyQ2NOdGIxVnZUWk5QbzlBa3JuU1p4eVJUUlIwMFpw?=
 =?utf-8?B?WFdLSzBiYURGS0tQZVEwbXhXZ3NuNnhGUG92b0NDVVpVeHRaNXpKcnR1dFVq?=
 =?utf-8?B?QUxmZ00yZ0VKdnZoUSsyQ2QyWm1SSFRqYy9LWDI3VThpMmNLTkpxdHA0SHhC?=
 =?utf-8?B?THBLeG1yTUVJUTZIQjVyNDV0eW05UFZLTzRlY1ZOWGhkUVkxQ1VPb0JRc2VW?=
 =?utf-8?Q?8KLgNE5jbMwU9pQNoPCpgLo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <721F6152B76ACB4E854AE6DE932D1067@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 76973936-73cb-4316-3c14-08da9f892308
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2022 06:34:17.3112
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ai+mGgHDja5JOtRYf/de74tV/Sv6F/6vNqGCi3iZS0jSzovu9U5nC4EkJDiKDCh1rSMeIVtglrQ+B87sKEAZw5vfPoLZ6JOqHm1rBrFY94M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1538
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "ssx@qnx.com" <ssx@qnx.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGkgRG1pdHJ5DQoNCkxlIDI1LzA5LzIwMjIgw6AgMDc6MDYsIERtaXRyeSBUb3Jva2hvdiBhIMOp
Y3JpdMKgOg0KPiBIaSBNaWNoYWVsLCBOaWNrLA0KPiANCj4gSSB3YXMgd29uZGVyaW5nIGlmIFBJ
S0EgV2FycCBib2FyZCBzdGlsbCByZWxldmFudC4gVGhlIHJlYXNvbiBmb3IgbXkNCj4gcXVlc3Rp
b24gaXMgdGhhdCBJIGFtIGludGVyZXN0ZWQgaW4gZHJvcHBpbmcgbGVnYWN5IGdwaW8gQVBJcywN
Cj4gZXNwZWNpYWxseSBPRi1zcGVjaWZpYyBvbmVzLCBpbiBmYXZvciBvZiBuZXdlciBncGlvZCBB
UElzLCBhbmQNCj4gYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy80NHgvd2FycC5jIGlzIG9uZSBvZiBm
ZXcgdXNlcnMgb2YgaXQuDQoNCkFzIGZhciBhcyBJIGNhbiBzZWUsIHRoYXQgYm9hcmQgaXMgc3Rp
bGwgYmVpbmcgc29sZCwgc2VlDQoNCmh0dHBzOi8vd3d3LnZvaXBvbi5jby51ay9waWthLXdhcnAt
YXN0ZXJpc2stYXBwbGlhbmNlLXAtOTMyLmh0bWwNCg0KDQo+IA0KPiBUaGUgY29kZSBpbiBxdWVz
dGlvbiBpcyBzdXBwb3NlZCB0byB0dXJuIG9mZiBncmVlbiBsZWQgYW5kIGZsYXNoIHJlZCBsZWQN
Cj4gaW4gY2FzZSBvZiBvdmVyaGVhdGluZywgYW5kIGlzIGRvaW5nIHNvIGJ5IGRpcmVjdGx5IGFj
Y2Vzc2luZyBHUElPcw0KPiBvd25lZCBieSBsZWQtZ3BpbyBkcml2ZXIgd2l0aG91dCByZXF1ZXN0
aW5nL2FsbG9jYXRpbmcgdGhlbS4gVGhpcyBpcyBub3QNCj4gcmVhbGx5IHN1cHBvcnRlZCB3aXRo
IGdwaW9kIEFQSSwgYW5kIGlzIG5vdCBhIGdvb2QgcHJhY3RpY2UgaW4gZ2VuZXJhbC4NCg0KQXMg
ZmFyIGFzIEkgY2FuIHNlZSwgaXQgd2FzIHBvcnRlZCB0byBsZWQtZ3BpbyBieQ0KDQpiYTcwM2Ux
YTdhMGIgcG93ZXJwYy80eHg6IEhhdmUgV2FycCB0YWtlIGFkdmFudGFnZSBvZiBHUElPIExFRHMg
DQpkZWZhdWx0LXN0YXRlID0ga2VlcA0KODA1ZTMyNGI3ZmJkIHBvd2VycGM6IFVwZGF0ZSBXYXJw
IHRvIHVzZSBsZWRzLWdwaW8gZHJpdmVyDQoNCj4gQmVmb3JlIEkgc3BlbmQgbXVjaCB0aW1lIHRy
eWluZyB0byBpbXBsZW1lbnQgYSByZXBsYWNlbWVudCB3aXRob3V0DQo+IGFjY2VzcyB0byB0aGUg
aGFyZHdhcmUsIEkgd29uZGVyIGlmIHRoaXMgYm9hcmQgaXMgaW4gdXNlIGF0IGFsbCwgYW5kIGlm
DQo+IGl0IGlzIGhvdyBpbXBvcnRhbnQgaXMgdGhlIGZlYXR1cmUgb2YgZmxhc2hpbmcgcmVkIGxl
ZCBvbiBjcml0aWNhbA0KPiB0ZW1wZXJhdHVyZSBzaHV0ZG93bj8NCj4gDQoNCkRvbid0IGtub3cg
d2hvIGNhbiB0ZWxsIGl0ID8NCg0KTWF5YmUgbGV0J3MgcGVyZm9ybSBhIG1vcmUgc3RhbmRhcmQg
aW1wbGVtZW50YXRpb24gaXMgc2VlIGlmIGFueWJvZHkgDQpzY3JlYW1zID8NCg0KQ2hyaXN0b3Bo
ZQ==
