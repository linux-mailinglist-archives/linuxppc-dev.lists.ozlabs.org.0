Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACEA140C9F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jan 2020 15:35:55 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47zkBZ6JpPzDqgs
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jan 2020 01:35:50 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47zgsX5CmTzDq8v
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jan 2020 23:50:56 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00HCllIN113625
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jan 2020 07:50:52 -0500
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xk0qtupy1-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jan 2020 07:50:51 -0500
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sandipan@linux.ibm.com>;
 Fri, 17 Jan 2020 12:50:49 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 17 Jan 2020 12:50:44 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 00HCohhP52691022
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Jan 2020 12:50:43 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 433DC5204E;
 Fri, 17 Jan 2020 12:50:43 +0000 (GMT)
Received: from fir03.in.ibm.com (unknown [9.121.59.65])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id AF0415204F;
 Fri, 17 Jan 2020 12:50:40 +0000 (GMT)
From: Sandipan Das <sandipan@linux.ibm.com>
To: shuah@kernel.org, linux-kselftest@vger.kernel.org
Subject: [PATCH v16 14/23] selftests/vm/pkeys: Fix number of reserved powerpc
 pkeys
Date: Fri, 17 Jan 2020 18:19:53 +0530
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1579265066.git.sandipan@linux.ibm.com>
References: <cover.1579265066.git.sandipan@linux.ibm.com>
In-Reply-To: <cover.1579265066.git.sandipan@linux.ibm.com>
References: <cover.1579265066.git.sandipan@linux.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 20011712-4275-0000-0000-000003987CE0
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20011712-4276-0000-0000-000038AC7E42
Message-Id: <2ef4b0cdc95953235d3e5687d98da8a3a074aaf5.1579265066.git.sandipan@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-17_03:2020-01-16,
 2020-01-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 malwarescore=0 clxscore=1015 mlxscore=0 suspectscore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
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
 mhocko@kernel.org, dave.hansen@intel.com, mingo@redhat.com,
 "Desnes A. Nunes do Rosario" <desnesn@linux.vnet.ibm.com>, msuchanek@suse.de,
 linuxppc-dev@lists.ozlabs.org, bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Desnes A. Nunes do Rosario" <desnesn@linux.vnet.ibm.com>

The number of reserved pkeys in a PowerNV environment is
different from that on PowerVM or KVM.

Tested on PowerVM and PowerNV environments.

Signed-off-by: "Desnes A. Nunes do Rosario" <desnesn@linux.vnet.ibm.com>
Signed-off-by: Ram Pai <linuxram@us.ibm.com>
Signed-off-by: Sandipan Das <sandipan@linux.ibm.com>
---
 tools/testing/selftests/vm/pkey-powerpc.h | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/vm/pkey-powerpc.h b/tools/testing/selftests/vm/pkey-powerpc.h
index f4599a35d2a9..eaced8c198a2 100644
--- a/tools/testing/selftests/vm/pkey-powerpc.h
+++ b/tools/testing/selftests/vm/pkey-powerpc.h
@@ -28,7 +28,10 @@
 #define NR_RESERVED_PKEYS_4K	27 /* pkey-0, pkey-1, exec-only-pkey
 				      and 24 other keys that cannot be
 				      represented in the PTE */
-#define NR_RESERVED_PKEYS_64K	3  /* pkey-0, pkey-1 and exec-only-pkey */
+#define NR_RESERVED_PKEYS_64K_3KEYS	3 /* PowerNV and KVM: pkey-0,
+					     pkey-1 and exec-only key */
+#define NR_RESERVED_PKEYS_64K_4KEYS	4 /* PowerVM: pkey-0, pkey-1,
+					     pkey-31 and exec-only key */
 #define PKEY_BITS_PER_PKEY	2
 #define HPAGE_SIZE		(1UL << 24)
 #define PAGE_SIZE		(1UL << 16)
@@ -65,12 +68,27 @@ static inline int cpu_has_pku(void)
 	return 1;
 }
 
+static inline bool arch_is_powervm()
+{
+	struct stat buf;
+
+	if ((stat("/sys/firmware/devicetree/base/ibm,partition-name", &buf) == 0) &&
+	    (stat("/sys/firmware/devicetree/base/hmc-managed?", &buf) == 0) &&
+	    (stat("/sys/firmware/devicetree/base/chosen/qemu,graphic-width", &buf) == -1) )
+		return true;
+
+	return false;
+}
+
 static inline int get_arch_reserved_keys(void)
 {
 	if (sysconf(_SC_PAGESIZE) == 4096)
 		return NR_RESERVED_PKEYS_4K;
 	else
-		return NR_RESERVED_PKEYS_64K;
+		if (arch_is_powervm())
+			return NR_RESERVED_PKEYS_64K_4KEYS;
+		else
+			return NR_RESERVED_PKEYS_64K_3KEYS;
 }
 
 void expect_fault_on_read_execonly_key(void *p1, int pkey)
-- 
2.17.1

