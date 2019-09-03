Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B86BA6678
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 12:21:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46N2zh0HbszDqbt
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 20:21:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZxHGGFMa"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46N2t80tjqzDqQK
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2019 20:16:31 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id y22so4856527pfr.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Sep 2019 03:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AbOYweJolmZcc1tLqVQOyuvVnN0aVR9HLvij1Z+lYUs=;
 b=ZxHGGFMaOpVVjt13nw3KZNF1X7StzdMvt1GhXnylI3WvWRaGH4xavdHEkMYm2Dyo+P
 ExobyY3Wf/urTXR3TPI+gQnO+SUXUfDkv4VZguZjPbmFMWHN2gzWVajQGv9lWRQ6sM/e
 0OluELEmRec5LcDLcNfK0LWITCsPFaStufIg5GCusEW/ZNFyI/Hzh+ns9B9uaCVSgty1
 uRsv3LJXWcq8GDOVrVqQjRw0dIjbOW6EVtUPXMo+bF4mqWtG2/HlY7nIBhWLECySyRCr
 /XGSyTeCArprmXq4jYptLhg8qF+dK1qjroCZ00GCQSo48dmSkoJqgybMLtp4u1K4RYdu
 yIow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AbOYweJolmZcc1tLqVQOyuvVnN0aVR9HLvij1Z+lYUs=;
 b=j3mj/QhUI2V16l3mzru/w/E7AcgYOo3cHEUPIxin/G5nsgjlT+xhd2LG1UM+gkc2Ef
 vDphoMzQCD41TM87FYtJ4RU2gQyL8OkibHiOQ5tP7W8V6kB6cQVHhk5UPyAhCKbr++ue
 sK65fENRhnjQA9nxVNmSUw9rp+8Ku50RP+ZjkeP1WbKtrpTYzz4smJEW8TdcrDueWiE2
 2rvPWL8Zt97QTSCxo3xIXX41YSdBfD2rubBIWClLneJI47PXWsj+KflaHzSTqAwBJhU8
 aL4yHoeD+KShE7iPLasbpLFbfSQH8bdEcNsqQ8eM+REwlmI66TGsPtwMKU4LhAbydewS
 NYpg==
X-Gm-Message-State: APjAAAXj1wU9YoaUWIepLKlb4lELAoVtoNxvOeeElNE75om/MEW74gtY
 qDKoaG54sLUBAtcEw/DfxMe3XJgn
X-Google-Smtp-Source: APXvYqxEXrUyE5tdH/KDFnu2EXjszc5MjuWsaCYG/kAcD5ljzSLGtjm9yAo65WMbjO2IZuPA44e9Tg==
X-Received: by 2002:a17:90a:f0c7:: with SMTP id
 fa7mr18281517pjb.115.1567505789235; 
 Tue, 03 Sep 2019 03:16:29 -0700 (PDT)
Received: from wafer.ozlabs.ibm.com.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id e24sm19676701pgk.21.2019.09.03.03.16.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2019 03:16:28 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 01/14] powerpc/eeh: Clean up EEH PEs after recovery finishes
Date: Tue,  3 Sep 2019 20:15:52 +1000
Message-Id: <20190903101605.2890-2-oohall@gmail.com>
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

When the last device in an eeh_pe is removed the eeh_pe structure itself
(and any empty parents) are freed since they are no longer needed. This
results in a crash when a hotplug driver is involved since the following
may occur:

1. Device is suprise removed.
2. Driver performs an MMIO, which fails and queues and eeh_event.
3. Hotplug driver receives a hotplug interrupt and removes any
   pci_devs that were under the slot.
4. pci_dev is torn down and the eeh_pe is freed.
5. The EEH event handler thread processes the eeh_event and crashes
   since the eeh_pe pointer in the eeh_event structure is no
   longer valid.

Crashing is generally considered poor form. Instead of doing that use
the fact PEs are marked as EEH_PE_INVALID to keep them around until the
end of the recovery cycle, at which point we can safely prune any empty
PEs.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
Sam Bobroff is working on implementing proper refcounting for EEH PEs,
but that's not going to be ready for a while and this is less broken
than what we have now.
---
 arch/powerpc/kernel/eeh_driver.c | 36 ++++++++++++++++++++++++++++++--
 arch/powerpc/kernel/eeh_event.c  |  8 +++++++
 arch/powerpc/kernel/eeh_pe.c     | 23 +++++++++++++++++++-
 3 files changed, 64 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/eeh_driver.c b/arch/powerpc/kernel/eeh_driver.c
index a31cd32c4ce9..75266156943f 100644
--- a/arch/powerpc/kernel/eeh_driver.c
+++ b/arch/powerpc/kernel/eeh_driver.c
@@ -734,6 +734,33 @@ static int eeh_reset_device(struct eeh_pe *pe, struct pci_bus *bus,
  */
 #define MAX_WAIT_FOR_RECOVERY 300
 
+
+/* Walks the PE tree after processing an event to remove any stale PEs.
+ *
+ * NB: This needs to be recursive to ensure the leaf PEs get removed
+ * before their parents do. Although this is possible to do recursively
+ * we don't since this is easier to read and we need to garantee
+ * the leaf nodes will be handled first.
+ */
+static void eeh_pe_cleanup(struct eeh_pe *pe)
+{
+	struct eeh_pe *child_pe, *tmp;
+
+	list_for_each_entry_safe(child_pe, tmp, &pe->child_list, child)
+		eeh_pe_cleanup(child_pe);
+
+	if (pe->state & EEH_PE_KEEP)
+		return;
+
+	if (!(pe->state & EEH_PE_INVALID))
+		return;
+
+	if (list_empty(&pe->edevs) && list_empty(&pe->child_list)) {
+		list_del(&pe->child);
+		kfree(pe);
+	}
+}
+
 /**
  * eeh_handle_normal_event - Handle EEH events on a specific PE
  * @pe: EEH PE - which should not be used after we return, as it may
@@ -772,8 +799,6 @@ void eeh_handle_normal_event(struct eeh_pe *pe)
 		return;
 	}
 
-	eeh_pe_state_mark(pe, EEH_PE_RECOVERING);
-
 	eeh_pe_update_time_stamp(pe);
 	pe->freeze_count++;
 	if (pe->freeze_count > eeh_max_freezes) {
@@ -963,6 +988,12 @@ void eeh_handle_normal_event(struct eeh_pe *pe)
 			return;
 		}
 	}
+
+	/*
+	 * Clean up any PEs without devices. While marked as EEH_PE_RECOVERYING
+	 * we don't want to modify the PE tree structure so we do it here.
+	 */
+	eeh_pe_cleanup(pe);
 	eeh_pe_state_clear(pe, EEH_PE_RECOVERING, true);
 }
 
@@ -1035,6 +1066,7 @@ void eeh_handle_special_event(void)
 		 */
 		if (rc == EEH_NEXT_ERR_FROZEN_PE ||
 		    rc == EEH_NEXT_ERR_FENCED_PHB) {
+			eeh_pe_state_mark(pe, EEH_PE_RECOVERING);
 			eeh_handle_normal_event(pe);
 		} else {
 			pci_lock_rescan_remove();
diff --git a/arch/powerpc/kernel/eeh_event.c b/arch/powerpc/kernel/eeh_event.c
index 64cfbe41174b..e36653e5f76b 100644
--- a/arch/powerpc/kernel/eeh_event.c
+++ b/arch/powerpc/kernel/eeh_event.c
@@ -121,6 +121,14 @@ int __eeh_send_failure_event(struct eeh_pe *pe)
 	}
 	event->pe = pe;
 
+	/*
+	 * Mark the PE as recovering before inserting it in the queue.
+	 * This prevents the PE from being free()ed by a hotplug driver
+	 * while the PE is sitting in the event queue.
+	 */
+	if (pe)
+		eeh_pe_state_mark(pe, EEH_PE_RECOVERING);
+
 	/* We may or may not be called in an interrupt context */
 	spin_lock_irqsave(&eeh_eventlist_lock, flags);
 	list_add(&event->list, &eeh_eventlist);
diff --git a/arch/powerpc/kernel/eeh_pe.c b/arch/powerpc/kernel/eeh_pe.c
index 1a6254bcf056..177852e39a25 100644
--- a/arch/powerpc/kernel/eeh_pe.c
+++ b/arch/powerpc/kernel/eeh_pe.c
@@ -470,6 +470,7 @@ int eeh_add_to_parent_pe(struct eeh_dev *edev)
 int eeh_rmv_from_parent_pe(struct eeh_dev *edev)
 {
 	struct eeh_pe *pe, *parent, *child;
+	bool keep, recover;
 	int cnt;
 
 	pe = eeh_dev_to_pe(edev);
@@ -490,10 +491,21 @@ int eeh_rmv_from_parent_pe(struct eeh_dev *edev)
 	 */
 	while (1) {
 		parent = pe->parent;
+
+		/* PHB PEs should never be removed */
 		if (pe->type & EEH_PE_PHB)
 			break;
 
-		if (!(pe->state & EEH_PE_KEEP)) {
+		/*
+		 * XXX: KEEP is set while resetting a PE. I don't think it's
+		 * ever set without RECOVERING also being set. I could
+		 * be wrong though so catch that with a WARN.
+		 */
+		keep = !!(pe->state & EEH_PE_KEEP);
+		recover = !!(pe->state & EEH_PE_RECOVERING);
+		WARN_ON(keep && !recover);
+
+		if (!keep && !recover) {
 			if (list_empty(&pe->edevs) &&
 			    list_empty(&pe->child_list)) {
 				list_del(&pe->child);
@@ -502,6 +514,15 @@ int eeh_rmv_from_parent_pe(struct eeh_dev *edev)
 				break;
 			}
 		} else {
+			/*
+			 * Mark the PE as invalid. At the end of the recovery
+			 * process any invalid PEs will be garbage collected.
+			 *
+			 * We need to delay the free()ing of them since we can
+			 * remove edev's while traversing the PE tree which
+			 * might trigger the removal of a PE and we can't
+			 * deal with that (yet).
+			 */
 			if (list_empty(&pe->edevs)) {
 				cnt = 0;
 				list_for_each_entry(child, &pe->child_list, child) {
-- 
2.21.0

