Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2104A30F4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jan 2022 18:04:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JmLJy1qBKz3dgq
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Jan 2022 04:04:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::61f;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on061f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::61f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JmLGw0L9Qz3bSk
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Jan 2022 04:02:32 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B3vmdGU9OT7OB/MYVJaa+tbQvlzwOrT4puKAHnpdn1AiEarF24YZtYxZHXAPCQSFRwhSCaI9GqOkGLDbo/aXvcOEYe0CVEVplZuLTGxp1iHmjHmJIcMoTNlK0FoSeOGEaxcNp9C6mL6GQU3FnHjoaLpNGgmKhv8AIXFIkjuM/qFeyGtRsMGjuXHN1cdXMlQfS2laTY3MWhiju+5EDuOOVVbmJRxh1ynZ3R8Mx7ZVhjAgKG+8XKoZ4FQIgRdLdPYzKtRAyCG9Zm0yIxXPgR+8yRYMqWu39EAp08Tq5re5Z+3OJtCnOzHmsa06V9baN339pOm023dQmVmnTl3nhreSbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=crTqMyovasbkWf6JTa5Z5LTj9nH5kwhkV4dOns1N6Sg=;
 b=RvmlA8m/kH5k7lFEcqcfqcekTY/ENvTpdSiw2b/MNbVW34fF8/CRNJn9n/2XJwBBgPNmyTnSNhjM9zKaOQMhVFFZ7NRRe3yH49OIH32cy34MzoWTNnemwUExthqvf9Q0e6qPSTZe6XPVdYHpyTMd6In+yD1f41K1tLpFQa9yqVyrrkBW5dmVqzt9o9RkD3GewhgDGTb/s7SonoFt24zIcxqmuNIW8nuwUVGXP3tDGp6C5BE7lUxC6sOK+ITJhonX6C9wrTb7hH+RJktgvLj10t4AZhKYrSeRhJxv7W1Nt8aKlLsOTFcIChR/TcAVt2IN12SRLryLaCuZewdahWx8KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2584.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1e3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Sat, 29 Jan
 2022 17:02:10 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c9a2:1db0:5469:54e1]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c9a2:1db0:5469:54e1%6]) with mapi id 15.20.4930.020; Sat, 29 Jan 2022
 17:02:10 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Luis Chamberlain <mcgrof@kernel.org>, Jessica Yu <jeyu@kernel.org>
Subject: [PATCH v3 4/6] modules: Add CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC
Thread-Topic: [PATCH v3 4/6] modules: Add
 CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC
Thread-Index: AQHYFTH0u+jifZZUEUq40HXmKIXLkw==
Date: Sat, 29 Jan 2022 17:02:09 +0000
Message-ID: <b59ed8781ef9af995c5bfa762de1f42fdfc57c74.1643475473.git.christophe.leroy@csgroup.eu>
References: <cover.1643475473.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1643475473.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ddbe221b-971b-47af-40bb-08d9e349168e
x-ms-traffictypediagnostic: PR0P264MB2584:EE_
x-microsoft-antispam-prvs: <PR0P264MB2584A2359B1D9011C8C0D83AED239@PR0P264MB2584.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 81Nogny3zzE33mGpi3yTKAQH4HoJqw+dd7xMQlVBGn78NQBufriYftcyv+o6lTNbI2+9jvHOqJB4bzXrNtd7xJI/dh1H+3rxo4PI12JBto6WqXKcWjOA1ubB/z+mkW8PgTXFVvLSzsbjBbVShmZVQ+FDBKHT4HrfilqPrrFpKQHdRrfKi87S+4F95lWTTewnMDmDBN0wZmuXaBXJIBZRyNoerIHhrhk6dITA4XlNiKP4xZ3LB3hOz85Pe2s19j548yBcLC7NHij2cvBdldxYeUfcjcuaCkybg6EsetAOlecF928CMeuZa7khJq1Z3Y90rLlHoKeypF0UvKCnWXA/tkH444rSgsJLzzOUlf+KRw6OjBddFkqaree9xgcGxU7zBXq/dK3DpIPQKPB+DuqnzQ/4OxIa+3S+BPVMIUJpcIUjy1+yEg/MyjkKLzhdBXdgC2GIhnF05XyOe4yDM3iWUGK9YdQMmr9hJ4ETWmCA6A7snHpvIvuXD+fISQZT/mvkA/tPM3cVvCjVtc4HM7Hm/N86xYgXIjppHrQXscm9Y32k6ScLi4qAd4kMwUUp8/Ik6DzTH3Cc3nGmWr4K5M6VPG7FIe4jS142+P5cfGxUxnf/OEdJN9DHhgyHDAmZ+fTpbubh3NRtWpfzDfzajAO76aS5KJUhmbNsVZD4cxt399r/piJY/Pdpp/AwnKPIj/ET5WU9MB96chmlo1XlUlELAg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(54906003)(110136005)(6512007)(2906002)(86362001)(6486002)(508600001)(4326008)(122000001)(38100700002)(91956017)(316002)(76116006)(26005)(64756008)(6506007)(8936002)(186003)(5660300002)(44832011)(66476007)(66556008)(71200400001)(66946007)(8676002)(66446008)(83380400001)(2616005)(7416002)(36756003)(38070700005)(20210929001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?hPMAGi1c1Tj4eLLUWSODeE45lh04b5tZx4xglgzRiUEY1BAHSyMESF2Rzl?=
 =?iso-8859-1?Q?Heyd7GRzqyagApBOWqSryASrgzawSqD2HRJfYAkd0vWE3k7KnU5IxHVVOT?=
 =?iso-8859-1?Q?rdqr2diBiKyj6llqBF6lQLZ9SGt+PE6hzpmXUL7H++X6dH7n81kCAMfUE8?=
 =?iso-8859-1?Q?XcQcGPb7l8BtX7TTKiSZDNJsPT7YPieu0CwlGKcTJltL/FAh5vn9K6fyPl?=
 =?iso-8859-1?Q?o+3/URTvt87TQf4lIiS0N3zj0pZfnesnMmmm4EliOMgJI7iXwpp8dMbrRw?=
 =?iso-8859-1?Q?60Vu+dfDdRuuSL2cGb0CJXoN0Q0jUcRDSn/un0qhaUt/DpgWblaEwHYgmi?=
 =?iso-8859-1?Q?f/V5HuW38/c1vfQTr/0M0kN3yOtBYf4HI1F3UJD878TW6ljoAwHeFOJf1a?=
 =?iso-8859-1?Q?o99WipA247mEwjTKVzrY2eksbP5zGwy5SuFRh8vAL87xSoMQFpJwS3faEI?=
 =?iso-8859-1?Q?d/FUlNisX1+o2ZoLvinHWDFctLYnnHW6XoqsWoDdjChvpkMfRRBop2ekCg?=
 =?iso-8859-1?Q?fiA01muIgFnUUv4EIyDVjaeJVR3LvUK8t/KN3U/jOeeAd2qS3GfekIWEOQ?=
 =?iso-8859-1?Q?97djFz0vODCBDpvLlM8P5M5K89PAUVKQRLzU4GfypcpJ8BsqIrNedUnfYI?=
 =?iso-8859-1?Q?t4hfvfqGN552FqTZx8QHXhQxxz7Om5p9QbZYJc7XjuGYXE0fEUTnBK2lzs?=
 =?iso-8859-1?Q?CC9t9b1Tn6JcttUVY53wYNMUTSsalQNeKI9GEKAt0HbGkXyHXNSietMNT3?=
 =?iso-8859-1?Q?Pk5vk10TGQq9HN/wSiGOgovtIi3HLJylpcZChB0vLs/SjimC/5XTZQBni3?=
 =?iso-8859-1?Q?4akEGCINURgZoLmFWTIi+jo2U5lsGwzdOdXO/62JLeZYPk+e9XIVHDhi1u?=
 =?iso-8859-1?Q?1Q48SqvgJurCJ9VExxCjX0m+Lv9WYTAY7uYA0f3Z7tam41LtGq7ugIvI+5?=
 =?iso-8859-1?Q?kauxFgr6/V0TgvdYdqY0pYIA6uHFH6E0X7XaYpA55ILRdQY3PmXleONdE3?=
 =?iso-8859-1?Q?FNIkwo7QP+ljeIz8efWyO3NASe4BlEbWc1sODxSTyRmcCZzrlKzUXstuMU?=
 =?iso-8859-1?Q?GyzsSSkh0tmCYEb88zSZgEaDFOxgFx9FStUDGObfikbP5pLocX3q/1ag7u?=
 =?iso-8859-1?Q?uP+HJv4+UmebcfcefoEYcct63h2h3Ufl8CpZGTKiZ0b2p7zKsYf1Wuu8St?=
 =?iso-8859-1?Q?xxmikOtfkyPRhdynU93a2olWB4/TLOFt646LVPPC12ACiWKB7Hu5vAfsvo?=
 =?iso-8859-1?Q?6gEMExbdsvMh2lgisBMCiSTwjz9Ac2aiz6tAlytl4/5JISIOw7WYR6ViuS?=
 =?iso-8859-1?Q?Sal5YGxp3MSNfJg6284I2hy+opcrwAfxLKi+NQmOAkCUhR8MYL/ZSeGK+c?=
 =?iso-8859-1?Q?i6eiDdsA+3qaJwrYsx5VVO9MY3fro/sCq+cbvPx2V71kGwU/c/jwSqRODZ?=
 =?iso-8859-1?Q?0EatbXnx6vygqRuO+iLnwfCBbz68hnN6h2VnuOYVuca/IaU9H/hlK9LGI5?=
 =?iso-8859-1?Q?rjsgntuKB6hBqMdg1FHYA3rZ04PSRTxfpxfvHlObiK2OVaVg3ZDOqTwvf9?=
 =?iso-8859-1?Q?End+6Vlu9c4RXlSCCuHQLw0iWYXujaRLqf5oeVocNhf5jrpvRmSWcR9Aaw?=
 =?iso-8859-1?Q?3aJIACpg5ey2d+xpBopVLLPjYCJSSaFfaHQbkY/N7VW9Khajpp+lXa5sQ2?=
 =?iso-8859-1?Q?CnrZXfDoR0WBI41Tb2kVW+6+k83Mx9e1zd8DLcn8BlNJ517P3lJC7VJm9H?=
 =?iso-8859-1?Q?A4WCPLTT9sRh/EDTk9UReBD9k=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ddbe221b-971b-47af-40bb-08d9e349168e
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2022 17:02:09.9706 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VT5hpRGjfKO5EqpTKSJ+gYAbAc3k48b+eXU06Vv08gaSjQgUfbcWXPRuN2vQ/DNudUHXvH4CTwGl3HBsWUJRJ0dD/j4APEiusCE7tqkCudc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2584
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
Acked-by: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>
---
 arch/Kconfig                |  6 +++
 include/linux/module.h      |  8 ++++
 kernel/debug/kdb/kdb_main.c | 10 ++++-
 kernel/module.c             | 76 +++++++++++++++++++++++++++++++++++--
 4 files changed, 94 insertions(+), 6 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index 678a80713b21..b5d1f2c19c27 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -882,6 +882,12 @@ config MODULES_USE_ELF_REL
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
index 1e135fd5c076..3a892bdcbb5f 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -422,6 +422,9 @@ struct module {
 	/* Core layout: rbtree is accessed frequently, so keep together. */
 	struct module_layout core_layout __module_layout_align;
 	struct module_layout init_layout;
+#ifdef CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC
+	struct module_layout data_layout;
+#endif
=20
 	/* Arch-specific module values */
 	struct mod_arch_specific arch;
@@ -569,6 +572,11 @@ bool is_module_text_address(unsigned long addr);
 static inline bool within_module_core(unsigned long addr,
 				      const struct module *mod)
 {
+#ifdef CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC
+	if ((unsigned long)mod->data_layout.base <=3D addr &&
+	    addr < (unsigned long)mod->data_layout.base + mod->data_layout.size)
+		return true;
+#endif
 	return (unsigned long)mod->core_layout.base <=3D addr &&
 	       addr < (unsigned long)mod->core_layout.base + mod->core_layout.siz=
e;
 }
diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
index 0852a537dad4..85d3fd40b7fe 100644
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
+		kdb_printf("/%8u", mod->data_layout.size);
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
index 11f51e17fb9f..f3758115ebaa 100644
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
@@ -111,6 +113,12 @@ static struct mod_tree_root {
 #define module_addr_min mod_tree.addr_min
 #define module_addr_max mod_tree.addr_max
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
@@ -186,6 +194,11 @@ static void mod_tree_insert(struct module *mod)
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
@@ -198,6 +211,9 @@ static void mod_tree_remove(struct module *mod)
 {
 	__mod_tree_remove(&mod->core_layout.mtn, &mod_tree);
 	mod_tree_remove_init(mod);
+#ifdef CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC
+	__mod_tree_remove(&mod->data_layout.mtn, &mod_data_tree);
+#endif
 }
=20
 static struct module *mod_find(unsigned long addr, struct mod_tree_root *t=
ree)
@@ -252,6 +268,9 @@ static void mod_update_bounds(struct module *mod)
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
@@ -1181,6 +1200,17 @@ static ssize_t show_coresize(struct module_attribute=
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
@@ -1209,6 +1239,9 @@ static struct module_attribute *modinfo_attrs[] =3D {
 	&modinfo_srcversion,
 	&modinfo_initstate,
 	&modinfo_coresize,
+#ifdef CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC
+	&modinfo_datasize,
+#endif
 	&modinfo_initsize,
 	&modinfo_taint,
 #ifdef CONFIG_MODULE_UNLOAD
@@ -2211,6 +2244,9 @@ static void free_module(struct module *mod)
=20
 	/* Finally, free the core (containing the module structure) */
 	module_memfree(mod->core_layout.base);
+#ifdef CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC
+	vfree(mod->data_layout.base);
+#endif
 }
=20
 void *__symbol_get(const char *symbol)
@@ -3462,6 +3498,24 @@ static int move_module(struct module *mod, struct lo=
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
@@ -3637,6 +3691,9 @@ static void module_deallocate(struct module *mod, str=
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
@@ -4615,13 +4672,17 @@ static int m_show(struct seq_file *m, void *p)
 	struct module *mod =3D list_entry(p, struct module, list);
 	char buf[MODULE_FLAGS_BUF_SIZE];
 	void *value;
+	unsigned int size;
=20
 	/* We always ignore unformed modules. */
 	if (mod->state =3D=3D MODULE_STATE_UNFORMED)
 		return 0;
=20
-	seq_printf(m, "%s %u",
-		   mod->name, mod->init_layout.size + mod->core_layout.size);
+	size =3D mod->init_layout.size + mod->core_layout.size;
+#ifdef CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC
+	size +=3D mod->data_layout.size;
+#endif
+	seq_printf(m, "%s %u", mod->name, size);
 	print_unload_info(m, mod);
=20
 	/* Informative for users. */
@@ -4744,13 +4805,20 @@ bool is_module_address(unsigned long addr)
 struct module *__module_address(unsigned long addr)
 {
 	struct module *mod;
+	struct mod_tree_root *tree;
=20
-	if (addr < module_addr_min || addr > module_addr_max)
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
