Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B5869CB45
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Feb 2023 13:46:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PL2Gc4RK8z3cHG
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Feb 2023 23:46:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=windriver.com header.i=@windriver.com header.a=rsa-sha256 header.s=PPS06212021 header.b=PWgSNmXd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=windriver.com (client-ip=205.220.178.238; helo=mx0b-0064b401.pphosted.com; envelope-from=prvs=141586787b=paul.gortmaker@windriver.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=windriver.com header.i=@windriver.com header.a=rsa-sha256 header.s=PPS06212021 header.b=PWgSNmXd;
	dkim-atps=neutral
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PL2Fj17dSz3c6V
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Feb 2023 23:45:27 +1100 (AEDT)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31KBiBte016482;
	Mon, 20 Feb 2023 11:59:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=PPS06212021;
 bh=Q07f78IneqA79cx/QSo7AiFjh4TPKDFAMdzSo84d5/g=;
 b=PWgSNmXdKqN6V3NEz9WIo1yfzgw80s9XYtYK4J27Gt1jUmfSNEBmieGj618TIDrPQfzJ
 5lk4qBQ7iXZIFzTPOh50591bX4jd+xluX3Cl31GUHDaHeRO8gSfn6SCAdD7z6BOZDbch
 tHMKJvLJzJi/SFiZyfpcs9WEWXVFQGLfiS14MvWytiWm9+oTnttTIxe2bj5dz8oetIji
 cWEHl4ZWm+2MJjfH5+s9lq8B/hjUNe/Xw2/H6/oOc2yBFbtX7Y4AywUzpKgyp9opJMmQ
 e8ZAjyVuRNK7mz2l7XkprhpSVssNEfFXU14S1/wRQTWJmabKgYkJ+FHnoTWfGfg2oyu3 3w== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ntpd3sntb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 20 Feb 2023 11:59:37 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Mon, 20 Feb 2023 03:59:36 -0800
Received: from sc2600cp.wrs.com (128.224.56.77) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Mon, 20 Feb 2023 03:59:35 -0800
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [RFC PATCH 0/4] Remove some e300/MPC83xx evaluation platforms
Date: Mon, 20 Feb 2023 06:59:09 -0500
Message-ID: <20230220115913.25811-1-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: hLAsScj1aMVG_Xih4yjZuVxBXnVbkuh1
X-Proofpoint-ORIG-GUID: hLAsScj1aMVG_Xih4yjZuVxBXnVbkuh1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-20_08,2023-02-20_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0 malwarescore=0
 mlxlogscore=836 clxscore=1011 lowpriorityscore=0 phishscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302200107
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
Cc: Li Yang <leoyang.li@nxp.com>, Scott Wood <oss@buserror.net>, Paul Gortmaker <paul.gortmaker@windriver.com>, Claudiu Manoil <claudiu.manoil@nxp.com>, Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[This RFC is proposed for v6.4 and hence is based off linux-next.]

This series removes support for four e300 (MPC83xx) Freescale processor
family evaluation boards that were added to the kernel in the 2006 era.

These boards were all of a very similar form factor, a largish PCI or PCI-X
card that could also be used standalone with an external power brick, and
all shared the Modular Development System (MDS) designation.

These platforms were made in limited quantity and were generally designed
to get early silicon into the hands of OEMs who would later develop their
own boards/platforms.  As such, availability was limited to those who would
be working on boards and/or BSP support.

Many early revision MDS platforms used a mechanical clamping system to hold
the BGA CPU in place to facilitate CPU updates -- something not normally
possible for a soldered down BGA in a COTS system.

The point of these details is to give context that reflects that these four
boards were made in limited quantities, were not in a form factor that is
really "hobbyist" friendly and hence make sense for removal 17 years later.

Here, we remove the MPC8548E-MDS[1], the MPC8360E-MDS[2], the
MPC837xE-MDS[3], and the MPC832x-MDS[4] board support from the kernel.

There will still exist several e300 Freescale Reference Design System (RDS)
boards[5] and mini-ITX boards[6] with support in the kernel.  While these
were more of a COTS "ready to deploy" design more suited to hobbyists, it
probably makes sense to consider removing these as well, based on age.

But before we get to that, lets see how this goes -- and then we should
look at similar early e500 evaluation platforms [MPC8540-ADS, etc] next,
as the oldest there date back to 2002[7] -- before considering RDB/mITX.

I intentionally didn't put any links in the commits, since as we all know,
they tend not to be stable long term, so keep them here in the merge data.
Credit to NXP for keeping around these old legacy docs this long!

Paul.

--

[1] https://www.nxp.com/design/qoriq-developer-resources/mpc8349e-modular-development-system:MPC8349EMDS
[2] https://www.nxp.com/docs/en/user-guide/MPC8360EMDSUM.pdf
[3] https://www.nxp.com/products/processors-and-microcontrollers/legacy-mpu-mcus/powerquicc-processors/powerquicc-iii-mpc85xx/mpc837xe-modular-development-system:MPC837XEMDS
[4] https://www.nxp.com/products/processors-and-microcontrollers/legacy-mpu-mcus/powerquicc-processors/powerquicc-ii-pro-mpc83xx/low-power-powerquicc-ii-pro-processor-with-ddr2-tdm-pci-security-usb-quicc-engine-with-utopia:MPC8323E
[5] https://www.nxp.com/docs/en/fact-sheet/MPC8379ERDBFS.pdf
[6] https://www.digikey.ca/en/products/detail/nxp-usa-inc/MPC8349E-MITX-GP/1204733
[7] https://www.nxp.com/docs/en/reference-manual/MPC8560ADSUG.pdf

Cc: Scott Wood <oss@buserror.net>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Li Yang <leoyang.li@nxp.com>
Cc: Claudiu Manoil <claudiu.manoil@nxp.com>

---

Paul Gortmaker (4):
  powerpc: drop MPC834x_MDS platform support
  powerpc: drop MPC836x_MDS platform support
  powerpc: drop MPC837x_MDS platform support
  powerpc: drop MPC832x_MDS platform support

 arch/powerpc/boot/Makefile                    |   1 -
 arch/powerpc/boot/dts/mpc832x_mds.dts         | 436 ---------------
 arch/powerpc/boot/dts/mpc834x_mds.dts         | 403 --------------
 arch/powerpc/boot/dts/mpc836x_mds.dts         | 481 -----------------
 arch/powerpc/boot/dts/mpc8377_mds.dts         | 505 ------------------
 arch/powerpc/boot/dts/mpc8378_mds.dts         | 489 -----------------
 arch/powerpc/boot/dts/mpc8379_mds.dts         | 455 ----------------
 .../configs/83xx/mpc832x_mds_defconfig        |  59 --
 .../configs/83xx/mpc834x_mds_defconfig        |  58 --
 .../configs/83xx/mpc836x_mds_defconfig        |  64 ---
 .../configs/83xx/mpc837x_mds_defconfig        |  58 --
 arch/powerpc/configs/mpc83xx_defconfig        |   4 -
 arch/powerpc/configs/ppc6xx_defconfig         |   4 -
 arch/powerpc/platforms/83xx/Kconfig           |  32 --
 arch/powerpc/platforms/83xx/Makefile          |   4 -
 arch/powerpc/platforms/83xx/mpc832x_mds.c     | 110 ----
 arch/powerpc/platforms/83xx/mpc834x_mds.c     | 101 ----
 arch/powerpc/platforms/83xx/mpc836x_mds.c     | 210 --------
 arch/powerpc/platforms/83xx/mpc837x_mds.c     | 103 ----
 19 files changed, 3577 deletions(-)
 delete mode 100644 arch/powerpc/boot/dts/mpc832x_mds.dts
 delete mode 100644 arch/powerpc/boot/dts/mpc834x_mds.dts
 delete mode 100644 arch/powerpc/boot/dts/mpc836x_mds.dts
 delete mode 100644 arch/powerpc/boot/dts/mpc8377_mds.dts
 delete mode 100644 arch/powerpc/boot/dts/mpc8378_mds.dts
 delete mode 100644 arch/powerpc/boot/dts/mpc8379_mds.dts
 delete mode 100644 arch/powerpc/configs/83xx/mpc832x_mds_defconfig
 delete mode 100644 arch/powerpc/configs/83xx/mpc834x_mds_defconfig
 delete mode 100644 arch/powerpc/configs/83xx/mpc836x_mds_defconfig
 delete mode 100644 arch/powerpc/configs/83xx/mpc837x_mds_defconfig
 delete mode 100644 arch/powerpc/platforms/83xx/mpc832x_mds.c
 delete mode 100644 arch/powerpc/platforms/83xx/mpc834x_mds.c
 delete mode 100644 arch/powerpc/platforms/83xx/mpc836x_mds.c
 delete mode 100644 arch/powerpc/platforms/83xx/mpc837x_mds.c

-- 
2.17.1

