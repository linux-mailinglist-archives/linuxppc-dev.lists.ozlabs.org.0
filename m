Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DAA495B93
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 09:07:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JgBn13rgqz3cHW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 19:07:17 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JgBmV1Sh1z2xDv
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jan 2022 19:06:48 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A42e67B5eNA9Ew5mLc1a9Z3z+PedzLAaHzRCgSKA3iscQzGE+MCzocITyyaNbRoe7acttmKCqlefKa2s5GBZMe0GHJlt0tjZuUXvmdCjg2mmARtk19wbc1O5zzVvdM2et7x4CDTgi4xQzA7BqBKtT4QAHR38gWZE0J16l8R2I1MuwQYv349keHybI5aRApyQB2r67InR8QXm7P8E9uzMtVAdp0ut/dto498Le9jwaoxHw0ZuCx0mhwyd1dnm+m44RM8/qlRPHlvxL0n/+HSlVQ9g1KcBEGKVvcntRF9MPTdgSbppzrjtx+1z5/RmpT/whRgcXE4mmxgYGdp2rJ6rDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G8hs8l7WHPPydoXukEZNT/gIMPrgXT+B0Vp+IO3Bf2k=;
 b=UvkPk0u94hH0w7liPawsg/Pq+HdQmSNyrGh7af6DjXYyX6AzCvb61cs3aSJMmDRR/tIYL3/QPonIw0rl7aPUKzws6N5h6B03EsyqBij+79T5VKyLTgh5++Ucd9u+uMGPxoJnqym2/rCwwYr3lqtVkwSCejyw01rvyBSGWiNs54JISGtiJDO8eA8xhFA/bQ5hehhuEPcLEvJxHQUIgmf2IEa1vNhjWMOCMTf/HfrARGE12d/xhA6+V3FtiKB9zNcR0ZWPrO9qcSE5DlKOYRm3h8yxNaivgrwvHP41qic1bfn/k198GwJmVWFQlOaDEwEDvOGxNPl62RyW1xmX2+SZ+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2035.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Fri, 21 Jan
 2022 08:06:28 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5%5]) with mapi id 15.20.4909.008; Fri, 21 Jan 2022
 08:06:28 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 1/3] powerpc/lib/sstep: Use l1_dcache_bytes() instead of
 opencoding
Thread-Topic: [PATCH 1/3] powerpc/lib/sstep: Use l1_dcache_bytes() instead of
 opencoding
Thread-Index: AQHYDp3Kwnm9xv1Fq0eWPq5uOxaSxA==
Date: Fri, 21 Jan 2022 08:06:27 +0000
Message-ID: <6c608fd4795e2d8ea1a0a449405a0087f76d8bb3.1642752375.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cb17415c-bb03-4abf-bb6d-08d9dcb4ed22
x-ms-traffictypediagnostic: MR1P264MB2035:EE_
x-microsoft-antispam-prvs: <MR1P264MB203503F94B1D326F214B1EA9ED5B9@MR1P264MB2035.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:202;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6Jl4hoTO7dks2+0edxvY+U4XknTVTDLFixcnq8nA1FuIDm70QM4+d+Y2zo5qlJfnDKAdsdbKMPJCo1k53BlYHZeMZsz6lGxRfP8GsTR7Vmv7vtPJ3G657c7KDIKejOMPZD0a1laO6YII5Fe+MOqH6LtKCIb3+Yr0uRfOiV7tIIfixDo1RaRviF/v/KuFjTNyd34Zn4mh17eI9S7I7rlg62xlhL81ZW9XUhGRtd7uC9AtJxfiHFVeI2iZEwaduFb9EfU2elobC2vKwa5Z28suOp+K+4pFTYITp9E+czGy2Pz6ZStYH5INjZJ5LMeMLX6Y+Miw003mxxiI1JPvs7l2MB6C46DtFQRr0VDLXTpnYPM2Ea6IadMenRhBZayRzSrd2vVG5NNErY6K/IVH3lSYNhfYIVKGTIudmeB2ezqHAF2kGK+ZtqlngEsykWAhI3WS1G/qqiMZ0edogmESfUqkxGAX5pyKd5MbvcgTiJsW1hKNrgwvTadN2yocbEeXBXxCgsuZmRFDgwC5iqII8uIza2qt78sDH8cfAhGFV083JgYikPxsZpkFYsryidM5/21xV45em2IDUVkVaNpx3al/c1508o45c4cUzAOVDCJyJbJ6rrsZ+HtKBIqFojcfGmJznKzJIkQ0FdCT/ocH3SF/4o/dFjLYERjVOTH9oN6Kv/Y82TKHviqphXhAcK8Yz8MAyZuAnWEjY9p3o748hlmKNA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(44832011)(186003)(4326008)(54906003)(2906002)(4744005)(316002)(6486002)(508600001)(8676002)(66946007)(66476007)(86362001)(26005)(66446008)(64756008)(36756003)(8936002)(83380400001)(66556008)(38100700002)(76116006)(38070700005)(71200400001)(110136005)(2616005)(5660300002)(6506007)(6512007)(91956017)(122000001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?W2vPXBzDFDUWrOTygzmOPi2aOpDWYvY3LtcyhTDJU/TxLShuJ8ooYXYoum?=
 =?iso-8859-1?Q?n37lKh2nrsNbvS2qnFC7KjhU60jK8qjD0ekHL7SuJ+2Urj5ZdCUdOrlWSZ?=
 =?iso-8859-1?Q?WIVqmb010JJ6TBFGXMvtYlICqOTh1ftcaCjIrnSN09h15PObqKVgLN2yqk?=
 =?iso-8859-1?Q?t+HBmTeBpAL55M0Z3Yu3egq7w0Hmp0IZlUAcHVy8Dn963D3Wcjp98HTW3Q?=
 =?iso-8859-1?Q?5jFg+Kc7b7AsNXkOS12eptbTnkbXos9TkwwBBKO+M6qOkh1GaFsiSSwW0y?=
 =?iso-8859-1?Q?JeHzoDxsLkK2Wy2EO4oZYHPWJ49HMf8yXAn37BX1kZMWN5522PgsIaNtOa?=
 =?iso-8859-1?Q?2M/bh2+F1ze1se9kCH/tAQLCHZpwFjSN4JV3r1V4KFZz2YqEFjMWT8bdZ4?=
 =?iso-8859-1?Q?RC172AC5xEh97Difds8tSV8cnvVrCZXxT/wTKAkiNEnIg5DLY+krrEw4bc?=
 =?iso-8859-1?Q?xKGFHAPyf5ab8dT5V+twYXbvjVtjNFNE93AffcPoq3p+betFTnKp7KCTlZ?=
 =?iso-8859-1?Q?QS6EutsB9pskRAZbfqG/yit8sZjRis4dhNaOvAD4OzpaydXcXuE+6aAR7Z?=
 =?iso-8859-1?Q?V+wULjuT4wvbEp7YSmSw5B5YKemmlj9z/CS8Lbj9c+O8o3fTqi1NbOpsEX?=
 =?iso-8859-1?Q?E+Ii6zUm5g1/C3n0amdsXXEVsKe+Fm7Ihz/2d6NCTcGoVY350ZN6b+8Uiv?=
 =?iso-8859-1?Q?pR/xOPgp4PcbKUJxUzMn0fwpZW6HjYtuNiTpYe6kXs5GDoxg10+vY1oqup?=
 =?iso-8859-1?Q?a59WGH7y8o0/N/Bh6qFXtPADLuOEu1kqTO4QpE/z3jL1aMRGHB8nkbPjie?=
 =?iso-8859-1?Q?kM9VpI+G6vLBReTw2MZi6oTh1NfVEMmSCZKFZxF83h6U5vHb1qpxrsBiqd?=
 =?iso-8859-1?Q?mNEIJbJfZa274PBtoq+cNN69M3+xhoqjh8wSZWk6lz2lmWqELvTqU9Nanr?=
 =?iso-8859-1?Q?yXSF8WtRAMdVBrvsZMMcws4x9kvb0g+qUMY4IHLxKKXJTIC1Zrb2HBp0QY?=
 =?iso-8859-1?Q?r8/NJ39bhwJ1q3p7goPjAvoR0HZTwSRdfBZeKz2nuKkV0+2Z2gc1+h5v6Q?=
 =?iso-8859-1?Q?AqwkF4zo9Br6To2cWxvrTEO/ISrEgTmL3LFMUcclbVg4oIVnAhsG+AMi3j?=
 =?iso-8859-1?Q?l7qzWOuTMsROyp+Uj0REQFGLb6EYCE4fZtTg9DL4M60zVlHly0APBScbXi?=
 =?iso-8859-1?Q?Q48xqBME+ftJ04ssSosIngnI20Kn9tzG9ekU5wfABYU9J3rg3MdLs6pA11?=
 =?iso-8859-1?Q?udJUChkh+ZvwMR3WrQ//8bNNN5dD/nsjhaobJdeQRixmiU6PmkJl6Xas4y?=
 =?iso-8859-1?Q?0tUnDDs/h07o4FErmk6ASY6Zebvw9cFDcYOuD29iYdp5dIbQpNSAEql1N/?=
 =?iso-8859-1?Q?V4JGH2FTzTS/7RdyseCgqqX4gXDIs+RWMN1kckW5/kw8upa3HLfBhBcdrb?=
 =?iso-8859-1?Q?4Th8pvm617fVed9PcAPPK+BYXBG2SArY8WYFHn/k7TWP9KgoKU1iQOpLlq?=
 =?iso-8859-1?Q?TpBX7M2dm/rFQmS921ZrOWY/XWM50Q10lZMfrUS8D19JasOAGI9x3piEUD?=
 =?iso-8859-1?Q?lOTxAkV8/pTJuJJ5+ByKbZxxu9hXwTXFkSeycsdIOr2zsCLQnvSs0VwFAT?=
 =?iso-8859-1?Q?+NnSYbyb+TktATp+bHgcU4UnoUWW62mmh3utTLlUIoox6eBU1+aKgKNtOt?=
 =?iso-8859-1?Q?irCsZBw217r7IGseogBDtshwCEC5N4kJ0n7K6IEmF7xQkMnVJRPBDzJ6iY?=
 =?iso-8859-1?Q?qzGYotlEIxznsrj61RAmUMNIk=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: cb17415c-bb03-4abf-bb6d-08d9dcb4ed22
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2022 08:06:27.9242 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Je4TbCRG4a8lC/k5bKBF3mkqkMnQgWxTV/IsuszPBoH+aMS984v9RMgnU+wNaJ+HoaJE5ltMyiCX0mP44BX53w2V97qjtOcnmCsbBGErAhw=
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

Don't opencode dcache size retrieval based on whether that's ppc32 or ppc64=
.

Use l1_dcache_bytes()

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/lib/sstep.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
index a94b0cd0bdc5..b7316d697d80 100644
--- a/arch/powerpc/lib/sstep.c
+++ b/arch/powerpc/lib/sstep.c
@@ -1065,14 +1065,11 @@ static int __emulate_dcbz(unsigned long ea)
 int emulate_dcbz(unsigned long ea, struct pt_regs *regs)
 {
 	int err;
-	unsigned long size;
+	unsigned long size =3D l1_dcache_bytes();
=20
 #ifdef __powerpc64__
-	size =3D ppc64_caches.l1d.block_size;
 	if (!(regs->msr & MSR_64BIT))
 		ea &=3D 0xffffffffUL;
-#else
-	size =3D L1_CACHE_BYTES;
 #endif
 	ea &=3D ~(size - 1);
 	if (!address_ok(regs, ea, size))
--=20
2.33.1
