Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 65899A668D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 12:31:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46N3C80vBgzDqP5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 20:31:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::541; helo=mail-pg1-x541.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="fUKlOgmm"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46N2tV3KpFzDqQK
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2019 20:16:50 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id x15so8869569pgg.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Sep 2019 03:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oflZ7oeU8QgdikE1fkjMQOiEyn0+bHCXZfFNrTKL+2A=;
 b=fUKlOgmm79ZrW8aK1CcVA2E5vmYsjGvu118q7B2WKAWQaM0yPv7y8oVTUTIgOXF6CK
 8cNFOqAl5FmuMG6athFnZZMhgBAsY54/5P4pt+sxLW2YfvYjO12M7zQAtpNkKBJyMZvi
 BcFwpH5OXI1M8bmXvxTvydr5O8hYuyv3lmuXXMxH/HHDTG+6zdXW5bm4tPkAKpLkIhpW
 1FmoFWRVq77u1HYbTNLnF4RY+U/Y4cL4J/XzZgcqbn+n8BPRKKPmwuUh6t9Rycw1X/fj
 KQZIr6zBibYdcHY1z7ufw8RXMdFXV9G8t1vRdJYwTblSTzUTOW0PDl4yt1FMoJKKXwa4
 6K2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oflZ7oeU8QgdikE1fkjMQOiEyn0+bHCXZfFNrTKL+2A=;
 b=dWOhTMGrjKMXYFcve/63mYKlUXDUsiQipwQ9g/LlSg8ujwEKUVu7qB8nS5BcGqhWCW
 6Ut3zMmf45YLXPtwOKSeWgqqv6U3S1GPuUYq6Vt/qYo75XNoLK5Ha/Jlta1IdQHisYwg
 xTbJPGI6djLXjpF1PDYwE4smdwaJ7N+Z33vEPBqeH2DdOgHPq1gdQCsxpWFhPgskT6ol
 K1OdlZI9gcUfYEMdsoIVxtlSpIcG8u0J+O3J/+vEOQdb4ArBKSQCBCyr35Rt0QobcRdz
 joY3GoWWpb7ReVA0cOPGeHC1HedMurF0lHR5WPEbk4F6AowVvCtatotTDwSJYokiASs7
 O7fw==
X-Gm-Message-State: APjAAAX6kEuAhC0egb7z9hVKQPqFZAKjn3IThgzSS5pEH8UTPdqnDrOI
 7jWCXO/gP49G0+zYwm85fkMjnmj+
X-Google-Smtp-Source: APXvYqxhVEgzOLAyR6gd1bH0BidYLzlefuld1+gAAHPHJN+uyJp1BFTzYO9ahcIQoC9sE9z5j9S9Iw==
X-Received: by 2002:aa7:800c:: with SMTP id j12mr37113567pfi.255.1567505807819; 
 Tue, 03 Sep 2019 03:16:47 -0700 (PDT)
Received: from wafer.ozlabs.ibm.com.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id e24sm19676701pgk.21.2019.09.03.03.16.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2019 03:16:42 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 05/14] powerpc/eeh: Defer printing stack trace
Date: Tue,  3 Sep 2019 20:15:56 +1000
Message-Id: <20190903101605.2890-6-oohall@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190903101605.2890-1-oohall@gmail.com>
References: <20190903101605.2890-1-oohall@gmail.com>
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
Cc: sbobroff@linux.ibm.com, Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently we print a stack trace in the event handler to help with
debugging EEH issues. In the case of suprise hot-unplug this is unneeded,
so we want to prevent printing the stack trace unless we know it's due to
an actual device error. To accomplish this, we can save a stack trace at
the point of detection and only print it once the EEH recovery handler has
determined the freeze was due to an actual error.

Since the whole point of this is to prevent spurious EEH output we also
move a few prints out of the detection thread, or mark them as pr_debug
so anyone interested can get output from the eeh_check_dev_failure()
if they want.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/include/asm/eeh.h   | 11 +++++++++
 arch/powerpc/kernel/eeh.c        | 15 ++++---------
 arch/powerpc/kernel/eeh_driver.c | 38 +++++++++++++++++++++++++++++++-
 arch/powerpc/kernel/eeh_event.c  | 26 ++++++++++------------
 4 files changed, 64 insertions(+), 26 deletions(-)

diff --git a/arch/powerpc/include/asm/eeh.h b/arch/powerpc/include/asm/eeh.h
index c13119a5e69b..9d0e1694a94d 100644
--- a/arch/powerpc/include/asm/eeh.h
+++ b/arch/powerpc/include/asm/eeh.h
@@ -88,6 +88,17 @@ struct eeh_pe {
 	struct list_head child_list;	/* List of PEs below this PE	*/
 	struct list_head child;		/* Memb. child_list/eeh_phb_pe	*/
 	struct list_head edevs;		/* List of eeh_dev in this PE	*/
+
+	/*
+	 * Saved stack trace. When we find a PE freeze in eeh_dev_check_failure
+	 * the stack trace is saved here so we can print it in the recovery
+	 * thread if it turns out to due to a real problem rather than
+	 * a hot-remove.
+	 *
+	 * A max of 64 entries might be overkill, but it also might not be.
+	 */
+	unsigned long stack_trace[64];
+	int trace_entries;
 };
 
 #define eeh_pe_for_each_dev(pe, edev, tmp) \
diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
index 9c468e79d13c..46d17817b438 100644
--- a/arch/powerpc/kernel/eeh.c
+++ b/arch/powerpc/kernel/eeh.c
@@ -420,11 +420,9 @@ static int eeh_phb_check_failure(struct eeh_pe *pe)
 	eeh_pe_mark_isolated(phb_pe);
 	eeh_serialize_unlock(flags);
 
-	pr_err("EEH: PHB#%x failure detected, location: %s\n",
+	pr_debug("EEH: PHB#%x failure detected, location: %s\n",
 		phb_pe->phb->global_number, eeh_pe_loc_get(phb_pe));
-	dump_stack();
 	eeh_send_failure_event(phb_pe);
-
 	return 1;
 out:
 	eeh_serialize_unlock(flags);
@@ -451,7 +449,7 @@ int eeh_dev_check_failure(struct eeh_dev *edev)
 	unsigned long flags;
 	struct device_node *dn;
 	struct pci_dev *dev;
-	struct eeh_pe *pe, *parent_pe, *phb_pe;
+	struct eeh_pe *pe, *parent_pe;
 	int rc = 0;
 	const char *location = NULL;
 
@@ -581,13 +579,8 @@ int eeh_dev_check_failure(struct eeh_dev *edev)
 	 * a stack trace will help the device-driver authors figure
 	 * out what happened.  So print that out.
 	 */
-	phb_pe = eeh_phb_pe_get(pe->phb);
-	pr_err("EEH: Frozen PHB#%x-PE#%x detected\n",
-	       pe->phb->global_number, pe->addr);
-	pr_err("EEH: PE location: %s, PHB location: %s\n",
-	       eeh_pe_loc_get(pe), eeh_pe_loc_get(phb_pe));
-	dump_stack();
-
+	pr_debug("EEH: %s: Frozen PHB#%x-PE#%x detected\n",
+		__func__, pe->phb->global_number, pe->addr);
 	eeh_send_failure_event(pe);
 
 	return 1;
diff --git a/arch/powerpc/kernel/eeh_driver.c b/arch/powerpc/kernel/eeh_driver.c
index 52ce7584af43..0d34cc12c529 100644
--- a/arch/powerpc/kernel/eeh_driver.c
+++ b/arch/powerpc/kernel/eeh_driver.c
@@ -863,8 +863,44 @@ void eeh_handle_normal_event(struct eeh_pe *pe)
 			if (eeh_slot_presence_check(edev->pdev))
 				devices++;
 
-	if (!devices)
+	if (!devices) {
+		pr_debug("EEH: Frozen PHB#%x-PE#%x is empty!\n",
+			pe->phb->global_number, pe->addr);
 		goto out; /* nothing to recover */
+	}
+
+	/* Log the event */
+	if (pe->type & EEH_PE_PHB) {
+		pr_err("EEH: PHB#%x failure detected, location: %s\n",
+			pe->phb->global_number, eeh_pe_loc_get(pe));
+	} else {
+		struct eeh_pe *phb_pe = eeh_phb_pe_get(pe->phb);
+
+		pr_err("EEH: Frozen PHB#%x-PE#%x detected\n",
+		       pe->phb->global_number, pe->addr);
+		pr_err("EEH: PE location: %s, PHB location: %s\n",
+		       eeh_pe_loc_get(pe), eeh_pe_loc_get(phb_pe));
+	}
+
+	/*
+	 * Print the saved stack trace now that we've verified there's
+	 * something to recover.
+	 */
+	if (pe->trace_entries) {
+		void **ptrs = (void **) pe->stack_trace;
+		int i;
+
+		pr_err("EEH: Frozen PHB#%x-PE#%x detected\n",
+		       pe->phb->global_number, pe->addr);
+
+		/* FIXME: Use the same format as dump_stack() */
+		pr_err("EEH: Call Trace:\n");
+		for (i = 0; i < pe->trace_entries; i++)
+			pr_err("EEH: [%pK] %pS\n", ptrs[i], ptrs[i]);
+
+		pe->trace_entries = 0;
+	}
+
 
 	eeh_pe_update_time_stamp(pe);
 	pe->freeze_count++;
diff --git a/arch/powerpc/kernel/eeh_event.c b/arch/powerpc/kernel/eeh_event.c
index e36653e5f76b..1d55486adb0f 100644
--- a/arch/powerpc/kernel/eeh_event.c
+++ b/arch/powerpc/kernel/eeh_event.c
@@ -40,7 +40,6 @@ static int eeh_event_handler(void * dummy)
 {
 	unsigned long flags;
 	struct eeh_event *event;
-	struct eeh_pe *pe;
 
 	while (!kthread_should_stop()) {
 		if (wait_for_completion_interruptible(&eeh_eventlist_event))
@@ -59,19 +58,10 @@ static int eeh_event_handler(void * dummy)
 			continue;
 
 		/* We might have event without binding PE */
-		pe = event->pe;
-		if (pe) {
-			if (pe->type & EEH_PE_PHB)
-				pr_info("EEH: Detected error on PHB#%x\n",
-					 pe->phb->global_number);
-			else
-				pr_info("EEH: Detected PCI bus error on "
-					"PHB#%x-PE#%x\n",
-					pe->phb->global_number, pe->addr);
-			eeh_handle_normal_event(pe);
-		} else {
+		if (event->pe)
+			eeh_handle_normal_event(event->pe);
+		else
 			eeh_handle_special_event();
-		}
 
 		kfree(event);
 	}
@@ -126,8 +116,16 @@ int __eeh_send_failure_event(struct eeh_pe *pe)
 	 * This prevents the PE from being free()ed by a hotplug driver
 	 * while the PE is sitting in the event queue.
 	 */
-	if (pe)
+	if (pe) {
+		/*
+		 * Save the current stack trace so we can dump it from the
+		 * event handler thread.
+		 */
+		pe->trace_entries = stack_trace_save(pe->stack_trace,
+					 ARRAY_SIZE(pe->stack_trace), 0);
+
 		eeh_pe_state_mark(pe, EEH_PE_RECOVERING);
+	}
 
 	/* We may or may not be called in an interrupt context */
 	spin_lock_irqsave(&eeh_eventlist_lock, flags);
-- 
2.21.0

