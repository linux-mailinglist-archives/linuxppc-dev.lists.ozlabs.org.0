Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E13495B94
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 09:07:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JgBnX28jbz3cVW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 19:07:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::618;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0618.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::618])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JgBmV544Dz2xDv
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jan 2022 19:06:50 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JzlsbgDKNeZnofpP4z+ose3lHCvaXdOBo5SsRRf7eny/EUuxSk+hO9AzlA7D100bAGZlehmKhYhHX1FBJE61ODGGdCLhQU6W2onumrHuCaxAopQ2d6wbJD/XgAiRDk/0TLup9NVxnEnP6skvGDIRPbTmwP+9XejpbXdX93rOPfw/f0rFgdEYI2IfdB441Wc7ZjkdjpDQhZtQ0gTuw60/oPeU0C0nX+oJc6V0KesNSN9+yomqamgfRWIEdj6pYGbZyl0cpQSZGE7r46czFI6+OdU75wiP0l28bCZesc+MGJ1EsooJ3PcHYgIqtOiLZURxZfMpLPKBOz/oqI11/9lMZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7zYbH831aFhbE4WPMdgECvazcemaLo2YBZt5g7tbMk4=;
 b=hwMmXJbUgIN95HsVn2N343dfhbB8bU9i9fe7VFMa01XmZmxfk/F4mWJB2FqRQRutJcDP9f/5qC5i5MVYZ0zU10LbU6YikF0FXTOrLk0VgQM90B0Sa27vAuCajtgvj6a2JUG2mlJRg0mazE4tnHePX0ZNqM4D6cU8O5lDOAEikLcMl8Jasp41gfdX2jJh9nQVZc3oIlysp6iAwlJlbDtkp6fSDK9mS9Mqfu680UEBau2tJtgWV0oZe5uFIWtrmmSFtYkEbaVForE5etbR4V1dekWbSDQQZi7JwbNvXw3bQrHp/8L7xxLWWnsBm2FtVsg50GyoYe3hMz+D5FoY62pk/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2035.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Fri, 21 Jan
 2022 08:06:32 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5%5]) with mapi id 15.20.4909.008; Fri, 21 Jan 2022
 08:06:32 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 2/3] powerpc/lib/sstep: Remove unneeded #ifdef __powerpc64__
Thread-Topic: [PATCH 2/3] powerpc/lib/sstep: Remove unneeded #ifdef
 __powerpc64__
Thread-Index: AQHYDp3N3afa5Bk3SEeYq+oBxP6DJQ==
Date: Fri, 21 Jan 2022 08:06:32 +0000
Message-ID: <ee61b693bc7e046eed1abb7a34909eb4878a9442.1642752375.git.christophe.leroy@csgroup.eu>
References: <6c608fd4795e2d8ea1a0a449405a0087f76d8bb3.1642752375.git.christophe.leroy@csgroup.eu>
In-Reply-To: <6c608fd4795e2d8ea1a0a449405a0087f76d8bb3.1642752375.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d06ae815-b1e3-4cf2-14ab-08d9dcb4efee
x-ms-traffictypediagnostic: MR1P264MB2035:EE_
x-microsoft-antispam-prvs: <MR1P264MB2035A7F4F878C6DCA752A3BEED5B9@MR1P264MB2035.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:1360;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wSBP5G8p191bcbdVd/k7aAHyBJ48ROlkbS/tu5qUPhCakHvQfU0gCHutnjeemZMEoYvPrQx7mPxDWhBj8feNFIQajy5ei2flXpgBBx4TBlL6cGJEUc3KR0wTCNqowmwuuwvoz2IH18YedIoh7SFMNtLo91EjJsMworeTd+hJTAeVgQhlR+Ny1600flGeHLDhHwcYJh5Ne2S+87lyo+EVoHZalXTfrS5VrspV6OVqRYx+P+8/5Qyp1oyuO+2Ks0g2mVbsahoKchjKPdBOCt/xOB7wgnpHHQftC8H/nsvjdpZP+1C8eTPNxJ7eXBnDGwGGnqRvYqC+XjlTab35PB8vcFS1eiriFILEvCFHZafJl73T7tstXABQ2rR76FefGuLV9AJXrJbFhr7xJrT1PsJK5PHq+e1HVB/pVi1ynQoBo9NsDqvbu5EtFdAqNV1RqQ8o0B5eQTztMPOof7DBWwRL+afvxlcQQXZUomO92URe1JFylPTjCADtHLCBvSzoO250c3M7zlHmhhYn2kc7D+ZVvIAI6m7Hhp8LiMDp0QhKt+wTi//70GnSBSNkQdCeHZtz1qCw5hTFalACWjW5OysivE2IxKw0RGcbsz3oNe0HEnU97U7FkXAF5o39FRBDP+3qEGkOR88nFkTbfVQTPtN0xeQHyPsgeGBilgrqCZp/DyjfS1qPkBBQkfVLbHUj0/iDKplhB2R3GmSJ47RNwCazyg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(44832011)(186003)(4326008)(54906003)(2906002)(316002)(6486002)(508600001)(8676002)(66946007)(66476007)(86362001)(26005)(66446008)(64756008)(36756003)(8936002)(83380400001)(66556008)(38100700002)(76116006)(38070700005)(71200400001)(110136005)(2616005)(5660300002)(6506007)(6512007)(91956017)(122000001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?zEi8m4vaAC2BLCVKlZ9myKr2og13mDGC9lhZFpXrA4nyvu5NFfi+frx9zS?=
 =?iso-8859-1?Q?y85PobqeE1hmGKWco+ExBVJgGiAyoSuy/PZTpmvE56tiOManenQZlUJg/x?=
 =?iso-8859-1?Q?+qyg1tKvXRHV7mmEd9U7z2YZ3imRwfmP8ttsUlqcU6JhA5AgcguAfw/KlW?=
 =?iso-8859-1?Q?5cv/CBLY/QnVOpNiUA5EzfVkceUI0kv6G8yES90pdQii8hxmdlhosLKAFb?=
 =?iso-8859-1?Q?gUs+ZshJplNoYnKceY6PqXNcs32Cx3eyLDJCDYz1INotUlww7unJ4osH33?=
 =?iso-8859-1?Q?gz2BMHoIxxatWYcaHOtjoQc16pKG5rehB8Z0C+Oxa8DzxXpkT9l9FSVqka?=
 =?iso-8859-1?Q?H/Ad8VDJYjc0XVUPVOybID4HHI7Szsuxnf+xEpX5kB5XunDO65jY6X+z67?=
 =?iso-8859-1?Q?uoZ/FUDbc5a3GfJeBS+4t6W+e2yymiAEnzE07xhEgJubdUNaUoP8xgmOlS?=
 =?iso-8859-1?Q?77m75ejZyyf5dx61lSEUaOHKwt0JeL3QON2M7jP3UjkuLz9W5yZ2qJmj2u?=
 =?iso-8859-1?Q?X0r1Ittb4sVGHBHbsCTw1EytAxwUAt9CA6AtGCDLGa+UYFZEPOB/awuvl/?=
 =?iso-8859-1?Q?w5Fo+ZOsEGe3G3G7i6TGoP4y4iP1QMsKq/WgfXk+/V3IiBgEfTXVIqJQe+?=
 =?iso-8859-1?Q?tsSRfYJVDpTw7OQOwZ2zrjD+zRSlryT0rrnA0FvuD3m7erjGvnjK0ZcO5o?=
 =?iso-8859-1?Q?jLJ9mJstFYP43+XBr1czkyUZtUvn6UlkGR4JMtK6X4IDfIFRNbaEPIe5Uh?=
 =?iso-8859-1?Q?3lLz58NlJXi/b7dpelzCWNzDRmTvsCNLw2+M4L4487n8BNHZDGmNbqNSrO?=
 =?iso-8859-1?Q?V40a1XMQ5xHJ8roJ02E45Eqjje6Gg1odOxDrhMnU7T/pRy233NioknVJ4n?=
 =?iso-8859-1?Q?zBNFwu5qjNQ99GJXKR3i2n6/xUVRad600r6cUgLhtyJrbY91z14mzJBWy5?=
 =?iso-8859-1?Q?FU9hZ8+9HFJQJy3vdAYmI+LD2UfFYlNt7kNXIkom91ktdRQMlO/ibnntdV?=
 =?iso-8859-1?Q?oPDa0IEOp0EWPbqiyux/vPf1CWtOjAFBraoQkv+uLCGRixWtzRfNE8+5wo?=
 =?iso-8859-1?Q?EQr7PqydlGsqUu9rrD93PF6RoDOx9G3pkbOEAJFshih/NImyLCcnSaDWzL?=
 =?iso-8859-1?Q?cNOKX1a1XuJU+NZINXs1B0VMOwe8qv0RT+USDekCzPm/2rv/zvemxObhBa?=
 =?iso-8859-1?Q?AS3tWwSri1GA1Or4OHmyTn95D07ZOH8OR296TU1PMpfOCh/GCoymqb2Eqg?=
 =?iso-8859-1?Q?yoV6NKNU2h/2PP7/48wuFm23nWZv+7TBc3S+83xdPLL2M6N9msKXjoVguj?=
 =?iso-8859-1?Q?fj1b6AUMPz4KqqWQuyo4RiXM+KTaB9CJQzYWEowIIIdhGoCrE3UNM3Uu1x?=
 =?iso-8859-1?Q?D1OnlXj+SEO90/z2GqwkLFYh6HuwovbcH3yLR0tXgO8pbS2rmoREzn1wRT?=
 =?iso-8859-1?Q?ms44jAY618UHJWmU21sRy2qzcz/Q0FESFDWGPtzBcVv4QhCLpcl9fnPMK+?=
 =?iso-8859-1?Q?11hfoIUlBA/mWBXSHYfLHvvtFYfgkpNtxoADT/SFs9yRuMgPstj53BZTmA?=
 =?iso-8859-1?Q?7fQBUsLMJABmTinof+djCs2mghEsRROHTOQDt8rHCXYE5ET5dq9P2OVW9u?=
 =?iso-8859-1?Q?yy+Bwp0cxiMyzZx+2TEUaY4tvS7uJxoxrHhh9nweaw2U1ee/2vWDOwhrxf?=
 =?iso-8859-1?Q?0JRhKV/MBTAU+r9gIJmjFpweGCRxEGW8OZPDHtprkFy9f9Zkas+Uts8OKW?=
 =?iso-8859-1?Q?FWoJrjUNpG8M2kUQ2LNS5Gm9A=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d06ae815-b1e3-4cf2-14ab-08d9dcb4efee
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2022 08:06:32.6592 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7IJfXNHq+qp/r9n0LSasGeIWV2sQydQIvDhycq5OdBBHTdb6PAXrqHp+NvAgXMXRQxxarZRuPsk3ZKbnRQfDl+UP1EXW9Crf3he+tGFn3I8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2035
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

MSR_64BIT is always defined, no need to hide code using MSR_64BIT
inside an #ifdef __powerpc64__

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/lib/sstep.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
index b7316d697d80..4aabe3854484 100644
--- a/arch/powerpc/lib/sstep.c
+++ b/arch/powerpc/lib/sstep.c
@@ -75,10 +75,8 @@ extern int do_stqcx(unsigned long ea, unsigned long val0=
, unsigned long val1,
 static nokprobe_inline unsigned long truncate_if_32bit(unsigned long msr,
 							unsigned long val)
 {
-#ifdef __powerpc64__
 	if ((msr & MSR_64BIT) =3D=3D 0)
 		val &=3D 0xffffffffUL;
-#endif
 	return val;
 }
=20
@@ -1067,10 +1065,8 @@ int emulate_dcbz(unsigned long ea, struct pt_regs *r=
egs)
 	int err;
 	unsigned long size =3D l1_dcache_bytes();
=20
-#ifdef __powerpc64__
 	if (!(regs->msr & MSR_64BIT))
 		ea &=3D 0xffffffffUL;
-#endif
 	ea &=3D ~(size - 1);
 	if (!address_ok(regs, ea, size))
 		return -EFAULT;
@@ -1136,10 +1132,8 @@ static nokprobe_inline void set_cr0(const struct pt_=
regs *regs,
=20
 	op->type |=3D SETCC;
 	op->ccval =3D (regs->ccr & 0x0fffffff) | ((regs->xer >> 3) & 0x10000000);
-#ifdef __powerpc64__
 	if (!(regs->msr & MSR_64BIT))
 		val =3D (int) val;
-#endif
 	if (val < 0)
 		op->ccval |=3D 0x80000000;
 	else if (val > 0)
@@ -1170,12 +1164,10 @@ static nokprobe_inline void add_with_carry(const st=
ruct pt_regs *regs,
 	op->type =3D COMPUTE + SETREG + SETXER;
 	op->reg =3D rd;
 	op->val =3D val;
-#ifdef __powerpc64__
 	if (!(regs->msr & MSR_64BIT)) {
 		val =3D (unsigned int) val;
 		val1 =3D (unsigned int) val1;
 	}
-#endif
 	op->xerval =3D regs->xer;
 	if (val < val1 || (carry_in && val =3D=3D val1))
 		op->xerval |=3D XER_CA;
--=20
2.33.1
