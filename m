Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4230642220B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 11:20:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNsWP1YlWz301s
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 20:20:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TaBfo1H0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=TaBfo1H0; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNsVd5936z2yPR
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Oct 2021 20:19:53 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1958g82k024319; 
 Tue, 5 Oct 2021 05:19:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=4KWtlySNTnqXB8CFgnNbWgTinUBqt+TDSXQNhwqkcs0=;
 b=TaBfo1H0odQKIJBKeAPqkw8VXiyPhQMhJIR5owlTZLhHog8FXrsCVWXWXyPYHfZm+RC+
 wFJHT5OzLobwG7Anodh4DVj2sX55UrkE6VLlyGNPziCV2DZhdgeSoFsUuBgGre3PmZHl
 hRf17OTsO51rYn8mIdWa7cr5r2d55O+2Omnce4g5vjfrm3fHeUzcUVFr2SvNdqBqoiY+
 VfV5MEwXQgfW75tJ1Sw496Rw5HZB3FkynwrGUOsExHc29DsK5w2R880380+yw8ehoG0f
 EKG++wHnKtdpHhjN/7TVTdVpfAgtsHD9Zi4qIgleLvp3j7/dRD4nCMnDVp+UIeEowaXZ eQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bgkdw8rx9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Oct 2021 05:19:22 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1959I2sL025054;
 Tue, 5 Oct 2021 05:19:22 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bgkdw8rw9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Oct 2021 05:19:21 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1959CViH022035;
 Tue, 5 Oct 2021 09:19:18 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06ams.nl.ibm.com with ESMTP id 3beepjgfkm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Oct 2021 09:19:18 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1959JDuA40173884
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 5 Oct 2021 09:19:13 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4EAD8A4080;
 Tue,  5 Oct 2021 09:19:13 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E7A96A406F;
 Tue,  5 Oct 2021 09:19:03 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown
 [9.43.64.84])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  5 Oct 2021 09:19:03 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, peterz@infradead.org, mingo@redhat.com,
 acme@kernel.org, jolsa@kernel.org, namhyung@kernel.org, ak@linux.intel.com
Subject: [PATCH 1/4] perf: Add comment about current state of PERF_MEM_LVL_*
 namespace and remove an extra line
Date: Tue,  5 Oct 2021 14:48:34 +0530
Message-Id: <20211005091837.250044-1-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: tGFMIXsCZcH_fh0aN6SIELorgBuR0UKd
X-Proofpoint-GUID: 1wCRPklwI3u1dYJI1JF0PA0VZpJADI8p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-04_05,2021-10-04_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 clxscore=1011 mlxlogscore=999 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110050052
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
Cc: mark.rutland@arm.com, songliubraving@fb.com, atrajeev@linux.vnet.ibm.com,
 daniel@iogearbox.net, rnsastry@linux.ibm.com,
 alexander.shishkin@linux.intel.com, kjain@linux.ibm.com, ast@kernel.org,
 linux-perf-users@vger.kernel.org, yao.jin@linux.intel.com, maddy@linux.ibm.com,
 paulus@samba.org, kan.liang@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add a comment about PERF_MEM_LVL_* namespace being depricated
to some extent in favour of added PERF_MEM_{LVLNUM_,REMOTE_,SNOOPX_}
fields.

Remove an extra line present in perf_mem__lvl_scnprintf function.

Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 include/uapi/linux/perf_event.h       | 8 +++++++-
 tools/include/uapi/linux/perf_event.h | 8 +++++++-
 tools/perf/util/mem-events.c          | 1 -
 3 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/include/uapi/linux/perf_event.h b/include/uapi/linux/perf_event.h
index f92880a15645..e1701e9c7858 100644
--- a/include/uapi/linux/perf_event.h
+++ b/include/uapi/linux/perf_event.h
@@ -1241,7 +1241,13 @@ union perf_mem_data_src {
 #define PERF_MEM_OP_EXEC	0x10 /* code (execution) */
 #define PERF_MEM_OP_SHIFT	0
 
-/* memory hierarchy (memory level, hit or miss) */
+/*
+ * PERF_MEM_LVL_* namespace being depricated to some extent in the
+ * favour of newer composite PERF_MEM_{LVLNUM_,REMOTE_,SNOOPX_} fields.
+ * Supporting this namespace inorder to not break defined ABIs.
+ *
+ * memory hierarchy (memory level, hit or miss)
+ */
 #define PERF_MEM_LVL_NA		0x01  /* not available */
 #define PERF_MEM_LVL_HIT	0x02  /* hit level */
 #define PERF_MEM_LVL_MISS	0x04  /* miss level  */
diff --git a/tools/include/uapi/linux/perf_event.h b/tools/include/uapi/linux/perf_event.h
index f92880a15645..e1701e9c7858 100644
--- a/tools/include/uapi/linux/perf_event.h
+++ b/tools/include/uapi/linux/perf_event.h
@@ -1241,7 +1241,13 @@ union perf_mem_data_src {
 #define PERF_MEM_OP_EXEC	0x10 /* code (execution) */
 #define PERF_MEM_OP_SHIFT	0
 
-/* memory hierarchy (memory level, hit or miss) */
+/*
+ * PERF_MEM_LVL_* namespace being depricated to some extent in the
+ * favour of newer composite PERF_MEM_{LVLNUM_,REMOTE_,SNOOPX_} fields.
+ * Supporting this namespace inorder to not break defined ABIs.
+ *
+ * memory hierarchy (memory level, hit or miss)
+ */
 #define PERF_MEM_LVL_NA		0x01  /* not available */
 #define PERF_MEM_LVL_HIT	0x02  /* hit level */
 #define PERF_MEM_LVL_MISS	0x04  /* miss level  */
diff --git a/tools/perf/util/mem-events.c b/tools/perf/util/mem-events.c
index f0e75df72b80..ff7289e28192 100644
--- a/tools/perf/util/mem-events.c
+++ b/tools/perf/util/mem-events.c
@@ -320,7 +320,6 @@ int perf_mem__lvl_scnprintf(char *out, size_t sz, struct mem_info *mem_info)
 	/* already taken care of */
 	m &= ~(PERF_MEM_LVL_HIT|PERF_MEM_LVL_MISS);
 
-
 	if (mem_info && mem_info->data_src.mem_remote) {
 		strcat(out, "Remote ");
 		l += 7;
-- 
2.26.2

