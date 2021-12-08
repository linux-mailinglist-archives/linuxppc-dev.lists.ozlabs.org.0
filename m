Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D35D46D9DC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Dec 2021 18:37:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J8PWX6mhvz3cDC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Dec 2021 04:37:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::624;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0624.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::624])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J8PW01GN6z2yg5
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Dec 2021 04:37:14 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P7koeUeqY5Udm11MXSQ1a88MqQuP5DysSrGELU8VIc4mV0WOmTdxnI59hIIoK1Pk3zCsBgIZkbY/XZ43gCASN6oclVKgVUM2iRqQrzLksSXaP06iIFuh5BQiEpS6Ovo0JtK05TYwFoLILU7+LKsVkWRV1V/KaiJGM7eyaOpKOqpU8eEM6aPntb6p5JyeY7Xee2+t5RZpM6Im6CBq2G8eEUG2aBvb5t5Rw3iV4oZGw/m22K3rErXOddkHUA7cqHjTmmwaph4EyFQ/KabYGplPI9Hm5hSBbDNwCTSqwlVIzpf5wJ31Ny36qicGuIlmMRoqrU1yGjzU3dRovP+GCI995w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FznmhyvBXcd3AQsGpfA6J6t4re7w31pPAGHaYHE04pA=;
 b=AaaZhtTvp5zpJOSaMedo23ayyilh+8yq59L2cyIqZAdWO5o58qs/YFTyVmKp+caGlemb4eMKC+diU8p/qjEuQs9xK27SpRkuIfmZWpCnTHaYnvG41OCAtnWgWv7FoqPM1PeE1KBtEH3E0udW4aDLiU42DZ9g26nEpQfQjbY/WgPyQxhmEwrIUs7y7P6zRcGhdJtMJmA+1OJR2oRE+VIca3pc09hi7RRZspmAYIOk0N/lur5o/gPbuhkRSVti+XrFnzbQz1GLnQdb/qfuwvhRxGxfaZdg+eSNxndG3FNuuaQbwdNFgO2mV7LodIs82OlNqKHOdqa2Dv6ikRrlpv+RMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR2P264MB0419.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.20; Wed, 8 Dec
 2021 17:36:53 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f%2]) with mapi id 15.20.4755.022; Wed, 8 Dec 2021
 17:36:53 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc/powermac: Add additional missing
 lockdep_register_key()
Thread-Topic: [PATCH] powerpc/powermac: Add additional missing
 lockdep_register_key()
Thread-Index: AQHX7Fow0VFka0nYfkWuyKwlY1DdIg==
Date: Wed, 8 Dec 2021 17:36:52 +0000
Message-ID: <2c7e421874e21b2fb87813d768cf662f630c2ad4.1638984999.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2bf15e22-9bbb-4335-620a-08d9ba7152ad
x-ms-traffictypediagnostic: MR2P264MB0419:EE_
x-microsoft-antispam-prvs: <MR2P264MB0419D50A3B0AAD6A4DF4239AED6F9@MR2P264MB0419.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:123;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ivo0TYXx29/UX5Jltp+2VyqduB27w+2SEqkUsmkD04TJKmJj6HS1IhJQRgKPkpagNyrXEJBaOVaHe67B3PNZ6sRWAp1Ie1eR8TY9wXSX9xyps3W7WWyZFgV1Rk20zA6Bvm9XTgsjQXg8DpeSp/ofmAsnnx7ctPo0bitWIdFpt3wny/hGbZmZtfZds4L06xKgHjURTIke7K01pXELR2PsM49dmq3oOclboRd63mRqdF93Q3uK7x8F0xkDlwm5Aiv8Q3vIAT0y0FbbLzIgoSL3oXpjKE/UPT9+DM2Vzwf3hps04B0RvQl9eSuTzWOxp/8PvdaA8lLNJBLUVUVpL7ebBkZTXaLNYJlNROfMUHquv0oAy4enP5QoInu6lTHpI2TgnOY6cNIIiqhkq3J+SuWvWg3rLgUYZkeCNsKf5WDR70sHt+dyeZd16LtDYJmkqJEUBOOxuLxdnF3A1WIXnl8GpLsU5eeG0Rmm5+ZNlqg+7IPPS75ro8VP7AQVwOR8UrU9fVE/jXfTFPaxT+ioRs7wmTtse/ukpuxHGeIQJTuGNbkPlurjsGV61Hv94V4tY13zDNIVtn3FTzBsnYUSw6YIakTE+xVp8fAdqpjyNChCBV+pUfU1hQIXz/2iec0D46GJ9K/yhOqx9lPUFc8MVnshV26/GiIHqbBh1b78plk+AzDNtlqKYuzkXz3MRc+4UsQzaQkukHGqX3/pxvkCUZfhx7FaCdgBSICxNyu2ab3rU9TNdYFk0xqkBO7Z/2jUnCGs6zE+Bc3obLyyO5/EwntXAtL/4+EdkPm55ZzXHos+g28=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38070700005)(26005)(508600001)(54906003)(186003)(6512007)(2906002)(316002)(2616005)(6486002)(86362001)(122000001)(38100700002)(110136005)(44832011)(8676002)(83380400001)(36756003)(66446008)(66946007)(966005)(64756008)(8936002)(6506007)(66556008)(66476007)(76116006)(4326008)(5660300002)(71200400001)(91956017);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?m7ft4xYMpYF1WfkJzx12fyuxwZCez8rSnr/FQvag9UWblYLkzgHbSfJmre?=
 =?iso-8859-1?Q?mvqBVNYT9bQaAviZxs72lq/fu67SWbGiIfsatUrBrUVm43rDXadaZY0cOS?=
 =?iso-8859-1?Q?tQPicbN8Lf6AiqG7x9vvWE2lA301Tq1X/p+NBe0w6lsf+ZQoPQjxqNeBIC?=
 =?iso-8859-1?Q?K3f/AiEDUHaQl+yfU52xXx33MfOd18Yz3nWEJYx03hGPZR/Cd0j6cBACcg?=
 =?iso-8859-1?Q?PodJ+DQGsS6/3qxFc7TX4jJqyA1Tn7fkQRhCY/aAUlptOzDeIWcLQ1ay/x?=
 =?iso-8859-1?Q?jWU1S1zvIq4DTRCl5YgoWtuUTDidIkwyegk7N7N9EbIWmFhiM4sOb2AzvX?=
 =?iso-8859-1?Q?0BcCBe0Gv4yhrOOJDsfbijRFXPoYbfrEnd8LxjdaaJf+/QpYBuGf3sZ0Fw?=
 =?iso-8859-1?Q?viCdx4db7mQzwYRmtkFm5NKVHBaAQZ/FXh3y5rGYm4uB0WRAnalyfmhoJn?=
 =?iso-8859-1?Q?ebbJxeZSurpzjwYITQyRBlFbA6r2y2+RasabWg3bFVUJ75r8fSd/hl1jHe?=
 =?iso-8859-1?Q?cqeYV7U0wLNcjSNNj34iCVkWr8rL2/vgv3XGPrPCqU6+MJLsxtGZcg/JM4?=
 =?iso-8859-1?Q?QYZdy1npUGNJ9/UwcoQHkcp4mxnIjAXXITeEA3uEOVleIcG42PcYq/SH5T?=
 =?iso-8859-1?Q?R/vNuLg7H6QYaP3MbYRKpnpQL4gQeKlwo4LuFYJi/Xs3G2FEgyaw6cYcLY?=
 =?iso-8859-1?Q?KPLQU23DBs+iZn0E4iECuVYM0P/YNT/Jr0TNw9Rshch0zNj98eNq/6uxqg?=
 =?iso-8859-1?Q?Dwbyi2v5PFh4OfrZpS8Kfo8O4vDp8aYsOU8eb7x3lHXUYrGK/J3a6kxzxd?=
 =?iso-8859-1?Q?TANFv3BLwzzeQxAzvRZ5nyEPCmmadYjRJUy9u3kQXCQLJuUvvjl/i3fw9q?=
 =?iso-8859-1?Q?az2B+7LLkWwW6oQCNUD2LSyhz4jat6SAsQPrUKU7/sdKbeIf48DZc6ywiw?=
 =?iso-8859-1?Q?SQPEy3gquhU5jGNrKVhtcOAlirNgmHsWFcl8oxVb+lC8zOt8ez8lMNP2al?=
 =?iso-8859-1?Q?1m/HtbD9OYvTd8tvyGrP6t9dZ4ELNkXB2lgctmoNj4sQqeToiRyZA03WIe?=
 =?iso-8859-1?Q?dxR7dcuOWgs3tEuBXQ4RR68r11MBUBgZarPuskSwzcrrAuPOONJV3alKIJ?=
 =?iso-8859-1?Q?zRBPaLtNNaNq1ibntofH8VUfFT3dmsZvDh50C1y0I7R02Y+M1x5ASdN66E?=
 =?iso-8859-1?Q?jEQ9dOv0ZbZ2aLR7RSCX0ixmFfqKma0yL6SLThbzOs81uFepMAnNBGzZH3?=
 =?iso-8859-1?Q?TUw33dYjP7RNurOcIVQMpGivYLjVkuxkSzgheS4OrEz3D6sBI9Ulwi2kRl?=
 =?iso-8859-1?Q?xiMFUo4I5ohvqfFxqhKa0TqIgKTabocvwmrNSCenSGZQxFej7z/UEOkWxM?=
 =?iso-8859-1?Q?vVGH8ABAIpwrDG4/8NaniPbxbhU0B8ETl/8VnIjm7iPKVXmLMx6pRDPl8E?=
 =?iso-8859-1?Q?Ohx0qLesgvPZ2FxsZKpZ5NW2/afxdJUm9jrkrUKbEceBnkryqfkxJ2sCnk?=
 =?iso-8859-1?Q?R4tVpKN97ZEZDaE3ZavdOWyqYHAvQzzb99BAi3fZhejpqHEo45Ht7Y1epN?=
 =?iso-8859-1?Q?v45ruRgQvE1wfJ7sdDvLdaE6EF2ysEMeQW5rGuINiXw44nkavM/xKSRboS?=
 =?iso-8859-1?Q?qeJLeV129i+8NFf7yzy0IHD3tBeKnEnOtH+xwf8PBVZvwdFYHXj1GAYznb?=
 =?iso-8859-1?Q?TBuTjF//wpjvMeSZJCtI7Qx/ZhOctMJUtx3ZFQHHnUSHIZOjfPCVvgVL4l?=
 =?iso-8859-1?Q?zq7T/FsjLlQmHHZfNAJ+DZsaA=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bf15e22-9bbb-4335-620a-08d9ba7152ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2021 17:36:52.9855 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4DjIUU2mo6HV6El4aUuBpHVgRBO1eEPwIAoNG/hruqTsK2B04b4FT1BHjY/6FU8pyc8ZRmqf7U4NodjjjXZx/BHmOy66i1XcNHGerSPS3mo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR2P264MB0419
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
Cc: Erhard Furtner <erhard_f@mailbox.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit df1f679d19ed ("powerpc/powermac: Add missing
lockdep_register_key()") fixed a problem that was causing a WARNING.

There are two other places in the same file with the same problem
originating from commit 9e607f72748d ("i2c_powermac: shut up lockdep
warning").

Add missing lockdep_register_key()

Reported-by: Erhard Furtner <erhard_f@mailbox.org>
Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D200055
Fixes: 9e607f72748d ("i2c_powermac: shut up lockdep warning")
Depends-on: df1f679d19ed ("powerpc/powermac: Add missing lockdep_register_k=
ey()")
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/platforms/powermac/low_i2c.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/platforms/powermac/low_i2c.c b/arch/powerpc/platf=
orms/powermac/low_i2c.c
index de34fa34c42d..df89d916236d 100644
--- a/arch/powerpc/platforms/powermac/low_i2c.c
+++ b/arch/powerpc/platforms/powermac/low_i2c.c
@@ -811,6 +811,7 @@ static void __init pmu_i2c_probe(void)
 		bus->hostdata =3D bus + 1;
 		bus->xfer =3D pmu_i2c_xfer;
 		mutex_init(&bus->mutex);
+		lockdep_register_key(&bus->lock_key);
 		lockdep_set_class(&bus->mutex, &bus->lock_key);
 		bus->flags =3D pmac_i2c_multibus;
 		list_add(&bus->link, &pmac_i2c_busses);
@@ -934,6 +935,7 @@ static void __init smu_i2c_probe(void)
 		bus->hostdata =3D bus + 1;
 		bus->xfer =3D smu_i2c_xfer;
 		mutex_init(&bus->mutex);
+		lockdep_register_key(&bus->lock_key);
 		lockdep_set_class(&bus->mutex, &bus->lock_key);
 		bus->flags =3D 0;
 		list_add(&bus->link, &pmac_i2c_busses);
--=20
2.33.1
