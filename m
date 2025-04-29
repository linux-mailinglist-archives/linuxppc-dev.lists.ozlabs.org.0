Return-Path: <linuxppc-dev+bounces-8160-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B11AA14DF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Apr 2025 19:21:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zn6YP47CHz30hF;
	Wed, 30 Apr 2025 03:21:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745947289;
	cv=none; b=iqIWOOEsbP4x7ShzSjqzVEoiAZm3HHnGqFBR8EEAP/6fnlMBygHFMEZG1oOV40znyE8edr1zxpttmfC4oKLfAj6W+i9tVAzXhSY384+ubm43BKvEeq0CQ+PpL1zeawFm635mNQiDTH1eDBFYdk9hUpHkHqchmDu8b6MYgHI+Vcj3Uwm7ArK4Ur7Mf5tJK0dSpVbW0C40T0N8ZgivzWpy02Tv6mbatksaiwZIX6BAHIEb/nsOjbYA+Yl5Lwc066vshojpulNG5ZugFb4qs38aMIoGBbafTCG44/SoP8xWA68gKqU0znTmznv9uK99fxKAQIkGClfKtkSGvWY6O5EPRg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745947289; c=relaxed/relaxed;
	bh=sAy0R+u0YNb6bkXNshMGsMEzcX6ClfyapXHJAate0io=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L40KpGSK59gJpAFxNKbUxnuvkdYlWC7FKottEDQK5hpFN8sw6u6/9YeXyEHcQFQUGCoz00/jHLCPFej7lu9JNWXActwO2cibXibh8wb+RdNdcC9xmA1B9+gV6PFR/XIiymZfJz85xd+Zs7HILWXP8aqNXEu80S2jlMFJo88R7Ni5qG1R71jRU5e3pyxfMR04IICGdmBacNR2zfVeDdXytZEvMsqIYfmfoO0dztPJ0fddxSa8o9m7jy5n6a2+0qdAv9Qx1qBhrlNpJp5gTtq5VMjE/S9IOvWzCgr9U9pT/kgg6idRNWBvDqo5jVC8H9lR2vhpAobd41CZWvzj065GGg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FNsYLFZZ; dkim-atps=neutral; spf=none (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=fabio.m.de.francesco@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FNsYLFZZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=fabio.m.de.francesco@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zn6YN4tLkz30Vl
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Apr 2025 03:21:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745947289; x=1777483289;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jXYC4qe83QMGvpN4IuiBaOllJp2/Rn6mzBWJF/nv1hc=;
  b=FNsYLFZZI27F8Dzbcl7Q3JHjtUcYEjs5oQc5dd0nayalysX46siQmfG5
   TafjOKJ4lsxIfy6TAE6JwlzAnTMbecyEoC9zYeIHEU5WFNH8N/vNa9Zc7
   J6XytXjNz1d4wVqYd50P/4cUtFx7ldm6MABev9yk7wokBJsYDa5wjK57T
   jenpz4HFz9preSXpzsQymnoVbPSKMxc6omSXOVQ+WNpEfU4H5Drlp30jU
   0u8uDYMZpf2cMbavoybLC8Fad3rulbNWmdRiXNay2pLz0tqPpXLrIkpB9
   xEDEBuiWBsDDZbljheNcQYC2o3ZtFvzy8TAGRxrXwHHMqf0Gd5hAFZINL
   A==;
X-CSE-ConnectionGUID: K/mOxdTERTGRl81djhrzhA==
X-CSE-MsgGUID: vMwN+HK2R8ShrDNTYIQWUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="64996945"
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="64996945"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 10:21:28 -0700
X-CSE-ConnectionGUID: zknYB+4jScW5iqrF3wMtuA==
X-CSE-MsgGUID: uop2XdxpR66xI/cEmlvLyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="139073312"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO fdefranc-mobl3.intel.com) ([10.245.246.45])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 10:21:20 -0700
From: "Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
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
	Tony Luck <tony.luck@intel.com>,
	Borislav Petkov <bp@alien8.de>,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-pci@vger.kernel.org,
	linux-edac@vger.kernel.org
Cc: "Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>
Subject: [PATCH 1/4 v2] ACPI: extlog: Trace CPER Non-standard Section Body
Date: Tue, 29 Apr 2025 19:21:06 +0200
Message-ID: <20250429172109.3199192-2-fabio.m.de.francesco@linux.intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250429172109.3199192-1-fabio.m.de.francesco@linux.intel.com>
References: <20250429172109.3199192-1-fabio.m.de.francesco@linux.intel.com>
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
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

ghes_do_proc() has a catch-all for unknown or unhandled CPER formats
(UEFI v2.10 Appendix N 2.3), extlog_print() does not. This gap was
noticed by a RAS test that injected CXL protocol errors which were
notified to extlog_print() via the IOMCA (I/O Machine Check
Architecture) mechanism. Bring parity to the extlog_print() path by
including a similar log_non_standard_event().

Cc: Dan Williams <dan.j.williams@intel.com>
Reviewed-by: Dan Williams <dan.j.williams@intel.com>
Signed-off-by: Fabio M. De Francesco <fabio.m.de.francesco@linux.intel.com>
---
 drivers/acpi/acpi_extlog.c | 6 ++++++
 drivers/ras/ras.c          | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/acpi/acpi_extlog.c b/drivers/acpi/acpi_extlog.c
index f7fb7205028d..caca6ccd6e99 100644
--- a/drivers/acpi/acpi_extlog.c
+++ b/drivers/acpi/acpi_extlog.c
@@ -182,6 +182,12 @@ static int extlog_print(struct notifier_block *nb, unsigned long val,
 			if (gdata->error_data_length >= sizeof(*mem))
 				trace_extlog_mem_event(mem, err_seq, fru_id, fru_text,
 						       (u8)gdata->error_severity);
+		} else {
+			void *err = acpi_hest_get_payload(gdata);
+
+			log_non_standard_event(sec_type, fru_id, fru_text,
+					       gdata->error_severity, err,
+					       gdata->error_data_length);
 		}
 	}
 
diff --git a/drivers/ras/ras.c b/drivers/ras/ras.c
index a6e4792a1b2e..ac0e132ccc3e 100644
--- a/drivers/ras/ras.c
+++ b/drivers/ras/ras.c
@@ -51,6 +51,7 @@ void log_non_standard_event(const guid_t *sec_type, const guid_t *fru_id,
 {
 	trace_non_standard_event(sec_type, fru_id, fru_text, sev, err, len);
 }
+EXPORT_SYMBOL_GPL(log_non_standard_event);
 
 void log_arm_hw_error(struct cper_sec_proc_arm *err)
 {
-- 
2.48.1


