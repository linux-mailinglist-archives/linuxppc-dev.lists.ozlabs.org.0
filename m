Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EFD6418DFF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Sep 2021 05:42:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HHpPB6cxFz2yYl
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Sep 2021 13:42:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=inspur.com (client-ip=210.51.26.146;
 helo=unicom146.biz-email.net; envelope-from=songkai01@inspur.com;
 receiver=<UNKNOWN>)
X-Greylist: delayed 370 seconds by postgrey-1.36 at boromir;
 Mon, 27 Sep 2021 12:41:58 AEST
Received: from unicom146.biz-email.net (unicom146.biz-email.net
 [210.51.26.146])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HHn3B2YVKz2xY9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Sep 2021 12:41:54 +1000 (AEST)
Received: from ([60.208.111.195])
 by unicom146.biz-email.net ((LNX1044)) with ASMTP (SSL) id UBK00128;
 Mon, 27 Sep 2021 10:35:28 +0800
Received: from localhost.localdomain (10.200.104.119) by
 jtjnmail201608.home.langchao.com (10.100.2.8) with Microsoft SMTP Server id
 15.1.2308.14; Mon, 27 Sep 2021 10:35:09 +0800
From: Kai Song <songkai01@inspur.com>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc/eeh:Fix some mistakes in comments
Date: Mon, 27 Sep 2021 10:35:07 +0800
Message-ID: <20210927023507.32564-1-songkai01@inspur.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.200.104.119]
tUid: 20219271035284565ae0be1f099392af88d8d14853da9
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
X-Mailman-Approved-At: Mon, 27 Sep 2021 13:42:17 +1000
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
Cc: Kai Song <songkai01@inspur.com>, linux-kernel@vger.kernel.org,
 oohall@gmail.com, paulus@samba.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Get rid of warning:
arch/powerpc/kernel/eeh.c:774: warning: expecting prototype for eeh_set_pe_freset(). Prototype was for eeh_set_dev_freset() instead

Signed-off-by: Kai Song <songkai01@inspur.com>
---
 arch/powerpc/kernel/eeh.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
index e9b597ed423c..4cd4acb049ec 100644
--- a/arch/powerpc/kernel/eeh.c
+++ b/arch/powerpc/kernel/eeh.c
@@ -761,8 +761,8 @@ int pcibios_set_pcie_reset_state(struct pci_dev *dev, enum pcie_reset_state stat
 }
 
 /**
- * eeh_set_pe_freset - Check the required reset for the indicated device
- * @data: EEH device
+ * eeh_set_dev_freset - Check the required reset for the indicated device
+ * @edev: EEH device
  * @flag: return value
  *
  * Each device might have its preferred reset type: fundamental or
-- 
2.27.0

