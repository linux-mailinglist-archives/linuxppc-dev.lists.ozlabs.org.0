Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94BF032EBB1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 13:56:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DsSRR4G02z3dLB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 23:56:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dQNn4pRb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=dQNn4pRb; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DsSR12sYYz30L4
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Mar 2021 23:56:11 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 125ChSOC186307; Fri, 5 Mar 2021 07:56:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=e73cgkUlRnWpsvw2+pKBMIH1BOxLHe0hWnpslbNY/do=;
 b=dQNn4pRbORbvwHAKI2z40xA0B81G2ZJ0Cpjtos7hkv+yLlYStIKi+kb1osIgfj9fBYtU
 lLTMw9SnsIUWQK6fpqDsBweZL3E3YfBYjz4N+GcfyJLbJ7ectw4yALQNohk9o95j9LV8
 ogmJuhJmXQJhi0pRtFDQhIHypn4l3L5vvrpOiJGndivmFtXaHxhIgrP26UhD4sAhuByF
 rc12Z0EkQjAIUkDt6s+AFpa2aMYP1a89PSQ9uXFqgUX3IVN1+MGcylnSocBUg4vZQGxE
 TMHgXdSGYejd+fUEUQxBAhBCIdjcBNg62LIJ0Uk+N2KcSRV+28MASMY5lka/20N5uG+v 1w== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 373mw8gas7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Mar 2021 07:56:01 -0500
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 125CbkV7019520;
 Fri, 5 Mar 2021 12:55:59 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 3712fmkpt6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Mar 2021 12:55:59 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 125Ctf3G11600292
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 5 Mar 2021 12:55:42 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 57166AE059;
 Fri,  5 Mar 2021 12:55:56 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E19A9AE051;
 Fri,  5 Mar 2021 12:55:55 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.88.223])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  5 Mar 2021 12:55:55 +0000 (GMT)
From: Laurent Dufour <ldufour@linux.ibm.com>
To: mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
 linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2] powerpc/pseries: export LPAR security flavor in lparcfg
Date: Fri,  5 Mar 2021 13:55:54 +0100
Message-Id: <20210305125554.5165-1-ldufour@linux.ibm.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-05_08:2021-03-03,
 2021-03-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 suspectscore=0 spamscore=0 mlxlogscore=999 bulkscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 mlxscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103050063
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
Cc: nathanl@linux.ibm.com, cheloha@linux.ibm.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is helpful to read the security flavor from inside the LPAR.

In /sys/kernel/debug/powerpc/security_features it can be seen if
mitigations are on or off but the level set through the ASMI menu.
Furthermore, reporting it through /proc/powerpc/lparcfg allows an easy
processing by the lparstat command [1].

Export it like this in /proc/powerpc/lparcfg:

$ grep security_flavor /proc/powerpc/lparcfg
security_flavor=1

Value follows what is documented on the IBM support page [2]:

0 Speculative execution fully enabled
1 Speculative execution controls to mitigate user-to-kernel attacks
2 Speculative execution controls to mitigate user-to-kernel and
  user-to-user side-channel attacks

[1] https://groups.google.com/g/powerpc-utils-devel/c/NaKXvdyl_UI/m/wa2stpIDAQAJ
[2] https://www.ibm.com/support/pages/node/715841

Changes since V1:
 - Add details in the commit's description.

Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
---
 arch/powerpc/include/asm/hvcall.h        | 1 +
 arch/powerpc/platforms/pseries/lparcfg.c | 2 ++
 arch/powerpc/platforms/pseries/pseries.h | 1 +
 arch/powerpc/platforms/pseries/setup.c   | 8 ++++++++
 4 files changed, 12 insertions(+)

diff --git a/arch/powerpc/include/asm/hvcall.h b/arch/powerpc/include/asm/hvcall.h
index ed6086d57b22..455e188da26d 100644
--- a/arch/powerpc/include/asm/hvcall.h
+++ b/arch/powerpc/include/asm/hvcall.h
@@ -389,6 +389,7 @@
 #define H_CPU_BEHAV_FAVOUR_SECURITY	(1ull << 63) // IBM bit 0
 #define H_CPU_BEHAV_L1D_FLUSH_PR	(1ull << 62) // IBM bit 1
 #define H_CPU_BEHAV_BNDS_CHK_SPEC_BAR	(1ull << 61) // IBM bit 2
+#define H_CPU_BEHAV_FAVOUR_SECURITY_H	(1ull << 60) // IBM bit 3
 #define H_CPU_BEHAV_FLUSH_COUNT_CACHE	(1ull << 58) // IBM bit 5
 #define H_CPU_BEHAV_FLUSH_LINK_STACK	(1ull << 57) // IBM bit 6
 
diff --git a/arch/powerpc/platforms/pseries/lparcfg.c b/arch/powerpc/platforms/pseries/lparcfg.c
index e278390ab28d..35f6c4929fbd 100644
--- a/arch/powerpc/platforms/pseries/lparcfg.c
+++ b/arch/powerpc/platforms/pseries/lparcfg.c
@@ -169,6 +169,7 @@ static void show_gpci_data(struct seq_file *m)
 	kfree(buf);
 }
 
+
 static unsigned h_pic(unsigned long *pool_idle_time,
 		      unsigned long *num_procs)
 {
@@ -537,6 +538,7 @@ static int pseries_lparcfg_data(struct seq_file *m, void *v)
 	parse_em_data(m);
 	maxmem_data(m);
 
+	seq_printf(m, "security_flavor=%u\n", pseries_security_flavor);
 	return 0;
 }
 
diff --git a/arch/powerpc/platforms/pseries/pseries.h b/arch/powerpc/platforms/pseries/pseries.h
index 4fe48c04c6c2..a25517dc2515 100644
--- a/arch/powerpc/platforms/pseries/pseries.h
+++ b/arch/powerpc/platforms/pseries/pseries.h
@@ -111,6 +111,7 @@ static inline unsigned long cmo_get_page_size(void)
 
 int dlpar_workqueue_init(void);
 
+extern u32 pseries_security_flavor;
 void pseries_setup_security_mitigations(void);
 void pseries_lpar_read_hblkrm_characteristics(void);
 
diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
index 46e1540abc22..59080413a269 100644
--- a/arch/powerpc/platforms/pseries/setup.c
+++ b/arch/powerpc/platforms/pseries/setup.c
@@ -85,6 +85,7 @@ EXPORT_SYMBOL(CMO_PageSize);
 
 int fwnmi_active;  /* TRUE if an FWNMI handler is present */
 int ibm_nmi_interlock_token;
+u32 pseries_security_flavor;
 
 static void pSeries_show_cpuinfo(struct seq_file *m)
 {
@@ -534,9 +535,16 @@ static void init_cpu_char_feature_flags(struct h_cpu_char_result *result)
 	/*
 	 * The features below are enabled by default, so we instead look to see
 	 * if firmware has *disabled* them, and clear them if so.
+	 * H_CPU_BEHAV_FAVOUR_SECURITY_H could be set only if
+	 * H_CPU_BEHAV_FAVOUR_SECURITY is.
 	 */
 	if (!(result->behaviour & H_CPU_BEHAV_FAVOUR_SECURITY))
 		security_ftr_clear(SEC_FTR_FAVOUR_SECURITY);
+	else if (result->behaviour & H_CPU_BEHAV_FAVOUR_SECURITY_H)
+		pseries_security_flavor = 1;
+	else
+		pseries_security_flavor = 2;
+
 
 	if (!(result->behaviour & H_CPU_BEHAV_L1D_FLUSH_PR))
 		security_ftr_clear(SEC_FTR_L1D_FLUSH_PR);
-- 
2.30.1

