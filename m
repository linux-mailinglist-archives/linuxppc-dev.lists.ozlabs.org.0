Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3E448E88F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jan 2022 11:50:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JZyl15DQNz3cSn
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jan 2022 21:50:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::601;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0601.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::601])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JZyjy6095z2yLy
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jan 2022 21:49:58 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lbi7wUTSbPERmJ/FvM+80tLIdBewrr4kVrZRNLR7LxA8VWT6R3Y7ah7MDZJdknU94Ifq78ER5ag0Cps9KjuWkloFZuA5NveBmU66WOUWStjUksq8sS1UDiTgvI7jmtMTrAUVJtKLoQyuciV1vOY8pXexFSUtywn8QrLbWs0TVu5o2h+kG6L0IYT9I6r0XILIuaAyRzqZe+jDc4YIbBbJFA90Me3Gv/fi0E0RfKbsq7s72RaZCLInRX2J2acKVADZeGuIwvGjUWhr4IGbra8aXhUnr5KNDX+iWqBqQp59HCAGu7V8PRcinx2b4IwSjTZRwHJ+jjMI6g9+JwXm/mllfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8mwLQfz+0pXu1faJYGWDyxIat/13/4yJt6UAl/zZujc=;
 b=mgylu3htuVIz9+gYn3H7fR3k3bowFhWc4YTsf8zWY5xzJNvHH9W59hIMWImcANQaoelUwTDb+Ajazcutc5AQBX4MHfzau+BaLR6IjEqmUwkhvL5KkKC9PoupRF7+aH7Lb8/dGyjqsaa1kl0CCti92FqDGvp83j82DiQ/7p9n6GPrB77PSbSZ/MDeThwnQRca21juUBE363loxoUlYi4d06D68udJb3ZfAuQFtZ+DB1Fc8fGYIau+9/ZkGhnWBp5qGv1NcUkyxxlQF0I4IpQJwUgjMcoTvbmYamYBDpiCIvfwxbGIoHeIhIg/YHdIE9RhpBojsfXA6HAriTDvn1J51g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB3497.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:14b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10; Fri, 14 Jan
 2022 10:49:48 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5%5]) with mapi id 15.20.4888.012; Fri, 14 Jan 2022
 10:49:48 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc: Add missing SPDX license identifiers to DTS files
Thread-Topic: [PATCH] powerpc: Add missing SPDX license identifiers to DTS
 files
Thread-Index: AQHYCTRyyZChMqE/SkmVE1KYI7ZtsQ==
Date: Fri, 14 Jan 2022 10:49:47 +0000
Message-ID: <f0be63051d7cd7515c3e3c5d1996ee4f388bdf79.1642157344.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 94581a96-7bae-4d50-ed6a-08d9d74b9588
x-ms-traffictypediagnostic: PR0P264MB3497:EE_
x-microsoft-antispam-prvs: <PR0P264MB3497E1036C49967EE03A7614ED549@PR0P264MB3497.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:2201;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rM3T8kdwcp1XFJ4wnkShbYb9elF+m+jCB/mBagY5tw2YrZOcKL3FdI0chI9OAHOAPNmSPlq4bINGvoyXtFtzB7h4F/rcteBzqddBtzBxWQLzcE4slkvVXOWKMgzoAa1yw7pamPT7B/wzEg6i4xHwSvcdXoVqTJ+sz+IhiIZg6ZsW4YlMZedGWQRVAifsuJBa1hssDSQz5LrqC7543p/wWsuQEOqlokTdUQ0U6NOmy2SIjIkPp5Lm5jxcsyFzOS5ZsE3HbLhsTxzbfCeB1RK/wkyboOl/ZXG3MQNC+F7ccs3aI/2vzJsPxBKMeJ7wjtjUYTaKffT42/N3RojLfLHHF/cyM8tJFSZmVKrrgHh6a1bbDsikMviLEybzUSYkoQ4cTPQJyNaUdiT7ou8QXzV3GLKx7h2hWhpWVZjA1+FjxQAKzcT8J+vyS4jxGe3iE0oeaR1UPog+ICba+J/+SRKbQFbwXGTYaMXfpSThgsiEsFx+rw1RjR5OLT+BRiwjAHhwWA9ZMdaOMcMGV9SAZfarxx2eioqnL4KKotJOW+MVBOVzRkoBJPeFFKm+GPLYU2kouelEP7dJ8stRLLLJrSazRuchLuZDbLXVZIfXicVLH2j9zuMAxkpOufmQoooaID0RIVw6+eN8N6jizQhTc4uAuJGQjuR/Hg4SdUxy1Tr0/Gq33d6jWxmXz+6npn6KBJ8YlQf5kdY2jTe4nnBywcEIRg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(316002)(44832011)(122000001)(30864003)(38070700005)(4326008)(2906002)(110136005)(54906003)(38100700002)(5660300002)(2616005)(508600001)(66476007)(66556008)(8676002)(64756008)(66446008)(6486002)(6506007)(186003)(26005)(36756003)(8936002)(71200400001)(6512007)(83380400001)(76116006)(91956017)(66946007)(579004)(559001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?IX1vPpwEurw0+O+sP+QyLsKPChSwIYvpJle4uuVM9042KgfwIMeLeVuSnd?=
 =?iso-8859-1?Q?DcpTM5tevSvxO0sk6gIAkmypfmfLXeKHSfwVFiQIYg0NvL7GmAYBVq9w3u?=
 =?iso-8859-1?Q?bswgULdm7iVjHTWpE8H3mTo2bwrQZcTpE2KuVpYL+1O/XuMWlFQVmp00Ph?=
 =?iso-8859-1?Q?mYXpvxDRJjBAHUxZwiH7AxmhsU+NGWhXRVTnINNf3gC+k4e7qRct3Yxuck?=
 =?iso-8859-1?Q?t7KTZJBlRVWct6X1ge42SnTkLjW4oIJWTqN6GmG1pUZeILnwytgL/8RwFL?=
 =?iso-8859-1?Q?CUcTafKvphuO990EbE84A5d8LkoWTIi+2cxgXMAq+q22m2o5bDLy2+n4cJ?=
 =?iso-8859-1?Q?00E2Lu22XMVdrK+PpJZq3dwXf/YaeEu32eLR2q7FhMgcwQ2mTaMI7ejL0/?=
 =?iso-8859-1?Q?HpUcm8zxLqYDKIbOirJZoSSOC1U4vBbDP/wigPtFvPJFWqPNnMiNiIFDVn?=
 =?iso-8859-1?Q?pCSmF4iHvE2MbzU5RjX0mIvRoo9NqZA7aEb+TsNkbwYTAMLcDYMl9ajprM?=
 =?iso-8859-1?Q?qrUqgnHRmvpbY4qcKW1p3GZiV8RKKS6VTRo5Rf5wW0k/mKC4ObVuDZ63Iq?=
 =?iso-8859-1?Q?a7to9mtASpGFhRwRF5UVwDWOeDStuuY++RG4TjlV9WpyNgot1KvctWmXnY?=
 =?iso-8859-1?Q?DnLb5iKMnLHik4ISxJIl+UfnKXChAxPDH0OOuhJ4YG4/0QWbW4rz41aju+?=
 =?iso-8859-1?Q?NijxEhun7m0Afhqg2BGXlsDOgmS6ZX4nRnVBTJdAP8F4KB+xxp/4zSP0Vh?=
 =?iso-8859-1?Q?+PdXwb5MDs49yDovTnCgCPwprl8lt7tBtuyg1i40+PzQMzLjBhl0/DRDDe?=
 =?iso-8859-1?Q?c2F46nDcNcLkbq8dDHME91lvEKDT+6P+qwQMp8bqDcWAWXf5xpoVYCGk/S?=
 =?iso-8859-1?Q?nQnN+CcK9GzTYFMyNTmUDu9BdF7VYpdvY89SxTRG/STqqOqjTN4oP2xWed?=
 =?iso-8859-1?Q?u856DA6REUWGAjZJPNs0ch6FSXo5H1W9ku0BhhVmA+8LswCr7cSdaThltd?=
 =?iso-8859-1?Q?3Owrr2LKGAkZwIpkbxgdJjZHSctPHNyE/AVwjAYJdwfQAc8RNyzZpc2/d6?=
 =?iso-8859-1?Q?kYRgGFDRFdVe5Sabccbie66V7NDVwyTuVZmgj75IXU2eQNVjj7LwNlQySt?=
 =?iso-8859-1?Q?GgppbsnIU9yZtkuyVz2FK83b9vc1AjZRJxojbPoWN3cwQSy5Oxe4TzJ0GP?=
 =?iso-8859-1?Q?JjJJnC9oaSBJyOxSSOzgp+z5h/XExycu2/S6jL4hFoyg4XDIsfy40tQw8I?=
 =?iso-8859-1?Q?a+VH+oCtsEWjYPBkeL0BvGn6/06xLMQT0ape2YIfSObH5VFMt7Z2XK8xQm?=
 =?iso-8859-1?Q?Qzhjq6Vr4KOD2DKieCx2fM/n9lyYhcbQ/Uy+lkmuxVfglcB5FGMoTaocef?=
 =?iso-8859-1?Q?l6UKJDkihXVVBNS3LCVE1TiwtMLJNVeA8Lulvb4hjGXSzwgSRMUFm3c8dx?=
 =?iso-8859-1?Q?/Nhd0h34uGXv+gVEGD6TZD2IpwHyi4Bt8Ox1eOcdXwg2ePXWiv6XL38R7Q?=
 =?iso-8859-1?Q?iHP+j4cSUCYJnXMoe59ZGBHcMCQ2Xc1qujuvlgVQN3SEsDksN0NnutLv2p?=
 =?iso-8859-1?Q?2DMToOHOOLNYXfmUCkLb9l+QcQwI40bWwTuZbM+H6CTLJAgs+hKIpusIoD?=
 =?iso-8859-1?Q?RaGSU3kW5YU9aBPxEG9wQd90wCo+NzI+UfM2I9tHPaVrCmoDKB/D5cFV60?=
 =?iso-8859-1?Q?NCkbPIImNnb08SJUMX2JHYIneJt4PMAu9vx3qnQ2hjQfPW+l4ZJnNkZuLa?=
 =?iso-8859-1?Q?EuLbUEO8S1reJ8J95xECd3n+4=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 94581a96-7bae-4d50-ed6a-08d9d74b9588
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2022 10:49:47.9527 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OsGukHccd99d4tjFDrcqAtRsV6mVrhKSRXjcqGrl4EnQBbkSMw2XGwRV6StoRhliUtHqvWpJFOiT+8Z68+YRd0TGZJPx5SFWkVA4eIjG0xw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB3497
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

Several DTS files are missing SPDX license identifiers.

Add to them the default kernel license identifier, ie GPL-2.0.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
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
index cd9203ceedc0..3f3c1a473870 100644
--- a/arch/powerpc/boot/dts/fsl/b4420qds.dts
+++ b/arch/powerpc/boot/dts/fsl/b4420qds.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * B4420DS Device Tree Source
  *
diff --git a/arch/powerpc/boot/dts/fsl/b4420si-post.dtsi b/arch/powerpc/boo=
t/dts/fsl/b4420si-post.dtsi
index f996cced45e0..cea1cda1fca8 100644
--- a/arch/powerpc/boot/dts/fsl/b4420si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/b4420si-post.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * B4420 Silicon/SoC Device Tree Source (post include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/b4420si-pre.dtsi b/arch/powerpc/boot=
/dts/fsl/b4420si-pre.dtsi
index bb7b9b9f3f5f..b7875a9bfa76 100644
--- a/arch/powerpc/boot/dts/fsl/b4420si-pre.dtsi
+++ b/arch/powerpc/boot/dts/fsl/b4420si-pre.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * B4420 Silicon/SoC Device Tree Source (pre include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/b4860qds.dts b/arch/powerpc/boot/dts=
/fsl/b4860qds.dts
index a8bc419959ca..14740741d536 100644
--- a/arch/powerpc/boot/dts/fsl/b4860qds.dts
+++ b/arch/powerpc/boot/dts/fsl/b4860qds.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * B4860DS Device Tree Source
  *
diff --git a/arch/powerpc/boot/dts/fsl/b4860si-post.dtsi b/arch/powerpc/boo=
t/dts/fsl/b4860si-post.dtsi
index 868719821106..038754ea721b 100644
--- a/arch/powerpc/boot/dts/fsl/b4860si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/b4860si-post.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * B4860 Silicon/SoC Device Tree Source (post include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/b4860si-pre.dtsi b/arch/powerpc/boot=
/dts/fsl/b4860si-pre.dtsi
index 388ba1b15f8c..f74fee37cba6 100644
--- a/arch/powerpc/boot/dts/fsl/b4860si-pre.dtsi
+++ b/arch/powerpc/boot/dts/fsl/b4860si-pre.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * B4860 Silicon/SoC Device Tree Source (pre include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/b4qds.dtsi b/arch/powerpc/boot/dts/f=
sl/b4qds.dtsi
index 05be919f3545..fe8ffd04e093 100644
--- a/arch/powerpc/boot/dts/fsl/b4qds.dtsi
+++ b/arch/powerpc/boot/dts/fsl/b4qds.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * B4420DS Device Tree Source
  *
diff --git a/arch/powerpc/boot/dts/fsl/b4si-post.dtsi b/arch/powerpc/boot/d=
ts/fsl/b4si-post.dtsi
index 4f044b41a776..0afbee588e11 100644
--- a/arch/powerpc/boot/dts/fsl/b4si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/b4si-post.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * B4420 Silicon/SoC Device Tree Source (post include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/bsc9131rdb.dtsi b/arch/powerpc/boot/=
dts/fsl/bsc9131rdb.dtsi
index 53f8b956340f..16a48d416a45 100644
--- a/arch/powerpc/boot/dts/fsl/bsc9131rdb.dtsi
+++ b/arch/powerpc/boot/dts/fsl/bsc9131rdb.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * BSC9131 RDB Device Tree Source stub (no addresses or top-level ranges)
  *
diff --git a/arch/powerpc/boot/dts/fsl/bsc9131si-post.dtsi b/arch/powerpc/b=
oot/dts/fsl/bsc9131si-post.dtsi
index 2a677fd323eb..bd52804eaccb 100644
--- a/arch/powerpc/boot/dts/fsl/bsc9131si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/bsc9131si-post.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * BSC9131 Silicon/SoC Device Tree Source (post include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/bsc9131si-pre.dtsi b/arch/powerpc/bo=
ot/dts/fsl/bsc9131si-pre.dtsi
index f6ec4a67560c..9d2cf1f88e58 100644
--- a/arch/powerpc/boot/dts/fsl/bsc9131si-pre.dtsi
+++ b/arch/powerpc/boot/dts/fsl/bsc9131si-pre.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * BSC9131 Silicon/SoC Device Tree Source (pre include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/bsc9132qds.dtsi b/arch/powerpc/boot/=
dts/fsl/bsc9132qds.dtsi
index fead484a8180..073728bbf4d0 100644
--- a/arch/powerpc/boot/dts/fsl/bsc9132qds.dtsi
+++ b/arch/powerpc/boot/dts/fsl/bsc9132qds.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * BSC9132 QDS Device Tree Source stub (no addresses or top-level ranges)
  *
diff --git a/arch/powerpc/boot/dts/fsl/bsc9132si-post.dtsi b/arch/powerpc/b=
oot/dts/fsl/bsc9132si-post.dtsi
index b8e0edd1ac69..66856de15e6a 100644
--- a/arch/powerpc/boot/dts/fsl/bsc9132si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/bsc9132si-post.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * BSC9132 Silicon/SoC Device Tree Source (post include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/bsc9132si-pre.dtsi b/arch/powerpc/bo=
ot/dts/fsl/bsc9132si-pre.dtsi
index 90f7949fe312..22020acaecfa 100644
--- a/arch/powerpc/boot/dts/fsl/bsc9132si-pre.dtsi
+++ b/arch/powerpc/boot/dts/fsl/bsc9132si-pre.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * BSC9132 Silicon/SoC Device Tree Source (pre include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/c293pcie.dts b/arch/powerpc/boot/dts=
/fsl/c293pcie.dts
index 5e905e0857cf..490a2a5ffc2b 100644
--- a/arch/powerpc/boot/dts/fsl/c293pcie.dts
+++ b/arch/powerpc/boot/dts/fsl/c293pcie.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * C293 PCIE Device Tree Source
  *
diff --git a/arch/powerpc/boot/dts/fsl/c293si-post.dtsi b/arch/powerpc/boot=
/dts/fsl/c293si-post.dtsi
index bec0fc36849d..f376539d75b6 100644
--- a/arch/powerpc/boot/dts/fsl/c293si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/c293si-post.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * C293 Silicon/SoC Device Tree Source (post include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/c293si-pre.dtsi b/arch/powerpc/boot/=
dts/fsl/c293si-pre.dtsi
index 065049d76245..2c65cf36f552 100644
--- a/arch/powerpc/boot/dts/fsl/c293si-pre.dtsi
+++ b/arch/powerpc/boot/dts/fsl/c293si-pre.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * C293 Silicon/SoC Device Tree Source (pre include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/e500mc_power_isa.dtsi b/arch/powerpc=
/boot/dts/fsl/e500mc_power_isa.dtsi
index ea145c91cfbd..9f61da5cfa21 100644
--- a/arch/powerpc/boot/dts/fsl/e500mc_power_isa.dtsi
+++ b/arch/powerpc/boot/dts/fsl/e500mc_power_isa.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * e500mc Power ISA Device Tree Source (include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/e500v2_power_isa.dtsi b/arch/powerpc=
/boot/dts/fsl/e500v2_power_isa.dtsi
index f4928144d2c8..44e586701abb 100644
--- a/arch/powerpc/boot/dts/fsl/e500v2_power_isa.dtsi
+++ b/arch/powerpc/boot/dts/fsl/e500v2_power_isa.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * e500v2 Power ISA Device Tree Source (include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/e5500_power_isa.dtsi b/arch/powerpc/=
boot/dts/fsl/e5500_power_isa.dtsi
index c254c981ae87..0f3417a9d42a 100644
--- a/arch/powerpc/boot/dts/fsl/e5500_power_isa.dtsi
+++ b/arch/powerpc/boot/dts/fsl/e5500_power_isa.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * e5500 Power ISA Device Tree Source (include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/e6500_power_isa.dtsi b/arch/powerpc/=
boot/dts/fsl/e6500_power_isa.dtsi
index a912dbeff359..ea0e20f28815 100644
--- a/arch/powerpc/boot/dts/fsl/e6500_power_isa.dtsi
+++ b/arch/powerpc/boot/dts/fsl/e6500_power_isa.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * e6500 Power ISA Device Tree Source (include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/elo3-dma-0.dtsi b/arch/powerpc/boot/=
dts/fsl/elo3-dma-0.dtsi
index 3c210e0d5201..2203e3bad68d 100644
--- a/arch/powerpc/boot/dts/fsl/elo3-dma-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/elo3-dma-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * QorIQ Elo3 DMA device tree stub [ controller @ offset 0x100000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/elo3-dma-1.dtsi b/arch/powerpc/boot/=
dts/fsl/elo3-dma-1.dtsi
index cccf3bb38224..1a68db032f5f 100644
--- a/arch/powerpc/boot/dts/fsl/elo3-dma-1.dtsi
+++ b/arch/powerpc/boot/dts/fsl/elo3-dma-1.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * QorIQ Elo3 DMA device tree stub [ controller @ offset 0x101000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/elo3-dma-2.dtsi b/arch/powerpc/boot/=
dts/fsl/elo3-dma-2.dtsi
index d3cc8d0f7c25..8caa4e3857c7 100644
--- a/arch/powerpc/boot/dts/fsl/elo3-dma-2.dtsi
+++ b/arch/powerpc/boot/dts/fsl/elo3-dma-2.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * QorIQ Elo3 DMA device tree stub [ controller @ offset 0x102300 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/interlaken-lac-portals.dtsi b/arch/p=
owerpc/boot/dts/fsl/interlaken-lac-portals.dtsi
index 9cffccf4e07e..4036daa59750 100644
--- a/arch/powerpc/boot/dts/fsl/interlaken-lac-portals.dtsi
+++ b/arch/powerpc/boot/dts/fsl/interlaken-lac-portals.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /* T4240 Interlaken LAC Portal device tree stub with 24 portals.
  *
  * Copyright 2012 Freescale Semiconductor Inc.
diff --git a/arch/powerpc/boot/dts/fsl/interlaken-lac.dtsi b/arch/powerpc/b=
oot/dts/fsl/interlaken-lac.dtsi
index e8208720ac0e..f1501488d163 100644
--- a/arch/powerpc/boot/dts/fsl/interlaken-lac.dtsi
+++ b/arch/powerpc/boot/dts/fsl/interlaken-lac.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * T4 Interlaken Look-aside Controller (LAC) device tree stub
  *
diff --git a/arch/powerpc/boot/dts/fsl/mpc8536ds.dtsi b/arch/powerpc/boot/d=
ts/fsl/mpc8536ds.dtsi
index a925fe49a73e..042677f91990 100644
--- a/arch/powerpc/boot/dts/fsl/mpc8536ds.dtsi
+++ b/arch/powerpc/boot/dts/fsl/mpc8536ds.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * MPC8536DS Device Tree Source stub (no addresses or top-level ranges)
  *
diff --git a/arch/powerpc/boot/dts/fsl/mpc8536si-post.dtsi b/arch/powerpc/b=
oot/dts/fsl/mpc8536si-post.dtsi
index 41935709ebe8..0404159fc3fb 100644
--- a/arch/powerpc/boot/dts/fsl/mpc8536si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/mpc8536si-post.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * MPC8536 Silicon/SoC Device Tree Source (post include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/mpc8536si-pre.dtsi b/arch/powerpc/bo=
ot/dts/fsl/mpc8536si-pre.dtsi
index 152906f98a0f..a74d7c8d2b64 100644
--- a/arch/powerpc/boot/dts/fsl/mpc8536si-pre.dtsi
+++ b/arch/powerpc/boot/dts/fsl/mpc8536si-pre.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * MPC8536 Silicon/SoC Device Tree Source (pre include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/mpc8544ds.dtsi b/arch/powerpc/boot/d=
ts/fsl/mpc8544ds.dtsi
index 47d986b041f6..3d918595240d 100644
--- a/arch/powerpc/boot/dts/fsl/mpc8544ds.dtsi
+++ b/arch/powerpc/boot/dts/fsl/mpc8544ds.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * MPC8544DS Device Tree Source stub (no addresses or top-level ranges)
  *
diff --git a/arch/powerpc/boot/dts/fsl/mpc8544si-post.dtsi b/arch/powerpc/b=
oot/dts/fsl/mpc8544si-post.dtsi
index b68eb119faef..dd78b38ddcdc 100644
--- a/arch/powerpc/boot/dts/fsl/mpc8544si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/mpc8544si-post.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * MPC8544 Silicon/SoC Device Tree Source (post include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/mpc8544si-pre.dtsi b/arch/powerpc/bo=
ot/dts/fsl/mpc8544si-pre.dtsi
index 5a69bafb652a..1981a72903bc 100644
--- a/arch/powerpc/boot/dts/fsl/mpc8544si-pre.dtsi
+++ b/arch/powerpc/boot/dts/fsl/mpc8544si-pre.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * MPC8544 Silicon/SoC Device Tree Source (pre include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/mpc8548cds.dtsi b/arch/powerpc/boot/=
dts/fsl/mpc8548cds.dtsi
index 3bc7d4711220..78005236559b 100644
--- a/arch/powerpc/boot/dts/fsl/mpc8548cds.dtsi
+++ b/arch/powerpc/boot/dts/fsl/mpc8548cds.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * MPC8548CDS Device Tree Source stub (no addresses or top-level ranges)
  *
diff --git a/arch/powerpc/boot/dts/fsl/mpc8548si-post.dtsi b/arch/powerpc/b=
oot/dts/fsl/mpc8548si-post.dtsi
index 579d76cb8e32..c416b9ef1dc8 100644
--- a/arch/powerpc/boot/dts/fsl/mpc8548si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/mpc8548si-post.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * MPC8548 Silicon/SoC Device Tree Source (post include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/mpc8548si-pre.dtsi b/arch/powerpc/bo=
ot/dts/fsl/mpc8548si-pre.dtsi
index fc1ce977422b..f1c1963061bf 100644
--- a/arch/powerpc/boot/dts/fsl/mpc8548si-pre.dtsi
+++ b/arch/powerpc/boot/dts/fsl/mpc8548si-pre.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * MPC8548 Silicon/SoC Device Tree Source (pre include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/mpc8568si-post.dtsi b/arch/powerpc/b=
oot/dts/fsl/mpc8568si-post.dtsi
index 64e7075a9cd4..379384155e7e 100644
--- a/arch/powerpc/boot/dts/fsl/mpc8568si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/mpc8568si-post.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * MPC8568 Silicon/SoC Device Tree Source (post include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/mpc8568si-pre.dtsi b/arch/powerpc/bo=
ot/dts/fsl/mpc8568si-pre.dtsi
index 122ca3bd0b03..913d27c3099e 100644
--- a/arch/powerpc/boot/dts/fsl/mpc8568si-pre.dtsi
+++ b/arch/powerpc/boot/dts/fsl/mpc8568si-pre.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * MPC8568 Silicon/SoC Device Tree Source (pre include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/mpc8569si-post.dtsi b/arch/powerpc/b=
oot/dts/fsl/mpc8569si-post.dtsi
index 3e6346a4a183..b71cff3cac3a 100644
--- a/arch/powerpc/boot/dts/fsl/mpc8569si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/mpc8569si-post.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * MPC8569 Silicon/SoC Device Tree Source (post include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/mpc8569si-pre.dtsi b/arch/powerpc/bo=
ot/dts/fsl/mpc8569si-pre.dtsi
index 2cd15a2a0422..8df9f1ef7e3c 100644
--- a/arch/powerpc/boot/dts/fsl/mpc8569si-pre.dtsi
+++ b/arch/powerpc/boot/dts/fsl/mpc8569si-pre.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * MPC8569 Silicon/SoC Device Tree Source (pre include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/mpc8572ds.dtsi b/arch/powerpc/boot/d=
ts/fsl/mpc8572ds.dtsi
index 357490bb84da..57fb76231125 100644
--- a/arch/powerpc/boot/dts/fsl/mpc8572ds.dtsi
+++ b/arch/powerpc/boot/dts/fsl/mpc8572ds.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * MPC8572DS Device Tree Source stub (no addresses or top-level ranges)
  *
diff --git a/arch/powerpc/boot/dts/fsl/mpc8572si-post.dtsi b/arch/powerpc/b=
oot/dts/fsl/mpc8572si-post.dtsi
index 49294cf36b4e..4a6e2d6ec2f2 100644
--- a/arch/powerpc/boot/dts/fsl/mpc8572si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/mpc8572si-post.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * MPC8572 Silicon/SoC Device Tree Source (post include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/mpc8572si-pre.dtsi b/arch/powerpc/bo=
ot/dts/fsl/mpc8572si-pre.dtsi
index 28c2a862be96..e2e71f8b8eac 100644
--- a/arch/powerpc/boot/dts/fsl/mpc8572si-pre.dtsi
+++ b/arch/powerpc/boot/dts/fsl/mpc8572si-pre.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * MPC8572 Silicon/SoC Device Tree Source (pre include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/oca4080.dts b/arch/powerpc/boot/dts/=
fsl/oca4080.dts
index 17bc6f391248..159ed656121e 100644
--- a/arch/powerpc/boot/dts/fsl/oca4080.dts
+++ b/arch/powerpc/boot/dts/fsl/oca4080.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * OCA4080 Device Tree Source
  *
diff --git a/arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtsi b/arch/powerpc/boot=
/dts/fsl/p1010rdb-pa.dtsi
index 434fb2d58575..13ac23673573 100644
--- a/arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * P1010 RDB Device Tree Source stub (no addresses or top-level ranges)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dts b/arch/powerpc/b=
oot/dts/fsl/p1010rdb-pa_36b.dts
index 03bd76ca8406..cb998a4ec54e 100644
--- a/arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dts
+++ b/arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * P1010 RDB Device Tree Source (36-bit address map)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dts b/arch/powerpc/b=
oot/dts/fsl/p1010rdb-pb_36b.dts
index 4cf255fedc96..1b0223708201 100644
--- a/arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dts
+++ b/arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * P1010 RDB Device Tree Source (36-bit address map)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p1010rdb.dtsi b/arch/powerpc/boot/dt=
s/fsl/p1010rdb.dtsi
index 2ca9cee2ddeb..fdaaaf7f059d 100644
--- a/arch/powerpc/boot/dts/fsl/p1010rdb.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p1010rdb.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * P1010 RDB Device Tree Source stub (no addresses or top-level ranges)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p1010rdb_32b.dtsi b/arch/powerpc/boo=
t/dts/fsl/p1010rdb_32b.dtsi
index fdc19aab2f70..627d4fa34a51 100644
--- a/arch/powerpc/boot/dts/fsl/p1010rdb_32b.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p1010rdb_32b.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * P1010 RDB Device Tree Source stub (no addresses or top-level ranges)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p1010rdb_36b.dtsi b/arch/powerpc/boo=
t/dts/fsl/p1010rdb_36b.dtsi
index de2fceed4f79..3ca33db99ec5 100644
--- a/arch/powerpc/boot/dts/fsl/p1010rdb_36b.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p1010rdb_36b.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * P1010 RDB Device Tree Source stub (no addresses or top-level ranges)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p1010si-post.dtsi b/arch/powerpc/boo=
t/dts/fsl/p1010si-post.dtsi
index ccda0a91abf0..698f3cfa56d7 100644
--- a/arch/powerpc/boot/dts/fsl/p1010si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p1010si-post.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * P1010/P1014 Silicon/SoC Device Tree Source (post include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p1010si-pre.dtsi b/arch/powerpc/boot=
/dts/fsl/p1010si-pre.dtsi
index 6e76f9b282a1..8d00f44d48ed 100644
--- a/arch/powerpc/boot/dts/fsl/p1010si-pre.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p1010si-pre.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * P1010/P1014 Silicon/SoC Device Tree Source (pre include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p1020mbg-pc.dtsi b/arch/powerpc/boot=
/dts/fsl/p1020mbg-pc.dtsi
index a24699cfea9c..b407d56dab5f 100644
--- a/arch/powerpc/boot/dts/fsl/p1020mbg-pc.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p1020mbg-pc.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * P1020 MBG-PC Device Tree Source stub (no addresses or top-level ranges)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dts b/arch/powerpc/b=
oot/dts/fsl/p1020mbg-pc_32b.dts
index b29d1fcb5e6b..ff1bfd59c08a 100644
--- a/arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dts
+++ b/arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * P1020 MBG-PC Device Tree Source (32-bit address map)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dts b/arch/powerpc/b=
oot/dts/fsl/p1020mbg-pc_36b.dts
index 678d0eec24e2..db7fe03308f5 100644
--- a/arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dts
+++ b/arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * P1020 MBG-PC Device Tree Source (36-bit address map)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p1020rdb-pc.dtsi b/arch/powerpc/boot=
/dts/fsl/p1020rdb-pc.dtsi
index a13876c05c1e..3303c0390b17 100644
--- a/arch/powerpc/boot/dts/fsl/p1020rdb-pc.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p1020rdb-pc.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * P1020 RDB-PC Device Tree Source stub (no addresses or top-level ranges)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dts b/arch/powerpc/b=
oot/dts/fsl/p1020rdb-pc_32b.dts
index 8175bf6f3e9c..f23a7b4d11c6 100644
--- a/arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dts
+++ b/arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * P1020 RDB-PC Device Tree Source (32-bit address map)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dts b/arch/powerpc/b=
oot/dts/fsl/p1020rdb-pc_36b.dts
index 01c305795163..d1f00d3ffd2b 100644
--- a/arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dts
+++ b/arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * P1020 RDB-PC Device Tree Source (36-bit address map)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p1020rdb-pd.dts b/arch/powerpc/boot/=
dts/fsl/p1020rdb-pd.dts
index f2dc6c09be52..d10daf47fcfa 100644
--- a/arch/powerpc/boot/dts/fsl/p1020rdb-pd.dts
+++ b/arch/powerpc/boot/dts/fsl/p1020rdb-pd.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * P1020 RDB-PD Device Tree Source (32-bit address map)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p1020rdb.dtsi b/arch/powerpc/boot/dt=
s/fsl/p1020rdb.dtsi
index 703142ee6627..ddb98ff961d1 100644
--- a/arch/powerpc/boot/dts/fsl/p1020rdb.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p1020rdb.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * P1020 RDB Device Tree Source stub (no addresses or top-level ranges)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p1020si-post.dtsi b/arch/powerpc/boo=
t/dts/fsl/p1020si-post.dtsi
index 642dc3a83d0e..d86e78ea8d74 100644
--- a/arch/powerpc/boot/dts/fsl/p1020si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p1020si-post.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * P1020/P1011 Silicon/SoC Device Tree Source (post include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p1020si-pre.dtsi b/arch/powerpc/boot=
/dts/fsl/p1020si-pre.dtsi
index fed9c4c8d962..4dd473387072 100644
--- a/arch/powerpc/boot/dts/fsl/p1020si-pre.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p1020si-pre.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * P1020/P1011 Silicon/SoC Device Tree Source (pre include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p1020utm-pc.dtsi b/arch/powerpc/boot=
/dts/fsl/p1020utm-pc.dtsi
index 7ea85eabcc5c..6747305b7b3b 100644
--- a/arch/powerpc/boot/dts/fsl/p1020utm-pc.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p1020utm-pc.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * P1020 UTM-PC Device Tree Source stub (no addresses or top-level ranges)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dts b/arch/powerpc/b=
oot/dts/fsl/p1020utm-pc_32b.dts
index bc03ef611f98..a26da1065bd3 100644
--- a/arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dts
+++ b/arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * P1020 UTM-PC Device Tree Source (32-bit address map)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dts b/arch/powerpc/b=
oot/dts/fsl/p1020utm-pc_36b.dts
index 32766f6a475e..240fe83373ef 100644
--- a/arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dts
+++ b/arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * P1020 UTM-PC Device Tree Source (36-bit address map)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p1021rdb-pc.dtsi b/arch/powerpc/boot=
/dts/fsl/p1021rdb-pc.dtsi
index 18f9b31602d0..fe95e9075ede 100644
--- a/arch/powerpc/boot/dts/fsl/p1021rdb-pc.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p1021rdb-pc.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * P1021 RDB Device Tree Source stub (no addresses or top-level ranges)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dts b/arch/powerpc/b=
oot/dts/fsl/p1021rdb-pc_32b.dts
index d2b4710357ac..7ba0588987ba 100644
--- a/arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dts
+++ b/arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * P1021 RDB Device Tree Source
  *
diff --git a/arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dts b/arch/powerpc/b=
oot/dts/fsl/p1021rdb-pc_36b.dts
index e298c29e5606..2d207b17fc6d 100644
--- a/arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dts
+++ b/arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * P1021 RDB Device Tree Source (36-bit address map)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p1021si-post.dtsi b/arch/powerpc/boo=
t/dts/fsl/p1021si-post.dtsi
index 407cb5fd0f5b..1912256d9d8d 100644
--- a/arch/powerpc/boot/dts/fsl/p1021si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p1021si-post.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * P1021/P1012 Silicon/SoC Device Tree Source (post include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p1021si-pre.dtsi b/arch/powerpc/boot=
/dts/fsl/p1021si-pre.dtsi
index 36161b500176..6a649de648ee 100644
--- a/arch/powerpc/boot/dts/fsl/p1021si-pre.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p1021si-pre.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * P1021/P1012 Silicon/SoC Device Tree Source (pre include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p1022ds.dtsi b/arch/powerpc/boot/dts=
/fsl/p1022ds.dtsi
index ddefbf64f7f8..620817fbb2ad 100644
--- a/arch/powerpc/boot/dts/fsl/p1022ds.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p1022ds.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * P1022 DS Device Tree Source stub (no addresses or top-level ranges)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p1022ds_32b.dts b/arch/powerpc/boot/=
dts/fsl/p1022ds_32b.dts
index 5a7eaceb9e8e..cf2164b8c3a9 100644
--- a/arch/powerpc/boot/dts/fsl/p1022ds_32b.dts
+++ b/arch/powerpc/boot/dts/fsl/p1022ds_32b.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * P1022 DS 32-bit Physical Address Map Device Tree Source
  *
diff --git a/arch/powerpc/boot/dts/fsl/p1022ds_36b.dts b/arch/powerpc/boot/=
dts/fsl/p1022ds_36b.dts
index 88063cd9e20a..92f264f02123 100644
--- a/arch/powerpc/boot/dts/fsl/p1022ds_36b.dts
+++ b/arch/powerpc/boot/dts/fsl/p1022ds_36b.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * P1022 DS 36-bit Physical Address Map Device Tree Source
  *
diff --git a/arch/powerpc/boot/dts/fsl/p1022rdk.dts b/arch/powerpc/boot/dts=
/fsl/p1022rdk.dts
index 29e8af1e3711..964670d45204 100644
--- a/arch/powerpc/boot/dts/fsl/p1022rdk.dts
+++ b/arch/powerpc/boot/dts/fsl/p1022rdk.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * P1022 RDK 32-bit Physical Address Map Device Tree Source
  *
diff --git a/arch/powerpc/boot/dts/fsl/p1022si-post.dtsi b/arch/powerpc/boo=
t/dts/fsl/p1022si-post.dtsi
index 5f51b7bfc064..83659cde0a13 100644
--- a/arch/powerpc/boot/dts/fsl/p1022si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p1022si-post.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * P1022/P1013 Silicon/SoC Device Tree Source (post include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p1022si-pre.dtsi b/arch/powerpc/boot=
/dts/fsl/p1022si-pre.dtsi
index de76ae8992c6..5c77f25630fb 100644
--- a/arch/powerpc/boot/dts/fsl/p1022si-pre.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p1022si-pre.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * P1022/P1013 Silicon/SoC Device Tree Source (pre include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p1023rdb.dts b/arch/powerpc/boot/dts=
/fsl/p1023rdb.dts
index ead928364beb..4957a2bc0d06 100644
--- a/arch/powerpc/boot/dts/fsl/p1023rdb.dts
+++ b/arch/powerpc/boot/dts/fsl/p1023rdb.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * P1023 RDB Device Tree Source
  *
diff --git a/arch/powerpc/boot/dts/fsl/p1023si-post.dtsi b/arch/powerpc/boo=
t/dts/fsl/p1023si-post.dtsi
index da6d3fc6ba41..68ee594a692e 100644
--- a/arch/powerpc/boot/dts/fsl/p1023si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p1023si-post.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * P1023/P1017 Silicon/SoC Device Tree Source (post include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p1023si-pre.dtsi b/arch/powerpc/boot=
/dts/fsl/p1023si-pre.dtsi
index 132a1521921a..064477a6e960 100644
--- a/arch/powerpc/boot/dts/fsl/p1023si-pre.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p1023si-pre.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * P1023/P1017 Silicon/SoC Device Tree Source (pre include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p1024rdb.dtsi b/arch/powerpc/boot/dt=
s/fsl/p1024rdb.dtsi
index b4d05867f707..2147273945e6 100644
--- a/arch/powerpc/boot/dts/fsl/p1024rdb.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p1024rdb.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * P1024 RDB Device Tree Source stub (no addresses or top-level ranges)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p1024rdb_32b.dts b/arch/powerpc/boot=
/dts/fsl/p1024rdb_32b.dts
index 8b09b9d56ad1..362e2c249959 100644
--- a/arch/powerpc/boot/dts/fsl/p1024rdb_32b.dts
+++ b/arch/powerpc/boot/dts/fsl/p1024rdb_32b.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * P1024 RDB 32Bit Physical Address Map Device Tree Source
  *
diff --git a/arch/powerpc/boot/dts/fsl/p1024rdb_36b.dts b/arch/powerpc/boot=
/dts/fsl/p1024rdb_36b.dts
index e7093aef28f1..3ff6d949ec3a 100644
--- a/arch/powerpc/boot/dts/fsl/p1024rdb_36b.dts
+++ b/arch/powerpc/boot/dts/fsl/p1024rdb_36b.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * P1024 RDB 36Bit Physical Address Map Device Tree Source
  *
diff --git a/arch/powerpc/boot/dts/fsl/p1025rdb.dtsi b/arch/powerpc/boot/dt=
s/fsl/p1025rdb.dtsi
index 0a5434a631c3..c8a86c19ae75 100644
--- a/arch/powerpc/boot/dts/fsl/p1025rdb.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p1025rdb.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * P1025 RDB Device Tree Source stub (no addresses or top-level ranges)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p1025rdb_32b.dts b/arch/powerpc/boot=
/dts/fsl/p1025rdb_32b.dts
index ea33b57f8774..6edefe7d92fe 100644
--- a/arch/powerpc/boot/dts/fsl/p1025rdb_32b.dts
+++ b/arch/powerpc/boot/dts/fsl/p1025rdb_32b.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * P1025 RDB Device Tree Source (32-bit address map)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p1025rdb_36b.dts b/arch/powerpc/boot=
/dts/fsl/p1025rdb_36b.dts
index b0ded5e8bd0b..a4a3428f4f59 100644
--- a/arch/powerpc/boot/dts/fsl/p1025rdb_36b.dts
+++ b/arch/powerpc/boot/dts/fsl/p1025rdb_36b.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * P1025 RDB Device Tree Source (36-bit address map)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p1025twr.dts b/arch/powerpc/boot/dts=
/fsl/p1025twr.dts
index 9b8863b74b60..260ac1821dcd 100644
--- a/arch/powerpc/boot/dts/fsl/p1025twr.dts
+++ b/arch/powerpc/boot/dts/fsl/p1025twr.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * P1025 TWR Device Tree Source (32-bit address map)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p1025twr.dtsi b/arch/powerpc/boot/dt=
s/fsl/p1025twr.dtsi
index ab75b8f29ae2..45248be5d3bc 100644
--- a/arch/powerpc/boot/dts/fsl/p1025twr.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p1025twr.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * P1025 TWR Device Tree Source stub (no addresses or top-level ranges)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p2020ds.dtsi b/arch/powerpc/boot/dts=
/fsl/p2020ds.dtsi
index e699cf95b063..f25047a4290e 100644
--- a/arch/powerpc/boot/dts/fsl/p2020ds.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p2020ds.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * P2020DS Device Tree Source stub (no addresses or top-level ranges)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p2020rdb-pc.dtsi b/arch/powerpc/boot=
/dts/fsl/p2020rdb-pc.dtsi
index 03c9afc82436..ddc0f2acc36e 100644
--- a/arch/powerpc/boot/dts/fsl/p2020rdb-pc.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p2020rdb-pc.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * P2020 RDB-PC Device Tree Source stub (no addresses or top-level ranges)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dts b/arch/powerpc/b=
oot/dts/fsl/p2020rdb-pc_32b.dts
index d3295c204bbf..f1b18870a4a4 100644
--- a/arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dts
+++ b/arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * P2020 RDB-PC 32Bit Physical Address Map Device Tree Source
  *
diff --git a/arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dts b/arch/powerpc/b=
oot/dts/fsl/p2020rdb-pc_36b.dts
index 9307a8f41ddb..2a09bdefdcef 100644
--- a/arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dts
+++ b/arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * P2020 RDB-PC 36Bit Physical Address Map Device Tree Source
  *
diff --git a/arch/powerpc/boot/dts/fsl/p2020si-post.dtsi b/arch/powerpc/boo=
t/dts/fsl/p2020si-post.dtsi
index 884e01bcb243..ae4ae0cf1744 100644
--- a/arch/powerpc/boot/dts/fsl/p2020si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p2020si-post.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * P2020/P2010 Silicon/SoC Device Tree Source (post include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p2020si-pre.dtsi b/arch/powerpc/boot=
/dts/fsl/p2020si-pre.dtsi
index 42bf3c6d25ca..78cc7f5ee516 100644
--- a/arch/powerpc/boot/dts/fsl/p2020si-pre.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p2020si-pre.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * P2020/P2010 Silicon/SoC Device Tree Source (pre include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p2041rdb.dts b/arch/powerpc/boot/dts=
/fsl/p2041rdb.dts
index 950816b9d6e1..bdb39c984d20 100644
--- a/arch/powerpc/boot/dts/fsl/p2041rdb.dts
+++ b/arch/powerpc/boot/dts/fsl/p2041rdb.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * P2041RDB Device Tree Source
  *
diff --git a/arch/powerpc/boot/dts/fsl/p2041si-post.dtsi b/arch/powerpc/boo=
t/dts/fsl/p2041si-post.dtsi
index ddc018d42252..e40a5335d830 100644
--- a/arch/powerpc/boot/dts/fsl/p2041si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p2041si-post.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * P2041/P2040 Silicon/SoC Device Tree Source (post include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p2041si-pre.dtsi b/arch/powerpc/boot=
/dts/fsl/p2041si-pre.dtsi
index 6318962e8d14..810ea872c8de 100644
--- a/arch/powerpc/boot/dts/fsl/p2041si-pre.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p2041si-pre.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * P2041 Silicon/SoC Device Tree Source (pre include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p3041ds.dts b/arch/powerpc/boot/dts/=
fsl/p3041ds.dts
index 6f5f7283c533..f8fd2036eb76 100644
--- a/arch/powerpc/boot/dts/fsl/p3041ds.dts
+++ b/arch/powerpc/boot/dts/fsl/p3041ds.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * P3041DS Device Tree Source
  *
diff --git a/arch/powerpc/boot/dts/fsl/p3041si-post.dtsi b/arch/powerpc/boo=
t/dts/fsl/p3041si-post.dtsi
index 81bc75aca2e0..2bf67ef08ebb 100644
--- a/arch/powerpc/boot/dts/fsl/p3041si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p3041si-post.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * P3041 Silicon/SoC Device Tree Source (post include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p3041si-pre.dtsi b/arch/powerpc/boot=
/dts/fsl/p3041si-pre.dtsi
index db92f1151a48..579e5eca6b15 100644
--- a/arch/powerpc/boot/dts/fsl/p3041si-pre.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p3041si-pre.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * P3041 Silicon/SoC Device Tree Source (pre include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p4080ds.dts b/arch/powerpc/boot/dts/=
fsl/p4080ds.dts
index 969b32c4f2d5..a21480f37a6d 100644
--- a/arch/powerpc/boot/dts/fsl/p4080ds.dts
+++ b/arch/powerpc/boot/dts/fsl/p4080ds.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * P4080DS Device Tree Source
  *
diff --git a/arch/powerpc/boot/dts/fsl/p4080si-post.dtsi b/arch/powerpc/boo=
t/dts/fsl/p4080si-post.dtsi
index 4da49b6dd3f5..3e6633c42c55 100644
--- a/arch/powerpc/boot/dts/fsl/p4080si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p4080si-post.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * P4080/P4040 Silicon/SoC Device Tree Source (post include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p4080si-pre.dtsi b/arch/powerpc/boot=
/dts/fsl/p4080si-pre.dtsi
index 0a7c65a00e5e..7ff4e7752ca8 100644
--- a/arch/powerpc/boot/dts/fsl/p4080si-pre.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p4080si-pre.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * P4080/P4040 Silicon/SoC Device Tree Source (pre include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p5020ds.dts b/arch/powerpc/boot/dts/=
fsl/p5020ds.dts
index b24adf902d8d..493a2490d2bf 100644
--- a/arch/powerpc/boot/dts/fsl/p5020ds.dts
+++ b/arch/powerpc/boot/dts/fsl/p5020ds.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * P5020DS Device Tree Source
  *
diff --git a/arch/powerpc/boot/dts/fsl/p5020si-post.dtsi b/arch/powerpc/boo=
t/dts/fsl/p5020si-post.dtsi
index cd008cdd2889..e358a0c61324 100644
--- a/arch/powerpc/boot/dts/fsl/p5020si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p5020si-post.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * P5020/5010 Silicon/SoC Device Tree Source (post include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p5020si-pre.dtsi b/arch/powerpc/boot=
/dts/fsl/p5020si-pre.dtsi
index 2d74ea85e5df..f7524a9190be 100644
--- a/arch/powerpc/boot/dts/fsl/p5020si-pre.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p5020si-pre.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * P5020/P5010 Silicon/SoC Device Tree Source (pre include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p5040ds.dts b/arch/powerpc/boot/dts/=
fsl/p5040ds.dts
index 30850b3228e0..ecdb2e208774 100644
--- a/arch/powerpc/boot/dts/fsl/p5040ds.dts
+++ b/arch/powerpc/boot/dts/fsl/p5040ds.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * P5040DS Device Tree Source
  *
diff --git a/arch/powerpc/boot/dts/fsl/p5040si-post.dtsi b/arch/powerpc/boo=
t/dts/fsl/p5040si-post.dtsi
index 16b454b504e2..742d31d06f40 100644
--- a/arch/powerpc/boot/dts/fsl/p5040si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p5040si-post.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * P5040 Silicon/SoC Device Tree Source (post include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/p5040si-pre.dtsi b/arch/powerpc/boot=
/dts/fsl/p5040si-pre.dtsi
index ed89dbbdacf0..ef5a5c7bad3b 100644
--- a/arch/powerpc/boot/dts/fsl/p5040si-pre.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p5040si-pre.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * P5040 Silicon/SoC Device Tree Source (pre include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/pq3-dma-0.dtsi b/arch/powerpc/boot/d=
ts/fsl/pq3-dma-0.dtsi
index b5b37ad30e75..c3e559e0d1cb 100644
--- a/arch/powerpc/boot/dts/fsl/pq3-dma-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/pq3-dma-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * PQ3 DMA device tree stub [ controller @ offset 0x21000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/pq3-dma-1.dtsi b/arch/powerpc/boot/d=
ts/fsl/pq3-dma-1.dtsi
index 28cb8a55d807..fab464a61928 100644
--- a/arch/powerpc/boot/dts/fsl/pq3-dma-1.dtsi
+++ b/arch/powerpc/boot/dts/fsl/pq3-dma-1.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * PQ3 DMA device tree stub [ controller @ offset 0xc300 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/pq3-duart-0.dtsi b/arch/powerpc/boot=
/dts/fsl/pq3-duart-0.dtsi
index 5e268fdb9d1f..dab33fa7e2ba 100644
--- a/arch/powerpc/boot/dts/fsl/pq3-duart-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/pq3-duart-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * PQ3 DUART device tree stub [ controller @ offset 0x4000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/pq3-esdhc-0.dtsi b/arch/powerpc/boot=
/dts/fsl/pq3-esdhc-0.dtsi
index 5743433e278e..8d688967fb6d 100644
--- a/arch/powerpc/boot/dts/fsl/pq3-esdhc-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/pq3-esdhc-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * PQ3 eSDHC device tree stub [ controller @ offset 0x2e000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/pq3-espi-0.dtsi b/arch/powerpc/boot/=
dts/fsl/pq3-espi-0.dtsi
index 75854b2e0391..5d4ef3d01661 100644
--- a/arch/powerpc/boot/dts/fsl/pq3-espi-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/pq3-espi-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * PQ3 eSPI device tree stub [ controller @ offset 0x7000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/pq3-etsec1-0.dtsi b/arch/powerpc/boo=
t/dts/fsl/pq3-etsec1-0.dtsi
index 3b0650a98478..20789d1c50b1 100644
--- a/arch/powerpc/boot/dts/fsl/pq3-etsec1-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/pq3-etsec1-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * PQ3 eTSEC device tree stub [ @ offsets 0x24000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/pq3-etsec1-1.dtsi b/arch/powerpc/boo=
t/dts/fsl/pq3-etsec1-1.dtsi
index 96693b41f0f1..3e6390831a48 100644
--- a/arch/powerpc/boot/dts/fsl/pq3-etsec1-1.dtsi
+++ b/arch/powerpc/boot/dts/fsl/pq3-etsec1-1.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * PQ3 eTSEC device tree stub [ @ offsets 0x25000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/pq3-etsec1-2.dtsi b/arch/powerpc/boo=
t/dts/fsl/pq3-etsec1-2.dtsi
index 6b3fab19da1f..8878db624174 100644
--- a/arch/powerpc/boot/dts/fsl/pq3-etsec1-2.dtsi
+++ b/arch/powerpc/boot/dts/fsl/pq3-etsec1-2.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * PQ3 eTSEC device tree stub [ @ offsets 0x26000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/pq3-etsec1-3.dtsi b/arch/powerpc/boo=
t/dts/fsl/pq3-etsec1-3.dtsi
index 0da592d93ddd..6d2062bff215 100644
--- a/arch/powerpc/boot/dts/fsl/pq3-etsec1-3.dtsi
+++ b/arch/powerpc/boot/dts/fsl/pq3-etsec1-3.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * PQ3 eTSEC device tree stub [ @ offsets 0x27000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/pq3-etsec1-timer-0.dtsi b/arch/power=
pc/boot/dts/fsl/pq3-etsec1-timer-0.dtsi
index efe2ca04bce8..cbeca0dbc97d 100644
--- a/arch/powerpc/boot/dts/fsl/pq3-etsec1-timer-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/pq3-etsec1-timer-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * PQ3 eTSEC Timer (IEEE 1588) device tree stub [ @ offsets 0x24e00 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/pq3-etsec2-0.dtsi b/arch/powerpc/boo=
t/dts/fsl/pq3-etsec2-0.dtsi
index 7fcb1ac0f232..b006be0660ad 100644
--- a/arch/powerpc/boot/dts/fsl/pq3-etsec2-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/pq3-etsec2-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * PQ3 eTSEC2 device tree stub [ @ offsets 0x24000/0xb0000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/pq3-etsec2-1.dtsi b/arch/powerpc/boo=
t/dts/fsl/pq3-etsec2-1.dtsi
index 9f25427c1527..7ef3fbc41ea7 100644
--- a/arch/powerpc/boot/dts/fsl/pq3-etsec2-1.dtsi
+++ b/arch/powerpc/boot/dts/fsl/pq3-etsec2-1.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * PQ3 eTSEC2 device tree stub [ @ offsets 0x25000/0xb1000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/pq3-etsec2-2.dtsi b/arch/powerpc/boo=
t/dts/fsl/pq3-etsec2-2.dtsi
index cd7c318ab131..6123f370cf46 100644
--- a/arch/powerpc/boot/dts/fsl/pq3-etsec2-2.dtsi
+++ b/arch/powerpc/boot/dts/fsl/pq3-etsec2-2.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * PQ3 eTSEC2 device tree stub [ @ offsets 0x26000/0xb2000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/pq3-etsec2-grp2-0.dtsi b/arch/powerp=
c/boot/dts/fsl/pq3-etsec2-grp2-0.dtsi
index 034ab8fac22f..d32eca7737d8 100644
--- a/arch/powerpc/boot/dts/fsl/pq3-etsec2-grp2-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/pq3-etsec2-grp2-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * PQ3 eTSEC2 Group 2 device tree stub [ @ offsets 0xb4000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/pq3-etsec2-grp2-1.dtsi b/arch/powerp=
c/boot/dts/fsl/pq3-etsec2-grp2-1.dtsi
index 3be9ba3b374e..ab61bda3e80c 100644
--- a/arch/powerpc/boot/dts/fsl/pq3-etsec2-grp2-1.dtsi
+++ b/arch/powerpc/boot/dts/fsl/pq3-etsec2-grp2-1.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * PQ3 eTSEC2 Group 2 device tree stub [ @ offsets 0xb5000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/pq3-etsec2-grp2-2.dtsi b/arch/powerp=
c/boot/dts/fsl/pq3-etsec2-grp2-2.dtsi
index 02a33457048c..dd6976472fe4 100644
--- a/arch/powerpc/boot/dts/fsl/pq3-etsec2-grp2-2.dtsi
+++ b/arch/powerpc/boot/dts/fsl/pq3-etsec2-grp2-2.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * PQ3 eTSEC2 Group 2 device tree stub [ @ offsets 0xb6000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/pq3-gpio-0.dtsi b/arch/powerpc/boot/=
dts/fsl/pq3-gpio-0.dtsi
index a1b48546b02d..93cd7dc63a16 100644
--- a/arch/powerpc/boot/dts/fsl/pq3-gpio-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/pq3-gpio-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * PQ3 GPIO device tree stub [ controller @ offset 0xfc00 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/pq3-i2c-0.dtsi b/arch/powerpc/boot/d=
ts/fsl/pq3-i2c-0.dtsi
index d1dd6fb82a78..0f307cb69407 100644
--- a/arch/powerpc/boot/dts/fsl/pq3-i2c-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/pq3-i2c-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * PQ3 I2C device tree stub [ controller @ offset 0x3000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/pq3-i2c-1.dtsi b/arch/powerpc/boot/d=
ts/fsl/pq3-i2c-1.dtsi
index a9bd803e2090..79b2471f143a 100644
--- a/arch/powerpc/boot/dts/fsl/pq3-i2c-1.dtsi
+++ b/arch/powerpc/boot/dts/fsl/pq3-i2c-1.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * PQ3 I2C device tree stub [ controller @ offset 0x3100 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/pq3-mpic-message-B.dtsi b/arch/power=
pc/boot/dts/fsl/pq3-mpic-message-B.dtsi
index 1cf0b77b1efe..6c151a215d12 100644
--- a/arch/powerpc/boot/dts/fsl/pq3-mpic-message-B.dtsi
+++ b/arch/powerpc/boot/dts/fsl/pq3-mpic-message-B.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * PQ3 MPIC Message (Group B) device tree stub [ controller @ offset 0x424=
00 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/pq3-mpic-timer-B.dtsi b/arch/powerpc=
/boot/dts/fsl/pq3-mpic-timer-B.dtsi
index 8734cffae1a1..a18e7f0d29e2 100644
--- a/arch/powerpc/boot/dts/fsl/pq3-mpic-timer-B.dtsi
+++ b/arch/powerpc/boot/dts/fsl/pq3-mpic-timer-B.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * PQ3 MPIC Timer (Group B) device tree stub [ controller @ offset 0x42100=
 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/pq3-mpic.dtsi b/arch/powerpc/boot/dt=
s/fsl/pq3-mpic.dtsi
index 71c30eb10056..457089cbe5aa 100644
--- a/arch/powerpc/boot/dts/fsl/pq3-mpic.dtsi
+++ b/arch/powerpc/boot/dts/fsl/pq3-mpic.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * PQ3 MPIC device tree stub [ controller @ offset 0x40000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/pq3-rmu-0.dtsi b/arch/powerpc/boot/d=
ts/fsl/pq3-rmu-0.dtsi
index 587ca9ffad7d..0d9708b43ba4 100644
--- a/arch/powerpc/boot/dts/fsl/pq3-rmu-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/pq3-rmu-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * PQ3 RIO Message Unit device tree stub [ controller @ offset 0xd3000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/pq3-sata2-0.dtsi b/arch/powerpc/boot=
/dts/fsl/pq3-sata2-0.dtsi
index 3c28dd08d38b..ca3caef2ea22 100644
--- a/arch/powerpc/boot/dts/fsl/pq3-sata2-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/pq3-sata2-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * PQ3 SATAv2 device tree stub [ controller @ offset 0x18000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/pq3-sata2-1.dtsi b/arch/powerpc/boot=
/dts/fsl/pq3-sata2-1.dtsi
index eefaf2855e3b..3d8d1128ff2f 100644
--- a/arch/powerpc/boot/dts/fsl/pq3-sata2-1.dtsi
+++ b/arch/powerpc/boot/dts/fsl/pq3-sata2-1.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * PQ3 SATAv2 device tree stub [ controller @ offset 0x19000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/pq3-sec2.1-0.dtsi b/arch/powerpc/boo=
t/dts/fsl/pq3-sec2.1-0.dtsi
index 02a5c7ae72d0..391393afdab6 100644
--- a/arch/powerpc/boot/dts/fsl/pq3-sec2.1-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/pq3-sec2.1-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * PQ3 Sec/Crypto 2.1 device tree stub [ controller @ offset 0x30000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/pq3-sec3.0-0.dtsi b/arch/powerpc/boo=
t/dts/fsl/pq3-sec3.0-0.dtsi
index bba1ba44ccf0..0368b7e4da8e 100644
--- a/arch/powerpc/boot/dts/fsl/pq3-sec3.0-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/pq3-sec3.0-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * PQ3 Sec/Crypto 3.0 device tree stub [ controller @ offset 0x30000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/pq3-sec3.1-0.dtsi b/arch/powerpc/boo=
t/dts/fsl/pq3-sec3.1-0.dtsi
index 8f0a5669bee5..42cca936ba14 100644
--- a/arch/powerpc/boot/dts/fsl/pq3-sec3.1-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/pq3-sec3.1-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * PQ3 Sec/Crypto 3.1 device tree stub [ controller @ offset 0x30000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/pq3-sec3.3-0.dtsi b/arch/powerpc/boo=
t/dts/fsl/pq3-sec3.3-0.dtsi
index c227f2748a24..6374712a2631 100644
--- a/arch/powerpc/boot/dts/fsl/pq3-sec3.3-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/pq3-sec3.3-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * PQ3 Sec/Crypto 3.3 device tree stub [ controller @ offset 0x30000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/pq3-sec4.4-0.dtsi b/arch/powerpc/boo=
t/dts/fsl/pq3-sec4.4-0.dtsi
index bb3d8266b5ce..f19aac7f9b34 100644
--- a/arch/powerpc/boot/dts/fsl/pq3-sec4.4-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/pq3-sec4.4-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * PQ3 Sec/Crypto 4.4 device tree stub [ controller @ offset 0x30000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/pq3-usb2-dr-0.dtsi b/arch/powerpc/bo=
ot/dts/fsl/pq3-usb2-dr-0.dtsi
index 185ab9dc3ecd..59d435e7df1c 100644
--- a/arch/powerpc/boot/dts/fsl/pq3-usb2-dr-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/pq3-usb2-dr-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * PQ3 USB DR device tree stub [ controller @ offset 0x22000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/pq3-usb2-dr-1.dtsi b/arch/powerpc/bo=
ot/dts/fsl/pq3-usb2-dr-1.dtsi
index fe24cd612fff..2c45c3849726 100644
--- a/arch/powerpc/boot/dts/fsl/pq3-usb2-dr-1.dtsi
+++ b/arch/powerpc/boot/dts/fsl/pq3-usb2-dr-1.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * PQ3 USB DR device tree stub [ controller @ offset 0x23000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qonverge-usb2-dr-0.dtsi b/arch/power=
pc/boot/dts/fsl/qonverge-usb2-dr-0.dtsi
index fcc7e5b7fd47..960e29f41761 100644
--- a/arch/powerpc/boot/dts/fsl/qonverge-usb2-dr-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qonverge-usb2-dr-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * QorIQ Qonverge USB Host device tree stub [ controller @ offset 0x210000=
 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-bman1-portals.dtsi b/arch/powe=
rpc/boot/dts/fsl/qoriq-bman1-portals.dtsi
index 5022432ebaa9..1beb701e1994 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-bman1-portals.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-bman1-portals.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * QorIQ BMan Portal device tree stub for 10 portals
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-bman1.dtsi b/arch/powerpc/boot=
/dts/fsl/qoriq-bman1.dtsi
index 3b5e3504acb7..848ebe59cea0 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-bman1.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-bman1.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * QorIQ BMan device tree stub [ controller @ offset 0x31a000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-clockgen1.dtsi b/arch/powerpc/=
boot/dts/fsl/qoriq-clockgen1.dtsi
index 463c1ed9ffdd..05d38714252b 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-clockgen1.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-clockgen1.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * QorIQ clock control device tree stub [ controller @ offset 0xe1000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-clockgen2.dtsi b/arch/powerpc/=
boot/dts/fsl/qoriq-clockgen2.dtsi
index 0361050bb56a..ebdd84ce806b 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-clockgen2.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-clockgen2.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * QorIQ clock control device tree stub [ controller @ offset 0xe1000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-dma-0.dtsi b/arch/powerpc/boot=
/dts/fsl/qoriq-dma-0.dtsi
index 1aebf3ea4ca5..91761665e298 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-dma-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-dma-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * QorIQ DMA device tree stub [ controller @ offset 0x100000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-dma-1.dtsi b/arch/powerpc/boot=
/dts/fsl/qoriq-dma-1.dtsi
index ecf5e180fe79..5509a5a8427e 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-dma-1.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-dma-1.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * QorIQ DMA device tree stub [ controller @ offset 0x101000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-duart-0.dtsi b/arch/powerpc/bo=
ot/dts/fsl/qoriq-duart-0.dtsi
index 225c07b4e8ab..f6517e3cb9aa 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-duart-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-duart-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * QorIQ DUART device tree stub [ controller @ offset 0x11c000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-duart-1.dtsi b/arch/powerpc/bo=
ot/dts/fsl/qoriq-duart-1.dtsi
index d23233a56b91..dd15dd44b93c 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-duart-1.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-duart-1.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * QorIQ DUART device tree stub [ controller @ offset 0x11d000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-esdhc-0.dtsi b/arch/powerpc/bo=
ot/dts/fsl/qoriq-esdhc-0.dtsi
index 20835ae216c7..6d90fe9b5268 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-esdhc-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-esdhc-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * QorIQ eSDHC device tree stub [ controller @ offset 0x114000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-espi-0.dtsi b/arch/powerpc/boo=
t/dts/fsl/qoriq-espi-0.dtsi
index 6db06975e095..a24a2e674e90 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-espi-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-espi-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * QorIQ eSPI device tree stub [ controller @ offset 0x110000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman-0-10g-0.dtsi b/arch/power=
pc/boot/dts/fsl/qoriq-fman-0-10g-0.dtsi
index eb77675c255a..58e25b49a577 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman-0-10g-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman-0-10g-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * QorIQ FMan 10g port #0 device tree stub [ controller @ offset 0x400000 =
]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman-0-1g-0.dtsi b/arch/powerp=
c/boot/dts/fsl/qoriq-fman-0-1g-0.dtsi
index b965bc219bae..f35f80fbcc30 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman-0-1g-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman-0-1g-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * QorIQ FMan 1g port #0 device tree stub [ controller @ offset 0x400000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman-0-1g-1.dtsi b/arch/powerp=
c/boot/dts/fsl/qoriq-fman-0-1g-1.dtsi
index 9eb6e6dd7cf9..df74208fae84 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman-0-1g-1.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman-0-1g-1.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * QorIQ FMan 1g port #1 device tree stub [ controller @ offset 0x400000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman-0-1g-2.dtsi b/arch/powerp=
c/boot/dts/fsl/qoriq-fman-0-1g-2.dtsi
index 092b89936743..77be1e9bcfd6 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman-0-1g-2.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman-0-1g-2.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * QorIQ FMan 1g port #2 device tree stub [ controller @ offset 0x400000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman-0-1g-3.dtsi b/arch/powerp=
c/boot/dts/fsl/qoriq-fman-0-1g-3.dtsi
index 2df0dc876045..32f9a75c99b5 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman-0-1g-3.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman-0-1g-3.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * QorIQ FMan 1g port #3 device tree stub [ controller @ offset 0x400000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman-0-1g-4.dtsi b/arch/powerp=
c/boot/dts/fsl/qoriq-fman-0-1g-4.dtsi
index 5fceb2438fdc..71952f51a8ad 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman-0-1g-4.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman-0-1g-4.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * QorIQ FMan 1g port #4 device tree stub [ controller @ offset 0x400000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman-0.dtsi b/arch/powerpc/boo=
t/dts/fsl/qoriq-fman-0.dtsi
index 9b6cf9149937..fc06ea34b0ad 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * QorIQ FMan device tree stub [ controller @ offset 0x400000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman-1-10g-0.dtsi b/arch/power=
pc/boot/dts/fsl/qoriq-fman-1-10g-0.dtsi
index 83ae87b69d92..be2d58ed087e 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman-1-10g-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman-1-10g-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * QorIQ FMan 10g port #0 device tree stub [ controller @ offset 0x500000 =
]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman-1-1g-0.dtsi b/arch/powerp=
c/boot/dts/fsl/qoriq-fman-1-1g-0.dtsi
index b0f0e36a4eac..e7464206e5c2 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman-1-1g-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman-1-1g-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * QorIQ FMan 1g port #0 device tree stub [ controller @ offset 0x500000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman-1-1g-1.dtsi b/arch/powerp=
c/boot/dts/fsl/qoriq-fman-1-1g-1.dtsi
index a3a79f8552a3..2e0946b88cd5 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman-1-1g-1.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman-1-1g-1.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * QorIQ FMan 1g port #1 device tree stub [ controller @ offset 0x500000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman-1-1g-2.dtsi b/arch/powerp=
c/boot/dts/fsl/qoriq-fman-1-1g-2.dtsi
index 96a69a84b8a8..d56b2284c2fe 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman-1-1g-2.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman-1-1g-2.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * QorIQ FMan 1g port #2 device tree stub [ controller @ offset 0x500000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman-1-1g-3.dtsi b/arch/powerp=
c/boot/dts/fsl/qoriq-fman-1-1g-3.dtsi
index 7405d1940133..07f59e5c5de4 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman-1-1g-3.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman-1-1g-3.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * QorIQ FMan 1g port #3 device tree stub [ controller @ offset 0x500000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman-1-1g-4.dtsi b/arch/powerp=
c/boot/dts/fsl/qoriq-fman-1-1g-4.dtsi
index f49ad69e5212..b1bfe1d2e873 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman-1-1g-4.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman-1-1g-4.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * QorIQ FMan 1g port #4 device tree stub [ controller @ offset 0x500000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman-1.dtsi b/arch/powerpc/boo=
t/dts/fsl/qoriq-fman-1.dtsi
index e95c11ff0417..15b7210f86c6 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman-1.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman-1.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * QorIQ FMan device tree stub [ controller @ offset 0x500000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-0-best-effort.dtsi=
 b/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-0-best-effort.dtsi
index baa0c503e741..e09910c9b833 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-0-best-effort.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-0-best-effort.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * QorIQ FMan v3 1g port #0 device tree stub [ controller @ offset 0x40000=
0 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-0.dtsi b/arch/powe=
rpc/boot/dts/fsl/qoriq-fman3-0-10g-0.dtsi
index 93095600e808..1713f1c75912 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * QorIQ FMan v3 10g port #0 device tree stub [ controller @ offset 0x4000=
00 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-1-best-effort.dtsi=
 b/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-1-best-effort.dtsi
index ff4bd38f0645..7e079fbe3be1 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-1-best-effort.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-1-best-effort.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * QorIQ FMan v3 1g port #1 device tree stub [ controller @ offset 0x40000=
0 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-1.dtsi b/arch/powe=
rpc/boot/dts/fsl/qoriq-fman3-0-10g-1.dtsi
index 1fa38ed6f59e..f2c60099a789 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-1.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-1.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * QorIQ FMan v3 10g port #1 device tree stub [ controller @ offset 0x4000=
00 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-0.dtsi b/arch/power=
pc/boot/dts/fsl/qoriq-fman3-0-1g-0.dtsi
index a8cc9780c0c4..308f0b1c1a57 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * QorIQ FMan v3 1g port #0 device tree stub [ controller @ offset 0x40000=
0 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-1.dtsi b/arch/power=
pc/boot/dts/fsl/qoriq-fman3-0-1g-1.dtsi
index 8b8bd70c9382..4c49b7a58d0b 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-1.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-1.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * QorIQ FMan v3 1g port #1 device tree stub [ controller @ offset 0x40000=
0 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-2.dtsi b/arch/power=
pc/boot/dts/fsl/qoriq-fman3-0-1g-2.dtsi
index 619c880b54d8..b34a4a2adcfa 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-2.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-2.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * QorIQ FMan v3 1g port #2 device tree stub [ controller @ offset 0x40000=
0 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-3.dtsi b/arch/power=
pc/boot/dts/fsl/qoriq-fman3-0-1g-3.dtsi
index d7ebb73a400d..026ec70f0aee 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-3.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-3.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * QorIQ FMan v3 1g port #3 device tree stub [ controller @ offset 0x40000=
0 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-4.dtsi b/arch/power=
pc/boot/dts/fsl/qoriq-fman3-0-1g-4.dtsi
index b151d696a069..12993a9a6f24 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-4.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-4.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * QorIQ FMan v3 1g port #4 device tree stub [ controller @ offset 0x40000=
0 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-5.dtsi b/arch/power=
pc/boot/dts/fsl/qoriq-fman3-0-1g-5.dtsi
index adc0ae0013a3..03314ce18dfd 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-5.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-5.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * QorIQ FMan v3 1g port #5 device tree stub [ controller @ offset 0x40000=
0 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0.dtsi b/arch/powerpc/bo=
ot/dts/fsl/qoriq-fman3-0.dtsi
index d62b36c5a329..51f6ec2a74c6 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman3-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * QorIQ FMan v3 device tree stub [ controller @ offset 0x400000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-10g-0.dtsi b/arch/powe=
rpc/boot/dts/fsl/qoriq-fman3-1-10g-0.dtsi
index 435047e0e250..9a85289f68fe 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-10g-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-10g-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * QorIQ FMan v3 10g port #0 device tree stub [ controller @ offset 0x5000=
00 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-10g-1.dtsi b/arch/powe=
rpc/boot/dts/fsl/qoriq-fman3-1-10g-1.dtsi
index c098657cca0a..075d2d001067 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-10g-1.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-10g-1.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * QorIQ FMan v3 10g port #1 device tree stub [ controller @ offset 0x5000=
00 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-0.dtsi b/arch/power=
pc/boot/dts/fsl/qoriq-fman3-1-1g-0.dtsi
index 9d06824815f3..db6956c1d48b 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * QorIQ FMan v3 1g port #0 device tree stub [ controller @ offset 0x50000=
0 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-1.dtsi b/arch/power=
pc/boot/dts/fsl/qoriq-fman3-1-1g-1.dtsi
index 70e947730c4b..83cb906f18b0 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-1.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-1.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * QorIQ FMan v3 1g port #1 device tree stub [ controller @ offset 0x50000=
0 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-2.dtsi b/arch/power=
pc/boot/dts/fsl/qoriq-fman3-1-1g-2.dtsi
index ad96e6529595..65380d33706f 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-2.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-2.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * QorIQ FMan v3 1g port #2 device tree stub [ controller @ offset 0x50000=
0 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-3.dtsi b/arch/power=
pc/boot/dts/fsl/qoriq-fman3-1-1g-3.dtsi
index 034bc4b71f7a..0d5248ceed93 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-3.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-3.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * QorIQ FMan v3 1g port #3 device tree stub [ controller @ offset 0x50000=
0 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-4.dtsi b/arch/power=
pc/boot/dts/fsl/qoriq-fman3-1-1g-4.dtsi
index 93ca23d82b39..2c8a09cb712d 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-4.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-4.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * QorIQ FMan v3 1g port #4 device tree stub [ controller @ offset 0x50000=
0 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-5.dtsi b/arch/power=
pc/boot/dts/fsl/qoriq-fman3-1-1g-5.dtsi
index 23b3117a2fd2..829578f8d6f3 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-5.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-5.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * QorIQ FMan v3 1g port #5 device tree stub [ controller @ offset 0x50000=
0 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman3-1.dtsi b/arch/powerpc/bo=
ot/dts/fsl/qoriq-fman3-1.dtsi
index 310232460500..063e5f6a27ba 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman3-1.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman3-1.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * QorIQ FMan v3 device tree stub [ controller @ offset 0x500000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman3l-0.dtsi b/arch/powerpc/b=
oot/dts/fsl/qoriq-fman3l-0.dtsi
index c90702b04a53..d079ca655114 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman3l-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-fman3l-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * QorIQ FMan v3 device tree stub [ controller @ offset 0x400000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-gpio-0.dtsi b/arch/powerpc/boo=
t/dts/fsl/qoriq-gpio-0.dtsi
index cf714f5f68bc..6128f4ef1588 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-gpio-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-gpio-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * QorIQ GPIO device tree stub [ controller @ offset 0x130000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-gpio-1.dtsi b/arch/powerpc/boo=
t/dts/fsl/qoriq-gpio-1.dtsi
index c2f9cdadb604..3e9f1c5312d0 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-gpio-1.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-gpio-1.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * QorIQ GPIO device tree stub [ controller @ offset 0x131000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-gpio-2.dtsi b/arch/powerpc/boo=
t/dts/fsl/qoriq-gpio-2.dtsi
index 33f3ccbac83f..1be00c297f5c 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-gpio-2.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-gpio-2.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * QorIQ GPIO device tree stub [ controller @ offset 0x132000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-gpio-3.dtsi b/arch/powerpc/boo=
t/dts/fsl/qoriq-gpio-3.dtsi
index 86954e95ea02..094e052498fe 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-gpio-3.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-gpio-3.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * QorIQ GPIO device tree stub [ controller @ offset 0x133000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-i2c-0.dtsi b/arch/powerpc/boot=
/dts/fsl/qoriq-i2c-0.dtsi
index 5f9bf7debe4c..03f10a03c522 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-i2c-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-i2c-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * QorIQ I2C device tree stub [ controller @ offset 0x118000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-i2c-1.dtsi b/arch/powerpc/boot=
/dts/fsl/qoriq-i2c-1.dtsi
index 7989bf5eeb53..f8671feb8b17 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-i2c-1.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-i2c-1.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * QorIQ I2C device tree stub [ controller @ offset 0x119000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-mpic.dtsi b/arch/powerpc/boot/=
dts/fsl/qoriq-mpic.dtsi
index 08f42271f86a..a3470a6295d7 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-mpic.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-mpic.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * QorIQ MPIC device tree stub [ controller @ offset 0x40000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-mpic4.3.dtsi b/arch/powerpc/bo=
ot/dts/fsl/qoriq-mpic4.3.dtsi
index 64f713c24825..6c06a3573f9b 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-mpic4.3.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-mpic4.3.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * QorIQ MPIC device tree stub [ controller @ offset 0x40000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-qman1-portals.dtsi b/arch/powe=
rpc/boot/dts/fsl/qoriq-qman1-portals.dtsi
index e77e4b4ed53b..c3482c22dabb 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-qman1-portals.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-qman1-portals.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * QorIQ QMan Portal device tree stub for 10 portals & 15 pool channels
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-qman1.dtsi b/arch/powerpc/boot=
/dts/fsl/qoriq-qman1.dtsi
index 0695778c4386..18ffd6ad4c5d 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-qman1.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-qman1.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * QorIQ QMan device tree stub [ controller @ offset 0x318000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-qman3.dtsi b/arch/powerpc/boot=
/dts/fsl/qoriq-qman3.dtsi
index b379abd1439d..dba14fbddf11 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-qman3.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-qman3.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * QorIQ QMan rev3 device tree stub [ controller @ offset 0x318000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-raid1.0-0.dtsi b/arch/powerpc/=
boot/dts/fsl/qoriq-raid1.0-0.dtsi
index 8d2e8aa6cf8a..fbe44e6fff28 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-raid1.0-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-raid1.0-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * QorIQ RAID 1.0 device tree stub [ controller @ offset 0x320000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-rmu-0.dtsi b/arch/powerpc/boot=
/dts/fsl/qoriq-rmu-0.dtsi
index ca7fec792e53..4b2cccafae18 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-rmu-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-rmu-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * QorIQ RIO Message Unit device tree stub [ controller @ offset 0xd3000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-sata2-0.dtsi b/arch/powerpc/bo=
ot/dts/fsl/qoriq-sata2-0.dtsi
index b642047fdecf..9e743a246658 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-sata2-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-sata2-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * QorIQ SATAv2 device tree stub [ controller @ offset 0x220000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-sata2-1.dtsi b/arch/powerpc/bo=
ot/dts/fsl/qoriq-sata2-1.dtsi
index c57370259750..5e5b28e2f81e 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-sata2-1.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-sata2-1.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * QorIQ SATAv2 device tree stub [ controller @ offset 0x221000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-sec4.0-0.dtsi b/arch/powerpc/b=
oot/dts/fsl/qoriq-sec4.0-0.dtsi
index 02bee5fcbb9a..4821cdff2a37 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-sec4.0-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-sec4.0-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * QorIQ Sec/Crypto 4.0 device tree stub [ controller @ offset 0x300000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-sec4.2-0.dtsi b/arch/powerpc/b=
oot/dts/fsl/qoriq-sec4.2-0.dtsi
index 7f7574e53323..ab800399893b 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-sec4.2-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-sec4.2-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * QorIQ Sec/Crypto 4.2 device tree stub [ controller @ offset 0x300000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-sec5.0-0.dtsi b/arch/powerpc/b=
oot/dts/fsl/qoriq-sec5.0-0.dtsi
index e298efbb0f3e..8305c7de2420 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-sec5.0-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-sec5.0-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * QorIQ Sec/Crypto 5.0 device tree stub [ controller @ offset 0x300000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-sec5.2-0.dtsi b/arch/powerpc/b=
oot/dts/fsl/qoriq-sec5.2-0.dtsi
index 33ff09d52e05..561cf5571c74 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-sec5.2-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-sec5.2-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * QorIQ Sec/Crypto 5.2 device tree stub [ controller @ offset 0x300000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-sec5.3-0.dtsi b/arch/powerpc/b=
oot/dts/fsl/qoriq-sec5.3-0.dtsi
index 08778221c194..c092b970bb09 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-sec5.3-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-sec5.3-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * QorIQ Sec/Crypto 5.3 device tree stub [ controller @ offset 0x300000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-sec6.0-0.dtsi b/arch/powerpc/b=
oot/dts/fsl/qoriq-sec6.0-0.dtsi
index 7d4a6a2354f4..1fcdff9a3795 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-sec6.0-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-sec6.0-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * QorIQ Sec/Crypto 6.0 device tree stub
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-usb2-dr-0.dtsi b/arch/powerpc/=
boot/dts/fsl/qoriq-usb2-dr-0.dtsi
index 4dd6f84c239c..6c1b781c8126 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-usb2-dr-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-usb2-dr-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * QorIQ USB DR device tree stub [ controller @ offset 0x211000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-usb2-mph-0.dtsi b/arch/powerpc=
/boot/dts/fsl/qoriq-usb2-mph-0.dtsi
index f053835aa1c7..0d8f20aea727 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-usb2-mph-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-usb2-mph-0.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * QorIQ USB Host device tree stub [ controller @ offset 0x210000 ]
  *
diff --git a/arch/powerpc/boot/dts/fsl/t1023rdb.dts b/arch/powerpc/boot/dts=
/fsl/t1023rdb.dts
index f82f85c65964..1be0449cc4c4 100644
--- a/arch/powerpc/boot/dts/fsl/t1023rdb.dts
+++ b/arch/powerpc/boot/dts/fsl/t1023rdb.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * T1023 RDB Device Tree Source
  *
diff --git a/arch/powerpc/boot/dts/fsl/t1023si-post.dtsi b/arch/powerpc/boo=
t/dts/fsl/t1023si-post.dtsi
index d552044c5afc..cf35c86582af 100644
--- a/arch/powerpc/boot/dts/fsl/t1023si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/t1023si-post.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * T1023 Silicon/SoC Device Tree Source (post include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/t1024qds.dts b/arch/powerpc/boot/dts=
/fsl/t1024qds.dts
index d6858b7cd93f..23e521be3359 100644
--- a/arch/powerpc/boot/dts/fsl/t1024qds.dts
+++ b/arch/powerpc/boot/dts/fsl/t1024qds.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * T1024 QDS Device Tree Source
  *
diff --git a/arch/powerpc/boot/dts/fsl/t1024rdb.dts b/arch/powerpc/boot/dts=
/fsl/t1024rdb.dts
index dbcd31cc35dc..a36d3059f2d5 100644
--- a/arch/powerpc/boot/dts/fsl/t1024rdb.dts
+++ b/arch/powerpc/boot/dts/fsl/t1024rdb.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * T1024 RDB Device Tree Source
  *
diff --git a/arch/powerpc/boot/dts/fsl/t1024si-post.dtsi b/arch/powerpc/boo=
t/dts/fsl/t1024si-post.dtsi
index bb480346a58d..216bc0ea9da7 100644
--- a/arch/powerpc/boot/dts/fsl/t1024si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/t1024si-post.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * T1024 Silicon/SoC Device Tree Source (post include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/t102xsi-pre.dtsi b/arch/powerpc/boot=
/dts/fsl/t102xsi-pre.dtsi
index d87ea13164f2..e8116152bca5 100644
--- a/arch/powerpc/boot/dts/fsl/t102xsi-pre.dtsi
+++ b/arch/powerpc/boot/dts/fsl/t102xsi-pre.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * T1024/T1023 Silicon/SoC Device Tree Source (pre include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/t1040d4rdb.dts b/arch/powerpc/boot/d=
ts/fsl/t1040d4rdb.dts
index fb6bc02ebb60..bbcfa9a9acea 100644
--- a/arch/powerpc/boot/dts/fsl/t1040d4rdb.dts
+++ b/arch/powerpc/boot/dts/fsl/t1040d4rdb.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * T1040D4RDB Device Tree Source
  *
diff --git a/arch/powerpc/boot/dts/fsl/t1040qds.dts b/arch/powerpc/boot/dts=
/fsl/t1040qds.dts
index 5f76edc7838c..54c712e2eaf1 100644
--- a/arch/powerpc/boot/dts/fsl/t1040qds.dts
+++ b/arch/powerpc/boot/dts/fsl/t1040qds.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * T1040QDS Device Tree Source
  *
diff --git a/arch/powerpc/boot/dts/fsl/t1040rdb.dts b/arch/powerpc/boot/dts=
/fsl/t1040rdb.dts
index af0c8a6f5613..52446a30ddb5 100644
--- a/arch/powerpc/boot/dts/fsl/t1040rdb.dts
+++ b/arch/powerpc/boot/dts/fsl/t1040rdb.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * T1040RDB Device Tree Source
  *
diff --git a/arch/powerpc/boot/dts/fsl/t1040si-post.dtsi b/arch/powerpc/boo=
t/dts/fsl/t1040si-post.dtsi
index f58eb820eb5e..7240b9bf4520 100644
--- a/arch/powerpc/boot/dts/fsl/t1040si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/t1040si-post.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * T1040 Silicon/SoC Device Tree Source (post include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/t1042d4rdb.dts b/arch/powerpc/boot/d=
ts/fsl/t1042d4rdb.dts
index 4fa15f48a4c3..c647b740c241 100644
--- a/arch/powerpc/boot/dts/fsl/t1042d4rdb.dts
+++ b/arch/powerpc/boot/dts/fsl/t1042d4rdb.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * T1042D4RDB Device Tree Source
  *
diff --git a/arch/powerpc/boot/dts/fsl/t1042qds.dts b/arch/powerpc/boot/dts=
/fsl/t1042qds.dts
index 90a4a73bb905..bb243f619fb4 100644
--- a/arch/powerpc/boot/dts/fsl/t1042qds.dts
+++ b/arch/powerpc/boot/dts/fsl/t1042qds.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * T1042QDS Device Tree Source
  *
diff --git a/arch/powerpc/boot/dts/fsl/t1042rdb.dts b/arch/powerpc/boot/dts=
/fsl/t1042rdb.dts
index 3ebb712224cb..e29aace1689e 100644
--- a/arch/powerpc/boot/dts/fsl/t1042rdb.dts
+++ b/arch/powerpc/boot/dts/fsl/t1042rdb.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * T1042RDB Device Tree Source
  *
diff --git a/arch/powerpc/boot/dts/fsl/t1042rdb_pi.dts b/arch/powerpc/boot/=
dts/fsl/t1042rdb_pi.dts
index 8ec3ff45e6fc..70d39872aefb 100644
--- a/arch/powerpc/boot/dts/fsl/t1042rdb_pi.dts
+++ b/arch/powerpc/boot/dts/fsl/t1042rdb_pi.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * T1042RDB_PI Device Tree Source
  *
diff --git a/arch/powerpc/boot/dts/fsl/t1042si-post.dtsi b/arch/powerpc/boo=
t/dts/fsl/t1042si-post.dtsi
index a5544f93689c..256aad82a083 100644
--- a/arch/powerpc/boot/dts/fsl/t1042si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/t1042si-post.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * T1042 Silicon/SoC Device Tree Source (post include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/t104xd4rdb.dtsi b/arch/powerpc/boot/=
dts/fsl/t104xd4rdb.dtsi
index 863f9431285f..c61a198c5fb1 100644
--- a/arch/powerpc/boot/dts/fsl/t104xd4rdb.dtsi
+++ b/arch/powerpc/boot/dts/fsl/t104xd4rdb.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * T1040D4RDB/T1042D4RDB Device Tree Source
  *
diff --git a/arch/powerpc/boot/dts/fsl/t104xqds.dtsi b/arch/powerpc/boot/dt=
s/fsl/t104xqds.dtsi
index 615479732252..3ee9e5283619 100644
--- a/arch/powerpc/boot/dts/fsl/t104xqds.dtsi
+++ b/arch/powerpc/boot/dts/fsl/t104xqds.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * T104xQDS Device Tree Source
  *
diff --git a/arch/powerpc/boot/dts/fsl/t104xrdb.dtsi b/arch/powerpc/boot/dt=
s/fsl/t104xrdb.dtsi
index 099a598c74c0..c96e22f5c777 100644
--- a/arch/powerpc/boot/dts/fsl/t104xrdb.dtsi
+++ b/arch/powerpc/boot/dts/fsl/t104xrdb.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * T1040RDB/T1042RDB Device Tree Source
  *
diff --git a/arch/powerpc/boot/dts/fsl/t104xsi-pre.dtsi b/arch/powerpc/boot=
/dts/fsl/t104xsi-pre.dtsi
index dd59e4b69480..defb358c403f 100644
--- a/arch/powerpc/boot/dts/fsl/t104xsi-pre.dtsi
+++ b/arch/powerpc/boot/dts/fsl/t104xsi-pre.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * T1040/T1042 Silicon/SoC Device Tree Source (pre include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/t2080qds.dts b/arch/powerpc/boot/dts=
/fsl/t2080qds.dts
index 8d190e8c62ce..510acd246c27 100644
--- a/arch/powerpc/boot/dts/fsl/t2080qds.dts
+++ b/arch/powerpc/boot/dts/fsl/t2080qds.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * T2080QDS Device Tree Source
  *
diff --git a/arch/powerpc/boot/dts/fsl/t2080rdb.dts b/arch/powerpc/boot/dts=
/fsl/t2080rdb.dts
index 092a400740f8..2b5c78525a2e 100644
--- a/arch/powerpc/boot/dts/fsl/t2080rdb.dts
+++ b/arch/powerpc/boot/dts/fsl/t2080rdb.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * T2080PCIe-RDB Board Device Tree Source
  *
diff --git a/arch/powerpc/boot/dts/fsl/t2080si-post.dtsi b/arch/powerpc/boo=
t/dts/fsl/t2080si-post.dtsi
index 082ec2044060..7fe2313f3f93 100644
--- a/arch/powerpc/boot/dts/fsl/t2080si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/t2080si-post.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * T2080 Silicon/SoC Device Tree Source (post include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/t2081qds.dts b/arch/powerpc/boot/dts=
/fsl/t2081qds.dts
index fc5c4a30f7ad..4213b88b9ad4 100644
--- a/arch/powerpc/boot/dts/fsl/t2081qds.dts
+++ b/arch/powerpc/boot/dts/fsl/t2081qds.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * T2081QDS Device Tree Source
  *
diff --git a/arch/powerpc/boot/dts/fsl/t2081si-post.dtsi b/arch/powerpc/boo=
t/dts/fsl/t2081si-post.dtsi
index ecbb447920bc..ce872f561647 100644
--- a/arch/powerpc/boot/dts/fsl/t2081si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/t2081si-post.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * T2081 Silicon/SoC Device Tree Source (post include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/t208xqds.dtsi b/arch/powerpc/boot/dt=
s/fsl/t208xqds.dtsi
index db4139999b28..2ad3230dd3bf 100644
--- a/arch/powerpc/boot/dts/fsl/t208xqds.dtsi
+++ b/arch/powerpc/boot/dts/fsl/t208xqds.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * T2080/T2081 QDS Device Tree Source
  *
diff --git a/arch/powerpc/boot/dts/fsl/t208xrdb.dtsi b/arch/powerpc/boot/dt=
s/fsl/t208xrdb.dtsi
index ff87e67c70da..71d91ee1a5d5 100644
--- a/arch/powerpc/boot/dts/fsl/t208xrdb.dtsi
+++ b/arch/powerpc/boot/dts/fsl/t208xrdb.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * T2080PCIe-RDB Board Device Tree Source
  *
diff --git a/arch/powerpc/boot/dts/fsl/t208xsi-pre.dtsi b/arch/powerpc/boot=
/dts/fsl/t208xsi-pre.dtsi
index 3f745de44284..3b22e7ef50bf 100644
--- a/arch/powerpc/boot/dts/fsl/t208xsi-pre.dtsi
+++ b/arch/powerpc/boot/dts/fsl/t208xsi-pre.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * T2080/T2081 Silicon/SoC Device Tree Source (pre include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/t4240qds.dts b/arch/powerpc/boot/dts=
/fsl/t4240qds.dts
index c0913ac5aaad..fc4c988bd8d3 100644
--- a/arch/powerpc/boot/dts/fsl/t4240qds.dts
+++ b/arch/powerpc/boot/dts/fsl/t4240qds.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * T4240QDS Device Tree Source
  *
diff --git a/arch/powerpc/boot/dts/fsl/t4240rdb.dts b/arch/powerpc/boot/dts=
/fsl/t4240rdb.dts
index 145896f2eef6..883f282976ef 100644
--- a/arch/powerpc/boot/dts/fsl/t4240rdb.dts
+++ b/arch/powerpc/boot/dts/fsl/t4240rdb.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * T4240RDB Device Tree Source
  *
diff --git a/arch/powerpc/boot/dts/fsl/t4240si-post.dtsi b/arch/powerpc/boo=
t/dts/fsl/t4240si-post.dtsi
index fcac73486d48..5a3f2b33724e 100644
--- a/arch/powerpc/boot/dts/fsl/t4240si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/t4240si-post.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * T4240 Silicon/SoC Device Tree Source (post include)
  *
diff --git a/arch/powerpc/boot/dts/fsl/t4240si-pre.dtsi b/arch/powerpc/boot=
/dts/fsl/t4240si-pre.dtsi
index 632314c6faa9..1125d001201b 100644
--- a/arch/powerpc/boot/dts/fsl/t4240si-pre.dtsi
+++ b/arch/powerpc/boot/dts/fsl/t4240si-pre.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
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
