Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 848E37362B7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 06:45:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=windriver.com header.i=@windriver.com header.a=rsa-sha256 header.s=PPS06212021 header.b=gPoeKi4n;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QlYwG363Pz30J1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 14:45:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=windriver.com header.i=@windriver.com header.a=rsa-sha256 header.s=PPS06212021 header.b=gPoeKi4n;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=windriver.com (client-ip=205.220.178.238; helo=mx0b-0064b401.pphosted.com; envelope-from=prvs=5535a9ab19=paul.gortmaker@windriver.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 665 seconds by postgrey-1.37 at boromir; Tue, 20 Jun 2023 14:44:29 AEST
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QlYvK1bt0z300H
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jun 2023 14:44:27 +1000 (AEST)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35K4UR15006041;
	Tue, 20 Jun 2023 04:33:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=PPS06212021;
 bh=C9exeSs6LzjAtVqjMSkYqTkzve399PIHlF25HoiLgg0=;
 b=gPoeKi4nb3atWDvIWZ54a93T6E7SSx7VQ8BIEhPYJknY2sDuITxUMwmVBg5uLpUfYGow
 2AfjNI/6i9/K2xMHocDhaIoErozwSLFrscouTaSU7cIiIzQ1OTJlu5tsXEOe3wmX1SCH
 sUf1h+G86qPh1qPpu9hrRsRvcHyAfNlNjVNEj6H5S68K0qvEgH1bz8ZdpvQxSphuuB1B
 RNQBNxL1Moffbeai0O2R3Zs126CPjyTrQjaKzQaOwStuhNY+RJddeyLCXmcZZeh8bnJX
 SW6MM0OHSMxTdAVJGWvUIi7YpjS2t6cIbkZOfOkNcasr4X3ePlUxG4TC21qiLFd6T3Sa 3g== 
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r9220j8dd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 20 Jun 2023 04:33:08 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 19 Jun 2023 21:33:07 -0700
Received: from sc2600cp.wrs.com (128.224.56.77) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.23 via Frontend Transport; Mon, 19 Jun 2023 21:33:06 -0700
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH v2 0/2] Remove some e500/MPC85xx evaluation platforms
Date: Tue, 20 Jun 2023 00:32:58 -0400
Message-ID: <20230620043300.197546-1-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: u7wRhxuuO2T19VUL08H3JSDaJWznq0zO
X-Proofpoint-ORIG-GUID: u7wRhxuuO2T19VUL08H3JSDaJWznq0zO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-20_02,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 impostorscore=0 mlxscore=0
 mlxlogscore=999 clxscore=1011 spamscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306200040
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

v1: https://lore.kernel.org/all/20230221194637.28436-1-paul.gortmaker@windriver.com/

v1 --> v2:
   -don't remove MPC8568MDS or P1021 or P1012 platforms as per discussion
   -drop commit #4 that removed kernel fragments still in use elsewhere.
   -trivial refresh for the updated baseline of linux-next


In a similar theme to the e300/MPC83xx evaluation platform removal[1],
this targets removal of two of the oldest e500/MPC85xx evaluation
boards that were produced in limited numbers and primarily made available
to hardware/software developers to shape their own boards and BSPs.

We start with the MPC8540-ADS[2] and MPC8560-ADS[3] -- based on the revision
history in the user's guide[4], these near-identical platforms date back to
at least 2002.  These boards are probably a part of the very small few that
still exist from the ppc ---> powerpc transition.  Typical of evaluation
boards, and as the picture[3] shows, these boards had a large footprint in
order to break out connectors to evaluate as many features as possible.

For reference, I will note that for comparison that I retired our SBC8560
support over a decade ago, in v3.6 (2012, in commit b048b4e17cbb) and I
don't think a single person complained.

Next, position yourself about 2007, and the MPC8548CDS (and variants)
appeared as a vehicle to showcase the then new e500-v2 processor family,
in a PCI-X card form factor with an additional backplane and the CPU on
yet another daughter-card.  Not very "hobbyist" friendly.  As the saying
goes, a picture[5] is worth 1000 words.  It was quite the 3D beast.

Again, for comparison, and perhaps well overdue, I'd requested removal of
our SBC8548 support in Jan 2021 (c12adb067844, v5.15).

Testing included builds of defconfig, mpc85xx_defconfig, mpc85xx_smp_defconfig
and corenet32_smp_defconfig

As there is obviously no rush for this to be in v6.5, a defer to v6.6 would
be perfectly fine.  In any case it is is based off linux-next from today.

Paul.
--

[1] https://lore.kernel.org/all/20230220115913.25811-1-paul.gortmaker@windriver.com/
[2] https://www.nxp.com/products/no-longer-manufactured/application-development-system-for-mpc8540:MPC8540ADS
[3] https://www.nxp.com/products/no-longer-manufactured/application-development-system-for-mpc8560:MPC8560ADS
[4] https://www.nxp.com/docs/en/reference-manual/MPC8560ADSUG.pdf
[5] https://www.flickr.com/photos/daiharuki/905150424/in/photostream/

Cc: Scott Wood <oss@buserror.net>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Li Yang <leoyang.li@nxp.com>
Cc: Claudiu Manoil <claudiu.manoil@nxp.com>
Cc: Pali Rohár <pali@kernel.org>

---

Paul Gortmaker (2):
  powerpc: drop MPC8540_ADS and MPC8560_ADS platform support
  powerpc: drop MPC85xx_CDS platform support

 arch/powerpc/boot/Makefile                    |   5 -
 arch/powerpc/boot/dts/fsl/mpc8540ads.dts      | 355 ----------------
 arch/powerpc/boot/dts/fsl/mpc8541cds.dts      | 375 -----------------
 arch/powerpc/boot/dts/fsl/mpc8548cds.dtsi     | 302 --------------
 arch/powerpc/boot/dts/fsl/mpc8548cds_32b.dts  |  82 ----
 arch/powerpc/boot/dts/fsl/mpc8548cds_36b.dts  |  82 ----
 arch/powerpc/boot/dts/fsl/mpc8555cds.dts      | 375 -----------------
 arch/powerpc/boot/dts/fsl/mpc8560ads.dts      | 388 ------------------
 .../configs/85xx/mpc8540_ads_defconfig        |  47 ---
 .../configs/85xx/mpc8560_ads_defconfig        |  50 ---
 .../configs/85xx/mpc85xx_cds_defconfig        |  52 ---
 arch/powerpc/configs/mpc85xx_base.config      |   3 -
 arch/powerpc/platforms/85xx/Makefile          |   3 -
 arch/powerpc/platforms/85xx/mpc85xx_ads.c     | 162 --------
 arch/powerpc/platforms/85xx/mpc85xx_cds.c     | 387 -----------------
 15 files changed, 2668 deletions(-)
 delete mode 100644 arch/powerpc/boot/dts/fsl/mpc8540ads.dts
 delete mode 100644 arch/powerpc/boot/dts/fsl/mpc8541cds.dts
 delete mode 100644 arch/powerpc/boot/dts/fsl/mpc8548cds.dtsi
 delete mode 100644 arch/powerpc/boot/dts/fsl/mpc8548cds_32b.dts
 delete mode 100644 arch/powerpc/boot/dts/fsl/mpc8548cds_36b.dts
 delete mode 100644 arch/powerpc/boot/dts/fsl/mpc8555cds.dts
 delete mode 100644 arch/powerpc/boot/dts/fsl/mpc8560ads.dts
 delete mode 100644 arch/powerpc/configs/85xx/mpc8540_ads_defconfig
 delete mode 100644 arch/powerpc/configs/85xx/mpc8560_ads_defconfig
 delete mode 100644 arch/powerpc/configs/85xx/mpc85xx_cds_defconfig
 delete mode 100644 arch/powerpc/platforms/85xx/mpc85xx_ads.c
 delete mode 100644 arch/powerpc/platforms/85xx/mpc85xx_cds.c

-- 
2.25.1
