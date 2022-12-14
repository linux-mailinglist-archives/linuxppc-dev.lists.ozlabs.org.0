Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB9764C531
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Dec 2022 09:40:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NX82x27K1z3cKq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Dec 2022 19:40:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=Rci1kfds;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.51; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=Rci1kfds;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on2051.outbound.protection.outlook.com [40.107.12.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NX81v45dtz3bdn
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Dec 2022 19:40:02 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vfx1VF9NpB7A1I/iV3pXpJSwpqy2UMxYmQ0TLr1bOyZgd1M8cjQd3qgiyVlCsshgAQs4TmhvjP5LSw1ozKonfv3mBZ4cSx6q/LefTz5efSp+dYRN03VtfiTKxvwCvWtsHo58M4E2wON+kvn6WDrvQKAl5rxvQfYTK2MZIfE+DLKR9TFF+P+cgr14sNyokNwdDxnMPnl3/4eSxX4AxuVUol69+U5JldBTe9dLMpeuuYHL+828UBz0oJxP4w020zk9W9HCs6btOlNuVSVCz9pXcPxGt5SIAgotuMIaIVFNG5asunerdevi6x5zdRt5kRgV8XGuPxpymwKOFUsM4i5qbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RHEqSpQJD3Pn+Uhg66CjOxv7TwI4oGqD20V6iSHBrw4=;
 b=mjZ+1UtjS4xcJ/Byj5k8mN1SHhoLIh2Of1+NO0J0WeBC8euC7onAFJLHBt+KP0U/TpT9FsxzkdM6kLwX8UiobdsCXPxhcOVQ330BXTm3yAzVo3tluFpPULG0s7s9/p9+7dcTinUsoCJfARuEaY2ATpyF7Xr7t4izZvfN5TNHxeXSHUC/i4kYwIzUBhkW0e9PJuI7iqdfA28xNSmPCZ8rNHyo9pQT0uNuptt4hIKVrgjoepg7cql9oBo9Q+/hNd3uDEYQNiQuvMuRf+cGlkQoOV3k7x/CMGntqeyxtinTekreJsJrGSJxZAuWqNOlGpwjAiOZnfLoLBQH6E4WdLfsnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RHEqSpQJD3Pn+Uhg66CjOxv7TwI4oGqD20V6iSHBrw4=;
 b=Rci1kfdsktxlkALD/6xhPBI+cQj4+9G5X03sAjEh5sypR8n2hElzaYRZm/7RlOvH3l2SAb0442Eu33Ey1o+fkPXcw/wIZ6T6ql1m8TI/t/jyhhx/NCwqQZ+W3oGn4pBN6pKtcPAknC1zTNhIqVi8xpV4F7OELzJ8/39tw6UwBvOM+IFCfXumNmjnlyEgwyXUEasK+/wCDOBbQqNLCGPb1XBW/rlHW6Hyq6+K8Tiiz5SqLLkTXps6ffF9iIBnxm8bKwym2G1DbHcUoVInCbmEnIQfpYFsIC4y6rRf4DQRLtOB9IShJcHErpe33A/CfmUEkPfWrKxsn+MjzY7TNBcEYw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2043.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:16f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Wed, 14 Dec
 2022 08:39:42 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6%9]) with mapi id 15.20.5880.019; Wed, 14 Dec 2022
 08:39:42 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Nicholas Miehlbradt <nicholas@linux.ibm.com>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH] powerpc/64: Implement arch_within_stack_frames
Thread-Topic: [PATCH] powerpc/64: Implement arch_within_stack_frames
Thread-Index: AQHZD3bMRzKWazF2AEiUNE4WaJ8LX65tEEmA
Date: Wed, 14 Dec 2022 08:39:42 +0000
Message-ID: <0dfbaab8-c962-9127-b56d-8f9989c095d8@csgroup.eu>
References: <20221214044252.1910657-1-nicholas@linux.ibm.com>
In-Reply-To: <20221214044252.1910657-1-nicholas@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB2043:EE_
x-ms-office365-filtering-correlation-id: 59a17c61-db37-4560-0d6f-08daddaebee4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  sytjmBbhi/cmVNqbXaYCID2WKR6kT3C13jH5/nkQksjrFCc2YRp0ZSQCSSkSy07eueBq+uF6k+9e2s9tGBswPxTun0LJ3zJ2qWXUzIfHcjZgR0htwiKxeunwPLM4GcSlOE1lbFO+caiUWfyExubozTyHoeb1AK6RfiVZpYE9n+1yKMTAjRqCx/znr9zroxCMtlehRQf0YVipgCCYJhwNLEenCjUsCc5cKBzxYAYiPP2FT+VYepo5bTjhQPrp/3EDYYCzzWnXn3aFdIfrCD2sXMHskzHK/KiWR1CFGxQ3mBOF7xlv1EYipcPCyFwOOTqrr09CNolxorctZK8riP+pRKD0E9e9qhCXrMrwOcSnsA97wIVWAgaulX6mhsLVb0N1YOcGfJYkscYUoSkUelch/3svtpiBmxHLw94Eu1vaSLo5FSucgx1eg53ciONVCeFtt6R3e/YzdG7T3wkkm+jn0xym/iT3pxODaeuu2NgzfUcsDn/sqIpGY6MeeqVMu54cbfsKrG5SibHND5vjYk2STgroAvntnRAU32ah99JUSbHmTR6ZWt1K2s/vAOol1ph+8+VHce9AchAt+QiT5sLfTuEj3sDW9V9u17taXDB+Nxe8Cxrz8nx52qdTmSH4pmbhv7HhAb4k1EQlop7c/w1Mm2XPEztcNnhiC5jt3r214DVOf8zGG6BM9afqxy30Za7zFHK+5lENGvIUgEgKOPnYXUxFLA5ytklQzJnijNXWBljWdXvZ4frXJXyv+lto681P9SFzWoTYnsPsXoHeO9lAmg==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(346002)(136003)(366004)(39850400004)(451199015)(71200400001)(31686004)(478600001)(6486002)(2906002)(186003)(31696002)(36756003)(86362001)(6506007)(6512007)(38070700005)(26005)(38100700002)(44832011)(5660300002)(2616005)(8936002)(66446008)(110136005)(122000001)(41300700001)(91956017)(66556008)(8676002)(64756008)(76116006)(66476007)(66946007)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?RlpLM2N4MWhDanFKMTYwUHN5TUVjdXB5WklCKzlWS2lpQzJoSzJXWUhGWHh0?=
 =?utf-8?B?OUVqZW91YzhrU2k3UUFVL3hZSi9zMkxYSFAvMk5kOWhLU0RqUnZJaXZLNzV4?=
 =?utf-8?B?d2VIUjRqc0RmZUNidDFBOGtMdE1OQ0FwdFVWcVVkcXdmdWJRWUhkV3UrWklR?=
 =?utf-8?B?cldXVnA4YlJZTmk3UkNvVm9XeFdoZXVRL1RET1hHSDVjMXdqNVg2RkNQb053?=
 =?utf-8?B?RWthdmg3eXlnU0h4ZTY2bTduSlNESkpkZE56T1hRUWxCU1ltWkIxTEYyeHBn?=
 =?utf-8?B?VyswTW5OdUwvNml6RDB4YjA0V2FlSW9Ha01seVRLaHhwWXhZWjlyTkNQL0Nk?=
 =?utf-8?B?aTY2L252NzdGOUNPM05nRVN0V1FGQ1VBYkhXZlY5TzF1bkMxMEc4bnRhZ29h?=
 =?utf-8?B?MTZUSTJEOHZvcnN5Y0hQMWhwS2tuMzh5YWFLWmxKQWVQVlUwME0yR3ZQTWRm?=
 =?utf-8?B?b0VCUk1idFBxbWVPL0hGMEF1eTVNVVFkVjZveWs5ZlZ0cEIrYVkvOWswbDBi?=
 =?utf-8?B?N1Iyd2VTSVhKakRROHRySW8vaVRCQlo1bDlxbEZ3dkJyTjJYeU1pcVQ0UnRk?=
 =?utf-8?B?cHNqeG9NeXR3aTI0cm5kOGJFZkpCTWwvaWV6YUMzbnZRU2dWaWJFRnFMcXcw?=
 =?utf-8?B?VFd0SzJ1dkJKaG5SN3lhWnljaHl2bW02YjhsRzU1ckVQV2ZMWlllUFdGc1lO?=
 =?utf-8?B?NUczV2xCUHVzNGI2T0lsRk1CQVoxbmdmb0ZIdWx6U1dwdWRrOGZuNHVDb1Ex?=
 =?utf-8?B?L0VwKzdQTUp6V3FpR1NINlorQ0NJZVZHeHoxcWpQMnJNcVA1NDBmWjVncVM1?=
 =?utf-8?B?VXNtalE0YjJneG5iQkx0VXRlQ2tmNmhqU3VOenhMeDRZSGNKanVuQzBkUzNW?=
 =?utf-8?B?N01qUm9XL2lpcW1Gdm9WbE5KeHIwS3drdXNyWkEvck54c1RWWVJDU1B1TEpr?=
 =?utf-8?B?U28rc2kvejRXVytyNWZvWDNJTUdVWlFtdjJ6MTlTVjN5ZjYxMlV2aDY1UEhk?=
 =?utf-8?B?MlcrY01hYkdqbzhTRDFuN0F4d08xRXV1STRSa0FDb2FuRW9KUThJYVdJeTN6?=
 =?utf-8?B?SjQzZDF2ZkJHbkZ4Z1VtQ2VPZ2I2MUVjL1I1ak9Nb0NMbDUwNy9oUnF1N3pK?=
 =?utf-8?B?WnlFTzVTQnZaSmNzaVBmOUtCaVBTT1BIcExEMzVQSU1jL1diT1NRMEQ2WVZw?=
 =?utf-8?B?d3dLZFpmL0w0ZWc4ZTNIbXEvbGhHN2EycHJvbDJsOGRlelgzSlI3NHV4UDVB?=
 =?utf-8?B?MkJnRk9pYXVVSHhiTSt6U21CWDA1RHdpL05SMDZNcVpFMzU1QWtlSGRmMnRv?=
 =?utf-8?B?VHh0YmlGSElNczYwZVdENnhYbjN3QVo4MTZhWnBtL0FNN1RURDh0RE1HQ2lm?=
 =?utf-8?B?WDhFTXg4SlZPdVQrU1pyWktHNDNrWld4WkxaN0hQOGVRVGFHc2xEMlJ3Vnh1?=
 =?utf-8?B?NURNL280TE10WHZLZXo0Q043TnpoMVJsYlVHanVVSTJjckZQcHF4MHN0YmF5?=
 =?utf-8?B?QWFNdkpET0dVUC9LSUZwVThVV0NNSlNvT3o4Wlp4M0dkSkhpbWxzWGNwOXYv?=
 =?utf-8?B?Y2JETWVUTk1iUzJqaVVTYnVSSFpUMFlycEQ0SUZLN2pkb0lVWDd2NExXWktM?=
 =?utf-8?B?b3VuMzZWemluUmxYNnpSVFh6azhuYnhtZGttNW02ODNCTTIyTVRQaFc5Rk9W?=
 =?utf-8?B?dFJxdzk5QkF4UXFvRkxER3o2c0N2ZDRaclZiVWFLTGd5d0U4K1N1aEE5TmVk?=
 =?utf-8?B?MWlaWlhmaHJEcXEyRUtFcG9tenNscTdxeHIyd256NFZOWksxKzZ1dlR4ZnVv?=
 =?utf-8?B?NXJHT2VTR3k3ZlFFSHlVVndOWFFLWXdqa0JnOUNHNXY1R1FZcG5iY21Nem5C?=
 =?utf-8?B?aFpBenFWSVA5U0lnY1pzaFk5THA5OUl1Q09Wd1NvcnM4UzBGSmxUdUtpUHlw?=
 =?utf-8?B?ZVE5N2QvWGtOZHRrYkh4Vno2a296ak1ZZVhYdlNlVUJpV1RMTXVvK3Q3NVpn?=
 =?utf-8?B?Wi9Da1YxZ0VCaDhJcnVXbFJ3a1M1bE9BOXF6N0tSRXFYcFhLRW1KcDUvMUE3?=
 =?utf-8?B?Q3hJZzE3bWlOZllyd2V3MldwcWhWc3lkbzlqeWRMU0pZYzQwclF3eEl1d3ZQ?=
 =?utf-8?B?UnM3czBONWZxbko3dVNLdEM2STViUjlkbGFDd3A3TGVzNy9idlFaTEFDdlNy?=
 =?utf-8?B?ZEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <00514765ECFCB041B2BA17D9E73808FB@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 59a17c61-db37-4560-0d6f-08daddaebee4
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2022 08:39:42.2386
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xVca5eUV3S99obpsFT5Hcy1eueStxo190Nug2j7o4dzDBpNTO1IO8EPfNhfAmVXWOoU/CzK8l4nrAWkIN5CHUGTxqB4ixYRDwNF9Ab64oL0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2043
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

DQoNCkxlIDE0LzEyLzIwMjIgw6AgMDU6NDIsIE5pY2hvbGFzIE1pZWhsYnJhZHQgYSDDqWNyaXTC
oDoNCj4gV2Fsa3MgdGhlIHN0YWNrIHdoZW4gY29weV97dG8sZnJvbX1fdXNlciBhZGRyZXNzIGlz
IGluIHRoZSBzdGFjayB0bw0KPiBlbnN1cmUgdGhhdCB0aGUgb2JqZWN0IGJlaW5nIGNvcGllZCBp
cyBlbnRpcmVseSB3aXRoaW4gYSBzaW5nbGUgc3RhY2sNCj4gZnJhbWUuDQo+IA0KPiBTdWJzdGF0
aWFsbHkgc2ltaWxhciB0byB0aGUgeDg2IGltcGxlbWVudGF0aW9uIGV4Y2VwdCB1c2luZyB0aGUg
YmFjaw0KPiBjaGFpbiB0byB0cmF2ZXJzZSB0aGUgc3RhY2sgYW5kIGlkZW50aWZ5IHN0YWNrIGZy
YW1lIGJvdW5kYXJpZXMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBOaWNob2xhcyBNaWVobGJyYWR0
IDxuaWNob2xhc0BsaW51eC5pYm0uY29tPg0KPiAtLS0NCj4gICBhcmNoL3Bvd2VycGMvS2NvbmZp
ZyAgICAgICAgICAgICAgICAgICB8ICAxICsNCj4gICBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20v
dGhyZWFkX2luZm8uaCB8IDM4ICsrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ICAgMiBmaWxl
cyBjaGFuZ2VkLCAzOSBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dl
cnBjL0tjb25maWcgYi9hcmNoL3Bvd2VycGMvS2NvbmZpZw0KPiBpbmRleCAyY2E1NDE4NDU3ZWQu
LjRjNTlkMTM5ZWE4MyAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL0tjb25maWcNCj4gKysr
IGIvYXJjaC9wb3dlcnBjL0tjb25maWcNCj4gQEAgLTE5OCw2ICsxOTgsNyBAQCBjb25maWcgUFBD
DQo+ICAgCXNlbGVjdCBIQVZFX0FSQ0hfS0FTQU5fVk1BTExPQwkJaWYgSEFWRV9BUkNIX0tBU0FO
DQo+ICAgCXNlbGVjdCBIQVZFX0FSQ0hfS0ZFTkNFCQkJaWYgQVJDSF9TVVBQT1JUU19ERUJVR19Q
QUdFQUxMT0MNCj4gICAJc2VsZWN0IEhBVkVfQVJDSF9SQU5ET01JWkVfS1NUQUNLX09GRlNFVA0K
PiArCXNlbGVjdCBIQVZFX0FSQ0hfV0lUSElOX1NUQUNLX0ZSQU1FUwlpZiBQUEM2NA0KDQpXaHkg
ZG9uJ3QgeW91IGRvIHNvbWV0aGluZyB0aGF0IHdvcmtzIGZvciBib3RoIFBQQzMyIGFuZCBQUEM2
NCA/DQoNCj4gICAJc2VsZWN0IEhBVkVfQVJDSF9LR0RCDQo+ICAgCXNlbGVjdCBIQVZFX0FSQ0hf
TU1BUF9STkRfQklUUw0KPiAgIAlzZWxlY3QgSEFWRV9BUkNIX01NQVBfUk5EX0NPTVBBVF9CSVRT
CWlmIENPTVBBVA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3RocmVh
ZF9pbmZvLmggYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vdGhyZWFkX2luZm8uaA0KPiBpbmRl
eCBhZjU4ZjFlZDM5NTIuLmVmZGYzOWUwNzg4NCAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBj
L2luY2x1ZGUvYXNtL3RocmVhZF9pbmZvLmgNCj4gKysrIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUv
YXNtL3RocmVhZF9pbmZvLmgNCj4gQEAgLTE4Niw2ICsxODYsNDQgQEAgc3RhdGljIGlubGluZSBi
b29sIHRlc3RfdGhyZWFkX2xvY2FsX2ZsYWdzKHVuc2lnbmVkIGludCBmbGFncykNCj4gICAjZGVm
aW5lIGlzX2VsZjJfdGFzaygpICgwKQ0KPiAgICNlbmRpZg0KPiAgIA0KPiArI2lmZGVmIENPTkZJ
R19QUEM2NA0KPiArDQo+ICsjaWZkZWYgQ09ORklHX1BQQzY0X0VMRl9BQklfVjENCj4gKyNkZWZp
bmUgUEFSQU1FVEVSX1NBVkVfT0ZGU0VUIDQ4DQo+ICsjZWxzZQ0KPiArI2RlZmluZSBQQVJBTUVU
RVJfU0FWRV9PRkZTRVQgMzINCj4gKyNlbmRpZg0KDQpXaHkgbm90IHVzZSBTVEFDS19JTlRfRlJB
TUVfUkVHUywgZGVmaW5lZCBpbiBhc20vcHRyYWNlLmggPw0KDQo+ICsNCj4gKy8qDQo+ICsgKiBX
YWxrcyB1cCB0aGUgc3RhY2sgZnJhbWVzIHRvIG1ha2Ugc3VyZSB0aGF0IHRoZSBzcGVjaWZpZWQg
b2JqZWN0IGlzDQo+ICsgKiBlbnRpcmVseSBjb250YWluZWQgYnkgYSBzaW5nbGUgc3RhY2sgZnJh
bWUuDQo+ICsgKg0KPiArICogUmV0dXJuczoNCj4gKyAqCUdPT0RfRlJBTUUJaWYgd2l0aGluIGEg
ZnJhbWUNCj4gKyAqCUJBRF9TVEFDSwlpZiBwbGFjZWQgYWNyb3NzIGEgZnJhbWUgYm91bmRhcnkg
KG9yIG91dHNpZGUgc3RhY2spDQo+ICsgKi8NCj4gK3N0YXRpYyBpbmxpbmUgaW50IGFyY2hfd2l0
aGluX3N0YWNrX2ZyYW1lcyhjb25zdCB2b2lkICogY29uc3Qgc3RhY2ssDQo+ICsJCQkJCSAgIGNv
bnN0IHZvaWQgKiBjb25zdCBzdGFja2VuZCwNCj4gKwkJCQkJICAgY29uc3Qgdm9pZCAqb2JqLCB1
bnNpZ25lZCBsb25nIGxlbikNCj4gK3sNCj4gKwljb25zdCB2b2lkICpmcmFtZTsNCj4gKwljb25z
dCB2b2lkICpvbGRmcmFtZTsNCj4gKw0KPiArCW9sZGZyYW1lID0gKGNvbnN0IHZvaWQgKiljdXJy
ZW50X3N0YWNrX3BvaW50ZXI7DQo+ICsJZnJhbWUgPSAqKGNvbnN0IHZvaWQgKiBjb25zdCAqKW9s
ZGZyYW1lOw0KPiArDQo+ICsJd2hpbGUgKHN0YWNrIDw9IGZyYW1lICYmIGZyYW1lIDwgc3RhY2tl
bmQpIHsNCj4gKwkJaWYgKG9iaiArIGxlbiA8PSBmcmFtZSkNCj4gKwkJCXJldHVybiBvYmogPj0g
b2xkZnJhbWUgKyBQQVJBTUVURVJfU0FWRV9PRkZTRVQgPw0KPiArCQkJCUdPT0RfRlJBTUUgOiBC
QURfU1RBQ0s7DQo+ICsJCW9sZGZyYW1lID0gZnJhbWU7DQo+ICsJCWZyYW1lID0gKihjb25zdCB2
b2lkICogY29uc3QgKilvbGRmcmFtZTsNCj4gKwl9DQo+ICsNCj4gKwlyZXR1cm4gQkFEX1NUQUNL
Ow0KPiArfQ0KDQpXaGF0IGFib3V0Og0KDQorCWNvbnN0IHZvaWQgKmZyYW1lOw0KKwljb25zdCB2
b2lkICpwYXJhbXM7DQorDQorCXBhcmFtcyA9IChjb25zdCB2b2lkICopY3VycmVudF9zdGFja19w
b2ludGVyICsgU1RBQ0tfSU5UX0ZSQU1FX1JFR1M7DQorCWZyYW1lID0gKihjb25zdCB2b2lkICog
Y29uc3QgKiljdXJyZW50X3N0YWNrX3BvaW50ZXI7DQorDQorCXdoaWxlIChzdGFjayA8PSBmcmFt
ZSAmJiBmcmFtZSA8IHN0YWNrZW5kKSB7DQorCQlpZiAob2JqICsgbGVuIDw9IGZyYW1lKQ0KKwkJ
CXJldHVybiBvYmogPj0gcGFyYW1zID8gR09PRF9GUkFNRSA6IEJBRF9TVEFDSzsNCisJCXBhcmFt
cyA9IGZyYW1lICsgU1RBQ0tfSU5UX0ZSQU1FX1JFR1M7DQorCQlmcmFtZSA9ICooY29uc3Qgdm9p
ZCAqIGNvbnN0ICopZnJhbWU7DQorCX0NCisNCisJcmV0dXJuIEJBRF9TVEFDSzsNCg0KDQo+ICsj
ZW5kaWYgLyogQ09ORklHX1BQQzY0ICovDQo+ICsNCj4gICAjZW5kaWYJLyogIV9fQVNTRU1CTFlf
XyAqLw0KPiAgIA0KPiAgICNlbmRpZiAvKiBfX0tFUk5FTF9fICovDQo=
