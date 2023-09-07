Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA567979B8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Sep 2023 19:19:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=m3Bjkyye;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RhQvw65Hyz3cSY
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Sep 2023 03:19:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=m3Bjkyye;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RhQsY0tFPz3cLV
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Sep 2023 03:17:20 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 387GcfHP032220;
	Thu, 7 Sep 2023 17:17:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=5NNMF+fu6ffvmnhNyLZ9O7ef5xUtHi40ru+IwCQfc0k=;
 b=m3BjkyyeeRN8rHkTtW/SoBSMwRZiPYembobgJ1Z77vZubOfoGc9S6rQJ7QUxw5mZiWHI
 /+/4GIIy4dn5qX7UwESjeNTI27Ioanen3rsdQBL/ZCvQEvf04KXYHrUPYWrGcnz4j1BO
 xFlKZMWcH5cfiCgEnhhmhhr7TX6FLlvHwV7JFDzgi5ewLUBX99EGbwkNc8dephQPuxL1
 ek31bctLrvJfP1VLobNoeOr4vQZVaBRNKwekKwmj5m8v464z2HdntveRemmSSM69EOTZ
 h0Q50rFHiIK/MUg3BiHzcLe7mdmdUPUVo1sH3NdHBOq+2ENgrLohk90Q9wxE9inYmMjD Nw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3syfcunx64-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Sep 2023 17:17:05 +0000
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 387H6jhL019505;
	Thu, 7 Sep 2023 17:17:04 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3syfcunx5j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Sep 2023 17:17:04 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 387GB43A006611;
	Thu, 7 Sep 2023 17:17:03 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3svgvkw6vv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Sep 2023 17:17:03 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 387HFjcF60162304
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 7 Sep 2023 17:15:45 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9F3D32004B;
	Thu,  7 Sep 2023 17:15:45 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2576620040;
	Thu,  7 Sep 2023 17:15:43 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.9.102])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  7 Sep 2023 17:15:42 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org
Subject: [PATCH 0/3] Fix for shellcheck issues with version "0.6"
Date: Thu,  7 Sep 2023 22:45:37 +0530
Message-Id: <20230907171540.36736-1-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 1Xu-GhhzzET37QLetqtrs3uFI6wtU22k
X-Proofpoint-GUID: ZMBVyPGTmsizCfu2q_rMgrI7dlJRNzrq
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-07_09,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0 mlxlogscore=999
 mlxscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309070152
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
Cc: atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com, linux-perf-users@vger.kernel.org, maddy@linux.ibm.com, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, root <root@ltcden13-lp4.aus.stglabs.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: root <root@ltcden13-lp4.aus.stglabs.ibm.com>

shellcheck was run on perf tool shell scripts s a pre-requisite
to include a build option for shellcheck discussed here:
https://www.spinics.net/lists/linux-perf-users/msg25553.html

And fixes were added for the coding/formatting issues in
two patchsets:
https://lore.kernel.org/linux-perf-users/20230613164145.50488-1-atrajeev@linux.vnet.ibm.com/
https://lore.kernel.org/linux-perf-users/20230709182800.53002-1-atrajeev@linux.vnet.ibm.com/

Three additional issues are observed with shellcheck "0.6" and
this patchset covers those. With this patchset,

# for F in $(find tests/shell/ -perm -o=x -name '*.sh'); do shellcheck -S warning $F; done
# echo $?
0

Athira Rajeev (3):
  tests/shell: Fix shellcheck SC1090 to handle the location of sourced
    files
  tests/shell: Fix shellcheck issues in tests/shell/stat+shadow_stat.sh
    tetscase
  tests/shell: Fix shellcheck warnings for SC2153 in multiple scripts

 tools/perf/tests/shell/coresight/asm_pure_loop.sh            | 4 ++++
 tools/perf/tests/shell/coresight/memcpy_thread_16k_10.sh     | 4 ++++
 tools/perf/tests/shell/coresight/thread_loop_check_tid_10.sh | 4 ++++
 tools/perf/tests/shell/coresight/thread_loop_check_tid_2.sh  | 4 ++++
 tools/perf/tests/shell/coresight/unroll_loop_thread_10.sh    | 4 ++++
 tools/perf/tests/shell/probe_vfs_getname.sh                  | 2 ++
 tools/perf/tests/shell/record+probe_libc_inet_pton.sh        | 2 ++
 tools/perf/tests/shell/record+script_probe_vfs_getname.sh    | 2 ++
 tools/perf/tests/shell/record.sh                             | 1 +
 tools/perf/tests/shell/stat+csv_output.sh                    | 1 +
 tools/perf/tests/shell/stat+csv_summary.sh                   | 4 ++--
 tools/perf/tests/shell/stat+shadow_stat.sh                   | 4 ++--
 tools/perf/tests/shell/stat+std_output.sh                    | 1 +
 tools/perf/tests/shell/test_intel_pt.sh                      | 1 +
 tools/perf/tests/shell/trace+probe_vfs_getname.sh            | 1 +
 15 files changed, 35 insertions(+), 4 deletions(-)

-- 
2.31.1

