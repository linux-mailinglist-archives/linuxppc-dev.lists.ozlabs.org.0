Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D10AB5A7BF9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Aug 2022 13:07:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MHhH05vrJz3c4K
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Aug 2022 21:07:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=BvF+9ieo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.89; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=BvF+9ieo;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120089.outbound.protection.outlook.com [40.107.12.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MHhGB4yDHz3bbQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Aug 2022 21:07:12 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i6YkXfFT0XtSczt2o/p5aZlrDbo0kDQKxiadO+kokxrfzO99MOf2vLzvODI2Q+O3Ri0z8AEYmwk8bldhaQ1XBXKsl+rbu0GVnThz8aB5dyYqS2loh3+oazWSyOZsTZKF/VOCt6WjQtR/wyZPT2NAPGvhwKDXKx4upgZPAHMXIkk/bskwB3iJE3YrKpfxvHGdm7T7QAHdjYQ7QwJZhKV4hpSnXm4gSPNi/b7PZuai8XlANbfE+Eomnfy5ayXl//ajZV0hy0lT3iHAV3f5gp3Bq+pqQ64OFvVwaz7S6wsglHH1WVrhGY5NaTwaZhqE2iJxMA9a1qQFVJ2Fa1IoOC5nMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fZe/PinBwulgj0UhQjp30lZwCzrUK9PbXb+NWjbISyM=;
 b=MU5hx2uPZqiNcU8phhDLaxSJVeMy2TlcA2nkFWDqLWLqQVs4KBWpOv2e+GsLAyYlEvAki+QVuvshj0iSi0O2wqVwjjehAPyibwIzhK4KkNiuurH5M+4dlqqct6bHzYZT9IDTdvgLg9fJjIFHScSTpYKZpPpGtYkxV83skPQb5xajjkww56yRQN6J2Ua8HJP5YLycFinfFCQX5D1m3dj/U4xNbpTp1smonFOx5cs31BrfILh/jYtbDTjENlt3Nj+ByanTLynkvllIKz7aUOf+/FyQx0Hqu8RgexEbpTJL+uLJvxyQSVMvfSTKWk9utC+YnseQIrgvmLZVLkYCk4noNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fZe/PinBwulgj0UhQjp30lZwCzrUK9PbXb+NWjbISyM=;
 b=BvF+9ieoDkBhqTHT3l7DDpkQrqXbc7QGTKiQAX7iTKRD8n136J5+TZPv3mfjnbl0lfdDSJDcpfVqRjVF5kD2hjwQFDy1ei/q1lLShewpPUCM0HieLkqcweV0pxJig6b0YLLKy+ZKJR+lTotwfXm9fbIp76/y/ad9vDQGrTEFSmJ+3QIP0+yv4dIANgVmHQcR5/++n6cKATfl86zxQQz6mf095PaaUWuVnnRhWXiaKgOZVVupxh60pfyyXtukzdFryZ0kRBu/F7c8sBaw8BCLNTVOJ6ytsG7Q5vgSEzJ23AnxEP0FJBhPXVgAQVuv62JoaMHecFoPHs0vDAWFUqXviw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB3110.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1d5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Wed, 31 Aug
 2022 11:06:52 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8%4]) with mapi id 15.20.5588.010; Wed, 31 Aug 2022
 11:06:52 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Jilin Yuan <yuanjilin@cdjrlc.com>, "mpe@ellerman.id.au"
	<mpe@ellerman.id.au>, "npiggin@gmail.com" <npiggin@gmail.com>
Subject: Re: [PATCH] KVM: fix repeated words in comments
Thread-Topic: [PATCH] KVM: fix repeated words in comments
Thread-Index: AQHYvNMJ5ULtGhF5EE+o0zrGflRtqq3I2eMA
Date: Wed, 31 Aug 2022 11:06:52 +0000
Message-ID: <9cdcf25d-d440-4b28-ee51-08c13c391872@csgroup.eu>
References: <20220831004454.33921-1-yuanjilin@cdjrlc.com>
In-Reply-To: <20220831004454.33921-1-yuanjilin@cdjrlc.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1e34ae7f-97a2-455b-c489-08da8b40e879
x-ms-traffictypediagnostic: PR0P264MB3110:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  97HHD3FeiCLavOkTr5+Aq6PIqnbjJoyyNN2wzxTdL2ijEOmBoyxchE1/5krKUHm10yj5kg71oLvkbSve8nqjGk40HxGWF/h1Oi+izey4sizMT+YrPXzpvTnAQ2JIpBrzoeTUbPQEfMAxlh7AWDyMpJhg92WOkcpT8xT1Bd3BYdVTEt2AquYCDAj2kx4YICMO7XMaBtdg7YMEgYrFTEzSXkRK4fkilICdtEaVE+bbiMUsXUGad6yMLYFTQ2QmEDIl29nTu18JvgvkqpcYhdUkfvWKb8X5hbTktosmqvHzDgOMAuEZohpzcNndInu5ePY8/KetibJxVlcA4MXy1sGfKxVuO85uKqJN23NX8m0Pwn7C5NUVEeZImv9xuD4RweZNrYwdzbtTK6nl4upcR+W+WOGUGVjOTVvgyBSoziLFVH18OBhouPr3Ogea1RsWhC1NYteiD37IIh3ijPwnFyka/mOtPt1rot6TOAo1Wcq/JgNQRl6ZkfbFQsYqdRMM+f2SNgbP8lMUpjatWjira197l8N8gq2N33wv/Zo1MPMW7hLlBJhSceEb7MuI5hYEO7Sub8WNetz7Gk+krSksIfPLyHsZ5TvsrB5BmHVG/tqEy7X/lauj6GO8vBLwX7I1tjT25cXIw4VtwWzRDfUiYXiTeQNxYpxhDfLsMtY789wYCd/gLRlLz/YRqP+8j5DMXUuKUyj9HwMzXAIXSlAeT2PfD9F4ulHLCOBhxVmABrjdPH6RUIZM3yPsx0nt5cW+iniMHe9zOgAD5IozqIJrBDFBaqhOPKDEoEHyZx/8oOy5T6yDbKazkJs5Hza3C551ik1I4rXLInCzTyUOo2QoDdxmkNeP3AQjIhKzi3QJlRdHhCM=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(396003)(39850400004)(366004)(346002)(8936002)(36756003)(38100700002)(122000001)(478600001)(91956017)(8676002)(66446008)(44832011)(71200400001)(66556008)(66476007)(6486002)(76116006)(64756008)(966005)(54906003)(66946007)(5660300002)(41300700001)(31686004)(316002)(110136005)(4326008)(186003)(2616005)(6512007)(26005)(6506007)(2906002)(83380400001)(66574015)(86362001)(38070700005)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?d1VGV2RMR0tXcWRGUWUzVEFDSVJWdjJZVlI4RjBRVHJvdXIzbExzRG1TQnRr?=
 =?utf-8?B?MjJGRFdaZUVYdmtpVDl3bEVMazdsRnVtbWFDMlM1SFhod2tNVDRjTVgvYi9j?=
 =?utf-8?B?TTNBQWFaY0N0L29BQkwyN0dnbDN1M0VGUy8wOFEyV1o4ZHpNSGs1dlllQWpr?=
 =?utf-8?B?aWtFRWhGS0pDVkE4MjVKNVNlVDVCN0szcFkzaHFjWGp2TDhNMzF0ZmFCTklj?=
 =?utf-8?B?aWg0UTFzV05UWCtNbzJRSXNrOUZUbkNkeG5BSTdiUUJaOGxzVzltdm9RNXVD?=
 =?utf-8?B?cnltbkxFSzZDU0pqeVNmMkdzMnZsK2w4ZTBMRWptWGEwQWlmT2JpQys3M1da?=
 =?utf-8?B?bThEY1I3M21hOUFlSnl4bG1Qb293UjRGUm5xZURKYTF0V0VRbStXdW1ML1Br?=
 =?utf-8?B?SWFUYXA5eFJqdGZqMUl6cGJLOWNJZXlXbm1JaThxMjEwS3BPNEdsTGhvK3M4?=
 =?utf-8?B?Tk9rVlJ0V3RvZVNUaXBCQVVXWTZnd0xzSENpU0JqQlRucDYwaTBoWUI2cUxm?=
 =?utf-8?B?cU1WbHhtdjY3blYyRTEySGxFdlc3cXBuSE5kREpvRml6OCtOZlloaWxidVFQ?=
 =?utf-8?B?bjBLOVdyS0N2UlVKQzh5WnNabHJ1TXhaVWRjQVVVa1g5WUszbFd3MGpLd0Uw?=
 =?utf-8?B?N1hOTjZNekFaTENjdkFMMHZaQ0t1SG5idHJteFF0dE1LcVZpRjNERXh0YVFU?=
 =?utf-8?B?aEtOVXVobmhPMWo0dzk3K2ZMWGwxQ1oreFVzekhNNnRJSnE3MjZHdUtYVGI4?=
 =?utf-8?B?MlN3NkJHSFhGbFZ3WTJwUVJ3Y29IYldmZElhZmhsL1NXVEt5SktEaXFoQXA1?=
 =?utf-8?B?bjJlY1NHcm50QzNsRmoxRkV0Rjg1Y3NzbnZJMW83VWVHb29MUm5ZRkloaGJB?=
 =?utf-8?B?VG9VYkgxYlNzWXQ1SDVMbXA2M2sxY04vUjd4dFpXTEFkOW5nYXdiVGgvSFZE?=
 =?utf-8?B?b2JZMHFVb0pVSkFnUGJMNE1kQ25DQ1doTVlyb2xqWmJlT21JUVN6b3pCQmpO?=
 =?utf-8?B?K2xtVUVMdHF2UVhZYVN0SlprZzg3SzBqandzd3lyQ3RhQjNVRGpRc0RQcEVR?=
 =?utf-8?B?R3E4T3BLZHVCU2pXSWtkRU9wNTg2cUEwU3JsUEJNRUMzQzhWancxS1BuTCt0?=
 =?utf-8?B?OUpxUCtiTUV2aWt6Rk1KdUdOejVNMTFKUEJHY2FMUjJzNWxMRkFHSUMrOG1H?=
 =?utf-8?B?YUZLR2NxYWlRd1BLQUlTVTQrWU5aKytnaDlrbVpOOGxGTjJEeXdJRzRpUVZU?=
 =?utf-8?B?Q2tBQUNEVWhtSCsxRW8vemxMNmxwTDd2Zi9lb0JJanFkODZVZjJNa1d1c1pq?=
 =?utf-8?B?YXlETU40QUxhV3JNRCt1dEVOdmYvaDVzZ3ljc3MrT2NCWWk4ZHRHaWZ1RWs1?=
 =?utf-8?B?TjJ0ZE82TlI5eVpPVmhaVi93WThkTHJTVEpHOW1iYVZ6SGJtRVJUbC96dGpW?=
 =?utf-8?B?RjAzWHQrZER0dFZUV2d6cjNPREJwWHZIQm96a2xSNVUvb1dOazR4L3NiK0RE?=
 =?utf-8?B?WXJTSitTVGxsd3RZVCtLTC9uNGVpVlJVSkFCWE01SzVRTDRsRlhvODAwRkUy?=
 =?utf-8?B?K3U4RDZJVnJRdW11TmEwUUVZS3FtYVhNRTFEcGNWaUNpb0xBbUI2RUtKcXFQ?=
 =?utf-8?B?ZnNlVmY2aWNnVE5rZ1NUNG9rSldaV29nVXk1QUZyYUpmbVhRZjh1aWxoRjBZ?=
 =?utf-8?B?UFhVWHRUYkZaMzltQmt2NFlYNm1KdXovb0hFU1Z1VjNoazFNZnlNWEdOcUFL?=
 =?utf-8?B?R3hma3pjd2pEQndIcUt1UlJLb25OUXV6a3dadVJodERDV1dNczBudEtKRnFQ?=
 =?utf-8?B?R2xmN1AwQjU4bXlvbngrZGVHVXBKUENyQVVackdZV2k0bkJVbjdoQ3Z5a01B?=
 =?utf-8?B?YnA4WnJoSmEybVVQZUVYMTNjQ0FGbEMyeWtXanZsVGk4d2JZdmZPc1pZbUha?=
 =?utf-8?B?c2RZTkNPWUNLdHJadjloREZwWDlkWkxpa3drZXdGeVVZWVVYOUNDQ2NVSmN3?=
 =?utf-8?B?Z2h3M3djejU1bzNoVm5ZZ1N0bnVJMm9HUUE2Nmxjam5IVkNibThCRDY1TEdH?=
 =?utf-8?B?TmNPTFJRd1doM2ozS2xZYWxCamRMbGFTRnQ5dkpBaUFjalkvdDZ3YnRIOFho?=
 =?utf-8?B?blduVTBBUTQvMDN6b3V4R09WSmxzdElhSTZoMm5ZOCtndko1NVBtbWNySjgr?=
 =?utf-8?Q?pOKg14/085G96TiRpECugbY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3C43F137C046054885C350E27EB46C41@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e34ae7f-97a2-455b-c489-08da8b40e879
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2022 11:06:52.0496
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qoCQWlZu/AesE/25CMychf5yCN1v6IWHvM/qZTe+J+H97XfU+HVv6/D0Z4IAaPXyzFmx2LGEURARgek6zDknJWwE3WrNBNeqf63JqPIOavU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB3110
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

DQoNCkxlIDMxLzA4LzIwMjIgw6AgMDI6NDQsIEppbGluIFl1YW4gYSDDqWNyaXTCoDoNCj4gRGVs
ZXRlIHRoZSByZWR1bmRhbnQgd29yZCAndGhhdCcuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKaWxp
biBZdWFuIDx5dWFuamlsaW5AY2RqcmxjLmNvbT4NCg0KVGhpcyBjaGFuZ2Ugd2FzIGFscmVhZHkg
cHJvcG9zZWQgYW5kIHJlamVjdGVkIGhlcmUgOiANCmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5v
cmcvcHJvamVjdC9saW51eHBwYy1kZXYvcGF0Y2gvMjAyMjA3MjQwNjI5MjAuMTU1MS0xLXdhbmdq
aWFubGlAY2RqcmxjLmNvbS8NCg0KUGxlYXNlIHN0dWR5IGhpc3RvcnkgYmVmb3JlIHN1Ym1pdHRp
bmcgc3VjaCBsb3ctdmFsdWUgY2hhbmdlcy4NCg0KPiAtLS0NCj4gICBhcmNoL3Bvd2VycGMva3Zt
L2Jvb2szc182NF9tbXVfaHYuYyB8IDIgKy0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMva3Zt
L2Jvb2szc182NF9tbXVfaHYuYyBiL2FyY2gvcG93ZXJwYy9rdm0vYm9vazNzXzY0X21tdV9odi5j
DQo+IGluZGV4IGU5NzQ0YjQxYTIyNi4uOGU0YjQyYjVmMzdmIDEwMDY0NA0KPiAtLS0gYS9hcmNo
L3Bvd2VycGMva3ZtL2Jvb2szc182NF9tbXVfaHYuYw0KPiArKysgYi9hcmNoL3Bvd2VycGMva3Zt
L2Jvb2szc182NF9tbXVfaHYuYw0KPiBAQCAtMTYwMSw3ICsxNjAxLDcgQEAgbG9uZyBrdm1fdm1f
aW9jdGxfcmVzaXplX2hwdF9jb21taXQoc3RydWN0IGt2bSAqa3ZtLA0KPiAgICAqIGlzIHZhbGlk
LCBpdCBpcyB3cml0dGVuIHRvIHRoZSBIUFQgYXMgaWYgYW4gSF9FTlRFUiB3aXRoIHRoZQ0KPiAg
ICAqIGV4YWN0IGZsYWcgc2V0IHdhcyBkb25lLiAgV2hlbiB0aGUgaW52YWxpZCBjb3VudCBpcyBu
b24temVybw0KPiAgICAqIGluIHRoZSBoZWFkZXIgd3JpdHRlbiB0byB0aGUgc3RyZWFtLCB0aGUg
a2VybmVsIHdpbGwgbWFrZQ0KPiAtICogc3VyZSB0aGF0IHRoYXQgbWFueSBIUFRFcyBhcmUgaW52
YWxpZCwgYW5kIGludmFsaWRhdGUgdGhlbQ0KPiArICogc3VyZSB0aGF0IG1hbnkgSFBURXMgYXJl
IGludmFsaWQsIGFuZCBpbnZhbGlkYXRlIHRoZW0NCj4gICAgKiBpZiBub3QuDQo+ICAgICovDQo+
ICAg
