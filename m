Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B332569E88F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Feb 2023 20:50:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PLqdt3m7rz3fFG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 06:50:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=windriver.com header.i=@windriver.com header.a=rsa-sha256 header.s=PPS06212021 header.b=pz8ESdrw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=windriver.com (client-ip=205.220.178.238; helo=mx0b-0064b401.pphosted.com; envelope-from=prvs=1416e03d26=paul.gortmaker@windriver.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=windriver.com header.i=@windriver.com header.a=rsa-sha256 header.s=PPS06212021 header.b=pz8ESdrw;
	dkim-atps=neutral
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PLqYv58RCz3cMj
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Feb 2023 06:47:13 +1100 (AEDT)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31LBXQvp022086;
	Tue, 21 Feb 2023 19:46:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=PPS06212021;
 bh=OI49JZ4AxGzbJWHCl0ijIIu9q2t/masak/NXSKcPWvs=;
 b=pz8ESdrwCnNO313guNHY9KqWcfuVveozqWpqKoav5A+DeGeSpcfH0QnwbE1hEg3HLUXy
 +I40axw/VqH8/WdvMy1HmnNLZesOTIN6XOnMDq+Fzl8hjfS30GJj6Nopqn1E4lZgH5Z9
 7+NFOIP8g/ISJm7X2WnAtnxYedYGJ4eVN72e+XO2Gb3Na5TC+2L4wOfz00s2PvAJjfDL
 o+AwVCxTYQZw5Z4+dEQYG1e1cudN6C/b2SN7PHrR/vCxKLsAfkNbE8jcsHkIAE2zwMvB
 oj3aCtdf1N2AzWppCdsP8si2LoEBVqv0SY3U8Inyzkcc16ST/fqmKUI6fEVEopR2Nsqh cQ== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ntpd3u145-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 21 Feb 2023 19:46:55 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.18; Tue, 21 Feb 2023 11:46:53 -0800
Received: from sc2600cp.wrs.com (128.224.56.77) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Tue, 21 Feb 2023 11:46:53 -0800
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [RFC PATCH 0/4] Remove some e500/MPC85xx evaluation platforms
Date: Tue, 21 Feb 2023 14:46:33 -0500
Message-ID: <20230221194637.28436-1-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ev8rVAANNG1P5MV5-CfqWX5yop7RSP69
X-Proofpoint-ORIG-GUID: ev8rVAANNG1P5MV5-CfqWX5yop7RSP69
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-21_12,2023-02-20_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0 malwarescore=0
 mlxlogscore=999 clxscore=1011 lowpriorityscore=0 phishscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302210170
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
Cc: Li Yang <leoyang.li@nxp.com>, Scott Wood <oss@buserror.net>, Paul Gortmaker <paul.gortmaker@windriver.com>, Claudiu Manoil <claudiu.manoil@nxp.com>, Paul Mackerras <paulus@samba.org>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[This RFC is proposed for v6.4 and hence is based off linux-next.]

In a similar theme to the e300/MPC83xx evaluation platform removal[1],
this targets removal of some 13 --> 21 year old e500/MPC85xx evaluation
boards that were produced in limited numbers and primarily made available
to hardware/software developers to shape their own boards and BSPs.

We start with the MPC8540-ADS[2] and MPC8560-ADS[3] -- based on the revision
history in the user's guide[4], these near-identical platforms date back to
at least 2002.  These boards are probably a part of the very small few that
still exist from the ppc ---> powerpc transition.  Typical of evaluation
boards, and as the picture[3] shows, these boards had a large footprint in
order to break out connectors to evaluate as many features as possible.

While it is up to each board OEM to provide input on the EOL of support
for their own product, I will note that for comparison that I retired our
SBC8560 support over a decade ago, in v3.6 (2012, in commit b048b4e17cbb)
and nobody complained.

Next, position yourself about 2007, and the MPC8548CDS (and variants)
appeared as a vehicle to showcase the then new e500-v2 processor family,
in a PCI-X card form factor with an additional backplane and the CPU on
yet another daughter-card.  Not very "hobbyist" friendly.  As the saying
goes, a picture[5] is worth 1000 words.

Again, for comparison, and perhaps well overdue, I'd requested removal of
our SBC8548 support in Jan 2021 (c12adb067844, v5.15).

Still roughly in the 2007 era, the MPC8568-MDS[6] just might have been the
2nd last in the MDS line that was similar to the MPC83xx-MDS in general
form factor.  However, as can be seen in the User Guide picture, the
PCI/PCI-X card edge has been deleted.

A semi-recent change in the Kconfig descriptions, in commit d20c96deb3e2
("powerpc/85xx: Fix description of MPC85xx and P1/P2 boards options") made
it clear some of the MPC8568-MDS support was shared/reused by the lower
end of the next gen DDR3 enabled processor family -- QorIQ -- in the
P1021/P1012 MDS[7] platforms.  This MDS variant re-added a PCI-e card edge
but retained the MDS form factor and overall goal of enabling hardware
designs for OEM board manufacturers.

Given that, we also include the P1021/P1012 MDS in this series, so that we
can then remove the MPC85xx_MDS Kconfig option and anything relying on it.

Finally, we remove some orphaned MPC85xx kernel config fragments.

Future considerations:
----------------------
Similar to the e300/MPC83xx series, what is NOT touched here is any of the
e500/MPC85xx RDS or DS platforms.

DS platforms -- In the next MPC85xx platform evolution, the M or C was
dropped from MDS/CDS designation -- as the evaluation systems dropped the
"card+backplane" architecture and more closely resembled a typical full
sized PC-ATX motherboard of the era, with soldered CPU mounted high; RAM
sockets nearby, and ATX compliant PCI slots below that.

However the feature rich, evaluation goal was retained in this new
Development System (DS) line.  Contrast that with the RDS systems which
were a smaller form factor and with only core/critical features exposed to
connectors, and a ready to deploy to market as-is for the overall goal.

With that in mind, in the future we may want to consider looking at the
removal of the e500-v2 DS (MP8572DS[8], MPC8544DS[9], ...) platforms.
However there is now once again overlap with the newer P1/P2 procfam DS
systems from the same commit, and this time not under the MDS umbrella.

Paul.
--

[1] https://lore.kernel.org/all/20230220115913.25811-1-paul.gortmaker@windriver.com/
[2] https://www.nxp.com/products/no-longer-manufactured/application-development-system-for-mpc8540:MPC8540ADS
[3] https://www.nxp.com/products/no-longer-manufactured/application-development-system-for-mpc8560:MPC8560ADS
[4] https://www.nxp.com/docs/en/reference-manual/MPC8560ADSUG.pdf
[5] https://www.flickr.com/photos/daiharuki/905150424/in/photostream/
[6] https://www.nxp.com/docs/en/user-guide/MPC8568EMDSPBUGAD.pdf
[7] https://www.nxp.com/design/qoriq-developer-resources/qoriq-p1021-p1012-modular-development-system:P1021MDS
[8] https://www.nxp.com/products/no-longer-manufactured/integrated-communications-processor-development-system:MPC8572DS
[9] https://www.nxp.com/docs/en/fact-sheet/MPC8544DSFS.pdf

Cc: Scott Wood <oss@buserror.net>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Li Yang <leoyang.li@nxp.com>
Cc: Claudiu Manoil <claudiu.manoil@nxp.com>
Cc: Pali Rohár <pali@kernel.org>

---

Paul Gortmaker (4):
  powerpc: drop MPC8540_ADS and MPC8560_ADS platform support
  powerpc: drop MPC85xx_CDS platform support
  powerpc: drop MPC8568_MDS / P1021_MDS platform support
  powerpc: remove orphaned MPC85xx kernel config fragments.

 arch/powerpc/boot/Makefile                    |   5 -
 arch/powerpc/boot/dts/fsl/mpc8540ads.dts      | 355 ----------------
 arch/powerpc/boot/dts/fsl/mpc8541cds.dts      | 375 -----------------
 arch/powerpc/boot/dts/fsl/mpc8548cds.dtsi     | 302 -------------
 arch/powerpc/boot/dts/fsl/mpc8548cds_32b.dts  |  82 ----
 arch/powerpc/boot/dts/fsl/mpc8548cds_36b.dts  |  82 ----
 arch/powerpc/boot/dts/fsl/mpc8555cds.dts      | 375 -----------------
 arch/powerpc/boot/dts/fsl/mpc8560ads.dts      | 388 -----------------
 arch/powerpc/boot/dts/fsl/mpc8568mds.dts      | 310 --------------
 arch/powerpc/boot/dts/fsl/mpc8568si-post.dtsi | 270 ------------
 arch/powerpc/boot/dts/fsl/mpc8568si-pre.dtsi  |  68 ---
 arch/powerpc/boot/dts/fsl/p1021mds.dts        | 319 --------------
 arch/powerpc/configs/85xx-32bit.config        |   5 -
 arch/powerpc/configs/85xx-hw.config           | 139 ------
 arch/powerpc/configs/85xx-smp.config          |   2 -
 .../configs/85xx/mpc8540_ads_defconfig        |  47 ---
 .../configs/85xx/mpc8560_ads_defconfig        |  50 ---
 .../configs/85xx/mpc85xx_cds_defconfig        |  52 ---
 arch/powerpc/configs/mpc85xx_base.config      |   3 -
 arch/powerpc/platforms/85xx/Makefile          |   3 -
 arch/powerpc/platforms/85xx/mpc85xx_ads.c     | 171 --------
 arch/powerpc/platforms/85xx/mpc85xx_cds.c     | 397 -----------------
 arch/powerpc/platforms/85xx/mpc85xx_mds.c     | 398 ------------------
 23 files changed, 4198 deletions(-)
 delete mode 100644 arch/powerpc/boot/dts/fsl/mpc8540ads.dts
 delete mode 100644 arch/powerpc/boot/dts/fsl/mpc8541cds.dts
 delete mode 100644 arch/powerpc/boot/dts/fsl/mpc8548cds.dtsi
 delete mode 100644 arch/powerpc/boot/dts/fsl/mpc8548cds_32b.dts
 delete mode 100644 arch/powerpc/boot/dts/fsl/mpc8548cds_36b.dts
 delete mode 100644 arch/powerpc/boot/dts/fsl/mpc8555cds.dts
 delete mode 100644 arch/powerpc/boot/dts/fsl/mpc8560ads.dts
 delete mode 100644 arch/powerpc/boot/dts/fsl/mpc8568mds.dts
 delete mode 100644 arch/powerpc/boot/dts/fsl/mpc8568si-post.dtsi
 delete mode 100644 arch/powerpc/boot/dts/fsl/mpc8568si-pre.dtsi
 delete mode 100644 arch/powerpc/boot/dts/fsl/p1021mds.dts
 delete mode 100644 arch/powerpc/configs/85xx-32bit.config
 delete mode 100644 arch/powerpc/configs/85xx-hw.config
 delete mode 100644 arch/powerpc/configs/85xx-smp.config
 delete mode 100644 arch/powerpc/configs/85xx/mpc8540_ads_defconfig
 delete mode 100644 arch/powerpc/configs/85xx/mpc8560_ads_defconfig
 delete mode 100644 arch/powerpc/configs/85xx/mpc85xx_cds_defconfig
 delete mode 100644 arch/powerpc/platforms/85xx/mpc85xx_ads.c
 delete mode 100644 arch/powerpc/platforms/85xx/mpc85xx_cds.c
 delete mode 100644 arch/powerpc/platforms/85xx/mpc85xx_mds.c

-- 
2.17.1

