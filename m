Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4C4535A42
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 May 2022 09:23:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L8brp1B2Yz3c9B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 May 2022 17:23:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::610; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on0610.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::610])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L8brJ6Vrpz3blT
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 May 2022 17:23:27 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oOEDQvlL01IV/wpFc1daGQzlj+pH83Z3i0YiKR8mDy4SOswZQwrdFuEr0VMmveXC8A0lGryEOKQOHeqgdImyGas+H3Z46fKNz0ioUHfFWlqIyYBFnYvK41oQV8UjxS0zcKUi8cv0EdBMPDYyUsAlpDmh5upWiPgh3bPGW2Dtfh1nuQysdZDB/odZvF2pgXuT17yanzwG1/kHnu5LMLCH5BaIb9jwJ5sTryvmLikZKIhAEYBmEKQeLJTQOj4V6HPSuCRKSqrf4AGdKCBoePG1ga+5HFIdDm9YPBHvaVvgG7ykuw5h8+aNNEC28usmBTOOjrMAWKE/mNlSvQ1r1d/wCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uzGUwOvvnVv6vQvcnk+GtRelmUKa2tZ4nVqxUZbMDSY=;
 b=GufqE2vMhl+lNp0ovYTZo4whyez8y2+Zu1919L/2tSHW/cvlztOdPM81ukqIKSrCbD94XOhWAt8/M0ygEQQfCFbQ/ZOhKjqjJjSVJYIcMke4Diw6t1GiN+Ch1MNMQaFwn8bf1gGth8mmhAuiUwrIf69NjFe9uUc/NvWTOK2YIQBZvNAM8VVjCc9hWz2V1bwZ7FwH+edUbAtXKOOzXFdaByYYCxKDbpz6mp+TH5E6jca70wmNjeMFSglmHHCaltUEdGjWquSnhP3bQnmPrgUBhWIwW8cWbP6xbYklsJXltKAf53BwoRLm7aHXZT0C3dqUxOv3vAqfU6FhgWZh/HWjFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB1611.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:168::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Fri, 27 May
 2022 07:23:05 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356%5]) with mapi id 15.20.5293.015; Fri, 27 May 2022
 07:23:05 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Christian Zigotzky <chzigotzky@xenosoft.de>, "rob.herring@calxeda.com"
	<rob.herring@calxeda.com>, Lad Prabhakar
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [FSL P50x0] Keyboard and mouse don't work anymore after the
 devicetree updates for 5.19
Thread-Topic: [FSL P50x0] Keyboard and mouse don't work anymore after the
 devicetree updates for 5.19
Thread-Index: AQHYcSj+9qLJZNI0xk+8W6rmCSktpq0yUuSA
Date: Fri, 27 May 2022 07:23:05 +0000
Message-ID: <2e1b72bd-ae44-19d1-5981-09f5c69759dc@csgroup.eu>
References: <283c811b-27f7-64a8-8a67-11cf6c3a79cf@xenosoft.de>
In-Reply-To: <283c811b-27f7-64a8-8a67-11cf6c3a79cf@xenosoft.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0bc8517f-d6f9-408f-c4a3-08da3fb1bdd7
x-ms-traffictypediagnostic: PR0P264MB1611:EE_
x-microsoft-antispam-prvs:  <PR0P264MB1611F53C0F6A3F0880362339EDD89@PR0P264MB1611.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  QFEwJ02u+uMTnhEB+RB005WcLQv7Ov6aIcJGr1Kc6oexNVAtvLb595928nBadxgU2GhjJ+9Wp7KUYBubrTgup3BK9gsaN0k9QqKImJg2oaTUprcM2IbyixiWtfafAEwWo4PNQee2xKVeDghtnuo2aL5daExOYfA0ieLPsjd9CBVe07HdvKO0HL4krJyoeIDmEiH3OlJv902Sap//XlR6dSBTM5EsZNjSUXFjtzV5RqMR2SGN76fjd/KB2Ex+XlfNxPqvAHwhIjN7Y5yfwSAjpdu4LTcccke4g0Xk0vtGDEt6iyLBlKzdJ2BQJ4BEprEVwETc+DVasx14HE0lcM+pdgicbJUINJ2EHQvmDaCFU/MbnWpMnv62ne4NvMkJuiSW0jlRRcRDVok5ruLceZWo4WiCPvBO4XEtzPMpuG9AozfxuZL+mJc1OCIQzATFLJNNb2ZZ+YxplDxsL86Qf6IzqpGn+7r/YE93FJUgnm1vTleXtesry0qvKNJLfhgVyLrN3PJSejF3x/OeFSQo6lIA1f2HhJ9A21V1JZIWZ4w0MavYvokYfQFlh36/cVcG3FSTkKZTImnhk47AbYGKlwgFcjuWAISptdoUGQvERtyDgVAsAU/jNPZ81/bVu6ueew6vkig5V/diKUgVw9MFifMb9Hav2C9v3CMH0TsRBzlimznvvbMsVm5yGnE+MHhKLln+QTSTMycF72TWOPSVIsji/w65+Ot3DHSpNnAQBnwypr+u6QONEIj8L1msDuCGiAU7CWst89SjFy+a8OhgnA6Deg3eNEPBsj6qoPly1MxKy6nBRSIcRKsITAlDlWJkkR7SNe7lR1ty48AdEEoe+mtTxuz3J/wHrEUkKbVkZTkb1LX4+NEfxTZl1wJU49POphTx
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66946007)(31696002)(76116006)(4326008)(91956017)(2616005)(66446008)(66556008)(64756008)(66476007)(16799955002)(508600001)(122000001)(36756003)(38070700005)(966005)(44832011)(6506007)(71200400001)(31686004)(38100700002)(316002)(15650500001)(26005)(186003)(83380400001)(8676002)(86362001)(6512007)(110136005)(54906003)(5660300002)(2906002)(15188155005)(6486002)(8936002)(43740500002)(45980500001)(19623215001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?QzFXTTRGdkIweFltU0VqT0YxalhwNzZBM0N3ZGluU0xoT3VRUisxNFlIZ1hW?=
 =?utf-8?B?U2l1TlY2TEo1eEpySnJEazRpVFRpdTNTbUZjWWxobTFib0VmSFF1MGxxeUVl?=
 =?utf-8?B?TVA0WlVobG9ZUWJmS2dnT3Bhb1BKSThOOWhMb29QRHU2RHdnbkJpSEZRWVFk?=
 =?utf-8?B?MVRmbC9SdUUwQWdIRnQ5RzNQcnZTQmVUQnJWYkt1Z2FFNnZRQUJpRDY2bTlx?=
 =?utf-8?B?cVhLOEZ1OE5DM3hFOXh1YU1ac21iU0ZFZXJZakxZME4rYlJjTWltcGZ1Z0Jw?=
 =?utf-8?B?MzJrOTJsdU1qWUlxMmc5ZTYrQ3RadHhsa2ZGRU5qSE0wQnc1RVFKeUhtVDVO?=
 =?utf-8?B?cmRKQllLOTVudlFnNWNKRGZLS0FKYmFBVGYrbXdDUGlTUW5idmRpMzhVQlhp?=
 =?utf-8?B?NkhxUFdrZ0x2aFJ0R3ZVNjFtN3kxUFVmbGZOOVU2d25FK0xQcTE0SkhoT2F3?=
 =?utf-8?B?Nnlqbk9MNkZmbkFzNXl6cEp4N1g0VW1ScUx4ME9MM2VBN0EvTVIwc0dpRjJx?=
 =?utf-8?B?MlBXN29XUmcrWTVuVG1leFZiVWFxcmpTOEJwb3RmNVg0T0g2MS9TRGpNZ3R4?=
 =?utf-8?B?djdYa2tHMDRHUHZybDZIYXlxRzNpeDNwYWQ1RTAyT25HamVNbks1aFhUek9m?=
 =?utf-8?B?UGJPUGNLZEVNOGtsdGhIcjFldWVlR0NPbFRsUWd3NFQ1THpkMEVEbnVNdDI2?=
 =?utf-8?B?K1FpdWxGTzdTa2IrbkdRRTBCQ2J1emx2akVIZ2M4WS8vb3MxTU9yOVAwS0ZR?=
 =?utf-8?B?QU9DbC91R0tUKzUxMm92ZU9paW5kbzVpQVF5Y1ozREp4YStyY3YwUkVOQlFU?=
 =?utf-8?B?dWNGMHA2Z3Vrc2Y2WlNBYlU3RlRFMkp1dHNjM3MxYjFlOG5aT2ZZRGFhVjZz?=
 =?utf-8?B?TzdjTnBqK1Q3b0FsMFpmZEc1cmFFdy80cWxaMm9DOGNNWUd6Uk11b01Bd1hB?=
 =?utf-8?B?bTNIT0oyTis4dm1hQlhQaWFmc2RVdmt3SXd1N3RjRERPMGpsS2ZRQTEreUlo?=
 =?utf-8?B?Q1k4UzhUTmhtYUhtNGQ4OWZ4OE84MGpWaU54Nk5oVUZObmo4SnB1WVMwcHp5?=
 =?utf-8?B?cERzdktRdVVKQVRhWFoyQzlLTENFc2lyRFRYMitTVTlVeFlCWDdZUGE5Qzkv?=
 =?utf-8?B?dWJCUUpCR3FyRWNQSHhyRno3TGsyeTR6alE1YjA4M3FJZk82cDBKQTVEWTc0?=
 =?utf-8?B?OFFNb3M2U0NxTDYrMHh5RUdqdG5aRmhBR21jdkRUbFYxN2FuQzRXL0p2SVlz?=
 =?utf-8?B?MDZuN0ludzFyQklqREdEanNaelB6UDIxV29VUWxMTXdna0psL1lMeS9nWDhh?=
 =?utf-8?B?YW9GbW93dVBnc1ROelYvZHZWcGFqamFST0dGZTVIK0RZY1I5T0NReU0xcWJ4?=
 =?utf-8?B?eXZuVVBUbFdVbnFQSUlRaUl5MEY5cHRndER1NkVWRVQ0RjhwMzBnMFp0RHVN?=
 =?utf-8?B?cUp4enl0Yi8ydmg1M2xPZmRoRVlJVFE1cXRHK2xQYkdnbDU2RVRmRFRhNzZt?=
 =?utf-8?B?cjJZMjhOQVhObnlabWhGdXFIQW5XcVRQYVRvc0tTQ3k4bVRnSEV2VVZPOGtp?=
 =?utf-8?B?ck80TE9HWGRxeXJPdEJULy9wM0ZSNnltOFBxQnU1ZDREaHRPYnZZRTdlc3Vy?=
 =?utf-8?B?VTJlNDlMM01ZRU5ORUdycDR2TzM0Y0k2MnlDemFXOVk5RXJqQ3lTU1F4aDhT?=
 =?utf-8?B?cllmNmFVSVM3M2Z1OXFHcHMzNnFTbTJOaUJUelNGdlJXVzNrVFF6Si96aUVl?=
 =?utf-8?B?ZWUrQXN2M3lvN295VTBWVHkrb3VSeGlXS2RoamhUZUhkYnlUZ252cXBsekpU?=
 =?utf-8?B?c1pzaGhBNmNVM25LUkcrcWZEVTNjUHpBZTkyalVKU0VVTEV1UFl6eXFBMHRO?=
 =?utf-8?B?Q3pzRWNKL3FqS09KWStuN3FicFkza0NET2t1ZXU0Lzk0cXMzVmVxQjhudjFM?=
 =?utf-8?B?djExYno1UlpUb21pbDREWjBpTDdxUDhTcmZ1Wi9mU25BWDdXNXYwdE1aMmRX?=
 =?utf-8?B?U1lJS2lOa2xRQW9LYWRqb28vazJYdVdsYnMxMGtReHNKWCtMOFA2MExqZ1Fy?=
 =?utf-8?B?c1NBTkFXMUttTnpzQ0JKRUJNbVVjeHBTR3N2K1ZaNzhEWmhaYzhpQnhIN0tt?=
 =?utf-8?B?Ti9mWWVIdGxxcGtQK3l0SkRRaEdOUHRLWkVVYWJZcG82cDM4RkJzT0RIRXF4?=
 =?utf-8?B?MG1HbDljWFdrSmNvRDVXYkIyU0RjUDFFMnhXeGo3ODlxVGFaL3owK0FLK21C?=
 =?utf-8?B?V0xxclVseHBpN3Iyc3B3Y0RDWHFXNmtkSHhFVjB1V0lQSnF6SkNYY0F0MFhT?=
 =?utf-8?B?VHFvdjN6YldrMEZHRDFqWW03dkg0TFlRKzh5VHBTdmJUQjZGaTMrc0VvV21s?=
 =?utf-8?Q?Ue23w7+BfFdAIdZQb6mnPUBRcAeEN7YgNau0x?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <278472E24A09F44A9FC331553E1C1C5B@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bc8517f-d6f9-408f-c4a3-08da3fb1bdd7
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2022 07:23:05.2504
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VtIoUdTdYp53QVeMliOpu6lNuGZxhcQLryfycOFQOOqf3zFoAh/iM3jnCRdCKC5PL45+5BQVZq5sfdAWaIBOA6A7iUp04T/Ku87FYiSou5U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB1611
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
Cc: Darren Stevens <darren@stevens-zone.net>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "R.T.Dickinson" <rtd2@xtra.co.nz>, mad skateman <madskateman@gmail.com>, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGkNCg0KTGUgMjYvMDUvMjAyMiDDoCAxOTo0MiwgQ2hyaXN0aWFuIFppZ290emt5IGEgw6ljcml0
wqA6DQo+IEhlbGxvLA0KPiANCj4gTXkga2V5Ym9hcmQgYW5kIG1vdXNlIGRvbid0IHdvcmsgYW55
bW9yZSB3aXRoIG15IEN5cnVzKyBib2FyZCB3aXRoIGEgRlNMIA0KPiBQNTB4MCBQb3dlclBDIFNv
QyBbMV0gYWZ0ZXIgdGhlIGRldmljZXRyZWUgdXBkYXRlcyBmb3IgNS4xOSBbMl0uDQo+IEFmdGVy
IHJldmVydGluZyB0aGUgZGV2aWNldHJlZSB1cGRhdGVzLCBteSBrZXlib2FyZCBhbmQgbW91c2Ug
d29yayANCj4gd2l0aG91dCBhbnkgcHJvYmxlbXMuDQo+IEkgZmlndXJlZCBvdXQgdGhhdCB0aGUg
aXNzdWUgaXMgaW4gdGhlIHBhdGNoIGZvciB0aGUgZmlsZSBwbGF0Zm9ybS5jIA0KPiBbM10uwqAg
SSBjcmVhdGVkIGEgcGF0Y2ggZm9yIHJldmVydGluZyB0aGUgcHJvYmxlbWF0aWMgY29kZS4gKHNl
ZSANCj4gYXR0YWNobWVudCkNCj4gQWZ0ZXIgcmV2ZXJ0aW5nIHRoZSBjaGFuZ2VzIHdpdGggdGhl
IGF0dGFjaGVkIHBhdGNoLCB0aGUga2V5Ym9hcmQgYW5kIA0KPiBtb3VzZSB3b3JrIGFnYWluLg0K
PiBQbGVhc2UgY2hlY2sgeW91ciBjaGFuZ2VzIGluIHRoZSBmaWxlIHBsYXRmb3JtLmMgWzNdLg0K
PiANCj4gVGhhbmtzLA0KPiBDaHJpc3RpYW4NCj4gDQo+IFsxXSBodHRwOi8vd2lraS5hbWlnYS5v
cmcvaW5kZXgucGhwP3RpdGxlPVg1MDAwDQo+IFsyXSANCj4gaHR0cHM6Ly9naXQua2VybmVsLm9y
Zy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L2NvbW1pdC8/aWQ9
ODZjODdiZWE2YjQyMTAwYzY3NDE4YWY2OTA5MTljNDRkZTZlZGU2ZSANCj4gDQo+IFszXSANCj4g
aHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMv
bGludXguZ2l0L2RpZmYvZHJpdmVycy9vZi9wbGF0Zm9ybS5jP2lkPTg2Yzg3YmVhNmI0MjEwMGM2
NzQxOGFmNjkwOTE5YzQ0ZGU2ZWRlNmUNCg0KDQpCYXNlZCBvbiB5b3VyIHBhdGNoIEkgd291bGQg
c2F5IHRoZSBjdWxwcml0IGNvbW1pdCBpcyANCmh0dHBzOi8vZ2l0aHViLmNvbS90b3J2YWxkcy9s
aW51eC9jb21taXQvYTFhMmI3MTI1ZTEwNzljZmNjMTNhMTE2YWEzYWYzZGYyZjllMDAyYg0KDQpj
b21taXQgYTFhMmI3MTI1ZTEwNzljZmNjMTNhMTE2YWEzYWYzZGYyZjllMDAyYg0KQXV0aG9yOiBM
YWQgUHJhYmhha2FyIDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+DQpE
YXRlOiAgIFdlZCBNYXIgMTYgMjA6MDY6MzMgMjAyMiArMDAwMA0KDQogICAgIG9mL3BsYXRmb3Jt
OiBEcm9wIHN0YXRpYyBzZXR1cCBvZiBJUlEgcmVzb3VyY2UgZnJvbSBEVCBjb3JlDQoNCiAgICAg
Tm93IHRoYXQgYWxsIHRoZSBEVCBkcml2ZXJzIGhhdmUgc3dpdGNoZWQgdG8gcGxhdGZvcm1fZ2V0
X2lycSgpIHdlIA0KY2FuIG5vdw0KICAgICBzYWZlbHkgZHJvcCB0aGUgc3RhdGljIHNldHVwIG9m
IElSUSByZXNvdXJjZSBmcm9tIERUIGNvcmUgY29kZS4NCg0KICAgICBXaXRoIHRoZSBhYm92ZSBj
aGFuZ2UgaGllcmFyY2hpY2FsIHNldHVwIG9mIGlycSBkb21haW5zIGlzIG5vIGxvbmdlcg0KICAg
ICBieXBhc3NlZCBhbmQgdGh1cyBhbGxvd2luZyBoaWVyYXJjaGljYWwgaW50ZXJydXB0IGRvbWFp
bnMgdG8gZGVzY3JpYmUNCiAgICAgaW50ZXJydXB0cyB1c2luZyAiaW50ZXJydXB0cyIgRFQgcHJv
cGVydHkuDQoNCiAgICAgU2lnbmVkLW9mZi1ieTogTGFkIFByYWJoYWthciA8cHJhYmhha2FyLm1h
aGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPg0KICAgICBBY2tlZC1ieTogTWFyYyBaeW5naWVy
IDxtYXpAa2VybmVsLm9yZz4NCiAgICAgVGVzdGVkLWJ5OiBNYXJjIFp5bmdpZXIgPG1hekBrZXJu
ZWwub3JnPg0KICAgICBTaWduZWQtb2ZmLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3Jn
Pg0KICAgICBMaW5rOiANCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyMjAzMTYyMDA2MzMu
Mjg5NzQtMS1wcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20NCg0KDQoNCkNh
biB5b3UgcGxlYXNlIHByb3ZpZGUgeW91IGRldmljZSB0cmVlID8NCg0KRG8geW91IHVzZSBhbnkg
b3V0LW9mLXRyZWUgZHJpdmVycyA/DQoNClRoYW5rcw0KQ2hyaXN0b3BoZQ==
