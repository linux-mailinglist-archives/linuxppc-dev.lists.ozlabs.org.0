Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8CD344872
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Mar 2021 16:01:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F3yPS68QGz3cJl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 02:01:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=k6SDdmAQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=k6SDdmAQ; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F3yLz4zXkz3bqS
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 01:59:07 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12MEYHvn024610; Mon, 22 Mar 2021 10:57:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=YiwQxgVLN0657IjKUnpLTKl0CNBhqh3iE8LhuYM6vPY=;
 b=k6SDdmAQEutn5E3xU8w/KBmYf1Mly9+BK6SnE5Cd/WiiDKDwfMjfr4fcHNLetv0oVeu2
 cEmyvHPEqCJz+hD1zCjYnc+Q5uQxu/2Wk3m7ma3GG+KAdXnAhxmFg1O5eXH65DvM2PV4
 QbcSOKBQP0tT2XZRZO9M20R+Q2snMZPQTvV3guG1wqlx7mriGc5LTj9jAyvOVTenCurW
 JYSmfpM/kCUR6yubuklw0slSVj175gvskOA8Jf6EJKDRp4XC2SJjnK6A69SK3eMmaI5x
 7ix3d+ARUsrVWDj+C6l5IHrqVNGhWkxen1+OaCnKQkXfRn4ppTeJlwWXX1Bgz5a09xDl kg== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37dx9xky9c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Mar 2021 10:57:53 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12MEhBeg023004;
 Mon, 22 Mar 2021 14:57:51 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma02fra.de.ibm.com with ESMTP id 37d9d8s8kr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Mar 2021 14:57:51 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12MEvn8B43188554
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 Mar 2021 14:57:49 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DCFA84C044;
 Mon, 22 Mar 2021 14:57:48 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0A6C44C04A;
 Mon, 22 Mar 2021 14:57:46 +0000 (GMT)
Received: from localhost.localdomain.localdomain (unknown [9.124.209.79])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 22 Mar 2021 14:57:45 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, mpe@ellerman.id.au, acme@kernel.org,
 jolsa@kernel.org
Subject: [PATCH V2 5/5] tools/perf: Display sort dimension p_stage_cyc only on
 supported archs
Date: Mon, 22 Mar 2021 10:57:27 -0400
Message-Id: <1616425047-1666-6-git-send-email-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1616425047-1666-1-git-send-email-atrajeev@linux.vnet.ibm.com>
References: <1616425047-1666-1-git-send-email-atrajeev@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-22_07:2021-03-22,
 2021-03-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 priorityscore=1501 spamscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103220103
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
Cc: kan.liang@linux.intel.com, ravi.bangoria@linux.ibm.com,
 peterz@infradead.org, maddy@linux.ibm.com, kjain@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The sort dimension "p_stage_cyc" is used to represent pipeline
stage cycle information. Presently, this is used only in powerpc.
For unsupported platforms, we don't want to display it
in the perf report output columns. Hence add check in sort_dimension__add()
and skip the sort key incase it is not applicable for the particular arch.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 tools/perf/arch/powerpc/util/event.c |  7 +++++++
 tools/perf/util/event.h              |  1 +
 tools/perf/util/sort.c               | 19 +++++++++++++++++++
 3 files changed, 27 insertions(+)

diff --git a/tools/perf/arch/powerpc/util/event.c b/tools/perf/arch/powerpc/util/event.c
index 22521bc9481a..3bf441257466 100644
--- a/tools/perf/arch/powerpc/util/event.c
+++ b/tools/perf/arch/powerpc/util/event.c
@@ -44,3 +44,10 @@ const char *arch_perf_header_entry(const char *se_header)
 		return "Dispatch Cyc";
 	return se_header;
 }
+
+int arch_support_sort_key(const char *sort_key)
+{
+	if (!strcmp(sort_key, "p_stage_cyc"))
+		return 1;
+	return 0;
+}
diff --git a/tools/perf/util/event.h b/tools/perf/util/event.h
index e5da4a695ff2..8a62fb39e365 100644
--- a/tools/perf/util/event.h
+++ b/tools/perf/util/event.h
@@ -429,5 +429,6 @@ void  cpu_map_data__synthesize(struct perf_record_cpu_map_data *data, struct per
 void arch_perf_parse_sample_weight(struct perf_sample *data, const __u64 *array, u64 type);
 void arch_perf_synthesize_sample_weight(const struct perf_sample *data, __u64 *array, u64 type);
 const char *arch_perf_header_entry(const char *se_header);
+int arch_support_sort_key(const char *sort_key);
 
 #endif /* __PERF_RECORD_H */
diff --git a/tools/perf/util/sort.c b/tools/perf/util/sort.c
index d262261ad1a6..e8030778ff44 100644
--- a/tools/perf/util/sort.c
+++ b/tools/perf/util/sort.c
@@ -47,6 +47,7 @@
 int		have_ignore_callees = 0;
 enum sort_mode	sort__mode = SORT_MODE__NORMAL;
 const char	*dynamic_headers[] = {"local_ins_lat", "p_stage_cyc"};
+const char	*arch_specific_sort_keys[] = {"p_stage_cyc"};
 
 /*
  * Replaces all occurrences of a char used with the:
@@ -1837,6 +1838,11 @@ struct sort_dimension {
 	int			taken;
 };
 
+int __weak arch_support_sort_key(const char *sort_key __maybe_unused)
+{
+	return 0;
+}
+
 const char * __weak arch_perf_header_entry(const char *se_header)
 {
 	return se_header;
@@ -2773,6 +2779,19 @@ int sort_dimension__add(struct perf_hpp_list *list, const char *tok,
 {
 	unsigned int i, j;
 
+	/*
+	 * Check to see if there are any arch specific
+	 * sort dimensions not applicable for the current
+	 * architecture. If so, Skip that sort key since
+	 * we don't want to display it in the output fields.
+	 */
+	for (j = 0; j < ARRAY_SIZE(arch_specific_sort_keys); j++) {
+		if (!strcmp(arch_specific_sort_keys[j], tok) &&
+				!arch_support_sort_key(tok)) {
+			return 0;
+		}
+	}
+
 	for (i = 0; i < ARRAY_SIZE(common_sort_dimensions); i++) {
 		struct sort_dimension *sd = &common_sort_dimensions[i];
 
-- 
1.8.3.1

