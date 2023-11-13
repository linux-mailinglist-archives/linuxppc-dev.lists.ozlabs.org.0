Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADEF27E9405
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Nov 2023 02:22:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4STBVx4fJvz3cgg
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Nov 2023 12:22:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nfschina.com (client-ip=42.101.60.195; helo=mail.nfschina.com; envelope-from=zeming@nfschina.com; receiver=lists.ozlabs.org)
Received: from mail.nfschina.com (unknown [42.101.60.195])
	by lists.ozlabs.org (Postfix) with SMTP id 4STBVT58Gkz2ytV
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Nov 2023 12:22:09 +1100 (AEDT)
Received: from localhost.localdomain (unknown [219.141.250.2])
	by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPA id 5E9A86031E5B9;
	Mon, 13 Nov 2023 09:22:04 +0800 (CST)
X-MD-Sfrom: zeming@nfschina.com
X-MD-SrcIP: 219.141.250.2
From: Li zeming <zeming@nfschina.com>
To: fbarrat@linux.ibm.com,
	ajd@linux.ibm.com,
	arnd@arndb.de,
	gregkh@linuxfoundation.org
Subject: [PATCH] misc: ocxl: afu_irq: Remove unnecessary (void*) conversions
Date: Mon, 13 Nov 2023 09:22:02 +0800
Message-Id: <20231113012202.7887-1-zeming@nfschina.com>
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

The irq pointer does not need to cast the type.

Signed-off-by: Li zeming <zeming@nfschina.com>
---
 drivers/misc/ocxl/afu_irq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/ocxl/afu_irq.c b/drivers/misc/ocxl/afu_irq.c
index a06920b7e049a..36f7379b8e2de 100644
--- a/drivers/misc/ocxl/afu_irq.c
+++ b/drivers/misc/ocxl/afu_irq.c
@@ -57,7 +57,7 @@ EXPORT_SYMBOL_GPL(ocxl_irq_set_handler);
 
 static irqreturn_t afu_irq_handler(int virq, void *data)
 {
-	struct afu_irq *irq = (struct afu_irq *) data;
+	struct afu_irq *irq = data;
 
 	trace_ocxl_afu_irq_receive(virq);
 
-- 
2.18.2

