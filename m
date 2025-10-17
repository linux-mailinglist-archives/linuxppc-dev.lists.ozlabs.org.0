Return-Path: <linuxppc-dev+bounces-13014-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D5BBE8E3E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Oct 2025 15:36:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cp5S14vCRz3ckk;
	Sat, 18 Oct 2025 00:35:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760708145;
	cv=none; b=nSrPkWzX48E2K+3Qsjj+f+l5avr88b5Wl74QShyUguVGdayV/JesPpk9vIYVrdif6SmDKwwBfZ/5a5KPlwsjAJn169HVHu3YhIHwIvONCqhsUvtQrlB90/5J8auAlscMQDyqGL2BZsAsBOjhnczmeRfdSYPlYB+Vnw93Rv5KOlVyOkIxM1gy9KGs1NuOOon9+Tec2GmPaTh6IGoTUAfrwK35YGxqvnErrKl2frN67uC1+u8cess1I2NHSZadKX7SWNkdUGzfRPzzwoGIL5IEIhIAKXDZn8C/Qxt91shXqVzQy+m+OB8oi63M5cIZvFsvbbSkyqZjJFD4E2o+dpsQpw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760708145; c=relaxed/relaxed;
	bh=gLmu40B15FflQ8FjHekQafQBEbho/i94X6DCNFrXf78=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jt0/Ssj7pDo2oH5/fn6Kpgvj7Bj8hdJiqCNBBS9W/pCKeprmsBFi3Q60Iu8Q05LMQn1ALPaNycPdkv0GIQ1R1J5CT/Jf0sKtyFOzbSUNtJ3RkMglwuc5p2Tc5MG7gncA6ENoynBz2ePiDSMgEoYltSmtksKevrt/q91A8PcFG8JTLbiafVEp0eTecNqA9qc3HH4MCtI+s6SZnzI2KMwAv7EZ/0kWOif24llreXlMJ12wETUJEAO+SKKdQ+kt7wfD5Xgj8ARbD25hpTsp0uR1gKCSjb3IJRaD552QF62TuBBOK9nrUL9z9cHA1wj7/k0nXMyuXkPRIUdsVQCPlAbI3w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ww8BkUTD; dkim-atps=neutral; spf=pass (client-ip=198.175.65.16; helo=mgamail.intel.com; envelope-from=fabio.m.de.francesco@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ww8BkUTD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.16; helo=mgamail.intel.com; envelope-from=fabio.m.de.francesco@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cp5S05CgXz3ckc
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Oct 2025 00:35:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760708144; x=1792244144;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wEV3YwZtRuTemBv1zQt7Cmx6AAG3aqi5wz2vKBh//nc=;
  b=Ww8BkUTDv+67c/pEv55DIFoVyOT9g6ZXMXxc7FETRJZ/Cvl28A2DleKY
   dEi9RVWJvJgDCPErVgIfoFkMiLeE1mFEXM3PvQKN+7zispFGYXERuExDx
   1kaMLSflz566fApCcw3qluDE7XcKLZwkhpbO4JpCAj8HgXu8QJGRZkXxV
   r2mUqulzVf0xr3VF9Jet7khp6v+9Cg3t4Q6by3foTpa3S0E6GgPRQ9zDi
   IOL9Casibbz4XDMsNVxWb+guXWq/I2vNGSRvhtfV4QDnHJlxD23ewIt1K
   SPNcnY2CHCVxOf1ZT0Mvn94hewIlUeseRkZGtytRPSoHTYOQ8qDHC271B
   A==;
X-CSE-ConnectionGUID: QiYyhQL0TZmFNjkiwwpp0g==
X-CSE-MsgGUID: XVboBdADTZuJqh5ii+CWaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11585"; a="63065042"
X-IronPort-AV: E=Sophos;i="6.19,236,1754982000"; 
   d="scan'208";a="63065042"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2025 06:35:13 -0700
X-CSE-ConnectionGUID: K1JgY/+DS+66wNORjTzzJQ==
X-CSE-MsgGUID: Ts7J9p6SSUmrc+mIW1x4lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,236,1754982000"; 
   d="scan'208";a="181925252"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO fdefranc-mobl3.intel.com) ([10.245.246.215])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2025 06:35:00 -0700
From: "Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>
To: linux-cxl@vger.kernel.org
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	Borislav Petkov <bp@alien8.de>,
	Hanjun Guo <guohanjun@huawei.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shuai Xue <xueshuai@linux.alibaba.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Xiaofei Tan <tanxiaofei@huawei.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Arnd Bergmann <arnd@arndb.de>,
	"Fabio M . De Francesco" <fabio.m.de.francesco@linux.intel.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>,
	Guo Weikang <guoweikang.kernel@gmail.com>,
	Xin Li <xin@zytor.com>,
	Will Deacon <will@kernel.org>,
	Huang Yiwei <quic_hyiwei@quicinc.com>,
	Gavin Shan <gshan@redhat.com>,
	Smita Koralahalli <Smita.KoralahalliChannabasappa@amd.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Li Ming <ming.li@zohomail.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Karolina Stolarek <karolina.stolarek@oracle.com>,
	Jon Pan-Doh <pandoh@google.com>,
	Lukas Wunner <lukas@wunner.de>,
	Shiju Jose <shiju.jose@huawei.com>,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-pci@vger.kernel.org
Subject: [PATCH 4/6 v5] acpi/ghes: Add helper for CPER CXL protocol errors checks
Date: Fri, 17 Oct 2025 15:30:49 +0200
Message-ID: <20251017133357.1150982-5-fabio.m.de.francesco@linux.intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251017133357.1150982-1-fabio.m.de.francesco@linux.intel.com>
References: <20251017133357.1150982-1-fabio.m.de.francesco@linux.intel.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Move the CPER CXL protocol errors validity checks out of
cxl_cper_post_prot_err() to cxl_cper_sec_prot_err_valid() and check the
serial number only for CXL agents that are CXL devices (UEFI v2.10,
Appendix N.2.13).

Signed-off-by: Fabio M. De Francesco <fabio.m.de.francesco@linux.intel.com>
---
 drivers/acpi/apei/ghes.c | 32 ++++++++++++++++++++++----------
 include/cxl/event.h      | 10 ++++++++++
 2 files changed, 32 insertions(+), 10 deletions(-)

diff --git a/drivers/acpi/apei/ghes.c b/drivers/acpi/apei/ghes.c
index d6fe5f020e96e..e69ae864f43d3 100644
--- a/drivers/acpi/apei/ghes.c
+++ b/drivers/acpi/apei/ghes.c
@@ -706,30 +706,42 @@ static DEFINE_KFIFO(cxl_cper_prot_err_fifo, struct cxl_cper_prot_err_work_data,
 static DEFINE_SPINLOCK(cxl_cper_prot_err_work_lock);
 struct work_struct *cxl_cper_prot_err_work;
 
-static void cxl_cper_post_prot_err(struct cxl_cper_sec_prot_err *prot_err,
-				   int severity)
+int cxl_cper_sec_prot_err_valid(struct cxl_cper_sec_prot_err *prot_err)
 {
-	struct cxl_cper_prot_err_work_data wd;
-	u8 *dvsec_start, *cap_start;
-
 	if (!(prot_err->valid_bits & PROT_ERR_VALID_AGENT_ADDRESS)) {
 		pr_err_ratelimited("CXL CPER invalid agent type\n");
-		return;
+		return -EINVAL;
 	}
 
 	if (!(prot_err->valid_bits & PROT_ERR_VALID_ERROR_LOG)) {
 		pr_err_ratelimited("CXL CPER invalid protocol error log\n");
-		return;
+		return -EINVAL;
 	}
 
 	if (prot_err->err_len != sizeof(struct cxl_ras_capability_regs)) {
 		pr_err_ratelimited("CXL CPER invalid RAS Cap size (%u)\n",
 				   prot_err->err_len);
-		return;
+		return -EINVAL;
 	}
 
-	if (!(prot_err->valid_bits & PROT_ERR_VALID_SERIAL_NUMBER))
-		pr_warn(FW_WARN "CXL CPER no device serial number\n");
+	if ((prot_err->agent_type == RCD || prot_err->agent_type == DEVICE ||
+	     prot_err->agent_type == LD || prot_err->agent_type == FMLD) &&
+	    !(prot_err->valid_bits & PROT_ERR_VALID_SERIAL_NUMBER))
+		pr_warn_ratelimited(FW_WARN
+				    "CXL CPER no device serial number\n");
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(cxl_cper_sec_prot_err_valid);
+
+static void cxl_cper_post_prot_err(struct cxl_cper_sec_prot_err *prot_err,
+				   int severity)
+{
+	struct cxl_cper_prot_err_work_data wd;
+	u8 *dvsec_start, *cap_start;
+
+	if (cxl_cper_sec_prot_err_valid(prot_err))
+		return;
 
 	guard(spinlock_irqsave)(&cxl_cper_prot_err_work_lock);
 
diff --git a/include/cxl/event.h b/include/cxl/event.h
index 6fd90f9cc2034..e1deb66c2197e 100644
--- a/include/cxl/event.h
+++ b/include/cxl/event.h
@@ -320,4 +320,14 @@ static inline int cxl_cper_prot_err_kfifo_get(struct cxl_cper_prot_err_work_data
 }
 #endif
 
+#ifdef CONFIG_ACPI_APEI_PCIEAER
+int cxl_cper_sec_prot_err_valid(struct cxl_cper_sec_prot_err *prot_err);
+#else
+static inline int
+cxl_cper_sec_prot_err_valid(struct cxl_cper_sec_prot_err *prot_err)
+{
+	return -EINVAL;
+}
+#endif
+
 #endif /* _LINUX_CXL_EVENT_H */
-- 
2.51.0


