Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD907FAAC2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Nov 2023 21:00:12 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=ObgBrOtZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SfGf20j3Cz3cb0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Nov 2023 07:00:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=ObgBrOtZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::60c; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on2060c.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::60c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SfGd64bQfz3bcJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Nov 2023 06:59:21 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=am7N5Xt3eE5G5bVBDcRQVtkbay7SDs3on9GHr5Wi8wCYC8U+4DHqVwqIVWflHnIF6XsZcA1AkpkGnNvNQvHfmbLAjrD5rMFRxr13QevnpeikMJzDSWg6+z4e1tB9a3PkU6BkAhWRQqkULBdcFjbz4yemSuHJvkuzVBPrFiwbIB+ghGfosw9Q3f2tjFp0Eyobg57NPOPu2VfpF74WaogLObgHArT4PNeOhW25gfCb7K59sGEkpd9fNgEEJmBnXFyyggoU/YCtOnM88j6s/wGCHd3SE6WhiAT2E2hXV12YRW6XKjEy3S8DARjBZYOD+uTZRl6Xq4/tlsXAs+klJp1M7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kDkouMhfSw0H26aOwz8Vy6/g9dDfYV9eF/8BdT7/SRs=;
 b=OCcCI5qwiNoEHmeEeJqtQrocoKDhdIidaoyGcFfQy79e8VEpEOzXfIxX3d0tzALqraAq6f7MAjOdM6XLkmX5p1wOyAdGLFkc08T3keOYW+ZzQdaN+GnB4VFtmypqSqFMXxbTAWHKO9ckflTAT9I0083z6653LL1GMOf6qFs5lRtBF75jcYlxA42VG2+8QS94AA5i3aQRlteb8x6rBkfRKKH+HNUywgcf6BQRN2p3BIjaYMezj/kmh//GpNvvGOBdxh6kR5FERI0yN3VFQcGqkUSWWFN9XZHTZj0pEfRBL8sswWoTBAgk4AjxcM9VwtvnwMQY3/QGRwiW+ml2AMC0kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kDkouMhfSw0H26aOwz8Vy6/g9dDfYV9eF/8BdT7/SRs=;
 b=ObgBrOtZvHcLdFJMnq8OPhq3cJQ/0Vb5i5pCWbY2lG9Oq0BKiT4iru4fDCOzphhGBXoww02rVeaBk1b4vtWWPJqwcvdzkalc+KVFb0kkyDe/OVL8arsYurU99TXqdUKfFizcAW4tMYwfU848SEFkzs8r0Vm32wctnxHWbj27t4T3Yd2De8YGoVJ1LmDl5vBdTH+IHVapgx5mFVqQnEQPeZsSA8rj9Dk3kc9xaPO8KZxI7OZClM1LbI25B4cwIGC33Hfo58geYWKLlvtdBjfVvgXqYHGtQ3QO5UcgUSgGd4cBdW6F+JCypZSL/hQDWrk/YAb3WuovFNMIwqQ8Dv8HVQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2018.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:10::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.21; Mon, 27 Nov
 2023 19:58:55 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97%3]) with mapi id 15.20.7046.015; Mon, 27 Nov 2023
 19:58:55 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Timothy Pearson <tpearson@raptorengineering.com>, Michael Ellerman
	<mpe@ellerman.id.au>
Subject: Re: [PATCH v2] powerpc: Don't clobber fr0/vs0 during fp|altivec
 register save
Thread-Topic: [PATCH v2] powerpc: Don't clobber fr0/vs0 during fp|altivec
 register save
Thread-Index: AQHaIWwneCjd4nXLUkGAxtqNPc5XAw==
Date: Mon, 27 Nov 2023 19:58:55 +0000
Message-ID: <89de310e-bb9a-4485-bc8c-3fbefc90e6f6@csgroup.eu>
References:  <1921539696.48534988.1700407082933.JavaMail.zimbra@raptorengineeringinc.com>
 <877cmc7ve9.fsf@mail.lhotse>
 <439072392.48800901.1700498743840.JavaMail.zimbra@raptorengineeringinc.com>
 <874jhg6lkn.fsf@mail.lhotse>
 <1294229534.48922001.1700539832331.JavaMail.zimbra@raptorengineeringinc.com>
 <87leaqjs8x.fsf@mail.lhotse>
 <1340817182.49635143.1700784119445.JavaMail.zimbra@raptorengineeringinc.com>
 <1276384468.50536225.1701110354677.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To:  <1276384468.50536225.1701110354677.JavaMail.zimbra@raptorengineeringinc.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB2018:EE_
x-ms-office365-filtering-correlation-id: ac2e25fa-a043-4f65-a8bb-08dbef83498c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  MYfI3uuK45xXq2Y/rkFMpb8a26rsw0jjS3fC4uTtcLbRtA0Ld560J4oiGWMzy+jOFWGlHGDnKm7aW/S4FRYceNsjg/PXiLi245JHj4GZ4gehmDD2qCcBdITNo31N+vJS7wi5rhy26oiaRqCFf/c9RjgFIRW9gcf/ds4MSEg3ZIOx08BrF72Ejiuhkj7tFLMUq20gZZVBY+yU018xso1kkWTmHkcUiaeK5i/TRgp9QkXsiK0XHUURBXQ7dIgF0UhoJCrEKQZicAkVF+ixhhhPa4rDm/CAHzP/eTRr8bxon82v0TD3JxFql2hZBB0QCABv6rDUJJWwG7R7mkbh3Ii0N5IarKiTnyA1aqKpO1/3dDneAZ19fqOsGd28V+mHOGBcZlyuqpfSbfkqW1mkZbQldkjOrEfhIuVz1UAIadKtSwlUfOR+HozBKTpm0XeVaoYXZ4MU9/Ln+yckX35FNeKSymvWWvrp2pA2FwmdqRtf34i5UkrJLYtP9VPEMLWFWD26gHgwhYO3L+OohYlOvSf9jTM99572VL7uXeM73CUXBPDF1W1EoXG8bkhdWZJbrBGKa2arURhYqWVY4LmCPeBLrNvOw5gHrKkokCOBcktVTBdkO+qFmUTwLmoBnYPvKVI5ScaogqPg+83OcwasS8/krbbGoIgjA6lX9HbZjpYQOriMfxZs/1/ujH+mBvQYDxnNK94l4QE3tfHOnVRKs6zgRAzrw+jbGgIwhlmXjsRU3K0=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(366004)(376002)(346002)(396003)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(6512007)(478600001)(6486002)(6506007)(2616005)(71200400001)(4744005)(2906002)(44832011)(41300700001)(66946007)(91956017)(76116006)(66476007)(4326008)(110136005)(316002)(54906003)(64756008)(8936002)(8676002)(66446008)(66556008)(5660300002)(38100700002)(38070700009)(31696002)(36756003)(122000001)(86362001)(31686004)(26005)(213603006)(45980500001)(44473003)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?bW9qajRzUkNvVW1qSXdJR0pmVWNFam5vSEVQNnRBY1dicUs0RmJDVDJGVlA5?=
 =?utf-8?B?UDRPNm1GSkNFTDZ1VWpqQUx3N01naWdtQWg0eFcrUDNWL2xVOGgrMHIvRElt?=
 =?utf-8?B?NUN1cGxLSkFPcmREQmlhcXlDYUMvOVRpek1iQjM5NThBQ1F0YmE2NVcvQnVj?=
 =?utf-8?B?N3N2NlU5OHBJaDRTU09lWHNtZ095eGlzaTNYZHp3b3RDZG5YU2lDZFhIdmhl?=
 =?utf-8?B?cXpPNFVZMlZHMUJucVhTSjFNMllSeU9YMEcrbWFLR24vZ1kxZzVjK2NHOWVD?=
 =?utf-8?B?bitpOGV5U3ZNWWUxOFhLUVVzVUF2ZElBeG9IMU8veWRBWWJoQVdhcUExL0Za?=
 =?utf-8?B?ZUJqMjNKWkdub1R3VEtOeUFObG5jWHlOWmdVOENmdzNFNFh3SnhuQnJoUm15?=
 =?utf-8?B?NlBzd1Y5T25ESzh1b2dpN0V5blE5UHBnckhXNS96eEZidW80YjlHcHkxMVcy?=
 =?utf-8?B?YXBoUnllSXQ2S3J6K0UzK1N1aE5VdmJBNlZaN0h4Sm83S1RVMXp0TnlTYThs?=
 =?utf-8?B?MUswRm8xdTZvNGxPU3p5Yk8xYkNrQnd6YmlwWmpuU2U5eTNwQ0hubjFsaVpX?=
 =?utf-8?B?Rmc2WHU3YnA5WkFLMGxvbitTYmUwZ21PSGd0UGRBa1g3N0JLbE82M3l1M2ND?=
 =?utf-8?B?NkM4SGszZGcwbStLWkNwVXRNS0RrNFFVcFphVXZ1V20yZkJUbGYvanNuL3hZ?=
 =?utf-8?B?bHRyZndTR21jQVp1N01VMlI5VmxudnZjTzFUamlFQWZKSkRNaXQ4NGRubXRO?=
 =?utf-8?B?WmN5S1lQRmZrUkxJcFlITlYvblZrdk82Y1g2SlcvMG1OeEJQUHEvMm11Y0VQ?=
 =?utf-8?B?cGE3aDgxWGp5UWJTRzIxcGRDYVhuWTJFMVZPTG9JNmRsTENrRVBSaUJrazJO?=
 =?utf-8?B?d1VCRlhLWEZzdnA5K3VYM1VnZDNiZnhlMFIwazJJTDljWmt3MC9ZUml4Zktk?=
 =?utf-8?B?cldBeWQrV3B3RndZTVo5MDdreGZ3SHh2RlJkM0l2VjBDRDhBdFhZTW8wUFlG?=
 =?utf-8?B?OTNRU2VCdVE5YmU0dWpzOWpOVG9lV3F1Tkpmd2Y3Yzhmd0VyYTIxT3RpTm5a?=
 =?utf-8?B?VGhGQVhWK3MvbHBJY0xBdkFHR0FKQTNMK1lWR0lnVkhFajhRUUplMlljVnNu?=
 =?utf-8?B?bTd0TWVlcGI1R0V0Q2t3WGFIKzRHYW9QZ2pXaFhwZkVUNjAxTzlVbHlBcXF1?=
 =?utf-8?B?TTBiOHJnRFJNWHBYcGtvNVR2MzlaZGN1UWZpdml4RUR0UitOZkoyQWY5dWZl?=
 =?utf-8?B?VzFsUlFwTUdxUnNBRDUrSVVyWE55NEJ6OFdEdXh5YklRTHArSXlBbVdQb2VF?=
 =?utf-8?B?djg2RytJQ1VINHlqTGpDbGU2ZG9ZZzVodTN4aEp1Z01SdlVmUUlGaTJGNWY2?=
 =?utf-8?B?RW5COEpiZkRzTXNWRHZuWVZQSDloalVqcXUvZHdpZ0dEaUF1Z20yT01nOGFX?=
 =?utf-8?B?bDFCL0owbG5sdWlUK3hkWlIwdTl1RzA3dXRubUp0YVpJYjNMZDI5ZkluZ1dC?=
 =?utf-8?B?alZYZk5NNDhIeW5sV1BJNEFoUk1Nc3NNOGtCdFFVMVRwUzllQWhaTTRDNjNt?=
 =?utf-8?B?TWJOdGMxNTYySkltYmdDYUc4T0cycnUxRTlrZFB6N2hVbWtSOWMvb2E3Z3cy?=
 =?utf-8?B?Rk5mVkdoZVZDSVVVbVNkV3RTTnhadnVrRG02YkdJTmZzMFE2WkZ0aDNVc0F1?=
 =?utf-8?B?TTJHTjY1QXRsVHhIc21qeS9QS2xQUXh2eGlOMHNieDZYeXVGVUI5c3l4OTJp?=
 =?utf-8?B?RkE0OGozaThPaTVYeHZETlJYQlJIclZKK3lrbEcva21SSER3eHRaU2oyWEoz?=
 =?utf-8?B?eHdLZmx2YzU5Rk91RkpRR1paYW11dC91M3hvQUlCYkRFem9lWHhjdHUxVkR0?=
 =?utf-8?B?c20rcHRvUlNoWHNrS2VKamVGT3JUeTRpZVVZMUpJbDNkY2k5Vk9lUy9mL0VN?=
 =?utf-8?B?VnJrZGtoeWFMQTNXZmoybHhvR0paOEN6Mm1jMU9FaUN0c2FQSWt6VjdZbUNN?=
 =?utf-8?B?bDJtM0RUYWJvbmhjdjMxeXRGWkRWNUxRM002MkVZL21JdGgyZ3NCOElVdjMz?=
 =?utf-8?B?SlhpNUlrTk8zTk9jTWRMdjBmQU1LdnkwdGhXS3NVN3MxekFYdXRKc3NOMlZv?=
 =?utf-8?Q?oPriAHblkasVn/ppMTpvHCSID?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <33FD4BFEAD5B9249A5BC79F3C4DA95D9@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ac2e25fa-a043-4f65-a8bb-08dbef83498c
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2023 19:58:55.6525
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tewRANHU/Mb+btyalclJSAXFLVKuvnk2RHnTt2H1L7Sa3nILvLEJLImpCYxLAjGjeMJrpjJfiDfhb9eZz9T4NmiWT6NML0sJoSHFbL7POcg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2018
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
Cc: Jens Axboe <axboe@kernel.dk>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, regressions <regressions@lists.linux.dev>, npiggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGksDQoNCkxlIDI3LzExLzIwMjMgw6AgMTk6MzksIFRpbW90aHkgUGVhcnNvbiBhIMOpY3JpdMKg
Og0KPiBKdXN0IHdhbnRlZCB0byBjaGVjayBiYWNrIGFuZCBzZWUgaWYgdGhpcyBwYXRjaCB3YXMg
Z29pbmcgdG8gYmUgcXVldWVkIHVwIHNvb24/ICBXZSdyZSBzdGlsbCBoYXZpbmcgdG8gd29yayBh
cm91bmQgLyBhZHZlcnRpc2UgdGhlIGRhdGEgZGVzdHJ1Y3Rpb24gaXNzdWVzIHRoZSB1bmRlcmx5
aW5nIGJ1ZyBpcyBjYXVzaW5nIG9uIGUuZy4gRGViaWFuIFN0YWJsZS4NCj4gDQoNCkhhcyBhbnkg
YWdyZWVtZW50IGJlZW4gcmVhY2ggb24gdGhlIGZpbmFsIHNvbHV0aW9uID8gU2VlaW5nIHRoZSBt
YW55IA0KZGlzY3Vzc2lvbiBvbiBwYXRjaCB2MiBJIGhhZCB0aGUgZmVlbGluZyB0aGF0IGl0IHdh
cyBub3QgdGhlIGZpbmFsIHNvbHV0aW9uLg0KDQpDaHJpc3RvcGhlDQo=
