Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 636FC5A5BC6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 08:27:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MGy5L5Vp9z3c6X
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 16:27:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=UFmrgB4w;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.41; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=UFmrgB4w;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90041.outbound.protection.outlook.com [40.107.9.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MGy4Z1kPxz30Qc
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Aug 2022 16:26:19 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cItxVU+Jxjd3S3u7tfwKI0YNuoqzzkSCyR3QGbQvUqTDAQ/4NGppsNeNa2z5sJ8pvENRLpRb498SN2AthsPcCqn9o0xIFyKA0A2XT8573A6JdRjp0/BxgxfdillKD0AkcUdjmvy1VuVwJoau9hVVmVWZnZrjgGY9Dcu2ayMSYi/by8Jx8Hw5v1jaQIZa5iPO1jLmwSLif/0blvPF8JIEyBWEVc014fh1T4uy1o63JFHIf5HLrLbTLOaxdnA/uIIFe45NEAOCn9/+nuyR4mQeRY8B9MI+VRWmjIV+mP011IZHUwcGQarfoxI1b8ZwxuK8axdm1aR0CYVwDRvgGb1sfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QD0p+2hrSZtSC8tgd+Oku2/Afr3iYhexe8gCQFAYDlE=;
 b=Pu7u7+ivSkT2PfBLwGLseNXRckXlF4X5rwdCcuMQGiFRypvl7ZcQ9yqZESdVaELfZJnQslfZPNUoPrJrLxnq91tunzMXd+Yn6MNrJe/DEhuqMq++XhZjiFkd5xCOk+g7fuvGYX1kt2gA73aypstQPXM+gb3CMQF2syyAMf5qDMbmRsNj4Defbu/WUzPWFs1Df32PBtC4IBEWRaLp1SwA+4O8M6RfDVWb1vuftYhC7KikxTmr8Y8XrwzuSn59W6bawtNhOI9jFYQeVRgdlEAIFZMfwlaLzpdMcbRUKH+jH1zNpUudl/hjCqdhb0h8SdEjdkdONuLN/Fd37830lv0HmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QD0p+2hrSZtSC8tgd+Oku2/Afr3iYhexe8gCQFAYDlE=;
 b=UFmrgB4wwCl/RNT7IHbvSEk24QCBmjuEiSLO6d8/xEtrb2hZQd63QH/C8dO4uUhopzgV6P6tFMQMHAxzYrC4LG7wFl+A1B1YsW8jffi3CvBj3NaWrc+6j9niLtprhbZCmqdAXemr6JbpJ1xaxpToY7sXuzt1kSf/6SEeFMuk8SNzbCkr+4hV6SNLJCP46fkSf4uwMLjRdBVl7+F2gMjBv3Dfz2PVo2R1f5ZjcKfyVacEWFv8HVmWrHmZ0ir6mjj9bfOGdjtAGaFQO8EMCjf3Srbys+eutpEg9zCAMizEG2yImeeBoiCfQ3LpzM+9nfF0UeDGeBnf6Mw84T22ahA++Q==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB1695.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1b4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Tue, 30 Aug
 2022 06:26:00 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8%4]) with mapi id 15.20.5566.021; Tue, 30 Aug 2022
 06:26:00 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Sathvika Vasireddy <sv@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v2 04/16] powerpc: Curb objtool unannotated intra-function
 warnings
Thread-Topic: [PATCH v2 04/16] powerpc: Curb objtool unannotated
 intra-function warnings
Thread-Index: AQHYu2uaWlD+gbLK2EOMjEZQeWAbiK3G++WA
Date: Tue, 30 Aug 2022 06:26:00 +0000
Message-ID: <8d32fdf4-578d-c762-9aa5-42d0e2a3d51a@csgroup.eu>
References: <20220829055223.24767-1-sv@linux.ibm.com>
 <20220829055223.24767-5-sv@linux.ibm.com>
In-Reply-To: <20220829055223.24767-5-sv@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ceeb59e0-db4a-400e-b3b4-08da8a508195
x-ms-traffictypediagnostic: PR1P264MB1695:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  XcLpBol4i6gwe4Gvk5pr6Z2NNZMzNNkfthqjkOuo+DlbXviSMF2hiz6fizsGQOuu78Knvmkln+PlxMmuJvzQICCcWTVQWfYi1OI9ENWpnIRNaxXjfJxSnRkOhlLd9FPAabsKbSYYvKyRvDXNXwh95nMLtG/i3sL0zxxVhBOKbUH8w23Ble49uSs2ho7MhLL13Gkp8PBJxsBRPrx7MrV44BUVYhQ78BhlJAFJ+FcC6EBEXv6e3ig0JlBFNOhbke6dYD0dmokOM81supaDg6CKjxoMzyvpSqVCHf2Ee+Ub5Yy3YWbMkgUPziE8rxYrix2vhZ1R9wmBwZxVioLJtpWMYjYeRqbHnS7XzDLUNqHl9vullrkYWT5YpAFTvvV475NYY5BBs/xj/v/7cg9fHFmMck2RY58HzZlLEi5kTYKX6UaFn7BSwbfE+Rwian0i7C/Q41EtndEgle2BTjcnjq7jdAvz0SBe0fe7vRg8VxycJg2+DjBz6Uq4qVwVLkucDFpho7r882Om8Q4oX7Aedj6g+LbyocRd8CHokIHZ73rKcW6aVEbtGhur1i0Z5LO2nazZDBoIhU318sULt7b0awvagts5xBIUIEET8rYuAqrRpZOWClQlZ6CtHaTgHGGIQQAlzqvtfMS1jflo5sC1X2te6EhTD8zdwx2K60uSWFDebgxTXsvEzf7r0AJFBrNwkxM1jAC3q6sIgtuRXtPSXpS+h2MIKBGJn0/AnAoCR14Fp2tZ7l20BswgebXHs8El4SqTmeJ0lAXqQNcN2CkcBEAlYMlvAZRuZWDGGr7h5HZwVHYyIG70T7366+4dQ0FH3ffq2h7j3JKTidiayvUUDZs6Og==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(396003)(136003)(366004)(346002)(39850400004)(316002)(54906003)(110136005)(66476007)(86362001)(66556008)(6486002)(8676002)(76116006)(31686004)(4326008)(66946007)(31696002)(66446008)(71200400001)(64756008)(5660300002)(478600001)(36756003)(38070700005)(7416002)(41300700001)(8936002)(44832011)(2616005)(122000001)(26005)(6506007)(2906002)(38100700002)(83380400001)(66574015)(186003)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?VTlMYXU5WTVqZnBhMzMrMDhYVTdHbnBNSlV3MW5abXdkOUpwdGVVQWFBbS8y?=
 =?utf-8?B?KzkxcHlUK1hrcDNNdWpjNFZPWmd4SzJpbWhkenlDVlhMNGNuTHNNWFE3dGRk?=
 =?utf-8?B?QTNuNGdSdU1UMm90NWVzRGFwM0NMZHhvN25xT2FXUlBIMXEzRXFpMEVuZkRw?=
 =?utf-8?B?Y0IzanJqVHpoaWtYSk93RzZCTmFrS1p5bEtXTG50ZmNEanl3Zk1NTEZtREtu?=
 =?utf-8?B?TWZ3WWhaaS81OTFDNXdPV2hsOThHUkJPM0FtU3JQZE0zSzl6Q2dLbmFXNG9D?=
 =?utf-8?B?Y2d4OHBCeWRGV0grVVdCWW1ySnRWM0JWcnJrV1dOWjJaL3Y0Q2tHSFpWbmN6?=
 =?utf-8?B?ajFZanlKdUM5eW5ZU2x1NERFUkFVQmZmSkFiQ0M3eEVWVjIyd1VQc1AraUlP?=
 =?utf-8?B?MjFjSENOaWV2SFVGRlU4M2Fjd1M4TmhlNmx0YmxPbTc4T2lCeHFvZHlCU1pz?=
 =?utf-8?B?WTJDbzM4MS8rdlRCU2ZnWjZRbmxQaDVmZkhobzg3WDY4RzI0bVhUTVRuaitN?=
 =?utf-8?B?VUJFQVBJa3lJSUNMN2g4WFQ4ekJXZWl5OTMvRXh4VExYQWp0VTFkOEJ5TWQ3?=
 =?utf-8?B?YjJkMXRFNmxSS0txNGtvK21JYkVNMlNjK2ZuNHdUV0tSb3FUZk1kMkVDYTRY?=
 =?utf-8?B?SkJxN3h0V1dpZ0hTRzFHMzlNVGFVUnlTa2xZUlRZL3RGNnFZZzlFbStYOGFa?=
 =?utf-8?B?UHdkVjM2eGMvMXZSNndVbHhOSy9BZlhhWUpaVGJ0VHY3MlRyYzBLcWJHR2Nu?=
 =?utf-8?B?MFNVSHgrbXAxdEdkL3BoNENldERiQmFFV1RjMDhha29rbjNLZ3BWeDVQUGRJ?=
 =?utf-8?B?SThiM2RYcHpTUVRPRDQxVzkvVGVEdVY3YXEvSjNsWklZUmJta2lMRCt5T2k2?=
 =?utf-8?B?TjZFNGVmQzhrR3RneGdvQ0VFaGI2aGFDN3A4QTcrYzloSUh2ZWlTRUxNWFRV?=
 =?utf-8?B?NXRaZzZlenN6UTFwSFlyK21IODUzd21VM2pmM2h4bEtNZDNuTFp5SnBzM3g0?=
 =?utf-8?B?b2h2N3N2RkpaRGZmM0E1UEczYjV5YUtCSGpZZm1EUy9uYTJyZUtRR2p1bTBV?=
 =?utf-8?B?WVZEeE8xT3dzVTJjMUdVTEJHcmMvV2oyaVMvRE5zZVhydk1lNTBGZ3h5K21t?=
 =?utf-8?B?RWVRdjFKeFFsNnVtTVpzQkZBbkFmakg0K0pVZW14cDcrWGhCVi90Z1NVOFc4?=
 =?utf-8?B?Y1FrSHhmVXhNRFJ4UkpGMU5jQmR0d0J0eS9wcURjNWFVd1hQeW4zL0N4cm9M?=
 =?utf-8?B?WHZ0bFFMTWoyY1lpUmJWQjhiLzFDQzI4aG1WN2ExL00zKzFUZ0lvUTZWUjR5?=
 =?utf-8?B?SkowT2RGQi9DaG1YMUVUU0hITmJWR29xQy81YnY5Q0hjSmJYMEFwa2Q5Y1F6?=
 =?utf-8?B?Y1daVGIzY0pJeWx5bWtVNGo3THJ1VWRNVHVDWjdJNm5sdWhBNDFHb09MM08z?=
 =?utf-8?B?TE5OSHI0bmx4WTBqQ2plMDZoRkMxMFdtSC84S3NxM01ob0dQb0tYMjJYcWRj?=
 =?utf-8?B?dWRZcHZGTklpUFdxTXhPSTJ4bFJCV1czazlzOUFibUVCOVhBNWorQk9mUVBF?=
 =?utf-8?B?MkhKRW9OTWtSZDFzaVh1S0hRN1RtS0ZCUEV3U2xTekhiTSs3dVVpUDVDY1dY?=
 =?utf-8?B?SEpldzlBMjhEeGg3TXk5Q1VPWjJZL3lvb2IvYmlQdWRiRTNnUlFFa2tNVnpt?=
 =?utf-8?B?M1FjalZUTGMyU1owWGMzT0p0QVhCMGV4ZE9UVE0wQnlqdVAxdUxEcjNISnVI?=
 =?utf-8?B?YUF0OGE3VG5GWkR5bnpjcjQzUWoxR3Urdkh0bTA2ZlRuUkNWRFVnR0FlamFN?=
 =?utf-8?B?RnhZRVlGdlkwSVdURlRpZXhaOXVaZWlMT3VNUDVQK3QxQXFnY2g1T29WY0x3?=
 =?utf-8?B?M0dXV0hYejBpYlBCekxRd3JCb0N1K1dUV1BMaTQ4Q1JGSFM5bjN2OXdEU0Fw?=
 =?utf-8?B?eUdMNE51bXA2aDNCUUtXdU1aanl1bVc1RGdnWW9aUnc3VmtMa05BaDQyVXlH?=
 =?utf-8?B?eFlidkxHaXFna1A0Y3l5dndKQnlvZVZVV2xOUk1Oa2xJeS9mKzE0TzhibE5x?=
 =?utf-8?B?N2lmYXhDOVpjNmtCNlp1Y21MeHFYSHdndzNpWTVRSXdxTGhVbW9DMDdQYXJ4?=
 =?utf-8?B?ZXpNTUx0L0xvaWZQODJORzV4S1ZkVmVBNXhaQktLU0F6dUdBUHBOYlBGMGtU?=
 =?utf-8?B?VEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <721502BEA9510344B576C7361B7DEB4F@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ceeb59e0-db4a-400e-b3b4-08da8a508195
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2022 06:26:00.2122
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: imwa7i4yPnuC3cZj/KgNACtWZhWxIgQSlYHyhRSGZ0oeDu5BK18wupjcNG0txurS2Su3bPWS9az7coruQsMMy5aM/tLBL2Tipv0tyzDi2h4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB1695
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
Cc: "peterz@infradead.org" <peterz@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "aik@ozlabs.ru" <aik@ozlabs.ru>, "mingo@redhat.com" <mingo@redhat.com>, "npiggin@gmail.com" <npiggin@gmail.com>, "jpoimboe@redhat.com" <jpoimboe@redhat.com>, "naveen.n.rao@linux.vnet.ibm.com" <naveen.n.rao@linux.vnet.ibm.com>, "mbenes@suse.cz" <mbenes@suse.cz>, "chenzhongjin@huawei.com" <chenzhongjin@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI5LzA4LzIwMjIgw6AgMDc6NTIsIFNhdGh2aWthIFZhc2lyZWRkeSBhIMOpY3JpdMKg
Og0KPiBvYmp0b29sIHRocm93cyB0aGUgZm9sbG93aW5nIHVuYW5ub3RhdGVkIGludHJhLWZ1bmN0
aW9uIGNhbGwNCj4gd2FybmluZ3M6DQo+IA0KPiBhcmNoL3Bvd2VycGMva2VybmVsL2VudHJ5XzY0
Lm86IHdhcm5pbmc6IG9ianRvb2w6IC50ZXh0KzB4NDogdW5hbm5vdGF0ZWQgaW50cmEtZnVuY3Rp
b24gY2FsbA0KPiBhcmNoL3Bvd2VycGMva3ZtL2Jvb2szc19odl9ybWhhbmRsZXJzLm86IHdhcm5p
bmc6IG9ianRvb2w6IC50ZXh0KzB4ZTY0OiB1bmFubm90YXRlZCBpbnRyYS1mdW5jdGlvbiBjYWxs
DQo+IGFyY2gvcG93ZXJwYy9rdm0vYm9vazNzX2h2X3JtaGFuZGxlcnMubzogd2FybmluZzogb2Jq
dG9vbDogLnRleHQrMHhlZTQ6IHVuYW5ub3RhdGVkIGludHJhLWZ1bmN0aW9uIGNhbGwNCj4gDQo+
IEZpeCB0aGVzZSB3YXJuaW5ncyBieSBhbm5vdGF0aW5nIGludHJhLWZ1bmN0aW9uDQo+IGNhbGws
IHVzaW5nIEFOTk9UQVRFX0lOVFJBX0ZVTkNUSU9OX0NBTEwgbWFjcm8sDQo+IHRvIGluZGljYXRl
IHRoYXQgdGhlIGJyYW5jaCB0YXJnZXRzIGFyZSB2YWxpZC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IFNhdGh2aWthIFZhc2lyZWRkeSA8c3ZAbGludXguaWJtLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IENo
cmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4NCg0KPiAtLS0NCj4g
ICBhcmNoL3Bvd2VycGMva2VybmVsL2VudHJ5XzY0LlMgICAgICAgICAgfCAyICsrDQo+ICAgYXJj
aC9wb3dlcnBjL2t2bS9ib29rM3NfaHZfcm1oYW5kbGVycy5TIHwgMyArKysNCj4gICAyIGZpbGVz
IGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJw
Yy9rZXJuZWwvZW50cnlfNjQuUyBiL2FyY2gvcG93ZXJwYy9rZXJuZWwvZW50cnlfNjQuUw0KPiBp
bmRleCAwMWFjZTRjNTYxMDQuLmZiNDQ0YmM2NGYzZiAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dl
cnBjL2tlcm5lbC9lbnRyeV82NC5TDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9rZXJuZWwvZW50cnlf
NjQuUw0KPiBAQCAtMTQsNiArMTQsNyBAQA0KPiAgICAqICBjb2RlLCBhbmQgZXhjZXB0aW9uL2lu
dGVycnVwdCByZXR1cm4gY29kZSBmb3IgUG93ZXJQQy4NCj4gICAgKi8NCj4gICANCj4gKyNpbmNs
dWRlIDxsaW51eC9vYmp0b29sLmg+DQo+ICAgI2luY2x1ZGUgPGxpbnV4L2Vycm5vLmg+DQo+ICAg
I2luY2x1ZGUgPGxpbnV4L2Vyci5oPg0KPiAgICNpbmNsdWRlIDxhc20vY2FjaGUuaD4NCj4gQEAg
LTczLDYgKzc0LDcgQEAgZmx1c2hfYnJhbmNoX2NhY2hlczoNCj4gICANCj4gICAJLy8gRmx1c2gg
dGhlIGxpbmsgc3RhY2sNCj4gICAJLnJlcHQgNjQNCj4gKwlBTk5PVEFURV9JTlRSQV9GVU5DVElP
Tl9DQUxMDQo+ICAgCWJsCS4rNA0KPiAgIAkuZW5kcg0KPiAgIAliCTFmDQo+IGRpZmYgLS1naXQg
YS9hcmNoL3Bvd2VycGMva3ZtL2Jvb2szc19odl9ybWhhbmRsZXJzLlMgYi9hcmNoL3Bvd2VycGMv
a3ZtL2Jvb2szc19odl9ybWhhbmRsZXJzLlMNCj4gaW5kZXggZGU5MTExOGRmMGM1Li5lYTM5YTBj
ZjU5MWEgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9rdm0vYm9vazNzX2h2X3JtaGFuZGxl
cnMuUw0KPiArKysgYi9hcmNoL3Bvd2VycGMva3ZtL2Jvb2szc19odl9ybWhhbmRsZXJzLlMNCj4g
QEAgLTMwLDYgKzMwLDcgQEANCj4gICAjaW5jbHVkZSA8YXNtL2ZlYXR1cmUtZml4dXBzLmg+DQo+
ICAgI2luY2x1ZGUgPGFzbS9jcHVpZGxlLmg+DQo+ICAgI2luY2x1ZGUgPGxpbnV4L2xpbmthZ2Uu
aD4NCj4gKyNpbmNsdWRlIDxsaW51eC9vYmp0b29sLmg+DQo+ICAgDQo+ICAgLyogVmFsdWVzIGlu
IEhTVEFURV9OQVBQSU5HKHIxMykgKi8NCj4gICAjZGVmaW5lIE5BUFBJTkdfQ0VERQkxDQo+IEBA
IC0xNTIzLDEyICsxNTI0LDE0IEBAIGt2bV9mbHVzaF9saW5rX3N0YWNrOg0KPiAgIA0KPiAgIAkv
KiBGbHVzaCB0aGUgbGluayBzdGFjay4gT24gUG93ZXI4IGl0J3MgdXAgdG8gMzIgZW50cmllcyBp
biBzaXplLiAqLw0KPiAgIAkucmVwdCAzMg0KPiArCUFOTk9UQVRFX0lOVFJBX0ZVTkNUSU9OX0NB
TEwNCj4gICAJYmwJLis0DQo+ICAgCS5lbmRyDQo+ICAgDQo+ICAgCS8qIEFuZCBvbiBQb3dlcjkg
aXQncyB1cCB0byA2NC4gKi8NCj4gICBCRUdJTl9GVFJfU0VDVElPTg0KPiAgIAkucmVwdCAzMg0K
PiArCUFOTk9UQVRFX0lOVFJBX0ZVTkNUSU9OX0NBTEwNCj4gICAJYmwJLis0DQo+ICAgCS5lbmRy
DQo+ICAgRU5EX0ZUUl9TRUNUSU9OX0lGU0VUKENQVV9GVFJfQVJDSF8zMDAp
