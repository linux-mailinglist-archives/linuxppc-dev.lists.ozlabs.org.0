Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 584A947F891
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Dec 2021 20:39:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JMWMQ1f6qz30Ph
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Dec 2021 06:39:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::614;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0614.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::614])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JMWLS2fwnz2xKT
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Dec 2021 06:38:24 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cl1XZc5gEK5pj+ajT8wOpmgOgzg84XBETzYGzOmh9WtXOaJOytILSrPd8OaIQFEmj4fnQfv7HzrRly0eTs+T3EEgjPplRfufvrYPJYKdCwShaUIuzDTZzBEmJJ7ejF+WaoPILU/DNz5cjYSs/HuUW/YzK1KNqYvERET36mS6zc4NPFSMEdRP9fAFvE4jZjgKKLaQnhqM4Wz+m+yVbt5tlvXJDTsnVyIzKIOPweJ6O99/gj8XDNMJemi6bj163G1Ccq2poJ9FaiyK7y5sH/8UEInkwztRNRSfxyWULrmP3J3oDeVuZZnsjVBfVSjjY1gjnMDJtu8FXzAklGgl0AYeHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s2uoIMr7ouwSiiTxtmQ00wCzL0EFew1/CqzIpuCx3MU=;
 b=MP1R8FlFq7Ddc18rT6XyiRjKcyrisUM2D0ZaiaZLrbbp8rk3NTkwX1xwxMF9vrMCP55rOddhpj/rzBBx48GlELA5pkTAgq5mnvIYavbm3fAqf939bEaWNMZjTPyQh+MKGzquOgWI4V2l4XI4MkBy26LyQWcCb4JJf2l0FXrpZUaQxLCR/fzxU7qpcquR1pPC0KnotrV0OEjy8NWoXj6nQfuQJ4/2W4BA1qT7qgS6BYkpmTF6KjL89VgkinrRLbqRbXnBduuSgWbbThEauSegSP5YT2NiqNzDfowuMF2dDeFOJ+jRQ/Zwh23VxMntjbD/dTf1wq74wmBVn0QSG/uW3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2233.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:2::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Sun, 26 Dec
 2021 19:38:05 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d%7]) with mapi id 15.20.4823.022; Sun, 26 Dec 2021
 19:38:05 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 "masahiroy@kernel.org" <masahiroy@kernel.org>
Subject: [PATCH v2 2/4] powerpc/vdso: Rework VDSO32 makefile to add a prefix
 to object files
Thread-Topic: [PATCH v2 2/4] powerpc/vdso: Rework VDSO32 makefile to add a
 prefix to object files
Thread-Index: AQHX+pAaSe9JgyppJECjckw0PHd0bw==
Date: Sun, 26 Dec 2021 19:38:05 +0000
Message-ID: <e4cda7fc60e9e3baf09c17a9a681ba2aeff45a83.1640542625.git.christophe.leroy@csgroup.eu>
References: <169b36a06ea63260a5047d4f44f7dbbf8442aabe.1640542625.git.christophe.leroy@csgroup.eu>
In-Reply-To: <169b36a06ea63260a5047d4f44f7dbbf8442aabe.1640542625.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bd70a279-0955-434b-2cab-08d9c8a73cbb
x-ms-traffictypediagnostic: MR1P264MB2233:EE_
x-microsoft-antispam-prvs: <MR1P264MB2233C9F658D3A90E8913B578ED419@MR1P264MB2233.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:1013;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: b3T28RQ1lyg6ybdFAD44oFAFIassgf7/bc8JPDyypGHn8ugWMb4vM3W9SK9NVOCJhOtoo317GfArSndNDqs7V3taeHaLgx638353taysY1wPIZ30dJL6DMwWKhTiK+lCoeU3MsJlKVvXt+JrFZ7gLd3b7By8OU/Ga3pf3B33es6+ko6/mru5qLoguJKJYDGhng8G3tAyZsohOryiqOKwVSlu5VZvAl3vVkvV9yjsBP+7wfS0d1YxwaYCJsiTm317dTe6jsRt1dHa/kiYkliMpqas4bJz70c4LOtIfktgotV/qZYXXP58IFRSTZP7yDOsre7IJtYwScIG3vj8487/celieKL4eQJcmKcCPDe1tTD3rxr2RhplVqX2KBXAWwhfa0Gya1QfrbwmTmyDDg5p0c7M6MsZDN0ljkkMAFHiWl41F7co5KC/blXTrSe/nGaFrzkIiANcFPyvnOJO/sJEUWbuPlMCubRfx6K1cNjgrK5gjo5rUGW7GLP6eFpDXV2K20LzSRwZIzO0qWccWZZnJ9gGEw2LsT59Xo+sNgC3M0MNp91RvHJKvs5aWRL+Xeg+3LumIjXhWTJjLT/VDyIf7CT1rBzMNkDdlGf/297i0eaGUVKvP7BMCUhmTlpuG6toeBxXJZLIwUg9Y/yhE8c0JV2qNAMU7Zv85ztCMHmS4OmJXHXtToSFVs8hgUQ6GQBqbBcTHvqUeHrSWJQ+53j2Ng==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(76116006)(6506007)(4326008)(91956017)(6512007)(44832011)(2616005)(26005)(54906003)(5660300002)(186003)(38100700002)(66476007)(66946007)(36756003)(83380400001)(71200400001)(66446008)(64756008)(86362001)(110136005)(122000001)(66556008)(38070700005)(6486002)(8676002)(316002)(508600001)(8936002)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?48XlDKrghqNRzTd0vrCEbAerQxd1m/YDRluoKM/rkaWYu+F6a0z5yTI9YW?=
 =?iso-8859-1?Q?WtBGaa9M/yOmPVJzaKixygFfRSfS+hhjrTiQYR/Ch+9zbHzGoXGkhelpkW?=
 =?iso-8859-1?Q?UuJFDTMmDD+XTSzqm6Qs3c7zSwVhBzFFpQX4dzpHlbPDGNO6EsiGtrGLRo?=
 =?iso-8859-1?Q?A5ufwdtjlWAK3Gjjd2KmLwiHl5yPBCchKdWacpdPfmTXSaL/vIq3RaEHlW?=
 =?iso-8859-1?Q?kG3YpQntI0tneNNUknfx3DA4GQ7fefvjDZvQLh5wVOvFZd/E7lvuQO/9HO?=
 =?iso-8859-1?Q?OoAeTj4SmCFXiWwKzhFekSo283RIdLw5FWdI2QuLjucwLRuAaQQVwmp+AC?=
 =?iso-8859-1?Q?WIrEpTeaHAkAN9CTi6DeFObzKcdwn2VR9s4FgogcS5Lru1e3foxCePAiLq?=
 =?iso-8859-1?Q?pp6ZXCsIkSUqVBS7zrlLVy2TRv99ptnMUIvlXQ7n5l597ZHwHwz7n7C6Ad?=
 =?iso-8859-1?Q?fyxgJa0rdp3kWu9gSPkma1IiPCA7SaJ4tUq4fVeHmShgCG7FGErjz4qf31?=
 =?iso-8859-1?Q?P2J9WDN6kSL5Gy2UmoqNAqeEyKvc4hs+Rw9F8cZz5zZDrXewvaPuYMs0Wi?=
 =?iso-8859-1?Q?i/uNfxfHKu2JX4DY0+Dxuw1hLeykk5lH10LZCzC8b9LNgFHPu5AOBx5fd7?=
 =?iso-8859-1?Q?N/dxGyUUT5SRq3F+7O3i7+Q93lwMYnW2gAkSPlvzdGRIw5EhtgeFqdRiP2?=
 =?iso-8859-1?Q?SOjodm6ub6m7oU+27afhN7MKS6ZEEcWssjLRMQJgmcJ+lmDcwdxC8gUpSv?=
 =?iso-8859-1?Q?6kXq7zrNk4Mry2yMOGMzjt2TS1mshApVe6GFs+pYGbp/0JXg/gexsu+KbY?=
 =?iso-8859-1?Q?n84sOUlr9ZkFeAEzjLrQ3ZimfDxE++JQ5eN2BFkU4s9Aw1RJdWdWBOY9Mg?=
 =?iso-8859-1?Q?qsMIK5mTwof2k16+0YbexhZamepiYCseYZniKFun64XIp/mDj9B58BHaQ0?=
 =?iso-8859-1?Q?66bgnstHjKbQ8zvhmjbE21qhFz1zxzIQZdOHGbjIO+bnqLbbzcdxLFyklr?=
 =?iso-8859-1?Q?iI5ZxqdmaWrStp5d7J9Z9TAzW39AkCsGLEAcFC+McYbC/nBPXSXenr1I85?=
 =?iso-8859-1?Q?7t3aSPItr37PAWE2m0B7Wz8/XemHWZntYEQP2E6v2NQSmiTiXL71d30Ifd?=
 =?iso-8859-1?Q?genFGdEOY4mAu0dxVB/LBjtG6bPPl4U1es7Kcfs0osW3q19tBp/I6cgQg7?=
 =?iso-8859-1?Q?++bT8e6ENlKfSAlScW7eXQsFFQA3TQqUOfPWN/W87F84S2UMzRHLV1yv75?=
 =?iso-8859-1?Q?97J0ddlA5UNqu/jzWxw7zhpmfsDoqgRYwXm8Ybn+GnNAa0ktCN0WCsXgog?=
 =?iso-8859-1?Q?RMfdwxyrBbEV5RRLVR7OMB32sxgsDPSKN+rzWIDexumFzXOx0adkUACCzb?=
 =?iso-8859-1?Q?KLMbStOlhQde6eJTlnzfmxpQK/wwZkdiAtoCnMm9PLajA4UrxBOAE9dQnh?=
 =?iso-8859-1?Q?epJmd2HeqxwW9ZokS/lJJJXb5OPsliDLtxKF3H7SYYfscpNP/Xrd0o+EWq?=
 =?iso-8859-1?Q?MiK9Gbow/ZcqdQfk2MTs0nIUthgb4tJ0t+UVyoY8T1K+jpKGy09wXC8Kn1?=
 =?iso-8859-1?Q?55XX8PWkVUfvBfAzB2yl1RXoyNmailxFaVjMIUogw50lyApAYvINRQa2oy?=
 =?iso-8859-1?Q?dBFYpJ3ykeIJYhKwbjeR4rpGUfamY2ogi1iLiyFxTUqUqWzMThBsG8LZSb?=
 =?iso-8859-1?Q?57vYeqoMHSHmcKhW7jRcffcouBq8biPrg7t4ZmbJikSvOB83/qlOHeKjT5?=
 =?iso-8859-1?Q?7sPTdq9PcjTqzT2X0vLIAmeS0=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: bd70a279-0955-434b-2cab-08d9c8a73cbb
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Dec 2021 19:38:05.3316 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d0ncXBh9I9fn43e12wd7MBLzq6nv0UReFZzKL9kdgkbhHPx4Dm6jj2fDjEgq7D7r0db8na559za2OvtmBWvfZv2Opemd0GbNJ1Qoq0ASB/U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2233
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

In order to merge vdso32 and vdso64 build in following patch, rework
Makefile is order to add -32 suffix to VDSO32 object files.

Also change sigtramp.S to sigtramp32.S as VDSO64 sigtramp.S is too
different to be squashed into VDSO32 sigtramp.S at the first place.

gen_vdso_offsets.sh also becomes gen_vdso32_offsets.sh

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/vdso32/Makefile           | 47 +++++++++----------
 ..._vdso_offsets.sh =3D> gen_vdso32_offsets.sh} |  0
 .../vdso32/{sigtramp.S =3D> sigtramp32.S}       |  0
 3 files changed, 21 insertions(+), 26 deletions(-)
 rename arch/powerpc/kernel/vdso32/{gen_vdso_offsets.sh =3D> gen_vdso32_off=
sets.sh} (100%)
 rename arch/powerpc/kernel/vdso32/{sigtramp.S =3D> sigtramp32.S} (100%)

diff --git a/arch/powerpc/kernel/vdso32/Makefile b/arch/powerpc/kernel/vdso=
32/Makefile
index 7d9a6fee0e3d..7d7b38d90ca5 100644
--- a/arch/powerpc/kernel/vdso32/Makefile
+++ b/arch/powerpc/kernel/vdso32/Makefile
@@ -5,15 +5,16 @@
 ARCH_REL_TYPE_ABS :=3D R_PPC_JUMP_SLOT|R_PPC_GLOB_DAT|R_PPC_ADDR32|R_PPC_A=
DDR24|R_PPC_ADDR16|R_PPC_ADDR16_LO|R_PPC_ADDR16_HI|R_PPC_ADDR16_HA|R_PPC_AD=
DR14|R_PPC_ADDR14_BRTAKEN|R_PPC_ADDR14_BRNTAKEN|R_PPC_REL24
 include $(srctree)/lib/vdso/Makefile
=20
-obj-vdso32 =3D sigtramp.o gettimeofday.o datapage.o cacheflush.o note.o ge=
tcpu.o
+obj-vdso32 =3D sigtramp32-32.o gettimeofday-32.o datapage-32.o cacheflush-=
32.o note-32.o getcpu-32.o
=20
 ifneq ($(c-gettimeofday-y),)
-  CFLAGS_vgettimeofday.o +=3D -include $(c-gettimeofday-y)
-  CFLAGS_vgettimeofday.o +=3D $(DISABLE_LATENT_ENTROPY_PLUGIN)
-  CFLAGS_vgettimeofday.o +=3D $(call cc-option, -fno-stack-protector)
-  CFLAGS_vgettimeofday.o +=3D -DDISABLE_BRANCH_PROFILING
-  CFLAGS_vgettimeofday.o +=3D -ffreestanding -fasynchronous-unwind-tables
-  CFLAGS_REMOVE_vgettimeofday.o =3D $(CC_FLAGS_FTRACE)
+  CFLAGS_vgettimeofday-32.o +=3D -include $(c-gettimeofday-y)
+  CFLAGS_vgettimeofday-32.o +=3D $(DISABLE_LATENT_ENTROPY_PLUGIN)
+  CFLAGS_vgettimeofday-32.o +=3D $(call cc-option, -fno-stack-protector)
+  CFLAGS_vgettimeofday-32.o +=3D -DDISABLE_BRANCH_PROFILING
+  CFLAGS_vgettimeofday-32.o +=3D -ffreestanding -fasynchronous-unwind-tabl=
es
+  CFLAGS_REMOVE_vgettimeofday-32.o =3D $(CC_FLAGS_FTRACE)
+  CFLAGS_REMOVE_vgettimeofday-32.o +=3D -mcmodel=3Dmedium -mabi=3Delfv1 -m=
abi=3Delfv2 -mcall-aixdesc
 endif
=20
 # Build rules
@@ -24,13 +25,7 @@ else
     VDSOCC :=3D $(CC)
 endif
=20
-CC32FLAGS :=3D
-ifdef CONFIG_PPC64
-CC32FLAGS +=3D -m32
-KBUILD_CFLAGS :=3D $(filter-out -mcmodel=3Dmedium -mabi=3Delfv1 -mabi=3Del=
fv2 -mcall-aixdesc,$(KBUILD_CFLAGS))
-endif
-
-targets :=3D $(obj-vdso32) vdso32.so.dbg vgettimeofday.o
+targets :=3D $(obj-vdso32) vdso32.so.dbg vgettimeofday-32.o
 obj-vdso32 :=3D $(addprefix $(obj)/, $(obj-vdso32))
=20
 GCOV_PROFILE :=3D n
@@ -38,36 +33,36 @@ KCOV_INSTRUMENT :=3D n
 UBSAN_SANITIZE :=3D n
 KASAN_SANITIZE :=3D n
=20
-ccflags-y :=3D -shared -fno-common -fno-builtin -nostdlib \
-	-Wl,-soname=3Dlinux-vdso32.so.1 -Wl,--hash-style=3Dboth
-asflags-y :=3D -D__VDSO32__ -s
+ccflags-y :=3D -shared -fno-common -fno-builtin -nostdlib -Wl,--hash-style=
=3Dboth
+
+CC32FLAGS :=3D -Wl,-soname=3Dlinux-vdso32.so.1 -m32
+AS32FLAGS :=3D -D__VDSO32__ -s
=20
-obj-y +=3D vdso32_wrapper.o
 targets +=3D vdso32.lds
 CPPFLAGS_vdso32.lds +=3D -P -C -Upowerpc
=20
 # link rule for the .so file, .lds has to be first
-$(obj)/vdso32.so.dbg: $(src)/vdso32.lds $(obj-vdso32) $(obj)/vgettimeofday=
.o FORCE
+$(obj)/vdso32.so.dbg: $(src)/vdso32.lds $(obj-vdso32) $(obj)/vgettimeofday=
-32.o FORCE
 	$(call if_changed,vdso32ld_and_check)
=20
 # assembly rules for the .S files
-$(obj-vdso32): %.o: %.S FORCE
+$(obj-vdso32): %-32.o: %.S FORCE
 	$(call if_changed_dep,vdso32as)
-$(obj)/vgettimeofday.o: %.o: %.c FORCE
+$(obj)/vgettimeofday-32.o: %-32.o: %.c FORCE
 	$(call if_changed_dep,vdso32cc)
=20
 # Generate VDSO offsets using helper script
-gen-vdsosym :=3D $(srctree)/$(src)/gen_vdso_offsets.sh
-quiet_cmd_vdsosym =3D VDSOSYM $@
-      cmd_vdsosym =3D $(NM) $< | $(gen-vdsosym) | LC_ALL=3DC sort > $@
+gen-vdso32sym :=3D $(srctree)/$(src)/gen_vdso32_offsets.sh
+quiet_cmd_vdso32sym =3D VDSO32SYM $@
+      cmd_vdso32sym =3D $(NM) $< | $(gen-vdso32sym) | LC_ALL=3DC sort > $@
=20
 include/generated/vdso32-offsets.h: $(obj)/vdso32.so.dbg FORCE
-	$(call if_changed,vdsosym)
+	$(call if_changed,vdso32sym)
=20
 # actual build commands
 quiet_cmd_vdso32ld_and_check =3D VDSO32L $@
       cmd_vdso32ld_and_check =3D $(VDSOCC) $(c_flags) $(CC32FLAGS) -o $@ -=
Wl,-T$(filter %.lds,$^) $(filter %.o,$^) ; $(cmd_vdso_check)
 quiet_cmd_vdso32as =3D VDSO32A $@
-      cmd_vdso32as =3D $(VDSOCC) $(a_flags) $(CC32FLAGS) -c -o $@ $<
+      cmd_vdso32as =3D $(VDSOCC) $(a_flags) $(CC32FLAGS) $(AS32FLAGS) -c -=
o $@ $<
 quiet_cmd_vdso32cc =3D VDSO32C $@
       cmd_vdso32cc =3D $(VDSOCC) $(c_flags) $(CC32FLAGS) -c -o $@ $<
diff --git a/arch/powerpc/kernel/vdso32/gen_vdso_offsets.sh b/arch/powerpc/=
kernel/vdso32/gen_vdso32_offsets.sh
similarity index 100%
rename from arch/powerpc/kernel/vdso32/gen_vdso_offsets.sh
rename to arch/powerpc/kernel/vdso32/gen_vdso32_offsets.sh
diff --git a/arch/powerpc/kernel/vdso32/sigtramp.S b/arch/powerpc/kernel/vd=
so32/sigtramp32.S
similarity index 100%
rename from arch/powerpc/kernel/vdso32/sigtramp.S
rename to arch/powerpc/kernel/vdso32/sigtramp32.S
--=20
2.33.1
