Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 617B880427B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Dec 2023 00:19:00 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=Ngqnsjq4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Skfk967qPz3d8J
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Dec 2023 10:18:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=Ngqnsjq4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::609; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20609.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::609])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SkfjL5PdQz3cTF
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Dec 2023 10:18:13 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i+KOYbG+sT8/iUPFDHslkTTBamSxx2/+mBxejYB/NhSJI+PRLyOVQpdAlXfsc+kVHEdNs9v2zzqtzlpyV3PgEM3JwIHaRWGM1aQz10XJTdVPEjuFmQKhRIak3KzSA3wGNbC7ZoGqIIM5lNe5GBm++7BFMY5gV4LmtXvKFHFhlothWdfqTIVAc7g1jN7Nh01y3oeNVJdW74rJDSi591vc9KyAliHY88grEpOHGAOMRFadzwGTKnoX/EX8kQF5OP9+fAlE+yxwQ4iZocI9MBsJQHpmTW02S/Qy/gfdY2Cvx3aQRXi1Zu5lP0AonDFbbrA3HOsf0QUWBkKEv7KeIq2YjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hunNC5yQ/2HFCWY6Dj4kBLKvKyAm1vqHaKkiysg9/eE=;
 b=MzLdb1DGaE3LRodvKdlj3g5Q7/y/G/LBox8+TQ93Ulj89R1rvK6q1JaECjUYnt/GojC4JgCS6QR1y49qEb5Pa3JLJItAai0lGZNW36h9OYkgXXRGMalYv4M3uD9eFLCYF+nVGm8WSbn/c2xsEhkV+qfgll31oR/4gET3t3OEOULcEbaQLsS3irTjAxUSiB8+lEH5lFWcM5pIOD3Bx2lnhnOPHMGt/aeAFl76dr8BzmwA503Xw3Ic0FrHIbxWObexzm3bS6ha6Tc/0Vu2EK72GPs6t+MkmCJ8zNEwIwvHG2v05RzqbLfv3smXrSqDY0mOF3HY9sisMuwmpjyZ+VGYIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hunNC5yQ/2HFCWY6Dj4kBLKvKyAm1vqHaKkiysg9/eE=;
 b=Ngqnsjq4LS+Dx6q77qmKFXslZhUs5+8urddB3np3gxlyl+wa4OiF+Xw7bGfQK1UHnrB/Ip5QTxwlfSOXa+b3zlfUahobU0R3KuNoYUZ+lrF02+zMHjRlHUuA1R+ubea2xGDBvwSQu2fLnR9zzjuUd9vrPqlDRjd+MBssN151QRkoR3lrHQ1FqEUlbwQGwapezPGy8GKHt4g9z0D8fRdOSE3I0WL+vwlR3nfGZmU2hnDXPpJUgH+ELNHoVuW33dXi1Usa+wuCA3l2qPc2CIcPqj3C+Czvy4V4jiOQNxo48DXF8OoX/a9BcPI0msmcJ5lX6U3urBcUh+qGKJ1P2ztfFg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB1853.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1b3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.24; Mon, 4 Dec
 2023 23:17:55 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97%3]) with mapi id 15.20.7068.022; Mon, 4 Dec 2023
 23:17:55 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: George Stark <gnstark@salutedevices.com>, "pavel@ucw.cz" <pavel@ucw.cz>,
	"lee@kernel.org" <lee@kernel.org>, "vadimp@nvidia.com" <vadimp@nvidia.com>,
	"mpe@ellerman.id.au" <mpe@ellerman.id.au>, "npiggin@gmail.com"
	<npiggin@gmail.com>, "hdegoede@redhat.com" <hdegoede@redhat.com>,
	"mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
	"andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>, "jic23@kernel.org"
	<jic23@kernel.org>
Subject: Re: [PATCH v2 04/10] leds: aw200xx: use devm API to cleanup module's
 resources
Thread-Topic: [PATCH v2 04/10] leds: aw200xx: use devm API to cleanup module's
 resources
Thread-Index: AQHaJty35asolGdmG0u5E1rII1rZp7CZwnyA
Date: Mon, 4 Dec 2023 23:17:55 +0000
Message-ID: <afd07c38-b490-4498-aa12-219fec8c39c9@csgroup.eu>
References: <20231204180603.470421-1-gnstark@salutedevices.com>
 <20231204180603.470421-5-gnstark@salutedevices.com>
In-Reply-To: <20231204180603.470421-5-gnstark@salutedevices.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR1P264MB1853:EE_
x-ms-office365-filtering-correlation-id: 59f74810-c087-4df9-ef57-08dbf51f3ee6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  JvQ5jQBc2gRQVN7ImfOPh3fOPz6QHqJTeW8tlbh9D9DUOdKhlfwK1IV/fS7VTQ4BhLHetBpYAIXxQl7VMi+ZIqATQot1WyH1Fyxfku6Iel5DLR5+EvbhmUYX63krOU4yWmyGogKb5h2/Kk7es5UairxtV5z9mz6FGtGQte+fHbK9k2HeeVeUi1429s2Ioc0ZmJ5uj4N8fVy7GrX+MZjA8KekuW7TJks4JQVU9dAVoraVaDnBoysMBSAtgpgy2tBlVfDy94K9hpoyZJ1oyVahM7vPRVRmH4iNoRqgIdcAOGaTA4Bs9TCkaSzwrEvgVFl9oMwD1fRRd0mExBl/9yTzT2M6nGz1jiYYp9tpic6J/p/GmECQAYjWkFBIp0fiFEK3efetmRN9rxM9/tYswJ94MR+YevsvytD2zgZ8704YDoyakXbnRS+iYXQk7yP/NVhZpln9mYTDNQKsFvCbc7Cd/LSaw/j57iY+xUI6g/3Nr1Lqr2J+iDKGo+l11plxkTJQrLRm+7QkL7tDjnkSGDfFdOsCdt5Hthc8Dg0CSM6kif1FasDlSaTF9WMrqycYzYDKH/xd4FwXx8NGaRuWZ3WHX4YRO90SgaPmXWg6UjtuZJ+nVC+Pf6yGaorEjkwe5WP8auO2f14492rhoEwUufawFlU5M56SzKMGpdiHusoy2XjbP13mxMZ5ljOhy+R9/qUFpN5aM0Rghsum+auV3Eahig==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(396003)(346002)(376002)(39860400002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(66574015)(6486002)(83380400001)(478600001)(6512007)(2616005)(6506007)(26005)(71200400001)(316002)(110136005)(91956017)(66476007)(66446008)(64756008)(54906003)(66556008)(76116006)(66946007)(86362001)(41300700001)(36756003)(8676002)(4326008)(8936002)(38070700009)(921008)(7416002)(2906002)(44832011)(31696002)(5660300002)(122000001)(38100700002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?L0NFSDhGVnYvSGdqa2ErZmxmMDVWdE5oNHZsZE9Pd0svRUFtTjZMUjJubTB5?=
 =?utf-8?B?YkJmNlFZUTBaais5azJIblUzS212eUxPcXBiU1h1K3p2Vis3bDh6c1I5NGVy?=
 =?utf-8?B?QlhicU9kWHJTTzdMTVhlNmwyaUszaU5hSnhWWGU3dHpGM0xiWmtwVGRJUXBK?=
 =?utf-8?B?Qi9YRVZnM0lYcExkVjZteGc3ampvaWYvV3VuSWNDeVZPRnhCanF3V0s1L3VV?=
 =?utf-8?B?MldwK3lwNHA1MnVialMwWDVCblBiYWpncVBQdm9rNzlReEtCTTJuVENXbkNV?=
 =?utf-8?B?bWVqL2hjdnpDTHlJRjNlU1hCaGpkRjJ3VzhpSzY4R2IxejU4Wm4xT3F0b1hX?=
 =?utf-8?B?NmQ3VkZiV29IUjU3UnF0UlhmVFlaQUgwUENEdzUzNDllTnJSOUpUUEcxT2px?=
 =?utf-8?B?WFE1RFNMWXlmTG9tbGVlY3JtdEhwL0F5Y0E4ZWFncHIrUXUzWHlqYno1WmlN?=
 =?utf-8?B?ejlJeDNGOEtYNU1Qa1JLelpVT0JRQUVNaXJ0Y2pheFc0OGVIbTlqaGhmSytZ?=
 =?utf-8?B?L0YwSis1Wm16TEhYR3dnNlZGNit4cHdaVXpvMHdrUHo4eWR6TjFIaC9oeW5u?=
 =?utf-8?B?dWNESW5ibmdTSkY3WnJLYzhLM3NCZTUwT0haTUpTaEFhaFZkSXdzaldGcjBi?=
 =?utf-8?B?WWlIWmhmMUxyMTRNekVRT0FpMm9nV3lHT1cvZEVBbU9iSktIckNsSGdENlhZ?=
 =?utf-8?B?NFEya29kdWdiNkgyV2tXMERJcEJMV0JsYjBhVkg3T1Q5b2VNVEhxOWtVMmNL?=
 =?utf-8?B?UE1xbUVjbmJkVHdVZFl6NEREcGxPcFRnS0lBY2htZW85WkNhOWlEZWNISWxE?=
 =?utf-8?B?Zzc4b1lZYWExV0U1a20xaFh4YUUydENMcFFuVEZmM2FaQ1NRTzV5QjdvaElR?=
 =?utf-8?B?RG5DVW9CcTRpeUp3QnBPN2ZtV0JRVzBJMkJGMlp6OHBUYnBUSWJnUXdXMXJ2?=
 =?utf-8?B?WW8yU1NtS3kyczMvNFF5U1FWakllZnZJSFpqOStVeFJFZ0FzaTVzQklRUWdi?=
 =?utf-8?B?VG9aV2Z2NUZhUVo5MXJ3emZWUFhiMjJHTGpZazZHd2JST1dyM2w3V21NeEJJ?=
 =?utf-8?B?SllXeStIdXgweVNtUDJQL0w4NGZvYkRCZXJNUjlwUVA1SWNyS01YeGMydk8v?=
 =?utf-8?B?N05MeHp4bmh5eDlBMDRBcTU4NGN5aTZZaldMdlhteS9PSWFGZythTURoWThv?=
 =?utf-8?B?U3A4WDNmdTRYVHNNS29yK21jb0pva3U4dmUvRWpYVndKOWtSd0Fqbzh2Szcv?=
 =?utf-8?B?dzZWR25jeUwvNGR5VWU5Wk02WUNFUndRMEN5U1FYOGVLNnVoazJiSGtPK3Ba?=
 =?utf-8?B?bDg2eGphaWpCeXg5T1RwZWRrdTFZTGNTSDl3aCtFOGYxYlNacURkQk5PcGJR?=
 =?utf-8?B?VmQwdnVDUlhEQjB1WlJDbHB5ODVqSWhOckpzZFZzL2t4cHUrMVo3alZQQVVj?=
 =?utf-8?B?WjlpU3NWK1plaFphM3VEelNObWNGQkEzbkdsUnZxZmc0dVBqQ3FXY0JSYjNi?=
 =?utf-8?B?MHAvSGphc09CS0pCR1hISG05K2NVTitLMG8zKy96Y3ZQeGNrMkFaUC9lR0p5?=
 =?utf-8?B?bkJRdU5tc0ZaUDFrdDREczlJejAwSHBXVSttS3lWR2ptTmp6ZXFFU0dWcWtT?=
 =?utf-8?B?WkttMzd2TjY3ZEpHNjRsUldUTVZRWkMrVlIxUzBKK0wxY2V0T0t0VWpDcjhD?=
 =?utf-8?B?dFhwQXMvQWYzdWcwS3l6ZmMyY3VJTDUyeE5DV2JNbm5JOTRBVHkyYzdiWG5Q?=
 =?utf-8?B?NHdsN2dmSmpIVzJkUWhXWjR5S1BIZHcrRkh4cU9WNjlqc20zYzM4VjUvc1d2?=
 =?utf-8?B?N2h5Q2JxazNFZ25JbWpJUlJHWjVTQytxZE5DWmtGeCtjQzZ2OEZ2SllEejNO?=
 =?utf-8?B?dytTZ0ZwTktMSXE0TWV4K0hzSm53czU4UllxVTdrelRKbFlUa2daUXUyMDNx?=
 =?utf-8?B?WFFhWUpGb3ZmYWpDZkZCdmVPUjNQV21xUy9PMWdvVFM3T0JrVmR2M3JsejBF?=
 =?utf-8?B?WlhHLzBnM0ZQcUFxZGF6ZXgwZWRETldkY3pKVXBZbmJINWs1VGpIWlRTcHFX?=
 =?utf-8?B?VEN3U0Z6Rkl0Q2pMS1VuQlhkVXBVWDFJaG1yaHhKRnNsL2gxeVVmaDE4cXkr?=
 =?utf-8?B?R0ErV3AySmVjUWRNWTNmV2hCSW1Bc3RHeXpBWmt3LzZ0TUthVnd1Y3hDQ29u?=
 =?utf-8?B?Rmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BFFE069BA064C94B8BAF5FFBCD6E47CF@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 59f74810-c087-4df9-ef57-08dbf51f3ee6
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2023 23:17:55.1019
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dU/5uWjVOhSg5myy7E+4se8TTLGfRZOmlsEUqTrqWUqzx7c2UI93VyWc/MMgEdH+rNQ03JRnRxvl8v/UBwqurP3w5RCOHt9CbZStJnwcBCc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB1853
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
Cc: "kernel@salutedevices.com" <kernel@salutedevices.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA0LzEyLzIwMjMgw6AgMTk6MDUsIEdlb3JnZSBTdGFyayBhIMOpY3JpdMKgOg0KPiBJ
biB0aGlzIGRyaXZlciBMRURzIGFyZSByZWdpc3RlcmVkIHVzaW5nIGRldm1fbGVkX2NsYXNzZGV2
X3JlZ2lzdGVyKCkNCj4gc28gdGhleSBhcmUgYXV0b21hdGljYWxseSB1bnJlZ2lzdGVyZWQgYWZ0
ZXIgbW9kdWxlJ3MgcmVtb3ZlKCkgaXMgZG9uZS4NCj4gbGVkX2NsYXNzZGV2X3VucmVnaXN0ZXIo
KSBjYWxscyBtb2R1bGUncyBsZWRfc2V0X2JyaWdodG5lc3MoKSB0byB0dXJuIG9mZg0KPiB0aGUg
TEVEcyBhbmQgdGhhdCBjYWxsYmFjayB1c2VzIHJlc291cmNlcyB3aGljaCB3ZXJlIGRlc3Ryb3ll
ZCBhbHJlYWR5DQo+IGluIG1vZHVsZSdzIHJlbW92ZSgpIHNvIHVzZSBkZXZtIEFQSSBpbnN0ZWFk
IG9mIHJlbW92ZSgpLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogR2VvcmdlIFN0YXJrIDxnbnN0YXJr
QHNhbHV0ZWRldmljZXMuY29tPg0KPiAtLS0NCj4gICBkcml2ZXJzL2xlZHMvbGVkcy1hdzIwMHh4
LmMgfCAzNiArKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0NCj4gICAxIGZpbGUg
Y2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9sZWRzL2xlZHMtYXcyMDB4eC5jIGIvZHJpdmVycy9sZWRzL2xlZHMtYXcy
MDB4eC5jDQo+IGluZGV4IDFkMzk0M2Y4NmY3Zi4uYjFhMDk3YzdjODc5IDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL2xlZHMvbGVkcy1hdzIwMHh4LmMNCj4gKysrIGIvZHJpdmVycy9sZWRzL2xlZHMt
YXcyMDB4eC5jDQo+IEBAIC0xMCw2ICsxMCw3IEBADQo+ICAgI2luY2x1ZGUgPGxpbnV4L2JpdGZp
ZWxkLmg+DQo+ICAgI2luY2x1ZGUgPGxpbnV4L2JpdHMuaD4NCj4gICAjaW5jbHVkZSA8bGludXgv
Y29udGFpbmVyX29mLmg+DQo+ICsjaW5jbHVkZSA8bGludXgvZGV2bS1oZWxwZXJzLmg+DQo+ICAg
I2luY2x1ZGUgPGxpbnV4L2dwaW8vY29uc3VtZXIuaD4NCj4gICAjaW5jbHVkZSA8bGludXgvaTJj
Lmg+DQo+ICAgI2luY2x1ZGUgPGxpbnV4L2xlZHMuaD4NCj4gQEAgLTUzMCw2ICs1MzEsMjAgQEAg
c3RhdGljIGNvbnN0IHN0cnVjdCByZWdtYXBfY29uZmlnIGF3MjAweHhfcmVnbWFwX2NvbmZpZyA9
IHsNCj4gICAJLmRpc2FibGVfbG9ja2luZyA9IHRydWUsDQo+ICAgfTsNCj4gICANCj4gK3N0YXRp
YyB2b2lkIGF3MjAweHhfY2hpcF9yZXNldF9hY3Rpb24odm9pZCAqZGF0YSkNCj4gK3sNCj4gKwlj
b25zdCBzdHJ1Y3QgYXcyMDB4eCAqY2hpcCA9IChzdHJ1Y3QgYXcyMDB4eCAqKWRhdGE7DQo+ICsN
Cj4gKwlhdzIwMHh4X2NoaXBfcmVzZXQoY2hpcCk7DQoNClNhbWUgYXMgcHJldmlvdXMgcGF0Y2gs
IG5vIG5lZWQgdG8gY2FzdCBkYXRhIGFuZCBubyBuZWVkIGZvciBjaGlwIGF0IA0KYWxsLCBkaXJl
Y3RseSBkbyBhdzIwMHh4X2NoaXBfcmVzZXQoZGF0YSkNCg0KPiArfQ0KPiArDQo+ICtzdGF0aWMg
dm9pZCBhdzIwMHh4X2Rpc2FibGVfYWN0aW9uKHZvaWQgKmRhdGEpDQo+ICt7DQo+ICsJY29uc3Qg
c3RydWN0IGF3MjAweHggKmNoaXAgPSAoc3RydWN0IGF3MjAweHggKilkYXRhOw0KPiArDQo+ICsJ
YXcyMDB4eF9kaXNhYmxlKGNoaXApOw0KDQpTYW1lDQoNCj4gK30NCj4gKw0KPiAgIHN0YXRpYyBp
bnQgYXcyMDB4eF9wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50KQ0KPiAgIHsNCj4gICAJ
Y29uc3Qgc3RydWN0IGF3MjAweHhfY2hpcGRlZiAqY2RlZjsNCj4gQEAgLTU2OCwxMSArNTgzLDE2
IEBAIHN0YXRpYyBpbnQgYXcyMDB4eF9wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50KQ0K
PiAgIA0KPiAgIAlhdzIwMHh4X2VuYWJsZShjaGlwKTsNCj4gICANCj4gKwlyZXQgPSBkZXZtX2Fk
ZF9hY3Rpb24oJmNsaWVudC0+ZGV2LCBhdzIwMHh4X2Rpc2FibGVfYWN0aW9uLCBjaGlwKTsNCj4g
KwlpZiAocmV0KQ0KPiArCQlyZXR1cm4gcmV0Ow0KPiArDQo+ICAgCXJldCA9IGF3MjAweHhfY2hp
cF9jaGVjayhjaGlwKTsNCj4gICAJaWYgKHJldCkNCj4gICAJCXJldHVybiByZXQ7DQo+ICAgDQo+
IC0JbXV0ZXhfaW5pdCgmY2hpcC0+bXV0ZXgpOw0KPiArCWlmIChkZXZtX211dGV4X2luaXQoJmNs
aWVudC0+ZGV2LCAmY2hpcC0+bXV0ZXgpKQ0KPiArCQlyZXR1cm4gLUVOT01FTTsNCg0KV2h5IG5v
dCByZXR1cm4gdmFsdWUgcmV0dXJuZWQgYnkgZGV2X211dGV4X2luaXQoKSBkaXJlY3RseSA/DQoN
Cj4gICANCj4gICAJLyogTmVlZCBhIGxvY2sgbm93IHNpbmNlIGFmdGVyIGNhbGwgYXcyMDB4eF9w
cm9iZV9mdywgc3lzZnMgbm9kZXMgY3JlYXRlZCAqLw0KPiAgIAltdXRleF9sb2NrKCZjaGlwLT5t
dXRleCk7DQo+IEBAIC01ODEsNiArNjAxLDEwIEBAIHN0YXRpYyBpbnQgYXcyMDB4eF9wcm9iZShz
dHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50KQ0KPiAgIAlpZiAocmV0KQ0KPiAgIAkJZ290byBvdXRf
dW5sb2NrOw0KPiAgIA0KPiArCXJldCA9IGRldm1fYWRkX2FjdGlvbigmY2xpZW50LT5kZXYsIGF3
MjAweHhfY2hpcF9yZXNldF9hY3Rpb24sIGNoaXApOw0KPiArCWlmIChyZXQpDQo+ICsJCWdvdG8g
b3V0X3VubG9jazsNCj4gKw0KPiAgIAlyZXQgPSBhdzIwMHh4X3Byb2JlX2Z3KCZjbGllbnQtPmRl
diwgY2hpcCk7DQo+ICAgCWlmIChyZXQpDQo+ICAgCQlnb3RvIG91dF91bmxvY2s7DQo+IEBAIC01
OTUsMTUgKzYxOSw2IEBAIHN0YXRpYyBpbnQgYXcyMDB4eF9wcm9iZShzdHJ1Y3QgaTJjX2NsaWVu
dCAqY2xpZW50KQ0KPiAgIAlyZXR1cm4gcmV0Ow0KPiAgIH0NCj4gICANCj4gLXN0YXRpYyB2b2lk
IGF3MjAweHhfcmVtb3ZlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQpDQo+IC17DQo+IC0Jc3Ry
dWN0IGF3MjAweHggKmNoaXAgPSBpMmNfZ2V0X2NsaWVudGRhdGEoY2xpZW50KTsNCj4gLQ0KPiAt
CWF3MjAweHhfY2hpcF9yZXNldChjaGlwKTsNCj4gLQlhdzIwMHh4X2Rpc2FibGUoY2hpcCk7DQo+
IC0JbXV0ZXhfZGVzdHJveSgmY2hpcC0+bXV0ZXgpOw0KPiAtfQ0KPiAtDQo+ICAgc3RhdGljIGNv
bnN0IHN0cnVjdCBhdzIwMHh4X2NoaXBkZWYgYXcyMDAzNl9jZGVmID0gew0KPiAgIAkuY2hhbm5l
bHMgPSAzNiwNCj4gICAJLmRpc3BsYXlfc2l6ZV9yb3dzX21heCA9IDMsDQo+IEBAIC02NTIsNyAr
NjY3LDYgQEAgc3RhdGljIHN0cnVjdCBpMmNfZHJpdmVyIGF3MjAweHhfZHJpdmVyID0gew0KPiAg
IAkJLm9mX21hdGNoX3RhYmxlID0gYXcyMDB4eF9tYXRjaF90YWJsZSwNCj4gICAJfSwNCj4gICAJ
LnByb2JlX25ldyA9IGF3MjAweHhfcHJvYmUsDQo+IC0JLnJlbW92ZSA9IGF3MjAweHhfcmVtb3Zl
LA0KPiAgIAkuaWRfdGFibGUgPSBhdzIwMHh4X2lkLA0KPiAgIH07DQo+ICAgbW9kdWxlX2kyY19k
cml2ZXIoYXcyMDB4eF9kcml2ZXIpOw0K
