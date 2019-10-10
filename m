Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 63996D2976
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2019 14:28:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46pr3D37wwzDqdp
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2019 23:28:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46pqPR1lhYzDr4Q
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2019 22:59:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46pqPQ4FQ2z8tL0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2019 22:59:06 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 46pqPQ233Dz9sPw; Thu, 10 Oct 2019 22:59:06 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=psampat@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46pqPP4QpQz9sPk
 for <linuxppc-dev@ozlabs.org>; Thu, 10 Oct 2019 22:59:05 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9AB53RK102409
 for <linuxppc-dev@ozlabs.org>; Thu, 10 Oct 2019 07:58:56 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2vj1nawc0r-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Thu, 10 Oct 2019 07:58:56 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <psampat@linux.ibm.com>;
 Thu, 10 Oct 2019 12:58:54 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 10 Oct 2019 12:58:53 +0100
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x9ABwpVg44040616
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Oct 2019 11:58:51 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 89BCF4204B;
 Thu, 10 Oct 2019 11:58:51 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C6F8342047;
 Thu, 10 Oct 2019 11:58:49 +0000 (GMT)
Received: from pratiks-thinkpad.ibmuc.com (unknown [9.199.37.96])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 10 Oct 2019 11:58:49 +0000 (GMT)
From: Pratik Rajesh Sampat <psampat@linux.ibm.com>
To: linuxppc-dev@ozlabs.org, linux-next@vger.kernel.org, mpe@ellerman.id.au,
 svaidy@linux.ibm.com, ego@linux.vnet.ibm.com, premjha2@in.ibm.com,
 akshay.adiga@linux.vnet.ibm.com
Subject: [PATCH v1 2/3] powerpc/powernv: Introduce Self save support
Date: Thu, 10 Oct 2019 17:28:42 +0530
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191010115843.22283-1-psampat@linux.ibm.com>
References: <20191010115843.22283-1-psampat@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19101011-0012-0000-0000-00000356DAE3
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19101011-0013-0000-0000-00002191E3B1
Message-Id: <20191010115843.22283-3-psampat@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-10_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910100084
X-Mailman-Approved-At: Thu, 10 Oct 2019 23:17:34 +1100
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This commit introduces and leverages the Self save API which OPAL now
supports.

Add the new Self Save OPAL API call in the list of OPAL calls.
Implement the self saving of the SPRs based on the support populated
while respecting it's preferences.

This implementation allows mixing of support for the SPRs, which
means that a SPR can be self restored while another SPR be self saved if
they support and prefer it to be so.

Signed-off-by: Pratik Rajesh Sampat <psampat@linux.ibm.com>
---
 arch/powerpc/include/asm/opal-api.h        |  3 ++-
 arch/powerpc/include/asm/opal.h            |  1 +
 arch/powerpc/platforms/powernv/idle.c      | 16 ++++++++++++++++
 arch/powerpc/platforms/powernv/opal-call.c |  1 +
 4 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/opal-api.h b/arch/powerpc/include/asm/opal-api.h
index 383242eb0dea..4ee1641c60a4 100644
--- a/arch/powerpc/include/asm/opal-api.h
+++ b/arch/powerpc/include/asm/opal-api.h
@@ -208,7 +208,8 @@
 #define OPAL_HANDLE_HMI2			166
 #define	OPAL_NX_COPROC_INIT			167
 #define OPAL_XIVE_GET_VP_STATE			170
-#define OPAL_LAST				170
+#define OPAL_SLW_SELF_SAVE_REG			173
+#define OPAL_LAST				173
 
 #define QUIESCE_HOLD			1 /* Spin all calls at entry */
 #define QUIESCE_REJECT			2 /* Fail all calls with OPAL_BUSY */
diff --git a/arch/powerpc/include/asm/opal.h b/arch/powerpc/include/asm/opal.h
index 57bd029c715e..832eff21d189 100644
--- a/arch/powerpc/include/asm/opal.h
+++ b/arch/powerpc/include/asm/opal.h
@@ -202,6 +202,7 @@ int64_t opal_handle_hmi(void);
 int64_t opal_handle_hmi2(__be64 *out_flags);
 int64_t opal_register_dump_region(uint32_t id, uint64_t start, uint64_t end);
 int64_t opal_unregister_dump_region(uint32_t id);
+int64_t opal_slw_self_save_reg(uint64_t cpu_pir, uint64_t sprn);
 int64_t opal_slw_set_reg(uint64_t cpu_pir, uint64_t sprn, uint64_t val);
 int64_t opal_config_cpu_idle_state(uint64_t state, uint64_t flag);
 int64_t opal_pci_set_phb_cxl_mode(uint64_t phb_id, uint64_t mode, uint64_t pe_number);
diff --git a/arch/powerpc/platforms/powernv/idle.c b/arch/powerpc/platforms/powernv/idle.c
index 00b3fd58fafc..f0dd377820c7 100644
--- a/arch/powerpc/platforms/powernv/idle.c
+++ b/arch/powerpc/platforms/powernv/idle.c
@@ -264,6 +264,20 @@ static int pnv_self_save_restore_sprs(void)
 					if (rc != 0)
 						return rc;
 					break;
+				} else if (preferred & curr_spr.supported_mode
+					   & SELF_SAVE_STRICT) {
+					is_initialized = true;
+					if (curr_spr.spr == SPRN_HMEER &&
+					    cpu_thread_in_core(cpu) != 0) {
+						continue;
+					}
+					if (curr_spr.spr == SPRN_LPCR)
+						is_lpcr_self_save = true;
+					rc = opal_slw_self_save_reg(pir,
+								curr_spr.spr);
+					if (rc != 0)
+						return rc;
+					break;
 				}
 				preferred_sprs[index].preferred_mode =
 					preferred_sprs[index].preferred_mode >>
@@ -1137,6 +1151,8 @@ void pnv_program_cpu_hotplug_lpcr(unsigned int cpu, u64 lpcr_val)
 		if (!is_lpcr_self_save)
 			opal_slw_set_reg(pir, SPRN_LPCR,
 					 lpcr_val);
+		else
+			opal_slw_self_save_reg(pir, SPRN_LPCR);
 	}
 }
 
diff --git a/arch/powerpc/platforms/powernv/opal-call.c b/arch/powerpc/platforms/powernv/opal-call.c
index 29ca523c1c79..716f2118939b 100644
--- a/arch/powerpc/platforms/powernv/opal-call.c
+++ b/arch/powerpc/platforms/powernv/opal-call.c
@@ -223,6 +223,7 @@ OPAL_CALL(opal_handle_hmi,			OPAL_HANDLE_HMI);
 OPAL_CALL(opal_handle_hmi2,			OPAL_HANDLE_HMI2);
 OPAL_CALL(opal_config_cpu_idle_state,		OPAL_CONFIG_CPU_IDLE_STATE);
 OPAL_CALL(opal_slw_set_reg,			OPAL_SLW_SET_REG);
+OPAL_CALL(opal_slw_self_save_reg,		OPAL_SLW_SELF_SAVE_REG);
 OPAL_CALL(opal_register_dump_region,		OPAL_REGISTER_DUMP_REGION);
 OPAL_CALL(opal_unregister_dump_region,		OPAL_UNREGISTER_DUMP_REGION);
 OPAL_CALL(opal_pci_set_phb_cxl_mode,		OPAL_PCI_SET_PHB_CAPI_MODE);
-- 
2.21.0

