Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3915E497BDA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jan 2022 10:23:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jj4KX1JZHz3cBs
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jan 2022 20:23:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::61c;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on061c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::61c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jj4JY2hysz30MQ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jan 2022 20:22:36 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W7yNKcVUuTmoK2RRuJdcn8H4CWw/ufCkkHrkC7NV5CvE9UOl/IqKEB03ZjIbF2zk763dLvJCo4j0Leuznp7ieV7X/TW9NKXRVIVX6K7buby+12PXOfnELJa3fO0us5aCN8zCaiVc8z59/FpgRQrxDo7pBwOEXWTCmYLNPoDGcHAIr5xslmL3M8gnQzUb5TOxjFZm3dJpijkxpy/sN+RLx9I2fNMczYISUe+pYAzSplQE3lPyqDRYvevmOxVlOToID0azI3egRGLNfDW3om8W3fkda4iOnDjdIgR8At3CJMrZjQtzvmk9KkoZClIE6gEnk/A2pA0AYCC5Nvu1N3/hIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PmcUDD4cRpXoGbE09sZFwnyntOCoCZNQpl9c1VJ6TKw=;
 b=eAEQws9pJ6rHIqujCehNK0VK5o5NXatRlqRNaeTBhYMQzwIjOOazfXOLn6f2hKuBPLpb5HkjnbiNNVfFkOWisLBPE2CrB2ICZ0nViLG6ZM+O2cjifshdmi5ANl8cfA1DLRo/2oFEEtHwwXNjYJQtLt2bEORB3z+bnBSMk6sl1FFxkg/lQ3DSJXL/JPTd7U8YnJtFmJyCn88mDjSFsMq7OWUGMLFSX/1fQ9RWVLvMRpFvCxRNIID4RZx3hUm11EK+vhUM6TADMVd2ho+sgf5xaLEWI+x1ooZR4epB4iAD5ufr6TjrF0WE3ntTZYKQXQwwKkb0J7xUsjAGKLaBjpIOsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAYP264MB3485.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:124::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Mon, 24 Jan
 2022 09:22:12 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5%5]) with mapi id 15.20.4909.017; Mon, 24 Jan 2022
 09:22:12 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Luis Chamberlain <mcgrof@kernel.org>, Jessica Yu <jeyu@kernel.org>
Subject: [PATCH 0/7] Allocate module text and data separately
Thread-Topic: [PATCH 0/7] Allocate module text and data separately
Thread-Index: AQHYEQPeal2Ru1Vo80yWM9wORGS9cw==
Date: Mon, 24 Jan 2022 09:22:11 +0000
Message-ID: <cover.1643015752.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 075d9852-40f0-48a7-2663-08d9df1b00d2
x-ms-traffictypediagnostic: PAYP264MB3485:EE_
x-microsoft-antispam-prvs: <PAYP264MB3485F5CD55F014737712412BED5E9@PAYP264MB3485.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XbwZ7S9u+Qp1rbiMS6XNIsM5pJd/d/n5mZJ6hw8doYf2h7GcNmX0QTH1LO+C2zAZzPk3XiTqyAB5YE1hF6pFaRGhOajMENEddXPitVkI4+h+PQ6I6g7Zj0TXP+o8rMLNUDuUrU2LDBD812zMUMZKURUdj3sgRStwF+vfzdxoPqSuvh7oEJ0uROqUQXZejw/2bi74uVO4fh+dW+w67wxC+6iNdpA59ZKxDeNk8FrBuoluKcT0HiCu9nPLgaegcdcMppBNiTdnrpMvFk1vt83vhpNWglEcMVXNI5epgsChGfw+Fa8/HEjP11O4z+XZedMiAN5IvnG2ooiW9VlLL7zVSUO52YmGmjmO3XOpUoyLh83aJhL6iWoKsSX/x4j728uZDI69V1B6HmNypSIpTGelhuRfkBbyAQsaHKbFPKLPo8VAhUAfTJAvl+LHT/sqDoqPKEt87vJfHZR2WRT25p3gyZPI5scQJt0132lLLCcHsFnLKpkwd0v0rrSIzLx3RjGLjY4n+pwwbeZKY3eqd449fB7tW0ApFHthCwTH1N79O8Mk06uxm8p6no8wVvEuChAz8SH4m1ZQWl0v8TLvSTCqT8L4XdrFhXeX3ulRFjD9kR1qYJioqIYalWEY8Zlo1r2D5kzZGB250Yyq0OOrOMcCvp6jZFFqUNuGlm5jLBufYGIy/fxTbb2TPf9H2nSGocWcuM8UxI2zNKE8LlkfSnjtRg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38070700005)(86362001)(66446008)(38100700002)(64756008)(66476007)(66946007)(91956017)(76116006)(71200400001)(66556008)(44832011)(36756003)(8936002)(83380400001)(8676002)(122000001)(26005)(6512007)(2906002)(6486002)(6506007)(186003)(5660300002)(508600001)(316002)(4326008)(2616005)(110136005)(54906003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?4hXagqzlzb410+CMNcJecR4KmGee+Hhd3cpCRp+fwNcJNcGQHe94hTbQ0Z?=
 =?iso-8859-1?Q?ftlCDWMbz0MXFgVzBsfHj3iKT6/W+KTBjFdvsQF2Zn3FyK+1u3vPdsJMdj?=
 =?iso-8859-1?Q?8jSKhgrXWMXSEHV8IUDLwElnwr7rjA4mbMMtBoV+UOR5B13XPaHIRds5BG?=
 =?iso-8859-1?Q?Rp3/w+ka1bsmBRuKbc4EzMBQrHH2ia1EKZ8akr3ATMKjTnuxx45sXzM9Et?=
 =?iso-8859-1?Q?q8DQWW68V4UCt5NqJP25Xo7F+0FlBFdz02VptOdjO5/jHo3SvHU7Ltwx0H?=
 =?iso-8859-1?Q?+18hwF3ilrupldUsCGFZg9qh8mSlvibb+gs4m6mbJwvu2QSDzJDoD4nMwD?=
 =?iso-8859-1?Q?hYcz16QA+MykxXmNVEMkQ0mMqnsH4+2Zw4nSpeFDwIxKUxpPcZmZXr0tjH?=
 =?iso-8859-1?Q?JSFshupLN+N68KyJTR/yCzCxHonsViaZ6piHHnPi2YVQi8Nh4ii4u9Ccac?=
 =?iso-8859-1?Q?U8/bDKJox6Eo0qpcsVbVuccxjgrOSusDJNdyXb17QoarcDmcN7kp0S+dKp?=
 =?iso-8859-1?Q?BL5LNAqzVCL94K74sfZLo+wAXqQqZZ3IibUoiMhjbbVMYHyLgZXzvEabdO?=
 =?iso-8859-1?Q?Gbf31tRt/4ceBOS0A/ALlo8eH2/oxJAeNfpoPtsmSjtiU+TXiv/1woCfb9?=
 =?iso-8859-1?Q?u5X68VE7lyx+n/HHRBeV2mIE2mMKxZd4bRIkRrcMhcaY27I4tCob2MmgR5?=
 =?iso-8859-1?Q?PM4MbgYs45gtgWT8mkAsge+Q/cpTOaRqYa/w+XUAR+t8HhN6JvyyxO/PF+?=
 =?iso-8859-1?Q?7bZWxfCFY7Q/ZWrxzkX5BXxcWRvf0cG4WtiLmtUJFsK/kHql8aUWzOu0uq?=
 =?iso-8859-1?Q?kuUjv1q3Ccc3jeoqCg7MNIIaxKBcV1bfsxjlloJMjrsbxrI6JwUFOiRvEq?=
 =?iso-8859-1?Q?6fg8E2ZULr8NVgE7rd6IXzG4R2aJP/iI6R+RmaUr6nFgBArmfWLb2Jb35c?=
 =?iso-8859-1?Q?1VEYKX95yfMMYFfxu4QfbHkKDuxrIHrw75hZEHm2ZEKFw0HYnxqgixsZoM?=
 =?iso-8859-1?Q?rtnJJ7F7ETvpTIPJ4IEUxqHowZ9S6VhPqcig9AW85RzsRwDyuu6WT3Fi6T?=
 =?iso-8859-1?Q?F/Uob8pq4c8Az0Eecn4btiBNMPXyneieERhq2ex/U8e1UV4angqy8H7VVZ?=
 =?iso-8859-1?Q?ALCfaJpCoQOC8FSZ0QvckErOlwOVjdvML44EJU1aMyIHNSqyy2B5b2nhmI?=
 =?iso-8859-1?Q?ZSur9sQ0gWoVy350Pbj+Z7ucE06VnfV8ppHiTPxUftPbymKo5ZUFcv+cd1?=
 =?iso-8859-1?Q?Yif4x17/y0ozjuoxW6ouKb8LxuBiI6FUotwYX2MV/hiI6BYEOeK3G6oqsx?=
 =?iso-8859-1?Q?XKrZ2QS7Lv+j2WTjmt1jm3kQADlNsSCade6Zuxp+/vFHGw/CiMkeVwk2mD?=
 =?iso-8859-1?Q?mDUg4xERJZl572y69onmlkTqnHo8+NTLV2nAqP9xRfOLpVz+gzsLCMnKIi?=
 =?iso-8859-1?Q?VFUnaCDCtYkpjzC8FJXB6gvN9ohyVk1Ba59fJkQrvxWSWCPCCuYYxoropF?=
 =?iso-8859-1?Q?3UeCdanttOJ0C0NfF9oQZc+yGjEToGYoTzyMd+6Mmi0cpIXm2Rk12Vm1NJ?=
 =?iso-8859-1?Q?N027283ku+Ffcly7Bv+O/cdEG/DhUknYAcTDWPxH1dibdpOIGI7pwdXEG1?=
 =?iso-8859-1?Q?zkGChs09KcD0sOBzvh3ETL3NJyuqT2UTZLWulqyndd88mRvEB/N7CR4PPs?=
 =?iso-8859-1?Q?xb6yj+Ufjf+TWspzqPBDktMpGxeyRCNiv5HJLxMCDLmBk6/vuiT9dcYTrw?=
 =?iso-8859-1?Q?5Mux7vlZawg3B8eE3U9TlvlGc=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 075d9852-40f0-48a7-2663-08d9df1b00d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2022 09:22:11.9425 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bXjuh3Cs4mPye1dB01wH1Kcqz+geiQvH6x0JEpplMiOEd4BpnSc+NFR1G8UJkZzn3JkHJSX3c24mduFN0uEVAPWpm4crclK9Qk+mCXUt690=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAYP264MB3485
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
Cc: "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "kgdb-bugreport@lists.sourceforge.net"
 <kgdb-bugreport@lists.sourceforge.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series allow architectures to request having modules data in
vmalloc area instead of module area.

This is required on powerpc book3s/32 in order to set data non
executable, because it is not possible to set executability on page
basis, this is done per 256 Mbytes segments. The module area has exec
right, vmalloc area has noexec.

This can also be useful on other powerpc/32 in order to maximize the
chance of code being close enough to kernel core to avoid branch
trampolines.

Christophe Leroy (7):
  modules: Refactor within_module_core() and within_module_init()
  modules: Add within_module_text() macro
  modules: Always have struct mod_tree_root
  modules: Prepare for handling several RB trees
  modules: Introduce data_layout
  modules: Add CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC
  powerpc: Select ARCH_WANTS_MODULES_DATA_IN_VMALLOC on book3s/32 and
    8xx

 arch/Kconfig                |   6 ++
 arch/powerpc/Kconfig        |   1 +
 include/linux/module.h      |  38 ++++++-
 kernel/debug/kdb/kdb_main.c |  10 +-
 kernel/module.c             | 207 ++++++++++++++++++++++++------------
 5 files changed, 186 insertions(+), 76 deletions(-)

--=20
2.33.1
