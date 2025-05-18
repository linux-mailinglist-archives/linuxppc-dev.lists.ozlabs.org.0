Return-Path: <linuxppc-dev+bounces-8650-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D9EF0ABADEF
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 May 2025 06:41:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b0Sp61dRKz30Vj;
	Sun, 18 May 2025 14:41:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747543310;
	cv=none; b=n+htMov7nPPC86V0CrdKx3fJtOLFv4fSYg2zpHl5f/xAjFcsb48/g5mZvWOgmT8hpJCMZM5mLoCYY7xpMBQ+2zYHCZYROlnlw2B7yYGGhXIVCW2wmZXC4kVvCShb7FOk+0DxHmbVf83QMDP7uWWeOXjTvBoMNaPoGN6N0FXmz88Lzri3B15biYrO4Wxl1K/5t3Gr8s1+tcx/GzG/rA2DLWdbbb9wP7ejg0iWTX5AtoOxfYZ9qmYqU8gP+7sGnu9rIHBuGHVm8BJall9dmP9h+B0rx8vjAjXpziILJ4XVggMiuC0bhQ6npxZz9y4WQiR+rFfFgcAoKmIYE/ZtcjxciA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747543310; c=relaxed/relaxed;
	bh=12CDNg173UVvW01y7zRHAJ0rIHHWdTxL15pmqvRctyA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dN9+OprYTKt16+HgekG9Q6W80rx6iRxN9qjdFpc07OYeBMoQSp11hk2pLcIexyXeBe06IGw/NkyVFSWVelwJX3XwjQkLyO7LI3nkCzRzw5uPEUnt3dfl0JX9XChr+6cG6AEurDsuvcQLy0PcEJcNyq1iWX1wFT7fSkBMHDOqJzjDX42c1w+zm3F4FMd7BnesgVUZZd1fJU302hXx2ZqgcdEY5L6ZwRXDuHONTAsB3aQ2zlug03idcwIJTGUnNRURRtKrOXkx9FWnO7OzZQPgAX27b28B5zFJ7fzumHyzF13lzPLQauOP5uMoqHhrIy31ENckqUMhZen+2EVCCsG3pQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CrSAOpaB; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CrSAOpaB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b0Sp51p7Zz30N8
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 May 2025 14:41:49 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I4T1RD001490;
	Sun, 18 May 2025 04:41:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=12CDNg173UVvW01y7
	zRHAJ0rIHHWdTxL15pmqvRctyA=; b=CrSAOpaB2rxTy+yPwSMTkH//+Tau4agSU
	Moi4Y89dc64SNF39ruxjHj6NPwQlvSqkgbGWU5pRgNSXVKQE7R5Qm0ez1F+DB1zy
	R42Zw/nElhoiLQODPwHVcpRobH6KnG06Ohl+0yFzTngkOLDEXtKH6SQj5Jm2hjaf
	FPuppyR1Lw+lOoSLXiV8HwF+6bS2mcop7ZHPpvXVbFNt9lmjh8yXa2qWO2Sq7P4Q
	qx5PQy7/fMbVar0D8h7IDfXk8BJWkUQN/kHX087Kaw1Zb0DhWer/BTBxHvEksuMj
	F8keuWU7RpeT/Cx8xIj1yqcCvRoHVc4yfcBOAXwcAdhApIKSCM9eQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46pqagb0eb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 18 May 2025 04:41:38 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54I4fbmP021570;
	Sun, 18 May 2025 04:41:37 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46pqagb0e9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 18 May 2025 04:41:37 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54I1rOU9005309;
	Sun, 18 May 2025 04:41:36 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46q69m0eqe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 18 May 2025 04:41:36 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54I4fXs734669016
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 18 May 2025 04:41:33 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 162942004B;
	Sun, 18 May 2025 04:41:33 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6273420040;
	Sun, 18 May 2025 04:41:29 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.51.82])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 18 May 2025 04:41:28 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu
Cc: naveen@kernel.org, linuxppc-dev@lists.ozlabs.org,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Subject: [PATCH v2 4/4] powerpc/boot/install.sh: Fix shellcheck warnings
Date: Sun, 18 May 2025 10:11:07 +0530
Message-ID: <20250518044107.39928-4-maddy@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250518044107.39928-1-maddy@linux.ibm.com>
References: <20250518044107.39928-1-maddy@linux.ibm.com>
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Iy2yuDjIqaSZgQJxPYIZbmR1hrSQ0xLG
X-Authority-Analysis: v=2.4 cv=LLNmQIW9 c=1 sm=1 tr=0 ts=68296502 cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=dt9VzEwgFbYA:10 a=VnNF1IyMAAAA:8 a=EHKHNWoSpfGFrIUsRvMA:9
X-Proofpoint-GUID: efppKaPk79Ybd-xDnW2L9G98tCORnTE7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDAzOSBTYWx0ZWRfX47MK/KF7f6v7 Z5aQ7/w8WPjcyTMSYjKYHcRG7c864DCUofYhYkeBMBb1yfyoBURVOVBlk1qsxLYV0QJHjiAkb6W 4g2HcyLt7w8obsMuYgv8jVvx+d5gD7LGSUaPriA6oDbaIQV+1rsU9d0ldvuAm7/ZWnBafoLAdzN
 31wQ1rTNbBCffT+7iMgyCjiMMEOE+bKVmePhnbBn4Uf3nd3pXGitxEVITpZiIHXtofK6uDUJ8tU 0Eh1+JqVa8qi2zPP4/YjAkvlWqekpw0n87hTyiFHtiRoOGi5eohA3kJ/K+o1cyq0hycALR7JcSz YC5Bfn9i6Q6Zy7bHtxUUHsuXgXa7kf7DbqT5A62NBPaxqI+NPlSPVTXDMezTAQUyI66Gu0TETe1
 2MwxuMs2FWHPyL8ZFZSgzA9amC1eqbY+YMQUiidxwzWH0o8pRKwEMiFfLPd2q2zRoICp/BtE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_02,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 phishscore=0 impostorscore=0 mlxlogscore=999 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 mlxscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505180039
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Fix shellcheck warning such as
"Double quote to prevent globbing and word splitting." and
Use $(...) notation instead of legacy backticks `...`.

Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
Changelog v1:
-Added tested by tag

 arch/powerpc/boot/install.sh | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/boot/install.sh b/arch/powerpc/boot/install.sh
index 101fcb397a0f..c3df6c27ce75 100755
--- a/arch/powerpc/boot/install.sh
+++ b/arch/powerpc/boot/install.sh
@@ -19,19 +19,19 @@
 set -e
 
 # this should work for both the pSeries zImage and the iSeries vmlinux.sm
-image_name=`basename $2`
+image_name=$(basename "$2")
 
 
 echo "Warning: '${INSTALLKERNEL}' command not available... Copying" \
      "directly to $4/$image_name-$1" >&2
 
-if [ -f $4/$image_name-$1 ]; then
-	mv $4/$image_name-$1 $4/$image_name-$1.old
+if [ -f "$4"/"$image_name"-"$1" ]; then
+	mv "$4"/"$image_name"-"$1" "$4"/"$image_name"-"$1".old
 fi
 
-if [ -f $4/System.map-$1 ]; then
-	mv $4/System.map-$1 $4/System-$1.old
+if [ -f "$4"/System.map-"$1" ]; then
+	mv "$4"/System.map-"$1" "$4"/System-"$1".old
 fi
 
-cat $2 > $4/$image_name-$1
-cp $3 $4/System.map-$1
+cat "$2" > "$4"/"$image_name"-"$1"
+cp "$3" "$4"/System.map-"$1"
-- 
2.49.0


