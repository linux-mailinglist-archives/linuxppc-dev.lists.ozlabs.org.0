Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A208A4E20A8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 07:43:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KMQ6r4Vt4z3bZm
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 17:43:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::629;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0629.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::629])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KMQ6K2Rw6z3069
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Mar 2022 17:42:48 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F0d7s+Y8AkHQFrgT6jIaneYa8AeIXj/XsLNCp5LVgg62yWfjopjTpfLLxmXM1Yt6XEJbXRTqxLIew+HdIL7qcN7mwLggyUL/X5/JwWXF8YGSCN1UjRqPO7TLdL+JEsZXqAB3gA4uOqNMT0q2ehO3nmsOPDqjVJSRKNQGx+A3ZMOIrSiKXhqnLxjlAF6C9iAY8dDlApB5vL5T8jux2jFdrWnjKiw6MGeV+queIA43IPMksJVO/kc1IxwowmbuehDgVlcw6m3Cd3+DlbSm6jxsdoEboXPCNmrYH/ZUXwMcuOYYVVA0Yd1uT5gj5j6HbjdrctRjysSg8LyvRQy+9EwdbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2c63IuyOTtrsDjMsGUx6hBYOb1HQKMCbFbhtUd3LrLo=;
 b=VhxvwQ2TlX+fOLXfh8hQ2AR3yQcPp7geXnsGXr2IqmQEii2suq2koiQT1isRc33foEmjeSwEi/Ph5gf/7yKcK1oR1neGi7NEz/BGDYrYbCaaJ7MFyrNOXzp3vTzvB8yhM85TLbTEDHCUSkwkaFe9DdZQjAbc8yStwQ/2UoMYciVRJNhdZBAngmPebX31CNhwMvbjagKYDkXY9v6vrjRoAiY8yyG2l0BVHAGZt+3uvWT9q6rsSrpKlK0DxD92MCo4I6djKjk64wFVZT7nP/bXTeqbDSPe+SB/4AIPYjSCFV9gPiOJ4Ovg5FlB8GWv0KL1ODhB+X54o4Of8TdnLJk7sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB1946.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:16f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.19; Mon, 21 Mar
 2022 06:42:29 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d%6]) with mapi id 15.20.5081.022; Mon, 21 Mar 2022
 06:42:29 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Finn Thain <fthain@linux-m68k.org>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>
Subject: Re: [PATCH] macintosh/via-pmu: Fix compiler warnings when
 CONFIG_PROC_FS is disabled
Thread-Topic: [PATCH] macintosh/via-pmu: Fix compiler warnings when
 CONFIG_PROC_FS is disabled
Thread-Index: AQHYO2NbGWH8CI3mhU+PVN1BAmrQRKzJZuMA
Date: Mon, 21 Mar 2022 06:42:29 +0000
Message-ID: <bb6d3131-3c46-654f-d2a0-6d57bb8cbfbf@csgroup.eu>
References: <650f5577599a701fdd632cdd469a9cea9788cdf3.1647674431.git.fthain@linux-m68k.org>
In-Reply-To: <650f5577599a701fdd632cdd469a9cea9788cdf3.1647674431.git.fthain@linux-m68k.org>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2c497937-e882-4a4b-4e9a-08da0b05f816
x-ms-traffictypediagnostic: PR0P264MB1946:EE_
x-microsoft-antispam-prvs: <PR0P264MB1946871844D69C726E5F2098ED169@PR0P264MB1946.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fiGyEcfJWQWNVUmOK7JIrptrWYBswoAmVZfWueBkEplrl7PcjelR+4sBRZm1kY9FgrRj+2eVee3YCr3hTaTFi4gsZQkqv9Tveai801bmLaw6uk9+bGSUfFkvKKF+0mYLF3L3lmB3zwCx0PokkW6oSLU2CG35o8JD4WOi5bq+beX9jrss0dop59i5gfxUgqWxrDOuma2s/FaQvNwfwH0iYosOH7Og2vWghmHnijARTUFsvwk0BE7+JqWJmhJiGLbo/ViaXKu44pTe0N6TIEvMxWqAg9ANx6SdLdtn5VfumE1aX7TmbenFO848AmF2SCX6/3i89oSrrVx9PEUgDQzvco1n8tEOL67LC3JgcS3wyCv6pvPnyEFF8KxzmqR7OdH13QHvNxbwJHhz7xSI6ExQn9wKkoHabEnRQ/oXkwxU9nI5HMWQ76ikX/SD0aeZdb1PnUKF2KKmmUd/s6mncVLZfdmgskshdPcfRZcA+gBW6IfSjjiYjTe8PVMucGH61GvEAAATcq6e76Eaoi60ftFcQnJNnMuSQebhzgsiQ/osMSNJ4t98PhXCMadspZSwh3d/sOEgh5fU8Wrdl77al6fKBFcaqHsKv6lVViyJYPERAYbw0+C7cwiV6Rzns2iFDYO5cQ0znir5Pf3HWBm0fvq2AW6b65HtIrbTk55z0gO5PY+7odUYn3r1SmIZ9zxoqB02LnRwV11Bo6aqKiOFiECnzqs38n4/8gdjUBeFsR02uwmM/yfNtwqJsyUapSXC0qcAlizvuBav2lIVYSphYjjMFQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(186003)(26005)(8936002)(110136005)(54906003)(5660300002)(316002)(31686004)(36756003)(86362001)(38070700005)(2616005)(38100700002)(31696002)(122000001)(6486002)(66574015)(44832011)(71200400001)(6512007)(83380400001)(66476007)(4326008)(66946007)(66446008)(64756008)(8676002)(66556008)(2906002)(508600001)(6506007)(76116006)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bWdTYWtwSFUxR0VuRkpEY0p0OEY1RHFFbmFTdldVZ2pRaThHUUc0MHdKNWov?=
 =?utf-8?B?UjJPTlpxUUZ3b2FEd3JSbWRWTTZvN3g2S0hsOVlKY3JwbDJ6dnNjZHovUDRN?=
 =?utf-8?B?Z05xY04vN1hjNEpHc1loUnNQZFJ5a0NVV2hTL3ZaS2tSeURIdkxsL2tyQ2c2?=
 =?utf-8?B?YUdJczl6L1R3Q2dPTHo2VDNqdmNrSTFCV2htVUZlSVdHaW1EK2JaNHg3TVo3?=
 =?utf-8?B?Yjk5WnFIeHRnY2hPVmo4aXlOSHl4a1FXSUEzSE9TUitCTXpIZndiNC9kaUVY?=
 =?utf-8?B?aFp5ZUhMZm11Z2VGMTdyQ0RrZ2ozcVA4dU1WSUpsbHM5cU1YZlAzZUZ4dGVk?=
 =?utf-8?B?MXZoV3dEUnZkTk1FNWNvaGZHUHArY2FYT2pLeG1WYmtkOUMxcWliOXkwdzQ0?=
 =?utf-8?B?QmhMcjRsMW0vOFZQeTdVQWIyT215UW1NekxnMXBmZ1pWc1NsVTVtRmd2dXJi?=
 =?utf-8?B?MkRPUk1OdWhLTXgzV0pwbjlDU2JwUmxrSHNSOFFiVUdOVGNKRkFWRmtmQjYz?=
 =?utf-8?B?TFA1cno4T2dwajNpVmgzTmJZU2RLclhkN0FKN0pBOG9vZTQ0cUFRNGlSOWkr?=
 =?utf-8?B?YzlFdlJvL25vQWxBRml1Yk5pQ28yNEhFVW43bVI4ODBXbGVBdS9aK09GYmln?=
 =?utf-8?B?d3RVbXlJTS96QTFmQmY1ZFdvUXVvdW1hSTRleGFuVVo0UnNDdFZuWXBHbXk0?=
 =?utf-8?B?VEgvNkl1dDB4VjVjY00vRmVBL005bU5yRnFYZ1BOblY4bE04VEhoK2xTKyt1?=
 =?utf-8?B?YmtrNkpDYUVFem9XNzl4eTB5R2pOZHFBZWZwRTRBVnozaW1lREF2KzVleGRR?=
 =?utf-8?B?ei8wbldWZXJqNDhReTFMSTdwYVR2cDNENkM5RmFMQmpoWDQwWHlkMlREQ0xZ?=
 =?utf-8?B?dDJhMmhpaTFpSFZLZnNEbDMrWHMvYVlxVWRiSHh2dUVCcTBYMGZ6WHFMYWpt?=
 =?utf-8?B?ZndpWHNKN2ZoUk5qRWhIQVRVMDFJUmhLblYzOVdKRWRHVHZPYkhMeGhpOFJH?=
 =?utf-8?B?aWFXU1FuUlFFanFZR0lDNFhlQ1dWbzRBVWtlc210Y3I5US9CMGp1UFhKa0RG?=
 =?utf-8?B?NUVTWkZsc0JROGViRGVkZFg5bDEyOVhDd1FVb0Z5Q05FTXVIWlk2UERyclZD?=
 =?utf-8?B?d1dwZ0RuRitaMDdoRTNISDVEdW1aK2F1dHd6V09sbW1LNWkzdlpDTVRsMUpT?=
 =?utf-8?B?a21MRFFHaFRaRjVvMXVYSkN1Q1NaeVl5MTc1WG56Z1VFekdJUXBCMzNNNXkr?=
 =?utf-8?B?MktEa1kwTHcyYzkxMUxsRzZRVGlYTzdEMjVJZXZ0M0JkZEZpZjVYMGRrQzVE?=
 =?utf-8?B?TVQwSk01NEJRSU9MaitsaEFQU2JXVXYzNkJpMW9kZDFUQk5xcGx5aVM2WVlH?=
 =?utf-8?B?QlVQNjdQS05UT1lwWHh4c3pEZ3lvazAvR3g2dFF2U2dPMGVWWWdrbG5uNldS?=
 =?utf-8?B?WGpyK25aa2F1bG41NVJtcUthUm44Y3F6Q081RWE3eG1FRDdNRnF5aTRyZVkv?=
 =?utf-8?B?bHkyWFdIVHR1Zlc5WVViWE9yc0JHWGI0S2JMWHRjR2cyWjVxZkovUW8zbWxs?=
 =?utf-8?B?RkFIQzRXTEVNckNmOXJPMHRuYXFvTWJJQkNKY1h0b1RkTFpxWFJDMDlKakVD?=
 =?utf-8?B?YmpVaDBIdzFMQTl6S0dLTG5xaGxGSE5kbXRaV255eG85ekN0YkNSWlZoUWZH?=
 =?utf-8?B?VTQ0UHNMQU5IUE1UbFVQVU1vc2F5ZHYzZTdKWlFFR1I0N2VFbkMwWStCNEt5?=
 =?utf-8?B?SW5PRWJMbXA5bk9OUmNFTXdsQzQ2eFFRSlJBckZQUGovU1JDR2tuOGdSdy9a?=
 =?utf-8?B?TDY4bUh5YzJsdkdRZnRHVXVRRzNjWEdRVTE2TXdOdGhrb25kd3lMTlJpcDZU?=
 =?utf-8?B?SjNXaDY3SXA0VHBWQWgvQU5tWlVyMmdFcEd5RnB5SWpNb0ZWV3dzclNkVkFa?=
 =?utf-8?B?ZkJ2czgvTVR1TEFwQks5QVpqLy9ibVVueVkwVllES0dEbzhESXNOUllGM0d4?=
 =?utf-8?Q?XWQpMUmbKcxeXzXhV1+/TXoYd6mXRs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <016D5C7879F5DD488F9E81513EDBC3AF@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c497937-e882-4a4b-4e9a-08da0b05f816
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2022 06:42:29.0519 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iuwu8OFxduzrf6f2nN6nqtRj956fimKRo90VgzgBVBESpC/1Ar91l6D5UIH4VUAHWKUAe4mc6/1iwInzRJxxKCYBnbw21bQrY/U6a8pG5gE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB1946
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
Cc: Randy Dunlap <rdunlap@infradead.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE5LzAzLzIwMjIgw6AgMDg6MjAsIEZpbm4gVGhhaW4gYSDDqWNyaXTCoDoNCj4gZHJp
dmVycy9tYWNpbnRvc2gvdmlhLXBtdS5jOjg5NzoxMjogd2FybmluZzogJ3BtdV9iYXR0ZXJ5X3By
b2Nfc2hvdycgZGVmaW5lZCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWZ1bmN0aW9uXQ0KPiAgIHN0
YXRpYyBpbnQgcG11X2JhdHRlcnlfcHJvY19zaG93KHN0cnVjdCBzZXFfZmlsZSAqbSwgdm9pZCAq
dikNCj4gICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fg0KPiBkcml2ZXJzL21hY2lu
dG9zaC92aWEtcG11LmM6ODcxOjEyOiB3YXJuaW5nOiAncG11X2lycXN0YXRzX3Byb2Nfc2hvdycg
ZGVmaW5lZCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWZ1bmN0aW9uXQ0KPiAgIHN0YXRpYyBpbnQg
cG11X2lycXN0YXRzX3Byb2Nfc2hvdyhzdHJ1Y3Qgc2VxX2ZpbGUgKm0sIHZvaWQgKnYpDQo+ICAg
ICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+DQo+IGRyaXZlcnMvbWFjaW50b3NoL3Zp
YS1wbXUuYzo4NjA6MTI6IHdhcm5pbmc6ICdwbXVfaW5mb19wcm9jX3Nob3cnIGRlZmluZWQgYnV0
IG5vdCB1c2VkIFstV3VudXNlZC1mdW5jdGlvbl0NCj4gICBzdGF0aWMgaW50IHBtdV9pbmZvX3By
b2Nfc2hvdyhzdHJ1Y3Qgc2VxX2ZpbGUgKm0sIHZvaWQgKnYpDQo+ICAgICAgICAgICAgICBefn5+
fn5+fn5+fn5+fn5+fn4NCj4gDQo+IFJlYXJyYW5nZSBzb21lIGNvZGUgYW5kIGFkZCBzb21lICNp
ZmRlZnMgdG8gYXZvaWQgdW51c2VkIGNvZGUgd2FybmluZ3MNCj4gd2hlbiBDT05GSUdfUFJPQ19G
UyBpcyBkaXNhYmxlZC4NCg0KV2h5IG5vdCBqdXN0IHB1dCB0aG9zZSB0aHJlZSBmdW5jdGlvbnMg
aW5zaWRlIGFuICNpZmRlZiBDT05GSUdfUFJPQ19GUyA/DQoNCkNocmlzdG9waGUNCg0KDQo+IA0K
PiBSZXBvcnRlZC1ieTogUmFuZHkgRHVubGFwIDxyZHVubGFwQGluZnJhZGVhZC5vcmc+DQo+IENj
OiBSYW5keSBEdW5sYXAgPHJkdW5sYXBAaW5mcmFkZWFkLm9yZz4NCj4gU2lnbmVkLW9mZi1ieTog
RmlubiBUaGFpbiA8ZnRoYWluQGxpbnV4LW02OGsub3JnPg0KPiAtLS0NCj4gICBkcml2ZXJzL21h
Y2ludG9zaC92aWEtcG11LmMgfCA2MSArKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0t
LS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDM2IGluc2VydGlvbnMoKyksIDI1IGRlbGV0aW9ucygt
KQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWFjaW50b3NoL3ZpYS1wbXUuYyBiL2RyaXZl
cnMvbWFjaW50b3NoL3ZpYS1wbXUuYw0KPiBpbmRleCA1NWFmYTZkZmEyNjMuLjVmZmViZjI5YjYz
MCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9tYWNpbnRvc2gvdmlhLXBtdS5jDQo+ICsrKyBiL2Ry
aXZlcnMvbWFjaW50b3NoL3ZpYS1wbXUuYw0KPiBAQCAtMTczLDEwICsxNzMsMTUgQEAgc3RhdGlj
IHVuc2lnbmVkIGxvbmcgYXN5bmNfcmVxX2xvY2tzOw0KPiAgICNkZWZpbmUgTlVNX0lSUV9TVEFU
UyAxMw0KPiAgIHN0YXRpYyB1bnNpZ25lZCBpbnQgcG11X2lycV9zdGF0c1tOVU1fSVJRX1NUQVRT
XTsNCj4gICANCj4gKyNpZmRlZiBDT05GSUdfUFJPQ19GUw0KPiAgIHN0YXRpYyBzdHJ1Y3QgcHJv
Y19kaXJfZW50cnkgKnByb2NfcG11X3Jvb3Q7DQo+ICAgc3RhdGljIHN0cnVjdCBwcm9jX2Rpcl9l
bnRyeSAqcHJvY19wbXVfaW5mbzsNCj4gICBzdGF0aWMgc3RydWN0IHByb2NfZGlyX2VudHJ5ICpw
cm9jX3BtdV9pcnFzdGF0czsNCj4gICBzdGF0aWMgc3RydWN0IHByb2NfZGlyX2VudHJ5ICpwcm9j
X3BtdV9vcHRpb25zOw0KPiArc3RhdGljIHN0cnVjdCBwcm9jX2Rpcl9lbnRyeSAqcHJvY19wbXVf
YmF0dFtQTVVfTUFYX0JBVFRFUklFU107DQo+ICtzdGF0aWMgdm9pZCBwbXVfcHJvY19zZXR1cCh2
b2lkKTsNCj4gKyNlbmRpZg0KPiArDQo+ICAgc3RhdGljIGludCBvcHRpb25fc2VydmVyX21vZGU7
DQo+ICAgDQo+ICAgaW50IHBtdV9iYXR0ZXJ5X2NvdW50Ow0KPiBAQCAtMTg1LDcgKzE5MCw2IEBA
IHVuc2lnbmVkIGludCBwbXVfcG93ZXJfZmxhZ3MgPSBQTVVfUFdSX0FDX1BSRVNFTlQ7DQo+ICAg
c3RydWN0IHBtdV9iYXR0ZXJ5X2luZm8gcG11X2JhdHRlcmllc1tQTVVfTUFYX0JBVFRFUklFU107
DQo+ICAgc3RhdGljIGludCBxdWVyeV9iYXR0X3RpbWVyID0gQkFUVEVSWV9QT0xMSU5HX0NPVU5U
Ow0KPiAgIHN0YXRpYyBzdHJ1Y3QgYWRiX3JlcXVlc3QgYmF0dF9yZXE7DQo+IC1zdGF0aWMgc3Ry
dWN0IHByb2NfZGlyX2VudHJ5ICpwcm9jX3BtdV9iYXR0W1BNVV9NQVhfQkFUVEVSSUVTXTsNCj4g
ICANCj4gICBpbnQgYXNsZWVwOw0KPiAgIA0KPiBAQCAtMjA0LDExICsyMDgsNyBAQCBzdGF0aWMg
aW50IGluaXRfcG11KHZvaWQpOw0KPiAgIHN0YXRpYyB2b2lkIHBtdV9zdGFydCh2b2lkKTsNCj4g
ICBzdGF0aWMgaXJxcmV0dXJuX3QgdmlhX3BtdV9pbnRlcnJ1cHQoaW50IGlycSwgdm9pZCAqYXJn
KTsNCj4gICBzdGF0aWMgaXJxcmV0dXJuX3QgZ3BpbzFfaW50ZXJydXB0KGludCBpcnEsIHZvaWQg
KmFyZyk7DQo+IC1zdGF0aWMgaW50IHBtdV9pbmZvX3Byb2Nfc2hvdyhzdHJ1Y3Qgc2VxX2ZpbGUg
Km0sIHZvaWQgKnYpOw0KPiAtc3RhdGljIGludCBwbXVfaXJxc3RhdHNfcHJvY19zaG93KHN0cnVj
dCBzZXFfZmlsZSAqbSwgdm9pZCAqdik7DQo+IC1zdGF0aWMgaW50IHBtdV9iYXR0ZXJ5X3Byb2Nf
c2hvdyhzdHJ1Y3Qgc2VxX2ZpbGUgKm0sIHZvaWQgKnYpOw0KPiAgIHN0YXRpYyB2b2lkIHBtdV9w
YXNzX2ludHIodW5zaWduZWQgY2hhciAqZGF0YSwgaW50IGxlbik7DQo+IC1zdGF0aWMgY29uc3Qg
c3RydWN0IHByb2Nfb3BzIHBtdV9vcHRpb25zX3Byb2Nfb3BzOw0KPiAgIA0KPiAgICNpZmRlZiBD
T05GSUdfQURCDQo+ICAgY29uc3Qgc3RydWN0IGFkYl9kcml2ZXIgdmlhX3BtdV9kcml2ZXIgPSB7
DQo+IEBAIC01NTEsMjYgKzU1MSw5IEBAIHN0YXRpYyBpbnQgX19pbml0IHZpYV9wbXVfZGV2X2lu
aXQodm9pZCkNCj4gICAJfQ0KPiAgICNlbmRpZiAvKiBDT05GSUdfUFBDMzIgKi8NCj4gICANCj4g
LQkvKiBDcmVhdGUgL3Byb2MvcG11ICovDQo+IC0JcHJvY19wbXVfcm9vdCA9IHByb2NfbWtkaXIo
InBtdSIsIE5VTEwpOw0KPiAtCWlmIChwcm9jX3BtdV9yb290KSB7DQo+IC0JCWxvbmcgaTsNCj4g
LQ0KPiAtCQlmb3IgKGk9MDsgaTxwbXVfYmF0dGVyeV9jb3VudDsgaSsrKSB7DQo+IC0JCQljaGFy
IHRpdGxlWzE2XTsNCj4gLQkJCXNwcmludGYodGl0bGUsICJiYXR0ZXJ5XyVsZCIsIGkpOw0KPiAt
CQkJcHJvY19wbXVfYmF0dFtpXSA9IHByb2NfY3JlYXRlX3NpbmdsZV9kYXRhKHRpdGxlLCAwLA0K
PiAtCQkJCQlwcm9jX3BtdV9yb290LCBwbXVfYmF0dGVyeV9wcm9jX3Nob3csDQo+IC0JCQkJCSh2
b2lkICopaSk7DQo+IC0JCX0NCj4gLQ0KPiAtCQlwcm9jX3BtdV9pbmZvID0gcHJvY19jcmVhdGVf
c2luZ2xlKCJpbmZvIiwgMCwgcHJvY19wbXVfcm9vdCwNCj4gLQkJCQlwbXVfaW5mb19wcm9jX3No
b3cpOw0KPiAtCQlwcm9jX3BtdV9pcnFzdGF0cyA9IHByb2NfY3JlYXRlX3NpbmdsZSgiaW50ZXJy
dXB0cyIsIDAsDQo+IC0JCQkJcHJvY19wbXVfcm9vdCwgcG11X2lycXN0YXRzX3Byb2Nfc2hvdyk7
DQo+IC0JCXByb2NfcG11X29wdGlvbnMgPSBwcm9jX2NyZWF0ZSgib3B0aW9ucyIsIDA2MDAsIHBy
b2NfcG11X3Jvb3QsDQo+IC0JCQkJCQkmcG11X29wdGlvbnNfcHJvY19vcHMpOw0KPiAtCX0NCj4g
KyNpZmRlZiBDT05GSUdfUFJPQ19GUw0KPiArCXBtdV9wcm9jX3NldHVwKCk7DQo+ICsjZW5kaWYN
Cj4gICAJcmV0dXJuIDA7DQo+ICAgfQ0KPiAgIA0KPiBAQCAtODU3LDYgKzg0MCw3IEBAIHF1ZXJ5
X2JhdHRlcnlfc3RhdGUodm9pZCkNCj4gICAJCQkyLCBQTVVfU01BUlRfQkFUVEVSWV9TVEFURSwg
cG11X2N1cl9iYXR0ZXJ5KzEpOw0KPiAgIH0NCj4gICANCj4gKyNpZmRlZiBDT05GSUdfUFJPQ19G
Uw0KPiAgIHN0YXRpYyBpbnQgcG11X2luZm9fcHJvY19zaG93KHN0cnVjdCBzZXFfZmlsZSAqbSwg
dm9pZCAqdikNCj4gICB7DQo+ICAgCXNlcV9wcmludGYobSwgIlBNVSBkcml2ZXIgdmVyc2lvbiAg
ICAgOiAlZFxuIiwgUE1VX0RSSVZFUl9WRVJTSU9OKTsNCj4gQEAgLTk3OCw2ICs5NjIsMzMgQEAg
c3RhdGljIGNvbnN0IHN0cnVjdCBwcm9jX29wcyBwbXVfb3B0aW9uc19wcm9jX29wcyA9IHsNCj4g
ICAJLnByb2Nfd3JpdGUJPSBwbXVfb3B0aW9uc19wcm9jX3dyaXRlLA0KPiAgIH07DQo+ICAgDQo+
ICtzdGF0aWMgdm9pZCBwbXVfcHJvY19zZXR1cCh2b2lkKQ0KPiArew0KPiArCWxvbmcgaTsNCj4g
Kw0KPiArCS8qIENyZWF0ZSAvcHJvYy9wbXUgKi8NCj4gKwlwcm9jX3BtdV9yb290ID0gcHJvY19t
a2RpcigicG11IiwgTlVMTCk7DQo+ICsJaWYgKCFwcm9jX3BtdV9yb290KQ0KPiArCQlyZXR1cm47
DQo+ICsNCj4gKwlmb3IgKGkgPSAwOyBpIDwgcG11X2JhdHRlcnlfY291bnQ7IGkrKykgew0KPiAr
CQljaGFyIHRpdGxlWzE2XTsNCj4gKw0KPiArCQlzcHJpbnRmKHRpdGxlLCAiYmF0dGVyeV8lbGQi
LCBpKTsNCj4gKwkJcHJvY19wbXVfYmF0dFtpXSA9DQo+ICsJCQlwcm9jX2NyZWF0ZV9zaW5nbGVf
ZGF0YSh0aXRsZSwgMCwgcHJvY19wbXVfcm9vdCwNCj4gKwkJCQkJCXBtdV9iYXR0ZXJ5X3Byb2Nf
c2hvdywgKHZvaWQgKilpKTsNCj4gKwl9DQo+ICsNCj4gKwlwcm9jX3BtdV9pbmZvID0gcHJvY19j
cmVhdGVfc2luZ2xlKCJpbmZvIiwgMCwgcHJvY19wbXVfcm9vdCwNCj4gKwkJCQkJICAgcG11X2lu
Zm9fcHJvY19zaG93KTsNCj4gKwlwcm9jX3BtdV9pcnFzdGF0cyA9IHByb2NfY3JlYXRlX3Npbmds
ZSgiaW50ZXJydXB0cyIsIDAsIHByb2NfcG11X3Jvb3QsDQo+ICsJCQkJCSAgICAgICBwbXVfaXJx
c3RhdHNfcHJvY19zaG93KTsNCj4gKwlwcm9jX3BtdV9vcHRpb25zID0gcHJvY19jcmVhdGUoIm9w
dGlvbnMiLCAwNjAwLCBwcm9jX3BtdV9yb290LA0KPiArCQkJCSAgICAgICAmcG11X29wdGlvbnNf
cHJvY19vcHMpOw0KPiArfQ0KPiArI2VuZGlmIC8qIENPTkZJR19QUk9DX0ZTICovDQo+ICsNCj4g
ICAjaWZkZWYgQ09ORklHX0FEQg0KPiAgIC8qIFNlbmQgYW4gQURCIGNvbW1hbmQgKi8NCj4gICBz
dGF0aWMgaW50IHBtdV9zZW5kX3JlcXVlc3Qoc3RydWN0IGFkYl9yZXF1ZXN0ICpyZXEsIGludCBz
eW5jKQ==
