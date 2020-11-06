Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C312A8E87
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Nov 2020 06:00:41 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CS7W953fvzDqCC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Nov 2020 16:00:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=pGB2ej3X; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CS7Sx2827zDrBs
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Nov 2020 15:58:40 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A64WC9M171511; Thu, 5 Nov 2020 23:58:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=6RahEEUHzIitoZFIS4fDGrc212n/iL/hejxb9iFzZrA=;
 b=pGB2ej3XF/+wztMQ4VW7RfdhBEGpL2b3cr5VEDDItl1DBSNw9nbs6ikb5CCTBPCh5GXq
 6WDCxQkfeFk3jXC02YDf/6lFaL6FaYXk/eu44EZK5m7mP22HKJor3cx16f4ww5LrXUoI
 nU7VEwS5Khki4PzEcsUiQ+leQFmAwnhbe1ZrBUFrCorxoVqbYXw6KU0yx2xnvNwXumL7
 wyFsQTt/mYaqYK42ObGYzCP6sxzz2kXOwx8/8Gt3g4ShHcPOZxQbfXXBfuTDr8BnvrcH
 gmtMcj8TWgU4uouVZqk+plp5WG/EAP3sBskx8JRb+IWA2UP78HZZoLjcP0F3BdiU+PDu Hw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34mnyhxu28-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Nov 2020 23:58:30 -0500
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0A64WFPT171772;
 Thu, 5 Nov 2020 23:58:29 -0500
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34mnyhxu1t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Nov 2020 23:58:29 -0500
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0A64wSuQ012781;
 Fri, 6 Nov 2020 04:58:28 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04ams.nl.ibm.com with ESMTP id 34h01udur4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Nov 2020 04:58:27 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0A64wPbw5440054
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 6 Nov 2020 04:58:25 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1B3235204E;
 Fri,  6 Nov 2020 04:58:25 +0000 (GMT)
Received: from bangoria.ibmuc.com (unknown [9.199.43.151])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id D98CD52052;
 Fri,  6 Nov 2020 04:58:22 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v3] powerpc/watchpoint: Workaround P10 DD1 issue with VSX-32
 byte instructions
Date: Fri,  6 Nov 2020 10:26:50 +0530
Message-Id: <20201106045650.278987-1-ravi.bangoria@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-06_01:2020-11-05,
 2020-11-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 adultscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011060026
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
Cc: christophe.leroy@c-s.fr, ravi.bangoria@linux.ibm.com, mikey@linux.ibm.com,
 jniethe5@gmail.com, npiggin@gmail.com, maddy@linux.ibm.com, paulus@samba.org,
 naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

POWER10 DD1 has an issue where it generates watchpoint exceptions when
it shouldn't. The conditions where this occur are:

 - octword op
 - ending address of DAWR range is less than starting address of op
 - those addresses need to be in the same or in two consecutive 512B
   blocks
 - 'op address + 64B' generates an address that has a carry into bit
   52 (crosses 2K boundary)

Handle such spurious exception by considering them as extraneous and
emulating/single-steeping instruction without generating an event.

Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
[Fixed build warning reported by kernel test robot]
Reported-by: kernel test robot <lkp@intel.com>
---
v2->v3:
 - v2: https://lore.kernel.org/r/20201022034039.330365-1-ravi.bangoria@linux.ibm.com
 - Drop first patch which introduced CPU_FTRS_POWER10_DD1. Instead use
   P1 DD1 PVR direclty in if condition. We can't set CPU_FTRS_POWER10_DD1
   inside guest as guest can be migrated to futur version of cpu.

Dependency: VSX-32 byte emulation support patches
  https://lore.kernel.org/r/20201011050908.72173-1-ravi.bangoria@linux.ibm.com

 arch/powerpc/kernel/hw_breakpoint.c | 68 ++++++++++++++++++++++++++++-
 1 file changed, 66 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/hw_breakpoint.c b/arch/powerpc/kernel/hw_breakpoint.c
index 1f4a1efa0074..67297aea5d94 100644
--- a/arch/powerpc/kernel/hw_breakpoint.c
+++ b/arch/powerpc/kernel/hw_breakpoint.c
@@ -644,6 +644,11 @@ static bool is_larx_stcx_instr(int type)
 	return type == LARX || type == STCX;
 }
 
+static bool is_octword_vsx_instr(int type, int size)
+{
+	return ((type == LOAD_VSX || type == STORE_VSX) && size == 32);
+}
+
 /*
  * We've failed in reliably handling the hw-breakpoint. Unregister
  * it and throw a warning message to let the user know about it.
@@ -694,6 +699,58 @@ static bool stepping_handler(struct pt_regs *regs, struct perf_event **bp,
 	return true;
 }
 
+static void handle_p10dd1_spurious_exception(struct arch_hw_breakpoint **info,
+					     int *hit, unsigned long ea)
+{
+	int i;
+	unsigned long hw_end_addr;
+
+	/*
+	 * Handle spurious exception only when any bp_per_reg is set.
+	 * Otherwise this might be created by xmon and not actually a
+	 * spurious exception.
+	 */
+	for (i = 0; i < nr_wp_slots(); i++) {
+		if (!info[i])
+			continue;
+
+		hw_end_addr = ALIGN(info[i]->address + info[i]->len, HW_BREAKPOINT_SIZE);
+
+		/*
+		 * Ending address of DAWR range is less than starting
+		 * address of op.
+		 */
+		if ((hw_end_addr - 1) >= ea)
+			continue;
+
+		/*
+		 * Those addresses need to be in the same or in two
+		 * consecutive 512B blocks;
+		 */
+		if (((hw_end_addr - 1) >> 10) != (ea >> 10))
+			continue;
+
+		/*
+		 * 'op address + 64B' generates an address that has a
+		 * carry into bit 52 (crosses 2K boundary).
+		 */
+		if ((ea & 0x800) == ((ea + 64) & 0x800))
+			continue;
+
+		break;
+	}
+
+	if (i == nr_wp_slots())
+		return;
+
+	for (i = 0; i < nr_wp_slots(); i++) {
+		if (info[i]) {
+			hit[i] = 1;
+			info[i]->type |= HW_BRK_TYPE_EXTRANEOUS_IRQ;
+		}
+	}
+}
+
 int hw_breakpoint_handler(struct die_args *args)
 {
 	bool err = false;
@@ -752,8 +809,15 @@ int hw_breakpoint_handler(struct die_args *args)
 		goto reset;
 
 	if (!nr_hit) {
-		rc = NOTIFY_DONE;
-		goto out;
+		/* Workaround for Power10 DD1 */
+		if (mfspr(SPRN_PVR) == 0x800100 &&
+		    !IS_ENABLED(CONFIG_PPC_8xx) &&
+		    is_octword_vsx_instr(type, size)) {
+			handle_p10dd1_spurious_exception(info, hit, ea);
+		} else {
+			rc = NOTIFY_DONE;
+			goto out;
+		}
 	}
 
 	/*
-- 
2.25.1

