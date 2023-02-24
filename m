Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF32F6A2345
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Feb 2023 21:51:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PNhrF49j4z3f46
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Feb 2023 07:51:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=windriver.com header.i=@windriver.com header.a=rsa-sha256 header.s=PPS06212021 header.b=C3mjlRtG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=windriver.com (client-ip=205.220.166.238; helo=mx0a-0064b401.pphosted.com; envelope-from=prvs=14196aa554=paul.gortmaker@windriver.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=windriver.com header.i=@windriver.com header.a=rsa-sha256 header.s=PPS06212021 header.b=C3mjlRtG;
	dkim-atps=neutral
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PNhqG39pnz3btb
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Feb 2023 07:50:16 +1100 (AEDT)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31OKh5Lk030040;
	Fri, 24 Feb 2023 12:50:12 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=PPS06212021;
 bh=dtekKv8DOzdPXKsazJFTBuhxL4CktRsep0nMy6ERIIw=;
 b=C3mjlRtGj5vrNuca5bG/LvEvR0XOcUvzaIDAQt7WgDqK2Y3H9rrP9zPeH70+L7eFp7K3
 wywNUp1mD4VWqiwdyWdY7nXHAtcEJajeQtl30h7uZ2+ahQhpsBXLLSpDwT7cGgippQ7I
 gjDnyna/BYXpDPROpZn/Na9zoDbLx7jdsffIQbsNaFOZ027PBZAv02ZNoFZTt9zMyEWa
 MKhMKieIRA8GG3nzCV5tkaG+YnOkOGjJHpwCbGGJl+T1PC3H7JDAJ9Qqpy0WYaJX3GU5
 mKVG+pggj4dwLrgGeKRaIGVjBpLWM9YGavyGXWHxcn537OSZYopuBxi3m2I+Ubo+F2V+ yA== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nttu6x4gk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 24 Feb 2023 12:50:11 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.18; Fri, 24 Feb 2023 12:50:11 -0800
Received: from sc2600cp.wrs.com (128.224.56.77) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Fri, 24 Feb 2023 12:50:10 -0800
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [RFC PATCH 0/3] Remove some PQ2/MPC82xx evaluation platforms
Date: Fri, 24 Feb 2023 15:49:56 -0500
Message-ID: <20230224204959.17425-1-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: XQ-uA_mOm5k1Uh0YyFiAhilsqsfzB937
X-Proofpoint-GUID: XQ-uA_mOm5k1Uh0YyFiAhilsqsfzB937
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-24_15,2023-02-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=7 suspectscore=0
 impostorscore=0 clxscore=1015 mlxlogscore=111 mlxscore=7
 lowpriorityscore=0 priorityscore=1501 spamscore=7 malwarescore=0
 adultscore=0 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302240166
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
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Claudiu Manoil <claudiu.manoil@nxp.com>, Li Yang <leoyang.li@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[This RFC is proposed for v6.4 and hence is based off linux-next.]

This series removes support for two PowerQUICC II (MPC82xx) Freescale
processor family evaluation boards that were added to the kernel in
approximately the 2003 era.

I couldn't easily find a reference picture, but there are line art
sketches in the various manuals still available[1,2].  In any case,
we've got one system with 32MB RAM and the other with 64MB.  CPU speeds
are also what one would expect for twenty year old platforms.

Again, this only removes evaluation platforms.  There are still a couple
MPC82xx OEM platforms remaining in the kernel.  But given that they are
similar in age and similarly resource constrained, they probably should
be near the top of the removal consideration list once all the evaluation
board support removals are in.

For comparison, in v2.6.27 (2008, 917f0af9e5a9) the WR SBC8260 support
was implicitly retired by not being carried through the ppc --> powerpc
device tree transition of that era.

Paul.

[1] https://www.nxp.com/design/qoriq-developer-resources/application-development-system-for-mpc8272:MPC8272ADS
[2] https://www.nxp.com/design/qoriq-developer-resources/mpc82xx-family-application-development-system:PQ2FADS_VR

Paul Gortmaker (3):
  powerpc: drop MPC8272_ADS platform support
  powerpc: drop PowerQUICC II Family ADS platform support
  powerpc: drop MPC8272-ADS and PowerQUICC II FADS shared code.

 arch/powerpc/boot/Makefile                   |   2 -
 arch/powerpc/boot/dts/mpc8272ads.dts         | 263 -------------------
 arch/powerpc/boot/dts/pq2fads.dts            | 243 -----------------
 arch/powerpc/configs/mpc8272_ads_defconfig   |  79 ------
 arch/powerpc/configs/ppc6xx_defconfig        |   2 -
 arch/powerpc/configs/pq2fads_defconfig       |  80 ------
 arch/powerpc/include/asm/mpc8260.h           |   4 -
 arch/powerpc/platforms/82xx/Kconfig          |  27 --
 arch/powerpc/platforms/82xx/Makefile         |   3 -
 arch/powerpc/platforms/82xx/mpc8272_ads.c    | 213 ---------------
 arch/powerpc/platforms/82xx/pq2ads-pci-pic.c | 172 ------------
 arch/powerpc/platforms/82xx/pq2ads.h         |  40 ---
 arch/powerpc/platforms/82xx/pq2fads.c        | 191 --------------
 13 files changed, 1319 deletions(-)
 delete mode 100644 arch/powerpc/boot/dts/mpc8272ads.dts
 delete mode 100644 arch/powerpc/boot/dts/pq2fads.dts
 delete mode 100644 arch/powerpc/configs/mpc8272_ads_defconfig
 delete mode 100644 arch/powerpc/configs/pq2fads_defconfig
 delete mode 100644 arch/powerpc/platforms/82xx/mpc8272_ads.c
 delete mode 100644 arch/powerpc/platforms/82xx/pq2ads-pci-pic.c
 delete mode 100644 arch/powerpc/platforms/82xx/pq2ads.h
 delete mode 100644 arch/powerpc/platforms/82xx/pq2fads.c

-- 
2.17.1

