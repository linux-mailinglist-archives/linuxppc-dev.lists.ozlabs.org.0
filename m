Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C506F4962D6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 17:32:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JgQ005TRNz3dlD
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jan 2022 03:32:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::622;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0622.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::622])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JgPy02hDdz30RT
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jan 2022 03:30:48 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mx0GSsd9zn03W/uqdb4POqbmF03Immy7dvoLCMZeHbNZhSXnHgVF02NZ7UkXFb4TYb+KbaCzN00u2mlZSem0NcR1YM9hx0lRqplj2CkzCh1SI8KNbeME1+A1T4sHMA8povdzW1elYu242AOg4QWXPMbIyppDgbADBq6lZ3ttddhvOBRJAIl6HKU5cy42xdJigjIhi8iLwg7yyaZl8A46Tpu0iGgVhphnvEU3BhDWMw6W0GVAJSQZGP1DIxQT71PLysmA094D3Li0JYFtbuD8UVAE3/+DzV1praj9ixCk0wQLqSxU9MM/LECHlcodjDA3ORNHkftxXOpsjV4cTqleTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ocvjjBXwxMiV9qsK/AVe2vSQ+1n2J4ZFmSddURWU7A=;
 b=WYM0Ge8uirqEZ1Wx8S5fKue4YitUZXKT8M9g+Vf/p6B0HKTCvvMK1CM2M98fcQLeegRFUnx77Yrs121nCnyQYrFwKxbFDsGgZaSSS3tjjI2BvIW3GtAAX0uG69SxBUZf/9RUA4BZG4pLE2JiTSEmOuvk8SwHN0O88WR8IlwsFR4Z5ZXuMiBRkhr/4+CdPR6K+qsutGPFb0PtW1lQH1NJukxb97isshPamaWNhNU5OBty3S2BU157eljnG5DoJvXct/SGzpYngWRzW0I+QUFXPZd2a4HrIVeNuNSIdkoT4qyCV+IVGoSi2oxXwjo2ixMtPycwFYGBlyAKlocGBHe7lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR2P264MB0900.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:10::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Fri, 21 Jan
 2022 16:30:27 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5%5]) with mapi id 15.20.4909.008; Fri, 21 Jan 2022
 16:30:27 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 "masahiroy@kernel.org" <masahiroy@kernel.org>
Subject: [PATCH v4 3/5] powerpc/vdso: Merge vdso64 and vdso32 into a single
 directory
Thread-Topic: [PATCH v4 3/5] powerpc/vdso: Merge vdso64 and vdso32 into a
 single directory
Thread-Index: AQHYDuQyiYCJuxHqMUuJ3zj5ZmrJ7Q==
Date: Fri, 21 Jan 2022 16:30:27 +0000
Message-ID: <4dbe05cc130f6a0858d09ac72e436c373cb08b70.1642782130.git.christophe.leroy@csgroup.eu>
References: <c2cbb8f046b7efc251053521dc39b752795e26b7.1642782130.git.christophe.leroy@csgroup.eu>
In-Reply-To: <c2cbb8f046b7efc251053521dc39b752795e26b7.1642782130.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 16d74a92-3eb1-4142-a2ce-08d9dcfb5540
x-ms-traffictypediagnostic: MR2P264MB0900:EE_
x-microsoft-antispam-prvs: <MR2P264MB0900A099DBBDE5A84454A96DED5B9@MR2P264MB0900.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:1107;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OLvOe+Q1L3AdblIUuaElAz61kkxUsLJnXoI1u2SVs8BLxdCtgX4XdlH3XQH4l49xGBmohK8C3c9Hm1s8dCNE//jA4BPNIIbr4o1Pg/E7OtnCL7NgDvvLH4T41oIVEf797ET0fKbmbPAq2IhKgTTfbd3jA/WhHNlNbjCCpIE/pjmKxLVGuVVh1gmsBIYs0F+Uyz0JHQPyhnFnMXEjoMW2w6F/ch/zGsN21y2nmBvyoYtEkOW++MzI+6MwWx34XXcWRWJDpHB7AquJbRcNrr3rdGEjIp10gfC3WD9Aiaq651oA+mcTZ+TGtMhxQO+ffNRbjDZxGlctb/AgYFypAG7xxU7OVqn1XNuI5m0pPvjRpQJmcBleRsafPTwvlhSwE3CdalUp47nhxJk/M82n9v8iJygP0KDXEC1Unw9kkNKvqRL4nW89zQkKaes6t1rPyI/mqgxMfj1g7kIuEADyWPoluSwXKFzSrcNSVCrCvcSPpYRgK+rp5o4Y5IkGVEk7LHn9ASV19ww1x1BA1B7moQkCgsCfRD9L7Ff5WIn0iLBmnm/Uqs2rnFp2G6Lr24v1Jx2hyg+xNMGO8CPfWSn+DuEwLvPUxug7Ij09BJIukwzz6bRr9tU5MhLWavgd9DzE5+PAX6cZaeP5AHP+oMDoGBaUqUzreiqXRsaxsjiYP107TO6Fg7jdE3XdVrjoMfKBM+Z+OPID70lfvOTMAfQD5eq0Lw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(30864003)(76116006)(38100700002)(26005)(2906002)(6512007)(186003)(5660300002)(6486002)(122000001)(2616005)(44832011)(86362001)(91956017)(36756003)(71200400001)(83380400001)(6506007)(8676002)(54906003)(316002)(110136005)(38070700005)(66946007)(508600001)(4326008)(64756008)(8936002)(66446008)(66556008)(66476007)(579004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?JROJ7KQnEUTB9+OtN2K8vW2h9wLRwTyWJ42nWDIe+s5712n3pDvw6zxDcG?=
 =?iso-8859-1?Q?F+VvD1iZoC0mlYzixZHJDU0G3ahYn39wtMWugV+MAurHHnfnOMaumgWK7p?=
 =?iso-8859-1?Q?X7iE2odibtJSvM33xJZ6QXYH0W/VQJgECrpd6xoA6gkxUtKh/NF7Zs7LNE?=
 =?iso-8859-1?Q?5FSz1bsn9k0AbCeQjvCoysvyWmqwoNEyUHdhz5BpM5lU+hAO4FQq6UXJbd?=
 =?iso-8859-1?Q?C1mchm/oNPMlJb/bSIf7QCBgGUJB7g0VzCc68DiM+dzvzugfVmvYmRANzz?=
 =?iso-8859-1?Q?Vsxq1tbci/QK0rhNFZPVRPb4yyytoiY6FxhEp33Y8Ai1C6d62hOzvl6OJ+?=
 =?iso-8859-1?Q?TvGejm7YagQiQAEPrU3BzkI8fK8MfpHE15ugMhKJNI11cSsJeyJR1NSXxB?=
 =?iso-8859-1?Q?BN9T7YgpaBZhJijTGAjq+lDIKTKL0Mh111QaoYyUk1LdQNVpDDbW2ztR1h?=
 =?iso-8859-1?Q?DhQCqu8bMV7iN3U8uLg0awnFIxfaCg/hnGyoveSyWljaOY6WZPjE7q78nY?=
 =?iso-8859-1?Q?jDLClyJFOWcSo5MwaHd3Wg9Uclkuk+3y4tSDjf4n5Xy2hcdrcgEPwxVGli?=
 =?iso-8859-1?Q?iH+pMA/o1opPRuHsqwVOJ1l71KEjPadupUJ/lR3OpI5QLsfXTSle5WdLHR?=
 =?iso-8859-1?Q?MsUs6ufQ2NJutmgJDsvR9WCLrqk5aKOYyINc17ZmFfW4ye4tgboUqkr924?=
 =?iso-8859-1?Q?CnD+ryi72sDq7gSB7vx2ebh0IW7ayYs1RSDVcfzA2oQ0w7KvhGNiS7tvL/?=
 =?iso-8859-1?Q?Fi1uKrJfmNOdJ2vs2xQNBUnHxhucqaSlF67CGdP3usCY7bAX68gSG88hJ/?=
 =?iso-8859-1?Q?NNg8rYm7zMFBcVphFNIpp7yGgiysyYz6zh0MVnBxc0GfUOsSqCjSL5WQ96?=
 =?iso-8859-1?Q?F0SriTSt0ZHVTuPLEH/LdIIJK/z1JvqOey2sw+Si77i8yNLWNyo7txMgG9?=
 =?iso-8859-1?Q?RNJRbYomA1OdMxETG/Z9Tpz9dqWWJ514sFvOX5u/Ya+vbNg4Af6M8812/q?=
 =?iso-8859-1?Q?coxLadKqP7xEFtya/opf13wGTjxnaFEKYXBb9vgVu5buKO4p/ynYVNrkZG?=
 =?iso-8859-1?Q?HiaJnZrqtUGWRNQstvEu55lEO1KHHvgQXJFgb/p5ROe8sFBcVG6KCFthfj?=
 =?iso-8859-1?Q?FT3vSWpOQk8Hj9VR+W/87cA2SHr56m9N5Ob3zzR6kfmszxXlyjJUaJatWQ?=
 =?iso-8859-1?Q?VXiJrHNrcfcLHz8WnslcArov5M/n4afdiRI50goEjZL618YBhL/eT+25id?=
 =?iso-8859-1?Q?Ub6YTHNSSblZOnbf3GItsn/aRhQIAZ2I7FmUZfGr+NUytUq0w4Z0hQFY+2?=
 =?iso-8859-1?Q?yjoiOcYvmPQB7uRj03eJUk/vi87Pi6IQiyd4lsr5V5JakBZW4hZ+4Fsdaw?=
 =?iso-8859-1?Q?kQ2b9wEYj0bpcasJf1vGRrt55hi77mFdY9ePCv3K/8cwW4gwTbdyuRRNbX?=
 =?iso-8859-1?Q?zkbdvrAN+ouzS6t3zqlCSKFKZbpjJhwJXhVMa5cC6kFRwmqPgA/lNtbYaZ?=
 =?iso-8859-1?Q?d9Rwx8xyqFo5WzCxdbLatSwJp/oLGgtNwSfox8LVxW3Fe3/lj1QeKxhT9/?=
 =?iso-8859-1?Q?U3pwT0NLmc7lKtGk1KWS1joUn0nAtuumdhETrfKCBuFoDJadvzbh9mVnn2?=
 =?iso-8859-1?Q?eR7zYbfRzLAaTO5dsVsvHUXnTDceC6Ghrb3AsVciL7ck+r5U1O+TACc2wh?=
 =?iso-8859-1?Q?/ug7Pc6KjBJTMOo6dLRWgTK0Aa3VEWNXhHzRHjlzG0eR0K6qRbEcZmVmL7?=
 =?iso-8859-1?Q?2jkRNldKJMB82DW52APQ8kpmc=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 16d74a92-3eb1-4142-a2ce-08d9dcfb5540
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2022 16:30:27.3899 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: unyQB/qGb8AimJk75tojwwdsqh2ZgJZi9OBcMkacLJ5REZgEqj7qrpQo9PQZayQvsz5SPysF1pD9P6tulquxtvZWrsybxzugwrjMXrWOPV0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR2P264MB0900
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
