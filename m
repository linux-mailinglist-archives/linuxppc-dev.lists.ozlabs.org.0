Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C34615F9D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Nov 2022 10:24:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2M0Y0Ld0z3cQk
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Nov 2022 20:24:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=AIVNDo32;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.42; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=AIVNDo32;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90042.outbound.protection.outlook.com [40.107.9.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2LzY6yHsz2ywV
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Nov 2022 20:23:35 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TcGWJAuO6aYlzLtiHou7QCkidmqQ6POSNW1V94yms5mxsIFXpPr29a27Zz59+XgPoOGqVIhXzf7N/Ck5MkPG/Rtj5SalmjXQHsWLVoCRPY/Yxyqv5oJYjs7m8hejIMys4lJFLhT4bHTjrak8n5bWpHajd9M+5HkrvH8/8rvyAevlInK/eJZfIuGxtsGgzZBd2YJCzQsgkXR3TqIuSZe1x8zCtfmZqas0gSOeRkNl3aPVA8NJl43P829zNXNHDkF4hNkhplOHluO8/73GnqyYvF601F5xmnEo2fG0SyIyVKa0XiMPUg9jSYNltpsNsm8P9M0d8BpzH0GDVPmT1mYaMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i0FQOdD6pzhZRJJjeMcmxGjGInJpYf9PMFoxsMLl5A8=;
 b=Bm0gYHpawDxmrlUY8/U7oVnib6Hs6JlSL5p573D6SapJpHzgW0RIMAEiNnmkJRN/XHCW6Sg8neFpVwdq0SUMZsHN8PvPAAS0jpBoEQbJdavnqpD13FMKI5BtIiPWwAi5+lFz7LdCUaXOaxeDatWzBuuIRQT92hS2wTPeL4OX+6z3dOr/tqNbHwt2kc+GGWYP/KR1SFlIrvGG5y6yztvRmWUDZemHWh5vcOBSiGA3wyp79Y2XqfRPiZSDCMmKHeptBsSuZx8FMXhonOhwADo4z76vp4LMSp3zzBTvbd070CfT2zgeo/6yJ5PjNg3XpkBAuC3agC62NSychK5/G+v/lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i0FQOdD6pzhZRJJjeMcmxGjGInJpYf9PMFoxsMLl5A8=;
 b=AIVNDo322+rUj4mpjxlylsgP1APJky7LOrv71do5J/gKitdFT3lOzKTzwbSpgsuOfKiKwf58QF45gphNpRiAwofe9DK0xLmPILxGp5ZqsFlEzK7MJNe3o9oM7ye3kh7NsvDeo6re5RSs/UM6t3hqIGtrjwORyxz0T9eLb81ALE+z2WwxEc8WPvMHtWxhhFt3Jp+cbe+6hFemSEAl+pir35NfsgeCfABzM48Fki8CdXTNimVIJ2+g1TvmNxCU6iJRwxryLB90T+zLi+A8WV1ed636ygnnmmbTEMoxyR2aN9uOc9o+eUI5xn5j7IdyEvzcH0CtPLQkRfgBfFaKW/1Ofg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB1831.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20; Wed, 2 Nov
 2022 09:23:15 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8bbc:32cb:956d:88e8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8bbc:32cb:956d:88e8%2]) with mapi id 15.20.5769.021; Wed, 2 Nov 2022
 09:23:15 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Russell Currey <ruscur@russell.cc>, KaiLong Wang <wangkailong@jari.cn>,
	"mpe@ellerman.id.au" <mpe@ellerman.id.au>, "npiggin@gmail.com"
	<npiggin@gmail.com>, "farosas@linux.ibm.com" <farosas@linux.ibm.com>,
	"mirq-linux@rere.qmqm.pl" <mirq-linux@rere.qmqm.pl>,
	"dmitry.osipenko@collabora.com" <dmitry.osipenko@collabora.com>,
	"kda@linux-powerpc.org" <kda@linux-powerpc.org>,
	"naveen.n.rao@linux.vnet.ibm.com" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH] powerpc: replace ternary operator with min()
Thread-Topic: [PATCH] powerpc: replace ternary operator with min()
Thread-Index: AQHY52HHvWY47//pwUa4jIUSvW9QJa4rarMA
Date: Wed, 2 Nov 2022 09:23:15 +0000
Message-ID: <b9b0aebb-a27e-826f-a3d1-954fa3421747@csgroup.eu>
References: <4ebda26c.346.18404df6852.Coremail.wangkailong@jari.cn>
 <6426e8cf8d3bb2fff1403038ef627548f07cef32.camel@russell.cc>
In-Reply-To: <6426e8cf8d3bb2fff1403038ef627548f07cef32.camel@russell.cc>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB1831:EE_
x-ms-office365-filtering-correlation-id: 330b5e36-ac12-4969-1a2d-08dabcb3def0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  oE8qcddaoSOXts3IDxJtRsh5XXLc9XnWgq7ReR/5DEu4ZyyJwngx5amZnUFNdHb8sHuFMy/q3LOnZBXXRNhA/oErgii5cqpLp8FMEr9WLlDTxbXvm3Cdihlv6Y8Pmw2vrwWn2A9/z8/bV5Hvzi+cygGLIDscWgg/U0UcYoSv6zN19W1uTNdE5AXonJ5TMJ0QhTY/ernKqG2ayVSvucO+nZ55ecaiaLH1jvC8NJOGOuw+LYrwdZknXwPzMqv2nob8KJw4OQbshACfJMkn05QZNNp6TYWtKVdYoAnoOUkpCXO0mjeav+qrWqsGXc3lgsjpXZgaaIANt2V0+fDd/u+6m0wUirNtSyevI9hAzg8zepxicXidlbZbCVEUz2pAmeUnR9Bv8WsdNDJY7tFnKpaoPPseFmR+yFN9+/AQVrFGbWR3LSscijeQsQnUPoaUaq7uRAnoBZrzLUdzbR04Extq0zihKESFikoTgvBfDEFLqQyn76vhqHxjppNc1GJwP0uYJUH3QvTR1Fk9Mw5g3x6Nsy7dPpdNEsxR6tPjk0EJYSRb1qeiioXzlvAudYaUnll+UDkGum4WyH1VJhia6wUYR6L4vtqiTKa2BbgZQGP8MQZVvtQkREqCoZ+6O/XzkuB/rQb2EegXtR6gnoEp0fEACXwoVD5Q72bCij2DpF+6o60sOl3T9UPe7H6A5eNlofDLbKkoaXuhADR7ukRwMJr4YtsOPQFns65a9xmqK3CqKpOAfcoAxGeHyNvFv/xC2mkz8Maqg5kDHGbCPc1dAam+SKu6GcvAT9B7H8EVfXUeSiLKgojfRVR/Q2zAI+30jMdjTeDOh6yyQnf+bIXA34ja5TiQoYIfx8n8s/ziC/7C568=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(346002)(366004)(396003)(39850400004)(451199015)(31686004)(36756003)(41300700001)(966005)(4001150100001)(110136005)(8936002)(44832011)(38070700005)(83380400001)(8676002)(4326008)(66446008)(76116006)(66476007)(64756008)(478600001)(66556008)(66946007)(2906002)(316002)(5660300002)(54906003)(71200400001)(91956017)(7416002)(6512007)(186003)(26005)(66574015)(6486002)(2616005)(122000001)(38100700002)(31696002)(86362001)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?RFBsWTJ4SHNMNU1IUzgwVEdCb05JVGtkS1RLNkVEOGxTaTZ4dkVpN3gvMzE0?=
 =?utf-8?B?L3RJaHJjc1BjQzFWNE9McTJ2a2UwOFRuTnVDRXBsVzA5bEplbFNHaytQK1Rj?=
 =?utf-8?B?UXJ6bFp0UnhtRWR4ditaQk9kZVkzWjljQ0krVWZNRCtINjI2NXBYQjJNY01B?=
 =?utf-8?B?YmpjSWhsSmo4TSsxY0tGNjRGNDZwVnI5Z20wanhydW5pcld4SVpIK3VwbXY3?=
 =?utf-8?B?bHBzRFpxQ0Z5VGpsd2ZWb1VJemJrRzIvOTlQbnc4Q1ZrUGx5dDlwSVlBSExH?=
 =?utf-8?B?cTlRY2lINmpQMmF4MnU0bWlrM2VHWSswbHk4OG1BUzl5cndxNkpGOUJxRDR3?=
 =?utf-8?B?dFNwRTREdmJneW91TzBXYzBWUDZZTnd1SWYxUHNIY1lBWC9LV2JZLzZVNkJD?=
 =?utf-8?B?eXBucWQrSkhrSElDdHlQbk0zMHNpanhZcDgwUWI1NHBHK0txbzQxRGpjdVlz?=
 =?utf-8?B?UDBLUEt2eVViOFo4aDIvS0RoeVBKbVhSWXU4N3kvdTRoUjQyczlSZlpPN0Vr?=
 =?utf-8?B?c2llR0t0OExTSEJVSVg2MjUwckVzZEkyMFdlanE4Y2tjc3BTakVTT1FxM1dz?=
 =?utf-8?B?clBJU2l4TlFiSjM3WjJQRG15aTdSMDZLZ2R1UHZIRzBQUzh4Zm5NMDNkNWZB?=
 =?utf-8?B?RzBhTkpoR29WcUtva3NPaHpqdjloU0ZmNU9PeWg5L0o5ZWhDMENPV0svYTZ6?=
 =?utf-8?B?V0FWVythY01lalBsT2VNTEVwN3lLZmtkai91VFNMMmtqSEtEUGFoVHIrdmhW?=
 =?utf-8?B?ZWkwOWU4R3FvdjFTOGNNTTVrMHg0MTJyVUhiMGNxRW5Bbzlsa1owQ2Y0Qmtm?=
 =?utf-8?B?UlF6aEh2YU81a0NVRUFJS2xyeDZ1VHNXMUNmR25DQytJbDB1UGJoM0ZJYXhJ?=
 =?utf-8?B?ejAwKzUzRDV1eDNOTkJvSE42Wm5WcEFURG9ubnErK3RmQmVWdFhIa0RXZWk2?=
 =?utf-8?B?WGRkcGpPajZrSEFSR2FKSzYwOWJPS0FNbzZ2NC9GdzgxK29PUWdQLzJwR29D?=
 =?utf-8?B?dlJKbXh4UllrTisrd3BzR1lzOHdWditnSytocjRjc2VEWmllM3R6QjJRQWQx?=
 =?utf-8?B?OUt2dkRCUXJVSjloNWlrVGtnMzVHK1pJNmNXN3JMS2NUcHdaaFBMWW82QkRR?=
 =?utf-8?B?SjZFc2Z6WVRLVTNTd0I2SmorUitadFVDWDdZQkRlV1B1c09oTndINTN5SnFQ?=
 =?utf-8?B?WXNHSzdiODJpOEl4b25vQ0o4M3IzN1lFdkxjYTRPTTE1SUZwMGpYbXRNMUpU?=
 =?utf-8?B?ZHZQajVZTTZnQjQ3UDUxeFkwQlQzVnpTeGNHOW5oWTJFd0N5WHR0cGJScklB?=
 =?utf-8?B?Mk1IUTNjbVA2bk1rbTJ3TEF3US9iRWg3U0J5SitjV1NqTHRaL3FkdGR5ZWhp?=
 =?utf-8?B?U1FZaUowdzZDT0FkT0JRT3VkdG5kSzBxNndJWlNYckxRMUxidVlGQWYwQ1NY?=
 =?utf-8?B?TUZmblluV1lmcnhBcitBc2k3akVLdElHeTNRczZTcWpVek1oMjNDbEJVNS9X?=
 =?utf-8?B?cXNoU1VJb2NZTVUxSzU3UUVlbVR3dUZJZHdzWDdpNlU4dHRnWXhnQXJhT0pR?=
 =?utf-8?B?c3c1c25QOTVzSHlhSDVPUWVMWGdlSmpTVW8xa0FFeDhSNnpNcWlFNk9qL2Zy?=
 =?utf-8?B?RkhtRlEzU24zeUFTTml5d01neEwyTWc1Vm5CSDlBNmxSWHVZVDR4UXZrUXU3?=
 =?utf-8?B?ZmJxanJUZzVNeTdTODA1cEJZR1dsNTVwRU9YOWhZVjd5RktQYzcrY2JGeXNw?=
 =?utf-8?B?V2lmNkhZdWU0c0xJVTUzSHUwUkNzSEMxdklObjA4RVlFeVA3QkdkNTZsTGVU?=
 =?utf-8?B?UGZ6THFlcHN1TTdKUHZkOW1PRGhJcVdZZld2UTJOc0pPL3ozL1BidGxmeStL?=
 =?utf-8?B?NlJ0UzdqZGFGbXhpd09lbzVzcTRudHgxZ2FBTnlIVFppWG5JY2FYRFg4YUwy?=
 =?utf-8?B?YkdBRGh1QThBNTBrR2NpKzI5Mmo5eGUvWjFPNGd5UnBnWkI2VEkrTy8vRVda?=
 =?utf-8?B?RThuWGErUU81cHRoV0lhUm1kbXMzSG8yaC9mZFJpeFVGUEhxM28zWkFSdEVz?=
 =?utf-8?B?ZWdMbTVXU1ZFZWdJdUYzSUNvaGxFc2JRM05IcDkyWDdza3pwTzZycWs0aVRP?=
 =?utf-8?B?TFNuY0lqbkVZOFNoL1ZDUlJxMHpVekZ0bmpFaUZ5Rm9TMUZJR0J4Vzl5dHZ4?=
 =?utf-8?Q?pnY6ElLFg/vX1gM2VNwS+kQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B250F710F9D6DC44B10A7CAE1A413D77@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 330b5e36-ac12-4969-1a2d-08dabcb3def0
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2022 09:23:15.1479
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z0FBo2JrdjerUofoYbVgpF76xTSirLyd+wTvnNhxuuL+92tN6+TVTUCShOTke+XQmcNkde/9MANdITdUN9CxDhj7ORU8fCCyqvLIFcAEac0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB1831
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI0LzEwLzIwMjIgw6AgMDY6MzMsIFJ1c3NlbGwgQ3VycmV5IGEgw6ljcml0wqA6DQo+
IE9uIFN1biwgMjAyMi0xMC0yMyBhdCAyMDo0NCArMDgwMCwgS2FpTG9uZyBXYW5nIHdyb3RlOg0K
Pj4gRml4IHRoZSBmb2xsb3dpbmcgY29jY2ljaGVjayB3YXJuaW5nOg0KPj4NCj4+IGFyY2gvcG93
ZXJwYy94bW9uL3htb24uYzoyOTg3OiBXQVJOSU5HIG9wcG9ydHVuaXR5IGZvciBtaW4oKQ0KPj4g
YXJjaC9wb3dlcnBjL3htb24veG1vbi5jOjI1ODM6IFdBUk5JTkcgb3Bwb3J0dW5pdHkgZm9yIG1p
bigpDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogS2FpTG9uZyBXYW5nIDx3YW5na2FpbG9uZ0BqYXJp
LmNuPg0KPiANCj4gSGVsbG8sDQo+IA0KPiBUaGlzIGZhaWxzIHRvIGNvbXBpbGUgb24gc29tZSBw
bGF0Zm9ybXMvY29tcGlsZXJzIHNpbmNlIG4gaXMgYSBsb25nIGFuZA0KPiAxNiBpcyBhbiBpbnQs
IGV4cGFuZGluZyB0bzoNCj4gDQo+IHIgPSBfX2J1aWx0aW5fY2hvb3NlX2V4cHIoDQo+IAkoKCEh
KHNpemVvZigodHlwZW9mKG4pICopMSA9PSAodHlwZW9mKDE2KSAqKTEpKSkgJiYNCj4gCSAoKHNp
emVvZihpbnQpID09DQo+IAkgICBzaXplb2YoKig4ID8gKCh2b2lkICopKChsb25nKShuKSowbCkp
IDogKGludCAqKTgpKSkgJiYNCj4gCSAgKHNpemVvZihpbnQpID09DQo+IAkgICBzaXplb2YoKig4
ID8gKCh2b2lkICopKChsb25nKSgxNikgKiAwbCkpIDoNCj4gCQkJKGludCAqKTgpKSkpKSwNCj4g
CSgobikgPCAoMTYpID8gKG4pIDogKDE2KSksICh7DQo+IAkJdHlwZW9mKG4pIF9fVU5JUVVFX0lE
X19feDAgPSAobik7DQo+IAkJdHlwZW9mKDE2KSBfX1VOSVFVRV9JRF9fX3kxID0gKDE2KTsNCj4g
CQkoKF9fVU5JUVVFX0lEX19feDApIDwgKF9fVU5JUVVFX0lEX19feTEpID8NCj4gCQkJIChfX1VO
SVFVRV9JRF9fX3gwKSA6DQo+IAkJCSAoX19VTklRVUVfSURfX195MSkpOw0KPiAJfSkpOw0KPiAN
Cj4gSGVyZSdzIHRoZSBmdWxsIGJ1aWxkIGZhaWx1cmUgYXMgZm91bmQgYnkgc25vd3BhdGNoOg0K
PiBodHRwczovL2dpdGh1Yi5jb20vcnVzY3VyL2xpbnV4LWNpL2FjdGlvbnMvcnVucy8zMzA4ODgw
NTYyL2pvYnMvNTQ2MTU3OTA0OCNzdGVwOjQ6ODkNCj4gDQo+IFlvdSBzaG91bGQgdXNlIG1pbl90
KGxvbmcsIG4sIDE2KSBpbnN0ZWFkLg0KDQpXb3VsZG4ndCBpdCB3b3JrIHdpdGggMTZMIGluc3Rl
YWQgb2YgMTYgOg0KDQoJbWluKG4sIDE2TCkNCg0KQ2hyaXN0b3BoZQ0KDQo+IA0KPiAtIFJ1c3Nl
bGwNCj4gDQo+PiAtLS0NCj4+ICDCoGFyY2gvcG93ZXJwYy94bW9uL3htb24uYyB8IDQgKystLQ0K
Pj4gIMKgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4+
DQo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL3htb24veG1vbi5jIGIvYXJjaC9wb3dlcnBj
L3htb24veG1vbi5jDQo+PiBpbmRleCBmNTFjODgyYmY5MDIuLmE3NzUxY2QyY2M5ZCAxMDA2NDQN
Cj4+IC0tLSBhL2FyY2gvcG93ZXJwYy94bW9uL3htb24uYw0KPj4gKysrIGIvYXJjaC9wb3dlcnBj
L3htb24veG1vbi5jDQo+PiBAQCAtMjU4MCw3ICsyNTgwLDcgQEAgc3RhdGljIHZvaWQgeG1vbl9y
YXdkdW1wICh1bnNpZ25lZCBsb25nIGFkcnMsDQo+PiBsb25nIG5kdW1wKQ0KPj4gIMKgwqDCoMKg
wqDCoMKgwqB1bnNpZ25lZCBjaGFyIHRlbXBbMTZdOw0KPj4gICANCj4+ICDCoMKgwqDCoMKgwqDC
oMKgZm9yIChuID0gbmR1bXA7IG4gPiAwOykgew0KPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoHIgPSBuIDwgMTY/IG46IDE2Ow0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoHIgPSBtaW4obiwgMTYpOw0KPj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
bnIgPSBtcmVhZChhZHJzLCB0ZW1wLCByKTsNCj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoGFkcnMgKz0gbnI7DQo+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBm
b3IgKG0gPSAwOyBtIDwgcjsgKyttKSB7DQo+PiBAQCAtMjk4NCw3ICsyOTg0LDcgQEAgcHJkdW1w
KHVuc2lnbmVkIGxvbmcgYWRycywgbG9uZyBuZHVtcCkNCj4+ICDCoMKgwqDCoMKgwqDCoMKgZm9y
IChuID0gbmR1bXA7IG4gPiAwOykgew0KPj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgcHJpbnRmKFJFRywgYWRycyk7DQo+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqBwdXRjaGFyKCcgJyk7DQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgciA9IG4g
PCAxNj8gbjogMTY7DQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgciA9IG1pbihu
LCAxNik7DQo+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBuciA9IG1yZWFkKGFk
cnMsIHRlbXAsIHIpOw0KPj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgYWRycyAr
PSBucjsNCj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGZvciAobSA9IDA7IG0g
PCByOyArK20pIHsNCj4g
