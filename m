Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6AF504B15
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Apr 2022 04:42:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KhWSL4QvCz3bfb
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Apr 2022 12:42:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NFWNtEuf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=NFWNtEuf; dkim-atps=neutral
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KhWRh2ryWz2x9G
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Apr 2022 12:42:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650249728; x=1681785728;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=1OnnIxCBy/qTlGtme/3GDFqpeEdoJajfa2fa8H07GEY=;
 b=NFWNtEuf3ixfwVpE9LH7lQSXKWR50lFF2Ycwz7DNNWm4J5mrg+DZFFcY
 LdzIqKPKfFnq93vHgF65Ga+cnhGRCefQOkLy7aLq4hZXsKZADE50vyE6t
 jwfEEBU9FxUuZ4KM/5cP6CAAfhXqs1mABjOSP4AiXLb3Z8nst/pBEYXhy
 AVa4mlkPnXHgNLRYVXV0HJcCjvoIemMSC181SnS7Vj+86NKiqbCWFTWRH
 V15ZERZosrwp9N8iSdbNKo/yWMr4QT+YVaEaRKZv9IfXrUpk6CQWShXs5
 xYXErK3gTfbq9rx+lR5N3VUM74+ZqK1d2Me9vKLa5SODD3MbllLQqfNNP g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10320"; a="323880110"
X-IronPort-AV: E=Sophos;i="5.90,267,1643702400"; d="scan'208";a="323880110"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2022 19:41:03 -0700
X-IronPort-AV: E=Sophos;i="5.90,267,1643702400"; d="scan'208";a="646717427"
Received: from tnguyen-mobl1.amr.corp.intel.com (HELO [10.212.132.8])
 ([10.212.132.8])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2022 19:41:01 -0700
Message-ID: <0d4e8764-b1ae-ae59-06ff-d5b705891da4@linux.intel.com>
Date: Sun, 17 Apr 2022 19:41:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.7.0
Subject: Re: [PATCH v4 2/2] PCI/DPC: Disable DPC service when link is in L2/L3
 ready, L2 and L3 state
Content-Language: en-US
To: Kai-Heng Feng <kai.heng.feng@canonical.com>, bhelgaas@google.com
References: <20220408153159.106741-1-kai.heng.feng@canonical.com>
 <20220408153159.106741-2-kai.heng.feng@canonical.com>
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20220408153159.106741-2-kai.heng.feng@canonical.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, koba.ko@canonical.com,
 Oliver O'Halloran <oohall@gmail.com>, mika.westerberg@linux.intel.com,
 baolu.lu@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 4/8/22 8:31 AM, Kai-Heng Feng wrote:
> On Intel Alder Lake platforms, Thunderbolt entering D3cold can cause
> some errors reported by AER:
> [   30.100211] pcieport 0000:00:1d.0: AER: Uncorrected (Non-Fatal) error received: 0000:00:1d.0
> [   30.100251] pcieport 0000:00:1d.0: PCIe Bus Error: severity=Uncorrected (Non-Fatal), type=Transaction Layer, (Requester ID)
> [   30.100256] pcieport 0000:00:1d.0:   device [8086:7ab0] error status/mask=00100000/00004000
> [   30.100262] pcieport 0000:00:1d.0:    [20] UnsupReq               (First)
> [   30.100267] pcieport 0000:00:1d.0: AER:   TLP Header: 34000000 08000052 00000000 00000000
> [   30.100372] thunderbolt 0000:0a:00.0: AER: can't recover (no error_detected callback)
> [   30.100401] xhci_hcd 0000:3e:00.0: AER: can't recover (no error_detected callback)
> [   30.100427] pcieport 0000:00:1d.0: AER: device recovery failed
> 
> Since AER is disabled in previous patch for a Link in L2/L3 Ready, L2
> and L3, also disable DPC here as DPC depends on AER to work.
> 
> Bugzilla:https://bugzilla.kernel.org/show_bug.cgi?id=215453
> Reviewed-by: Mika Westerberg<mika.westerberg@linux.intel.com>
> Signed-off-by: Kai-Heng Feng<kai.heng.feng@canonical.com>

Reviewed-by: Kuppuswamy Sathyanarayanan 
<sathyanarayanan.kuppuswamy@linux.intel.com>
-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer
