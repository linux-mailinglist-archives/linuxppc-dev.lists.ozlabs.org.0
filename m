Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEAA37C7EA4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Oct 2023 09:34:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aaHk70p6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S6JD84C1nz3dC5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Oct 2023 18:34:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aaHk70p6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S6J8V5QxMz3bYc
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Oct 2023 18:31:06 +1100 (AEDT)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39D7QR15016091;
	Fri, 13 Oct 2023 07:30:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=PZcn3Fv4gRUXZDkr1qH1Xsndhw6sXPvItkl6A6F4V2I=;
 b=aaHk70p6Sdg14piObE3UtJKu3j7T4x7VsGRd8wADiJL+wkALQT917fGIpZjyZ3BvUu2k
 cve1JcBCPz/FNm+jrNqx2emDCeujOgWGpQe8/3Iy91ux2UqNLgUfFutqvsVaN6ZZML6Z
 4uxy4eQHFdVGs4DYIxQiOcPa0TJGl+KU1uCtsPw8XJLVdT8VqUdhYDGmWbRY9WeaH9hH
 gp6Pfm/9vvRhiRGsS4FYIpRcxX9WAIpw1JbsyKN9qEHWfm3Gfn0vcAtPbqbW6VMNy3p0
 f/SZBteGPxMlgYV1LEbWrZgVW9hG9KX6z8+x0XYDL90O2oZ04TCQcDoZtmK6GJUJHbBS jA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tq15bgj95-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Oct 2023 07:30:35 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39D7QTHU016361;
	Fri, 13 Oct 2023 07:30:35 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tq15bgj8r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Oct 2023 07:30:35 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39D5PO5H029739;
	Fri, 13 Oct 2023 07:30:34 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tpt5bjbb5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Oct 2023 07:30:34 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39D7URKS3736246
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 Oct 2023 07:30:27 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F29EE2004E;
	Fri, 13 Oct 2023 07:30:26 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 197EE20043;
	Fri, 13 Oct 2023 07:30:25 +0000 (GMT)
Received: from athiras-mbp.in.ibm.com (unknown [9.109.214.47])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 13 Oct 2023 07:30:24 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org
Subject: [PATCH V2 0/3] Fix for shellcheck issues with latest scripts in tests/shell
Date: Fri, 13 Oct 2023 13:00:18 +0530
Message-Id: <20231013073021.99794-1-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: rgqWIhMhFOnjlH99B2bhDgw9JFTcu9kC
X-Proofpoint-GUID: 4mfAP3UJKOVpSQQ5Q2c22I75q1wl8Uql
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-13_03,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0 mlxlogscore=740
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310130061
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
Cc: atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com, linux-perf-users@vger.kernel.org, maddy@linux.ibm.com, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

shellcheck was run on perf tool shell scripts as a pre-requisite
to include a build option for shellcheck discussed here:
https://www.spinics.net/lists/linux-perf-users/msg25553.html

And fixes were added for the coding/formatting issues in
two patchsets:
https://lore.kernel.org/linux-perf-users/20230613164145.50488-1-atrajeev@linux.vnet.ibm.com/
https://lore.kernel.org/linux-perf-users/20230709182800.53002-1-atrajeev@linux.vnet.ibm.com/

Three additional issues were observed and fixes are part of:
git://git.kernel.org/pub/scm/linux/kernel/git/acme/linux.git

With recent commits in perf, other three issues are observed.
shellcheck version: 0.6.0
The changes are with recent commits ( which is mentioned in each patch)
for lock_contention, record_sideband and stat_all_metricgroups test.
Patch series fixes these testcases and patches are on top of:
git://git.kernel.org/pub/scm/linux/kernel/git/acme/linux.git

The version 1 patchset had fix patch for test_arm_coresight.sh.
Dropping that in V2 based on discussion here:
https://lore.kernel.org/linux-perf-users/F265857D-0D37-4878-908C-D20732F212F9@linux.vnet.ibm.com/T/#u

Athira Rajeev (3):
  tools/perf/tests Ignore the shellcheck SC2046 warning in
    lock_contention
  tools/perf/tests: Fix shellcheck warning in record_sideband.sh test
  tools/perf/tests/shell: Fix shellcheck warning SC2112 with
    stat_all_metricgroups

 tools/perf/tests/shell/lock_contention.sh       | 1 +
 tools/perf/tests/shell/record_sideband.sh       | 2 +-
 tools/perf/tests/shell/stat_all_metricgroups.sh | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)

-- 
2.31.1

