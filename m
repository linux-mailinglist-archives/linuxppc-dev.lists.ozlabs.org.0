Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2114A7979D0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Sep 2023 19:21:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VjdwKX8M;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RhQxz6gYgz3dDw
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Sep 2023 03:21:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VjdwKX8M;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RhQwb5f6Jz3cnT
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Sep 2023 03:19:59 +1000 (AEST)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 387H8SHt017027;
	Thu, 7 Sep 2023 17:19:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=NsenYzBx6lluuRqNF2twSn+96C52XaMWkD4/qQRlKtU=;
 b=VjdwKX8M8twSGTVGR5NFzl2J6gaqdl3hXHgX6hmnyrbO0KV8astrP1njgQNzJyilVxLE
 ds0j1yOLYKv1rMJwrBvVrV1Xy3vCT6jFnpNN6QTh5TNwH5RrMUO1CWAyWP8ROLgZ80KE
 NcfhIEhoHDMZ2fJ47mIDFnjAriYGY7LhcH4jYJf1JBM3Y64oJWvhyHG0l2sSXNpnRGwz
 vfxEctjvTa9dJtZOzcJob+J7Qlhq+NF3VGTCYiA2ZiIb9/GzdFqRYT8KbvTQX/MM7J1D
 qEhSTw81UKscszFs9Q6eHYJ4RlYxa6ClG5Elwrr3lujvWZ/kE6UwGKC86KY5JpuyJg5T FA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3syj3u145n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Sep 2023 17:19:54 +0000
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 387H8u9E019551;
	Thu, 7 Sep 2023 17:19:54 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3syj3u145b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Sep 2023 17:19:54 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 387FNs4S021441;
	Thu, 7 Sep 2023 17:19:52 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3svfrywmkd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Sep 2023 17:19:52 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 387HJnQh27984380
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 7 Sep 2023 17:19:49 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8CADD2004B;
	Thu,  7 Sep 2023 17:19:49 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3C24C20043;
	Thu,  7 Sep 2023 17:19:47 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.9.102])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  7 Sep 2023 17:19:47 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org
Subject: [PATCH] tools/perf: Add includes for detected configs in Makefile.perf
Date: Thu,  7 Sep 2023 22:49:44 +0530
Message-Id: <20230907171944.36953-1-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 9CmyjHzwNiS1t-TN86MlxcnQKJENT6BR
X-Proofpoint-ORIG-GUID: DoOq1o8yDcIRCJXeuYNzvcbjZMSff-tv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-07_09,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 suspectscore=0 mlxlogscore=999 spamscore=0 phishscore=0 impostorscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
 tools/perf/Makefile.perf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index 37af6df7b978..6764b0e156f4 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -351,6 +351,9 @@ export PYTHON_EXTBUILD_LIB PYTHON_EXTBUILD_TMP
 
 python-clean := $(call QUIET_CLEAN, python) $(RM) -r $(PYTHON_EXTBUILD) $(OUTPUT)python/perf*.so
 
+# Use the detected configuration
+include .config-detected
+
 ifeq ($(CONFIG_LIBTRACEEVENT),y)
   PYTHON_EXT_SRCS := $(shell grep -v ^\# util/python-ext-sources)
 else
-- 
2.31.1

