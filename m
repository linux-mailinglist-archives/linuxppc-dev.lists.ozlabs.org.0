Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AA5894914
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Apr 2024 03:59:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=CTG48LGu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V7rf31rd4z3bsd
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Apr 2024 12:59:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=CTG48LGu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=martin.petersen@oracle.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 534 seconds by postgrey-1.37 at boromir; Tue, 02 Apr 2024 12:58:11 AEDT
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V7rcz3Lx6z3dLQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Apr 2024 12:58:09 +1100 (AEDT)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 431IKCQ9009659;
	Tue, 2 Apr 2024 01:48:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2023-11-20;
 bh=L9IxItlvqA1yIzQ1+sVrLHxRvr61/Tb3C75G4rmCcAQ=;
 b=CTG48LGug34c6CkHKet8GhYB1nQVJyps9stIGiL2hqvslsOCRAnbCUzpzFEWEM18EoXs
 EB9+H+zbmdhOpo6dbXmJIKRAg882F7RZFi6eEjeKnpCBouaOCBa4tckN470B1QAIvSy6
 T9Rjy1wb38hRO/bXH+5oKDyqbHgajqQolR94I6D/dlIyKltmAGBPbfO7WO3BRTgruUA8
 AGgI3GOFll2Qo/cwy70tT/yq80qBikDcnhfAd96YVhvW+QJS+JE1JX1ZM0cEaRiAr5C1
 s81LKqWNXX7K4nSvYdTOaS0jY3QC5uNlzmudLs0vOK6xtHptVIFZWFKHXb15w8vOCIfL OA== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3x7tb9sjps-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 02 Apr 2024 01:48:47 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 4320lCLT018692;
	Tue, 2 Apr 2024 01:48:47 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3x696cd6c1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 02 Apr 2024 01:48:47 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4321mkN9030130;
	Tue, 2 Apr 2024 01:48:46 GMT
Received: from ca-mkp2.ca.oracle.com.com (mpeterse-ol9.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.251.135])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 3x696cd6bp-1;
	Tue, 02 Apr 2024 01:48:46 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: llvm@lists.linux.dev, Arnd Bergmann <arnd@kernel.org>
Subject: Re: (subset) [PATCH 0/9] enabled -Wformat-truncation for clang
Date: Mon,  1 Apr 2024 21:48:35 -0400
Message-ID: <171202249144.2135322.4411557752324466054.b4-ty@oracle.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240326223825.4084412-1-arnd@kernel.org>
References: <20240326223825.4084412-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-01_18,2024-04-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 spamscore=0
 bulkscore=0 adultscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2403210000
 definitions=main-2404020012
X-Proofpoint-GUID: LNUyxeCija5WK7SmvL47CZEEitUJovRX
X-Proofpoint-ORIG-GUID: LNUyxeCija5WK7SmvL47CZEEitUJovRX
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
Cc: Hannes Reinecke <hare@kernel.org>, Vladimir Oltean <vladimir.oltean@nxp.com>, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>, netdev@vger.kernel.org, Bill Wendling <morbo@google.com>, linux-scsi@vger.kernel.org, Manish Chopra <manishc@marvell.com>, linux-rdma@vger.kernel.org, Helge Deller <deller@gmx.de>, linux-input@vger.kernel.org, =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Ariel Elior <aelior@marvell.com>, Nicolas Schier <nicolas@fjasle.eu>, Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-sound@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, Hans de Goede <hdegoede@redhat.com>, Claudiu Manoil <claudiu.manoil@nxp.com>, Jakub Kicinski <kuba@kernel.org>, platform-driver-x86@vger.kernel.org, Leon Romanovsky <leon@kernel.org>, "Martin K . Petersen" <martin.petersen@oracle.com>, Saeed Mahameed <saeedm@nvidia.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com
 >, Nick Desaulniers <ndesaulniers@google.com>, Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org, Justin Stitt <justinstitt@google.com>, Johannes Berg <johannes@sipsolutions.net>, alsa-devel@alsa-project.org, Maximilian Luz <luzmaximilian@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 26 Mar 2024 23:37:59 +0100, Arnd Bergmann wrote:

> With randconfig build testing, I found only eight files that produce
> warnings with clang when -Wformat-truncation is enabled. This means
> we can just turn it on by default rather than only enabling it for
> "make W=1".
> 
> Unfortunately, gcc produces a lot more warnings when the option
> is enabled, so it's not yet possible to turn it on both both
> compilers.
> 
> [...]

Applied to 6.9/scsi-fixes, thanks!

[7/9] scsi: mylex: fix sysfs buffer lengths
      https://git.kernel.org/mkp/scsi/c/1197c5b2099f

-- 
Martin K. Petersen	Oracle Linux Engineering
