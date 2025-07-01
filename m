Return-Path: <linuxppc-dev+bounces-9998-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99FCFAEF979
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Jul 2025 14:59:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bWjlX4nVnz30KY;
	Tue,  1 Jul 2025 22:59:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.176.79.56
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751374744;
	cv=none; b=RRGriyQm07fOChWLvMMhL6ug6qqt+8bX4zcJTdQfxFcxpq6U99uLRYiuBQI6oPNsS2tNgupxlmUozMpO0U/DmJ3bV1WDL/2cYP5my29y0qYGNnfZYDiipUt0FVT2+oQQcjQPBZwpMIQDxUIyLq4Uci/IZKe3u1tRXZ2VjZuTXbLBmXM8vE15u9Q+0EHHQMZ+AxikP7JVveO8Eb53qTec1SSUOUq45nwMwxuyTKGuOBhKq7gtyumGPjSJ+/TH0X+iCOuDB/FTLd8ZFKj6yzkFfxsNODvRqCXRgqxHlygRsGj7szvrg10nVHx1AtboPtEYjzarM8smHNidfB4olKnjLw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751374744; c=relaxed/relaxed;
	bh=eMA49RzIRymF4UMhTFuwnzrOes5Q3d3OYLvjGaq3gBM=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g2kew2nVj9cxD+j6o2ybP5iCx+2UJdXSkMKq5rjsl2lLwCYzEdmzfE42VEkMgWpQJiSoenGQtZ7RmYkJtco1oG3RtTNuh3mLZBts1dlH7eWg9X66aJxR8iZT5DSzmbdY9MWF+4K2VhLdvH0NVC1tpNe2kgtj64CY4eiav9ykKx5ngew5g46znfOHpANWAQr4JXlryVrO+4P7ZRbnqLbBK0y/5lqnPYaO6+G/HfkEyf8O8fvNxmGehGJP872krceAoLtoBB+gF0d6GmxR3lgPjpuN8RjY4OLjJmDuGE08h0zXHw6rxCgW+R52jNku9J2/mLx1QTHPns3y55EBk0qiUQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bWjlW3gvTz30DP
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Jul 2025 22:59:01 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bWjkM1yBrz6M4rV;
	Tue,  1 Jul 2025 20:58:03 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 611131402F5;
	Tue,  1 Jul 2025 20:58:57 +0800 (CST)
Received: from localhost (10.122.19.247) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 1 Jul
 2025 14:58:56 +0200
Date: Tue, 1 Jul 2025 13:58:55 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: "Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>
CC: <linux-cxl@vger.kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
	"Len Brown" <lenb@kernel.org>, Davidlohr Bueso <dave@stgolabs.net>, Dave
 Jiang <dave.jiang@intel.com>, Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>, Dan
 Williams <dan.j.williams@intel.com>, Mahesh J Salgaonkar
	<mahesh@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas
	<bhelgaas@google.com>, Tony Luck <tony.luck@intel.com>, Borislav Petkov
	<bp@alien8.de>, <linux-acpi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-pci@vger.kernel.org>,
	<linux-edac@vger.kernel.org>
Subject: Re: [PATCH 2/3 v4] ACPI: extlog: Trace CPER PCI Express Error
 Section
Message-ID: <20250701135855.00004406@huawei.com>
In-Reply-To: <20250623145453.1046660-3-fabio.m.de.francesco@linux.intel.com>
References: <20250623145453.1046660-1-fabio.m.de.francesco@linux.intel.com>
	<20250623145453.1046660-3-fabio.m.de.francesco@linux.intel.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
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
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.122.19.247]
X-ClientProxiedBy: lhrpeml100005.china.huawei.com (7.191.160.25) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, 23 Jun 2025 16:54:19 +0200
"Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com> wrote:

> I/O Machine Check Architecture events may signal failing PCIe components
> or links. The AER event contains details on what was happening on the wire
> when the error was signaled.
> 
> Trace the CPER PCIe Error section (UEFI v2.10, Appendix N.2.7) reported
> by the I/O MCA.
> 
> Cc: Dan Williams <dan.j.williams@intel.com>
> Reviewed-by: Dave Jiang <dave.jiang@intel.com>
> Signed-off-by: Fabio M. De Francesco <fabio.m.de.francesco@linux.intel.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

