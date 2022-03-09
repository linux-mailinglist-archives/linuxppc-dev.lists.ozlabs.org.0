Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D6F4D2DBC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Mar 2022 12:14:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KD8jh10wWz3bcg
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Mar 2022 22:14:48 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KD8j82wDTz2yYc
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Mar 2022 22:14:17 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b9MYlQ6REbb/cr7XG+ry6MVPj5zqZVC/c6Bu7k+P1KACyE5l1GPzMBJFx5rCkW1AIEkSOsMq3pvA2YyyIT+ASDajy5vzJyO799RSceVDDPAgeLTb4v50n4KRuS62uET7nBnpprPJA+DGDXwyMHaTveyWtKJmjYuAsjEO9ZTUpty3b+SwDsSNG11MN3B86CdDAxXks4sqvrnfI0l6/75WgREeRnWnylpTwZwcnoY/JwuFL7diOzryV7hN/Um+XSc/OeyDVSi/Aeb1mXXo3wXe1BrNiWKk2MhJHscFV5NOHnORGV8u0PJtCRyeRI5wybT6yGxwCfR89fWi0CO+4rOjag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jj8qNfekvPK6dmYDLq2FfEGZuWn7E6IvFx3lS+dlDJ0=;
 b=P7GLEB8q4e2onNlAwinTnaDonG43ILzOVzKhgwRACPEkA22wNx9a0f6J9SaoVSFnbaTogG7JB+/daGbv06swKxOUsVzjn/5XF4pmS2cXKNVgPXk7BZMxcgpYJ3HTbjyhkMrp3yQIwvzkjjEv65Vhr1bzIgPxsmu/1dpx8Xj3i70rGGps1pwfnCB3klX4/ggQWjTSdrGXjlMXnwdb7eYKYwvMS1+8jgsajDnVmz/Rrn+6IztKbGOcOFE4SOXX9DQtLatU0KJH+zJf30ifH9apiNee3CkmmGDLmSHIs4tRG7SCp9nW4k3UyWnQ/BXwtkOYkWqYSgxQ8cid2Wahophdrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB3166.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Wed, 9 Mar
 2022 11:13:53 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d%4]) with mapi id 15.20.5038.029; Wed, 9 Mar 2022
 11:13:53 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Hangyu Hua <hbh25y@gmail.com>,
 "benh@kernel.crashing.org" <benh@kernel.crashing.org>, "paulus@samba.org"
 <paulus@samba.org>, "peng.hao2@zte.com.cn" <peng.hao2@zte.com.cn>,
 "wen.yang99@zte.com.cn" <wen.yang99@zte.com.cn>
Subject: Re: [PATCH] powerpc: 8xx: fix a return value error in mpc8xx_pic_init
Thread-Topic: [PATCH] powerpc: 8xx: fix a return value error in mpc8xx_pic_init
Thread-Index: AQHYKINXBJ1zcwXxM0+BDeqd/qE4Oay2eWSAgABCK4CAADlYgIAAB5CA
Date: Wed, 9 Mar 2022 11:13:53 +0000
Message-ID: <867e5b54-5990-578e-bfae-b638efce2a8a@csgroup.eu>
References: <20220223070223.26845-1-hbh25y@gmail.com>
 <87o82fn6yw.fsf@mpe.ellerman.id.au>
 <87b40493-7630-f714-27f4-90ad2a5a7c12@csgroup.eu>
 <87ilsnmmi4.fsf@mpe.ellerman.id.au>
In-Reply-To: <87ilsnmmi4.fsf@mpe.ellerman.id.au>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0c892d5c-7022-4d3e-3662-08da01bde544
x-ms-traffictypediagnostic: PAZP264MB3166:EE_
x-microsoft-antispam-prvs: <PAZP264MB3166346E627B510674E3EC64ED0A9@PAZP264MB3166.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xS6Gks+uR59TvJyC1HrqKRYUfTrjb1egVVCLAkEkQHKpHQt4PKz4lDdoITFAaQPIa2q+oPqkkGt50hhJSr9k6v/hbkkHYOoQwjvtZgXXRtPWvT9TAGD4Yl6uEb5yzp0Nh3aqCQuJe217njDJ6uKzvMKZSTh1mNX3ggvdhfu7c/+LneuM+r7fMq68j97++pOpYG5tuX41V9TXWGccmofMfSCrIghwP7bj3IU0tA/WnYiMcwanN59aIQH8hYEnUssRwtkBRg4c6Ua1nITGszO9tc2vXVXTrDJ2+fGxnojPplodFpD2vy2TXai3oEFsPJCohHXdLqfIEIkHQU1bOJmA5ipscv4YrMPvpPI1B8qHtca16czVwwqsZpeZN6niI78s8/pTWKsZHfn8/dOx3yimKTBeJkqG2/Uj4L3qoU1p8w8j2PFJdOvulG4Skbs5H/ufaMiEJZqPDyo/M4+E1krA+5rxEj//kqgR84+4u/8PLmq4sjS28b317eV/by0lb7s4Q/F+yA56LgeRTu0zUkdl1rTU96v/Q6CQh7vWkiLtfUndp1KILjgZPvi/nLoG8UDO1ODddM1MY4QBuCytkHylg3sH4KWtk7dQsJCrAE2RvYN9UvV4aB6TZzBqUIq7yZGqt5PSdrvdlwjf8SUtORaS/AD5em/1tnpo3vrZCNFLMu0RhPD4sN5sOPBrFNo0PMg/p9x9CIEKlnWMsl21SuDgqagWwU6K2rRMd8e7Ste0AAKsnb0ohIqeD8mV9jm96N/Nf+6/T3yq7IBpKQlMxO9/Ew==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66446008)(6512007)(316002)(6486002)(31686004)(66476007)(66556008)(71200400001)(44832011)(36756003)(6506007)(54906003)(8936002)(5660300002)(110136005)(508600001)(64756008)(26005)(122000001)(86362001)(2906002)(31696002)(186003)(91956017)(38100700002)(76116006)(4326008)(8676002)(2616005)(66946007)(38070700005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dmd5NHZrbTJScExaZnRsQkI0NnB0ZkpLcFhxbnYxOFZNM0xjNk9RekRpMXQz?=
 =?utf-8?B?K2ZTaktxdy9lekxYUjJXWVRnSzdnYzlVUW9yQUhCSEpjR1FJVms2OUEwdnZI?=
 =?utf-8?B?N2puaS9Xbkdlam9OZUZBbXlNNEg5dFBMTFFnZFFUQmsvUklvWkZPdm13UUM2?=
 =?utf-8?B?bndBNk5JYjhLc2RKWXpHMzFac1RSbnVldDVBSlJRaXpVTnBMVlFKZVZWOVFp?=
 =?utf-8?B?Yy9BUzRJZ1Y4am1qLzNES3lrdWE4eFlqNFdkbEhHMnNLWGwrU2cybDJWS2h5?=
 =?utf-8?B?Zjdxb2s0bFRNbnJXK0MxbXBTRGJVT0VzZUJxZXJwMEVQanNLZVRXdUhBM2FY?=
 =?utf-8?B?aklQL3l0MVdJZENlVCtCbzdLdys5R0dBc1FPc3QvcDdUNjNwTllnM0E4MzRx?=
 =?utf-8?B?NWNLejAxNWpTZWpvc3F3OFo1ck5Sa1Bxd2Z4K3ZwTEZKNk14ZkJCUUpydXY4?=
 =?utf-8?B?ZEkwOUMrUTlBeHFoVmdvV2hlaE92aG1SQVlUWVFVT3krc3I0ajlNZjQwcStO?=
 =?utf-8?B?d25WSUFlWUo5ZFZXR1JzZlRkZXdldFJzdUtoSlJrZ3dONlNFODFvWndzbGph?=
 =?utf-8?B?bmZhTENWSUFEV1cxWlVzMGpUcnFua3EvTERTOFRXSnNhVkJiYlV4NGNTNnlJ?=
 =?utf-8?B?VkliWG5yYzNqdjREYnNwOFcxM1QrSjdZVWl5QU93RDhDVEdsbXJrU1I5Vzg5?=
 =?utf-8?B?K3FIU3ZzbXRqSXkyNW9wUllhakFRSVFzNzRwRGp5d1hxOHo2aDYyZVpkeWFG?=
 =?utf-8?B?SjJTUHprbzFDMS9hSGhML1FwWSthaktKbE1JQ3RJaTdYRFJCUTJlbExkeDJD?=
 =?utf-8?B?cXNYRkNtQ2hGMVJKbjR6Z0EyUXV2VFB6dlRTTTF1OHNKb1RXcVEvZUdoL0p2?=
 =?utf-8?B?WEJqWVBoWTNnY2VsY2wzLy9rSi84VzdQNUlVMmRDYS9sS3ZKeU5lVzM0NjBF?=
 =?utf-8?B?N1psZlpMRUp6WjZlVEtPSDRHMjN0OThud05qc0ZkSVM5Vi82NC9ETm9IUEN3?=
 =?utf-8?B?SGNvVmluTXZFYVBWREZVVnlLbXdwU1NzMnBLRlNDelNjK01jR2IrYXE3Q1Jv?=
 =?utf-8?B?ZWJ1NmhxR2tUYTFSSkU4ajk2QXA3UXlWd2xJUDZkWjZZZEZoNjhOUUFvcmE2?=
 =?utf-8?B?ZERmQitiN25ZZDJTZ3g2RitCOW9MM2RrY1B2aXJGOXdhTUNpZGp0Vi9qTVBR?=
 =?utf-8?B?Qm9GcXNoSXNJNnFiYzRxUE02Ny9US1JsbXFCeGloOVBpUlpONCtsM0NCNjIv?=
 =?utf-8?B?UlF3eVBwSExOcE82OE5VTGN6NTVtQlFpZ0t3UXBlVG5LYnJRendEcTNBMXZh?=
 =?utf-8?B?ZndiSjhMN0V5dzVSYUdyWmgzQmdONDJOSWxMdk1nZWtacDQxbytnTytvREx0?=
 =?utf-8?B?VGt0MHY1UzlIU0ptV2M5K2M0S1MvRXl4WDRDUXJ3S0p4NDdaci84NFVvOE8v?=
 =?utf-8?B?MUU0YWh0WVVFbEx4L3JTRUZJUlcybElCL3pqdmlSR3VLYk1GNy9yMkxhNjZZ?=
 =?utf-8?B?c3V5d1NzVXRjS3VuQzQrMVpKbUNEK21XakE4V1hjSDZMYWJrV1dWVkdrUFQ0?=
 =?utf-8?B?ejhENFZVaU9XTFlSd2Zxd1QvWEFMcUJuVUFsdlM3QTNJWS94S1F4Q3NneHlW?=
 =?utf-8?B?czBMSnZPN1g1bno1RlliSUxxdlFzSXBrWlR0MVBGdmFxZVNhZ25Rakx5MzJt?=
 =?utf-8?B?KzFOTm8zRTN6VkU5QVduQXRPN3FpYkFUUklIRGxaN2hqWUhZcHA0Y0k1V1lj?=
 =?utf-8?B?WTZrbGQ3YVVjRGFWc2ZPclBMQ3p4clAwUDJldU96cEx6MjhXK2V5TzgvZVpz?=
 =?utf-8?B?SnFDdGp2bEhpQ2MvcUFNSU1xQTJFTng4Vm5mVXdMalBsOUw1L1ovaTBSbEhM?=
 =?utf-8?B?UUlvc3lKZ1ZkWVlhdUowb1FJSXFQcEM2aDRKaUw0ZWViN3FUZ01YSzdraE5Y?=
 =?utf-8?B?TkJ2eURpRS9aTHNub2xuWWk5QTZhMENuV1dmT2drNjhjdXVLeGxWUzR2bXFv?=
 =?utf-8?B?SU1UK0NIb2dxT3JrNWpmY1NJeCtFUTllUHJNcTFHWjc5c2dvVVI2ZmdqakVP?=
 =?utf-8?B?dFdoSnAxYUZ4THVudDJYa1FBWElOQmpRcWVENVV4SzczMjJ3TFVLVUN1WXJh?=
 =?utf-8?B?RStkOCtTZWoxblloVGlSU0ZEMmNjakR0Zm5mSEVDbkpEV0FUM3pMZFNmYTRV?=
 =?utf-8?B?VW0wSlo0YnBSU0Ztd1pMMTFGU05NWHRqd24vNzRlcmdiTXUvOTNQN3lockg0?=
 =?utf-8?Q?7mNKh/6yktiW7SkgzpJC4i5cLLTBWEEWelwl1e3s4s=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <20786A02C030F041BD4715D19DFB7CCF@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c892d5c-7022-4d3e-3662-08da01bde544
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2022 11:13:53.2152 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MVWNYMxSewiDiyL9IGP2S4W2Br3vfsYLCj6vXL3Qk/3QTqODc/XaAAaQwRitK8XFNHYgACcqGcil8nPo89QprIO85J4gfahb/P0xVghlncw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB3166
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA5LzAzLzIwMjIgw6AgMTE6NDYsIE1pY2hhZWwgRWxsZXJtYW4gYSDDqWNyaXTCoDoN
Cj4gQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1PiB3cml0ZXM6
DQo+PiBMZSAwOS8wMy8yMDIyIMOgIDA0OjI0LCBNaWNoYWVsIEVsbGVybWFuIGEgw6ljcml0wqA6
DQo+Pj4gSGFuZ3l1IEh1YSA8aGJoMjV5QGdtYWlsLmNvbT4gd3JpdGVzOg0KPj4+PiBtcGM4eHhf
cGljX2luaXQoKSBzaG91bGQgcmV0dXJuIC1FTk9NRU0gaW5zdGVhZCBvZiAwIHdoZW4NCj4+Pj4g
aXJxX2RvbWFpbl9hZGRfbGluZWFyKCkgcmV0dXJuIE5VTEwuIFRoaXMgY2F1c2UgbXBjOHh4X3Bp
Y3NfaW5pdCB0byBjb250aW51ZQ0KPj4+PiBleGVjdXRpbmcgZXZlbiBpZiBtcGM4eHhfcGljX2hv
c3QgaXMgTlVMTC4NCj4+Pj4NCj4+Pj4gRml4ZXM6IGNjNzY0MDRmZWFlZCAoInBvd2VycGMvOHh4
OiBGaXggcG9zc2libGUgZGV2aWNlIG5vZGUgcmVmZXJlbmNlIGxlYWsiKQ0KPj4+PiBTaWduZWQt
b2ZmLWJ5OiBIYW5neXUgSHVhIDxoYmgyNXlAZ21haWwuY29tPg0KPj4+PiAtLS0NCj4+Pj4gICAg
YXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy84eHgvcGljLmMgfCAxICsNCj4+Pj4gICAgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+Pj4+DQo+Pj4+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2Vy
cGMvcGxhdGZvcm1zLzh4eC9waWMuYyBiL2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvOHh4L3BpYy5j
DQo+Pj4+IGluZGV4IGYyYmE4MzcyNDlkNi4uMDRhNmFiZjE0YzI5IDEwMDY0NA0KPj4+PiAtLS0g
YS9hcmNoL3Bvd2VycGMvcGxhdGZvcm1zLzh4eC9waWMuYw0KPj4+PiArKysgYi9hcmNoL3Bvd2Vy
cGMvcGxhdGZvcm1zLzh4eC9waWMuYw0KPj4+PiBAQCAtMTUzLDYgKzE1Myw3IEBAIGludCBfX2lu
aXQgbXBjOHh4X3BpY19pbml0KHZvaWQpDQo+Pj4NCj4+PiBFeHBhbmRpbmcgdGhlIGNvbnRleHQ6
DQo+Pj4NCj4+PiAJc2l1X3JlZyA9IGlvcmVtYXAocmVzLnN0YXJ0LCByZXNvdXJjZV9zaXplKCZy
ZXMpKTsNCj4+PiAJaWYgKHNpdV9yZWcgPT0gTlVMTCkgew0KPj4+IAkJcmV0ID0gLUVJTlZBTDsN
Cj4+PiAJCWdvdG8gb3V0Ow0KPj4+IAl9DQo+Pj4NCj4+PiAJbXBjOHh4X3BpY19ob3N0ID0gaXJx
X2RvbWFpbl9hZGRfbGluZWFyKG5wLCA2NCwgJm1wYzh4eF9waWNfaG9zdF9vcHMsIE5VTEwpOw0K
Pj4+PiAgICAJaWYgKG1wYzh4eF9waWNfaG9zdCA9PSBOVUxMKSB7DQo+Pj4+ICAgIAkJcHJpbnRr
KEtFUk5fRVJSICJNUEM4eHggUElDOiBmYWlsZWQgdG8gYWxsb2NhdGUgaXJxIGhvc3QhXG4iKTsN
Cj4+Pj4gICAgCQlyZXQgPSAtRU5PTUVNOw0KPj4+PiArCQlnb3RvIG91dDsNCj4+Pj4gICAgCX0N
Cj4+Pj4gICAgDQo+Pj4+ICAgIAlyZXQgPSAwOw0KPj4+PiAgICAJDQo+Pj4gb3V0Og0KPj4+IAlv
Zl9ub2RlX3B1dChucCk7DQo+Pj4gCXJldHVybiByZXQ7DQo+Pj4gfQ0KPj4+DQo+Pj4gUHJvcGVy
IGVycm9yIGNsZWFudXAgc2hvdWxkIGFsc28gdW5kbyB0aGUgaW9yZW1hcCgpIGlmDQo+Pj4gaXJx
X2RvbWFpbl9hZGRfbGluZWFyKCkgZmFpbHMuDQo+Pg0KPj4gVWggLi4uDQo+Pg0KPj4gSWYgc2l1
X3JlZyBpcyBOVUxMLCB5b3UgZ2V0IGEgc2VyaW91cyBwcm9ibGVtIHdoZW4gX19kb19pcnEoKSBj
YWxscw0KPj4gbXBjOHh4X2dldF9pcnEoKQ0KPiANCj4gQXJndWFibHkgaXQgc2hvdWxkbid0IGJl
IGFzc2lnbmVkIHRvIHBwY19tZC5nZXRfaXJxIHVubGVzcw0KPiBtcGM4eHhfcGljX2luaXQoKSBz
dWNjZWVkcy4gU2VlIGVnLiB4aWNzX2luaXQoKS4NCg0KDQpJIGFncmVlIHdpdGggdGhhdCwgYnV0
IGl0J3MgYSBodWdlIHdvcmsgSSBndWVzcy4gTW9zdCBwbGF0Zm9ybXMgc2V0IA0KLmdldF9pcnEg
aW4gcHBjX21kKCkgYXQgYnVpbGR0aW1lLiBTZWUgdGhlIGdlbmVyaWMgbXBpY19nZXRfaXJxKCkg
d2hpY2ggDQpoYXMgYSBCVUdfT04oKSBpbiBjYWxsIG1waWNfcHJpbWFyeSBpcyBOVUxMLiBUaGVy
ZSBhcmUgNTAgcGxhdGZvcm1zIHdpdGggDQpidWlsZHRpbWUgYXNzaWdubWVudC4NCg0KVGhhdCB3
b3VsZCBob3dldmVyIGJlIGEgZ29vZCBvcHBvcnR1bml0eSB0byBzd2l0Y2ggZ2V0X2lycSgpIHRv
IGEgc3RhdGljIA0KY2FsbC4gSSdsbCBvcGVuIGEgZ2l0aHViIGlzc3VlIHRvIGZvbGxvdyBpdC4N
Cg0KQ2hyaXN0b3BoZQ==
