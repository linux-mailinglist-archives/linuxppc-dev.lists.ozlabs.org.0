Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A7B84BB59
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Feb 2024 17:48:46 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=S8h0y3hb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TTq2N0mXrz3cY2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Feb 2024 03:48:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=S8h0y3hb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.12; helo=mgamail.intel.com; envelope-from=qingshun.wang@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Wed, 07 Feb 2024 03:48:03 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TTq1b1DsPz2xdp
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Feb 2024 03:48:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707238083; x=1738774083;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=USPZtu7vxjk1ebvcOxNJKhO0fXx2MLMuxDfhFtm/z84=;
  b=S8h0y3hbwjW1B6CiFvhrJJ0hq1OwUafTLKNTFMaJEdyVhG+tUBffj1eB
   Yr0e8nKkBBpC3TjKKZoqQoXmh8ttuNFDr6dboG2eFyxgOUHJpvk5dcI3i
   H3mclX4dH8qi8ZnmGJy2Yh3HdIWZ/rlwRiUy64qUSPFPE9lKXQ8tJdVbP
   SZ8FB6Hv01EIzX8vTiW/QFONfho5dItuvorHVQffop05km0+JYr/ES8bJ
   uuCrwcaCVavzxak2Q/MBLJOF66fQWyv84nnvyLvOKtbi2LA5urfHfOao2
   eOMrUj7zI+2IYrIgzos8gj2Z9ZdxBkWUjf5pa5fwfhWSXhNGEjDvOV9Gb
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="12146639"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="12146639"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 08:46:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="1102749"
Received: from jingjing-mobl1.ccr.corp.intel.com (HELO localhost) ([10.254.215.110])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 08:46:48 -0800
Date: Wed, 7 Feb 2024 00:46:39 +0800
From: "Wang, Qingshun" <qingshun.wang@linux.intel.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v2 2/4] PCI/AER: Handle Advisory Non-Fatal properly
Message-ID: <ay2cwgycgjfqz5jmteeijgjiuje2u62wozhnkr76ag4tny6vl4@upbmy22y3hcn>
References: <20240125062802.50819-3-qingshun.wang@linux.intel.com>
 <20240205232616.GA831017@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240205232616.GA831017@bhelgaas>
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, Alison Schofield <alison.schofield@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, linux-pci@vger.kernel.org, erwin.tsaur@intel.com, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, linux-cxl@vger.kernel.org, linux-kernel@vger.kernel.org, Oliver O'Halloran <oohall@gmail.com>, chao.p.peng@linux.intel.com, Ira Weiny <ira.weiny@intel.com>, Davidlohr Bueso <dave@stgolabs.net>, Dave Jiang <dave.jiang@intel.com>, Vishal Verma <vishal.l.verma@intel.com>, Smita Koralahalli <Smita.KoralahalliChannabasappa@amd.com>, linux-acpi@vger.kernel.org, Len Brown <lenb@kernel.org>, Robert Richter <rrichter@amd.com>, Borislav Petkov <bp@alien8.de>, Jonathan Cameron <jonathan.cameron@huawei.com>, Bjorn Helgaas <bhelgaas@google.com>, Dan Williams <dan.j.williams@intel.com>, linux-edac@vger.kernel.org, Tony Luck <tony.luck@intel.com>, feiting.wanyan@intel.com, qingshun.wang@intel.com, Adam Preble <adam.c.preble@intel.com>, Mahesh J Salgaonk
 ar <mahesh@linux.ibm.com>, Li Yang <leoyang.li@nxp.com>, Lukas Wunner <lukas@wunner.de>, James Morse <james.morse@arm.com>, linuxppc-dev@lists.ozlabs.org, Shiju Jose <shiju.jose@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Feb 05, 2024 at 05:26:16PM -0600, Bjorn Helgaas wrote:
> In the subject, "properly" really doesn't convey information.  I think
> this patch does two things:
> 
>   - Prints error bits that might be ANFE 
>   - Clears UNCOR_STATUS bits that were previously not cleared
> 
> Maybe the subject line could say something about those (clearing
> UNCOR_STATUS might be more important, or maybe this could even be
> split into two patches so we could see both).
> 

Good idea, thanks. I think splitting it into two patches would be the
better approach.
