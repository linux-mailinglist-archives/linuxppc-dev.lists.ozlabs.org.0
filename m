Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D10EB6A2BA0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Feb 2023 21:15:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PPJ0d4Qndz3f3M
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Feb 2023 07:15:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=windriver.com header.i=@windriver.com header.a=rsa-sha256 header.s=PPS06212021 header.b=J8rnH4Je;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=windriver.com (client-ip=205.220.178.238; helo=mx0b-0064b401.pphosted.com; envelope-from=prvs=1420409688=paul.gortmaker@windriver.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=windriver.com header.i=@windriver.com header.a=rsa-sha256 header.s=PPS06212021 header.b=J8rnH4Je;
	dkim-atps=neutral
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PPHyf1h5qz3bvs
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Feb 2023 07:13:44 +1100 (AEDT)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31PKDV3s002291;
	Sat, 25 Feb 2023 20:13:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=PPS06212021;
 bh=LkTnwVOO6CtFZi/iG5JMPZ6QvTTHy/GFWF9CtktujBo=;
 b=J8rnH4JefHCtYdg9yitdWRsStaUkIc7mxFdAI0l4K8Rg/ozYN7KNKsL8SZ2Zvc0qfiEg
 YbZwMFSasn2jZTAgoYdZSh6l7ddIQUfI2/wk4j51NgTkqRfPg9MLThsJOF3d6bSgFgS3
 d/x+ahLEXP8bpbCOwKordoLcPzcMbdcFmgRBZNzbAhejDvXndcp7C+Ut4jfFSlOBQYJI
 czyoiOg5G05TFnfn5KxtamVd9rPFiti5TMb0x9YvTJsnydqSCNGtirTFikvLE32YhUYf
 h6fFej7kiGQI5Dy4ceO2s6fGUlHwPLqo8ZHrbr/5LSi1F5ffkUD6XR0wF0aDGloc2qnz zw== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nybmk8gs1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 25 Feb 2023 20:13:30 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.18; Sat, 25 Feb 2023 12:13:29 -0800
Received: from sc2600cp.wrs.com (128.224.56.77) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Sat, 25 Feb 2023 12:13:28 -0800
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [RFC PATCH 0/3] Remove some e600/MPC7448/MPC86xx evaluation platforms
Date: Sat, 25 Feb 2023 15:13:15 -0500
Message-ID: <20230225201318.3682-1-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: -sS0HJkaKIvpvDUnWM5nSlMa0p47bXn-
X-Proofpoint-ORIG-GUID: -sS0HJkaKIvpvDUnWM5nSlMa0p47bXn-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-25_12,2023-02-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 suspectscore=0 phishscore=0 mlxscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302250170
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

This is the final series in reducing our day to day cost of carrying rare
evaluation platforms.  It targets the e600 Freescale processor family.

It starts with the HPC II (Taiga) platform[1] using the 7448 core.
Unlike previous e300/e500 procfams, there was no splitting roles between
an MDS evaluation board and a more deploy-ready RDS variant.  The High
Performance Computing (HPC) platform combined the two into one, with an
attempt to lean slightly more towards the RDS goals.

Compared to previous MPC74xx, the 7448 was the 1st move from 130nm to
90nm.  The 7448 also brought in the e600 name to replace "G4" as can be
seen in the comparison table[2].  Quoting the footnote below the same
table, we see:

  The e600 core is virtually identical to the G4 core, but with enhancements
  to L2 cache and AltiVec implementation, and it is manufactured in 90nm
  technology. Software written for the MPC7447 and MPC7447A will run
  seamlessly on the MPC7448. MPC7448 can be a pin-for-pin compatible
  drop-in replacement for MPC7447A.

In keeping with the HPC naming, the platform guide highlighted a server
role as a primary target audience,  but with a 2005 introduction
date[3], the wider availability of multicore processors in other
architectures were quickly changing the server landscape.

The answer to that was the HPC-NET evaluation platform[4] which set out to
showcase the new MPC8641D around 2006 - a dual core e600 that had internal
improvements over the MPC7448, but again the messaging was that "software"
people could treat it as a dual MPC7448 - and hence back compatible to G4
software.  Single core MPC8641 were also available.

An interesting feature of the HPC-NET evaluation platform was that it had
the ability to do AMP.  Meaning it could do two bootloaders, with two
serial consoles, and two independent kernel/rootfs.  Presumably this was
a lifeline to people with legacy MPC744x/G4 non-SMP aware software?

In any case, this is why this series overlaps embedded6xx and 86xx
platform dirs, and hence the explanation above.  The 7448 and 86xx share
more than the platform dirs might otherwise indicate.

Last in this series is the elusive MPC8610-HPCD.  The MPC8610 is a single
core and in this case, the "D" is for integrated display support[5] and not
"dual", in order to target kiosk and similar markets needing graphics.

Full disclosure - I'd spent many hours with the HPC II and the HPC-NET
(and our own SBC8641D) but I never came across a MPC8610-HPCD platform.
I was unable to find docs - only a download link for the old BSP[6].

And once again - this series is only removing the relatively "rare"
evaluation type boards.  Other OEM e600 boards are left as-is at this
point in time.

However, for reference, we did remove our OEM WR SBC8641D platform in 
2021, in commit d7c1814f2f4f and nobody complained.

Paul.

--

[1] https://www.nxp.com/docs/en/user-guide/HPCIIUG.pdf
[2] https://www.nxp.com/products/processors-and-microcontrollers/power-architecture/integrated-host-processors/risc-microprocessor:MPC7448
[3] https://www.nxp.com/docs/en/application-note/AN2924.pdf 
[4] https://www.nxp.com/docs/en/user-guide/HPCNUG.pdf
[5] https://en.wikipedia.org/wiki/PowerPC_e600
[6] https://www.nxp.com/search?keyword=HPCD&start=0

Cc: Scott Wood <oss@buserror.net>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Li Yang <leoyang.li@nxp.com>
Cc: Claudiu Manoil <claudiu.manoil@nxp.com>

Paul Gortmaker (3):
  powerpc: drop HPC II (MPC7448) evaluation platform support.
  powerpc: drop HPC-NET/MPC8641D evaluation platform support
  powerpc: drop HPCD/MPC8610 evaluation platform support

 arch/powerpc/boot/Makefile                    |   3 +-
 arch/powerpc/boot/cuboot-mpc7448hpc2.c        |  43 --
 arch/powerpc/boot/dts/fsl/mpc8641_hpcn.dts    | 394 --------------
 .../powerpc/boot/dts/fsl/mpc8641_hpcn_36b.dts | 337 ------------
 arch/powerpc/boot/dts/mpc7448hpc2.dts         | 192 -------
 arch/powerpc/boot/dts/mpc8610_hpcd.dts        | 503 ------------------
 arch/powerpc/configs/mpc7448_hpc2_defconfig   |  54 --
 arch/powerpc/configs/mpc86xx_base.config      |   2 -
 arch/powerpc/configs/ppc6xx_defconfig         |   2 -
 arch/powerpc/platforms/86xx/Kconfig           |  19 +-
 arch/powerpc/platforms/86xx/Makefile          |   2 -
 arch/powerpc/platforms/86xx/mpc8610_hpcd.c    | 333 ------------
 arch/powerpc/platforms/86xx/mpc86xx_hpcn.c    | 127 -----
 arch/powerpc/platforms/embedded6xx/Kconfig    |  10 -
 arch/powerpc/platforms/embedded6xx/Makefile   |   1 -
 .../platforms/embedded6xx/mpc7448_hpc2.c      | 198 -------
 16 files changed, 2 insertions(+), 2218 deletions(-)
 delete mode 100644 arch/powerpc/boot/cuboot-mpc7448hpc2.c
 delete mode 100644 arch/powerpc/boot/dts/fsl/mpc8641_hpcn.dts
 delete mode 100644 arch/powerpc/boot/dts/fsl/mpc8641_hpcn_36b.dts
 delete mode 100644 arch/powerpc/boot/dts/mpc7448hpc2.dts
 delete mode 100644 arch/powerpc/boot/dts/mpc8610_hpcd.dts
 delete mode 100644 arch/powerpc/configs/mpc7448_hpc2_defconfig
 delete mode 100644 arch/powerpc/platforms/86xx/mpc8610_hpcd.c
 delete mode 100644 arch/powerpc/platforms/86xx/mpc86xx_hpcn.c
 delete mode 100644 arch/powerpc/platforms/embedded6xx/mpc7448_hpc2.c

-- 
2.17.1

