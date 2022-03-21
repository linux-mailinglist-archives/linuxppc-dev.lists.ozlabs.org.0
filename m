Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBCE4E20F0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 08:07:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KMQfB10sfz30R6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 18:06:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::60d;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on060d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::60d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KMQdk0Zsyz2xY3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Mar 2022 18:06:33 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PIL2Ipk2SiPfv0tVqHC9aQflGYWvzhA1iXN9GZnvGaRQrHBGyLfEUffL5n8WMq1ZNKS61RM4fcxxYoV7y3QFKsxTS8FIxXWtz/2Vta3pcYNbHTpIpC5dHjXk2qluq9b6Yva9AY3q6s+Qg46kEdmCjEsM0pcsdEfwrO7XH0f9EVH19GFpk5qCc+Sr67bLrsQXPOWmx+9fBG3q8/aaqPrzvELGVVXYVlF7dQPPtLPYuzt7d3txKdrwgbuADccc9+PKR/6twLpgBxnS5VW3p4d9LOnLx0TTjuHQW4TgS4T6HgdY83qRMzJBWntGBHvrKMFC++e8Uv81tFHb1iYQkekWcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5kPQgRNk/D3oQcVnT7QqO8wukBllULmoYntHEdAYUDg=;
 b=jC/hcX5CkZWJuAp7q5T/x9FhuAfFzPQ3y1GG7IniP+U2QMZsx4E3D0fgpZlDWkhywgZg63vfyblJ4nUWFElNqGTcdk91DNusT3u7W1/b4Io0WLv1gokcfXaFzcTA3Ru3DtW9+E77s0euI84HjRoMsfBIUPLn/6FmblJ0kREfhzXmdJeOeR8tlCoKBA+rTV8Ytjql0+Ltvts6wkTTMJwBZElulhQO4yUjiACIg4JMHiuODunZ72QY01XXhGe0V/FwujYQR1kpGzpn4H3wcDE7uZuRGZZsJQbF3Zlb+XD7N+igRF/8kquRnWPCBvoT+7gjWuSnxLdiRyTYdyDP5qHmVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2483.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:34::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.15; Mon, 21 Mar
 2022 07:06:13 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d%6]) with mapi id 15.20.5081.022; Mon, 21 Mar 2022
 07:06:13 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Sathvika Vasireddy <sv@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [RFC PATCH 2/3] objtool: Enable and implement 'mcount' subcommand
Thread-Topic: [RFC PATCH 2/3] objtool: Enable and implement 'mcount' subcommand
Thread-Index: AQHYOxG8iT5LzJosbEiV0QsgTuVp66zJbicA
Date: Mon, 21 Mar 2022 07:06:12 +0000
Message-ID: <8e792a9a-afb8-9b26-5e97-8f51c72c2d42@csgroup.eu>
References: <20220318105140.43914-1-sv@linux.ibm.com>
 <20220318105140.43914-3-sv@linux.ibm.com>
In-Reply-To: <20220318105140.43914-3-sv@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0fa2b31d-67f8-43f3-60d2-08da0b0948c9
x-ms-traffictypediagnostic: MR1P264MB2483:EE_
x-microsoft-antispam-prvs: <MR1P264MB248323D213C52C2947C92F2DED169@MR1P264MB2483.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZS6IQiOhwguFdTFT3+322RSRn787y82ifTv97B3qgepbbkqc+0AmzHipsLAMQXb6fpQQ/76NfAzJ9SvGe/wqSzzS5oTKEtYGC+Vefj+qZJMEVSLkMjoS7sdrBrQvRqab3tp46koSC0Blx/W2fb2fjko6AEmmBwjcVZcvC6MfVdkVYvhzseINYICKuELoYhqDtyxQp0wu3fcxiX5q/uATSg32DJeD8gTYUb1cDf1/JapbuckEVM74QAS7KolNW94uS3/cDFGV9FNRDRGjSSj7CBhp+smG3CPQX2D25IpgiEAyfNUzTFH03bj3/+FdWjlcKAUgQHcTZr/mhUMGurXeaq4dTA5cdOU9+/7jle9HUp4x+HKKQxByaEZaCybE3S8dxAOVIObfeTm2fxRc3PoygTq6szbvBhf2vJnJq7CpyR/jZ9MQcEoZBfoGdlfydfpU9D61Hpf5Y5IyrEVOlJRNIpW+PW52A3HnB/TKDPMnUwhKV4Ii+Xo9v/dFWdIjV70G8OJfdQoLD7NGIUJlmrhxIG9pyqhJ0RXRrNceHU+DinMX97jWLnqJFI0YIvOxhds62cVuI5oxqGq/QSxwrqfigUJGUiZWskS+zJvYDY9iEFuAkxs4+2R4j/7dfIzws443jPPzXZRsmVcHl3HbGKXaHDlfG7ZzB1LqL1hCVBCdzsMp6neP/bwh2No1Yu77OHJhtdrOluv6nJG8Sene+pO1j+MkCBIKsAQomz2hc/c7q7Do2Afa68G2NDYaIjm0YZjedYT2JC9HYTGdPWhgNOR41Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(64756008)(66446008)(66476007)(66556008)(66946007)(2906002)(4326008)(8676002)(76116006)(122000001)(83380400001)(36756003)(91956017)(38100700002)(31686004)(71200400001)(508600001)(6512007)(6506007)(6486002)(186003)(26005)(54906003)(5660300002)(38070700005)(316002)(66574015)(110136005)(86362001)(31696002)(2616005)(8936002)(44832011)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q1ZGVWFYNlVzdlRrNkdDYTA1S1k0clNVVFBGMWJxbTVKUXRiekpDNm1oMi8y?=
 =?utf-8?B?clc1T3Qwb1Y5c3IrYk51bnIwSCt2dU5HYXByQ2tlTSs2MjFNNERqRytaWEcz?=
 =?utf-8?B?VncxK3ZYZW9uajVQSVh5bjBMeWpGeWRZZjFvSDUvWFRqV2J1L21tdTVMM05o?=
 =?utf-8?B?cXFIT2VyeHo4ZC9yTHBpZGFOSDROMmN0SXFWMUJEa1BhbmhJSDg1T2RzR3lT?=
 =?utf-8?B?UWY4d25ZTGxpZjNoOHZXZ2lsdEl6MjMxWGNycXZ2blNQSFIzMXpML3ViNm1z?=
 =?utf-8?B?Y2JhRW1SMHF3c0lOeTVQeXlHQlFYbTdqOTdrL1A5V1Nab2Q3b2lHSG1tMkpo?=
 =?utf-8?B?TlV3SzdTRHdLL2JLaG5hdTBpWG5TdGtHZE1oL1lFanVCMHpmZXZDRS9LaEho?=
 =?utf-8?B?VFR4T3ZYaGV1cTZuTWlYSHNTVTVNSElhd1BseWk5RTBFZEZVdHRvUXIxS1NQ?=
 =?utf-8?B?MGtORjBKd1RuaGxkZUpFQlFrT0JueDc1NXA1a3NkeHRwZnlnYlduNXFCeWx2?=
 =?utf-8?B?cDJ6VExkQmFjYUxSVzRzeTN2NFA3Uk51enMxWGpoYVpSMHlBS3pLclQzV3BC?=
 =?utf-8?B?ZFNqeWxCbWhybzJEUkwrNTc3WVkxcHV6empFbnpyOTR4TE5QY1BCMHJIWUdF?=
 =?utf-8?B?MHNEN3draW91OGk4bktEYUwvWGdjVEEvWmxRMVZyZmF6Wm9KOXp4NGs2ZWZr?=
 =?utf-8?B?NlNBclN3VmlvcFkrb0g1RlNWRDIvS3YxNnd6MUFHbHFoa213ZUg2bU82Tjd0?=
 =?utf-8?B?Z1dVbCt6djF0QXJpUG40TVd5M3BXcHY2N3VoYUxPSnFSczZsZWtORHlMakNG?=
 =?utf-8?B?QzM4eWlxRlBCUTB1KzJ1ZHk1RXNwczY1YXBWSVkrOWtqZmptSmhQRkw1b2lw?=
 =?utf-8?B?V3E4ZXozNkFicHpZU1Z1R25uMDF2M3o1d2ZnK205SjhMQkE4TjNkd1BBUlJ0?=
 =?utf-8?B?LzNqVVNkRmZZRU4rWFJxa25xVm0vQzFvY3c5SS9tVmVYcHJySWx4RE8rMVkw?=
 =?utf-8?B?OGNnVGYvR2Qwd1A2Y0d4WllzNkJRTEY0K2VyclJXOUgwRzk1V3VVQ3RNYW55?=
 =?utf-8?B?QW00WHFTZUgrT1FXSUg3bktMSkJaV2FlVDZRaGp5elNhcGxEc0N5dVdhR1No?=
 =?utf-8?B?Q1FrV2NhNW9Sdkx4eU1IK3NmdFo2WlhJMm0vbkFELy82TkJNblRIS3h4Z0Qw?=
 =?utf-8?B?TUN0UXgvWDRXS2o1bWZBc0lWUStKbENFR1hWcHJVZDBhTENuMTVKNmt1SURH?=
 =?utf-8?B?VjdER2cyYktQWkpvdktVeXlURkc3bVA1eGN2aHg2bDZMbVRSY29wYjVlOFZq?=
 =?utf-8?B?Y1I3NEtDbTRiMTNHUzFRTG10TnZWR0pCOE50WlE2RlR0YjFOZFk5aWVuS1E5?=
 =?utf-8?B?SjRTOENLNld3Y2czcTZqSnlRMDFoN05wTC9FazdKOEZGM1pReThJVjVubGlj?=
 =?utf-8?B?ZC9DU3QycGhOU3JkeVR1MHR0RERSdzB4WGlCdkJXSnVYT2l1Q2RBWHIyckNU?=
 =?utf-8?B?QmVBTkdVMWRSRXNlQ0hqN3dxQmRmWE94VVRrOFR3bndpSUN1SE8xSkFaMlFJ?=
 =?utf-8?B?R1BNTGptSkM5TFIwTkczSGVVZzlCZVRFdGdGc0tSRTVEdkJjZFR5UlZaRkds?=
 =?utf-8?B?U1kwQjNHZE1iQWNOK0drMXZZN0N3MlpPeFlUQmhMMkNGK3RtWEtFNjVQdG4y?=
 =?utf-8?B?QWQ2Ukt3YXhrSk05VTVHWXdab2dqallqRWY1dG1GTGE1MlFmaHlKdnN1N0Zr?=
 =?utf-8?B?RzQ0Z2lrSnA3c2g3MmV1Y1I4UjF0SmZQdVROdUF6Y3NTcHY5N1pQMW1pY2pY?=
 =?utf-8?B?ZFI3a21sSTNGcks5NmFDeVA4WWRLK2xSVUhUUjNZU05QYy9lcDRYTGpWNDls?=
 =?utf-8?B?TnpHcUc3WTBsVDIwQjkrUDhRN0d4YVR6SkREaFYyVGJrRkVSZW1wdWNWYkMx?=
 =?utf-8?B?SDBoc2VrZm41MjBHbXpCZTZyTGlBREFCMG5sb3lXc2RnQ3ZvdUE4bW9FV1lP?=
 =?utf-8?Q?xo3pP+gV0OYq67aIAWQYE/LYXsY1Z8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E187A30D8D03A741B9ABE3DC53DC51C1@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fa2b31d-67f8-43f3-60d2-08da0b0948c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2022 07:06:12.9333 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NiN6A8/MSNezzn5Su3HZ7ERBA1R2RWHfpZrQn1cx4vSS5WCoF/J5wfsN+gBB8SehRNlf1ELzTJJbDcRjqttZErNnIQEzBfxnMbl00vUQG/w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2483
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
Cc: "peterz@infradead.org" <peterz@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>, "aik@ozlabs.ru" <aik@ozlabs.ru>,
 "jpoimboe@redhat.com" <jpoimboe@redhat.com>,
 "naveen.n.rao@linux.vnet.ibm.com" <naveen.n.rao@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE4LzAzLzIwMjIgw6AgMTE6NTEsIFNhdGh2aWthIFZhc2lyZWRkeSBhIMOpY3JpdMKg
Og0KPiBUaGlzIHBhdGNoIGFkZHMgJ21jb3VudCcgYXMgYSBzdWJjb21tYW5kIHRvIG9ianRvb2ws
IGFuZCBlbmFibGVzDQo+IHRoZSBzYW1lIGZvciB4ODYuIG9ianRvb2wgaXMgYnVpbHQgaWYgQ09O
RklHX0ZUUkFDRV9NQ09VTlRfVVNFX09CSlRPT0wNCj4gaXMgc2VsZWN0ZWQuIEFkZGl0aW9uYWxs
eSwgYXJjaGl0ZWN0dXJlcyBjYW4gc2VsZWN0IEhBVkVfTk9QX01DT1VOVA0KPiBpZiB0aGV5IGNo
b29zZSB0byBub3Agb3V0IG1jb3VudCBjYWxsIHNpdGVzLiBJZiB0aGF0IGNvbmZpZyBvcHRpb24g
aXMNCj4gc2VsZWN0ZWQsIHRoZW4gLS1tbm9wIGlzIHBhc3NlZCBhcyBhbiBvcHRpb24gdG8gJ29i
anRvb2wgbWNvdW50Jw0KPiANCj4gU2lnbmVkLW9mZi1ieTogU2F0aHZpa2EgVmFzaXJlZGR5IDxz
dkBsaW51eC5pYm0uY29tPg0KPiAtLS0NCj4gICBNYWtlZmlsZSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgfCAgIDYgKysNCj4gICBhcmNoL3g4Ni9LY29uZmlnICAgICAgICAgICAgICAg
ICAgICAgICAgfCAgIDMgKy0NCj4gICBzY3JpcHRzL01ha2VmaWxlLmJ1aWxkICAgICAgICAgICAg
ICAgICAgfCAgMTIgKysrDQo+ICAgdG9vbHMvb2JqdG9vbC9CdWlsZCAgICAgICAgICAgICAgICAg
ICAgIHwgICAyICsNCj4gICB0b29scy9vYmp0b29sL01ha2VmaWxlICAgICAgICAgICAgICAgICAg
fCAgIDQgKy0NCj4gICB0b29scy9vYmp0b29sL2J1aWx0aW4tbWNvdW50LmMgICAgICAgICAgfCAg
NzQgKysrKysrKysrKysrKw0KPiAgIHRvb2xzL29ianRvb2wvaW5jbHVkZS9vYmp0b29sL2J1aWx0
aW4uaCB8ICAgNCArLQ0KPiAgIHRvb2xzL29ianRvb2wvaW5jbHVkZS9vYmp0b29sL29ianRvb2wu
aCB8ICAgMSArDQo+ICAgdG9vbHMvb2JqdG9vbC9tY291bnQuYyAgICAgICAgICAgICAgICAgIHwg
MTM4ICsrKysrKysrKysrKysrKysrKysrKysrKw0KPiAgIHRvb2xzL29ianRvb2wvb2JqdG9vbC5j
ICAgICAgICAgICAgICAgICB8ICAgMSArDQo+ICAgdG9vbHMvb2JqdG9vbC93ZWFrLmMgICAgICAg
ICAgICAgICAgICAgIHwgICA1ICsNCj4gICAxMSBmaWxlcyBjaGFuZ2VkLCAyNDcgaW5zZXJ0aW9u
cygrKSwgMyBkZWxldGlvbnMoLSkNCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMvb2JqdG9v
bC9idWlsdGluLW1jb3VudC5jDQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xzL29ianRvb2wv
bWNvdW50LmMNCj4gDQo+IGRpZmYgLS1naXQgYS9NYWtlZmlsZSBiL01ha2VmaWxlDQo+IGluZGV4
IDU1YTMwY2E2OTM1MC4uMzE2ZjdkMDhiMzBhIDEwMDY0NA0KPiAtLS0gYS9NYWtlZmlsZQ0KPiAr
KysgYi9NYWtlZmlsZQ0KPiBAQCAtODQ2LDcgKzg0Niw5IEBAIGlmZGVmIENPTkZJR19GVFJBQ0Vf
TUNPVU5UX1VTRV9DQw0KPiAgICAgZW5kaWYNCj4gICBlbmRpZg0KPiAgIGlmZGVmIENPTkZJR19G
VFJBQ0VfTUNPVU5UX1VTRV9PQkpUT09MDQo+ICsgaWZkZWYgQ09ORklHX0hBVkVfTk9QX01DT1VO
VA0KPiAgICAgQ0NfRkxBR1NfVVNJTkcJKz0gLURDQ19VU0lOR19OT1BfTUNPVU5UDQo+ICsgZW5k
aWYNCj4gICBlbmRpZg0KPiAgIGlmZGVmIENPTkZJR19GVFJBQ0VfTUNPVU5UX1VTRV9SRUNPUkRN
Q09VTlQNCj4gICAgIGlmZGVmIENPTkZJR19IQVZFX0NfUkVDT1JETUNPVU5UDQo+IEBAIC0xMzAz
LDYgKzEzMDUsMTAgQEAgaWZkZWYgQ09ORklHX1NUQUNLX1ZBTElEQVRJT04NCj4gICBwcmVwYXJl
OiB0b29scy9vYmp0b29sDQo+ICAgZW5kaWYNCj4gICANCj4gK2lmZGVmIENPTkZJR19GVFJBQ0Vf
TUNPVU5UX1VTRV9PQkpUT09MDQo+ICtwcmVwYXJlOiB0b29scy9vYmp0b29sDQo+ICtlbmRpZg0K
DQpJIGRvbid0IHRoaW5rIHRoYXQgd2lsbCB3b3JrIGZvciBwb3dlcnBjLg0KDQpTZWUgYXJjaC9w
b3dlcnBjL01ha2VmaWxlDQoNCnBvd2VycGMgYnVpbGRzIHRoZSBWRFNPIHVuZGVyIHByZXBhcmU6
ICwgYW5kIHBvd2VycGMgaGFzIA0KQ09ORklHX0hBVkVfR0VORVJJQ19WRFNPIHNvIHRoZXJlIGFy
ZSBzb21lIEMgZmlsZXMgaW4gdGhhdCBzdGVwIHRoYXQgDQpzZWVtIHRvIHVzZSBvYmp0b29sLCBh
bGx0aG91Z2ggdGhhdCBsb29rcyBvZGQgdG8gbWUuIE11c3QgYmUgc29tZXRoaW5nIA0KdG8gZml4
IHNvbWV3aGVyZS4NCg0KICAgcG93ZXJwYzY0LWxpbnV4LWdjYyANCi1XcCwtTU1ELGFyY2gvcG93
ZXJwYy9rZXJuZWwvdmRzby8udmdldHRpbWVvZmRheS02NC5vLmQgLW5vc3RkaW5jIA0KLUkuL2Fy
Y2gvcG93ZXJwYy9pbmNsdWRlIC1JLi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9nZW5lcmF0ZWQgIC1J
Li9pbmNsdWRlIA0KLUkuL2FyY2gvcG93ZXJwYy9pbmNsdWRlL3VhcGkgLUkuL2FyY2gvcG93ZXJw
Yy9pbmNsdWRlL2dlbmVyYXRlZC91YXBpIA0KLUkuL2luY2x1ZGUvdWFwaSAtSS4vaW5jbHVkZS9n
ZW5lcmF0ZWQvdWFwaSAtaW5jbHVkZSANCi4vaW5jbHVkZS9saW51eC9jb21waWxlci12ZXJzaW9u
LmggLWluY2x1ZGUgLi9pbmNsdWRlL2xpbnV4L2tjb25maWcuaCANCi1pbmNsdWRlIC4vaW5jbHVk
ZS9saW51eC9jb21waWxlcl90eXBlcy5oIC1EX19LRVJORUxfXyAtSSAuL2FyY2gvcG93ZXJwYyAN
Ci1ESEFWRV9BU19BVEhJR0g9MSAtZm1hY3JvLXByZWZpeC1tYXA9Li89IC1XYWxsIC1XdW5kZWYg
DQotV2Vycm9yPXN0cmljdC1wcm90b3R5cGVzIC1Xbm8tdHJpZ3JhcGhzIC1mbm8tc3RyaWN0LWFs
aWFzaW5nIA0KLWZuby1jb21tb24gLWZzaG9ydC13Y2hhciAtZm5vLVBJRSAtV2Vycm9yPWltcGxp
Y2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uIA0KLVdlcnJvcj1pbXBsaWNpdC1pbnQgLVdlcnJvcj1y
ZXR1cm4tdHlwZSAtV25vLWZvcm1hdC1zZWN1cml0eSAtc3RkPWdudTg5IA0KLW1iaWctZW5kaWFu
IC1tNjQgLW1zb2Z0LWZsb2F0IC1waXBlIC1tdHJhY2ViYWNrPW5vIC1tYWJpPWVsZnYxIA0KLW1j
YWxsLWFpeGRlc2MgLW1jbW9kZWw9bWVkaXVtIC1tbm8tcG9pbnRlcnMtdG8tbmVzdGVkLWZ1bmN0
aW9ucyANCi1tdHVuZT1wb3dlcjcgLW1jcHU9cG93ZXI1IC1tbm8tYWx0aXZlYyAtbW5vLXZzeCAN
Ci1mbm8tYXN5bmNocm9ub3VzLXVud2luZC10YWJsZXMgLW1uby1zdHJpbmcgLVdhLC1tYWx0aXZl
YyAtV2EsLW1wb3dlcjQgDQotV2EsLW1hbnkgLW1hYmk9ZWxmdjEgLW1jYWxsLWFpeGRlc2MgLW1i
aWctZW5kaWFuIA0KLW1zdGFjay1wcm90ZWN0b3ItZ3VhcmQ9dGxzIC1tc3RhY2stcHJvdGVjdG9y
LWd1YXJkLXJlZz1yMTMgDQotZm5vLWRlbGV0ZS1udWxsLXBvaW50ZXItY2hlY2tzIC1Xbm8tZnJh
bWUtYWRkcmVzcyANCi1Xbm8tZm9ybWF0LXRydW5jYXRpb24gLVduby1mb3JtYXQtb3ZlcmZsb3cg
DQotV25vLWFkZHJlc3Mtb2YtcGFja2VkLW1lbWJlciAtTzIgLWZuby1hbGxvdy1zdG9yZS1kYXRh
LXJhY2VzIA0KLVdmcmFtZS1sYXJnZXItdGhhbj0yMDQ4IC1mc3RhY2stcHJvdGVjdG9yLXN0cm9u
ZyANCi1XaW1wbGljaXQtZmFsbHRocm91Z2g9NSAtV25vLW1haW4gLVduby11bnVzZWQtYnV0LXNl
dC12YXJpYWJsZSANCi1Xbm8tdW51c2VkLWNvbnN0LXZhcmlhYmxlIC1mbm8tc3RhY2stY2xhc2gt
cHJvdGVjdGlvbiANCi1XZGVjbGFyYXRpb24tYWZ0ZXItc3RhdGVtZW50IC1XdmxhIC1Xbm8tcG9p
bnRlci1zaWduIA0KLVdjYXN0LWZ1bmN0aW9uLXR5cGUgLVduby1zdHJpbmdvcC10cnVuY2F0aW9u
IC1Xbm8temVyby1sZW5ndGgtYm91bmRzIA0KLVduby1hcnJheS1ib3VuZHMgLVduby1zdHJpbmdv
cC1vdmVyZmxvdyAtV25vLXJlc3RyaWN0IA0KLVduby1tYXliZS11bmluaXRpYWxpemVkIC1Xbm8t
YWxsb2Mtc2l6ZS1sYXJnZXItdGhhbiANCi1mbm8tc3RyaWN0LW92ZXJmbG93IC1mbm8tc3RhY2st
Y2hlY2sgLWZjb25zZXJ2ZS1zdGFjayAtV2Vycm9yPWRhdGUtdGltZSANCi1XZXJyb3I9aW5jb21w
YXRpYmxlLXBvaW50ZXItdHlwZXMgLVdlcnJvcj1kZXNpZ25hdGVkLWluaXQgDQotV25vLXBhY2tl
ZC1ub3QtYWxpZ25lZCAtbXN0YWNrLXByb3RlY3Rvci1ndWFyZC1vZmZzZXQ9MzIwMCAtc2hhcmVk
IA0KLWZuby1jb21tb24gLWZuby1idWlsdGluIC1ub3N0ZGxpYiAtV2wsLS1oYXNoLXN0eWxlPWJv
dGggLWluY2x1ZGUgDQovaG9tZS9jaGxlcm95L2xpbnV4LXBvd2VycGMvbGliL3Zkc28vZ2V0dGlt
ZW9mZGF5LmMgLWZuby1zdGFjay1wcm90ZWN0b3IgDQotRERJU0FCTEVfQlJBTkNIX1BST0ZJTElO
RyAtZmZyZWVzdGFuZGluZyAtZmFzeW5jaHJvbm91cy11bndpbmQtdGFibGVzIA0KLWZmaXhlZC1y
MzAgDQotREtCVUlMRF9NT0RGSUxFPSciYXJjaC9wb3dlcnBjL2tlcm5lbC92ZHNvL3ZnZXR0aW1l
b2ZkYXktNjQiJyANCi1ES0JVSUxEX0JBU0VOQU1FPScidmdldHRpbWVvZmRheV82NCInIA0KLURL
QlVJTERfTU9ETkFNRT0nInZnZXR0aW1lb2ZkYXlfNjQiJyANCi1EX19LQlVJTERfTU9ETkFNRT1r
bW9kX3ZnZXR0aW1lb2ZkYXlfNjQgLWMgLW8gDQphcmNoL3Bvd2VycGMva2VybmVsL3Zkc28vdmdl
dHRpbWVvZmRheS02NC5vIA0KYXJjaC9wb3dlcnBjL2tlcm5lbC92ZHNvL3ZnZXR0aW1lb2ZkYXku
YyAgOyAuL3Rvb2xzL29ianRvb2wvb2JqdG9vbCANCm1jb3VudCBhcmNoL3Bvd2VycGMva2VybmVs
L3Zkc28vdmdldHRpbWVvZmRheS02NC5vDQoNCg0KPiArDQo+ICAgaWZkZWYgQ09ORklHX0JQRg0K
PiAgIGlmZGVmIENPTkZJR19ERUJVR19JTkZPX0JURg0KPiAgIHByZXBhcmU6IHRvb2xzL2JwZi9y
ZXNvbHZlX2J0Zmlkcw==
