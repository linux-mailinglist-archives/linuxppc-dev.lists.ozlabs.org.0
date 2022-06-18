Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B249C550355
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jun 2022 09:14:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LQ6bj4mrZz3bsh
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jun 2022 17:14:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=h+wmqRoN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::62b; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=h+wmqRoN;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on062b.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::62b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LQ6Zs53lMz3bhq
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jun 2022 17:13:39 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z3HVCyabB2GaF+6rO0C414d7gVTbqWpdW3FKT57NrIoo5dAYKp5vqgm6pGovXN+id9MJIr8iPgQoPchV2UkU7ccbGFJvBkBt/prJS6XENYgUYo5JzAGxF/kUv1/MkY++66Gmz0DFsAVgoe/1ayraIRJRB7RhEUf5SR5O3Av1ixModPWHtJlvD1tnv/5MopWb8skLjRLiWsd3MQvSYwn2snm8Ps4S0qCFwDXV0Z1mcCktJbewIS/3CdKL0G9iqdmNqOPoClNUzssMmnDGCI6HEZCM9TXnwOjjjPgwED7w7J6WMVQ1QFD6gidGcnTjMYsWByPeaxaGSxLLUrwwtbUePQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wXRZT5cZXItPXYCqxR33GoLAeGmJZjJNmgqoVomdDEc=;
 b=E6lo4HSmZFoPzCSDnl6oFAsJfKjZWhtST7xjIWAktopgEcF/V4bPVmkIWQk4gPyjEwzmyvgEnWC40kP+S8oD+V8E357+e/d/UX3Sl8iy1FZ94e08QxyEmhbe5Nb+o/QYT4AB2hPQtmBiIRimqHJ9Kyixh1WwFzV0ND3NhZZK9BGrZBU6oUWM1mxawQOqBBb8Q8c7gyxLWvktEVR1tph8L7ckHM6dLwYWlcUVR2ufr+5kWM38Pdo6KXihLWdOEzfvpB7ZoSyhz9XSrV158CgkDTYXJw9f8WbririvddCRq65plV2VyL/JC4gMRG3WElAl7LPjv+cMQCx1kRmi9KpVcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wXRZT5cZXItPXYCqxR33GoLAeGmJZjJNmgqoVomdDEc=;
 b=h+wmqRoNVg8kB8ei49fjA4vHgSuy0258vn01NlJRRucpj9LkOtvwaHuV0fGLmCXgwG2dlkkbebclOYsQhbUDtGInrEhuvb6UZzo7EzjQtoVn6CdVZbKEDcpiISTwLhd0EMcVTt9vP61BimEDvd+qrVy5MpWgaax/TK9ki0X0+4Rqo2qarPc+p+blHrTCiJhRMKwcVSKlLFm+pzMgnWxCRWSyYYkOqt21qOHPHu0vvgg9UXV2KDti86GKfpYruYEjLcZ1NBx0PY0DrylbElcLNCU59Ge5m4WDHgBezVlSJjO6B0PzZ7TL7wrMAOZl848+NNysHtUfiJo+2DMWXsw0gg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2355.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:34::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Sat, 18 Jun
 2022 07:13:14 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356%5]) with mapi id 15.20.5353.018; Sat, 18 Jun 2022
 07:13:13 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Liang He <windhl@126.com>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
	"benh@kernel.crashing.org" <benh@kernel.crashing.org>, "paulus@samba.org"
	<paulus@samba.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"rppt@kernel.org" <rppt@kernel.org>, "wangkefeng.wang@huawei.com"
	<wangkefeng.wang@huawei.com>, "gpiccoli@igalia.com" <gpiccoli@igalia.com>,
	"aneesh.kumar@linux.ibm.com" <aneesh.kumar@linux.ibm.com>,
	"dmitry.osipenko@collabora.com" <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH] powerpc: kernel: Change the order of of_node_put()
Thread-Topic: [PATCH] powerpc: kernel: Change the order of of_node_put()
Thread-Index: AQHYgj0/J/gVFBvFIEy9s1bkJo8Kdq1UwUMA
Date: Sat, 18 Jun 2022 07:13:13 +0000
Message-ID: <a6a5e5b3-ffd1-904b-bba1-22baff5f7b67@csgroup.eu>
References: <20220617112636.4041671-1-windhl@126.com>
In-Reply-To: <20220617112636.4041671-1-windhl@126.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e4c2d1c3-f9b5-40d0-80e2-08da50fa0268
x-ms-traffictypediagnostic: MR1P264MB2355:EE_
x-microsoft-antispam-prvs:  <MR1P264MB2355D62F033B3530822FA97BEDAE9@MR1P264MB2355.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  5hrHRmeEBXIPdnc1ui4rjAD4jHpYp5o3DMGHSINfMY+h300ekafMQzhzU1dAU66xjxiUpP4wusY+cM8VL02h0yHvDdC/EgnMW+huXXQgjJRMgcV2kEZVZhlfRJSG05sXOSO+EIOZbPO+yHryXZOQvhYPIzB78GV5Sl9gmeWYt6FuOSeVxuohnh0/fr5/ROMl13mociOkBKo8yPQY0gfP/ijyjc/PaN+Am/S0IF+MonIjrlPKm5eZY2C3JvJhuivUfPCCdadw+13ssx+AkhnWpPw+ORjXf3ZqQ4/1ejz+8zT59xausA+/L7HPjSZQlEymwyuByRZP3oPdgTFxivrnGrSiO+3s02e7ArM4dZ3W9jP/gwPX0WtlrQv66s8foeCX1j5MdSvpP4uRHXXJMwltDtheNwhfBvEqBD5gbXfyXBPcyBV0xoXB8sXEhLWGSvEsehF89+G8jjpoXoi3EZ9+Qf8lPwYP3SRwzjS8mLBPmNphs/+B17aLL7b8sA0mDgEAg41PY28Pg+ui29iOS0fISKcbEUc9hH5bcXn9Q4OO/w6D14W6Qpjbtj3LPUzffd4AIvNUkBDrEAMyFBdPkl4rMQoQGxLNkRduiwmzwAVFLYe7+u324Aa4Qqjlf5O6X90P2Ng8LIyTBJ0/TNQDzLayd0n++N2hKGiw1AM+jOuotTV1/JmhoX0YXU1ncwTlxi+X8bi9PhVkwQAr1g3hfSDxCBfUgdCCezT986iACh8Jn4biLrkz4u5tlNRpNKG9pJccEPsOjKIio28nd7JiSh34zOxbbGVJuM8xJe7rJk1hiWk=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(6486002)(38100700002)(8936002)(38070700005)(66446008)(498600001)(31686004)(6512007)(26005)(6506007)(186003)(316002)(2616005)(36756003)(110136005)(54906003)(66574015)(91956017)(86362001)(122000001)(31696002)(2906002)(921005)(76116006)(71200400001)(44832011)(4744005)(7416002)(8676002)(83380400001)(64756008)(5660300002)(66556008)(4326008)(66476007)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?ZFo5UE1RL0ZMZlgwdTRVemJjY251N2hDOGYwZ0tXYmQxdmlUWDdPaEVwbTJl?=
 =?utf-8?B?OWRkYlZNV0NEQlNwZXo5MGg5MFhJcFVDRmZHZ0IvZitlNGtPSWJRY0d6TUlm?=
 =?utf-8?B?VDNoQzd2SjkrRkdKVjkxMU0zK3VWVjdyVFVsekJZWG4xd0ZpYlh6L1lnSVJh?=
 =?utf-8?B?MHlHU041WWxZUFlqbHdzTUM3emZYUmVRNXorcUxrV2VTQ245T2Q2YWM0Y1Yw?=
 =?utf-8?B?RlVDMWFtZW9uc3k0LzZaYTFYTVgzaEg5UWFIZUExNWJnN0FiWGxzZ2R1aWc5?=
 =?utf-8?B?b2xHQ0FVQWtlbnZvdlhKZ281eGd3dTh5SERjaVFOZ2hmTzNGRG05bW5EbzRj?=
 =?utf-8?B?anV6SnNrZStaaUlka1hGbEZWZ3dmbVBGVTAzS1J1MlJHYUtxUzNMZXdwbEtG?=
 =?utf-8?B?Nkpscjh5VXZTQ01Jb0dCVkl1Y2FSek1XcWowSDZ6bGtYYTd2dEZEM0VxeHFW?=
 =?utf-8?B?Q2xCUTk3eUU2TWYzZEM1T3JpTGFpRnVkODMyV0lHU3pmVTdmT0F0Q0lWOWJw?=
 =?utf-8?B?SzY3QjhrZkpzeHJ4T2VZMktFRkJiUHZaVVJqcWJMYVNWQ1AxN0F0RVgycjhk?=
 =?utf-8?B?UUlGcDlQdVBWa0Z1TDFadGFjTTc4QWxOeVhhVm9majVoNyt5b2ZUZGl6OXJm?=
 =?utf-8?B?ZGVFTDNoVDc4aXAyZnlQSTR3V1N6L3JyeFMxMmdqbFArQ2JzZ3BKZVAzWW5X?=
 =?utf-8?B?U21OQVgvS3JPVDhPRGNINnZLQ1Vxd0NqV2YybG11NnJEaytzcFRwakNCSG9v?=
 =?utf-8?B?TWlLd3hjK1BTSm1nSmZuWWJoQWVxVTl1OHFFcFp1SThWTThpMnVuSUs4cFly?=
 =?utf-8?B?S2llOFBKdW9vbnBOdjYxamVMNmpJaFlSWEVQeFVWQitxanVUQUwwSE1KWm5W?=
 =?utf-8?B?RFNwdCtHUWQyNmJzSHVISXVMd0ZyNUVjdjRrMVlDaVY1eTB4cGV4b1hhMnYr?=
 =?utf-8?B?aENYQTVSS3lnMFNjQmF6SVcxaW5HWDRPMkFVa1NlV0NFYkt5Mlc4ejVwUWJz?=
 =?utf-8?B?dERSVW5yR2lFeG51bWdCSExFSittMXE4L1RDT3JLZ3Jya1hvS0g4Mm5xbFN6?=
 =?utf-8?B?aURMNG0zREE4bDd5MHV1U1QwNDZoTVFoWmN3ZitITFRJcGdEbjdVQkovYkFL?=
 =?utf-8?B?WXZVd2d1RXhaR0hycTMvNHY4d044cUlVbTVibFREZFZqUDdNMndpZzBaWmFJ?=
 =?utf-8?B?S0F4bWt6VXl6N2dMMjYwdkpkKzRLWE1acVM3V0xmRnc1UVJQdWxNY3A0bVYz?=
 =?utf-8?B?eDNQOGYyZ1c4R1hTWHJKZ2FpMjdpaU5xZjB3OUY5VXRUNHJyQy94R0pMdVBK?=
 =?utf-8?B?cURFeE5udXV2Tm5iTnpsN2c3OW1Cd0ljM1BzSWRXK3ZOcjJQcUlpc0NGOXlr?=
 =?utf-8?B?MWI2WDE4Q05MYTVWZkZNMWtNeFE4Wi9BN01WSE4rblgxQmJBR0VWUThVS1Vm?=
 =?utf-8?B?U1VNbE9rUkFlczVodUd6MVMwNzdaWnFRakE1L1c1bHBiaEo2dzgxWVJwajBS?=
 =?utf-8?B?Y3FDMnErWUZyeVY5RE02WHRYN0FSTzFjcXkwaUNPOWxhdy9pemFmeXRwN1B3?=
 =?utf-8?B?dkQyTXpSNUU2VFlEU3FJQUZ3VHZQSTZzRU03YWZpVW1ZSHYwNEhtM01tK05k?=
 =?utf-8?B?Y3YweGdXTjlYUVI4Mkc2d28xODB1bDRsT0k0YVJwbGRHOXRWNy9jU2xyUEk0?=
 =?utf-8?B?TG9sek42b3dMRWQ5anhwNkgxeTRTaHlhUTF5T3RJRzNOMkIwcTRIRHhRRDQy?=
 =?utf-8?B?Qy9rdmJnNCsvMHJYbk5YK25LWUZSWVczTFd3S3Z6VEhxTm9CdWRFVG45NEVZ?=
 =?utf-8?B?cm1lU3Q4VzR1RG9MZkZod09TMVIzUnYzZXpVYXhub3FZSWRpM3ozbDhoNXJ1?=
 =?utf-8?B?MWVjcmZrVzBaRWlzVXlEc25rYW5mTkJBRVdkZkg1Qlg5eUxaV0hBWmZ0Y0g4?=
 =?utf-8?B?TEpIbURwRURCYkVrenhjLzVpUlpseG1raGVtdEd4WjJFYjFwdGx1RnlMK2sy?=
 =?utf-8?B?c3dOU1orQTZTR1htOFVVblYzcmt2OEpjV25WbzhkOVp1TXBpWEY2S0hzbmd6?=
 =?utf-8?B?WXAyd1VaNkNlZW5NN05CMStGbXJrdldwNGFETFpSVzlFN0ZXc3BqU1Bld2E2?=
 =?utf-8?B?a2hkK2NxdVY0alVjK2s2N2NMWFcwbTd0U05uejM1em54RlNlRHBsb0JPZUZq?=
 =?utf-8?B?eWtpYWp0SmxqMk1Yclp5Tk9odmlsS3VCRUxrMjVMZVdIcVBKWHdUU3pyVGhM?=
 =?utf-8?B?YTlTeDhBTHJCMFNhVUtaV21iLzlDZ24yaDl3bklnczRyNVZyTWt3eHFiMFRJ?=
 =?utf-8?B?MFZLcmFQbE1uZldqVjMyQzVOa0djSzdEdk9Nc3ozdnpSZVBZZmFBWU1tZFlY?=
 =?utf-8?Q?fMN0+f0D3IXvXkXZptURcgvcgoUeUPRsWkgSi?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8BE79AD590928143BC3BB0923D7ECC40@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e4c2d1c3-f9b5-40d0-80e2-08da50fa0268
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2022 07:13:13.8314
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 62QkSYzOjTbGyfg0fi4cONoVcdlcSLxaB3IGuf0oIaa6VYQs2KdNeKJvXKz3Wko19UD1PfJThbMGznt0tswtpXE/BZWXxoiwoS5m2LWBuAA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2355
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

DQoNCkxlIDE3LzA2LzIwMjIgw6AgMTM6MjYsIExpYW5nIEhlIGEgw6ljcml0wqA6DQo+IEluIGFk
ZF9wY3Nwa3IoKSwgaXQgaXMgYmV0dGVyIHRvIGNhbGwgb2Zfbm9kZV9wdXQoKSBhZnRlciB0aGUN
Cj4gJ2lmKCFucCknIGNoZWNrLg0KDQpXaHkgaXMgaXQgYmV0dGVyID8NCg0KDQoNCi8qKg0KICAq
IG9mX25vZGVfcHV0KCkgLSBEZWNyZW1lbnQgcmVmY291bnQgb2YgYSBub2RlDQogICogQG5vZGU6
CU5vZGUgdG8gZGVjIHJlZmNvdW50LCBOVUxMIGlzIHN1cHBvcnRlZCB0byBzaW1wbGlmeSB3cml0
aW5nIG9mDQogICoJCWNhbGxlcnMNCiAgKi8NCnZvaWQgb2Zfbm9kZV9wdXQoc3RydWN0IGRldmlj
ZV9ub2RlICpub2RlKQ0Kew0KCWlmIChub2RlKQ0KCQlrb2JqZWN0X3B1dCgmbm9kZS0+a29iaik7
DQp9DQpFWFBPUlRfU1lNQk9MKG9mX25vZGVfcHV0KTsNCg0KDQoNCkNocmlzdG9waGUNCg0KDQo+
IA0KPiBTaWduZWQtb2ZmLWJ5OiBMaWFuZyBIZSA8d2luZGhsQDEyNi5jb20+DQo+IC0tLQ0KPiAg
IGFyY2gvcG93ZXJwYy9rZXJuZWwvc2V0dXAtY29tbW9uLmMgfCAyICstDQo+ICAgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEv
YXJjaC9wb3dlcnBjL2tlcm5lbC9zZXR1cC1jb21tb24uYyBiL2FyY2gvcG93ZXJwYy9rZXJuZWwv
c2V0dXAtY29tbW9uLmMNCj4gaW5kZXggZWIwMDc3YjMwMmUyLi43NjE4MTdkMWY0ZGIgMTAwNjQ0
DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9rZXJuZWwvc2V0dXAtY29tbW9uLmMNCj4gKysrIGIvYXJj
aC9wb3dlcnBjL2tlcm5lbC9zZXR1cC1jb21tb24uYw0KPiBAQCAtNTYzLDkgKzU2Myw5IEBAIHN0
YXRpYyBfX2luaXQgaW50IGFkZF9wY3Nwa3Iodm9pZCkNCj4gICAJaW50IHJldDsNCj4gICANCj4g
ICAJbnAgPSBvZl9maW5kX2NvbXBhdGlibGVfbm9kZShOVUxMLCBOVUxMLCAicG5wUE5QLDEwMCIp
Ow0KPiAtCW9mX25vZGVfcHV0KG5wKTsNCj4gICAJaWYgKCFucCkNCj4gICAJCXJldHVybiAtRU5P
REVWOw0KPiArCW9mX25vZGVfcHV0KG5wKTsNCj4gICANCj4gICAJcGQgPSBwbGF0Zm9ybV9kZXZp
Y2VfYWxsb2MoInBjc3BrciIsIC0xKTsNCj4gICAJaWYgKCFwZCk=
