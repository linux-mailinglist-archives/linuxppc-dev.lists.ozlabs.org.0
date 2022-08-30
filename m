Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B189E5A5BD2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 08:29:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MGy7v429Qz3dpv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 16:29:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=T7tjS0Ti;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.81; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=T7tjS0Ti;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90081.outbound.protection.outlook.com [40.107.9.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MGy6q1T0kz3c6Z
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Aug 2022 16:28:18 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K9MAY+2IQw3uFL08jUk4L9tIsLAoFhreAP3VafaAoZijVPA7hjBF7xD0z5+2OyYkjqfkinedEne9X2z4htJ77QOSX0xTWhOQIfijwPh8U9Tv2ZycBzYkqAct7wOfU+e7f45lpFj6MsdC/QJ7AZP4h1tratFiePFEaSeow6XhPpab8jzYHZipKrr1KcYFCJCUfGoiwGTpkzQavm+ThlGbk83SbvQ9aJ28bE655iwnpHGVs6skyINO2GkDI5cNrWFSC4l0R/I7h9dfpTTv+ms4sE+UvJIBM3aPKQk+Dc4yDeT/zsx5KWB7QQ5g2hBNPwQ4IRXfZU0Dq6HsISEVcuAk3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WcwJtBjbbBrWl3aAYt5oQ1/QCmX7QC1Gvm4QOcEbW8A=;
 b=nd7gvERqbeoNARkyoGm6W7ezxIdmh8MjtcfYU556Aw6/iKyc7G1PCJftkt+Oyz0VH+FlHCb59iyVHF6a6g2qPdqXLTfeXasJ2+XYm3k6IRV2hM0f04wGOIUoYQaqzgBaoLnrAMstMltnz0KpPNsNSW2NA0bc7/D+IdgIUVGUaKTipHr2MFGv0/nG4K/oNYm02UtFNFCXDMj9YR38ptbaZla60HNCe1gyOelqKL/y9XIHvgOHlkspfrhcdGMQ+YHZ//rqad876WH5OY17qXNfpyi+EWLiW9Lw0d+OxPonXqLR20WpnxwCkHAb/cJpcOitEMUX0ATcPN1QtH+iZy3O9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WcwJtBjbbBrWl3aAYt5oQ1/QCmX7QC1Gvm4QOcEbW8A=;
 b=T7tjS0TiKjoiDoMpIXa9R1kz41k7EGhmH29742hQDdugQX4N+9LfHF5IYlUoSV4mzKnYW0G2EtbKb6YWbKcSnNiEiWbkIrZ91mPBDM+cm1jzsc3jK7DcjzNdFUx4abN98l9W1imn1xBQ/4QyIJIUIU1q7bgh3mxXUdcQ0w6ZnxfWmB26Am7vQEeqlY/84GiPx92VL4U6XAJ91EeMw683WB5rFDQbPIwT5QvvpMlhJkIlkx12IOtkMNc2WfhaZlBAKZzUBh2ciIX/18pGuXGDCX5e4aAy5hLYZdmG71jNNEjxClL023cbxIVx7q8Cu+hBZ+HnCJYVGrhuB7xBwFhU5Q==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB3192.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1d7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Tue, 30 Aug
 2022 06:28:02 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8%4]) with mapi id 15.20.5566.021; Tue, 30 Aug 2022
 06:28:02 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Sathvika Vasireddy <sv@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v2 11/16] objtool: Add --mnop as an option to --mcount
Thread-Topic: [PATCH v2 11/16] objtool: Add --mnop as an option to --mcount
Thread-Index: AQHYu2uwkMItuUnhe0SL/BWI66MQi63G/HUA
Date: Tue, 30 Aug 2022 06:28:02 +0000
Message-ID: <5dfe9132-ac12-08d5-f9e4-5bfca07934f1@csgroup.eu>
References: <20220829055223.24767-1-sv@linux.ibm.com>
 <20220829055223.24767-12-sv@linux.ibm.com>
In-Reply-To: <20220829055223.24767-12-sv@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e680e254-4dcc-4ca5-9276-08da8a50ca37
x-ms-traffictypediagnostic: PR0P264MB3192:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  Nx6vKPmN3v+Onyuqe/q6T64PWMOaNsUdck3bWtboxCi4X7Tb+lBW6GBtqF4SelgSBAY5IWpOFXDR0fHCgBcGoDuOis1zT2BKeC31fe6bi7hLEVF53IFoQHtp+qEWGmYPWRXD0+2AHuovAnGUkD3jXuGeZe3qRoH4ce15nSkOAn0ujuBu0RFVEShTXopjzdAVbWkuHNJZZEHb+oGQlcKNPh9fmk4ocPgBa40q9fGow+knykNCkVZBI1yVTRz+iRWPritlFZp0PlZAIAZe0yXEPqlh8FWK8A+6vQzuz7hMA/d+uXAMZlduDObrSbC/jOtJ8Cj/8CmpZZLDYH8ySPadRdG7pd/kVcpQJKXkJ9KmTQItVu/61SX3hRCsmePzjEqF4/Iy1zeu2bM3MnzLMkeh2g8NSUnARrv3qNHEMo0BIPROnH5ejxvjSmZn2ZjLIELx4qH/8t2fhH8Pkl806Lm8/ASNGo+cKjP10lhaTkIEsfrlBu5K5R8uDRFRYnjA+s2iBl+BAWfr0sQ/HPixgwJuCZVWHEd0vlj7g95DbLuL7Kbhv/JSph36BC82TT1wy40S46QwiHVaQYDa0FDXNvwcuGDzUKuQUN8L8a46cnkT7FeqnRHhcWSW9PoxYWpS1Mm3x9adIemqdluTp5EWZQreJ9pvAdtJIgmA02SICqHXiVLr7S3KZ+vvBZA1aTCkVEAe/RuSg97qgm9aFhti4uWG/jVOPsIw0qjqESeQUakW/yJq/3iKdKA2aoXhkTWSepv4r6ywhS+vynu74ukk5KVG9PZvEyCtiHDlm7t+SNFLjTRzn/+C41gzi9fIe3mb0K+R3NBc0f3xqbeyZ7Hl38VHFQ==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(39850400004)(346002)(396003)(366004)(54906003)(110136005)(8676002)(66476007)(86362001)(31686004)(66556008)(6486002)(76116006)(4326008)(66946007)(31696002)(66446008)(71200400001)(64756008)(36756003)(5660300002)(7416002)(41300700001)(38070700005)(316002)(478600001)(8936002)(44832011)(2616005)(38100700002)(6506007)(122000001)(2906002)(83380400001)(26005)(186003)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?S2hFTXBLbUhESm9GbWpHNk52WXRPcGExQUtIcGl6TzFLSVRNN1FIc3Q3T2hN?=
 =?utf-8?B?RUxPWEJIbE5OKzN2WVVUcWFnTzhxZnlLSEtKUFNpNFF3czNUcGNvNXkwRHJZ?=
 =?utf-8?B?d0dNYWZtQmYwMXFmb1dTK3d5aVdnbmNWWCtUbHQ5dHBlMDVWQksrcWY1T2xR?=
 =?utf-8?B?SkZaMkJ0L0IyZTllZEs5QWgvUng1OW9MbzB2cXR0L1ZzYmdtdUZHNUYyTmNH?=
 =?utf-8?B?SDBsUEZlUks4b1MzZWV6Y3F1MDBXME0vRjR3MXRtTDZETkNmajB1a0h4K3Bo?=
 =?utf-8?B?emNwbUJLc3pkNkVPVGREbnJiOHZHamx1bkxLSUF3ZEJYSkk1UXJuQVROaFE4?=
 =?utf-8?B?REN3a2lFZnVGZDNHc1VrNFNwSkd0a0N2eURVeEp0bGJnNEwrcUliL3I3eFFW?=
 =?utf-8?B?emtBbjR4WUZRdm1YRXRsajBLWlU0WUdqN1kxMktwL21VWXcvYlljZTE0RmNp?=
 =?utf-8?B?S2VTQkR1TWVwV3Y2MG9hTndPR3BzUjVLcmQxUElCNHdIZmJlRXAxa0dyZlND?=
 =?utf-8?B?NjcyVTZoQ01NbVhJNkdVUzlzaURNT2hmNytLaGNiUXJPcWJZS2JhZ1p3bjNn?=
 =?utf-8?B?bHdaY3FRY0x4QnkwYU9RTTFmZXNSMWprbnRQeFIwOEw4czFCMEtWb1RpZktp?=
 =?utf-8?B?RGtPMDdCNjZGcTZMTCtUckl4QVRLYjMwZy9Iek8rNnhjZnVMTHFyVEpvSXpD?=
 =?utf-8?B?RGtVWVN2c29Eb3k4djJPeDhGb1BDYW5teWtSQ2lpZ2VtUFRSUHYzSjVPOWFz?=
 =?utf-8?B?N1NsZTR2VGJGUUlGZ3FoQ3VLZXh1L3BlaVpwTHg4TldMSUZ5eEYzMWlMODQ2?=
 =?utf-8?B?a2NVTVFEYWRaOWljYS8rV05pb1RZQmU4MUI3Z0plcnBPWEp3ODRndW5QbmY1?=
 =?utf-8?B?bDMwYy9LSTJJZG5CbHBmLytOREdJV1U5Ym55RGJWbXM1SFBPOXg3emNlaEty?=
 =?utf-8?B?Nnd1T1c1STR1VGVNam5mSFJsdnllcmFwM1RTRnRBUG5VdkEwTTljVjdGZkZH?=
 =?utf-8?B?MTV4ZzcvcGhNblVmU3R1ajV5NURyTlYwdk5VSmUxazIwSFpQTXVucXk2TTNZ?=
 =?utf-8?B?TTd1aXpDRXFSa09qV25mMU95VWVBb3VKdmZSYnpGQndRaUYramcwWEE5cTNu?=
 =?utf-8?B?K3JBMk9iSGM5SVpnWnRhR0xUcnQvV2pvSlJVd0xrSVNNVWQyNFJkb1FHbERJ?=
 =?utf-8?B?SytZNTVxR0daQmR0R2J5eVREb0hHOUxrdno4Rm5SbURqVTd3alcwd3o4ODVw?=
 =?utf-8?B?eUdIREh4OXdxdkhvSnZiZ1Y1Z1NXT1Y1dTVQTU9qV3JiMVJBajNrQ0YxNnpa?=
 =?utf-8?B?RGNVRmU5QjZ4L0Fwd0o4L2NUby9KK091R1doU2U4OEdoTmkvVzRXNjQ5Z2JR?=
 =?utf-8?B?WjFwZlkxNmM4L2czNDFHRWhQcWpqd3FPNUVqS1RGUVFQY01rZGxuNVhoSkU1?=
 =?utf-8?B?RzlZL3JXcEgxMUNLZEhIOW9qUEkzZy9WLzZyZGE4K2UvK01kZHQ2TTI1d1lx?=
 =?utf-8?B?Umd2U2djVVRETXhhMWFxUEl2a3hTbi93eDlzQk14a1RsWjVuOUt3UHBQN3N2?=
 =?utf-8?B?L1Btam5ZM1RrU1BMNitOZ1pRWFBDUVZINkFuRkJPV0lBZFNlRGdxdUFPSkV2?=
 =?utf-8?B?SGlqZUlqNTdJcDRUOUFNSFFYKzRsWGNuLzFWRXBJZmhEQnZUSkxOZmFwMXpK?=
 =?utf-8?B?MVpXbnMrRmVPN2tQdU0veGpGajVXaHp4SlI5ZW1PWmdYalU1cmJydE5CYlFW?=
 =?utf-8?B?Y1F2N2VKQWxsZGdyQ3BMb2E2YXJRYkdicHdrZFlseThHaWg5Y25DOU1zYVUx?=
 =?utf-8?B?UVVHYitMTXRkSGFOY0dxR2R1bTk2L1hnZmdta2pSOUU5N2dlSkduUjFnWjBI?=
 =?utf-8?B?OTQ4R2xjN1ZTWHJHZytZQXREbktjazJBTStmV3V5U21IN1AyelZMNGhKRi9P?=
 =?utf-8?B?NHNuWlpEL2JPZnFjc04vOTNaMzlzb2V5TFBneC9QZC9RVXVqM2ZFbGdKL0Mw?=
 =?utf-8?B?R0grM2pvbi9JWkpYVi9VNkIybkZwY3BONGhETGhPWUdBVCtGUTRlMlV3R1ZH?=
 =?utf-8?B?RTFlM0dRS056ajVvYXdTbjlWZ2FWNlRkYVZMZFl3YlA1UmFUdWJ0a0xRMGRN?=
 =?utf-8?B?Q3d6R243MWJ4QUN0SWJVNDNIb3dKcXZ1Tkx3TWduZ2o0U0cxVUhaVW1OcHh0?=
 =?utf-8?B?MFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <658F50049FD4144F83505D2D9C723537@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e680e254-4dcc-4ca5-9276-08da8a50ca37
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2022 06:28:02.0378
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ft2xHhHq8+x4SSb8/u2C+lOApsZSyOEyYyIwM0Uq6KyUwC4HVveilzEIGn7SaQS0xFv1ePZni6PY4OdtUVTVSVt2qvncERBxENUJgy3W2dY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB3192
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
Og0KPiBBcmNoaXRlY3R1cmVzIGNhbiBzZWxlY3QgSEFWRV9OT1BfTUNPVU5UIGlmIHRoZXkgY2hv
b3NlDQo+IHRvIG5vcCBvdXQgbWNvdW50IGNhbGwgc2l0ZXMuIElmIHRoYXQgY29uZmlnIG9wdGlv
biBpcw0KPiBzZWxlY3RlZCwgdGhlbiAtLW1ub3AgaXMgcGFzc2VkIGFzIGFuIG9wdGlvbiB0byBv
Ymp0b29sLA0KPiBhbG9uZyB3aXRoIC0tbWNvdW50Lg0KPiANCj4gQWxzbywgbWFrZSBzdXJlIHRo
YXQgLS1tbm9wIGNhbiBiZSBwYXNzZWQgYXMgYW4gb3B0aW9uDQo+IHRvIG9ianRvb2wgb25seSB3
aGVuIC0tbWNvdW50IGlzIHBhc3NlZC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFNhdGh2aWthIFZh
c2lyZWRkeSA8c3ZAbGludXguaWJtLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IENocmlzdG9waGUgTGVy
b3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4NCg0KPiAtLS0NCj4gICBNYWtlZmlsZSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgNCArKystDQo+ICAgYXJjaC94ODYvS2Nv
bmZpZyAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKw0KPiAgIHNjcmlwdHMvTWFrZWZpbGUu
bGliICAgICAgICAgICAgICAgICAgICB8ICAxICsNCj4gICB0b29scy9vYmp0b29sL2J1aWx0aW4t
Y2hlY2suYyAgICAgICAgICAgfCAxNCArKysrKysrKysrKysrKw0KPiAgIHRvb2xzL29ianRvb2wv
Y2hlY2suYyAgICAgICAgICAgICAgICAgICB8IDE5ICsrKysrKysrKystLS0tLS0tLS0NCj4gICB0
b29scy9vYmp0b29sL2luY2x1ZGUvb2JqdG9vbC9idWlsdGluLmggfCAgMSArDQo+ICAgNiBmaWxl
cyBjaGFuZ2VkLCAzMCBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYg
LS1naXQgYS9NYWtlZmlsZSBiL01ha2VmaWxlDQo+IGluZGV4IGM3NzA1Zjc0OTYwMS4uOTlkZDMz
ZDhiY2ZhIDEwMDY0NA0KPiAtLS0gYS9NYWtlZmlsZQ0KPiArKysgYi9NYWtlZmlsZQ0KPiBAQCAt
ODU3LDcgKzg1Nyw5IEBAIGlmZGVmIENPTkZJR19GVFJBQ0VfTUNPVU5UX1VTRV9DQw0KPiAgICAg
ZW5kaWYNCj4gICBlbmRpZg0KPiAgIGlmZGVmIENPTkZJR19GVFJBQ0VfTUNPVU5UX1VTRV9PQkpU
T09MDQo+IC0gIENDX0ZMQUdTX1VTSU5HCSs9IC1EQ0NfVVNJTkdfTk9QX01DT1VOVA0KPiArICBp
ZmRlZiBDT05GSUdfSEFWRV9OT1BfTUNPVU5UDQo+ICsgICAgQ0NfRkxBR1NfVVNJTkcJKz0gLURD
Q19VU0lOR19OT1BfTUNPVU5UDQo+ICsgIGVuZGlmDQo+ICAgZW5kaWYNCj4gICBpZmRlZiBDT05G
SUdfRlRSQUNFX01DT1VOVF9VU0VfUkVDT1JETUNPVU5UDQo+ICAgICBpZmRlZiBDT05GSUdfSEFW
RV9DX1JFQ09SRE1DT1VOVA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC94ODYvS2NvbmZpZyBiL2FyY2gv
eDg2L0tjb25maWcNCj4gaW5kZXggZjk5MjBmMTM0MWM4Li5hOGRkMTM4ZGY2MzcgMTAwNjQ0DQo+
IC0tLSBhL2FyY2gveDg2L0tjb25maWcNCj4gKysrIGIvYXJjaC94ODYvS2NvbmZpZw0KPiBAQCAt
MTg5LDYgKzE4OSw3IEBAIGNvbmZpZyBYODYNCj4gICAJc2VsZWN0IEhBVkVfQ09OVEVYVF9UUkFD
S0lOR19VU0VSX09GRlNUQUNLCWlmIEhBVkVfQ09OVEVYVF9UUkFDS0lOR19VU0VSDQo+ICAgCXNl
bGVjdCBIQVZFX0NfUkVDT1JETUNPVU5UDQo+ICAgCXNlbGVjdCBIQVZFX09CSlRPT0xfTUNPVU5U
CQlpZiBIQVZFX09CSlRPT0wNCj4gKwlzZWxlY3QgSEFWRV9OT1BfTUNPVU5UCQkJaWYgSEFWRV9P
QkpUT09MX01DT1VOVA0KPiAgIAlzZWxlY3QgSEFWRV9CVUlMRFRJTUVfTUNPVU5UX1NPUlQNCj4g
ICAJc2VsZWN0IEhBVkVfREVCVUdfS01FTUxFQUsNCj4gICAJc2VsZWN0IEhBVkVfRE1BX0NPTlRJ
R1VPVVMNCj4gZGlmZiAtLWdpdCBhL3NjcmlwdHMvTWFrZWZpbGUubGliIGIvc2NyaXB0cy9NYWtl
ZmlsZS5saWINCj4gaW5kZXggM2ZiNmE5OWU3OGM0Li4wNjEwMDc4ZTA1N2EgMTAwNjQ0DQo+IC0t
LSBhL3NjcmlwdHMvTWFrZWZpbGUubGliDQo+ICsrKyBiL3NjcmlwdHMvTWFrZWZpbGUubGliDQo+
IEBAIC0yMzQsNiArMjM0LDcgQEAgb2JqdG9vbF9hcmdzID0JCQkJCQkJCVwNCj4gICAJJChpZiAk
KENPTkZJR19IQVZFX05PSU5TVFJfSEFDSyksIC0taGFja3M9bm9pbnN0cikJCVwNCj4gICAJJChp
ZiAkKENPTkZJR19YODZfS0VSTkVMX0lCVCksIC0taWJ0KQkJCQlcDQo+ICAgCSQoaWYgJChDT05G
SUdfRlRSQUNFX01DT1VOVF9VU0VfT0JKVE9PTCksIC0tbWNvdW50KQkJXA0KPiArCSQoaWYgJChD
T05GSUdfSEFWRV9OT1BfTUNPVU5UKSwgLS1tbm9wKQkJCQlcDQo+ICAgCSQoaWYgJChDT05GSUdf
VU5XSU5ERVJfT1JDKSwgLS1vcmMpCQkJCVwNCj4gICAJJChpZiAkKENPTkZJR19SRVRQT0xJTkUp
LCAtLXJldHBvbGluZSkJCQkJXA0KPiAgIAkkKGlmICQoQ09ORklHX1JFVEhVTkspLCAtLXJldGh1
bmspCQkJCVwNCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL29ianRvb2wvYnVpbHRpbi1jaGVjay5jIGIv
dG9vbHMvb2JqdG9vbC9idWlsdGluLWNoZWNrLmMNCj4gaW5kZXggMjRmYmU4MDNhMGQzLi45YmQz
NDdkM2MyNDQgMTAwNjQ0DQo+IC0tLSBhL3Rvb2xzL29ianRvb2wvYnVpbHRpbi1jaGVjay5jDQo+
ICsrKyBiL3Rvb2xzL29ianRvb2wvYnVpbHRpbi1jaGVjay5jDQo+IEBAIC04Miw2ICs4Miw3IEBA
IGNvbnN0IHN0cnVjdCBvcHRpb24gY2hlY2tfb3B0aW9uc1tdID0gew0KPiAgIAlPUFRfQk9PTEVB
TigwLCAiZHJ5LXJ1biIsICZvcHRzLmRyeXJ1biwgImRvbid0IHdyaXRlIG1vZGlmaWNhdGlvbnMi
KSwNCj4gICAJT1BUX0JPT0xFQU4oMCwgImxpbmsiLCAmb3B0cy5saW5rLCAib2JqZWN0IGlzIGEg
bGlua2VkIG9iamVjdCIpLA0KPiAgIAlPUFRfQk9PTEVBTigwLCAibW9kdWxlIiwgJm9wdHMubW9k
dWxlLCAib2JqZWN0IGlzIHBhcnQgb2YgYSBrZXJuZWwgbW9kdWxlIiksDQo+ICsJT1BUX0JPT0xF
QU4oMCwgIm1ub3AiLCAmb3B0cy5tbm9wLCAibm9wIG91dCBtY291bnQgY2FsbCBzaXRlcyIpLA0K
PiAgIAlPUFRfQk9PTEVBTigwLCAibm8tdW5yZWFjaGFibGUiLCAmb3B0cy5ub191bnJlYWNoYWJs
ZSwgInNraXAgJ3VucmVhY2hhYmxlIGluc3RydWN0aW9uJyB3YXJuaW5ncyIpLA0KPiAgIAlPUFRf
Qk9PTEVBTigwLCAic2VjLWFkZHJlc3MiLCAmb3B0cy5zZWNfYWRkcmVzcywgInByaW50IHNlY3Rp
b24gYWRkcmVzc2VzIGluIHdhcm5pbmdzIiksDQo+ICAgCU9QVF9CT09MRUFOKDAsICJzdGF0cyIs
ICZvcHRzLnN0YXRzLCAicHJpbnQgc3RhdGlzdGljcyIpLA0KPiBAQCAtMTUwLDYgKzE1MSwxNiBA
QCBzdGF0aWMgYm9vbCBvcHRzX3ZhbGlkKHZvaWQpDQo+ICAgCXJldHVybiBmYWxzZTsNCj4gICB9
DQo+ICAgDQo+ICtzdGF0aWMgYm9vbCBtbm9wX29wdHNfdmFsaWQodm9pZCkNCj4gK3sNCj4gKwlp
ZiAob3B0cy5tbm9wICYmICFvcHRzLm1jb3VudCkgew0KPiArCQlFUlJPUigiLS1tbm9wIHJlcXVp
cmVzIC0tbWNvdW50Iik7DQo+ICsJCXJldHVybiBmYWxzZTsNCj4gKwl9DQo+ICsNCj4gKwlyZXR1
cm4gdHJ1ZTsNCj4gK30NCj4gKw0KPiAgIHN0YXRpYyBib29sIGxpbmtfb3B0c192YWxpZChzdHJ1
Y3Qgb2JqdG9vbF9maWxlICpmaWxlKQ0KPiAgIHsNCj4gICAJaWYgKG9wdHMubGluaykNCj4gQEAg
LTE5OCw2ICsyMDksOSBAQCBpbnQgb2JqdG9vbF9ydW4oaW50IGFyZ2MsIGNvbnN0IGNoYXIgKiph
cmd2KQ0KPiAgIAlpZiAoIWZpbGUpDQo+ICAgCQlyZXR1cm4gMTsNCj4gICANCj4gKwlpZiAoIW1u
b3Bfb3B0c192YWxpZCgpKQ0KPiArCQlyZXR1cm4gMTsNCj4gKw0KPiAgIAlpZiAoIWxpbmtfb3B0
c192YWxpZChmaWxlKSkNCj4gICAJCXJldHVybiAxOw0KPiAgIA0KPiBkaWZmIC0tZ2l0IGEvdG9v
bHMvb2JqdG9vbC9jaGVjay5jIGIvdG9vbHMvb2JqdG9vbC9jaGVjay5jDQo+IGluZGV4IDBlY2Y0
MWVlNzNmMC4uM2NlYTU4ZjczODc4IDEwMDY0NA0KPiAtLS0gYS90b29scy9vYmp0b29sL2NoZWNr
LmMNCj4gKysrIGIvdG9vbHMvb2JqdG9vbC9jaGVjay5jDQo+IEBAIC0xMjMxLDE3ICsxMjMxLDE4
IEBAIHN0YXRpYyB2b2lkIGFubm90YXRlX2NhbGxfc2l0ZShzdHJ1Y3Qgb2JqdG9vbF9maWxlICpm
aWxlLA0KPiAgIAlpZiAob3B0cy5tY291bnQgJiYgc3ltLT5mZW50cnkpIHsNCj4gICAJCWlmIChz
aWJsaW5nKQ0KPiAgIAkJCVdBUk5fRlVOQygiVGFpbCBjYWxsIHRvIF9fZmVudHJ5X18gIT8hPyIs
IGluc24tPnNlYywgaW5zbi0+b2Zmc2V0KTsNCj4gKwkJaWYgKG9wdHMubW5vcCkgew0KPiArCQkJ
aWYgKHJlbG9jKSB7DQo+ICsJCQkJcmVsb2MtPnR5cGUgPSBSX05PTkU7DQo+ICsJCQkJZWxmX3dy
aXRlX3JlbG9jKGZpbGUtPmVsZiwgcmVsb2MpOw0KPiArCQkJfQ0KPiAgIA0KPiAtCQlpZiAocmVs
b2MpIHsNCj4gLQkJCXJlbG9jLT50eXBlID0gUl9OT05FOw0KPiAtCQkJZWxmX3dyaXRlX3JlbG9j
KGZpbGUtPmVsZiwgcmVsb2MpOw0KPiAtCQl9DQo+IC0NCj4gLQkJZWxmX3dyaXRlX2luc24oZmls
ZS0+ZWxmLCBpbnNuLT5zZWMsDQo+IC0JCQkgICAgICAgaW5zbi0+b2Zmc2V0LCBpbnNuLT5sZW4s
DQo+IC0JCQkgICAgICAgYXJjaF9ub3BfaW5zbihpbnNuLT5sZW4pKTsNCj4gKwkJCWVsZl93cml0
ZV9pbnNuKGZpbGUtPmVsZiwgaW5zbi0+c2VjLA0KPiArCQkJCSAgICAgICBpbnNuLT5vZmZzZXQs
IGluc24tPmxlbiwNCj4gKwkJCQkgICAgICAgYXJjaF9ub3BfaW5zbihpbnNuLT5sZW4pKTsNCj4g
ICANCj4gLQkJaW5zbi0+dHlwZSA9IElOU05fTk9QOw0KPiArCQkJaW5zbi0+dHlwZSA9IElOU05f
Tk9QOw0KPiArCQl9DQo+ICAgDQo+ICAgCQlsaXN0X2FkZF90YWlsKCZpbnNuLT5jYWxsX25vZGUs
ICZmaWxlLT5tY291bnRfbG9jX2xpc3QpOw0KPiAgIAkJcmV0dXJuOw0KPiBkaWZmIC0tZ2l0IGEv
dG9vbHMvb2JqdG9vbC9pbmNsdWRlL29ianRvb2wvYnVpbHRpbi5oIGIvdG9vbHMvb2JqdG9vbC9p
bmNsdWRlL29ianRvb2wvYnVpbHRpbi5oDQo+IGluZGV4IDQyYTUyZjFhMGFkZC4uMDc4NTcwN2M1
YTkyIDEwMDY0NA0KPiAtLS0gYS90b29scy9vYmp0b29sL2luY2x1ZGUvb2JqdG9vbC9idWlsdGlu
LmgNCj4gKysrIGIvdG9vbHMvb2JqdG9vbC9pbmNsdWRlL29ianRvb2wvYnVpbHRpbi5oDQo+IEBA
IC0zMSw2ICszMSw3IEBAIHN0cnVjdCBvcHRzIHsNCj4gICAJYm9vbCBiYWNrdXA7DQo+ICAgCWJv
b2wgZHJ5cnVuOw0KPiAgIAlib29sIGxpbms7DQo+ICsJYm9vbCBtbm9wOw0KPiAgIAlib29sIG1v
ZHVsZTsNCj4gICAJYm9vbCBub191bnJlYWNoYWJsZTsNCj4gICAJYm9vbCBzZWNfYWRkcmVzczs=
