Return-Path: <linuxppc-dev+bounces-5231-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBCAA1096C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2025 15:32:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YXWmd0rW7z2ysX;
	Wed, 15 Jan 2025 01:32:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736865137;
	cv=none; b=P0pYFDC9ozSYMycA8bcNT/+LB4b/PitSaYfgU3O/hekcI+onZwEA20vosCYn52WQMue3pZyeHoxkprMIoji9q1HPbPKp1iz764BPuI5TcBbpM4MZIM62p7RJDWwsWRU6eKfPgx83aDKa5zNEbNFtF25emqYLpXGDqsGndrSNk2ZKEhKo+MfNWT+DSl+fmEslujrAmFk4lwJdG4WVqNsEmvondWOMAZ5kU0v5jBY/zpRkXLyEHhI1UYQJ+UzfNFjOZTFE66qH/5lLOkncnY6q95WMcnwnArYwk4neXzNLKkb8vJjXm9K3hsJeoHMjJBIuxkdWGGr5nJNDHmosIR5o+w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736865137; c=relaxed/relaxed;
	bh=WuwNzSCv4EUuRn8dRTh7pIOxZia6gwwm11Bgq1t1CAk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m6trtvj9BM+Il+mNqiKsPxNdv5TATj/mTK+pzyanrhKeR900fqxE/dzVmiFWGlg2Hbk2g51bdHIjd43I0lpNzMOOo6JM3PsGfAuFmfJlvHmHFkBrXNxg6AiqdGglL2q3Mffgw7UeDnpum4Y+J21kv92G0o4q2n3VuOnGAMWhxRbIzA7zltuNrjMl6HaePJJ1RQ8Ymd1kQZpHBIUdQUC6eKOgVayskTTIKl8JzYvJi6f6N2hlYTEbsZRtG1D61eocju8l+iuluY6Hmw2jvRl3Vyj8cVwzgAMV2vTxHRudCVt11WgJPyapeIQvpTE1tsEPQFb4uhQGVUiFPqDtCltN8Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AjLS4P50; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AjLS4P50;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YXWmc0VdCz2yNH
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jan 2025 01:32:15 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50E3s7DV005799;
	Tue, 14 Jan 2025 14:32:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=WuwNzSCv4EUuRn8dRTh7pIOxZia6gwwm11Bgq1t1C
	Ak=; b=AjLS4P501IufRuKc92kDYkBUM694yB5w/MZlTC7+3X9c7BC+BgMMfBs/N
	vitm9AUJcpmRlfYQtxRG04HyOkPUcQy9vxfJ6aUQyE2bqjrNYYISglkfK1Q4QgmH
	qIBTC+QXuWShepkfFmZkHBaCgPpzJ6fV1WGfTC0CEJLWRWh9q/g3f/530INX32vb
	PHjeBfAklyhJ5F9zeqTWnbeWMm5c+9PtdGd9ER+L5wn/ujIM9C4j/GvObFtHX5pf
	jJO7f7rodkOa1Y5yhdSTjILTf7G0FXwSbF+z55S0yRI+yVoN+0JhpLEORdFf7Vdg
	HWpZYoqFQ57sqNu9qhMkaEcnkJ7zQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 445gdjjaa2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 14:32:02 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50EETRnd029597;
	Tue, 14 Jan 2025 14:32:02 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 445gdjja9v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 14:32:02 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50EEJctk017014;
	Tue, 14 Jan 2025 14:32:01 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4444fk3fc4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 14:32:00 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50EEVxHk29754032
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Jan 2025 14:31:59 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EDA5C20043;
	Tue, 14 Jan 2025 14:31:58 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CA0D420040;
	Tue, 14 Jan 2025 14:31:52 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.0.219])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 14 Jan 2025 14:31:52 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: jikos@kernel.org, mbenes@suse.cz, pmladek@suse.com,
        joe.lawrence@redhat.com, shuah@kernel.org
Cc: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        naveen@kernel.org, live-patching@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: [PATCH] selftests: livepatch: handle PRINTK_CALLER in check_result()
Date: Tue, 14 Jan 2025 20:01:44 +0530
Message-ID: <20250114143144.164250-1-maddy@linux.ibm.com>
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
X-Proofpoint-GUID: qnPN_SzONfNK6j-06uxQuxcWq8HlKsP6
X-Proofpoint-ORIG-GUID: gCspiTx0ec9vkIAjl20tG56LdC5i68fC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=635
 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1011 phishscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501140115
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Some arch configs (like ppc64) enable CONFIG_PRINTK_CALLER, which
adds the caller id as part of the dmesg. Due to this, even though
the expected vs observed are same, end testcase results are failed.

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
the dmesg. Enhance the check to handle removal of "[Tid]" also.

Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
 tools/testing/selftests/livepatch/functions.sh | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/livepatch/functions.sh b/tools/testing/selftests/livepatch/functions.sh
index e5d06fb40233..a1730c1864a4 100644
--- a/tools/testing/selftests/livepatch/functions.sh
+++ b/tools/testing/selftests/livepatch/functions.sh
@@ -306,7 +306,8 @@ function check_result {
 	result=$(dmesg | awk -v last_dmesg="$LAST_DMESG" 'p; $0 == last_dmesg { p=1 }' | \
 		 grep -e 'livepatch:' -e 'test_klp' | \
 		 grep -v '\(tainting\|taints\) kernel' | \
-		 sed 's/^\[[ 0-9.]*\] //')
+		 sed 's/^\[[ 0-9.]*\] //' | \
+		 sed 's/^\[[ ]*T[0-9]*\] //')
 
 	if [[ "$expect" == "$result" ]] ; then
 		echo "ok"
-- 
2.47.0


