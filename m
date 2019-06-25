Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FF654EEE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2019 14:33:21 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Y5DD0ZW3zDqNn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2019 22:33:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=vaibhav@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Y55S0fHXzDqNb
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2019 22:27:23 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5PCNslO017627
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2019 08:27:20 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tbkgs0amt-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2019 08:27:20 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <vaibhav@linux.ibm.com>;
 Tue, 25 Jun 2019 13:27:18 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 25 Jun 2019 13:27:17 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5PCRFew59900056
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Jun 2019 12:27:15 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A89F852050;
 Tue, 25 Jun 2019 12:27:15 +0000 (GMT)
Received: from vajain21.in.ibm.com (unknown [9.109.195.230])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id BF16952052;
 Tue, 25 Jun 2019 12:27:13 +0000 (GMT)
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 1/3] powerpc/pseries: Update SCM hcall op-codes in hvcall.h
Date: Tue, 25 Jun 2019 17:57:07 +0530
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190625122709.11846-1-vaibhav@linux.ibm.com>
References: <20190625122709.11846-1-vaibhav@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19062512-0012-0000-0000-0000032C3DE3
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19062512-0013-0000-0000-000021657315
Message-Id: <20190625122709.11846-2-vaibhav@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-25_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=684 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906250099
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
Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>, Vaibhav Jain <vaibhav@linux.ibm.com>,
 Laurent Dufour <ldufour@linux.vnet.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Update the hvcalls.h to include op-codes for new hcalls introduce to
manage SCM memory. Also update existing hcall definitions to reflect
current papr specification for SCM.

Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
---
Change-log:

v2:
* None new patch in this series.
---
 arch/powerpc/include/asm/hvcall.h | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/hvcall.h b/arch/powerpc/include/asm/hvcall.h
index 463c63a9fcf1..1f5f917dae8c 100644
--- a/arch/powerpc/include/asm/hvcall.h
+++ b/arch/powerpc/include/asm/hvcall.h
@@ -302,9 +302,14 @@
 #define H_SCM_UNBIND_MEM        0x3F0
 #define H_SCM_QUERY_BLOCK_MEM_BINDING 0x3F4
 #define H_SCM_QUERY_LOGICAL_MEM_BINDING 0x3F8
-#define H_SCM_MEM_QUERY	        0x3FC
+#define H_SCM_UNBIND_ALL        0x3FC
 #define H_SCM_BLOCK_CLEAR       0x400
-#define MAX_HCALL_OPCODE	H_SCM_BLOCK_CLEAR
+#define H_SCM_PERFORMANCE_STATS 0x418
+#define MAX_HCALL_OPCODE	H_SCM_PERFORMANCE_STATS
+
+/* Scope args for H_SCM_UNBIND_ALL */
+#define H_UNBIND_SCOPE_ALL (0x1)
+#define H_UNBIND_SCOPE_DRC (0x2)
 
 /* H_VIOCTL functions */
 #define H_GET_VIOA_DUMP_SIZE	0x01
-- 
2.21.0

