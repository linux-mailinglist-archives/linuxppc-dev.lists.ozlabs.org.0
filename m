Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1DF6669CF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jan 2023 04:49:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NsrCW0tW1z3cgv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jan 2023 14:49:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lq0Z6nZ8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mga12.intel.com (client-ip=192.55.52.136; helo=mga12.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lq0Z6nZ8;
	dkim-atps=neutral
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NsrBY3M4Pz3bVs
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Jan 2023 14:48:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673495333; x=1705031333;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=TKvdNpz9TBZtw78c48PaO8ycADozRlkWSBrClcPP9SQ=;
  b=lq0Z6nZ8dusZUvQ+zqEiZ/Uzpe/uRGKoKpT9GPKoqL86RwGb9Dt51NCQ
   B0h/M9/hk33TXwZw4wALcYWdkNhLi4bZOBdjBFGKDcxaZyYfzO4Ni9sQi
   u5jhmceU2qhp6SqYUkSlePqZIsuldQhbHB7g4J0TVhwHEuC7F3XJ55NwE
   VrEadqbrPQ6bI7DANpK6qsIYRUO0Z2cbNhlmQAsbfel5iKnCpyN2o42rW
   Y/uAXAn4WIRak12T1y9Bx/tKJ1TcogedwdgapoK5X8GdF3yGpv9GSChSR
   RtDSztMNdv07vFdaSDITGgGRzpCAt608BWnzzmHvaZkISPvonZ1KFXjYP
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="303301897"
X-IronPort-AV: E=Sophos;i="5.96,318,1665471600"; 
   d="scan'208";a="303301897"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2023 19:48:48 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="657641426"
X-IronPort-AV: E=Sophos;i="5.96,318,1665471600"; 
   d="scan'208";a="657641426"
Received: from mabir-mobl.amr.corp.intel.com (HELO [10.209.115.16]) ([10.209.115.16])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2023 19:48:47 -0800
Message-ID: <de13b6bd-813f-d0bb-3a92-ea1ad3db5d54@linux.intel.com>
Date: Wed, 11 Jan 2023 19:48:47 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH V1] PCI/AER: Configure ECRC only AER is native
Content-Language: en-US
To: Vidya Sagar <vidyas@nvidia.com>, Bjorn Helgaas <helgaas@kernel.org>
References: <20230111231033.GA1714672@bhelgaas>
 <880c4d3c-86d2-082c-bb58-8212adc67ff3@linux.intel.com>
 <4ddef2c9-44b6-4a08-dbeb-428cd0864c55@nvidia.com>
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <4ddef2c9-44b6-4a08-dbeb-428cd0864c55@nvidia.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: mmaddireddy@nvidia.com, kthota@nvidia.com, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, jonathanh@nvidia.com, vsethi@nvidia.com, oohall@gmail.com, bhelgaas@google.com, treding@nvidia.com, linuxppc-dev@lists.ozlabs.org, sagar.tv@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 1/11/23 7:33 PM, Vidya Sagar wrote:
> I think we still need bios option. For example, consider a system where BIOS needs to keep ECRC enabled for integrity reasons but if kernel doesn't want it for perf reasons, then, kernel can always use 'ecrc=off' option.

I agree that "on" and "off" option makes sense. Since the kernel defaults ecrc setting to "bios", why again allow it as a command line option?

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer
