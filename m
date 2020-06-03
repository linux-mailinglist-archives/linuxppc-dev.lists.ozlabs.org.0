Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF101EC8B1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jun 2020 07:21:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49cHMF2rk7zDqXm
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jun 2020 15:21:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=informatik.wtf (client-ip=131.153.2.43;
 helo=h2.fbrelay.privateemail.com; envelope-from=cmr@informatik.wtf;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=informatik.wtf
Received: from h2.fbrelay.privateemail.com (h2.fbrelay.privateemail.com
 [131.153.2.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49cHH112tSzDqX1
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jun 2020 15:17:48 +1000 (AEST)
Received: from MTA-07-4.privateemail.com (mta-07.privateemail.com
 [198.54.127.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by h1.fbrelay.privateemail.com (Postfix) with ESMTPS id 213078083C
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jun 2020 01:17:46 -0400 (EDT)
Received: from MTA-07.privateemail.com (localhost [127.0.0.1])
 by MTA-07.privateemail.com (Postfix) with ESMTP id EBAF160058;
 Wed,  3 Jun 2020 01:17:36 -0400 (EDT)
Received: from geist.attlocal.net (unknown [10.20.151.239])
 by MTA-07.privateemail.com (Postfix) with ESMTPA id 6DB7560051;
 Wed,  3 Jun 2020 05:17:36 +0000 (UTC)
From: "Christopher M. Riedl" <cmr@informatik.wtf>
To: linuxppc-dev@lists.ozlabs.org,
	kernel-hardening@lists.openwall.com
Subject: [PATCH 4/5] powerpc/lib: Add LKDTM accessor for patching addr
Date: Wed,  3 Jun 2020 00:19:11 -0500
Message-Id: <20200603051912.23296-5-cmr@informatik.wtf>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200603051912.23296-1-cmr@informatik.wtf>
References: <20200603051912.23296-1-cmr@informatik.wtf>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When live patching a STRICT_RWX kernel, a mapping is installed at a
"patching address" with temporary write permissions. Provide a
LKDTM-only accessor function for this address in preparation for a LKDTM
test which attempts to "hijack" this mapping by writing to it from
another CPU.

Signed-off-by: Christopher M. Riedl <cmr@informatik.wtf>
---
 arch/powerpc/lib/code-patching.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index df0765845204..c23453049116 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -52,6 +52,13 @@ int raw_patch_instruction(struct ppc_inst *addr, struct ppc_inst instr)
 static struct mm_struct *patching_mm __ro_after_init;
 static unsigned long patching_addr __ro_after_init;
 
+#ifdef CONFIG_LKDTM
+unsigned long read_cpu_patching_addr(unsigned int cpu)
+{
+	return patching_addr;
+}
+#endif
+
 void __init poking_init(void)
 {
 	spinlock_t *ptl; /* for protecting pte table */
-- 
2.26.2

