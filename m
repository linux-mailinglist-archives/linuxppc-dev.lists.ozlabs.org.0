Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E1F495B95
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 09:08:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JgBp951tyz2yLX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 19:08:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::604;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0604.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::604])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JgBmd3tlKz3bXd
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jan 2022 19:06:57 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F+Eu7XgumGBGJYMG9OQuuJgSviT8MT6O1kmxJ4ycwEo0/i6KCC1q4pOA65NT3Ai5rqqPZTdkR1xAYUUkoRm4uQ5RknLxZCf8DUezFNWJmdlsCuZGGTSHgTnDRTSgZGXT9CU6mUAH6Eue30zoVhFVJedIZwlWellJqFxax1tpSRQczMJsEGp++9w1EK8ogIyFEnFha++Kq3r6CZooODpdGdL2IPdXdbRaFYOYPvVavCgtiyNzeuD+gFf5APzS/FDqlfxde1ydeTkXUCeryp+89mYeQnk5L54IWVA+4lpIswKL50H/LfjGtUHhwWu3B2w0hjZlDPK8mqxWfIRKT5RvNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z3wjFFjEQNoPJejY4efQOtpANBEP8Aka2DcsdMne6ew=;
 b=PpuL+P7xKe4X0Vd/AKKF0kixHbiGi8y7H9HLdvLuzlzlm/nFMo/2qk3CcRKCIRZIcpmEp4bfTPkVqga8fHlUk8lVGBEYrEa+K6SeZ9pGmilcyUPs5ygg1aa7d3x0aaGY15eaWqtPqbyJ31ltVztHoqEGko1dVRufeFSmpHEnkVhlHS3zU+7/0rwe7htYQ2vXZbqiC94BdUQSqbjDpkZpGldrTmnCeBRjSCihxjTGjS44F3oYIU4J7I0d7KPdV7phWJRRj3Kzi9hy8gR9OGzYujIQcbI+6Q8TpkwxjKmx4XdhKAIjUXFY1AVIsHf9ckokz+IplvsYuZGvxjmqVtblQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB3475.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:20::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Fri, 21 Jan
 2022 08:06:38 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5%5]) with mapi id 15.20.4909.008; Fri, 21 Jan 2022
 08:06:38 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 3/3] powerpc/lib/sstep: use truncate_if_32bit()
Thread-Topic: [PATCH 3/3] powerpc/lib/sstep: use truncate_if_32bit()
Thread-Index: AQHYDp3Q3+1McVpc502dpiOkuseC5g==
Date: Fri, 21 Jan 2022 08:06:38 +0000
Message-ID: <7e1c07123f13156d4a27991a2e2694fb584bc068.1642752375.git.christophe.leroy@csgroup.eu>
References: <6c608fd4795e2d8ea1a0a449405a0087f76d8bb3.1642752375.git.christophe.leroy@csgroup.eu>
In-Reply-To: <6c608fd4795e2d8ea1a0a449405a0087f76d8bb3.1642752375.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: abd9737e-da2f-4cef-f6a8-08d9dcb4f337
x-ms-traffictypediagnostic: MR1P264MB3475:EE_
x-microsoft-antispam-prvs: <MR1P264MB3475540F24ACBB1F86924904ED5B9@MR1P264MB3475.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:2201;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JOcieOOe3gH4y243gra0ka+S/lp0IJPBmTypyZ47bkyRcxN5CHNxCkQflt+Erebk7hp+7MXIUWXQTHxGaLbjwqN0cZ3bsah+w1pX1J4u83afmd6pCBRut/VNPLBQqcx+wOroMWgoLDI+IEv7Zq09EwL+x6gTD3lnRso3ZmFjQfGVNWzBLX9PFw263TT67zFYUCdTgASiaTF/xgW+G4FNY54Od4dMR4ZrOT2ESkzgUZdEQyiAUrq50yrIsAwdnrlNwP3KbXVCO30+xgzIDLwti8VO4yFmfKfaAh9R1kNCEuEFEP8dotFlAfDjog7vCOiR6Y2L5TnCY+KA9paI0k4FLlQ4uR4A/ItBTeKOG/isDtjtL9BFWCgwrBcRpFx/ZHWxUUIJctptjbAZcigYielVgXE4VzT//xVqXejSa5gqFSRa8CR7y3GZaoTBWANTn0bdwcwnKIQ4deM2hGEIyoG/ar3rfrEt0GoqBmWRxQigO2CYIVO3ttzlJ75e+cfUzBfCNaQd1P77jiJobToA2s6Pnf6LQtNpJmv1/Kuk5rQgbZxfrDG6pbSUyFsu8EUNTKo+Z/gNwF5IKKacz+GveuLmMX8eszbYIpqk0DIqE6yqcEXkLyiEB/CmdWHk+PYxRfVd6cgljvoNVP8QV7xXKT429hKd20Upn6Dm/SknQSzZSVNKIvuhIV5U31hyeA5pmpjYC6L7zvYS3yaMwCprJmcvzA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(83380400001)(38100700002)(8936002)(38070700005)(186003)(4326008)(508600001)(36756003)(2906002)(8676002)(6486002)(86362001)(122000001)(316002)(2616005)(26005)(66446008)(66556008)(6512007)(5660300002)(110136005)(64756008)(91956017)(54906003)(6506007)(76116006)(66476007)(71200400001)(66946007)(44832011);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?tlVQjN3VblvdG2sIwzSLDVb6imyFapeTNC33EmwaQO+kUW0+GyB5GMoqJq?=
 =?iso-8859-1?Q?q9yISLO7WKWfXZBnaBm5/i86PgT9YAv1vGcwunRcwpBmbOP6fwVEZ9zuYU?=
 =?iso-8859-1?Q?Esb6fmVew/BqKkVyz5DukR7NI569F5eD9wSyhz5M4zKqSUUmW20llacIVn?=
 =?iso-8859-1?Q?cVNRljFAdgUk1+sQSO53akMcvKv6rSbeWQ7rbevr3Wya0E+t0Vs/xcn85+?=
 =?iso-8859-1?Q?X8z9X6//C5PWPVB3kXRaydfrUiAc1SXWAc9aTZ7dnPAv4W6rqvOQI7Ck+a?=
 =?iso-8859-1?Q?cj2D6T85alLLrKlJ3rtfnqzZriC/JKHAcltlwwr5yXrrVlKtfdvTs/+8zU?=
 =?iso-8859-1?Q?Hov0ePYt5p9j5E9Q3RdyXWNg4xWoOFDWBH44nDoAJa1fnOA/jJGn86yZw8?=
 =?iso-8859-1?Q?bWjU5TyigUdDUSHHRnmB49CZSfug9PAClr6s50Hsw2Qucko5qKNwlImNvi?=
 =?iso-8859-1?Q?p5l2CSni1d+aJtDgv2Ew5wZ+C6bMondZ3sEu5dKVoRd564oVPzPZCRv5zG?=
 =?iso-8859-1?Q?koecu82wRQ2aeDdl5Iu/z2GOKyCg8NHwz3+Lxo0mYunYSmf1KsZ/Ge5jta?=
 =?iso-8859-1?Q?WWIzuDw+70D6DAIMRTxsox5VOT9l1jdioNVk0KQ+yxIMXn5E5ShkkC/78R?=
 =?iso-8859-1?Q?MxLI94P8jIre4GlXxpRtbNM7unU64u853hS5RgmOMj0AkEnDnYepUdksED?=
 =?iso-8859-1?Q?QhSPLIpjGX9qgBjuvqrGSrFvdPAEg8pkdjw+Kv7wvULMorE+RdTS3poQp3?=
 =?iso-8859-1?Q?eJAwUfVuRp9Uw7QsU1gqM5uTMegFqioUTjvNZpHvBoPRpa5gBaIXxzRDaw?=
 =?iso-8859-1?Q?Kz+f60G9i/Fv6eF3mF0tX7Cp6SOQ+S9M7NvzJizvBaEseFJA0a/viihMG4?=
 =?iso-8859-1?Q?lK7xtvAzArRGj2mUdOauRVeMfnEW/YqXojUpGC+t9zZNufPryo3rNNdiMs?=
 =?iso-8859-1?Q?tAi5kBjlr03RRtPvWx6k6Xt3TJL85dnrK5zCvqcp0FRGHaYpsGl033Tnl8?=
 =?iso-8859-1?Q?n5p5fCYhgfuNkkYm8I/j02p59S1btSDOTXywmF+jjRJOpZmtyqBqDwmbut?=
 =?iso-8859-1?Q?ao9hSytJ2yz8sSgZTU0lCVZjcoDC6kCAT3kBYhhLdqIDc4UXyOxniLnnkj?=
 =?iso-8859-1?Q?eyOUjzjgRJDglc722FhAd4lblytmwxaxxQQW4dYtSMojbRyMynYE4v4H0+?=
 =?iso-8859-1?Q?uUxQ3EnIrjrj7qWZv3ShKTsVQUVf2WGSQKiX2ujk3iAp+6y8/TWtXJLEKL?=
 =?iso-8859-1?Q?I3LpQm7pkc/DEC2XNb2Clbae8Xn94iSvSfixeZ0uhpOOLGyupcIx+sKz0P?=
 =?iso-8859-1?Q?eWP3ViWBWdQLUwtc4k87nJEsG78AKZ5H/FriVdr2sTFEK+ctgLXnAPvv8L?=
 =?iso-8859-1?Q?eMtPE+n7vCIXBg7N6ZbnDpZghzmASkOKRQK06EHIH7mvtZuJBUOVd7k1Ig?=
 =?iso-8859-1?Q?AMmfKc3km8YAOQbSpE3wPVOA753YLcyMQM4j751ogx6QyqM6B4K9CLTs/X?=
 =?iso-8859-1?Q?Yn/k1dtDuICLdKE8mea70fY58j8PTuKTIejVKlMtKC/eYcYWhJ+Xfyi2vY?=
 =?iso-8859-1?Q?rTo1muN8PuqNA5hp2zMvBGb4RCZDlvq2um1wjlcGI84gfKxLTv+wemRQq+?=
 =?iso-8859-1?Q?Vh5ljTlygeAM/zUt2eHjcZQ5UxPlyOsq8h9vDekuR2LlUmb3NObCGFxTQg?=
 =?iso-8859-1?Q?786sl2iruCkYO4JEMK2JoOu/SeJA8a7Ml5IVdQ5jyaLIgM5bXge5geCpm/?=
 =?iso-8859-1?Q?0yohu9o5gj2VRxXQWb4CIr/ls=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: abd9737e-da2f-4cef-f6a8-08d9dcb4f337
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2022 08:06:38.1297 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iOMSFWAHqEtBcZeKgHPcfCl1PMYUmVG6HhG0+j/1Nu64i9aXGO5LcyzjuojY7AgcYBs3ve55Qn/sOUEsK+4ylgHmH4HPs7chMqUSwkNAqNs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB3475
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

Use truncate_if_32bit() when possible instead of open coding.

truncate_if_32bit() returns an unsigned long, so don't use it when
a signed value is expected.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/lib/sstep.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
index 4aabe3854484..ca38d026fd88 100644
--- a/arch/powerpc/lib/sstep.c
+++ b/arch/powerpc/lib/sstep.c
@@ -1065,8 +1065,7 @@ int emulate_dcbz(unsigned long ea, struct pt_regs *re=
gs)
 	int err;
 	unsigned long size =3D l1_dcache_bytes();
=20
-	if (!(regs->msr & MSR_64BIT))
-		ea &=3D 0xffffffffUL;
+	ea =3D truncate_if_32bit(regs->msr, ea);
 	ea &=3D ~(size - 1);
 	if (!address_ok(regs, ea, size))
 		return -EFAULT;
@@ -1164,10 +1163,8 @@ static nokprobe_inline void add_with_carry(const str=
uct pt_regs *regs,
 	op->type =3D COMPUTE + SETREG + SETXER;
 	op->reg =3D rd;
 	op->val =3D val;
-	if (!(regs->msr & MSR_64BIT)) {
-		val =3D (unsigned int) val;
-		val1 =3D (unsigned int) val1;
-	}
+	val =3D truncate_if_32bit(regs->msr, val);
+	val1 =3D truncate_if_32bit(regs->msr, val1);
 	op->xerval =3D regs->xer;
 	if (val < val1 || (carry_in && val =3D=3D val1))
 		op->xerval |=3D XER_CA;
--=20
2.33.1
