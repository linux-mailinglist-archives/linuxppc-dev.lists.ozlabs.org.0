Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 180F25BD74A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 00:29:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWfVD6v3tz3ffL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 08:29:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hitachienergy.com header.i=@hitachienergy.com header.a=rsa-sha256 header.s=selector1 header.b=joCTNtjG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=hitachienergy.com (client-ip=40.107.105.129; helo=eur03-am7-obe.outbound.protection.outlook.com; envelope-from=holger.brunck@hitachienergy.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hitachienergy.com header.i=@hitachienergy.com header.a=rsa-sha256 header.s=selector1 header.b=joCTNtjG;
	dkim-atps=neutral
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2129.outbound.protection.outlook.com [40.107.105.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWRm51kwpz2xJ8
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 00:25:23 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g5rw5WqXcmb9mkmqgCKyBG8T9xuU61xr7W9XI4Od0c1ed86OBbyXY1+maXZVtU+CA0h3635ktHHH+OSxgQobGnmEeki1WKE73Jh6GHIMD+ePvCYwLXQqNMslCQnltM9uWrUlrsVIB5MGVI9kdFWgeG9nzNWlhU5dv14TTiT3+S/O7Mr5mA1DiG6aZx7lmzyTM/SrBRcl3vtFHYVfh31v0BdhftUMeZkNXVzNfYiCRaWDZOTZVG0u3HaUrF0bKRBPpnDOCwd+lI86WDOFEsU7K3+U7npwEJa6RWXp8oXNsl0IcRn5AoOBoy2u34ERT/ecUMI9cQFArb3Ui4yciHsOyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zBhDki20oZkW7k0X+HKQCZ4Jnm3eU/9kmX5q/iyLNq4=;
 b=BgLkfAHHXf0XLRg03AcLHkDvh2AN+nZGUVAMr0wuGW0omLITsUDYusVxi5fvL5UUV6EwGavjmQd6R2TcgHKQkUiWfhJfkXehnNOe6018kDuRys7cJJmvmumRcTVGecT3oDIl9QtFFAVhB11ZhC5F3HZ3UQXZXAHawy4Tt7ibLQ00uzz0Yr9tyaz48w3kMaI/vw/+ZS2ID8Ecn0JtFCo90OefByK/s0XbmLN5yywI87jUzVnPt48P5oDEBUsfLnOu6PZEhAzrEnP8XCIImsp1lZg1nDS/e+X9Xn8S7MS6M77iRhc3OcP9uwVoU5X3+ne0JNMsL8QCKuLMbwHZEVRCgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hitachienergy.com; dmarc=pass action=none
 header.from=hitachienergy.com; dkim=pass header.d=hitachienergy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hitachienergy.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zBhDki20oZkW7k0X+HKQCZ4Jnm3eU/9kmX5q/iyLNq4=;
 b=joCTNtjGefch5F9vivzv77sj68sPW/BUcxGm3n33bBsOCEzbFw6ckScxLqzcZh808cjTIIfaRHqvGYKbCjKIbqKpEsfkWbHlDHcqcsN28rPzh7SKlK3qkz+U120uPTTS/nT8sxrJG/XkutwOO/UxGhfi4FkjvHFDtabsm0agpuoXJrHQYd+K0wGF13R1IdT0/8OV57BaHCuvYkhQG1I2oRZhUKCcQQcRBy2M/Qji8QG+eoj7HHNKEIrjbKOv/ku/jxXZ2Np3LuMW8S276N01wpry/IjfK3LZiM6NSqA5Pw074oiXpRV9D+UWwhs1OQgM+LPYUc/JpMMfluIKsoULAg==
Received: from DB6PR0601MB2485.eurprd06.prod.outlook.com (2603:10a6:4:21::10)
 by PR1PR06MB5753.eurprd06.prod.outlook.com (2603:10a6:102:10::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.19; Mon, 19 Sep
 2022 14:25:04 +0000
Received: from DB6PR0601MB2485.eurprd06.prod.outlook.com
 ([fe80::c09d:437c:380b:8569]) by DB6PR0601MB2485.eurprd06.prod.outlook.com
 ([fe80::c09d:437c:380b:8569%2]) with mapi id 15.20.5632.021; Mon, 19 Sep 2022
 14:25:03 +0000
From: Holger Brunck <holger.brunck@hitachienergy.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Christophe Leroy
	<christophe.leroy@csgroup.eu>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: RE: [PATCH] powerpc/83xx: update kmeter1 defconfig and dts
Thread-Topic: [PATCH] powerpc/83xx: update kmeter1 defconfig and dts
Thread-Index: AQHYwt7jfIzzrAag70uL8Z8S6EN1Fq3UmQSAgBJHwNA=
Date: Mon, 19 Sep 2022 14:25:03 +0000
Message-ID:  <DB6PR0601MB2485716EBE45037CB8ED7196F74D9@DB6PR0601MB2485.eurprd06.prod.outlook.com>
References: <20191216095006.13590-1-holger.brunck@ch.abb.com>
 <269be158-2451-30cc-f478-0b0453b58c3a@csgroup.eu>
 <87y1uueq2o.fsf@mpe.ellerman.id.au>
In-Reply-To: <87y1uueq2o.fsf@mpe.ellerman.id.au>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-processedbytemplafy: true
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=hitachienergy.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB6PR0601MB2485:EE_|PR1PR06MB5753:EE_
x-ms-office365-filtering-correlation-id: 7857b3fc-4c74-4dd3-c6bb-08da9a4abe5f
x-he-o365-outbound: HEO365Out
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  WqqhKU09hAVrRpww1kK/a7Djcyp1rPX/Xx5snSy1JiITTYX32bPV2hGt1XcaGQFcysqnq8+gc9vyEAvq8QCc7t/gUWtLfbZtvObm4znFxzmbyPWqaoLF2Z/V9IJpwoCi/qNN/9cMo8dqzvQqMYgcZqXS3omQE4fMaX3arAfOBiqTPeCar4Ab9nj5OU+qLFCQVDrS2D8FJ5J16mUoiEnzpD9yfirJ0B7RRRW3GOYDmGHKNv9Eq8OLc1zFiAdk6BdoqPyDE+c2jpGl9FuTwzMPRYFZEoIIyWld1qyuyNXsKvG5+wezgNYAz2UAoTIgtPUnRWsRl7XlDT5eFc63P+XW0/8cGdDqR6EFRtgGd1GbWcnLKyRZiNlQYiaf4ozNouANO+4gaY2Z3EPJGV51Yq1qFIpnRhdvDvxKUtYafFUw+uCxrK8UjTELbg7cwu/nug0BaGEPSX8rdZ6NcR11RBWRPhm0zPixQUAK5BxYkNQgVmDHk/T2+eAmGacZrogLNEZhDVP7tOALOahXqhnzW83Fdwa7iWql1AqmpAQVihlDDHKOdNtsMYoJVyUrlZe8X6bzgsoRvpIdgRxkfkC3Z89uKDxWMJkWDwrzFfaeyjnBRV/lIH8HmSMX1XaYF8PwgRd5YBJL+GyUOLfMGWYUmIC7MUn5egcCSb4Grd1xZ0bXXL2PlWF4XgXeRXjp6069uAZPzQXopovK1lV2E87YGikHjfPTgYqd0+0GSLQMp1tr7K/SFCpe43PLXPtmy7uOnFJEa7mG2CSpY9gm/rA33jY1TA==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0601MB2485.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(136003)(396003)(366004)(376002)(451199015)(86362001)(33656002)(55016003)(110136005)(71200400001)(38070700005)(316002)(122000001)(38100700002)(8676002)(2906002)(82960400001)(478600001)(7696005)(9686003)(6506007)(26005)(76116006)(66556008)(66476007)(66446008)(64756008)(4326008)(41300700001)(66946007)(8936002)(52536014)(83380400001)(186003)(5660300002)(66574015)(4744005)(44832011);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?WkxxWlpsRHQzc1JzTHhrcFU5L1BySHNsdlh2ZjZSd1lDUHBvZWpTNjNHWUUz?=
 =?utf-8?B?b0lxeFU3aU5oNlBkWnhTTlcrMGcrT05OU3ZnRmZEWWp0T1ZiUmRuMTU2MVFY?=
 =?utf-8?B?YUc5QUw3N3k5WnBPbHJudFBaOXZsd2gyS1V4a0htcUdZeWp4UmpIeEI1eXl5?=
 =?utf-8?B?WS9uaHVjQ09YbFJOTHpCa2NGT1JRbkp3UlFZcDdCNURodUtVd3JmNm9Fckh3?=
 =?utf-8?B?bCtrUndTRFYxak1ZemgvVkpTanIzbVpEamp3eVdlR05xeXYzN3V5K3VTM0NY?=
 =?utf-8?B?UkVTWW1JTU9ybG80cndIQ2laRER4TGFFZE5qaE5rUjFJY0hPMzNJSjBKOE9x?=
 =?utf-8?B?aDNPdytCcTFyNlFxbGlQb1l3T0pzeVhLSCt3YllhZ3VXSkxYamxnV2ZCSm0w?=
 =?utf-8?B?ZmpWRFcxNWszSFFSYmYwd0ZKSE9QejdyUmh6TjVsZEZ1RDlHMC8xV0Y4YnBX?=
 =?utf-8?B?WGt6YVc4UEgxbE5CNFRsSGg2SWlFa1dEV25jQVRXaFBwUXlxZWF3K1pHVlp5?=
 =?utf-8?B?dzNBTlR0ZE5XcFY4alFrVHNGZ3d4VzNxdmJncCtKYUJqc2ZiOHl1ekcxaVor?=
 =?utf-8?B?TlRkV1A2TDlhbDMxSHRWUnJNazJDTUVrUXlzb24rRFNhRU8zSFExMmhoWGlz?=
 =?utf-8?B?OENiOU5QS1B3WjZVTU9VYUpJVkhaSXRIT1FFbG0yMkhTcHlJWEpYenRKOEhN?=
 =?utf-8?B?a29TcGFqd1BhQXlvdlBwa21ZMjB1NHdyME9TQ2Y3L012ak9NR1FaNzhBUWx3?=
 =?utf-8?B?b3o4R01ta1JQejJicUlaa0M1eXZ2T0tObnVvdTlXaGQ1RGdLTHYvajN1Z1Vt?=
 =?utf-8?B?SHFVNEZ6U3I1UzBQbEo0clhNV3Z5aXI4emRTalRpZWZ5azRUa25ZTHJUQ3pE?=
 =?utf-8?B?RjgyUi9YT0Z1d09SMVU2Z3Mza0xIVzNzckJhTmppdHl0K1FiVXJFUC9adUpI?=
 =?utf-8?B?R0UwNE1sUnlwczhLS2pVNFlJNXVsNUZ4WTNFUEgvYUMzYTUrL3NkWFBwTmp3?=
 =?utf-8?B?YTFKU2VUVk1mWWp4cWJ2NXhkbkY3SVF4MlZqcjE2TFZWcmxNei9McDdnYzJo?=
 =?utf-8?B?ZGJoeHA1bi9ieVY3R0pnWGRsZmJSemRPcjBTeStuSFhYem04T2w5cVQyVlVC?=
 =?utf-8?B?WUgxZkIwZzRIT2VjcnZPWExEOURTZHVQTmZ2bkZvbnVEbWtPc0grOFFTQ1hl?=
 =?utf-8?B?YmdIeTV4cmNwVnh4UHk3NllZZ0xXUG1qODFPUzJvQVlkTGh2L243b2dNT3Zr?=
 =?utf-8?B?OGhjcW5QRDlEenFWSzAyRkFMd0tkTi96OWQyaWJ6cEVkSXROUG9XNHZTNVdV?=
 =?utf-8?B?RG1hVzNCUFZ6WU1wRjVMMUZOdmhpVXViOWNGd3VnSlNXZW1XMHBocE1iZ2V4?=
 =?utf-8?B?bjNnQkh4MEhQKzVlRGdPR0Q2U2FjeHMvSVJIVWh1bGtmSkFVYnlVWW9CdkJ6?=
 =?utf-8?B?VFovazNhQ2EvZjNRUlhVMndaU21PdXdoQXJPUkZjeWN6T2RzNkVsU1ZvMlFH?=
 =?utf-8?B?ZzRtZEhiQVcxR1hVcncrT3RKc3pGYTloWktoYU8xenE5YVdSNWVHRjlOTkZz?=
 =?utf-8?B?NzhkUU5md3JuVkMyNHFKUTlXOTFGdmxQSGcvN3F4SnYwa1JjZXZha1I1ak1H?=
 =?utf-8?B?QjE5UE1GOTZUZUliUm5ZVVpPVlliMHNUYUxNV3A5NU9xYTZmcHlMbWFtckpL?=
 =?utf-8?B?d25FYS9jVkRVRlA0T1NSRHVETW52emRtZEJFelB0Z0pHVGVXdGQrblExS2t0?=
 =?utf-8?B?WnFDUlZaMlNVQkJLNS9ESzhFOHpTUjF2Z0RTSkk2bmZIT3NIVHBIU1g1OHRu?=
 =?utf-8?B?N0VEQjlQU0pkb25VZjc5THpvbHlyVmUvUHI0enZ0M1hSL1JLdzFNR3c2Nm9n?=
 =?utf-8?B?cHRGVWhSLzYxMUFLbWJXNEVmVnp5REkzZE5yb2E4SDRPUmFGWVVHNzdRYmhY?=
 =?utf-8?B?L3c4cTFaKzRoYUpIT1YzVTFYYjE5cHV1aXpQTUVna25VbDlYdlFoVi81S3cw?=
 =?utf-8?B?WnJIb3JTd0dQbVhEandFb1hxdmdReHVybGYwRnk2K3FMcjlXTmhlT0svQ3gw?=
 =?utf-8?B?MURTOC9SRlN1MS9EVUh0L3FrMU9HNGZkd3NRVXJ4bHo2a3duRWpSSVFSTW51?=
 =?utf-8?B?ZGN2YVQ4Y1g3elJpb2VreHRwbnN3Tk5nWlBMbVpTcFNtbEUzeWM0dnRqOEdp?=
 =?utf-8?B?MXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: hitachienergy.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0601MB2485.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7857b3fc-4c74-4dd3-c6bb-08da9a4abe5f
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2022 14:25:03.7926
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7831e6d9-dc6c-4cd1-9ec6-1dc2b4133195
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uPr+VxJsiPdj8bP4kS1rNn/caoL1OfnG3Ml8PGqo1nOKTYTbNASCYFJKoQTBFZr5n6CNhBGkyt6zipadXad+cGQOY4Ma/4KKF3O2FTx8atk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1PR06MB5753
X-Mailman-Approved-At: Tue, 20 Sep 2022 07:59:18 +1000
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
Cc: Heiko Schocher <hs@denx.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PiA+IExlIDE2LzEyLzIwMTkgw6AgMTA6NTAsIEhvbGdlciBCcnVuY2sgYSDDqWNyaXQgOg0KPiA+
PiBGcm9tOiBNYXR0ZW8gR2hpZG9uaSA8bWF0dGVvLmdoaWRvbmlAY2guYWJiLmNvbT4NCj4gPj4N
Cj4gPj4gVGhlIGRlZmNvbmZpZyBpcyBzeW5jaHJvbml6ZWQgYW5kIHRoZSBtaXNzaW5nIE1URF9Q
SFlTTUFQLA0KPiBERVZUTVBGUw0KPiA+PiBhbmQgSTJDIE1VWCBzdXBwb3J0IGFyZSBzd2l0Y2hl
ZCBvbi4NCj4gPj4NCj4gPj4gQWRkaXRpb25hbGx5IHRoZSBJMkMgbXV4IGRldmljZSBpcyBhZGRl
ZCB0byB0aGUgRFRTIHdpdGggaXRzIGF0dGFjaGVkDQo+ID4+IHRlbXBlcmF0dXJlIHNlbnNvcnMg
YW5kIEkyQyBjbG9jayBmcmVxdWVuY3kgaXMgbG93ZXJlZC4NCj4gPg0KPiA+IFRoaXMgcGF0Y2gg
ZG9lc24ndCBhcHBseS4NCj4gPg0KPiA+IElzIGl0IHN0aWxsIHJlbGV2YW50ID8NCj4gDQo+IElm
IHNvIGl0IHNob3VsZCBiZSBzcGxpdCBpbnRvIHR3byBwYXRjaGVzLg0KPiANCg0KT2suIFRoZW4g
eW91IGNhbiBhYmFuZG9uIHRoaXMgb25lLiBJZiBJIGZpbmQgdGhlIHRpbWUgSSB3aWxsIHNwbGl0
IGl0IHVwIGFuZA0KcmViYXNlIGl0IGFuZCBzZW5kIGl0IGFzIGEgbmV3IHBhdGNoIHNlcmllcyB3
aXRoIHR3byBwYXRjaGVzLg0KDQpCZXN0IHJlZ2FyZHMNCkhvbGdlcg0KDQo=
