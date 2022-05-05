Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3CE51BC53
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 11:41:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kv7xC3rt8z3bsD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 19:41:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Fjom7Z6+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Fjom7Z6+; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kv7wW4lzcz2yWn
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 May 2022 19:40:27 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2458hOEU002304;
 Thu, 5 May 2022 09:40:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=D2TPjhzAs2jp7D9rdNF3A46TaNXeNkqQbX/SRREuNjc=;
 b=Fjom7Z6+AnibvCG3BV5aIZ+DMn/w0mZ6Y1MEK8A8RYTdutUUfOTVpL3o4pGkDv+dLtet
 Vi0relr8Z9OGLp867f7PBWETs/9oaAlmmkY+eIg39+sagHy+EFTWAZ+LR78BxH8/XI7o
 n6jGVKiWcREF87EXqwMKBUmtrJbuiY6NdIVmLYtaEVhfSilzc1GMQOg1qGff1ubC+LpA
 xYZvMHRVR5bQhCcvNIhJq4eXe+Yh6N4jmtplBJmU4/HffXWb1w2Q9A5ehypjZA3q7bFk
 QyNPxw+vhWgmPdAAzok/XGfrvqOxNJp0vyyT2IvqBNYlTZulI0bZ969ZAeiz+OdWJ2ZE XQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fv8gd3vmj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 May 2022 09:40:19 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2458lmoQ015244;
 Thu, 5 May 2022 09:40:18 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fv8gd3vm3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 May 2022 09:40:18 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2459Yds5022130;
 Thu, 5 May 2022 09:40:16 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06ams.nl.ibm.com with ESMTP id 3frvcj6yu3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 May 2022 09:40:16 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 2459QoKx38994268
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 May 2022 09:26:50 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BE940A404D;
 Thu,  5 May 2022 09:40:12 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8EDD0A4051;
 Thu,  5 May 2022 09:40:06 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.211.80.15])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  5 May 2022 09:40:06 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, disgoel@linux.vnet.ibm.com
Subject: [PATCH V2 0/2] Fix session topology test for powerpc and add utility
 function to get cpuinfo entries
Date: Thu,  5 May 2022 15:09:58 +0530
Message-Id: <20220505094000.58220-1-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: s6yAp5_AfYv34KDrJpywd8YCtlkjNqhv
X-Proofpoint-GUID: arSOwJ20MxJEM8JktwZ9JPEWpDBYe2Fc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-05_04,2022-05-05_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0
 malwarescore=0 mlxscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 mlxlogscore=999 suspectscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205050067
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
Cc: irogers@google.com, maddy@linux.vnet.ibm.com, rnsastry@linux.ibm.com,
 linux-perf-users@vger.kernel.org, kjain@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The session topology test fails in powerpc pSeries platform.
Test logs:
<<>>
Session topology : FAILED!
<<>>

This test uses cpu topology information and in powerpc,
some of the topology info is restricted in environment
like virtualized platform. Hence this test needs to be
skipped in pSeries platform for powerpc. The information
about platform is available in /proc/cpuinfo.

Patch 1 adds generic utility function in "util/header.c"
to read /proc/cpuinfo for any entry. Though the testcase
fix needs value from "platform" entry, making this as a
generic function to return value for any entry from the
/proc/cpuinfo file which can be used commonly in future
usecases.

Patch 2 uses the newly added utility function to look for
platform and skip the test in pSeries platform for powerpc.

Athira Rajeev (2):
  tools/perf: Add utility function to read /proc/cpuinfo for any field
  tools/perf/tests: Fix session topology test to skip the test in guest
    environment

Changelog:
 V1 -> v2:
 Addressed review comments from Kajol.
 Use "strim" to remove space from string. Also
 use "feof" to check for EOF instead of using new
 variable "ret".

 tools/perf/tests/topology.c | 17 ++++++++++++
 tools/perf/util/header.c    | 53 +++++++++++++++++++++++++++++++++++++
 tools/perf/util/header.h    |  1 +
 3 files changed, 71 insertions(+)

-- 
2.35.1

