Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 78DBB49E0E7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 12:30:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jkz0K2zvfz3dd6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 22:30:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::61d;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on061d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::61d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JkyyF5VFWz2xtw
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jan 2022 22:28:21 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cxTTqcQUfYNDQhOT8fCTdRsyzFbx0i6b2lnIrI5pAAy74+7OJQGK/bloCTtiDgcPan3fS1TlfC2gh0dMJmgraAi6Bt7Um+DfarqMtK7xjWPWrt3/JmRO67qd8wgEH/LTZ2VykCzf9Qd4fQohaHSci9DZ3yjE/Sxw8RE18D61RHj3ta8Gag8nlQMkI7qOGiZ5EDp4PMEIOpS14DF1jSSsVUzuxhB6HvARnRB05IJ2jLNzHb83/t08QwvHU+n/QerAfl0mw9bA5KwHX9rriUvoh63c+H5z+1/Mvn8NDej57vTPQ6Utj+Ge2gqQsTEQ7JOADUzeAk5uPTRlGZ3EIOskfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ftrm5PnfxSN6TFaYpNBsboVG1Y+OovC2x1ldoaop11Q=;
 b=To8TaXNqdLcahm465+5ticGSmw2GvZ4VNWr9HyEx7gz7/Hwn8gIUSNqDgus9fhlJ9QgBkrn0384GGn3A//WYpYEEXenlGw0Ti5LYwBpk8QftFvxgF7N+SIjVWoA6/wl8SgGBv6ZO6CbU2Gi4OYZPeKEW+T0Zj2TtqBZXbXWXsHjnKctzxcFbi3n9/8XEY1W3stsGqxLHGhdYI8OqPSakz45rI4kmYQylO7Ib9lRBgUX/7xuiB+2DFm72R/B24jvduZpRRq5H2lxSScB5sfWErETXjuyzVdmmM9Uh3AQ1GlWQB85COciWjeaadzDFAE8dfGZCooLXjTT24hTka931Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB3227.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:30::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Thu, 27 Jan
 2022 11:28:09 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c9a2:1db0:5469:54e1]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c9a2:1db0:5469:54e1%6]) with mapi id 15.20.4930.017; Thu, 27 Jan 2022
 11:28:09 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Luis Chamberlain <mcgrof@kernel.org>, Jessica Yu <jeyu@kernel.org>
Subject: [PATCH v2 4/5] modules: Add CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC
Thread-Topic: [PATCH v2 4/5] modules: Add
 CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC
Thread-Index: AQHYE3D1Z7Rpwj2GuUCO1fMCdk3yhA==
Date: Thu, 27 Jan 2022 11:28:09 +0000
Message-ID: <af8519537d2a5c36b71a2f48ba9b81c07c93a5c4.1643282353.git.christophe.leroy@csgroup.eu>
References: <cover.1643282353.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1643282353.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5a9629b8-3d6b-48e5-fa16-08d9e188186d
x-ms-traffictypediagnostic: MRZP264MB3227:EE_
x-microsoft-antispam-prvs: <MRZP264MB32278D64453DEEA35FB42A2FED219@MRZP264MB3227.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jowYzr2s8tmK5SrzXvi7c4METlRlN+yTSnVoRtW1GzN48shyYC90eTfGDAZnQom8WcfJg7GJs1fKRe2SshcGT+sC1jiosa+ZR2eukZhmNIf4DOJzbnQ6cewohqoe+YlXWNIPRA7AfVLbyZw1+2hJXEQ/FuWRpquT34W5h7J0TYnIXiBFAO/BMvZ3YVddf1CVRelgOHYIyw8k/V3LB2a76z7hBEErYwZ5fGFWu5sAsgdGmW+1F9rJMs6Ux88VN9pV5Kb+bZnGv3Qcm8DSmSVwh8TP44Vl3BiI2CBnVWBuKFZiw6NEzR5BX3ZD1af4rwB8877U/3F9nC013wgavQAetXBrskkyAxJ0iaaOuQkUaB5fGVij/18V/1rRA/qj+GJm56FJZJuqGcPJEMhsyX4CkIX6JarLgiLoF7HwI5FUp/2LsL50yQ7ZOFfJYYFa8aXmFEkNPhXgtDBcTCLNGtJY/2Fx7b6LAfNmVLFYn7hqyfQyzi8CLshCiarG5mwZ0aZyMxhG2tF3L+l+1reK8Ik1xYO8lh+4EjPU0IfJJvHgQq3OoDkeDQDZrW89oiCp+jgS4a04SpVO60F0/x8eTuudXvu7LJVz2O7rxYGsdTzfDr6+/uuxPkM0KaKcrsFz3KcJ6HxB2J0XdITBfD27tG/LZfxKo31T8T7DywtvZpelXlcP2YVJctephdUXXuoM7LT6/dGxR2BAoFF+eY0aoPpfjw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(86362001)(316002)(66946007)(6506007)(6512007)(76116006)(508600001)(66476007)(5660300002)(66446008)(66556008)(91956017)(44832011)(4326008)(64756008)(7416002)(8936002)(8676002)(2616005)(36756003)(6486002)(71200400001)(38070700005)(2906002)(83380400001)(122000001)(26005)(186003)(38100700002)(110136005)(54906003)(20210929001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?e/dsWD90LPN8Kj+5rd6KDvwhIWanfJcEVjo9X1gC+QMJiRN12CydejPmg7?=
 =?iso-8859-1?Q?NpeP1lwDsO2I2PsWU92zYuzgtcHL31/+zvuTqGBYoYCQxr67deTS1LNHHq?=
 =?iso-8859-1?Q?z0gz3Gqqgf+WtDPh3Q+RAHINsQYcd/gTVcAXzaKK4Z+SifPwU9jIzE3a83?=
 =?iso-8859-1?Q?keZOgcUvvzJE8PBtQ96ixL9F6CNjkyo1HYqdhaXqYI1sMICJRx+Srdjpt8?=
 =?iso-8859-1?Q?eGhyDaw1+0dHSuPloRAArgGncmd5UlkCWZ7DcSsOSF1vpRvcoDyuG4IDSl?=
 =?iso-8859-1?Q?M7Uu4M4mMNS4GlC5bjLO6DWM2SXSMiPXhTk+ROzx6BYoeD01hvQSSY2ZRz?=
 =?iso-8859-1?Q?6AMDeAp5uUiTf3vMZOgvV3fnYkhUIVwFivN0CwvsyGEVO8yLbdRm13YPhR?=
 =?iso-8859-1?Q?Miqe/xN7k2p4LvSii+8crgZh1E7XTMuh6CkbI+9BLG8SGeM0DhQRh5nmBE?=
 =?iso-8859-1?Q?F5WW6MKMnu2WduneaBvCfGw24/jAzw8i36p2RsxpajYEXYCdhnFcKRmnAN?=
 =?iso-8859-1?Q?BNP6YJUo/lweCqQNMkTK1HKmi00jpI+jla5M2yxWGM+7y0OpGJ2HnoBTUG?=
 =?iso-8859-1?Q?NfEsL1lcdwzcd/mJHhPbdQTOXaENuMqvEKrNE/fqvmkR8yujfa6SnrcEXc?=
 =?iso-8859-1?Q?J/NzIRzry9EW3g+LvGBVS/1nP9X9bjLCtc2QcTK+7uFD1VHeMjQdQL9PwZ?=
 =?iso-8859-1?Q?RidGUqqZP0xIWkOH+2xXraXQP7DXr9iuhBdBO3EiptapeFB0mbRNWfQtZZ?=
 =?iso-8859-1?Q?pPVDFL5YHCG3R/aGVvJUcImcyxctj45p9bdBtdDCl7y2uNsvG6bmU6lCoF?=
 =?iso-8859-1?Q?wNV2P0SJnDC5Lvi6VdNJeBapFv5qweEHQem25Lyy9jrYdDdD8OTpFbnKR0?=
 =?iso-8859-1?Q?syWKEpgHUtoNJqWZzm1ykjxOyXyQT7K4FXWCPfe8+0LxwjASJM+xPhEQHd?=
 =?iso-8859-1?Q?qisdSQZMNXpsiaOW9ixiOGk1/HDbsbw7Ev1nJcq3hucdgs7wf9QNSJStYa?=
 =?iso-8859-1?Q?iUfGd3dNX8kVqdmmUmdz/WMxdcUNdWybtACD9krxPWPtmTbTN1/jN23hCd?=
 =?iso-8859-1?Q?bf/zUp6HItIIYfyTjYxR0bSaaUGEwn2NpmIMbXXOGiEpL/jwgQLvEuK2f1?=
 =?iso-8859-1?Q?5UU8rb0XYdoZuDigI63x/xWdCeWnAQvqopGVV0MqbtCGEg0jGcvErwbssn?=
 =?iso-8859-1?Q?OMUtEicVyLzeL3C5KWPXMTAZzC3RzIpc52tF2ky9cinVtHF6zKrHNon93b?=
 =?iso-8859-1?Q?NeZOrglpXH6/K0MMVSOqHDQJ0D9P0MjAKbahKdVMy6IfsMK43OR3rYGdb+?=
 =?iso-8859-1?Q?lYgg0WZfQuRIdq+MoDv/pbeWwybKkneynd1wFtvQyTLDXGOhlW3PZ4nvP5?=
 =?iso-8859-1?Q?T9CRBFNnikxhNCPDIN4tllHTe5mqNv6l2UTWoX1W7ZMo+2uIO+FRPlI1a7?=
 =?iso-8859-1?Q?IhKyJ+bZk6BJu8m39GanIOxERMaF2ziE8fXCNezdHFjm85j217azPxRz41?=
 =?iso-8859-1?Q?jx/jyg2G7AS/oq3/mPFMZmRdaR0yjzU5dCMKLDsbIpUkXGpTFl4xwGtHjn?=
 =?iso-8859-1?Q?F1RLctVXcfGrjQtPPVfPAbT6pzo8hWlVrdfzfvnDfV+IMDHVP4H4dBXNkk?=
 =?iso-8859-1?Q?n6SZa7XSCSUOfmwJ/pvDPRXJIxzh4o5DmgL3JXkmh0RFRH9rB24uZmQTIT?=
 =?iso-8859-1?Q?88BxjfzpbArAO5qcbExLmLM8X7wHLfu7JY0+cg6HMAFkmPI88SGJb0XPUb?=
 =?iso-8859-1?Q?vch82ZCNmsNhdW03TxJuHXM1o=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a9629b8-3d6b-48e5-fa16-08d9e188186d
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2022 11:28:09.0829 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NdKcHODDUINQJGjyscLlj6MivQQz+MpvUNUDJ7dpbGQgTILLGP2yV6qUM8AwE5ZQUxzTRaaa5GbHjdP3v/i2VYZ8ET49ZeuhUQDcSRNwPfs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB3227
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
index 2b70b997a36d..884c9fb11813 100644
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
@@ -1178,6 +1197,17 @@ static ssize_t show_coresize(struct module_attribute=
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
@@ -1206,6 +1236,9 @@ static struct module_attribute *modinfo_attrs[] =3D {
 	&modinfo_srcversion,
 	&modinfo_initstate,
 	&modinfo_coresize,
+#ifdef CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC
+	&modinfo_datasize,
+#endif
 	&modinfo_initsize,
 	&modinfo_taint,
 #ifdef CONFIG_MODULE_UNLOAD
@@ -2208,6 +2241,9 @@ static void free_module(struct module *mod)
=20
 	/* Finally, free the core (containing the module structure) */
 	module_memfree(mod->core_layout.base);
+#ifdef CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC
+	vfree(mod->data_layout.base);
+#endif
 }
=20
 void *__symbol_get(const char *symbol)
@@ -3459,6 +3495,24 @@ static int move_module(struct module *mod, struct lo=
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
@@ -3634,6 +3688,9 @@ static void module_deallocate(struct module *mod, str=
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
@@ -4612,13 +4669,17 @@ static int m_show(struct seq_file *m, void *p)
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
@@ -4741,13 +4802,20 @@ bool is_module_address(unsigned long addr)
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
