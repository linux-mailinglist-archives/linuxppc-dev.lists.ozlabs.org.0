Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42FD679A2E7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Sep 2023 07:37:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dssHz3hr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rkb8L0TfZz3bwp
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Sep 2023 15:37:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dssHz3hr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=aboorvad@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rkb7P6SQKz2yN3
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Sep 2023 15:36:49 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38B5X9iA010461;
	Mon, 11 Sep 2023 05:36:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=powS5HRcXLqTXorjnWFvAJPdjtsxApYzkCpUjdalHkw=;
 b=dssHz3hr9nkE0YH26co5ag+j7kwWQS11Z9hLtGEKLLSwReGow4OvsueHRlHXElwhRLJa
 a/UlyGLlczdoLioDlc3JDdGZsPwfeD07P1gu7xz5+aOrsi1pcK9/VOgNGac5q47sa8OW
 6BjqtXZ3HV+/c4CdeNqAfnlCrMUffl2YBRZiICeaX8uIcMBMqMUSD7SOng9uAIhykCEZ
 2VEOb6h1UZO/FM+bSVRzSTgL49x89cvVZ4bg17evJ0AKcEitwWrsQznL7+0cZYRlrcOF
 hELo2Ja1wHaefPBZrtVYrCtqLnn2NaEa4m79y4Tfm1ih+My+4iBm4qEnAgdaAkkkcflF Jw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t1vuf84su-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Sep 2023 05:36:33 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 38B5Z4OQ018621;
	Mon, 11 Sep 2023 05:36:32 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t1vuf84pg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Sep 2023 05:36:31 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 38B4KF8j012083;
	Mon, 11 Sep 2023 05:36:30 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3t13dy8adx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Sep 2023 05:36:30 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 38B5aShV12452538
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 11 Sep 2023 05:36:28 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3EE8F20040;
	Mon, 11 Sep 2023 05:36:28 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4F4672004B;
	Mon, 11 Sep 2023 05:36:25 +0000 (GMT)
Received: from li-34d1fccc-27cd-11b2-a85c-c167793e56f7.ibm.com.com (unknown [9.171.42.194])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 11 Sep 2023 05:36:25 +0000 (GMT)
From: Aboorva Devarajan <aboorvad@linux.vnet.ibm.com>
To: aboorvad@linux.vnet.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        rmclure@linux.ibm.com, arnd@arndb.de, joel@jms.id.au, shuah@kernel.org,
        linux-kselftest@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, pratik.r.sampat@gmail.com
Subject: [RFC v3 0/2] CPU-Idle latency selftest framework
Date: Mon, 11 Sep 2023 11:06:18 +0530
Message-Id: <20230911053620.87973-1-aboorvad@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.39.3
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: AiFXolyQq-kRKwtTnFsqmHKmO7onNZs3
X-Proofpoint-GUID: IQT2pzrBtztzNQKqj3s3CiDyfYKy0bGM
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-11_03,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0 bulkscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309110051
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
Cc: sshegde@linux.vnet.ibm.com, srikar@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Changelog: v2 -> v3

* Minimal code refactoring
* Rebased on v6.6-rc1

RFC v1: 
https://lore.kernel.org/all/20210611124154.56427-1-psampat@linux.ibm.com/

RFC v2:
https://lore.kernel.org/all/20230828061530.126588-2-aboorvad@linux.vnet.ibm.com/

Other related RFC:
https://lore.kernel.org/all/20210430082804.38018-1-psampat@linux.ibm.com/

Userspace selftest:
https://lkml.org/lkml/2020/9/2/356

----

A kernel module + userspace driver to estimate the wakeup latency
caused by going into stop states. The motivation behind this program is
to find significant deviations behind advertised latency and residency
values.

The patchset measures latencies for two kinds of events. IPIs and Timers
As this is a software-only mechanism, there will be additional latencies
of the kernel-firmware-hardware interactions. To account for that, the
program also measures a baseline latency on a 100 percent loaded CPU
and the latencies achieved must be in view relative to that.

To achieve this, we introduce a kernel module and expose its control
knobs through the debugfs interface that the selftests can engage with.

The kernel module provides the following interfaces within
/sys/kernel/debug/powerpc/latency_test/ for,

IPI test:
    ipi_cpu_dest = Destination CPU for the IPI
    ipi_cpu_src = Origin of the IPI
    ipi_latency_ns = Measured latency time in ns
Timeout test:
    timeout_cpu_src = CPU on which the timer to be queued
    timeout_expected_ns = Timer duration
    timeout_diff_ns = Difference of actual duration vs expected timer

Sample output is as follows:

# --IPI Latency Test---
# Baseline Avg IPI latency(ns): 2720
# Observed Avg IPI latency(ns) - State snooze: 2565
# Observed Avg IPI latency(ns) - State stop0_lite: 3856
# Observed Avg IPI latency(ns) - State stop0: 3670
# Observed Avg IPI latency(ns) - State stop1: 3872
# Observed Avg IPI latency(ns) - State stop2: 17421
# Observed Avg IPI latency(ns) - State stop4: 1003922
# Observed Avg IPI latency(ns) - State stop5: 1058870
#
# --Timeout Latency Test--
# Baseline Avg timeout diff(ns): 1435
# Observed Avg timeout diff(ns) - State snooze: 1709
# Observed Avg timeout diff(ns) - State stop0_lite: 2028
# Observed Avg timeout diff(ns) - State stop0: 1954
# Observed Avg timeout diff(ns) - State stop1: 1895
# Observed Avg timeout diff(ns) - State stop2: 14556
# Observed Avg timeout diff(ns) - State stop4: 873988
# Observed Avg timeout diff(ns) - State stop5: 959137

Aboorva Devarajan (2):
  powerpc/cpuidle: cpuidle wakeup latency based on IPI and timer events
  powerpc/selftest: Add support for cpuidle latency measurement

 arch/powerpc/Kconfig.debug                    |  10 +
 arch/powerpc/kernel/Makefile                  |   1 +
 arch/powerpc/kernel/test_cpuidle_latency.c    | 154 ++++++
 tools/testing/selftests/powerpc/Makefile      |   1 +
 .../powerpc/cpuidle_latency/.gitignore        |   2 +
 .../powerpc/cpuidle_latency/Makefile          |   6 +
 .../cpuidle_latency/cpuidle_latency.sh        | 443 ++++++++++++++++++
 .../powerpc/cpuidle_latency/settings          |   1 +
 8 files changed, 618 insertions(+)
 create mode 100644 arch/powerpc/kernel/test_cpuidle_latency.c
 create mode 100644 tools/testing/selftests/powerpc/cpuidle_latency/.gitignore
 create mode 100644 tools/testing/selftests/powerpc/cpuidle_latency/Makefile
 create mode 100755 tools/testing/selftests/powerpc/cpuidle_latency/cpuidle_latency.sh
 create mode 100644 tools/testing/selftests/powerpc/cpuidle_latency/settings

-- 
2.25.1

