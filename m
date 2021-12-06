Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BE84694CD
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Dec 2021 12:12:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J714Q2PDXz2yb1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Dec 2021 22:12:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::62f;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
X-Greylist: delayed 14903 seconds by postgrey-1.36 at boromir;
 Mon, 06 Dec 2021 22:12:28 AEDT
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (unknown
 [IPv6:2a01:111:f400:7e18::62f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J713w3NYHz2yLd
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Dec 2021 22:12:24 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UfTSg08KMsFG9nIwDvoUWhnqzJx7TAdb5AsyxcNVT3K8Y1yTWheOKOxhPl1pwc5BoLn9KAjYKqOiTGnvAD8KEzK8Q0uT7jI96ww4ywwlKVbx1yda68hrIcUTj+YFCklU84GIK/Iaasi5GTk8ikC5Y+zhc58VvVgBIz6+r00YAgFomqszx30Y5fn4UQjS06CVF+bSxgv3Xi5XCG0h2eksRA1mzEHi4PCjaerwGMLWMw4shdb3PvkxZPuyj/dN+aCLSKm9XD24mWDLtIT5vAjJkahlLIWU7Vcr+VVFxWgI9xAGsWDzUAvQlrjNjse9Lx9gv34dclStbLwrHZC9OE6m3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YU1O7rFTsJFN+AjsMEI5xXr9s19wf9Qpi2GaLzskffc=;
 b=ULAfC1655RHLDnSF1ZkCJpWCJQKGz28bZydAAr9PTWjQFay8Prr0JRwoWKYvv34WTGTlVcGSyrFamreh5TE/Kszjrizs2kpmW9BNDzLt0WM3p645oyePa8XYPC2ryQLaCtcq2wj+WUM2r0hCFsWc8CyPER92Jm1w/9DC5GthtDhsbz4B+i+5W6oSrXHxPLaUUYuNtWVOnzuc/1cBOgJ9rhcrqQqsglLrnAIdX81swaiqgWdzDKDK1OxuNKyN3DVFFUmwNFmTCgSk+RuFfwjPWGJV3ZV0ya7XdxAyrgA1T63+JZlsO7S4HbXNsH6bbMN0iBWlhCUCHSUxZfUm7ILZxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRXP264MB0104.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:20::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.20; Mon, 6 Dec
 2021 11:11:51 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f%2]) with mapi id 15.20.4755.022; Mon, 6 Dec 2021
 11:11:51 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc/fixmap: Fix VM debug warning on unmap
Thread-Topic: [PATCH] powerpc/fixmap: Fix VM debug warning on unmap
Thread-Index: AQHX6pIRHFFuQfD5tUqKFOXRId3biQ==
Date: Mon, 6 Dec 2021 11:11:51 +0000
Message-ID: <b0b752f6f6ecc60653e873f385c6f0dce4e9ab6a.1638789098.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c52cbe1d-e2d8-4dd6-0124-08d9b8a9340c
x-ms-traffictypediagnostic: MRXP264MB0104:EE_
x-microsoft-antispam-prvs: <MRXP264MB01049E3687B59437DB13614BED6D9@MRXP264MB0104.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +oYKA+B76w222g3PJBJP6nA3wIDeVc5uqhgwdoWDviyTU560vUFjejQzaDYFIGx9WmEUOFWPtKQfASWNf3vUnScmZFW9CNXEUtQqdED7aUs8DMUhKB7ubTRsT9v305aOAQP9XnTnV6VDtKX8m+GTDGtGrBcSH8g7fl3UzjNwllc0XTyS9prz029sjz+fa/1F5mqImcKaJEO13AVEqfmjf/jdKS1hcLkj+FlHGnX0nMBiGvMo2C/HQ+9OTh1QgBmjKrt2ZG+RTUvXTFBNE/oyesBf/TDBtyeYGa0knVZUDv+mWJFXSdeL3Vkcnk0byMN3KB/0auG9Hd76TkbtjjbZiY8uT4vThKkoR9pV0g34uc1pfHwAnYdbdeEFP2o75puj/pSWOYASCERvK0ZmPnzIjQYpYAKHhnty0kdy9oGNK39tLOsmniJQ+HeT83ihNCgJI3mql/2LEyM+iBcfMkHp/3w5Hqd/H8wlpOOruDBWDKUdkgnCYZmmRC+7weUt4igzkQBSh7ijMOIW0lNgwm1E6L0L9qLeUzvRZ6Z2N6+NVdZVYKEJtbEQExjFvq8ZZpdPeV8wbt8hF0NZop2zwyUbpprWixP3Ssu6V1QaibetObyCtoX1rlVoCnhgWH4W44ZhQeVRy6keKhtaxCiF5MFDhEIlo32PIRgNFp7Cc02CVv6iOUp8qeNkhZlGc+5GIAVrDSiDedVFOmllZ3x7UXUjhQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38070700005)(316002)(508600001)(66446008)(66946007)(76116006)(66476007)(66556008)(91956017)(38100700002)(110136005)(83380400001)(64756008)(54906003)(36756003)(5660300002)(122000001)(86362001)(2906002)(2616005)(8676002)(8936002)(6486002)(4326008)(186003)(44832011)(6506007)(6512007)(71200400001)(26005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?+4x9yrG1o5gcWWpHTGwY9IYg5rC0Pv7Hd8tZj/8akOZcSEdz/kV52z03go?=
 =?iso-8859-1?Q?0rl0+73K8tg0Bh4jT0xeI3ahqRwbLEuDKjjm1+ZsLf4ejBTy6QJu08cnDY?=
 =?iso-8859-1?Q?ORUuBqLgUKG+8Gmlz+5bvxY425egJpeg5JlR+aTw9yZQsiU1kYaxGsHMKH?=
 =?iso-8859-1?Q?ozfabnem05a5dVnm+xBU80XyOE+tyHQzKWBWwzsPjUyP6zqDhPTsYHFWxv?=
 =?iso-8859-1?Q?+6PwrVNtQ0b8zTaI/o08+9qJh0RJmNq4XFvQcs5R2jcn+F+FbcjglY0tSM?=
 =?iso-8859-1?Q?R45Fk9RdXG5/TSbZyJ3C/KIMfaCujx3xf5zcNOKcwNTQmP7Cs+kP0ojZIW?=
 =?iso-8859-1?Q?63Baw7aFANzNdXCmcWQVqKoUsvF/+S57NV6zDu3H5peMeD1sR6LCqGZ/FF?=
 =?iso-8859-1?Q?b0EW3YAqyGgDBUBlr1TddxYGRt9vkPW8LVa9vofV9WaxDFKTipUouv8aF/?=
 =?iso-8859-1?Q?AsJ1NmDAsoT1cTd16crF/BG6dlMLx1d+5eRDlJ7Iplkguv3b43TBKKq1nt?=
 =?iso-8859-1?Q?aPqvFLFXnzn5+4Q99G28bcSXZKwoo9YDea4cPXIWE5gyRkfSnQ4UPN150K?=
 =?iso-8859-1?Q?p829uyJFeT4IHgse8z7E3xqGuj5gbvo22pB2JhG2XNWR/kUf+WIpelr8Zg?=
 =?iso-8859-1?Q?s684Yev6nrVQTkX65wzTeu12mZT1S+UBBVdRyaZhg2Q3oZ9GTe3egAx+h6?=
 =?iso-8859-1?Q?JoOrYfqBXlGpvvRCztmiyo7UWEaLFvZNDUfaSOxiCruM7gYO/b7fc3tWKV?=
 =?iso-8859-1?Q?lrxt4po/l5x54fQmvLCanB+mJdiCAfeP5bXEZbWys4mllaSZ/k13smT3DS?=
 =?iso-8859-1?Q?tLzCKctIiu1dAGyM8xokQdWR1HK0ImLeis+SC0+zgmc8oq8q2slqzan68y?=
 =?iso-8859-1?Q?jX236nu+BpMM/B94nMH5MngcXz/RP7EPZrJdolxin5sDFZGQT1DQvDGGvN?=
 =?iso-8859-1?Q?Tl5XkNUiMyARFXvsXq5tdzXRVIKJzkSfpUtIYZBvJb0e7wn41OV82ABxcT?=
 =?iso-8859-1?Q?izx9Qwo6rF5RRjBckABCcjNiyvQbVbcUViwIUNcbkXvG/pV4ANssTf7Dlk?=
 =?iso-8859-1?Q?aKLGqVb9klojI2wcSrTe2t3b0YQ0+5iLC0NFVowEG289p6AEh61AusovTA?=
 =?iso-8859-1?Q?6SSsN6cXxEkFAqc63xOyw6INwCepcLrUsOmaC3IkHVqieAWMdZMVJ/N0d0?=
 =?iso-8859-1?Q?0m8tlRxOBP9SECGi8TmssYm+1GZrVTR9fiSLdKFoP3KHlHygVVrMpzmBPZ?=
 =?iso-8859-1?Q?/Noy4hYbuSwR3rrWzVLaljN2P4XxH31CzaXzApJbwu9zMvrLl5x6pjXdX5?=
 =?iso-8859-1?Q?PrIOEuPEm7XcDxKsEIVlHv7uomu+b75674ucp8vLJl0x3CZC1C4dMdVEw0?=
 =?iso-8859-1?Q?/p3AfNfDo8bCYZ9VKpAdu6XbqPRVECwk3/mIT3H2cgWm1tCczfu0FyZJGg?=
 =?iso-8859-1?Q?UhpfWlHm4DydCHj3Bc39jeJTMpSY7KmvbEu+3Ihs5Mnc4u/N1yNqmVWTN+?=
 =?iso-8859-1?Q?hn9HU3itobMnx9YmkSKggVxR66Je5NETSBE1PDzWct0/+Ja4XD0RymBVLH?=
 =?iso-8859-1?Q?I4/TxvQSELZK7F/qcwEbrP7UJWedMrFm+HftANI8XTTAh0F7epBIa+jtAW?=
 =?iso-8859-1?Q?dbFMFZDIqO340zFSR1tB0BgRYYiDb6aAPHuKTUKLAxq/Ubgg1bz10Nm2bc?=
 =?iso-8859-1?Q?DMZQg9GecQuhOyxgIZExuX3ckkg0gpT3ouw6GrCUwdoSI2McUZpS5KNRe6?=
 =?iso-8859-1?Q?WZheLITs3tjlmLO7FLNjY8Gn0=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c52cbe1d-e2d8-4dd6-0124-08d9b8a9340c
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2021 11:11:51.0975 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XLja+0UbKKFOBMI9CEfG+4UwBYwPk37ZUs+N3JQJ+rw5xRMFM8hDx0U8aKBwMtf1mSVA+gf4Gy04UaHlCM5MLn3/G6QMyUtp33+QFLtEXhs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRXP264MB0104
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
Cc: Maxime Bizon <mbizon@freebox.fr>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Unmapping a fixmap entry is done by calling __set_fixmap()
with FIXMAP_PAGE_CLEAR as flags.

Today, powerpc __set_fixmap() calls map_kernel_page().

map_kernel_page() is not happy when called a second time
for the same page.

	WARNING: CPU: 0 PID: 1 at arch/powerpc/mm/pgtable.c:194 set_pte_at+0xc/0x1=
e8
	CPU: 0 PID: 1 Comm: swapper Not tainted 5.16.0-rc3-s3k-dev-01993-g350ff07f=
eb7d-dirty #682
	NIP:  c0017cd4 LR: c00187f0 CTR: 00000010
	REGS: e1011d50 TRAP: 0700   Not tainted  (5.16.0-rc3-s3k-dev-01993-g350ff0=
7feb7d-dirty)
	MSR:  00029032 <EE,ME,IR,DR,RI>  CR: 42000208  XER: 00000000

	GPR00: c0165fec e1011e10 c14c0000 c0ee2550 ff800000 c0f3d000 00000000 c001=
686c
	GPR08: 00001000 b00045a9 00000001 c0f58460 c0f50000 00000000 c0007e10 0000=
0000
	GPR16: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 0000=
0000
	GPR24: 00000000 00000000 c0ee2550 00000000 c0f57000 00000ff8 00000000 ff80=
0000
	NIP [c0017cd4] set_pte_at+0xc/0x1e8
	LR [c00187f0] map_kernel_page+0x9c/0x100
	Call Trace:
	[e1011e10] [c0736c68] vsnprintf+0x358/0x6c8 (unreliable)
	[e1011e30] [c0165fec] __set_fixmap+0x30/0x44
	[e1011e40] [c0c13bdc] early_iounmap+0x11c/0x170
	[e1011e70] [c0c06cb0] ioremap_legacy_serial_console+0x88/0xc0
	[e1011e90] [c0c03634] do_one_initcall+0x80/0x178
	[e1011ef0] [c0c0385c] kernel_init_freeable+0xb4/0x250
	[e1011f20] [c0007e34] kernel_init+0x24/0x140
	[e1011f30] [c0016268] ret_from_kernel_thread+0x5c/0x64
	Instruction dump:
	7fe3fb78 48019689 80010014 7c630034 83e1000c 5463d97e 7c0803a6 38210010
	4e800020 81250000 712a0001 41820008 <0fe00000> 9421ffe0 93e1001c 48000030

Implement unmap_kernel_page() which clears an existing pte.

Reported-by: Maxime Bizon <mbizon@freebox.fr>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/book3s/32/pgtable.h | 1 +
 arch/powerpc/include/asm/book3s/64/pgtable.h | 2 ++
 arch/powerpc/include/asm/fixmap.h            | 6 ++++--
 arch/powerpc/include/asm/nohash/32/pgtable.h | 1 +
 arch/powerpc/include/asm/nohash/64/pgtable.h | 1 +
 arch/powerpc/mm/pgtable.c                    | 9 +++++++++
 6 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/32/pgtable.h b/arch/powerpc/in=
clude/asm/book3s/32/pgtable.h
index 609c80f67194..f8b94f78403f 100644
--- a/arch/powerpc/include/asm/book3s/32/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/32/pgtable.h
@@ -178,6 +178,7 @@ static inline bool pte_user(pte_t pte)
 #ifndef __ASSEMBLY__
=20
 int map_kernel_page(unsigned long va, phys_addr_t pa, pgprot_t prot);
+void unmap_kernel_page(unsigned long va);
=20
 #endif /* !__ASSEMBLY__ */
=20
diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/in=
clude/asm/book3s/64/pgtable.h
index 33e073d6b0c4..875730d5af40 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -1082,6 +1082,8 @@ static inline int map_kernel_page(unsigned long ea, u=
nsigned long pa, pgprot_t p
 	return hash__map_kernel_page(ea, pa, prot);
 }
=20
+void unmap_kernel_page(unsigned long va);
+
 static inline int __meminit vmemmap_create_mapping(unsigned long start,
 						   unsigned long page_size,
 						   unsigned long phys)
diff --git a/arch/powerpc/include/asm/fixmap.h b/arch/powerpc/include/asm/f=
ixmap.h
index 947b5b9c4424..a832aeafe560 100644
--- a/arch/powerpc/include/asm/fixmap.h
+++ b/arch/powerpc/include/asm/fixmap.h
@@ -111,8 +111,10 @@ static inline void __set_fixmap(enum fixed_addresses i=
dx,
 		BUILD_BUG_ON(idx >=3D __end_of_fixed_addresses);
 	else if (WARN_ON(idx >=3D __end_of_fixed_addresses))
 		return;
-
-	map_kernel_page(__fix_to_virt(idx), phys, flags);
+	if (pgprot_val(flags))
+		map_kernel_page(__fix_to_virt(idx), phys, flags);
+	else
+		unmap_kernel_page(__fix_to_virt(idx));
 }
=20
 #define __early_set_fixmap	__set_fixmap
diff --git a/arch/powerpc/include/asm/nohash/32/pgtable.h b/arch/powerpc/in=
clude/asm/nohash/32/pgtable.h
index b67742e2a9b2..d959c2a73fbf 100644
--- a/arch/powerpc/include/asm/nohash/32/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/32/pgtable.h
@@ -64,6 +64,7 @@ extern int icache_44x_need_flush;
 #ifndef __ASSEMBLY__
=20
 int map_kernel_page(unsigned long va, phys_addr_t pa, pgprot_t prot);
+void unmap_kernel_page(unsigned long va);
=20
 #endif /* !__ASSEMBLY__ */
=20
diff --git a/arch/powerpc/include/asm/nohash/64/pgtable.h b/arch/powerpc/in=
clude/asm/nohash/64/pgtable.h
index 9d2905a47410..2225991c69b5 100644
--- a/arch/powerpc/include/asm/nohash/64/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/64/pgtable.h
@@ -308,6 +308,7 @@ static inline void __ptep_set_access_flags(struct vm_ar=
ea_struct *vma,
 #define __swp_entry_to_pte(x)		__pte((x).val)
=20
 int map_kernel_page(unsigned long ea, unsigned long pa, pgprot_t prot);
+void unmap_kernel_page(unsigned long va);
 extern int __meminit vmemmap_create_mapping(unsigned long start,
 					    unsigned long page_size,
 					    unsigned long phys);
diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
index ce9482383144..b7385e637e3e 100644
--- a/arch/powerpc/mm/pgtable.c
+++ b/arch/powerpc/mm/pgtable.c
@@ -203,6 +203,15 @@ void set_pte_at(struct mm_struct *mm, unsigned long ad=
dr, pte_t *ptep,
 	__set_pte_at(mm, addr, ptep, pte, 0);
 }
=20
+void unmap_kernel_page(unsigned long va)
+{
+	pmd_t *pmdp =3D pmd_off_k(va);
+	pte_t *ptep =3D pte_offset_kernel(pmdp, va);
+
+	pte_clear(&init_mm, va, ptep);
+	flush_tlb_kernel_range(va, va + PAGE_SIZE);
+}
+
 /*
  * This is called when relaxing access to a PTE. It's also called in the p=
age
  * fault path when we don't hit any of the major fault cases, ie, a minor
--=20
2.33.1
