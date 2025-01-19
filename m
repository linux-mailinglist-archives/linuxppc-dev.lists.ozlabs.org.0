Return-Path: <linuxppc-dev+bounces-5379-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDB6A162F1
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Jan 2025 17:33:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YbfCx017qz2xr4;
	Mon, 20 Jan 2025 03:33:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737304396;
	cv=none; b=NyLuO1EZIeVhmNJluyOJ0iiXty0SzFQTzsVx6AOUY4yo/uKAZgizj/HcgIB8PGMmJxmRq4XVMVEtrxF5viiHUmPwzT1R1tycZoJqwFEH/cufG9pWQ4pbdTyTM0He5VNaLHGK1qpSbkaNPW097VRQ8O7Se5qD2ZiNeR43sYTvgwpdGhg4A8CwtbOOq+uynJTdNaCRNRs5l+UqbYwE91cfDYXWJw85drjaSo1ofAmLq5jsXDTqnpuEhyHJ6ZEelpVmqxg9GYXld+n6c6D1vhSutiOQPTDTn36cmQP4StQv6nxoPbRXgVnGLs3Zw/od9VPOgPiXJS7Z+mYj9M0eIMiHBw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737304396; c=relaxed/relaxed;
	bh=12LNJZ18ESVc16oZoY4SfOTDBsu02AD0z6ZMiuSCstE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hxUAhEpv81CjA8hWEit3mKX1tHxYLbU20ORPlpX0YXRQt0ETHmErjlDIRzgx4x6C5vBf3nm0UlEMPLjbBCA3V7ZuBWGN1e9+J/GmZAzbNsUHoe/c5kqO9/cxx7l2aFpbFiSrABEZjgOLa54rlumxQXWgZh0ie0qty/7y0ssAbtRc5YCGxZTuNEKTYfehYXQ7WQMUDjXYOl0avD/tTEs8mZatyMWbnMT1gOAZhp19gJ5leNf9sq1XxPKr+V4mhh1mLOeVYuYhyHzknxqe8hgzSvEQYWiDveMP12c2+vAE6/RUYbvunUEOcEsjLDQSw45BSsGww2tXAyb3fhhApjzasQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hR4nF2hp; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hR4nF2hp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YbfCv63Kxz2xk7
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jan 2025 03:33:14 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50J9FN5b029808;
	Sun, 19 Jan 2025 16:32:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=12LNJZ18ESVc16oZoY4SfOTDBsu02AD0z6ZMiuSCs
	tE=; b=hR4nF2hprQFFS8UpbHZwgKX+bc9mpexFDOl7bl+x6nuFykUeZmlfTnkEI
	G6i37f8WGJwTJAtWR4XL0NDc4YPrTdMiuHfdhS4k5fHyrVo9Vh0xyAcaqjy8slER
	uGqGrQcfdRKd9V7U/NQ8nSr6DbDeNFx3u2vyOQ8WNb3fSVEd6mrK5QEFti2zVAQX
	cB5B13gSfwOVYA8Ii+CndXr/sFfiEI3VUfrJi6lzqPaWPwKHUNMPjL07o/47zvC5
	GThzyBxnWNbwKxCYfmQR+k1Zc+J80jG1rTwcMRAp29diOtMP17c460xKNunZmHA7
	t0Rkpy30udTSPzFGFddjv7eyXL3qA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 448w3nh6kp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 19 Jan 2025 16:32:54 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50JGWrLE032724;
	Sun, 19 Jan 2025 16:32:53 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 448w3nh6km-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 19 Jan 2025 16:32:53 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50JC94K5022370;
	Sun, 19 Jan 2025 16:32:52 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 448r4jtem3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 19 Jan 2025 16:32:52 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50JGWo3x13042052
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 19 Jan 2025 16:32:50 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C4AC320043;
	Sun, 19 Jan 2025 16:32:50 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D15E020040;
	Sun, 19 Jan 2025 16:32:44 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.71.72])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 19 Jan 2025 16:32:44 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: jikos@kernel.org, mbenes@suse.cz, pmladek@suse.com,
        joe.lawrence@redhat.com, shuah@kernel.org
Cc: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        naveen@kernel.org, live-patching@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: [PATCH v2] selftests: livepatch: handle PRINTK_CALLER in check_result()
Date: Sun, 19 Jan 2025 22:02:38 +0530
Message-ID: <20250119163238.749847-1-maddy@linux.ibm.com>
X-Mailer: git-send-email 2.47.0
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
X-Proofpoint-GUID: hwUDQzwFKR4oN0R3vo1rm6TC1RVGym6b
X-Proofpoint-ORIG-GUID: byqw_0P7pJK7tOMp7XzmA3uJ-dYc8yrz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-19_03,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 phishscore=0 mlxlogscore=886 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501190129
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Some arch configs (like ppc64) enable CONFIG_PRINTK_CALLER,
which adds the caller id as part of the dmesg. With recent
util-linux's update 467a5b3192f16 ('dmesg: add caller_id support')
the standard "dmesg" has been enhanced to print PRINTK_CALLER fields.

Due to this, even though the expected vs observed are same,
end testcase results are failed.

 -% insmod test_modules/test_klp_livepatch.ko
 -livepatch: enabling patch 'test_klp_livepatch'
 -livepatch: 'test_klp_livepatch': initializing patching transition
 -livepatch: 'test_klp_livepatch': starting patching transition
 -livepatch: 'test_klp_livepatch': completing patching transition
 -livepatch: 'test_klp_livepatch': patching complete
 -% echo 0 > /sys/kernel/livepatch/test_klp_livepatch/enabled
 -livepatch: 'test_klp_livepatch': initializing unpatching transition
 -livepatch: 'test_klp_livepatch': starting unpatching transition
 -livepatch: 'test_klp_livepatch': completing unpatching transition
 -livepatch: 'test_klp_livepatch': unpatching complete
 -% rmmod test_klp_livepatch
 +[   T3659] % insmod test_modules/test_klp_livepatch.ko
 +[   T3682] livepatch: enabling patch 'test_klp_livepatch'
 +[   T3682] livepatch: 'test_klp_livepatch': initializing patching transition
 +[   T3682] livepatch: 'test_klp_livepatch': starting patching transition
 +[    T826] livepatch: 'test_klp_livepatch': completing patching transition
 +[    T826] livepatch: 'test_klp_livepatch': patching complete
 +[   T3659] % echo 0 > /sys/kernel/livepatch/test_klp_livepatch/enabled
 +[   T3659] livepatch: 'test_klp_livepatch': initializing unpatching transition
 +[   T3659] livepatch: 'test_klp_livepatch': starting unpatching transition
 +[    T789] livepatch: 'test_klp_livepatch': completing unpatching transition
 +[    T789] livepatch: 'test_klp_livepatch': unpatching complete
 +[   T3659] % rmmod test_klp_livepatch

  ERROR: livepatch kselftest(s) failed
 not ok 1 selftests: livepatch: test-livepatch.sh # exit=1

Currently the check_result() handles the "[time]" removal from
the dmesg. Enhance the check to also handle removal of "[Thread Id]"
or "[CPU Id]".

Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
Changelog v1:
- Modified commit message to include util-linux commit that
  updated dmesg to support printing of PRINTK_CALLER fields.
- Updated the check to include "CPU Id" along with "Thread Id"

 tools/testing/selftests/livepatch/functions.sh | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/livepatch/functions.sh b/tools/testing/selftests/livepatch/functions.sh
index e5d06fb40233..15601402dee6 100644
--- a/tools/testing/selftests/livepatch/functions.sh
+++ b/tools/testing/selftests/livepatch/functions.sh
@@ -306,7 +306,8 @@ function check_result {
 	result=$(dmesg | awk -v last_dmesg="$LAST_DMESG" 'p; $0 == last_dmesg { p=1 }' | \
 		 grep -e 'livepatch:' -e 'test_klp' | \
 		 grep -v '\(tainting\|taints\) kernel' | \
-		 sed 's/^\[[ 0-9.]*\] //')
+		 sed 's/^\[[ 0-9.]*\] //' | \
+		 sed 's/^\[[ ]*[CT][0-9]*\] //')
 
 	if [[ "$expect" == "$result" ]] ; then
 		echo "ok"
-- 
2.47.0


