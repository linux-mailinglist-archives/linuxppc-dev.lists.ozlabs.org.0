Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 278FD7E9444
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Nov 2023 02:51:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4STC840rrTz3cnZ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Nov 2023 12:51:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nfschina.com (client-ip=42.101.60.195; helo=mail.nfschina.com; envelope-from=zeming@nfschina.com; receiver=lists.ozlabs.org)
Received: from mail.nfschina.com (unknown [42.101.60.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4STC7Z2g65z2xWc
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Nov 2023 12:50:47 +1100 (AEDT)
Received: from localhost.localdomain (unknown [219.141.250.2])
	by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPA id 59BFD60327047;
	Mon, 13 Nov 2023 09:45:35 +0800 (CST)
X-MD-Sfrom: zeming@nfschina.com
X-MD-SrcIP: 219.141.250.2
From: Li zeming <zeming@nfschina.com>
To: fbarrat@linux.ibm.com,
	ajd@linux.ibm.com,
	arnd@arndb.de,
	gregkh@linuxfoundation.org
Subject: [PATCH] misc: ocxl: link: Remove unnecessary (void*) conversions
Date: Mon, 13 Nov 2023 09:45:33 +0800
Message-Id: <20231113014533.11064-1-zeming@nfschina.com>
X-Mailer: git-send-email 2.18.2
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Li zeming <zeming@nfschina.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The link pointer does not need to cast the type.

Signed-off-by: Li zeming <zeming@nfschina.com>
---
 drivers/misc/ocxl/link.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/misc/ocxl/link.c b/drivers/misc/ocxl/link.c
index c06c699c0e7b1..03402203cacdb 100644
--- a/drivers/misc/ocxl/link.c
+++ b/drivers/misc/ocxl/link.c
@@ -188,7 +188,7 @@ static void xsl_fault_handler_bh(struct work_struct *fault_work)
 
 static irqreturn_t xsl_fault_handler(int irq, void *data)
 {
-	struct ocxl_link *link = (struct ocxl_link *) data;
+	struct ocxl_link *link = data;
 	struct spa *spa = link->spa;
 	u64 dsisr, dar, pe_handle;
 	struct pe_data *pe_data;
@@ -483,7 +483,7 @@ static void release_xsl(struct kref *ref)
 
 void ocxl_link_release(struct pci_dev *dev, void *link_handle)
 {
-	struct ocxl_link *link = (struct ocxl_link *) link_handle;
+	struct ocxl_link *link = link_handle;
 
 	mutex_lock(&links_list_lock);
 	kref_put(&link->ref, release_xsl);
@@ -540,7 +540,7 @@ int ocxl_link_add_pe(void *link_handle, int pasid, u32 pidr, u32 tidr,
 		void (*xsl_err_cb)(void *data, u64 addr, u64 dsisr),
 		void *xsl_err_data)
 {
-	struct ocxl_link *link = (struct ocxl_link *) link_handle;
+	struct ocxl_link *link = link_handle;
 	struct spa *spa = link->spa;
 	struct ocxl_process_element *pe;
 	int pe_handle, rc = 0;
@@ -630,7 +630,7 @@ EXPORT_SYMBOL_GPL(ocxl_link_add_pe);
 
 int ocxl_link_update_pe(void *link_handle, int pasid, __u16 tid)
 {
-	struct ocxl_link *link = (struct ocxl_link *) link_handle;
+	struct ocxl_link *link = link_handle;
 	struct spa *spa = link->spa;
 	struct ocxl_process_element *pe;
 	int pe_handle, rc;
@@ -666,7 +666,7 @@ int ocxl_link_update_pe(void *link_handle, int pasid, __u16 tid)
 
 int ocxl_link_remove_pe(void *link_handle, int pasid)
 {
-	struct ocxl_link *link = (struct ocxl_link *) link_handle;
+	struct ocxl_link *link = link_handle;
 	struct spa *spa = link->spa;
 	struct ocxl_process_element *pe;
 	struct pe_data *pe_data;
@@ -752,7 +752,7 @@ EXPORT_SYMBOL_GPL(ocxl_link_remove_pe);
 
 int ocxl_link_irq_alloc(void *link_handle, int *hw_irq)
 {
-	struct ocxl_link *link = (struct ocxl_link *) link_handle;
+	struct ocxl_link *link = link_handle;
 	int irq;
 
 	if (atomic_dec_if_positive(&link->irq_available) < 0)
@@ -771,7 +771,7 @@ EXPORT_SYMBOL_GPL(ocxl_link_irq_alloc);
 
 void ocxl_link_free_irq(void *link_handle, int hw_irq)
 {
-	struct ocxl_link *link = (struct ocxl_link *) link_handle;
+	struct ocxl_link *link = link_handle;
 
 	xive_native_free_irq(hw_irq);
 	atomic_inc(&link->irq_available);
-- 
2.18.2

