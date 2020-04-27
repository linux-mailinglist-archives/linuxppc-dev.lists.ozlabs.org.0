Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 368111B972A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Apr 2020 08:17:22 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 499ZLl2lM1zDqYW
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Apr 2020 16:17:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 499ZGP2R9jzDqb5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Apr 2020 16:13:33 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03R64T5R150422
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Apr 2020 02:13:30 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30nqr5k0mw-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Apr 2020 02:13:28 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ganeshgr@linux.ibm.com>;
 Mon, 27 Apr 2020 07:12:32 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 27 Apr 2020 07:12:31 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03R6DMl163111318
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Apr 2020 06:13:22 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DBA0AAE045;
 Mon, 27 Apr 2020 06:13:22 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9C8F9AE051;
 Mon, 27 Apr 2020 06:13:21 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.85.103.164])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 27 Apr 2020 06:13:21 +0000 (GMT)
From: Ganesh Goudar <ganeshgr@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/2] powerpc/mce: Do not poison the memory using guest
 effective addr
Date: Mon, 27 Apr 2020 11:43:08 +0530
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20200427061308.26204-1-ganeshgr@linux.ibm.com>
References: <20200427061308.26204-1-ganeshgr@linux.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 20042706-4275-0000-0000-000003C6B8A3
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20042706-4276-0000-0000-000038DC4977
Message-Id: <20200427061308.26204-2-ganeshgr@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-27_02:2020-04-24,
 2020-04-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015
 mlxlogscore=792 priorityscore=1501 spamscore=0 phishscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 mlxscore=0 bulkscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004270050
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
Cc: mahesh@linux.vnet.ibm.com, Ganesh Goudar <ganeshgr@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As of now, if we hit UE due to memory failure in guest, host MCE
handler tries to find the pfn or physical address where the memory
error occurred using guest effective address and uses that pfn to
poison the memory, which is not right.

If we hit UE in guest, do not try to find pfn in host and thereby
avoid poisoning the memory in host.

Reviewed-by: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>
Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
---
 arch/powerpc/kernel/mce_power.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/mce_power.c b/arch/powerpc/kernel/mce_power.c
index 143e79450e93..4e541dd3af0d 100644
--- a/arch/powerpc/kernel/mce_power.c
+++ b/arch/powerpc/kernel/mce_power.c
@@ -471,6 +471,10 @@ static int mce_handle_ierror(struct pt_regs *regs,
 				table[i].error_type == MCE_ERROR_TYPE_UE) {
 				unsigned long pfn;
 
+#ifdef CONFIG_KVM_BOOK3S_HANDLER
+				if (get_paca()->kvm_hstate.in_guest)
+					return handled;
+#endif
 				if (get_paca()->in_mce < MAX_MCE_DEPTH) {
 					pfn = addr_to_pfn(regs, regs->nip);
 					if (pfn != ULONG_MAX) {
@@ -515,6 +519,7 @@ static int mce_handle_derror(struct pt_regs *regs,
 		 */
 		if (found)
 			continue;
+		found = 1;
 
 		/* now fill in mce_error_info */
 		mce_err->error_type = table[i].error_type;
@@ -528,6 +533,10 @@ static int mce_handle_derror(struct pt_regs *regs,
 			*addr = regs->dar;
 		else if (mce_err->sync_error &&
 				table[i].error_type == MCE_ERROR_TYPE_UE) {
+#ifdef CONFIG_KVM_BOOK3S_HANDLER
+			if (get_paca()->kvm_hstate.in_guest)
+				continue;
+#endif
 			/*
 			 * We do a maximum of 4 nested MCE calls, see
 			 * kernel/exception-64s.h
@@ -536,7 +545,6 @@ static int mce_handle_derror(struct pt_regs *regs,
 				mce_find_instr_ea_and_phys(regs, addr,
 							   phys_addr);
 		}
-		found = 1;
 	}
 
 	if (found)
-- 
2.17.2

