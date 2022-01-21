Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F290495D3F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 11:06:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JgFQg0Kzxz3cWt
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 21:06:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::62a;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on062a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::62a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JgFPf20Vyz30MG
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jan 2022 21:05:42 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eALRC9qGsErYd5GB5XsBc/X4UwQJKWklJGIng2QXf9tTeAold4FlH8M4cryKeQUBIdpAjtS7iNL+IFJwBexu3RaqeCsmb4bheTOxr9xE7estNQmM1reaIN7GDXuVPq7aWeRAk72qVNlX+ie/szPhlqnIMYhwj9I4+etsO0COrsDfcr4R2fABul+XZAT7v2GKhJMtyNwcmsefnrAdmr/mm8myzMw/T0FdhaXRw5G+f7r9aPor1z/VENBhGVRCveQXRfUoSSs3PnVKEW1iPjkMqab+h18hOxX/xyARIJBQT2FTq6N8lk+D7TKflPpdUUODuwIGP5uuf7jHhruVaxcG0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s2uoIMr7ouwSiiTxtmQ00wCzL0EFew1/CqzIpuCx3MU=;
 b=E0/vIFVbko2LsFifq6Ka3SO4qObKrXZBcl1PLlD/uZK6SUahspEgxgiUWtrHcSR1qd2TbxsqHOuDCmZpZVQXq5/YVTCTR4xstJSU6aaZ7C4D0cYY1S16syHuJ8bgCskdAvi21G9eZxNEj5oXVYMTdC1VgeKsy1fI6M3w+0YehpHI3GrtCKkT804tw3pNybCSfaRvIoEtV0TE8K+jLLMFbFIcWC5rfZ7beMjSOrL8Y4oIwOcFk4VF3fufqLPkp1dOFxoYC1v1uFkIu7fGlo3e+RIpqk8oUg41gtAgJncWX1mY332+RyOKDOZoRH2RMDW6fOsJjVwyuw4Xpdp4sgfGjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB1918.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:192::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Fri, 21 Jan
 2022 10:05:21 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5%5]) with mapi id 15.20.4909.008; Fri, 21 Jan 2022
 10:05:20 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 "masahiroy@kernel.org" <masahiroy@kernel.org>
Subject: [PATCH v3 2/5] powerpc/vdso: Rework VDSO32 makefile to add a prefix
 to object files
Thread-Topic: [PATCH v3 2/5] powerpc/vdso: Rework VDSO32 makefile to add a
 prefix to object files
Thread-Index: AQHYDq5mLA4ldPFnTEuWkVk4nUh2lA==
Date: Fri, 21 Jan 2022 10:05:20 +0000
Message-ID: <0c421b704a57b228e75a891512568339c53667ad.1642759506.git.christophe.leroy@csgroup.eu>
References: <c2cbb8f046b7efc251053521dc39b752795e26b7.1642759506.git.christophe.leroy@csgroup.eu>
In-Reply-To: <c2cbb8f046b7efc251053521dc39b752795e26b7.1642759506.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5fbfb85d-fe08-405f-dde8-08d9dcc588b4
x-ms-traffictypediagnostic: PR1P264MB1918:EE_
x-microsoft-antispam-prvs: <PR1P264MB1918A88A49D46C57E858FB37ED5B9@PR1P264MB1918.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:1013;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: evTIchMb4l1/K6zqY/rWYTmihgrWzxyvCAcfu8Hq5R/XgjAx96gyWw76dWPs/rWDVFDmLSws3kCeHHfYioKqbMX8e/A2DcLikn7dOm0M9G8XzbILnUTCgc/szIJc9sXhRUQ71Pb06pApE0YLNcGf9MOUZz83UdU1XcdcmUyC/CeiO359+yw2K1+BFrH6mmRQRBrD9E8uKvpUQL/o47e7C7i+lApMVaPX4tF1dwITNnN3AoXmj+ZCzRhniSoy6RKrV4IwOgZyHp4dqZSSMrEaTABJxqfi+sCxvHdgIlb7xuMlZzgHkCFIlJwD5NeAVCKF4mG6hTeJ0B6tFc5uS/DRWuWz68TVbdOI9bx/U74WLZM+IpdVhwsKBsumu0PAR9D/4KE+eGvNKd8jXKSAsRWLyqCGbvaUnSAOwvmgMSTDucLfjh0+pihYWxMK4Dc27ZbDgZrXiC4VwB1JMCbH2rIrWNOFhzkFrfRlbEbONgz0OqJd4s+n6FYkk+RCPqHmBlG+GgaXfNJD/cHU1mGHC3o6JgUb/sWEuOTdswDj/4LS26ZkyZ2JVIaW3KyhjeKr6llDJgpaeLz+Ra5fuBy3zCY4DPaIiKjNd7LVG6sg2Sg29PpopR+cmgsFCm8vxsRknUV0QYUbgCni1EdAYw/voUWXsSUy72jyQskXe/Jp4WX530mYol1JJ/65T2iNiCk5afdBkUuLy9Psmf58YX2S9SoTmg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(5660300002)(66446008)(122000001)(6486002)(38100700002)(110136005)(54906003)(64756008)(316002)(76116006)(91956017)(4326008)(66946007)(6512007)(66476007)(66556008)(2616005)(44832011)(71200400001)(508600001)(8936002)(2906002)(6506007)(8676002)(36756003)(38070700005)(86362001)(83380400001)(26005)(186003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?TTT+MD7ZfDViEIl0HtuxvVYtjreOag+s7dob1mMGakHpsDntdwFJjhiAA1?=
 =?iso-8859-1?Q?gQybNQA0oou5qgD0BAbun+t2S19G+djqZq/IBs7EVDygMkyCkUi8kS2VFn?=
 =?iso-8859-1?Q?goVQyCnV+cHDU1Y0ZssguD5iDuB2JVF19cXmwH1DpHAuTspnLmVHteZDJp?=
 =?iso-8859-1?Q?NA3gjBxBc04OZqrOVlU53UEOMkvnNOAGEnr766pBaJ7kkEnDtwxkmXsqni?=
 =?iso-8859-1?Q?YAW5V/yad6ZvxPrk6MjyHYF4jTfF+4WCMK/jMsVVTBmBG+bCD6T1umKrHx?=
 =?iso-8859-1?Q?uKOBFbV+DCWuMNNji0Vr4YQVF6EDvQWhBA0LaAWvNAnwXAcmTJ3E1hApN1?=
 =?iso-8859-1?Q?C/0IS+0lVjYaS9HyVHnPkuN2VU4XfGUVz9Nl7M/C7PEQXTavjzXXBUKESz?=
 =?iso-8859-1?Q?K8fL/YPyHP/nkMoFOsX0iIcQAOZbJStVUH9du1kpee8BJCRTwPJ5Nsphu+?=
 =?iso-8859-1?Q?KtFb1ZSqrdeL1o79pqTrMmQQZCZFSlW1ix+DQ0uJYfIS2i3FTNxTgyWM4a?=
 =?iso-8859-1?Q?zRBLpIoXo98qPYBKp+56/NscDjn5JrciL1B6I3F6HtCIJQJpBQosgkOOcx?=
 =?iso-8859-1?Q?dml8pPf7ts53JIGgwxGvfp95sQhfFBxXsjERcQLcwEP89ahMYtMJRbn9Uy?=
 =?iso-8859-1?Q?HJAcUwHUrLThyM0Vk1NNgyrWw/bvd1xVJG8V6NIazz2QHoGuIeIQe8nvT3?=
 =?iso-8859-1?Q?cBTW8UX6mkIqUeZIGFZptsZTg+Gyb3xva+twwVvjs81mFDfq/LRFKuBYsD?=
 =?iso-8859-1?Q?JjJx1dZMLb7Yg91ZgxBPk0WKefUzUDEGifakHN6z7FMCqk5l4/6NhSzyKA?=
 =?iso-8859-1?Q?LXg4PbhIEIGkT67p8oQICSPX+GsMgznl78HO1aFrATcJ6RqH9/1FDgFZvB?=
 =?iso-8859-1?Q?WID0pkwiHpRowAXMDMwfX1NA1NB3yOp258qa5Zj7vDQP843yX4KaYOkO7A?=
 =?iso-8859-1?Q?CChLPmGn6lrux1huBJPJHTAEhuRBlieLm4/biTc2UXc5mzo18ZWO44F/Xu?=
 =?iso-8859-1?Q?R5KHp2eFWxXVAfRD2m8p1T9AHuvHq3PIfS6K8JbFtMRiM5pZsa9Es1jPSk?=
 =?iso-8859-1?Q?rGaho+XzpN8ot0tySZRYKgvxYQkfG9O/WkMxFVXZbUwaOxEdDgRMw9MQz6?=
 =?iso-8859-1?Q?j2I7hR7LNH0IpMJLU5a+J3rBwLvYwNeNw75xPP1cyN689qVmaui/QRhhp8?=
 =?iso-8859-1?Q?SC2ztzf6mUpe+NJjmYyyehxrwpM7VAy0XO4zWuw1XHPkvzKyAokJmcV6WQ?=
 =?iso-8859-1?Q?ZDNIhw7XLEqKdyrV87P2FjSWFXZCJWjQhgFDS14M/MkWO+MkZefpNIJ1Yq?=
 =?iso-8859-1?Q?tjd3OefrlZoilOT9Ppjj+Tv0rV25yQVb26enIdtdVT0gi6D8czoikvUV+z?=
 =?iso-8859-1?Q?f7itUA2YDL4GI93/9425fZ/7nyWiM7gdhaIXLyVXY7GrPKpmz7NiK2Ru1s?=
 =?iso-8859-1?Q?Op07LrcDbgLLGhNzN9dvJah6itYWE0Cog1M9CjETdp3v9rgMsU9oajjiY4?=
 =?iso-8859-1?Q?D1KdCqJm1MkjL89gAd3eiwLL5qXmZSPYRulNXtHdWPxA4k4QfQTBCTfhuR?=
 =?iso-8859-1?Q?cmbZziYLzlJi6reTcmjOJEjyoZiOZM40Zyg6GtGICttsSj/qfm3l08fbW7?=
 =?iso-8859-1?Q?aqxmOSfoWZHlTcIPNL+To2Q7EDJit5/KhTGOdvEacOhPI2h17RNcgVWxqk?=
 =?iso-8859-1?Q?04WbKURonRdpxqPBgOLgxMH2UbDUCl7z5/n7herGnkoqXMdPo4lYeJDEf2?=
 =?iso-8859-1?Q?a/Gw1YmVxEqwmt0Y4Ptxro3JQ=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fbfb85d-fe08-405f-dde8-08d9dcc588b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2022 10:05:20.9077 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FQ3wM0QDuxZ0Yp/6L2cOvYAM3W71M/qSnC43/pZfzRwynKlwo4yode3ssa8KOjx3YKKZ3HLUOlOoHU9zaIQFcjS8b1yR+/tHiRbSlgDfvAE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB1918
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
