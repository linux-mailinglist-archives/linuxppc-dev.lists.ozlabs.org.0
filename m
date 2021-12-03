Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E210F4677B5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Dec 2021 13:56:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J5CVk6KlNz3c50
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Dec 2021 23:55:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::614;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0614.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::614])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J5CVB1Djgz2yZv
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Dec 2021 23:55:28 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BHl6L02FzITPy6Ee8bYsFEqd/jjQhPI1JFKpp5rc+zqy/Z0U6DNca7lhM+cRWWRKgpkYeJrve0rYjVVXTzNZVE5WnSQIX9Y4WBrTx9RLIiwlJqRkMLwGqqALX48V7h8RYPyKV+c+C/NvCkFU3KaFP0PLav8pGpGWpTrJHmpSlw6nsByXf36dD20ytQfhvE9rrOW3pG9Ri146TlLoxjPBpGpd2R4U33eA5NO217tVOJEw85pA4teca09YznDTpsasfu7AC67SRnBiJVy16bfc6dh6dmHroCJuqqQXmQ8LzQ4bYvY3mgCHDRubjSUemIKKN7vbWLARn9Q98HRqDUftvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XyFrm4zDsMaFMkX9HeY/4Y3S83gPv4F/c83Y3Si5Abk=;
 b=ZE6qT0KVpkeVc/XdNpYvr55MEk46IqnpPZhbQt4s2M9RgMgxl1YfU3+UE2xPZZq3cm7bzepqCuTCU7C5CwCpWMwAPsFYgPLjMnrgGXZbFFq662rRFT/Tn7+r2n6ETPZK8hPA2LEbeEG90veRK8vOIwcmxXQJ0vMQX793IFl68d++1ju6Oxwov2822Oedpjp3u4872UQOJ9gXL15GfhXtS9m4Ijf+9P4kDNl4dgkDKfl1ygkJmMsD1X14Tv5K/Uv7gcmBkk8g3r6vnaOPGoj9KhisNX7hq4frrc2rG5Dad1uhOL2FYOyELFuzTiZK2lLAnLmFtEimJ5BKeQXwK0Gxmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB3074.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Fri, 3 Dec
 2021 12:55:09 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f%2]) with mapi id 15.20.4755.016; Fri, 3 Dec 2021
 12:55:09 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH] powerpc/ptdump: Fix DEBUG_WX since generic ptdump
 conversion
Thread-Topic: [PATCH] powerpc/ptdump: Fix DEBUG_WX since generic ptdump
 conversion
Thread-Index: AQHX6EMVBrYf2+++nkS63DfnL1VR36wguXqA
Date: Fri, 3 Dec 2021 12:55:09 +0000
Message-ID: <085c3f0b-9162-09d9-34be-387f43f0a45a@csgroup.eu>
References: <20211203124112.2912562-1-mpe@ellerman.id.au>
In-Reply-To: <20211203124112.2912562-1-mpe@ellerman.id.au>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 60f8f5d0-4c7b-4169-dde1-08d9b65c2358
x-ms-traffictypediagnostic: MR1P264MB3074:
x-microsoft-antispam-prvs: <MR1P264MB30749345C773E674357548ADED6A9@MR1P264MB3074.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3OMqWm+yzpSvCjpgh5bogYr/fsv7+iBa0LtDlK9E1vfD62cEanHi8c6KbRcO4zaRImvDDj3h9RRakQToEgngzo7dwEi1Flv4qbauB7Bh5aBEGzIPmgI9nuuXiQIpW6m7+oF++lJqpqgvlBLQ63igXQPpYvLkZS8QHdN/vxrVBFvC5OksWkh2vkf2jtxbYySIC3K8soV5TbW5mCCkz42aqF6h6CkRhclmNENSL5gv+tjYLao5y+USVLJtoKyaLQaUFE/jQTdGscRBxKUcRBnFEqZ3bKhWHpeviR6DmKNdduQbK06gO43PnhZACTmj494RObtzppV40A+08vBC2U8Iz+ZN7qPbQDyvSjXiG4ADD6+s1Fn3IhVaKrKYlvK3VPHUjKe5kOmkFLtO73zWIMB9ISs1BnwgK2qkj/IificG5J6zWan4Of1bbbHYRO+d47xAlz5GzNUaB+qfWrlVSTMjDNLxz6tjhWnRUTnsQlq8zQY6a7UT3f5lwk+61vDNvayBcSTH36liNWpO3mL9bcwPnzDXbF9AThyLoRKMysP2NZ6bqiR0a80j9ZxCL4zNMgd8iegxCc2G+HVrIkAZ84Fth2exzdkTbabQ7wMxfvbOWIG4sUiEdYS8ACwgq6oXmJ/nqItQEysd5//11BTwMRwhPglUd8e+0hWe35gKfOqY89hVsnKYVZet0VI/Pzg4SvoG1LJhuLXgFMyo6vn9x2QVJWekvHZcpyChXd038LRrTLBxkKqBKoNaZqA6RZODwQ19mk9MzxGov8gb/qXUsdGJbqwycOSqRypoBr4h88Q0+YU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(110136005)(36756003)(186003)(66574015)(38070700005)(8936002)(71200400001)(44832011)(8676002)(6512007)(83380400001)(26005)(2616005)(38100700002)(2906002)(5660300002)(76116006)(31696002)(6506007)(64756008)(91956017)(508600001)(316002)(66556008)(31686004)(6486002)(66446008)(66476007)(122000001)(86362001)(66946007)(41533002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RDc1V0FxMko1dTFxc0h4WjlQbys0N2hJYUNPT2s1WmRrQ2NNN1FNcHAwRGsx?=
 =?utf-8?B?cWMrM3ZreGc3R3BoRkFzRXhyUFZXMmFlcXpDQnNhbzF4ZnNqQUpRUDBGY3lY?=
 =?utf-8?B?K2NibWtHcUl6TTZjY3FHNXl0MWJZck5rS3VpQ01RM0Q3UUU5VFh0Znd3NmU2?=
 =?utf-8?B?THQxd0hxTmRBL0x0RTlaWDlWNHdvRDhGRzN5SUZXc2NWYXVYcmlJN0xybE1t?=
 =?utf-8?B?WW1KeXJWTTFuVjVHa2t2TG1wRVc2MWRQbnUvVFNSZzlVbjVZY3hXbktuTS82?=
 =?utf-8?B?STkwL1dEdnE0Q2dZWmc1b1FUK2ppcVZMV0VXN3hDeSt1eW0rYzk4WXZTb2tp?=
 =?utf-8?B?QW9rR001QXNnS3hNdVhtaERjZW9nZEpiQy8zbnFIemxBWFc1M08xaVNOMlYv?=
 =?utf-8?B?c3hucXdXd1JYck1Wd3owNUoxRjVpVEs5VkRROTJSejczSnB0R1g3UGJZOE9n?=
 =?utf-8?B?Z05WanMzeVVPeENGM2RoMlhUZ0ZDK1JsMXpIT0hha1IxeE5XT2E3NjhJNTBB?=
 =?utf-8?B?Uk5jd2dOVlZaWHdvTGpUMHM2YVUzMzF5QTd1NndpVHJDRXFrMWRTbU1pZDRZ?=
 =?utf-8?B?M1RwT2FxdXRWOWtDLzVIbTY0U0h0ZFR1L2EwaFR0N1lRbXpyQ3YxL2dyLzZY?=
 =?utf-8?B?ekNuS1JYRG1jUDZGczV0bmIxYjRwSzJLcWp3VjBPSHA3Q1dSU0Y1TzdpeWRy?=
 =?utf-8?B?ZzR6akdMaE9GQnRPRDkybXJHS1c0NWFJNHVVVThTWHFYUkpocVA3c2Zmdzc5?=
 =?utf-8?B?ajdod2RpRG9HQTZpMVZleU1VTHo5TmtPTC92elR3YXpKQ0R6MzJoZ1hVc2p2?=
 =?utf-8?B?Z0VLSHB2eGNqVU9wVm1iakpiWHdlOHE5M3llTmdmcjFGelEyZW5nMjBVZkpE?=
 =?utf-8?B?dGtpL29TbVJYZGMwYWVXYURyRFRscjVYOWZ4ei9qSDhxQm9ZR1QraUJSK28z?=
 =?utf-8?B?SGl5SVJDQllUNXFoLzdKazI3clFuY2JuaSt1UFJEcU5qZkZCbEp6c3lvczdr?=
 =?utf-8?B?TDhMRGhoOERHdm5hVGt3TkExaDEvZ1FPZ2I3elZ5dHY3aVhrQ3BTN0VKM2FS?=
 =?utf-8?B?VTQxeFl6QjVIMHl5djg2cWtLZkhZbGlxbkozaWpDeUdsUFoxNEJsbWZ0NGJW?=
 =?utf-8?B?Qk02L041R3dRS2oxR2h5YmMzWXVUZVowSEdzWkxnT0EyUmkreEhndXlpcldt?=
 =?utf-8?B?T3R3QXFFWHZEdmtVR0RKUWpTa21HWklxbU1EY2FKcmxadTRhN0lrTmd2UW5s?=
 =?utf-8?B?bDRTQWNOOFhrTWpvWmZQTXJ0S250b2EwdExUaFp3TTJ6TGJ2QnFGMHUvcVlO?=
 =?utf-8?B?cWpWRzFlSnZrS2cxcXhQUVAyaHEycm9sbmg4czRldmpCTVMwQ3RqdGVOKzJY?=
 =?utf-8?B?cWo0azNjYVEycU1ZWmlKb1hLYWpOQ0U2d1o3MEdxZElxengxUnNTcTM4UkR4?=
 =?utf-8?B?WWVPOHhhZURJZmhlMy96UDhnUmg3RTlySVgrMnpmMTBlNnNqeDB6QldNMUJv?=
 =?utf-8?B?by9kVjlwSjVGYXlSSXc5c093c2hxcW9POTVIS25zZFFJZnFDam1pRmFZMEla?=
 =?utf-8?B?NHk0d0xBaDFSNkJKZldUUk0yWUtKbUwxVnZsQlcrY3k5QnVRUldtdysvNHBQ?=
 =?utf-8?B?NHlSMENUME8xd1ZoZ0piNmthdVMrUTllNHZmQ0g2TE9FbGpJSnFJQzBKOVhs?=
 =?utf-8?B?VXJQNmFlakg1cHRzd2w4TWcxRXVaNW16ajZyNlBGNWNUUmZpa3liZmJFSStS?=
 =?utf-8?B?eU9oSFFPM0ppaUM1NWZQTUJaYXRDRTZ6SVlNRTFHUEhBOG5SWkswSDhsREZq?=
 =?utf-8?B?aDVNcmFHQWlCSmFQUHNJclNmVUszODNsaERodTl0ejgrNnF5VHgrMXVaa2Q3?=
 =?utf-8?B?bHpOdllIMEtIV2ZPd0NBdVRkMGJvRzc1bmt2K1lraVgyVFVIcTlORDFIOG9G?=
 =?utf-8?B?bUtvSXZsSDZSMFB5ODR4NURmcmU1cStjWHpwM0Mxb216T3QxblFlcmJxSVJ4?=
 =?utf-8?B?WER5L3gvNENtNm9qb2JlSC8zd3g1ZnBTTUd3QXowbThYQ2xKWUI0MGNPbzd4?=
 =?utf-8?B?dS9nd2dNbWwvQTFRb2VZd2I1cUI1b3BJZVd2L2VEbmtNWlpERE1aV0dxQ203?=
 =?utf-8?B?clNJaHppQkRyVHZ6STZiRjlWNy9xbzl6RG5kd2V2eVhwbnNHcWRwME8yM3ND?=
 =?utf-8?B?N2NZbUJxOWJkZi9ZU1ZCSXJLQ3phd2hvRWNKMDZzbUlMellOUndoZ1Jybktt?=
 =?utf-8?Q?XXnlpSC8z4KujEYaUfa/6lYL4YFJn9XxlR1Q+nYOK4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <08B5EECCC477AD4FBCE254DA5D46B2B6@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 60f8f5d0-4c7b-4169-dde1-08d9b65c2358
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2021 12:55:09.4873 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qca1zRGnZYaKoi4CbPjmjr0S63dQ1PY7b//faXDxOC0ItWxhPsDmHmg1lC2sWcfQbWo0vgrY41PQsGQzt/DoIYOTo8rkI1xpV0yr22sOuoE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB3074
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDAzLzEyLzIwMjEgw6AgMTM6NDEsIE1pY2hhZWwgRWxsZXJtYW4gYSDDqWNyaXTCoDoN
Cj4gSW4gbm90ZV9wcm90X3d4KCkgd2UgYmFpbCBvdXQgd2l0aG91dCByZXBvcnRpbmcgYW55dGhp
bmcgaWYNCj4gQ09ORklHX1BQQ19ERUJVR19XWCBpcyBkaXNhYmxlZC4NCj4gDQo+IEJ1dCBDT05G
SUdfUFBDX0RFQlVHX1dYIHdhcyByZW1vdmVkIGluIHRoZSBjb252ZXJzaW9uIHRvIGdlbmVyaWMg
cHRkdW1wLA0KPiB3ZSBub3cgbmVlZCB0byB1c2UgQ09ORklHX0RFQlVHX1dYIGluc3RlYWQuDQo+
IA0KPiBGaXhlczogZTA4NDcyODM5M2E1ICgicG93ZXJwYy9wdGR1bXA6IENvbnZlcnQgcG93ZXJw
YyB0byBHRU5FUklDX1BURFVNUCIpDQo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnICMgdjUu
MTUrDQo+IFNpZ25lZC1vZmYtYnk6IE1pY2hhZWwgRWxsZXJtYW4gPG1wZUBlbGxlcm1hbi5pZC5h
dT4NCj4gLS0tDQoNCk9vcHMgLi4uIG15IG1pc3Rha2UuDQoNClJldmlld2VkLWJ5OiBDaHJpc3Rv
cGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+DQoNCj4gICBhcmNoL3Bvd2Vy
cGMvbW0vcHRkdW1wL3B0ZHVtcC5jIHwgMiArLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9t
bS9wdGR1bXAvcHRkdW1wLmMgYi9hcmNoL3Bvd2VycGMvbW0vcHRkdW1wL3B0ZHVtcC5jDQo+IGlu
ZGV4IDAzMTk1NmQwZWU4NC4uYmUxMjBlMDlhYTNlIDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2Vy
cGMvbW0vcHRkdW1wL3B0ZHVtcC5jDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9tbS9wdGR1bXAvcHRk
dW1wLmMNCj4gQEAgLTE4Myw3ICsxODMsNyBAQCBzdGF0aWMgdm9pZCBub3RlX3Byb3Rfd3goc3Ry
dWN0IHBnX3N0YXRlICpzdCwgdW5zaWduZWQgbG9uZyBhZGRyKQ0KPiAgIHsNCj4gICAJcHRlX3Qg
cHRlID0gX19wdGUoc3QtPmN1cnJlbnRfZmxhZ3MpOw0KPiAgIA0KPiAtCWlmICghSVNfRU5BQkxF
RChDT05GSUdfUFBDX0RFQlVHX1dYKSB8fCAhc3QtPmNoZWNrX3d4KQ0KPiArCWlmICghSVNfRU5B
QkxFRChDT05GSUdfREVCVUdfV1gpIHx8ICFzdC0+Y2hlY2tfd3gpDQo+ICAgCQlyZXR1cm47DQo+
ICAgDQo+ICAgCWlmICghcHRlX3dyaXRlKHB0ZSkgfHwgIXB0ZV9leGVjKHB0ZSkpDQo+IA==
