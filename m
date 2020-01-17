Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A92C3140B5F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jan 2020 14:49:01 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47zj8V6DCwzDqdn
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jan 2020 00:48:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sandipan@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47zgs45b58zDqkX
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jan 2020 23:50:32 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00HCm5iF005968
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jan 2020 07:50:27 -0500
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xk0qt48bw-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jan 2020 07:50:26 -0500
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sandipan@linux.ibm.com>;
 Fri, 17 Jan 2020 12:50:24 -0000
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 17 Jan 2020 12:50:20 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 00HCnTjt49938898
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Jan 2020 12:49:30 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 106B25204F;
 Fri, 17 Jan 2020 12:50:19 +0000 (GMT)
Received: from fir03.in.ibm.com (unknown [9.121.59.65])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 9F6205204E;
 Fri, 17 Jan 2020 12:50:16 +0000 (GMT)
From: Sandipan Das <sandipan@linux.ibm.com>
To: shuah@kernel.org, linux-kselftest@vger.kernel.org
Subject: [PATCH v16 05/23] selftests/vm: Make gcc check arguments of
 sigsafe_printf()
Date: Fri, 17 Jan 2020 18:19:44 +0530
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1579265066.git.sandipan@linux.ibm.com>
References: <cover.1579265066.git.sandipan@linux.ibm.com>
In-Reply-To: <cover.1579265066.git.sandipan@linux.ibm.com>
References: <cover.1579265066.git.sandipan@linux.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 20011712-0020-0000-0000-000003A195A6
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20011712-0021-0000-0000-000021F918E6
Message-Id: <d2721f0dcc5f67a9ca989995611427a8abe4747d.1579265066.git.sandipan@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-17_03:2020-01-16,
 2020-01-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 mlxlogscore=999
 impostorscore=0 adultscore=0 mlxscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001170102
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
Cc: linux-arch@vger.kernel.org, fweimer@redhat.com, linux-mm@kvack.org,
 aneesh.kumar@linux.ibm.com, x86@kernel.org, linuxram@us.ibm.com,
 mhocko@kernel.org, dave.hansen@intel.com, mingo@redhat.com, msuchanek@suse.de,
 linuxppc-dev@lists.ozlabs.org, bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Thiago Jung Bauermann <bauerman@linux.ibm.com>

This will help us ensure we print pkey_reg_t values correctly in
different architectures.

Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
Signed-off-by: Sandipan Das <sandipan@linux.ibm.com>
---
 tools/testing/selftests/vm/pkey-helpers.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/vm/pkey-helpers.h b/tools/testing/selftests/vm/pkey-helpers.h
index 3ed2f021bf7a..7f18a82e54fc 100644
--- a/tools/testing/selftests/vm/pkey-helpers.h
+++ b/tools/testing/selftests/vm/pkey-helpers.h
@@ -27,6 +27,10 @@
 #define DPRINT_IN_SIGNAL_BUF_SIZE 4096
 extern int dprint_in_signal;
 extern char dprint_in_signal_buffer[DPRINT_IN_SIGNAL_BUF_SIZE];
+
+#ifdef __GNUC__
+__attribute__((format(printf, 1, 2)))
+#endif
 static inline void sigsafe_printf(const char *format, ...)
 {
 	va_list ap;
-- 
2.17.1

