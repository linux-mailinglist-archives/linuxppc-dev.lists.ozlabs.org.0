Return-Path: <linuxppc-dev+bounces-8735-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F9BABD640
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 May 2025 13:10:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1sKb6XWvz3bmq;
	Tue, 20 May 2025 21:10:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.176.79.56
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747739427;
	cv=none; b=mFBXqDN/A3wzWdSqB6VRsNgArimO7hs3lPeNiSu0pmZzGDwKh1OA1gJQjbKTD8kXRYZwW0/p0McMmQbUqanE2h/vgOt5ssK36P2MNOuphNnuCu+tWe7PeCwBHYWDifg/llzJRJ+CoqzXm6OlAvoBX/NB+gVLIy226YlMxOyQ2v3Bw3BQSdHoti9lkfr2YuO/SP3FpCOgE39TuIoeEEKOjGlACswvgq1+7QTrrheKKdvpEHJArltDgsNh9LnQGm0Polcz4yMUI98udmX+tOqSfHT4XabNpDg8misC71EXYPYeCDKFAIXh7l9MmeoTI/mBuT9s1M9g1fakbgOcujowqw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747739427; c=relaxed/relaxed;
	bh=NuzTWUJmEmnbBNLc9BBpFcyqM7HITNKUrpqWCg88mOo=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V3muCKuH2j3EIcsqHs7LEd+jYfCOlcSkVPPSUwOA4cjg84my69KXHa7/cJx52097mrFE+kTolfiigUul91H1DRDWr6aN/qB26c2loLUjP6IXVEzG1sr9lLzld5dbDNyT+6YY4jgJgswr6vVsNNWnOW3hHFdnkDcwztiszc3WraGFLGiNmMOSYSjJyDk9bfwJoW62hcBSNB9Dn7yw45VcAib9qTRIL6HOr8RWwr6fvV4TgJPdz0g7P4gD+t+VIcOXorsopDWF55OKB8OkLLYny1I4M2ym4UhCSmh6S/JtmuvUt5qwzZzv5ZezK5YAKSFXQ+XZyJTOSAT1+JTFiYx7/A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 86 seconds by postgrey-1.37 at boromir; Tue, 20 May 2025 21:10:26 AEST
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b1sKZ5sMTz3bcJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 May 2025 21:10:26 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4b1sJY4svJz6GDDL;
	Tue, 20 May 2025 19:09:33 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id AA50B140447;
	Tue, 20 May 2025 19:10:23 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 20 May
 2025 13:10:22 +0200
Date: Tue, 20 May 2025 12:10:21 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: "Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>
CC: "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
	Davidlohr Bueso <dave@stgolabs.net>, Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>, Vishal Verma
	<vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>, Dan Williams
	<dan.j.williams@intel.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
	Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
	<linux-kernel@vger.kernel.org>, <linux-acpi@vger.kernel.org>,
	<linux-cxl@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-pci@vger.kernel.org>, <linux-edac@vger.kernel.org>
Subject: Re: [PATCH 2/4 v2] PCI/AER: Modify pci_print_aer() to take log
 level
Message-ID: <20250520121021.00001fb3@huawei.com>
In-Reply-To: <20250429172109.3199192-3-fabio.m.de.francesco@linux.intel.com>
References: <20250429172109.3199192-1-fabio.m.de.francesco@linux.intel.com>
	<20250429172109.3199192-3-fabio.m.de.francesco@linux.intel.com>
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
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500012.china.huawei.com (7.191.174.4) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, 29 Apr 2025 19:21:07 +0200
"Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com> wrote:

> Modify pci_print_aer() to take a printk() log level in preparation of a
> patch that logs PCIe Components and Link errors from ELOG.
> 
> Cc: Dan Williams <dan.j.williams@intel.com>
> Acked-by: Bjorn Helgaas <bhelgaas@google.com>
> Signed-off-by: Fabio M. De Francesco <fabio.m.de.francesco@linux.intel.com>
Fair enough on reasoning and it does what you describe so

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

