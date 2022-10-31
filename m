Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DFFD4613065
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Oct 2022 07:38:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N13QS5vsMz3c81
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Oct 2022 17:38:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=inspur.com (client-ip=210.51.26.145; helo=unicom145.biz-email.net; envelope-from=liubo03@inspur.com; receiver=<UNKNOWN>)
X-Greylist: delayed 63 seconds by postgrey-1.36 at boromir; Mon, 31 Oct 2022 17:38:26 AEDT
Received: from unicom145.biz-email.net (unicom145.biz-email.net [210.51.26.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N13Pt2Ktzz2xrk
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Oct 2022 17:38:26 +1100 (AEDT)
Received: from ([60.208.111.195])
        by unicom145.biz-email.net ((D)) with ASMTP (SSL) id ZGQ00011;
        Mon, 31 Oct 2022 14:37:11 +0800
Received: from localhost.localdomain (10.200.104.97) by
 jtjnmail201601.home.langchao.com (10.100.2.1) with Microsoft SMTP Server id
 15.1.2507.12; Mon, 31 Oct 2022 14:37:10 +0800
From: Bo Liu <liubo03@inspur.com>
To: <mahesh@linux.ibm.com>, <oohall@gmail.com>, <mpe@ellerman.id.au>,
	<npiggin@gmail.com>, <christophe.leroy@csgroup.eu>
Subject: [PATCH] powerpc/pseries/eeh: Fix some kernel-doc warnings
Date: Mon, 31 Oct 2022 02:37:06 -0400
Message-ID: <20221031063706.2770-1-liubo03@inspur.com>
X-Mailer: git-send-email 2.18.2
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.200.104.97]
tUid: 20221031143711017e635c1b38ac4e8b26770add1ab356
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Bo Liu <liubo03@inspur.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fixes the following W=1 kernel build warning(s):
  arch/powerpc/platforms/pseries/eeh_pseries.c:163: warning: Function parameter or member 'config_addr' not described in 'pseries_eeh_phb_reset'
  arch/powerpc/platforms/pseries/eeh_pseries.c:163: warning: Excess function parameter 'config_adddr' description in 'pseries_eeh_phb_reset'
  arch/powerpc/platforms/pseries/eeh_pseries.c:198: warning: Function parameter or member 'config_addr' not described in 'pseries_eeh_phb_configure_bridge'
  arch/powerpc/platforms/pseries/eeh_pseries.c:198: warning: Excess function parameter 'config_adddr' description in 'pseries_eeh_phb_configure_bridge'

Signed-off-by: Bo Liu <liubo03@inspur.com>
---
 arch/powerpc/platforms/pseries/eeh_pseries.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/eeh_pseries.c b/arch/powerpc/platforms/pseries/eeh_pseries.c
index 8e40ccac0f44..ea890037843c 100644
--- a/arch/powerpc/platforms/pseries/eeh_pseries.c
+++ b/arch/powerpc/platforms/pseries/eeh_pseries.c
@@ -154,7 +154,7 @@ static int pseries_eeh_get_pe_config_addr(struct pci_dn *pdn)
 /**
  * pseries_eeh_phb_reset - Reset the specified PHB
  * @phb: PCI controller
- * @config_adddr: the associated config address
+ * @config_addr: the associated config address
  * @option: reset option
  *
  * Reset the specified PHB/PE
@@ -188,7 +188,7 @@ static int pseries_eeh_phb_reset(struct pci_controller *phb, int config_addr, in
 /**
  * pseries_eeh_phb_configure_bridge - Configure PCI bridges in the indicated PE
  * @phb: PCI controller
- * @config_adddr: the associated config address
+ * @config_addr: the associated config address
  *
  * The function will be called to reconfigure the bridges included
  * in the specified PE so that the mulfunctional PE would be recovered
-- 
2.27.0

