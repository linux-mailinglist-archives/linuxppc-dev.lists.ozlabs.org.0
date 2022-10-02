Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5785F2459
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Oct 2022 19:44:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MgWYB0SN1z3f2q
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Oct 2022 04:43:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=zV3arx5i;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.51; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=zV3arx5i;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120051.outbound.protection.outlook.com [40.107.12.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MgWXJ6bRDz3dqw
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Oct 2022 04:43:12 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bfqDzNZ0IXfQRfZSvsBsf2eLLF8Ikc2VyjB8aC4cFqLlLsICpnoxKLFdifeQzxamXNoYidh6JwHzr6jo2/MbfUQLrw/z0DNqrCUOCekUwEicV/Ermq7oISWAEugWc1TI8wyJTpkfCZkh/iOtMJ2wtpH+6Zft6oMP+TEWaARKB/0echvbloFOBOm1fNEU/TXNDJmYBIFaeDs7rk4cJWBhs1wWhFByoW53zavGeJj5ipFVttMy/e0nn8tgkjoIqR/O2KhPATiGqttiWbJynLUPBfPxz5yz2/7vSepmihggbdH9tse9Bsx467hkH+8LaelrB90wsopI0qJcgttr3pCuEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L7hrc8dK5LJTzGOGRo9etVXE2iw93x/tIBKqG+8y4l4=;
 b=ORTqeHySAdt1liRMP6rMT2X1Fc/x2XThmmkIeQTVsd2+cevgHfPikhZwy2LY4Hy8oaTHjuk0mkhkJhKvy6+xEHXSssjTy7dDhJgfOariMr3Lz75XntRYcXT7qsrbZ7/CAP/U4EHQNdZNwhP+6ZDTzZJUI/n7FVTNNPF+KSxhTlO3cXp38FhQ6eKKIiarVvb6LqJfAbGvc/EpVcDOXAeShnsDBEsS9EEhSDFdEcXXzGK8cm3iNktBWrPg+UyzI0kwcj1Mbeu2Zu4YCeDyNfAXeBYpIhmy9hrVEmwr7DJBNpoaRarhlwwPazVzVwIdI9jtZkujPzeC9aihC5DwWsQF0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L7hrc8dK5LJTzGOGRo9etVXE2iw93x/tIBKqG+8y4l4=;
 b=zV3arx5i8+gaYapqiEZxv1q9/1OWCIpqe+j11yk7MvJsH/vUz1e/pauf9+ZkWpXRET9pWw9pZpM5kNY3xnhABZ6928G18W7ZRb6GFvo0NaJRPPoiuVPAyfstJtxHgsZRtc8Ipy8E8qD0aMvG5nsFZAj+kxhd0tmr+53TUzjCSFozr/i2XWBxKtta/LZsSGrYExUNwk4h7lqPZEUztTBtznovrkgRVCH5K33J1XDJQkbNcZ6xfqXEdfLgfd2Jp4tvNu1jD8Y34Zabpb6fatGJly+Q2tliCrrOMes7zuzuob4rL4/DTQZeNb8sf137zA9/gM6ry9+BVAAOj51GOJLxQA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2155.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:168::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.19; Sun, 2 Oct
 2022 17:42:55 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c854:380d:c901:45af]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c854:380d:c901:45af%5]) with mapi id 15.20.5676.028; Sun, 2 Oct 2022
 17:42:55 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Sathvika Vasireddy <sv@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v4 16/16] objtool/powerpc: Add --mcount specific
 implementation
Thread-Topic: [PATCH v4 16/16] objtool/powerpc: Add --mcount specific
 implementation
Thread-Index: AQHY1kwCJHHLP9AbnU+Fl9hGnZAEkq37YDQA
Date: Sun, 2 Oct 2022 17:42:55 +0000
Message-ID: <e1815dbf-95e2-db2b-efc6-5ab9b5ca1f7e@csgroup.eu>
References: <20221002104240.1316480-1-sv@linux.ibm.com>
 <20221002104240.1316480-17-sv@linux.ibm.com>
In-Reply-To: <20221002104240.1316480-17-sv@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB2155:EE_
x-ms-office365-filtering-correlation-id: 23744698-e136-46f8-42d4-08daa49d89c6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  f/dnCWyRYjRybi7rH6Urrp1ik+ALCRpWuHCHzc+kcAx3nh+kWcKKRMFafmNSJgsDSwvNLiUvP3KRnZC8mKjRdGm8ivglwSVX/a2MYO3gPbSldKbPFh05llp8boTNB+JpSTIv0ipZ9IndMfL8BxrK0Q3nUBBPXPuHmJxMFl4Ug4vtZxYbrpR6ChP3l84hS8zl/uafGibGjDKbelSGhyZebTSwoJdFpmzGy+8h+gZ5Q0CLmSB0bfAjNSERk4h6OunXBT/JiwdO61DwbNncD7vABMs/AhqyFKDJB4gqweZYHsvwv3HHHuce9h6KZOLj0UzfBj880guFBgDWtZlpqQZW11yzPIEXKJ5bJaoBr89+4GwG2ZP6MTML+GNaRBzeUXzTxfikX84bxsQmBTWyIGMj+KONG6q464EkYH0+p+RnZux/IakeifCuWJQNl/PNSGW+dp+Wi7P0sDYqbsxUYFoXUfoogKIwu1IiFeZyOweH04F1FJ0/eannaxCNAwX9PqtPnqqvDkO9SGkXlj1X7/TMdBFFmvv2EaS0XhT0UHFOfoxj+kYDJSQGU0rmAd3p2LRYe78s3eu3MPuGcwQFSxJySTO4ywFC9qELOicgpcoDRe9J7PqDT0au/o80448YTJNuYW2+A77YH+GMKP8aveOmoTd3n6UMgDDG//pYEbpVVNgrmGG623xyrhBsuoIu21VihHfhGKmkNq5tcivPfU6NS2VgBAtVEqCqHyVatnc+gJAFH9yAdTbWvi4m6CVxad+intM1M/bobo0+dGQ3DGtS7HaxLUCOI100KSksrHhpGiYdvXIMBtXLjpD8KQJHFOpidtynpXnLYXcKyPo454wH2g==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(376002)(396003)(39850400004)(366004)(451199015)(316002)(54906003)(7416002)(66446008)(38100700002)(5660300002)(6512007)(8936002)(66556008)(38070700005)(110136005)(26005)(71200400001)(31696002)(76116006)(66476007)(36756003)(41300700001)(2906002)(2616005)(64756008)(91956017)(4326008)(8676002)(44832011)(122000001)(478600001)(6506007)(186003)(86362001)(6486002)(31686004)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?VnRXeGFlUHhQTHJlK2RyWjgrSHd3ck1lL0dTUGZFRFFzclZOdnE4WGUvZCtO?=
 =?utf-8?B?TnVjbXprS2hGMXU3dWVhcDliaVdDd0RFTzBuWlZtcGJWQjRuaDQ0Rkw1bWpk?=
 =?utf-8?B?UFN2TGoxUzc1djdlYmp1WUhNSGQ3SGg5emoyNk1JTTd5MlZ4eFNBekFPV0du?=
 =?utf-8?B?MUlEK0lseHM3bFJnSWR3d1pxakJZWkRlUnVIckMxM2RjNHBBR05lMGE2Rzk1?=
 =?utf-8?B?UEJqR3M2QzYvMEFIUkZZYm9jemVKQXk1UjhPb0l0blA3NzJ1WWxzKzZCUU1W?=
 =?utf-8?B?Q2dISS9heWl4UHJ2bmJtWTI0SWFobnNGNktHWE1BZTZQZWRmSFV4N2VUQStI?=
 =?utf-8?B?WlJubmZyUEdkdzdnV1B3MnpaT212Qm5nbG84RElxUTNRMndydzVSRExDTE1K?=
 =?utf-8?B?Y1c2SFFVV2ZPMjdKTUlLZXEvOVVaN3JzbW14ak1XUDNUcXdGUTdHZmZ6MUpq?=
 =?utf-8?B?S3BFYlg0RjFNeFlMUTcvZEhnM1VQZktIVDQ0Zy84QkNEOTljenhmTFVpamJj?=
 =?utf-8?B?SkcxUjFBc0NzZnpiMmtDY2N0aURHY0F3dk00Wk1abExyRy9aa3RKUjgyVkJG?=
 =?utf-8?B?dFJ6SU1kalJCd0hPUWZjazF2UVZ0VERVRURteEtoWUw2bkRQalhKM0svSUdZ?=
 =?utf-8?B?dUI5WHlFY2lXTGl4azFXTDl5SHN3OWNhZEsvcjN6cURoTy9IV281S0pmendp?=
 =?utf-8?B?Z09OL1ZvTTdRZ2RIMVZmdHlLM3lrODRpN0hQaE1JK09YakpiNmRBQU0wQ1hG?=
 =?utf-8?B?Z0FsV1o2STBFVHdCRGxydDJHSVpoenEzenJlYkNoTTdZYnNjckQyZW5NTVZF?=
 =?utf-8?B?bk5FRFNKWWI4SnE0bmFjRDVOOUl4Qy8zTkFVampENENuSjh3a3RvYzRGMVZu?=
 =?utf-8?B?VXNjUWo2TXpSaDJMZ0RnWFJlNmJkSUFRaXRENUxSK2FGNTZWWnJhRnpPYnRl?=
 =?utf-8?B?K1FLcGNFRmF2VGlVSjlQTHlyV0JDeDJTTUYxbmRneWx3YTJaSnZJMXFTT1V1?=
 =?utf-8?B?ak41cDJ5OWtmK0lYQ3QyLy9TZE9nbzRkSThROHZGRmFUMlkyVlc1aFgvVlFH?=
 =?utf-8?B?MVczSk93RzIxeDVuelRZWWZoaHZrY2JUblM1RnJXZk9JVkFxU21Da1RXdjAx?=
 =?utf-8?B?N2JEMFEza2kzcFkzYWtOeWxyRU5IcXQxV0JYMkZUdzliQk9tV3ErWWdDcDdO?=
 =?utf-8?B?R2MwT0hsV2pmcVNFS1BVTXo3ekJnYjhKWW5BeUtvcXQzYlpsbjdDaitYaDJm?=
 =?utf-8?B?WTVpaTZFaktESmFCa1RKTlVYUHpuNEhUVlUxTVNYZkxxbEJFZ0UxM0pnQ2VP?=
 =?utf-8?B?ZSt1VE5FU2tnM25nU2lLdE9uRHVCVWZKdGx1T29aZVBlNmZsOEY1MkY1YnY5?=
 =?utf-8?B?K2VoVmpFbUF0Q1B1VExEemxySDg2ZFlwM2hJNU4xOUhzZEhCM0pRR3czd3M2?=
 =?utf-8?B?V0VFMnFkNHVBK090d28yWUhzTFR4ditkR25hS29XU2dWMDJ1RVVQcTdKalBy?=
 =?utf-8?B?Q01LeFJOVmZ6b3ovVGVSZURTb3BTWm9XOFNTdi9tanRyRGJBVklpY29ZSWw4?=
 =?utf-8?B?NTRlNUNMOFJFanN1SC9aNlF0cEVOeDJQdWFYTzJaR21ocXF6UHZBbG9jaEd5?=
 =?utf-8?B?aERjdGtzbWNHRCt3QUpzelRWRVBRYnJDWmZXRVQvTCtZMm1QZVRWNFRwK2R1?=
 =?utf-8?B?SWZrV3J1NDZMcnE4TTlHaTRFUDExRG1xdFdQY3NZZkNDNE4vWkUxNHZJRGh2?=
 =?utf-8?B?QlR0V1ZIN0p3eDVuUnB4ZHV0VDN4VnhFUms1WDNCNUh2UDJVYjIyMW9oeTFE?=
 =?utf-8?B?K3JsUFI2eU5ZK0l1emlzbE1HY0ttcDQyTFp2SmpJbVAxbUZLak1weEZUT0ls?=
 =?utf-8?B?U0Z5TkV0bUtuOFhBd1gwdUVLTHlCcXgya1hIWFVvdjdrN1M3cDlyY3hSZWxF?=
 =?utf-8?B?WUpMUmVBUEh1ek50U1RSdXRlMVNmc1JTNjlBdGIwMDZOR0I3d1dhODJ1YlBU?=
 =?utf-8?B?NGpSNDZtazcrQVJMVG5CVHpFakZObEE1L0xqSGRXNEtXUE5kemE2THQ0d2Vl?=
 =?utf-8?B?TG1vcTJ6bUVoaWtMb1F1S1lvWHZ2cjdiMjlUTjVpd0tmRldFdG1IUjhBb0F0?=
 =?utf-8?B?V0xKMDBUOFdlM1hTakVlL01nZkYrMWs5TGtha1ZHV2VVYkZXZzdlcnBpRG1H?=
 =?utf-8?Q?hNSZrjsrEAD6BBCJ4RQp3LY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7E9A8C6BA07E6644976125F16A9D71CC@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 23744698-e136-46f8-42d4-08daa49d89c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2022 17:42:55.4326
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wlFg2SCxLMte2ER1xgyS5fx34fY6nelPFWP0HDRSppwC+357jmlYS5+kpyFSEai5WWdgXpaIbwYC6bRrT3TCuPhid7DXHXlpr3/aJrMsE10=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2155
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

DQoNCkxlIDAyLzEwLzIwMjIgw6AgMTI6NDIsIFNhdGh2aWthIFZhc2lyZWRkeSBhIMOpY3JpdMKg
Og0KPiBUaGlzIHBhdGNoIGVuYWJsZXMgb2JqdG9vbCAtLW1jb3VudCBvbiBwb3dlcnBjLCBhbmQg
YWRkcyBpbXBsZW1lbnRhdGlvbg0KPiBzcGVjaWZpYyB0byBwb3dlcnBjLg0KPiANCj4gU2lnbmVk
LW9mZi1ieTogU2F0aHZpa2EgVmFzaXJlZGR5IDxzdkBsaW51eC5pYm0uY29tPg0KDQpSZXZpZXdl
ZC1ieTogQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1Pg0KDQo+
IC0tLQ0KPiAgIGFyY2gvcG93ZXJwYy9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgICB8
ICAxICsNCj4gICB0b29scy9vYmp0b29sL2FyY2gvcG93ZXJwYy9kZWNvZGUuYyAgICAgICAgICAg
fCAxNiArKysrKysrKysrKysrKysrDQo+ICAgdG9vbHMvb2JqdG9vbC9hcmNoL3Bvd2VycGMvaW5j
bHVkZS9hcmNoL2VsZi5oIHwgIDIgKysNCj4gICAzIGZpbGVzIGNoYW5nZWQsIDE5IGluc2VydGlv
bnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvS2NvbmZpZyBiL2FyY2gvcG93
ZXJwYy9LY29uZmlnDQo+IGluZGV4IGRjMDVjZDIzYzIzMy4uNmJlMmU2OGZhOWViIDEwMDY0NA0K
PiAtLS0gYS9hcmNoL3Bvd2VycGMvS2NvbmZpZw0KPiArKysgYi9hcmNoL3Bvd2VycGMvS2NvbmZp
Zw0KPiBAQCAtMjM4LDYgKzIzOCw3IEBAIGNvbmZpZyBQUEMNCj4gICAJc2VsZWN0IEhBVkVfTk1J
CQkJCWlmIFBFUkZfRVZFTlRTIHx8IChQUEM2NCAmJiBQUENfQk9PSzNTKQ0KPiAgIAlzZWxlY3Qg
SEFWRV9PUFRQUk9CRVMNCj4gICAJc2VsZWN0IEhBVkVfT0JKVE9PTAkJCWlmIFBQQzMyIHx8IE1Q
Uk9GSUxFX0tFUk5FTA0KPiArCXNlbGVjdCBIQVZFX09CSlRPT0xfTUNPVU5UCQlpZiBIQVZFX09C
SlRPT0wNCj4gICAJc2VsZWN0IEhBVkVfUEVSRl9FVkVOVFMNCj4gICAJc2VsZWN0IEhBVkVfUEVS
Rl9FVkVOVFNfTk1JCQlpZiBQUEM2NA0KPiAgIAlzZWxlY3QgSEFWRV9QRVJGX1JFR1MNCj4gZGlm
ZiAtLWdpdCBhL3Rvb2xzL29ianRvb2wvYXJjaC9wb3dlcnBjL2RlY29kZS5jIGIvdG9vbHMvb2Jq
dG9vbC9hcmNoL3Bvd2VycGMvZGVjb2RlLmMNCj4gaW5kZXggZGNkMDk3NWNhZDZiLi4wMWNhZGU5
OGI0OWUgMTAwNjQ0DQo+IC0tLSBhL3Rvb2xzL29ianRvb2wvYXJjaC9wb3dlcnBjL2RlY29kZS5j
DQo+ICsrKyBiL3Rvb2xzL29ianRvb2wvYXJjaC9wb3dlcnBjL2RlY29kZS5jDQo+IEBAIC05LDYg
KzksMTEgQEANCj4gICAjaW5jbHVkZSA8b2JqdG9vbC9idWlsdGluLmg+DQo+ICAgI2luY2x1ZGUg
PG9ianRvb2wvZW5kaWFubmVzcy5oPg0KPiAgIA0KPiAraW50IGFyY2hfZnRyYWNlX21hdGNoKGNo
YXIgKm5hbWUpDQo+ICt7DQo+ICsJcmV0dXJuICFzdHJjbXAobmFtZSwgIl9tY291bnQiKTsNCj4g
K30NCj4gKw0KPiAgIHVuc2lnbmVkIGxvbmcgYXJjaF9kZXN0X3JlbG9jX29mZnNldChpbnQgYWRk
ZW5kKQ0KPiAgIHsNCj4gICAJcmV0dXJuIGFkZGVuZDsNCj4gQEAgLTUwLDYgKzU1LDE3IEBAIGlu
dCBhcmNoX2RlY29kZV9pbnN0cnVjdGlvbihzdHJ1Y3Qgb2JqdG9vbF9maWxlICpmaWxlLCBjb25z
dCBzdHJ1Y3Qgc2VjdGlvbiAqc2VjDQo+ICAgCXR5cCA9IElOU05fT1RIRVI7DQo+ICAgCWltbSA9
IDA7DQo+ICAgDQo+ICsJc3dpdGNoIChvcGNvZGUpIHsNCj4gKwljYXNlIDE4OiAvKiBiW2xdW2Fd
ICovDQo+ICsJCWlmICgoaW5zbiAmIDMpID09IDEpIC8qIGJsICovDQo+ICsJCQl0eXAgPSBJTlNO
X0NBTEw7DQo+ICsNCj4gKwkJaW1tID0gaW5zbiAmIDB4M2ZmZmZmYzsNCj4gKwkJaWYgKGltbSAm
IDB4MjAwMDAwMCkNCj4gKwkJCWltbSAtPSAweDQwMDAwMDA7DQo+ICsJCWJyZWFrOw0KPiArCX0N
Cj4gKw0KPiAgIAlpZiAob3Bjb2RlID09IDEpDQo+ICAgCQkqbGVuID0gODsNCj4gICAJZWxzZQ0K
PiBkaWZmIC0tZ2l0IGEvdG9vbHMvb2JqdG9vbC9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hcmNoL2Vs
Zi5oIGIvdG9vbHMvb2JqdG9vbC9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hcmNoL2VsZi5oDQo+IGlu
ZGV4IDNjOGViYjdkMmE2Yi4uNzNmOWFlMTcyZmU1IDEwMDY0NA0KPiAtLS0gYS90b29scy9vYmp0
b29sL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FyY2gvZWxmLmgNCj4gKysrIGIvdG9vbHMvb2JqdG9v
bC9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hcmNoL2VsZi5oDQo+IEBAIC00LDUgKzQsNyBAQA0KPiAg
ICNkZWZpbmUgX09CSlRPT0xfQVJDSF9FTEYNCj4gICANCj4gICAjZGVmaW5lIFJfTk9ORSBSX1BQ
Q19OT05FDQo+ICsjZGVmaW5lIFJfQUJTNjQgUl9QUEM2NF9BRERSNjQNCj4gKyNkZWZpbmUgUl9B
QlMzMiBSX1BQQ19BRERSMzINCj4gICANCj4gICAjZW5kaWYgLyogX09CSlRPT0xfQVJDSF9FTEYg
Ki8=
