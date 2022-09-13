Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A674B5B6CA9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Sep 2022 13:58:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MRhnV33Nxz3dqp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Sep 2022 21:58:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oxIL+FxY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oxIL+FxY;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MRhmF5VdHz3cdC
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Sep 2022 21:57:33 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28DB7Epc017177;
	Tue, 13 Sep 2022 11:57:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=VdNIaRriGsat3H5bAiqs8VvpJkBHpG0h/w/r0HxQnds=;
 b=oxIL+FxYzadDY2mJvXOc0QICEVH6QO9FWS9bfYdmeTULBlqfvILs2DoJEW2fov5eGaRP
 vqIyYBE926lHGlEIXZmlTZrqDpDl5PoFZnjeKf33bba8+FdYUaYwV7cpJ6NETC1WGBRQ
 NBd7CygsKW/VM6bs8z5Nn4PsrKrGt39m+gjTl3DxrOIc95EZltw3y7YP0X1xR/Dj2aKd
 0M9ozms/IXt8ZujQO+6Go7Pm9AHLhvQEX+Ip83dRRRB8dB83Nsm+qQ2GtOdHf0hFe2E9
 /okXGIfrd7Kz4JCt/+M0AJwlvivDxgoFMsDvXEOlnfL/MeIa0zsWduMGO8ZIEQFW8lnI zg== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jjrq61j71-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Sep 2022 11:57:26 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28DBop2D002162;
	Tue, 13 Sep 2022 11:57:24 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma04fra.de.ibm.com with ESMTP id 3jgj78ts4s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Sep 2022 11:57:24 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28DBrbKP17105270
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 Sep 2022 11:53:37 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F33EEA4051;
	Tue, 13 Sep 2022 11:57:20 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B9F2CA404D;
	Tue, 13 Sep 2022 11:57:18 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.78.239])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue, 13 Sep 2022 11:57:18 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, mpe@ellerman.id.au
Subject: [PATCH] tools/perf: Fix aggr_printout to display cpu field irrespective of core value
Date: Tue, 13 Sep 2022 17:27:17 +0530
Message-Id: <20220913115717.36191-1-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: RmLBC_-J-_Qb8vDHGDECPKfyV9Z1gXDu
X-Proofpoint-GUID: RmLBC_-J-_Qb8vDHGDECPKfyV9Z1gXDu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-13_05,2022-09-13_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 priorityscore=1501 malwarescore=0 mlxlogscore=999 clxscore=1015
 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209130052
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
Cc: maddy@linux.vnet.ibm.com, rnsastry@linux.ibm.com, kjain@linux.ibm.com, linux-perf-users@vger.kernel.org, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

perf stat includes option to specify aggr_mode to display
per-socket, per-core, per-die, per-node counter details.
Also there is option -A ( AGGR_NONE, -no-aggr ), where the
counter values are displayed for each cpu along with "CPU"
value in one field of the output.

Each of the aggregate mode uses the information fetched
from "/sys/devices/system/cpu/cpuX/topology" like core_id,
physical_package_id. Utility functions in "cpumap.c" fetches
this information and populates the socket id, core id, cpu etc.
If the platform does not expose the topology information,
these values will be set to -1. Example, in case of powerpc,
details like physical_package_id is restricted to be exposed
in pSeries platform. So id.socket, id.core, id.cpu all will
be set as -1.

In case of displaying socket or die value, there is no check
done in the "aggr_printout" function to see if it points to
valid socket id or die. But for displaying "cpu" value, there
is a check for "if (id.core > -1)". In case of powerpc pSeries
where detail like physical_package_id is restricted to be
exposed, id.core will be set to -1. Hence the column or field
itself for CPU won't be displayed in the output.

Result for per-socket:

<<>>
perf stat -e branches --per-socket -a true

 Performance counter stats for 'system wide':

S-1      32            416,851      branches
<<>>

Here S has -1 in above result. But with -A option which also
expects CPU in one column in the result, below is observed.

<<>>
 /bin/perf stat -e instructions -A -a true

 Performance counter stats for 'system wide':

            47,146      instructions
            45,226      instructions
            43,354      instructions
            45,184      instructions
<<>>

If the cpu id value is pointing to -1 also, it makes sense
to display the column in the output to replicate the behaviour
or to be in precedence with other aggr options(like per-socket,
per-core). Remove the check "id.core" so that CPU field gets
displayed in the output.

After the fix:

<<>>
perf stat -e instructions -A -a true

 Performance counter stats for 'system wide':

CPU-1                  64,034      instructions
CPU-1                  68,941      instructions
CPU-1                  59,418      instructions
CPU-1                  70,478      instructions
CPU-1                  65,201      instructions
CPU-1                  63,704      instructions
<<>>

This is caught while running "perf test" for
"stat+json_output.sh" and "stat+csv_output.sh".

Reported-by: Disha Goel <disgoel@linux.vnet.ibm.com>
Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 tools/perf/util/stat-display.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/tools/perf/util/stat-display.c b/tools/perf/util/stat-display.c
index b82844cb0ce7..1b751a730271 100644
--- a/tools/perf/util/stat-display.c
+++ b/tools/perf/util/stat-display.c
@@ -168,10 +168,9 @@ static void aggr_printout(struct perf_stat_config *config,
 					id.socket,
 					id.die,
 					id.core);
-			} else if (id.core > -1) {
+			} else
 				fprintf(config->output, "\"cpu\" : \"%d\", ",
 					id.cpu.cpu);
-			}
 		} else {
 			if (evsel->percore && !config->percore_show_thread) {
 				fprintf(config->output, "S%d-D%d-C%*d%s",
@@ -179,11 +178,10 @@ static void aggr_printout(struct perf_stat_config *config,
 					id.die,
 					config->csv_output ? 0 : -3,
 					id.core, config->csv_sep);
-			} else if (id.core > -1) {
+			} else
 				fprintf(config->output, "CPU%*d%s",
 					config->csv_output ? 0 : -7,
 					id.cpu.cpu, config->csv_sep);
-			}
 		}
 		break;
 	case AGGR_THREAD:
-- 
2.31.1

