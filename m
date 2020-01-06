Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B867E13114A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jan 2020 12:18:38 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47rtL30fm0zDqGg
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jan 2020 22:18:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47rtBR0zYfzDqFH
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jan 2020 22:11:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 47rtBQ5hdxz9B3Y
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jan 2020 22:11:58 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 47rtBQ3S2Gz9sR4; Mon,  6 Jan 2020 22:11:58 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=psampat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 47rtBP5zf3z9sS3
 for <linuxppc-dev@ozlabs.org>; Mon,  6 Jan 2020 22:11:57 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 006B2eXx127547
 for <linuxppc-dev@ozlabs.org>; Mon, 6 Jan 2020 06:11:54 -0500
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xb97bereq-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Mon, 06 Jan 2020 06:11:54 -0500
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <psampat@linux.ibm.com>;
 Mon, 6 Jan 2020 11:11:52 -0000
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 6 Jan 2020 11:11:49 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 006BBmbE33292544
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 6 Jan 2020 11:11:48 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 027205204F;
 Mon,  6 Jan 2020 11:11:48 +0000 (GMT)
Received: from pratiks-thinkpad.in.ibm.com (unknown [9.124.31.198])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 6B0D05204E;
 Mon,  6 Jan 2020 11:11:46 +0000 (GMT)
From: Pratik Rajesh Sampat <psampat@linux.ibm.com>
To: linux-kernel@vger.kernel.org, linuxppc-dev@ozlabs.org, mpe@ellerman.id.au, 
 svaidy@linux.ibm.com, ego@linux.vnet.ibm.com, linuxram@us.ibm.com,
 psampat@linux.ibm.com, pratik.sampat@in.ibm.com, pratik.r.sampat@gmail.com
Subject: [PATCH v2 2/3] powerpc/powernv: Introduce Self save support
Date: Mon,  6 Jan 2020 16:41:41 +0530
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1578307288.git.psampat@linux.ibm.com>
References: <cover.1578307288.git.psampat@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20010611-0028-0000-0000-000003CE9785
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20010611-0029-0000-0000-00002492A444
Message-Id: <6aae6d58162273cd582660a65f1360c8538704c9.1578307288.git.psampat@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2020-01-06_04:2020-01-06,2020-01-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 mlxscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 mlxlogscore=977 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1910280000 definitions=main-2001060102
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
 arch/powerpc/include/asm/opal-api.h        | 3 ++-
 arch/powerpc/include/asm/opal.h            | 1 +
 arch/powerpc/platforms/powernv/idle.c      | 2 ++
 arch/powerpc/platforms/powernv/opal-call.c | 1 +
 4 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/opal-api.h b/arch/powerpc/include/asm/opal-api.h
index c1f25a760eb1..89b7c44124e6 100644
--- a/arch/powerpc/include/asm/opal-api.h
+++ b/arch/powerpc/include/asm/opal-api.h
@@ -214,7 +214,8 @@
 #define OPAL_SECVAR_GET				176
 #define OPAL_SECVAR_GET_NEXT			177
 #define OPAL_SECVAR_ENQUEUE_UPDATE		178
-#define OPAL_LAST				178
+#define OPAL_SLW_SELF_SAVE_REG			179
+#define OPAL_LAST				179
 
 #define QUIESCE_HOLD			1 /* Spin all calls at entry */
 #define QUIESCE_REJECT			2 /* Fail all calls with OPAL_BUSY */
diff --git a/arch/powerpc/include/asm/opal.h b/arch/powerpc/include/asm/opal.h
index 9986ac34b8e2..389a85b63805 100644
--- a/arch/powerpc/include/asm/opal.h
+++ b/arch/powerpc/include/asm/opal.h
@@ -203,6 +203,7 @@ int64_t opal_handle_hmi(void);
 int64_t opal_handle_hmi2(__be64 *out_flags);
 int64_t opal_register_dump_region(uint32_t id, uint64_t start, uint64_t end);
 int64_t opal_unregister_dump_region(uint32_t id);
+int64_t opal_slw_self_save_reg(uint64_t cpu_pir, uint64_t sprn);
 int64_t opal_slw_set_reg(uint64_t cpu_pir, uint64_t sprn, uint64_t val);
 int64_t opal_config_cpu_idle_state(uint64_t state, uint64_t flag);
 int64_t opal_pci_set_phb_cxl_mode(uint64_t phb_id, uint64_t mode, uint64_t pe_number);
diff --git a/arch/powerpc/platforms/powernv/idle.c b/arch/powerpc/platforms/powernv/idle.c
index 2f328403b0dc..d67d4d0b169b 100644
--- a/arch/powerpc/platforms/powernv/idle.c
+++ b/arch/powerpc/platforms/powernv/idle.c
@@ -1172,6 +1172,8 @@ void pnv_program_cpu_hotplug_lpcr(unsigned int cpu, u64 lpcr_val)
 		if (!is_lpcr_self_save)
 			opal_slw_set_reg(pir, SPRN_LPCR,
 					 lpcr_val);
+		else
+			opal_slw_self_save_reg(pir, SPRN_LPCR);
 	}
 }
 
diff --git a/arch/powerpc/platforms/powernv/opal-call.c b/arch/powerpc/platforms/powernv/opal-call.c
index 5cd0f52d258f..11e0ceb90de0 100644
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
2.24.1

