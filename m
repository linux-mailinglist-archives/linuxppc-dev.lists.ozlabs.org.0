Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A322FD152
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jan 2021 14:32:17 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DLRJs1NgjzDr1f
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jan 2021 00:32:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DLRDv3VtHzDqDq
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Jan 2021 00:28:47 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F3B33AAAE;
 Wed, 20 Jan 2021 13:28:43 +0000 (UTC)
From: Michal Suchanek <msuchanek@suse.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc: Fix build error in paravirt.h
Date: Wed, 20 Jan 2021 14:28:38 +0100
Message-Id: <20210120132838.15589-1-msuchanek@suse.de>
X-Mailer: git-send-email 2.26.2
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
Cc: Juergen Gross <jgross@suse.com>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>, Deep Shah <sdeep@vmware.com>,
 "VMware, Inc." <pv-drivers@vmware.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Paul Mackerras <paulus@samba.org>,
 Waiman Long <longman@redhat.com>, Michal Suchanek <msuchanek@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

./arch/powerpc/include/asm/paravirt.h:83:44: error: implicit declaration
of function 'smp_processor_id'; did you mean 'raw_smp_processor_id'?

smp_processor_id is defined in linux/smp.h but it is not included.

The build error happens only when the patch is applied to 5.3 kernel but
it only works by chance in mainline.

Fixes: ca3f969dcb11 ("powerpc/paravirt: Use is_kvm_guest() in vcpu_is_preempted()")
Signed-off-by: Michal Suchanek <msuchanek@suse.de>
---
 arch/powerpc/include/asm/paravirt.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/include/asm/paravirt.h b/arch/powerpc/include/asm/paravirt.h
index edc08f04aef7..5d1726bb28e7 100644
--- a/arch/powerpc/include/asm/paravirt.h
+++ b/arch/powerpc/include/asm/paravirt.h
@@ -10,6 +10,7 @@
 #endif
 
 #ifdef CONFIG_PPC_SPLPAR
+#include <linux/smp.h>
 #include <asm/kvm_guest.h>
 #include <asm/cputhreads.h>
 
-- 
2.26.2

