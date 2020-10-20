Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F11293464
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Oct 2020 07:47:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CFjLc3Wp2zDqWy
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Oct 2020 16:47:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=pZhNU6ZY; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CFjJj5D1YzDqTw
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Oct 2020 16:45:25 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09K5XGuv019400; Tue, 20 Oct 2020 01:45:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=7abWBSiE/31suRpn6Y3yu3w8jDIcAqW98wIiE+Hb/3Y=;
 b=pZhNU6ZY/B6wS/4/U0tYgMrlPwEKffrPI42ZnvqirZB1E2llKhDRdrrbE7YD3JlnQW3L
 xknjVMPVXM0/YnbqbRe44emp4NbEpN5qEqBI2LuI9OOH/ANng2b1dUhnD8x6tLzl1ID0
 qWcibrIMZuVVdSQ4kaMCDqCAebiYTe2EO6tFWwKd+MMPSMz7q2v87UrAZg9PrL1EoNuz
 M5YJRexKhucsVrMy9va8y1KZsI5E3FX0HZOaVxHTalU5EOhcidSBZcGbLny4saUr8wdO
 yaF17o1Xi2SbZYfmIAyJr3APA168KV1M8vwTSYvVNvzqMCp31Zh9D6vE2sroXV73ulcn /Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 349sd20vdd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Oct 2020 01:45:17 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 09K5c5Tw032148;
 Tue, 20 Oct 2020 01:45:17 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 349sd20vch-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Oct 2020 01:45:16 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09K5aXYi004915;
 Tue, 20 Oct 2020 05:45:13 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 347r88auqh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Oct 2020 05:45:13 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09K5jAYP33882588
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Oct 2020 05:45:11 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AB2A752052;
 Tue, 20 Oct 2020 05:45:10 +0000 (GMT)
Received: from bangoria.ibmuc.com (unknown [9.199.34.51])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 498F952051;
 Tue, 20 Oct 2020 05:45:08 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH 2/2] powerpc/watchpoint: Workaround P10 DD1 issue with VSX-32
 byte instructions
Date: Tue, 20 Oct 2020 11:14:54 +0530
Message-Id: <20201020054454.194343-2-ravi.bangoria@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201020054454.194343-1-ravi.bangoria@linux.ibm.com>
References: <20201020054454.194343-1-ravi.bangoria@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-20_03:2020-10-16,
 2020-10-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 mlxlogscore=999 malwarescore=0 adultscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010200037
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

POWER10 DD1 has an issue where it generates watchpoint exceptions when it
shouldn't. The conditions where this occur are:

 - octword op
 - ending address of DAWR range is less than starting address of op
 - those addresses need to be in the same or in two consecutive 512B
   blocks
 - 'op address + 64B' generates an address that has a carry into bit
   52 (crosses 2K boundary)

Handle such spurious exception by considering them as extraneous and
emulating/single-steeping instruction without generating an event.

Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
---

Dependency: VSX-32 byte emulation support patches
  https://lore.kernel.org/r/20201011050908.72173-1-ravi.bangoria@linux.ibm.com

 arch/powerpc/kernel/hw_breakpoint.c | 69 ++++++++++++++++++++++++++++-
 1 file changed, 67 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/hw_breakpoint.c b/arch/powerpc/kernel/hw_breakpoint.c
index f4e8f21046f5..4514745d27c3 100644
--- a/arch/powerpc/kernel/hw_breakpoint.c
+++ b/arch/powerpc/kernel/hw_breakpoint.c
@@ -499,6 +499,11 @@ static bool is_larx_stcx_instr(int type)
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
@@ -549,6 +554,60 @@ static bool stepping_handler(struct pt_regs *regs, struct perf_event **bp,
 	return true;
 }
 
+static void handle_p10dd1_spurious_exception(struct arch_hw_breakpoint **info,
+					     int *hit, unsigned long ea)
+{
+	int i;
+	unsigned long hw_start_addr;
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
+		hw_start_addr = ALIGN_DOWN(info[i]->address, HW_BREAKPOINT_SIZE);
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
@@ -607,8 +666,14 @@ int hw_breakpoint_handler(struct die_args *args)
 		goto reset;
 
 	if (!nr_hit) {
-		rc = NOTIFY_DONE;
-		goto out;
+		if (cpu_has_feature(CPU_FTR_POWER10_DD1) &&
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

