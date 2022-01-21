Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00FE4495D40
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 11:07:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JgFRB5wKQz3cjh
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 21:07:02 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JgFPf5r2jz30MG
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jan 2022 21:05:42 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ky2yk/KFu+qtSUKaVV5GNPaqvbEoj+1NfLjjbsviUsvkPvep8CfRNR8Ehy8wfzqJWyH+zwYRA21aXM9IZ/zeu1OSUE942GChJBLrIuA+f6R5HVOQAVVxGnn3G75/uoT06iAG/k0fQQn62bL3o1UKf3LS9kuy8RyID4p0J1iPP8dtWfZZ0xHJaL42ysT18UozBR238P2VG9Nx3js9LrQnef6TOaYhsy/z7RiseQhZXKWDtn1XGWHWMZ94L+QQncvUebvjpxmvBjxIx2qnuBYX3zVb0llj/0zSvojl9phSqtBnoG22tc+Sfi9eiaPUCtshgSWKjvWy0dZ+C+Lw94HQ+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ocvjjBXwxMiV9qsK/AVe2vSQ+1n2J4ZFmSddURWU7A=;
 b=eArEHm5PPo+UqrIg/AfH55hcJs9PaMy8lISE2/S2dLaMpmd28L7W2rw9wifyuk6e8xCkz7xWj0QouRsntOa5gDq7FAp0WaUogqPK9H5efa57mz9OkY9yG29Yc6A7TWmoXVMbH8bd/O+xfTWiLuflWu62zepD+Z4rfM2YRqLnpE6o8uUj8rZ7N1NFR5yP8cQ8u/aXq1DGTVxOb3PJJqDrN44tEuwkVxW1wQd6rvKHuby4UE55L/FHsdtozq4NDoOyEZ1Jt9y3URUJfhMeWbUd5Ouu7vEcW/VyxmB1oXmTVVwe67MReZjnJs9b/wsVOkIL3fW6QPqAFg37nr6yZNbR7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB1918.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:192::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Fri, 21 Jan
 2022 10:05:25 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5%5]) with mapi id 15.20.4909.008; Fri, 21 Jan 2022
 10:05:25 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 "masahiroy@kernel.org" <masahiroy@kernel.org>
Subject: [PATCH v3 3/5] powerpc/vdso: Merge vdso64 and vdso32 into a single
 directory
Thread-Topic: [PATCH v3 3/5] powerpc/vdso: Merge vdso64 and vdso32 into a
 single directory
Thread-Index: AQHYDq5oUgK3Ovd0e0GTagvZ74R8Kg==
Date: Fri, 21 Jan 2022 10:05:25 +0000
Message-ID: <4dbe05cc130f6a0858d09ac72e436c373cb08b70.1642759506.git.christophe.leroy@csgroup.eu>
References: <c2cbb8f046b7efc251053521dc39b752795e26b7.1642759506.git.christophe.leroy@csgroup.eu>
In-Reply-To: <c2cbb8f046b7efc251053521dc39b752795e26b7.1642759506.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fda12f02-6079-4bb0-689c-08d9dcc58b6d
x-ms-traffictypediagnostic: PR1P264MB1918:EE_
x-microsoft-antispam-prvs: <PR1P264MB1918CB15B53D54FEA0079ABAED5B9@PR1P264MB1918.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:1107;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SzjjagoyGaHF2bziIAK6GObPBMYJLPm6MMH/7kD65INmAlCHn+5j8ZSdjn9SlDAwrtrRx/2DOyxfo376puMedq/2kFMNijsgHaxt2iKyBKmwmrExsy70LiaApr21RbrriWkogp9oozQ1WXRs8Mp1S5oVKJM3DAtrUhDXX+3HRGSPcOYUFaiMA4I5IDYjzQlteq7uOMdzd4zMZ6IA5JdstP3gGh6qdypWgEbRIiKfWV2CuwhOJ2tIaHVWZ+tlZM5M8RexJMdKefUJQ5hlkHboos1BrN3LQiTsHgCVB88uObjgttJ4cp9JBo2CD7DSKdFmnVR+a1JSX0CLCdA58BABCa9JOx7/h/bl6j597XqnCOfoT6dtg+FxpNT3v+aT1Fbt6uYkTMZy1vFV9Mqq68dxBlpMQ44bQRRAV7W7dNlfsWNc/clkBxndHjn8uPP7vsNnmarr0fRlN9bU2JTrvG949r6ECB+7jUga+HVLOI9xgb4hYGwB4bAnbGBjTdHMMSHU16Cev+H4AxCmMppv7hwWwDn4HYlsSzh06rJqSgWr5j2+oBwP24rrg1dXO30djE+u6z4g8/35mifyEFVbZuDgfpNRSXAhOepsWx17ZzRwu875a1UCsFsMBXz/b7/QA0PisWulJcF4VH/3J3BWHa8a1vPvshBuZqFTMklGQ19ZQXNFxIBFvCtnv6aRFRPzoH3977/TonQruWBp7ZCikfmVaA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(5660300002)(66446008)(30864003)(122000001)(6486002)(38100700002)(110136005)(54906003)(64756008)(316002)(76116006)(91956017)(4326008)(66946007)(6512007)(66476007)(66556008)(2616005)(44832011)(71200400001)(508600001)(8936002)(2906002)(6506007)(8676002)(36756003)(38070700005)(86362001)(83380400001)(26005)(186003)(579004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?vXi0jBeeVJ854qgjvH06nVt8Go4XX72oY7cVvGSCqN7JLlPgLuv1eFZpCq?=
 =?iso-8859-1?Q?Zrbd+GtcUokmgiv0Ppv1XoLZLf9Vm1NgXEegeg966ZdRhJujsA3crNIOqX?=
 =?iso-8859-1?Q?JPuZKprzAWGJDTWnVL1yyJv0bjTVTYOLwtBlgB45OIALyuI9wl+yE9wR/A?=
 =?iso-8859-1?Q?V1VatfC7sp6phJE5MeW8QO1aY+F6r1Y+mYUsDzhiYdvz2ysV1wG1rzp4ZR?=
 =?iso-8859-1?Q?pim/UcHz9D+zeu8s7l69SphLgzCG6q6sJZvqTOZz9T7ewDo+IaFny5yJrr?=
 =?iso-8859-1?Q?k/AlURYI9Hka6g8luo1RI91Zoc3KydCpnzsDSEx3JQrHp4brUMZI43mzIw?=
 =?iso-8859-1?Q?GlkZpb6PMHDRXTiFQMm6Rco2JLfu8aArut959aaHNqkUhxpkdx28lAssrf?=
 =?iso-8859-1?Q?dkb9fESNIwO6zew6uwCEdeR/NexLTtn4iF9WVc8UTfUwtr1Az5ritR9mS9?=
 =?iso-8859-1?Q?49dAzvQ2h8Uu9WMRPteo9b0FSChMG9mEIra/Obq/MnSbhzFDBnP42geD9R?=
 =?iso-8859-1?Q?xuwPtQZNVgDiTjWOrDH0z3Db3ZaJWdGTvdbHL9WlMAkT54NHTRM015VWbe?=
 =?iso-8859-1?Q?e1qloLmJ1ErDWrNN4ELS7HtRkLpSGEbeI/xZJsKi9PyyafHWhY1sPLAfBq?=
 =?iso-8859-1?Q?YKcNJjXyJE1HJGQ36NZ/RdAFFFFOde907nr313FhM5Ra8amNke2Kq2ZXQO?=
 =?iso-8859-1?Q?RdlzDINTyonhmy8qC5hLwipXTjgy1gdnREPB6bKXNn1sPjN0XvdOV+2RcO?=
 =?iso-8859-1?Q?Q+wyV7Mob5dQnB+hhP2dhLOO5Ic5pmyBiqVmsV3ZMVKHnLe42V3XI7dasC?=
 =?iso-8859-1?Q?RThZrKRmXx98hT3V9R1oWPQrr6xiqNF+VKbmTNRBH652zmq8YS90CFg1bu?=
 =?iso-8859-1?Q?ChqmcjkeepDq1zkKtRJd5AurNGwQ+Y1qWXC6pm2FXx+GIOH+U8fVMgGk7a?=
 =?iso-8859-1?Q?8emJX8zXb8r1L9pbkqa2I9VzVIORD2SI2l3v4saOJms1UmwtqSwB9ti8lz?=
 =?iso-8859-1?Q?FdbGzP+/KZBDfwzT9KatuOG7LPPdYYhcqci+ZOa7JPXTfCoNJuKCA0/LIa?=
 =?iso-8859-1?Q?kVx6cGroHcgzvE/6MRGYXKhBigq87BTJNVN2GC3qaQjhyjKtSv58rm80VX?=
 =?iso-8859-1?Q?8bL3AVzL2thzM7q4k9uBLM8HPU/pd8v0jJN0VFe7m1sMoE9Zy7AITyqYuV?=
 =?iso-8859-1?Q?cbK8ws9IgaD3K9J4n7bdEolPwrih4W9dX7dFihVfM4ugaWee6koFGtq+KO?=
 =?iso-8859-1?Q?MF9nXS2/M72Wg9Zy3EIILsEFLRnTQgRAzEkxUcrJmQzVXVCEoZ2LnRqBun?=
 =?iso-8859-1?Q?lsFSXwfjb2qzNQi0uhw4yEgHaisjoJpo3LB0KLF7WC2YadLmuQ6CYPLa4P?=
 =?iso-8859-1?Q?I65TkNX6TBb9ZAmQXUVgEJJNPyME4VgfXsSq7mH00quGAJOn+E4zzkRNAY?=
 =?iso-8859-1?Q?XuJU05YwnvphBQY8DzU0/u/NJz7kaZf4s5rJPm9E4QA8YzPN5Zq+nAvFgD?=
 =?iso-8859-1?Q?IvJAVUHZZy/Bqtra9VNa2f/bf/4E9iaQauEU4j60JTzrewrtsdZQtMo3M3?=
 =?iso-8859-1?Q?heCsD181M4x4odrujN2XzNlFzGgSv/bMWqDKyo/R4b1fOcwPX6zVorYjIV?=
 =?iso-8859-1?Q?J0muih4PaOMRYNjRzXOuivuddoJpBujIZGwMSk0l7LZT1Ujf7jgLzLw9DJ?=
 =?iso-8859-1?Q?pAelBGaBh8BhJL0OdQVPxzX3gmQplm2EQeo4PRHuHXWNFklUIlGRTGCzH/?=
 =?iso-8859-1?Q?5Jc+UP+9B43wKKaS8vWFoJIbM=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: fda12f02-6079-4bb0-689c-08d9dcc58b6d
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2022 10:05:25.4726 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vidohtRG95GB0W0gVeaTQlkMxEd8h7WIz21H7aZ2gO2qDpM7iHEtsmEEqDqowUJoWTJEALXwKF4L5sUsjYhtxvBfwkndsd33qiUM3LiE8iI=
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

merge vdso64 into vdso32 and rename it vdso.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/Makefile                         |  4 +-
 arch/powerpc/kernel/Makefile                  |  6 +-
 .../kernel/{vdso64 =3D> vdso}/.gitignore        |  2 +
 arch/powerpc/kernel/{vdso32 =3D> vdso}/Makefile | 35 +++++++++
 .../kernel/{vdso32 =3D> vdso}/cacheflush.S      |  0
 .../kernel/{vdso32 =3D> vdso}/datapage.S        |  0
 .../{vdso32 =3D> vdso}/gen_vdso32_offsets.sh    |  0
 .../gen_vdso64_offsets.sh}                    |  0
 arch/powerpc/kernel/{vdso32 =3D> vdso}/getcpu.S |  0
 .../kernel/{vdso32 =3D> vdso}/gettimeofday.S    |  0
 arch/powerpc/kernel/{vdso32 =3D> vdso}/note.S   |  0
 .../kernel/{vdso32 =3D> vdso}/sigtramp32.S      |  0
 .../{vdso64/sigtramp.S =3D> vdso/sigtramp64.S}  |  0
 .../kernel/{vdso32 =3D> vdso}/vdso32.lds.S      |  0
 .../kernel/{vdso64 =3D> vdso}/vdso64.lds.S      |  0
 .../kernel/{vdso32 =3D> vdso}/vgettimeofday.c   |  0
 arch/powerpc/kernel/vdso32/.gitignore         |  3 -
 arch/powerpc/kernel/vdso32_wrapper.S          |  2 +-
 arch/powerpc/kernel/vdso64/Makefile           | 56 --------------
 arch/powerpc/kernel/vdso64/cacheflush.S       | 75 -------------------
 arch/powerpc/kernel/vdso64/datapage.S         | 59 ---------------
 arch/powerpc/kernel/vdso64/getcpu.S           | 33 --------
 arch/powerpc/kernel/vdso64/gettimeofday.S     | 58 --------------
 arch/powerpc/kernel/vdso64/note.S             |  1 -
 arch/powerpc/kernel/vdso64/vgettimeofday.c    | 29 -------
 arch/powerpc/kernel/vdso64_wrapper.S          |  2 +-
 26 files changed, 44 insertions(+), 321 deletions(-)
 rename arch/powerpc/kernel/{vdso64 =3D> vdso}/.gitignore (72%)
 rename arch/powerpc/kernel/{vdso32 =3D> vdso}/Makefile (56%)
 rename arch/powerpc/kernel/{vdso32 =3D> vdso}/cacheflush.S (100%)
 rename arch/powerpc/kernel/{vdso32 =3D> vdso}/datapage.S (100%)
 rename arch/powerpc/kernel/{vdso32 =3D> vdso}/gen_vdso32_offsets.sh (100%)
 rename arch/powerpc/kernel/{vdso64/gen_vdso_offsets.sh =3D> vdso/gen_vdso6=
4_offsets.sh} (100%)
 rename arch/powerpc/kernel/{vdso32 =3D> vdso}/getcpu.S (100%)
 rename arch/powerpc/kernel/{vdso32 =3D> vdso}/gettimeofday.S (100%)
 rename arch/powerpc/kernel/{vdso32 =3D> vdso}/note.S (100%)
 rename arch/powerpc/kernel/{vdso32 =3D> vdso}/sigtramp32.S (100%)
 rename arch/powerpc/kernel/{vdso64/sigtramp.S =3D> vdso/sigtramp64.S} (100=
%)
 rename arch/powerpc/kernel/{vdso32 =3D> vdso}/vdso32.lds.S (100%)
 rename arch/powerpc/kernel/{vdso64 =3D> vdso}/vdso64.lds.S (100%)
 rename arch/powerpc/kernel/{vdso32 =3D> vdso}/vgettimeofday.c (100%)
 delete mode 100644 arch/powerpc/kernel/vdso32/.gitignore
 delete mode 100644 arch/powerpc/kernel/vdso64/Makefile
 delete mode 100644 arch/powerpc/kernel/vdso64/cacheflush.S
 delete mode 100644 arch/powerpc/kernel/vdso64/datapage.S
 delete mode 100644 arch/powerpc/kernel/vdso64/getcpu.S
 delete mode 100644 arch/powerpc/kernel/vdso64/gettimeofday.S
 delete mode 100644 arch/powerpc/kernel/vdso64/note.S
 delete mode 100644 arch/powerpc/kernel/vdso64/vgettimeofday.c

diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index 5f16ac1583c5..ddc5a706760a 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -421,9 +421,9 @@ ifeq ($(KBUILD_EXTMOD),)
 prepare: vdso_prepare
 vdso_prepare: prepare0
 	$(if $(CONFIG_VDSO32),$(Q)$(MAKE) \
-		$(build)=3Darch/powerpc/kernel/vdso32 include/generated/vdso32-offsets.h=
)
+		$(build)=3Darch/powerpc/kernel/vdso include/generated/vdso32-offsets.h)
 	$(if $(CONFIG_PPC64),$(Q)$(MAKE) \
-		$(build)=3Darch/powerpc/kernel/vdso64 include/generated/vdso64-offsets.h=
)
+		$(build)=3Darch/powerpc/kernel/vdso include/generated/vdso64-offsets.h)
 endif
=20
 archprepare: checkbin
diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index 4d7829399570..4ddd161aef32 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -194,8 +194,8 @@ targets +=3D prom_init_check
 clean-files :=3D vmlinux.lds
=20
 # Force dependency (incbin is bad)
-$(obj)/vdso32_wrapper.o : $(obj)/vdso32/vdso32.so.dbg
-$(obj)/vdso64_wrapper.o : $(obj)/vdso64/vdso64.so.dbg
+$(obj)/vdso32_wrapper.o : $(obj)/vdso/vdso32.so.dbg
+$(obj)/vdso64_wrapper.o : $(obj)/vdso/vdso64.so.dbg
=20
 # for cleaning
-subdir- +=3D vdso32 vdso64
+subdir- +=3D vdso
diff --git a/arch/powerpc/kernel/vdso64/.gitignore b/arch/powerpc/kernel/vd=
so/.gitignore
similarity index 72%
rename from arch/powerpc/kernel/vdso64/.gitignore
rename to arch/powerpc/kernel/vdso/.gitignore
index 84151a7ba31d..dd9bdd67758b 100644
--- a/arch/powerpc/kernel/vdso64/.gitignore
+++ b/arch/powerpc/kernel/vdso/.gitignore
@@ -1,3 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
+vdso32.lds
+vdso32.so.dbg
 vdso64.lds
 vdso64.so.dbg
diff --git a/arch/powerpc/kernel/vdso32/Makefile b/arch/powerpc/kernel/vdso=
/Makefile
similarity index 56%
rename from arch/powerpc/kernel/vdso32/Makefile
rename to arch/powerpc/kernel/vdso/Makefile
index 7d7b38d90ca5..954974287ee7 100644
--- a/arch/powerpc/kernel/vdso32/Makefile
+++ b/arch/powerpc/kernel/vdso/Makefile
@@ -6,6 +6,7 @@ ARCH_REL_TYPE_ABS :=3D R_PPC_JUMP_SLOT|R_PPC_GLOB_DAT|R_PPC=
_ADDR32|R_PPC_ADDR24|R_
 include $(srctree)/lib/vdso/Makefile
=20
 obj-vdso32 =3D sigtramp32-32.o gettimeofday-32.o datapage-32.o cacheflush-=
32.o note-32.o getcpu-32.o
+obj-vdso64 =3D sigtramp64-64.o gettimeofday-64.o datapage-64.o cacheflush-=
64.o note-64.o getcpu-64.o
=20
 ifneq ($(c-gettimeofday-y),)
   CFLAGS_vgettimeofday-32.o +=3D -include $(c-gettimeofday-y)
@@ -15,6 +16,17 @@ ifneq ($(c-gettimeofday-y),)
   CFLAGS_vgettimeofday-32.o +=3D -ffreestanding -fasynchronous-unwind-tabl=
es
   CFLAGS_REMOVE_vgettimeofday-32.o =3D $(CC_FLAGS_FTRACE)
   CFLAGS_REMOVE_vgettimeofday-32.o +=3D -mcmodel=3Dmedium -mabi=3Delfv1 -m=
abi=3Delfv2 -mcall-aixdesc
+  CFLAGS_vgettimeofday-64.o +=3D -include $(c-gettimeofday-y)
+  CFLAGS_vgettimeofday-64.o +=3D $(DISABLE_LATENT_ENTROPY_PLUGIN)
+  CFLAGS_vgettimeofday-64.o +=3D $(call cc-option, -fno-stack-protector)
+  CFLAGS_vgettimeofday-64.o +=3D -DDISABLE_BRANCH_PROFILING
+  CFLAGS_vgettimeofday-64.o +=3D -ffreestanding -fasynchronous-unwind-tabl=
es
+  CFLAGS_REMOVE_vgettimeofday-64.o =3D $(CC_FLAGS_FTRACE)
+# Go prior to 1.16.x assumes r30 is not clobbered by any VDSO code. That u=
sed to be true
+# by accident when the VDSO was hand-written asm code, but may not be now =
that the VDSO is
+# compiler generated. To avoid breaking Go tell GCC not to use r30. Impact=
 on code
+# generation is minimal, it will just use r29 instead.
+  CFLAGS_vgettimeofday-64.o +=3D $(call cc-option, -ffixed-r30)
 endif
=20
 # Build rules
@@ -27,6 +39,8 @@ endif
=20
 targets :=3D $(obj-vdso32) vdso32.so.dbg vgettimeofday-32.o
 obj-vdso32 :=3D $(addprefix $(obj)/, $(obj-vdso32))
+targets +=3D $(obj-vdso64) vdso64.so.dbg vgettimeofday-64.o
+obj-vdso64 :=3D $(addprefix $(obj)/, $(obj-vdso64))
=20
 GCOV_PROFILE :=3D n
 KCOV_INSTRUMENT :=3D n
@@ -38,26 +52,42 @@ ccflags-y :=3D -shared -fno-common -fno-builtin -nostdl=
ib -Wl,--hash-style=3Dboth
 CC32FLAGS :=3D -Wl,-soname=3Dlinux-vdso32.so.1 -m32
 AS32FLAGS :=3D -D__VDSO32__ -s
=20
+CC64FLAGS :=3D -Wl,-soname=3Dlinux-vdso64.so.1
+AS64FLAGS :=3D -D__VDSO64__ -s
+
 targets +=3D vdso32.lds
 CPPFLAGS_vdso32.lds +=3D -P -C -Upowerpc
+targets +=3D vdso64.lds
+CPPFLAGS_vdso64.lds +=3D -P -C -U$(ARCH)
=20
 # link rule for the .so file, .lds has to be first
 $(obj)/vdso32.so.dbg: $(src)/vdso32.lds $(obj-vdso32) $(obj)/vgettimeofday=
-32.o FORCE
 	$(call if_changed,vdso32ld_and_check)
+$(obj)/vdso64.so.dbg: $(src)/vdso64.lds $(obj-vdso64) $(obj)/vgettimeofday=
-64.o FORCE
+	$(call if_changed,vdso64ld_and_check)
=20
 # assembly rules for the .S files
 $(obj-vdso32): %-32.o: %.S FORCE
 	$(call if_changed_dep,vdso32as)
 $(obj)/vgettimeofday-32.o: %-32.o: %.c FORCE
 	$(call if_changed_dep,vdso32cc)
+$(obj-vdso64): %-64.o: %.S FORCE
+	$(call if_changed_dep,vdso64as)
+$(obj)/vgettimeofday-64.o: %-64.o: %.c FORCE
+	$(call if_changed_dep,cc_o_c)
=20
 # Generate VDSO offsets using helper script
 gen-vdso32sym :=3D $(srctree)/$(src)/gen_vdso32_offsets.sh
 quiet_cmd_vdso32sym =3D VDSO32SYM $@
       cmd_vdso32sym =3D $(NM) $< | $(gen-vdso32sym) | LC_ALL=3DC sort > $@
+gen-vdso64sym :=3D $(srctree)/$(src)/gen_vdso64_offsets.sh
+quiet_cmd_vdso64sym =3D VDSO64SYM $@
+      cmd_vdso64sym =3D $(NM) $< | $(gen-vdso64sym) | LC_ALL=3DC sort > $@
=20
 include/generated/vdso32-offsets.h: $(obj)/vdso32.so.dbg FORCE
 	$(call if_changed,vdso32sym)
+include/generated/vdso64-offsets.h: $(obj)/vdso64.so.dbg FORCE
+	$(call if_changed,vdso64sym)
=20
 # actual build commands
 quiet_cmd_vdso32ld_and_check =3D VDSO32L $@
@@ -66,3 +96,8 @@ quiet_cmd_vdso32as =3D VDSO32A $@
       cmd_vdso32as =3D $(VDSOCC) $(a_flags) $(CC32FLAGS) $(AS32FLAGS) -c -=
o $@ $<
 quiet_cmd_vdso32cc =3D VDSO32C $@
       cmd_vdso32cc =3D $(VDSOCC) $(c_flags) $(CC32FLAGS) -c -o $@ $<
+
+quiet_cmd_vdso64ld_and_check =3D VDSO64L $@
+      cmd_vdso64ld_and_check =3D $(VDSOCC) $(c_flags) $(CC64FLAGS) -o $@ -=
Wl,-T$(filter %.lds,$^) $(filter %.o,$^) ; $(cmd_vdso_check)
+quiet_cmd_vdso64as =3D VDSO64A $@
+      cmd_vdso64as =3D $(VDSOCC) $(a_flags) $(CC64FLAGS) $(AS64FLAGS) -c -=
o $@ $<
diff --git a/arch/powerpc/kernel/vdso32/cacheflush.S b/arch/powerpc/kernel/=
vdso/cacheflush.S
similarity index 100%
rename from arch/powerpc/kernel/vdso32/cacheflush.S
rename to arch/powerpc/kernel/vdso/cacheflush.S
diff --git a/arch/powerpc/kernel/vdso32/datapage.S b/arch/powerpc/kernel/vd=
so/datapage.S
similarity index 100%
rename from arch/powerpc/kernel/vdso32/datapage.S
rename to arch/powerpc/kernel/vdso/datapage.S
diff --git a/arch/powerpc/kernel/vdso32/gen_vdso32_offsets.sh b/arch/powerp=
c/kernel/vdso/gen_vdso32_offsets.sh
similarity index 100%
rename from arch/powerpc/kernel/vdso32/gen_vdso32_offsets.sh
rename to arch/powerpc/kernel/vdso/gen_vdso32_offsets.sh
diff --git a/arch/powerpc/kernel/vdso64/gen_vdso_offsets.sh b/arch/powerpc/=
kernel/vdso/gen_vdso64_offsets.sh
similarity index 100%
rename from arch/powerpc/kernel/vdso64/gen_vdso_offsets.sh
rename to arch/powerpc/kernel/vdso/gen_vdso64_offsets.sh
diff --git a/arch/powerpc/kernel/vdso32/getcpu.S b/arch/powerpc/kernel/vdso=
/getcpu.S
similarity index 100%
rename from arch/powerpc/kernel/vdso32/getcpu.S
rename to arch/powerpc/kernel/vdso/getcpu.S
diff --git a/arch/powerpc/kernel/vdso32/gettimeofday.S b/arch/powerpc/kerne=
l/vdso/gettimeofday.S
similarity index 100%
rename from arch/powerpc/kernel/vdso32/gettimeofday.S
rename to arch/powerpc/kernel/vdso/gettimeofday.S
diff --git a/arch/powerpc/kernel/vdso32/note.S b/arch/powerpc/kernel/vdso/n=
ote.S
similarity index 100%
rename from arch/powerpc/kernel/vdso32/note.S
rename to arch/powerpc/kernel/vdso/note.S
diff --git a/arch/powerpc/kernel/vdso32/sigtramp32.S b/arch/powerpc/kernel/=
vdso/sigtramp32.S
similarity index 100%
rename from arch/powerpc/kernel/vdso32/sigtramp32.S
rename to arch/powerpc/kernel/vdso/sigtramp32.S
diff --git a/arch/powerpc/kernel/vdso64/sigtramp.S b/arch/powerpc/kernel/vd=
so/sigtramp64.S
similarity index 100%
rename from arch/powerpc/kernel/vdso64/sigtramp.S
rename to arch/powerpc/kernel/vdso/sigtramp64.S
diff --git a/arch/powerpc/kernel/vdso32/vdso32.lds.S b/arch/powerpc/kernel/=
vdso/vdso32.lds.S
similarity index 100%
rename from arch/powerpc/kernel/vdso32/vdso32.lds.S
rename to arch/powerpc/kernel/vdso/vdso32.lds.S
diff --git a/arch/powerpc/kernel/vdso64/vdso64.lds.S b/arch/powerpc/kernel/=
vdso/vdso64.lds.S
similarity index 100%
rename from arch/powerpc/kernel/vdso64/vdso64.lds.S
rename to arch/powerpc/kernel/vdso/vdso64.lds.S
diff --git a/arch/powerpc/kernel/vdso32/vgettimeofday.c b/arch/powerpc/kern=
el/vdso/vgettimeofday.c
similarity index 100%
rename from arch/powerpc/kernel/vdso32/vgettimeofday.c
rename to arch/powerpc/kernel/vdso/vgettimeofday.c
diff --git a/arch/powerpc/kernel/vdso32/.gitignore b/arch/powerpc/kernel/vd=
so32/.gitignore
deleted file mode 100644
index 824b863ec6bd..000000000000
--- a/arch/powerpc/kernel/vdso32/.gitignore
+++ /dev/null
@@ -1,3 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-vdso32.lds
-vdso32.so.dbg
diff --git a/arch/powerpc/kernel/vdso32_wrapper.S b/arch/powerpc/kernel/vds=
o32_wrapper.S
index 3f5ef035b0a9..10f92f265d51 100644
--- a/arch/powerpc/kernel/vdso32_wrapper.S
+++ b/arch/powerpc/kernel/vdso32_wrapper.S
@@ -7,7 +7,7 @@
 	.globl vdso32_start, vdso32_end
 	.balign PAGE_SIZE
 vdso32_start:
-	.incbin "arch/powerpc/kernel/vdso32/vdso32.so.dbg"
+	.incbin "arch/powerpc/kernel/vdso/vdso32.so.dbg"
 	.balign PAGE_SIZE
 vdso32_end:
=20
diff --git a/arch/powerpc/kernel/vdso64/Makefile b/arch/powerpc/kernel/vdso=
64/Makefile
deleted file mode 100644
index 3c5baaa6f1e7..000000000000
--- a/arch/powerpc/kernel/vdso64/Makefile
+++ /dev/null
@@ -1,56 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-# List of files in the vdso, has to be asm only for now
-
-ARCH_REL_TYPE_ABS :=3D R_PPC_JUMP_SLOT|R_PPC_GLOB_DAT|R_PPC_ADDR32|R_PPC_A=
DDR24|R_PPC_ADDR16|R_PPC_ADDR16_LO|R_PPC_ADDR16_HI|R_PPC_ADDR16_HA|R_PPC_AD=
DR14|R_PPC_ADDR14_BRTAKEN|R_PPC_ADDR14_BRNTAKEN|R_PPC_REL24
-include $(srctree)/lib/vdso/Makefile
-
-obj-vdso64 =3D sigtramp.o gettimeofday.o datapage.o cacheflush.o note.o ge=
tcpu.o
-
-ifneq ($(c-gettimeofday-y),)
-  CFLAGS_vgettimeofday.o +=3D -include $(c-gettimeofday-y)
-  CFLAGS_vgettimeofday.o +=3D $(DISABLE_LATENT_ENTROPY_PLUGIN)
-  CFLAGS_vgettimeofday.o +=3D $(call cc-option, -fno-stack-protector)
-  CFLAGS_vgettimeofday.o +=3D -DDISABLE_BRANCH_PROFILING
-  CFLAGS_vgettimeofday.o +=3D -ffreestanding -fasynchronous-unwind-tables
-  CFLAGS_REMOVE_vgettimeofday.o =3D $(CC_FLAGS_FTRACE)
-endif
-
-# Build rules
-
-targets :=3D $(obj-vdso64) vdso64.so.dbg vgettimeofday.o
-obj-vdso64 :=3D $(addprefix $(obj)/, $(obj-vdso64))
-
-GCOV_PROFILE :=3D n
-KCOV_INSTRUMENT :=3D n
-UBSAN_SANITIZE :=3D n
-KASAN_SANITIZE :=3D n
-
-ccflags-y :=3D -shared -fno-common -fno-builtin -nostdlib \
-	-Wl,-soname=3Dlinux-vdso64.so.1 -Wl,--hash-style=3Dboth
-
-# Go prior to 1.16.x assumes r30 is not clobbered by any VDSO code. That u=
sed to be true
-# by accident when the VDSO was hand-written asm code, but may not be now =
that the VDSO is
-# compiler generated. To avoid breaking Go tell GCC not to use r30. Impact=
 on code
-# generation is minimal, it will just use r29 instead.
-ccflags-y +=3D $(call cc-option, -ffixed-r30)
-
-asflags-y :=3D -D__VDSO64__ -s
-
-targets +=3D vdso64.lds
-CPPFLAGS_vdso64.lds +=3D -P -C -U$(ARCH)
-
-# link rule for the .so file, .lds has to be first
-$(obj)/vdso64.so.dbg: $(src)/vdso64.lds $(obj-vdso64) $(obj)/vgettimeofday=
.o FORCE
-	$(call if_changed,vdso64ld_and_check)
-
-# Generate VDSO offsets using helper script
-gen-vdsosym :=3D $(srctree)/$(src)/gen_vdso_offsets.sh
-quiet_cmd_vdsosym =3D VDSOSYM $@
-      cmd_vdsosym =3D $(NM) $< | $(gen-vdsosym) | LC_ALL=3DC sort > $@
-
-include/generated/vdso64-offsets.h: $(obj)/vdso64.so.dbg FORCE
-	$(call if_changed,vdsosym)
-
-# actual build commands
-quiet_cmd_vdso64ld_and_check =3D VDSO64L $@
-      cmd_vdso64ld_and_check =3D $(CC) $(c_flags) -o $@ -Wl,-T$(filter %.l=
ds,$^) $(filter %.o,$^); $(cmd_vdso_check)
diff --git a/arch/powerpc/kernel/vdso64/cacheflush.S b/arch/powerpc/kernel/=
vdso64/cacheflush.S
deleted file mode 100644
index 76c3c8cf8ece..000000000000
--- a/arch/powerpc/kernel/vdso64/cacheflush.S
+++ /dev/null
@@ -1,75 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * vDSO provided cache flush routines
- *
- * Copyright (C) 2004 Benjamin Herrenschmuidt (benh@kernel.crashing.org),
- *                    IBM Corp.
- */
-#include <asm/processor.h>
-#include <asm/ppc_asm.h>
-#include <asm/vdso.h>
-#include <asm/vdso_datapage.h>
-#include <asm/asm-offsets.h>
-
-	.text
-
-/*
- * Default "generic" version of __kernel_sync_dicache.
- *
- * void __kernel_sync_dicache(unsigned long start, unsigned long end)
- *
- * Flushes the data cache & invalidate the instruction cache for the
- * provided range [start, end[
- */
-V_FUNCTION_BEGIN(__kernel_sync_dicache)
-  .cfi_startproc
-BEGIN_FTR_SECTION
-	b	3f
-END_FTR_SECTION_IFSET(CPU_FTR_COHERENT_ICACHE)
-	mflr	r12
-  .cfi_register lr,r12
-	get_datapage	r10
-	mtlr	r12
-  .cfi_restore lr
-
-	lwz	r7,CFG_DCACHE_BLOCKSZ(r10)
-	addi	r5,r7,-1
-	andc	r6,r3,r5		/* round low to line bdy */
-	subf	r8,r6,r4		/* compute length */
-	add	r8,r8,r5		/* ensure we get enough */
-	lwz	r9,CFG_DCACHE_LOGBLOCKSZ(r10)
-	srd.	r8,r8,r9		/* compute line count */
-	crclr	cr0*4+so
-	beqlr				/* nothing to do? */
-	mtctr	r8
-1:	dcbst	0,r6
-	add	r6,r6,r7
-	bdnz	1b
-	sync
-
-/* Now invalidate the instruction cache */
-
-	lwz	r7,CFG_ICACHE_BLOCKSZ(r10)
-	addi	r5,r7,-1
-	andc	r6,r3,r5		/* round low to line bdy */
-	subf	r8,r6,r4		/* compute length */
-	add	r8,r8,r5
-	lwz	r9,CFG_ICACHE_LOGBLOCKSZ(r10)
-	srd.	r8,r8,r9		/* compute line count */
-	crclr	cr0*4+so
-	beqlr				/* nothing to do? */
-	mtctr	r8
-2:	icbi	0,r6
-	add	r6,r6,r7
-	bdnz	2b
-	isync
-	li	r3,0
-	blr
-3:
-	crclr	cr0*4+so
-	sync
-	isync
-	li	r3,0
-	blr
-  .cfi_endproc
-V_FUNCTION_END(__kernel_sync_dicache)
diff --git a/arch/powerpc/kernel/vdso64/datapage.S b/arch/powerpc/kernel/vd=
so64/datapage.S
deleted file mode 100644
index 00760dc69d68..000000000000
--- a/arch/powerpc/kernel/vdso64/datapage.S
+++ /dev/null
@@ -1,59 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * Access to the shared data page by the vDSO & syscall map
- *
- * Copyright (C) 2004 Benjamin Herrenschmuidt (benh@kernel.crashing.org), =
IBM Corp.
- */
-
-#include <asm/processor.h>
-#include <asm/ppc_asm.h>
-#include <asm/asm-offsets.h>
-#include <asm/unistd.h>
-#include <asm/vdso.h>
-#include <asm/vdso_datapage.h>
-
-	.text
-
-/*
- * void *__kernel_get_syscall_map(unsigned int *syscall_count) ;
- *
- * returns a pointer to the syscall map. the map is agnostic to the
- * size of "long", unlike kernel bitops, it stores bits from top to
- * bottom so that memory actually contains a linear bitmap
- * check for syscall N by testing bit (0x80000000 >> (N & 0x1f)) of
- * 32 bits int at N >> 5.
- */
-V_FUNCTION_BEGIN(__kernel_get_syscall_map)
-  .cfi_startproc
-	mflr	r12
-  .cfi_register lr,r12
-	mr	r4,r3
-	get_datapage	r3
-	mtlr	r12
-	addi	r3,r3,CFG_SYSCALL_MAP64
-	cmpldi	cr0,r4,0
-	crclr	cr0*4+so
-	beqlr
-	li	r0,NR_syscalls
-	stw	r0,0(r4)
-	blr
-  .cfi_endproc
-V_FUNCTION_END(__kernel_get_syscall_map)
-
-
-/*
- * void unsigned long  __kernel_get_tbfreq(void);
- *
- * returns the timebase frequency in HZ
- */
-V_FUNCTION_BEGIN(__kernel_get_tbfreq)
-  .cfi_startproc
-	mflr	r12
-  .cfi_register lr,r12
-	get_datapage	r3
-	ld	r3,CFG_TB_TICKS_PER_SEC(r3)
-	mtlr	r12
-	crclr	cr0*4+so
-	blr
-  .cfi_endproc
-V_FUNCTION_END(__kernel_get_tbfreq)
diff --git a/arch/powerpc/kernel/vdso64/getcpu.S b/arch/powerpc/kernel/vdso=
64/getcpu.S
deleted file mode 100644
index 12bbf236cdc4..000000000000
--- a/arch/powerpc/kernel/vdso64/getcpu.S
+++ /dev/null
@@ -1,33 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- *
- * Copyright (C) IBM Corporation, 2012
- *
- * Author: Anton Blanchard <anton@au.ibm.com>
- */
-#include <asm/ppc_asm.h>
-#include <asm/vdso.h>
-
-	.text
-/*
- * Exact prototype of getcpu
- *
- * int __kernel_getcpu(unsigned *cpu, unsigned *node);
- *
- */
-V_FUNCTION_BEGIN(__kernel_getcpu)
-  .cfi_startproc
-	mfspr	r5,SPRN_SPRG_VDSO_READ
-	cmpdi	cr0,r3,0
-	cmpdi	cr1,r4,0
-	clrlwi  r6,r5,16
-	rlwinm  r7,r5,16,31-15,31-0
-	beq	cr0,1f
-	stw	r6,0(r3)
-1:	beq	cr1,2f
-	stw	r7,0(r4)
-2:	crclr	cr0*4+so
-	li	r3,0			/* always success */
-	blr
-  .cfi_endproc
-V_FUNCTION_END(__kernel_getcpu)
diff --git a/arch/powerpc/kernel/vdso64/gettimeofday.S b/arch/powerpc/kerne=
l/vdso64/gettimeofday.S
deleted file mode 100644
index d7a7bfb51081..000000000000
--- a/arch/powerpc/kernel/vdso64/gettimeofday.S
+++ /dev/null
@@ -1,58 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * Userland implementation of gettimeofday() for 64 bits processes in a
- * ppc64 kernel for use in the vDSO
- *
- * Copyright (C) 2004 Benjamin Herrenschmuidt (benh@kernel.crashing.org),
- *                    IBM Corp.
- */
-#include <asm/processor.h>
-#include <asm/ppc_asm.h>
-#include <asm/vdso.h>
-#include <asm/vdso_datapage.h>
-#include <asm/asm-offsets.h>
-#include <asm/unistd.h>
-#include <asm/vdso/gettimeofday.h>
-
-	.text
-/*
- * Exact prototype of gettimeofday
- *
- * int __kernel_gettimeofday(struct timeval *tv, struct timezone *tz);
- *
- */
-V_FUNCTION_BEGIN(__kernel_gettimeofday)
-	cvdso_call __c_kernel_gettimeofday
-V_FUNCTION_END(__kernel_gettimeofday)
-
-
-/*
- * Exact prototype of clock_gettime()
- *
- * int __kernel_clock_gettime(clockid_t clock_id, struct timespec *tp);
- *
- */
-V_FUNCTION_BEGIN(__kernel_clock_gettime)
-	cvdso_call __c_kernel_clock_gettime
-V_FUNCTION_END(__kernel_clock_gettime)
-
-
-/*
- * Exact prototype of clock_getres()
- *
- * int __kernel_clock_getres(clockid_t clock_id, struct timespec *res);
- *
- */
-V_FUNCTION_BEGIN(__kernel_clock_getres)
-	cvdso_call __c_kernel_clock_getres
-V_FUNCTION_END(__kernel_clock_getres)
-
-/*
- * Exact prototype of time()
- *
- * time_t time(time *t);
- *
- */
-V_FUNCTION_BEGIN(__kernel_time)
-	cvdso_call_time __c_kernel_time
-V_FUNCTION_END(__kernel_time)
diff --git a/arch/powerpc/kernel/vdso64/note.S b/arch/powerpc/kernel/vdso64=
/note.S
deleted file mode 100644
index dc2a509f7e8a..000000000000
--- a/arch/powerpc/kernel/vdso64/note.S
+++ /dev/null
@@ -1 +0,0 @@
-#include "../vdso32/note.S"
diff --git a/arch/powerpc/kernel/vdso64/vgettimeofday.c b/arch/powerpc/kern=
el/vdso64/vgettimeofday.c
deleted file mode 100644
index 5b5500058344..000000000000
--- a/arch/powerpc/kernel/vdso64/vgettimeofday.c
+++ /dev/null
@@ -1,29 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Powerpc userspace implementations of gettimeofday() and similar.
- */
-#include <linux/time.h>
-#include <linux/types.h>
-
-int __c_kernel_clock_gettime(clockid_t clock, struct __kernel_timespec *ts=
,
-			     const struct vdso_data *vd)
-{
-	return __cvdso_clock_gettime_data(vd, clock, ts);
-}
-
-int __c_kernel_gettimeofday(struct __kernel_old_timeval *tv, struct timezo=
ne *tz,
-			    const struct vdso_data *vd)
-{
-	return __cvdso_gettimeofday_data(vd, tv, tz);
-}
-
-int __c_kernel_clock_getres(clockid_t clock_id, struct __kernel_timespec *=
res,
-			    const struct vdso_data *vd)
-{
-	return __cvdso_clock_getres_data(vd, clock_id, res);
-}
-
-__kernel_old_time_t __c_kernel_time(__kernel_old_time_t *time, const struc=
t vdso_data *vd)
-{
-	return __cvdso_time_data(vd, time);
-}
diff --git a/arch/powerpc/kernel/vdso64_wrapper.S b/arch/powerpc/kernel/vds=
o64_wrapper.S
index 1d56d81fe3b3..839d1a61411d 100644
--- a/arch/powerpc/kernel/vdso64_wrapper.S
+++ b/arch/powerpc/kernel/vdso64_wrapper.S
@@ -7,7 +7,7 @@
 	.globl vdso64_start, vdso64_end
 	.balign PAGE_SIZE
 vdso64_start:
-	.incbin "arch/powerpc/kernel/vdso64/vdso64.so.dbg"
+	.incbin "arch/powerpc/kernel/vdso/vdso64.so.dbg"
 	.balign PAGE_SIZE
 vdso64_end:
=20
--=20
2.33.1
