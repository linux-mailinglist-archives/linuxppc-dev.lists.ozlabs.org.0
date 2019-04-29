Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BEBF0E9FA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 20:17:16 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44tCYQ1sXnzDqVQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 04:17:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44tCX131vNzDqBK
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 04:16:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 44tCX06gFHz8t30
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 04:16:00 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 44tCX06Qy7z9s9N; Tue, 30 Apr 2019 04:16:00 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=mahesh@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 44tCX00Z0Tz9s4V
 for <linuxppc-dev@ozlabs.org>; Tue, 30 Apr 2019 04:15:59 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3TICNou111559
 for <linuxppc-dev@ozlabs.org>; Mon, 29 Apr 2019 14:15:55 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2s63hneyt9-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Mon, 29 Apr 2019 14:15:55 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <mahesh@linux.vnet.ibm.com>;
 Mon, 29 Apr 2019 19:15:53 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 29 Apr 2019 19:15:51 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x3TIFobi35520580
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Apr 2019 18:15:50 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 652F2A4055;
 Mon, 29 Apr 2019 18:15:50 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BA25CA4053;
 Mon, 29 Apr 2019 18:15:49 +0000 (GMT)
Received: from [192.168.0.2] (unknown [9.102.3.52])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 29 Apr 2019 18:15:49 +0000 (GMT)
Subject: [PATCH v3 1/3] powernv/mce: reduce mce console logs to lesser lines.
From: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>
To: linuxppc-dev <linuxppc-dev@ozlabs.org>
Date: Mon, 29 Apr 2019 23:45:48 +0530
User-Agent: StGit/unknown-version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19042918-0028-0000-0000-000003689505
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19042918-0029-0000-0000-00002427F74B
Message-Id: <155656174872.20636.6539465047019566013.stgit@jupiter>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-29_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=903 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904290124
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Also add cpu number while displaying mce log. This will help cleaner logs
when mce hits on multiple cpus simultaneously.

before the changes the mce o/p was:

[  127.223515] Severe Machine check interrupt [Recovered]
[  127.223530]   NIP [d00000000ba80280]: insert_slb_entry.constprop.0+0x278/0x2c0 [mcetest_slb]
[  127.223539]   Initiator: CPU
[  127.223544]   Error type: SLB [Multihit]
[  127.223550]     Effective address: d00000000ba80280

After this patch series changes the mce o/p will be:

[  471.959843] MCE: CPU80: machine check (Warning) Host SLB Multihit [Recovered]
[  471.959870] MCE: CPU80: NIP: [d00000000b550280] insert_slb_entry.constprop.0+0x278/0x2c0 [mcetest_slb]
[  471.959892] MCE: CPU80: Probable software error (some chance of hardware cause)

UE in host application:

[ 1001.831517] MCE: CPU48: machine check (Severe) Host UE Load/Store DAR: 00007fffc6079a80 paddr: 0000000f8e260000 [Not recovered]
[ 1001.831518] MCE: CPU48: PID: 4584 Comm: find NIP: [0000000010023368]
[ 1001.831519] MCE: CPU48: Hardware error

and for MCE in Guest:

[ 1289.447571] MCE: CPU80: machine check (Warning) Guest SLB Multihit DAR: 000001001b6e0320 [Recovered]
[ 1289.447615] MCE: CPU80: PID: 24765 Comm: qemu-system-ppc Guest NIP: [00007fffa309dc60]
[ 1289.447634] MCE: CPU80: Probable software error (some chance of hardware cause)

Signed-off-by: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>
---
CHange in v3:
- Print physical address if available.

Change in v2:
- Address comments from Michael.
---
 arch/powerpc/include/asm/mce.h |    2 -
 arch/powerpc/kernel/mce.c      |   89 ++++++++++++++++++++++------------------
 2 files changed, 49 insertions(+), 42 deletions(-)

diff --git a/arch/powerpc/include/asm/mce.h b/arch/powerpc/include/asm/mce.h
index 17996bc9382b..8d0b1c24c636 100644
--- a/arch/powerpc/include/asm/mce.h
+++ b/arch/powerpc/include/asm/mce.h
@@ -116,7 +116,7 @@ struct machine_check_event {
 	enum MCE_Initiator	initiator:8;	/* 0x03 */
 	enum MCE_ErrorType	error_type:8;	/* 0x04 */
 	enum MCE_Disposition	disposition:8;	/* 0x05 */
-	uint8_t			reserved_1[2];	/* 0x06 */
+	uint16_t		cpu;		/* 0x06 */
 	uint64_t		gpr3;		/* 0x08 */
 	uint64_t		srr0;		/* 0x10 */
 	uint64_t		srr1;		/* 0x18 */
diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
index b5fec1f9751a..25a8b20cbbdc 100644
--- a/arch/powerpc/kernel/mce.c
+++ b/arch/powerpc/kernel/mce.c
@@ -112,6 +112,7 @@ void save_mce_event(struct pt_regs *regs, long handled,
 	mce->srr1 = regs->msr;
 	mce->gpr3 = regs->gpr[3];
 	mce->in_use = 1;
+	mce->cpu = get_paca()->paca_index;
 
 	/* Mark it recovered if we have handled it and MSR(RI=1). */
 	if (handled && (regs->msr & MSR_RI))
@@ -310,7 +311,11 @@ static void machine_check_process_queued_event(struct irq_work *work)
 void machine_check_print_event_info(struct machine_check_event *evt,
 				    bool user_mode, bool in_guest)
 {
-	const char *level, *sevstr, *subtype;
+	const char *level, *sevstr, *subtype, *err_type;
+	uint64_t ea = 0, pa = 0;
+	int n = 0;
+	char dar_str[50];
+	char pa_str[50];
 	static const char *mc_ue_types[] = {
 		"Indeterminate",
 		"Instruction fetch",
@@ -384,101 +389,103 @@ void machine_check_print_event_info(struct machine_check_event *evt,
 		break;
 	}
 
-	printk("%s%s Machine check interrupt [%s]\n", level, sevstr,
-	       evt->disposition == MCE_DISPOSITION_RECOVERED ?
-	       "Recovered" : "Not recovered");
-
-	if (in_guest) {
-		printk("%s  Guest NIP: %016llx\n", level, evt->srr0);
-	} else if (user_mode) {
-		printk("%s  NIP: [%016llx] PID: %d Comm: %s\n", level,
-			evt->srr0, current->pid, current->comm);
-	} else {
-		printk("%s  NIP [%016llx]: %pS\n", level, evt->srr0,
-		       (void *)evt->srr0);
-	}
-
-	printk("%s  Initiator: %s\n", level,
-	       evt->initiator == MCE_INITIATOR_CPU ? "CPU" : "Unknown");
 	switch (evt->error_type) {
 	case MCE_ERROR_TYPE_UE:
+		err_type = "UE";
 		subtype = evt->u.ue_error.ue_error_type <
 			ARRAY_SIZE(mc_ue_types) ?
 			mc_ue_types[evt->u.ue_error.ue_error_type]
 			: "Unknown";
-		printk("%s  Error type: UE [%s]\n", level, subtype);
 		if (evt->u.ue_error.effective_address_provided)
-			printk("%s    Effective address: %016llx\n",
-			       level, evt->u.ue_error.effective_address);
+			ea = evt->u.ue_error.effective_address;
 		if (evt->u.ue_error.physical_address_provided)
-			printk("%s    Physical address:  %016llx\n",
-			       level, evt->u.ue_error.physical_address);
+			pa = evt->u.ue_error.physical_address;
 		break;
 	case MCE_ERROR_TYPE_SLB:
+		err_type = "SLB";
 		subtype = evt->u.slb_error.slb_error_type <
 			ARRAY_SIZE(mc_slb_types) ?
 			mc_slb_types[evt->u.slb_error.slb_error_type]
 			: "Unknown";
-		printk("%s  Error type: SLB [%s]\n", level, subtype);
 		if (evt->u.slb_error.effective_address_provided)
-			printk("%s    Effective address: %016llx\n",
-			       level, evt->u.slb_error.effective_address);
+			ea = evt->u.slb_error.effective_address;
 		break;
 	case MCE_ERROR_TYPE_ERAT:
+		err_type = "ERAT";
 		subtype = evt->u.erat_error.erat_error_type <
 			ARRAY_SIZE(mc_erat_types) ?
 			mc_erat_types[evt->u.erat_error.erat_error_type]
 			: "Unknown";
-		printk("%s  Error type: ERAT [%s]\n", level, subtype);
 		if (evt->u.erat_error.effective_address_provided)
-			printk("%s    Effective address: %016llx\n",
-			       level, evt->u.erat_error.effective_address);
+			ea = evt->u.erat_error.effective_address;
 		break;
 	case MCE_ERROR_TYPE_TLB:
+		err_type = "TLB";
 		subtype = evt->u.tlb_error.tlb_error_type <
 			ARRAY_SIZE(mc_tlb_types) ?
 			mc_tlb_types[evt->u.tlb_error.tlb_error_type]
 			: "Unknown";
-		printk("%s  Error type: TLB [%s]\n", level, subtype);
 		if (evt->u.tlb_error.effective_address_provided)
-			printk("%s    Effective address: %016llx\n",
-			       level, evt->u.tlb_error.effective_address);
+			ea = evt->u.tlb_error.effective_address;
 		break;
 	case MCE_ERROR_TYPE_USER:
+		err_type = "User";
 		subtype = evt->u.user_error.user_error_type <
 			ARRAY_SIZE(mc_user_types) ?
 			mc_user_types[evt->u.user_error.user_error_type]
 			: "Unknown";
-		printk("%s  Error type: User [%s]\n", level, subtype);
 		if (evt->u.user_error.effective_address_provided)
-			printk("%s    Effective address: %016llx\n",
-			       level, evt->u.user_error.effective_address);
+			ea = evt->u.user_error.effective_address;
 		break;
 	case MCE_ERROR_TYPE_RA:
+		err_type = "Real address";
 		subtype = evt->u.ra_error.ra_error_type <
 			ARRAY_SIZE(mc_ra_types) ?
 			mc_ra_types[evt->u.ra_error.ra_error_type]
 			: "Unknown";
-		printk("%s  Error type: Real address [%s]\n", level, subtype);
 		if (evt->u.ra_error.effective_address_provided)
-			printk("%s    Effective address: %016llx\n",
-			       level, evt->u.ra_error.effective_address);
+			ea = evt->u.ra_error.effective_address;
 		break;
 	case MCE_ERROR_TYPE_LINK:
+		err_type = "Link";
 		subtype = evt->u.link_error.link_error_type <
 			ARRAY_SIZE(mc_link_types) ?
 			mc_link_types[evt->u.link_error.link_error_type]
 			: "Unknown";
-		printk("%s  Error type: Link [%s]\n", level, subtype);
 		if (evt->u.link_error.effective_address_provided)
-			printk("%s    Effective address: %016llx\n",
-			       level, evt->u.link_error.effective_address);
+			ea = evt->u.link_error.effective_address;
 		break;
 	default:
 	case MCE_ERROR_TYPE_UNKNOWN:
-		printk("%s  Error type: Unknown\n", level);
+		err_type = "Unknown";
+		subtype = "";
 		break;
 	}
+
+	dar_str[0] = pa_str[0] = '\0';
+	if (ea && evt->srr0 != ea) {
+		/* Load/Store address */
+		n = sprintf(dar_str, "DAR: %016llx ", ea);
+		if (pa)
+			sprintf(dar_str + n, "paddr: %016llx ", pa);
+	} else if (pa) {
+		sprintf(pa_str, " paddr: %016llx", pa);
+	}
+
+	printk("%sMCE: CPU%d: machine check (%s) %s %s %s %s[%s]\n",
+		level, evt->cpu, sevstr, in_guest ? "Guest" : "Host",
+		err_type, subtype, dar_str,
+		evt->disposition == MCE_DISPOSITION_RECOVERED ?
+		"Recovered" : "Not recovered");
+
+	if (in_guest || user_mode) {
+		printk("%sMCE: CPU%d: PID: %d Comm: %s %sNIP: [%016llx]%s\n",
+			level, evt->cpu, current->pid, current->comm,
+			in_guest ? "Guest " : "", evt->srr0, pa_str);
+	} else {
+		printk("%sMCE: CPU%d: NIP: [%016llx] %pS%s\n",
+			level, evt->cpu, evt->srr0, (void *)evt->srr0, pa_str);
+	}
 }
 EXPORT_SYMBOL_GPL(machine_check_print_event_info);
 

