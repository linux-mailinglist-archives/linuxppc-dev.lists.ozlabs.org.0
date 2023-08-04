Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D2752770582
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Aug 2023 18:03:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=P0EtQimF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RHVqy3WKzz3cTy
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Aug 2023 02:03:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=P0EtQimF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::61f; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on2061f.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::61f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RHVpz2qP2z3cJl
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Aug 2023 02:02:34 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Su5j3sxuQVa0zD1XT4/2OOhlYS2G/tM3b3lVf5jkdt1B+cZISg0Ljrkb8+JesWZhQPxOIrHkBxcQgEplzcOUowKUXiqLcLv14eNMJr9BylG01kEwn/iYuGXe/XcYApq1I9bSppmT6CCwf05LNzixdG9MnALTdNRXbHHtubZsk/qGjdZqWrriuOgWSvk/KKDJlcaJU/asY2mY5Pv1oMCenzVZR0p8FjHfJl81/an6IfOAl//Gr8P45QIjZoFVSPPpVD6HAUFz+PYh7LTmewkxIP2OiFquVhRWqTsq12z0EOy9QlXgAKeia9C60wXgMGzaN3U3wnV3JuRBD3W/1ho0iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+55Tlq7GKhQhSFBoQ7f/sHRV2wJ5TN94oiD3ffcRQkI=;
 b=Mfzvwi6VnwN9sQIiB3eFMaJFG+IB7PcA6Yf65pa6QapwBQCPcicoYtsQW5y+bTsblEscEBD6XmA4UFwGNN4P1fRfAnJozt/IWCaVcdW5babv5IBpaA47S3wR+KzTz7d2wOzxRI8Gaj6HpAwR6fqMam7Owy8CSyif4sUggvWNygrrqH4AcB7+Q7oEm6DeuYL4RiVLHRvA+YGsBoNaqKlDdkHMbSiZPJKmkpZcoAv7GVNB4XhvDVVz9ELetVKKOngWl0tC1RMITCcPud/K+1p3vCf8gzI1oB1cB6j8+eOcItu7yhayGNQtlcn1NFmVON+9mNL6bB/eR28dUVRL96SUFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+55Tlq7GKhQhSFBoQ7f/sHRV2wJ5TN94oiD3ffcRQkI=;
 b=P0EtQimFa5fKOD3VY0dQ9VvB122SXFkv231xAtIEDBXNrFJBcv00gVwsziLxHEMe4DHd+iHOQwZFVgPUItJhke5sn0p2pb3FysRhaZkmv6NuyvP5HAhCFs7cGafoqpC99C3AEJhEaQWNPacxXA2+AUFG7rb0fu/Y5S/dNMHMt2i1irrTGsSw5oDf+N+/WELARxEge29bkGNwU+/wSR9cv/sqI5x78WjCPif1c/acKMuxftrW7A0eKt1KxFT/H0LwXDAaNWasy+emiEzuGi7qeN2Nfw1IzBAdhx0sxAjP0rRVbX/K7md//QcLD9APz2W4yTVzJ4kCOois483H2uA9Jw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB2350.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.21; Fri, 4 Aug
 2023 16:02:14 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e%6]) with mapi id 15.20.6652.021; Fri, 4 Aug 2023
 16:02:14 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "hanyu001@208suo.com" <hanyu001@208suo.com>, "mpe@ellerman.id.au"
	<mpe@ellerman.id.au>, "npiggin@gmail.com" <npiggin@gmail.com>,
	"Liam.Howlett@Oracle.com" <Liam.Howlett@Oracle.com>, "vbabka@suse.cz"
	<vbabka@suse.cz>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"dave@stgolabs.net" <dave@stgolabs.net>, "willy@infradead.org"
	<willy@infradead.org>
Subject: Re: [PATCH] mm: book3s32: add require space around that '?' and ':'
Thread-Topic: [PATCH] mm: book3s32: add require space around that '?' and ':'
Thread-Index: AQHZutysRQ/Dg2tbakeTaFSUvGQ4qa/aZFaA
Date: Fri, 4 Aug 2023 16:02:14 +0000
Message-ID: <1b4a2827-8cdb-92f4-e4fd-a8623d6bf7ce@csgroup.eu>
References: <tencent_78C62F88E268136A2FCE91042CAB212A7709@qq.com>
 <44c1e39667c838d00c9dbb007184ccf1@208suo.com>
In-Reply-To: <44c1e39667c838d00c9dbb007184ccf1@208suo.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PAZP264MB2350:EE_
x-ms-office365-filtering-correlation-id: 9103963f-1de7-44bc-1c12-08db95042b54
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  yQk5BcFXhBLKRvUt1sr23o98RKoxvQUUIOOpFFQIL+6KMyqfWj2Iy57hmswlRDmaYOePCehtCFPcTlP/PR8LdsOqIF8BKo5VNQuw6dsIflQk6Sa3lCoGjSyz9cNbVjYdptaNzxPEPojNOjrp3YpKnOJ4XDdCNmJF0Fgchl+rmLJrXHIziHaR1mu5XfJDUhecAVI7b8EbvVTVsrIA1O4ehjWlDRocTjAWv8XEAwu4eFzGNRguxJc7PLR/9PpEbHK0DPS3lth7hpABARee7+JRoDxbaJ285HWqEdNqDtg4qP+Yyiof0fxhGl9ecc2Bm460FwqLD0z1EwQ6+OX4dq4nQvp24NS5dxhNCd7rmgS2r4dqy0AlGKfImy5uJL0ppEQOTk7LbPQw9uPXoa1FBZjjSru5J239fdRFozPIMtKObKqBx3nTD8KAB0gACFRMEV5mXgzIKvXYKXgKR3LHMOpzIKfI3Ry/5Jp50rSmx5/dx998CZc5D1I+3s0gglwYZNkkwriszaQAcnzT1+IernFoKo6/vWZQM5zZ3kjiLuJIGHL3MStFWhj2gsXfXb0I8sQ34SIm4NHNw4KGpCfSS/eMpwy2NVOeNRBHICLnENkouppSTexEzrygysadwlPMKpTgcMKco7QEZICz+sWv0zxDsPTV+KWRMdwTwSQu14rvHc9gNrCX5oPvfAg88biW/QlT
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39850400004)(366004)(136003)(376002)(346002)(1800799003)(186006)(451199021)(8676002)(8936002)(26005)(36756003)(478600001)(6512007)(31696002)(86362001)(6486002)(71200400001)(31686004)(316002)(41300700001)(5660300002)(64756008)(4326008)(66476007)(66946007)(66556008)(66446008)(44832011)(83380400001)(7416002)(110136005)(54906003)(2906002)(91956017)(76116006)(6506007)(2616005)(122000001)(38100700002)(66574015)(38070700005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?ZGpIM0dTUEw1NVBJQmRWRGNtZ2lVdFdoMWhZUmFacTFZWjdhWEREMXZ3NXNS?=
 =?utf-8?B?NTlLVVF6M2Y1OHdVbFpjYnpIQkI0R1M4SFlnTWZDQWgrK1FGRmFJU2g5a2th?=
 =?utf-8?B?VzhsUEN3bDF1VmJXb3VYZ0lybW42aDZoVkZQL3lvcUtqNDRyUWJjYVQ0YlBt?=
 =?utf-8?B?VDYvUlpEWUpsOXpkYWdlQzBZVC9SMmRNRDF2ZDFDUnpPaXZuQ2xURC9zNkow?=
 =?utf-8?B?OVU0Uzg5aE9jRnh5UUNGbnZmcVVmT00yK25qa21ZYm1hNHp3ZDkycGdDNEsv?=
 =?utf-8?B?SFQ0VkYrTHVMb0haZVlSY1h1cFRVdDR1UnZFNmhrZ0o5R1BPL1pUQmlDNGJa?=
 =?utf-8?B?SGUxSjRrZlBpNGMzK3BnSWg3WUF2WnlTU2RWbTdwSnNCekdud093NFRuMERY?=
 =?utf-8?B?aHRPSmJDVEJLdU9VNkxRLy95SUw1TXUyODlBUGdnaVc4bDZMUGJVbEJEN0xi?=
 =?utf-8?B?UmRhV1l5TEJ5MmxmcG1rSERCbGhQbUdnOXpjNktPY25aTVJIakFBNTQwbWgw?=
 =?utf-8?B?TWNDM3pJYzh3SVFNOTZhQ3NOckQvekVKWjFlU0poYmRwU0F3aEp4M08rL2F3?=
 =?utf-8?B?RkdrYmh5Y1ZZRFRLSmZqN1k2R0tsbXRiM0xpcTVXQ2ZrMjFMSUdTUzJUQ2to?=
 =?utf-8?B?Y0o0VDFabkFCVmsrNGVqa3pCTWhOaWRQNU5aeWUrSHZtLzlaL0ZqZnRWUGdW?=
 =?utf-8?B?VXJqU2xCcWRTRHFiVEY2SmVjMXBUQUhZSS80QmRNb0F5NDJ6a2VoM2thN2JO?=
 =?utf-8?B?MTZZYlZWMXNoNkdqZTd6Mm0vNEdhbnZTUlhFbFV2NW9NV1UyOHF4bGFvUVJo?=
 =?utf-8?B?TkxBbUFGbXhKSisrczczTmEyaEVlcHptZjJLSS9vdzI4MHduVnhQZ2RlUnFF?=
 =?utf-8?B?TVNWZUpkdEU5amFCUXp1ZXJIYUxXaUNLWE1EakZwajMyOUZFWE9BRmI1SlZF?=
 =?utf-8?B?ZVZpRHkvR1g4aUZOQWhIMGlRK1ZFSUhTMjVVU0xTS1ZiQkIwenBiaWpNWXd2?=
 =?utf-8?B?Q0VRSHZscXFweDdsK1YyZ1YvSDhldElWaE9NY3lhQXBUTzBQaE9QbVhuSGZX?=
 =?utf-8?B?MWkxdXFNdTZuUVhZVVd0YWRDM1V1LzAyaUU1ODh0Q0NrSi9vVGVKdit4am9o?=
 =?utf-8?B?Z1BHMHZkWkdIZWtBUkEzQmZDZ2JUMmVNdjY5c1FQbGZkOUp6T3ZGTmFxcG1h?=
 =?utf-8?B?OGEwdlZPSDFPRUt5bkhYbS9IeEdCNmExQmk2RnJVRUl2M0VDYWNpNkQ3MGpt?=
 =?utf-8?B?c2dKWEhoTEQwYXNVVEd0WkhZcFRtbWNJcC8vclR4aUZQcVZ1UldJZzVqWmRJ?=
 =?utf-8?B?ZzNRY3B6SkRxNXRvcHhxUTZYbGdzVUpOYWFQdWNZWitaL1JxYlVTbXNwYWI4?=
 =?utf-8?B?bHFSRi8vOHpmVXByUzROam5wc3J2Um1kRFpWZVc5TXZUTStLUkY2RFVBekZ6?=
 =?utf-8?B?SUMzWGh4M05UMWl3UXJvdjZzSTd6UlBmSTkyUjVURC85Vnp2Y2V3WDhNRW9H?=
 =?utf-8?B?WENWQjB0bGFTbGlMRnNEY0xkQ1NzYk9GU3VIVDdUMVYxSVpNd1RmZHpQNXZT?=
 =?utf-8?B?ck44by9HNWhzTXpnbFMyTlJPbFMyR1NjUllSS3hoNmhuUlBrL1hDZE13Q0tW?=
 =?utf-8?B?bDVNa1BXNVVKZDBoS25uWDI0ajUxRjhmYUpJWFJVSEwrNXhTUVlOWHI4d2xL?=
 =?utf-8?B?QTJmVDN5VEZMRFNwa2tLTHFEMnFReDdTRVNwQzBlcGFNL3NwV1h2Szc3UFk2?=
 =?utf-8?B?VnF4dlFvOE8zdHh3ZGRUYXhpS2FJKzFWQUJ2TFdJOFU1TkZpdjhrcWdpVXFr?=
 =?utf-8?B?RjJrcklDLy9ObVpWbTdrN1lrRWI5V0ZqaHJnbVVnb2dPSktCalE1VEpHWk13?=
 =?utf-8?B?bXhmb1lRK25FcGpPNEtTRW5qdExNa3RqcDhsRWVDWTJzNE51RUEvb2hZU3BB?=
 =?utf-8?B?ZDBlb2RwaFljRGZ2L25tV3lnU0lOSGdSQlBCZXlTalNNOUlmNS9CSFlxVXEy?=
 =?utf-8?B?QkdKaXlKbFZKd0xEZTF2aC94ZDRPQ296N3h6YVNGZUpieVpiK3ZFeG1pOWRJ?=
 =?utf-8?B?ejczeVVKNFpHRFpZUnVwZkZQekRXc3puRlBpc09NTitRZC9rU2FNamhiY0pC?=
 =?utf-8?B?Q0o1QTFQejluVjVrRDloTFBKdnVLeVhaYTJBei9sVGd0S3FUdERMODJvb2ZO?=
 =?utf-8?B?d0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E8D3EEE13299E94F8D8CF2EC7BA09C64@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9103963f-1de7-44bc-1c12-08db95042b54
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2023 16:02:14.1844
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kBevewfXWn8heEau3e5IHcRdQATkQUQWn5XD/of2+SSB2mIxvZ61kt+/UC5bGx6ORtqn1ko1V3VKHIjx+PEl4YZxvUTGuq8WEeXKddsvSFE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB2350
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

SGVsbG8sDQoNCg0KTGUgMjAvMDcvMjAyMyDDoCAwOTozNCwgaGFueXUwMDFAMjA4c3VvLmNvbSBh
IMOpY3JpdMKgOg0KPiBGaXggYmVsb3cgY2hlY2twYXRjaCBlcnJvcnM6DQo+IA0KPiAuL2FyY2gv
cG93ZXJwYy9tbS9ib29rM3MzMi90bGIuYzoxMDI6IEVSUk9SOiBzcGFjZXMgcmVxdWlyZWQgYXJv
dW5kIHRoYXQgDQo+ICc/JyAoY3R4OlZ4VykNCj4gLi9hcmNoL3Bvd2VycGMvbW0vYm9vazNzMzIv
dGxiLmM6MTAyOiBFUlJPUjogc3BhY2VzIHJlcXVpcmVkIGFyb3VuZCB0aGF0IA0KPiAnOicgKGN0
eDpWeFcpDQoNCg0KQ2FuIHlvdSBwbGVhc2UgZXhwbGFpbiB0aGUgcHVycG9zZSBvZiB0aG9zZSBj
aGFuZ2VzID8gRG8geW91IHVzZSBzb21lIA0KdG9vbHMgdGhhdCBnZXQgZGlzdHVyYmVkIGJ5IHN1
Y2ggY29zbWV0aWMgZXJyb3JzID8gT3RoZXJ3aXNlIHdoYXQgaXMgDQp5b3VyIHJlYXNvbiA/DQoN
CldlIGRvbid0IGFjY2VwdCBzdWNoIHN0YW5kZWxvbmUgbWlub3IgY29zbWV0aWMgY2hhbmdlcyBh
dCB0aGUgZmlyc3QgDQpwbGFjZSBiZWNhdXNlIGl0IGxvb2tzIGxpa2UgYSB3YXN0ZSBvZiB0aW1l
Lg0KDQpJZiB5b3UgaGF2ZSBtYWpvciByZWFzb25zIHRvIHdhbnQgdGhvc2UgY2hhbmdlcywgcGxl
YXNlIHJlLXN1Ym1pdCB3aXRoIGEgDQpkZXRhaWxzIGV4cGxhbmF0aW9uIGluIHRoZSBjb21taXQg
bWVzc2FnZS4NCg0KVGhhbmtzDQpDaHJpc3RvcGhlDQoNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFl1
IEhhbiA8aGFueXUwMDFAMjA4c3VvLmNvbT4NCj4gLS0tDQo+ICDCoGFyY2gvcG93ZXJwYy9tbS9i
b29rM3MzMi90bGIuYyB8IDIgKy0NCj4gIMKgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL21tL2Jvb2sz
czMyL3RsYi5jIA0KPiBiL2FyY2gvcG93ZXJwYy9tbS9ib29rM3MzMi90bGIuYw0KPiBpbmRleCA5
YWQ2YjU2YmZlYzkuLmRlNGFiZmUzZDA2YiAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL21t
L2Jvb2szczMyL3RsYi5jDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9tbS9ib29rM3MzMi90bGIuYw0K
PiBAQCAtOTksNyArOTksNyBAQCB2b2lkIGhhc2hfX2ZsdXNoX3RsYl9wYWdlKHN0cnVjdCB2bV9h
cmVhX3N0cnVjdCAqdm1hLCANCj4gdW5zaWduZWQgbG9uZyB2bWFkZHIpDQo+ICDCoMKgwqDCoCBz
dHJ1Y3QgbW1fc3RydWN0ICptbTsNCj4gIMKgwqDCoMKgIHBtZF90ICpwbWQ7DQo+IA0KPiAtwqDC
oMKgIG1tID0gKHZtYWRkciA8IFRBU0tfU0laRSk/IHZtYS0+dm1fbW06ICZpbml0X21tOw0KPiAr
wqDCoMKgIG1tID0gKHZtYWRkciA8IFRBU0tfU0laRSkgPyB2bWEtPnZtX21tIDogJmluaXRfbW07
DQo+ICDCoMKgwqDCoCBwbWQgPSBwbWRfb2ZmKG1tLCB2bWFkZHIpOw0KPiAgwqDCoMKgwqAgaWYg
KCFwbWRfbm9uZSgqcG1kKSkNCj4gIMKgwqDCoMKgwqDCoMKgwqAgZmx1c2hfaGFzaF9wYWdlcyht
bS0+Y29udGV4dC5pZCwgdm1hZGRyLCBwbWRfdmFsKCpwbWQpLCAxKTsNCg==
