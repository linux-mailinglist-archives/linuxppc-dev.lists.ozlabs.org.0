Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E635D490252
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jan 2022 08:04:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JcjZl5XMLz30Nb
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jan 2022 18:04:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::62f;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on062f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::62f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JcjZD2Rmjz2xBk
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jan 2022 18:04:16 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BsXBKuUQqA0dJn2i7z56NPQ1jnbxv2631hNMIq5gevOAMlEI7Gzw5ypm2Quq74YmUYGgGR/G9sJKs/QotsUksCzKci5aEmUKzFAYkk+e/kkETV+KvIE70FV97V5lV5QokhFFzHOxFF+CQ7LQSGdpk2k5mCp6SDjkdywAeZcgGaB+C4hnhoynZ3k9DS7lnBH6IAvWotYpe5mrjR/VOxs1X7YvFAoHSKRg7ZgW+NnRwLjQpVPAkayAQRrY7nQPhOaO77QXHCpHREB+CMIMYEx5PaUGAWB9Q+JnCMKKKMod9FnTYsZ7BX5ymzx2jIjdTEI9wJzrSBYmAn3LO3n/YQL32w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yC3B5Dz70PZaD8TGVPcX82U4vjTC82KfJM7q/17FFz0=;
 b=ZbT+FNHrr7UlRbLFIAFn/ExrNFw/yZbBf+ftLPGixOSiog7kjqCLQY2SR8eVoHEOFiPq1uSM8cUanNZW+ODuTM6L3PMXtSvqkV82yg8rHDkF2XS0LWzBSsyXDz2M+4GtE9gwXBlNhe1+KVRFc1tF38F8o+4hbD5nnS+EDH/ek/E4eSzuFl12c2d4UA6OFMOPZomkFdofPhgy4HpBjjzuH9ha9amjrJql0VQlLkxyDfl+CeFsiBC6gKQU8x8tUXL+c110fwnkXSaSIh9rp7B2/MhGAyVwbZ0mz+tLUZ3k2Pv1KBLVyDahjDFOTz71jg35AM3DxhMCz8h7wp6zK/BzuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3d::7) by
 MR1P264MB1652.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:10::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4888.9; Mon, 17 Jan 2022 07:03:45 +0000
Received: from MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
 ([fe80::30e4:16d5:f514:b8f8]) by MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
 ([fe80::30e4:16d5:f514:b8f8%2]) with mapi id 15.20.4888.013; Mon, 17 Jan 2022
 07:03:45 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v2] powerpc: Add missing SPDX license identifiers to DTS files
Thread-Topic: [PATCH v2] powerpc: Add missing SPDX license identifiers to DTS
 files
Thread-Index: AQHYC3Be6BU+SEeBl0eWqwDvG5eULg==
Date: Mon, 17 Jan 2022 07:03:45 +0000
Message-ID: <633873803244c2122381cb11228a6a9a7385abd4.1642402958.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cdd756dc-68ee-45a5-c165-08d9d98780ee
x-ms-traffictypediagnostic: MR1P264MB1652:EE_
x-microsoft-antispam-prvs: <MR1P264MB1652BFD4C67C2613C9189D78ED579@MR1P264MB1652.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WYVVtzzPLpHB8yFwuFuQQcNVIwpHEHAyPJyHhclRm3Pboe5sZrVjD3oTGMHqx8yTJ4eGOdI6kOEYyIdeB4M5HR3R+KakpPd5NI7A83qJv7gaUfCEBmOsEQFaSmVDWeDTlaX6T0+hkJ3Kn40fD3v3y7eUtfE4z7kLz2sHbQgOEyyXC9i39bMxaXqvcbJdmdKmuQyYHKRUH5RNqnr445wuHM1rY9q1qPht3tiINsk2bIY9piR62pPeFri/W/HEyASnCWYodsjtdEMApxn/4OCntq745TqTkoTfeI3/HoZsZVdfYymg0IE2EVdnDQRvZoF5xlQId8D+t3lGC0r9LCHEWKB9Y6ku7mm2gomwlZ1XLD7suuhO96PR2IQIB2h1ZluM60H/c0D07iRsAT8gD5BRGlyh9+zmtPuj6K2I5UQfTHV9EbZYf1ssrLVdKMxhBrsinC3fNQ8HEiUNaz/VtwT/kqHA88U4QTxOKbk/mXeKxM5co2U8zLVyBYH9zL9Uc6eDMMk3/S00w08JoM56Nnpl3HpC862CUJXAClNjnZgUcwo7X0tbez1l1LBGZ0KaP3xQZyVS9jF3AUb7QJ+Wryu8pfIN5WM9wFf6LtXgyYK9B7KPtGdLCI9EZzJ1FPTK7yShAwSNPGdyUeGZaL9toOD0TrFRZhIuuw1S7mDqLUBEzpbeIEMhMbcZfMHqVUH7ba885y0p8vNRIOmnh8+WP893wQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38100700002)(2906002)(38070700005)(86362001)(8676002)(122000001)(83380400001)(8936002)(71200400001)(6486002)(2616005)(26005)(186003)(508600001)(6506007)(66446008)(66476007)(66946007)(66556008)(44832011)(6512007)(5660300002)(64756008)(36756003)(76116006)(91956017)(30864003)(54906003)(110136005)(4326008)(316002)(579004)(559001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Q1Fp0WYzzsghgmmSbrunk4yweiVNwTxojyHWCxLu5o53NzeocDU+CJOAA8?=
 =?iso-8859-1?Q?qmUBEDZJcb+/nzicwQwAsX6Bz0AsJYx3oaJNwxcZ7Z3aiNnJWHTdN1acK0?=
 =?iso-8859-1?Q?JpZO9CUtzzIwi6B6EfdvbWfS+jBcZ3ZbkC06Cdwn1+PHVTv5lbeHrK5TF/?=
 =?iso-8859-1?Q?CZfPaN11UCEtgIr2e1T1dbUGKLhaaY7nhSbFvtjvoWAeQBhSE9AQHQ0BTj?=
 =?iso-8859-1?Q?W+AqnIXXIqvov9Ab/k7EZrM2xRkMUv+FAzrEBPfoxTogwhyEx12FX0biap?=
 =?iso-8859-1?Q?E9lxAuamQDXIqhPjPe3ehEJ+IT7SrQQ/ryt72cZkcysd6T+YGSa+deFUsB?=
 =?iso-8859-1?Q?rhZ4dBBQGi8UDYeOL5tWYH+fSbFWIjLpKtQDAM/A+OsG0wBsN+sLFXW839?=
 =?iso-8859-1?Q?waz1Qx2CyTYu7pRZv5pyPorafK48HGwciXh4ePKr9qSrd5lXoLFrKlAk/2?=
 =?iso-8859-1?Q?VEozadtfi3Phf1RO7MyyAoP5r1qeFGetUEAFOhLGxbC1HyZkNpwY6icZCS?=
 =?iso-8859-1?Q?BmVluJ58IQ4pBQVyDT6Bnv2itB6h29d1WsokKEwUaPp0hDMtZVZoZalvGL?=
 =?iso-8859-1?Q?mCAeFVaHP/L8Ff+c566BbvPPXAH3lYJikMHX4boyTV80UstIM/UEeFTLQU?=
 =?iso-8859-1?Q?hU6IqV7v722B8iHdaV4SJfWH8Ois3z97/W5OakQc+o+SU/sBZFL+9YFlRU?=
 =?iso-8859-1?Q?tt6Z9jD68S4ejeWOCh4bVT2HoTauhWmW+mc2HkmhA7vWyE3PrCkiSgW9+G?=
 =?iso-8859-1?Q?9p1DqLXo2THGrT8I/v6acsrrEWdLGSHj2Yc+zh9kXooWPIINcg/OlB/TYD?=
 =?iso-8859-1?Q?AZ+GfU/v/vMqW1PBOS8ajP8/lLfcyww0MxUJREeG/QFKSD1HxN2ktifFgg?=
 =?iso-8859-1?Q?IqDvva6MNyAqx4zfT67BNxNUgyp+uEaLdiAGG+UIpO865R40tZyi9cn7j0?=
 =?iso-8859-1?Q?PxX1eVofCgSI1IhSVRrkpTom/oJo143NbHIesr7Reg0lGJ2xI/vPwfYXQi?=
 =?iso-8859-1?Q?5IlzzfAM9RDZju89hXwewIq3Lqsou9zj7oH/rZoPF9761lbq9BCqVF5dGw?=
 =?iso-8859-1?Q?bvnjTDh2MWNN6LqC3iR8DzYK5KW9KV7OJj1kg8ZzUVDd/TUhvq9I+yGRkA?=
 =?iso-8859-1?Q?yQIoKGYRyiDTw35yqJDtinwfNHhjm9hTQGLuHkmmjMtjdd/mtYAzAu+0BS?=
 =?iso-8859-1?Q?eBTqWAIXWobkYUbhwVDp2gaNplKxXz04NeWK73Smp9kcff59ENxWHEokwX?=
 =?iso-8859-1?Q?qyKAEvfa7d+1mbVnUndjxbaRrBGWYCDfjISjWPknSxxOPOI+urayXdHfZk?=
 =?iso-8859-1?Q?8el9HlKmymH2Ui+338l5Jj4tOprNJ3hiyi9lbzMiCBO0bjXscLIYgbjqvk?=
 =?iso-8859-1?Q?rQpWZFtYPlrMn2GXlGmCxzHIw2xoVw+hvLYYlzyVsf6LYrWptZw79NZYk/?=
 =?iso-8859-1?Q?eCcw8yTHjA5DVyD3+1DsIMRbJfIW8A6xG/9eMgQfm8Vg1a3R8XYxafxw+0?=
 =?iso-8859-1?Q?BZJRRvQFWMZfL1fG19kGufDL566JmyhF8jxRMLql20dK+0IL4nu0wB/cvs?=
 =?iso-8859-1?Q?fgfNJkeRiiW5i12ZlG5s0z9kSfw1AsXAJ9/9L397y4LD+X5AYk+nfWttRP?=
 =?iso-8859-1?Q?8cOY8nTsHRpk9q4EvvlVEEx9oyGjOHGt4xAMptk6jdR/UxTmGjU7+BF4Kt?=
 =?iso-8859-1?Q?akgc1cwrcaptMOhO/c17g6kRLjpq6qkvN6Ahb9P0Um+hAvYOlBAHLGHKdQ?=
 =?iso-8859-1?Q?lsRDuc4zoOnn8G+eppAEw8Xnk=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: cdd756dc-68ee-45a5-c165-08d9d98780ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2022 07:03:45.4069 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dv7tIbqEQJf/QwpL7VZPiXflrVRKGJXcuz+0OTZbEa/8cXMpNoq545YLq/TzQn8YbNOtNV9Ow0xx3h6vAZmj8eW433xHN5e73UjHxeiP5E4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1652
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-spdx@vger.kernel.org" <linux-spdx@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Several DTS files are missing SPDX license identifiers.

For files in fsl/ subdirectory, GPL v2 or later is used based
on the comments in the files.

For others add the default kernel license identifier, ie GPL-2.0.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-spdx@vger.kernel.org
---
v2: Files in fsl subdir are GPL v2 or later
---
 arch/powerpc/boot/dts/acadia.dts                               | 1 +
 arch/powerpc/boot/dts/akebono.dts                              | 1 +
 arch/powerpc/boot/dts/bamboo.dts                               | 1 +
 arch/powerpc/boot/dts/canyonlands.dts                          | 1 +
 arch/powerpc/boot/dts/currituck.dts                            | 1 +
 arch/powerpc/boot/dts/ebony.dts                                | 1 +
 arch/powerpc/boot/dts/eiger.dts                                | 1 +
 arch/powerpc/boot/dts/fsl/b4420qds.dts                         | 1 +
 arch/powerpc/boot/dts/fsl/b4420si-post.dtsi                    | 1 +
 arch/powerpc/boot/dts/fsl/b4420si-pre.dtsi                     | 1 +
 arch/powerpc/boot/dts/fsl/b4860qds.dts                         | 1 +
 arch/powerpc/boot/dts/fsl/b4860si-post.dtsi                    | 1 +
 arch/powerpc/boot/dts/fsl/b4860si-pre.dtsi                     | 1 +
 arch/powerpc/boot/dts/fsl/b4qds.dtsi                           | 1 +
 arch/powerpc/boot/dts/fsl/b4si-post.dtsi                       | 1 +
 arch/powerpc/boot/dts/fsl/bsc9131rdb.dtsi                      | 1 +
 arch/powerpc/boot/dts/fsl/bsc9131si-post.dtsi                  | 1 +
 arch/powerpc/boot/dts/fsl/bsc9131si-pre.dtsi                   | 1 +
 arch/powerpc/boot/dts/fsl/bsc9132qds.dtsi                      | 1 +
 arch/powerpc/boot/dts/fsl/bsc9132si-post.dtsi                  | 1 +
 arch/powerpc/boot/dts/fsl/bsc9132si-pre.dtsi                   | 1 +
 arch/powerpc/boot/dts/fsl/c293pcie.dts                         | 1 +
 arch/powerpc/boot/dts/fsl/c293si-post.dtsi                     | 1 +
 arch/powerpc/boot/dts/fsl/c293si-pre.dtsi                      | 1 +
 arch/powerpc/boot/dts/fsl/e500mc_power_isa.dtsi                | 1 +
 arch/powerpc/boot/dts/fsl/e500v2_power_isa.dtsi                | 1 +
 arch/powerpc/boot/dts/fsl/e5500_power_isa.dtsi                 | 1 +
 arch/powerpc/boot/dts/fsl/e6500_power_isa.dtsi                 | 1 +
 arch/powerpc/boot/dts/fsl/elo3-dma-0.dtsi                      | 1 +
 arch/powerpc/boot/dts/fsl/elo3-dma-1.dtsi                      | 1 +
 arch/powerpc/boot/dts/fsl/elo3-dma-2.dtsi                      | 1 +
 arch/powerpc/boot/dts/fsl/interlaken-lac-portals.dtsi          | 1 +
 arch/powerpc/boot/dts/fsl/interlaken-lac.dtsi                  | 1 +
 arch/powerpc/boot/dts/fsl/mpc8536ds.dtsi                       | 1 +
 arch/powerpc/boot/dts/fsl/mpc8536si-post.dtsi                  | 1 +
 arch/powerpc/boot/dts/fsl/mpc8536si-pre.dtsi                   | 1 +
 arch/powerpc/boot/dts/fsl/mpc8544ds.dtsi                       | 1 +
 arch/powerpc/boot/dts/fsl/mpc8544si-post.dtsi                  | 1 +
 arch/powerpc/boot/dts/fsl/mpc8544si-pre.dtsi                   | 1 +
 arch/powerpc/boot/dts/fsl/mpc8548cds.dtsi                      | 1 +
 arch/powerpc/boot/dts/fsl/mpc8548si-post.dtsi                  | 1 +
 arch/powerpc/boot/dts/fsl/mpc8548si-pre.dtsi                   | 1 +
 arch/powerpc/boot/dts/fsl/mpc8568si-post.dtsi                  | 1 +
 arch/powerpc/boot/dts/fsl/mpc8568si-pre.dtsi                   | 1 +
 arch/powerpc/boot/dts/fsl/mpc8569si-post.dtsi                  | 1 +
 arch/powerpc/boot/dts/fsl/mpc8569si-pre.dtsi                   | 1 +
 arch/powerpc/boot/dts/fsl/mpc8572ds.dtsi                       | 1 +
 arch/powerpc/boot/dts/fsl/mpc8572si-post.dtsi                  | 1 +
 arch/powerpc/boot/dts/fsl/mpc8572si-pre.dtsi                   | 1 +
 arch/powerpc/boot/dts/fsl/oca4080.dts                          | 1 +
 arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtsi                     | 1 +
 arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dts                  | 1 +
 arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dts                  | 1 +
 arch/powerpc/boot/dts/fsl/p1010rdb.dtsi                        | 1 +
 arch/powerpc/boot/dts/fsl/p1010rdb_32b.dtsi                    | 1 +
 arch/powerpc/boot/dts/fsl/p1010rdb_36b.dtsi                    | 1 +
 arch/powerpc/boot/dts/fsl/p1010si-post.dtsi                    | 1 +
 arch/powerpc/boot/dts/fsl/p1010si-pre.dtsi                     | 1 +
 arch/powerpc/boot/dts/fsl/p1020mbg-pc.dtsi                     | 1 +
 arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dts                  | 1 +
 arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dts                  | 1 +
 arch/powerpc/boot/dts/fsl/p1020rdb-pc.dtsi                     | 1 +
 arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dts                  | 1 +
 arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dts                  | 1 +
 arch/powerpc/boot/dts/fsl/p1020rdb-pd.dts                      | 1 +
 arch/powerpc/boot/dts/fsl/p1020rdb.dtsi                        | 1 +
 arch/powerpc/boot/dts/fsl/p1020si-post.dtsi                    | 1 +
 arch/powerpc/boot/dts/fsl/p1020si-pre.dtsi                     | 1 +
 arch/powerpc/boot/dts/fsl/p1020utm-pc.dtsi                     | 1 +
 arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dts                  | 1 +
 arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dts                  | 1 +
 arch/powerpc/boot/dts/fsl/p1021rdb-pc.dtsi                     | 1 +
 arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dts                  | 1 +
 arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dts                  | 1 +
 arch/powerpc/boot/dts/fsl/p1021si-post.dtsi                    | 1 +
 arch/powerpc/boot/dts/fsl/p1021si-pre.dtsi                     | 1 +
 arch/powerpc/boot/dts/fsl/p1022ds.dtsi                         | 1 +
 arch/powerpc/boot/dts/fsl/p1022ds_32b.dts                      | 1 +
 arch/powerpc/boot/dts/fsl/p1022ds_36b.dts                      | 1 +
 arch/powerpc/boot/dts/fsl/p1022rdk.dts                         | 1 +
 arch/powerpc/boot/dts/fsl/p1022si-post.dtsi                    | 1 +
 arch/powerpc/boot/dts/fsl/p1022si-pre.dtsi                     | 1 +
 arch/powerpc/boot/dts/fsl/p1023rdb.dts                         | 1 +
 arch/powerpc/boot/dts/fsl/p1023si-post.dtsi                    | 1 +
 arch/powerpc/boot/dts/fsl/p1023si-pre.dtsi                     | 1 +
 arch/powerpc/boot/dts/fsl/p1024rdb.dtsi                        | 1 +
 arch/powerpc/boot/dts/fsl/p1024rdb_32b.dts                     | 1 +
 arch/powerpc/boot/dts/fsl/p1024rdb_36b.dts                     | 1 +
 arch/powerpc/boot/dts/fsl/p1025rdb.dtsi                        | 1 +
 arch/powerpc/boot/dts/fsl/p1025rdb_32b.dts                     | 1 +
 arch/powerpc/boot/dts/fsl/p1025rdb_36b.dts                     | 1 +
 arch/powerpc/boot/dts/fsl/p1025twr.dts                         | 1 +
 arch/powerpc/boot/dts/fsl/p1025twr.dtsi                        | 1 +
 arch/powerpc/boot/dts/fsl/p2020ds.dtsi                         | 1 +
 arch/powerpc/boot/dts/fsl/p2020rdb-pc.dtsi                     | 1 +
 arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dts                  | 1 +
 arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dts                  | 1 +
 arch/powerpc/boot/dts/fsl/p2020si-post.dtsi                    | 1 +
 arch/powerpc/boot/dts/fsl/p2020si-pre.dtsi                     | 1 +
 arch/powerpc/boot/dts/fsl/p2041rdb.dts                         | 1 +
 arch/powerpc/boot/dts/fsl/p2041si-post.dtsi                    | 1 +
 arch/powerpc/boot/dts/fsl/p2041si-pre.dtsi                     | 1 +
 arch/powerpc/boot/dts/fsl/p3041ds.dts                          | 1 +
 arch/powerpc/boot/dts/fsl/p3041si-post.dtsi                    | 1 +
 arch/powerpc/boot/dts/fsl/p3041si-pre.dtsi                     | 1 +
 arch/powerpc/boot/dts/fsl/p4080ds.dts                          | 1 +
 arch/powerpc/boot/dts/fsl/p4080si-post.dtsi                    | 1 +
 arch/powerpc/boot/dts/fsl/p4080si-pre.dtsi                     | 1 +
 arch/powerpc/boot/dts/fsl/p5020ds.dts                          | 1 +
 arch/powerpc/boot/dts/fsl/p5020si-post.dtsi                    | 1 +
 arch/powerpc/boot/dts/fsl/p5020si-pre.dtsi                     | 1 +
 arch/powerpc/boot/dts/fsl/p5040ds.dts                          | 1 +
 arch/powerpc/boot/dts/fsl/p5040si-post.dtsi                    | 1 +
 arch/powerpc/boot/dts/fsl/p5040si-pre.dtsi                     | 1 +
 arch/powerpc/boot/dts/fsl/pq3-dma-0.dtsi                       | 1 +
 arch/powerpc/boot/dts/fsl/pq3-dma-1.dtsi                       | 1 +
 arch/powerpc/boot/dts/fsl/pq3-duart-0.dtsi                     | 1 +
 arch/powerpc/boot/dts/fsl/pq3-esdhc-0.dtsi                     | 1 +
 arch/powerpc/boot/dts/fsl/pq3-espi-0.dtsi                      | 1 +
 arch/powerpc/boot/dts/fsl/pq3-etsec1-0.dtsi                    | 1 +
 arch/powerpc/boot/dts/fsl/pq3-etsec1-1.dtsi                    | 1 +
 arch/powerpc/boot/dts/fsl/pq3-etsec1-2.dtsi                    | 1 +
 arch/powerpc/boot/dts/fsl/pq3-etsec1-3.dtsi                    | 1 +
 arch/powerpc/boot/dts/fsl/pq3-etsec1-timer-0.dtsi              | 1 +
 arch/powerpc/boot/dts/fsl/pq3-etsec2-0.dtsi                    | 1 +
 arch/powerpc/boot/dts/fsl/pq3-etsec2-1.dtsi                    | 1 +
 arch/powerpc/boot/dts/fsl/pq3-etsec2-2.dtsi                    | 1 +
 arch/powerpc/boot/dts/fsl/pq3-etsec2-grp2-0.dtsi               | 1 +
 arch/powerpc/boot/dts/fsl/pq3-etsec2-grp2-1.dtsi               | 1 +
 arch/powerpc/boot/dts/fsl/pq3-etsec2-grp2-2.dtsi               | 1 +
 arch/powerpc/boot/dts/fsl/pq3-gpio-0.dtsi                      | 1 +
 arch/powerpc/boot/dts/fsl/pq3-i2c-0.dtsi                       | 1 +
 arch/powerpc/boot/dts/fsl/pq3-i2c-1.dtsi                       | 1 +
 arch/powerpc/boot/dts/fsl/pq3-mpic-message-B.dtsi              | 1 +
 arch/powerpc/boot/dts/fsl/pq3-mpic-timer-B.dtsi                | 1 +
 arch/powerpc/boot/dts/fsl/pq3-mpic.dtsi                        | 1 +
 arch/powerpc/boot/dts/fsl/pq3-rmu-0.dtsi                       | 1 +
 arch/powerpc/boot/dts/fsl/pq3-sata2-0.dtsi                     | 1 +
 arch/powerpc/boot/dts/fsl/pq3-sata2-1.dtsi                     | 1 +
 arch/powerpc/boot/dts/fsl/pq3-sec2.1-0.dtsi                    | 1 +
 arch/powerpc/boot/dts/fsl/pq3-sec3.0-0.dtsi                    | 1 +
 arch/powerpc/boot/dts/fsl/pq3-sec3.1-0.dtsi                    | 1 +
 arch/powerpc/boot/dts/fsl/pq3-sec3.3-0.dtsi                    | 1 +
 arch/powerpc/boot/dts/fsl/pq3-sec4.4-0.dtsi                    | 1 +
 arch/powerpc/boot/dts/fsl/pq3-usb2-dr-0.dtsi                   | 1 +
 arch/powerpc/boot/dts/fsl/pq3-usb2-dr-1.dtsi                   | 1 +
 arch/powerpc/boot/dts/fsl/qonverge-usb2-dr-0.dtsi              | 1 +
 arch/powerpc/boot/dts/fsl/qoriq-bman1-portals.dtsi             | 1 +
 arch/powerpc/boot/dts/fsl/qoriq-bman1.dtsi                     | 1 +
 arch/powerpc/boot/dts/fsl/qoriq-clockgen1.dtsi                 | 1 +
 arch/powerpc/boot/dts/fsl/qoriq-clockgen2.dtsi                 | 1 +
 arch/powerpc/boot/dts/fsl/qoriq-dma-0.dtsi                     | 1 +
 arch/powerpc/boot/dts/fsl/qoriq-dma-1.dtsi                     | 1 +
 arch/powerpc/boot/dts/fsl/qoriq-duart-0.dtsi                   | 1 +
 arch/powerpc/boot/dts/fsl/qoriq-duart-1.dtsi                   | 1 +
 arch/powerpc/boot/dts/fsl/qoriq-esdhc-0.dtsi                   | 1 +
 arch/powerpc/boot/dts/fsl/qoriq-espi-0.dtsi                    | 1 +
 arch/powerpc/boot/dts/fsl/qoriq-fman-0-10g-0.dtsi              | 1 +
 arch/powerpc/boot/dts/fsl/qoriq-fman-0-1g-0.dtsi               | 1 +
 arch/powerpc/boot/dts/fsl/qoriq-fman-0-1g-1.dtsi               | 1 +
 arch/powerpc/boot/dts/fsl/qoriq-fman-0-1g-2.dtsi               | 1 +
 arch/powerpc/boot/dts/fsl/qoriq-fman-0-1g-3.dtsi               | 1 +
 arch/powerpc/boot/dts/fsl/qoriq-fman-0-1g-4.dtsi               | 1 +
 arch/powerpc/boot/dts/fsl/qoriq-fman-0.dtsi                    | 1 +
 arch/powerpc/boot/dts/fsl/qoriq-fman-1-10g-0.dtsi              | 1 +
 arch/powerpc/boot/dts/fsl/qoriq-fman-1-1g-0.dtsi               | 1 +
 arch/powerpc/boot/dts/fsl/qoriq-fman-1-1g-1.dtsi               | 1 +
 arch/powerpc/boot/dts/fsl/qoriq-fman-1-1g-2.dtsi               | 1 +
 arch/powerpc/boot/dts/fsl/qoriq-fman-1-1g-3.dtsi               | 1 +
 arch/powerpc/boot/dts/fsl/qoriq-fman-1-1g-4.dtsi               | 1 +
 arch/powerpc/boot/dts/fsl/qoriq-fman-1.dtsi                    | 1 +
 arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-0-best-effort.dtsi | 1 +
 arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-0.dtsi             | 1 +
 arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-1-best-effort.dtsi | 1 +
 arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-1.dtsi             | 1 +
 arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-0.dtsi              | 1 +
 arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-1.dtsi              | 1 +
 arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-2.dtsi              | 1 +
 arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-3.dtsi              | 1 +
 arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-4.dtsi              | 1 +
 arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-5.dtsi              | 1 +
 arch/powerpc/boot/dts/fsl/qoriq-fman3-0.dtsi                   | 1 +
 arch/powerpc/boot/dts/fsl/qoriq-fman3-1-10g-0.dtsi             | 1 +
 arch/powerpc/boot/dts/fsl/qoriq-fman3-1-10g-1.dtsi             | 1 +
 arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-0.dtsi              | 1 +
 arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-1.dtsi              | 1 +
 arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-2.dtsi              | 1 +
 arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-3.dtsi              | 1 +
 arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-4.dtsi              | 1 +
 arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-5.dtsi              | 1 +
 arch/powerpc/boot/dts/fsl/qoriq-fman3-1.dtsi                   | 1 +
 arch/powerpc/boot/dts/fsl/qoriq-fman3l-0.dtsi                  | 1 +
 arch/powerpc/boot/dts/fsl/qoriq-gpio-0.dtsi                    | 1 +
 arch/powerpc/boot/dts/fsl/qoriq-gpio-1.dtsi                    | 1 +
 arch/powerpc/boot/dts/fsl/qoriq-gpio-2.dtsi                    | 1 +
 arch/powerpc/boot/dts/fsl/qoriq-gpio-3.dtsi                    | 1 +
 arch/powerpc/boot/dts/fsl/qoriq-i2c-0.dtsi                     | 1 +
 arch/powerpc/boot/dts/fsl/qoriq-i2c-1.dtsi                     | 1 +
 arch/powerpc/boot/dts/fsl/qoriq-mpic.dtsi                      | 1 +
 arch/powerpc/boot/dts/fsl/qoriq-mpic4.3.dtsi                   | 1 +
 arch/powerpc/boot/dts/fsl/qoriq-qman1-portals.dtsi             | 1 +
 arch/powerpc/boot/dts/fsl/qoriq-qman1.dtsi                     | 1 +
 arch/powerpc/boot/dts/fsl/qoriq-qman3.dtsi                     | 1 +
 arch/powerpc/boot/dts/fsl/qoriq-raid1.0-0.dtsi                 | 1 +
 arch/powerpc/boot/dts/fsl/qoriq-rmu-0.dtsi                     | 1 +
 arch/powerpc/boot/dts/fsl/qoriq-sata2-0.dtsi                   | 1 +
 arch/powerpc/boot/dts/fsl/qoriq-sata2-1.dtsi                   | 1 +
 arch/powerpc/boot/dts/fsl/qoriq-sec4.0-0.dtsi                  | 1 +
 arch/powerpc/boot/dts/fsl/qoriq-sec4.2-0.dtsi                  | 1 +
 arch/powerpc/boot/dts/fsl/qoriq-sec5.0-0.dtsi                  | 1 +
 arch/powerpc/boot/dts/fsl/qoriq-sec5.2-0.dtsi                  | 1 +
 arch/powerpc/boot/dts/fsl/qoriq-sec5.3-0.dtsi                  | 1 +
 arch/powerpc/boot/dts/fsl/qoriq-sec6.0-0.dtsi                  | 1 +
 arch/powerpc/boot/dts/fsl/qoriq-usb2-dr-0.dtsi                 | 1 +
 arch/powerpc/boot/dts/fsl/qoriq-usb2-mph-0.dtsi                | 1 +
 arch/powerpc/boot/dts/fsl/t1023rdb.dts                         | 1 +
 arch/powerpc/boot/dts/fsl/t1023si-post.dtsi                    | 1 +
 arch/powerpc/boot/dts/fsl/t1024qds.dts                         | 1 +
 arch/powerpc/boot/dts/fsl/t1024rdb.dts                         | 1 +
 arch/powerpc/boot/dts/fsl/t1024si-post.dtsi                    | 1 +
 arch/powerpc/boot/dts/fsl/t102xsi-pre.dtsi                     | 1 +
 arch/powerpc/boot/dts/fsl/t1040d4rdb.dts                       | 1 +
 arch/powerpc/boot/dts/fsl/t1040qds.dts                         | 1 +
 arch/powerpc/boot/dts/fsl/t1040rdb.dts                         | 1 +
 arch/powerpc/boot/dts/fsl/t1040si-post.dtsi                    | 1 +
 arch/powerpc/boot/dts/fsl/t1042d4rdb.dts                       | 1 +
 arch/powerpc/boot/dts/fsl/t1042qds.dts                         | 1 +
 arch/powerpc/boot/dts/fsl/t1042rdb.dts                         | 1 +
 arch/powerpc/boot/dts/fsl/t1042rdb_pi.dts                      | 1 +
 arch/powerpc/boot/dts/fsl/t1042si-post.dtsi                    | 1 +
 arch/powerpc/boot/dts/fsl/t104xd4rdb.dtsi                      | 1 +
 arch/powerpc/boot/dts/fsl/t104xqds.dtsi                        | 1 +
 arch/powerpc/boot/dts/fsl/t104xrdb.dtsi                        | 1 +
 arch/powerpc/boot/dts/fsl/t104xsi-pre.dtsi                     | 1 +
 arch/powerpc/boot/dts/fsl/t2080qds.dts                         | 1 +
 arch/powerpc/boot/dts/fsl/t2080rdb.dts                         | 1 +
 arch/powerpc/boot/dts/fsl/t2080si-post.dtsi                    | 1 +
 arch/powerpc/boot/dts/fsl/t2081qds.dts                         | 1 +
 arch/powerpc/boot/dts/fsl/t2081si-post.dtsi                    | 1 +
 arch/powerpc/boot/dts/fsl/t208xqds.dtsi                        | 1 +
 arch/powerpc/boot/dts/fsl/t208xrdb.dtsi                        | 1 +
 arch/powerpc/boot/dts/fsl/t208xsi-pre.dtsi                     | 1 +
 arch/powerpc/boot/dts/fsl/t4240qds.dts                         | 1 +
 arch/powerpc/boot/dts/fsl/t4240rdb.dts                         | 1 +
 arch/powerpc/boot/dts/fsl/t4240si-post.dtsi                    | 1 +
 arch/powerpc/boot/dts/fsl/t4240si-pre.dtsi                     | 1 +
 arch/powerpc/boot/dts/fsp2.dts                                 | 1 +
 arch/powerpc/boot/dts/glacier.dts                              | 1 +
 arch/powerpc/boot/dts/haleakala.dts                            | 1 +
 arch/powerpc/boot/dts/holly.dts                                | 1 +
 arch/powerpc/boot/dts/hotfoot.dts                              | 1 +
 arch/powerpc/boot/dts/icon.dts                                 | 1 +
 arch/powerpc/boot/dts/iss4xx-mpic.dts                          | 1 +
 arch/powerpc/boot/dts/iss4xx.dts                               | 1 +
 arch/powerpc/boot/dts/katmai.dts                               | 1 +
 arch/powerpc/boot/dts/kilauea.dts                              | 1 +
 arch/powerpc/boot/dts/ksi8560.dts                              | 1 +
 arch/powerpc/boot/dts/kuroboxHD.dts                            | 1 +
 arch/powerpc/boot/dts/kuroboxHG.dts                            | 1 +
 arch/powerpc/boot/dts/makalu.dts                               | 1 +
 arch/powerpc/boot/dts/microwatt.dts                            | 1 +
 arch/powerpc/boot/dts/mvme5100.dts                             | 1 +
 arch/powerpc/boot/dts/obs600.dts                               | 1 +
 arch/powerpc/boot/dts/rainier.dts                              | 1 +
 arch/powerpc/boot/dts/redwood.dts                              | 1 +
 arch/powerpc/boot/dts/sam440ep.dts                             | 1 +
 arch/powerpc/boot/dts/sequoia.dts                              | 1 +
 arch/powerpc/boot/dts/storcenter.dts                           | 1 +
 arch/powerpc/boot/dts/taishan.dts                              | 1 +
 arch/powerpc/boot/dts/warp.dts                                 | 1 +
 arch/powerpc/boot/dts/yosemite.dts                             | 1 +
 271 files changed, 271 insertions(+)

diff --git a/arch/powerpc/boot/dts/acadia.dts b/arch/powerpc/boot/dts/acadi=
a.dts
index deb52e41ab84..be2dde84685b 100644
--- a/arch/powerpc/boot/dts/acadia.dts
+++ b/arch/powerpc/boot/dts/acadia.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Device Tree Source for AMCC Acadia (405EZ)
  *
diff --git a/arch/powerpc/boot/dts/akebono.dts b/arch/powerpc/boot/dts/akeb=
ono.dts
index df18f8dc4642..c954fd60a409 100644
--- a/arch/powerpc/boot/dts/akebono.dts
+++ b/arch/powerpc/boot/dts/akebono.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Device Tree Source for IBM Embedded PPC 476 Platform
  *
diff --git a/arch/powerpc/boot/dts/bamboo.dts b/arch/powerpc/boot/dts/bambo=
o.dts
index b5861fa3836c..4ef188c4d78a 100644
--- a/arch/powerpc/boot/dts/bamboo.dts
+++ b/arch/powerpc/boot/dts/bamboo.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Device Tree Source for AMCC Bamboo
  *
diff --git a/arch/powerpc/boot/dts/canyonlands.dts b/arch/powerpc/boot/dts/=
canyonlands.dts
index c5fbb08e0a6e..8ab21497c88f 100644
--- a/arch/powerpc/boot/dts/canyonlands.dts
+++ b/arch/powerpc/boot/dts/canyonlands.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Device Tree Source for AMCC Canyonlands (460EX)
  *
diff --git a/arch/powerpc/boot/dts/currituck.dts b/arch/powerpc/boot/dts/cu=
rrituck.dts
index aea8af810106..c92885f43168 100644
--- a/arch/powerpc/boot/dts/currituck.dts
+++ b/arch/powerpc/boot/dts/currituck.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Device Tree Source for IBM Embedded PPC 476 Platform
  *
diff --git a/arch/powerpc/boot/dts/ebony.dts b/arch/powerpc/boot/dts/ebony.=
dts
index 5d11e6ea7405..6b7426662dee 100644
--- a/arch/powerpc/boot/dts/ebony.dts
+++ b/arch/powerpc/boot/dts/ebony.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Device Tree Source for IBM Ebony
  *
diff --git a/arch/powerpc/boot/dts/eiger.dts b/arch/powerpc/boot/dts/eiger.=
dts
index 7a1231d9d6f0..240ca1580d27 100644
--- a/arch/powerpc/boot/dts/eiger.dts
+++ b/arch/powerpc/boot/dts/eiger.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Device Tree Source for AMCC (AppliedMicro) Eiger(460SX)
  *
diff --git a/arch/powerpc/boot/dts/fsl/b4420qds.dts b/arch/powerpc/boot/dts=
/fsl/b4420qds.dts
index cd9203ceedc0..f931f0d63b48 100644
--- a/arch/powerpc/boot/dts/fsl/b4420qds.dts
+++ b/arch/powerpc/boot/dts/fsl/b4420qds.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * B4420DS Device Tree Source
  *
diff --git a/arch/powerpc/boot/dts/fsl/b4420si-post.dtsi b/arch/powerpc/boo=
t/dts/fsl/b4420si-post.dtsi
index f996cced45e0..40081fb615c4 100644
--- a/arch/powerpc/boot/dts/fsl/b4420si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/b4420si-post.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * B4420 Silicon/SoC Device Tree Source (post include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/b4420si-pre.dtsi b/arch/powerpc/boot=
/dts/fsl/b4420si-pre.dtsi
index bb7b9b9f3f5f..63f1d585c1e0 100644
--- a/arch/powerpc/boot/dts/fsl/b4420si-pre.dtsi
+++ b/arch/powerpc/boot/dts/fsl/b4420si-pre.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * B4420 Silicon/SoC Device Tree Source (pre include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/b4860qds.dts b/arch/powerpc/boot/dts=
/fsl/b4860qds.dts
index a8bc419959ca..b3bbf16863d6 100644
--- a/arch/powerpc/boot/dts/fsl/b4860qds.dts
+++ b/arch/powerpc/boot/dts/fsl/b4860qds.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * B4860DS Device Tree Source
  *
diff --git a/arch/powerpc/boot/dts/fsl/b4860si-post.dtsi b/arch/powerpc/boo=
t/dts/fsl/b4860si-post.dtsi
index 868719821106..f052ca461239 100644
--- a/arch/powerpc/boot/dts/fsl/b4860si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/b4860si-post.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * B4860 Silicon/SoC Device Tree Source (post include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/b4860si-pre.dtsi b/arch/powerpc/boot=
/dts/fsl/b4860si-pre.dtsi
index 388ba1b15f8c..a1ec909dafae 100644
--- a/arch/powerpc/boot/dts/fsl/b4860si-pre.dtsi
+++ b/arch/powerpc/boot/dts/fsl/b4860si-pre.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * B4860 Silicon/SoC Device Tree Source (pre include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/b4qds.dtsi b/arch/powerpc/boot/dts/f=
sl/b4qds.dtsi
index 05be919f3545..83402f969d69 100644
--- a/arch/powerpc/boot/dts/fsl/b4qds.dtsi
+++ b/arch/powerpc/boot/dts/fsl/b4qds.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * B4420DS Device Tree Source
  *
diff --git a/arch/powerpc/boot/dts/fsl/b4si-post.dtsi b/arch/powerpc/boot/d=
ts/fsl/b4si-post.dtsi
index 4f044b41a776..a811885009c2 100644
--- a/arch/powerpc/boot/dts/fsl/b4si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/b4si-post.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * B4420 Silicon/SoC Device Tree Source (post include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/bsc9131rdb.dtsi b/arch/powerpc/boot/=
dts/fsl/bsc9131rdb.dtsi
index 53f8b956340f..a5f4012f2e98 100644
--- a/arch/powerpc/boot/dts/fsl/bsc9131rdb.dtsi
+++ b/arch/powerpc/boot/dts/fsl/bsc9131rdb.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * BSC9131 RDB Device Tree Source stub (no addresses or top-level ranges)
  *
diff --git a/arch/powerpc/boot/dts/fsl/bsc9131si-post.dtsi b/arch/powerpc/b=
oot/dts/fsl/bsc9131si-post.dtsi
index 2a677fd323eb..90eafd2d6a52 100644
--- a/arch/powerpc/boot/dts/fsl/bsc9131si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/bsc9131si-post.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * BSC9131 Silicon/SoC Device Tree Source (post include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/bsc9131si-pre.dtsi b/arch/powerpc/bo=
ot/dts/fsl/bsc9131si-pre.dtsi
index f6ec4a67560c..71ebf485cf67 100644
--- a/arch/powerpc/boot/dts/fsl/bsc9131si-pre.dtsi
+++ b/arch/powerpc/boot/dts/fsl/bsc9131si-pre.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * BSC9131 Silicon/SoC Device Tree Source (pre include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/bsc9132qds.dtsi b/arch/powerpc/boot/=
dts/fsl/bsc9132qds.dtsi
index fead484a8180..044deb3d5f4c 100644
--- a/arch/powerpc/boot/dts/fsl/bsc9132qds.dtsi
+++ b/arch/powerpc/boot/dts/fsl/bsc9132qds.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * BSC9132 QDS Device Tree Source stub (no addresses or top-level ranges)
  *
diff --git a/arch/powerpc/boot/dts/fsl/bsc9132si-post.dtsi b/arch/powerpc/b=
oot/dts/fsl/bsc9132si-post.dtsi
index b8e0edd1ac69..aa67bdd47877 100644
--- a/arch/powerpc/boot/dts/fsl/bsc9132si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/bsc9132si-post.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * BSC9132 Silicon/SoC Device Tree Source (post include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/bsc9132si-pre.dtsi b/arch/powerpc/bo=
ot/dts/fsl/bsc9132si-pre.dtsi
index 90f7949fe312..586b618b5f71 100644
--- a/arch/powerpc/boot/dts/fsl/bsc9132si-pre.dtsi
+++ b/arch/powerpc/boot/dts/fsl/bsc9132si-pre.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * BSC9132 Silicon/SoC Device Tree Source (pre include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/c293pcie.dts b/arch/powerpc/boot/dts=
/fsl/c293pcie.dts
index 5e905e0857cf..25dc35d6301c 100644
--- a/arch/powerpc/boot/dts/fsl/c293pcie.dts
+++ b/arch/powerpc/boot/dts/fsl/c293pcie.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * C293 PCIE Device Tree Source
  *
diff --git a/arch/powerpc/boot/dts/fsl/c293si-post.dtsi b/arch/powerpc/boot=
/dts/fsl/c293si-post.dtsi
index bec0fc36849d..aea404096b2b 100644
--- a/arch/powerpc/boot/dts/fsl/c293si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/c293si-post.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * C293 Silicon/SoC Device Tree Source (post include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/c293si-pre.dtsi b/arch/powerpc/boot/=
dts/fsl/c293si-pre.dtsi
index 065049d76245..f91297a98d0d 100644
--- a/arch/powerpc/boot/dts/fsl/c293si-pre.dtsi
+++ b/arch/powerpc/boot/dts/fsl/c293si-pre.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * C293 Silicon/SoC Device Tree Source (pre include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/e500mc_power_isa.dtsi b/arch/powerpc=
/boot/dts/fsl/e500mc_power_isa.dtsi
index ea145c91cfbd..d8cd74e737db 100644
--- a/arch/powerpc/boot/dts/fsl/e500mc_power_isa.dtsi
+++ b/arch/powerpc/boot/dts/fsl/e500mc_power_isa.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * e500mc Power ISA Device Tree Source (include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/e500v2_power_isa.dtsi b/arch/powerpc=
/boot/dts/fsl/e500v2_power_isa.dtsi
index f4928144d2c8..94c86f7f384d 100644
--- a/arch/powerpc/boot/dts/fsl/e500v2_power_isa.dtsi
+++ b/arch/powerpc/boot/dts/fsl/e500v2_power_isa.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * e500v2 Power ISA Device Tree Source (include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/e5500_power_isa.dtsi b/arch/powerpc/=
boot/dts/fsl/e5500_power_isa.dtsi
index c254c981ae87..c19692115609 100644
--- a/arch/powerpc/boot/dts/fsl/e5500_power_isa.dtsi
+++ b/arch/powerpc/boot/dts/fsl/e5500_power_isa.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * e5500 Power ISA Device Tree Source (include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/e6500_power_isa.dtsi b/arch/powerpc/=
boot/dts/fsl/e6500_power_isa.dtsi
index a912dbeff359..4644384fbeb4 100644
--- a/arch/powerpc/boot/dts/fsl/e6500_power_isa.dtsi
+++ b/arch/powerpc/boot/dts/fsl/e6500_power_isa.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * e6500 Power ISA Device Tree Source (include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/elo3-dma-0.dtsi b/arch/powerpc/boot/=
dts/fsl/elo3-dma-0.dtsi
index 3c210e0d5201..fe30f0afa696 100644
--- a/arch/powerpc/boot/dts/fsl/elo3-dma-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/elo3-dma-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * QorIQ Elo3 DMA device tree stub [ controller @ offset 0x100000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/elo3-dma-1.dtsi b/arch/powerpc/boot/=
dts/fsl/elo3-dma-1.dtsi
index cccf3bb38224..8536d78af4d5 100644
--- a/arch/powerpc/boot/dts/fsl/elo3-dma-1.dtsi
+++ b/arch/powerpc/boot/dts/fsl/elo3-dma-1.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * QorIQ Elo3 DMA device tree stub [ controller @ offset 0x101000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/elo3-dma-2.dtsi b/arch/powerpc/boot/=
dts/fsl/elo3-dma-2.dtsi
index d3cc8d0f7c25..1ca0dc8e8d94 100644
--- a/arch/powerpc/boot/dts/fsl/elo3-dma-2.dtsi
+++ b/arch/powerpc/boot/dts/fsl/elo3-dma-2.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * QorIQ Elo3 DMA device tree stub [ controller @ offset 0x102300 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/interlaken-lac-portals.dtsi b/arch/p=
owerpc/boot/dts/fsl/interlaken-lac-portals.dtsi
index 9cffccf4e07e..fc861972282e 100644
--- a/arch/powerpc/boot/dts/fsl/interlaken-lac-portals.dtsi
+++ b/arch/powerpc/boot/dts/fsl/interlaken-lac-portals.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /* T4240 Interlaken LAC Portal device tree stub with 24 portals.
  *
  * Copyright 2012 Freescale Semiconductor Inc.
diff --git a/arch/powerpc/boot/dts/fsl/interlaken-lac.dtsi b/arch/powerpc/b=
oot/dts/fsl/interlaken-lac.dtsi
index e8208720ac0e..23427094729c 100644
--- a/arch/powerpc/boot/dts/fsl/interlaken-lac.dtsi
+++ b/arch/powerpc/boot/dts/fsl/interlaken-lac.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * T4 Interlaken Look-aside Controller (LAC) device tree stub
  *
diff --git a/arch/powerpc/boot/dts/fsl/mpc8536ds.dtsi b/arch/powerpc/boot/d=
ts/fsl/mpc8536ds.dtsi
index a925fe49a73e..273b3ddcf7f7 100644
--- a/arch/powerpc/boot/dts/fsl/mpc8536ds.dtsi
+++ b/arch/powerpc/boot/dts/fsl/mpc8536ds.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * MPC8536DS Device Tree Source stub (no addresses or top-level ranges)
  *
diff --git a/arch/powerpc/boot/dts/fsl/mpc8536si-post.dtsi b/arch/powerpc/b=
oot/dts/fsl/mpc8536si-post.dtsi
index 41935709ebe8..7ad763112a79 100644
--- a/arch/powerpc/boot/dts/fsl/mpc8536si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/mpc8536si-post.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * MPC8536 Silicon/SoC Device Tree Source (post include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/mpc8536si-pre.dtsi b/arch/powerpc/bo=
ot/dts/fsl/mpc8536si-pre.dtsi
index 152906f98a0f..00bdc12ae9ef 100644
--- a/arch/powerpc/boot/dts/fsl/mpc8536si-pre.dtsi
+++ b/arch/powerpc/boot/dts/fsl/mpc8536si-pre.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * MPC8536 Silicon/SoC Device Tree Source (pre include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/mpc8544ds.dtsi b/arch/powerpc/boot/d=
ts/fsl/mpc8544ds.dtsi
index 47d986b041f6..e0885acef840 100644
--- a/arch/powerpc/boot/dts/fsl/mpc8544ds.dtsi
+++ b/arch/powerpc/boot/dts/fsl/mpc8544ds.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * MPC8544DS Device Tree Source stub (no addresses or top-level ranges)
  *
diff --git a/arch/powerpc/boot/dts/fsl/mpc8544si-post.dtsi b/arch/powerpc/b=
oot/dts/fsl/mpc8544si-post.dtsi
index b68eb119faef..6fab674dce45 100644
--- a/arch/powerpc/boot/dts/fsl/mpc8544si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/mpc8544si-post.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * MPC8544 Silicon/SoC Device Tree Source (post include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/mpc8544si-pre.dtsi b/arch/powerpc/bo=
ot/dts/fsl/mpc8544si-pre.dtsi
index 5a69bafb652a..e0d2c22e5500 100644
--- a/arch/powerpc/boot/dts/fsl/mpc8544si-pre.dtsi
+++ b/arch/powerpc/boot/dts/fsl/mpc8544si-pre.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * MPC8544 Silicon/SoC Device Tree Source (pre include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/mpc8548cds.dtsi b/arch/powerpc/boot/=
dts/fsl/mpc8548cds.dtsi
index 3bc7d4711220..c51118050d72 100644
--- a/arch/powerpc/boot/dts/fsl/mpc8548cds.dtsi
+++ b/arch/powerpc/boot/dts/fsl/mpc8548cds.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * MPC8548CDS Device Tree Source stub (no addresses or top-level ranges)
  *
diff --git a/arch/powerpc/boot/dts/fsl/mpc8548si-post.dtsi b/arch/powerpc/b=
oot/dts/fsl/mpc8548si-post.dtsi
index 579d76cb8e32..6677b92fde95 100644
--- a/arch/powerpc/boot/dts/fsl/mpc8548si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/mpc8548si-post.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * MPC8548 Silicon/SoC Device Tree Source (post include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/mpc8548si-pre.dtsi b/arch/powerpc/bo=
ot/dts/fsl/mpc8548si-pre.dtsi
index fc1ce977422b..4361d21b913c 100644
--- a/arch/powerpc/boot/dts/fsl/mpc8548si-pre.dtsi
+++ b/arch/powerpc/boot/dts/fsl/mpc8548si-pre.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * MPC8548 Silicon/SoC Device Tree Source (pre include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/mpc8568si-post.dtsi b/arch/powerpc/b=
oot/dts/fsl/mpc8568si-post.dtsi
index 64e7075a9cd4..ad6cd22f5374 100644
--- a/arch/powerpc/boot/dts/fsl/mpc8568si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/mpc8568si-post.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * MPC8568 Silicon/SoC Device Tree Source (post include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/mpc8568si-pre.dtsi b/arch/powerpc/bo=
ot/dts/fsl/mpc8568si-pre.dtsi
index 122ca3bd0b03..213337395b03 100644
--- a/arch/powerpc/boot/dts/fsl/mpc8568si-pre.dtsi
+++ b/arch/powerpc/boot/dts/fsl/mpc8568si-pre.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * MPC8568 Silicon/SoC Device Tree Source (pre include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/mpc8569si-post.dtsi b/arch/powerpc/b=
oot/dts/fsl/mpc8569si-post.dtsi
index 3e6346a4a183..968a2566f81c 100644
--- a/arch/powerpc/boot/dts/fsl/mpc8569si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/mpc8569si-post.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * MPC8569 Silicon/SoC Device Tree Source (post include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/mpc8569si-pre.dtsi b/arch/powerpc/bo=
ot/dts/fsl/mpc8569si-pre.dtsi
index 2cd15a2a0422..cf280fc346c3 100644
--- a/arch/powerpc/boot/dts/fsl/mpc8569si-pre.dtsi
+++ b/arch/powerpc/boot/dts/fsl/mpc8569si-pre.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * MPC8569 Silicon/SoC Device Tree Source (pre include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/mpc8572ds.dtsi b/arch/powerpc/boot/d=
ts/fsl/mpc8572ds.dtsi
index 357490bb84da..977b65dcb6c9 100644
--- a/arch/powerpc/boot/dts/fsl/mpc8572ds.dtsi
+++ b/arch/powerpc/boot/dts/fsl/mpc8572ds.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * MPC8572DS Device Tree Source stub (no addresses or top-level ranges)
  *
diff --git a/arch/powerpc/boot/dts/fsl/mpc8572si-post.dtsi b/arch/powerpc/b=
oot/dts/fsl/mpc8572si-post.dtsi
index 49294cf36b4e..6d71e273e8a8 100644
--- a/arch/powerpc/boot/dts/fsl/mpc8572si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/mpc8572si-post.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * MPC8572 Silicon/SoC Device Tree Source (post include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/mpc8572si-pre.dtsi b/arch/powerpc/bo=
ot/dts/fsl/mpc8572si-pre.dtsi
index 28c2a862be96..9f2b68350134 100644
--- a/arch/powerpc/boot/dts/fsl/mpc8572si-pre.dtsi
+++ b/arch/powerpc/boot/dts/fsl/mpc8572si-pre.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * MPC8572 Silicon/SoC Device Tree Source (pre include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/oca4080.dts b/arch/powerpc/boot/dts/=
fsl/oca4080.dts
index 17bc6f391248..9e8e3b64b716 100644
--- a/arch/powerpc/boot/dts/fsl/oca4080.dts
+++ b/arch/powerpc/boot/dts/fsl/oca4080.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * OCA4080 Device Tree Source
  *
diff --git a/arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtsi b/arch/powerpc/boot=
/dts/fsl/p1010rdb-pa.dtsi
index 434fb2d58575..3efc84ccbf70 100644
--- a/arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * P1010 RDB Device Tree Source stub (no addresses or top-level ranges)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dts b/arch/powerpc/b=
oot/dts/fsl/p1010rdb-pa_36b.dts
index 03bd76ca8406..dd0ff4438f21 100644
--- a/arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dts
+++ b/arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * P1010 RDB Device Tree Source (36-bit address map)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dts b/arch/powerpc/b=
oot/dts/fsl/p1010rdb-pb_36b.dts
index 4cf255fedc96..ba28f776697e 100644
--- a/arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dts
+++ b/arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * P1010 RDB Device Tree Source (36-bit address map)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p1010rdb.dtsi b/arch/powerpc/boot/dt=
s/fsl/p1010rdb.dtsi
index 2ca9cee2ddeb..c8f1e0673553 100644
--- a/arch/powerpc/boot/dts/fsl/p1010rdb.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p1010rdb.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * P1010 RDB Device Tree Source stub (no addresses or top-level ranges)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p1010rdb_32b.dtsi b/arch/powerpc/boo=
t/dts/fsl/p1010rdb_32b.dtsi
index fdc19aab2f70..30f9bd4fc9d9 100644
--- a/arch/powerpc/boot/dts/fsl/p1010rdb_32b.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p1010rdb_32b.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * P1010 RDB Device Tree Source stub (no addresses or top-level ranges)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p1010rdb_36b.dtsi b/arch/powerpc/boo=
t/dts/fsl/p1010rdb_36b.dtsi
index de2fceed4f79..734c9f90668c 100644
--- a/arch/powerpc/boot/dts/fsl/p1010rdb_36b.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p1010rdb_36b.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * P1010 RDB Device Tree Source stub (no addresses or top-level ranges)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p1010si-post.dtsi b/arch/powerpc/boo=
t/dts/fsl/p1010si-post.dtsi
index ccda0a91abf0..58a51cb9628b 100644
--- a/arch/powerpc/boot/dts/fsl/p1010si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p1010si-post.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * P1010/P1014 Silicon/SoC Device Tree Source (post include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p1010si-pre.dtsi b/arch/powerpc/boot=
/dts/fsl/p1010si-pre.dtsi
index 6e76f9b282a1..4ba7af5cd93e 100644
--- a/arch/powerpc/boot/dts/fsl/p1010si-pre.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p1010si-pre.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * P1010/P1014 Silicon/SoC Device Tree Source (pre include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p1020mbg-pc.dtsi b/arch/powerpc/boot=
/dts/fsl/p1020mbg-pc.dtsi
index a24699cfea9c..4afc1b5df162 100644
--- a/arch/powerpc/boot/dts/fsl/p1020mbg-pc.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p1020mbg-pc.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * P1020 MBG-PC Device Tree Source stub (no addresses or top-level ranges)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dts b/arch/powerpc/b=
oot/dts/fsl/p1020mbg-pc_32b.dts
index b29d1fcb5e6b..875f3a7430b5 100644
--- a/arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dts
+++ b/arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * P1020 MBG-PC Device Tree Source (32-bit address map)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dts b/arch/powerpc/b=
oot/dts/fsl/p1020mbg-pc_36b.dts
index 678d0eec24e2..9ba04f94697e 100644
--- a/arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dts
+++ b/arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * P1020 MBG-PC Device Tree Source (36-bit address map)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p1020rdb-pc.dtsi b/arch/powerpc/boot=
/dts/fsl/p1020rdb-pc.dtsi
index a13876c05c1e..e57a53e24a34 100644
--- a/arch/powerpc/boot/dts/fsl/p1020rdb-pc.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p1020rdb-pc.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * P1020 RDB-PC Device Tree Source stub (no addresses or top-level ranges)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dts b/arch/powerpc/b=
oot/dts/fsl/p1020rdb-pc_32b.dts
index 8175bf6f3e9c..5053b998c6f3 100644
--- a/arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dts
+++ b/arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * P1020 RDB-PC Device Tree Source (32-bit address map)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dts b/arch/powerpc/b=
oot/dts/fsl/p1020rdb-pc_36b.dts
index 01c305795163..fd8f31a27c75 100644
--- a/arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dts
+++ b/arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * P1020 RDB-PC Device Tree Source (36-bit address map)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p1020rdb-pd.dts b/arch/powerpc/boot/=
dts/fsl/p1020rdb-pd.dts
index f2dc6c09be52..3d716d5e5810 100644
--- a/arch/powerpc/boot/dts/fsl/p1020rdb-pd.dts
+++ b/arch/powerpc/boot/dts/fsl/p1020rdb-pd.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * P1020 RDB-PD Device Tree Source (32-bit address map)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p1020rdb.dtsi b/arch/powerpc/boot/dt=
s/fsl/p1020rdb.dtsi
index 703142ee6627..d29de89e43f5 100644
--- a/arch/powerpc/boot/dts/fsl/p1020rdb.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p1020rdb.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * P1020 RDB Device Tree Source stub (no addresses or top-level ranges)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p1020si-post.dtsi b/arch/powerpc/boo=
t/dts/fsl/p1020si-post.dtsi
index 642dc3a83d0e..6be919e8654e 100644
--- a/arch/powerpc/boot/dts/fsl/p1020si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p1020si-post.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * P1020/P1011 Silicon/SoC Device Tree Source (post include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p1020si-pre.dtsi b/arch/powerpc/boot=
/dts/fsl/p1020si-pre.dtsi
index fed9c4c8d962..8b5583d67ce5 100644
--- a/arch/powerpc/boot/dts/fsl/p1020si-pre.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p1020si-pre.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * P1020/P1011 Silicon/SoC Device Tree Source (pre include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p1020utm-pc.dtsi b/arch/powerpc/boot=
/dts/fsl/p1020utm-pc.dtsi
index 7ea85eabcc5c..5b2a5148018c 100644
--- a/arch/powerpc/boot/dts/fsl/p1020utm-pc.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p1020utm-pc.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * P1020 UTM-PC Device Tree Source stub (no addresses or top-level ranges)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dts b/arch/powerpc/b=
oot/dts/fsl/p1020utm-pc_32b.dts
index bc03ef611f98..37ee1bf41f76 100644
--- a/arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dts
+++ b/arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * P1020 UTM-PC Device Tree Source (32-bit address map)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dts b/arch/powerpc/b=
oot/dts/fsl/p1020utm-pc_36b.dts
index 32766f6a475e..25219313e226 100644
--- a/arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dts
+++ b/arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * P1020 UTM-PC Device Tree Source (36-bit address map)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p1021rdb-pc.dtsi b/arch/powerpc/boot=
/dts/fsl/p1021rdb-pc.dtsi
index 18f9b31602d0..01296071b4b0 100644
--- a/arch/powerpc/boot/dts/fsl/p1021rdb-pc.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p1021rdb-pc.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * P1021 RDB Device Tree Source stub (no addresses or top-level ranges)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dts b/arch/powerpc/b=
oot/dts/fsl/p1021rdb-pc_32b.dts
index d2b4710357ac..c3e9e3472cc4 100644
--- a/arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dts
+++ b/arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * P1021 RDB Device Tree Source
  *
diff --git a/arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dts b/arch/powerpc/b=
oot/dts/fsl/p1021rdb-pc_36b.dts
index e298c29e5606..f1dfafc8e57d 100644
--- a/arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dts
+++ b/arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * P1021 RDB Device Tree Source (36-bit address map)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p1021si-post.dtsi b/arch/powerpc/boo=
t/dts/fsl/p1021si-post.dtsi
index 407cb5fd0f5b..679fbf81a101 100644
--- a/arch/powerpc/boot/dts/fsl/p1021si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p1021si-post.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * P1021/P1012 Silicon/SoC Device Tree Source (post include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p1021si-pre.dtsi b/arch/powerpc/boot=
/dts/fsl/p1021si-pre.dtsi
index 36161b500176..9faaa86f9285 100644
--- a/arch/powerpc/boot/dts/fsl/p1021si-pre.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p1021si-pre.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * P1021/P1012 Silicon/SoC Device Tree Source (pre include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p1022ds.dtsi b/arch/powerpc/boot/dts=
/fsl/p1022ds.dtsi
index ddefbf64f7f8..b78fab702a1e 100644
--- a/arch/powerpc/boot/dts/fsl/p1022ds.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p1022ds.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * P1022 DS Device Tree Source stub (no addresses or top-level ranges)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p1022ds_32b.dts b/arch/powerpc/boot/=
dts/fsl/p1022ds_32b.dts
index 5a7eaceb9e8e..0656b0d8555e 100644
--- a/arch/powerpc/boot/dts/fsl/p1022ds_32b.dts
+++ b/arch/powerpc/boot/dts/fsl/p1022ds_32b.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * P1022 DS 32-bit Physical Address Map Device Tree Source
  *
diff --git a/arch/powerpc/boot/dts/fsl/p1022ds_36b.dts b/arch/powerpc/boot/=
dts/fsl/p1022ds_36b.dts
index 88063cd9e20a..2cdc56b2c099 100644
--- a/arch/powerpc/boot/dts/fsl/p1022ds_36b.dts
+++ b/arch/powerpc/boot/dts/fsl/p1022ds_36b.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * P1022 DS 36-bit Physical Address Map Device Tree Source
  *
diff --git a/arch/powerpc/boot/dts/fsl/p1022rdk.dts b/arch/powerpc/boot/dts=
/fsl/p1022rdk.dts
index 29e8af1e3711..c04f50f08bd1 100644
--- a/arch/powerpc/boot/dts/fsl/p1022rdk.dts
+++ b/arch/powerpc/boot/dts/fsl/p1022rdk.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * P1022 RDK 32-bit Physical Address Map Device Tree Source
  *
diff --git a/arch/powerpc/boot/dts/fsl/p1022si-post.dtsi b/arch/powerpc/boo=
t/dts/fsl/p1022si-post.dtsi
index 5f51b7bfc064..4e908ffb29ee 100644
--- a/arch/powerpc/boot/dts/fsl/p1022si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p1022si-post.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * P1022/P1013 Silicon/SoC Device Tree Source (post include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p1022si-pre.dtsi b/arch/powerpc/boot=
/dts/fsl/p1022si-pre.dtsi
index de76ae8992c6..965db8de84fe 100644
--- a/arch/powerpc/boot/dts/fsl/p1022si-pre.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p1022si-pre.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * P1022/P1013 Silicon/SoC Device Tree Source (pre include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p1023rdb.dts b/arch/powerpc/boot/dts=
/fsl/p1023rdb.dts
index ead928364beb..60293c4cd828 100644
--- a/arch/powerpc/boot/dts/fsl/p1023rdb.dts
+++ b/arch/powerpc/boot/dts/fsl/p1023rdb.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * P1023 RDB Device Tree Source
  *
diff --git a/arch/powerpc/boot/dts/fsl/p1023si-post.dtsi b/arch/powerpc/boo=
t/dts/fsl/p1023si-post.dtsi
index da6d3fc6ba41..aa2cec450159 100644
--- a/arch/powerpc/boot/dts/fsl/p1023si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p1023si-post.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * P1023/P1017 Silicon/SoC Device Tree Source (post include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p1023si-pre.dtsi b/arch/powerpc/boot=
/dts/fsl/p1023si-pre.dtsi
index 132a1521921a..3348221cda85 100644
--- a/arch/powerpc/boot/dts/fsl/p1023si-pre.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p1023si-pre.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * P1023/P1017 Silicon/SoC Device Tree Source (pre include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p1024rdb.dtsi b/arch/powerpc/boot/dt=
s/fsl/p1024rdb.dtsi
index b4d05867f707..98c972a465c4 100644
--- a/arch/powerpc/boot/dts/fsl/p1024rdb.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p1024rdb.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * P1024 RDB Device Tree Source stub (no addresses or top-level ranges)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p1024rdb_32b.dts b/arch/powerpc/boot=
/dts/fsl/p1024rdb_32b.dts
index 8b09b9d56ad1..13a8a3e7dde7 100644
--- a/arch/powerpc/boot/dts/fsl/p1024rdb_32b.dts
+++ b/arch/powerpc/boot/dts/fsl/p1024rdb_32b.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * P1024 RDB 32Bit Physical Address Map Device Tree Source
  *
diff --git a/arch/powerpc/boot/dts/fsl/p1024rdb_36b.dts b/arch/powerpc/boot=
/dts/fsl/p1024rdb_36b.dts
index e7093aef28f1..78ceb9b7a110 100644
--- a/arch/powerpc/boot/dts/fsl/p1024rdb_36b.dts
+++ b/arch/powerpc/boot/dts/fsl/p1024rdb_36b.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * P1024 RDB 36Bit Physical Address Map Device Tree Source
  *
diff --git a/arch/powerpc/boot/dts/fsl/p1025rdb.dtsi b/arch/powerpc/boot/dt=
s/fsl/p1025rdb.dtsi
index 0a5434a631c3..cc16ea431c5c 100644
--- a/arch/powerpc/boot/dts/fsl/p1025rdb.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p1025rdb.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * P1025 RDB Device Tree Source stub (no addresses or top-level ranges)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p1025rdb_32b.dts b/arch/powerpc/boot=
/dts/fsl/p1025rdb_32b.dts
index ea33b57f8774..fb160a1b0731 100644
--- a/arch/powerpc/boot/dts/fsl/p1025rdb_32b.dts
+++ b/arch/powerpc/boot/dts/fsl/p1025rdb_32b.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * P1025 RDB Device Tree Source (32-bit address map)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p1025rdb_36b.dts b/arch/powerpc/boot=
/dts/fsl/p1025rdb_36b.dts
index b0ded5e8bd0b..8b7d23228909 100644
--- a/arch/powerpc/boot/dts/fsl/p1025rdb_36b.dts
+++ b/arch/powerpc/boot/dts/fsl/p1025rdb_36b.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * P1025 RDB Device Tree Source (36-bit address map)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p1025twr.dts b/arch/powerpc/boot/dts=
/fsl/p1025twr.dts
index 9b8863b74b60..a7819088d68e 100644
--- a/arch/powerpc/boot/dts/fsl/p1025twr.dts
+++ b/arch/powerpc/boot/dts/fsl/p1025twr.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * P1025 TWR Device Tree Source (32-bit address map)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p1025twr.dtsi b/arch/powerpc/boot/dt=
s/fsl/p1025twr.dtsi
index ab75b8f29ae2..f08a0a7bd483 100644
--- a/arch/powerpc/boot/dts/fsl/p1025twr.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p1025twr.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * P1025 TWR Device Tree Source stub (no addresses or top-level ranges)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p2020ds.dtsi b/arch/powerpc/boot/dts=
/fsl/p2020ds.dtsi
index e699cf95b063..2e68e28aeb7f 100644
--- a/arch/powerpc/boot/dts/fsl/p2020ds.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p2020ds.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * P2020DS Device Tree Source stub (no addresses or top-level ranges)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p2020rdb-pc.dtsi b/arch/powerpc/boot=
/dts/fsl/p2020rdb-pc.dtsi
index 03c9afc82436..0e132701de53 100644
--- a/arch/powerpc/boot/dts/fsl/p2020rdb-pc.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p2020rdb-pc.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * P2020 RDB-PC Device Tree Source stub (no addresses or top-level ranges)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dts b/arch/powerpc/b=
oot/dts/fsl/p2020rdb-pc_32b.dts
index d3295c204bbf..fb5800750605 100644
--- a/arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dts
+++ b/arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * P2020 RDB-PC 32Bit Physical Address Map Device Tree Source
  *
diff --git a/arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dts b/arch/powerpc/b=
oot/dts/fsl/p2020rdb-pc_36b.dts
index 9307a8f41ddb..ec118a384253 100644
--- a/arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dts
+++ b/arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * P2020 RDB-PC 36Bit Physical Address Map Device Tree Source
  *
diff --git a/arch/powerpc/boot/dts/fsl/p2020si-post.dtsi b/arch/powerpc/boo=
t/dts/fsl/p2020si-post.dtsi
index 884e01bcb243..5d6d66ab4b49 100644
--- a/arch/powerpc/boot/dts/fsl/p2020si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p2020si-post.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * P2020/P2010 Silicon/SoC Device Tree Source (post include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p2020si-pre.dtsi b/arch/powerpc/boot=
/dts/fsl/p2020si-pre.dtsi
index 42bf3c6d25ca..ce2cf36eb40d 100644
--- a/arch/powerpc/boot/dts/fsl/p2020si-pre.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p2020si-pre.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * P2020/P2010 Silicon/SoC Device Tree Source (pre include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p2041rdb.dts b/arch/powerpc/boot/dts=
/fsl/p2041rdb.dts
index 950816b9d6e1..d06996847567 100644
--- a/arch/powerpc/boot/dts/fsl/p2041rdb.dts
+++ b/arch/powerpc/boot/dts/fsl/p2041rdb.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * P2041RDB Device Tree Source
  *
diff --git a/arch/powerpc/boot/dts/fsl/p2041si-post.dtsi b/arch/powerpc/boo=
t/dts/fsl/p2041si-post.dtsi
index ddc018d42252..632bee3c1f08 100644
--- a/arch/powerpc/boot/dts/fsl/p2041si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p2041si-post.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * P2041/P2040 Silicon/SoC Device Tree Source (post include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p2041si-pre.dtsi b/arch/powerpc/boot=
/dts/fsl/p2041si-pre.dtsi
index 6318962e8d14..df0c64eda5a6 100644
--- a/arch/powerpc/boot/dts/fsl/p2041si-pre.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p2041si-pre.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * P2041 Silicon/SoC Device Tree Source (pre include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p3041ds.dts b/arch/powerpc/boot/dts/=
fsl/p3041ds.dts
index 6f5f7283c533..02e4ad42ce08 100644
--- a/arch/powerpc/boot/dts/fsl/p3041ds.dts
+++ b/arch/powerpc/boot/dts/fsl/p3041ds.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * P3041DS Device Tree Source
  *
diff --git a/arch/powerpc/boot/dts/fsl/p3041si-post.dtsi b/arch/powerpc/boo=
t/dts/fsl/p3041si-post.dtsi
index 81bc75aca2e0..894d13cc9b73 100644
--- a/arch/powerpc/boot/dts/fsl/p3041si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p3041si-post.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * P3041 Silicon/SoC Device Tree Source (post include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p3041si-pre.dtsi b/arch/powerpc/boot=
/dts/fsl/p3041si-pre.dtsi
index db92f1151a48..e5741a7d1159 100644
--- a/arch/powerpc/boot/dts/fsl/p3041si-pre.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p3041si-pre.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * P3041 Silicon/SoC Device Tree Source (pre include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p4080ds.dts b/arch/powerpc/boot/dts/=
fsl/p4080ds.dts
index 969b32c4f2d5..8e5adb10d546 100644
--- a/arch/powerpc/boot/dts/fsl/p4080ds.dts
+++ b/arch/powerpc/boot/dts/fsl/p4080ds.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * P4080DS Device Tree Source
  *
diff --git a/arch/powerpc/boot/dts/fsl/p4080si-post.dtsi b/arch/powerpc/boo=
t/dts/fsl/p4080si-post.dtsi
index 4da49b6dd3f5..bc215249883d 100644
--- a/arch/powerpc/boot/dts/fsl/p4080si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p4080si-post.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * P4080/P4040 Silicon/SoC Device Tree Source (post include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p4080si-pre.dtsi b/arch/powerpc/boot=
/dts/fsl/p4080si-pre.dtsi
index 0a7c65a00e5e..c6fd332dea15 100644
--- a/arch/powerpc/boot/dts/fsl/p4080si-pre.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p4080si-pre.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * P4080/P4040 Silicon/SoC Device Tree Source (pre include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p5020ds.dts b/arch/powerpc/boot/dts/=
fsl/p5020ds.dts
index b24adf902d8d..683bb1f961fd 100644
--- a/arch/powerpc/boot/dts/fsl/p5020ds.dts
+++ b/arch/powerpc/boot/dts/fsl/p5020ds.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * P5020DS Device Tree Source
  *
diff --git a/arch/powerpc/boot/dts/fsl/p5020si-post.dtsi b/arch/powerpc/boo=
t/dts/fsl/p5020si-post.dtsi
index cd008cdd2889..719ffc2ed777 100644
--- a/arch/powerpc/boot/dts/fsl/p5020si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p5020si-post.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * P5020/5010 Silicon/SoC Device Tree Source (post include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p5020si-pre.dtsi b/arch/powerpc/boot=
/dts/fsl/p5020si-pre.dtsi
index 2d74ea85e5df..4286e06ee5b5 100644
--- a/arch/powerpc/boot/dts/fsl/p5020si-pre.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p5020si-pre.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * P5020/P5010 Silicon/SoC Device Tree Source (pre include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p5040ds.dts b/arch/powerpc/boot/dts/=
fsl/p5040ds.dts
index 30850b3228e0..e92c149a6c2d 100644
--- a/arch/powerpc/boot/dts/fsl/p5040ds.dts
+++ b/arch/powerpc/boot/dts/fsl/p5040ds.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * P5040DS Device Tree Source
  *
diff --git a/arch/powerpc/boot/dts/fsl/p5040si-post.dtsi b/arch/powerpc/boo=
t/dts/fsl/p5040si-post.dtsi
index 16b454b504e2..61af9c41bc49 100644
--- a/arch/powerpc/boot/dts/fsl/p5040si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p5040si-post.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * P5040 Silicon/SoC Device Tree Source (post include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p5040si-pre.dtsi b/arch/powerpc/boot=
/dts/fsl/p5040si-pre.dtsi
index ed89dbbdacf0..2bff85834a63 100644
--- a/arch/powerpc/boot/dts/fsl/p5040si-pre.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p5040si-pre.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * P5040 Silicon/SoC Device Tree Source (pre include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/pq3-dma-0.dtsi b/arch/powerpc/boot/d=
ts/fsl/pq3-dma-0.dtsi
index b5b37ad30e75..11ff0ec76303 100644
--- a/arch/powerpc/boot/dts/fsl/pq3-dma-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/pq3-dma-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * PQ3 DMA device tree stub [ controller @ offset 0x21000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/pq3-dma-1.dtsi b/arch/powerpc/boot/d=
ts/fsl/pq3-dma-1.dtsi
index 28cb8a55d807..841e0603ce15 100644
--- a/arch/powerpc/boot/dts/fsl/pq3-dma-1.dtsi
+++ b/arch/powerpc/boot/dts/fsl/pq3-dma-1.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * PQ3 DMA device tree stub [ controller @ offset 0xc300 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/pq3-duart-0.dtsi b/arch/powerpc/boot=
/dts/fsl/pq3-duart-0.dtsi
index 5e268fdb9d1f..f2ed31d9b165 100644
--- a/arch/powerpc/boot/dts/fsl/pq3-duart-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/pq3-duart-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * PQ3 DUART device tree stub [ controller @ offset 0x4000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/pq3-esdhc-0.dtsi b/arch/powerpc/boot=
/dts/fsl/pq3-esdhc-0.dtsi
index 5743433e278e..7bdf7e17b138 100644
--- a/arch/powerpc/boot/dts/fsl/pq3-esdhc-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/pq3-esdhc-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * PQ3 eSDHC device tree stub [ controller @ offset 0x2e000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/pq3-espi-0.dtsi b/arch/powerpc/boot/=
dts/fsl/pq3-espi-0.dtsi
index 75854b2e0391..928144ffb754 100644
--- a/arch/powerpc/boot/dts/fsl/pq3-espi-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/pq3-espi-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * PQ3 eSPI device tree stub [ controller @ offset 0x7000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/pq3-etsec1-0.dtsi b/arch/powerpc/boo=
t/dts/fsl/pq3-etsec1-0.dtsi
index 3b0650a98478..7f7c4fbfecd8 100644
--- a/arch/powerpc/boot/dts/fsl/pq3-etsec1-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/pq3-etsec1-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * PQ3 eTSEC device tree stub [ @ offsets 0x24000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/pq3-etsec1-1.dtsi b/arch/powerpc/boo=
t/dts/fsl/pq3-etsec1-1.dtsi
index 96693b41f0f1..db91f98d6117 100644
--- a/arch/powerpc/boot/dts/fsl/pq3-etsec1-1.dtsi
+++ b/arch/powerpc/boot/dts/fsl/pq3-etsec1-1.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * PQ3 eTSEC device tree stub [ @ offsets 0x25000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/pq3-etsec1-2.dtsi b/arch/powerpc/boo=
t/dts/fsl/pq3-etsec1-2.dtsi
index 6b3fab19da1f..63cdb5e29445 100644
--- a/arch/powerpc/boot/dts/fsl/pq3-etsec1-2.dtsi
+++ b/arch/powerpc/boot/dts/fsl/pq3-etsec1-2.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * PQ3 eTSEC device tree stub [ @ offsets 0x26000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/pq3-etsec1-3.dtsi b/arch/powerpc/boo=
t/dts/fsl/pq3-etsec1-3.dtsi
index 0da592d93ddd..6afb3ea69715 100644
--- a/arch/powerpc/boot/dts/fsl/pq3-etsec1-3.dtsi
+++ b/arch/powerpc/boot/dts/fsl/pq3-etsec1-3.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * PQ3 eTSEC device tree stub [ @ offsets 0x27000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/pq3-etsec1-timer-0.dtsi b/arch/power=
pc/boot/dts/fsl/pq3-etsec1-timer-0.dtsi
index efe2ca04bce8..a94b26a94c61 100644
--- a/arch/powerpc/boot/dts/fsl/pq3-etsec1-timer-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/pq3-etsec1-timer-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * PQ3 eTSEC Timer (IEEE 1588) device tree stub [ @ offsets 0x24e00 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/pq3-etsec2-0.dtsi b/arch/powerpc/boo=
t/dts/fsl/pq3-etsec2-0.dtsi
index 7fcb1ac0f232..ba69277b2c06 100644
--- a/arch/powerpc/boot/dts/fsl/pq3-etsec2-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/pq3-etsec2-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * PQ3 eTSEC2 device tree stub [ @ offsets 0x24000/0xb0000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/pq3-etsec2-1.dtsi b/arch/powerpc/boo=
t/dts/fsl/pq3-etsec2-1.dtsi
index 9f25427c1527..b56d698f3f51 100644
--- a/arch/powerpc/boot/dts/fsl/pq3-etsec2-1.dtsi
+++ b/arch/powerpc/boot/dts/fsl/pq3-etsec2-1.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * PQ3 eTSEC2 device tree stub [ @ offsets 0x25000/0xb1000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/pq3-etsec2-2.dtsi b/arch/powerpc/boo=
t/dts/fsl/pq3-etsec2-2.dtsi
index cd7c318ab131..8e3e94ca98ae 100644
--- a/arch/powerpc/boot/dts/fsl/pq3-etsec2-2.dtsi
+++ b/arch/powerpc/boot/dts/fsl/pq3-etsec2-2.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * PQ3 eTSEC2 device tree stub [ @ offsets 0x26000/0xb2000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/pq3-etsec2-grp2-0.dtsi b/arch/powerp=
c/boot/dts/fsl/pq3-etsec2-grp2-0.dtsi
index 034ab8fac22f..b5d65de67320 100644
--- a/arch/powerpc/boot/dts/fsl/pq3-etsec2-grp2-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/pq3-etsec2-grp2-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * PQ3 eTSEC2 Group 2 device tree stub [ @ offsets 0xb4000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/pq3-etsec2-grp2-1.dtsi b/arch/powerp=
c/boot/dts/fsl/pq3-etsec2-grp2-1.dtsi
index 3be9ba3b374e..70136346c0fa 100644
--- a/arch/powerpc/boot/dts/fsl/pq3-etsec2-grp2-1.dtsi
+++ b/arch/powerpc/boot/dts/fsl/pq3-etsec2-grp2-1.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * PQ3 eTSEC2 Group 2 device tree stub [ @ offsets 0xb5000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/pq3-etsec2-grp2-2.dtsi b/arch/powerp=
c/boot/dts/fsl/pq3-etsec2-grp2-2.dtsi
index 02a33457048c..88fbdb8c7836 100644
--- a/arch/powerpc/boot/dts/fsl/pq3-etsec2-grp2-2.dtsi
+++ b/arch/powerpc/boot/dts/fsl/pq3-etsec2-grp2-2.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * PQ3 eTSEC2 Group 2 device tree stub [ @ offsets 0xb6000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/pq3-gpio-0.dtsi b/arch/powerpc/boot/=
dts/fsl/pq3-gpio-0.dtsi
index a1b48546b02d..4ce219edcddd 100644
--- a/arch/powerpc/boot/dts/fsl/pq3-gpio-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/pq3-gpio-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * PQ3 GPIO device tree stub [ controller @ offset 0xfc00 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/pq3-i2c-0.dtsi b/arch/powerpc/boot/d=
ts/fsl/pq3-i2c-0.dtsi
index d1dd6fb82a78..208b965372b5 100644
--- a/arch/powerpc/boot/dts/fsl/pq3-i2c-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/pq3-i2c-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * PQ3 I2C device tree stub [ controller @ offset 0x3000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/pq3-i2c-1.dtsi b/arch/powerpc/boot/d=
ts/fsl/pq3-i2c-1.dtsi
index a9bd803e2090..f4f6c191faf8 100644
--- a/arch/powerpc/boot/dts/fsl/pq3-i2c-1.dtsi
+++ b/arch/powerpc/boot/dts/fsl/pq3-i2c-1.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * PQ3 I2C device tree stub [ controller @ offset 0x3100 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/pq3-mpic-message-B.dtsi b/arch/power=
pc/boot/dts/fsl/pq3-mpic-message-B.dtsi
index 1cf0b77b1efe..6e80d086cc08 100644
--- a/arch/powerpc/boot/dts/fsl/pq3-mpic-message-B.dtsi
+++ b/arch/powerpc/boot/dts/fsl/pq3-mpic-message-B.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * PQ3 MPIC Message (Group B) device tree stub [ controller @ offset 0x424=
00 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/pq3-mpic-timer-B.dtsi b/arch/powerpc=
/boot/dts/fsl/pq3-mpic-timer-B.dtsi
index 8734cffae1a1..a2e6750c63ec 100644
--- a/arch/powerpc/boot/dts/fsl/pq3-mpic-timer-B.dtsi
+++ b/arch/powerpc/boot/dts/fsl/pq3-mpic-timer-B.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * PQ3 MPIC Timer (Group B) device tree stub [ controller @ offset 0x42100=
 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/pq3-mpic.dtsi b/arch/powerpc/boot/dt=
s/fsl/pq3-mpic.dtsi
index 71c30eb10056..e63eb98957a3 100644
--- a/arch/powerpc/boot/dts/fsl/pq3-mpic.dtsi
+++ b/arch/powerpc/boot/dts/fsl/pq3-mpic.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * PQ3 MPIC device tree stub [ controller @ offset 0x40000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/pq3-rmu-0.dtsi b/arch/powerpc/boot/d=
ts/fsl/pq3-rmu-0.dtsi
index 587ca9ffad7d..28f7d517d924 100644
--- a/arch/powerpc/boot/dts/fsl/pq3-rmu-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/pq3-rmu-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * PQ3 RIO Message Unit device tree stub [ controller @ offset 0xd3000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/pq3-sata2-0.dtsi b/arch/powerpc/boot=
/dts/fsl/pq3-sata2-0.dtsi
index 3c28dd08d38b..0990a7394f44 100644
--- a/arch/powerpc/boot/dts/fsl/pq3-sata2-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/pq3-sata2-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * PQ3 SATAv2 device tree stub [ controller @ offset 0x18000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/pq3-sata2-1.dtsi b/arch/powerpc/boot=
/dts/fsl/pq3-sata2-1.dtsi
index eefaf2855e3b..228c68c38aa8 100644
--- a/arch/powerpc/boot/dts/fsl/pq3-sata2-1.dtsi
+++ b/arch/powerpc/boot/dts/fsl/pq3-sata2-1.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * PQ3 SATAv2 device tree stub [ controller @ offset 0x19000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/pq3-sec2.1-0.dtsi b/arch/powerpc/boo=
t/dts/fsl/pq3-sec2.1-0.dtsi
index 02a5c7ae72d0..8b13ae276f80 100644
--- a/arch/powerpc/boot/dts/fsl/pq3-sec2.1-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/pq3-sec2.1-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * PQ3 Sec/Crypto 2.1 device tree stub [ controller @ offset 0x30000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/pq3-sec3.0-0.dtsi b/arch/powerpc/boo=
t/dts/fsl/pq3-sec3.0-0.dtsi
index bba1ba44ccf0..6c8b51d2dd94 100644
--- a/arch/powerpc/boot/dts/fsl/pq3-sec3.0-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/pq3-sec3.0-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * PQ3 Sec/Crypto 3.0 device tree stub [ controller @ offset 0x30000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/pq3-sec3.1-0.dtsi b/arch/powerpc/boo=
t/dts/fsl/pq3-sec3.1-0.dtsi
index 8f0a5669bee5..c159f1e3f01c 100644
--- a/arch/powerpc/boot/dts/fsl/pq3-sec3.1-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/pq3-sec3.1-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * PQ3 Sec/Crypto 3.1 device tree stub [ controller @ offset 0x30000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/pq3-sec3.3-0.dtsi b/arch/powerpc/boo=
t/dts/fsl/pq3-sec3.3-0.dtsi
index c227f2748a24..b68dc089ef17 100644
--- a/arch/powerpc/boot/dts/fsl/pq3-sec3.3-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/pq3-sec3.3-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * PQ3 Sec/Crypto 3.3 device tree stub [ controller @ offset 0x30000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/pq3-sec4.4-0.dtsi b/arch/powerpc/boo=
t/dts/fsl/pq3-sec4.4-0.dtsi
index bb3d8266b5ce..70811fb689b7 100644
--- a/arch/powerpc/boot/dts/fsl/pq3-sec4.4-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/pq3-sec4.4-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * PQ3 Sec/Crypto 4.4 device tree stub [ controller @ offset 0x30000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/pq3-usb2-dr-0.dtsi b/arch/powerpc/bo=
ot/dts/fsl/pq3-usb2-dr-0.dtsi
index 185ab9dc3ecd..24a0caec1540 100644
--- a/arch/powerpc/boot/dts/fsl/pq3-usb2-dr-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/pq3-usb2-dr-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * PQ3 USB DR device tree stub [ controller @ offset 0x22000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/pq3-usb2-dr-1.dtsi b/arch/powerpc/bo=
ot/dts/fsl/pq3-usb2-dr-1.dtsi
index fe24cd612fff..00b51c645734 100644
--- a/arch/powerpc/boot/dts/fsl/pq3-usb2-dr-1.dtsi
+++ b/arch/powerpc/boot/dts/fsl/pq3-usb2-dr-1.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * PQ3 USB DR device tree stub [ controller @ offset 0x23000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qonverge-usb2-dr-0.dtsi b/arch/power=
pc/boot/dts/fsl/qonverge-usb2-dr-0.dtsi
index fcc7e5b7fd47..c69c2f4eb571 100644
--- a/arch/powerpc/boot/dts/fsl/qonverge-usb2-dr-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qonverge-usb2-dr-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * QorIQ Qonverge USB Host device tree stub [ controller @ offset 0x210000=
 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-bman1-portals.dtsi b/arch/powe=
rpc/boot/dts/fsl/qoriq-bman1-portals.dtsi
index 5022432ebaa9..a48d0daf1d05 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-bman1-portals.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-bman1-portals.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * QorIQ BMan Portal device tree stub for 10 portals
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-bman1.dtsi b/arch/powerpc/boot=
/dts/fsl/qoriq-bman1.dtsi
index 3b5e3504acb7..1af32f8dd347 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-bman1.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-bman1.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * QorIQ BMan device tree stub [ controller @ offset 0x31a000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-clockgen1.dtsi b/arch/powerpc/=
boot/dts/fsl/qoriq-clockgen1.dtsi
index 463c1ed9ffdd..abfcf25a9192 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-clockgen1.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-clockgen1.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * QorIQ clock control device tree stub [ controller @ offset 0xe1000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-clockgen2.dtsi b/arch/powerpc/=
boot/dts/fsl/qoriq-clockgen2.dtsi
index 0361050bb56a..d4d3b7b00bdb 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-clockgen2.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-clockgen2.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * QorIQ clock control device tree stub [ controller @ offset 0xe1000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-dma-0.dtsi b/arch/powerpc/boot=
/dts/fsl/qoriq-dma-0.dtsi
index 1aebf3ea4ca5..c9334eb48b41 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-dma-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-dma-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * QorIQ DMA device tree stub [ controller @ offset 0x100000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-dma-1.dtsi b/arch/powerpc/boot=
/dts/fsl/qoriq-dma-1.dtsi
index ecf5e180fe79..f59c384dcac2 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-dma-1.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-dma-1.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * QorIQ DMA device tree stub [ controller @ offset 0x101000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-duart-0.dtsi b/arch/powerpc/bo=
ot/dts/fsl/qoriq-duart-0.dtsi
index 225c07b4e8ab..3eef9343cdce 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-duart-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-duart-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * QorIQ DUART device tree stub [ controller @ offset 0x11c000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-duart-1.dtsi b/arch/powerpc/bo=
ot/dts/fsl/qoriq-duart-1.dtsi
index d23233a56b91..15f98ff3264a 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-duart-1.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-duart-1.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * QorIQ DUART device tree stub [ controller @ offset 0x11d000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-esdhc-0.dtsi b/arch/powerpc/bo=
ot/dts/fsl/qoriq-esdhc-0.dtsi
index 20835ae216c7..afcf1621f6cd 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-esdhc-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-esdhc-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * QorIQ eSDHC device tree stub [ controller @ offset 0x114000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-espi-0.dtsi b/arch/powerpc/boo=
t/dts/fsl/qoriq-espi-0.dtsi
index 6db06975e095..4736ee1c16a4 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-espi-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-espi-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * QorIQ eSPI device tree stub [ controller @ offset 0x110000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman-0-10g-0.dtsi b/arch/power=
pc/boot/dts/fsl/qoriq-fman-0-10g-0.dtsi
index eb77675c255a..c7586e443c74 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman-0-10g-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman-0-10g-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * QorIQ FMan 10g port #0 device tree stub [ controller @ offset 0x400000 =
]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman-0-1g-0.dtsi b/arch/powerp=
c/boot/dts/fsl/qoriq-fman-0-1g-0.dtsi
index b965bc219bae..0582ab28e72e 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman-0-1g-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman-0-1g-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * QorIQ FMan 1g port #0 device tree stub [ controller @ offset 0x400000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman-0-1g-1.dtsi b/arch/powerp=
c/boot/dts/fsl/qoriq-fman-0-1g-1.dtsi
index 9eb6e6dd7cf9..dd199fdcce67 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman-0-1g-1.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman-0-1g-1.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * QorIQ FMan 1g port #1 device tree stub [ controller @ offset 0x400000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman-0-1g-2.dtsi b/arch/powerp=
c/boot/dts/fsl/qoriq-fman-0-1g-2.dtsi
index 092b89936743..65277c2d2e88 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman-0-1g-2.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman-0-1g-2.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * QorIQ FMan 1g port #2 device tree stub [ controller @ offset 0x400000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman-0-1g-3.dtsi b/arch/powerp=
c/boot/dts/fsl/qoriq-fman-0-1g-3.dtsi
index 2df0dc876045..7510bbd16216 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman-0-1g-3.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman-0-1g-3.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * QorIQ FMan 1g port #3 device tree stub [ controller @ offset 0x400000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman-0-1g-4.dtsi b/arch/powerp=
c/boot/dts/fsl/qoriq-fman-0-1g-4.dtsi
index 5fceb2438fdc..da57416cb74b 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman-0-1g-4.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman-0-1g-4.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * QorIQ FMan 1g port #4 device tree stub [ controller @ offset 0x400000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman-0.dtsi b/arch/powerpc/boo=
t/dts/fsl/qoriq-fman-0.dtsi
index 9b6cf9149937..886444dde530 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * QorIQ FMan device tree stub [ controller @ offset 0x400000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman-1-10g-0.dtsi b/arch/power=
pc/boot/dts/fsl/qoriq-fman-1-10g-0.dtsi
index 83ae87b69d92..8b2795eb813a 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman-1-10g-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman-1-10g-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * QorIQ FMan 10g port #0 device tree stub [ controller @ offset 0x500000 =
]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman-1-1g-0.dtsi b/arch/powerp=
c/boot/dts/fsl/qoriq-fman-1-1g-0.dtsi
index b0f0e36a4eac..d3d89c95a308 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman-1-1g-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman-1-1g-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * QorIQ FMan 1g port #0 device tree stub [ controller @ offset 0x500000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman-1-1g-1.dtsi b/arch/powerp=
c/boot/dts/fsl/qoriq-fman-1-1g-1.dtsi
index a3a79f8552a3..3d5e30833b96 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman-1-1g-1.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman-1-1g-1.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * QorIQ FMan 1g port #1 device tree stub [ controller @ offset 0x500000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman-1-1g-2.dtsi b/arch/powerp=
c/boot/dts/fsl/qoriq-fman-1-1g-2.dtsi
index 96a69a84b8a8..cf7052524f93 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman-1-1g-2.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman-1-1g-2.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * QorIQ FMan 1g port #2 device tree stub [ controller @ offset 0x500000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman-1-1g-3.dtsi b/arch/powerp=
c/boot/dts/fsl/qoriq-fman-1-1g-3.dtsi
index 7405d1940133..1755bd716cb6 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman-1-1g-3.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman-1-1g-3.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * QorIQ FMan 1g port #3 device tree stub [ controller @ offset 0x500000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman-1-1g-4.dtsi b/arch/powerp=
c/boot/dts/fsl/qoriq-fman-1-1g-4.dtsi
index f49ad69e5212..527f999706b9 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman-1-1g-4.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman-1-1g-4.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * QorIQ FMan 1g port #4 device tree stub [ controller @ offset 0x500000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman-1.dtsi b/arch/powerpc/boo=
t/dts/fsl/qoriq-fman-1.dtsi
index e95c11ff0417..b4ba854f3de9 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman-1.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman-1.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * QorIQ FMan device tree stub [ controller @ offset 0x500000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-0-best-effort.dtsi=
 b/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-0-best-effort.dtsi
index baa0c503e741..c3d581c7824d 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-0-best-effort.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-0-best-effort.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * QorIQ FMan v3 1g port #0 device tree stub [ controller @ offset 0x40000=
0 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-0.dtsi b/arch/powe=
rpc/boot/dts/fsl/qoriq-fman3-0-10g-0.dtsi
index 93095600e808..ee3ce10531aa 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * QorIQ FMan v3 10g port #0 device tree stub [ controller @ offset 0x4000=
00 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-1-best-effort.dtsi=
 b/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-1-best-effort.dtsi
index ff4bd38f0645..06a8500e0dcf 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-1-best-effort.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-1-best-effort.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * QorIQ FMan v3 1g port #1 device tree stub [ controller @ offset 0x40000=
0 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-1.dtsi b/arch/powe=
rpc/boot/dts/fsl/qoriq-fman3-0-10g-1.dtsi
index 1fa38ed6f59e..bb6026e466c5 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-1.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-1.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * QorIQ FMan v3 10g port #1 device tree stub [ controller @ offset 0x4000=
00 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-0.dtsi b/arch/power=
pc/boot/dts/fsl/qoriq-fman3-0-1g-0.dtsi
index a8cc9780c0c4..988adec1a073 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * QorIQ FMan v3 1g port #0 device tree stub [ controller @ offset 0x40000=
0 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-1.dtsi b/arch/power=
pc/boot/dts/fsl/qoriq-fman3-0-1g-1.dtsi
index 8b8bd70c9382..c4158a1514a8 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-1.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-1.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * QorIQ FMan v3 1g port #1 device tree stub [ controller @ offset 0x40000=
0 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-2.dtsi b/arch/power=
pc/boot/dts/fsl/qoriq-fman3-0-1g-2.dtsi
index 619c880b54d8..f3db8cba1cf7 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-2.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-2.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * QorIQ FMan v3 1g port #2 device tree stub [ controller @ offset 0x40000=
0 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-3.dtsi b/arch/power=
pc/boot/dts/fsl/qoriq-fman3-0-1g-3.dtsi
index d7ebb73a400d..1bf79e529881 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-3.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-3.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * QorIQ FMan v3 1g port #3 device tree stub [ controller @ offset 0x40000=
0 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-4.dtsi b/arch/power=
pc/boot/dts/fsl/qoriq-fman3-0-1g-4.dtsi
index b151d696a069..65ddaec3a92f 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-4.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-4.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * QorIQ FMan v3 1g port #4 device tree stub [ controller @ offset 0x40000=
0 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-5.dtsi b/arch/power=
pc/boot/dts/fsl/qoriq-fman3-0-1g-5.dtsi
index adc0ae0013a3..74c44946e3b4 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-5.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-5.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * QorIQ FMan v3 1g port #5 device tree stub [ controller @ offset 0x40000=
0 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0.dtsi b/arch/powerpc/bo=
ot/dts/fsl/qoriq-fman3-0.dtsi
index d62b36c5a329..46637110beea 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman3-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * QorIQ FMan v3 device tree stub [ controller @ offset 0x400000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-10g-0.dtsi b/arch/powe=
rpc/boot/dts/fsl/qoriq-fman3-1-10g-0.dtsi
index 435047e0e250..68d42445c13d 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-10g-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-10g-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * QorIQ FMan v3 10g port #0 device tree stub [ controller @ offset 0x5000=
00 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-10g-1.dtsi b/arch/powe=
rpc/boot/dts/fsl/qoriq-fman3-1-10g-1.dtsi
index c098657cca0a..9d31febcdef6 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-10g-1.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-10g-1.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * QorIQ FMan v3 10g port #1 device tree stub [ controller @ offset 0x5000=
00 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-0.dtsi b/arch/power=
pc/boot/dts/fsl/qoriq-fman3-1-1g-0.dtsi
index 9d06824815f3..fe948e1a6ac1 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * QorIQ FMan v3 1g port #0 device tree stub [ controller @ offset 0x50000=
0 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-1.dtsi b/arch/power=
pc/boot/dts/fsl/qoriq-fman3-1-1g-1.dtsi
index 70e947730c4b..f0e42c562a5c 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-1.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-1.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * QorIQ FMan v3 1g port #1 device tree stub [ controller @ offset 0x50000=
0 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-2.dtsi b/arch/power=
pc/boot/dts/fsl/qoriq-fman3-1-1g-2.dtsi
index ad96e6529595..114b13abd140 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-2.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-2.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * QorIQ FMan v3 1g port #2 device tree stub [ controller @ offset 0x50000=
0 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-3.dtsi b/arch/power=
pc/boot/dts/fsl/qoriq-fman3-1-1g-3.dtsi
index 034bc4b71f7a..38f7552aac23 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-3.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-3.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * QorIQ FMan v3 1g port #3 device tree stub [ controller @ offset 0x50000=
0 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-4.dtsi b/arch/power=
pc/boot/dts/fsl/qoriq-fman3-1-1g-4.dtsi
index 93ca23d82b39..ec05e5c7780a 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-4.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-4.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * QorIQ FMan v3 1g port #4 device tree stub [ controller @ offset 0x50000=
0 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-5.dtsi b/arch/power=
pc/boot/dts/fsl/qoriq-fman3-1-1g-5.dtsi
index 23b3117a2fd2..5cfae0913b8c 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-5.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-5.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * QorIQ FMan v3 1g port #5 device tree stub [ controller @ offset 0x50000=
0 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman3-1.dtsi b/arch/powerpc/bo=
ot/dts/fsl/qoriq-fman3-1.dtsi
index 310232460500..998513339003 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman3-1.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman3-1.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * QorIQ FMan v3 device tree stub [ controller @ offset 0x500000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman3l-0.dtsi b/arch/powerpc/b=
oot/dts/fsl/qoriq-fman3l-0.dtsi
index c90702b04a53..93e93d18ba62 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman3l-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman3l-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * QorIQ FMan v3 device tree stub [ controller @ offset 0x400000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-gpio-0.dtsi b/arch/powerpc/boo=
t/dts/fsl/qoriq-gpio-0.dtsi
index cf714f5f68bc..ca4c342d2c9e 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-gpio-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-gpio-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * QorIQ GPIO device tree stub [ controller @ offset 0x130000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-gpio-1.dtsi b/arch/powerpc/boo=
t/dts/fsl/qoriq-gpio-1.dtsi
index c2f9cdadb604..0832d3816c5f 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-gpio-1.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-gpio-1.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * QorIQ GPIO device tree stub [ controller @ offset 0x131000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-gpio-2.dtsi b/arch/powerpc/boo=
t/dts/fsl/qoriq-gpio-2.dtsi
index 33f3ccbac83f..53bcb10d7cd2 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-gpio-2.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-gpio-2.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * QorIQ GPIO device tree stub [ controller @ offset 0x132000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-gpio-3.dtsi b/arch/powerpc/boo=
t/dts/fsl/qoriq-gpio-3.dtsi
index 86954e95ea02..4c34978fcb13 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-gpio-3.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-gpio-3.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * QorIQ GPIO device tree stub [ controller @ offset 0x133000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-i2c-0.dtsi b/arch/powerpc/boot=
/dts/fsl/qoriq-i2c-0.dtsi
index 5f9bf7debe4c..7e21baa72fbb 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-i2c-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-i2c-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * QorIQ I2C device tree stub [ controller @ offset 0x118000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-i2c-1.dtsi b/arch/powerpc/boot=
/dts/fsl/qoriq-i2c-1.dtsi
index 7989bf5eeb53..eed0f4a3dbd8 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-i2c-1.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-i2c-1.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * QorIQ I2C device tree stub [ controller @ offset 0x119000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-mpic.dtsi b/arch/powerpc/boot/=
dts/fsl/qoriq-mpic.dtsi
index 08f42271f86a..061303ea7ae4 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-mpic.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-mpic.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * QorIQ MPIC device tree stub [ controller @ offset 0x40000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-mpic4.3.dtsi b/arch/powerpc/bo=
ot/dts/fsl/qoriq-mpic4.3.dtsi
index 64f713c24825..cf8141b5458a 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-mpic4.3.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-mpic4.3.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * QorIQ MPIC device tree stub [ controller @ offset 0x40000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-qman1-portals.dtsi b/arch/powe=
rpc/boot/dts/fsl/qoriq-qman1-portals.dtsi
index e77e4b4ed53b..9a13fe3f8913 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-qman1-portals.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-qman1-portals.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * QorIQ QMan Portal device tree stub for 10 portals & 15 pool channels
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-qman1.dtsi b/arch/powerpc/boot=
/dts/fsl/qoriq-qman1.dtsi
index 0695778c4386..2fe0e906c70c 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-qman1.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-qman1.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * QorIQ QMan device tree stub [ controller @ offset 0x318000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-qman3.dtsi b/arch/powerpc/boot=
/dts/fsl/qoriq-qman3.dtsi
index b379abd1439d..1421806059ed 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-qman3.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-qman3.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * QorIQ QMan rev3 device tree stub [ controller @ offset 0x318000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-raid1.0-0.dtsi b/arch/powerpc/=
boot/dts/fsl/qoriq-raid1.0-0.dtsi
index 8d2e8aa6cf8a..9b2bcac7e0de 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-raid1.0-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-raid1.0-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * QorIQ RAID 1.0 device tree stub [ controller @ offset 0x320000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-rmu-0.dtsi b/arch/powerpc/boot=
/dts/fsl/qoriq-rmu-0.dtsi
index ca7fec792e53..dfa7ae5ef1cd 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-rmu-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-rmu-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * QorIQ RIO Message Unit device tree stub [ controller @ offset 0xd3000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-sata2-0.dtsi b/arch/powerpc/bo=
ot/dts/fsl/qoriq-sata2-0.dtsi
index b642047fdecf..0d8c28230b7e 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-sata2-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-sata2-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * QorIQ SATAv2 device tree stub [ controller @ offset 0x220000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-sata2-1.dtsi b/arch/powerpc/bo=
ot/dts/fsl/qoriq-sata2-1.dtsi
index c57370259750..8e704c66a06b 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-sata2-1.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-sata2-1.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * QorIQ SATAv2 device tree stub [ controller @ offset 0x221000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-sec4.0-0.dtsi b/arch/powerpc/b=
oot/dts/fsl/qoriq-sec4.0-0.dtsi
index 02bee5fcbb9a..74b13e4720fa 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-sec4.0-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-sec4.0-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * QorIQ Sec/Crypto 4.0 device tree stub [ controller @ offset 0x300000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-sec4.2-0.dtsi b/arch/powerpc/b=
oot/dts/fsl/qoriq-sec4.2-0.dtsi
index 7f7574e53323..48fc723d5933 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-sec4.2-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-sec4.2-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * QorIQ Sec/Crypto 4.2 device tree stub [ controller @ offset 0x300000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-sec5.0-0.dtsi b/arch/powerpc/b=
oot/dts/fsl/qoriq-sec5.0-0.dtsi
index e298efbb0f3e..38ddbabb223c 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-sec5.0-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-sec5.0-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * QorIQ Sec/Crypto 5.0 device tree stub [ controller @ offset 0x300000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-sec5.2-0.dtsi b/arch/powerpc/b=
oot/dts/fsl/qoriq-sec5.2-0.dtsi
index 33ff09d52e05..d17d0390e543 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-sec5.2-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-sec5.2-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * QorIQ Sec/Crypto 5.2 device tree stub [ controller @ offset 0x300000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-sec5.3-0.dtsi b/arch/powerpc/b=
oot/dts/fsl/qoriq-sec5.3-0.dtsi
index 08778221c194..eb2e2d558900 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-sec5.3-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-sec5.3-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * QorIQ Sec/Crypto 5.3 device tree stub [ controller @ offset 0x300000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-sec6.0-0.dtsi b/arch/powerpc/b=
oot/dts/fsl/qoriq-sec6.0-0.dtsi
index 7d4a6a2354f4..9fc96e6ea5ff 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-sec6.0-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-sec6.0-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * QorIQ Sec/Crypto 6.0 device tree stub
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-usb2-dr-0.dtsi b/arch/powerpc/=
boot/dts/fsl/qoriq-usb2-dr-0.dtsi
index 4dd6f84c239c..c85be7fd1ee5 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-usb2-dr-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-usb2-dr-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * QorIQ USB DR device tree stub [ controller @ offset 0x211000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-usb2-mph-0.dtsi b/arch/powerpc=
/boot/dts/fsl/qoriq-usb2-mph-0.dtsi
index f053835aa1c7..60929f46cb87 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-usb2-mph-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-usb2-mph-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * QorIQ USB Host device tree stub [ controller @ offset 0x210000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/t1023rdb.dts b/arch/powerpc/boot/dts=
/fsl/t1023rdb.dts
index f82f85c65964..ea73f6424ad4 100644
--- a/arch/powerpc/boot/dts/fsl/t1023rdb.dts
+++ b/arch/powerpc/boot/dts/fsl/t1023rdb.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * T1023 RDB Device Tree Source
  *
diff --git a/arch/powerpc/boot/dts/fsl/t1023si-post.dtsi b/arch/powerpc/boo=
t/dts/fsl/t1023si-post.dtsi
index d552044c5afc..4e8831ec95fd 100644
--- a/arch/powerpc/boot/dts/fsl/t1023si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/t1023si-post.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * T1023 Silicon/SoC Device Tree Source (post include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/t1024qds.dts b/arch/powerpc/boot/dts=
/fsl/t1024qds.dts
index d6858b7cd93f..8e505eb371cd 100644
--- a/arch/powerpc/boot/dts/fsl/t1024qds.dts
+++ b/arch/powerpc/boot/dts/fsl/t1024qds.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * T1024 QDS Device Tree Source
  *
diff --git a/arch/powerpc/boot/dts/fsl/t1024rdb.dts b/arch/powerpc/boot/dts=
/fsl/t1024rdb.dts
index dbcd31cc35dc..ee9b73da8379 100644
--- a/arch/powerpc/boot/dts/fsl/t1024rdb.dts
+++ b/arch/powerpc/boot/dts/fsl/t1024rdb.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * T1024 RDB Device Tree Source
  *
diff --git a/arch/powerpc/boot/dts/fsl/t1024si-post.dtsi b/arch/powerpc/boo=
t/dts/fsl/t1024si-post.dtsi
index bb480346a58d..53dd59cb508e 100644
--- a/arch/powerpc/boot/dts/fsl/t1024si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/t1024si-post.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * T1024 Silicon/SoC Device Tree Source (post include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/t102xsi-pre.dtsi b/arch/powerpc/boot=
/dts/fsl/t102xsi-pre.dtsi
index d87ea13164f2..de165056e066 100644
--- a/arch/powerpc/boot/dts/fsl/t102xsi-pre.dtsi
+++ b/arch/powerpc/boot/dts/fsl/t102xsi-pre.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * T1024/T1023 Silicon/SoC Device Tree Source (pre include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/t1040d4rdb.dts b/arch/powerpc/boot/d=
ts/fsl/t1040d4rdb.dts
index fb6bc02ebb60..a893a6f2a37a 100644
--- a/arch/powerpc/boot/dts/fsl/t1040d4rdb.dts
+++ b/arch/powerpc/boot/dts/fsl/t1040d4rdb.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * T1040D4RDB Device Tree Source
  *
diff --git a/arch/powerpc/boot/dts/fsl/t1040qds.dts b/arch/powerpc/boot/dts=
/fsl/t1040qds.dts
index 5f76edc7838c..ff6b99da42e3 100644
--- a/arch/powerpc/boot/dts/fsl/t1040qds.dts
+++ b/arch/powerpc/boot/dts/fsl/t1040qds.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * T1040QDS Device Tree Source
  *
diff --git a/arch/powerpc/boot/dts/fsl/t1040rdb.dts b/arch/powerpc/boot/dts=
/fsl/t1040rdb.dts
index af0c8a6f5613..f63933c0aa79 100644
--- a/arch/powerpc/boot/dts/fsl/t1040rdb.dts
+++ b/arch/powerpc/boot/dts/fsl/t1040rdb.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * T1040RDB Device Tree Source
  *
diff --git a/arch/powerpc/boot/dts/fsl/t1040si-post.dtsi b/arch/powerpc/boo=
t/dts/fsl/t1040si-post.dtsi
index f58eb820eb5e..78345b805da3 100644
--- a/arch/powerpc/boot/dts/fsl/t1040si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/t1040si-post.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * T1040 Silicon/SoC Device Tree Source (post include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/t1042d4rdb.dts b/arch/powerpc/boot/d=
ts/fsl/t1042d4rdb.dts
index 4fa15f48a4c3..3e39345e8cc0 100644
--- a/arch/powerpc/boot/dts/fsl/t1042d4rdb.dts
+++ b/arch/powerpc/boot/dts/fsl/t1042d4rdb.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * T1042D4RDB Device Tree Source
  *
diff --git a/arch/powerpc/boot/dts/fsl/t1042qds.dts b/arch/powerpc/boot/dts=
/fsl/t1042qds.dts
index 90a4a73bb905..98f2146c19ce 100644
--- a/arch/powerpc/boot/dts/fsl/t1042qds.dts
+++ b/arch/powerpc/boot/dts/fsl/t1042qds.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * T1042QDS Device Tree Source
  *
diff --git a/arch/powerpc/boot/dts/fsl/t1042rdb.dts b/arch/powerpc/boot/dts=
/fsl/t1042rdb.dts
index 3ebb712224cb..d37e6b304cd0 100644
--- a/arch/powerpc/boot/dts/fsl/t1042rdb.dts
+++ b/arch/powerpc/boot/dts/fsl/t1042rdb.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * T1042RDB Device Tree Source
  *
diff --git a/arch/powerpc/boot/dts/fsl/t1042rdb_pi.dts b/arch/powerpc/boot/=
dts/fsl/t1042rdb_pi.dts
index 8ec3ff45e6fc..7dc377c1089a 100644
--- a/arch/powerpc/boot/dts/fsl/t1042rdb_pi.dts
+++ b/arch/powerpc/boot/dts/fsl/t1042rdb_pi.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * T1042RDB_PI Device Tree Source
  *
diff --git a/arch/powerpc/boot/dts/fsl/t1042si-post.dtsi b/arch/powerpc/boo=
t/dts/fsl/t1042si-post.dtsi
index a5544f93689c..b5295a4c7d9a 100644
--- a/arch/powerpc/boot/dts/fsl/t1042si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/t1042si-post.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * T1042 Silicon/SoC Device Tree Source (post include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/t104xd4rdb.dtsi b/arch/powerpc/boot/=
dts/fsl/t104xd4rdb.dtsi
index 863f9431285f..0967a66623b9 100644
--- a/arch/powerpc/boot/dts/fsl/t104xd4rdb.dtsi
+++ b/arch/powerpc/boot/dts/fsl/t104xd4rdb.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * T1040D4RDB/T1042D4RDB Device Tree Source
  *
diff --git a/arch/powerpc/boot/dts/fsl/t104xqds.dtsi b/arch/powerpc/boot/dt=
s/fsl/t104xqds.dtsi
index 615479732252..336a9a194a5a 100644
--- a/arch/powerpc/boot/dts/fsl/t104xqds.dtsi
+++ b/arch/powerpc/boot/dts/fsl/t104xqds.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * T104xQDS Device Tree Source
  *
diff --git a/arch/powerpc/boot/dts/fsl/t104xrdb.dtsi b/arch/powerpc/boot/dt=
s/fsl/t104xrdb.dtsi
index 099a598c74c0..0d678fa0923f 100644
--- a/arch/powerpc/boot/dts/fsl/t104xrdb.dtsi
+++ b/arch/powerpc/boot/dts/fsl/t104xrdb.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * T1040RDB/T1042RDB Device Tree Source
  *
diff --git a/arch/powerpc/boot/dts/fsl/t104xsi-pre.dtsi b/arch/powerpc/boot=
/dts/fsl/t104xsi-pre.dtsi
index dd59e4b69480..17edd456ed77 100644
--- a/arch/powerpc/boot/dts/fsl/t104xsi-pre.dtsi
+++ b/arch/powerpc/boot/dts/fsl/t104xsi-pre.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * T1040/T1042 Silicon/SoC Device Tree Source (pre include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/t2080qds.dts b/arch/powerpc/boot/dts=
/fsl/t2080qds.dts
index 8d190e8c62ce..666ccfc10d43 100644
--- a/arch/powerpc/boot/dts/fsl/t2080qds.dts
+++ b/arch/powerpc/boot/dts/fsl/t2080qds.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * T2080QDS Device Tree Source
  *
diff --git a/arch/powerpc/boot/dts/fsl/t2080rdb.dts b/arch/powerpc/boot/dts=
/fsl/t2080rdb.dts
index 092a400740f8..59fb29192a83 100644
--- a/arch/powerpc/boot/dts/fsl/t2080rdb.dts
+++ b/arch/powerpc/boot/dts/fsl/t2080rdb.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * T2080PCIe-RDB Board Device Tree Source
  *
diff --git a/arch/powerpc/boot/dts/fsl/t2080si-post.dtsi b/arch/powerpc/boo=
t/dts/fsl/t2080si-post.dtsi
index 082ec2044060..ffdf71fe0902 100644
--- a/arch/powerpc/boot/dts/fsl/t2080si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/t2080si-post.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * T2080 Silicon/SoC Device Tree Source (post include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/t2081qds.dts b/arch/powerpc/boot/dts=
/fsl/t2081qds.dts
index fc5c4a30f7ad..f3814fa26ee9 100644
--- a/arch/powerpc/boot/dts/fsl/t2081qds.dts
+++ b/arch/powerpc/boot/dts/fsl/t2081qds.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * T2081QDS Device Tree Source
  *
diff --git a/arch/powerpc/boot/dts/fsl/t2081si-post.dtsi b/arch/powerpc/boo=
t/dts/fsl/t2081si-post.dtsi
index ecbb447920bc..430fd24fb60d 100644
--- a/arch/powerpc/boot/dts/fsl/t2081si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/t2081si-post.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * T2081 Silicon/SoC Device Tree Source (post include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/t208xqds.dtsi b/arch/powerpc/boot/dt=
s/fsl/t208xqds.dtsi
index db4139999b28..a1006165bc41 100644
--- a/arch/powerpc/boot/dts/fsl/t208xqds.dtsi
+++ b/arch/powerpc/boot/dts/fsl/t208xqds.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * T2080/T2081 QDS Device Tree Source
  *
diff --git a/arch/powerpc/boot/dts/fsl/t208xrdb.dtsi b/arch/powerpc/boot/dt=
s/fsl/t208xrdb.dtsi
index ff87e67c70da..9849f8afd465 100644
--- a/arch/powerpc/boot/dts/fsl/t208xrdb.dtsi
+++ b/arch/powerpc/boot/dts/fsl/t208xrdb.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * T2080PCIe-RDB Board Device Tree Source
  *
diff --git a/arch/powerpc/boot/dts/fsl/t208xsi-pre.dtsi b/arch/powerpc/boot=
/dts/fsl/t208xsi-pre.dtsi
index 3f745de44284..6fc92b1d0911 100644
--- a/arch/powerpc/boot/dts/fsl/t208xsi-pre.dtsi
+++ b/arch/powerpc/boot/dts/fsl/t208xsi-pre.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * T2080/T2081 Silicon/SoC Device Tree Source (pre include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/t4240qds.dts b/arch/powerpc/boot/dts=
/fsl/t4240qds.dts
index c0913ac5aaad..c2dcd078becf 100644
--- a/arch/powerpc/boot/dts/fsl/t4240qds.dts
+++ b/arch/powerpc/boot/dts/fsl/t4240qds.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * T4240QDS Device Tree Source
  *
diff --git a/arch/powerpc/boot/dts/fsl/t4240rdb.dts b/arch/powerpc/boot/dts=
/fsl/t4240rdb.dts
index 145896f2eef6..82f78680ac98 100644
--- a/arch/powerpc/boot/dts/fsl/t4240rdb.dts
+++ b/arch/powerpc/boot/dts/fsl/t4240rdb.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * T4240RDB Device Tree Source
  *
diff --git a/arch/powerpc/boot/dts/fsl/t4240si-post.dtsi b/arch/powerpc/boo=
t/dts/fsl/t4240si-post.dtsi
index fcac73486d48..8c4e15630d28 100644
--- a/arch/powerpc/boot/dts/fsl/t4240si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/t4240si-post.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * T4240 Silicon/SoC Device Tree Source (post include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/t4240si-pre.dtsi b/arch/powerpc/boot=
/dts/fsl/t4240si-pre.dtsi
index 632314c6faa9..41babab48e25 100644
--- a/arch/powerpc/boot/dts/fsl/t4240si-pre.dtsi
+++ b/arch/powerpc/boot/dts/fsl/t4240si-pre.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * T4240 Silicon/SoC Device Tree Source (pre include)
  *
diff --git a/arch/powerpc/boot/dts/fsp2.dts b/arch/powerpc/boot/dts/fsp2.dt=
s
index 9311b86b1bd9..738f2c6f65eb 100644
--- a/arch/powerpc/boot/dts/fsp2.dts
+++ b/arch/powerpc/boot/dts/fsp2.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Device Tree Source for FSP2
  *
diff --git a/arch/powerpc/boot/dts/glacier.dts b/arch/powerpc/boot/dts/glac=
ier.dts
index e84ff1afb58c..99288f564bb3 100644
--- a/arch/powerpc/boot/dts/glacier.dts
+++ b/arch/powerpc/boot/dts/glacier.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Device Tree Source for AMCC Glacier (460GT)
  *
diff --git a/arch/powerpc/boot/dts/haleakala.dts b/arch/powerpc/boot/dts/ha=
leakala.dts
index f81ce8786d59..ade71c06fff7 100644
--- a/arch/powerpc/boot/dts/haleakala.dts
+++ b/arch/powerpc/boot/dts/haleakala.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Device Tree Source for AMCC Haleakala (405EXr)
  *
diff --git a/arch/powerpc/boot/dts/holly.dts b/arch/powerpc/boot/dts/holly.=
dts
index 02bd304c7d38..a0707fa09027 100644
--- a/arch/powerpc/boot/dts/holly.dts
+++ b/arch/powerpc/boot/dts/holly.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Device Tree Source for IBM Holly (PPC 750CL with TSI controller)
  * Copyright 2007, IBM Corporation
diff --git a/arch/powerpc/boot/dts/hotfoot.dts b/arch/powerpc/boot/dts/hotf=
oot.dts
index b93bf2d9dd5b..bb3d764b74e3 100644
--- a/arch/powerpc/boot/dts/hotfoot.dts
+++ b/arch/powerpc/boot/dts/hotfoot.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Device Tree Source for ESTeem 195E Hotfoot
  *
diff --git a/arch/powerpc/boot/dts/icon.dts b/arch/powerpc/boot/dts/icon.dt=
s
index 4fd7a4fbb4fb..313a5921a26b 100644
--- a/arch/powerpc/boot/dts/icon.dts
+++ b/arch/powerpc/boot/dts/icon.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Device Tree Source for Mosaix Technologies, Inc. ICON board
  *
diff --git a/arch/powerpc/boot/dts/iss4xx-mpic.dts b/arch/powerpc/boot/dts/=
iss4xx-mpic.dts
index c9f90f1a9c8e..7326fe445f96 100644
--- a/arch/powerpc/boot/dts/iss4xx-mpic.dts
+++ b/arch/powerpc/boot/dts/iss4xx-mpic.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Device Tree Source for IBM Embedded PPC 476 Platform
  *
diff --git a/arch/powerpc/boot/dts/iss4xx.dts b/arch/powerpc/boot/dts/iss4x=
x.dts
index 5533aff25e41..04927f357d2b 100644
--- a/arch/powerpc/boot/dts/iss4xx.dts
+++ b/arch/powerpc/boot/dts/iss4xx.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Device Tree Source for IBM Embedded PPC 476 Platform
  *
diff --git a/arch/powerpc/boot/dts/katmai.dts b/arch/powerpc/boot/dts/katma=
i.dts
index a8f353229fb7..b66ae72fa327 100644
--- a/arch/powerpc/boot/dts/katmai.dts
+++ b/arch/powerpc/boot/dts/katmai.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Device Tree Source for AMCC Katmai eval board
  *
diff --git a/arch/powerpc/boot/dts/kilauea.dts b/arch/powerpc/boot/dts/kila=
uea.dts
index a709fb47a180..20fb83b3df12 100644
--- a/arch/powerpc/boot/dts/kilauea.dts
+++ b/arch/powerpc/boot/dts/kilauea.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Device Tree Source for AMCC Kilauea (405EX)
  *
diff --git a/arch/powerpc/boot/dts/ksi8560.dts b/arch/powerpc/boot/dts/ksi8=
560.dts
index fe6c17c8812a..4afc96d195f9 100644
--- a/arch/powerpc/boot/dts/ksi8560.dts
+++ b/arch/powerpc/boot/dts/ksi8560.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Device Tree Source for Emerson KSI8560
  *
diff --git a/arch/powerpc/boot/dts/kuroboxHD.dts b/arch/powerpc/boot/dts/ku=
roboxHD.dts
index 0a4545159e80..e3f41d2962e3 100644
--- a/arch/powerpc/boot/dts/kuroboxHD.dts
+++ b/arch/powerpc/boot/dts/kuroboxHD.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Device Tree Souce for Buffalo KuroboxHD
  *
diff --git a/arch/powerpc/boot/dts/kuroboxHG.dts b/arch/powerpc/boot/dts/ku=
roboxHG.dts
index 0e758b347cdb..e27f2b43b8df 100644
--- a/arch/powerpc/boot/dts/kuroboxHG.dts
+++ b/arch/powerpc/boot/dts/kuroboxHG.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Device Tree Souce for Buffalo KuroboxHG
  *
diff --git a/arch/powerpc/boot/dts/makalu.dts b/arch/powerpc/boot/dts/makal=
u.dts
index c473cd911bca..b05fc1f5a71a 100644
--- a/arch/powerpc/boot/dts/makalu.dts
+++ b/arch/powerpc/boot/dts/makalu.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Device Tree Source for AMCC Makalu (405EX)
  *
diff --git a/arch/powerpc/boot/dts/microwatt.dts b/arch/powerpc/boot/dts/mi=
crowatt.dts
index 65b270a90f94..05abbe044205 100644
--- a/arch/powerpc/boot/dts/microwatt.dts
+++ b/arch/powerpc/boot/dts/microwatt.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /dts-v1/;
=20
 / {
diff --git a/arch/powerpc/boot/dts/mvme5100.dts b/arch/powerpc/boot/dts/mvm=
e5100.dts
index a7eb6d25903d..8cbf1b83bf8a 100644
--- a/arch/powerpc/boot/dts/mvme5100.dts
+++ b/arch/powerpc/boot/dts/mvme5100.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Device Tree Source for Motorola/Emerson MVME5100.
  *
diff --git a/arch/powerpc/boot/dts/obs600.dts b/arch/powerpc/boot/dts/obs60=
0.dts
index d10b0411809b..0119378ab670 100644
--- a/arch/powerpc/boot/dts/obs600.dts
+++ b/arch/powerpc/boot/dts/obs600.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Device Tree Source for PlatHome OpenBlockS 600 (405EX)
  *
diff --git a/arch/powerpc/boot/dts/rainier.dts b/arch/powerpc/boot/dts/rain=
ier.dts
index e59829cff556..d9de18967ae1 100644
--- a/arch/powerpc/boot/dts/rainier.dts
+++ b/arch/powerpc/boot/dts/rainier.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Device Tree Source for AMCC Rainier
  *
diff --git a/arch/powerpc/boot/dts/redwood.dts b/arch/powerpc/boot/dts/redw=
ood.dts
index f38035a1f4a1..6588ca1e9d5a 100644
--- a/arch/powerpc/boot/dts/redwood.dts
+++ b/arch/powerpc/boot/dts/redwood.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Device Tree Source for AMCC Redwood(460SX)
  *
diff --git a/arch/powerpc/boot/dts/sam440ep.dts b/arch/powerpc/boot/dts/sam=
440ep.dts
index 7d15f18e1180..019d35112d94 100644
--- a/arch/powerpc/boot/dts/sam440ep.dts
+++ b/arch/powerpc/boot/dts/sam440ep.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Device Tree Source for ACube Sam440ep  based off bamboo.dts code=20
  * original copyrights below=20
diff --git a/arch/powerpc/boot/dts/sequoia.dts b/arch/powerpc/boot/dts/sequ=
oia.dts
index 60d211da9593..02d7b62f0f96 100644
--- a/arch/powerpc/boot/dts/sequoia.dts
+++ b/arch/powerpc/boot/dts/sequoia.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Device Tree Source for AMCC Sequoia
  *
diff --git a/arch/powerpc/boot/dts/storcenter.dts b/arch/powerpc/boot/dts/s=
torcenter.dts
index 99f6f544dc5f..fb3e04b28774 100644
--- a/arch/powerpc/boot/dts/storcenter.dts
+++ b/arch/powerpc/boot/dts/storcenter.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Device Tree Source for IOMEGA StorCenter
  *
diff --git a/arch/powerpc/boot/dts/taishan.dts b/arch/powerpc/boot/dts/tais=
han.dts
index 803f1bff7fa8..b4a9db1a786c 100644
--- a/arch/powerpc/boot/dts/taishan.dts
+++ b/arch/powerpc/boot/dts/taishan.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Device Tree Source for IBM/AMCC Taishan
  *
diff --git a/arch/powerpc/boot/dts/warp.dts b/arch/powerpc/boot/dts/warp.dt=
s
index b4f32740870e..c729e0ae5ade 100644
--- a/arch/powerpc/boot/dts/warp.dts
+++ b/arch/powerpc/boot/dts/warp.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Device Tree Source for PIKA Warp
  *
diff --git a/arch/powerpc/boot/dts/yosemite.dts b/arch/powerpc/boot/dts/yos=
emite.dts
index 56508785ce13..05f0a6b70c23 100644
--- a/arch/powerpc/boot/dts/yosemite.dts
+++ b/arch/powerpc/boot/dts/yosemite.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Device Tree Source for AMCC Yosemite
  *
--=20
2.33.1
