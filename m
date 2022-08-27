Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 712955A3938
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Aug 2022 19:32:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MFP0L0q9jz3bgQ
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Aug 2022 03:32:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=aBvRFScL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.58; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=aBvRFScL;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90058.outbound.protection.outlook.com [40.107.9.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MFNzW4nrQz2xJ4
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Aug 2022 03:31:33 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ndhjpPbgpIr4uQH0gEcxUmhwR1NT/uK4LC7zLR87WEup2suzh/5umMtIpLHlQugdz188bv9Au4CEiG8QNY5WayPCCKXCOB5cymksaCdCb9s66vrGrOKQQ3eX1IwULC1vZxTJT6UpdSb3GhA+FCzkd4+e/qBCQBc6L6O3bc2zu9WgSaGKsgITTPpZh1yS1TRPkN7TpPUjol6xEzZaO4DNMWuoWRkBca1T6loWu/zuKQ3jzAJa+WwBrsEnCOXN1G0Jy3/dMiZgaqGEPWG/nOv6kpWaISjUIPuV2r3LibW30a4CgBwikLlKvbQ560ikD6n49um15kmgH74tmmEtuQ7plw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fIkvIcN8fk41xmwWER5V/rxmBaypAGp79ri4tpvhLHk=;
 b=YMF86zjUWUmuEiaO9J6us6+Es0ZQS16vBh0KnIXgGOl6NuDgawsJ6qtbtAOkRiyoN2PUlDBeR0lLfWoyvXHgUB2IAOxm9coqhuc6skizqP1zQ04Ut8d0ExAOeatiIDbm7/Pc+I0/QT6riAiSg76RnuseHZIxQDjaDgz+VrvA1dfZEACITUiIMtvUSqBF2Lrm3/cVC9eAiNavkfXVo9hE/bDIHpWFLMZpXyvob8pmn/2nvXe0e/H4RW3u/7CvCxFL9j6juXSpoTGoWAh3Em8fqz30dJ1FIdib97JvneFkTBFh27+CqlXUV+cZ6t9+Sb667VTPYqJrJ+lZHU867Ysxlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fIkvIcN8fk41xmwWER5V/rxmBaypAGp79ri4tpvhLHk=;
 b=aBvRFScLIYehXR/BsEsIYpiu0znLCF9mmFctlEYm9s19f3jXbzX3pMbCe8XlHyZGhcMA04z9CvhEyaetWBlFjmA02v7I2HI0/55oMOyyZbKvRRjyVIvWvmxPp0Y0lVUw8fD0V+VMMqNup+ea87RnLOIZvSf5f40IolI1OwxnUvKbQsBuLWgsOBUXqo2IsdPSG5oDgKg9Q7ZdfDJo5xRTQogqr/L/cvBfHzlsqPz3YjfkIPHSXmqYrp9Yc6DK04yHXueCyM5h5kPbTK9C+9Q1usAO9R6hTgJvUiUooQXMFqoeyp9Y5JF0KEINUcCjAWm1mb5vW4fEbZrCL3ZoSIbyIA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2041.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:167::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.14; Sat, 27 Aug
 2022 17:31:10 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8%4]) with mapi id 15.20.5566.019; Sat, 27 Aug 2022
 17:31:10 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: =?utf-8?B?UGFsaSBSb2jDoXI=?= <pali@kernel.org>, Michael Ellerman
	<mpe@ellerman.id.au>, Joel Stanley <joel@jms.id.au>, Benjamin Herrenschmidt
	<benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH v2] powerpc/boot: Don't always pass -mcpu=powerpc when
 building 32-bit uImage
Thread-Topic: [PATCH v2] powerpc/boot: Don't always pass -mcpu=powerpc when
 building 32-bit uImage
Thread-Index: AQHYuhp7k37dhRsWc063Etn2tgkb7a3DAWGA
Date: Sat, 27 Aug 2022 17:31:10 +0000
Message-ID: <63f4bce4-7965-9bc6-2104-42e26acd0208@csgroup.eu>
References: <20220820105200.30425-1-pali@kernel.org>
 <20220827133900.16634-1-pali@kernel.org>
In-Reply-To: <20220827133900.16634-1-pali@kernel.org>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 648b3fca-7e86-4a8d-2882-08da8851eee3
x-ms-traffictypediagnostic: PR0P264MB2041:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  J1o7YTP9/zwQBk86PgayeFlivK45pJ9ZWv5muYh6+fjyNM3NfBwHiQ7+CevBiV9nF+Y6VUb0xGelbAmGsC16G7FP4LRU7gXDq1hrXBKH1gD39IdESeQwOR/Zjo9UqgBD21C5v2NZyq1X4pL1+fiPCehBaIGzdohq0CbV0uiXiPgpnEMsW1weeUX2k3D5t/u7rqOFESdoVYax2Ink4GwAShpre8ybOv1yVG9sIZMbfA859Xv4SPourAfMTfAQb5csIz/Mtftq0qFSp1nIXfD7S5bf8YYhDLPEwHT0tA6W8vEwG9c/lMPjhCfSBm756j+d6MWbK4Vr7dwkUq0/KxDj+5ZhoOo+AtUpoVYOtKxPRR6D6jnV3OwoOcEO8iY5mPB5GedeDHMlcZN44o5Yn+9I080px2aKENuxCfS5sVI6mDs4Ew8uAosai+M9K6hliVdqODIpZ5Hr5xbd8AY9IHgZ+DXFNoFp2cTF1s3C/xca+TlaGd/SN0WRAgOsNlG3xL9GFvmkW46uyAL3+Cf3z2Xf5ubh8I3klGS3EnQavo4DKUCwCh+maqfLfH5lJOHll6jRn0+TmZZcPIJZq/OEER+Ao1AGHSkFkLkbzNRc/XLjXE+3pH1pnBBfqZ8YvmHJwFCuJ0Dq/QXBu+BfIdBzHGDF2MCdANvo8bLx4kNQG7tph5jcJsIfx58UpuyhHn5vXmkBceH8S+tPFWF3/MsV2xM86ybqSaVbBIcTPAmKIFgcZWTUt0Yh09wN86TNkUUn6MIr2/ZWYvY7dBQFxduDSZ7t4Hdp9khO56MHY2jUcl/KIk5veZEQmDMa0w3C1poZdkp6vNtQL6bl3TUpnFe1VXp+UA==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(346002)(39840400004)(376002)(136003)(366004)(38070700005)(41300700001)(5660300002)(86362001)(31696002)(6486002)(71200400001)(478600001)(186003)(122000001)(2906002)(6506007)(26005)(6512007)(8936002)(38100700002)(2616005)(44832011)(31686004)(36756003)(64756008)(66446008)(66476007)(316002)(66946007)(54906003)(66556008)(4326008)(8676002)(91956017)(76116006)(110136005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?cXUzTXAzS2JXVGxIcGVsTWQ2bGNKb0dOejR4bWVsRkMvM1R1SndPekhLVVp1?=
 =?utf-8?B?M3RqUVJFb1NPYURsWlg4UFBjbFJxVW9JbGw3cEpYa0IxNnozY3pqcTAwRngx?=
 =?utf-8?B?WU5qSmVhU2QxdEJNd3dCMEpYaEtYKzZPbFNVVUZWaFo1aWlyUU5wUTNIZ1lT?=
 =?utf-8?B?WG1hcnVqYTM3V1NwM3FNVTlqSlVraTY4Q3BCSDlsNW81bUhsb2FjNVYzQy9l?=
 =?utf-8?B?TWxCRzdxYXMzTm5FMllsU2tBVUZoU1hkQlQwSEt2bEZTc0ZLSWp3WFQzV3hZ?=
 =?utf-8?B?dUsvbzdFbFV2UE83OWxOUmNhenNwUUg1OW1SMWZ6czJEcTVmcEU4YVZsOUFh?=
 =?utf-8?B?TWpIbFZ0Z0FpV28zL2RHQTAwYis4ZE03U2YrbDk4ZkhQQkRiTHZJSDlUN3dT?=
 =?utf-8?B?SDN1ZEo2Rko0YkhISkJKVVJML0VvVUgzUjdOR2p6QnBBOE1PQjVMMnZCT0RV?=
 =?utf-8?B?VU5VbS83VEROaHB4TDRTV3hZNS91SXo1MHhqL1FQb1diWk82bVlDeHRqT2FF?=
 =?utf-8?B?RGZaUU5EWjUyWHNEc1FMRUhITVdKMkhUY0IybWxwVWpRSStmc2NxOGR3Nm0y?=
 =?utf-8?B?ZER6Z2pidHFJMGR0a3pMSGREVUJkVEZrYVM1TkNNWkIzZFBvcXFXM01janJz?=
 =?utf-8?B?ekQ0dXpxUW9WaGpsREhoRFpDckNMbjZvQVJKcnNzdnpROEF6WGg5Q3dYdjJ3?=
 =?utf-8?B?MzcrTTdiN2FpYzRVR2NodVg5TGNXZVZscU9XZVBOeGhQTlNyaDNyR1VGWmVt?=
 =?utf-8?B?K0ZqSkJURGpXTEdjb216MXpKNVNmSlN2RU9YZ2Eza3FpTEdIT2E0U3YzdmlM?=
 =?utf-8?B?Y1dWemFaM04vNG5JRDBtMEYvNFRVbWFkVjRNYmM1V2pSYmJXVHMvdCsrT1I1?=
 =?utf-8?B?Z01RV2FFSUZCWTBDTnFyZW1ZaHJkVC9nQnIzeTM0WWJOM1VsTDNtNUd6K3Bm?=
 =?utf-8?B?NTl3WnhHWW1BaS8zQ0NnSTJaMmVUdDdmcE9tY0RqeldJVytRSVpvclhOaFZn?=
 =?utf-8?B?WEhzNXd5K0h3a3R4MGhSVlJ5QXJucG94QitObVZicXVmUzhYQi9ZRzRCZGc5?=
 =?utf-8?B?KzRqMCs2eE1IVzg3SDlCVXF1d2hvU2Jyb3BuYmFxRWRwQWJNNUtQM3haSXBQ?=
 =?utf-8?B?SGRuT0lXTFcreTZpazFFVDIvanZuTmloY1Fla0RMb2JPaXNOaU5vWng0aDVZ?=
 =?utf-8?B?dlNpUk5mZ1QrWmoyRmRaQzYwWVpNNTN5SUp6M1FncytaK1NPNUk1b0JYYzBJ?=
 =?utf-8?B?alZEMzhpcTNYQ0Zzb3RCZUJOU083RkhxREJpN085ckVTVk9jUXRtelhwNjZW?=
 =?utf-8?B?Q3JLMmhCNmU0RUtMZ2J0bGIyV2pJOFZvZmt2ekgvNmJUNWU3dTZycDMzdVZm?=
 =?utf-8?B?SUJVZExVU0Vwa3cyS29kYU45QlV2N2liY216TFB0SDNtOXAxTUR5ZGNpNlRO?=
 =?utf-8?B?Zm9SckNLTlNaZkZ6UmVGT0gzZjQyNHgyamh1bDhFaTVrZHh2UitFRURBbkVK?=
 =?utf-8?B?QWdzbDJ4bFcrZFdvcFUrbjVjNjZSRTljS2RhZk0wako2Nm1sbUpGSGlwd0dU?=
 =?utf-8?B?bHZXbTdNbVAxdGJMM256MmdrWTRZTCtTWlZ3NnBZMlAxUzJJQUNpUDBiaUFV?=
 =?utf-8?B?eGxCVUduRE1paGxiRjIwbksxeCsyd3hscFpaK0RlbSsrTGJ3ZS9pN1dBSGxM?=
 =?utf-8?B?OGhEeUVFc0s1SDdDQlcyVU41TCtrR1JOdXNleG1qRW03SjcrakR0SlNtLzFm?=
 =?utf-8?B?d2xkTTQ3THVncUVHUkZMVFRCQjZWWEpoSEZ2ZVplcE1GQm9sQ1pHWHBjQVNi?=
 =?utf-8?B?UmJLRGowTVR0RlBtcWhpcmFXOTFjb1NWK3JJRFR5dXlDZ1hZSi91Y1hQa2Vn?=
 =?utf-8?B?bVpWb3dQM0grekljRk1FZ2ZlUjJqSEJ5TnBtRXlVZys3dS9JWUdvREphaFlk?=
 =?utf-8?B?U0J6c2pCdDdNVTlVNjF4WFRpWm1tNEllYk85ZnZmMkgvSDlxSkdaRG9mcWFy?=
 =?utf-8?B?QU5mUWpZVjVpSjRPWnlRa216TjlDTThZTStFLzlTdkcvS3Fud3J1cFBhKzNE?=
 =?utf-8?B?anUyT2pEbTVQbldIazZ0TUtZZHlWWUxBb1ZQRHdvZm1TeWYyYnNrSHJoc1Ir?=
 =?utf-8?B?UHlRdlV2LzYrcWhybmRSTzNlMXI2RGFqZFpNa0pGUmt1NGNjSm1rOHgvcFA0?=
 =?utf-8?B?ZlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <419820C3DF63AD42B5E573B72BA34FDC@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 648b3fca-7e86-4a8d-2882-08da8851eee3
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2022 17:31:10.7314
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: scfrWW2k4CZB24S1Jm2x4FhtHAgLu+uy2X/PJESPf5sSuinzyR1edrTawC1pmOcZUMw6u+XaZ0WcnY7oMhdd63Pgg3TZMwflZhBT4y+jUMQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2041
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

DQoNCkxlIDI3LzA4LzIwMjIgw6AgMTU6MzksIFBhbGkgUm9ow6FyIGEgw6ljcml0wqA6DQo+IEZv
ciAzMi1iaXQgdUltYWdlIHRyeSB0byB1c2UgQ09ORklHX1RBUkdFVF9DUFUgb3B0aW9uIGZvciAt
bWNwdS4gVGhpcyBmaXhlcw0KPiBmb2xsb3dpbmcgY29tcGlsZXIgZXJyb3Igd2hlbiBidWlsZGlu
ZyBrZXJuZWwgd2l0aCBwb3dlcnBjIGU1MDAgU1BFIGNhcGFibGUNCj4gY3Jvc3MgY29tcGlsZXJz
Og0KPiANCj4gICAgICBCT09UQVMgIGFyY2gvcG93ZXJwYy9ib290L2NydDAubw0KPiAgICBwb3dl
cnBjLWxpbnV4LWdudXNwZS1nY2M6IGVycm9yOiB1bnJlY29nbml6ZWQgYXJndW1lbnQgaW4gb3B0
aW9uIOKAmC1tY3B1PXBvd2VycGPigJkNCj4gICAgcG93ZXJwYy1saW51eC1nbnVzcGUtZ2NjOiBu
b3RlOiB2YWxpZCBhcmd1bWVudHMgdG8g4oCYLW1jcHU94oCZIGFyZTogODU0MCA4NTQ4IG5hdGl2
ZQ0KPiAgICBtYWtlWzFdOiAqKiogW2FyY2gvcG93ZXJwYy9ib290L01ha2VmaWxlOjIzMTogYXJj
aC9wb3dlcnBjL2Jvb3QvY3J0MC5vXSBFcnJvciAxDQo+IA0KPiBGb3IgNjQtYml0IHVJbWFnZSBh
bmQgNjQtYml0IGtlcm5lbHMgd2l0aCAzMi1iaXQgdUltYWdlIHdyYXBwZXIgdGhlcmUgaXMgbm8N
Cj4gY2hhbmdlLg0KPiANCj4gU2ltaWxhciBjaGFuZ2Ugd2FzIGFscmVhZHkgaW50cm9kdWNlZCBm
b3IgdGhlIG1haW4gcG93ZXJwYyBNYWtlZmlsZSBpbg0KPiBjb21taXQgNDQ2Y2RhMWIyMWQ5ICgi
cG93ZXJwYy8zMjogRG9uJ3QgYWx3YXlzIHBhc3MgLW1jcHU9cG93ZXJwYyB0byB0aGUNCj4gY29t
cGlsZXIiKS4NCj4gDQo+IEZpeGVzOiA0MGE3NTU4NGU1MjYgKCJwb3dlcnBjL2Jvb3Q6IEJ1aWxk
IHdyYXBwZXIgZm9yIGFuIGFwcHJvcHJpYXRlIENQVSIpDQo+IENjOiBzdGFibGVAdmdlci5rZXJu
ZWwub3JnDQo+IFNpZ25lZC1vZmYtYnk6IFBhbGkgUm9ow6FyIDxwYWxpQGtlcm5lbC5vcmc+DQo+
IC0tLQ0KPiAgIGFyY2gvcG93ZXJwYy9ib290L01ha2VmaWxlIHwgOCArKysrKysrKw0KPiAgIDEg
ZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bv
d2VycGMvYm9vdC9NYWtlZmlsZSBiL2FyY2gvcG93ZXJwYy9ib290L01ha2VmaWxlDQo+IGluZGV4
IGE5Y2QyZWE0YTg2MS4uZjU2YTVmOTBhNWQ4IDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMv
Ym9vdC9NYWtlZmlsZQ0KPiArKysgYi9hcmNoL3Bvd2VycGMvYm9vdC9NYWtlZmlsZQ0KPiBAQCAt
NDQsOCArNDQsMTYgQEAgZWxzZQ0KPiAgIEJPT1RDRkxBR1MJKz0gLW02NCAtbWNwdT1wb3dlcnBj
NjQNCj4gICBlbmRpZg0KPiAgIGVsc2UNCj4gK2lmZGVmIENPTkZJR19QUEMzMg0KPiAraWZkZWYg
Q09ORklHX1RBUkdFVF9DUFVfQk9PTA0KPiArQk9PVENGTEFHUwkrPSAtbTMyIC1tY3B1PSQoQ09O
RklHX1RBUkdFVF9DUFUpDQo+ICtlbHNlDQo+ICtCT09UQ0ZMQUdTCSs9IC1tMzIgLW1jcHU9cG93
ZXJwYw0KDQpZb3UgY2FuJ3QgZG8gdGhhdC4gWW91IGdldCBoZXJlIG9ubHkgaWYgdXNlciBoYXMg
c2VsZWN0ZWQgDQpUT09MQ0hBSU5fREVGQVVMVF9DUFUsIGluIHdoaWNoIGNhc2UgeW91IGRvbid0
IHdhbnQgdG8gZm9yIC1tY3B1PXBvd2VycGMuDQoNCi1tY3B1PXBvd2VycGMgaXMgc2V0IHdoZW4g
dXNlciBzZWxlY3RzIENPTkZJR19QT1dFUlBDX0NQVSwgaW4gd2hpY2ggY2FzZSANCkNPTkZJR19U
QVJHRVRfQ1BVX0JPT0wgaXMgc2V0IGFzIHdlbGwuDQoNCj4gK2VuZGlmDQo+ICtlbHNlDQo+ICAg
Qk9PVENGTEFHUwkrPSAtbTMyIC1tY3B1PXBvd2VycGMNCg0KU2FtZSwgZm9yIFBQQzY0IEkgdGhp
bmsgeW91IGRvbid0IHdhbnQgdGhhdCBlaXRoZXIsIHVubGVzcyB0aGUgDQpDT05GSUdfR0VORVJJ
Q19DUFUgaGFzIGJlZW4gc2VsZWN0ZWQgaW4gd2hpY2ggY2FzZSANCkNPTkZJR19UQVJHRVRfQ1BV
X0JPT0wgaXMgbm90IHNldC4NCg0KV2hlbiBDT05GSUdfVEFSR0VUX0NQVV9CT09MIGlzIHNldCBm
b3IgUFBDNjQgeW91IGFsc28gd2FudCANCi1tY3B1PSQoQ09ORklHX1RBUkdFVF9DUFUpDQoNCj4g
ICBlbmRpZg0KPiArZW5kaWYNCj4gICANCj4gICBCT09UQ0ZMQUdTCSs9IC1pc3lzdGVtICQoc2hl
bGwgJChCT09UQ0MpIC1wcmludC1maWxlLW5hbWU9aW5jbHVkZSkNCj4gICA=
