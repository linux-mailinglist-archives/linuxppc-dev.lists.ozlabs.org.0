Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C6144097F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Oct 2021 16:21:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HhM0t11t8z3cBs
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 Oct 2021 01:21:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=infinera.com header.i=@infinera.com header.a=rsa-sha256 header.s=selector2 header.b=HhMo2P8G;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=infinera.com (client-ip=40.107.212.64;
 helo=nam02-bn1-obe.outbound.protection.outlook.com;
 envelope-from=joakim.tjernlund@infinera.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=infinera.com header.i=@infinera.com header.a=rsa-sha256
 header.s=selector2 header.b=HhMo2P8G; 
 dkim-atps=neutral
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2064.outbound.protection.outlook.com [40.107.212.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HhM036v8Kz2yPl
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 31 Oct 2021 01:20:33 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M8Rwe6vz5RQmOelZaHzDaVHyveAoVh8e6vHQXwAMHftGbEe6lAgwPBqSH97xLRp/E3DdXqJzFVOOijJd5wWq/VfnQftO+Ne9q+EDuLfRliR9nVECG3f0ao5LSFSioyQkKU5kv9qVrOFmM90JiwXf1iX26xejxP7QtRhiRLis83KN/k9NXv6y1iuV+AuVP0UWi2fNO6vWvZg6RsmjrObbejHtX1pQrRjFPdvTGQLcDozPt1ChDOaoWWdKNjMxOZM7Dvs4Lk8y4k4jF1K9GFoWbNXnBAPZFH4c3S4+cAiAipZpcdnrU/RCQTedotnZbdYXqcOCGj5SX2sNdS50+qEPuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XN9a02MSZDyA7Erb9UtfkJiIUsXiCd3w4rZhmpSxXmM=;
 b=eMijj2+3b5+VoQBbD6KbBuCYraQ6wyzSTzcM+YaBfxaz0ZvywxMRdTDQBCF/a2iGvgH37bt5fPaPc9pdNgXAW4IknnyEhIbIfpT2Rda5UlYQjtZAf9mrtkXSObsn9OBm6K8ioNuAnUbyR7IBVFqBwShdn1tmImV1zWXsj6AReBCj6LqaJpzXup3cATDGmCUTQaA6DTfcXPKF2+Jdl0/sIG47JxyO/Gc3gzJqcvD7MIlpiVcMxp6siUJXRdinM2Hoie8QBPIlVpZsJRy80IcPtNe8Ux1IrFRpTQ8LOSssNgPZUKwU3UTG0icXryZcsaSsg+BKg6LeNyYnCESFIqLSOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XN9a02MSZDyA7Erb9UtfkJiIUsXiCd3w4rZhmpSxXmM=;
 b=HhMo2P8GlCS7S9x1ApTW10nLTa9lS+GDM4Lj/rHcHI8ZYvtbU79e0nQp1efFVPi5sUbys4lnPcnEM0yC4p6XtRhW+DAJGaYm6phHPVOGoNspe93ICCNhbSEPIGgOZNKdEt3e1IwtGIzZG02sCHawtr+z6RPjROY4nmIV6BcZwsE=
Received: from PH0PR10MB4615.namprd10.prod.outlook.com (2603:10b6:510:36::24)
 by PH0PR10MB5594.namprd10.prod.outlook.com (2603:10b6:510:f6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Sat, 30 Oct
 2021 14:20:12 +0000
Received: from PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::112e:1c94:4171:1db7]) by PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::112e:1c94:4171:1db7%5]) with mapi id 15.20.4649.017; Sat, 30 Oct 2021
 14:20:12 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "Eugene_Bordenkircher@selinc.com" <Eugene_Bordenkircher@selinc.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: bug: usb: gadget: FSL_UDC_CORE Corrupted request list leads to
 unrecoverable loop.
Thread-Topic: bug: usb: gadget: FSL_UDC_CORE Corrupted request list leads to
 unrecoverable loop.
Thread-Index: AdfM5PT/NvfAW0+iTcC+AdIF01azggAtEqGA
Date: Sat, 30 Oct 2021 14:20:12 +0000
Message-ID: <2c275adc278477e1e512ea6ecc0c1f4dcc46969d.camel@infinera.com>
References: <MWHPR2201MB152074F47BF142189365627B91879@MWHPR2201MB1520.namprd22.prod.outlook.com>
In-Reply-To: <MWHPR2201MB152074F47BF142189365627B91879@MWHPR2201MB1520.namprd22.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=infinera.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1d4339ca-1fa0-4e21-01dd-08d99bb0630b
x-ms-traffictypediagnostic: PH0PR10MB5594:
x-microsoft-antispam-prvs: <PH0PR10MB559492B3E90E2F58D6F71F67F4889@PH0PR10MB5594.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bqgWTMEMOuwDfHd8n8RzKV03WiJJYJpk+QHH0bD7ZIwC16ItYLzaSDa9kRacjojRZudTGBAe2379sg3eV6wKNcZXwsp7jtwJHCdQ4YI0abATIY7cjCA2VgU88Ns8VUQpF+w//UGsPNmShaUocprG+fh+KImcqwYB/g61nizt05NFCkskYmGWsCwjh0UbCbxI/g6fGloWOwmofwM7VO3k5OTGQ48EFNqXzGvrUjHoruQ1RjyARCIyOF2t5gWjIFiStoB+ligbNyaB43UN4BBW4QDKFBUipwxufrvZjlEHG9LlQ0HZflBSpinfq8EhJRno7Iney8JTAVK1t05sYaCEOUIGwNcyIOrW2kpXblJUFft6uICDmxQSPYDrOJW3GChb9nUo57Z5Aoa+R621d2Scs1TEN9y0/dumWhaHhYIc7ylYq72HwQoyFNLXKGAaf8gpLc2g2DktA4u2nvcL5YRui4y2f00QeczpF5iY7Cesz6tLE1NYSId84CaOrs1z4opgJgp9R7xaSVS6UKO8n3QA2YUZiQNYKae0OylRxbOy80kfIlctyvznLSnAqrrszQA+3q1m0+ephiVdz+buIpDzsHDiA+jPi5m+OVj4DkNryf0MsK1ARWfOID9MgwxIvFSFIJrCb28q+8FMSPjfdLf5u5ghFAEQ9/B38CizF/eitgpTVDI3Ig/0e93O1+4+kxLePINVIwcY/zES8MZf1kLEoA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4615.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2906002)(36756003)(186003)(316002)(66556008)(86362001)(26005)(64756008)(66476007)(66446008)(71200400001)(99936003)(5660300002)(6506007)(38070700005)(6486002)(54906003)(8936002)(38100700002)(110136005)(4326008)(8676002)(4001150100001)(122000001)(83380400001)(6512007)(66946007)(76116006)(91956017)(2616005)(508600001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c2dmdmRSWlpVRTRqd2s1Ymtzb0x4bXZuQkFDUGRMMkR6SEJ4ejNFc0NzMmhR?=
 =?utf-8?B?QmdVcE14RFB1MjVza2g2cUlqR3NpbGZKci9Ud1dsYWVGU2lVNGtSbFVYSEUz?=
 =?utf-8?B?VE8zNThtUHpORSsra0dHME0zejk4UXlLU1E3RGJlcVpFamZSWmovZFBXSytP?=
 =?utf-8?B?SExSa0VTK1ZNcHJKT3ZJSVdvQlVuMDdMS0VSSDZyaURjYXhDaUFBTzc1cmQz?=
 =?utf-8?B?T1ZFU09CWjJ3UWNXdE5EV3ZjWU9iTzlLN21RL1JOZ3FkTUpxWHZneTV5TnZy?=
 =?utf-8?B?SWp5VEo0NHB6MDJWU3dVV3Z4RkF5LzFISmN3NXBOOFpCVjAyRGVkWUUrS20y?=
 =?utf-8?B?QnBtZWk5WEJHSk5LVGs5emt6WEMrY2l1L2xsUXZialFGcXBmTEM1QlRnbE51?=
 =?utf-8?B?L2RXOTRRRWMwOXBmVGxHM3dIc0ZxL1loU0t1MUtzWU80RmdRWklEcnZsUGh2?=
 =?utf-8?B?RUVIV010QUxCejJEU3FRWFYzN3BSMHF4TURnbGxmK3VZYVRDRnJMamhKRUIw?=
 =?utf-8?B?L3ZnT0l6bG9sMno4VmJ2cDVCbU1hR1RXSDFWN2c5RUxIQ3NNYVNHK3F6UWxp?=
 =?utf-8?B?VklhV0hKb01oQ1FLa0g0OHFWMTNLVnVlc0pRd3RMMUczZ08yd3FZSVh6NHVm?=
 =?utf-8?B?NFg0MGJzRGp4cWxONnlYbHZmcXkrNysra3gzOUp1Nm9oelUxV0dYMGtLR0lV?=
 =?utf-8?B?U3ZPVFlmOXhPSlJOQUduOWJzR3FHNEVQTTdvdmhjRy9xaXNtZ1Zoek1xLzdK?=
 =?utf-8?B?KzVOWFloQjU1R3hpVldoWmhLc3p5M0g0b0hUQW9MZjlVQ1hmVGgxZEdER1RO?=
 =?utf-8?B?MVhrcWZ2OHU4aHQ3YnZrU01aSWhua25BaWllNGxCUHIxbERSVEVnR0tIVjZr?=
 =?utf-8?B?V2MrWWg0Qm9HcDYwU0tWYTl4TUNZTXJzWVFNWnVGRmdtMm5hdGRRL2VwU0Q0?=
 =?utf-8?B?K3ZzYkhsYzgxRjJKdE9rRCt2TytrMENlQXBoSWZtcXBFY0xYOHRyRHlnbzFn?=
 =?utf-8?B?TWhuRzBmQnZ3aWZxMzd5bndxc0Nya1UySWtKL096blZQTXg2OTZ2MGxDZ21n?=
 =?utf-8?B?a1pIRndKRFBlVEFsazZSdmFOb0h2dkFtS2xGT0Y4Y1ZmbFhMaUxJTFNKSmo3?=
 =?utf-8?B?QUdMeCszWU1sb08yZEo0eEZVc1czdFJlRUE4eTFON1pVK2w2bnNNSUpkTHo3?=
 =?utf-8?B?WHF0NnlraDhGSnVQcmdRellxUFNKaEJySmRSTUFuOUpSQWQzVXp3eDV3OWlK?=
 =?utf-8?B?V2VobjhubmxhNmFGZ2hZTWFYYnRLNTlIMnBKV0IwLzRoRkcxRHdNWVdQaTFO?=
 =?utf-8?B?T1pnVStkNmoxblNBL0FjZUNVQUpNMWNMSjlyTkZxRE1zVDJqbDhmZGhVSk1X?=
 =?utf-8?B?bm15a3RaYmYxSjhhRTZPNE5INm12TVdwb2QwWHpZQjdGRmJadHFMUnk2Q0dt?=
 =?utf-8?B?VUNBaWVtQWVXaHQ1Y1BjcFlWUWNQMEw3MUZTQk9sazZTOUlCdEpoeEpBVENF?=
 =?utf-8?B?OGl3aGg0eUppM1JqZHdrQkZDd0ZHY002aU4ydUtLMWplempBY3lrZlRlMzRS?=
 =?utf-8?B?dzdmVWYwWmtYQ2JXUVFYUWI2bjNsb2Frb2YwUHBEK0dhenVSRjBucy9FVDhJ?=
 =?utf-8?B?Y0Q4dEYvTnJZZW1YSUpDWkFzMDRwelJseG9rVCtMY05leW5TL0MwaHozeTY4?=
 =?utf-8?B?Y0RocmNEVTR4ZS9hRlpXckdrUlpOT2IxZW00U2o0UG1mQUE1cVdMV1lBNldk?=
 =?utf-8?B?MGNzaXB3UU5QV3h0NzZZSUpKMUVrZGQzWlFXZVNTZVI1dDZ1NzVNaXJTZ2tL?=
 =?utf-8?B?Wnd0NGdMZWVZRDgwK2JUaCtzUGYrbEpuQWRWQmVXS2FOMnBEZzBQeXB6TjFL?=
 =?utf-8?B?T3JnV0hHK3B6STZvaFRmcHZaYmlvY2Ric3BhVE5KS3cycVd0Z2V2NU4zUnFh?=
 =?utf-8?B?SFRZSG5CRW56Yk5XSkp2N3pKQktBaHF0czhuYkRXMzBtTUFHMEtPd2d1TnlU?=
 =?utf-8?B?K2dhRGRqaE5hNUVmb2YzT0w3RXp3aHZRaTQ3WU9DK0hxcEdkQytIcGNHQmtD?=
 =?utf-8?B?NHJFaDZiSlo1QzJ2LzgvMXNBSzVneDRqOThxVFJXUldDMnJrL0Z5N0FQZG0y?=
 =?utf-8?B?NU1IYnFFNlZlKzNrak1EeXoyTzZ2WDhaQi9wczcxUHNhbEVRU3RDMmkvSC9x?=
 =?utf-8?Q?cdvkDi5LEj4yfqzCClTc7DI=3D?=
Content-Type: multipart/mixed;
 boundary="_006_2c275adc278477e1e512ea6ecc0c1f4dcc46969dcamelinfineraco_"
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4615.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d4339ca-1fa0-4e21-01dd-08d99bb0630b
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2021 14:20:12.6566 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MeXOcwRZLp0iXEZrrCo0r9apbKb0ikaCFIgn+AxQH7w6P2WOMupclE3F6XRAr4KpuBpV3rrOPNqzZPDXAKnsWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5594
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
Cc: "gregkh@linuxfoundataion.org" <gregkh@linuxfoundataion.org>,
 "balbi@kernel.org" <balbi@kernel.org>,
 "leoyang.li@nxp.com" <leoyang.li@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--_006_2c275adc278477e1e512ea6ecc0c1f4dcc46969dcamelinfineraco_
Content-Type: text/plain; charset="utf-8"
Content-ID: <86D1D7D4EA8D26419C4233887987AC2B@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64

T24gRnJpLCAyMDIxLTEwLTI5IGF0IDE3OjE0ICswMDAwLCBFdWdlbmUgQm9yZGVua2lyY2hlciB3
cm90ZToNCj4gSGVsbG8gYWxsLA0KPiANCj4gV2UndmUgZGlzY292ZXJlZCBhIHNpdHVhdGlvbiB3
aGVyZSB0aGUgRlNMIHVkYyBkcml2ZXIgKGRyaXZlcnMvdXNiL2dhZGdldC91ZGMvZnNsX3VkY19j
b3JlLmMpIHdpbGwgZW50ZXIgYSBsb29wIGl0ZXJhdGluZyBvdmVyIHRoZSByZXF1ZXN0IHF1ZXVl
LCBidXQgdGhlIHF1ZXVlIGhhcyBiZWVuIGNvcnJ1cHRlZCBhdCBzb21lIHBvaW50IHNvIGl0IGxv
b3BzIGluZmluaXRlbHkuICBJIGJlbGlldmUgd2UgaGF2ZSBuYXJyb3dlZCBpbnRvIHRoZSBvZmZl
bmRpbmcgY29kZSwgYnV0IHdlIGFyZSBpbiBuZWVkIG9mIGFzc2lzdGFuY2UgdHJ5aW5nIHRvIGZp
bmQgYW4gYXBwcm9wcmlhdGUgZml4IGZvciB0aGUgcHJvYmxlbS4gIFRoZSBpZGVudGlmaWVkIGNv
ZGUgYXBwZWFycyB0byBiZSBpbiBhbGwgdmVyc2lvbnMgb2YgdGhlIExpbnV4IGtlcm5lbCB0aGUg
ZHJpdmVyIGV4aXN0cyBpbi4NCj4gDQo+IFRoZSBwcm9ibGVtIGFwcGVhcnMgdG8gYmUgd2hlbiBo
YW5kbGluZyBhIFVTQl9SRVFfR0VUX1NUQVRVUyByZXF1ZXN0LiAgVGhlIGRyaXZlciBnZXRzIHRo
aXMgcmVxdWVzdCBhbmQgdGhlbiBjYWxscyB0aGUgY2g5Z2V0c3RhdHVzKCkgZnVuY3Rpb24uICBJ
biB0aGlzIGZ1bmN0aW9uLCBpdCBzdGFydHMgYSByZXF1ZXN0IGJ5ICJib3Jyb3dpbmciIHRoZSBw
ZXIgZGV2aWNlIHN0YXR1c19yZXEsIGZpbGxpbmcgaXQgaW4sIGFuZCB0aGVuIHF1ZXVpbmcgaXQg
d2l0aCBhIGNhbGwgdG8gbGlzdF9hZGRfdGFpbCgpIHRvIGFkZCB0aGUgcmVxdWVzdCB0byB0aGUg
ZW5kcG9pbnQgcXVldWUuICBSaWdodCBiZWZvcmUgaXQgZXhpdHMgdGhlIGZ1bmN0aW9uIGhvd2V2
ZXIsIGl0J3MgY2FsbGluZyBlcDBfcHJpbWVfc3RhdHVzKCksIHdoaWNoIGlzIGZpbGxpbmcgb3V0
IHRoYXQgc2FtZSBzdGF0dXNfcmVxIHN0cnVjdHVyZSBhbmQgdGhlbiBxdWV1aW5nIGl0IHdpdGgg
YW5vdGhlciBjYWxsIHRvIGxpc3RfYWRkX3RhaWwoKSB0byBhZGQgdGhlIHJlcXVlc3QgdG8gdGhl
IGVuZHBvaW50IHF1ZXVlLiAgVGhpcyBhZGRzIHR3byBpbnN0YW5jZXMgb2YgdGhlIGV4YWN0IHNh
bWUgTElTVF9IRUFEIHRvIHRoZSBlbmRwb2ludCBxdWV1ZSwgd2hpY2ggYnJlYWtzIHRoZSBsaXN0
IHNpbmNlIHRoZSBwcmV2IGFuZCBuZXh0IHBvaW50ZXJzIGVuZCB1cCBwb2ludGluZyB0byB0aGUg
d3JvbmcgdGhpbmdzLiAgVGhpcyBlbmRzIHVwIGNhdXNpbmcgYSBoYXJkIGxvb3AgdGhlIG5leHQg
dGltZSBudWtlKCkgZ2V0cyBjYWxsZWQsIHdoaWNoIGhhcHBlbnMgb24gdGhlIG5leHQgc2V0dXAg
SVJRLg0KPiANCj4gSSdtIG5vdCBzdXJlIHdoYXQgdGhlIGFwcHJvcHJpYXRlIGZpeCB0byB0aGlz
IHByb2JsZW0gaXMsIG1vc3RseSBkdWUgdG8gbXkgbGFjayBvZiBleHBlcnRpc2UgaW4gVVNCIGFu
ZCB0aGlzIGRyaXZlciBzdGFjay4gIFRoZSBjb2RlIGhhcyBiZWVuIHRoaXMgd2F5IGluIHRoZSBr
ZXJuZWwgZm9yIGEgdmVyeSBsb25nIHRpbWUsIHdoaWNoIHN1Z2dlc3RzIHRoYXQgaXQgaGFzIGJl
ZW4gd29ya2luZywgdW5sZXNzIFVTQl9SRVFfR0VUX1NUQVRVUyByZXF1ZXN0cyBhcmUgbmV2ZXIg
bWFkZS4gIFRoaXMgZnVydGhlciBzdWdnZXN0cyB0aGF0IHRoZXJlIGlzIHNvbWV0aGluZyBlbHNl
IGdvaW5nIG9uIHRoYXQgSSBkb24ndCB1bmRlcnN0YW5kLiAgRGVsZXRpbmcgdGhlIGNhbGwgdG8g
ZXAwX3ByaW1lX3N0YXR1cygpIGFuZCB0aGUgZm9sbG93aW5nIGVwMHN0YWxsKCkgY2FsbCBhcHBl
YXJzLCBvbiB0aGUgc3VyZmFjZSwgdG8gZ2V0IHRoZSBkZXZpY2Ugd29ya2luZyBhZ2FpbiwgYnV0
IG1heSBoYXZlIHNpZGUgZWZmZWN0cyB0aGF0IEknbSBub3Qgc2VlaW5nLg0KPiANCj4gSSdtIGhv
cGVmdWwgc29tZW9uZSBpbiB0aGUgY29tbXVuaXR5IGNhbiBoZWxwIHByb3ZpZGUgc29tZSBpbmZv
cm1hdGlvbiBvbiB3aGF0IEkgbWF5IGJlIG1pc3Npbmcgb3IgaGVscCBjb21lIHVwIHdpdGggYSBz
b2x1dGlvbiB0byB0aGUgcHJvYmxlbS4gIEEgYmlnIHRoYW5rIHlvdSB0byBhbnlvbmUgd2hvIHdv
dWxkIGxpa2UgdG8gaGVscCBvdXQuDQo+IA0KPiBFdWdlbmUNCg0KUnVuIGludG8gdGhpcyB0byBh
IHdoaWxlIGFnby4gRm91bmQgdGhlIGJ1ZyBhbmQgYSBmZXcgbW9yZSBmaXhlcy4NClRoaXMgaXMg
YWdhaW5zdCA0LjE5IHNvIHlvdSBtYXkgaGF2ZSB0byB0d2VhayB0aGVtIGEgYml0Lg0KRmVlbCBm
cmVlIHRvIHVwc3RyZWFtIHRoZW0uDQoNCiBKb2NrZSANCg==

--_006_2c275adc278477e1e512ea6ecc0c1f4dcc46969dcamelinfineraco_
Content-Type: text/x-patch;
	name="0005-fsl_udc_core-Init-max_pipes-for-reset_queues.patch"
Content-Description: 0005-fsl_udc_core-Init-max_pipes-for-reset_queues.patch
Content-Disposition: attachment;
	filename="0005-fsl_udc_core-Init-max_pipes-for-reset_queues.patch"; size=989;
	creation-date="Sat, 30 Oct 2021 14:20:12 GMT";
	modification-date="Sat, 30 Oct 2021 14:20:12 GMT"
Content-ID: <C6CFB680186EC344A543549965F8B4F0@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64

RnJvbSBhN2VkOWNmZmJmYzkwMzcxYjU3MGViZWY2OThkOTZjMzlhZGJhZjc3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBKb2FraW0gVGplcm5sdW5kIDxqb2FraW0udGplcm5sdW5kQGlu
ZmluZXJhLmNvbT4KRGF0ZTogTW9uLCAxMSBNYXkgMjAyMCAxMToxODoxNCArMDIwMApTdWJqZWN0
OiBbUEFUQ0ggNS81XSBmc2xfdWRjX2NvcmU6IEluaXQgbWF4X3BpcGVzIGZvciByZXNldF9xdWV1
ZXMoKQoKU2lnbmVkLW9mZi1ieTogSm9ha2ltIFRqZXJubHVuZCA8am9ha2ltLnRqZXJubHVuZEBp
bmZpbmVyYS5jb20+Ci0tLQogZHJpdmVycy91c2IvZ2FkZ2V0L3VkYy9mc2xfdWRjX2NvcmUuYyB8
IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy91c2IvZ2FkZ2V0L3VkYy9mc2xfdWRjX2NvcmUuYyBiL2RyaXZlcnMvdXNiL2dhZGdldC91ZGMv
ZnNsX3VkY19jb3JlLmMKaW5kZXggYmQzODI1ZDlmMWQyLi45MjEzNmRmZjgzNzMgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvdXNiL2dhZGdldC91ZGMvZnNsX3VkY19jb3JlLmMKKysrIGIvZHJpdmVycy91
c2IvZ2FkZ2V0L3VkYy9mc2xfdWRjX2NvcmUuYwpAQCAtMjQ0MSw2ICsyNDQxLDcgQEAgc3RhdGlj
IGludCBmc2xfdWRjX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJLyogR2V0
IG1heCBkZXZpY2UgZW5kcG9pbnRzICovCiAJLyogREVOIGlzIGJpZGlyZWN0aW9uYWwgZXAgbnVt
YmVyLCBtYXhfZXAgZG91YmxlcyB0aGUgbnVtYmVyICovCiAJdWRjX2NvbnRyb2xsZXItPm1heF9l
cCA9IChkY2NwYXJhbXMgJiBEQ0NQQVJBTVNfREVOX01BU0spICogMjsKKwl1ZGNfY29udHJvbGxl
ci0+bWF4X3BpcGVzID0gdWRjX2NvbnRyb2xsZXItPm1heF9lcDsKIAogCXVkY19jb250cm9sbGVy
LT5pcnEgPSBwbGF0Zm9ybV9nZXRfaXJxKHBkZXYsIDApOwogCWlmICghdWRjX2NvbnRyb2xsZXIt
PmlycSkgewotLSAKMi4zMi4wCgo=

--_006_2c275adc278477e1e512ea6ecc0c1f4dcc46969dcamelinfineraco_
Content-Type: text/x-patch;
	name="0004-fsl_udc_stop-Use-list_for_each_entry_safe-when-delet.patch"
Content-Description:  0004-fsl_udc_stop-Use-list_for_each_entry_safe-when-delet.patch
Content-Disposition: attachment;
	filename="0004-fsl_udc_stop-Use-list_for_each_entry_safe-when-delet.patch";
	size=1422; creation-date="Sat, 30 Oct 2021 14:20:12 GMT";
	modification-date="Sat, 30 Oct 2021 14:20:12 GMT"
Content-ID: <70D41E1D1D9D6246A16470C71AD32B53@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64

RnJvbSBiOThmYTBkZDM4NGYxN2ZlZTBjMTI4M2I5MWY4NTViOTdkMTk3NmY0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBKb2FraW0gVGplcm5sdW5kIDxqb2FraW0udGplcm5sdW5kQGlu
ZmluZXJhLmNvbT4KRGF0ZTogTW9uLCAxMSBNYXkgMjAyMCAxMDozODowNyArMDIwMApTdWJqZWN0
OiBbUEFUQ0ggNC81XSBmc2xfdWRjX3N0b3A6IFVzZSBsaXN0X2Zvcl9lYWNoX2VudHJ5X3NhZmUo
KSB3aGVuCiBkZWxldGluZwoKU2lnbmVkLW9mZi1ieTogSm9ha2ltIFRqZXJubHVuZCA8am9ha2lt
LnRqZXJubHVuZEBpbmZpbmVyYS5jb20+Ci0tLQogZHJpdmVycy91c2IvZ2FkZ2V0L3VkYy9mc2xf
dWRjX2NvcmUuYyB8IDYgKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAz
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2dhZGdldC91ZGMvZnNsX3Vk
Y19jb3JlLmMgYi9kcml2ZXJzL3VzYi9nYWRnZXQvdWRjL2ZzbF91ZGNfY29yZS5jCmluZGV4IDRm
ODM1MzMyYWY0NS4uYmQzODI1ZDlmMWQyIDEwMDY0NAotLS0gYS9kcml2ZXJzL3VzYi9nYWRnZXQv
dWRjL2ZzbF91ZGNfY29yZS5jCisrKyBiL2RyaXZlcnMvdXNiL2dhZGdldC91ZGMvZnNsX3VkY19j
b3JlLmMKQEAgLTE5ODQsNyArMTk4NCw3IEBAIHN0YXRpYyBpbnQgZnNsX3VkY19zdGFydChzdHJ1
Y3QgdXNiX2dhZGdldCAqZywKIC8qIERpc2Nvbm5lY3QgZnJvbSBnYWRnZXQgZHJpdmVyICovCiBz
dGF0aWMgaW50IGZzbF91ZGNfc3RvcChzdHJ1Y3QgdXNiX2dhZGdldCAqZykKIHsKLQlzdHJ1Y3Qg
ZnNsX2VwICpsb29wX2VwOworCXN0cnVjdCBmc2xfZXAgKmxvb3BfZXAsICp0bXBfbG9vcDsKIAl1
bnNpZ25lZCBsb25nIGZsYWdzOwogCiAJaWYgKCFJU19FUlJfT1JfTlVMTCh1ZGNfY29udHJvbGxl
ci0+dHJhbnNjZWl2ZXIpKQpAQCAtMjAwMiw4ICsyMDAyLDggQEAgc3RhdGljIGludCBmc2xfdWRj
X3N0b3Aoc3RydWN0IHVzYl9nYWRnZXQgKmcpCiAJc3Bpbl9sb2NrX2lycXNhdmUoJnVkY19jb250
cm9sbGVyLT5sb2NrLCBmbGFncyk7CiAJdWRjX2NvbnRyb2xsZXItPmdhZGdldC5zcGVlZCA9IFVT
Ql9TUEVFRF9VTktOT1dOOwogCW51a2UoJnVkY19jb250cm9sbGVyLT5lcHNbMF0sIC1FU0hVVERP
V04pOwotCWxpc3RfZm9yX2VhY2hfZW50cnkobG9vcF9lcCwgJnVkY19jb250cm9sbGVyLT5nYWRn
ZXQuZXBfbGlzdCwKLQkJCWVwLmVwX2xpc3QpCisJbGlzdF9mb3JfZWFjaF9lbnRyeV9zYWZlKGxv
b3BfZXAsIHRtcF9sb29wLCAmdWRjX2NvbnRyb2xsZXItPmdhZGdldC5lcF9saXN0LAorCQkJCSBl
cC5lcF9saXN0KQogCQludWtlKGxvb3BfZXAsIC1FU0hVVERPV04pOwogCXNwaW5fdW5sb2NrX2ly
cXJlc3RvcmUoJnVkY19jb250cm9sbGVyLT5sb2NrLCBmbGFncyk7CiAKLS0gCjIuMzIuMAoK

--_006_2c275adc278477e1e512ea6ecc0c1f4dcc46969dcamelinfineraco_
Content-Type: text/x-patch; name="0003-fsl_ep_dequeue.patch"
Content-Description: 0003-fsl_ep_dequeue.patch
Content-Disposition: attachment; filename="0003-fsl_ep_dequeue.patch";
	size=1007; creation-date="Sat, 30 Oct 2021 14:20:12 GMT";
	modification-date="Sat, 30 Oct 2021 14:20:12 GMT"
Content-ID: <E1D0ABEEC2513840A098345B224E68F5@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64

RnJvbSBhOTBhODlkMDZiZDAwOGY2MDY0MDRlYzYxM2I0ZjIzNDNiOWRkYTFhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBKb2FraW0gVGplcm5sdW5kIDxqb2FraW0udGplcm5sdW5kQGlu
ZmluZXJhLmNvbT4KRGF0ZTogVGh1LCA3IE1heSAyMDIwIDIyOjM1OjE0ICswMjAwClN1YmplY3Q6
IFtQQVRDSCAzLzVdIGZzbF9lcF9kZXF1ZXVlCgpTaWduZWQtb2ZmLWJ5OiBKb2FraW0gVGplcm5s
dW5kIDxqb2FraW0udGplcm5sdW5kQGluZmluZXJhLmNvbT4KLS0tCiBkcml2ZXJzL3VzYi9nYWRn
ZXQvdWRjL2ZzbF91ZGNfY29yZS5jIHwgOCArKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDcgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2dhZGdl
dC91ZGMvZnNsX3VkY19jb3JlLmMgYi9kcml2ZXJzL3VzYi9nYWRnZXQvdWRjL2ZzbF91ZGNfY29y
ZS5jCmluZGV4IDRiMTU5MWZhMmUxYy4uNGY4MzUzMzJhZjQ1IDEwMDY0NAotLS0gYS9kcml2ZXJz
L3VzYi9nYWRnZXQvdWRjL2ZzbF91ZGNfY29yZS5jCisrKyBiL2RyaXZlcnMvdXNiL2dhZGdldC91
ZGMvZnNsX3VkY19jb3JlLmMKQEAgLTk3Nyw3ICs5NzcsMTMgQEAgc3RhdGljIGludCBmc2xfZXBf
ZGVxdWV1ZShzdHJ1Y3QgdXNiX2VwICpfZXAsIHN0cnVjdCB1c2JfcmVxdWVzdCAqX3JlcSkKIAog
CQkJLyogcHJpbWUgd2l0aCBkVEQgb2YgbmV4dCByZXF1ZXN0ICovCiAJCQlmc2xfcHJpbWVfZXAo
ZXAsIG5leHRfcmVxLT5oZWFkKTsKLQkJfQorCQl9IGVsc2UgeworCQkJc3RydWN0IGVwX3F1ZXVl
X2hlYWQgKnFoOworCisJCQlxaCA9IGVwLT5xaDsKKwkJCXFoLT5uZXh0X2R0ZF9wdHIgPSAxOwor
CQkJcWgtPnNpemVfaW9jX2ludF9zdHMgPSAwOworIAkJfQogCS8qIFRoZSByZXF1ZXN0IGhhc24n
dCBiZWVuIHByb2Nlc3NlZCwgcGF0Y2ggdXAgdGhlIFREIGNoYWluICovCiAJfSBlbHNlIHsKIAkJ
c3RydWN0IGZzbF9yZXEgKnByZXZfcmVxOwotLSAKMi4zMi4wCgo=

--_006_2c275adc278477e1e512ea6ecc0c1f4dcc46969dcamelinfineraco_
Content-Type: text/x-patch; name="0002-fsl_udc-import-build_dtd-fixes.patch"
Content-Description: 0002-fsl_udc-import-build_dtd-fixes.patch
Content-Disposition: attachment;
	filename="0002-fsl_udc-import-build_dtd-fixes.patch"; size=2239;
	creation-date="Sat, 30 Oct 2021 14:20:12 GMT";
	modification-date="Sat, 30 Oct 2021 14:20:12 GMT"
Content-ID: <77CC2A4BEE2DBC4185C522A4C6053FF3@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64

RnJvbSBiM2YwOTc0N2JlMjAwN2JlM2EzNzJmZTgwNjM1YjUxZGY2YmE3MWJkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBKb2FraW0gVGplcm5sdW5kIDxqb2FraW0udGplcm5sdW5kQGlu
ZmluZXJhLmNvbT4KRGF0ZTogVGh1LCA3IE1heSAyMDIwIDIyOjMyOjI2ICswMjAwClN1YmplY3Q6
IFtQQVRDSCAyLzVdIGZzbF91ZGM6IGltcG9ydCBidWlsZF9kdGQgZml4ZXMKClNpZ25lZC1vZmYt
Ynk6IEpvYWtpbSBUamVybmx1bmQgPGpvYWtpbS50amVybmx1bmRAaW5maW5lcmEuY29tPgotLS0K
IGRyaXZlcnMvdXNiL2dhZGdldC91ZGMvZnNsX3VkY19jb3JlLmMgfCAxNiArKysrKysrKysrKysr
LS0tCiAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9nYWRnZXQvdWRjL2ZzbF91ZGNfY29yZS5jIGIvZHJpdmVy
cy91c2IvZ2FkZ2V0L3VkYy9mc2xfdWRjX2NvcmUuYwppbmRleCAyNTQ2YmMyOGY0MmEuLjRiMTU5
MWZhMmUxYyAxMDA2NDQKLS0tIGEvZHJpdmVycy91c2IvZ2FkZ2V0L3VkYy9mc2xfdWRjX2NvcmUu
YworKysgYi9kcml2ZXJzL3VzYi9nYWRnZXQvdWRjL2ZzbF91ZGNfY29yZS5jCkBAIC03NzQsMTIg
Kzc3NCwyMCBAQCBzdGF0aWMgdm9pZCBmc2xfcXVldWVfdGQoc3RydWN0IGZzbF9lcCAqZXAsIHN0
cnVjdCBmc2xfcmVxICpyZXEpCiBzdGF0aWMgc3RydWN0IGVwX3RkX3N0cnVjdCAqZnNsX2J1aWxk
X2R0ZChzdHJ1Y3QgZnNsX3JlcSAqcmVxLCB1bnNpZ25lZCAqbGVuZ3RoLAogCQlkbWFfYWRkcl90
ICpkbWEsIGludCAqaXNfbGFzdCwgZ2ZwX3QgZ2ZwX2ZsYWdzKQogewotCXUzMiBzd2FwX3RlbXA7
CisJdTMyIHN3YXBfdGVtcCwgbXVsdCA9IDA7CiAJc3RydWN0IGVwX3RkX3N0cnVjdCAqZHRkOwor
CXN0cnVjdCBlcF9xdWV1ZV9oZWFkICpkcWg7CiAKIAkvKiBob3cgYmlnIHdpbGwgdGhpcyB0cmFu
c2ZlciBiZT8gKi8KLQkqbGVuZ3RoID0gbWluKHJlcS0+cmVxLmxlbmd0aCAtIHJlcS0+cmVxLmFj
dHVhbCwKLQkJCSh1bnNpZ25lZClFUF9NQVhfTEVOR1RIX1RSQU5TRkVSKTsKKwlpZiAodXNiX2Vu
ZHBvaW50X3hmZXJfaXNvYyhyZXEtPmVwLT5lcC5kZXNjKSkgeworCQlkcWggPSByZXEtPmVwLT5x
aDsKKwkJbXVsdCA9IChkcWgtPm1heF9wa3RfbGVuZ3RoID4+IEVQX1FVRVVFX0hFQURfTVVMVF9Q
T1MpCisJCQkmIDB4MzsKKwkJKmxlbmd0aCA9IG1pbihyZXEtPnJlcS5sZW5ndGggLSByZXEtPnJl
cS5hY3R1YWwsCisJCQkgICAgICAodW5zaWduZWQpKG11bHQgKiByZXEtPmVwLT5lcC5tYXhwYWNr
ZXQpKTsKKwl9IGVsc2UKKwkJKmxlbmd0aCA9IG1pbihyZXEtPnJlcS5sZW5ndGggLSByZXEtPnJl
cS5hY3R1YWwsCisJCQkgICAgICAodW5zaWduZWQpRVBfTUFYX0xFTkdUSF9UUkFOU0ZFUik7CiAK
IAlkdGQgPSBkbWFfcG9vbF9hbGxvYyh1ZGNfY29udHJvbGxlci0+dGRfcG9vbCwgZ2ZwX2ZsYWdz
LCBkbWEpOwogCWlmIChkdGQgPT0gTlVMTCkKQEAgLTc5NCw2ICs4MDIsNyBAQCBzdGF0aWMgc3Ry
dWN0IGVwX3RkX3N0cnVjdCAqZnNsX2J1aWxkX2R0ZChzdHJ1Y3QgZnNsX3JlcSAqcmVxLCB1bnNp
Z25lZCAqbGVuZ3RoLAogCS8qIEluaXQgYWxsIG9mIGJ1ZmZlciBwYWdlIHBvaW50ZXJzICovCiAJ
c3dhcF90ZW1wID0gKHUzMikgKHJlcS0+cmVxLmRtYSArIHJlcS0+cmVxLmFjdHVhbCk7CiAJZHRk
LT5idWZmX3B0cjAgPSBjcHVfdG9faGMzMihzd2FwX3RlbXApOworCXN3YXBfdGVtcCAmPSB+MHhG
RkY7CiAJZHRkLT5idWZmX3B0cjEgPSBjcHVfdG9faGMzMihzd2FwX3RlbXAgKyAweDEwMDApOwog
CWR0ZC0+YnVmZl9wdHIyID0gY3B1X3RvX2hjMzIoc3dhcF90ZW1wICsgMHgyMDAwKTsKIAlkdGQt
PmJ1ZmZfcHRyMyA9IGNwdV90b19oYzMyKHN3YXBfdGVtcCArIDB4MzAwMCk7CkBAIC04MjAsNiAr
ODI5LDcgQEAgc3RhdGljIHN0cnVjdCBlcF90ZF9zdHJ1Y3QgKmZzbF9idWlsZF9kdGQoc3RydWN0
IGZzbF9yZXEgKnJlcSwgdW5zaWduZWQgKmxlbmd0aCwKIAkvKiBFbmFibGUgaW50ZXJydXB0IGZv
ciB0aGUgbGFzdCBkdGQgb2YgYSByZXF1ZXN0ICovCiAJaWYgKCppc19sYXN0ICYmICFyZXEtPnJl
cS5ub19pbnRlcnJ1cHQpCiAJCXN3YXBfdGVtcCB8PSBEVERfSU9DOworCXN3YXBfdGVtcCB8PSBt
dWx0IDw8IDEwOwogCiAJZHRkLT5zaXplX2lvY19zdHMgPSBjcHVfdG9faGMzMihzd2FwX3RlbXAp
OwogCi0tIAoyLjMyLjAKCg==

--_006_2c275adc278477e1e512ea6ecc0c1f4dcc46969dcamelinfineraco_
Content-Type: text/x-patch;
	name="0001-ch9getstatus-ep0_prime_status-fixes-RND-28770.patch"
Content-Description: 0001-ch9getstatus-ep0_prime_status-fixes-RND-28770.patch
Content-Disposition: attachment;
	filename="0001-ch9getstatus-ep0_prime_status-fixes-RND-28770.patch";
	size=4367; creation-date="Sat, 30 Oct 2021 14:20:12 GMT";
	modification-date="Sat, 30 Oct 2021 14:20:12 GMT"
Content-ID: <EB459060835A524599B097578A84F96A@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64

RnJvbSAxN2M2ODRmZGNkNjE1MmI3ZTUwNDY1NmIxNzExZTI0NTA4YzMyZjZlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBKb2FraW0gVGplcm5sdW5kIDxqb2FraW0udGplcm5sdW5kQGlu
ZmluZXJhLmNvbT4KRGF0ZTogRnJpLCA4IE1heSAyMDIwIDE3OjEyOjUzICswMjAwClN1YmplY3Q6
IFtQQVRDSCAxLzVdIGNoOWdldHN0YXR1cy9lcDBfcHJpbWVfc3RhdHVzLCBmaXhlcyBSTkQtMjg3
NzAKClVTQiBkcml2ZXIgYWRkZWQgdGhlIHNhbWUgcmVxIHR3aWNlIHRvIHRoZSBzYW1lIGxpc3Qu
ClRoaXMgY2F1c2UgYSBlbmRsZXNzIGxvb3Agd2hpbGUgaW4gSVJRIGNvbnRleHQuCkZpeCBieSBp
bXBvcnRpbmcgY29kZSBmcm9tIG12X3VkY19jb3JlLmMsIGl0cyBzaXN0ZXIgZHJpdmVyLgoKU2ln
bmVkLW9mZi1ieTogSm9ha2ltIFRqZXJubHVuZCA8am9ha2ltLnRqZXJubHVuZEBpbmZpbmVyYS5j
b20+Ci0tLQogZHJpdmVycy91c2IvZ2FkZ2V0L3VkYy9mc2xfdWRjX2NvcmUuYyB8IDU2ICsrKysr
KysrKystLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyks
IDM1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2dhZGdldC91ZGMvZnNs
X3VkY19jb3JlLmMgYi9kcml2ZXJzL3VzYi9nYWRnZXQvdWRjL2ZzbF91ZGNfY29yZS5jCmluZGV4
IDM2NzY5NzE0NGNkYS4uMjU0NmJjMjhmNDJhIDEwMDY0NAotLS0gYS9kcml2ZXJzL3VzYi9nYWRn
ZXQvdWRjL2ZzbF91ZGNfY29yZS5jCisrKyBiL2RyaXZlcnMvdXNiL2dhZGdldC91ZGMvZnNsX3Vk
Y19jb3JlLmMKQEAgLTEyNjYsNyArMTI2Niw3IEBAIHN0YXRpYyB2b2lkIGVwMHN0YWxsKHN0cnVj
dCBmc2xfdWRjICp1ZGMpCiB9CiAKIC8qIFByaW1lIGEgc3RhdHVzIHBoYXNlIGZvciBlcDAgKi8K
LXN0YXRpYyBpbnQgZXAwX3ByaW1lX3N0YXR1cyhzdHJ1Y3QgZnNsX3VkYyAqdWRjLCBpbnQgZGly
ZWN0aW9uKQorc3RhdGljIGludCBlcDBfcHJpbWVfc3RhdHVzKHN0cnVjdCBmc2xfdWRjICp1ZGMs
IGludCBkaXJlY3Rpb24sIHUxNiBzdGF0dXMsIGJvb2wgZW1wdHkpCiB7CiAJc3RydWN0IGZzbF9y
ZXEgKnJlcSA9IHVkYy0+c3RhdHVzX3JlcTsKIAlzdHJ1Y3QgZnNsX2VwICplcDsKQEAgLTEyODEs
OCArMTI4MSwxNCBAQCBzdGF0aWMgaW50IGVwMF9wcmltZV9zdGF0dXMoc3RydWN0IGZzbF91ZGMg
KnVkYywgaW50IGRpcmVjdGlvbikKIAlpZiAodWRjLT5lcDBfc3RhdGUgIT0gREFUQV9TVEFURV9Y
TUlUKQogCQl1ZGMtPmVwMF9zdGF0ZSA9IFdBSVRfRk9SX09VVF9TVEFUVVM7CiAKKwkvKiBmaWxs
IGluIHRoZSByZXFlc3Qgc3RydWN0dXJlICovCisJaWYgKGVtcHR5ID09IGZhbHNlKSB7CisJCSoo
KHUxNiAqKSByZXEtPnJlcS5idWYpID0gY3B1X3RvX2xlMTYoc3RhdHVzKTsKKwkJcmVxLT5yZXEu
bGVuZ3RoID0gMjsKKwl9IGVsc2UKKwkJcmVxLT5yZXEubGVuZ3RoID0gMDsKKwogCXJlcS0+ZXAg
PSBlcDsKLQlyZXEtPnJlcS5sZW5ndGggPSAwOwogCXJlcS0+cmVxLnN0YXR1cyA9IC1FSU5QUk9H
UkVTUzsKIAlyZXEtPnJlcS5hY3R1YWwgPSAwOwogCXJlcS0+cmVxLmNvbXBsZXRlID0gZnNsX25v
b3BfY29tcGxldGU7CkBAIC0xMjkyLDE0ICsxMjk4LDE5IEBAIHN0YXRpYyBpbnQgZXAwX3ByaW1l
X3N0YXR1cyhzdHJ1Y3QgZnNsX3VkYyAqdWRjLCBpbnQgZGlyZWN0aW9uKQogCWlmIChyZXQpCiAJ
CXJldHVybiByZXQ7CiAKKwlyZXQgPSAtRU5PTUVNOwogCWlmIChmc2xfcmVxX3RvX2R0ZChyZXEs
IEdGUF9BVE9NSUMpID09IDApCiAJCWZzbF9xdWV1ZV90ZChlcCwgcmVxKTsKIAllbHNlCi0JCXJl
dHVybiAtRU5PTUVNOworCQlnb3RvIG91dDsKIAogCWxpc3RfYWRkX3RhaWwoJnJlcS0+cXVldWUs
ICZlcC0+cXVldWUpOwogCiAJcmV0dXJuIDA7CitvdXQ6CisJdXNiX2dhZGdldF91bm1hcF9yZXF1
ZXN0KCZ1ZGMtPmdhZGdldCwgJnJlcS0+cmVxLCBlcF9pc19pbihlcCkpOworCisJcmV0dXJuIHJl
dDsKIH0KIAogc3RhdGljIHZvaWQgdWRjX3Jlc2V0X2VwX3F1ZXVlKHN0cnVjdCBmc2xfdWRjICp1
ZGMsIHU4IHBpcGUpCkBAIC0xMzIwLDcgKzEzMzEsNyBAQCBzdGF0aWMgdm9pZCBjaDlzZXRhZGRy
ZXNzKHN0cnVjdCBmc2xfdWRjICp1ZGMsIHUxNiB2YWx1ZSwgdTE2IGluZGV4LCB1MTYgbGVuZ3Ro
KQogCS8qIFVwZGF0ZSB1c2Igc3RhdGUgKi8KIAl1ZGMtPnVzYl9zdGF0ZSA9IFVTQl9TVEFURV9B
RERSRVNTOwogCS8qIFN0YXR1cyBwaGFzZSAqLwotCWlmIChlcDBfcHJpbWVfc3RhdHVzKHVkYywg
RVBfRElSX0lOKSkKKwlpZiAoZXAwX3ByaW1lX3N0YXR1cyh1ZGMsIEVQX0RJUl9JTiwgMCwgdHJ1
ZSkpCiAJCWVwMHN0YWxsKHVkYyk7CiB9CiAKQEAgLTEzMzEsOSArMTM0Miw3IEBAIHN0YXRpYyB2
b2lkIGNoOWdldHN0YXR1cyhzdHJ1Y3QgZnNsX3VkYyAqdWRjLCB1OCByZXF1ZXN0X3R5cGUsIHUx
NiB2YWx1ZSwKIAkJdTE2IGluZGV4LCB1MTYgbGVuZ3RoKQogewogCXUxNiB0bXAgPSAwOwkJLyog
U3RhdHVzLCBjcHUgZW5kaWFuICovCi0Jc3RydWN0IGZzbF9yZXEgKnJlcTsKIAlzdHJ1Y3QgZnNs
X2VwICplcDsKLQlpbnQgcmV0OwogCiAJZXAgPSAmdWRjLT5lcHNbMF07CiAKQEAgLTEzNTgsMzMg
KzEzNjcsMTAgQEAgc3RhdGljIHZvaWQgY2g5Z2V0c3RhdHVzKHN0cnVjdCBmc2xfdWRjICp1ZGMs
IHU4IHJlcXVlc3RfdHlwZSwgdTE2IHZhbHVlLAogCQkJCTw8IFVTQl9FTkRQT0lOVF9IQUxUOwog
CX0KIAotCXVkYy0+ZXAwX2RpciA9IFVTQl9ESVJfSU47Ci0JLyogQm9ycm93IHRoZSBwZXIgZGV2
aWNlIHN0YXR1c19yZXEgKi8KLQlyZXEgPSB1ZGMtPnN0YXR1c19yZXE7Ci0JLyogRmlsbCBpbiB0
aGUgcmVxZXN0IHN0cnVjdHVyZSAqLwotCSooKHUxNiAqKSByZXEtPnJlcS5idWYpID0gY3B1X3Rv
X2xlMTYodG1wKTsKLQotCXJlcS0+ZXAgPSBlcDsKLQlyZXEtPnJlcS5sZW5ndGggPSAyOwotCXJl
cS0+cmVxLnN0YXR1cyA9IC1FSU5QUk9HUkVTUzsKLQlyZXEtPnJlcS5hY3R1YWwgPSAwOwotCXJl
cS0+cmVxLmNvbXBsZXRlID0gZnNsX25vb3BfY29tcGxldGU7Ci0JcmVxLT5kdGRfY291bnQgPSAw
OwotCi0JcmV0ID0gdXNiX2dhZGdldF9tYXBfcmVxdWVzdCgmZXAtPnVkYy0+Z2FkZ2V0LCAmcmVx
LT5yZXEsIGVwX2lzX2luKGVwKSk7Ci0JaWYgKHJldCkKLQkJZ290byBzdGFsbDsKLQotCS8qIHBy
aW1lIHRoZSBkYXRhIHBoYXNlICovCi0JaWYgKChmc2xfcmVxX3RvX2R0ZChyZXEsIEdGUF9BVE9N
SUMpID09IDApKQotCQlmc2xfcXVldWVfdGQoZXAsIHJlcSk7Ci0JZWxzZQkJCS8qIG5vIG1lbSAq
LwotCQlnb3RvIHN0YWxsOwotCi0JbGlzdF9hZGRfdGFpbCgmcmVxLT5xdWV1ZSwgJmVwLT5xdWV1
ZSk7Ci0JdWRjLT5lcDBfc3RhdGUgPSBEQVRBX1NUQVRFX1hNSVQ7Ci0JaWYgKGVwMF9wcmltZV9z
dGF0dXModWRjLCBFUF9ESVJfT1VUKSkKKwlpZiAoZXAwX3ByaW1lX3N0YXR1cyh1ZGMsIEVQX0RJ
Ul9PVVQsIHRtcCwgZmFsc2UpKQogCQllcDBzdGFsbCh1ZGMpOworCWVsc2UKKwkJdWRjLT5lcDBf
c3RhdGUgPSBEQVRBX1NUQVRFX1hNSVQ7CiAKIAlyZXR1cm47CiBzdGFsbDoKQEAgLTE0NjUsNyAr
MTQ1MSw3IEBAIF9fYWNxdWlyZXModWRjLT5sb2NrKQogCQkJYnJlYWs7CiAKIAkJaWYgKHJjID09
IDApIHsKLQkJCWlmIChlcDBfcHJpbWVfc3RhdHVzKHVkYywgRVBfRElSX0lOKSkKKwkJCWlmIChl
cDBfcHJpbWVfc3RhdHVzKHVkYywgRVBfRElSX0lOLCAwLCB0cnVlKSkKIAkJCQllcDBzdGFsbCh1
ZGMpOwogCQl9CiAJCWlmIChwdGMpIHsKQEAgLTE1MDEsNyArMTQ4Nyw3IEBAIF9fYWNxdWlyZXMo
dWRjLT5sb2NrKQogCQkgKiBTZWUgMi4wIFNwZWMgY2hhcHRlciA4LjUuMy4zIGZvciBkZXRhaWwu
CiAJCSAqLwogCQlpZiAodWRjLT5lcDBfc3RhdGUgPT0gREFUQV9TVEFURV9YTUlUKQotCQkJaWYg
KGVwMF9wcmltZV9zdGF0dXModWRjLCBFUF9ESVJfT1VUKSkKKwkJCWlmIChlcDBfcHJpbWVfc3Rh
dHVzKHVkYywgRVBfRElSX09VVCwgMCwgdHJ1ZSkpCiAJCQkJZXAwc3RhbGwodWRjKTsKIAogCX0g
ZWxzZSB7CkBAIC0xNTM3LDcgKzE1MjMsNyBAQCBzdGF0aWMgdm9pZCBlcDBfcmVxX2NvbXBsZXRl
KHN0cnVjdCBmc2xfdWRjICp1ZGMsIHN0cnVjdCBmc2xfZXAgKmVwMCwKIAkJYnJlYWs7CiAJY2Fz
ZSBEQVRBX1NUQVRFX1JFQ1Y6CiAJCS8qIHNlbmQgc3RhdHVzIHBoYXNlICovCi0JCWlmIChlcDBf
cHJpbWVfc3RhdHVzKHVkYywgRVBfRElSX0lOKSkKKwkJaWYgKGVwMF9wcmltZV9zdGF0dXModWRj
LCBFUF9ESVJfSU4sIDAsIHRydWUpKQogCQkJZXAwc3RhbGwodWRjKTsKIAkJYnJlYWs7CiAJY2Fz
ZSBXQUlUX0ZPUl9PVVRfU1RBVFVTOgotLSAKMi4zMi4wCgo=

--_006_2c275adc278477e1e512ea6ecc0c1f4dcc46969dcamelinfineraco_--
