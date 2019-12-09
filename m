Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B59D211764B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Dec 2019 20:51:13 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Wv2Q5b8LzDqJT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Dec 2019 06:51:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=deltatee.com (client-ip=207.54.116.67; helo=ale.deltatee.com;
 envelope-from=gunthorp@deltatee.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=deltatee.com
Received: from ale.deltatee.com (ale.deltatee.com [207.54.116.67])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47WtrV3lf4zDqQP
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Dec 2019 06:42:34 +1100 (AEDT)
Received: from cgy1-donard.priv.deltatee.com ([172.16.1.31])
 by ale.deltatee.com with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <gunthorp@deltatee.com>)
 id 1ieOTk-00025m-RO; Mon, 09 Dec 2019 12:13:59 -0700
Received: from gunthorp by cgy1-donard.priv.deltatee.com with local (Exim 4.92)
 (envelope-from <gunthorp@deltatee.com>)
 id 1ieOTd-0001Mj-99; Mon, 09 Dec 2019 12:13:49 -0700
From: Logan Gunthorpe <logang@deltatee.com>
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-ia64@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-mm@kvack.org,
 Christoph Hellwig <hch@lst.de>, Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>
Date: Mon,  9 Dec 2019 12:13:42 -0700
Message-Id: <20191209191346.5197-3-logang@deltatee.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191209191346.5197-1-logang@deltatee.com>
References: <20191209191346.5197-1-logang@deltatee.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 172.16.1.31
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-mm@kvack.org, hch@lst.de, dan.j.williams@intel.com,
 akpm@linux-foundation.org, catalin.marinas@arm.com, benh@kernel.crashing.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, peterz@infradead.org, logang@deltatee.com,
 hpa@zytor.com, will@kernel.org, luto@kernel.org, x86@kernel.org
X-SA-Exim-Mail-From: gunthorp@deltatee.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on ale.deltatee.com
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=5.0 tests=ALL_TRUSTED,BAYES_00,
 MYRULES_NO_TEXT autolearn=no autolearn_force=no version=3.4.2
Subject: [PATCH 2/6] x86/mm: Introduce _set_memory_prot()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
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
Cc: x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Logan Gunthorpe <logang@deltatee.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

For use in the 32bit arch_add_memory() to set the pgprot type of the
memory to add.

Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: x86@kernel.org
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
---
 arch/x86/include/asm/set_memory.h | 1 +
 arch/x86/mm/pageattr.c            | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/arch/x86/include/asm/set_memory.h b/arch/x86/include/asm/set_memory.h
index 2ee8e469dcf5..d728c2f3ad96 100644
--- a/arch/x86/include/asm/set_memory.h
+++ b/arch/x86/include/asm/set_memory.h
@@ -34,6 +34,7 @@
  * The caller is required to take care of these.
  */
 
+int _set_memory_prot(unsigned long addr, int numpages, pgprot_t prot);
 int _set_memory_uc(unsigned long addr, int numpages);
 int _set_memory_wc(unsigned long addr, int numpages);
 int _set_memory_wt(unsigned long addr, int numpages);
diff --git a/arch/x86/mm/pageattr.c b/arch/x86/mm/pageattr.c
index 0d09cc5aad61..024e3ddf494d 100644
--- a/arch/x86/mm/pageattr.c
+++ b/arch/x86/mm/pageattr.c
@@ -1781,6 +1781,13 @@ static inline int cpa_clear_pages_array(struct page **pages, int numpages,
 		CPA_PAGES_ARRAY, pages);
 }
 
+int _set_memory_prot(unsigned long addr, int numpages, pgprot_t prot)
+{
+	return change_page_attr_set_clr(&addr, numpages, prot,
+					__pgprot(~pgprot_val(prot)), 0, 0,
+					NULL);
+}
+
 int _set_memory_uc(unsigned long addr, int numpages)
 {
 	/*
-- 
2.20.1

