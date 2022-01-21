Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF4F4962D0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 17:31:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JgPyS0B5Mz3bbP
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jan 2022 03:31:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::629;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0629.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::629])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JgPxz65WQz30QS
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jan 2022 03:30:45 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dqDl+Q7I7l7APW7B9E617mfPcnZX4cAV6pxK579PrJqavBaflB/r3XFcIsEyAocpC8TSxT3ZqrmP6Im2E1OoDIL8oFlvKWmp6rtvsJeViudOnrt/GNdkHHussWiziGr8BjwMbIp2F9mBMiZa3wrd956rRiVtDZQJp/2PcwmnknrcVS1phjcQ+mlo3C/bK7TQ0ZpuPgAVWq2HdCfVPwo1Xy5tWPSAfhdHRZbdIagREKMdUIMFPGgk1uhX6ZWpp9uggwf/zb5S7ZmYQ/DIUip6pY8ODfWg0rPBaXFMFJDT9ztIhoyU/ycL5C1RJ8NlAGl8PROlTbh3MQOPGz831q9V3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s2uoIMr7ouwSiiTxtmQ00wCzL0EFew1/CqzIpuCx3MU=;
 b=eCqWP44nsBwXq5cm9/xzAMKWhXNOs0nxau/reX0vETOz7ysT+xNvhfrSz3fWPP1z1I9S8CFIrEJrjXqm8pLX2P4IELmj64aebeGbCrx4TIysUJGl2mrztc/ikzd7/8NxNOesDNx+WxixrViDYZeX3uloSVtgi51Kzzr+rYRX+on6Du7rRpDzr/+do0ZHdiyOUOsrgJv9hv+5O3zKTysY5xTSALCKDnK0OYXeX7T1xAEf+wLw7Pf2apP7lBYwPdWCjtKyPgLLB+4d/L1g38Hou5Mmb4/xDQxGYe+lDRxcMWlXel7g03dHwCeZOgBOfzf+SAYiiH/Lu0FJBNljdWFN1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB3436.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:14b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Fri, 21 Jan
 2022 16:30:24 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5%5]) with mapi id 15.20.4909.008; Fri, 21 Jan 2022
 16:30:24 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 "masahiroy@kernel.org" <masahiroy@kernel.org>
Subject: [PATCH v4 2/5] powerpc/vdso: Rework VDSO32 makefile to add a prefix
 to object files
Thread-Topic: [PATCH v4 2/5] powerpc/vdso: Rework VDSO32 makefile to add a
 prefix to object files
Thread-Index: AQHYDuQwc7FEdN27b06YHATBao+VCA==
Date: Fri, 21 Jan 2022 16:30:23 +0000
Message-ID: <0c421b704a57b228e75a891512568339c53667ad.1642782130.git.christophe.leroy@csgroup.eu>
References: <c2cbb8f046b7efc251053521dc39b752795e26b7.1642782130.git.christophe.leroy@csgroup.eu>
In-Reply-To: <c2cbb8f046b7efc251053521dc39b752795e26b7.1642782130.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b346de70-d48b-47f2-90a6-08d9dcfb533d
x-ms-traffictypediagnostic: PR0P264MB3436:EE_
x-microsoft-antispam-prvs: <PR0P264MB34365AA5ED70A8A36FB88ECBED5B9@PR0P264MB3436.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:1013;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TyywOvy/ESFMdVJqTw3euuk6DvMxEc4GxMGksUc5VXqNAyzF7NdMTuw3Ktq0D3LNHlIC69E8K3IMjJNh+ie8Y8CPTMdpklorveCkD/5Mzn8hTNJQxPkiGmNFqIyJaEMnAhMQrstugm+LWlOaoVanvw3Um7yuSkuVMhi1PyIFBUnWTttlIEiCxvx/puULUP4IpkMDhMC9RfDsIfHevxdP7GVBXMUnIoVPI3e2pJSd2Bd8PnqJgmJXLjoKqI4ADT4R8RdkLn565rgblD2Fiiq23a+pADVUbiZvSc+FplhXSPEUAdgmnLW09dGn/G3AbsMUvA1hRrugJaiNsntyyt44hgDzFfTT9PeAMKmT/Rz/8tLFOM/JCbyYke85s2VsvL5M/6+TOwmofw3wdIUsJd1GZIWd9rQG0h2bdmeTrnx1aXEL+6lyld/bgANuTHuJrWpjpWpkLkDQWbJKpkepLgPvqs/95+LCzx+Jm0qroNt1D+6pglc9/QJTxXs+byU2mhzU3ZQ3zLEPgeCC2kFLuMUTmtbq0oYB0IPmqAgZ6cggySph9XRKDCoEX1rUqhP6OYho0wg11XEXEe1VPmZWKcOpldkp5ELCAfiOZk3n531+q5+gEBkHTk85crR3v9IHEz7zvyGr4L4K17nQtS1+GgmBHbI4IibgnyKk+rDEeFEvfvc2rkU16qZckflun5nVBZfKZSrvt/LgQrCaO7jt2Rn/hQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(44832011)(36756003)(5660300002)(64756008)(38070700005)(6486002)(4326008)(66446008)(186003)(66476007)(66556008)(66946007)(91956017)(86362001)(6506007)(83380400001)(38100700002)(2906002)(54906003)(110136005)(122000001)(71200400001)(316002)(508600001)(6512007)(8676002)(8936002)(76116006)(26005)(2616005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?ZsAwJzYD6HvUnNI6VPGBhJqOp5eWfqZi+CWqc1cFyXXFFudwZazprS+F1S?=
 =?iso-8859-1?Q?6n0fQkra39pxcUSowX0knFUwgi2H+Mr9XRusYiF0ih6sel3yQFMOuAowMa?=
 =?iso-8859-1?Q?tUCwqm1F6qSmEgbdXwKcSHSCC7Pocgit0r5EIAt7B9kp8pIrAI5jyXVMI8?=
 =?iso-8859-1?Q?x6mGn4J9RkxqHLBAJcAsTFWMmAsU2YOO4jv1s4A700FNjbfQZ+BqJfRzv1?=
 =?iso-8859-1?Q?HtfjFalHrTTRrz4OwbkjohhS2tWB5fQ15OeFvDwgMktMou+PJb7opYCiBC?=
 =?iso-8859-1?Q?/t1hULPDELmmdTOXVc/5boI3vV8NOiAVdQw18lUu362W8KPbTgxlLQVF7O?=
 =?iso-8859-1?Q?NywNN4X2Hh/UzXVdvic6BOl7DkTSp7zbbl79I8glTBfDgpJ4JRaZpJd4f1?=
 =?iso-8859-1?Q?xRGeln4R3eiy6bPTc2U+lbw8UpN2eCkn3HijdCrF8bS7BfGsRJ/6vpqISW?=
 =?iso-8859-1?Q?sD2dYttZZ9Xv/8R4i3mg1CSgpzMNSmhUrsDCoak75fcgHJttCW2QLcH9UX?=
 =?iso-8859-1?Q?VlCy5x0suryNrL4m6c66Ak14yYQ2mZZ3tpAJtcD7nyWJIrudJJjTIz8Wze?=
 =?iso-8859-1?Q?5Yn1LuSpjjgb3MeJZAH+FZs99JJrvItXLPTS9kjn8TJM39JcPb7QBXmtmy?=
 =?iso-8859-1?Q?REjxrZfIDkugd5Xw5qtlow86xhKaVnzwxAX6eizq3h/zJcLdvSZP4SnbR2?=
 =?iso-8859-1?Q?y2N5lfkxFGJximZPDvBeYWRQsReNuZtoXELSGcnOOWrNrA70nfehTYIufb?=
 =?iso-8859-1?Q?kaSSM/pAXRVAwMhSHrGs6aDkIMv5TWnACkfpytahBP9rdFDfsmmHFCcL6y?=
 =?iso-8859-1?Q?6zH0XbA5CeD0Fj723ylVoonVFzW9drC5ovPvV5GMVPbKE8oNDCUlUqek3M?=
 =?iso-8859-1?Q?DzKrt/ujDIzkwv4Da8sNDHtluxdOQjyAtrjrll8WUkknF6roJX6bLU87dh?=
 =?iso-8859-1?Q?vzHykO9EZRNnDO3diBrLngE452isSF78Ah6ORJv/qAcUGedxsRfSF2ApCk?=
 =?iso-8859-1?Q?CBUP7pDWZYuC3V+YwDZtwDRHkEoONex3oKnkox1MCiHLq3x3YCzpcj6ykC?=
 =?iso-8859-1?Q?Q6C+IOM1XVUeNq4QxQrhNMMIjGigFp/imYMl+ap/UCLwhQxTChLi2GidQU?=
 =?iso-8859-1?Q?IDa9Bp3NMTSNZfrXY6JNtIzgN1K3vH8Ucw4m1SLFrOFQwUp2TAAbBEH3Lo?=
 =?iso-8859-1?Q?uWKLqe69KPNLH9oHiwrBSFrMe87KwYqX5xmxVryLI8dasemf2ArKk45bCx?=
 =?iso-8859-1?Q?V02Eog80CCGiqWeMBsmjx+OB56pFO03CpGV8+ActNye84M1Xcb4soSGurp?=
 =?iso-8859-1?Q?mftmDk57Yb0XNQ7Xc1lNooY/lguZxlkmobTSbSifZQJ+KfyVaSwKQndn4/?=
 =?iso-8859-1?Q?IErqQVot/QX2pFWVHXUAqaEHecwEgNpjehv0ZIXdFDCMMZQjNw5L59CzDR?=
 =?iso-8859-1?Q?Cqujegn/v8HXexLY1QrwulAtxkTuIp03KqWlf/PajCB7vxLNBwPSFtHqfZ?=
 =?iso-8859-1?Q?ItXpTORn5nxeufEa5e78G+Ekxj5n5BidLDZIhOgX+EpyIcC1iyKxM4Rmu9?=
 =?iso-8859-1?Q?8cuz84gY+1DChWg3qwNcU3Iqgt7UXa4x1937ucozjD1Hq7aadPttW5rfti?=
 =?iso-8859-1?Q?6L8o8zG4J+bRS/pRbk+K4kKERg9C0CU2HN/IqUPUkiLzMiWC4qi6ZawNlR?=
 =?iso-8859-1?Q?xQVx8nMtElYB/9FoB2jm+wMcMkyO1dTJntI2xD9Qi4MyYWgjnPsqIc1mWu?=
 =?iso-8859-1?Q?7vGDDrlbnQabuBjG9T7XT92j0=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b346de70-d48b-47f2-90a6-08d9dcfb533d
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2022 16:30:24.0144 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yNZdjACymelN/9S+jpxwPgjgjJr+B4wq68+v5mH71jWSF72/jCdHf1QeLoKUrN6mnPR2aIRi8ZNpZ/IRHs+PICytsv6a+QCXM7UBjaM/Tps=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB3436
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
