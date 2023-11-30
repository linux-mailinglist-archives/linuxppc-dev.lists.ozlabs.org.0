Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 683817FE9CB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Nov 2023 08:36:41 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=OLrMvEUD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sgp0k6c1wz3d9L
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Nov 2023 18:36:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=OLrMvEUD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::611; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20611.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::611])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sgnzr4snhz3bw9
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Nov 2023 18:35:51 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kx0gGNqT6xPI6TYTPiXZ95P6fw4jGBYNdU/3E8CvBCl32TwedbGU0Ohl5IV26iENj+ncx7RcG5AnMMlymINe2bLzOo0eRig4LR77qkNuTT90xSELep+KNYD7ILQ47cy4EB3P9F+DXarTLkK6y5uRoY+7CGCIWNJID5eCh2vJX6PIlzeB5Clu54RDVq/uo88UTLYTcXKKjGK70yRxPrmdbxGF96B3tVv2mdT+zzYGdJxhrbla9Pw4iPPWBBpmR41YiQkOSoOiL2fO+TJ9WI22W+okbazU/y+yQq1GQmgypBGvaP6ai0DL/SV/6JnWP4NpwjgYPuLfWop4W/f9rkJBXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/EJ6uyfqOm73aNziDYeK81yCvYbpLHKg83VKw62sD0k=;
 b=I/J2mpKsBHQTyMLHXPdk+e5ZAv8hGxOWNO37AKde5ncmt/IYrjv/SMz4INjUstz/G7ug1I5SmjujseaaE1h6U01byl84DBOkT7TrgWVTCHhjzQSPg4VoBpgkyGUZaL1emFe59GvGcQ+jOb3sNMPXFN7hkVj2MRBtvmFqN8FG73TNAR2dXtW5xWe8GInESnxWTHrSMhkrnWo61krHyMeqK74nu76MUjDAnaA9OpXJDjsWANWulzi9OLC7DmMsFiNVfFbRQedaxHrGost3I0OypusV7llLIu9OJIVdcGpZmhZUmfYn1V0sPA4/Pb1nfkCVp/Rht59RcGMUl8ifkJ0SPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/EJ6uyfqOm73aNziDYeK81yCvYbpLHKg83VKw62sD0k=;
 b=OLrMvEUD6FBXFLHdX+rTrYhjO/m2huRkY/+JUwGCIqqXb5XBu0pku8Fs9J5B6bBLoToA4IxWpvww4dXd4uOcisaVFeBhz/aO6xGQp82Rbf6sLSHGBVy5tZlJSCvEWh3H97V5Wl/klttifXvLvj506QwVNE03sS5f8ha7LIqMQq2CeVvkjKQhEu/zZPUuQxhjymxeW1adeYPKVmIwAqFQmIxbJp8yXwkdnVDfhW8ea4h6CrP8p4388p2vaabdw0+21b+ppcuWabet3U7epOWnpXlzuf1Nvp90/Kkl6+I+HbvSb/mREOSdkUwT9r0e5+V5MYum8cEsMBm6zfaU9S1rCA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAYP264MB3352.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:124::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.8; Thu, 30 Nov
 2023 07:35:31 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97%3]) with mapi id 15.20.7068.011; Thu, 30 Nov 2023
 07:35:31 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Rohan McLure <rmclure@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v9 4/7] powerpc: mm: Default p{m,u}d_pte implementations
Thread-Topic: [PATCH v9 4/7] powerpc: mm: Default p{m,u}d_pte implementations
Thread-Index: AQHaIzips8R/iUHEGE6FfJMMT1uYl7CSeSUA
Date: Thu, 30 Nov 2023 07:35:31 +0000
Message-ID: <5305d752-5161-41ea-9832-c629dc93dc3b@csgroup.eu>
References: <20231130025404.37179-2-rmclure@linux.ibm.com>
 <20231130025404.37179-7-rmclure@linux.ibm.com>
In-Reply-To: <20231130025404.37179-7-rmclure@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PAYP264MB3352:EE_
x-ms-office365-filtering-correlation-id: 88cc948a-7070-49bf-ae56-08dbf176ee6d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  9ck5+3reP9URvf5/0wXuE8jK5FLnws/wvjbZlzCciv7JbYDZ766QstvZARKMQfsGJ0AxqUng/XDf3/UWMv5SZRfBNc7aZXKFXrZW1nPVgjb/QB4bwA61Na43OkyJcyMN7awJ1+DwLvhIbatruVd83lO0rXfWzerFY2puu8/xvEEAORWW95WHORhgNAVyZsSmYrlLNsdo4j1AFF9mj9xJpSTufL8Ai39yOeH3hrZHo+JtirHxCpbgf07pdCOTiM47rROVleG9zzzDz/7XXZj+6udSCKTqDWk6WnauGCMPVeGkrbyi7gLFVEZWyJB/c4hdRZDr8WWPBX3YaVa+rmJS/9OLDT64lDzrA3m6/UppsKryvTxdGAwqHi/NVWRC/El/BQL3V4bPGOtX2o0u8QC/jiAu9judjdNDw/cFhxLcFPuik+8Etq1AnU/12tY8osKyZHOP5CZWzHH1f0dtBhLfJOzBVU898b7+SlD/5Gaok9IVCKVdev9VZMykxDxrpzI7gUYtySqkM0Ls7CAR4WjMf7SZCPB7+tU8lByNAPKOwhTKCglwetqwjkK4mCpFIQ22Rs7JcBTu3zQcloVfOASQru1qHPauNGN5AJWBejpXFzMEx39lxWr+KTgCbvXpIl7XX3MaE3Q2x/cex9jjUJNGPv6VnIl5goWR44P19aDdth/ZMdzrPOnh3BSmPDfH90rSRDx43ddqpjO/vEKW80E+Uw==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(396003)(39850400004)(366004)(376002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(6506007)(38070700009)(6512007)(71200400001)(26005)(83380400001)(2616005)(110136005)(44832011)(122000001)(66446008)(316002)(64756008)(66556008)(91956017)(76116006)(66946007)(66476007)(38100700002)(5660300002)(4326008)(8676002)(86362001)(31696002)(31686004)(8936002)(478600001)(36756003)(202311291699003)(2906002)(6486002)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?WTNDc2wwd0RWc1F0ME9RUG5SMEN4cThWNGZmeDNEKzJVaklKR0hxYnlJb3Uz?=
 =?utf-8?B?NkFVOExVZUY0MHV3V0p6UmlGTVVLbkhKWWllTjdvRkZ3eEFWd2NyUW13aGp0?=
 =?utf-8?B?cU1CaGd4ajhxK0tML1ZMRm5CTDNJNFhlb1JkTGlsbUdGOTNXSDFRUTZLUm54?=
 =?utf-8?B?eVJ4dU9DWUZ2T3BObkxMNGdwNWZ2L1Z0Y0s3T2QzT1RQbHNHUDEwQmJubWlR?=
 =?utf-8?B?MzNhSEozd0hvUUZValBkbTV4cFRCVDFkZ2pDSXJOMk1pMm0wUVVUaVQxZkZt?=
 =?utf-8?B?cWQ2a2RHQU5oUXhxOGJxK2VOc0hwc3EzcjJzcTBVS0ZqWjlobUFFbWdFQWpF?=
 =?utf-8?B?SHlZVEZaci9iYUJvQVFRYnpqdjI4VVZYMXhRTXJjcU0zMVJpWDROQVlXSXFO?=
 =?utf-8?B?ZEVJL3QwUDBhbW96TDBHSUR1N29iRmJNNHhIUUU1WkJKVStRcHhlWVdjOWlY?=
 =?utf-8?B?NHM4cEU0RDBHL0xCYnFOYjZ4NndKZnlZeGNyUU1ScjZyV1NJdENJUlI5cTNF?=
 =?utf-8?B?NnZYOU9abkhmcml5dFVpUk5FRkxLcjBJcFA4elJHMFpOYTQ0ODkwNk5SdGdz?=
 =?utf-8?B?c3RXV3gvSklNVkJnT1krZDkweUNaQTAzVWlJU1hFd0o1cWd2WlZETm1SNHg2?=
 =?utf-8?B?YmxDN1NnTVdTcTlDUmdFS0c3RXhZMFhJL3A4UkZvZ0dMOHAvZDR1YldxK1pZ?=
 =?utf-8?B?MW5SeTVPbS9wdmtOTlpnbml4WTJmRmR4WjQ3QzJCTU1WTkpKMkxuSkhSSzlw?=
 =?utf-8?B?eVFwMXJoelFOTUo0cFhoYWk5TjNPTjUwQVBOQWR5bm1aNFViZ1dCQ2MxSzJQ?=
 =?utf-8?B?Z09pMjZvc2VhdzJycFRUK2hhdlN3T0Z3WjlGcEFGUGlDNmpHK3VOYzdEQ0tv?=
 =?utf-8?B?RElwRVhmTmJvdkRJMzh3WE9RbmtBay93LzFVNnZraUVkM2p6Y2FyUjFsMjRl?=
 =?utf-8?B?ZExVYzlZN0diNFRzblJ1YmN5MHZLNHJDekQyNGJ2N0x6NDZFZG9PR0M3SEk4?=
 =?utf-8?B?cmM5LzY4aG43T0NPckQ2UXF1c3NxV3RxVExEV3BKNGM3ZURoNUNqRzRZY0gx?=
 =?utf-8?B?eFRuWUxiMTNvaVJCQ09LYkh0S3RCSUpJdHdOamttWWJGWTFTc1hWZnI5Mm8r?=
 =?utf-8?B?NVBkZnhHVitCU0RpYklRNWdNM1o3Z2FKR2JPaGE3c09yQkxCM1VGK0h0S0FD?=
 =?utf-8?B?RlY1VnlWTElCTVZkV3BpTllhMW9TaHpXeHJ0TkZwVWMySjM3MmZnSkFENFUx?=
 =?utf-8?B?MGVHdHJhamhreFhzSk5FclVONnJzTUxidHlWZnNRWEFhaW5mNGRDY005VERv?=
 =?utf-8?B?emZoMHZVSFNtUXY4eTRJMVJrY1NMWkl0eXJwenVVc3NySklGY1MrYXZTRHl4?=
 =?utf-8?B?NWQ1KyszUUJrbG1mZVkxS3FIREUvWktSMW5FdlBkeU0yRWtKY2UwUWFPWXBs?=
 =?utf-8?B?OGk4TUVPeklrSEhEVklMOFFZUDhZcGV3TWtZdkd3M29UUXp5SWE3c0FvTUUz?=
 =?utf-8?B?ZjNPdTJSREczYTRZbENWNFF0Z3FGUyt2bWdxb0ZVbm1tVE1xUHpaL0hzTGpF?=
 =?utf-8?B?TkNrSVpuT1k3cVBxdU5tMVl6VTNzZ2RZVUp1ZjdMa3pCS01udGtOK2JmSi9G?=
 =?utf-8?B?VHdtZWVldFg0QVM0aFdrVzU5NFNnbEUvQm9WZVpiZUlCUjBPVFd4V25OcWlU?=
 =?utf-8?B?Z1hKcVZ4K0p0S2E5UlBqR3B4cnh5eldsdUtsL3lpQWFIdU1Gblgza2Q4eVpl?=
 =?utf-8?B?eE8xR01aS2VoRDF4emhYRVBUdjRYbFN3QVd1cXhqejZvbnFxVVQwK2dhZGVw?=
 =?utf-8?B?TjY4WnFsRXd6T1Y1MVZpZnE4R0hnZ2g3aC8wMXpYejFhc0cyZDFSblRvZE44?=
 =?utf-8?B?dnBNblVBMHZ1dnRZSFhDV2MzU09jN2g2M0htT2xEZ25qa1VNVkhiU3lZMDA0?=
 =?utf-8?B?SVZ4WUsvYTNNT1ptTnlGMm1rSzVaNEhFTWszUWE0MkFtbDdGZUdaOVk3YjJC?=
 =?utf-8?B?T1AxR0RwNmhQSzV2a29UTjF6VW8xVFNjS1JYK0ZUeXVIQTNMWnpxUUcvS3RE?=
 =?utf-8?B?RXdqYjFETUd3c1F0QXB2czZxK01QWkpTd0hxdmJSZUR3SkNXMGZPM25meU5w?=
 =?utf-8?B?eEY3ajZBYkFPMStSZ25ZNy96S0pKMDdqRE5MbGlBMDYxZkdrUUl5Mm53MDlL?=
 =?utf-8?B?aEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C356BA541B1B9C4DB47FFD8865B2D491@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 88cc948a-7070-49bf-ae56-08dbf176ee6d
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2023 07:35:31.1491
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8zTcGX/L/MGiajmW2S480hyoECdJB2ExLih/4eXUSfwbNY/qW+vMl2BWaX//h1Wm8ADlOFLNhidYYzIs9kT+Brpa6UnDH8SJbPFlnVGYhvo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAYP264MB3352
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

DQoNCkxlIDMwLzExLzIwMjMgw6AgMDM6NTMsIFJvaGFuIE1jTHVyZSBhIMOpY3JpdMKgOg0KPiBG
b3IgMzItYml0IHN5c3RlbXMgd2hpY2ggaGF2ZSBubyB1c2VjYXNlcyBmb3IgcHttLHV9ZF9wdGUo
KSBwcmlvciB0bw0KPiBwYWdlIHRhYmxlIGNoZWNraW5nLCBpbXBsZW1lbnQgZGVmYXVsdCBzdHVi
cy4NCg0KSXMgdGhhdCB0aGUgYmVzdCBzb2x1dGlvbiA/DQoNCklmIEkgdW5kZXJzdGFuZCBjb3Jy
ZWN0bHksIGl0IGlzIG9ubHkgbmVlZGVkIGZvciANCnBtZF91c2VyX2FjY2Vzc2libGVfcGFnZSgp
LiBXaHkgbm90IHByb3ZpZGUgYSBzdHViIA0KcG1kX3VzZXJfYWNjZXNzaWJsZV9wYWdlKCkgdGhh
dCByZXR1cm5zIGZhbHNlIG9uIHRob3NlIGFyY2hpdGVjdHVyZXMgPw0KDQpTYW1lIGZvciBwdWRf
dXNlcl9hY2Nlc3NpYmxlX3BhZ2UoKQ0KDQpCdXQgaWYgeW91IGRlY2lkZSB0byBrZWVwIGl0IEkg
dGhpbmsgdGhhdDoNCi0gSXQgc2hvdWxkIGJlIHNxdWFzaGVkIHdpdGggZm9sbG93aW5nIHBhdGNo
IHRvIG1ha2UgaXQgY2xlYXIgaXQncyANCm5lZWRlZCBmb3IgdGhhdCBvbmx5Lg0KLSBSZW1vdmUg
dGhlIFdBUk5fT05DRSgpLg0KLSBPbmx5IGhhdmUgYSBzcGVjaWFsIG9uZSBmb3IgYm9va3MvNjQg
YW5kIGEgZ2VuZXJpYyBvbmx5IGNvbW1vbiB0byBoZSAzIA0Kb3RoZXJzLg0KDQo+IA0KPiBTaWdu
ZWQtb2ZmLWJ5OiBSb2hhbiBNY0x1cmUgPHJtY2x1cmVAbGludXguaWJtLmNvbT4NCj4gLS0tDQo+
IHY5OiBOZXcgcGF0Y2gNCj4gLS0tDQo+ICAgYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2sz
cy82NC9wZ3RhYmxlLmggfCAgMyArKysNCj4gICBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vbm9o
YXNoLzY0L3BndGFibGUuaCB8ICAyICsrDQo+ICAgYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3Bn
dGFibGUuaCAgICAgICAgICAgfCAxNyArKysrKysrKysrKysrKysrKw0KPiAgIDMgZmlsZXMgY2hh
bmdlZCwgMjIgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9p
bmNsdWRlL2FzbS9ib29rM3MvNjQvcGd0YWJsZS5oIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNt
L2Jvb2szcy82NC9wZ3RhYmxlLmgNCj4gaW5kZXggOGZkYjc2NjdjNTA5Li4yNDU0MTc0YjI2Y2Ig
MTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ib29rM3MvNjQvcGd0YWJs
ZS5oDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ib29rM3MvNjQvcGd0YWJsZS5o
DQo+IEBAIC04ODcsNiArODg3LDggQEAgc3RhdGljIGlubGluZSBpbnQgcHVkX3ByZXNlbnQocHVk
X3QgcHVkKQ0KPiAgIA0KPiAgIGV4dGVybiBzdHJ1Y3QgcGFnZSAqcHVkX3BhZ2UocHVkX3QgcHVk
KTsNCj4gICBleHRlcm4gc3RydWN0IHBhZ2UgKnBtZF9wYWdlKHBtZF90IHBtZCk7DQo+ICsNCj4g
KyNkZWZpbmUgcHVkX3B0ZSBwdWRfcHRlDQo+ICAgc3RhdGljIGlubGluZSBwdGVfdCBwdWRfcHRl
KHB1ZF90IHB1ZCkNCj4gICB7DQo+ICAgCXJldHVybiBfX3B0ZV9yYXcocHVkX3JhdyhwdWQpKTsN
Cj4gQEAgLTEwNDMsNiArMTA0NSw3IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBfX2tlcm5lbF9tYXBf
cGFnZXMoc3RydWN0IHBhZ2UgKnBhZ2UsIGludCBudW1wYWdlcywgaW50IGVuYWJsDQo+ICAgfQ0K
PiAgICNlbmRpZg0KPiAgIA0KPiArI2RlZmluZSBwbWRfcHRlIHBtZF9wdGUNCj4gICBzdGF0aWMg
aW5saW5lIHB0ZV90IHBtZF9wdGUocG1kX3QgcG1kKQ0KPiAgIHsNCj4gICAJcmV0dXJuIF9fcHRl
X3JhdyhwbWRfcmF3KHBtZCkpOw0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUv
YXNtL25vaGFzaC82NC9wZ3RhYmxlLmggYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vbm9oYXNo
LzY0L3BndGFibGUuaA0KPiBpbmRleCBmNThjYmViZGUyNmUuLjA5YTM0ZmUxOTZhZSAxMDA2NDQN
Cj4gLS0tIGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL25vaGFzaC82NC9wZ3RhYmxlLmgNCj4g
KysrIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL25vaGFzaC82NC9wZ3RhYmxlLmgNCj4gQEAg
LTkzLDYgKzkzLDcgQEAgc3RhdGljIGlubGluZSB2b2lkIHBtZF9jbGVhcihwbWRfdCAqcG1kcCkN
Cj4gICAJKnBtZHAgPSBfX3BtZCgwKTsNCj4gICB9DQo+ICAgDQo+ICsjZGVmaW5lIHBtZF9wdGUg
cG1kX3B0ZQ0KPiAgIHN0YXRpYyBpbmxpbmUgcHRlX3QgcG1kX3B0ZShwbWRfdCBwbWQpDQo+ICAg
ew0KPiAgIAlyZXR1cm4gX19wdGUocG1kX3ZhbChwbWQpKTsNCj4gQEAgLTEzNCw2ICsxMzUsNyBA
QCBzdGF0aWMgaW5saW5lIHBtZF90ICpwdWRfcGd0YWJsZShwdWRfdCBwdWQpDQo+ICAgDQo+ICAg
ZXh0ZXJuIHN0cnVjdCBwYWdlICpwdWRfcGFnZShwdWRfdCBwdWQpOw0KPiAgIA0KPiArI2RlZmlu
ZSBwdWRfcHRlIHB1ZF9wdGUNCj4gICBzdGF0aWMgaW5saW5lIHB0ZV90IHB1ZF9wdGUocHVkX3Qg
cHVkKQ0KPiAgIHsNCj4gICAJcmV0dXJuIF9fcHRlKHB1ZF92YWwocHVkKSk7DQo+IGRpZmYgLS1n
aXQgYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vcGd0YWJsZS5oIGIvYXJjaC9wb3dlcnBjL2lu
Y2x1ZGUvYXNtL3BndGFibGUuaA0KPiBpbmRleCA5YzBmMjE1MWYwOGYuLmQ3ZDBmNDc3NjBkMyAx
MDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3BndGFibGUuaA0KPiArKysg
Yi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vcGd0YWJsZS5oDQo+IEBAIC0yMzMsNiArMjMzLDIz
IEBAIHN0YXRpYyBpbmxpbmUgaW50IHB1ZF9wZm4ocHVkX3QgcHVkKQ0KPiAgIH0NCj4gICAjZW5k
aWYNCj4gICANCj4gKyNpZm5kZWYgcG1kX3B0ZQ0KPiArI2RlZmluZSBwbWRfcHRlIHBtZF9wdGUN
Cj4gK3N0YXRpYyBpbmxpbmUgcHRlX3QgcG1kX3B0ZShwbWRfdCBwbWQpDQo+ICt7DQo+ICsJV0FS
Tl9PTkNFKDEsICJwbWQ6IHBsYXRmb3JtIGRvZXMgbm90IHVzZSBwbWQgZW50cmllcyBkaXJlY3Rs
eSIpOw0KPiArCXJldHVybiBfX3B0ZShwbWRfdmFsKHBtZCkpOw0KPiArfQ0KPiArI2VuZGlmDQo+
ICsNCj4gKyNpZm5kZWYgcHVkX3B0ZQ0KPiArI2RlZmluZSBwdWRfcHRlIHB1ZF9wdGUNCj4gK3N0
YXRpYyBpbmxpbmUgcHRlX3QgcHVkX3B0ZShwdWRfdCBwdWQpDQo+ICt7DQo+ICsJV0FSTl9PTkNF
KDEsICJwdWQ6IHBsYXRmb3JtIGRvZXMgbm90IHVzZSBwdWQgZW50cmllcyBkaXJlY3RseSIpOw0K
PiArCXJldHVybiBfX3B0ZShwdWRfdmFsKHB1ZCkpOw0KPiArfQ0KPiArI2VuZGlmDQo+ICAgI2Vu
ZGlmIC8qIF9fQVNTRU1CTFlfXyAqLw0KPiAgIA0KPiAgICNlbmRpZiAvKiBfQVNNX1BPV0VSUENf
UEdUQUJMRV9IICovDQo=
