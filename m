Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1B948989C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jan 2022 13:30:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JXY7r2kXYz3bVb
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jan 2022 23:30:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::629;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0629.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::629])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JXY7K0tF4z2xtP
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jan 2022 23:30:03 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E9eDdsG6yfBPZtvm2tcEiYbjLOA2/R3jU7fDjzcEhUGBNJTVBQ0KPLlzqQY1z9R4RsUxqAuFeklQP5xST6bQWpV8903yXTO+o8TKmsM15kWcLYAELoOkCKbQYnhuPDhSKpAjJmX39pmnRk8CbqZJPboxTyr2vsjU93P6sZfbi2mxp4spVmoYK5ALMipM+oIeaGn7uX3i8kQzi0rCcSefL8c9RtpIYBs29+4VG6k/fImcAdastwJ/ksCyZBA7ohXT12JNi7m3m9jn8VV6MOO8P07ZhyDVNaJP928rJbQRvdEWjj3iHI4mFzQ3mjxJ0yn56cQqoHZkDbsTlelUXK4jMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f7eit1O/BcqaXly1S25IVo+FbOhPgEoDa53w9hWTgkY=;
 b=GZjdtESFs8K3bNRQ2vgMUzQdSSRwy2VyEgIGB3E4voqDckHme9VkNs93QljKx8ogV/UckkJW+W6O8gJzeUdIaZsq05F76uNa5o3rZqB2/+bW7fX/gwzqxJpyixv7hbwBoIG/w6RkFr3Vztl+/Nk2cr1ndyvQSWOzZlNs0M1hAvJU0wAmI2nyRa4aEREmGwSHjcSa8A2aYwboo+FwL06RbKRNIwASDrEc/I5ydkWHOS02v1viPPOfdf6VeS+H5vKBPTdCNjFuU68NdvbHhCNLrEz/8iqGEj852MyKR7DHonguRQs/Aex4mapcINRop7o7fLmjG8Tlx3HlybAwf6xdIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRXP264MB0552.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:1e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Mon, 10 Jan
 2022 12:29:42 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5%4]) with mapi id 15.20.4867.011; Mon, 10 Jan 2022
 12:29:42 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc/bpf: Always reallocate BPF_REG_5, BPF_REG_AX and
 TMP_REG when possible
Thread-Topic: [PATCH] powerpc/bpf: Always reallocate BPF_REG_5, BPF_REG_AX and
 TMP_REG when possible
Thread-Index: AQHYBh2+PoHCxCSIk0C7aiUG8hGF4Q==
Date: Mon, 10 Jan 2022 12:29:42 +0000
Message-ID: <b04c246874b716911139c04bc004b3b14eed07ef.1641817763.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ea293112-d8d9-476a-5d3d-08d9d434e0d5
x-ms-traffictypediagnostic: MRXP264MB0552:EE_
x-microsoft-antispam-prvs: <MRXP264MB0552EB02EBE512A75CA52399ED509@MRXP264MB0552.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:923;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kvKMGz2OfdXoHhK8xEBDP/WnMBNw9KsLZpYgf0NzBxyN1sSfW7qUReMjXwC7WSvgNkd6XGoDHdb1cvb7/fq4+j7hsygpNfwM3ei6Q5i2/Xsvcs0JHJ50+0p93hZaWBajjVHQNnOyk3+ej4nDJVaya/l6xT69lDQBHgYq7eswZuI3Nj8Y5DqyAnRrWZ8nvTmeh/JGiixM0OgrzHzXZGv92qBTuElhfHbSbW0JR1wYtMfFspnogfcD/4mZiwXSGht2eMJWl+5FdBAXDb/0D7FUdEMQ2OSVlJx+nIzuYRJZqoPTI7PDQP/9ETIiT3mXfLBgScDoBnuSKDEE+xTFO+zudEA9h8jn9JA4VrIirEulA0MuMT4EbuXqO+1FGzFOAv9Si1iP2vPilQTWjGvlLS3jO4XZFJzWv7eCOdOyTrHx75bKwsSkh9zE2l5MrpDOAVqEoTF5wQyVp+bXDlu7eXNWrxMlYjEqLs0C3YF6NRWAElvxLX0mOYDHrXfH8c1VkCsBMfrukM8bwzzI7IK0IWr4orS2kPTvolig9tpg9Qc/i0lbqIMo4007TVIOZ0WRP4sPXxR+5gHx7dcMX8FhRunUsbqpTdAYnCA4QxljGs6dZ7RyeSykphS7FVAwQ357QlSKPw34ySygXdzqD3SGNCTyX5nVrf/MXWmSZkPVbCVqUJKGbEABvKzHEXhy1UAgb6J/wxHijFVrQXNWgKkROy4bpQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8676002)(76116006)(110136005)(26005)(5660300002)(508600001)(38100700002)(38070700005)(2906002)(54906003)(83380400001)(36756003)(6506007)(316002)(6512007)(86362001)(8936002)(4326008)(91956017)(122000001)(6486002)(2616005)(71200400001)(66946007)(44832011)(66446008)(64756008)(66556008)(66476007)(186003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?FbnoQd3avsHkdBPAvpYzw2OzHn0A7KojETnsuF9HdWBAFi/4NkDESwv0OU?=
 =?iso-8859-1?Q?N9C5n4+ZECx2HWbPYnGnkJIDygtbMc4HODeBPTYCBiaXBI0KiiZw4lZhQ0?=
 =?iso-8859-1?Q?nMkh+oG3+nrPV9DJLupaiNcPOQX9DczJ2A2fFNo2pEWkb2E1kqkT+A4v01?=
 =?iso-8859-1?Q?ICtLfTlnJZ21XLh/Ef0kA0/doXmx5qPab6TmhscfjSm3ylv542Un7iYNM4?=
 =?iso-8859-1?Q?jU0Q8KQ+o4P+0D3u9h6dhtQ5V2vgEDQl7XxvhkD66mni+RrXux2Pi8e8Oe?=
 =?iso-8859-1?Q?wWyv1DUA7i2RW1w56E//jnRkkug8B+V++Q0qqkL0hheSAqWYeSdb21Mj2e?=
 =?iso-8859-1?Q?0jD/O09xuVvRDL4VFv2jFrkZT1v/KKxFMAlnfklhJaH+2AmhU2LSPlGSLy?=
 =?iso-8859-1?Q?cNBnyoaBnk+D3P2/sRkSLZWd8L3ZmeSEf9vnV06tpkYhRTVStxPBMUtqsF?=
 =?iso-8859-1?Q?meuvHnP7DoeeB9swSoz00koDb8QMFillGm6ooLgaRtYfP5xnbVt9g8MezJ?=
 =?iso-8859-1?Q?BXAyzfUDIrwVD2g8UFy1fB9/OwFBaFW1TkiatPrg5n4CuqnsebxIfozIR8?=
 =?iso-8859-1?Q?WodqscPVH1EJhwsMRFdfHH23nRKXCarN7diPssubhzpBzr14Tnr582SoOf?=
 =?iso-8859-1?Q?3HK57Vo19rSi7AgLy8ATG4gt7lZpxPoqhiWrbX7IbE1BgZS30fTS182YLk?=
 =?iso-8859-1?Q?N5AJ4IZdECdNeTo2xwQ0UD1N1GNettgmVa55YsyxcYgFNTuNt2wyhXwFGh?=
 =?iso-8859-1?Q?dNu2lBv4kGn8I3lRyPHHmyDe9Ns5UoTiw75OatN9bOaDnA/DopP3JY9aUE?=
 =?iso-8859-1?Q?ZbKfFie9yeg6QLE6TV5JGYzs3GlI0NIJeJkQgDFuUkV6xSZl5n1KkZUKyg?=
 =?iso-8859-1?Q?c5v918U+fPgyja0QcfBD6HVihd9Ff6AGCGMQ75jHt90iWBJneCgad/+RBS?=
 =?iso-8859-1?Q?/jtCpm//saoLZIXsA8Ek4Y4nOKsL7x3A7KP79BaoNx2ISAtkBgXcvYohmx?=
 =?iso-8859-1?Q?CPRsuITM9JTWIn5ySzJKEm0QCh0UZqDOPpbr36UXngqfpPJGav2yDXPlw9?=
 =?iso-8859-1?Q?5c1HDZtlWpGHKN1QAmbTzR/oAVccq14z962gdIgX4N5qfAaO3x6lzd3vzK?=
 =?iso-8859-1?Q?XWCfvSXuAxm6In1aKT1E10luaIxLB7PQTO3KjZ/g19CCvCiGCKyGnb97mk?=
 =?iso-8859-1?Q?csb1P3Kz/Zk62Zg5bHJQg4HtfZlZKM5AwtyWLCrEuhUrVAq8EdKfjMyxpQ?=
 =?iso-8859-1?Q?O9d8etp6mwkeHZyaS9GoMxg2PEXfeS2SbMvSJeLaRShp+Xj5O/uGyRBVhL?=
 =?iso-8859-1?Q?ZQzWGBVUou7btwFTzflhLu0qKxO7X3jEvFVo2sdIrQwLDBQft+Gz3tU9re?=
 =?iso-8859-1?Q?hRPTIhCV3N09uLq/ZAhraxYSWH/M16VKY0iueaor/1MD59tn94XK+urq64?=
 =?iso-8859-1?Q?xa4fi3eDqPt43bPyffX8BlFBPQ/P/PpVk51pxxFuqBYMVRdMonFaS/Rey5?=
 =?iso-8859-1?Q?UAccAmZeoZWbNzUqAux9PqsG1v2E0dd/jiEtj6+DCzjN8w8P9Oqd9IyeEu?=
 =?iso-8859-1?Q?JAHB2Z7DUs4IL8Ums4KFRSbyQXSgbRnDyM/BB3Chx2Ru2hL5TjLOc9mbQb?=
 =?iso-8859-1?Q?QCLIn1a7C+HgdNCc1ABYACRRBnmSaYvEozSaEWqnIeJAjT+W1bt6kyWLpN?=
 =?iso-8859-1?Q?ClLooGKP9hLUjgRv8XyAkQRwdQ0aOt4qfeq3XftBMvB8gUVqo0rt1OlZJU?=
 =?iso-8859-1?Q?tJKRANCsoofLYts2zsRuaK1d4=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ea293112-d8d9-476a-5d3d-08d9d434e0d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2022 12:29:42.4165 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: le+zUe7fjsdW6zZGR6FoDYk8rhD0b9K5TfPAEdVWG2gmM2qL+UYHUJo4vxijsSW8wCOozMIK+Z+ZhRassC1Gr8UQT7q228RFEDH/jxKnJWk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRXP264MB0552
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
Cc: "Naveen N . Rao" <naveen.n.rao@linux.ibm.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

BPF_REG_5, BPF_REG_AX and TMP_REG are mapped on non volatile registers
because there are not enough volatile registers, but they don't need
to be preserved on function calls.

So when some volatile registers become available, those registers can
always be reallocated regardless of whether SEEN_FUNC is set or not.

Suggested-by: Naveen N. Rao <naveen.n.rao@linux.ibm.com>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/net/bpf_jit.h        |  3 ---
 arch/powerpc/net/bpf_jit_comp32.c | 14 +++++++++++---
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/net/bpf_jit.h b/arch/powerpc/net/bpf_jit.h
index b20a2a83a6e7..b75507fc8f6b 100644
--- a/arch/powerpc/net/bpf_jit.h
+++ b/arch/powerpc/net/bpf_jit.h
@@ -127,9 +127,6 @@
 #define SEEN_FUNC	0x20000000 /* might call external helpers */
 #define SEEN_TAILCALL	0x40000000 /* uses tail calls */
=20
-#define SEEN_VREG_MASK	0x1ff80000 /* Volatile registers r3-r12 */
-#define SEEN_NVREG_MASK	0x0003ffff /* Non volatile registers r14-r31 */
-
 #ifdef CONFIG_PPC64
 extern const int b2p[MAX_BPF_JIT_REG + 2];
 #else
diff --git a/arch/powerpc/net/bpf_jit_comp32.c b/arch/powerpc/net/bpf_jit_c=
omp32.c
index d3a52cd42f53..cfec42c8a511 100644
--- a/arch/powerpc/net/bpf_jit_comp32.c
+++ b/arch/powerpc/net/bpf_jit_comp32.c
@@ -77,14 +77,22 @@ static int bpf_jit_stack_offsetof(struct codegen_contex=
t *ctx, int reg)
 	return BPF_PPC_STACKFRAME(ctx) - 4;
 }
=20
+#define SEEN_VREG_MASK		0x1ff80000 /* Volatile registers r3-r12 */
+#define SEEN_NVREG_FULL_MASK	0x0003ffff /* Non volatile registers r14-r31 =
*/
+#define SEEN_NVREG_TEMP_MASK	0x00001e01 /* BPF_REG_5, BPF_REG_AX, TMP_REG =
*/
+
 void bpf_jit_realloc_regs(struct codegen_context *ctx)
 {
+	unsigned int nvreg_mask;
+
 	if (ctx->seen & SEEN_FUNC)
-		return;
+		nvreg_mask =3D SEEN_NVREG_TEMP_MASK;
+	else
+		nvreg_mask =3D SEEN_NVREG_FULL_MASK;
=20
-	while (ctx->seen & SEEN_NVREG_MASK &&
+	while (ctx->seen & nvreg_mask &&
 	      (ctx->seen & SEEN_VREG_MASK) !=3D SEEN_VREG_MASK) {
-		int old =3D 32 - fls(ctx->seen & (SEEN_NVREG_MASK & 0xaaaaaaab));
+		int old =3D 32 - fls(ctx->seen & (nvreg_mask & 0xaaaaaaab));
 		int new =3D 32 - fls(~ctx->seen & (SEEN_VREG_MASK & 0xaaaaaaaa));
 		int i;
=20
--=20
2.33.1
