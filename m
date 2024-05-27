Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4700D8D5559
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 00:27:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FAJAY7A/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vr18R3mcpz2xjJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 08:27:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FAJAY7A/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.17; helo=mgamail.intel.com; envelope-from=fabio.m.de.francesco@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vnz2s5092z3fp0
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 May 2024 00:45:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716821126; x=1748357126;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=OM1rdnugqBXqPiE3NxXp2O0o31W1IZjSamfYJ/RZelo=;
  b=FAJAY7A/1sPsPP3Z7bWpitRLHBR7ZFMu9r2JNUGIV9vh9JRgrjJBWZWd
   ncdKSqZNtjoIIpC+APIKvsa2Oz4HRyeDljshn7ANtglZNyWzch5OhurST
   EhM+F0QqL3ECkrMSTxzVxmkZHmdvFtzY3nWOLdFHrgnk6yu9Z9HWSMbrI
   VVuM+kI4UWUnlPbjaPbQzh2pYGD3jw5Lkmqe4HF5M5i5FVnb5VEdZAeNr
   bEXeqaSih21aIp/OfKsKoCpST/YjKEKiP+q0yTtSA3yNsBVXCtBVEXG3l
   mEfPBKXUESyatMC1SKSAGzSfpVYP2i9740BPzMAZKlrHfWtbJ1iV2mv1O
   g==;
X-CSE-ConnectionGUID: 5eUQb8bdS32xP561SvtK6g==
X-CSE-MsgGUID: 18NCBCw+QzGl6FNad/JahA==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13269759"
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; 
   d="scan'208";a="13269759"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 07:44:17 -0700
X-CSE-ConnectionGUID: biFalGLdRLakTIUquR73OQ==
X-CSE-MsgGUID: /rnoDRQFS3eWMeziXLYCBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; 
   d="scan'208";a="35279795"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost.localdomain) ([10.245.246.214])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 07:44:14 -0700
From: "Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	"Oliver O'Halloran" <oohall@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-pci@vger.kernel.org,
	Dan Williams <dan.j.williams@intel.com>,
	"Fabio M . De Francesco" <fabio.m.de.francesco@linux.intel.com>
Subject: [PATCH 1/2] ACPI: extlog: Trace CPER Non-standard Section Body
Date: Mon, 27 May 2024 16:43:40 +0200
Message-ID: <20240527144356.246220-2-fabio.m.de.francesco@linux.intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240527144356.246220-1-fabio.m.de.francesco@linux.intel.com>
References: <20240527144356.246220-1-fabio.m.de.francesco@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 31 May 2024 08:19:55 +1000
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In extlog_print(), trace "Non-standard Section Body" reported by firmware
to the OS via Common Platform Error Record (CPER) (UEFI v2.10 Appendix N
2.3) to add further debug information and so to make ELOG log
consistently with ghes_do_proc() (GHES).

Cc: Dan Williams <dan.j.williams@intel.com>
Signed-off-by: Fabio M. De Francesco <fabio.m.de.francesco@linux.intel.com>
---
 drivers/acpi/acpi_extlog.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/acpi/acpi_extlog.c b/drivers/acpi/acpi_extlog.c
index f055609d4b64..e025ae390737 100644
--- a/drivers/acpi/acpi_extlog.c
+++ b/drivers/acpi/acpi_extlog.c
@@ -179,6 +179,12 @@ static int extlog_print(struct notifier_block *nb, unsigned long val,
 			if (gdata->error_data_length >= sizeof(*mem))
 				trace_extlog_mem_event(mem, err_seq, fru_id, fru_text,
 						       (u8)gdata->error_severity);
+		} else {
+			void *err = acpi_hest_get_payload(gdata);
+
+			trace_non_standard_event(sec_type, fru_id, fru_text,
+						 gdata->error_severity, err,
+						 gdata->error_data_length);
 		}
 	}
 
-- 
2.45.1

