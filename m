Return-Path: <linuxppc-dev+bounces-2082-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E372A9998E2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2024 03:15:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPpb36Bsrz3btR;
	Fri, 11 Oct 2024 12:15:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728570669;
	cv=none; b=arrhEeWbLsigxw+XolGmbUYVYuD088zbZir6Y0slLpEYrpTHc0ngU8Fo/yOBtK7wPv++mmjVJ8ElBCuH1UDC0SlnjeTByrqLxqMpC2dwdPwJ8ae7kLzEDuiqvpU89SRU/iqotcDI4+gMHaFeoyVwxTCjN24wcDf1/4BDyOHlx1nS0r536SRHyZ7eHhl6edX9fBGWKvrxg9DgQw7P8sP1XdFwPxble9ATW4rN1PuMfu3nYj66UiN8ojGmPzxz/oj9q673YM4gpDsoHimQ9pL/9lsDvLnFvCm4XiOspw6hUztU/5asq9n3wp7Bz1SIYZNUntePacRqt5inWt7iVPui6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728570669; c=relaxed/relaxed;
	bh=y/M2n1FmX9ppasHgfRkb35Rzv4ll+ENmXS9vSuJHhRU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=J8trQ8wmR+auXL8XvN7/+XWLm95XS0Cctf/cnz53yY3jX8TpQo3S4PbTJpN8/NyevMUwqO2RlgXvusF9sYUZGI6PhXp5IJWm1kHARECdf8aVt/3UqOPFwrieWY/lMLRREL7HbnC6p1FFWNOoCJ+My2x2+C4q4cLJQI1xqLaqH9hNm4Cz8lqLq/MgxKRpiAXFRxW0FrC8SII051s/cLIjFDg0x2XrGeIplfx0iHlF4D1gEdJ7HN9UD3N47A+8lKX/0EK2toNAZfeAjzUcrOfboximIX2z3l32z/f1tFjn9zh9b2FKGF/UjAhYOeRK1XWZM6TqJCgcmDuuI6deEtje4A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nejMMP82; dkim-atps=neutral; spf=none (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nejMMP82;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPXHc754Vz2yV3
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 01:31:08 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49AEKe47021953;
	Thu, 10 Oct 2024 14:31:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=pp1; bh=y/M2n1FmX9ppa
	sHgfRkb35Rzv4ll+ENmXS9vSuJHhRU=; b=nejMMP82UEruE8Fjl+xaLCc6sYWHe
	oOD7KLqPEop1aFsIlnA2vXvua7Hd3tthGluFbaguy17De23YfR1igP8EAHJ6ZNyf
	4ZoW3KBHD5GufhpxhjFSr/wslSobhA5jDPMRxc3UAwFnvE0/yf7H2G66g+CLkXSO
	hGpNJiQ5xJFhEUqARVWhjYZScMwI+r108lUbxAWYN9L8vXulncWPilyLhdarJTgz
	yKYZorhw67IJyTJFkPudpekp512B8L6JVgIy6vBK0t6ad5qydy1CI+BiduN6jXc1
	sdCJi6hVBj6fWOa943B+4fMHshDOHkVN3pqLiYrlbdKVKpmZigXzHl+mQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 426gkp01r2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 14:31:04 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 49AEV4Jg013538;
	Thu, 10 Oct 2024 14:31:04 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 426gkp01qt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 14:31:04 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 49AE0ZR9022852;
	Thu, 10 Oct 2024 14:31:03 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 423jg17xhp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 14:31:03 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 49AEUxsK49807676
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Oct 2024 14:30:59 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AA47A20043;
	Thu, 10 Oct 2024 14:30:59 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E199920040;
	Thu, 10 Oct 2024 14:30:53 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.254.159])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 10 Oct 2024 14:30:53 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org, hbathini@linux.ibm.com
Cc: linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, akanksha@linux.ibm.com,
        maddy@linux.ibm.com, atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com,
        disgoel@linux.vnet.ibm.com
Subject: [PATCH V3 2/2] tools/perf: Add support to handle compatible mode PVR for perf json events
Date: Thu, 10 Oct 2024 20:00:35 +0530
Message-Id: <20241010143035.50907-2-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20241010143035.50907-1-atrajeev@linux.vnet.ibm.com>
References: <20241010143035.50907-1-atrajeev@linux.vnet.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 6a7K8nSkPiEL9_vTEwrxCyqwRt2g8a1O
X-Proofpoint-GUID: YYxfAFgBDTKw8NWb6vx1QTOaN_2k0bpp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-10_11,2024-10-10_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410100096
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_NONE autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

perf list picks the events supported for specific platform
from pmu-events/arch/powerpc/<platform>. Example power10 events
are in pmu-events/arch/powerpc/power10, power9 events are part
of pmu-events/arch/powerpc/power9. The decision of which
platform to pick is determined based on PVR value in powerpc.
The PVR value is matched from pmu-events/arch/powerpc/mapfile.csv

Example:

Format:
	PVR,Version,JSON/file/pathname,Type

0x004[bcd][[:xdigit:]]{4},1,power8,core
0x0066[[:xdigit:]]{4},1,power8,core
0x004e[[:xdigit:]]{4},1,power9,core
0x0080[[:xdigit:]]{4},1,power10,core
0x0082[[:xdigit:]]{4},1,power10,core

The code gets the PVR from system using get_cpuid_str function
in arch/powerpc/util/headers.c ( from SPRN_PVR ) and compares
with value from mapfile.csv
In case of compat mode, say when partition is booted in a power9
mode when the system is a power10, this picks incorrectly. Because
PVR will point to power10 where as it should pick events from power9
folder. To support generic events, add new folder
pmu-events/arch/powerpc/compat to contain the ISA architected events
which is supported in compat mode. Also return 0x00ffffff as pvr
when booted in compat mode. Based on this pvr value, json will
pick events from pmu-events/arch/powerpc/compat

Suggested-by: Madhavan Srinivasan <maddy@linux.ibm.com>
Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---

 tools/perf/arch/powerpc/util/header.c | 32 ++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/tools/perf/arch/powerpc/util/header.c b/tools/perf/arch/powerpc/util/header.c
index 6b00efd53638..adc82c479443 100644
--- a/tools/perf/arch/powerpc/util/header.c
+++ b/tools/perf/arch/powerpc/util/header.c
@@ -10,6 +10,18 @@
 #include "utils_header.h"
 #include "metricgroup.h"
 #include <api/fs/fs.h>
+#include <sys/auxv.h>
+
+static bool is_compat_mode(void)
+{
+	u64 base_platform = getauxval(AT_BASE_PLATFORM);
+	u64 platform = getauxval(AT_PLATFORM);
+
+	if (!strcmp((char *)platform, (char *)base_platform))
+		return false;
+
+	return true;
+}
 
 int
 get_cpuid(char *buffer, size_t sz)
@@ -33,8 +45,26 @@ char *
 get_cpuid_str(struct perf_pmu *pmu __maybe_unused)
 {
 	char *bufp;
+	unsigned long pvr;
+
+	/*
+	 * IBM Power System supports compatible mode. That is
+	 * Nth generation platform can support previous generation
+	 * OS in a mode called compatibile mode. For ex. LPAR can be
+	 * booted in a Power9 mode when the system is a Power10.
+	 *
+	 * In the compatible mode, care must be taken when generating
+	 * PVR value. When read, PVR will be of the AT_BASE_PLATFORM
+	 * To support generic events, return 0x00ffffff as pvr when
+	 * booted in compat mode. Based on this pvr value, json will
+	 * pick events from pmu-events/arch/powerpc/compat
+	 */
+	if (!is_compat_mode())
+		pvr = mfspr(SPRN_PVR);
+	else
+		pvr = 0x00ffffff;
 
-	if (asprintf(&bufp, "0x%.8lx", mfspr(SPRN_PVR)) < 0)
+	if (asprintf(&bufp, "0x%.8lx", pvr) < 0)
 		bufp = NULL;
 
 	return bufp;
-- 
2.27.0


