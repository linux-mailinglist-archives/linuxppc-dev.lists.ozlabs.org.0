Return-Path: <linuxppc-dev+bounces-15710-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CBBEDD1DEAF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jan 2026 11:16:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4drhpc4ZmMz2xjN;
	Wed, 14 Jan 2026 21:16:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768385768;
	cv=none; b=gra04qs23Clj5Kgrm9KCC+m5Zut+v8ezhD2+A/nPXFr3RO/2y6aOJldyLOtQCii9S5q+Cfae4Eul3jYfql3FuUNEtzbOMfbDozD/FvMHymiTd+ETH337mRS4GrzcfiD+fsqseNhoXFGjV9lhxU4sT2hhMiNy+kqu/0Xiz1tS+PxCZumxameV9k3tiGk7RvLsGxLbLBHhwoDWLyNjPIuupaA6IaKywN47J4LifnR89d41y/d+MV3ufSFkOlOlulVPfTSY5phctE3oWv9Q27Z8Qva7Y+zGdJ5gI2tXeifB/Z93Ggs+ACuQ2Cqndi7yjVV5mjmYMNsrQMM/9v+iGnYndg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768385768; c=relaxed/relaxed;
	bh=nkjHa1LDmzQkq4nsMUbGUw9kae8EgVk2qpJ+fYhDU7c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AzqL8tam+lS/QSIFrK3qTPEI02Qqu05aXXbmtylMCrDmBBQuC73hbi8pD/UFoEFfPugQ36jkIJSk1Ek4M02Zyv+8sCXVBIMjCi/e9RmXIghnL77QfWXciQDkScVXi8EJ4vwin6rKwcqY3d79x5UP8Pc5Ozive9AfnRYKNBLAqjvrr6YyziwXI+QcCLsRgxBuWDJ8oq/eQ9yCO34uLu97uQvY0IxVz5S7gmWqkaK7dGpPzjyMpj0t7vYQjwuH7ZaGfPR9UfUorM32YKq56sKJ5CV2dgWGE7APE1YbnU+8Zc/iG1DkKTq7MWL9zWQnz0EEBK3nqblEMvxhVth6dYcJSQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Sgg2NUQG; dkim-atps=neutral; spf=pass (client-ip=192.198.163.15; helo=mgamail.intel.com; envelope-from=fabio.m.de.francesco@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Sgg2NUQG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.15; helo=mgamail.intel.com; envelope-from=fabio.m.de.francesco@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drhpb3bCgz2xFn
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jan 2026 21:16:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768385768; x=1799921768;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0Jx7sgvnzmm4IhMz1DkIVr0T4vOsn+9/FVAb35DZKCk=;
  b=Sgg2NUQG30fk31QyvEqUDel02Yhxm7uRz39wHUBE152nqawM9jHWqMDJ
   nxAD2UeZxeAVHSEBM4ZpTWXtjNk2HJG9OEqvQRow7w9+oywPz5Uu4tAxS
   wiCUNgJpaCfK3xKrHmo2uGNKMsT+kFkLidLS6NIZ/KXSj1HDfMe9LoEvA
   YiXpCw7utjiwJBAipLt3ftxMCCrDNzFYmoMsOfeTb4eJSMOdvCpnclWDe
   GPgRPNdNOUoKOECGhlD2hUso9JZFxSgmeNWqbfYDNkx8AHCcqhC/s7Oof
   zC2Ix13+snLgJgdQ65w4vek9S5eSABgUayWmANeFXaYpOoLKbJcgKVLR+
   Q==;
X-CSE-ConnectionGUID: jg3J1He9SOagMf8zQE0ioA==
X-CSE-MsgGUID: FvbgrgiHQuKxS2FqV9sELA==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69765810"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="69765810"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 02:16:02 -0800
X-CSE-ConnectionGUID: iYVtXrfTT3isZMTL8ZXelA==
X-CSE-MsgGUID: BKHDCLGeQqSvTScn1B0fXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="208792751"
Received: from unknown (HELO fdefranc-mobl3.igk.intel.com) ([10.237.142.167])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 02:15:56 -0800
From: "Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>
To: linux-cxl@vger.kernel.org
Cc: Rafael J Wysocki <rafael@kernel.org>,
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
Subject: [PATCH 1/5 v9] ACPI: extlog: Trace CPER Non-standard Section Body
Date: Wed, 14 Jan 2026 11:14:21 +0100
Message-ID: <20260114101543.85926-2-fabio.m.de.francesco@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114101543.85926-1-fabio.m.de.francesco@linux.intel.com>
References: <20260114101543.85926-1-fabio.m.de.francesco@linux.intel.com>
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
Reviewed-by: Shuai Xue <xueshuai@linux.alibaba.com>
Signed-off-by: Fabio M. De Francesco <fabio.m.de.francesco@linux.intel.com>
---
 drivers/acpi/acpi_extlog.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/acpi/acpi_extlog.c b/drivers/acpi/acpi_extlog.c
index f6b9562779de0..47d11cb5c9120 100644
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
2.52.0


