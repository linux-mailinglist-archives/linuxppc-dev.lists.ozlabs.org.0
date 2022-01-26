Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B7AB249C83C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jan 2022 12:04:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JkLTZ4rQ4z3bsp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jan 2022 22:04:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RpOVPCls;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mga12.intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=mika.westerberg@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=RpOVPCls; dkim-atps=neutral
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JkLSs4GBpz2x9N
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jan 2022 22:04:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643195053; x=1674731053;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8Q3gBcQGz/pjxvxeA6YutlHYOEjH1VZ/sW0EYV1FVls=;
 b=RpOVPClskAJxaU8wq4hR10wIeqDUCg2uWbqAEkABz/b3pMPDtdvOnHD3
 BRoJb/rMrz5m8wZYT0pzsDPhIBhwA/yrJOOch92TsNY/tFshrQM4oS9sJ
 V6hVcQKmmgncaHvCujz11VLjtJhwyiNvQ0SEOsGX1IesGzW26EDQfiSTP
 SAPABMKA4xYh98U4478cBHpYulU704L0V6hjm1Fvb6EiFNUakappsMoHM
 uAjnR8NLXYi6GBvXnq6UXVysqWm7VkAHgbjJxBDjkiw1RJD0yJExtVajE
 r472wM68O8YcoOCxblGrhQ4COBIWV34sKT4qKsYaVi9YZ00fgaRn66x02 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="226504234"
X-IronPort-AV: E=Sophos;i="5.88,317,1635231600"; d="scan'208";a="226504234"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 03:03:07 -0800
X-IronPort-AV: E=Sophos;i="5.88,317,1635231600"; d="scan'208";a="563378278"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 03:03:03 -0800
Received: by lahna (sSMTP sendmail emulation); Wed, 26 Jan 2022 13:03:00 +0200
Date: Wed, 26 Jan 2022 13:03:00 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: Re: [PATCH 1/2] PCI/AER: Disable AER when link is in L2/L3 ready, L2
 and L3 state
Message-ID: <YfEqZMUS9jyiErmF@lahna>
References: <20220126071853.1940111-1-kai.heng.feng@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220126071853.1940111-1-kai.heng.feng@canonical.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: Joerg Roedel <jroedel@suse.de>,
 Lalithambika Krishnakumar <lalithambika.krishnakumar@intel.com>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, koba.ko@canonical.com,
 Oliver O'Halloran <oohall@gmail.com>, bhelgaas@google.com,
 linuxppc-dev@lists.ozlabs.org, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On Wed, Jan 26, 2022 at 03:18:51PM +0800, Kai-Heng Feng wrote:
> Commit 50310600ebda ("iommu/vt-d: Enable PCI ACS for platform opt in
> hint") enables ACS, and some platforms lose its NVMe after resume from
> S3:
> [   50.947816] pcieport 0000:00:1b.0: DPC: containment event, status:0x1f01 source:0x0000
> [   50.947817] pcieport 0000:00:1b.0: DPC: unmasked uncorrectable error detected
> [   50.947829] pcieport 0000:00:1b.0: PCIe Bus Error: severity=Uncorrected (Non-Fatal), type=Transaction Layer, (Receiver ID)
> [   50.947830] pcieport 0000:00:1b.0:   device [8086:06ac] error status/mask=00200000/00010000
> [   50.947831] pcieport 0000:00:1b.0:    [21] ACSViol                (First)
> [   50.947841] pcieport 0000:00:1b.0: AER: broadcast error_detected message
> [   50.947843] nvme nvme0: frozen state error detected, reset controller
> 
> It happens right after ACS gets enabled during resume.

Is this really because of the above commit of due the fact that AER
"service" never implemented the PM hooks in the first place ;-)
> 
> There's another case, when Thunderbolt reaches D3cold:
> [   30.100211] pcieport 0000:00:1d.0: AER: Uncorrected (Non-Fatal) error received: 0000:00:1d.0
> [   30.100251] pcieport 0000:00:1d.0: PCIe Bus Error: severity=Uncorrected (Non-Fatal), type=Transaction Layer, (Requester ID)
> [   30.100256] pcieport 0000:00:1d.0:   device [8086:7ab0] error status/mask=00100000/00004000
> [   30.100262] pcieport 0000:00:1d.0:    [20] UnsupReq               (First)
> [   30.100267] pcieport 0000:00:1d.0: AER:   TLP Header: 34000000 08000052 00000000 00000000
> [   30.100372] thunderbolt 0000:0a:00.0: AER: can't recover (no error_detected callback)
> [   30.100401] xhci_hcd 0000:3e:00.0: AER: can't recover (no error_detected callback)
> [   30.100427] pcieport 0000:00:1d.0: AER: device recovery failed
> 
> Since PCIe spec "5.2 Link State Power Management" states that TLP and DLLP
> transmission is disabled for a Link in L2/L3 Ready (D3hot), L2 (D3cold with aux
> power) and L3 (D3cold), so disable AER to avoid the noises from turning power
> rails on/off.

I think more accurate here is to say when the topology behind the root
port enters low power states. Reason here is that you can't really tell
from the OS standpoint whether the link went into L1 or L2/3 before the
ACPI power resource is turned off.

> Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=209149
> Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=215453
> Fixes: 50310600ebda ("iommu/vt-d: Enable PCI ACS for platform opt in hint")
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>

Thanks for fixing this!

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
