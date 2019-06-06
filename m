Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C05637B53
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2019 19:44:57 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45KY2b0HSWzDqvr
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2019 03:44:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45KXs33gFfzDqhF
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jun 2019 03:36:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45KXs21pydz8x5D
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jun 2019 03:36:38 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45KXs20FGjz9sPf; Fri,  7 Jun 2019 03:36:38 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=cclaudio@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 45KXs12Gktz9sPG
 for <linuxppc-dev@ozlabs.org>; Fri,  7 Jun 2019 03:36:36 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x56HTukN091968
 for <linuxppc-dev@ozlabs.org>; Thu, 6 Jun 2019 13:36:34 -0400
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2sy4p8h35h-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Thu, 06 Jun 2019 13:36:34 -0400
Received: from localhost
 by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <cclaudio@linux.ibm.com>;
 Thu, 6 Jun 2019 18:36:33 +0100
Received: from b01cxnp23032.gho.pok.ibm.com (9.57.198.27)
 by e13.ny.us.ibm.com (146.89.104.200) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 6 Jun 2019 18:36:30 +0100
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x56HaTW639190838
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 6 Jun 2019 17:36:29 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7654FAC05B;
 Thu,  6 Jun 2019 17:36:29 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AAC9AAC059;
 Thu,  6 Jun 2019 17:36:27 +0000 (GMT)
Received: from rino.br.ibm.com (unknown [9.18.235.79])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  6 Jun 2019 17:36:27 +0000 (GMT)
From: Claudio Carvalho <cclaudio@linux.ibm.com>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v3 6/9] KVM: PPC: Ultravisor: Restrict flush of the partition
 tlb cache
Date: Thu,  6 Jun 2019 14:36:11 -0300
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190606173614.32090-1-cclaudio@linux.ibm.com>
References: <20190606173614.32090-1-cclaudio@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19060617-0064-0000-0000-000003EAB7F6
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011224; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01214150; UDB=6.00638204; IPR=6.00995229; 
 MB=3.00027209; MTD=3.00000008; XFM=3.00000015; UTC=2019-06-06 17:36:32
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19060617-0065-0000-0000-00003DC76FA1
Message-Id: <20190606173614.32090-7-cclaudio@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-06_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906060117
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
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Michael Anderson <andmike@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>,
 Claudio Carvalho <cclaudio@linux.ibm.com>, kvm-ppc@vger.kernel.org,
 Bharata B Rao <bharata@linux.ibm.com>,
 Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>,
 Thiago Bauermann <bauermann@linux.ibm.com>,
 Anshuman Khandual <khandual@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Ram Pai <linuxram@us.ibm.com>

Ultravisor is responsible for flushing the tlb cache, since it manages
the PATE entries. Hence skip tlb flush, if the ultravisor firmware is
available.

Signed-off-by: Ram Pai <linuxram@us.ibm.com>
Signed-off-by: Claudio Carvalho <cclaudio@linux.ibm.com>
---
 arch/powerpc/mm/book3s64/pgtable.c | 33 +++++++++++++++++-------------
 1 file changed, 19 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
index 40a9fc8b139f..1eeb5fe87023 100644
--- a/arch/powerpc/mm/book3s64/pgtable.c
+++ b/arch/powerpc/mm/book3s64/pgtable.c
@@ -224,6 +224,23 @@ void __init mmu_partition_table_init(void)
 	powernv_set_nmmu_ptcr(ptcr);
 }
 
+static void flush_partition(unsigned int lpid, unsigned long dw0)
+{
+	if (dw0 & PATB_HR) {
+		asm volatile(PPC_TLBIE_5(%0, %1, 2, 0, 1) : :
+			     "r" (TLBIEL_INVAL_SET_LPID), "r" (lpid));
+		asm volatile(PPC_TLBIE_5(%0, %1, 2, 1, 1) : :
+			     "r" (TLBIEL_INVAL_SET_LPID), "r" (lpid));
+		trace_tlbie(lpid, 0, TLBIEL_INVAL_SET_LPID, lpid, 2, 0, 1);
+	} else {
+		asm volatile(PPC_TLBIE_5(%0, %1, 2, 0, 0) : :
+			     "r" (TLBIEL_INVAL_SET_LPID), "r" (lpid));
+		trace_tlbie(lpid, 0, TLBIEL_INVAL_SET_LPID, lpid, 2, 0, 0);
+	}
+	/* do we need fixup here ?*/
+	asm volatile("eieio; tlbsync; ptesync" : : : "memory");
+}
+
 static void __mmu_partition_table_set_entry(unsigned int lpid,
 					    unsigned long dw0,
 					    unsigned long dw1)
@@ -238,20 +255,8 @@ static void __mmu_partition_table_set_entry(unsigned int lpid,
 	 * The type of flush (hash or radix) depends on what the previous
 	 * use of this partition ID was, not the new use.
 	 */
-	asm volatile("ptesync" : : : "memory");
-	if (old & PATB_HR) {
-		asm volatile(PPC_TLBIE_5(%0,%1,2,0,1) : :
-			     "r" (TLBIEL_INVAL_SET_LPID), "r" (lpid));
-		asm volatile(PPC_TLBIE_5(%0,%1,2,1,1) : :
-			     "r" (TLBIEL_INVAL_SET_LPID), "r" (lpid));
-		trace_tlbie(lpid, 0, TLBIEL_INVAL_SET_LPID, lpid, 2, 0, 1);
-	} else {
-		asm volatile(PPC_TLBIE_5(%0,%1,2,0,0) : :
-			     "r" (TLBIEL_INVAL_SET_LPID), "r" (lpid));
-		trace_tlbie(lpid, 0, TLBIEL_INVAL_SET_LPID, lpid, 2, 0, 0);
-	}
-	/* do we need fixup here ?*/
-	asm volatile("eieio; tlbsync; ptesync" : : : "memory");
+	if (!firmware_has_feature(FW_FEATURE_ULTRAVISOR))
+		flush_partition(lpid, old);
 }
 
 void mmu_partition_table_set_entry(unsigned int lpid, unsigned long dw0,
-- 
2.20.1

