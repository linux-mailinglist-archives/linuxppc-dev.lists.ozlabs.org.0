Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4A7497BE7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jan 2022 10:25:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jj4NF19pkz3dnT
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jan 2022 20:25:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::628;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0628.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::628])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jj4Jd1CKsz30Qw
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jan 2022 20:22:41 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RiOiPtN/Jr8FN7L9/6KPPIQSIc8OsJt8AvUhafxyLYZ4/V7dQh0pFHSSNxXq9HU80JZJbu/D5dYECuSF887Yq8q5jF/QLsRTCeGGAy5MASPj3WAzvQTTGjh5jLl2a8bts4bJwBdqZzZuxRPNbkgBDAlS8Uy8S3mwaU3NRaRsY8TzkSG1eQoFHZ0oi/uCyQ2uiVoxd/XrcBy7FeInu6wi44PU8+h5AlMAnNgjsasXZieRrZDg6WKcsS2uwJ2zLAJIRYk9haU5m6aqMFviURn/xjlSH8JnMiVOFFWD7bQqWlvi3In442EKh8F01Jbszn3oy7ABMaKYtFn559nPHNWSHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bMsW8FpagZt8kJgfuuAdQRpHDbv+vxyvyU1u52FdqhI=;
 b=UUHbXrQkaGd0QdxpwmIo1DVNyX+TfN3vHEryx6EneS7IzoaPnILg9BTRq74bX6VsX3dUX2ugMDZ943cb0Ncm/np93eqsnU8Jd0OpDgiR/51PRk+TQYuGpZxhVej0JvzFpVdcPLkFXzJ5fwR+rmzhDptx6Gq/Tyf0P/tUQKQOykxszvDZN+qCnJ0s3Qd/Qf6Xd+wv/vI5DOTyENRxufHiLpbqFc8wpHd7gHsJeY6daHajkE3RK7gDiNJqAeCmAf/eKiqaaRfDadUXUOYPqLIWZNUcl6ESEbPj+d/CcR9uOUvDCRklj3HihkpU6vIFSoUySHvqFOMY9B0tnwrgAK2alw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB1742.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1b5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Mon, 24 Jan
 2022 09:22:34 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5%5]) with mapi id 15.20.4909.017; Mon, 24 Jan 2022
 09:22:34 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Luis Chamberlain <mcgrof@kernel.org>, Jessica Yu <jeyu@kernel.org>
Subject: [PATCH 6/7] modules: Add CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC
Thread-Topic: [PATCH 6/7] modules: Add
 CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC
Thread-Index: AQHYEQPri54wm9k2kUic7oR3m4zr7g==
Date: Mon, 24 Jan 2022 09:22:34 +0000
Message-ID: <848d857871f457f4df37e80fad468d615b237c24.1643015752.git.christophe.leroy@csgroup.eu>
References: <cover.1643015752.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1643015752.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 32be9bc4-dd58-40cd-0e7a-08d9df1b0e37
x-ms-traffictypediagnostic: PR1P264MB1742:EE_
x-microsoft-antispam-prvs: <PR1P264MB17427B0FDAAD01D46EBFF15FED5E9@PR1P264MB1742.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5UfPIhTMFJiMu+SEES3I0o+vtzG8ygg/QNlsNYjMGuHEnk+esOimqFrVjlYZnfgsDh7pXTij8kKKB4n/fySur1AawLLbG9Vu5zgzE74s5BlapOZ3ln04Ii21Ky7pRN23OWBM1IFilXgIN6FG/gZ/jG2P+831w+GHleltYWoAyZkKqaiGSplvbjRd4sFA/lkNA6esJNwdpBMPb3JjMSPFOBFNO9RUKh1DfMN89ViC0NQjinpmOYIL01VVbl4ljMEu0zcok5c6NTbPHxKX7NTMQvgVIew2nV/+W6JaI0Ompuo8YGmNzusi1qILh00ySUnKpYLRTbsHkbKqXSbEqrgGx8+EvOBzCzBMsOHZin0tQ2JlYrbhf9MqphmTxiEDehRdpqN3UaleZK6GX43YYi0nmdGfITof1Blzu/e9ZMWrhTf29PdFabRCOXeD3+7XY7pmBrZxD/W7Q8g9molaNjkBUlsZW5l15D5TTgAd2HzQlc+VohuI90lwIXA52+aG6V2HtkqX3eYZLTQ3lw2ZhhRNR6rp4U5PZabJy8U5qltSmcEMackA6uIpo+TWGjXgzChfqvex9hNP2cKcn1qOrW3PPe4XiSKsE4We9ONfG6yWdT3bzIZoAe5u1T2COD1rTw5EvELUi2vldvuiC/HHq9LK5Sb5QZ5w42LZQxeXQHmgH3+sgw8SnR66Fi9Y8SOdCUl4/uRJ4H31sa3Unmb75e6kqg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66556008)(7416002)(66476007)(91956017)(316002)(6486002)(54906003)(110136005)(6512007)(508600001)(64756008)(2616005)(86362001)(8676002)(186003)(26005)(5660300002)(66446008)(83380400001)(2906002)(76116006)(38100700002)(122000001)(44832011)(71200400001)(38070700005)(6506007)(66946007)(4326008)(36756003)(8936002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?TZGymvdsy+SsDpfKfbX0FqH5wqabpfFrGebYu4rVIXfiQcZTkEvGd0PXj3?=
 =?iso-8859-1?Q?StIoFHjtOTiWlI37xGq2wlCEkv3mtiGq8VF/RxQPZNzrTD6O7GIqL2pLbo?=
 =?iso-8859-1?Q?aOqmLVG3vEOnv0WPZnhldJN9JOmqnTMQyaPzK0HjhmeEhu0p9Demx3GFdh?=
 =?iso-8859-1?Q?2Iv003Mlp3JydlgbCKwnLM20yimzNd3+e2Yw8b1BqGGDyLA1EGxP+3GSA8?=
 =?iso-8859-1?Q?Zn8C4SAvXez1A9fV51CkviGwjs36/tCo/snMZfClgGTQbx0nJ7HixHZn1I?=
 =?iso-8859-1?Q?kyxwtj5XHDSwsR0zujXYuYoUwNQ/RKzS+aoaY9xEq+SK1StUy3VbftFMe9?=
 =?iso-8859-1?Q?Z2e0XlFMBoH2w4JQkeryO0cXpIY7pvs3qhwOz3pmIL/2pv7L0cGKv5vySb?=
 =?iso-8859-1?Q?DHbDEAzsCpyTvjwyIJLwskA6Ru20pB+5Ofsptt5Ob9cvuF95avuJ6N442W?=
 =?iso-8859-1?Q?169Hy9YzYhSjVtyCiBjQy5+YT/37G6pD5ESIWxOuEWHtr5p5tngQY2V8VH?=
 =?iso-8859-1?Q?Ukw+v7km+0TuaULb2wen8FxshIVkeqzjTTHa4cvV3XR+gjWK7BaXNDxZOy?=
 =?iso-8859-1?Q?PpiOtZf8K7dH7njjVSUzQQ2nl9g2J0JHvq/R7rfKGd45IMNneOkxUaDwsT?=
 =?iso-8859-1?Q?uQBWboHJ0PS3U5tQyQMKXarBB5VRXXQzav3mDOuC6RI2+LcaRqff3FQ3Ad?=
 =?iso-8859-1?Q?cswjIo3cEvoj8VcYVg7o8a9Q5BRvI1wMDsObFSu6V6q5Z3XJTq607qYFtx?=
 =?iso-8859-1?Q?rtkO9kXhhE9e5thEp3SAmKKWo/AyG4SOWVe/0fMrljyY/GO133UqkhbF7C?=
 =?iso-8859-1?Q?4+r4qj1MbknmJfo+R9e/D6TbTJfooj/cIho2VGbGQJgIl9urBPE5I1Ci67?=
 =?iso-8859-1?Q?CM/w2ms3rtlICcHXzgBxsjb6iUgMJerBxI/D3mPlx3DBCE6ERsmQacpIeM?=
 =?iso-8859-1?Q?zzHY5GdRe+Ny/YE7KZTq779/fZqe7+Rx6bM90Nlth3iFtQ1ZQrsOgKv6JQ?=
 =?iso-8859-1?Q?7fElpzJg/tyBF5Btvqo43LI/ucENDwXzE8m5JKMhVqeimkZmShSK962Ma9?=
 =?iso-8859-1?Q?S0V3fTKaYhzdKmjmqXISb7yk7nur1eSsChwtbA0uhqwOqTpui0S4K1476t?=
 =?iso-8859-1?Q?6lv8ASvKhNrDjD+KnC2ouasZSYlI1YuZ3px3RZ2jSegEFAKrsqc4dBzBub?=
 =?iso-8859-1?Q?2p3PSEYOeUq4tURHLWll4hfPk2bYSaDVDb4Qapcra+GNiF3C+X4EUps7C3?=
 =?iso-8859-1?Q?RMP1FsN3bVtnu7TUCB/0xvG7K4fsgxktyy29UYMFl0ysuLJuUBjyLSv1LN?=
 =?iso-8859-1?Q?TzdPyjc36qkEZfqpVTsYsS8Q+ehJbJBEyfJAvjfOXK3fSXcijcEE9VXj1O?=
 =?iso-8859-1?Q?Qfx3JXgQsoP8jduHwXHEw1O8KCWQQm3uwOMMtOnxaZr4xaNPfJwYmoAMqu?=
 =?iso-8859-1?Q?Kn14MmTZ5hVhFLcYv52qbxIkRCuGDOD3lKS73jOTQu1jeiknTwPRfF6XOT?=
 =?iso-8859-1?Q?EQ7wfjo5Yxc1YQ+Qk1Lnpfc1BZMkmpld+RZ3EoYT7jKsGoX/s8a/CPN7I0?=
 =?iso-8859-1?Q?pw8SYCw4arqsrgly2VvwlvOwDNohLDvJyi0Eux8er1+lspD+cMYP9AFiAh?=
 =?iso-8859-1?Q?SRWwr/KGLC4sZIOojMVhq3VUzE9EnYl/DGyxRCk05y2KcEZyZ4M3hDu4Cj?=
 =?iso-8859-1?Q?9PShrHYqoHvbvOuX3TeNf8doVzlOMVbClI5UP9eWvduYFIuJk9arPjSjQY?=
 =?iso-8859-1?Q?QIxDCwEwJlYop6BjXBhWHPBOA=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 32be9bc4-dd58-40cd-0e7a-08d9df1b0e37
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2022 09:22:34.4142 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DsjACjUCXRe+Nt7RLX3D5mfDzV3WVewrGhpvRjd6RkNfLT3jnEQR1aRIgC+4zbSfqcTxfNTCv3XC2yaQkCU0Z3NMeWrVGeAlXAoQK+W+BDM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB1742
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
 Daniel Thompson <daniel.thompson@linaro.org>,
 "kgdb-bugreport@lists.sourceforge.net" <kgdb-bugreport@lists.sourceforge.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Douglas Anderson <dianders@chromium.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC to allow architectures
to request having modules data in vmalloc area instead of module area.

This is required on powerpc book3s/32 in order to set data non
executable, because it is not possible to set executability on page
basis, this is done per 256 Mbytes segments. The module area has exec
right, vmalloc area has noexec.

This can also be useful on other powerpc/32 in order to maximize the
chance of code being close enough to kernel core to avoid branch
trampolines.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Jason Wessel <jason.wessel@windriver.com>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>
---
 arch/Kconfig                |  6 +++
 include/linux/module.h      |  8 ++++
 kernel/debug/kdb/kdb_main.c | 10 ++++-
 kernel/module.c             | 73 ++++++++++++++++++++++++++++++++++++-
 4 files changed, 93 insertions(+), 4 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index 847fde3d22cd..ed6a5ab8796d 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -883,6 +883,12 @@ config MODULES_USE_ELF_REL
 	  Modules only use ELF REL relocations.  Modules with ELF RELA
 	  relocations will give an error.
=20
+config ARCH_WANTS_MODULES_DATA_IN_VMALLOC
+	bool
+	help
+	  For architectures like powerpc/32 which have constraints on module
+	  allocation and need to allocate module data outside of module area.
+
 config HAVE_IRQ_EXIT_ON_IRQ_STACK
 	bool
 	help
diff --git a/include/linux/module.h b/include/linux/module.h
index fc7adb110a81..3d908bb7ed08 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -421,6 +421,9 @@ struct module {
 	/* Core layout: rbtree is accessed frequently, so keep together. */
 	struct module_layout core_layout __module_layout_align;
 	struct module_layout init_layout;
+#ifdef CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC
+	struct module_layout data_layout;
+#endif
=20
 	/* Arch-specific module values */
 	struct mod_arch_specific arch;
@@ -592,7 +595,12 @@ static inline bool within_module_layout(unsigned long =
addr,
 static inline bool within_module_core(unsigned long addr,
 				      const struct module *mod)
 {
+#ifdef CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC
+	return within_module_layout(addr, &mod->core_layout) ||
+	       within_module_layout(addr, &mod->data_layout);
+#else
 	return within_module_layout(addr, &mod->core_layout);
+#endif
 }
=20
 static inline bool within_module_init(unsigned long addr,
diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
index 0852a537dad4..b09e92f2c78d 100644
--- a/kernel/debug/kdb/kdb_main.c
+++ b/kernel/debug/kdb/kdb_main.c
@@ -2022,8 +2022,11 @@ static int kdb_lsmod(int argc, const char **argv)
 		if (mod->state =3D=3D MODULE_STATE_UNFORMED)
 			continue;
=20
-		kdb_printf("%-20s%8u  0x%px ", mod->name,
-			   mod->core_layout.size, (void *)mod);
+		kdb_printf("%-20s%8u", mod->name, mod->core_layout.size);
+#ifdef CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC
+		kdb_printf("/%8u  0x%px ", mod->data_layout.size);
+#endif
+		kdb_printf("  0x%px ", (void *)mod);
 #ifdef CONFIG_MODULE_UNLOAD
 		kdb_printf("%4d ", module_refcount(mod));
 #endif
@@ -2034,6 +2037,9 @@ static int kdb_lsmod(int argc, const char **argv)
 		else
 			kdb_printf(" (Live)");
 		kdb_printf(" 0x%px", mod->core_layout.base);
+#ifdef CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC
+		kdb_printf("/0x%px", mod->data_layout.base);
+#endif
=20
 #ifdef CONFIG_MODULE_UNLOAD
 		{
diff --git a/kernel/module.c b/kernel/module.c
index de1a9de6a544..53486a65750e 100644
--- a/kernel/module.c
+++ b/kernel/module.c
@@ -81,7 +81,9 @@
 /* If this is set, the section belongs in the init part of the module */
 #define INIT_OFFSET_MASK (1UL << (BITS_PER_LONG-1))
=20
+#ifndef CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC
 #define	data_layout core_layout
+#endif
=20
 /*
  * Mutex protects:
@@ -108,6 +110,12 @@ static struct mod_tree_root {
 	.addr_min =3D -1UL,
 };
=20
+#ifdef CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC
+static struct mod_tree_root mod_data_tree __cacheline_aligned =3D {
+	.addr_min =3D -1UL,
+};
+#endif
+
 #ifdef CONFIG_MODULES_TREE_LOOKUP
=20
 /*
@@ -183,6 +191,11 @@ static void mod_tree_insert(struct module *mod)
 	__mod_tree_insert(&mod->core_layout.mtn, &mod_tree);
 	if (mod->init_layout.size)
 		__mod_tree_insert(&mod->init_layout.mtn, &mod_tree);
+
+#ifdef CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC
+	mod->data_layout.mtn.mod =3D mod;
+	__mod_tree_insert(&mod->data_layout.mtn, &mod_data_tree);
+#endif
 }
=20
 static void mod_tree_remove_init(struct module *mod)
@@ -195,6 +208,9 @@ static void mod_tree_remove(struct module *mod)
 {
 	__mod_tree_remove(&mod->core_layout.mtn, &mod_tree);
 	mod_tree_remove_init(mod);
+#ifdef CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC
+	__mod_tree_remove(&mod->core_layout.mtn, &mod_data_tree);
+#endif
 }
=20
 static struct module *mod_find(unsigned long addr, struct mod_tree_root *t=
ree)
@@ -249,6 +265,9 @@ static void mod_update_bounds(struct module *mod)
 	__mod_update_bounds(mod->core_layout.base, mod->core_layout.size, &mod_tr=
ee);
 	if (mod->init_layout.size)
 		__mod_update_bounds(mod->init_layout.base, mod->init_layout.size, &mod_t=
ree);
+#ifdef CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC
+	__mod_update_bounds(mod->data_layout.base, mod->data_layout.size, &mod_da=
ta_tree);
+#endif
 }
=20
 #ifdef CONFIG_KGDB_KDB
@@ -1179,6 +1198,17 @@ static ssize_t show_coresize(struct module_attribute=
 *mattr,
 static struct module_attribute modinfo_coresize =3D
 	__ATTR(coresize, 0444, show_coresize, NULL);
=20
+#ifdef CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC
+static ssize_t show_datasize(struct module_attribute *mattr,
+			     struct module_kobject *mk, char *buffer)
+{
+	return sprintf(buffer, "%u\n", mk->mod->data_layout.size);
+}
+
+static struct module_attribute modinfo_datasize =3D
+	__ATTR(datasize, 0444, show_datasize, NULL);
+#endif
+
 static ssize_t show_initsize(struct module_attribute *mattr,
 			     struct module_kobject *mk, char *buffer)
 {
@@ -1207,6 +1237,9 @@ static struct module_attribute *modinfo_attrs[] =3D {
 	&modinfo_srcversion,
 	&modinfo_initstate,
 	&modinfo_coresize,
+#ifdef CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC
+	&modinfo_datasize,
+#endif
 	&modinfo_initsize,
 	&modinfo_taint,
 #ifdef CONFIG_MODULE_UNLOAD
@@ -2209,6 +2242,9 @@ static void free_module(struct module *mod)
=20
 	/* Finally, free the core (containing the module structure) */
 	module_memfree(mod->core_layout.base);
+#ifdef CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC
+	vfree(mod->data_layout.base);
+#endif
 }
=20
 void *__symbol_get(const char *symbol)
@@ -3456,6 +3492,24 @@ static int move_module(struct module *mod, struct lo=
ad_info *info)
 	} else
 		mod->init_layout.base =3D NULL;
=20
+#ifdef CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC
+	/* Do the allocs. */
+	ptr =3D vmalloc(mod->data_layout.size);
+	/*
+	 * The pointer to this block is stored in the module structure
+	 * which is inside the block. Just mark it as not being a
+	 * leak.
+	 */
+	kmemleak_not_leak(ptr);
+	if (!ptr) {
+		module_memfree(mod->core_layout.base);
+		module_memfree(mod->init_layout.base);
+		return -ENOMEM;
+	}
+
+	memset(ptr, 0, mod->data_layout.size);
+	mod->data_layout.base =3D ptr;
+#endif
 	/* Transfer each section which specifies SHF_ALLOC */
 	pr_debug("final section addresses:\n");
 	for (i =3D 0; i < info->hdr->e_shnum; i++) {
@@ -3631,6 +3685,9 @@ static void module_deallocate(struct module *mod, str=
uct load_info *info)
 	module_arch_freeing_init(mod);
 	module_memfree(mod->init_layout.base);
 	module_memfree(mod->core_layout.base);
+#ifdef CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC
+	vfree(mod->data_layout.base);
+#endif
 }
=20
 int __weak module_finalize(const Elf_Ehdr *hdr,
@@ -4597,8 +4654,13 @@ static int m_show(struct seq_file *m, void *p)
 	if (mod->state =3D=3D MODULE_STATE_UNFORMED)
 		return 0;
=20
+#ifdef CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC
+	seq_printf(m, "%s %u", mod->name,
+		   mod->init_layout.size + mod->core_layout.size + mod->data_layout.size=
);
+#else
 	seq_printf(m, "%s %u",
 		   mod->name, mod->init_layout.size + mod->core_layout.size);
+#endif
 	print_unload_info(m, mod);
=20
 	/* Informative for users. */
@@ -4721,13 +4783,20 @@ bool is_module_address(unsigned long addr)
 struct module *__module_address(unsigned long addr)
 {
 	struct module *mod;
+	struct mod_tree_root *tree;
=20
-	if (addr < mod_tree.addr_min || addr > mod_tree.addr_max)
+	if (addr >=3D mod_tree.addr_min && addr <=3D mod_tree.addr_max)
+		tree =3D &mod_tree;
+#ifdef CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC
+	else if (addr >=3D mod_data_tree.addr_min && addr <=3D mod_data_tree.addr=
_max)
+		tree =3D &mod_data_tree;
+#endif
+	else
 		return NULL;
=20
 	module_assert_mutex_or_preempt();
=20
-	mod =3D mod_find(addr, &mod_tree);
+	mod =3D mod_find(addr, tree);
 	if (mod) {
 		BUG_ON(!within_module(addr, mod));
 		if (mod->state =3D=3D MODULE_STATE_UNFORMED)
--=20
2.33.1
