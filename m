Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 522F087806F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Mar 2024 14:22:17 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hVMoOPd+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TtcrR0pCwz3cgg
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Mar 2024 00:22:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hVMoOPd+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=stefanb@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ttcpw1rwtz30f8
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Mar 2024 00:20:55 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 42BCViTB013442;
	Mon, 11 Mar 2024 13:20:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=D+ymWYhcKlVtuY88TLHRXmdCukNBtEwkGmsa5Q+jAKA=;
 b=hVMoOPd+dM1mfWm6CJbLYudAsIUaZQ6/odCjCWGJm31SGej7E7YbpeGoheyDjlyQwezQ
 rX7tmTxwnZegA2n7Jy3A8JHG16S28K9kzQi71N/Gxx8L77dDHma6nqT0sxVfSSLZpJ1o
 V41mE+CIbOX2ygv/Oe22GxiA3rSw7G506BJNq+w/SpJujivKgqc8qCMfjakZrqxeM+8d
 XhEHTZz+FITnV1ErO/MHXluGdbZKCbUfFipjlyhShYD95X4sy5mG++XTHgfTdWaVQUIY
 7U1HFZXpW+X+sxGRLOmR8gtW/zwk99qaDfu5ooNDtuTPiCo1vMD9CjeA1ql/T/taSDzq zg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wt1ub18sk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Mar 2024 13:20:47 +0000
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 42BCn1LX030314;
	Mon, 11 Mar 2024 13:20:47 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wt1ub18sa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Mar 2024 13:20:46 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 42BC3c2e018543;
	Mon, 11 Mar 2024 13:20:46 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3ws4t1r7d6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Mar 2024 13:20:46 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 42BDKgWY32244076
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 11 Mar 2024 13:20:44 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5D7A958069;
	Mon, 11 Mar 2024 13:20:42 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BE44758056;
	Mon, 11 Mar 2024 13:20:41 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 11 Mar 2024 13:20:41 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: mpe@ellerman.id.au, linux-integrity@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH v2 1/3] powerpc/prom_init: Replace linux,sml-base/sml-size with linux,sml-log
Date: Mon, 11 Mar 2024 09:20:28 -0400
Message-ID: <20240311132030.1103122-2-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240311132030.1103122-1-stefanb@linux.ibm.com>
References: <20240311132030.1103122-1-stefanb@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: jZMDAgE8buyi2GjnRjHPY5Rmz2M0p_tg
X-Proofpoint-ORIG-GUID: 7avnkx9d6VRIUGZeJiIcR0uqKwj0IQKZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-11_08,2024-03-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015
 bulkscore=0 mlxlogscore=999 malwarescore=0 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2403110100
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
Cc: devicetree@vger.kernel.org, rnsastry@linux.ibm.com, jsnitsel@redhat.com, linux-kernel@vger.kernel.org, jarkko@kernel.org, peterhuewe@gmx.de, viparash@in.ibm.com, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

linux,sml-base holds the address of a buffer with the TPM log. This
buffer may become invalid after a kexec. To avoid accessing an invalid
address or corrupted buffer, embed the whole TPM log in the device tree
property linux,sml-log. This helps to protect the log since it is
properly carried across a kexec soft reboot with both of the kexec
syscalls.

Avoid having the firmware ingest the whole TPM log when calling
prom_setprop but only create the linux,sml-log property as a place holder.
Insert the actual TPM log during the tree flattening phase.

Fixes: 4a727429abec ("PPC64: Add support for instantiating SML from Open Firmware")
Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
---
 arch/powerpc/kernel/prom_init.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
index e67effdba85c..6f7ca72013c2 100644
--- a/arch/powerpc/kernel/prom_init.c
+++ b/arch/powerpc/kernel/prom_init.c
@@ -211,6 +211,8 @@ static cell_t __prombss regbuf[1024];
 
 static bool  __prombss rtas_has_query_cpu_stopped;
 
+static u64 __prombss sml_base;
+static u32 __prombss sml_size;
 
 /*
  * Error results ... some OF calls will return "-1" on error, some
@@ -1954,17 +1956,15 @@ static void __init prom_instantiate_sml(void)
 	}
 	prom_printf(" done\n");
 
-	reserve_mem(base, size);
-
-	prom_setprop(ibmvtpm_node, "/vdevice/vtpm", "linux,sml-base",
-		     &base, sizeof(base));
-	prom_setprop(ibmvtpm_node, "/vdevice/vtpm", "linux,sml-size",
-		     &size, sizeof(size));
-
-	prom_debug("sml base     = 0x%llx\n", base);
+	/* Add property now, defer adding log to tree flattening phase */
+	prom_setprop(ibmvtpm_node, "/vdevice/vtpm", "linux,sml-log",
+		     NULL, 0);
 	prom_debug("sml size     = 0x%x\n", size);
 
 	prom_debug("prom_instantiate_sml: end...\n");
+
+	sml_base = base;
+	sml_size = size;
 }
 
 /*
@@ -2645,6 +2645,17 @@ static void __init scan_dt_build_struct(phandle node, unsigned long *mem_start,
 		}
 		prev_name = sstart + soff;
 
+		if (!prom_strcmp("linux,sml-log", pname)) {
+			/* push property head */
+			dt_push_token(OF_DT_PROP, mem_start, mem_end);
+			dt_push_token(sml_size, mem_start, mem_end);
+			dt_push_token(soff, mem_start, mem_end);
+			/* push property content */
+			valp = make_room(mem_start, mem_end, sml_size, 1);
+			memcpy(valp, (void *)sml_base, sml_size);
+			*mem_start = ALIGN(*mem_start, 4);
+			continue;
+		}
 		/* get length */
 		l = call_prom("getproplen", 2, 1, node, pname);
 
-- 
2.43.0

