Return-Path: <linuxppc-dev+bounces-8006-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E47A9D779
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Apr 2025 05:56:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zkwqk1ZDlz3bcW;
	Sat, 26 Apr 2025 13:56:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745639778;
	cv=none; b=XyvrMx5/ySThLaIpUOPUicZeYWNmNvf+nCr5qP0XATIia6Tfr8FA9t4GXeNzphfjzd6JfJF3oFsq5NajZDb3lYjZX0oUSVrQyk54H3fzhtS0mulBEUvOOYsEr/VGDYVGEXhHoPTXVmU1GHkpc1BuZLN30T6RqkbJsZMFNdznE9D2nOiEp76Dd6zvSSD4PcW3zYy2JaWMwi8o+821fJk6Tg7hdU31FGaEq4j+2pexdTdyS4shNekNiPN26Lcxx97fkgfXNG/oj6O7bfhN7lrEqPvuFmMyxMb7cXcM2cfNukgaPoidYxVbR9auM0xwaw0TlVcZnqkI57ftjJGDr1FdLg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745639778; c=relaxed/relaxed;
	bh=ZoeHO6SGVBf3Ounm+6RWrCja5ZgHoJ+mBwjSkv2Eww8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RBtCDkiX3tgm23+YUunXSqu4Yda1xsBVgki6Qrb2Mlzs9WwSUq2+ie/k/EFz/GDU8Lvn2asqU3IU8zi266LMkQF1NgmIn+iXm/V9bYBnuoaPQCEfSfkjvBT8CvDLEPD0oQlr/G3T1g65+qmWhz64vCeK7LNXUs1zL9s8WHwXASYwXIbx++1oqzYMPIWQSrkNsluh9Ve1RLiixz4rVXQFRYCjDePty+OA3vNzf38SdBL81UVB8Z7oTJupOshXj6oDYbjAFHFYqAs8VDDwtjrQt5oaKk44k4kCGVaoTfU7KjXBK40xaJzzFrM2HkGXTSNgp1CTsGzqwPijiyCgDDfUCA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WqBQE9wX; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=likhitha@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WqBQE9wX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=likhitha@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zkwqj4GMXz2yN2
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Apr 2025 13:56:17 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53Q2wn6E012801;
	Sat, 26 Apr 2025 03:56:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=ZoeHO6SGVBf3Ounm+
	6RWrCja5ZgHoJ+mBwjSkv2Eww8=; b=WqBQE9wXUprGyg+Mc9OpQpPzMBfJ0vHwK
	Oprej5+RtFPtmlHfZVYSg1zc3oW9oYQ64hr1UXOcFjBDVCX3fuCMNeEHG4nqdKPu
	5u9NO3rpMshS58DaFglXLH6mzTYhyzb6vX9FVbRhvFPVsZnnoJcnaVu6rzIK4jsL
	TqvuPUiW1Ser0s3H8D9WwTFn8egbBc9cvRJn/zHGP72dCz5eEOx5Z8w+NeKUKKjc
	zN8yab2z9qqGvKQHHtITB0U5nYxIolWxAwaUlYu2qDGX4JV3GxbnT/zjZpOScYwj
	oVehTKHcgFA6264F6wzKe7dUSGbjzYFbAOFgMyexViWL4PMV/zYEA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 468q5y02v1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 26 Apr 2025 03:56:06 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53Q3u6sQ016242;
	Sat, 26 Apr 2025 03:56:06 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 468q5y02uw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 26 Apr 2025 03:56:06 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53Q0hh87004098;
	Sat, 26 Apr 2025 03:56:05 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 466jg08e6h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 26 Apr 2025 03:56:05 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53Q3u2rl36372824
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 26 Apr 2025 03:56:02 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E4C4B20043;
	Sat, 26 Apr 2025 03:56:01 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4EFF220040;
	Sat, 26 Apr 2025 03:56:00 +0000 (GMT)
Received: from li-e616facc-2daa-11b2-a85c-9c7f23c3cd5e.in.ibm.com (unknown [9.199.192.254])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 26 Apr 2025 03:56:00 +0000 (GMT)
From: Likhitha Korrapati <likhitha@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        naveen@kernel.org, Likhitha Korrapati <likhitha@linux.ibm.com>,
        Anjali K <anjalik@linux.ibm.com>
Subject: [PATCH 7/7] arch/powerpc/perf : Removing unused macros from power9-pmu.c
Date: Sat, 26 Apr 2025 09:25:35 +0530
Message-ID: <20250426035535.450778-8-likhitha@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250426035535.450778-1-likhitha@linux.ibm.com>
References: <20250426035535.450778-1-likhitha@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI2MDAyNCBTYWx0ZWRfXxv67AKj7UCNm EpojdDN5jO4l0nZqW3tiu21tQVsmkEwJPWphuf+uG5vcraPXzzPq6v1tARnScOBTbVfyVgoWFvi JfCVamtfZst1QXwe0yWwF71nQkr+neD/JI2dAV9aDWjxaYXEMMB2SnuwTAFOQ3lcxQzW/B2h6y6
 MBuna0pXbXfAOob6yZMhyjnlWXNlUnejAaiXufFH8qfWv/sZB/blOTeBlX5ogp10AVdORUVT1QP 6kUQfR83z7Evm5ZVlp4pSHHGBV09V59IDZ8hDSGaqeFGJsBgEfbqY5B5yTgFECjQqjPilOwdDms dGXuG65UrHMxz+eIgNeMg3AAQhfoP5d+alM8mLi0O70j/0Xeif9ThNjhHiEI09mYWMuqE5QeMha
 PWsR+Wm7jT6bkSlnzOnNRIVAR1FnwO245ti9mp7gfchSUgs704w50us/eRXCcRG+t+sk1Swn
X-Proofpoint-GUID: b1hisdZM6y-9enO_-ztL0RAyUH2e_0LK
X-Authority-Analysis: v=2.4 cv=b4Oy4sGx c=1 sm=1 tr=0 ts=680c5956 cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=XR8D0OoHHMoA:10 a=VnNF1IyMAAAA:8 a=5YPyCxK-jbmi43O6HvgA:9
X-Proofpoint-ORIG-GUID: 99DzXJ4y40S0ELaLBvYO4--LJTg7rnjP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-26_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 bulkscore=0 mlxlogscore=835 suspectscore=0 mlxscore=0
 spamscore=0 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504260024
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The following macros were introduced in power9-pmu via
commit 8c002dbd05ee ("powerpc/perf: Power9 PMU support")

POWER9_MMCRA_IFM2, POWER9_MMCRA_IFM3

Removing the above macros as they are defined but never used.

Co-developed-by: Anjali K <anjalik@linux.ibm.com>
Signed-off-by: Anjali K <anjalik@linux.ibm.com>
Signed-off-by: Likhitha Korrapati <likhitha@linux.ibm.com>
---
 arch/powerpc/perf/power9-pmu.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/powerpc/perf/power9-pmu.c b/arch/powerpc/perf/power9-pmu.c
index cb6a7dc02dd7..4d96830835cd 100644
--- a/arch/powerpc/perf/power9-pmu.c
+++ b/arch/powerpc/perf/power9-pmu.c
@@ -86,8 +86,6 @@ enum {
 
 /* MMCRA IFM bits - POWER9 */
 #define POWER9_MMCRA_IFM1		0x0000000040000000UL
-#define POWER9_MMCRA_IFM2		0x0000000080000000UL
-#define POWER9_MMCRA_IFM3		0x00000000C0000000UL
 #define POWER9_MMCRA_BHRB_MASK		0x00000000C0000000UL
 
 extern u64 PERF_REG_EXTENDED_MASK;
-- 
2.43.5


