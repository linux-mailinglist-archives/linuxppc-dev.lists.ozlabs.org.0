Return-Path: <linuxppc-dev+bounces-13761-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C359BC329E6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 04 Nov 2025 19:25:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d1H1d0mcyz3bt7;
	Wed,  5 Nov 2025 05:25:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762280709;
	cv=none; b=g1nkPF5LTqsrvsyrisi60bcJSkjwWDXa92oAyLufo40s0nsS4F4Uk0lS4Dd+Q6d2lJxy3+crB8DixCAePwmMByWf8nQeqiMxw7WvmUOkV5bBWtkL03bsZpffeL8kRzWXIyqC2smYefTMa4hCkHqg9X3RNsc1NWjL3u0vWonoAtG1FK6Hp3r3P72RcP/KP3Ul/rwyzZfBLjCBt7UP0nNoJg9oedLRaetrPBZrdahAVzVYzIB20vQl0iP2zqtIRxWY53bSlaPvSmLoaK4cU46JIecCFOe7zHTV45KyfVp7PGuC4/jaAthLCHSsvgvA919Er6KATVumKbbmuBYsgFgBNA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762280709; c=relaxed/relaxed;
	bh=hjsaofygbZi8z6jUsooof36J6RgFMAkGWqP4FhZ3M64=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fBSme/Tj70++Txldni6QMOFxBJHlCSGzq3UrZv/Xtsoaba4FntZtVznzmW3cfGmlFdVqGbNgkb3Z6PIPl30eVmWTVlLuFZ0YW1sPh7ESsPro9npBM+bX1CMxAEW/oWUls1dlIOlgAvQ5Qi1DMRcOSt5x722bglULNwNVu7GzWH4ILZmt/k2c9kgJ9CQw6crBnTumlGCfXNysSb4oQpxDXj1UqBOug9Pr1TkKPp/Q7sDtcaz0/CFwxVYfz9/ApURYmSo18EciAjra8D3QBEIfoDQbjzpNrwLNtln4XRrcsnF87GKe8YzMxm7EVoxCFCP+pgAR6bGLIIWz1PH3jY9caQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MqWvjSqj; dkim-atps=neutral; spf=pass (client-ip=192.198.163.13; helo=mgamail.intel.com; envelope-from=fabio.m.de.francesco@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MqWvjSqj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.13; helo=mgamail.intel.com; envelope-from=fabio.m.de.francesco@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d1H1c1XpYz2yr9
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Nov 2025 05:25:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762280708; x=1793816708;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JIu0H882zeEEwASgSxIs/RNeqglbdddbmIWfUmz8pZM=;
  b=MqWvjSqjW69OdNtiNwsxKdXAaGoPYLyhfP8BGkEC1oieYPXoJVf+4DTO
   UE0Tmtyg2Gf6dDzHLLpv1uviQ964FqmZcqshGCOZHwTgigKskhs4Vf8M5
   t2KQNluKXnzMDFXeI0+H2H0/RHrjwbKBGDXv6m69xPIUYf1XUR1QN7fjM
   BY9bObrtrxPmjOkE8RmFA6xIXb+OjMW4Qb3c7ytvDjxbeq6C2+znT/bWd
   EQb8RDZAyo81ZvELDoLFBgTAUT7SdWrDzSRwZK6d3YKg3CzPCHqKmR8Cr
   LnUO4+uIbKIW2GTELvXbMqFqhhjHxot5RQ7xoMETa87qiGsIVGBN3XPmp
   w==;
X-CSE-ConnectionGUID: RomHtIrwQ4OkMy8sQp9YNQ==
X-CSE-MsgGUID: MFBypiUDTxqhcK1X3G0CiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="67001185"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; 
   d="scan'208";a="67001185"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 10:25:06 -0800
X-CSE-ConnectionGUID: mTIV4eveQ4yH/f/YViQGWw==
X-CSE-MsgGUID: QFkgXDdGSxCVwDeZlZjtvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; 
   d="scan'208";a="191325244"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO fdefranc-mobl3.intel.com) ([10.245.246.211])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 10:24:59 -0800
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
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-pci@vger.kernel.org,
	"Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Qiuxu Zhuo <qiuxu.zhuo@intel.com>
Subject: [PATCH 1/6 v7] ACPI: extlog: Trace CPER Non-standard Section Body
Date: Tue,  4 Nov 2025 19:22:32 +0100
Message-ID: <20251104182446.863422-2-fabio.m.de.francesco@linux.intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251104182446.863422-1-fabio.m.de.francesco@linux.intel.com>
References: <20251104182446.863422-1-fabio.m.de.francesco@linux.intel.com>
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

ghes_do_proc() has a catch-all for unknown or unhandled CPER formats
(UEFI v2.11 Appendix N 2.3), extlog_print() does not. This gap was
noticed by a RAS test that injected CXL protocol errors which were
notified to extlog_print() via the IOMCA (I/O Machine Check
Architecture) mechanism. Bring parity to the extlog_print() path by
including a similar log_non_standard_event().

Cc: Dan Williams <dan.j.williams@intel.com>
Reviewed-by: Dan Williams <dan.j.williams@intel.com>
Reviewed-by: Dave Jiang <dave.jiang@intel.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Reviewed-by: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
Signed-off-by: Fabio M. De Francesco <fabio.m.de.francesco@linux.intel.com>
---
 drivers/acpi/acpi_extlog.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/acpi/acpi_extlog.c b/drivers/acpi/acpi_extlog.c
index f6b9562779de..47d11cb5c912 100644
--- a/drivers/acpi/acpi_extlog.c
+++ b/drivers/acpi/acpi_extlog.c
@@ -183,6 +183,12 @@ static int extlog_print(struct notifier_block *nb, unsigned long val,
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
 
-- 
2.51.1


