Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A6D79893C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Sep 2023 16:51:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=J4Ixs0xg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rhzb93JRhz3cK8
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Sep 2023 00:51:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=J4Ixs0xg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RhzZG2ZSqz30gH
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Sep 2023 00:51:01 +1000 (AEST)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 388Ejx6L031313;
	Fri, 8 Sep 2023 14:50:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=FHcGlw/HUIejK0iC+SukPZQTuP9xnez8jr8uT4B6EjM=;
 b=J4Ixs0xgNDU+UTHw2RlFb/0dVGacOukekPoag+rw5pooJcdzb9EXfmpz3sfBZiJXmwQ0
 FY2HCRL9l3qV/bEi8BL3un8ZZR9MU/AX7UGJRZdxINhdf7S5HtQC3f78heeNDRIGLdjv
 3Hh8eTrMsIFL2LUm5ifEi+wNd6SfdsQuggKWjAC3+PcHsIHSEN7GOog3aT945yQbmE7F
 7MnvzTJwe0yjD0PONz5td31V93FCGG7dbwcHLHLljshml2JMyODywgjqLZq+J5qybNSZ
 d2G6Y3foImpgXF7zzemBBlEgIj1GTkQDl9SQFHUggFd6TvtDyNX43ofwqWugxsHVWM7e fg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t05afgu7x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Sep 2023 14:50:56 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 388EnB7S009937;
	Fri, 8 Sep 2023 14:50:55 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t05afgu7f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Sep 2023 14:50:55 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 388Ci8dL001614;
	Fri, 8 Sep 2023 14:50:54 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3svfctcqgu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Sep 2023 14:50:54 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 388EopGK62521612
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 8 Sep 2023 14:50:52 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D6DF420043;
	Fri,  8 Sep 2023 14:50:51 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8E73920040;
	Fri,  8 Sep 2023 14:50:49 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.123.252])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  8 Sep 2023 14:50:49 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org
Subject: [PATCH V2] tools/perf: Add includes for detected configs in Makefile.perf
Date: Fri,  8 Sep 2023 20:20:45 +0530
Message-Id: <20230908145045.47408-1-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 9xcpWUnkaWfmKD28UCCghCEY5vv0xhBi
X-Proofpoint-GUID: DgxBA91vzEQPZF9Oc1fDyit5ta1Z3c7j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-08_11,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 mlxscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2309080135
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

Makefile.perf uses "CONFIG_*" checks in the code. Example the config
for libtraceevent is used to set PYTHON_EXT_SRCS

	ifeq ($(CONFIG_LIBTRACEEVENT),y)
	  PYTHON_EXT_SRCS := $(shell grep -v ^\# util/python-ext-sources)
	else
	  PYTHON_EXT_SRCS := $(shell grep -v '^\#\|util/trace-event.c' util/python-ext-sources)
	endif

But this is not picking the value for CONFIG_LIBTRACEEVENT that is
set using the settings in Makefile.config. Include the file
".config-detected" so that make will use the system detected
configuration in the CONFIG checks. This will fix isues that
could arise when other "CONFIG_*" checks are added to Makefile.perf
in future as well.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
Changelog:
 v1 -> v2:
 Added $(OUTPUT) prefix to config-detected as pointed
 out by Ian

 tools/perf/Makefile.perf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index 37af6df7b978..66b9dc61c32f 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -351,6 +351,9 @@ export PYTHON_EXTBUILD_LIB PYTHON_EXTBUILD_TMP
 
 python-clean := $(call QUIET_CLEAN, python) $(RM) -r $(PYTHON_EXTBUILD) $(OUTPUT)python/perf*.so
 
+# Use the detected configuration
+include $(OUTPUT).config-detected
+
 ifeq ($(CONFIG_LIBTRACEEVENT),y)
   PYTHON_EXT_SRCS := $(shell grep -v ^\# util/python-ext-sources)
 else
-- 
2.31.1

