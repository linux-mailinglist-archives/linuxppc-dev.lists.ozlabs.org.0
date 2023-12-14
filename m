Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC83812A85
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Dec 2023 09:38:09 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=Y7SW8rSz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SrQjB5Bc8z3cZ4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Dec 2023 19:38:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=Y7SW8rSz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::605; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20605.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::605])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SrQhL3WfLz2xmC
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Dec 2023 19:37:21 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qc6Q3tGD6kLEorqOBALGc3APMhsiouaEcyZjlYvByKLpGJ/xWyavUL/eEfLRKG3BvDB9EJgTxagmFE30mrGb2J+rgZRUAu7nmgx5zX62lrU5fkulXMKYHHFbmJjfTxHi0sb75EarIp9PGrJ67v2zBrT91JWxHBUkgaBANw1xkW+SW9zuqjlb+FkDwNm2Ctr+2lBJVhuPe+LYlAgnghhZlEQYzkCOg2MYJ4dkbkqR0M8AGocToR1TKrINt4B/Zcq4mNKUJ8PykFtxNhHTW/tRwh+LiWqByYs5CwXXOWrvNSXy5isAND2haJWwUMIjUxwmntqDBLMLu4+uAOSWx/MbbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NS3d8j/q2pm5rCgu8r63d9ByEtjQ/QwPpQkJ7ZWOuho=;
 b=TmgiMKLaYjuppI7mIpslvlJ/GtATYcfmKWhtsNTCHPSSyM9pldTudB4+KqKgnNqYGyciWHeHgpEfRiv+JmGbDCU8KF5Ljh6bykb4nM0vpDutVqEINgCRrB4wrvdnG/DGflG0wR4mK+QVPn4RjAUppATJCOKsHtstFF9tMMGxVTFY+uHnJIu/W289kPLc5saAzfiifpW9xvdjRyIxbhu8ZjD+IgvEGZX1FXsXJjJsU3iMBv5NZmHFXWgwGPeVCxNI6UMlwhoLeaZ5Hh5SHV98nv2276PH/NCdxM0zPKxuyIdgpsZiOEYjAHfKWQQzFtfVpawJmeQOQm4KR1AOK3CbIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NS3d8j/q2pm5rCgu8r63d9ByEtjQ/QwPpQkJ7ZWOuho=;
 b=Y7SW8rSzrYWbER4yddisqnfBz0UCG9W/GPUSrAjPhXTF94rBjTVUfWsHoGws/g6S1C83QItraDxLAQcqpPrajoMMC0G/1MyV097wHvxclFj3Vj1B90Em4vTBPsRlS4CyFeWJ9YElOsGk6Wpq2deeekORWnYoeMoTQGTkKpT9Ap7zAF1MmVhAYKwMO06wpTNgmLstDgVfY2RYjiuBkr0d4EupqzCoa5yMOogj7668zQqyFu+dIn/JVfDFQTfvZ6GD+bq3YpfAwyTjv0D/ZCcuWo2TenT2K1yjcatmynAmax4pl9pR0E8JybKQrEyfGTfwt+twEycuKQf0cjqDRVXSUQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2370.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:33::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26; Thu, 14 Dec
 2023 08:36:57 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f788:32b4:1c5e:f264]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f788:32b4:1c5e:f264%7]) with mapi id 15.20.7091.028; Thu, 14 Dec 2023
 08:36:57 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Nicholas Miehlbradt <nicholas@linux.ibm.com>, "glider@google.com"
	<glider@google.com>, "elver@google.com" <elver@google.com>,
	"dvyukov@google.com" <dvyukov@google.com>, "akpm@linux-foundation.org"
	<akpm@linux-foundation.org>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
	"npiggin@gmail.com" <npiggin@gmail.com>
Subject: Re: [PATCH 02/13] hvc: Fix use of uninitialized array in
 udbg_hvc_putc
Thread-Topic: [PATCH 02/13] hvc: Fix use of uninitialized array in
 udbg_hvc_putc
Thread-Index: AQHaLlJJ+Qmq98QSSk65tBcfvtQ1DrCodL8A
Date: Thu, 14 Dec 2023 08:36:57 +0000
Message-ID: <aab89390-264f-49bd-8e6e-b69de7f8c526@csgroup.eu>
References: <20231214055539.9420-1-nicholas@linux.ibm.com>
 <20231214055539.9420-3-nicholas@linux.ibm.com>
In-Reply-To: <20231214055539.9420-3-nicholas@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB2370:EE_
x-ms-office365-filtering-correlation-id: 789fd0ea-574c-4686-f86d-08dbfc7fd5a4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  4XAnzuvBVDh+P85ZBeUGN7YAx3PO4U7gkdKhAofs0TPQGuMXQEfgeJnSPkyn8bo9+nolZP3UNJHBDA0X4ylgXXpLZKkIx16KyBxPcwRfkW4fS3pVLgKuI4twXXHWtWi3LW8J9yksOKBDCP23JNNp/Le58948tI+OkRu2IdyYYk2pjXmzAMZz3nThlrhoayIkRN51Swbz0Pih6b/1GMt1PkZYcAnP/V7IeQcUfYZakshb8NxSR6PzpRTQEfkPAm9wYaukSozYQvaKLfWjlD16b32+MP11kh9iVsmsJta6JJ+d4QiHFywrqvpfghNDSE4DAVyPS3sgcgXdtBSNK6V1B2v3N0sSirVgpNHhGU89XUT0R3FAgaKR50I+6f4YD1l0gZ7GPiClCwVhi35gat1mFji2cKuxgub/aDlyZwcNqgH/2bKh/zM5pk8Z9KweiVDQ8vOiDttH6bji4yju2990BRaz8aTnQYaFrv/pQoTe2hX4K3ZD6i/UXKuVbiTySz6VPkxDYhlw9q9rFBIUPNtbleMfvxpytlkgmrR7KJLDsKYYKJpKcCTLUNdMHwdiF0wOgWnXrq/ruoHpbBgUJk56grah+iNlwDV2swEeqR7eR/f/BB9QObgCTUsRXjTW9LjkWfY+SWqq5kPri8oIV7mWYEGdTU8q0ueUIqwBzNE+F4tNrJlyfUa0w9gZlnRZpV/7
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(346002)(39850400004)(136003)(376002)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(31686004)(66574015)(26005)(2616005)(6506007)(122000001)(86362001)(38100700002)(31696002)(38070700009)(36756003)(83380400001)(6512007)(76116006)(5660300002)(7416002)(44832011)(71200400001)(91956017)(8676002)(6486002)(66556008)(110136005)(64756008)(66476007)(316002)(66446008)(54906003)(66946007)(41300700001)(2906002)(4744005)(4326008)(8936002)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?bVpnalpXZWJhR2RmZER5Syt2T3p3V05wVGxtTk55NGkrU0M3WUxqcTJVZHNy?=
 =?utf-8?B?eWhvbFRwTVJ5bHNjRDYxOEQxZS9ZNmxPUE83Y0dnRzl0WkFvWE9FTlNEMTBv?=
 =?utf-8?B?WGNaSXNHaHd1QnpuWkN5ZEtRQ3N5M3RtTzArdVJVTzNQYVN0MUJvbjdDODNj?=
 =?utf-8?B?dXZ3ZDlSOVhCa2tPeUpBWFg5WCs2VVh4QVRzS3NpLzNURkJ3V1I2ODNYcFBt?=
 =?utf-8?B?aG1tNHRhRDJUWjNiZWtEWHFncVlMTjdhOVRibCs1NVBHOVQ4N1VnZXdHQnlD?=
 =?utf-8?B?TVdqK1U2WXdhSDJIMmhLSURSYnR0N2Eybk9rN3p5MlFNdm81NzdqYkZ1Q0xY?=
 =?utf-8?B?T0wxdlpmUzgyeThIYVpTamRWR0xPKy9VZFVmdjV2MEg0VDVIbFZZaG04L2RO?=
 =?utf-8?B?T1NJMnVuRnJEK1lFeitBckFiWmhuWmJwUFo2bHVzM0czZUM1NUhYSWEzM1Bn?=
 =?utf-8?B?TnFrbEc4ZTU4L21wU21kZ0FuY0s1dEpJcHhqcEFNOUdjNjljNHpOeGJEMXFR?=
 =?utf-8?B?T3RJUkpseFJzWktwK2U3NU41TWkveTdtbEljMVB5RklLVFBoQW0rVUJqaFhw?=
 =?utf-8?B?OGpxM3FpYXd2R3RwTjY3ZloxYmNFOEJYenVJaGlQYml6ZmZyTVNwelFhRUc3?=
 =?utf-8?B?K2FkUlFNOGZXT3ViZUdPbFYrZ2FxMjREZjdlOTk2VFpCNWRhWTMydG5YM3d6?=
 =?utf-8?B?V0d6OVJFRmdoSXYvdnRYL2M5WFZSa0hkNG9GVFRMNGVMS0haSWtuMXhLSURp?=
 =?utf-8?B?SzhvMnJYSXNCZ0dFYUpBSXNOR0lNUzIwR0ZYdXZqQ2NRMlNqZmU5VWNtaWpu?=
 =?utf-8?B?LzJnRnBMa1N5YW5ZWjVmQTIvT1dneEtEa0dKVjlnay9TQUZxTXZsTENrOS9t?=
 =?utf-8?B?TENaRnl1R1RtQVEwN25lR1JjMldBK0pYNVhEWDczNk1Qc3ZMNDVIb090UmJX?=
 =?utf-8?B?am5MN1BteGR5OHNrV1E1cG9GcjN4TXFVU3NvT3VabjZQa1UrOWFHOWs5aVBv?=
 =?utf-8?B?RTEzalNOYzZ4YWZjSE9Sb0hDdmlzbU94bmNvcS9ESzJlSkFLUEVIMkVuK0lM?=
 =?utf-8?B?R0svOEQrN1ZoOHZtVDZqUVYrOEdhMnlvMzBMRTV4Y05tU3h3OFJXT0ZyWjU5?=
 =?utf-8?B?aFlmd0h1T0xnY2luNDZvdEQxMzViZUlyWXZzWFFvQmljRm5WVjlMdEFpeTIr?=
 =?utf-8?B?RjhKVnZNeldVVW5uT0Y2eWFmV29LaG1ucU13NmRDWi9HdEVhY2pDdU1leWYz?=
 =?utf-8?B?ejRXYjJwQWhlNE11ZUlmSG9hVkk5eExCY1JQQWh1ZklNdmo4RDhsbkMzbXdT?=
 =?utf-8?B?NjBIRUJ6amtwd0dDTHpWYnZWMldaeWRYWkZ5T2RKdXcxbTk1Mm80VEtmQjBL?=
 =?utf-8?B?ZzBqcGx1RDNSN0VqVml3eVlFYUsraHBLUmJBUFozWGhnQ2x1LzEvc2IwK0dE?=
 =?utf-8?B?VTM1MU1pc3VNbEcvWVBYb2pLY1R1ZC9QWjVrRXM3czJYQ1pkai9jQnU2c0R4?=
 =?utf-8?B?R1FtWGwrMHRIckV3VFRnUkxFY1RqbFJGaW9OWjBYZHdmS0ZqTVB3QnFuVTlG?=
 =?utf-8?B?OFQ4eENlVkJIYVBMQ3dvYThuaTdLdmN0SGF1dXNpVllhaFpFUUR1ZGkwQ0ps?=
 =?utf-8?B?bEpIOEdXbm8xRTF6U00zSFRwMFVJVFRkMDR4NW9DV3lsUmlNUUxOTWVpU251?=
 =?utf-8?B?QlVwSWhDaEFYbEJtOUFxNjZEM2NWRGZlazdaUnBkb201Z0tkY04vdzlDNVRZ?=
 =?utf-8?B?b1dHa3IrRGpnVW1jeUJndTNxSWs3U3dSTmZsTjgrWjVhTnFUbmxrbWFyWjFC?=
 =?utf-8?B?N2pMNGxiaGZGSmZlR090L3g3MUpWTWRtRm9lektYbDFPSm1qempVS0RBVGZK?=
 =?utf-8?B?K1RDWTR3cWZzZHU2emUxNUdZUmZpOExvWkhpTEJ0bUZWNXU1a20renh4MXlI?=
 =?utf-8?B?OFovbXlTaXI1TVBWc3dRTElSaU9kT1B2TERQUC9BdVZvdS9LQ0t4WjFreWxv?=
 =?utf-8?B?NlVscmVyZ1IyYVVOOC9weEZGVFdnTDFHY2Y0NzZleVRNc3MvanlBYTE1ZDEw?=
 =?utf-8?B?L2VOd05lcUZRZTFIWFV5Yk9SQWJnNFhaV29HZEE3WHF0cGdkd3VDRkNURWl0?=
 =?utf-8?B?b1poR01IU1ZHbzBxWFY3R1JmVGZQRlBVSWVkZEcxR1JIT1Bnald1akdFOFNH?=
 =?utf-8?B?cnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <729BB947E358D8408A7216C0B2179CE2@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 789fd0ea-574c-4686-f86d-08dbfc7fd5a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2023 08:36:57.8188
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7+KqI5d7rnwmjPdLJAJwdm+fFfBb2XnPZyHM6mrmpdZv73hturKPjsFe6xwjx77942J3vXxCpZhCBlwVD1vs5e2H6AqXiAkhAbetJtBLyMo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2370
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
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "iii@linux.ibm.com" <iii@linux.ibm.com>, "kasan-dev@googlegroups.com" <kasan-dev@googlegroups.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE0LzEyLzIwMjMgw6AgMDY6NTUsIE5pY2hvbGFzIE1pZWhsYnJhZHQgYSDDqWNyaXTC
oDoNCj4gQWxsIGVsZW1lbnRzIG9mIGJvdW5jZV9idWZmZXIgYXJlIGV2ZW50dWFsbHkgcmVhZCBh
bmQgcGFzc2VkIHRvIHRoZQ0KPiBoeXBlcnZpc29yIHNvIGl0IHNob3VsZCBwcm9iYWJseSBiZSBm
dWxseSBpbml0aWFsaXplZC4NCg0Kc2hvdWxkIG9yIHNoYWxsID8NCg0KPiANCj4gU2lnbmVkLW9m
Zi1ieTogTmljaG9sYXMgTWllaGxicmFkdCA8bmljaG9sYXNAbGludXguaWJtLmNvbT4NCg0KU2hv
dWxkIGJlIGEgRml4ZWQ6IHRhZyA/DQoNCj4gLS0tDQo+ICAgZHJpdmVycy90dHkvaHZjL2h2Y192
aW8uYyB8IDIgKy0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3R0eS9odmMvaHZjX3Zpby5jIGIvZHJp
dmVycy90dHkvaHZjL2h2Y192aW8uYw0KPiBpbmRleCA3MzZiMjMwZjVlYzAuLjFlODhiZmNkZGUy
MCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy90dHkvaHZjL2h2Y192aW8uYw0KPiArKysgYi9kcml2
ZXJzL3R0eS9odmMvaHZjX3Zpby5jDQo+IEBAIC0yMjcsNyArMjI3LDcgQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCBodl9vcHMgaHZ0ZXJtX2h2c2lfb3BzID0gew0KPiAgIHN0YXRpYyB2b2lkIHVkYmdf
aHZjX3B1dGMoY2hhciBjKQ0KPiAgIHsNCj4gICAJaW50IGNvdW50ID0gLTE7DQo+IC0JdW5zaWdu
ZWQgY2hhciBib3VuY2VfYnVmZmVyWzE2XTsNCj4gKwl1bnNpZ25lZCBjaGFyIGJvdW5jZV9idWZm
ZXJbMTZdID0geyAwIH07DQoNCldoeSAxNiB3aGlsZSB3ZSBoYXZlIGEgY291bnQgb2YgMSBpbiB0
aGUgY2FsbCB0byBodnRlcm1fcmF3X3B1dF9jaGFycygpID8NCg0KPiAgIA0KPiAgIAlpZiAoIWh2
dGVybV9wcml2c1swXSkNCj4gICAJCXJldHVybjsNCg==
