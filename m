Return-Path: <linuxppc-dev+bounces-7406-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D91A3A77207
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Apr 2025 02:43:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZRTkW2c4bz2yT0;
	Tue,  1 Apr 2025 11:43:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743468195;
	cv=none; b=iur/5w/ZbE2OEZTmo5R7zYuS/uAEZ3cZoIuBjzMKVAUFSw5M8WFESYW+YBzPlamnASj/3ELc1E2GHvAV/EVXQ09Ke8KvI1MIvwCRjkjUOX2oTcGcIgz4r8Jr3HLkPg6iCscedA+X+ykaSr9LCVhSvAW/qA7b2s42DiQmMejUS3kSlSBtlZTiIkjuIsrth9JwxyFGX9xzWTpa4tbHeb+SzePsYO0OL2sYnKBZfs0bPojobf9a3g8Ju4RnAUvCAEi6sD96yCO/A6JptG6pFSph01Uiixs5dMbBA7TK3HEPkBrMTdho16+eg8T+3EWwegLAgacezaDE5Wsqra8hU2gCiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743468195; c=relaxed/relaxed;
	bh=W8jNf/k98+Qin06tzsOMyXuyFsrHcTRoaa92kJANKuo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QnQbSw+GaylBy2Xwot/46eqOfF5fnPs0h53CrzGecI8DfZp7M/Iogmdv3Guma0r+DUm9RScfEtY4C/ZI7Ka9kGYk33m2485eAGIwNzMd7+R82ixQ9m8i0/H1Qgf/dchKNvOJJqGsLugJKonwOaqMX8yFBsUjYKIYdjt+tWucpRo3jA2rBAM1G3reaBu2OA+59TnWm7GdDRbu+3AOnxLI/8lXzYu7bnYIvP/RwCniTj5OTY2KpCsDpn6xEmjrvPoq4g606vhhmqNIDSVSHQ5z+RB857ONTnufdeUjkaoJz+i+zITENFvR1RJ2AIZ6BZ1nA/bJf5C2JZ0Bwixk1cp3gQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NceJ2xdH; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NceJ2xdH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZRTkT34Lbz2ySc
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Apr 2025 11:43:12 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52VKaMLX031305;
	Tue, 1 Apr 2025 00:42:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=W8jNf/k98+Qin06tzsOMyXuyFsrHcTRoaa92kJANK
	uo=; b=NceJ2xdHp2v9R9gpKeIXZHp+olN3uBL7TqDRDJzrnRF6LyFfWYlcbscoR
	eAMjzGxI8nnyp9B8/AaAaKI/ZVtRk40AS+uDrn/1G+eK30k4KAzXl8gdxHnTfvXb
	CiuXV4OpeSE2qXM85KZtFFDC4riX+RKLcTkNQVgUAz7Sbg1WzzaOD/Z9IAGwf7wt
	tELpt9bVrF8Gogm2CdVyoYqvbkoGSwl1AOqxIIhVF/CC6nu0vOw2qSEJH1g1xMSF
	qgKOdIa8FbWKf3jmh6W9msxwI0458QfLB55Oj+0RvV6viO3DfRcZUuVfa9k35YSo
	R6ibIn+0Y69P+bmGaFNf3lq0Xx8CA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45r27q0rfd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Apr 2025 00:42:55 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5310gtpH021924;
	Tue, 1 Apr 2025 00:42:55 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45r27q0rfb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Apr 2025 00:42:55 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52VM3U1a004776;
	Tue, 1 Apr 2025 00:42:54 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 45pujyrcem-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Apr 2025 00:42:54 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5310goCR49283382
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 1 Apr 2025 00:42:51 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D51E12004D;
	Tue,  1 Apr 2025 00:42:50 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CD97F20049;
	Tue,  1 Apr 2025 00:42:45 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.104.69])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  1 Apr 2025 00:42:45 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu
Cc: naveen@kernel.org, linuxppc-dev@lists.ozlabs.org,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Subject: [PATCH] powerpc/boot: Check for ld-option support
Date: Tue,  1 Apr 2025 06:12:18 +0530
Message-ID: <20250401004218.24869-1-maddy@linux.ibm.com>
X-Mailer: git-send-email 2.48.1
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
X-Proofpoint-ORIG-GUID: DnyzzU007fLGfzJLMRcj3YqQkyZZ7CMd
X-Proofpoint-GUID: 9s7fS0-bm8ILDYYytiA4ugLri5ayABQ_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-31_11,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502280000 definitions=main-2504010001
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Commit 579aee9fc594 ("powerpc: suppress some linker warnings in recent linker versions")
enabled support to add linker option "--no-warn-rwx-segments",
if the version is greater than 2.39. Similar build warning were
reported recently from linker version 2.35.2.

ld: warning: arch/powerpc/boot/zImage.epapr has a LOAD segment with RWX permissions
ld: warning: arch/powerpc/boot/zImage.pseries has a LOAD segment with RWX permissions

Fix the warning by checking for "--no-warn-rwx-segments"
option support in linker to enable it, instead of checking
for the version range.

Fixes: Commit 579aee9fc594 ("powerpc: suppress some linker warnings in recent linker versions")
Closes: https://lore.kernel.org/linuxppc-dev/61cf556c-4947-4bd6-af63-892fc0966dad@linux.ibm.com/
Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Suggested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
 arch/powerpc/boot/wrapper | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/boot/wrapper b/arch/powerpc/boot/wrapper
index 1db60fe13802..267ca6d4d9b3 100755
--- a/arch/powerpc/boot/wrapper
+++ b/arch/powerpc/boot/wrapper
@@ -234,10 +234,8 @@ fi
 
 # suppress some warnings in recent ld versions
 nowarn="-z noexecstack"
-if ! ld_is_lld; then
-	if [ "$LD_VERSION" -ge "$(echo 2.39 | ld_version)" ]; then
-		nowarn="$nowarn --no-warn-rwx-segments"
-	fi
+if [ $(${CROSS}ld -v --no-warn-rwx-segments &>/dev/null; echo $?) -eq 0 ]; then
+	nowarn="$nowarn --no-warn-rwx-segments"
 fi
 
 platformo=$object/"$platform".o
-- 
2.48.1


