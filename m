Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5271D58841B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Aug 2022 00:19:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ly8YS20n9z2xHM
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Aug 2022 08:19:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gktGCgER;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.43; helo=mga05.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gktGCgER;
	dkim-atps=neutral
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ly8Xk36jtz2xGg
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Aug 2022 08:18:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659478742; x=1691014742;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=46eujB+5/ILB4xpJ6ANIISZP2uck5Pj6UwNACvgbNjc=;
  b=gktGCgER3dK21rJ4iOIYrqE68runBdxtrmWbiL7RJ+K8z3pcjqr/h6Tg
   WyiJg/9WwZ4mTppk/h3mZMKG0hYEHjosV8TW3ZtgTSTm8x39N3So51l20
   qMxt/ugZgZDqVmtEITkdtbHOyQk7WUm2luTwLhzEenIq/C542iXmZhIw0
   8kPgHPyRh0I85k8GIt9J8uobnAQbF+THpyzgIUblFoP5vXaxbXIbIbZa2
   uh88u87/eSn5tdaZF3NQCeTv1LWobCotbHlbgXHRHVSLuuocKxv/raIxV
   xyEqNqnCOAqvyM04lLaX9dXm5ywb6PdSfFYbwN7oPCKmRIHBq58Ggtw79
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10427"; a="375831177"
X-IronPort-AV: E=Sophos;i="5.93,212,1654585200"; 
   d="scan'208";a="375831177"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2022 15:18:53 -0700
X-IronPort-AV: E=Sophos;i="5.93,212,1654585200"; 
   d="scan'208";a="692015304"
Received: from lkeefe-mobl.amr.corp.intel.com (HELO [10.212.232.208]) ([10.212.232.208])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2022 15:18:53 -0700
Message-ID: <6056c6cc-9861-9c29-8e36-48e0dd36c702@linux.intel.com>
Date: Tue, 2 Aug 2022 15:18:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH v3] PCI/ERR: Use pcie_aer_is_native() to judge whether OS
 owns AER
Content-Language: en-US
To: Zhuo Chen <chenzhuo.1@bytedance.com>
References: <20220727035334.9997-1-chenzhuo.1@bytedance.com>
 <b5c746db-f6a0-d89e-6db5-e4a206c9237a@linux.intel.com>
 <cfd44d9c-453b-e498-2630-9057947cf3cd@bytedance.com>
 <b54b068b-fe9a-8609-3e9f-170579affc27@bytedance.com>
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <b54b068b-fe9a-8609-3e9f-170579affc27@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: jan.kiszka@siemens.com, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, lukas@wunner.de, oohall@gmail.com, stuart.w.hayes@gmail.com, bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 7/27/22 2:37 AM, Zhuo Chen wrote:
>>
> Do you mean changing "if ((host->native_aer || pcie_ports_native) && aer)" into "if (pcie_aer_is_native(dev) && aer)" ?
> I thought changing into "if (pcie_aer_is_native(dev))" before.
> 
> One another doubt. Not every pci device support aer. When dev->aer_cap is NULL and root->aer_cap is not NULL in aer_root_reset(), pcie_aer_is_native() will return false and OS cannot operate root register. It's different from just using "(host->native_aer || pcie_ports_native)".
> 
> Or we can change "if ((host->native_aer || pcie_ports_native) && aer)" into "if (pcie_aer_is_native(root))". But in this way, argument NULL pointer check should be added in pcie_aer_is_native().

Looking into it again, I think it is better to leave it as it is. Please ignore my comment.

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer
