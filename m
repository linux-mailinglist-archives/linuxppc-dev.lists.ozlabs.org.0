Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AF75A7F5E6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 13:22:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 460PrR6ymszDr1F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 21:21:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::643; helo=mail-pl1-x643.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="RSEpuEca"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 460PM853TpzDqX1
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2019 21:00:04 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id i2so33538412plt.1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Aug 2019 04:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GqtDJ2TxvO326BNDFNtcFBJR7hW3y3I5AbJKlB+RhMw=;
 b=RSEpuEcaIVXvUQoGcaRKRYzCd5B+IptYVdmg9IhzKu33t3mVRUVQ4qqaB6aX7AvqJT
 rVDUEyWyrMISHdbmxF8bPx6eVNxkrM2dLRI3tc9EmfEoUe7VdA0Q+lvGnU6YEneLAwPH
 6v/GvsZIyMlC4MRz8gTOndU+BE77hQYpaNIE5z13zpO/iRTgrOe9vZXcXwPSdulRHj3I
 lE5jgnq0jT6Xbomlw1urguEi7JSHQLMfOmL2e9IQ+ROizsDvI0oS+Cxil6qYJglA3udl
 9q1sbGN95CrQyS/18X8rN7aU6x+EsYCqIQh7nRe0UhbXvpqDYW8R1nhUJQIOLJd1WXwO
 ODlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GqtDJ2TxvO326BNDFNtcFBJR7hW3y3I5AbJKlB+RhMw=;
 b=qksLJr/+QPpDa/PEH7vPzHcObJ3Tx0uG1cYykbyMZmHddLon97ur96QB/KvkwBPE9L
 BrG6hnnZiOujWvD3fGqg9xbKOik6Vw8uVMSZKjQql+kcrkVVdepQGMljKA8wJEg3i0SC
 VGKWZcELtKAaH6IwJHOQDETm6E1xwNEGQjBoy1H90Y+2AhX3ragi0Op9XLGXYLgHEoTX
 oUt9bgIF/vshSAITqTevo/knR6m1/l7IttN0kzf2cOqO3Ps3FHxmYpOCfn4njuSoSh6l
 wPA5543mptDTS1zbgX2bIUx4Jn7GCPpwgdKrB25BD9NGdzy5lsUBNk3p78myiDTmcN4M
 cS5w==
X-Gm-Message-State: APjAAAUzSLa+owx63o0Cl826aX2s0rliM4E18NWsu69nfxkVJ1hxjHWy
 VdIRqFQuDH5BD/CIJ3Cz4O/ydpDPxfM=
X-Google-Smtp-Source: APXvYqxW29KB3bKG0hAqehaZ7QjzXUNMA1TJI1aIfWu2jkNDQDnUIBXMnD14WVu2Ko/JVAuA5Xx/hA==
X-Received: by 2002:a17:902:2929:: with SMTP id
 g38mr109851262plb.163.1564743602495; 
 Fri, 02 Aug 2019 04:00:02 -0700 (PDT)
Received: from bobo.local0.net (193-116-68-11.tpgi.com.au. [193.116.68.11])
 by smtp.gmail.com with ESMTPSA id t96sm7377118pjb.1.2019.08.02.04.00.00
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 02 Aug 2019 04:00:01 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 09/44] powerpc/64s/pseries: machine check convert to use
 common event code
Date: Fri,  2 Aug 2019 20:56:34 +1000
Message-Id: <20190802105709.27696-10-npiggin@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190802105709.27696-1-npiggin@gmail.com>
References: <20190802105709.27696-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The common machine_check_event data structures and queues are mostly
platform independent, with powernv decoding SRR1/DSISR/etc., into
machine_check_event objects.

This patch converts pseries to use this infrastructure by decoding
fwnmi/rtas data into machine_check_event objects.

This allows queueing to be used by a subsequent change to delay the
virtual mode handling of machine checks that occur in kernel space
where it is unsafe to switch immediately to virtual mode, similarly
to powernv.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/mce.h       |   6 +
 arch/powerpc/kernel/mce.c            |  34 +-
 arch/powerpc/platforms/pseries/ras.c | 457 +++++++++++----------------
 3 files changed, 230 insertions(+), 267 deletions(-)

diff --git a/arch/powerpc/include/asm/mce.h b/arch/powerpc/include/asm/mce.h
index a4c6a74ad2fb..6f56b2d350b2 100644
--- a/arch/powerpc/include/asm/mce.h
+++ b/arch/powerpc/include/asm/mce.h
@@ -30,6 +30,10 @@ enum MCE_Disposition {
 enum MCE_Initiator {
 	MCE_INITIATOR_UNKNOWN = 0,
 	MCE_INITIATOR_CPU = 1,
+	MCE_INITIATOR_PCI = 2,
+	MCE_INITIATOR_ISA = 3,
+	MCE_INITIATOR_MEMORY= 4,
+	MCE_INITIATOR_POWERMGM = 5,
 };
 
 enum MCE_ErrorType {
@@ -41,6 +45,8 @@ enum MCE_ErrorType {
 	MCE_ERROR_TYPE_USER = 5,
 	MCE_ERROR_TYPE_RA = 6,
 	MCE_ERROR_TYPE_LINK = 7,
+	MCE_ERROR_TYPE_DCACHE = 8,
+	MCE_ERROR_TYPE_ICACHE = 9,
 };
 
 enum MCE_ErrorClass {
diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
index 38b560f92d12..5b4f766a68e9 100644
--- a/arch/powerpc/kernel/mce.c
+++ b/arch/powerpc/kernel/mce.c
@@ -300,7 +300,7 @@ static void machine_check_process_queued_event(struct irq_work *work)
 void machine_check_print_event_info(struct machine_check_event *evt,
 				    bool user_mode, bool in_guest)
 {
-	const char *level, *sevstr, *subtype, *err_type;
+	const char *level, *sevstr, *subtype, *err_type, *initiator;
 	uint64_t ea = 0, pa = 0;
 	int n = 0;
 	char dar_str[50];
@@ -385,6 +385,28 @@ void machine_check_print_event_info(struct machine_check_event *evt,
 		break;
 	}
 
+	switch(evt->initiator) {
+	case MCE_INITIATOR_CPU:
+		initiator = "CPU";
+		break;
+	case MCE_INITIATOR_PCI:
+		initiator = "PCI";
+		break;
+	case MCE_INITIATOR_ISA:
+		initiator = "ISA";
+		break;
+	case MCE_INITIATOR_MEMORY:
+		initiator = "Memory";
+		break;
+	case MCE_INITIATOR_POWERMGM:
+		initiator = "Power Management";
+		break;
+	case MCE_INITIATOR_UNKNOWN:
+	default:
+		initiator = "Unknown";
+		break;
+	}
+
 	switch (evt->error_type) {
 	case MCE_ERROR_TYPE_UE:
 		err_type = "UE";
@@ -451,6 +473,14 @@ void machine_check_print_event_info(struct machine_check_event *evt,
 		if (evt->u.link_error.effective_address_provided)
 			ea = evt->u.link_error.effective_address;
 		break;
+	case MCE_ERROR_TYPE_DCACHE:
+		err_type = "D-Cache";
+		subtype = "Unknown";
+		break;
+	case MCE_ERROR_TYPE_ICACHE:
+		err_type = "I-Cache";
+		subtype = "Unknown";
+		break;
 	default:
 	case MCE_ERROR_TYPE_UNKNOWN:
 		err_type = "Unknown";
@@ -483,6 +513,8 @@ void machine_check_print_event_info(struct machine_check_event *evt,
 			level, evt->cpu, evt->srr0, (void *)evt->srr0, pa_str);
 	}
 
+	printk("%sMCE: CPU%d: Initiator %s\n", level, evt->cpu, initiator);
+
 	subtype = evt->error_class < ARRAY_SIZE(mc_error_class) ?
 		mc_error_class[evt->error_class] : "Unknown";
 	printk("%sMCE: CPU%d: %s\n", level, evt->cpu, subtype);
diff --git a/arch/powerpc/platforms/pseries/ras.c b/arch/powerpc/platforms/pseries/ras.c
index f16fdd0f71f7..e03c3389692e 100644
--- a/arch/powerpc/platforms/pseries/ras.c
+++ b/arch/powerpc/platforms/pseries/ras.c
@@ -76,6 +76,7 @@ struct pseries_mc_errorlog {
 #define MC_ERROR_TYPE_UE		0x00
 #define MC_ERROR_TYPE_SLB		0x01
 #define MC_ERROR_TYPE_ERAT		0x02
+#define MC_ERROR_TYPE_UNKNOWN		0x03
 #define MC_ERROR_TYPE_TLB		0x04
 #define MC_ERROR_TYPE_D_CACHE		0x05
 #define MC_ERROR_TYPE_I_CACHE		0x07
@@ -87,6 +88,9 @@ struct pseries_mc_errorlog {
 #define MC_ERROR_UE_LOAD_STORE			3
 #define MC_ERROR_UE_PAGE_TABLE_WALK_LOAD_STORE	4
 
+#define UE_EFFECTIVE_ADDR_PROVIDED		0x40
+#define UE_LOGICAL_ADDR_PROVIDED		0x20
+
 #define MC_ERROR_SLB_PARITY		0
 #define MC_ERROR_SLB_MULTIHIT		1
 #define MC_ERROR_SLB_INDETERMINATE	2
@@ -113,27 +117,6 @@ static inline u8 rtas_mc_error_sub_type(const struct pseries_mc_errorlog *mlog)
 	}
 }
 
-static
-inline u64 rtas_mc_get_effective_addr(const struct pseries_mc_errorlog *mlog)
-{
-	__be64 addr = 0;
-
-	switch (mlog->error_type) {
-	case	MC_ERROR_TYPE_UE:
-		if (mlog->sub_err_type & 0x40)
-			addr = mlog->effective_address;
-		break;
-	case	MC_ERROR_TYPE_SLB:
-	case	MC_ERROR_TYPE_ERAT:
-	case	MC_ERROR_TYPE_TLB:
-		if (mlog->sub_err_type & 0x80)
-			addr = mlog->effective_address;
-	default:
-		break;
-	}
-	return be64_to_cpu(addr);
-}
-
 /*
  * Enable the hotplug interrupt late because processing them may touch other
  * devices or systems (e.g. hugepages) that have not been initialized at the
@@ -511,160 +494,162 @@ int pSeries_system_reset_exception(struct pt_regs *regs)
 	return 0; /* need to perform reset */
 }
 
-#define VAL_TO_STRING(ar, val)	\
-	(((val) < ARRAY_SIZE(ar)) ? ar[(val)] : "Unknown")
 
-static void pseries_print_mce_info(struct pt_regs *regs,
-				   struct rtas_error_log *errp)
+static int mce_handle_error(struct pt_regs *regs, struct rtas_error_log *errp)
 {
-	const char *level, *sevstr;
+	struct mce_error_info mce_err = { 0 };
+	unsigned long eaddr = 0, paddr = 0;
 	struct pseries_errorlog *pseries_log;
 	struct pseries_mc_errorlog *mce_log;
-	u8 error_type, err_sub_type;
-	u64 addr;
-	u8 initiator = rtas_error_initiator(errp);
 	int disposition = rtas_error_disposition(errp);
+	int initiator = rtas_error_initiator(errp);
+	int severity = rtas_error_severity(errp);
+	u8 error_type, err_sub_type;
 
-	static const char * const initiators[] = {
-		[0] = "Unknown",
-		[1] = "CPU",
-		[2] = "PCI",
-		[3] = "ISA",
-		[4] = "Memory",
-		[5] = "Power Mgmt",
-	};
-	static const char * const mc_err_types[] = {
-		[0] = "UE",
-		[1] = "SLB",
-		[2] = "ERAT",
-		[3] = "Unknown",
-		[4] = "TLB",
-		[5] = "D-Cache",
-		[6] = "Unknown",
-		[7] = "I-Cache",
-	};
-	static const char * const mc_ue_types[] = {
-		[0] = "Indeterminate",
-		[1] = "Instruction fetch",
-		[2] = "Page table walk ifetch",
-		[3] = "Load/Store",
-		[4] = "Page table walk Load/Store",
-	};
-
-	/* SLB sub errors valid values are 0x0, 0x1, 0x2 */
-	static const char * const mc_slb_types[] = {
-		[0] = "Parity",
-		[1] = "Multihit",
-		[2] = "Indeterminate",
-	};
-
-	/* TLB and ERAT sub errors valid values are 0x1, 0x2, 0x3 */
-	static const char * const mc_soft_types[] = {
-		[0] = "Unknown",
-		[1] = "Parity",
-		[2] = "Multihit",
-		[3] = "Indeterminate",
-	};
-
-	if (!rtas_error_extended(errp)) {
-		pr_err("Machine check interrupt: Missing extended error log\n");
-		return;
-	}
+	if (initiator == RTAS_INITIATOR_UNKNOWN)
+		mce_err.initiator = MCE_INITIATOR_UNKNOWN;
+	else if (initiator == RTAS_INITIATOR_CPU)
+		mce_err.initiator = MCE_INITIATOR_CPU;
+	else if (initiator == RTAS_INITIATOR_PCI)
+		mce_err.initiator = MCE_INITIATOR_PCI;
+	else if (initiator == RTAS_INITIATOR_ISA)
+		mce_err.initiator = MCE_INITIATOR_ISA;
+	else if (initiator == RTAS_INITIATOR_MEMORY)
+		mce_err.initiator = MCE_INITIATOR_MEMORY;
+	else if (initiator == RTAS_INITIATOR_POWERMGM)
+		mce_err.initiator = MCE_INITIATOR_POWERMGM;
+	else
+		mce_err.initiator = MCE_INITIATOR_UNKNOWN;
+
+	if (severity == RTAS_SEVERITY_NO_ERROR)
+		mce_err.severity = MCE_SEV_NO_ERROR;
+	else if (severity == RTAS_SEVERITY_EVENT)
+		mce_err.severity = MCE_SEV_WARNING;
+	else if (severity == RTAS_SEVERITY_WARNING)
+		mce_err.severity = MCE_SEV_WARNING;
+	else if (severity == RTAS_SEVERITY_ERROR_SYNC)
+		mce_err.severity = MCE_SEV_SEVERE;
+	else if (severity == RTAS_SEVERITY_ERROR)
+		mce_err.severity = MCE_SEV_SEVERE;
+	else if (severity == RTAS_SEVERITY_FATAL)
+		mce_err.severity = MCE_SEV_FATAL;
+	else
+		mce_err.severity = MCE_SEV_FATAL;
+
+	if (severity <= RTAS_SEVERITY_ERROR_SYNC)
+		mce_err.sync_error = true;
+	else
+		mce_err.sync_error = false;
+
+	mce_err.error_type = MCE_ERROR_TYPE_UNKNOWN;
+	mce_err.error_class = MCE_ECLASS_UNKNOWN;
+
+	if (!rtas_error_extended(errp))
+		goto out;
 
 	pseries_log = get_pseries_errorlog(errp, PSERIES_ELOG_SECT_ID_MCE);
 	if (pseries_log == NULL)
-		return;
+		goto out;
 
 	mce_log = (struct pseries_mc_errorlog *)pseries_log->data;
-
 	error_type = mce_log->error_type;
 	err_sub_type = rtas_mc_error_sub_type(mce_log);
 
-	switch (rtas_error_severity(errp)) {
-	case RTAS_SEVERITY_NO_ERROR:
-		level = KERN_INFO;
-		sevstr = "Harmless";
-		break;
-	case RTAS_SEVERITY_WARNING:
-		level = KERN_WARNING;
-		sevstr = "";
-		break;
-	case RTAS_SEVERITY_ERROR:
-	case RTAS_SEVERITY_ERROR_SYNC:
-		level = KERN_ERR;
-		sevstr = "Severe";
-		break;
-	case RTAS_SEVERITY_FATAL:
-	default:
-		level = KERN_ERR;
-		sevstr = "Fatal";
-		break;
-	}
+	switch (mce_log->error_type) {
+	case MC_ERROR_TYPE_UE:
+		mce_err.error_type = MCE_ERROR_TYPE_UE;
+		switch (err_sub_type) {
+		case MC_ERROR_UE_IFETCH:
+			mce_err.u.ue_error_type = MCE_UE_ERROR_IFETCH;
+		case MC_ERROR_UE_PAGE_TABLE_WALK_IFETCH:
+			mce_err.u.ue_error_type = MCE_UE_ERROR_PAGE_TABLE_WALK_IFETCH;
+		case MC_ERROR_UE_LOAD_STORE:
+			mce_err.u.ue_error_type = MCE_UE_ERROR_LOAD_STORE;
+		case MC_ERROR_UE_PAGE_TABLE_WALK_LOAD_STORE:
+			mce_err.u.ue_error_type = MCE_UE_ERROR_PAGE_TABLE_WALK_LOAD_STORE;
+		case MC_ERROR_UE_INDETERMINATE:
+		default:
+			mce_err.u.ue_error_type = MCE_UE_ERROR_INDETERMINATE;
+			break;
+		}
+		if (mce_log->sub_err_type & UE_EFFECTIVE_ADDR_PROVIDED)
+			eaddr = be64_to_cpu(mce_log->effective_address);
 
-#ifdef CONFIG_PPC_BOOK3S_64
-	/* Display faulty slb contents for SLB errors. */
-	if (error_type == MC_ERROR_TYPE_SLB)
-		slb_dump_contents(local_paca->mce_faulty_slbs);
-#endif
+		if (mce_log->sub_err_type & UE_LOGICAL_ADDR_PROVIDED) {
+			paddr = be64_to_cpu(mce_log->logical_address);
+		} else if (mce_log->sub_err_type & UE_EFFECTIVE_ADDR_PROVIDED) {
+			unsigned long pfn;
+
+			pfn = addr_to_pfn(regs, eaddr);
+			if (pfn != ULONG_MAX)
+				paddr = pfn << PAGE_SHIFT;
+		}
 
-	printk("%s%s Machine check interrupt [%s]\n", level, sevstr,
-	       disposition == RTAS_DISP_FULLY_RECOVERED ?
-	       "Recovered" : "Not recovered");
-	if (user_mode(regs)) {
-		printk("%s  NIP: [%016lx] PID: %d Comm: %s\n", level,
-		       regs->nip, current->pid, current->comm);
-	} else {
-		printk("%s  NIP [%016lx]: %pS\n", level, regs->nip,
-		       (void *)regs->nip);
-	}
-	printk("%s  Initiator: %s\n", level,
-	       VAL_TO_STRING(initiators, initiator));
 
-	switch (error_type) {
-	case MC_ERROR_TYPE_UE:
-		printk("%s  Error type: %s [%s]\n", level,
-		       VAL_TO_STRING(mc_err_types, error_type),
-		       VAL_TO_STRING(mc_ue_types, err_sub_type));
 		break;
 	case MC_ERROR_TYPE_SLB:
-		printk("%s  Error type: %s [%s]\n", level,
-		       VAL_TO_STRING(mc_err_types, error_type),
-		       VAL_TO_STRING(mc_slb_types, err_sub_type));
+		mce_err.error_type = MCE_ERROR_TYPE_SLB;
+		switch (err_sub_type) {
+		case MC_ERROR_SLB_PARITY:
+			mce_err.u.slb_error_type = MCE_SLB_ERROR_PARITY;
+			break;
+		case MC_ERROR_SLB_MULTIHIT:
+			mce_err.u.slb_error_type = MCE_SLB_ERROR_MULTIHIT;
+			break;
+		case MC_ERROR_SLB_INDETERMINATE:
+		default:
+			mce_err.u.slb_error_type = MCE_SLB_ERROR_INDETERMINATE;
+			break;
+		}
+		if (mce_log->sub_err_type & 0x80)
+			eaddr = be64_to_cpu(mce_log->effective_address);
 		break;
 	case MC_ERROR_TYPE_ERAT:
+		mce_err.error_type = MCE_ERROR_TYPE_ERAT;
+		switch (err_sub_type) {
+		case MC_ERROR_ERAT_PARITY:
+			mce_err.u.erat_error_type = MCE_ERAT_ERROR_PARITY;
+			break;
+		case MC_ERROR_ERAT_MULTIHIT:
+			mce_err.u.erat_error_type = MCE_ERAT_ERROR_MULTIHIT;
+			break;
+		case MC_ERROR_ERAT_INDETERMINATE:
+		default:
+			mce_err.u.erat_error_type = MCE_ERAT_ERROR_INDETERMINATE;
+			break;
+		}
+		if (mce_log->sub_err_type & 0x80)
+			eaddr = be64_to_cpu(mce_log->effective_address);
+		break;
 	case MC_ERROR_TYPE_TLB:
-		printk("%s  Error type: %s [%s]\n", level,
-		       VAL_TO_STRING(mc_err_types, error_type),
-		       VAL_TO_STRING(mc_soft_types, err_sub_type));
+		mce_err.error_type = MCE_ERROR_TYPE_TLB;
+		switch (err_sub_type) {
+		case MC_ERROR_TLB_PARITY:
+			mce_err.u.tlb_error_type = MCE_TLB_ERROR_PARITY;
+			break;
+		case MC_ERROR_TLB_MULTIHIT:
+			mce_err.u.tlb_error_type = MCE_TLB_ERROR_MULTIHIT;
+			break;
+		case MC_ERROR_TLB_INDETERMINATE:
+		default:
+			mce_err.u.tlb_error_type = MCE_TLB_ERROR_INDETERMINATE;
+			break;
+		}
+		if (mce_log->sub_err_type & 0x80)
+			eaddr = be64_to_cpu(mce_log->effective_address);
 		break;
+	case MC_ERROR_TYPE_D_CACHE:
+		mce_err.error_type = MCE_ERROR_TYPE_DCACHE;
+		break;
+	case MC_ERROR_TYPE_I_CACHE:
+		mce_err.error_type = MCE_ERROR_TYPE_DCACHE;
+		break;
+	case MC_ERROR_TYPE_UNKNOWN:
 	default:
-		printk("%s  Error type: %s\n", level,
-		       VAL_TO_STRING(mc_err_types, error_type));
+		mce_err.error_type = MCE_ERROR_TYPE_UNKNOWN;
 		break;
 	}
 
-	addr = rtas_mc_get_effective_addr(mce_log);
-	if (addr)
-		printk("%s    Effective address: %016llx\n", level, addr);
-}
-
-static int mce_handle_error(struct rtas_error_log *errp)
-{
-	struct pseries_errorlog *pseries_log;
-	struct pseries_mc_errorlog *mce_log;
-	int disposition = rtas_error_disposition(errp);
-	u8 error_type;
-
-	if (!rtas_error_extended(errp))
-		goto out;
-
-	pseries_log = get_pseries_errorlog(errp, PSERIES_ELOG_SECT_ID_MCE);
-	if (pseries_log == NULL)
-		goto out;
-
-	mce_log = (struct pseries_mc_errorlog *)pseries_log->data;
-	error_type = mce_log->error_type;
-
 #ifdef CONFIG_PPC_BOOK3S_64
 	if (disposition == RTAS_DISP_NOT_RECOVERED) {
 		switch (error_type) {
@@ -682,98 +667,24 @@ static int mce_handle_error(struct rtas_error_log *errp)
 				slb_save_contents(local_paca->mce_faulty_slbs);
 			flush_and_reload_slb();
 			disposition = RTAS_DISP_FULLY_RECOVERED;
-			rtas_set_disposition_recovered(errp);
 			break;
 		default:
 			break;
 		}
+	} else if (disposition == RTAS_DISP_LIMITED_RECOVERY) {
+		/* Platform corrected itself but could be degraded */
+		printk(KERN_ERR "MCE: limited recovery, system may "
+		       "be degraded\n");
+		disposition = RTAS_DISP_FULLY_RECOVERED;
 	}
 #endif
 
 out:
-	return disposition;
-}
-
-#ifdef CONFIG_MEMORY_FAILURE
-
-static DEFINE_PER_CPU(int, rtas_ue_count);
-static DEFINE_PER_CPU(unsigned long, rtas_ue_paddr[MAX_MC_EVT]);
-
-#define UE_EFFECTIVE_ADDR_PROVIDED	0x40
-#define UE_LOGICAL_ADDR_PROVIDED	0x20
-
-
-static void pseries_hwpoison_work_fn(struct work_struct *work)
-{
-	unsigned long paddr;
-	int index;
-
-	while (__this_cpu_read(rtas_ue_count) > 0) {
-		index = __this_cpu_read(rtas_ue_count) - 1;
-		paddr = __this_cpu_read(rtas_ue_paddr[index]);
-		memory_failure(paddr >> PAGE_SHIFT, 0);
-		__this_cpu_dec(rtas_ue_count);
-	}
-}
+	save_mce_event(regs, disposition == RTAS_DISP_FULLY_RECOVERED,
+			&mce_err, regs->nip, eaddr, paddr);
 
-static DECLARE_WORK(hwpoison_work, pseries_hwpoison_work_fn);
-
-static void queue_ue_paddr(unsigned long paddr)
-{
-	int index;
-
-	index = __this_cpu_inc_return(rtas_ue_count) - 1;
-	if (index >= MAX_MC_EVT) {
-		__this_cpu_dec(rtas_ue_count);
-		return;
-	}
-	this_cpu_write(rtas_ue_paddr[index], paddr);
-	schedule_work(&hwpoison_work);
-}
-
-static void pseries_do_memory_failure(struct pt_regs *regs,
-				      struct pseries_mc_errorlog *mce_log)
-{
-	unsigned long paddr;
-
-	if (mce_log->sub_err_type & UE_LOGICAL_ADDR_PROVIDED) {
-		paddr = be64_to_cpu(mce_log->logical_address);
-	} else if (mce_log->sub_err_type & UE_EFFECTIVE_ADDR_PROVIDED) {
-		unsigned long pfn;
-
-		pfn = addr_to_pfn(regs,
-				  be64_to_cpu(mce_log->effective_address));
-		if (pfn == ULONG_MAX)
-			return;
-		paddr = pfn << PAGE_SHIFT;
-	} else {
-		return;
-	}
-	queue_ue_paddr(paddr);
-}
-
-static void pseries_process_ue(struct pt_regs *regs,
-			       struct rtas_error_log *errp)
-{
-	struct pseries_errorlog *pseries_log;
-	struct pseries_mc_errorlog *mce_log;
-
-	if (!rtas_error_extended(errp))
-		return;
-
-	pseries_log = get_pseries_errorlog(errp, PSERIES_ELOG_SECT_ID_MCE);
-	if (!pseries_log)
-		return;
-
-	mce_log = (struct pseries_mc_errorlog *)pseries_log->data;
-
-	if (mce_log->error_type == MC_ERROR_TYPE_UE)
-		pseries_do_memory_failure(regs, mce_log);
+	return disposition;
 }
-#else
-static inline void pseries_process_ue(struct pt_regs *regs,
-				      struct rtas_error_log *errp) { }
-#endif /*CONFIG_MEMORY_FAILURE */
 
 /*
  * Process MCE rtas errlog event.
@@ -795,49 +706,51 @@ static void mce_process_errlog_event(struct irq_work *work)
  * Return 1 if corrected (or delivered a signal).
  * Return 0 if there is nothing we can do.
  */
-static int recover_mce(struct pt_regs *regs, struct rtas_error_log *err)
+static int recover_mce(struct pt_regs *regs, struct machine_check_event *evt)
 {
 	int recovered = 0;
-	int disposition = rtas_error_disposition(err);
-
-	pseries_print_mce_info(regs, err);
 
 	if (!(regs->msr & MSR_RI)) {
 		/* If MSR_RI isn't set, we cannot recover */
 		pr_err("Machine check interrupt unrecoverable: MSR(RI=0)\n");
 		recovered = 0;
-
-	} else if (disposition == RTAS_DISP_FULLY_RECOVERED) {
+	} else if (evt->disposition == MCE_DISPOSITION_RECOVERED) {
 		/* Platform corrected itself */
 		recovered = 1;
+	} else if (evt->severity == MCE_SEV_FATAL) {
+		/* Fatal machine check */
+		pr_err("Machine check interrupt is fatal\n");
+		recovered = 0;
+	}
 
-	} else if (disposition == RTAS_DISP_LIMITED_RECOVERY) {
-		/* Platform corrected itself but could be degraded */
-		printk(KERN_ERR "MCE: limited recovery, system may "
-		       "be degraded\n");
-		recovered = 1;
-
-	} else if (user_mode(regs) && !is_global_init(current) &&
-		   rtas_error_severity(err) == RTAS_SEVERITY_ERROR_SYNC) {
-
+	if (!recovered && evt->sync_error) {
 		/*
-		 * If we received a synchronous error when in userspace
-		 * kill the task. Firmware may report details of the fail
-		 * asynchronously, so we can't rely on the target and type
-		 * fields being valid here.
+		 * Try to kill processes if we get a synchronous machine check
+		 * (e.g., one caused by execution of this instruction). This
+		 * will devolve into a panic if we try to kill init or are in
+		 * an interrupt etc.
+		 *
+		 * TODO: Queue up this address for hwpoisioning later.
+		 * TODO: This is not quite right for d-side machine
+		 *       checks ->nip is not necessarily the important
+		 *       address.
 		 */
-		printk(KERN_ERR "MCE: uncorrectable error, killing task "
-		       "%s:%d\n", current->comm, current->pid);
-
-		_exception(SIGBUS, regs, BUS_MCEERR_AR, regs->nip);
-		recovered = 1;
+		if ((user_mode(regs))) {
+			_exception(SIGBUS, regs, BUS_MCEERR_AR, regs->nip);
+			recovered = 1;
+		} else if (die_will_crash()) {
+			/*
+			 * die() would kill the kernel, so better to go via
+			 * the platform reboot code that will log the
+			 * machine check.
+			 */
+			recovered = 0;
+		} else {
+			die("Machine check", regs, SIGBUS);
+			recovered = 1;
+		}
 	}
 
-	pseries_process_ue(regs, err);
-
-	/* Queue irq work to log this rtas event later. */
-	irq_work_queue(&mce_errlog_process_work);
-
 	return recovered;
 }
 
@@ -853,14 +766,21 @@ static int recover_mce(struct pt_regs *regs, struct rtas_error_log *err)
  */
 int pSeries_machine_check_exception(struct pt_regs *regs)
 {
-	struct rtas_error_log *errp;
+	struct machine_check_event evt;
 
-	if (fwnmi_active) {
-		fwnmi_release_errinfo();
-		errp = fwnmi_get_errlog();
-		if (errp && recover_mce(regs, errp))
-			return 1;
+	if (!get_mce_event(&evt, MCE_EVENT_RELEASE))
+		return 0;
+
+	/* Print things out */
+	if (evt.version != MCE_V1) {
+		pr_err("Machine Check Exception, Unknown event version %d !\n",
+		       evt.version);
+		return 0;
 	}
+	machine_check_print_event_info(&evt, user_mode(regs), false);
+
+	if (recover_mce(regs, &evt))
+		return 1;
 
 	return 0;
 }
@@ -877,7 +797,12 @@ long pseries_machine_check_realmode(struct pt_regs *regs)
 		 * to panic. Hence we will call it as soon as we go into
 		 * virtual mode.
 		 */
-		disposition = mce_handle_error(errp);
+		disposition = mce_handle_error(regs, errp);
+		fwnmi_release_errinfo();
+
+		/* Queue irq work to log this rtas event later. */
+		irq_work_queue(&mce_errlog_process_work);
+
 		if (disposition == RTAS_DISP_FULLY_RECOVERED)
 			return 1;
 	}
-- 
2.22.0

