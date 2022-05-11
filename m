Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7D9524125
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 May 2022 01:40:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KzBHV5YGKz3cG4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 May 2022 09:40:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jczvS/Um;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=jczvS/Um; dkim-atps=neutral
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KzBGs08Wtz3bZt
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 May 2022 09:40:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652312421; x=1683848421;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=DHCdBsPB20Xiig5HcLQMEK/s5Y3wvRIIRVn7Np5YH4g=;
 b=jczvS/UmAEd8OYD/M0CU7qRBQN9KZMn61P0481HKORmS9Kt5aGPmERlL
 rDTJHpdzLgoVuv/jXaMCSreCX1FGtWX9OpD5wkEc0IFw/xYURffQiNtNs
 fdruEHvPSKMP/U5tc/I0xOJ8MRixaKK2gAthBfItjBj3ebp+dZf3/2/XC
 uiZVGtEpoGhuAoehkHrViIJKrsJfwqIZqROSBNui2ix1QbsuCLgARi7mU
 JndD2HAmN0d/xXgrH3H5W6KQcgXDiho4dlGrR/uSGiKZy/mD6P8SzxvAC
 SleKiZNRj7zxl9Emo03R1tO8X1FCh396dl3CgkhZdtetUl3Cz6s0eYtUP g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10344"; a="332878751"
X-IronPort-AV: E=Sophos;i="5.91,218,1647327600"; d="scan'208";a="332878751"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2022 16:39:12 -0700
X-IronPort-AV: E=Sophos;i="5.91,218,1647327600"; d="scan'208";a="572290902"
Received: from wancheny-mobl.amr.corp.intel.com (HELO [10.209.114.21])
 ([10.209.114.21])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2022 16:39:11 -0700
Message-ID: <2b3ab214-0bcd-070a-f80a-5e0cf10cb339@linux.intel.com>
Date: Wed, 11 May 2022 16:39:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.7.0
Subject: Re: [PATCH v3] PCI/AER: Handle Multi UnCorrectable/Correctable errors
 properly
Content-Language: en-US
To: Bjorn Helgaas <helgaas@kernel.org>
References: <20220511232757.GA829078@bhelgaas>
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20220511232757.GA829078@bhelgaas>
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
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 Oliver OHalloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 5/11/22 4:27 PM, Bjorn Helgaas wrote:
>> [Eric: proposed reproducing steps]
>> Fixes: 4696b828ca37 ("PCI/AER: Hoist aerdrv.c, aer_inject.c up to drivers/pci/pcie/")
> 4696b828ca37 only*moves*  drivers/pci/pcie/aer/aerdrv.c to
> drivers/pci/pcie/aer.c, so I don't think it's related.
> 
> I think the actual change of interest is e167bfcaa4cd ("PCI: aerdrv:
> remove magical ROOT_ERR_STATUS_MASKS") [1].  It looks like we did
> exactly what you propose before that commit.
> 
> I can update this unless you disagree.
> 
> [1]https://git.kernel.org/linus/e167bfcaa4cd
> 

Agree. Please update it.

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer
